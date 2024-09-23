@implementation PXArrayChangeDetails

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexesWithChangesByProperty, 0);
  objc_storeStrong((id *)&self->_changedIndexes, 0);
  objc_storeStrong((id *)&self->_movesToIndexes, 0);
  objc_storeStrong((id *)&self->_insertedIndexes, 0);
  objc_storeStrong((id *)&self->_removedIndexes, 0);
}

+ (id)changeDetailsWithNoIncrementalChanges
{
  if (changeDetailsWithNoIncrementalChanges_onceToken != -1)
    dispatch_once(&changeDetailsWithNoIncrementalChanges_onceToken, &__block_literal_global_8);
  return (id)changeDetailsWithNoIncrementalChanges_changeDetails;
}

- (PXArrayChangeDetails)initWithIncrementalChangeDetailsRemovedIndexes:(id)a3 insertedIndexes:(id)a4 movesToIndexes:(id)a5 movesFromIndexes:(__CFArray *)a6 changedIndexes:(id)a7 indexesWithChangesByProperty:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  PXArrayChangeDetails *v20;
  uint64_t v21;
  CFIndex Count;
  void *v23;
  void *v24;
  NSIndexSet *v25;
  void *v26;
  void *v27;
  NSIndexSet *v28;
  NSIndexSet *removedIndexes;
  void *v30;
  void *v31;
  NSIndexSet *v32;
  NSIndexSet *v33;
  void *v34;
  void *v35;
  NSIndexSet *v36;
  NSIndexSet *insertedIndexes;
  void *v38;
  void *v39;
  NSIndexSet *v40;
  NSIndexSet *v41;
  uint64_t v42;
  NSIndexSet *v43;
  __CFArray *v44;
  NSIndexSet *movesToIndexes;
  const __CFAllocator *v46;
  CFIndex v47;
  CFMutableArrayRef MutableCopy;
  void *v49;
  objc_class *v50;
  NSIndexSet *v51;
  NSIndexSet *v52;
  NSIndexSet *changedIndexes;
  uint64_t v54;
  NSDictionary *indexesWithChangesByProperty;
  void *v57;
  objc_super v58;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a7;
  v19 = a8;
  v58.receiver = self;
  v58.super_class = (Class)PXArrayChangeDetails;
  v20 = -[PXArrayChangeDetails init](&v58, sel_init);
  if (v20)
  {
    v21 = objc_msgSend(v17, "count");
    if (a6)
      Count = CFArrayGetCount(a6);
    else
      Count = 0;
    if (v21 != Count)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "handleFailureInMethod:object:file:lineNumber:description:", a2, v20, CFSTR("PXArrayChangeDetails.m"), 317, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[movesToIndexes count] == (movesFromIndexes == nil ? 0 : CFArrayGetCount(movesFromIndexes))"));

    }
    if (objc_msgSend((id)objc_opt_class(), "_mutableCopyInputs"))
    {
      v23 = (void *)objc_msgSend(v15, "mutableCopy");
      v24 = v23;
      if (v23)
        v25 = v23;
      else
        v25 = (NSIndexSet *)objc_alloc_init(MEMORY[0x24BDD1698]);
      removedIndexes = v20->_removedIndexes;
      v20->_removedIndexes = v25;

      v30 = (void *)objc_msgSend(v16, "mutableCopy");
      v31 = v30;
      if (v30)
        v32 = v30;
      else
        v32 = (NSIndexSet *)objc_alloc_init(MEMORY[0x24BDD1698]);
      insertedIndexes = v20->_insertedIndexes;
      v20->_insertedIndexes = v32;

      v38 = (void *)objc_msgSend(v17, "mutableCopy");
      v39 = v38;
      if (v38)
        v40 = v38;
      else
        v40 = (NSIndexSet *)objc_alloc_init(MEMORY[0x24BDD1698]);
      movesToIndexes = v20->_movesToIndexes;
      v20->_movesToIndexes = v40;

      v46 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      if (a6)
      {
        v47 = CFArrayGetCount(a6);
        MutableCopy = CFArrayCreateMutableCopy(v46, v47, a6);
      }
      else
      {
        MutableCopy = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, 0);
      }
      v20->_movesFromIndexes = MutableCopy;
      v49 = (void *)objc_msgSend(v18, "mutableCopy");
      if (v49)
      {
LABEL_32:
        v51 = v49;
        v52 = v51;
LABEL_35:
        changedIndexes = v20->_changedIndexes;
        v20->_changedIndexes = v51;

        v54 = objc_msgSend(v19, "copy");
        indexesWithChangesByProperty = v20->_indexesWithChangesByProperty;
        v20->_indexesWithChangesByProperty = (NSDictionary *)v54;

        goto LABEL_36;
      }
      v50 = (objc_class *)MEMORY[0x24BDD1698];
    }
    else
    {
      v26 = (void *)objc_msgSend(v15, "copy");
      v27 = v26;
      if (v26)
        v28 = v26;
      else
        v28 = (NSIndexSet *)objc_alloc_init(MEMORY[0x24BDD15E0]);
      v33 = v20->_removedIndexes;
      v20->_removedIndexes = v28;

      v34 = (void *)objc_msgSend(v16, "copy");
      v35 = v34;
      if (v34)
        v36 = v34;
      else
        v36 = (NSIndexSet *)objc_alloc_init(MEMORY[0x24BDD15E0]);
      v41 = v20->_insertedIndexes;
      v20->_insertedIndexes = v36;

      v42 = objc_msgSend(v17, "copy");
      v43 = v20->_movesToIndexes;
      v20->_movesToIndexes = (NSIndexSet *)v42;

      if (a6)
        v44 = (__CFArray *)CFRetain(a6);
      else
        v44 = 0;
      v20->_movesFromIndexes = v44;
      v49 = (void *)objc_msgSend(v18, "copy");
      if (v49)
        goto LABEL_32;
      v50 = (objc_class *)MEMORY[0x24BDD15E0];
    }
    v51 = (NSIndexSet *)objc_alloc_init(v50);
    v52 = 0;
    goto LABEL_35;
  }
LABEL_36:

  return v20;
}

+ (BOOL)_mutableCopyInputs
{
  return 0;
}

- (id)changeDetailsShiftedBy:(int64_t)a3
{
  BOOL v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFArray *v19;
  CFIndex v20;
  __CFArray *v21;
  CFIndex i;
  char *ValueAtIndex;
  PXArrayChangeDetails *v24;
  CFArrayCallBacks v25;

  if (!-[PXArrayChangeDetails hasIncrementalChanges](self, "hasIncrementalChanges"))
    return self;
  v5 = -[PXArrayChangeDetails hasAnyChanges](self, "hasAnyChanges");
  if (!a3 || !v5)
    return self;
  -[PXArrayChangeDetails removedIndexes](self, "removedIndexes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    -[PXArrayChangeDetails removedIndexes](self, "removedIndexes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

  }
  else
  {
    v8 = (void *)objc_msgSend(0, "mutableCopy");
  }

  -[PXArrayChangeDetails insertedIndexes](self, "insertedIndexes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    -[PXArrayChangeDetails insertedIndexes](self, "insertedIndexes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");

  }
  else
  {
    v12 = (void *)objc_msgSend(0, "mutableCopy");
  }

  -[PXArrayChangeDetails movesToIndexes](self, "movesToIndexes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "count"))
  {
    -[PXArrayChangeDetails movesToIndexes](self, "movesToIndexes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v14, "mutableCopy");

  }
  else
  {
    v15 = (void *)objc_msgSend(0, "mutableCopy");
  }

  -[PXArrayChangeDetails changedIndexes](self, "changedIndexes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "count"))
  {
    -[PXArrayChangeDetails changedIndexes](self, "changedIndexes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "mutableCopy");

  }
  else
  {
    v18 = (void *)objc_msgSend(0, "mutableCopy");
  }

  objc_msgSend(v8, "shiftIndexesStartingAtIndex:by:", 0, a3);
  objc_msgSend(v12, "shiftIndexesStartingAtIndex:by:", 0, a3);
  objc_msgSend(v15, "shiftIndexesStartingAtIndex:by:", 0, a3);
  objc_msgSend(v18, "shiftIndexesStartingAtIndex:by:", 0, a3);
  v19 = 0;
  if (-[PXArrayChangeDetails hasMoves](self, "hasMoves"))
  {
    v20 = objc_msgSend(v15, "count");
    v21 = -[PXArrayChangeDetails movesFromIndexes](self, "movesFromIndexes");
    *(_OWORD *)&v25.version = xmmword_2514CF3E0;
    *(_OWORD *)&v25.release = unk_2514CF3F0;
    v25.equal = 0;
    v19 = CFArrayCreateMutable(0, v20, &v25);
    if (v20 >= 1)
    {
      for (i = 0; i != v20; ++i)
      {
        ValueAtIndex = (char *)CFArrayGetValueAtIndex(v21, i);
        CFArrayAppendValue(v19, &ValueAtIndex[a3]);
      }
    }
  }
  v24 = -[PXArrayChangeDetails initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:]([PXArrayChangeDetails alloc], "initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:", v8, v12, v15, v19, v18);
  if (v19)
    CFRelease(v19);

  return v24;
}

- (BOOL)hasMoves
{
  void *v2;
  BOOL v3;

  -[PXArrayChangeDetails movesToIndexes](self, "movesToIndexes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (NSIndexSet)movesToIndexes
{
  return self->_movesToIndexes;
}

- (BOOL)hasAnyInsertionsRemovalsOrMoves
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  if (!-[PXArrayChangeDetails hasIncrementalChanges](self, "hasIncrementalChanges"))
    return 1;
  -[PXArrayChangeDetails removedIndexes](self, "removedIndexes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
    return 1;
  -[PXArrayChangeDetails insertedIndexes](self, "insertedIndexes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  return v6 || -[NSIndexSet count](self->_movesToIndexes, "count") != 0;
}

- (BOOL)hasAnyChanges
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  if (!-[PXArrayChangeDetails hasIncrementalChanges](self, "hasIncrementalChanges"))
    return 1;
  -[PXArrayChangeDetails removedIndexes](self, "removedIndexes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
    return 1;
  -[PXArrayChangeDetails insertedIndexes](self, "insertedIndexes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
    return 1;
  -[PXArrayChangeDetails changedIndexes](self, "changedIndexes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  return v8 || -[NSIndexSet count](self->_movesToIndexes, "count") != 0;
}

- (BOOL)hasIncrementalChanges
{
  return 1;
}

- (NSIndexSet)insertedIndexes
{
  return self->_insertedIndexes;
}

- (NSIndexSet)removedIndexes
{
  return self->_removedIndexes;
}

- (NSIndexSet)changedIndexes
{
  return self->_changedIndexes;
}

- (PXArrayChangeDetails)initWithIncrementalChangeDetailsRemovedIndexes:(id)a3 insertedIndexes:(id)a4 movesToIndexes:(id)a5 movesFromIndexes:(__CFArray *)a6 changedIndexes:(id)a7
{
  return -[PXArrayChangeDetails initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:indexesWithChangesByProperty:](self, "initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:indexesWithChangesByProperty:", a3, a4, a5, a6, a7, 0);
}

- (void)dealloc
{
  __CFArray *movesFromIndexes;
  objc_super v4;

  movesFromIndexes = self->_movesFromIndexes;
  if (movesFromIndexes)
  {
    CFRelease(movesFromIndexes);
    self->_movesFromIndexes = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)PXArrayChangeDetails;
  -[PXArrayChangeDetails dealloc](&v4, sel_dealloc);
}

- (void)applyToDictionary:(id)a3 removalHandler:(id)a4 moveHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  if (-[PXArrayChangeDetails hasAnyInsertionsRemovalsOrMoves](self, "hasAnyInsertionsRemovalsOrMoves"))
  {
    v10 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v11, "removeAllObjects");
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __69__PXArrayChangeDetails_applyToDictionary_removalHandler_moveHandler___block_invoke;
    v12[3] = &unk_2514D04A8;
    v12[4] = self;
    v14 = v8;
    v13 = v11;
    v15 = v9;
    objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v12);

  }
}

- (void)applyToIndexSet:(id)a3
{
  id v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    -[PXArrayChangeDetails indexSetAfterApplyingChangesToIndexSet:](self, "indexSetAfterApplyingChangesToIndexSet:", v5);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (v4 != v5)
    {
      objc_msgSend(v5, "removeAllIndexes");
      objc_msgSend(v5, "addIndexes:", v4);
    }

  }
}

void __69__PXArrayChangeDetails_applyToDictionary_removalHandler_moveHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v13 = a3;
  v5 = objc_msgSend(a2, "unsignedIntegerValue");
  v6 = objc_msgSend(*(id *)(a1 + 32), "indexAfterApplyingChangesToIndex:", v5);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = *(_QWORD *)(a1 + 48);
    v8 = v13;
    if (v7)
    {
      (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, v5, v13);
LABEL_6:
      v8 = v13;
    }
  }
  else
  {
    v9 = v6;
    v10 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, v11);

    v12 = *(_QWORD *)(a1 + 56);
    v8 = v13;
    if (v12)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t, id))(v12 + 16))(v12, v5, v9, v13);
      goto LABEL_6;
    }
  }

}

- (unint64_t)indexAfterApplyingChangesToIndex:(unint64_t)a3
{
  unint64_t v3;
  uint64_t v5;
  NSIndexSet *removedIndexes;
  NSIndexSet *insertedIndexes;
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  unint64_t v15;

  v3 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = a3;
    v5 = MEMORY[0x24BDAC760];
    removedIndexes = self->_removedIndexes;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __57__PXArrayChangeDetails_indexAfterApplyingChangesToIndex___block_invoke;
    v11[3] = &unk_2514D09F0;
    v11[4] = &v12;
    -[NSIndexSet enumerateRangesWithOptions:usingBlock:](removedIndexes, "enumerateRangesWithOptions:usingBlock:", 2, v11);
    if (v13[3] != 0x7FFFFFFFFFFFFFFFLL)
    {
      insertedIndexes = self->_insertedIndexes;
      v10[0] = v5;
      v10[1] = 3221225472;
      v10[2] = __57__PXArrayChangeDetails_indexAfterApplyingChangesToIndex___block_invoke_2;
      v10[3] = &unk_2514D09F0;
      v10[4] = &v12;
      -[NSIndexSet enumerateRangesUsingBlock:](insertedIndexes, "enumerateRangesUsingBlock:", v10);
      if (v13[3] != 0x7FFFFFFFFFFFFFFFLL)
      {
        if (-[PXArrayChangeDetails hasMoves](self, "hasMoves"))
        {
          v9[0] = v5;
          v9[1] = 3221225472;
          v9[2] = __57__PXArrayChangeDetails_indexAfterApplyingChangesToIndex___block_invoke_3;
          v9[3] = &unk_2514D0430;
          v9[4] = &v12;
          -[PXArrayChangeDetails enumerateMovedIndexesUsingBlock:](self, "enumerateMovedIndexesUsingBlock:", v9);
        }
      }
    }
    v3 = v13[3];
    _Block_object_dispose(&v12, 8);
  }
  return v3;
}

- (NSDictionary)indexesWithChangesByProperty
{
  return self->_indexesWithChangesByProperty;
}

- (id)indexSetAfterApplyingChangesToIndexSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  void *v19;
  id v20;
  id v21;

  v4 = a3;
  if (!-[PXArrayChangeDetails hasIncrementalChanges](self, "hasIncrementalChanges"))
  {
    objc_msgSend(MEMORY[0x24BDD15E0], "indexSet");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  -[PXArrayChangeDetails insertedIndexes](self, "insertedIndexes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count"))
  {
    -[PXArrayChangeDetails removedIndexes](self, "removedIndexes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {

      goto LABEL_5;
    }
    v15 = -[PXArrayChangeDetails hasMoves](self, "hasMoves");

    if (v15)
      goto LABEL_6;
    v13 = v4;
LABEL_10:
    v12 = v13;
    goto LABEL_11;
  }
LABEL_5:

LABEL_6:
  v7 = (void *)objc_msgSend(v4, "mutableCopy");
  -[PXArrayChangeDetails removedIndexes](self, "removedIndexes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "px_adjustIndexesForDeletions:", v8);

  -[PXArrayChangeDetails insertedIndexes](self, "insertedIndexes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "px_adjustIndexesForInsertions:", v9);

  if (-[PXArrayChangeDetails hasMoves](self, "hasMoves"))
  {
    v10 = (void *)objc_msgSend(v7, "copy");
    v16 = MEMORY[0x24BDAC760];
    v17 = 3221225472;
    v18 = __63__PXArrayChangeDetails_indexSetAfterApplyingChangesToIndexSet___block_invoke;
    v19 = &unk_2514D0480;
    v20 = v7;
    v21 = v10;
    v11 = v10;
    -[PXArrayChangeDetails enumerateMovedRangesUsingBlock:](self, "enumerateMovedRangesUsingBlock:", &v16);

  }
  v12 = (void *)objc_msgSend(v7, "copy", v16, v17, v18, v19);

LABEL_11:
  return v12;
}

- (id)indexSetAfterRevertingChangesToIndexSet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  void *v19;
  id v20;
  id v21;

  v4 = a3;
  if (!-[PXArrayChangeDetails hasIncrementalChanges](self, "hasIncrementalChanges"))
  {
    objc_msgSend(MEMORY[0x24BDD15E0], "indexSet");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  -[PXArrayChangeDetails insertedIndexes](self, "insertedIndexes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "count"))
  {
    -[PXArrayChangeDetails removedIndexes](self, "removedIndexes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {

      goto LABEL_5;
    }
    v15 = -[PXArrayChangeDetails hasMoves](self, "hasMoves");

    if (v15)
      goto LABEL_6;
    v13 = v4;
LABEL_10:
    v12 = v13;
    goto LABEL_11;
  }
LABEL_5:

LABEL_6:
  v7 = (void *)objc_msgSend(v4, "mutableCopy");
  objc_msgSend(v7, "addIndexes:", v4);
  if (-[PXArrayChangeDetails hasMoves](self, "hasMoves"))
  {
    v8 = (void *)objc_msgSend(v4, "mutableCopy");
    v16 = MEMORY[0x24BDAC760];
    v17 = 3221225472;
    v18 = __64__PXArrayChangeDetails_indexSetAfterRevertingChangesToIndexSet___block_invoke;
    v19 = &unk_2514D0480;
    v20 = v7;
    v21 = v8;
    v9 = v8;
    -[PXArrayChangeDetails enumerateMovedRangesUsingBlock:](self, "enumerateMovedRangesUsingBlock:", &v16);

  }
  -[PXArrayChangeDetails insertedIndexes](self, "insertedIndexes", v16, v17, v18, v19);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "px_adjustIndexesForDeletions:", v10);

  -[PXArrayChangeDetails removedIndexes](self, "removedIndexes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "px_adjustIndexesForInsertions:", v11);

  v12 = (void *)objc_msgSend(v7, "copy");
LABEL_11:

  return v12;
}

- (BOOL)canPreserveIncrementalChangesWhenAddingChangeDetails:(id)a3
{
  id v4;
  int v5;

  v4 = a3;
  if (-[PXArrayChangeDetails hasIncrementalChanges](self, "hasIncrementalChanges")
    && objc_msgSend(v4, "hasIncrementalChanges"))
  {
    if (-[PXArrayChangeDetails hasMoves](self, "hasMoves"))
      v5 = objc_msgSend(v4, "hasAnyInsertionsRemovalsOrMoves") ^ 1;
    else
      LOBYTE(v5) = 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

+ (id)changeDetailsWithRemovedIndexRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  id v5;
  void *v6;
  void *v7;

  length = a3.length;
  location = a3.location;
  v5 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", location, length);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:", v6, 0, 0, 0, 0);

  return v7;
}

+ (id)changeDetailsWithInsertedIndexRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  id v5;
  void *v6;
  void *v7;

  length = a3.length;
  location = a3.location;
  v5 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", location, length);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:", 0, v6, 0, 0, 0);

  return v7;
}

+ (id)changeDetailsWithChangedIndexRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  id v5;
  void *v6;
  void *v7;

  length = a3.length;
  location = a3.location;
  v5 = objc_alloc((Class)a1);
  objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", location, length);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:", 0, 0, 0, 0, v6);

  return v7;
}

+ (id)changeDetailsFromArray:(id)a3 toArray:(id)a4 changedObjects:(id)a5
{
  return +[PXArrayChangeDetails changeDetailsFromArray:toArray:changedObjects:objectComparator:](PXArrayChangeDetails, "changeDetailsFromArray:toArray:changedObjects:objectComparator:", a3, a4, a5, 0);
}

+ (id)changeDetailsWithNoChanges
{
  id v3;

  if ((id)objc_opt_class() == a1)
  {
    if (changeDetailsWithNoChanges_onceToken != -1)
      dispatch_once(&changeDetailsWithNoChanges_onceToken, &__block_literal_global_5066);
    v3 = (id)changeDetailsWithNoChanges__sharedEmptyChangeDetails;
  }
  else
  {
    v3 = (id)objc_msgSend(objc_alloc((Class)a1), "initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:", 0, 0, 0, 0, 0);
  }
  return v3;
}

uint64_t __57__PXArrayChangeDetails_indexAfterApplyingChangesToIndex___block_invoke_2(uint64_t result, unint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v4;
  unint64_t v5;

  v4 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  v5 = *(_QWORD *)(v4 + 24);
  if (a2 <= v5)
    *(_QWORD *)(v4 + 24) = v5 + a3;
  else
    *a4 = 1;
  return result;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  PXMutableArrayChangeDetails *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFArray *v8;
  void *v9;
  PXMutableArrayChangeDetails *v10;

  if (-[PXArrayChangeDetails hasIncrementalChanges](self, "hasIncrementalChanges", a3))
  {
    v4 = [PXMutableArrayChangeDetails alloc];
    -[PXArrayChangeDetails removedIndexes](self, "removedIndexes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXArrayChangeDetails insertedIndexes](self, "insertedIndexes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXArrayChangeDetails movesToIndexes](self, "movesToIndexes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PXArrayChangeDetails movesFromIndexes](self, "movesFromIndexes");
    -[PXArrayChangeDetails changedIndexes](self, "changedIndexes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PXArrayChangeDetails initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:](v4, "initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:", v5, v6, v7, v8, v9);

    return v10;
  }
  else
  {
    +[PXMutableArrayChangeDetails changeDetailsWithNoIncrementalChanges](PXMutableArrayChangeDetails, "changeDetailsWithNoIncrementalChanges");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (__CFArray)movesFromIndexes
{
  return self->_movesFromIndexes;
}

+ (id)changeDetailsFromArray:(id)a3 toArray:(id)a4 changedObjects:(id)a5 objectComparator:(id)a6
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v14;
  id v15;
  id v16;
  id v17;
  CFTypeRef v18;

  v17 = 0;
  v18 = 0;
  v15 = 0;
  v16 = 0;
  v14 = 0;
  PXDiffArraysWithObjectComparator(a3, a4, a5, (uint64_t)a6, &v17, &v16, &v15, &v18, &v14);
  v7 = v17;
  v8 = v16;
  v9 = v15;
  v10 = v14;
  v11 = objc_alloc((Class)a1);
  v12 = (void *)objc_msgSend(v11, "initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:", v7, v8, v9, v18, v10);

  return v12;
}

void __61__PXArrayChangeDetails_changeDetailsWithNoIncrementalChanges__block_invoke()
{
  _PXArrayNoIncrementalChangeDetails *v0;
  void *v1;

  v0 = -[PXArrayChangeDetails initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:]([_PXArrayNoIncrementalChangeDetails alloc], "initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:", 0, 0, 0, 0, 0);
  v1 = (void *)changeDetailsWithNoIncrementalChanges_changeDetails;
  changeDetailsWithNoIncrementalChanges_changeDetails = (uint64_t)v0;

}

void __50__PXArrayChangeDetails_changeDetailsWithNoChanges__block_invoke()
{
  PXArrayChangeDetails *v0;
  void *v1;

  v0 = -[PXArrayChangeDetails initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:]([PXArrayChangeDetails alloc], "initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:", 0, 0, 0, 0, 0);
  v1 = (void *)changeDetailsWithNoChanges__sharedEmptyChangeDetails;
  changeDetailsWithNoChanges__sharedEmptyChangeDetails = (uint64_t)v0;

}

+ (id)changeDetailsFromSubrange:(_NSRange)a3 toSubrange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v6;
  NSUInteger v7;
  NSRange v9;
  PXArrayChangeDetails *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  NSUInteger v16;
  void *v17;
  uint64_t v18;
  NSUInteger v19;
  void *v20;
  NSUInteger v21;
  CFMutableArrayRef Mutable;
  objc_class *v24;
  _QWORD v25[6];

  length = a4.length;
  location = a4.location;
  v6 = a3.length;
  v7 = a3.location;
  v9 = NSIntersectionRange(a3, a4);
  if (v7 != location
    || v6 != length
    || (objc_msgSend(a1, "changeDetailsWithNoChanges"),
        (v10 = (PXArrayChangeDetails *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (v9.length && v9.location != 0x7FFFFFFFFFFFFFFFLL
      || (objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", 0, length),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", 0, v6),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = -[PXArrayChangeDetails initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:]([PXArrayChangeDetails alloc], "initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:", v12, v11, 0, 0, 0), v12, v11, !v10))
    {
      v24 = (objc_class *)a1;
      v13 = objc_alloc_init(MEMORY[0x24BDD1698]);
      v14 = objc_alloc_init(MEMORY[0x24BDD1698]);
      v15 = objc_alloc_init(MEMORY[0x24BDD1698]);
      if (v7 >= location)
      {
        if (v7 <= location)
          goto LABEL_12;
        v16 = v7 - location;
        v17 = v14;
      }
      else
      {
        v16 = location - v7;
        v17 = v13;
      }
      objc_msgSend(v17, "addIndexesInRange:", 0, v16);
LABEL_12:
      v18 = location + length - (v7 + v6);
      if (v18 < 0)
      {
        v19 = location + length - v7;
        v18 = v7 + v6 - (location + length);
        v20 = v13;
      }
      else
      {
        if (location + length == v7 + v6)
        {
LABEL_17:
          if (v9.length)
          {
            objc_msgSend(v15, "addIndexesInRange:", v9.location - location, v9.length);
            v21 = v7 - location;
            Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], objc_msgSend(v15, "count"), 0);
            v25[0] = MEMORY[0x24BDAC760];
            v25[1] = 3221225472;
            v25[2] = __61__PXArrayChangeDetails_changeDetailsFromSubrange_toSubrange___block_invoke;
            v25[3] = &__block_descriptor_48_e12_v24__0Q8_B16l;
            v25[4] = Mutable;
            v25[5] = v21;
            objc_msgSend(v15, "enumerateIndexesUsingBlock:", v25);
          }
          else
          {
            Mutable = 0;
          }
          v10 = (PXArrayChangeDetails *)objc_msgSend([v24 alloc], "initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:", v13, v14, v15, Mutable, 0);
          if (Mutable)
            CFRelease(Mutable);

          return v10;
        }
        v19 = v7 + v6 - location;
        v20 = v14;
      }
      objc_msgSend(v20, "addIndexesInRange:", v19, v18);
      goto LABEL_17;
    }
  }
  return v10;
}

+ (id)changeDetailsWithChangedIndexes:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:", 0, 0, 0, 0, v4);

  return v5;
}

+ (id)changeDetailsWithMovedFromIndexRange:(_NSRange)a3 toIndexRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v6;
  NSUInteger v7;
  NSRange v10;
  NSUInteger v11;
  NSUInteger v12;
  void *v13;
  BOOL v14;
  NSUInteger v15;
  NSUInteger v16;
  __CFArray *v17;
  NSUInteger v19;
  void *v20;
  void *v22;
  void *v23;
  CFArrayCallBacks callBacks;
  NSRange v25;
  NSRange v26;

  length = a4.length;
  location = a4.location;
  v6 = a3.length;
  v7 = a3.location;
  if (a3.length != a4.length)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXArrayChangeDetails.m"), 190, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fromIndexRange.length == toIndexRange.length"));

  }
  if (v7 + v6 > location && location + length > v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXArrayChangeDetails.m"), 191, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("NSMaxRange(fromIndexRange) <= toIndexRange.location || NSMaxRange(toIndexRange) <= fromIndexRange.location"));

  }
  v25.location = v7;
  v25.length = v6;
  v26.location = location;
  v26.length = length;
  v10 = NSUnionRange(v25, v26);
  v11 = v10.location;
  v12 = v10.length;
  objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndexesInRange:", v10.location, v10.length);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v7 >= location;
  v15 = v7 - location;
  if (v14)
    v16 = -(uint64_t)v6;
  else
    v16 = v6;
  *(_OWORD *)&callBacks.version = xmmword_2514CF3E0;
  *(_OWORD *)&callBacks.release = unk_2514CF3F0;
  callBacks.equal = 0;
  v17 = CFArrayCreateMutable(0, v10.length, &callBacks);
  if (v10.location < v10.location + v10.length)
  {
    do
    {
      if (v11 - location >= length || location > v11)
        v19 = v16;
      else
        v19 = v15;
      CFArrayAppendValue(v17, (const void *)(v19 + v11++));
      --v12;
    }
    while (v12);
  }
  v20 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:", 0, 0, v13, v17, 0);
  CFRelease(v17);

  return v20;
}

+ (id)changeDetailsWithOldKeyItemIndex:(int64_t)a3 oldCount:(int64_t)a4 newKeyItemIndex:(int64_t)a5 newCount:(int64_t)a6
{
  void *v10;
  void *v11;
  void *v12;

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1698]), "initWithIndexesInRange:", 0, a4);
  objc_msgSend(v10, "removeIndex:", a3);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1698]), "initWithIndexesInRange:", 0, a6);
  objc_msgSend(v11, "removeIndex:", a5);
  v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:", v10, v11, 0, 0, 0);

  return v12;
}

+ (unint64_t)indexAfterApplyingChanges:(id)a3 toIndex:(unint64_t)a4 objectChanged:(BOOL *)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = a3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        a4 = objc_msgSend(v13, "indexAfterApplyingChangesToIndex:", a4, (_QWORD)v16);
        objc_msgSend(v13, "changedIndexes");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v10 |= objc_msgSend(v14, "containsIndex:", a4);

        if (a4 == 0x7FFFFFFFFFFFFFFFLL)
        {
          a4 = 0x7FFFFFFFFFFFFFFFLL;
          goto LABEL_12;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v9)
        continue;
      break;
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }
LABEL_12:

  if (a5)
    *a5 = v10 & (a4 != 0x7FFFFFFFFFFFFFFFLL);

  return a4;
}

+ (unint64_t)indexAfterRevertingChanges:(id)a3 fromIndex:(unint64_t)a4 objectChanged:(BOOL *)a5
{
  id v7;
  char v8;
  unint64_t v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  unint64_t v19;

  v7 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __75__PXArrayChangeDetails_indexAfterRevertingChanges_fromIndex_objectChanged___block_invoke;
  v11[3] = &unk_2514D0390;
  v11[4] = &v12;
  v11[5] = &v16;
  objc_msgSend(v7, "enumerateObjectsWithOptions:usingBlock:", 2, v11);
  if (a5)
  {
    v8 = *((_BYTE *)v13 + 24);
    if (v8)
      v8 = v17[3] != 0x7FFFFFFFFFFFFFFFLL;
    *a5 = v8;
  }
  v9 = v17[3];
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);

  return v9;
}

+ (id)changeDetailsByMergingChangeDetails:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  id v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (!objc_msgSend(v3, "count"))
  {
    +[PXArrayChangeDetails changeDetailsWithNoChanges](PXArrayChangeDetails, "changeDetailsWithNoChanges");
    v4 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (objc_msgSend(v3, "count") == 1)
  {
    objc_msgSend(v3, "firstObject");
    v4 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v5 = (void *)v4;
    goto LABEL_24;
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (v9)
        {
          if (!objc_msgSend(v9, "canPreserveIncrementalChangesWhenAddingChangeDetails:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i)))
          {
            +[PXArrayChangeDetails changeDetailsWithNoIncrementalChanges](PXArrayChangeDetails, "changeDetailsWithNoIncrementalChanges");
            v13 = (id)objc_claimAutoreleasedReturnValue();
            goto LABEL_22;
          }
          objc_msgSend(v9, "addChangeDetails:", v12);
        }
        else
        {
          v9 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "mutableCopy", (_QWORD)v16);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v8)
        continue;
      break;
    }
  }
  else
  {
    v9 = 0;
  }

  v14 = (void *)objc_msgSend(v9, "copy");
  if (v14)
  {
    v13 = v14;
    v6 = v13;
LABEL_22:
    v5 = v13;
  }
  else
  {
    +[PXArrayChangeDetails changeDetailsWithNoIncrementalChanges](PXArrayChangeDetails, "changeDetailsWithNoIncrementalChanges");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 0;
  }

LABEL_24:
  return v5;
}

- (id)changeDetailsByReplacingChangedItemsWithRemovalsAndInsertions
{
  PXArrayChangeDetails *v2;
  void *v3;
  PXArrayChangeDetails *v4;
  uint64_t v5;

  v2 = self;
  -[PXArrayChangeDetails changedIndexes](v2, "changedIndexes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = -[PXArrayChangeDetails initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:]([PXArrayChangeDetails alloc], "initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:", v3, v3, 0, 0, 0);
    -[PXArrayChangeDetails changeDetailsByAddingChangeDetails:](v2, "changeDetailsByAddingChangeDetails:", v4);
    v5 = objc_claimAutoreleasedReturnValue();

    v2 = (PXArrayChangeDetails *)v5;
  }

  return v2;
}

- (PXArrayChangeDetails)init
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXArrayChangeDetails.m"), 307, CFSTR("%@ not supported"), v5);

  abort();
}

- (id)changeDetailsByAddingChangedIndexes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  PXArrayChangeDetails *v8;
  PXArrayChangeDetails *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  if (-[PXArrayChangeDetails hasIncrementalChanges](self, "hasIncrementalChanges"))
  {
    -[PXArrayChangeDetails changedIndexes](self, "changedIndexes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      -[PXArrayChangeDetails changedIndexes](self, "changedIndexes");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v6, "mutableCopy");

    }
    else
    {
      v7 = (void *)objc_opt_new();
    }

    objc_msgSend(v7, "addIndexes:", v4);
    v9 = [PXArrayChangeDetails alloc];
    -[PXArrayChangeDetails removedIndexes](self, "removedIndexes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXArrayChangeDetails insertedIndexes](self, "insertedIndexes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXArrayChangeDetails movesToIndexes](self, "movesToIndexes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PXArrayChangeDetails initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:](v9, "initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:", v10, v11, v12, -[PXArrayChangeDetails movesFromIndexes](self, "movesFromIndexes"), v7);

  }
  else
  {
    v8 = self;
  }

  return v8;
}

- (void)enumerateMovedRangesUsingBlock:(id)a3
{
  id v5;
  void *v6;
  NSIndexSet *movesToIndexes;
  _QWORD v8[5];
  id v9;
  _QWORD *v10;
  SEL v11;
  _QWORD v12[4];

  v5 = a3;
  v6 = v5;
  movesToIndexes = self->_movesToIndexes;
  if (movesToIndexes)
  {
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x2020000000;
    v12[3] = 0;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __55__PXArrayChangeDetails_enumerateMovedRangesUsingBlock___block_invoke;
    v8[3] = &unk_2514D03B8;
    v8[4] = self;
    v10 = v12;
    v11 = a2;
    v9 = v5;
    -[NSIndexSet enumerateRangesUsingBlock:](movesToIndexes, "enumerateRangesUsingBlock:", v8);

    _Block_object_dispose(v12, 8);
  }

}

- (void)enumerateMovedIndexesUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __56__PXArrayChangeDetails_enumerateMovedIndexesUsingBlock___block_invoke;
  v6[3] = &unk_2514D03E0;
  v7 = v4;
  v5 = v4;
  -[PXArrayChangeDetails enumerateMovedRangesUsingBlock:](self, "enumerateMovedRangesUsingBlock:", v6);

}

- (id)indexesWithChangesToProperty:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[NSDictionary objectForKeyedSubscript:](self->_indexesWithChangesByProperty, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD15E0], "indexSet");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)changedPropertiesForIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__5028;
  v14 = __Block_byref_object_dispose__5029;
  v15 = 0;
  -[PXArrayChangeDetails indexesWithChangesByProperty](self, "indexesWithChangesByProperty");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __50__PXArrayChangeDetails_changedPropertiesForIndex___block_invoke;
  v9[3] = &unk_2514D0408;
  v9[5] = &v10;
  v9[6] = a3;
  v9[4] = self;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v9);

  v6 = (void *)v11[5];
  if (v6)
    v7 = (void *)objc_msgSend(v6, "copy");
  else
    v7 = (void *)MEMORY[0x24BDBD1A8];
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (unint64_t)indexAfterRevertingChangesFromIndex:(unint64_t)a3
{
  unint64_t v3;
  _BOOL4 v5;
  uint64_t v6;
  NSIndexSet *insertedIndexes;
  NSIndexSet *removedIndexes;
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  unint64_t v16;

  v3 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = a3;
    v5 = -[PXArrayChangeDetails hasMoves](self, "hasMoves");
    v6 = MEMORY[0x24BDAC760];
    if (v5)
    {
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __60__PXArrayChangeDetails_indexAfterRevertingChangesFromIndex___block_invoke;
      v12[3] = &unk_2514D0430;
      v12[4] = &v13;
      -[PXArrayChangeDetails enumerateMovedIndexesUsingBlock:](self, "enumerateMovedIndexesUsingBlock:", v12);
    }
    insertedIndexes = self->_insertedIndexes;
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __60__PXArrayChangeDetails_indexAfterRevertingChangesFromIndex___block_invoke_2;
    v11[3] = &unk_2514D09F0;
    v11[4] = &v13;
    -[NSIndexSet enumerateRangesWithOptions:usingBlock:](insertedIndexes, "enumerateRangesWithOptions:usingBlock:", 2, v11);
    v3 = 0x7FFFFFFFFFFFFFFFLL;
    if (v14[3] != 0x7FFFFFFFFFFFFFFFLL)
    {
      removedIndexes = self->_removedIndexes;
      v10[0] = v6;
      v10[1] = 3221225472;
      v10[2] = __60__PXArrayChangeDetails_indexAfterRevertingChangesFromIndex___block_invoke_3;
      v10[3] = &unk_2514D09F0;
      v10[4] = &v13;
      -[NSIndexSet enumerateRangesUsingBlock:](removedIndexes, "enumerateRangesUsingBlock:", v10);
      v3 = v14[3];
    }
    _Block_object_dispose(&v13, 8);
  }
  return v3;
}

- (id)changeDetailsByAddingChangeDetails:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (-[PXArrayChangeDetails canPreserveIncrementalChangesWhenAddingChangeDetails:](self, "canPreserveIncrementalChangesWhenAddingChangeDetails:", v4))
  {
    v5 = (void *)-[PXArrayChangeDetails mutableCopy](self, "mutableCopy");
    objc_msgSend(v5, "addChangeDetails:", v4);
    v6 = (void *)objc_msgSend(v5, "copy");

  }
  else
  {
    +[PXArrayChangeDetails changeDetailsWithNoIncrementalChanges](PXArrayChangeDetails, "changeDetailsWithNoIncrementalChanges");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (BOOL)isOnlyInsertionAtEnd:(BOOL *)a3 orRemovalAtEnd:(BOOL *)a4 countBeforeChange:(int64_t)a5 countAfterChange:(int64_t)a6
{
  BOOL v11;
  BOOL v12;
  char v13;
  void *v15;
  void *v16;
  uint64_t v17;

  if (-[PXArrayChangeDetails hasIncrementalChanges](self, "hasIncrementalChanges")
    && !-[PXArrayChangeDetails hasMoves](self, "hasMoves"))
  {
    -[PXArrayChangeDetails insertedIndexes](self, "insertedIndexes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXArrayChangeDetails removedIndexes](self, "removedIndexes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");
    v12 = v17 == 0;
    if (v17)
    {
      if (objc_msgSend(v15, "count"))
      {
        v11 = 0;
        v13 = 0;
      }
      else
      {
        v13 = objc_msgSend(v16, "px_isSingleRangeWithMax:", a5);
        v11 = 1;
      }
    }
    else
    {
      v13 = objc_msgSend(v15, "px_isSingleRangeWithMax:", a6);
      v11 = 0;
    }

    if (!a3)
      goto LABEL_5;
  }
  else
  {
    v11 = 0;
    v12 = 0;
    v13 = 0;
    if (!a3)
      goto LABEL_5;
  }
  *a3 = v12;
LABEL_5:
  if (a4)
    *a4 = v11;
  return v13;
}

- (BOOL)isEqual:(id)a3
{
  PXArrayChangeDetails *v4;
  PXArrayChangeDetails *v5;
  BOOL v6;
  BOOL v7;
  uint64_t *v8;
  int IsEquivalentToIndexSet;
  int v10;
  int v11;
  int v12;
  NSDictionary *indexesWithChangesByProperty;
  NSDictionary *v14;
  NSDictionary *v15;
  NSDictionary *v16;
  char v17;
  char v18;
  NSIndexSet *movesToIndexes;
  _QWORD v21[5];
  PXArrayChangeDetails *v22;
  _QWORD *v23;
  uint64_t *v24;
  _QWORD v25[4];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v4 = (PXArrayChangeDetails *)a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  if (v4 == self)
  {
    v29 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[PXArrayChangeDetails hasMoves](self, "hasMoves");
      v7 = -[PXArrayChangeDetails hasMoves](v5, "hasMoves");
      v8 = v27;
      *((_BYTE *)v27 + 24) = v6 ^ v7 ^ 1;
      if (((v6 ^ v7) & 1) != 0)
      {
        *((_BYTE *)v8 + 24) = 0;
      }
      else
      {
        IsEquivalentToIndexSet = PXIndexSetIsEquivalentToIndexSet(self->_removedIndexes, v5->_removedIndexes);
        v8 = v27;
        *((_BYTE *)v27 + 24) = IsEquivalentToIndexSet;
        if (IsEquivalentToIndexSet)
        {
          v10 = PXIndexSetIsEquivalentToIndexSet(self->_insertedIndexes, v5->_insertedIndexes);
          v8 = v27;
          *((_BYTE *)v27 + 24) = v10;
          if (v10)
          {
            v11 = PXIndexSetIsEquivalentToIndexSet(self->_movesToIndexes, v5->_movesToIndexes);
            v8 = v27;
            *((_BYTE *)v27 + 24) = v11;
            if (v11)
            {
              v12 = PXIndexSetIsEquivalentToIndexSet(self->_changedIndexes, v5->_changedIndexes);
              v8 = v27;
              *((_BYTE *)v27 + 24) = v12;
              if (v12)
              {
                indexesWithChangesByProperty = v5->_indexesWithChangesByProperty;
                v14 = self->_indexesWithChangesByProperty;
                v15 = indexesWithChangesByProperty;
                if (v14 == v15)
                {

                  *((_BYTE *)v27 + 24) = 1;
                }
                else
                {
                  v16 = v15;
                  v17 = -[NSDictionary isEqual:](v14, "isEqual:", v15);

                  *((_BYTE *)v27 + 24) = v17;
                  if ((v17 & 1) == 0)
                  {
LABEL_17:

                    goto LABEL_18;
                  }
                }
                v25[0] = 0;
                v25[1] = v25;
                v25[2] = 0x2020000000;
                v25[3] = 0;
                movesToIndexes = self->_movesToIndexes;
                v21[0] = MEMORY[0x24BDAC760];
                v21[1] = 3221225472;
                v21[2] = __32__PXArrayChangeDetails_isEqual___block_invoke;
                v21[3] = &unk_2514D04D0;
                v21[4] = self;
                v23 = v25;
                v22 = v5;
                v24 = &v26;
                -[NSIndexSet enumerateIndexesUsingBlock:](movesToIndexes, "enumerateIndexesUsingBlock:", v21);

                _Block_object_dispose(v25, 8);
                goto LABEL_17;
              }
LABEL_16:
              *((_BYTE *)v8 + 24) = 0;
              goto LABEL_17;
            }
LABEL_15:
            *((_BYTE *)v8 + 24) = 0;
            goto LABEL_16;
          }
LABEL_14:
          *((_BYTE *)v8 + 24) = 0;
          goto LABEL_15;
        }
      }
      *((_BYTE *)v8 + 24) = 0;
      goto LABEL_14;
    }
  }
LABEL_18:
  v18 = *((_BYTE *)v27 + 24);
  _Block_object_dispose(&v26, 8);

  return v18;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSIndexSet count](self->_movesToIndexes, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x24BDAC760];
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __35__PXArrayChangeDetails_description__block_invoke;
  v26[3] = &unk_2514D04F8;
  v5 = v3;
  v27 = v5;
  -[PXArrayChangeDetails enumerateMovedIndexesUsingBlock:](self, "enumerateMovedIndexesUsingBlock:", v26);
  -[PXArrayChangeDetails indexesWithChangesByProperty](self, "indexesWithChangesByProperty");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7)
  {
    v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[PXArrayChangeDetails indexesWithChangesByProperty](self, "indexesWithChangesByProperty");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v4;
    v24[1] = 3221225472;
    v24[2] = __35__PXArrayChangeDetails_description__block_invoke_2;
    v24[3] = &unk_2514D0520;
    v25 = v8;
    v10 = v8;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v24);

    v11 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v10, "componentsJoinedByString:", CFSTR(", "));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR(" properties:{%@}"), v12);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = &stru_2514D17B8;
  }
  v14 = (void *)MEMORY[0x24BDD17C8];
  v23.receiver = self;
  v23.super_class = (Class)PXArrayChangeDetails;
  -[PXArrayChangeDetails description](&v23, sel_description);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PXArrayChangeDetails hasIncrementalChanges](self, "hasIncrementalChanges"))
    v16 = CFSTR("YES");
  else
    v16 = CFSTR("NO");
  -[NSIndexSet px_shortDescription](self->_removedIndexes, "px_shortDescription");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSIndexSet px_shortDescription](self->_insertedIndexes, "px_shortDescription");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSIndexSet px_shortDescription](self->_changedIndexes, "px_shortDescription");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("<%@ hasIncremental:%@ removed:%@ inserted:%@ moved:[%@] changed:%@%@>"), v15, v16, v17, v18, v19, v20, v13);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (void)setIndexesWithChangesByProperty:(id)a3
{
  objc_storeStrong((id *)&self->_indexesWithChangesByProperty, a3);
}

void __35__PXArrayChangeDetails_description__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%lu->%lu"), a2, a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

}

void __35__PXArrayChangeDetails_description__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v4 = *(void **)(a1 + 32);
  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = a2;
  objc_msgSend(a3, "px_shortDescription");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@:%@"), v6, v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObject:", v7);
}

const void *__32__PXArrayChangeDetails_isEqual___block_invoke(_QWORD *a1, uint64_t a2, _BYTE *a3)
{
  const void *ValueAtIndex;
  const void *result;

  ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1[4] + 32), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24));
  result = CFArrayGetValueAtIndex(*(CFArrayRef *)(a1[5] + 32), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24));
  if (ValueAtIndex != result)
  {
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 0;
    *a3 = 1;
  }
  ++*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
  return result;
}

void __64__PXArrayChangeDetails_indexSetAfterRevertingChangesToIndexSet___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  objc_msgSend(*(id *)(a1 + 32), "removeIndexesInRange:", a2, a3);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __64__PXArrayChangeDetails_indexSetAfterRevertingChangesToIndexSet___block_invoke_2;
  v11[3] = &unk_2514D0458;
  v10 = *(void **)(a1 + 40);
  v12 = *(id *)(a1 + 32);
  v13 = a4;
  v14 = a5;
  v15 = a2;
  v16 = a3;
  objc_msgSend(v10, "enumerateIndexesInRange:options:usingBlock:", a4, a5, 0, v11);

}

uint64_t __64__PXArrayChangeDetails_indexSetAfterRevertingChangesToIndexSet___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addIndex:", a2 - *(_QWORD *)(a1 + 40) + *(_QWORD *)(a1 + 56));
}

void __63__PXArrayChangeDetails_indexSetAfterApplyingChangesToIndexSet___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  objc_msgSend(*(id *)(a1 + 32), "removeIndexesInRange:", a4, a5);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __63__PXArrayChangeDetails_indexSetAfterApplyingChangesToIndexSet___block_invoke_2;
  v11[3] = &unk_2514D0458;
  v10 = *(void **)(a1 + 40);
  v12 = *(id *)(a1 + 32);
  v13 = a2;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  objc_msgSend(v10, "enumerateIndexesInRange:options:usingBlock:", a2, a3, 0, v11);

}

uint64_t __63__PXArrayChangeDetails_indexSetAfterApplyingChangesToIndexSet___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addIndex:", a2 - *(_QWORD *)(a1 + 40) + *(_QWORD *)(a1 + 56));
}

uint64_t __60__PXArrayChangeDetails_indexAfterRevertingChangesFromIndex___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v4;

  v4 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  if (*(_QWORD *)(v4 + 24) == a3)
  {
    *(_QWORD *)(v4 + 24) = a2;
    *a4 = 1;
  }
  return result;
}

uint64_t __60__PXArrayChangeDetails_indexAfterRevertingChangesFromIndex___block_invoke_2(uint64_t result, unint64_t a2, unint64_t a3, _BYTE *a4)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  v5 = *(_QWORD *)(v4 + 24);
  if (v5 < a2 || v5 - a2 >= a3)
  {
    if ((uint64_t)(a3 + a2 - 1) < v5)
      *(_QWORD *)(v4 + 24) = v5 - a3;
  }
  else
  {
    *(_QWORD *)(v4 + 24) = 0x7FFFFFFFFFFFFFFFLL;
    *a4 = 1;
  }
  return result;
}

uint64_t __60__PXArrayChangeDetails_indexAfterRevertingChangesFromIndex___block_invoke_3(uint64_t result, unint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v4;
  unint64_t v5;

  v4 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  v5 = *(_QWORD *)(v4 + 24);
  if (a2 <= v5)
    *(_QWORD *)(v4 + 24) = v5 + a3;
  else
    *a4 = 1;
  return result;
}

uint64_t __57__PXArrayChangeDetails_indexAfterApplyingChangesToIndex___block_invoke(uint64_t result, unint64_t a2, unint64_t a3, _BYTE *a4)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  v5 = *(_QWORD *)(v4 + 24);
  if (v5 < a2 || v5 - a2 >= a3)
  {
    if ((uint64_t)(a3 + a2 - 1) < v5)
      *(_QWORD *)(v4 + 24) = v5 - a3;
  }
  else
  {
    *(_QWORD *)(v4 + 24) = 0x7FFFFFFFFFFFFFFFLL;
    *a4 = 1;
  }
  return result;
}

uint64_t __57__PXArrayChangeDetails_indexAfterApplyingChangesToIndex___block_invoke_3(uint64_t result, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v4;

  v4 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  if (*(_QWORD *)(v4 + 24) == a2)
  {
    *(_QWORD *)(v4 + 24) = a3;
    *a4 = 1;
  }
  return result;
}

void __50__PXArrayChangeDetails_changedPropertiesForIndex___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  if (objc_msgSend(a3, "containsIndex:", *(_QWORD *)(a1 + 48)))
  {
    v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (!v5)
    {
      v6 = objc_alloc(MEMORY[0x24BDBCEB8]);
      objc_msgSend(*(id *)(a1 + 32), "indexesWithChangesByProperty");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "initWithCapacity:", objc_msgSend(v7, "count"));
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

      v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    }
    objc_msgSend(v5, "addObject:", v11);
  }

}

uint64_t __56__PXArrayChangeDetails_enumerateMovedIndexesUsingBlock___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _BYTE *a6)
{
  uint64_t v8;
  uint64_t v10;

  if (a3)
  {
    v8 = a3;
    v10 = result;
    do
    {
      if (*a6)
        break;
      result = (*(uint64_t (**)(void))(*(_QWORD *)(v10 + 32) + 16))();
      ++a4;
      ++a2;
      --v8;
    }
    while (v8);
  }
  return result;
}

void __55__PXArrayChangeDetails_enumerateMovedRangesUsingBlock___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFArray *v14;
  uint64_t v15;
  CFIndex v16;
  const void *ValueAtIndex;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint8_t buf[16];

  if (!a3)
    return;
  v7 = 0;
  v8 = 0;
  v9 = 0;
  v10 = 0x7FFFFFFFFFFFFFFFLL;
  v11 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    while (1)
    {
      v12 = v11;
      v13 = v9;
      v11 = v7 + a2;
      v14 = *(const __CFArray **)(a1[4] + 32);
      v15 = *(_QWORD *)(a1[6] + 8);
      v16 = *(_QWORD *)(v15 + 24);
      *(_QWORD *)(v15 + 24) = v16 + 1;
      ValueAtIndex = CFArrayGetValueAtIndex(v14, v16);
      v18 = (uint64_t)ValueAtIndex;
      v19 = 1;
      if (!v8 || v10 == 0x7FFFFFFFFFFFFFFFLL)
        break;
      if ((const void *)(v8 + v10) == ValueAtIndex)
      {
        v19 = v8 + 1;
        v18 = v10;
        break;
      }
      (*(void (**)(void))(a1[5] + 16))();
      if (*a4)
        return;
      ++v7;
      v8 = 1;
      v10 = v18;
      v9 = 1;
      if (v7 == a3)
        goto LABEL_20;
    }
    v8 = v19;
    v10 = v18;
    v9 = 1;
    if (v13 && v12 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v13 + v12 == v11)
      {
        v9 = v13 + 1;
        v11 = v12;
      }
      else
      {
        PXAssertGetLog();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_24430E000, v20, OS_LOG_TYPE_ERROR, "Expects contigous range...", buf, 2u);
        }

        v11 = v12;
        v9 = v13;
      }
    }
    ++v7;
  }
  while (v7 != a3);
  if (v8 && !*a4)
LABEL_20:
    (*(void (**)(void))(a1[5] + 16))();
}

void __75__PXArrayChangeDetails_indexAfterRevertingChanges_fromIndex_objectChanged___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  uint64_t v8;

  v6 = a2;
  objc_msgSend(v6, "changedIndexes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) |= objc_msgSend(v7, "containsIndex:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)+ 24));

  v8 = objc_msgSend(v6, "indexAfterRevertingChangesFromIndex:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v8;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL)
    *a4 = 1;
}

void __61__PXArrayChangeDetails_changeDetailsFromSubrange_toSubrange___block_invoke(uint64_t a1, uint64_t a2)
{
  CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 32), (const void *)(a2 - *(_QWORD *)(a1 + 40)));
}

@end
