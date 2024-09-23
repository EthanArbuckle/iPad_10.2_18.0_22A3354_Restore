@implementation PLReplaceAssetsWithCameraRollCopiesJob

- (PLReplaceAssetsWithCameraRollCopiesJob)initWithPhotoLibrary:(id)a3
{
  void *v4;
  void *v5;
  PLReplaceAssetsWithCameraRollCopiesJob *v6;
  objc_super v8;

  objc_msgSend(a3, "libraryBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "assetsdClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)PLReplaceAssetsWithCameraRollCopiesJob;
  v6 = -[PLDaemonJob initWithAssetsdClient:](&v8, sel_initWithAssetsdClient_, v5);

  return v6;
}

- (void)dealloc
{
  NSArray *assets;
  PLManagedAlbum *album;
  PLPhotoLibrary *photoLibrary;
  objc_super v6;

  assets = self->_assets;
  self->_assets = 0;

  album = self->_album;
  self->_album = 0;

  photoLibrary = self->_photoLibrary;
  self->_photoLibrary = 0;

  v6.receiver = self;
  v6.super_class = (Class)PLReplaceAssetsWithCameraRollCopiesJob;
  -[PLReplaceAssetsWithCameraRollCopiesJob dealloc](&v6, sel_dealloc);
}

- (int64_t)daemonOperation
{
  return 1;
}

- (PLManagedObjectContext)managedObjectContext
{
  void *v2;
  void *v3;

  -[PLReplaceAssetsWithCameraRollCopiesJob photoLibrary](self, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managedObjectContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (PLManagedObjectContext *)v3;
}

- (NSPersistentStoreCoordinator)coordinator
{
  void *v2;
  void *v3;

  -[PLReplaceAssetsWithCameraRollCopiesJob managedObjectContext](self, "managedObjectContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "persistentStoreCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSPersistentStoreCoordinator *)v3;
}

- (void)run
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[PLReplaceAssetsWithCameraRollCopiesJob assets](self, "assets");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PLReplaceAssetsWithCameraRollCopiesJob album](self, "album");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLReplaceAssetsWithCameraRollCopiesJob.m"), 102, CFSTR("assets cannot be nil when starting the job"));

    if (v4)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLReplaceAssetsWithCameraRollCopiesJob.m"), 103, CFSTR("album cannot be nil when starting the job"));

    goto LABEL_3;
  }
  if (!v4)
    goto LABEL_5;
LABEL_3:
  -[PLDaemonJob sendToAssetsd](self, "sendToAssetsd");

}

- (void)encodeToXPCObject:(id)a3
{
  id v4;
  xpc_object_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PLReplaceAssetsWithCameraRollCopiesJob;
  -[PLDaemonJob encodeToXPCObject:](&v18, sel_encodeToXPCObject_, v4);
  v5 = xpc_array_create(0, 0);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[PLReplaceAssetsWithCameraRollCopiesJob assets](self, "assets", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "objectID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        PLXPCArrayAppendManagedObjectID();

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v8);
  }

  xpc_dictionary_set_value(v4, "assetsIDs", v5);
  -[PLReplaceAssetsWithCameraRollCopiesJob album](self, "album");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  PLXPCDictionarySetManagedObjectID();

}

- (id)initFromXPCObject:(id)a3 libraryServicesManager:(id)a4
{
  id v6;
  _QWORD *v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _QWORD *v17;
  NSObject *v18;
  _QWORD v20[4];
  _QWORD *v21;
  void *v22;
  void *v23;
  objc_super v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PLReplaceAssetsWithCameraRollCopiesJob;
  v7 = -[PLDaemonJob initFromXPCObject:libraryServicesManager:](&v24, sel_initFromXPCObject_libraryServicesManager_, v6, a4);
  v8 = v7;
  if (!v7)
    goto LABEL_5;
  objc_msgSend(v7, "libraryServicesManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "databaseContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "newShortLivedLibraryWithName:", "-[PLReplaceAssetsWithCameraRollCopiesJob initFromXPCObject:libraryServicesManager:]");
  v12 = (void *)v8[10];
  v8[10] = v11;

  xpc_dictionary_get_value(v6, "assetsIDs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  xpc_dictionary_get_value(v6, "albumID");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v13 && v14)
  {
    v16 = (void *)v8[10];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __83__PLReplaceAssetsWithCameraRollCopiesJob_initFromXPCObject_libraryServicesManager___block_invoke;
    v20[3] = &unk_1E3677530;
    v21 = v8;
    v22 = v13;
    v23 = v15;
    objc_msgSend(v16, "performBlock:", v20);

LABEL_5:
    v17 = v8;
    goto LABEL_9;
  }
  PLBackendGetLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218240;
    v26 = v15;
    v27 = 2048;
    v28 = v13;
    _os_log_impl(&dword_199541000, v18, OS_LOG_TYPE_ERROR, "Error initializing job object. AlbumID: %p, AssetIDs %p", buf, 0x16u);
  }

  v17 = 0;
LABEL_9:

  return v17;
}

- (void)runDaemonSide
{
  void *v3;
  id v4;
  _QWORD v5[5];
  _QWORD v6[4];
  id v7;
  PLReplaceAssetsWithCameraRollCopiesJob *v8;

  -[PLReplaceAssetsWithCameraRollCopiesJob photoLibrary](self, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[4] = self;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__PLReplaceAssetsWithCameraRollCopiesJob_runDaemonSide__block_invoke;
  v6[3] = &unk_1E3677C18;
  v7 = v3;
  v8 = self;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__PLReplaceAssetsWithCameraRollCopiesJob_runDaemonSide__block_invoke_42;
  v5[3] = &unk_1E3677AA0;
  v4 = v3;
  objc_msgSend(v4, "performTransaction:completionHandler:", v6, v5);

}

- (id)_cameraRollAssetDerivedFromAsset:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "managedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchRequestWithEntityName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setFetchLimit:", 1);
  v8 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0D73310], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForCameraAsset"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v9;
  v10 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v3, "dateCreated");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("dateCreated"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "andPredicateWithSubpredicates:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setPredicate:", v14);
  v18 = 0;
  objc_msgSend(v4, "executeFetchRequest:error:", v7, &v18);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "count"))
  {
    objc_msgSend(v15, "lastObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (NSArray)assets
{
  return self->_assets;
}

- (void)setAssets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (PLManagedAlbum)album
{
  return self->_album;
}

- (void)setAlbum:(id)a3
{
  objc_storeStrong((id *)&self->_album, a3);
}

- (PLPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setPhotoLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_photoLibrary, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_album, 0);
  objc_storeStrong((id *)&self->_assets, 0);
}

void __55__PLReplaceAssetsWithCameraRollCopiesJob_runDaemonSide__block_invoke(uint64_t a1)
{
  void *v1;
  int v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  BOOL v31;
  id v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  void *v39;
  int v40;
  uint64_t (**v41)(_QWORD, _QWORD, _QWORD);
  id obj;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  id v47;
  _QWORD v48[4];
  id v49;
  uint64_t (**v50)(_QWORD, _QWORD, _QWORD);
  _BYTE *v51;
  _BYTE *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD v57[4];
  id v58;
  _BYTE v59[24];
  char v60;
  _BYTE buf[24];
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "pathManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isUBF");

  v40 = v2;
  if ((v2 & 1) != 0)
  {
    v39 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "pathManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "simpleDCIMDirectory");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v4 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  v57[0] = MEMORY[0x1E0C809B0];
  v57[1] = 3221225472;
  v57[2] = __55__PLReplaceAssetsWithCameraRollCopiesJob_runDaemonSide__block_invoke_2;
  v57[3] = &unk_1E366E438;
  v38 = v4;
  v58 = v38;
  v41 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x19AEC174C](v57);
  objc_msgSend(*(id *)(a1 + 40), "album");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mutableAssets");
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "assets");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
  if (v45)
  {
    v43 = *(_QWORD *)v54;
    do
    {
      for (i = 0; i != v45; ++i)
      {
        if (*(_QWORD *)v54 != v43)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
        v8 = (void *)MEMORY[0x19AEC1554]();
        objc_msgSend(*(id *)(a1 + 40), "_cameraRollAssetDerivedFromAsset:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          goto LABEL_10;
        objc_msgSend(v7, "mainFileURL");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "UUIDString");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = buf;
          *(_QWORD *)&buf[16] = 0x3032000000;
          v62 = __Block_byref_object_copy__60370;
          v63 = __Block_byref_object_dispose__60371;
          v64 = 0;
          if (v40)
          {
            *(_QWORD *)v59 = 0;
            *(_QWORD *)&v59[8] = v59;
            *(_QWORD *)&v59[16] = 0x2020000000;
            v60 = 0;
            v16 = objc_alloc(MEMORY[0x1E0D73278]);
            objc_msgSend(v7, "uniformTypeIdentifier");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "originalFilename");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            v19 = (void *)objc_msgSend(v16, "initWithAssetUuid:bundleScope:uti:resourceVersion:resourceType:recipeID:originalFilename:", v15, 0, v17, 0, 31, 0, v18);

            objc_msgSend(*(id *)(a1 + 32), "pathManager");
            v20 = objc_claimAutoreleasedReturnValue();
            v48[0] = MEMORY[0x1E0C809B0];
            v48[1] = 3221225472;
            v48[2] = __55__PLReplaceAssetsWithCameraRollCopiesJob_runDaemonSide__block_invoke_38;
            v48[3] = &unk_1E366E460;
            v51 = buf;
            v52 = v59;
            v50 = v41;
            v49 = v13;
            objc_msgSend((id)v20, "obtainAccessAndWaitWithFileWithIdentifier:mode:toURLWithHandler:", v19, 2, v48);

            LOBYTE(v20) = *(_BYTE *)(*(_QWORD *)&v59[8] + 24) == 0;
            _Block_object_dispose(v59, 8);
            if ((v20 & 1) == 0)
            {
LABEL_17:
              if (objc_msgSend(v7, "isPhotoStreamPhoto")
                && objc_msgSend(v7, "visibilityState") != 2)
              {
                objc_msgSend(v7, "publicGlobalUUID");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v21 = 0;
              }
              LOBYTE(v37) = 0;
              LOBYTE(v36) = 0;
              objc_msgSend(*(id *)(a1 + 32), "addDCIMEntryAtFileURL:mainFileMetadata:previewImage:thumbnailImage:savedAssetType:replacementUUID:publicGlobalUUID:extendedInfo:withUUID:isPlaceholder:placeholderFileURL:forFinalCameraImage:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40), 0, 0, 0, objc_msgSend(MEMORY[0x1E0D73310], "savedAssetTypeForCameraAsset"), 0, v21, 0, v15, v36, 0, v37);
              v9 = (void *)objc_claimAutoreleasedReturnValue();
              if (v9)
              {
                objc_msgSend(v7, "dateCreated");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v9, "setDateCreated:", v27);

                objc_msgSend(v9, "dateCreated");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v28, "timeIntervalSinceReferenceDate");
                objc_msgSend(v9, "setSortToken:");

                if (objc_msgSend(v7, "isPhotoStreamPhoto"))
                {
                  objc_msgSend(v7, "originalHash");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v29)
                    objc_msgSend(v9, "setOriginalHash:", v29);
                  if (objc_msgSend(v7, "visibilityState") != 2)
                    objc_msgSend(v7, "setVisibilityState:", 2);

                }
                v30 = v9;
                v47 = 0;
                v31 = +[PLResourceInstaller installInternalResourcesForExistingAsset:assumeNoExistingResources:referencedResourceURLs:error:](PLResourceInstaller, "installInternalResourcesForExistingAsset:assumeNoExistingResources:referencedResourceURLs:error:", v30, 0, 0, &v47);
                v32 = v47;
                if (!v31)
                {
                  PLBackendGetLog();
                  v33 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)v59 = 138412546;
                    *(_QWORD *)&v59[4] = v30;
                    *(_WORD *)&v59[12] = 2112;
                    *(_QWORD *)&v59[14] = v32;
                    _os_log_impl(&dword_199541000, v33, OS_LOG_TYPE_ERROR, "Failed to install resources for asset: %@, reason: %@", v59, 0x16u);
                  }

                }
              }
              else
              {
                PLBackendGetLog();
                v34 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "path");
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)v59 = 138412290;
                  *(_QWORD *)&v59[4] = v35;
                  _os_log_impl(&dword_199541000, v34, OS_LOG_TYPE_ERROR, "Failed to add file \"%@\" to camera roll.", v59, 0xCu);

                }
                objc_msgSend(v38, "removeItemAtURL:error:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40), 0);
              }

              v26 = 1;
LABEL_43:
              _Block_object_dispose(buf, 8);

              if ((v26 & 1) == 0 || !v9)
                goto LABEL_45;
LABEL_10:
              v10 = objc_msgSend(v44, "indexOfObject:", v7);
              if (v10 == 0x7FFFFFFFFFFFFFFFLL)
              {
                PLBackendGetLog();
                v11 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
                {
                  objc_msgSend(*(id *)(a1 + 40), "album");
                  v12 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412546;
                  *(_QWORD *)&buf[4] = v7;
                  *(_WORD *)&buf[12] = 2112;
                  *(_QWORD *)&buf[14] = v12;
                  _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "Asset to replace not found in album. Asset: %@\nAlbum: %@", buf, 0x16u);

                }
              }
              else
              {
                objc_msgSend(v44, "replaceObjectAtIndex:withObject:", v10, v9);
              }
              goto LABEL_45;
            }
          }
          else
          {
            objc_msgSend(v13, "pathExtension");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "nextAvailableFileURLWithExtension:", v23);
            v24 = objc_claimAutoreleasedReturnValue();
            v25 = *(void **)(*(_QWORD *)&buf[8] + 40);
            *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v24;

            if ((((uint64_t (**)(_QWORD, void *, _QWORD))v41)[2](v41, v13, *(_QWORD *)(*(_QWORD *)&buf[8] + 40)) & 1) != 0)goto LABEL_17;
          }
          v26 = 0;
          v9 = 0;
          goto LABEL_43;
        }
        PLBackendGetLog();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v7;
          _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, "Cannot copy asset to Camera Roll because it doesn't have a file URL. %@", buf, 0xCu);
        }

        v9 = 0;
LABEL_45:

        objc_autoreleasePoolPop(v8);
      }
      v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v65, 16);
    }
    while (v45);
  }

}

id __55__PLReplaceAssetsWithCameraRollCopiesJob_runDaemonSide__block_invoke_42(uint64_t a1)
{
  objc_super v2;

  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)PLReplaceAssetsWithCameraRollCopiesJob;
  return objc_msgSendSuper2(&v2, sel_runDaemonSide);
}

uint64_t __55__PLReplaceAssetsWithCameraRollCopiesJob_runDaemonSide__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v14 = 0;
  v8 = objc_msgSend(v7, "copyItemAtURL:toURL:error:", v5, v6, &v14);
  v9 = v14;
  if ((v8 & 1) == 0)
  {
    PLBackendGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "path");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "path");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v16 = v11;
      v17 = 2112;
      v18 = v12;
      v19 = 2112;
      v20 = v9;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_ERROR, "Failed to copy file \"%@\" to \"%@\": %@", buf, 0x20u);

    }
  }

  return v8;
}

void __55__PLReplaceAssetsWithCameraRollCopiesJob_runDaemonSide__block_invoke_38(_QWORD *a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), a2);
  v4 = a2;
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = (*(uint64_t (**)(void))(a1[5] + 16))();

}

void __83__PLReplaceAssetsWithCameraRollCopiesJob_initFromXPCObject_libraryServicesManager___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD applier[4];
  id v11;
  id v12;
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "coordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  applier[0] = MEMORY[0x1E0C809B0];
  applier[1] = 3221225472;
  applier[2] = __83__PLReplaceAssetsWithCameraRollCopiesJob_initFromXPCObject_libraryServicesManager___block_invoke_2;
  applier[3] = &unk_1E366E410;
  v11 = v2;
  v4 = *(void **)(a1 + 40);
  v12 = *(id *)(a1 + 32);
  v13 = v3;
  v5 = v3;
  v9 = v2;
  xpc_array_apply(v4, applier);
  objc_msgSend(*(id *)(a1 + 32), "setAssets:", v5);
  PLManagedObjectIDFromXPCValue();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectWithID:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setAlbum:", v8);
}

uint64_t __83__PLReplaceAssetsWithCameraRollCopiesJob_initFromXPCObject_libraryServicesManager___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  PLManagedObjectIDFromXPCValue();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "managedObjectContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectWithID:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      objc_msgSend(*(id *)(a1 + 48), "addObject:", v4);

  }
  return 1;
}

+ (void)replaceAssets:(id)a3 withCameraRollCopiesInAlbum:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = objc_msgSend(v11, "count");
  if (v6 && v7)
  {
    v8 = objc_alloc((Class)a1);
    objc_msgSend(v6, "photoLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithPhotoLibrary:", v9);

    objc_msgSend(v10, "setAlbum:", v6);
    objc_msgSend(v10, "setAssets:", v11);
    objc_msgSend(v10, "run");

  }
}

@end
