@implementation CHXValueAxis

+ (id)chdAxisFromXmlAxisElement:(_xmlNode *)a3 state:(id)a4
{
  id v6;
  CHDValueAxis *v7;
  void *v8;
  CHDValueAxis *v9;
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
  void *v31;
  CXNamespace *v32;
  uint64_t v33;
  void *v34;
  CXNamespace *v35;
  uint64_t v36;
  id v38;
  double v39;

  v6 = a4;
  v7 = [CHDValueAxis alloc];
  objc_msgSend(v6, "resources");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[CHDValueAxis initWithResources:](v7, "initWithResources:", v8);

  objc_msgSend(v6, "drawingState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "OAXChartNamespace");
  v11 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v12 = (_xmlNode *)OCXFindChild(a3, v11, "majorUnit");

  if (v12)
  {
    v39 = 0.0;
    if (CXOptionalDoubleAttribute(v12, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", &v39))
      -[CHDValueAxis setMajorUnitValue:](v9, "setMajorUnitValue:", v39);
  }
  objc_msgSend(v6, "drawingState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "OAXChartNamespace");
  v14 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v15 = (_xmlNode *)OCXFindChild(a3, v14, "minorUnit");

  if (v15)
  {
    v39 = 0.0;
    if (CXOptionalDoubleAttribute(v15, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", &v39))
      -[CHDValueAxis setMinorUnitValue:](v9, "setMinorUnitValue:", v39);
  }
  objc_msgSend(v6, "drawingState");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "OAXChartNamespace");
  v17 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v18 = (_xmlNode *)OCXFindChild(a3, v17, "scaling");

  if (v18)
  {
    objc_msgSend(v6, "drawingState");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "OAXChartNamespace");
    v20 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v21 = (_xmlNode *)OCXFindChild(v18, v20, "logBase");

    if (v21)
    {
      v39 = 0.0;
      if (CXOptionalDoubleAttribute(v21, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", &v39))
        -[CHDValueAxis setScalingLogBase:](v9, "setScalingLogBase:", v39);
    }
    objc_msgSend(v6, "drawingState");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "OAXChartNamespace");
    v23 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v24 = (_xmlNode *)OCXFindChild(v18, v23, "orientation");

    if (v24)
    {
      v38 = 0;
      v25 = CXOptionalStringAttribute(v24, (void *)CXNoNamespace, (xmlChar *)"val", &v38);
      v26 = v38;
      v27 = v26;
      if (v25 && !objc_msgSend(v26, "compare:", CFSTR("maxMin")))
        -[CHDAxis setReverseOrder:](v9, "setReverseOrder:", 1);

    }
  }
  objc_msgSend(v6, "drawingState");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "OAXChartNamespace");
  v29 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v30 = (_xmlNode *)OCXFindChild(a3, v29, "dispUnits");

  if (v30)
  {
    objc_msgSend(v6, "drawingState");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "OAXChartNamespace");
    v32 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v33 = OCXFindChild(v30, v32, "builtInUnit");

    if (v33)
      -[CHDValueAxis setBuiltInUnit:](v9, "setBuiltInUnit:", objc_msgSend(a1, "chdAxisBuiltInUnitFromXmlBuildInUnitElement:", v33));
    objc_msgSend(v6, "drawingState");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "OAXChartNamespace");
    v35 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v36 = OCXFindChild(v30, v35, "dispUnitsLbl");

    if (v36)
      -[CHDValueAxis setShowBuiltInUnitFlag:](v9, "setShowBuiltInUnitFlag:", 1);
  }

  return v9;
}

+ (int)chdAxisBuiltInUnitFromXmlBuildInUnitElement:(_xmlNode *)a3
{
  _BOOL4 v3;
  id v4;
  void *v5;
  int v6;
  id v8;

  if (a3)
  {
    v8 = 0;
    v3 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"val", &v8);
    v4 = v8;
    v5 = v4;
    if (v3)
    {
      if ((objc_msgSend(v4, "isEqualToString:", CFSTR("hundreds")) & 1) != 0)
      {
        v6 = 0;
LABEL_23:

        return v6;
      }
      if ((objc_msgSend(v5, "isEqualToString:", CFSTR("thousands")) & 1) != 0)
      {
        v6 = 1;
        goto LABEL_23;
      }
      if ((objc_msgSend(v5, "isEqualToString:", CFSTR("tenThousands")) & 1) != 0)
      {
        v6 = 2;
        goto LABEL_23;
      }
      if ((objc_msgSend(v5, "isEqualToString:", CFSTR("hundredThousands")) & 1) != 0)
      {
        v6 = 3;
        goto LABEL_23;
      }
      if ((objc_msgSend(v5, "isEqualToString:", CFSTR("millions")) & 1) != 0)
      {
        v6 = 4;
        goto LABEL_23;
      }
      if ((objc_msgSend(v5, "isEqualToString:", CFSTR("tenMillions")) & 1) != 0)
      {
        v6 = 5;
        goto LABEL_23;
      }
      if ((objc_msgSend(v5, "isEqualToString:", CFSTR("hundredMillions")) & 1) != 0)
      {
        v6 = 6;
        goto LABEL_23;
      }
      if ((objc_msgSend(v5, "isEqualToString:", CFSTR("billions")) & 1) != 0)
      {
        v6 = 7;
        goto LABEL_23;
      }
      if ((objc_msgSend(v5, "isEqualToString:", CFSTR("trillions")) & 1) != 0)
      {
        v6 = 8;
        goto LABEL_23;
      }
    }
    v6 = -1;
    goto LABEL_23;
  }
  return -1;
}

+ (id)stringBuiltInUnitEnum:(int)a3
{
  if (a3 > 8)
    return 0;
  else
    return off_24F3A7A28[a3];
}

@end
