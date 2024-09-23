@implementation PXRenameCollectionAction

- (PXRenameCollectionAction)initWithCollection:(id)a3 title:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  PXRenameCollectionAction *v17;
  NSString *currentTitle;
  PXRenameCollectionAction *v19;
  NSObject *v20;
  objc_super v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (objc_msgSend(v7, "canPerformEditOperation:", 7))
  {
    v9 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v7, "localizedTitle");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
      v12 = (__CFString *)v10;
    else
      v12 = &stru_1E5149688;
    v13 = v12;

    if ((objc_msgSend(v9, "isEqualToString:", v13) & 1) == 0)
    {
      v14 = objc_msgSend((id)objc_opt_class(), "_renameTypeForCollection:", v7);
      if (v14)
      {
        v15 = v14;
        objc_msgSend(v7, "photoLibrary");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v22.receiver = self;
        v22.super_class = (Class)PXRenameCollectionAction;
        v17 = -[PXPhotosAction initWithPhotoLibrary:](&v22, sel_initWithPhotoLibrary_, v16);

        if (v17)
        {
          objc_storeStrong((id *)&v17->_collection, a3);
          v17->_collectionType = v15;
          objc_storeStrong((id *)&v17->_redoTitle, v9);
          objc_storeStrong((id *)&v17->_undoTitle, v12);
          currentTitle = v17->_currentTitle;
          v17->_currentTitle = (NSString *)&stru_1E5149688;

        }
        self = v17;
        v19 = self;
        goto LABEL_15;
      }
      PXAssertGetLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v24 = v7;
        _os_log_error_impl(&dword_1A6789000, v20, OS_LOG_TYPE_ERROR, "Unexpected collection type for %@", buf, 0xCu);
      }

    }
    v19 = 0;
LABEL_15:

    goto LABEL_16;
  }
  v19 = 0;
LABEL_16:

  return v19;
}

- (void)_changeTitle:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  -[PXRenameCollectionAction collection](self, "collection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __59__PXRenameCollectionAction__changeTitle_completionHandler___block_invoke;
  v16[3] = &unk_1E51457C8;
  v16[4] = self;
  v17 = v8;
  v18 = v6;
  v13[0] = v9;
  v13[1] = 3221225472;
  v13[2] = __59__PXRenameCollectionAction__changeTitle_completionHandler___block_invoke_2;
  v13[3] = &unk_1E5146918;
  v13[4] = self;
  v14 = v18;
  v15 = v7;
  v10 = v7;
  v11 = v18;
  v12 = v8;
  -[PXPhotosAction performChanges:completionHandler:](self, "performChanges:completionHandler:", v16, v13);

}

- (id)actionIdentifier
{
  return CFSTR("RenameCollection");
}

- (id)actionNameLocalizationKey
{
  return (id)objc_msgSend((id)objc_opt_class(), "_actionNameLocalizationKeyForCollectionType:", -[PXRenameCollectionAction collectionType](self, "collectionType"));
}

- (void)performAction:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXRenameCollectionAction redoTitle](self, "redoTitle");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PXRenameCollectionAction _changeTitle:completionHandler:](self, "_changeTitle:completionHandler:", v5, v4);

}

- (void)performUndo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXRenameCollectionAction undoTitle](self, "undoTitle");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PXRenameCollectionAction _changeTitle:completionHandler:](self, "_changeTitle:completionHandler:", v5, v4);

}

- (NSString)currentTitle
{
  return self->_currentTitle;
}

- (void)setCurrentTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (PHCollection)collection
{
  return self->_collection;
}

- (unint64_t)collectionType
{
  return self->_collectionType;
}

- (NSString)redoTitle
{
  return self->_redoTitle;
}

- (NSString)undoTitle
{
  return self->_undoTitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_undoTitle, 0);
  objc_storeStrong((id *)&self->_redoTitle, 0);
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_currentTitle, 0);
}

void __59__PXRenameCollectionAction__changeTitle_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "collectionType");
  switch(v2)
  {
    case 3:
      v3 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0CD14E8], "changeRequestForCollectionList:", *(_QWORD *)(a1 + 40));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      v3 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0CD17B8], "changeRequestForSmartAlbum:", *(_QWORD *)(a1 + 40));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      v3 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0CD13C8], "changeRequestForAssetCollection:", *(_QWORD *)(a1 + 40));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return;
  }
  v5 = v4;
  objc_msgSend(v4, "setTitle:", v3);

}

void __59__PXRenameCollectionAction__changeTitle_completionHandler___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5;

  v5 = a3;
  if (a2)
    objc_msgSend(*(id *)(a1 + 32), "setCurrentTitle:", *(_QWORD *)(a1 + 40));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

+ (unint64_t)_renameTypeForCollection:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(v3, "assetCollectionSubtype") == 1000000204)
      v4 = 2;
    else
      v4 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = 3;
    else
      v4 = 0;
  }

  return v4;
}

+ (id)_actionNameLocalizationKeyForCollectionType:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("PXPhotosGridRenameAlbumActionMenuTitle");
  if (a3 == 2)
    v3 = CFSTR("PXRenameSmartAlbumActionName");
  if (a3 == 3)
    return CFSTR("PXRenameFolderActionName");
  else
    return (id)v3;
}

+ (id)actionNameForCollection:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "_actionNameLocalizationKeyForCollectionType:", objc_msgSend(a1, "_renameTypeForCollection:", a3));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PXLocalizedStringFromTable(v3, CFSTR("PhotosUICore"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
