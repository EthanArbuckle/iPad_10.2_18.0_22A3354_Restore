@implementation PXPhotosGlobalFooterView

- (PXPhotosGlobalFooterView)initWithFrame:(CGRect)a3
{
  return -[PXPhotosGlobalFooterView initWithFrame:needsWorkaroundFor53118165:](self, "initWithFrame:needsWorkaroundFor53118165:", 1, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (PXPhotosGlobalFooterView)initWithFrame:(CGRect)a3 needsWorkaroundFor53118165:(BOOL)a4
{
  PXPhotosGlobalFooterView *v5;
  PXPhotosGlobalFooterView *v6;
  void *v7;
  PXGradientView *v8;
  PXGradientView *backgroundView;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  UILabel *titleLabel;
  uint64_t v17;
  UILabel *extendedTitleLabel;
  uint64_t v19;
  UILabel *internalMessageSubtitleLabel;
  uint64_t v21;
  UITextView *subtitle1TextView;
  UITextView *v23;
  void *v24;
  uint64_t v25;
  UITextView *subtitle2TextView;
  UITextView *v27;
  void *v28;
  uint64_t v29;
  UILabel *subtitle2Label;
  uint64_t v31;
  UIProgressView *progressView;
  void *v33;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)PXPhotosGlobalFooterView;
  v5 = -[PXPhotosGlobalFooterView initWithFrame:](&v35, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    if (a4)
    {
      +[PXWorkaroundSettings sharedInstance](PXWorkaroundSettings, "sharedInstance");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_needsWorkaroundFor53118165 = objc_msgSend(v7, "shouldWorkAround53118165");

      if (v6->_needsWorkaroundFor53118165)
      {
        v8 = objc_alloc_init(PXGradientView);
        backgroundView = v6->_backgroundView;
        v6->_backgroundView = v8;

        -[PXPhotosGlobalFooterView addSubview:](v6, "addSubview:", v6->_backgroundView);
      }
    }
    else
    {
      v5->_needsWorkaroundFor53118165 = 0;
    }
    -[PXPhotosGlobalFooterView _updateLabelColor](v6, "_updateLabelColor");
    v10 = objc_alloc(MEMORY[0x1E0DC3990]);
    v11 = *MEMORY[0x1E0C9D648];
    v12 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v13 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v14 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v15 = objc_msgSend(v10, "initWithFrame:", *MEMORY[0x1E0C9D648], v12, v13, v14);
    titleLabel = v6->_titleLabel;
    v6->_titleLabel = (UILabel *)v15;

    -[PXPhotosGlobalFooterView addSubview:](v6, "addSubview:", v6->_titleLabel);
    -[PXPhotosGlobalFooterView _configurePhotoCollectionGlobalFooterTitleLabel:](v6, "_configurePhotoCollectionGlobalFooterTitleLabel:", v6->_titleLabel);
    v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v11, v12, v13, v14);
    extendedTitleLabel = v6->_extendedTitleLabel;
    v6->_extendedTitleLabel = (UILabel *)v17;

    -[PXPhotosGlobalFooterView addSubview:](v6, "addSubview:", v6->_extendedTitleLabel);
    -[PXPhotosGlobalFooterView _configurePhotoCollectionGlobalFooterExtendedTitleLabel:](v6, "_configurePhotoCollectionGlobalFooterExtendedTitleLabel:", v6->_extendedTitleLabel);
    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v11, v12, v13, v14);
    internalMessageSubtitleLabel = v6->_internalMessageSubtitleLabel;
    v6->_internalMessageSubtitleLabel = (UILabel *)v19;

    -[PXPhotosGlobalFooterView addSubview:](v6, "addSubview:", v6->_internalMessageSubtitleLabel);
    -[PXPhotosGlobalFooterView _configurePhotoCollectionGlobalFooterInternalMessageSubtitleLabel:](v6, "_configurePhotoCollectionGlobalFooterInternalMessageSubtitleLabel:", v6->_internalMessageSubtitleLabel);
    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3E50]), "initWithFrame:", v11, v12, v13, v14);
    subtitle1TextView = v6->_subtitle1TextView;
    v6->_subtitle1TextView = (UITextView *)v21;

    -[UITextView setDelegate:](v6->_subtitle1TextView, "setDelegate:", v6);
    -[PXPhotosGlobalFooterView addSubview:](v6, "addSubview:", v6->_subtitle1TextView);
    v23 = v6->_subtitle1TextView;
    -[PXPhotosGlobalFooterView labelColor](v6, "labelColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    _ConfigurePhotoCollectionGlobalFooterSubtitleTextView(v23, 0, v24);

    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3E50]), "initWithFrame:", v11, v12, v13, v14);
    subtitle2TextView = v6->_subtitle2TextView;
    v6->_subtitle2TextView = (UITextView *)v25;

    -[UITextView setDelegate:](v6->_subtitle2TextView, "setDelegate:", v6);
    -[PXPhotosGlobalFooterView addSubview:](v6, "addSubview:", v6->_subtitle2TextView);
    v27 = v6->_subtitle2TextView;
    -[PXPhotosGlobalFooterView labelColor](v6, "labelColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    _ConfigurePhotoCollectionGlobalFooterSubtitleTextView(v27, 1, v28);

    v29 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v11, v12, v13, v14);
    subtitle2Label = v6->_subtitle2Label;
    v6->_subtitle2Label = (UILabel *)v29;

    -[PXPhotosGlobalFooterView addSubview:](v6, "addSubview:", v6->_subtitle2Label);
    -[PXPhotosGlobalFooterView _configurePhotoCollectionGlobalFooterSubtitleLabel:](v6, "_configurePhotoCollectionGlobalFooterSubtitleLabel:", v6->_subtitle2Label);
    v31 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B98]), "initWithProgressViewStyle:", 0);
    progressView = v6->_progressView;
    v6->_progressView = (UIProgressView *)v31;

    -[PXPhotosGlobalFooterView addSubview:](v6, "addSubview:", v6->_progressView);
    -[PXPhotosGlobalFooterView setPreservesSuperviewLayoutMargins:](v6, "setPreservesSuperviewLayoutMargins:", 1);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObserver:selector:name:object:", v6, sel__contentSizeCategoryDidChangeNotification_, *MEMORY[0x1E0DC48E8], 0);

  }
  return v6;
}

- (void)setViewModel:(id)a3
{
  PXFooterViewModel *v5;
  PXFooterViewModel *viewModel;
  PXFooterViewModel *v7;

  v5 = (PXFooterViewModel *)a3;
  viewModel = self->_viewModel;
  if (viewModel != v5)
  {
    v7 = v5;
    -[PXFooterViewModel unregisterChangeObserver:context:](viewModel, "unregisterChangeObserver:context:", self, PXPhotosGlobalFooterViewViewModelObservationContext);
    objc_storeStrong((id *)&self->_viewModel, a3);
    -[PXPhotosGlobalFooterView _updateLabelColor](self, "_updateLabelColor");
    -[PXPhotosGlobalFooterView _updateTopAccessory](self, "_updateTopAccessory");
    -[PXPhotosGlobalFooterView _updateAnimatedIcon](self, "_updateAnimatedIcon");
    -[PXPhotosGlobalFooterView _updateTitle](self, "_updateTitle");
    -[PXPhotosGlobalFooterView _updateExtendedTitle](self, "_updateExtendedTitle");
    -[PXPhotosGlobalFooterView _updateInternalMessageSubtitle](self, "_updateInternalMessageSubtitle");
    -[PXPhotosGlobalFooterView _updateFilterView](self, "_updateFilterView");
    -[PXPhotosGlobalFooterView _updateSubtitle1](self, "_updateSubtitle1");
    -[PXPhotosGlobalFooterView _updateSubtitle2](self, "_updateSubtitle2");
    -[PXPhotosGlobalFooterView _updateProgressAnimated:](self, "_updateProgressAnimated:", 0);
    -[PXPhotosGlobalFooterView _updateAccessory](self, "_updateAccessory");
    -[PXPhotosGlobalFooterView _updateProcessingView](self, "_updateProcessingView");
    -[PXPhotosGlobalFooterView setNeedsLayout](self, "setNeedsLayout");
    -[PXFooterViewModel registerChangeObserver:context:](self->_viewModel, "registerChangeObserver:context:", self, PXPhotosGlobalFooterViewViewModelObservationContext);
    v5 = v7;
  }

}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  $F651303F7BF466E152182C2AD6B3F224 *p_delegateRespondsTo;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    p_delegateRespondsTo = &self->_delegateRespondsTo;
    p_delegateRespondsTo->photosGlobalFooterViewDidChangeHeight = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->photosGlobalFooterViewDidMoveToWindow = objc_opt_respondsToSelector() & 1;
  }

}

- (void)setHidden:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXPhotosGlobalFooterView;
  -[PXPhotosGlobalFooterView setHidden:](&v4, sel_setHidden_, a3);
  -[PXPhotosGlobalFooterView _updateAnimatedIcon](self, "_updateAnimatedIcon");
}

- (void)_updateLabelColor
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPhotosGlobalFooterView viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PXPhotosGlobalFooterView viewModel](self, "viewModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "adjustedChromeColor:", v7);
    v5 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v5;
  }
  else
  {
    v6 = v7;
  }
  v8 = v6;
  -[PXPhotosGlobalFooterView setLabelColor:](self, "setLabelColor:", v6);

}

- (void)_updateProcessingView
{
  void *v3;
  int v4;
  UIView *processingView;
  void *v6;
  UIView *v7;
  UIView *v8;
  uint64_t v9;

  -[PXPhotosGlobalFooterView viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isProcessing");

  processingView = self->_processingView;
  if (v4)
  {
    if (!processingView)
    {
      -[PXPhotosGlobalFooterView viewModel](self, "viewModel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[PXLemonadeFeatureAvailabilityProcessingViewFactory makeProcessingViewWithFooterViewModel:](PXLemonadeFeatureAvailabilityProcessingViewFactory, "makeProcessingViewWithFooterViewModel:", v6);
      v7 = (UIView *)objc_claimAutoreleasedReturnValue();
      v8 = self->_processingView;
      self->_processingView = v7;

      -[PXPhotosGlobalFooterView addSubview:](self, "addSubview:", self->_processingView);
      -[UIView sizeToFit](self->_processingView, "sizeToFit");
      processingView = self->_processingView;
    }
    v9 = 0;
  }
  else
  {
    v9 = 1;
  }
  -[UIView setHidden:](processingView, "setHidden:", v9);
}

- (void)_updateAnimatedIcon
{
  void *v3;
  uint64_t v4;
  BOOL v5;
  PXFooterAnimatedIconView *v6;
  PXFooterAnimatedIconView *animatedIconView;
  void *v8;
  _BOOL4 v9;
  PXFooterAnimatedIconView *v10;
  uint64_t v11;

  -[PXPhotosGlobalFooterView viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "animatedIconMode");

  v5 = v4 != 0;
  if (v4)
  {
    if (!self->_animatedIconView)
    {
      v6 = objc_alloc_init(PXFooterAnimatedIconView);
      animatedIconView = self->_animatedIconView;
      self->_animatedIconView = v6;

      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__animatedIconCrossedGridCycleBoundary, CFSTR("PXFooterAnimatedIconViewCrossedGridCycleBoundaryNotificationName"), self->_animatedIconView);

      v9 = -[PXPhotosGlobalFooterView needsWorkaroundFor53118165](self, "needsWorkaroundFor53118165");
      v10 = self->_animatedIconView;
      if (v9)
        -[PXPhotosGlobalFooterView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v10, self->_backgroundView);
      else
        -[PXPhotosGlobalFooterView insertSubview:atIndex:](self, "insertSubview:atIndex:", v10, 0);
    }
    self->_hasAnimatedIconView = v5;
    v11 = -[PXPhotosGlobalFooterView isHidden](self, "isHidden");
  }
  else
  {
    self->_hasAnimatedIconView = v5;
    v11 = 1;
  }
  -[PXFooterAnimatedIconView setHidden:](self->_animatedIconView, "setHidden:", v11);
  -[PXFooterAnimatedIconView setDesiredMode:](self->_animatedIconView, "setDesiredMode:", v4);
}

- (void)_animatedIconCrossedGridCycleBoundary
{
  id v2;

  -[PXPhotosGlobalFooterView viewModel](self, "viewModel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "footerAnimationCrossedGridCycleBoundary");

}

- (void)_updateTitle
{
  void *v3;
  UILabel *titleLabel;
  id v5;

  -[PXPhotosGlobalFooterView viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "title");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  titleLabel = self->_titleLabel;
  if (v5)
  {
    if (-[UILabel isHidden](titleLabel, "isHidden"))
      -[UILabel setHidden:](self->_titleLabel, "setHidden:", 0);
    -[UILabel setText:](self->_titleLabel, "setText:", v5);
    -[PXPhotosGlobalFooterView _configurePhotoCollectionGlobalFooterTitleLabel:](self, "_configurePhotoCollectionGlobalFooterTitleLabel:", self->_titleLabel);
  }
  else
  {
    -[UILabel setHidden:](titleLabel, "setHidden:", 1);
  }

}

- (void)_updateExtendedTitle
{
  void *v3;
  UILabel *extendedTitleLabel;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;

  -[PXPhotosGlobalFooterView viewModel](self, "viewModel");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "extendedTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  extendedTitleLabel = self->_extendedTitleLabel;
  if (v3)
  {
    if (-[UILabel isHidden](extendedTitleLabel, "isHidden"))
      -[UILabel setHidden:](self->_extendedTitleLabel, "setHidden:", 0);
    -[PXPhotosGlobalFooterView _configurePhotoCollectionGlobalFooterExtendedTitleLabel:](self, "_configurePhotoCollectionGlobalFooterExtendedTitleLabel:", self->_extendedTitleLabel);
    objc_msgSend(v22, "extendedSystemImageName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0DC12B0]);
      v7 = (void *)MEMORY[0x1E0DC3888];
      -[UILabel font](self->_extendedTitleLabel, "font");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "configurationWithFont:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = (void *)MEMORY[0x1E0DC3888];
      -[PXPhotosGlobalFooterView labelColor](self, "labelColor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "configurationWithHierarchicalColor:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "configurationByApplyingConfiguration:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", v5, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setImage:", v14);

      v15 = objc_alloc_init(MEMORY[0x1E0CB3778]);
      objc_msgSend(MEMORY[0x1E0CB3498], "attributedStringWithAttachment:", v6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "appendAttributedString:", v16);

      v17 = objc_alloc(MEMORY[0x1E0CB3498]);
      objc_msgSend(CFSTR(" "), "stringByAppendingString:", v3);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)objc_msgSend(v17, "initWithString:", v18);
      objc_msgSend(v15, "appendAttributedString:", v19);

      v20 = (void *)objc_msgSend(v15, "copy");
      v21 = 0;
    }
    else
    {
      v21 = v3;
      v20 = 0;
    }
    -[UILabel setText:](self->_extendedTitleLabel, "setText:", v21);
    -[UILabel setAttributedText:](self->_extendedTitleLabel, "setAttributedText:", v20);

  }
  else
  {
    -[UILabel setHidden:](extendedTitleLabel, "setHidden:", 1);
  }

}

- (void)_updateInternalMessageSubtitle
{
  void *v3;
  uint64_t v4;
  UILabel *internalMessageSubtitleLabel;
  id v6;

  -[PXPhotosGlobalFooterView viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "internalMessageSubtitle");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v6, "length");
  internalMessageSubtitleLabel = self->_internalMessageSubtitleLabel;
  if (v4)
  {
    if (-[UILabel isHidden](internalMessageSubtitleLabel, "isHidden"))
      -[UILabel setHidden:](self->_internalMessageSubtitleLabel, "setHidden:", 0);
    -[UILabel setText:](self->_internalMessageSubtitleLabel, "setText:", v6);
  }
  else
  {
    -[UILabel setHidden:](internalMessageSubtitleLabel, "setHidden:", 1);
  }

}

- (void)_updateFilterView
{
  void *v3;
  UIView *v4;
  UIView *filterView;
  void *v6;
  void *v7;
  id v8;

  -[UIView removeFromSuperview](self->_filterView, "removeFromSuperview");
  -[PXPhotosGlobalFooterView viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "filterView");
  v4 = (UIView *)objc_claimAutoreleasedReturnValue();
  filterView = self->_filterView;
  self->_filterView = v4;

  if (self->_filterView)
  {
    -[PXPhotosGlobalFooterView viewModel](self, "viewModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "adjustedChromeColor:", v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    -[UIView setCaptionColor:](self->_filterView, "setCaptionColor:", v8);
    -[PXPhotosGlobalFooterView addSubview:](self, "addSubview:", self->_filterView);

  }
}

- (void)_updateSubtitle1
{
  void *v3;
  UITextView *subtitle1TextView;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  char v9;
  unsigned __int8 v10;
  int v11;
  UITextView *v12;
  void *v13;
  id v14;

  -[PXPhotosGlobalFooterView viewModel](self, "viewModel");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "subtitle1");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  subtitle1TextView = self->_subtitle1TextView;
  if (v3)
  {
    if (-[UITextView isHidden](subtitle1TextView, "isHidden"))
      -[UITextView setHidden:](self->_subtitle1TextView, "setHidden:", 0);
    if (-[PXPhotosGlobalFooterView _shouldUseActionLinkInSubtitle1](self, "_shouldUseActionLinkInSubtitle1"))
    {
      objc_msgSend(v14, "actionTitle");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = v14;
      v7 = (void *)v5;
    }
    else
    {
      v7 = 0;
      v6 = v14;
    }
    v8 = objc_msgSend(v6, "subtitle1Style");
    v9 = objc_msgSend(v14, "actionStyle") == 2;
    v10 = objc_msgSend(v14, "useBlankActionSeparator");
    v11 = objc_msgSend(v14, "showBadge");
    v12 = self->_subtitle1TextView;
    -[PXPhotosGlobalFooterView labelColor](self, "labelColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    _ConfigureSubtitleTextView(v12, v3, v7, v13, 0, v8, v9, v11, v10);

  }
  else
  {
    -[UITextView setHidden:](subtitle1TextView, "setHidden:", 1);
  }

}

- (void)_updateSubtitle2
{
  void *v3;
  _BOOL4 v4;
  UILabel *subtitle2Label;
  UITextView *subtitle2TextView;
  char v7;
  unsigned __int8 v8;
  UITextView *v9;
  void *v10;
  void *v11;
  id v12;

  -[PXPhotosGlobalFooterView viewModel](self, "viewModel");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "subtitle2");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PXPhotosGlobalFooterView _shouldUseActionLinkInSubtitle2](self, "_shouldUseActionLinkInSubtitle2");
  subtitle2Label = self->_subtitle2Label;
  if (!v3 || v4)
  {
    -[UILabel setHidden:](subtitle2Label, "setHidden:", 1);
  }
  else
  {
    if (-[UILabel isHidden](subtitle2Label, "isHidden"))
      -[UILabel setHidden:](self->_subtitle2Label, "setHidden:", 0);
    -[UILabel setText:](self->_subtitle2Label, "setText:", v3);
    -[PXPhotosGlobalFooterView _configurePhotoCollectionGlobalFooterSubtitleLabel:](self, "_configurePhotoCollectionGlobalFooterSubtitleLabel:", self->_subtitle2Label);
  }
  subtitle2TextView = self->_subtitle2TextView;
  if (v4)
  {
    if (-[UITextView isHidden](subtitle2TextView, "isHidden"))
      -[UITextView setHidden:](self->_subtitle2TextView, "setHidden:", 0);
    v7 = objc_msgSend(v12, "actionStyle") == 2;
    v8 = objc_msgSend(v12, "useBlankActionSeparator");
    v9 = self->_subtitle2TextView;
    objc_msgSend(v12, "actionTitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosGlobalFooterView labelColor](self, "labelColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _ConfigureSubtitleTextView(v9, v3, v10, v11, 1, 0, v7, 0, v8);

  }
  else
  {
    -[UITextView setHidden:](subtitle2TextView, "setHidden:", 1);
  }

}

- (void)_updateProgressAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  float v6;
  float v7;
  UIProgressView *progressView;
  UIProgressView *v9;
  void *v10;
  char v11;
  void *v12;
  UIProgressView *v13;
  void *v14;
  void *v15;
  float v16;
  float v17;
  double v18;

  v3 = a3;
  -[PXPhotosGlobalFooterView viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "progress");
  v7 = v6;

  progressView = self->_progressView;
  if (v7 == -1.0)
  {
    -[UIProgressView setHidden:](progressView, "setHidden:", 1);
  }
  else
  {
    if (-[UIProgressView isHidden](progressView, "isHidden"))
      -[UIProgressView setHidden:](self->_progressView, "setHidden:", 0);
    v9 = self->_progressView;
    -[PXPhotosGlobalFooterView viewModel](self, "viewModel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isPaused");
    v12 = (void *)MEMORY[0x1E0DC3658];
    v13 = v9;
    if ((v11 & 1) != 0)
      objc_msgSend(v12, "systemGrayColor");
    else
      objc_msgSend(v12, "systemBlueColor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIProgressView setProgressTintColor:](v13, "setProgressTintColor:", v14);

    +[PXFooterSettings sharedInstance](PXFooterSettings, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "minimumDisplayedProgress");
    v17 = v16;

    if (v7 >= v17)
      *(float *)&v18 = v7;
    else
      *(float *)&v18 = v17;
    -[UIProgressView setProgress:animated:](self->_progressView, "setProgress:animated:", v3, v18);
  }
}

- (void)_updateAccessory
{
  void *v3;
  UIView *v4;
  UIView *accessoryView;

  -[UIView removeFromSuperview](self->_accessoryView, "removeFromSuperview");
  -[PXPhotosGlobalFooterView viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessoryView");
  v4 = (UIView *)objc_claimAutoreleasedReturnValue();
  accessoryView = self->_accessoryView;
  self->_accessoryView = v4;

  if (self->_accessoryView)
    -[PXPhotosGlobalFooterView addSubview:](self, "addSubview:");
}

- (void)_updateTopAccessory
{
  void *v3;
  UIView *v4;
  UIView *topAccessoryView;

  -[UIView removeFromSuperview](self->_topAccessoryView, "removeFromSuperview");
  -[PXPhotosGlobalFooterView viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topAccessoryView");
  v4 = (UIView *)objc_claimAutoreleasedReturnValue();
  topAccessoryView = self->_topAccessoryView;
  self->_topAccessoryView = v4;

  if (self->_topAccessoryView)
    -[PXPhotosGlobalFooterView addSubview:](self, "addSubview:");
}

- (BOOL)_shouldUseActionLinkInSubtitle2
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[PXPhotosGlobalFooterView viewModel](self, "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "actionTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(v2, "subtitle2");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_shouldUseActionLinkInSubtitle1
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;

  -[PXPhotosGlobalFooterView viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "actionTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "subtitle1");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      v6 = !-[PXPhotosGlobalFooterView _shouldUseActionLinkInSubtitle2](self, "_shouldUseActionLinkInSubtitle2");
    else
      LOBYTE(v6) = 0;

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (void)_configurePhotoCollectionGlobalFooterLabel:(id)a3 withFont:(id)a4 textColor:(id)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;

  v7 = (void *)MEMORY[0x1E0DC3658];
  v8 = a5;
  v9 = a4;
  v11 = a3;
  objc_msgSend(v7, "clearColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBackgroundColor:", v10);

  objc_msgSend(v11, "setFont:", v9);
  objc_msgSend(v11, "setTextAlignment:", 1);
  objc_msgSend(v11, "setTextColor:", v8);

  objc_msgSend(v11, "setNumberOfLines:", 0);
}

- (void)_configurePhotoCollectionGlobalFooterTitleLabel:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  PXFontWithTextStyleSymbolicTraits();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPhotosGlobalFooterView labelColor](self, "labelColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosGlobalFooterView _configurePhotoCollectionGlobalFooterLabel:withFont:textColor:](self, "_configurePhotoCollectionGlobalFooterLabel:withFont:textColor:", v4, v6, v5);

}

- (void)_configurePhotoCollectionGlobalFooterInternalMessageSubtitleLabel:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  PXFontWithTextStyleSymbolicTraits();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "redColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosGlobalFooterView _configurePhotoCollectionGlobalFooterLabel:withFont:textColor:](self, "_configurePhotoCollectionGlobalFooterLabel:withFont:textColor:", v4, v6, v5);

}

- (void)_configurePhotoCollectionGlobalFooterExtendedTitleLabel:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  PXFontWithTextStyleSymbolicTraits();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPhotosGlobalFooterView labelColor](self, "labelColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosGlobalFooterView _configurePhotoCollectionGlobalFooterLabel:withFont:textColor:](self, "_configurePhotoCollectionGlobalFooterLabel:withFont:textColor:", v4, v6, v5);

}

- (void)_configurePhotoCollectionGlobalFooterSubtitleLabel:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  PXFontWithTextStyleSymbolicTraits();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosGlobalFooterView _configurePhotoCollectionGlobalFooterLabel:withFont:textColor:](self, "_configurePhotoCollectionGlobalFooterLabel:withFont:textColor:", v10, v4, v5);

  -[PXPhotosGlobalFooterView viewModel](self, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[PXPhotosGlobalFooterView viewModel](self, "viewModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "adjustedChromeColor:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTextColor:", v9);

  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v8;
  _BOOL4 v9;
  _BOOL4 v10;
  unint64_t v11;
  int v12;
  void *v13;
  id v14;

  v8 = a3;
  if ((void *)PXPhotosGlobalFooterViewViewModelObservationContext != a5)
    goto LABEL_26;
  v14 = v8;
  if ((a4 & 0x8000) != 0)
    -[PXPhotosGlobalFooterView _updateAnimatedIcon](self, "_updateAnimatedIcon");
  if ((a4 & 1) != 0)
    -[PXPhotosGlobalFooterView _updateTitle](self, "_updateTitle");
  if ((a4 & 0x20002) != 0)
    -[PXPhotosGlobalFooterView _updateExtendedTitle](self, "_updateExtendedTitle");
  if ((a4 & 0x20) != 0)
    -[PXPhotosGlobalFooterView _updateInternalMessageSubtitle](self, "_updateInternalMessageSubtitle");
  if ((a4 & 4) != 0)
    -[PXPhotosGlobalFooterView _updateFilterView](self, "_updateFilterView");
  v9 = (a4 & 0x11C) != 0;
  v10 = (a4 & 0x110) != 0;
  if ((a4 & 0x2000C0) != 0)
  {
    v9 = 1;
    -[PXPhotosGlobalFooterView _updateProgressAnimated:](self, "_updateProgressAnimated:", 1);
    v10 = 1;
  }
  v11 = (a4 >> 9) & 1;
  v12 = v11 | v9;
  if ((a4 & 0x1E00) != 0 && self->_isPresentingAlert)
  {
    -[PXPhotosGlobalFooterView delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "photosGlobalFooterView:presentViewController:", self, 0);

    self->_isPresentingAlert = 0;
  }
  if ((a4 & 0x4000) == 0)
  {
    if ((a4 & 0x10000) == 0)
      goto LABEL_19;
LABEL_28:
    -[PXPhotosGlobalFooterView _updateTopAccessory](self, "_updateTopAccessory");
    if ((a4 & 0x100000) == 0)
      goto LABEL_21;
    goto LABEL_20;
  }
  -[PXPhotosGlobalFooterView _updateAccessory](self, "_updateAccessory");
  v12 = 1;
  if ((a4 & 0x10000) != 0)
    goto LABEL_28;
LABEL_19:
  if ((a4 & 0x100000) != 0)
LABEL_20:
    -[PXPhotosGlobalFooterView _updateProcessingView](self, "_updateProcessingView");
LABEL_21:
  if (v12)
    -[PXPhotosGlobalFooterView _updateSubtitle1](self, "_updateSubtitle1");
  if (v11 | v10)
    -[PXPhotosGlobalFooterView _updateSubtitle2](self, "_updateSubtitle2");
  -[PXPhotosGlobalFooterView setNeedsLayout](self, "setNeedsLayout");
  v8 = v14;
LABEL_26:

}

- (CGSize)_performLayoutInWidth:(double)a3 updateSubviewFrames:(BOOL)a4
{
  double v6;
  void *v7;
  double MaxY;
  double v9;
  double v10;
  double v11;
  char v12;
  char v13;
  char v14;
  UIView *accessoryView;
  UIView *processingView;
  double *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  int v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGFloat v39;
  void *v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  CGFloat v49;
  void *v50;
  double v51;
  CGFloat v52;
  double v53;
  CGFloat v54;
  double v55;
  void *v56;
  double v57;
  double v58;
  CGFloat v59;
  double v60;
  double v61;
  CGFloat v62;
  double v63;
  double v64;
  int v65;
  void *v66;
  double v67;
  CGFloat v68;
  double v69;
  void *v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  CGFloat v76;
  void *v77;
  double v78;
  CGFloat v79;
  double v80;
  CGFloat v81;
  double v82;
  void *v83;
  double v84;
  double v85;
  CGFloat v86;
  void *v87;
  double v88;
  CGFloat v89;
  double v90;
  CGFloat v91;
  double v92;
  void *v93;
  double v94;
  double v95;
  CGFloat v96;
  double v97;
  double v98;
  CGFloat v99;
  void *v100;
  double v101;
  double v102;
  CGFloat v103;
  double v104;
  void *v105;
  double v106;
  double v107;
  double v108;
  double v109;
  void *v110;
  _BOOL4 photosGlobalFooterViewDidChangeHeight;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  double v146;
  double v147;
  double v148;
  double v149;
  double v150;
  double x;
  double y;
  double v153;
  double v154;
  double v155;
  double v156;
  double v157;
  double v158;
  _BOOL4 v159;
  UIView *v160;
  _BOOL4 hasAnimatedIconView;
  int v162;
  char v163;
  int v164;
  char v165;
  UIView *topAccessoryView;
  double v167;
  int v168;
  double v169;
  UIView *filterView;
  double v171;
  double v172;
  double v173;
  double v174;
  _QWORD v175[4];
  CGSize result;
  CGRect v177;
  CGRect v178;
  CGRect v179;
  CGRect v180;
  CGRect v181;
  CGRect v182;
  CGRect v183;
  CGRect v184;
  CGRect v185;
  CGRect v186;
  CGRect v187;
  CGRect v188;
  CGRect v189;

  v159 = a4;
  v175[2] = *MEMORY[0x1E0C80C00];
  v6 = fmin(a3, 388.0);
  -[PXPhotosGlobalFooterView directionalLayoutMargins](self, "directionalLayoutMargins");
  -[PXPhotosGlobalFooterView safeAreaInsets](self, "safeAreaInsets");
  -[PXPhotosGlobalFooterView safeAreaInsets](self, "safeAreaInsets");
  -[PXPhotosGlobalFooterView traitCollection](self, "traitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayScale");

  MaxY = 0.0;
  PXFloatCeilingToPixel();
  v10 = fmin(v9, v6);
  PXFloatCeilingToPixel();
  v169 = v11;
  hasAnimatedIconView = self->_hasAnimatedIconView;
  v162 = -[UILabel isHidden](self->_titleLabel, "isHidden");
  v12 = -[UILabel isHidden](self->_extendedTitleLabel, "isHidden");
  v13 = -[UITextView isHidden](self->_subtitle1TextView, "isHidden");
  v165 = -[UITextView isHidden](self->_subtitle2TextView, "isHidden");
  v14 = -[UILabel isHidden](self->_subtitle2Label, "isHidden");
  v168 = -[UIProgressView isHidden](self->_progressView, "isHidden");
  accessoryView = self->_accessoryView;
  topAccessoryView = self->_topAccessoryView;
  filterView = self->_filterView;
  v163 = -[UILabel isHidden](self->_internalMessageSubtitleLabel, "isHidden");
  processingView = self->_processingView;
  if (processingView)
    v164 = !-[UIView isHidden](processingView, "isHidden");
  else
    v164 = 0;
  v17 = (double *)MEMORY[0x1E0C9D648];
  -[PXPhotosGlobalFooterView layoutDelegate](self, "layoutDelegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[PXPhotosGlobalFooterView layoutDelegate](self, "layoutDelegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "topMarginForPhotosGlobalFooterView:", self);
    MaxY = v20;

  }
  v172 = a3;
  v21 = (a3 - v10) * 0.5;
  v23 = *v17;
  v22 = v17[1];
  v24 = v17[2];
  v25 = v17[3];
  v174 = v24;
  v158 = v10;
  if (topAccessoryView)
  {
    v26 = v10;
    v27 = v162;
    if (v21 < 15.0)
      PXFloatCeilingToPixel();
    v28 = v26;
    -[UIView sizeThatFits:](self->_topAccessoryView, "sizeThatFits:");
    PXFloatCeilingToPixel();
    v30 = v29;
    PXPointRoundToPixel();
    x = v177.origin.x;
    y = v177.origin.y;
    v153 = v30;
    v154 = v28;
    v177.size.width = v28;
    v177.size.height = v30;
    MaxY = CGRectGetMaxY(v177);
    v31 = v174;
  }
  else
  {
    v153 = v17[3];
    v154 = v17[2];
    x = *v17;
    y = v17[1];
    v27 = v162;
    v31 = v24;
  }
  v32 = v25;
  v33 = v22;
  v34 = v23;
  if (hasAnimatedIconView)
  {
    -[PXFooterAnimatedIconView sizeThatFits:](self->_animatedIconView, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    v31 = v35;
    v32 = v36;
    v34 = (v172 - v35) * 0.5;
    v33 = 30.0;
    v178.origin.y = 30.0;
    v178.origin.x = v34;
    v178.size.width = v31;
    v178.size.height = v32;
    MaxY = CGRectGetMaxY(v178) + -8.0;
  }
  v156 = v34;
  v150 = v32;
  v37 = v158;
  v148 = v33;
  v167 = v25;
  if ((v27 & 1) != 0)
  {
    v140 = v25;
    v133 = v174;
    v138 = v23;
    v139 = v22;
  }
  else
  {
    PXScaledValueForTextStyleWithSymbolicTraits();
    -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v158, 1.79769313e308);
    PXFloatCeilingToPixel();
    v39 = v38;
    -[UILabel font](self->_titleLabel, "font");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "ascender");
    PXPointRoundToPixel();
    v42 = v41;
    v44 = v43;

    v138 = v42;
    v139 = v44;
    v179.origin.x = v42;
    v179.origin.y = v44;
    v179.size.width = v158;
    v140 = v39;
    v179.size.height = v39;
    v37 = v158;
    v45 = CGRectGetMaxY(v179);
    -[UILabel font](self->_titleLabel, "font");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "descender");
    MaxY = v45 + v47;

    v133 = v158;
  }
  v171 = v22;
  v149 = v31;
  if ((v12 & 1) != 0)
  {
    v137 = v25;
    v134 = v174;
    v135 = v23;
    v136 = v22;
  }
  else
  {
    PXScaledValueForTextStyleWithSymbolicTraits();
    -[UILabel sizeThatFits:](self->_extendedTitleLabel, "sizeThatFits:", v37, 1.79769313e308);
    PXFloatCeilingToPixel();
    v49 = v48;
    -[UILabel font](self->_extendedTitleLabel, "font");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "ascender");
    PXPointRoundToPixel();
    v52 = v51;
    v54 = v53;

    v135 = v52;
    v136 = v54;
    v180.origin.x = v52;
    v180.origin.y = v54;
    v180.size.width = v37;
    v137 = v49;
    v180.size.height = v49;
    v55 = CGRectGetMaxY(v180);
    -[UILabel font](self->_extendedTitleLabel, "font");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "descender");
    MaxY = v55 + v57;

    v134 = v37;
  }
  if (filterView)
  {
    PXScaledValueForTextStyleWithSymbolicTraits();
    -[UIView sizeThatFitsCaption:](self->_filterView, "sizeThatFitsCaption:", v37, 1.79769313e308);
    PXFloatCeilingToPixel();
    v59 = v58;
    PXPointRoundToPixel();
    v145 = v181.origin.x;
    v146 = v181.origin.y;
    v181.size.width = v37;
    v147 = v59;
    v181.size.height = v59;
    MaxY = CGRectGetMaxY(v181);
    v144 = v37;
  }
  else
  {
    v147 = v167;
    v144 = v174;
    v145 = v23;
    v146 = v22;
  }
  if ((v168 & 1) != 0)
  {
    v132 = v167;
    v60 = v174;
    v129 = v174;
    v130 = v23;
    v131 = v22;
  }
  else
  {
    v60 = v174;
    if (v27 && !filterView)
      PXScaledValueForTextStyleWithSymbolicTraits();
    PXScaledValueForTextStyleWithSymbolicTraits();
    -[UIProgressView frame](self->_progressView, "frame");
    v62 = v61;
    PXPointRoundToPixel();
    v130 = v182.origin.x;
    v131 = v182.origin.y;
    v182.size.width = v169;
    v132 = v62;
    v182.size.height = v62;
    MaxY = CGRectGetMaxY(v182);
    v129 = v169;
  }
  v160 = accessoryView;
  if ((v13 & 1) != 0)
  {
    v63 = v167;
    v128 = v167;
    v125 = v60;
    v64 = v171;
    v126 = v23;
    v127 = v171;
  }
  else
  {
    v65 = v27 ^ 1;
    if (filterView)
      v65 = 1;
    if (((v65 | v168 ^ 1) & 1) != 0)
    {
      PXScaledValueForTextStyleWithSymbolicTraits();
      -[UITextView font](self->_subtitle1TextView, "font");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "ascender");

    }
    else
    {
      PXScaledValueForTextStyleWithSymbolicTraits();
    }
    -[UITextView sizeThatFits:](self->_subtitle1TextView, "sizeThatFits:", v37, 1.79769313e308);
    PXFloatCeilingToPixel();
    v68 = v67;
    PXPointRoundToPixel();
    v126 = v183.origin.x;
    v127 = v183.origin.y;
    v183.size.width = v37;
    v128 = v68;
    v183.size.height = v68;
    v69 = CGRectGetMaxY(v183);
    -[UITextView font](self->_subtitle1TextView, "font");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v70, "descender");
    MaxY = v69 + v71;

    v125 = v37;
    v63 = v167;
    v64 = v171;
    v60 = v174;
  }
  if ((v14 & 1) != 0)
  {
    v123 = v64;
    v124 = v63;
    v155 = v60;
    v122 = v23;
  }
  else
  {
    PXScaledValueForTextStyleWithSymbolicTraits();
    -[UILabel sizeThatFits:](self->_subtitle2Label, "sizeThatFits:", v37, 1.79769313e308);
    PXFloatCeilingToPixel();
    v72 = v64;
    v73 = v23;
    v74 = v63;
    v76 = v75;
    -[UILabel font](self->_subtitle2Label, "font");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "ascender");
    PXPointRoundToPixel();
    v79 = v78;
    v81 = v80;

    v122 = v79;
    v123 = v81;
    v184.origin.x = v79;
    v184.origin.y = v81;
    v184.size.width = v37;
    v124 = v76;
    v184.size.height = v76;
    v63 = v74;
    v23 = v73;
    v64 = v72;
    v60 = v174;
    v82 = CGRectGetMaxY(v184);
    -[UILabel font](self->_subtitle2Label, "font");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "descender");
    MaxY = v82 + v84;

    v155 = v37;
  }
  if ((v165 & 1) != 0)
  {
    v120 = v64;
    v121 = v63;
    v119 = v23;
  }
  else
  {
    PXScaledValueForTextStyleWithSymbolicTraits();
    -[UITextView sizeThatFits:](self->_subtitle2TextView, "sizeThatFits:", v37, 1.79769313e308);
    PXFloatCeilingToPixel();
    v86 = v85;
    -[UITextView font](self->_subtitle2TextView, "font");
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v87, "ascender");
    PXPointRoundToPixel();
    v89 = v88;
    v91 = v90;

    v119 = v89;
    v120 = v91;
    v185.origin.x = v89;
    v185.origin.y = v91;
    v185.size.width = v37;
    v121 = v86;
    v185.size.height = v86;
    v92 = CGRectGetMaxY(v185);
    -[UITextView font](self->_subtitle2TextView, "font");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v93, "descender");
    MaxY = v92 + v94;

    v60 = v37;
  }
  if (accessoryView)
  {
    -[UIView sizeThatFits:](self->_accessoryView, "sizeThatFits:", v37, 1.79769313e308);
    PXFloatCeilingToPixel();
    v96 = v95;
    PXPointRoundToPixel();
    v142 = v186.origin.x;
    v143 = v186.origin.y;
    v186.size.width = v37;
    v157 = v96;
    v186.size.height = v96;
    MaxY = CGRectGetMaxY(v186);
    v141 = v37;
  }
  else
  {
    v157 = v63;
    v141 = v174;
    v142 = v23;
    v143 = v64;
  }
  if ((v163 & 1) != 0)
  {
    v173 = v63;
    v37 = v174;
    v118 = v64;
    v97 = v23;
  }
  else
  {
    PXScaledValueForTextStyleWithSymbolicTraits();
    -[UILabel sizeThatFits:](self->_internalMessageSubtitleLabel, "sizeThatFits:", v37, 1.79769313e308);
    PXFloatCeilingToPixel();
    v99 = v98;
    -[UILabel font](self->_internalMessageSubtitleLabel, "font");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "ascender");
    PXPointRoundToPixel();
    v97 = v101;
    v103 = v102;

    v187.origin.x = v97;
    v118 = v103;
    v187.origin.y = v103;
    v187.size.width = v37;
    v173 = v99;
    v187.size.height = v99;
    v104 = CGRectGetMaxY(v187);
    -[UILabel font](self->_internalMessageSubtitleLabel, "font");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "descender");
    MaxY = v104 + v106;
    v64 = v171;

  }
  if (v164)
  {
    -[UIView intrinsicContentSize](self->_processingView, "intrinsicContentSize");
    v63 = v107;
    PXPointRoundToPixel();
    v23 = v188.origin.x;
    v64 = v188.origin.y;
    v188.size.width = v169;
    v188.size.height = v63;
    MaxY = CGRectGetMaxY(v188);
  }
  else
  {
    v169 = v174;
  }
  if (MaxY > 0.0)
    PXScaledValueForTextStyleWithSymbolicTraits();
  PXFloatCeilingToPixel();
  v109 = v108;
  if (v159)
  {
    if ((PXFloatApproximatelyEqualToFloat() & 1) == 0)
    {
      self->_currentHeight = v109;
      -[PXPhotosGlobalFooterView delegate](self, "delegate");
      v110 = (void *)objc_claimAutoreleasedReturnValue();
      if (v110)
      {
        photosGlobalFooterViewDidChangeHeight = self->_delegateRespondsTo.photosGlobalFooterViewDidChangeHeight;

        if (photosGlobalFooterViewDidChangeHeight)
        {
          -[PXPhotosGlobalFooterView delegate](self, "delegate");
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v112, "photosGlobalFooterViewDidChangeHeight:", self);

          accessoryView = v160;
        }
      }
    }
    if (-[PXPhotosGlobalFooterView needsWorkaroundFor53118165](self, "needsWorkaroundFor53118165"))
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
      v113 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXGradientView setFrame:](self->_backgroundView, "setFrame:", 0.0, 25.0, v172, v109 + 1000.0);
      objc_msgSend(v113, "colorWithAlphaComponent:", 0.0);
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      v175[0] = v114;
      v175[1] = v113;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v175, 2);
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXGradientView setColors:](self->_backgroundView, "setColors:", v115);

      -[PXGradientView setStartPoint:](self->_backgroundView, "setStartPoint:", 0.5, 0.0);
      -[PXGradientView bounds](self->_backgroundView, "bounds");
      -[PXGradientView setEndPoint:](self->_backgroundView, "setEndPoint:", 0.5, 5.0 / CGRectGetHeight(v189));

      accessoryView = v160;
    }
    if (hasAnimatedIconView)
      -[PXFooterAnimatedIconView setFrame:](self->_animatedIconView, "setFrame:", v156, v148, v149, v150);
    if ((v162 & 1) == 0)
      -[UILabel setFrame:](self->_titleLabel, "setFrame:", v138, v139, v133, v140);
    if ((v12 & 1) == 0)
      -[UILabel setFrame:](self->_extendedTitleLabel, "setFrame:", v135, v136, v134, v137);
    if (filterView)
      -[UIView setFrame:](self->_filterView, "setFrame:", v145, v146, v144, v147);
    if ((v168 & 1) != 0)
    {
      if ((v13 & 1) != 0)
        goto LABEL_70;
    }
    else
    {
      -[UIProgressView setFrame:](self->_progressView, "setFrame:", v130, v131, v129, v132);
      if ((v13 & 1) != 0)
      {
LABEL_70:
        if ((v14 & 1) != 0)
        {
LABEL_72:
          if ((v165 & 1) == 0)
            -[UITextView setFrame:](self->_subtitle2TextView, "setFrame:", v119, v120, v60, v121);
          if (accessoryView)
            -[UIView setFrame:](self->_accessoryView, "setFrame:", v142, v143, v141, v157);
          if (topAccessoryView)
            -[UIView setFrame:](self->_topAccessoryView, "setFrame:", x, y, v154, v153);
          if ((v163 & 1) == 0)
            -[UILabel setFrame:](self->_internalMessageSubtitleLabel, "setFrame:", v97, v118, v37, v173);
          if (v164)
            -[UIView setFrame:](self->_processingView, "setFrame:", v23, v64, v169, v63);
          goto LABEL_82;
        }
LABEL_71:
        -[UILabel setFrame:](self->_subtitle2Label, "setFrame:", v122, v123, v155, v124);
        goto LABEL_72;
      }
    }
    -[UITextView setFrame:](self->_subtitle1TextView, "setFrame:", v126, v127, v125, v128);
    if ((v14 & 1) != 0)
      goto LABEL_72;
    goto LABEL_71;
  }
LABEL_82:
  v116 = v172;
  v117 = v109;
  result.height = v117;
  result.width = v116;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PXPhotosGlobalFooterView _performLayoutInWidth:updateSubviewFrames:](self, "_performLayoutInWidth:updateSubviewFrames:", 0, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXPhotosGlobalFooterView;
  -[PXPhotosGlobalFooterView didMoveToWindow](&v4, sel_didMoveToWindow);
  if (self->_delegateRespondsTo.photosGlobalFooterViewDidMoveToWindow)
  {
    -[PXPhotosGlobalFooterView delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "photosGlobalFooterViewDidMoveToWindow:", self);

  }
}

- (void)layoutSubviews
{
  double v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXPhotosGlobalFooterView;
  -[PXPhotosGlobalFooterView layoutSubviews](&v4, sel_layoutSubviews);
  -[PXPhotosGlobalFooterView bounds](self, "bounds");
  -[PXPhotosGlobalFooterView _performLayoutInWidth:updateSubviewFrames:](self, "_performLayoutInWidth:updateSubviewFrames:", 1, v3);
}

- (void)_contentSizeCategoryDidChangeNotification:(id)a3
{
  -[PXPhotosGlobalFooterView _updateTitle](self, "_updateTitle", a3);
  -[PXPhotosGlobalFooterView _updateExtendedTitle](self, "_updateExtendedTitle");
  -[PXPhotosGlobalFooterView _updateInternalMessageSubtitle](self, "_updateInternalMessageSubtitle");
  -[PXPhotosGlobalFooterView _updateSubtitle1](self, "_updateSubtitle1");
  -[PXPhotosGlobalFooterView _updateSubtitle2](self, "_updateSubtitle2");
  -[PXPhotosGlobalFooterView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_performActionFromView:(id)a3 sourceRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  void (**v11)(_QWORD);
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[4];
  id v36;
  PXPhotosGlobalFooterView *v37;
  _QWORD v38[4];
  id v39;
  PXPhotosGlobalFooterView *v40;
  void (**v41)(_QWORD);
  uint8_t buf[4];
  void *v43;
  uint64_t v44;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v44 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  -[PXPhotosGlobalFooterView viewModel](self, "viewModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "action");
  v11 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(v10, "actionConfirmationAlertTitle");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12
      && (v13 = (void *)v12,
          objc_msgSend(v10, "actionConfirmationAlertButtonTitle"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v14,
          v13,
          v14))
    {
      PLUserStatusUIGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v10, "actionTitle");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v43 = v16;
        _os_log_impl(&dword_1A6789000, v15, OS_LOG_TYPE_DEFAULT, "Presenting confirmation alert for action with title: %{public}@", buf, 0xCu);

      }
      v17 = (void *)MEMORY[0x1E0DC3450];
      objc_msgSend(v10, "actionConfirmationAlertTitle");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "alertControllerWithTitle:message:preferredStyle:", v18, 0, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v20 = objc_msgSend(v10, "actionStyle");
      if (v20 >= 3)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "UIAlertActionStyle UIAlertActionStyleFromPXAlertActionStyle(PXAlertActionStyle)");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "handleFailureInFunction:file:lineNumber:description:", v34, CFSTR("PXAlertActionStyle.h"), 43, CFSTR("Code which should be unreachable has been reached"));

        abort();
      }
      v21 = v20;
      v22 = (void *)MEMORY[0x1E0DC3448];
      objc_msgSend(v10, "actionConfirmationAlertButtonTitle");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __62__PXPhotosGlobalFooterView__performActionFromView_sourceRect___block_invoke;
      v38[3] = &unk_1E51458D0;
      v24 = v10;
      v39 = v24;
      v40 = self;
      v41 = v11;
      objc_msgSend(v22, "actionWithTitle:style:handler:", v23, v21, v38);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addAction:", v25);

      v26 = (void *)MEMORY[0x1E0DC3448];
      PXLocalizedStringFromTable(CFSTR("PXCancel"), CFSTR("PhotosUICore"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __62__PXPhotosGlobalFooterView__performActionFromView_sourceRect___block_invoke_175;
      v35[3] = &unk_1E51458F8;
      v36 = v24;
      v37 = self;
      objc_msgSend(v26, "actionWithTitle:style:handler:", v27, 1, v35);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addAction:", v28);

      objc_msgSend(v19, "popoverPresentationController");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setSourceView:", v9);

      objc_msgSend(v19, "popoverPresentationController");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setSourceRect:", x, y, width, height);

      objc_msgSend(v19, "popoverPresentationController");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setPermittedArrowDirections:", 2);

      -[PXPhotosGlobalFooterView delegate](self, "delegate");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "photosGlobalFooterView:presentViewController:", self, v19);

      self->_isPresentingAlert = 1;
    }
    else
    {
      v11[2](v11);
    }
  }

}

- (id)textView:(id)a3 primaryActionForTextItem:(id)a4 defaultAction:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "contentType") == 2
    && (objc_msgSend(v9, "tagIdentifier"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.photos.ui.link-action")),
        v11,
        v12))
  {
    objc_initWeak(&location, self);
    v13 = (void *)MEMORY[0x1E0DC3428];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __76__PXPhotosGlobalFooterView_textView_primaryActionForTextItem_defaultAction___block_invoke;
    v16[3] = &unk_1E5145928;
    v17 = v8;
    v18 = v9;
    objc_copyWeak(&v19, &location);
    objc_msgSend(v13, "actionWithHandler:", v16);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_destroyWeak(&v19);

    objc_destroyWeak(&location);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)textView:(id)a3 menuConfigurationForTextItem:(id)a4 defaultMenu:(id)a5
{
  return 0;
}

- (double)currentHeight
{
  return self->_currentHeight;
}

- (PXFooterViewModel)viewModel
{
  return self->_viewModel;
}

- (PXPhotosGlobalFooterViewDelegate)delegate
{
  return (PXPhotosGlobalFooterViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (PXPhotosGlobalFooterViewLayoutDelegate)layoutDelegate
{
  return (PXPhotosGlobalFooterViewLayoutDelegate *)objc_loadWeakRetained((id *)&self->_layoutDelegate);
}

- (void)setLayoutDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_layoutDelegate, a3);
}

- (BOOL)needsWorkaroundFor53118165
{
  return self->_needsWorkaroundFor53118165;
}

- (UIColor)labelColor
{
  return self->_labelColor;
}

- (void)setLabelColor:(id)a3
{
  objc_storeStrong((id *)&self->_labelColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_labelColor, 0);
  objc_destroyWeak((id *)&self->_layoutDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_processingView, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_subtitle2Label, 0);
  objc_storeStrong((id *)&self->_subtitle2TextView, 0);
  objc_storeStrong((id *)&self->_subtitle1TextView, 0);
  objc_storeStrong((id *)&self->_internalMessageSubtitleLabel, 0);
  objc_storeStrong((id *)&self->_extendedTitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_animatedIconView, 0);
  objc_storeStrong((id *)&self->_filterView, 0);
  objc_storeStrong((id *)&self->_topAccessoryView, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
}

void __76__PXPhotosGlobalFooterView_textView_primaryActionForTextItem_defaultAction___block_invoke(id *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id WeakRetained;
  id v17;

  objc_msgSend(a1[4], "layoutManager");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(a1[5], "range");
  v4 = objc_msgSend(v17, "glyphRangeForCharacterRange:actualCharacterRange:", v2, v3, 0);
  v6 = v5;
  objc_msgSend(a1[4], "textContainer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "boundingRectForGlyphRange:inTextContainer:", v4, v6, v7);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "_performActionFromView:sourceRect:", a1[4], v9, v11, v13, v15);

}

uint64_t __62__PXPhotosGlobalFooterView__performActionFromView_sourceRect___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PLUserStatusUIGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "actionTitle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_DEFAULT, "User confirmed action with title: %{public}@", (uint8_t *)&v5, 0xCu);

  }
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 608) = 0;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __62__PXPhotosGlobalFooterView__performActionFromView_sourceRect___block_invoke_175(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PLUserStatusUIGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "actionTitle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 138543362;
    v5 = v3;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_DEFAULT, "User dismissed action with title: %{public}@", (uint8_t *)&v4, 0xCu);

  }
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 608) = 0;
}

@end
