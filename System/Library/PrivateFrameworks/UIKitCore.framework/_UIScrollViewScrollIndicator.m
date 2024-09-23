@implementation _UIScrollViewScrollIndicator

- (void)didMoveToWindow
{
  void *v3;
  _UIScrollViewScrollIndicatorVisualStyle *visualStyle;

  -[UIView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    visualStyle = self->_visualStyle;
    self->_visualStyle = 0;

  }
}

- (_UIScrollViewScrollIndicator)initWithFrame:(CGRect)a3
{
  _UIScrollViewScrollIndicator *v3;
  _UIScrollViewScrollIndicator *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UIPointerInteraction *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_UIScrollViewScrollIndicator;
  v3 = -[UIView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[_UIScrollViewScrollIndicator _visualStyle](v3, "_visualStyle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setClipsToBounds:](v4, "setClipsToBounds:", objc_msgSend(v5, "clipsToBounds"));

    -[_UIScrollViewScrollIndicator _visualStyle](v4, "_visualStyle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fillView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIScrollViewScrollIndicator setRoundedFillView:](v4, "setRoundedFillView:", v7);

    -[_UIScrollViewScrollIndicator roundedFillView](v4, "roundedFillView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView addSubview:](v4, "addSubview:", v8);

    v9 = -[UIPointerInteraction initWithDelegate:]([UIPointerInteraction alloc], "initWithDelegate:", v4);
    -[UIView addInteraction:](v4, "addInteraction:", v9);
    -[_UIScrollViewScrollIndicator _visualStyle](v4, "_visualStyle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "cursorHitTestingInsets");
    -[UIView setHitTestInsets:](v4, "setHitTestInsets:");

  }
  return v4;
}

- (_UIScrollViewScrollIndicatorVisualStyle)_visualStyle
{
  _UIScrollViewScrollIndicatorVisualStyle *visualStyle;
  void *v4;
  _UIScrollViewScrollIndicatorVisualStyle *v5;
  _UIScrollViewScrollIndicatorVisualStyle *v6;

  visualStyle = self->_visualStyle;
  if (!visualStyle)
  {
    -[UIView traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[_UIScrollViewScrollIndicator visualStyleForTraitCollection:](_UIScrollViewScrollIndicator, "visualStyleForTraitCollection:", v4);
    v5 = (_UIScrollViewScrollIndicatorVisualStyle *)objc_claimAutoreleasedReturnValue();
    v6 = self->_visualStyle;
    self->_visualStyle = v5;

    visualStyle = self->_visualStyle;
  }
  return visualStyle;
}

+ (id)visualStyleForTraitCollection:(id)a3
{
  return (id)objc_msgSend(a1, "visualStyleForIdiom:", objc_msgSend(a3, "userInterfaceIdiom"));
}

+ (id)visualStyleForIdiom:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  objc_msgSend(a1, "_ensureDefaultStyles");
  v4 = (void *)_MergedGlobals_1190;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = (void *)qword_1ECD7F848;
    if (!qword_1ECD7F848)
    {
      v8 = objc_opt_new();
      v9 = (void *)qword_1ECD7F848;
      qword_1ECD7F848 = v8;

      v7 = (void *)qword_1ECD7F848;
    }
    v6 = v7;
  }
  return v6;
}

+ (void)_ensureDefaultStyles
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (!_MergedGlobals_1190)
  {
    v2 = objc_opt_new();
    v3 = (void *)_MergedGlobals_1190;
    _MergedGlobals_1190 = v2;

    v6 = (id)objc_opt_new();
    objc_msgSend((id)_MergedGlobals_1190, "setObject:forKeyedSubscript:", v6, &unk_1E1A99B40);
    objc_msgSend((id)_MergedGlobals_1190, "setObject:forKeyedSubscript:", v6, &unk_1E1A99B58);
    objc_msgSend((id)_MergedGlobals_1190, "setObject:forKeyedSubscript:", v6, &unk_1E1A99B70);
    v4 = (void *)objc_opt_new();
    objc_msgSend((id)_MergedGlobals_1190, "setObject:forKeyedSubscript:", v4, &unk_1E1A99B88);

    v5 = (void *)objc_opt_new();
    objc_msgSend((id)_MergedGlobals_1190, "setObject:forKeyedSubscript:", v5, &unk_1E1A99BA0);

  }
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (void)setStyle:(int64_t)a3
{
  void *v5;
  id v6;

  self->_style = a3;
  -[_UIScrollViewScrollIndicator _visualStyle](self, "_visualStyle");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "colorForIndicatorStyle:expanded:", a3, self->_expandedForDirectManipulation);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIScrollViewScrollIndicator setForegroundColor:](self, "setForegroundColor:", v5);

}

- (void)setRoundedFillView:(id)a3
{
  objc_storeStrong((id *)&self->_roundedFillView, a3);
}

- (void)setForegroundColor:(id)a3
{
  id v5;
  UIColor *v6;
  UIColor *v7;
  BOOL v8;
  UIColor *v9;
  void *v10;
  UIColor *v11;

  v5 = a3;
  v6 = self->_foregroundColor;
  v7 = (UIColor *)v5;
  v11 = v7;
  if (v6 == v7)
  {

    v10 = v11;
  }
  else
  {
    if (v7 && v6)
    {
      v8 = -[UIColor isEqual:](v6, "isEqual:", v7);

      v9 = v11;
      if (v8)
        goto LABEL_10;
    }
    else
    {

    }
    objc_storeStrong((id *)&self->_foregroundColor, a3);
    -[_UIScrollViewScrollIndicator roundedFillView](self, "roundedFillView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBackgroundColor:", v11);
  }

  v9 = v11;
LABEL_10:

}

- (UIView)roundedFillView
{
  return self->_roundedFillView;
}

- (unint64_t)type
{
  return self->_type;
}

- (BOOL)expandedForDirectManipulation
{
  return self->_expandedForDirectManipulation;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIScrollViewScrollIndicator;
  -[UIView layoutSubviews](&v3, sel_layoutSubviews);
  -[_UIScrollViewScrollIndicator _layoutFillViewAnimated:](self, "_layoutFillViewAnimated:", 0);
}

- (void)_layoutFillViewAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  _BOOL8 v7;
  __int128 v8;
  __int128 v9;
  _QWORD aBlock[5];

  v3 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __56___UIScrollViewScrollIndicator__layoutFillViewAnimated___block_invoke;
  aBlock[3] = &unk_1E16B1B28;
  aBlock[4] = self;
  v5 = _Block_copy(aBlock);
  if (v3)
  {
    v8 = 0u;
    v9 = 0u;
    -[_UIScrollViewScrollIndicator _visualStyle](self, "_visualStyle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[_UIScrollViewScrollIndicator expandedForDirectManipulation](self, "expandedForDirectManipulation");
    if (v6)
    {
      objc_msgSend(v6, "valuesForLayoutSizeAnimationWhenExpanding:", v7);
    }
    else
    {
      v8 = 0u;
      v9 = 0u;
    }

    +[UIView animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:](UIView, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v5, 0, v8, v9);
  }
  else
  {
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v5);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_foregroundColor, 0);
  objc_storeStrong((id *)&self->_roundedFillView, 0);
  objc_storeStrong((id *)&self->_visualStyle, 0);
}

- (void)setExpandedForDirectManipulation:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;

  if (self->_expandedForDirectManipulation != a3)
  {
    v3 = a3;
    self->_expandedForDirectManipulation = a3;
    -[_UIScrollViewScrollIndicator _visualStyle](self, "_visualStyle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "colorForIndicatorStyle:expanded:", -[_UIScrollViewScrollIndicator style](self, "style"), v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIScrollViewScrollIndicator setForegroundColor:](self, "setForegroundColor:", v6);

    -[_UIScrollViewScrollIndicator _layoutFillViewAnimated:](self, "_layoutFillViewAnimated:", 1);
  }
}

- (CGRect)_offsetFillViewRectForExpandedState:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  double y;
  double x;
  UIUserInterfaceLayoutDirection v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  unint64_t v15;
  BOOL v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = -[UIView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  -[_UIScrollViewScrollIndicator _visualStyle](self, "_visualStyle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "staticDimensionExpandedSize");
  v11 = v10;
  -[_UIScrollViewScrollIndicator _visualStyle](self, "_visualStyle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "staticDimensionSize");
  v14 = v11 - v13;

  v15 = -[_UIScrollViewScrollIndicator type](self, "type");
  if (v8)
    v16 = 0;
  else
    v16 = v15 == 1;
  if (v16)
    v17 = v14;
  else
    v17 = 0.0;
  v18 = x - v17;
  if (-[_UIScrollViewScrollIndicator type](self, "type") == 1)
    v19 = 0.0;
  else
    v19 = v14;
  v20 = y - v19;
  v21 = v18;
  v22 = width;
  v23 = height;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v20;
  result.origin.x = v21;
  return result;
}

- (CGSize)layoutOffset
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x1E0C9D820];
  v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  id v9;
  objc_super v11;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_UIScrollViewScrollIndicator;
  -[UIView hitTest:withEvent:](&v11, sel_hitTest_withEvent_, v7, x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_3;
LABEL_5:
    v9 = v8;
    goto LABEL_6;
  }
  if ((objc_msgSend(v7, "_containsHIDPointerEvent") & 1) != 0)
    goto LABEL_5;
LABEL_3:
  v9 = 0;
LABEL_6:

  return v9;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v6;
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

  v6 = a5;
  -[_UIScrollViewScrollIndicator _visualStyle](self, "_visualStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bounds](self, "bounds");
  objc_msgSend(v7, "hitTestingRectForIndicatorRect:");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  objc_msgSend(v6, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  +[UIPointerRegion regionWithRect:identifier:](UIPointerRegion, "regionWithRect:identifier:", v16, v9, v11, v13, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  return 0;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  -[_UIScrollViewScrollIndicator setHasPointer:](self, "setHasPointer:", 1, a4, a5);
}

- (void)pointerInteraction:(id)a3 willExitRegion:(id)a4 animator:(id)a5
{
  -[_UIScrollViewScrollIndicator setHasPointer:](self, "setHasPointer:", 0, a4, a5);
}

- (BOOL)hasPointer
{
  return self->_hasPointer;
}

- (void)setHasPointer:(BOOL)a3
{
  self->_hasPointer = a3;
}

- (int64_t)style
{
  return self->_style;
}

- (UIColor)foregroundColor
{
  return self->_foregroundColor;
}

+ (void)registerVisualStyle:(id)a3 forIdiom:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  objc_msgSend(a1, "_ensureDefaultStyles");
  v7 = (void *)_MergedGlobals_1190;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

}

@end
