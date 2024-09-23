@implementation UITextSelection

- (BOOL)hasEditableSelection
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  void *v8;
  void *v9;
  char v10;

  -[UITextSelection selectedRange](self, "selectedRange");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    -[UITextSelection document](self, "document");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEditable");

    if ((v6 & 1) != 0)
      return 1;
  }
  -[UITextSelection _domRange](self, "_domRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startPosition");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEditable");

  return v10;
}

- (UITextRange)selectedRange
{
  return self->_selectedRange;
}

- (void)selectionChanged
{
  void *v3;
  id v4;

  -[UITextSelection document](self, "document");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedTextRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextSelection setSelectedRange:](self, "setSelectedRange:", v3);

}

- (UITextInputPrivate)document
{
  return (UITextInputPrivate *)objc_loadWeakRetained((id *)&self->_document);
}

- (void)setSelectedRange:(id)a3
{
  objc_storeStrong((id *)&self->_selectedRange, a3);
}

- (UITextSelection)initWithDocument:(id)a3
{
  id v4;
  UITextSelection *v5;
  UITextSelection *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)UITextSelection;
  v5 = -[UITextSelection init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_document, v4);
    v6->_isCommitting = 0;
    -[UITextSelection selectionChanged](v6, "selectionChanged");
  }

  return v6;
}

- (DOMRange)_domRange
{
  void *v3;
  char isKindOfClass;
  void *v5;
  void *v6;

  -[UITextSelection selectedRange](self, "selectedRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[UITextSelection selectedRange](self, "selectedRange");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "domRange");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return (DOMRange *)v6;
}

- (void)dealloc
{
  objc_super v3;

  -[UITextSelection invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)UITextSelection;
  -[UITextSelection dealloc](&v3, sel_dealloc);
}

- (void)invalidate
{
  -[UITextSelection setBase:](self, "setBase:", 0);
  -[UITextSelection setInitialExtent:](self, "setInitialExtent:", 0);
  -[UITextSelection setSelectedRange:](self, "setSelectedRange:", 0);
  objc_storeWeak((id *)&self->_document, 0);
}

- (void)setInitialExtent:(id)a3
{
  objc_storeStrong((id *)&self->_initialExtent, a3);
}

- (void)setBase:(id)a3
{
  objc_storeStrong((id *)&self->_base, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialExtent, 0);
  objc_storeStrong((id *)&self->_base, 0);
  objc_storeStrong((id *)&self->_selectedRange, 0);
  objc_destroyWeak((id *)&self->_document);
}

- (BOOL)isValid
{
  id WeakRetained;
  BOOL v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_document);
  v3 = WeakRetained != 0;

  return v3;
}

- (void)commit
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  UITextSelection *v9;

  v9 = self;
  -[UITextSelection document](v9, "document");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "interactionAssistant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v9->_isCommitting = 1;
  -[UITextSelection document](v9, "document");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "selectedTextRange");
  v5 = objc_claimAutoreleasedReturnValue();
  -[UITextSelection selectedRange](v9, "selectedRange");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (!(v5 | v6) || v5 && v6 && objc_msgSend((id)v5, "isEqual:", v6))
  {
    objc_msgSend(v4, "interactionAssistant");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "updateDisplayedSelection");
  }
  else
  {
    objc_msgSend(v4, "setSelectedTextRange:", v7);
    objc_msgSend(v4, "interactionAssistant");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNeedsSelectionDisplayUpdate");
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "setSelectionGranularity:", -[UITextSelection granularity](v9, "granularity"));
  v9->_isCommitting = 0;

}

- (BOOL)willSelectionChange
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;

  self->_isCommitting = 1;
  -[UITextSelection document](self, "document");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectedTextRange");
  v4 = objc_claimAutoreleasedReturnValue();
  -[UITextSelection selectedRange](self, "selectedRange");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4 | v5)
  {
    LOBYTE(v7) = 1;
    if (v4 && v5)
      v7 = objc_msgSend((id)v4, "isEqual:", v5) ^ 1;
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  self->_isCommitting = 0;

  return v7;
}

- (id)selectionRects
{
  void *v3;
  void *v4;
  void *v5;

  -[UITextSelection document](self, "document");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextSelection selectedRange](self, "selectedRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "selectionRectsForRange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)underlineRectsForRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[UITextSelection document](self, "document");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "selectionRectsForRange:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CGRect)caretRect
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

  -[UITextSelection selectedRange](self, "selectedRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UITextSelection document](self, "document");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextSelection selectedRange](self, "selectedRange");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "start");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "caretRectForPosition:", v6);
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

- (CGRect)caretRectAtEndOfDocument
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  -[UITextSelection document](self, "document");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endOfDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "caretRectForPosition:", v3);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)caretRectAtBeginOfDocument
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  -[UITextSelection document](self, "document");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "beginningOfDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "caretRectForPosition:", v3);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (id)wordContainingCaretSelection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[UITextSelection document](self, "document");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextSelection selectedRange](self, "selectedRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "start");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_rangeOfEnclosingWord:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v3, "textInRange:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)selectedText
{
  void *v3;
  void *v4;
  void *v5;

  -[UITextSelection document](self, "document");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextSelection selectedRange](self, "selectedRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textInRange:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CGRect)closestCaretRectForPoint:(CGPoint)a3 inSelection:(BOOL)a4
{
  _BOOL4 v4;
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect result;

  v4 = a4;
  y = a3.y;
  x = a3.x;
  -[UITextSelection document](self, "document");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (!v4)
  {
    objc_msgSend(v8, "closestPositionToPoint:", x, y);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
      goto LABEL_3;
LABEL_5:
    v13 = *MEMORY[0x1E0C9D628];
    v15 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v17 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v19 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    goto LABEL_6;
  }
  -[UITextSelection selectedRange](self, "selectedRange");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "closestPositionToPoint:withinRange:", v10, x, y);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v9, "caretRectForPosition:", v11);
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
LABEL_6:

  v20 = v13;
  v21 = v15;
  v22 = v17;
  v23 = v19;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (unint64_t)offsetInMarkedText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  -[UITextSelection selectedRange](self, "selectedRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "start");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[UITextSelection document](self, "document");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "markedTextRange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "start");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v5, "offsetFromPosition:toPosition:", v7, v4);
  return v8;
}

- (void)setSelectionWithPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  id v8;

  y = a3.y;
  x = a3.x;
  -[UITextSelection document](self, "document");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "closestPositionToPoint:", x, y);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textRangeFromPosition:toPosition:", v6, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextSelection setSelectedRange:](self, "setSelectedRange:", v7);

}

- (void)extendSelectionToPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;

  y = a3.y;
  x = a3.x;
  -[UITextSelection document](self, "document");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "closestPositionToPoint:", x, y);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextSelection selectedRange](self, "selectedRange");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "start");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v20, "comparePosition:toPosition:", v6, v8);

  -[UITextSelection selectedRange](self, "selectedRange");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "end");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v20, "comparePosition:toPosition:", v11, v6);

  -[UITextSelection selectedRange](self, "selectedRange");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 == -1)
  {
    -[UITextSelection selectedRange](self, "selectedRange");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "end");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v20;
    v17 = v6;
    v18 = v15;
    goto LABEL_5;
  }
  if (v12 == -1)
  {
    -[UITextSelection selectedRange](self, "selectedRange");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "start");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v20;
    v17 = v15;
    v18 = v6;
LABEL_5:
    objc_msgSend(v16, "textRangeFromPosition:toPosition:", v17, v18);
    v19 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v19;
  }
  -[UITextSelection setSelectedRange:](self, "setSelectedRange:", v13);

}

- (void)setHybridSelectionWithPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double MidX;
  void *v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  CGRect v37;
  CGRect v38;

  y = a3.y;
  x = a3.x;
  -[UITextSelection document](self, "document");
  v36 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "closestPositionToPoint:", x, y);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "_rangeOfTextUnit:enclosingPosition:", 1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "start");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "caretRectForPosition:", v9);
    MidX = CGRectGetMidX(v37);

    objc_msgSend(v8, "end");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "caretRectForPosition:", v11);
    v12 = CGRectGetMidX(v38);

    +[_UITextSelectionSettings sharedInstance](_UITextSelectionSettings, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "pinkWidthFactor");
    v15 = v14;

    +[_UITextSelectionSettings sharedInstance](_UITextSelectionSettings, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "minPinkWidth");
    v18 = v17;

    +[_UITextSelectionSettings sharedInstance](_UITextSelectionSettings, "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "maxPinkWidth");
    v21 = v20;

    v23 = vabdd_f64(v12, MidX) * v15;
    if (v23 < v18)
      v23 = v18;
    if (v23 >= v21)
      v23 = v21;
    if (x < MidX || (v22 = x - MidX, x - MidX < v23))
    {
      +[_UITextSelectionSettings sharedInstance](_UITextSelectionSettings, "sharedInstance", v23, v22);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "shouldPreferEndOfWord");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "BOOLValue");

      if (v29
        && (objc_msgSend(v8, "start"),
            v30 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v36, "_positionFromPosition:pastTextUnit:inDirection:", v30, 1, 1),
            v31 = (void *)objc_claimAutoreleasedReturnValue(),
            v30,
            v31))
      {
        v32 = v31;
        v33 = v32;
      }
      else
      {
        objc_msgSend(v8, "start");
        v32 = (id)objc_claimAutoreleasedReturnValue();
        v33 = 0;
      }
      objc_msgSend(v36, "textRangeFromPosition:toPosition:", v32, v32);
      v24 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (v12 >= x && v12 - x >= v23)
      {
        v24 = v8;
        v25 = 1;
LABEL_19:
        -[UITextSelection setSelectedRange:](self, "setSelectedRange:", v24);
        -[UITextSelection setGranularity:](self, "setGranularity:", v25);

        goto LABEL_20;
      }
      objc_msgSend(v8, "end");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "end");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "textRangeFromPosition:toPosition:", v34, v35);
      v24 = (id)objc_claimAutoreleasedReturnValue();

    }
    v25 = 0;
    goto LABEL_19;
  }
  objc_msgSend(v36, "textRangeFromPosition:toPosition:", v6, v6);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextSelection setSelectedRange:](self, "setSelectedRange:", v26);

  -[UITextSelection setGranularity:](self, "setGranularity:", 0);
LABEL_20:

}

- (void)selectAll
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[UITextSelection document](self, "document");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "beginningOfDocument");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endOfDocument");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textRangeFromPosition:toPosition:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextSelection setSelectedRange:](self, "setSelectedRange:", v5);

}

- (void)clearSelection
{
  -[UITextSelection setSelectedRange:](self, "setSelectedRange:", 0);
}

- (void)collapseSelection
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[UITextSelection selectedRange](self, "selectedRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v7 = v3;
    objc_msgSend(v3, "end");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextSelection document](self, "document");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "textRangeFromPosition:toPosition:", v4, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[UITextSelection setSelectedRange:](self, "setSelectedRange:", v6);
    v3 = v7;
  }

}

- (void)aggressivelyExpandSelectionToWordContainingCaretSelection
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;

  -[UITextSelection document](self, "document");
  v40 = (id)objc_claimAutoreleasedReturnValue();
  -[UITextSelection selectedRange](self, "selectedRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "start");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "_rangeOfEnclosingWord:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v40, "textInRange:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "_containsEmoji");

    if (v7)
    {
      -[UITextSelection selectedRange](self, "selectedRange");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "start");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "_rangeOfTextUnit:enclosingPosition:", 0, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v40, "textInRange:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v9) = objc_msgSend(v11, "_containsEmoji");

      if ((_DWORD)v9)
      {
        v12 = v10;

        v5 = v12;
      }

    }
    -[UITextSelection setSelectedRange:](self, "setSelectedRange:", v5);
  }
  else
  {
    -[UITextSelection selectedRange](self, "selectedRange");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "start");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    v14 = 0;
    while (1)
    {
      v15 = v14;
      v14 = v5;

      objc_msgSend(v40, "tokenizer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "positionFromPosition:toBoundary:inDirection:", v14, 1, 1);
      v5 = (id)objc_claimAutoreleasedReturnValue();

      if (!v5)
        break;
      if (objc_msgSend(v40, "comparePosition:toPosition:", v5, v14))
      {
        objc_msgSend(v40, "tokenizer");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isPosition:atBoundary:inDirection:", v5, 1, 1);

        if (!v18)
          continue;
      }
      -[UITextSelection selectedRange](self, "selectedRange");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "start");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
        goto LABEL_22;
      objc_msgSend(v40, "tokenizer");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextSelection selectedRange](self, "selectedRange");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "start");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "positionFromPosition:toBoundary:inDirection:", v23, 3, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24 && objc_msgSend(v40, "comparePosition:toPosition:", v5, v24) == -1)
      {
        v25 = v24;

        v5 = v25;
      }
      goto LABEL_21;
    }
    objc_msgSend(v40, "endOfDocument");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextSelection selectedRange](self, "selectedRange");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "start");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v40, "comparePosition:toPosition:", v26, v28);

    if (!v29)
    {
      objc_msgSend(v40, "tokenizer");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextSelection selectedRange](self, "selectedRange");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "start");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "positionFromPosition:toBoundary:inDirection:", v35, 4, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        objc_msgSend(v40, "tokenizer");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "positionFromPosition:toBoundary:inDirection:", v24, 1, 1);
        v5 = (id)objc_claimAutoreleasedReturnValue();

        if (!v5)
          v5 = v24;
LABEL_21:

        goto LABEL_22;
      }
    }
    objc_msgSend(v40, "tokenizer");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextSelection selectedRange](self, "selectedRange");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "start");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "positionFromPosition:toBoundary:inDirection:", v32, 1, 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (!v5)
      goto LABEL_23;
LABEL_22:
    -[UITextSelection selectedRange](self, "selectedRange");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "start");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "textRangeFromPosition:toPosition:", v5, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    -[UITextSelection setSelectedRange:](self, "setSelectedRange:", v39);
LABEL_23:

  }
}

- (void)aggressivelyExpandSelectionToSmartSelectionContainingCaretSelection
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  -[UITextSelection document](self, "document");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[UITextSelection selectedRange](self, "selectedRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_rangeOfSmartSelectionIncludingRange:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3 == (void *)v4)
  {
    -[UITextSelection aggressivelyExpandSelectionToWordContainingCaretSelection](self, "aggressivelyExpandSelectionToWordContainingCaretSelection");
  }
  else if (v4)
  {
    -[UITextSelection setSelectedRange:](self, "setSelectedRange:", v4);
  }

}

- (void)alterSelection:(CGPoint)a3 granularity:(int64_t)a4
{
  -[UITextSelection setSelectionWithPoint:](self, "setSelectionWithPoint:", a3.x, a3.y);
  -[UITextSelection alterSelectionGranularity:](self, "alterSelectionGranularity:", a4);
}

- (void)alterSelectionGranularity:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  switch(a3)
  {
    case 1:
      -[UITextSelection selectedRange](self, "selectedRange");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        if (-[UITextSelection hasEditableSelection](self, "hasEditableSelection"))
          -[UITextSelection aggressivelyExpandSelectionToSmartSelectionContainingCaretSelection](self, "aggressivelyExpandSelectionToSmartSelectionContainingCaretSelection");
        else
          -[UITextSelection aggressivelyExpandSelectionToWordContainingCaretSelection](self, "aggressivelyExpandSelectionToWordContainingCaretSelection");
        break;
      }
      return;
    case 2:
      -[UITextSelection document](self, "document");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextSelection selectedRange](self, "selectedRange");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "start");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_rangeOfSentenceEnclosingPosition:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 3:
    case 4:
      -[UITextSelection document](self, "document");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextSelection selectedRange](self, "selectedRange");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "start");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_rangeOfParagraphEnclosingPosition:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v10 = (void *)v8;

      goto LABEL_9;
    case 5:
      -[UITextSelection document](self, "document");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_fullRange");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

      if (v10)
        -[UITextSelection setSelectedRange:](self, "setSelectedRange:", v10);

      break;
    default:
      break;
  }
  -[UITextSelection setGranularity:](self, "setGranularity:", a3);
}

- (void)increaseSelectionGranularity
{
  int64_t v3;

  if (-[UITextSelection granularity](self, "granularity") <= 2)
    v3 = -[UITextSelection granularity](self, "granularity") + 1;
  else
    v3 = 5;
  -[UITextSelection alterSelectionGranularity:](self, "alterSelectionGranularity:", v3);
}

- (void)moveCaretToBoundaryOfWhitespaceOrLine
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[UITextSelection selectedRange](self, "selectedRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "start");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[UITextSelection document](self, "document");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_findPleasingWordBoundaryFromPosition:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textRangeFromPosition:toPosition:", v5, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextSelection setSelectedRange:](self, "setSelectedRange:", v6);

}

- (BOOL)pointAtStartOfLine:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  y = a3.y;
  x = a3.x;
  -[UITextSelection document](self, "document");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "closestPositionToPoint:", x, y);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tokenizer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isPosition:atBoundary:inDirection:", v6, 4, 1);

  return v8;
}

- (BOOL)pointAtEndOfLine:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  y = a3.y;
  x = a3.x;
  -[UITextSelection document](self, "document");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "closestPositionToPoint:", x, y);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tokenizer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isPosition:atBoundary:inDirection:", v6, 4, 0);

  return v8;
}

- (BOOL)isRangedSelectionSpanningDocument
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  void *v9;
  void *v10;

  -[UITextSelection selectedRange](self, "selectedRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3 && objc_msgSend(v3, "_isRanged"))
  {
    -[UITextSelection document](self, "document");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "start");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "beginningOfDocument");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "comparePosition:toPosition:", v6, v7))
    {
      v8 = 0;
    }
    else
    {
      objc_msgSend(v4, "end");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "endOfDocument");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v5, "comparePosition:toPosition:", v9, v10) == 0;

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)setRangedSelectionBaseToCurrentSelection
{
  id v3;

  -[UITextSelection selectedRange](self, "selectedRange");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UITextSelection setBase:](self, "setBase:", v3);

}

- (void)setRangedSelectionBaseToCurrentSelectionStart
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[UITextSelection selectedRange](self, "selectedRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "start");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[UITextSelection document](self, "document");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "textRangeFromPosition:toPosition:", v6, v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextSelection setBase:](self, "setBase:", v5);

  }
  else
  {
    -[UITextSelection setBase:](self, "setBase:", 0);
  }

}

- (void)setRangedSelectionBaseToCurrentSelectionEnd
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[UITextSelection selectedRange](self, "selectedRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "end");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[UITextSelection document](self, "document");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "textRangeFromPosition:toPosition:", v6, v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextSelection setBase:](self, "setBase:", v5);

  }
  else
  {
    -[UITextSelection setBase:](self, "setBase:", 0);
  }

}

- (void)clearRangedSelectionInitialExtent
{
  -[UITextSelection setInitialExtent:](self, "setInitialExtent:", 0);
}

- (void)setRangedSelectionInitialExtentToCurrentSelectionStart
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[UITextSelection selectedRange](self, "selectedRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "start");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[UITextSelection document](self, "document");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "textRangeFromPosition:toPosition:", v6, v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextSelection setInitialExtent:](self, "setInitialExtent:", v5);

  }
  else
  {
    -[UITextSelection setInitialExtent:](self, "setInitialExtent:", 0);
  }

}

- (void)setRangedSelectionInitialExtentToCurrentSelectionEnd
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[UITextSelection selectedRange](self, "selectedRange");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "end");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[UITextSelection document](self, "document");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "textRangeFromPosition:toPosition:", v6, v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextSelection setInitialExtent:](self, "setInitialExtent:", v5);

  }
  else
  {
    -[UITextSelection setInitialExtent:](self, "setInitialExtent:", 0);
  }

}

- (CGPoint)clipPoint:(CGPoint)a3 inRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double MinY;
  double MinX;
  double v10;
  double v11;
  CGPoint result;
  CGRect v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  MinY = a3.y;
  MinX = a3.x;
  if (a3.x >= CGRectGetMinX(a4))
  {
    v14.origin.x = x;
    v14.origin.y = y;
    v14.size.width = width;
    v14.size.height = height;
    if (MinX >= CGRectGetMaxX(v14))
    {
      v15.origin.x = x;
      v15.origin.y = y;
      v15.size.width = width;
      v15.size.height = height;
      MinX = CGRectGetMaxX(v15) + -1.0;
    }
  }
  else
  {
    v13.origin.x = x;
    v13.origin.y = y;
    v13.size.width = width;
    v13.size.height = height;
    MinX = CGRectGetMinX(v13);
  }
  v16.origin.x = x;
  v16.origin.y = y;
  v16.size.width = width;
  v16.size.height = height;
  if (MinY >= CGRectGetMinY(v16))
  {
    v18.origin.x = x;
    v18.origin.y = y;
    v18.size.width = width;
    v18.size.height = height;
    if (MinY >= CGRectGetMaxY(v18))
    {
      v19.origin.x = x;
      v19.origin.y = y;
      v19.size.width = width;
      v19.size.height = height;
      MinY = CGRectGetMaxY(v19) + -1.0;
    }
  }
  else
  {
    v17.origin.x = x;
    v17.origin.y = y;
    v17.size.width = width;
    v17.size.height = height;
    MinY = CGRectGetMinY(v17);
  }
  v10 = MinX;
  v11 = MinY;
  result.y = v11;
  result.x = v10;
  return result;
}

- (BOOL)_allowsSelectionInversion
{
  return 1;
}

- (id)_boundedOrInvertedSelectionRangeForExtent:(id)a3 forPoint:(CGPoint)a4 fromPosition:(id)a5 inDirection:(int64_t)a6
{
  double y;
  double x;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  double v19;
  double v20;
  void *v21;
  id v22;
  void *v23;
  id v24;

  y = a4.y;
  x = a4.x;
  v11 = a3;
  v12 = a5;
  -[UITextSelection document](self, "document");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (a6)
    v14 = -1;
  else
    v14 = 1;
  if (!_os_feature_enabled_impl()
    || !-[UITextSelection _allowsSelectionInversion](self, "_allowsSelectionInversion")
    || (objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v13, "_visualSelectionRangeForExtent:forPoint:fromPosition:inDirection:", v11, v12, a6, x, y),
        (v15 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(v13, "textRangeFromPosition:toPosition:", v12, v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "comparePosition:toPosition:", v11, v12) != v14)
    {
      if (-[UITextSelection _allowsSelectionInversion](self, "_allowsSelectionInversion"))
      {
        objc_msgSend(v13, "textRangeFromPosition:toPosition:", v11, v12);
        v16 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v13, "caretRectForPosition:", v12);
        if (v20 <= v19)
          x = CGRectGetMidX(*(CGRect *)&v17);
        else
          y = CGRectGetMidY(*(CGRect *)&v17);
        objc_msgSend(v13, "closestPositionToPoint:", x, y);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21 && objc_msgSend(v13, "comparePosition:toPosition:", v21, v12) == v14)
        {
          v22 = v21;
        }
        else
        {
          objc_msgSend(v13, "tokenizer");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "positionFromPosition:toBoundary:inDirection:", v12, 0, a6);
          v22 = (id)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v13, "textRangeFromPosition:toPosition:", v12, v22);
        v16 = objc_claimAutoreleasedReturnValue();

        v15 = v22;
      }

      v15 = (void *)v16;
    }
  }
  v24 = v15;

  return v24;
}

- (BOOL)setRangedSelectionExtentPoint:(CGPoint)a3 baseIsStart:(BOOL)a4 allowFlipping:(BOOL)a5
{
  _BOOL4 v5;
  double y;
  double x;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  double v35;
  CGFloat v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  CGFloat v49;
  uint64_t v50;
  CGFloat v51;
  void *v52;
  CGRect v53;
  CGRect v54;

  v5 = a4;
  y = a3.y;
  x = a3.x;
  -[UITextSelection base](self, "base", a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[UITextSelection document](self, "document");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "textInputView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_scroller");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12 && (objc_msgSend(v12, "isScrollEnabled") & 1) == 0)
    {
      objc_msgSend(v11, "visibleBounds");
      -[UITextSelection clipPoint:inRect:](self, "clipPoint:inRect:", x, y, v14, v15, v16, v17);
      x = v18;
      y = v19;
    }
    objc_msgSend(v10, "closestPositionToPoint:", x, y);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
      goto LABEL_11;
    objc_msgSend(v10, "beginningOfDocument");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "caretRectForPosition:", v21);
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;

    objc_msgSend(v10, "endOfDocument");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "caretRectForPosition:", v30);
    v49 = v32;
    v51 = v31;
    v34 = v33;
    v36 = v35;

    v53.origin.x = v23;
    v53.origin.y = v25;
    v53.size.width = v27;
    v53.size.height = v29;
    if (y <= CGRectGetMinY(v53))
    {
      objc_msgSend(v10, "beginningOfDocument");
      v37 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v54.origin.y = v49;
      v54.origin.x = v51;
      v54.size.width = v34;
      v54.size.height = v36;
      if (y < CGRectGetMaxY(v54))
        goto LABEL_21;
      objc_msgSend(v10, "endOfDocument");
      v37 = objc_claimAutoreleasedReturnValue();
    }
    v20 = (void *)v37;
    if (v37)
    {
LABEL_11:
      -[UITextSelection base](self, "base", *(_QWORD *)&v49);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v38, "isEmpty") & 1) != 0)
      {
LABEL_14:

LABEL_15:
        -[UITextSelection base](self, "base", v50);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = v41;
        if (v5)
          objc_msgSend(v41, "start");
        else
          objc_msgSend(v41, "end");
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        -[UITextSelection _boundedOrInvertedSelectionRangeForExtent:forPoint:fromPosition:inDirection:](self, "_boundedOrInvertedSelectionRangeForExtent:forPoint:fromPosition:inDirection:", v20, v43, !v5, x, y);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        if (v44)
          -[UITextSelection setSelectedRange:](self, "setSelectedRange:", v44);

        goto LABEL_25;
      }
      -[UITextSelection base](self, "base");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "start");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "comparePosition:toPosition:", v40, v20) != -1)
      {

        goto LABEL_14;
      }
      -[UITextSelection base](self, "base");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "end");
      v52 = v11;
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v10, "comparePosition:toPosition:", v46, v20);

      v11 = v52;
      if (v50 != 1)
        goto LABEL_15;
      -[UITextSelection base](self, "base");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextSelection setSelectedRange:](self, "setSelectedRange:", v47);

LABEL_24:
      LOBYTE(v5) = 0;
LABEL_25:

      return v5;
    }
LABEL_21:
    -[UITextSelection base](self, "base", *(_QWORD *)&v49);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextSelection setSelectedRange:](self, "setSelectedRange:", v20);
    goto LABEL_24;
  }
  return v5;
}

- (BOOL)setRangedSelectionExtentPoint:(CGPoint)a3 baseIsStart:(BOOL)a4
{
  return -[UITextSelection setRangedSelectionExtentPoint:baseIsStart:allowFlipping:](self, "setRangedSelectionExtentPoint:baseIsStart:allowFlipping:", a4, 0, a3.x, a3.y);
}

- (void)setSelectionWithFirstPoint:(CGPoint)a3 secondPoint:(CGPoint)a4
{
  double y;
  double x;
  double v6;
  double v7;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  -[UITextSelection document](self, "document");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "closestPositionToPoint:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "closestPositionToPoint:", x, y);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v9 && v10)
  {
    objc_msgSend(v13, "textRangeFromPosition:toPosition:", v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextSelection setSelectedRange:](self, "setSelectedRange:", v12);

  }
  else
  {
    -[UITextSelection setSelectedRange:](self, "setSelectedRange:", 0);
  }

}

- (void)setRangedSelectionWithExtentPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;

  y = a3.y;
  x = a3.x;
  -[UITextSelection document](self, "document");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "closestPositionToPoint:", x, y);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[UITextSelection base](self, "base");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[UITextSelection base](self, "base");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "start");
      v9 = (id)objc_claimAutoreleasedReturnValue();

      -[UITextSelection base](self, "base");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "end");
      v11 = (id)objc_claimAutoreleasedReturnValue();

      v12 = objc_msgSend(v20, "offsetFromPosition:toPosition:", v9, v6);
      v13 = objc_msgSend(v20, "offsetFromPosition:toPosition:", v6, v11);
      if (v12 <= 0)
      {
        v17 = v6;
        v16 = v9;
        v9 = v17;
      }
      else
      {
        v14 = v13;
        if (v13 <= 0)
        {
          v18 = v6;
          v16 = v11;
          v11 = v18;
        }
        else
        {
          v15 = v6;
          if (v12 >= v14)
            v16 = v11;
          else
            v16 = v9;
          if (v12 >= v14)
            v11 = v15;
          else
            v9 = v15;
        }
      }

      objc_msgSend(v20, "textRangeFromPosition:toPosition:", v9, v11);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextSelection setSelectedRange:](self, "setSelectedRange:", v19);

    }
  }

}

- (void)setGranularRangedSelectionWithExtentPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;

  y = a3.y;
  x = a3.x;
  -[UITextSelection document](self, "document");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "closestPositionToPoint:", x, y);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[UITextSelection base](self, "base");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v20, "_rangeOfTextUnit:enclosingPosition:", -[UITextSelection granularity](self, "granularity"), v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextSelection base](self, "base");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "start");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[UITextSelection base](self, "base");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "end");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v20, "comparePosition:toPosition:", v6, v10) == -1)
      {
        objc_msgSend(v8, "start");
        v17 = objc_claimAutoreleasedReturnValue();
        v14 = (void *)v17;
        if (v17)
          v15 = (void *)v17;
        else
          v15 = v6;
        v16 = v10;
        v10 = v15;
      }
      else
      {
        if (objc_msgSend(v20, "comparePosition:toPosition:", v6, v12) != 1)
        {
LABEL_14:
          objc_msgSend(v20, "textRangeFromPosition:toPosition:", v10, v12);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[UITextSelection setSelectedRange:](self, "setSelectedRange:", v19);

          goto LABEL_15;
        }
        objc_msgSend(v8, "end");
        v13 = objc_claimAutoreleasedReturnValue();
        v14 = (void *)v13;
        if (v13)
          v15 = (void *)v13;
        else
          v15 = v6;
        v16 = v12;
        v12 = v15;
      }
      v18 = v15;

      goto LABEL_14;
    }
  }
LABEL_15:

}

- (void)smartExtendRangedSelection:(int)a3 downstream:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  _BOOL8 v22;
  void *v23;
  char v24;
  void *v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  int v33;
  char v34;
  id v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  char v40;
  uint64_t v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  _BOOL8 v47;
  void *v48;
  id v49;

  v4 = a4;
  -[UITextSelection selectedRange](self, "selectedRange");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[UITextSelection selectedRange](self, "selectedRange");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEmpty");

    if ((v10 & 1) == 0)
    {
      -[UITextSelection document](self, "document");
      v49 = (id)objc_claimAutoreleasedReturnValue();
      -[UITextSelection selectedRange](self, "selectedRange");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "start");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      -[UITextSelection selectedRange](self, "selectedRange");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "end");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (a3 == -1)
      {
        v17 = 0;
      }
      else
      {
        -[UITextSelection initialExtent](self, "initialExtent");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (v4)
          objc_msgSend(v15, "end");
        else
          objc_msgSend(v15, "start");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

      }
      if (v4)
        v18 = v12;
      else
        v18 = v14;
      if (v4)
        v19 = v14;
      else
        v19 = v12;
      v20 = v18;
      v21 = v19;
      if (v17 && (objc_msgSend(v17, "isEqual:", v21) & 1) != 0)
        goto LABEL_49;
      v48 = v12;
      v22 = !v4;
      objc_msgSend(v49, "tokenizer");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "isPosition:atBoundary:inDirection:", v21, 1, v22);

      if ((v24 & 1) != 0)
      {
        v12 = v48;
LABEL_49:

        return;
      }
      objc_msgSend(v49, "tokenizer");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v4;
      v26 = objc_msgSend(v25, "isPosition:atBoundary:inDirection:", v21, 1, v4);

      if (v26)
      {
        if (v4)
          v27 = -1;
        else
          v27 = 1;
        objc_msgSend(v49, "positionFromPosition:offset:", v21, v27);
        v28 = objc_claimAutoreleasedReturnValue();

        v21 = (id)v28;
      }
      objc_msgSend(v49, "tokenizer");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "positionFromPosition:toBoundary:inDirection:", v21, 1, !v4);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
      {
        objc_msgSend(v49, "tokenizer");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "isPosition:atBoundary:inDirection:", v30, 1, !v4);
        v33 = v32;
        if (v17 && v32)
        {
          v34 = objc_msgSend(v17, "isEqual:", v30);

          if ((v34 & 1) == 0)
          {
LABEL_29:
            v35 = v30;

            v21 = v35;
            v12 = v48;
            goto LABEL_47;
          }
        }
        else
        {

          if (v33)
            goto LABEL_29;
        }
      }
      if (v21)
      {
        v36 = 1;
        if (!v4)
          v36 = -1;
        v45 = v30;
        v46 = v36;
        while (1)
        {
          objc_msgSend(v49, "tokenizer");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v37, "isPosition:atBoundary:inDirection:", v21, 1, v22) & 1) != 0
            || (objc_msgSend(v21, "isEqual:", v20) & 1) != 0)
          {
            break;
          }
          objc_msgSend(v49, "tokenizer");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v38, "isPosition:atBoundary:inDirection:", v21, 4, v22))
          {

            break;
          }
          objc_msgSend(v49, "tokenizer");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = objc_msgSend(v39, "isPosition:atBoundary:inDirection:", v21, 4, v47);

          if ((v40 & 1) != 0)
            goto LABEL_44;
          objc_msgSend(v49, "positionFromPosition:offset:", v21, v46);
          v41 = objc_claimAutoreleasedReturnValue();

          v21 = (id)v41;
          if (!v41)
          {
            v12 = v48;
            v30 = v45;
            goto LABEL_45;
          }
        }

LABEL_44:
        v12 = v48;
        v30 = v45;
        if (!objc_msgSend(v21, "isEqual:", v20))
          goto LABEL_47;
      }
      else
      {
        v12 = v48;
      }
LABEL_45:
      v42 = v30;

      if (!v30)
      {
        v21 = 0;
        goto LABEL_48;
      }
      v21 = v42;
LABEL_47:
      objc_msgSend(v49, "textRangeFromPosition:toPosition:", v20, v21);
      v43 = v30;
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      -[UITextSelection setSelectedRange:](self, "setSelectedRange:", v44);

      v30 = v43;
LABEL_48:

      goto LABEL_49;
    }
  }
}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (self->_isCommitting)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p base: %@; granularity: %ld; initialExtent: %@; selectedRange: %@; isCommitting: %@>"),
    v5,
    self,
    self->_base,
    self->_granularity,
    self->_initialExtent,
    self->_selectedRange,
    v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (UITextRange)base
{
  return self->_base;
}

- (int64_t)granularity
{
  return self->_granularity;
}

- (void)setGranularity:(int64_t)a3
{
  self->_granularity = a3;
}

- (UITextRange)initialExtent
{
  return self->_initialExtent;
}

- (BOOL)isCommitting
{
  return self->_isCommitting;
}

@end
