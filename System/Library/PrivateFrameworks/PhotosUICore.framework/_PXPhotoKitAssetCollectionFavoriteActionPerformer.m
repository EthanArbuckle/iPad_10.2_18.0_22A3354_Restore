@implementation _PXPhotoKitAssetCollectionFavoriteActionPerformer

+ (BOOL)_targetFavoriteStateForAssetCollectionReference:(id)a3
{
  return 1;
}

+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint8_t v14[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend(a1, "_targetFavoriteStateForAssetCollectionReference:", 0) & 1) == 0)
  {
    PXAssertGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_fault_impl(&dword_1A6789000, v11, OS_LOG_TYPE_FAULT, "unexpected target favorite state", v14, 2u);
    }

  }
  +[PXActivity activityWithActionTitle:actionType:activityType:systemImageName:](PXActivity, "activityWithActionTitle:actionType:activityType:systemImageName:", v8, v9, CFSTR("PXActivityTypeAddToFavoriteMemories"), v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
