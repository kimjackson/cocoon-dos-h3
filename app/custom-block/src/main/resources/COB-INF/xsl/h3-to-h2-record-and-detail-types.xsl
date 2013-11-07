<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

	<!-- identity transform -->
	<xsl:template match="@*|node()">
		<xsl:copy>
			<xsl:apply-templates select="@*|node()"/>
		</xsl:copy>
	</xsl:template>

    <xsl:template match="record/type">
        <xsl:variable name="id">
            <xsl:if test="@id='13'">98</xsl:if>
        </xsl:variable>
        <type id="{$id}" h3id="{@id}"><xsl:value-of select="."/></type>
    </xsl:template>

    <xsl:template match="record/detail">
        <xsl:variable name="id">
            <xsl:if test="@id='1'">160</xsl:if>
        </xsl:variable>
        <detail id="{$id}" h3id="{@id}" type="{@type}" name="{@name}"><xsl:apply-templates/></detail>
    </xsl:template>

</xsl:stylesheet>
