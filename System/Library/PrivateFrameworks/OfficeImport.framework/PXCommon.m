@implementation PXCommon

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
  CXNamespace *v10;
  void *v11;
  CXNamespace *v12;
  void *v13;
  CXNamespace *v14;
  void *v15;

  if ((id)objc_opt_class() == a1)
  {
    v2 = -[CXNamespace initWithUri:]([CXNamespace alloc], "initWithUri:", "urn:schemas-microsoft-com:office:powerpoint");
    v3 = (void *)PXVmlNamespace;
    PXVmlNamespace = (uint64_t)v2;

    v4 = -[CXNamespace initWithUri:]([CXNamespace alloc], "initWithUri:", "http://schemas.microsoft.com/office/mac/powerpoint/2008/main");
    v5 = (void *)PXMacPowerPointNamespace;
    PXMacPowerPointNamespace = (uint64_t)v4;

    v6 = -[CXNamespace initWithUri:]([CXNamespace alloc], "initWithUri:", "http://schemas.microsoft.com/office/powerpoint/2010/main");
    v7 = (void *)PXPowerPoint2010Namespace;
    PXPowerPoint2010Namespace = (uint64_t)v6;

    v8 = -[CXNamespace initWithUri:]([CXNamespace alloc], "initWithUri:", "http://schemas.microsoft.com/office/powerpoint/2012/main");
    v9 = (void *)PXPowerPoint2012Namespace;
    PXPowerPoint2012Namespace = (uint64_t)v8;

    v10 = -[CXNamespace initWithUri:]([CXNamespace alloc], "initWithUri:", "http://schemas.openxmlformats.org/presentationml/2006/main");
    v11 = (void *)PXMainNamespace;
    PXMainNamespace = (uint64_t)v10;

    v12 = -[CXNamespace initWithUri:]([CXNamespace alloc], "initWithUri:", "http://schemas.openxmlformats.org/officeDocument/2006/relationships");
    v13 = (void *)PXRelationshipNamespace;
    PXRelationshipNamespace = (uint64_t)v12;

    v14 = -[CXNamespace initWithUri:]([CXNamespace alloc], "initWithUri:", "http://schemas.openxmlformats.org/drawingml/2006/main");
    v15 = (void *)PXOfficeArtNamespace;
    PXOfficeArtNamespace = (uint64_t)v14;

  }
}

@end
