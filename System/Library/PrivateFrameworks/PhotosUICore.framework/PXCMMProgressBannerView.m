@implementation PXCMMProgressBannerView

- (PXCMMProgressBannerView)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMProgressBannerView.m"), 42, CFSTR("%s is not available as initializer"), "-[PXCMMProgressBannerView init]");

  abort();
}

- (PXCMMProgressBannerView)initWithFrame:(CGRect)a3
{
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMProgressBannerView.m"), 46, CFSTR("%s is not available as initializer"), "-[PXCMMProgressBannerView initWithFrame:]");

  abort();
}

- (PXCMMProgressBannerView)initWithCoder:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMProgressBannerView.m"), 50, CFSTR("%s is not available as initializer"), "-[PXCMMProgressBannerView initWithCoder:]");

  abort();
}

- (PXCMMProgressBannerView)initWithMomentShareStatusPresentation:(id)a3
{
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  PXCMMProgressBannerView *v11;
  PXCMMProgressBannerView *v12;
  uint64_t v13;
  UIVisualEffectView *visualEffectView;
  void *v15;
  UITextView *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  UITextView *activityTextView;
  void *v23;
  uint64_t v24;
  UILabel *pauseLabel;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  UIProgressView *progressView;
  void *v31;
  void *v32;
  void *v34;
  objc_super v35;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMProgressBannerView.m"), 54, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("momentShareStatusPresentation"));

  }
  v35.receiver = self;
  v35.super_class = (Class)PXCMMProgressBannerView;
  v7 = *MEMORY[0x1E0C9D648];
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v10 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v11 = -[PXCMMProgressBannerView initWithFrame:](&v35, sel_initWithFrame_, *MEMORY[0x1E0C9D648], v8, v9, v10);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_momentShareStatusPresentation, a3);
    -[PXMomentShareStatusPresentation registerChangeObserver:context:](v12->_momentShareStatusPresentation, "registerChangeObserver:context:", v12, PXMomentShareStatusPresentationObservationContext_154004);
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithFrame:", v7, v8, v9, v10);
    visualEffectView = v12->_visualEffectView;
    v12->_visualEffectView = (UIVisualEffectView *)v13;

    objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIVisualEffectView setEffect:](v12->_visualEffectView, "setEffect:", v15);
    -[UIVisualEffectView setAutoresizingMask:](v12->_visualEffectView, "setAutoresizingMask:", 18);
    -[PXCMMProgressBannerView addSubview:](v12, "addSubview:", v12->_visualEffectView);
    v16 = (UITextView *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3E50]), "initWithFrame:", v7, v8, v9, v10);
    _ActivityTitleAttributes();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1138]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setFont:](v16, "setFont:", v18);

    -[UITextView setTextContainerInset:](v16, "setTextContainerInset:", 0.0, 8.0, 0.0, 8.0);
    objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1178]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setTextAlignment:](v16, "setTextAlignment:", objc_msgSend(v19, "alignment"));

    objc_msgSend(v17, "objectForKeyedSubscript:", *MEMORY[0x1E0DC1140]);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setTextColor:](v16, "setTextColor:", v20);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextView setBackgroundColor:](v16, "setBackgroundColor:", v21);

    -[UITextView setEditable:](v16, "setEditable:", 0);
    -[UITextView setScrollEnabled:](v16, "setScrollEnabled:", 0);
    -[UITextView setDelaysContentTouches:](v16, "setDelaysContentTouches:", 0);
    -[UITextView setSelectable:](v16, "setSelectable:", 1);
    -[UITextView _setInteractiveTextSelectionDisabled:](v16, "_setInteractiveTextSelectionDisabled:", 1);

    activityTextView = v12->_activityTextView;
    v12->_activityTextView = v16;

    -[UITextView setDelegate:](v12->_activityTextView, "setDelegate:", v12);
    -[UIVisualEffectView contentView](v12->_visualEffectView, "contentView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addSubview:", v12->_activityTextView);

    v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v7, v8, v9, v10);
    pauseLabel = v12->_pauseLabel;
    v12->_pauseLabel = (UILabel *)v24;

    PXCappedFontWithTextStyle();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v12->_pauseLabel, "setFont:", v26);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v12->_pauseLabel, "setTextColor:", v27);

    -[UILabel setTextAlignment:](v12->_pauseLabel, "setTextAlignment:", 1);
    -[UIVisualEffectView contentView](v12->_visualEffectView, "contentView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addSubview:", v12->_pauseLabel);

    v29 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3B98]), "initWithProgressViewStyle:", 1);
    progressView = v12->_progressView;
    v12->_progressView = (UIProgressView *)v29;

    -[UIVisualEffectView contentView](v12->_visualEffectView, "contentView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "addSubview:", v12->_progressView);

    -[PXCMMProgressBannerView _updateActivityTitle](v12, "_updateActivityTitle");
    -[PXCMMProgressBannerView _updatePauseTitle](v12, "_updatePauseTitle");
    -[PXCMMProgressBannerView _updateProgress](v12, "_updateProgress");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "addObserver:selector:name:object:", v12, sel__contentSizeCategoryDidChange_, *MEMORY[0x1E0DC48E8], 0);

  }
  return v12;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[PXCMMProgressBannerView _performLayoutInWidth:updateSubviewFrames:](self, "_performLayoutInWidth:updateSubviewFrames:", 0, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXCMMProgressBannerView;
  -[PXCMMProgressBannerView layoutSubviews](&v4, sel_layoutSubviews);
  -[PXCMMProgressBannerView bounds](self, "bounds");
  -[PXCMMProgressBannerView _performLayoutInWidth:updateSubviewFrames:](self, "_performLayoutInWidth:updateSubviewFrames:", 1, v3);
}

- (void)_updateActivityTitle
{
  __CFString *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  __CFString *v14;
  __CFString *v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  -[PXMomentShareStatusPresentation activityTitle](self->_momentShareStatusPresentation, "activityTitle");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!-[__CFString length](v3, "length"))
  {
    +[PXCompleteMyMomentSettings sharedInstance](PXCompleteMyMomentSettings, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "showProgressBannerView");

    if (v5)
    {

      v3 = CFSTR("<debug activity status>");
    }
  }
  _ActivityTitleAttributes();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXMomentShareStatusPresentation actionTitle](self->_momentShareStatusPresentation, "actionTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    MEMORY[0x1A85CC970](12, 2, 8);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0DC1140];
    v16[0] = *MEMORY[0x1E0DC1138];
    v16[1] = v9;
    v17[0] = v8;
    objc_msgSend(MEMORY[0x1E0DC3658], "linkColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PXAttributedStringForStringWithActionTitle(v3, v7, v6, v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = -[__CFString length](v3, "length");
    v14 = CFSTR(" ");
    if (v13)
      v14 = v3;
    v15 = v14;

    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v15, v6);
    v3 = v15;
  }
  -[UITextView setAttributedText:](self->_activityTextView, "setAttributedText:", v12);

}

- (void)_updatePauseTitle
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  int v7;
  __CFString *v8;

  -[PXMomentShareStatusPresentation pauseTitle](self->_momentShareStatusPresentation, "pauseTitle");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!-[__CFString length](v8, "length"))
  {
    +[PXCompleteMyMomentSettings sharedInstance](PXCompleteMyMomentSettings, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "showProgressBannerView"))
    {
      +[PXCompleteMyMomentSettings sharedInstance](PXCompleteMyMomentSettings, "sharedInstance");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "showProgressBannerViewPaused");

      if (!v5)
        goto LABEL_6;
      v3 = v8;
      v8 = CFSTR("<debug pause status>");
    }

  }
LABEL_6:
  -[UILabel text](self->_pauseLabel, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length") == 0;

  LODWORD(v6) = -[__CFString length](v8, "length") == 0;
  -[UILabel setText:](self->_pauseLabel, "setText:", v8);
  if (v7 != (_DWORD)v6)
    -[PXCMMProgressBannerView setNeedsLayout](self, "setNeedsLayout");

}

- (void)_updateProgress
{
  double v3;
  void *v4;
  void *v5;
  int v6;

  -[PXMomentShareStatusPresentation activityProgress](self->_momentShareStatusPresentation, "activityProgress");
  if (*(float *)&v3 == -1.0)
  {
    +[PXCompleteMyMomentSettings sharedInstance](PXCompleteMyMomentSettings, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "showProgressBannerView") & 1) != 0)
    {
      +[PXCompleteMyMomentSettings sharedInstance](PXCompleteMyMomentSettings, "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "showProgressBannerViewPaused");

      LODWORD(v3) = 0.5;
      if (v6)
        *(float *)&v3 = -1.0;
    }
    else
    {

      LODWORD(v3) = -1.0;
    }
  }
  -[UIProgressView setProgress:](self->_progressView, "setProgress:", v3);
}

- (CGSize)_performLayoutInWidth:(double)a3 updateSubviewFrames:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double MaxY;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  char v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double x;
  double v42;
  double v43;
  CGSize result;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;

  v4 = a4;
  -[UITextView font](self->_activityTextView, "font");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  PXScaledValueForTextStyleWithMaxContentSizeCategoryAndSymbolicTraits();
  v9 = v8;
  -[UITextView sizeThatFits:](self->_activityTextView, "sizeThatFits:", a3, 1.79769313e308);
  v11 = v10;
  objc_msgSend(v7, "ascender");
  v13 = v9 + 0.0 - v12;
  v45.origin.x = 0.0;
  v45.origin.y = 0.0;
  v45.size.width = a3;
  v45.size.height = 1.79769313e308;
  v46.origin.x = CGRectGetMinX(v45);
  x = v46.origin.x;
  v42 = v13;
  v46.origin.y = v13;
  v46.size.width = a3;
  v43 = v11;
  v46.size.height = v11;
  MaxY = CGRectGetMaxY(v46);
  objc_msgSend(v7, "descender");
  v16 = v15;

  -[UILabel text](self->_pauseLabel, "text");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "length");

  if (v18)
  {
    -[UILabel font](self->_pauseLabel, "font");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PXScaledValueForTextStyleWithMaxContentSizeCategoryAndSymbolicTraits();
    v21 = v20;
    -[UILabel sizeThatFits:](self->_pauseLabel, "sizeThatFits:", a3, 1.79769313e308);
    v23 = v22;
    objc_msgSend(v19, "ascender");
    v25 = MaxY + v16 + v21 - v24;
    v47.origin.x = 0.0;
    v47.origin.y = 0.0;
    v47.size.width = a3;
    v47.size.height = 1.79769313e308;
    v48.origin.x = CGRectGetMinX(v47);
    v26 = v48.origin.x;
    v48.origin.y = v25;
    v48.size.width = a3;
    v40 = v23;
    v48.size.height = v23;
    MaxY = CGRectGetMaxY(v48);
    objc_msgSend(v19, "descender");
    v16 = v27;

    v39 = a3;
  }
  else
  {
    v26 = *MEMORY[0x1E0C9D648];
    v25 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v39 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v40 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }
  PXScaledValueForTextStyleWithMaxContentSizeCategoryAndSymbolicTraits();
  v29 = v28;
  -[UIProgressView sizeThatFits:](self->_progressView, "sizeThatFits:", a3, 1.79769313e308);
  v31 = v30;
  v32 = v16 + MaxY + v29 - v30;
  v49.origin.x = 0.0;
  v49.origin.y = 0.0;
  v49.size.width = a3;
  v49.size.height = 1.79769313e308;
  v50.origin.x = CGRectGetMinX(v49);
  v33 = v50.origin.x;
  v50.origin.y = v32;
  v50.size.width = a3;
  v50.size.height = v31;
  v34 = CGRectGetMaxY(v50);
  if (v4)
  {
    -[UITextView setFrame:](self->_activityTextView, "setFrame:", x, v42, a3, v43);
    -[UILabel setFrame:](self->_pauseLabel, "setFrame:", v26, v25, v39, v40);
    -[UIProgressView setFrame:](self->_progressView, "setFrame:", v33, v32, a3, v31);
    v35 = PXFloatApproximatelyEqualToFloat();
    self->_layoutHeight = v34;
    if ((v35 & 1) == 0)
    {
      -[PXCMMProgressBannerView delegate](self, "delegate");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "progressBannerViewLayoutHeightDidChange:", self);

    }
  }
  v37 = a3;
  v38 = v34;
  result.height = v38;
  result.width = v37;
  return result;
}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  id v4;

  PXCappedFontWithTextStyle();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_pauseLabel, "setFont:", v4);
  -[UITextView setFont:](self->_activityTextView, "setFont:", v4);
  -[PXCMMProgressBannerView setNeedsLayout](self, "setNeedsLayout");

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  PXMomentShareStatusPresentation *momentShareStatusPresentation;
  void *v14;
  void *v15;
  int v16;
  PXMomentShareStatusPresentation *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if ((void *)PXMomentShareStatusPresentationObservationContext_154004 != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMProgressBannerView.m"), 289, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v10 = v9;
  if ((a4 & 0x20) != 0)
    -[PXCMMProgressBannerView _updatePauseTitle](self, "_updatePauseTitle");
  if ((a4 & 0x7C0) != 0)
  {
    -[PXCMMProgressBannerView alertController](self, "alertController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      PLUserStatusUIGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        momentShareStatusPresentation = self->_momentShareStatusPresentation;
        v16 = 138543362;
        v17 = momentShareStatusPresentation;
        _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_DEFAULT, "CMM Progress Banner: Auto-dismiss alert for replaced action (%{public}@)", (uint8_t *)&v16, 0xCu);
      }

      -[PXCMMProgressBannerView delegate](self, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "progressBannerView:dismissViewController:", self, v11);

      -[PXCMMProgressBannerView setAlertController:](self, "setAlertController:", 0);
    }

    LODWORD(v11) = 1;
    if ((a4 & 0x1000) != 0)
      goto LABEL_10;
  }
  else
  {
    v11 = (void *)((a4 >> 3) & 1);
    if ((a4 & 0x1000) != 0)
LABEL_10:
      -[PXCMMProgressBannerView _updateProgress](self, "_updateProgress");
  }
  if ((_DWORD)v11)
    -[PXCMMProgressBannerView _updateActivityTitle](self, "_updateActivityTitle");

}

- (void)_performActionFromView:(id)a3 sourceRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void (**v10)(_QWORD);
  NSObject *v11;
  PXMomentShareStatusPresentation *momentShareStatusPresentation;
  void *v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  int v17;
  NSObject *v18;
  _BOOL4 v19;
  PXMomentShareStatusPresentation *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  PXMomentShareStatusPresentation *v32;
  _QWORD v33[5];
  id v34;
  _QWORD v35[5];
  void (**v36)(_QWORD);
  id v37;
  uint8_t buf[4];
  PXMomentShareStatusPresentation *v39;
  uint64_t v40;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v40 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  -[PXMomentShareStatusPresentation action](self->_momentShareStatusPresentation, "action");
  v10 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    PLUserStatusUIGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      momentShareStatusPresentation = self->_momentShareStatusPresentation;
      *(_DWORD *)buf = 138543362;
      v39 = momentShareStatusPresentation;
      _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_DEFAULT, "CMM Progress Banner: User invoked un-pause action (%{public}@)", buf, 0xCu);
    }

    -[PXMomentShareStatusPresentation actionConfirmationAlertTitle](self->_momentShareStatusPresentation, "actionConfirmationAlertTitle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXMomentShareStatusPresentation actionConfirmationAlertButtonTitle](self->_momentShareStatusPresentation, "actionConfirmationAlertButtonTitle");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v13)
      v16 = v14 == 0;
    else
      v16 = 1;
    v17 = !v16;
    PLUserStatusUIGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
    if (v17)
    {
      if (v19)
      {
        v20 = self->_momentShareStatusPresentation;
        *(_DWORD *)buf = 138543362;
        v39 = v20;
        _os_log_impl(&dword_1A6789000, v18, OS_LOG_TYPE_DEFAULT, "CMM Progress Banner: Presenting confirmation alert (%{public}@)", buf, 0xCu);
      }

      objc_initWeak((id *)buf, self);
      objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v13, 0, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (void *)MEMORY[0x1E0DC3448];
      v23 = MEMORY[0x1E0C809B0];
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __61__PXCMMProgressBannerView__performActionFromView_sourceRect___block_invoke;
      v35[3] = &unk_1E512EBC0;
      v35[4] = self;
      objc_copyWeak(&v37, (id *)buf);
      v36 = v10;
      objc_msgSend(v22, "actionWithTitle:style:handler:", v15, 0, v35);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addAction:", v24);

      v25 = (void *)MEMORY[0x1E0DC3448];
      PXLocalizedStringFromTable(CFSTR("PXCancel"), CFSTR("PhotosUICore"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = v23;
      v33[1] = 3221225472;
      v33[2] = __61__PXCMMProgressBannerView__performActionFromView_sourceRect___block_invoke_161;
      v33[3] = &unk_1E512EBE8;
      v33[4] = self;
      objc_copyWeak(&v34, (id *)buf);
      objc_msgSend(v25, "actionWithTitle:style:handler:", v26, 1, v33);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addAction:", v27);

      objc_msgSend(v21, "popoverPresentationController");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setSourceView:", v9);

      objc_msgSend(v21, "popoverPresentationController");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setSourceRect:", x, y, width, height);

      objc_msgSend(v21, "popoverPresentationController");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "setPermittedArrowDirections:", 2);

      -[PXCMMProgressBannerView setAlertController:](self, "setAlertController:", v21);
      -[PXCMMProgressBannerView delegate](self, "delegate");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "progressBannerView:presentViewController:", self, v21);

      objc_destroyWeak(&v34);
      objc_destroyWeak(&v37);

      objc_destroyWeak((id *)buf);
    }
    else
    {
      if (v19)
      {
        v32 = self->_momentShareStatusPresentation;
        *(_DWORD *)buf = 138543362;
        v39 = v32;
        _os_log_impl(&dword_1A6789000, v18, OS_LOG_TYPE_DEFAULT, "CMM Progress Banner: Invoking action without confirmation (%{public}@)", buf, 0xCu);
      }

      v10[2](v10);
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
    v16[2] = __75__PXCMMProgressBannerView_textView_primaryActionForTextItem_defaultAction___block_invoke;
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

- (PXCMMProgressBannerViewDelegate)delegate
{
  return (PXCMMProgressBannerViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)layoutHeight
{
  return self->_layoutHeight;
}

- (UIAlertController)alertController
{
  return self->_alertController;
}

- (void)setAlertController:(id)a3
{
  objc_storeStrong((id *)&self->_alertController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_pauseLabel, 0);
  objc_storeStrong((id *)&self->_activityTextView, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_momentShareStatusPresentation, 0);
}

void __75__PXCMMProgressBannerView_textView_primaryActionForTextItem_defaultAction___block_invoke(id *a1)
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

uint64_t __61__PXCMMProgressBannerView__performActionFromView_sourceRect___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PLUserStatusUIGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 416);
    v6 = 138543362;
    v7 = v3;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_DEFAULT, "CMM Progress Banner: User confirmed action (%{public}@)", (uint8_t *)&v6, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "setAlertController:", 0);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __61__PXCMMProgressBannerView__performActionFromView_sourceRect___block_invoke_161(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id WeakRetained;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  PLUserStatusUIGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 416);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_DEFAULT, "CMM Progress Banner: User cancelled action (%{public}@)", (uint8_t *)&v5, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setAlertController:", 0);

}

@end
