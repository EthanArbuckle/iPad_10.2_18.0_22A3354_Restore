@implementation PRXPullDismissalScrollView

- (PRXPullDismissalScrollView)initWithFrame:(CGRect)a3
{
  PRXPullDismissalScrollView *v3;
  PRXPullDismissalScrollView *v4;
  UIView *v5;
  UIView *dismissableContentContainerView;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  PRXPullDismissalScrollView *v17;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  objc_super v33;
  _QWORD v34[8];

  v34[6] = *MEMORY[0x24BDAC8D0];
  v33.receiver = self;
  v33.super_class = (Class)PRXPullDismissalScrollView;
  v3 = -[PRXPullDismissalScrollView initWithFrame:](&v33, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PRXPullDismissalScrollView setContentInsetAdjustmentBehavior:](v3, "setContentInsetAdjustmentBehavior:", 2);
    -[PRXPullDismissalScrollView setKeyboardDismissMode:](v4, "setKeyboardDismissMode:", 1);
    -[PRXPullDismissalScrollView setPagingEnabled:](v4, "setPagingEnabled:", 1);
    -[PRXPullDismissalScrollView setClipsToBounds:](v4, "setClipsToBounds:", 0);
    -[PRXPullDismissalScrollView setShowsVerticalScrollIndicator:](v4, "setShowsVerticalScrollIndicator:", 0);
    -[PRXPullDismissalScrollView setShowsHorizontalScrollIndicator:](v4, "setShowsHorizontalScrollIndicator:", 0);
    -[PRXPullDismissalScrollView setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 1);
    -[PRXPullDismissalScrollView setAlwaysBounceVertical:](v4, "setAlwaysBounceVertical:", 1);
    v5 = (UIView *)objc_alloc_init(MEMORY[0x24BDF6F90]);
    dismissableContentContainerView = v4->_dismissableContentContainerView;
    v4->_dismissableContentContainerView = v5;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_dismissableContentContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PRXPullDismissalScrollView addSubview:](v4, "addSubview:", v4->_dismissableContentContainerView);
    -[PRXPullDismissalScrollView contentLayoutGuide](v4, "contentLayoutGuide");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXPullDismissalScrollView frameLayoutGuide](v4, "frameLayoutGuide");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x24BDD1628];
    -[UIView heightAnchor](v4->_dismissableContentContainerView, "heightAnchor");
    v31 = v7;
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "heightAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:multiplier:", v30, 1.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v29;
    -[UIView widthAnchor](v4->_dismissableContentContainerView, "widthAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "widthAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintEqualToAnchor:multiplier:", v27, 1.0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = v26;
    -[UIView bottomAnchor](v4->_dismissableContentContainerView, "bottomAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "bottomAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v23);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v34[2] = v21;
    -[UIView leadingAnchor](v4->_dismissableContentContainerView, "leadingAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "leadingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v19);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v34[3] = v8;
    -[UIView trailingAnchor](v4->_dismissableContentContainerView, "trailingAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "trailingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v34[4] = v11;
    -[PRXPullDismissalScrollView contentLayoutGuide](v4, "contentLayoutGuide");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "widthAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXPullDismissalScrollView widthAnchor](v4, "widthAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v34[5] = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "activateConstraints:", v16);

    v17 = v4;
  }

  return v4;
}

- (void)didMoveToWindow
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRXPullDismissalScrollView;
  -[PRXPullDismissalScrollView didMoveToWindow](&v3, sel_didMoveToWindow);
  self->_hasDimissed = 0;
}

- (void)updateConstraints
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  NSLayoutConstraint *v7;
  NSLayoutConstraint *contentHeightConstraint;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PRXPullDismissalScrollView;
  -[PRXPullDismissalScrollView updateConstraints](&v9, sel_updateConstraints);
  if (!self->_contentHeightConstraint)
  {
    -[PRXPullDismissalScrollView contentLayoutGuide](self, "contentLayoutGuide");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "heightAnchor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRXPullDismissalScrollView heightAnchor](self, "heightAnchor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 2.0;
    if (!self->_allowsPullToDismiss)
      v6 = 1.0;
    objc_msgSend(v4, "constraintEqualToAnchor:multiplier:", v5, v6);
    v7 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    contentHeightConstraint = self->_contentHeightConstraint;
    self->_contentHeightConstraint = v7;

    -[NSLayoutConstraint setActive:](self->_contentHeightConstraint, "setActive:", 1);
  }
}

- (void)layoutSubviews
{
  char v3;
  double v4;
  CGFloat v5;
  CGFloat v6;
  double v7;
  double v8;
  BOOL v9;
  double Height;
  objc_super v11;

  if ((-[PRXPullDismissalScrollView isDragging](self, "isDragging") & 1) != 0
    || -[PRXPullDismissalScrollView isDecelerating](self, "isDecelerating"))
  {
    -[PRXPullDismissalScrollView dismissalPercent](self, "dismissalPercent");
    v3 = 1;
    if (v4 >= 1.0)
      self->_hasDimissed = 1;
  }
  else
  {
    v3 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)PRXPullDismissalScrollView;
  -[PRXPullDismissalScrollView layoutSubviews](&v11, sel_layoutSubviews);
  -[PRXPullDismissalScrollView frame](self, "frame");
  v9 = self->_lastLayoutFrame.size.width == v7;
  if (self->_lastLayoutFrame.size.height != v8)
    v9 = 0;
  if ((v3 & 1) == 0 && !v9)
  {
    self->_lastLayoutFrame.origin.x = v5;
    self->_lastLayoutFrame.origin.y = v6;
    self->_lastLayoutFrame.size.width = v7;
    self->_lastLayoutFrame.size.height = v8;
    Height = 0.0;
    if (!self->_hasDimissed && self->_allowsPullToDismiss)
      Height = CGRectGetHeight(*(CGRect *)&v5);
    -[PRXPullDismissalScrollView setContentOffset:](self, "setContentOffset:", 0.0, Height);
  }
}

- (void)setAllowsPullToDismiss:(BOOL)a3
{
  NSLayoutConstraint *contentHeightConstraint;
  CGSize v5;

  if (self->_allowsPullToDismiss != a3)
  {
    self->_allowsPullToDismiss = a3;
    -[NSLayoutConstraint setActive:](self->_contentHeightConstraint, "setActive:", 0);
    contentHeightConstraint = self->_contentHeightConstraint;
    self->_contentHeightConstraint = 0;

    v5 = *(CGSize *)(MEMORY[0x24BDBF090] + 16);
    self->_lastLayoutFrame.origin = (CGPoint)*MEMORY[0x24BDBF090];
    self->_lastLayoutFrame.size = v5;
    -[PRXPullDismissalScrollView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (double)dismissalPercent
{
  double Height;
  double v4;
  double v5;
  CGRect v7;
  CGRect v8;

  if (!self->_allowsPullToDismiss)
    return 0.0;
  -[PRXPullDismissalScrollView frame](self, "frame");
  Height = CGRectGetHeight(v7);
  -[PRXPullDismissalScrollView contentOffset](self, "contentOffset");
  v5 = Height - v4;
  -[PRXPullDismissalScrollView frame](self, "frame");
  return v5 / CGRectGetHeight(v8);
}

- (BOOL)allowsPullToDismiss
{
  return self->_allowsPullToDismiss;
}

- (UIView)dismissableContentContainerView
{
  return self->_dismissableContentContainerView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissableContentContainerView, 0);
  objc_storeStrong((id *)&self->_contentHeightConstraint, 0);
}

@end
