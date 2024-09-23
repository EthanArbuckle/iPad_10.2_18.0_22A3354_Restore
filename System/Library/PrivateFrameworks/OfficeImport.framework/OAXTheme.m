@implementation OAXTheme

+ (void)readFromPackagePart:(id)a3 toTheme:(id)a4 state:(id)a5
{
  id v8;
  id v9;
  _xmlNode *v10;
  void *v11;
  CXNamespace *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  CXNamespace *v16;
  uint64_t v17;
  id v18;

  v18 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v9, "setPackagePart:", v18);
  v10 = OCXGetRootElement((_xmlDoc *)objc_msgSend(v18, "xmlDocument"));
  CXDefaultStringAttribute(v10, (CXNamespace *)CXNoNamespace, (xmlChar *)"name", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setName:", v11);

  objc_msgSend(v9, "OAXMainNamespace");
  v12 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v13 = OCXFindChild(v10, v12, "themeElements");

  if (!v13)
    +[TCMessageException raise:](TCMessageException, "raise:", OABadFormat);
  objc_msgSend(v8, "baseStyles");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[OAXBaseStyles readFromXmlNode:toBaseStyles:packagePart:drawingState:](OAXBaseStyles, "readFromXmlNode:toBaseStyles:packagePart:drawingState:", v13, v14, v18, v9);
  objc_msgSend(v14, "styleMatrix");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setStyleMatrix:", v15);

  objc_msgSend(v9, "OAXMainNamespace");
  v16 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v17 = OCXFindChild(v10, v16, "objectDefaults");

  objc_msgSend(a1, "readObjectDefaults:theme:drawingState:", v17, v8, v9);
}

+ (void)readObjectDefaults:(_xmlNode *)a3 theme:(id)a4 drawingState:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a4;
  v8 = a5;
  objc_msgSend(v15, "drawableDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addShapeDefaults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "readObjectDefaultsFromParent:defaultsName:toObjectDefaults:drawingState:", a3, "spDef", v10, v8);

  objc_msgSend(v15, "drawableDefaults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addLineDefaults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "readObjectDefaultsFromParent:defaultsName:toObjectDefaults:drawingState:", a3, "lnDef", v12, v8);

  objc_msgSend(v15, "drawableDefaults");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addTextDefaults");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "readObjectDefaultsFromParent:defaultsName:toObjectDefaults:drawingState:", a3, "txDef", v14, v8);

}

+ (void)readObjectDefaultsFromParent:(_xmlNode *)a3 defaultsName:(const char *)a4 toObjectDefaults:(id)a5 drawingState:(id)a6
{
  id v10;
  CXNamespace *v11;
  uint64_t v12;
  OAXDrawingState *v13;
  id v14;
  xmlDoc *v15;
  _xmlNode *v16;
  CXNamespace *v17;
  uint64_t v18;
  id v19;

  v19 = a5;
  v10 = a6;
  objc_msgSend(v10, "OAXMainNamespace");
  v11 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v12 = OCXFindChild(a3, v11, a4);

  v13 = -[OAXDrawingState initWithClient:]([OAXDrawingState alloc], "initWithClient:", 0);
  +[TCXmlUtilities bundlePathForXmlResource:](TCXmlUtilities, "bundlePathForXmlResource:", CFSTR("DefaultObjectDefaults"));
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v15 = (xmlDoc *)sfaxmlParseFile(objc_msgSend(v14, "fileSystemRepresentation"));
  v16 = OCXGetRootElement(v15);
  -[OAXDrawingState OAXMainNamespace](v13, "OAXMainNamespace");
  v17 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v18 = OCXFindChild(v16, v17, a4);

  objc_msgSend(a1, "readDefaultProperties:fallback:defaultProperties:drawingState:", v12, v18, v19, v10);
  xmlFreeDoc(v15);

}

+ (void)readDefaultProperties:(_xmlNode *)a3 fallback:(_xmlNode *)a4 defaultProperties:(id)a5 drawingState:(id)a6
{
  id v10;
  _xmlNode *v11;
  uint64_t v12;
  void *v13;
  CXNamespace *v14;
  uint64_t v15;
  OADShapeStyle *v16;
  void *v17;
  OADShapeStyle *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;

  v23 = a5;
  v10 = a6;
  if (a3)
    v11 = a3;
  else
    v11 = a4;
  v12 = objc_msgSend(a1, "childNamed:inParent:fallbackParent:drawingState:", "spPr", v11, a4, v10);
  objc_msgSend(v23, "shapeProperties");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "OAXMainNamespace");
  v14 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v15 = OCXFindChild(v11, v14, "style");

  if (v15)
  {
    v16 = objc_alloc_init(OADShapeStyle);
    +[OAXShapeStyle readFromNode:shapeStyle:drawingState:](OAXShapeStyle, "readFromNode:shapeStyle:drawingState:", v15, v16, v10);
    objc_msgSend(v10, "styleMatrix");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[OADShapeStyle applyToGraphicProperties:styleMatrix:](v16, "applyToGraphicProperties:styleMatrix:", v13, v17);

    v18 = v16;
  }
  else
  {
    v18 = 0;
  }
  +[OAXGraphic readPropertiesFromXmlNode:graphicProperties:drawingState:](OAXGraphic, "readPropertiesFromXmlNode:graphicProperties:drawingState:", v12, v13, v10);
  v19 = objc_msgSend(a1, "childNamed:inParent:fallbackParent:drawingState:", "bodyPr", v11, a4, v10);
  objc_msgSend(v23, "textBodyProperties");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[OAXTextBody readTextBodyProperties:textBodyProperties:drawingState:](OAXTextBody, "readTextBodyProperties:textBodyProperties:drawingState:", v19, v20, v10);
  v21 = objc_msgSend(a1, "childNamed:inParent:fallbackParent:drawingState:", "lstStyle", v11, a4, v10);
  objc_msgSend(v23, "textListStyle");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[OAXTextListStyle readNode:textListStyle:state:](OAXTextListStyle, "readNode:textListStyle:state:", v21, v22, v10);
  if (v18)
    -[OADShapeStyle applyToTextListStyle:](v18, "applyToTextListStyle:", v22);

}

+ (void)readFromThemeData:(const char *)a3 themeDataSize:(unsigned int)a4 toTheme:(id)a5 xmlDrawingState:(id)a6
{
  OCXState *v9;
  void *v10;
  OCPZipPackage *v11;
  OCPZipPackage *v12;
  OCPPackagePart *v13;
  OCPPackagePart *v14;
  void *v15;
  id v16;

  v16 = a5;
  v9 = (OCXState *)a6;
  if (a3 && a4)
  {
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", a3, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[OCPZipPackage initWithData:]([OCPZipPackage alloc], "initWithData:", v10);
    v12 = v11;
    if (v11)
    {
      -[OCPPackage mainDocumentPart](v11, "mainDocumentPart");
      v13 = (OCPPackagePart *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        OCXFirstPartWithRelationshipOfTypeToPartWithFallback(v13, v9, (objc_selector *)sel_OCXThemeRelationshipType);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
          +[OAXTheme readFromPackagePart:toTheme:state:](OAXTheme, "readFromPackagePart:toTheme:state:", v15, v16, v9);

      }
    }

  }
}

+ (_xmlNode)childNamed:(const char *)a3 inParent:(_xmlNode *)a4 fallbackParent:(_xmlNode *)a5 drawingState:(id)a6
{
  id v9;
  CXNamespace *v10;
  _xmlNode *v11;
  CXNamespace *v12;

  v9 = a6;
  objc_msgSend(v9, "OAXMainNamespace");
  v10 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v11 = (_xmlNode *)OCXFindChild(a4, v10, a3);

  if (!v11 || !OCXFirstChild(v11) && !v11->properties)
  {
    objc_msgSend(v9, "OAXMainNamespace");
    v12 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v11 = (_xmlNode *)OCXFindChild(a5, v12, a3);

  }
  return v11;
}

@end
