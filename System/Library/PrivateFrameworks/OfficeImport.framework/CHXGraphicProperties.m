@implementation CHXGraphicProperties

+ (void)setGraphicPropertiesFromXmlElementWithGraphicProperties:(id)a3 element:(_xmlNode *)a4 state:(id)a5
{
  id v7;
  void *v8;
  CXNamespace *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  CXNamespace *v13;
  uint64_t v14;
  id v15;

  v15 = a3;
  v7 = a5;
  if (v15 && a4)
  {
    objc_msgSend(v7, "drawingState");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "OAXChartNamespace");
    v9 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v10 = OCXFindChild(a4, v9, "spPr");

    if (v10)
    {
      objc_msgSend(v7, "drawingState");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[OAXGraphic readPropertiesFromXmlNode:graphicProperties:drawingState:](OAXGraphic, "readPropertiesFromXmlNode:graphicProperties:drawingState:", v10, v15, v11);

    }
    objc_msgSend(v7, "drawingState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "OAXChartNamespace");
    v13 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v14 = OCXFindChild(a4, v13, "layout");

    if (v14)
      +[CHXLayout readFrom:graphicProperties:state:](CHXLayout, "readFrom:graphicProperties:state:", v14, v15, v7);
  }

}

+ (id)oadGraphicPropertiesFromXmlElementWithGraphicProperties:(_xmlNode *)a3 state:(id)a4
{
  id v6;
  OADGraphicProperties *v7;

  v6 = a4;
  v7 = objc_alloc_init(OADGraphicProperties);
  objc_msgSend(a1, "setGraphicPropertiesFromXmlElementWithGraphicProperties:element:state:", v7, a3, v6);

  return v7;
}

+ (BOOL)isGraphicPropertiesContainedByXmlElement:(_xmlNode *)a3 state:(id)a4
{
  id v5;
  void *v6;
  CXNamespace *v7;
  BOOL v8;
  void *v9;
  CXNamespace *v10;

  v5 = a4;
  objc_msgSend(v5, "drawingState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "OAXChartNamespace");
  v7 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  if (OCXFindChild(a3, v7, "spPr"))
  {
    v8 = 1;
  }
  else
  {
    objc_msgSend(v5, "drawingState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "OAXChartNamespace");
    v10 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v8 = OCXFindChild(a3, v10, "layout") != 0;

  }
  return v8;
}

@end
