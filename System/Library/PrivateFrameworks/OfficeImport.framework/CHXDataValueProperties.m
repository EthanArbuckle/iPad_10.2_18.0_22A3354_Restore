@implementation CHXDataValueProperties

+ (id)readFrom:(_xmlNode *)a3 state:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  CXNamespace *v9;
  _xmlNode *v10;
  void *v11;
  CXNamespace *v12;
  uint64_t v13;
  void *v14;
  OADGraphicProperties *v15;

  v6 = a4;
  objc_msgSend((id)objc_msgSend(a1, "chxDataValuePropertiesClassWithState:", v6), "chdDataValuePropertiesFromXmlElement:state:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "drawingState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "OAXChartNamespace");
  v9 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v10 = OCXFindRequiredChild(a3, v9, (xmlChar *)"idx");

  objc_msgSend(v7, "setDataValueIndex:", CXRequiredUnsignedLongAttribute(v10, (CXNamespace *)CXNoNamespace, (xmlChar *)"val"));
  objc_msgSend(v6, "drawingState");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "OAXChartNamespace");
  v12 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v13 = OCXFindChild(a3, v12, "marker");

  if (v13)
  {
    +[CHXMarker chdMarkerFromXmlMarkerElement:state:](CHXMarker, "chdMarkerFromXmlMarkerElement:state:", v13, v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMarker:", v14);

  }
  if (+[CHXGraphicProperties isGraphicPropertiesContainedByXmlElement:state:](CHXGraphicProperties, "isGraphicPropertiesContainedByXmlElement:state:", a3, v6))
  {
    v15 = objc_alloc_init(OADGraphicProperties);
    +[CHXGraphicProperties setGraphicPropertiesFromXmlElementWithGraphicProperties:element:state:](CHXGraphicProperties, "setGraphicPropertiesFromXmlElementWithGraphicProperties:element:state:", v15, a3, v6);
    objc_msgSend(v7, "setGraphicProperties:", v15);

  }
  return v7;
}

+ (Class)chxDataValuePropertiesClassWithState:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend(v3, "currentChartType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_opt_isKindOfClass();

  objc_opt_class();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v5;
}

+ (id)chdDataValuePropertiesFromXmlElement:(_xmlNode *)a3 state:(id)a4
{
  return objc_alloc_init(CHDDataValueProperties);
}

@end
