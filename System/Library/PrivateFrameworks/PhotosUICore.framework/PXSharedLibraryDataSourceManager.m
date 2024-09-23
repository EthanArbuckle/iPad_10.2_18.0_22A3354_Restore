@implementation PXSharedLibraryDataSourceManager

+ (id)sharedLibraryDataSourceManagerForPhotoLibrary:(id)a3 type:(int64_t)a4
{
  id v5;
  PXSharedLibraryEmptyDataSourceManager *v6;
  PXSharedLibraryEmptyDataSourceManager *v7;

  v5 = a3;
  switch(a4)
  {
    case 0:
      +[PXSharedLibraryPhotoKitDataSourceManager sharedLibraryDataSourceManagerForPhotoLibrary:](PXSharedLibraryPhotoKitDataSourceManager, "sharedLibraryDataSourceManagerForPhotoLibrary:", v5);
      v6 = (PXSharedLibraryEmptyDataSourceManager *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1:
      +[PXSharedLibraryMockDataSourceManager ownerSharedLibraryDataSourceManager](PXSharedLibraryMockDataSourceManager, "ownerSharedLibraryDataSourceManager");
      v6 = (PXSharedLibraryEmptyDataSourceManager *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2:
      +[PXSharedLibraryMockDataSourceManager participantSharedLibraryDataSourceManager](PXSharedLibraryMockDataSourceManager, "participantSharedLibraryDataSourceManager");
      v6 = (PXSharedLibraryEmptyDataSourceManager *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 3:
      v6 = objc_alloc_init(PXSharedLibraryEmptyDataSourceManager);
LABEL_7:
      v7 = v6;
      break;
    default:
      v7 = 0;
      break;
  }

  return v7;
}

+ (id)previewDataSourceManagerForPhotoLibrary:(id)a3 type:(int64_t)a4
{
  id v5;
  PXSharedLibraryEmptyDataSourceManager *v6;
  PXSharedLibraryEmptyDataSourceManager *v7;

  v5 = a3;
  switch(a4)
  {
    case 0:
      +[PXSharedLibraryPhotoKitDataSourceManager previewDataSourceManagerForPhotoLibrary:](PXSharedLibraryPhotoKitDataSourceManager, "previewDataSourceManagerForPhotoLibrary:", v5);
      v6 = (PXSharedLibraryEmptyDataSourceManager *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1:
      +[PXSharedLibraryMockDataSourceManager ownerPreviewDataSourceManager](PXSharedLibraryMockDataSourceManager, "ownerPreviewDataSourceManager");
      v6 = (PXSharedLibraryEmptyDataSourceManager *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2:
      +[PXSharedLibraryMockDataSourceManager participantPreviewDataSourceManager](PXSharedLibraryMockDataSourceManager, "participantPreviewDataSourceManager");
      v6 = (PXSharedLibraryEmptyDataSourceManager *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 3:
      v6 = objc_alloc_init(PXSharedLibraryEmptyDataSourceManager);
LABEL_7:
      v7 = v6;
      break;
    default:
      v7 = 0;
      break;
  }

  return v7;
}

+ (id)invitationsDataSourceManagerForPhotoLibrary:(id)a3 type:(int64_t)a4
{
  id v5;
  PXSharedLibraryEmptyDataSourceManager *v6;
  PXSharedLibraryEmptyDataSourceManager *v7;

  v5 = a3;
  if (a4 == 2)
  {
    v6 = objc_alloc_init(PXSharedLibraryEmptyDataSourceManager);
  }
  else if (a4 == 1)
  {
    +[PXSharedLibraryMockDataSourceManager invitationsDataSourceManager](PXSharedLibraryMockDataSourceManager, "invitationsDataSourceManager");
    v6 = (PXSharedLibraryEmptyDataSourceManager *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a4)
    {
      v7 = 0;
      goto LABEL_9;
    }
    +[PXSharedLibraryPhotoKitDataSourceManager invitationsDataSourceManagerForPhotoLibrary:](PXSharedLibraryPhotoKitDataSourceManager, "invitationsDataSourceManagerForPhotoLibrary:", v5);
    v6 = (PXSharedLibraryEmptyDataSourceManager *)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;
LABEL_9:

  return v7;
}

+ (id)exitingDataSourceManagerForPhotoLibrary:(id)a3 type:(int64_t)a4
{
  id v5;
  PXSharedLibraryEmptyDataSourceManager *v6;
  PXSharedLibraryEmptyDataSourceManager *v7;

  v5 = a3;
  switch(a4)
  {
    case 0:
      +[PXSharedLibraryPhotoKitDataSourceManager exitingDataSourceManagerForPhotoLibrary:](PXSharedLibraryPhotoKitDataSourceManager, "exitingDataSourceManagerForPhotoLibrary:", v5);
      v6 = (PXSharedLibraryEmptyDataSourceManager *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 1:
      +[PXSharedLibraryMockDataSourceManager ownerExitingDataSourceManager](PXSharedLibraryMockDataSourceManager, "ownerExitingDataSourceManager");
      v6 = (PXSharedLibraryEmptyDataSourceManager *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2:
      +[PXSharedLibraryMockDataSourceManager participantExitingDataSourceManager](PXSharedLibraryMockDataSourceManager, "participantExitingDataSourceManager");
      v6 = (PXSharedLibraryEmptyDataSourceManager *)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 3:
      v6 = objc_alloc_init(PXSharedLibraryEmptyDataSourceManager);
LABEL_7:
      v7 = v6;
      break;
    default:
      v7 = 0;
      break;
  }

  return v7;
}

+ (id)currentSharedLibraryDataSourceManagerForPhotoLibrary:(id)a3
{
  id v4;
  PXSharedLibraryEmptyDataSourceManager *v5;
  void *v6;
  uint64_t v7;
  PXSharedLibraryEmptyDataSourceManager *v8;

  v4 = a3;
  if ((PLIsPhotosReliveWidget() & 1) != 0)
  {
    v5 = objc_alloc_init(PXSharedLibraryEmptyDataSourceManager);
  }
  else
  {
    +[PXSharedLibrarySettings sharedInstance](PXSharedLibrarySettings, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "sharedLibraryDataSourceType");

    objc_msgSend(a1, "sharedLibraryDataSourceManagerForPhotoLibrary:type:", v4, v7);
    v5 = (PXSharedLibraryEmptyDataSourceManager *)objc_claimAutoreleasedReturnValue();
  }
  v8 = v5;

  return v8;
}

+ (id)currentPreviewDataSourceManagerForPhotoLibrary:(id)a3
{
  id v4;
  PXSharedLibraryEmptyDataSourceManager *v5;
  void *v6;
  uint64_t v7;
  PXSharedLibraryEmptyDataSourceManager *v8;

  v4 = a3;
  if ((PLIsPhotosReliveWidget() & 1) != 0)
  {
    v5 = objc_alloc_init(PXSharedLibraryEmptyDataSourceManager);
  }
  else
  {
    +[PXSharedLibrarySettings sharedInstance](PXSharedLibrarySettings, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "previewDataSourceType");

    objc_msgSend(a1, "previewDataSourceManagerForPhotoLibrary:type:", v4, v7);
    v5 = (PXSharedLibraryEmptyDataSourceManager *)objc_claimAutoreleasedReturnValue();
  }
  v8 = v5;

  return v8;
}

+ (id)currentInvitationsDataSourceManagerForPhotoLibrary:(id)a3
{
  id v4;
  PXSharedLibraryEmptyDataSourceManager *v5;
  void *v6;
  uint64_t v7;
  PXSharedLibraryEmptyDataSourceManager *v8;

  v4 = a3;
  if ((PLIsPhotosReliveWidget() & 1) != 0)
  {
    v5 = objc_alloc_init(PXSharedLibraryEmptyDataSourceManager);
  }
  else
  {
    +[PXSharedLibrarySettings sharedInstance](PXSharedLibrarySettings, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "invitationsDataSourceType");

    objc_msgSend(a1, "invitationsDataSourceManagerForPhotoLibrary:type:", v4, v7);
    v5 = (PXSharedLibraryEmptyDataSourceManager *)objc_claimAutoreleasedReturnValue();
  }
  v8 = v5;

  return v8;
}

+ (id)currentExitingDataSourceManagerForPhotoLibrary:(id)a3
{
  id v4;
  PXSharedLibraryEmptyDataSourceManager *v5;
  void *v6;
  uint64_t v7;
  PXSharedLibraryEmptyDataSourceManager *v8;

  v4 = a3;
  if ((PLIsPhotosReliveWidget() & 1) != 0)
  {
    v5 = objc_alloc_init(PXSharedLibraryEmptyDataSourceManager);
  }
  else
  {
    +[PXSharedLibrarySettings sharedInstance](PXSharedLibrarySettings, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "exitingDataSourceType");

    objc_msgSend(a1, "exitingDataSourceManagerForPhotoLibrary:type:", v4, v7);
    v5 = (PXSharedLibraryEmptyDataSourceManager *)objc_claimAutoreleasedReturnValue();
  }
  v8 = v5;

  return v8;
}

- (void)fetchSharedLibraryForURL:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  void *v9;
  objc_class *v10;
  void *v11;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryDataSource.m"), 194, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXSharedLibraryDataSourceManager fetchSharedLibraryForURL:completionHandler:]", v11);

  abort();
}

- (id)fetchPreview
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryDataSource.m"), 198, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXSharedLibraryDataSourceManager fetchPreview]", v6);

  abort();
}

- (id)fetchSharedLibrary
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryDataSource.m"), 202, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXSharedLibraryDataSourceManager fetchSharedLibrary]", v6);

  abort();
}

- (id)fetchExiting
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSharedLibraryDataSource.m"), 206, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXSharedLibraryDataSourceManager fetchExiting]", v6);

  abort();
}

+ (id)keyPathsAffectingCurrentInvitationsDataSourceManager
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(sel_invitationsDataSourceType);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)keyPathsAffectingCurrentPreviewDataSourceManager
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(sel_previewDataSourceType);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)keyPathsAffectingCurrentSharedLibraryDataSourceManager
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(sel_sharedLibraryDataSourceType);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)keyPathsAffectingCurrentExitingDataSourceManager
{
  void *v2;
  void *v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(sel_exitingDataSourceType);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
