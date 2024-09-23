@implementation PXCMMPosterUIView

- (PXCMMPosterUIView)initWithFrame:(CGRect)a3
{
  PXCMMPosterUIView *v3;
  void *v4;
  PXCMMPosterHeaderView *v5;
  PXCMMPosterHeaderView *headerView;
  PXCMMPosterBannerView *v7;
  uint64_t v8;
  PXCMMPosterBannerView *bannerView;
  uint64_t v10;
  PXUpdater *updater;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PXCMMPosterUIView;
  v3 = -[PXCMMPosterUIView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCMMPosterUIView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    v3->_bannerHeadlineBoldRange = (_NSRange)xmmword_1A7C0C330;
    v3->_cornersToRound = -1;
    v5 = -[PXCMMPosterHeaderView initWithPresentationStyle:]([PXCMMPosterHeaderView alloc], "initWithPresentationStyle:", 0);
    headerView = v3->_headerView;
    v3->_headerView = v5;

    -[PXCMMPosterUIView addSubview:](v3, "addSubview:", v3->_headerView);
    v3->_needsBannerView = 1;
    v7 = [PXCMMPosterBannerView alloc];
    v8 = -[PXCMMPosterBannerView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    bannerView = v3->_bannerView;
    v3->_bannerView = (PXCMMPosterBannerView *)v8;

    -[PXCMMPosterUIView addSubview:](v3, "addSubview:", v3->_bannerView);
    v3->_actionButtonType = 0;
    v10 = objc_msgSend(objc_alloc((Class)off_1E50B5E00), "initWithTarget:", v3);
    updater = v3->_updater;
    v3->_updater = (PXUpdater *)v10;

    -[PXUpdater setNeedsUpdateSelector:](v3->_updater, "setNeedsUpdateSelector:", sel_setNeedsLayout);
    -[PXUpdater addUpdateSelector:](v3->_updater, "addUpdateSelector:", sel__updateBannerView);
    -[PXUpdater addUpdateSelector:](v3->_updater, "addUpdateSelector:", sel__updateBannerTitles);
    -[PXUpdater addUpdateSelector:](v3->_updater, "addUpdateSelector:", sel__updateBannerActionButton);
    -[PXUpdater addUpdateSelector:](v3->_updater, "addUpdateSelector:", sel__updateCorners);
    -[PXUpdater setNeedsUpdateOf:](v3->_updater, "setNeedsUpdateOf:", sel__updateBannerActionButton);
  }
  return v3;
}

- (NSString)locationString
{
  void *v2;
  void *v3;

  -[PXCMMPosterHeaderView viewModel](self->_headerView, "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setLocationString:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[PXCMMPosterHeaderView viewModel](self->_headerView, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__PXCMMPosterUIView_setLocationString___block_invoke;
  v7[3] = &unk_1E513D060;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performChanges:", v7);

}

- (NSString)dateString
{
  void *v2;
  void *v3;

  -[PXCMMPosterHeaderView viewModel](self->_headerView, "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subtitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setDateString:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[PXCMMPosterHeaderView viewModel](self->_headerView, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __35__PXCMMPosterUIView_setDateString___block_invoke;
  v7[3] = &unk_1E513D060;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performChanges:", v7);

}

- (NSString)statusString
{
  void *v2;
  void *v3;

  -[PXCMMPosterHeaderView viewModel](self->_headerView, "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "statusString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setStatusString:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[PXCMMPosterHeaderView viewModel](self->_headerView, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__PXCMMPosterUIView_setStatusString___block_invoke;
  v7[3] = &unk_1E513D060;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "performChanges:", v7);

}

- (void)setAsset:(id)a3 mediaProvider:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[PXCMMPosterHeaderView viewModel](self->_headerView, "viewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __44__PXCMMPosterUIView_setAsset_mediaProvider___block_invoke;
  v11[3] = &unk_1E5126488;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "performChanges:", v11);

}

- (void)setBannerHeadline:(id)a3
{
  -[PXCMMPosterUIView setBannerHeadline:boldRange:](self, "setBannerHeadline:boldRange:", a3, 0x7FFFFFFFFFFFFFFFLL, 0);
}

- (void)setBannerHeadline:(id)a3 boldRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  NSString *v7;
  NSString *v8;
  _BOOL4 v9;
  NSString *v11;
  NSString *bannerHeadline;
  NSString *v13;

  length = a4.length;
  location = a4.location;
  v13 = (NSString *)a3;
  v7 = self->_bannerHeadline;
  if (v7 == v13)
  {

  }
  else
  {
    v8 = v7;
    v9 = -[NSString isEqualToString:](v7, "isEqualToString:", v13);

    if (!v9)
    {
LABEL_9:
      v11 = (NSString *)-[NSString copy](v13, "copy");
      bannerHeadline = self->_bannerHeadline;
      self->_bannerHeadline = v11;

      self->_bannerHeadlineBoldRange.location = location;
      self->_bannerHeadlineBoldRange.length = length;
      -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updateBannerTitles);
      goto LABEL_10;
    }
  }
  if (self->_bannerHeadlineBoldRange.location != location || self->_bannerHeadlineBoldRange.length != length)
    goto LABEL_9;
LABEL_10:

}

- (void)setBannerSubheadline:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *bannerSubheadline;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_bannerSubheadline;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v4, "isEqualToString:", v8);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      bannerSubheadline = self->_bannerSubheadline;
      self->_bannerSubheadline = v6;

      -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updateBannerTitles);
    }
  }

}

- (void)setTotalCount:(int64_t)a3
{
  if (self->_totalCount != a3)
    self->_totalCount = a3;
}

- (void)setSelectedCount:(int64_t)a3
{
  if (self->_selectedCount != a3)
  {
    self->_selectedCount = a3;
    -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updateBannerTitles);
    -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updateBannerActionButton);
  }
}

- (void)setOpaqueAncestorBackgroundColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;
  UIColor *v7;
  char v8;
  UIColor *v9;
  UIColor *opaqueAncestorBackgroundColor;
  PXRoundedCornerOverlayView *roundedCornerOverlayView;
  void *v12;
  _QWORD v13[5];

  v5 = (UIColor *)a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMPosterUIView.m"), 159, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("opaqueAncestorBackgroundColor"));

  }
  v6 = self->_opaqueAncestorBackgroundColor;
  if (v6 == v5)
  {

  }
  else
  {
    v7 = v6;
    v8 = -[UIColor isEqual:](v6, "isEqual:", v5);

    if ((v8 & 1) == 0)
    {
      v9 = (UIColor *)-[UIColor copy](v5, "copy");
      opaqueAncestorBackgroundColor = self->_opaqueAncestorBackgroundColor;
      self->_opaqueAncestorBackgroundColor = v9;

      roundedCornerOverlayView = self->_roundedCornerOverlayView;
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __54__PXCMMPosterUIView_setOpaqueAncestorBackgroundColor___block_invoke;
      v13[3] = &unk_1E51406D0;
      v13[4] = self;
      -[PXRoundedCornerOverlayView performChanges:](roundedCornerOverlayView, "performChanges:", v13);
    }
  }

}

- (void)setCornersToRound:(unint64_t)a3
{
  if (self->_cornersToRound != a3)
  {
    self->_cornersToRound = a3;
    -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updateCorners);
  }
}

- (void)setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updateCorners);
  }
}

- (void)setNeedsBannerView:(BOOL)a3
{
  if (self->_needsBannerView != a3)
  {
    self->_needsBannerView = a3;
    -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updateBannerView);
  }
}

- (void)setActionButtonWithType:(int64_t)a3 actionBlock:(id)a4
{
  void *v5;
  id actionButtonAction;

  self->_actionButtonType = a3;
  v5 = (void *)objc_msgSend(a4, "copy");
  actionButtonAction = self->_actionButtonAction;
  self->_actionButtonAction = v5;

  -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updateBannerActionButton);
}

- (void)setActionInProgress:(BOOL)a3
{
  if (self->_actionInProgress != a3)
  {
    self->_actionInProgress = a3;
    -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updateBannerActionButton);
  }
}

- (void)_updateBannerTitles
{
  -[PXCMMPosterBannerView setHeadline:boldRange:](self->_bannerView, "setHeadline:boldRange:", self->_bannerHeadline, self->_bannerHeadlineBoldRange.location, self->_bannerHeadlineBoldRange.length);
  -[PXCMMPosterBannerView setSubheadline:](self->_bannerView, "setSubheadline:", self->_bannerSubheadline);
}

- (void)_updateBannerActionButton
{
  uint64_t v3;
  void *v4;
  void *v5;
  int64_t actionButtonType;
  void *v7;
  id actionButtonAction;
  void *v9;
  id v10;
  id v11;

  v3 = -[PXCMMPosterUIView selectedCount](self, "selectedCount");
  v4 = _Block_copy(self->_actionButtonAction);
  v5 = v4;
  actionButtonType = self->_actionButtonType;
  if (actionButtonType != 2)
  {
    if (actionButtonType != 1)
    {
      v7 = 0;
      goto LABEL_9;
    }
    v10 = v4;
    PXLocalizedStringFromTable(CFSTR("PXCMMNextButtonTitle"), CFSTR("PhotosUICore"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3 > 0)
      goto LABEL_4;
LABEL_6:
    actionButtonAction = 0;
    goto LABEL_7;
  }
  v10 = v4;
  PXLocalizedStringFromTable(CFSTR("PXCMMSaveButtonTitle"), CFSTR("PhotosUICore"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 < 1)
    goto LABEL_6;
LABEL_4:
  actionButtonAction = self->_actionButtonAction;
LABEL_7:
  v9 = _Block_copy(actionButtonAction);

  v5 = v9;
LABEL_9:
  v11 = v5;
  -[PXCMMPosterBannerView setActionButtonWithTitle:actionBlock:](self->_bannerView, "setActionButtonWithTitle:actionBlock:", v7, v5);

}

- (void)_updateBannerView
{
  PXCMMPosterBannerView *bannerView;
  PXCMMPosterBannerView *v4;
  PXCMMPosterBannerView *v5;
  PXCMMPosterBannerView *v6;
  _QWORD v7[5];
  _QWORD v8[5];

  bannerView = self->_bannerView;
  if (self->_needsBannerView)
  {
    if (!bannerView)
    {
      v4 = [PXCMMPosterBannerView alloc];
      v5 = -[PXCMMPosterBannerView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
      v6 = self->_bannerView;
      self->_bannerView = v5;

      -[PXCMMPosterUIView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", self->_bannerView, self->_headerView);
    }
  }
  else if (bannerView)
  {
    v7[4] = self;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __38__PXCMMPosterUIView__updateBannerView__block_invoke;
    v8[3] = &unk_1E5149198;
    v8[4] = self;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __38__PXCMMPosterUIView__updateBannerView__block_invoke_2;
    v7[3] = &unk_1E5147360;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:animations:completion:", v8, v7, 0.25);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PXCMMPosterUIView _performLayoutInWidth:updateSubviewFrames:](self, "_performLayoutInWidth:updateSubviewFrames:", 0, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXCMMPosterUIView;
  -[PXCMMPosterUIView layoutSubviews](&v4, sel_layoutSubviews);
  -[PXCMMPosterUIView bounds](self, "bounds");
  -[PXCMMPosterUIView _performLayoutInWidth:updateSubviewFrames:](self, "_performLayoutInWidth:updateSubviewFrames:", 1, v3);
}

- (void)willMoveToWindow:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXCMMPosterUIView;
  -[PXCMMPosterUIView willMoveToWindow:](&v5, sel_willMoveToWindow_);
  if (a3)
    -[PXUpdater setNeedsUpdateOf:](self->_updater, "setNeedsUpdateOf:", sel__updateBannerActionButton);
}

- (CGSize)_performLayoutInWidth:(double)a3 updateSubviewFrames:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  double Width;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double MinX;
  double MinY;
  double MaxY;
  double v18;
  PXCMMPosterBannerView *bannerView;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double rect;
  CGSize result;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  v4 = a4;
  -[PXUpdater updateIfNeeded](self->_updater, "updateIfNeeded");
  -[PXCMMPosterUIView traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayScale");

  v30.origin.x = 0.0;
  v30.origin.y = 0.0;
  v30.size.width = a3;
  v30.size.height = 1.79769313e308;
  Width = CGRectGetWidth(v30);
  -[PXCMMPosterUIView window](self, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "screen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXPhotosDetailsHeaderTileWidget preferredHeaderContentHeightForWidth:screen:](PXPhotosDetailsHeaderTileWidget, "preferredHeaderContentHeightForWidth:screen:", v10, Width);

  PXSizeRoundToPixel();
  v12 = v11;
  v14 = v13;
  v31.origin.x = 0.0;
  v31.origin.y = 0.0;
  v31.size.width = a3;
  v31.size.height = 1.79769313e308;
  MinX = CGRectGetMinX(v31);
  v32.origin.x = 0.0;
  v32.origin.y = 0.0;
  v32.size.width = a3;
  v32.size.height = 1.79769313e308;
  MinY = CGRectGetMinY(v32);
  v33.origin.x = MinX;
  v33.origin.y = MinY;
  v33.size.width = v12;
  v33.size.height = v14;
  MaxY = CGRectGetMaxY(v33);
  if (v4)
    -[PXCMMPosterHeaderView setFrame:](self->_headerView, "setFrame:", MinX, MinY, v12, v14);
  rect = v12;
  v18 = fmax(MaxY, 0.0);
  if (self->_needsBannerView && (bannerView = self->_bannerView) != 0)
  {
    -[PXCMMPosterBannerView sizeThatFits:](bannerView, "sizeThatFits:", a3, 1.79769313e308);
    PXSizeRoundToPixel();
    v21 = v20;
    v27 = v22;
    v34.origin.x = 0.0;
    v34.origin.y = 0.0;
    v34.size.width = a3;
    v34.size.height = 1.79769313e308;
    v23 = CGRectGetMinX(v34);
    v35.origin.x = MinX;
    v35.origin.y = MinY;
    v35.size.width = rect;
    v35.size.height = v14;
    v24 = CGRectGetMaxY(v35);
    v36.origin.x = v23;
    v36.origin.y = v24;
    v36.size.width = v21;
    v36.size.height = v27;
    v18 = fmax(CGRectGetMaxY(v36), v18);
    if (v4)
    {
      -[PXCMMPosterBannerView setFrame:](self->_bannerView, "setFrame:", v23, v24, v21, v27);
LABEL_8:
      -[PXRoundedCornerOverlayView setFrame:](self->_roundedCornerOverlayView, "setFrame:", MinX, MinY, rect, v14);
    }
  }
  else if (v4)
  {
    goto LABEL_8;
  }
  v25 = a3;
  v26 = v18;
  result.height = v26;
  result.width = v25;
  return result;
}

- (void)_updateCorners
{
  double v3;
  double v4;
  unint64_t v5;
  PXRoundedCornerOverlayView *roundedCornerOverlayView;
  PXRoundedCornerOverlayView *v8;
  PXRoundedCornerOverlayView *v9;
  PXRoundedCornerOverlayView *v10;
  PXRoundedCornerOverlayView *v11;
  _QWORD v12[7];

  -[PXCMMPosterUIView cornerRadius](self, "cornerRadius");
  v4 = v3;
  v5 = -[PXCMMPosterUIView cornersToRound](self, "cornersToRound");
  roundedCornerOverlayView = self->_roundedCornerOverlayView;
  if (v4 <= 0.0 || v5 == 0)
  {
    -[PXRoundedCornerOverlayView removeFromSuperview](roundedCornerOverlayView, "removeFromSuperview");
    v8 = self->_roundedCornerOverlayView;
    self->_roundedCornerOverlayView = 0;

  }
  else
  {
    if (!roundedCornerOverlayView)
    {
      v9 = [PXRoundedCornerOverlayView alloc];
      -[PXCMMPosterUIView bounds](self, "bounds");
      v10 = -[PXRoundedCornerOverlayView initWithFrame:](v9, "initWithFrame:");
      v11 = self->_roundedCornerOverlayView;
      self->_roundedCornerOverlayView = v10;

      -[PXCMMPosterUIView addSubview:](self, "addSubview:", self->_roundedCornerOverlayView);
      roundedCornerOverlayView = self->_roundedCornerOverlayView;
    }
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __35__PXCMMPosterUIView__updateCorners__block_invoke;
    v12[3] = &unk_1E51264B0;
    *(double *)&v12[5] = v4;
    v12[4] = self;
    v12[6] = v5;
    -[PXRoundedCornerOverlayView performChanges:](roundedCornerOverlayView, "performChanges:", v12);
  }
}

- (id)_fontDescriptorWithTextStyle:(id)a3 addingSymbolicTraits:(unsigned int)a4
{
  uint64_t v4;
  id v5;
  NSString *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v4 = *(_QWORD *)&a4;
  v5 = a3;
  objc_msgSend((id)*MEMORY[0x1E0DC4730], "preferredContentSizeCategory");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (UIContentSizeCategoryIsAccessibilityCategory(v6))
  {
    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithPreferredContentSizeCategory:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v5, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if ((_DWORD)v4)
    {
      objc_msgSend(v8, "fontDescriptorWithSymbolicTraits:", objc_msgSend(v8, "symbolicTraits") | v4);
      v10 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v10;
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC1358], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", v5, v4, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (NSString)bannerHeadline
{
  return self->_bannerHeadline;
}

- (NSString)bannerSubheadline
{
  return self->_bannerSubheadline;
}

- (UIColor)opaqueAncestorBackgroundColor
{
  return self->_opaqueAncestorBackgroundColor;
}

- (unint64_t)cornersToRound
{
  return self->_cornersToRound;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (BOOL)needsBannerView
{
  return self->_needsBannerView;
}

- (PXCMMPosterBannerView)bannerView
{
  return self->_bannerView;
}

- (int64_t)selectedCount
{
  return self->_selectedCount;
}

- (int64_t)totalCount
{
  return self->_totalCount;
}

- (BOOL)isActionInProgress
{
  return self->_actionInProgress;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_opaqueAncestorBackgroundColor, 0);
  objc_storeStrong((id *)&self->_bannerSubheadline, 0);
  objc_storeStrong((id *)&self->_bannerHeadline, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong(&self->_actionButtonAction, 0);
  objc_storeStrong((id *)&self->_bannerView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_roundedCornerOverlayView, 0);
}

void __35__PXCMMPosterUIView__updateCorners__block_invoke(double *a1, void *a2)
{
  double v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a1[5];
  v6 = a2;
  objc_msgSend(v6, "setCornerRadius:", v3);
  objc_msgSend(v6, "setOverlayColor:", *(_QWORD *)(*((_QWORD *)a1 + 4) + 512));
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v4);

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scale");
  objc_msgSend(v6, "setDisplayScale:");

  objc_msgSend(v6, "setCornersToRound:", *((_QWORD *)a1 + 6));
}

uint64_t __38__PXCMMPosterUIView__updateBannerView__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "frame");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setFrame:");
}

void __38__PXCMMPosterUIView__updateBannerView__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "removeFromSuperview");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 448);
  *(_QWORD *)(v2 + 448) = 0;

}

uint64_t __54__PXCMMPosterUIView_setOpaqueAncestorBackgroundColor___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setOverlayColor:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 512));
}

void __44__PXCMMPosterUIView_setAsset_mediaProvider___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setAsset:", v3);
  objc_msgSend(v4, "setMediaProvider:", *(_QWORD *)(a1 + 40));

}

uint64_t __37__PXCMMPosterUIView_setStatusString___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setStatusString:", *(_QWORD *)(a1 + 32));
}

uint64_t __35__PXCMMPosterUIView_setDateString___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSubtitle:", *(_QWORD *)(a1 + 32));
}

uint64_t __39__PXCMMPosterUIView_setLocationString___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setTitle:", *(_QWORD *)(a1 + 32));
}

@end
