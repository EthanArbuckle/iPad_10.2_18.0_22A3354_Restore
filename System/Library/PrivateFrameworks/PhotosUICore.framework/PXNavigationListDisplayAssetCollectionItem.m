@implementation PXNavigationListDisplayAssetCollectionItem

- (PXNavigationListDisplayAssetCollectionItem)initWithIdentifier:(id)a3 title:(id)a4 displayAssetCollection:(id)a5 itemCount:(int64_t)a6
{
  id v11;
  PXNavigationListDisplayAssetCollectionItem *v12;
  objc_super v14;

  v11 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PXNavigationListDisplayAssetCollectionItem;
  v12 = -[PXNavigationListItem initWithIdentifier:title:itemCount:](&v14, sel_initWithIdentifier_title_itemCount_, a3, a4, a6);
  if (v12)
  {
    v12->_reorderable = objc_msgSend(v11, "px_isMacSyncedAlbum") ^ 1;
    v12->_renamable = objc_msgSend(v11, "px_isRenamable");
    v12->_deletable = objc_msgSend(v11, "px_isDeletable");
    objc_storeStrong((id *)&v12->_collection, a5);
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PXNavigationListDisplayAssetCollectionItem;
  v5 = -[PXNavigationListItem copyWithZone:](&v10, sel_copyWithZone_);
  v5[56] = -[PXNavigationListDisplayAssetCollectionItem isReorderable](self, "isReorderable");
  v5[57] = -[PXNavigationListDisplayAssetCollectionItem isRenamable](self, "isRenamable");
  v5[58] = -[PXNavigationListDisplayAssetCollectionItem isDeletable](self, "isDeletable");
  -[PXNavigationListDisplayAssetCollectionItem collection](self, "collection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "copyWithZone:", a3);
  v8 = (void *)*((_QWORD *)v5 + 8);
  *((_QWORD *)v5 + 8) = v7;

  *((_QWORD *)v5 + 9) = -[PXNavigationListDisplayAssetCollectionItem indentationLevel](self, "indentationLevel");
  return v5;
}

- (BOOL)isDraggable
{
  void *v2;
  int v3;

  -[PXNavigationListDisplayAssetCollectionItem collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "px_isPlacesSmartAlbum") & 1) != 0)
    LOBYTE(v3) = 0;
  else
    v3 = objc_msgSend(v2, "px_isMyPhotoStreamAlbum") ^ 1;

  return v3;
}

- (id)glyphImageName
{
  void *v2;
  __CFString *v3;

  -[PXNavigationListDisplayAssetCollectionItem collection](self, "collection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "px_isRegularAlbum") & 1) != 0
    || (objc_msgSend(v2, "px_isUserSmartAlbum") & 1) != 0
    || (objc_msgSend(v2, "px_isSharedAlbum") & 1) != 0
    || (objc_msgSend(v2, "px_isMacSyncedRegularAlbum") & 1) != 0
    || (objc_msgSend(v2, "px_isMacSyncedFacesAlbum") & 1) != 0
    || (objc_msgSend(v2, "px_isMomentShare") & 1) != 0)
  {
    v3 = CFSTR("PXNavigationListItemImageNameEmptyAlbum");
  }
  else
  {
    objc_msgSend(v2, "px_symbolImageName");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (BOOL)isReorderable
{
  return self->_reorderable;
}

- (void)setReorderable:(BOOL)a3
{
  self->_reorderable = a3;
}

- (BOOL)isRenamable
{
  return self->_renamable;
}

- (BOOL)isDeletable
{
  return self->_deletable;
}

- (PXDisplayAssetCollection)collection
{
  return self->_collection;
}

- (int64_t)indentationLevel
{
  return self->_indentationLevel;
}

- (void)setIndentationLevel:(int64_t)a3
{
  self->_indentationLevel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collection, 0);
}

@end
