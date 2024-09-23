@implementation TSUIntToIntDictionary

- (TSUIntToIntDictionary)init
{
  return -[TSUIntToIntDictionary initWithCapacity:](self, "initWithCapacity:", 0);
}

- (TSUIntToIntDictionary)initWithCapacity:(unint64_t)a3
{
  TSUIntToIntDictionary *v4;
  objc_super v6;
  CFDictionaryValueCallBacks valueCallBacks;
  CFDictionaryKeyCallBacks keyCallBacks;

  keyCallBacks.version = *MEMORY[0x24BDBD6A0];
  keyCallBacks.retain = 0;
  keyCallBacks.release = 0;
  keyCallBacks.copyDescription = (CFDictionaryCopyDescriptionCallBack)-[TSUIntToIntDictionary initWithCapacity:]::Local::IntegerKeyDescription;
  keyCallBacks.equal = 0;
  keyCallBacks.hash = 0;
  valueCallBacks.version = *MEMORY[0x24BDBD6B0];
  valueCallBacks.retain = 0;
  valueCallBacks.release = 0;
  valueCallBacks.copyDescription = (CFDictionaryCopyDescriptionCallBack)-[TSUIntToIntDictionary initWithCapacity:]::Local::IntegerKeyDescription;
  valueCallBacks.equal = 0;
  v6.receiver = self;
  v6.super_class = (Class)TSUIntToIntDictionary;
  v4 = -[TSUIntToIntDictionary init](&v6, sel_init);
  if (v4)
    v4->mDictionary = CFDictionaryCreateMutable(0, a3, &keyCallBacks, &valueCallBacks);
  return v4;
}

- (uint64_t)initWithCapacity:(uint64_t)a1
{
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%p"), a1);
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->mDictionary);
  v3.receiver = self;
  v3.super_class = (Class)TSUIntToIntDictionary;
  -[TSUIntToIntDictionary dealloc](&v3, sel_dealloc);
}

- (unint64_t)count
{
  return CFDictionaryGetCount(self->mDictionary);
}

- (BOOL)intIsPresentForKey:(int64_t)a3 outValue:(int64_t *)a4
{
  return CFDictionaryGetValueIfPresent(self->mDictionary, (const void *)a3, (const void **)a4) != 0;
}

- (int64_t)intForKey:(int64_t)a3
{
  return (int64_t)CFDictionaryGetValue(self->mDictionary, (const void *)a3);
}

- (void)removeIntForKey:(int64_t)a3
{
  CFDictionaryRemoveValue(self->mDictionary, (const void *)a3);
}

- (void)setInt:(int64_t)a3 forKey:(int64_t)a4
{
  CFDictionarySetValue(self->mDictionary, (const void *)a4, (const void *)a3);
}

- (void)removeAllInts
{
  CFDictionaryRemoveAllValues(self->mDictionary);
}

- (id)keyEnumerator
{
  return -[TSUIntToIntDictionaryKeyEnumerator initWithIntegerKeyDictionary:]([TSUIntToIntDictionaryKeyEnumerator alloc], "initWithIntegerKeyDictionary:", self);
}

- (BOOL)containsKey:(int64_t)a3
{
  return CFDictionaryGetCountOfKey(self->mDictionary, (const void *)a3) != 0;
}

- (void)applyFromIntToIntDictionary:(id)a3
{
  size_t v5;
  const void **v6;
  uint64_t v7;
  unsigned int v8;

  if (a3)
  {
    v5 = objc_msgSend(a3, "count");
    v6 = (const void **)malloc_type_calloc(v5, 8uLL, 0x10040436913F5uLL);
    CFDictionaryGetKeysAndValues((CFDictionaryRef)objc_msgSend(a3, "p_cfDictionary"), v6, 0);
    if (v5)
    {
      v7 = 0;
      v8 = 1;
      do
      {
        -[TSUIntToIntDictionary setInt:forKey:](self, "setInt:forKey:", objc_msgSend(a3, "intForKey:", v6[v7]), v6[v7]);
        v7 = v8;
      }
      while (v5 > v8++);
    }
    free(v6);
  }
}

- (id)arrayOfBoxedKeys
{
  size_t v3;
  void *v4;
  const void **v5;
  uint64_t v6;
  unsigned int v7;
  void *v8;
  void *v10;

  v3 = -[TSUIntToIntDictionary count](self, "count");
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[TSUIntToIntDictionary count](self, "count"));
  v5 = (const void **)malloc_type_calloc(v3, 8uLL, 0x10040436913F5uLL);
  CFDictionaryGetKeysAndValues(-[TSUIntToIntDictionary p_cfDictionary](self, "p_cfDictionary"), v5, 0);
  if (v3)
  {
    v6 = 0;
    v7 = 1;
    do
    {
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInteger:", v5[v6]);
      objc_msgSend(v4, "addObject:", v8);

      v6 = v7;
    }
    while (v3 > v7++);
  }
  free(v5);
  v10 = (void *)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v4);

  return v10;
}

- (id)allKeys
{
  size_t v3;
  id v4;
  const void **v5;
  const void **v6;
  uint64_t v7;

  v3 = -[TSUIntToIntDictionary count](self, "count");
  v4 = objc_alloc_init(MEMORY[0x24BDD1698]);
  v5 = (const void **)malloc_type_calloc(v3, 8uLL, 0x100004000313F17uLL);
  CFDictionaryGetKeysAndValues(-[TSUIntToIntDictionary p_cfDictionary](self, "p_cfDictionary"), v5, 0);
  if (v3)
  {
    v6 = v5;
    do
    {
      v7 = (uint64_t)*v6++;
      objc_msgSend(v4, "addIndex:", v7);
      --v3;
    }
    while (v3);
  }
  free(v5);
  return v4;
}

- (id)allValues
{
  size_t v3;
  id v4;
  const void **v5;
  const void **v6;
  uint64_t v7;

  v3 = -[TSUIntToIntDictionary count](self, "count");
  v4 = objc_alloc_init(MEMORY[0x24BDD1698]);
  v5 = (const void **)malloc_type_calloc(v3, 8uLL, 0x100004000313F17uLL);
  CFDictionaryGetKeysAndValues(-[TSUIntToIntDictionary p_cfDictionary](self, "p_cfDictionary"), 0, v5);
  if (v3)
  {
    v6 = v5;
    do
    {
      v7 = (uint64_t)*v6++;
      objc_msgSend(v4, "addIndex:", v7);
      --v3;
    }
    while (v3);
  }
  free(v5);
  return v4;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  TSUIntToIntDictionary *v4;

  v4 = objc_alloc_init(TSUIntToIntDictionary);
  v4->mDictionary = CFDictionaryCreateMutableCopy(0, 0, self->mDictionary);
  return v4;
}

- (id)description
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t i;
  int64_t v7;

  v3 = -[TSUIntToIntDictionary keyEnumerator](self, "keyEnumerator");
  v4 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  objc_msgSend(v4, "appendString:", CFSTR("{\n"));
  v5 = objc_msgSend(v3, "nextKey");
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    for (i = v5; i != 0x7FFFFFFFFFFFFFFFLL; i = objc_msgSend(v3, "nextKey"))
    {
      v7 = -[TSUIntToIntDictionary intForKey:](self, "intForKey:", i);
      objc_msgSend(v4, "appendString:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld = %ld;\n"), i, v7));
    }
  }
  objc_msgSend(v4, "appendString:", CFSTR("}"));
  return v4;
}

- (__CFDictionary)p_cfDictionary
{
  return self->mDictionary;
}

@end
