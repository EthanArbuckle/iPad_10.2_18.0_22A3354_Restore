@implementation ICTable(UI)

- (uint64_t)textStorageForCellAtColumnID:()UI rowID:
{
  return objc_msgSend(a1, "textStorageForCellAtColumnID:rowID:undoTarget:undoManager:", a3, a4, 0, 0);
}

- (id)textStorageForCellAtColumnID:()UI rowID:undoTarget:undoManager:
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v10 = a5;
  v11 = a6;
  v12 = a4;
  v13 = objc_msgSend(a1, "columnIndexForIdentifier:", a3);
  v14 = objc_msgSend(a1, "rowIndexForIdentifier:", v12);

  if (v13 == 0x7FFFFFFFFFFFFFFFLL || v14 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v16 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[ICTable(UI) textStorageForCellAtColumnID:rowID:undoTarget:undoManager:].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);

    v15 = 0;
  }
  else
  {
    objc_msgSend(a1, "textStorageForCellAtColumnIndex:rowIndex:undoTarget:undoManager:", v13, v14, v10, v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (uint64_t)textStorageForCellAtColumnIndex:()UI rowIndex:
{
  return objc_msgSend(a1, "textStorageForCellAtColumnIndex:rowIndex:undoTarget:undoManager:", a3, a4, 0, 0);
}

- (ICTableCellTextStorage)textStorageForCellAtColumnIndex:()UI rowIndex:undoTarget:undoManager:
{
  id v10;
  id v11;
  void *v12;
  ICTableCellTextStorage *v13;
  ICTableCellTextStorage *v14;

  v10 = a5;
  v11 = a6;
  objc_msgSend(a1, "documentForCellAtColumnIndex:rowIndex:", a3, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[ICTableCellTextStorage initWithDocument:]([ICTableCellTextStorage alloc], "initWithDocument:", v12);
  v14 = v13;
  if (v11)
    -[ICTTTextStorage setUndoManager:](v13, "setUndoManager:", v11);
  -[ICTTTextStorage setOverrideUndoTarget:](v14, "setOverrideUndoTarget:", v10);

  return v14;
}

- (id)mergeableStringForColumnID:()UI rowID:createIfNeeded:
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v8 = a3;
  v9 = a4;
  objc_msgSend(a1, "mergeableStringForColumnID:rowID:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    if (a5)
    {
      v11 = objc_msgSend(a1, "columnIndexForIdentifier:", v8);
      v12 = objc_msgSend(a1, "rowIndexForIdentifier:", v9);
      v10 = 0;
      if (v11 != 0x7FFFFFFFFFFFFFFFLL && v12 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v13 = (id)objc_msgSend(a1, "documentForCellAtColumnIndex:rowIndex:", v11, v12);
        objc_msgSend(a1, "mergeableStringForColumnID:rowID:", v8, v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
    }
  }

  return v10;
}

- (id)documentForCellAtColumnIndex:()UI rowIndex:
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v6 = a1;
  objc_msgSend(v6, "objectForColumnIndex:rowIndex:", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0D63C88]);
  v9 = v8;
  if (v7)
  {
    v10 = (void *)objc_msgSend(v8, "initWithMergeableString:", v7);
  }
  else
  {
    objc_msgSend(v6, "document");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "replica");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v10 = (void *)objc_msgSend(v9, "initWithData:replicaID:", 0, v12);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v9, "initWithData:replicaID:", 0, v13);

    }
    objc_msgSend(v10, "mergeableString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:columnIndex:rowIndex:", v14, a3, a4);

    objc_msgSend(v6, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_opt_respondsToSelector();

    if ((v16 & 1) != 0)
    {
      objc_msgSend(v6, "delegate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "tableDidPopulateCellAtColumnIndex:rowIndex:", a3, a4);

    }
  }
  objc_msgSend(v6, "ttDocument");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sharedTopotextTimestamp");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "mergeableString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTimestamp:", v19);

  return v10;
}

- (void)enumerateTextStoragesForColumnIndexes:()UI rowIndexes:undoTarget:undoManager:usingBlock:
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  _QWORD *v30;
  _QWORD v31[3];
  char v32;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (v12)
    v17 = v12;
  else
    v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", 0, objc_msgSend(a1, "columnCount"));
  v18 = v17;
  if (v13)
    v19 = v13;
  else
    v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", 0, objc_msgSend(a1, "rowCount"));
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  v32 = 0;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __98__ICTable_UI__enumerateTextStoragesForColumnIndexes_rowIndexes_undoTarget_undoManager_usingBlock___block_invoke;
  v24[3] = &unk_1E5C1D900;
  v20 = v19;
  v30 = v31;
  v25 = v20;
  v26 = a1;
  v21 = v14;
  v27 = v21;
  v22 = v15;
  v28 = v22;
  v23 = v16;
  v29 = v23;
  objc_msgSend(v18, "enumerateIndexesUsingBlock:", v24);

  _Block_object_dispose(v31, 8);
}

- (ICTableColumnTextStorage)textStorageForColumn:()UI
{
  id v4;
  void *v5;
  ICTableColumnTextStorage *v6;
  ICTableColumnTextStorage *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(a1, "columnTextStorages");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (ICTableColumnTextStorage *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v7 = [ICTableColumnTextStorage alloc];
      objc_msgSend(a1, "document");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "replica");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v6 = -[ICTableColumnTextStorage initWithTable:columnID:replicaID:](v7, "initWithTable:columnID:replicaID:", a1, v4, v9);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = -[ICTableColumnTextStorage initWithTable:columnID:replicaID:](v7, "initWithTable:columnID:replicaID:", a1, v4, v10);

      }
      objc_msgSend(a1, "columnTextStorages");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v6, v4);

      objc_msgSend(a1, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_opt_respondsToSelector();

      if ((v13 & 1) != 0)
      {
        objc_msgSend(a1, "delegate");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "tableDidCreateColumnTextStorage:", v6);

      }
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "columnID", "-[ICTable(UI) textStorageForColumn:]", 1, 0, CFSTR("ColumnID must not be nil."));
    v6 = 0;
  }

  return v6;
}

- (uint64_t)joinedAttributedStringForColumns:()UI rows:
{
  return objc_msgSend(a1, "joinedAttributedStringForColumns:rows:deepCopyInlineAttachments:note:parentAttachment:", a3, a4, 0, 0, 0);
}

- (id)joinedAttributedStringForColumns:()UI rows:deepCopyInlineAttachments:note:parentAttachment:
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  _QWORD *v26;
  char v27;
  _QWORD v28[4];

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v16 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v28[3] = 0x7FFFFFFFFFFFFFFFLL;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __101__ICTable_UI__joinedAttributedStringForColumns_rows_deepCopyInlineAttachments_note_parentAttachment___block_invoke;
  v22[3] = &unk_1E5C1D950;
  v26 = v28;
  v17 = v16;
  v23 = v17;
  v27 = a5;
  v18 = v14;
  v24 = v18;
  v19 = v15;
  v25 = v19;
  objc_msgSend(a1, "enumerateCellObjectsInCellSelectionContainingColumnIndices:rowIndices:copyItems:usingBlock:", v12, v13, 0, v22);
  v20 = (void *)objc_msgSend(v17, "copy");

  _Block_object_dispose(v28, 8);
  return v20;
}

- (void)textStorageForCellAtColumnID:()UI rowID:undoTarget:undoManager:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_1AC7A1000, a1, a3, "textStorageForCellAtColumnID:rowID: invalid cell", a5, a6, a7, a8, 0);
}

@end
