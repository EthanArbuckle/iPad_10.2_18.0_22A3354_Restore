@implementation PXStackedDataSection

+ (id)dataSectionForAssetsInCollections:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  PXFetchResultDataSection *v13;
  void *v14;
  objc_class *v16;
  id obj;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v16 = (objc_class *)a1;
  v30 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v3;
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v19)
  {
    v18 = *(_QWORD *)v25;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v5);
        v20 = 0u;
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        objc_msgSend(v6, "px_fetchContainedAssetCollections", v16);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v21;
          do
          {
            v11 = 0;
            do
            {
              if (*(_QWORD *)v21 != v10)
                objc_enumerationMutation(v7);
              objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollection:options:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v11), 0);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = -[PXFetchResultDataSection initWithFetchResult:]([PXFetchResultDataSection alloc], "initWithFetchResult:", v12);
              objc_msgSend(v4, "addObject:", v13);

              ++v11;
            }
            while (v9 != v11);
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          }
          while (v9);
        }

        ++v5;
      }
      while (v5 != v19);
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v19);
  }

  v14 = (void *)objc_msgSend([v16 alloc], "initWithChildDataSections:outlineObject:", v4, 0);
  return v14;
}

- (PXStackedDataSection)initWithChildDataSections:(id)a3 outlineObject:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  PXStackedDataSection *v18;
  PXStackedDataSection *v19;
  uint64_t v20;
  NSArray *childDataSections;
  PXStackedDataSection *v23;
  id v24;
  id obj;
  void *v26;
  id v27;
  uint64_t v28;
  objc_super v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v23 = self;
  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v24 = a4;
  v27 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v28 = 0;
    v10 = 0;
    v11 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v31 != v11)
          objc_enumerationMutation(obj);
        v13 = objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "count", v23);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v14);

        if (v13 >= 1)
        {
          objc_msgSend(v27, "addIndex:", v10);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v28 + i);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
          v16 = v6;
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setObject:forKey:", v15, v17);

          v6 = v16;
          v10 += v13;
          ++v9;
        }
      }
      v28 += i;
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v8);
  }
  else
  {
    v10 = 0;
  }

  v29.receiver = v23;
  v29.super_class = (Class)PXStackedDataSection;
  v18 = -[PXDataSection initWithOutlineObject:](&v29, sel_initWithOutlineObject_, v24);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_nonEmptyChildDataSectionsStartIndexSet, v27);
    objc_storeStrong((id *)&v19->_nonEmptyChildDataSectionsIndexMap, v26);
    objc_storeStrong((id *)&v19->_childDataSectionsStartIndexes, v6);
    v20 = objc_msgSend(obj, "copy");
    childDataSections = v19->_childDataSections;
    v19->_childDataSections = (NSArray *)v20;

    v19->_count = v10;
  }

  return v19;
}

- (int64_t)indexOfChildDataSourceForObjectAtIndex:(int64_t)a3 localIndex:(int64_t *)a4
{
  NSUInteger v8;
  NSUInteger v9;
  NSDictionary *nonEmptyChildDataSectionsIndexMap;
  void *v11;
  void *v12;
  int64_t v13;
  void *v15;

  v8 = -[NSIndexSet indexLessThanOrEqualToIndex:](self->_nonEmptyChildDataSectionsStartIndexSet, "indexLessThanOrEqualToIndex:");
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (!a4)
      goto LABEL_4;
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStackedDataSection.m"), 62, CFSTR("no child data source found for index %ld"), a3);

  if (a4)
LABEL_3:
    *a4 = a3 - v8;
LABEL_4:
  v9 = -[NSIndexSet countOfIndexesInRange:](self->_nonEmptyChildDataSectionsStartIndexSet, "countOfIndexesInRange:", 0, a3 + 1);
  nonEmptyChildDataSectionsIndexMap = self->_nonEmptyChildDataSectionsIndexMap;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9 - 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](nonEmptyChildDataSectionsIndexMap, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    v13 = objc_msgSend(v12, "integerValue");
  else
    v13 = 0x7FFFFFFFFFFFFFFFLL;

  return v13;
}

- (int64_t)itemStartIndexForChildDataSourceAtIndex:(int64_t)a3
{
  void *v3;
  int64_t v4;

  -[NSArray objectAtIndexedSubscript:](self->_childDataSectionsStartIndexes, "objectAtIndexedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (id)objectAtIndex:(int64_t)a3
{
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v9;

  v9 = 0x7FFFFFFFFFFFFFFFLL;
  v4 = -[PXStackedDataSection indexOfChildDataSourceForObjectAtIndex:localIndex:](self, "indexOfChildDataSourceForObjectAtIndex:localIndex:", a3, &v9);
  -[PXStackedDataSection childDataSections](self, "childDataSections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectAtIndex:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_resetEnumerationState:(id *)a3
{
  a3->var0 = 0;
  *(_OWORD *)a3->var3 = 0u;
  *(_OWORD *)&a3->var3[2] = 0u;
  a3->var3[4] = 0;
  self->_currentEnumeratorMutationsPtr = 0;
}

- (id)_nextEnumerator
{
  NSEnumerator *childDataSectionsEnumerator;
  void *v4;
  NSEnumerator *v5;
  NSEnumerator *v6;
  void *v7;
  NSEnumerator *v8;

  childDataSectionsEnumerator = self->_childDataSectionsEnumerator;
  if (!childDataSectionsEnumerator)
  {
    -[PXStackedDataSection childDataSections](self, "childDataSections");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectEnumerator");
    v5 = (NSEnumerator *)objc_claimAutoreleasedReturnValue();
    v6 = self->_childDataSectionsEnumerator;
    self->_childDataSectionsEnumerator = v5;

    childDataSectionsEnumerator = self->_childDataSectionsEnumerator;
  }
  -[NSEnumerator nextObject](childDataSectionsEnumerator, "nextObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v8 = self->_childDataSectionsEnumerator;
    self->_childDataSectionsEnumerator = 0;

  }
  return v7;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  NSFastEnumeration *v9;
  NSFastEnumeration *currentEnumerator;
  unint64_t result;
  NSFastEnumeration *v12;
  NSFastEnumeration *v13;

  if (!self->_currentEnumerator)
  {
    -[PXStackedDataSection _nextEnumerator](self, "_nextEnumerator");
    v9 = (NSFastEnumeration *)objc_claimAutoreleasedReturnValue();
    currentEnumerator = self->_currentEnumerator;
    self->_currentEnumerator = v9;

    if (!self->_currentEnumerator)
      return 0;
    -[PXStackedDataSection _resetEnumerationState:](self, "_resetEnumerationState:", a3);
  }
  a3->var2 = self->_currentEnumeratorMutationsPtr;
  result = -[NSFastEnumeration countByEnumeratingWithState:objects:count:](self->_currentEnumerator, "countByEnumeratingWithState:objects:count:", a3, a4, a5);
  for (self->_currentEnumeratorMutationsPtr = a3->var2; ; self->_currentEnumeratorMutationsPtr = a3->var2)
  {
    a3->var2 = &self->_enumerationMutations;
    if (result)
      break;
    -[PXStackedDataSection _nextEnumerator](self, "_nextEnumerator");
    v12 = (NSFastEnumeration *)objc_claimAutoreleasedReturnValue();
    v13 = self->_currentEnumerator;
    self->_currentEnumerator = v12;

    if (!self->_currentEnumerator)
      return 0;
    -[PXStackedDataSection _resetEnumerationState:](self, "_resetEnumerationState:", a3);
    a3->var2 = self->_currentEnumeratorMutationsPtr;
    result = -[NSFastEnumeration countByEnumeratingWithState:objects:count:](self->_currentEnumerator, "countByEnumeratingWithState:objects:count:", a3, a4, a5);
  }
  return result;
}

- (int64_t)count
{
  return self->_count;
}

- (NSArray)childDataSections
{
  return self->_childDataSections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childDataSections, 0);
  objc_storeStrong((id *)&self->_currentEnumerator, 0);
  objc_storeStrong((id *)&self->_childDataSectionsEnumerator, 0);
  objc_storeStrong((id *)&self->_nonEmptyChildDataSectionsIndexMap, 0);
  objc_storeStrong((id *)&self->_nonEmptyChildDataSectionsStartIndexSet, 0);
  objc_storeStrong((id *)&self->_childDataSectionsStartIndexes, 0);
}

@end
