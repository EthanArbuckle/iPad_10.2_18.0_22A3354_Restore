@implementation SBHPageManagementCellViewController

- (SBHPageManagementCellViewController)initWithListView:(id)a3 listBackgroundView:(id)a4 toggleButtonBackgroundView:(id)a5 folder:(id)a6 metrics:(SBHPageManagementCellMetrics *)a7 toggleButtonAllowed:(BOOL)a8
{
  id v15;
  id v16;
  id v17;
  SBHPageManagementCellViewController *v18;
  SBHPageManagementCellViewController *v19;
  __int128 v20;
  CGSize scaledListViewSize;
  CGSize fullListViewSize;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  SBHPageManagementListTapGestureRecognizer *v26;
  UIGestureRecognizer *tapGestureRecognizer;
  id v29;
  objc_super v30;

  v29 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v30.receiver = self;
  v30.super_class = (Class)SBHPageManagementCellViewController;
  v18 = -[SBHPageManagementCellViewController init](&v30, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_listView, a3);
    objc_storeStrong((id *)&v19->_listBackgroundView, a4);
    objc_storeStrong((id *)&v19->_toggleButtonBackgroundView, a5);
    objc_storeStrong((id *)&v19->_folder, a6);
    v20 = *(_OWORD *)&a7->foregroundInsets.bottom;
    fullListViewSize = a7->fullListViewSize;
    scaledListViewSize = a7->scaledListViewSize;
    *(_OWORD *)&v19->_metrics.foregroundInsets.top = *(_OWORD *)&a7->foregroundInsets.top;
    *(_OWORD *)&v19->_metrics.foregroundInsets.bottom = v20;
    v19->_metrics.fullListViewSize = fullListViewSize;
    v19->_metrics.scaledListViewSize = scaledListViewSize;
    v24 = *(_OWORD *)&a7->backgroundInsets.bottom;
    v23 = *(_OWORD *)&a7->listViewVerticalPositionAdjustment;
    v25 = *(_OWORD *)&a7->backgroundInsets.top;
    v19->_metrics.toggleButtonVerticalMargin = a7->toggleButtonVerticalMargin;
    *(_OWORD *)&v19->_metrics.backgroundInsets.bottom = v24;
    *(_OWORD *)&v19->_metrics.listViewVerticalPositionAdjustment = v23;
    *(_OWORD *)&v19->_metrics.backgroundInsets.top = v25;
    v19->_toggleButtonAllowed = a8;
    v26 = -[SBHPageManagementListTapGestureRecognizer initWithTarget:action:]([SBHPageManagementListTapGestureRecognizer alloc], "initWithTarget:action:", v19, sel_listViewTapped_);
    tapGestureRecognizer = v19->_tapGestureRecognizer;
    v19->_tapGestureRecognizer = &v26->super;

    -[UIGestureRecognizer setDelegate:](v19->_tapGestureRecognizer, "setDelegate:", v19);
  }

  return v19;
}

- (void)loadView
{
  void *v3;
  SBHPageManagementCellView *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 toggleButtonAllowed;
  __int128 v9;
  CGSize scaledListViewSize;
  __int128 v11;
  SBHPageManagementCellView *v12;
  _OWORD v13[7];
  double toggleButtonVerticalMargin;

  -[SBHPageManagementCellViewController listView](self, "listView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [SBHPageManagementCellView alloc];
  -[SBHPageManagementCellViewController listBackgroundView](self, "listBackgroundView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHPageManagementCellViewController toggleButtonBackgroundView](self, "toggleButtonBackgroundView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHPageManagementCellViewController folder](self, "folder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  toggleButtonAllowed = self->_toggleButtonAllowed;
  v9 = *(_OWORD *)&self->_metrics.backgroundInsets.bottom;
  v13[4] = *(_OWORD *)&self->_metrics.backgroundInsets.top;
  v13[5] = v9;
  v13[6] = *(_OWORD *)&self->_metrics.listViewVerticalPositionAdjustment;
  toggleButtonVerticalMargin = self->_metrics.toggleButtonVerticalMargin;
  scaledListViewSize = self->_metrics.scaledListViewSize;
  v13[0] = self->_metrics.fullListViewSize;
  v13[1] = scaledListViewSize;
  v11 = *(_OWORD *)&self->_metrics.foregroundInsets.bottom;
  v13[2] = *(_OWORD *)&self->_metrics.foregroundInsets.top;
  v13[3] = v11;
  v12 = -[SBHPageManagementCellView initWithListView:listBackgroundView:toggleButtonBackgroundView:folder:metrics:toggleButtonAllowed:](v4, "initWithListView:listBackgroundView:toggleButtonBackgroundView:folder:metrics:toggleButtonAllowed:", v3, v5, v6, v7, v13, toggleButtonAllowed);

  objc_msgSend(v3, "addGestureRecognizer:", self->_tapGestureRecognizer);
  -[SBHPageManagementCellViewController setView:](self, "setView:", v12);

}

- (void)listViewTapped:(id)a3
{
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  SBHPageManagementCellViewController *v14;
  uint64_t v15;
  int v16;
  void *v17;
  void *v18;
  char v19;
  unsigned int v20;
  id v21;
  CGPoint v22;
  CGRect v23;

  v21 = a3;
  -[SBHPageManagementCellViewController listBackgroundView](self, "listBackgroundView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "locationInView:", v4);
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "bounds");
  v22.x = v6;
  v22.y = v8;
  v9 = CGRectContainsPoint(v23, v22);
  -[SBHPageManagementCellViewController delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
    v12 = objc_msgSend(v10, "pageManagementCellViewControllerCanReceiveTap:", self);
  else
    v12 = 1;
  v13 = objc_msgSend(v21, "state");
  if ((unint64_t)(v13 - 1) < 2)
  {
    if (v11)
      v16 = objc_msgSend(v11, "pageManagementCellViewControllerShouldSuppressHighlight:", self) ^ 1;
    else
      v16 = 0;
    v20 = v12 & v16;
    if (v9)
      v15 = v20;
    else
      v15 = 0;
    v14 = self;
    goto LABEL_19;
  }
  if ((unint64_t)(v13 - 4) < 2)
  {
    v14 = self;
    v15 = 0;
LABEL_19:
    -[SBHPageManagementCellViewController setListHighlighted:](v14, "setListHighlighted:", v15);
    goto LABEL_20;
  }
  if (v13 == 3)
  {
    -[SBHPageManagementCellViewController setListHighlighted:](self, "setListHighlighted:", 0);
    -[SBHPageManagementCellViewController listView](self, "listView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "model");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isHidden");
    if ((v9 & v12) == 1 && (v19 & 1) == 0)
      objc_msgSend(v11, "pageManagementCellViewControllerDidReceiveTap:", self);

  }
LABEL_20:

}

- (BOOL)scalesListView
{
  void *v2;
  char v3;

  -[SBHPageManagementCellViewController pageManagementCellView](self, "pageManagementCellView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "scalesListView");

  return v3;
}

- (void)setScalesListView:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SBHPageManagementCellViewController pageManagementCellView](self, "pageManagementCellView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setScalesListView:", v3);

}

- (double)toggleButtonAlpha
{
  void *v2;
  double v3;
  double v4;

  -[SBHPageManagementCellViewController pageManagementCellView](self, "pageManagementCellView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "toggleButtonAlpha");
  v4 = v3;

  return v4;
}

- (void)setToggleButtonAlpha:(double)a3
{
  id v4;

  -[SBHPageManagementCellViewController pageManagementCellView](self, "pageManagementCellView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setToggleButtonAlpha:", a3);

}

- (id)listHighlightView
{
  void *v2;
  void *v3;

  -[SBHPageManagementCellViewController pageManagementCellView](self, "pageManagementCellView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "listHighlightView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setListHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SBHPageManagementCellViewController pageManagementCellView](self, "pageManagementCellView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setListHighlighted:", v3);

}

- (void)cancelGestures
{
  void *v3;
  id v4;

  -[SBHPageManagementCellViewController tapGestureRecognizer](self, "tapGestureRecognizer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", 0);
  objc_msgSend(v4, "setEnabled:", 1);
  -[SBHPageManagementCellViewController pageManagementCellView](self, "pageManagementCellView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setListHighlighted:", 0);

}

- (void)cleanUpListView
{
  id v3;

  -[SBIconListView removeGestureRecognizer:](self->_listView, "removeGestureRecognizer:", self->_tapGestureRecognizer);
  -[SBHPageManagementCellViewController pageManagementCellView](self, "pageManagementCellView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cleanUpListView");

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
  id v13;

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
    -[SBHPageManagementCellViewController pageManagementCellView](self, "pageManagementCellView");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setIconImageInfo:", v10, v9, v8, v7);

  }
}

- (CGRect)visibleBounds
{
  void *v2;
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
  double v13;
  double v14;
  CGRect result;

  -[SBHPageManagementCellViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (double)continuousCornerRadius
{
  return 0.0;
}

- (BOOL)isUserInteractionEnabled
{
  return 0;
}

- (UIView)snapshotView
{
  void *v3;
  double v4;
  double v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  SBIconListView *listView;
  _OWORD v12[3];

  -[SBHPageManagementCellViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHPageManagementCellViewController iconImageInfo](self, "iconImageInfo");
  v5 = v4;
  v6 = objc_alloc(MEMORY[0x1E0DC3F10]);
  -[MTMaterialView frame](self->_listBackgroundView, "frame");
  v7 = (void *)objc_msgSend(v6, "initWithFrame:", 0.0, 0.0);
  objc_msgSend(v7, "_setContinuousCornerRadius:", v5);
  objc_msgSend(v3, "backgroundViewForSnapshotForPageManagementCellViewController:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  objc_msgSend(v8, "setFrame:");
  objc_msgSend(v8, "_setContinuousCornerRadius:", v5);
  objc_msgSend(v7, "addSubview:", v8);
  -[SBIconListView snapshotView](self->_listView, "snapshotView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  listView = self->_listView;
  if (listView)
    -[SBIconListView transform](listView, "transform");
  else
    memset(v12, 0, sizeof(v12));
  objc_msgSend(v9, "setTransform:", v12);
  -[SBIconListView center](self->_listView, "center");
  objc_msgSend(v9, "setCenter:");
  objc_msgSend(v7, "addSubview:", v9);

  return (UIView *)v7;
}

- (CGPoint)snapshotViewCenter
{
  double v2;
  double v3;
  CGPoint result;

  -[MTMaterialView center](self->_listBackgroundView, "center");
  result.y = v3;
  result.x = v2;
  return result;
}

- (UIBezierPath)snapshotViewVisiblePath
{
  -[SBHPageManagementCellViewController iconImageInfo](self, "iconImageInfo");
  -[MTMaterialView frame](self->_listBackgroundView, "frame");
  return (UIBezierPath *)objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:");
}

- (BOOL)wantsCaptureOnlyBackgroundView
{
  void *v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  -[SBHPageManagementCellViewController listView](self, "listView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __69__SBHPageManagementCellViewController_wantsCaptureOnlyBackgroundView__block_invoke;
  v4[3] = &unk_1E8D88F80;
  v4[4] = &v5;
  objc_msgSend(v2, "enumerateIconViewsUsingBlock:", v4);

  LOBYTE(v2) = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return (char)v2;
}

void __69__SBHPageManagementCellViewController_wantsCaptureOnlyBackgroundView__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;

  objc_msgSend(a2, "backgroundViewGroupNameBase");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  -[SBHPageManagementCellViewController tapGestureRecognizer](self, "tapGestureRecognizer");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  return v6 == v5;
}

- (SBIconImageInfo)iconImageInfo
{
  return self;
}

- (BOOL)showsSquareCorners
{
  return self->_showsSquareCorners;
}

- (void)setShowsSquareCorners:(BOOL)a3
{
  self->_showsSquareCorners = a3;
}

- (BOOL)isEditing
{
  return self->_editing;
}

- (void)setEditing:(BOOL)a3
{
  self->_editing = a3;
}

- (SBIconListView)listView
{
  return self->_listView;
}

- (MTMaterialView)listBackgroundView
{
  return self->_listBackgroundView;
}

- (MTMaterialView)toggleButtonBackgroundView
{
  return self->_toggleButtonBackgroundView;
}

- (SBFolder)folder
{
  return self->_folder;
}

- (SBHPageManagementCellViewControllerDelegate)delegate
{
  return (SBHPageManagementCellViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)backgroundViewProvider
{
  return self->_backgroundViewProvider;
}

- (void)setBackgroundViewProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1136);
}

- (UIGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong(&self->_backgroundViewProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_folder, 0);
  objc_storeStrong((id *)&self->_toggleButtonBackgroundView, 0);
  objc_storeStrong((id *)&self->_listBackgroundView, 0);
  objc_storeStrong((id *)&self->_listView, 0);
}

@end
