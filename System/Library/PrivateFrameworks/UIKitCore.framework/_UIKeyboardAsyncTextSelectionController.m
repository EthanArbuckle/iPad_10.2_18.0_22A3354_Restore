@implementation _UIKeyboardAsyncTextSelectionController

- (BOOL)cursorPositionIsContainedByRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *i;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[_UIKeyboardTextSelectionController cursorPosition](self, "cursorPosition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKeyboardTextSelectionController cursorPosition](self, "cursorPosition");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "caretRectForPosition:", v7);
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;

    v28.origin.x = v9;
    v28.origin.y = v11;
    v28.size.width = v13;
    v28.size.height = v15;
    if (CGRectIsEmpty(v28))
    {
      LOBYTE(v5) = 0;
    }
    else
    {
      -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "selectionRectsForRange:", v4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v18 = v17;
      v5 = (void *)objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v5)
      {
        v19 = *(_QWORD *)v23;
        while (2)
        {
          for (i = 0; i != v5; i = (char *)i + 1)
          {
            if (*(_QWORD *)v23 != v19)
              objc_enumerationMutation(v18);
            objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i), "rect", (_QWORD)v22);
            v30.origin.x = v9;
            v30.origin.y = v11;
            v30.size.width = v13;
            v30.size.height = v15;
            if (CGRectIntersectsRect(v29, v30))
            {
              LOBYTE(v5) = 1;
              goto LABEL_14;
            }
          }
          v5 = (void *)objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
          if (v5)
            continue;
          break;
        }
      }
LABEL_14:

    }
  }

  return (char)v5;
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
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
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
    objc_msgSend(v4, "start");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "caretRectForPosition:", v7);
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

  objc_msgSend(v4, "end");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "end");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "caretRectForPosition:", v18);
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;

  }
  else
  {
    v20 = *MEMORY[0x1E0C9D628];
    v22 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v24 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v26 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }

  if (v9 >= v20)
  {
    v9 = v20;
    v11 = v22;
    v13 = v24;
    v15 = v26;
  }

  v27 = v9;
  v28 = v11;
  v29 = v13;
  v30 = v15;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
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
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
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
    objc_msgSend(v4, "start");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "caretRectForPosition:", v7);
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

  objc_msgSend(v4, "end");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "end");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "caretRectForPosition:", v18);
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;

  }
  else
  {
    v20 = *MEMORY[0x1E0C9D628];
    v22 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v24 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v26 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }

  if (v9 <= v20)
  {
    v9 = v20;
    v11 = v22;
    v13 = v24;
    v15 = v26;
  }

  v27 = v9;
  v28 = v11;
  v29 = v13;
  v30 = v15;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

- (BOOL)shouldAllowSelectionGestureWithTouchType:(int64_t)a3 atPoint:(CGPoint)a4 toProgressToState:(int64_t)a5
{
  double y;
  double x;
  void *v8;
  int v9;

  y = a4.y;
  x = a4.x;
  +[UIKBInputDelegateManager isAsyncTextInputEnabled](UIKBInputDelegateManager, "isAsyncTextInputEnabled", a3, a5);
  -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasSelectablePositionAtPoint:", x, y);
  if (v9)
    objc_msgSend(v8, "_cancelLongPressGestureRecognizer");

  return v9;
}

- (void)selectPositionAtPoint:(CGPoint)a3 executionContext:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _UIKeyboardAsyncTextSelectionController *v13;
  id v14;
  double v15;
  double v16;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __82___UIKeyboardAsyncTextSelectionController_selectPositionAtPoint_executionContext___block_invoke;
  v11[3] = &unk_1E16C1C58;
  v12 = v7;
  v13 = self;
  v14 = v8;
  v15 = x;
  v16 = y;
  v9 = v8;
  v10 = v7;
  -[_UIKeyboardAsyncTextSelectionController selectPositionAtPoint:completionHandler:](self, "selectPositionAtPoint:completionHandler:", v11, x, y);

}

- (void)selectPositionAtPoint:(CGPoint)a3 completionHandler:(id)a4
{
  -[_UIKeyboardAsyncTextSelectionController selectPositionAtPoint:granularity:completionHandler:](self, "selectPositionAtPoint:granularity:completionHandler:", 0, a4, a3.x, a3.y);
}

- (void)selectPositionAtPoint:(CGPoint)a3 granularity:(int64_t)a4 completionHandler:(id)a5
{
  double y;
  double x;
  void *v9;
  _UIKeyboardAsyncTextSelectionController *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  y = a3.y;
  x = a3.x;
  v14 = a5;
  if (!+[UIKBInputDelegateManager isAsyncTextInputEnabled](UIKBInputDelegateManager, "isAsyncTextInputEnabled"))
  {
    v10 = self;
LABEL_6:
    -[_UIKeyboardTextSelectionController inputDelegate](v10, "inputDelegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v13;
    if (a4)
    {
      objc_msgSend(v13, "changeSelectionWithGestureAt:withGesture:withState:", 1, 3, x, y);
      goto LABEL_9;
    }
LABEL_8:
    objc_msgSend(v12, "selectPositionAtPoint:completionHandler:", v14, x, y);
    goto LABEL_9;
  }
  -[_UIKeyboardAsyncTextSelectionController webInputDelegate](self, "webInputDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = self;
  if (!v9)
    goto LABEL_6;
  -[_UIKeyboardAsyncTextSelectionController webInputDelegate](self, "webInputDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!a4)
    goto LABEL_8;
  objc_msgSend(v11, "updateCurrentSelectionTo:fromGesture:inState:", 1, 3, x, y);
LABEL_9:

}

- (void)selectPositionAtBoundary:(int64_t)a3 inDirection:(int64_t)a4 relativeToSelection:(id)a5 executionContext:(id)a6
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  _UIKeyboardAsyncTextSelectionController *v16;
  _QWORD v17[4];
  id v18;
  _UIKeyboardAsyncTextSelectionController *v19;
  _QWORD v20[4];
  id v21;
  _UIKeyboardAsyncTextSelectionController *v22;

  v9 = a6;
  if (!+[UIKBInputDelegateManager isAsyncTextInputEnabled](UIKBInputDelegateManager, "isAsyncTextInputEnabled"))
  {
    -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __117___UIKeyboardAsyncTextSelectionController_selectPositionAtBoundary_inDirection_relativeToSelection_executionContext___block_invoke_5;
    v14[3] = &unk_1E16B1B50;
    v15 = v9;
    v16 = self;
    objc_msgSend(v12, "moveSelectionAtBoundary:inDirection:completionHandler:", a3, a4, v14);
    v13 = v15;
LABEL_6:

    goto LABEL_7;
  }
  -[_UIKeyboardAsyncTextSelectionController webInputDelegate](self, "webInputDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __117___UIKeyboardAsyncTextSelectionController_selectPositionAtBoundary_inDirection_relativeToSelection_executionContext___block_invoke_3;
    v17[3] = &unk_1E16B1B50;
    v18 = v9;
    v19 = self;
    objc_msgSend(v12, "moveSelectionAtBoundary:inDirection:completionHandler:", a3, a4, v17);
    v13 = v18;
    goto LABEL_6;
  }
  -[_UIKeyboardAsyncTextSelectionController webInputDelegate](self, "webInputDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __117___UIKeyboardAsyncTextSelectionController_selectPositionAtBoundary_inDirection_relativeToSelection_executionContext___block_invoke;
  v20[3] = &unk_1E16B1B50;
  v21 = v9;
  v22 = self;
  objc_msgSend(v11, "moveSelectionAtBoundary:inStorageDirection:completionHandler:", a3, a4, v20);

  v12 = v21;
LABEL_7:

}

- (void)setRangedSelectionShouldShowGrabbers:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;

  v3 = a3;
  -[_UIKeyboardTextSelectionController interactionAssistant](self, "interactionAssistant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "selectedTextRange");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "selectedTextRange");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEmpty");

      if ((v11 & 1) == 0)
      {
        -[_UIKeyboardTextSelectionController interactionAssistant](self, "interactionAssistant");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setSelectionDisplayVisible:", 1);

        -[_UIKeyboardTextSelectionController interactionAssistant](self, "interactionAssistant");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "activateSelection");

        -[_UIKeyboardTextSelectionController interactionAssistant](self, "interactionAssistant");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        v16 = 0;
LABEL_9:
        objc_msgSend(v14, "setShouldDelayActivatingSelectionView:", v16);

        -[_UIKeyboardTextSelectionController interactionAssistant](self, "interactionAssistant");
        v18 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setSelectionHighlightMode:", !v3);
        goto LABEL_11;
      }
    }
    else
    {

    }
    -[_UIKeyboardTextSelectionController interactionAssistant](self, "interactionAssistant");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v16 = 1;
    goto LABEL_9;
  }
  -[_UIKeyboardTextSelectionController selectionInteractionAssistant](self, "selectionInteractionAssistant");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v3)
    objc_msgSend(v17, "configureForSelectionMode");
  else
    objc_msgSend(v17, "configureForHighlightMode");
LABEL_11:

}

- (void)showSelectionCommands
{
  void *v3;
  void *v4;
  char v5;
  BOOL v6;
  void *v7;

  -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedTextRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEmpty");

  if ((v5 & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    -[_UIKeyboardTextSelectionController interactionAssistant](self, "interactionAssistant");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "showSelectionCommands");

    v6 = 0;
  }
  self->_shouldDelayShowSelectionCommands = v6;
}

- (void)showSelectionView
{
  id v2;

  -[_UIKeyboardTextSelectionController interactionAssistant](self, "interactionAssistant");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "shouldDelayActivatingSelectionView"))
  {
    objc_msgSend(v2, "setSelectionDisplayVisible:", 1);
    objc_msgSend(v2, "activateSelection");
    objc_msgSend(v2, "setShouldDelayActivatingSelectionView:", 0);
  }

}

- (void)selectTextWithGranularity:(int64_t)a3 atPoint:(CGPoint)a4 executionContext:(id)a5
{
  double y;
  double x;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD aBlock[4];
  id v16;
  _UIKeyboardAsyncTextSelectionController *v17;
  int64_t v18;

  y = a4.y;
  x = a4.x;
  v9 = a5;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __94___UIKeyboardAsyncTextSelectionController_selectTextWithGranularity_atPoint_executionContext___block_invoke;
  aBlock[3] = &unk_1E16B1C28;
  v10 = v9;
  v16 = v10;
  v17 = self;
  v18 = a3;
  v11 = _Block_copy(aBlock);
  if (!+[UIKBInputDelegateManager isAsyncTextInputEnabled](UIKBInputDelegateManager, "isAsyncTextInputEnabled")|| (-[_UIKeyboardAsyncTextSelectionController webInputDelegate](self, "webInputDelegate"), v12 = (void *)objc_claimAutoreleasedReturnValue(), v12, !v12))
  {
    -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v14;
LABEL_6:
    objc_msgSend(v14, "selectTextWithGranularity:atPoint:completionHandler:", a3, v11, x, y);
    goto LABEL_7;
  }
  -[_UIKeyboardAsyncTextSelectionController webInputDelegate](self, "webInputDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
      goto LABEL_7;
    v14 = v13;
    goto LABEL_6;
  }
  objc_msgSend(v13, "selectTextInGranularity:atPoint:completionHandler:", a3, v11, x, y);
LABEL_7:

}

- (void)selectTextWithGranularity:(int64_t)a3 atPoint:(CGPoint)a4 completionHandler:(id)a5
{
  double y;
  double x;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  id v22;
  _UIKeyboardAsyncTextSelectionController *v23;
  id v24;
  int64_t v25;

  y = a4.y;
  x = a4.x;
  v9 = a5;
  if (a3 == 1)
  {
    -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "selectedTextRange");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __95___UIKeyboardAsyncTextSelectionController_selectTextWithGranularity_atPoint_completionHandler___block_invoke;
  v21 = &unk_1E16D85F8;
  v25 = a3;
  v12 = v11;
  v22 = v12;
  v23 = self;
  v13 = v9;
  v24 = v13;
  v14 = _Block_copy(&v18);
  if (!+[UIKBInputDelegateManager isAsyncTextInputEnabled](UIKBInputDelegateManager, "isAsyncTextInputEnabled", v18, v19, v20, v21)|| (-[_UIKeyboardAsyncTextSelectionController webInputDelegate](self, "webInputDelegate"), v15 = (void *)objc_claimAutoreleasedReturnValue(), v15, !v15))
  {
    -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v17;
LABEL_9:
    objc_msgSend(v17, "selectTextWithGranularity:atPoint:completionHandler:", a3, v14, x, y);
    goto LABEL_10;
  }
  -[_UIKeyboardAsyncTextSelectionController webInputDelegate](self, "webInputDelegate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
      goto LABEL_10;
    v17 = v16;
    goto LABEL_9;
  }
  objc_msgSend(v16, "selectTextInGranularity:atPoint:completionHandler:", a3, v14, x, y);
LABEL_10:

}

- (void)beginSelectionWithBaseAtSelectionBoundaryInDirection:(int64_t)a3 initialExtentPoint:(CGPoint)a4 executionContext:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, char);
  void *v14;
  id v15;
  _UIKeyboardAsyncTextSelectionController *v16;

  v7 = a5;
  -[_UIKeyboardTextSelectionController beginSelection](self, "beginSelection");
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __132___UIKeyboardAsyncTextSelectionController_beginSelectionWithBaseAtSelectionBoundaryInDirection_initialExtentPoint_executionContext___block_invoke;
  v14 = &unk_1E16B2218;
  v8 = v7;
  v15 = v8;
  v16 = self;
  v9 = _Block_copy(&v11);
  +[UIKBInputDelegateManager isAsyncTextInputEnabled](UIKBInputDelegateManager, "isAsyncTextInputEnabled", v11, v12, v13, v14);
  -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "beginSelectionInDirection:completionHandler:", a3, v9);

}

- (void)updateSelectionWithExtentPoint:(CGPoint)a3 executionContext:(id)a4
{
  double y;
  double x;
  id v7;
  id v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, char);
  void *v17;
  id v18;
  _UIKeyboardAsyncTextSelectionController *v19;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __91___UIKeyboardAsyncTextSelectionController_updateSelectionWithExtentPoint_executionContext___block_invoke;
  v17 = &unk_1E16B2218;
  v8 = v7;
  v18 = v8;
  v19 = self;
  v9 = _Block_copy(&v14);
  v10 = +[UIKBInputDelegateManager isAsyncTextInputEnabled](UIKBInputDelegateManager, "isAsyncTextInputEnabled", v14, v15, v16, v17);
  -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10
    && (v13 = objc_msgSend(v11, "conformsToProtocolCached:", &unk_1EE0CE288),
        v12,
        -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13))
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v12, "updateSelectionWithExtentPoint:boundary:completionHandler:", 0, v9, x, y);
    }
    else if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v12, "updateSelectionWithExtentPoint:withBoundary:completionHandler:", 0, v9, x, y);
    }
  }
  else
  {
    objc_msgSend(v12, "updateSelectionWithExtentPoint:completionHandler:", v9, x, y);
  }

}

- (void)updateSelectionWithExtentPoint:(CGPoint)a3 withBoundary:(int64_t)a4 executionContext:(id)a5
{
  double y;
  double x;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, char);
  void *v23;
  id v24;
  _UIKeyboardAsyncTextSelectionController *v25;

  y = a3.y;
  x = a3.x;
  v9 = a5;
  v20 = MEMORY[0x1E0C809B0];
  v21 = 3221225472;
  v22 = __104___UIKeyboardAsyncTextSelectionController_updateSelectionWithExtentPoint_withBoundary_executionContext___block_invoke;
  v23 = &unk_1E16B2218;
  v10 = v9;
  v24 = v10;
  v25 = self;
  v11 = _Block_copy(&v20);
  if (!+[UIKBInputDelegateManager isAsyncTextInputEnabled](UIKBInputDelegateManager, "isAsyncTextInputEnabled", v20, v21, v22, v23))
  {
    -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIKeyboardTextSelectionController interactionAssistant](self, "interactionAssistant");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "startAutoscroll:", x, y);

LABEL_6:
    v18 = v16;
LABEL_7:
    objc_msgSend(v18, "updateSelectionWithExtentPoint:withBoundary:completionHandler:", a4, v11, x, y);
    goto LABEL_8;
  }
  -[_UIKeyboardTextSelectionController interactionAssistant](self, "interactionAssistant");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "startAutoscroll:", x, y);

  -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "conformsToProtocol:", &unk_1EE0CE288);

  -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (!v14)
  {
    v19 = objc_msgSend(v15, "conformsToProtocol:", &unk_1EE0CE228);

    if (!v19)
      goto LABEL_9;
    -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v18;
    goto LABEL_7;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
      goto LABEL_8;
    goto LABEL_6;
  }
  objc_msgSend(v16, "updateSelectionWithExtentPoint:boundary:completionHandler:", a4, v11, x, y);
LABEL_8:

LABEL_9:
}

- (void)beginFloatingCursorAtPoint:(CGPoint)a3
{
  double y;
  double x;
  id v5;

  y = a3.y;
  x = a3.x;
  -[_UIKeyboardTextSelectionController interactionAssistant](self, "interactionAssistant");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginFloatingCursorAtPoint:", x, y);

}

- (void)updateFloatingCursorAtPoint:(CGPoint)a3
{
  double y;
  double x;
  id v5;

  y = a3.y;
  x = a3.x;
  -[_UIKeyboardTextSelectionController interactionAssistant](self, "interactionAssistant");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateFloatingCursorAtPoint:", x, y);

}

- (void)endFloatingCursor
{
  id v2;

  -[_UIKeyboardTextSelectionController interactionAssistant](self, "interactionAssistant");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endFloatingCursor");

}

- (id)webInputDelegate
{
  void *v3;
  int v4;
  void *v5;

  -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "conformsToProtocolCached:", &unk_1EE0CE288);

  if (v4)
  {
    -[_UIKeyboardTextSelectionController inputDelegate](self, "inputDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

@end
