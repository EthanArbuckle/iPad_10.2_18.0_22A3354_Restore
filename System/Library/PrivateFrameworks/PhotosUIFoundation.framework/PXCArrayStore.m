@implementation PXCArrayStore

- (PXCArrayStore)initWithElementSize:(unint64_t)a3
{
  PXCArrayStore *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXCArrayStore;
  result = -[PXCArrayStore init](&v5, sel_init);
  if (result)
    result->_elementSize = a3;
  return result;
}

- (PXCArrayStore)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCArrayStore.m"), 29, CFSTR("%s is not available as initializer"), "-[PXCArrayStore init]");

  abort();
}

- (void)dealloc
{
  objc_super v3;

  free(self->_sharedArray);
  v3.receiver = self;
  v3.super_class = (Class)PXCArrayStore;
  -[PXCArrayStore dealloc](&v3, sel_dealloc);
}

- (void)accessArrayWithElementsCount:(unint64_t)a3 accessBlock:(id)a4
{
  void *v6;
  void *v7;
  void (**v8)(id, void *);

  v8 = (void (**)(id, void *))a4;
  if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") && !self->_isSharedArrayInUse)
  {
    v7 = -[PXCArrayStore _sharedArrayWithElementsCount:](self, "_sharedArrayWithElementsCount:", a3);
    self->_isSharedArrayInUse = 1;
    v8[2](v8, v7);
    self->_isSharedArrayInUse = 0;
  }
  else
  {
    v6 = malloc_type_calloc(a3, self->_elementSize, 0x3A0784A5uLL);
    v8[2](v8, v6);
    free(v6);
  }

}

- (void)_sharedArrayWithElementsCount:(unint64_t)a3
{
  unint64_t sharedArrayCapacity;
  void *result;

  sharedArrayCapacity = self->_sharedArrayCapacity;
  if (sharedArrayCapacity >= a3)
    return self->_sharedArray;
  if (!sharedArrayCapacity)
  {
    sharedArrayCapacity = 8;
    self->_sharedArrayCapacity = 8;
  }
  if (sharedArrayCapacity < a3)
  {
    do
      sharedArrayCapacity *= 2;
    while (sharedArrayCapacity < a3);
    self->_sharedArrayCapacity = sharedArrayCapacity;
  }
  result = malloc_type_realloc(self->_sharedArray, self->_elementSize * sharedArrayCapacity, 0xBCAF1ADFuLL);
  self->_sharedArray = result;
  return result;
}

@end
