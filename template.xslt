<?xml version="1.0"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/main">
		<html>
			<head>
				<meta charset="utf-8"/>
				<title>
					<xsl:copy-of select="title/node()"/>
				</title>
				<link rel="stylesheet" href="/style.css"/>
			</head>
			<body>
				<h1><a href="/">Mallory's blog</a></h1>
				<xsl:copy-of select="body/node()"/>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
