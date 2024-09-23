@implementation ICTableCellEditingUndoGroup

- (ICTableCellEditingUndoGroup)init
{
  -[ICTableCellEditingUndoGroup doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (ICTableCellEditingUndoGroup)initWithColumn:(id)a3 row:(id)a4 selection:(id)a5 undoTarget:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ICTableCellEditingUndoGroup *v15;
  ICTableCellEditingUndoGroup *v16;
  uint64_t v17;
  ICTableAttachmentSelection *tableSelection;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)ICTableCellEditingUndoGroup;
  v15 = -[ICTTMergeableStringUndoGroup init](&v20, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_columnID, a3);
    objc_storeStrong((id *)&v16->_rowID, a4);
    v17 = objc_msgSend(v13, "copy");
    tableSelection = v16->_tableSelection;
    v16->_tableSelection = (ICTableAttachmentSelection *)v17;

    objc_storeStrong((id *)&v16->_undoTarget, a6);
  }

  return v16;
}

- (NSUUID)columnID
{
  return self->_columnID;
}

- (NSUUID)rowID
{
  return self->_rowID;
}

- (ICTableAttachmentSelection)tableSelection
{
  return self->_tableSelection;
}

- (ICTableUndoTarget)undoTarget
{
  return self->_undoTarget;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_undoTarget, 0);
  objc_storeStrong((id *)&self->_tableSelection, 0);
  objc_storeStrong((id *)&self->_rowID, 0);
  objc_storeStrong((id *)&self->_columnID, 0);
}

@end
