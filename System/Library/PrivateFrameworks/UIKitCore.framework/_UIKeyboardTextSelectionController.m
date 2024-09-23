@implementation _UIKeyboardTextSelectionController

- (UITextSelection)selection
{
  void *v3;
  void *v4;
  UITextSelection *selection;
  UITextSelection *v6;
  UITextSelection *v7;
  void *v8;
  UITextSelection *v9;
  UITextSelection *v10;

  -[UITextSelection document](self->_selection, "document");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 != v4)
  {
    -[UITextSelection invalidate](self->_selection, "invalidate");
    selection = self->_selection;
    self->_selection = 0;

  }
  v6 = self->_selection;
  if (!v6)
  {
    v7 = [UITextSelection alloc];
    -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[UITextSelection initWithDocument:](v7, "initWithDocument:", v8);
    v10 = self->_selection;
    self->_selection = v9;

    -[UITextSelection selectionChanged](self->_selection, "selectionChanged");
    v6 = self->_selection;
  }
  return v6;
}

- (UITextInput)inputDelegate
{
  return (UITextInput *)objc_loadWeakRetained((id *)&self->_inputDelegate);
}

- (_UIKeyboardTextSelectionController)initWithInputDelegate:(id)a3
{
  id v4;
  _UIKeyboardTextSelectionController *v5;
  _UIKeyboardTextSelectionController *v6;
  id v7;
  id WeakRetained;
  id v9;
  CGSize v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UIKeyboardTextSelectionController;
  v5 = -[_UIKeyboardTextSelectionController init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    v7 = objc_storeWeak((id *)&v5->_inputDelegate, v4);
    v6->_hasInteractionAssistant = objc_opt_respondsToSelector() & 1;

    WeakRetained = objc_loadWeakRetained((id *)&v6->_inputDelegate);
    v6->_hasSelectionInteractionAssistant = objc_opt_respondsToSelector() & 1;

    v9 = objc_loadWeakRetained((id *)&v6->_inputDelegate);
    v6->_hasTextInputView = objc_opt_respondsToSelector() & 1;

    v10 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    v6->_caretRectForCursorPosition.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    v6->_caretRectForCursorPosition.size = v10;
  }

  return v6;
}

- (void)selectionDidChange
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;

  -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedTextRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_UIKeyboardTextSelectionController cursorPositionIsContainedByRange:](self, "cursorPositionIsContainedByRange:", v4);

  if (!v5)
    -[_UIKeyboardTextSelectionController resetCursorPosition](self, "resetCursorPosition");
  -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectedTextRange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEmpty");

  if (v8)
    -[_UIKeyboardTextSelectionController setSelectionGranularity:](self, "setSelectionGranularity:", 0);
  -[_UIKeyboardTextSelectionController interactionAssistant](self, "interactionAssistant");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "selectedTextRange");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEmpty");

    if (v13)
    {
      -[_UIKeyboardTextSelectionController interactionAssistant](self, "interactionAssistant");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setGrabberSuppressionAssertion:", 0);

    }
  }
}

- (UITextInteractionAssistant)interactionAssistant
{
  void *v2;
  void *v3;

  if (self->_hasInteractionAssistant)
  {
    -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "interactionAssistant");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return (UITextInteractionAssistant *)v3;
}

- (void)setSelectionGranularity:(int64_t)a3
{
  self->_selectionGranularity = a3;
}

- (BOOL)cursorPositionIsContainedByRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;

  v4 = a3;
  -[_UIKeyboardTextSelectionController cursorPosition](self, "cursorPosition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "start");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6
      || (-[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          -[_UIKeyboardTextSelectionController cursorPosition](self, "cursorPosition"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v7, "comparePosition:toPosition:", v8, v6),
          v8,
          v7,
          v9 == -1))
    {
      v13 = 0;
    }
    else
    {
      objc_msgSend(v4, "end");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIKeyboardTextSelectionController cursorPosition](self, "cursorPosition");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "comparePosition:toPosition:", v10, v12) != -1;

      }
      else
      {
        v13 = 0;
      }

    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (UITextPosition)cursorPosition
{
  UITextPosition *cursorPosition;
  void *v4;
  void *v5;
  UITextPosition *v6;
  UITextPosition *v7;

  cursorPosition = self->_cursorPosition;
  if (!cursorPosition)
  {
    -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "selectedTextRange");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "start");
    v6 = (UITextPosition *)objc_claimAutoreleasedReturnValue();
    v7 = self->_cursorPosition;
    self->_cursorPosition = v6;

    cursorPosition = self->_cursorPosition;
  }
  return cursorPosition;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_inputDelegate);
  objc_storeStrong((id *)&self->_selectionBase, 0);
  objc_storeStrong((id *)&self->_initialSelection, 0);
  objc_storeStrong((id *)&self->_selection, 0);
  objc_storeStrong((id *)&self->_cursorPosition, 0);
}

- (UISelectionInteractionAssistant)selectionInteractionAssistant
{
  void *v2;
  void *v3;

  if (self->_hasSelectionInteractionAssistant)
  {
    -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "selectionInteractionAssistant");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return (UISelectionInteractionAssistant *)v3;
}

- (void)beginSelectionChange
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[_UIKeyboardTextSelectionController interactionAssistant](self, "interactionAssistant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_UIKeyboardTextSelectionController interactionAssistant](self, "interactionAssistant");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "beginSelectionChange");
  }
  else
  {
    -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "inputDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "selectionWillChange:", v5);

  }
}

- (void)endSelectionChange
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[_UIKeyboardTextSelectionController interactionAssistant](self, "interactionAssistant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_UIKeyboardTextSelectionController interactionAssistant](self, "interactionAssistant");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "endSelectionChange");
  }
  else
  {
    -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "inputDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "selectionDidChange:", v5);

  }
}

- (void)setCursorPosition:(id)a3
{
  UITextPosition *v5;
  UITextPosition *v6;

  v5 = (UITextPosition *)a3;
  if (self->_cursorPosition != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_cursorPosition, a3);
    -[_UIKeyboardTextSelectionController setCaretRectForCursorPosition:](self, "setCaretRectForCursorPosition:", *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
    v5 = v6;
  }

}

- (void)resetCursorPosition
{
  -[_UIKeyboardTextSelectionController setCursorPosition:](self, "setCursorPosition:", 0);
}

- (void)setSelectedTextRange:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[_UIKeyboardTextSelectionController selection](self, "selection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isValid");

  if (v6)
  {
    -[_UIKeyboardTextSelectionController selection](self, "selection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSelectedRange:", v4);

    -[_UIKeyboardTextSelectionController selection](self, "selection");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "commit");

  }
  else
  {
    -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSelectedTextRange:", v4);

    -[_UIKeyboardTextSelectionController updateSelectionRects](self, "updateSelectionRects");
  }
}

- (CGRect)selectedRectInLineWithPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;
  CGPoint v34;
  CGRect v35;
  CGRect result;

  y = a3.y;
  x = a3.x;
  v33 = *MEMORY[0x1E0C80C00];
  -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectedTextRange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "selectionRectsForRange:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v29;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v29 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v15, "rect", (_QWORD)v28);
        v34.x = x;
        v34.y = y;
        if (CGRectContainsPoint(v35, v34))
        {
          objc_msgSend(v15, "rect");
          v16 = v20;
          v17 = v21;
          v18 = v22;
          v19 = v23;

          goto LABEL_11;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v12)
        continue;
      break;
    }
  }

  v16 = *MEMORY[0x1E0C9D628];
  v17 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v18 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v19 = *(double *)(MEMORY[0x1E0C9D628] + 24);
LABEL_11:

  v24 = v16;
  v25 = v17;
  v26 = v18;
  v27 = v19;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (UIView)textInputView
{
  void *v2;
  void *v3;

  if (self->_hasTextInputView)
  {
    -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "textInputView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return (UIView *)v3;
}

- (BOOL)hasCaretSelection
{
  void *v2;
  void *v3;
  char v4;

  -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectedTextRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEmpty");

  return v4;
}

- (BOOL)hasRangedSelection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;

  -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedTextRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "selectedTextRange");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEmpty") ^ 1;

  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (CGRect)caretRectForFirstSelectedPosition
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedTextRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "start");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "caretRectForPosition:", v5);
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;

  }
  else
  {
    v8 = *MEMORY[0x1E0C9D628];
    v10 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v12 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v14 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)caretRectForLastSelectedPosition
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedTextRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "end");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "caretRectForPosition:", v5);
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;

  }
  else
  {
    v8 = *MEMORY[0x1E0C9D628];
    v10 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v12 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v14 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (CGRect)caretRectForLeftmostSelectedPosition
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedTextRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4
    && (-[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "positionWithinRange:farthestInDirection:", v4, 3),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v6))
  {
    -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "caretRectForPosition:", v6);
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;

  }
  else
  {
    v9 = *MEMORY[0x1E0C9D628];
    v11 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v13 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v15 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (CGRect)caretRectForRightmostSelectedPosition
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedTextRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4
    && (-[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "positionWithinRange:farthestInDirection:", v4, 2),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v6))
  {
    -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "caretRectForPosition:", v6);
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;

  }
  else
  {
    v9 = *MEMORY[0x1E0C9D628];
    v11 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v13 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v15 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }

  v16 = v9;
  v17 = v11;
  v18 = v13;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (CGRect)caretRectForCursorPosition
{
  void *v3;
  void *v4;
  CGFloat v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  if (CGRectIsNull(self->_caretRectForCursorPosition))
  {
    -[_UIKeyboardTextSelectionController cursorPosition](self, "cursorPosition");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "caretRectForPosition:", v3);
      self->_caretRectForCursorPosition.origin.x = v5;
      self->_caretRectForCursorPosition.origin.y = v6;
      self->_caretRectForCursorPosition.size.width = v7;
      self->_caretRectForCursorPosition.size.height = v8;

    }
  }
  x = self->_caretRectForCursorPosition.origin.x;
  y = self->_caretRectForCursorPosition.origin.y;
  width = self->_caretRectForCursorPosition.size.width;
  height = self->_caretRectForCursorPosition.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)showSelectionCommands
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  id v7;

  -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedTextRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEmpty");

  if ((v5 & 1) == 0)
  {
    -[_UIKeyboardTextSelectionController interactionAssistant](self, "interactionAssistant");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_editMenuAssistant");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "showSelectionCommands");

  }
}

- (void)updateSelectionRects
{
  id v2;

  -[_UIKeyboardTextSelectionController interactionAssistant](self, "interactionAssistant");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setNeedsSelectionDisplayUpdate");

}

- (void)switchToRangedSelection
{
  void *v3;

  -[_UIKeyboardTextSelectionController interactionAssistant](self, "interactionAssistant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSelectionHighlightMode:", 0);

  -[_UIKeyboardTextSelectionController updateSelectionRects](self, "updateSelectionRects");
}

- (void)setRangedSelectionShouldShowGrabbers:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a3;
  -[_UIKeyboardTextSelectionController interactionAssistant](self, "interactionAssistant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeSelection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isValid");

  if (v7)
  {
    -[_UIKeyboardTextSelectionController interactionAssistant](self, "interactionAssistant");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSelectionDisplayVisible:", 1);

    -[_UIKeyboardTextSelectionController interactionAssistant](self, "interactionAssistant");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "activateSelection");

    -[_UIKeyboardTextSelectionController interactionAssistant](self, "interactionAssistant");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSelectionHighlightMode:", !v3);
  }
  else
  {
    -[_UIKeyboardTextSelectionController selectionInteractionAssistant](self, "selectionInteractionAssistant");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v3)
      objc_msgSend(v10, "configureForSelectionMode");
    else
      objc_msgSend(v10, "configureForHighlightMode");
  }

}

- (void)willHandoffLoupeMagnifier
{
  id v2;

  -[_UIKeyboardTextSelectionController interactionAssistant](self, "interactionAssistant");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWillHandoffLoupeMagnifier");

}

- (void)updateGestureRecognizers
{
  id v2;

  -[_UIKeyboardTextSelectionController interactionAssistant](self, "interactionAssistant");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setGestureRecognizers");

}

- (void)scrollSelectionToVisible
{
  void *v3;
  id v4;

  -[_UIKeyboardTextSelectionController interactionAssistant](self, "interactionAssistant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[_UIKeyboardTextSelectionController interactionAssistant](self, "interactionAssistant");
  else
    -[_UIKeyboardTextSelectionController selectionInteractionAssistant](self, "selectionInteractionAssistant");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scrollSelectionToVisible:", 0);

}

- (void)willBeginFloatingCursor:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[_UIKeyboardTextSelectionController interactionAssistant](self, "interactionAssistant");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "willBeginFloatingCursor:", v3);

}

- (void)beginFloatingCursorAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  char v7;
  id v8;

  y = a3.y;
  x = a3.x;
  -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "beginFloatingCursorAtPoint:", x, y);

  }
}

- (void)updateFloatingCursorAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  char v7;
  id v8;

  y = a3.y;
  x = a3.x;
  -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateFloatingCursorAtPoint:", x, y);

  }
}

- (void)endFloatingCursor
{
  void *v3;
  char v4;
  id v5;

  -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endFloatingCursor");

  }
}

- (void)beginLoupeMagnifierAtPoint:(CGPoint)a3
{
  double y;
  double x;
  id v5;

  y = a3.y;
  x = a3.x;
  -[_UIKeyboardTextSelectionController interactionAssistant](self, "interactionAssistant");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loupeMagnifierWithState:atPoint:", 1, x, y);

}

- (void)updateLoupeMagnifierAtPoint:(CGPoint)a3
{
  double y;
  double x;
  id v5;

  y = a3.y;
  x = a3.x;
  -[_UIKeyboardTextSelectionController interactionAssistant](self, "interactionAssistant");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loupeMagnifierWithState:atPoint:", 2, x, y);

}

- (void)endLoupeMagnifierAtPoint:(CGPoint)a3
{
  double y;
  double x;
  id v5;

  y = a3.y;
  x = a3.x;
  -[_UIKeyboardTextSelectionController interactionAssistant](self, "interactionAssistant");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loupeMagnifierWithState:atPoint:", 3, x, y);

}

- (void)beginRangedMagnifierAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  id v7;

  y = a3.y;
  x = a3.x;
  -[_UIKeyboardTextSelectionController interactionAssistant](self, "interactionAssistant");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    -[_UIKeyboardTextSelectionController interactionAssistant](self, "interactionAssistant");
  else
    -[_UIKeyboardTextSelectionController selectionInteractionAssistant](self, "selectionInteractionAssistant");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rangedMagnifierWithState:atPoint:", 1, x, y);

}

- (void)updateRangedMagnifierAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  id v7;

  y = a3.y;
  x = a3.x;
  -[_UIKeyboardTextSelectionController interactionAssistant](self, "interactionAssistant");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    -[_UIKeyboardTextSelectionController interactionAssistant](self, "interactionAssistant");
  else
    -[_UIKeyboardTextSelectionController selectionInteractionAssistant](self, "selectionInteractionAssistant");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rangedMagnifierWithState:atPoint:", 2, x, y);

}

- (void)endRangedMagnifierAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  id v7;

  y = a3.y;
  x = a3.x;
  -[_UIKeyboardTextSelectionController interactionAssistant](self, "interactionAssistant");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    -[_UIKeyboardTextSelectionController interactionAssistant](self, "interactionAssistant");
  else
    -[_UIKeyboardTextSelectionController selectionInteractionAssistant](self, "selectionInteractionAssistant");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rangedMagnifierWithState:atPoint:", 3, x, y);

}

- (BOOL)beginLoupeGestureAtPoint:(CGPoint)a3 translation:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  CGFloat v6;
  CGFloat v7;
  void *v8;
  _QWORD v10[6];
  _QWORD v11[6];
  BOOL v12;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  v12 = 0;
  -[_UIKeyboardTextSelectionController interactionAssistant](self, "interactionAssistant");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __75___UIKeyboardTextSelectionController_beginLoupeGestureAtPoint_translation___block_invoke;
  v11[3] = &__block_descriptor_48_e16__CGPoint_dd_8__0l;
  *(CGFloat *)&v11[4] = v7;
  *(CGFloat *)&v11[5] = v6;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __75___UIKeyboardTextSelectionController_beginLoupeGestureAtPoint_translation___block_invoke_2;
  v10[3] = &__block_descriptor_48_e16__CGPoint_dd_8__0l;
  *(CGFloat *)&v10[4] = x;
  *(CGFloat *)&v10[5] = y;
  objc_msgSend(v8, "loupeGestureWithState:location:translation:velocity:modifierFlags:shouldCancel:", 1, v11, v10, &__block_literal_global_380, 0, &v12);

  return v12;
}

- (void)updateLoupeGestureAtPoint:(CGPoint)a3 translation:(CGPoint)a4 velocity:(CGPoint)a5
{
  CGFloat y;
  CGFloat x;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  id v11;
  _QWORD v12[6];
  _QWORD v13[6];
  _QWORD v14[6];

  y = a5.y;
  x = a5.x;
  v7 = a4.y;
  v8 = a4.x;
  v9 = a3.y;
  v10 = a3.x;
  -[_UIKeyboardTextSelectionController interactionAssistant](self, "interactionAssistant");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __85___UIKeyboardTextSelectionController_updateLoupeGestureAtPoint_translation_velocity___block_invoke;
  v14[3] = &__block_descriptor_48_e16__CGPoint_dd_8__0l;
  *(CGFloat *)&v14[4] = v10;
  *(CGFloat *)&v14[5] = v9;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __85___UIKeyboardTextSelectionController_updateLoupeGestureAtPoint_translation_velocity___block_invoke_2;
  v13[3] = &__block_descriptor_48_e16__CGPoint_dd_8__0l;
  *(CGFloat *)&v13[4] = v8;
  *(CGFloat *)&v13[5] = v7;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __85___UIKeyboardTextSelectionController_updateLoupeGestureAtPoint_translation_velocity___block_invoke_3;
  v12[3] = &__block_descriptor_48_e16__CGPoint_dd_8__0l;
  *(CGFloat *)&v12[4] = x;
  *(CGFloat *)&v12[5] = y;
  objc_msgSend(v11, "loupeGestureWithState:location:translation:velocity:modifierFlags:shouldCancel:", 2, v14, v13, v12, 0, 0);

}

- (void)endLoupeGestureAtPoint:(CGPoint)a3 translation:(CGPoint)a4
{
  CGFloat y;
  CGFloat x;
  CGFloat v6;
  CGFloat v7;
  id v8;
  _QWORD v9[6];
  _QWORD v10[6];

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  -[_UIKeyboardTextSelectionController interactionAssistant](self, "interactionAssistant");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73___UIKeyboardTextSelectionController_endLoupeGestureAtPoint_translation___block_invoke;
  v10[3] = &__block_descriptor_48_e16__CGPoint_dd_8__0l;
  *(CGFloat *)&v10[4] = v7;
  *(CGFloat *)&v10[5] = v6;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __73___UIKeyboardTextSelectionController_endLoupeGestureAtPoint_translation___block_invoke_2;
  v9[3] = &__block_descriptor_48_e16__CGPoint_dd_8__0l;
  *(CGFloat *)&v9[4] = x;
  *(CGFloat *)&v9[5] = y;
  objc_msgSend(v8, "loupeGestureWithState:location:translation:velocity:modifierFlags:shouldCancel:", 3, v10, v9, &__block_literal_global_13_6, 0, 0);

}

- (CGPoint)boundedDeltaForTranslation:(CGPoint)a3 cursorLocationBase:(CGPoint)a4
{
  double y;
  double x;
  double v6;
  double v7;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGPoint result;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  -[_UIKeyboardTextSelectionController interactionAssistant](self, "interactionAssistant");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "activeSelection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isValid");

  if (v11)
  {
    if (+[UITextSelectionDisplayInteraction isModernSelectionViewEnabled](UITextSelectionDisplayInteraction, "isModernSelectionViewEnabled"))
    {
      -[_UIKeyboardTextSelectionController interactionAssistant](self, "interactionAssistant");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "boundedDeltaForTranslation:cursorLocationBase:", v7, v6, x, y);
      v14 = v13;
      v16 = v15;

    }
    else
    {
      -[_UIKeyboardTextSelectionController interactionAssistant](self, "interactionAssistant");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "_legacySelectionView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIKeyboardTextSelectionController textInputView](self, "textInputView");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "convertPoint:fromView:", v19, v7 + x, v6 + y);
      v21 = v20;
      v23 = v22;

      -[_UIKeyboardTextSelectionController interactionAssistant](self, "interactionAssistant");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "_legacySelectionView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "floatingCursorPositionForPoint:lineSnapping:", 0, v21, v23);
      v27 = v26;
      v29 = v28;

      v14 = v27 - v21;
      v16 = v29 - v23;
    }
  }
  else
  {
    v14 = *MEMORY[0x1E0C9D538];
    v16 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  v30 = v14;
  v31 = v16;
  result.y = v31;
  result.x = v30;
  return result;
}

- (void)beginSelection
{
  void *v3;
  void *v4;
  void *v5;

  -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedTextRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKeyboardTextSelectionController setInitialSelection:](self, "setInitialSelection:", v4);

  -[_UIKeyboardTextSelectionController initialSelection](self, "initialSelection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKeyboardTextSelectionController setSelectionBase:](self, "setSelectionBase:", v5);

  -[_UIKeyboardTextSelectionController beginSelectionChange](self, "beginSelectionChange");
}

- (void)restartSelection
{
  void *v3;
  void *v4;
  id v5;

  -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedTextRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKeyboardTextSelectionController setInitialSelection:](self, "setInitialSelection:", v4);

  -[_UIKeyboardTextSelectionController initialSelection](self, "initialSelection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIKeyboardTextSelectionController setSelectionBase:](self, "setSelectionBase:", v5);

}

- (void)selectPositionAtPoint:(CGPoint)a3 executionContext:(id)a4
{
  -[_UIKeyboardTextSelectionController selectPositionAtPoint:granularity:executionContext:](self, "selectPositionAtPoint:granularity:executionContext:", 0, a4, a3.x, a3.y);
}

- (void)selectPositionAtPoint:(CGPoint)a3 granularity:(int64_t)a4 executionContext:(id)a5
{
  double y;
  double x;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;

  y = a3.y;
  x = a3.x;
  v9 = a5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __89___UIKeyboardTextSelectionController_selectPositionAtPoint_granularity_executionContext___block_invoke;
  v11[3] = &unk_1E16B1B28;
  v12 = v9;
  v10 = v9;
  -[_UIKeyboardTextSelectionController selectPositionAtPoint:granularity:completionHandler:](self, "selectPositionAtPoint:granularity:completionHandler:", a4, v11, x, y);

}

- (void)selectPositionAtPoint:(CGPoint)a3 granularity:(int64_t)a4 completionHandler:(id)a5
{
  double y;
  double x;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  void *v29;
  void (**v30)(void);

  y = a3.y;
  x = a3.x;
  v30 = (void (**)(void))a5;
  -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "closestPositionToPoint:", x, y);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "markedTextRange");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "start");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "comparePosition:toPosition:", v10, v14);

    if (v15 == -1)
    {
      objc_msgSend(v12, "start");
      v19 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "end");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "comparePosition:toPosition:", v17, v10);

      if (v18 != -1)
        goto LABEL_7;
      objc_msgSend(v12, "end");
      v19 = objc_claimAutoreleasedReturnValue();
    }
    v20 = (void *)v19;

    v10 = v20;
  }
LABEL_7:
  -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "_findBoundaryPositionClosestToPosition:withGranularity:", v10, a4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "textRangeFromPosition:toPosition:", v22, v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      -[_UIKeyboardTextSelectionController setSelectedTextRange:](self, "setSelectedTextRange:", v24);
      -[_UIKeyboardTextSelectionController setCursorPosition:](self, "setCursorPosition:", v22);
      -[_UIKeyboardTextSelectionController setSelectionGranularity:](self, "setSelectionGranularity:", a4);
      -[_UIKeyboardTextSelectionController scrollSelectionToVisible](self, "scrollSelectionToVisible");
      if (v12)
      {
        -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "inputDelegate");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_opt_respondsToSelector();

        if ((v27 & 1) != 0)
        {
          -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "inputDelegate");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "didChangePhraseBoundary");

        }
      }
    }
  }
  else
  {
    v24 = 0;
  }
  if (v30)
    v30[2]();

}

- (void)selectPositionAtBoundary:(int64_t)a3 inDirection:(int64_t)a4 executionContext:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  -[_UIKeyboardTextSelectionController initialSelection](self, "initialSelection");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIKeyboardTextSelectionController selectPositionAtBoundary:inDirection:relativeToSelection:executionContext:](self, "selectPositionAtBoundary:inDirection:relativeToSelection:executionContext:", a3, a4, v9, v8);

}

- (void)selectImmediatePositionAtBoundary:(int64_t)a3 inDirection:(int64_t)a4 executionContext:(id)a5
{
  id v8;
  void *v9;
  id v10;

  v8 = a5;
  -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "selectedTextRange");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKeyboardTextSelectionController selectPositionAtBoundary:inDirection:relativeToSelection:executionContext:](self, "selectPositionAtBoundary:inDirection:relativeToSelection:executionContext:", a3, a4, v9, v8);

}

- (void)selectPositionAtBoundary:(int64_t)a3 inDirection:(int64_t)a4 relativeToSelection:(id)a5 executionContext:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a6;
  v10 = a5;
  -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_positionWithinRange:farthestInDirection:", v10, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_positionFromPosition:pastTextUnit:inDirection:", v12, a3, a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "textRangeFromPosition:toPosition:", v14, v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {
        -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setSelectedTextRange:", v16);

        -[_UIKeyboardTextSelectionController setCursorPosition:](self, "setCursorPosition:", v14);
        -[_UIKeyboardTextSelectionController setSelectionGranularity:](self, "setSelectionGranularity:", 0);
        -[_UIKeyboardTextSelectionController scrollSelectionToVisible](self, "scrollSelectionToVisible");

      }
    }
  }
  else
  {
    v14 = 0;
  }
  objc_msgSend(v18, "returnExecutionToParent");

}

- (void)selectTextWithGranularity:(int64_t)a3 atPoint:(CGPoint)a4 executionContext:(id)a5
{
  double y;
  double x;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;
  CGPoint v52;
  CGRect v53;

  y = a4.y;
  x = a4.x;
  v51 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "selectedTextRange");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[_UIKeyboardTextSelectionController selectionGranularity](self, "selectionGranularity") == a3 && v11)
  {
    -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "selectionRectsForRange:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v14 = v13;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v47;
      while (2)
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v47 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * v18), "rect", (_QWORD)v46);
          v52.x = x;
          v52.y = y;
          if (CGRectContainsPoint(v53, v52))
          {
            v20 = v14;
            goto LABEL_33;
          }
          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
        if (v16)
          continue;
        break;
      }
    }

  }
  -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate", (_QWORD)v46);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "closestPositionToPoint:", x, y);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "_rangeSpanningTextUnit:andPosition:", a3, v20);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    if (a3 == 1 && v14)
    {
      -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "caretRectForPosition:", v20);
      v25 = v24;

      -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "firstRectForRange:", v14);
      v28 = v27;

      v22 = v28 - v25;
      if (v28 - v25 <= 1.0)
        goto LABEL_19;
      -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate", v22);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "positionFromPosition:offset:", v20, -1);
      v30 = objc_claimAutoreleasedReturnValue();

      if (!v30)
      {
        v20 = 0;
LABEL_33:

        goto LABEL_34;
      }
      -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "_rangeSpanningTextUnit:andPosition:", 1, v30);
      v32 = objc_claimAutoreleasedReturnValue();

      v20 = (void *)v30;
      v14 = (id)v32;
    }
    if (v14)
    {
LABEL_19:
      objc_msgSend(v14, "end", v22);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "_characterInRelationToPosition:amount:", v33, 0xFFFFFFFFLL);

      if (v35 == 10)
      {
        do
        {
          -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "positionFromPosition:offset:", v33, -1);
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v36) = objc_msgSend(v38, "_characterInRelationToPosition:amount:", v37, 0xFFFFFFFFLL);

          v33 = v37;
        }
        while ((_DWORD)v36 == 10);
        if (!v37)
        {
LABEL_29:
          if (a3 == 1 && objc_msgSend(v11, "isEmpty"))
          {
            -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "_rangeOfSmartSelectionIncludingRange:", v14);
            v45 = objc_claimAutoreleasedReturnValue();

            v14 = (id)v45;
          }
          -[_UIKeyboardTextSelectionController setSelectedTextRange:](self, "setSelectedTextRange:", v14);
          -[_UIKeyboardTextSelectionController setCursorPosition:](self, "setCursorPosition:", v20);
          -[_UIKeyboardTextSelectionController setSelectionGranularity:](self, "setSelectionGranularity:", a3);
          -[_UIKeyboardTextSelectionController scrollSelectionToVisible](self, "scrollSelectionToVisible");

          goto LABEL_33;
        }
      }
      else
      {
        v37 = v33;
        if (!v33)
          goto LABEL_29;
      }
      objc_msgSend(v14, "end");
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (v37 != v39)
      {
        -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "start");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "textRangeFromPosition:toPosition:", v41, v37);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        if (v42)
        {
          v43 = v42;

          v14 = v43;
        }

      }
      goto LABEL_29;
    }
  }
LABEL_34:
  objc_msgSend(v9, "returnExecutionToParent");

}

- (void)selectTextWithGranularity:(int64_t)a3 atPoint:(CGPoint)a4 completionHandler:(id)a5
{
  double y;
  double x;
  void *v9;
  id v10;

  y = a4.y;
  x = a4.x;
  v10 = a5;
  -[_UIKeyboardTextSelectionController selectTextWithGranularity:atPoint:executionContext:](self, "selectTextWithGranularity:atPoint:executionContext:", a3, 0, x, y);
  v9 = v10;
  if (v10)
  {
    (*((void (**)(id))v10 + 2))(v10);
    v9 = v10;
  }

}

- (void)beginSelectionWithBaseAtSelectionBoundaryInDirection:(int64_t)a3 initialExtentPoint:(CGPoint)a4 executionContext:(id)a5
{
  double y;
  double x;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;

  y = a4.y;
  x = a4.x;
  v18 = a5;
  -[_UIKeyboardTextSelectionController beginSelection](self, "beginSelection");
  -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "selectedTextRange");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v10, "isEmpty") & 1) == 0)
  {
    if (v10)
    {
      -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "positionWithinRange:farthestInDirection:", v10, a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if ((unint64_t)(a3 - 2) <= 3)
          a3 = qword_186681760[a3 - 2];
        objc_msgSend(v13, "characterRangeByExtendingPosition:inDirection:", v12, a3);
        v15 = objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v16 = (void *)v15;

LABEL_10:
          -[_UIKeyboardTextSelectionController setSelectionBase:](self, "setSelectionBase:", v16);

          goto LABEL_11;
        }
        -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "textRangeFromPosition:toPosition:", v12, v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
          goto LABEL_10;
      }
    }
    else
    {
      v12 = 0;
    }
LABEL_11:

  }
  -[_UIKeyboardTextSelectionController updateSelectionWithExtentPoint:executionContext:](self, "updateSelectionWithExtentPoint:executionContext:", v18, x, y);

}

- (void)beginSelectionWithBasePositionAtBoundary:(int64_t)a3 inDirection:(int64_t)a4 withInitialExtentPoint:(CGPoint)a5 executionContext:(id)a6
{
  double y;
  double x;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  id v26;

  y = a5.y;
  x = a5.x;
  v26 = a6;
  -[_UIKeyboardTextSelectionController beginSelection](self, "beginSelection");
  -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "closestPositionToPoint:", x, y);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_positionFromPosition:pastTextUnit:inDirection:", v12, a3, a4);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v14)
      v16 = (void *)v14;
    else
      v16 = v12;
    v17 = v16;

    -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "textRangeFromPosition:toPosition:", v17, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
      -[_UIKeyboardTextSelectionController setSelectionBase:](self, "setSelectionBase:", v19);
    -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (a4)
    {
      v22 = v17;
      v23 = v12;
    }
    else
    {
      v22 = v12;
      v23 = v17;
    }
    objc_msgSend(v20, "textRangeFromPosition:toPosition:", v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setSelectedTextRange:", v24);

      -[_UIKeyboardTextSelectionController setCursorPosition:](self, "setCursorPosition:", v12);
      -[_UIKeyboardTextSelectionController setSelectionGranularity:](self, "setSelectionGranularity:", a3);
    }

  }
  objc_msgSend(v26, "returnExecutionToParent");

}

- (void)updateSelectionWithExtentPosition:(id)a3 executionContext:(id)a4
{
  -[_UIKeyboardTextSelectionController updateSelectionWithExtentPoint:andExtentPosition:executionContext:](self, "updateSelectionWithExtentPoint:andExtentPosition:executionContext:", a3, a4, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
}

- (void)updateSelectionWithExtentPoint:(CGPoint)a3 andExtentPosition:(id)a4 executionContext:(id)a5
{
  double y;
  double x;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  y = a3.y;
  x = a3.x;
  v24 = a4;
  v9 = a5;
  -[_UIKeyboardTextSelectionController selectionBase](self, "selectionBase");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "start");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIKeyboardTextSelectionController selectionBase](self, "selectionBase");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "end");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v24 || !v11 || !v13)
    goto LABEL_14;
  -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "comparePosition:toPosition:", v13, v24);

  if (v15 == -1)
  {
    v18 = v13;
    v13 = v24;
    v19 = v11;
  }
  else
  {
    -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "comparePosition:toPosition:", v24, v11);

    v18 = v11;
    v19 = v24;
    if (v17 != -1)
      goto LABEL_9;
  }
  v20 = v24;

  v11 = v19;
LABEL_9:
  -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "textRangeFromPosition:toPosition:", v11, v13);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[_UIKeyboardTextSelectionController setSelectedTextRange:](self, "setSelectedTextRange:", v22);
    -[_UIKeyboardTextSelectionController setCursorPosition:](self, "setCursorPosition:", v24);
    -[_UIKeyboardTextSelectionController setSelectionGranularity:](self, "setSelectionGranularity:", 0);
    if (x != *MEMORY[0x1E0C9D538] || y != *(double *)(MEMORY[0x1E0C9D538] + 8))
    {
      -[_UIKeyboardTextSelectionController interactionAssistant](self, "interactionAssistant");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "startAutoscroll:", x, y);

    }
  }

LABEL_14:
  objc_msgSend(v9, "returnExecutionToParent");

}

- (void)updateSelectionWithExtentPoint:(CGPoint)a3 executionContext:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  id v9;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "closestPositionToPoint:", x, y);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[_UIKeyboardTextSelectionController updateSelectionWithExtentPosition:executionContext:](self, "updateSelectionWithExtentPosition:executionContext:", v9, v7);
}

- (void)updateSelectionWithExtentAtBoundary:(int64_t)a3 inDirection:(int64_t)a4 executionContext:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  -[_UIKeyboardTextSelectionController initialSelection](self, "initialSelection");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[_UIKeyboardTextSelectionController updateSelectionWithExtentAtBoundary:inDirection:relativeToSelection:executionContext:](self, "updateSelectionWithExtentAtBoundary:inDirection:relativeToSelection:executionContext:", a3, a4, v9, v8);

}

- (void)updateImmediateSelectionWithExtentAtBoundary:(int64_t)a3 inDirection:(int64_t)a4 executionContext:(id)a5
{
  id v8;
  void *v9;
  id v10;

  v8 = a5;
  -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "selectedTextRange");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKeyboardTextSelectionController updateSelectionWithExtentAtBoundary:inDirection:relativeToSelection:executionContext:](self, "updateSelectionWithExtentAtBoundary:inDirection:relativeToSelection:executionContext:", a3, a4, v9, v8);

}

- (void)updateSelectionWithExtentAtBoundary:(int64_t)a3 inDirection:(int64_t)a4 relativeToSelection:(id)a5 executionContext:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a5;
  v10 = a6;
  if (v15)
  {
    -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "positionWithinRange:farthestInDirection:", v15, a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_positionFromPosition:pastTextUnit:inDirection:", v12, a3, a4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = 0;
    }
  }
  else
  {
    v14 = 0;
    v12 = 0;
  }
  -[_UIKeyboardTextSelectionController updateSelectionWithExtentPosition:executionContext:](self, "updateSelectionWithExtentPosition:executionContext:", v14, v10);

}

- (void)updateSelectionWithExtentPoint:(CGPoint)a3 withBoundary:(int64_t)a4 executionContext:(id)a5
{
  double y;
  double x;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;

  y = a3.y;
  x = a3.x;
  v24 = a5;
  -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "closestPositionToPoint:", x, y);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_rangeOfTextUnit:enclosingPosition:", a4, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
      goto LABEL_10;
    -[_UIKeyboardTextSelectionController initialSelection](self, "initialSelection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
      goto LABEL_10;
    -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKeyboardTextSelectionController initialSelection](self, "initialSelection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "start");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v14, "comparePosition:toPosition:", v10, v16);

    if (v17 == -1)
    {
      objc_msgSend(v12, "start");
      v22 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIKeyboardTextSelectionController initialSelection](self, "initialSelection");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "end");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v18, "comparePosition:toPosition:", v20, v10);

      if (v21 != -1)
      {
LABEL_10:
        -[_UIKeyboardTextSelectionController updateSelectionWithExtentPoint:andExtentPosition:executionContext:](self, "updateSelectionWithExtentPoint:andExtentPosition:executionContext:", v10, v24, x, y);

        goto LABEL_11;
      }
      objc_msgSend(v12, "end");
      v22 = objc_claimAutoreleasedReturnValue();
    }
    v23 = (void *)v22;

    v10 = v23;
    goto LABEL_10;
  }
  objc_msgSend(v24, "returnExecutionToParent");
LABEL_11:

}

- (void)modifySelectionWithExtentPoint:(CGPoint)a3 executionContext:(id)a4
{
  double y;
  double x;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  void *v28;
  id v29;

  y = a3.y;
  x = a3.x;
  v29 = a4;
  -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectedTextRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "start");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "end");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "closestPositionToPoint:", x, y);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12 || !v9 || !v10)
    goto LABEL_16;
  -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "comparePosition:toPosition:", v10, v12);

  if (v14 == -1)
  {
    v18 = v10;
    v19 = v12;
LABEL_12:
    v26 = v12;

    v10 = v19;
    goto LABEL_13;
  }
  -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "comparePosition:toPosition:", v12, v9);

  if (v16 == -1)
    goto LABEL_10;
  -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "comparePosition:toPosition:", v9, v12) != -1)
  {

    goto LABEL_11;
  }
  -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIKeyboardTextSelectionController selectionBase](self, "selectionBase");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "start");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v20, "comparePosition:toPosition:", v22, v12);

  if (v23 == 1)
  {
LABEL_10:
    v18 = v9;
    v19 = v10;
    v9 = v12;
    goto LABEL_12;
  }
LABEL_11:
  -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "comparePosition:toPosition:", v12, v10);

  v18 = v10;
  v19 = v12;
  if (v25 == -1)
    goto LABEL_12;
LABEL_13:
  -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "textRangeFromPosition:toPosition:", v9, v10);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
    -[_UIKeyboardTextSelectionController setSelectedTextRange:](self, "setSelectedTextRange:", v28);

LABEL_16:
  objc_msgSend(v29, "returnExecutionToParent");

}

- (void)endSelection
{
  void *v3;
  id v4;

  -[_UIKeyboardTextSelectionController setInitialSelection:](self, "setInitialSelection:", 0);
  -[_UIKeyboardTextSelectionController setSelectionBase:](self, "setSelectionBase:", 0);
  -[_UIKeyboardTextSelectionController interactionAssistant](self, "interactionAssistant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelAutoscroll");

  -[_UIKeyboardTextSelectionController updateSelectionRects](self, "updateSelectionRects");
  -[_UIKeyboardTextSelectionController endSelectionChange](self, "endSelectionChange");
  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateDictationPopoverLocationIfNeeded");

}

- (UITextRange)initialSelection
{
  return self->_initialSelection;
}

- (void)setInitialSelection:(id)a3
{
  objc_storeStrong((id *)&self->_initialSelection, a3);
}

- (void)setCaretRectForCursorPosition:(CGRect)a3
{
  self->_caretRectForCursorPosition = a3;
}

- (int64_t)selectionGranularity
{
  return self->_selectionGranularity;
}

- (UITextRange)selectionBase
{
  return self->_selectionBase;
}

- (void)setSelectionBase:(id)a3
{
  objc_storeStrong((id *)&self->_selectionBase, a3);
}

@end
