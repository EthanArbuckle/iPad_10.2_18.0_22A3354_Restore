@implementation PXSidebarItemChangeDetails

- (PXSidebarItemChangeDetails)initWithArrayChangeDetails:(id)a3 previousDataSection:(id)a4
{
  id v7;
  id v8;
  PXSidebarItemChangeDetails *v9;
  PXSidebarItemChangeDetails *v10;
  void *v11;
  BOOL *p_hasContentChanges;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  NSArray *removedItems;
  void *v18;
  void *v19;
  uint64_t v20;
  NSArray *changedItems;
  objc_super v23;

  v7 = a3;
  v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)PXSidebarItemChangeDetails;
  v9 = -[PXSidebarItemChangeDetails init](&v23, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_arrayChangeDetails, a3);
    objc_storeStrong((id *)&v10->_previousDataSection, a4);
    objc_msgSend(v7, "removedIndexes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "count"))
    {
      v10->_hasContentChanges = 1;
      p_hasContentChanges = &v10->_hasContentChanges;
    }
    else
    {
      objc_msgSend(v7, "insertedIndexes");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v10->_hasContentChanges = objc_msgSend(v13, "count") != 0;
      p_hasContentChanges = &v10->_hasContentChanges;

    }
    if (*p_hasContentChanges && (objc_msgSend(v7, "hasMoves") & 1) != 0)
      LOBYTE(v14) = 1;
    else
      v14 = objc_msgSend(v7, "hasIncrementalChanges") ^ 1;
    v10->_needsReload = v14;
    objc_msgSend(v7, "removedIndexes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectsAtIndexes:", v15);
    v16 = objc_claimAutoreleasedReturnValue();
    removedItems = v10->_removedItems;
    v10->_removedItems = (NSArray *)v16;

    objc_msgSend(v7, "changedIndexes");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "indexSetAfterRevertingChangesToIndexSet:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectsAtIndexes:", v19);
    v20 = objc_claimAutoreleasedReturnValue();
    changedItems = v10->_changedItems;
    v10->_changedItems = (NSArray *)v20;

  }
  return v10;
}

- (NSIndexSet)removedIndexes
{
  void *v2;
  void *v3;

  -[PXSidebarItemChangeDetails arrayChangeDetails](self, "arrayChangeDetails");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removedIndexes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSIndexSet *)v3;
}

- (NSIndexSet)insertedIndexes
{
  void *v2;
  void *v3;

  -[PXSidebarItemChangeDetails arrayChangeDetails](self, "arrayChangeDetails");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "insertedIndexes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSIndexSet *)v3;
}

- (id)changedIndexes
{
  void *v2;
  void *v3;

  -[PXSidebarItemChangeDetails arrayChangeDetails](self, "arrayChangeDetails");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "changedIndexes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)hasMoves
{
  void *v2;
  char v3;

  -[PXSidebarItemChangeDetails arrayChangeDetails](self, "arrayChangeDetails");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasMoves");

  return v3;
}

- (void)enumerateMovedIndexesUsingBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD *v12;
  _QWORD v13[7];
  _QWORD v14[4];
  _QWORD v15[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXSidebarItemChangeDetails arrayChangeDetails](self, "arrayChangeDetails");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "movesToIndexes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v19 = objc_msgSend(v6, "firstIndex");
  v7 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __62__PXSidebarItemChangeDetails_enumerateMovedIndexesUsingBlock___block_invoke;
  v15[3] = &unk_1E512DFF8;
  v15[4] = &v20;
  v15[5] = &v16;
  objc_msgSend(v6, "enumerateIndexesUsingBlock:", v15);
  v8 = objc_msgSend(v6, "count");
  v9 = v21[3] + v8;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 0;
  v10 = objc_msgSend(v6, "firstIndex");
  v17[3] = v10;
  -[PXSidebarItemChangeDetails arrayChangeDetails](self, "arrayChangeDetails");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __62__PXSidebarItemChangeDetails_enumerateMovedIndexesUsingBlock___block_invoke_2;
  v13[3] = &unk_1E5121190;
  v13[6] = &v13[-2 * v9];
  v13[4] = &v16;
  v13[5] = v14;
  objc_msgSend(v11, "enumerateMovedIndexesUsingBlock:", v13);

  objc_msgSend((id)objc_opt_class(), "makeArrayIndexMovesIncremental:count:", &v13[-2 * v9], v9);
  if (v9)
  {
    v12 = &v13[-2 * v9 + 1];
    do
    {
      (*((void (**)(id, _QWORD, _QWORD))v4 + 2))(v4, *(v12 - 1), *v12);
      v12 += 2;
      --v9;
    }
    while (v9);
  }
  _Block_object_dispose(v14, 8);
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[PXSidebarItemChangeDetails needsReload](self, "needsReload"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSidebarItemChangeDetails removedIndexes](self, "removedIndexes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "px_shortDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSidebarItemChangeDetails insertedIndexes](self, "insertedIndexes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "px_shortDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSidebarItemChangeDetails changedIndexes](self, "changedIndexes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "px_shortDescription");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; needsReload:%@ removed:%@ inserted:%@ changed:%@>"),
    v4,
    self,
    v5,
    v7,
    v9,
    v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (PXArrayChangeDetails)arrayChangeDetails
{
  return self->_arrayChangeDetails;
}

- (PXDataSection)previousDataSection
{
  return self->_previousDataSection;
}

- (NSArray)removedItems
{
  return self->_removedItems;
}

- (NSArray)changedItems
{
  return self->_changedItems;
}

- (BOOL)hasContentChanges
{
  return self->_hasContentChanges;
}

- (BOOL)needsReload
{
  return self->_needsReload;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changedItems, 0);
  objc_storeStrong((id *)&self->_removedItems, 0);
  objc_storeStrong((id *)&self->_previousDataSection, 0);
  objc_storeStrong((id *)&self->_arrayChangeDetails, 0);
}

uint64_t __62__PXSidebarItemChangeDetails_enumerateMovedIndexesUsingBlock___block_invoke(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += a2
                                                                   - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40)
                                                                                           + 8)
                                                                               + 24);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = a2 + 1;
  return result;
}

_QWORD *__62__PXSidebarItemChangeDetails_enumerateMovedIndexesUsingBlock___block_invoke_2(_QWORD *result, uint64_t a2, unint64_t a3)
{
  unint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v3 = *(_QWORD *)(*(_QWORD *)(result[4] + 8) + 24);
  v4 = result[6];
  while (v3 < a3)
  {
    *(int64x2_t *)(v4 + 16 * (*(_QWORD *)(*(_QWORD *)(result[5] + 8) + 24))++) = vdupq_n_s64(v3);
    v3 = ++*(_QWORD *)(*(_QWORD *)(result[4] + 8) + 24);
  }
  v5 = (_QWORD *)(v4 + 16 * *(_QWORD *)(*(_QWORD *)(result[5] + 8) + 24));
  *v5 = a2;
  v5[1] = a3;
  ++*(_QWORD *)(*(_QWORD *)(result[5] + 8) + 24);
  ++*(_QWORD *)(*(_QWORD *)(result[4] + 8) + 24);
  return result;
}

+ (void)makeArrayIndexMovesIncremental:(id *)a3 count:(unint64_t)a4
{
  unint64_t v4;
  unint64_t v5;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 *i;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 *v7;
  unint64_t var0;
  unint64_t var1;
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 *v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v15;

  if (a4)
  {
    v4 = 0;
    v5 = a4 - 1;
    for (i = a3 + 1; ; ++i)
    {
      v7 = &a3[v4];
      var0 = v7->var0;
      var1 = v7->var1;
      ++v4;
      if (var0 != var1 && v4 < a4)
        break;
LABEL_22:
      --v5;
      if (v4 == a4)
        return;
    }
    v11 = i;
    v12 = v5;
    while (1)
    {
      v13 = v11->var0;
      if (var0 >= var1)
      {
        if (v13 > var0 || v13 < var1)
          goto LABEL_21;
        v15 = 1;
      }
      else
      {
        if (v13 < var0 || v13 > var1)
          goto LABEL_21;
        v15 = -1;
      }
      v11->var0 = v13 + v15;
LABEL_21:
      ++v11;
      if (!--v12)
        goto LABEL_22;
    }
  }
}

@end
