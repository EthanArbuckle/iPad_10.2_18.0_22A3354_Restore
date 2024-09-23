@implementation PXPhotoKitTTRForLemonadeCollectionsActionPerformer

- (void)performUserInteractionTask
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[PXActionPerformer hostViewController](self, "hostViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXAssetCollectionActionPerformer assetCollection](self, "assetCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isTransient"))
  {
    objc_msgSend(v4, "localizedTitle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXLemonadeDocumentsUtilities documentsLocalizedTitles](PXLemonadeDocumentsUtilities, "documentsLocalizedTitles");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "containsObject:", v5);

  }
  else
  {
    v7 = 0;
  }
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = (void *)MEMORY[0x1E0CD1390];
  -[PXAssetCollectionActionPerformer assetCollection](self, "assetCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fetchAssetsInAssetCollection:options:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        +[PXFeedbackTapToRadarUtilities detailedDebugDescriptionFileForAsset:](PXFeedbackTapToRadarUtilities, "detailedDebugDescriptionFileForAsset:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v16), (_QWORD)v18);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
          objc_msgSend(v8, "addObject:", v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v14);
  }

  +[PXTTRWorkflowFactory presentDefaultWorkFlowInViewController:withContext:attachmentFileUrls:](PXTTRWorkflowFactory, "presentDefaultWorkFlowInViewController:withContext:attachmentFileUrls:", v3, v7, v8);
}

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  void *v4;
  char v5;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "canShowInternalUI"))
    v5 = _os_feature_enabled_impl();
  else
    v5 = 0;

  return v5;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  return PXLocalizedStringFromTable(CFSTR("PXTTRFileRadarTitle"), CFSTR("PhotosUICore"));
}

+ (id)systemImageNameForAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  return CFSTR("ant");
}

+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5
{
  return +[PXActivity activityWithActionTitle:actionType:activityType:systemImageName:](PXActivity, "activityWithActionTitle:actionType:activityType:systemImageName:", a3, a4, CFSTR("PXActivityTypeFileRadar"), a5);
}

@end
