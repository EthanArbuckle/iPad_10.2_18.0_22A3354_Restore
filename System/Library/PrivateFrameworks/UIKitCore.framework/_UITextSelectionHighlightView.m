@implementation _UITextSelectionHighlightView

- (void)layoutSubviews
{
  CGMutablePathRef Mutable;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v14.receiver = self;
  v14.super_class = (Class)_UITextSelectionHighlightView;
  -[UIView layoutSubviews](&v14, sel_layoutSubviews);
  Mutable = CGPathCreateMutable();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = self->_selectionRects;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "_appendToPath:cornerRadius:edgeInsets:", Mutable, self->_selectionCornerRadius, self->_selectionEdgeInsets.top, self->_selectionEdgeInsets.left, self->_selectionEdgeInsets.bottom, self->_selectionEdgeInsets.right, (_QWORD)v10);
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v6);
  }

  -[UIView tintColor](self, "tintColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITextSelectionRangeView setSelectionColor:](self->_rangeView, "setSelectionColor:", v9);

  -[UIView bounds](self, "bounds");
  -[UIView setFrame:](self->_rangeView, "setFrame:");
  -[_UITextSelectionRangeView setPath:](self->_rangeView, "setPath:", Mutable);
  if (Mutable)
    CFRelease(Mutable);
}

- (void)tintColorDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UITextSelectionHighlightView;
  -[UIView tintColorDidChange](&v4, sel_tintColorDidChange);
  -[UIView tintColor](self, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITextSelectionRangeView setSelectionColor:](self->_rangeView, "setSelectionColor:", v3);

}

- (_UITextSelectionHighlightView)initWithFrame:(CGRect)a3
{
  _UITextSelectionHighlightView *v3;
  _UITextSelectionHighlightView *v4;
  _UITextSelectionRangeView *v5;
  uint64_t v6;
  _UITextSelectionRangeView *rangeView;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UITextSelectionHighlightView;
  v3 = -[UIView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    v5 = [_UITextSelectionRangeView alloc];
    v6 = -[UIView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    rangeView = v4->_rangeView;
    v4->_rangeView = (_UITextSelectionRangeView *)v6;

    -[UIView addSubview:](v4, "addSubview:", v4->_rangeView);
  }
  return v4;
}

- (void)setSelectionRects:(id)a3
{
  id v5;

  v5 = a3;
  if (!-[NSArray isEqualToArray:](self->_selectionRects, "isEqualToArray:"))
  {
    objc_storeStrong((id *)&self->_selectionRects, a3);
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (UIColor)_selectionBorderColor
{
  return -[_UITextSelectionRangeView selectionBorderColor](self->_rangeView, "selectionBorderColor");
}

- (void)_setSelectionBorderColor:(id)a3
{
  -[_UITextSelectionRangeView setSelectionBorderColor:](self->_rangeView, "setSelectionBorderColor:", a3);
}

- (double)_selectionBorderWidth
{
  double result;

  -[_UITextSelectionRangeView selectionBorderWidth](self->_rangeView, "selectionBorderWidth");
  return result;
}

- (void)_setSelectionBorderWidth:(double)a3
{
  -[_UITextSelectionRangeView setSelectionBorderWidth:](self->_rangeView, "setSelectionBorderWidth:", a3);
}

- (void)_setSelectionEdgeInsets:(UIEdgeInsets)a3
{
  self->_selectionEdgeInsets = a3;
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_setSelectionCornerRadius:(double)a3
{
  self->_selectionCornerRadius = a3;
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (NSArray)selectionRects
{
  return self->_selectionRects;
}

- (double)_selectionCornerRadius
{
  return self->_selectionCornerRadius;
}

- (UIEdgeInsets)_selectionEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_selectionEdgeInsets.top;
  left = self->_selectionEdgeInsets.left;
  bottom = self->_selectionEdgeInsets.bottom;
  right = self->_selectionEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionRects, 0);
  objc_storeStrong((id *)&self->_rangeView, 0);
}

@end
