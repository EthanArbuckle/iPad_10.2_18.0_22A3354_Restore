@implementation PXCuratedLibraryCardSectionBodyLayout

- (PXCuratedLibraryCardSectionBodyLayout)init
{
  PXCuratedLibraryCardSectionBodyLayout *v2;
  PXGLayoutGuide *v3;
  PXGLayoutGuide *assetLayoutGuide;
  uint64_t v5;
  NSMutableIndexSet *axSpriteIndexes;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXCuratedLibraryCardSectionBodyLayout;
  v2 = -[PXGLayout init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(PXGLayoutGuide);
    assetLayoutGuide = v2->_assetLayoutGuide;
    v2->_assetLayoutGuide = v3;

    v2->_assetSpriteIndexRange = (_PXGSpriteIndexRange)0x100000000;
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndex:", v2->_assetSpriteIndexRange.location);
    axSpriteIndexes = v2->_axSpriteIndexes;
    v2->_axSpriteIndexes = (NSMutableIndexSet *)v5;

  }
  return v2;
}

- (CGRect)assetFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  -[PXGLayout referenceSize](self, "referenceSize");
  v5 = v4;
  v7 = v6;
  v8 = v2;
  v9 = v3;
  result.size.height = v7;
  result.size.width = v5;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (void)update
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  unint64_t v5;
  $F40CD077B40800501ED060B808F886F7 *p_postUpdateFlags;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  objc_super v18;

  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.willPerformUpdate = 0;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibraryCardSectionBodyLayout update]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("PXCuratedLibraryCardSectionBodyLayout.m"), 69, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

      needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if ((needsUpdate & 1) != 0)
    {
      p_updateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      -[PXCuratedLibraryCardSectionBodyLayout _updateSprites](self, "_updateSprites");
      if (!p_updateFlags->isPerformingUpdate)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibraryCardSectionBodyLayout update]");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("PXCuratedLibraryCardSectionBodyLayout.m"), 73, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

      }
    }
    v5 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 2uLL;
    if ((v5 & 2) != 0)
    {
      p_updateFlags->needsUpdate = v5 & 0xFFFFFFFFFFFFFFFDLL;
      -[PXCuratedLibraryCardSectionBodyLayout _updateAXSprites](self, "_updateAXSprites");
      v5 = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 0;
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibraryCardSectionBodyLayout update]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("PXCuratedLibraryCardSectionBodyLayout.m"), 76, CFSTR("still needing to update %lu after update pass"), p_updateFlags->needsUpdate);

    }
  }
  v18.receiver = self;
  v18.super_class = (Class)PXCuratedLibraryCardSectionBodyLayout;
  -[PXGLayout update](&v18, sel_update);
  p_postUpdateFlags = &self->_postUpdateFlags;
  self->_postUpdateFlags.willPerformUpdate = 0;
  if (self->_postUpdateFlags.needsUpdate)
  {
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
      self->_postUpdateFlags.updated = 0;
      self->_postUpdateFlags.isPerformingUpdate = 0;
LABEL_14:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibraryCardSectionBodyLayout update]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("PXCuratedLibraryCardSectionBodyLayout.m"), 80, CFSTR("still needing to update %lu after update pass"), p_postUpdateFlags->needsUpdate);

      return;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibraryCardSectionBodyLayout update]");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("PXCuratedLibraryCardSectionBodyLayout.m"), 78, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_postUpdateFlags.isPerformingUpdate"));

    v15 = p_postUpdateFlags->needsUpdate;
    p_postUpdateFlags->updated = 0;
    p_postUpdateFlags->isPerformingUpdate = 0;
    if (v15)
      goto LABEL_14;
  }
}

- (void)_updateSprites
{
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  PXDisplayAsset *v14;
  PXDisplayAsset *keyAsset;
  PXDisplayAsset *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int v26;
  _PXGSpriteIndexRange assetSpriteIndexRange;
  uint64_t v28;
  id v29;
  double MaxY;
  double v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  CGFloat v37;
  CGFloat v38;
  _QWORD v39[9];
  _QWORD v40[4];
  id v41;
  PXCuratedLibraryCardSectionBodyLayout *v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  double v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  _BYTE v52[32];
  uint8_t buf[4];
  void *v54;
  uint64_t v55;
  CGRect v56;

  v55 = *MEMORY[0x1E0C80C00];
  -[PXCuratedLibraryCardSectionBodyLayout spec](self, "spec");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryCardSectionBodyLayout.m"), 85, CFSTR("missing spec on %@"), self);

  }
  -[PXGLayout displayScale](self, "displayScale");
  v35 = v5;
  -[PXGLayout referenceSize](self, "referenceSize");
  v36 = v6;
  -[PXCuratedLibraryCardSectionBodyLayout assetFrame](self, "assetFrame");
  v37 = v8;
  v38 = v7;
  v10 = v9;
  v12 = v11;
  -[PXCuratedLibraryCardSectionBodyLayout keyAssetsFetchResult](self, "keyAssetsFetchResult");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstObject");
  v14 = (PXDisplayAsset *)objc_claimAutoreleasedReturnValue();
  keyAsset = self->_keyAsset;
  self->_keyAsset = v14;

  v16 = self->_keyAsset;
  if (!v16)
  {
    -[PXCuratedLibraryCardSectionBodyLayout dataSource](self, "dataSource");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibraryCardSectionBodyLayout sectionIndexPath](self, "sectionIndexPath");
    objc_msgSend(v17, "assetCollectionAtSectionIndexPath:", v52);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412290;
      v54 = v18;
      _os_log_fault_impl(&dword_1A6789000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Empty key asset fetch result for asset collection: %@", buf, 0xCu);
    }

    v16 = self->_keyAsset;
  }
  PXSizeGetAspectRatio();
  v20 = PXCuratedLibraryBestCropRectForAssetInZoomLevel(v16, -[PXCuratedLibraryCardSectionBodyLayout zoomLevel](self, "zoomLevel"), 0, v19);
  v22 = v21;
  v24 = v23;
  v34 = v25;
  v26 = -[PXGLayout numberOfSprites](self, "numberOfSprites");
  assetSpriteIndexRange = self->_assetSpriteIndexRange;
  if (v26 < assetSpriteIndexRange.length + assetSpriteIndexRange.location)
  {
    -[PXGLayout addSpritesInRange:initialState:](self, "addSpritesInRange:initialState:", *(_QWORD *)&self->_assetSpriteIndexRange, 0);
    assetSpriteIndexRange = self->_assetSpriteIndexRange;
  }
  v28 = MEMORY[0x1E0C809B0];
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __55__PXCuratedLibraryCardSectionBodyLayout__updateSprites__block_invoke;
  v40[3] = &unk_1E5120C28;
  v43 = v38;
  v44 = v37;
  v45 = v10;
  v46 = v12;
  v47 = v20;
  v48 = v22;
  v49 = v24;
  v50 = v34;
  v41 = v4;
  v42 = self;
  v51 = v35;
  v29 = v4;
  -[PXGLayout modifySpritesInRange:state:](self, "modifySpritesInRange:state:", assetSpriteIndexRange, v40);
  v56.origin.x = v38;
  v56.origin.y = v37;
  v56.size.width = v10;
  v56.size.height = v12;
  MaxY = CGRectGetMaxY(v56);
  -[PXGLayout setContentSize:](self, "setContentSize:", v36, MaxY);
  objc_msgSend(v29, "distanceToNextLayout");
  -[PXGLayout setLastBaseline:](self, "setLastBaseline:", MaxY + v31);
  -[PXCuratedLibraryCardSectionBodyLayout assetLayoutGuide](self, "assetLayoutGuide");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v28;
  v39[1] = 3221225472;
  v39[2] = __55__PXCuratedLibraryCardSectionBodyLayout__updateSprites__block_invoke_2;
  v39[3] = &unk_1E51260F8;
  *(CGFloat *)&v39[5] = v38;
  *(CGFloat *)&v39[6] = v37;
  *(CGFloat *)&v39[7] = v10;
  *(CGFloat *)&v39[8] = v12;
  v39[4] = self;
  objc_msgSend(v32, "performChanges:", v39);

}

- (void)_updateAXSprites
{
  uint64_t v3;
  NSMutableIndexSet *axSpriteIndexes;
  int64_t v5;
  NSMutableIndexSet *v6;

  if (-[PXCuratedLibraryCardSectionBodyLayout zoomLevel](self, "zoomLevel") == 1
    && -[PXCuratedLibraryCardSectionBodyLayout isSkimming](self, "isSkimming"))
  {
    v3 = -[PXCuratedLibraryCardSectionBodyLayout currentSkimmingIndex](self, "currentSkimmingIndex");
    axSpriteIndexes = self->_axSpriteIndexes;
    if (v3 < 1)
      -[NSMutableIndexSet removeIndex:](axSpriteIndexes, "removeIndex:", 1000);
    else
      -[NSMutableIndexSet addIndex:](axSpriteIndexes, "addIndex:", 1000);
    v5 = -[PXCuratedLibraryCardSectionBodyLayout maxSkimmingIndex](self, "maxSkimmingIndex");
    v6 = self->_axSpriteIndexes;
    if (v3 >= v5)
      -[NSMutableIndexSet removeIndex:](v6, "removeIndex:", 1001);
    else
      -[NSMutableIndexSet addIndex:](v6, "addIndex:", 1001);
  }
}

- (id)axVisibleSpriteIndexes
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  NSObject *v7;
  void *v8;
  uint8_t v10[16];

  -[PXCuratedLibraryCardSectionBodyLayout axSpriteIndexes](self, "axSpriteIndexes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "removeIndex:", 1000);
  objc_msgSend(v4, "removeIndex:", 1001);
  -[PXGLayout spriteDataStore](self, "spriteDataStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "lastIndex") != 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = objc_msgSend(v4, "lastIndex");
    if (v6 > objc_msgSend(v5, "count"))
    {
      PXAssertGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v10 = 0;
        _os_log_error_impl(&dword_1A6789000, v7, OS_LOG_TYPE_ERROR, "Invalid sprite index. Is this a real sprite? If not, please override axVisibleSpriteIndexes.", v10, 2u);
      }

    }
  }
  -[PXGLayout visibleRect](self, "visibleRect");
  objc_msgSend(v5, "spriteAtIndexes:inRect:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (PXCuratedLibrarySectionGeometryDescriptor)presentedGeometryDescriptor
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
  PXCuratedLibrarySectionGeometryDescriptor *v12;
  void *v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  PXCuratedLibrarySectionGeometryDescriptor *v18;

  -[PXGLayout contentSize](self, "contentSize");
  -[PXCuratedLibraryCardSectionBodyLayout spec](self, "spec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "padding");
  PXEdgeInsetsInsetRect();
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = [PXCuratedLibrarySectionGeometryDescriptor alloc];
  -[PXCuratedLibraryCardSectionBodyLayout spec](self, "spec");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "cornerRadius");
  v18 = -[PXCuratedLibrarySectionGeometryDescriptor initWithSectionRect:headerRect:keyAssetRect:headerCornerRadius:headerAsset:](v12, "initWithSectionRect:headerRect:keyAssetRect:headerCornerRadius:headerAsset:", self->_keyAsset, v5, v7, v9, v11, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24), *(_QWORD *)&v5, *(_QWORD *)&v7, *(_QWORD *)&v9, *(_QWORD *)&v11, __PAIR64__(v15, v14), __PAIR64__(v17, v16));

  return v18;
}

- (id)layoutForItemChanges
{
  return 0;
}

- (void)applySpriteChangeDetails:(id)a3 countAfterChanges:(unsigned int)a4 initialState:(id)a5 modifyState:(id)a6
{
  uint64_t v8;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  objc_super v18;

  v8 = *(_QWORD *)&a4;
  v10 = a3;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v10, "removedIndexes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "insertedIndexes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v13, "isEqualToIndexSet:", v14))
    goto LABEL_6;
  objc_msgSend(v10, "changedIndexes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "count"))
  {

LABEL_6:
    goto LABEL_7;
  }
  objc_msgSend(v10, "removedIndexes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  if (v17 == 1)
  {
    objc_msgSend(v10, "insertedIndexes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(off_1E50B1608, "changeDetailsWithChangedIndexes:", v13);
    v14 = v10;
    v10 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
LABEL_7:
  v18.receiver = self;
  v18.super_class = (Class)PXCuratedLibraryCardSectionBodyLayout;
  -[PXGLayout applySpriteChangeDetails:countAfterChanges:initialState:modifyState:](&v18, sel_applySpriteChangeDetails_countAfterChanges_initialState_modifyState_, v10, v8, v11, v12);

}

- (void)setDataSource:(id)a3 section:(int64_t)a4
{
  id v7;
  id v8;

  v7 = a3;
  if (*(_OWORD *)&self->_section != __PAIR128__((unint64_t)v7, a4))
  {
    v8 = v7;
    objc_storeStrong((id *)&self->_dataSource, a3);
    self->_section = a4;
    -[PXCuratedLibraryCardSectionBodyLayout _updateKeyAssetFetchResultWithDataSource:section:](self, "_updateKeyAssetFetchResultWithDataSource:section:", v8, a4);
    v7 = v8;
  }

}

- (void)_updateKeyAssetFetchResultWithDataSource:(id)a3 section:(int64_t)a4
{
  id v6;
  int64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 isPerformingUpdate;
  uint64_t v19;
  uint64_t v20;
  _BOOL4 willPerformUpdate;
  _BOOL4 v22;
  void *v23;
  void *v24;
  int64x2_t v25;
  int64_t v26;
  int64_t v27;
  int64x2_t v28;

  v6 = a3;
  v7 = objc_msgSend(v6, "identifier");
  v26 = v7;
  v27 = a4;
  v25 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  v28 = v25;
  objc_msgSend(v6, "keyAssetsInSectionIndexPath:", &v26);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "count"))
  {
    v26 = v7;
    v27 = a4;
    v28 = v25;
    objc_msgSend(v6, "assetsInSectionIndexPath:", &v26);
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }
  objc_msgSend(v8, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXDisplayAssetFetchResult firstObject](self->_keyAssetsFetchResult, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10;
  v13 = v11;
  if (v12 == v13)
  {

    goto LABEL_13;
  }
  v14 = v13;
  if (!v12 || !v13)
  {

LABEL_12:
    ++self->_assetVersion;
    goto LABEL_13;
  }
  v15 = objc_msgSend(v12, "isContentEqualTo:", v13);
  if (!v15)
    v15 = objc_msgSend(v14, "isContentEqualTo:", v12);

  if (v15 != 2)
    goto LABEL_12;
LABEL_13:
  self->_sectionIndexPath.dataSourceIdentifier = v7;
  self->_sectionIndexPath.section = a4;
  *(int64x2_t *)&self->_sectionIndexPath.item = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  objc_storeStrong((id *)&self->_keyAssetsFetchResult, v8);
  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  isPerformingUpdate = self->_updateFlags.isPerformingUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_19:
      v19 = needsUpdate | 1;
      p_updateFlags->needsUpdate = v19;
      goto LABEL_20;
    }
LABEL_18:
    if ((self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibraryCardSectionBodyLayout _updateKeyAssetFetchResultWithDataSource:section:]");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, CFSTR("PXCuratedLibraryCardSectionBodyLayout.m"), 204, CFSTR("invalidating %lu after it already has been updated"), 1);
      goto LABEL_34;
    }
    goto LABEL_19;
  }
  if (self->_updateFlags.isPerformingUpdate)
  {
    isPerformingUpdate = 1;
    goto LABEL_18;
  }
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 1;
  if (willPerformUpdate)
  {
    v20 = 3;
    goto LABEL_23;
  }
  -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  v19 = p_updateFlags->needsUpdate;
  isPerformingUpdate = self->_updateFlags.isPerformingUpdate;
  if (p_updateFlags->needsUpdate)
  {
LABEL_20:
    if (!isPerformingUpdate)
    {
LABEL_22:
      v20 = v19 | 2;
LABEL_23:
      p_updateFlags->needsUpdate = v20;
      goto LABEL_24;
    }
    goto LABEL_21;
  }
  if (self->_updateFlags.isPerformingUpdate)
  {
    v19 = 0;
LABEL_21:
    if ((self->_updateFlags.updated & 2) == 0)
      goto LABEL_22;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibraryCardSectionBodyLayout _updateKeyAssetFetchResultWithDataSource:section:]");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, CFSTR("PXCuratedLibraryCardSectionBodyLayout.m"), 205, CFSTR("invalidating %lu after it already has been updated"), 2);
LABEL_34:

    abort();
  }
  v22 = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 2;
  if (!v22)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
LABEL_24:

}

- (void)setIsSkimming:(BOOL)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  int isPerformingUpdate;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 willPerformUpdate;
  _BOOL4 v10;
  void *v11;
  void *v12;

  if (self->_isSkimming != a3)
  {
    self->_isSkimming = a3;
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    isPerformingUpdate = self->_updateFlags.isPerformingUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_8:
        v7 = needsUpdate | 1;
        p_updateFlags->needsUpdate = v7;
        goto LABEL_9;
      }
LABEL_7:
      if ((self->_updateFlags.updated & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibraryCardSectionBodyLayout setIsSkimming:]");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("PXCuratedLibraryCardSectionBodyLayout.m"), 213, CFSTR("invalidating %lu after it already has been updated"), 1);
        goto LABEL_23;
      }
      goto LABEL_8;
    }
    if (self->_updateFlags.isPerformingUpdate)
    {
      isPerformingUpdate = 1;
      goto LABEL_7;
    }
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 1;
    if (willPerformUpdate)
    {
      v8 = 3;
      goto LABEL_12;
    }
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
    v7 = p_updateFlags->needsUpdate;
    isPerformingUpdate = p_updateFlags->isPerformingUpdate;
    if (p_updateFlags->needsUpdate)
    {
LABEL_9:
      if (!isPerformingUpdate)
      {
LABEL_11:
        v8 = v7 | 2;
LABEL_12:
        p_updateFlags->needsUpdate = v8;
        return;
      }
      goto LABEL_10;
    }
    if (p_updateFlags->isPerformingUpdate)
    {
      v7 = 0;
LABEL_10:
      if ((p_updateFlags->updated & 2) == 0)
        goto LABEL_11;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibraryCardSectionBodyLayout setIsSkimming:]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("PXCuratedLibraryCardSectionBodyLayout.m"), 214, CFSTR("invalidating %lu after it already has been updated"), 2);
LABEL_23:

      abort();
    }
    v10 = p_updateFlags->willPerformUpdate;
    p_updateFlags->needsUpdate = 2;
    if (!v10)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (void)setSkimmingIndexPaths:(id)a3
{
  PXIndexPathSet *v5;
  char v6;
  PXIndexPathSet *v7;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v11;
  void *v12;
  PXIndexPathSet *v13;

  v13 = (PXIndexPathSet *)a3;
  v5 = self->_skimmingIndexPaths;
  if (v5 == v13)
  {

LABEL_10:
    v7 = v13;
    goto LABEL_11;
  }
  v6 = -[PXIndexPathSet isEqual:](v13, "isEqual:", v5);

  v7 = v13;
  if ((v6 & 1) == 0)
  {
    objc_storeStrong((id *)&self->_skimmingIndexPaths, a3);
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_9:
        p_updateFlags->needsUpdate = needsUpdate | 2;
        goto LABEL_10;
      }
    }
    else if (!self->_updateFlags.isPerformingUpdate)
    {
      willPerformUpdate = self->_updateFlags.willPerformUpdate;
      p_updateFlags->needsUpdate = 2;
      v7 = v13;
      if (willPerformUpdate)
        goto LABEL_11;
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
      goto LABEL_10;
    }
    if ((self->_updateFlags.updated & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibraryCardSectionBodyLayout setSkimmingIndexPaths:]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("PXCuratedLibraryCardSectionBodyLayout.m"), 222, CFSTR("invalidating %lu after it already has been updated"), 2);

      abort();
    }
    goto LABEL_9;
  }
LABEL_11:

}

- (void)setMaxSkimmingIndex:(int64_t)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;

  if (self->_maxSkimmingIndex != a3)
  {
    self->_maxSkimmingIndex = a3;
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 1;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibraryCardSectionBodyLayout setMaxSkimmingIndex:]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXCuratedLibraryCardSectionBodyLayout.m"), 230, CFSTR("invalidating %lu after it already has been updated"), 1);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 1;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (void)setCurrentSkimmingIndex:(int64_t)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  int isPerformingUpdate;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 willPerformUpdate;
  _BOOL4 v10;
  void *v11;
  void *v12;

  if (self->_currentSkimmingIndex != a3)
  {
    self->_currentSkimmingIndex = a3;
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    isPerformingUpdate = self->_updateFlags.isPerformingUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_8:
        v7 = needsUpdate | 1;
        p_updateFlags->needsUpdate = v7;
        goto LABEL_9;
      }
LABEL_7:
      if ((self->_updateFlags.updated & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibraryCardSectionBodyLayout setCurrentSkimmingIndex:]");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("PXCuratedLibraryCardSectionBodyLayout.m"), 238, CFSTR("invalidating %lu after it already has been updated"), 1);
        goto LABEL_23;
      }
      goto LABEL_8;
    }
    if (self->_updateFlags.isPerformingUpdate)
    {
      isPerformingUpdate = 1;
      goto LABEL_7;
    }
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 1;
    if (willPerformUpdate)
    {
      v8 = 3;
      goto LABEL_12;
    }
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
    v7 = p_updateFlags->needsUpdate;
    isPerformingUpdate = p_updateFlags->isPerformingUpdate;
    if (p_updateFlags->needsUpdate)
    {
LABEL_9:
      if (!isPerformingUpdate)
      {
LABEL_11:
        v8 = v7 | 2;
LABEL_12:
        p_updateFlags->needsUpdate = v8;
        return;
      }
      goto LABEL_10;
    }
    if (p_updateFlags->isPerformingUpdate)
    {
      v7 = 0;
LABEL_10:
      if ((p_updateFlags->updated & 2) == 0)
        goto LABEL_11;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibraryCardSectionBodyLayout setCurrentSkimmingIndex:]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("PXCuratedLibraryCardSectionBodyLayout.m"), 239, CFSTR("invalidating %lu after it already has been updated"), 2);
LABEL_23:

      abort();
    }
    v10 = p_updateFlags->willPerformUpdate;
    p_updateFlags->needsUpdate = 2;
    if (!v10)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (void)setIsSelected:(BOOL)a3
{
  id v4;

  if (self->_isSelected != a3)
  {
    self->_isSelected = a3;
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
    -[PXGLayout axGroup](self, "axGroup");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidateLeafs");

  }
}

- (void)setSpec:(id)a3
{
  PXCuratedLibraryCardSectionBodyLayoutSpec *v5;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v9;
  void *v10;
  PXCuratedLibraryCardSectionBodyLayoutSpec *v11;

  v5 = (PXCuratedLibraryCardSectionBodyLayoutSpec *)a3;
  if (self->_spec != v5)
  {
    v11 = v5;
    objc_storeStrong((id *)&self->_spec, a3);
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 1;
LABEL_8:
        v5 = v11;
        goto LABEL_9;
      }
    }
    else if (!self->_updateFlags.isPerformingUpdate)
    {
      willPerformUpdate = self->_updateFlags.willPerformUpdate;
      p_updateFlags->needsUpdate = 1;
      v5 = v11;
      if (willPerformUpdate)
        goto LABEL_9;
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
      goto LABEL_8;
    }
    if ((self->_updateFlags.updated & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibraryCardSectionBodyLayout setSpec:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("PXCuratedLibraryCardSectionBodyLayout.m"), 256, CFSTR("invalidating %lu after it already has been updated"), 1);

      abort();
    }
    goto LABEL_7;
  }
LABEL_9:

}

- (void)referenceSizeDidChange
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXCuratedLibraryCardSectionBodyLayout;
  -[PXGLayout referenceSizeDidChange](&v8, sel_referenceSizeDidChange);
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
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibraryCardSectionBodyLayout referenceSizeDidChange]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXCuratedLibraryCardSectionBodyLayout.m"), 263, CFSTR("invalidating %lu after it already has been updated"), 1);

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

- (void)displayScaleDidChange
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXCuratedLibraryCardSectionBodyLayout;
  -[PXGLayout displayScaleDidChange](&v8, sel_displayScaleDidChange);
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
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibraryCardSectionBodyLayout displayScaleDidChange]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXCuratedLibraryCardSectionBodyLayout.m"), 268, CFSTR("invalidating %lu after it already has been updated"), 1);

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

- (void)enumerateVisibleAnchoringSpriteIndexesUsingBlock:(id)a3
{
  char v3;

  if (self->_assetSpriteIndexRange.length)
  {
    v3 = 0;
    (*((void (**)(id, _QWORD, uint64_t, char *))a3 + 2))(a3, self->_assetSpriteIndexRange.location, 1, &v3);
  }
}

- (id)objectReferenceForSpriteIndex:(unsigned int)a3
{
  _PXGSpriteIndexRange *p_assetSpriteIndexRange;
  void *v5;
  uint64_t v6;
  int64_t v7;
  uint64_t location;
  void *v9;
  _QWORD v11[4];

  p_assetSpriteIndexRange = &self->_assetSpriteIndexRange;
  if (!self->_assetSpriteIndexRange.length)
    return 0;
  -[PXCuratedLibraryCardSectionBodyLayout dataSource](self, "dataSource", *(_QWORD *)&a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "identifier");
  v7 = -[PXCuratedLibraryCardSectionBodyLayout section](self, "section");
  location = p_assetSpriteIndexRange->location;
  v11[0] = v6;
  v11[1] = v7;
  v11[2] = location;
  v11[3] = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(v5, "assetReferenceAtItemIndexPath:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)supportedDisplayAssetPresentationStylesInLayout:(id)a3
{
  return 3;
}

- (unint64_t)desiredPlaceholderStyleInLayout:(id)a3
{
  return 1;
}

- (CGSize)minSpriteSizeForPresentationStyle:(unint64_t)a3
{
  double v3;
  double v4;
  void *v6;
  char v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  v3 = *MEMORY[0x1E0C9D820];
  v4 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (a3 == 2)
  {
    -[PXCuratedLibraryCardSectionBodyLayout spec](self, "spec");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "allowsVideoPlaybackAtAnySize");

    if ((v7 & 1) == 0)
    {
      -[PXCuratedLibraryCardSectionBodyLayout assetFrame](self, "assetFrame");
      v3 = v8;
      v4 = v9;
    }
  }
  v10 = v3;
  v11 = v4;
  result.height = v11;
  result.width = v10;
  return result;
}

- (id)displayAssetFetchResultForSpritesInRange:(_PXGSpriteIndexRange)a3 inLayout:(id)a4
{
  unsigned int location;
  PXCuratedLibraryCardSectionBodyLayout *v6;
  PXCuratedLibraryCardSectionBodyLayout *v7;
  void *v8;
  __int128 v9;
  uint64_t v10;
  __int128 *v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  _OWORD v21[2];
  __int128 v22;
  uint64_t v23;
  _QWORD v24[6];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[3];
  uint64_t v32;

  location = a3.location;
  v6 = (PXCuratedLibraryCardSectionBodyLayout *)a4;
  v7 = v6;
  if (v6 != self || (location & 0xFFFFFFFE) != 0x3E8)
  {
LABEL_18:
    -[PXCuratedLibraryCardSectionBodyLayout keyAssetsFetchResult](self, "keyAssetsFetchResult");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  -[PXCuratedLibraryCardSectionBodyLayout skimmingIndexPaths](v6, "skimmingIndexPaths");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  v32 = 0;
  v32 = -[PXCuratedLibraryCardSectionBodyLayout currentSkimmingIndex](v7, "currentSkimmingIndex");
  v25 = 0;
  v26 = &v25;
  v27 = 0x4010000000;
  v28 = &unk_1A7E74EE7;
  v9 = *((_OWORD *)off_1E50B8778 + 1);
  v29 = *(_OWORD *)off_1E50B8778;
  v30 = v9;
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __91__PXCuratedLibraryCardSectionBodyLayout_displayAssetFetchResultForSpritesInRange_inLayout___block_invoke;
  v24[3] = &unk_1E5120C50;
  v24[4] = v31;
  v24[5] = &v25;
  objc_msgSend(v8, "enumerateSectionIndexPathsUsingBlock:", v24);
  v10 = *(_QWORD *)off_1E50B8778;
  v22 = *(_OWORD *)((char *)off_1E50B8778 + 8);
  v23 = *((_QWORD *)off_1E50B8778 + 3);
  v11 = (__int128 *)(v26 + 4);
  v12 = *(_QWORD *)off_1E50B7E98;
  if (v26[4] != *(_QWORD *)off_1E50B7E98)
  {
    if (location == 1001)
    {
      if (v8)
      {
        v14 = *((_OWORD *)v26 + 3);
        v19 = *v11;
        v20 = v14;
        objc_msgSend(v8, "indexPathGreaterThanIndexPath:", &v19);
        goto LABEL_10;
      }
LABEL_11:
      v10 = 0;
      memset(v21, 0, sizeof(v21));
      goto LABEL_12;
    }
    if (location == 1000)
    {
      if (v8)
      {
        v13 = *((_OWORD *)v26 + 3);
        v19 = *v11;
        v20 = v13;
        objc_msgSend(v8, "indexPathLessThanIndexPath:", &v19);
LABEL_10:
        v10 = *(_QWORD *)&v21[0];
LABEL_12:
        v22 = *(_OWORD *)((char *)v21 + 8);
        v23 = *((_QWORD *)&v21[1] + 1);
        goto LABEL_13;
      }
      goto LABEL_11;
    }
  }
LABEL_13:
  -[PXCuratedLibraryCardSectionBodyLayout dataSource](v7, "dataSource");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v10 == v12 || objc_msgSend(v15, "identifier") != v10)
  {
    v17 = 0;
  }
  else
  {
    *(_QWORD *)&v21[0] = v10;
    *(_OWORD *)((char *)v21 + 8) = v22;
    *((_QWORD *)&v21[1] + 1) = v23;
    objc_msgSend(v16, "keyAssetsInSectionIndexPath:", v21);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(v31, 8);

  if (!v17)
    goto LABEL_18;
LABEL_19:

  return v17;
}

- (id)axSpriteIndexes
{
  return (id)-[NSMutableIndexSet copy](self->_axSpriteIndexes, "copy");
}

- (id)axSelectedSpriteIndexes
{
  id v3;

  if (-[PXCuratedLibraryCardSectionBodyLayout isSelected](self, "isSelected"))
    v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndex:", self->_assetSpriteIndexRange.location);
  else
    v3 = objc_alloc_init(MEMORY[0x1E0CB36B8]);
  return v3;
}

- (id)axContentInfoAtSpriteIndex:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  void *v16;
  CGFloat MidX;
  CGFloat MidY;
  CGFloat Height;
  float64x2_t v20;
  void *v21;
  CGFloat Width;
  _QWORD v24[4];
  __int128 v25;
  __int128 v26;
  objc_super v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  v3 = *(_QWORD *)&a3;
  if (self->_assetSpriteIndexRange.location == a3)
  {
    v27.receiver = self;
    v27.super_class = (Class)PXCuratedLibraryCardSectionBodyLayout;
    -[PXGLayout axContentInfoAtSpriteIndex:](&v27, sel_axContentInfoAtSpriteIndex_, *(_QWORD *)&a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PXCuratedLibraryCardSectionBodyLayout displayAssetFetchResultForSpritesInRange:inLayout:](self, "displayAssetFetchResultForSpritesInRange:inLayout:", a3 | 0x100000000, self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count") < 1)
    {
      v5 = 0;
    }
    else
    {
      v25 = 0u;
      v26 = 0u;
      -[PXGLayout geometryForSpriteAtIndex:](self, "geometryForSpriteAtIndex:", self->_assetSpriteIndexRange.location);
      PXRectWithCenterAndSize();
      v10 = v9;
      v11 = v8;
      v13 = v12;
      v14 = -1.0;
      if ((_DWORD)v3 == 1001)
        v14 = 1.0;
      v15 = v7 + v14 * v8;
      +[PXGReusableAXInfo sharedPool](PXGReusableAXInfo, "sharedPool");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "checkOutReusableObjectWithReuseIdentifier:", 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "setSpriteIndex:", v3);
      v28.origin.x = v15;
      v28.origin.y = v10;
      v28.size.width = v11;
      v28.size.height = v13;
      MidX = CGRectGetMidX(v28);
      v29.origin.x = v15;
      v29.origin.y = v10;
      v29.size.width = v11;
      v29.size.height = v13;
      MidY = CGRectGetMidY(v29);
      v30.origin.x = v15;
      v30.origin.y = v10;
      v30.size.width = v11;
      v30.size.height = v13;
      Width = CGRectGetWidth(v30);
      v31.origin.x = v15;
      v31.origin.y = v10;
      v31.size.width = v11;
      v31.size.height = v13;
      Height = CGRectGetHeight(v31);
      v20.f64[0] = Width;
      v20.f64[1] = Height;
      *(CGFloat *)v24 = MidX;
      *(CGFloat *)&v24[1] = MidY;
      v24[2] = 0;
      v24[3] = vcvt_f32_f64(v20);
      objc_msgSend(v5, "setSpriteGeometry:", v24);
      objc_msgSend(v6, "objectAtIndex:", 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setContent:ofContentKind:", v21, 6);

    }
  }
  return v5;
}

- (unsigned)axSpriteIndexClosestToSpriteIndex:(unsigned int)a3 inDirection:(unint64_t)a4
{
  uint64_t v4;
  unsigned int v5;

  if (self->_assetSpriteIndexRange.location != a3)
    return -1;
  if (a4 != 6)
  {
    if (a4 == 5)
    {
      v4 = 1001;
      v5 = 1001;
      goto LABEL_7;
    }
    return -1;
  }
  v4 = 1000;
  v5 = 1000;
LABEL_7:
  if (-[NSMutableIndexSet containsIndex:](self->_axSpriteIndexes, "containsIndex:", v4))
    return v5;
  else
    return -1;
}

- (id)axSpriteIndexesInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  id v12;
  CGRect v14;
  CGRect v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PXGLayout geometryForSpriteAtIndex:](self, "geometryForSpriteAtIndex:", self->_assetSpriteIndexRange.location, 0, 0, 0, 0);
  PXRectWithCenterAndSize();
  v15.origin.x = v8;
  v15.origin.y = v9;
  v15.size.width = v10;
  v15.size.height = v11;
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  if (CGRectIntersectsRect(v14, v15))
    v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndex:", self->_assetSpriteIndexRange.location);
  else
    v12 = objc_alloc_init(MEMORY[0x1E0CB36B8]);
  return v12;
}

- (int64_t)section
{
  return self->_section;
}

- (PXAssetsDataSource)dataSource
{
  return self->_dataSource;
}

- (BOOL)isSelected
{
  return self->_isSelected;
}

- (int64_t)zoomLevel
{
  return self->_zoomLevel;
}

- (void)setZoomLevel:(int64_t)a3
{
  self->_zoomLevel = a3;
}

- (PXCuratedLibraryCardSectionBodyLayoutSpec)spec
{
  return self->_spec;
}

- (PXGDisplayAssetPixelBufferSourcesProvider)inlinePlaybackController
{
  return self->_inlinePlaybackController;
}

- (void)setInlinePlaybackController:(id)a3
{
  objc_storeStrong((id *)&self->_inlinePlaybackController, a3);
}

- (BOOL)isSkimming
{
  return self->_isSkimming;
}

- (PXIndexPathSet)skimmingIndexPaths
{
  return self->_skimmingIndexPaths;
}

- (int64_t)maxSkimmingIndex
{
  return self->_maxSkimmingIndex;
}

- (int64_t)currentSkimmingIndex
{
  return self->_currentSkimmingIndex;
}

- (PXGLayoutGuide)assetLayoutGuide
{
  return self->_assetLayoutGuide;
}

- (PXSimpleIndexPath)sectionIndexPath
{
  __int128 v3;

  v3 = *(_OWORD *)&self[32].section;
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)&self[31].subitem;
  *(_OWORD *)&retstr->item = v3;
  return self;
}

- (PXDisplayAssetFetchResult)keyAssetsFetchResult
{
  return self->_keyAssetsFetchResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyAssetsFetchResult, 0);
  objc_storeStrong((id *)&self->_assetLayoutGuide, 0);
  objc_storeStrong((id *)&self->_skimmingIndexPaths, 0);
  objc_storeStrong((id *)&self->_inlinePlaybackController, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_axSpriteIndexes, 0);
  objc_storeStrong((id *)&self->_keyAsset, 0);
}

uint64_t __91__PXCuratedLibraryCardSectionBodyLayout_displayAssetFetchResultForSpritesInRange_inLayout___block_invoke(uint64_t result, _OWORD *a2, _BYTE *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;

  v3 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  v4 = *(_QWORD *)(v3 + 24);
  if (!v4)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(result + 40) + 8);
    v6 = a2[1];
    *(_OWORD *)(v5 + 32) = *a2;
    *(_OWORD *)(v5 + 48) = v6;
    *a3 = 1;
    v3 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
    v4 = *(_QWORD *)(v3 + 24);
  }
  *(_QWORD *)(v3 + 24) = v4 - 1;
  return result;
}

uint64_t __55__PXCuratedLibraryCardSectionBodyLayout__updateSprites__block_invoke(uint64_t a1, uint64_t a2, float32x2_t *a3, uint64_t a4, uint64_t a5)
{
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat MidX;
  CGFloat MidY;
  CGFloat Height;
  float64x2_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  int v22;
  int v23;
  int v24;
  int v25;
  __int128 v26;
  char v27;
  float v28;
  void *v29;
  CGFloat Width;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  v9 = *(double *)(a1 + 48);
  v10 = *(double *)(a1 + 56);
  v11 = *(double *)(a1 + 64);
  v12 = *(double *)(a1 + 72);
  v32.origin.x = v9;
  v32.origin.y = v10;
  v32.size.width = v11;
  v32.size.height = v12;
  MidX = CGRectGetMidX(v32);
  v33.origin.x = v9;
  v33.origin.y = v10;
  v33.size.width = v11;
  v33.size.height = v12;
  MidY = CGRectGetMidY(v33);
  v34.origin.x = v9;
  v34.origin.y = v10;
  v34.size.width = v11;
  v34.size.height = v12;
  Width = CGRectGetWidth(v34);
  v35.origin.x = v9;
  v35.origin.y = v10;
  v35.size.width = v11;
  v35.size.height = v12;
  Height = CGRectGetHeight(v35);
  v16.f64[0] = Width;
  v16.f64[1] = Height;
  *(CGFloat *)a3 = MidX;
  *(CGFloat *)&a3[1] = MidY;
  a3[2] = (float32x2_t)0xBFD99999A0000000;
  a3[3] = vcvt_f32_f64(v16);
  v17 = *((_OWORD *)off_1E50B83A0 + 1);
  *(_OWORD *)a4 = *(_OWORD *)off_1E50B83A0;
  *(_OWORD *)(a4 + 16) = v17;
  v18 = *((_OWORD *)off_1E50B83A0 + 5);
  *(_OWORD *)(a4 + 64) = *((_OWORD *)off_1E50B83A0 + 4);
  *(_OWORD *)(a4 + 80) = v18;
  v19 = *((_OWORD *)off_1E50B83A0 + 3);
  *(_OWORD *)(a4 + 32) = *((_OWORD *)off_1E50B83A0 + 2);
  *(_OWORD *)(a4 + 48) = v19;
  v20 = *((_OWORD *)off_1E50B83A0 + 9);
  *(_OWORD *)(a4 + 128) = *((_OWORD *)off_1E50B83A0 + 8);
  *(_OWORD *)(a4 + 144) = v20;
  v21 = *((_OWORD *)off_1E50B83A0 + 7);
  *(_OWORD *)(a4 + 96) = *((_OWORD *)off_1E50B83A0 + 6);
  *(_OWORD *)(a4 + 112) = v21;
  *(float32x4_t *)(a4 + 4) = vcvt_hight_f32_f64((int32x2_t)vcvt_f32_f64(*(float64x2_t *)(a1 + 80)), *(float64x2_t *)(a1 + 96));
  objc_msgSend(*(id *)(a1 + 32), "cornerRadius");
  *(_DWORD *)(a4 + 36) = v22;
  *(_DWORD *)(a4 + 40) = v23;
  *(_DWORD *)(a4 + 44) = v24;
  *(_DWORD *)(a4 + 48) = v25;
  *(_QWORD *)(a5 + 32) = *((_QWORD *)off_1E50B8398 + 4);
  v26 = *((_OWORD *)off_1E50B8398 + 1);
  *(_OWORD *)a5 = *(_OWORD *)off_1E50B8398;
  *(_OWORD *)(a5 + 16) = v26;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 856))
    v27 = 2;
  else
    v27 = 5;
  *(_BYTE *)(a5 + 1) = v27;
  *(_WORD *)(a5 + 32) = *(_WORD *)(*(_QWORD *)(a1 + 40) + 848);
  v28 = *(double *)(a1 + 112);
  *(float32x2_t *)(a5 + 8) = vmul_n_f32(a3[3], v28);
  v29 = *(void **)(a1 + 40);
  if (v29)
    objc_msgSend(v29, "sectionIndexPath");
  *(_QWORD *)(a5 + 24) = PXGSectionedSpriteTagMake();
  return PXUpdateSectionedSpriteInfoTagsForItemsInRange();
}

uint64_t __55__PXCuratedLibraryCardSectionBodyLayout__updateSprites__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setRect:inLayout:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

@end
