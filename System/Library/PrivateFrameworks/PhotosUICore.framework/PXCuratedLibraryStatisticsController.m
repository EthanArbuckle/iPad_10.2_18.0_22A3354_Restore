@implementation PXCuratedLibraryStatisticsController

- (void)dealloc
{
  objc_super v3;

  free(self->_resuableLayoutGeometries);
  v3.receiver = self;
  v3.super_class = (Class)PXCuratedLibraryStatisticsController;
  -[PXCuratedLibraryStatisticsController dealloc](&v3, sel_dealloc);
}

- (void)collectStatisticsForViewModel:(id)a3 extendedTraitCollection:(id)a4 resultHandler:(id)a5
{
  void (**v9)(id, id, _QWORD);
  id v10;
  id v11;
  PXMutableCuratedLibraryStatistics *v12;
  id v13;
  id v14;
  id v15;
  PXMutableCuratedLibraryStatistics *v16;
  id v17;
  _QWORD v18[5];
  id v19;
  PXMutableCuratedLibraryStatistics *v20;
  id v21;
  SEL v22;

  v9 = (void (**)(id, id, _QWORD))a5;
  v10 = a4;
  v11 = a3;
  v12 = objc_alloc_init(PXMutableCuratedLibraryStatistics);
  v13 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v14 = -[PXCuratedLibraryVideoPlaybackController initViewViewModel:]([PXCuratedLibraryVideoPlaybackController alloc], "initViewViewModel:", v11);
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __108__PXCuratedLibraryStatisticsController_collectStatisticsForViewModel_extendedTraitCollection_resultHandler___block_invoke;
  v18[3] = &unk_1E511DB20;
  v21 = v14;
  v22 = a2;
  v18[4] = self;
  v19 = v13;
  v20 = v12;
  v15 = v14;
  v16 = v12;
  v17 = v13;
  -[PXCuratedLibraryStatisticsController _enumerateDaysSectionsForViewModel:extendedTraitCollection:usingBlock:](self, "_enumerateDaysSectionsForViewModel:extendedTraitCollection:usingBlock:", v11, v10, v18);

  v9[2](v9, v16, 0);
}

- (void)_enumerateDaysSectionsForViewModel:(id)a3 extendedTraitCollection:(id)a4 usingBlock:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, void *, void *, uint64_t, unsigned __int8 *);
  void *v10;
  void *v11;
  uint64_t v12;
  PXCuratedLibraryActionManager *v13;
  PXAssetsSectionLayout *v14;
  PXAssetsSectionLayoutSpec *v15;
  PXAssetsSectionLayout *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v25;
  objc_class *v26;
  void *v27;
  objc_class *v28;
  void *v29;
  PXCuratedLibraryActionManager *v32;
  void *v33;
  void *v34;
  unsigned __int8 v35;

  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, void *, void *, uint64_t, unsigned __int8 *))a5;
  objc_msgSend(v7, "assetsDataSourceManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "performChanges:", &__block_literal_global_16_50932);
  v33 = v10;
  objc_msgSend(v10, "dataSourceForZoomLevel:", 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "numberOfSections");
  v35 = 0;
  v34 = v7;
  v13 = -[PXCuratedLibraryActionManager initWithViewModel:]([PXCuratedLibraryActionManager alloc], "initWithViewModel:", v7);
  v14 = [PXAssetsSectionLayout alloc];
  v15 = -[PXFeatureSpec initWithExtendedTraitCollection:]([PXAssetsSectionLayoutSpec alloc], "initWithExtendedTraitCollection:", v8);
  v32 = v13;
  v16 = -[PXAssetsSectionLayout initWithSection:dataSource:actionManager:loadingStatusManager:assetImportStatusManager:inlinePlaybackController:zoomLevel:spec:](v14, "initWithSection:dataSource:actionManager:loadingStatusManager:assetImportStatusManager:inlinePlaybackController:zoomLevel:spec:", 0, v11, v13, 0, 0, 0, 3, v15);

  objc_msgSend(v8, "layoutReferenceSize");
  v17 = -[PXGLayout setReferenceSize:](v16, "setReferenceSize:");
  v18 = v12 - 1;
  if (v12 >= 1)
  {
    v19 = 0;
    while (1)
    {
      v20 = (void *)MEMORY[0x1A85CE17C](v17);
      -[PXAssetsSectionLayout setDataSource:section:](v16, "setDataSource:section:", v11, v19);
      -[PXGLayout updateAsRootIfNeeded](v16, "updateAsRootIfNeeded");
      -[PXAssetsSectionLayout bodyContentLayout](v16, "bodyContentLayout");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          goto LABEL_5;
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (objc_class *)objc_opt_class();
        NSStringFromClass(v28);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "px_descriptionForAssertionMessage");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryStatisticsController.m"), 81, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("sectionLayout.bodyContentLayout"), v27, v29);

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (objc_class *)objc_opt_class();
        NSStringFromClass(v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCuratedLibraryStatisticsController.m"), 81, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("sectionLayout.bodyContentLayout"), v27);
      }

LABEL_5:
      v22 = (void *)objc_msgSend(v21, "newGenerator");
      v9[2](v9, v22, v11, v19, &v35);
      v23 = v35;

      objc_autoreleasePoolPop(v20);
      if (!v23 && v18 != v19++)
        continue;
      break;
    }
  }

}

- (_PXLayoutGeometry)_layoutGeometryBufferWithCount:(int64_t)a3
{
  int64_t reusableLayoutGeometriesCapacity;

  reusableLayoutGeometriesCapacity = self->_reusableLayoutGeometriesCapacity;
  if (reusableLayoutGeometriesCapacity < a3)
  {
    if (reusableLayoutGeometriesCapacity)
    {
      do
        reusableLayoutGeometriesCapacity *= 2;
      while (reusableLayoutGeometriesCapacity < a3);
    }
    else
    {
      reusableLayoutGeometriesCapacity = a3;
    }
    self->_reusableLayoutGeometriesCapacity = reusableLayoutGeometriesCapacity;
    _PXGArrayResize();
  }
  return self->_resuableLayoutGeometries;
}

uint64_t __110__PXCuratedLibraryStatisticsController__enumerateDaysSectionsForViewModel_extendedTraitCollection_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "forceAccurateAllSectionsIfNeeded");
}

void __108__PXCuratedLibraryStatisticsController_collectStatisticsForViewModel_extendedTraitCollection_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  objc_class *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  objc_class *v21;
  void *v22;
  id v23;

  v7 = a2;
  v8 = a3;
  v9 = objc_msgSend(v7, "itemCount");
  v10 = objc_msgSend(*(id *)(a1 + 32), "_layoutGeometryBufferWithCount:", v9);
  objc_msgSend(v7, "getGeometries:inRange:withKind:", v10, 0, v9, 0);
  v23 = v7;
  if (v23)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *(_QWORD *)(a1 + 64);
    v20 = *(_QWORD *)(a1 + 32);
    v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "px_descriptionForAssertionMessage");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", v19, v20, CFSTR("PXCuratedLibraryStatisticsController.m"), 51, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("layoutGenerator"), v18, v22);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(a1 + 64);
    v16 = *(_QWORD *)(a1 + 32);
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", v15, v16, CFSTR("PXCuratedLibraryStatisticsController.m"), 51, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("layoutGenerator"), v18);
  }

LABEL_3:
  objc_msgSend(v23, "minHeroItemsSize");

  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36B8]), "initWithIndexesInRange:", 0, v9);
  objc_msgSend(*(id *)(a1 + 40), "removeAllIndexes");
  if (v9 >= 1)
  {
    v12 = 0;
    v13 = v10 + 32;
    do
    {
      if (PXSizeApproximatelyEqualOrBiggerThanSize())
        objc_msgSend(*(id *)(a1 + 40), "addIndex:", v12);
      ++v12;
      v13 += 152;
    }
    while (v9 != v12);
  }
  objc_msgSend(*(id *)(a1 + 48), "appendStatisticsForSection:assetsDataSource:playbackController:visibleItems:heroItems:keyItem:", a4, v8, *(_QWORD *)(a1 + 56), v11, *(_QWORD *)(a1 + 40), objc_msgSend(v23, "keyItemIndex"));

}

+ (PXCuratedLibraryStatisticsController)defaultController
{
  if (defaultController_onceToken != -1)
    dispatch_once(&defaultController_onceToken, &__block_literal_global_50961);
  return (PXCuratedLibraryStatisticsController *)(id)defaultController_defaultController;
}

void __57__PXCuratedLibraryStatisticsController_defaultController__block_invoke()
{
  PXCuratedLibraryStatisticsController *v0;
  void *v1;

  v0 = objc_alloc_init(PXCuratedLibraryStatisticsController);
  v1 = (void *)defaultController_defaultController;
  defaultController_defaultController = (uint64_t)v0;

}

@end
