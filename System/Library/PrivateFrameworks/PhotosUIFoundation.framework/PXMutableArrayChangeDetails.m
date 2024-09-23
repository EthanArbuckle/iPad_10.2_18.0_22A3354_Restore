@implementation PXMutableArrayChangeDetails

+ (BOOL)_mutableCopyInputs
{
  return 1;
}

- (void)_addInsertedRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v5;
  uint64_t v6;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;
  __int128 v12;

  length = a3.length;
  location = a3.location;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3010000000;
  v11 = &unk_244396D4B;
  v12 = xmmword_24438BBF0;
  -[PXArrayChangeDetails insertedIndexes](self, "insertedIndexes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __49__PXMutableArrayChangeDetails__addInsertedRange___block_invoke;
  v7[3] = &unk_2514D0570;
  v7[4] = &v8;
  v7[5] = location;
  objc_msgSend(v5, "enumerateRangesUsingBlock:", v7);
  v6 = v9[4];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    location = v9[5] + v6;
  objc_msgSend(v5, "shiftIndexesStartingAtIndex:by:", location + 1, length);
  objc_msgSend(v5, "addIndexesInRange:", location, length);

  _Block_object_dispose(&v8, 8);
}

- (void)addChangeDetails:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[PXArrayChangeDetails canPreserveIncrementalChangesWhenAddingChangeDetails:](self, "canPreserveIncrementalChangesWhenAddingChangeDetails:"))
  {
    objc_msgSend(v6, "removedIndexes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXMutableArrayChangeDetails _addRemovedIndexes:](self, "_addRemovedIndexes:", v4);

    objc_msgSend(v6, "insertedIndexes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXMutableArrayChangeDetails _addInsertedIndexes:](self, "_addInsertedIndexes:", v5);

    -[PXMutableArrayChangeDetails _updateMovesWithChangesDetails:](self, "_updateMovesWithChangesDetails:", v6);
    -[PXMutableArrayChangeDetails _updateChangedIndexesWithChangeDetails:](self, "_updateChangedIndexesWithChangeDetails:", v6);
    -[PXMutableArrayChangeDetails _updatePropertyChangesWithChangeDetails:](self, "_updatePropertyChangesWithChangeDetails:", v6);
  }
  else
  {
    -[PXMutableArrayChangeDetails _becomeNonIncremental](self, "_becomeNonIncremental");
  }

}

- (void)_updatePropertyChangesWithChangeDetails:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;

  v15 = a3;
  -[PXArrayChangeDetails indexesWithChangesByProperty](self, "indexesWithChangesByProperty");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {

LABEL_4:
    v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    -[PXArrayChangeDetails indexesWithChangesByProperty](self, "indexesWithChangesByProperty");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x24BDAC760];
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __71__PXMutableArrayChangeDetails__updatePropertyChangesWithChangeDetails___block_invoke;
    v18[3] = &unk_2514D0598;
    v10 = v15;
    v19 = v10;
    v11 = v7;
    v20 = v11;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v18);

    objc_msgSend(v10, "indexesWithChangesByProperty");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v9;
    v16[1] = 3221225472;
    v16[2] = __71__PXMutableArrayChangeDetails__updatePropertyChangesWithChangeDetails___block_invoke_2;
    v16[3] = &unk_2514D0520;
    v17 = v11;
    v13 = v11;
    objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v16);

    v14 = (void *)objc_msgSend(v13, "copy");
    -[PXArrayChangeDetails setIndexesWithChangesByProperty:](self, "setIndexesWithChangesByProperty:", v14);

    goto LABEL_5;
  }
  objc_msgSend(v15, "indexesWithChangesByProperty");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  if (v6)
    goto LABEL_4;
LABEL_5:

}

- (void)_updateMovesWithChangesDetails:(id)a3
{
  __CFArray *v4;
  CFIndex Count;
  const __CFArray *v6;
  void *v7;
  void *v8;
  id v9;
  CFRange v10;

  v9 = a3;
  if (objc_msgSend(v9, "hasMoves") && !-[PXArrayChangeDetails hasMoves](self, "hasMoves"))
  {
    v4 = -[PXArrayChangeDetails movesFromIndexes](self, "movesFromIndexes");
    Count = CFArrayGetCount((CFArrayRef)objc_msgSend(v9, "movesFromIndexes"));
    v6 = (const __CFArray *)objc_msgSend(v9, "movesFromIndexes");
    v10.location = 0;
    v10.length = Count;
    CFArrayAppendArray(v4, v6, v10);
    -[PXArrayChangeDetails movesToIndexes](self, "movesToIndexes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "movesToIndexes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addIndexes:", v8);

  }
}

- (void)_updateChangedIndexesWithChangeDetails:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[PXArrayChangeDetails changedIndexes](self, "changedIndexes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "indexSetAfterApplyingChangesToIndexSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 != v4)
  {
    objc_msgSend(v4, "removeAllIndexes");
    objc_msgSend(v4, "addIndexes:", v5);
  }
  objc_msgSend(v7, "changedIndexes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addIndexes:", v6);

}

- (void)_addRemovedIndexes:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  _QWORD v7[5];

  v4 = a3;
  -[PXArrayChangeDetails indexSetAfterRevertingChangesToIndexSet:](self, "indexSetAfterRevertingChangesToIndexSet:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "count");
  if (v5 == objc_msgSend(v4, "count"))
  {
    -[PXMutableArrayChangeDetails _addAdditionalRemovedIndexSet:afterChangesIndex:](self, "_addAdditionalRemovedIndexSet:afterChangesIndex:", v6, v4);
  }
  else
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __50__PXMutableArrayChangeDetails__addRemovedIndexes___block_invoke;
    v7[3] = &unk_2514D0E38;
    v7[4] = self;
    objc_msgSend(v4, "enumerateIndexesWithOptions:usingBlock:", 2, v7);
  }

}

- (void)_addInsertedIndexes:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __51__PXMutableArrayChangeDetails__addInsertedIndexes___block_invoke;
  v3[3] = &unk_2514D0978;
  v3[4] = self;
  objc_msgSend(a3, "enumerateRangesUsingBlock:", v3);
}

- (void)_addAdditionalRemovedIndexSet:(id)a3 afterChangesIndex:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[PXArrayChangeDetails removedIndexes](self, "removedIndexes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addIndexes:", v7);

  -[PXArrayChangeDetails insertedIndexes](self, "insertedIndexes");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "px_adjustIndexesForDeletions:", v6);

}

- (BOOL)hasIncrementalChanges
{
  return !self->_isNonIncremental;
}

uint64_t __51__PXMutableArrayChangeDetails__addInsertedIndexes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addInsertedRange:", a2, a3);
}

uint64_t __49__PXMutableArrayChangeDetails__addInsertedRange___block_invoke(uint64_t result, unint64_t a2, unint64_t a3, _BYTE *a4)
{
  unint64_t v4;
  uint64_t v6;

  v4 = *(_QWORD *)(result + 40);
  if (v4 < a2 || v4 - a2 >= a3)
  {
    if (v4 >= a2)
      return result;
  }
  else
  {
    v6 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
    *(_QWORD *)(v6 + 32) = a2;
    *(_QWORD *)(v6 + 40) = a3;
  }
  *a4 = 1;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PXArrayChangeDetails *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFArray *v8;
  void *v9;
  void *v10;
  PXArrayChangeDetails *v11;

  if (-[PXMutableArrayChangeDetails hasIncrementalChanges](self, "hasIncrementalChanges", a3))
  {
    v4 = [PXArrayChangeDetails alloc];
    -[PXArrayChangeDetails removedIndexes](self, "removedIndexes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXArrayChangeDetails insertedIndexes](self, "insertedIndexes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXArrayChangeDetails movesToIndexes](self, "movesToIndexes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PXArrayChangeDetails movesFromIndexes](self, "movesFromIndexes");
    -[PXArrayChangeDetails changedIndexes](self, "changedIndexes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXArrayChangeDetails indexesWithChangesByProperty](self, "indexesWithChangesByProperty");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PXArrayChangeDetails initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:indexesWithChangesByProperty:](v4, "initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:indexesWithChangesByProperty:", v5, v6, v7, v8, v9, v10);

    return v11;
  }
  else
  {
    +[PXArrayChangeDetails changeDetailsWithNoIncrementalChanges](PXArrayChangeDetails, "changeDetailsWithNoIncrementalChanges");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (void)_becomeNonIncremental
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (-[PXMutableArrayChangeDetails hasIncrementalChanges](self, "hasIncrementalChanges"))
  {
    self->_isNonIncremental = 1;
    -[PXArrayChangeDetails removedIndexes](self, "removedIndexes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeAllIndexes");

    -[PXArrayChangeDetails insertedIndexes](self, "insertedIndexes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeAllIndexes");

    -[PXArrayChangeDetails movesToIndexes](self, "movesToIndexes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeAllIndexes");

    CFArrayRemoveAllValues(-[PXArrayChangeDetails movesFromIndexes](self, "movesFromIndexes"));
    -[PXArrayChangeDetails changedIndexes](self, "changedIndexes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeAllIndexes");

    -[PXArrayChangeDetails setIndexesWithChangesByProperty:](self, "setIndexesWithChangesByProperty:", 0);
  }
}

- (void)_removeInsertForRemovedIndexAfterChanges:(unint64_t)a3
{
  uint64_t v5;
  void *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  _QWORD v17[5];
  _QWORD v18[4];

  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v5 = MEMORY[0x24BDAC760];
  v18[3] = a3;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __72__PXMutableArrayChangeDetails__removeInsertForRemovedIndexAfterChanges___block_invoke;
  v17[3] = &unk_2514D0430;
  v17[4] = v18;
  -[PXArrayChangeDetails enumerateMovedIndexesUsingBlock:](self, "enumerateMovedIndexesUsingBlock:", v17);
  v12 = 0;
  v13 = &v12;
  v14 = 0x3010000000;
  v15 = &unk_244396D4B;
  v16 = xmmword_24438BBF0;
  -[PXArrayChangeDetails insertedIndexes](self, "insertedIndexes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __72__PXMutableArrayChangeDetails__removeInsertForRemovedIndexAfterChanges___block_invoke_2;
  v11[3] = &unk_2514D0548;
  v11[4] = v18;
  v11[5] = &v12;
  objc_msgSend(v6, "enumerateRangesUsingBlock:", v11);
  v7 = v13;
  v8 = v13[4];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXArrayChangeDetails.m"), 826, CFSTR("Input was not inserted in this change"));

    v7 = v13;
    v8 = v13[4];
  }
  v9 = v7[5] + v8;
  objc_msgSend(v6, "removeIndex:", v9 - 1);
  objc_msgSend(v6, "shiftIndexesStartingAtIndex:by:", v9, -1);

  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(v18, 8);
}

- (void)_addAdditionalRemovedIndex:(unint64_t)a3 afterChangesIndex:(unint64_t)a4
{
  void *v7;
  id v8;

  -[PXArrayChangeDetails removedIndexes](self, "removedIndexes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addIndex:", a3);

  -[PXArrayChangeDetails insertedIndexes](self, "insertedIndexes");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "px_adjustIndexesForDeletedRange:", a4, 1);

}

- (void)_addRemovedIndex:(unint64_t)a3
{
  unint64_t v5;

  v5 = -[PXArrayChangeDetails indexAfterRevertingChangesFromIndex:](self, "indexAfterRevertingChangesFromIndex:");
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    -[PXMutableArrayChangeDetails _removeInsertForRemovedIndexAfterChanges:](self, "_removeInsertForRemovedIndexAfterChanges:", a3);
  else
    -[PXMutableArrayChangeDetails _addAdditionalRemovedIndex:afterChangesIndex:](self, "_addAdditionalRemovedIndex:afterChangesIndex:", v5, a3);
}

void __71__PXMutableArrayChangeDetails__updatePropertyChangesWithChangeDetails___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "indexSetAfterApplyingChangesToIndexSet:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v5, v6);

}

void __71__PXMutableArrayChangeDetails__updatePropertyChangesWithChangeDetails___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v10 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = (void *)objc_msgSend(v6, "mutableCopy");
    objc_msgSend(v8, "addIndexes:", v5);
    v9 = (id)objc_msgSend(v8, "copy");

  }
  else
  {
    v9 = v5;
  }
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, v10);

}

uint64_t __50__PXMutableArrayChangeDetails__addRemovedIndexes___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addRemovedIndex:", a2);
}

uint64_t __72__PXMutableArrayChangeDetails__removeInsertForRemovedIndexAfterChanges___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, _BYTE *a4)
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

uint64_t __72__PXMutableArrayChangeDetails__removeInsertForRemovedIndexAfterChanges___block_invoke_2(uint64_t result, unint64_t a2, unint64_t a3, _BYTE *a4)
{
  unint64_t v4;
  unint64_t v5;
  BOOL v6;
  uint64_t v7;

  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  v6 = v4 >= a2;
  v5 = v4 - a2;
  v6 = !v6 || v5 >= a3;
  if (!v6)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
    *(_QWORD *)(v7 + 32) = a2;
    *(_QWORD *)(v7 + 40) = a3;
    *a4 = 1;
  }
  return result;
}

+ (id)changeDetailsWithNoIncrementalChanges
{
  void *v2;

  v2 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:", 0, 0, 0, 0, 0);
  objc_msgSend(v2, "_becomeNonIncremental");
  return v2;
}

@end
