@implementation PXPhotosLayout

- (UIEdgeInsets)scrollableContentInsets
{
  PXPhotosLayout *v2;
  char *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  UIEdgeInsets result;

  v2 = self;
  v3 = (char *)sub_1A6CB8158();
  v4 = *(double *)&v3[OBJC_IVAR____TtCE12PhotosUICoreCSo14PXPhotosLayoutP33_8BC30B280D03FB555C1706A4E0200DBD14AssociatedData_scrollableContentInsets];
  v5 = *(double *)&v3[OBJC_IVAR____TtCE12PhotosUICoreCSo14PXPhotosLayoutP33_8BC30B280D03FB555C1706A4E0200DBD14AssociatedData_scrollableContentInsets
                    + 8];
  v6 = *(double *)&v3[OBJC_IVAR____TtCE12PhotosUICoreCSo14PXPhotosLayoutP33_8BC30B280D03FB555C1706A4E0200DBD14AssociatedData_scrollableContentInsets
                    + 16];
  v7 = *(double *)&v3[OBJC_IVAR____TtCE12PhotosUICoreCSo14PXPhotosLayoutP33_8BC30B280D03FB555C1706A4E0200DBD14AssociatedData_scrollableContentInsets
                    + 24];

  v8 = v4;
  v9 = v5;
  v10 = v6;
  v11 = v7;
  result.right = v11;
  result.bottom = v10;
  result.left = v9;
  result.top = v8;
  return result;
}

- (void)setScrollableContentInsets:(UIEdgeInsets)a3
{
  CGFloat right;
  CGFloat bottom;
  CGFloat left;
  CGFloat top;
  PXPhotosLayout *v7;
  CGFloat *v8;
  char *v9;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  v7 = self;
  v9 = (char *)sub_1A6CB8158();
  v8 = (CGFloat *)&v9[OBJC_IVAR____TtCE12PhotosUICoreCSo14PXPhotosLayoutP33_8BC30B280D03FB555C1706A4E0200DBD14AssociatedData_scrollableContentInsets];
  *v8 = top;
  v8[1] = left;
  v8[2] = bottom;
  v8[3] = right;

}

- (PXScrollDetent)swift_detentForInitialScrollPosition
{
  PXPhotosLayout *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1A6CB82EC();

  return (PXScrollDetent *)v3;
}

- (CGSize)swift_contentSizeForProposedContentSize:(CGSize)a3
{
  double width;
  PXPhotosLayout *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  width = a3.width;
  v4 = self;
  v5 = sub_1A6CB83E4(width);
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (PXPhotosLayout)initWithViewModel:(id)a3 specManager:(id)a4 overlayController:(id)a5
{
  id v9;
  id v10;
  id v11;
  PXPhotosLayout *v12;
  uint64_t v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  PXPhotosLayoutDefaultAnimationProvider *v19;
  PXPhotosLayoutAnimationProvider *animationProvider;
  id v21;
  int v22;
  void *v23;
  double v24;
  uint64_t v25;
  PXNumberAnimator *alternateAppearanceMixAnimator;
  uint64_t v27;
  PXNumberAnimator *headerFooterAlphaAnimator;
  uint64_t v29;
  PXPhotosHeaderCustomizationModel *headerCustomizationModel;
  NSDateIntervalFormatter *v31;
  NSDateIntervalFormatter *dateIntervalFormatter;
  void *v33;
  objc_super v35;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v35.receiver = self;
  v35.super_class = (Class)PXPhotosLayout;
  v12 = -[PXGStackLayout init](&v35, sel_init);
  if (v12)
  {
    if (objc_msgSend(v9, "scrollingBehavior") == 1)
    {
      v13 = 2;
    }
    else if (objc_msgSend(v9, "wantsSingleRowScrollingLayout"))
    {
      v13 = 2;
    }
    else
    {
      v13 = 1;
    }
    -[PXGStackLayout setAxis:](v12, "setAxis:", v13);
    -[PXGLayout axGroup](v12, "axGroup");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAxRole:", 3);

    -[PXGLayout setContentSource:](v12, "setContentSource:", v12);
    -[PXGStackLayout setSublayoutAlignmentDelegate:](v12, "setSublayoutAlignmentDelegate:", v12);
    objc_storeStrong((id *)&v12->_viewModel, a3);
    -[PXPhotosViewModel registerChangeObserver:context:](v12->_viewModel, "registerChangeObserver:context:", v12, ViewModelObservationContext_204881);
    objc_storeStrong((id *)&v12->_specManager, a4);
    -[PXPhotosLayoutSpecManager registerChangeObserver:context:](v12->_specManager, "registerChangeObserver:context:", v12, SpecManagerObservationContext_204884);
    LODWORD(v15) = 0;
    LODWORD(v16) = 0;
    LODWORD(v17) = 1.0;
    LODWORD(v18) = 0;
    v12->_titleBackgroundGradientResizableCapInsetsIndex = -[PXGLayout addResizableCapInsets:](v12, "addResizableCapInsets:", v15, v16, v17, v18);
    objc_storeStrong((id *)&v12->_overlayController, a5);
    v19 = objc_alloc_init(PXPhotosLayoutDefaultAnimationProvider);
    animationProvider = v12->_animationProvider;
    v12->_animationProvider = (PXPhotosLayoutAnimationProvider *)v19;

    v21 = objc_alloc((Class)off_1E50B3760);
    v22 = objc_msgSend(v9, "requiresLightTopBars");
    -[PXFeatureSpecManager spec](v12->_specManager, "spec");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0.0;
    if (v22)
      v24 = 1.0;
    v25 = objc_msgSend(v21, "initWithValue:", v24);
    alternateAppearanceMixAnimator = v12->_alternateAppearanceMixAnimator;
    v12->_alternateAppearanceMixAnimator = (PXNumberAnimator *)v25;

    -[PXNumberAnimator registerChangeObserver:context:](v12->_alternateAppearanceMixAnimator, "registerChangeObserver:context:", v12, AlternateAppearanceMixAnimatorObservationContext_204885);
    -[PXNumberAnimator setLabel:](v12->_alternateAppearanceMixAnimator, "setLabel:", CFSTR("alternateAppearanceMixAnimator"));
    v12->_managesHeaderSprites = (unint64_t)(objc_msgSend(v9, "navBarStyle") - 1) < 5;
    v12->_managesOnlyLegibilityGradientSprites = objc_msgSend(v9, "navBarStyle") == 6;
    v27 = objc_msgSend(objc_alloc((Class)off_1E50B3760), "initWithValue:", 1.0);
    headerFooterAlphaAnimator = v12->_headerFooterAlphaAnimator;
    v12->_headerFooterAlphaAnimator = (PXNumberAnimator *)v27;

    -[PXNumberAnimator registerChangeObserver:context:](v12->_headerFooterAlphaAnimator, "registerChangeObserver:context:", v12, HeaderFooterAlphaAnimatorObservationContext);
    -[PXNumberAnimator setLabel:](v12->_headerFooterAlphaAnimator, "setLabel:", CFSTR("headerFooterAlphaAnimator"));
    v12->_headerTitleDrawingOptions = 35;
    objc_msgSend(v10, "headerCustomizationModel");
    v29 = objc_claimAutoreleasedReturnValue();
    headerCustomizationModel = v12->_headerCustomizationModel;
    v12->_headerCustomizationModel = (PXPhotosHeaderCustomizationModel *)v29;

    -[PXPhotosHeaderCustomizationModel registerChangeObserver:context:](v12->_headerCustomizationModel, "registerChangeObserver:context:", v12, HeaderCustomizationModelObservationContext);
    v31 = (NSDateIntervalFormatter *)objc_alloc_init(MEMORY[0x1E0CB3590]);
    dateIntervalFormatter = v12->_dateIntervalFormatter;
    v12->_dateIntervalFormatter = v31;

    -[NSDateIntervalFormatter px_dateTemplateForGranularity:abbreviated:](v12->_dateIntervalFormatter, "px_dateTemplateForGranularity:abbreviated:", 16, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateIntervalFormatter setDateTemplate:](v12->_dateIntervalFormatter, "setDateTemplate:", v33);

    -[PXPhotosLayout _invalidateHeaderTitle](v12, "_invalidateHeaderTitle");
    -[PXPhotosLayout _invalidateHeaderAttributes](v12, "_invalidateHeaderAttributes");
    -[PXPhotosLayout _invalidateHeaderMeasurements](v12, "_invalidateHeaderMeasurements");
    -[PXPhotosLayout _invalidateHeaderAnimated:](v12, "_invalidateHeaderAnimated:", 0);
    -[PXPhotosLayout _invalidateSectionedLayout](v12, "_invalidateSectionedLayout");
    -[PXPhotosLayout _invalidateSectionedLayoutPlacementOverrides](v12, "_invalidateSectionedLayoutPlacementOverrides");
    -[PXPhotosLayout _invalidateFooter](v12, "_invalidateFooter");
    -[PXPhotosLayout _invalidateLocalSpritesCount](v12, "_invalidateLocalSpritesCount");
    -[PXPhotosLayout _invalidateLocalSprites](v12, "_invalidateLocalSprites");
    -[PXPhotosLayout _invalidateLocalSpritesAlpha](v12, "_invalidateLocalSpritesAlpha");
  }

  return v12;
}

- (id)presentedDataSource
{
  return -[PXPhotosSectionedLayout assetsDataSource](self->_sectionedLayout, "assetsDataSource");
}

- (BOOL)appliesAlphaToSublayouts
{
  return 1;
}

- (void)setHeaderView:(id)a3
{
  -[PXPhotosLayout setHeaderView:animated:](self, "setHeaderView:animated:", a3, 0);
}

- (void)setHeaderView:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  UIView *v7;
  UIView *v8;

  v4 = a4;
  v7 = (UIView *)a3;
  if (self->_headerView != v7)
  {
    v8 = v7;
    objc_storeStrong((id *)&self->_headerView, a3);
    -[PXPhotosLayout _invalidateHeaderAnimated:](self, "_invalidateHeaderAnimated:", v4);
    v7 = v8;
  }

}

- (void)setFooterView:(id)a3
{
  UIView *v5;
  UIView *v6;

  v5 = (UIView *)a3;
  if (self->_footerView != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_footerView, a3);
    -[PXPhotosLayout _performPreUpdateInvalidationDeferredIfNeeded:](self, "_performPreUpdateInvalidationDeferredIfNeeded:", &__block_literal_global_204962);
    v5 = v6;
  }

}

- (PXFloatRange)topCollapsibleArea
{
  void *v3;
  void *v4;
  char v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  PXFloatRange result;

  -[PXPhotosLayout viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentLens");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "ignoresTopSafeAreaInset");

  v6 = 0.0;
  v7 = 0.0;
  if ((v5 & 1) == 0)
  {
    -[PXGLayout safeAreaInsets](self, "safeAreaInsets");
    v9 = v8;
    v6 = -v8;
    -[PXPhotosLayout titleBackgroundSpriteHeight](self, "titleBackgroundSpriteHeight");
    v7 = v9 + v10;
  }
  v11 = v6;
  result.var1 = v7;
  result.var0 = v11;
  return result;
}

- (PXFloatRange)bottomCollapsibleArea
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  __int128 v7;
  __int128 v8;
  PXFloatRange result;

  if (self->_footerLayout)
  {
    v7 = 0u;
    v8 = 0u;
    -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore", 0, 0, 0, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "geometryForSublayout:", self->_footerLayout);
    }
    else
    {
      v7 = 0u;
      v8 = 0u;
    }

    v5 = *((double *)&v8 + 1);
    v6 = *((double *)&v7 + 1);
  }
  else
  {
    v5 = 0.0;
    v6 = 0.0;
  }
  result.var1 = v6;
  result.var0 = v5;
  return result;
}

- (void)invalidateFooterHeight
{
  -[PXGSingleViewLayout viewSizeDidChange](self->_footerLayout, "viewSizeDidChange");
}

- (void)setSectionHeaderProvider:(id)a3
{
  PXPhotosSectionHeaderLayoutProvider *v5;
  PXPhotosSectionHeaderLayoutProvider *v6;

  v5 = (PXPhotosSectionHeaderLayoutProvider *)a3;
  if (self->_sectionHeaderProvider != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_sectionHeaderProvider, a3);
    self->_headerProviderRespondsTo.createTopHeaderLayoutForDataSource = objc_opt_respondsToSelector() & 1;
    self->_headerProviderRespondsTo.topHeaderLayoutDidChangeDataSource = objc_opt_respondsToSelector() & 1;
    self->_headerProviderRespondsTo.configureTopHeaderLayout = objc_opt_respondsToSelector() & 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[PXPhotosSectionHeaderLayoutProvider setTopHeaderInvalidationDelegate:](v6, "setTopHeaderInvalidationDelegate:", self);
    -[PXPhotosLayout _invalidateTopHeaderLayout](self, "_invalidateTopHeaderLayout");
    -[PXPhotosLayout _invalidateSectionedLayout](self, "_invalidateSectionedLayout");
    v5 = v6;
  }

}

- (void)setGlobalHeaderProvider:(id)a3
{
  PXPhotosGlobalHeaderLayoutProvider *v5;
  PXPhotosGlobalHeaderLayoutProvider *v6;

  v5 = (PXPhotosGlobalHeaderLayoutProvider *)a3;
  if (self->_globalHeaderProvider != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_globalHeaderProvider, a3);
    -[PXPhotosLayout _invalidateGlobalHeaderLayout](self, "_invalidateGlobalHeaderLayout");
    -[PXPhotosLayout _invalidateTopHeaderLayout](self, "_invalidateTopHeaderLayout");
    -[PXPhotosLayout _invalidateSectionedLayout](self, "_invalidateSectionedLayout");
    v5 = v6;
  }

}

- (void)setSectionBodyProvider:(id)a3
{
  PXPhotosSectionBodyLayoutProvider *v5;
  PXPhotosSectionBodyLayoutProvider *v6;

  v5 = (PXPhotosSectionBodyLayoutProvider *)a3;
  if (self->_sectionBodyProvider != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_sectionBodyProvider, a3);
    -[PXPhotosLayout _invalidateSectionedLayout](self, "_invalidateSectionedLayout");
    v5 = v6;
  }

}

- (void)setStatusBarHeight:(double)a3
{
  if (self->_statusBarHeight != a3)
  {
    self->_statusBarHeight = a3;
    -[PXPhotosLayout _invalidateHeaderMeasurements](self, "_invalidateHeaderMeasurements");
  }
}

- (void)setWantsHeaderInSafeArea:(BOOL)a3
{
  if (self->_wantsHeaderInSafeArea != a3)
  {
    self->_wantsHeaderInSafeArea = a3;
    -[PXPhotosLayout _invalidateHeaderMeasurements](self, "_invalidateHeaderMeasurements");
    -[PXPhotosLayout _invalidateLocalSpritesAlpha](self, "_invalidateLocalSpritesAlpha");
  }
}

- (void)setAlignsHeaderTitleWithLayoutMargins:(BOOL)a3
{
  if (self->_alignsHeaderTitleWithLayoutMargins != a3)
  {
    self->_alignsHeaderTitleWithLayoutMargins = a3;
    -[PXPhotosLayout _invalidateHeaderMeasurements](self, "_invalidateHeaderMeasurements");
  }
}

- (id)createAnchorForScrollingToInitialPosition
{
  void *v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;

  -[PXPhotosLayout viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "initialNavigationObjectReference");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = objc_msgSend(v3, "initialNavigationScrollPosition");
    if (v5 > 3)
      v6 = 0;
    else
      v6 = qword_1A7C0A358[v5];
    v13 = objc_msgSend(v3, "navBarStyle");
    if (v13 > 7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL _IsNavigationBarBackgroundVisibleForNavigationBarStyle(PXPhotosViewNavigationBarStyle)");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("PXPhotosLayout.m"), 146, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    if (((1 << v13) & 0xCF) != 0)
      v14 = v6 | 0x100;
    else
      v14 = v6;
    -[PXGLayout rootLayout](self, "rootLayout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "initialNavigationObjectReference");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "createAnchorForScrollingSpriteForObjectReference:toScrollPosition:padding:", v11, v14, *(double *)off_1E50B8020, *((double *)off_1E50B8020 + 1), *((double *)off_1E50B8020 + 2), *((double *)off_1E50B8020 + 3));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v3, "contentStartsAtEnd"))
      v7 = 4;
    else
      v7 = 1;
    -[PXPhotosLayout specManager](self, "specManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "spec");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXPhotosLayout swift_detentForInitialScrollPosition](self, "swift_detentForInitialScrollPosition");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      objc_msgSend(v10, "offset");
      objc_msgSend(v9, "extendedTraitCollection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "safeAreaInsets");

    }
    -[PXGLayout rootLayout](self, "rootLayout");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    PXEdgeInsetsMake();
    objc_msgSend(v16, "createAnchorForScrollingToContentEdges:padding:", v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v15;
}

- (id)dateIntervalFutureForContentInRect:(CGRect)a3 type:(unint64_t)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  CGRect v17;

  if (self->_sectionedLayout)
  {
    -[PXGLayout convertRect:toDescendantLayout:](self, "convertRect:toDescendantLayout:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
  }
  else
  {
    v7 = *MEMORY[0x1E0C9D628];
    v9 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v11 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v13 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  v17.origin.x = v7;
  v17.origin.y = v9;
  v17.size.width = v11;
  v17.size.height = v13;
  if (CGRectIsNull(v17)
    || (PXPointIsNull() & 1) != 0
    || (-[PXPhotosSectionedLayout dateIntervalFutureForContentInRect:type:](self->_sectionedLayout, "dateIntervalFutureForContentInRect:type:", a4, v7, v9, v11, v13), (v14 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v14 = &__block_literal_global_192;
  }
  v15 = (void *)objc_msgSend(v14, "copy");

  return v15;
}

- (id)locationNamesFutureForContentInRect:(CGRect)a3
{
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
  CGRect v15;

  if (self->_sectionedLayout)
  {
    -[PXGLayout convertRect:toDescendantLayout:](self, "convertRect:toDescendantLayout:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
  }
  else
  {
    v5 = *MEMORY[0x1E0C9D628];
    v7 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v9 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v11 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  v15.origin.x = v5;
  v15.origin.y = v7;
  v15.size.width = v9;
  v15.size.height = v11;
  if (CGRectIsNull(v15)
    || (PXPointIsNull() & 1) != 0
    || (-[PXPhotosSectionedLayout locationNamesFutureForContentInRect:](self->_sectionedLayout, "locationNamesFutureForContentInRect:", v5, v7, v9, v11), (v12 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v12 = &__block_literal_global_194_204953;
  }
  v13 = (void *)objc_msgSend(v12, "copy");

  return v13;
}

- (id)assetCollectionsIteratorForContentInRect:(CGRect)a3
{
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
  CGRect v15;

  if (self->_sectionedLayout)
  {
    -[PXGLayout convertRect:toDescendantLayout:](self, "convertRect:toDescendantLayout:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
  }
  else
  {
    v5 = *MEMORY[0x1E0C9D628];
    v7 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v9 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v11 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  v15.origin.x = v5;
  v15.origin.y = v7;
  v15.size.width = v9;
  v15.size.height = v11;
  if (CGRectIsNull(v15) || (PXPointIsNull() & 1) != 0)
  {
    v12 = 0;
  }
  else
  {
    -[PXPhotosSectionedLayout assetCollectionsIteratorForContentInRect:](self->_sectionedLayout, "assetCollectionsIteratorForContentInRect:", v5, v7, v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13 = _Block_copy(v12);

  return v13;
}

- (id)assetsIteratorForContentInRect:(CGRect)a3
{
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
  CGRect v15;

  if (self->_sectionedLayout)
  {
    -[PXGLayout convertRect:toDescendantLayout:](self, "convertRect:toDescendantLayout:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
  }
  else
  {
    v5 = *MEMORY[0x1E0C9D628];
    v7 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v9 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v11 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  v15.origin.x = v5;
  v15.origin.y = v7;
  v15.size.width = v9;
  v15.size.height = v11;
  if (CGRectIsNull(v15) || (PXPointIsNull() & 1) != 0)
  {
    v12 = 0;
  }
  else
  {
    -[PXPhotosSectionedLayout assetsIteratorForContentInRect:](self->_sectionedLayout, "assetsIteratorForContentInRect:", v5, v7, v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13 = _Block_copy(v12);

  return v13;
}

- (id)topmostSectionHeaderSnapshotInRect:(CGRect)a3
{
  void *v4;

  if (self->_sectionedLayout)
  {
    -[PXGLayout convertRect:toDescendantLayout:](self, "convertRect:toDescendantLayout:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
    -[PXPhotosSectionedLayout topmostHeaderSnapshotInRect:](self->_sectionedLayout, "topmostHeaderSnapshotInRect:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)presentedItemsGeometryForSection:(unint64_t)a3 inDataSource:(id)a4
{
  return -[PXPhotosSectionedLayout presentedItemsGeometryForSection:inDataSource:](self->_sectionedLayout, "presentedItemsGeometryForSection:inDataSource:", a3, a4);
}

- (void)enumerateItemsGeometriesInRect:(CGRect)a3 dataSource:(id)a4 usingBlock:(id)a5
{
  PXPhotosSectionedLayout *sectionedLayout;
  double height;
  double width;
  double y;
  double x;
  id v12;
  id v13;

  sectionedLayout = self->_sectionedLayout;
  if (sectionedLayout)
  {
    height = a3.size.height;
    width = a3.size.width;
    y = a3.origin.y;
    x = a3.origin.x;
    v12 = a5;
    v13 = a4;
    -[PXGLayout convertRect:toDescendantLayout:](self, "convertRect:toDescendantLayout:", sectionedLayout, x, y, width, height);
    -[PXPhotosSectionedLayout enumerateItemsGeometriesInRect:dataSource:usingBlock:](self->_sectionedLayout, "enumerateItemsGeometriesInRect:dataSource:usingBlock:", v13, v12);

  }
}

- (id)regionOfInterestForAssetReference:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  _OWORD v19[2];
  _OWORD v20[2];
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  int v24;
  _OWORD v25[10];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXGLayout rootLayout](self, "rootLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "coordinateSpace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGLayout spriteReferenceForObjectReference:](self, "spriteReferenceForObjectReference:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0;
  if (v6 && v7)
  {
    v9 = objc_msgSend(v5, "spriteIndexForSpriteReference:", v7);
    if (v9 == -1)
    {
      v8 = 0;
    }
    else
    {
      v24 = *(_DWORD *)off_1E50B8298;
      v10 = *((_OWORD *)off_1E50B8358 + 1);
      v22 = *(_OWORD *)off_1E50B8358;
      v23 = v10;
      v11 = *((_OWORD *)off_1E50B83A0 + 7);
      v32 = *((_OWORD *)off_1E50B83A0 + 6);
      v33 = v11;
      v12 = *((_OWORD *)off_1E50B83A0 + 9);
      v34 = *((_OWORD *)off_1E50B83A0 + 8);
      v35 = v12;
      v13 = *((_OWORD *)off_1E50B83A0 + 3);
      v28 = *((_OWORD *)off_1E50B83A0 + 2);
      v29 = v13;
      v14 = *((_OWORD *)off_1E50B83A0 + 5);
      v30 = *((_OWORD *)off_1E50B83A0 + 4);
      v31 = v14;
      v15 = *((_OWORD *)off_1E50B83A0 + 1);
      v26 = *(_OWORD *)off_1E50B83A0;
      v27 = v15;
      v16 = *((_OWORD *)off_1E50B8398 + 1);
      v20[0] = *(_OWORD *)off_1E50B8398;
      v20[1] = v16;
      v21 = *((_QWORD *)off_1E50B8398 + 4);
      objc_msgSend(v5, "copyLayoutForSpritesInRange:entities:geometries:styles:infos:", v9 | 0x100000000, &v24, &v22, &v26, v20);
      v19[0] = v22;
      v19[1] = v23;
      v25[6] = v32;
      v25[7] = v33;
      v25[8] = v34;
      v25[9] = v35;
      v25[2] = v28;
      v25[3] = v29;
      v25[4] = v30;
      v25[5] = v31;
      v25[0] = v26;
      v25[1] = v27;
      PXGRegionOfInterestForSprite((uint64_t)v19, (float *)v25, v17, v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v8;
}

- (CGPoint)adjustedTargetVisibleOriginForProposedTargetVisibleOrigin:(CGPoint)a3 scrollingVelocity:(CGPoint)a4 decelerationRate:(int64_t *)a5
{
  double y;
  double x;
  double v8;
  double v9;
  void *v11;
  void *v12;
  PXScrollSnapController *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  PXScrollSnapController *v26;
  void *v27;
  void *v28;
  char v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGPoint result;

  y = a4.y;
  x = a4.x;
  v8 = a3.y;
  v9 = a3.x;
  -[PXPhotosLayout specManager](self, "specManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "spec");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = [PXScrollSnapController alloc];
  -[PXGLayout visibleRect](self, "visibleRect");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  -[PXGLayout safeAreaInsets](self, "safeAreaInsets");
  v26 = -[PXScrollSnapController initWithSnapBehavior:scrollAxis:visibleRect:visibilityInsets:scrollablePageSource:](v13, "initWithSnapBehavior:scrollAxis:visibleRect:visibilityInsets:scrollablePageSource:", 0, 1, self, v15, v17, v19, v21, v22, v23, v24, v25);
  objc_msgSend(v12, "configureScrollSnapController:", v26);
  -[PXPhotosLayout viewModel](self, "viewModel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "currentLens");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "allowsScrollSnap");

  if ((v29 & 1) == 0)
    -[PXScrollSnapController setSnapBehavior:](v26, "setSnapBehavior:", 0);
  -[PXScrollSnapController adjustedTargetVisibleOriginForProposedTargetVisibleOrigin:scrollingVelocity:decelerationRate:](v26, "adjustedTargetVisibleOriginForProposedTargetVisibleOrigin:scrollingVelocity:decelerationRate:", a5, v9, v8, x, y);
  v31 = v30;
  v33 = v32;

  v34 = v31;
  v35 = v33;
  result.y = v35;
  result.x = v34;
  return result;
}

- (CGPoint)visibleOriginForScrollingToNeighboringSectionInDirection:(unint64_t)a3
{
  NSObject *v5;
  PXScrollSnapController *v6;
  double v7;
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
  double v18;
  PXScrollSnapController *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  uint8_t v26[24];
  uint64_t v27;
  CGPoint result;

  v27 = *MEMORY[0x1E0C80C00];
  if (a3 <= 6 && ((1 << a3) & 0x19) != 0)
  {
    PXAssertGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v26 = 134217984;
      *(_QWORD *)&v26[4] = a3;
      _os_log_error_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "unexpected direction %ti", v26, 0xCu);
    }

  }
  v6 = [PXScrollSnapController alloc];
  -[PXGLayout visibleRect](self, "visibleRect");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[PXGLayout safeAreaInsets](self, "safeAreaInsets");
  v19 = -[PXScrollSnapController initWithSnapBehavior:scrollAxis:visibleRect:visibilityInsets:scrollablePageSource:](v6, "initWithSnapBehavior:scrollAxis:visibleRect:visibilityInsets:scrollablePageSource:", 2, 1, self, v8, v10, v12, v14, v15, v16, v17, v18);
  -[PXScrollSnapController setMaximumDecelerationFactor:](v19, "setMaximumDecelerationFactor:", 1.0);
  -[PXScrollSnapController setMaximumAccelerationFactor:](v19, "setMaximumAccelerationFactor:", 1.79769313e308);
  -[PXGLayout visibleRect](self, "visibleRect", 0);
  -[PXScrollSnapController adjustedTargetVisibleOriginForProposedTargetVisibleOrigin:scrollingVelocity:decelerationRate:](v19, "adjustedTargetVisibleOriginForProposedTargetVisibleOrigin:scrollingVelocity:decelerationRate:", v26);
  v21 = v20;
  v23 = v22;

  v24 = v21;
  v25 = v23;
  result.y = v25;
  result.x = v24;
  return result;
}

- (BOOL)canHandleVisibleRectRejection
{
  void *v3;
  uint64_t v4;
  objc_super v6;

  -[PXPhotosLayout viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "scrollingBehavior");

  if (v4 == 1)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)PXPhotosLayout;
  return -[PXGLayout canHandleVisibleRectRejection](&v6, sel_canHandleVisibleRectRejection);
}

- (CGRect)originalPlacementRect
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect result;

  -[PXGLayout referenceSize](self, "referenceSize");
  v4 = v3;
  v6 = v5;
  -[PXGLayout safeAreaInsets](self, "safeAreaInsets");
  v8 = -v7;
  v9 = 0.0;
  v10 = v4;
  v11 = v6;
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v8;
  result.origin.x = v9;
  return result;
}

- (BOOL)_shouldShowSectionedLayout
{
  void *v2;
  BOOL v3;

  -[PXPhotosLayout viewModel](self, "viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "contentPrivacyState") != 1;

  return v3;
}

- (unsigned)_expectedLocalSpriteCount
{
  void *v5;

  if (self->_managesHeaderSprites)
    return 5;
  if (!self->_managesOnlyLegibilityGradientSprites)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosLayout.m"), 688, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  return 1;
}

- (unsigned)_titleBackgroundSpriteIndex
{
  void *v5;

  if (self->_managesHeaderSprites)
    return 1;
  if (!self->_managesOnlyLegibilityGradientSprites)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosLayout.m"), 698, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  return 0;
}

- (void)enumerateScrollablePagesWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  id v6;
  double v7;
  double v8;
  PXPhotosSectionedLayout *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  uint64_t v16;

  v6 = a4;
  v7 = *MEMORY[0x1E0C9D538];
  v8 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  v9 = self->_sectionedLayout;
  -[PXGLayout convertPoint:fromLayout:](self, "convertPoint:fromLayout:", v9, v7, v8);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __65__PXPhotosLayout_enumerateScrollablePagesWithOptions_usingBlock___block_invoke;
  v13[3] = &unk_1E5135B50;
  v14 = v6;
  v15 = v10;
  v16 = v11;
  v12 = v6;
  -[PXPhotosSectionedLayout enumerateSectionBoundariesWithOptions:usingBlock:](v9, "enumerateSectionBoundariesWithOptions:usingBlock:", a3, v13);

}

- (void)_invalidateDynamicHeaderTitle
{
  $F40CD077B40800501ED060B808F886F7 *p_postUpdateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_postUpdateFlags = &self->_postUpdateFlags;
  needsUpdate = self->_postUpdateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_postUpdateFlags->needsUpdate = needsUpdate | 0x400000;
      return;
    }
LABEL_5:
    if ((self->_postUpdateFlags.updated & 0x400000) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosLayout _invalidateDynamicHeaderTitle]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXPhotosLayout.m"), 715, CFSTR("invalidating %lu after it already has been updated"), 0x400000);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_postUpdateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_postUpdateFlags.willPerformUpdate;
  p_postUpdateFlags->needsUpdate = 0x400000;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_invalidateHeaderTitle
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosLayout _invalidateHeaderTitle]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXPhotosLayout.m"), 719, CFSTR("invalidating %lu after it already has been updated"), 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 1;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateHeaderTitle
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSString *v11;
  void (**v12)(_QWORD, _QWORD);
  void *v13;
  void *v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD);
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSString *v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  NSString *v31;
  __CFString *v32;
  void *v33;
  void *v34;
  int v35;
  __CFString *v36;
  __CFString *v37;
  int v38;
  __CFString *v39;
  int v40;
  __CFString *v41;
  void *v42;
  _BOOL4 v43;
  void *v44;
  void *v45;
  int v46;
  _QWORD v47[4];
  id v48;
  NSString *v49;

  -[PXPhotosLayout viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "navBarStyle") == 3
    || objc_msgSend(v3, "navBarStyle") == 5
    || objc_msgSend(v3, "navBarStyle") == 6;
  if ((objc_msgSend(v3, "wantsDynamicTitles") & 1) == 0 && v4)
  {
    -[PXPhotosLayout setHeaderTitle:](self, "setHeaderTitle:", 0);
    -[PXPhotosLayout setHeaderSubtitle:](self, "setHeaderSubtitle:", 0);
    goto LABEL_51;
  }
  objc_msgSend(v3, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = !v4;
  if (objc_msgSend(v3, "wantsDynamicTitles"))
  {
    v7 = objc_msgSend(v6, "identifier");
    objc_msgSend(v3, "viewOptionsModel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
      v10 = objc_msgSend(v8, "browserDateType");
    else
      v10 = 0;
    -[PXGLayout visibleRect](self, "visibleRect", v6);
    -[PXPhotosLayout dateIntervalFutureForContentInRect:type:](self, "dateIntervalFutureForContentInRect:type:", v10);
    v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v12[2](v12, v7);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    if (v44)
    {
      -[PXPhotosLayout dateIntervalFormatter](self, "dateIntervalFormatter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringFromDateInterval:", v44);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(v9, "browserDateIntervalStringForDateIntervalString:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = v14;
      }
      objc_storeStrong((id *)&self->_dynamicDateInterval, v15);
      if (v9)

    }
    v43 = v4;
    -[PXGLayout visibleRect](self, "visibleRect");
    -[PXPhotosLayout locationNamesFutureForContentInRect:](self, "locationNamesFutureForContentInRect:");
    v16 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v16[2](v16, v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "px_localizedComposedStringWithCount:useUndefinedMoreCount:", 1, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
      objc_storeStrong((id *)&self->_dynamicLocationName, v18);
    v11 = self->_dynamicDateInterval;
    if (!v5)
    {
      v5 = v11;
      v11 = self->_dynamicLocationName;
    }

    v4 = v43;
    v6 = v42;
  }
  else
  {
    v11 = 0;
  }
  -[PXPhotosLayout specManager](self, "specManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "spec");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "allowsEmptyTitles"))
  {
    -[PXPhotosLayout viewModel](self, "viewModel");
    v45 = v3;
    v21 = v11;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "currentDataSource");
    v23 = v4;
    v24 = v5;
    v25 = v6;
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "containsAnyItems");

    v6 = v25;
    v5 = v24;
    v4 = v23;

    v11 = v21;
    v3 = v45;

    if (v5 || (v27 & 1) == 0)
    {
      if (v11 || !v5 || ((v27 ^ 1) & 1) != 0)
        goto LABEL_36;
      goto LABEL_35;
    }
  }
  else
  {

    if (v5)
      goto LABEL_34;
  }
  objc_msgSend(v6, "containerCollection");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "localizedTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_34:
  if (!v11)
  {
LABEL_35:
    objc_msgSend(v6, "containerCollection");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "localizedSubtitle");
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();

  }
LABEL_36:
  -[PXPhotosLayout viewModel](self, "viewModel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __36__PXPhotosLayout__updateHeaderTitle__block_invoke;
  v47[3] = &unk_1E5135B78;
  v48 = v5;
  v49 = v11;
  v31 = v11;
  v32 = v5;
  objc_msgSend(v30, "performChanges:", v47);

  -[PXPhotosLayout specManager](self, "specManager");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "spec");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "allowsEmptyTitles");
  v36 = CFSTR(" ");
  if ((v35 & v46) == 0)
    v36 = 0;
  v37 = v36;

  if (-[__CFString length](v32, "length"))
    v38 = v4;
  else
    v38 = 1;
  if (v38)
    v39 = v37;
  else
    v39 = v32;
  -[PXPhotosLayout setHeaderTitle:](self, "setHeaderTitle:", v39);
  if (-[NSString length](v31, "length"))
    v40 = v4;
  else
    v40 = 1;
  if (v40)
    v41 = v37;
  else
    v41 = (__CFString *)v31;
  -[PXPhotosLayout setHeaderSubtitle:](self, "setHeaderSubtitle:", v41);

LABEL_51:
}

- (void)setHeaderTitle:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *headerTitle;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_headerTitle;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v8, "isEqualToString:", v4);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      headerTitle = self->_headerTitle;
      self->_headerTitle = v6;

      ++self->_headerTitleVersion;
      -[PXPhotosLayout _invalidateHeaderMeasurementsForTitleChange](self, "_invalidateHeaderMeasurementsForTitleChange");
      -[PXPhotosLayout _invalidateLocalSprites](self, "_invalidateLocalSprites");
    }
  }

}

- (void)setHeaderSubtitle:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *headerSubtitle;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_headerSubtitle;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v8, "isEqualToString:", v4);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      headerSubtitle = self->_headerSubtitle;
      self->_headerSubtitle = v6;

      ++self->_headerTitleVersion;
      -[PXPhotosLayout _invalidateHeaderMeasurementsForTitleChange](self, "_invalidateHeaderMeasurementsForTitleChange");
      -[PXPhotosLayout _invalidateLocalSprites](self, "_invalidateLocalSprites");
    }
  }

}

- (void)setHeaderTitleOverContentAttributes:(id)a3
{
  NSDictionary *v4;
  char v5;
  NSDictionary *v6;
  NSDictionary *headerTitleOverContentAttributes;
  NSDictionary *v8;

  v8 = (NSDictionary *)a3;
  v4 = self->_headerTitleOverContentAttributes;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSDictionary isEqual:](v8, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = (NSDictionary *)-[NSDictionary copy](v8, "copy");
      headerTitleOverContentAttributes = self->_headerTitleOverContentAttributes;
      self->_headerTitleOverContentAttributes = v6;

      -[PXPhotosLayout _invalidateLocalSprites](self, "_invalidateLocalSprites");
    }
  }

}

- (void)setHeaderTitleOverBackgroundAttributes:(id)a3
{
  NSDictionary *v4;
  char v5;
  NSDictionary *v6;
  NSDictionary *headerTitleOverBackgroundAttributes;
  NSDictionary *v8;

  v8 = (NSDictionary *)a3;
  v4 = self->_headerTitleOverBackgroundAttributes;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSDictionary isEqual:](v8, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = (NSDictionary *)-[NSDictionary copy](v8, "copy");
      headerTitleOverBackgroundAttributes = self->_headerTitleOverBackgroundAttributes;
      self->_headerTitleOverBackgroundAttributes = v6;

      -[PXPhotosLayout _invalidateLocalSprites](self, "_invalidateLocalSprites");
    }
  }

}

- (void)setHeaderSubtitleOverBackgroundAttributes:(id)a3
{
  NSDictionary *v4;
  char v5;
  NSDictionary *v6;
  NSDictionary *headerSubtitleOverBackgroundAttributes;
  NSDictionary *v8;

  v8 = (NSDictionary *)a3;
  v4 = self->_headerSubtitleOverBackgroundAttributes;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSDictionary isEqual:](v8, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = (NSDictionary *)-[NSDictionary copy](v8, "copy");
      headerSubtitleOverBackgroundAttributes = self->_headerSubtitleOverBackgroundAttributes;
      self->_headerSubtitleOverBackgroundAttributes = v6;

      -[PXPhotosLayout _invalidateLocalSprites](self, "_invalidateLocalSprites");
    }
  }

}

- (void)setHeaderSubtitleOverContentAttributes:(id)a3
{
  NSDictionary *v4;
  char v5;
  NSDictionary *v6;
  NSDictionary *headerSubtitleOverContentAttributes;
  NSDictionary *v8;

  v8 = (NSDictionary *)a3;
  v4 = self->_headerSubtitleOverContentAttributes;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSDictionary isEqual:](v8, "isEqual:", v4);

    if ((v5 & 1) == 0)
    {
      v6 = (NSDictionary *)-[NSDictionary copy](v8, "copy");
      headerSubtitleOverContentAttributes = self->_headerSubtitleOverContentAttributes;
      self->_headerSubtitleOverContentAttributes = v6;

      -[PXPhotosLayout _invalidateLocalSprites](self, "_invalidateLocalSprites");
    }
  }

}

- (void)setHeaderTitleOrigin:(CGPoint)a3
{
  if (self->_headerTitleOrigin.x != a3.x || self->_headerTitleOrigin.y != a3.y)
  {
    self->_headerTitleOrigin = a3;
    -[PXPhotosLayout _invalidateLocalSprites](self, "_invalidateLocalSprites");
  }
}

- (void)setHeaderTitleSize:(CGSize)a3
{
  if (self->_headerTitleSize.width != a3.width || self->_headerTitleSize.height != a3.height)
  {
    self->_headerTitleSize = a3;
    -[PXPhotosLayout _invalidateLocalSprites](self, "_invalidateLocalSprites");
  }
}

- (void)setHeaderTitleBaselineToBottom:(double)a3
{
  if (self->_headerTitleBaselineToBottom != a3)
  {
    self->_headerTitleBaselineToBottom = a3;
    -[PXPhotosLayout _invalidateContentBelowTitle](self, "_invalidateContentBelowTitle");
  }
}

- (void)setTitleBackgroundSpriteHeight:(double)a3
{
  if (self->_titleBackgroundSpriteHeight != a3)
  {
    self->_titleBackgroundSpriteHeight = a3;
    -[PXPhotosLayout _invalidateSectionedLayout](self, "_invalidateSectionedLayout");
    -[PXPhotosLayout _invalidateLocalSprites](self, "_invalidateLocalSprites");
  }
}

- (void)setTitleBackgroundGradientAdditionalCoverage:(double)a3
{
  if (self->_titleBackgroundGradientAdditionalCoverage != a3)
  {
    self->_titleBackgroundGradientAdditionalCoverage = a3;
    -[PXPhotosLayout _invalidateLocalSprites](self, "_invalidateLocalSprites");
  }
}

- (void)setPlacementOverride:(id)a3
{
  PXGItemPlacement *v5;
  PXGItemPlacement *v6;

  v5 = (PXGItemPlacement *)a3;
  if (self->_placementOverride != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_placementOverride, a3);
    -[PXPhotosLayout _invalidateSectionedLayoutPlacementOverrides](self, "_invalidateSectionedLayoutPlacementOverrides");
    v5 = v6;
  }

}

- (id)createCurrentLayoutState
{
  PXPhotosLayoutState *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(PXPhotosLayoutState);
  -[PXPhotosLayout viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentLens");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosLayoutState setLens:](v3, "setLens:", v5);

  -[PXPhotosLayout sectionBodyProvider](self, "sectionBodyProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosLayoutState setBodyProvider:](v3, "setBodyProvider:", v6);

  -[PXPhotosLayout sectionHeaderProvider](self, "sectionHeaderProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosLayoutState setHeaderProvider:](v3, "setHeaderProvider:", v7);

  return v3;
}

- (void)_updatePresentedLayoutState
{
  id v3;

  -[PXPhotosLayout createCurrentLayoutState](self, "createCurrentLayoutState");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPhotosLayout setPresentedLayoutState:](self, "setPresentedLayoutState:", v3);

}

- (void)willUpdate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXPhotosLayout;
  -[PXGStackLayout willUpdate](&v7, sel_willUpdate);
  self->_updateFlags.willPerformUpdate = 1;
  if (self->_updateFlags.isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosLayout willUpdate]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PXPhotosLayout.m"), 932, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

  }
  self->_postUpdateFlags.willPerformUpdate = 1;
  if (self->_postUpdateFlags.isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosLayout willUpdate]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXPhotosLayout.m"), 933, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_postUpdateFlags.isPerformingUpdate"));

  }
}

- (void)update
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  id v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  void *v14;
  id v15;
  unint64_t needsUpdate;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t updated;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  BOOL isUpdatingSublayouts;
  $F40CD077B40800501ED060B808F886F7 *p_postUpdateFlags;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  objc_super v79;
  CGRect v80;
  CGRect v81;

  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.willPerformUpdate = 0;
  if (!self->_updateFlags.needsUpdate)
    goto LABEL_62;
  if (self->_updateFlags.isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosLayout update]");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInFunction:file:lineNumber:description:", v40, CFSTR("PXPhotosLayout.m"), 937, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

  }
  p_updateFlags->isPerformingUpdate = 1;
  p_updateFlags->updated = 0;
  if (!self->_presentedLayoutState)
    -[PXPhotosLayout _updatePresentedLayoutState](self, "_updatePresentedLayoutState");
  -[PXGLayout rootLayout](self, "rootLayout");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visibleRect");
  objc_msgSend(v5, "safeAreaInsets");
  PXEdgeInsetsInsetRect();
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(v5, "contentSize");

  PXRectWithOriginAndSize();
  v81.origin.x = v7;
  v81.origin.y = v9;
  v81.size.width = v11;
  v81.size.height = v13;
  if (CGRectContainsRect(v80, v81))
  {
    objc_msgSend(v5, "createAnchorForVisibleArea");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (id)objc_msgSend(v14, "autoInvalidate");

  }
  if (!p_updateFlags->isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosLayout update]");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInFunction:file:lineNumber:description:", v42, CFSTR("PXPhotosLayout.m"), 953, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

  }
  needsUpdate = p_updateFlags->needsUpdate;
  p_updateFlags->updated |= 1uLL;
  if ((needsUpdate & 1) != 0)
  {
    p_updateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
    -[PXPhotosLayout _updateHeaderTitle](self, "_updateHeaderTitle");
  }
  if (!p_updateFlags->isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosLayout update]");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInFunction:file:lineNumber:description:", v44, CFSTR("PXPhotosLayout.m"), 956, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

  }
  v17 = p_updateFlags->needsUpdate;
  p_updateFlags->updated |= 2uLL;
  if ((v17 & 2) != 0)
  {
    p_updateFlags->needsUpdate = v17 & 0xFFFFFFFFFFFFFFFDLL;
    -[PXPhotosLayout _updateHeaderAttributes](self, "_updateHeaderAttributes");
  }
  if (!p_updateFlags->isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosLayout update]");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "handleFailureInFunction:file:lineNumber:description:", v46, CFSTR("PXPhotosLayout.m"), 959, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

  }
  v18 = p_updateFlags->needsUpdate;
  p_updateFlags->updated |= 4uLL;
  if ((v18 & 4) != 0)
  {
    p_updateFlags->needsUpdate = v18 & 0xFFFFFFFFFFFFFFFBLL;
    -[PXPhotosLayout _updateHeaderMeasurements](self, "_updateHeaderMeasurements");
  }
  if (!p_updateFlags->isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosLayout update]");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "handleFailureInFunction:file:lineNumber:description:", v48, CFSTR("PXPhotosLayout.m"), 962, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

  }
  v19 = p_updateFlags->needsUpdate;
  updated = p_updateFlags->updated | 0x100;
  p_updateFlags->updated = updated;
  v21 = v19;
  if ((v19 & 0x100) != 0)
  {
    v21 = v19 & 0xFFFFFFFFFFFFFEFFLL;
    p_updateFlags->needsUpdate = v19 & 0xFFFFFFFFFFFFFEFFLL;
  }
  if (!p_updateFlags->isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosLayout update]");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "handleFailureInFunction:file:lineNumber:description:", v50, CFSTR("PXPhotosLayout.m"), 963, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    v21 = p_updateFlags->needsUpdate;
    updated = p_updateFlags->updated;
  }
  p_updateFlags->updated = updated | 0x200;
  if ((v21 & 0x200) != 0)
  {
    p_updateFlags->needsUpdate = v21 & 0xFFFFFFFFFFFFFDFFLL;
  }
  else if ((v19 & 0x100) == 0)
  {
    goto LABEL_31;
  }
  -[PXPhotosLayout _updateHeaderAnimated:](self, "_updateHeaderAnimated:", (v19 >> 8) & 1);
LABEL_31:
  if (!p_updateFlags->isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosLayout update]");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "handleFailureInFunction:file:lineNumber:description:", v52, CFSTR("PXPhotosLayout.m"), 967, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

  }
  v22 = p_updateFlags->needsUpdate;
  p_updateFlags->updated |= 0x80uLL;
  if ((v22 & 0x80) != 0)
  {
    p_updateFlags->needsUpdate = v22 & 0xFFFFFFFFFFFFFF7FLL;
    -[PXPhotosLayout _updateFooter](self, "_updateFooter");
  }
  if (!p_updateFlags->isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosLayout update]");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "handleFailureInFunction:file:lineNumber:description:", v54, CFSTR("PXPhotosLayout.m"), 970, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

  }
  v23 = p_updateFlags->needsUpdate;
  p_updateFlags->updated |= 8uLL;
  if ((v23 & 8) != 0)
  {
    p_updateFlags->needsUpdate = v23 & 0xFFFFFFFFFFFFFFF7;
    -[PXPhotosLayout _updateSectionedLayout](self, "_updateSectionedLayout");
  }
  if (!p_updateFlags->isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosLayout update]");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "handleFailureInFunction:file:lineNumber:description:", v56, CFSTR("PXPhotosLayout.m"), 973, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

  }
  v24 = p_updateFlags->needsUpdate;
  p_updateFlags->updated |= 0x10uLL;
  if ((v24 & 0x10) != 0)
  {
    p_updateFlags->needsUpdate = v24 & 0xFFFFFFFFFFFFFFEFLL;
    -[PXPhotosLayout _updateGlobalHeaderLayout](self, "_updateGlobalHeaderLayout");
  }
  if (!p_updateFlags->isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosLayout update]");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "handleFailureInFunction:file:lineNumber:description:", v58, CFSTR("PXPhotosLayout.m"), 976, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

  }
  v25 = p_updateFlags->needsUpdate;
  p_updateFlags->updated |= 0x20uLL;
  if ((v25 & 0x20) != 0)
  {
    p_updateFlags->needsUpdate = v25 & 0xFFFFFFFFFFFFFFDFLL;
    -[PXPhotosLayout _updateTopHeaderLayout](self, "_updateTopHeaderLayout");
  }
  if (!p_updateFlags->isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosLayout update]");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "handleFailureInFunction:file:lineNumber:description:", v60, CFSTR("PXPhotosLayout.m"), 979, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

  }
  v26 = p_updateFlags->needsUpdate;
  p_updateFlags->updated |= 0x40uLL;
  if ((v26 & 0x40) != 0)
  {
    p_updateFlags->needsUpdate = v26 & 0xFFFFFFFFFFFFFFBFLL;
    -[PXPhotosLayout _updateSectionedLayoutPlacementOverrides](self, "_updateSectionedLayoutPlacementOverrides");
  }
  if (!p_updateFlags->isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosLayout update]");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "handleFailureInFunction:file:lineNumber:description:", v62, CFSTR("PXPhotosLayout.m"), 982, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

  }
  v27 = p_updateFlags->needsUpdate;
  p_updateFlags->updated |= 0x400uLL;
  if ((v27 & 0x400) != 0)
  {
    p_updateFlags->needsUpdate = v27 & 0xFFFFFFFFFFFFFBFFLL;
    -[PXPhotosLayout _updateLocalSpritesCount](self, "_updateLocalSpritesCount");
  }
  if (!p_updateFlags->isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosLayout update]");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "handleFailureInFunction:file:lineNumber:description:", v64, CFSTR("PXPhotosLayout.m"), 985, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

  }
  v28 = p_updateFlags->needsUpdate;
  p_updateFlags->updated |= 0x800uLL;
  if ((v28 & 0x800) != 0)
  {
    p_updateFlags->needsUpdate = v28 & 0xFFFFFFFFFFFFF7FFLL;
    -[PXPhotosLayout _updateScrollDetentAnchor](self, "_updateScrollDetentAnchor");
    v28 = p_updateFlags->needsUpdate;
  }
  p_updateFlags->isPerformingUpdate = 0;
  if (v28)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosLayout update]");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "handleFailureInFunction:file:lineNumber:description:", v66, CFSTR("PXPhotosLayout.m"), 988, CFSTR("still needing to update %lu after update pass"), p_updateFlags->needsUpdate);

  }
LABEL_62:
  isUpdatingSublayouts = self->_isUpdatingSublayouts;
  self->_isUpdatingSublayouts = 1;
  v79.receiver = self;
  v79.super_class = (Class)PXPhotosLayout;
  -[PXGStackLayout update](&v79, sel_update);
  self->_isUpdatingSublayouts = isUpdatingSublayouts;
  p_postUpdateFlags = &self->_postUpdateFlags;
  self->_postUpdateFlags.willPerformUpdate = 0;
  if (self->_postUpdateFlags.needsUpdate)
  {
    if (self->_postUpdateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosLayout update]");
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "handleFailureInFunction:file:lineNumber:description:", v68, CFSTR("PXPhotosLayout.m"), 995, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_postUpdateFlags.isPerformingUpdate"));

    }
    self->_postUpdateFlags.isPerformingUpdate = 1;
    self->_postUpdateFlags.updated = 0;
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = -1;
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosLayout update]");
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "handleFailureInFunction:file:lineNumber:description:", v70, CFSTR("PXPhotosLayout.m"), 996, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_postUpdateFlags.isPerformingUpdate"));

    }
    v31 = p_postUpdateFlags->needsUpdate;
    self->_postUpdateFlags.updated |= 0x200000uLL;
    if ((v31 & 0x200000) != 0)
    {
      p_postUpdateFlags->needsUpdate = v31 & 0xFFFFFFFFFFDFFFFFLL;
      -[PXPhotosLayout _updateContentBelowTitle](self, "_updateContentBelowTitle");
    }
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosLayout update]");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v71, "handleFailureInFunction:file:lineNumber:description:", v72, CFSTR("PXPhotosLayout.m"), 999, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_postUpdateFlags.isPerformingUpdate"));

    }
    v32 = p_postUpdateFlags->needsUpdate;
    self->_postUpdateFlags.updated |= 0x400000uLL;
    if ((v32 & 0x400000) != 0)
    {
      p_postUpdateFlags->needsUpdate = v32 & 0xFFFFFFFFFFBFFFFFLL;
      -[PXPhotosLayout _updateHeaderTitle](self, "_updateHeaderTitle");
    }
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosLayout update]");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "handleFailureInFunction:file:lineNumber:description:", v74, CFSTR("PXPhotosLayout.m"), 1002, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_postUpdateFlags.isPerformingUpdate"));

    }
    v33 = p_postUpdateFlags->needsUpdate;
    self->_postUpdateFlags.updated |= 0x800000uLL;
    if ((v33 & 0x800000) != 0)
    {
      p_postUpdateFlags->needsUpdate = v33 & 0xFFFFFFFFFF7FFFFFLL;
      -[PXPhotosLayout _updateLocalSprites](self, "_updateLocalSprites");
    }
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v75 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosLayout update]");
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v75, "handleFailureInFunction:file:lineNumber:description:", v76, CFSTR("PXPhotosLayout.m"), 1005, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_postUpdateFlags.isPerformingUpdate"));

    }
    v34 = p_postUpdateFlags->needsUpdate;
    self->_postUpdateFlags.updated |= 0x1000000uLL;
    if ((v34 & 0x1000000) != 0)
    {
      p_postUpdateFlags->needsUpdate = v34 & 0xFFFFFFFFFEFFFFFFLL;
      -[PXPhotosLayout _updateLocalSpritesAlpha](self, "_updateLocalSpritesAlpha");
      v34 = p_postUpdateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    p_updateFlags->updated = 0;
    self->_postUpdateFlags.isPerformingUpdate = 0;
    if (v34)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosLayout update]");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "handleFailureInFunction:file:lineNumber:description:", v78, CFSTR("PXPhotosLayout.m"), 1008, CFSTR("still needing to update %lu after update pass"), p_postUpdateFlags->needsUpdate);

    }
  }
  if (p_updateFlags->needsUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosLayout.m"), 1009, CFSTR("post-update pass invalidated pre-update flags"));

  }
  -[PXGLayout pendingAnimations](self, "pendingAnimations");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_msgSend(v35, "count");

  if (v36)
  {
    -[PXGLayout createAnimation](self, "createAnimation");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setCurve:", 0);
    objc_msgSend(v37, "setDuration:", 0.0);
    objc_msgSend(v37, "setScope:", 2);

  }
  -[PXPhotosLayout _updatePresentedLayoutState](self, "_updatePresentedLayoutState");
}

- (void)didUpdate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXPhotosLayout;
  -[PXGStackLayout didUpdate](&v7, sel_didUpdate);
  if (self->_updateFlags.willPerformUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosLayout didUpdate]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PXPhotosLayout.m"), 1025, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.willPerformUpdate"));

  }
  if (self->_postUpdateFlags.willPerformUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosLayout didUpdate]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXPhotosLayout.m"), 1026, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_postUpdateFlags.willPerformUpdate"));

  }
}

- (void)_invalidateHeaderAttributes
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 2;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosLayout _invalidateHeaderAttributes]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXPhotosLayout.m"), 1030, CFSTR("invalidating %lu after it already has been updated"), 2);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 2;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateHeaderAttributes
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  if (self->_managesHeaderSprites || self->_managesOnlyLegibilityGradientSprites)
  {
    -[PXPhotosLayout specManager](self, "specManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "spec");
    v14 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "headerTitleFont");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *MEMORY[0x1E0DC1138];
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0DC1138]);

    objc_msgSend(v14, "headerTitleOverContentColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *MEMORY[0x1E0DC1140];
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0DC1140]);

    -[PXPhotosLayout setHeaderTitleOverContentAttributes:](self, "setHeaderTitleOverContentAttributes:", v4);
    objc_msgSend(v14, "headerTitleOverBackgroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, v8);

    -[PXPhotosLayout setHeaderTitleOverBackgroundAttributes:](self, "setHeaderTitleOverBackgroundAttributes:", v4);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "headerSubtitleFont");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, v6);

    objc_msgSend(v14, "headerTitleOverBackgroundColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, v8);

    -[PXPhotosLayout setHeaderSubtitleOverBackgroundAttributes:](self, "setHeaderSubtitleOverBackgroundAttributes:", v10);
    objc_msgSend(v14, "headerTitleOverContentColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, v8);

    -[PXPhotosLayout setHeaderSubtitleOverContentAttributes:](self, "setHeaderSubtitleOverContentAttributes:", v10);
  }
}

- (double)_headerTitleLineHeight
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;

  -[PXPhotosLayout specManager](self, "specManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "spec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "headerTitleFont");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lineHeight");
  v6 = v5;
  objc_msgSend(v4, "leading");
  v8 = v6 + v7;

  return v8;
}

- (double)_headerSubtitleLineHeight
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  -[PXPhotosLayout specManager](self, "specManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "spec");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "headerSubtitleFont");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "lineHeight");
    v8 = v7;
    objc_msgSend(v6, "leading");
    v10 = v8 + v9;
  }
  else
  {
    -[PXPhotosLayout _headerTitleLineHeight](self, "_headerTitleLineHeight");
    v10 = v11;
  }

  return v10;
}

- (CGSize)_headerTitleReferenceSize
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _BOOL4 v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGSize result;

  -[PXPhotosLayout specManager](self, "specManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "spec");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "headerTitleLeadingSpacing");
  v6 = v5;
  objc_msgSend(v4, "headerTitleButtonAlignmentSpacing");
  v8 = v6 + v7;
  -[PXGLayout referenceSize](self, "referenceSize");
  v10 = v9 + v8 * -2.0;
  v11 = -[PXPhotosLayout wantsHeaderInSafeArea](self, "wantsHeaderInSafeArea");
  v12 = 1.0;
  if (v11)
    v12 = 1.5;
  v13 = v10 / v12;
  -[PXPhotosLayout _headerTitleLineHeight](self, "_headerTitleLineHeight");
  v15 = v14;
  -[PXPhotosLayout _headerSubtitleLineHeight](self, "_headerSubtitleLineHeight");
  v17 = (v16 + v15 * 2.0) * 1.1;

  v18 = v13;
  v19 = v17;
  result.height = v19;
  result.width = v18;
  return result;
}

- (CGSize)_headerTitleSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  int64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGSize result;

  -[PXPhotosLayout _headerTitleReferenceSize](self, "_headerTitleReferenceSize");
  v4 = v3;
  v6 = v5;
  v7 = -[PXPhotosLayout headerTitleDrawingOptions](self, "headerTitleDrawingOptions");
  -[PXPhotosLayout attributedStringForSpriteAtIndex:inLayout:](self, "attributedStringForSpriteAtIndex:inLayout:", 3, self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "boundingRectWithSize:options:context:", v7, 0, v4, v6);
    v11 = v10;
    v13 = v12;
  }
  else
  {
    -[PXPhotosLayout headerTitle](self, "headerTitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosLayout headerTitleOverContentAttributes](self, "headerTitleOverContentAttributes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "boundingRectWithSize:options:attributes:context:", v7, v15, 0, v4, v6);
    v11 = v16;
    v13 = v17;

  }
  v18 = v11;
  v19 = v13;
  result.height = v19;
  result.width = v18;
  return result;
}

- (void)_updateHeaderOrigin
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
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
  double v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  id v32;

  -[PXPhotosLayout specManager](self, "specManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "spec");
  v32 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v32, "headerTitleLeadingSpacing");
  v5 = v4;
  if (objc_msgSend(v32, "isTV"))
  {
    -[PXGLayout visibleRect](self, "visibleRect");
    v6 = 0.0;
    if (v7 >= 0.0)
    {
      objc_msgSend(v32, "headerTitleTopSpacing");
      v6 = v8;
    }
  }
  else if (-[PXPhotosLayout wantsHeaderInSafeArea](self, "wantsHeaderInSafeArea"))
  {
    -[PXPhotosLayout headerCustomizationModel](self, "headerCustomizationModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "verticalVisibilityOffset");
    v11 = v10;
    objc_msgSend(v9, "verticalFloatingOffset");
    v13 = v11 - v12;
    -[PXGLayout safeAreaInsets](self, "safeAreaInsets");
    v15 = v14 - v13;
    -[PXPhotosLayout statusBarHeight](self, "statusBarHeight");
    v17 = v16;
    -[PXPhotosLayout statusBarHeight](self, "statusBarHeight");
    v19 = v17 + (v15 - v18) * 0.5;
    -[PXPhotosLayout _headerTitleLineHeight](self, "_headerTitleLineHeight");
    v21 = v19 - v20 * 0.5;
    -[PXPhotosLayout statusBarHeight](self, "statusBarHeight");
    if (v21 >= v22)
      v22 = v21;
    v6 = v13 + v22;

  }
  else
  {
    -[PXPhotosLayout viewModel](self, "viewModel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 0.0;
    if (objc_msgSend(v23, "navBarStyle") != 4)
    {
      -[PXPhotosLayout viewModel](self, "viewModel");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v25, "navBarStyle") != 5
        && !-[PXPhotosLayout alignsHeaderTitleWithLayoutMargins](self, "alignsHeaderTitleWithLayoutMargins"))
      {
        objc_msgSend(v32, "headerTitleButtonAlignmentSpacing");
        v24 = v26;
      }

    }
    v5 = v5 + v24;

    -[PXGLayout safeAreaInsets](self, "safeAreaInsets");
    v28 = v27;
    objc_msgSend(v32, "headerTitleTopSpacing");
    v6 = v28 + v29;
  }
  -[PXPhotosLayout headerTitleSize](self, "headerTitleSize");
  v30 = 0.0;
  if (v31 > 0.0)
    v30 = 6.0;
  -[PXPhotosLayout setHeaderTitleOrigin:](self, "setHeaderTitleOrigin:", v5, v6 - v30);

}

- (void)_invalidateHeaderMeasurementsForTitleChange
{
  void *v3;
  char v4;

  -[PXPhotosLayout viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "wantsDynamicTitles");

  if ((v4 & 1) == 0)
    -[PXPhotosLayout _invalidateHeaderMeasurements](self, "_invalidateHeaderMeasurements");
}

- (void)_invalidateHeaderMeasurements
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 4;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 4) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosLayout _invalidateHeaderMeasurements]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXPhotosLayout.m"), 1148, CFSTR("invalidating %lu after it already has been updated"), 4);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 4;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateHeaderMeasurements
{
  void *v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  char v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  unint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  _QWORD v31[5];

  if (self->_managesHeaderSprites || self->_managesOnlyLegibilityGradientSprites)
  {
    -[PXPhotosLayout viewModel](self, "viewModel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "wantsDynamicTitles"))
      -[PXPhotosLayout _headerTitleReferenceSize](self, "_headerTitleReferenceSize");
    else
      -[PXPhotosLayout _headerTitleSize](self, "_headerTitleSize");
    v5 = -0.0;
    if (v4 > 0.0)
      v5 = 12.0;
    v6 = v4 + v5;
    -[PXPhotosLayout setHeaderTitleSize:](self, "setHeaderTitleSize:");
    -[PXPhotosLayout _updateHeaderOrigin](self, "_updateHeaderOrigin");
    -[PXPhotosLayout specManager](self, "specManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "spec");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 <= 0.0)
    {
      v13 = 0.0;
      -[PXPhotosLayout setHeaderTitleBaselineToBottom:](self, "setHeaderTitleBaselineToBottom:", 0.0);
      v14 = 0.0;
    }
    else
    {
      objc_msgSend(v8, "headerTitleFont");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "descender");
      v11 = v6 + -6.0 + v10;

      objc_msgSend(v8, "headerTitleBottomSpacing");
      v13 = v6 + v12;
      -[PXPhotosLayout setHeaderTitleBaselineToBottom:](self, "setHeaderTitleBaselineToBottom:", v6 + v12 - v11);
      v14 = 0.0;
      if (v13 > 0.0)
      {
        v15 = objc_msgSend(v8, "isTV");
        v16 = 0.0;
        if ((v15 & 1) == 0)
          objc_msgSend(v8, "headerTitleTopSpacing", 0.0);
        v14 = v13 + v16;
      }
    }
    if (-[PXPhotosLayout wantsHeaderInSafeArea](self, "wantsHeaderInSafeArea"))
    {
      -[PXPhotosLayout headerTitleOrigin](self, "headerTitleOrigin");
      v18 = v13 + v17;
      -[PXGLayout safeAreaInsets](self, "safeAreaInsets");
      v20 = v18 - v19;
      if (v20 >= 0.0)
        v14 = v20;
      else
        v14 = 0.0;
    }
    -[PXPhotosLayout setTitleBackgroundSpriteHeight:](self, "setTitleBackgroundSpriteHeight:", v14);
    v21 = objc_msgSend(v3, "navBarStyle");
    v22 = 0.0;
    if (v21 <= 6 && ((1 << v21) & 0x4E) != 0)
    {
      -[PXGLayout safeAreaInsets](self, "safeAreaInsets", 0.0);
      v24 = v23;
      -[PXPhotosLayout statusBarHeight](self, "statusBarHeight");
      v26 = v24 - v25;
      +[PXPhotosGridSettings sharedInstance](PXPhotosGridSettings, "sharedInstance");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "headerGradientHeight");
      v29 = v28 - v26;

      -[PXPhotosLayout titleBackgroundSpriteHeight](self, "titleBackgroundSpriteHeight");
      v22 = fmax(v29 - v30, 0.0);
    }
    -[PXPhotosLayout setTitleBackgroundGradientAdditionalCoverage:](self, "setTitleBackgroundGradientAdditionalCoverage:", v22);
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __43__PXPhotosLayout__updateHeaderMeasurements__block_invoke;
    v31[3] = &unk_1E51437F8;
    v31[4] = self;
    objc_msgSend(v3, "performChanges:", v31);

  }
}

- (void)_invalidateTopHeaderLayout
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 0x20;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x20) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosLayout _invalidateTopHeaderLayout]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXPhotosLayout.m"), 1199, CFSTR("invalidating %lu after it already has been updated"), 32);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 32;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateTopHeaderLayout
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PXPhotosSectionedLayoutHeader *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PXPhotosSectionedLayout *sectionedLayout;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  PXPhotosSectionedLayoutHeader *v19;
  PXPhotosSectionedLayoutHeader *topHeaderLayout;
  BOOL v21;

  if (self->_topHeaderLayout)
    goto LABEL_2;
  if (self->_headerProviderRespondsTo.createTopHeaderLayoutForDataSource)
  {
    v21 = 0;
    -[PXPhotosLayout sectionHeaderProvider](self, "sectionHeaderProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    sectionedLayout = self->_sectionedLayout;
    -[PXPhotosLayout viewModel](self, "viewModel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "currentDataSource");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosLayout specManager](self, "specManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "spec");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "createTopHeaderLayoutForSectionedLayout:dataSource:spec:outShouldFloat:", sectionedLayout, v16, v18, &v21);
    v19 = (PXPhotosSectionedLayoutHeader *)objc_claimAutoreleasedReturnValue();
    topHeaderLayout = self->_topHeaderLayout;
    self->_topHeaderLayout = v19;

    if (self->_topHeaderLayout)
    {
      -[PXGLayout insertSublayout:atIndex:](self, "insertSublayout:atIndex:");
      -[PXPhotosLayout _invalidateLocalSpritesAlpha](self, "_invalidateLocalSpritesAlpha");
    }
    self->_topHeaderLayoutShouldFloat = v21;
    if (self->_topHeaderLayout)
    {
LABEL_2:
      -[PXPhotosLayout viewModel](self, "viewModel");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "selectionSnapshot");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPhotosSectionedLayoutHeader setSelectionSnapshot:](self->_topHeaderLayout, "setSelectionSnapshot:", v4);

      -[PXPhotosSectionedLayoutHeader setIsInSelectMode:](self->_topHeaderLayout, "setIsInSelectMode:", objc_msgSend(v3, "isInSelectMode"));
      -[PXPhotosLayout specManager](self, "specManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "spec");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPhotosSectionedLayoutHeader setSpec:](self->_topHeaderLayout, "setSpec:", v6);

      if (self->_headerProviderRespondsTo.configureTopHeaderLayout)
      {
        -[PXPhotosLayout sectionHeaderProvider](self, "sectionHeaderProvider");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = self->_topHeaderLayout;
        -[PXPhotosLayout viewModel](self, "viewModel");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "currentDataSource");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXPhotosLayout specManager](self, "specManager");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "spec");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "configureTopHeaderLayout:dataSource:spec:", v8, v10, v12);

      }
    }
  }
}

- (void)_invalidateGlobalHeaderLayout
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 0x10;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x10) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosLayout _invalidateGlobalHeaderLayout]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXPhotosLayout.m"), 1226, CFSTR("invalidating %lu after it already has been updated"), 16);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 16;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateGlobalHeaderLayout
{
  uint64_t v3;
  void *v4;
  PXPhotosGlobalHeader *globalHeaderLayout;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PXPhotosGlobalHeader *v11;
  PXPhotosGlobalHeader *v12;
  PXPhotosGlobalHeader *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  -[PXPhotosLayout viewModel](self, "viewModel");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[PXPhotosLayout globalHeaderProvider](self, "globalHeaderProvider");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  globalHeaderLayout = self->_globalHeaderLayout;
  if (globalHeaderLayout)
    v6 = 1;
  else
    v6 = v3 == 0;
  if (!v6)
  {
    -[PXPhotosLayout viewModel](self, "viewModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "currentDataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosLayout specManager](self, "specManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "spec");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "createGlobalHeaderLayoutForPhotosViewModel:dataSource:spec:", v7, v8, v10);
    v11 = (PXPhotosGlobalHeader *)objc_claimAutoreleasedReturnValue();
    v12 = self->_globalHeaderLayout;
    self->_globalHeaderLayout = v11;

    v13 = self->_globalHeaderLayout;
    if (!v13)
      goto LABEL_9;
    -[PXGLayout insertSublayout:atIndex:](self, "insertSublayout:atIndex:", v13, 0);
    -[PXPhotosLayout _invalidateLocalSpritesAlpha](self, "_invalidateLocalSpritesAlpha");
    globalHeaderLayout = self->_globalHeaderLayout;
  }
  if (globalHeaderLayout)
  {
    objc_msgSend(v17, "currentDataSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosLayout specManager](self, "specManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "spec");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "configureGlobalHeaderLayout:dataSource:spec:", globalHeaderLayout, v14, v16);

  }
LABEL_9:

}

- (void)_invalidateHeaderAnimated:(BOOL)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  uint64_t v5;
  _BOOL4 willPerformUpdate;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
      v5 = 512;
      if (a3)
        v5 = 256;
LABEL_10:
      p_updateFlags->needsUpdate = needsUpdate | v5;
      return;
    }
LABEL_7:
    v5 = 512;
    if (a3)
      v5 = 256;
    if ((self->_updateFlags.updated & v5) != 0)
    {
      v8 = v5;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosLayout _invalidateHeaderAnimated:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("PXPhotosLayout.m"), 1246, CFSTR("invalidating %lu after it already has been updated"), v8);

      abort();
    }
    goto LABEL_10;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_7;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  v7 = 512;
  if (a3)
    v7 = 256;
  p_updateFlags->needsUpdate = v7;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateHeaderAnimated:(BOOL)a3
{
  id v4;
  PXGSingleViewLayout *headerLayout;
  void *v6;
  void *v7;
  void *v8;
  PXGSingleViewLayout *v9;
  PXGSingleViewLayout *v10;
  void *v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;

  if (a3)
    v4 = -[PXPhotosLayout createDefaultAnimationForCurrentContext](self, "createDefaultAnimationForCurrentContext");
  headerLayout = self->_headerLayout;
  if (headerLayout)
    goto LABEL_4;
  -[PXPhotosLayout headerView](self, "headerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_alloc_init(PXGSingleViewLayout);
    v10 = self->_headerLayout;
    self->_headerLayout = v9;

    -[PXGLayout insertSublayout:atIndex:](self, "insertSublayout:atIndex:", self->_headerLayout, self->_topHeaderLayout != 0);
    -[PXGLayout rootLayout](self, "rootLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "createAnchorForVisibleAreaIgnoringEdges:", 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v11, "autoInvalidate");

LABEL_8:
    goto LABEL_9;
  }
  if (self->_headerLayout)
  {
LABEL_4:
    -[PXPhotosLayout headerView](self, "headerView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      goto LABEL_9;
    -[PXGLayout removeFromSuperlayout](self->_headerLayout, "removeFromSuperlayout");
    v7 = self->_headerLayout;
    self->_headerLayout = 0;
    goto LABEL_8;
  }
LABEL_9:
  -[PXPhotosLayout headerView](self, "headerView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGSingleViewLayout setContentView:](self->_headerLayout, "setContentView:", v13);

  -[PXNumberAnimator presentationValue](self->_headerFooterAlphaAnimator, "presentationValue");
  v15 = v14;
  -[PXPhotosLayout headerCustomizationModel](self, "headerCustomizationModel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[PXPhotosLayout headerCustomizationModel](self, "headerCustomizationModel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "alpha");
    v15 = v15 * v18;

  }
  -[PXGLayout setAlpha:](self->_headerLayout, "setAlpha:", v15);
  if ((headerLayout != 0) == (self->_headerLayout == 0))
    -[PXPhotosLayout _invalidateSectionedLayout](self, "_invalidateSectionedLayout");
}

- (void)_updateHeaderFooterAlphaAnimator
{
  void *v3;
  double v4;
  double v5;
  PXNumberAnimator *headerFooterAlphaAnimator;
  _QWORD v7[5];

  -[PXPhotosLayout viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (double)(objc_msgSend(v3, "hideSurroundingContent") ^ 1);

  -[PXNumberAnimator value](self->_headerFooterAlphaAnimator, "value");
  if (v5 != v4)
  {
    headerFooterAlphaAnimator = self->_headerFooterAlphaAnimator;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __50__PXPhotosLayout__updateHeaderFooterAlphaAnimator__block_invoke;
    v7[3] = &__block_descriptor_40_e35_v16__0___PXMutableNumberAnimator__8l;
    *(double *)&v7[4] = v4;
    -[PXNumberAnimator performChangesWithDuration:curve:changes:](headerFooterAlphaAnimator, "performChangesWithDuration:curve:changes:", 1, v7, 0.2);
  }
}

- (void)_invalidateFooter
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 0x80;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x80) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosLayout _invalidateFooter]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXPhotosLayout.m"), 1288, CFSTR("invalidating %lu after it already has been updated"), 128);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 128;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateFooter
{
  PXGSingleViewLayout *footerLayout;
  uint64_t v4;
  void *v5;
  id v6;
  PXGSingleViewLayout *v7;
  PXGSingleViewLayout *v8;
  PXGSingleViewLayout *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  PXGSingleViewLayout *v19;
  PXGSingleViewLayout *v20;
  id v21;

  footerLayout = self->_footerLayout;
  -[PXPhotosLayout footerView](self, "footerView");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[PXPhotosLayout viewModel](self, "viewModel");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "contentPrivacyState") == 1 || objc_msgSend(v6, "scrollingBehavior") == 1)
    {

    }
    else
    {
      objc_msgSend(v6, "currentLens");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "defaultSectionBodyStyle");

      if (v18 != 4)
      {
        v9 = self->_footerLayout;
        if (v9)
          goto LABEL_9;
        v19 = objc_alloc_init(PXGSingleViewLayout);
        v20 = self->_footerLayout;
        self->_footerLayout = v19;

        -[PXGLayout insertSublayout:atIndex:](self, "insertSublayout:atIndex:", self->_footerLayout, -[PXGLayout numberOfSublayouts](self, "numberOfSublayouts"));
        goto LABEL_7;
      }
    }
  }
  v7 = self->_footerLayout;
  if (!v7)
  {
    v9 = 0;
    goto LABEL_9;
  }
  -[PXGLayout removeFromSuperlayout](v7, "removeFromSuperlayout");
  v8 = self->_footerLayout;
  self->_footerLayout = 0;

LABEL_7:
  v9 = self->_footerLayout;
LABEL_9:
  -[PXPhotosLayout footerView](self, "footerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGSingleViewLayout setContentView:](self->_footerLayout, "setContentView:", v10);

  -[PXNumberAnimator presentationValue](self->_headerFooterAlphaAnimator, "presentationValue");
  -[PXGLayout setAlpha:](self->_footerLayout, "setAlpha:");
  if ((footerLayout == 0) == (v9 != 0))
  {
    -[PXPhotosLayout _invalidateSectionedLayout](self, "_invalidateSectionedLayout");
    if (v9)
    {
      if (!self->_footerHasAppearedInitially)
      {
        -[PXPhotosLayout viewModel](self, "viewModel");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "hasScrollableContent");

        if ((v12 & 1) == 0)
        {
          -[PXGLayout createAnimation](self->_footerLayout, "createAnimation");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          +[PXPhotosGridSettings sharedInstance](PXPhotosGridSettings, "sharedInstance");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "defaultAnimationDuration");
          objc_msgSend(v13, "setDuration:");

          objc_msgSend(v13, "setScope:", 1);
        }
      }
      self->_footerHasAppearedInitially = 1;
    }
  }
  -[PXGLayout rootLayout](self, "rootLayout");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "createAnchorForVisibleAreaIgnoringEdges:", 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v15, "autoInvalidate");

}

- (id)createAnchorForVisibleAreaIgnoringEdges:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  unint64_t v7;
  objc_super v9;

  -[PXPhotosLayout viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "scrollingBehavior");

  if (v6 == 1)
    v7 = 15;
  else
    v7 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXPhotosLayout;
  -[PXGLayout createAnchorForVisibleAreaIgnoringEdges:](&v9, sel_createAnchorForVisibleAreaIgnoringEdges_, v7);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)clearLastVisibleAreaAnchoringInformation
{
  void *v3;
  char isKindOfClass;
  void *v5;
  objc_super v6;

  if (self->_isClearingLastVisibleAreaAnchoringInformation
    || (-[PXGLayout superlayout](self, "superlayout"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v3,
        (isKindOfClass & 1) == 0))
  {
    v6.receiver = self;
    v6.super_class = (Class)PXPhotosLayout;
    -[PXGLayout clearLastVisibleAreaAnchoringInformation](&v6, sel_clearLastVisibleAreaAnchoringInformation);
  }
  else
  {
    self->_isClearingLastVisibleAreaAnchoringInformation = 1;
    -[PXGLayout superlayout](self, "superlayout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "clearLastVisibleAreaAnchoringInformation");

    self->_isClearingLastVisibleAreaAnchoringInformation = 0;
  }
}

- (void)_invalidateSectionedLayout
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 8;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 8) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosLayout _invalidateSectionedLayout]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXPhotosLayout.m"), 1348, CFSTR("invalidating %lu after it already has been updated"), 8);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 8;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateSectionedLayout
{
  _BOOL4 v3;
  PXPhotosSectionedLayout *sectionedLayout;
  PXPhotosSectionedLayout *v5;
  void *v6;
  PXPhotosSectionedLayout *v7;
  PXPhotosSectionedLayout *v8;
  uint64_t v9;
  uint64_t v10;
  PXPhotosSectionedLayout *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  int v21;
  double v22;
  void *v23;
  uint64_t v24;
  double v25;
  id v26;

  v3 = -[PXPhotosLayout _shouldShowSectionedLayout](self, "_shouldShowSectionedLayout");
  sectionedLayout = self->_sectionedLayout;
  if (v3)
  {
    if (sectionedLayout)
      goto LABEL_13;
    v5 = [PXPhotosSectionedLayout alloc];
    -[PXPhotosLayout viewModel](self, "viewModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[PXPhotosSectionedLayout initWithViewModel:](v5, "initWithViewModel:", v6);
    v8 = self->_sectionedLayout;
    self->_sectionedLayout = v7;

    if (self->_globalHeaderLayout)
      v9 = (self->_topHeaderLayout != 0) + 1;
    else
      v9 = self->_topHeaderLayout != 0;
    if (self->_headerLayout)
      v10 = v9 + 1;
    else
      v10 = v9;
    -[PXGLayout insertSublayout:atIndex:](self, "insertSublayout:atIndex:", self->_sectionedLayout, v10);
  }
  else
  {
    if (!sectionedLayout)
      return;
    -[PXGLayout removeFromSuperlayout](sectionedLayout, "removeFromSuperlayout");
    v11 = self->_sectionedLayout;
    self->_sectionedLayout = 0;

  }
  if (!self->_sectionedLayout)
    return;
LABEL_13:
  -[PXPhotosLayout sectionHeaderProvider](self, "sectionHeaderProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosSectionedLayout setHeaderLayoutProvider:](self->_sectionedLayout, "setHeaderLayoutProvider:", v12);

  -[PXPhotosLayout sectionBodyProvider](self, "sectionBodyProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosSectionedLayout setBodyLayoutProvider:](self->_sectionedLayout, "setBodyLayoutProvider:", v13);

  -[PXPhotosLayout specManager](self, "specManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "spec");
  v26 = (id)objc_claimAutoreleasedReturnValue();

  -[PXPhotosSectionedLayout setSpec:](self->_sectionedLayout, "setSpec:", v26);
  -[PXPhotosLayout viewModel](self, "viewModel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "aspectFitContent"))
    objc_msgSend(v26, "aspectFitContentVerticalPadding");
  else
    objc_msgSend(v26, "squareContentVerticalPadding");

  if (!self->_headerLayout)
  {
    -[PXPhotosLayout sectionHeaderProvider](self, "sectionHeaderProvider");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16 || self->_managesHeaderSprites)
    {

    }
    else if (!self->_managesOnlyLegibilityGradientSprites)
    {
      goto LABEL_26;
    }
  }
  -[PXPhotosLayout specManager](self, "specManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "gridStyle");

  if (v18 >= 4)
  {
    if (v18 - 4 >= 2)
      goto LABEL_23;
LABEL_25:
    -[PXGLayout safeAreaInsets](self, "safeAreaInsets");
    goto LABEL_26;
  }
  -[PXPhotosLayout viewModel](self, "viewModel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "currentLens");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "ignoresTopSafeAreaInset");

  if (v21)
    goto LABEL_25;
LABEL_23:
  -[PXPhotosLayout titleBackgroundSpriteHeight](self, "titleBackgroundSpriteHeight");
LABEL_26:
  v22 = 0.0;
  PXEdgeInsetsMake();
  -[PXGStackLayout setPadding:](self->_sectionedLayout, "setPadding:");
  -[PXPhotosLayout viewModel](self, "viewModel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "scrollingBehavior");

  if (v24 == 1)
  {
    objc_msgSend(v26, "interPageSpacing");
    v22 = v25;
  }
  -[PXGStackLayout setInterlayoutSpacing:](self->_sectionedLayout, "setInterlayoutSpacing:", v22);

}

- (void)_invalidateSectionedLayoutPlacementOverrides
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 0x40;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x40) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosLayout _invalidateSectionedLayoutPlacementOverrides]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXPhotosLayout.m"), 1412, CFSTR("invalidating %lu after it already has been updated"), 64);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 64;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateSectionedLayoutPlacementOverrides
{
  double v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  int v22;
  int v23;
  int v24;
  int v25;
  double v26;
  double v27;
  int v28;
  int v29;
  int v30;
  int v31;
  double v32;
  double v33;
  double v34;
  double v35;
  int64_t v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[4];
  CGAffineTransform v45;
  double v46;
  CGAffineTransform v47;
  CGAffineTransform v48;
  CGAffineTransform v49;

  if (self->_sectionedLayout)
  {
    v42 = *((_OWORD *)off_1E50B8368 + 1);
    v43 = *(_OWORD *)off_1E50B8368;
    *(_OWORD *)&v48.a = *(_OWORD *)off_1E50B8368;
    *(_OWORD *)&v48.c = v42;
    v41 = *((_OWORD *)off_1E50B8368 + 2);
    *(_OWORD *)&v48.tx = v41;
    v4 = *((double *)off_1E50B8368 + 6);
    -[PXPhotosLayout placementOverride](self, "placementOverride");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      if ((objc_msgSend(v5, "hasGeometry") & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosLayout.m"), 1426, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("placementOverride.hasGeometry"));

      }
      -[PXPhotosLayout originalPlacementRect](self, "originalPlacementRect");
      v39 = v8;
      v40 = v7;
      v10 = v9;
      v12 = v11;
      objc_msgSend(v6, "rectInLayout:velocity:", self, 0);
      v14 = v13 / v10;
      PXRectGetCenter();
      v16 = v15;
      v18 = v17;
      PXSizeGetAspectRatio();
      *(_OWORD *)&v47.a = v43;
      *(_OWORD *)&v47.c = v42;
      *(_OWORD *)&v47.tx = v41;
      *(_OWORD *)&v49.a = v43;
      *(_OWORD *)&v49.c = v42;
      *(_OWORD *)&v49.tx = v41;
      v20 = v10 / v19;
      CGAffineTransformTranslate(&v47, &v49, v16, v18);
      v4 = v4 + 0.0;
      v48 = v47;
      v49 = v47;
      CGAffineTransformScale(&v47, &v49, v14, v14);
      v48 = v47;
      -[PXGLayout safeAreaInsets](self, "safeAreaInsets");
      v47 = v48;
      v49 = v48;
      CGAffineTransformTranslate(&v47, &v49, v10 * -0.5, v21 + v12 * -0.5);
      v48 = v47;
      objc_msgSend(v6, "cornerRadius");
      v23 = v22;
      v25 = v24;
      v27 = v39;
      v26 = v40;
      v29 = v28;
      v31 = v30;
    }
    else
    {
      v26 = *MEMORY[0x1E0C9D5E0];
      v27 = *(double *)(MEMORY[0x1E0C9D5E0] + 8);
      v10 = *(double *)(MEMORY[0x1E0C9D5E0] + 16);
      v20 = *(double *)(MEMORY[0x1E0C9D5E0] + 24);
      v23 = *(_DWORD *)off_1E50B8248;
      v25 = *((_DWORD *)off_1E50B8248 + 1);
      v29 = *((_DWORD *)off_1E50B8248 + 2);
      v31 = *((_DWORD *)off_1E50B8248 + 3);
    }
    -[PXPhotosSectionedLayout setMaskRect:](self->_sectionedLayout, "setMaskRect:", v26, v27, v10, v20);
    LODWORD(v32) = v23;
    LODWORD(v33) = v25;
    LODWORD(v34) = v29;
    LODWORD(v35) = v31;
    -[PXPhotosSectionedLayout setMaskCornerRadius:](self->_sectionedLayout, "setMaskCornerRadius:", v32, v33, v34, v35);
    -[PXPhotosSectionedLayout setPlacementOverride:](self->_sectionedLayout, "setPlacementOverride:", v6);
    v36 = -[PXGLayout indexOfSublayout:](self, "indexOfSublayout:", self->_sectionedLayout);
    -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __58__PXPhotosLayout__updateSectionedLayoutPlacementOverrides__block_invoke;
    v44[3] = &__block_descriptor_88_e93_v40__0q8_____CGSize_dd_dS_CGSize_dd____ddd_____CGAffineTransform_dddddd_d_d_16_____v_v_24_B32l;
    v45 = v48;
    v46 = v4;
    objc_msgSend(v37, "enumerateSublayoutGeometriesInRange:options:usingBlock:", v36, 1, 0, v44);

  }
}

- (void)_invalidateLocalSpritesCount
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 0x400;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x400) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosLayout _invalidateLocalSpritesCount]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXPhotosLayout.m"), 1457, CFSTR("invalidating %lu after it already has been updated"), 1024);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 1024;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateLocalSpritesCount
{
  unsigned int v3;

  if (self->_managesHeaderSprites || self->_managesOnlyLegibilityGradientSprites)
  {
    v3 = -[PXGLayout localNumberOfSprites](self, "localNumberOfSprites");
    if (v3 != -[PXPhotosLayout _expectedLocalSpriteCount](self, "_expectedLocalSpriteCount"))
      -[PXGLayout applySpriteChangeDetails:countAfterChanges:initialState:modifyState:](self, "applySpriteChangeDetails:countAfterChanges:initialState:modifyState:", 0, -[PXPhotosLayout _expectedLocalSpriteCount](self, "_expectedLocalSpriteCount"), &__block_literal_global_248_204916, 0);
  }
}

- (void)_invalidateScrollDetentAnchor
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 0x800;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 0x800) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosLayout _invalidateScrollDetentAnchor]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXPhotosLayout.m"), 1475, CFSTR("invalidating %lu after it already has been updated"), 2048);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 2048;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateScrollDetentAnchor
{
  void *v3;
  void *v4;
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
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;

  -[PXPhotosLayout viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastPreferredScrollDetent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PXPhotosLayout viewModel](self, "viewModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastPreferredScrollDetent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "offset");
    PXEdgeInsetsMake();

    -[PXGLayout safeAreaInsets](self, "safeAreaInsets");
    sub_1A7AE3F38();
    PXEdgeInsetsAdd();
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    -[PXGLayout rootLayout](self, "rootLayout");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "createAnchorForScrollingToContentEdges:padding:", 1, v8, v10, v12, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "autoInvalidate");
    v20 = (id)objc_claimAutoreleasedReturnValue();

    -[PXGLayout activeAnchor](self, "activeAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v17)
    {
      -[PXGLayout createAnchorWithAnchor:](self, "createAnchorWithAnchor:", v20);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (id)objc_msgSend(v18, "autoInvalidate");

    }
  }
}

- (void)_invalidateContentBelowTitle
{
  $F40CD077B40800501ED060B808F886F7 *p_postUpdateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_postUpdateFlags = &self->_postUpdateFlags;
  needsUpdate = self->_postUpdateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_postUpdateFlags->needsUpdate = needsUpdate | 0x200000;
      return;
    }
LABEL_5:
    if ((self->_postUpdateFlags.updated & 0x200000) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosLayout _invalidateContentBelowTitle]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXPhotosLayout.m"), 1490, CFSTR("invalidating %lu after it already has been updated"), 0x200000);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_postUpdateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_postUpdateFlags.willPerformUpdate;
  p_postUpdateFlags->needsUpdate = 0x200000;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateContentBelowTitle
{
  void *v3;
  void *v4;
  int v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;
  int v12;
  void *v13;
  _QWORD v14[4];
  char v15;

  -[PXPhotosLayout viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentLens");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "ignoresTopSafeAreaInset");

  -[PXPhotosLayout headerTitleBaselineToBottom](self, "headerTitleBaselineToBottom");
  v7 = v6;
  -[PXGLayout visibleRect](self, "visibleRect");
  v9 = v8;
  -[PXGLayout safeAreaInsets](self, "safeAreaInsets");
  if (v5)
    v11 = v7 + v9 + v10 * 2.0 <= 0.0;
  else
    v11 = v9 + v10 <= v7;
  v12 = !v11;
  -[PXPhotosLayout viewModel](self, "viewModel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 != objc_msgSend(v13, "isContentBelowTitle"))
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __42__PXPhotosLayout__updateContentBelowTitle__block_invoke;
    v14[3] = &__block_descriptor_33_e53_v16__0__PXPhotosViewModel_PXMutablePhotosViewModel__8l;
    v15 = v12;
    objc_msgSend(v13, "performChanges:", v14);
  }

}

- (void)_invalidateGlobalBackground
{
  ++self->_globalBackgroundVersion;
}

- (void)_invalidateLocalSprites
{
  $F40CD077B40800501ED060B808F886F7 *p_postUpdateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_postUpdateFlags = &self->_postUpdateFlags;
  needsUpdate = self->_postUpdateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_postUpdateFlags->needsUpdate = needsUpdate | 0x800000;
      return;
    }
LABEL_5:
    if ((self->_postUpdateFlags.updated & 0x800000) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosLayout _invalidateLocalSprites]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXPhotosLayout.m"), 1519, CFSTR("invalidating %lu after it already has been updated"), 0x800000);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_postUpdateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_postUpdateFlags.willPerformUpdate;
  p_postUpdateFlags->needsUpdate = 0x800000;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateLocalSprites
{
  void *v4;
  void *v5;
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
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  char v22;
  double v23;
  double v24;
  double v25;
  unsigned __int8 v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  CGFloat v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  CGFloat v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  PXPhotosSectionedLayout *sectionedLayout;
  int64_t v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  CGFloat v53;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v58;
  double v59;
  double v60;
  double v61;
  float v62;
  uint64_t v63;
  id v64;
  id v65;
  double v66;
  void *v67;
  double v68;
  double v69;
  double v70;
  unsigned int v71;
  uint64_t v72;
  CGFloat v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  uint64_t v79;
  double v80;
  double v81;
  double v82;
  double v83;
  uint64_t v84;
  double v85;
  _QWORD v86[6];
  unsigned int v87;
  _QWORD aBlock[5];
  _QWORD v89[4];
  id v90;
  PXPhotosLayout *v91;
  id v92;
  SEL v93;
  CGFloat v94;
  CGFloat v95;
  CGFloat v96;
  CGFloat v97;
  uint64_t v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  uint64_t v105;
  float v106;
  _QWORD v107[5];
  uint64_t v108;
  double *v109;
  uint64_t v110;
  void *v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  uint64_t v120;
  CGRect v121;
  CGRect v122;

  if (!*(_WORD *)&self->_managesHeaderSprites)
    return;
  -[PXPhotosLayout viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosLayout specManager](self, "specManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "spec");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPhotosLayout headerCustomizationModel](self, "headerCustomizationModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosLayout headerTitleOrigin](self, "headerTitleOrigin");
  v9 = v8;
  v11 = v10;
  -[PXGLayout displayScale](self, "displayScale");
  v81 = v12;
  -[PXGLayout referenceSize](self, "referenceSize");
  v83 = v13;
  v14 = v13 + v9 * -2.0;
  -[PXPhotosLayout headerTitleSize](self, "headerTitleSize");
  v16 = v15;
  v84 = v17;
  -[PXGLayout visibleRect](self, "visibleRect");
  v19 = v18;
  objc_msgSend(v7, "verticalVisibilityOffset");
  v80 = v20;
  if (v16 >= v14)
    v21 = v14;
  else
    v21 = v16;
  v82 = v21;
  v22 = objc_msgSend(v4, "wantsFloatingTitle");
  v23 = v19;
  if ((v22 & 1) == 0)
  {
    -[PXGLayout safeAreaInsets](self, "safeAreaInsets", v19);
    v23 = -v24;
  }
  v25 = v11 + v23;
  v26 = objc_msgSend(v6, "isTV");
  v27 = 0.0;
  if ((v26 & (v25 < 0.0)) == 0)
    v27 = v25;
  v78 = v27;
  objc_msgSend(v7, "verticalFloatingOffset");
  v77 = v28;
  -[PXGLayout safeAreaInsets](self, "safeAreaInsets");
  v76 = v29;
  -[PXPhotosLayout titleBackgroundSpriteHeight](self, "titleBackgroundSpriteHeight");
  v75 = v30;
  -[PXPhotosLayout titleBackgroundGradientAdditionalCoverage](self, "titleBackgroundGradientAdditionalCoverage");
  v74 = v31;
  -[PXGLayout visibleRect](self, "visibleRect");
  v33 = v32;
  -[PXGLayout contentSize](self, "contentSize");
  PXRectWithOriginAndSize();
  v35 = v34;
  v37 = v36;
  v39 = v38;
  v41 = v40;
  -[PXPhotosLayout viewModel](self, "viewModel");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "gridStyle");
  v44 = MEMORY[0x1E0C809B0];
  v85 = v9;
  v79 = v33;
  if (v43 != 4)
  {

    goto LABEL_13;
  }
  sectionedLayout = self->_sectionedLayout;

  if (!sectionedLayout)
  {
LABEL_13:
    -[PXGLayout visibleRect](self, "visibleRect");
    PXEdgeInsetsMake();
    PXEdgeInsetsInsetRect();
    objc_msgSend(v4, "contentBackgroundInsets");
    PXEdgeInsetsInsetRect();
    v73 = v58;
    y = v59;
    width = v60;
    height = v61;
    goto LABEL_14;
  }
  v46 = -[PXGLayout indexOfSublayout:](self, "indexOfSublayout:", self->_sectionedLayout);
  v108 = 0;
  v109 = (double *)&v108;
  v110 = 0xA810000000;
  v111 = &unk_1A7E74EE7;
  v112 = 0u;
  v113 = 0u;
  v114 = 0u;
  v115 = 0u;
  v116 = 0u;
  v117 = 0u;
  v118 = 0u;
  v119 = 0u;
  v120 = 0;
  -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v107[0] = v44;
  v107[1] = 3221225472;
  v107[2] = __37__PXPhotosLayout__updateLocalSprites__block_invoke;
  v107[3] = &unk_1E5135BE0;
  v107[4] = &v108;
  objc_msgSend(v47, "enumerateSublayoutGeometriesInRange:options:usingBlock:", v46, 1, 0, v107);

  +[PXZoomablePhotosSettings sharedInstance](PXZoomablePhotosSettings, "sharedInstance");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "interitemSpacing");
  v50 = v49;

  v51 = v109[11];
  -[PXGLayout safeAreaInsets](self, "safeAreaInsets");
  v53 = v51 - v52 - v50;
  v121.origin.x = v35;
  v121.origin.y = v37;
  v121.size.width = v39;
  v121.size.height = v41;
  v122 = CGRectOffset(v121, 0.0, v53);
  x = v122.origin.x;
  y = v122.origin.y;
  width = v122.size.width;
  height = v122.size.height;
  _Block_object_dispose(&v108, 8);
  v73 = x;
LABEL_14:
  v62 = v81;
  v63 = -[PXPhotosLayout _expectedLocalSpriteCount](self, "_expectedLocalSpriteCount") << 32;
  v89[0] = v44;
  v89[1] = 3221225472;
  v89[2] = __37__PXPhotosLayout__updateLocalSprites__block_invoke_2;
  v89[3] = &unk_1E5135C08;
  v64 = v4;
  v93 = a2;
  v90 = v64;
  v91 = self;
  v94 = v73;
  v95 = y;
  v96 = width;
  v97 = height;
  v98 = v79;
  v99 = v80 + v19;
  v100 = v83;
  v101 = v76 + v75 + v74;
  v65 = v6;
  v92 = v65;
  v106 = v62;
  v102 = v85;
  v103 = v77 + v78;
  v104 = v82;
  v105 = v84;
  -[PXGLayout modifySpritesInRange:state:](self, "modifySpritesInRange:state:", v63, v89);
  -[PXPhotosLayout _invalidateLocalSpritesAlpha](self, "_invalidateLocalSpritesAlpha");
  if (objc_msgSend(v64, "requiresLightTopBars"))
    v66 = 1.0;
  else
    v66 = 0.0;
  aBlock[0] = v44;
  aBlock[1] = 3221225472;
  aBlock[2] = __37__PXPhotosLayout__updateLocalSprites__block_invoke_3;
  aBlock[3] = &__block_descriptor_40_e35_v16__0___PXMutableNumberAnimator__8l;
  *(double *)&aBlock[4] = v66;
  v67 = _Block_copy(aBlock);
  -[PXNumberAnimator presentationValue](self->_alternateAppearanceMixAnimator, "presentationValue");
  if (!self->_presentedVisibility || (v69 = v68, v66 == v68) || (objc_msgSend(v64, "isAppearing") & 1) != 0)
  {
    -[PXNumberAnimator performChangesWithoutAnimation:](self->_alternateAppearanceMixAnimator, "performChangesWithoutAnimation:", v67);
  }
  else
  {
    objc_msgSend(v64, "topBarsAppearanceChangeAnimationDuration");
    -[PXNumberAnimator performChangesWithDuration:curve:changes:](self->_alternateAppearanceMixAnimator, "performChangesWithDuration:curve:changes:", 1, v67, vabdd_f64(v66, v69) * v70);
  }
  v71 = -[PXGLayout localNumberOfSprites](self, "localNumberOfSprites");
  -[PXGLayout alpha](self, "alpha");
  v86[0] = v44;
  v86[1] = 3221225472;
  v86[2] = __37__PXPhotosLayout__updateLocalSprites__block_invoke_4;
  v86[3] = &unk_1E5135C30;
  v86[4] = self;
  v86[5] = v72;
  v87 = v71;
  -[PXGLayout installLayoutCompletionBlock:](self, "installLayoutCompletionBlock:", v86);

}

- (void)_invalidateLocalSpritesAlpha
{
  $F40CD077B40800501ED060B808F886F7 *p_postUpdateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  p_postUpdateFlags = &self->_postUpdateFlags;
  needsUpdate = self->_postUpdateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_postUpdateFlags->needsUpdate = needsUpdate | 0x1000000;
      return;
    }
LABEL_5:
    if ((self->_postUpdateFlags.updated & 0x1000000) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosLayout _invalidateLocalSpritesAlpha]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXPhotosLayout.m"), 1665, CFSTR("invalidating %lu after it already has been updated"), 0x1000000);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_postUpdateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_postUpdateFlags.willPerformUpdate;
  p_postUpdateFlags->needsUpdate = 0x1000000;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateLocalSpritesAlpha
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  unsigned int v11;
  _BOOL4 v12;
  float v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  float v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  double v34;
  uint64_t v35;
  id v36;
  _QWORD v37[12];
  unsigned int v38;
  _QWORD v39[4];
  unsigned int v40;
  float v41;
  _QWORD v42[5];
  unsigned int v43;
  float v44;

  if (self->_managesHeaderSprites || self->_managesOnlyLegibilityGradientSprites)
  {
    -[PXPhotosLayout viewModel](self, "viewModel");
    v36 = (id)objc_claimAutoreleasedReturnValue();
    -[PXPhotosLayout specManager](self, "specManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "spec");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    +[PXPhotosGridSettings sharedInstance](PXPhotosGridSettings, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v36, "navBarStyle");
    objc_msgSend(v4, "contentBackgroundOpacity");
    v8 = v7;
    objc_msgSend(v36, "contentBackgroundOpacity");
    if (v8 >= v9)
      v10 = v8;
    else
      v10 = v9;
    v11 = -[PXPhotosLayout _titleBackgroundSpriteIndex](self, "_titleBackgroundSpriteIndex");
    if ((v6 & 0xFFFFFFFFFFFFFFFELL) == 4)
    {
      v12 = self->_topHeaderLayout == 0;
      if ((objc_msgSend(v36, "isScrolledToTop") & v12) != 0)
        v13 = 0.0;
      else
        v13 = 1.0;
      v14 = -[PXPhotosLayout _expectedLocalSpriteCount](self, "_expectedLocalSpriteCount");
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v15 = v14 << 32;
      v42[2] = __42__PXPhotosLayout__updateLocalSpritesAlpha__block_invoke;
      v42[3] = &__block_descriptor_48_e101_v40__0__PXGSpriteIndexRange_II_8_______ddd__16____f_________ffff__4f___ffffSCf____4___24____CCfqSC_32l;
      *(double *)&v42[4] = v10;
      v43 = v11;
      v44 = v13;
      v16 = v42;
    }
    else
    {
      if (v6 != 6)
      {
        objc_msgSend(v36, "titleBackgroundOpacity");
        v19 = v18;
        -[PXNumberAnimator presentationValue](self->_alternateAppearanceMixAnimator, "presentationValue");
        v21 = v20;
        v22 = 1.0 - v20;
        if (objc_msgSend(v4, "userInterfaceStyle") == 2)
          v23 = 1.0;
        else
          v23 = v21;
        v24 = 0;
        if (objc_msgSend(v4, "userInterfaceStyle") == 2)
          v25 = 0.0;
        else
          v25 = v22;
        objc_msgSend(v5, "headerGradientAlpha");
        v27 = v26;
        if (!-[PXPhotosLayout wantsHeaderInSafeArea](self, "wantsHeaderInSafeArea"))
        {
          -[PXPhotosLayout viewModel](self, "viewModel");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v28, "isInCompactMode"))
          {
            objc_msgSend(v5, "behindContentBackgroundGradientAlpha");
            v24 = v29;
          }

        }
        if (objc_msgSend(v36, "wantsFloatingTitle"))
          objc_msgSend(v36, "floatingTitleOpacity");
        else
          -[PXNumberAnimator presentationValue](self->_headerFooterAlphaAnimator, "presentationValue");
        v31 = v30;
        -[PXPhotosLayout headerCustomizationModel](self, "headerCustomizationModel");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v32;
        if (v32)
        {
          objc_msgSend(v32, "alpha");
          v31 = v31 * v34;
        }
        v35 = -[PXPhotosLayout _expectedLocalSpriteCount](self, "_expectedLocalSpriteCount");
        v37[0] = MEMORY[0x1E0C809B0];
        v37[1] = 3221225472;
        v37[2] = __42__PXPhotosLayout__updateLocalSpritesAlpha__block_invoke_3;
        v37[3] = &__block_descriptor_100_e101_v40__0__PXGSpriteIndexRange_II_8_______ddd__16____f_________ffff__4f___ffffSCf____4___24____CCfqSC_32l;
        v38 = v11;
        *(double *)&v37[4] = v10;
        v37[5] = v19;
        *(double *)&v37[6] = v21;
        v37[7] = v27;
        v37[8] = v24;
        *(double *)&v37[9] = v31;
        *(double *)&v37[10] = v23;
        *(double *)&v37[11] = v25;
        -[PXGLayout modifySpritesInRange:state:](self, "modifySpritesInRange:state:", v35 << 32, v37);

        goto LABEL_34;
      }
      if (objc_msgSend(v36, "isScrolledToTop"))
        v17 = 0.0;
      else
        v17 = 0.65;
      v15 = -[PXPhotosLayout _expectedLocalSpriteCount](self, "_expectedLocalSpriteCount") << 32;
      v39[0] = MEMORY[0x1E0C809B0];
      v39[1] = 3221225472;
      v39[2] = __42__PXPhotosLayout__updateLocalSpritesAlpha__block_invoke_2;
      v39[3] = &__block_descriptor_40_e101_v40__0__PXGSpriteIndexRange_II_8_______ddd__16____f_________ffff__4f___ffffSCf____4___24____CCfqSC_32l;
      v40 = v11;
      v41 = v17;
      v16 = v39;
    }
    -[PXGLayout modifySpritesInRange:state:](self, "modifySpritesInRange:state:", v15, v16);
LABEL_34:

  }
}

- (int64_t)sublayoutIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5
{
  id v8;
  void *v9;
  int64_t v10;
  void *v12;

  v8 = objc_retainAutorelease(a3);
  *a5 = v8;
  if (-[PXPhotosLayout _shouldShowSectionedLayout](self, "_shouldShowSectionedLayout"))
  {
    if (!self->_sectionedLayout)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosLayout.m"), 1729, CFSTR("missing _sectionedLayout in %@"), self);

    }
    -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "indexOfSublayout:", self->_sectionedLayout);

  }
  else
  {
    v10 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v10;
}

- (id)hitTestResultForSpriteIndex:(unsigned int)a3
{
  void *v4;
  void *v5;
  int v6;
  PXGHitTestResult *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  PXGHitTestResult *v14;
  const __CFString *v15;
  PXGHitTestResult *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  PXGHitTestResult *v24;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)PXPhotosLayout;
  -[PXGLayout hitTestResultForSpriteIndex:](&v26, sel_hitTestResultForSpriteIndex_, *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("PXGHitTestUserDataIdentifierItem"));

  if (v6)
  {
    v7 = [PXGHitTestResult alloc];
    objc_msgSend(v4, "spriteReference");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userData");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = -[PXGHitTestResult initWithSpriteReference:layout:identifier:userData:](v7, "initWithSpriteReference:layout:identifier:userData:", v8, v9, CFSTR("PXPhotosLayoutHitTestIdentifierAsset"), v10);

    v4 = (void *)v10;
LABEL_8:

    v4 = (void *)v11;
    return v4;
  }
  objc_msgSend(v4, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("PXGHitTestUserDataIdentifierAccessoryItem"));

  if (v13)
  {
    v14 = [PXGHitTestResult alloc];
    objc_msgSend(v4, "spriteReference");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = CFSTR("PXPhotosLayoutHitTestIdentifierAccessoryCell");
    v16 = v14;
    v17 = v8;
    v18 = v9;
    v19 = 0;
LABEL_7:
    v11 = -[PXGHitTestResult initWithSpriteReference:layout:identifier:userData:](v16, "initWithSpriteReference:layout:identifier:userData:", v17, v18, v15, v19);
    goto LABEL_8;
  }
  -[PXPhotosLayout overlayController](self, "overlayController");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "spriteReference");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectReference");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v20, "canHandleObjectReference:", v22);

  if (v23)
  {
    v24 = [PXGHitTestResult alloc];
    objc_msgSend(v4, "spriteReference");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = CFSTR("PXPhotosLayoutHitTestIdentifierOverlayItem");
    v16 = v24;
    v17 = v8;
    v18 = v9;
    v19 = v4;
    goto LABEL_7;
  }
  return v4;
}

- (void)visibleRectDidChange
{
  void *v3;
  int v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXPhotosLayout;
  -[PXGStackLayout visibleRectDidChange](&v5, sel_visibleRectDidChange);
  -[PXPhotosLayout _invalidateContentBelowTitle](self, "_invalidateContentBelowTitle");
  -[PXPhotosLayout _invalidateLocalSprites](self, "_invalidateLocalSprites");
  -[PXPhotosLayout _invalidateHeaderOrigin](self, "_invalidateHeaderOrigin");
  -[PXPhotosLayout viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "wantsDynamicTitles");

  if (v4)
    -[PXPhotosLayout _invalidateDynamicHeaderTitle](self, "_invalidateDynamicHeaderTitle");
}

- (void)referenceSizeDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXPhotosLayout;
  -[PXGStackLayout referenceSizeDidChange](&v3, sel_referenceSizeDidChange);
  -[PXPhotosLayout _invalidateHeaderMeasurements](self, "_invalidateHeaderMeasurements");
}

- (void)displayScaleDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXPhotosLayout;
  -[PXGStackLayout displayScaleDidChange](&v3, sel_displayScaleDidChange);
  -[PXPhotosLayout _invalidateLocalSprites](self, "_invalidateLocalSprites");
}

- (void)safeAreaInsetsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXPhotosLayout;
  -[PXGLayout safeAreaInsetsDidChange](&v3, sel_safeAreaInsetsDidChange);
  -[PXPhotosLayout _invalidateHeaderMeasurements](self, "_invalidateHeaderMeasurements");
  -[PXPhotosLayout _invalidateContentBelowTitle](self, "_invalidateContentBelowTitle");
  -[PXPhotosLayout _invalidateLocalSprites](self, "_invalidateLocalSprites");
}

- (unint64_t)fullyVisibleEdgesWithDefaultTolerance
{
  -[PXPhotosLayout topCollapsibleArea](self, "topCollapsibleArea");
  -[PXPhotosLayout bottomCollapsibleArea](self, "bottomCollapsibleArea");
  PXEdgeInsetsMake();
  return -[PXGLayout fullyVisibleEdgesWithEdgeTolerances:](self, "fullyVisibleEdgesWithEdgeTolerances:");
}

- (id)createDefaultAnimationForCurrentContext
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  -[PXPhotosLayout viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isAppearing") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    if (objc_msgSend(v3, "isEmbedded"))
    {
      v12.receiver = self;
      v12.super_class = (Class)PXPhotosLayout;
      -[PXGLayout createDefaultAnimationForCurrentContext](&v12, sel_createDefaultAnimationForCurrentContext);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      +[PXPhotosGridSettings sharedInstance](PXPhotosGridSettings, "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "defaultAnimationDuration");
      objc_msgSend(v5, "setDuration:");
    }
    else
    {
      -[PXPhotosLayout animationProvider](self, "animationProvider");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPhotosLayout presentedLayoutState](self, "presentedLayoutState");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPhotosLayout createCurrentLayoutState](self, "createCurrentLayoutState");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "createAnimationForLayout:presentedLayoutState:targetLayoutState:", self, v7, v8);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[PXPhotosLayout delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v5 && v9)
    {
      objc_msgSend(v9, "photosLayout:animationForProposedAnimation:", self, v5);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5 != v4)
      {
        -[PXGLayout removeAnimation:](self, "removeAnimation:", v5);
        if (v4)
          -[PXGLayout addAnimation:](self, "addAnimation:", v4);
      }

    }
    else
    {
      v4 = v5;
    }

  }
  return v4;
}

- (void)hideSpritesForObjectReferences:(id)a3
{
  int64_t v4;
  void *v5;
  BOOL v6;
  NSObject *v7;
  uint8_t v8[16];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXPhotosLayout;
  -[PXGLayout hideSpritesForObjectReferences:](&v9, sel_hideSpritesForObjectReferences_, a3);
  v4 = -[PXPhotosLayout pendingHideAnimationType](self, "pendingHideAnimationType");
  -[PXPhotosLayout setPendingHideAnimationType:](self, "setPendingHideAnimationType:", 0);
  +[PXPhotosGridHideAssetAnimationHelper createDecorationAnimationsForLayout:animationType:](PXPhotosGridHideAssetAnimationHelper, "createDecorationAnimationsForLayout:animationType:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
    v6 = 1;
  else
    v6 = v4 == 0;
  if (!v6)
  {
    PLUIGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "Failed to create animations for hiding/unhiding assets", v8, 2u);
    }

  }
}

- (void)adjustCopiedSprites:(id *)a3
{
  __int128 v5;
  void *v6;
  void *v7;
  double v8;
  uint64_t var0;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  unsigned int v13;
  BOOL v14;
  int v15;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var3;
  float v18;
  _OWORD v19[2];
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *var4;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)PXPhotosLayout;
  v5 = *(_OWORD *)&a3->var2;
  v19[0] = *(_OWORD *)&a3->var0;
  v19[1] = v5;
  var4 = a3->var4;
  -[PXGLayout adjustCopiedSprites:](&v21, sel_adjustCopiedSprites_, v19);
  -[PXPhotosLayout placementOverride](self, "placementOverride");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "alpha");
    var0 = a3->var0;
    if ((_DWORD)var0)
    {
      v10 = 0;
      v11 = 40 * var0;
      v12 = (char *)a3->var4 + 1;
      do
      {
        v13 = v12[v10];
        v14 = v13 > 0xD;
        v15 = (1 << v13) & 0x3DFB;
        if (!v14 && v15 != 0)
        {
          var3 = a3->var3;
          v18 = v8 * *((float *)var3 + v10);
          *((float *)var3 + v10) = v18;
        }
        v10 += 40;
      }
      while (v11 != v10);
    }
  }

}

- (UIEdgeInsets)additionalSafeAreaInsetsForSublayout:(id)a3
{
  PXPhotosSectionedLayoutHeader *v4;
  void *v5;
  double v6;
  double v7;
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
  PXPhotosSectionedLayoutHeader *topHeaderLayout;
  BOOL v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  UIEdgeInsets result;

  v4 = (PXPhotosSectionedLayoutHeader *)a3;
  -[PXPhotosLayout headerCustomizationModel](self, "headerCustomizationModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "verticalVisibilityOffset");
  v7 = v6;

  -[PXPhotosLayout viewModel](self, "viewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "floatingTitleOpacity");
  v10 = v9;

  if (v10 == 1.0)
  {
    -[PXPhotosLayout titleBackgroundSpriteHeight](self, "titleBackgroundSpriteHeight");
    v7 = v7 + v11;
  }
  else if (-[PXPhotosLayout wantsHeaderInSafeArea](self, "wantsHeaderInSafeArea"))
  {
    -[PXGLayout safeAreaInsets](self, "safeAreaInsets");
    v13 = v12;
    -[PXPhotosLayout statusBarHeight](self, "statusBarHeight");
    v7 = v7 - (v13 - v14);
  }
  v15 = *((double *)off_1E50B8020 + 1);
  v16 = *((double *)off_1E50B8020 + 2);
  v17 = *((double *)off_1E50B8020 + 3);
  topHeaderLayout = self->_topHeaderLayout;
  v19 = topHeaderLayout == v4 || topHeaderLayout == 0;
  if (!v19 && self->_topHeaderLayoutShouldFloat)
  {
    -[PXPhotosSectionedLayoutHeader contentSize](topHeaderLayout, "contentSize");
    v7 = v7 + v20;
  }

  v21 = v7;
  v22 = v15;
  v23 = v16;
  v24 = v17;
  result.right = v24;
  result.bottom = v23;
  result.left = v22;
  result.top = v21;
  return result;
}

- (id)itemPlacementControllerForItemReference:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  PXPhotosLayout *v9;
  PXPhotosLayout *v10;

  v4 = a3;
  -[PXPhotosLayout viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "containerCollection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "isEqual:", v7);

  if (v8)
    v9 = self;
  else
    v9 = -[PXGOtherItemPlacementController initWithOriginalItemPlacementController:originalItemReference:]([PXGOtherItemPlacementController alloc], "initWithOriginalItemPlacementController:originalItemReference:", self, v4);
  v10 = v9;

  return v10;
}

- (id)placementInContext:(id)a3 forItemReference:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  PXGItemPlacement *v12;
  PXGItemPlacement *v13;
  NSObject *v14;
  _QWORD v16[5];
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PXPhotosLayout viewModel](self, "viewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "containerCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "isEqual:", v10);

  if (v11)
  {
    v12 = [PXGItemPlacement alloc];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __54__PXPhotosLayout_placementInContext_forItemReference___block_invoke;
    v16[3] = &unk_1E5135CC0;
    v16[4] = self;
    v13 = -[PXGItemPlacement initWithContext:configuration:](v12, "initWithContext:configuration:", v6, v16);
  }
  else
  {
    PXAssertGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v18 = v7;
      _os_log_error_impl(&dword_1A6789000, v14, OS_LOG_TYPE_ERROR, "unexpected itemReference %@", buf, 0xCu);
    }

    v13 = 0;
  }

  return v13;
}

- (void)setPlacementOverride:(id)a3 forItemReference:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  NSObject *v13;
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PXPhotosLayout viewModel](self, "viewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "containerCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "isEqual:", v10);

  if (v11)
  {
    if (objc_msgSend(v6, "hasGeometry"))
      v12 = v6;
    else
      v12 = 0;
    -[PXPhotosLayout setPlacementOverride:](self, "setPlacementOverride:", v12);
    -[PXGLayout setDetailedPlacementOverride:forItemReference:](self, "setDetailedPlacementOverride:forItemReference:", v6, v7);
  }
  else
  {
    PXAssertGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v14 = 138412290;
      v15 = v7;
      _os_log_error_impl(&dword_1A6789000, v13, OS_LOG_TYPE_ERROR, "unexpected itemReference %@", (uint8_t *)&v14, 0xCu);
    }

  }
}

- (void)_informTopHeaderLayoutAboutDataSourceChange
{
  PXPhotosSectionedLayoutHeader *topHeaderLayout;
  void *v4;
  void *v5;
  id v6;

  if (self->_headerProviderRespondsTo.topHeaderLayoutDidChangeDataSource)
  {
    if (self->_topHeaderLayout)
    {
      -[PXPhotosLayout sectionHeaderProvider](self, "sectionHeaderProvider");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      topHeaderLayout = self->_topHeaderLayout;
      -[PXPhotosLayout viewModel](self, "viewModel");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "currentDataSource");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "topHeaderLayout:didChangeDataSource:", topHeaderLayout, v5);

    }
  }
}

- (void)_performPreUpdateInvalidationDeferredIfNeeded:(id)a3
{
  id v4;
  void *v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  v5 = v4;
  if (self->_isUpdatingSublayouts)
  {
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__PXPhotosLayout__performPreUpdateInvalidationDeferredIfNeeded___block_invoke;
    block[3] = &unk_1E5146480;
    v7 = v5;
    objc_copyWeak(&v8, &location);
    dispatch_async(MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(&v8);

    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, PXPhotosLayout *))v4 + 2))(v4, self);
  }

}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  void *v15;
  objc_class *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  objc_class *v21;
  void *v22;
  objc_class *v23;
  void *v24;
  void *v25;
  _QWORD v26[5];

  v9 = a3;
  v10 = v9;
  if ((void *)ViewModelObservationContext_204881 == a5)
  {
    if ((a4 & 1) != 0)
    {
      -[PXPhotosLayout viewModel](self, "viewModel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "wantsDynamicTitles");

      if (v12)
        -[PXPhotosLayout _invalidateDynamicHeaderTitle](self, "_invalidateDynamicHeaderTitle");
      else
        -[PXPhotosLayout _performPreUpdateInvalidationDeferredIfNeeded:](self, "_performPreUpdateInvalidationDeferredIfNeeded:", &__block_literal_global_278_204882);
      if (self->_headerProviderRespondsTo.topHeaderLayoutDidChangeDataSource && self->_topHeaderLayout)
        -[PXPhotosLayout _performPreUpdateInvalidationDeferredIfNeeded:](self, "_performPreUpdateInvalidationDeferredIfNeeded:", &__block_literal_global_279_204883);
      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __47__PXPhotosLayout_observable_didChange_context___block_invoke_3;
      v26[3] = &unk_1E5135D28;
      v26[4] = self;
      -[PXPhotosLayout _performPreUpdateInvalidationDeferredIfNeeded:](self, "_performPreUpdateInvalidationDeferredIfNeeded:", v26);
      if ((a4 & 0x4000) == 0)
      {
LABEL_12:
        if ((a4 & 4) == 0)
          goto LABEL_13;
        goto LABEL_46;
      }
    }
    else if ((a4 & 0x4000) == 0)
    {
      goto LABEL_12;
    }
    -[PXPhotosLayout _invalidateSectionedLayout](self, "_invalidateSectionedLayout");
    if ((a4 & 4) == 0)
    {
LABEL_13:
      if ((a4 & 0x100000000) == 0)
        goto LABEL_14;
      goto LABEL_47;
    }
LABEL_46:
    -[PXPhotosLayout _invalidateTopHeaderLayout](self, "_invalidateTopHeaderLayout");
    if ((a4 & 0x100000000) == 0)
    {
LABEL_14:
      if ((a4 & 0x800000000) == 0)
        goto LABEL_15;
      goto LABEL_48;
    }
LABEL_47:
    -[PXGStackLayout invalidateAdditionalSafeAreaInsets](self, "invalidateAdditionalSafeAreaInsets");
    -[PXPhotosLayout _invalidateLocalSprites](self, "_invalidateLocalSprites");
    -[PXPhotosLayout _invalidateLocalSpritesAlpha](self, "_invalidateLocalSpritesAlpha");
    if ((a4 & 0x800000000) == 0)
    {
LABEL_15:
      if ((a4 & 0x40) == 0)
        goto LABEL_16;
      goto LABEL_49;
    }
LABEL_48:
    -[PXPhotosLayout _invalidateLocalSpritesAlpha](self, "_invalidateLocalSpritesAlpha");
    if ((a4 & 0x40) == 0)
    {
LABEL_16:
      if ((a4 & 0x20000000) == 0)
        goto LABEL_18;
      goto LABEL_17;
    }
LABEL_49:
    -[PXPhotosLayout clearLastVisibleAreaAnchoringInformation](self, "clearLastVisibleAreaAnchoringInformation");
    if ((a4 & 0x20000000) == 0)
    {
LABEL_18:
      if ((a4 & 0x80002000) != 0)
        -[PXPhotosLayout _invalidateLocalSpritesAlpha](self, "_invalidateLocalSpritesAlpha");
      if ((a4 & 0x1001000) != 0)
        -[PXPhotosLayout _invalidateLocalSprites](self, "_invalidateLocalSprites");
      if ((a4 & 0x400000000) != 0)
      {
        -[PXGLayout createFenceWithType:](self, "createFenceWithType:", 3);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setTimeout:", 0.5);

        -[PXPhotosLayout _invalidateFooter](self, "_invalidateFooter");
        -[PXPhotosLayout _invalidateSectionedLayout](self, "_invalidateSectionedLayout");
        if ((a4 & 0x100000000000) == 0)
        {
LABEL_24:
          if ((a4 & 0x20000000000000) == 0)
            goto LABEL_25;
          goto LABEL_33;
        }
      }
      else if ((a4 & 0x100000000000) == 0)
      {
        goto LABEL_24;
      }
      -[PXPhotosLayout _invalidateFooter](self, "_invalidateFooter");
      -[PXPhotosLayout _invalidateSectionedLayout](self, "_invalidateSectionedLayout");
      -[PXPhotosLayout _invalidateScrollDetentAnchor](self, "_invalidateScrollDetentAnchor");
      -[PXPhotosLayout _invalidateContentBelowTitle](self, "_invalidateContentBelowTitle");
      if ((a4 & 0x20000000000000) == 0)
      {
LABEL_25:
        if ((a4 & 0x40000000000000) == 0)
          goto LABEL_60;
        goto LABEL_34;
      }
LABEL_33:
      -[PXPhotosLayout _invalidateLocalSpritesAlpha](self, "_invalidateLocalSpritesAlpha");
      if ((a4 & 0x40000000000000) == 0)
        goto LABEL_60;
      goto LABEL_34;
    }
LABEL_17:
    -[PXPhotosLayout _updateHeaderFooterAlphaAnimator](self, "_updateHeaderFooterAlphaAnimator");
    goto LABEL_18;
  }
  if ((void *)SpecManagerObservationContext_204884 == a5)
  {
    if ((a4 & 1) == 0)
      goto LABEL_60;
    -[PXPhotosLayout _invalidateHeaderAttributes](self, "_invalidateHeaderAttributes");
    -[PXPhotosLayout _invalidateHeaderMeasurements](self, "_invalidateHeaderMeasurements");
    -[PXPhotosLayout _invalidateTopHeaderLayout](self, "_invalidateTopHeaderLayout");
    -[PXPhotosLayout _invalidateGlobalHeaderLayout](self, "_invalidateGlobalHeaderLayout");
    -[PXPhotosLayout _invalidateSectionedLayout](self, "_invalidateSectionedLayout");
    -[PXPhotosLayout _invalidateSectionedLayoutPlacementOverrides](self, "_invalidateSectionedLayoutPlacementOverrides");
    -[PXPhotosLayout _invalidateGlobalBackground](self, "_invalidateGlobalBackground");
LABEL_34:
    -[PXPhotosLayout _invalidateLocalSprites](self, "_invalidateLocalSprites");
    goto LABEL_60;
  }
  if ((void *)AlternateAppearanceMixAnimatorObservationContext_204885 == a5)
  {
    if ((a4 & 2) == 0)
      goto LABEL_60;
    v14 = v9;
    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_38;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (objc_class *)objc_opt_class();
      NSStringFromClass(v18);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "px_descriptionForAssertionMessage");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosLayout.m"), 2041, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("observable"), v17, v19);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosLayout.m"), 2041, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("observable"), v17);
    }

LABEL_38:
    if ((objc_msgSend(v14, "isBeingMutated") & 1) == 0)
      -[PXPhotosLayout _invalidateLocalSpritesAlpha](self, "_invalidateLocalSpritesAlpha");
    goto LABEL_56;
  }
  if ((void *)HeaderFooterAlphaAnimatorObservationContext == a5)
  {
    if ((a4 & 2) == 0)
      goto LABEL_60;
    v14 = v9;
    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_54;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "px_descriptionForAssertionMessage");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosLayout.m"), 2048, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("observable"), v22, v24);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosLayout.m"), 2048, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("observable"), v22);
    }

LABEL_54:
    if ((objc_msgSend(v14, "isBeingMutated") & 1) == 0)
    {
      -[PXPhotosLayout _invalidateLocalSpritesAlpha](self, "_invalidateLocalSpritesAlpha");
      -[PXPhotosLayout _invalidateHeaderAnimated:](self, "_invalidateHeaderAnimated:", 0);
      -[PXPhotosLayout _invalidateFooter](self, "_invalidateFooter");
    }
LABEL_56:

    goto LABEL_60;
  }
  if ((void *)HeaderCustomizationModelObservationContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosLayout.m"), 2068, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((a4 & 1) != 0)
  {
    -[PXGStackLayout invalidateAdditionalSafeAreaInsets](self, "invalidateAdditionalSafeAreaInsets");
    -[PXPhotosLayout _invalidateHeaderOrigin](self, "_invalidateHeaderOrigin");
    if ((a4 & 2) == 0)
    {
LABEL_8:
      if ((a4 & 4) == 0)
        goto LABEL_60;
      goto LABEL_59;
    }
  }
  else if ((a4 & 2) == 0)
  {
    goto LABEL_8;
  }
  -[PXPhotosLayout _invalidateLocalSprites](self, "_invalidateLocalSprites");
  if ((a4 & 4) != 0)
  {
LABEL_59:
    -[PXPhotosLayout _invalidateHeaderAnimated:](self, "_invalidateHeaderAnimated:", 0);
    -[PXPhotosLayout _invalidateLocalSpritesAlpha](self, "_invalidateLocalSpritesAlpha");
  }
LABEL_60:

}

- (id)stringAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  __CFString *v11;
  void *v13;

  v7 = a4;
  if (a3 - 3 > 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosLayout.m"), 2078, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v8 = v7;
  -[PXPhotosLayout headerTitle](self, "headerTitle");
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (!v9)
    v9 = &stru_1E5149688;
  v11 = v9;

  return v11;
}

- (id)stringAttributesAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v11;

  v7 = a4;
  if (a3 == 4)
  {
    -[PXPhotosLayout headerTitleOverBackgroundAttributes](self, "headerTitleOverBackgroundAttributes");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3 != 3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosLayout.m"), 2088, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    -[PXPhotosLayout headerTitleOverContentAttributes](self, "headerTitleOverContentAttributes");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

  return v9;
}

- (int64_t)verticalAlignmentForStringAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return 2;
}

- (UIEdgeInsets)paddingForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  UIEdgeInsets result;

  v4 = 6.0;
  v5 = 0.0;
  v6 = 6.0;
  v7 = 0.0;
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v4;
  return result;
}

- (id)attributedStringForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;

  v7 = a4;
  -[PXPhotosLayout headerTitle](self, "headerTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosLayout headerSubtitle](self, "headerSubtitle");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = 0;
  if (v8 && v9)
  {
    if (a3 == 3)
    {
      -[PXPhotosLayout headerTitleOverContentAttributes](self, "headerTitleOverContentAttributes");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPhotosLayout headerSubtitleOverContentAttributes](self, "headerSubtitleOverContentAttributes");
      v13 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a3 != 4)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosLayout.m"), 2120, CFSTR("Code which should be unreachable has been reached"));

        abort();
      }
      -[PXPhotosLayout headerTitleOverBackgroundAttributes](self, "headerTitleOverBackgroundAttributes");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXPhotosLayout headerSubtitleOverBackgroundAttributes](self, "headerSubtitleOverBackgroundAttributes");
      v13 = objc_claimAutoreleasedReturnValue();
    }
    v14 = (void *)v13;
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v8, v12);
    v15 = objc_alloc(MEMORY[0x1E0CB3498]);
    -[PXPhotosLayout headerSubtitle](self, "headerSubtitle");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(CFSTR("\n"), "stringByAppendingString:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v15, "initWithString:attributes:", v17, v14);

    objc_msgSend(v11, "appendAttributedString:", v18);
  }

  return v11;
}

- (id)imageConfigurationAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v13;

  v7 = a4;
  if (-[PXPhotosLayout _titleBackgroundSpriteIndex](self, "_titleBackgroundSpriteIndex") == a3)
  {
    -[PXPhotosLayout specManager](self, "specManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "spec");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "backgroundGradientImageConfiguration");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a3 != 2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosLayout.m"), 2138, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    -[PXPhotosLayout specManager](self, "specManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "spec");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "behindContentBackgroundGradientImageConfiguration");
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)v10;

  return v11;
}

- (id)axSpriteIndexes
{
  void *v2;

  if (self->_managesHeaderSprites && -[PXGLayout localNumberOfSprites](self, "localNumberOfSprites"))
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 3);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSet");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7;
  void *v8;
  unint64_t v9;
  void *v11;
  void *v12;
  SEL v13;
  PXPhotosLayout *v14;
  uint64_t v15;

  v7 = a4;
  if (-[PXPhotosLayout _titleBackgroundSpriteIndex](self, "_titleBackgroundSpriteIndex") != a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = a2;
    v14 = self;
    v15 = 2176;
    goto LABEL_10;
  }
  -[PXPhotosLayout viewModel](self, "viewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "navBarStyle");

  if (v9 > 7)
    goto LABEL_6;
  if (((1 << v9) & 0x30) == 0 && ((1 << v9) & 0x44) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    v13 = a2;
    v14 = self;
    v15 = 2163;
LABEL_10:
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", v13, v14, CFSTR("PXPhotosLayout.m"), v15, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  objc_opt_class();
  self = (PXPhotosLayout *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return (Class)self;
}

- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PXTitleLegibilityDimmingViewConfiguration *v14;
  PXTitleLegibilityDimmingViewConfiguration *v15;
  void *v17;
  void *v18;
  SEL v19;
  PXPhotosLayout *v20;
  uint64_t v21;

  v7 = a4;
  if (-[PXPhotosLayout _titleBackgroundSpriteIndex](self, "_titleBackgroundSpriteIndex") != a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    v19 = a2;
    v20 = self;
    v21 = 2204;
    goto LABEL_12;
  }
  -[PXPhotosLayout viewModel](self, "viewModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "navBarStyle");

  if (v9 > 7)
  {
    v15 = 0;
    goto LABEL_8;
  }
  if (((1 << v9) & 0x30) != 0)
  {
    -[PXPhotosLayout specManager](self, "specManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "spec");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "visualEffectViewGroupName");
    v14 = (PXTitleLegibilityDimmingViewConfiguration *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (((1 << v9) & 0x44) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    v19 = a2;
    v20 = self;
    v21 = 2188;
LABEL_12:
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", v19, v20, CFSTR("PXPhotosLayout.m"), v21, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  -[PXPhotosLayout specManager](self, "specManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "spec");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "backgroundGradientImageConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "imageName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PXTitleLegibilityDimmingViewConfiguration initWithGradientImageName:]([PXTitleLegibilityDimmingViewConfiguration alloc], "initWithGradientImageName:", v13);
LABEL_7:
  v15 = v14;

LABEL_8:
  return v15;
}

- (id)colorAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;

  v7 = a4;
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosLayout.m"), 2214, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v8 = v7;
  -[PXPhotosLayout specManager](self, "specManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "spec");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contentBackgroundColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)stackLayout:(id)a3 shouldAlignSublayoutToVisibleTopEdge:(id)a4
{
  PXPhotosSectionedLayoutHeader *topHeaderLayout;
  BOOL v5;

  topHeaderLayout = self->_topHeaderLayout;
  if (topHeaderLayout)
    v5 = topHeaderLayout == a4;
  else
    v5 = 0;
  return v5 && self->_topHeaderLayoutShouldFloat;
}

- (BOOL)stackLayout:(id)a3 shouldAlignSublayoutToVisibleBottomEdge:(id)a4
{
  PXGSingleViewLayout *footerLayout;

  footerLayout = self->_footerLayout;
  return footerLayout && footerLayout == a4;
}

- (PXPhotosViewModel)viewModel
{
  return self->_viewModel;
}

- (PXPhotosLayoutSpecManager)specManager
{
  return self->_specManager;
}

- (PXPhotosLayoutDelegate)delegate
{
  return (PXPhotosLayoutDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)headerView
{
  return self->_headerView;
}

- (UIView)footerView
{
  return self->_footerView;
}

- (PXPhotosSectionHeaderLayoutProvider)sectionHeaderProvider
{
  return self->_sectionHeaderProvider;
}

- (PXPhotosGlobalHeaderLayoutProvider)globalHeaderProvider
{
  return self->_globalHeaderProvider;
}

- (PXPhotosSectionBodyLayoutProvider)sectionBodyProvider
{
  return self->_sectionBodyProvider;
}

- (double)statusBarHeight
{
  return self->_statusBarHeight;
}

- (BOOL)wantsHeaderInSafeArea
{
  return self->_wantsHeaderInSafeArea;
}

- (BOOL)alignsHeaderTitleWithLayoutMargins
{
  return self->_alignsHeaderTitleWithLayoutMargins;
}

- (int64_t)pendingHideAnimationType
{
  return self->_pendingHideAnimationType;
}

- (void)setPendingHideAnimationType:(int64_t)a3
{
  self->_pendingHideAnimationType = a3;
}

- (PXPhotosLayoutAnimationProvider)animationProvider
{
  return self->_animationProvider;
}

- (PXPhotosLayoutState)presentedLayoutState
{
  return self->_presentedLayoutState;
}

- (void)setPresentedLayoutState:(id)a3
{
  objc_storeStrong((id *)&self->_presentedLayoutState, a3);
}

- (NSString)headerTitle
{
  return self->_headerTitle;
}

- (NSString)headerSubtitle
{
  return self->_headerSubtitle;
}

- (NSDictionary)headerTitleOverContentAttributes
{
  return self->_headerTitleOverContentAttributes;
}

- (NSDictionary)headerTitleOverBackgroundAttributes
{
  return self->_headerTitleOverBackgroundAttributes;
}

- (NSDictionary)headerSubtitleOverBackgroundAttributes
{
  return self->_headerSubtitleOverBackgroundAttributes;
}

- (NSDictionary)headerSubtitleOverContentAttributes
{
  return self->_headerSubtitleOverContentAttributes;
}

- (int64_t)headerTitleDrawingOptions
{
  return self->_headerTitleDrawingOptions;
}

- (CGPoint)headerTitleOrigin
{
  double x;
  double y;
  CGPoint result;

  x = self->_headerTitleOrigin.x;
  y = self->_headerTitleOrigin.y;
  result.y = y;
  result.x = x;
  return result;
}

- (CGSize)headerTitleSize
{
  double width;
  double height;
  CGSize result;

  width = self->_headerTitleSize.width;
  height = self->_headerTitleSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)headerTitleBaselineToBottom
{
  return self->_headerTitleBaselineToBottom;
}

- (double)titleBackgroundSpriteHeight
{
  return self->_titleBackgroundSpriteHeight;
}

- (double)titleBackgroundGradientAdditionalCoverage
{
  return self->_titleBackgroundGradientAdditionalCoverage;
}

- (PXGItemPlacement)placementOverride
{
  return self->_placementOverride;
}

- (NSDateIntervalFormatter)dateIntervalFormatter
{
  return self->_dateIntervalFormatter;
}

- (PXPhotosHeaderCustomizationModel)headerCustomizationModel
{
  return self->_headerCustomizationModel;
}

- (PXPhotosOverlayController)overlayController
{
  return self->_overlayController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayController, 0);
  objc_storeStrong((id *)&self->_headerCustomizationModel, 0);
  objc_storeStrong((id *)&self->_dateIntervalFormatter, 0);
  objc_storeStrong((id *)&self->_placementOverride, 0);
  objc_storeStrong((id *)&self->_headerSubtitleOverContentAttributes, 0);
  objc_storeStrong((id *)&self->_headerSubtitleOverBackgroundAttributes, 0);
  objc_storeStrong((id *)&self->_headerTitleOverBackgroundAttributes, 0);
  objc_storeStrong((id *)&self->_headerTitleOverContentAttributes, 0);
  objc_storeStrong((id *)&self->_headerSubtitle, 0);
  objc_storeStrong((id *)&self->_headerTitle, 0);
  objc_storeStrong((id *)&self->_presentedLayoutState, 0);
  objc_storeStrong((id *)&self->_animationProvider, 0);
  objc_storeStrong((id *)&self->_sectionBodyProvider, 0);
  objc_storeStrong((id *)&self->_globalHeaderProvider, 0);
  objc_storeStrong((id *)&self->_sectionHeaderProvider, 0);
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_specManager, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_dynamicLocationName, 0);
  objc_storeStrong((id *)&self->_dynamicDateInterval, 0);
  objc_storeStrong((id *)&self->_footerLayout, 0);
  objc_storeStrong((id *)&self->_headerLayout, 0);
  objc_storeStrong((id *)&self->_topHeaderLayout, 0);
  objc_storeStrong((id *)&self->_globalHeaderLayout, 0);
  objc_storeStrong((id *)&self->_headerFooterAlphaAnimator, 0);
  objc_storeStrong((id *)&self->_sectionedLayout, 0);
  objc_storeStrong((id *)&self->_alternateAppearanceMixAnimator, 0);
}

uint64_t __47__PXPhotosLayout_observable_didChange_context___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateScrollDetentAnchor");
}

uint64_t __47__PXPhotosLayout_observable_didChange_context___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_informTopHeaderLayoutAboutDataSourceChange");
}

uint64_t __47__PXPhotosLayout_observable_didChange_context___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_invalidateHeaderTitle");
}

void __64__PXPhotosLayout__performPreUpdateInvalidationDeferredIfNeeded___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;

  v1 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, WeakRetained);

}

void __54__PXPhotosLayout_placementInContext_forItemReference___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v3, "originalPlacementRect");
  objc_msgSend(v8, "setRect:velocity:inLayout:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v8, "setAlpha:", 1.0);
  objc_msgSend(v8, "setChromeAlpha:", 1.0);
  LODWORD(v4) = *(_DWORD *)off_1E50B8248;
  LODWORD(v5) = *((_DWORD *)off_1E50B8248 + 1);
  LODWORD(v6) = *((_DWORD *)off_1E50B8248 + 2);
  LODWORD(v7) = *((_DWORD *)off_1E50B8248 + 3);
  objc_msgSend(v8, "setCornerRadius:", v4, v5, v6, v7);

}

float __42__PXPhotosLayout__updateLocalSpritesAlpha__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  float v4;
  float result;

  v4 = *(double *)(a1 + 32);
  *(float *)a4 = v4;
  result = *(float *)(a1 + 44);
  *(float *)(a4 + 160 * *(unsigned int *)(a1 + 40)) = result;
  *(_DWORD *)(a4 + 320) = 0;
  *(_DWORD *)(a4 + 480) = 0;
  *(_DWORD *)(a4 + 640) = 1065353216;
  return result;
}

float __42__PXPhotosLayout__updateLocalSpritesAlpha__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  float result;

  result = *(float *)(a1 + 36);
  *(float *)(a4 + 160 * *(unsigned int *)(a1 + 32)) = result;
  return result;
}

float __42__PXPhotosLayout__updateLocalSpritesAlpha__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  double v4;
  float v5;
  double v6;
  double v7;
  double v8;
  float result;

  v4 = *(double *)(a1 + 40);
  v5 = *(double *)(a1 + 32);
  *(float *)a4 = v5;
  v6 = v4 * *(double *)(a1 + 48);
  *(float *)&v4 = v6 * *(double *)(a1 + 56);
  *(_DWORD *)(a4 + 160 * *(unsigned int *)(a1 + 96)) = LODWORD(v4);
  v7 = *(double *)(a1 + 72);
  *(float *)&v6 = v6 * *(double *)(a1 + 64);
  *(_DWORD *)(a4 + 320) = LODWORD(v6);
  v8 = *(double *)(a1 + 88);
  *(float *)&v6 = v7 * *(double *)(a1 + 80);
  *(_DWORD *)(a4 + 480) = LODWORD(v6);
  result = v7 * v8;
  *(float *)(a4 + 640) = result;
  return result;
}

__n128 __37__PXPhotosLayout__updateLocalSprites__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __n128 result;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(_OWORD *)(a3 + 64);
  v6 = *(_OWORD *)(a3 + 16);
  v5 = *(_OWORD *)(a3 + 32);
  *(_OWORD *)(v3 + 80) = *(_OWORD *)(a3 + 48);
  *(_OWORD *)(v3 + 96) = v4;
  *(_OWORD *)(v3 + 48) = v6;
  *(_OWORD *)(v3 + 64) = v5;
  v8 = *(_OWORD *)(a3 + 96);
  v7 = *(_OWORD *)(a3 + 112);
  v9 = *(_OWORD *)(a3 + 80);
  *(_QWORD *)(v3 + 160) = *(_QWORD *)(a3 + 128);
  *(_OWORD *)(v3 + 128) = v8;
  *(_OWORD *)(v3 + 144) = v7;
  *(_OWORD *)(v3 + 112) = v9;
  result = *(__n128 *)a3;
  *(_OWORD *)(v3 + 32) = *(_OWORD *)a3;
  return result;
}

void __37__PXPhotosLayout__updateLocalSprites__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  char v9;
  char v10;
  _BYTE *v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat MidX;
  CGFloat MidY;
  CGFloat Height;
  float64x2_t v19;
  unsigned int v25;
  float32x2_t *v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  float64x2_t v34;
  char v35;
  uint64_t v36;
  double v37;
  double v38;
  float32x2_t *v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  float64x2_t v47;
  double v48;
  double v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  float64x2_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  void *v65;
  CGFloat v66;
  CGFloat v67;
  CGFloat v68;
  CGFloat Width;
  char v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;

  switch(objc_msgSend(*(id *)(a1 + 32), "navBarStyle"))
  {
    case 0:
    case 7:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v65, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), CFSTR("PXPhotosLayout.m"), 1578, CFSTR("Code which should be unreachable has been reached"));

      abort();
    case 1:
    case 3:
      v9 = 0;
      v10 = 1;
      break;
    case 2:
    case 6:
      v10 = 1;
      v9 = 1;
      break;
    case 4:
    case 5:
      v9 = 1;
      v10 = 10;
      break;
    default:
      v10 = 0;
      v9 = 0;
      break;
  }
  v11 = *(_BYTE **)(a1 + 40);
  if (v11[1152])
  {
    v12 = *(double *)(a1 + 64);
    v13 = *(double *)(a1 + 72);
    v14 = *(double *)(a1 + 80);
    v15 = *(double *)(a1 + 88);
    v71.origin.x = v12;
    v71.origin.y = v13;
    v71.size.width = v14;
    v71.size.height = v15;
    MidX = CGRectGetMidX(v71);
    v72.origin.x = v12;
    v72.origin.y = v13;
    v72.size.width = v14;
    v72.size.height = v15;
    MidY = CGRectGetMidY(v72);
    v73.origin.x = v12;
    v73.origin.y = v13;
    v73.size.width = v14;
    v73.size.height = v15;
    Width = CGRectGetWidth(v73);
    v74.origin.x = v12;
    v74.origin.y = v13;
    v74.size.width = v14;
    v74.size.height = v15;
    Height = CGRectGetHeight(v74);
    v19.f64[0] = Width;
    v19.f64[1] = Height;
    *(CGFloat *)a3 = MidX;
    *(CGFloat *)(a3 + 8) = MidY;
    *(_QWORD *)(a3 + 16) = 0x4059000000000000;
    *(float32x2_t *)(a3 + 24) = vcvt_f32_f64(v19);
    *(_BYTE *)(a5 + 1) = 5;
    __asm { FMOV            V0.2S, #1.0 }
    *(_QWORD *)(a5 + 8) = _D0;
    *(_WORD *)(a5 + 32) = *(_WORD *)(*(_QWORD *)(a1 + 40) + 1140);
    v11 = *(_BYTE **)(a1 + 40);
    if (v11[1152])
      goto LABEL_9;
  }
  if (v11[1153])
  {
LABEL_9:
    v70 = v9;
    v25 = objc_msgSend(v11, "_titleBackgroundSpriteIndex");
    v26 = (float32x2_t *)(a3 + 32 * v25);
    v27 = *(double *)(a1 + 96);
    v28 = *(double *)(a1 + 104);
    v29 = *(double *)(a1 + 112);
    v30 = *(double *)(a1 + 120);
    v75.origin.x = v27;
    v75.origin.y = v28;
    v75.size.width = v29;
    v75.size.height = v30;
    v31 = CGRectGetMidX(v75);
    v76.origin.x = v27;
    v76.origin.y = v28;
    v76.size.width = v29;
    v76.size.height = v30;
    v32 = CGRectGetMidY(v76);
    v77.origin.x = v27;
    v77.origin.y = v28;
    v77.size.width = v29;
    v77.size.height = v30;
    v66 = CGRectGetWidth(v77);
    v78.origin.x = v27;
    v78.origin.y = v28;
    v78.size.width = v29;
    v78.size.height = v30;
    v33 = CGRectGetHeight(v78);
    v34.f64[0] = v66;
    v34.f64[1] = v33;
    *(CGFloat *)v26 = v31;
    *(CGFloat *)&v26[1] = v32;
    v26[2] = (float32x2_t)0xBFF0000000000000;
    v26[3] = vcvt_f32_f64(v34);
    v35 = v10;
    v36 = a4 + 160 * v25;
    *(_WORD *)(v36 + 68) = *(_WORD *)(*(_QWORD *)(a1 + 40) + 1142);
    objc_msgSend(*(id *)(a1 + 48), "backgroundGradientCornerRadius");
    *(float *)&v27 = v37;
    objc_msgSend(*(id *)(a1 + 48), "backgroundGradientCornerRadius");
    *(float *)&v38 = v38;
    *(_DWORD *)(v36 + 36) = LODWORD(v27);
    *(_DWORD *)(v36 + 40) = LODWORD(v38);
    *(_DWORD *)(v36 + 44) = 0;
    *(_DWORD *)(v36 + 48) = 0;
    v39 = (float32x2_t *)(a5 + 40 * v25);
    v39->i8[1] = v35;
    v39[1] = vmul_n_f32(v26[3], *(float *)(a1 + 160));
    v39->i8[0] = v70;
    if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 1152))
    {
      v40 = *(double *)(a1 + 96);
      v41 = *(double *)(a1 + 104);
      v42 = *(double *)(a1 + 112);
      v43 = *(double *)(a1 + 120);
      v79.origin.x = v40;
      v79.origin.y = v41;
      v79.size.width = v42;
      v79.size.height = v43;
      v44 = CGRectGetMidX(v79);
      v80.origin.x = v40;
      v80.origin.y = v41;
      v80.size.width = v42;
      v80.size.height = v43;
      v45 = CGRectGetMidY(v80);
      v81.origin.x = v40;
      v81.origin.y = v41;
      v81.size.width = v42;
      v81.size.height = v43;
      v67 = CGRectGetWidth(v81);
      v82.origin.x = v40;
      v82.origin.y = v41;
      v82.size.width = v42;
      v82.size.height = v43;
      v46 = CGRectGetHeight(v82);
      v47.f64[0] = v67;
      v47.f64[1] = v46;
      *(CGFloat *)(a3 + 64) = v44;
      *(CGFloat *)(a3 + 72) = v45;
      *(_QWORD *)(a3 + 80) = 0x4069000000000000;
      *(float32x2_t *)(a3 + 88) = vcvt_f32_f64(v47);
      *(_WORD *)(a4 + 388) = *(_WORD *)(*(_QWORD *)(a1 + 40) + 1142);
      objc_msgSend(*(id *)(a1 + 48), "backgroundGradientCornerRadius");
      *(float *)&v40 = v48;
      objc_msgSend(*(id *)(a1 + 48), "backgroundGradientCornerRadius");
      *(float *)&v49 = v49;
      *(_DWORD *)(a4 + 356) = LODWORD(v40);
      *(_DWORD *)(a4 + 360) = LODWORD(v49);
      *(_QWORD *)(a4 + 364) = 0;
      *(_BYTE *)(a5 + 81) = 1;
      *(float32x2_t *)(a5 + 88) = vmul_n_f32(*(float32x2_t *)(a3 + 88), *(float *)(a1 + 160));
      *(_BYTE *)(a5 + 80) = 0;
      if (*(_BYTE *)(*(_QWORD *)(a1 + 40) + 1152))
      {
        v50 = *(double *)(a1 + 128);
        v51 = *(double *)(a1 + 136);
        v52 = *(double *)(a1 + 144);
        v53 = *(double *)(a1 + 152);
        v83.origin.x = v50;
        v83.origin.y = v51;
        v83.size.width = v52;
        v83.size.height = v53;
        v54 = CGRectGetMidX(v83);
        v84.origin.x = v50;
        v84.origin.y = v51;
        v84.size.width = v52;
        v84.size.height = v53;
        v55 = CGRectGetMidY(v84);
        v85.origin.x = v50;
        v85.origin.y = v51;
        v85.size.width = v52;
        v85.size.height = v53;
        v68 = CGRectGetWidth(v85);
        v86.origin.x = v50;
        v86.origin.y = v51;
        v86.size.width = v52;
        v86.size.height = v53;
        v56 = CGRectGetHeight(v86);
        v57.f64[0] = v68;
        v57.f64[1] = v56;
        *(CGFloat *)(a3 + 96) = v54;
        *(CGFloat *)(a3 + 104) = v55;
        *(_QWORD *)(a3 + 112) = 0xBFF19999A0000000;
        *(float32x2_t *)(a3 + 120) = vcvt_f32_f64(v57);
        *(_BYTE *)(a4 + 550) = 10;
        *(_BYTE *)(a5 + 121) = 3;
        *(float32x2_t *)(a5 + 128) = vmul_n_f32(*(float32x2_t *)(a3 + 120), *(float *)(a1 + 160));
        *(_WORD *)(a5 + 152) = *(_WORD *)(*(_QWORD *)(a1 + 40) + 1138);
        *(_BYTE *)(a5 + 120) = v70;
        v58 = *(_OWORD *)(a3 + 112);
        *(_OWORD *)(a3 + 128) = *(_OWORD *)(a3 + 96);
        *(_OWORD *)(a3 + 144) = v58;
        v59 = *(_OWORD *)(a4 + 560);
        *(_OWORD *)(a4 + 704) = *(_OWORD *)(a4 + 544);
        *(_OWORD *)(a4 + 720) = v59;
        v60 = *(_OWORD *)(a4 + 528);
        *(_OWORD *)(a4 + 672) = *(_OWORD *)(a4 + 512);
        *(_OWORD *)(a4 + 688) = v60;
        v61 = *(_OWORD *)(a4 + 624);
        *(_OWORD *)(a4 + 768) = *(_OWORD *)(a4 + 608);
        *(_OWORD *)(a4 + 784) = v61;
        v62 = *(_OWORD *)(a4 + 592);
        *(_OWORD *)(a4 + 736) = *(_OWORD *)(a4 + 576);
        *(_OWORD *)(a4 + 752) = v62;
        v63 = *(_OWORD *)(a4 + 496);
        *(_OWORD *)(a4 + 640) = *(_OWORD *)(a4 + 480);
        *(_OWORD *)(a4 + 656) = v63;
        v64 = *(_OWORD *)(a5 + 136);
        *(_OWORD *)(a5 + 160) = *(_OWORD *)(a5 + 120);
        *(_OWORD *)(a5 + 176) = v64;
        *(_QWORD *)(a5 + 192) = *(_QWORD *)(a5 + 152);
      }
    }
  }
}

uint64_t __37__PXPhotosLayout__updateLocalSprites__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setValue:", *(double *)(a1 + 32));
}

uint64_t __37__PXPhotosLayout__updateLocalSprites__block_invoke_4(uint64_t result)
{
  BOOL v1;

  v1 = *(double *)(result + 40) > 0.0 && *(_DWORD *)(result + 48) != 0;
  *(_BYTE *)(*(_QWORD *)(result + 32) + 1154) = v1;
  return result;
}

uint64_t __42__PXPhotosLayout__updateContentBelowTitle__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setContentBelowTitle:", *(unsigned __int8 *)(a1 + 32));
}

void __42__PXPhotosLayout__updateLocalSpritesCount__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _OWORD *v16;

  v3 = (HIDWORD(a2) + a2);
  if (v3 > a2)
  {
    v4 = v3 - a2;
    v5 = *((_OWORD *)off_1E50B83A0 + 6);
    v6 = *((_OWORD *)off_1E50B83A0 + 7);
    v7 = 160 * a2;
    v8 = *((_OWORD *)off_1E50B83A0 + 8);
    v9 = *((_OWORD *)off_1E50B83A0 + 9);
    v10 = *((_OWORD *)off_1E50B83A0 + 2);
    v11 = *((_OWORD *)off_1E50B83A0 + 3);
    v12 = *((_OWORD *)off_1E50B83A0 + 4);
    v13 = *((_OWORD *)off_1E50B83A0 + 5);
    v14 = *(_OWORD *)off_1E50B83A0;
    v15 = *((_OWORD *)off_1E50B83A0 + 1);
    do
    {
      v16 = (_OWORD *)(*(_QWORD *)(a3 + 24) + v7);
      v16[6] = v5;
      v16[7] = v6;
      v16[8] = v8;
      v16[9] = v9;
      v16[2] = v10;
      v16[3] = v11;
      v16[4] = v12;
      v16[5] = v13;
      *v16 = v14;
      v16[1] = v15;
      v7 += 160;
      --v4;
    }
    while (v4);
  }
}

__n128 __58__PXPhotosLayout__updateSectionedLayoutPlacementOverrides__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __n128 result;
  __int128 v4;
  __int128 v5;

  result = *(__n128 *)(a1 + 32);
  v4 = *(_OWORD *)(a1 + 48);
  v5 = *(_OWORD *)(a1 + 64);
  *(_QWORD *)(a3 + 120) = *(_QWORD *)(a1 + 80);
  *(_OWORD *)(a3 + 104) = v5;
  *(_OWORD *)(a3 + 88) = v4;
  *(__n128 *)(a3 + 72) = result;
  return result;
}

uint64_t __50__PXPhotosLayout__updateHeaderFooterAlphaAnimator__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setValue:", *(double *)(a1 + 32));
}

void __43__PXPhotosLayout__updateHeaderMeasurements__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v8 = a2;
  objc_msgSend(v3, "titleBackgroundSpriteHeight");
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 32), "safeAreaInsets");
  v7 = v5 - v6;
  if (v7 < 0.0)
    v7 = 0.0;
  objc_msgSend(v8, "setHeaderTitleTopInset:", v7);

}

void __36__PXPhotosLayout__updateHeaderTitle__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setHeaderTitle:", v3);
  objc_msgSend(v4, "setHeaderSubtitle:", *(_QWORD *)(a1 + 40));

}

uint64_t __65__PXPhotosLayout_enumerateScrollablePagesWithOptions_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, double a5, double a6, double a7, double a8)
{
  uint64_t v11;
  CGRect v13;

  v11 = *(_QWORD *)(a1 + 32);
  v13 = CGRectOffset(*(CGRect *)&a5, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 48));
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, CGPoint, __n128, CGSize, __n128))(v11 + 16))(v11, a2, a3, a4, v13.origin, *(__n128 *)&v13.origin.y, v13.size, *(__n128 *)&v13.size.height);
}

uint64_t __54__PXPhotosLayout_locationNamesFutureForContentInRect___block_invoke()
{
  return 0;
}

uint64_t __58__PXPhotosLayout_dateIntervalFutureForContentInRect_type___block_invoke()
{
  return 0;
}

uint64_t __32__PXPhotosLayout_setFooterView___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_invalidateFooter");
}

@end
