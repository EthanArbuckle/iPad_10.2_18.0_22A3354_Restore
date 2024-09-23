@implementation PXSharedAlbumsActivityEntryViewController

- (PXSharedAlbumsActivityEntryViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  PXSharedAlbumsActivityEntryViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  PXSharedAlbumsActivityEntryItemList *v8;
  void *v9;
  uint64_t v10;
  PXSharedAlbumsActivityEntryItemList *itemList;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)PXSharedAlbumsActivityEntryViewController;
  v4 = -[PXSharedAlbumsActivityEntryViewController initWithNibName:bundle:](&v13, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "px_standardLibrarySpecificFetchOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXSharedAlbumsActivityEntry fetchActivitiesWithOptions:](PXSharedAlbumsActivityEntry, "fetchActivitiesWithOptions:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = [PXSharedAlbumsActivityEntryItemList alloc];
    objc_msgSend(v7, "fetchedObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PXSharedAlbumsActivityEntryItemList initWithActivities:](v8, "initWithActivities:", v9);

    itemList = v4->_itemList;
    v4->_itemList = (PXSharedAlbumsActivityEntryItemList *)v10;

  }
  return v4;
}

- (void)loadView
{
  PXSharedAlbumsActivityEntryItemList *v3;
  PXGStackLayout *v4;
  PXGStackLayout *layout;
  void *v6;
  id v7;
  PXPhotoKitUIMediaProvider *v8;
  PXMediaProvider *mediaProvider;
  PXGView *v10;
  id v11;

  v3 = self->_itemList;
  v4 = objc_alloc_init(PXGStackLayout);
  layout = self->_layout;
  self->_layout = v4;

  -[PXGStackLayout setAxis:](self->_layout, "setAxis:", 1);
  -[PXGStackLayout setInterlayoutSpacing:](self->_layout, "setInterlayoutSpacing:", 20.0);
  -[PXGStackLayout insertSublayoutProvider:inRange:](self->_layout, "insertSublayoutProvider:inRange:", self, 0, -[PXSharedAlbumsActivityEntryItemList count](v3, "count"));
  -[PXGLayout createAnchorForScrollingToContentEdges:padding:](self->_layout, "createAnchorForScrollingToContentEdges:padding:", 4, *(double *)off_1E50B8020, *((double *)off_1E50B8020 + 1), *((double *)off_1E50B8020 + 2), *((double *)off_1E50B8020 + 3));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v6, "autoInvalidate");

  v11 = objc_alloc_init(MEMORY[0x1E0CD15A0]);
  v8 = -[PXPhotoKitUIMediaProvider initWithImageManager:]([PXPhotoKitUIMediaProvider alloc], "initWithImageManager:", v11);
  mediaProvider = self->_mediaProvider;
  self->_mediaProvider = &v8->super.super;

  v10 = objc_alloc_init(PXGView);
  -[PXGView setRootLayout:](v10, "setRootLayout:", self->_layout);
  -[PXGView registerAllTextureProvidersWithMediaProvider:](v10, "registerAllTextureProvidersWithMediaProvider:", self->_mediaProvider);

  -[PXSharedAlbumsActivityEntryViewController setView:](self, "setView:", v10);
}

- (CGSize)layout:(id)a3 estimatedContentSizeForSublayoutAtIndex:(int64_t)a4 referenceSize:(CGSize)result
{
  double v5;

  v5 = (double)(100 * a4 + 100);
  result.height = v5;
  return result;
}

- (id)layout:(id)a3 createSublayoutAtIndex:(int64_t)a4
{
  void *v4;
  PXSharedAlbumsActivityEntryLayout *v5;

  -[PXSharedAlbumsActivityEntryItemList itemAtIndex:](self->_itemList, "itemAtIndex:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PXSharedAlbumsActivityEntryLayout initWithItem:]([PXSharedAlbumsActivityEntryLayout alloc], "initWithItem:", v4);

  return v5;
}

- (id)layout:(id)a3 navigationObjectReferenceForSublayoutAtIndex:(int64_t)a4
{
  return 0;
}

- (void)_itemListManagerDidChange:(id)a3
{
  void *v4;
  id v5;
  PXGStackLayout *layout;
  PXSharedAlbumsActivityEntryItemList *v7;

  -[PXGLayout createAnchorForVisibleArea](self->_layout, "createAnchorForVisibleArea", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "autoInvalidate");

  layout = self->_layout;
  v7 = self->_itemList;
  -[PXGLayout applySublayoutChangeDetails:countAfterChanges:sublayoutProvider:](layout, "applySublayoutChangeDetails:countAfterChanges:sublayoutProvider:", 0, -[PXSharedAlbumsActivityEntryItemList count](v7, "count"), self);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaProvider, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_itemList, 0);
}

@end
