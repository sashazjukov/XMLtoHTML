using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;
using System.Xml.Xsl;

namespace XMLtoHTML
{
    class Program
    {
        static void Main(string[] args)
        {
            try
            {
                if (args.Count() != 3)
                {
                    Console.WriteLine("use: \"xml_test.xml\"  \"template.xslt\" \"output.html\"");
                    return;
                }
                TransformXMLToHTML(args[0], args[1], args[2]);
                Console.WriteLine("Done");
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex);
            }
            
        }

        public static void TransformXMLToHTML(string inputXml, string xsltString, string output)
        {
            XslCompiledTransform transform = new XslCompiledTransform();            
            using (XmlReader reader = XmlReader.Create(new StreamReader(xsltString)))
            {
                transform.Load(reader);
            }
            StringWriter results = new StringWriter();
            using (XmlReader reader = XmlReader.Create(new StreamReader(inputXml)))
            {
                transform.Transform(reader, null, results);
            }            
            using (StreamWriter outputFile = new StreamWriter(output))
            {
               outputFile.WriteLine(results);
            }            
        }
    }
}
