@implementation CHXPieSeries

+ (id)chdSeriesFromXmlSeriesElement:(_xmlNode *)a3 state:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  CXNamespace *v9;
  _xmlNode *v10;
  _xmlAttr *v11;

  v5 = a4;
  objc_msgSend(v5, "chart");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CHDSeries seriesWithChart:](CHDPieSeries, "seriesWithChart:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "drawingState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "OAXChartNamespace");
  v9 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v10 = (_xmlNode *)OCXFindChild(a3, v9, "explosion");

  if (v10)
    v11 = CXRequiredUnsignedLongAttribute(v10, (CXNamespace *)CXNoNamespace, (xmlChar *)"val");
  else
    v11 = 0;
  objc_msgSend(v7, "setExplosion:", v11);

  return v7;
}

@end
