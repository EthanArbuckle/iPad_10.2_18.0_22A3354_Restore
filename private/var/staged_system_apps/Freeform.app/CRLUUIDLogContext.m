@implementation CRLUUIDLogContext

- (CRLUUIDLogContext)init
{
  CRLUUIDLogContext *v2;
  void *v3;
  uint64_t v4;
  NSString *publicString;
  NSString *privateString;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CRLUUIDLogContext;
  v2 = -[CRLUUIDLogContext init](&v8, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUIDString"));
    publicString = v2->_publicString;
    v2->_publicString = (NSString *)v4;

    privateString = v2->_privateString;
    v2->_privateString = (NSString *)&stru_1012A72B0;

  }
  return v2;
}

- (NSString)publicString
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)privateString
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateString, 0);
  objc_storeStrong((id *)&self->_publicString, 0);
}

@end
