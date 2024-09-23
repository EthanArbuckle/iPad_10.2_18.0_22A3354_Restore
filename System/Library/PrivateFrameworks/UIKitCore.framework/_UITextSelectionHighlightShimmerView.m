@implementation _UITextSelectionHighlightShimmerView

- (_UITextSelectionHighlightShimmerView)initWithFrame:(CGRect)a3
{
  return -[_UITextSelectionHighlightShimmerView initWithFrame:effect:](self, "initWithFrame:effect:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_UITextSelectionHighlightShimmerView)initWithFrame:(CGRect)a3 effect:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  _UIIntelligenceContentLightEffect *v9;
  _UITextSelectionHighlightShimmerView *v10;
  _UITextSelectionHighlightShimmerView *v11;
  _UIDirectionalLightConfiguration *v12;
  void *v13;
  _UIDirectionalLightConfiguration *v14;
  void *v15;
  UIVisualEffectView *v16;
  UIVisualEffectView *shimmerView;
  void *v18;
  _UITextSelectionRangeView *v19;
  uint64_t v20;
  _UITextSelectionRangeView *rangeView;
  void *v22;
  objc_super v24;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = (_UIIntelligenceContentLightEffect *)a4;
  v24.receiver = self;
  v24.super_class = (Class)_UITextSelectionHighlightShimmerView;
  v10 = -[UIView initWithFrame:](&v24, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    -[UIView setUserInteractionEnabled:](v10, "setUserInteractionEnabled:", 0);
    if (!v9)
    {
      v12 = [_UIDirectionalLightConfiguration alloc];
      +[_UIColorPalette textAssistantPonderingFillPalette](_UIColorPalette, "textAssistantPonderingFillPalette");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[_UIDirectionalLightConfiguration initWithColorPalette:](v12, "initWithColorPalette:", v13);

      -[_UIDirectionalLightConfiguration setDirection:](v14, "setDirection:", 2);
      -[_UIDirectionalLightConfiguration setDuration:](v14, "setDuration:", 3.0);
      +[_UIIntelligenceLightSourceDescriptor directionalLightWithConfiguration:](_UIIntelligenceLightSourceDescriptor, "directionalLightWithConfiguration:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = -[_UIIntelligenceContentLightEffect initWithLightSource:]([_UIIntelligenceContentLightEffect alloc], "initWithLightSource:", v15);

    }
    v16 = -[UIVisualEffectView initWithEffect:]([UIVisualEffectView alloc], "initWithEffect:", v9);
    shimmerView = v11->_shimmerView;
    v11->_shimmerView = v16;

    -[UIView layer](v11->_shimmerView, "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAllowsGroupOpacity:", 1);

    -[UIView insertSubview:atIndex:](v11, "insertSubview:atIndex:", v11->_shimmerView, 0);
    v19 = [_UITextSelectionRangeView alloc];
    v20 = -[UIView initWithFrame:](v19, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    rangeView = v11->_rangeView;
    v11->_rangeView = (_UITextSelectionRangeView *)v20;

    -[UIVisualEffectView contentView](v11->_shimmerView, "contentView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addSubview:", v11->_rangeView);

  }
  return v11;
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

- (void)_setSelectionCornerRadius:(double)a3
{
  self->_selectionCornerRadius = a3;
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

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
  v14.super_class = (Class)_UITextSelectionHighlightShimmerView;
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
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "_appendToPath:cornerRadius:edgeInsets:", Mutable, self->_selectionCornerRadius, 0.0, 0.0, 0.0, 0.0, (_QWORD)v10);
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
  -[UIView setFrame:](self->_shimmerView, "setFrame:");
  -[UIView bounds](self, "bounds");
  -[UIView setFrame:](self->_rangeView, "setFrame:");
  -[_UITextSelectionRangeView setPath:](self->_rangeView, "setPath:", Mutable);
  if (Mutable)
    CFRelease(Mutable);
}

- (NSArray)selectionRects
{
  return self->_selectionRects;
}

- (double)_selectionCornerRadius
{
  return self->_selectionCornerRadius;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionRects, 0);
  objc_storeStrong((id *)&self->_shimmerView, 0);
  objc_storeStrong((id *)&self->_rangeView, 0);
}

@end
