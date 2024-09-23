@implementation PXDemoViewWidget

- (PXDemoViewWidget)init
{
  PXDemoViewWidget *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXDemoViewWidget;
  result = -[PXDemoViewWidget init](&v3, sel_init);
  if (result)
  {
    result->_isExpanded = 0;
    result->_height = 200.0;
    result->__contentSize = *(CGSize *)off_1E50B8810;
  }
  return result;
}

- (void)_loadViews
{
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;
  UIView *v9;
  UIView *containerView;
  double v11;
  double v12;
  double v13;
  double v14;
  UIView *v15;
  UIView *contentView;
  void *v17;
  UIView *v18;
  void *v19;
  UIView *v20;
  void *v21;
  void *v22;

  if (!self->__containerView)
  {
    -[PXDemoViewWidget _contentSize](self, "_contentSize");
    v5 = v4;
    v7 = v6;
    if (PXSizeIsNull())
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXDemoViewWidget.m"), 49, CFSTR("invalid content size"));

    }
    v8 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v9 = (UIView *)objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v5, v7);
    containerView = self->__containerView;
    self->__containerView = v9;

    -[PXDemoViewWidget _contentViewFrameForSize:](self, "_contentViewFrameForSize:", v5, v7);
    v15 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v11, v12, v13, v14);
    contentView = self->__contentView;
    self->__contentView = v15;

    -[UIView addSubview:](self->__containerView, "addSubview:", self->__contentView);
    -[UIView layer](self->__contentView, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setCornerRadius:", 5.0);

    v18 = self->__contentView;
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__handleTapGestureRecognizer_);
    -[UIView addGestureRecognizer:](v18, "addGestureRecognizer:", v19);

    v20 = self->__contentView;
    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39C8]), "initWithTarget:action:", self, sel__handleLongPressGestureRecognizer_);
    -[UIView addGestureRecognizer:](v20, "addGestureRecognizer:", v21);

    -[PXDemoViewWidget _updateContentViewColor](self, "_updateContentViewColor");
  }
}

- (void)_handleTapGestureRecognizer:(id)a3
{
  void *v4;
  PXDemoViewWidgetUIViewController *v5;

  if (objc_msgSend(a3, "state") == 3)
  {
    v5 = objc_alloc_init(PXDemoViewWidgetUIViewController);
    -[PXDemoViewWidget widgetDelegate](self, "widgetDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "widget:transitionToViewController:withTransitionType:", self, v5, 1);

  }
}

- (void)_handleLongPressGestureRecognizer:(id)a3
{
  id v4;

  if (objc_msgSend(a3, "state") == 3)
  {
    self->_isExpanded ^= 1u;
    -[PXDemoViewWidget widgetDelegate](self, "widgetDelegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "widgetLocalizedDisclosureTitleDidChange:", self);

  }
}

- (CGRect)_contentViewFrameForSize:(CGSize)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  -[PXDemoViewWidget spec](self, "spec");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentGuideInsets");

  -[PXDemoViewWidget _containerView](self, "_containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");

  PXEdgeInsetsInsetRect();
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (void)_updateContentViewColor
{
  uint64_t v3;
  void *v4;
  id v5;

  if (-[PXDemoViewWidget _didLoadContent](self, "_didLoadContent"))
  {
    if (-[PXDemoViewWidget _animationCount](self, "_animationCount"))
      objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "purpleColor");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "yellowColor");
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v5 = (id)v3;
  -[PXDemoViewWidget _contentView](self, "_contentView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v5);

}

- (void)_setContentViewAnchoringType:(int64_t)a3
{
  id v4;

  if (self->_contentViewAnchoringType != a3)
  {
    self->_contentViewAnchoringType = a3;
    -[PXDemoViewWidget widgetDelegate](self, "widgetDelegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "widgetInvalidateContentViewAnchoringType:", self);

  }
}

- (void)_setDidLoadContent:(BOOL)a3
{
  if (self->__didLoadContent != a3)
  {
    self->__didLoadContent = a3;
    -[PXDemoViewWidget _updateContentViewColor](self, "_updateContentViewColor");
  }
}

- (void)_setAnimationCount:(int64_t)a3
{
  if (self->__animationCount != a3)
  {
    self->__animationCount = a3;
    -[PXDemoViewWidget _updateContentViewColor](self, "_updateContentViewColor");
  }
}

- (void)setSpec:(id)a3
{
  PXWidgetSpec *v5;
  void *v6;
  PXWidgetSpec *v7;

  v5 = (PXWidgetSpec *)a3;
  if (self->_spec != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_spec, a3);
    -[PXDemoViewWidget widgetDelegate](self, "widgetDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "widgetPreferredContentHeightForWidthDidChange:", self);

    v5 = v7;
  }

}

- (BOOL)hasContentForCurrentInput
{
  void *v2;
  char v3;

  +[PXPhotosDetailsSettings sharedInstance](PXPhotosDetailsSettings, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "showDemoViewWidget");

  return v3;
}

- (double)preferredContentHeightForWidth:(double)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;

  -[PXDemoViewWidget spec](self, "spec", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentGuideInsets");
  v6 = v5;
  v8 = v7;

  return v8 + v6 + self->_height;
}

- (void)loadContentData
{
  -[PXDemoViewWidget _setDidLoadContent:](self, "_setDidLoadContent:", 1);
}

- (PXAnonymousView)contentView
{
  -[PXDemoViewWidget _loadViews](self, "_loadViews");
  return (PXAnonymousView *)-[PXDemoViewWidget _containerView](self, "_containerView");
}

- (void)contentViewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[5];
  _QWORD v17[9];

  height = a3.height;
  width = a3.width;
  v7 = a4;
  -[PXDemoViewWidget _contentViewFrameForSize:](self, "_contentViewFrameForSize:", width, height);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[PXDemoViewWidget _setAnimationCount:](self, "_setAnimationCount:", -[PXDemoViewWidget _animationCount](self, "_animationCount") + 1);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __78__PXDemoViewWidget_contentViewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v17[3] = &unk_1E51490B0;
  v17[4] = self;
  v17[5] = v9;
  v17[6] = v11;
  v17[7] = v13;
  v17[8] = v15;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __78__PXDemoViewWidget_contentViewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v16[3] = &unk_1E5149198;
  v16[4] = self;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v17, v16);

}

- (NSString)localizedTitle
{
  return (NSString *)CFSTR("Demo View");
}

- (NSString)localizedDisclosureTitle
{
  if (self->_isExpanded)
    return (NSString *)CFSTR("Show Less");
  else
    return (NSString *)CFSTR("Show More");
}

- (void)userDidSelectDisclosureControl
{
  _BOOL4 v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  PXDemoViewWidget *v8;

  v3 = !self->_isExpanded;
  self->_isExpanded ^= 1u;
  self->_height = self->_height + dbl_1A7C0C3B0[v3];
  -[PXDemoViewWidget _setContentViewAnchoringType:](self, "_setContentViewAnchoringType:", 1);
  -[PXDemoViewWidget widgetDelegate](self, "widgetDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__PXDemoViewWidget_userDidSelectDisclosureControl__block_invoke;
  v6[3] = &unk_1E5148D08;
  v7 = v4;
  v8 = self;
  v5 = v4;
  objc_msgSend(v5, "widget:animateChanges:withAnimationOptions:", self, v6, 0);

}

- (PXWidgetDelegate)widgetDelegate
{
  return (PXWidgetDelegate *)objc_loadWeakRetained((id *)&self->_widgetDelegate);
}

- (void)setWidgetDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_widgetDelegate, a3);
}

- (PXWidgetSpec)spec
{
  return self->_spec;
}

- (int64_t)contentViewAnchoringType
{
  return self->_contentViewAnchoringType;
}

- (UIView)_containerView
{
  return self->__containerView;
}

- (UIView)_contentView
{
  return self->__contentView;
}

- (CGSize)_contentSize
{
  double width;
  double height;
  CGSize result;

  width = self->__contentSize.width;
  height = self->__contentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)_setContentSize:(CGSize)a3
{
  self->__contentSize = a3;
}

- (BOOL)_didLoadContent
{
  return self->__didLoadContent;
}

- (int64_t)_animationCount
{
  return self->__animationCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__contentView, 0);
  objc_storeStrong((id *)&self->__containerView, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_destroyWeak((id *)&self->_widgetDelegate);
}

uint64_t __50__PXDemoViewWidget_userDidSelectDisclosureControl__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "widgetLocalizedDisclosureTitleDidChange:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "widgetPreferredContentHeightForWidthDidChange:", *(_QWORD *)(a1 + 40));
}

void __78__PXDemoViewWidget_contentViewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_contentView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

}

uint64_t __78__PXDemoViewWidget_contentViewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setAnimationCount:", objc_msgSend(*(id *)(a1 + 32), "_animationCount") - 1);
}

@end
