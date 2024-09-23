@implementation PLCacheEntry

- (void)dealloc
{
  objc_super v3;

  free(self->_entry);
  v3.receiver = self;
  v3.super_class = (Class)PLCacheEntry;
  -[PLCacheEntry dealloc](&v3, sel_dealloc);
}

- (void)setObject:(id)a3
{
  id v5;

  if (self->_object != a3)
  {
    v5 = a3;

    self->_object = a3;
  }
}

- (id)object
{
  return self->_object;
}

- (lruEntry)lruListEntry
{
  lruEntry *result;

  result = self->_entry;
  if (!result)
  {
    result = (lruEntry *)malloc_type_calloc(1uLL, 0x20uLL, 0x10A00406268BE83uLL);
    self->_entry = result;
  }
  return result;
}

@end
