@implementation PXGComponentDataStore

- (const)contents
{
  return self->_data;
}

- (unint64_t)elementSize
{
  return self->_elementSize;
}

- (void)setCapacity:(int64_t)a3
{
  int64_t capacity;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  char *v9;
  void *v11;

  capacity = self->_capacity;
  if (capacity != a3)
  {
    if (capacity >= a3)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGComponentDataStore.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("capacity > _capacity"));

    }
    v6 = -[PXGComponentDataStore elementSize](self, "elementSize");
    v7 = self->_capacity * v6;
    v8 = v6 * a3;
    self->_capacity = a3;
    v9 = (char *)malloc_type_realloc(self->_data, v6 * a3, 0xFA539D40uLL);
    self->_data = v9;
    bzero(&v9[v7], v8 - v7);
  }
}

- (unint64_t)byteSize
{
  int64_t v3;

  v3 = -[PXGComponentDataStore capacity](self, "capacity");
  return -[PXGComponentDataStore elementSize](self, "elementSize") * v3;
}

- (int64_t)capacity
{
  return self->_capacity;
}

- (PXGComponentDataStore)initWithElementSize:(unint64_t)a3
{
  PXGComponentDataStore *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXGComponentDataStore;
  result = -[PXGComponentDataStore init](&v5, sel_init);
  if (result)
    result->_elementSize = a3;
  return result;
}

- (id)mutableCopy
{
  PXGMutableComponentDataStore *v3;

  v3 = -[PXGComponentDataStore initWithElementSize:]([PXGMutableComponentDataStore alloc], "initWithElementSize:", -[PXGComponentDataStore elementSize](self, "elementSize"));
  -[PXGMutableComponentDataStore setContentsFrom:](v3, "setContentsFrom:", self);
  return v3;
}

- (PXGComponentDataStore)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGComponentDataStore.m"), 27, CFSTR("%s is not available as initializer"), "-[PXGComponentDataStore init]");

  abort();
}

- (void)dealloc
{
  char *data;
  objc_super v4;

  data = self->_data;
  if (data)
    free(data);
  v4.receiver = self;
  v4.super_class = (Class)PXGComponentDataStore;
  -[PXGComponentDataStore dealloc](&v4, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  PXGComponentDataStore *v7;
  unsigned __int8 v8;
  objc_super v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = objc_msgSend(v5, "capacity");
    if (v6 == -[PXGComponentDataStore capacity](self, "capacity"))
    {
      v7 = objc_retainAutorelease(self);
      v8 = memcmp(-[PXGComponentDataStore contents](v7, "contents"), (const void *)objc_msgSend(objc_retainAutorelease(v5), "contents"), -[PXGComponentDataStore byteSize](v7, "byteSize")) == 0;
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)PXGComponentDataStore;
    v8 = -[PXGComponentDataStore isEqual:](&v10, sel_isEqual_, v4);
  }

  return v8;
}

@end
