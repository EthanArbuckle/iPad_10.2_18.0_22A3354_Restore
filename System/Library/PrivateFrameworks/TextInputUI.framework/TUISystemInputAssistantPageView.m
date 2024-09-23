@implementation TUISystemInputAssistantPageView

- (TUISystemInputAssistantPageView)initWithFrame:(CGRect)a3
{
  TUISystemInputAssistantPageView *v3;
  TUISystemInputAssistantPageView *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)TUISystemInputAssistantPageView;
  v3 = -[TUISystemInputAssistantPageView initWithFrame:](&v25, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[TUISystemInputAssistantPageView setScrollEnabled:](v3, "setScrollEnabled:", 1);
    v5 = objc_alloc(MEMORY[0x1E0DC3F10]);
    -[TUISystemInputAssistantPageView bounds](v4, "bounds");
    v6 = (void *)objc_msgSend(v5, "initWithFrame:");
    -[TUISystemInputAssistantPageView setClipView:](v4, "setClipView:", v6);

    -[TUISystemInputAssistantPageView clipView](v4, "clipView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUISystemInputAssistantPageView addSubview:](v4, "addSubview:", v7);

    v8 = objc_alloc(MEMORY[0x1E0DC3C28]);
    -[TUISystemInputAssistantPageView bounds](v4, "bounds");
    v9 = (void *)objc_msgSend(v8, "initWithFrame:");
    -[TUISystemInputAssistantPageView setScrollView:](v4, "setScrollView:", v9);

    -[TUISystemInputAssistantPageView clipView](v4, "clipView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUISystemInputAssistantPageView scrollView](v4, "scrollView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addSubview:", v11);

    -[TUISystemInputAssistantPageView scrollView](v4, "scrollView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPagingEnabled:", 1);

    -[TUISystemInputAssistantPageView scrollView](v4, "scrollView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setShowsVerticalScrollIndicator:", 0);

    -[TUISystemInputAssistantPageView scrollView](v4, "scrollView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setShowsHorizontalScrollIndicator:", 0);

    -[TUISystemInputAssistantPageView scrollView](v4, "scrollView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setDelegate:", v4);

    -[TUISystemInputAssistantPageView scrollView](v4, "scrollView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setClipsToBounds:", 0);

    -[TUISystemInputAssistantPageView clipView](v4, "clipView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setClipsToBounds:", 1);

    v18 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v19 = (void *)objc_msgSend(v18, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[TUISystemInputAssistantPageView setPrimaryContainerView:](v4, "setPrimaryContainerView:", v19);

    -[TUISystemInputAssistantPageView primaryContainerView](v4, "primaryContainerView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setAllowsGroupOpacity:", 0);

    -[TUISystemInputAssistantPageView scrollView](v4, "scrollView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUISystemInputAssistantPageView primaryContainerView](v4, "primaryContainerView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addSubview:", v23);

    -[TUISystemInputAssistantPageView setHidesExpandButton:](v4, "setHidesExpandButton:", 1);
    v4->_currentChevronStyle = 0;
    v4->_secondaryViewInitialized = 0;
  }
  return v4;
}

- (void)updateScrollEnabled
{
  void *v2;
  void *v3;
  _BOOL4 v5;
  int v6;
  _BOOL8 v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  id v14;

  v5 = -[TUISystemInputAssistantPageView scrollEnabled](self, "scrollEnabled");
  if (v5)
  {
    -[TUISystemInputAssistantPageView primaryView](self, "primaryView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v2, "isHidden") & 1) != 0)
    {
      v6 = 0;
      v7 = 0;
    }
    else
    {
      -[TUISystemInputAssistantPageView scrollView](self, "scrollView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "contentOffset");
      if (v8 <= 0.0)
      {
        v7 = !self->_hidesExpandButton;
        v6 = 1;
      }
      else
      {
        v6 = 1;
        v7 = 1;
      }
    }
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }
  -[TUISystemInputAssistantPageView scrollView](self, "scrollView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setScrollEnabled:", v7);

  if (v6)
  if (v5)

  -[TUISystemInputAssistantPageView primaryView](self, "primaryView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[TUISystemInputAssistantPageView scrollView](self, "scrollView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isScrollEnabled");

    if (v12)
    {
      -[TUISystemInputAssistantPageView scrollView](self, "scrollView");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      -[TUISystemInputAssistantPageView primaryContainerView](self, "primaryContainerView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addSubview:", v13);

    }
    else
    {
      -[TUISystemInputAssistantPageView primaryContainerView](self, "primaryContainerView");
      v14 = (id)objc_claimAutoreleasedReturnValue();
      -[TUISystemInputAssistantPageView addSubview:](self, "addSubview:", v14);
    }

  }
}

- (UIView)primaryView
{
  return self->_primaryView;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _BOOL8 v13;
  void *v14;
  double width;
  double height;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  void *expandButton;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  void *v60;
  double MaxX;
  void *v62;
  void *v63;
  void *v64;
  objc_super v65;
  CGRect v66;
  CGRect v67;

  self->_layoutIsDirty = 0;
  v65.receiver = self;
  v65.super_class = (Class)TUISystemInputAssistantPageView;
  -[TUISystemInputAssistantPageView layoutSubviews](&v65, sel_layoutSubviews);
  -[TUISystemInputAssistantPageView _contentSize](self, "_contentSize");
  v4 = v3;
  v6 = v5;
  -[TUISystemInputAssistantPageView scrollView](self, "scrollView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentSize");
  v9 = v8;
  v11 = v10;

  if (v4 != v9 || v6 != v11)
  {
    v13 = -[TUISystemInputAssistantPageView secondaryViewVisible](self, "secondaryViewVisible");
    -[TUISystemInputAssistantPageView scrollView](self, "scrollView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setContentSize:", v4, v6);

    -[TUISystemInputAssistantPageView setSecondaryViewVisible:](self, "setSecondaryViewVisible:", v13);
  }
  -[TUISystemInputAssistantPageView frame](self, "frame");
  width = v66.size.width;
  height = v66.size.height;
  v17 = CGRectGetHeight(v66);
  -[TUISystemInputAssistantPageView bounds](self, "bounds");
  v19 = v18;
  v21 = v20;
  v23 = v22 + 1200.0;
  -[TUISystemInputAssistantPageView clipView](self, "clipView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setFrame:", v19, -600.0, v21, v23);

  -[TUISystemInputAssistantPageView bounds](self, "bounds");
  v26 = v25;
  v28 = v27;
  v30 = v29;
  -[TUISystemInputAssistantPageView scrollView](self, "scrollView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setFrame:", v26, 600.0, v28, v30);

  -[TUISystemInputAssistantPageView primaryView](self, "primaryView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "isHidden");

  -[TUISystemInputAssistantPageView primaryContainerView](self, "primaryContainerView");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v34;
  if (v33)
  {
    objc_msgSend(v34, "setHidden:", 1);

    -[TUISystemInputAssistantPageView hidesExpandButton](self, "hidesExpandButton");
LABEL_9:
    -[TUISystemInputAssistantPageView expandButton](self, "expandButton");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "removeFromSuperview");

    self->_currentChevronStyle = 0;
    expandButton = self->_expandButton;
    self->_expandButton = 0;
    goto LABEL_11;
  }
  objc_msgSend(v34, "setHidden:", 0);

  v36 = *MEMORY[0x1E0C9D538];
  v37 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[TUISystemInputAssistantPageView primaryContainerView](self, "primaryContainerView");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setFrame:", v36, v37, width, height);

  -[TUISystemInputAssistantPageView primaryContainerView](self, "primaryContainerView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "frame");
  v41 = v40;
  v43 = v42;
  v45 = v44;
  v47 = v46;
  -[TUISystemInputAssistantPageView primaryView](self, "primaryView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setFrame:", v41, v43, v45, v47);

  if (-[TUISystemInputAssistantPageView hidesExpandButton](self, "hidesExpandButton"))
    goto LABEL_9;
  -[TUISystemInputAssistantPageView primaryView](self, "primaryView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "frame");
  UIRectInset();
  v53 = v52;
  v55 = v54;
  v57 = v56;
  v59 = v58;
  -[TUISystemInputAssistantPageView primaryView](self, "primaryView");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setFrame:", v53, v55, v57, v59);

  -[TUISystemInputAssistantPageView primaryView](self, "primaryView");
  expandButton = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(expandButton, "frame");
  MaxX = CGRectGetMaxX(v67);
  -[TUISystemInputAssistantPageView expandButton](self, "expandButton");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setFrame:", MaxX, 0.0, v17, height);

LABEL_11:
  -[TUISystemInputAssistantPageView secondaryView](self, "secondaryView");
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  if (v63)
  {
    -[TUISystemInputAssistantPageView secondaryView](self, "secondaryView");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setFrame:", width, 0.0, width, height);

  }
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (UIView)primaryContainerView
{
  return self->_primaryContainerView;
}

- (UIView)clipView
{
  return self->_clipView;
}

- (UIView)secondaryView
{
  return self->_secondaryView;
}

- (BOOL)hidesExpandButton
{
  return self->_hidesExpandButton;
}

- (TUIPredictionCellButton)expandButton
{
  return self->_expandButton;
}

- (CGSize)_contentSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  -[TUISystemInputAssistantPageView frame](self, "frame");
  v4 = v3 + v3;
  -[TUISystemInputAssistantPageView frame](self, "frame");
  v6 = v5;
  v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (BOOL)scrollEnabled
{
  return self->_scrollEnabled;
}

- (void)setHidesExpandButton:(BOOL)a3
{
  id v5;

  self->_hidesExpandButton = a3;
  -[TUISystemInputAssistantPageView updateScrollEnabled](self, "updateScrollEnabled");
  if (!a3)
    v5 = -[TUISystemInputAssistantPageView _createExpandButtonIfNecessary](self, "_createExpandButtonIfNecessary");
  -[TUISystemInputAssistantPageView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setNeedsLayout
{
  objc_super v2;

  self->_layoutIsDirty = 1;
  v2.receiver = self;
  v2.super_class = (Class)TUISystemInputAssistantPageView;
  -[TUISystemInputAssistantPageView setNeedsLayout](&v2, sel_setNeedsLayout);
}

- (void)setScrollView:(id)a3
{
  objc_storeStrong((id *)&self->_scrollView, a3);
}

- (void)setPrimaryView:(id)a3
{
  UIView *v4;
  UIView *primaryView;
  UIView *v6;
  void *v7;

  v4 = (UIView *)a3;
  -[UIView removeFromSuperview](self->_primaryView, "removeFromSuperview");
  primaryView = self->_primaryView;
  self->_primaryView = v4;
  v6 = v4;

  -[TUISystemInputAssistantPageView primaryContainerView](self, "primaryContainerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSubview:", v6);

  -[TUISystemInputAssistantPageView updateScrollEnabled](self, "updateScrollEnabled");
  -[TUISystemInputAssistantPageView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setPrimaryContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_primaryContainerView, a3);
}

- (void)setClipView:(id)a3
{
  objc_storeStrong((id *)&self->_clipView, a3);
}

- (void)setScrollEnabled:(BOOL)a3
{
  if (self->_scrollEnabled != a3)
  {
    self->_scrollEnabled = a3;
    -[TUISystemInputAssistantPageView updateScrollEnabled](self, "updateScrollEnabled");
  }
}

- (void)setPageViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_pageViewDelegate, a3);
}

- (void)_setRenderConfig:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TUISystemInputAssistantPageView;
  -[TUISystemInputAssistantPageView _setRenderConfig:](&v4, sel__setRenderConfig_, a3);
  -[TUISystemInputAssistantPageView _updateExpandButtonChevronImage](self, "_updateExpandButtonChevronImage");
}

- (void)_updateExpandButtonChevronImage
{
  unint64_t currentChevronStyle;
  void *v4;
  unint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  if (self->_expandButton)
  {
    if (-[TUISystemInputAssistantPageView _expandButtonVisible](self, "_expandButtonVisible"))
    {
      currentChevronStyle = self->_currentChevronStyle;
      -[TUISystemInputAssistantPageView _inheritedRenderConfig](self, "_inheritedRenderConfig");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[TUISystemInputAssistantPageView _expandChevronImageStyleForRenderConfig:](self, "_expandChevronImageStyleForRenderConfig:", v4);

      if (currentChevronStyle != v5)
      {
        -[TUISystemInputAssistantPageView _inheritedRenderConfig](self, "_inheritedRenderConfig");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        self->_currentChevronStyle = -[TUISystemInputAssistantPageView _expandChevronImageStyleForRenderConfig:](self, "_expandChevronImageStyleForRenderConfig:", v6);

        if (self->_currentChevronStyle == 1)
          objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.31372549, 0.333333333, 0.360784314, 1.0);
        else
          objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.8, 1.0);
        v17 = (id)objc_claimAutoreleasedReturnValue();
        if (self->_currentChevronStyle == 1)
          v7 = 1;
        else
          v7 = 2;
        v8 = (void *)MEMORY[0x1E0DC3870];
        objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "systemImageNamed:compatibleWithTraitCollection:", CFSTR("chevron.left"), v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[TUISystemInputAssistantPageView imageSymbolConfigurationForAssistantItem](self, "imageSymbolConfigurationForAssistantItem");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "imageWithConfiguration:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        -[TUIPredictionCellButton cellView](self->_expandButton, "cellView");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setImage:", v12);

        -[TUIPredictionCellButton cellView](self->_expandButton, "cellView");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[TUISystemInputAssistantPageView _inheritedRenderConfig](self, "_inheritedRenderConfig");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setRenderConfig:", v15);

        -[TUIPredictionCellButton cellView](self->_expandButton, "cellView");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setImageTintColor:", v17);

      }
    }
  }
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TUISystemInputAssistantPageView;
  -[TUISystemInputAssistantPageView didMoveToWindow](&v3, sel_didMoveToWindow);
  if (self->_layoutIsDirty)
    -[TUISystemInputAssistantPageView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[TUISystemInputAssistantPageView frame](self, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16.receiver = self;
  v16.super_class = (Class)TUISystemInputAssistantPageView;
  -[TUISystemInputAssistantPageView setFrame:](&v16, sel_setFrame_, x, y, width, height);
  -[TUISystemInputAssistantPageView _checkOldBounds:forContentOffsetChangeWithNewBounds:](self, "_checkOldBounds:forContentOffsetChangeWithNewBounds:", v9, v11, v13, v15, x, y, width, height);
}

- (void)_checkOldBounds:(CGRect)a3 forContentOffsetChangeWithNewBounds:(CGRect)a4
{
  BOOL v4;

  v4 = a3.size.width == a4.size.width && a3.size.height == a4.size.height;
  if (!v4 && self->_secondaryViewInitialized)
  {
    if (self->_secondaryView)
      -[TUISystemInputAssistantPageView setSecondaryViewVisible:force:withAnimationType:completion:](self, "setSecondaryViewVisible:force:withAnimationType:completion:", self->_secondaryViewVisible, a3.size.width != a4.size.width, 2, 0, a3.origin.x, a3.origin.y);
  }
}

- (void)setSecondaryView:(id)a3
{
  UIView *v5;
  UIView *secondaryView;
  void *v7;
  void *v8;
  void *v9;
  UIView *v10;

  v5 = (UIView *)a3;
  secondaryView = self->_secondaryView;
  v10 = v5;
  if (secondaryView != v5)
    goto LABEL_4;
  -[UIView superview](v5, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUISystemInputAssistantPageView scrollView](self, "scrollView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 != v8)
  {
    secondaryView = self->_secondaryView;
LABEL_4:
    -[UIView removeFromSuperview](secondaryView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_secondaryView, a3);
    -[TUISystemInputAssistantPageView scrollView](self, "scrollView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v10);

  }
  -[TUISystemInputAssistantPageView setNeedsLayout](self, "setNeedsLayout");

}

- (BOOL)_expandButtonVisible
{
  return !self->_hidesExpandButton;
}

- (unint64_t)_expandChevronImageStyleForRenderConfig:(id)a3
{
  if (objc_msgSend(a3, "lightKeyboard"))
    return 1;
  else
    return 2;
}

- (id)imageSymbolConfigurationForAssistantItem
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", *MEMORY[0x1E0DC4A88], -1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:", 4, 24.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "configurationByApplyingConfiguration:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_createExpandButtonIfNecessary
{
  TUIPredictionCellButton *v3;
  TUIPredictionCellButton *v4;
  TUIPredictionCellButton *expandButton;
  void *v6;
  void *v7;
  void *v8;

  if (!self->_expandButton && -[TUISystemInputAssistantPageView _expandButtonVisible](self, "_expandButtonVisible"))
  {
    v3 = [TUIPredictionCellButton alloc];
    v4 = -[TUIPredictionCellButton initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    expandButton = self->_expandButton;
    self->_expandButton = v4;

    -[TUIPredictionCellButton cellView](self->_expandButton, "cellView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setVisibleSeparatorEdges:", 2);

    -[TUIPredictionCellButton cellView](self->_expandButton, "cellView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSeparatorMargin:", 0.0);

    -[TUISystemInputAssistantPageView _updateExpandButtonChevronImage](self, "_updateExpandButtonChevronImage");
    -[TUISystemInputAssistantPageView primaryContainerView](self, "primaryContainerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", self->_expandButton);

  }
  return self->_expandButton;
}

- (void)setSecondaryViewVisible:(BOOL)a3
{
  -[TUISystemInputAssistantPageView setSecondaryViewVisible:animated:completion:](self, "setSecondaryViewVisible:animated:completion:", a3, 0, 0);
}

- (void)setSecondaryViewVisible:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  -[TUISystemInputAssistantPageView setSecondaryViewVisible:withAnimationType:completion:](self, "setSecondaryViewVisible:withAnimationType:completion:", a3, 2, a5);
}

- (void)setSecondaryViewVisible:(BOOL)a3 withAnimationType:(unint64_t)a4 completion:(id)a5
{
  -[TUISystemInputAssistantPageView setSecondaryViewVisible:force:withAnimationType:completion:](self, "setSecondaryViewVisible:force:withAnimationType:completion:", a3, 0, a4, a5);
}

- (void)setSecondaryViewVisible:(BOOL)a3 force:(BOOL)a4 withAnimationType:(unint64_t)a5 completion:(id)a6
{
  _BOOL4 v8;
  id v10;
  void (**v11)(_QWORD);
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void *v26;
  id v27;
  TUISystemInputAssistantPageView *v28;
  void (**v29)(_QWORD);
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  _QWORD aBlock[5];
  BOOL v35;

  v8 = a3;
  v10 = a6;
  if (a4 || !self->_secondaryViewInitialized || self->_secondaryViewVisible != v8)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __94__TUISystemInputAssistantPageView_setSecondaryViewVisible_force_withAnimationType_completion___block_invoke;
    aBlock[3] = &unk_1E24FC1D0;
    aBlock[4] = self;
    v35 = v8;
    v11 = (void (**)(_QWORD))_Block_copy(aBlock);
    v12 = _Block_copy(v11);
    v13 = _Block_copy(v10);
    if (v8)
    {
      -[TUISystemInputAssistantPageView primaryContainerView](self, "primaryContainerView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUISystemInputAssistantPageView secondaryView](self, "secondaryView");
    }
    else
    {
      -[TUISystemInputAssistantPageView secondaryView](self, "secondaryView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUISystemInputAssistantPageView primaryContainerView](self, "primaryContainerView");
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (a5 == 2)
    {
      objc_msgSend(v15, "frame");
      objc_msgSend(v14, "frame");
      objc_msgSend(v16, "setFrame:");
      objc_msgSend(v16, "setAlpha:", 0.0);
      v19 = MEMORY[0x1E0C809B0];
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __94__TUISystemInputAssistantPageView_setSecondaryViewVisible_force_withAnimationType_completion___block_invoke_2;
      v31[3] = &unk_1E24FC1F8;
      v20 = v14;
      v32 = v20;
      v33 = v16;
      v22 = _Block_copy(v31);

      v23 = v19;
      v24 = 3221225472;
      v25 = __94__TUISystemInputAssistantPageView_setSecondaryViewVisible_force_withAnimationType_completion___block_invoke_3;
      v26 = &unk_1E24FC220;
      v27 = v20;
      v28 = self;
      v29 = v11;
      v30 = v10;
      v21 = _Block_copy(&v23);

      v13 = v21;
      v12 = v22;
    }
    else if (!a5)
    {
      objc_msgSend(v14, "layer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "removeAllAnimations");

      objc_msgSend(v16, "layer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "removeAllAnimations");

      v11[2](v11);
LABEL_12:
      self->_secondaryViewInitialized = 1;
      self->_secondaryViewVisible = v8;

      goto LABEL_13;
    }
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v12, v13, 0.37, 0.0, 1.0, 1.0, v22, v23, v24, v25, v26);
    goto LABEL_12;
  }
LABEL_13:

}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  objc_super v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[TUISystemInputAssistantPageView bounds](self, "bounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v16.receiver = self;
  v16.super_class = (Class)TUISystemInputAssistantPageView;
  -[TUISystemInputAssistantPageView setBounds:](&v16, sel_setBounds_, x, y, width, height);
  -[TUISystemInputAssistantPageView _checkOldBounds:forContentOffsetChangeWithNewBounds:](self, "_checkOldBounds:forContentOffsetChangeWithNewBounds:", v9, v11, v13, v15, x, y, width, height);
}

- (void)scrollViewDidScroll:(id)a3
{
  double v4;
  double v5;
  double v6;
  _BOOL8 v7;
  double v8;
  id v9;

  objc_msgSend(a3, "contentOffset");
  v5 = v4;
  -[TUISystemInputAssistantPageView frame](self, "frame");
  if (v5 < v6)
  {
    v7 = 0;
    goto LABEL_4;
  }
  -[TUISystemInputAssistantPageView frame](self, "frame");
  v7 = v8 > 0.0;
  if (v8 <= 0.0)
  {
LABEL_4:
    if (v5 > 0.00000011920929)
      return;
  }
  -[TUISystemInputAssistantPageView updateScrollEnabled](self, "updateScrollEnabled");
  if (self->_secondaryViewVisible != v7)
  {
    self->_secondaryViewVisible = v7;
    -[TUISystemInputAssistantPageView pageViewDelegate](self, "pageViewDelegate");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "assistantPageView:didSwitchToSecondaryViewVisible:", self, v7);

  }
}

- (TUISystemInputAssistantPageViewDelegate)pageViewDelegate
{
  return (TUISystemInputAssistantPageViewDelegate *)objc_loadWeakRetained((id *)&self->_pageViewDelegate);
}

- (BOOL)secondaryViewVisible
{
  return self->_secondaryViewVisible;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_primaryContainerView, 0);
  objc_storeStrong((id *)&self->_clipView, 0);
  objc_destroyWeak((id *)&self->_pageViewDelegate);
  objc_storeStrong((id *)&self->_expandButton, 0);
  objc_storeStrong((id *)&self->_secondaryView, 0);
  objc_storeStrong((id *)&self->_primaryView, 0);
}

void __94__TUISystemInputAssistantPageView_setSecondaryViewVisible_force_withAnimationType_completion___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  id v5;

  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "frame");
    v3 = v2;
    v4 = 0.0;
  }
  else
  {
    v3 = *MEMORY[0x1E0C9D538];
    v4 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  }
  objc_msgSend(*(id *)(a1 + 32), "scrollView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContentOffset:", v3, v4);

}

uint64_t __94__TUISystemInputAssistantPageView_setSecondaryViewVisible_force_withAnimationType_completion___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 1.0);
}

uint64_t __94__TUISystemInputAssistantPageView_setSecondaryViewVisible_force_withAnimationType_completion___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(a1 + 40), "layoutSubviews");
  if ((_DWORD)a2)
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

@end
