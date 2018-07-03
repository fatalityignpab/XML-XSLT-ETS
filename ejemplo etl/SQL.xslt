<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="//xbd">
        <xsl:for-each select="child::*/*">
            <xsl:choose>
                <xsl:when test="name()='disenio'">
                    <xsl:for-each select="child::*">
                        CREATE TABLE
                        <xsl:value-of select="name(.)">
                        </xsl:value-of>
                        (
                        <xsl:for-each select="child::*">
                            <xsl:value-of select="name(.)">
                            </xsl:value-of>
                            <xsl:choose>
                                <xsl:when test="(.)='entero'"> int </xsl:when>
                                <xsl:when test="(.)='texto'"> text </xsl:when>
                                <xsl:when test="(.)='logico'"> boolean </xsl:when>
                                <xsl:when test="(.)='decimal'"> double </xsl:when>
                                <xsl:when test="(.)='fecha'"> date </xsl:when>
                            </xsl:choose>
                            <xsl:if test="following-sibling::*">
                                ,
                            </xsl:if>
                        </xsl:for-each>
                        );
                        <br/>
                    </xsl:for-each>
                </xsl:when>
                <xsl:when test="name()='registros'">
                    <xsl:for-each select="child::*">
                        INSERT INTO
                        <xsl:value-of select="name(.)">
                        </xsl:value-of>
                        VALUES (
                        <xsl:for-each select="child::*">
                            <xsl:value-of select="(.)">
                            </xsl:value-of>
                            <xsl:if test="following-sibling::*">
                                ,
                            </xsl:if>
                        </xsl:for-each>
                        );
                        <br/>
                    </xsl:for-each>
                </xsl:when>
            </xsl:choose>
        </xsl:for-each>
        <br/>
    </xsl:template>
</xsl:stylesheet>