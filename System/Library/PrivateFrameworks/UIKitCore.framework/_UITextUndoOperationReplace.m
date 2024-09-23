@implementation _UITextUndoOperationReplace

- (_UITextUndoOperationReplace)initWithAffectedRange:(_NSRange)a3 inputController:(id)a4 replacementRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v7;
  NSUInteger v8;
  id v10;
  _UITextUndoOperationReplace *v11;
  _UITextUndoOperationReplace *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSAttributedString *attributedString;
  objc_super v20;

  length = a5.length;
  location = a5.location;
  v7 = a3.length;
  v8 = a3.location;
  v10 = a4;
  v20.receiver = self;
  v20.super_class = (Class)_UITextUndoOperationReplace;
  v11 = -[_UIUndoTextOperation initWithAffectedRange:inputController:](&v20, sel_initWithAffectedRange_inputController_, v8, v7, v10);
  v12 = v11;
  if (v11)
  {
    v11->_replacementRange.location = location;
    v11->_replacementRange.length = length;
    objc_msgSend(v10, "_textStorage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[_UIUndoTextOperation affectedRange](v12, "affectedRange");
    objc_msgSend(v13, "_UIUndoRedoAttributedSubstringFromRange:", v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "copy");
    attributedString = v12->_attributedString;
    v12->_attributedString = (NSAttributedString *)v17;

  }
  return v12;
}

- (void)undoRedo
{
  void *v4;
  void *v5;
  NSUInteger location;
  NSUInteger length;
  NSUInteger v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  NSUInteger v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSAttributedString *v17;
  NSAttributedString *attributedString;
  void *v19;
  objc_super v20;
  _QWORD v21[7];

  -[_UIUndoTextOperation inputController](self, "inputController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "undoManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isUndoing"))
  {
    location = self->_replacementRange.location;
    length = self->_replacementRange.length;
  }
  else
  {
    location = -[_UIUndoTextOperation affectedRange](self, "affectedRange");
    length = v8;
  }
  objc_msgSend(v4, "_textStorage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v4, "_setUndoRedoInProgress:", 1);
    -[NSAttributedString string](self->_attributedString, "string");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v4, "_delegateShouldChangeTextInRange:replacementText:", location, length, v10);

    if (v11)
    {
      objc_msgSend(v9, "_UIUndoRedoAttributedSubstringFromRange:", location, length);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "undoWillChangeText");
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __39___UITextUndoOperationReplace_undoRedo__block_invoke;
      v21[3] = &unk_1E16E61C0;
      v21[5] = location;
      v21[6] = length;
      v21[4] = self;
      objc_msgSend(v9, "coordinateEditing:", v21);
      if (objc_msgSend(v5, "isUndoing"))
      {
        v13 = -[_UIUndoTextOperation affectedRange](self, "affectedRange");
        v15 = v14;
      }
      else
      {
        v15 = 0;
        v13 = self->_replacementRange.length + self->_replacementRange.location;
      }
      objc_msgSend(v4, "setSelectedRange:", v13, v15);
      objc_msgSend(v4, "undoDidReplaceRange:withAttributedText:", location, length, self->_attributedString);
      objc_msgSend(v4, "scrollRangeToVisible:", v13, v15);
      v17 = (NSAttributedString *)objc_msgSend(v12, "copy");
      attributedString = self->_attributedString;
      self->_attributedString = v17;

      objc_msgSend(v4, "_textStorage");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "registerUndoWithTarget:selector:object:", v19, sel__UIUndoRedoTextOperation_, self);

    }
    objc_msgSend(v4, "_setUndoRedoInProgress:", 0);
    v20.receiver = self;
    v20.super_class = (Class)_UITextUndoOperationReplace;
    -[_UIUndoTextOperation undoRedo](&v20, sel_undoRedo);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSTextStorage_Undo.m"), 117, CFSTR("Incorrect or nil NSTextStorage requested for undo operation: %@"), self);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedString, 0);
}

@end
