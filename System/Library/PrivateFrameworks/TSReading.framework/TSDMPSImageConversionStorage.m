@implementation TSDMPSImageConversionStorage

- (TSDMPSImageConversionStorage)init
{
  TSDMPSImageConversionStorage *v2;
  uint64_t v3;
  NSMapTable *storage;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSDMPSImageConversionStorage;
  v2 = -[TSDMPSImageConversionStorage init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    storage = v2->_storage;
    v2->_storage = (NSMapTable *)v3;

  }
  return v2;
}

- (void)removeAllObjects
{
  id v2;

  -[TSDMPSImageConversionStorage storage](self, "storage");
  v2 = (id)objc_claimAutoreleasedReturnValue();
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
