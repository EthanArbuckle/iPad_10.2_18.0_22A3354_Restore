@implementation PXActionManagerFactory

+ (id)actionManagerForObject:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "actionManagerForObjects:", v6, v9, v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)actionManagerForObjects:(id)a3
{
  id v3;
  void *v4;
  PXPhotoKitAssetActionManager *v5;
  id v6;
  PXPhotoKitSocialGroupActionManager *v7;
  void *v8;
  void *v9;
  PXPhotoKitSocialGroupActionManager *v10;

  v3 = a3;
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[PXPhotoKitAssetActionManager initWithSuggestion:]([PXPhotoKitAssetActionManager alloc], "initWithSuggestion:", v4);
LABEL_13:
    v10 = (PXPhotoKitSocialGroupActionManager *)v5;
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[PXAssetCollectionActionManager initWithAssetCollection:displayTitleInfo:]([PXPhotoKitAssetCollectionActionManager alloc], "initWithAssetCollection:displayTitleInfo:", v4, 0);
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[PXPhotoKitCollectionListActionManager initWithCollectionList:]([PXPhotoKitCollectionListActionManager alloc], "initWithCollectionList:", v4);
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[PXPhotoKitPersonActionManager initWithPeople:]([PXPhotoKitPersonActionManager alloc], "initWithPeople:", v3);
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v10 = 0;
      goto LABEL_14;
    }
    v5 = -[PXPhotoKitAssetActionManager initWithAsset:]([PXPhotoKitAssetActionManager alloc], "initWithAsset:", v4);
    goto LABEL_13;
  }
  v6 = v3;
  v7 = [PXPhotoKitSocialGroupActionManager alloc];
  objc_msgSend(v6, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PXPhotoKitSocialGroupActionManager initWithSocialGroups:photoLibrary:](v7, "initWithSocialGroups:photoLibrary:", v6, v9);

LABEL_14:
  return v10;
}

@end
