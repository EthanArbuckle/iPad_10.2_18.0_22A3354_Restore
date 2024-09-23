@implementation TSUNoCopyDictionary

- (id)objectForKey:(id)a3
{
  return (id)CFDictionaryGetValue(self->mDictionary, a3);
}

- (TSUNoCopyDictionary)init
{
  return -[TSUNoCopyDictionary initWithCapacity:](self, "initWithCapacity:", 0);
}

- (void)setObject:(id)a3 forUncopiedKey:(id)a4
{
  if (!a3)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Attempt to insert nil value into %@"), objc_opt_class());
  CFDictionarySetValue(self->mDictionary, a4, a3);
}

- (TSUNoCopyDictionary)initWithCapacity:(unint64_t)a3
{
  TSUNoCopyDictionary *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSUNoCopyDictionary;
  v4 = -[TSUNoCopyDictionary init](&v6, sel_init);
  if (v4)
    v4->mDictionary = CFDictionaryCreateMutable(0, a3, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  return v4;
}

- (TSUNoCopyDictionary)initWithCFDictionary:(__CFDictionary *)a3
{
  TSUNoCopyDictionary *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSUNoCopyDictionary;
  v4 = -[TSUNoCopyDictionary init](&v6, sel_init);
  if (v4)
    v4->mDictionary = CFDictionaryCreateMutableCopy(0, 0, a3);
  return v4;
}

- (void)dealloc
{
  __CFDictionary *mDictionary;
  objc_super v4;

  mDictionary = self->mDictionary;
  if (mDictionary)
  {
    CFRelease(mDictionary);
    self->mDictionary = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)TSUNoCopyDictionary;
  -[TSUNoCopyDictionary dealloc](&v4, sel_dealloc);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithCFDictionary:", self->mDictionary);
}

- (void)removeObjectForKey:(id)a3
{
  CFDictionaryRemoveValue(self->mDictionary, a3);
}

- (void)removeAllObjects
{
  CFDictionaryRemoveAllValues(self->mDictionary);
}

- (unint64_t)count
{
  return CFDictionaryGetCount(self->mDictionary);
}

- (void)getObjects:(id *)a3 andKeys:(id *)a4
{
  BOOL v7;

  if (CFDictionaryGetCount(self->mDictionary))
    v7 = ((unint64_t)a3 | (unint64_t)a4) == 0;
  else
    v7 = 1;
  if (!v7)
    CFDictionaryGetKeysAndValues(self->mDictionary, (const void **)a4, (const void **)a3);
}

- (id)allValues
{
  unint64_t Count;
  unint64_t v4;
  const void **v5;
  void *v6;
  void *values[17];

  values[16] = *(void **)MEMORY[0x24BDAC8D0];
  Count = CFDictionaryGetCount(self->mDictionary);
  v4 = Count;
  v5 = (const void **)values;
  if (Count >= 0x10)
    v5 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
  CFDictionaryGetKeysAndValues(self->mDictionary, 0, v5);
  v6 = (void *)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, v4);
  if (v5 != (const void **)values)
    free(v5);
  return v6;
}

- (id)objectEnumerator
{
  return (id)objc_msgSend(-[TSUNoCopyDictionary allValues](self, "allValues"), "objectEnumerator");
}

- (id)allKeys
{
  unint64_t Count;
  unint64_t v4;
  const void **v5;
  void *v6;
  void *keys[17];

  keys[16] = *(void **)MEMORY[0x24BDAC8D0];
  Count = CFDictionaryGetCount(self->mDictionary);
  v4 = Count;
  v5 = (const void **)keys;
  if (Count >= 0x10)
    v5 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
  CFDictionaryGetKeysAndValues(self->mDictionary, v5, 0);
  v6 = (void *)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v5, v4);
  if (v5 != (const void **)keys)
    free(v5);
  return v6;
}

- (id)keyEnumerator
{
  return (id)objc_msgSend(-[TSUNoCopyDictionary allKeys](self, "allKeys"), "objectEnumerator");
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t Count;
  unint64_t v10;
  const void **v11;

  Count = CFDictionaryGetCount(self->mDictionary);
  if (a3->var0 >= Count)
    return 0;
  v10 = Count;
  v11 = (const void **)malloc_type_malloc(8 * Count, 0x80040B8603338uLL);
  CFDictionaryGetKeysAndValues(self->mDictionary, v11, 0);
  if (v10 - a3->var0 < a5)
    a5 = v10 - a3->var0;
  memcpy(a4, &v11[a3->var0], 8 * a5);
  free(v11);
  a3->var0 += a5;
  a3->var1 = a4;
  a3->var2 = (unint64_t *)&a3->var2;
  return a5;
}

@end
