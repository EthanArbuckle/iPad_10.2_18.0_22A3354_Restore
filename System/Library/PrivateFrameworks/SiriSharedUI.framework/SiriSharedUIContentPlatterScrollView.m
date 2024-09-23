@implementation SiriSharedUIContentPlatterScrollView

- (SiriSharedUIContentPlatterScrollView)initWithFrame:(CGRect)a3
{
  SiriSharedUIContentPlatterScrollView *v3;
  SiriSharedUIContentPlatterScrollView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SiriSharedUIContentPlatterScrollView;
  v3 = -[SiriSharedUIContentPlatterScrollView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SiriSharedUIContentPlatterScrollView _sharedInit](v3, "_sharedInit");
    -[SiriSharedUIContentPlatterScrollView setAdjustContentSizeOnNextLayout:](v4, "setAdjustContentSizeOnNextLayout:", 1);
  }
  return v4;
}

- (SiriSharedUIContentPlatterScrollView)initWithCoder:(id)a3
{
  SiriSharedUIContentPlatterScrollView *v3;
  SiriSharedUIContentPlatterScrollView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SiriSharedUIContentPlatterScrollView;
  v3 = -[SiriSharedUIContentPlatterScrollView initWithCoder:](&v6, sel_initWithCoder_, a3);
  v4 = v3;
  if (v3)
    -[SiriSharedUIContentPlatterScrollView _sharedInit](v3, "_sharedInit");
  return v4;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SiriSharedUIContentPlatterScrollView setAdjustContentSizeOnNextLayout:](self, "setAdjustContentSizeOnNextLayout:", 1);
  v8.receiver = self;
  v8.super_class = (Class)SiriSharedUIContentPlatterScrollView;
  -[SiriSharedUIContentPlatterScrollView setFrame:](&v8, sel_setFrame_, x, y, width, height);
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
  double v11;
  double v12;
  _BOOL4 v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v31.receiver = self;
  v31.super_class = (Class)SiriSharedUIContentPlatterScrollView;
  -[SiriSharedUIContentPlatterScrollView layoutSubviews](&v31, sel_layoutSubviews);
  if (-[SiriSharedUIContentPlatterScrollView adjustContentSizeOnNextLayout](self, "adjustContentSizeOnNextLayout"))
  {
    -[SiriSharedUIContentPlatterScrollView setAdjustContentSizeOnNextLayout:](self, "setAdjustContentSizeOnNextLayout:", 0);
    -[SiriSharedUIContentPlatterScrollView bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    -[SiriSharedUIStandardScrollView safeAreaInsets](self, "safeAreaInsets");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v13 = -[SiriSharedUIStandardScrollView isSemanticContentAttributeRightToLeft](self, "isSemanticContentAttributeRightToLeft");
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    -[SiriSharedUIStandardScrollView contentViews](self, "contentViews", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v15)
    {
      v16 = v15;
      if (v13)
        v10 = v12;
      v17 = *(_QWORD *)v28;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v28 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v18);
          objc_opt_class();
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend((id)objc_opt_class(), "defaultHeight");
            v21 = v20;
          }
          else
          {
            objc_msgSend(v19, "sizeThatFits:", v4, 1.79769313e308);
            v21 = v22;
          }
          objc_msgSend(v19, "setFrame:", v10, v8, v4, v21);
          v8 = v8 + v21;
          ++v18;
        }
        while (v16 != v18);
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v16);
    }

    -[SiriSharedUIContentPlatterScrollView contentInset](self, "contentInset");
    v24 = v6 - v23;
    -[SiriSharedUIContentPlatterScrollView contentInset](self, "contentInset");
    if (v8 > v24 - v25
      && -[SiriSharedUIContentPlatterScrollView isAutomaticScrollingEnabled](self, "isAutomaticScrollingEnabled"))
    {
      v26 = 1;
    }
    else
    {
      v26 = 0;
      v8 = v6;
    }
    -[SiriSharedUIContentPlatterScrollView setScrollEnabled:](self, "setScrollEnabled:", v26);
    -[SiriSharedUIContentPlatterScrollView setContentSize:](self, "setContentSize:", v4, v8);
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  SiriSharedUIContentPlatterScrollView *v4;
  void *v5;

  v4 = self;
  -[SiriSharedUIContentPlatterScrollView platterDelegate](self, "platterDelegate", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v5, "shouldAllowSimultaneousGestureRecognizersForScrollView:", v4);

  return (char)v4;
}

- (void)scrollRectToVisible:(CGRect)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double height;
  double width;
  double y;
  double x;
  void *v10;
  int v11;
  void *v12;
  id v13;

  v4 = a4;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SiriSharedUIContentPlatterScrollView traitCollection](self, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isAmbientPresented");

  if ((-[SiriSharedUIContentPlatterScrollView isScrollEnabled](self, "isScrollEnabled") & 1) == 0 && v11)
  {
    -[SiriSharedUIContentPlatterScrollView _parentScrollView](self, "_parentScrollView");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[SiriSharedUIContentPlatterScrollView convertRect:toView:](self, "convertRect:toView:", v13, x, y, width, height);
    v12 = v13;
    if (v13)
    {
      objc_msgSend(v13, "scrollRectToVisible:animated:", v4);
      v12 = v13;
    }

  }
}

- (void)setIsInAmbientInteractivity:(BOOL)a3
{
  self->_isInAmbientInteractivity = a3;
}

- (id)_parentScrollView
{
  SiriSharedUIContentPlatterScrollView *v2;
  SiriSharedUIContentPlatterScrollView *v3;

  v2 = self;
  while (v2)
  {
    -[SiriSharedUIContentPlatterScrollView superview](v2, "superview");
    v3 = (SiriSharedUIContentPlatterScrollView *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    v2 = v3;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return v3;
  }
  v3 = 0;
  return v3;
}

- (void)_sharedInit
{
  -[SiriSharedUIContentPlatterScrollView setAutomaticScrollingEnabled:](self, "setAutomaticScrollingEnabled:", 1);
  -[SiriSharedUIContentPlatterScrollView setShowsVerticalScrollIndicator:](self, "setShowsVerticalScrollIndicator:", 0);
  -[SiriSharedUIContentPlatterScrollView setShowsHorizontalScrollIndicator:](self, "setShowsHorizontalScrollIndicator:", 0);
}

- (BOOL)isAutomaticScrollingEnabled
{
  return self->_automaticScrollingEnabled;
}

- (void)setAutomaticScrollingEnabled:(BOOL)a3
{
  self->_automaticScrollingEnabled = a3;
}

- (BOOL)isInAmbientInteractivity
{
  return self->_isInAmbientInteractivity;
}

- (SiriSharedUIContentPlatterScrollViewDelegate)platterDelegate
{
  return (SiriSharedUIContentPlatterScrollViewDelegate *)objc_loadWeakRetained((id *)&self->_platterDelegate);
}

- (void)setPlatterDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_platterDelegate, a3);
}

- (BOOL)adjustContentSizeOnNextLayout
{
  return self->_adjustContentSizeOnNextLayout;
}

- (void)setAdjustContentSizeOnNextLayout:(BOOL)a3
{
  self->_adjustContentSizeOnNextLayout = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_platterDelegate);
}

@end
