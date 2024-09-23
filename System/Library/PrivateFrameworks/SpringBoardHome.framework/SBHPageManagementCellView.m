@implementation SBHPageManagementCellView

- (SBHPageManagementCellView)initWithListView:(id)a3 listBackgroundView:(id)a4 toggleButtonBackgroundView:(id)a5 folder:(id)a6 metrics:(SBHPageManagementCellMetrics *)a7 toggleButtonAllowed:(BOOL)a8
{
  _BOOL4 v8;
  id v15;
  id v16;
  id v17;
  id v18;
  SBHPageManagementCellView *v19;
  SBHPageManagementCellView *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  CGSize scaledListViewSize;
  CGSize fullListViewSize;
  __int128 v26;
  void *v27;
  int v28;
  UIView *v29;
  UIView *listHighlightView;
  UIView *v31;
  void *v32;
  void *v33;
  double v34;
  SBHPageManagementCheckbox *v35;
  uint64_t v36;
  SBHPageManagementCheckbox *toggleButton;
  SBHPageManagementCheckbox *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v43;
  objc_super v44;

  v8 = a8;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v44.receiver = self;
  v44.super_class = (Class)SBHPageManagementCellView;
  v19 = -[SBHPageManagementCellView init](&v44, sel_init);
  v20 = v19;
  if (v19)
  {
    v43 = v17;
    objc_storeStrong((id *)&v19->_listView, a3);
    objc_storeStrong((id *)&v20->_listBackgroundView, a4);
    objc_storeStrong((id *)&v20->_folder, a6);
    v20->_scalesListView = 1;
    v22 = *(_OWORD *)&a7->backgroundInsets.bottom;
    v21 = *(_OWORD *)&a7->listViewVerticalPositionAdjustment;
    v23 = *(_OWORD *)&a7->backgroundInsets.top;
    v20->_metrics.toggleButtonVerticalMargin = a7->toggleButtonVerticalMargin;
    *(_OWORD *)&v20->_metrics.backgroundInsets.bottom = v22;
    *(_OWORD *)&v20->_metrics.listViewVerticalPositionAdjustment = v21;
    *(_OWORD *)&v20->_metrics.backgroundInsets.top = v23;
    fullListViewSize = a7->fullListViewSize;
    scaledListViewSize = a7->scaledListViewSize;
    v26 = *(_OWORD *)&a7->foregroundInsets.bottom;
    *(_OWORD *)&v20->_metrics.foregroundInsets.top = *(_OWORD *)&a7->foregroundInsets.top;
    *(_OWORD *)&v20->_metrics.foregroundInsets.bottom = v26;
    v20->_metrics.fullListViewSize = fullListViewSize;
    v20->_metrics.scaledListViewSize = scaledListViewSize;
    if (v16)
      -[SBHPageManagementCellView addSubview:](v20, "addSubview:", v16);
    objc_msgSend(v15, "model");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "isHidden");
    v29 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    listHighlightView = v20->_listHighlightView;
    v20->_listHighlightView = v29;

    v31 = v20->_listHighlightView;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.274509804, 1.0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v31, "setBackgroundColor:", v32);

    -[UIView layer](v20->_listHighlightView, "layer");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setCompositingFilter:", *MEMORY[0x1E0CD2BD0]);

    -[UIView setAlpha:](v20->_listHighlightView, "setAlpha:", 0.0);
    -[SBHPageManagementCellView addSubview:](v20, "addSubview:", v20->_listHighlightView);
    if (v15)
    {
      v34 = 0.5;
      if (!v28)
        v34 = 1.0;
      objc_msgSend(v15, "setAlpha:", v34);
      -[SBHPageManagementCellView addSubview:](v20, "addSubview:", v15);
    }
    if (v8)
    {
      v35 = [SBHPageManagementCheckbox alloc];
      v36 = -[SBHPageManagementCheckbox initWithFrame:checkboxDiameter:backgroundView:](v35, "initWithFrame:checkboxDiameter:backgroundView:", v43, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24), a7->toggleButtonDiameter);
      toggleButton = v20->_toggleButton;
      v20->_toggleButton = (SBHPageManagementCheckbox *)v36;

      -[SBHPageManagementCheckbox setSelected:animated:](v20->_toggleButton, "setSelected:animated:", v28 ^ 1u, 0);
      v38 = v20->_toggleButton;
      if ((v28 & 1) != 0)
        v39 = 1;
      else
        v39 = objc_msgSend(v18, "hasMultipleVisibleNonTrailingEmptyLists");
      -[SBHPageManagementCheckbox setEnabled:](v38, "setEnabled:", v39);
      -[SBHPageManagementCheckbox setHidden:](v20->_toggleButton, "setHidden:", objc_msgSend(v18, "isTrailingEmptyList:", v27));
      -[SBHPageManagementCheckbox addTarget:action:forControlEvents:](v20->_toggleButton, "addTarget:action:forControlEvents:", v20, sel__togglePageHidden_, 0x2000);
      -[SBHPageManagementCellView addSubview:](v20, "addSubview:", v20->_toggleButton);
    }
    -[SBHPageManagementCellView layer](v20, "layer");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setAllowsGroupBlending:", 0);

    -[SBHPageManagementCellView setAutoresizesSubviews:](v20, "setAutoresizesSubviews:", 0);
    objc_msgSend(v18, "addFolderObserver:", v20);
    objc_msgSend(v15, "model");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "addListObserver:", v20);

    -[SBHPageManagementCellView setAccessibilityIdentifier:](v20, "setAccessibilityIdentifier:", CFSTR("page container"));
    v17 = v43;
  }

  return v20;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  uint64_t v5;
  uint64_t v6;
  SBHPageManagementCellMetrics *p_metrics;
  double toggleButtonDiameter;
  double v9;
  double listViewVerticalPositionAdjustment;
  double width;
  double height;
  double v13;
  double v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  double toggleButtonVerticalMargin;
  CGFloat rect;
  _QWORD v33[4];
  id v34;
  id v35;
  CGFloat v36;
  CGFloat v37;
  uint64_t v38;
  uint64_t v39;
  CGAffineTransform v40;
  CGAffineTransform v41;
  CGRect slice;
  CGRect remainder;
  objc_super v44;
  CGRect v45;
  CGRect v46;

  v44.receiver = self;
  v44.super_class = (Class)SBHPageManagementCellView;
  -[SBHPageManagementCellView layoutSubviews](&v44, sel_layoutSubviews);
  -[SBHPageManagementCellView iconImageInfo](self, "iconImageInfo");
  v4 = v3;
  v29 = v6;
  v30 = v5;
  p_metrics = &self->_metrics;
  toggleButtonDiameter = self->_metrics.toggleButtonDiameter;
  toggleButtonVerticalMargin = self->_metrics.toggleButtonVerticalMargin;
  rect = v9;
  if (-[SBHPageManagementCellView scalesListView](self, "scalesListView"))
  {
    listViewVerticalPositionAdjustment = self->_metrics.listViewVerticalPositionAdjustment;
    width = p_metrics->fullListViewSize.width;
    height = self->_metrics.fullListViewSize.height;
    v14 = self->_metrics.scaledListViewSize.width;
    v13 = self->_metrics.scaledListViewSize.height;
  }
  else
  {
    width = p_metrics->fullListViewSize.width;
    height = self->_metrics.fullListViewSize.height;
    listViewVerticalPositionAdjustment = 0.0;
    v13 = height;
    v14 = p_metrics->fullListViewSize.width;
  }
  memset(&remainder, 0, sizeof(remainder));
  memset(&slice, 0, sizeof(slice));
  v45.origin.x = 0.0;
  v45.origin.y = 0.0;
  v45.size.width = v4;
  v45.size.height = rect;
  CGRectDivide(v45, &slice, &remainder, toggleButtonDiameter + toggleButtonVerticalMargin, CGRectMaxYEdge);
  if (-[SBHPageManagementCellView hasCleanedUpListView](self, "hasCleanedUpListView"))
  {
    v15 = 0;
  }
  else
  {
    -[SBHPageManagementCellView listView](self, "listView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  memset(&v41, 0, sizeof(v41));
  CGAffineTransformMakeScale(&v41, v14 / width, v13 / height);
  v16 = v14 * 0.5 + (CGRectGetWidth(remainder) - v14) * 0.5;
  objc_msgSend(v15, "setBounds:", 0.0, 0.0, width, height);
  objc_msgSend(v15, "setCenter:", v16, listViewVerticalPositionAdjustment + v13 * 0.5);
  v40 = v41;
  objc_msgSend(v15, "setTransform:", &v40);
  -[SBHPageManagementCellView listBackgroundView](self, "listBackgroundView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = remainder.size.width;
  v19 = remainder.size.height;
  UIRectGetCenter();
  v21 = v20;
  v23 = v22;
  objc_msgSend(v17, "setBounds:", 0.0, 0.0, v18, v19);
  objc_msgSend(v17, "setCenter:", v21, v23);
  -[SBHPageManagementCellView listHighlightView](self, "listHighlightView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setBounds:", 0.0, 0.0, v18, v19);
  objc_msgSend(v24, "setCenter:", v21, v23);
  v25 = (void *)MEMORY[0x1E0DC3F10];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __43__SBHPageManagementCellView_layoutSubviews__block_invoke;
  v33[3] = &unk_1E8D87660;
  v36 = v4;
  v37 = rect;
  v38 = v30;
  v39 = v29;
  v34 = v17;
  v35 = v24;
  v26 = v24;
  v27 = v17;
  objc_msgSend(v25, "performWithoutAnimation:", v33);
  -[SBHPageManagementCellView toggleButton](self, "toggleButton");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setBounds:", 0.0, 0.0, toggleButtonDiameter, toggleButtonDiameter);
  v46.origin.x = 0.0;
  v46.origin.y = 0.0;
  v46.size.width = v18;
  v46.size.height = v19;
  objc_msgSend(v28, "setCenter:", v21, toggleButtonDiameter * 0.5 + toggleButtonVerticalMargin + v23 + CGRectGetHeight(v46) * 0.5);

}

uint64_t __43__SBHPageManagementCellView_layoutSubviews__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_setContinuousCornerRadius:", *(double *)(a1 + 72));
  return objc_msgSend(*(id *)(a1 + 40), "_setContinuousCornerRadius:", *(double *)(a1 + 72));
}

- (void)setScalesListView:(BOOL)a3
{
  if (self->_scalesListView != a3)
  {
    self->_scalesListView = a3;
    -[SBHPageManagementCellView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setToggleButtonAlpha:(double)a3
{
  id v4;

  -[SBHPageManagementCellView toggleButton](self, "toggleButton");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlpha:", a3);

}

- (void)setIconImageInfo:(SBIconImageInfo *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  SBIconImageInfo *p_iconImageInfo;

  v7 = v6;
  v8 = v5;
  v9 = v4;
  v10 = v3;
  p_iconImageInfo = &self->_iconImageInfo;
  if (!SBIconImageInfoEqualToIconImageInfo(v3, v4, v5, v6, self->_iconImageInfo.size.width, self->_iconImageInfo.size.height, self->_iconImageInfo.scale, self->_iconImageInfo.continuousCornerRadius))
  {
    p_iconImageInfo->size.width = v10;
    p_iconImageInfo->size.height = v9;
    p_iconImageInfo->scale = v8;
    p_iconImageInfo->continuousCornerRadius = v7;
    -[SBHPageManagementCellView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setListHighlighted:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  if (self->_listHighlighted != a3)
  {
    v3 = a3;
    self->_listHighlighted = a3;
    -[SBHPageManagementCellView listHighlightView](self, "listHighlightView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v3)
    {
      objc_msgSend(v4, "setAlpha:", 0.5);
    }
    else
    {
      v6 = (void *)MEMORY[0x1E0DC3F10];
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __48__SBHPageManagementCellView_setListHighlighted___block_invoke;
      v7[3] = &unk_1E8D84C50;
      v8 = v4;
      objc_msgSend(v6, "animateWithDuration:delay:options:animations:completion:", 2, v7, 0, 0.2, 0.0);

    }
  }
}

uint64_t __48__SBHPageManagementCellView_setListHighlighted___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

- (void)cleanUpListView
{
  void *v3;
  __int128 v4;
  _OWORD v5[3];

  -[SBHPageManagementCellView listView](self, "listView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v5[0] = *MEMORY[0x1E0C9BAA8];
  v5[1] = v4;
  v5[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v3, "setTransform:", v5);
  -[SBHPageManagementCellView setHasCleanedUpListView:](self, "setHasCleanedUpListView:", 1);

}

- (void)_togglePageHidden:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  uint64_t v7;
  void *v8;
  id v9;

  -[SBHPageManagementCellView listView](self, "listView", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "model");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHPageManagementCellView folder](self, "folder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasMultipleVisibleNonTrailingEmptyLists");
  v7 = v6 & ~objc_msgSend(v4, "isHidden");
  objc_msgSend(v4, "setHidden:", v7);
  if ((_DWORD)v7 == 1)
  {
    objc_msgSend(MEMORY[0x1E0DA9D78], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "emitEvent:", 57);

  }
}

- (void)iconListHiddenDidChange:(id)a3
{
  int v4;
  void *v5;
  double v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  id v14;
  double v15;

  v4 = objc_msgSend(a3, "isHidden");
  -[SBHPageManagementCellView listView](self, "listView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 1.0;
  if (v4)
    v6 = 0.5;
  v7 = (void *)MEMORY[0x1E0DC3F10];
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __53__SBHPageManagementCellView_iconListHiddenDidChange___block_invoke;
  v13 = &unk_1E8D84C78;
  v14 = v5;
  v15 = v6;
  v8 = v5;
  objc_msgSend(v7, "animateWithDuration:delay:options:animations:completion:", 2, &v10, 0, 0.3, 0.0);
  -[SBHPageManagementCellView toggleButton](self, "toggleButton", v10, v11, v12, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSelected:", v4 ^ 1u);

}

uint64_t __53__SBHPageManagementCellView_iconListHiddenDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 40));
}

- (void)folder:(id)a3 listHiddenDidChange:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  unsigned int v9;
  id v10;

  v5 = a3;
  -[SBHPageManagementCellView toggleButton](self, "toggleButton");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[SBHPageManagementCellView listView](self, "listView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "model");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isHidden");
  v9 = objc_msgSend(v5, "hasMultipleVisibleNonTrailingEmptyLists");

  objc_msgSend(v10, "setEnabled:", v8 | v9);
}

- (SBIconListView)listView
{
  return self->_listView;
}

- (MTMaterialView)listBackgroundView
{
  return self->_listBackgroundView;
}

- (UIView)listHighlightView
{
  return self->_listHighlightView;
}

- (MTMaterialView)toggleButtonBackgroundView
{
  return self->_toggleButtonBackgroundView;
}

- (SBFolder)folder
{
  return self->_folder;
}

- (SBIconImageInfo)iconImageInfo
{
  return self;
}

- (BOOL)scalesListView
{
  return self->_scalesListView;
}

- (SBHPageManagementCheckbox)toggleButton
{
  return self->_toggleButton;
}

- (BOOL)isListHighlighted
{
  return self->_listHighlighted;
}

- (BOOL)hasCleanedUpListView
{
  return self->_hasCleanedUpListView;
}

- (void)setHasCleanedUpListView:(BOOL)a3
{
  self->_hasCleanedUpListView = a3;
}

- (double)toggleButtonAlpha
{
  return self->_toggleButtonAlpha;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toggleButton, 0);
  objc_storeStrong((id *)&self->_folder, 0);
  objc_storeStrong((id *)&self->_toggleButtonBackgroundView, 0);
  objc_storeStrong((id *)&self->_listHighlightView, 0);
  objc_storeStrong((id *)&self->_listBackgroundView, 0);
  objc_storeStrong((id *)&self->_listView, 0);
}

@end
