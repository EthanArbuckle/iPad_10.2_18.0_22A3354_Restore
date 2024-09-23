@implementation PXHorizontalCollectionGadget

- (PXHorizontalCollectionGadget)initWithLayout:(id)a3 dataSourceManager:(id)a4
{
  char *v4;
  PXHorizontalCollectionGadget *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXHorizontalCollectionGadget;
  v4 = -[PXGadgetUIViewController initWithLayout:dataSourceManager:](&v8, sel_initWithLayout_dataSourceManager_, a3, a4);
  v5 = (PXHorizontalCollectionGadget *)v4;
  if (v4)
  {
    *(_OWORD *)(v4 + 1304) = *(_OWORD *)off_1E50B8810;
    *((_QWORD *)v4 + 156) = 0;
    *((_QWORD *)v4 + 162) = 0;
    v4[1178] = 1;
    objc_msgSend(v4, "setContentVisible:", 0);
    -[PXGadgetUIViewController anchorHelper](v5, "anchorHelper");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAnchorPosition:", 0);

  }
  return v5;
}

- (PXHorizontalCollectionGadget)initWithProviders:(id)a3
{
  id v4;
  PXBasicGadgetDataSourceManager *v5;
  PXHorizontalCollectionGadget *v6;

  v4 = a3;
  v5 = -[PXBasicGadgetDataSourceManager initWithProviders:]([PXBasicGadgetDataSourceManager alloc], "initWithProviders:", v4);

  v6 = -[PXHorizontalCollectionGadget initWithDataSourceManager:](self, "initWithDataSourceManager:", v5);
  return v6;
}

- (PXHorizontalCollectionGadget)initWithProviders:(id)a3 layout:(id)a4
{
  id v6;
  id v7;
  PXBasicGadgetDataSourceManager *v8;
  PXHorizontalCollectionGadget *v9;

  v6 = a4;
  v7 = a3;
  v8 = -[PXBasicGadgetDataSourceManager initWithProviders:]([PXBasicGadgetDataSourceManager alloc], "initWithProviders:", v7);

  v9 = -[PXHorizontalCollectionGadget initWithLayout:dataSourceManager:](self, "initWithLayout:dataSourceManager:", v6, v8);
  return v9;
}

- (PXHorizontalCollectionGadget)initWithDataSourceManager:(id)a3
{
  id v4;
  PXGadgetCollectionViewLayout *v5;
  PXHorizontalCollectionGadget *v6;

  v4 = a3;
  v5 = objc_alloc_init(PXGadgetCollectionViewLayout);
  -[PXGadgetCollectionViewLayout setScrollDirection:](v5, "setScrollDirection:", 1);
  v6 = -[PXHorizontalCollectionGadget initWithLayout:dataSourceManager:](self, "initWithLayout:dataSourceManager:", v5, v4);

  return v6;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  _BOOL8 prefersPagingEnabled;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXHorizontalCollectionGadget;
  -[PXGadgetUIViewController viewDidLoad](&v8, sel_viewDidLoad);
  -[PXHorizontalCollectionGadget collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClipsToBounds:", 0);
  -[PXHorizontalCollectionGadget gadgetSpec](self, "gadgetSpec");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentInsets");
  objc_msgSend(v3, "setContentInset:");

  objc_msgSend(v3, "setShowsHorizontalScrollIndicator:", 0);
  objc_msgSend(v3, "setShowsVerticalScrollIndicator:", 0);
  objc_msgSend(v3, "setContentInsetAdjustmentBehavior:", 2);
  objc_msgSend(v3, "_setAutomaticContentOffsetAdjustmentEnabled:", 1);
  objc_msgSend(v3, "setAlwaysBounceVertical:", 0);
  objc_msgSend(v3, "setAlwaysBounceHorizontal:", 1);
  objc_msgSend(v3, "setDirectionalLockEnabled:", 1);
  objc_msgSend(v3, "setFocusGroupIdentifier:", 0);
  objc_msgSend(v3, "setSelectionFollowsFocus:", -[PXHorizontalCollectionGadget selectionFollowsFocus](self, "selectionFollowsFocus"));
  prefersPagingEnabled = self->_prefersPagingEnabled;
  -[PXGadgetUIViewController layout](self, "layout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPrefersPagingEnabled:", prefersPagingEnabled);

  -[UIViewController px_extendedTraitCollection](self, "px_extendedTraitCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerChangeObserver:context:", self, PXExtendedTraitCollectionObservationContext_207233);
  -[PXHorizontalCollectionGadget _updateColumnSettings](self, "_updateColumnSettings");

}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXHorizontalCollectionGadget;
  -[PXGadgetUIViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[PXHorizontalCollectionGadget contentViewDidDisappear](self, "contentViewDidDisappear");
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  -[PXGadgetUIViewController anchorHelper](self, "anchorHelper");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigateToAnchorIfNeeded");

  v6.receiver = self;
  v6.super_class = (Class)PXHorizontalCollectionGadget;
  -[PXGadgetUIViewController viewWillAppear:](&v6, sel_viewWillAppear_, v3);
  -[PXHorizontalCollectionGadget contentViewWillAppear](self, "contentViewWillAppear");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXHorizontalCollectionGadget;
  -[PXGadgetUIViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PXHorizontalCollectionGadget setIsResourceLoaded:](self, "setIsResourceLoaded:", 1);
}

- (void)setDefaultColumnSpan:(int64_t)a3
{
  id v4;

  if (self->_defaultColumnSpan != a3)
  {
    self->_defaultColumnSpan = a3;
    -[PXHorizontalCollectionGadget traitCollection](self, "traitCollection");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[PXHorizontalCollectionGadget setCurrentColumnSpan:](self, "setCurrentColumnSpan:", -[PXHorizontalCollectionGadget _columnSpanForTraitCollection:](self, "_columnSpanForTraitCollection:", v4));

  }
}

- (BOOL)isRootGadgetViewController
{
  return 0;
}

- (void)setLayout:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXHorizontalCollectionGadget;
  -[PXGadgetUIViewController setLayout:](&v4, sel_setLayout_, a3);
  -[PXHorizontalCollectionGadget _updateColumnSettings](self, "_updateColumnSettings");
  -[PXHorizontalCollectionGadget _updateCollectionViewPaging](self, "_updateCollectionViewPaging");
}

- (void)performChanges:(id)a3
{
  _BOOL8 v4;
  void (**v5)(id, PXHorizontalCollectionGadget *);

  v5 = (void (**)(id, PXHorizontalCollectionGadget *))a3;
  v4 = -[PXHorizontalCollectionGadget isPerformingChanges](self, "isPerformingChanges");
  -[PXHorizontalCollectionGadget setIsPerformingChanges:](self, "setIsPerformingChanges:", 1);
  if (v5)
    v5[2](v5, self);
  -[PXHorizontalCollectionGadget setIsPerformingChanges:](self, "setIsPerformingChanges:", v4);
  if (!-[PXHorizontalCollectionGadget isPerformingChanges](self, "isPerformingChanges"))
    -[PXHorizontalCollectionGadget updateIfNeeded](self, "updateIfNeeded");

}

- (void)setCollectionTitle:(id)a3
{
  NSString **p_collectionTitle;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (!-[PXHorizontalCollectionGadget isPerformingChanges](self, "isPerformingChanges"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXHorizontalCollectionGadget.m"), 164, CFSTR("[%@] %@ must be called from a performChanges block."), self, v8);

  }
  p_collectionTitle = &self->_collectionTitle;
  if (!-[NSString isEqualToString:](*p_collectionTitle, "isEqualToString:", v9))
  {
    objc_storeStrong((id *)p_collectionTitle, a3);
    LOBYTE(_horizontalGadgetUpdateFlags) = 1;
  }

}

- (void)setCollectionAccessoryButtonType:(unint64_t)a3
{
  void *v6;
  void *v7;

  if (!-[PXHorizontalCollectionGadget isPerformingChanges](self, "isPerformingChanges"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXHorizontalCollectionGadget.m"), 174, CFSTR("[%@] %@ must be called from a performChanges block."), self, v7);

  }
  if (self->_collectionAccessoryButtonType != a3)
  {
    self->_collectionAccessoryButtonType = a3;
    HIBYTE(_horizontalGadgetUpdateFlags) = 1;
  }
}

- (void)setCollectionAccessoryButtonTitle:(id)a3
{
  NSString *v5;
  char v6;
  NSString *v7;
  NSString *collectionAccessoryButtonTitle;
  void *v9;
  void *v10;
  NSString *v11;

  v11 = (NSString *)a3;
  if (!-[PXHorizontalCollectionGadget isPerformingChanges](self, "isPerformingChanges"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXHorizontalCollectionGadget.m"), 184, CFSTR("[%@] %@ must be called from a performChanges block."), self, v10);

  }
  v5 = self->_collectionAccessoryButtonTitle;
  if (v5 == v11)
  {

  }
  else
  {
    v6 = -[NSString isEqual:](v11, "isEqual:", v5);

    if ((v6 & 1) == 0)
    {
      v7 = (NSString *)-[NSString copy](v11, "copy");
      collectionAccessoryButtonTitle = self->_collectionAccessoryButtonTitle;
      self->_collectionAccessoryButtonTitle = v7;

      HIBYTE(_horizontalGadgetUpdateFlags) = 1;
    }
  }

}

- (void)setCollectionHeight:(double)a3
{
  void *v6;
  void *v7;

  if (!-[PXHorizontalCollectionGadget isPerformingChanges](self, "isPerformingChanges"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXHorizontalCollectionGadget.m"), 194, CFSTR("[%@] %@ must be called from a performChanges block."), self, v7);

  }
  if (self->_collectionHeight != a3)
  {
    self->_collectionHeight = a3;
    byte_1EE99808A = 1;
  }
}

- (unint64_t)gadgetCapabilities
{
  return 0;
}

- (void)setVisibleContentRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_visibleContentRect;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_visibleContentRect = &self->_visibleContentRect;
  if (!CGRectEqualToRect(a3, self->_visibleContentRect))
  {
    p_visibleContentRect->origin.x = x;
    p_visibleContentRect->origin.y = y;
    p_visibleContentRect->size.width = width;
    p_visibleContentRect->size.height = height;
    -[PXGadgetUIViewController visibleBoundsDidChange](self, "visibleBoundsDidChange");
  }
}

- (void)userDidSelectAccessoryButton:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  id v6;

  v6 = a3;
  -[PXHorizontalCollectionGadget accessoryButtonAction](self, "accessoryButtonAction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PXHorizontalCollectionGadget accessoryButtonAction](self, "accessoryButtonAction");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, PXHorizontalCollectionGadget *, id))v5)[2](v5, self, v6);

  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double v5;
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
  double v18;
  double v19;
  double v20;
  CGSize result;

  width = a3.width;
  -[PXHorizontalCollectionGadget collectionHeight](self, "collectionHeight", a3.width, a3.height);
  if (v5 == 0.0)
  {
    -[PXHorizontalCollectionGadget collectionView](self, "collectionView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contentInset");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    -[PXGadgetUIViewController layout](self, "layout");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "columnWidth");
    if (v16 == 0.0)
      v16 = width - v10 - v14;
    -[PXHorizontalCollectionGadget _ensureCachedHeightForColumnWidth:](self, "_ensureCachedHeightForColumnWidth:", v16);
    -[PXHorizontalCollectionGadget cachedMaxHeightForColumnWidth](self, "cachedMaxHeightForColumnWidth");
    v18 = v12 + v8 + v17;

  }
  else
  {
    v18 = v5;
  }
  v19 = width;
  v20 = v18;
  result.height = v20;
  result.width = v19;
  return result;
}

- (void)contentViewWillAppear
{
  -[PXGadgetUIViewController setContentVisible:](self, "setContentVisible:", 1);
}

- (void)contentViewDidDisappear
{
  -[PXGadgetUIViewController setContentVisible:](self, "setContentVisible:", 0);
}

- (void)setGadgetSpec:(id)a3
{
  PXGadgetSpec *v5;
  PXGadgetSpec *v6;
  BOOL v7;
  void *v8;
  PXGadgetSpec *v9;
  _QWORD v10[4];
  PXGadgetSpec *v11;
  PXHorizontalCollectionGadget *v12;

  v9 = (PXGadgetSpec *)a3;
  v5 = self->_gadgetSpec;
  v6 = v9;
  if (v5 == v9)
    goto LABEL_5;
  v7 = -[PXGadgetSpec isEqual:](v9, "isEqual:", v5);

  if (!v7)
  {
    objc_storeStrong((id *)&self->_gadgetSpec, a3);
    if (self->_gadgetSpec)
    {
      v8 = (void *)MEMORY[0x1E0DC3F10];
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __46__PXHorizontalCollectionGadget_setGadgetSpec___block_invoke;
      v10[3] = &unk_1E5148D08;
      v11 = v9;
      v12 = self;
      objc_msgSend(v8, "performWithoutAnimation:", v10);
      v6 = v11;
LABEL_5:

    }
  }

}

- (void)_updateCollectionViewPaging
{
  void *v3;
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
  double *v14;
  id v15;

  -[PXHorizontalCollectionGadget gadgetSpec](self, "gadgetSpec");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[PXGadgetUIViewController layout](self, "layout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v15, "layoutSizeClass");
  v5 = objc_msgSend(v15, "layoutOrientation");
  v6 = 0;
  if (v4 == 1 && v5 != 2)
    v6 = objc_msgSend(v3, "prefersPagingEnabled");
  -[PXHorizontalCollectionGadget collectionView](self, "collectionView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "columnSpacingForColumnSpan:", -[PXHorizontalCollectionGadget currentColumnSpan](self, "currentColumnSpan"));
  v9 = v8;
  objc_msgSend(v15, "contentInsets");
  objc_msgSend(v7, "_setPagingOrigin:", -v10, 0.0);
  objc_msgSend(v3, "columnWidth");
  v12 = v11;
  objc_msgSend(v15, "layoutReferenceWidth");
  objc_msgSend(v7, "_setInterpageSpacing:", v9 + v12 - v13, 0.0);
  objc_msgSend(v7, "setPagingEnabled:", v6);
  v14 = (double *)MEMORY[0x1E0DC5360];
  if (!(_DWORD)v6)
    v14 = (double *)MEMORY[0x1E0DC5368];
  objc_msgSend(v7, "setDecelerationRate:", *v14);

}

- (id)gadgetTransition
{
  void *v2;
  void *v3;

  -[PXHorizontalCollectionGadget delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "gadgetTransition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)rootNavigationHelper
{
  void *v2;
  void *v3;

  -[PXHorizontalCollectionGadget delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rootNavigationHelper");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)gadgetControllerHasAppeared
{
  id v2;

  -[PXGadgetUIViewController dataSource](self, "dataSource");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumerateGadgetsUsingBlock:", &__block_literal_global_207261);

}

- (void)gadgetControllerHasDisappeared
{
  id v2;

  -[PXGadgetUIViewController dataSource](self, "dataSource");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumerateGadgetsUsingBlock:", &__block_literal_global_20_207259);

}

- (void)gadgetControllerFinishedUpdatingDataSourceWithChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;

  objc_msgSend(a3, "sectionChanges");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "insertedIndexes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "containsIndex:", 0))
  {
    -[PXGadgetUIViewController dataSource](self, "dataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "firstItemIndexPath");
    }
    else
    {
      v11 = 0u;
      v12 = 0u;
    }
    objc_msgSend(v7, "gadgetAtIndexPath:", &v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[PXGadgetUIViewController navigationHelper](self, "navigationHelper");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "navigateToGadgetDeferIfNeeded:animated:nestedNavigationBlock:", v8, -[UIViewController px_isVisible](self, "px_isVisible"), 0);

    }
  }
  -[PXHorizontalCollectionGadget horizontalGadgetDelegate](self, "horizontalGadgetDelegate", v11, v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "horizontalCollectionGadgetDatasourceDidUpdate:", self);

}

- (id)previewViewControllerAtLocation:(CGPoint)a3 fromSourceView:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  PXGadgetOrbContext *v9;
  void *v10;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[PXGadgetUIViewController gadgetAtLocation:inCoordinateSpace:](self, "gadgetAtLocation:inCoordinateSpace:", v7, x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = objc_alloc_init(PXGadgetOrbContext);
    -[PXGadgetOrbContext setGadget:](v9, "setGadget:", v8);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v8, "previewViewControllerAtLocation:fromSourceView:", v7, x, y);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
    v9 = 0;
  }
  -[PXHorizontalCollectionGadget setPreviewOrbContext:](self, "setPreviewOrbContext:", v9);

  return v10;
}

- (id)previewParametersForTargetPreviewView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[PXHorizontalCollectionGadget previewOrbContext](self, "previewOrbContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "gadget");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "previewParametersForTargetPreviewView:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)contextMenuWithSuggestedActions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[PXHorizontalCollectionGadget previewOrbContext](self, "previewOrbContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "gadget");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "contextMenuWithSuggestedActions:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)commitPreviewViewController:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[PXHorizontalCollectionGadget previewOrbContext](self, "previewOrbContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXHorizontalCollectionGadget.m"), 379, CFSTR("previewOrbContext cannot be nil"));

  }
  -[PXHorizontalCollectionGadget previewOrbContext](self, "previewOrbContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "gadget");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "commitPreviewViewController:", v9);

}

- (void)didDismissPreviewViewController:(id)a3 committing:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a4;
  v11 = a3;
  -[PXHorizontalCollectionGadget previewOrbContext](self, "previewOrbContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXHorizontalCollectionGadget.m"), 387, CFSTR("previewOrbContext cannot be nil"));

  }
  -[PXHorizontalCollectionGadget previewOrbContext](self, "previewOrbContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "gadget");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v9, "didDismissPreviewViewController:committing:", v11, v4);

}

- (void)didDismissPreviewWithPreviewView:(id)a3 committing:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a4;
  v11 = a3;
  -[PXHorizontalCollectionGadget previewOrbContext](self, "previewOrbContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXHorizontalCollectionGadget.m"), 395, CFSTR("previewOrbContext cannot be nil"));

  }
  -[PXHorizontalCollectionGadget previewOrbContext](self, "previewOrbContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "gadget");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v9, "didDismissPreviewWithPreviewView:committing:", v11, v4);

}

- (void)commitPreviewView:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[PXHorizontalCollectionGadget previewOrbContext](self, "previewOrbContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXHorizontalCollectionGadget.m"), 403, CFSTR("previewOrbContext cannot be nil"));

  }
  -[PXHorizontalCollectionGadget previewOrbContext](self, "previewOrbContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "gadget");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "commitPreviewView:", v9);

}

- (id)targetPreviewViewForLocation:(CGPoint)a3 inCoordinateSpace:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[PXGadgetUIViewController gadgetAtLocation:inCoordinateSpace:](self, "gadgetAtLocation:inCoordinateSpace:", v7, x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "targetPreviewViewForLocation:inCoordinateSpace:", v7, x, y);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)prefetchDuringScrollingForWidth:(double)a3
{
  double v5;
  double v6;
  void *v7;
  _QWORD v8[6];
  _QWORD v9[4];

  if (!-[PXHorizontalCollectionGadget isResourceLoaded](self, "isResourceLoaded"))
  {
    -[PXHorizontalCollectionGadget setIsResourceLoaded:](self, "setIsResourceLoaded:", 1);
    -[PXHorizontalCollectionGadget cachedMaxHeightForColumnWidth](self, "cachedMaxHeightForColumnWidth");
    v6 = v5;
    v9[0] = 0;
    v9[1] = v9;
    v9[2] = 0x2020000000;
    v9[3] = vcvtpd_s64_f64(a3 / v5);
    -[PXGadgetUIViewController dataSource](self, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __64__PXHorizontalCollectionGadget_prefetchDuringScrollingForWidth___block_invoke;
    v8[3] = &unk_1E5136310;
    *(double *)&v8[5] = v6;
    v8[4] = v9;
    objc_msgSend(v7, "enumerateGadgetsUsingBlock:", v8);

    _Block_object_dispose(v9, 8);
  }
}

- (void)gadget:(id)a3 didChange:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PXHorizontalCollectionGadget;
  -[PXGadgetUIViewController gadget:didChange:](&v14, sel_gadget_didChange_, v6, a4);
  if ((a4 & 0x40) != 0)
    -[PXHorizontalCollectionGadget setCachedMaxHeightForColumnWidth:](self, "setCachedMaxHeightForColumnWidth:", *(double *)off_1E50B8810, *((double *)off_1E50B8810 + 1));
  if ((a4 & 1) != 0)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __49__PXHorizontalCollectionGadget_gadget_didChange___block_invoke;
    v12[3] = &unk_1E5136338;
    v13 = v6;
    -[PXHorizontalCollectionGadget performChanges:](self, "performChanges:", v12);

  }
  -[PXHorizontalCollectionGadget delegate](self, "delegate");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[PXHorizontalCollectionGadget delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      -[PXHorizontalCollectionGadget delegate](self, "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "gadget:didChange:", v6, a4);

    }
  }

}

- (BOOL)gadget:(id)a3 transitionToViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  char v12;
  void *v13;
  void *v14;
  objc_super v16;

  v7 = a5;
  v10 = a4;
  v11 = a6;
  v16.receiver = self;
  v16.super_class = (Class)PXHorizontalCollectionGadget;
  if (-[PXGadgetUIViewController gadget:transitionToViewController:animated:completion:](&v16, sel_gadget_transitionToViewController_animated_completion_, a3, v10, v7, v11))
  {
    v12 = 1;
  }
  else
  {
    -[PXHorizontalCollectionGadget delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
      v12 = objc_msgSend(v13, "gadget:transitionToViewController:animated:completion:", self, v10, v7, v11);
    else
      v12 = 0;

  }
  return v12;
}

- (id)presentationEnvironmentForGadget:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v11;
  objc_super v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXHorizontalCollectionGadget.m"), 479, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("gadget"));

  }
  -[PXHorizontalCollectionGadget delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "presentationEnvironmentForGadget:", v5);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PXHorizontalCollectionGadget;
    -[PXGadgetUIViewController presentationEnvironmentForGadget:](&v12, sel_presentationEnvironmentForGadget_, v5);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

  return v9;
}

- (void)collectionView:(id)a3 prefetchItemsAtIndexPaths:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _OWORD v12[2];
  uint8_t buf[16];

  v5 = a4;
  -[PXGadgetUIViewController gadgetViewControllerLog](self, "gadgetViewControllerLog");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "H_Gadget_CV_prefetchItems", ", buf, 2u);
  }
  objc_msgSend(v5, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[PXGadgetUIViewController dataSource](self, "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      objc_msgSend(v8, "firstItemIndexPath");
    else
      memset(v12, 0, sizeof(v12));
    objc_msgSend(v9, "gadgetAtIndexPath:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v10, "contentViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "view");

    }
    else
    {
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
LABEL_12:
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[PXHorizontalCollectionGadget cachedMaxHeightForColumnWidth](self, "cachedMaxHeightForColumnWidth");
          objc_msgSend(v10, "prefetchDuringScrollingForWidth:");
        }

        goto LABEL_15;
      }
      objc_msgSend(v10, "contentView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_12;
  }
LABEL_15:
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "H_Gadget_CV_prefetchItems", ", buf, 2u);
  }

}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXHorizontalCollectionGadget;
  -[PXGadgetUIViewController collectionView:cellForItemAtIndexPath:](&v6, sel_collectionView_cellForItemAtIndexPath_, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClipsToBounds:", 0);
  return v4;
}

- (CGPoint)collectionView:(id)a3 targetContentOffsetForProposedContentOffset:(CGPoint)a4
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGPoint result;

  v5 = a3;
  -[PXGadgetUIViewController anchorHelper](self, "anchorHelper");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "navigateToAnchorIfNeeded");

  -[PXGadgetUIViewController layout](self, "layout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentOffset");
  v9 = v8;
  v11 = v10;

  objc_msgSend(v7, "targetContentOffsetForProposedContentOffset:", v9, v11);
  v13 = v12;
  v15 = v14;

  v16 = v13;
  v17 = v15;
  result.y = v17;
  result.x = v16;
  return result;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXHorizontalCollectionGadget;
  -[PXGadgetUIViewController observable:didChange:context:](&v8, sel_observable_didChange_context_, a3);
  if ((void *)PXExtendedTraitCollectionObservationContext_207233 == a5)
    -[PXHorizontalCollectionGadget _extendedTraitCollectionDidChange:](self, "_extendedTraitCollectionDidChange:", a4);
}

- (CGRect)visibleBounds
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  void *v22;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v27;
  double v28;
  double v29;
  double v30;
  CGRect v31;
  CGRect v32;
  CGRect result;
  CGRect v34;

  -[PXHorizontalCollectionGadget collectionView](self, "collectionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXHorizontalCollectionGadget visibleContentRect](self, "visibleContentRect");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[PXHorizontalCollectionGadget collectionView](self, "collectionView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "superview");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "convertRect:fromView:", v13, v5, v7, v9, v11);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  -[PXHorizontalCollectionGadget collectionView](self, "collectionView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "bounds");
  v34.origin.x = v15;
  v34.origin.y = v17;
  v34.size.width = v19;
  v34.size.height = v21;
  v32 = CGRectIntersection(v31, v34);
  x = v32.origin.x;
  y = v32.origin.y;
  width = v32.size.width;
  height = v32.size.height;

  v27 = x;
  v28 = y;
  v29 = width;
  v30 = height;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

- (void)_extendedTraitCollectionDidChange:(unint64_t)a3
{
  char v3;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[UIViewController px_extendedTraitCollection](self, "px_extendedTraitCollection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "layoutSizeClass"))
  {
    if (objc_msgSend(v8, "layoutSizeSubclass"))
    {
      if (objc_msgSend(v8, "layoutOrientation"))
      {
        v5 = objc_msgSend(v8, "userInterfaceIdiom");
        if ((v3 & 0x1F) != 0)
        {
          if (v5)
          {
            -[UIViewController px_extendedTraitCollection](self, "px_extendedTraitCollection");
            v6 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "traitCollection");
            v7 = (void *)objc_claimAutoreleasedReturnValue();

            -[PXHorizontalCollectionGadget setCurrentColumnSpan:](self, "setCurrentColumnSpan:", -[PXHorizontalCollectionGadget _columnSpanForTraitCollection:](self, "_columnSpanForTraitCollection:", v7));
          }
        }
      }
    }
  }

}

- (CGSize)_ensureCachedHeightForColumnWidth:(double)a3
{
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  _QWORD v13[8];
  uint64_t v14;
  double *v15;
  uint64_t v16;
  uint64_t v17;
  CGSize result;

  -[PXHorizontalCollectionGadget cachedMaxHeightForColumnWidth](self, "cachedMaxHeightForColumnWidth");
  v7 = v6;
  v9 = v8;
  if ((PXSizeIsNull() & 1) != 0 || v7 != a3)
  {
    v14 = 0;
    v15 = (double *)&v14;
    v16 = 0x2020000000;
    v17 = 0;
    -[PXGadgetUIViewController dataSource](self, "dataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __66__PXHorizontalCollectionGadget__ensureCachedHeightForColumnWidth___block_invoke;
    v13[3] = &unk_1E5136360;
    *(double *)&v13[6] = a3;
    v13[7] = a2;
    v13[4] = self;
    v13[5] = &v14;
    objc_msgSend(v10, "enumerateGadgetsUsingBlock:", v13);

    v9 = v15[3];
    -[PXHorizontalCollectionGadget setCachedMaxHeightForColumnWidth:](self, "setCachedMaxHeightForColumnWidth:", a3, v9);
    _Block_object_dispose(&v14, 8);
    v7 = a3;
  }
  v11 = v7;
  v12 = v9;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)setCurrentColumnSpan:(int64_t)a3
{
  id v4;

  if (self->_currentColumnSpan != a3)
  {
    self->_currentColumnSpan = a3;
    -[PXHorizontalCollectionGadget _updateColumnSettings](self, "_updateColumnSettings");
    -[PXHorizontalCollectionGadget _updateCollectionViewPaging](self, "_updateCollectionViewPaging");
    -[PXHorizontalCollectionGadget delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "gadget:didChange:", self, 64);

  }
}

- (int64_t)_columnSpanForTraitCollection:(id)a3
{
  id v4;
  void *v5;
  id v6;
  int64_t v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  int64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v15 = -[PXHorizontalCollectionGadget defaultColumnSpan](self, "defaultColumnSpan");
  -[PXHorizontalCollectionGadget columnSpans](self, "columnSpans");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __62__PXHorizontalCollectionGadget__columnSpanForTraitCollection___block_invoke;
  v9[3] = &unk_1E5136388;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v9);
  v7 = v13[3];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)_updateColumnSettings
{
  void *v3;
  int64_t v4;
  double v5;
  void *v6;
  _QWORD v7[5];

  if (self->_gadgetSpec)
  {
    -[PXGadgetUIViewController layout](self, "layout");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[PXHorizontalCollectionGadget currentColumnSpan](self, "currentColumnSpan");
    -[PXGadgetSpec columnWidthForColumnSpan:](self->_gadgetSpec, "columnWidthForColumnSpan:", v4);
    if (v5 > 0.0)
      objc_msgSend(v3, "setColumnWidth:");
    -[PXGadgetSpec columnSpacingForColumnSpan:](self->_gadgetSpec, "columnSpacingForColumnSpan:", v4);
    objc_msgSend(v3, "setInterSectionSpacing:");
    +[PXPreloadScheduler sharedScheduler](PXPreloadScheduler, "sharedScheduler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __53__PXHorizontalCollectionGadget__updateColumnSettings__block_invoke;
    v7[3] = &unk_1E5149198;
    v7[4] = self;
    objc_msgSend(v6, "scheduleMainQueueTask:", v7);

  }
}

- (void)updateIfNeeded
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXHorizontalCollectionGadget;
  -[PXGadgetUIViewController updateIfNeeded](&v6, sel_updateIfNeeded);
  v3 = _horizontalGadgetUpdateFlags;
  if (HIBYTE(_horizontalGadgetUpdateFlags) | _horizontalGadgetUpdateFlags | byte_1EE99808A)
  {
    if (HIBYTE(_horizontalGadgetUpdateFlags))
      v3 = _horizontalGadgetUpdateFlags | 2;
    if (byte_1EE99808A)
      v4 = v3 | 0x40;
    else
      v4 = v3;
    -[PXHorizontalCollectionGadget delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "gadget:didChange:", self, v4);

    _horizontalGadgetUpdateFlags = 0;
    byte_1EE99808A = 0;
  }
}

- (PXGadgetSpec)gadgetSpec
{
  return self->_gadgetSpec;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (PXGadgetDelegate)delegate
{
  return (PXGadgetDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CGRect)visibleContentRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_visibleContentRect.origin.x;
  y = self->_visibleContentRect.origin.y;
  width = self->_visibleContentRect.size.width;
  height = self->_visibleContentRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (PXHorizontalCollectionGadgetDelegate)horizontalGadgetDelegate
{
  return (PXHorizontalCollectionGadgetDelegate *)objc_loadWeakRetained((id *)&self->_horizontalGadgetDelegate);
}

- (void)setHorizontalGadgetDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_horizontalGadgetDelegate, a3);
}

- (NSString)collectionTitle
{
  return self->_collectionTitle;
}

- (unint64_t)collectionAccessoryButtonType
{
  return self->_collectionAccessoryButtonType;
}

- (NSString)collectionAccessoryButtonTitle
{
  return self->_collectionAccessoryButtonTitle;
}

- (double)collectionHeight
{
  return self->_collectionHeight;
}

- (BOOL)selectionFollowsFocus
{
  return self->_selectionFollowsFocus;
}

- (BOOL)isFixedHeight
{
  return self->_isFixedHeight;
}

- (void)setIsFixedHeight:(BOOL)a3
{
  self->_isFixedHeight = a3;
}

- (int64_t)defaultColumnSpan
{
  return self->_defaultColumnSpan;
}

- (NSDictionary)columnSpans
{
  return self->_columnSpans;
}

- (void)setColumnSpans:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1256);
}

- (BOOL)prefersPagingEnabled
{
  return self->_prefersPagingEnabled;
}

- (void)setPrefersPagingEnabled:(BOOL)a3
{
  self->_prefersPagingEnabled = a3;
}

- (unint64_t)gadgetType
{
  return self->_gadgetType;
}

- (void)setGadgetType:(unint64_t)a3
{
  self->_gadgetType = a3;
}

- (unint64_t)headerStyle
{
  return self->_headerStyle;
}

- (void)setHeaderStyle:(unint64_t)a3
{
  self->_headerStyle = a3;
}

- (id)accessoryButtonAction
{
  return self->_accessoryButtonAction;
}

- (void)setAccessoryButtonAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1280);
}

- (BOOL)visibleGadgetsLoaded
{
  return self->_visibleGadgetsLoaded;
}

- (void)setVisibleGadgetsLoaded:(BOOL)a3
{
  self->_visibleGadgetsLoaded = a3;
}

- (BOOL)isPerformingChanges
{
  return self->_isPerformingChanges;
}

- (void)setIsPerformingChanges:(BOOL)a3
{
  self->_isPerformingChanges = a3;
}

- (BOOL)isResourceLoaded
{
  return self->_isResourceLoaded;
}

- (void)setIsResourceLoaded:(BOOL)a3
{
  self->_isResourceLoaded = a3;
}

- (PXGadgetOrbContext)previewOrbContext
{
  return self->_previewOrbContext;
}

- (void)setPreviewOrbContext:(id)a3
{
  objc_storeStrong((id *)&self->_previewOrbContext, a3);
}

- (int64_t)currentColumnSpan
{
  return self->_currentColumnSpan;
}

- (CGSize)cachedMaxHeightForColumnWidth
{
  double width;
  double height;
  CGSize result;

  width = self->_cachedMaxHeightForColumnWidth.width;
  height = self->_cachedMaxHeightForColumnWidth.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setCachedMaxHeightForColumnWidth:(CGSize)a3
{
  self->_cachedMaxHeightForColumnWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewOrbContext, 0);
  objc_storeStrong(&self->_accessoryButtonAction, 0);
  objc_storeStrong((id *)&self->_columnSpans, 0);
  objc_storeStrong((id *)&self->_collectionAccessoryButtonTitle, 0);
  objc_storeStrong((id *)&self->_collectionTitle, 0);
  objc_destroyWeak((id *)&self->_horizontalGadgetDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_gadgetSpec, 0);
}

uint64_t __53__PXHorizontalCollectionGadget__updateColumnSettings__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
}

void __62__PXHorizontalCollectionGadget__columnSpanForTraitCollection___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v7;

  v7 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "containsTraitsInCollection:", a2))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v7, "integerValue");
    *a4 = 1;
  }

}

uint64_t __66__PXHorizontalCollectionGadget__ensureCachedHeightForColumnWidth___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  double v5;
  double v6;
  uint64_t result;
  void *v8;

  objc_msgSend(a2, "sizeThatFits:", *(double *)(a1 + 48), 1.79769313e308);
  v6 = v5;
  if (v5 >= 1.79769313e308)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), CFSTR("PXHorizontalCollectionGadget.m"), 599, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("preferredHeight < CGFLOAT_MAX"));

  }
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = fmax(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)+ 24), v6);
  result = objc_msgSend(*(id *)(a1 + 32), "isFixedHeight");
  if ((_DWORD)result)
    *a3 = 1;
  return result;
}

void __49__PXHorizontalCollectionGadget_gadget_didChange___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "localizedTitle");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCollectionTitle:", v4);

}

void __64__PXHorizontalCollectionGadget_prefetchDuringScrollingForWidth___block_invoke(uint64_t a1, void *a2, BOOL *a3)
{
  void *v5;
  id v6;

  v6 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "contentViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "view");

  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
      goto LABEL_6;
    objc_msgSend(v6, "contentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_6:
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "prefetchDuringScrollingForWidth:", *(double *)(a1 + 40));
  *a3 = --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) < 1;

}

void __62__PXHorizontalCollectionGadget_gadgetControllerHasDisappeared__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "gadgetControllerHasDisappeared");

}

void __59__PXHorizontalCollectionGadget_gadgetControllerHasAppeared__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "gadgetControllerHasAppeared");

}

void __46__PXHorizontalCollectionGadget_setGadgetSpec___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "contentInsets");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(*(id *)(a1 + 40), "collectionView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setContentInset:", v3, v5, v7, v9);

  objc_msgSend(*(id *)(a1 + 40), "_updateColumnSettings");
  objc_msgSend(*(id *)(a1 + 40), "_updateCollectionViewPaging");
  objc_msgSend(*(id *)(a1 + 40), "anchorHelper");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "navigateToAnchorIfNeeded");

}

@end
