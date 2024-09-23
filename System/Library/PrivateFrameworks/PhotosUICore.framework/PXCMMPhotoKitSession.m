@implementation PXCMMPhotoKitSession

- (PXCMMPhotoKitSession)initWithContext:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMPhotoKitSession.m"), 37, CFSTR("%s is not available as initializer"), "-[PXCMMPhotoKitSession initWithContext:]");

  abort();
}

- (PXCMMPhotoKitSession)initWithPhotoKitContext:(id)a3
{
  id v5;
  PXCMMPhotoKitSession *v6;
  uint64_t v7;
  PHMomentShare *momentShare;
  uint64_t v9;
  PHSuggestion *suggestion;
  uint64_t v11;
  PHMomentShare *originatingMomentShare;
  void *v13;
  uint64_t v14;
  PXPhotoKitImportStatusManager *v15;
  PXPhotoKitImportStatusManager *importStatusManager;
  void *v17;
  PXCMMPhotoKitSession *v18;
  PXPhotoKitMomentShareStatus *v19;
  PXPhotoKitMomentShareStatus *photoKitMomentShareStatus;
  uint64_t v21;
  NSString *photoKitImportSessionID;
  void *v24;
  _QWORD v25[4];
  PXCMMPhotoKitSession *v26;
  objc_super v27;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXCMMPhotoKitSession.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("context"));

  }
  v27.receiver = self;
  v27.super_class = (Class)PXCMMPhotoKitSession;
  v6 = -[PXCMMSession initWithContext:](&v27, sel_initWithContext_, v5);
  if (v6)
  {
    objc_msgSend(v5, "momentShare");
    v7 = objc_claimAutoreleasedReturnValue();
    momentShare = v6->_momentShare;
    v6->_momentShare = (PHMomentShare *)v7;

    objc_msgSend(v5, "suggestion");
    v9 = objc_claimAutoreleasedReturnValue();
    suggestion = v6->_suggestion;
    v6->_suggestion = (PHSuggestion *)v9;

    objc_msgSend(v5, "originatingMomentShare");
    v11 = objc_claimAutoreleasedReturnValue();
    originatingMomentShare = v6->_originatingMomentShare;
    v6->_originatingMomentShare = (PHMomentShare *)v11;

    if (-[PXCMMSession activityType](v6, "activityType") == 2)
    {
      +[PXCompleteMyMomentSettings sharedInstance](PXCompleteMyMomentSettings, "sharedInstance");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "simulateImport");

      v15 = -[PXPhotoKitImportStatusManager initAllowingSimulation:]([PXPhotoKitImportStatusManager alloc], "initAllowingSimulation:", v14);
      importStatusManager = v6->_importStatusManager;
      v6->_importStatusManager = v15;

    }
    -[PXCMMSession viewModel](v6, "viewModel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __48__PXCMMPhotoKitSession_initWithPhotoKitContext___block_invoke;
    v25[3] = &unk_1E5140490;
    v18 = v6;
    v26 = v18;
    objc_msgSend(v17, "performChanges:", v25);

    if (v6->_momentShare)
    {
      v19 = -[PXPhotoKitMomentShareStatus initWithPhotoKitMomentShare:]([PXPhotoKitMomentShareStatus alloc], "initWithPhotoKitMomentShare:", v6->_momentShare);
      photoKitMomentShareStatus = v18->_photoKitMomentShareStatus;
      v18->_photoKitMomentShareStatus = v19;

      objc_msgSend(MEMORY[0x1E0D73308], "UUIDString");
      v21 = objc_claimAutoreleasedReturnValue();
      photoKitImportSessionID = v18->_photoKitImportSessionID;
      v18->_photoKitImportSessionID = (NSString *)v21;

    }
  }

  return v6;
}

- (id)notificationSuppressionContexts
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;

  -[PXCMMPhotoKitSession momentShare](self, "momentShare");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[PXCMMSession activityType](self, "activityType");
  v6 = 0;
  if (v5 == 2 && v4)
  {
    PLSuppressionContextForMomentShareUUID();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)importStatusManager
{
  return self->_importStatusManager;
}

- (id)importSessionID
{
  return self->_photoKitImportSessionID;
}

- (id)momentShareStatus
{
  return self->_photoKitMomentShareStatus;
}

- (id)description
{
  PHMomentShare *momentShare;
  __CFString *v4;
  __CFString *v5;
  void *v6;

  momentShare = self->_momentShare;
  if (momentShare)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", %@"), momentShare);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = &stru_1E5149688;
  }
  if (self->_suggestion)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", %@"), self->_suggestion);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = &stru_1E5149688;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@:%p%@%@>"), objc_opt_class(), self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)diagnosticDictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  id v14;
  objc_super v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)PXCMMPhotoKitSession;
  -[PXCMMSession diagnosticDictionary](&v15, sel_diagnosticDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXCMMPhotoKitSession suggestion](self, "suggestion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "photoLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    objc_msgSend(v6, "sharingSuggestionDebugInformationForAssetCollectionLocalIdentifier:error:", v7, &v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v14;

    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v3)
        -[NSObject addEntriesFromDictionary:](v10, "addEntriesFromDictionary:", v3);
      -[NSObject addEntriesFromDictionary:](v11, "addEntriesFromDictionary:", v8);
      v12 = -[NSObject copy](v11, "copy");

      v3 = (void *)v12;
    }
    else
    {
      PLSharingGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v17 = v5;
        _os_log_impl(&dword_1A6789000, v11, OS_LOG_TYPE_ERROR, "Failed to retrieve debug information for suggestion %@", buf, 0xCu);
      }
    }

  }
  return v3;
}

- (PHMomentShare)momentShare
{
  return self->_momentShare;
}

- (PHSuggestion)suggestion
{
  return self->_suggestion;
}

- (PHMomentShare)originatingMomentShare
{
  return self->_originatingMomentShare;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originatingMomentShare, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
  objc_storeStrong((id *)&self->_momentShare, 0);
  objc_storeStrong((id *)&self->_photoKitImportSessionID, 0);
  objc_storeStrong((id *)&self->_photoKitMomentShareStatus, 0);
  objc_storeStrong((id *)&self->_importStatusManager, 0);
}

void __48__PXCMMPhotoKitSession_initWithPhotoKitContext___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 144);
  v3 = a2;
  objc_msgSend(v3, "setContainsUnverifiedPersons:", objc_msgSend(v2, "containsUnverifiedPersons"));

}

@end
