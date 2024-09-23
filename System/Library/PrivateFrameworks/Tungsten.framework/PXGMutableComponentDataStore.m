@implementation PXGMutableComponentDataStore

- (void)setContentsFrom:(id)a3
{
  id v5;
  unint64_t v6;
  PXGMutableComponentDataStore *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a3;
  v6 = -[PXGComponentDataStore elementSize](self, "elementSize");
  if (v6 != objc_msgSend(v5, "elementSize"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGComponentDataStore.m"), 92, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("self.elementSize == dataStore.elementSize"));

  }
  -[PXGComponentDataStore setCapacity:](self, "setCapacity:", objc_msgSend(v5, "capacity"));
  v7 = objc_retainAutorelease(self);
  v8 = -[PXGMutableComponentDataStore mutableContents](v7, "mutableContents");
  v10 = objc_retainAutorelease(v5);
  memcpy(v8, (const void *)objc_msgSend(v10, "contents"), -[PXGComponentDataStore byteSize](v7, "byteSize"));

}

- (void)mutableContents
{
  return (void *)-[PXGComponentDataStore contents](objc_retainAutorelease(self), "contents");
}

@end
