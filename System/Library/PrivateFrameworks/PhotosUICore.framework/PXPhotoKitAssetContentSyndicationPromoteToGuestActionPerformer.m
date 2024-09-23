@implementation PXPhotoKitAssetContentSyndicationPromoteToGuestActionPerformer

+ (BOOL)canPerformOnAsset:(id)a3 inAssetCollection:(id)a4 person:(id)a5 socialGroup:(id)a6
{
  id v6;
  void *v7;
  uint64_t v8;
  int v9;

  v6 = a3;
  objc_msgSend(v6, "photoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "wellKnownPhotoLibraryIdentifier");

  if (v8 == 3)
    v9 = objc_msgSend(v6, "isGuestAsset") ^ 1;
  else
    LOBYTE(v9) = 0;

  return v9;
}

+ (id)localizedTitleForUseCase:(unint64_t)a3 actionManager:(id)a4
{
  return CFSTR("Promote To Guest");
}

+ (id)systemImageNameForActionManager:(id)a3
{
  return CFSTR("sparkles.rectangle.stack");
}

- (BOOL)requiresUnlockedDevice
{
  return 1;
}

- (void)performBackgroundTask
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  _QWORD v8[4];
  id v9;

  -[PXPhotoKitAssetActionPerformer assets](self, "assets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v7[4] = self;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __87__PXPhotoKitAssetContentSyndicationPromoteToGuestActionPerformer_performBackgroundTask__block_invoke;
  v8[3] = &unk_1E5149198;
  v9 = v3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __87__PXPhotoKitAssetContentSyndicationPromoteToGuestActionPerformer_performBackgroundTask__block_invoke_2;
  v7[3] = &unk_1E5148B78;
  v6 = v3;
  objc_msgSend(v5, "performChanges:completionHandler:", v8, v7);

}

void __87__PXPhotoKitAssetContentSyndicationPromoteToGuestActionPerformer_performBackgroundTask__block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(MEMORY[0x1E0CD13B0], "changeRequestForAsset:", *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v5), (_QWORD)v7);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "promoteToGuestAsset");

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

void __87__PXPhotoKitAssetContentSyndicationPromoteToGuestActionPerformer_performBackgroundTask__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  px_dispatch_on_main_queue();

}

uint64_t __87__PXPhotoKitAssetContentSyndicationPromoteToGuestActionPerformer_performBackgroundTask__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeBackgroundTaskWithSuccess:error:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

@end
