@implementation ICTableColumnTextStorage

- (ICTableColumnTextStorage)init
{
  -[ICTableColumnTextStorage doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (ICTableColumnTextStorage)initWithTable:(id)a3 columnID:(id)a4 replicaID:(id)a5
{
  id v8;
  id v9;
  ICTableColumnTextStorage *v10;
  ICTableColumnTextStorage *v11;
  uint64_t v12;
  NSMutableArray *rows;
  uint64_t v14;
  NSMutableDictionary *mergeableStringDelegates;
  uint64_t v16;
  NSMutableIndexSet *rowStartIndexes;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v19.receiver = self;
  v19.super_class = (Class)ICTableColumnTextStorage;
  v10 = -[ICTTTextStorage initWithData:replicaID:](&v19, sel_initWithData_replicaID_, 0, a5);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_table, v8);
    objc_storeStrong((id *)&v11->_columnID, a4);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = objc_claimAutoreleasedReturnValue();
    rows = v11->_rows;
    v11->_rows = (NSMutableArray *)v12;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v14 = objc_claimAutoreleasedReturnValue();
    mergeableStringDelegates = v11->_mergeableStringDelegates;
    v11->_mergeableStringDelegates = (NSMutableDictionary *)v14;

    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v16 = objc_claimAutoreleasedReturnValue();
    rowStartIndexes = v11->_rowStartIndexes;
    v11->_rowStartIndexes = (NSMutableIndexSet *)v16;

    -[ICTTTextStorage setConvertAttributes:](v11, "setConvertAttributes:", 0);
    -[ICTTTextStorage setWantsUndoCommands:](v11, "setWantsUndoCommands:", 0);
    -[ICTTTextStorage setShouldConvertTablesToTabs:](v11, "setShouldConvertTablesToTabs:", 1);
    -[ICTableColumnTextStorage setPreventEditingUpdatesCount:](v11, "setPreventEditingUpdatesCount:", 0);
  }

  return v11;
}

- (NSArray)populatedRows
{
  void *v2;
  void *v3;

  -[ICTableColumnTextStorage rows](self, "rows");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (_NSRange)characterRangeForRowID:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  _NSRange result;

  v4 = a3;
  v5 = -[ICTableColumnTextStorage rowLocationForRowID:](self, "rowLocationForRowID:", v4);
  -[ICTableColumnTextStorage mergeableStringForRowID:](self, "mergeableStringForRowID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "length");
  v8 = v5;
  v9 = v7;
  result.length = v9;
  result.location = v8;
  return result;
}

- (unint64_t)indexOfRow:(id)a3
{
  unint64_t v4;

  v4 = -[ICTableColumnTextStorage rowLocationForRowID:](self, "rowLocationForRowID:", a3);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return -[ICTableColumnTextStorage indexOfRowAtLocation:](self, "indexOfRowAtLocation:", v4);
}

- (void)removeTextForRow:(id)a3
{
  void *v4;
  int v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[ICTableColumnTextStorage rows](self, "rows");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v14);

  if (v5)
  {
    v6 = -[ICTableColumnTextStorage rowLocationForRowID:](self, "rowLocationForRowID:", v14);
    -[ICTableColumnTextStorage rowStartIndexes](self, "rowStartIndexes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "indexGreaterThanIndex:", v6);

    v9 = v6;
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v8 = -[ICTTTextStorage length](self, "length");
      if (v6)
        v9 = v6 - 1;
      else
        v9 = 0;
    }
    -[ICTableColumnTextStorage rows](self, "rows");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObject:", v14);

    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[ICTableColumnTextStorage rowStartIndexes](self, "rowStartIndexes");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "removeIndex:", v6);

      -[ICTableColumnTextStorage beginPreventEditingUpdates](self, "beginPreventEditingUpdates");
      -[ICTableColumnTextStorage deleteCharactersInRange:](self, "deleteCharactersInRange:", v9, v8 - v9);
      -[ICTableColumnTextStorage endPreventEditingUpdates](self, "endPreventEditingUpdates");
      -[ICTableColumnTextStorage rowStartIndexes](self, "rowStartIndexes");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "shiftIndexesStartingAtIndex:by:", v8, v6 - v8);

    }
    -[ICTableColumnTextStorage mergeableStringDelegates](self, "mergeableStringDelegates");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeObjectForKey:", v14);

  }
}

- (void)removeRow:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  id v7;

  v7 = a3;
  -[ICTableColumnTextStorage rows](self, "rows");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v7);

  if (v5)
  {
    -[ICTableColumnTextStorage removeTextForRow:](self, "removeTextForRow:", v7);
    -[ICTableColumnTextStorage mergeableStringDelegates](self, "mergeableStringDelegates");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", v7);

  }
}

- (void)updateStorageForMovedRow:(id)a3
{
  void *v4;
  int v5;
  id v6;

  v6 = a3;
  -[ICTableColumnTextStorage rows](self, "rows");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", v6);

  if (v5)
  {
    -[ICTableColumnTextStorage removeTextForRow:](self, "removeTextForRow:", v6);
    -[ICTableColumnTextStorage rowLocationForRowID:](self, "rowLocationForRowID:", v6);
  }

}

- (_NSRange)logicalRangeForLocation:(unint64_t)a3
{
  id v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  v6 = 0;
  v7 = 0;
  v3 = -[ICTableColumnTextStorage rowAtIndex:rowRange:](self, "rowAtIndex:rowRange:", a3, &v6);
  v4 = v6;
  v5 = v7;
  result.length = v5;
  result.location = v4;
  return result;
}

- (id)mergeableStringForRowID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[ICTableColumnTextStorage table](self, "table");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableColumnTextStorage columnID](self, "columnID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mergeableStringForColumnID:rowID:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)indexOfRowAtLocation:(unint64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _QWORD v11[65];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  -[ICTableColumnTextStorage rowStartIndexes](self, "rowStartIndexes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsIndex:", a3);
  if ((v5 & 1) == 0)
    v5 = objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[rowStartIndexes containsIndex:rowLocation]", "-[ICTableColumnTextStorage indexOfRowAtLocation:]", 1, 0, CFSTR("rowLocation must be valid"));
  if (a3)
  {
    MEMORY[0x1E0C80A78](v5);
    v6 = 0;
    v12[0] = 0;
    v12[1] = a3 + 1;
    do
    {
      v7 = objc_msgSend(v4, "getIndexes:maxCount:inIndexRange:", v11, 64, v12);
      v6 += v7;
    }
    while (v7 > 0x3F);
    v8 = v7;
    if (!v6)
      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "indexOfRowID > 0", "-[ICTableColumnTextStorage indexOfRowAtLocation:]", 1, 0, CFSTR("no indexes found"));
    if ((v6 & 0x3Fu) > v8)
      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "indexOfRowID % bufferSize <= numIndexes", "-[ICTableColumnTextStorage indexOfRowAtLocation:]", 1, 0, CFSTR("rowAtIndex: index out of bounds of filled buffer"));
    v9 = v6 - 1;
    if (v11[(v6 - 1) & 0x3F] != a3)
      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "indexBuffer[indexOfRowID % bufferSize] == rowLocation", "-[ICTableColumnTextStorage indexOfRowAtLocation:]", 1, 0, CFSTR("expected to find matching row location"));
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)rowAtIndex:(unint64_t)a3 rowRange:(_NSRange *)a4
{
  void *v7;
  NSUInteger v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSUInteger v13;

  -[ICTableColumnTextStorage rowStartIndexes](self, "rowStartIndexes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v8 = objc_msgSend(v7, "indexLessThanOrEqualToIndex:", a3);
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "rowLocation != NSNotFound", "-[ICTableColumnTextStorage rowAtIndex:rowRange:]", 1, 0, CFSTR("row location should be found"));
    v9 = -[ICTableColumnTextStorage indexOfRowAtLocation:](self, "indexOfRowAtLocation:", v8);
    -[ICTableColumnTextStorage rows](self, "rows");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectAtIndexedSubscript:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4)
    {
      -[ICTableColumnTextStorage mergeableStringForRowID:](self, "mergeableStringForRowID:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "length");

      a4->location = v8;
      a4->length = v13;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)insertionIndexForRow:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  unint64_t v13;
  _QWORD v15[5];
  unint64_t v16;

  v4 = a3;
  -[ICTableColumnTextStorage rows](self, "rows");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[ICTableColumnTextStorage table](self, "table");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "rowIndexForIdentifier:", v4);

    v9 = objc_msgSend(v5, "count");
    if (v8 >= v9)
      v10 = v9;
    else
      v10 = v8;
    v16 = v10;
    if (v10)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v10 - 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICTableColumnTextStorage table](self, "table");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "rowIndexForIdentifier:", v11);

      if (v13 > v10)
      {
        v15[0] = MEMORY[0x1E0C809B0];
        v15[1] = 3221225472;
        v15[2] = __49__ICTableColumnTextStorage_insertionIndexForRow___block_invoke;
        v15[3] = &unk_1E5C1D798;
        v15[4] = self;
        objc_msgSend(v5, "ic_indexOfSortedObject:insertionIndex:usingComparator:", v4, &v16, v15);
      }

      v6 = v16;
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

uint64_t __49__ICTableColumnTextStorage_insertionIndexForRow___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "table");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "rowIndexForIdentifier:", v7);

  objc_msgSend(*(id *)(a1 + 32), "table");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "rowIndexForIdentifier:", v6);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "compare:", v13);

  return v14;
}

- (unint64_t)rowLocationForRowID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void (**v11)(_QWORD);
  void *v12;
  int v13;
  unint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  unint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  unint64_t v27;
  unint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  _QWORD v33[5];
  id v34;
  _QWORD aBlock[5];
  id v36;
  id v37;

  v4 = a3;
  -[ICTableColumnTextStorage rows](self, "rows");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);
  -[ICTableColumnTextStorage mergeableStringForRowID:](self, "mergeableStringForRowID:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__ICTableColumnTextStorage_rowLocationForRowID___block_invoke;
  aBlock[3] = &unk_1E5C1D7C0;
  aBlock[4] = self;
  v9 = v4;
  v36 = v9;
  v10 = v7;
  v37 = v10;
  v11 = (void (**)(_QWORD))_Block_copy(aBlock);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v21 = -[ICTableColumnTextStorage rowLocationForRowIndex:](self, "rowLocationForRowIndex:", v6);
    if (!v10)
      goto LABEL_25;
    goto LABEL_22;
  }
  -[ICTableColumnTextStorage table](self, "table");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "containsRow:", v9);

  if (!v13)
  {
    v21 = 0x7FFFFFFFFFFFFFFFLL;
    if (!v10)
      goto LABEL_25;
    goto LABEL_22;
  }
  v14 = -[ICTableColumnTextStorage insertionIndexForRow:](self, "insertionIndexForRow:", v9);
  objc_msgSend(v10, "attributedString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "mutableCopy");

  v17 = objc_msgSend(v16, "ic_range");
  v19 = v18;
  v33[0] = v8;
  v33[1] = 3221225472;
  v33[2] = __48__ICTableColumnTextStorage_rowLocationForRowID___block_invoke_2;
  v33[3] = &unk_1E5C1D7E8;
  v33[4] = self;
  v20 = v16;
  v34 = v20;
  objc_msgSend(v20, "enumerateAttributesInRange:options:usingBlock:", v17, v19, 0, v33);
  if (!v20)
    v20 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  if (v14 >= objc_msgSend(v5, "count"))
  {
    if (v14 != objc_msgSend(v5, "count"))
      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "insertionIndex == rows.count", "-[ICTableColumnTextStorage rowLocationForRowID:]", 1, 0, CFSTR("insertion index should not be greater than count"));
    if (v14)
    {
      v21 = -[ICTTTextStorage length](self, "length") + 1;
      v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR("\n"));
      objc_msgSend(v20, "insertAttributedString:atIndex:", v22, 0);

    }
    else
    {
      v21 = 0;
    }
  }
  else
  {
    v21 = -[ICTableColumnTextStorage rowLocationForRowIndex:](self, "rowLocationForRowIndex:", v14);
    objc_msgSend(v20, "ic_appendString:", CFSTR("\n"));
  }
  -[ICTableColumnTextStorage rows](self, "rows");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "insertObject:atIndex:", v9, v14);

  if (v10)
    v11[2](v11);
  v24 = objc_msgSend(v20, "length");
  -[ICTableColumnTextStorage rowStartIndexes](self, "rowStartIndexes");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "shiftIndexesStartingAtIndex:by:", v21, v24);

  -[ICTableColumnTextStorage rowStartIndexes](self, "rowStartIndexes");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addIndex:", v21);

  -[ICTableColumnTextStorage beginPreventEditingUpdates](self, "beginPreventEditingUpdates");
  v27 = -[ICTTTextStorage length](self, "length");
  if (v21 >= v27)
    v28 = v27;
  else
    v28 = v21;
  -[ICTableColumnTextStorage insertAttributedString:atIndex:](self, "insertAttributedString:atIndex:", v20, v28);
  -[ICTableColumnTextStorage endPreventEditingUpdates](self, "endPreventEditingUpdates");

  if (v10)
  {
LABEL_22:
    -[ICTableColumnTextStorage mergeableStringDelegates](self, "mergeableStringDelegates");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectForKeyedSubscript:", v9);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v30)
    {
      v11[2](v11);
      if (-[ICTableColumnTextStorage nextLocationAfterRowLocation:](self, "nextLocationAfterRowLocation:", v21) == v21 + 1)
      {
        -[ICTableColumnTextStorage columnID](self, "columnID");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICTableColumnTextStorage tableCellWasEditedAtColumnID:rowID:edited:range:changeInLength:](self, "tableCellWasEditedAtColumnID:rowID:edited:range:changeInLength:", v31, v9, 3, 0, 0, objc_msgSend(v10, "length"));

      }
    }
  }
LABEL_25:

  return v21;
}

void __48__ICTableColumnTextStorage_rowLocationForRowID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  ICTableCellMergeableStringDelegate *v4;
  void *v5;
  void *v6;
  void *v7;
  ICTableCellMergeableStringDelegate *v8;

  objc_msgSend(*(id *)(a1 + 32), "mergeableStringDelegates");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "!self.mergeableStringDelegates[rowID]", "-[ICTableColumnTextStorage rowLocationForRowID:]_block_invoke", 1, 0, CFSTR("Adding a mergeableStringDelegate for a row that already has one."));
  v4 = [ICTableCellMergeableStringDelegate alloc];
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v5, "columnID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ICTableCellMergeableStringDelegate initWithTableCellChangeObserver:columnID:rowID:](v4, "initWithTableCellChangeObserver:columnID:rowID:", v5, v6, *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "mergeableStringDelegates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 48), "setDelegate:", v8);
}

void __48__ICTableColumnTextStorage_rowLocationForRowID___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  void *v12;
  id v13;

  v7 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v7, "styler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "styleForModelAttributes:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v10, "mutableCopy");

  v11 = (_QWORD *)MEMORY[0x1E0D63940];
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D63940]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, *v11);
  objc_msgSend(*(id *)(a1 + 40), "setAttributes:range:", v13, a3, a4);

}

- (unint64_t)rowLocationForRowIndex:(unint64_t)a3
{
  unint64_t v3;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v11;
  _QWORD v13[65];
  _QWORD v14[3];

  v3 = a3;
  v14[2] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    -[ICTableColumnTextStorage rowStartIndexes](self, "rowStartIndexes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count") <= v3)
      objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "index < rowStartIndexes.count", "-[ICTableColumnTextStorage rowLocationForRowIndex:]", 1, 0, CFSTR("row index out of bounds"));
    v6 = objc_msgSend(v5, "count");
    if (v6 <= v3)
    {

      return 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      MEMORY[0x1E0C80A78](v6);
      v7 = -[ICTTTextStorage length](self, "length");
      v8 = 0;
      v14[0] = 0;
      v14[1] = v7 + 1;
      do
      {
        v9 = objc_msgSend(v5, "getIndexes:maxCount:inIndexRange:", v13, 64, v14);
        v8 += v9;
      }
      while (v9 >= 0x40 && v8 <= v3);
      v11 = v3 & 0x3F;
      if (v11 >= v9)
        objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "index % bufferSize < numIndexes", "-[ICTableColumnTextStorage rowLocationForRowIndex:]", 1, 0, CFSTR("index out of bounds of filled buffer"));
      v3 = v13[v11];

    }
  }
  return v3;
}

- (unint64_t)nextLocationAfterRowLocation:(unint64_t)a3
{
  void *v5;
  unint64_t v6;

  -[ICTableColumnTextStorage rowStartIndexes](self, "rowStartIndexes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexGreaterThanIndex:", a3);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    return -[ICTTTextStorage length](self, "length") + 1;
  return v6;
}

- (void)edited:(unint64_t)a3 range:(_NSRange)a4 changeInLength:(int64_t)a5
{
  NSUInteger length;
  NSUInteger location;
  char v8;
  uint64_t v10;
  NSUInteger v11;
  void *v12;
  NSUInteger v13;
  unint64_t v14;
  void *v15;
  void *v16;
  NSRange v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  NSUInteger v24;
  NSRange v25;
  NSUInteger v26;
  NSUInteger v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  NSUInteger range1;
  void *v39;
  char v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  uint64_t v44;
  uint64_t v45;
  NSUInteger v46;
  NSUInteger v47;
  _QWORD v48[5];
  id v49;
  _QWORD v50[4];
  id v51;
  NSRange v52;
  _QWORD v53[2];
  objc_super v54;
  NSRange v55;
  NSRange v56;
  NSRange v57;
  NSRange v58;

  length = a4.length;
  location = a4.location;
  v8 = a3;
  v54.receiver = self;
  v54.super_class = (Class)ICTableColumnTextStorage;
  -[ICTTTextStorage edited:range:changeInLength:](&v54, sel_edited_range_changeInLength_);
  if (-[ICTableColumnTextStorage preventEditingUpdates](self, "preventEditingUpdates"))
    return;
  v53[0] = 0;
  v53[1] = 0;
  -[ICTableColumnTextStorage rowAtIndex:rowRange:](self, "rowAtIndex:rowRange:", location, v53);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v53[0];
  if (a5 < 1)
  {
    if ((a5 & 0x8000000000000000) == 0)
      goto LABEL_6;
    -[ICTableColumnTextStorage rowStartIndexes](self, "rowStartIndexes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v11 - a5;
  }
  else
  {
    -[ICTableColumnTextStorage rowStartIndexes](self, "rowStartIndexes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v11;
  }
  objc_msgSend(v12, "shiftIndexesStartingAtIndex:by:", v13 + 1, a5);

LABEL_6:
  v40 = v8;
  v14 = -[ICTableColumnTextStorage nextLocationAfterRowLocation:](self, "nextLocationAfterRowLocation:", v11);
  -[ICTableColumnTextStorage table](self, "table");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableColumnTextStorage columnID](self, "columnID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = (void *)v10;
  objc_msgSend(v15, "mergeableStringForColumnID:rowID:createIfNeeded:", v16, v10, 1);
  v39 = (void *)objc_claimAutoreleasedReturnValue();

  v57.length = v14 + ~v11;
  v55.length = length + a5;
  v55.location = location;
  v57.location = v11;
  v17 = NSIntersectionRange(v55, v57);
  -[ICTTTextStorage attributedSubstringFromRange:](self, "attributedSubstringFromRange:", v17.location, v17.length);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "mutableCopy");

  -[ICTTTextStorage mergeableString](self, "mergeableString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "attributedString");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  range1 = length;
  v22 = *MEMORY[0x1E0D63940];
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __56__ICTableColumnTextStorage_edited_range_changeInLength___block_invoke;
  v50[3] = &unk_1E5C1D810;
  v52 = v17;
  v23 = v19;
  v51 = v23;
  objc_msgSend(v21, "enumerateAttribute:inRange:options:usingBlock:", v22, v17.location, v17.length, 0, v50);

  v24 = location - v11;
  if (v24 >= objc_msgSend(v39, "length"))
  {
    v26 = objc_msgSend(v39, "length");
    v27 = 0;
  }
  else
  {
    v58.length = objc_msgSend(v39, "length");
    v56.location = v24;
    v56.length = range1;
    v58.location = 0;
    v25 = NSIntersectionRange(v56, v58);
    v26 = v25.location;
    v27 = v25.length;
  }
  v28 = objc_alloc(MEMORY[0x1E0CB3778]);
  objc_msgSend(v23, "string");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)objc_msgSend(v28, "initWithString:", v29);

  v31 = objc_msgSend(v23, "ic_range");
  v33 = v32;
  v34 = MEMORY[0x1E0C809B0];
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __56__ICTableColumnTextStorage_edited_range_changeInLength___block_invoke_2;
  v48[3] = &unk_1E5C1D7E8;
  v48[4] = self;
  v35 = v30;
  v49 = v35;
  objc_msgSend(v23, "enumerateAttributesInRange:options:usingBlock:", v31, v33, 0, v48);
  -[ICTableColumnTextStorage beginPreventEditingUpdates](self, "beginPreventEditingUpdates");
  if ((v40 & 2) != 0)
  {
    objc_msgSend(v39, "replaceCharactersInRange:withAttributedString:", v26, v27, v35);
  }
  else if ((v40 & 1) != 0)
  {
    v36 = objc_msgSend(v39, "length");
    v37 = objc_msgSend(v35, "length");
    v42[0] = v34;
    v42[1] = 3221225472;
    v42[2] = __56__ICTableColumnTextStorage_edited_range_changeInLength___block_invoke_3;
    v42[3] = &unk_1E5C1D838;
    v44 = 0;
    v45 = v36;
    v46 = v26;
    v47 = v27;
    v43 = v39;
    objc_msgSend(v35, "enumerateAttributesInRange:options:usingBlock:", 0, v37, 0, v42);

  }
  -[ICTableColumnTextStorage endPreventEditingUpdates](self, "endPreventEditingUpdates");

}

void __56__ICTableColumnTextStorage_edited_range_changeInLength___block_invoke(uint64_t a1, void *a2, uint64_t a3, NSUInteger a4)
{
  void *v6;
  NSUInteger v7;
  NSUInteger v8;
  NSRange v9;
  id v10;
  NSRange v11;
  NSRange v12;

  if (a2)
  {
    v6 = *(void **)(a1 + 32);
    v7 = a3 - *(_QWORD *)(a1 + 40);
    v10 = a2;
    v12.location = objc_msgSend(v6, "ic_range");
    v12.length = v8;
    v11.location = v7;
    v11.length = a4;
    v9 = NSIntersectionRange(v11, v12);
    objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", *MEMORY[0x1E0D63940], v10, v9.location, v9.length);

  }
}

void __56__ICTableColumnTextStorage_edited_range_changeInLength___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  void *v12;
  id v13;

  v7 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v7, "styler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "modelForStyleAttributes:filterAttributes:", v8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v10, "mutableCopy");

  v11 = (_QWORD *)MEMORY[0x1E0D63940];
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D63940]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, *v11);
  objc_msgSend(*(id *)(a1 + 40), "setAttributes:range:", v13, a3, a4);

}

void __56__ICTableColumnTextStorage_edited_range_changeInLength___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, NSUInteger a4)
{
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSRange v9;
  id v10;
  NSRange v11;
  NSRange v12;

  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56) + a3;
  v8 = *(_QWORD *)(a1 + 40);
  v10 = a2;
  v11.location = v8;
  v11.length = v6;
  v12.location = v7;
  v12.length = a4;
  v9 = NSIntersectionRange(v11, v12);
  objc_msgSend(*(id *)(a1 + 32), "setAttributes:range:", v10, v9.location, v9.length);

}

- (void)textStorage:(id)a3 didProcessEditing:(unint64_t)a4 range:(_NSRange)a5 changeInLength:(int64_t)a6
{
  NSUInteger length;
  NSUInteger location;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  if (self == a3)
  {
    length = a5.length;
    location = a5.location;
    -[ICTableColumnTextStorage setShouldPreventUndoCommands:](self, "setShouldPreventUndoCommands:", 1, a4);
    objc_opt_class();
    -[ICTTTextStorage styler](self, "styler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ICDynamicCast();
    v18 = (id)objc_claimAutoreleasedReturnValue();

    -[ICTTTextStorage string](self, "string");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "ic_safeCharacterRangeForRange:", location, length);
    v13 = v12;

    if (v13)
    {
      if (!-[ICTTTextStorage isEditingTemporaryAttributes](self, "isEditingTemporaryAttributes"))
        objc_msgSend(v18, "styleText:inExactRange:fixModelAttributes:", self, location, length, 1);
    }
    -[ICTableColumnTextStorage setShouldPreventUndoCommands:](self, "setShouldPreventUndoCommands:", 0);
    -[ICTableColumnTextStorage rowAtIndex:rowRange:](self, "rowAtIndex:rowRange:", location, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableColumnTextStorage table](self, "table");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "cellChangeNotifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICTableColumnTextStorage columnID](self, "columnID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "notifyOfChangeAtColumnID:rowID:delta:", v17, v14, a6);

  }
}

- (BOOL)preventEditingUpdates
{
  return -[ICTableColumnTextStorage preventEditingUpdatesCount](self, "preventEditingUpdatesCount") != 0;
}

- (void)beginPreventEditingUpdates
{
  -[ICTableColumnTextStorage setPreventEditingUpdatesCount:](self, "setPreventEditingUpdatesCount:", -[ICTableColumnTextStorage preventEditingUpdatesCount](self, "preventEditingUpdatesCount") + 1);
}

- (void)endPreventEditingUpdates
{
  if (-[ICTableColumnTextStorage preventEditingUpdatesCount](self, "preventEditingUpdatesCount"))
    -[ICTableColumnTextStorage setPreventEditingUpdatesCount:](self, "setPreventEditingUpdatesCount:", -[ICTableColumnTextStorage preventEditingUpdatesCount](self, "preventEditingUpdatesCount") - 1);
}

- (void)closeUndoGroups
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[ICTableColumnTextStorage undoHelper](self, "undoHelper");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "coalescingUndoGroupForStringDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(v3, "objectEnumerator", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "closeGroup");
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  objc_msgSend(v3, "removeAllObjects");
}

- (void)breakUndoCoalescing
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICTableColumnTextStorage;
  -[ICTTTextStorage breakUndoCoalescing](&v3, sel_breakUndoCoalescing);
  -[ICTableColumnTextStorage closeUndoGroups](self, "closeUndoGroups");
}

- (void)resetUndoManager
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICTableColumnTextStorage;
  -[ICTTTextStorage resetUndoManager](&v3, sel_resetUndoManager);
  -[ICTableColumnTextStorage closeUndoGroups](self, "closeUndoGroups");
}

- (id)editAtIndex:(unint64_t)a3
{
  void *v5;
  NSRange v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  NSRange v17;

  v17 = (NSRange)xmmword_1ACA582A0;
  -[ICTableColumnTextStorage rowAtIndex:rowRange:](self, "rowAtIndex:rowRange:", a3, &v17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v17;
  if (v17.location == 0x7FFFFFFFFFFFFFFFLL
    || (a3 >= v17.location ? (v7 = a3 - v17.location >= v17.length) : (v7 = 1), v7))
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    NSStringFromRange(v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("editAtIndex expected to find valid row range %@ %lu %@"), v14, a3, self);
    v15 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v15, 0);
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v16);
  }
  -[ICTableColumnTextStorage table](self, "table");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableColumnTextStorage columnID](self, "columnID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mergeableStringForColumnID:rowID:", v9, v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "editAtIndex:", a3 - v17.location);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)enumerateEditsInRange:(_NSRange)a3 usingBlock:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  NSRange v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  id obj;
  id v18;
  uint64_t v19;
  _QWORD v21[4];
  id v22;
  uint64_t *v23;
  NSUInteger v24;
  NSUInteger v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  _BYTE v34[128];
  uint64_t v35;
  NSRange v36;

  v35 = *MEMORY[0x1E0C80C00];
  v18 = a4;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[ICTableColumnTextStorage rows](self, "rows");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  obj = v5;
  if (v6)
  {
    v19 = *(_QWORD *)v27;
LABEL_3:
    v7 = 0;
    while (1)
    {
      if (*(_QWORD *)v27 != v19)
        objc_enumerationMutation(obj);
      v8 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v7);
      v9 = -[ICTableColumnTextStorage characterRangeForRowID:](self, "characterRangeForRowID:", v8);
      v11 = v10;
      v36.location = v9;
      v36.length = v10;
      v12 = NSIntersectionRange(a3, v36);
      if (v12.length)
      {
        -[ICTableColumnTextStorage table](self, "table");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICTableColumnTextStorage columnID](self, "columnID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "mergeableStringForColumnID:rowID:", v14, v8);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __61__ICTableColumnTextStorage_enumerateEditsInRange_usingBlock___block_invoke;
        v21[3] = &unk_1E5C1D860;
        v24 = v9;
        v25 = v11;
        v22 = v18;
        v23 = &v30;
        objc_msgSend(v15, "enumerateEditsInRange:usingBlock:", v12.location - v9, v12.length, v21);
        v16 = *((_BYTE *)v31 + 24) == 0;

        if (!v16)
          break;
      }
      if (v6 == ++v7)
      {
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        if (v6)
          goto LABEL_3;
        break;
      }
    }
  }

  _Block_object_dispose(&v30, 8);
}

void __61__ICTableColumnTextStorage_enumerateEditsInRange_usingBlock___block_invoke(_QWORD *a1, void *a2, _BYTE *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;

  v5 = a2;
  v6 = objc_msgSend(v5, "range") + a1[6];
  objc_msgSend(v5, "range");
  v8 = v7;
  v9 = objc_alloc(MEMORY[0x1E0D63CA0]);
  objc_msgSend(v5, "timestamp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "replicaID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (id)objc_msgSend(v9, "initWithTimestamp:replicaID:range:", v10, v11, v6, v8);
  v12 = a1[4];
  if (v12)
    (*(void (**)(uint64_t, id, _BYTE *))(v12 + 16))(v12, v13, a3);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = *a3;

}

- (BOOL)wantsUndoCommands
{
  return 0;
}

- (id)savedSelectionWithSelectionAffinity:(unint64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id obj;
  uint64_t v32;
  id v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  unint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[3];
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "[NSThread isMainThread]", "-[ICTableColumnTextStorage savedSelectionWithSelectionAffinity:]", 1, 0, CFSTR("Unexpected call from background thread"));
  -[ICTTTextStorage textViews](self, "textViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v34 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = v5;
  v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
  if (v36)
  {
    v32 = *(_QWORD *)v45;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v45 != v32)
          objc_enumerationMutation(obj);
        v37 = v6;
        v7 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * v6);
        objc_msgSend(MEMORY[0x1E0CB3A28], "TTZero");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        objc_msgSend(v7, "ic_selectedRanges");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v41;
          do
          {
            v14 = 0;
            v15 = v8;
            do
            {
              if (*(_QWORD *)v41 != v13)
                objc_enumerationMutation(v10);
              v16 = objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * v14), "rangeValue");
              v18 = v17;
              v38 = 0;
              v39 = 0;
              -[ICTableColumnTextStorage rowAtIndex:rowRange:](self, "rowAtIndex:rowRange:", v16, &v38);
              v8 = (void *)objc_claimAutoreleasedReturnValue();

              v19 = v39;
              if (v18 > v39)
              {
                objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "selectedRange.length <= cellRange.length", "-[ICTableColumnTextStorage savedSelectionWithSelectionAffinity:]", 1, 0, CFSTR("Selected range is greater than range of the cell"));
                v19 = v39;
              }
              if (v18 >= v19)
                v20 = v19;
              else
                v20 = v18;
              objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v16 - v38, v20);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "addObject:", v21);

              ++v14;
              v15 = v8;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v40, v49, 16);
          }
          while (v12);
        }

        -[ICTableColumnTextStorage mergeableStringForRowID:](self, "mergeableStringForRowID:", v8);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)objc_msgSend(v9, "copy");
        objc_msgSend(v22, "selectionForCharacterRanges:selectionAffinity:", v23, a3);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = v24;
        if (v24)
          v26 = v24;
        else
          v26 = objc_alloc_init(MEMORY[0x1E0D63C78]);
        v27 = v26;

        objc_msgSend(v35, "addObject:", v27);
        objc_msgSend(v34, "addObject:", v8);
        objc_msgSend(v22, "objectsNeedingUpdatedRanges");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "addObject:", v27);

        v6 = v37 + 1;
      }
      while (v37 + 1 != v36);
      v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v50, 16);
    }
    while (v36);
  }

  v48[0] = obj;
  v48[1] = v35;
  v48[2] = v34;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 3);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  return v29;
}

- (void)restoreSelection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  ICTableColumnTextStorage *v12;
  id v13;

  v4 = a3;
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __45__ICTableColumnTextStorage_restoreSelection___block_invoke;
  v10[3] = &unk_1E5C1D888;
  v11 = v6;
  v12 = self;
  v13 = v5;
  v7 = v5;
  v8 = v6;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v10);

}

void __45__ICTableColumnTextStorage_restoreSelection___block_invoke(id *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(a1[4], "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "mergeableStringForRowID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(a1[6], "objectAtIndexedSubscript:", a3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "characterRangesForSelection:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(a1[5], "rowLocationForRowID:", v6);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v11 = v8;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v22 != v14)
            objc_enumerationMutation(v11);
          v16 = objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "rangeValue");
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v16 + v10, v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v18);

        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v13);
    }

    if (objc_msgSend(v9, "count"))
      objc_msgSend(v5, "setIc_selectedRanges:", v9);
    objc_msgSend(v7, "objectsNeedingUpdatedRanges");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "removeObject:", v20);

  }
}

- (void)tableCellWasEditedAtColumnID:(id)a3 rowID:(id)a4 edited:(unint64_t)a5 range:(_NSRange)a6 changeInLength:(int64_t)a7
{
  NSUInteger length;
  NSUInteger location;
  char v10;
  BOOL v12;
  void *v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v26[7];
  _QWORD v27[5];
  id v28;

  length = a6.length;
  location = a6.location;
  v10 = a5;
  v25 = a4;
  v12 = -[ICTableColumnTextStorage preventEditingUpdates](self, "preventEditingUpdates");
  v13 = v25;
  if (!v12)
  {
    v14 = -[ICTableColumnTextStorage rowLocationForRowID:](self, "rowLocationForRowID:", v25);
    v15 = v14 + location;
    -[ICTableColumnTextStorage mergeableStringForRowID:](self, "mergeableStringForRowID:", v25);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "attributedString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "attributedSubstringFromRange:", location, length + a7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "mutableCopy");

    v20 = objc_msgSend(v19, "length");
    v21 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __91__ICTableColumnTextStorage_tableCellWasEditedAtColumnID_rowID_edited_range_changeInLength___block_invoke;
    v27[3] = &unk_1E5C1D7E8;
    v27[4] = self;
    v22 = v19;
    v28 = v22;
    objc_msgSend(v22, "enumerateAttributesInRange:options:usingBlock:", 0, v20, 0, v27);
    -[ICTableColumnTextStorage rowStartIndexes](self, "rowStartIndexes");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "shiftIndexesStartingAtIndex:by:", v14 - (a7 & (a7 >> 63)) + 1, a7);

    -[ICTableColumnTextStorage beginPreventEditingUpdates](self, "beginPreventEditingUpdates");
    if ((v10 & 2) != 0)
    {
      -[ICTableTextStorage replaceCharactersInRange:withAttributedString:](self, "replaceCharactersInRange:withAttributedString:", v15, length, v22);
    }
    else if ((v10 & 1) != 0)
    {
      v26[0] = v21;
      v26[1] = 3221225472;
      v26[2] = __91__ICTableColumnTextStorage_tableCellWasEditedAtColumnID_rowID_edited_range_changeInLength___block_invoke_2;
      v26[3] = &unk_1E5C1D8B0;
      v26[5] = v15;
      v26[6] = length;
      v26[4] = self;
      objc_msgSend(v22, "enumerateAttributesInRange:options:usingBlock:", 0, objc_msgSend(v22, "length"), 0, v26);
    }
    -[ICTTTextStorage styler](self, "styler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "styleText:inRange:fixModelAttributes:", self, v15, objc_msgSend(v22, "length"), 0);

    -[ICTableColumnTextStorage endPreventEditingUpdates](self, "endPreventEditingUpdates");
    v13 = v25;
  }

}

void __91__ICTableColumnTextStorage_tableCellWasEditedAtColumnID_rowID_edited_range_changeInLength___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  id v8;
  void *v9;
  id v10;

  v7 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v7, "styler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "styleForModelAttributes:", v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "setAttributes:range:", v10, a3, a4);
}

void __91__ICTableColumnTextStorage_tableCellWasEditedAtColumnID_rowID_edited_range_changeInLength___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, NSUInteger a4)
{
  void *v6;
  NSUInteger v7;
  NSUInteger v8;
  NSRange v9;
  id v10;
  NSRange v11;
  NSRange v12;

  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40) + a3;
  v10 = a2;
  v12.location = objc_msgSend(v6, "ic_range");
  v12.length = v8;
  v11.location = v7;
  v11.length = a4;
  v9 = NSIntersectionRange(v11, v12);
  objc_msgSend(*(id *)(a1 + 32), "setAttributes:range:", v10, v9.location, v9.length);

}

- (BOOL)wantsTimestampUpdates
{
  if (-[ICTableColumnTextStorage shouldPreventUndoCommands](self, "shouldPreventUndoCommands")
    || -[ICTableColumnTextStorage preventEditingUpdates](self, "preventEditingUpdates")
    || -[ICTTTextStorage isEditingTemporaryAttributes](self, "isEditingTemporaryAttributes")
    || -[ICTTTextStorage disableUndoCoalesceBreaking](self, "disableUndoCoalesceBreaking"))
  {
    return 0;
  }
  else
  {
    return !-[ICTTTextStorage isFixing](self, "isFixing");
  }
}

- (NSUUID)columnID
{
  return (NSUUID *)objc_getProperty(self, a2, 336, 1);
}

- (ICTableUndoHelping)undoHelper
{
  return (ICTableUndoHelping *)objc_loadWeakRetained((id *)&self->_undoHelper);
}

- (void)setUndoHelper:(id)a3
{
  objc_storeWeak((id *)&self->_undoHelper, a3);
}

- (BOOL)shouldPreventUndoCommands
{
  return self->_shouldPreventUndoCommands;
}

- (void)setShouldPreventUndoCommands:(BOOL)a3
{
  self->_shouldPreventUndoCommands = a3;
}

- (ICTable)table
{
  return (ICTable *)objc_loadWeakRetained((id *)&self->_table);
}

- (NSMutableArray)rows
{
  return self->_rows;
}

- (NSMutableDictionary)mergeableStringDelegates
{
  return self->_mergeableStringDelegates;
}

- (NSMutableIndexSet)rowStartIndexes
{
  return self->_rowStartIndexes;
}

- (unint64_t)preventEditingUpdatesCount
{
  return self->_preventEditingUpdatesCount;
}

- (void)setPreventEditingUpdatesCount:(unint64_t)a3
{
  self->_preventEditingUpdatesCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rowStartIndexes, 0);
  objc_storeStrong((id *)&self->_mergeableStringDelegates, 0);
  objc_storeStrong((id *)&self->_rows, 0);
  objc_destroyWeak((id *)&self->_table);
  objc_destroyWeak((id *)&self->_undoHelper);
  objc_storeStrong((id *)&self->_columnID, 0);
}

@end
