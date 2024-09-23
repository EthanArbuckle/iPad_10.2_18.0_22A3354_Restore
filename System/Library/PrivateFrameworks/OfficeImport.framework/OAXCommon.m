@implementation OAXCommon

+ (void)initialize
{
  CXNamespace *v2;
  void *v3;
  CXNamespace *v4;
  void *v5;
  CXNamespace *v6;
  void *v7;
  CXNamespace *v8;
  void *v9;

  if ((id)objc_opt_class() == a1)
  {
    v2 = -[CXNamespace initWithUri:]([CXNamespace alloc], "initWithUri:", "http://schemas.openxmlformats.org/drawingml/2006/compatibility");
    v3 = (void *)OAXCompatNamespace;
    OAXCompatNamespace = (uint64_t)v2;

    v4 = -[CXNamespace initWithUri:]([CXNamespace alloc], "initWithUri:", "http://schemas.microsoft.com/office/drawing/2010/main");
    v5 = (void *)OAXDrawing2010Namespace;
    OAXDrawing2010Namespace = (uint64_t)v4;

    v6 = -[CXNamespace initWithUri:]([CXNamespace alloc], "initWithUri:", "http://schemas.microsoft.com/office/mac/drawingml/2008/main");
    v7 = (void *)OAXDrawingMac2008Namespace;
    OAXDrawingMac2008Namespace = (uint64_t)v6;

    v8 = -[CXNamespace initWithUri:]([CXNamespace alloc], "initWithUri:", "http://schemas.microsoft.com/office/drawing/2012/chart");
    v9 = (void *)OAXChart2012Namespace;
    OAXChart2012Namespace = (uint64_t)v8;

  }
}

@end
