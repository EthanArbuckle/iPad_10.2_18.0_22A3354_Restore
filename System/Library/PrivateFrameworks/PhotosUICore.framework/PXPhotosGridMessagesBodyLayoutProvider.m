@implementation PXPhotosGridMessagesBodyLayoutProvider

- (PXPhotosGridMessagesBodyLayoutProvider)initWithViewModel:(id)a3
{
  id v4;
  PXPhotosGridMessagesBodyLayoutProvider *v5;
  PXPhotosGridMessagesLayoutSpecManager *v6;
  void *v7;
  void *v8;
  PXPhotosGridMessagesLayoutSpecManager *v9;
  PXPhotosGridMessagesLayoutSpecManager *specManager;
  PXPhotosGridMessagesLayoutSpecManager *v11;
  uint64_t v12;
  PXTapbackStatusManager *tapbackStatusManager;
  uint64_t v14;
  PXAssetImportStatusManager *assetImportStatusManager;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PXPhotosGridMessagesBodyLayoutProvider;
  v5 = -[PXPhotosGridMessagesBodyLayoutProvider init](&v17, sel_init);
  if (v5)
  {
    v6 = [PXPhotosGridMessagesLayoutSpecManager alloc];
    objc_msgSend(v4, "specManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "extendedTraitCollection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PXFeatureSpecManager initWithExtendedTraitCollection:](v6, "initWithExtendedTraitCollection:", v8);

    specManager = v5->_specManager;
    v5->_specManager = v9;
    v11 = v9;

    -[PXPhotosGridMessagesLayoutSpecManager registerChangeObserver:context:](v5->_specManager, "registerChangeObserver:context:", v5, SpecManagerObservationContext_86158);
    objc_msgSend(v4, "tapbackStatusManager");
    v12 = objc_claimAutoreleasedReturnValue();
    tapbackStatusManager = v5->_tapbackStatusManager;
    v5->_tapbackStatusManager = (PXTapbackStatusManager *)v12;

    objc_msgSend(v4, "assetImportStatusManager");
    v14 = objc_claimAutoreleasedReturnValue();
    assetImportStatusManager = v5->_assetImportStatusManager;
    v5->_assetImportStatusManager = (PXAssetImportStatusManager *)v14;

  }
  return v5;
}

- (void)sectionedLayout:(id)a3 bodyLayout:(id)a4 didChangeDataSource:(id)a5 sectionIndexPath:(PXSimpleIndexPath *)a6 hasSectionChanges:(BOOL)a7
{
  id v9;
  id v10;

  v9 = a5;
  objc_msgSend(a4, "decoratedLayout");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDataSource:section:", v9, a6->section);

}

- (void)configureSectionBodyLayout:(id)a3 inAssetSectionLayout:(id)a4 forSectionedLayout:(id)a5
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
  id v16;

  v7 = a4;
  objc_msgSend(a3, "decoratedLayout");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "selectionSnapshot");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "assetDecorationSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSelectionSnapshot:", v8);

  v10 = objc_msgSend(v7, "isSelecting");
  objc_msgSend(v16, "assetDecorationSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setIsInSelectMode:", v10);

  objc_msgSend(v7, "tapbackStatusManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "assetDecorationSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTapbackStatusManager:", v12);

  -[PXPhotosGridMessagesBodyLayoutProvider specManager](self, "specManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "spec");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setSpec:", v15);

}

- (id)createSectionBodyLayoutForSectionedLayout:(id)a3 dataSource:(id)a4 sectionIndexPath:(PXSimpleIndexPath *)a5 spec:(id)a6 outWantsDecoration:(BOOL *)a7
{
  id v10;
  PXPhotosGridMessagesBodyLayout *v11;
  void *v12;
  void *v13;
  void *v14;
  _PXMessagesGridDecoratingLayout *v15;

  v10 = a4;
  v11 = objc_alloc_init(PXPhotosGridMessagesBodyLayout);
  -[PXGItemsLayout setNumberOfItems:](v11, "setNumberOfItems:", objc_msgSend(v10, "numberOfItemsInSection:", a5->section));
  -[PXPhotosGridMessagesBodyLayout setDataSource:section:](v11, "setDataSource:section:", v10, a5->section);

  -[PXGItemsLayout setDelegate:](v11, "setDelegate:", self);
  *a7 = 0;
  -[PXPhotosGridMessagesBodyLayout assetDecorationSource](v11, "assetDecorationSource");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosGridMessagesBodyLayoutProvider tapbackStatusManager](self, "tapbackStatusManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setTapbackStatusManager:", v13);

  -[PXPhotosGridMessagesBodyLayoutProvider assetImportStatusManager](self, "assetImportStatusManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAssetImportStatusManager:", v14);

  objc_msgSend(v12, "setInterItemSpacingThresholdForExteriorFocusRingSelection:", 0);
  v15 = -[PXGDecoratingLayout initWithDecoratedLayout:]([_PXMessagesGridDecoratingLayout alloc], "initWithDecoratedLayout:", v11);
  -[PXGDecoratingLayout setActiveDecorations:](v15, "setActiveDecorations:", &unk_1E53E9420);
  -[PXGDecoratingLayout setDecorationSource:](v15, "setDecorationSource:", v12);
  -[PXGDecoratingLayout setContentSource:](v15, "setContentSource:", v11);

  return v15;
}

- (BOOL)shouldPreventFaultOutOfBodyLayout:(id)a3 inAssetSectionLayout:(id)a4
{
  return 0;
}

- (double)itemsLayout:(id)a3 aspectRatioForItem:(int64_t)a4
{
  void *v4;
  double v5;
  double v6;
  double v7;

  objc_msgSend(a3, "assetForItemIndex:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "aspectRatio");
  v6 = 1.0;
  if (v5 < 0.99)
    v6 = 0.75;
  if (v5 <= 1.01)
    v7 = v6;
  else
    v7 = 1.33333333;

  return v7;
}

- (CGSize)itemsLayout:(id)a3 marginForItem:(int64_t)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  v5 = a3;
  objc_msgSend(v5, "assetForItemIndex:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "aspectRatio");
  v8 = v7;
  objc_msgSend(v5, "spec");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 > 1.01 || v8 < 0.99)
    objc_msgSend(v9, "itemInternalMargin");
  else
    objc_msgSend(v9, "itemInternalSquareMargin");
  v12 = v10;
  v13 = v11;

  v14 = v12;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (int64_t)itemsLayout:(id)a3 itemForObjectReference:(id)a4 options:(unint64_t)a5
{
  char v5;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_6;
  v9 = v8;
  if (!v9)
    goto LABEL_6;
  v10 = v9;
  if ((v5 & 1) == 0)
    goto LABEL_8;
  objc_msgSend(v7, "dataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectReferenceNearestToObjectReference:inSection:", v10, objc_msgSend(v7, "section"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

LABEL_8:
    v12 = v10;
    goto LABEL_9;
  }

  if (!v12)
  {
LABEL_6:
    v13 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_19;
  }
LABEL_9:
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v7, "dataSource", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    objc_msgSend(v14, "indexPathForAssetReference:", v12);
  }
  else
  {
    v17 = 0u;
    v18 = 0u;
  }

  v13 = 0x7FFFFFFFFFFFFFFFLL;
  if ((_QWORD)v17 != *(_QWORD *)off_1E50B7E98
    && (_QWORD)v18 != 0x7FFFFFFFFFFFFFFFLL
    && *((_QWORD *)&v18 + 1) == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (*((_QWORD *)&v17 + 1) == objc_msgSend(v7, "section"))
      v13 = v18;
    else
      v13 = 0x7FFFFFFFFFFFFFFFLL;
  }

LABEL_19:
  return v13;
}

- (id)itemsLayout:(id)a3 objectReferenceForItem:(int64_t)a4
{
  return (id)objc_msgSend(a3, "assetReferenceForItemIndex:", a4);
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v9 = a3;
  if ((void *)SpecManagerObservationContext_86158 != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosGridMessagesBodyLayoutProvider.m"), 152, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 1) != 0)
  {
    v12 = v9;
    -[PXPhotosGridMessagesBodyLayoutProvider invalidationDelegate](self, "invalidationDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "photosSectionBodyLayoutInvalidateConfiguredLayouts:", self);

    v9 = v12;
  }

}

- (PXPhotosSectionBodyLayoutProviderInvalidationDelegate)invalidationDelegate
{
  return (PXPhotosSectionBodyLayoutProviderInvalidationDelegate *)objc_loadWeakRetained((id *)&self->invalidationDelegate);
}

- (void)setInvalidationDelegate:(id)a3
{
  objc_storeWeak((id *)&self->invalidationDelegate, a3);
}

- (PXPhotosGridMessagesLayoutSpecManager)specManager
{
  return self->_specManager;
}

- (PXTapbackStatusManager)tapbackStatusManager
{
  return self->_tapbackStatusManager;
}

- (PXAssetImportStatusManager)assetImportStatusManager
{
  return self->_assetImportStatusManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetImportStatusManager, 0);
  objc_storeStrong((id *)&self->_tapbackStatusManager, 0);
  objc_storeStrong((id *)&self->_specManager, 0);
  objc_destroyWeak((id *)&self->invalidationDelegate);
}

@end
