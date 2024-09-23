@implementation PLKeyFaceManager

- (void)markPersonAsNeedingKeyFace:(id)a3 photoLibrary:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  Class v10;
  NSObject *v11;
  void *v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  const char *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (PLIsAssetsd())
  {
    objc_msgSend(v8, "photoAnalysisClient");
    v9 = objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      if (v7)
      {
        v10 = NSClassFromString(CFSTR("PHPerson"));
        if (!v10)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLKeyFaceManager.m"), 39, CFSTR("markPersonAsNeedingKeyFace: cannot load PHPerson class."));

        }
        -[objc_class localIdentifierWithUUID:](v10, "localIdentifierWithUUID:", v7);
        v11 = objc_claimAutoreleasedReturnValue();
        v24[0] = v11;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v18[0] = MEMORY[0x1E0C809B0];
        v18[1] = 3221225472;
        v18[2] = __60__PLKeyFaceManager_markPersonAsNeedingKeyFace_photoLibrary___block_invoke;
        v18[3] = &unk_1E3671E00;
        v13 = v7;
        v19 = v13;
        v14 = -[NSObject updateKeyFacesOfPersonsWithLocalIdentifiers:forceUpdate:completion:](v9, "updateKeyFacesOfPersonsWithLocalIdentifiers:forceUpdate:completion:", v12, 1, v18);

        PLBackendGetLog();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v21 = v13;
          v22 = 2048;
          v23 = v14;
          _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEFAULT, "Started operation to update key face for person: %@, operationId: %zd", buf, 0x16u);
        }

        goto LABEL_16;
      }
      PLBackendGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v16 = "markPersonAsNeedingKeyFace: personUUID cannot be nil.";
        goto LABEL_15;
      }
    }
    else
    {
      PLBackendGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v16 = "markPersonAsNeedingKeyFace: no photoanalysisserviceclient.";
LABEL_15:
        _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, v16, buf, 2u);
      }
    }
LABEL_16:

    goto LABEL_17;
  }
  PLBackendGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v7;
    _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_FAULT, "Non-assetsd process cannot update key face for person %@, key face may not be set", buf, 0xCu);
  }
LABEL_17:

}

void __60__PLKeyFaceManager_markPersonAsNeedingKeyFace_photoLibrary___block_invoke(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  const char *v11;
  NSObject *v12;
  os_log_type_t v13;
  uint32_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  PLBackendGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (a2)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 32);
      v16 = 138412546;
      v17 = v10;
      v18 = 2048;
      v19 = a3;
      v11 = "Successfully updated key face for person: %@, operationId: %zd";
      v12 = v9;
      v13 = OS_LOG_TYPE_DEFAULT;
      v14 = 22;
LABEL_6:
      _os_log_impl(&dword_199541000, v12, v13, v11, (uint8_t *)&v16, v14);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v15 = *(_QWORD *)(a1 + 32);
    v16 = 138412802;
    v17 = v15;
    v18 = 2048;
    v19 = a3;
    v20 = 2112;
    v21 = v7;
    v11 = "Failed to update key face for person: %@, operationId: %zd, error: %@";
    v12 = v9;
    v13 = OS_LOG_TYPE_ERROR;
    v14 = 32;
    goto LABEL_6;
  }

}

+ (id)sharedInstance
{
  pl_dispatch_once();
  return (id)sharedInstance_pl_once_object_15;
}

void __34__PLKeyFaceManager_sharedInstance__block_invoke()
{
  PLKeyFaceManager *v0;
  void *v1;

  v0 = objc_alloc_init(PLKeyFaceManager);
  v1 = (void *)sharedInstance_pl_once_object_15;
  sharedInstance_pl_once_object_15 = (uint64_t)v0;

}

@end
