@implementation EXBorders

+ (id)edBordersFromXmlBordersElement:(_xmlNode *)a3 state:(id)a4
{
  id v6;
  void *v7;
  CXNamespace *v8;
  uint64_t v9;
  CXNamespace *v10;
  CXNamespace *v11;
  uint64_t v12;
  CXNamespace *v13;
  void *v14;
  CXNamespace *v15;
  uint64_t v16;
  void *v17;
  CXNamespace *v18;
  uint64_t v19;
  void *v20;
  CXNamespace *v21;
  uint64_t v22;
  void *v23;
  CXNamespace *v24;
  uint64_t v25;
  void *v26;
  CXNamespace *v27;
  uint64_t v28;
  CXNamespace *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;

  v6 = a4;
  v7 = v6;
  if (a3)
  {
    objc_msgSend(v6, "EXSpreadsheetMLNamespace");
    v8 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v9 = OCXFindChild(a3, v8, "left");

    if (!v9)
    {
      objc_msgSend(v7, "EXSpreadsheetMLNamespace");
      v10 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v9 = OCXFindChild(a3, v10, "start");

    }
    objc_msgSend(a1, "edBorderFromXmlElement:diagonalType:state:", v9, 0, v7);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "EXSpreadsheetMLNamespace");
    v11 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v12 = OCXFindChild(a3, v11, "right");

    if (!v12)
    {
      objc_msgSend(v7, "EXSpreadsheetMLNamespace");
      v13 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v12 = OCXFindChild(a3, v13, "end");

    }
    objc_msgSend(a1, "edBorderFromXmlElement:diagonalType:state:", v12, 0, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "EXSpreadsheetMLNamespace");
    v15 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v16 = OCXFindChild(a3, v15, "top");

    objc_msgSend(a1, "edBorderFromXmlElement:diagonalType:state:", v16, 0, v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "EXSpreadsheetMLNamespace");
    v18 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v19 = OCXFindChild(a3, v18, "bottom");

    objc_msgSend(a1, "edBorderFromXmlElement:diagonalType:state:", v19, 0, v7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "EXSpreadsheetMLNamespace");
    v21 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v22 = OCXFindChild(a3, v21, "vertical");

    objc_msgSend(a1, "edBorderFromXmlElement:diagonalType:state:", v22, 0, v7);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "EXSpreadsheetMLNamespace");
    v24 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v25 = OCXFindChild(a3, v24, "horizontal");

    objc_msgSend(a1, "edBorderFromXmlElement:diagonalType:state:", v25, 0, v7);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "EXSpreadsheetMLNamespace");
    v27 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v28 = OCXFindChild(a3, v27, "diagonal");

    if (!v28)
    {
      objc_msgSend(v7, "EXSpreadsheetMLNamespace");
      v29 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
      v28 = OCXFindChild(a3, v29, "diag");

    }
    objc_msgSend(a1, "edBorderFromXmlElement:diagonalType:state:", v28, objc_msgSend(a1, "edDiagStyleFromXmlElement:", a3), v7);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "resources");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    +[EDBorders bordersWithLeft:right:top:bottom:diagonal:vertical:horizontal:resources:](EDBorders, "bordersWithLeft:right:top:bottom:diagonal:vertical:horizontal:resources:", v34, v14, v17, v20, v30, v23, v26, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v32 = 0;
  }

  return v32;
}

+ (id)edBorderFromXmlElement:(_xmlNode *)a3 diagonalType:(int)a4 state:(id)a5
{
  uint64_t v5;
  id v8;
  id v9;
  uint64_t v10;
  CXNamespace *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;

  v5 = *(_QWORD *)&a4;
  v8 = a5;
  if (a3)
  {
    v17 = 0;
    CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"style", &v17);
    v9 = v17;
    v10 = objc_msgSend(a1, "edBorderStyleFromXmlBorderStyleString:", v9);
    objc_msgSend(v8, "EXSpreadsheetMLNamespace");
    v11 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v12 = OCXFindChild(a3, v11, "color");

    +[EXColorReference edColorReferenceFromXmlColorElement:callerClass:state:](EXColorReference, "edColorReferenceFromXmlColorElement:callerClass:state:", v12, objc_opt_class(), v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "resources");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[EDBorder borderWithType:colorReference:diagonalType:resources:](EDBorder, "borderWithType:colorReference:diagonalType:resources:", v10, v13, v5, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (int)edBorderStyleFromXmlBorderStyleString:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  int v7;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(a1, "borderStyleEnumMap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "valueForString:", v4);

    if (v6 == -130883970)
      v7 = 0;
    else
      v7 = v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (int)edDiagStyleFromXmlElement:(_xmlNode *)a3
{
  int v4;
  BOOL v6;
  BOOL v7;

  if (!a3)
    return 0;
  v7 = 0;
  if (!CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"diagonalUp", &v7))
    CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"diagUp", &v7);
  v6 = 0;
  if (!CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"diagonalDown", &v6))
    CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"diagDown", &v6);
  if (v6)
    v4 = 3;
  else
    v4 = 2;
  if (v7)
    return v4;
  else
    return v6;
}

+ (id)borderStyleEnumMap
{
  unsigned __int8 v2;

  {
    __cxa_atexit((void (*)(void *))__cxx_global_array_dtor_20, 0, &dword_22A0CC000);
  }
  if (+[EXBorders borderStyleEnumMap]::onceToken != -1)
    dispatch_once(&+[EXBorders borderStyleEnumMap]::onceToken, &__block_literal_global_71);
  return (id)+[EXBorders borderStyleEnumMap]::sBorderStyleEnumMap;
}

void __31__EXBorders_borderStyleEnumMap__block_invoke()
{
  TCEnumerationMap *v0;
  void *v1;

  v0 = -[TCEnumerationMap initWithStructs:count:caseSensitive:]([TCEnumerationMap alloc], "initWithStructs:count:caseSensitive:", &+[EXBorders borderStyleEnumMap]::sBorderStyleStructs, 14, 1);
  v1 = (void *)+[EXBorders borderStyleEnumMap]::sBorderStyleEnumMap;
  +[EXBorders borderStyleEnumMap]::sBorderStyleEnumMap = (uint64_t)v0;

}

@end
