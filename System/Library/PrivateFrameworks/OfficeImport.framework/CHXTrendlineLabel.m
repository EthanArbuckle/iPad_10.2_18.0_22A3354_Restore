@implementation CHXTrendlineLabel

+ (id)chdTrendlineLabelFromXmlTrendlineLabelElement:(_xmlNode *)a3 state:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  CXNamespace *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  CXNamespace *v15;
  _xmlNode *v16;
  _BOOL4 v17;
  id v18;
  void *v19;
  void *v20;
  OADGraphicProperties *v21;
  double v23;
  id v24;
  id v25;
  id v26;

  v5 = a4;
  objc_msgSend(v5, "resources");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CHDTrendlineLabel trendlineLabelWithResources:](CHDTrendlineLabel, "trendlineLabelWithResources:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "drawingState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "OAXChartNamespace");
  v9 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v10 = OCXFindChild(a3, v9, "tx");

  if (v10)
  {
    v25 = 0;
    v26 = 0;
    +[CHXString readFromXmlTxElement:formula:lastCached:state:](CHXString, "readFromXmlTxElement:formula:lastCached:state:", v10, &v26, &v25, v5);
    v11 = v26;
    v12 = v25;
    objc_msgSend(v5, "chart");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setName:chart:", v11, v13);

    objc_msgSend(v7, "setLastCachedName:", v12);
  }
  objc_msgSend(v5, "drawingState");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "OAXChartNamespace");
  v15 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v16 = (_xmlNode *)OCXFindChild(a3, v15, "numFmt");

  if (v16)
  {
    v24 = 0;
    v17 = CXOptionalStringAttribute(v16, (void *)CXNoNamespace, (xmlChar *)"formatCode", &v24);
    v18 = v24;
    if (v17)
    {
      +[EDString edStringWithString:](EDString, "edStringWithString:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[EDContentFormat contentFormatWithFormatString:](EDContentFormat, "contentFormatWithFormatString:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "setContentFormat:", v20);
    }
    v23 = 0.0;
    if (CXOptionalDoubleAttribute(v16, (CXNamespace *)CXNoNamespace, (xmlChar *)"sourceLinked", &v23))
      objc_msgSend(v7, "setIsContentFormatDerivedFromDataPoints:", v23 == 1.0, v23);

  }
  v21 = objc_alloc_init(OADGraphicProperties);
  +[CHXGraphicProperties setGraphicPropertiesFromXmlElementWithGraphicProperties:element:state:](CHXGraphicProperties, "setGraphicPropertiesFromXmlElementWithGraphicProperties:element:state:", v21, a3, v5);
  objc_msgSend(v7, "setGraphicProperties:", v21);

  return v7;
}

@end
