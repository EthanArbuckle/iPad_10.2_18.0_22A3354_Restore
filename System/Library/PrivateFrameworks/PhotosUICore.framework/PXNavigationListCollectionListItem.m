@implementation PXNavigationListCollectionListItem

- (id)viewControllerForCollectionWithGridPresentation:(id)a3 existingAssetsFetchResult:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  -[PXNavigationListDisplayCollectionListItem collection](self, "collection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createAlbumListViewControllerWithCollectionList:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)cpAnalyticsEventName
{
  return 0;
}

- (PXNavigationListCollectionListItem)initWithCollectionList:(id)a3 itemCount:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  PXNavigationListCollectionListItem *v12;
  uint64_t v13;
  uint64_t v14;
  objc_super v16;

  v6 = a3;
  objc_msgSend(v6, "transientIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(v6, "localIdentifier");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  objc_msgSend(v6, "px_localizedTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16.receiver = self;
  v16.super_class = (Class)PXNavigationListCollectionListItem;
  v12 = -[PXNavigationListDisplayCollectionListItem initWithIdentifier:displayCollectionList:title:itemCount:](&v16, sel_initWithIdentifier_displayCollectionList_title_itemCount_, v10, v6, v11, a4);
  if (v12)
  {
    v13 = (objc_msgSend(v6, "isTransient") & 1) == 0
       && -[PXNavigationListDisplayCollectionListItem isDraggable](v12, "isDraggable");
    -[PXNavigationListDisplayCollectionListItem setDraggable:](v12, "setDraggable:", v13);
    if ((objc_msgSend(v6, "isTransient") & 1) != 0
      || !-[PXNavigationListDisplayCollectionListItem isReorderable](v12, "isReorderable"))
    {
      v14 = 0;
    }
    else
    {
      v14 = objc_msgSend(v6, "collectionHasFixedOrder") ^ 1;
    }
    -[PXNavigationListDisplayCollectionListItem setReorderable:](v12, "setReorderable:", v14);
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PXNavigationListCollectionListItem;
  return -[PXNavigationListDisplayCollectionListItem copyWithZone:](&v4, sel_copyWithZone_, a3);
}

@end
