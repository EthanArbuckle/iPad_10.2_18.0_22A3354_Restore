@implementation PXCuratedLibrarySectionedLayout

- (id)layoutSnapshotDataSource
{
  return self->_currentDataSource;
}

void __78__PXCuratedLibrarySectionedLayout_enumerateAssetsSectionSublayoutsUsingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __41__PXCuratedLibrarySectionedLayout_update__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setZoomLevel:", *(_QWORD *)(a1 + 32));
}

uint64_t __41__PXCuratedLibrarySectionedLayout_update__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_configureSectionLayout:atIndex:", a3, a2);
}

uint64_t __41__PXCuratedLibrarySectionedLayout_update__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setSpec:", *(_QWORD *)(a1 + 32));
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  int v6;
  id v8;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  void *v11;
  uint64_t v12;
  $F40CD077B40800501ED060B808F886F7 *v13;
  unint64_t v14;
  $F40CD077B40800501ED060B808F886F7 *v15;
  unint64_t v16;
  $F40CD077B40800501ED060B808F886F7 *v17;
  unint64_t v18;
  $F40CD077B40800501ED060B808F886F7 *v19;
  unint64_t v20;
  _BOOL4 v21;
  _BOOL4 v22;
  _BOOL4 v23;
  _BOOL4 v24;
  _BOOL4 willPerformUpdate;
  void *v26;
  void *v27;
  _QWORD v28[5];

  v6 = a4;
  v8 = a3;
  if ((void *)PXCuratedLibraryViewModelObserverContext_236584 != a5)
    goto LABEL_44;
  if ((v6 & 0x10) != 0)
  {
    if (self->_isUpdatingSublayouts)
    {
      -[PXCuratedLibrarySectionedLayout _updateSublayoutsDataSource](self, "_updateSublayoutsDataSource");
      goto LABEL_13;
    }
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_10:
        p_updateFlags->needsUpdate = needsUpdate | 2;
LABEL_11:
        if ((-[PXAssetsDataSource areAllSectionsConsideredAccurate](self->_currentDataSource, "areAllSectionsConsideredAccurate") & 1) == 0)-[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
        goto LABEL_13;
      }
    }
    else if (!self->_updateFlags.isPerformingUpdate)
    {
      willPerformUpdate = self->_updateFlags.willPerformUpdate;
      p_updateFlags->needsUpdate = 2;
      if (!willPerformUpdate)
        -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
      goto LABEL_11;
    }
    if ((self->_updateFlags.updated & 2) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionedLayout observable:didChange:context:]");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, CFSTR("PXCuratedLibrarySectionedLayout.m"), 770, CFSTR("invalidating %lu after it already has been updated"), 2);
      goto LABEL_60;
    }
    goto LABEL_10;
  }
LABEL_13:
  if ((v6 & 4) == 0)
    goto LABEL_21;
  -[PXCuratedLibrarySectionedLayout viewModel](self, "viewModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "zoomLevel");

  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __64__PXCuratedLibrarySectionedLayout_observable_didChange_context___block_invoke;
  v28[3] = &__block_descriptor_40_e38_v32__0q8__PXAssetsSectionLayout_16_B24l;
  v28[4] = v12;
  -[PXCuratedLibrarySectionedLayout enumerateAssetsSectionSublayoutsUsingBlock:](self, "enumerateAssetsSectionSublayoutsUsingBlock:", v28);
  v13 = &self->_updateFlags;
  v14 = self->_updateFlags.needsUpdate;
  if (!v14)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
      v22 = self->_updateFlags.willPerformUpdate;
      v13->needsUpdate = 4;
      if (!v22)
        -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
      goto LABEL_20;
    }
    goto LABEL_18;
  }
  if (self->_updateFlags.isPerformingUpdate)
  {
LABEL_18:
    if ((self->_updateFlags.updated & 4) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionedLayout observable:didChange:context:]");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, CFSTR("PXCuratedLibrarySectionedLayout.m"), 786, CFSTR("invalidating %lu after it already has been updated"), 4);
      goto LABEL_60;
    }
  }
  v13->needsUpdate = v14 | 4;
LABEL_20:
  -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
LABEL_21:
  if ((*(_QWORD *)&v6 & 0x210009) == 0)
    goto LABEL_28;
  v15 = &self->_updateFlags;
  v16 = self->_updateFlags.needsUpdate;
  if (v16)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_27:
      v15->needsUpdate = v16 | 8;
      goto LABEL_28;
    }
LABEL_26:
    if ((self->_updateFlags.updated & 8) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionedLayout observable:didChange:context:]");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, CFSTR("PXCuratedLibrarySectionedLayout.m"), 798, CFSTR("invalidating %lu after it already has been updated"), 8);
      goto LABEL_60;
    }
    goto LABEL_27;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_26;
  v21 = self->_updateFlags.willPerformUpdate;
  v15->needsUpdate = 8;
  if (!v21)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
LABEL_28:
  if ((v6 & 0x200) == 0)
    goto LABEL_35;
  v17 = &self->_updateFlags;
  v18 = self->_updateFlags.needsUpdate;
  if (v18)
  {
    if (!self->_updateFlags.isPerformingUpdate)
    {
LABEL_34:
      v17->needsUpdate = v18 | 0x10;
      goto LABEL_35;
    }
LABEL_33:
    if ((self->_updateFlags.updated & 0x10) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionedLayout observable:didChange:context:]");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, CFSTR("PXCuratedLibrarySectionedLayout.m"), 802, CFSTR("invalidating %lu after it already has been updated"), 16);
      goto LABEL_60;
    }
    goto LABEL_34;
  }
  if (self->_updateFlags.isPerformingUpdate)
    goto LABEL_33;
  v23 = self->_updateFlags.willPerformUpdate;
  v17->needsUpdate = 16;
  if (!v23)
    -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
LABEL_35:
  if ((v6 & 8) != 0)
    self->_dataSourceIdentifierOfCachedSectionsWithSelectedItems = *(_QWORD *)off_1E50B7E98;
  if ((v6 & 0x800) != 0)
  {
    v19 = &self->_updateFlags;
    v20 = self->_updateFlags.needsUpdate;
    if (v20)
    {
      if (!self->_updateFlags.isPerformingUpdate)
        goto LABEL_43;
      goto LABEL_42;
    }
    if (self->_updateFlags.isPerformingUpdate)
    {
LABEL_42:
      if ((self->_updateFlags.updated & 0x40) == 0)
      {
LABEL_43:
        v19->needsUpdate = v20 | 0x40;
        goto LABEL_44;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionedLayout observable:didChange:context:]");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, CFSTR("PXCuratedLibrarySectionedLayout.m"), 810, CFSTR("invalidating %lu after it already has been updated"), 64);
LABEL_60:

      abort();
    }
    v24 = self->_updateFlags.willPerformUpdate;
    v19->needsUpdate = 64;
    if (!v24)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
LABEL_44:

}

- (int64_t)scrollableAxis
{
  return 1;
}

- (CGSize)layout:(id)a3 estimatedContentSizeForSublayoutAtIndex:(int64_t)a4 referenceSize:(CGSize)a5
{
  double height;
  double width;
  PXAssetsDataSource *currentDataSource;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  int64_t currentZoomLevel;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  _QWORD v22[2];
  int64x2_t v23;
  CGSize result;

  height = a5.height;
  width = a5.width;
  currentDataSource = self->_currentDataSource;
  v22[0] = -[PXAssetsDataSource identifier](currentDataSource, "identifier", a3);
  v22[1] = a4;
  v23 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  -[PXAssetsDataSource assetCollectionAtSectionIndexPath:](currentDataSource, "assetCollectionAtSectionIndexPath:", v22);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "estimatedAssetCount");
  v12 = -[PXAssetsDataSource hasCurationForAssetCollection:](self->_currentDataSource, "hasCurationForAssetCollection:", v10);
  currentZoomLevel = self->_currentZoomLevel;
  -[PXCuratedLibrarySectionedLayout spec](self, "spec");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "sectionLayoutSpec");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXAssetsSectionLayout estimatedSizeWithReferenceSize:assetCollection:numberOfAssets:isCurated:zoomLevel:spec:](PXAssetsSectionLayout, "estimatedSizeWithReferenceSize:assetCollection:numberOfAssets:isCurated:zoomLevel:spec:", v10, v11, v12, currentZoomLevel, v15, width, height);
  v17 = v16;
  v19 = v18;

  v20 = v17;
  v21 = v19;
  result.height = v21;
  result.width = v20;
  return result;
}

- (PXCuratedLibraryLayoutSpec)spec
{
  return self->_spec;
}

- (void)_updateSublayoutsDataSource
{
  void *v4;
  void *v5;
  PXAssetsDataSource **p_currentDataSource;
  PXAssetsDataSource *v7;
  PXAssetsDataSource *v8;
  uint64_t v9;
  int64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  char *v16;
  SEL v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  PXAssetsDataSource *v27;
  id v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  int64_t v32;
  PXAssetsDataSource *v33;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  void *v36;
  _BOOL4 willPerformUpdate;
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
  SEL v52;
  int64x2_t v53;
  _QWORD v54[4];
  PXAssetsDataSource *v55;
  PXCuratedLibrarySectionedLayout *v56;
  _QWORD v57[2];
  int64x2_t v58;
  _QWORD v59[4];
  PXAssetsDataSource *v60;
  PXAssetsDataSource *v61;
  id v62;
  id v63;
  _QWORD v64[7];

  -[PXCuratedLibrarySectionedLayout viewModel](self, "viewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetsDataSourceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  p_currentDataSource = &self->_currentDataSource;
  v7 = self->_currentDataSource;
  objc_msgSend(v5, "dataSource");
  v8 = (PXAssetsDataSource *)objc_claimAutoreleasedReturnValue();
  if (v7 != v8)
  {
    v9 = objc_msgSend(v5, "zoomLevel");
    if (v9 != 4)
    {
      v10 = v9;
      -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[PXAssetsDataSource numberOfSections](v7, "numberOfSections");
      v49 = v11;
      if (v12 != objc_msgSend(v11, "count"))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibrarySectionedLayout.m"), 363, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("numberOfSublayoutsBefore == sublayoutDataStore.count"));

      }
      objc_msgSend(v5, "changeHistory");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "changeDetailsFromDataSourceIdentifier:toDataSourceIdentifier:", -[PXAssetsDataSource identifier](v7, "identifier"), -[PXAssetsDataSource identifier](v8, "identifier"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = MEMORY[0x1E0C809B0];
      v16 = "uttonFactory";
      v50 = v5;
      v51 = v14;
      if (self->_isUpdatingSublayouts)
      {
        if (objc_msgSend(v14, "count") != 1)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibrarySectionedLayout.m"), 373, CFSTR("While updating sublayouts, expecting only one data source change, got %lu"), objc_msgSend(v14, "count"));

        }
        objc_msgSend(v14, "firstObject");
        v17 = a2;
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "sectionsWithItemChanges");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v64[0] = v15;
        v64[1] = 3221225472;
        v64[2] = __62__PXCuratedLibrarySectionedLayout__updateSublayoutsDataSource__block_invoke;
        v64[3] = &unk_1E51479F0;
        v64[4] = self;
        v64[5] = v17;
        v52 = v17;
        objc_msgSend(v19, "enumerateIndexesUsingBlock:", v64);

        objc_msgSend(v18, "sectionChanges");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v20, "hasIncrementalChanges") & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", v17, self, CFSTR("PXCuratedLibrarySectionedLayout.m"), 379, CFSTR("Section changes while updating sublayouts must be incremental."));

        }
        objc_msgSend(v20, "insertedIndexes");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "count");

        if (v22)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "insertedIndexes");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", v52, self, CFSTR("PXCuratedLibrarySectionedLayout.m"), 380, CFSTR("Sections %@ inserted while updating sublayouts, this is not supported."), v42);

        }
        objc_msgSend(v20, "removedIndexes");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "count");

        if (v24)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "removedIndexes");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", v52, self, CFSTR("PXCuratedLibrarySectionedLayout.m"), 381, CFSTR("Sections %@ removed while updating sublayouts, this is not supported."), v44);

        }
        v14 = v51;
        v15 = MEMORY[0x1E0C809B0];
        v16 = "LemonadeProfileButtonFactory" + 16;
      }
      else
      {
        v25 = -[PXGLayout createCuratedLibraryLayoutAnimationIfNeededWithContext:](self, "createCuratedLibraryLayoutAnimationIfNeededWithContext:", 1);
        -[PXCuratedLibrarySectionedLayout _anchorVisibleArea](self, "_anchorVisibleArea");
      }
      objc_storeStrong((id *)&self->_currentDataSource, v8);
      self->_currentZoomLevel = v10;
      v62 = 0;
      v63 = 0;
      v59[0] = v15;
      v26 = *((_QWORD *)v16 + 7);
      v59[1] = v26;
      v59[2] = __62__PXCuratedLibrarySectionedLayout__updateSublayoutsDataSource__block_invoke_2;
      v59[3] = &unk_1E513BA08;
      v60 = v7;
      v27 = v8;
      v61 = v27;
      -[PXGLayout applySectionedChangeDetails:dataSourceBeforeChanges:dataSourceAfterChanges:sublayoutProvider:outChangedSections:outSectionsWithItemChanges:changeMediaVersionHandler:](self, "applySectionedChangeDetails:dataSourceBeforeChanges:dataSourceAfterChanges:sublayoutProvider:outChangedSections:outSectionsWithItemChanges:changeMediaVersionHandler:", v14, v60, v27, self, &v63, &v62, v59);
      v28 = v63;
      v29 = v62;
      -[PXGLayout invalidateVersion](self, "invalidateVersion");
      v48 = v28;
      objc_msgSend(v28, "enumerateIndexesUsingBlock:", &__block_literal_global_236623);
      v47 = v29;
      objc_msgSend(v29, "enumerateIndexesUsingBlock:", &__block_literal_global_181_236624);
      v30 = -[PXAssetsDataSource numberOfSections](*p_currentDataSource, "numberOfSections");
      -[PXCuratedLibrarySectionedLayout _prepareAccumulatedSectionItemsBufferForSections:](self, "_prepareAccumulatedSectionItemsBufferForSections:", v30);
      if (v30 >= 1)
      {
        v31 = 0;
        v32 = 0;
        v53 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
        do
        {
          self->_accumulatedSectionItems[v31] = v32;
          v33 = *p_currentDataSource;
          v57[0] = -[PXAssetsDataSource identifier](*p_currentDataSource, "identifier");
          v57[1] = v31;
          v58 = v53;
          v32 += -[PXAssetsDataSource estimatedAssetCountForSectionIndexPath:](v33, "estimatedAssetCountForSectionIndexPath:", v57);
          ++v31;
        }
        while (v30 != v31);
      }
      v54[0] = MEMORY[0x1E0C809B0];
      v54[1] = v26;
      v54[2] = __62__PXCuratedLibrarySectionedLayout__updateSublayoutsDataSource__block_invoke_5;
      v54[3] = &unk_1E513B470;
      v55 = v27;
      v56 = self;
      -[PXCuratedLibrarySectionedLayout enumerateAssetsSectionSublayoutsUsingBlock:](self, "enumerateAssetsSectionSublayoutsUsingBlock:", v54);
      p_updateFlags = &self->_updateFlags;
      needsUpdate = self->_updateFlags.needsUpdate;
      if (needsUpdate)
      {
        v5 = v50;
        if (!self->_updateFlags.isPerformingUpdate)
        {
LABEL_24:
          p_updateFlags->needsUpdate = needsUpdate | 0x5D;
          v36 = v51;
LABEL_25:

          goto LABEL_26;
        }
      }
      else
      {
        v5 = v50;
        if (!self->_updateFlags.isPerformingUpdate)
        {
          willPerformUpdate = self->_updateFlags.willPerformUpdate;
          p_updateFlags->needsUpdate = 93;
          v36 = v51;
          if (!willPerformUpdate)
            -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
          goto LABEL_25;
        }
      }
      if ((self->_updateFlags.updated & 0x5D) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionedLayout _updateSublayoutsDataSource]");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "handleFailureInFunction:file:lineNumber:description:", v46, CFSTR("PXCuratedLibrarySectionedLayout.m"), 426, CFSTR("invalidating %lu after it already has been updated"), 93);

        abort();
      }
      goto LABEL_24;
    }
  }
LABEL_26:

}

- (void)_prepareAccumulatedSectionItemsBufferForSections:(int64_t)a3
{
  if (self->_accumulatedSectionItemsCount < a3)
  {
    _PXGArrayResize();
    self->_accumulatedSectionItemsCount = a3;
  }
}

- (void)_configureSectionLayout:(id)a3 atIndex:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = a3;
  -[PXCuratedLibrarySectionedLayout viewModel](self, "viewModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibrarySectionedLayout defaultInterlayoutSpacing](self, "defaultInterlayoutSpacing");
  objc_msgSend(v16, "setIntersectionSpacing:");
  objc_msgSend(v16, "setIsSelecting:", objc_msgSend(v6, "isSelecting"));
  objc_msgSend(v6, "draggedAssetReferences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setDraggedAssetReferences:", v7);

  objc_msgSend(v6, "allowedActions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setCanStartSelecting:", objc_msgSend(v8, "containsObject:", CFSTR("PXCuratedLibraryActionEnterSelectMode")));

  if (objc_msgSend(v6, "zoomLevel") == 4)
    v9 = self->_accumulatedSectionItems[a4];
  else
    v9 = 0x7FFFFFFFFFFFFFFFLL;
  objc_msgSend(v16, "setNumberOfPrecedingAssets:", v9);
  objc_msgSend(v16, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "identifier");
  objc_msgSend(v6, "selectionSnapshot");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "identifier");

  if (v11 == v14)
  {
    objc_msgSend(v6, "selectionSnapshot");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
  objc_msgSend(v16, "setSelectionSnapshot:", v15);

}

- (PXCuratedLibraryViewModel)viewModel
{
  return self->_viewModel;
}

- (double)defaultInterlayoutSpacing
{
  return self->_defaultInterlayoutSpacing;
}

- (PXCuratedLibrarySectionedLayout)initWithViewModel:(id)a3 spec:(id)a4
{
  id v7;
  id v8;
  PXCuratedLibrarySectionedLayout *v9;
  PXCuratedLibrarySectionedLayout *v10;
  uint64_t *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v15;
  void *v16;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)PXCuratedLibrarySectionedLayout;
  v9 = -[PXGCompositeLayout init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_spec, a4);
    objc_storeStrong((id *)&v10->_viewModel, a3);
    -[PXCuratedLibraryViewModel registerChangeObserver:context:](v10->_viewModel, "registerChangeObserver:context:", v10, PXCuratedLibraryViewModelObserverContext_236584);
    -[PXGCompositeLayout setSublayoutFaultingDelegate:](v10, "setSublayoutFaultingDelegate:", v10);
    if (!+[PXCuratedLibrarySectionedLayout shouldDisableLaunchOptimizations](PXCuratedLibrarySectionedLayout, "shouldDisableLaunchOptimizations"))v10->_isInitialLoad = 1;
    p_updateFlags = (uint64_t *)&v10->_updateFlags;
    needsUpdate = v10->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!v10->_updateFlags.isPerformingUpdate)
      {
LABEL_9:
        *p_updateFlags = needsUpdate | 0x7F;
        goto LABEL_10;
      }
LABEL_8:
      if ((v10->_updateFlags.updated & 0x7F) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionedLayout initWithViewModel:spec:]");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("PXCuratedLibrarySectionedLayout.m"), 107, CFSTR("invalidating %lu after it already has been updated"), 127);

        abort();
      }
      goto LABEL_9;
    }
    if (v10->_updateFlags.isPerformingUpdate)
      goto LABEL_8;
    willPerformUpdate = v10->_updateFlags.willPerformUpdate;
    *p_updateFlags = 127;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](v10, "setNeedsUpdate");
  }
LABEL_10:

  return v10;
}

- (void)setLateralMargin:(double)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;

  if (self->_lateralMargin != a3)
  {
    self->_lateralMargin = a3;
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
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionedLayout setLateralMargin:]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXCuratedLibrarySectionedLayout.m"), 649, CFSTR("invalidating %lu after it already has been updated"), 4);

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

+ (BOOL)shouldDisableLaunchOptimizations
{
  return _shouldDisableLaunchOptimizations;
}

- (void)_anchorVisibleArea
{
  void *v2;
  id v3;
  id v4;

  -[PXGLayout rootLayout](self, "rootLayout");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createAnchorForVisibleArea");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v2, "autoInvalidate");

}

- (PXAssetsSectionLayout)dominantSectionLayout
{
  void *v3;
  int64_t v4;
  int64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  char v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  _QWORD v33[15];
  _QWORD v34[9];
  BOOL v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  id *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;

  -[PXCuratedLibrarySectionedLayout lastHitSpriteReference](self, "lastHitSpriteReference");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = -[PXGLayout sublayoutIndexForSpriteReference:options:](self, "sublayoutIndexForSpriteReference:options:", v3, 0);
  else
    v4 = 0x7FFFFFFFFFFFFFFFLL;
  v5 = -[PXCuratedLibrarySectionedLayout presentedZoomLevel](self, "presentedZoomLevel");
  -[PXCuratedLibrarySectionedLayout lastVisibleDominantObjectReference](self, "lastVisibleDominantObjectReference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[PXGLayout spriteReferenceForObjectReference:](self, "spriteReferenceForObjectReference:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[PXGLayout sublayoutIndexForSpriteReference:options:](self, "sublayoutIndexForSpriteReference:options:", v7, 1);

  }
  v44 = 0;
  v45 = (id *)&v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__236565;
  v48 = __Block_byref_object_dispose__236566;
  v49 = 0;
  if (v4 == 0x7FFFFFFFFFFFFFFFLL
    || (-[PXGLayout sublayoutAtIndex:loadIfNeeded:](self, "sublayoutAtIndex:loadIfNeeded:", v4, 0),
        v8 = objc_claimAutoreleasedReturnValue(),
        v9 = v45[5],
        v45[5] = (id)v8,
        v9,
        !v45[5]))
  {
    -[PXGLayout visibleRect](self, "visibleRect");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v18 = -[PXGLayout fullyVisibleEdgesWithDefaultTolerance](self, "fullyVisibleEdgesWithDefaultTolerance");
    if ((v18 & 5) != 0)
    {
      v40 = 0;
      v41 = &v40;
      v42 = 0x2020000000;
      v43 = 0x7FEFFFFFFFFFFFFFLL;
      v36 = 0;
      v37 = &v36;
      v38 = 0x2020000000;
      v39 = 0;
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __56__PXCuratedLibrarySectionedLayout_dominantSectionLayout__block_invoke;
      v34[3] = &unk_1E513B628;
      v35 = (v18 & 4) != 0;
      v34[4] = self;
      v34[5] = &v40;
      v34[6] = &v36;
      v34[7] = &v44;
      v34[8] = v5;
      -[PXCuratedLibrarySectionedLayout enumerateAssetsSectionSublayoutsInRect:usingBlock:](self, "enumerateAssetsSectionSublayoutsInRect:usingBlock:", v34, v11, v13, v15, v17);
    }
    else
    {
      -[PXGLayout safeAreaInsets](self, "safeAreaInsets");
      +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "topInsetForVisibilityAnchoring");

      PXEdgeInsetsInsetRect();
      v21 = v20;
      v23 = v22;
      v25 = v24;
      v27 = v26;
      PXRectGetCenter();
      v40 = 0;
      v41 = &v40;
      v42 = 0x2020000000;
      v43 = 0x8000000000000001;
      v36 = 0;
      v37 = &v36;
      v38 = 0x2020000000;
      v39 = 0x7FEFFFFFFFFFFFFFLL;
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __56__PXCuratedLibrarySectionedLayout_dominantSectionLayout__block_invoke_2;
      v33[3] = &unk_1E513B650;
      v33[9] = v21;
      v33[10] = v23;
      v33[11] = v25;
      v33[12] = v27;
      v33[13] = v28;
      v33[14] = v29;
      v33[4] = self;
      v33[5] = &v40;
      v33[6] = &v36;
      v33[7] = &v44;
      v33[8] = v5;
      -[PXCuratedLibrarySectionedLayout enumerateAssetsSectionSublayoutsInRect:usingBlock:](self, "enumerateAssetsSectionSublayoutsInRect:usingBlock:", v33, v11, v13, v15, v17);
    }
    _Block_object_dispose(&v36, 8);
    _Block_object_dispose(&v40, 8);
  }
  if (-[PXCuratedLibrarySectionedLayout prefersDominantHeroForZoomLevel:](self, "prefersDominantHeroForZoomLevel:", v5))
  {
    -[PXCuratedLibrarySectionedLayout _heroSectionLayoutClosestToSectionLayout:zoomLevel:](self, "_heroSectionLayoutClosestToSectionLayout:zoomLevel:", v45[5], v5);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30)
      objc_storeStrong(v45 + 5, v30);

  }
  v31 = v45[5];
  _Block_object_dispose(&v44, 8);

  return (PXAssetsSectionLayout *)v31;
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
  v12[2] = __85__PXCuratedLibrarySectionedLayout_enumerateAssetsSectionSublayoutsInRect_usingBlock___block_invoke;
  v12[3] = &unk_1E513B990;
  v13 = v9;
  v11 = v9;
  objc_msgSend(v10, "enumerateSublayoutsInRect:usingBlock:", v12, x, y, width, height);

}

- (void)setSafeAreaInsets:(UIEdgeInsets)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXCuratedLibrarySectionedLayout;
  -[PXGLayout setSafeAreaInsets:](&v9, sel_setSafeAreaInsets_, a3.top, a3.left, a3.bottom, a3.right);
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
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionedLayout setSafeAreaInsets:]");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("PXCuratedLibrarySectionedLayout.m"), 654, CFSTR("invalidating %lu after it already has been updated"), 4);

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

- (int64_t)presentedZoomLevel
{
  return self->_presentedZoomLevel;
}

- (BOOL)prefersDominantHeroForZoomLevel:(int64_t)a3
{
  return -[NSMutableIndexSet containsIndex:](self->_zoomLevelsPreferringDominantHeros, "containsIndex:", a3);
}

- (id)lastVisibleDominantObjectReference
{
  return self->_lastVisibleDominantObjectReference;
}

- (PXGSpriteReference)lastHitSpriteReference
{
  return self->_lastHitSpriteReference;
}

- (void)enumerateVisibleAnchoringLayoutsUsingBlock:(id)a3
{
  void (**v4)(id, void *, _BYTE *);
  void *v5;
  objc_super v6;
  char v7;

  v4 = (void (**)(id, void *, _BYTE *))a3;
  -[PXCuratedLibrarySectionedLayout dominantSectionLayout](self, "dominantSectionLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v7 = 0;
    v4[2](v4, v5, &v7);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)PXCuratedLibrarySectionedLayout;
    -[PXGLayout enumerateVisibleAnchoringLayoutsUsingBlock:](&v6, sel_enumerateVisibleAnchoringLayoutsUsingBlock_, v4);
  }

}

- (BOOL)allowsSublayoutUpdateCycleAssertions
{
  return 0;
}

- (void)clearLastVisibleAreaAnchoringInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXCuratedLibrarySectionedLayout;
  -[PXGLayout clearLastVisibleAreaAnchoringInformation](&v3, sel_clearLastVisibleAreaAnchoringInformation);
  -[PXCuratedLibrarySectionedLayout setLastHitSpriteReference:](self, "setLastHitSpriteReference:", 0);
}

- (void)setLastHitSpriteReference:(id)a3
{
  PXGSpriteReference *v5;
  PXGSpriteReference *v6;

  v5 = (PXGSpriteReference *)a3;
  if (self->_lastHitSpriteReference != v5)
  {
    v6 = v5;
    if (v5)
      -[PXCuratedLibrarySectionedLayout clearLastVisibleAreaAnchoringInformation](self, "clearLastVisibleAreaAnchoringInformation");
    objc_storeStrong((id *)&self->_lastHitSpriteReference, a3);
    v5 = v6;
  }

}

- (void)setLastVisibleDominantObjectReference:(id)a3
{
  objc_storeStrong(&self->_lastVisibleDominantObjectReference, a3);
}

void __85__PXCuratedLibrarySectionedLayout_enumerateAssetsSectionSublayoutsInRect_usingBlock___block_invoke(uint64_t a1, double a2, double a3, double a4, double a5, uint64_t a6, void *a7)
{
  id v12;

  v12 = a7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    (*(void (**)(double, double, double, double))(*(_QWORD *)(a1 + 32) + 16))(a2, a3, a4, a5);

}

void __56__PXCuratedLibrarySectionedLayout_dominantSectionLayout__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  double MinY;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;

  v22 = a3;
  objc_msgSend(v22, "assetCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && !PXCuratedLibraryAssetsCollectionRepresentsChapterHeader(v5, *(_QWORD *)(a1 + 64)))
  {
    v7 = *MEMORY[0x1E0C9D538];
    v8 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    objc_msgSend(v22, "contentSize");
    objc_msgSend(*(id *)(a1 + 32), "convertRect:fromDescendantLayout:", v22, v7, v8, v9, v10);
    if (*(_BYTE *)(a1 + 72))
      MinY = -CGRectGetMaxY(*(CGRect *)&v11);
    else
      MinY = CGRectGetMinY(*(CGRect *)&v11);
    v16 = round(MinY);
    if (*(_BYTE *)(a1 + 72))
    {
      objc_msgSend(v6, "endDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "timeIntervalSinceReferenceDate");
      v19 = -v18;
    }
    else
    {
      objc_msgSend(v6, "startDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "timeIntervalSinceReferenceDate");
      v19 = v20;
    }

    v21 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    if (v16 < v21 || v16 == v21 && v19 < *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v16;
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v19;
    }
  }

}

id __75__PXCuratedLibrarySectionedLayout_dateIntervalFutureForContentInRect_type___block_invoke_2(uint64_t a1)
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

- (id)locationNamesFutureForContentInRect:(CGRect)a3
{
  return 0;
}

- (id)dateIntervalFutureForContentInRect:(CGRect)a3 type:(unint64_t)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD aBlock[4];
  id v17;
  _QWORD v18[5];
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __75__PXCuratedLibrarySectionedLayout_dateIntervalFutureForContentInRect_type___block_invoke;
  v18[3] = &unk_1E513B800;
  v18[4] = self;
  v20 = x;
  v21 = y;
  v22 = width;
  v23 = height;
  v11 = v9;
  v19 = v11;
  -[PXCuratedLibrarySectionedLayout enumerateAssetsSectionSublayoutsInRect:usingBlock:](self, "enumerateAssetsSectionSublayoutsInRect:usingBlock:", v18, x, y, width, height);
  aBlock[0] = v10;
  aBlock[1] = 3221225472;
  aBlock[2] = __75__PXCuratedLibrarySectionedLayout_dateIntervalFutureForContentInRect_type___block_invoke_2;
  aBlock[3] = &unk_1E513B7D8;
  v17 = v11;
  v12 = v11;
  v13 = _Block_copy(aBlock);
  v14 = (void *)objc_msgSend(v13, "copy");

  return v14;
}

- (void)didFaultInSublayout:(id)a3 atIndex:(int64_t)a4 fromEstimatedContentSize:(CGSize)a5
{
  double height;
  double width;
  id v10;
  id v11;
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
  v10 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PXCuratedLibrarySectionedLayout;
  -[PXGLayout didFaultInSublayout:atIndex:fromEstimatedContentSize:](&v22, sel_didFaultInSublayout_atIndex_fromEstimatedContentSize_, v10, a4, width, height);
  -[PXCuratedLibrarySectionedLayout _updatePrefetchedSectionsForFaultedInSublayout:](self, "_updatePrefetchedSectionsForFaultedInSublayout:", v10);
  v11 = v10;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (objc_class *)objc_opt_class();
    NSStringFromClass(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibrarySectionedLayout.m"), 329, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("sublayout"), v17);
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
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibrarySectionedLayout.m"), 329, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("sublayout"), v17, v19);

    goto LABEL_6;
  }
LABEL_3:
  objc_msgSend(v11, "assetCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibrarySectionedLayout viewModel](self, "viewModel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __88__PXCuratedLibrarySectionedLayout_didFaultInSublayout_atIndex_fromEstimatedContentSize___block_invoke;
  v20[3] = &unk_1E5143468;
  v21 = v12;
  v14 = v12;
  objc_msgSend(v13, "performChanges:", v20);

}

- (void)_updatePrefetchedSectionsForFaultedInSublayout:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  int64x2_t v13;
  _QWORD v14[2];
  int64x2_t v15;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "sectionsToPrefetch");

    v7 = -[PXAssetsDataSource numberOfSections](self->_currentDataSource, "numberOfSections");
    if (v7 > v6)
    {
      v8 = v7;
      v9 = objc_msgSend(v4, "section");
      v10 = (v9 - v6) & ~((v9 - v6) >> 63);
      if (v9 + v6 >= v8 - 1)
        v11 = v8 - 1;
      else
        v11 = v9 + v6;
      objc_msgSend(off_1E50B3668, "indexPathSet");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10 < v11)
      {
        v13 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
        do
        {
          v14[0] = -[PXAssetsDataSource identifier](self->_currentDataSource, "identifier", *(_OWORD *)&v13);
          v14[1] = v10;
          v15 = v13;
          objc_msgSend(v12, "addIndexPath:", v14);
          ++v10;
        }
        while (v11 != v10);
      }
      -[PXAssetsDataSource prefetchSections:](self->_currentDataSource, "prefetchSections:", v12);

    }
  }

}

- (void)_updateSublayoutsForSkimming
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  __int128 v7;
  void *v8;
  PXAssetsDataSource *presentedDataSource;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  PXCuratedLibrarySectionedLayout *v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  _OWORD v20[2];

  -[PXCuratedLibrarySectionedLayout viewModel](self, "viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "skimmingInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "childCollectionsZoomLevel"))
  {
    objc_msgSend(v4, "parentAssetCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5
      && ((objc_msgSend(v4, "touchInteractionStarted") & 1) != 0 || objc_msgSend(v4, "slideshowStarted")))
    {
      v6 = objc_alloc((Class)off_1E50B1668);
      v7 = *((_OWORD *)off_1E50B8778 + 1);
      v20[0] = *(_OWORD *)off_1E50B8778;
      v20[1] = v7;
      v8 = (void *)objc_msgSend(v6, "initWithSectionObject:itemObject:subitemObject:indexPath:", v5, 0, 0, v20);
      presentedDataSource = self->_presentedDataSource;
      if (presentedDataSource)
      {
        -[PXAssetsDataSource indexPathForAssetCollectionReference:](presentedDataSource, "indexPathForAssetCollectionReference:", v8);
        v10 = *((_QWORD *)&v18 + 1);
      }
      else
      {
        v10 = 0;
        v18 = 0u;
        v19 = 0u;
      }

    }
    else
    {
      v10 = 0x7FFFFFFFFFFFFFFFLL;
    }

  }
  else
  {
    v10 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __63__PXCuratedLibrarySectionedLayout__updateSublayoutsForSkimming__block_invoke;
  v13[3] = &unk_1E513B4C0;
  v14 = v4;
  v15 = v3;
  v16 = self;
  v17 = v10;
  v11 = v3;
  v12 = v4;
  -[PXCuratedLibrarySectionedLayout enumerateAssetsSectionSublayoutsUsingBlock:](self, "enumerateAssetsSectionSublayoutsUsingBlock:", v13);

}

- (void)update
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  id v10;
  unint64_t v11;
  int64_t currentZoomLevel;
  double v13;
  double v14;
  CGFloat v15;
  uint64_t v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  double v28;
  UIEdgeInsets *p_padding;
  PXYearsSublayoutComposition *v30;
  PXYearsSublayoutComposition *v31;
  void *v32;
  void *v33;
  PXYearsSublayoutComposition *v34;
  unint64_t v35;
  void *v36;
  void *v37;
  int64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v43;
  uint64_t v44;
  unint64_t v46;
  BOOL isUpdatingSublayouts;
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
  objc_super v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _QWORD v69[5];
  _QWORD v70[5];
  _QWORD v71[4];
  id v72;

  p_updateFlags = &self->_updateFlags;
  self->_updateFlags.willPerformUpdate = 0;
  needsUpdate = self->_updateFlags.needsUpdate;
  if (!needsUpdate)
    goto LABEL_81;
  if (self->_updateFlags.isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionedLayout update]");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "handleFailureInFunction:file:lineNumber:description:", v49, CFSTR("PXCuratedLibrarySectionedLayout.m"), 122, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!_updateFlags.isPerformingUpdate"));

    needsUpdate = p_updateFlags->needsUpdate;
  }
  p_updateFlags->isPerformingUpdate = 1;
  p_updateFlags->updated = 32;
  if ((needsUpdate & 0x20) != 0)
  {
    p_updateFlags->needsUpdate = needsUpdate & 0xFFFFFFFFFFFFFFDFLL;
    -[PXCuratedLibrarySectionedLayout _updateFaultOutsets](self, "_updateFaultOutsets");
    if (!p_updateFlags->isPerformingUpdate)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionedLayout update]");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "handleFailureInFunction:file:lineNumber:description:", v63, CFSTR("PXCuratedLibrarySectionedLayout.m"), 128, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

    }
  }
  v5 = p_updateFlags->needsUpdate;
  p_updateFlags->updated |= 2uLL;
  if ((v5 & 2) != 0)
  {
    p_updateFlags->needsUpdate = v5 & 0xFFFFFFFFFFFFFFFDLL;
    -[PXCuratedLibrarySectionedLayout _updateSublayoutsDataSource](self, "_updateSublayoutsDataSource");
  }
  if (!p_updateFlags->isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionedLayout update]");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "handleFailureInFunction:file:lineNumber:description:", v51, CFSTR("PXCuratedLibrarySectionedLayout.m"), 132, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

  }
  v6 = p_updateFlags->needsUpdate;
  p_updateFlags->updated |= 0x10uLL;
  if ((v6 & 0x10) != 0)
  {
    p_updateFlags->needsUpdate = v6 & 0xFFFFFFFFFFFFFFEFLL;
    -[PXCuratedLibrarySectionedLayout _updateSublayoutsForSkimming](self, "_updateSublayoutsForSkimming");
  }
  -[PXCuratedLibrarySectionedLayout spec](self, "spec");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!p_updateFlags->isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionedLayout update]");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "handleFailureInFunction:file:lineNumber:description:", v53, CFSTR("PXCuratedLibrarySectionedLayout.m"), 138, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

  }
  v8 = p_updateFlags->needsUpdate;
  p_updateFlags->updated |= 1uLL;
  v9 = MEMORY[0x1E0C809B0];
  if ((v8 & 1) != 0)
  {
    p_updateFlags->needsUpdate = v8 & 0xFFFFFFFFFFFFFFFELL;
    objc_msgSend(v7, "sectionLayoutSpec");
    v71[0] = v9;
    v71[1] = 3221225472;
    v71[2] = __41__PXCuratedLibrarySectionedLayout_update__block_invoke;
    v71[3] = &unk_1E513BA58;
    v72 = (id)objc_claimAutoreleasedReturnValue();
    v10 = v72;
    -[PXCuratedLibrarySectionedLayout enumerateAssetsSectionSublayoutsUsingBlock:](self, "enumerateAssetsSectionSublayoutsUsingBlock:", v71);

  }
  if (!p_updateFlags->isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionedLayout update]");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "handleFailureInFunction:file:lineNumber:description:", v55, CFSTR("PXCuratedLibrarySectionedLayout.m"), 145, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

  }
  v11 = p_updateFlags->needsUpdate;
  p_updateFlags->updated |= 4uLL;
  if ((v11 & 4) != 0)
  {
    p_updateFlags->needsUpdate = v11 & 0xFFFFFFFFFFFFFFFBLL;
    currentZoomLevel = self->_currentZoomLevel;
    objc_msgSend(v7, "defaultInterlayoutSpacingForZoomLevel:", currentZoomLevel);
    self->_defaultInterlayoutSpacing = v13;
    -[PXCuratedLibrarySectionedLayout lateralMargin](self, "lateralMargin");
    v15 = v14;
    v16 = objc_msgSend(v7, "userInterfaceIdiom");
    if ((unint64_t)(currentZoomLevel - 1) > 1)
    {
      v17 = *((double *)off_1E50B8020 + 2);
      if (v16 == 4)
      {
        v18 = *(double *)off_1E50B8020;
      }
      else
      {
        -[PXGLayout safeAreaInsets](self, "safeAreaInsets");
        v18 = -v21;
      }
      v22 = v15;
    }
    else
    {
      if (v16 != 4)
      {
        -[PXGLayout safeAreaInsets](self, "safeAreaInsets");
        -[PXCuratedLibrarySectionedLayout viewModel](self, "viewModel");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "styleGuide");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "secondaryToolbarContentInsets");

        if (currentZoomLevel == 2)
          objc_msgSend(v7, "spacingBetweenSafeAreaTopAndFirstMonthTitle");
        else
          objc_msgSend(v7, "spacingBetweenSafeAreaTopAndFirstYearCard");
      }
      PXEdgeInsetsMake();
      v18 = v23;
      v22 = v24;
      v17 = v25;
      v15 = v26;
      if (objc_msgSend(v7, "userInterfaceIdiom") == 5)
      {
        v27 = objc_msgSend(v7, "layoutStyle");
        v28 = 16.0;
        if (currentZoomLevel != 2)
          v28 = 32.0;
        if (v27 != 1)
        {
          v17 = 32.0;
          v18 = v28;
        }
      }
    }
    p_padding = &self->_padding;
    self->_padding.top = v18;
    self->_padding.left = v22;
    self->_padding.bottom = v17;
    self->_padding.right = v15;
    -[PXGCompositeLayout composition](self, "composition");
    v30 = (PXYearsSublayoutComposition *)(id)objc_claimAutoreleasedReturnValue();
    if (currentZoomLevel == 1)
    {
      objc_opt_class();
      v31 = v30;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v31 = objc_alloc_init(PXYearsSublayoutComposition);

      }
      objc_msgSend(v7, "yearsLayoutMetrics");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (currentZoomLevel != 2)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || (-[PXYearsSublayoutComposition padding](v30, "padding"),
              v31 = v30,
              (PXEdgeInsetsEqualToEdgeInsets() & 1) == 0))
        {
          v31 = objc_alloc_init(PXGStackedSublayoutComposition);

        }
        -[PXYearsSublayoutComposition setAxis:](v31, "setAxis:", 1);
        -[PXYearsSublayoutComposition setInterlayoutSpacing:](v31, "setInterlayoutSpacing:", self->_defaultInterlayoutSpacing);
        -[PXYearsSublayoutComposition setPadding:](v31, "setPadding:", p_padding->top, self->_padding.left, self->_padding.bottom, self->_padding.right);
        goto LABEL_48;
      }
      objc_opt_class();
      v31 = v30;
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v31 = objc_alloc_init(PXMonthsSublayoutComposition);

      }
      objc_msgSend(v7, "monthsLayoutMetrics");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v33 = v32;
    v34 = (PXYearsSublayoutComposition *)objc_msgSend(v32, "copy");

    -[PXYearsSublayoutComposition padding](v34, "padding");
    -[PXYearsSublayoutComposition setPadding:](v34, "setPadding:", p_padding->top);
    -[PXYearsSublayoutComposition setMetrics:](v31, "setMetrics:", v34);

    v30 = v34;
LABEL_48:

    -[PXGCompositeLayout setComposition:](self, "setComposition:", v31);
    v9 = MEMORY[0x1E0C809B0];
    v70[0] = MEMORY[0x1E0C809B0];
    v70[1] = 3221225472;
    v70[2] = __41__PXCuratedLibrarySectionedLayout_update__block_invoke_2;
    v70[3] = &__block_descriptor_40_e38_v32__0q8__PXAssetsSectionLayout_16_B24l;
    v70[4] = currentZoomLevel;
    -[PXCuratedLibrarySectionedLayout enumerateAssetsSectionSublayoutsUsingBlock:](self, "enumerateAssetsSectionSublayoutsUsingBlock:", v70);
    if ((unint64_t)(self->_currentZoomLevel - 3) <= 1)
      -[PXGCompositeLayout setSublayoutIndex:forUniquelyStylableType:animated:](self, "setSublayoutIndex:forUniquelyStylableType:animated:", 0x7FFFFFFFFFFFFFFFLL, 0, 0);

  }
  if (!p_updateFlags->isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionedLayout update]");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "handleFailureInFunction:file:lineNumber:description:", v57, CFSTR("PXCuratedLibrarySectionedLayout.m"), 227, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

  }
  v35 = p_updateFlags->needsUpdate;
  p_updateFlags->updated |= 8uLL;
  if ((v35 & 8) != 0)
  {
    p_updateFlags->needsUpdate = v35 & 0xFFFFFFFFFFFFFFF7;
    v69[0] = v9;
    v69[1] = 3221225472;
    v69[2] = __41__PXCuratedLibrarySectionedLayout_update__block_invoke_3;
    v69[3] = &unk_1E513BA58;
    v69[4] = self;
    -[PXCuratedLibrarySectionedLayout enumerateAssetsSectionSublayoutsUsingBlock:](self, "enumerateAssetsSectionSublayoutsUsingBlock:", v69);
    if ((unint64_t)(self->_currentZoomLevel - 1) <= 1)
    {
      -[PXCuratedLibrarySectionedLayout viewModel](self, "viewModel");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "selectionSnapshot");
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      v38 = -[PXCuratedLibraryViewModel zoomLevelTransitionPhase](self->_viewModel, "zoomLevelTransitionPhase");
      v67 = 0u;
      v68 = 0u;
      if (v37)
      {
        objc_msgSend(v37, "pendingIndexPath");
        v39 = v67;
      }
      else
      {
        v39 = 0;
      }
      v40 = *(_QWORD *)off_1E50B7E98;
      v41 = 0x7FFFFFFFFFFFFFFFLL;
      if (v39 != *(_QWORD *)off_1E50B7E98
        && (_QWORD)v68 == 0x7FFFFFFFFFFFFFFFLL
        && *((_QWORD *)&v67 + 1) != 0x7FFFFFFFFFFFFFFFLL)
      {
        v41 = *((_QWORD *)&v67 + 1);
      }
      -[PXGCompositeLayout setSublayoutIndex:forUniquelyStylableType:animated:](self, "setSublayoutIndex:forUniquelyStylableType:animated:", v41, 0, v38 == 0);
      v65 = 0u;
      v66 = 0u;
      if (v37)
      {
        objc_msgSend(v37, "cursorIndexPath");
        v43 = v65;
      }
      else
      {
        v43 = 0;
      }
      v44 = 0x7FFFFFFFFFFFFFFFLL;
      if (v43 != v40 && (_QWORD)v66 == 0x7FFFFFFFFFFFFFFFLL && *((_QWORD *)&v65 + 1) != 0x7FFFFFFFFFFFFFFFLL)
        v44 = *((_QWORD *)&v65 + 1);
      -[PXGCompositeLayout setSublayoutIndex:forUniquelyStylableType:animated:](self, "setSublayoutIndex:forUniquelyStylableType:animated:", v44, 1, v38 == 0);

    }
  }
  if (!p_updateFlags->isPerformingUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionedLayout update]");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "handleFailureInFunction:file:lineNumber:description:", v59, CFSTR("PXCuratedLibrarySectionedLayout.m"), 251, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_updateFlags.isPerformingUpdate"));

  }
  v46 = p_updateFlags->needsUpdate;
  p_updateFlags->updated |= 0x40uLL;
  if ((v46 & 0x40) != 0)
  {
    p_updateFlags->needsUpdate = v46 & 0xFFFFFFFFFFFFFFBFLL;
    -[PXCuratedLibrarySectionedLayout _updatePreheating](self, "_updatePreheating");
  }
  self->_presentedZoomLevel = self->_currentZoomLevel;
  objc_storeStrong((id *)&self->_presentedDataSource, self->_currentDataSource);
  p_updateFlags->isPerformingUpdate = 0;
  if (p_updateFlags->needsUpdate)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionedLayout update]");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "handleFailureInFunction:file:lineNumber:description:", v61, CFSTR("PXCuratedLibrarySectionedLayout.m"), 257, CFSTR("still needing to update %lu after update pass"), p_updateFlags->needsUpdate);

  }
LABEL_81:
  isUpdatingSublayouts = self->_isUpdatingSublayouts;
  self->_isUpdatingSublayouts = 1;
  v64.receiver = self;
  v64.super_class = (Class)PXCuratedLibrarySectionedLayout;
  -[PXGCompositeLayout update](&v64, sel_update);
  self->_isUpdatingSublayouts = isUpdatingSublayouts;
  -[PXCuratedLibrarySectionedLayout setPerformedInitialLoad:](self, "setPerformedInitialLoad:", 1);
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
  v7[2] = __78__PXCuratedLibrarySectionedLayout_enumerateAssetsSectionSublayoutsUsingBlock___block_invoke;
  v7[3] = &unk_1E513B968;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateSublayoutsUsingBlock:", v7);

}

- (void)setPerformedInitialLoad:(BOOL)a3
{
  void *v4;
  _QWORD v5[5];

  if (self->_performedInitialLoad != a3)
  {
    self->_performedInitialLoad = a3;
    if (a3)
    {
      +[PXPreloadScheduler sharedScheduler](PXPreloadScheduler, "sharedScheduler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __59__PXCuratedLibrarySectionedLayout_setPerformedInitialLoad___block_invoke;
      v5[3] = &unk_1E5149198;
      v5[4] = self;
      objc_msgSend(v4, "scheduleMainQueueTask:", v5);

    }
  }
}

- (double)lateralMargin
{
  return self->_lateralMargin;
}

- (void)_updatePreheating
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  PXAssetsDataSource *v9;
  PXAssetsDataSource *v10;
  uint64_t v11;
  NSUInteger v12;
  uint64_t v13;
  uint64_t v14;
  NSRange v15;
  NSUInteger length;
  NSUInteger location;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  void *v25;
  void *v26;
  int64x2_t v27;
  _QWORD v28[2];
  int64x2_t v29;
  _QWORD v30[5];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  NSRange v35;
  NSRange v36;

  +[PXZoomablePhotosSettings sharedInstance](PXZoomablePhotosSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "preheatThumbnailsWhenIdle"))
  {
    -[PXGLayout mediaProvider](self, "mediaProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXCuratedLibrarySectionedLayout viewModel](self, "viewModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "scrollRegime");

    if (v6)
    {
      v7 = 0;
      v8 = 0;
    }
    else
    {
      v31 = 0;
      v32 = &v31;
      v33 = 0x2020000000;
      v34 = 0x7FFFFFFFFFFFFFFFLL;
      -[PXGLayout visibleRect](self, "visibleRect");
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __52__PXCuratedLibrarySectionedLayout__updatePreheating__block_invoke;
      v30[3] = &unk_1E513B8F0;
      v30[4] = &v31;
      -[PXCuratedLibrarySectionedLayout enumerateAssetsSectionSublayoutsInRect:usingBlock:](self, "enumerateAssetsSectionSublayoutsInRect:usingBlock:", v30);
      v9 = self->_currentDataSource;
      v10 = v9;
      v11 = v32[3];
      if (v11 == 0x7FFFFFFFFFFFFFFFLL || v11 >= -[PXAssetsDataSource numberOfSections](v9, "numberOfSections"))
        goto LABEL_22;
      v12 = -[PXAssetsDataSource numberOfSections](v10, "numberOfSections");
      v13 = v32[3];
      if (v13 == 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSRange PXRangeWithMidLocationAndPadding(NSInteger, NSInteger)");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "handleFailureInFunction:file:lineNumber:description:", v26, CFSTR("NSRange+PhotosUIFoundation.h"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("midLocation != NSNotFound"));

      }
      v14 = 100;
      if (v13 > 100)
        v14 = v13;
      v35.location = v14 - 100;
      v35.length = v13 - v14 + 201;
      v36.location = 0;
      v36.length = v12;
      v15 = NSIntersectionRange(v35, v36);
      length = v15.length;
      if (!v15.length)
      {
LABEL_22:
        v7 = 0;
        v8 = 0;
      }
      else
      {
        location = v15.location;
        v18 = -[PXAssetsDataSource identifier](v10, "identifier");
        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v15.length);
        if (location >= location + v15.length)
        {
          v7 = 0;
        }
        else
        {
          v20 = 0;
          v7 = 0;
          v27 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
          do
          {
            v28[0] = v18;
            v28[1] = location;
            v29 = v27;
            -[PXAssetsDataSource assetsInSectionIndexPath:](v10, "assetsInSectionIndexPath:", v28);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v21, "count") >= 1)
            {
              objc_msgSend(v19, "addObject:", v21);
              if (location == v32[3])
              {
                v22 = objc_msgSend(v21, "count");
                if (v22 >= 0)
                  v23 = v22;
                else
                  v23 = v22 + 1;
                v7 = v20 + (v23 >> 1);
              }
              v20 += objc_msgSend(v21, "count");
            }

            ++location;
            --length;
          }
          while (length);
        }
        PXDisplayAssetFetchResultFromFetchResults();
        v8 = (void *)objc_claimAutoreleasedReturnValue();

      }
      _Block_object_dispose(&v31, 8);
    }
    objc_msgSend(v4, "masterThumbnailSize");
    objc_msgSend(v4, "preheatThumbnailDataForAssets:origin:targetSize:", v8, v7, v24 + 1.0);

  }
}

void __88__PXCuratedLibrarySectionedLayout_didFaultInSublayout_atIndex_fromEstimatedContentSize___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "visibleAssetCollections");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", *(_QWORD *)(a1 + 32));

}

- (void)_updateFaultOutsets
{
  id v3;

  +[PXCuratedLibrarySettings sharedInstance](PXCuratedLibrarySettings, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "faultInDistance");
  objc_msgSend(v3, "faultOutPadding");
  if (!-[PXCuratedLibrarySectionedLayout isInitialLoad](self, "isInitialLoad"))
    objc_msgSend(v3, "faultInDistance", 0.0);
  PXEdgeInsetsMake();
  -[PXGCompositeLayout setFaultInOutsets:](self, "setFaultInOutsets:");
  PXEdgeInsetsMake();
  -[PXGCompositeLayout setFaultOutOutsets:](self, "setFaultOutOutsets:");

}

- (BOOL)isInitialLoad
{
  return self->_isInitialLoad;
}

- (id)layout:(id)a3 createSublayoutAtIndex:(int64_t)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  PXAssetsSectionLayout *v10;
  PXAssetsDataSource *currentDataSource;
  void *v12;
  void *v13;
  int64_t currentZoomLevel;
  void *v15;
  void *v16;
  PXAssetsSectionLayout *v17;
  _QWORD v19[5];

  -[PXCuratedLibrarySectionedLayout viewModel](self, "viewModel", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "numberOfItemsInSection:", a4);

  if (!v8)
  {
    objc_msgSend(v6, "assetsDataSourceManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __65__PXCuratedLibrarySectionedLayout_layout_createSublayoutAtIndex___block_invoke;
    v19[3] = &__block_descriptor_40_e58_v16__0___PXCuratedLibraryMutableAssetsDataSourceManager__8l;
    v19[4] = a4;
    objc_msgSend(v9, "performChanges:", v19);

  }
  v10 = [PXAssetsSectionLayout alloc];
  currentDataSource = self->_currentDataSource;
  objc_msgSend(v6, "actionManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "videoPlaybackController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  currentZoomLevel = self->_currentZoomLevel;
  -[PXCuratedLibrarySectionedLayout spec](self, "spec");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sectionLayoutSpec");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[PXAssetsSectionLayout initWithSection:dataSource:actionManager:loadingStatusManager:assetImportStatusManager:inlinePlaybackController:zoomLevel:spec:](v10, "initWithSection:dataSource:actionManager:loadingStatusManager:assetImportStatusManager:inlinePlaybackController:zoomLevel:spec:", a4, currentDataSource, v12, 0, 0, v13, currentZoomLevel, v16);

  -[PXCuratedLibrarySectionedLayout _configureSectionLayout:atIndex:](self, "_configureSectionLayout:atIndex:", v17, a4);
  return v17;
}

void __62__PXCuratedLibrarySectionedLayout__updateSublayoutsDataSource__block_invoke_5(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  id v6;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = a3;
  objc_msgSend(v6, "setDataSource:section:", v5, a2);
  objc_msgSend(*(id *)(a1 + 40), "_configureSectionLayout:atIndex:", v6, a2);

}

void __63__PXCuratedLibrarySectionedLayout__updateSublayoutsForSkimming__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  uint64_t v16;
  _QWORD v17[5];
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;

  v5 = a3;
  v6 = v5;
  if (*(_QWORD *)(a1 + 56) == a2)
  {
    v24 = 0u;
    v25 = 0u;
    v7 = *(void **)(a1 + 32);
    if (v7)
      objc_msgSend(v7, "currentChildCollectionIndexPath");
    objc_msgSend(v6, "setIsSkimming:", 1);
    objc_msgSend(*(id *)(a1 + 32), "childCollectionsIndexes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setSkimmingIndexPaths:", v8);

    objc_msgSend(v6, "setShowsSkimmingSlideshow:", objc_msgSend(*(id *)(a1 + 32), "slideshowStarted"));
    objc_msgSend(v6, "setShowsSkimmingInteraction:", objc_msgSend(*(id *)(a1 + 32), "touchInteractionStarted"));
    objc_msgSend(*(id *)(a1 + 32), "childCollectionsIndexes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v10 <= 1)
      v11 = 1;
    else
      v11 = v10;
    objc_msgSend(v6, "setMaxSkimmingIndex:", v11 - 1);
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 0;
    objc_msgSend(*(id *)(a1 + 32), "childCollectionsIndexes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __63__PXCuratedLibrarySectionedLayout__updateSublayoutsForSkimming__block_invoke_2;
    v17[3] = &unk_1E513B498;
    v18 = v24;
    v19 = v25;
    v17[4] = &v20;
    objc_msgSend(v12, "enumerateSectionIndexPathsUsingBlock:", v17);

    objc_msgSend(v6, "setCurrentSkimmingIndex:", v21[3]);
    objc_msgSend(*(id *)(a1 + 40), "assetsDataSourceManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dataSourceForZoomLevel:", objc_msgSend(*(id *)(a1 + 32), "childCollectionsZoomLevel"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (*((_QWORD *)&v24 + 1) == *((_QWORD *)off_1E50B8778 + 1))
    {
      v15 = 0;
    }
    else
    {
      v16 = v24;
      v15 = v16 == objc_msgSend(v14, "identifier");
    }
    if ((objc_msgSend(*(id *)(a1 + 32), "slideshowStarted") & 1) != 0)
    {
      if (!v15)
        goto LABEL_16;
    }
    else if ((objc_msgSend(*(id *)(a1 + 32), "touchInteractionStarted") & v15 & 1) == 0)
    {
LABEL_16:

      _Block_object_dispose(&v20, 8);
      goto LABEL_17;
    }
    objc_msgSend(v6, "setDataSource:section:", v14, *((_QWORD *)&v24 + 1));
    goto LABEL_16;
  }
  objc_msgSend(v5, "setDataSource:section:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 1016), a2);
  objc_msgSend(v6, "setIsSkimming:", 0);
  objc_msgSend(v6, "setShowsSkimmingSlideshow:", 0);
  objc_msgSend(v6, "setShowsSkimmingInteraction:", 0);
  objc_msgSend(v6, "setMaxSkimmingIndex:", 0);
  objc_msgSend(v6, "setCurrentSkimmingIndex:", 0x7FFFFFFFFFFFFFFFLL);
LABEL_17:

}

- (PXCuratedLibrarySectionedLayout)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibrarySectionedLayout.m"), 113, CFSTR("%s is not available as initializer"), "-[PXCuratedLibrarySectionedLayout init]");

  abort();
}

- (void)dealloc
{
  objc_super v3;

  free(self->_accumulatedSectionItems);
  v3.receiver = self;
  v3.super_class = (Class)PXCuratedLibrarySectionedLayout;
  -[PXGCompositeLayout dealloc](&v3, sel_dealloc);
}

- (void)setIsInitialLoad:(BOOL)a3
{
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v6;
  void *v7;

  if (self->_isInitialLoad != a3)
  {
    self->_isInitialLoad = a3;
    p_updateFlags = &self->_updateFlags;
    needsUpdate = self->_updateFlags.needsUpdate;
    if (needsUpdate)
    {
      if (!self->_updateFlags.isPerformingUpdate)
      {
LABEL_7:
        p_updateFlags->needsUpdate = needsUpdate | 0x20;
        return;
      }
LABEL_6:
      if ((self->_updateFlags.updated & 0x20) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionedLayout setIsInitialLoad:]");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXCuratedLibrarySectionedLayout.m"), 288, CFSTR("invalidating %lu after it already has been updated"), 32);

        abort();
      }
      goto LABEL_7;
    }
    if (self->_updateFlags.isPerformingUpdate)
      goto LABEL_6;
    willPerformUpdate = self->_updateFlags.willPerformUpdate;
    p_updateFlags->needsUpdate = 32;
    if (!willPerformUpdate)
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
  }
}

- (void)willFaultOutSublayout:(id)a3 atIndex:(int64_t)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  objc_class *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  objc_super v19;

  v7 = a3;
  v19.receiver = self;
  v19.super_class = (Class)PXCuratedLibrarySectionedLayout;
  -[PXGLayout willFaultOutSublayout:atIndex:](&v19, sel_willFaultOutSublayout_atIndex_, v7, a4);
  v8 = v7;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibrarySectionedLayout.m"), 339, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("sublayout"), v14);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "px_descriptionForAssertionMessage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibrarySectionedLayout.m"), 339, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("sublayout"), v14, v16);

    goto LABEL_6;
  }
LABEL_3:
  objc_msgSend(v8, "assetCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCuratedLibrarySectionedLayout viewModel](self, "viewModel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __65__PXCuratedLibrarySectionedLayout_willFaultOutSublayout_atIndex___block_invoke;
  v17[3] = &unk_1E5143468;
  v18 = v9;
  v11 = v9;
  objc_msgSend(v10, "performChanges:", v17);

}

- (int64_t)sublayoutIndexForObjectReference:(id)a3 options:(unint64_t)a4 updatedObjectReference:(id *)a5
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  int64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  _QWORD v23[4];
  id v24;
  uint64_t *v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint8_t buf[16];
  __int128 v32;
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[PXCuratedLibrarySectionedLayout presentedDataSource](self, "presentedDataSource");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((a4 & 2) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      -[PXCuratedLibrarySectionedLayout viewModel](self, "viewModel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXCuratedLibrarySectionedLayout _targetAssetCollectionReferenceInZoomLevel:forTransitionFromAssetCollectionReference:](self, "_targetAssetCollectionReferenceInZoomLevel:forTransitionFromAssetCollectionReference:", objc_msgSend(v11, "zoomLevel"), v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if ((a4 & 1) != 0)
        objc_msgSend(v10, "objectReferenceNearestToObjectReference:", v9);
      else
        objc_msgSend(v10, "objectReferenceForObjectReference:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    *(_OWORD *)buf = 0u;
    v32 = 0u;
    if (v12)
    {
      objc_msgSend(v12, "indexPath");
      v17 = *(_QWORD *)buf;
    }
    else
    {
      v17 = 0;
    }
    if (v17 == *(_QWORD *)off_1E50B7E98)
    {
      v14 = 0x7FFFFFFFFFFFFFFFLL;
      v15 = v9;
    }
    else
    {
      v14 = *(_QWORD *)&buf[8];
      if (*(_QWORD *)&buf[8] == 0x7FFFFFFFFFFFFFFFLL || (_QWORD)v32 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v15 = v12;
      }
      else
      {
        -[PXGLayout sublayoutAtIndex:loadIfNeeded:](self, "sublayoutAtIndex:loadIfNeeded:", *(_QWORD *)&buf[8], 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "assetCollectionReference");
        v15 = (id)objc_claimAutoreleasedReturnValue();

        v9 = v18;
      }

    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = 0;
      v28 = &v27;
      v29 = 0x2020000000;
      v30 = 0x7FFFFFFFFFFFFFFFLL;
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&v32 = 0x3032000000;
      *((_QWORD *)&v32 + 1) = __Block_byref_object_copy__236565;
      v33 = __Block_byref_object_dispose__236566;
      v34 = 0;
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __99__PXCuratedLibrarySectionedLayout_sublayoutIndexForObjectReference_options_updatedObjectReference___block_invoke;
      v23[3] = &unk_1E513B4E8;
      v13 = v9;
      v24 = v13;
      v25 = &v27;
      v26 = buf;
      -[PXCuratedLibrarySectionedLayout enumerateAssetsSectionSublayoutsUsingBlock:](self, "enumerateAssetsSectionSublayoutsUsingBlock:", v23);
      v14 = v28[3];
      v15 = *(id *)(*(_QWORD *)&buf[8] + 40);

      _Block_object_dispose(buf, 8);
      _Block_object_dispose(&v27, 8);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        PXAssertGetLog();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v9;
          _os_log_error_impl(&dword_1A6789000, v19, OS_LOG_TYPE_ERROR, "unknown objectReference class %@", buf, 0xCu);
        }

        goto LABEL_29;
      }
      objc_msgSend(v9, "decoratedSpriteReference");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[PXGLayout sublayoutIndexForSpriteReference:options:](self, "sublayoutIndexForSpriteReference:options:", v16, a4);

      v15 = v9;
    }
  }
  if (v14 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = v15;
LABEL_29:
    PLUIGetLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v9;
      _os_log_impl(&dword_1A6789000, v20, OS_LOG_TYPE_DEBUG, "library layout couldn't find a match for %@", buf, 0xCu);
    }
    v14 = 0x7FFFFFFFFFFFFFFFLL;
    v15 = v9;
    goto LABEL_32;
  }
  if (v14 < -[PXGLayout numberOfSublayouts](self, "numberOfSublayouts"))
    goto LABEL_34;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = objc_claimAutoreleasedReturnValue();
  -[NSObject handleFailureInMethod:object:file:lineNumber:description:](v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibrarySectionedLayout.m"), 600, CFSTR("sublayoutIndex %li out of bounds (0..%li) for object reference %@"), v14, -[PXGLayout numberOfSublayouts](self, "numberOfSublayouts") - 1, v15);
LABEL_32:

LABEL_34:
  v21 = objc_retainAutorelease(v15);
  *a5 = v21;

  return v14;
}

- (BOOL)allowsDanglingUpdatesAssertions
{
  return 0;
}

- (void)setSpec:(id)a3
{
  PXCuratedLibraryLayoutSpec *v5;
  $F40CD077B40800501ED060B808F886F7 *p_updateFlags;
  unint64_t needsUpdate;
  _BOOL4 willPerformUpdate;
  void *v9;
  void *v10;
  PXCuratedLibraryLayoutSpec *v11;

  v5 = (PXCuratedLibraryLayoutSpec *)a3;
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
LABEL_8:
        p_updateFlags->needsUpdate = needsUpdate | 5;
LABEL_9:
        v5 = v11;
        goto LABEL_2;
      }
    }
    else if (!self->_updateFlags.isPerformingUpdate)
    {
      willPerformUpdate = self->_updateFlags.willPerformUpdate;
      p_updateFlags->needsUpdate = 5;
      v5 = v11;
      if (willPerformUpdate)
        goto LABEL_2;
      -[PXGLayout setNeedsUpdate](self, "setNeedsUpdate");
      goto LABEL_9;
    }
    if ((self->_updateFlags.updated & 5) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PXCuratedLibrarySectionedLayout setSpec:]");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("PXCuratedLibrarySectionedLayout.m"), 641, CFSTR("invalidating %lu after it already has been updated"), 5);

      abort();
    }
    goto LABEL_8;
  }
LABEL_2:

}

- (void)setPrefersDominantHero:(BOOL)a3 forZoomLevel:(int64_t)a4
{
  NSMutableIndexSet *zoomLevelsPreferringDominantHeros;
  NSMutableIndexSet *v7;
  NSMutableIndexSet *v8;

  zoomLevelsPreferringDominantHeros = self->_zoomLevelsPreferringDominantHeros;
  if (a3)
  {
    if (!zoomLevelsPreferringDominantHeros)
    {
      v7 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E0CB3788]);
      v8 = self->_zoomLevelsPreferringDominantHeros;
      self->_zoomLevelsPreferringDominantHeros = v7;

      zoomLevelsPreferringDominantHeros = self->_zoomLevelsPreferringDominantHeros;
    }
    -[NSMutableIndexSet addIndex:](zoomLevelsPreferringDominantHeros, "addIndex:", a4);
  }
  else
  {
    -[NSMutableIndexSet removeIndex:](zoomLevelsPreferringDominantHeros, "removeIndex:", a4);
  }
}

- (id)dominantHeroPreferences
{
  return (id)-[NSMutableIndexSet copy](self->_zoomLevelsPreferringDominantHeros, "copy");
}

- (void)setDominantHeroPreferences:(id)a3
{
  NSMutableIndexSet *v4;
  NSMutableIndexSet *zoomLevelsPreferringDominantHeros;

  v4 = (NSMutableIndexSet *)objc_msgSend(a3, "mutableCopy");
  zoomLevelsPreferringDominantHeros = self->_zoomLevelsPreferringDominantHeros;
  self->_zoomLevelsPreferringDominantHeros = v4;

}

- (id)assetCollectionsIteratorForContentInRect:(CGRect)a3
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
  v16[2] = __76__PXCuratedLibrarySectionedLayout_assetCollectionsIteratorForContentInRect___block_invoke;
  v16[3] = &unk_1E513B800;
  v16[4] = self;
  v18 = x;
  v19 = y;
  v20 = width;
  v21 = height;
  v10 = v8;
  v17 = v10;
  -[PXCuratedLibrarySectionedLayout enumerateAssetsSectionSublayoutsInRect:usingBlock:](self, "enumerateAssetsSectionSublayoutsInRect:usingBlock:", v16, x, y, width, height);
  if (objc_msgSend(v10, "count"))
  {
    aBlock[0] = v9;
    aBlock[1] = 3221225472;
    aBlock[2] = __76__PXCuratedLibrarySectionedLayout_assetCollectionsIteratorForContentInRect___block_invoke_2;
    aBlock[3] = &unk_1E513B878;
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
  v16[2] = __66__PXCuratedLibrarySectionedLayout_assetsIteratorForContentInRect___block_invoke;
  v16[3] = &unk_1E513B800;
  v16[4] = self;
  v18 = x;
  v19 = y;
  v20 = width;
  v21 = height;
  v10 = v8;
  v17 = v10;
  -[PXCuratedLibrarySectionedLayout enumerateAssetsSectionSublayoutsInRect:usingBlock:](self, "enumerateAssetsSectionSublayoutsInRect:usingBlock:", v16, x, y, width, height);
  if (objc_msgSend(v10, "count"))
  {
    aBlock[0] = v9;
    aBlock[1] = 3221225472;
    aBlock[2] = __66__PXCuratedLibrarySectionedLayout_assetsIteratorForContentInRect___block_invoke_2;
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

- (id)layout:(id)a3 navigationObjectReferenceForSublayoutAtIndex:(int64_t)a4
{
  return 0;
}

- (BOOL)layout:(id)a3 shouldPreventFaultOutOfSublayout:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSIndexSet *v11;
  NSIndexSet *cachedSectionsWithSelectedItems;
  void *v13;
  uint64_t v14;
  int64_t dataSourceIdentifierOfCachedSectionsWithSelectedItems;
  uint64_t v16;
  NSIndexSet *v17;
  char v18;

  v5 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v18 = 0;
    goto LABEL_10;
  }
  v6 = v5;
  if (self->_dataSourceIdentifierOfCachedSectionsWithSelectedItems == *(_QWORD *)off_1E50B7E98)
  {
    -[PXCuratedLibrarySectionedLayout viewModel](self, "viewModel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "selectionSnapshot");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    self->_dataSourceIdentifierOfCachedSectionsWithSelectedItems = objc_msgSend(v9, "identifier");

    objc_msgSend(v8, "selectedIndexPaths");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sectionsWithItemsForDataSourceIdentifier:", self->_dataSourceIdentifierOfCachedSectionsWithSelectedItems);
    v11 = (NSIndexSet *)objc_claimAutoreleasedReturnValue();
    cachedSectionsWithSelectedItems = self->_cachedSectionsWithSelectedItems;
    self->_cachedSectionsWithSelectedItems = v11;

  }
  objc_msgSend(v6, "dataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "identifier");
  dataSourceIdentifierOfCachedSectionsWithSelectedItems = self->_dataSourceIdentifierOfCachedSectionsWithSelectedItems;

  if (v14 != dataSourceIdentifierOfCachedSectionsWithSelectedItems)
    goto LABEL_12;
  v16 = objc_msgSend(v6, "section");
  v17 = self->_cachedSectionsWithSelectedItems;
  if (!-[NSIndexSet containsIndex:](v17, "containsIndex:", v16)
    && !-[NSIndexSet containsIndex:](v17, "containsIndex:", v16 - 1)
    && !-[NSIndexSet containsIndex:](v17, "containsIndex:", v16 + 1))
  {

LABEL_12:
    v18 = objc_msgSend(v6, "hasPointReferences");
    goto LABEL_9;
  }

  v18 = 1;
LABEL_9:

LABEL_10:
  return v18;
}

- (void)layout:(id)a3 collectIndexesOfChapterHeaderSublayouts:(id)a4 heroSublayouts:(id)a5 inRange:(_NSRange)a6
{
  NSUInteger length;
  int64_t location;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  int *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  PXCuratedLibrarySectionedLayout *v23;
  int *v24;
  unint64_t v25;
  id v26;
  id v27;
  id v28;
  id v29;
  int64x2_t v30;
  void *v31;
  _QWORD v32[2];
  int64x2_t v33;

  length = a6.length;
  location = a6.location;
  v11 = a3;
  v29 = a4;
  v28 = a5;
  -[PXCuratedLibrarySectionedLayout viewModel](self, "viewModel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "currentDataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "identifier");
  if (location < (uint64_t)(location + length))
  {
    v15 = v14;
    v27 = v11;
    v31 = 0;
    v30 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    v16 = 0x1E0CD1000uLL;
    v17 = &OBJC_IVAR___PXPeopleCandidateBannerView__contactAvatarView;
    do
    {
      v32[0] = v15;
      v32[1] = location;
      v33 = v30;
      objc_msgSend(v13, "assetCollectionAtSectionIndexPath:", v32);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v19 = v18;
      else
        v19 = 0;
      objc_msgSend(v19, "keyAssetObjectIDForKind");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (PXCuratedLibraryAssetsCollectionRepresentsChapterHeader(v18, *(uint64_t *)((char *)&self->super.super.super.isa + v17[758])))
      {
        objc_msgSend(v29, "addIndex:", location);
        v21 = v15;
        v22 = v13;
        v23 = self;
        v24 = v17;
        v25 = v16;
        v26 = v20;

        v31 = v26;
        v16 = v25;
        v17 = v24;
        self = v23;
        v13 = v22;
        v15 = v21;
      }
      else if (objc_msgSend(v20, "isEqual:", v31))
      {
        objc_msgSend(v28, "addIndex:", location);
      }

      ++location;
      --length;
    }
    while (length);

    v11 = v27;
  }

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
  v10[2] = __84__PXCuratedLibrarySectionedLayout_enumerateSectionBoundariesWithOptions_usingBlock___block_invoke;
  v10[3] = &unk_1E513B9B8;
  v11 = v6;
  v8 = v6;
  objc_msgSend(v9, "enumerateSublayoutGeometriesInRange:options:usingBlock:", 0, v7, a3, v10);

}

- (void)enumerateScrollablePagesWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  id v7;
  void *v8;
  int64_t v9;
  void *v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void (**v18)(_QWORD);
  void *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_class *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD *v32;
  _QWORD *v33;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD aBlock[4];
  id v39;
  _QWORD *v40;
  _QWORD *v41;
  _QWORD *v42;
  _QWORD v43[3];
  char v44;
  _QWORD v45[3];
  char v46;
  _QWORD v47[4];
  _QWORD v48[4];
  __int128 v49;
  __int128 v50;

  v7 = a4;
  -[PXCuratedLibrarySectionedLayout spec](self, "spec");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PXCuratedLibrarySectionedLayout presentedZoomLevel](self, "presentedZoomLevel");
  switch(v9)
  {
    case 3:
      goto LABEL_16;
    case 2:
      -[PXGCompositeLayout composition](self, "composition");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (objc_class *)objc_opt_class();
          NSStringFromClass(v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "px_descriptionForAssertionMessage");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibrarySectionedLayout.m"), 965, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("self.composition"), v25, v26);

        }
      }
      if (!objc_msgSend(v8, "allowsPaginatedScrollingInYearsAndMonths"))
        goto LABEL_18;
      if ((objc_msgSend(v10, "presentedSingleColumn") & 1) == 0)
      {
        v48[0] = 0;
        v48[1] = v48;
        v48[2] = 0x4010000000;
        v48[3] = &unk_1A7E74EE7;
        v12 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
        v49 = *MEMORY[0x1E0C9D628];
        v50 = v12;
        v47[0] = 0;
        v47[1] = v47;
        v47[2] = 0x2020000000;
        v47[3] = 0x7FFFFFFFFFFFFFFFLL;
        v45[0] = 0;
        v45[1] = v45;
        v45[2] = 0x2020000000;
        v46 = 1;
        v43[0] = 0;
        v43[1] = v43;
        v43[2] = 0x2020000000;
        v44 = 0;
        v13 = MEMORY[0x1E0C809B0];
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __82__PXCuratedLibrarySectionedLayout_enumerateScrollablePagesWithOptions_usingBlock___block_invoke;
        aBlock[3] = &unk_1E513B560;
        v40 = v48;
        v41 = v43;
        v39 = v7;
        v42 = v45;
        v14 = _Block_copy(aBlock);
        -[PXCuratedLibrarySectionedLayout presentedDataSource](self, "presentedDataSource");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "identifier");
        v29[0] = v13;
        v29[1] = 3221225472;
        v29[2] = __82__PXCuratedLibrarySectionedLayout_enumerateScrollablePagesWithOptions_usingBlock___block_invoke_2;
        v29[3] = &unk_1E513B588;
        v17 = v15;
        v36 = v16;
        v37 = 2;
        v30 = v17;
        v32 = v48;
        v33 = v47;
        v34 = v45;
        v18 = v14;
        v31 = v18;
        v35 = v43;
        -[PXCuratedLibrarySectionedLayout enumerateSectionBoundariesWithOptions:usingBlock:](self, "enumerateSectionBoundariesWithOptions:usingBlock:", a3, v29);
        v18[2](v18);

        _Block_object_dispose(v43, 8);
        _Block_object_dispose(v45, 8);
        _Block_object_dispose(v47, 8);
        _Block_object_dispose(v48, 8);
        goto LABEL_18;
      }

LABEL_16:
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __82__PXCuratedLibrarySectionedLayout_enumerateScrollablePagesWithOptions_usingBlock___block_invoke_3;
      v27[3] = &unk_1E513B5B0;
      v28 = v7;
      -[PXCuratedLibrarySectionedLayout enumerateSectionBoundariesWithOptions:usingBlock:](self, "enumerateSectionBoundariesWithOptions:usingBlock:", a3, v27);

      break;
    case 1:
      -[PXGCompositeLayout composition](self, "composition");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = (objc_class *)objc_opt_class();
          NSStringFromClass(v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "px_descriptionForAssertionMessage");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibrarySectionedLayout.m"), 955, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("self.composition"), v21, v22);

        }
      }
      if ((objc_msgSend(v8, "allowsPaginatedScrollingInYearsAndMonths") & 1) != 0)
      {
        v11 = objc_msgSend(v10, "presentedNumberOfColumns");

        if (v11 != 1)
          break;
        goto LABEL_16;
      }
LABEL_18:

      break;
  }

}

- (void)enumerateHeroSpritesInRect:(CGRect)a3 usingBlock:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __73__PXCuratedLibrarySectionedLayout_enumerateHeroSpritesInRect_usingBlock___block_invoke;
  v11[3] = &unk_1E513B600;
  v13 = x;
  v14 = y;
  v15 = width;
  v16 = height;
  v11[4] = self;
  v12 = v9;
  v10 = v9;
  -[PXCuratedLibrarySectionedLayout enumerateAssetsSectionSublayoutsInRect:usingBlock:](self, "enumerateAssetsSectionSublayoutsInRect:usingBlock:", v11, x, y, width, height);

}

- (CGRect)sectionBoundariesForAssetCollectionReference:(id)a3
{
  int64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  int64_t v9;
  id v10;
  double *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  CGRect result;

  v16 = 0;
  v4 = -[PXCuratedLibrarySectionedLayout sublayoutIndexForObjectReference:options:updatedObjectReference:](self, "sublayoutIndexForObjectReference:options:updatedObjectReference:", a3, 0, &v16);
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = *MEMORY[0x1E0C9D628];
    v6 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v7 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v8 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }
  else
  {
    v9 = v4;
    -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = (double *)(objc_msgSend(v10, "geometries") + 136 * v9);
    v7 = v11[4];
    v8 = v11[5];
    v5 = v11[6];
    v6 = v11[7];

  }
  v12 = v5;
  v13 = v6;
  v14 = v7;
  v15 = v8;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (id)_heroSectionLayoutClosestToSectionLayout:(id)a3 zoomLevel:(int64_t)a4
{
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (**v12)(void *, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v18;
  _QWORD aBlock[4];
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  int64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = v7;
  if (a4 == 2)
  {
    if (!v7)
    {
      v16 = 0;
      goto LABEL_14;
    }
    -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = -[NSObject indexOfSublayout:](v9, "indexOfSublayout:", v8);
    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v11 = v10;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __86__PXCuratedLibrarySectionedLayout__heroSectionLayoutClosestToSectionLayout_zoomLevel___block_invoke;
      aBlock[3] = &unk_1E513B678;
      v9 = v9;
      v20 = v9;
      v21 = v11;
      v22 = 2;
      v12 = (uint64_t (**)(void *, uint64_t))_Block_copy(aBlock);
      v13 = v12[2](v12, -1);
      v14 = v12[2](v12, 1);
      if (v13 > v14)
      {
LABEL_8:
        v16 = 0;
      }
      else
      {
        v15 = v14 + 1;
        while (1)
        {
          -[NSObject sublayoutAtIndex:](v9, "sublayoutAtIndex:", v13);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v16, "referenceOptions") & 4) != 0)
            break;

          if (v15 == ++v13)
            goto LABEL_8;
        }
      }

      goto LABEL_13;
    }
  }
  else
  {
    PXAssertGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v24 = v18;
      v25 = 2048;
      v26 = a4;
      _os_log_error_impl(&dword_1A6789000, v9, OS_LOG_TYPE_ERROR, "%@ shouldn't be called with zoomLevel=%li since it doesn't contain chapter headers and therefore no heros.", buf, 0x16u);

    }
  }
  v16 = 0;
LABEL_13:

LABEL_14:
  return v16;
}

- (id)_heroAssetCollectionReferenceClosestToAssetCollectionReference:(id)a3 zoomLevel:(int64_t)a4
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t (**v15)(void *, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  NSObject *v25;
  void *v27;
  int64x2_t v28;
  id v29;
  _QWORD v30[2];
  int64x2_t v31;
  _QWORD aBlock[4];
  id v33;
  _BYTE *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  _BYTE buf[24];
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v29 = a3;
  -[PXCuratedLibrarySectionedLayout viewModel](self, "viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assetsDataSourceManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataSourceForZoomLevel:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = 0u;
  v39 = 0u;
  if (v9)
    objc_msgSend(v9, "indexPathForAssetCollectionReference:", v29);
  if (a4 != 2)
  {
    PXAssertGetLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(a2);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v27;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = a4;
      _os_log_error_impl(&dword_1A6789000, v25, OS_LOG_TYPE_ERROR, "%@ shouldn't be called with zoomLevel=%li since it doesn't contain chapter headers and therefore no heros.", buf, 0x16u);

    }
    goto LABEL_25;
  }
  if ((_QWORD)v38 == *(_QWORD *)off_1E50B7E98
    || *((_QWORD *)&v38 + 1) == 0x7FFFFFFFFFFFFFFFLL
    || (_QWORD)v39 != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_25:
    v20 = 0;
    goto LABEL_26;
  }
  v12 = objc_msgSend(v9, "identifier");
  v13 = *((_QWORD *)&v38 + 1);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v41 = __Block_byref_object_copy__236565;
  v42 = __Block_byref_object_dispose__236566;
  v43 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __108__PXCuratedLibrarySectionedLayout__heroAssetCollectionReferenceClosestToAssetCollectionReference_zoomLevel___block_invoke;
  aBlock[3] = &unk_1E513B6A0;
  v14 = v9;
  v35 = v13;
  v36 = v12;
  v37 = 2;
  v33 = v14;
  v34 = buf;
  v15 = (uint64_t (**)(void *, uint64_t))_Block_copy(aBlock);
  v16 = v15[2](v15, -1);
  if (*(_QWORD *)(*(_QWORD *)&buf[8] + 40) && (v17 = v16, v18 = v15[2](v15, 1), v17 <= v18))
  {
    v19 = v18 + 1;
    v28 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    while (1)
    {
      v30[0] = v12;
      v30[1] = v17;
      v31 = v28;
      objc_msgSend(v14, "assetCollectionReferenceAtSectionIndexPath:", v30, *(_OWORD *)&v28);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "assetCollection");
      v21 = (id)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v22 = (objc_opt_isKindOfClass() & 1) != 0 ? v21 : 0;
      v23 = v22;
      objc_msgSend(v23, "keyAssetObjectIDForKind");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      LOBYTE(v23) = objc_msgSend(v24, "isEqual:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
      if ((v23 & 1) != 0)
        break;

      if (v19 == ++v17)
        goto LABEL_20;
    }
  }
  else
  {
LABEL_20:
    v20 = 0;
  }

  _Block_object_dispose(buf, 8);
LABEL_26:

  return v20;
}

- (id)viewModel:(id)a3 dominantAssetCollectionReferenceForZoomLevel:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v29;

  objc_msgSend(a3, "assetsDataSourceManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dataSourceForZoomLevel:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXCuratedLibrarySectionedLayout lastVisibleDominantObjectReference](self, "lastVisibleDominantObjectReference");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assetCollectionReferenceNearestToObjectReference:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    if (-[PXCuratedLibrarySectionedLayout prefersDominantHeroForZoomLevel:](self, "prefersDominantHeroForZoomLevel:", a4))
    {
      v29 = 0;
      v10 = -[PXCuratedLibrarySectionedLayout sublayoutIndexForObjectReference:options:updatedObjectReference:](self, "sublayoutIndexForObjectReference:options:updatedObjectReference:", v9, 0, &v29);
      if (v10 == 0x7FFFFFFFFFFFFFFFLL)
      {
        -[PXCuratedLibrarySectionedLayout _heroAssetCollectionReferenceClosestToAssetCollectionReference:zoomLevel:](self, "_heroAssetCollectionReferenceClosestToAssetCollectionReference:zoomLevel:", v9, a4);
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = (void *)v11;
        v13 = v11 ? (void *)v11 : v9;
        v14 = v13;
      }
      else
      {
        v21 = v10;
        -[PXGLayout sublayoutDataStore](self, "sublayoutDataStore");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "sublayoutAtIndex:", v21);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        -[PXCuratedLibrarySectionedLayout _heroSectionLayoutClosestToSectionLayout:zoomLevel:](self, "_heroSectionLayoutClosestToSectionLayout:zoomLevel:", v12, a4);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "assetCollectionReference");
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = (void *)v24;
        v26 = v24 ? (void *)v24 : v9;
        v14 = v26;

        v9 = v23;
      }

      v9 = v14;
      if (!v14)
        goto LABEL_22;
    }
    goto LABEL_18;
  }
  -[PXCuratedLibrarySectionedLayout dominantSectionLayout](self, "dominantSectionLayout");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "assetCollectionReference");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "presentedSkimming"))
  {
    -[PXCuratedLibrarySectionedLayout viewModel](self, "viewModel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "skimmingInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "childCollectionsZoomLevel");

    if (v18 == a4)
    {
      -[PXCuratedLibrarySectionedLayout presentedDataSource](self, "presentedDataSource");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "assetCollectionReferenceNearestToObjectReference:", v9);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      -[PXCuratedLibrarySectionedLayout _targetAssetCollectionReferenceInZoomLevel:forTransitionFromAssetCollectionReference:](self, "_targetAssetCollectionReferenceInZoomLevel:forTransitionFromAssetCollectionReference:", a4, v20);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  if (v9)
  {
LABEL_18:
    if (v7)
      objc_msgSend(v7, "indexPathForAssetCollectionReference:", v9);
    if (!*(_QWORD *)off_1E50B7E98)
    {
      -[PXCuratedLibrarySectionedLayout _targetAssetCollectionReferenceInZoomLevel:forTransitionFromAssetCollectionReference:](self, "_targetAssetCollectionReferenceInZoomLevel:forTransitionFromAssetCollectionReference:", a4, v9);
      v27 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v27;
    }
  }
LABEL_22:

  return v9;
}

- (id)_targetAssetCollectionReferenceInZoomLevel:(int64_t)a3 forTransitionFromAssetCollectionReference:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_class *v17;
  void *v18;
  void *v19;

  v7 = a4;
  v8 = v7;
  if (a3 == 3)
  {
    objc_msgSend(v7, "assetCollection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "px_highlightKind");

    if (v10 == 1)
    {
      -[PXCuratedLibrarySectionedLayout viewModel](self, "viewModel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "assetsDataSourceManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "firstAssetCollectionReferenceInDataSourceForZoomLevel:withParent:", 3, v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_4:

      goto LABEL_7;
    }
  }
  -[PXCuratedLibrarySectionedLayout viewModel](self, "viewModel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "assetsDataSourceManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "dataSourceForZoomLevel:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "objectReferenceNearestToObjectReference:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "px_descriptionForAssertionMessage");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibrarySectionedLayout.m"), 1282, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("[dataSource objectReferenceNearestToObjectReference:sourceCollectionReference]"), v18, v19);

      goto LABEL_4;
    }
  }
LABEL_7:

  return v13;
}

- (BOOL)performedInitialLoad
{
  return self->_performedInitialLoad;
}

- (UIEdgeInsets)padding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_padding.top;
  left = self->_padding.left;
  bottom = self->_padding.bottom;
  right = self->_padding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (PXAssetsDataSource)presentedDataSource
{
  return self->_presentedDataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentedDataSource, 0);
  objc_storeStrong((id *)&self->_lastHitSpriteReference, 0);
  objc_storeStrong(&self->_lastVisibleDominantObjectReference, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_spec, 0);
  objc_storeStrong((id *)&self->_cachedSectionsWithSelectedItems, 0);
  objc_storeStrong((id *)&self->_zoomLevelsPreferringDominantHeros, 0);
  objc_storeStrong((id *)&self->_currentDataSource, 0);
}

uint64_t __108__PXCuratedLibrarySectionedLayout__heroAssetCollectionReferenceClosestToAssetCollectionReference_zoomLevel___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  BOOL v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  int64x2_t v21;
  _QWORD v22[2];
  int64x2_t v23;

  v4 = objc_msgSend(*(id *)(a1 + 32), "numberOfSections");
  v5 = *(_QWORD *)(a1 + 48);
  if (v5 + a2 >= 0)
  {
    v6 = v4;
    if (v5 + a2 < v4)
    {
      v7 = 2 * a2;
      v21 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
      while (1)
      {
        v8 = *(void **)(a1 + 32);
        v22[0] = *(_QWORD *)(a1 + 56);
        v22[1] = a2 + v5;
        v23 = v21;
        objc_msgSend(v8, "assetCollectionReferenceAtSectionIndexPath:", v22, *(_OWORD *)&v21);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (!v9)
          break;
        objc_msgSend(v9, "assetCollection");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = PXCuratedLibraryAssetsCollectionRepresentsChapterHeader(v11, *(_QWORD *)(a1 + 64));

        if (v12)
        {
          if (a2 < 0)
          {
            objc_msgSend(v10, "assetCollection");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v16 = v15;
            else
              v16 = 0;
            objc_msgSend(v16, "keyAssetObjectIDForKind");
            v17 = objc_claimAutoreleasedReturnValue();
            v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
            v19 = *(void **)(v18 + 40);
            *(_QWORD *)(v18 + 40) = v17;

          }
          break;
        }

        v14 = v7 + v5;
        v13 = v7 + v5 < 0;
        v5 += a2;
        if (v13 || v14 >= v6)
          return v5;
      }

    }
  }
  return v5;
}

uint64_t __86__PXCuratedLibrarySectionedLayout__heroSectionLayoutClosestToSectionLayout_zoomLevel___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  uint64_t v12;

  v4 = objc_msgSend(*(id *)(a1 + 32), "count");
  v5 = *(_QWORD *)(a1 + 40);
  if (v5 + a2 >= 0)
  {
    v6 = v4;
    if (v5 + a2 < v4)
    {
      v7 = 2 * a2;
      while (1)
      {
        objc_msgSend(*(id *)(a1 + 32), "sublayoutAtIndex:", a2 + v5);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          break;
        objc_msgSend(v8, "assetCollection");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (!v9 || PXCuratedLibraryAssetsCollectionRepresentsChapterHeader(v9, *(_QWORD *)(a1 + 48)))
        {

          break;
        }

        v12 = v7 + v5;
        v11 = v7 + v5 < 0;
        v5 += a2;
        if (v11 || v12 >= v6)
          return v5;
      }

    }
  }
  return v5;
}

void __56__PXCuratedLibrarySectionedLayout_dominantSectionLayout__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  void *v17;
  void *v18;
  uint64_t v19;
  double v20;
  double v21;
  uint64_t v22;
  id v23;
  CGRect v24;

  v23 = a3;
  v5 = *MEMORY[0x1E0C9D538];
  v6 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  objc_msgSend(v23, "contentSize");
  objc_msgSend(*(id *)(a1 + 32), "convertRect:fromDescendantLayout:", v23, v5, v6, v7, v8);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  objc_msgSend(v23, "assetCollection");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    if (PXCuratedLibraryAssetsCollectionRepresentsChapterHeader(v17, *(_QWORD *)(a1 + 64)))
    {
      v19 = 1;
    }
    else if ((objc_msgSend(v23, "referenceOptions") & 4) != 0
           && (v24.origin.x = v10,
               v24.origin.y = v12,
               v24.size.width = v14,
               v24.size.height = v16,
               CGRectContainsRect(*(CGRect *)(a1 + 72), v24)))
    {
      v19 = 3;
    }
    else
    {
      v19 = 2;
    }
  }
  else
  {
    v19 = 0;
  }
  PXRectShortestDistanceToPoint();
  v21 = v20;
  v22 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v19 > v22 || v19 == v22 && v20 < *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a3);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v19;
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v21;
  }

}

void __73__PXCuratedLibrarySectionedLayout_enumerateHeroSpritesInRect_usingBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  uint64_t v15;
  id v16;
  _QWORD v17[5];
  id v18;
  id v19;
  uint64_t v20;

  objc_msgSend(a3, "bodyContentLayout");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "convertRect:toDescendantLayout:", v16, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __73__PXCuratedLibrarySectionedLayout_enumerateHeroSpritesInRect_usingBlock___block_invoke_2;
    v17[3] = &unk_1E513B5D8;
    v14 = *(id *)(a1 + 40);
    v15 = *(_QWORD *)(a1 + 32);
    v19 = v14;
    v17[4] = v15;
    v18 = v16;
    v20 = a4;
    objc_msgSend(v18, "enumerateHeroSpritesInRect:usingBlock:", v17, v7, v9, v11, v13);

  }
}

uint64_t __73__PXCuratedLibrarySectionedLayout_enumerateHeroSpritesInRect_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2, _BYTE *a3, double a4, double a5, double a6, double a7)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t result;

  v13 = *(_QWORD *)(a1 + 48);
  v14 = objc_msgSend(*(id *)(a1 + 32), "convertSpriteIndex:fromDescendantLayout:", a2, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "convertRect:fromDescendantLayout:", *(_QWORD *)(a1 + 40), a4, a5, a6, a7);
  result = (*(uint64_t (**)(uint64_t, uint64_t, _BYTE *))(v13 + 16))(v13, v14, a3);
  if (*a3)
    **(_BYTE **)(a1 + 56) = 1;
  return result;
}

__n128 __82__PXCuratedLibrarySectionedLayout_enumerateScrollablePagesWithOptions_usingBlock___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  __n128 result;
  __int128 v4;

  if (!CGRectIsNull(*(CGRect *)(*(_QWORD *)(a1[5] + 8) + 32)) && !*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
    (*(void (**)(double, double, double, double))(a1[4] + 16))(*(double *)(*(_QWORD *)(a1[5] + 8) + 32), *(double *)(*(_QWORD *)(a1[5] + 8) + 40), *(double *)(*(_QWORD *)(a1[5] + 8) + 48), *(double *)(*(_QWORD *)(a1[5] + 8) + 56));
  v2 = *(_QWORD *)(a1[5] + 8);
  result = *(__n128 *)MEMORY[0x1E0C9D628];
  v4 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
  *(_OWORD *)(v2 + 32) = *MEMORY[0x1E0C9D628];
  *(_OWORD *)(v2 + 48) = v4;
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
  return result;
}

void __82__PXCuratedLibrarySectionedLayout_enumerateScrollablePagesWithOptions_usingBlock___block_invoke_2(_QWORD *a1, uint64_t a2, char a3, _BYTE *a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  void *v16;
  void *v17;
  uint64_t v18;
  char v19;
  _QWORD v20[2];
  int64x2_t v21;
  CGRect v22;

  v16 = (void *)a1[4];
  v20[0] = a1[10];
  v20[1] = a2;
  v21 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  objc_msgSend(v16, "assetCollectionAtSectionIndexPath:", v20);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (PXCuratedLibraryAssetsCollectionRepresentsChapterHeader(v17, a1[11]))
  {
    (*(void (**)(void))(a1[5] + 16))();
    *a4 = *(_BYTE *)(*(_QWORD *)(a1[9] + 8) + 24);
  }
  else
  {
    v22.origin.x = a5;
    v22.origin.y = a6;
    v22.size.width = a7;
    v22.size.height = a8;
    *(CGRect *)(*(_QWORD *)(a1[6] + 8) + 32) = CGRectUnion(*(CGRect *)(*(_QWORD *)(a1[6] + 8) + 32), v22);
    *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = a2;
    v18 = *(_QWORD *)(a1[8] + 8);
    if (*(_BYTE *)(v18 + 24))
      v19 = a3;
    else
      v19 = 0;
    *(_BYTE *)(v18 + 24) = v19;
  }

}

uint64_t __82__PXCuratedLibrarySectionedLayout_enumerateScrollablePagesWithOptions_usingBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __84__PXCuratedLibrarySectionedLayout_enumerateSectionBoundariesWithOptions_usingBlock___block_invoke(uint64_t a1, __n128 a2, __n128 a3, __n128 a4, __n128 a5, uint64_t a6, _QWORD *a7)
{
  a2.n128_u64[0] = a7[6];
  a3.n128_u64[0] = a7[7];
  a4.n128_u64[0] = a7[4];
  a5.n128_u64[0] = a7[5];
  return (*(uint64_t (**)(__n128, __n128, __n128, __n128))(*(_QWORD *)(a1 + 32) + 16))(a2, a3, a4, a5);
}

void __65__PXCuratedLibrarySectionedLayout_layout_createSublayoutAtIndex___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  id v4;
  id v5;

  v2 = (void *)MEMORY[0x1E0CB36B8];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v2, "indexSetWithIndex:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "forceAccurateSectionsIfNeeded:", v5);

}

uint64_t __64__PXCuratedLibrarySectionedLayout_observable_didChange_context___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setTargetZoomLevel:", *(_QWORD *)(a1 + 32));
}

void __66__PXCuratedLibrarySectionedLayout_assetsIteratorForContentInRect___block_invoke(double *a1, uint64_t a2, void *a3)
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

void __66__PXCuratedLibrarySectionedLayout_assetsIteratorForContentInRect___block_invoke_2(uint64_t a1, void *a2)
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
  v6[2] = __66__PXCuratedLibrarySectionedLayout_assetsIteratorForContentInRect___block_invoke_3;
  v6[3] = &unk_1E513B8A0;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

}

uint64_t __66__PXCuratedLibrarySectionedLayout_assetsIteratorForContentInRect___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32));
}

void __76__PXCuratedLibrarySectionedLayout_assetCollectionsIteratorForContentInRect___block_invoke(double *a1, uint64_t a2, void *a3)
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
  objc_msgSend(v9, "assetCollectionsIteratorForContentInRect:");
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

void __76__PXCuratedLibrarySectionedLayout_assetCollectionsIteratorForContentInRect___block_invoke_2(uint64_t a1, void *a2)
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
  v6[2] = __76__PXCuratedLibrarySectionedLayout_assetCollectionsIteratorForContentInRect___block_invoke_3;
  v6[3] = &unk_1E513B510;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v6);

}

uint64_t __76__PXCuratedLibrarySectionedLayout_assetCollectionsIteratorForContentInRect___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a2 + 16))(a2, *(_QWORD *)(a1 + 32));
}

void __75__PXCuratedLibrarySectionedLayout_dateIntervalFutureForContentInRect_type___block_invoke(double *a1, uint64_t a2, void *a3)
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
  objc_msgSend(v9, "dateIntervalFutureForContentInRect:type:", 0);
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

void __99__PXCuratedLibrarySectionedLayout_sublayoutIndexForObjectReference_options_updatedObjectReference___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v15 = a3;
  objc_msgSend(v15, "showAllActionPerformer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = *(id *)(a1 + 32);
  if (v7 == v8)
  {

  }
  else
  {
    v9 = v8;
    v10 = objc_msgSend(v7, "isEqual:", v8);

    v11 = v15;
    if (!v10)
      goto LABEL_6;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  objc_msgSend(v15, "showAllActionPerformer");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

  v11 = v15;
  *a4 = 1;
LABEL_6:

}

uint64_t __52__PXCuratedLibrarySectionedLayout__updatePreheating__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  *a4 = 1;
  return result;
}

uint64_t __63__PXCuratedLibrarySectionedLayout__updateSublayoutsForSkimming__block_invoke_2(uint64_t result, uint64_t a2, _BYTE *a3)
{
  if (*(_QWORD *)(a2 + 8) == *(_QWORD *)(result + 48))
    *a3 = 1;
  else
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
  return result;
}

void __62__PXCuratedLibrarySectionedLayout__updateSublayoutsDataSource__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "sublayoutAtIndex:loadIfNeeded:", a2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("PXCuratedLibrarySectionedLayout.m"), 376, CFSTR("While updating sublayouts, got a change to section %lu that's already loaded."), a2);

  }
}

BOOL __62__PXCuratedLibrarySectionedLayout__updateSublayoutsDataSource__block_invoke_2(uint64_t a1, __int128 *a2, __int128 *a3)
{
  void *v5;
  __int128 v6;
  void *v7;
  void *v8;
  __int128 v9;
  id v10;
  id v11;
  void *v12;
  BOOL v13;
  _BOOL8 v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;

  v5 = *(void **)(a1 + 32);
  v6 = a2[1];
  v17 = *a2;
  v18 = v6;
  objc_msgSend(v5, "assetAtItemIndexPath:", &v17);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 40);
  v9 = a3[1];
  v17 = *a3;
  v18 = v9;
  objc_msgSend(v8, "assetAtItemIndexPath:", &v17);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = v7;
  v12 = v11;
  if (v10 == v11)
  {
    v14 = 0;
  }
  else
  {
    if (v11)
      v13 = v10 == 0;
    else
      v13 = 1;
    if (v13)
    {
      v14 = 1;
    }
    else
    {
      v15 = objc_msgSend(v10, "isContentEqualTo:", v11);
      if (!v15)
        v15 = objc_msgSend(v12, "isContentEqualTo:", v10);
      v14 = v15 != 2;
    }
  }

  return v14;
}

void __65__PXCuratedLibrarySectionedLayout_willFaultOutSublayout_atIndex___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "visibleAssetCollections");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObject:", *(_QWORD *)(a1 + 32));

}

uint64_t __59__PXCuratedLibrarySectionedLayout_setPerformedInitialLoad___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIsInitialLoad:", 0);
}

+ (void)setShouldDisableLaunchOptimizations:(BOOL)a3
{
  _shouldDisableLaunchOptimizations = a3;
}

@end
