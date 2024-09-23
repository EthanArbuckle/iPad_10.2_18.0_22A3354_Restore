@implementation CHXBar3DSeries

+ (id)chdSeriesFromXmlSeriesElement:(_xmlNode *)a3 state:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  CXNamespace *v9;
  uint64_t v10;
  void *v11;

  v5 = a4;
  objc_msgSend(v5, "chart");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[CHDSeries seriesWithChart:](CHDBar3DSeries, "seriesWithChart:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "drawingState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "OAXChartNamespace");
  v9 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v10 = OCXFindChild(a3, v9, "shape");

  if (v10)
  {
    objc_msgSend(v7, "setShapeType:", +[CHXChartType chdShapeTypeFromXmlShapeTypeElement:](CHXChartType, "chdShapeTypeFromXmlShapeTypeElement:", v10));
  }
  else
  {
    objc_msgSend(v5, "currentChartType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setShapeType:", objc_msgSend(v11, "shapeType"));

  }
  return v7;
}

@end
