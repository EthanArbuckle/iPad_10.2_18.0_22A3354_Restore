@implementation CHXTrendline

+ (id)chdTrendlineFromXmlTrendlineElement:(_xmlNode *)a3 state:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  CXNamespace *v9;
  _xmlNode *v10;
  void *v11;
  CXNamespace *v12;
  _xmlNode *v13;
  void *v14;
  CXNamespace *v15;
  _xmlNode *v16;
  void *v17;
  CXNamespace *v18;
  _xmlNode *v19;
  void *v20;
  CXNamespace *v21;
  _xmlNode *v22;
  void *v23;
  CXNamespace *v24;
  _xmlNode *v25;
  void *v26;
  CXNamespace *v27;
  _xmlNode *v28;
  void *v29;
  CXNamespace *v30;
  OADGraphicProperties *v31;
  void *v32;
  CXNamespace *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  CXNamespace *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  double v43;

  v6 = a4;
  +[CHDTrendline trendline](CHDTrendline, "trendline");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "drawingState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "OAXChartNamespace");
  v9 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v10 = (_xmlNode *)OCXFindChild(a3, v9, "dispEq");

  if (v10)
    objc_msgSend(v7, "setDisplayEquation:", CXRequiredBoolAttribute(v10, (CXNamespace *)CXNoNamespace, (xmlChar *)"val"));
  objc_msgSend(v6, "drawingState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "OAXChartNamespace");
  v12 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v13 = (_xmlNode *)OCXFindChild(a3, v12, "dispRSqr");

  if (v13)
    objc_msgSend(v7, "setDisplayRSquaredValue:", CXRequiredBoolAttribute(v13, (CXNamespace *)CXNoNamespace, (xmlChar *)"val"));
  objc_msgSend(v6, "drawingState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "OAXChartNamespace");
  v15 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v16 = (_xmlNode *)OCXFindChild(a3, v15, "backward");

  if (v16)
  {
    v43 = 0.0;
    if (CXOptionalDoubleAttribute(v16, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", &v43))
      objc_msgSend(v7, "setBackward:", v43);
  }
  objc_msgSend(v6, "drawingState");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "OAXChartNamespace");
  v18 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v19 = (_xmlNode *)OCXFindChild(a3, v18, "forward");

  if (v19)
  {
    v43 = 0.0;
    if (CXOptionalDoubleAttribute(v19, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", &v43))
      objc_msgSend(v7, "setForward:", v43);
  }
  objc_msgSend(v6, "drawingState");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "OAXChartNamespace");
  v21 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v22 = (_xmlNode *)OCXFindChild(a3, v21, "intercept");

  if (v22)
  {
    v43 = 0.0;
    if (CXOptionalDoubleAttribute(v22, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", &v43))
      objc_msgSend(v7, "setInterceptYAxis:", v43);
  }
  objc_msgSend(v6, "drawingState");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "OAXChartNamespace");
  v24 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v25 = (_xmlNode *)OCXFindChild(a3, v24, "order");

  if (v25)
    objc_msgSend(v7, "setPolynomialOrder:", CXRequiredLongAttribute(v25, (CXNamespace *)CXNoNamespace, (xmlChar *)"val"));
  objc_msgSend(v6, "drawingState");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "OAXChartNamespace");
  v27 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v28 = (_xmlNode *)OCXFindChild(a3, v27, "period");

  if (v28)
    objc_msgSend(v7, "setMovingAveragePeriod:", CXRequiredLongAttribute(v28, (CXNamespace *)CXNoNamespace, (xmlChar *)"val"));
  objc_msgSend(v6, "drawingState");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "OAXChartNamespace");
  v30 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setType:", objc_msgSend(a1, "chdTrendlineTypeFromXmlTrendlineTypeElement:", OCXFindChild(a3, v30, "trendlineType")));

  v31 = objc_alloc_init(OADGraphicProperties);
  +[CHXGraphicProperties setGraphicPropertiesFromXmlElementWithGraphicProperties:element:state:](CHXGraphicProperties, "setGraphicPropertiesFromXmlElementWithGraphicProperties:element:state:", v31, a3, v6);
  objc_msgSend(v7, "setGraphicProperties:", v31);
  objc_msgSend(v6, "drawingState");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "OAXChartNamespace");
  v33 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v34 = OCXFindChild(a3, v33, "trendlineLbl");

  if (v34)
  {
    +[CHXTrendlineLabel chdTrendlineLabelFromXmlTrendlineLabelElement:state:](CHXTrendlineLabel, "chdTrendlineLabelFromXmlTrendlineLabelElement:state:", v34, v6);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLabel:", v35);

  }
  objc_msgSend(v6, "drawingState");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "OAXChartNamespace");
  v37 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v38 = OCXFindChild(a3, v37, "name");

  if (v38)
  {
    v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "tc_initWithContentOfXmlNode:", v38);
    v40 = v39;
    if (v39 && objc_msgSend(v39, "length"))
    {
      +[EDString edStringWithString:](EDString, "edStringWithString:", v40);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setName:", v41);

    }
  }

  return v7;
}

+ (int)chdTrendlineTypeFromXmlTrendlineTypeElement:(_xmlNode *)a3
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
      if ((objc_msgSend(v4, "isEqualToString:", CFSTR("exp")) & 1) != 0)
      {
        v6 = 0;
LABEL_8:

        return v6;
      }
      if ((objc_msgSend(v5, "isEqualToString:", CFSTR("linear")) & 1) == 0)
      {
        if ((objc_msgSend(v5, "isEqualToString:", CFSTR("log")) & 1) != 0)
        {
          v6 = 2;
          goto LABEL_8;
        }
        if ((objc_msgSend(v5, "isEqualToString:", CFSTR("movingAvg")) & 1) != 0)
        {
          v6 = 3;
          goto LABEL_8;
        }
        if ((objc_msgSend(v5, "isEqualToString:", CFSTR("poly")) & 1) != 0)
        {
          v6 = 4;
          goto LABEL_8;
        }
        if ((objc_msgSend(v5, "isEqualToString:", CFSTR("power")) & 1) != 0)
        {
          v6 = 5;
          goto LABEL_8;
        }
      }
    }
    v6 = 1;
    goto LABEL_8;
  }
  return 1;
}

+ (id)stringFromTrendlineTypeEnum:(int)a3
{
  if (a3 > 5)
    return CFSTR("linear");
  else
    return off_24F3A79F8[a3];
}

@end
