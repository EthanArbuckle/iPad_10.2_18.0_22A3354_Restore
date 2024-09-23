@implementation PXSharedLibrarySourceLibraryInfoMock

- (void)fetchSuggestedStartDateForPersonUUIDs:(id)a3 completion:(id)a4
{
  id v4;
  id v5;
  _QWORD block[4];
  id v7;

  v4 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__PXSharedLibrarySourceLibraryInfoMock_fetchSuggestedStartDateForPersonUUIDs_completion___block_invoke;
  block[3] = &unk_1E5148A40;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)fetchEstimatedAssetsCountsForStartDate:(id)a3 personUUIDs:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  _QWORD block[4];
  id v11;

  v7 = a5;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibrarySourceLibraryInfoMock.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __102__PXSharedLibrarySourceLibraryInfoMock_fetchEstimatedAssetsCountsForStartDate_personUUIDs_completion___block_invoke;
  block[3] = &unk_1E5148A40;
  v11 = v7;
  v8 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)fetchEstimatedAssetsCountsShareEverythingPolicyWithCompletion:(id)a3
{
  id v5;
  id v6;
  void *v7;
  _QWORD block[4];
  id v9;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibrarySourceLibraryInfoMock.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __102__PXSharedLibrarySourceLibraryInfoMock_fetchEstimatedAssetsCountsShareEverythingPolicyWithCompletion___block_invoke;
  block[3] = &unk_1E5148A40;
  v9 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)fetchEstimatedAssetsCountsForExit:(BOOL)a3 imageCount:(unint64_t *)a4 videoCount:(unint64_t *)a5 audioCount:(unint64_t *)a6 itemCount:(unint64_t *)a7
{
  *a4 = 250;
  *a5 = 125;
}

- (id)createDataSourceManager
{
  return 0;
}

- (id)pickerConfiguration
{
  return objc_alloc_init(MEMORY[0x1E0CD2168]);
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)assetsCountsForAssetLocalIdentifiers:(SEL)a3
{
  *retstr = *($F99D9A4FB75BC57F3386B8DC8EE08D7A *)off_1E50B7ED8;
  return self;
}

- (BOOL)isSystemPhotoLibrary
{
  return 1;
}

- (BOOL)isCloudPhotoLibraryEnabled
{
  return 1;
}

- (BOOL)isCloudPhotoLibraryExiting
{
  return 0;
}

- (BOOL)isCloudPhotoLibraryInitialSyncCompleted
{
  return 1;
}

- (PXSharedLibraryStatusProvider)sharedLibraryStatusProvider
{
  void *v2;
  void *v3;
  void *v4;

  -[PXSharedLibrarySourceLibraryInfoMock pickerConfiguration](self, "pickerConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:](PXSharedLibraryStatusProvider, "sharedLibraryStatusProviderWithPhotoLibrary:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXSharedLibraryStatusProvider *)v4;
}

- (void)createSharedLibraryWithEmailAddresses:(id)a3 phoneNumbers:(id)a4 autoSharePolicy:(int64_t)a5 startDate:(id)a6 personUUIDs:(id)a7 progress:(id)a8 presentationEnvironment:(id)a9 withCompletionHandler:(id)a10
{
  (*((void (**)(id, _QWORD, _QWORD))a10 + 2))(a10, 0, 0);
}

- (void)createPreviewWithEmailAddresses:(id)a3 phoneNumbers:(id)a4 autoSharePolicy:(int64_t)a5 startDate:(id)a6 personUUIDs:(id)a7 progress:(id)a8 presentationEnvironment:(id)a9 withCompletionHandler:(id)a10
{
  (*((void (**)(id, _QWORD, _QWORD))a10 + 2))(a10, 0, 0);
}

- (BOOL)presentCustomInformationForError:(id)a3 customTitle:(id *)a4 customMessage:(id *)a5
{
  id v9;
  _BOOL4 v10;
  void *v12;
  void *v13;

  v9 = a3;
  if (a4)
  {
    if (a5)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibrarySourceLibraryInfoMock.m"), 95, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("customTitle"));

    if (a5)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibrarySourceLibraryInfoMock.m"), 96, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("customMessage"));

LABEL_3:
  v10 = -[PXSharedLibrarySourceLibraryInfoMock isSharedLibraryNotFoundError:](self, "isSharedLibraryNotFoundError:", v9);
  if (v10)
  {
    PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryFetchInvitationFailureAlertTitle_Permanent"));
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    *a5 = 0;
  }

  return v10;
}

- (BOOL)presentServerGeneratedMessageForError:(id)a3 customMessage:(id *)a4 learnMoreURL:(id *)a5
{
  return 0;
}

- (BOOL)isSharedLibraryNotFoundError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("PXSharedLibraryErrorDomain")))
      v6 = objc_msgSend(v4, "code") == -1002;
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isFailedToURLFetchOwnedSharedLibraryError:(id)a3
{
  return 0;
}

uint64_t __102__PXSharedLibrarySourceLibraryInfoMock_fetchEstimatedAssetsCountsShareEverythingPolicyWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  __int128 v5;
  uint64_t v6;

  v3 = *(_QWORD *)(a1 + 32);
  v5 = xmmword_1A7C0C4B0;
  v6 = 0;
  return (*(uint64_t (**)(uint64_t, __int128 *, uint64_t))(v3 + 16))(v3, &v5, a3);
}

uint64_t __102__PXSharedLibrarySourceLibraryInfoMock_fetchEstimatedAssetsCountsForStartDate_personUUIDs_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  __int128 v5;
  uint64_t v6;

  v3 = *(_QWORD *)(a1 + 32);
  v5 = xmmword_1A7C0C4C0;
  v6 = 0;
  return (*(uint64_t (**)(uint64_t, __int128 *, uint64_t))(v3 + 16))(v3, &v5, a3);
}

void __89__PXSharedLibrarySourceLibraryInfoMock_fetchSuggestedStartDateForPersonUUIDs_completion___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

@end
