@implementation UITextSearchingDimmingView

- (UITextSearchingDimmingView)initWithFrame:(CGRect)a3
{
  UITextSearchingDimmingView *v3;
  CAShapeLayer *v4;
  CAShapeLayer *brighteningLayer;
  id v6;
  void *v7;
  CALayer *v8;
  CALayer *dimmingLayer;
  id v10;
  void *v11;
  CAShapeLayer *v12;
  CAShapeLayer *punchoutLayer;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)UITextSearchingDimmingView;
  v3 = -[UIView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
    brighteningLayer = v3->_brighteningLayer;
    v3->_brighteningLayer = v4;

    +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.2);
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CAShapeLayer setFillColor:](v3->_brighteningLayer, "setFillColor:", objc_msgSend(v6, "CGColor"));

    -[CAShapeLayer setCompositingFilter:](v3->_brighteningLayer, "setCompositingFilter:", *MEMORY[0x1E0CD2DD8]);
    -[UIView layer](v3, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSublayer:", v3->_brighteningLayer);

    v8 = (CALayer *)objc_alloc_init(MEMORY[0x1E0CD27A8]);
    dimmingLayer = v3->_dimmingLayer;
    v3->_dimmingLayer = v8;

    +[UIColor _dimmingViewColor](UIColor, "_dimmingViewColor");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CALayer setBackgroundColor:](v3->_dimmingLayer, "setBackgroundColor:", objc_msgSend(v10, "CGColor"));

    -[UIView layer](v3, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSublayer:", v3->_dimmingLayer);

    v12 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
    punchoutLayer = v3->_punchoutLayer;
    v3->_punchoutLayer = v12;

    -[CAShapeLayer setCompositingFilter:](v3->_punchoutLayer, "setCompositingFilter:", *MEMORY[0x1E0CD2C50]);
    -[CALayer addSublayer:](v3->_dimmingLayer, "addSublayer:", v3->_punchoutLayer);
  }
  return v3;
}

- (void)setTextRects:(id)a3
{
  self->_punchoutPathIsValid = 0;
  objc_storeStrong((id *)&self->_textRects, a3);
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UITextSearchingDimmingView;
  -[UIView traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[UIView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updatePunchoutPathForVisibleRect:(CGRect)a3
{
  void *v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double left;
  double v19;
  double v20;
  double top;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  void *v32;
  double v33;
  UIPreviewParameters *v34;
  id v35;
  const CGPath *v36;
  double Height;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;

  v44 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v5 = self->_textRects;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v40;
    Height = 1.79769313e308;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v40 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "CGRectValue");
        v11 = v10;
        v13 = v12;
        v15 = v14;
        v17 = v16;
        left = self->_contentInset.left;
        -[UIView bounds](self, "bounds");
        v20 = v19;
        top = self->_contentInset.top;
        -[UIView bounds](self, "bounds");
        v23 = v22;
        v45.origin.x = v11;
        v45.origin.y = v13;
        v45.size.width = v15;
        v45.size.height = v17;
        if (CGRectGetWidth(v45) != 0.0)
        {
          v46.origin.x = v11;
          v46.origin.y = v13;
          v46.size.width = v15;
          v46.size.height = v17;
          if (CGRectIntersectsRect(v46, a3))
          {
            -[UIView contentScaleFactor](self, "contentScaleFactor");
            v25 = UIRectIntegralWithScale(v11 - v20 - left, v13 - v23 - top, v15, v17, v24);
            v27 = v26;
            v29 = v28;
            v31 = v30;
            objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v32);
            v47.origin.x = v25;
            v47.origin.y = v27;
            v47.size.width = v29;
            v47.size.height = v31;
            if (CGRectGetHeight(v47) < Height)
            {
              v48.origin.x = v25;
              v48.origin.y = v27;
              v48.size.width = v29;
              v48.size.height = v31;
              Height = CGRectGetHeight(v48);
            }

          }
        }
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v7);
  }
  else
  {
    Height = 1.79769313e308;
  }

  if (Height == 1.79769313e308)
    v33 = 3.0;
  else
    v33 = Height * 0.25;
  v34 = -[UIPreviewParameters initWithTextLineRects:]([UIPreviewParameters alloc], "initWithTextLineRects:", v4);
  -[UIPreviewParameters _setTextPathCornerRadius:](v34, "_setTextPathCornerRadius:", v33);
  -[UIPreviewParameters _setTextPathInsets:](v34, "_setTextPathInsets:", 0.0, 0.0, 0.0, 0.0);
  -[UIPreviewParameters visiblePath](v34, "visiblePath");
  v35 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v36 = (const CGPath *)objc_msgSend(v35, "CGPath");

  -[CAShapeLayer setPath:](self->_punchoutLayer, "setPath:", CGPathCreateMutableCopy(v36));
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;

  if (!self->_punchoutPathIsValid)
  {
    -[UIView visibleBounds](self, "visibleBounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[UIView _containingScrollView](self, "_containingScrollView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[UIView _containingScrollView](self, "_containingScrollView");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "visibleBounds");
      v4 = v13;
      v6 = v14;
      v8 = v15;
      v10 = v16;

    }
    -[UITextSearchingDimmingView _updatePunchoutPathForVisibleRect:](self, "_updatePunchoutPathForVisibleRect:", v4, v6, v8, v10);
    self->_punchoutPathIsValid = 1;
  }
  -[UIView traitCollection](self, "traitCollection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "userInterfaceStyle");

  if (v18 == 2)
    -[CAShapeLayer setPath:](self->_brighteningLayer, "setPath:", CGPathCreateMutableCopy(-[CAShapeLayer path](self->_punchoutLayer, "path")));
  -[CAShapeLayer setHidden:](self->_brighteningLayer, "setHidden:", v18 != 2);
  -[UIView bounds](self, "bounds");
  -[CALayer setFrame:](self->_dimmingLayer, "setFrame:");
}

- (BOOL)_wantsTargetOfKeyboardEventDeferringEnvironment
{
  return 1;
}

- (UIEdgeInsets)contentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInset.top;
  left = self->_contentInset.left;
  bottom = self->_contentInset.bottom;
  right = self->_contentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  self->_contentInset = a3;
}

- (NSArray)textRects
{
  return self->_textRects;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textRects, 0);
  objc_storeStrong((id *)&self->_punchoutLayer, 0);
  objc_storeStrong((id *)&self->_dimmingLayer, 0);
  objc_storeStrong((id *)&self->_brighteningLayer, 0);
}

@end
