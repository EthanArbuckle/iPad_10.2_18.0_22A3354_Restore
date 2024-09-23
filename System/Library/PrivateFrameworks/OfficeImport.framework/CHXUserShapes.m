@implementation CHXUserShapes

+ (void)readFromCharSpaceNode:(_xmlNode *)a3 state:(id)a4
{
  void *v6;
  CXNamespace *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  xmlNodePtr v15;
  _xmlNode *v16;
  CHXDrawingState *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _xmlNode *i;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v28 = a4;
  objc_msgSend(v28, "drawingState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "OAXChartNamespace");
  v7 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v8 = OCXFindChild(a3, v7, "userShapes");

  if (!v8)
    goto LABEL_18;
  objc_msgSend(v28, "chartPart");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "drawingState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "OCXReadRelationshipForNode:packagePart:", v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "package");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "targetLocation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "partForLocation:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
    goto LABEL_17;
  v15 = OCXGetRootElement((_xmlDoc *)objc_msgSend(v14, "xmlDocument"));
  v16 = v15;
  if (!v15 || !xmlStrEqual(v15->name, (const xmlChar *)"userShapes"))
  {
    objc_msgSend(v9, "package");
    v17 = (CHXDrawingState *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "targetLocation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[CHXDrawingState resetPartForLocation:](v17, "resetPartForLocation:", v26);
    goto LABEL_16;
  }
  v17 = -[CHXDrawingState initWithCHXState:]([CHXDrawingState alloc], "initWithCHXState:", v28);
  -[OAXDrawingState setPackagePart:](v17, "setPackagePart:", v14);
  objc_msgSend(v28, "drawingState");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "styleMatrix");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[OAXDrawingState setStyleMatrix:](v17, "setStyleMatrix:", v19);

  objc_msgSend(v28, "drawingState");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "targetBlipCollection");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[OAXDrawingState setTargetBlipCollection:](v17, "setTargetBlipCollection:", v21);

  for (i = OCXFirstChild(v16); i; i = OCXNextSibling(i))
  {
    if (xmlStrEqual(i->name, (const xmlChar *)"relSizeAnchor"))
    {
      objc_msgSend(a1, "readRelativeSizeAnchor:drawingState:", i, v17);
      v23 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!xmlStrEqual(i->name, (const xmlChar *)"absSizeAnchor"))
        continue;
      objc_msgSend(a1, "readAbsoluteSizeAnchor:drawingState:", i, v17);
      v23 = objc_claimAutoreleasedReturnValue();
    }
    v24 = (void *)v23;
    if (v23)
    {
      objc_msgSend(v28, "chart");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addChild:", v24);

    }
  }
  objc_msgSend(v9, "package");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "targetLocation");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "resetPartForLocation:", v27);

LABEL_16:
LABEL_17:

LABEL_18:
}

+ (id)readRelativeSizeAnchor:(_xmlNode *)a3 drawingState:(id)a4
{
  id v6;
  _xmlNode *v7;
  _xmlNode *v8;
  _xmlNode *v9;
  _xmlNode *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CHDRelativeSizeAnchor *v19;

  v6 = a4;
  v7 = OCXFirstChild(a3);
  v8 = 0;
  v9 = 0;
  v10 = 0;
  while (v7)
  {
    if (xmlStrEqual(v7->name, (const xmlChar *)"from"))
    {
      v10 = v7;
    }
    else if (xmlStrEqual(v7->name, (const xmlChar *)"to"))
    {
      v9 = v7;
    }
    else
    {
      v8 = v7;
    }
    v7 = OCXNextSibling(v7);
  }
  if (v10 && v9 && v8)
  {
    objc_msgSend(a1, "readRealPoint:", v10);
    v12 = v11;
    v14 = v13;
    objc_msgSend(a1, "readRealPoint:", v9);
    v16 = v15;
    v18 = v17;
    v19 = objc_alloc_init(CHDRelativeSizeAnchor);
    -[CHDRelativeSizeAnchor setFrom:](v19, "setFrom:", v12, v14);
    -[CHDRelativeSizeAnchor setTo:](v19, "setTo:", v16, v18);
    objc_msgSend(a1, "readDrawable:anchor:drawingState:", v8, v19, v6);
    v7 = (_xmlNode *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

+ (CGPoint)readRealPoint:(_xmlNode *)a3
{
  float v5;
  float v6;
  float v7;
  double v8;
  double v9;
  CGPoint result;

  objc_msgSend(a1, "readRealCoordinate:", OCXFirstChildNamed(a3, (xmlChar *)"x"));
  v6 = v5;
  objc_msgSend(a1, "readRealCoordinate:", OCXFirstChildNamed(a3, (xmlChar *)"y"));
  v8 = v7;
  v9 = v6;
  result.y = v8;
  result.x = v9;
  return result;
}

+ (float)readRealCoordinate:(_xmlNode *)a3
{
  void *v3;
  float v4;
  float v5;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "tc_initWithContentOfXmlNode:", a3);
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

+ (id)readDrawable:(_xmlNode *)a3 anchor:(id)a4 drawingState:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  CHDOfficeArtClient *v11;

  v7 = a4;
  v8 = a5;
  objc_msgSend(v8, "OAXChartDrawingNamespace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[OAXDrawable readDrawableFromXmlNode:inNamespace:drawingState:](OAXDrawable, "readDrawableFromXmlNode:inNamespace:drawingState:", a3, v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = objc_alloc_init(CHDOfficeArtClient);
    -[CHDOfficeArtClient setAnchor:](v11, "setAnchor:", v7);
    objc_msgSend(v10, "setClientData:", v11);

  }
  return v10;
}

+ (id)readAbsoluteSizeAnchor:(_xmlNode *)a3 drawingState:(id)a4
{
  id v6;
  _xmlNode *v7;
  _xmlNode *v8;
  _xmlNode *v9;
  _xmlNode *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CHDAbsoluteSizeAnchor *v19;

  v6 = a4;
  v7 = OCXFirstChild(a3);
  v8 = 0;
  v9 = 0;
  v10 = 0;
  while (v7)
  {
    if (xmlStrEqual(v7->name, (const xmlChar *)"from"))
    {
      v10 = v7;
    }
    else if (xmlStrEqual(v7->name, (const xmlChar *)"ext"))
    {
      v9 = v7;
    }
    else
    {
      v8 = v7;
    }
    v7 = OCXNextSibling(v7);
  }
  if (v10 && v9 && v8)
  {
    objc_msgSend(a1, "readRealPoint:", v10);
    v12 = v11;
    v14 = v13;
    +[OAXBaseTypes readSize2DFromXmlNode:](OAXBaseTypes, "readSize2DFromXmlNode:", v9);
    v16 = v15;
    v18 = v17;
    v19 = objc_alloc_init(CHDAbsoluteSizeAnchor);
    -[CHDAbsoluteSizeAnchor setFrom:](v19, "setFrom:", v12, v14);
    -[CHDAbsoluteSizeAnchor setSize:](v19, "setSize:", v16, v18);
    objc_msgSend(a1, "readDrawable:anchor:drawingState:", v8, v19, v6);
    v7 = (_xmlNode *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

@end
