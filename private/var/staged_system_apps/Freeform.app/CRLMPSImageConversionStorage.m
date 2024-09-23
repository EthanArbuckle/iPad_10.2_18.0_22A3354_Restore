@implementation CRLMPSImageConversionStorage

- (CRLMPSImageConversionStorage)init
{
  CRLMPSImageConversionStorage *v2;
  uint64_t v3;
  NSMapTable *storage;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLMPSImageConversionStorage;
  v2 = -[CRLMPSImageConversionStorage init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](NSMapTable, "strongToStrongObjectsMapTable"));
    storage = v2->_storage;
    v2->_storage = (NSMapTable *)v3;

  }
  return v2;
}

- (void)removeAllObjects
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[CRLMPSImageConversionStorage storage](self, "storage"));
  objc_msgSend(v2, "removeAllObjects");

}

- (NSMapTable)storage
{
  return self->_storage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
}

@end
