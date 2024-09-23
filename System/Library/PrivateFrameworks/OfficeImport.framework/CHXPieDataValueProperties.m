@implementation CHXPieDataValueProperties

+ (id)chdDataValuePropertiesFromXmlElement:(_xmlNode *)a3 state:(id)a4
{
  id v5;
  CHDPieDataValueProperties *v6;
  void *v7;
  CXNamespace *v8;
  _xmlNode *v9;
  _xmlAttr *v10;
  void *v11;

  v5 = a4;
  v6 = objc_alloc_init(CHDPieDataValueProperties);
  objc_msgSend(v5, "drawingState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "OAXChartNamespace");
  v8 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v9 = (_xmlNode *)OCXFindChild(a3, v8, "explosion");

  if (v9)
  {
    v10 = CXRequiredUnsignedLongAttribute(v9, (CXNamespace *)CXNoNamespace, (xmlChar *)"val");
  }
  else
  {
    objc_msgSend(v5, "currentSeries");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (_xmlAttr *)objc_msgSend(v11, "explosion");

  }
  -[CHDPieDataValueProperties setExplosion:](v6, "setExplosion:", v10);

  return v6;
}

@end
