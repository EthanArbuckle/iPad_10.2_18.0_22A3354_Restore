@implementation PXPhotoKitAssetCollectionFileRadarActionPerformer

- (void)performUserInteractionTask
{
  void *v4;
  id v5;
  PXHighlightDiagnosticsViewController *v6;
  void *v7;
  void *v8;
  PXPhotoKitAssetCollectionFileRadarActionPerformer *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  const __CFString *v24;
  void *v25;
  char isKindOfClass;
  void *v27;
  objc_class *v28;
  void *v29;
  objc_class *v30;
  void *v31;
  void *v32;
  objc_class *v33;
  void *v34;
  objc_class *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t aBlock;
  uint64_t v41;
  uint64_t (*v42)(uint64_t);
  void *v43;
  id v44;
  PXPhotoKitAssetCollectionFileRadarActionPerformer *v45;
  const __CFString *v46;
  const __CFString *v47;
  const __CFString *v48;
  id v49;
  _QWORD v50[2];

  v50[1] = *MEMORY[0x1E0C80C00];
  -[PXAssetCollectionActionPerformer assetCollection](self, "assetCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "assetCollectionType") != 4)
  {
    if (objc_msgSend(v4, "assetCollectionType") == 6)
    {
      v5 = v4;
      if (v5)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
LABEL_11:
          v6 = -[PXHighlightDiagnosticsViewController initWithHighlight:]([PXHighlightDiagnosticsViewController alloc], "initWithHighlight:", v5);
          -[PXActionPerformer hostViewController](self, "hostViewController");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          -[PXHighlightDiagnosticsViewController radarAttachmentURLs](v6, "radarAttachmentURLs");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = self;
          v10 = v7;
          v11 = 2;
LABEL_15:
          v12 = v8;
          goto LABEL_16;
        }
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = (objc_class *)objc_opt_class();
        NSStringFromClass(v35);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "px_descriptionForAssertionMessage");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetCollectionActionManager.m"), 1727, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("assetCollection"), v34, v36);

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = (objc_class *)objc_opt_class();
        NSStringFromClass(v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetCollectionActionManager.m"), 1727, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("assetCollection"), v34);
      }

      goto LABEL_11;
    }
    if (objc_msgSend(v4, "assetCollectionType") == 2)
    {
      -[PXAssetCollectionActionPerformer socialGroups](self, "socialGroups");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        -[PXActionPerformer hostViewController](self, "hostViewController");
        v5 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "photoLibrary");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[PXPeopleSwiftUtilities fetchAllSocialGroupDetailedDebugDescriptionFor:](PXPeopleSwiftUtilities, "fetchAllSocialGroupDetailedDebugDescriptionFor:", v14);
        v6 = (PXHighlightDiagnosticsViewController *)objc_claimAutoreleasedReturnValue();

        PXFeedbackTapToRadarUtilitiesWriteStringToFileWithExtension(v6, CFSTR("SocialGroups-Debug"), CFSTR("txt"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v50[0] = v7;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = self;
        v10 = v5;
        v11 = 3;
        goto LABEL_15;
      }
    }
    +[PXFeedbackTapToRadarUtilities captureScreenshot](PXFeedbackTapToRadarUtilities, "captureScreenshot");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    aBlock = MEMORY[0x1E0C809B0];
    v41 = 3221225472;
    v42 = __79__PXPhotoKitAssetCollectionFileRadarActionPerformer_performUserInteractionTask__block_invoke;
    v43 = &unk_1E5144558;
    v5 = v15;
    v44 = v5;
    v45 = self;
    v16 = _Block_copy(&aBlock);
    +[PXFeedbackTapToRadarUtilities defaultTitlePrefix](PXFeedbackTapToRadarUtilities, "defaultTitlePrefix");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v17, "mutableCopy");

    +[PXFeedbackTapToRadarUtilities defaultDescription](PXFeedbackTapToRadarUtilities, "defaultDescription");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "mutableCopy");

    if (v5)
    {
      v49 = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v49, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = 0;
    }
    if (objc_msgSend(v4, "assetCollectionType") == 7)
    {
      objc_msgSend(v18, "appendString:", CFSTR("CMM - [TTR] <Insert Bug Title>"));
      objc_msgSend(v20, "appendString:", CFSTR("---Moment Share Tap-To-Radar (CMM / iCloud Sharing Link)---\n"));
      objc_msgSend(v20, "appendFormat:", CFSTR("Moment Share: %@"), v4);
      v48 = CFSTR("com.apple.PhotoLibraryServices.PhotosDiagnostics");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v48, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v22;
      v39 = v16;
      v23 = CFSTR("1073863");
      LOWORD(v37) = 1;
      v24 = CFSTR("Photos UI Shared iCloud Link");
    }
    else
    {
      if (!objc_msgSend(v4, "px_isSharedLibrarySharingSuggestion"))
      {
        -[PXActionPerformer hostViewController](self, "hostViewController");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          -[PXActionPerformer hostViewController](self, "hostViewController");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[PXPhotoKitAssetCollectionFileRadarActionPerformer _presentTTRWorkFlowInViewController:context:attachmentImageUrls:attachmentFileUrls:](self, "_presentTTRWorkFlowInViewController:context:attachmentImageUrls:attachmentFileUrls:", v22, 5, v21, 0);
        }
        else
        {
          objc_msgSend(v18, "appendString:", CFSTR("Photos - [TTR] <Insert Bug Title>"));
          v46 = CFSTR("com.apple.PhotoLibraryServices.PhotosDiagnostics");
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          LOWORD(v37) = 1;
          +[PXFeedbackTapToRadarUtilities fileRadarWithTitle:description:classification:componentID:componentName:componentVersion:keyword:screenshotURLs:attachmentURLs:includeSysDiagnose:includeInternalRelease:additionalExtensionIdentifiers:completionHandler:](PXFeedbackTapToRadarUtilities, "fileRadarWithTitle:description:classification:componentID:componentName:componentVersion:keyword:screenshotURLs:attachmentURLs:includeSysDiagnose:includeInternalRelease:additionalExtensionIdentifiers:completionHandler:", v18, v20, CFSTR("Other Bug"), CFSTR("630529"), CFSTR("Photos (New Bugs) | iOS"), CFSTR("all"), 0, v21, 0, v37, v22, v16, aBlock, v41, v42, v43);
        }
        goto LABEL_27;
      }
      objc_msgSend(v18, "appendString:", CFSTR("Goldilocks - [TTR] <Insert Bug Title>"));
      objc_msgSend(v20, "appendString:", CFSTR("---Shared Library Suggestion Tap-To-Radar---\n"));
      objc_msgSend(v20, "appendFormat:", CFSTR("Shared Library Suggestion: %@"), v4);
      v47 = CFSTR("com.apple.PhotoLibraryServices.PhotosDiagnostics");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v22;
      v39 = v16;
      v23 = CFSTR("1092067");
      LOWORD(v37) = 1;
      v24 = CFSTR("Photos UI Goldilocks");
    }
    +[PXFeedbackTapToRadarUtilities fileRadarWithTitle:description:classification:componentID:componentName:componentVersion:keyword:screenshotURLs:attachmentURLs:includeSysDiagnose:includeInternalRelease:additionalExtensionIdentifiers:completionHandler:](PXFeedbackTapToRadarUtilities, "fileRadarWithTitle:description:classification:componentID:componentName:componentVersion:keyword:screenshotURLs:attachmentURLs:includeSysDiagnose:includeInternalRelease:additionalExtensionIdentifiers:completionHandler:", v18, v20, CFSTR("Other Bug"), v23, v24, CFSTR("iOS"), 0, v21, 0, v37, v38, v39, aBlock, v41, v42, v43);
LABEL_27:

    goto LABEL_18;
  }
  v5 = v4;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (objc_class *)objc_opt_class();
    NSStringFromClass(v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetCollectionActionManager.m"), 1706, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("assetCollection"), v29);
LABEL_33:

    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (objc_class *)objc_opt_class();
    NSStringFromClass(v30);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "px_descriptionForAssertionMessage");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotoKitAssetCollectionActionManager.m"), 1706, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("assetCollection"), v29, v31);

    goto LABEL_33;
  }
LABEL_4:
  v6 = -[PXMemoryDiagnosticsViewController initWithMemory:]([PXMemoryDiagnosticsViewController alloc], "initWithMemory:", v5);
  -[PXCuratedAssetCollectionDiagnosticsViewController setShouldPresentTapToRadar:](v6, "setShouldPresentTapToRadar:", 1);
  -[PXHighlightDiagnosticsViewController radarAttachmentURLs](v6, "radarAttachmentURLs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXActionPerformer hostViewController](self, "hostViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "creationType") == 1)
  {
    +[PXGenerativeStoryTTRWorkflowBuilder presentViewController:memory:attachmentFileUrls:](PXGenerativeStoryTTRWorkflowBuilder, "presentViewController:memory:attachmentFileUrls:", v8, v5, v7);
    -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 1, 0);
  }
  if (objc_msgSend(v5, "creationType"))
    goto LABEL_17;
  v9 = self;
  v10 = v8;
  v11 = 4;
  v12 = v7;
LABEL_16:
  -[PXPhotoKitAssetCollectionFileRadarActionPerformer _presentTTRWorkFlowInViewController:context:attachmentImageUrls:attachmentFileUrls:](v9, "_presentTTRWorkFlowInViewController:context:attachmentImageUrls:attachmentFileUrls:", v10, v11, 0, v12);
LABEL_17:

LABEL_18:
}

- (void)_presentTTRWorkFlowInViewController:(id)a3 context:(int64_t)a4 attachmentImageUrls:(id)a5 attachmentFileUrls:(id)a6
{
  +[PXTTRWorkflowFactory presentDefaultWorkFlowInViewController:withContext:attachmentImageUrls:attachmentFileUrls:](PXTTRWorkflowFactory, "presentDefaultWorkFlowInViewController:withContext:attachmentImageUrls:attachmentFileUrls:", a3, a4, a5, a6);
  -[PXActionPerformer completeUserInteractionTaskWithSuccess:error:](self, "completeUserInteractionTaskWithSuccess:error:", 1, 0);
}

uint64_t __79__PXPhotoKitAssetCollectionFileRadarActionPerformer_performUserInteractionTask__block_invoke(uint64_t a1)
{
  void *v2;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeItemAtURL:error:", *(_QWORD *)(a1 + 32), 0);

  }
  return objc_msgSend(*(id *)(a1 + 40), "completeUserInteractionTaskWithSuccess:error:", 1, 0);
}

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  void *v4;
  char v5;

  +[PXRootSettings sharedInstance](PXRootSettings, "sharedInstance", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "canShowInternalUI");

  return v5;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 assetCollectionReference:(id)a4 withInputs:(id)a5
{
  void *v6;
  __CFString *v7;
  __CFString *v8;

  objc_msgSend(a4, "assetCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v6, "creationType") == 1)
  {
    v7 = CFSTR("File MC Radar");
  }
  else
  {
    v8 = CFSTR("File Radar");
    if (a3 == 2)
      v8 = CFSTR("(Internal) File Radar");
    v7 = v8;
  }

  return v7;
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
