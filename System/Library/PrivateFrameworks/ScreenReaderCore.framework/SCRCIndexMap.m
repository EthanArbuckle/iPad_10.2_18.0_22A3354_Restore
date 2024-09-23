@implementation SCRCIndexMap

- (SCRCIndexMap)initWithObjects:(const void *)a3 andIndexes:(unint64_t *)a4 count:(unint64_t)a5
{
  SCRCIndexMap *v8;
  CFMutableDictionaryRef Mutable;
  SCRCIndexMap *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SCRCIndexMap;
  v8 = -[SCRCIndexMap init](&v12, sel_init);
  if (v8
    && (Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, 0, MEMORY[0x24BDBD6B0]),
        (v8->_map = Mutable) != 0))
  {
    for (; a5; --a5)
    {
      if (*a3)
        CFDictionarySetValue(v8->_map, (const void *)*a4, *a3);
      ++a4;
      ++a3;
    }
    v10 = v8;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (SCRCIndexMap)init
{
  SCRCIndexMap *v2;
  CFMutableDictionaryRef Mutable;
  SCRCIndexMap *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SCRCIndexMap;
  v2 = -[SCRCIndexMap init](&v6, sel_init);
  if (v2
    && (Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, 0, MEMORY[0x24BDBD6B0]),
        (v2->_map = Mutable) != 0))
  {
    v4 = v2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_initWithIndexMap:(id)a3
{
  _QWORD *v4;
  SCRCIndexMap *v5;
  const __CFDictionary *v6;
  CFIndex Count;
  CFMutableDictionaryRef MutableCopy;
  SCRCIndexMap *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SCRCIndexMap;
  v5 = -[SCRCIndexMap init](&v11, sel_init);
  if (v5
    && (v6 = (const __CFDictionary *)v4[1],
        Count = CFDictionaryGetCount(v6),
        MutableCopy = CFDictionaryCreateMutableCopy(0, Count, v6),
        (v5->_map = MutableCopy) != 0))
  {
    v9 = v5;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_initAndDeepCopyIndexMap:(id)a3
{
  id v4;
  SCRCIndexMap *v5;
  CFMutableDictionaryRef Mutable;
  uint64_t v7;
  _QWORD *v8;
  unint64_t i;
  void *v10;
  void *v11;
  SCRCIndexMap *v12;
  unint64_t v14;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SCRCIndexMap;
  v5 = -[SCRCIndexMap init](&v15, sel_init);
  if (v5
    && (Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, 0, MEMORY[0x24BDBD6B0]),
        (v5->_map = Mutable) != 0))
  {
    v14 = 0;
    v7 = objc_msgSend(v4, "_createIndexesWithSize:", &v14);
    if (v7)
    {
      v8 = (_QWORD *)v7;
      if (v14)
      {
        for (i = 0; i < v14; ++i)
        {
          objc_msgSend(v4, "objectForIndex:", v8[i]);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = (void *)objc_msgSend(v10, "copy");

          CFDictionarySetValue(v5->_map, (const void *)v8[i], v11);
        }
      }
      free(v8);
    }
    v12 = v5;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[SCRCIndexMap _initWithIndexMap:](+[SCRCIndexMap allocWithZone:](SCRCIndexMap, "allocWithZone:", a3), "_initWithIndexMap:", self);
}

- (id)deepCopyWithZone:(_NSZone *)a3
{
  return -[SCRCIndexMap _initAndDeepCopyIndexMap:](+[SCRCIndexMap allocWithZone:](SCRCIndexMap, "allocWithZone:", a3), "_initAndDeepCopyIndexMap:", self);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SCRCIndexMap)initWithCoder:(id)a3
{
  id v4;
  SCRCIndexMap *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  SCRCIndexMap *v17;
  id v18;
  _QWORD v19[4];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[SCRCIndexMap init](self, "init");
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v20[0] = objc_opt_class();
    v20[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("indexes"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)MEMORY[0x24BDBCF20];
    v19[0] = objc_opt_class();
    v19[1] = objc_opt_class();
    v19[2] = objc_opt_class();
    v19[3] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("values"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __30__SCRCIndexMap_initWithCoder___block_invoke;
    v16[3] = &unk_24CB25388;
    v17 = v5;
    v18 = v13;
    v14 = v13;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v16);

  }
  return v5;
}

void __30__SCRCIndexMap_initWithCoder___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;

  v4 = *(void **)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = a2;
  objc_msgSend(v5, "objectAtIndex:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedLongValue");

  objc_msgSend(v4, "setObject:forIndex:", v8, v7);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t *v7;
  unint64_t i;
  unint64_t v9;
  void *v10;
  void *v11;
  unint64_t v12;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  v12 = 0;
  v7 = -[SCRCIndexMap _createIndexesWithSize:](self, "_createIndexesWithSize:", &v12);
  if (v12)
  {
    for (i = 0; i < v12; ++i)
    {
      v9 = v7[i];
      -[SCRCIndexMap objectForIndex:](self, "objectForIndex:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "conformsToProtocol:", &unk_254A91FE0))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        objc_msgSend(v6, "addObject:", v10);
      }

    }
  }
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("indexes"));
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("values"));
  free(v7);

}

- (void)dealloc
{
  __CFDictionary *map;
  objc_super v4;

  map = self->_map;
  if (map)
    CFRelease(map);
  v4.receiver = self;
  v4.super_class = (Class)SCRCIndexMap;
  -[SCRCIndexMap dealloc](&v4, sel_dealloc);
}

- (void)setObject:(id)a3 forIndex:(unint64_t)a4
{
  if (a3)
    CFDictionarySetValue(self->_map, (const void *)a4, a3);
}

- (void)removeObjectForIndex:(unint64_t)a3
{
  CFDictionaryRemoveValue(self->_map, (const void *)a3);
}

- (void)removeAllObjects
{
  CFDictionaryRemoveAllValues(self->_map);
}

- (id)objectForIndex:(unint64_t)a3
{
  return (id)CFDictionaryGetValue(self->_map, (const void *)a3);
}

- (unint64_t)count
{
  return CFDictionaryGetCount(self->_map);
}

- (unint64_t)_createIndexesWithSize:(unint64_t *)a3
{
  CFIndex Count;
  size_t v6;
  const void **v7;
  const void **v8;

  Count = CFDictionaryGetCount(self->_map);
  if (a3)
    *a3 = Count;
  v6 = 8 * Count;
  v7 = (const void **)malloc_type_malloc(8 * Count, 0xC823C8AuLL);
  v8 = v7;
  if (v7)
  {
    bzero(v7, v6);
    CFDictionaryGetKeysAndValues(self->_map, v8, 0);
  }
  return (unint64_t *)v8;
}

- (id)indexes
{
  unint64_t *v2;
  id v3;
  unint64_t i;
  unint64_t v6;

  v6 = 0;
  v2 = -[SCRCIndexMap _createIndexesWithSize:](self, "_createIndexesWithSize:", &v6);
  v3 = objc_alloc_init(MEMORY[0x24BDD1698]);
  if (v6)
  {
    for (i = 0; i < v6; ++i)
      objc_msgSend(v3, "addIndex:", v2[i]);
  }
  free(v2);
  return v3;
}

- (void)addObjectsFromIndexMap:(id)a3
{
  id v4;
  uint64_t v5;
  _QWORD *v6;
  unint64_t i;
  void *v8;
  unint64_t v9;

  v4 = a3;
  v9 = 0;
  v5 = objc_msgSend(v4, "_createIndexesWithSize:", &v9);
  if (v5)
  {
    v6 = (_QWORD *)v5;
    if (v9)
    {
      for (i = 0; i < v9; ++i)
      {
        objc_msgSend(v4, "objectForIndex:", v6[i]);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SCRCIndexMap setObject:forIndex:](self, "setObject:forIndex:", v8, v6[i]);

      }
    }
    free(v6);
  }

}

- (id)description
{
  void *v3;
  unint64_t *v4;
  unint64_t *v5;
  unint64_t i;
  id v7;
  unint64_t v8;
  void *v9;
  void *v10;
  id v11;
  unint64_t v13;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", CFSTR("SCRCIndexMap:\n"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v4 = -[SCRCIndexMap _createIndexesWithSize:](self, "_createIndexesWithSize:", &v13);
  if (v4)
  {
    v5 = v4;
    if (v13)
    {
      for (i = 0; i < v13; ++i)
      {
        v7 = objc_alloc(MEMORY[0x24BDD17C8]);
        v8 = v5[i];
        -[SCRCIndexMap objectForIndex:](self, "objectForIndex:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)objc_msgSend(v7, "initWithFormat:", CFSTR("\t%lu (0x%lx) -> %@\n"), v8, v8, v9);

        objc_msgSend(v3, "appendString:", v10);
      }
    }
    free(v5);
    v11 = v3;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    v6 = -[SCRCIndexMap count](self, "count");
    if (v6 == objc_msgSend(v5, "count"))
    {
      -[SCRCIndexMap indexes](self, "indexes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "indexes");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v8, "mutableCopy");

      if (objc_msgSend(v7, "isEqualToIndexSet:", v9))
      {
        v15 = 0;
        v16 = &v15;
        v17 = 0x2020000000;
        v18 = 1;
        v12[0] = MEMORY[0x24BDAC760];
        v12[1] = 3221225472;
        v12[2] = __24__SCRCIndexMap_isEqual___block_invoke;
        v12[3] = &unk_24CB253B0;
        v12[4] = self;
        v13 = v5;
        v14 = &v15;
        objc_msgSend(v7, "enumerateIndexesUsingBlock:", v12);
        v10 = *((_BYTE *)v16 + 24) != 0;

        _Block_object_dispose(&v15, 8);
      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __24__SCRCIndexMap_isEqual___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  id v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "objectForIndex:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForIndex:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 != v6 && (objc_msgSend(v7, "isEqual:", v6) & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    *a3 = 1;
  }

}

@end
