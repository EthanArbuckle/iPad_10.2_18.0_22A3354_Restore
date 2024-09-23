@implementation _UITextUnderlineView

- (_UITextUnderlineView)initWithFrame:(CGRect)a3
{
  _UITextUnderlineView *v3;
  _UITextUnderlineView *v4;
  NSMutableArray *v5;
  NSMutableArray *underlineViews;
  NSMutableArray *v7;
  NSMutableArray *trackedUnderlineRects;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_UITextUnderlineView;
  v3 = -[_UITextSelectionHighlightView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIView setUserInteractionEnabled:](v3, "setUserInteractionEnabled:", 0);
    v4->_useDirectionalLightEffect = 0;
    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    underlineViews = v4->_underlineViews;
    v4->_underlineViews = v5;

    v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    trackedUnderlineRects = v4->_trackedUnderlineRects;
    v4->_trackedUnderlineRects = v7;

  }
  return v4;
}

- (void)setUseDirectionalLightEffect:(BOOL)a3
{
  UIVisualEffectView *baseView;
  void *v5;
  UIVisualEffectView *v6;
  UIVisualEffectView *v7;
  void *v8;
  UIVisualEffectView *v9;
  UIVisualEffectView *v10;

  if (self->_useDirectionalLightEffect != a3)
  {
    self->_useDirectionalLightEffect = a3;
    baseView = self->_baseView;
    if (a3)
    {
      if (!baseView)
      {
        v7 = [UIVisualEffectView alloc];
        -[_UITextUnderlineView effectForProofreadingUnderlines](self, "effectForProofreadingUnderlines");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[UIVisualEffectView initWithEffect:](v7, "initWithEffect:", v8);
        v10 = self->_baseView;
        self->_baseView = v9;

        -[UIView insertSubview:atIndex:](self, "insertSubview:atIndex:", self->_baseView, 0);
      }
    }
    else
    {
      -[UIView superview](baseView, "superview");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
        -[UIView removeFromSuperview](self->_baseView, "removeFromSuperview");
      v6 = self->_baseView;
      self->_baseView = 0;

    }
  }
}

- (id)effectForProofreadingUnderlines
{
  _UIDirectionalLightConfiguration *v2;
  void *v3;
  _UIDirectionalLightConfiguration *v4;
  void *v5;
  _UIIntelligenceContentLightEffect *v6;

  v2 = [_UIDirectionalLightConfiguration alloc];
  +[_UIColorPalette textAssistantPonderingFillPalette](_UIColorPalette, "textAssistantPonderingFillPalette");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_UIDirectionalLightConfiguration initWithColorPalette:](v2, "initWithColorPalette:", v3);

  -[_UIDirectionalLightConfiguration setDirection:](v4, "setDirection:", 2);
  -[_UIDirectionalLightConfiguration setDuration:](v4, "setDuration:", 3.0);
  +[_UIIntelligenceLightSourceDescriptor directionalLightWithConfiguration:](_UIIntelligenceLightSourceDescriptor, "directionalLightWithConfiguration:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_UIIntelligenceContentLightEffect initWithLightSource:]([_UIIntelligenceContentLightEffect alloc], "initWithLightSource:", v5);

  return v6;
}

- (void)setUnderlineRects:(id)a3
{
  unint64_t v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    if ((-[NSMutableArray isEqualToArray:](self->_trackedUnderlineRects, "isEqualToArray:", v6) & 1) == 0)
    {
      -[NSMutableArray removeAllObjects](self->_trackedUnderlineRects, "removeAllObjects");
      while (1)
      {
        v4 = -[NSMutableArray count](self->_underlineViews, "count");
        if (v4 <= objc_msgSend(v6, "count"))
          break;
        -[NSMutableArray firstObject](self->_underlineViews, "firstObject");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "removeFromSuperview");
        -[NSMutableArray removeObject:](self->_underlineViews, "removeObject:", v5);

      }
      -[_UITextUnderlineView addUnderlines:animated:](self, "addUnderlines:animated:", v6, 0);
      -[UIView setNeedsLayout](self, "setNeedsLayout");
    }
  }
  else
  {
    -[_UITextUnderlineView clearAllUnderlinesAnimated:](self, "clearAllUnderlinesAnimated:", 0);
  }

}

- (NSArray)underlineRects
{
  return (NSArray *)self->_trackedUnderlineRects;
}

- (void)addUnderlines:(id)a3 animated:(BOOL)a4
{
  -[NSMutableArray addObjectsFromArray:](self->_trackedUnderlineRects, "addObjectsFromArray:", a3, a4);
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)removeUnderlines:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD aBlock[4];
  id v22;

  v4 = a4;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v16 = v4;
    v8 = 0;
    do
    {
      objc_msgSend(v6, "objectAtIndex:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[NSMutableArray indexOfObject:](self->_trackedUnderlineRects, "indexOfObject:", v9);
      if (v10 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v11 = v10;
        if (v10 < -[NSMutableArray count](self->_underlineViews, "count"))
        {
          -[NSMutableArray objectAtIndex:](self->_underlineViews, "objectAtIndex:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v12);

        }
      }

      ++v8;
    }
    while (v8 < objc_msgSend(v6, "count"));
    v4 = v16;
  }
  -[NSMutableArray removeObjectsInArray:](self->_trackedUnderlineRects, "removeObjectsInArray:", v6);
  if (objc_msgSend(v7, "count"))
  {
    -[NSMutableArray removeObjectsInArray:](self->_underlineViews, "removeObjectsInArray:", v7);
    v13 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __50___UITextUnderlineView_removeUnderlines_animated___block_invoke;
    aBlock[3] = &unk_1E16B3FD8;
    v22 = v7;
    v14 = _Block_copy(aBlock);
    v15 = v14;
    if (v4)
    {
      v19[0] = v13;
      v19[1] = 3221225472;
      v19[2] = __50___UITextUnderlineView_removeUnderlines_animated___block_invoke_2;
      v19[3] = &unk_1E16B1BF8;
      v20 = v14;
      v17[0] = v13;
      v17[1] = 3221225472;
      v17[2] = __50___UITextUnderlineView_removeUnderlines_animated___block_invoke_3;
      v17[3] = &unk_1E16C5E00;
      v17[4] = self;
      v18 = v20;
      +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v19, v17, 0.2);

    }
    else
    {
      (*((void (**)(void *, _QWORD))v14 + 2))(v14, 0);
      -[UIView setNeedsLayout](self, "setNeedsLayout");
    }

  }
  else
  {
    -[UIView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)clearAllUnderlinesAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD aBlock[4];
  id v14;

  v3 = a3;
  v5 = (void *)-[NSMutableArray copy](self->_underlineViews, "copy");
  v6 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __51___UITextUnderlineView_clearAllUnderlinesAnimated___block_invoke;
  aBlock[3] = &unk_1E16B3FD8;
  v7 = v5;
  v14 = v7;
  v8 = _Block_copy(aBlock);
  -[NSMutableArray removeAllObjects](self->_underlineViews, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_trackedUnderlineRects, "removeAllObjects");
  if (v3)
  {
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __51___UITextUnderlineView_clearAllUnderlinesAnimated___block_invoke_2;
    v11[3] = &unk_1E16B1BF8;
    v12 = v8;
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __51___UITextUnderlineView_clearAllUnderlinesAnimated___block_invoke_3;
    v9[3] = &unk_1E16B1BA0;
    v10 = v12;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v11, v9, 0.2);

  }
  else
  {
    (*((void (**)(void *, _QWORD))v8 + 2))(v8, 0);
  }

}

- (void)layoutSubviews
{
  double x;
  double y;
  double width;
  double height;
  unint64_t v7;
  CGMutablePathRef Mutable;
  void *v9;
  UIView *v10;
  UIView *v11;
  void *v12;
  void *v13;
  void *v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  objc_super v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  v19.receiver = self;
  v19.super_class = (Class)_UITextUnderlineView;
  -[_UITextSelectionHighlightView layoutSubviews](&v19, sel_layoutSubviews);
  x = *MEMORY[0x1E0C9D648];
  y = *(double *)(MEMORY[0x1E0C9D648] + 8);
  width = *(double *)(MEMORY[0x1E0C9D648] + 16);
  height = *(double *)(MEMORY[0x1E0C9D648] + 24);
  if (-[NSMutableArray count](self->_trackedUnderlineRects, "count"))
  {
    v7 = 0;
    do
    {
      Mutable = CGPathCreateMutable();
      -[NSMutableArray objectAtIndex:](self->_trackedUnderlineRects, "objectAtIndex:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "underlineType"))
      {
        if (v7 >= -[NSMutableArray count](self->_underlineViews, "count"))
        {
          v11 = [UIView alloc];
          objc_msgSend(v9, "rect");
          v10 = -[UIView initWithFrame:](v11, "initWithFrame:");
          objc_msgSend(v9, "underlineColor");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v12)
          {
            if (-[_UITextUnderlineView useDirectionalLightEffect](self, "useDirectionalLightEffect"))
              +[UIColor insertionPointColor](UIColor, "insertionPointColor");
            else
              +[UIColor selectionHighlightColor](UIColor, "selectionHighlightColor");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
          }
          -[UIView setBackgroundColor:](v10, "setBackgroundColor:", v12);
          -[NSMutableArray addObject:](self->_underlineViews, "addObject:", v10);
          if (-[_UITextUnderlineView useDirectionalLightEffect](self, "useDirectionalLightEffect"))
          {
            -[UIVisualEffectView contentView](self->_baseView, "contentView");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "addSubview:", v10);

          }
          else
          {
            -[UIView addSubview:](self, "addSubview:", v10);
          }

        }
        else
        {
          -[NSMutableArray objectAtIndex:](self->_underlineViews, "objectAtIndex:", v7);
          v10 = (UIView *)objc_claimAutoreleasedReturnValue();
        }
        -[_UITextUnderlineView underlineFrameFromRect:underlineHeight:](self, "underlineFrameFromRect:underlineHeight:", v9, 2.0);
        -[UIView setFrame:](v10, "setFrame:");
        -[UIView layer](v10, "layer");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setCornerRadius:", 1.0);

        objc_msgSend(v9, "rect");
        v22.origin.x = v15;
        v22.origin.y = v16;
        v22.size.width = v17;
        v22.size.height = v18;
        v20.origin.x = x;
        v20.origin.y = y;
        v20.size.width = width;
        v20.size.height = height;
        v21 = CGRectUnion(v20, v22);
        x = v21.origin.x;
        y = v21.origin.y;
        width = v21.size.width;
        height = v21.size.height;
        if (Mutable)
          CFRelease(Mutable);

      }
      ++v7;
    }
    while (v7 < -[NSMutableArray count](self->_trackedUnderlineRects, "count"));
  }
  if (-[_UITextUnderlineView useDirectionalLightEffect](self, "useDirectionalLightEffect"))
    -[UIView setFrame:](self->_baseView, "setFrame:", x, y, width, height);
}

- (CGRect)underlineFrameFromRect:(id)a3 underlineHeight:(double)a4
{
  id v4;
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
  CGRect result;

  v4 = a3;
  objc_msgSend(v4, "fullRect");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  objc_msgSend(v4, "baselineOffset");
  v12 = v11;

  v13 = v8 + v12 + 2.0;
  v14 = 2.0;
  v15 = v6;
  v16 = v10;
  result.size.height = v14;
  result.size.width = v16;
  result.origin.y = v13;
  result.origin.x = v15;
  return result;
}

- (BOOL)useDirectionalLightEffect
{
  return self->_useDirectionalLightEffect;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseView, 0);
  objc_storeStrong((id *)&self->_trackedUnderlineRects, 0);
  objc_storeStrong((id *)&self->_underlineViews, 0);
}

@end
