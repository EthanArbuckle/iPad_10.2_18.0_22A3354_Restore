@implementation PXPhotoKitAssetCollectionBlacklistMemoryFeatureActionPerformer

- (void)confirmBlacklistingUserAction:(id)a3 viewSpec:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];

  v6 = a4;
  v7 = a3;
  -[PXPhotoKitAssetCollectionBlacklistMemoryFeatureActionPerformer setIsBlockingMemoryFeature:](self, "setIsBlockingMemoryFeature:", 1);
  -[PXPhotoKitAssetCollectionBlacklistMemoryFeatureActionPerformer setUserResponse:](self, "setUserResponse:", v7);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __105__PXPhotoKitAssetCollectionBlacklistMemoryFeatureActionPerformer_confirmBlacklistingUserAction_viewSpec___block_invoke;
  v8[3] = &unk_1E5147360;
  v8[4] = self;
  -[PXPhotoKitAssetCollectionActionPerformer _promptBlacklistingConfirmatonForUserAction:viewSpec:completionHandler:](self, "_promptBlacklistingConfirmatonForUserAction:viewSpec:completionHandler:", v7, v6, v8);

}

- (void)performUserInteractionTask
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[PXActionPerformer actionType](self, "actionType");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[PXAssetCollectionActionPerformer assetCollection](self, "assetCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotoKitAssetCollectionBlacklistMemoryFeatureActionPerformer _memoryFeatureFromMemory:forActionType:](self, "_memoryFeatureFromMemory:forActionType:", v3, v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("PXAssetCollectionActionTypeBlockMemoryFeaturePerson")))
  {
    -[PXPhotoKitAssetCollectionBlacklistMemoryFeatureActionPerformer suggestLessPeopleInMemory:](self, "suggestLessPeopleInMemory:", v3);
  }
  else
  {
    +[PXMemoriesBlacklistUtilities accessoryUIViewSpecForBlacklistedFeature:](PXMemoriesBlacklistUtilities, "accessoryUIViewSpecForBlacklistedFeature:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotoKitAssetCollectionBlacklistMemoryFeatureActionPerformer confirmBlacklistingUserAction:viewSpec:](self, "confirmBlacklistingUserAction:viewSpec:", v6, v5);

  }
}

- (BOOL)suggestLessPeopleHelper:(id)a3 presentViewController:(id)a4
{
  return -[PXActionPerformer presentViewController:](self, "presentViewController:", a4);
}

- (BOOL)suggestLessPeopleHelper:(id)a3 dismissViewController:(id)a4 completionHandler:(id)a5
{
  return -[PXActionPerformer dismissViewController:completionHandler:](self, "dismissViewController:completionHandler:", a4, a5);
}

- (void)suggestLessPeopleInMemory:(id)a3
{
  id v4;
  PXSuggestLessPeopleHelper *v5;
  void *v6;
  PXSuggestLessPeopleHelper *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  _QWORD v30[5];
  id v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = [PXSuggestLessPeopleHelper alloc];
  -[PXActionPerformer undoManager](self, "undoManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PXSuggestLessPeopleHelper initWithUndoManager:](v5, "initWithUndoManager:", v6);
  -[PXPhotoKitAssetCollectionBlacklistMemoryFeatureActionPerformer setSuggestLessPeopleHelper:](self, "setSuggestLessPeopleHelper:", v7);

  -[PXPhotoKitAssetCollectionBlacklistMemoryFeatureActionPerformer suggestLessPeopleHelper](self, "suggestLessPeopleHelper");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDelegate:", self);

  objc_msgSend(v4, "photoLibrary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "librarySpecificFetchOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD1570], "px_defaultDetectionTypes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setIncludedDetectionTypes:", v11);

  v32[0] = *MEMORY[0x1E0CD1D60];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFetchPropertySets:", v12);

  objc_msgSend(v10, "setPersonContext:", 3);
  objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsForAssetCollection:options:", v4, v10);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "fetchedObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXPeopleWidgetUtilities verifiedPersonsFromMergeCandidatesForPersons:](PXPeopleWidgetUtilities, "verifiedPersonsFromMergeCandidatesForPersons:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "allObjects");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "blockableFeatures");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXPeopleUtilities sortedPersons:byPersonMemoryFeatures:](PXPeopleUtilities, "sortedPersons:byPersonMemoryFeatures:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setFetchLimit:", 0);
  v18 = objc_alloc(MEMORY[0x1E0CD1620]);
  objc_msgSend(v4, "photoLibrary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD16C0], "fetchType");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v10, "fetchPropertySets");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setWithArray:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v18, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v17, v19, v20, v23, 0, 0);

  -[PXActionPerformer undoManager](self, "undoManager");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "beginUndoGrouping");

  -[PXPhotoKitAssetCollectionBlacklistMemoryFeatureActionPerformer suggestLessPeopleHelper](self, "suggestLessPeopleHelper");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "fetchedObjects");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __92__PXPhotoKitAssetCollectionBlacklistMemoryFeatureActionPerformer_suggestLessPeopleInMemory___block_invoke;
  v30[3] = &unk_1E5147B40;
  v30[4] = self;
  v31 = v4;
  v28 = v4;
  objc_msgSend(v26, "suggestLessPeople:completionHandler:", v27, v30);

}

- (unint64_t)_memoryFeatureTypeFromActionType:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PXAssetCollectionActionTypeBlockMemoryFeatureTimeDate")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("PXAssetCollectionActionTypeBlockMemoryFeatureHoliday")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("PXAssetCollectionActionTypeBlockMemoryFeatureTimeDateInterval")) & 1) != 0)
  {
    v4 = 1008;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PXAssetCollectionActionTypeBlockMemoryFeaturePlace")) & 1) != 0)
  {
    v4 = 520192;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("PXAssetCollectionActionTypeBlockMemoryFeaturePerson")))
  {
    v4 = 3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_memoryFeatureFromMemory:(id)a3 forActionType:(id)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[PXPhotoKitAssetCollectionBlacklistMemoryFeatureActionPerformer _memoryFeatureTypeFromActionType:](self, "_memoryFeatureTypeFromActionType:", a4);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v6, "blockableFeatures", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((objc_msgSend(v13, "type") & v7) != 0)
        {
          v14 = v13;
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v10)
        continue;
      break;
    }
  }
  v14 = 0;
LABEL_11:

  return v14;
}

- (void)performBackgroundTask
{
  void *v3;
  int v4;
  id v5;

  +[PXPhotosDetailsSettings sharedInstance](PXPhotosDetailsSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "addToTabSimulate");

  if (v4)
  {
    -[PXActionPerformer completeBackgroundTaskWithSuccess:error:](self, "completeBackgroundTaskWithSuccess:error:", 1, 0);
  }
  else if (-[PXPhotoKitAssetCollectionBlacklistMemoryFeatureActionPerformer isBlockingMemoryFeature](self, "isBlockingMemoryFeature"))
  {
    -[PXActionPerformer actionType](self, "actionType");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[PXPhotoKitAssetCollectionBlacklistMemoryFeatureActionPerformer applyBlacklistFeatureWithActionType:](self, "applyBlacklistFeatureWithActionType:", v5);

  }
}

- (void)applyBlacklistFeatureWithActionType:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  PXRejectMemoriesAction *v7;
  void *v8;
  PXRejectMemoriesAction *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  PXPhotoKitAssetCollectionBlacklistMemoryFeatureActionPerformer *v14;
  unint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXAssetCollectionActionPerformer assetCollection](self, "assetCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PXPhotoKitAssetCollectionBlacklistMemoryFeatureActionPerformer _memoryFeatureTypeFromActionType:](self, "_memoryFeatureTypeFromActionType:", v4);

  v7 = [PXRejectMemoriesAction alloc];
  v16[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PXMemoriesAction initWithMemories:](v7, "initWithMemories:", v8);

  -[PXRejectMemoriesAction setFeatureType:](v9, "setFeatureType:", v6);
  -[PXRejectMemoriesAction setRejectReason:](v9, "setRejectReason:", 1);
  -[PXActionPerformer undoManager](self, "undoManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __102__PXPhotoKitAssetCollectionBlacklistMemoryFeatureActionPerformer_applyBlacklistFeatureWithActionType___block_invoke;
  v12[3] = &unk_1E51376D8;
  v13 = v5;
  v14 = self;
  v15 = v6;
  v11 = v5;
  -[PXAction executeWithUndoManager:completionHandler:](v9, "executeWithUndoManager:completionHandler:", v10, v12);

}

- (NSString)userResponse
{
  return self->_userResponse;
}

- (void)setUserResponse:(id)a3
{
  objc_storeStrong((id *)&self->_userResponse, a3);
}

- (BOOL)isBlockingMemoryFeature
{
  return self->_isBlockingMemoryFeature;
}

- (void)setIsBlockingMemoryFeature:(BOOL)a3
{
  self->_isBlockingMemoryFeature = a3;
}

- (PXSuggestLessPeopleHelper)suggestLessPeopleHelper
{
  return self->_suggestLessPeopleHelper;
}

- (void)setSuggestLessPeopleHelper:(id)a3
{
  objc_storeStrong((id *)&self->_suggestLessPeopleHelper, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestLessPeopleHelper, 0);
  objc_storeStrong((id *)&self->_userResponse, 0);
}

void __102__PXPhotoKitAssetCollectionBlacklistMemoryFeatureActionPerformer_applyBlacklistFeatureWithActionType___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if ((_DWORD)a2)
  {
    v6 = *MEMORY[0x1E0D09818];
    v14[0] = *(_QWORD *)(a1 + 32);
    v7 = *MEMORY[0x1E0D09830];
    v13[0] = v6;
    v13[1] = v7;
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D09910], "sendEvent:withPayload:", CFSTR("com.apple.photos.CPAnalytics.assetCollectionBlocked"), v10);
    v11 = (void *)MEMORY[0x1E0D09910];
    PXAnalyticsEventFromMemoryFeatureType(*(_QWORD *)(a1 + 48));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "sendEvent:withPayload:", v12, v10);

  }
  objc_msgSend(*(id *)(a1 + 40), "completeBackgroundTaskWithSuccess:error:", a2, v5);

}

void __92__PXPhotoKitAssetCollectionBlacklistMemoryFeatureActionPerformer_suggestLessPeopleInMemory___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  PXRejectMemoriesAction *v6;
  void *v7;
  PXRejectMemoriesAction *v8;
  PXRejectMemoriesAction *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    PLUIGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v5;
      _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_ERROR, "Could not suggest this person less: %@", buf, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", a2, v5);
    objc_msgSend(*(id *)(a1 + 32), "undoManager");
    v9 = (PXRejectMemoriesAction *)objc_claimAutoreleasedReturnValue();
    -[PXRejectMemoriesAction endUndoGrouping](v9, "endUndoGrouping");
  }
  else
  {
    v6 = [PXRejectMemoriesAction alloc];
    v12 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v12, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PXMemoriesAction initWithMemories:](v6, "initWithMemories:", v7);

    v11 = *(id *)(a1 + 40);
    v9 = v8;
    px_dispatch_on_main_queue();

  }
}

void __92__PXPhotoKitAssetCollectionBlacklistMemoryFeatureActionPerformer_suggestLessPeopleInMemory___block_invoke_696(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "undoManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __92__PXPhotoKitAssetCollectionBlacklistMemoryFeatureActionPerformer_suggestLessPeopleInMemory___block_invoke_2;
  v6[3] = &unk_1E5147B40;
  v4 = *(id *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 40);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v2, "executeWithUndoManager:completionHandler:", v3, v6);

}

void __92__PXPhotoKitAssetCollectionBlacklistMemoryFeatureActionPerformer_suggestLessPeopleInMemory___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  uint64_t v13;
  void *v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PLMemoriesGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((_DWORD)a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v15 = 138412290;
      v16 = v8;
      v9 = "Did reject memory: %@";
      v10 = v7;
      v11 = OS_LOG_TYPE_DEFAULT;
      v12 = 12;
LABEL_6:
      _os_log_impl(&dword_1A6789000, v10, v11, v9, (uint8_t *)&v15, v12);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v13 = *(_QWORD *)(a1 + 32);
    v15 = 138412546;
    v16 = v13;
    v17 = 2112;
    v18 = v5;
    v9 = "Failed to reject memory: %@, error: %@";
    v10 = v7;
    v11 = OS_LOG_TYPE_ERROR;
    v12 = 22;
    goto LABEL_6;
  }

  objc_msgSend(*(id *)(a1 + 40), "completeUserInteractionTaskWithSuccess:error:", a2, v5);
  objc_msgSend(*(id *)(a1 + 40), "undoManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "endUndoGrouping");

}

void __105__PXPhotoKitAssetCollectionBlacklistMemoryFeatureActionPerformer_confirmBlacklistingUserAction_viewSpec___block_invoke(uint64_t a1, int a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "completeUserInteractionTaskWithSuccess:error:", 1, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "px_genericErrorWithDebugDescription:", CFSTR("User cancelled confirmation alert"));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "completeUserInteractionTaskWithSuccess:error:", 0, v3);

  }
}

+ (BOOL)canPerformOnAssetCollectionReference:(id)a3 withInputs:(id)a4
{
  void *v4;
  char isKindOfClass;

  objc_msgSend(a3, "assetCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (id)createActivityWithTitle:(id)a3 actionType:(id)a4 actionSystemImageName:(id)a5
{
  return 0;
}

@end
