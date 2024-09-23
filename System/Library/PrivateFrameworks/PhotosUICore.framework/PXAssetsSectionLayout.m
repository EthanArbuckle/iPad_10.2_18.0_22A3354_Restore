@implementation PXAssetsSectionLayout

- (unint64_t)desiredPlaceholderStyleInLayout:(id)a3
{
  return 1;
}

- (Class)viewClassForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  PXAssetsSectionLayout *v7;
  PXAssetsSectionLayout *v8;
  void *v9;
  void *v11;

  v7 = (PXAssetsSectionLayout *)a4;
  v8 = v7;
  if (v7 == self)
  {
    if (v7->_showAllButtonSpriteIndex == a3)
    {
      -[PXAssetsSectionLayout showAllAffordanceStyle](v7, "showAllAffordanceStyle");
    }
    else if (v7->_selectAllButtonSpriteIndex != a3 && v7->_blurSpriteIndex != a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("PXAssetsSectionLayout.m"), 2024, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
  }
  objc_opt_class();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v9;
}

- (BOOL)allowsDanglingUpdatesAssertions
{
  return 0;
}

- (id)displayAssetFetchResultForSpritesInRange:(_PXGSpriteIndexRange)a3 inLayout:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSUInteger v9;
  uint64_t v10;
  PXDisplayAssetFetchResult *v11;
  NSUInteger v12;
  BOOL v13;
  PXDisplayAssetFetchResult *cachedClampedFetchResult;
  void *v15;
  void *v16;
  void *v17;
  void *v19;
  objc_class *v20;
  void *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  _QWORD v25[2];
  int64x2_t v26;

  v6 = a4;
  -[PXAssetsSectionLayout bodyContentLayout](self, "bodyContentLayout");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 != v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetsSectionLayout.m"), 1958, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v8 = v6;
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_4;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "px_descriptionForAssertionMessage");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetsSectionLayout.m"), 1942, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("layout"), v21, v23);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetsSectionLayout.m"), 1942, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("layout"), v21);
  }

LABEL_4:
  v9 = objc_msgSend(v8, "itemForSpriteIndex:", 0);
  v10 = objc_msgSend(v8, "numberOfItems");
  if (-[PXAssetsSectionLayout zoomLevel](self, "zoomLevel") == 1)
  {
    -[PXAssetsSectionLayout keyAssetsFetchResult](self, "keyAssetsFetchResult");
    v11 = (PXDisplayAssetFetchResult *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = v10 - v9;
    v13 = self->_cachedClampedItemRange.location == v9 && self->_cachedClampedItemRange.length == v12;
    if (!v13 || (cachedClampedFetchResult = self->_cachedClampedFetchResult) == 0)
    {
      -[PXAssetsSectionLayout dataSource](self, "dataSource");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = objc_msgSend(v16, "identifier");
      v25[1] = -[PXAssetsSectionLayout section](self, "section");
      v26 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
      objc_msgSend(v16, "assetsInSectionIndexPath:", v25);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      PXDisplayAssetFetchResultSubfetchResultWithRange();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)&self->_cachedClampedFetchResult, v15);
      self->_cachedClampedItemRange.location = v9;
      self->_cachedClampedItemRange.length = v12;

      goto LABEL_15;
    }
    v11 = cachedClampedFetchResult;
  }
  v15 = v11;
LABEL_15:

  return v15;
}

- (int64_t)zoomLevel
{
  return self->_zoomLevel;
}

- (PXGLayout)bodyContentLayout
{
  return self->_bodyContentLayout;
}

+ (CGSize)estimatedSizeWithReferenceSize:(CGSize)a3 assetCollection:(id)a4 numberOfAssets:(int64_t)a5 isCurated:(BOOL)a6 zoomLevel:(int64_t)a7 spec:(id)a8
{
  double width;
  _BOOL8 v11;
  double height;
  id v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGSize result;

  width = a3.width;
  if ((unint64_t)(a7 - 3) > 1)
  {
    v18 = 0.0;
  }
  else
  {
    v11 = a6;
    height = a3.height;
    v14 = a4;
    objc_msgSend(a8, "sectionConfiguratorForAssetCollection:inZoomLevel:", v14, a7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "estimatedSizeOfSectionForAssetCollection:isCurated:numberOfAssets:referenceSize:", v14, v11, a5, width, height);
    width = v16;
    v18 = v17;

  }
  v19 = width;
  v20 = v18;
  result.height = v20;
  result.width = v19;
  return result;
}

- (int64_t)keyItemIndex
{
  void *v3;
  void *v4;
  _QWORD v6[2];
  int64x2_t v7;
  __int128 v8;
  __int128 v9;

  v8 = 0u;
  v9 = 0u;
  -[PXAssetsSectionLayout dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAssetsSectionLayout dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = objc_msgSend(v4, "identifier");
  v6[1] = -[PXAssetsSectionLayout section](self, "section");
  v7 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  if (v3)
  {
    objc_msgSend(v3, "keyAssetIndexPathForSectionIndexPath:", v6);
  }
  else
  {
    v8 = 0u;
    v9 = 0u;
  }

  if ((_QWORD)v8 == *(_QWORD *)off_1E50B7E98)
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return v9;
}

- (id)axSpriteIndexes
{
  return objc_alloc_init(MEMORY[0x1E0CB36B8]);
}

- (void)axGroup:(id)a3 didChange:(unint64_t)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  void *v10;
  objc_super v11;
  _OWORD v12[2];

  v8 = a3;
  v9 = a5;
  if ((a4 & 6) != 0)
  {
    memset(v12, 0, sizeof(v12));
    -[PXAssetsSectionLayout sectionIndexPath](self, "sectionIndexPath");
    PXGAXAddSimpleIndexPathGroupChangeUserInfo(v9, v12, (_QWORD *)v12 + 1, 0);
    -[PXAssetsSectionLayout bodyItemsGeometry](self, "bodyItemsGeometry");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PXGAXAddItemGeometryGroupChangeUserInfo(v9, v10);

  }
  v11.receiver = self;
  v11.super_class = (Class)PXAssetsSectionLayout;
  -[PXGLayout axGroup:didChange:userInfo:](&v11, sel_axGroup_didChange_userInfo_, v8, a4, v9);

}

- (void)setNumberOfPrecedingAssets:(int64_t)a3
{
  if (self->_numberOfPrecedingAssets != a3)
  {
    self->_numberOfPrecedingAssets = a3;
    -[PXAssetsSectionLayout _invalidateContent](self, "_invalidateContent");
  }
}

- (void)setIsSelecting:(BOOL)a3
{
  if (self->_isSelecting != a3)
  {
    self->_isSelecting = a3;
    -[PXPhotosGridAssetDecorationSource setIsInSelectMode:](self->_assetDecorationSource, "setIsInSelectMode:");
    -[PXAssetsSectionLayout _invalidateContent](self, "_invalidateContent");
    -[PXGLayout invalidateDecoration](self, "invalidateDecoration");
  }
}

- (void)setIntersectionSpacing:(double)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v7;
  void *v8;

  if (self->_intersectionSpacing != a3)
  {
    self->_intersectionSpacing = a3;
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 4;
LABEL_8:
        -[PXAssetsSectionLayout _invalidateFooter](self, "_invalidateFooter");
        return;
      }
    }
    else if (!self->_updateFlags.isPerformingUpdate)
    {
      willPerformUpdate = self->_updateFlags.willPerformUpdate;
      p_updateFlags->needsUpdate = 4;
      if (!willPerformUpdate)
        -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
      goto LABEL_8;
    }
    if ((self->_updateFlags.updated & 4) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXAssetsSectionLayout setIntersectionSpacing:]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("PXAssetsSectionLayout.m"), 503, CFSTR("invalidating %lu after it already has been updated"), 4);

      abort();
    }
    goto LABEL_7;
  }
}

- (void)setCanStartSelecting:(BOOL)a3
{
  if (self->_canStartSelecting != a3)
  {
    self->_canStartSelecting = a3;
    -[PXAssetsSectionLayout _invalidateContent](self, "_invalidateContent");
  }
}

float __53__PXAssetsSectionLayout__updateShowAllButtonPosition__block_invoke(CGFloat *a1, uint64_t a2, float32x2_t *a3, float *a4)
{
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat MidX;
  CGFloat MidY;
  CGFloat Height;
  float64x2_t v14;
  float result;
  CGFloat Width;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  v7 = a1[4];
  v8 = a1[5];
  v9 = a1[6];
  v10 = a1[7];
  v17.origin.x = v7;
  v17.origin.y = v8;
  v17.size.width = v9;
  v17.size.height = v10;
  MidX = CGRectGetMidX(v17);
  v18.origin.x = v7;
  v18.origin.y = v8;
  v18.size.width = v9;
  v18.size.height = v10;
  MidY = CGRectGetMidY(v18);
  v19.origin.x = v7;
  v19.origin.y = v8;
  v19.size.width = v9;
  v19.size.height = v10;
  Width = CGRectGetWidth(v19);
  v20.origin.x = v7;
  v20.origin.y = v8;
  v20.size.width = v9;
  v20.size.height = v10;
  Height = CGRectGetHeight(v20);
  v14.f64[0] = Width;
  v14.f64[1] = Height;
  *(CGFloat *)a3 = MidX;
  *(CGFloat *)&a3[1] = MidY;
  a3[2] = (float32x2_t)0xBFF0000000000000;
  a3[3] = vcvt_f32_f64(v14);
  result = a1[8];
  *a4 = result;
  return result;
}

- (int64_t)numberOfAssets
{
  void *v3;
  int64_t v4;

  -[PXAssetsSectionLayout dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfItemsInSection:", -[PXAssetsSectionLayout section](self, "section"));

  return v4;
}

- (PXDisplayAssetCollection)assetCollection
{
  void *v4;
  void *v5;
  uint64_t v6;

  if (-[PXAssetsSectionLayout section](self, "section") == 0x7FFFFFFFFFFFFFFFLL)
    return (PXDisplayAssetCollection *)0;
  -[PXAssetsSectionLayout dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAssetsSectionLayout sectionIndexPath](self, "sectionIndexPath");
  objc_msgSend(v4, "assetCollectionAtSectionIndexPath:", &v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXDisplayAssetCollection *)v5;
}

- (PXAssetCollectionReference)assetCollectionReference
{
  PXAssetCollectionReference *assetCollectionReference;
  PXAssetCollectionReference *v4;
  void *v5;
  PXAssetCollectionReference *v6;
  PXAssetCollectionReference *v7;
  _QWORD v9[12];

  assetCollectionReference = self->_assetCollectionReference;
  if (!assetCollectionReference)
    goto LABEL_8;
  -[PXAssetCollectionReference indexPath](assetCollectionReference, "indexPath");
  -[PXAssetsSectionLayout sectionIndexPath](self, "sectionIndexPath");
  if (v9[8] != v9[4] || v9[9] != v9[5] || v9[10] != v9[6] || v9[11] != v9[7])
  {
    v4 = self->_assetCollectionReference;
    self->_assetCollectionReference = 0;

  }
  if (!self->_assetCollectionReference)
  {
LABEL_8:
    if (-[PXAssetsSectionLayout section](self, "section") != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[PXAssetsSectionLayout dataSource](self, "dataSource");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXAssetsSectionLayout sectionIndexPath](self, "sectionIndexPath");
      objc_msgSend(v5, "assetCollectionReferenceAtSectionIndexPath:", v9);
      v6 = (PXAssetCollectionReference *)objc_claimAutoreleasedReturnValue();
      v7 = self->_assetCollectionReference;
      self->_assetCollectionReference = v6;

    }
  }
  return self->_assetCollectionReference;
}

- (id)generatedLayout:(id)a3 inputItemAtIndex:(unsigned int)a4
{
  return -[PXAssetsSectionLayout _displayAssetForBodyItem:](self, "_displayAssetForBodyItem:", a4);
}

- ($6FCFBD36564ECBB6D9D1614A84D6F83D)itemsLayout:(id)a3 cornerRadiusForItem:(int64_t)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  $6FCFBD36564ECBB6D9D1614A84D6F83D result;

  if (-[PXAssetsSectionLayout zoomLevel](self, "zoomLevel", a3, a4) == 3)
  {
    +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cornerRadiusForDays");
  }
  else
  {
    -[PXAssetsSectionLayout spec](self, "spec");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "itemCornerRadius");
  }

  *(_QWORD *)&result.var0.var1[2] = v7;
  *(_QWORD *)&result.var0.var0.var0 = v6;
  return result;
}

- (CGRect)generatedLayout:(id)a3 bestCropRectForInputItemAtIndex:(unsigned int)a4 withAspectRatio:(double)a5
{
  uint64_t v7;
  void *v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  void *v13;
  void *v14;
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
  CGRect v26;
  CGRect result;

  v7 = a4;
  -[PXAssetsSectionLayout _displayAssetForBodyItem:](self, "_displayAssetForBodyItem:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0C9D628];
  v10 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v11 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v12 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  if (-[PXAssetsSectionLayout isFaceModeEnabled](self, "isFaceModeEnabled"))
  {
    -[PXAssetsSectionLayout _displayFaceForBodyItem:](self, "_displayFaceForBodyItem:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      objc_msgSend(v13, "normalizedCropRect");
      v9 = v15;
      v10 = v16;
      v11 = v17;
      v12 = v18;
    }

  }
  v26.origin.x = v9;
  v26.origin.y = v10;
  v26.size.width = v11;
  v26.size.height = v12;
  if (CGRectIsEmpty(v26))
  {
    v9 = PXCuratedLibraryBestCropRectForAssetInZoomLevel(v8, -[PXAssetsSectionLayout zoomLevel](self, "zoomLevel"), 0, a5);
    v10 = v19;
    v11 = v20;
    v12 = v21;
  }

  v22 = v9;
  v23 = v10;
  v24 = v11;
  v25 = v12;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (BOOL)isFaceModeEnabled
{
  return self->_faceModeEnabled;
}

- (PXSimpleIndexPath)sectionIndexPath
{
  int64_t v5;
  int64_t v6;
  PXSimpleIndexPath *result;
  id v8;

  -[PXAssetsSectionLayout dataSource](self, "dataSource");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v8, "identifier");
  v6 = -[PXAssetsSectionLayout section](self, "section");
  retstr->dataSourceIdentifier = v5;
  retstr->section = v6;
  *(int64x2_t *)&retstr->item = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);

  return result;
}

- (id)_displayAssetForBodyItem:(int64_t)a3
{
  void *v5;
  void *v6;
  _QWORD v8[4];

  -[PXAssetsSectionLayout dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = objc_msgSend(v5, "identifier");
  v8[1] = -[PXAssetsSectionLayout section](self, "section");
  v8[2] = a3;
  v8[3] = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(v5, "assetAtItemIndexPath:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (PXAssetsDataSource)dataSource
{
  return self->_dataSource;
}

- (int64_t)section
{
  return self->_section;
}

- (CGSize)itemsLayout:(id)a3 insetForItem:(int64_t)a4
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  -[PXAssetsSectionLayout assetDecorationSource](self, "assetDecorationSource", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "expectedInsetsForItem:", a4);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (PXPhotosGridAssetDecorationSource)assetDecorationSource
{
  return self->_assetDecorationSource;
}

- (void)setWantsShadow:(BOOL)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;

  if (self->_wantsShadow != a3)
  {
    self->_wantsShadow = a3;
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 4;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 4) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXAssetsSectionLayout setWantsShadow:]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXAssetsSectionLayout.m"), 343, CFSTR("invalidating %lu after it already has been updated"), 4);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 4;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (void)setShowAllAffordanceStyle:(int64_t)a3
{
  if (self->_showAllAffordanceStyle != a3)
  {
    self->_showAllAffordanceStyle = a3;
    -[PXAssetsSectionLayout _invalidateFooter](self, "_invalidateFooter");
    -[PXAssetsSectionLayout _invalidateShowAllButton](self, "_invalidateShowAllButton");
    -[PXAssetsSectionLayout _invalidateShowAllButtonPosition](self, "_invalidateShowAllButtonPosition");
  }
}

- (void)setShowAllActionPerformer:(id)a3
{
  PXCuratedLibraryShowAllActionPerformer *v5;
  PXCuratedLibraryShowAllActionPerformer *v6;

  v5 = (PXCuratedLibraryShowAllActionPerformer *)a3;
  if (self->_showAllActionPerformer != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_showAllActionPerformer, a3);
    -[PXAssetsSectionLayout _invalidateShowAllButton](self, "_invalidateShowAllButton");
    v5 = v6;
  }

}

- (void)setSelectAllActionPerformer:(id)a3
{
  PXCuratedLibraryActionPerformer *v5;
  PXCuratedLibraryActionPerformer *v6;

  v5 = (PXCuratedLibraryActionPerformer *)a3;
  if (self->_selectAllActionPerformer != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_selectAllActionPerformer, a3);
    -[PXAssetsSectionLayout _invalidateSelectAllButton](self, "_invalidateSelectAllButton");
    v5 = v6;
  }

}

- (void)setHeaderLayoutGuide:(id)a3
{
  PXGLayoutGuide *v5;
  PXGLayoutGuide *headerLayoutGuide;
  PXGLayoutGuide *v7;

  v5 = (PXGLayoutGuide *)a3;
  headerLayoutGuide = self->_headerLayoutGuide;
  if (headerLayoutGuide != v5)
  {
    v7 = v5;
    -[PXGLayoutGuide unregisterChangeObserver:context:](headerLayoutGuide, "unregisterChangeObserver:context:", self, PXHeaderLayoutGuideObservationContext);
    objc_storeStrong((id *)&self->_headerLayoutGuide, a3);
    -[PXGLayoutGuide registerChangeObserver:context:](self->_headerLayoutGuide, "registerChangeObserver:context:", self, PXHeaderLayoutGuideObservationContext);
    -[PXAssetsSectionLayout _invalidateSelectAllButtonPosition](self, "_invalidateSelectAllButtonPosition");
    v5 = v7;
  }

}

- (void)setHeaderLayout:(id)a3
{
  PXGLayout *v5;
  PXGLayout *v6;

  v6 = (PXGLayout *)a3;
  if (self->_headerLayout != v6)
  {
    objc_storeStrong((id *)&self->_headerLayout, a3);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v6;
    else
      v5 = 0;
    objc_storeStrong((id *)&self->_sectionHeaderLayout, v5);
    if (-[PXAssetsSectionLayout numberOfAssets](self, "numberOfAssets"))
      -[PXGSplitLayout setFirstSublayout:](self, "setFirstSublayout:", v6);
  }

}

- (void)setBodyContentLayout:(id)a3 wantsDecoration:(BOOL)a4
{
  _BOOL4 v4;
  PXGLayout *v7;
  PXGLayout **p_bodyContentLayout;
  PXGDecoratingLayout *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PXGLayout *v14;

  v4 = a4;
  v7 = (PXGLayout *)a3;
  p_bodyContentLayout = &self->_bodyContentLayout;
  if (self->_bodyContentLayout != v7)
  {
    v14 = v7;
    objc_storeStrong((id *)&self->_bodyContentLayout, a3);
    if (v4 && *p_bodyContentLayout)
    {
      v9 = -[PXGDecoratingLayout initWithDecoratedLayout:]([PXGDecoratingLayout alloc], "initWithDecoratedLayout:", v14);
      -[PXAssetsSectionLayout assetDecorationSource](self, "assetDecorationSource");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXGDecoratingLayout setDecorationSource:](v9, "setDecorationSource:", v10);

      -[PXAssetsSectionLayout assetDecorationSource](self, "assetDecorationSource");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXGDecoratingLayout setContentSource:](v9, "setContentSource:", v11);

      -[PXAssetsSectionLayout assetDecorationSource](self, "assetDecorationSource");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setDecoratedLayout:", v14);

      -[PXAssetsSectionLayout setBodyContainerLayout:](self, "setBodyContainerLayout:", v9);
      -[PXAssetsSectionLayout bodyContainerLayout](self, "bodyContainerLayout");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXGSplitLayout setSecondSublayout:](self, "setSecondSublayout:", v13);

    }
    else
    {
      -[PXAssetsSectionLayout setBodyContainerLayout:](self, "setBodyContainerLayout:", 0);
      -[PXGSplitLayout setSecondSublayout:](self, "setSecondSublayout:", *p_bodyContentLayout);
    }
    -[PXAssetsSectionLayout _invalidateAssetsWithCoveredBottomTrailingCorner](self, "_invalidateAssetsWithCoveredBottomTrailingCorner");
    v7 = v14;
  }

}

- (void)setAxLocalizedBaseLabel:(id)a3
{
  objc_storeStrong((id *)&self->_axLocalizedBaseLabel, a3);
}

- (int64_t)numberOfPrecedingAssets
{
  return self->_numberOfPrecedingAssets;
}

- (void)itemsLayout:(id)a3 updateTagsInSpriteInfos:(id *)a4 forItemsInRange:(_NSRange)a5
{
  id v6;

  -[PXAssetsSectionLayout dataSource](self, "dataSource", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  -[PXAssetsSectionLayout section](self, "section");
  PXUpdateSectionedSpriteInfoTagsForItemsInRange();

}

- (BOOL)isCurated
{
  void *v3;
  void *v4;
  char v5;

  -[PXAssetsSectionLayout dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAssetsSectionLayout assetCollection](self, "assetCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "hasCurationForAssetCollection:", v4);

  return v5;
}

- (void)setBodyContainerLayout:(id)a3
{
  objc_storeStrong((id *)&self->_bodyContainerLayout, a3);
}

- (PXGLayout)bodyContainerLayout
{
  return self->_bodyContainerLayout;
}

- (unint64_t)supportedDisplayAssetPresentationStylesInLayout:(id)a3
{
  int64_t v3;
  _BOOL4 v4;
  int v5;

  v3 = -[PXAssetsSectionLayout zoomLevel](self, "zoomLevel", a3);
  v4 = +[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled");
  v5 = v3 == 4 && v4;
  if (v3 == 3)
    v5 = 1;
  if (v5)
    return 3;
  else
    return 1;
}

- (CGSize)minSpriteSizeForPresentationStyle:(unint64_t)a3
{
  double v3;
  double v4;
  void *v7;
  char v8;
  int64_t v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  char isKindOfClass;
  void *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  objc_class *v26;
  void *v27;
  void *v28;
  objc_class *v29;
  CGSize result;

  v3 = *MEMORY[0x1E0C9D820];
  v4 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (a3 == 2)
  {
    +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "forcePlayback");

    if ((v8 & 1) == 0)
    {
      v9 = -[PXAssetsSectionLayout zoomLevel](self, "zoomLevel");
      if (v9 == 3)
      {
        -[PXAssetsSectionLayout bodyContentLayout](self, "bodyContentLayout");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10)
        {
LABEL_12:

          goto LABEL_13;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
LABEL_6:
          objc_msgSend(v10, "minPlayableSpriteSize");
          v3 = v11;
          v4 = v12;
          goto LABEL_12;
        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (objc_class *)objc_opt_class();
        NSStringFromClass(v24);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "px_descriptionForAssertionMessage");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetsSectionLayout.m"), 1913, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("self.bodyContentLayout"), v22, v23);
        goto LABEL_20;
      }
      if ((unint64_t)(v9 - 1) <= 1)
      {
        -[PXAssetsSectionLayout bodyContentLayout](self, "bodyContentLayout");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = (objc_class *)objc_opt_class();
            NSStringFromClass(v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "px_descriptionForAssertionMessage");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetsSectionLayout.m"), 1918, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("self.bodyContentLayout"), v27, v28);

          }
          objc_msgSend(v10, "contentSource");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "minSpriteSizeForPresentationStyle:", 2);
          v3 = v14;
          v4 = v15;

        }
        goto LABEL_12;
      }
      if (v9 == 4)
      {
        -[PXAssetsSectionLayout bodyContentLayout](self, "bodyContentLayout");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          -[PXAssetsSectionLayout bodyContentLayout](self, "bodyContentLayout");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v10)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = (objc_class *)objc_opt_class();
            NSStringFromClass(v29);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetsSectionLayout.m"), 1924, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.bodyContentLayout"), v22);
            goto LABEL_21;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            goto LABEL_6;
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = (objc_class *)objc_opt_class();
          NSStringFromClass(v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "px_descriptionForAssertionMessage");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetsSectionLayout.m"), 1924, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.bodyContentLayout"), v22, v23);
LABEL_20:

LABEL_21:
          goto LABEL_6;
        }
      }
    }
  }
LABEL_13:
  v16 = v3;
  v17 = v4;
  result.height = v17;
  result.width = v16;
  return result;
}

- (PXGDisplayAssetPixelBufferSourcesProvider)inlinePlaybackController
{
  return self->_inlinePlaybackController;
}

- (id)generatedLayout:(id)a3 objectReferenceAtIndex:(unsigned int)a4
{
  return -[PXAssetsSectionLayout objectReferenceForSpriteIndex:](self, "objectReferenceForSpriteIndex:", -[PXGLayout convertSpriteIndex:fromDescendantLayout:](self, "convertSpriteIndex:fromDescendantLayout:", *(_QWORD *)&a4, a3));
}

- (void)_updateDistanceProperties
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double MaxY;
  double v9;
  id *p_sectionHeaderLayout;
  PXAssetsSectionLayout *v11;
  PXAssetsSectionLayout *v12;
  double MinY;
  double v14;
  PXAssetsSectionLayout *v15;
  PXAssetsSectionLayout *v16;
  double v17;
  double v18;
  double v19;
  id v20;
  CGRect v21;
  CGRect v22;

  -[PXAssetsSectionLayout bodyContentLayout](self, "bodyContentLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v3;
  if (v3)
  {
    v4 = *MEMORY[0x1E0C9D538];
    v5 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    objc_msgSend(v3, "contentSize");
    -[PXGLayout convertRect:fromDescendantLayout:](self, "convertRect:fromDescendantLayout:", v20, v4, v5, v6, v7);
    MaxY = CGRectGetMaxY(v21);
  }
  else
  {
    -[PXGLayout contentSize](self, "contentSize");
    MaxY = v9;
  }
  p_sectionHeaderLayout = (id *)&self->_sectionHeaderLayout;
  -[PXGLayout superlayout](self->_sectionHeaderLayout, "superlayout");
  v11 = (PXAssetsSectionLayout *)objc_claimAutoreleasedReturnValue();

  if (v11 == self)
  {
    objc_msgSend(*p_sectionHeaderLayout, "titleSubtitleFrame");
    -[PXGLayout convertRect:fromDescendantLayout:](self, "convertRect:fromDescendantLayout:", *p_sectionHeaderLayout);
    MinY = CGRectGetMinY(v22);
  }
  else
  {
    -[PXGLayout superlayout](self->_headerLayout, "superlayout");
    v12 = (PXAssetsSectionLayout *)objc_claimAutoreleasedReturnValue();

    MinY = 0.0;
    if (v12 == self)
    {
      -[PXGLayout convertPoint:fromLayout:](self, "convertPoint:fromLayout:", self->_headerLayout, 0.0, 0.0);
      MinY = v14;
    }
  }
  -[PXAssetsSectionLayout setDistanceBetweenTitleTopAndBodyBottom:](self, "setDistanceBetweenTitleTopAndBodyBottom:", MaxY - MinY);
  objc_msgSend(*p_sectionHeaderLayout, "superlayout");
  v15 = (PXAssetsSectionLayout *)objc_claimAutoreleasedReturnValue();

  if (v15 == self
    || (p_sectionHeaderLayout = (id *)&self->_headerLayout,
        -[PXGLayout superlayout](self->_headerLayout, "superlayout"),
        v16 = (PXAssetsSectionLayout *)objc_claimAutoreleasedReturnValue(),
        v16,
        v17 = 0.0,
        v16 == self))
  {
    -[PXGLayout convertPoint:fromLayout:](self, "convertPoint:fromLayout:", *p_sectionHeaderLayout, 0.0, 0.0);
    v17 = v18;
  }
  -[PXAssetsSectionLayout intersectionSpacing](self, "intersectionSpacing");
  -[PXAssetsSectionLayout setDistanceBetweenHeaderTopAndNextBodyTop:](self, "setDistanceBetweenHeaderTopAndNextBodyTop:", MaxY + v19 - v17);

}

- (double)intersectionSpacing
{
  return self->_intersectionSpacing;
}

- (id)objectReferenceForSpriteIndex:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int64_t v21;
  uint64_t v22;
  int64_t v23;
  int64x2_t v24;

  v3 = *(_QWORD *)&a3;
  -[PXAssetsSectionLayout headerLayout](self, "headerLayout");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (self->_showAllButtonSpriteIndex != (_DWORD)v3)
  {
    if (self->_selectAllButtonSpriteIndex == (_DWORD)v3)
    {
      -[PXAssetsSectionLayout selectAllButtonConfiguration](self, "selectAllButtonConfiguration");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    }
    if (v5
      && -[PXGLayout convertSpriteIndex:toDescendantLayout:](self, "convertSpriteIndex:toDescendantLayout:", v3, v5) != -1)
    {
      v8 = 0;
      goto LABEL_6;
    }
    -[PXAssetsSectionLayout dataSource](self, "dataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)(-[PXAssetsSectionLayout zoomLevel](self, "zoomLevel") - 3) > 1)
      goto LABEL_30;
    -[PXAssetsSectionLayout bodyContentLayout](self, "bodyContentLayout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = -[PXGLayout convertSpriteIndex:toDescendantLayout:](self, "convertSpriteIndex:toDescendantLayout:", v3, v11);
      if ((_DWORD)v12 != -1)
      {
        v13 = v12;
        -[PXAssetsSectionLayout configurator](self, "configurator");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_msgSend(v11, "objectReferenceForSpriteIndex:", v13);
            v19 = objc_claimAutoreleasedReturnValue();
            goto LABEL_27;
          }
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v15 = v11;
          if (objc_msgSend(v15, "spriteIndexIsItem:", v13))
          {
            v13 = objc_msgSend(v15, "itemForSpriteIndex:", v13);
            v16 = objc_msgSend(v10, "identifier");
            v17 = -[PXAssetsSectionLayout section](self, "section");
            v18 = 0x7FFFFFFFFFFFFFFFLL;
          }
          else
          {
            v16 = *(_QWORD *)off_1E50B8778;
            v17 = *((_QWORD *)off_1E50B8778 + 1);
            v13 = *((_QWORD *)off_1E50B8778 + 2);
            v18 = *((_QWORD *)off_1E50B8778 + 3);
          }

        }
        else
        {
          v16 = objc_msgSend(v10, "identifier");
          v17 = -[PXAssetsSectionLayout section](self, "section");
          v13 = v13;
          v18 = 0x7FFFFFFFFFFFFFFFLL;
        }
        if (v16 != *(_QWORD *)off_1E50B7E98 && v13 != 0x7FFFFFFFFFFFFFFFLL && v18 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v22 = v16;
          v23 = v17;
          v24.i64[0] = v13;
          v24.i64[1] = 0x7FFFFFFFFFFFFFFFLL;
          objc_msgSend(v10, "assetReferenceAtItemIndexPath:", &v22);
          v19 = objc_claimAutoreleasedReturnValue();
LABEL_27:
          v8 = (void *)v19;

          if (v8)
          {
LABEL_31:

            goto LABEL_6;
          }
LABEL_30:
          v20 = objc_msgSend(v10, "identifier");
          v21 = -[PXAssetsSectionLayout section](self, "section");
          v22 = v20;
          v23 = v21;
          v24 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
          objc_msgSend(v10, "objectReferenceAtIndexPath:", &v22);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_31;
        }
      }
    }

    goto LABEL_30;
  }
  -[PXAssetsSectionLayout showAllActionPerformer](self, "showAllActionPerformer");
  v7 = objc_claimAutoreleasedReturnValue();
LABEL_5:
  v8 = (void *)v7;
LABEL_6:

  return v8;
}

- (PXGLayout)headerLayout
{
  return self->_headerLayout;
}

_DWORD *__44__PXAssetsSectionLayout__updateLocalSprites__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  uint64_t v19;
  uint64_t v20;
  float32x2_t *v21;
  CGFloat MidX;
  CGFloat MidY;
  CGFloat Height;
  float64x2_t v25;
  _OWORD *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  float32x2_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  unsigned int v41;
  _OWORD *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint64_t v48;
  _DWORD *result;
  unsigned int v50;
  _OWORD *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  CGFloat x;
  CGFloat y;
  CGFloat v59;
  CGFloat v60;
  float32x2_t *v61;
  CGFloat v62;
  CGFloat v63;
  CGFloat v64;
  float64x2_t v65;
  _OWORD *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  void *v72;
  void *v73;
  CGFloat Width;
  CGFloat v75;
  uint64_t v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;

  objc_msgSend(*(id *)(a1 + 32), "configurator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "configurator");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "containerFrameForAssetSectionLayout:", *(_QWORD *)(a1 + 32));
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;

  }
  else
  {
    v12 = *(double *)(a1 + 40);
    v14 = *(double *)(a1 + 48);
    v16 = *(double *)(a1 + 56);
    v18 = *(double *)(a1 + 64);
  }

  v19 = *(_QWORD *)(a1 + 32);
  if (v19)
  {
    objc_msgSend((id)v19, "sectionIndexPath");
    v19 = *(_QWORD *)(a1 + 32);
  }
  v20 = *(unsigned int *)(v19 + 1064);
  if ((_DWORD)v20 != -1)
  {
    v21 = (float32x2_t *)(a3 + 32 * v20);
    v77.origin.x = v12;
    v77.origin.y = v14;
    v77.size.width = v16;
    v77.size.height = v18;
    MidX = CGRectGetMidX(v77);
    v78.origin.x = v12;
    v78.origin.y = v14;
    v78.size.width = v16;
    v78.size.height = v18;
    MidY = CGRectGetMidY(v78);
    v79.origin.x = v12;
    v79.origin.y = v14;
    v79.size.width = v16;
    v79.size.height = v18;
    Width = CGRectGetWidth(v79);
    v80.origin.x = v12;
    v80.origin.y = v14;
    v80.size.width = v16;
    v80.size.height = v18;
    Height = CGRectGetHeight(v80);
    v25.f64[0] = Width;
    v25.f64[1] = Height;
    *(CGFloat *)v21 = MidX;
    *(CGFloat *)&v21[1] = MidY;
    v21[2] = (float32x2_t)0x406A400000000000;
    v21[3] = vcvt_f32_f64(v25);
    v26 = (_OWORD *)(a4 + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 1064));
    v27 = *((_OWORD *)off_1E50B83A0 + 7);
    v26[6] = *((_OWORD *)off_1E50B83A0 + 6);
    v26[7] = v27;
    v28 = *((_OWORD *)off_1E50B83A0 + 9);
    v26[8] = *((_OWORD *)off_1E50B83A0 + 8);
    v26[9] = v28;
    v29 = *((_OWORD *)off_1E50B83A0 + 3);
    v26[2] = *((_OWORD *)off_1E50B83A0 + 2);
    v26[3] = v29;
    v30 = *((_OWORD *)off_1E50B83A0 + 5);
    v26[4] = *((_OWORD *)off_1E50B83A0 + 4);
    v26[5] = v30;
    v31 = *((_OWORD *)off_1E50B83A0 + 1);
    *v26 = *(_OWORD *)off_1E50B83A0;
    v26[1] = v31;
    *(_BYTE *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 1064) + 1) = 0;
    v19 = *(_QWORD *)(a1 + 32);
  }
  v32 = *(unsigned int *)(v19 + 1068);
  v76 = a4;
  if ((_DWORD)v32 != -1)
  {
    v33 = (float32x2_t *)(a3 + 32 * v32);
    v34 = a4 + 160 * v32;
    v35 = a5 + 40 * v32;
    objc_msgSend((id)v19, "spec");
    v36 = a5;
    v37 = a3;
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "shadow");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    PXGConfigureShadowSprite(v33, v34, v35, v39, *(void **)(a1 + 32), v12, v14, v16, v18);

    a3 = v37;
    a5 = v36;
    *(_QWORD *)(a3 + 32 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 1068) + 16) = 0x4024000000000000;
    *(_QWORD *)(v36 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 1068) + 24) = PXGSectionedSpriteTagMake();
    v19 = *(_QWORD *)(a1 + 32);
  }
  if (*(_BYTE *)(v19 + 1056) && (*(_BYTE *)(v19 + 1049) & 8) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXAssetsSectionLayout _updateLocalSprites]_block_invoke_2");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "handleFailureInFunction:file:lineNumber:description:", v73, CFSTR("PXAssetsSectionLayout.m"), 828, CFSTR("invalidating %lu after it already has been updated"), 2048);
    goto LABEL_23;
  }
  *(_QWORD *)(v19 + 1040) |= 0x800uLL;
  v40 = *(_QWORD *)(a1 + 32);
  v41 = *(_DWORD *)(v40 + 1072);
  if (v41 != -1)
  {
    v42 = (_OWORD *)(v76 + 160 * v41);
    v43 = *((_OWORD *)off_1E50B83A0 + 5);
    v42[4] = *((_OWORD *)off_1E50B83A0 + 4);
    v42[5] = v43;
    v44 = *((_OWORD *)off_1E50B83A0 + 3);
    v42[2] = *((_OWORD *)off_1E50B83A0 + 2);
    v42[3] = v44;
    v45 = *((_OWORD *)off_1E50B83A0 + 9);
    v42[8] = *((_OWORD *)off_1E50B83A0 + 8);
    v42[9] = v45;
    v46 = *((_OWORD *)off_1E50B83A0 + 7);
    v42[6] = *((_OWORD *)off_1E50B83A0 + 6);
    v42[7] = v46;
    v47 = *((_OWORD *)off_1E50B83A0 + 1);
    *v42 = *(_OWORD *)off_1E50B83A0;
    v42[1] = v47;
    *(_BYTE *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 1072)) = 1;
    *(_BYTE *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 1072) + 1) = 10;
    *(_WORD *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 1072) + 32) = *(_WORD *)(*(_QWORD *)(a1 + 32)
                                                                                             + 1076);
    *(_QWORD *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 1072) + 24) = PXGSectionedSpriteTagMake();
    v40 = *(_QWORD *)(a1 + 32);
  }
  v48 = v40 + 1040;
  if (*(_BYTE *)(v48 + 16) && (*(_BYTE *)(v48 + 9) & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXAssetsSectionLayout _updateLocalSprites]_block_invoke_2");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "handleFailureInFunction:file:lineNumber:description:", v73, CFSTR("PXAssetsSectionLayout.m"), 841, CFSTR("invalidating %lu after it already has been updated"), 0x2000);
LABEL_23:

    abort();
  }
  *(_QWORD *)v48 |= 0x2000uLL;
  result = *(_DWORD **)(a1 + 32);
  v50 = result[274];
  if (v50 != -1)
  {
    v51 = (_OWORD *)(v76 + 160 * v50);
    v52 = *((_OWORD *)off_1E50B83A0 + 5);
    v51[4] = *((_OWORD *)off_1E50B83A0 + 4);
    v51[5] = v52;
    v53 = *((_OWORD *)off_1E50B83A0 + 3);
    v51[2] = *((_OWORD *)off_1E50B83A0 + 2);
    v51[3] = v53;
    v54 = *((_OWORD *)off_1E50B83A0 + 9);
    v51[8] = *((_OWORD *)off_1E50B83A0 + 8);
    v51[9] = v54;
    v55 = *((_OWORD *)off_1E50B83A0 + 7);
    v51[6] = *((_OWORD *)off_1E50B83A0 + 6);
    v51[7] = v55;
    v56 = *((_OWORD *)off_1E50B83A0 + 1);
    *v51 = *(_OWORD *)off_1E50B83A0;
    v51[1] = v56;
    *(_BYTE *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 1096)) = 1;
    *(_BYTE *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 1096) + 1) = 10;
    *(_WORD *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 1096) + 32) = *(_WORD *)(*(_QWORD *)(a1 + 32)
                                                                                             + 1100);
    *(_QWORD *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 1096) + 24) = PXGSectionedSpriteTagMake();
    result = *(_DWORD **)(a1 + 32);
  }
  if (result[294] != -1)
  {
    objc_msgSend(result, "intersectionSpacing");
    PXEdgeInsetsMake();
    PXEdgeInsetsInsetRect();
    x = v81.origin.x;
    y = v81.origin.y;
    v59 = v81.size.width;
    v60 = v81.size.height;
    v61 = (float32x2_t *)(a3 + 32 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 1176));
    v62 = CGRectGetMidX(v81);
    v82.origin.x = x;
    v82.origin.y = y;
    v82.size.width = v59;
    v82.size.height = v60;
    v63 = CGRectGetMidY(v82);
    v83.origin.x = x;
    v83.origin.y = y;
    v83.size.width = v59;
    v83.size.height = v60;
    v75 = CGRectGetWidth(v83);
    v84.origin.x = x;
    v84.origin.y = y;
    v84.size.width = v59;
    v84.size.height = v60;
    v64 = CGRectGetHeight(v84);
    v65.f64[0] = v75;
    v65.f64[1] = v64;
    *(CGFloat *)v61 = v62;
    *(CGFloat *)&v61[1] = v63;
    v61[2] = (float32x2_t)0xC000000000000000;
    v61[3] = vcvt_f32_f64(v65);
    v66 = (_OWORD *)(v76 + 160 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 1176));
    v67 = *((_OWORD *)off_1E50B83A0 + 1);
    *v66 = *(_OWORD *)off_1E50B83A0;
    v66[1] = v67;
    v68 = *((_OWORD *)off_1E50B83A0 + 5);
    v66[4] = *((_OWORD *)off_1E50B83A0 + 4);
    v66[5] = v68;
    v69 = *((_OWORD *)off_1E50B83A0 + 3);
    v66[2] = *((_OWORD *)off_1E50B83A0 + 2);
    v66[3] = v69;
    v70 = *((_OWORD *)off_1E50B83A0 + 9);
    v66[8] = *((_OWORD *)off_1E50B83A0 + 8);
    v66[9] = v70;
    v71 = *((_OWORD *)off_1E50B83A0 + 7);
    v66[6] = *((_OWORD *)off_1E50B83A0 + 6);
    v66[7] = v71;
    *(_BYTE *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 1176)) = 1;
    *(_BYTE *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 1176) + 1) = 10;
    result = (_DWORD *)PXGSectionedSpriteTagMake();
    *(_QWORD *)(a5 + 40 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 1176) + 24) = result;
  }
  return result;
}

- (PXAssetsSectionConfigurator)configurator
{
  return self->_configurator;
}

- (void)setDistanceBetweenTitleTopAndBodyBottom:(double)a3
{
  void *v4;
  void *v5;

  if (self->_distanceBetweenTitleTopAndBodyBottom != a3)
  {
    self->_distanceBetweenTitleTopAndBodyBottom = a3;
    if (-[PXAssetsSectionLayout allowsPositionDependentHeaderContentOpacity](self, "allowsPositionDependentHeaderContentOpacity"))
    {
      if (self->_postUpdateFlags.isPerformingUpdate && (self->_postUpdateFlags.updated & 0x400) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXAssetsSectionLayout setDistanceBetweenTitleTopAndBodyBottom:]");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("PXAssetsSectionLayout.m"), 415, CFSTR("invalidating %lu after it already has been updated"), 1024);

        abort();
      }
      self->_postUpdateFlags.needsUpdate |= 0x400uLL;
    }
  }
}

- (void)setDistanceBetweenHeaderTopAndNextBodyTop:(double)a3
{
  void *v4;
  void *v5;

  if (self->_distanceBetweenHeaderTopAndNextBodyTop != a3)
  {
    self->_distanceBetweenHeaderTopAndNextBodyTop = a3;
    if (-[PXAssetsSectionLayout allowsPositionDependentHeaderContentOpacity](self, "allowsPositionDependentHeaderContentOpacity"))
    {
      if (self->_postUpdateFlags.isPerformingUpdate && (self->_postUpdateFlags.updated & 0x400) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXAssetsSectionLayout setDistanceBetweenHeaderTopAndNextBodyTop:]");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("PXAssetsSectionLayout.m"), 426, CFSTR("invalidating %lu after it already has been updated"), 1024);

        abort();
      }
      self->_postUpdateFlags.needsUpdate |= 0x400uLL;
    }
  }
}

- (BOOL)allowsPositionDependentHeaderContentOpacity
{
  return self->_allowsPositionDependentHeaderContentOpacity;
}

- (void)_updateDecorationSource
{
  void *v3;
  int64_t v4;
  void *v5;
  int v6;
  void *v7;
  unsigned int v8;
  unsigned int v9;
  id v10;

  -[PXAssetsSectionLayout assetDecorationSource](self, "assetDecorationSource");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[PXAssetsSectionLayout dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWantsSharedLibraryDecorations:", objc_msgSend(v3, "libraryFilter") != 1);

  objc_msgSend(v10, "setWantsStacksDecorations:", 0);
  v4 = -[PXAssetsSectionLayout zoomLevel](self, "zoomLevel");
  +[PXPhotosGridSettings sharedInstance](PXPhotosGridSettings, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "enableStacksReviewUI");

  +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "showSaliencyRects");
  if (v4 == 3)
    v9 = v8;
  else
    v9 = 0;

  objc_msgSend(v10, "setEnableDebugDecoration:", v6 | v9);
  if (v4 != 4)
  {
    objc_msgSend(v10, "setForbiddenBadges:", 0x208000041FLL);
    objc_msgSend(v10, "setDurationAlwaysHidden:", (unint64_t)(v4 - 1) < 2);
  }

}

- (void)contentSizeDidChange
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PXAssetsSectionLayout;
  -[PXGLayout contentSizeDidChange](&v5, sel_contentSizeDidChange);
  -[PXAssetsSectionLayout _updateLocalSprites](self, "_updateLocalSprites");
  if (self->_postUpdateFlags.isPerformingUpdate && (self->_postUpdateFlags.updated & 0x800) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXAssetsSectionLayout contentSizeDidChange]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PXAssetsSectionLayout.m"), 1857, CFSTR("invalidating %lu after it already has been updated"), 2048);

    abort();
  }
  self->_postUpdateFlags.needsUpdate |= 0x800uLL;
}

- (void)update
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  __int128 v8;
  BOOL v9;
  $F40CD077B40800501ED060B808F886F7 *p_postUpdateFlags;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
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
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  objc_super v38;
  __int128 v39;
  __int128 v40;

  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.willPerformUpdate = 0;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (self->_updateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXAssetsSectionLayout update]");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("PXAssetsSectionLayout.m"), 532, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

      needsUpdate = p_updateFlags->needsUpdate;
    }
    p_updateFlags->isPerformingUpdate = 1;
    p_updateFlags->updated = 1;
    if ((needsUpdate & 1) != 0)
    {
      p_updateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFFELL;
      -[PXAssetsSectionLayout _updateConfigurator](self, "_updateConfigurator");
      if (!p_updateFlags->isPerformingUpdate)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXAssetsSectionLayout update]");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, CFSTR("PXAssetsSectionLayout.m"), 536, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

      }
    }
    v5 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 2uLL;
    if ((v5 & 2) != 0)
    {
      p_updateFlags->needsUpdate = v5 & 0xFFFFFFFFFFFFFFFDLL;
      -[PXAssetsSectionLayout _updateContent](self, "_updateContent");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXAssetsSectionLayout update]");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("PXAssetsSectionLayout.m"), 539, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v6 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 4uLL;
    if ((v6 & 4) != 0)
    {
      p_updateFlags->needsUpdate = v6 & 0xFFFFFFFFFFFFFFFBLL;
      -[PXAssetsSectionLayout _updateLocalSprites](self, "_updateLocalSprites");
    }
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXAssetsSectionLayout update]");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("PXAssetsSectionLayout.m"), 542, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
    v7 = p_updateFlags->needsUpdate;
    p_updateFlags->updated |= 8uLL;
    if ((v7 & 8) != 0)
    {
      p_updateFlags->needsUpdate = v7 & 0xFFFFFFFFFFFFFFF7;
      -[PXAssetsSectionLayout _updateFooter](self, "_updateFooter");
    }
    -[PXAssetsSectionLayout sectionIndexPath](self, "sectionIndexPath");
    v8 = v40;
    *(_OWORD *)&self->_presentedSectionIndexPath.dataSourceIdentifier = v39;
    *(_OWORD *)&self->_presentedSectionIndexPath.item = v8;
    v9 = -[PXAssetsSectionLayout showsSkimmingInteraction](self, "showsSkimmingInteraction")
      || -[PXAssetsSectionLayout showsSkimmingSlideshow](self, "showsSkimmingSlideshow");
    self->_presentedSkimming = v9;
    p_updateFlags->isPerformingUpdate = 0;
    if (p_updateFlags->needsUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXAssetsSectionLayout update]");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, CFSTR("PXAssetsSectionLayout.m"), 547, CFSTR("still needing to update %lu after update pass"), p_updateFlags->needsUpdate);

    }
  }
  v38.receiver = self;
  v38.super_class = (Class)PXAssetsSectionLayout;
  -[PXGSplitLayout update](&v38, sel_update);
  -[PXAssetsSectionLayout _updateDistanceProperties](self, "_updateDistanceProperties");
  p_postUpdateFlags = &self->_postUpdateFlags;
  self->_postUpdateFlags.willPerformUpdate = 0;
  v11 = self->_postUpdateFlags.needsUpdate;
  if (v11)
  {
    if (self->_postUpdateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXAssetsSectionLayout update]");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, CFSTR("PXAssetsSectionLayout.m"), 554, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_postUpdateFlags.isPerformingUpdate"));

      v11 = p_postUpdateFlags->needsUpdate;
    }
    self->_postUpdateFlags.isPerformingUpdate = 1;
    self->_postUpdateFlags.updated = 1024;
    if ((v11 & 0x400) != 0)
    {
      p_postUpdateFlags->needsUpdate = v11 & 0xFFFFFFFFFFFFFBFFLL;
      -[PXAssetsSectionLayout _updateSectionHeaderProperties](self, "_updateSectionHeaderProperties");
      if (!self->_postUpdateFlags.isPerformingUpdate)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXAssetsSectionLayout update]");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "handleFailureInFunction:file:lineNumber:description:", v37, CFSTR("PXAssetsSectionLayout.m"), 558, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_postUpdateFlags.isPerformingUpdate"));

      }
    }
    v12 = p_postUpdateFlags->needsUpdate;
    self->_postUpdateFlags.updated |= 0x800uLL;
    if ((v12 & 0x800) != 0)
    {
      p_postUpdateFlags->needsUpdate = v12 & 0xFFFFFFFFFFFFF7FFLL;
      -[PXAssetsSectionLayout _updateShowAllButtonPosition](self, "_updateShowAllButtonPosition");
    }
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXAssetsSectionLayout update]");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, CFSTR("PXAssetsSectionLayout.m"), 561, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_postUpdateFlags.isPerformingUpdate"));

    }
    v13 = p_postUpdateFlags->needsUpdate;
    self->_postUpdateFlags.updated |= 0x2000uLL;
    if ((v13 & 0x2000) != 0)
    {
      p_postUpdateFlags->needsUpdate = v13 & 0xFFFFFFFFFFFFDFFFLL;
      -[PXAssetsSectionLayout _updateSelectAllButtonPosition](self, "_updateSelectAllButtonPosition");
    }
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXAssetsSectionLayout update]");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "handleFailureInFunction:file:lineNumber:description:", v29, CFSTR("PXAssetsSectionLayout.m"), 564, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_postUpdateFlags.isPerformingUpdate"));

    }
    v14 = p_postUpdateFlags->needsUpdate;
    self->_postUpdateFlags.updated |= 0x1000uLL;
    if ((v14 & 0x1000) != 0)
    {
      p_postUpdateFlags->needsUpdate = v14 & 0xFFFFFFFFFFFFEFFFLL;
      -[PXAssetsSectionLayout _updateAssetsWithCoveredBottomTrailingCorner](self, "_updateAssetsWithCoveredBottomTrailingCorner");
    }
    if (!self->_postUpdateFlags.isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXAssetsSectionLayout update]");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "handleFailureInFunction:file:lineNumber:description:", v31, CFSTR("PXAssetsSectionLayout.m"), 567, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_postUpdateFlags.isPerformingUpdate"));

    }
    v15 = p_postUpdateFlags->needsUpdate;
    self->_postUpdateFlags.updated |= 0x10uLL;
    if ((v15 & 0x10) != 0)
    {
      p_postUpdateFlags->needsUpdate = v15 & 0xFFFFFFFFFFFFFFEFLL;
      -[PXAssetsSectionLayout _updateVisibleRectOvershootFactor](self, "_updateVisibleRectOvershootFactor");
      v15 = p_postUpdateFlags->needsUpdate;
    }
    self->_postUpdateFlags.isPerformingUpdate = 0;
    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXAssetsSectionLayout update]");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "handleFailureInFunction:file:lineNumber:description:", v33, CFSTR("PXAssetsSectionLayout.m"), 570, CFSTR("still needing to update %lu after update pass"), p_postUpdateFlags->needsUpdate);

    }
  }
}

- (BOOL)showsSkimmingSlideshow
{
  return self->_showsSkimmingSlideshow;
}

- (BOOL)showsSkimmingInteraction
{
  return self->_showsSkimmingInteraction;
}

- (void)_updateShowAllButtonPosition
{
  __int128 v3;
  int64_t v5;
  double v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  _QWORD v25[4];
  __int128 v26;
  __int128 v27;
  double v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  CGRect v32;

  v3 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  v30 = *MEMORY[0x1E0C9D628];
  v31 = v3;
  if (self->_showAllButtonSpriteIndex != -1)
  {
    *(double *)&v29 = 1.0;
    v5 = -[PXAssetsSectionLayout showAllAffordanceStyle](self, "showAllAffordanceStyle");
    if (v5 == 1)
    {
      -[PXAssetsSectionLayout _getCuratedLibraryShowAllButtonFrame:alpha:](self, "_getCuratedLibraryShowAllButtonFrame:alpha:", &v30, &v29);
      v6 = *(double *)&v29;
    }
    else if (v5 == 2)
    {
      -[PXGLayout contentSize](self, "contentSize");
      PXRectWithOriginAndSize();
      v9 = v8;
      v11 = v10;
      -[PXAssetsSectionLayout bodyContentLayout](self, "bodyContentLayout");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "contentSize");
      PXRectWithOriginAndSize();
      -[PXGLayout convertRect:fromDescendantLayout:](self, "convertRect:fromDescendantLayout:", v12);
      v14 = v13;
      v16 = v15;
      v18 = v17;
      v20 = v19;
      -[PXAssetsSectionLayout spec](self, "spec");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)&v30 = v9;
      *(_QWORD *)&v31 = v11;
      objc_msgSend(v21, "showAllButtonHeight");
      *((_QWORD *)&v31 + 1) = v22;
      v32.origin.x = v14;
      v32.origin.y = v16;
      v32.size.width = v18;
      v32.size.height = v20;
      *((_QWORD *)&v30 + 1) = CGRectGetMaxY(v32);
      -[PXAssetsSectionLayout showAllButtonTitle](self, "showAllButtonTitle");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
        v6 = 1.0;
      else
        v6 = 0.0;
      *(double *)&v29 = v6;

    }
    else
    {
      v6 = 1.0;
      if (!v5)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetsSectionLayout.m"), 934, CFSTR("Code which should be unreachable has been reached"));

        abort();
      }
    }
    v24 = self->_showAllButtonSpriteIndex | 0x100000000;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __53__PXAssetsSectionLayout__updateShowAllButtonPosition__block_invoke;
    v25[3] = &__block_descriptor_72_e101_v40__0__PXGSpriteIndexRange_II_8_______ddd__16____f_________ffff__4f___ffffSCf____4___24____CCfqSC_32l;
    v26 = v30;
    v27 = v31;
    v28 = v6;
    -[PXGLayout modifySpritesInRange:state:](self, "modifySpritesInRange:state:", v24, v25);
  }
  -[PXAssetsSectionLayout setShowAllButtonFrame:](self, "setShowAllButtonFrame:", v30, v31);
}

- (void)setShowAllButtonFrame:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGRect *p_showAllButtonFrame;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  p_showAllButtonFrame = &self->_showAllButtonFrame;
  if (!CGRectEqualToRect(a3, self->_showAllButtonFrame))
  {
    p_showAllButtonFrame->origin.x = x;
    p_showAllButtonFrame->origin.y = y;
    p_showAllButtonFrame->size.width = width;
    p_showAllButtonFrame->size.height = height;
    -[PXAssetsSectionLayout _invalidateAssetsWithCoveredBottomTrailingCorner](self, "_invalidateAssetsWithCoveredBottomTrailingCorner");
  }
}

- (void)_updateSelectAllButtonPosition
{
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  unint64_t v17;
  int v18;
  double MinX;
  CGSize *p_cachedSelectAllButtonConfigurationSize;
  void *v21;
  CGFloat v22;
  CGFloat v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  CGFloat width;
  double height;
  double v32;
  double v33;
  double v34;
  uint64_t v35;
  void *v36;
  void *v37;
  CGRect recta;
  void *v39;
  double v40;
  double v41;
  CGFloat v42;
  double v43;
  double v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;

  if (self->_selectAllButtonSpriteIndex != -1)
  {
    -[PXAssetsSectionLayout headerLayoutGuide](self, "headerLayoutGuide");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rectInLayout:", self);
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;

    -[PXGLayout contentSize](self, "contentSize");
    v14 = v13;
    v16 = v15;
    v45.origin.x = v6;
    v45.origin.y = v8;
    v45.size.width = v10;
    v45.size.height = v12;
    if (CGRectIsNull(v45))
    {
      v6 = *MEMORY[0x1E0C9D538];
      v8 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      v12 = v16;
      v10 = v14;
    }
    v17 = -[PXAssetsSectionLayout zoomLevel](self, "zoomLevel");
    if (v17 == 3)
    {
      v46.origin.x = v6;
      v46.origin.y = v8;
      v46.size.width = v10;
      v46.size.height = v12;
      MinX = CGRectGetMinX(v46);
      v18 = 1;
    }
    else
    {
      if (v17 < 3 || v17 == 4)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetsSectionLayout.m"), 1083, CFSTR("Code which should be unreachable has been reached"));

        abort();
      }
      v18 = 0;
      MinX = 0.0;
    }
    recta.origin.x = v6;
    p_cachedSelectAllButtonConfigurationSize = &self->_cachedSelectAllButtonConfigurationSize;
    if (PXSizeIsNull())
    {
      -[PXAssetsSectionLayout selectAllButtonConfiguration](self, "selectAllButtonConfiguration");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v21)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetsSectionLayout.m"), 1093, CFSTR("select all button is visible but has no configuration"));

      }
      +[PXCuratedLibraryOverlayButton sizeWithConfiguration:](PXCuratedLibraryOverlayButton, "sizeWithConfiguration:", v21, *(_QWORD *)&v6);
      p_cachedSelectAllButtonConfigurationSize->width = v22;
      self->_cachedSelectAllButtonConfigurationSize.height = v23;

    }
    -[PXAssetsSectionLayout spec](self, "spec", *(_QWORD *)&recta.origin.x);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "padding");
    v26 = v25;

    -[PXAssetsSectionLayout spec](self, "spec");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "padding");
    v29 = v28;

    width = p_cachedSelectAllButtonConfigurationSize->width;
    height = self->_cachedSelectAllButtonConfigurationSize.height;
    v32 = MinX + v26;
    v47.origin.x = recta.origin.x;
    v47.origin.y = v8;
    v47.size.width = v10;
    v47.size.height = v12;
    v33 = CGRectGetMaxY(v47) - height - v29;
    v48.origin.x = v32;
    v48.origin.y = v33;
    v48.size.width = width;
    v48.size.height = height;
    CGRectGetMinY(v48);
    -[PXGLayout visibleRect](self, "visibleRect");
    CGRectGetMinY(v49);
    -[PXGLayout safeAreaInsets](self, "safeAreaInsets");
    v34 = 1.0;
    if (v18)
      PXClamp();
    v35 = self->_selectAllButtonSpriteIndex | 0x100000000;
    *(_QWORD *)&recta.origin.y = MEMORY[0x1E0C809B0];
    *(_QWORD *)&recta.size.width = 3221225472;
    *(_QWORD *)&recta.size.height = __55__PXAssetsSectionLayout__updateSelectAllButtonPosition__block_invoke;
    v39 = &__block_descriptor_72_e101_v40__0__PXGSpriteIndexRange_II_8_______ddd__16____f_________ffff__4f___ffffSCf____4___24____CCfqSC_32l;
    v40 = v32;
    v41 = v33;
    v42 = width;
    v43 = height;
    v44 = v34;
    -[PXGLayout modifySpritesInRange:state:](self, "modifySpritesInRange:state:", v35, &recta.origin.y);
  }
}

- (void)_updateSectionHeaderProperties
{
  PXCuratedLibrarySectionHeaderLayout *v3;
  PXGLayout *p_super;
  PXGLayout *v5;
  PXGLayout *v6;
  PXCuratedLibrarySectionHeaderLayout *v7;
  _QWORD v8[5];
  PXGLayout *v9;
  PXCuratedLibrarySectionHeaderLayout *v10;

  v3 = self->_sectionHeaderLayout;
  p_super = &v3->super;
  if (!v3)
    p_super = self->_headerLayout;
  v5 = p_super;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__PXAssetsSectionLayout__updateSectionHeaderProperties__block_invoke;
  v8[3] = &unk_1E51457C8;
  v8[4] = self;
  v9 = v5;
  v10 = v3;
  v7 = v3;
  v6 = v5;
  -[PXGLayout performChangesWithLocalUpdate:](v6, "performChangesWithLocalUpdate:", v8);

}

void __55__PXAssetsSectionLayout__updateSectionHeaderProperties__block_invoke(id *a1)
{
  double v2;
  double v3;
  double v4;
  _BYTE *v5;
  double v6;
  void *v7;
  double v8;
  id v9;
  CGRect v10;

  +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v2 = 1.0;
  v3 = 1.0;
  if (objc_msgSend(a1[4], "allowsPositionDependentHeaderContentOpacity"))
  {
    objc_msgSend(v9, "floatingHeaderFadeThresholdBetweenHeaderTopAndBodyBottom");
    objc_msgSend(v9, "floatingHeaderFadeOverDistance");
    objc_msgSend(a1[4], "distanceBetweenTitleTopAndBodyBottom");
    v3 = 1.0;
    PXClamp();
    v5 = a1[4];
    if (!v5[1207])
      v3 = v4;
    objc_msgSend(v5, "distanceBetweenHeaderTopAndNextBodyTop");
    objc_msgSend(v9, "floatingHeaderButtonsFadeThresholdBetweenHeaderTopAndNextBodyTop");
    objc_msgSend(a1[4], "safeAreaInsets");
    objc_msgSend(v9, "floatingHeaderButtonsFadeOverDistance");
    PXClamp();
    v2 = v6;
  }
  objc_msgSend(a1[5], "setAlpha:", v3);
  objc_msgSend(a1[6], "setButtonsAlpha:", v2);
  if (objc_msgSend(a1[4], "mode") == 3)
  {
    objc_msgSend(a1[4], "bodyContentLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contentSize");

    objc_msgSend(a1[4], "visibleRect");
    CGRectGetMinY(v10);
    objc_msgSend(a1[4], "intersectionSpacing");
    PXClamp();
  }
  else
  {
    v8 = 1.79769313e308;
  }
  objc_msgSend(a1[6], "setMaxPossibleHeight:", v8);

}

- (double)distanceBetweenTitleTopAndBodyBottom
{
  return self->_distanceBetweenTitleTopAndBodyBottom;
}

- (double)distanceBetweenHeaderTopAndNextBodyTop
{
  return self->_distanceBetweenHeaderTopAndNextBodyTop;
}

- (void)_updateFooter
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  uint64_t v10;
  void *v11;
  int v12;
  _BOOL4 v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  void *v20;

  v3 = *((double *)off_1E50B8020 + 2);
  if (-[PXAssetsSectionLayout showAllAffordanceStyle](self, "showAllAffordanceStyle") == 2)
  {
    v4 = -[PXAssetsSectionLayout showAllCount](self, "showAllCount");
    if (v4 >= 1)
    {
      v5 = v4;
      v6 = (void *)MEMORY[0x1E0CB3940];
      PXLocalizedStringFromTable(CFSTR("PXAssetsSectionShowAllButtonTitleWith%liMorePhotos"), CFSTR("PhotosUICore"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringWithFormat:", v7, v5);
      v19 = objc_claimAutoreleasedReturnValue();

LABEL_4:
      -[PXAssetsSectionLayout spec](self, "spec");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "showAllButtonHeight");
      v3 = v3 + v9;

      v10 = v19;
      goto LABEL_10;
    }
    if (-[PXAssetsSectionLayout hasContentForSummary](self, "hasContentForSummary"))
    {
      if (!+[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled")
        || (+[PXLemonadeSettings sharedInstance](PXLemonadeSettings, "sharedInstance"),
            v11 = (void *)objc_claimAutoreleasedReturnValue(),
            v12 = objc_msgSend(v11, "enableDetailsSummaryButton"),
            v11,
            v12))
      {
        PXLocalizedStringFromTable(CFSTR("PXPhotosGridShowSummaryButtonTitle"), CFSTR("PhotosUICore"));
        v19 = objc_claimAutoreleasedReturnValue();
        goto LABEL_4;
      }
    }
  }
  v10 = 0;
LABEL_10:
  v20 = (void *)v10;
  -[PXAssetsSectionLayout setShowAllButtonTitle:](self, "setShowAllButtonTitle:", v10);
  v13 = -[PXAssetsSectionLayout automaticallyUpdatesPadding](self, "automaticallyUpdatesPadding");
  v14 = v20;
  if (v13)
  {
    v15 = *(double *)off_1E50B8020;
    v16 = *((double *)off_1E50B8020 + 1);
    v17 = *((double *)off_1E50B8020 + 3);
    if (!-[PXAssetsSectionLayout isLastSection](self, "isLastSection"))
    {
      -[PXAssetsSectionLayout intersectionSpacing](self, "intersectionSpacing");
      v3 = v3 + v18;
    }
    -[PXGSplitLayout setPadding:](self, "setPadding:", v15, v16, v3, v17);
    v14 = v20;
  }

}

- (void)setShowAllButtonTitle:(id)a3
{
  NSString *v4;
  BOOL v5;
  NSString *v6;
  NSString *showAllButtonTitle;
  NSString *v8;

  v8 = (NSString *)a3;
  v4 = self->_showAllButtonTitle;
  if (v4 == v8)
  {

  }
  else
  {
    v5 = -[NSString isEqualToString:](v8, "isEqualToString:", v4);

    if (!v5)
    {
      v6 = (NSString *)-[NSString copy](v8, "copy");
      showAllButtonTitle = self->_showAllButtonTitle;
      self->_showAllButtonTitle = v6;

      -[PXAssetsSectionLayout _invalidateShowAllButtonPosition](self, "_invalidateShowAllButtonPosition");
    }
  }

}

- (BOOL)automaticallyUpdatesPadding
{
  return self->_automaticallyUpdatesPadding;
}

- (void)_updateContent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  id v11;

  if (-[PXAssetsSectionLayout numberOfAssets](self, "numberOfAssets"))
  {
    -[PXAssetsSectionLayout headerLayout](self, "headerLayout");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGSplitLayout setFirstSublayout:](self, "setFirstSublayout:", v3);

LABEL_8:
    -[PXAssetsSectionLayout configurator](self, "configurator");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "configureAssetSectionLayout:", self);

    -[PXAssetsSectionLayout delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "assetSectionLayoutDidConfigureLayouts:", self);

    -[PXAssetsSectionLayout dropTargetAssetReference](self, "dropTargetAssetReference");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXAssetsSectionLayout bodyContentLayout](self, "bodyContentLayout");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "layoutForItemChanges");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setDropTargetObjectReference:", v7);

    -[PXAssetsSectionLayout _updateDecorationSource](self, "_updateDecorationSource");
    goto LABEL_9;
  }
  if (-[PXAssetsSectionLayout removesHeaderLayoutWhenEmpty](self, "removesHeaderLayoutWhenEmpty"))
  {
    -[PXGSplitLayout setFirstSublayout:](self, "setFirstSublayout:", 0);
  }
  else
  {
    -[PXAssetsSectionLayout headerLayout](self, "headerLayout");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGSplitLayout setFirstSublayout:](self, "setFirstSublayout:", v4);

  }
  if (!-[PXAssetsSectionLayout removesContentLayoutWhenEmpty](self, "removesContentLayoutWhenEmpty"))
    goto LABEL_8;
  -[PXAssetsSectionLayout setBodyContentLayout:wantsDecoration:](self, "setBodyContentLayout:wantsDecoration:", 0, 0);
LABEL_9:
  v10 = -[PXAssetsSectionLayout section](self, "section");
  -[PXAssetsSectionLayout dataSource](self, "dataSource");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[PXAssetsSectionLayout setIsLastSection:](self, "setIsLastSection:", v10 == objc_msgSend(v11, "numberOfSections") - 1);

}

- (void)setIsLastSection:(BOOL)a3
{
  if (self->_isLastSection != a3)
  {
    self->_isLastSection = a3;
    -[PXAssetsSectionLayout _invalidateFooter](self, "_invalidateFooter");
  }
}

- (PXAssetReference)dropTargetAssetReference
{
  return self->_dropTargetAssetReference;
}

- (PXAssetsSectionLayoutDelegate)delegate
{
  return (PXAssetsSectionLayoutDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)_getCuratedLibraryShowAllButtonFrame:(CGRect *)a3 alpha:(double *)a4
{
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  double MaxX;
  int v15;
  CGSize *p_cachedShowAllButtonConfigurationSize;
  void *v17;
  CGFloat v18;
  CGFloat v19;
  void *v20;
  double v21;
  double v22;
  CGFloat width;
  double height;
  double v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  -[PXGLayout contentSize](self, "contentSize");
  v9 = v8;
  v11 = v10;
  v12 = *MEMORY[0x1E0C9D538];
  v13 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  switch(-[PXAssetsSectionLayout zoomLevel](self, "zoomLevel"))
  {
    case 0:
    case 1:
    case 4:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetsSectionLayout.m"), 971, CFSTR("Code which should be unreachable has been reached"));

      abort();
    case 2:
      v30.origin.x = v12;
      v30.origin.y = v13;
      v30.size.width = v9;
      v30.size.height = v11;
      MaxX = CGRectGetMaxX(v30);
      v15 = 0;
      break;
    case 3:
      v15 = 1;
      MaxX = v9;
      break;
    default:
      v15 = 0;
      MaxX = 0.0;
      break;
  }
  p_cachedShowAllButtonConfigurationSize = &self->_cachedShowAllButtonConfigurationSize;
  if (PXSizeIsNull())
  {
    -[PXAssetsSectionLayout showAllButtonConfiguration](self, "showAllButtonConfiguration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetsSectionLayout.m"), 985, CFSTR("show all button is visible but has no configuration"));

    }
    +[PXCuratedLibraryOverlayButton sizeWithConfiguration:](PXCuratedLibraryOverlayButton, "sizeWithConfiguration:", v17);
    p_cachedShowAllButtonConfigurationSize->width = v18;
    self->_cachedShowAllButtonConfigurationSize.height = v19;

  }
  -[PXAssetsSectionLayout spec](self, "spec");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "padding");
  v22 = v21;

  width = p_cachedShowAllButtonConfigurationSize->width;
  height = self->_cachedShowAllButtonConfigurationSize.height;
  v25 = MaxX - p_cachedShowAllButtonConfigurationSize->width - v22;
  v31.origin.x = v12;
  v31.origin.y = v13;
  v31.size.width = v9;
  v31.size.height = v11;
  v26 = CGRectGetMaxY(v31) - height - v22;
  v32.origin.x = v25;
  v32.origin.y = v26;
  v32.size.width = width;
  v32.size.height = height;
  CGRectGetMinY(v32);
  -[PXGLayout visibleRect](self, "visibleRect");
  CGRectGetMinY(v33);
  -[PXGLayout safeAreaInsets](self, "safeAreaInsets");
  v27 = 1.0;
  if (v15)
    PXClamp();
  a3->origin.x = v25;
  a3->origin.y = v26;
  a3->size.width = width;
  a3->size.height = height;
  *a4 = v27;
}

- (id)viewUserDataForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  PXAssetsSectionLayout *v7;
  PXAssetsSectionLayout *v8;
  PXPhotosGridAddButtonViewUserData *v9;
  PXPhotosGridAddButtonViewUserData *v10;
  void *v11;
  PXAssetsSectionBlurViewConfiguration *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  id location;

  v7 = (PXAssetsSectionLayout *)a4;
  v8 = v7;
  if (v7 == self)
  {
    if (v7->_showAllButtonSpriteIndex == a3)
    {
      if (-[PXAssetsSectionLayout showAllAffordanceStyle](v7, "showAllAffordanceStyle") != 1)
      {
        -[PXAssetsSectionLayout showAllButtonTitle](v8, "showAllButtonTitle");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXAssetsSectionLayout spec](v8, "spec");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "numberOfLinesForShowAllButton");
        -[PXAssetsSectionLayout showAllActionBlock](v8, "showAllActionBlock");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        +[PXAssetsSectionButton configurationWithTitle:numberOfLines:action:](PXAssetsSectionButton, "configurationWithTitle:numberOfLines:action:", v13, v15, v16);
        v10 = (PXPhotosGridAddButtonViewUserData *)objc_claimAutoreleasedReturnValue();

        goto LABEL_12;
      }
      -[PXAssetsSectionLayout showAllButtonConfiguration](v8, "showAllButtonConfiguration");
      v12 = (PXAssetsSectionBlurViewConfiguration *)objc_claimAutoreleasedReturnValue();
    }
    else if (v7->_selectAllButtonSpriteIndex == a3)
    {
      -[PXAssetsSectionLayout selectAllButtonConfiguration](v7, "selectAllButtonConfiguration");
      v12 = (PXAssetsSectionBlurViewConfiguration *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v7->_blurSpriteIndex != a3)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, v8, CFSTR("PXAssetsSectionLayout.m"), 2048, CFSTR("Code which should be unreachable has been reached"));

        abort();
      }
      v12 = v7->_blurViewConfiguration;
    }
    v10 = (PXPhotosGridAddButtonViewUserData *)v12;
    goto LABEL_12;
  }
  objc_initWeak(&location, self);
  v9 = [PXPhotosGridAddButtonViewUserData alloc];
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __63__PXAssetsSectionLayout_viewUserDataForSpriteAtIndex_inLayout___block_invoke;
  v22 = &unk_1E5148D30;
  objc_copyWeak(&v23, &location);
  v10 = -[PXPhotosGridAddButtonViewUserData initWithStyle:actionHandler:](v9, "initWithStyle:actionHandler:", 1, &v19);
  -[PXAssetsSectionLayout spec](self, "spec", v19, v20, v21, v22);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosGridAddButtonViewUserData setPreferredUserInterfaceStyle:](v10, "setPreferredUserInterfaceStyle:", objc_msgSend(v11, "preferredUserInterfaceStyle"));

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
LABEL_12:

  return v10;
}

- (void)_updateLocalSprites
{
  void *v2;
  BOOL isUpdatingLocalSprites;
  uint64_t v5;
  void (**v6)(void *, unsigned int *, uint64_t);
  _BOOL4 v7;
  uint64_t v8;
  int64_t v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL8 v16;
  void *v17;
  id v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD v25[9];
  _QWORD aBlock[7];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  int v42;

  isUpdatingLocalSprites = self->_isUpdatingLocalSprites;
  self->_isUpdatingLocalSprites = 1;
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__28761;
  v37 = __Block_byref_object_dispose__28762;
  v38 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__28761;
  v31 = __Block_byref_object_dispose__28762;
  v32 = 0;
  v5 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __44__PXAssetsSectionLayout__updateLocalSprites__block_invoke;
  aBlock[3] = &unk_1E511C068;
  aBlock[4] = &v39;
  aBlock[5] = &v33;
  aBlock[6] = &v27;
  v6 = (void (**)(void *, unsigned int *, uint64_t))_Block_copy(aBlock);
  v6[2](v6, &self->_sectionBoundariesSpriteIndex, 1);
  v7 = -[PXAssetsSectionLayout wantsShadow](self, "wantsShadow");
  if (v7)
  {
    -[PXAssetsSectionLayout spec](self, "spec");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v2, "userInterfaceStyleAllowsShadow");
  }
  else
  {
    v8 = 0;
  }
  v6[2](v6, &self->_sectionShadowSpriteIndex, v8);
  if (v7)

  v9 = -[PXAssetsSectionLayout showAllAffordanceStyle](self, "showAllAffordanceStyle");
  if (v9 == 1)
  {
    -[PXAssetsSectionLayout showAllButtonConfiguration](self, "showAllButtonConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[PXAssetsSectionLayout showAllActionPerformer](self, "showAllActionPerformer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v12 != 0;

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = v9 == 2;
  }
  v6[2](v6, &self->_showAllButtonSpriteIndex, v10);
  -[PXAssetsSectionLayout spec](self, "spec");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v13, "canShowSelectAllButton"))
  {
    -[PXAssetsSectionLayout selectAllButtonConfiguration](self, "selectAllButtonConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      -[PXAssetsSectionLayout selectAllActionPerformer](self, "selectAllActionPerformer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15 != 0;

    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  v6[2](v6, &self->_selectAllButtonSpriteIndex, v16);
  -[PXAssetsSectionLayout spec](self, "spec");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, &self->_blurSpriteIndex, objc_msgSend(v17, "allowsBlur"));

  if (objc_msgSend((id)v34[5], "count") || objc_msgSend((id)v28[5], "count"))
  {
    v18 = objc_alloc((Class)off_1E50B1608);
    v19 = (void *)objc_msgSend(v18, "initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:", v28[5], v34[5], 0, 0, 0);
    -[PXGLayout applySpriteChangeDetails:countAfterChanges:initialState:modifyState:](self, "applySpriteChangeDetails:countAfterChanges:initialState:modifyState:", v19, *((unsigned int *)v40 + 6), 0, 0);

  }
  -[PXGLayout contentSize](self, "contentSize");
  PXRectWithOriginAndSize();
  v20 = (unint64_t)*((unsigned int *)v40 + 6) << 32;
  v25[0] = v5;
  v25[1] = 3221225472;
  v25[2] = __44__PXAssetsSectionLayout__updateLocalSprites__block_invoke_2;
  v25[3] = &unk_1E513AEF0;
  v25[4] = self;
  v25[5] = v21;
  v25[6] = v22;
  v25[7] = v23;
  v25[8] = v24;
  -[PXGLayout modifySpritesInRange:state:](self, "modifySpritesInRange:state:", v20, v25);
  self->_isUpdatingLocalSprites = isUpdatingLocalSprites;

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&v39, 8);
}

_QWORD *__44__PXAssetsSectionLayout__updateLocalSprites__block_invoke(_QWORD *result, unsigned int *a2, int a3)
{
  _QWORD *v4;
  unsigned int v5;
  unsigned int v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;

  v4 = result;
  v5 = *a2;
  if (a3)
  {
    *a2 = (*(_DWORD *)(*(_QWORD *)(result[4] + 8) + 24))++;
    v6 = *a2;
  }
  else
  {
    v6 = -1;
    *a2 = -1;
  }
  if (v5 == -1)
  {
    if (v6 == -1)
      return result;
    v7 = *(void **)(*(_QWORD *)(result[5] + 8) + 40);
    if (!v7)
    {
      v11 = objc_alloc_init(MEMORY[0x1E0CB3788]);
      v12 = *(_QWORD *)(v4[5] + 8);
      v13 = *(void **)(v12 + 40);
      *(_QWORD *)(v12 + 40) = v11;

      v7 = *(void **)(*(_QWORD *)(v4[5] + 8) + 40);
      v6 = *a2;
    }
  }
  else
  {
    if (v6 != -1)
      return result;
    v7 = *(void **)(*(_QWORD *)(result[6] + 8) + 40);
    if (!v7)
    {
      v8 = objc_alloc_init(MEMORY[0x1E0CB3788]);
      v9 = *(_QWORD *)(v4[6] + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

      v7 = *(void **)(*(_QWORD *)(v4[6] + 8) + 40);
    }
    v6 = v5;
  }
  return (_QWORD *)objc_msgSend(v7, "addIndex:", v6);
}

- (int64_t)showAllAffordanceStyle
{
  return self->_showAllAffordanceStyle;
}

- (PXAssetsSectionLayoutSpec)spec
{
  return self->_spec;
}

- (PXCuratedLibraryOverlayButtonConfiguration)showAllButtonConfiguration
{
  uint64_t v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PXCuratedLibraryOverlayButtonConfiguration *v10;
  void *v11;
  PXCuratedLibraryOverlayButtonConfiguration *showAllButtonConfiguration;

  if (!self->_showAllButtonConfigurationIsValid)
  {
    if (-[PXAssetsSectionLayout zoomLevel](self, "zoomLevel") == 3
      && ((v3 = -[PXAssetsSectionLayout showAllCount](self, "showAllCount"), v3 > 0)
       || (+[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance"),
           v4 = (void *)objc_claimAutoreleasedReturnValue(),
           v5 = objc_msgSend(v4, "forceShowAllButtonsVisible"),
           v4,
           v5)))
    {
      PXLocalizedStringFromTable(CFSTR("PXLibraryDaysShowAllButtonTitleFormat"), CFSTR("PhotosUICore"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      PXLocalizedStringWithValidatedFormat(v6, CFSTR("%li"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      -[PXAssetsSectionLayout configurator](self, "configurator", v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "headerSpecForHeaderStyle:assetSectionLayout:", 2, self);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      +[PXCuratedLibraryOverlayButtonConfiguration configurationWithTitle:spec:](PXCuratedLibraryOverlayButtonConfiguration, "configurationWithTitle:spec:", v7, v9);
      v10 = (PXCuratedLibraryOverlayButtonConfiguration *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        -[PXAssetsSectionLayout showAllActionPerformer](self, "showAllActionPerformer");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setLayout:", self);
        -[PXCuratedLibraryOverlayButtonConfiguration setActionPerformer:](v10, "setActionPerformer:", v11);

      }
    }
    else
    {
      v10 = 0;
    }
    showAllButtonConfiguration = self->_showAllButtonConfiguration;
    self->_showAllButtonConfiguration = v10;

    self->_showAllButtonConfigurationIsValid = 1;
  }
  return self->_showAllButtonConfiguration;
}

- (PXCuratedLibraryShowAllActionPerformer)showAllActionPerformer
{
  return self->_showAllActionPerformer;
}

- (PXCuratedLibraryActionPerformer)selectAllActionPerformer
{
  return self->_selectAllActionPerformer;
}

- (BOOL)wantsShadow
{
  return self->_wantsShadow;
}

- (PXCuratedLibraryOverlayButtonConfiguration)selectAllButtonConfiguration
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  PXCuratedLibraryOverlayButtonConfiguration *v9;
  void *v10;
  PXCuratedLibraryOverlayButtonConfiguration *selectAllButtonConfiguration;

  if (!self->_selectAllButtonConfigurationIsValid)
  {
    -[PXAssetsSectionLayout configurator](self, "configurator");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "headerSpecForHeaderStyle:assetSectionLayout:", 2, self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[PXAssetsSectionLayout selectAllButtonTitle](self, "selectAllButtonTitle");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)v5;
      v7 = &stru_1E5149688;
      if (v5)
        v7 = (__CFString *)v5;
      v8 = v7;

      +[PXCuratedLibraryOverlayButtonConfiguration configurationWithTitle:spec:](PXCuratedLibraryOverlayButtonConfiguration, "configurationWithTitle:spec:", v8, v4);
      v9 = (PXCuratedLibraryOverlayButtonConfiguration *)objc_claimAutoreleasedReturnValue();

      -[PXAssetsSectionLayout selectAllActionPerformer](self, "selectAllActionPerformer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXCuratedLibraryOverlayButtonConfiguration setActionPerformer:](v9, "setActionPerformer:", v10);

    }
    else
    {
      v9 = 0;
    }
    selectAllButtonConfiguration = self->_selectAllButtonConfiguration;
    self->_selectAllButtonConfiguration = v9;

    self->_selectAllButtonConfigurationIsValid = 1;
  }
  return self->_selectAllButtonConfiguration;
}

- (int64_t)showAllCount
{
  int64_t v3;
  void *v4;
  uint64_t v5;

  v3 = -[PXAssetsSectionLayout numberOfAssets](self, "numberOfAssets");
  -[PXAssetsSectionLayout assetCollection](self, "assetCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "estimatedAssetCount");

  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  else
    return v5 - v3;
}

- (NSString)selectAllButtonTitle
{
  return self->_selectAllButtonTitle;
}

- (PXCuratedLibraryActionManager)actionManager
{
  return self->_actionManager;
}

- (void)_invalidateAssetsWithCoveredBottomTrailingCorner
{
  void *v2;
  void *v3;

  if (self->_postUpdateFlags.isPerformingUpdate && (self->_postUpdateFlags.updated & 0x1000) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXAssetsSectionLayout _invalidateAssetsWithCoveredBottomTrailingCorner]");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("PXAssetsSectionLayout.m"), 1134, CFSTR("invalidating %lu after it already has been updated"), 4096);

    abort();
  }
  self->_postUpdateFlags.needsUpdate |= 0x1000uLL;
}

- (void)_updateVisibleRectOvershootFactor
{
  double v3;
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  void *v17;
  double v18;
  double v19;
  double MinY;
  double MaxY;
  double v22;
  CGFloat v23;
  BOOL v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;

  -[PXGLayout visibleRect](self, "visibleRect");
  v26 = v4;
  v27 = v3;
  v6 = v5;
  v8 = v7;
  -[PXGLayout contentSize](self, "contentSize");
  -[PXGLayout referenceSize](self, "referenceSize");
  PXSizeMax();
  PXRectWithOriginAndSize();
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  +[PXLemonadeSettings sharedInstance](PXLemonadeSettings, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "horizontalPagingHintMaximumOvershoot");
  v19 = v18;

  v28.origin.x = v10;
  v28.origin.y = v12;
  v28.size.width = v14;
  v28.size.height = v16;
  MinY = CGRectGetMinY(v28);
  v29.origin.x = v10;
  v29.origin.y = v12;
  v29.size.width = v14;
  v29.size.height = v16;
  MaxY = CGRectGetMaxY(v29);
  v30.origin.x = v27;
  v30.origin.y = v26;
  v30.size.width = v6;
  v30.size.height = v8;
  v22 = CGRectGetMinY(v30);
  v31.origin.x = v27;
  v31.origin.y = v26;
  v31.size.width = v6;
  v31.size.height = v8;
  v23 = CGRectGetMaxY(v31);
  v24 = v23 <= MaxY;
  v25 = (v23 - MaxY) / v19;
  if (v24)
    v25 = 0.0;
  if (v22 <= MinY)
    v25 = -(MinY - v22) / v19;
  -[PXAssetsSectionLayout setVisibleRectOvershootFactor:](self, "setVisibleRectOvershootFactor:", v25);
}

- (void)setDraggedAssetReferences:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXAssetsSectionLayout assetDecorationSource](self, "assetDecorationSource");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDraggedAssetReferences:", v4);

}

- (PXAssetsSectionLayout)initWithSection:(int64_t)a3 dataSource:(id)a4 actionManager:(id)a5 loadingStatusManager:(id)a6 assetImportStatusManager:(id)a7 inlinePlaybackController:(id)a8 zoomLevel:(int64_t)a9 spec:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  PXAssetsSectionLayout *v20;
  PXAssetsSectionLayout *v21;
  PXPhotosGridAssetDecorationSource *v22;
  PXPhotosGridAssetDecorationSource *assetDecorationSource;
  void *v24;
  CGSize v25;
  id v28;
  objc_super v29;

  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v28 = a8;
  v19 = a10;
  v29.receiver = self;
  v29.super_class = (Class)PXAssetsSectionLayout;
  v20 = -[PXGLayout init](&v29, sel_init);
  v21 = v20;
  if (v20)
  {
    v20->_sectionBoundariesSpriteIndex = -1;
    v20->_sectionShadowSpriteIndex = -1;
    v20->_showAllButtonSpriteIndex = -1;
    v20->_selectAllButtonSpriteIndex = -1;
    v20->_blurSpriteIndex = -1;
    objc_storeStrong((id *)&v20->_loadingStatusManager, a6);
    v22 = objc_alloc_init(PXPhotosGridAssetDecorationSource);
    assetDecorationSource = v21->_assetDecorationSource;
    v21->_assetDecorationSource = v22;

    -[PXPhotosGridAssetDecorationSource setLoadingStatusManager:](v21->_assetDecorationSource, "setLoadingStatusManager:", v21->_loadingStatusManager);
    -[PXPhotosGridAssetDecorationSource setAssetImportStatusManager:](v21->_assetDecorationSource, "setAssetImportStatusManager:", v18);
    -[PXAssetsSectionLayout setDataSource:section:](v21, "setDataSource:section:", v15, a3);
    objc_storeStrong((id *)&v21->_actionManager, a5);
    -[PXAssetsSectionLayout setZoomLevel:](v21, "setZoomLevel:", a9);
    -[PXAssetsSectionLayout setSpec:](v21, "setSpec:", v19);
    -[PXGSplitLayout setMode:](v21, "setMode:", 0);
    -[PXGLayout setContentSource:](v21, "setContentSource:", v21);
    -[PXGLayout axGroup](v21, "axGroup");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setAxRole:", 1);

    objc_storeStrong((id *)&v21->_inlinePlaybackController, a8);
    v21->_cachedShowAllButtonConfigurationSize = *(CGSize *)off_1E50B8810;
    v25 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    v21->_showAllButtonFrame.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    v21->_showAllButtonFrame.size = v25;
    v21->_removesHeaderLayoutWhenEmpty = 1;
    v21->_removesContentLayoutWhenEmpty = 1;
  }

  return v21;
}

- (void)setZoomLevel:(int64_t)a3
{
  if (self->_zoomLevel != a3)
  {
    self->_zoomLevel = a3;
    -[PXAssetsSectionLayout _invalidateConfigurator](self, "_invalidateConfigurator");
    -[PXAssetsSectionLayout _invalidateContent](self, "_invalidateContent");
    -[PXAssetsSectionLayout _invalidateShowAllButton](self, "_invalidateShowAllButton");
    -[PXAssetsSectionLayout _invalidateSelectAllButton](self, "_invalidateSelectAllButton");
  }
}

- (void)setDataSource:(id)a3 section:(int64_t)a4
{
  PXAssetsDataSource *v8;
  PXDisplayAssetFetchResult *cachedClampedFetchResult;
  void *v10;
  void *v11;
  PXAssetsDataSource *v12;

  v8 = (PXAssetsDataSource *)a3;
  if (self->_section != a4 || self->_dataSource != v8)
  {
    self->_section = a4;
    v12 = v8;
    objc_storeStrong((id *)&self->_dataSource, a3);
    if (-[PXAssetsDataSource numberOfSections](v12, "numberOfSections") <= a4)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetsSectionLayout.m"), 194, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("section < dataSource.numberOfSections"));

    }
    self->_cachedClampedItemRange = (_NSRange)xmmword_1A7C0C330;
    cachedClampedFetchResult = self->_cachedClampedFetchResult;
    self->_cachedClampedFetchResult = 0;

    -[PXAssetsSectionLayout assetDecorationSource](self, "assetDecorationSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDataSource:section:", v12, a4);

    -[PXAssetsSectionLayout _invalidateContent](self, "_invalidateContent");
    -[PXAssetsSectionLayout _invalidateFooter](self, "_invalidateFooter");
    -[PXAssetsSectionLayout _invalidateShowAllButton](self, "_invalidateShowAllButton");
    -[PXAssetsSectionLayout _invalidateSelectAllButton](self, "_invalidateSelectAllButton");
    v8 = v12;
  }

}

- (void)_invalidateShowAllButton
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;

  ++self->_showAllButtonVersion;
  self->_cachedShowAllButtonConfigurationSize = *(CGSize *)off_1E50B8810;
  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 4;
      goto LABEL_7;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 4) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXAssetsSectionLayout _invalidateShowAllButton]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXAssetsSectionLayout.m"), 919, CFSTR("invalidating %lu after it already has been updated"), 4);

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
LABEL_7:
  self->_showAllButtonConfigurationIsValid = 0;
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
      p_updateFlags->needsUpdate = needsUpdate | 8;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 8) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXAssetsSectionLayout _invalidateFooter]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXAssetsSectionLayout.m"), 665, CFSTR("invalidating %lu after it already has been updated"), 8);

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

- (void)_invalidateSelectAllButton
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v5;
  void *v6;

  ++self->_selectAllButtonVersion;
  self->_cachedSelectAllButtonConfigurationSize = *(CGSize *)off_1E50B8810;
  self->_selectAllButtonConfigurationIsValid = 0;
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXAssetsSectionLayout _invalidateSelectAllButton]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXAssetsSectionLayout.m"), 1057, CFSTR("invalidating %lu after it already has been updated"), 4);

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

- (void)setSelectionSnapshot:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[PXAssetsSectionLayout assetDecorationSource](self, "assetDecorationSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelectionSnapshot:", v4);

  -[PXAssetsSectionLayout _invalidateContent](self, "_invalidateContent");
  -[PXGLayout invalidateDecoration](self, "invalidateDecoration");
}

- (void)_invalidateContent
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;

  -[PXGLayout invalidateVersion](self, "invalidateVersion");
  p_updateFlags = &self->_updateFlags;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (needsUpdate)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_6:
      p_updateFlags->needsUpdate = needsUpdate | 6;
      return;
    }
LABEL_5:
    if ((self->_updateFlags.updated & 6) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXAssetsSectionLayout _invalidateContent]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXAssetsSectionLayout.m"), 712, CFSTR("invalidating %lu after it already has been updated"), 6);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_updateFlags.willPerformUpdate;
  p_updateFlags->needsUpdate = 6;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_invalidateConfigurator
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXAssetsSectionLayout _invalidateConfigurator]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXAssetsSectionLayout.m"), 650, CFSTR("invalidating %lu after it already has been updated"), 1);

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

- (void)setSelectAllButtonTitle:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->_selectAllButtonTitle != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_selectAllButtonTitle, a3);
    -[PXAssetsSectionLayout _invalidateSelectAllButton](self, "_invalidateSelectAllButton");
    v5 = v6;
  }

}

- (BOOL)isSelecting
{
  return self->_isSelecting;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  id v11;

  v6 = a4;
  v9 = a3;
  if ((void *)PXHeaderLayoutGuideObservationContext != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetsSectionLayout.m"), 1878, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 1) != 0)
  {
    v11 = v9;
    -[PXAssetsSectionLayout _invalidateSelectAllButtonPosition](self, "_invalidateSelectAllButtonPosition");
    v9 = v11;
  }

}

- (void)setSpec:(id)a3
{
  PXAssetsSectionLayoutSpec *v5;
  PXAssetsSectionLayoutSpec *v6;

  v5 = (PXAssetsSectionLayoutSpec *)a3;
  if (self->_spec != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_spec, a3);
    -[PXAssetsSectionLayout _invalidateConfigurator](self, "_invalidateConfigurator");
    -[PXAssetsSectionLayout _invalidateFooter](self, "_invalidateFooter");
    -[PXAssetsSectionLayout _invalidateShowAllButton](self, "_invalidateShowAllButton");
    -[PXAssetsSectionLayout _invalidateShowAllButtonPosition](self, "_invalidateShowAllButtonPosition");
    -[PXAssetsSectionLayout _invalidateSelectAllButton](self, "_invalidateSelectAllButton");
    v5 = v6;
  }

}

- (void)visibleRectDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXAssetsSectionLayout;
  -[PXGSplitLayout visibleRectDidChange](&v3, sel_visibleRectDidChange);
  -[PXAssetsSectionLayout _invalidateShowAllButtonPosition](self, "_invalidateShowAllButtonPosition");
  -[PXAssetsSectionLayout _invalidateSelectAllButtonPosition](self, "_invalidateSelectAllButtonPosition");
  -[PXAssetsSectionLayout _invalidateVisibleRectOvershootFactor](self, "_invalidateVisibleRectOvershootFactor");
}

- (void)_invalidateShowAllButtonPosition
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
      p_postUpdateFlags->needsUpdate = needsUpdate | 0x800;
      return;
    }
LABEL_5:
    if ((self->_postUpdateFlags.updated & 0x800) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXAssetsSectionLayout _invalidateShowAllButtonPosition]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXAssetsSectionLayout.m"), 924, CFSTR("invalidating %lu after it already has been updated"), 2048);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_postUpdateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_postUpdateFlags.willPerformUpdate;
  p_postUpdateFlags->needsUpdate = 2048;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_invalidateSelectAllButtonPosition
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
      p_postUpdateFlags->needsUpdate = needsUpdate | 0x2000;
      return;
    }
LABEL_5:
    if ((self->_postUpdateFlags.updated & 0x2000) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXAssetsSectionLayout _invalidateSelectAllButtonPosition]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXAssetsSectionLayout.m"), 1061, CFSTR("invalidating %lu after it already has been updated"), 0x2000);

      abort();
    }
    goto LABEL_6;
  }
  if (self->_postUpdateFlags.isPerformingUpdate)
    goto LABEL_5;
  willPerformUpdate = self->_postUpdateFlags.willPerformUpdate;
  p_postUpdateFlags->needsUpdate = 0x2000;
  if (!willPerformUpdate)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
}

- (void)_invalidateVisibleRectOvershootFactor
{
  void *v2;
  void *v3;

  if (self->_postUpdateFlags.isPerformingUpdate && (self->_postUpdateFlags.updated & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXAssetsSectionLayout _invalidateVisibleRectOvershootFactor]");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("PXAssetsSectionLayout.m"), 1195, CFSTR("invalidating %lu after it already has been updated"), 16);

    abort();
  }
  self->_postUpdateFlags.needsUpdate |= 0x10uLL;
}

- (void)enumerateVisibleAnchoringLayoutsUsingBlock:(id)a3
{
  void (**v4)(id, PXAssetsSectionLayout *, _BYTE *);
  PXAssetsSectionLayout *v5;
  PXAssetsSectionLayout *v6;
  char v7;

  v4 = (void (**)(id, PXAssetsSectionLayout *, _BYTE *))a3;
  if (-[PXAssetsSectionLayout _shouldAnchorOnAssetCollection](self, "_shouldAnchorOnAssetCollection"))
  {
    v5 = self;
  }
  else
  {
    -[PXAssetsSectionLayout bodyContentLayout](self, "bodyContentLayout");
    v5 = (PXAssetsSectionLayout *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  if (v5)
  {
    v7 = 0;
    v4[2](v4, v5, &v7);
  }

}

- (void)enumerateVisibleAnchoringSpriteIndexesUsingBlock:(id)a3
{
  void (**v4)(id, uint64_t, uint64_t, char *);
  uint64_t sectionBoundariesSpriteIndex;
  objc_super v6;
  char v7;

  v4 = (void (**)(id, uint64_t, uint64_t, char *))a3;
  if (-[PXAssetsSectionLayout _shouldAnchorOnAssetCollection](self, "_shouldAnchorOnAssetCollection"))
  {
    sectionBoundariesSpriteIndex = self->_sectionBoundariesSpriteIndex;
    if ((_DWORD)sectionBoundariesSpriteIndex != -1)
    {
      v7 = 0;
      v4[2](v4, sectionBoundariesSpriteIndex, 1, &v7);
    }
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PXAssetsSectionLayout;
    -[PXGLayout enumerateVisibleAnchoringSpriteIndexesUsingBlock:](&v6, sel_enumerateVisibleAnchoringSpriteIndexesUsingBlock_, v4);
  }

}

- (BOOL)_shouldAnchorOnAssetCollection
{
  int64_t v4;
  void *v6;

  v4 = -[PXAssetsSectionLayout zoomLevel](self, "zoomLevel");
  if ((unint64_t)(v4 - 1) < 2)
    return 1;
  if ((unint64_t)(v4 - 3) < 2)
    return (unint64_t)(-[PXAssetsSectionLayout targetZoomLevel](self, "targetZoomLevel") - 1) < 2;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetsSectionLayout.m"), 1466, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  return 0;
}

- (int64_t)targetZoomLevel
{
  return self->_targetZoomLevel;
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
  v8.super_class = (Class)PXAssetsSectionLayout;
  -[PXGSplitLayout displayScaleDidChange](&v8, sel_displayScaleDidChange);
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
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXAssetsSectionLayout displayScaleDidChange]");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXAssetsSectionLayout.m"), 1862, CFSTR("invalidating %lu after it already has been updated"), 4);

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

- (void)viewEnvironmentDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXAssetsSectionLayout;
  -[PXGSplitLayout viewEnvironmentDidChange](&v3, sel_viewEnvironmentDidChange);
  -[PXAssetsSectionLayout _updateEffectiveBlurIntensity](self, "_updateEffectiveBlurIntensity");
}

- (void)_updateEffectiveBlurIntensity
{
  id v3;

  -[PXGLayout viewEnvironment](self, "viewEnvironment");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isBeingFullPageSnapshotted") & 1) == 0)
    -[PXAssetsSectionLayout blurIntensity](self, "blurIntensity");
  -[PXAssetsSectionLayout setEffectiveBlurIntensity:](self, "setEffectiveBlurIntensity:");

}

- (void)setEffectiveBlurIntensity:(double)a3
{
  if (self->_effectiveBlurIntensity != a3)
  {
    self->_effectiveBlurIntensity = a3;
    -[PXAssetsSectionLayout _updateBlurSprite](self, "_updateBlurSprite");
  }
}

- (double)blurIntensity
{
  return self->_blurIntensity;
}

- (void)_updateConfigurator
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[PXAssetsSectionLayout spec](self, "spec");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[PXAssetsSectionLayout zoomLevel](self, "zoomLevel");
  if (-[PXAssetsSectionLayout disableConfigurators](self, "disableConfigurators"))
  {
    v4 = 0;
  }
  else
  {
    -[PXAssetsSectionLayout assetCollectionReference](self, "assetCollectionReference");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assetCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sectionConfiguratorForAssetCollection:inZoomLevel:", v6, v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[PXAssetsSectionLayout setConfigurator:](self, "setConfigurator:", v4);
  -[PXAssetsSectionLayout setAllowsPositionDependentHeaderContentOpacity:](self, "setAllowsPositionDependentHeaderContentOpacity:", objc_msgSend(v7, "allowsPositionDependentHeaderContentOpacityInZoomLevel:", v3));

}

- (void)setConfigurator:(id)a3
{
  PXAssetsSectionConfigurator *v5;
  PXAssetsSectionConfigurator *v6;

  v5 = (PXAssetsSectionConfigurator *)a3;
  if (self->_configurator != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_configurator, a3);
    -[PXAssetsSectionLayout _invalidateContent](self, "_invalidateContent");
    v5 = v6;
  }

}

- (void)setAllowsPositionDependentHeaderContentOpacity:(BOOL)a3
{
  void *v3;
  void *v4;

  if (self->_allowsPositionDependentHeaderContentOpacity != a3)
  {
    self->_allowsPositionDependentHeaderContentOpacity = a3;
    if (self->_postUpdateFlags.isPerformingUpdate && (self->_postUpdateFlags.updated & 0x400) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXAssetsSectionLayout setAllowsPositionDependentHeaderContentOpacity:]");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PXAssetsSectionLayout.m"), 443, CFSTR("invalidating %lu after it already has been updated"), 1024);

      abort();
    }
    self->_postUpdateFlags.needsUpdate |= 0x400uLL;
  }
}

- (BOOL)disableConfigurators
{
  return self->_disableConfigurators;
}

- (void)_updateAssetsWithCoveredBottomTrailingCorner
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
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  id v24;
  void *v25;
  _QWORD v26[5];
  CGRect v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  -[PXAssetsSectionLayout showAllButtonFrame](self, "showAllButtonFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[PXAssetsSectionLayout bodyContentLayout](self, "bodyContentLayout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v32.origin.x = v4;
  v32.origin.y = v6;
  v32.size.width = v8;
  v32.size.height = v10;
  if (CGRectIsEmpty(v32) || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v23 = 0;
  }
  else
  {
    objc_msgSend(v11, "convertRect:fromLayout:", self, v4, v6, v8, v10);
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    -[PXAssetsSectionLayout spec](self, "spec");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "padding");
    v22 = v21;

    v33.origin.x = v13;
    v33.origin.y = v15;
    v33.size.width = v17;
    v33.size.height = v19;
    v34 = CGRectInset(v33, v22 * -2.0, v22 * -2.0);
    v28 = 0;
    v29 = &v28;
    v30 = 0x2020000000;
    v31 = 0x7FFFFFFFFFFFFFFFLL;
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __69__PXAssetsSectionLayout__updateAssetsWithCoveredBottomTrailingCorner__block_invoke;
    v26[3] = &unk_1E511AB18;
    v27 = v34;
    v26[4] = &v28;
    objc_msgSend(v11, "enumerateItemsInRect:usingBlock:", v26, v13, v15, v17, v19);
    if (v29[3] == 0x7FFFFFFFFFFFFFFFLL)
    {
      v23 = 0;
    }
    else
    {
      v24 = objc_alloc(MEMORY[0x1E0CB36B8]);
      v23 = (void *)objc_msgSend(v24, "initWithIndex:", v29[3]);
    }
    _Block_object_dispose(&v28, 8);
  }
  -[PXAssetsSectionLayout assetDecorationSource](self, "assetDecorationSource");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setItemsWithCoveredBottomTrailingCorner:", v23);

}

BOOL __69__PXAssetsSectionLayout__updateAssetsWithCoveredBottomTrailingCorner__block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  CGFloat MaxX;
  _BOOL8 result;
  CGPoint v16;
  CGRect v17;

  MaxX = CGRectGetMaxX(*(CGRect *)&a4);
  v17.origin.x = a4;
  v17.origin.y = a5;
  v17.size.width = a6;
  v17.size.height = a7;
  v16.y = CGRectGetMaxY(v17);
  v16.x = MaxX;
  result = CGRectContainsPoint(*(CGRect *)(a1 + 40), v16);
  if (result)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;
    *a3 = 1;
  }
  return result;
}

- (CGRect)showAllButtonFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_showAllButtonFrame.origin.x;
  y = self->_showAllButtonFrame.origin.y;
  width = self->_showAllButtonFrame.size.width;
  height = self->_showAllButtonFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setShowsSkimmingSlideshow:(BOOL)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;

  if (self->_showsSkimmingSlideshow != a3)
  {
    self->_showsSkimmingSlideshow = a3;
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
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXAssetsSectionLayout setShowsSkimmingSlideshow:]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXAssetsSectionLayout.m"), 272, CFSTR("invalidating %lu after it already has been updated"), 2);

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

- (void)setShowsSkimmingInteraction:(BOOL)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;

  if (self->_showsSkimmingInteraction != a3)
  {
    self->_showsSkimmingInteraction = a3;
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
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXAssetsSectionLayout setShowsSkimmingInteraction:]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXAssetsSectionLayout.m"), 281, CFSTR("invalidating %lu after it already has been updated"), 2);

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
        p_updateFlags->needsUpdate = needsUpdate | 2;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 2) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXAssetsSectionLayout setMaxSkimmingIndex:]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXAssetsSectionLayout.m"), 326, CFSTR("invalidating %lu after it already has been updated"), 2);

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

- (void)setIsSkimming:(BOOL)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;

  if (self->_isSkimming != a3)
  {
    self->_isSkimming = a3;
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
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXAssetsSectionLayout setIsSkimming:]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXAssetsSectionLayout.m"), 309, CFSTR("invalidating %lu after it already has been updated"), 2);

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

- (void)setCurrentSkimmingIndex:(int64_t)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;

  if (self->_currentSkimmingIndex != a3)
  {
    self->_currentSkimmingIndex = a3;
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
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXAssetsSectionLayout setCurrentSkimmingIndex:]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXAssetsSectionLayout.m"), 335, CFSTR("invalidating %lu after it already has been updated"), 2);

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

- (PXAssetsSectionLayout)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetsSectionLayout.m"), 121, CFSTR("%s is not available as initializer"), "-[PXAssetsSectionLayout init]");

  abort();
}

- (PXAssetsSectionLayout)initWithSection:(int64_t)a3 dataSource:(id)a4 spec:(id)a5
{
  return -[PXAssetsSectionLayout initWithSection:dataSource:actionManager:loadingStatusManager:assetImportStatusManager:inlinePlaybackController:zoomLevel:spec:](self, "initWithSection:dataSource:actionManager:loadingStatusManager:assetImportStatusManager:inlinePlaybackController:zoomLevel:spec:", a3, a4, 0, 0, 0, 0, 4, a5);
}

- (PXSelectionSnapshot)selectionSnapshot
{
  void *v2;
  void *v3;

  -[PXAssetsSectionLayout assetDecorationSource](self, "assetDecorationSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "selectionSnapshot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXSelectionSnapshot *)v3;
}

- (NSSet)draggedAssetReferences
{
  void *v2;
  void *v3;

  -[PXAssetsSectionLayout assetDecorationSource](self, "assetDecorationSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "draggedAssetReferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (void)setDropTargetAssetReference:(id)a3
{
  PXAssetReference *v5;
  PXAssetReference *v6;
  char v7;
  PXAssetReference *v8;

  v8 = (PXAssetReference *)a3;
  v5 = self->_dropTargetAssetReference;
  if (v5 == v8)
  {

  }
  else
  {
    v6 = v5;
    v7 = -[PXAssetReference isEqual:](v5, "isEqual:", v8);

    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_dropTargetAssetReference, a3);
      -[PXAssetsSectionLayout _invalidateContent](self, "_invalidateContent");
    }
  }

}

- (void)setDisableConfigurators:(BOOL)a3
{
  if (self->_disableConfigurators != a3)
  {
    self->_disableConfigurators = a3;
    -[PXAssetsSectionLayout _invalidateConfigurator](self, "_invalidateConfigurator");
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
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXAssetsSectionLayout setSkimmingIndexPaths:]");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("PXAssetsSectionLayout.m"), 317, CFSTR("invalidating %lu after it already has been updated"), 2);

      abort();
    }
    goto LABEL_9;
  }
LABEL_11:

}

- (void)setAddContentActionHandler:(id)a3
{
  void *v4;
  id addContentActionHandler;

  if (self->_addContentActionHandler != a3)
  {
    v4 = (void *)objc_msgSend(a3, "copy");
    addContentActionHandler = self->_addContentActionHandler;
    self->_addContentActionHandler = v4;

    -[PXAssetsSectionLayout _invalidateContent](self, "_invalidateContent");
  }
}

- (void)_callAddContentActionHandler
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];

  -[PXAssetsSectionLayout addContentActionHandler](self, "addContentActionHandler");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    (*(void (**)(uint64_t, PXAssetsSectionLayout *))(v3 + 16))(v3, self);
  }
  else
  {
    PLGridZeroGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_ERROR, "Missing add content handler for add button press", v6, 2u);
    }

  }
}

- (void)setItemCaptionsVisible:(BOOL)a3
{
  if (self->_itemCaptionsVisible != a3)
  {
    self->_itemCaptionsVisible = a3;
    -[PXAssetsSectionLayout _invalidateContent](self, "_invalidateContent");
  }
}

- (void)setWantsDimmedSelectionStyle:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  if (self->_wantsDimmedSelectionStyle != a3)
  {
    v3 = a3;
    self->_wantsDimmedSelectionStyle = a3;
    -[PXAssetsSectionLayout assetDecorationSource](self, "assetDecorationSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWantsDimmedSelectionStyle:", v3);

    -[PXGLayout invalidateDecoration](self, "invalidateDecoration");
  }
}

- (void)setWantsNumberedSelectionStyle:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  if (self->_wantsNumberedSelectionStyle != a3)
  {
    v3 = a3;
    self->_wantsNumberedSelectionStyle = a3;
    -[PXAssetsSectionLayout assetDecorationSource](self, "assetDecorationSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWantsNumberedSelectionStyle:", v3);

    -[PXGLayout invalidateDecoration](self, "invalidateDecoration");
  }
}

- (void)setWantsFileSizeBadge:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  if (self->_wantsFileSizeBadge != a3)
  {
    v3 = a3;
    self->_wantsFileSizeBadge = a3;
    -[PXAssetsSectionLayout assetDecorationSource](self, "assetDecorationSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWantsFileSizeBadge:", v3);

    -[PXGLayout invalidateDecoration](self, "invalidateDecoration");
  }
}

- (void)setWantsAssetIndexBadge:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  if (self->_wantsAssetIndexBadge != a3)
  {
    v3 = a3;
    self->_wantsAssetIndexBadge = a3;
    -[PXAssetsSectionLayout assetDecorationSource](self, "assetDecorationSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWantsAssetIndexBadge:", v3);

    -[PXGLayout invalidateDecoration](self, "invalidateDecoration");
  }
}

- (void)setAutomaticallyUpdatesPadding:(BOOL)a3
{
  if (self->_automaticallyUpdatesPadding != a3)
  {
    self->_automaticallyUpdatesPadding = a3;
    -[PXAssetsSectionLayout _invalidateFooter](self, "_invalidateFooter");
  }
}

- (void)setFaceModeEnabled:(BOOL)a3
{
  if (self->_faceModeEnabled != a3)
  {
    self->_faceModeEnabled = a3;
    -[PXAssetsSectionLayout _invalidateContent](self, "_invalidateContent");
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
    -[PXAssetsSectionLayout _invalidateContent](self, "_invalidateContent", *(_QWORD *)&a3.var0.var0.var0, *(_QWORD *)&a3.var0.var1[2]);
  }
}

- (id)layoutForItemChanges
{
  void *v2;
  void *v3;

  -[PXAssetsSectionLayout bodyContentLayout](self, "bodyContentLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutForItemChanges");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)description
{
  void *v3;
  unint64_t v4;
  __CFString *v5;
  __CFString *v6;
  int64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PXAssetsSectionLayout;
  -[PXAssetsSectionLayout description](&v13, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PXAssetsSectionLayout zoomLevel](self, "zoomLevel");
  if (v4 > 4)
    v5 = CFSTR("???");
  else
    v5 = off_1E513F168[v4];
  v6 = v5;
  v7 = -[PXAssetsSectionLayout section](self, "section");
  -[PXAssetsSectionLayout dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "identifier");
  -[PXAssetsSectionLayout assetCollection](self, "assetCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "px_stringByAppendingDescriptionDetailsWithFormat:", CFSTR(", zoomLevel=%@, section=%lu, dataSourceIdentifier=%li assetCollection={%@}"), v6, v7, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (void)setDecorationDataSource:(id)a3
{
  void *v5;
  PXPhotosCustomViewDecorationDataSource *v6;

  v6 = (PXPhotosCustomViewDecorationDataSource *)a3;
  if (self->_decorationDataSource != v6)
  {
    objc_storeStrong((id *)&self->_decorationDataSource, a3);
    -[PXAssetsSectionLayout assetDecorationSource](self, "assetDecorationSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDecorationDataSource:", v6);

  }
}

- (void)setRemovesHeaderLayoutWhenEmpty:(BOOL)a3
{
  if (self->_removesHeaderLayoutWhenEmpty != a3)
  {
    self->_removesHeaderLayoutWhenEmpty = a3;
    -[PXAssetsSectionLayout _invalidateContent](self, "_invalidateContent");
  }
}

- (void)setRemovesContentLayoutWhenEmpty:(BOOL)a3
{
  if (self->_removesContentLayoutWhenEmpty != a3)
  {
    self->_removesContentLayoutWhenEmpty = a3;
    -[PXAssetsSectionLayout _invalidateContent](self, "_invalidateContent");
  }
}

- (BOOL)hasContentForSummary
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v10;

  -[PXAssetsSectionLayout dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAssetsSectionLayout sectionIndexPath](self, "sectionIndexPath");
  v4 = objc_msgSend(v3, "numberOfCuratedItemsInSectionIndexPath:", &v10);

  -[PXAssetsSectionLayout assetCollection](self, "assetCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "estimatedAssetCount");

  return v6 != 0x7FFFFFFFFFFFFFFFLL && v4 != v6 && v4 > 0;
}

- (void)setBlurIntensity:(double)a3
{
  if (self->_blurIntensity != a3)
  {
    self->_blurIntensity = a3;
    -[PXAssetsSectionLayout _updateEffectiveBlurIntensity](self, "_updateEffectiveBlurIntensity");
  }
}

- (void)_updateBlurSprite
{
  double v3;
  double v4;
  PXAssetsSectionBlurViewConfiguration *v5;
  double v6;
  double v7;
  double v8;
  PXAssetsSectionBlurViewConfiguration *v9;
  PXAssetsSectionBlurViewConfiguration *blurViewConfiguration;
  uint64_t v11;
  id v12;
  _QWORD v13[5];

  if (self->_blurSpriteIndex != -1)
  {
    +[PXPhotosGridSettings sharedInstance](PXPhotosGridSettings, "sharedInstance");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[PXAssetsSectionLayout effectiveBlurIntensity](self, "effectiveBlurIntensity");
    v4 = v3;
    v5 = [PXAssetsSectionBlurViewConfiguration alloc];
    objc_msgSend(v12, "maximumBlurRadius");
    v7 = v6;
    objc_msgSend(v12, "maximumBlurDimmingFraction");
    v9 = -[PXAssetsSectionBlurViewConfiguration initWithIntensity:maximumBlurRadius:maximumDimmingFraction:](v5, "initWithIntensity:maximumBlurRadius:maximumDimmingFraction:", v4, v7, v8);
    blurViewConfiguration = self->_blurViewConfiguration;
    self->_blurViewConfiguration = v9;

    v11 = self->_blurSpriteIndex | 0x100000000;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __42__PXAssetsSectionLayout__updateBlurSprite__block_invoke;
    v13[3] = &__block_descriptor_40_e101_v40__0__PXGSpriteIndexRange_II_8_______ddd__16____f_________ffff__4f___ffffSCf____4___24____CCfqSC_32l;
    *(double *)&v13[4] = v4;
    -[PXGLayout modifySpritesInRange:state:](self, "modifySpritesInRange:state:", v11, v13);

  }
}

- (void)setVisibleRectOvershootFactor:(double)a3
{
  id v5;

  if ((PXFloatApproximatelyEqualToFloat() & 1) == 0)
  {
    self->_visibleRectOvershootFactor = a3;
    -[PXAssetsSectionLayout delegate](self, "delegate");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assetSectionLayoutDidUpdateVisibleRectOvershootFactor:", self);

  }
}

- (PXDisplayAssetFetchResult)keyAssetsFetchResult
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  void *v6;
  uint64_t v7;
  int64x2_t v9;
  uint64_t v10;
  int64_t v11;
  int64x2_t v12;

  -[PXAssetsSectionLayout dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "identifier");
  v5 = -[PXAssetsSectionLayout section](self, "section");
  v10 = v4;
  v11 = v5;
  v9 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  v12 = v9;
  objc_msgSend(v3, "keyAssetsInSectionIndexPath:", &v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "count"))
  {
    v10 = v4;
    v11 = v5;
    v12 = v9;
    objc_msgSend(v3, "assetsInSectionIndexPath:", &v10);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }

  return (PXDisplayAssetFetchResult *)v6;
}

- (PXGBurstStackEffect)burstStackEffect
{
  void *burstStackEffect;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  PXGBurstStackEffect *v9;

  -[PXGBurstStackEffect entityManager](self->_burstStackEffect, "entityManager");
  burstStackEffect = (void *)objc_claimAutoreleasedReturnValue();
  -[PXGLayout entityManager](self, "entityManager");
  v4 = objc_claimAutoreleasedReturnValue();
  if (burstStackEffect == (void *)v4)
  {
    v8 = burstStackEffect;
    goto LABEL_5;
  }
  v5 = (void *)v4;
  -[PXGLayout entityManager](self, "entityManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_alloc((Class)off_1E50B2890);
    -[PXGLayout entityManager](self, "entityManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (PXGBurstStackEffect *)objc_msgSend(v7, "initWithEntityManager:", v8);
    burstStackEffect = self->_burstStackEffect;
    self->_burstStackEffect = v9;
LABEL_5:

  }
  return self->_burstStackEffect;
}

- (PXGItemsGeometry)bodyItemsGeometry
{
  void *v2;
  void *v3;

  -[PXAssetsSectionLayout bodyContentLayout](self, "bodyContentLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "itemsGeometry");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (PXGItemsGeometry *)v3;
}

- (id)hitTestResultForSpriteIndex:(unsigned int)a3
{
  uint64_t v3;
  void *v6;
  uint64_t v7;
  PXCuratedLibraryHitTestResult *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  PXCuratedLibraryHitTestResult *v12;
  NSObject *v13;
  int64_t v15;
  int64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  objc_class *v27;
  void *v28;
  void *v29;
  objc_super v30;
  uint8_t buf[4];
  int v32;
  uint64_t v33;

  v3 = *(_QWORD *)&a3;
  v33 = *MEMORY[0x1E0C80C00];
  -[PXAssetsSectionLayout headerLayout](self, "headerLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6
    || (v7 = -[PXGLayout convertSpriteIndex:toDescendantLayout:](self, "convertSpriteIndex:toDescendantLayout:", v3, v6),
        (_DWORD)v7 == -1))
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v6, "hitTestResultForSpriteIndex:", v7);
    v8 = (PXCuratedLibraryHitTestResult *)objc_claimAutoreleasedReturnValue();
  }
  if (self->_showAllButtonSpriteIndex == (_DWORD)v3 || self->_selectAllButtonSpriteIndex == (_DWORD)v3)
  {
    -[PXAssetsSectionLayout assetCollectionReference](self, "assetCollectionReference");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if (self->_showAllButtonSpriteIndex == (_DWORD)v3)
        v10 = 17;
      else
        v10 = 18;
      -[PXGLayout spriteReferenceForSpriteIndex:objectReference:](self, "spriteReferenceForSpriteIndex:objectReference:", v3, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[PXCuratedLibraryHitTestResult initWithControl:spriteReference:layout:assetCollectionReference:]([PXCuratedLibraryHitTestResult alloc], "initWithControl:spriteReference:layout:assetCollectionReference:", v10, v11, self, v9);

      v8 = v12;
    }
    else
    {
      PLCuratedLibraryGetLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v32 = v3;
        _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_DEFAULT, "missing asset collection reference for -hitTestResultForSpriteIndex:%i", buf, 8u);
      }

    }
  }
  if (!v8)
  {
    v15 = -[PXAssetsSectionLayout zoomLevel](self, "zoomLevel");
    v16 = v15;
    if ((unint64_t)(v15 - 1) >= 2)
    {
      if (v15 == 3)
      {
        -[PXAssetsSectionLayout objectReferenceForSpriteIndex:](self, "objectReferenceForSpriteIndex:", v3);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[PXGLayout spriteReferenceForSpriteIndex:objectReference:](self, "spriteReferenceForSpriteIndex:objectReference:", v3, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v8 = -[PXCuratedLibraryHitTestResult initWithControl:spriteReference:layout:assetReference:]([PXCuratedLibraryHitTestResult alloc], "initWithControl:spriteReference:layout:assetReference:", 1, v22, self, v21);
        else
          v8 = 0;

      }
      else if (v15 == 4)
      {
        v30.receiver = self;
        v30.super_class = (Class)PXAssetsSectionLayout;
        -[PXGLayout hitTestResultForSpriteIndex:](&v30, sel_hitTestResultForSpriteIndex_, v3);
        v8 = (PXCuratedLibraryHitTestResult *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = 0;
      }
      goto LABEL_17;
    }
    -[PXAssetsSectionLayout bodyContentLayout](self, "bodyContentLayout");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v17
      || -[PXGLayout convertSpriteIndex:toDescendantLayout:](self, "convertSpriteIndex:toDescendantLayout:", v3, v17) == -1)
    {
      v8 = 0;
LABEL_39:

      goto LABEL_17;
    }
    -[PXAssetsSectionLayout objectReferenceForSpriteIndex:](self, "objectReferenceForSpriteIndex:", v3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
LABEL_26:
        if (self->_sectionBoundariesSpriteIndex == -1)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetsSectionLayout.m"), 1336, CFSTR("missing section boundaries sprite"));

        }
        -[PXGLayout spriteReferenceForSpriteIndex:objectReference:](self, "spriteReferenceForSpriteIndex:objectReference:");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16 == 1)
        {
          v20 = 2;
        }
        else
        {
          if (v16 != 2)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetsSectionLayout.m"), 1347, CFSTR("Code which should be unreachable has been reached"));

            abort();
          }
          v20 = 3;
        }
        v8 = -[PXCuratedLibraryHitTestResult initWithControl:spriteReference:layout:assetCollectionReference:]([PXCuratedLibraryHitTestResult alloc], "initWithControl:spriteReference:layout:assetCollectionReference:", v20, v19, self, v18);

        goto LABEL_39;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (objc_class *)objc_opt_class();
      NSStringFromClass(v27);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "px_descriptionForAssertionMessage");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetsSectionLayout.m"), 1335, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("[self objectReferenceForSpriteIndex:spriteIndex]"), v25, v28);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (objc_class *)objc_opt_class();
      NSStringFromClass(v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetsSectionLayout.m"), 1335, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("[self objectReferenceForSpriteIndex:spriteIndex]"), v25);
    }

    goto LABEL_26;
  }
LABEL_17:

  return v8;
}

- (int64_t)sublayoutIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5
{
  int64_t v6;
  void *v7;
  void *v8;

  -[PXAssetsSectionLayout _dataSourceIndexPathForObjectReference:options:updatedObjectReference:](self, "_dataSourceIndexPathForObjectReference:options:updatedObjectReference:", a3, a4, a5);
  v6 = 0x7FFFFFFFFFFFFFFFLL;
  -[PXAssetsSectionLayout bodyContainerLayout](self, "bodyContainerLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7
    || (-[PXAssetsSectionLayout bodyContentLayout](self, "bodyContentLayout"),
        (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v8, "indexOfSublayout:", v7);

  }
  return v6;
}

- (unsigned)spriteIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  unsigned int showAllButtonSpriteIndex;
  void *v15;
  void *v16;

  v8 = a3;
  -[PXAssetsSectionLayout showAllActionPerformer](self, "showAllActionPerformer");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v8)
  {
    showAllButtonSpriteIndex = self->_showAllButtonSpriteIndex;
    -[PXAssetsSectionLayout showAllActionPerformer](self, "showAllActionPerformer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
    *a5 = v15;
    goto LABEL_12;
  }
  -[PXAssetsSectionLayout selectAllActionPerformer](self, "selectAllActionPerformer");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v8)
  {
    showAllButtonSpriteIndex = self->_selectAllButtonSpriteIndex;
    -[PXAssetsSectionLayout selectAllActionPerformer](self, "selectAllActionPerformer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PXAssetsSectionLayout bodyContainerLayout](self, "bodyContainerLayout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      -[PXAssetsSectionLayout bodyContentLayout](self, "bodyContentLayout");
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    v16 = v13;

    showAllButtonSpriteIndex = -[PXGLayout convertSpriteIndex:fromDescendantLayout:](self, "convertSpriteIndex:fromDescendantLayout:", objc_msgSend(v16, "spriteIndexForObjectReference:options:updatedObjectReference:", v8, a4, a5), v16);
  }
  else
  {
    -[PXAssetsSectionLayout _dataSourceIndexPathForObjectReference:options:updatedObjectReference:](self, "_dataSourceIndexPathForObjectReference:options:updatedObjectReference:", v8, a4, a5);
    showAllButtonSpriteIndex = -1;
  }
LABEL_12:

  return showAllButtonSpriteIndex;
}

- (PXSimpleIndexPath)_dataSourceIndexPathForObjectReference:(SEL)a3 options:(id)a4 updatedObjectReference:(unint64_t)a5
{
  char v7;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  int64_t section;
  PXSimpleIndexPath *result;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;

  v7 = a5;
  v10 = a4;
  v18 = *((_OWORD *)off_1E50B8778 + 1);
  v20 = *(_OWORD *)off_1E50B8778;
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)off_1E50B8778;
  *(_OWORD *)&retstr->item = v18;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = v10;
    -[PXAssetsSectionLayout dataSource](self, "dataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if ((v7 & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        -[PXAssetsSectionLayout _assetReferenceClosestVisuallyToAssetReference:](self, "_assetReferenceClosestVisuallyToAssetReference:", v11);
      else
        objc_msgSend(v13, "objectReferenceNearestToObjectReference:", v11);
      v14 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v12, "objectReferenceForObjectReference:", v11);
      v14 = objc_claimAutoreleasedReturnValue();
    }
    v15 = (void *)v14;

    if (v13)
    {
      objc_msgSend(v13, "indexPathForObjectReference:", v15);
    }
    else
    {
      v22 = 0u;
      v23 = 0u;
    }
    *(_OWORD *)&retstr->dataSourceIdentifier = v22;
    *(_OWORD *)&retstr->item = v23;
    section = retstr->section;
    if (section != -[PXAssetsSectionLayout section](self, "section", v18, v20))
    {
      *(_OWORD *)&retstr->dataSourceIdentifier = v21;
      *(_OWORD *)&retstr->item = v19;
    }
    if (retstr->dataSourceIdentifier != *(_QWORD *)off_1E50B7E98)
      *a6 = objc_retainAutorelease(v15);

  }
  return result;
}

- (id)_assetReferenceClosestVisuallyToAssetReference:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  int64x2_t v12;
  int64x2_t v13;
  int64x2_t v14;
  int64x2_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  int64_t v20;
  int64x2_t v21;
  int64x2_t v22;
  int64x2_t v23;
  int64x2_t v24;
  int64x2_t v25;
  int64x2_t v26;
  int64x2_t v27;

  v4 = a3;
  -[PXAssetsSectionLayout dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assetReferenceForAssetReference:", v4);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (id)v6;
  else
    v8 = v4;
  objc_msgSend(v5, "objectReferenceNearestToObjectReference:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v9;
LABEL_6:
    v11 = v10;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = 0;
    goto LABEL_27;
  }
  v26 = 0u;
  v27 = 0u;
  if (v5)
  {
    objc_msgSend(v5, "indexPathForAssetCollectionReference:", v9);
    v22 = v26;
    v23 = v27;
    objc_msgSend(v5, "keyAssetIndexPathForSectionIndexPath:", &v22);
  }
  else
  {
    v24 = 0uLL;
    v25 = 0uLL;
  }
  v11 = 0;
  v26 = v24;
  v27 = v25;
  if (v24.i64[0] != *(_QWORD *)off_1E50B7E98
    && v27.i64[0] != 0x7FFFFFFFFFFFFFFFLL
    && v27.i64[1] == 0x7FFFFFFFFFFFFFFFLL)
  {
    v24 = v26;
    v25 = v27;
    objc_msgSend(v5, "assetReferenceAtItemIndexPath:", &v24);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
LABEL_7:
  if (v11 && (objc_msgSend(v11, "isEqual:", v7) & 1) == 0)
  {
    v26 = 0u;
    v27 = 0u;
    if (v5)
    {
      objc_msgSend(v5, "indexPathForAssetReference:", v11);
      v24 = 0u;
      v25 = 0u;
      v19 = objc_msgSend(v5, "identifier");
      v20 = -[PXAssetsSectionLayout section](self, "section");
      v21 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
      objc_msgSend(v5, "keyAssetIndexPathForSectionIndexPath:", &v19);
      v12 = v24;
      v13 = v25;
      v15 = v26;
      v14 = v27;
    }
    else
    {
      v19 = objc_msgSend(0, "identifier");
      v20 = -[PXAssetsSectionLayout section](self, "section");
      v21 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
      v15 = 0uLL;
      v24 = 0u;
      v25 = 0u;
      v14 = 0uLL;
      v12 = 0uLL;
      v13 = 0uLL;
    }
    if ((vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_s64(v15, v12), (int32x4_t)vceqq_s64(v14, v13))), 0xFuLL))) & 1) != 0)
    {
      v16 = v13.i64[0] - 1;
      if (v13.i64[0] < 1)
      {
        if (v13.i64[0] >= objc_msgSend(v5, "numberOfItemsInSection:", v12.i64[1]) - 1)
        {
LABEL_26:
          v22 = v26;
          v23 = v27;
          objc_msgSend(v5, "assetReferenceAtItemIndexPath:", &v22, v19, v20, *(_OWORD *)&v21);
          v17 = objc_claimAutoreleasedReturnValue();

          v11 = (void *)v17;
          goto LABEL_27;
        }
        v16 = v27.i64[0] + 1;
      }
      v27.i64[0] = v16;
      goto LABEL_26;
    }
  }
LABEL_27:

  return v11;
}

- (id)dateIntervalFutureForContentInRect:(CGRect)a3 type:(unint64_t)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v11;
  uint64_t v12;
  void *v13;
  char isKindOfClass;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v24;
  _QWORD v25[4];
  id v26;
  uint64_t v27;
  _QWORD v28[4];
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PXAssetsSectionLayout dataSource](self, "dataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PXAssetsSectionLayout section](self, "section");
  if (v12 >= objc_msgSend(v11, "numberOfSections"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetsSectionLayout.m"), 1619, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("section < dataSource.numberOfSections"));

  }
  if (-[PXAssetsSectionLayout zoomLevel](self, "zoomLevel") == 4)
  {
    -[PXAssetsSectionLayout bodyContentLayout](self, "bodyContentLayout");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    -[PXAssetsSectionLayout bodyContentLayout](self, "bodyContentLayout");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v15, "dateIntervalFutureForContentInRect:type:", a4, x, y, width, height);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

      goto LABEL_15;
    }

    if (!v16)
    {
      v17 = (void *)objc_msgSend(&__block_literal_global_28729, "copy");
      goto LABEL_15;
    }
    -[PXAssetsSectionLayout bodyContentLayout](self, "bodyContentLayout");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = v18;

      if (v16)
      {
        -[PXGLayout convertRect:toDescendantLayout:](self, "convertRect:toDescendantLayout:", v16, x, y, width, height);
        v19 = objc_msgSend(v16, "itemRangeForSpriteIndexRange:", objc_msgSend(v16, "spriteIndexRangeCoveringRect:"));
        v21 = v20;
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __65__PXAssetsSectionLayout_dateIntervalFutureForContentInRect_type___block_invoke;
        v28[3] = &unk_1E511AB40;
        v29 = v11;
        v30 = v19;
        v31 = v21;
        v32 = v12;
        v33 = a4;
        v17 = (void *)objc_msgSend(v28, "copy");

        goto LABEL_14;
      }
    }
    else
    {

      v16 = 0;
    }
    v17 = 0;
    goto LABEL_14;
  }
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __65__PXAssetsSectionLayout_dateIntervalFutureForContentInRect_type___block_invoke_3;
  v25[3] = &unk_1E5123BD0;
  v26 = v11;
  v27 = v12;
  v17 = (void *)objc_msgSend(v25, "copy");

LABEL_15:
  v22 = _Block_copy(v17);

  return v22;
}

- (id)locationNamesFutureForContentInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v9;
  uint64_t v10;
  void *v11;
  char isKindOfClass;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v22;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  uint64_t v28;
  uint64_t v29;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PXAssetsSectionLayout dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PXAssetsSectionLayout section](self, "section");
  if (v10 >= objc_msgSend(v9, "numberOfSections"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetsSectionLayout.m"), 1675, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("section < dataSource.numberOfSections"));

  }
  if (-[PXAssetsSectionLayout zoomLevel](self, "zoomLevel") == 4)
  {
    -[PXAssetsSectionLayout bodyContentLayout](self, "bodyContentLayout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    -[PXAssetsSectionLayout bodyContentLayout](self, "bodyContentLayout");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v13, "locationNamesFutureForContentInRect:", x, y, width, height);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

      goto LABEL_15;
    }

    if (!v14)
    {
      v15 = (void *)objc_msgSend(&__block_literal_global_235, "copy");
      goto LABEL_15;
    }
    -[PXAssetsSectionLayout bodyContentLayout](self, "bodyContentLayout");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
    {
      v14 = v16;

      if (v14)
      {
        -[PXGLayout convertRect:toDescendantLayout:](self, "convertRect:toDescendantLayout:", v14, x, y, width, height);
        v17 = objc_msgSend(v14, "itemRangeForSpriteIndexRange:", objc_msgSend(v14, "spriteIndexRangeCoveringRect:"));
        v19 = v18;
        v26[0] = MEMORY[0x1E0C809B0];
        v26[1] = 3221225472;
        v26[2] = __61__PXAssetsSectionLayout_locationNamesFutureForContentInRect___block_invoke;
        v26[3] = &unk_1E511ABA8;
        v27 = v9;
        v28 = v17;
        v29 = v19;
        v15 = (void *)objc_msgSend(v26, "copy");

        goto LABEL_14;
      }
    }
    else
    {

      v14 = 0;
    }
    v15 = 0;
    goto LABEL_14;
  }
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __61__PXAssetsSectionLayout_locationNamesFutureForContentInRect___block_invoke_4;
  v23[3] = &unk_1E5123C20;
  v24 = v9;
  v25 = v10;
  v15 = (void *)objc_msgSend(v23, "copy");

LABEL_15:
  v20 = _Block_copy(v15);

  return v20;
}

- (id)assetCollectionsIteratorForContentInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  PXAssetsSectionLayout *v17;
  _QWORD aBlock[4];
  id v19;
  PXAssetsSectionLayout *v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PXAssetsSectionLayout dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PXAssetsSectionLayout zoomLevel](self, "zoomLevel") == 4)
  {
    -[PXAssetsSectionLayout bodyContentLayout](self, "bodyContentLayout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = v9;
      if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = v10;

        objc_msgSend(v11, "assetCollectionsIteratorForContentInRect:", x, y, width, height);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {

        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __66__PXAssetsSectionLayout_assetCollectionsIteratorForContentInRect___block_invoke;
        aBlock[3] = &unk_1E511ABF0;
        v19 = v8;
        v20 = self;
        v12 = _Block_copy(aBlock);

        v11 = 0;
      }

    }
    else
    {
      v10 = 0;
      v12 = 0;
    }
  }
  else
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __66__PXAssetsSectionLayout_assetCollectionsIteratorForContentInRect___block_invoke_2;
    v15[3] = &unk_1E511ABF0;
    v16 = v8;
    v17 = self;
    v12 = _Block_copy(v15);
    v10 = v16;
  }

  v13 = _Block_copy(v12);
  return v13;
}

- (id)assetsIteratorForContentInRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  double v35;
  _QWORD v36[4];
  NSObject *v37;
  PXAssetsSectionLayout *v38;
  NSObject *v39;
  _QWORD v40[4];
  NSObject *v41;
  _QWORD aBlock[4];
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint8_t buf[4];
  uint64_t v47;
  uint64_t v48;
  NSRect v49;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v48 = *MEMORY[0x1E0C80C00];
  -[PXAssetsSectionLayout dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PXAssetsSectionLayout zoomLevel](self, "zoomLevel") == 4)
  {
    -[PXAssetsSectionLayout bodyContentLayout](self, "bodyContentLayout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = v9;
      if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
      {
        v12 = v11;

        objc_msgSend(v12, "assetsIteratorForContentInRect:", x, y, width, height);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {

        v14 = v11;
        if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
        {
          v15 = v14;

          -[PXGLayout convertRect:toDescendantLayout:](self, "convertRect:toDescendantLayout:", v15, x, y, width, height);
          v16 = objc_msgSend(v15, "itemRangeForSpriteIndexRange:", objc_msgSend(v15, "spriteIndexRangeCoveringRect:"));
          v18 = v17;
          aBlock[0] = MEMORY[0x1E0C809B0];
          aBlock[1] = 3221225472;
          aBlock[2] = __56__PXAssetsSectionLayout_assetsIteratorForContentInRect___block_invoke;
          aBlock[3] = &unk_1E5123C70;
          v43 = v8;
          v44 = v16;
          v45 = v18;
          v13 = _Block_copy(aBlock);
          v19 = v43;
        }
        else
        {

          v20 = v14;
          if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
          {
            v19 = v20;

            v21 = objc_alloc_init(MEMORY[0x1E0CB3788]);
            -[PXGLayout convertRect:toDescendantLayout:](self, "convertRect:toDescendantLayout:", v19, x, y, width, height);
            v35 = v22;
            v24 = v23;
            v26 = v25;
            v28 = v27;
            v29 = MEMORY[0x1E0C809B0];
            v40[0] = MEMORY[0x1E0C809B0];
            v40[1] = 3221225472;
            v40[2] = __56__PXAssetsSectionLayout_assetsIteratorForContentInRect___block_invoke_3;
            v40[3] = &unk_1E511AC18;
            v30 = v21;
            v41 = v30;
            objc_msgSend(v19, "enumerateItemsInRect:usingBlock:", v40, v35, v24, v26, v28);
            if (-[NSObject count](v30, "count"))
            {
              v36[0] = v29;
              v36[1] = 3221225472;
              v36[2] = __56__PXAssetsSectionLayout_assetsIteratorForContentInRect___block_invoke_4;
              v36[3] = &unk_1E511AC68;
              v37 = v8;
              v38 = self;
              v39 = v30;
              v13 = _Block_copy(v36);

              v31 = v37;
            }
            else
            {
              PLAppIntentsGetLog();
              v31 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
              {
                v49.origin.x = x;
                v49.origin.y = y;
                v49.size.width = width;
                v49.size.height = height;
                NSStringFromRect(v49);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v47 = (uint64_t)v32;
                _os_log_impl(&dword_1A6789000, v31, OS_LOG_TYPE_ERROR, "No items for the provided rect: %{public}@", buf, 0xCu);

              }
              v13 = 0;
            }

          }
          else
          {

            PLAppIntentsGetLog();
            v30 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v47 = objc_opt_class();
              _os_log_impl(&dword_1A6789000, v30, OS_LOG_TYPE_ERROR, "Unknown body layout: %{public}@", buf, 0xCu);
            }
            v19 = 0;
            v13 = 0;
          }

          v15 = 0;
        }

        v12 = 0;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }
  v33 = _Block_copy(v13);

  return v33;
}

- (double)buildingRowContentHeight
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[PXAssetsSectionLayout _rowBasedBodyContentLayout](self, "_rowBasedBodyContentLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "buildingRowContentHeight");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (double)buildingRowSpacing
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[PXAssetsSectionLayout _rowBasedBodyContentLayout](self, "_rowBasedBodyContentLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "buildingRowSpacing");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (void)enumerateRowsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a4;
  -[PXAssetsSectionLayout _rowBasedBodyContentLayout](self, "_rowBasedBodyContentLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__PXAssetsSectionLayout_enumerateRowsWithOptions_usingBlock___block_invoke;
  v10[3] = &unk_1E511AC90;
  v10[4] = self;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  objc_msgSend(v9, "enumerateRowsWithOptions:usingBlock:", a3, v10);

}

- (id)_rowBasedBodyContentLayout
{
  void *v2;
  id v3;

  -[PXAssetsSectionLayout bodyContentLayout](self, "bodyContentLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EEA23C80))
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

- (id)_displayFaceForBodyItem:(int64_t)a3
{
  void *v5;
  void *v6;
  _QWORD v8[4];

  -[PXAssetsSectionLayout dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = objc_msgSend(v5, "identifier");
  v8[1] = -[PXAssetsSectionLayout section](self, "section");
  v8[2] = a3;
  v8[3] = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(v5, "primaryFaceForAssetAtItemIndexPath:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)shadowForSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;
  void *v13;

  v7 = a4;
  if (self->_sectionShadowSpriteIndex != a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetsSectionLayout.m"), 1995, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v8 = v7;
  -[PXAssetsSectionLayout spec](self, "spec");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetsSectionLayout.m"), 1992, CFSTR("A valid spec object should be available to retrieve the shadow."));

  }
  objc_msgSend(v9, "shadow");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (double)cornerRadiusForShadowSpriteAtIndex:(unsigned int)a3 inLayout:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v13;
  void *v14;

  v7 = a4;
  if (self->_sectionShadowSpriteIndex != a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetsSectionLayout.m"), 2005, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  v8 = v7;
  -[PXAssetsSectionLayout spec](self, "spec");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXAssetsSectionLayout.m"), 2002, CFSTR("A valid spec object should be available to retrieve the shadow corner radius."));

  }
  objc_msgSend(v9, "shadowCornerRadius");
  v11 = v10;

  return v11;
}

- (double)itemsLayout:(id)a3 aspectRatioForItem:(int64_t)a4
{
  void *v4;
  double v5;
  double v6;

  -[PXAssetsSectionLayout _displayAssetForBodyItem:](self, "_displayAssetForBodyItem:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aspectRatio");
  v6 = v5;

  return v6;
}

- (CGRect)itemsLayout:(id)a3 bestCropRectForItem:(int64_t)a4 withAspectRatio:(double)a5
{
  void *v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  void *v13;
  void *v14;
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
  CGRect v26;
  CGRect result;

  -[PXAssetsSectionLayout _displayAssetForBodyItem:](self, "_displayAssetForBodyItem:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "representsBurst") & 1) != 0)
  {
    v9 = *(double *)off_1E50B86D0;
    v10 = *((double *)off_1E50B86D0 + 1);
    v11 = *((double *)off_1E50B86D0 + 2);
    v12 = *((double *)off_1E50B86D0 + 3);
  }
  else
  {
    v9 = *MEMORY[0x1E0C9D628];
    v10 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v11 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v12 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    if (-[PXAssetsSectionLayout isFaceModeEnabled](self, "isFaceModeEnabled"))
    {
      -[PXAssetsSectionLayout _displayFaceForBodyItem:](self, "_displayFaceForBodyItem:", a4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
      {
        objc_msgSend(v13, "normalizedCropRect");
        v9 = v15;
        v10 = v16;
        v11 = v17;
        v12 = v18;
      }

    }
    v26.origin.x = v9;
    v26.origin.y = v10;
    v26.size.width = v11;
    v26.size.height = v12;
    if (CGRectIsEmpty(v26))
    {
      v9 = PXCuratedLibraryBestCropRectForAssetInZoomLevel(v8, -[PXAssetsSectionLayout zoomLevel](self, "zoomLevel"), 0, a5);
      v10 = v19;
      v11 = v20;
      v12 = v21;
    }
  }

  v22 = v9;
  v23 = v10;
  v24 = v11;
  v25 = v12;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (unsigned)itemsLayout:(id)a3 effectIdForItem:(int64_t)a4
{
  void *v6;
  int v7;
  void *v8;
  unsigned int v9;

  if (-[PXAssetsSectionLayout zoomLevel](self, "zoomLevel", a3) != 4)
    return 0;
  -[PXAssetsSectionLayout _displayAssetForBodyItem:](self, "_displayAssetForBodyItem:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "representsBurst");

  if (!v7)
    return 0;
  -[PXAssetsSectionLayout burstStackEffect](self, "burstStackEffect");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "effectId");

  return v9;
}

- (int64_t)itemsLayout:(id)a3 itemForObjectReference:(id)a4 options:(unint64_t)a5
{
  char v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;

  v5 = a5;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_9:
      v12 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_22;
    }
    objc_msgSend(v7, "keyAssetReference");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
  if (!v8)
    goto LABEL_9;
  if ((v5 & 1) == 0)
  {
LABEL_11:
    v11 = v9;
    goto LABEL_12;
  }
  -[PXAssetsSectionLayout dataSource](self, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectReferenceNearestToObjectReference:inSection:", v9, -[PXAssetsSectionLayout section](self, "section"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_11;
  }

  if (!v11)
    goto LABEL_9;
LABEL_12:
  v16 = 0u;
  v17 = 0u;
  -[PXAssetsSectionLayout dataSource](self, "dataSource", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "indexPathForAssetReference:", v11);
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
  }

  v12 = 0x7FFFFFFFFFFFFFFFLL;
  if ((_QWORD)v16 != *(_QWORD *)off_1E50B7E98
    && (_QWORD)v17 != 0x7FFFFFFFFFFFFFFFLL
    && *((_QWORD *)&v17 + 1) == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (*((_QWORD *)&v16 + 1) == -[PXAssetsSectionLayout section](self, "section"))
      v12 = v17;
    else
      v12 = 0x7FFFFFFFFFFFFFFFLL;
  }

LABEL_22:
  return v12;
}

- (id)itemsLayout:(id)a3 objectReferenceForItem:(int64_t)a4
{
  void *v6;
  void *v7;
  _QWORD v9[4];

  -[PXAssetsSectionLayout dataSource](self, "dataSource", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = objc_msgSend(v6, "identifier");
  v9[1] = -[PXAssetsSectionLayout section](self, "section");
  v9[2] = a4;
  v9[3] = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(v6, "objectReferenceAtIndexPath:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)axLocalizedLabel
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PXAssetsSectionLayout axLocalizedBaseLabel](self, "axLocalizedBaseLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v3, "addObject:", v4);
  -[PXAssetsSectionLayout assetCollection](self, "assetCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedTitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v3, "addObject:", v6);
  objc_msgSend(v5, "localizedSubtitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(v3, "addObject:", v7);
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(" "));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v9, "replaceOccurrencesOfString:withString:options:range:", CFSTR(""), &stru_1E5149688, 0, 0, objc_msgSend(v9, "length"));
  return v9;
}

- (BOOL)axGroup:(id)a3 didRequestToPerformAction:(int64_t)a4 userInfo:(id)a5
{
  id v8;
  id v9;
  void *v10;
  BOOL v11;
  objc_super v13;

  v8 = a3;
  v9 = a5;
  -[PXAssetsSectionLayout assetCollectionReference](self, "assetCollectionReference");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    PXGAXAddAssetCollectionReferenceUserInfo(v9, v10);
  v13.receiver = self;
  v13.super_class = (Class)PXAssetsSectionLayout;
  v11 = -[PXGLayout axGroup:didRequestToPerformAction:userInfo:](&v13, sel_axGroup_didRequestToPerformAction_userInfo_, v8, a4, v9);

  return v11;
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setTargetZoomLevel:(int64_t)a3
{
  self->_targetZoomLevel = a3;
}

- (int64_t)preferredInitialContentLayoutAxis
{
  return self->_preferredInitialContentLayoutAxis;
}

- (void)setPreferredInitialContentLayoutAxis:(int64_t)a3
{
  self->_preferredInitialContentLayoutAxis = a3;
}

- (NSNumber)preferredInitialContentLayoutNumberOfRows
{
  return self->_preferredInitialContentLayoutNumberOfRows;
}

- (void)setPreferredInitialContentLayoutNumberOfRows:(id)a3
{
  objc_storeStrong((id *)&self->_preferredInitialContentLayoutNumberOfRows, a3);
}

- (BOOL)itemCaptionsVisible
{
  return self->_itemCaptionsVisible;
}

- (PXLoadingStatusManager)loadingStatusManager
{
  return self->_loadingStatusManager;
}

- (PXTapbackStatusManager)tapbackStatusManager
{
  return self->_tapbackStatusManager;
}

- (void)setTapbackStatusManager:(id)a3
{
  objc_storeStrong((id *)&self->_tapbackStatusManager, a3);
}

- (PXPhotosCustomViewDecorationDataSource)decorationDataSource
{
  return self->_decorationDataSource;
}

- (BOOL)canStartSelecting
{
  return self->_canStartSelecting;
}

- (BOOL)wantsDimmedSelectionStyle
{
  return self->_wantsDimmedSelectionStyle;
}

- (BOOL)wantsNumberedSelectionStyle
{
  return self->_wantsNumberedSelectionStyle;
}

- (BOOL)wantsFileSizeBadge
{
  return self->_wantsFileSizeBadge;
}

- (BOOL)wantsAssetIndexBadge
{
  return self->_wantsAssetIndexBadge;
}

- ($6FCFBD36564ECBB6D9D1614A84D6F83D)preferredCornerRadius
{
  $6FCFBD36564ECBB6D9D1614A84D6F83D result;

  *(_QWORD *)&result.var0.var1[2] = a2;
  *(_QWORD *)&result.var0.var0.var0 = self;
  return result;
}

- (id)showAllActionBlock
{
  return self->_showAllActionBlock;
}

- (void)setShowAllActionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1376);
}

- (id)addContentActionHandler
{
  return self->_addContentActionHandler;
}

- (PXGLayoutGuide)headerLayoutGuide
{
  return self->_headerLayoutGuide;
}

- (BOOL)removesHeaderLayoutWhenEmpty
{
  return self->_removesHeaderLayoutWhenEmpty;
}

- (BOOL)removesContentLayoutWhenEmpty
{
  return self->_removesContentLayoutWhenEmpty;
}

- (NSString)axLocalizedBaseLabel
{
  return self->_axLocalizedBaseLabel;
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

- (BOOL)isLastSection
{
  return self->_isLastSection;
}

- (NSString)showAllButtonTitle
{
  return self->_showAllButtonTitle;
}

- (double)effectiveBlurIntensity
{
  return self->_effectiveBlurIntensity;
}

- (PXSimpleIndexPath)presentedSectionIndexPath
{
  __int128 v3;

  v3 = *(_OWORD *)&self[50].dataSourceIdentifier;
  *(_OWORD *)&retstr->dataSourceIdentifier = *(_OWORD *)&self[49].item;
  *(_OWORD *)&retstr->item = v3;
  return self;
}

- (BOOL)presentedSkimming
{
  return self->_presentedSkimming;
}

- (double)visibleRectOvershootFactor
{
  return self->_visibleRectOvershootFactor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_showAllButtonTitle, 0);
  objc_storeStrong((id *)&self->_bodyContainerLayout, 0);
  objc_storeStrong((id *)&self->_configurator, 0);
  objc_storeStrong((id *)&self->_bodyContentLayout, 0);
  objc_storeStrong((id *)&self->_headerLayout, 0);
  objc_storeStrong((id *)&self->_skimmingIndexPaths, 0);
  objc_storeStrong((id *)&self->_axLocalizedBaseLabel, 0);
  objc_storeStrong((id *)&self->_headerLayoutGuide, 0);
  objc_storeStrong(&self->_addContentActionHandler, 0);
  objc_storeStrong((id *)&self->_selectAllButtonTitle, 0);
  objc_storeStrong((id *)&self->_selectAllActionPerformer, 0);
  objc_storeStrong(&self->_showAllActionBlock, 0);
  objc_storeStrong((id *)&self->_showAllActionPerformer, 0);
  objc_storeStrong((id *)&self->_decorationDataSource, 0);
  objc_storeStrong((id *)&self->_tapbackStatusManager, 0);
  objc_storeStrong((id *)&self->_dropTargetAssetReference, 0);
  objc_storeStrong((id *)&self->_loadingStatusManager, 0);
  objc_storeStrong((id *)&self->_actionManager, 0);
  objc_storeStrong((id *)&self->_assetDecorationSource, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_preferredInitialContentLayoutNumberOfRows, 0);
  objc_storeStrong((id *)&self->_inlinePlaybackController, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_selectAllButtonConfiguration, 0);
  objc_storeStrong((id *)&self->_showAllButtonConfiguration, 0);
  objc_storeStrong((id *)&self->_blurViewConfiguration, 0);
  objc_storeStrong((id *)&self->_burstStackEffect, 0);
  objc_storeStrong((id *)&self->_cachedClampedFetchResult, 0);
  objc_storeStrong((id *)&self->_assetCollectionReference, 0);
  objc_storeStrong((id *)&self->_sectionHeaderLayout, 0);
}

void __63__PXAssetsSectionLayout_viewUserDataForSpriteAtIndex_inLayout___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_callAddContentActionHandler");

}

uint64_t __61__PXAssetsSectionLayout_enumerateRowsWithOptions_usingBlock___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "convertRect:fromDescendantLayout:", *(_QWORD *)(a1 + 40));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void __56__PXAssetsSectionLayout_assetsIteratorForContentInRect___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  _QWORD v10[4];
  _QWORD v11[4];
  id v12;
  id v13;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "identifier");
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(a1 + 32);
  v7 = v5 + *(_QWORD *)(a1 + 48) - 1;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __56__PXAssetsSectionLayout_assetsIteratorForContentInRect___block_invoke_2;
  v11[3] = &unk_1E5123C48;
  v12 = v6;
  v13 = v3;
  v10[0] = v4;
  v10[1] = 0;
  v10[2] = v5;
  v10[3] = 0x7FFFFFFFFFFFFFFFLL;
  v9[0] = v4;
  v9[1] = 0;
  v9[2] = v7;
  v9[3] = 0x7FFFFFFFFFFFFFFFLL;
  v8 = v3;
  objc_msgSend(v12, "enumerateItemIndexPathsStartingAtIndexPath:untilEndIndexPath:usingBlock:", v10, v9, v11);

}

uint64_t __56__PXAssetsSectionLayout_assetsIteratorForContentInRect___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addIndex:", a2);
}

void __56__PXAssetsSectionLayout_assetsIteratorForContentInRect___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "identifier");
  v5 = objc_msgSend(*(id *)(a1 + 40), "section");
  v6 = *(void **)(a1 + 48);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__PXAssetsSectionLayout_assetsIteratorForContentInRect___block_invoke_5;
  v8[3] = &unk_1E511AC40;
  v11 = v4;
  v12 = v5;
  v9 = *(id *)(a1 + 32);
  v10 = v3;
  v7 = v3;
  objc_msgSend(v6, "enumerateIndexesUsingBlock:", v8);

}

void __56__PXAssetsSectionLayout_assetsIteratorForContentInRect___block_invoke_5(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *(void **)(a1 + 32);
  v5 = *(_OWORD *)(a1 + 48);
  v6 = a2;
  v7 = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(v3, "assetAtItemIndexPath:", &v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __56__PXAssetsSectionLayout_assetsIteratorForContentInRect___block_invoke_2(uint64_t a1, _OWORD *a2)
{
  void *v3;
  __int128 v4;
  void *v5;
  _OWORD v6[2];

  v3 = *(void **)(a1 + 32);
  v4 = a2[1];
  v6[0] = *a2;
  v6[1] = v4;
  objc_msgSend(v3, "assetAtItemIndexPath:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __66__PXAssetsSectionLayout_assetCollectionsIteratorForContentInRect___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void (**v4)(id, void *);
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[2];
  int64x2_t v10;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = objc_msgSend(v3, "identifier");
  v6 = objc_msgSend(*(id *)(a1 + 40), "section");
  v7 = *(void **)(a1 + 32);
  v9[0] = v5;
  v9[1] = v6;
  v10 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  objc_msgSend(v7, "assetCollectionAtSectionIndexPath:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v8);

}

void __66__PXAssetsSectionLayout_assetCollectionsIteratorForContentInRect___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void (**v4)(id, void *);
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v9[2];
  int64x2_t v10;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = objc_msgSend(v3, "identifier");
  v6 = objc_msgSend(*(id *)(a1 + 40), "section");
  v7 = *(void **)(a1 + 32);
  v9[0] = v5;
  v9[1] = v6;
  v10 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  objc_msgSend(v7, "assetCollectionAtSectionIndexPath:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v8);

}

id __61__PXAssetsSectionLayout_locationNamesFutureForContentInRect___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  _QWORD v12[4];
  _QWORD v13[4];
  id v14;
  id v15;

  if (objc_msgSend(*(id *)(a1 + 32), "identifier") != a2)
    return 0;
  v4 = objc_alloc_init(MEMORY[0x1E0CB3550]);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(void **)(a1 + 32);
  v7 = v5 + *(_QWORD *)(a1 + 48) - 1;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __61__PXAssetsSectionLayout_locationNamesFutureForContentInRect___block_invoke_2;
  v13[3] = &unk_1E5142450;
  v14 = v6;
  v15 = v4;
  v12[0] = a2;
  v12[1] = 0;
  v12[2] = v5;
  v12[3] = 0x7FFFFFFFFFFFFFFFLL;
  v11[0] = a2;
  v11[1] = 0;
  v11[2] = v7;
  v11[3] = 0x7FFFFFFFFFFFFFFFLL;
  v8 = v4;
  objc_msgSend(v14, "enumerateItemIndexPathsStartingAtIndexPath:untilEndIndexPath:usingBlock:", v12, v11, v13);
  PXArrayFromFrequencySortAndDeduplicationOfNSStringSet();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __61__PXAssetsSectionLayout_locationNamesFutureForContentInRect___block_invoke_4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[2];
  int64x2_t v10;

  if (objc_msgSend(*(id *)(a1 + 32), "identifier") != a2)
    return 0;
  v3 = objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v9[0] = v3;
  v9[1] = v5;
  v10 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  objc_msgSend(v4, "assetCollectionAtSectionIndexPath:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedLocationNames");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __61__PXAssetsSectionLayout_locationNamesFutureForContentInRect___block_invoke_3()
{
  return 0;
}

void __61__PXAssetsSectionLayout_locationNamesFutureForContentInRect___block_invoke_2(uint64_t a1, _OWORD *a2)
{
  void *v3;
  __int128 v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _OWORD v8[2];

  v3 = *(void **)(a1 + 32);
  v4 = a2[1];
  v8[0] = *a2;
  v8[1] = v4;
  objc_msgSend(v3, "assetAtItemIndexPath:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "localizedGeoDescription");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)v6;
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

    }
  }

}

id __65__PXAssetsSectionLayout_dateIntervalFutureForContentInRect_type___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v17;
  id v18;
  _QWORD v19[4];

  if (objc_msgSend(*(id *)(a1 + 32), "identifier") != a2)
    return 0;
  if (*(_QWORD *)(a1 + 40) == 0x7FFFFFFFFFFFFFFFLL
    || !*(_QWORD *)(a1 + 48)
    || (v3 = objc_msgSend(*(id *)(a1 + 32), "identifier"), v4 = *(_QWORD *)(a1 + 40), v4 >= *(_QWORD *)(a1 + 48) + v4))
  {
    v15 = 0;
    v14 = 0;
    v13 = 0;
  }
  else
  {
    v5 = v3;
    v6 = 0;
    v7 = 0;
    v8 = *(_QWORD *)(a1 + 56);
    do
    {
      v9 = *(void **)(a1 + 32);
      v19[0] = v5;
      v19[1] = v8;
      v19[2] = v4;
      v19[3] = 0x7FFFFFFFFFFFFFFFLL;
      objc_msgSend(v9, "assetAtItemIndexPath:", v19);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (*(_QWORD *)(a1 + 64) == 1)
        objc_msgSend(v10, "importDate");
      else
        objc_msgSend(v10, "creationDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v7;
      v18 = v6;
      objc_msgSend(MEMORY[0x1E0C99D68], "px_unionStartDate:endDate:withDate:", &v18, &v17, v12);
      v13 = v18;

      v14 = v17;
      ++v4;
      v6 = v13;
      v7 = v14;
    }
    while (v4 < *(_QWORD *)(a1 + 48) + *(_QWORD *)(a1 + 40));
    v15 = 0;
    if (v13)
    {
      if (v14)
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v13, v14);
    }
  }

  return v15;
}

id __65__PXAssetsSectionLayout_dateIntervalFutureForContentInRect_type___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  void *v12;
  _QWORD v13[2];
  int64x2_t v14;

  if (objc_msgSend(*(id *)(a1 + 32), "identifier") != a2)
    return 0;
  v3 = objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v13[0] = v3;
  v13[1] = v5;
  v14 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  objc_msgSend(v4, "assetCollectionAtSectionIndexPath:", v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endDate");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v7)
    v10 = v8 == 0;
  else
    v10 = 1;
  if (v10)
    v12 = 0;
  else
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v7, v8);

  return v12;
}

uint64_t __65__PXAssetsSectionLayout_dateIntervalFutureForContentInRect_type___block_invoke_2()
{
  return 0;
}

double __42__PXAssetsSectionLayout__updateBlurSprite__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  double result;

  result = *(double *)(a1 + 32) * 100.0;
  *(_WORD *)(a5 + 32) = (int)result;
  return result;
}

float __55__PXAssetsSectionLayout__updateSelectAllButtonPosition__block_invoke(CGFloat *a1, uint64_t a2, float32x2_t *a3, float *a4)
{
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat MidX;
  CGFloat MidY;
  CGFloat Height;
  float64x2_t v14;
  float result;
  CGFloat Width;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;

  v7 = a1[4];
  v8 = a1[5];
  v9 = a1[6];
  v10 = a1[7];
  v17.origin.x = v7;
  v17.origin.y = v8;
  v17.size.width = v9;
  v17.size.height = v10;
  MidX = CGRectGetMidX(v17);
  v18.origin.x = v7;
  v18.origin.y = v8;
  v18.size.width = v9;
  v18.size.height = v10;
  MidY = CGRectGetMidY(v18);
  v19.origin.x = v7;
  v19.origin.y = v8;
  v19.size.width = v9;
  v19.size.height = v10;
  Width = CGRectGetWidth(v19);
  v20.origin.x = v7;
  v20.origin.y = v8;
  v20.size.width = v9;
  v20.size.height = v10;
  Height = CGRectGetHeight(v20);
  v14.f64[0] = Width;
  v14.f64[1] = Height;
  *(CGFloat *)a3 = MidX;
  *(CGFloat *)&a3[1] = MidY;
  a3[2] = (float32x2_t)0xBFF0000000000000;
  a3[3] = vcvt_f32_f64(v14);
  result = a1[8];
  *a4 = result;
  return result;
}

- (void)px_modifyAssetsSectionLayoutGeometry:(id)a3
{
  _QWORD v3[2];
  _OWORD v4[8];
  uint64_t v5;
  char v6;

  v6 = 0;
  memset(v4, 0, sizeof(v4));
  v5 = 0;
  v3[0] = 0;
  v3[1] = 0;
  (*((void (**)(id, uint64_t, _OWORD *, _QWORD *, char *))a3 + 2))(a3, 0x7FFFFFFFFFFFFFFFLL, v4, v3, &v6);
}

@end
