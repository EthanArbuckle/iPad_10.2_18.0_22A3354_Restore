@implementation OAXGeometry

+ (int)shapeTypeForString:(id)a3
{
  id v4;
  void *v5;
  int v6;

  v4 = a3;
  objc_msgSend(a1, "shapeTypeEnumMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "valueForString:", v4);

  return v6;
}

+ (id)shapeTypeEnumMap
{
  if (+[OAXGeometry(Private) shapeTypeEnumMap]::once != -1)
    dispatch_once(&+[OAXGeometry(Private) shapeTypeEnumMap]::once, &__block_literal_global_49);
  return (id)+[OAXGeometry(Private) shapeTypeEnumMap]::shapeTypeEnumMap;
}

+ (id)formulaTypeEnumMap
{
  if (+[OAXGeometry(Private) formulaTypeEnumMap]::once != -1)
    dispatch_once(&+[OAXGeometry(Private) formulaTypeEnumMap]::once, &__block_literal_global_509);
  return (id)+[OAXGeometry(Private) formulaTypeEnumMap]::formulaTypeEnumMap;
}

+ (id)formulaKeywordEnumMap
{
  if (+[OAXGeometry(Private) formulaKeywordEnumMap]::once != -1)
    dispatch_once(&+[OAXGeometry(Private) formulaKeywordEnumMap]::once, &__block_literal_global_543);
  return (id)+[OAXGeometry(Private) formulaKeywordEnumMap]::formulaKeywordEnumMap;
}

+ (OADAdjustCoord)readAdjustCoordFromXmlNode:(_xmlNode *)a3 name:(const char *)a4 formulaNameToIndexMap:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _xmlAttr *v11;
  OADAdjustCoord v12;

  v7 = a5;
  CXRequiredStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    v11 = (_xmlAttr *)objc_msgSend(v9, "unsignedIntValue");
  else
    v11 = CXRequiredLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)a4, 12);
  v12 = (OADAdjustCoord)((v10 != 0) | ((_QWORD)v11 << 32));

  return v12;
}

+ (int)adjustValueWithGuideXmlNode:(_xmlNode *)a3
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  int v8;

  CXRequiredStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"fmla");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tc_componentsSeparatedByWhitespace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") != 2)
    +[TCMessageException raise:](TCMessageException, "raise:", OABadFormat);
  objc_msgSend(v4, "objectAtIndex:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("val"));

  if ((v6 & 1) == 0)
    +[TCMessageException raise:](TCMessageException, "raise:", OABadFormat);
  objc_msgSend(v4, "objectAtIndex:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "intValue");

  return v8;
}

+ (id)stringForShapeType:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;

  if (a3)
  {
    v3 = *(_QWORD *)&a3;
    objc_msgSend(a1, "shapeTypeEnumMap");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringForValue:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)pathFillModeEnumMap
{
  if (+[OAXGeometry(Private) pathFillModeEnumMap]::once != -1)
    dispatch_once(&+[OAXGeometry(Private) pathFillModeEnumMap]::once, &__block_literal_global_545);
  return (id)+[OAXGeometry(Private) pathFillModeEnumMap]::pathFillModeEnumMap;
}

+ (id)readFromParentXmlNode:(_xmlNode *)a3 drawingState:(id)a4
{
  id v6;
  CXNamespace *v7;
  uint64_t v8;
  uint64_t v9;
  CXNamespace *v10;
  uint64_t v11;
  void *v12;

  v6 = a4;
  objc_msgSend(v6, "OAXMainNamespace");
  v7 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v8 = OCXFindChild(a3, v7, "prstGeom");

  if (v8)
  {
    objc_msgSend(a1, "readPresetGeometryFromXmlNode:drawingState:", v8, v6);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "OAXMainNamespace");
    v10 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v11 = OCXFindChild(a3, v10, "custGeom");

    if (!v11)
    {
      v12 = 0;
      goto LABEL_6;
    }
    objc_msgSend(a1, "readCustomGeometryFromXmlNode:hasImplicitFormulas:drawingState:", v11, 0, v6);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (void *)v9;
LABEL_6:

  return v12;
}

+ (id)readCustomGeometryFromXmlNode:(_xmlNode *)a3 hasImplicitFormulas:(BOOL)a4 drawingState:(id)a5
{
  _BOOL4 v5;
  id v8;
  OADCustomShapeGeometry *v9;
  id v10;
  id v11;

  v5 = a4;
  v8 = a5;
  v9 = objc_alloc_init(OADCustomShapeGeometry);
  -[OADShapeGeometry setIsEscher:](v9, "setIsEscher:", 0);
  v10 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(a1, "readAdjustValuesFromCustomGeometryXmlNode:toCustomGeometry:adjustValueNameToIndexMap:drawingState:", a3, v9, v10, v8);
  v11 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(a1, "addFormulasFromFile:toCustomGeometry:formulaNameToIndexMap:drawingState:", CFSTR("_KeywordFormulas"), v9, v11, v8);
  if (v5)
    objc_msgSend(a1, "addFormulasFromFile:toCustomGeometry:formulaNameToIndexMap:drawingState:", CFSTR("_ImplicitFormulas"), v9, v11, v8);
  objc_msgSend(a1, "readFormulasFromCustomGeometryXmlNode:toCustomGeometry:adjustValueNameToIndexMap:formulaNameToIndexMap:drawingState:", a3, v9, v10, v11, v8);
  objc_msgSend(a1, "readTextRectFromCustomGeometryXmlNode:toCustomGeometry:formulaNameToIndexMap:drawingState:", a3, v9, v11, v8);
  objc_msgSend(a1, "readPathsFromCustomGeometryXmlNode:toCustomGeometry:formulaNameToIndexMap:drawingState:", a3, v9, v11, v8);

  return v9;
}

+ (void)write:(id)a3 to:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  int v10;
  unint64_t i;
  void *v12;
  _xmlDoc *v13;
  OAXDrawingState *v14;
  _xmlNode *v15;
  CXNamespace *v16;
  _xmlNode *v17;
  CXNamespace *v18;
  _xmlNode *Child;
  uint64_t v20;
  int v21;
  id v22;
  void *v23;
  void *v24;
  CXNamespace *v25;
  void *v26;
  void *v27;
  id v28;
  _OWORD v29[2];

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v28 = v6;
      v8 = v6;
      objc_msgSend(v8, "geometryCoordSpace");
      objc_msgSend(v7, "startOAElement:", CFSTR("custGeom"));
      objc_msgSend(v7, "startOAElement:", CFSTR("avLst"));
      objc_msgSend(v7, "endElement");
      objc_msgSend(v7, "startOAElement:", CFSTR("gdLst"));
      objc_msgSend(v7, "endElement");
      objc_msgSend(v7, "startOAElement:", CFSTR("ahLst"));
      objc_msgSend(v7, "endElement");
      objc_msgSend(v7, "startOAElement:", CFSTR("cxnLst"));
      v9 = 0;
      v10 = 4;
      do
      {
        objc_msgSend(v7, "startOAElement:", CFSTR("cxn"));
        objc_msgSend(v7, "writeOAAttribute:intContent:", CFSTR("ang"), v9);
        objc_msgSend(v7, "startOAElement:", CFSTR("pos"));
        objc_msgSend(v7, "writeOAAttribute:content:", CFSTR("x"), CFSTR("wd2"));
        objc_msgSend(v7, "writeOAAttribute:content:", CFSTR("y"), CFSTR("hd2"));
        objc_msgSend(v7, "endElement");
        objc_msgSend(v7, "endElement");
        v9 += 5400000;
        --v10;
      }
      while (v10);
      objc_msgSend(v7, "endElement");
      objc_msgSend(v7, "startOAElement:", CFSTR("rect"));
      objc_msgSend(v7, "writeOAAttribute:intContent:", CFSTR("l"), 0);
      objc_msgSend(v7, "writeOAAttribute:intContent:", CFSTR("t"), 0);
      objc_msgSend(v7, "writeOAAttribute:content:", CFSTR("r"), CFSTR("r"));
      objc_msgSend(v7, "writeOAAttribute:content:", CFSTR("b"), CFSTR("b"));
      objc_msgSend(v7, "endElement");
      objc_msgSend(v7, "startOAElement:", CFSTR("pathLst"));
      for (i = 0; i < objc_msgSend(v8, "pathCount"); ++i)
      {
        objc_msgSend(v8, "pathAtIndex:", i);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v29[0] = v29[1];
        objc_msgSend(a1, "writePath:coordSpace:to:", v12, v29, v7);

      }
      objc_msgSend(v7, "endElement");
      objc_msgSend(v7, "endElement");
LABEL_21:

      v6 = v28;
      goto LABEL_22;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v28 = v6;
      v8 = v6;
      objc_msgSend(v7, "startOAElement:", CFSTR("prstGeom"));
      objc_msgSend(a1, "stringWritingShapeType:", objc_msgSend(v8, "type"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "writeOAAttribute:content:", CFSTR("prst"), v27);
      objc_msgSend(v7, "startOAElement:", CFSTR("avLst"));
      if (objc_msgSend(v8, "adjustValueCount"))
      {
        +[TCBundleResourceManager instance](TCBundleResourceManager, "instance");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (_xmlDoc *)objc_msgSend(v26, "xmlDocumentForResource:ofType:inPackage:", v27, CFSTR("xml"), CFSTR("OAShapeTypes"));
        if (v13)
        {
          v14 = -[OAXDrawingState initWithClient:]([OAXDrawingState alloc], "initWithClient:", 0);
          v15 = OCXGetRootElement(v13);
          -[OAXDrawingState OAXMainNamespace](v14, "OAXMainNamespace");
          v16 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
          v17 = (_xmlNode *)OCXFindChild(v15, v16, "avLst");

          if (v17)
          {
            -[OAXDrawingState OAXMainNamespace](v14, "OAXMainNamespace");
            v18 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
            Child = (_xmlNode *)OCXFindChild(v17, v18, "gd");

            if (Child)
            {
              v20 = 0;
              do
              {
                v21 = objc_msgSend(a1, "adjustValueWithGuideXmlNode:", Child);
                if (objc_msgSend(v8, "hasAdjustValueAtIndex:", v20))
                  v21 = objc_msgSend(v8, "adjustValueAtIndex:", v20);
                v22 = a1;
                CXRequiredStringAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"name");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "startOAElement:", CFSTR("gd"));
                objc_msgSend(v7, "writeOAAttribute:content:", CFSTR("name"), v23);
                objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("val %ld"), v21);
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "writeOAAttribute:content:", CFSTR("fmla"), v24);

                objc_msgSend(v7, "endElement");
                -[OAXDrawingState OAXMainNamespace](v14, "OAXMainNamespace");
                v25 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
                Child = OCXFindNextChild(Child, v25, (xmlChar *)"gd");

                v20 = (v20 + 1);
                a1 = v22;
              }
              while (Child);
            }
          }

        }
      }
      objc_msgSend(v7, "endElement");
      objc_msgSend(v7, "endElement");

      goto LABEL_21;
    }
  }
LABEL_22:

}

+ (id)stringWritingShapeType:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  __CFString *v5;

  if (a3 == 202)
  {
    v5 = CFSTR("rect");
  }
  else
  {
    +[OAXGeometry stringForShapeType:](OAXGeometry, "stringForShapeType:", v3, v4);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

+ (id)readPresetGeometryFromXmlNode:(_xmlNode *)a3 drawingState:(id)a4
{
  id v6;
  void *v7;
  OADPresetShapeGeometry *v8;
  CXNamespace *v9;
  _xmlNode *v10;
  CXNamespace *v11;
  _xmlNode *Child;
  uint64_t v13;
  CXNamespace *v14;

  v6 = a4;
  CXRequiredStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"prst");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = objc_alloc_init(OADPresetShapeGeometry);
    -[OADPresetShapeGeometry setType:](v8, "setType:", objc_msgSend(a1, "shapeTypeForString:", v7));
    objc_msgSend(v6, "OAXMainNamespace");
    v9 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v10 = (_xmlNode *)OCXFindChild(a3, v9, "avLst");

    if (v10)
    {
      objc_msgSend(v6, "OAXMainNamespace");
      v11 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      Child = (_xmlNode *)OCXFindChild(v10, v11, "gd");

      if (Child)
      {
        v13 = 0;
        do
        {
          -[OADShapeGeometry setAdjustValue:atIndex:](v8, "setAdjustValue:atIndex:", objc_msgSend(a1, "adjustValueWithGuideXmlNode:", Child), v13);
          objc_msgSend(v6, "OAXMainNamespace");
          v14 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
          Child = OCXFindNextChild(Child, v14, (xmlChar *)"gd");

          v13 = (v13 + 1);
        }
        while (Child);
      }
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (void)readAdjustValuesFromCustomGeometryXmlNode:(_xmlNode *)a3 toCustomGeometry:(id)a4 adjustValueNameToIndexMap:(id)a5 drawingState:(id)a6
{
  id v10;
  id v11;
  CXNamespace *v12;
  _xmlNode *v13;
  CXNamespace *v14;
  _xmlNode *Child;
  uint64_t v16;
  void *v17;
  void *v18;
  CXNamespace *v19;
  id v20;

  v20 = a4;
  v10 = a5;
  v11 = a6;
  objc_msgSend(v11, "OAXMainNamespace");
  v12 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v13 = (_xmlNode *)OCXFindChild(a3, v12, "avLst");

  if (v13)
  {
    objc_msgSend(v11, "OAXMainNamespace");
    v14 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    Child = (_xmlNode *)OCXFindChild(v13, v14, "gd");

    if (Child)
    {
      v16 = 0;
      do
      {
        objc_msgSend(v20, "setAdjustValue:atIndex:", objc_msgSend(a1, "adjustValueWithGuideXmlNode:", Child), v16);
        CXRequiredStringAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"name");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v16);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKey:", v18, v17);

        objc_msgSend(v11, "OAXMainNamespace");
        v19 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
        Child = OCXFindNextChild(Child, v19, (xmlChar *)"gd");

        v16 = (v16 + 1);
      }
      while (Child);
    }
  }

}

+ (void)readFormulasFromCustomGeometryXmlNode:(_xmlNode *)a3 toCustomGeometry:(id)a4 adjustValueNameToIndexMap:(id)a5 formulaNameToIndexMap:(id)a6 drawingState:(id)a7
{
  id v11;
  CXNamespace *v12;
  _xmlNode *v13;
  uint64_t v14;
  CXNamespace *v15;
  _xmlNode *Child;
  void *v17;
  int v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  unsigned int v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  OADFormula *v37;
  OADFormula *v38;
  void *v39;
  void *v40;
  CXNamespace *v41;
  id v42;
  id v43;
  uint64_t v44;
  _xmlNode *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v42 = a4;
  v50 = a5;
  v11 = a6;
  v43 = a7;
  objc_msgSend(v43, "OAXMainNamespace");
  v12 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v13 = (_xmlNode *)OCXFindChild(a3, v12, "gdLst");

  if (v13)
  {
    v14 = objc_msgSend(v11, "count");
    objc_msgSend(v43, "OAXMainNamespace");
    v15 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    Child = (_xmlNode *)OCXFindChild(v13, v15, "gd");

    if (Child)
    {
      while (1)
      {
        CXRequiredStringAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"fmla");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "tc_componentsSeparatedByWhitespace");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "count");
        if (v18 - 1 <= 1)
          v19 = 1;
        else
          v19 = v18 - 1;
        if (v19 >= 3)
          v19 = 3;
        if ((v18 - 2) >= 3)
          v20 = v19;
        else
          v20 = (v18 - 1);
        objc_msgSend(v17, "firstObject");
        v21 = objc_claimAutoreleasedReturnValue();
        v45 = Child;
        v46 = v14;
        if (!v21)
          +[TCMessageException raise:](TCMessageException, "raise:", OABadFormat);
        objc_msgSend(a1, "formulaTypeEnumMap");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "valueForString:", v21);

        v44 = v23;
        if ((_DWORD)v23 == -130883970)
          +[TCMessageException raise:](TCMessageException, "raise:", OABadFormat);
        v47 = (void *)v21;
        v51 = 0;
        v52 = 0;
        v53 = 0;
        if ((int)v20 >= 1)
          break;
LABEL_31:
        v37 = [OADFormula alloc];
        v38 = -[OADFormula initWithType:arg0:arg1:arg2:](v37, "initWithType:arg0:arg1:arg2:", v44, v51, v52, v53);
        objc_msgSend(v42, "addFormula:", v38);
        CXRequiredStringAttribute(v45, (CXNamespace *)CXNoNamespace, (xmlChar *)"name");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v46);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKey:", v40, v39);

        -[OADFormula setName:](v38, "setName:", v39);
        objc_msgSend(v43, "OAXMainNamespace");
        v41 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
        Child = OCXFindNextChild(v45, v41, (xmlChar *)"gd");
        v14 = (v46 + 1);

        if (!Child)
          goto LABEL_32;
      }
      v24 = 0;
      while (1)
      {
        v25 = v24 + 1;
        objc_msgSend(v17, "objectAtIndex:", v24 + 1);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "characterAtIndex:", 0);
        objc_msgSend(v11, "objectForKey:", v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
          break;
        objc_msgSend(v50, "objectForKey:", v26);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (v32)
        {
          objc_msgSend(v50, "objectForKey:", v26);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v33, "unsignedLongValue");

          v31 = 2;
          goto LABEL_29;
        }
        objc_msgSend(a1, "formulaKeywordEnumMap");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "valueForString:", v26);

        if (v35 != -130883970)
        {
          objc_msgSend(a1, "formulaKeywordEnumMap");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v36, "valueForString:", v26);

          v31 = 4;
          goto LABEL_29;
        }
        if (v27 <= 0xFF && ((*(_DWORD *)(MEMORY[0x24BDAC740] + 4 * v27 + 60) >> 10) & 1) != 0 || v27 == 45)
        {
          v30 = objc_msgSend(v26, "intValue");
          v31 = 1;
          goto LABEL_29;
        }
        +[TCMessageException raise:](TCMessageException, "raise:", OABadFormat);
LABEL_30:

        ++v24;
        if (v20 == v25)
          goto LABEL_31;
      }
      objc_msgSend(v11, "objectForKey:", v26);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "unsignedLongValue");

      v31 = 3;
LABEL_29:
      *(&v51 + v24) = v31 | (v30 << 32);
      goto LABEL_30;
    }
  }
LABEL_32:

}

+ (void)addFormulasFromFile:(id)a3 toCustomGeometry:(id)a4 formulaNameToIndexMap:(id)a5 drawingState:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  _xmlDoc *v14;
  id v15;

  v15 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  +[TCBundleResourceManager instance](TCBundleResourceManager, "instance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (_xmlDoc *)objc_msgSend(v13, "xmlDocumentForResource:ofType:inPackage:", v15, CFSTR("xml"), CFSTR("OAShapeTypes"));
  if (!v14)
  {
    +[TCMessageException raise:](TCMessageException, "raise:", OABadFormat);
    v14 = 0;
  }
  objc_msgSend(a1, "readFormulasFromCustomGeometryXmlNode:toCustomGeometry:adjustValueNameToIndexMap:formulaNameToIndexMap:drawingState:", OCXGetRootElement(v14), v10, 0, v11, v12);

}

+ (void)readTextRectFromCustomGeometryXmlNode:(_xmlNode *)a3 toCustomGeometry:(id)a4 formulaNameToIndexMap:(id)a5 drawingState:(id)a6
{
  id v10;
  CXNamespace *v11;
  uint64_t v12;
  OADAdjustRect *v13;
  id v14;

  v14 = a4;
  v10 = a5;
  objc_msgSend(a6, "OAXMainNamespace");
  v11 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v12 = OCXFindChild(a3, v11, "rect");

  if (v12)
  {
    v13 = -[OADAdjustRect initWithLeft:top:right:bottom:]([OADAdjustRect alloc], "initWithLeft:top:right:bottom:", objc_msgSend(a1, "readAdjustCoordFromXmlNode:name:formulaNameToIndexMap:", v12, "l", v10), objc_msgSend(a1, "readAdjustCoordFromXmlNode:name:formulaNameToIndexMap:", v12, "t", v10), objc_msgSend(a1, "readAdjustCoordFromXmlNode:name:formulaNameToIndexMap:", v12, "r", v10), objc_msgSend(a1, "readAdjustCoordFromXmlNode:name:formulaNameToIndexMap:", v12, "b", v10));
    objc_msgSend(v14, "addTextBodyRect:", v13);

  }
}

+ (void)readPathsFromCustomGeometryXmlNode:(_xmlNode *)a3 toCustomGeometry:(id)a4 formulaNameToIndexMap:(id)a5 drawingState:(id)a6
{
  id v10;
  id v11;
  CXNamespace *v12;
  _xmlNode *v13;
  CXNamespace *v14;
  uint64_t v15;
  int v16;
  void *v17;
  uint64_t v18;
  _xmlNode *i;
  CXNamespace *v20;
  _xmlNode *Child;
  unint64_t v22;
  uint64_t *v23;
  CXNamespace *v24;
  int v25;
  OADClosePathElement *v27;
  __objc2_class **v28;
  id v29;
  OADClosePathElement *v30;
  OADCubicBezierToPathElement *v31;
  OADQuadBezierToPathElement *v32;
  CXNamespace *v33;
  _xmlNode *v34;
  id v35;
  void *v36;
  _xmlNode *v37;
  OADPath *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v35 = a4;
  v10 = a5;
  v11 = a6;
  objc_msgSend(v11, "OAXMainNamespace");
  v12 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v13 = (_xmlNode *)OCXFindChild(a3, v12, "pathLst");

  if (v13)
  {
    objc_msgSend(v11, "OAXMainNamespace");
    v14 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v15 = OCXFindChild(v13, v14, "path");

    v37 = (_xmlNode *)v15;
    if (v15)
    {
      do
      {
        v38 = objc_alloc_init(OADPath);
        v16 = CXDefaultLongAttribute(v37, (CXNamespace *)CXNoNamespace, (xmlChar *)"w", 0);
        -[OADPath setSize:](v38, "setSize:", (double)v16, (double)(int)CXDefaultLongAttribute(v37, (CXNamespace *)CXNoNamespace, (xmlChar *)"h", 0));
        CXDefaultStringAttribute(v37, (CXNamespace *)CXNoNamespace, (xmlChar *)"fill", 0);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (v36)
        {
          objc_msgSend(a1, "pathFillModeEnumMap");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "valueForString:", v36);

          -[OADPath setFillMode:](v38, "setFillMode:", v18);
        }
        -[OADPath setStroked:](v38, "setStroked:", CXDefaultBoolAttribute(v37, (CXNamespace *)CXNoNamespace, (xmlChar *)"stroke", 1));
        for (i = OCXFirstChild(v37); i; i = OCXNextSibling(i))
        {
          if (i->type != XML_ELEMENT_NODE)
            continue;
          objc_msgSend(v11, "OAXMainNamespace");
          v20 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
          Child = (_xmlNode *)OCXFindChild(i, v20, "pt");

          if (Child)
          {
            v22 = 0;
            v23 = &v40;
            do
            {
              *(v23 - 1) = objc_msgSend(a1, "readAdjustCoordFromXmlNode:name:formulaNameToIndexMap:", Child, "x", v10, v35);
              *v23 = objc_msgSend(a1, "readAdjustCoordFromXmlNode:name:formulaNameToIndexMap:", Child, "y", v10);
              objc_msgSend(v11, "OAXMainNamespace");
              v24 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
              Child = OCXFindNextChild(Child, v24, (xmlChar *)"pt");

              v25 = v22 + 1;
              if (!Child)
                break;
              v23 += 2;
            }
            while (v22++ < 2);
          }
          else
          {
            v25 = 0;
          }
          if (xmlStrEqual(i->name, (const xmlChar *)"close"))
          {
            if (v25)
              +[TCMessageException raise:](TCMessageException, "raise:", OABadFormat);
            v27 = objc_alloc_init(OADClosePathElement);
            goto LABEL_26;
          }
          if (xmlStrEqual(i->name, (const xmlChar *)"moveTo"))
          {
            v28 = off_24F399340;
            if (v25 != 1)
            {
              +[TCMessageException raise:](TCMessageException, "raise:", OABadFormat);
              v28 = off_24F399340;
            }
LABEL_25:
            v29 = objc_alloc(*v28);
            v27 = (OADClosePathElement *)objc_msgSend(v29, "initWithToPoint:", v39, v40);
            goto LABEL_26;
          }
          if (xmlStrEqual(i->name, (const xmlChar *)"lnTo"))
          {
            v28 = off_24F399338;
            if (v25 != 1)
            {
              +[TCMessageException raise:](TCMessageException, "raise:", OABadFormat);
              v28 = off_24F399338;
            }
            goto LABEL_25;
          }
          if (xmlStrEqual(i->name, (const xmlChar *)"cubicBezTo"))
          {
            if (v25 != 3)
              +[TCMessageException raise:](TCMessageException, "raise:", OABadFormat);
            v31 = [OADCubicBezierToPathElement alloc];
            v27 = -[OADCubicBezierToPathElement initWithControlPoint1:controlPoint2:toPoint:](v31, "initWithControlPoint1:controlPoint2:toPoint:", v39, v40, v41, v42, v43, v44);
          }
          else if (xmlStrEqual(i->name, (const xmlChar *)"quadBezTo"))
          {
            if (v25 != 2)
              +[TCMessageException raise:](TCMessageException, "raise:", OABadFormat);
            v32 = [OADQuadBezierToPathElement alloc];
            v27 = -[OADQuadBezierToPathElement initWithControlPoint:toPoint:](v32, "initWithControlPoint:toPoint:", v39, v40, v41, v42);
          }
          else
          {
            if (!xmlStrEqual(i->name, (const xmlChar *)"arcTo"))
            {
              v30 = 0;
              goto LABEL_27;
            }
            if (v25)
              +[TCMessageException raise:](TCMessageException, "raise:", OABadFormat);
            v27 = -[OADArcToPathElement initWithSemiaxes:startAngle:angleLength:]([OADArcToPathElement alloc], "initWithSemiaxes:startAngle:angleLength:", objc_msgSend(a1, "readAdjustCoordFromXmlNode:name:formulaNameToIndexMap:", i, "wR", v10, v35), objc_msgSend(a1, "readAdjustCoordFromXmlNode:name:formulaNameToIndexMap:", i, "hR", v10), objc_msgSend(a1, "readAdjustCoordFromXmlNode:name:formulaNameToIndexMap:", i, "stAng", v10), objc_msgSend(a1, "readAdjustCoordFromXmlNode:name:formulaNameToIndexMap:", i, "swAng", v10));
          }
LABEL_26:
          v30 = v27;
LABEL_27:
          -[OADPath addElement:](v38, "addElement:", v30, v35);

        }
        objc_msgSend(v35, "addPath:", v38);
        objc_msgSend(v11, "OAXMainNamespace");
        v33 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
        v34 = OCXFindNextChild(v37, v33, (xmlChar *)"path");

        v37 = v34;
      }
      while (v34);
    }
  }

}

+ (void)writePath:(id)a3 coordSpace:(CsRect<int>)a4 to:(id)a5
{
  void *v5;
  int *v6;
  id v8;
  id v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  _DWORD v30[2];
  _DWORD v31[2];
  _DWORD v32[2];
  _DWORD v33[2];
  _DWORD v34[2];

  v5 = *(void **)&a4.var0[2];
  v6 = *(int **)a4.var0;
  v8 = a3;
  v9 = v5;
  objc_msgSend(v9, "startOAElement:", CFSTR("path"));
  v10 = v6[1];
  v11 = *v6;
  objc_msgSend(v9, "writeOAAttribute:intContent:", CFSTR("w"), v6[2] - v11);
  objc_msgSend(v9, "writeOAAttribute:intContent:", CFSTR("h"), v6[3] - (uint64_t)v6[1]);
  v12 = objc_msgSend(v8, "fillMode");
  objc_msgSend(a1, "pathFillModeEnumMap");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "writeOAAttribute:enumContent:map:", CFSTR("fill"), v12, v13);

  objc_msgSend(v9, "writeOAAttribute:BOOLContent:", CFSTR("stroke"), objc_msgSend(v8, "stroked"));
  objc_msgSend(v9, "writeOAAttribute:BOOLContent:", CFSTR("extrusionOk"), 0);
  v14 = objc_msgSend(v8, "elementCount");
  if (v14)
  {
    for (i = 0; v14 != i; ++i)
    {
      objc_msgSend(v8, "elementAtIndex:", i);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v9, "startOAElement:", CFSTR("close"));
        objc_msgSend(v9, "endElement");
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v17 = v16;
          objc_msgSend(v9, "startOAElement:", CFSTR("cubicBezTo"));
          v18 = objc_msgSend(v17, "controlPoint1");
          v34[0] = v11;
          v34[1] = v10;
          objc_msgSend(a1, "writeShapePathPoint:origin:to:", v18, v19, v34, v9);
          v20 = objc_msgSend(v17, "controlPoint2");
          v33[0] = v11;
          v33[1] = v10;
          objc_msgSend(a1, "writeShapePathPoint:origin:to:", v20, v21, v33, v9);
          v22 = objc_msgSend(v17, "toPoint");
          v32[0] = v11;
          v32[1] = v10;
          objc_msgSend(a1, "writeShapePathPoint:origin:to:", v22, v23, v32, v9);
          objc_msgSend(v9, "endElement");
LABEL_11:

          goto LABEL_12;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v24 = v16;
          objc_msgSend(v9, "startOAElement:", CFSTR("lnTo"));
          v25 = objc_msgSend(v24, "toPoint");
          v31[0] = v11;
          v31[1] = v10;
          objc_msgSend(a1, "writeShapePathPoint:origin:to:", v25, v26, v31, v9);
          objc_msgSend(v9, "endElement");
          goto LABEL_11;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v27 = v16;
          objc_msgSend(v9, "startOAElement:", CFSTR("moveTo"));
          v28 = objc_msgSend(v27, "toPoint");
          v30[0] = v11;
          v30[1] = v10;
          objc_msgSend(a1, "writeShapePathPoint:origin:to:", v28, v29, v30, v9);
          objc_msgSend(v9, "endElement");
          goto LABEL_11;
        }
      }
LABEL_12:

    }
  }
  objc_msgSend(v9, "endElement");

}

+ (void)writeShapePathPoint:(OADAdjustPoint)a3 origin:(CsPoint<int>)a4 to:(id)a5
{
  int value;
  OADAdjustCoord x;
  id v8;

  value = a3.y.value;
  x = a3.x;
  v8 = a5;
  objc_msgSend(v8, "startOAElement:", CFSTR("pt"));
  objc_msgSend(v8, "writeOAAttribute:intContent:", CFSTR("x"), (*(uint64_t *)&x >> 32) - *(int *)a4.var0[0]);
  objc_msgSend(v8, "writeOAAttribute:intContent:", CFSTR("y"), value - (uint64_t)*(int *)(*(_QWORD *)&a4 + 4));
  objc_msgSend(v8, "endElement");

}

void __40__OAXGeometry_Private__shapeTypeEnumMap__block_invoke()
{
  unsigned __int8 v0;
  TCEnumerationMap *v1;
  void *v2;

  v0 = atomic_load((unsigned __int8 *)&_ZGVZZ40__OAXGeometry_Private__shapeTypeEnumMap_EUb_E20shapeTypeEnumStructs);
  if ((v0 & 1) == 0
    && __cxa_guard_acquire(&_ZGVZZ40__OAXGeometry_Private__shapeTypeEnumMap_EUb_E20shapeTypeEnumStructs))
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_9, 0, &dword_22A0CC000);
    __cxa_guard_release(&_ZGVZZ40__OAXGeometry_Private__shapeTypeEnumMap_EUb_E20shapeTypeEnumStructs);
  }
  v1 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &_ZZZ40__OAXGeometry_Private__shapeTypeEnumMap_EUb_E20shapeTypeEnumStructs, 187, 1);
  v2 = (void *)+[OAXGeometry(Private) shapeTypeEnumMap]::shapeTypeEnumMap;
  +[OAXGeometry(Private) shapeTypeEnumMap]::shapeTypeEnumMap = (uint64_t)v1;

}

void __42__OAXGeometry_Private__formulaTypeEnumMap__block_invoke()
{
  unsigned __int8 v0;
  TCEnumerationMap *v1;
  void *v2;

  v0 = atomic_load((unsigned __int8 *)&_ZGVZZ42__OAXGeometry_Private__formulaTypeEnumMap_EUb0_E22formulaTypeEnumStructs);
  if ((v0 & 1) == 0
    && __cxa_guard_acquire(&_ZGVZZ42__OAXGeometry_Private__formulaTypeEnumMap_EUb0_E22formulaTypeEnumStructs))
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_542, 0, &dword_22A0CC000);
    __cxa_guard_release(&_ZGVZZ42__OAXGeometry_Private__formulaTypeEnumMap_EUb0_E22formulaTypeEnumStructs);
  }
  v1 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &_ZZZ42__OAXGeometry_Private__formulaTypeEnumMap_EUb0_E22formulaTypeEnumStructs, 17, 1);
  v2 = (void *)+[OAXGeometry(Private) formulaTypeEnumMap]::formulaTypeEnumMap;
  +[OAXGeometry(Private) formulaTypeEnumMap]::formulaTypeEnumMap = (uint64_t)v1;

}

void __45__OAXGeometry_Private__formulaKeywordEnumMap__block_invoke()
{
  unsigned __int8 v0;
  TCEnumerationMap *v1;
  void *v2;

  v0 = atomic_load((unsigned __int8 *)&_ZGVZZ45__OAXGeometry_Private__formulaKeywordEnumMap_EUb1_E25formulaKeywordEnumStructs);
  if ((v0 & 1) == 0
    && __cxa_guard_acquire(&_ZGVZZ45__OAXGeometry_Private__formulaKeywordEnumMap_EUb1_E25formulaKeywordEnumStructs))
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_544, 0, &dword_22A0CC000);
    __cxa_guard_release(&_ZGVZZ45__OAXGeometry_Private__formulaKeywordEnumMap_EUb1_E25formulaKeywordEnumStructs);
  }
  v1 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &_ZZZ45__OAXGeometry_Private__formulaKeywordEnumMap_EUb1_E25formulaKeywordEnumStructs, 6, 1);
  v2 = (void *)+[OAXGeometry(Private) formulaKeywordEnumMap]::formulaKeywordEnumMap;
  +[OAXGeometry(Private) formulaKeywordEnumMap]::formulaKeywordEnumMap = (uint64_t)v1;

}

void __43__OAXGeometry_Private__pathFillModeEnumMap__block_invoke()
{
  unsigned __int8 v0;
  TCEnumerationMap *v1;
  void *v2;

  v0 = atomic_load((unsigned __int8 *)&_ZGVZZ43__OAXGeometry_Private__pathFillModeEnumMap_EUb2_E23pathFillModeEnumStructs);
  if ((v0 & 1) == 0
    && __cxa_guard_acquire(&_ZGVZZ43__OAXGeometry_Private__pathFillModeEnumMap_EUb2_E23pathFillModeEnumStructs))
  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_558, 0, &dword_22A0CC000);
    __cxa_guard_release(&_ZGVZZ43__OAXGeometry_Private__pathFillModeEnumMap_EUb2_E23pathFillModeEnumStructs);
  }
  v1 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &_ZZZ43__OAXGeometry_Private__pathFillModeEnumMap_EUb2_E23pathFillModeEnumStructs, 6, 1);
  v2 = (void *)+[OAXGeometry(Private) pathFillModeEnumMap]::pathFillModeEnumMap;
  +[OAXGeometry(Private) pathFillModeEnumMap]::pathFillModeEnumMap = (uint64_t)v1;

}

@end
