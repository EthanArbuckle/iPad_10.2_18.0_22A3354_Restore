@implementation PXPhotoKitCollectionListActionManager

- (PXPhotoKitCollectionListActionManager)initWithCollectionList:(id)a3
{
  id v5;
  PXPhotoKitCollectionListActionManager *v6;
  PXPhotoKitCollectionListActionManager *v7;
  uint64_t v8;
  NSDictionary *performerClassByType;
  uint64_t v10;
  uint64_t v11;
  NSDictionary *collectionListActionTypeByGenericType;
  objc_super v14;
  _QWORD v15[2];
  _QWORD v16[2];
  _QWORD v17[11];
  _QWORD v18[12];

  v18[11] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PXPhotoKitCollectionListActionManager;
  v6 = -[PXPhotoKitCollectionListActionManager init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_collectionList, a3);
    v17[0] = CFSTR("PXCollectionListActionTypeRename");
    v18[0] = objc_opt_class();
    v17[1] = CFSTR("PXCollectionListActionTypeCustomize");
    v18[1] = objc_opt_class();
    v17[2] = CFSTR("PXCollectionListActionTypeMoveOut");
    v18[2] = objc_opt_class();
    v17[3] = CFSTR("PXCollectionListActionTypeRearrange");
    v18[3] = objc_opt_class();
    v17[4] = CFSTR("PXCollectionListActionTypeMove");
    v18[4] = objc_opt_class();
    v17[5] = CFSTR("PXCollectionListActionTypeCreateAlbumWithPhotosPicker_Old");
    v18[5] = objc_opt_class();
    v17[6] = CFSTR("PXCollectionListActionTypeCreateAlbumWithPhotosPicker");
    v18[6] = objc_opt_class();
    v17[7] = CFSTR("PXCollectionListActionTypeCreateFolder");
    v18[7] = objc_opt_class();
    v17[8] = CFSTR("PXCollectionListActionTypeCreateSharedAlbum");
    v18[8] = objc_opt_class();
    v17[9] = CFSTR("PXCollectionListActionTypeDelete");
    v18[9] = objc_opt_class();
    v17[10] = CFSTR("PXCollectionListActionTypeCopyInternalURL");
    v18[10] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 11);
    v8 = objc_claimAutoreleasedReturnValue();
    performerClassByType = v7->_performerClassByType;
    v7->_performerClassByType = (NSDictionary *)v8;

    v10 = *(_QWORD *)off_1E50B7D68;
    v15[0] = *(_QWORD *)off_1E50B7D40;
    v15[1] = v10;
    v16[0] = CFSTR("PXCollectionListActionTypeMove");
    v16[1] = CFSTR("PXCollectionListActionTypeRearrange");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 2);
    v11 = objc_claimAutoreleasedReturnValue();
    collectionListActionTypeByGenericType = v7->_collectionListActionTypeByGenericType;
    v7->_collectionListActionTypeByGenericType = (NSDictionary *)v11;

  }
  return v7;
}

- (BOOL)canPerformActionType:(id)a3
{
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  BOOL v9;

  v4 = (__CFString *)a3;
  -[PXPhotoKitCollectionListActionManager performerClassByType](self, "performerClassByType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "objectForKeyedSubscript:", v4);

  if (v6)
  {
    -[PXPhotoKitCollectionListActionManager collectionList](self, "collectionList");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "canPerformOnCollectionList:", v7))
    {
      v8 = -[PXActionManager isActionTypeAllowed:](self, "isActionTypeAllowed:", v4);
      v9 = v4 == CFSTR("PXCollectionListActionTypeCopyInternalURL") || v8;
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)actionTypeForGenericType:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PXPhotoKitCollectionListActionManager collectionListActionTypeByGenericType](self, "collectionListActionTypeByGenericType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)actionPerformerForActionType:(id)a3 parameters:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_class *v9;
  id v10;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  -[PXPhotoKitCollectionListActionManager performerClassByType](self, "performerClassByType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (objc_class *)objc_msgSend(v8, "objectForKeyedSubscript:", v6);

  if (v9)
  {
    v10 = [v9 alloc];
    -[PXPhotoKitCollectionListActionManager collectionList](self, "collectionList");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_msgSend(v10, "initWithActionType:collectionList:parameters:", v6, v11, v7);

    -[PXActionManager performerDelegate](self, "performerDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class setDelegate:](v9, "setDelegate:", v12);

  }
  return v9;
}

- (id)actionPerformerForActionType:(id)a3
{
  return -[PXPhotoKitCollectionListActionManager actionPerformerForActionType:parameters:](self, "actionPerformerForActionType:parameters:", a3, MEMORY[0x1E0C9AA70]);
}

- (id)localizedTitleForActionType:(id)a3 useCase:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  -[PXPhotoKitCollectionListActionManager performerClassByType](self, "performerClassByType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "objectForKeyedSubscript:", v5);

  if (v7)
  {
    -[PXPhotoKitCollectionListActionManager collectionList](self, "collectionList");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedTitleForActionType:collectionList:", v5, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)systemImageNameForActionType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[PXPhotoKitCollectionListActionManager performerClassByType](self, "performerClassByType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "objectForKeyedSubscript:", v4);

  if (v6)
  {
    -[PXPhotoKitCollectionListActionManager collectionList](self, "collectionList");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "systemImageNameForCollectionList:actionType:", v7, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)isDestructiveActionType:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PXPhotoKitCollectionListActionManager performerClassByType](self, "performerClassByType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "objectForKeyedSubscript:", v4);

  if (v6)
    return objc_msgSend(v6, "isActionDestructive");
  else
    return 0;
}

- (id)contextMenuElementsWithHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const __CFString *v14;
  _QWORD v15[6];

  v15[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = CFSTR("PXCollectionListActionTypeCustomize");
  v15[1] = CFSTR("PXCollectionListActionTypeMoveOut");
  v15[2] = CFSTR("PXCollectionListActionTypeCreateAlbumWithPhotosPicker");
  v15[3] = CFSTR("PXCollectionListActionTypeCreateFolder");
  v15[4] = CFSTR("PXCollectionListActionTypeDelete");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXActionManager actionItemsForActionTypes:handler:](self, "actionItemsForActionTypes:handler:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v7);

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v8, "canShowInternalUI");

  if ((_DWORD)v7)
  {
    v9 = (void *)objc_opt_new();
    objc_msgSend(v5, "addObject:", v9);

    v14 = CFSTR("PXCollectionListActionTypeCopyInternalURL");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXActionManager actionItemsForActionTypes:handler:](self, "actionItemsForActionTypes:handler:", v10, v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXActionMenu menuWithTitle:childElements:](PXActionMenu, "menuWithTitle:childElements:", CFSTR(" Internal"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v12);

  }
  return v5;
}

- (PHCollectionList)collectionList
{
  return self->_collectionList;
}

- (NSDictionary)performerClassByType
{
  return self->_performerClassByType;
}

- (NSDictionary)collectionListActionTypeByGenericType
{
  return self->_collectionListActionTypeByGenericType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionListActionTypeByGenericType, 0);
  objc_storeStrong((id *)&self->_performerClassByType, 0);
  objc_storeStrong((id *)&self->_collectionList, 0);
}

@end
