@implementation PXVisualPositionsChangeDetails

- (PXVisualPositionsChangeDetails)initWithCountBeforeChanges:(int64_t)a3 anchorIndexBeforeChanges:(int64_t)a4 headerIndexesBeforeChanges:(id)a5 countAfterChanges:(int64_t)a6 anchorIndexAfterChanges:(int64_t)a7 headerIndexesAfterChanges:(id)a8
{
  id v14;
  id v15;
  PXVisualPositionsChangeDetails *v16;
  PXVisualPositionsChangeDetails *v17;
  uint64_t v18;
  NSIndexSet *headerIndexesBeforeChanges;
  uint64_t v20;
  NSIndexSet *headerIndexesAfterChanges;
  int64_t anchorIndexBeforeChanges;
  int64_t anchorIndexAfterChanges;
  objc_super v25;

  v14 = a5;
  v15 = a8;
  v25.receiver = self;
  v25.super_class = (Class)PXVisualPositionsChangeDetails;
  v16 = -[PXVisualPositionsChangeDetails init](&v25, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_countBeforeChanges = a3;
    v16->_anchorIndexBeforeChanges = a4;
    v18 = objc_msgSend(v14, "copy");
    headerIndexesBeforeChanges = v17->_headerIndexesBeforeChanges;
    v17->_headerIndexesBeforeChanges = (NSIndexSet *)v18;

    v17->_countAfterChanges = a6;
    v17->_anchorIndexAfterChanges = a7;
    v20 = objc_msgSend(v15, "copy");
    headerIndexesAfterChanges = v17->_headerIndexesAfterChanges;
    v17->_headerIndexesAfterChanges = (NSIndexSet *)v20;

    anchorIndexBeforeChanges = v17->_anchorIndexBeforeChanges;
    v17->_anchorBodyIndexBeforeChanges = anchorIndexBeforeChanges
                                       - -[NSIndexSet countOfIndexesInRange:](v17->_headerIndexesBeforeChanges, "countOfIndexesInRange:", 0, anchorIndexBeforeChanges);
    anchorIndexAfterChanges = v17->_anchorIndexAfterChanges;
    v17->_anchorBodyIndexAfterChanges = anchorIndexAfterChanges
                                      - -[NSIndexSet countOfIndexesInRange:](v17->_headerIndexesAfterChanges, "countOfIndexesInRange:", 0, anchorIndexAfterChanges);
  }

  return v17;
}

- (PXVisualPositionsChangeDetails)init
{
  return -[PXVisualPositionsChangeDetails initWithCountBeforeChanges:anchorIndexBeforeChanges:headerIndexesBeforeChanges:countAfterChanges:anchorIndexAfterChanges:headerIndexesAfterChanges:](self, "initWithCountBeforeChanges:anchorIndexBeforeChanges:headerIndexesBeforeChanges:countAfterChanges:anchorIndexAfterChanges:headerIndexesAfterChanges:", 0, 0x7FFFFFFFFFFFFFFFLL, 0, 0, 0x7FFFFFFFFFFFFFFFLL, 0);
}

- ($5E4061BE7C3C8BB942C4587960135C41)visualPositionAfterApplyingChangesToIndex:(SEL)a3
{
  void *v7;
  void *v8;
  int64_t var0;
  void *v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  $5E4061BE7C3C8BB942C4587960135C41 *result;
  __int128 v17;
  uint64_t v18;

  retstr->var0 = 0;
  retstr->var1 = 0;
  *(_QWORD *)&retstr->var2 = 0;
  -[PXVisualPositionsChangeDetails headerIndexesBeforeChanges](self, "headerIndexesBeforeChanges");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    *(_QWORD *)&retstr->var2 = 0;
    *(_OWORD *)&retstr->var0 = PXVisualPositionNull;
  }
  else if (objc_msgSend(v7, "containsIndex:", a4))
  {
    -[PXVisualPositionsChangeDetails visualPositionAfterApplyingChangesToIndex:](self, "visualPositionAfterApplyingChangesToIndex:", a4 + 1);
    *(_OWORD *)&retstr->var0 = v17;
    retstr->var1 = 1;
    *(_QWORD *)&retstr->var2 = v18;
    retstr->var2 = 0;
  }
  else
  {
    -[PXVisualPositionsChangeDetails bodyVisualPositionAfterApplyingChangesToBodyIndex:](self, "bodyVisualPositionAfterApplyingChangesToBodyIndex:", a4 - objc_msgSend(v8, "countOfIndexesInRange:", 0, a4));
    *(_OWORD *)&retstr->var0 = v17;
    *(_QWORD *)&retstr->var2 = v18;
    var0 = retstr->var0;
    -[PXVisualPositionsChangeDetails headerIndexesAfterChanges](self, "headerIndexesAfterChanges");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = var0;
    if ((unint64_t)var0 <= 0x7FFFFFFFFFFFFFFELL)
    {
      v12 = -1;
      v13 = -1;
      do
      {
        v11 = var0 - v13 + v12;
        v14 = objc_msgSend(v10, "countOfIndexesInRange:", v12 + 1);
        v13 = var0 - v14;
        v12 = v11;
      }
      while (var0 - v14 < var0);
    }
    retstr->var0 = v11;

    v15 = (v11 & 0x8000000000000000) == 0
       && v11 < -[PXVisualPositionsChangeDetails countAfterChanges](self, "countAfterChanges");
    retstr->var2 &= v15;
  }

  return result;
}

- ($5E4061BE7C3C8BB942C4587960135C41)visualPositionAfterRevertingChangesFromIndex:(SEL)a3
{
  void *v7;
  void *v8;
  int64_t var0;
  void *v10;
  int64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  $5E4061BE7C3C8BB942C4587960135C41 *result;
  __int128 v17;
  uint64_t v18;

  retstr->var0 = 0;
  retstr->var1 = 0;
  *(_QWORD *)&retstr->var2 = 0;
  -[PXVisualPositionsChangeDetails headerIndexesAfterChanges](self, "headerIndexesAfterChanges");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    *(_QWORD *)&retstr->var2 = 0;
    *(_OWORD *)&retstr->var0 = PXVisualPositionNull;
  }
  else if (objc_msgSend(v7, "containsIndex:", a4))
  {
    -[PXVisualPositionsChangeDetails visualPositionAfterRevertingChangesFromIndex:](self, "visualPositionAfterRevertingChangesFromIndex:", a4 + 1);
    *(_OWORD *)&retstr->var0 = v17;
    retstr->var1 = 1;
    *(_QWORD *)&retstr->var2 = v18;
    retstr->var2 = 0;
  }
  else
  {
    -[PXVisualPositionsChangeDetails bodyVisualPositionAfterRevertingChangesFromBodyIndex:](self, "bodyVisualPositionAfterRevertingChangesFromBodyIndex:", a4 - objc_msgSend(v8, "countOfIndexesInRange:", 0, a4));
    *(_OWORD *)&retstr->var0 = v17;
    *(_QWORD *)&retstr->var2 = v18;
    var0 = retstr->var0;
    -[PXVisualPositionsChangeDetails headerIndexesBeforeChanges](self, "headerIndexesBeforeChanges");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = var0;
    if ((unint64_t)var0 <= 0x7FFFFFFFFFFFFFFELL)
    {
      v12 = -1;
      v13 = -1;
      do
      {
        v11 = var0 - v13 + v12;
        v14 = objc_msgSend(v10, "countOfIndexesInRange:", v12 + 1);
        v13 = var0 - v14;
        v12 = v11;
      }
      while (var0 - v14 < var0);
    }
    retstr->var0 = v11;

    v15 = (v11 & 0x8000000000000000) == 0
       && v11 < -[PXVisualPositionsChangeDetails countBeforeChanges](self, "countBeforeChanges");
    retstr->var2 &= v15;
  }

  return result;
}

- ($5E4061BE7C3C8BB942C4587960135C41)bodyVisualPositionAfterApplyingChangesToBodyIndex:(SEL)a3
{
  void *v6;
  objc_class *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXVisualPositionsChangeDetails.m"), 164, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXVisualPositionsChangeDetails bodyVisualPositionAfterApplyingChangesToBodyIndex:]", v8);

  abort();
}

- ($5E4061BE7C3C8BB942C4587960135C41)bodyVisualPositionAfterRevertingChangesFromBodyIndex:(SEL)a3
{
  void *v6;
  objc_class *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXVisualPositionsChangeDetails.m"), 168, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXVisualPositionsChangeDetails bodyVisualPositionAfterRevertingChangesFromBodyIndex:]", v8);

  abort();
}

- (id)arrayChangeDetailsWithItemsChanged:(BOOL)a3
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  void *v14;
  char v16;
  char v17;

  v5 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v6 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v7 = -[PXVisualPositionsChangeDetails countBeforeChanges](self, "countBeforeChanges");
  if (v7 >= 1)
  {
    v8 = v7;
    for (i = 0; i != v8; ++i)
    {
      -[PXVisualPositionsChangeDetails visualPositionAfterApplyingChangesToIndex:](self, "visualPositionAfterApplyingChangesToIndex:", i);
      if (!v17)
        objc_msgSend(v5, "addIndex:", i);
    }
  }
  v10 = -[PXVisualPositionsChangeDetails countAfterChanges](self, "countAfterChanges");
  if (v10 >= 1)
  {
    v11 = v10;
    for (j = 0; j != v11; ++j)
    {
      -[PXVisualPositionsChangeDetails visualPositionAfterRevertingChangesFromIndex:](self, "visualPositionAfterRevertingChangesFromIndex:", j);
      if (!v16)
        objc_msgSend(v6, "addIndex:", j);
    }
  }
  if (a3)
  {
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndexesInRange:", 0, -[PXVisualPositionsChangeDetails countAfterChanges](self, "countAfterChanges"));
    objc_msgSend(v13, "removeIndexes:", v6);
  }
  else
  {
    v13 = 0;
  }
  v14 = (void *)objc_msgSend(objc_alloc((Class)off_1E50B1608), "initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:", v5, v6, 0, 0, v13);

  return v14;
}

- (int64_t)countBeforeChanges
{
  return self->_countBeforeChanges;
}

- (int64_t)anchorIndexBeforeChanges
{
  return self->_anchorIndexBeforeChanges;
}

- (NSIndexSet)headerIndexesBeforeChanges
{
  return self->_headerIndexesBeforeChanges;
}

- (int64_t)countAfterChanges
{
  return self->_countAfterChanges;
}

- (int64_t)anchorIndexAfterChanges
{
  return self->_anchorIndexAfterChanges;
}

- (NSIndexSet)headerIndexesAfterChanges
{
  return self->_headerIndexesAfterChanges;
}

- (int64_t)anchorBodyIndexBeforeChanges
{
  return self->_anchorBodyIndexBeforeChanges;
}

- (int64_t)anchorBodyIndexAfterChanges
{
  return self->_anchorBodyIndexAfterChanges;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerIndexesAfterChanges, 0);
  objc_storeStrong((id *)&self->_headerIndexesBeforeChanges, 0);
}

+ (PXVisualPositionsChangeDetails)changeDetailsWithCountBeforeChanges:(int64_t)a3 anchorIndexBeforeChanges:(int64_t)a4 countAfterChanges:(int64_t)a5 anchorIndexAfterChanges:(int64_t)a6 anchorFan:(int64_t)a7 anchorReload:(int64_t)a8
{
  return (PXVisualPositionsChangeDetails *)objc_msgSend(a1, "changeDetailsWithCountBeforeChanges:anchorIndexBeforeChanges:headerIndexesBeforeChanges:countAfterChanges:anchorIndexAfterChanges:headerIndexesAfterChanges:anchorFan:anchorReload:", a3, a4, 0, a5, a6, 0, a7, a8);
}

+ (PXVisualPositionsChangeDetails)changeDetailsWithCountBeforeChanges:(int64_t)a3 anchorIndexBeforeChanges:(int64_t)a4 countAfterChanges:(int64_t)a5 anchorIndexAfterChanges:(int64_t)a6 anchorFan:(int64_t)a7
{
  return (PXVisualPositionsChangeDetails *)objc_msgSend(a1, "changeDetailsWithCountBeforeChanges:anchorIndexBeforeChanges:countAfterChanges:anchorIndexAfterChanges:anchorFan:anchorReload:", a3, a4, a5, a6, a7, 0);
}

+ (PXVisualPositionsChangeDetails)changeDetailsWithCountBeforeChanges:(int64_t)a3 anchorIndexBeforeChanges:(int64_t)a4 headerIndexesBeforeChanges:(id)a5 countAfterChanges:(int64_t)a6 anchorIndexAfterChanges:(int64_t)a7 headerIndexesAfterChanges:(id)a8 anchorFan:(int64_t)a9 anchorReload:(int64_t)a10
{
  id v15;
  id v16;
  PXFanningVisualPositionsChangeDetails *v17;

  v15 = a8;
  v16 = a5;
  v17 = -[PXFanningVisualPositionsChangeDetails initWithCountBeforeChanges:anchorIndexBeforeChanges:headerIndexesBeforeChanges:countAfterChanges:anchorIndexAfterChanges:headerIndexesAfterChanges:anchorFan:anchorReload:]([PXFanningVisualPositionsChangeDetails alloc], "initWithCountBeforeChanges:anchorIndexBeforeChanges:headerIndexesBeforeChanges:countAfterChanges:anchorIndexAfterChanges:headerIndexesAfterChanges:anchorFan:anchorReload:", a3, a4, v16, a6, a7, v15, a9, a10);

  return (PXVisualPositionsChangeDetails *)v17;
}

+ (PXVisualPositionsChangeDetails)changeDetailsWithCountBeforeChanges:(int64_t)a3 anchorInserted:(int64_t)a4 indexBeforeChanges:(int64_t)a5 countAfterChanges:(int64_t)a6 anchorIndexAfterChanges:(int64_t)a7
{
  return (PXVisualPositionsChangeDetails *)objc_msgSend(a1, "changeDetailsWithCountBeforeChanges:anchorInserted:indexBeforeChanges:headerIndexesBeforeChanges:countAfterChanges:anchorIndexAfterChanges:headerIndexesAfterChanges:", a3, a4, a5, 0, a6, a7, 0);
}

+ (PXVisualPositionsChangeDetails)changeDetailsWithCountBeforeChanges:(int64_t)a3 anchorInserted:(int64_t)a4 indexBeforeChanges:(int64_t)a5 headerIndexesBeforeChanges:(id)a6 countAfterChanges:(int64_t)a7 anchorIndexAfterChanges:(int64_t)a8 headerIndexesAfterChanges:(id)a9
{
  id v15;
  id v16;
  PXAnchorInsertingOrRemovingVisualPositionsChangeDetails *v17;
  uint64_t v19;

  v15 = a9;
  v16 = a6;
  LOBYTE(v19) = 1;
  v17 = -[PXAnchorInsertingOrRemovingVisualPositionsChangeDetails initWithCountBeforeChanges:anchorIndexBeforeChanges:headerIndexesBeforeChanges:countAfterChanges:anchorIndexAfterChanges:headerIndexesAfterChanges:anchorInserted:relativePosition:]([PXAnchorInsertingOrRemovingVisualPositionsChangeDetails alloc], "initWithCountBeforeChanges:anchorIndexBeforeChanges:headerIndexesBeforeChanges:countAfterChanges:anchorIndexAfterChanges:headerIndexesAfterChanges:anchorInserted:relativePosition:", a3, a5, v16, a7, a8, v15, v19, a4);

  return (PXVisualPositionsChangeDetails *)v17;
}

+ (PXVisualPositionsChangeDetails)changeDetailsWithCountBeforeChanges:(int64_t)a3 anchorIndexBeforeChanges:(int64_t)a4 countAfterChanges:(int64_t)a5 anchorRemoved:(int64_t)a6 indexAfterChanges:(int64_t)a7
{
  return (PXVisualPositionsChangeDetails *)objc_msgSend(a1, "changeDetailsWithCountBeforeChanges:anchorIndexBeforeChanges:headerIndexesBeforeChanges:countAfterChanges:anchorRemoved:indexAfterChanges:headerIndexesAfterChanges:", a3, a4, 0, a5, a6, a7, 0);
}

+ (PXVisualPositionsChangeDetails)changeDetailsWithCountBeforeChanges:(int64_t)a3 anchorIndexBeforeChanges:(int64_t)a4 headerIndexesBeforeChanges:(id)a5 countAfterChanges:(int64_t)a6 anchorRemoved:(int64_t)a7 indexAfterChanges:(int64_t)a8 headerIndexesAfterChanges:(id)a9
{
  id v15;
  id v16;
  PXAnchorInsertingOrRemovingVisualPositionsChangeDetails *v17;
  uint64_t v19;

  v15 = a9;
  v16 = a5;
  LOBYTE(v19) = 0;
  v17 = -[PXAnchorInsertingOrRemovingVisualPositionsChangeDetails initWithCountBeforeChanges:anchorIndexBeforeChanges:headerIndexesBeforeChanges:countAfterChanges:anchorIndexAfterChanges:headerIndexesAfterChanges:anchorInserted:relativePosition:]([PXAnchorInsertingOrRemovingVisualPositionsChangeDetails alloc], "initWithCountBeforeChanges:anchorIndexBeforeChanges:headerIndexesBeforeChanges:countAfterChanges:anchorIndexAfterChanges:headerIndexesAfterChanges:anchorInserted:relativePosition:", a3, a4, v16, a6, a8, v15, v19, a7);

  return (PXVisualPositionsChangeDetails *)v17;
}

+ (PXVisualPositionsChangeDetails)changeDetailsWithCountBeforeChanges:(int64_t)a3 anchorIndexBeforeChanges:(int64_t)a4 headerIndexesBeforeChanges:(id)a5 countAfterChanges:(int64_t)a6 anchorIndexAfterChanges:(int64_t)a7 headerIndexesAfterChanges:(id)a8 reloadAllIncludingAnchor:(BOOL)a9
{
  id v14;
  id v15;
  PXReloadingVisualPositionsChangeDetails *v16;
  uint64_t v18;

  v14 = a8;
  v15 = a5;
  LOBYTE(v18) = a9;
  v16 = -[PXReloadingVisualPositionsChangeDetails initWithCountBeforeChanges:anchorIndexBeforeChanges:headerIndexesBeforeChanges:countAfterChanges:anchorIndexAfterChanges:headerIndexesAfterChanges:reloadAllIncludingAnchor:]([PXReloadingVisualPositionsChangeDetails alloc], "initWithCountBeforeChanges:anchorIndexBeforeChanges:headerIndexesBeforeChanges:countAfterChanges:anchorIndexAfterChanges:headerIndexesAfterChanges:reloadAllIncludingAnchor:", a3, a4, v15, a6, a7, v14, v18);

  return (PXVisualPositionsChangeDetails *)v16;
}

@end
