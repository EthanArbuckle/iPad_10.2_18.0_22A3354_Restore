@implementation OCXCommon

+ (void)initialize
{
  CXNamespace *v2;
  void *v3;
  CXNamespace *v4;
  void *v5;

  if ((id)objc_opt_class() == a1)
  {
    v2 = -[CXNamespace initWithUri:]([CXNamespace alloc], "initWithUri:", "http://schemas.openxmlformats.org/markup-compatibility/2006");
    v3 = (void *)OCXMarkupCompatibilityNamespace;
    OCXMarkupCompatibilityNamespace = (uint64_t)v2;

    v4 = -[CXNamespace initWithUri:]([CXNamespace alloc], "initWithUri:", "http://schemas.openxmlformats.org/drawingml/2006/main");
    v5 = (void *)OCXDrawingNamespace;
    OCXDrawingNamespace = (uint64_t)v4;

  }
}

@end
