<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:str="http://exslt.org/strings" version="1.0">


	<!-- modifications made by Steven Hayes - Feb 26 - to integrate changes illustrated in   -->
	<xsl:param name="id"/>
	<xsl:param name="related_reftype_filter"/>
	<xsl:param name="flavour"/>

	<xsl:variable name="hbase">/h3</xsl:variable>
	<xsl:variable name="urlbase">/dos</xsl:variable>
	<xsl:variable name="cocoonbase">/cocoon/dos/browser</xsl:variable>

	<xsl:include href="author_editor.xsl"/>
	<xsl:include href="books-etc.xsl"/>
	<xsl:include href="factoid.xsl"/>
	<xsl:include href="historical_event.xsl"/>
	<xsl:include href="internet_bookmark.xsl"/>
	<xsl:include href="media.xsl"/>
	<xsl:include href="teidoc.xsl"/>
	<xsl:include href="teidoc_reference.xsl"/>
	<xsl:include href="entity.xsl"/>

	<xsl:variable name="currentid">
		<xsl:value-of select="export/references/reference/id"/>
	</xsl:variable>

	<xsl:template match="/">

		<html>
			<head>
				<title>
					<xsl:value-of select="export/references/reference/title"/>
				</title>
				<link rel="stylesheet" type="text/css" href="{$urlbase}/css/browser.css"/>
				<script src="/h3/hapi/hapiLoader.php"></script>
				<script>
					if (!HCurrentUser.isLoggedIn()) {
						window.location = '/h3/common/connect/login.php?last_uri=' + window.location;
					}
				</script>
				<script src="{$urlbase}/js/search.js"/>
				<script src="{$urlbase}/js/footnotes.js"/>
				<script>
					if (! top.HEURIST) {
						top.HEURIST = {};
					}
					top.HEURIST.fireEvent = function(e, e){};
				</script>
				<!--script src="http://dos.heuristscholar.org/heurist/php/js/heurist-obj-user.php"></script-->

			</head>
			<body pub_id="{/export/@pub_id}"  >



				<div id="header">
					<!--iframe
						src="{$cocoonbase}/breadcrumbs?flavour={$flavour}&amp;title={export/references/reference/title}&amp;url=http://heuristscholar.org{$cocoonbase}/item/{$id}/{$related_reftype_filter}%3Fflavour={$flavour}"
						style="width: 100%; height: 100%; border: none; overflow: visible;"
						frameborder="0" allowtransparency="true"/-->

					<div id="logo">
						<a href="{$urlbase}/index.html"><img src="{$urlbase}/images/logo.png" align="center"/></a>
					</div>


					<div id="pagetopcolour" class="colourcelltwo" style="overflow:visible;">
						<div style="padding-left:20px ">
							<!-- 2674 is ID of the "home page" file -->
							<xsl:if test="export/references/reference/reftype/@id = 98">
						    <table>
							<tr>
								<xsl:if test=" $id != 2674">
								<!--td style="font-size: 85%;padding-right:10px;">Add:</td-->
								<td style="font-size: 85%;padding-right:10px; "><a  href='#' onclick="window.open('{$urlbase}/edit-annotation.html?refid={export/references/reference/id}&amp;type=term','','status=0,scrollbars=1,resizable=1,width=800,height=600'); return false;" title="add Term"><img src='{$urlbase}/images/types/old/152.gif' align="absmiddle"/></a> Term</td>

									<td style="font-size: 85%;padding-right:10px;color: white;background-color: #658AAB; "><a  href='#' onclick="window.open('{$urlbase}/edit-annotation.html?refid={export/references/reference/id}&amp;type=multimedia','','status=0,scrollbars=1,resizable=1,width=800,height=600'); return false;" title="add Multimedia annotation"><img src='{$urlbase}/images/types/old/74.gif'  align="absmiddle"/></a>Multimedia</td>
									<td style="font-size: 85%;padding-right:10px; "><a  href='#' onclick="window.open('{$urlbase}/edit-annotation.html?refid={export/references/reference/id}&amp;type=hires','','status=0,scrollbars=1,resizable=1,width=800,height=600'); return false;" title="add HiRes annotation"><img src='{$urlbase}/images/types/old/74.gif'  align="absmiddle"/></a>Hi res</td>
									<td style="font-size: 85%;padding-right:10px; "><a  href='#' onclick="window.open('{$urlbase}/edit-annotation.html?refid={export/references/reference/id}&amp;type=map','','status=0,scrollbars=1,resizable=1,width=800,height=600'); return false;" title="add Map annotation"><img src='{$urlbase}/images/types/old/103.gif'  align="absmiddle"/></a>Map</td>

									<td style="font-size: 85%;padding-right:10px;color: white;background-color: #AB658A;" class="annotation entity"><a  href='#' onclick="window.open('{$urlbase}/edit-annotation.html?refid={export/references/reference/id}&amp;type=entity','','status=0,scrollbars=1,resizable=1,width=800,height=600'); return false;" title="add Entity"><img src='{$urlbase}/images/types/old/151.gif'  align="absmiddle"/></a> Entity</td>
									<td style="font-size: 85%;padding-right:10px; "><a  href='#' onclick="window.open('{$urlbase}/edit-annotation.html?refid={export/references/reference/id}&amp;type=text','','status=0,scrollbars=1,resizable=1,width=800,height=600'); return false;" title="add Text annotation"><img src='{$urlbase}/images/types/old/98.gif'  align="absmiddle"/></a> Text annotation</td>

									<td style="font-size: 85%;padding-right:10px;"><a  href='#' onclick="window.open('{$urlbase}/edit-annotation.html?refid={export/references/reference/id}&amp;type=glossary','','status=0,scrollbars=1,resizable=1,width=800,height=600'); return false;" title="add Glossary annotation"><img src='{$urlbase}/images/glossary1.gif'  align="absmiddle"/></a> Gloss</td>
								
									
									<td style="font-size: 85%;padding-right:10px;"><a  href='#' onclick="window.open('{$urlbase}/addrelationship.html?typeId=52&amp;source={export/references/reference/id}','','status=0,scrollbars=1,resizable=1,width=800,height=600'); return false;" title="add Relationship"><img src='{$urlbase}/images/types/old/52.gif'  align="absmiddle"/></a> Relationship</td>

								</xsl:if>
								<xsl:if test=" $id = 2674">
								<td><input type="text" id ="common-recordos-pretend-dropdown" readonly="readonly"/><img id ="common-recordos-drop-img" align="absmiddle"></img>
									<div id="common-recordos-drop-div" style="display:none;"></div>
									<script type="text/javascript" src="{$urlbase}/js/record-dropdown.js"></script>
								</td>
									</xsl:if>
							</tr>
						    </table>
							</xsl:if>
							<!-- Add relationship only needs to be available for Entities, Terms and Media -->
							<xsl:if test="export/references/reference/reftype/@id = 74 or export/references/reference/reftype/@id  = 151 or export/references/reference/reftype/@id  = 152 ">
								<table>
									<tr>
								<td style="font-size: 85%;padding-right:10px;"><a  href='#' onclick="window.open('{$urlbase}/addrelationship.html?typeId=52&amp;source={export/references/reference/id}','','status=0,scrollbars=1,resizable=1,width=800,height=600'); return false;" title="add Relationship"><img src='{$urlbase}/images/52.gif'  align="absmiddle"/></a> Relationship</td>
									</tr>
								</table>
							</xsl:if>
						</div>
					</div>
					<div id="sidebartopcolour" class="colourcelltwo">
					<table width="100%">
					<tr>
					<td id="login">
						<script type="text/javascript">

							var a = document.createElement("a");
							a.href = '/h3/common/connect/login.php?last_uri=' + window.location;

							if (HCurrentUser.isLoggedIn()) {
								document.getElementById("login").appendChild(document.createTextNode(HCurrentUser.getRealName() + " : "));
								a.appendChild( document.createTextNode("Log out"));
							} else {

								a.appendChild(document.createTextNode("Log in"));
							}

							document.getElementById("login").appendChild(a);

						</script>
						</td><td id="heurist-link"><a href="/h3">Heurist</a></td></tr>
						</table>
					</div>


				</div>

				<div id="sidebar" class="colourcellthree">

					<div id="sidebar-inner">

						<div id="search">
							<form  method="post" onsubmit="search(document.getElementById('query-input').value); return false;">
							<input type="text" id="query-input" value=""></input>
							<input type="button" value="search"
							onclick="search(document.getElementById('query-input').value);"/>
							</form>

							<div style="padding-left: 150px;">
								<a title="Coming soon" onclick="alert('Coming soon!');" href="#"> (Advanced)</a>
							</div>
						</div>



						<xsl:call-template name="related_items_section">
							<xsl:with-param name="items"
								select="export/references/reference/related |
																 export/references/reference/pointer |
																 export/references/reference/reverse-pointer"
							/>
						</xsl:call-template>
					</div>
				</div>

				<div id="page">
					<div id="page-inner">
						<h1>
							<!-- <xsl:value-of select="export/references/reference[1]/title"/> -->
							 <span style="padding-right:5px; vertical-align:top">
							 	<a  href="#" onclick="window.open('{$urlbase}/edit.html?id={export/references/reference/id}','','status=0,scrollbars=1,resizable=1,width=800,height=600'); return false; " title="Edit main record">
								 <img src="{$hbase}/common/images/edit-pencil.png"  style="vertical-align: top;"/></a>
							 </span>

							<xsl:value-of select="export/references/reference[1]/title"/>
						</h1>
						<!-- full version of record -->
						<xsl:apply-templates select="export/references/reference"/>
					</div>
				</div>

				<div id="footnotes">
					<div id="footnotes-inner">
						<xsl:apply-templates
							select="export/references/reference/reverse-pointer[reftype/@id=99]"
							mode="footnote"/>
					</div>
				</div>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="breadcrumbs">
		<xsl:for-each select="breadcrumb">
			<xsl:sort select="id"/>
			<a href="{url}">
				<xsl:value-of select="title"/>
			</a>
		</xsl:for-each>
	</xsl:template>

	<xsl:template name="related_items_section">
		<xsl:param name="items"/>

		<!-- top of sidebar before you start listing the type of relationships -->
		<table id = "relations-table"  cellpadding="2" border="0" width="100%">
			<!-- this step of the code aggregates related items into groupings based on the type of related item -->

			<xsl:for-each select="$items[not(@type = preceding-sibling::*/@type)] ">
				<xsl:choose>
					<xsl:when test="@type != 'Source entity reference' and @type != 'Entity reference' and @type != 'Target entity reference'">
						<xsl:call-template name="related_items_by_reltype">
							<xsl:with-param name="reftype_id" select="reftype/@id"/>
							<xsl:with-param name="reltype" select="@type"/>
							<xsl:with-param name="items" select="$items[@type = current()/@type and reftype/@id != 52]"/>
						</xsl:call-template>
					</xsl:when>
				</xsl:choose>
			</xsl:for-each>

		</table>
		<div id= "saved-searches">
			<div id = "saved-searches-header"></div>
			<script>
			if (HCurrentUser.isLoggedIn() &amp;&amp; top.HEURIST.user) {
				var savedSearches = top.HEURIST.user.workgroupSavedSearches["2"];
				document.getElementById("saved-searches-header").innerHTML = "Saved Searches";
				for (i in savedSearches) {
					var div = document.createElement("div");
					div.id = "saved-search-" + i;
					var a = document.createElement("a");
					a.href = "#";

					var regexS = "[\\?&amp;]q=([^&amp;#]*)";
					var regex = new RegExp( regexS );
					var results = regex.exec( savedSearches[i][1]);
					savedSearchesOnclick (a, results[1]);
					a.appendChild(document.createTextNode(savedSearches[i][0]));
					div.appendChild(a);
					document.getElementById("saved-searches").appendChild(div);

				}
			}
				function savedSearchesOnclick (e, res) {
					e.onclick = function() {
						document.getElementById('query-input').value = res;
						search (res);
					}
				}

			</script>
		</div>
	</xsl:template>


	<xsl:template name="related_items_by_reltype">
		<xsl:param name="reftype_id"/>
		<xsl:param name="reltype"/>
		<xsl:param name="items"/>

		<xsl:if test="count($items) > 0">
			<xsl:if test="$reftype_id != 150">
				<tr>
					<td>
						<b>
							<xsl:choose>
								<xsl:when test="$reftype_id = 99"
									>Annotations</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="$reltype"/>
									<xsl:value-of select="../@id"/>
									<!--(<xsl:value-of select="count($items)"/>) number of items with this relation -->
								</xsl:otherwise>
							</xsl:choose>
						</b>
					</td>
				</tr>

				<tr>
					<td>
						<!-- (<xsl:value-of select="$items[1]"/>) -->

						<table width="100%">

							<!-- p>id: <xsl:value-of select="$currentid"/> - [<xsl:value-of select="id"/>] - </p -->
							<xsl:apply-templates select="$items[1]">
								<xsl:with-param name="matches" select="$items"/>
							</xsl:apply-templates>
						</table>
					</td>
				</tr>
			</xsl:if>

		</xsl:if>

	</xsl:template>

	<xsl:template name="related_items">
		<xsl:param name="reftype_id"/>
		<xsl:param name="reftype_label"/>
		<xsl:param name="items"/>

		<xsl:if test="count($items) > 0">
			<xsl:if test="$reftype_id != 150">
				<tr>
					<td>
						<b>
							<a href="#" onclick="openRelated({$reftype_id}); return false;">
								<xsl:value-of select="$reftype_label"/>
								<!-- (<xsl:value-of select="count($items)"/>) -->
							</a>
						</b>
					</td>
				</tr>

				<tr name="related" reftype="{$reftype_id}">
					<xsl:if test="$reftype_id!=$related_reftype_filter">
						<xsl:attribute name="style">display: none;</xsl:attribute>
					</xsl:if>
					<td>

						<table width="100%">
							<xsl:apply-templates select="$items[1]">
								<xsl:with-param name="matches" select="$items"/>
							</xsl:apply-templates>
						</table>
					</td>
				</tr>
			</xsl:if>
		</xsl:if>

	</xsl:template>



	<xsl:template match="related | pointer | reverse-pointer">
		<!-- this is where the display work is done summarising the related items of various types - pictures, events etc -->
		<!-- reftype-specific templates take precedence over this one -->
		<xsl:param name="matches"/>

		<!-- trickiness!
		     First off, this template will catch a single related (/ pointer / reverse-pointer) record,
		     with the full list as a parameter ("matches").  This gives the template a chance to sort the records
		     and call itself with those sorted records
		-->
		<xsl:choose>
			<xsl:when test="$matches">
				<xsl:apply-templates select="$matches">
					<xsl:sort select="detail[@id=160]"/>

				</xsl:apply-templates>
			</xsl:when>
			<xsl:otherwise>

				<tr>
					<td>
						<xsl:if test="detail[@id = 222 or @id=223 or @id=224]">
							<xsl:if test="detail/file_thumb_url">
								<a href="{$cocoonbase}/item/{id}">

									<img src="{detail/file_thumb_url}"/>


								</a>
								<br/>

							</xsl:if>
						</xsl:if>
						<a href="{$urlbase}/edit.html?id={id}"
							onclick="window.open(this.href,'','status=0,scrollbars=1,resizable=1,width=800,height=600'); return false;"
							title="edit">
						<img src="{$hbase}/common/images/edit-pencil.png"/>
						</a>
						<a href="{$cocoonbase}/item/{id}" class="sb_two">
							<xsl:choose>
								<!-- related / notes -->
								<xsl:when test="@notes">
									<xsl:attribute name="title">
										<xsl:value-of select="@notes"/>
									</xsl:attribute>
								</xsl:when>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="detail[@id=160]">
									<xsl:value-of select="detail[@id=160]"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="title"/>
								</xsl:otherwise>
							</xsl:choose>
						</a>
					</td>
					<td align="right">
						<!-- change this to pick up the actuall system name of the reftye or to use the mapping method as in JHSB that calls human-readable-names.xml -->
						<img style="vertical-align: middle;horizontal-align: right"
							src="{$urlbase}/images/types/old/{reftype/@id}.gif"/>
					</td>
				</tr>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>



	<!-- fall-back template for any reference types that aren't already handled -->
	<xsl:template match="reference">
		<xsl:if test="detail[@id=221]">
			<img src="{$hbase}/common/php/resizeImage.php?ulf_ID={detail/file_id}&amp;w=400"/>
		</xsl:if>
		<table>
			<tr>
				<td colspan="2">
					<img style="vertical-align: middle;"
						src="{$urlbase}/images/types/old/{reftype/@id}.gif"/>
					<xsl:text> </xsl:text>
					<xsl:value-of select="reftype"/>
				</td>

			</tr>
			<xsl:if test="url != ''">
				<tr>
					<td style="padding-right: 10px;">URL</td>
					<td>
						<a href="{url}">
							<xsl:choose>
								<xsl:when test="string-length(url) &gt; 50">
									<xsl:value-of select="substring(url, 0, 50)"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="url"/>
								</xsl:otherwise>
							</xsl:choose>
						</a>
					</td>
				</tr>
			</xsl:if>

			<!-- this calls  ? -->
			<xsl:for-each select="detail[@id!=222 and @id!=223 and @id!=224]">
				<tr>
					<td style="padding-right: 10px;">
						<nobr>
							<xsl:choose>
								<xsl:when test="string-length(@name)">
									<xsl:value-of select="@name"/>
								</xsl:when>
								<xsl:otherwise>
									<xsl:value-of select="@type"/>
								</xsl:otherwise>
							</xsl:choose>
						</nobr>
					</td>
					<td>
						<xsl:choose>
							<!-- 268 = Contact details URL,  256 = Web links -->
							<xsl:when test="@id=268  or  @id=256  or  starts-with(text(), 'http')">
								<a href="{text()}">
									<xsl:choose>
										<xsl:when test="string-length() &gt; 50">
											<xsl:value-of select="substring(text(), 0, 50)"/>
										</xsl:when>
										<xsl:otherwise>
											<xsl:value-of select="text()"/>
										</xsl:otherwise>
									</xsl:choose>
								</a>
							</xsl:when>
							<!-- 221 = AssociatedFile,  231 = Associated File -->
							<xsl:when test="@id=221  or  @id=231">
								<a href="{file_fetch_url}">
									<xsl:value-of select="file_orig_name"/>
								</a>
							</xsl:when>
							<xsl:otherwise>
								<xsl:value-of select="text()"/>
							</xsl:otherwise>
						</xsl:choose>
					</td>
				</tr>
			</xsl:for-each>


			<tr>
				<td style="padding-right: 10px;">
					<xsl:value-of select="pointer[@id=264]/@name"/>
				</td>
				<td>
					<xsl:apply-templates select="pointer[@id=264]"/>

				</td>
			</tr>
			<tr>
				<td style="padding-right: 10px;">
					<xsl:value-of select="pointer[@id=267]/@name"/>
				</td>
				<td>

					<xsl:apply-templates select="pointer[@id=267]"/>
				</td>
			</tr>

			<xsl:if test="notes != ''">
				<tr>
					<td style="padding-right: 10px;">Notes</td>
					<td>
						<xsl:value-of select="notes"/>
					</td>
				</tr>
			</xsl:if>

			<xsl:if test="detail[@id=222 or @id=223 or @id=224]">
				<tr>
					<td style="padding-right: 10px;">Images</td>
					<td>
						<!-- 222 = Logo image,  223 = Thumbnail,  224 = Images -->
						<xsl:for-each select="detail[@id=222 or @id=223 or @id=224]">
							<a href="{file_fetch_url}">
								<img src="{file_thumb_url}" border="0"/>
							</a> &#160;&#160; </xsl:for-each>
					</td>
				</tr>
			</xsl:if>
		</table>
	</xsl:template>

	<xsl:template name="paragraphise">
		<xsl:param name="text"/>
		<xsl:for-each select="str:split($text, '&#xa;&#xa;')">
			<p>
				<xsl:value-of select="."/>
			</p>
		</xsl:for-each>
	</xsl:template>


</xsl:stylesheet>
