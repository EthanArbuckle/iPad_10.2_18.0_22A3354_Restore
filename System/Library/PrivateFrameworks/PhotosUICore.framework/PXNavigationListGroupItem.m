@implementation PXNavigationListGroupItem

- (PXNavigationListGroupItem)initWithIdentifier:(id)a3
{
  return -[PXNavigationListGroupItem initWithIdentifier:collection:](self, "initWithIdentifier:collection:", a3, 0);
}

- (PXNavigationListGroupItem)initWithIdentifier:(id)a3 collection:(id)a4
{
  id v7;
  id v8;
  void *v9;
  PXNavigationListGroupItem *v10;
  objc_super v12;

  v7 = a4;
  v8 = a3;
  objc_msgSend((id)objc_opt_class(), "titleForIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)PXNavigationListGroupItem;
  v10 = -[PXNavigationListItem initWithIdentifier:title:itemCount:](&v12, sel_initWithIdentifier_title_itemCount_, v8, v9, 0x7FFFFFFFFFFFFFFFLL);

  if (v10)
  {
    v10->_expandable = 1;
    v10->_draggable = 1;
    v10->_group = 1;
    objc_storeStrong((id *)&v10->_collection, a4);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _BYTE *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXNavigationListGroupItem;
  v4 = -[PXNavigationListItem copyWithZone:](&v8, sel_copyWithZone_, a3);
  v4[56] = -[PXNavigationListGroupItem isGroup](self, "isGroup");
  v4[57] = -[PXNavigationListGroupItem isDraggable](self, "isDraggable");
  v4[58] = -[PXNavigationListGroupItem isExpandable](self, "isExpandable");
  -[PXNavigationListGroupItem collection](self, "collection");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)*((_QWORD *)v4 + 8);
  *((_QWORD *)v4 + 8) = v5;

  return v4;
}

- (BOOL)isGroup
{
  return self->_group;
}

- (BOOL)isDraggable
{
  return self->_draggable;
}

- (BOOL)isExpandable
{
  return self->_expandable;
}

- (id)collection
{
  return self->_collection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collection, 0);
}

+ (id)titleForIdentifier:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = titleForIdentifier__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&titleForIdentifier__onceToken, &__block_literal_global_103422);
  objc_msgSend((id)titleForIdentifier__titles, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __48__PXNavigationListGroupItem_titleForIdentifier___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[18];
  _QWORD v21[20];

  v21[18] = *MEMORY[0x1E0C80C00];
  v20[0] = CFSTR("PXNavigationListGroupItemTypePhotos");
  PXLocalizedStringFromTable(CFSTR("PXPhotosOutlineTitle"), CFSTR("PhotosUICore"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v19;
  v20[1] = CFSTR("PXNavigationListGroupItemTypeSharing");
  PXLocalizedStringFromTable(CFSTR("PXSharingOutlineTitle"), CFSTR("PhotosUICore"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v18;
  v20[2] = CFSTR("PXNavigationListGroupItemTypeCollections");
  PXLocalizedStringFromTable(CFSTR("PXCollectionsOutlineTitle"), CFSTR("PhotosUICore"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v17;
  v20[3] = CFSTR("PXNavigationListGroupItemTypeDevices");
  PXLocalizedStringFromTable(CFSTR("PXDevicesOutlineTitle"), CFSTR("PhotosUICore"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v16;
  v20[4] = CFSTR("PXNavigationListGroupItemTypeAlbums");
  PXLocalizedStringFromTable(CFSTR("PXAlbumsOutlineTitle"), CFSTR("PhotosUICore"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[4] = v15;
  v20[5] = CFSTR("PXNavigationListGroupItemTypeMyAlbums");
  PXLocalizedStringFromTable(CFSTR("PXMyAlbumsOutlineTitle"), CFSTR("PhotosUICore"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[5] = v14;
  v20[6] = CFSTR("PXNavigationListGroupItemTypeSharedAlbums");
  PXLocalizedStringFromTable(CFSTR("PXSharedAlbumsOutlineTitle"), CFSTR("PhotosUICore"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[6] = v13;
  v20[7] = CFSTR("PXNavigationListGroupItemTypeMediaTypes");
  PXLocalizedStringFromTable(CFSTR("PXMediaTypesOutlineTitle"), CFSTR("PhotosUICore"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[7] = v12;
  v20[8] = CFSTR("PXNavigationListGroupItemTypeOtherAlbums");
  PXLocalizedStringFromTable(CFSTR("PXOtherAlbumsOutlineTitle"), CFSTR("PhotosUICore"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v21[8] = v0;
  v20[9] = CFSTR("PXNavigationListGroupItemTypeSyncedFromMacAlbums");
  PXLocalizedStringFromTable(CFSTR("PXSyncedFromMacOutlineTitle"), CFSTR("PhotosUICore"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v21[9] = v1;
  v20[10] = CFSTR("PXNavigationListGroupItemTypeProjects");
  PXLocalizedStringFromTable(CFSTR("PXProjectsOutlineTitle"), CFSTR("PhotosUICore"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v21[10] = v2;
  v20[11] = CFSTR("PXNavigationListGroupItemTypePrototypes");
  PXLocalizedStringFromTable(CFSTR("PXPrototypesOutlineTitle"), CFSTR("PhotosUICore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21[11] = v3;
  v20[12] = CFSTR("PXSharedAlbumsVirtualCollection");
  PXLocalizedStringFromTable(CFSTR("PXSharedAlbumsOutlineTitle"), CFSTR("PhotosUICore"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21[12] = v4;
  v20[13] = CFSTR("PXTransientCollectionIdentifierBookmarks");
  PXLocalizedStringFromTable(CFSTR("LemonadeBookmarksSectionHeaderTitle"), CFSTR("LemonadeLocalizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21[13] = v5;
  v20[14] = CFSTR("PXMediaTypesVirtualCollection");
  PXLocalizedStringFromTable(CFSTR("PXMediaTypesOutlineTitle"), CFSTR("PhotosUICore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21[14] = v6;
  v20[15] = CFSTR("PXMyAlbumsVirtualCollection");
  PXLocalizedStringFromTable(CFSTR("PXAlbumsOutlineTitle"), CFSTR("PhotosUICore"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[15] = v7;
  v20[16] = CFSTR("PXTransientCollectionIdentifierUtilities");
  PXLocalizedStringFromTable(CFSTR("PXOtherAlbumsOutlineTitle"), CFSTR("PhotosUICore"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[16] = v8;
  v20[17] = CFSTR("PXMacSyncedAlbumsVirtualCollection");
  PXLocalizedStringFromTable(CFSTR("PXSyncedFromMacOutlineTitle"), CFSTR("PhotosUICore"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[17] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 18);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)titleForIdentifier__titles;
  titleForIdentifier__titles = v10;

}

@end
