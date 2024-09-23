@implementation _UITextUndoOperationSetAttributes

- (_UITextUndoOperationSetAttributes)initWithAffectedRange:(_NSRange)a3 inputController:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  _UITextUndoOperationSetAttributes *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _NSAttributeRun *attributes;
  _UITextUndoOperationSetAttributes *v15;
  objc_super v17;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)_UITextUndoOperationSetAttributes;
  v8 = -[_UIUndoTextOperation initWithAffectedRange:inputController:](&v17, sel_initWithAffectedRange_inputController_, location, length, v7);
  if (v8)
  {
    v9 = objc_alloc((Class)&sel_isDoubleTapEnabled[8]);
    objc_msgSend(v7, "_textStorage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[_UIUndoTextOperation affectedRange](v8, "affectedRange");
    v13 = objc_msgSend(v9, "initWithTextStorage:range:", v10, v11, v12);
    attributes = v8->_attributes;
    v8->_attributes = (_NSAttributeRun *)v13;

    v15 = v8;
  }

  return v8;
}

- (void)undoRedo
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _NSAttributeRun *v11;
  _NSAttributeRun *attributes;
  _NSAttributeRun *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  -[_UIUndoTextOperation inputController](self, "inputController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_textStorage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "_setUndoRedoInProgress:", 1);
    v6 = -[_NSAttributeRun range](self->_attributes, "range");
    if (objc_msgSend(v4, "_delegateShouldChangeTextInRange:replacementText:", v6, v7, 0))
    {
      v8 = -[_UIUndoTextOperation affectedRange](self, "affectedRange");
      v10 = v9;
      v11 = (_NSAttributeRun *)objc_msgSend(objc_alloc((Class)&sel_isDoubleTapEnabled[8]), "initWithTextStorage:range:", v5, v8, v9);
      objc_msgSend(v4, "undoWillChangeText");
      -[_NSAttributeRun restoreAttributesOfTextStorage:](self->_attributes, "restoreAttributesOfTextStorage:", v5);
      attributes = self->_attributes;
      self->_attributes = v11;
      v13 = v11;

      v14 = -[_UIUndoTextOperation affectedRange](self, "affectedRange");
      v16 = v15;
      objc_msgSend(v4, "setSelectedRange:", v14, v15);
      objc_msgSend(v5, "attributedSubstringFromRange:", v14, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "undoDidReplaceRange:withAttributedText:", v8, v10, v17);

      objc_msgSend(v4, "scrollRangeToVisible:", v14, v16);
      objc_msgSend(v4, "undoManager");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_textStorage");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "registerUndoWithTarget:selector:object:", v19, sel__UIUndoRedoTextOperation_, self);

      objc_msgSend(v4, "_invalidateTypingAttributes");
    }
    objc_msgSend(v4, "_setUndoRedoInProgress:", 0);
    v21.receiver = self;
    v21.super_class = (Class)_UITextUndoOperationSetAttributes;
    -[_UIUndoTextOperation undoRedo](&v21, sel_undoRedo);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSTextStorage_Undo.m"), 166, CFSTR("Incorrect or nil NSTextStorage requested for undo operation: %@"), self);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributes, 0);
}

@end
