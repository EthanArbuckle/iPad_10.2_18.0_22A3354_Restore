@implementation CHXDateAxis

+ (id)chdAxisFromXmlAxisElement:(_xmlNode *)a3 state:(id)a4
{
  id v6;
  CHDDateAxis *v7;
  void *v8;
  CHDDateAxis *v9;
  void *v10;
  CXNamespace *v11;
  _xmlNode *v12;
  void *v13;
  CXNamespace *v14;
  _xmlNode *v15;
  void *v16;
  CXNamespace *v17;
  _xmlNode *v18;
  void *v19;
  CXNamespace *v20;
  uint64_t v21;
  void *v22;
  CXNamespace *v23;
  uint64_t v24;
  void *v25;
  CXNamespace *v26;
  uint64_t v27;
  double v29;

  v6 = a4;
  v7 = [CHDDateAxis alloc];
  objc_msgSend(v6, "resources");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CHDDateAxis initWithResources:](v7, "initWithResources:", v8);

  objc_msgSend(v6, "drawingState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "OAXChartNamespace");
  v11 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v12 = (_xmlNode *)OCXFindChild(a3, v11, "auto");

  if (v12)
    -[CHDDateAxis setAutomatic:](v9, "setAutomatic:", CXRequiredBoolAttribute(v12, (CXNamespace *)CXNoNamespace, (xmlChar *)"val"));
  objc_msgSend(v6, "drawingState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "OAXChartNamespace");
  v14 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v15 = (_xmlNode *)OCXFindChild(a3, v14, "majorUnit");

  if (v15)
  {
    v29 = 0.0;
    if (CXOptionalDoubleAttribute(v15, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", &v29))
      -[CHDDateAxis setMajorUnitValue:](v9, "setMajorUnitValue:", v29);
  }
  objc_msgSend(v6, "drawingState");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "OAXChartNamespace");
  v17 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v18 = (_xmlNode *)OCXFindChild(a3, v17, "minorUnit");

  if (v18)
  {
    v29 = 0.0;
    if (CXOptionalDoubleAttribute(v18, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", &v29))
      -[CHDDateAxis setMinorUnitValue:](v9, "setMinorUnitValue:", v29);
  }
  objc_msgSend(v6, "drawingState");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "OAXChartNamespace");
  v20 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v21 = OCXFindChild(a3, v20, "majorTimeUnit");

  -[CHDDateAxis setMajorTimeUnit:](v9, "setMajorTimeUnit:", objc_msgSend(a1, "chdTimeUnitFromXmlTimeUnitElement:", v21));
  objc_msgSend(v6, "drawingState");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "OAXChartNamespace");
  v23 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v24 = OCXFindChild(a3, v23, "minorTimeUnit");

  -[CHDDateAxis setMinorTimeUnit:](v9, "setMinorTimeUnit:", objc_msgSend(a1, "chdTimeUnitFromXmlTimeUnitElement:", v24));
  objc_msgSend(v6, "drawingState");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "OAXChartNamespace");
  v26 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v27 = OCXFindChild(a3, v26, "baseTimeUnit");

  -[CHDDateAxis setBaseTimeUnit:](v9, "setBaseTimeUnit:", objc_msgSend(a1, "chdTimeUnitFromXmlTimeUnitElement:", v27));
  return v9;
}

+ (int)chdTimeUnitFromXmlTimeUnitElement:(_xmlNode *)a3
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
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("days")) & 1) != 0)
    {
      v3 = 0;
    }
    else if ((objc_msgSend(v5, "isEqualToString:", CFSTR("months")) & 1) != 0)
    {
      v3 = 1;
    }
    else if (objc_msgSend(v5, "isEqualToString:", CFSTR("years")))
    {
      v3 = 2;
    }
    else
    {
      v3 = 0;
    }
  }

  return v3;
}

+ (id)stringFromTimeUnit:(int)a3
{
  const __CFString *v3;

  v3 = CFSTR("days");
  if (a3 == 1)
    v3 = CFSTR("months");
  if (a3 == 2)
    return CFSTR("years");
  else
    return (id)v3;
}

@end
