@implementation PXGIndexSetArray

- (void)setCount:(int64_t)a3
{
  int64_t capacity;
  int64_t v6;
  int64_t v7;

  capacity = self->_capacity;
  if (capacity < a3)
  {
    v6 = a3;
    if (capacity)
    {
      v6 = self->_capacity;
      do
        v6 *= 2;
      while (v6 < a3);
    }
    self->_capacity = v6;
    for (self->_indexSetReferences = (void **)malloc_type_realloc(self->_indexSetReferences, 8 * v6, 0xFA539D40uLL);
          capacity < self->_capacity;
          ++capacity)
    {
      self->_indexSetReferences[capacity] = objc_alloc_init(MEMORY[0x24BDD1698]);
    }
  }
  if (self->_count > a3)
  {
    v7 = a3;
    do
      objc_msgSend(self->_indexSetReferences[v7++], "removeAllIndexes");
    while (v7 < self->_count);
  }
  self->_count = a3;
}

- (void)indexSetReferences
{
  return self->_indexSetReferences;
}

- (void)removeAllIndexes
{
  int64_t v3;

  if (self->_count >= 1)
  {
    v3 = 0;
    do
      objc_msgSend(self->_indexSetReferences[v3++], "removeAllIndexes");
    while (v3 < self->_count);
  }
}

- (void)dealloc
{
  int64_t v3;
  void **indexSetReferences;
  objc_super v5;

  if (self->_capacity >= 1)
  {
    v3 = 0;
    do

    while (v3 < self->_capacity);
  }
  indexSetReferences = self->_indexSetReferences;
  if (indexSetReferences)
    free(indexSetReferences);
  v5.receiver = self;
  v5.super_class = (Class)PXGIndexSetArray;
  -[PXGIndexSetArray dealloc](&v5, sel_dealloc);
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  PXGIndexSetArray *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = objc_alloc(MEMORY[0x24BDD16A8]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p,"), v5, self);

  v7 = objc_retainAutorelease(self);
  v8 = -[PXGIndexSetArray indexSetReferences](v7, "indexSetReferences");
  if (-[PXGIndexSetArray count](v7, "count") >= 1)
  {
    v9 = 0;
    do
    {
      objc_msgSend(*(id *)(v8 + 8 * v9), "px_shortDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "appendFormat:", CFSTR(" %li:%@"), v9, v10);

      ++v9;
    }
    while (v9 < -[PXGIndexSetArray count](v7, "count"));
  }
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (int64_t)count
{
  return self->_count;
}

@end
