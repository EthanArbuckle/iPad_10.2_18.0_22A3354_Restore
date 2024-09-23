@implementation CHXStockType

+ (id)chdChartTypeFromXmlChartTypeElement:(_xmlNode *)a3 state:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  void *v13;

  v5 = a4;
  +[CHXLine2DType chdChartTypeFromXmlChartTypeElement:state:](CHXLine2DType, "chdChartTypeFromXmlChartTypeElement:state:", a3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chart");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "plotArea");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "chartTypes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndex:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "chart");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "plotArea");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setContainsVolumeStockType:", 1);

  }
  else
  {
    objc_msgSend(v6, "setStockType:", 1);
  }

  return v6;
}

@end
