@implementation PLIndexMapper

- (PLIndexMapper)initWithDataSource:(id)a3
{
  PLIndexMapperDataSource *v5;
  PLIndexMapper *v6;
  PLIndexMapper *v7;
  void *v9;
  objc_super v10;

  v5 = (PLIndexMapperDataSource *)a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLIndexMapper.m"), 25, CFSTR("Must initialize with a data source"));

  }
  v10.receiver = self;
  v10.super_class = (Class)PLIndexMapper;
  v6 = -[PLIndexMapper init](&v10, sel_init);
  v7 = v6;
  if (v6)
    v6->_dataSource = v5;

  return v7;
}

- (id)indexesForBackingIndexes:(id)a3
{
  PLIndexMapperDataSource *dataSource;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;

  dataSource = self->_dataSource;
  v4 = a3;
  -[PLIndexMapperDataSource filteredIndexes](dataSource, "filteredIndexes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __42__PLIndexMapper_indexesForBackingIndexes___block_invoke;
  v12[3] = &unk_1E3672F90;
  v13 = v5;
  v7 = v6;
  v14 = v7;
  v8 = v5;
  objc_msgSend(v4, "enumerateRangesUsingBlock:", v12);

  v9 = v14;
  v10 = v7;

  return v10;
}

- (unint64_t)indexForBackingIndex:(unint64_t)a3
{
  void *v5;
  unint64_t v6;

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    return 0x7FFFFFFFFFFFFFFFLL;
  -[PLIndexMapperDataSource filteredIndexes](self->_dataSource, "filteredIndexes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countOfIndexesInRange:", 0, a3);

  return v6;
}

- (id)backingIndexesForIndexes:(id)a3
{
  PLIndexMapperDataSource *dataSource;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  PLIndexMapper *v16;
  SEL v17;

  dataSource = self->_dataSource;
  v6 = a3;
  -[PLIndexMapperDataSource filteredIndexes](dataSource, "filteredIndexes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __42__PLIndexMapper_backingIndexesForIndexes___block_invoke;
  v13[3] = &unk_1E36681A8;
  v14 = v7;
  v9 = v8;
  v16 = self;
  v17 = a2;
  v15 = v9;
  v10 = v7;
  objc_msgSend(v6, "enumerateRangesUsingBlock:", v13);

  v11 = v9;
  return v11;
}

- (unint64_t)backingIndexForIndex:(unint64_t)a3
{
  unint64_t v3;
  void *v5;
  _QWORD v7[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[4];

  v3 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[PLIndexMapperDataSource filteredIndexes](self->_dataSource, "filteredIndexes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x2020000000;
    v12[3] = 0;
    v8 = 0;
    v9 = &v8;
    v10 = 0x2020000000;
    v11 = 0x7FFFFFFFFFFFFFFFLL;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __38__PLIndexMapper_backingIndexForIndex___block_invoke;
    v7[3] = &unk_1E36681D0;
    v7[5] = &v8;
    v7[6] = a3;
    v7[4] = v12;
    objc_msgSend(v5, "enumerateRangesUsingBlock:", v7);
    v3 = v9[3];
    if (v3 == 0x7FFFFFFFFFFFFFFFLL)
      v3 = objc_msgSend(v5, "lastIndex") + 1;
    _Block_object_dispose(&v8, 8);
    _Block_object_dispose(v12, 8);

  }
  return v3;
}

- (BOOL)applyContainerChangeNotification:(id)a3 changeTypes:(int)a4 toFilteredIndexes:(id)a5
{
  char v6;
  id v8;
  id v9;
  char v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t, uint64_t);
  void *v27;
  id v28;
  id v29;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = objc_msgSend(v8, "shouldReload");
  if (v8)
    v11 = v10;
  else
    v11 = 1;
  if ((v11 & 1) == 0)
  {
    v12 = (void *)MEMORY[0x19AEC1554]();
    if ((v6 & 1) != 0)
    {
      objc_msgSend(v8, "deletedIndexes");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "pl_adjustIndexesForDeletions:", v13);

      if ((v6 & 2) == 0)
      {
LABEL_7:
        if ((v6 & 4) == 0)
          goto LABEL_8;
        goto LABEL_17;
      }
    }
    else if ((v6 & 2) == 0)
    {
      goto LABEL_7;
    }
    objc_msgSend(v8, "insertedIndexes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "firstIndex");
    if (v15 != 0x7FFFFFFFFFFFFFFFLL)
    {
      for (i = v15; i != 0x7FFFFFFFFFFFFFFFLL; i = objc_msgSend(v14, "indexGreaterThanIndex:", i))
      {
        objc_msgSend(v9, "shiftIndexesStartingAtIndex:by:", i, 1);
        if (-[PLIndexMapperDataSource shouldIncludeObjectAtIndex:](self->_dataSource, "shouldIncludeObjectAtIndex:", i))objc_msgSend(v9, "addIndex:", i);
      }
    }

    if ((v6 & 4) == 0)
    {
LABEL_8:
      if ((v6 & 8) == 0)
        goto LABEL_25;
      goto LABEL_18;
    }
LABEL_17:
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = MEMORY[0x1E0C809B0];
    v25 = 3221225472;
    v26 = __80__PLIndexMapper_applyContainerChangeNotification_changeTypes_toFilteredIndexes___block_invoke;
    v27 = &unk_1E36681F8;
    v18 = v9;
    v28 = v18;
    v29 = v17;
    v19 = v17;
    objc_msgSend(v8, "enumerateMovesWithBlock:", &v24);
    objc_msgSend(v18, "addIndexes:", v19, v24, v25, v26, v27);

    if ((v6 & 8) == 0)
    {
LABEL_25:
      objc_autoreleasePoolPop(v12);
      goto LABEL_26;
    }
LABEL_18:
    objc_msgSend(v8, "changedIndexes");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "firstIndex");
    if (v21 != 0x7FFFFFFFFFFFFFFFLL)
    {
      for (j = v21; j != 0x7FFFFFFFFFFFFFFFLL; j = objc_msgSend(v20, "indexGreaterThanIndex:", j))
      {
        if (-[PLIndexMapperDataSource shouldIncludeObjectAtIndex:](self->_dataSource, "shouldIncludeObjectAtIndex:", j))objc_msgSend(v9, "addIndex:", j);
        else
          objc_msgSend(v9, "removeIndex:", j);
      }
    }

    goto LABEL_25;
  }
LABEL_26:

  return v11 ^ 1;
}

uint64_t __80__PLIndexMapper_applyContainerChangeNotification_changeTypes_toFilteredIndexes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "containsIndex:", a2);
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "removeIndex:", a2);
    return objc_msgSend(*(id *)(a1 + 40), "addIndex:", a3);
  }
  return result;
}

_QWORD *__38__PLIndexMapper_backingIndexForIndex___block_invoke(_QWORD *result, uint64_t a2, unint64_t a3, _BYTE *a4)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v4 = *(_QWORD *)(result[4] + 8);
  v5 = *(_QWORD *)(v4 + 24);
  v6 = result[6] - v5;
  if (v6 < a3)
  {
    *(_QWORD *)(*(_QWORD *)(result[5] + 8) + 24) = v6 + a2;
    *a4 = 1;
    v4 = *(_QWORD *)(result[4] + 8);
    v5 = *(_QWORD *)(v4 + 24);
  }
  *(_QWORD *)(v4 + 24) = v5 + a3;
  return result;
}

void __42__PLIndexMapper_backingIndexesForIndexes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD v13[6];
  _QWORD v14[4];

  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 0;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3010000000;
  v13[3] = &unk_199CADF31;
  v13[4] = a2;
  v13[5] = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42__PLIndexMapper_backingIndexesForIndexes___block_invoke_2;
  v7[3] = &unk_1E3668180;
  v10 = v13;
  v11 = v14;
  v4 = *(void **)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 56);
  v8 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateRangesUsingBlock:", v7);

  _Block_object_dispose(v13, 8);
  _Block_object_dispose(v14, 8);
}

void __42__PLIndexMapper_backingIndexesForIndexes___block_invoke_2(uint64_t a1, uint64_t a2, unint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v10;
  void *v11;

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(_QWORD *)(v6 + 32) - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  v8 = a3 - v7;
  if (a3 > v7)
  {
    v10 = v7 + a2;
    if (*(_QWORD *)(v6 + 40) + v7 <= a3)
    {
      objc_msgSend(*(id *)(a1 + 32), "addIndexesInRange:", v10);
      *a4 = 1;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "addIndexesInRange:", v10, v8);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32) += v8;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) -= v8;
      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), CFSTR("PLIndexMapper.m"), 89, CFSTR("We split, but there's nothing left?"));

      }
    }
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += a3;
}

uint64_t __42__PLIndexMapper_indexesForBackingIndexes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 40), "addIndexesInRange:", objc_msgSend(*(id *)(a1 + 32), "countOfIndexesInRange:", 0, a2), objc_msgSend(*(id *)(a1 + 32), "countOfIndexesInRange:", a2, a3));
}

@end
