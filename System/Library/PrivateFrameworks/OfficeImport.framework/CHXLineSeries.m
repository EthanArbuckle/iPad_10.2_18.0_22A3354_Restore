@implementation CHXLineSeries

+ (id)chdSeriesFromXmlSeriesElement:(_xmlNode *)a3 state:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  CXNamespace *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  CXNamespace *v13;
  _xmlNode *v14;

  v5 = a4;
  objc_msgSend(v5, "chart");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CHDSeries seriesWithChart:](CHDLineSeries, "seriesWithChart:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "drawingState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "OAXChartNamespace");
  v9 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v10 = OCXFindChild(a3, v9, "marker");

  +[CHXMarker chdMarkerFromXmlMarkerElement:state:](CHXMarker, "chdMarkerFromXmlMarkerElement:state:", v10, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMarker:", v11);
  objc_msgSend(v5, "drawingState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "OAXChartNamespace");
  v13 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v14 = (_xmlNode *)OCXFindChild(a3, v13, "smooth");

  if (v14)
    objc_msgSend(v7, "setSmooth:", CXRequiredBoolAttribute(v14, (CXNamespace *)CXNoNamespace, (xmlChar *)"val"));

  return v7;
}

@end
