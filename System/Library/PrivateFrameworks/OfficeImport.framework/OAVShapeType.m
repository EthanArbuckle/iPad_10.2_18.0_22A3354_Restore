@implementation OAVShapeType

+ (id)readFromShapeType:(_xmlNode *)a3 state:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  CXRequiredStringAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"id");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShapeType:forId:", (unsigned __int16)CXRequiredUnsignedLongAttribute(a3, (CXNamespace *)OAVOfficeDrawingNamespace, (xmlChar *)"spt"), v6);

  return 0;
}

@end
