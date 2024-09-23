@implementation PXPhotosSectionedLayout

- (PXPhotosSectionedLayout)initWithViewModel:(id)a3
{
  id v5;
  PXPhotosSectionedLayout *v6;
  PXPhotosSectionedLayout *v7;
  CGSize v8;
  int v9;
  int v10;
  uint64_t v11;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PXPhotosSectionedLayout;
  v6 = -[PXGStackLayout init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    v8 = *(CGSize *)(MEMORY[0x1E0C9D5E0] + 16);
    v6->_maskRect.origin = (CGPoint)*MEMORY[0x1E0C9D5E0];
    v6->_maskRect.size = v8;
    v6->_captureSpriteIndex = -1;
    v9 = objc_msgSend(v5, "wantsSingleRowScrollingLayout");
    if (objc_msgSend(v5, "scrollingBehavior") == 1)
      v10 = 1;
    else
      v10 = v9;
    if (v10)
      v11 = 2;
    else
      v11 = 1;
    -[PXGStackLayout setAxis:](v7, "setAxis:", v11);
    objc_storeStrong((id *)&v7->_viewModel, a3);
    objc_msgSend(v5, "registerChangeObserver:context:", v7, PhotosViewModelObserverContext);
    -[PXPhotosSectionedLayout _invalidateSublayoutsDataSource](v7, "_invalidateSublayoutsDataSource");
    -[PXPhotosSectionedLayout _invalidateSublayoutsSpec](v7, "_invalidateSublayoutsSpec");
    -[PXPhotosSectionedLayout _invalidateSublayoutsConfiguration](v7, "_invalidateSublayoutsConfiguration");
    -[PXGLayout setContentSource:](v7, "setContentSource:", v7);
    -[PXGStackLayout setSublayoutFaultingDelegate:](v7, "setSublayoutFaultingDelegate:", v7);
  }

  return v7;
}

- (PXPhotosSectionedLayout)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosSectionedLayout.m"), 142, CFSTR("%s is not available as initializer"), "-[PXPhotosSectionedLayout init]");

  abort();
}

- (PXAssetsDataSource)assetsDataSource
{
  return self->_assetsDataSource;
}

- (void)setSpec:(id)a3
{
  PXPhotosLayoutSpec *v5;

  v5 = (PXPhotosLayoutSpec *)a3;
  if (self->_spec != v5)
  {
    objc_storeStrong((id *)&self->_spec, a3);
    -[PXPhotosSectionedLayout _invalidateSublayoutsSpec](self, "_invalidateSublayoutsSpec");
    -[PXPhotosSectionedLayout _invalidateSectionsBlur](self, "_invalidateSectionsBlur");
    -[PXPhotosSectionedLayout _invalidateSublayoutsConfiguration](self, "_invalidateSublayoutsConfiguration");
    -[PXPhotosLayoutSpec interSectionSpacing](v5, "interSectionSpacing");
    -[PXPhotosSectionedLayout setInterSectionSpacing:](self, "setInterSectionSpacing:");
  }

}

- (void)setInterSectionSpacing:(double)a3
{
  if (self->_interSectionSpacing != a3)
  {
    self->_interSectionSpacing = a3;
    -[PXPhotosSectionedLayout _invalidateSublayoutsConfiguration](self, "_invalidateSublayoutsConfiguration");
  }
}

- (void)setHeaderLayoutProvider:(id)a3
{
  PXPhotosSectionHeaderLayoutProvider *v5;
  PXPhotosSectionHeaderLayoutProvider *headerLayoutProvider;
  $8070B82EB467468089678FADA436E38B *p_headerProviderRespondsTo;
  PXPhotosSectionHeaderLayoutProvider *v8;

  v5 = (PXPhotosSectionHeaderLayoutProvider *)a3;
  headerLayoutProvider = self->_headerLayoutProvider;
  if (headerLayoutProvider != v5)
  {
    v8 = v5;
    p_headerProviderRespondsTo = &self->_headerProviderRespondsTo;
    if (self->_headerProviderRespondsTo.invalidationDelegate)
      -[PXPhotosSectionHeaderLayoutProvider setInvalidationDelegate:](headerLayoutProvider, "setInvalidationDelegate:", 0);
    objc_storeStrong((id *)&self->_headerLayoutProvider, a3);
    p_headerProviderRespondsTo->invalidationDelegate = objc_opt_respondsToSelector() & 1;
    self->_headerProviderRespondsTo.floatingHeaderSnapshot = objc_opt_respondsToSelector() & 1;
    self->_headerProviderRespondsTo.configureSectionHeaderLayout = objc_opt_respondsToSelector() & 1;
    if (p_headerProviderRespondsTo->invalidationDelegate)
      -[PXPhotosSectionHeaderLayoutProvider setInvalidationDelegate:](self->_headerLayoutProvider, "setInvalidationDelegate:", self);
    self->_shouldRecreateHeaderLayouts = 1;
    -[PXPhotosSectionedLayout _invalidateSublayoutsConfiguration](self, "_invalidateSublayoutsConfiguration");
    v5 = v8;
  }

}

- (void)setBodyLayoutProvider:(id)a3
{
  PXPhotosSectionBodyLayoutProvider *v5;
  PXPhotosSectionBodyLayoutProvider *bodyLayoutProvider;
  PXPhotosSectionBodyLayoutProvider *v7;

  v5 = (PXPhotosSectionBodyLayoutProvider *)a3;
  bodyLayoutProvider = self->_bodyLayoutProvider;
  if (bodyLayoutProvider != v5)
  {
    v7 = v5;
    -[PXPhotosSectionBodyLayoutProvider setInvalidationDelegate:](bodyLayoutProvider, "setInvalidationDelegate:", 0);
    objc_storeStrong((id *)&self->_bodyLayoutProvider, a3);
    -[PXPhotosSectionBodyLayoutProvider setInvalidationDelegate:](self->_bodyLayoutProvider, "setInvalidationDelegate:", self);
    self->_shouldRecreateBodyLayouts = 1;
    -[PXPhotosSectionedLayout _invalidateSublayoutsConfiguration](self, "_invalidateSublayoutsConfiguration");
    v5 = v7;
  }

}

- (void)setHorizontalScrollingHintFactor:(double)a3
{
  if ((PXFloatApproximatelyEqualToFloat() & 1) == 0)
  {
    self->_horizontalScrollingHintFactor = a3;
    -[PXPhotosSectionedLayout _invalidateSublayoutTransforms](self, "_invalidateSublayoutTransforms");
    -[PXPhotosSectionedLayout _invalidatePreferredCornerRadius](self, "_invalidatePreferredCornerRadius");
  }
}

- (id)dateIntervalFutureForContentInRect:(CGRect)a3 type:(unint64_t)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  id (*v19)(uint64_t);
  void *v20;
  id v21;
  _QWORD v22[5];
  id v23;
  double v24;
  double v25;
  double v26;
  double v27;
  unint64_t v28;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __67__PXPhotosSectionedLayout_dateIntervalFutureForContentInRect_type___block_invoke;
  v22[3] = &unk_1E513B7B0;
  v22[4] = self;
  v24 = x;
  v25 = y;
  v26 = width;
  v27 = height;
  v28 = a4;
  v12 = v10;
  v23 = v12;
  -[PXPhotosSectionedLayout enumerateAssetsSectionSublayoutsInRect:usingBlock:](self, "enumerateAssetsSectionSublayoutsInRect:usingBlock:", v22, x, y, width, height);
  v17 = v11;
  v18 = 3221225472;
  v19 = __67__PXPhotosSectionedLayout_dateIntervalFutureForContentInRect_type___block_invoke_2;
  v20 = &unk_1E513B7D8;
  v21 = v12;
  v13 = v12;
  v14 = _Block_copy(&v17);
  v15 = (void *)objc_msgSend(v14, "copy", v17, v18, v19, v20);

  return v15;
}

- (id)locationNamesFutureForContentInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD aBlock[4];
  id v16;
  _QWORD v17[5];
  id v18;
  double v19;
  double v20;
  double v21;
  double v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __63__PXPhotosSectionedLayout_locationNamesFutureForContentInRect___block_invoke;
  v17[3] = &unk_1E513B800;
  v17[4] = self;
  v19 = x;
  v20 = y;
  v21 = width;
  v22 = height;
  v10 = v8;
  v18 = v10;
  -[PXPhotosSectionedLayout enumerateAssetsSectionSublayoutsInRect:usingBlock:](self, "enumerateAssetsSectionSublayoutsInRect:usingBlock:", v17, x, y, width, height);
  aBlock[0] = v9;
  aBlock[1] = 3221225472;
  aBlock[2] = __63__PXPhotosSectionedLayout_locationNamesFutureForContentInRect___block_invoke_2;
  aBlock[3] = &unk_1E513B828;
  v16 = v10;
  v11 = v10;
  v12 = _Block_copy(aBlock);
  v13 = (void *)objc_msgSend(v12, "copy");

  return v13;
}

- (id)assetCollectionsIteratorForContentInRect:(CGRect)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD aBlock[4];
  id v11;

  -[PXPhotosSectionedLayout viewModel](self, "viewModel", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "visibleAssetCollections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__PXPhotosSectionedLayout_assetCollectionsIteratorForContentInRect___block_invoke;
  aBlock[3] = &unk_1E513B878;
  v11 = v5;
  v6 = v5;
  v7 = _Block_copy(aBlock);
  v8 = _Block_copy(v7);

  return v8;
}

- (id)assetsIteratorForContentInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD aBlock[4];
  id v15;
  _QWORD v16[5];
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __58__PXPhotosSectionedLayout_assetsIteratorForContentInRect___block_invoke;
  v16[3] = &unk_1E513B800;
  v16[4] = self;
  v18 = x;
  v19 = y;
  v20 = width;
  v21 = height;
  v10 = v8;
  v17 = v10;
  -[PXPhotosSectionedLayout enumerateAssetsSectionSublayoutsInRect:usingBlock:](self, "enumerateAssetsSectionSublayoutsInRect:usingBlock:", v16, x, y, width, height);
  if (objc_msgSend(v10, "count"))
  {
    aBlock[0] = v9;
    aBlock[1] = 3221225472;
    aBlock[2] = __58__PXPhotosSectionedLayout_assetsIteratorForContentInRect___block_invoke_2;
    aBlock[3] = &unk_1E513B8C8;
    v15 = v10;
    v11 = _Block_copy(aBlock);

  }
  else
  {
    v11 = 0;
  }
  v12 = _Block_copy(v11);

  return v12;
}

- (id)topmostHeaderSnapshotInRect:(CGRect)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  int64x2_t v12;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  if (!self->_headerProviderRespondsTo.floatingHeaderSnapshot)
    return 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__237207;
  v18 = __Block_byref_object_dispose__237208;
  v19 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __55__PXPhotosSectionedLayout_topmostHeaderSnapshotInRect___block_invoke;
  v13[3] = &unk_1E513B8F0;
  v13[4] = &v14;
  -[PXPhotosSectionedLayout enumerateAssetsSectionSublayoutsInRect:usingBlock:](self, "enumerateAssetsSectionSublayoutsInRect:usingBlock:", v13, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)v15[5];
  if (v4)
  {
    objc_msgSend(v4, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "identifier");
    v7 = objc_msgSend((id)v15[5], "section");
    -[PXPhotosSectionedLayout headerLayoutProvider](self, "headerLayoutProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    v11[1] = v7;
    v12 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    objc_msgSend(v8, "floatingHeaderSnapshotForSectionedLayout:dataSource:sectionIndexPath:", self, v5, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  _Block_object_dispose(&v14, 8);

  return v9;
}

- (id)presentedItemsGeometryForSection:(unint64_t)a3 inDataSource:(id)a4
{
  id v6;
  void *v7;
  int v8;
  id v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v6 = a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__237207;
  v16 = __Block_byref_object_dispose__237208;
  v17 = 0;
  -[PXPhotosSectionedLayout assetsDataSource](self, "assetsDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if (v8)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __73__PXPhotosSectionedLayout_presentedItemsGeometryForSection_inDataSource___block_invoke;
    v11[3] = &unk_1E513B918;
    v11[4] = &v12;
    v11[5] = a3;
    -[PXPhotosSectionedLayout enumerateAssetsSectionSublayoutsUsingBlock:](self, "enumerateAssetsSectionSublayoutsUsingBlock:", v11);
  }
  v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

- (void)enumerateItemsGeometriesInRect:(CGRect)a3 dataSource:(id)a4 usingBlock:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  id v12;
  void *v13;
  int v14;
  _QWORD v15[4];
  id v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a5;
  v12 = a4;
  -[PXPhotosSectionedLayout assetsDataSource](self, "assetsDataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "isEqual:", v13);

  if (v14)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __80__PXPhotosSectionedLayout_enumerateItemsGeometriesInRect_dataSource_usingBlock___block_invoke;
    v15[3] = &unk_1E513B940;
    v16 = v11;
    -[PXPhotosSectionedLayout enumerateAssetsSectionSublayoutsInRect:usingBlock:](self, "enumerateAssetsSectionSublayoutsInRect:usingBlock:", v15, x, y, width, height);

  }
}

- (id)_createAnimationForChangeFromDataSource:(id)a3 toDataSource:(id)a4 changeDetails:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  PXPhotosSlideAnimationDelegate *v13;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[PXGLayout createDefaultAnimationForCurrentContext](self, "createDefaultAnimationForCurrentContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12
    && objc_msgSend(off_1E50B4A18, "changeDetailsAreOnlyInsertionsOrOnlyRemovalsAtEnd:fromDataSource:toDataSource:", v10, v8, v9))
  {
    v13 = objc_alloc_init(PXPhotosSlideAnimationDelegate);
    objc_msgSend(v11, "setDelegate:", v13);

  }
  return v11;
}

- (void)_performAddActionForSectionLayout:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[4];
  NSObject *v15;
  _QWORD v16[2];
  int64x2_t v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "identifier");
  v7 = objc_msgSend(v4, "section");

  v16[0] = v6;
  v16[1] = v7;
  v17 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  objc_msgSend(v5, "assetCollectionReferenceAtSectionIndexPath:", v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosSectionedLayout viewModel](self, "viewModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assetCollectionActionManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "actionPerformerForActionType:assetCollectionReference:", CFSTR("PXAssetCollectionActionTypeAddFrom"), v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __61__PXPhotosSectionedLayout__performAddActionForSectionLayout___block_invoke;
    v14[3] = &unk_1E5148B78;
    v15 = v8;
    objc_msgSend(v11, "performActionWithCompletionHandler:", v14);
    v12 = v15;
  }
  else
  {
    PLGridZeroGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "assetCollection");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v19 = v13;
      _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_ERROR, "Missing action performer for add button action. Asset collection: %@", buf, 0xCu);

    }
  }

}

- (BOOL)_shouldFaultInSection:(int64_t)a3 inDataSource:(id)a4
{
  int v5;
  void *v6;

  if (objc_msgSend(a4, "numberOfItemsInSection:", a3) <= 0)
  {
    -[PXPhotosSectionedLayout viewModel](self, "viewModel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "allowsEmptyPlaceholderBehavior") ^ 1;

  }
  else
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (void)enumerateAssetsSectionSublayoutsUsingBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__PXPhotosSectionedLayout_enumerateAssetsSectionSublayoutsUsingBlock___block_invoke;
  v7[3] = &unk_1E513B968;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateSublayoutsUsingBlock:", v7);

}

- (void)enumerateAssetsSectionSublayoutsInRect:(CGRect)a3 usingBlock:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __77__PXPhotosSectionedLayout_enumerateAssetsSectionSublayoutsInRect_usingBlock___block_invoke;
  v12[3] = &unk_1E513B990;
  v13 = v9;
  v11 = v9;
  objc_msgSend(v10, "enumerateSublayoutsInRect:usingBlock:", v12, x, y, width, height);

}

- (void)enumerateSectionBoundariesWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v9, "count");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __76__PXPhotosSectionedLayout_enumerateSectionBoundariesWithOptions_usingBlock___block_invoke;
  v10[3] = &unk_1E513B9B8;
  v11 = v6;
  v8 = v6;
  objc_msgSend(v9, "enumerateSublayoutGeometriesInRange:options:usingBlock:", 0, v7, a3, v10);

}

- (BOOL)_configureSectionLayout:(id)a3 sectionIndexPath:(PXSimpleIndexPath *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v13;
  void *v14;
  _BOOL4 shouldRecreateHeaderLayouts;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  _BOOL4 shouldRecreateBodyLayouts;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  __int128 v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  int v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  int v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  _BOOL4 configureSectionHeaderLayout;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v63;
  _QWORD v64[4];
  id v65;
  _QWORD v66[2];
  int64x2_t v67;
  id location[2];
  __int128 v69;
  uint64_t v70;

  v6 = a3;
  -[PXPhotosSectionedLayout viewModel](self, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dropTargetAssetReference");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dropTargetAssetReference");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "tapbackStatusManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tapbackStatusManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v10 != v11 || v8 != v9;
  objc_msgSend(v6, "headerLayout");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    shouldRecreateHeaderLayouts = self->_shouldRecreateHeaderLayouts;

    if (!shouldRecreateHeaderLayouts)
      goto LABEL_23;
  }
  else
  {
    -[PXPhotosSectionedLayout headerLayoutProvider](self, "headerLayoutProvider");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
    {

    }
    else if (!self->_shouldRecreateHeaderLayouts)
    {
      goto LABEL_23;
    }
  }
  v70 = 1;
  -[PXPhotosSectionedLayout headerLayoutProvider](self, "headerLayoutProvider");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosSectionedLayout assetsDataSource](self, "assetsDataSource");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosSectionedLayout spec](self, "spec");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = *(_OWORD *)&a4->item;
  *(_OWORD *)location = *(_OWORD *)&a4->dataSourceIdentifier;
  v69 = v20;
  objc_msgSend(v17, "createSectionHeaderLayoutForSectionedLayout:dataSource:sectionIndexPath:spec:outAlignment:", self, v18, location, v19, &v70);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "headerLayout");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22 != v21)
  {
    objc_msgSend(v6, "setHeaderLayout:", v21);
    v13 = 1;
  }
  switch(v70)
  {
    case 1:
      v23 = 0;
      v24 = 1;
      goto LABEL_19;
    case 2:
      v24 = 0;
      v23 = 0;
LABEL_19:
      v25 = 1;
      break;
    case 3:
      v23 = 0;
      v24 = 1;
      v25 = 2;
      break;
    case 4:
      v24 = 1;
      v25 = 7;
      v23 = 1;
      break;
    default:
      v23 = 0;
      v25 = 0;
      v24 = 1;
      break;
  }
  objc_msgSend(v6, "setMode:", v25);
  objc_msgSend(v6, "setFloatingModesRespectSafeArea:", v24);
  objc_msgSend(v6, "setAdjustSublayoutZPositions:", v23);
  objc_msgSend(v6, "setShouldExcludeTopAndBottomPaddingFromReferenceSize:", v23);

LABEL_23:
  objc_msgSend(v6, "bodyContentLayout");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    shouldRecreateBodyLayouts = self->_shouldRecreateBodyLayouts;

    if (!shouldRecreateBodyLayouts)
      goto LABEL_32;
  }
  else
  {
    -[PXPhotosSectionedLayout bodyLayoutProvider](self, "bodyLayoutProvider");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {

    }
    else if (!self->_shouldRecreateBodyLayouts)
    {
      goto LABEL_32;
    }
  }
  LOBYTE(v70) = 1;
  -[PXPhotosSectionedLayout bodyLayoutProvider](self, "bodyLayoutProvider");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosSectionedLayout assetsDataSource](self, "assetsDataSource");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosSectionedLayout spec](self, "spec");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = *(_OWORD *)&a4->item;
  *(_OWORD *)location = *(_OWORD *)&a4->dataSourceIdentifier;
  v69 = v32;
  objc_msgSend(v29, "createSectionBodyLayoutForSectionedLayout:dataSource:sectionIndexPath:spec:outWantsDecoration:", self, v30, location, v31, &v70);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setDisableConfigurators:", v33 != 0);
  objc_msgSend(v6, "bodyContentLayout");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34 != v33)
    v13 = 1;
  objc_msgSend(v6, "setBodyContentLayout:wantsDecoration:", v33, v70);

LABEL_32:
  objc_msgSend(v7, "headerFloatingThresholdOffset");
  objc_msgSend(v6, "setFloatingThresholdOffset:");
  objc_msgSend(v7, "selectionSnapshot");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSelectionSnapshot:", v35);

  objc_msgSend(v7, "draggedAssetReferences");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDraggedAssetReferences:", v36);

  objc_msgSend(v7, "dropTargetAssetReference");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDropTargetAssetReference:", v37);

  objc_msgSend(v6, "setIsSelecting:", objc_msgSend(v7, "isInSelectMode"));
  objc_msgSend(v6, "setCanStartSelecting:", 1);
  objc_msgSend(v6, "setWantsDimmedSelectionStyle:", objc_msgSend(v7, "wantsDimmedSelectionStyle"));
  objc_msgSend(v6, "setWantsNumberedSelectionStyle:", objc_msgSend(v7, "wantsNumberedSelectionStyle"));
  objc_msgSend(v6, "setWantsFileSizeBadge:", objc_msgSend(v7, "wantsFileSizeBadge"));
  objc_msgSend(v6, "setWantsAssetIndexBadge:", objc_msgSend(v7, "wantsAssetIndexBadge"));
  objc_msgSend(v6, "setRemovesContentLayoutWhenEmpty:", 0);
  objc_msgSend(v7, "tapbackStatusManager");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTapbackStatusManager:", v38);

  objc_msgSend(v7, "decorationDataSource");
  v39 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDecorationDataSource:", v39);

  -[PXPhotosSectionedLayout preferredCornerRadius](self, "preferredCornerRadius");
  objc_msgSend(v6, "setPreferredCornerRadius:");
  LODWORD(v39) = objc_msgSend(v6, "isFaceModeEnabled");
  v40 = v39 ^ objc_msgSend(v7, "isFaceModeEnabled") | v13;
  objc_msgSend(v6, "setFaceModeEnabled:", objc_msgSend(v7, "isFaceModeEnabled"));
  objc_msgSend(v6, "dataSource");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v66[0] = objc_msgSend(v41, "identifier");
  v66[1] = objc_msgSend(v6, "section");
  v67 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  objc_msgSend(v41, "assetCollectionReferenceAtSectionIndexPath:", v66);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assetCollectionActionManager");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "allowsInlineAddBehavior")
    || (objc_msgSend(v7, "isInSelectMode") & 1) != 0
    || !objc_msgSend(v43, "canPerformActionType:assetCollectionReference:", CFSTR("PXAssetCollectionActionTypeAddFrom"), v42)|| (objc_msgSend(v41, "containsAnyItems") & 1) == 0 && (objc_msgSend(v7, "allowsEmptyPlaceholderBehavior") & 1) != 0)
  {
    objc_msgSend(v6, "addContentActionHandler");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v44)
      goto LABEL_40;
    objc_msgSend(v6, "setAddContentActionHandler:", 0);
    goto LABEL_39;
  }
  objc_msgSend(v6, "addContentActionHandler");
  v63 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v63)
  {
    objc_initWeak(location, self);
    v64[0] = MEMORY[0x1E0C809B0];
    v64[1] = 3221225472;
    v64[2] = __68__PXPhotosSectionedLayout__configureSectionLayout_sectionIndexPath___block_invoke;
    v64[3] = &unk_1E513B9E0;
    objc_copyWeak(&v65, location);
    objc_msgSend(v6, "setAddContentActionHandler:", v64);
    objc_destroyWeak(&v65);
    objc_destroyWeak(location);
LABEL_39:
    LOBYTE(v40) = 1;
  }
LABEL_40:
  objc_msgSend(v6, "setAutomaticallyUpdatesPadding:", 1);
  -[PXPhotosSectionedLayout interSectionSpacing](self, "interSectionSpacing");
  objc_msgSend(v6, "setIntersectionSpacing:");
  objc_msgSend(v6, "headerLayout");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "allowsSelectSectionAction"))
    v46 = objc_msgSend(v7, "isInSelectMode");
  else
    v46 = 0;
  objc_msgSend(v45, "setIsInSelectMode:", v46);
  objc_msgSend(v7, "selectionSnapshot");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setSelectionSnapshot:", v47);

  v48 = objc_msgSend(v7, "viewBasedDecorationsEnabled");
  objc_msgSend(v6, "assetDecorationSource");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v49;
  if (v48)
  {
    objc_msgSend(v49, "setForbiddenBadges:", -1);

    objc_msgSend(v6, "assetDecorationSource");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "setDurationAlwaysHidden:", 1);
  }
  else
  {
    objc_msgSend(v49, "setForbiddenBadges:", objc_msgSend(v49, "forbiddenBadges") | objc_msgSend(v7, "forbiddenBadges"));
  }

  v51 = objc_msgSend(v7, "allowsInteractiveFavoriteBadges") ^ 1;
  objc_msgSend(v6, "assetDecorationSource");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setHidesInteractiveFavoriteBadges:", v51);

  objc_msgSend(v7, "badgesModifier");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assetDecorationSource");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setBadgesModifier:", v53);

  objc_msgSend(v6, "setItemCaptionsVisible:", objc_msgSend(v7, "captionsVisible"));
  objc_msgSend(v6, "setShowAllAffordanceStyle:", 0);
  -[PXPhotosSectionedLayout _updateSublayoutGridConfiguratorForLayout:](self, "_updateSublayoutGridConfiguratorForLayout:", v6);
  objc_msgSend(v6, "headerLayout");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  if (v55)
  {
    configureSectionHeaderLayout = self->_headerProviderRespondsTo.configureSectionHeaderLayout;

    if (configureSectionHeaderLayout)
    {
      -[PXPhotosSectionedLayout headerLayoutProvider](self, "headerLayoutProvider");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "headerLayout");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "configureSectionHeaderLayout:inAssetSectionLayout:forSectionedLayout:", v58, v6, self);

    }
  }
  objc_msgSend(v6, "bodyContentLayout");
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  if (v59)
  {
    -[PXPhotosSectionedLayout bodyLayoutProvider](self, "bodyLayoutProvider");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bodyContentLayout");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "configureSectionBodyLayout:inAssetSectionLayout:forSectionedLayout:", v61, v6, self);

  }
  return v40;
}

- (void)willUpdate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXPhotosSectionedLayout;
  -[PXGStackLayout willUpdate](&v7, sel_willUpdate);
  self->_updateFlags.willPerformUpdate = 1;
  if (self->_updateFlags.isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosSectionedLayout willUpdate]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PXPhotosSectionedLayout.m"), 513, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

  }
  self->_postUpdateFlags.willPerformUpdate = 1;
  if (self->_postUpdateFlags.isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosSectionedLayout willUpdate]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXPhotosSectionedLayout.m"), 514, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_postUpdateFlags.isPerformingUpdate"));

  }
}

- (void)update
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  BOOL isUpdatingSublayouts;
  $F40CD077B40800501ED060B808F886F7 *p_postUpdateFlags;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_super v31;

  self->_numberOfForcedSections = 0;
  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.willPerformUpdate = 0;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosSectionedLayout update]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("PXPhotosSectionedLayout.m"), 520, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

      needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if ((needsUpdate & 1) != 0)
    {
      p_updateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      -[PXPhotosSectionedLayout _updateSublayoutsDataSource](self, "_updateSublayoutsDataSource");
      if (!p_updateFlags->isPerformingUpdate)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosSectionedLayout update]");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "handleFailureInFunction:file:lineNumber:description:", v28, CFSTR("PXPhotosSectionedLayout.m"), 524, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

      }
    }
    v5 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 2uLL;
    if ((v5 & 2) != 0)
    {
      p_updateFlags->needsUpdate = v5 & 0xFFFFFFFFFFFFFFFDLL;
      -[PXPhotosSectionedLayout _updateSublayoutsSpec](self, "_updateSublayoutsSpec");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosSectionedLayout update]");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("PXPhotosSectionedLayout.m"), 527, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v6 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x20uLL;
    if ((v6 & 0x20) != 0)
    {
      p_updateFlags->needsUpdate = v6 & 0xFFFFFFFFFFFFFFDFLL;
      -[PXPhotosSectionedLayout _updatePreferredCornerRadius](self, "_updatePreferredCornerRadius");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosSectionedLayout update]");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("PXPhotosSectionedLayout.m"), 530, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v7 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 0x10uLL;
    if ((v7 & 0x10) != 0)
    {
      p_updateFlags->needsUpdate = v7 & 0xFFFFFFFFFFFFFFEFLL;
      -[PXPhotosSectionedLayout _updateSublayoutsConfiguration](self, "_updateSublayoutsConfiguration");
      v7 = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosSectionedLayout update]");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("PXPhotosSectionedLayout.m"), 534, CFSTR("still needing to update %lu after update pass"), p_updateFlags->needsUpdate);

    }
  }
  isUpdatingSublayouts = self->_isUpdatingSublayouts;
  self->_isUpdatingSublayouts = 1;
  v31.receiver = self;
  v31.super_class = (Class)PXPhotosSectionedLayout;
  -[PXGStackLayout update](&v31, sel_update);
  self->_isUpdatingSublayouts = isUpdatingSublayouts;
  p_postUpdateFlags = &self->_postUpdateFlags;
  self->_postUpdateFlags.willPerformUpdate = 0;
  v10 = self->_postUpdateFlags.needsUpdate;
  if (v10)
  {
    if (self->_postUpdateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosSectionedLayout update]");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, CFSTR("PXPhotosSectionedLayout.m"), 541, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_postUpdateFlags.isPerformingUpdate"));

      v10 = p_postUpdateFlags->needsUpdate;
    }
    self->_postUpdateFlags.isPerformingUpdate = 1;
    self->_postUpdateFlags.updated = 1;
    if ((v10 & 1) != 0)
    {
      p_postUpdateFlags->needsUpdate = v10 & 0xFFFFFFFFFFFFFFFELL;
      -[PXPhotosSectionedLayout _updateSectionsBlur](self, "_updateSectionsBlur");
      if (!self->_postUpdateFlags.isPerformingUpdate)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosSectionedLayout update]");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "handleFailureInFunction:file:lineNumber:description:", v30, CFSTR("PXPhotosSectionedLayout.m"), 545, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_postUpdateFlags.isPerformingUpdate"));

      }
    }
    v11 = p_postUpdateFlags->needsUpdate;
    self->_postUpdateFlags.updated |= 2uLL;
    if ((v11 & 2) != 0)
    {
      p_postUpdateFlags->needsUpdate = v11 & 0xFFFFFFFFFFFFFFFDLL;
      -[PXPhotosSectionedLayout _updateCaptureSprite](self, "_updateCaptureSprite");
    }
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosSectionedLayout update]");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, CFSTR("PXPhotosSectionedLayout.m"), 548, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_postUpdateFlags.isPerformingUpdate"));

    }
    v12 = p_postUpdateFlags->needsUpdate;
    self->_postUpdateFlags.updated |= 4uLL;
    if ((v12 & 4) != 0)
    {
      p_postUpdateFlags->needsUpdate = v12 & 0xFFFFFFFFFFFFFFFBLL;
      -[PXPhotosSectionedLayout _updateSublayoutTransforms](self, "_updateSublayoutTransforms");
      v12 = p_postUpdateFlags->needsUpdate;
    }
    self->_postUpdateFlags.isPerformingUpdate = 0;
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosSectionedLayout update]");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, CFSTR("PXPhotosSectionedLayout.m"), 551, CFSTR("still needing to update %lu after update pass"), p_postUpdateFlags->needsUpdate);

    }
  }
}

- (void)didUpdate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PXPhotosSectionedLayout;
  -[PXGStackLayout didUpdate](&v7, sel_didUpdate);
  if (self->_updateFlags.willPerformUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosSectionedLayout didUpdate]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PXPhotosSectionedLayout.m"), 556, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.willPerformUpdate"));

  }
  if (self->_postUpdateFlags.willPerformUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosSectionedLayout didUpdate]");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXPhotosSectionedLayout.m"), 557, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_postUpdateFlags.willPerformUpdate"));

  }
}

- (void)_invalidateSublayoutsDataSource
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosSectionedLayout _invalidateSublayoutsDataSource]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXPhotosSectionedLayout.m"), 561, CFSTR("invalidating %lu after it already has been updated"), 1);

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

- (void)_updateSublayoutsDataSource
{
  void *v4;
  void *v5;
  PXAssetsDataSource *v6;
  PXAssetsDataSource *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  int v20;
  int v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  PXAssetsDataSource *v33;
  id v34;
  id v35;
  PXAssetsDataSource *v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  SEL v46;
  void *v47;
  void *v48;
  _QWORD v49[4];
  id v50;
  PXAssetsDataSource *v51;
  PXPhotosSectionedLayout *v52;
  _QWORD v53[5];
  PXAssetsDataSource *v54;
  id v55;
  _QWORD v56[4];
  PXAssetsDataSource *v57;
  PXAssetsDataSource *v58;
  id v59;
  id v60;
  _QWORD v61[7];

  -[PXPhotosSectionedLayout viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataSourceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = self->_assetsDataSource;
  objc_msgSend(v5, "dataSource");
  v7 = (PXAssetsDataSource *)objc_claimAutoreleasedReturnValue();
  if (v6 != v7)
  {
    -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PXAssetsDataSource numberOfSections](v6, "numberOfSections");
    v48 = v8;
    if (v9 != objc_msgSend(v8, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosSectionedLayout.m"), 574, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("numberOfSublayoutsBefore == sublayoutDataStore.count"));

    }
    objc_msgSend(v5, "changeHistory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "changeDetailsFromDataSourceIdentifier:toDataSourceIdentifier:", -[PXAssetsDataSource identifier](v6, "identifier"), -[PXAssetsDataSource identifier](v7, "identifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v47 = v5;
    if (self->_isUpdatingSublayouts)
    {
      if (objc_msgSend(v11, "count") != 1)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosSectionedLayout.m"), 584, CFSTR("While updating sublayouts, expecting only one data source change, got %lu"), objc_msgSend(v11, "count"));

      }
      objc_msgSend(v11, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "sectionsWithItemChanges");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v61[0] = MEMORY[0x1E0C809B0];
      v61[1] = 3221225472;
      v61[2] = __54__PXPhotosSectionedLayout__updateSublayoutsDataSource__block_invoke;
      v61[3] = &unk_1E51479F0;
      v61[4] = self;
      v61[5] = a2;
      v46 = a2;
      objc_msgSend(v13, "enumerateIndexesUsingBlock:", v61);

      objc_msgSend(v12, "sectionChanges");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v14, "hasIncrementalChanges") & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", v46, self, CFSTR("PXPhotosSectionedLayout.m"), 590, CFSTR("Section changes while updating sublayouts must be incremental."));

      }
      objc_msgSend(v14, "insertedIndexes");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");

      if (v16)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "insertedIndexes");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", v46, self, CFSTR("PXPhotosSectionedLayout.m"), 591, CFSTR("Sections %@ inserted while updating sublayouts, this is not supported."), v43);

      }
      v17 = v11;
      objc_msgSend(v14, "removedIndexes");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "count");

      if (v19)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "removedIndexes");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", v46, self, CFSTR("PXPhotosSectionedLayout.m"), 592, CFSTR("Sections %@ removed while updating sublayouts, this is not supported."), v45);

      }
    }
    else
    {
      if ((-[PXAssetsDataSource containsAnyItems](v6, "containsAnyItems") & 1) != 0)
        v20 = 0;
      else
        v20 = -[PXAssetsDataSource areAllSectionsConsideredAccurate](v6, "areAllSectionsConsideredAccurate") ^ 1;
      if ((-[PXAssetsDataSource containsAnyItems](v7, "containsAnyItems") & 1) != 0)
        v21 = 0;
      else
        v21 = -[PXAssetsDataSource areAllSectionsConsideredAccurate](v7, "areAllSectionsConsideredAccurate") ^ 1;
      if (v20 == v21)
        v22 = -[PXPhotosSectionedLayout _createAnimationForChangeFromDataSource:toDataSource:changeDetails:](self, "_createAnimationForChangeFromDataSource:toDataSource:changeDetails:", v6, v7, v11);
      -[PXPhotosSectionedLayout viewModel](self, "viewModel");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "libraryFilterState");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        if (-[PXAssetsDataSource areAllSectionsConsideredAccurate](v6, "areAllSectionsConsideredAccurate"))
        {
          if (-[PXAssetsDataSource areAllSectionsConsideredAccurate](v7, "areAllSectionsConsideredAccurate"))v24 = 0;
          else
            v24 = 15;
        }
        else
        {
          v24 = 15;
        }
      }
      else
      {
        objc_msgSend(v12, "contentFilterState");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          if ((-[PXAssetsDataSource areAllSectionsConsideredAccurate](v6, "areAllSectionsConsideredAccurate") & 1) != 0)
          {
            if (-[PXAssetsDataSource areAllSectionsConsideredAccurate](v7, "areAllSectionsConsideredAccurate"))v24 = 0;
            else
              v24 = 15;
          }
          else
          {
            v24 = 15;
          }
        }
        else
        {
          v24 = 0;
        }

      }
      v17 = v11;

      -[PXGLayout rootLayout](self, "rootLayout");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "createAnchorForVisibleAreaIgnoringEdges:", v24);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "autoInvalidate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      -[PXGLayout activeAnchor](self, "activeAnchor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v29)
      {
        -[PXGLayout createAnchorWithAnchor:](self, "createAnchorWithAnchor:", v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (id)objc_msgSend(v30, "autoInvalidate");

      }
    }

    objc_storeStrong((id *)&self->_assetsDataSource, v7);
    v59 = 0;
    v60 = 0;
    v32 = MEMORY[0x1E0C809B0];
    v56[0] = MEMORY[0x1E0C809B0];
    v56[1] = 3221225472;
    v56[2] = __54__PXPhotosSectionedLayout__updateSublayoutsDataSource__block_invoke_2;
    v56[3] = &unk_1E513BA08;
    v57 = v6;
    v33 = v7;
    v58 = v33;
    -[PXGLayout applySectionedChangeDetails:dataSourceBeforeChanges:dataSourceAfterChanges:sublayoutProvider:outChangedSections:outSectionsWithItemChanges:changeMediaVersionHandler:](self, "applySectionedChangeDetails:dataSourceBeforeChanges:dataSourceAfterChanges:sublayoutProvider:outChangedSections:outSectionsWithItemChanges:changeMediaVersionHandler:", v17, v57, v33, self, &v60, &v59, v56);
    v34 = v60;
    v35 = v59;
    v53[0] = v32;
    v53[1] = 3221225472;
    v53[2] = __54__PXPhotosSectionedLayout__updateSublayoutsDataSource__block_invoke_3;
    v53[3] = &unk_1E51489A0;
    v53[4] = self;
    v36 = v33;
    v54 = v36;
    v37 = v48;
    v55 = v37;
    objc_msgSend(v35, "enumerateIndexesUsingBlock:", v53);
    -[PXGLayout invalidateVersion](self, "invalidateVersion");
    v49[0] = v32;
    v49[1] = 3221225472;
    v49[2] = __54__PXPhotosSectionedLayout__updateSublayoutsDataSource__block_invoke_4;
    v49[3] = &unk_1E513BA30;
    v38 = v34;
    v50 = v38;
    v51 = v36;
    v52 = self;
    -[PXPhotosSectionedLayout enumerateAssetsSectionSublayoutsUsingBlock:](self, "enumerateAssetsSectionSublayoutsUsingBlock:", v49);
    if (!self->_isUpdatingSublayouts)
    {
      -[PXPhotosSectionedLayout _invalidateSublayoutsSpec](self, "_invalidateSublayoutsSpec");
      -[PXPhotosSectionedLayout _invalidateSublayoutsConfiguration](self, "_invalidateSublayoutsConfiguration");
    }

    v5 = v47;
  }

}

- (void)_invalidateSublayoutsSpec
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  if (!self->_isRecreatingContentLayouts)
  {
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 2;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 2) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosSectionedLayout _invalidateSublayoutsSpec]");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXPhotosSectionedLayout.m"), 671, CFSTR("invalidating %lu after it already has been updated"), 2);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 2;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (void)_updateSublayoutsSpec
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __48__PXPhotosSectionedLayout__updateSublayoutsSpec__block_invoke;
  v2[3] = &unk_1E513BA58;
  v2[4] = self;
  -[PXPhotosSectionedLayout enumerateAssetsSectionSublayoutsUsingBlock:](self, "enumerateAssetsSectionSublayoutsUsingBlock:", v2);
}

- (void)_updateSublayoutGridConfiguratorForLayout:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  id v9;

  v4 = a3;
  objc_msgSend(v4, "spec");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "sectionConfiguratorForAssetCollection:inZoomLevel:", v6, 4);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PXPhotosSectionedLayout viewModel](self, "viewModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAspectFitContent:", objc_msgSend(v7, "aspectFitContent"));
    objc_msgSend(v7, "zoomStep");
    objc_msgSend(v9, "setZoomStep:", (uint64_t)v8);

  }
}

- (void)_invalidateSublayoutsConfiguration
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  if (!self->_isRecreatingContentLayouts)
  {
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 0x10;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 0x10) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosSectionedLayout _invalidateSublayoutsConfiguration]");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXPhotosSectionedLayout.m"), 697, CFSTR("invalidating %lu after it already has been updated"), 16);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 16;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (void)_updateSublayoutsConfiguration
{
  BOOL *p_isRecreatingContentLayouts;
  _BOOL4 shouldRecreateHeaderLayouts;
  id v5;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  if (self->_shouldRecreateBodyLayouts)
  {
    p_isRecreatingContentLayouts = &self->_isRecreatingContentLayouts;
    self->_isRecreatingContentLayouts = 1;
  }
  else
  {
    shouldRecreateHeaderLayouts = self->_shouldRecreateHeaderLayouts;
    p_isRecreatingContentLayouts = &self->_isRecreatingContentLayouts;
    self->_isRecreatingContentLayouts = shouldRecreateHeaderLayouts;
    if (!shouldRecreateHeaderLayouts)
      goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CD28B0], "setFrameStallSkipRequest:", 1);
LABEL_5:
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__PXPhotosSectionedLayout__updateSublayoutsConfiguration__block_invoke;
  v6[3] = &unk_1E513BA80;
  v6[4] = self;
  v6[5] = &v7;
  -[PXPhotosSectionedLayout enumerateAssetsSectionSublayoutsUsingBlock:](self, "enumerateAssetsSectionSublayoutsUsingBlock:", v6);
  if (*((_BYTE *)v8 + 24))
    v5 = -[PXGLayout createDefaultAnimationForCurrentContext](self, "createDefaultAnimationForCurrentContext");
  self->_shouldRecreateBodyLayouts = 0;
  self->_shouldRecreateHeaderLayouts = 0;
  *p_isRecreatingContentLayouts = 0;
  _Block_object_dispose(&v7, 8);
}

- (void)_invalidateSectionsBlur
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
      p_postUpdateFlags->needsUpdate = needsUpdate | 1;
      return;
    }
LABEL_5:
    if ((self->_postUpdateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosSectionedLayout _invalidateSectionsBlur]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXPhotosSectionedLayout.m"), 724, CFSTR("invalidating %lu after it already has been updated"), 1);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_postUpdateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_postUpdateFlags.willPerformUpdate;
  p_postUpdateFlags->needsUpdate = 1;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateSectionsBlur
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  PXSectionsBlurController *v7;
  PXSectionsBlurController *sectionsBlurController;
  uint64_t v9;
  PXSectionsBlurController *v10;
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
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;

  -[PXPhotosSectionedLayout spec](self, "spec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "wantsSectionsBlur") & 1) == 0)
  {

    goto LABEL_7;
  }
  -[PXPhotosSectionedLayout viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentLens");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "allowsBlur");

  if (!v6)
  {
LABEL_7:
    v9 = 1;
    goto LABEL_8;
  }
  if (!self->_sectionsBlurController)
  {
    v7 = -[PXSectionsBlurController initWithBlurrableSectionsSource:]([PXSectionsBlurController alloc], "initWithBlurrableSectionsSource:", self);
    sectionsBlurController = self->_sectionsBlurController;
    self->_sectionsBlurController = v7;

  }
  v9 = 0;
LABEL_8:
  -[PXSectionsBlurController setBehavior:](self->_sectionsBlurController, "setBehavior:", v9);
  v10 = self->_sectionsBlurController;
  -[PXGLayout visibleRect](self, "visibleRect");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[PXGLayout safeAreaInsets](self, "safeAreaInsets");
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
  -[PXPhotosSectionedLayout interSectionSpacing](self, "interSectionSpacing");
  -[PXSectionsBlurController updateSectionsBlurWithVisibleRect:safeAreaInsets:interSectionSpacing:](v10, "updateSectionsBlurWithVisibleRect:safeAreaInsets:interSectionSpacing:", v12, v14, v16, v18, v20, v22, v24, v26, v27);
}

- (void)_invalidateCaptureSprite
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
      p_postUpdateFlags->needsUpdate = needsUpdate | 2;
      return;
    }
LABEL_5:
    if ((self->_postUpdateFlags.updated & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosSectionedLayout _invalidateCaptureSprite]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXPhotosSectionedLayout.m"), 741, CFSTR("invalidating %lu after it already has been updated"), 2);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_postUpdateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_postUpdateFlags.willPerformUpdate;
  p_postUpdateFlags->needsUpdate = 2;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateCaptureSprite
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  float v18;
  char v22;
  unsigned int captureSpriteIndex;
  _QWORD v24[8];
  float v25;
  float v26;
  float v27;
  float v28;
  char v29;
  CGRect v30;

  -[PXPhotosSectionedLayout maskRect](self, "maskRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PXPhotosSectionedLayout maskCornerRadius](self, "maskCornerRadius");
  v15 = v14;
  v16 = v11;
  v17 = v12;
  v18 = v13;
  if (v14 == *(float *)off_1E50B8248
    && v11 == *((float *)off_1E50B8248 + 1)
    && v12 == *((float *)off_1E50B8248 + 2)
    && v13 == *((float *)off_1E50B8248 + 3))
  {
    v30.origin.x = v4;
    v30.origin.y = v6;
    v30.size.width = v8;
    v30.size.height = v10;
    if (CGRectIsInfinite(v30))
    {
      v22 = 0;
      captureSpriteIndex = self->_captureSpriteIndex;
      goto LABEL_17;
    }
  }
  captureSpriteIndex = self->_captureSpriteIndex;
  if (captureSpriteIndex == -1)
  {
    captureSpriteIndex = -[PXGLayout addSpriteWithInitialState:](self, "addSpriteWithInitialState:", &__block_literal_global_237232);
    self->_captureSpriteIndex = captureSpriteIndex;
    v22 = 1;
LABEL_17:
    if (captureSpriteIndex == -1)
      return;
    goto LABEL_18;
  }
  v22 = 1;
LABEL_18:
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __47__PXPhotosSectionedLayout__updateCaptureSprite__block_invoke_2;
  v24[3] = &__block_descriptor_81_e101_v40__0__PXGSpriteIndexRange_II_8_______ddd__16____f_________ffff__4f___ffffSCf____4___24____CCfqSC_32l;
  *(CGFloat *)&v24[4] = v4;
  *(CGFloat *)&v24[5] = v6;
  *(CGFloat *)&v24[6] = v8;
  *(CGFloat *)&v24[7] = v10;
  v29 = v22;
  v25 = v15;
  v26 = v16;
  v27 = v17;
  v28 = v18;
  -[PXGLayout modifySpritesInRange:state:](self, "modifySpritesInRange:state:", captureSpriteIndex | 0x100000000, v24);
}

- (void)_invalidateSublayoutTransforms
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
      p_postUpdateFlags->needsUpdate = needsUpdate | 4;
      return;
    }
LABEL_5:
    if ((self->_postUpdateFlags.updated & 4) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosSectionedLayout _invalidateSublayoutTransforms]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXPhotosSectionedLayout.m"), 772, CFSTR("invalidating %lu after it already has been updated"), 4);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_postUpdateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_postUpdateFlags.willPerformUpdate;
  p_postUpdateFlags->needsUpdate = 4;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_updateSublayoutTransforms
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  -[PXPhotosSectionedLayout viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "scrollingBehavior");

  if (v4 == 1)
  {
    -[PXPhotosSectionedLayout horizontalScrollingHintFactor](self, "horizontalScrollingHintFactor");
    +[PXLemonadeSettings sharedInstance](PXLemonadeSettings, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "horizontalPagingHintMaximumScale");
    PXClamp();
    v7 = v6;

    -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGLayout visibleRect](self, "visibleRect");
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __53__PXPhotosSectionedLayout__updateSublayoutTransforms__block_invoke;
    v14[3] = &unk_1E513BB08;
    v15 = v8;
    v16 = v9;
    v17 = v10;
    v18 = v11;
    v19 = v12;
    v20 = v7;
    v13 = v8;
    objc_msgSend(v13, "enumerateSublayoutsUsingBlock:", v14);

  }
}

- (void)_invalidatePreferredCornerRadius
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXPhotosSectionedLayout _invalidatePreferredCornerRadius]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXPhotosSectionedLayout.m"), 813, CFSTR("invalidating %lu after it already has been updated"), 32);

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

- (void)_updatePreferredCornerRadius
{
  double v3;
  double v4;
  double v5;
  double v6;

  -[PXPhotosSectionedLayout horizontalScrollingHintFactor](self, "horizontalScrollingHintFactor");
  PXFloatByLinearlyInterpolatingFloats();
  *(float *)&v3 = v3;
  LODWORD(v4) = LODWORD(v3);
  LODWORD(v5) = LODWORD(v3);
  LODWORD(v6) = LODWORD(v3);
  -[PXPhotosSectionedLayout setPreferredCornerRadius:](self, "setPreferredCornerRadius:", v3, v4, v5, v6);
}

- (void)setMaskRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_maskRect;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_maskRect = &self->_maskRect;
  if (!CGRectEqualToRect(self->_maskRect, a3))
  {
    p_maskRect->origin.x = x;
    p_maskRect->origin.y = y;
    p_maskRect->size.width = width;
    p_maskRect->size.height = height;
    -[PXPhotosSectionedLayout _invalidateCaptureSprite](self, "_invalidateCaptureSprite");
  }
}

- (void)setMaskCornerRadius:(id)a3
{
  float v3;
  float v4;
  float v5;
  float v6;

  if (self->_maskCornerRadius.var0.var0.topLeft != v3
    || self->_maskCornerRadius.var0.var0.topRight != v4
    || self->_maskCornerRadius.var0.var0.bottomLeft != v5
    || self->_maskCornerRadius.var0.var0.bottomRight != v6)
  {
    self->_maskCornerRadius.var0.var0.topLeft = v3;
    self->_maskCornerRadius.var0.var0.topRight = v4;
    self->_maskCornerRadius.var0.var0.bottomLeft = v5;
    self->_maskCornerRadius.var0.var0.bottomRight = v6;
    -[PXPhotosSectionedLayout _invalidateCaptureSprite](self, "_invalidateCaptureSprite", *(_QWORD *)&a3.var0.var0.var0, *(_QWORD *)&a3.var0.var1[2]);
  }
}

- (void)setPreferredCornerRadius:(id)a3
{
  float v3;
  float v4;
  float v5;
  float v6;

  if (self->_preferredCornerRadius.var0.var0.topLeft != v3
    || self->_preferredCornerRadius.var0.var0.topRight != v4
    || self->_preferredCornerRadius.var0.var0.bottomLeft != v5
    || self->_preferredCornerRadius.var0.var0.bottomRight != v6)
  {
    self->_preferredCornerRadius.var0.var0.topLeft = v3;
    self->_preferredCornerRadius.var0.var0.topRight = v4;
    self->_preferredCornerRadius.var0.var0.bottomLeft = v5;
    self->_preferredCornerRadius.var0.var0.bottomRight = v6;
    -[PXPhotosSectionedLayout _invalidateSublayoutsConfiguration](self, "_invalidateSublayoutsConfiguration", *(_QWORD *)&a3.var0.var0.var0, *(_QWORD *)&a3.var0.var1[2]);
  }
}

- (BOOL)allowsDanglingUpdatesAssertions
{
  return 0;
}

- (BOOL)allowsSublayoutUpdateCycleAssertions
{
  return 0;
}

- (int64_t)sublayoutIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  int64_t v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  int64_t v22;
  int64_t v23;
  int64_t v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v8;
    -[PXPhotosSectionedLayout assetsDataSource](self, "assetsDataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "assetReferenceForAssetReference:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v12 = objc_retainAutorelease(v11);
      *a5 = v12;
      objc_msgSend(v12, "indexPath");
      v13 = v24;
    }
    else if ((a4 & 1) != 0)
    {
      -[PXPhotosSectionedLayout assetsDataSource](self, "assetsDataSource");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectReferenceNearestToObjectReference:", v9);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        v20 = objc_retainAutorelease(v19);
        *a5 = v20;
        objc_msgSend(v20, "indexPath");
        v13 = v23;
      }
      else
      {
        v13 = 0x7FFFFFFFFFFFFFFFLL;
      }

    }
    else
    {
      v13 = 0x7FFFFFFFFFFFFFFFLL;
    }
LABEL_21:

LABEL_22:
    goto LABEL_23;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v8;
    objc_msgSend(v9, "decoratedSpriteReference");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[PXGLayout sublayoutIndexForSpriteReference:options:](self, "sublayoutIndexForSpriteReference:options:", v11, a4);
    if (v13 != 0x7FFFFFFFFFFFFFFFLL)
      *a5 = objc_retainAutorelease(v9);
    goto LABEL_21;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v8;
    -[PXPhotosSectionedLayout assetsDataSource](self, "assetsDataSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "assetCollectionReferenceForAssetCollectionReference:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = objc_retainAutorelease(v15);
      *a5 = v16;
      objc_msgSend(v16, "indexPath");
      v13 = v22;
    }
    else
    {
      v13 = 0x7FFFFFFFFFFFFFFFLL;
    }

    goto LABEL_22;
  }
  PXAssertGetLog();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v8;
    _os_log_error_impl(&dword_1A6789000, v17, OS_LOG_TYPE_ERROR, "Unhandled object reference type: %@", buf, 0xCu);
  }

  v13 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_23:

  return v13;
}

- (void)didFaultInSublayout:(id)a3 atIndex:(int64_t)a4 fromEstimatedContentSize:(CGSize)a5
{
  double height;
  double width;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  objc_class *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  objc_super v22;

  height = a5.height;
  width = a5.width;
  v22.receiver = self;
  v22.super_class = (Class)PXPhotosSectionedLayout;
  v10 = a3;
  -[PXGLayout didFaultInSublayout:atIndex:fromEstimatedContentSize:](&v22, sel_didFaultInSublayout_atIndex_fromEstimatedContentSize_, v10, a4, width, height);
  objc_msgSend(v10, "px_assetsSectionLayout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosSectionedLayout.m"), 896, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("sublayout.px_assetsSectionLayout"), v17);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "px_descriptionForAssertionMessage");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosSectionedLayout.m"), 896, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("sublayout.px_assetsSectionLayout"), v17, v19);

    goto LABEL_6;
  }
LABEL_3:
  objc_msgSend(v11, "assetCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosSectionedLayout viewModel](self, "viewModel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __80__PXPhotosSectionedLayout_didFaultInSublayout_atIndex_fromEstimatedContentSize___block_invoke;
  v20[3] = &unk_1E513BB30;
  v21 = v12;
  v14 = v12;
  objc_msgSend(v13, "performChanges:", v20);

}

- (void)willRemoveSublayout:(id)a3 atIndex:(int64_t)a4 flags:(unint64_t)a5
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  objc_class *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)PXPhotosSectionedLayout;
  v9 = a3;
  -[PXGStackLayout willRemoveSublayout:atIndex:flags:](&v21, sel_willRemoveSublayout_atIndex_flags_, v9, a4, a5);
  objc_msgSend(v9, "px_assetsSectionLayout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosSectionedLayout.m"), 906, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("sublayout.px_assetsSectionLayout"), v16);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "px_descriptionForAssertionMessage");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosSectionedLayout.m"), 906, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("sublayout.px_assetsSectionLayout"), v16, v18);

    goto LABEL_6;
  }
LABEL_3:
  objc_msgSend(v10, "assetCollection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosSectionedLayout viewModel](self, "viewModel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __61__PXPhotosSectionedLayout_willRemoveSublayout_atIndex_flags___block_invoke;
  v19[3] = &unk_1E513BB30;
  v20 = v11;
  v13 = v11;
  objc_msgSend(v12, "performChanges:", v19);

}

- (id)navigationObjectReferenceForLocation:(CGPoint)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v13;
  _OWORD v14[2];
  uint64_t v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PXPhotosSectionedLayout;
  -[PXGLayout navigationObjectReferenceForLocation:](&v16, sel_navigationObjectReferenceForLocation_, a3.x, a3.y);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosSectionedLayout viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "numberOfSections");

  if (v8 >= 2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "assetReferenceForAssetReference:", v4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        objc_msgSend(v9, "indexPath");
        if (v15 != *(_QWORD *)off_1E50B7E98)
        {
          objc_msgSend(v10, "indexPath");
          v14[0] = v13;
          v14[1] = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
          objc_msgSend(v6, "assetCollectionReferenceAtSectionIndexPath:", v14);
          v11 = objc_claimAutoreleasedReturnValue();

          v4 = (void *)v11;
        }
      }

    }
  }

  return v4;
}

- (void)visibleRectDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXPhotosSectionedLayout;
  -[PXGStackLayout visibleRectDidChange](&v3, sel_visibleRectDidChange);
  -[PXPhotosSectionedLayout _invalidateSectionsBlur](self, "_invalidateSectionsBlur");
  -[PXPhotosSectionedLayout _invalidateSublayoutTransforms](self, "_invalidateSublayoutTransforms");
}

- (BOOL)shouldApplyItemChangeDetailsToSublayout:(id)a3
{
  return !self->_shouldRecreateBodyLayouts;
}

- (BOOL)shouldApplySpriteTransformToSublayouts
{
  void *v2;
  BOOL v3;

  -[PXPhotosSectionedLayout placementOverride](self, "placementOverride");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (CGSize)layout:(id)a3 estimatedContentSizeForSublayoutAtIndex:(int64_t)a4 referenceSize:(CGSize)a5
{
  double height;
  double width;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  _QWORD v21[2];
  int64x2_t v22;
  CGSize result;

  height = a5.height;
  width = a5.width;
  -[PXPhotosSectionedLayout assetsDataSource](self, "assetsDataSource", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = objc_msgSend(v9, "identifier");
  v21[1] = a4;
  v22 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  objc_msgSend(v9, "assetCollectionAtSectionIndexPath:", v21);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "numberOfItemsInSection:", a4);
  v12 = objc_msgSend(v9, "hasCurationForAssetCollection:", v10);
  if (!v11)
  {
    if (objc_msgSend(v10, "estimatedAssetCount") == 0x7FFFFFFFFFFFFFFFLL)
      v11 = 0;
    else
      v11 = objc_msgSend(v10, "estimatedAssetCount");
  }
  -[PXPhotosSectionedLayout spec](self, "spec");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "assetsSpec");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXAssetsSectionLayout estimatedSizeWithReferenceSize:assetCollection:numberOfAssets:isCurated:zoomLevel:spec:](PXAssetsSectionLayout, "estimatedSizeWithReferenceSize:assetCollection:numberOfAssets:isCurated:zoomLevel:spec:", v10, v11, v12, 4, v14, width, height);
  v16 = v15;
  v18 = v17;

  v19 = v16;
  v20 = v18;
  result.height = v20;
  result.width = v19;
  return result;
}

- (void)_forceSectionIfNeeded:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[6];

  -[PXPhotosSectionedLayout viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (self->_numberOfForcedSections <= 19)
  {
    objc_msgSend(v5, "currentDataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "numberOfItemsInSection:", a3);

    if (!v8)
    {
      objc_msgSend(v6, "dataSourceManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __49__PXPhotosSectionedLayout__forceSectionIfNeeded___block_invoke;
      v10[3] = &unk_1E5145FB0;
      v10[4] = self;
      v10[5] = a3;
      objc_msgSend(v9, "performChanges:", v10);

    }
  }

}

- (id)layout:(id)a3 createSublayoutAtIndex:(int64_t)a4
{
  void *v6;
  void *v7;
  _BOOL4 v8;
  PXAssetsSectionLayout *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  PXAssetsSectionLayout *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  PXGScrollLayout *v23;
  double v25;
  _QWORD v26[2];
  int64x2_t v27;

  -[PXPhotosSectionedLayout viewModel](self, "viewModel", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosSectionedLayout _forceSectionIfNeeded:](self, "_forceSectionIfNeeded:", a4);
  objc_msgSend(v6, "currentDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PXPhotosSectionedLayout _shouldFaultInSection:inDataSource:](self, "_shouldFaultInSection:inDataSource:", a4, v7);

  if (v8)
  {
    v9 = [PXAssetsSectionLayout alloc];
    -[PXPhotosSectionedLayout assetsDataSource](self, "assetsDataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "loadingStatusManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "assetImportStatusManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "inlinePlaybackController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosSectionedLayout spec](self, "spec");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "assetsSpec");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[PXAssetsSectionLayout initWithSection:dataSource:actionManager:loadingStatusManager:assetImportStatusManager:inlinePlaybackController:zoomLevel:spec:](v9, "initWithSection:dataSource:actionManager:loadingStatusManager:assetImportStatusManager:inlinePlaybackController:zoomLevel:spec:", a4, v10, 0, v11, v12, v13, 4, v15);

    -[PXAssetsSectionLayout setDelegate:](v16, "setDelegate:", self);
    if (objc_msgSend(v6, "wantsSingleRowScrollingLayout"))
    {
      -[PXAssetsSectionLayout setPreferredInitialContentLayoutAxis:](v16, "setPreferredInitialContentLayoutAxis:", 2);
      -[PXAssetsSectionLayout setPreferredInitialContentLayoutNumberOfRows:](v16, "setPreferredInitialContentLayoutNumberOfRows:", &unk_1E53EF168);
    }
    v17 = objc_msgSend(v6, "decorationViewClass");
    -[PXAssetsSectionLayout assetDecorationSource](v16, "assetDecorationSource");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setDecorationViewClass:", v17);

    -[PXPhotosSectionedLayout assetsDataSource](self, "assetsDataSource");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "identifier");

    v26[0] = v20;
    v26[1] = a4;
    v27 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    -[PXPhotosSectionedLayout _configureSectionLayout:sectionIndexPath:](self, "_configureSectionLayout:sectionIndexPath:", v16, v26);
  }
  else
  {
    v16 = 0;
  }
  -[PXPhotosSectionedLayout viewModel](self, "viewModel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "scrollingBehavior");

  if (v22 == 1)
  {
    v23 = -[PXGScrollLayout initWithContentLayout:]([PXGScrollLayout alloc], "initWithContentLayout:", v16);
    LODWORD(v25) = 1140457472;
    -[PXGScrollLayout setScrollViewSpriteZPosition:](v23, "setScrollViewSpriteZPosition:", v25);
    -[PXGScrollLayout setShowsHorizontalScrollIndicator:](v23, "setShowsHorizontalScrollIndicator:", 0);
    -[PXGScrollLayout setShowsVerticalScrollIndicator:](v23, "setShowsVerticalScrollIndicator:", 1);
    -[PXGScrollLayout setAlwaysBounceVertical:](v23, "setAlwaysBounceVertical:", 1);
  }
  else
  {
    v23 = v16;
  }

  return v23;
}

- (id)layout:(id)a3 navigationObjectReferenceForSublayoutAtIndex:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  int64x2_t v11;

  -[PXPhotosSectionedLayout viewModel](self, "viewModel", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosSectionedLayout _forceSectionIfNeeded:](self, "_forceSectionIfNeeded:", a4);
  objc_msgSend(v6, "currentDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = objc_msgSend(v7, "identifier");
  v10[1] = a4;
  v11 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  objc_msgSend(v7, "assetCollectionReferenceAtSectionIndexPath:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)assetSectionLayoutDidConfigureLayouts:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "bodyContentLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PXPhotosSectionedLayout bodyLayoutProvider](self, "bodyLayoutProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bodyContentLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "configureSectionBodyLayout:inAssetSectionLayout:forSectionedLayout:", v6, v7, self);

  }
}

- (void)assetSectionLayoutDidUpdateVisibleRectOvershootFactor:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  _QWORD v18[10];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  _QWORD v25[4];
  __int128 v26;

  v4 = a3;
  -[PXPhotosSectionedLayout viewModel](self, "viewModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "scrollingBehavior");

  if (v6 == 1)
  {
    +[PXLemonadeSettings sharedInstance](PXLemonadeSettings, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "enableHorizontalPagingHint");

    if (v8)
    {
      -[PXGLayout visibleRect](self, "visibleRect");
      v10 = v9;
      v12 = v11;
      v14 = v13;
      v16 = v15;
      v25[0] = 0;
      v25[1] = v25;
      v25[2] = 0x3010000000;
      v25[3] = &unk_1A7E74EE7;
      v26 = *MEMORY[0x1E0C9D820];
      v19 = 0;
      v20 = &v19;
      v21 = 0x3032000000;
      v22 = __Block_byref_object_copy__237207;
      v23 = __Block_byref_object_dispose__237208;
      v24 = 0;
      -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __81__PXPhotosSectionedLayout_assetSectionLayoutDidUpdateVisibleRectOvershootFactor___block_invoke;
      v18[3] = &unk_1E513BB58;
      *(double *)&v18[6] = v10;
      *(double *)&v18[7] = v12;
      *(double *)&v18[8] = v14;
      *(double *)&v18[9] = v16;
      v18[4] = v25;
      v18[5] = &v19;
      objc_msgSend(v17, "enumerateSublayoutsInRect:usingBlock:", v18, v10, v12, v14, v16);

      if ((id)v20[5] == v4)
      {
        objc_msgSend(v4, "visibleRectOvershootFactor");
        -[PXPhotosSectionedLayout setHorizontalScrollingHintFactor:](self, "setHorizontalScrollingHintFactor:");
      }
      _Block_object_dispose(&v19, 8);

      _Block_object_dispose(v25, 8);
    }
  }

}

- (BOOL)layout:(id)a3 shouldPreventFaultOutOfSublayout:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSIndexSet *v13;
  NSIndexSet *cachedSectionsWithSelectedItems;
  void *v15;
  uint64_t v16;
  int64_t dataSourceIdentifierOfCachedSectionsWithSelectedItems;
  uint64_t v18;
  NSIndexSet *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  char v23;
  char v24;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "contentLayout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_dataSourceIdentifierOfCachedSectionsWithSelectedItems == *(_QWORD *)off_1E50B7E98)
    {
      -[PXPhotosSectionedLayout viewModel](self, "viewModel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "selectionSnapshot");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "dataSource");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      self->_dataSourceIdentifierOfCachedSectionsWithSelectedItems = objc_msgSend(v11, "identifier");

      objc_msgSend(v10, "selectedIndexPaths");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "sectionsWithItemsForDataSourceIdentifier:", self->_dataSourceIdentifierOfCachedSectionsWithSelectedItems);
      v13 = (NSIndexSet *)objc_claimAutoreleasedReturnValue();
      cachedSectionsWithSelectedItems = self->_cachedSectionsWithSelectedItems;
      self->_cachedSectionsWithSelectedItems = v13;

    }
    objc_msgSend(v8, "dataSource");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "identifier");
    dataSourceIdentifierOfCachedSectionsWithSelectedItems = self->_dataSourceIdentifierOfCachedSectionsWithSelectedItems;

    if (v16 == dataSourceIdentifierOfCachedSectionsWithSelectedItems)
    {
      v18 = objc_msgSend(v8, "section");
      v19 = self->_cachedSectionsWithSelectedItems;
      v20 = -[NSIndexSet containsIndex:](v19, "containsIndex:", v18)
         || -[NSIndexSet containsIndex:](v19, "containsIndex:", v18 - 1)
         || -[NSIndexSet containsIndex:](v19, "containsIndex:", v18 + 1);

    }
    else
    {
      v20 = 0;
    }
    -[PXPhotosSectionedLayout bodyLayoutProvider](self, "bodyLayoutProvider");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bodyContentLayout");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "shouldPreventFaultOutOfBodyLayout:inAssetSectionLayout:", v22, v8);

    v24 = 1;
    if (!v20 && (v23 & 1) == 0)
      v24 = objc_msgSend(v6, "hasPointReferences");

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (unint64_t)behaviorForCaptureSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  return 0;
}

- (void)enumerateBlurrableSectionsIn:(CGRect)a3 using:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__PXPhotosSectionedLayout_enumerateBlurrableSectionsIn_using___block_invoke;
  v11[3] = &unk_1E513B940;
  v12 = v9;
  v10 = v9;
  -[PXPhotosSectionedLayout enumerateAssetsSectionSublayoutsInRect:usingBlock:](self, "enumerateAssetsSectionSublayoutsInRect:usingBlock:", v11, x, y, width, height);

}

- (void)setBlurIntensity:(double)a3 forSectionAt:(int64_t)a4
{
  void *v5;
  id v6;

  -[PXGLayout sublayoutAtIndex:loadIfNeeded:](self, "sublayoutAtIndex:loadIfNeeded:", a4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "px_assetsSectionLayout");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setBlurIntensity:", a3);
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;

  v14 = a3;
  if ((void *)PhotosViewModelObserverContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosSectionedLayout.m"), 1157, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((a4 & 1) != 0)
  {
    if (self->_isUpdatingSublayouts)
    {
      -[PXPhotosSectionedLayout _updateSublayoutsDataSource](self, "_updateSublayoutsDataSource");
    }
    else
    {
      -[PXPhotosSectionedLayout _invalidateSublayoutsDataSource](self, "_invalidateSublayoutsDataSource");
      if ((-[PXAssetsDataSource areAllSectionsConsideredAccurate](self->_assetsDataSource, "areAllSectionsConsideredAccurate") & 1) == 0)-[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
    }
  }
  if ((a4 & 0x144100000F06) == 0)
  {
LABEL_10:
    if ((a4 & 0x100000000000) == 0)
      goto LABEL_12;
    goto LABEL_11;
  }
  if (self->_isUpdatingSublayouts)
  {
    -[PXPhotosSectionedLayout _updateSublayoutsConfiguration](self, "_updateSublayoutsConfiguration");
    goto LABEL_10;
  }
  -[PXPhotosSectionedLayout _invalidateSublayoutsConfiguration](self, "_invalidateSublayoutsConfiguration");
  if ((a4 & 0x100000000000) != 0)
LABEL_11:
    -[PXPhotosSectionedLayout _invalidateSectionsBlur](self, "_invalidateSectionsBlur");
LABEL_12:
  if ((a4 & 0x14000) != 0)
  {
    -[PXPhotosSectionedLayout _invalidateSublayoutsSpec](self, "_invalidateSublayoutsSpec");
    -[PXPhotosSectionedLayout _invalidateSublayoutsConfiguration](self, "_invalidateSublayoutsConfiguration");
    if ((~(_DWORD)a4 & 0x4004000) == 0)
    {
      -[PXGLayout createAnimation](self, "createAnimation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setDuration:", 0.3);

    }
    -[PXGLayout rootLayout](self, "rootLayout");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "createAnchorForVisibleArea");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (id)objc_msgSend(v11, "autoInvalidate");

  }
  if ((a4 & 2) != 0)
    self->_dataSourceIdentifierOfCachedSectionsWithSelectedItems = *(_QWORD *)off_1E50B7E98;

}

- (id)axSpriteIndexes
{
  return objc_alloc_init(MEMORY[0x1E0CB36B8]);
}

- (PXPhotosViewModel)viewModel
{
  return self->_viewModel;
}

- (PXPhotosLayoutSpec)spec
{
  return self->_spec;
}

- (PXPhotosSectionHeaderLayoutProvider)headerLayoutProvider
{
  return self->_headerLayoutProvider;
}

- (PXPhotosSectionBodyLayoutProvider)bodyLayoutProvider
{
  return self->_bodyLayoutProvider;
}

- ($6FCFBD36564ECBB6D9D1614A84D6F83D)preferredCornerRadius
{
  $6FCFBD36564ECBB6D9D1614A84D6F83D result;

  *(_QWORD *)&result.var0.var1[2] = a2;
  *(_QWORD *)&result.var0.var0.var0 = self;
  return result;
}

- (CGRect)maskRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_maskRect.origin.x;
  y = self->_maskRect.origin.y;
  width = self->_maskRect.size.width;
  height = self->_maskRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- ($6FCFBD36564ECBB6D9D1614A84D6F83D)maskCornerRadius
{
  $6FCFBD36564ECBB6D9D1614A84D6F83D result;

  *(_QWORD *)&result.var0.var1[2] = a2;
  *(_QWORD *)&result.var0.var0.var0 = self;
  return result;
}

- (PXGItemPlacement)placementOverride
{
  return self->_placementOverride;
}

- (void)setPlacementOverride:(id)a3
{
  objc_storeStrong((id *)&self->_placementOverride, a3);
}

- (double)interSectionSpacing
{
  return self->_interSectionSpacing;
}

- (double)horizontalScrollingHintFactor
{
  return self->_horizontalScrollingHintFactor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placementOverride, 0);
  objc_storeStrong((id *)&self->_bodyLayoutProvider, 0);
  objc_storeStrong((id *)&self->_headerLayoutProvider, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_assetsDataSource, 0);
  objc_storeStrong((id *)&self->_sectionsBlurController, 0);
  objc_storeStrong((id *)&self->_cachedSectionsWithSelectedItems, 0);
}

uint64_t __62__PXPhotosSectionedLayout_enumerateBlurrableSectionsIn_using___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __81__PXPhotosSectionedLayout_assetSectionLayoutDidUpdateVisibleRectOvershootFactor___block_invoke(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, uint64_t a6, void *a7)
{
  CGFloat width;
  CGFloat height;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  CGRect v19;
  CGRect v20;

  v18 = a7;
  v19.origin.x = a2;
  v19.origin.y = a3;
  v19.size.width = a4;
  v19.size.height = a5;
  v20 = CGRectIntersection(v19, *(CGRect *)(a1 + 48));
  width = v20.size.width;
  height = v20.size.height;
  if (MEMORY[0x1A85CD5B8](v20.size.width, v20.size.height, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40)))
  {
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    *(CGFloat *)(v14 + 32) = width;
    *(CGFloat *)(v14 + 40) = height;
    objc_msgSend(v18, "px_assetsSectionLayout");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v17 = *(void **)(v16 + 40);
    *(_QWORD *)(v16 + 40) = v15;

  }
}

void __49__PXPhotosSectionedLayout__forceSectionIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB36B8];
  v4 = *(_QWORD *)(a1 + 40);
  v5 = a2;
  objc_msgSend(v3, "indexSetWithIndex:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v5, "forceAccurateSectionsIfNeeded:", v6);

  if ((_DWORD)v4)
    ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1160);
}

void __61__PXPhotosSectionedLayout_willRemoveSublayout_atIndex_flags___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "visibleAssetCollections");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObject:", *(_QWORD *)(a1 + 32));

}

void __80__PXPhotosSectionedLayout_didFaultInSublayout_atIndex_fromEstimatedContentSize___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "visibleAssetCollections");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", *(_QWORD *)(a1 + 32));

}

void __53__PXPhotosSectionedLayout__updateSublayoutTransforms__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  double v7;
  double v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  double v21;
  CGAffineTransform v22;
  _QWORD v23[4];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  double v27;
  CGAffineTransform v28;
  CGAffineTransform v29;
  CGAffineTransform v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  CGAffineTransform v40;

  v5 = a3;
  v39 = 0;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v6 = *(void **)(a1 + 32);
  if (v6)
  {
    objc_msgSend(v6, "geometryForSublayout:", v5);
    v7 = *(double *)&v34;
  }
  else
  {
    v7 = 0.0;
  }
  v8 = *(double *)(a1 + 40);
  v10 = *(_OWORD *)off_1E50B8368;
  v9 = *((_OWORD *)off_1E50B8368 + 1);
  v11 = *((_OWORD *)off_1E50B8368 + 2);
  *(_OWORD *)&v30.c = v9;
  *(_OWORD *)&v30.tx = v11;
  v12 = *((double *)off_1E50B8368 + 6);
  *(_OWORD *)&v29.a = v10;
  *(_OWORD *)&v29.c = v9;
  *(_OWORD *)&v29.tx = v11;
  *(_OWORD *)&v30.a = v10;
  if (v7 < v8)
  {
    v13 = *(double *)&v33 * *(double *)(a1 + 72);
    v14 = 0.5;
LABEL_8:
    *(_OWORD *)&v28.a = v10;
    *(_OWORD *)&v28.c = v9;
    *(_OWORD *)&v28.tx = v11;
    *(_OWORD *)&v40.a = v10;
    *(_OWORD *)&v40.c = v9;
    *(_OWORD *)&v40.tx = v11;
    CGAffineTransformTranslate(&v28, &v40, v13 * v14, 0.0);
    v15 = v12;
    v12 = v12 + 0.0;
    v30 = v28;
    goto LABEL_9;
  }
  if (v7 > v8)
  {
    v13 = *(double *)(a1 + 72) * *(double *)&v33;
    v14 = -0.5;
    goto LABEL_8;
  }
  *(_OWORD *)&v22.a = v10;
  *(_OWORD *)&v22.c = v9;
  *(_OWORD *)&v22.tx = v11;
  if (PXFloatApproximatelyEqualToFloat())
  {
    v20 = v33;
    v28 = v22;
    v40 = v22;
    CGAffineTransformTranslate(&v28, &v40, *(double *)&v33 * 0.5, -*((double *)&v33 + 1));
    v15 = v12 + 0.0;
    v29 = v28;
    v21 = *(double *)(a1 + 72);
    v40 = v28;
    CGAffineTransformScale(&v28, &v40, 1.0 - v21, 1.0 - v21);
    v29 = v28;
    v40 = v28;
    CGAffineTransformTranslate(&v28, &v40, *(double *)&v20 * -0.5, *((double *)&v20 + 1) + *((double *)&v20 + 1) * v21);
    v29 = v28;
  }
  else
  {
    v15 = v12;
  }
LABEL_9:
  v16 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "geometries");
  v17 = *(_OWORD *)&v29.tx;
  v18 = v16 + 136 * a2;
  *(_OWORD *)(v18 + 72) = *(_OWORD *)&v30.a;
  v19 = *(_OWORD *)&v30.tx;
  *(_OWORD *)(v18 + 88) = *(_OWORD *)&v30.c;
  *(_OWORD *)(v18 + 104) = v19;
  *(double *)(v18 + 120) = v12;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __53__PXPhotosSectionedLayout__updateSublayoutTransforms__block_invoke_2;
  v23[3] = &__block_descriptor_88_e93_v40__0q8_____CGSize_dd_dS_CGSize_dd____ddd_____CGAffineTransform_dddddd_d_d_16_____v_v_24_B32l;
  v24 = *(_OWORD *)&v29.a;
  v25 = *(_OWORD *)&v29.c;
  v26 = v17;
  v27 = v15;
  objc_msgSend(v5, "px_modifyAssetsSectionLayoutGeometry:", v23);

}

__n128 __53__PXPhotosSectionedLayout__updateSublayoutTransforms__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  __n128 result;
  __int128 v5;
  __int128 v6;

  v3 = a3 + 136 * a2;
  result = *(__n128 *)(a1 + 32);
  v5 = *(_OWORD *)(a1 + 48);
  v6 = *(_OWORD *)(a1 + 64);
  *(_QWORD *)(v3 + 120) = *(_QWORD *)(a1 + 80);
  *(_OWORD *)(v3 + 104) = v6;
  *(_OWORD *)(v3 + 88) = v5;
  *(__n128 *)(v3 + 72) = result;
  return result;
}

__n128 __47__PXPhotosSectionedLayout__updateCaptureSprite__block_invoke_2(__n128 *a1, uint64_t a2, float32x2_t *a3, uint64_t a4)
{
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat MidX;
  CGFloat MidY;
  CGFloat Height;
  float64x2_t v14;
  float v15;
  __n128 result;
  CGFloat Width;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;

  v7 = a1[2].n128_f64[0];
  v8 = a1[2].n128_f64[1];
  v9 = a1[3].n128_f64[0];
  v10 = a1[3].n128_f64[1];
  v18.origin.x = v7;
  v18.origin.y = v8;
  v18.size.width = v9;
  v18.size.height = v10;
  MidX = CGRectGetMidX(v18);
  v19.origin.x = v7;
  v19.origin.y = v8;
  v19.size.width = v9;
  v19.size.height = v10;
  MidY = CGRectGetMidY(v19);
  v20.origin.x = v7;
  v20.origin.y = v8;
  v20.size.width = v9;
  v20.size.height = v10;
  Width = CGRectGetWidth(v20);
  v21.origin.x = v7;
  v21.origin.y = v8;
  v21.size.width = v9;
  v21.size.height = v10;
  Height = CGRectGetHeight(v21);
  v14.f64[0] = Width;
  v14.f64[1] = Height;
  *(CGFloat *)a3 = MidX;
  *(CGFloat *)&a3[1] = MidY;
  a3[3] = vcvt_f32_f64(v14);
  a3[2] = (float32x2_t)0xBFF0000000000000;
  v15 = 1.0;
  if (!a1[5].n128_u8[0])
    v15 = 0.0;
  *(float *)a4 = v15;
  result = a1[4];
  *(__n128 *)(a4 + 36) = result;
  return result;
}

double __47__PXPhotosSectionedLayout__updateCaptureSprite__block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  _OWORD *v3;
  __int128 v4;
  _OWORD *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  double result;

  v3 = (_OWORD *)a3[2];
  v4 = *((_OWORD *)off_1E50B8358 + 1);
  *v3 = *(_OWORD *)off_1E50B8358;
  v3[1] = v4;
  v5 = (_OWORD *)a3[3];
  v6 = *((_OWORD *)off_1E50B83A0 + 1);
  *v5 = *(_OWORD *)off_1E50B83A0;
  v5[1] = v6;
  v7 = *((_OWORD *)off_1E50B83A0 + 5);
  v5[4] = *((_OWORD *)off_1E50B83A0 + 4);
  v5[5] = v7;
  v8 = *((_OWORD *)off_1E50B83A0 + 3);
  v5[2] = *((_OWORD *)off_1E50B83A0 + 2);
  v5[3] = v8;
  v9 = *((_OWORD *)off_1E50B83A0 + 9);
  v5[8] = *((_OWORD *)off_1E50B83A0 + 8);
  v5[9] = v9;
  v10 = *((_OWORD *)off_1E50B83A0 + 7);
  v5[6] = *((_OWORD *)off_1E50B83A0 + 6);
  v5[7] = v10;
  v11 = a3[4];
  *(_QWORD *)(v11 + 32) = *((_QWORD *)off_1E50B8398 + 4);
  v12 = *((_OWORD *)off_1E50B8398 + 1);
  *(_OWORD *)v11 = *(_OWORD *)off_1E50B8398;
  *(_OWORD *)(v11 + 16) = v12;
  v13 = a3[4];
  *(_BYTE *)(v13 + 1) = 9;
  __asm { FMOV            V0.2S, #1.0 }
  *(double *)(v13 + 8) = result;
  *(_BYTE *)(a3[4] + 34) = 8;
  return result;
}

void __57__PXPhotosSectionedLayout__updateSublayoutsConfiguration__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v10;
  uint64_t v11;
  char v12;
  _QWORD v13[2];
  int64x2_t v14;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "assetsDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "identifier");

  v9 = *(void **)(a1 + 32);
  v13[0] = v8;
  v13[1] = a2;
  v14 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  v10 = objc_msgSend(v9, "_configureSectionLayout:sectionIndexPath:", v6, v13);

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v11 + 24))
    v12 = 1;
  else
    v12 = v10;
  *(_BYTE *)(v11 + 24) = v12;
}

void __48__PXPhotosSectionedLayout__updateSublayoutsSpec__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = *(void **)(a1 + 32);
  v5 = a3;
  objc_msgSend(v4, "spec");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assetsSpec");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setSpec:", v9);
  objc_msgSend(v5, "headerLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "spec");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSpec:", v8);

  objc_msgSend(*(id *)(a1 + 32), "_updateSublayoutGridConfiguratorForLayout:", v5);
}

void __54__PXPhotosSectionedLayout__updateSublayoutsDataSource__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "sublayoutAtIndex:loadIfNeeded:", a2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("PXPhotosSectionedLayout.m"), 587, CFSTR("While updating sublayouts, got a change to section %lu that's already loaded."), a2);

  }
}

BOOL __54__PXPhotosSectionedLayout__updateSublayoutsDataSource__block_invoke_2(uint64_t a1, __int128 *a2, __int128 *a3)
{
  void *v5;
  __int128 v6;
  void *v7;
  void *v8;
  __int128 v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  BOOL v14;
  _BOOL8 v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;

  v5 = *(void **)(a1 + 32);
  v6 = a2[1];
  v18 = *a2;
  v19 = v6;
  objc_msgSend(v5, "assetAtItemIndexPath:", &v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 40);
  v9 = a3[1];
  v18 = *a3;
  v19 = v9;
  objc_msgSend(v8, "assetAtItemIndexPath:", &v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v7;
  v12 = v10;
  v13 = v12;
  if (v11 == v12)
  {
    v15 = 0;
  }
  else
  {
    if (v11)
      v14 = v12 == 0;
    else
      v14 = 1;
    if (v14)
    {
      v15 = 1;
    }
    else
    {
      v16 = objc_msgSend(v11, "isContentEqualTo:", v12);
      if (!v16)
        v16 = objc_msgSend(v13, "isContentEqualTo:", v11);
      v15 = v16 != 2;
    }
  }

  return v15;
}

void __54__PXPhotosSectionedLayout__updateSublayoutsDataSource__block_invoke_3(uint64_t a1, uint64_t a2)
{
  int v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;

  v4 = objc_msgSend(*(id *)(a1 + 32), "_shouldFaultInSection:inDataSource:", a2, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "sublayoutProviderAtIndex:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 48), "sublayoutAtIndex:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (((v4 ^ (v5 == 0)) & 1) != 0)
      return;
    goto LABEL_8;
  }
  if (v5)
    v7 = 0;
  else
    v7 = v4;
  if (v7 == 1)
  {
LABEL_8:
    objc_msgSend(*(id *)(a1 + 32), "removeSublayoutsInRange:", a2, 1);
    if (v4)
      v8 = *(_QWORD *)(a1 + 32);
    else
      v8 = 0;
    objc_msgSend(*(id *)(a1 + 32), "insertSublayoutProvider:inRange:", v8, a2, 1);
  }
}

void __54__PXPhotosSectionedLayout__updateSublayoutsDataSource__block_invoke_4(id *a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  int64x2_t v19;

  v5 = a3;
  v6 = objc_msgSend(a1[4], "containsIndex:", a2);
  v7 = objc_msgSend(a1[5], "identifier");
  objc_msgSend(v5, "setDataSource:section:", a1[5], a2);
  objc_msgSend(v5, "bodyContentLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(a1[6], "bodyLayoutProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = a1[6];
    objc_msgSend(v5, "bodyContentLayout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = a1[5];
    v17 = v7;
    v18 = a2;
    v19 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    objc_msgSend(v9, "sectionedLayout:bodyLayout:didChangeDataSource:sectionIndexPath:hasSectionChanges:", v10, v11, v12, &v17, v6);

  }
  objc_msgSend(v5, "headerLayout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(a1[6], "headerLayoutProvider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = a1[5];
    v15 = a1[6];
    v17 = v7;
    v18 = a2;
    v19 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    objc_msgSend(v14, "sectionedLayout:headerLayout:didChangeDataSource:sectionIndexPath:hasSectionChanges:", v15, v13, v16, &v17, v6);

  }
}

void __68__PXPhotosSectionedLayout__configureSectionLayout_sectionIndexPath___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_performAddActionForSectionLayout:", v3);

}

uint64_t __76__PXPhotosSectionedLayout_enumerateSectionBoundariesWithOptions_usingBlock___block_invoke(uint64_t a1, __n128 a2, __n128 a3, __n128 a4, __n128 a5, uint64_t a6, _QWORD *a7)
{
  a2.n128_u64[0] = a7[6];
  a3.n128_u64[0] = a7[7];
  a4.n128_u64[0] = a7[4];
  a5.n128_u64[0] = a7[5];
  return (*(uint64_t (**)(__n128, __n128, __n128, __n128))(*(_QWORD *)(a1 + 32) + 16))(a2, a3, a4, a5);
}

void __77__PXPhotosSectionedLayout_enumerateAssetsSectionSublayoutsInRect_usingBlock___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5, uint64_t a6, void *a7)
{
  void *v12;
  void *v13;

  objc_msgSend(a7, "px_assetsSectionLayout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = v12;
    (*(void (**)(double, double, double, double))(*(_QWORD *)(a1 + 32) + 16))(a2, a3, a4, a5);
    v12 = v13;
  }

}

void __70__PXPhotosSectionedLayout_enumerateAssetsSectionSublayoutsUsingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "px_assetsSectionLayout");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v4 = v5;
  }

}

void __61__PXPhotosSectionedLayout__performAddActionForSectionLayout___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PLGridZeroGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "assetCollection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412290;
      v14 = v8;
      v9 = "Add action succeeded for asset collection %@";
      v10 = v7;
      v11 = OS_LOG_TYPE_DEFAULT;
      v12 = 12;
LABEL_6:
      _os_log_impl(&dword_1A6789000, v10, v11, v9, (uint8_t *)&v13, v12);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "assetCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412546;
    v14 = v8;
    v15 = 2112;
    v16 = v5;
    v9 = "Add action failed for asset collection %@ with error %@";
    v10 = v7;
    v11 = OS_LOG_TYPE_ERROR;
    v12 = 22;
    goto LABEL_6;
  }

}

void __80__PXPhotosSectionedLayout_enumerateItemsGeometriesInRect_dataSource_usingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v6;
  id v7;

  v6 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a3, "bodyItemsGeometry");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, uint64_t, uint64_t))(v6 + 16))(v6, v7, a2, a4);

}

void __73__PXPhotosSectionedLayout_presentedItemsGeometryForSection_inDataSource___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  if (*(_QWORD *)(a1 + 40) == a2)
  {
    objc_msgSend(a3, "bodyItemsGeometry");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    *a4 = 1;
  }
}

void __55__PXPhotosSectionedLayout_topmostHeaderSnapshotInRect___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5, uint64_t a6, void *a7, _BYTE *a8)
{
  id v12;
  id v13;

  v12 = a7;
  if (a5 > 0.0)
  {
    v13 = v12;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a7);
    v12 = v13;
    *a8 = 1;
  }

}

void __58__PXPhotosSectionedLayout_assetsIteratorForContentInRect___block_invoke(double *a1, uint64_t a2, void *a3)
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *aBlock;

  v4 = (void *)*((_QWORD *)a1 + 4);
  v5 = a1[6];
  v6 = a1[7];
  v7 = a1[8];
  v8 = a1[9];
  v9 = a3;
  objc_msgSend(v4, "convertRect:toDescendantLayout:", v9, v5, v6, v7, v8);
  objc_msgSend(v9, "assetsIteratorForContentInRect:");
  aBlock = (void *)objc_claimAutoreleasedReturnValue();

  v10 = aBlock;
  if (aBlock)
  {
    v11 = (void *)*((_QWORD *)a1 + 5);
    v12 = _Block_copy(aBlock);
    objc_msgSend(v11, "addObject:", v12);

    v10 = aBlock;
  }

}

void __58__PXPhotosSectionedLayout_assetsIteratorForContentInRect___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__PXPhotosSectionedLayout_assetsIteratorForContentInRect___block_invoke_3;
  v6[3] = &unk_1E513B8A0;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

}

uint64_t __58__PXPhotosSectionedLayout_assetsIteratorForContentInRect___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32));
}

void __68__PXPhotosSectionedLayout_assetCollectionsIteratorForContentInRect___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__PXPhotosSectionedLayout_assetCollectionsIteratorForContentInRect___block_invoke_2;
  v6[3] = &unk_1E513B850;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

}

uint64_t __68__PXPhotosSectionedLayout_assetCollectionsIteratorForContentInRect___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __63__PXPhotosSectionedLayout_locationNamesFutureForContentInRect___block_invoke(double *a1, uint64_t a2, void *a3)
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *aBlock;

  v4 = (void *)*((_QWORD *)a1 + 4);
  v5 = a1[6];
  v6 = a1[7];
  v7 = a1[8];
  v8 = a1[9];
  v9 = a3;
  objc_msgSend(v4, "convertRect:toDescendantLayout:", v9, v5, v6, v7, v8);
  objc_msgSend(v9, "locationNamesFutureForContentInRect:");
  aBlock = (void *)objc_claimAutoreleasedReturnValue();

  v10 = aBlock;
  if (aBlock)
  {
    v11 = (void *)*((_QWORD *)a1 + 5);
    v12 = _Block_copy(aBlock);
    objc_msgSend(v11, "addObject:", v12);

    v10 = aBlock;
  }

}

id __63__PXPhotosSectionedLayout_locationNamesFutureForContentInRect___block_invoke_2(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7) + 16))(*(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObjectsFromArray:", v8, (_QWORD)v11);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  PXArrayFromFrequencySortAndDeduplicationOfNSStringSet();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __67__PXPhotosSectionedLayout_dateIntervalFutureForContentInRect_type___block_invoke(double *a1, uint64_t a2, void *a3)
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *aBlock;

  v4 = (void *)*((_QWORD *)a1 + 4);
  v5 = a1[6];
  v6 = a1[7];
  v7 = a1[8];
  v8 = a1[9];
  v9 = a3;
  objc_msgSend(v4, "convertRect:toDescendantLayout:", v9, v5, v6, v7, v8);
  objc_msgSend(v9, "dateIntervalFutureForContentInRect:type:", *((_QWORD *)a1 + 10));
  aBlock = (void *)objc_claimAutoreleasedReturnValue();

  v10 = aBlock;
  if (aBlock)
  {
    v11 = (void *)*((_QWORD *)a1 + 5);
    v12 = _Block_copy(aBlock);
    objc_msgSend(v11, "addObject:", v12);

    v10 = aBlock;
  }

}

id __67__PXPhotosSectionedLayout_dateIntervalFutureForContentInRect_type___block_invoke_2(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v2)
  {
    v3 = v2;
    v4 = 0;
    v5 = 0;
    v6 = *(_QWORD *)v16;
    do
    {
      v7 = 0;
      v8 = v4;
      v9 = v5;
      do
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v1);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v7) + 16))();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v8;
        v14 = v9;
        objc_msgSend(MEMORY[0x1E0C99D68], "px_unionStartDate:endDate:withDateInterval:", &v14, &v13, v10);
        v5 = v14;

        v4 = v13;
        ++v7;
        v8 = v4;
        v9 = v5;
      }
      while (v3 != v7);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v3);

    v11 = 0;
    if (v5 && v4)
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v5, v4);
  }
  else
  {

    v5 = 0;
    v4 = 0;
    v11 = 0;
  }

  return v11;
}

@end
