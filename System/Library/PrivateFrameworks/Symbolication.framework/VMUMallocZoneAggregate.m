@implementation VMUMallocZoneAggregate

- (VMUMallocZoneAggregate)initWithZoneName:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  VMUMallocZoneAggregate *v9;
  VMUMallocZoneAggregate *v10;
  uint64_t v11;
  NSCountedSet *quantaCounter;
  uint64_t v13;
  NSMapTable *classInfoToClassCountDataMap;
  uint64_t v15;
  NSMapTable *binaryNameToBinaryCountDataMap;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)VMUMallocZoneAggregate;
  v9 = -[VMUMallocZoneAggregate init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_heapAndVMOptions, a4);
    objc_storeStrong((id *)&v10->_zoneName, a3);
    v11 = objc_opt_new();
    quantaCounter = v10->_quantaCounter;
    v10->_quantaCounter = (NSCountedSet *)v11;

    objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0, 259);
    v13 = objc_claimAutoreleasedReturnValue();
    classInfoToClassCountDataMap = v10->_classInfoToClassCountDataMap;
    v10->_classInfoToClassCountDataMap = (NSMapTable *)v13;

    objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0, 259);
    v15 = objc_claimAutoreleasedReturnValue();
    binaryNameToBinaryCountDataMap = v10->_binaryNameToBinaryCountDataMap;
    v10->_binaryNameToBinaryCountDataMap = (NSMapTable *)v15;

  }
  return v10;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;
  void *value;
  NSMapEnumerator enumerator;

  memset(&enumerator, 0, sizeof(enumerator));
  NSEnumerateMapTable(&enumerator, self->_classInfoToClassCountDataMap);
  value = 0;
  while (NSNextMapEnumeratorPair(&enumerator, 0, &value))
  {
    v3 = (void *)*((_QWORD *)value + 4);
    if (v3)
    {
      free(v3);
      *((_QWORD *)value + 4) = 0;
    }
  }
  NSEndMapTableEnumeration(&enumerator);
  v4.receiver = self;
  v4.super_class = (Class)VMUMallocZoneAggregate;
  -[VMUMallocZoneAggregate dealloc](&v4, sel_dealloc);
}

- (void)incrementVirtualSize:(int64_t)a3
{
  self->_virtualSize += a3;
}

- (void)incrementAllocationCountForClassInfo:(id)a3 size:(unint64_t)a4
{
  NSCountedSet *quantaCounter;
  void *v7;
  void *v8;
  id v9;

  self->_allocatedSize += a4;
  ++self->_blockCount;
  quantaCounter = self->_quantaCounter;
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v9 = a3;
  objc_msgSend(v7, "numberWithUnsignedLongLong:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCountedSet addObject:](quantaCounter, "addObject:", v8);

  -[VMUMallocZoneAggregate modifySize:count:forClassInfo:](self, "modifySize:count:forClassInfo:", a4, 1, v9);
}

- (void)modifySize:(int64_t)a3 count:(int64_t)a4 forClassInfo:(id)a5
{
  void *v8;
  unint64_t v9;
  _QWORD *v10;
  __CFString *v11;
  _QWORD *v12;
  _BOOL4 v13;
  unint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unsigned int v19;
  unint64_t v20;
  unint64_t *v22;
  int64_t v23;
  int64_t v24;
  id key;

  key = a5;
  v8 = (void *)MEMORY[0x1A85A9758]();
  if (a3 >= 0)
    v9 = a3;
  else
    v9 = -a3;
  v10 = NSMapGet(self->_classInfoToClassCountDataMap, key);
  if (!v10)
  {
    v10 = malloc_type_malloc(0x30uLL, 0x102004095A10554uLL);
    *v10 = 0;
    v10[1] = 0;
    *((_DWORD *)v10 + 10) = objc_msgSend(key, "ivarGapForClassHierarchy");
    v10[3] = 0;
    v10[4] = 0;
    v10[2] = 0;
    NSMapInsert(self->_classInfoToClassCountDataMap, key, v10);
  }
  objc_msgSend(key, "binaryName");
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!-[__CFString length](v11, "length"))
  {

    v11 = CFSTR("non-object");
  }
  v12 = NSMapGet(self->_binaryNameToBinaryCountDataMap, v11);
  if (!v12)
  {
    v12 = malloc_type_malloc(0x18uLL, 0x108004098BBCF0FuLL);
    *v12 = 0;
    v12[1] = 0;
    NSMapInsert(self->_binaryNameToBinaryCountDataMap, v11, v12);
  }
  v13 = -[VMUHeapAndVMAggregatorOptions showSizes](self->_heapAndVMOptions, "showSizes");
  v14 = *v10;
  if (v13 && v14)
  {
    if (!v10[3] && v10[1] / v14 != v9)
    {
      v10[3] = 4;
      v15 = malloc_type_malloc(0x40uLL, 0x1000040451B5BE8uLL);
      v10[4] = v15;
      v10[2] = 1;
      v14 = *v10;
      *v15 = v10[1] / *v10;
      v15[1] = v14;
    }
    v16 = v10[2];
    if (v16)
    {
      v17 = 0;
      v18 = (_QWORD *)v10[4];
      v19 = 1;
      while (v16 != v17)
      {
        v20 = v18[2 * v17];
        if (v9 < v20)
          goto LABEL_23;
        if (v9 == v20)
        {
          v18[2 * v17 + 1] += a4;
          goto LABEL_29;
        }
        v17 = v19;
        if (v16 < v19++)
          goto LABEL_29;
      }
      v17 = v10[2];
LABEL_23:
      if (v16 == v10[3])
      {
        v10[3] = 4 * v16;
        v18 = malloc_type_realloc(v18, v16 << 6, 0xDA27BE6uLL);
        v10[4] = v18;
        v16 = v10[2];
      }
      if (v16 > v17)
      {
        memmove(&v18[2 * v19], &v18[2 * v17], 16 * (v16 - v17));
        v18 = (_QWORD *)v10[4];
        v16 = v10[2];
      }
      v22 = &v18[2 * v17];
      *v22 = v9;
      v22[1] = a4;
      v10[2] = v16 + 1;
      v14 = *v10;
    }
  }
LABEL_29:
  v23 = v10[1] + a3;
  *v10 = v14 + a4;
  v10[1] = v23;
  v24 = v12[1] + a3;
  *v12 += a4;
  v12[1] = v24;

  objc_autoreleasePoolPop(v8);
}

- (id)_classDisplayName:(id)a3
{
  VMUHeapAndVMAggregatorOptions *heapAndVMOptions;
  id v4;
  void *v5;

  heapAndVMOptions = self->_heapAndVMOptions;
  v4 = a3;
  if (-[VMUHeapAndVMAggregatorOptions showRawClassNames](heapAndVMOptions, "showRawClassNames"))
    objc_msgSend(v4, "className");
  else
    objc_msgSend(v4, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)classInfosSortedBySizeOrCount:(unsigned int)a3
{
  void *v5;
  void *v6;
  _QWORD v8[5];
  unsigned int v9;

  NSAllMapTableKeys(self->_classInfoToClassCountDataMap);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__VMUMallocZoneAggregate_classInfosSortedBySizeOrCount___block_invoke;
  v8[3] = &unk_1E4E03640;
  v8[4] = self;
  v9 = a3;
  objc_msgSend(v5, "sortedArrayUsingComparator:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __56__VMUMallocZoneAggregate_classInfosSortedBySizeOrCount___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  v6 = a3;
  v7 = a2;
  v8 = (_QWORD *)objc_msgSend(v5, "objectForKey:", v7);
  v9 = (_QWORD *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKey:", v6);
  v10 = v8[1];
  v11 = *v8 - *v9;
  v12 = v10 - v9[1];
  v13 = *(_DWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "_classDisplayName:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_classDisplayName:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = _compareSizeCount(v13, v11, v12, v14, v15);
  return v16;
}

- (id)classInfosSortedByName
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  NSAllMapTableKeys(self->_classInfoToClassCountDataMap);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __48__VMUMallocZoneAggregate_classInfosSortedByName__block_invoke;
  v6[3] = &unk_1E4E03668;
  v6[4] = self;
  objc_msgSend(v3, "sortedArrayUsingComparator:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __48__VMUMallocZoneAggregate_classInfosSortedByName__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "_classDisplayName:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_classDisplayName:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v7, "compare:", v8);
  return v9;
}

- (id)classInfosSortedByTotalInternalFragmentation
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  NSAllMapTableKeys(self->_classInfoToClassCountDataMap);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __70__VMUMallocZoneAggregate_classInfosSortedByTotalInternalFragmentation__block_invoke;
  v6[3] = &unk_1E4E03668;
  v6[4] = self;
  objc_msgSend(v3, "sortedArrayUsingComparator:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __70__VMUMallocZoneAggregate_classInfosSortedByTotalInternalFragmentation__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKey:", v5);
  v8 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKey:", v6);
  v9 = *(_QWORD *)v8 * *(unsigned int *)(v8 + 40) - *(_QWORD *)v7 * *(unsigned int *)(v7 + 40);
  if (v9 <= 0)
  {
    if (v9 < 0)
    {
      v10 = -1;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_classDisplayName:", v5);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "_classDisplayName:", v6);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v11, "compare:", v12);

    }
  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (void)enumerateHeapAndVMSortedBy:(unsigned int)a3 withBlock:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  unsigned int v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v4 = *(_QWORD *)&a3;
  v23 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (v4 < 2)
  {
    -[VMUMallocZoneAggregate classInfosSortedBySizeOrCount:](self, "classInfosSortedBySizeOrCount:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if ((_DWORD)v4 == 2)
  {
    -[VMUMallocZoneAggregate classInfosSortedByName](self, "classInfosSortedByName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if ((_DWORD)v4 != 3)
      -[VMUMallocZoneAggregate enumerateHeapAndVMSortedBy:withBlock:].cold.1();
    -[VMUMallocZoneAggregate classInfosSortedByTotalInternalFragmentation](self, "classInfosSortedByTotalInternalFragmentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        v14 = -[NSMapTable objectForKey:](self->_classInfoToClassCountDataMap, "objectForKey:", v13, (_QWORD)v18);
        if (-[VMUHeapAndVMAggregatorOptions showSizes](self->_heapAndVMOptions, "showSizes") && v14[2])
        {
          v15 = 0;
          v16 = 1;
          do
          {
            (*((void (**)(id, uint64_t, _QWORD, _QWORD))v6 + 2))(v6, v13, *(_QWORD *)(v14[4] + 16 * v15 + 8), *(_QWORD *)(v14[4] + 16 * v15) * *(_QWORD *)(v14[4] + 16 * v15 + 8));
            v15 = v16;
          }
          while (v14[2] > (unint64_t)v16++);
        }
        else
        {
          (*((void (**)(id, uint64_t, _QWORD, _QWORD))v6 + 2))(v6, v13, *v14, v14[1]);
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

}

- (void)enumerateBinaryCountDataSortedBy:(unsigned int)a3 withBlock:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  _QWORD *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[5];
  unsigned int v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  NSAllMapTableKeys(self->_binaryNameToBinaryCountDataMap);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __69__VMUMallocZoneAggregate_enumerateBinaryCountDataSortedBy_withBlock___block_invoke;
  v19[3] = &unk_1E4E03690;
  v19[4] = self;
  v20 = a3;
  objc_msgSend(v7, "sortedArrayUsingComparator:", v19);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        v14 = -[NSMapTable objectForKey:](self->_binaryNameToBinaryCountDataMap, "objectForKey:", v13);
        (*((void (**)(id, uint64_t, _QWORD, _QWORD))v6 + 2))(v6, v13, *v14, v14[1]);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v10);
  }

}

uint64_t __69__VMUMallocZoneAggregate_enumerateBinaryCountDataSortedBy_withBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  v6 = a3;
  v7 = a2;
  v8 = (_QWORD *)objc_msgSend(v5, "objectForKey:", v7);
  v9 = (_QWORD *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "objectForKey:", v6);
  v10 = _compareSizeCount(*(_DWORD *)(a1 + 40), *v8 - *v9, v8[1] - v9[1], v7, v6);

  return v10;
}

- (void)enumerateAllocationSizesWithBlock:(id)a3
{
  void (**v4)(id, uint64_t, NSUInteger);
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, NSUInteger))a3;
  -[NSCountedSet allObjects](self->_quantaCounter, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingComparator:", &__block_literal_global_19);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        v4[2](v4, objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11), "unsignedLongLongValue", (_QWORD)v12), -[NSCountedSet countForObject:](self->_quantaCounter, "countForObject:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11)));
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

uint64_t __60__VMUMallocZoneAggregate_enumerateAllocationSizesWithBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a2;
  v5 = objc_msgSend(a3, "unsignedLongLongValue");
  v6 = objc_msgSend(v4, "unsignedLongLongValue");

  if (v5 - v6 >= 1)
    return 1;
  else
    return (v5 - v6) >> 63;
}

- (unint64_t)virtualSize
{
  return self->_virtualSize;
}

- (unint64_t)allocatedSize
{
  return self->_allocatedSize;
}

- (unsigned)blockCount
{
  return self->_blockCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_binaryNameToBinaryCountDataMap, 0);
  objc_storeStrong((id *)&self->_classInfoToClassCountDataMap, 0);
  objc_storeStrong((id *)&self->_quantaCounter, 0);
  objc_storeStrong((id *)&self->_zoneName, 0);
  objc_storeStrong((id *)&self->_heapAndVMOptions, 0);
}

- (void)enumerateHeapAndVMSortedBy:withBlock:.cold.1()
{
  __assert_rtn("-[VMUMallocZoneAggregate enumerateHeapAndVMSortedBy:withBlock:]", "VMUMallocZoneAggregate.m", 254, "0");
}

@end
