<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="2.0" 
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:xs="http://www.w3.org/2001/XMLSchema"
  xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
  <xsl:template match="/">
    <html>
      <body>
        <h2>SVN Log</h2>
        <table border="1">
          <tr bgcolor="#9acd32">
            <th>Revision</th>
            <th>Author</th>            
            <th>Date</th> 
            <th>Message</th>
          </tr>
          <xsl:for-each select="log/logentry">
            <tr>
              <td>
                <xsl:value-of select="@revision" />
              </td>
              <td>
                <xsl:value-of select="author" />
              </td>
              <td>
              <xsl:variable name="in" select="'date'"/>                
                <xsl:value-of select="msxsl:format-date(date, 'MM-dd-yyyy ')"/>                
                <xsl:value-of select="msxsl:format-time(date, 'hh:mm')"/>                
              </td>
              <td>
                <xsl:value-of select="msg" />
              </td>              
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>