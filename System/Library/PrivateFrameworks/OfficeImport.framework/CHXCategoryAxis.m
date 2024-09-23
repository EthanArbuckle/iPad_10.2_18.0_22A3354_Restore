@implementation CHXCategoryAxis

+ (id)chdAxisFromXmlAxisElement:(_xmlNode *)a3 state:(id)a4
{
  id v6;
  CHDCategoryAxis *v7;
  void *v8;
  CHDCategoryAxis *v9;
  void *v10;
  CXNamespace *v11;
  _xmlNode *v12;
  void *v13;
  CXNamespace *v14;
  _xmlNode *v15;
  void *v16;
  CXNamespace *v17;
  uint64_t v18;
  void *v19;
  CXNamespace *v20;
  _xmlNode *v21;
  void *v22;
  CXNamespace *v23;
  _xmlNode *v24;
  _BOOL4 v25;
  id v26;
  void *v27;
  void *v28;
  CXNamespace *v29;
  _xmlNode *v30;
  id v32;

  v6 = a4;
  v7 = [CHDCategoryAxis alloc];
  objc_msgSend(v6, "resources");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CHDCategoryAxis initWithResources:](v7, "initWithResources:", v8);

  objc_msgSend(v6, "drawingState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "OAXChartNamespace");
  v11 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v12 = (_xmlNode *)OCXFindChild(a3, v11, "auto");

  if (v12)
    -[CHDCategoryAxis setAutomatic:](v9, "setAutomatic:", CXRequiredBoolAttribute(v12, (CXNamespace *)CXNoNamespace, (xmlChar *)"val"));
  objc_msgSend(v6, "drawingState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "OAXChartNamespace");
  v14 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v15 = (_xmlNode *)OCXFindChild(a3, v14, "noMultiLvlLbl");

  if (v15)
    -[CHDCategoryAxis setNoMultipleLevelLabel:](v9, "setNoMultipleLevelLabel:", CXRequiredBoolAttribute(v15, (CXNamespace *)CXNoNamespace, (xmlChar *)"val"));
  objc_msgSend(v6, "drawingState");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "OAXChartNamespace");
  v17 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v18 = OCXFindChild(a3, v17, "lblAlgn");

  if (v18)
    -[CHDCategoryAxis setLabelAlignment:](v9, "setLabelAlignment:", objc_msgSend(a1, "chdLabelAlignFromXmlLabelAlignElement:", v18));
  objc_msgSend(v6, "drawingState");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "OAXChartNamespace");
  v20 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v21 = (_xmlNode *)OCXFindChild(a3, v20, "scaling");

  if (v21)
  {
    objc_msgSend(v6, "drawingState");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "OAXChartNamespace");
    v23 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v24 = (_xmlNode *)OCXFindChild(v21, v23, "orientation");

    if (v24)
    {
      v32 = 0;
      v25 = CXOptionalStringAttribute(v24, (void *)CXNoNamespace, (xmlChar *)"val", &v32);
      v26 = v32;
      v27 = v26;
      if (v25 && !objc_msgSend(v26, "compare:", CFSTR("maxMin")))
        -[CHDAxis setReverseOrder:](v9, "setReverseOrder:", 1);

    }
  }
  objc_msgSend(v6, "drawingState");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "OAXChartNamespace");
  v29 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v30 = (_xmlNode *)OCXFindChild(a3, v29, "tickLblSkip");

  if (v30)
    -[CHDCategoryAxis setLabelFrequency:](v9, "setLabelFrequency:", CXRequiredLongAttribute(v30, (CXNamespace *)CXNoNamespace, (xmlChar *)"val"));

  return v9;
}

+ (int)chdLabelAlignFromXmlLabelAlignElement:(_xmlNode *)a3
{
  void *v3;
  int v4;

  CXRequiredStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"val");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ctr")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("l")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("r")))
  {
    v4 = 1;
  }
  else
  {
    v4 = 2;
  }

  return v4;
}

+ (id)stringFromLabelAlignment:(int)a3
{
  const __CFString *v3;

  v3 = CFSTR("ctr");
  if (a3 == 1)
    v3 = CFSTR("l");
  if (a3 == 3)
    return CFSTR("r");
  else
    return (id)v3;
}

@end
