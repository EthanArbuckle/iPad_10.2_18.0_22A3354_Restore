@implementation _UITextUndoOperationTyping

- (_UITextUndoOperationTyping)initWithAffectedRange:(_NSRange)a3 inputController:(id)a4 replacementRange:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v7;
  NSUInteger v8;
  id v10;
  _UITextUndoOperationTyping *v11;
  _UITextUndoOperationTyping *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSMutableAttributedString *attributedString;
  _UITextUndoOperationTyping *v18;
  objc_super v20;

  length = a5.length;
  location = a5.location;
  v7 = a3.length;
  v8 = a3.location;
  v10 = a4;
  v20.receiver = self;
  v20.super_class = (Class)_UITextUndoOperationTyping;
  v11 = -[_UIUndoTextOperation initWithAffectedRange:inputController:](&v20, sel_initWithAffectedRange_inputController_, v8, v7, v10);
  v12 = v11;
  if (v11)
  {
    v11->_replacementRange.location = location;
    v11->_replacementRange.length = length;
    v13 = objc_alloc(MEMORY[0x1E0CB3778]);
    objc_msgSend(v10, "_textStorage");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "_UIUndoRedoAttributedSubstringFromRange:", v8, v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v13, "initWithAttributedString:", v15);
    attributedString = v12->_attributedString;
    v12->_attributedString = (NSMutableAttributedString *)v16;

    v18 = v12;
  }

  return v12;
}

- (BOOL)coalesceAffectedRange:(_NSRange)a3 replacementRange:(_NSRange)a4 selectedRange:(_NSRange)a5 textStorage:(id)a6
{
  NSUInteger length;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger location;
  id v11;
  BOOL v12;
  _NSRange *p_replacementRange;
  NSUInteger v14;
  NSUInteger v15;
  NSUInteger v16;
  BOOL v17;
  NSUInteger v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  NSMutableAttributedString *attributedString;
  void *v24;

  length = a5.length;
  v7 = a4.length;
  v8 = a3.length;
  location = a3.location;
  v11 = a6;
  if (length)
    goto LABEL_2;
  p_replacementRange = &self->_replacementRange;
  v15 = self->_replacementRange.location;
  v14 = self->_replacementRange.length;
  v16 = v14 + v15;
  if (!v7 || (v16 == location ? (v17 = v8 == 0) : (v17 = 0), !v17))
  {
    if (location + v8 != v16)
    {
LABEL_2:
      -[_UIUndoTextOperation affectedRange](self, "affectedRange");
      v12 = 0;
      goto LABEL_15;
    }
    if (v14 >= v8)
    {
      v14 -= v8;
    }
    else
    {
      v18 = v15 - v8 + v14;
      v14 = 0;
      p_replacementRange->location = v18;
    }
  }
  self->_replacementRange.length = v14 + v7;
  v19 = -[_UIUndoTextOperation affectedRange](self, "affectedRange");
  if (p_replacementRange->location < v19)
  {
    v21 = v19;
    v22 = v20;
    attributedString = self->_attributedString;
    objc_msgSend(v11, "_UIUndoRedoAttributedSubstringFromRange:", location, v8);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableAttributedString replaceCharactersInRange:withAttributedString:](attributedString, "replaceCharactersInRange:withAttributedString:", 0, 0, v24);

    -[_UIUndoTextOperation setAffectedRange:](self, "setAffectedRange:", p_replacementRange->location, v22 + v21 - p_replacementRange->location);
  }
  v12 = 1;
LABEL_15:

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
  id v12;
  void *v13;
  NSMutableAttributedString *v14;
  NSUInteger v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSMutableAttributedString *attributedString;
  NSMutableAttributedString *v20;
  void *v21;
  objc_super v22;
  _QWORD v23[7];

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
    -[NSMutableAttributedString string](self->_attributedString, "string");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v4, "_delegateShouldChangeTextInRange:replacementText:", location, length, v10);

    if (v11)
    {
      v12 = objc_alloc(MEMORY[0x1E0CB3778]);
      objc_msgSend(v9, "_UIUndoRedoAttributedSubstringFromRange:", location, length);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (NSMutableAttributedString *)objc_msgSend(v12, "initWithAttributedString:", v13);

      objc_msgSend(v4, "undoWillChangeText");
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __38___UITextUndoOperationTyping_undoRedo__block_invoke;
      v23[3] = &unk_1E16E61C0;
      v23[5] = location;
      v23[6] = length;
      v23[4] = self;
      objc_msgSend(v9, "coordinateEditing:", v23);
      if (objc_msgSend(v5, "isUndoing"))
      {
        v15 = -[_UIUndoTextOperation affectedRange](self, "affectedRange");
        v17 = v16;
      }
      else
      {
        v17 = 0;
        v15 = self->_replacementRange.length + self->_replacementRange.location;
      }
      objc_msgSend(v4, "setSelectedRange:", v15, v17);
      objc_msgSend(v4, "undoDidReplaceRange:withAttributedText:", location, length, self->_attributedString);
      objc_msgSend(v4, "scrollRangeToVisible:", v15, v17);
      attributedString = self->_attributedString;
      self->_attributedString = v14;
      v20 = v14;

      objc_msgSend(v4, "_textStorage");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "registerUndoWithTarget:selector:object:", v21, sel__UIUndoRedoTextOperation_, self);

    }
    objc_msgSend(v4, "_setUndoRedoInProgress:", 0);
    v22.receiver = self;
    v22.super_class = (Class)_UITextUndoOperationTyping;
    -[_UIUndoTextOperation undoRedo](&v22, sel_undoRedo);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NSTextStorage_Undo.m"), 259, CFSTR("Incorrect or nil NSTextStorage requested for undo operation %@, "), self);

  }
}

- (BOOL)supportsCoalescing
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedString, 0);
}

@end
