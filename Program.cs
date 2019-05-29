using System;
using Microsoft.Spark.Sql;

namespace SparkDotNet
{
    class Program
    {
        static void Main(string[] args)
        {
            var file = args[0];            
            Console.WriteLine("Reading file from:" + file);

            // Create Spark context
            var spark = SparkSession.Builder()                    
                .Master("local[*]")                
                .AppName("SparkDotNet")
                .GetOrCreate();
            
            // Read csv file
            var df = spark.Read()
                .Option("sep", "\t")
                .Option("header", "true")
                .Option("inferSchema", "true")
                .Csv(file);

            // Show schema and some rows
            df.PrintSchema();
            df.Show();            

            // Register as a table
            df.CreateOrReplaceTempView("nyse");
            spark.Sql("SELECT `stock_symbol`, AVG(`stock_price_open`) FROM nyse GROUP BY 1").Show();
        }
    }
}
