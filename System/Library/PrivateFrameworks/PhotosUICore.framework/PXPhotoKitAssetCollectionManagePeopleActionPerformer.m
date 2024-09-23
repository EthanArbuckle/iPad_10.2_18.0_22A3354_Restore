@implementation PXPhotoKitAssetCollectionManagePeopleActionPerformer

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  void *v16;
  objc_class *v17;
  void *v18;
  objc_class *v19;
  void *v20;

  objc_msgSend(a3, "assetCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetCollectionSharedAlbumOptionsActionPerformer.m"), 104, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("assetCollectionReference.assetCollection"), v18);
LABEL_9:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "px_descriptionForAssertionMessage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPhotoKitAssetCollectionSharedAlbumOptionsActionPerformer.m"), 104, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("assetCollectionReference.assetCollection"), v18, v20);

    goto LABEL_9;
  }
LABEL_3:
  v7 = objc_msgSend(v6, "assetCollectionSubtype");
  objc_msgSend(v6, "objectID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "managedObjectContextForCurrentQueueQoS");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  PXSharedAlbumsRecipientsForAlbumWithObjectID(v8, 0, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");
  LOBYTE(v13) = 0;
  if (v7 == 101 && v12)
  {
    +[PXSharedAlbumsSettings sharedInstance](PXSharedAlbumsSettings, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v14, "useLemonadeSettingsView") ^ 1;

  }
  return v13;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  return PXLocalizedStringFromTable(CFSTR("PXPhotosGridsSharedAlbumOptionsManagePeople"), CFSTR("PhotosUICore"));
}

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  return CFSTR("person.crop.circle.badge.checkmark");
}

@end
