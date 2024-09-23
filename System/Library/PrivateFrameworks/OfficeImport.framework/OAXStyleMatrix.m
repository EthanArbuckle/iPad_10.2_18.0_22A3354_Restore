@implementation OAXStyleMatrix

+ (void)readFromNode:(_xmlNode *)a3 toStyleMatrix:(id)a4 packagePart:(id)a5 drawingState:(id)a6
{
  id v9;
  id v10;
  void *v11;
  CXNamespace *v12;
  _xmlNode *v13;
  _xmlNode *i;
  void *v15;
  CXNamespace *v16;
  _xmlNode *v17;
  _xmlNode *j;
  void *v19;
  CXNamespace *v20;
  _xmlNode *v21;
  _xmlNode *k;
  CXNamespace *v23;
  uint64_t v24;
  void *v25;
  CXNamespace *v26;
  _xmlNode *v27;
  _xmlNode *m;
  void *v29;
  _xmlNode *v30;
  id v31;

  v31 = a4;
  v9 = a5;
  v10 = a6;
  CXDefaultStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"name", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setName:", v11);

  objc_msgSend(v10, "OAXMainNamespace");
  v12 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v13 = (_xmlNode *)OCXFindChild(a3, v12, "fillStyleLst");

  for (i = OCXFirstChild(v13); i; i = OCXNextSibling(i))
  {
    +[OAXFill readFillFromXmlNode:packagePart:drawingState:](OAXFill, "readFillFromXmlNode:packagePart:drawingState:", i, v9, v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      objc_msgSend(v31, "addFill:", v15);

  }
  objc_msgSend(v10, "OAXMainNamespace");
  v16 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v17 = (_xmlNode *)OCXFindChild(a3, v16, "lnStyleLst");

  for (j = OCXFirstChild(v17); j; j = OCXNextSibling(j))
  {
    if (j->type == XML_ELEMENT_NODE && xmlStrEqual(j->name, (const xmlChar *)"ln"))
    {
      +[OAXStroke readStrokeFromXmlNode:packagePart:drawingState:](OAXStroke, "readStrokeFromXmlNode:packagePart:drawingState:", j, v9, v10);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "addStroke:", v19);

    }
  }
  objc_msgSend(v10, "OAXMainNamespace");
  v20 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v21 = (_xmlNode *)OCXFindChild(a3, v20, "effectStyleLst");
  v30 = a3;

  for (k = OCXFirstChild(v21); k; k = OCXNextSibling(k))
  {
    if (k->type == XML_ELEMENT_NODE && xmlStrEqual(k->name, (const xmlChar *)"effectStyle"))
    {
      objc_msgSend(v10, "OAXMainNamespace", v30);
      v23 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v24 = OCXFindChild(k, v23, "effectLst");

      if (v24)
        +[OAXEffect readEffectsFromXmlNode:packagePart:drawingState:](OAXEffect, "readEffectsFromXmlNode:packagePart:drawingState:", v24, v9, v10);
      else
        objc_msgSend(MEMORY[0x24BDBCE30], "array");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "addEffects:", v25);

    }
  }
  objc_msgSend(v10, "OAXMainNamespace");
  v26 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v27 = (_xmlNode *)OCXFindChild(v30, v26, "bgFillStyleLst");

  for (m = OCXFirstChild(v27); m; m = OCXNextSibling(m))
  {
    +[OAXFill readFillFromXmlNode:packagePart:drawingState:](OAXFill, "readFillFromXmlNode:packagePart:drawingState:", m, v9, v10);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
      objc_msgSend(v31, "addBgFill:", v29);

  }
}

+ (id)readReferenceFromNode:(_xmlNode *)a3
{
  OADStyleMatrixReference *v4;
  void *v5;

  v4 = objc_alloc_init(OADStyleMatrixReference);
  -[OADStyleMatrixReference setMatrixIndex:](v4, "setMatrixIndex:", CXRequiredUnsignedLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"idx"));
  +[OAXColor readColorFromParentXmlNode:](OAXColor, "readColorFromParentXmlNode:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[OADStyleMatrixReference setColor:](v4, "setColor:", v5);

  return v4;
}

+ (BOOL)readReferenceFromParentNode:(_xmlNode *)a3 name:(const char *)a4 inNamespace:(id)a5 color:(id *)a6 index:(unsigned int *)a7
{
  CXNamespace *v11;
  _xmlNode *v12;
  _xmlNode *v13;
  id v14;

  v11 = (CXNamespace *)a5;
  v12 = (_xmlNode *)OCXFindChild(a3, v11, a4);
  v13 = v12;
  if (v12)
  {
    *a7 = CXRequiredUnsignedLongAttribute(v12, (CXNamespace *)CXNoNamespace, (xmlChar *)"idx");
    +[OAXColor readColorFromParentXmlNode:](OAXColor, "readColorFromParentXmlNode:", v13);
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
    *a7 = 0;
  }
  *a6 = v14;

  return v13 != 0;
}

@end
