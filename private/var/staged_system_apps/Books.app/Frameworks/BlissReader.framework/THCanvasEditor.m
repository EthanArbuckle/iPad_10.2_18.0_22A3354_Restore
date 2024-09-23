@implementation THCanvasEditor

- (id)drawables
{
  return +[NSArray array](NSArray, "array");
}

- (BOOL)wantsKeyboard
{
  return 0;
}

- (int)canPerformEditorAction:(SEL)a3 withSender:(id)a4
{
  return "pageDown:" == a3
      || "pageUp:" == a3
      || "moveForward:" == a3
      || "moveRight:" == a3
      || "moveBackward:" == a3
      || "moveLeft:" == a3
      || "moveUp:" == a3
      || "moveDown:" == a3
      || "scrollPageUp:" == a3
      || "scrollPageDown:" == a3
      || "scrollToBeginningOfDocument:" == a3
      || "scrollToEndOfDocument:" == a3
      || "moveRightAndModifySelection:" == a3
      || "moveLeftAndModifySelection:" == a3
      || "moveWordRight:" == a3
      || "moveWordLeft:" == a3
      || "insertText:replacementRange:" == a3
      || "moveToLeftEndOfLine:" == a3
      || "moveToRightEndOfLine:" == a3;
}

- (void)pageDown:(id)a3
{
  -[THCanvasEditor p_navigateByBookDirection:bookGranularity:](self, "p_navigateByBookDirection:bookGranularity:", 1, 1);
}

- (void)pageUp:(id)a3
{
  -[THCanvasEditor p_navigateByBookDirection:bookGranularity:](self, "p_navigateByBookDirection:bookGranularity:", 2, 1);
}

- (void)moveForward:(id)a3
{
  -[THCanvasEditor p_navigateByBookDirection:bookGranularity:](self, "p_navigateByBookDirection:bookGranularity:", 1, 1);
}

- (void)moveBackward:(id)a3
{
  -[THCanvasEditor p_navigateByBookDirection:bookGranularity:](self, "p_navigateByBookDirection:bookGranularity:", 2, 1);
}

- (void)moveRight:(id)a3
{
  -[THCanvasEditor p_navigateByBookDirection:bookGranularity:](self, "p_navigateByBookDirection:bookGranularity:", 1, 1);
}

- (void)moveLeft:(id)a3
{
  -[THCanvasEditor p_navigateByBookDirection:bookGranularity:](self, "p_navigateByBookDirection:bookGranularity:", 2, 1);
}

- (void)moveUp:(id)a3
{
  -[THCanvasEditor p_navigateByBookDirection:bookGranularity:](self, "p_navigateByBookDirection:bookGranularity:", 2, 1);
}

- (void)moveDown:(id)a3
{
  -[THCanvasEditor p_navigateByBookDirection:bookGranularity:](self, "p_navigateByBookDirection:bookGranularity:", 1, 1);
}

- (void)scrollPageUp:(id)a3
{
  -[THCanvasEditor p_navigateByBookDirection:bookGranularity:](self, "p_navigateByBookDirection:bookGranularity:", 2, 1);
}

- (void)scrollPageDown:(id)a3
{
  -[THCanvasEditor p_navigateByBookDirection:bookGranularity:](self, "p_navigateByBookDirection:bookGranularity:", 1, 1);
}

- (void)scrollToBeginningOfDocument:(id)a3
{
  -[THCanvasEditor p_navigateByBookDirection:bookGranularity:](self, "p_navigateByBookDirection:bookGranularity:", 2, 2);
}

- (void)scrollToEndOfDocument:(id)a3
{
  -[THCanvasEditor p_navigateByBookDirection:bookGranularity:](self, "p_navigateByBookDirection:bookGranularity:", 1, 2);
}

- (void)moveRightAndModifySelection:(id)a3
{
  -[THCanvasEditor p_navigateByBookDirection:bookGranularity:](self, "p_navigateByBookDirection:bookGranularity:", 1, 3);
}

- (void)moveLeftAndModifySelection:(id)a3
{
  -[THCanvasEditor p_navigateByBookDirection:bookGranularity:](self, "p_navigateByBookDirection:bookGranularity:", 2, 3);
}

- (void)moveToLeftEndOfLine:(id)a3
{
  -[THCanvasEditor p_navigateByHistoryDirection:](self, "p_navigateByHistoryDirection:", 2);
}

- (void)moveToRightEndOfLine:(id)a3
{
  -[THCanvasEditor p_navigateByHistoryDirection:](self, "p_navigateByHistoryDirection:", 1);
}

- (void)insertText:(id)a3 replacementRange:(_NSRange)a4
{
  if (objc_msgSend(a3, "length") == (char *)&dword_0 + 1
    && objc_msgSend(a3, "characterAtIndex:", 0) == 32)
  {
    -[THCanvasEditor p_navigateByBookDirection:bookGranularity:](self, "p_navigateByBookDirection:bookGranularity:", 1, 1);
  }
}

- (BOOL)p_canNavigateByBookDirection:(int)a3 bookGranularity:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  double v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  v7 = objc_opt_class(THInteractiveCanvasController);
  *(_QWORD *)&v8 = TSUDynamicCast(v7, -[THCanvasEditor interactiveCanvasController](self, "interactiveCanvasController")).n128_u64[0];
  v10 = v9;
  v11 = objc_msgSend(v9, "delegate", v8);
  if ((objc_opt_respondsToSelector(v11, "documentNavigatorForInteractiveCanvasController:") & 1) != 0
    && (v12 = objc_msgSend(v11, "documentNavigatorForInteractiveCanvasController:", v10)) != 0)
  {
    return objc_msgSend(v12, "canNavigateByBookDirection:bookGranularity:", v5, v4);
  }
  else
  {
    return 0;
  }
}

- (void)p_navigateByBookDirection:(int)a3 bookGranularity:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  double v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  if (-[THCanvasEditor p_canNavigateByBookDirection:bookGranularity:](self, "p_canNavigateByBookDirection:bookGranularity:"))
  {
    v7 = objc_opt_class(THInteractiveCanvasController);
    *(_QWORD *)&v8 = TSUDynamicCast(v7, -[THCanvasEditor interactiveCanvasController](self, "interactiveCanvasController")).n128_u64[0];
    v10 = v9;
    v11 = objc_msgSend(v9, "delegate", v8);
    if ((objc_opt_respondsToSelector(v11, "documentNavigatorForInteractiveCanvasController:") & 1) != 0)
    {
      v12 = objc_msgSend(v11, "documentNavigatorForInteractiveCanvasController:", v10);
      if (v12)
        objc_msgSend(v12, "navigateByBookDirection:bookGranularity:", v5, v4);
    }
  }
}

- (BOOL)p_canNavigateByHistoryDirection:(int)a3
{
  uint64_t v3;
  uint64_t v5;
  double v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v3 = *(_QWORD *)&a3;
  v5 = objc_opt_class(THInteractiveCanvasController);
  *(_QWORD *)&v6 = TSUDynamicCast(v5, -[THCanvasEditor interactiveCanvasController](self, "interactiveCanvasController")).n128_u64[0];
  v8 = v7;
  v9 = objc_msgSend(v7, "delegate", v6);
  if ((objc_opt_respondsToSelector(v9, "documentNavigatorForInteractiveCanvasController:") & 1) != 0
    && (v10 = objc_msgSend(v9, "documentNavigatorForInteractiveCanvasController:", v8)) != 0)
  {
    return objc_msgSend(v10, "canNavigateByHistoryDirection:", v3);
  }
  else
  {
    return 0;
  }
}

- (void)p_navigateByHistoryDirection:(int)a3
{
  uint64_t v3;
  uint64_t v5;
  double v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v3 = *(_QWORD *)&a3;
  if (-[THCanvasEditor p_canNavigateByHistoryDirection:](self, "p_canNavigateByHistoryDirection:"))
  {
    v5 = objc_opt_class(THInteractiveCanvasController);
    *(_QWORD *)&v6 = TSUDynamicCast(v5, -[THCanvasEditor interactiveCanvasController](self, "interactiveCanvasController")).n128_u64[0];
    v8 = v7;
    v9 = objc_msgSend(v7, "delegate", v6);
    if ((objc_opt_respondsToSelector(v9, "documentNavigatorForInteractiveCanvasController:") & 1) != 0)
    {
      v10 = objc_msgSend(v9, "documentNavigatorForInteractiveCanvasController:", v8);
      if (v10)
        objc_msgSend(v10, "navigateByHistoryDirection:", v3);
    }
  }
}

@end
