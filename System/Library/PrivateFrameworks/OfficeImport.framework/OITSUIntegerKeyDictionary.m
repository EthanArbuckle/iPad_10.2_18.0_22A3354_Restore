@implementation OITSUIntegerKeyDictionary

- (OITSUIntegerKeyDictionary)init
{
  return -[OITSUIntegerKeyDictionary initWithCapacity:](self, "initWithCapacity:", 0);
}

- (OITSUIntegerKeyDictionary)initWithCapacity:(unint64_t)a3
{
  OITSUIntegerKeyDictionary *v4;
  objc_super v6;
  CFDictionaryKeyCallBacks keyCallBacks;

  keyCallBacks.version = *MEMORY[0x24BDBD6A0];
  keyCallBacks.retain = 0;
  keyCallBacks.release = 0;
  keyCallBacks.copyDescription = (CFDictionaryCopyDescriptionCallBack)-[OITSUIntegerKeyDictionary initWithCapacity:]::Local::IntegerKeyDescription;
  keyCallBacks.equal = 0;
  keyCallBacks.hash = 0;
  v6.receiver = self;
  v6.super_class = (Class)OITSUIntegerKeyDictionary;
  v4 = -[OITSUIntegerKeyDictionary init](&v6, sel_init);
  if (v4)
    v4->mDictionary = CFDictionaryCreateMutable(0, a3, &keyCallBacks, MEMORY[0x24BDBD6B0]);
  return v4;
}

- (uint64_t)initWithCapacity:(uint64_t)a1
{
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%p"), a1);
}

- (void)dealloc
{
  objc_super v3;

  -[OITSUIntegerKeyDictionary removeAllObjects](self, "removeAllObjects");
  CFRelease(self->mDictionary);
  self->mDictionary = 0;
  v3.receiver = self;
  v3.super_class = (Class)OITSUIntegerKeyDictionary;
  -[OITSUIntegerKeyDictionary dealloc](&v3, sel_dealloc);
}

- (unint64_t)count
{
  return CFDictionaryGetCount(self->mDictionary);
}

- (id)objectForKey:(int64_t)a3
{
  return (id)CFDictionaryGetValue(self->mDictionary, (const void *)a3);
}

- (void)removeObjectForKey:(int64_t)a3
{
  CFDictionaryRemoveValue(self->mDictionary, (const void *)a3);
}

- (void)setObject:(id)a3 forKey:(int64_t)a4
{
  CFDictionarySetValue(self->mDictionary, (const void *)a4, a3);
}

- (void)removeAllObjects
{
  CFDictionaryRemoveAllValues(self->mDictionary);
}

- (id)keyEnumerator
{
  return -[OITSUIntegerKeyDictionaryKeyEnumerator initWithIntegerKeyDictionary:]([OITSUIntegerKeyDictionaryKeyEnumerator alloc], "initWithIntegerKeyDictionary:", self);
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

- (id)valueEnumerator
{
  return (id)objc_msgSend(-[OITSUIntegerKeyDictionary allValues](self, "allValues"), "objectEnumerator");
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  OITSUIntegerKeyDictionary *v4;
  __CFDictionary *mDictionary;

  v4 = objc_alloc_init(OITSUIntegerKeyDictionary);
  mDictionary = v4->mDictionary;
  if (mDictionary)
    CFRelease(mDictionary);
  v4->mDictionary = CFDictionaryCreateMutableCopy(0, 0, self->mDictionary);
  return v4;
}

- (id)description
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t i;
  id v7;

  v3 = -[OITSUIntegerKeyDictionary keyEnumerator](self, "keyEnumerator");
  v4 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  objc_msgSend(v4, "appendString:", CFSTR("{\n"));
  v5 = objc_msgSend(v3, "nextKey");
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    for (i = v5; i != 0x7FFFFFFFFFFFFFFFLL; i = objc_msgSend(v3, "nextKey"))
    {
      v7 = -[OITSUIntegerKeyDictionary objectForKey:](self, "objectForKey:", i);
      objc_msgSend(v4, "appendString:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld = %@;\n"), i, objc_msgSend(v7, "description")));
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
