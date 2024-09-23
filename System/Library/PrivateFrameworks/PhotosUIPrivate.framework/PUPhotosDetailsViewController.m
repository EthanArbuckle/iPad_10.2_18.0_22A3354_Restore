@implementation PUPhotosDetailsViewController

- (PUPhotosDetailsViewController)initWithContext:(id)a3 options:(unint64_t)a4
{
  objc_class *v6;
  id v7;
  id v8;
  PUPhotosDetailsViewController *v9;

  v6 = (objc_class *)MEMORY[0x1E0D7B798];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  objc_msgSend(v8, "setOptions:", a4);
  v9 = -[PUPhotosDetailsViewController initWithContext:configuration:assetViewModel:](self, "initWithContext:configuration:assetViewModel:", v7, v8, 0);

  return v9;
}

- (PUPhotosDetailsViewController)initWithContext:(id)a3 configuration:(id)a4
{
  return -[PUPhotosDetailsViewController initWithContext:configuration:assetViewModel:](self, "initWithContext:configuration:assetViewModel:", a3, a4, 0);
}

- (PUPhotosDetailsViewController)initWithContext:(id)a3 configuration:(id)a4 assetViewModel:(id)a5
{
  id v9;
  PUPhotosDetailsViewController *v10;
  PUPhotosDetailsViewController *v11;
  void *v12;
  objc_super v14;

  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PUPhotosDetailsViewController;
  v10 = -[PXPhotosDetailsUIViewController initWithContext:configuration:](&v14, sel_initWithContext_configuration_, a3, a4);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_assetViewModel, a5);
    -[PUAssetViewModel registerChangeObserver:](v11->_assetViewModel, "registerChangeObserver:", v11);
    -[PUPhotosDetailsViewController _configureVisualSearchTopResultItem](v11, "_configureVisualSearchTopResultItem");
    v12 = (void *)-[PUPhotosDetailsViewController superclass](v11, "superclass");
    v11->_superRespondsTo.scrollViewControllerDidScroll = objc_msgSend(v12, "instancesRespondToSelector:", sel_scrollViewControllerDidScroll_);
    v11->_superRespondsTo.scrollViewControllerContentBoundsDidChange = objc_msgSend(v12, "instancesRespondToSelector:", sel_scrollViewControllerContentBoundsDidChange_);
  }

  return v11;
}

- (void)_configureVisualSearchTopResultItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;

  -[PUPhotosDetailsViewController assetViewModel](self, "assetViewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visualImageAnalysis");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resultItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x1E0D7B7D8]);
    objc_msgSend(v6, "glyphName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayMessage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v7, "initWithGlyphName:visualDomain:displayMessage:", v8, v9, v10);

  }
  else
  {
    v11 = 0;
  }
  -[PXPhotosDetailsUIViewController context](self, "context");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __68__PUPhotosDetailsViewController__configureVisualSearchTopResultItem__block_invoke;
  v14[3] = &unk_1E58A6530;
  v15 = v11;
  v13 = v11;
  objc_msgSend(v12, "performChanges:", v14);

}

- (void)setEmpty:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUPhotosDetailsViewController;
  -[PXPhotosDetailsUIViewController setEmpty:](&v4, sel_setEmpty_, a3);
  -[PUPhotosDetailsViewController _setNeedsUpdateContentUnavailableConfiguration](self, "_setNeedsUpdateContentUnavailableConfiguration");
}

- (void)_updateContentUnavailableConfigurationUsingState:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (-[PXPhotosDetailsUIViewController isEmpty](self, "isEmpty"))
  {
    objc_msgSend(MEMORY[0x1E0DC3698], "px_containerized_defaultConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PULocalizedString(CFSTR("PUPhotosDetailsViewControllerContentUnavailableTitle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setText:", v5);

    objc_msgSend(v4, "updatedConfigurationForState:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPhotosDetailsViewController _setContentUnavailableConfiguration:](self, "_setContentUnavailableConfiguration:", v6);

  }
  else
  {
    -[PUPhotosDetailsViewController _setContentUnavailableConfiguration:](self, "_setContentUnavailableConfiguration:", 0);
  }

}

- (CGSize)preferredContentSize
{
  double v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  uint64_t v8;
  void *v9;
  double v10;
  uint64_t v11;
  double v12;
  double v13;
  CGSize result;

  v3 = *MEMORY[0x1E0C9D820];
  *(double *)&v4 = 500.0;
  if (-[PUPhotosDetailsViewController isViewLoaded](self, "isViewLoaded"))
  {
    -[PXPhotosDetailsUIViewController scrollViewController](self, "scrollViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[PXPhotosDetailsUIViewController scrollViewController](self, "scrollViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "presentedContentSize");
      v3 = v7;
      v4 = v8;

      if (PXSizeIsEmpty())
      {
        -[PUPhotosDetailsViewController view](self, "view");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[PUPhotosDetailsViewController contentBoundsInCoordinateSpace:](self, "contentBoundsInCoordinateSpace:", v9);
        v3 = v10;
        v4 = v11;

      }
    }
  }
  v12 = v3;
  v13 = *(double *)&v4;
  result.height = v13;
  result.width = v12;
  return result;
}

- (unint64_t)occludedContentEdges
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUPhotosDetailsViewController;
  return -[PXPhotosDetailsUIViewController occludedContentEdges](&v3, sel_occludedContentEdges) & 0xFFFFFFFFFFFFFFFELL;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)editingDidChange:(BOOL)a3
{
  int v3;
  void *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[7];

  v3 = a3;
  -[PUPhotosDetailsViewController assetViewModel](self, "assetViewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isInEditMode");

  if (v6 != v3)
  {
    if (v3)
      v7 = 0;
    else
      v7 = 2;
    if (v3)
      v8 = 2;
    else
      v8 = 0;
    -[PUPhotosDetailsViewController assetViewModel](self, "assetViewModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __50__PUPhotosDetailsViewController_editingDidChange___block_invoke;
    v10[3] = &unk_1E58A5BB0;
    v10[5] = v8;
    v10[6] = v7;
    v10[4] = self;
    objc_msgSend(v9, "performChanges:", v10);

  }
}

- (void)editorHeightDidChange
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;

  -[PXPhotosDetailsUIViewController captionWidgetCurrentContentHeight](self, "captionWidgetCurrentContentHeight");
  v4 = v3;
  -[PXPhotosDetailsUIViewController captionWidgetPreferredHeight](self, "captionWidgetPreferredHeight");
  if (vabdd_f64(v5, v4) >= 1.0)
  {
    v6 = v5 - v4;
    -[PUPhotosDetailsViewController accessoryContentViewControllerDelegate](self, "accessoryContentViewControllerDelegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accessoryContentViewController:editorHeightDidChange:", self, v6);

  }
}

- (void)visualSearchLookupWidgetDidTap
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[PUPhotosDetailsViewController assetViewModel](self, "assetViewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visualImageAnalysis");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resultItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "visualSearchImageAnalysisInteraction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "showVisualSearchForResultItem:", v5);
  PLVisualIntelligenceGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v2, "asset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138413058;
    v11 = v9;
    v12 = 2112;
    v13 = v3;
    v14 = 2112;
    v15 = v5;
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_INFO, "Visual Lookup item was tapped in 1Up's info panel (asset: %@, analysis: %@, top item: %@, interaction: %@)", (uint8_t *)&v10, 0x2Au);

  }
}

- (CGSize)minimumContentSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  v2 = *MEMORY[0x1E0C9D820];
  -[PXPhotosDetailsUIViewController captionWidgetPreferredHeight](self, "captionWidgetPreferredHeight");
  v4 = v3;
  v5 = v2;
  result.height = v4;
  result.width = v5;
  return result;
}

- (void)setMaxVisibleContentInsetsWhenInEdit:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double Height;
  double v22;
  double v23;
  CGRect v24;
  CGRect v25;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  -[PUPhotosDetailsViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v17 = left + v10;
  v18 = top + v12;
  v19 = v14 - (left + right);
  v20 = v16 - (top + bottom);
  v24.origin.x = v17;
  v24.origin.y = v18;
  v24.size.width = v19;
  v24.size.height = v20;
  Height = CGRectGetHeight(v24);
  if (Height <= 10.0)
  {
    v22 = v18;
  }
  else
  {
    v20 = v20 + -10.0;
    v22 = v18 + 10.0;
  }
  if (Height <= 10.0)
    v23 = v17;
  else
    v23 = v17 + 0.0;
  v25.origin.x = v23;
  v25.origin.y = v22;
  v25.size.width = v19;
  v25.size.height = v20;
  -[PUPhotosDetailsViewController setMaxVisibleHeightInEdit:](self, "setMaxVisibleHeightInEdit:", CGRectGetHeight(v25));
  -[PXPhotosDetailsUIViewController informFirstWidgetAvailableVisibleRectInEditMode:](self, "informFirstWidgetAvailableVisibleRectInEditMode:", v23, v22, v19, v20);
}

- (void)setContentInsets:(UIEdgeInsets)a3 changeReason:(int64_t)a4
{
  double right;
  double bottom;
  double left;
  double top;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v17;
  void *v18;
  id v19;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  -[PXPhotosDetailsUIViewController contentEdgeInsets](self, "contentEdgeInsets");
  if (left != v13 || top != v10 || right != v12 || bottom != v11)
  {
    -[PXPhotosDetailsUIViewController setContentEdgeInsets:](self, "setContentEdgeInsets:", top, left, bottom, right);
    if (a4 == 2)
    {
      -[PXPhotosDetailsUIViewController scrollViewController](self, "scrollViewController");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "scrollView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v18, "px_isScrolledAtEdge:", 1) & 1) == 0
        && (objc_msgSend(v17, "isDecelerating") & 1) == 0
        && (objc_msgSend(v17, "isDragging") & 1) == 0
        && (objc_msgSend(v17, "isTracking") & 1) == 0)
      {
        objc_msgSend(v18, "px_scrollToEdge:animated:", 1, 0);
      }

    }
    -[PUPhotosDetailsViewController accessoryContentViewControllerDelegate](self, "accessoryContentViewControllerDelegate");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "accessoryContentViewControllerContentBoundsDidChange:", self);

  }
}

- (BOOL)contentAreaContainsPoint:(CGPoint)a3 inCoordinateSpace:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  CGPoint v22;
  CGRect v23;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[PUPhotosDetailsViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  objc_msgSend(v8, "convertPoint:fromCoordinateSpace:", v7, x, y);
  v18 = v17;
  v20 = v19;

  v23.origin.x = v10;
  v23.origin.y = v12;
  v23.size.width = v14;
  v23.size.height = v16;
  v22.x = v18;
  v22.y = v20;
  LOBYTE(v7) = CGRectContainsPoint(v23, v22);

  return (char)v7;
}

- (CGRect)contentBoundsInCoordinateSpace:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGRect result;

  v4 = a3;
  -[PXPhotosDetailsUIViewController scrollViewController](self, "scrollViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentBounds");

  -[PXPhotosDetailsUIViewController scrollViewController](self, "scrollViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentInset");

  PXEdgeInsetsInsetRect();
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[PXPhotosDetailsUIViewController scrollViewController](self, "scrollViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "presentedContentSize");
  v17 = v16;

  if (!PXSizeIsEmpty())
    v14 = v17;
  -[PXPhotosDetailsUIViewController scrollViewController](self, "scrollViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "scrollView");
  v19 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "convertRect:toCoordinateSpace:", v4, v8, v10, v12, v14);
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;

  v28 = v21;
  v29 = v23;
  v30 = v25;
  v31 = v27;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (UIEdgeInsets)px_safeAreaInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  objc_super v21;
  UIEdgeInsets result;

  v21.receiver = self;
  v21.super_class = (Class)PUPhotosDetailsViewController;
  -[PUPhotosDetailsViewController px_safeAreaInsets](&v21, sel_px_safeAreaInsets);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PUPhotosDetailsViewController parentViewController](self, "parentViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "px_safeAreaInsets");
    v4 = v13;
    v6 = v14;
    v8 = v15;
    v10 = v16;
  }

  v17 = v4;
  v18 = v6;
  v19 = v8;
  v20 = v10;
  result.right = v20;
  result.bottom = v19;
  result.left = v18;
  result.top = v17;
  return result;
}

- (void)scrollViewControllerDidScroll:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  if (self->_superRespondsTo.scrollViewControllerDidScroll)
  {
    v7.receiver = self;
    v7.super_class = (Class)PUPhotosDetailsViewController;
    -[PXPhotosDetailsUIViewController scrollViewControllerDidScroll:](&v7, sel_scrollViewControllerDidScroll_, v4);
  }
  -[PUPhotosDetailsViewController assetViewModel](self, "assetViewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isInEditMode")
    && (objc_msgSend(v4, "isAnimatingScroll") & 1) == 0
    && ((objc_msgSend(v4, "isDecelerating") & 1) != 0
     || (objc_msgSend(v4, "isDragging") & 1) != 0
     || objc_msgSend(v4, "isTracking")))
  {
    -[PXPhotosDetailsUIViewController requestExitEditModeWithChangeSavingMode:](self, "requestExitEditModeWithChangeSavingMode:", 1);
  }
  -[PUPhotosDetailsViewController accessoryContentViewControllerDelegate](self, "accessoryContentViewControllerDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessoryContentViewControllerContentBoundsDidChange:", self);

}

- (void)scrollViewControllerContentBoundsDidChange:(id)a3
{
  void *v4;
  objc_super v5;

  if (self->_superRespondsTo.scrollViewControllerContentBoundsDidChange)
  {
    v5.receiver = self;
    v5.super_class = (Class)PUPhotosDetailsViewController;
    -[PUPhotosDetailsViewController scrollViewControllerContentBoundsDidChange:](&v5, sel_scrollViewControllerContentBoundsDidChange_, a3);
  }
  -[PUPhotosDetailsViewController accessoryContentViewControllerDelegate](self, "accessoryContentViewControllerDelegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessoryContentViewControllerContentBoundsDidChange:", self);

}

- (void)viewModel:(id)a3 didChange:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "isInEditModeChanged"))
  {
    if ((objc_msgSend(v8, "isInEditMode") & 1) != 0)
      goto LABEL_10;
    if (objc_msgSend(v8, "lastEditStyleChangeReason") != 2)
    {
      v7 = 2 * (objc_msgSend(v8, "lastEditStyleChangeReason") != 1);
LABEL_9:
      -[PXPhotosDetailsUIViewController requestExitEditModeWithChangeSavingMode:](self, "requestExitEditModeWithChangeSavingMode:", v7);
      goto LABEL_10;
    }
LABEL_8:
    v7 = 1;
    goto LABEL_9;
  }
  if (objc_msgSend(v6, "accessoryViewVisibilityChanged")
    && (objc_msgSend(v8, "isAccessoryViewVisible") & 1) == 0
    && objc_msgSend(v8, "editStyle") == 2)
  {
    goto LABEL_8;
  }
LABEL_10:
  if (objc_msgSend(v6, "visualImageAnalysisChanged"))
    -[PUPhotosDetailsViewController _configureVisualSearchTopResultItem](self, "_configureVisualSearchTopResultItem");

}

- (PUAccessoryContentViewControllerDelegate)accessoryContentViewControllerDelegate
{
  return (PUAccessoryContentViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_accessoryContentViewControllerDelegate);
}

- (void)setAccessoryContentViewControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_accessoryContentViewControllerDelegate, a3);
}

- (PUAssetViewModel)assetViewModel
{
  return self->_assetViewModel;
}

- (double)maxVisibleHeightInEdit
{
  return self->_maxVisibleHeightInEdit;
}

- (void)setMaxVisibleHeightInEdit:(double)a3
{
  self->_maxVisibleHeightInEdit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetViewModel, 0);
  objc_destroyWeak((id *)&self->_accessoryContentViewControllerDelegate);
}

void __50__PUPhotosDetailsViewController_editingDidChange___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1 == 2)
    v2 = 2;
  else
    v2 = v1 == 1;
  v3 = *(_QWORD *)(a1 + 48);
  if (v3 == 2)
    v4 = 2;
  else
    v4 = v3 == 1;
  objc_msgSend(*(id *)(a1 + 32), "assetViewModel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEditStyle:changeReason:", v2, v4);

}

uint64_t __68__PUPhotosDetailsViewController__configureVisualSearchTopResultItem__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setVisualLookupData:", *(_QWORD *)(a1 + 32));
}

@end
