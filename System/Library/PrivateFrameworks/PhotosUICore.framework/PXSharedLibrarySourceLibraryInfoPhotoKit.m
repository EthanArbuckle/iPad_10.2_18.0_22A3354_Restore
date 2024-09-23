@implementation PXSharedLibrarySourceLibraryInfoPhotoKit

- (PXSharedLibrarySourceLibraryInfoPhotoKit)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibrarySourceLibraryInfoPhotoKit.m"), 34, CFSTR("%s is not available as initializer"), "-[PXSharedLibrarySourceLibraryInfoPhotoKit init]");

  abort();
}

- (PXSharedLibrarySourceLibraryInfoPhotoKit)initWithPhotoLibrary:(id)a3
{
  id v6;
  PXSharedLibrarySourceLibraryInfoPhotoKit *v7;
  PXSharedLibrarySourceLibraryInfoPhotoKit *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibrarySourceLibraryInfoPhotoKit.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

  }
  v11.receiver = self;
  v11.super_class = (Class)PXSharedLibrarySourceLibraryInfoPhotoKit;
  v7 = -[PXSharedLibrarySourceLibraryInfoPhotoKit init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_photoLibrary, a3);

  return v8;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[PXSharedLibrarySourceLibraryInfoPhotoKit photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p, photoLibrary:\"%@\">"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (OS_dispatch_queue)queue
{
  OS_dispatch_queue *queue;
  NSObject *v4;
  NSObject *v5;
  OS_dispatch_queue *v6;
  OS_dispatch_queue *v7;

  queue = self->_queue;
  if (!queue)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_USER_INITIATED, 0);
    v5 = objc_claimAutoreleasedReturnValue();

    v6 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.photos.sourcelibraryinfo.fetch", v5);
    v7 = self->_queue;
    self->_queue = v6;

    queue = self->_queue;
  }
  return queue;
}

- (void)fetchSuggestedStartDateForPersonUUIDs:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = a4;
  -[PXSharedLibrarySourceLibraryInfoPhotoKit photoLibrary](self, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "librarySpecificFetchOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXSharedLibrarySourceLibraryInfoPhotoKit queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__PXSharedLibrarySourceLibraryInfoPhotoKit_fetchSuggestedStartDateForPersonUUIDs_completion___block_invoke;
  block[3] = &unk_1E5145688;
  v15 = v6;
  v16 = v9;
  v17 = v7;
  v11 = v7;
  v12 = v9;
  v13 = v6;
  dispatch_async(v10, block);

}

- (void)fetchEstimatedAssetsCountsForStartDate:(id)a3 personUUIDs:(id)a4 completion:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  _QWORD block[4];
  id v21;
  id v22;
  id v23;
  id v24;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibrarySourceLibraryInfoPhotoKit.m"), 92, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  -[PXSharedLibrarySourceLibraryInfoPhotoKit photoLibrary](self, "photoLibrary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "librarySpecificFetchOptions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXSharedLibrarySourceLibraryInfoPhotoKit queue](self, "queue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __106__PXSharedLibrarySourceLibraryInfoPhotoKit_fetchEstimatedAssetsCountsForStartDate_personUUIDs_completion___block_invoke;
  block[3] = &unk_1E5148370;
  v21 = v9;
  v22 = v10;
  v23 = v13;
  v24 = v11;
  v15 = v11;
  v16 = v13;
  v17 = v10;
  v18 = v9;
  dispatch_async(v14, block);

}

- (void)fetchEstimatedAssetsCountsShareEverythingPolicyWithCompletion:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD block[4];
  id v13;
  id v14;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibrarySourceLibraryInfoPhotoKit.m"), 126, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completion"));

  }
  -[PXSharedLibrarySourceLibraryInfoPhotoKit photoLibrary](self, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "librarySpecificFetchOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXSharedLibrarySourceLibraryInfoPhotoKit queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __106__PXSharedLibrarySourceLibraryInfoPhotoKit_fetchEstimatedAssetsCountsShareEverythingPolicyWithCompletion___block_invoke;
  block[3] = &unk_1E5148CE0;
  v13 = v7;
  v14 = v5;
  v9 = v5;
  v10 = v7;
  dispatch_async(v8, block);

}

- (void)fetchEstimatedAssetsCountsForExit:(BOOL)a3 imageCount:(unint64_t *)a4 videoCount:(unint64_t *)a5 audioCount:(unint64_t *)a6 itemCount:(unint64_t *)a7
{
  _BOOL8 v11;
  void *v12;
  id v13;

  v11 = a3;
  -[PXSharedLibrarySourceLibraryInfoPhotoKit photoLibrary](self, "photoLibrary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "librarySpecificFetchOptions");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setIncludeHiddenAssets:", 1);
  objc_msgSend(v13, "setIncludeTrashedAssets:", 1);
  objc_msgSend(MEMORY[0x1E0CD15E0], "estimatedAssetCountToMoveForExitRetentionPolicyContributedOnly:imageCount:videoCount:audioCount:itemCount:options:error:", v11, a4, a5, a6, a7, v13, 0);

}

- (id)createDataSourceManager
{
  void *v2;
  void *v3;
  void *v4;
  PXPhotosDataSourceConfiguration *v5;
  PXPhotosDataSource *v6;
  PXPhotoKitAssetsDataSourceManager *v7;

  -[PXSharedLibrarySourceLibraryInfoPhotoKit photoLibrary](self, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 2, 209, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PXPhotosDataSourceConfiguration initWithCollectionListFetchResult:options:]([PXPhotosDataSourceConfiguration alloc], "initWithCollectionListFetchResult:options:", v4, 0);
  v6 = -[PXPhotosDataSource initWithPhotosDataSourceConfiguration:]([PXPhotosDataSource alloc], "initWithPhotosDataSourceConfiguration:", v5);
  v7 = -[PXPhotoKitAssetsDataSourceManager initWithPhotosDataSource:]([PXPhotoKitAssetsDataSourceManager alloc], "initWithPhotosDataSource:", v6);

  return v7;
}

- (id)pickerConfiguration
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CD2168]);
  -[PXSharedLibrarySourceLibraryInfoPhotoKit photoLibrary](self, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithPhotoLibraryAndOnlyReturnsIdentifiers:", v4);

  objc_msgSend(v5, "setDisabledCapabilities:", 16);
  objc_msgSend(v5, "_setDisabledPrivateCapabilities:", 4);
  return v5;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)assetsCountsForAssetLocalIdentifiers:(SEL)a3
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  $F99D9A4FB75BC57F3386B8DC8EE08D7A *result;
  id v14;

  v6 = (void *)MEMORY[0x1E0CD1390];
  v7 = a4;
  -[PXSharedLibrarySourceLibraryInfoPhotoKit photoLibrary](self, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "librarySpecificFetchOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchAssetsWithLocalIdentifiers:options:", v7, v9);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2 = 0;
  v10 = objc_msgSend(v14, "countOfAssetsWithMediaType:", 1);
  v11 = objc_msgSend(v14, "countOfAssetsWithMediaType:", 2);
  v12 = objc_msgSend(v14, "countOfAssetsWithMediaType:", 3);
  retstr->var0 = v10;
  retstr->var1 = v11;
  retstr->var2 = v12;

  return result;
}

- (BOOL)isSystemPhotoLibrary
{
  void *v2;
  char v3;

  -[PXSharedLibrarySourceLibraryInfoPhotoKit photoLibrary](self, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSystemPhotoLibrary");

  return v3;
}

- (BOOL)isCloudPhotoLibraryEnabled
{
  void *v2;
  char v3;

  -[PXSharedLibrarySourceLibraryInfoPhotoKit photoLibrary](self, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCloudPhotoLibraryEnabled");

  return v3;
}

- (BOOL)isCloudPhotoLibraryExiting
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[PXSharedLibrarySourceLibraryInfoPhotoKit photoLibrary](self, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cplStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exitDeleteTime");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (BOOL)isCloudPhotoLibraryInitialSyncCompleted
{
  void *v2;
  void *v3;
  void *v4;

  -[PXSharedLibrarySourceLibraryInfoPhotoKit photoLibrary](self, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cplStatus");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "initialSyncDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = v4 != 0;

  return (char)v2;
}

- (PXSharedLibraryStatusProvider)sharedLibraryStatusProvider
{
  void *v2;
  void *v3;

  -[PXSharedLibrarySourceLibraryInfoPhotoKit photoLibrary](self, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:](PXSharedLibraryStatusProvider, "sharedLibraryStatusProviderWithPhotoLibrary:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PXSharedLibraryStatusProvider *)v3;
}

- (void)createSharedLibraryWithEmailAddresses:(id)a3 phoneNumbers:(id)a4 autoSharePolicy:(int64_t)a5 startDate:(id)a6 personUUIDs:(id)a7 progress:(id)a8 presentationEnvironment:(id)a9 withCompletionHandler:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  __int16 v24;
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;

  v17 = a10;
  v18 = a9;
  v19 = a8;
  v20 = a7;
  v21 = a6;
  v22 = a4;
  v23 = a3;
  if (a5 == 2)
    v24 = 2;
  else
    v24 = a5 == 1;
  -[PXSharedLibrarySourceLibraryInfoPhotoKit photoLibrary](self, "photoLibrary");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __188__PXSharedLibrarySourceLibraryInfoPhotoKit_createSharedLibraryWithEmailAddresses_phoneNumbers_autoSharePolicy_startDate_personUUIDs_progress_presentationEnvironment_withCompletionHandler___block_invoke;
  v27[3] = &unk_1E5141AB8;
  v28 = v17;
  v26 = v17;
  PXSharedLibrarySetupLibraryScope(v25, v23, v22, v24, v21, v20, v19, v18, v27);

}

- (void)createPreviewWithEmailAddresses:(id)a3 phoneNumbers:(id)a4 autoSharePolicy:(int64_t)a5 startDate:(id)a6 personUUIDs:(id)a7 progress:(id)a8 presentationEnvironment:(id)a9 withCompletionHandler:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  __int16 v24;
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;

  v17 = a10;
  v18 = a9;
  v19 = a8;
  v20 = a7;
  v21 = a6;
  v22 = a4;
  v23 = a3;
  if (a5 == 2)
    v24 = 2;
  else
    v24 = a5 == 1;
  -[PXSharedLibrarySourceLibraryInfoPhotoKit photoLibrary](self, "photoLibrary");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __182__PXSharedLibrarySourceLibraryInfoPhotoKit_createPreviewWithEmailAddresses_phoneNumbers_autoSharePolicy_startDate_personUUIDs_progress_presentationEnvironment_withCompletionHandler___block_invoke;
  v27[3] = &unk_1E5141AB8;
  v28 = v17;
  v26 = v17;
  PXSharedLibraryCreatePreviewLibraryScope(v25, v23, v22, v24, v21, v20, v19, v18, v27);

}

- (BOOL)presentCustomInformationForError:(id)a3 customTitle:(id *)a4 customMessage:(id *)a5
{
  id v9;
  __CFString *v10;
  BOOL v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v9 = a3;
  if (a4)
  {
    if (a5)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibrarySourceLibraryInfoPhotoKit.m"), 245, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("customTitle"));

    if (a5)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibrarySourceLibraryInfoPhotoKit.m"), 246, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("customMessage"));

LABEL_3:
  if (-[PXSharedLibrarySourceLibraryInfoPhotoKit isSharedLibraryNotFoundError:](self, "isSharedLibraryNotFoundError:", v9))
  {
    PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryFetchInvitationFailureAlertTitle_Permanent"));
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    v10 = CFSTR("PXSharedLibraryFetchInvitationFailureAlertMessage_ShareNotFound");
  }
  else if (-[PXSharedLibrarySourceLibraryInfoPhotoKit _isU13RestrictedError:](self, "_isU13RestrictedError:", v9))
  {
    PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryAcceptInvitationFailureAlertTitle_Permanent"));
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    v10 = CFSTR("PXSharedLibraryAcceptInvitationFailureAlertMessage_U13Restricted");
  }
  else if (-[PXSharedLibrarySourceLibraryInfoPhotoKit _isRegionUnsupportedError:](self, "_isRegionUnsupportedError:", v9))
  {
    PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryAcceptInvitationFailureAlertTitle_Permanent"));
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    v10 = CFSTR("PXSharedLibraryAcceptInvitationFailureAlertMessage_RegionUnsupported");
  }
  else
  {
    if (-[PXSharedLibrarySourceLibraryInfoPhotoKit _isTooManyParticipantsError:](self, "_isTooManyParticipantsError:", v9))
    {
      PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryAddParticipantsFailureAlertTitle_TooManyParticipants"));
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1E0CB3940];
      PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryAddParticipantsFailureAlertMessageFormat_%lu_TooManyParticipants"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringWithFormat:", v14, 5);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    }
    if (!-[PXSharedLibrarySourceLibraryInfoPhotoKit _isCPLExitModeError:](self, "_isCPLExitModeError:", v9))
    {
      v11 = 0;
      goto LABEL_11;
    }
    PXLocalizedSharedLibraryString(CFSTR("PXSharedLibraryPublishFailureAlertTitle_CPLExitMode"));
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    v10 = CFSTR("PXSharedLibraryPublishFailureAlertMessage_CPLExitMode");
  }
  PXLocalizedSharedLibraryString(v10);
  *a5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:
  v11 = 1;
LABEL_11:

  return v11;
}

- (BOOL)presentServerGeneratedMessageForError:(id)a3 customMessage:(id *)a4 learnMoreURL:(id *)a5
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v16;
  void *v17;

  v9 = a3;
  if (a4)
  {
    if (a5)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibrarySourceLibraryInfoPhotoKit.m"), 278, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("customMessage"));

    if (a5)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibrarySourceLibraryInfoPhotoKit.m"), 279, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("learnMoreURL"));

LABEL_3:
  objc_msgSend(v9, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1DF0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "userInfo");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0CD1C80]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v11, "length");
  if (v14)
  {
    *a4 = objc_retainAutorelease(v11);
    *a5 = objc_retainAutorelease(v13);
  }

  return v14 != 0;
}

- (BOOL)isSharedLibraryNotFoundError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "domain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CD1D80]) && objc_msgSend(v4, "code") == 6003)
    {
      v6 = 1;
    }
    else
    {
      objc_msgSend(v4, "domain");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqualToString:", CFSTR("PXSharedLibraryErrorDomain")))
        v6 = objc_msgSend(v4, "code") == -1002;
      else
        v6 = 0;

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isFailedToURLFetchOwnedSharedLibraryError:(id)a3
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
    if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CD1D80]))
      v6 = objc_msgSend(v4, "code") == 8505;
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_isU13RestrictedError:(id)a3
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
    if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CD1D80]))
      v6 = objc_msgSend(v4, "code") == 8503;
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_isRegionUnsupportedError:(id)a3
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
    if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CD1D80]))
      v6 = objc_msgSend(v4, "code") == 8504;
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_isTooManyParticipantsError:(id)a3
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
    if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CD1D80]))
      v6 = objc_msgSend(v4, "code") == 6011;
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_isCPLExitModeError:(id)a3
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
    if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CD1D80]))
      v6 = objc_msgSend(v4, "code") == 6007;
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __182__PXSharedLibrarySourceLibraryInfoPhotoKit_createPreviewWithEmailAddresses_phoneNumbers_autoSharePolicy_startDate_personUUIDs_progress_presentationEnvironment_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  PXSharedLibraryPhotoKit *v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    v3 = -[PXSharedLibraryPhotoKit initWithLibraryScope:]([PXSharedLibraryPhotoKit alloc], "initWithLibraryScope:", v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __188__PXSharedLibrarySourceLibraryInfoPhotoKit_createSharedLibraryWithEmailAddresses_phoneNumbers_autoSharePolicy_startDate_personUUIDs_progress_presentationEnvironment_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  PXSharedLibraryPhotoKit *v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    v3 = -[PXSharedLibraryPhotoKit initWithLibraryScope:]([PXSharedLibraryPhotoKit alloc], "initWithLibraryScope:", v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __106__PXSharedLibrarySourceLibraryInfoPhotoKit_fetchEstimatedAssetsCountsShareEverythingPolicyWithCompletion___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v3;
  __int128 v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;

  v6 = 0uLL;
  v7 = 0;
  _FetchCountsForRulesAndPolicy((uint64_t)&v6, MEMORY[0x1E0C9AA60], 1, *(_QWORD *)(a1 + 32));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __106__PXSharedLibrarySourceLibraryInfoPhotoKit_fetchEstimatedAssetsCountsShareEverythingPolicyWithCompletion___block_invoke_2;
  block[3] = &unk_1E5141A00;
  v3 = *(id *)(a1 + 40);
  v4 = v6;
  v5 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __106__PXSharedLibrarySourceLibraryInfoPhotoKit_fetchEstimatedAssetsCountsShareEverythingPolicyWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, __int128 *);
  __int128 v4;
  uint64_t v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(uint64_t (**)(uint64_t, __int128 *))(v1 + 16);
  v4 = *(_OWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 56);
  return v2(v1, &v4);
}

void __106__PXSharedLibrarySourceLibraryInfoPhotoKit_fetchEstimatedAssetsCountsForStartDate_personUUIDs_completion___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (*(_QWORD *)(a1 + 32))
  {
    v3 = objc_alloc_init(MEMORY[0x1E0CD1600]);
    PXSharedLibraryDateConditionForSelectedStartDate(*(void **)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addCondition:", v4);
    objc_msgSend(v2, "addObject:", v3);

  }
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CD1600]);
    PXSharedLibraryPersonConditionForSelectedPeople(*(void **)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addCondition:", v6);
    objc_msgSend(v2, "addObject:", v5);

  }
  v11 = *(_OWORD *)off_1E50B7EE0;
  v12 = *((_QWORD *)off_1E50B7EE0 + 2);
  if (objc_msgSend(v2, "count"))
    _FetchCountsForRulesAndPolicy((uint64_t)&v11, (uint64_t)v2, 2, *(_QWORD *)(a1 + 48));
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __106__PXSharedLibrarySourceLibraryInfoPhotoKit_fetchEstimatedAssetsCountsForStartDate_personUUIDs_completion___block_invoke_2;
  v7[3] = &unk_1E5141A00;
  v8 = *(id *)(a1 + 56);
  v9 = v11;
  v10 = v12;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

uint64_t __106__PXSharedLibrarySourceLibraryInfoPhotoKit_fetchEstimatedAssetsCountsForStartDate_personUUIDs_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, __int128 *);
  __int128 v4;
  uint64_t v5;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(uint64_t (**)(uint64_t, __int128 *))(v1 + 16);
  v4 = *(_OWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 56);
  return v2(v1, &v4);
}

void __93__PXSharedLibrarySourceLibraryInfoPhotoKit_fetchSuggestedStartDateForPersonUUIDs_completion___block_invoke(id *a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  void *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  if (!objc_msgSend(a1[4], "count"))
    goto LABEL_3;
  v2 = objc_alloc_init(MEMORY[0x1E0CD1600]);
  PXSharedLibraryPersonConditionForSelectedPeople(a1[4]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addCondition:", v3);
  v4 = (void *)MEMORY[0x1E0CD1600];
  v17[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suggestedStartDateForRules:autoSharePolicy:options:error:", v5, 2, a1[5], 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
LABEL_3:
    objc_msgSend(a1[5], "setFetchLimit:", 1);
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "setSortDescriptors:", v8);

    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", a1[5]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "creationDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93__PXSharedLibrarySourceLibraryInfoPhotoKit_fetchSuggestedStartDateForPersonUUIDs_completion___block_invoke_2;
  block[3] = &unk_1E5148CE0;
  v11 = a1[6];
  v14 = v6;
  v15 = v11;
  v12 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __93__PXSharedLibrarySourceLibraryInfoPhotoKit_fetchSuggestedStartDateForPersonUUIDs_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

@end
