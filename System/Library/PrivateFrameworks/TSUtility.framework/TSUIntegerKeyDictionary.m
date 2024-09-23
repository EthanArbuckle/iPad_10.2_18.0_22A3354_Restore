@implementation TSUIntegerKeyDictionary

- (TSUIntegerKeyDictionary)init
{
  return -[TSUIntegerKeyDictionary initWithCapacity:](self, "initWithCapacity:", 0);
}

- (TSUIntegerKeyDictionary)initWithCapacity:(unint64_t)a3
{
  TSUIntegerKeyDictionary *v4;
  objc_super v6;
  CFDictionaryKeyCallBacks keyCallBacks;

  keyCallBacks.version = *MEMORY[0x24BDBD6A0];
  keyCallBacks.retain = 0;
  keyCallBacks.release = 0;
  keyCallBacks.copyDescription = (CFDictionaryCopyDescriptionCallBack)-[TSUIntegerKeyDictionary initWithCapacity:]::Local::IntegerKeyDescription;
  keyCallBacks.equal = 0;
  keyCallBacks.hash = 0;
  v6.receiver = self;
  v6.super_class = (Class)TSUIntegerKeyDictionary;
  v4 = -[TSUIntegerKeyDictionary init](&v6, sel_init);
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

  -[TSUIntegerKeyDictionary removeAllObjects](self, "removeAllObjects");
  CFRelease(self->mDictionary);
  self->mDictionary = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSUIntegerKeyDictionary;
  -[TSUIntegerKeyDictionary dealloc](&v3, sel_dealloc);
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
  return -[TSUIntegerKeyDictionaryKeyEnumerator initWithIntegerKeyDictionary:]([TSUIntegerKeyDictionaryKeyEnumerator alloc], "initWithIntegerKeyDictionary:", self);
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
  return (id)objc_msgSend(-[TSUIntegerKeyDictionary allValues](self, "allValues"), "objectEnumerator");
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  TSUIntegerKeyDictionary *v4;

  v4 = objc_alloc_init(TSUIntegerKeyDictionary);
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

  v3 = -[TSUIntegerKeyDictionary keyEnumerator](self, "keyEnumerator");
  v4 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  objc_msgSend(v4, "appendString:", CFSTR("{\n"));
  v5 = objc_msgSend(v3, "nextKey");
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    for (i = v5; i != 0x7FFFFFFFFFFFFFFFLL; i = objc_msgSend(v3, "nextKey"))
    {
      v7 = -[TSUIntegerKeyDictionary objectForKey:](self, "objectForKey:", i);
      objc_msgSend(v4, "appendString:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld = %@;\n"), i, objc_msgSend(v7, "description")));
    }
  }
  objc_msgSend(v4, "appendString:", CFSTR("}"));
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TSUIntegerKeyDictionary)initWithCoder:(id)a3
{
  TSUIntegerKeyDictionary *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = -[TSUIntegerKeyDictionary initWithCapacity:](self, "initWithCapacity:", 0);
  if (v4)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BDBCEF0], "setWithObjects:", objc_opt_class(), 0);
    objc_msgSend(v5, "unionSet:", objc_msgSend(a3, "allowedClasses"));
    v6 = (void *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", v5, CFSTR("data"));
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          -[TSUIntegerKeyDictionary setObject:forKey:](v4, "setObject:forKey:", objc_msgSend(v6, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10)), objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10), "integerValue"));
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t i;
  id v8;
  id v9;

  v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", -[TSUIntegerKeyDictionary count](self, "count"));
  v5 = -[TSUIntegerKeyDictionary keyEnumerator](self, "keyEnumerator");
  v6 = objc_msgSend(v5, "nextKey");
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    for (i = v6; i != 0x7FFFFFFFFFFFFFFFLL; i = objc_msgSend(v5, "nextKey"))
    {
      v8 = -[TSUIntegerKeyDictionary objectForKey:](self, "objectForKey:", i);
      objc_msgSend(v9, "setObject:forKey:", v8, objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", i));
    }
  }
  objc_msgSend(a3, "encodeObject:forKey:", v9, CFSTR("data"));

}

- (__CFDictionary)p_cfDictionary
{
  return self->mDictionary;
}

@end
