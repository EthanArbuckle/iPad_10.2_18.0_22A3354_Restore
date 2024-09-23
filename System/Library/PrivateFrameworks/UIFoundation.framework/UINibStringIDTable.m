@implementation UINibStringIDTable

- (BOOL)lookupKey:(id)a3 identifier:(int64_t *)a4
{
  uint64_t v7;
  UIStringIDTableBucket *v8;
  uint64_t v9;
  id var0;

  v7 = objc_msgSend(a3, "hash");
  v8 = self->table[self->hashMask & v7];
  if (!v8)
    return 0;
  v9 = v7;
  while (1)
  {
    if (v8->var1 == v9)
    {
      if (v8->var0 == a3)
      {
        *a4 = 0xAAAAAAAAAAAAAAABLL * (((char *)v8 - (char *)self->buckets) >> 3);
        return 1;
      }
      if ((objc_msgSend(v8->var0, "isEqualToString:", a3) & 1) != 0)
        break;
    }
    v8 = v8->var2;
    if (!v8)
      return 0;
  }
  var0 = v8->var0;
  *a4 = 0xAAAAAAAAAAAAAAABLL * (((char *)v8 - (char *)self->buckets) >> 3);
  if (var0 != a3)
  {

    v8->var0 = (id)objc_msgSend(a3, "copy");
  }
  return 1;
}

- (int64_t)count
{
  return self->count;
}

- (UINibStringIDTable)initWithKeysTransferingOwnership:(id *)a3 count:(unint64_t)a4
{
  UINibStringIDTable *v6;
  uint64_t v7;
  size_t v8;
  uint64_t v9;
  unint64_t v10;
  UIStringIDTableBucket *v11;
  uint64_t v12;
  unint64_t count;
  unint64_t v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)UINibStringIDTable;
  v6 = -[UINibStringIDTable init](&v16, sel_init);
  if (v6)
  {
    v7 = 2;
    do
    {
      v8 = v7;
      v7 *= 2;
    }
    while (v8 <= 2 * a4);
    v6->table = (UIStringIDTableBucket **)malloc_type_calloc(8uLL, v8, 0x2457B795uLL);
    v6->buckets = (UIStringIDTableBucket *)malloc_type_malloc(24 * a4, 0x10A0040319E9F20uLL);
    v6->hashMask = v8 - 1;
    v6->count = a4;
    if (a4)
    {
      v9 = 0;
      v10 = 0;
      do
      {
        v11 = &v6->buckets[v9];
        v12 = objc_msgSend(a3[v10], "hash");
        v11->var1 = v12;
        v11->var0 = a3[v10];
        count = v6->count;
        v14 = v6->hashMask & v12;
        v11->var2 = v6->table[v14];
        v6->table[v14] = v11;
        ++v10;
        ++v9;
      }
      while (v10 < count);
    }
  }
  return v6;
}

- (void)dealloc
{
  uint64_t v3;
  unint64_t v4;
  objc_super v5;

  if (self->count)
  {
    v3 = 0;
    v4 = 0;
    do
    {

      ++v4;
      ++v3;
    }
    while (v4 < self->count);
  }
  free(self->table);
  free(self->buckets);
  v5.receiver = self;
  v5.super_class = (Class)UINibStringIDTable;
  -[UINibStringIDTable dealloc](&v5, sel_dealloc);
}

@end
