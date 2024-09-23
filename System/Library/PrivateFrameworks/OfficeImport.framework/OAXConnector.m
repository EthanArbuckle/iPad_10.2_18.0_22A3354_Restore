@implementation OAXConnector

+ (id)readFromXmlNode:(_xmlNode *)a3 inNamespace:(id)a4 drawingState:(id)a5
{
  CXNamespace *v8;
  id v9;
  OADConnector *v10;
  uint64_t v11;
  void *v12;

  v8 = (CXNamespace *)a4;
  v9 = a5;
  v10 = objc_alloc_init(OADConnector);
  v11 = OCXFindChild(a3, v8, "nvCxnSpPr");
  if (!v11)
    +[TCMessageException raise:](TCMessageException, "raise:", OABadFormat);
  +[OAXDrawable readNonVisualPropertiesFromDrawableXmlNode:inNamespace:visualNodeName:toDrawable:drawingState:](OAXDrawable, "readNonVisualPropertiesFromDrawableXmlNode:inNamespace:visualNodeName:toDrawable:drawingState:", a3, v8, "nvCxnSpPr", v10, v9);
  -[OADConnector connectorProperties](v10, "connectorProperties");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "readNonVisualConnectorProperties:inNamespace:connectorProperties:drawingState:", v11, v8, v12, v9);
  +[OAXShape readCoreFromXmlNode:inNamespace:toShape:drawingState:](OAXShape, "readCoreFromXmlNode:inNamespace:toShape:drawingState:", a3, v8, v10, v9);

  return v10;
}

+ (void)readConnectionFromParent:(_xmlNode *)a3 nodeName:(const char *)a4 connection:(id)a5 drawingState:(id)a6
{
  CXNamespace *v9;
  _xmlNode *v10;
  _xmlAttr *v11;
  _xmlAttr *v12;
  id v13;

  v13 = a5;
  objc_msgSend(a6, "OAXMainNamespace");
  v9 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  v10 = (_xmlNode *)OCXFindChild(a3, v9, a4);

  v11 = CXRequiredLongAttribute(v10, (CXNamespace *)CXNoNamespace, (xmlChar *)"id");
  v12 = CXRequiredLongAttribute(v10, (CXNamespace *)CXNoNamespace, (xmlChar *)"idx");
  objc_msgSend(v13, "setDrawableId:", v11);
  objc_msgSend(v13, "setLocationIndex:", v12);

}

+ (void)readNonVisualConnectorProperties:(_xmlNode *)a3 inNamespace:(id)a4 connectorProperties:(id)a5 drawingState:(id)a6
{
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  CXNamespace *v15;

  v15 = (CXNamespace *)a4;
  v10 = a5;
  v11 = a6;
  +[OAXShape readNonVisualShapeProperties:nodeName:inNamespace:shapeProperties:](OAXShape, "readNonVisualShapeProperties:nodeName:inNamespace:shapeProperties:", a3, "cNvCxnSpPr", v15, v10);
  v12 = OCXFindChild(a3, v15, "cNvCxnSpPr");
  if (v12)
  {
    objc_msgSend(v10, "from");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "readConnectionFromParent:nodeName:connection:drawingState:", v12, "stCxn", v13, v11);

    objc_msgSend(v10, "to");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "readConnectionFromParent:nodeName:connection:drawingState:", v12, "endCxn", v14, v11);

  }
}

@end
