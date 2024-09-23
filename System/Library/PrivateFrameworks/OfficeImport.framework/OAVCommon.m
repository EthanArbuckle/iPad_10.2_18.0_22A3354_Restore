@implementation OAVCommon

+ (void)initialize
{
  CXNamespace *v2;
  void *v3;
  CXNamespace *v4;
  void *v5;
  CXNamespace *v6;
  void *v7;

  if ((id)objc_opt_class() == a1)
  {
    v2 = -[CXNamespace initWithUri:]([CXNamespace alloc], "initWithUri:", "urn:schemas-microsoft-com:office:office");
    v3 = (void *)OAVOfficeDrawingNamespace;
    OAVOfficeDrawingNamespace = (uint64_t)v2;

    v4 = -[CXNamespace initWithUri:]([CXNamespace alloc], "initWithUri:", "urn:schemas-microsoft-com:vml");
    v5 = (void *)OAVOfficeMainNamespace;
    OAVOfficeMainNamespace = (uint64_t)v4;

    v6 = -[CXNamespace initWithUri:]([CXNamespace alloc], "initWithUri:", "http://macVmlSchemaUri");
    v7 = (void *)OAVMacVmlNamespace;
    OAVMacVmlNamespace = (uint64_t)v6;

  }
}

@end
