@implementation ICTableCellMergeableStringDelegate

- (ICTableCellMergeableStringDelegate)init
{
  -[ICTableCellMergeableStringDelegate doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (ICTableCellMergeableStringDelegate)initWithTableCellChangeObserver:(id)a3 columnID:(id)a4 rowID:(id)a5
{
  id v8;
  id v9;
  id v10;
  ICTableCellMergeableStringDelegate *v11;
  ICTableCellMergeableStringDelegate *v12;
  uint64_t v13;
  NSMutableArray *undoCommands;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)ICTableCellMergeableStringDelegate;
  v11 = -[ICTableCellMergeableStringDelegate init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_changeObserver, v8);
    objc_storeStrong((id *)&v12->_columnID, a4);
    objc_storeStrong((id *)&v12->_rowID, a5);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = objc_claimAutoreleasedReturnValue();
    undoCommands = v12->_undoCommands;
    v12->_undoCommands = (NSMutableArray *)v13;

  }
  return v12;
}

- (void)beginEditing
{
  -[ICTableCellMergeableStringDelegate setEditingCount:](self, "setEditingCount:", -[ICTableCellMergeableStringDelegate editingCount](self, "editingCount") + 1);
}

- (void)endEditing
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  ICTableCellEditingUndoGroup *v8;
  void *v9;
  ICTableAttachmentSelection *v10;
  void *v11;
  void *v12;
  ICTableCellEditingUndoGroup *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (-[ICTableCellMergeableStringDelegate editingCount](self, "editingCount"))
    -[ICTableCellMergeableStringDelegate setEditingCount:](self, "setEditingCount:", -[ICTableCellMergeableStringDelegate editingCount](self, "editingCount") - 1);
  if (!-[ICTableCellMergeableStringDelegate editingCount](self, "editingCount"))
  {
    -[ICTableCellMergeableStringDelegate undoCommands](self, "undoCommands");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    if (v4)
    {
      -[ICTableCellMergeableStringDelegate changeObserver](self, "changeObserver");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "undoHelper");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "coalescingUndoGroupForStringDelegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", self);
      v8 = (ICTableCellEditingUndoGroup *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        objc_msgSend(v6, "tableSelection");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "type") == 1)
        {
          v10 = objc_alloc_init(ICTableAttachmentSelection);

          -[ICTableCellMergeableStringDelegate columnID](self, "columnID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICTableCellMergeableStringDelegate rowID](self, "rowID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          -[ICTableAttachmentSelection selectCellAtColumn:row:](v10, "selectCellAtColumn:row:", v11, v12);

          v9 = v10;
        }
        v13 = [ICTableCellEditingUndoGroup alloc];
        -[ICTableCellMergeableStringDelegate columnID](self, "columnID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[ICTableCellMergeableStringDelegate rowID](self, "rowID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "undoTarget");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = -[ICTableCellEditingUndoGroup initWithColumn:row:selection:undoTarget:](v13, "initWithColumn:row:selection:undoTarget:", v14, v15, v9, v16);

        objc_msgSend(v6, "coalescingUndoGroupForStringDelegate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKey:", v8, self);

        objc_msgSend(v6, "undoManager");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "undoTarget");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "registerUndoWithTarget:selector:object:", v19, sel_applyUndoGroup_, v8);

        objc_msgSend(v6, "undoManager");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D64218], "localizedFrameworkStringForKey:value:table:allowSiri:", CFSTR("Typing"), CFSTR("Typing"), 0, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setActionName:", v21);

      }
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      -[ICTableCellMergeableStringDelegate undoCommands](self, "undoCommands", 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v29;
        do
        {
          v26 = 0;
          do
          {
            if (*(_QWORD *)v29 != v25)
              objc_enumerationMutation(v22);
            -[ICTTMergeableStringUndoGroup addCommand:](v8, "addCommand:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v26++));
          }
          while (v24 != v26);
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        }
        while (v24);
      }

      -[ICTableCellMergeableStringDelegate undoCommands](self, "undoCommands");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "removeAllObjects");

    }
  }
}

- (void)edited:(unint64_t)a3 range:(_NSRange)a4 changeInLength:(int64_t)a5
{
  NSUInteger length;
  NSUInteger location;
  void *v10;
  void *v11;
  id v12;

  length = a4.length;
  location = a4.location;
  -[ICTableCellMergeableStringDelegate changeObserver](self, "changeObserver");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[ICTableCellMergeableStringDelegate columnID](self, "columnID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICTableCellMergeableStringDelegate rowID](self, "rowID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "tableCellWasEditedAtColumnID:rowID:edited:range:changeInLength:", v10, v11, a3, location, length, a5);

}

- (void)addUndoCommand:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[ICTableCellMergeableStringDelegate beginEditing](self, "beginEditing");
  -[ICTableCellMergeableStringDelegate undoCommands](self, "undoCommands");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v4);

  -[ICTableCellMergeableStringDelegate endEditing](self, "endEditing");
}

- (BOOL)wantsUndoCommands
{
  void *v3;
  void *v4;
  int v5;
  void *v6;

  -[ICTableCellMergeableStringDelegate changeObserver](self, "changeObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "undoHelper");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v4, "shouldPreventUndoCommands") & 1) != 0)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    -[ICTableCellMergeableStringDelegate changeObserver](self, "changeObserver");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "shouldPreventUndoCommands") ^ 1;

  }
  return v5;
}

- (ICTableCellMergeableStringObserving)changeObserver
{
  return (ICTableCellMergeableStringObserving *)objc_loadWeakRetained((id *)&self->_changeObserver);
}

- (NSUUID)columnID
{
  return self->_columnID;
}

- (NSUUID)rowID
{
  return self->_rowID;
}

- (unint64_t)editingCount
{
  return self->_editingCount;
}

- (void)setEditingCount:(unint64_t)a3
{
  self->_editingCount = a3;
}

- (NSMutableArray)undoCommands
{
  return self->_undoCommands;
}

- (void)setUndoCommands:(id)a3
{
  objc_storeStrong((id *)&self->_undoCommands, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_undoCommands, 0);
  objc_storeStrong((id *)&self->_rowID, 0);
  objc_storeStrong((id *)&self->_columnID, 0);
  objc_destroyWeak((id *)&self->_changeObserver);
}

@end
