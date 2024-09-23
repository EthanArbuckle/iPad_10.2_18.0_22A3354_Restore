@implementation _UISearchBarFieldEditor

- (void)layoutSubviews
{
  char flags;
  _QWORD v4[5];
  objc_super v5;

  flags = (char)self->_flags;
  if ((flags & 1) == 0)
    *(_BYTE *)&self->_flags = flags | 1;
  v5.receiver = self;
  v5.super_class = (Class)_UISearchBarFieldEditor;
  -[UIFieldEditor layoutSubviews](&v5, sel_layoutSubviews);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __41___UISearchBarFieldEditor_layoutSubviews__block_invoke;
  v4[3] = &unk_1E16B1B28;
  v4[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v4);
  if ((flags & 1) == 0)
    *(_BYTE *)&self->_flags &= ~1u;
}

- (id)selectionRectsForRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_opt_new();
  -[UIFieldEditor _textLayoutController](self, "_textLayoutController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "characterRangeForTextRange:", v4);

  -[UIFieldEditor textStorage](self, "textStorage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __50___UISearchBarFieldEditor_selectionRectsForRange___block_invoke;
  v15[3] = &unk_1E16B6998;
  v15[4] = self;
  v16 = v4;
  v17 = v6;
  v9 = v5;
  v18 = v9;
  v10 = v6;
  v11 = v4;
  objc_msgSend(v8, "coordinateReading:", v15);

  v12 = v18;
  v13 = v9;

  return v13;
}

- (void)activateEditor
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UISearchBarFieldEditor;
  -[UIFieldEditor activateEditor](&v4, sel_activateEditor);
  -[UIFieldEditor textField](self, "textField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_updateAtomViewSelection:", 1);

}

- (void)_updateTokenViews
{
  void *v2;
  id v3;

  -[UIFieldEditor textField](self, "textField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_textCanvasView");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "_updateTokenViews");

}

- (void)deactivateEditorDiscardingEdits:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  -[UIFieldEditor textField](self, "textField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_updateAtomViewSelection:", 0);

  v6.receiver = self;
  v6.super_class = (Class)_UISearchBarFieldEditor;
  -[UIFieldEditor deactivateEditorDiscardingEdits:](&v6, sel_deactivateEditorDiscardingEdits_, v3);
}

- (BOOL)layoutManager:(id)a3 shouldSetLineFragmentRect:(CGRect *)a4 lineFragmentUsedRect:(CGRect *)a5 baselineOffset:(double *)a6 inTextContainer:(id)a7 forGlyphRange:(_NSRange)a8
{
  void *v11;
  void *v12;
  uint64_t v13;
  CGFloat v14;

  -[UIFieldEditor _textStorage](self, "_textStorage", a3, a4, a5, a6, a7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "font");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "ascender");
  *(_QWORD *)a6 = v13;
  objc_msgSend(v12, "lineHeight");
  a5->size.height = v14;
  a4->size.height = v14;

  return 1;
}

- (void)layoutManager:(id)a3 didCompleteLayoutForTextContainer:(id)a4 atEnd:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;

  v5 = a5;
  v9 = a3;
  v8 = a4;
  if (v5 && (*(_BYTE *)&self->_flags & 1) == 0)
    -[UIScrollView setNeedsLayout](self, "setNeedsLayout");

}

@end
