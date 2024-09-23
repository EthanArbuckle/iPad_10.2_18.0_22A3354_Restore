@implementation CHXErrorBar

+ (id)chdErrorBarFromXmlErrorBarElement:(_xmlNode *)a3 state:(id)a4
{
  id v6;
  CHDErrorBar *v7;
  void *v8;
  CHDErrorBar *v9;
  void *v10;
  CXNamespace *v11;
  _xmlNode *v12;
  void *v13;
  CXNamespace *v14;
  uint64_t v15;
  void *v16;
  CXNamespace *v17;
  uint64_t v18;
  void *v19;
  CXNamespace *v20;
  uint64_t v21;
  void *v22;
  CXNamespace *v23;
  _xmlNode *v24;
  void *v25;
  CXNamespace *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  CXNamespace *v30;
  uint64_t v31;
  void *v32;
  OADGraphicProperties *v33;
  double v35;

  v6 = a4;
  v7 = [CHDErrorBar alloc];
  objc_msgSend(v6, "chart");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CHDErrorBar initWithChart:](v7, "initWithChart:", v8);

  objc_msgSend(v6, "drawingState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "OAXChartNamespace");
  v11 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v12 = (_xmlNode *)OCXFindChild(a3, v11, "val");

  if (v12)
  {
    v35 = 0.0;
    if (CXOptionalDoubleAttribute(v12, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", &v35))
      -[CHDErrorBar setValue:](v9, "setValue:", v35);
  }
  objc_msgSend(v6, "drawingState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "OAXChartNamespace");
  v14 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v15 = OCXFindChild(a3, v14, "errBarType");

  -[CHDErrorBar setType:](v9, "setType:", objc_msgSend(a1, "chdErrorBarTypeFromXmlElement:", v15));
  objc_msgSend(v6, "drawingState");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "OAXChartNamespace");
  v17 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v18 = OCXFindChild(a3, v17, "errValType");

  -[CHDErrorBar setValueType:](v9, "setValueType:", objc_msgSend(a1, "chdErrorBarValueTypeFromXmlElement:", v18));
  objc_msgSend(v6, "drawingState");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "OAXChartNamespace");
  v20 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v21 = OCXFindChild(a3, v20, "errDir");

  -[CHDErrorBar setDirection:](v9, "setDirection:", objc_msgSend(a1, "chdErrorBarDirectionFromXmlElement:", v21));
  objc_msgSend(v6, "drawingState");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "OAXChartNamespace");
  v23 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v24 = (_xmlNode *)OCXFindChild(a3, v23, "noEndCap");

  if (v24)
    -[CHDErrorBar setNoEndCap:](v9, "setNoEndCap:", CXRequiredBoolAttribute(v24, (CXNamespace *)CXNoNamespace, (xmlChar *)"val"));
  objc_msgSend(v6, "drawingState");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "OAXChartNamespace");
  v26 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v27 = OCXFindChild(a3, v26, "minus");

  if (v27)
  {
    +[CHXData chdDataFromXmlDataElement:state:](CHXData, "chdDataFromXmlDataElement:state:", v27, v6);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[CHDErrorBar setMinusValues:](v9, "setMinusValues:", v28);

  }
  objc_msgSend(v6, "drawingState");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "OAXChartNamespace");
  v30 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v31 = OCXFindChild(a3, v30, "plus");

  if (v31)
  {
    +[CHXData chdDataFromXmlDataElement:state:](CHXData, "chdDataFromXmlDataElement:state:", v31, v6);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[CHDErrorBar setPlusValues:](v9, "setPlusValues:", v32);

  }
  v33 = objc_alloc_init(OADGraphicProperties);
  +[CHXGraphicProperties setGraphicPropertiesFromXmlElementWithGraphicProperties:element:state:](CHXGraphicProperties, "setGraphicPropertiesFromXmlElementWithGraphicProperties:element:state:", v33, a3, v6);
  -[CHDErrorBar setGraphicProperties:](v9, "setGraphicProperties:", v33);

  return v9;
}

+ (int)chdErrorBarTypeFromXmlElement:(_xmlNode *)a3
{
  int v3;
  id v4;
  void *v5;
  id v7;

  if (!a3)
    return 0;
  v7 = 0;
  v3 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"val", &v7);
  v4 = v7;
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "isEqualToString:", CFSTR("both"));
    v3 = objc_msgSend(v5, "isEqualToString:", CFSTR("minus"));
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("plus")))
      v3 = 2;
  }

  return v3;
}

+ (int)chdErrorBarValueTypeFromXmlElement:(_xmlNode *)a3
{
  _BOOL4 v3;
  id v4;
  void *v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  id v15;

  if (!a3)
    return 2;
  v15 = 0;
  v3 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"val", &v15);
  v4 = v15;
  v5 = v4;
  if (v3)
  {
    v6 = objc_msgSend(v4, "isEqualToString:", CFSTR("cust"));
    v7 = objc_msgSend(v5, "isEqualToString:", CFSTR("fixedVal"));
    v8 = objc_msgSend(v5, "isEqualToString:", CFSTR("percentage"));
    v9 = objc_msgSend(v5, "isEqualToString:", CFSTR("stdDev"));
    v10 = objc_msgSend(v5, "isEqualToString:", CFSTR("stdErr"));
    if (v6)
      v11 = 4;
    else
      v11 = 2;
    if (v7)
      v12 = 2;
    else
      v12 = v11;
    if (v8)
      v12 = 1;
    if (v9)
      v12 = 3;
    if (v10)
      v13 = 5;
    else
      v13 = v12;
  }
  else
  {
    v13 = 2;
  }

  return v13;
}

+ (int)chdErrorBarDirectionFromXmlElement:(_xmlNode *)a3
{
  _BOOL4 v3;
  id v4;
  void *v5;
  int v6;
  int v7;
  id v9;

  if (!a3)
    return 1;
  v9 = 0;
  v3 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"val", &v9);
  v4 = v9;
  v5 = v4;
  if (v3)
  {
    v6 = objc_msgSend(v4, "isEqualToString:", CFSTR("x"));
    v7 = objc_msgSend(v5, "isEqualToString:", CFSTR("y")) | v6 ^ 1;
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

+ (id)chxErrorBarTypeFromEnum:(int)a3
{
  const __CFString *v3;

  v3 = CFSTR("both");
  if (a3 == 1)
    v3 = CFSTR("minus");
  if (a3 == 2)
    return CFSTR("plus");
  else
    return (id)v3;
}

+ (id)chxErrorBarValueTypeFromEnum:(int)a3
{
  if ((a3 - 1) > 4)
    return CFSTR("fixedVal");
  else
    return off_24F3A7970[a3 - 1];
}

@end
