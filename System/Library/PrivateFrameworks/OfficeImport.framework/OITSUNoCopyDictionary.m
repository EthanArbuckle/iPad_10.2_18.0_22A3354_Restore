@implementation OITSUNoCopyDictionary

- (OITSUNoCopyDictionary)init
{
  return -[OITSUNoCopyDictionary initWithCapacity:](self, "initWithCapacity:", 0);
}

- (OITSUNoCopyDictionary)initWithCFDictionary:(__CFDictionary *)a3
{
  OITSUNoCopyDictionary *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OITSUNoCopyDictionary;
  v4 = -[OITSUNoCopyDictionary init](&v6, sel_init);
  if (v4)
    v4->mDictionary = CFDictionaryCreateMutableCopy(0, 0, a3);
  return v4;
}

- (OITSUNoCopyDictionary)initWithCapacity:(unint64_t)a3
{
  OITSUNoCopyDictionary *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OITSUNoCopyDictionary;
  v4 = -[OITSUNoCopyDictionary init](&v6, sel_init);
  if (v4)
    v4->mDictionary = CFDictionaryCreateMutable(0, a3, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
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
  v4.super_class = (Class)OITSUNoCopyDictionary;
  -[OITSUNoCopyDictionary dealloc](&v4, sel_dealloc);
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

- (void)setObject:(id)a3 forUncopiedKey:(id)a4
{
  uint64_t v7;

  if (a3)
  {
    if (a4)
    {
LABEL_3:
      CFDictionarySetValue(self->mDictionary, a4, a3);
      return;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Attempt to insert nil value into %@"), objc_opt_class());
    if (a4)
      goto LABEL_3;
  }
  v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUNoCopyDictionary setObject:forUncopiedKey:]");
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUNoCopyDictionary.m"), 69, 0, "Inserting a value into no-copy dictionary with a NULL key into %p! Object is %@", self, a3);
  +[OITSUAssertionHandler logBacktrace](OITSUAssertionHandler, "logBacktrace");
}

- (unint64_t)count
{
  return CFDictionaryGetCount(self->mDictionary);
}

- (void)getObjects:(id *)a3 andKeys:(id *)a4
{
  -[OITSUNoCopyDictionary getObjects:andKeys:count:](self, "getObjects:andKeys:count:", a3, a4, -1);
}

- (void)getObjects:(id *)a3 andKeys:(id *)a4 count:(unint64_t)a5
{
  unint64_t Count;
  unint64_t v10;
  BOOL v11;

  Count = CFDictionaryGetCount(self->mDictionary);
  if (Count >= a5)
    v10 = a5;
  else
    v10 = Count;
  if (v10)
    v11 = ((unint64_t)a3 | (unint64_t)a4) == 0;
  else
    v11 = 1;
  if (!v11)
    CFDictionaryGetKeysAndValues(self->mDictionary, (const void **)a4, (const void **)a3);
}

- (id)objectForKey:(id)a3
{
  if (a3)
    return (id)CFDictionaryGetValue(self->mDictionary, a3);
  else
    return 0;
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
  return (id)objc_msgSend(-[OITSUNoCopyDictionary allValues](self, "allValues"), "objectEnumerator");
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
  return (id)objc_msgSend(-[OITSUNoCopyDictionary allKeys](self, "allKeys"), "objectEnumerator");
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
