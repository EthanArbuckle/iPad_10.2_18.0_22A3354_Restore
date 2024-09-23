@implementation CHXUnsupportedType

+ (id)chdChartTypeFromXmlChartTypeElement:(_xmlNode *)a3 state:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  CXNamespace *v8;
  _BOOL4 HasName;
  void *v10;
  CXNamespace *v11;
  void *v12;
  CXNamespace *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;

  v5 = a4;
  v6 = (void *)objc_opt_class();
  objc_msgSend(v5, "drawingState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "OAXChartNamespace");
  v8 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  HasName = CXNodeHasName(a3, v8, (xmlChar *)"radarChart");

  if (HasName)
    v6 = (void *)objc_opt_class();
  objc_msgSend(v5, "drawingState");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "OAXChartNamespace");
  v11 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  if (CXNodeHasName(a3, v11, (xmlChar *)"surfaceChart"))
  {

LABEL_6:
    v6 = (void *)objc_opt_class();
    goto LABEL_7;
  }
  objc_msgSend(v5, "drawingState");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "OAXChartNamespace");
  v13 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v14 = CXNodeHasName(a3, v13, (xmlChar *)"surface3DChart");

  if (v14)
    goto LABEL_6;
LABEL_7:
  objc_msgSend(v5, "chart");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "chartTypeWithChart:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

@end
