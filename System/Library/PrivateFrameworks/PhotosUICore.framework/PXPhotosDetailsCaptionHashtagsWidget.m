@implementation PXPhotosDetailsCaptionHashtagsWidget

- (PXPhotosDetailsCaptionHashtagsWidget)init
{
  char *v2;
  PXPhotosDetailsCaptionHashtagsWidget *v3;
  PXCaptionHashtagsEntryView *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  PXCaptionHashtagsEntryView *textEntryView;
  uint64_t v11;
  UIView *textViewContainer;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PXPhotosDetailsCaptionHashtagsWidget;
  v2 = -[PXPhotosDetailsCaptionHashtagsWidget init](&v14, sel_init);
  v3 = (PXPhotosDetailsCaptionHashtagsWidget *)v2;
  if (v2)
  {
    *(_OWORD *)(v2 + 120) = *(_OWORD *)off_1E50B8810;
    *((_QWORD *)v2 + 11) = 1;
    v4 = [PXCaptionHashtagsEntryView alloc];
    v5 = *MEMORY[0x1E0C9D648];
    v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v9 = -[PXCaptionHashtagsEntryView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E0C9D648], v6, v7, v8);
    textEntryView = v3->_textEntryView;
    v3->_textEntryView = (PXCaptionHashtagsEntryView *)v9;

    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v5, v6, v7, v8);
    textViewContainer = v3->_textViewContainer;
    v3->_textViewContainer = (UIView *)v11;

  }
  return v3;
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
    -[PXPhotosDetailsCaptionHashtagsWidget _applySpec](self, "_applySpec");
    -[PXPhotosDetailsCaptionHashtagsWidget widgetDelegate](self, "widgetDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "widgetPreferredContentHeightForWidthDidChange:", self);

    v5 = v7;
  }

}

- (BOOL)hasContentForCurrentInput
{
  void *v2;
  BOOL v3;
  void *v4;
  void *v5;

  -[PXPhotosDetailsCaptionHashtagsWidget asset](self, "asset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "canPerformEditOperation:", 3) & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(v2, "descriptionProperties");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "assetDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v5, "length") != 0;

  }
  return v3;
}

- (double)currentContentHeight
{
  void *v2;
  double Height;
  CGRect v5;

  -[PXPhotosDetailsCaptionHashtagsWidget contentView](self, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  Height = CGRectGetHeight(v5);

  return Height;
}

- (double)preferredContentHeightForWidth:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;

  -[PXPhotosDetailsCaptionHashtagsWidget _contentInsets](self, "_contentInsets");
  v6 = v5;
  v8 = v7;
  v11 = fmax(a3 - (v9 + v10), 0.0);
  -[PXPhotosDetailsCaptionHashtagsWidget textEntryView](self, "textEntryView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "preferredHeightForWidth:", v11);
  v14 = v13;

  return v8 + v6 + v14;
}

- (void)setContentSize:(CGSize)a3
{
  self->_contentSize = a3;
}

- (void)setContext:(id)a3
{
  PXPhotosDetailsContext *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint8_t v11[16];

  v5 = (PXPhotosDetailsContext *)a3;
  if (self->_context != v5)
  {
    objc_storeStrong((id *)&self->_context, a3);
    -[PXPhotosDetailsContext firstAsset](v5, "firstAsset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosDetailsCaptionHashtagsWidget setAsset:](self, "setAsset:", v6);
    objc_msgSend(v6, "descriptionProperties");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "assetDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosDetailsCaptionHashtagsWidget textEntryView](self, "textEntryView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setOriginalText:", v8);

    if (!v6)
    {
      PLOneUpGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_ERROR, "No asset is in the photos details context!", v11, 2u);
      }

    }
  }

}

- (void)loadContentData
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "px_registerChangeObserver:", self);

}

- (void)unloadContentData
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "px_unregisterChangeObserver:", self);

}

- (PXAnonymousView)contentView
{
  _PXUIContainerView *containerView;
  double v5;
  double v6;
  double v7;
  double v8;
  _PXUIContainerView *v9;
  _PXUIContainerView *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  _PXUIContainerView *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v42;

  containerView = self->_containerView;
  if (!containerView)
  {
    -[PXPhotosDetailsCaptionHashtagsWidget contentSize](self, "contentSize");
    v6 = v5;
    v8 = v7;
    if (PXSizeIsNull())
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosDetailsCaptionHashtagsWidget.m"), 135, CFSTR("invalid content size"));

    }
    v9 = -[_PXUIContainerView initWithFrame:]([_PXUIContainerView alloc], "initWithFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v6, v8);
    v10 = self->_containerView;
    self->_containerView = v9;

    -[PXPhotosDetailsCaptionHashtagsWidget _textViewContainerInsets](self, "_textViewContainerInsets");
    PXEdgeInsetsInsetRect();
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    -[PXPhotosDetailsCaptionHashtagsWidget textViewContainer](self, "textViewContainer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setFrame:", v12, v14, v16, v18);

    if (-[PXPhotosDetailsCaptionHashtagsWidget _prefersFloatingInfoPanelLayout](self, "_prefersFloatingInfoPanelLayout"))
    {
      v20 = 8.0;
    }
    else
    {
      v20 = 0.0;
    }
    -[PXPhotosDetailsCaptionHashtagsWidget textViewContainer](self, "textViewContainer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setCornerRadius:", v20);

    -[PXPhotosDetailsCaptionHashtagsWidget _textEntryViewFrameForSize:](self, "_textEntryViewFrameForSize:", v16, v18);
    v24 = v23;
    v26 = v25;
    v28 = v27;
    v30 = v29;
    -[PXPhotosDetailsCaptionHashtagsWidget textEntryView](self, "textEntryView");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setFrame:", v24, v26, v28, v30);

    -[PXPhotosDetailsCaptionHashtagsWidget textEntryView](self, "textEntryView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setAccessibilityIdentifier:", CFSTR("com.apple.photos.infoPanel.caption.textField"));

    -[PXPhotosDetailsCaptionHashtagsWidget textEntryView](self, "textEntryView");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setDelegate:", self);

    v34 = self->_containerView;
    -[PXPhotosDetailsCaptionHashtagsWidget textViewContainer](self, "textViewContainer");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PXUIContainerView addSubview:](v34, "addSubview:", v35);

    -[PXPhotosDetailsCaptionHashtagsWidget textViewContainer](self, "textViewContainer");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosDetailsCaptionHashtagsWidget textEntryView](self, "textEntryView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addSubview:", v37);

    -[_PXUIContainerView layer](self->_containerView, "layer");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setAllowsGroupOpacity:", 0);

    -[PXPhotosDetailsCaptionHashtagsWidget _applySpec](self, "_applySpec");
    if (-[PXPhotosDetailsCaptionHashtagsWidget _fadeInEnabled](self, "_fadeInEnabled"))
    {
      -[PXPhotosDetailsCaptionHashtagsWidget _configureTextViewVisibility:](self, "_configureTextViewVisibility:", 0);
      -[PXPhotosDetailsCaptionHashtagsWidget deferredAppearingAnimation](self, "deferredAppearingAnimation");
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (v39)
      {
        -[PXPhotosDetailsCaptionHashtagsWidget deferredAppearingAnimation](self, "deferredAppearingAnimation");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[_PXUIContainerView setDeferredAppearingAnimation:](self->_containerView, "setDeferredAppearingAnimation:", v40);

        -[PXPhotosDetailsCaptionHashtagsWidget setDeferredAppearingAnimation:](self, "setDeferredAppearingAnimation:", 0);
      }
    }
    else
    {
      -[PXPhotosDetailsCaptionHashtagsWidget _configureTextViewVisibility:](self, "_configureTextViewVisibility:", 1);
    }
    containerView = self->_containerView;
  }
  return (PXAnonymousView *)containerView;
}

- (BOOL)_fadeInEnabled
{
  void *v3;
  char v4;

  if (-[PXPhotosDetailsCaptionHashtagsWidget _prefersFloatingInfoPanelLayout](self, "_prefersFloatingInfoPanelLayout"))
    return 0;
  +[PXPhotosDetailsSettings sharedInstance](PXPhotosDetailsSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "captionWidgetEnableFadeInEffect");

  return v4;
}

- (UIEdgeInsets)_textViewContainerInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  if (-[PXPhotosDetailsCaptionHashtagsWidget _prefersFloatingInfoPanelLayout](self, "_prefersFloatingInfoPanelLayout"))
  {
    PXEdgeInsetsMake();
  }
  else
  {
    v2 = *(double *)off_1E50B8020;
    v3 = *((double *)off_1E50B8020 + 1);
    v4 = *((double *)off_1E50B8020 + 2);
    v5 = *((double *)off_1E50B8020 + 3);
  }
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)contentViewWillAppear
{
  if (-[PXPhotosDetailsCaptionHashtagsWidget _fadeInEnabled](self, "_fadeInEnabled"))
    -[PXPhotosDetailsCaptionHashtagsWidget _configureFadeInAnimation](self, "_configureFadeInAnimation");
}

- (void)contentViewDidDisappear
{
  if (-[PXPhotosDetailsCaptionHashtagsWidget _fadeInEnabled](self, "_fadeInEnabled"))
    -[PXPhotosDetailsCaptionHashtagsWidget _configureTextViewVisibility:](self, "_configureTextViewVisibility:", 0);
}

- (void)contentViewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  id v5;
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  CGFloat v10;
  CGFloat v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[17];
  CGRect v17;
  CGRect v18;

  v5 = a4;
  -[PXPhotosDetailsCaptionHashtagsWidget _textViewContainerInsets](self, "_textViewContainerInsets");
  PXEdgeInsetsInsetRect();
  x = v17.origin.x;
  y = v17.origin.y;
  width = v17.size.width;
  height = v17.size.height;
  v10 = CGRectGetMaxY(v17) + -1.0;
  v18.origin.x = x;
  v18.origin.y = y;
  v18.size.width = width;
  v18.size.height = height;
  v11 = CGRectGetWidth(v18);
  -[PXPhotosDetailsCaptionHashtagsWidget _textEntryViewFrameForSize:](self, "_textEntryViewFrameForSize:", width, height);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __98__PXPhotosDetailsCaptionHashtagsWidget_contentViewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v16[3] = &unk_1E5119C90;
  v16[4] = self;
  *(CGFloat *)&v16[5] = x;
  *(CGFloat *)&v16[6] = y;
  *(double *)&v16[7] = width;
  *(double *)&v16[8] = height;
  v16[9] = 0;
  *(CGFloat *)&v16[10] = v10;
  *(CGFloat *)&v16[11] = v11;
  v16[12] = 0x3FF0000000000000;
  v16[13] = v12;
  v16[14] = v13;
  v16[15] = v14;
  v16[16] = v15;
  objc_msgSend(v5, "animateAlongsideTransition:completion:", v16, 0);

}

- (void)requestExitEditWithChangesSavingMode:(int64_t)a3
{
  id v4;

  -[PXPhotosDetailsCaptionHashtagsWidget setExitEditChangesSavingMode:](self, "setExitEditChangesSavingMode:", a3);
  -[PXPhotosDetailsCaptionHashtagsWidget textEntryView](self, "textEntryView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "exitEditing");

}

- (BOOL)wantsFocus
{
  void *v2;
  char v3;

  -[PXPhotosDetailsCaptionHashtagsWidget textEntryView](self, "textEntryView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEditing");

  return v3;
}

- (BOOL)canSnapToEdges
{
  return 1;
}

- (NSString)snappableWidgetIdentifier
{
  return (NSString *)CFSTR("PXPhotosDetailsCaptionHashtagsWidget");
}

- (void)setMaxVisibleSizeInEditMode:(CGSize)a3
{
  double v5;
  double v6;
  id v7;

  if (a3.width != self->_maxVisibleSizeInEditMode.width || a3.height != self->_maxVisibleSizeInEditMode.height)
  {
    self->_maxVisibleSizeInEditMode = a3;
    -[PXPhotosDetailsCaptionHashtagsWidget _textEntryViewFrameForSize:](self, "_textEntryViewFrameForSize:");
    v6 = v5;
    -[PXPhotosDetailsCaptionHashtagsWidget textEntryView](self, "textEntryView");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMaxHeightInEditMode:", v6);

  }
}

- (void)captionHashtagsEntryViewPreferredHeightDidChange:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  id v11;
  PXPhotosDetailsCaptionHashtagsWidget *v12;

  -[PXPhotosDetailsCaptionHashtagsWidget widgetDelegate](self, "widgetDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __89__PXPhotosDetailsCaptionHashtagsWidget_captionHashtagsEntryViewPreferredHeightDidChange___block_invoke;
  v10 = &unk_1E5148D08;
  v5 = v4;
  v11 = v5;
  v12 = self;
  objc_msgSend(v5, "widget:animateChanges:withAnimationOptions:", self, &v7, 0);
  -[PXPhotosDetailsCaptionHashtagsWidget widgetEditingDelegate](self, "widgetEditingDelegate", v7, v8, v9, v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "widgetEditorHeightDidChange:", self);

}

- (BOOL)captionHashtagsEntryViewShouldBeginEditing:(id)a3
{
  void *v3;
  char v4;

  -[PXPhotosDetailsCaptionHashtagsWidget asset](self, "asset", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "canPerformEditOperation:", 3);

  return v4;
}

- (void)captionHashtagsEntryViewDidBeginEditing:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  id v11;
  PXPhotosDetailsCaptionHashtagsWidget *v12;

  self->_isInEditMode = 1;
  -[PXPhotosDetailsCaptionHashtagsWidget widgetEditingDelegate](self, "widgetEditingDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "widget:didChangeEditingMode:", self, 1);
  -[PXPhotosDetailsCaptionHashtagsWidget widgetDelegate](self, "widgetDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __80__PXPhotosDetailsCaptionHashtagsWidget_captionHashtagsEntryViewDidBeginEditing___block_invoke;
  v10 = &unk_1E5148D08;
  v6 = v5;
  v11 = v6;
  v12 = self;
  objc_msgSend(v6, "widget:animateChanges:withAnimationOptions:", self, &v7, 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "widgetEditorHeightDidChange:", self, v7, v8, v9, v10);

}

- (BOOL)captionHashtagsEntryViewShouldEndEditing:(id)a3
{
  return 1;
}

- (void)captionHashtagsEntryViewDidEndEditing:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  char v15;
  uint64_t v16;
  int64_t v17;
  void *v18;
  dispatch_time_t v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t);
  void *v28;
  id v29;
  PXPhotosDetailsCaptionHashtagsWidget *v30;
  _QWORD block[4];
  id v32;
  __CFString *v33;

  -[PXPhotosDetailsCaptionHashtagsWidget asset](self, "asset", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "descriptionProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assetDescription");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (__CFString *)v6;
  else
    v8 = &stru_1E5149688;
  v9 = v8;

  -[PXPhotosDetailsCaptionHashtagsWidget textEntryView](self, "textEntryView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "text");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (__CFString *)v11;
  else
    v13 = &stru_1E5149688;
  v14 = v13;

  v15 = -[__CFString isEqualToString:](v9, "isEqualToString:", v14);
  v16 = MEMORY[0x1E0C809B0];
  if ((v15 & 1) == 0)
  {
    v17 = -[PXPhotosDetailsCaptionHashtagsWidget exitEditChangesSavingMode](self, "exitEditChangesSavingMode");
    if (v17)
    {
      if (v17 == 1)
      {
        -[PXPhotosDetailsCaptionHashtagsWidget textEntryView](self, "textEntryView");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setOriginalText:", v14);

        v19 = dispatch_time(0, 200000000);
        dispatch_get_global_queue(25, 0);
        v20 = objc_claimAutoreleasedReturnValue();
        block[0] = v16;
        block[1] = 3221225472;
        block[2] = __78__PXPhotosDetailsCaptionHashtagsWidget_captionHashtagsEntryViewDidEndEditing___block_invoke;
        block[3] = &unk_1E5148D08;
        v32 = v4;
        v33 = v14;
        dispatch_after(v19, v20, block);

      }
    }
    else
    {
      -[PXPhotosDetailsCaptionHashtagsWidget textEntryView](self, "textEntryView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "resetToOriginalText");

    }
    -[PXPhotosDetailsCaptionHashtagsWidget textEntryView](self, "textEntryView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosDetailsCaptionHashtagsWidget _logCPAnalyticsEventsForCommittedCaption:numOfHashtags:](self, "_logCPAnalyticsEventsForCommittedCaption:numOfHashtags:", v14, objc_msgSend(v22, "numberOfHashtagsInText"));

  }
  -[PXPhotosDetailsCaptionHashtagsWidget setExitEditChangesSavingMode:](self, "setExitEditChangesSavingMode:", 1);
  self->_isInEditMode = 0;
  -[PXPhotosDetailsCaptionHashtagsWidget widgetEditingDelegate](self, "widgetEditingDelegate");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v23, "widget:didChangeEditingMode:", self, 0);
  -[PXPhotosDetailsCaptionHashtagsWidget widgetDelegate](self, "widgetDelegate");
  v25 = v16;
  v26 = 3221225472;
  v27 = __78__PXPhotosDetailsCaptionHashtagsWidget_captionHashtagsEntryViewDidEndEditing___block_invoke_149;
  v28 = &unk_1E5148D08;
  v24 = (id)objc_claimAutoreleasedReturnValue();
  v29 = v24;
  v30 = self;
  objc_msgSend(v24, "widget:animateChanges:withAnimationOptions:", self, &v25, 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v23, "widgetEditorHeightDidChange:", self, v25, v26, v27, v28);

}

- (void)captionHashtagsEntryViewRequestFocus:(id)a3
{
  id v4;

  -[PXPhotosDetailsCaptionHashtagsWidget widgetDelegate](self, "widgetDelegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "widgetRequestFocus:", self);

}

- (id)prepareForPhotoLibraryChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  void *v14;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXPhotosDetailsCaptionHashtagsWidget asset](self, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "changeDetailsForObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectAfterChanges");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "fetchPropertySetsIfNeeded");
    objc_msgSend(v8, "descriptionProperties");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "assetDescription");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    v12 = &stru_1E5149688;
    if (v10)
      v12 = (__CFString *)v10;
    v13 = v12;

    v16[0] = CFSTR("new");
    v16[1] = CFSTR("description");
    v17[0] = v8;
    v17[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3 withPreparedInfo:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v11 = a4;
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("new"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PXPhotosDetailsCaptionHashtagsWidget setAsset:](self, "setAsset:", v5);
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("description"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosDetailsCaptionHashtagsWidget textEntryView](self, "textEntryView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "originalText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", v6);

    if ((v9 & 1) == 0)
    {
      -[PXPhotosDetailsCaptionHashtagsWidget textEntryView](self, "textEntryView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setOriginalText:", v6);

    }
  }

}

- (UIEdgeInsets)_contentInsets
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  UIEdgeInsets result;

  -[PXPhotosDetailsCaptionHashtagsWidget spec](self, "spec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentGuideInsets");
  v5 = v4;
  v7 = v6;

  -[PXPhotosDetailsCaptionHashtagsWidget textEntryView](self, "textEntryView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textContainerInsets");
  v10 = 16.0 - v9;
  -[PXPhotosDetailsCaptionHashtagsWidget textEntryView](self, "textEntryView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textContainerInsets");
  v13 = 16.0 - v12;

  v14 = v10;
  v15 = v5;
  v16 = v13;
  v17 = v7;
  result.right = v17;
  result.bottom = v16;
  result.left = v15;
  result.top = v14;
  return result;
}

- (BOOL)_prefersFloatingInfoPanelLayout
{
  void *v2;
  BOOL v3;

  -[PXPhotosDetailsCaptionHashtagsWidget spec](self, "spec");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "sizeClass") == 2;

  return v3;
}

- (CGRect)_textEntryViewFrameForSize:(CGSize)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect result;

  -[PXPhotosDetailsCaptionHashtagsWidget _contentInsets](self, "_contentInsets");
  -[PXPhotosDetailsCaptionHashtagsWidget textViewContainer](self, "textViewContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");

  PXEdgeInsetsInsetRect();
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (void)_logCPAnalyticsEventsForCommittedCaption:(id)a3 numOfHashtags:(unint64_t)a4
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[2];
  _QWORD v31[4];
  _QWORD v32[6];

  v32[4] = *MEMORY[0x1E0C80C00];
  v6 = objc_msgSend(a3, "length");
  -[PXPhotosDetailsCaptionHashtagsWidget asset](self, "asset");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6 && v7)
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0D09910];
    v13 = *MEMORY[0x1E0D09828];
    v31[0] = *MEMORY[0x1E0D09830];
    v12 = v31[0];
    v31[1] = v13;
    v32[0] = v10;
    v32[1] = v8;
    v31[2] = CFSTR("captionLength");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v32[2] = v14;
    v31[3] = CFSTR("numOfHashtags");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v26 = a4;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v32[3] = v15;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.oneUpCaptionEditExited"), v16);

    objc_msgSend(MEMORY[0x1E0D09910], "bucketNameForInteger:bucketLimits:", v6, 1, 10, 20, 30, 50, 100, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@With%@Characters"), CFSTR("com.apple.photos.CPAnalytics.oneUpCaptionEditExited"), v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x1E0D09910];
    v29[0] = v12;
    v29[1] = v13;
    v20 = v13;
    v30[0] = v10;
    v30[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "sendEvent:withPayload:", v18, v21);

    if (v26)
    {
      objc_msgSend(MEMORY[0x1E0D09910], "bucketNameForInteger:bucketLimits:", v26, 1, 2, 3, 5, 10, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@With%@Hashtags"), CFSTR("com.apple.photos.CPAnalytics.oneUpCaptionEditExited"), v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)MEMORY[0x1E0D09910];
      v27[0] = v12;
      v27[1] = v20;
      v28[0] = v10;
      v28[1] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "sendEvent:withPayload:", v23, v25);

    }
  }

}

- (void)_configureTextViewVisibility:(BOOL)a3
{
  double v4;
  void *v5;
  void *v6;
  id v7;

  if (a3)
    v4 = 1.0;
  else
    v4 = 0.0;
  -[PXPhotosDetailsCaptionHashtagsWidget containerView](self, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", v4);

  -[PXPhotosDetailsCaptionHashtagsWidget textEntryView](self, "textEntryView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uiTextView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", v4);

}

- (void)_applySpec
{
  void *v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  if (-[PXPhotosDetailsCaptionHashtagsWidget _prefersFloatingInfoPanelLayout](self, "_prefersFloatingInfoPanelLayout"))
  {
    -[PXPhotosDetailsCaptionHashtagsWidget _removeSeparatorView](self, "_removeSeparatorView");
    objc_msgSend(MEMORY[0x1E0DC3658], "tertiarySystemFillColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 8.0;
  }
  else
  {
    -[PXPhotosDetailsCaptionHashtagsWidget _addSeparatorView](self, "_addSeparatorView");
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = 0.0;
  }
  -[PXPhotosDetailsCaptionHashtagsWidget textViewContainer](self, "textViewContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v3);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosDetailsCaptionHashtagsWidget textEntryView](self, "textEntryView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uiTextView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v6);

  -[PXPhotosDetailsCaptionHashtagsWidget textViewContainer](self, "textViewContainer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setCornerRadius:", v4);

  -[PXPhotosDetailsCaptionHashtagsWidget spec](self, "spec");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPhotosDetailsCaptionHashtagsWidget textEntryView](self, "textEntryView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSpec:", v12);

}

- (void)_addSeparatorView
{
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  CGRect v19;
  CGRect v20;

  -[PXPhotosDetailsCaptionHashtagsWidget separatorView](self, "separatorView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[PXPhotosDetailsCaptionHashtagsWidget _removeSeparatorView](self, "_removeSeparatorView");
  -[PXPhotosDetailsCaptionHashtagsWidget textViewContainer](self, "textViewContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v19.origin.x = v6;
  v19.origin.y = v8;
  v19.size.width = v10;
  v19.size.height = v12;
  v13 = CGRectGetMaxY(v19) + -1.0;
  v20.origin.x = v6;
  v20.origin.y = v8;
  v20.size.width = v10;
  v20.size.height = v12;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", 0.0, v13, CGRectGetWidth(v20), 1.0);
  -[PXPhotosDetailsCaptionHashtagsWidget setSeparatorView:](self, "setSeparatorView:", v14);

  objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "colorWithAlphaComponent:", 0.1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosDetailsCaptionHashtagsWidget separatorView](self, "separatorView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setBackgroundColor:", v16);

  -[PXPhotosDetailsCaptionHashtagsWidget textViewContainer](self, "textViewContainer");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addSubview:", self->_separatorView);

}

- (void)_removeSeparatorView
{
  void *v3;
  void *v4;

  -[PXPhotosDetailsCaptionHashtagsWidget separatorView](self, "separatorView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PXPhotosDetailsCaptionHashtagsWidget separatorView](self, "separatorView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeFromSuperview");

    -[PXPhotosDetailsCaptionHashtagsWidget setSeparatorView:](self, "setSeparatorView:", 0);
  }
}

- (void)_configureFadeInAnimation
{
  void *v3;
  void *v4;
  void *v5;
  void (**v6)(_QWORD);
  void *v7;
  _QWORD aBlock[4];
  id v9[2];
  id location;

  +[PXPhotosDetailsSettings sharedInstance](PXPhotosDetailsSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "captionWidgetFadeInDuration");
  v5 = v4;

  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__PXPhotosDetailsCaptionHashtagsWidget__configureFadeInAnimation__block_invoke;
  aBlock[3] = &unk_1E51447A0;
  v9[1] = v5;
  objc_copyWeak(v9, &location);
  v6 = (void (**)(_QWORD))_Block_copy(aBlock);
  -[PXPhotosDetailsCaptionHashtagsWidget containerView](self, "containerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v6[2](v6);
  else
    -[PXPhotosDetailsCaptionHashtagsWidget setDeferredAppearingAnimation:](self, "setDeferredAppearingAnimation:", v6);

  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

- (PXWidgetEditingDelegate)widgetEditingDelegate
{
  return (PXWidgetEditingDelegate *)objc_loadWeakRetained((id *)&self->_widgetEditingDelegate);
}

- (void)setWidgetEditingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_widgetEditingDelegate, a3);
}

- (PXPhotosDetailsContext)context
{
  return self->_context;
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

- (BOOL)isInEditMode
{
  return self->_isInEditMode;
}

- (CGSize)maxVisibleSizeInEditMode
{
  double width;
  double height;
  CGSize result;

  width = self->_maxVisibleSizeInEditMode.width;
  height = self->_maxVisibleSizeInEditMode.height;
  result.height = height;
  result.width = width;
  return result;
}

- (_PXUIContainerView)containerView
{
  return self->_containerView;
}

- (UIView)textViewContainer
{
  return self->_textViewContainer;
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
  objc_storeStrong((id *)&self->_separatorView, a3);
}

- (PXCaptionHashtagsEntryView)textEntryView
{
  return self->_textEntryView;
}

- (CGSize)contentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contentSize.width;
  height = self->_contentSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (PHAsset)asset
{
  return (PHAsset *)objc_getProperty(self, a2, 80, 1);
}

- (void)setAsset:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (int64_t)exitEditChangesSavingMode
{
  return self->_exitEditChangesSavingMode;
}

- (void)setExitEditChangesSavingMode:(int64_t)a3
{
  self->_exitEditChangesSavingMode = a3;
}

- (id)deferredAppearingAnimation
{
  return self->_deferredAppearingAnimation;
}

- (void)setDeferredAppearingAnimation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_deferredAppearingAnimation, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_textEntryView, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_textViewContainer, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_destroyWeak((id *)&self->_widgetDelegate);
  objc_storeStrong((id *)&self->_context, 0);
  objc_destroyWeak((id *)&self->_widgetEditingDelegate);
}

void __65__PXPhotosDetailsCaptionHashtagsWidget__configureFadeInAnimation__block_invoke(uint64_t a1)
{
  void *v1;
  double v2;
  _QWORD v3[4];
  id v4;

  v1 = (void *)MEMORY[0x1E0DC3F10];
  v2 = *(double *)(a1 + 40);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __65__PXPhotosDetailsCaptionHashtagsWidget__configureFadeInAnimation__block_invoke_2;
  v3[3] = &unk_1E5148D30;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  objc_msgSend(v1, "animateWithDuration:animations:", v3, v2);
  objc_destroyWeak(&v4);
}

void __65__PXPhotosDetailsCaptionHashtagsWidget__configureFadeInAnimation__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_configureTextViewVisibility:", 1);

}

void __78__PXPhotosDetailsCaptionHashtagsWidget_captionHashtagsEntryViewDidEndEditing___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __78__PXPhotosDetailsCaptionHashtagsWidget_captionHashtagsEntryViewDidEndEditing___block_invoke_2;
  v3[3] = &unk_1E5148D08;
  v4 = *(id *)(a1 + 32);
  v5 = *(id *)(a1 + 40);
  objc_msgSend(v2, "performChanges:completionHandler:", v3, &__block_literal_global_22980);

}

uint64_t __78__PXPhotosDetailsCaptionHashtagsWidget_captionHashtagsEntryViewDidEndEditing___block_invoke_149(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "widgetPreferredContentHeightForWidthDidChange:", *(_QWORD *)(a1 + 40));
}

void __78__PXPhotosDetailsCaptionHashtagsWidget_captionHashtagsEntryViewDidEndEditing___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CD13B0], "changeRequestForAsset:", *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAssetDescription:", *(_QWORD *)(a1 + 40));

}

void __78__PXPhotosDetailsCaptionHashtagsWidget_captionHashtagsEntryViewDidEndEditing___block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((a2 & 1) == 0)
  {
    PLOneUpGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 138412290;
      v7 = v4;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "Saving assetDescription failed with error: %@", (uint8_t *)&v6, 0xCu);
    }

  }
}

uint64_t __80__PXPhotosDetailsCaptionHashtagsWidget_captionHashtagsEntryViewDidBeginEditing___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "widgetPreferredContentHeightForWidthDidChange:", *(_QWORD *)(a1 + 40));
}

uint64_t __89__PXPhotosDetailsCaptionHashtagsWidget_captionHashtagsEntryViewPreferredHeightDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "widgetPreferredContentHeightForWidthDidChange:", *(_QWORD *)(a1 + 40));
}

void __98__PXPhotosDetailsCaptionHashtagsWidget_contentViewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;

  v2 = *(double *)(a1 + 40);
  v3 = *(double *)(a1 + 48);
  v4 = *(double *)(a1 + 56);
  v5 = *(double *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "textViewContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFrame:", v2, v3, v4, v5);

  v7 = *(double *)(a1 + 72);
  v8 = *(double *)(a1 + 80);
  v9 = *(double *)(a1 + 88);
  v10 = *(double *)(a1 + 96);
  objc_msgSend(*(id *)(a1 + 32), "separatorView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v7, v8, v9, v10);

  v12 = *(double *)(a1 + 104);
  v13 = *(double *)(a1 + 112);
  v14 = *(double *)(a1 + 120);
  v15 = *(double *)(a1 + 128);
  objc_msgSend(*(id *)(a1 + 32), "textEntryView");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFrame:", v12, v13, v14, v15);

}

@end
