@implementation NSStorage

- (void)pointerToElement:(unint64_t)a3 directlyAccessibleElements:(_NSRange *)a4
{
  return (void *)CFStorageGetValueAtIndex();
}

- (unint64_t)count
{
  return CFStorageGetCount();
}

- (void)removeElementsInRange:(_NSRange)a3
{
  CFStorageDeleteValues();
}

- (NSStorage)initWithElementSize:(unint64_t)a3 capacity:(unint64_t)a4
{
  NSStorage *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)NSStorage;
  v4 = -[NSStorage init](&v6, sel_init);
  v4->_storage = (id)CFStorageCreate();
  return v4;
}

- (void)insertElements:(void *)a3 count:(unint64_t)a4 atIndex:(unint64_t)a5
{
  CFStorageInsertValues();
  if (a3)
    CFStorageReplaceValues();
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
    objc_msgSend(a1, "setVersion:", 1);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSStorage;
  -[NSStorage dealloc](&v3, sel_dealloc);
}

- (void)elementAtIndex:(unint64_t)a3
{
  return (void *)CFStorageGetValueAtIndex();
}

- (NSStorage)init
{
  return -[NSStorage initWithElementSize:capacity:](self, "initWithElementSize:capacity:", 8, 0);
}

- (unint64_t)capacity
{
  return __CFStorageGetCapacity();
}

- (void)setHintCapacity:(unint64_t)a3
{
  self->_hintCapacity = a3;
}

- (unint64_t)hintCapacity
{
  return self->_hintCapacity;
}

- (unint64_t)elementSize
{
  return __CFStorageGetValueSize();
}

- (void)removeElementAtIndex:(unint64_t)a3
{
  CFStorageDeleteValues();
}

- (void)replaceElementAtIndex:(unint64_t)a3 withElement:(void *)a4
{
  CFStorageReplaceValues();
}

- (void)insertElement:(void *)a3 atIndex:(unint64_t)a4
{
  -[NSStorage insertElements:count:atIndex:](self, "insertElements:count:atIndex:", a3, 1, a4);
}

- (void)addElement:(void *)a3
{
  -[NSStorage insertElements:count:atIndex:](self, "insertElements:count:atIndex:", a3, 1, -[NSStorage count](self, "count"));
}

- (id)description
{
  CFStringRef v2;

  v2 = CFCopyDescription(self->_storage);
  return (id)(id)CFMakeCollectable(v2);
}

- (void)enumerateElementsUsingBlock:(id)a3
{
  uint64_t Count;
  uint64_t v5;
  uint64_t v6;
  uint64_t ValueAtIndex;
  BOOL v8;
  char v9;

  Count = CFStorageGetCount();
  if (Count)
  {
    v5 = 0;
    v6 = Count - 1;
    do
    {
      v9 = 0;
      ValueAtIndex = CFStorageGetValueAtIndex();
      (*((void (**)(id, uint64_t, uint64_t, char *))a3 + 2))(a3, ValueAtIndex, v5, &v9);
      if (v9)
        v8 = 1;
      else
        v8 = v6 == v5;
      ++v5;
    }
    while (!v8);
  }
}

@end
