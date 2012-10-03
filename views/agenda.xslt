<?xml version="1.0" ?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:include href="includes/banshee.xslt" />

<!--
//
//  List template
//
//-->
<xsl:template match="list">
<div class="list">
<xsl:for-each select="appointment">
<div class="summary" onClick="javascript:$('.content{@id}').slideToggle('normal')">
<div class="title"><xsl:value-of select="title" /></div>
<div class="date"><xsl:value-of select="begin_date" /><xsl:if test="all_day='no'">, <xsl:value-of select="begin_time" /></xsl:if>
<xsl:if test="all_day='no' or begin_date!=end_date">
-
<xsl:value-of select="end_date" /><xsl:if test="all_day='no'">, <xsl:value-of select="end_time" /></xsl:if>
</xsl:if></div>
</div>

<div class="content content{@id}">
<xsl:value-of disable-output-escaping="yes" select="content" />
</div>
</xsl:for-each>
</div>

<input type="button" value="Back" onClick="javascript:document.location='/{/output/page}'" class="button" />
</xsl:template>

<!--
//
//  Month template
//
//-->
<xsl:template match="month">
<div class="extbox">
<div class="buttons">
<input type="button" value="List view" onClick="javascript:document.location='/{/output/page}/list'" class="button" />
<input type="button" value="Previous month" onClick="javascript:document.location='/{/output/page}/{prev}'" class="button" />
<input type="button" value="Current month" onClick="javascript:document.location='/{/output/page}/current'" class="button" />
<input type="button" value="Next month" onClick="javascript:document.location='/{/output/page}/{next}'" class="button" />
</div>

<h2><xsl:value-of select="@title" /></h2>
<table class="month" cellspacing="0">
<tr>
<xsl:for-each select="days_of_week/day">
<th><xsl:value-of select="." /></th>
</xsl:for-each>
</tr>
<xsl:for-each select="week">
	<tr class="week">
	<xsl:for-each select="day">
		<td class="day dow{@dow}{@today}">
			<div class="nr"><xsl:value-of select="@nr" /></div>
			<xsl:for-each select="appointment">
				<div class="appointment"><a href="/{/output/page}/{@id}"><xsl:value-of select="." /></a></div>
			</xsl:for-each>
		</td>
	</xsl:for-each>
	</tr>
</xsl:for-each>
</table>
</div>
</xsl:template>

<!--
//
//  Appointment template
//
//-->
<xsl:template match="appointment">
<div class="appointment">
<h2><xsl:value-of select="title" /></h2>
<h5><xsl:value-of select="begin_date" /><xsl:if test="all_day='no'">, <xsl:value-of select="begin_time" /></xsl:if>
<xsl:if test="all_day='no' or begin_date!=end_date">
-
<xsl:value-of select="end_date" /><xsl:if test="all_day='no'">, <xsl:value-of select="end_time" /></xsl:if>
</xsl:if>
</h5>
<xsl:value-of disable-output-escaping="yes" select="content" />
</div>

<input type="button" value="Back" onClick="javascript:document.location='/{/output/page}'" class="button" />
</xsl:template>

<!--
//
//  Content template
//
//-->
<xsl:template match="content">
<h1>Agenda</h1>
<xsl:apply-templates select="list" />
<xsl:apply-templates select="month" />
<xsl:apply-templates select="appointment" />
<xsl:apply-templates select="result" />
</xsl:template>

</xsl:stylesheet>
