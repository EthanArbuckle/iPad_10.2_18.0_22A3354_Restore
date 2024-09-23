@implementation WFInsetTextSelectionRect

- (WFInsetTextSelectionRect)initWithSelectionRect:(id)a3 insets:(UIEdgeInsets)a4
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  id v10;
  WFInsetTextSelectionRect *v11;
  WFInsetTextSelectionRect *v12;
  WFInsetTextSelectionRect *v13;
  objc_super v15;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)WFInsetTextSelectionRect;
  v11 = -[WFInsetTextSelectionRect init](&v15, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_selectionRect, a3);
    v12->_insets.top = top;
    v12->_insets.left = left;
    v12->_insets.bottom = bottom;
    v12->_insets.right = right;
    v13 = v12;
  }

  return v12;
}

- (CGRect)rect
{
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
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect result;

  -[WFInsetTextSelectionRect selectionRect](self, "selectionRect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rect");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[WFInsetTextSelectionRect insets](self, "insets");
  v13 = v5 + v12;
  v15 = v7 + v14;
  v17 = v9 - (v12 + v16);
  v19 = v11 - (v14 + v18);

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

- (int64_t)writingDirection
{
  void *v2;
  int64_t v3;

  -[WFInsetTextSelectionRect selectionRect](self, "selectionRect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "writingDirection");

  return v3;
}

- (BOOL)containsStart
{
  void *v2;
  char v3;

  -[WFInsetTextSelectionRect selectionRect](self, "selectionRect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsStart");

  return v3;
}

- (BOOL)containsEnd
{
  void *v2;
  char v3;

  -[WFInsetTextSelectionRect selectionRect](self, "selectionRect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "containsEnd");

  return v3;
}

- (BOOL)isVertical
{
  void *v2;
  char v3;

  -[WFInsetTextSelectionRect selectionRect](self, "selectionRect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isVertical");

  return v3;
}

- (UIEdgeInsets)insets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_insets.top;
  left = self->_insets.left;
  bottom = self->_insets.bottom;
  right = self->_insets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (UITextSelectionRect)selectionRect
{
  return self->_selectionRect;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionRect, 0);
}

@end
