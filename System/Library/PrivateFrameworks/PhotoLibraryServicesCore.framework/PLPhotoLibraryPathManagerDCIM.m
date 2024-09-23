@implementation PLPhotoLibraryPathManagerDCIM

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_importFileManager, 0);
  objc_storeStrong((id *)&self->_lazyPathManagerForUBFOnDCIM, 0);
  objc_storeStrong((id *)&self->_simpleDCIMDirectory, 0);
  objc_storeStrong((id *)&self->_thumbnailsVideoKeyFramesDirectory, 0);
  objc_storeStrong((id *)&self->_thumbnailsV2Directory, 0);
  objc_storeStrong((id *)&self->_thumbnailsDirectory, 0);
  objc_storeStrong((id *)&self->_changeStoreDatabasePath, 0);
  objc_storeStrong((id *)&self->_lockedDirectory, 0);
  objc_storeStrong((id *)&self->_externalDirectory, 0);
  objc_storeStrong((id *)&self->_partialVideoDirectory, 0);
  objc_storeStrong((id *)&self->_internalDirectory, 0);
  objc_storeStrong((id *)&self->_privateDirectory, 0);
  objc_storeStrong((id *)&self->_projectsDirectory, 0);
  objc_storeStrong((id *)&self->_journalsDirectory, 0);
  objc_storeStrong((id *)&self->_cmmAssetsDirectory, 0);
  objc_storeStrong((id *)&self->_cplAssetsDirectory, 0);
  objc_storeStrong((id *)&self->_dcimDirectory, 0);
  objc_storeStrong((id *)&self->_photoDataComputeDirectory, 0);
  objc_storeStrong((id *)&self->_restoreInfoDirectory, 0);
  objc_storeStrong((id *)&self->_photoDataSearchDirectory, 0);
  objc_storeStrong((id *)&self->_photoDataSmartSharingDirectory, 0);
  objc_storeStrong((id *)&self->_photoDataAnalyticsDirectory, 0);
  objc_storeStrong((id *)&self->_photoDataCachesDirectory, 0);
  objc_storeStrong((id *)&self->_photoDataDirectory, 0);
}

- (id)photoDirectoryWithType:(unsigned __int8)a3 leafType:(unsigned __int8)a4 additionalPathComponents:(id)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  void *v9;
  void *v10;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  -[PLPhotoLibraryPathManagerDCIM convertPhotoLibraryPathType:](self, "convertPhotoLibraryPathType:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoLibraryPathManagerDCIM addToPath:leafType:additionalPathComponents:](self, "addToPath:leafType:additionalPathComponents:", v9, v5, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)addToPath:(id)a3 leafType:(unsigned __int8)a4 additionalPathComponents:(id)a5
{
  int v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;

  v6 = a4;
  v7 = a3;
  v8 = a5;
  switch(v6)
  {
    case 0:
    case 4:
      v9 = v7;
      goto LABEL_9;
    case 1:
    case 3:
      v10 = v7;
      goto LABEL_6;
    case 2:
      objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("derivatives"));
      v10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
      v9 = v10;
      goto LABEL_7;
    default:
      v9 = 0;
LABEL_7:
      if (objc_msgSend(v8, "length"))
      {
        objc_msgSend(v9, "stringByAppendingPathComponent:", v8);
        v11 = objc_claimAutoreleasedReturnValue();

        v9 = (id)v11;
      }
LABEL_9:

      return v9;
  }
}

- (id)convertPhotoLibraryPathType:(unsigned __int8)a3
{
  uint64_t v3;
  id v4;
  id result;
  NSString *photoDataDirectory;
  const __CFString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[2];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 0u:
    case 0x23u:
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Invalid path type conversion: %s"), "-[PLPhotoLibraryPathManagerDCIM convertPhotoLibraryPathType:]");
      goto LABEL_33;
    case 1u:
    case 0x1Fu:
      -[PLPhotoLibraryPathManagerCore baseDirectory](self, "baseDirectory");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    case 2u:
    case 0x1Cu:
    case 0x20u:
    case 0x21u:
    case 0x22u:
      v3 = 136;
      goto LABEL_3;
    case 3u:
      v3 = 168;
      goto LABEL_3;
    case 4u:
      v3 = 192;
      goto LABEL_3;
    case 5u:
      v3 = 232;
      goto LABEL_3;
    case 6u:
      v3 = 144;
      goto LABEL_3;
    case 7u:
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Invalid legacy path type: %s"), "-[PLPhotoLibraryPathManagerDCIM convertPhotoLibraryPathType:]");
      goto LABEL_33;
    case 8u:
      v3 = 216;
      goto LABEL_3;
    case 9u:
      -[PLPhotoLibraryPathManagerDCIM photoMutationsDirectory](self, "photoMutationsDirectory");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    case 0xAu:
      -[PLPhotoLibraryPathManagerDCIM photoMetadataDirectory](self, "photoMetadataDirectory");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    case 0xBu:
      v3 = 280;
      goto LABEL_3;
    case 0xCu:
      v3 = 288;
      goto LABEL_3;
    case 0xDu:
      photoDataDirectory = self->_photoDataDirectory;
      v7 = CFSTR("CPL");
      goto LABEL_27;
    case 0xEu:
      -[PLPhotoLibraryPathManagerCore baseDirectory](self, "baseDirectory");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringByAppendingPathComponent:", CFSTR("PhotoStreamsData"));
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_35;
    case 0xFu:
      v3 = 224;
      goto LABEL_3;
    case 0x10u:
      v10 = (void *)MEMORY[0x1E0C99DA0];
      v11 = *MEMORY[0x1E0C99750];
      v12 = CFSTR("Invalid projects legacy path type (macOS only)");
      goto LABEL_32;
    case 0x11u:
      v3 = 152;
      goto LABEL_3;
    case 0x12u:
      v3 = 184;
      goto LABEL_3;
    case 0x13u:
      v3 = 248;
      goto LABEL_3;
    case 0x14u:
      v3 = 160;
      goto LABEL_3;
    case 0x15u:
      v10 = (void *)MEMORY[0x1E0C99DA0];
      v11 = *MEMORY[0x1E0C99750];
      v12 = CFSTR("Invalid cloud shared legacy path type (macOS only)");
      goto LABEL_32;
    case 0x16u:
      photoDataDirectory = self->_photoDataDirectory;
      v7 = CFSTR("PhotoCloudSharingData");
LABEL_27:
      -[NSString stringByAppendingPathComponent:](photoDataDirectory, "stringByAppendingPathComponent:", v7);
      v4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    case 0x17u:
      v13 = (void *)MEMORY[0x1E0CB3940];
      -[PLPhotoLibraryPathManagerDCIM photoMetadataDirectory](self, "photoMetadataDirectory");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v8;
      v21[1] = CFSTR("PhotoData");
      v21[2] = CFSTR("PhotoCloudSharingData");
      v14 = (void *)MEMORY[0x1E0C99D20];
      v15 = v21;
      v16 = 3;
      goto LABEL_30;
    case 0x18u:
      v13 = (void *)MEMORY[0x1E0CB3940];
      -[PLPhotoLibraryPathManagerCore photoDirectoryWithType:](self, "photoDirectoryWithType:", 22);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v8;
      v20[1] = CFSTR("Caches");
      v14 = (void *)MEMORY[0x1E0C99D20];
      v15 = v20;
      v16 = 2;
LABEL_30:
      objc_msgSend(v14, "arrayWithObjects:count:", v15, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "pathWithComponents:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_36;
    case 0x19u:
      v10 = (void *)MEMORY[0x1E0C99DA0];
      v11 = *MEMORY[0x1E0C99750];
      v12 = CFSTR("Invalid moment shared legacy path type (macOS only)");
LABEL_32:
      objc_msgSend(v10, "raise:format:", v11, v12, v19);
      goto LABEL_33;
    case 0x1Au:
      -[PLLazyObject objectValue](self->_lazyPathManagerForUBFOnDCIM, "objectValue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "photoDirectoryWithType:", 26);
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_35:
      v18 = (void *)v9;
LABEL_36:

      return v18;
    case 0x1Bu:
      v3 = 264;
      goto LABEL_3;
    case 0x1Du:
      v3 = 200;
      goto LABEL_3;
    case 0x1Eu:
      v3 = 296;
LABEL_3:
      v4 = *(id *)((char *)&self->super.super.isa + v3);
LABEL_4:
      result = v4;
      break;
    default:
LABEL_33:
      result = 0;
      break;
  }
  return result;
}

PLPhotoLibraryPathManagerUBF *__64__PLPhotoLibraryPathManagerDCIM_initWithLibraryURL_bundleScope___block_invoke(uint64_t a1)
{
  id WeakRetained;
  PLPhotoLibraryPathManagerUBF *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
    v3 = -[PLPhotoLibraryPathManagerUBF initWithLibraryURL:bundleScope:]([PLPhotoLibraryPathManagerUBF alloc], "initWithLibraryURL:bundleScope:", *(_QWORD *)(a1 + 32), 0);
  else
    v3 = 0;

  return v3;
}

- (id)photoMutationsDirectory
{
  return -[NSString stringByAppendingPathComponent:](self->_photoDataDirectory, "stringByAppendingPathComponent:", CFSTR("Mutations"));
}

- (id)photoMetadataDirectory
{
  return -[NSString stringByAppendingPathComponent:](self->_photoDataDirectory, "stringByAppendingPathComponent:", CFSTR("Metadata"));
}

- (void)setImportFileManager:(id)a3
{
  objc_storeStrong((id *)&self->_importFileManager, a3);
}

- (PLPhotoLibraryPathManagerDCIM)initWithLibraryURL:(id)a3 bundleScope:(unsigned __int16)a4
{
  uint64_t v4;
  id v6;
  PLPhotoLibraryPathManagerDCIM *v7;
  PLPhotoLibraryPathManagerDCIM *v8;
  void *v9;
  uint64_t v10;
  NSString *photoDataDirectory;
  uint64_t v12;
  NSString *photoDataCachesDirectory;
  uint64_t v14;
  NSString *photoDataAnalyticsDirectory;
  uint64_t v16;
  NSString *photoDataSmartSharingDirectory;
  uint64_t v18;
  NSString *photoDataSearchDirectory;
  uint64_t v20;
  NSString *restoreInfoDirectory;
  uint64_t v22;
  NSString *photoDataComputeDirectory;
  void *v24;
  uint64_t v25;
  NSString *dcimDirectory;
  uint64_t v27;
  NSString *cplAssetsDirectory;
  uint64_t v29;
  NSString *cmmAssetsDirectory;
  uint64_t v31;
  NSString *journalsDirectory;
  uint64_t v33;
  NSString *projectsDirectory;
  void *v35;
  uint64_t v36;
  NSString *privateDirectory;
  uint64_t v38;
  NSString *partialVideoDirectory;
  uint64_t v40;
  NSString *internalDirectory;
  void *v42;
  uint64_t v43;
  NSString *externalDirectory;
  uint64_t v45;
  NSString *lockedDirectory;
  uint64_t v47;
  NSString *changeStoreDatabasePath;
  uint64_t v49;
  NSString *thumbnailsDirectory;
  uint64_t v51;
  NSString *thumbnailsV2Directory;
  uint64_t v53;
  NSString *thumbnailsVideoKeyFramesDirectory;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  id v62;
  PLLazyObject *v63;
  id v64;
  uint64_t v65;
  PLLazyObject *lazyPathManagerForUBFOnDCIM;
  _QWORD v68[4];
  id v69;
  id v70;
  id location;
  objc_super v72;

  v4 = a4;
  v6 = a3;
  v72.receiver = self;
  v72.super_class = (Class)PLPhotoLibraryPathManagerDCIM;
  v7 = -[PLPhotoLibraryPathManagerCore initWithLibraryURL:bundleScope:](&v72, sel_initWithLibraryURL_bundleScope_, v6, v4);
  v8 = v7;
  if (v7)
  {
    -[PLPhotoLibraryPathManagerCore baseDirectory](v7, "baseDirectory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByAppendingPathComponent:", CFSTR("PhotoData"));
    v10 = objc_claimAutoreleasedReturnValue();
    photoDataDirectory = v8->_photoDataDirectory;
    v8->_photoDataDirectory = (NSString *)v10;

    -[NSString stringByAppendingPathComponent:](v8->_photoDataDirectory, "stringByAppendingPathComponent:", CFSTR("Caches"));
    v12 = objc_claimAutoreleasedReturnValue();
    photoDataCachesDirectory = v8->_photoDataCachesDirectory;
    v8->_photoDataCachesDirectory = (NSString *)v12;

    -[NSString stringByAppendingPathComponent:](v8->_photoDataCachesDirectory, "stringByAppendingPathComponent:", CFSTR("Analytics"));
    v14 = objc_claimAutoreleasedReturnValue();
    photoDataAnalyticsDirectory = v8->_photoDataAnalyticsDirectory;
    v8->_photoDataAnalyticsDirectory = (NSString *)v14;

    -[NSString stringByAppendingPathComponent:](v8->_photoDataCachesDirectory, "stringByAppendingPathComponent:", CFSTR("SmartSharing"));
    v16 = objc_claimAutoreleasedReturnValue();
    photoDataSmartSharingDirectory = v8->_photoDataSmartSharingDirectory;
    v8->_photoDataSmartSharingDirectory = (NSString *)v16;

    -[NSString stringByAppendingPathComponent:](v8->_photoDataCachesDirectory, "stringByAppendingPathComponent:", CFSTR("search"));
    v18 = objc_claimAutoreleasedReturnValue();
    photoDataSearchDirectory = v8->_photoDataSearchDirectory;
    v8->_photoDataSearchDirectory = (NSString *)v18;

    -[NSString stringByAppendingPathComponent:](v8->_photoDataCachesDirectory, "stringByAppendingPathComponent:", CFSTR("Restore"));
    v20 = objc_claimAutoreleasedReturnValue();
    restoreInfoDirectory = v8->_restoreInfoDirectory;
    v8->_restoreInfoDirectory = (NSString *)v20;

    -[NSString stringByAppendingPathComponent:](v8->_photoDataCachesDirectory, "stringByAppendingPathComponent:", CFSTR("Compute"));
    v22 = objc_claimAutoreleasedReturnValue();
    photoDataComputeDirectory = v8->_photoDataComputeDirectory;
    v8->_photoDataComputeDirectory = (NSString *)v22;

    -[PLPhotoLibraryPathManagerCore baseDirectory](v8, "baseDirectory");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringByAppendingPathComponent:", CFSTR("DCIM"));
    v25 = objc_claimAutoreleasedReturnValue();
    dcimDirectory = v8->_dcimDirectory;
    v8->_dcimDirectory = (NSString *)v25;

    -[NSString stringByAppendingPathComponent:](v8->_photoDataDirectory, "stringByAppendingPathComponent:", CFSTR("CPLAssets"));
    v27 = objc_claimAutoreleasedReturnValue();
    cplAssetsDirectory = v8->_cplAssetsDirectory;
    v8->_cplAssetsDirectory = (NSString *)v27;

    -[NSString stringByAppendingPathComponent:](v8->_photoDataDirectory, "stringByAppendingPathComponent:", CFSTR("CMMAssets"));
    v29 = objc_claimAutoreleasedReturnValue();
    cmmAssetsDirectory = v8->_cmmAssetsDirectory;
    v8->_cmmAssetsDirectory = (NSString *)v29;

    -[NSString stringByAppendingPathComponent:](v8->_photoDataDirectory, "stringByAppendingPathComponent:", CFSTR("Journals"));
    v31 = objc_claimAutoreleasedReturnValue();
    journalsDirectory = v8->_journalsDirectory;
    v8->_journalsDirectory = (NSString *)v31;

    -[NSString stringByAppendingPathComponent:](v8->_photoDataDirectory, "stringByAppendingPathComponent:", CFSTR("Projects"));
    v33 = objc_claimAutoreleasedReturnValue();
    projectsDirectory = v8->_projectsDirectory;
    v8->_projectsDirectory = (NSString *)v33;

    PLBundleIdentifier();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPhotoLibraryPathManagerCore privateDirectoryWithBundleIdentifier:createIfNeeded:](v8, "privateDirectoryWithBundleIdentifier:createIfNeeded:", v35, 0);
    v36 = objc_claimAutoreleasedReturnValue();
    privateDirectory = v8->_privateDirectory;
    v8->_privateDirectory = (NSString *)v36;

    -[NSString stringByAppendingPathComponent:](v8->_photoDataDirectory, "stringByAppendingPathComponent:", CFSTR("resources/partialvideo"));
    v38 = objc_claimAutoreleasedReturnValue();
    partialVideoDirectory = v8->_partialVideoDirectory;
    v8->_partialVideoDirectory = (NSString *)v38;

    -[NSString stringByAppendingPathComponent:](v8->_photoDataDirectory, "stringByAppendingPathComponent:", CFSTR("internal"));
    v40 = objc_claimAutoreleasedReturnValue();
    internalDirectory = v8->_internalDirectory;
    v8->_internalDirectory = (NSString *)v40;

    PLBundleIdentifier();
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPhotoLibraryPathManagerDCIM _externalDirectoryWithBundleIdentifier:createIfNeeded:](v8, "_externalDirectoryWithBundleIdentifier:createIfNeeded:", v42, 0);
    v43 = objc_claimAutoreleasedReturnValue();
    externalDirectory = v8->_externalDirectory;
    v8->_externalDirectory = (NSString *)v43;

    -[NSString stringByAppendingPathComponent:](v8->_photoDataDirectory, "stringByAppendingPathComponent:", CFSTR("Locked"));
    v45 = objc_claimAutoreleasedReturnValue();
    lockedDirectory = v8->_lockedDirectory;
    v8->_lockedDirectory = (NSString *)v45;

    -[NSString stringByAppendingPathComponent:](v8->_photoDataDirectory, "stringByAppendingPathComponent:", CFSTR("changes"));
    v47 = objc_claimAutoreleasedReturnValue();
    changeStoreDatabasePath = v8->_changeStoreDatabasePath;
    v8->_changeStoreDatabasePath = (NSString *)v47;

    -[NSString stringByAppendingPathComponent:](v8->_photoDataDirectory, "stringByAppendingPathComponent:", CFSTR("Thumbnails"));
    v49 = objc_claimAutoreleasedReturnValue();
    thumbnailsDirectory = v8->_thumbnailsDirectory;
    v8->_thumbnailsDirectory = (NSString *)v49;

    -[NSString stringByAppendingPathComponent:](v8->_thumbnailsDirectory, "stringByAppendingPathComponent:", CFSTR("V2"));
    v51 = objc_claimAutoreleasedReturnValue();
    thumbnailsV2Directory = v8->_thumbnailsV2Directory;
    v8->_thumbnailsV2Directory = (NSString *)v51;

    -[NSString stringByAppendingPathComponent:](v8->_thumbnailsDirectory, "stringByAppendingPathComponent:", CFSTR("VideoKeyFrames"));
    v53 = objc_claimAutoreleasedReturnValue();
    thumbnailsVideoKeyFramesDirectory = v8->_thumbnailsVideoKeyFramesDirectory;
    v8->_thumbnailsVideoKeyFramesDirectory = (NSString *)v53;

    -[PLPhotoLibraryPathManagerCore baseDirectory](v8, "baseDirectory");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "stringByAppendingPathComponent:", CFSTR("Photos"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPhotoLibraryPathManagerCore setITunesPhotosDirectory:](v8, "setITunesPhotosDirectory:", v56);

    -[NSString stringByAppendingPathComponent:](v8->_photoDataDirectory, "stringByAppendingPathComponent:", CFSTR("ModelInterest.sqlite"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPhotoLibraryPathManagerCore setLegacyModelInterestDatabasePath:](v8, "setLegacyModelInterestDatabasePath:", v57);

    -[NSString stringByAppendingPathComponent:](v8->_photoDataDirectory, "stringByAppendingPathComponent:", CFSTR("MemoriesRelated"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPhotoLibraryPathManagerCore setLegacyMemoriesRelatedSnapshotDirectory:](v8, "setLegacyMemoriesRelatedSnapshotDirectory:", v58);

    v59 = objc_alloc(MEMORY[0x1E0C99E98]);
    -[NSString stringByAppendingPathComponent:](v8->_photoDataDirectory, "stringByAppendingPathComponent:", CFSTR("UBF"));
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = (void *)objc_msgSend(v59, "initFileURLWithPath:isDirectory:", v60, 1);

    v62 = objc_initWeak(&location, v8);
    v63 = [PLLazyObject alloc];
    v68[0] = MEMORY[0x1E0C809B0];
    v68[1] = 3221225472;
    v68[2] = __64__PLPhotoLibraryPathManagerDCIM_initWithLibraryURL_bundleScope___block_invoke;
    v68[3] = &unk_1E3768E58;
    objc_copyWeak(&v70, &location);
    v64 = v61;
    v69 = v64;
    v65 = -[PLLazyObject initWithBlock:](v63, "initWithBlock:", v68);

    objc_destroyWeak(&v70);
    objc_destroyWeak(&location);
    lazyPathManagerForUBFOnDCIM = v8->_lazyPathManagerForUBFOnDCIM;
    v8->_lazyPathManagerForUBFOnDCIM = (PLLazyObject *)v65;

    -[PLPhotoLibraryPathManagerCore postInit](v8, "postInit");
  }

  return v8;
}

- (id)basePrivateDirectoryPath
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[3];

  v6[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3940];
  v6[0] = self->_photoDataDirectory;
  v6[1] = CFSTR("private");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathWithComponents:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_externalDirectoryWithBundleIdentifier:(id)a3 createIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v14[3];

  v4 = a4;
  v14[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1E0CB3940];
  v14[0] = self->_photoDataDirectory;
  v14[1] = CFSTR("external");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pathWithComponents:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v9, "stringByAppendingPathComponent:", v6);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = v9;
  }
  v11 = v10;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v11, 1, 0, 0);

  }
  return v11;
}

- (void)enumerateBundleScopesWithBlock:(id)a3
{
  unsigned __int16 v5;
  void *v6;
  unsigned int v7;
  PLPhotoLibraryPathManager *v8;
  void *v9;
  void *v10;
  PLPhotoLibraryPathManager *v11;
  void *v12;
  id v13;

  v13 = a3;
  if (-[PLPhotoLibraryPathManagerCore bundleScope](self, "bundleScope"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPhotoLibraryPathManagerDCIM.m"), 649, CFSTR("can only enumerate bundle scopes on main bundle scoped path manager"));

  }
  v5 = 0;
  do
  {
    v6 = (void *)MEMORY[0x19AEC2E4C]();
    v7 = v5;
    if (-[PLPhotoLibraryPathManagerDCIM shouldUseFileIdentifierForBundleScope:](self, "shouldUseFileIdentifierForBundleScope:", v5))
    {
      v8 = [PLPhotoLibraryPathManager alloc];
      -[PLLazyObject objectValue](self->_lazyPathManagerForUBFOnDCIM, "objectValue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "libraryURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[PLPhotoLibraryPathManager initWithLibraryURL:bundleScope:libraryFormat:](v8, "initWithLibraryURL:bundleScope:libraryFormat:", v10, v5, 2);

      (*((void (**)(id, _QWORD, _QWORD, PLPhotoLibraryPathManager *))v13 + 2))(v13, v5, -[PLPhotoLibraryPathManagerDCIM photoLibraryPathTypeForBundleScope:](self, "photoLibraryPathTypeForBundleScope:", v5), v11);
    }
    objc_autoreleasePoolPop(v6);
    ++v5;
  }
  while (v7 < 4);

}

- (BOOL)shouldUseFileIdentifierForBundleScope:(unsigned __int16)a3
{
  return a3 < 6u && (a3 & 0x3F) == 3;
}

- (unsigned)photoLibraryPathTypeForBundleScope:(unsigned __int16)a3
{
  unint64_t v3;

  v3 = 0x11A000001uLL >> (8 * a3);
  if (a3 >= 6u)
    LOBYTE(v3) = 0;
  return v3;
}

- (id)photosDatabasePath
{
  return -[NSString stringByAppendingPathComponent:](self->_photoDataDirectory, "stringByAppendingPathComponent:", CFSTR("Photos.sqlite"));
}

- (id)pathsForClientAccess:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if ((objc_msgSend(v4, "directDatabaseWriteAuthorized") & 1) != 0)
  {
    v6 = MEMORY[0x1E0C9AAB0];
  }
  else
  {
    if (!objc_msgSend(v4, "directDatabaseAccessAuthorized"))
      goto LABEL_6;
    v6 = MEMORY[0x1E0C9AAA0];
  }
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, self->_photoDataDirectory);
LABEL_6:
  -[PLPhotoLibraryPathManagerDCIM captureSessionPathsWithClientAuthorization:](self, "captureSessionPathsWithClientAuthorization:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", v7);

  -[PLPhotoLibraryPathManagerDCIM clientOwnedDirectoryPathsForClientAccess:](self, "clientOwnedDirectoryPathsForClientAccess:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", v8);
  -[PLPhotoLibraryPathManagerCore photoDirectoryWithType:createIfNeeded:error:](self, "photoDirectoryWithType:createIfNeeded:error:", 17, 1, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "analyticsCacheWriteEntitled") & 1) != 0)
  {
    v10 = MEMORY[0x1E0C9AAB0];
LABEL_10:
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, v9);
    goto LABEL_11;
  }
  if (objc_msgSend(v4, "analyticsCacheReadEntitled"))
  {
    v10 = MEMORY[0x1E0C9AAA0];
    goto LABEL_10;
  }
LABEL_11:
  if ((objc_msgSend(v4, "smartSharingCacheWriteEntitled") & 1) != 0
    || objc_msgSend(v4, "smartSharingCacheReadEntitled"))
  {
    -[PLPhotoLibraryPathManagerCore photoDirectoryWithType:createIfNeeded:error:](self, "photoDirectoryWithType:createIfNeeded:error:", 20, 1, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "smartSharingCacheWriteEntitled"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, v11);

  }
  if (objc_msgSend(v4, "internalDataReadWriteAuthorized"))
  {
    -[PLPhotoLibraryPathManagerCore internalDirectoryWithSubType:additionalPathComponents:createIfNeeded:error:](self, "internalDirectoryWithSubType:additionalPathComponents:createIfNeeded:error:", 1, 0, 1, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v13);
    -[PLPhotoLibraryPathManagerCore internalDirectoryWithSubType:additionalPathComponents:createIfNeeded:error:](self, "internalDirectoryWithSubType:additionalPathComponents:createIfNeeded:error:", 3, 0, 1, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, v15);
    -[PLPhotoLibraryPathManagerCore internalDirectoryWithSubType:additionalPathComponents:createIfNeeded:error:](self, "internalDirectoryWithSubType:additionalPathComponents:createIfNeeded:error:", 4, 0, 1, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, v16);

  }
  -[PLPhotoLibraryPathManagerCore pathForCPLStatus](self, "pathForCPLStatus");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], v17);
  if ((objc_msgSend(v4, "coreSceneUnderstandingTaxonomyReadAuthorized") & 1) != 0
    || objc_msgSend(v4, "coreSceneUnderstandingTaxonomyWriteAuthorized"))
  {
    -[PLPhotoLibraryPathManagerCore internalDirectoryWithSubType:additionalPathComponents:createIfNeeded:error:](self, "internalDirectoryWithSubType:additionalPathComponents:createIfNeeded:error:", 5, 0, 1, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "coreSceneUnderstandingTaxonomyWriteAuthorized"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v19, v18);

  }
  return v5;
}

- (id)privateCacheDirectoryWithSubType:(unsigned __int8)a3 leafType:(unsigned __int8)a4 additionalPathComponents:(id)a5
{
  uint64_t v5;
  int v6;
  id v8;
  NSString **p_photoDataCachesDirectory;
  NSString *v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  p_photoDataCachesDirectory = &self->_photoDataCachesDirectory;
  v10 = self->_photoDataCachesDirectory;
  v11 = CFSTR("changes");
  switch(v6)
  {
    case 1:
      goto LABEL_17;
    case 2:
      v11 = CFSTR("ClientServerTransactions");
      goto LABEL_17;
    case 3:
      v11 = CFSTR("PhotoCloudSharingDataReimportCache");
      goto LABEL_17;
    case 4:
      v11 = CFSTR("GraphService");
      goto LABEL_17;
    case 5:
      v11 = CFSTR("VisionService");
      goto LABEL_17;
    case 6:
      v11 = CFSTR("MiroCache");
      goto LABEL_17;
    case 7:
      v11 = CFSTR("VariationCache");
      goto LABEL_17;
    case 8:
      v11 = CFSTR("libraryavailable");
      goto LABEL_17;
    case 9:
      v11 = CFSTR("streamsupdatingexpired");
      goto LABEL_17;
    case 10:
      v11 = CFSTR("StackedImages");
      goto LABEL_17;
    case 11:
      v11 = CFSTR("AutoloopCache");
      goto LABEL_17;
    case 12:
      p_photoDataCachesDirectory = &self->_photoDataDirectory;
      v11 = CFSTR("Caches/Internal/MemoriesRelated");
      goto LABEL_17;
    case 13:
      p_photoDataCachesDirectory = &self->_photoDataDirectory;
      v11 = CFSTR("MISC");
      goto LABEL_17;
    case 14:
      v11 = CFSTR("PhotosPickerLogs");
      goto LABEL_17;
    case 15:
      v11 = CFSTR("ComputeCache");
      goto LABEL_17;
    case 16:
      v11 = CFSTR("StoryMusicCache");
LABEL_17:
      -[NSString stringByAppendingPathComponent:](*p_photoDataCachesDirectory, "stringByAppendingPathComponent:", v11);
      v12 = objc_claimAutoreleasedReturnValue();

      v10 = (NSString *)v12;
      break;
    default:
      break;
  }
  -[PLPhotoLibraryPathManagerDCIM addToPath:leafType:additionalPathComponents:](self, "addToPath:leafType:additionalPathComponents:", v10, v5, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)simpleDCIMDirectory
{
  PLPhotoLibraryPathManagerDCIM *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PLSimpleDCIMDirectory *v9;
  PLSimpleDCIMDirectory *simpleDCIMDirectory;
  NSObject *v11;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_simpleDCIMDirectory)
  {
    v3 = (void *)MEMORY[0x1E0C99E98];
    -[PLPhotoLibraryPathManagerCore photoDirectoryWithType:](v2, "photoDirectoryWithType:", 4);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fileURLWithPath:isDirectory:", v4, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    -[PLPhotoLibraryPathManagerCore privateCacheDirectoryWithSubType:createIfNeeded:error:](v2, "privateCacheDirectoryWithSubType:createIfNeeded:error:", 13, 1, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLSimpleDCIMDirectory cameraRollPlistName](PLSimpleDCIMDirectory, "cameraRollPlistName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingPathComponent:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 && v8)
    {
      v9 = -[PLSimpleDCIMDirectory initWithDirectoryURL:subDirectorySuffix:perDirectoryLimit:userInfoPath:]([PLSimpleDCIMDirectory alloc], "initWithDirectoryURL:subDirectorySuffix:perDirectoryLimit:userInfoPath:", v5, 0, 999, v8);
      simpleDCIMDirectory = v2->_simpleDCIMDirectory;
      v2->_simpleDCIMDirectory = v9;

      -[PLSimpleDCIMDirectory setRepresentsCameraRoll:](v2->_simpleDCIMDirectory, "setRepresentsCameraRoll:", 1);
    }
    else
    {
      PLBackendGetLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v13 = 138412546;
        v14 = v5;
        v15 = 2112;
        v16 = v8;
        _os_log_impl(&dword_199DF7000, v11, OS_LOG_TYPE_ERROR, "Failed to get either DCIM directory (%@) or user info path (%@)", (uint8_t *)&v13, 0x16u);
      }

    }
  }
  objc_sync_exit(v2);

  return v2->_simpleDCIMDirectory;
}

- (id)getImportFileManager
{
  PLPhotoLibraryPathManagerDCIM *v2;
  PLImportFileManager *v3;
  PLImportFileManager *importFileManager;

  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_importFileManager)
  {
    v3 = objc_alloc_init(PLImportFileManager);
    importFileManager = v2->_importFileManager;
    v2->_importFileManager = v3;

  }
  objc_sync_exit(v2);

  return v2->_importFileManager;
}

- (id)clientOwnedDirectoryPathsForClientAccess:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (objc_class *)MEMORY[0x1E0C99E08];
  v5 = a3;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v5, "trustedCallerBundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLPhotoLibraryPathManagerDCIM _externalDirectoryWithBundleIdentifier:createIfNeeded:](self, "_externalDirectoryWithBundleIdentifier:createIfNeeded:", v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v8);
  -[PLPhotoLibraryPathManagerCore privateDirectoryWithBundleIdentifier:createIfNeeded:](self, "privateDirectoryWithBundleIdentifier:createIfNeeded:", v7, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v9);

  return v6;
}

- (id)captureSessionPathsWithClientAuthorization:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "captureSessionState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "limitedLibraryMode") & 1) != 0 || objc_msgSend(v5, "type") != 3)
  {
    v14 = (void *)MEMORY[0x1E0C9AA70];
  }
  else
  {
    -[PLPhotoLibraryPathManagerDCIM unlockedCaptureSessionPaths](self, "unlockedCaptureSessionPaths");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      v12 = MEMORY[0x1E0C9AAA0];
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13++), (_QWORD)v16);
        }
        while (v10 != v13);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v10);
    }

    v14 = (void *)objc_msgSend(v7, "copy");
  }

  return v14;
}

- (id)unlockedCaptureSessionPaths
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v15;
  void *v16;
  _QWORD v17[10];

  v17[9] = *MEMORY[0x1E0C80C00];
  -[PLPhotoLibraryPathManagerCore photoDirectoryWithType:createIfNeeded:error:](self, "photoDirectoryWithType:createIfNeeded:error:", 4, 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v3;
  -[PLPhotoLibraryPathManagerCore photoDirectoryWithType:createIfNeeded:error:](self, "photoDirectoryWithType:createIfNeeded:error:", 13, 1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v4;
  -[PLPhotoLibraryPathManagerDCIM photoMetadataDirectory](self, "photoMetadataDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v5;
  -[PLPhotoLibraryPathManagerCore photoDirectoryWithType:createIfNeeded:error:](self, "photoDirectoryWithType:createIfNeeded:error:", 9, 1, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v6;
  -[PLPhotoLibraryPathManagerCore photoDirectoryWithType:createIfNeeded:error:](self, "photoDirectoryWithType:createIfNeeded:error:", 22, 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[4] = v7;
  -[PLPhotoLibraryPathManagerDCIM iTunesPhotosSyncDirectory](self, "iTunesPhotosSyncDirectory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17[5] = v8;
  -[PLPhotoLibraryPathManagerCore photoDirectoryWithType:createIfNeeded:error:](self, "photoDirectoryWithType:createIfNeeded:error:", 11, 1, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[6] = v9;
  -[PLPhotoLibraryPathManagerCore photoDirectoryWithType:createIfNeeded:error:](self, "photoDirectoryWithType:createIfNeeded:error:", 14, 1, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[7] = v10;
  -[PLPhotoLibraryPathManagerDCIM syncInfoPath](self, "syncInfoPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[8] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  PLBackendGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v15 = 138412290;
    v16 = v12;
    _os_log_impl(&dword_199DF7000, v13, OS_LOG_TYPE_DEBUG, "Unlocked capture session paths: paths: %@", (uint8_t *)&v15, 0xCu);
  }

  return v12;
}

- (id)pathsForPermissionCheck
{
  return objc_alloc_init(MEMORY[0x1E0C99E60]);
}

- (id)createPathsForNewLibraries
{
  return objc_alloc_init(MEMORY[0x1E0C99E60]);
}

- (id)pathsForExternalWriters
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[PLPhotoLibraryPathManagerDCIM _externalDirectoryWithBundleIdentifier:createIfNeeded:](self, "_externalDirectoryWithBundleIdentifier:createIfNeeded:", 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)pathsForLibraryFilesystemSizeCalculation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  -[PLPhotoLibraryPathManagerCore iTunesPhotosDirectory](self, "iTunesPhotosDirectory", self->_photoDataDirectory, self->_dcimDirectory);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)pathsForFinderSyncFilesystemSizeCalculation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];

  v12[4] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E60];
  -[PLPhotoLibraryPathManagerCore iTunesPhotosDirectory](self, "iTunesPhotosDirectory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v4;
  -[PLPhotoLibraryPathManagerCore iTunesPhotosDirectory](self, "iTunesPhotosDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoLibraryPathManagerDCIM photoMetadataDirectoryForMediaInMainDirectory:](self, "photoMetadataDirectoryForMediaInMainDirectory:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v6;
  -[PLPhotoLibraryPathManagerDCIM iTunesSyncedAssetsDirectory](self, "iTunesSyncedAssetsDirectory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v7;
  -[PLPhotoLibraryPathManagerDCIM iTunesSyncedAssetMetadataThumbnailsDirectory](self, "iTunesSyncedAssetMetadataThumbnailsDirectory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)privateDirectoryWithSubType:(unsigned __int8)a3 leafType:(unsigned __int8)a4 additionalPathComponents:(id)a5
{
  uint64_t v5;
  int v6;
  id v8;
  uint64_t v9;
  NSString *photoDataDirectory;
  const __CFString *v11;
  id v12;
  void *v13;
  void *v14;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  switch(v6)
  {
    case 0:
    case 11:
      v9 = 232;
      goto LABEL_10;
    case 1:
      photoDataDirectory = self->_photoDataDirectory;
      v11 = CFSTR("imagewriter");
      goto LABEL_14;
    case 2:
      photoDataDirectory = self->_photoDataDirectory;
      v11 = CFSTR("OutgoingTemp");
      goto LABEL_14;
    case 3:
      v9 = 272;
      goto LABEL_10;
    case 4:
      photoDataDirectory = self->_photoDataDirectory;
      v11 = CFSTR("AlbumsMetadata");
      goto LABEL_14;
    case 5:
      photoDataDirectory = self->_photoDataDirectory;
      v11 = CFSTR("FacesMetadata");
      goto LABEL_14;
    case 6:
      photoDataDirectory = self->_dcimDirectory;
      v11 = CFSTR("ASSETS");
      goto LABEL_14;
    case 7:
      v9 = 208;
LABEL_10:
      v12 = *(id *)((char *)&self->super.super.isa + v9);
      goto LABEL_15;
    case 8:
      photoDataDirectory = self->_photoDataDirectory;
      v11 = CFSTR("CaptureDebug");
      goto LABEL_14;
    case 9:
      photoDataDirectory = self->_photoDataDirectory;
      v11 = CFSTR("CameraMetadata");
      goto LABEL_14;
    case 10:
      photoDataDirectory = self->_privateDirectory;
      v11 = CFSTR("computecache");
LABEL_14:
      -[NSString stringByAppendingPathComponent:](photoDataDirectory, "stringByAppendingPathComponent:", v11);
      v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:
      v13 = v12;
      break;
    default:
      v13 = 0;
      break;
  }
  -[PLPhotoLibraryPathManagerDCIM addToPath:leafType:additionalPathComponents:](self, "addToPath:leafType:additionalPathComponents:", v13, v5, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)externalDirectoryWithSubType:(unsigned __int8)a3 leafType:(unsigned __int8)a4 additionalPathComponents:(id)a5
{
  uint64_t v5;
  int v6;
  id v8;
  NSString *externalDirectory;
  __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  if ((v6 - 2) >= 2)
  {
    if (v6 != 1)
    {
      v13 = 0;
      goto LABEL_7;
    }
    -[PLPhotoLibraryPathManagerDCIM getImportFileManager](self, "getImportFileManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "urlForNewDCIMFolderWithFolderNumber:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    externalDirectory = self->_externalDirectory;
    v10 = off_1E376BE40[v6];
    -[__CFString substringFromIndex:](v10, "substringFromIndex:", objc_msgSend(CFSTR("PLPhotoLibraryExternalPathType"), "length"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lowercaseString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSString stringByAppendingPathComponent:](externalDirectory, "stringByAppendingPathComponent:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_7:
  -[PLPhotoLibraryPathManagerDCIM addToPath:leafType:additionalPathComponents:](self, "addToPath:leafType:additionalPathComponents:", v13, v5, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)internalDirectoryWithSubType:(unsigned __int8)a3 additionalPathComponents:(id)a4
{
  int v4;
  id v6;
  NSString *internalDirectory;
  __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSString *v13;
  const __CFString *v14;
  void *v15;
  uint8_t v17[16];

  v4 = a3;
  v6 = a4;
  switch(v4)
  {
    case 0:
    case 6:
      PLBackendGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_199DF7000, v12, OS_LOG_TYPE_FAULT, "Invalid subtype for internal location", v17, 2u);
      }

      goto LABEL_6;
    case 1:
    case 3:
    case 4:
      internalDirectory = self->_internalDirectory;
      v8 = off_1E376BE60[v4];
      -[__CFString substringFromIndex:](v8, "substringFromIndex:", objc_msgSend(CFSTR("PLPhotoLibraryInternalPathType"), "length"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lowercaseString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSString stringByAppendingPathComponent:](internalDirectory, "stringByAppendingPathComponent:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    case 2:
      v13 = self->_internalDirectory;
      v14 = CFSTR("lofr");
      goto LABEL_9;
    case 5:
      v13 = self->_internalDirectory;
      v14 = CFSTR("csutaxonomy");
LABEL_9:
      -[NSString stringByAppendingPathComponent:](v13, "stringByAppendingPathComponent:", v14);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
LABEL_6:
      v11 = 0;
      break;
  }
  -[PLPhotoLibraryPathManagerDCIM addToPath:leafType:additionalPathComponents:](self, "addToPath:leafType:additionalPathComponents:", v11, 1, v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)pathToAssetsToAlbumsMapping
{
  return -[NSString stringByAppendingPathComponent:](self->_photoDataDirectory, "stringByAppendingPathComponent:", CFSTR("assetsToAlbumsMapping.plist"));
}

- (id)syncInfoPath
{
  return -[NSString stringByAppendingPathComponent:](self->_photoDataDirectory, "stringByAppendingPathComponent:", CFSTR("syncInfo.plist"));
}

- (id)readOnlyUrlWithIdentifier:(id)a3
{
  PLLazyObject *lazyPathManagerForUBFOnDCIM;
  id v4;
  void *v5;
  void *v6;

  lazyPathManagerForUBFOnDCIM = self->_lazyPathManagerForUBFOnDCIM;
  v4 = a3;
  -[PLLazyObject objectValue](lazyPathManagerForUBFOnDCIM, "objectValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "readOnlyUrlWithIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setExtendedAttributesWithIdentifier:(id)a3
{
  PLLazyObject *lazyPathManagerForUBFOnDCIM;
  id v4;
  id v5;

  lazyPathManagerForUBFOnDCIM = self->_lazyPathManagerForUBFOnDCIM;
  v4 = a3;
  -[PLLazyObject objectValue](lazyPathManagerForUBFOnDCIM, "objectValue");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExtendedAttributesWithIdentifier:", v4);

}

- (void)setExtendedAttributesWithIdentifier:(id)a3 andURL:(id)a4
{
  PLLazyObject *lazyPathManagerForUBFOnDCIM;
  id v6;
  id v7;
  id v8;

  lazyPathManagerForUBFOnDCIM = self->_lazyPathManagerForUBFOnDCIM;
  v6 = a4;
  v7 = a3;
  -[PLLazyObject objectValue](lazyPathManagerForUBFOnDCIM, "objectValue");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setExtendedAttributesWithIdentifier:andURL:", v7, v6);

}

- (void)obtainAccessAndWaitWithFileWithIdentifier:(id)a3 mode:(unsigned __int8)a4 toURLWithHandler:(id)a5
{
  uint64_t v5;
  PLLazyObject *lazyPathManagerForUBFOnDCIM;
  id v8;
  id v9;
  id v10;

  v5 = a4;
  lazyPathManagerForUBFOnDCIM = self->_lazyPathManagerForUBFOnDCIM;
  v8 = a5;
  v9 = a3;
  -[PLLazyObject objectValue](lazyPathManagerForUBFOnDCIM, "objectValue");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "obtainAccessAndWaitWithFileWithIdentifier:mode:toURLWithHandler:", v9, v5, v8);

}

- (id)photoMetadataDirectoryForMediaInMainDirectory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[PLPhotoLibraryPathManagerDCIM photoMetadataDirectory](self, "photoMetadataDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoLibraryPathManagerDCIM assetAbbreviatedMetadataDirectoryForDirectory:type:bundleScope:](self, "assetAbbreviatedMetadataDirectoryForDirectory:type:bundleScope:", v4, 31, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringByAppendingPathComponent:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)assetAbbreviatedMetadataDirectoryForDirectory:(id)a3 type:(unsigned __int8)a4 bundleScope:(unsigned __int16)a5
{
  uint64_t v5;
  id v7;
  void *v8;
  void *v9;

  v5 = a4;
  v7 = a3;
  -[PLPhotoLibraryPathManagerCore photoDirectoryWithType:](self, "photoDirectoryWithType:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoLibraryPathManagerCore assetAbbreviatedMetadataDirectoryForDirectory:rootPath:](self, "assetAbbreviatedMetadataDirectoryForDirectory:rootPath:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)pathToAssetAlbumOrderStructure
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__PLPhotoLibraryPathManagerDCIM_pathToAssetAlbumOrderStructure__block_invoke;
  block[3] = &unk_1E376C6E0;
  block[4] = self;
  if (pathToAssetAlbumOrderStructure_onceToken != -1)
    dispatch_once(&pathToAssetAlbumOrderStructure_onceToken, block);
  return (id)pathToAssetAlbumOrderStructure_path;
}

- (id)assetMainFilePathWithDirectory:(id)a3 filename:(id)a4 bundleScope:(unsigned __int16)a5
{
  uint64_t v5;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v16;
  void *v17;

  v5 = a5;
  v9 = a3;
  v10 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPhotoLibraryPathManagerDCIM.m"), 729, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("directory"));

  }
  if (-[PLPhotoLibraryPathManagerCore bundleScope](self, "bundleScope"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPhotoLibraryPathManagerDCIM.m"), 730, CFSTR("can only access asset main file path on main bundle scoped path manager"));

  }
  if (-[PLPhotoLibraryPathManagerDCIM shouldUseFileIdentifierForBundleScope:](self, "shouldUseFileIdentifierForBundleScope:", v5))
  {
    -[PLLazyObject objectValue](self->_lazyPathManagerForUBFOnDCIM, "objectValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "assetMainFilePathWithDirectory:filename:bundleScope:", v9, v10, v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if ((objc_msgSend(v9, "hasPrefix:", CFSTR("/")) & 1) == 0)
    {
      -[PLPhotoLibraryPathManagerCore photoDirectoryWithType:](self, "photoDirectoryWithType:", 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringByAppendingPathComponent:", v9);
      v14 = objc_claimAutoreleasedReturnValue();

      v9 = (id)v14;
    }
    objc_msgSend(v9, "stringByAppendingPathComponent:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (id)cloudRestoreForegroundPhaseCompleteTokenPath
{
  return -[NSString stringByAppendingPathComponent:](self->_restoreInfoDirectory, "stringByAppendingPathComponent:", CFSTR("CloudRestoreForegroundComplete"));
}

- (id)cloudRestoreBackgroundPhaseInProgressTokenPath
{
  return -[NSString stringByAppendingPathComponent:](self->_restoreInfoDirectory, "stringByAppendingPathComponent:", CFSTR("CloudRestoreBackgroundInProgress"));
}

- (id)cloudRestoreCompleteTokenPath
{
  return -[NSString stringByAppendingPathComponent:](self->_restoreInfoDirectory, "stringByAppendingPathComponent:", CFSTR("CloudRestoreComplete"));
}

- (id)cloudRestoreContextPath
{
  return -[NSString stringByAppendingPathComponent:](self->_restoreInfoDirectory, "stringByAppendingPathComponent:", CFSTR("CloudRestoreContext.plist"));
}

- (id)modelRestorePostProcessingCompleteTokenPath
{
  return -[NSString stringByAppendingPathComponent:](self->_restoreInfoDirectory, "stringByAppendingPathComponent:", CFSTR("ModelRestorePostProcessingComplete"));
}

- (id)iTunesPhotosSyncDirectory
{
  void *v2;
  void *v3;

  -[PLPhotoLibraryPathManagerCore iTunesPhotosDirectory](self, "iTunesPhotosDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("Sync"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)iTunesSyncedAssetsDirectory
{
  return -[NSString stringByAppendingPathComponent:](self->_photoDataDirectory, "stringByAppendingPathComponent:", CFSTR("Sync"));
}

- (id)iTunesSyncedFaceDataDirectory
{
  void *v2;
  void *v3;

  -[PLPhotoLibraryPathManagerDCIM iTunesSyncedAssetsDirectory](self, "iTunesSyncedAssetsDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("FaceData"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)iTunesSyncedFaceAlbumThumbnailsDirectory
{
  void *v2;
  void *v3;

  -[PLPhotoLibraryPathManagerDCIM iTunesSyncedAssetsDirectory](self, "iTunesSyncedAssetsDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("FaceAlbumThumbnails"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)iTunesSyncedAssetMetadataThumbnailsDirectory
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3940];
  -[PLPhotoLibraryPathManagerDCIM photoMetadataDirectory](self, "photoMetadataDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  v7[1] = CFSTR("PhotoData");
  v7[2] = CFSTR("Sync");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathWithComponents:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)iTunesSyncedAssetSmallThumbnailsDirectory
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3940];
  v6[0] = self->_thumbnailsV2Directory;
  v6[1] = CFSTR("PhotoData");
  v6[2] = CFSTR("Sync");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathWithComponents:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)iTunesPhotosLastSyncMetadataFilePath
{
  void *v2;
  void *v3;

  -[PLPhotoLibraryPathManagerDCIM iTunesPhotosSyncDirectory](self, "iTunesPhotosSyncDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("PhotoLibrary.plist.lastsynced"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)iTunesPhotosSyncMetadataFilePath
{
  void *v2;
  void *v3;

  -[PLPhotoLibraryPathManagerDCIM iTunesPhotosSyncDirectory](self, "iTunesPhotosSyncDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("PhotoLibrary.plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)iTunesPhotosSyncCurrentLibraryUUIDPath
{
  void *v2;
  void *v3;

  -[PLPhotoLibraryPathManagerDCIM iTunesPhotosSyncDirectory](self, "iTunesPhotosSyncDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("CurrentLibraryUUID.plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)persistedAlbumDataDirectoryCreateIfNeeded:(BOOL)a3 error:(id *)a4
{
  _BOOL4 v5;
  void *v7;

  v5 = a3;
  -[NSString stringByAppendingPathComponent:](self->_photoDataDirectory, "stringByAppendingPathComponent:", CFSTR("AlbumsMetadata"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    -[PLPhotoLibraryPathManagerCore createDirectoryOnceWithPath:mask:pathType:error:](self, "createDirectoryOnceWithPath:mask:pathType:error:", v7, 7, 0, a4);
  return v7;
}

- (id)assetBaseFilenameForAdjustmentFilePath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x19AEC2E4C]();
  -[PLPhotoLibraryPathManagerCore photoDirectoryWithType:](self, "photoDirectoryWithType:", 9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "rangeOfString:", v6);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = v7;
    v10 = v8;
    if (objc_msgSend(v4, "length") > (unint64_t)(v7 + v8 + 14))
    {
      objc_msgSend(v4, "substringFromIndex:", v9 + v10 + 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "rangeOfString:", CFSTR("Adjustments"));
      if (v12)
      {
        if (v12 != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v11, "substringToIndex:", v12 - 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[PLPhotoLibraryPathManagerCore photoDirectoryWithType:](self, "photoDirectoryWithType:", 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "stringByAppendingPathComponent:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_11:
          goto LABEL_12;
        }
      }
      else
      {
        PLBackendGetLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v18 = 138412290;
          v19 = v4;
          _os_log_impl(&dword_199DF7000, v16, OS_LOG_TYPE_ERROR, "Found invalid adjustment path %@", (uint8_t *)&v18, 0xCu);
        }

      }
      v15 = 0;
      goto LABEL_11;
    }
  }
  v15 = 0;
LABEL_12:

  objc_autoreleasePoolPop(v5);
  return v15;
}

- (id)pathsGroupedByAssetBasePathFromFilePaths:(id)a3 populateInvalidAdjustmentPaths:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  const __CFString *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  __int128 v24;
  id v25;
  id obj;
  _QWORD v28[4];
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  const __CFString *v36;
  __int16 v37;
  void *v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v25 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v5;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v32;
    *(_QWORD *)&v8 = 138543618;
    v24 = v8;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v32 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "rangeOfString:", CFSTR("Mutations"), v24);
        if (v13 == 0x7FFFFFFFFFFFFFFFLL)
          objc_msgSend(v12, "stringByDeletingPathExtension");
        else
          -[PLPhotoLibraryPathManagerDCIM assetBaseFilenameForAdjustmentFilePath:](self, "assetBaseFilenameForAdjustmentFilePath:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          objc_msgSend(v6, "objectForKeyedSubscript:", v14);
          v15 = (id)objc_claimAutoreleasedReturnValue();
          if (!v15)
          {
            v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v6, "setObject:forKeyedSubscript:", v15, v14);
          }
          objc_msgSend(v15, "addObject:", v12);

        }
        else
        {
          PLBackendGetLog();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v24;
            v17 = CFSTR("adjustment resource");
            if (v13 == 0x7FFFFFFFFFFFFFFFLL)
              v17 = CFSTR("original resource");
            v36 = v17;
            v37 = 2112;
            v38 = v12;
            _os_log_impl(&dword_199DF7000, v16, OS_LOG_TYPE_ERROR, "Failed to resolve path base from %{public}@ path %@, skipping", buf, 0x16u);
          }

          if (v13 != 0x7FFFFFFFFFFFFFFFLL)
            objc_msgSend(v25, "addObject:", v12);
        }

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v9);
  }

  v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __105__PLPhotoLibraryPathManagerDCIM_pathsGroupedByAssetBasePathFromFilePaths_populateInvalidAdjustmentPaths___block_invoke;
  v28[3] = &unk_1E3768EA8;
  v19 = v6;
  v29 = v19;
  v30 = v18;
  v20 = v18;
  objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v28);
  objc_msgSend(v19, "removeObjectsForKeys:", v20);
  v21 = v30;
  v22 = v19;

  return v22;
}

- (BOOL)updateTimeMachineExclusionAttributeForExcludePath:(id)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)ensureFileProviderSyncExclusionAttributeIsSetWithError:(id *)a3
{
  return 1;
}

- (PLImportFileManager)importFileManager
{
  return self->_importFileManager;
}

void __105__PLPhotoLibraryPathManagerDCIM_pathsGroupedByAssetBasePathFromFilePaths_populateInvalidAdjustmentPaths___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD);
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __105__PLPhotoLibraryPathManagerDCIM_pathsGroupedByAssetBasePathFromFilePaths_populateInvalidAdjustmentPaths___block_invoke_2;
  v10[3] = &unk_1E3768E80;
  v11 = v5;
  v12 = *(id *)(a1 + 32);
  v13 = v6;
  v14 = *(id *)(a1 + 40);
  v7 = v6;
  v8 = v5;
  v9 = (void (**)(_QWORD, _QWORD))MEMORY[0x19AEC3014](v10);
  ((void (**)(_QWORD, const __CFString *))v9)[2](v9, CFSTR("S"));
  ((void (**)(_QWORD, const __CFString *))v9)[2](v9, CFSTR("D"));
  ((void (**)(_QWORD, const __CFString *))v9)[2](v9, CFSTR("X"));

}

void __105__PLPhotoLibraryPathManagerDCIM_pathsGroupedByAssetBasePathFromFilePaths_populateInvalidAdjustmentPaths___block_invoke_2(id *a1, uint64_t a2)
{
  void *v3;
  id v4;

  objc_msgSend(a1[4], "stringByAppendingString:", a2);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "objectForKeyedSubscript:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(a1[6], "addObjectsFromArray:", v3);
    objc_msgSend(a1[7], "addObject:", v4);
  }

}

void __63__PLPhotoLibraryPathManagerDCIM_pathToAssetAlbumOrderStructure__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "iTunesSyncedAssetsDirectory");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 304))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v6, 1, 0, 0);

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 304) = 1;
  }
  objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("assetsAlbumOrder"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "copy");
  v5 = (void *)pathToAssetAlbumOrderStructure_path;
  pathToAssetAlbumOrderStructure_path = v4;

}

+ (NSString)defaultDCIMPath
{
  return (NSString *)CFSTR("/var/mobile/Media/DCIM");
}

+ (id)allPhotosPathsOnThisDevice
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__PLPhotoLibraryPathManagerDCIM_allPhotosPathsOnThisDevice__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (allPhotosPathsOnThisDevice_onceToken_2175 != -1)
    dispatch_once(&allPhotosPathsOnThisDevice_onceToken_2175, block);
  return (id)allPhotosPathsOnThisDevice_bundlePaths_2176;
}

void __59__PLPhotoLibraryPathManagerDCIM_allPhotosPathsOnThisDevice__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  PLPhotoLibraryPathManagerDCIM *v4;
  void *v5;
  PLPhotoLibraryPathManagerDCIM *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = 0;
  while (1)
  {
    if (v3 == 1)
    {
      v4 = [PLPhotoLibraryPathManagerDCIM alloc];
      objc_msgSend(*(id *)(a1 + 32), "systemLibraryURL");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[PLPhotoLibraryPathManagerDCIM initWithLibraryURL:bundleScope:](v4, "initWithLibraryURL:bundleScope:", v5, 0);

      -[PLPhotoLibraryPathManagerCore photoDirectoryWithType:](v6, "photoDirectoryWithType:", 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v7);

      -[PLPhotoLibraryPathManagerCore photoDirectoryWithType:](v6, "photoDirectoryWithType:", 4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v8);

      -[PLPhotoLibraryPathManagerCore photoDirectoryWithType:](v6, "photoDirectoryWithType:", 14);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v9);

      -[PLPhotoLibraryPathManagerCore iTunesPhotosDirectory](v6, "iTunesPhotosDirectory");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObject:", v10);

      goto LABEL_6;
    }
    if (v3 == 3)
      break;
LABEL_6:
    if (++v3 == 4)
      goto LABEL_11;
  }
  +[PLPhotoLibraryPathManagerCore wellKnownPhotoLibraryURLForIdentifier:](PLPhotoLibraryPathManagerCore, "wellKnownPhotoLibraryURLForIdentifier:", 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "path");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObject:", v13);

  }
LABEL_11:
  v14 = (void *)allPhotosPathsOnThisDevice_bundlePaths_2176;
  allPhotosPathsOnThisDevice_bundlePaths_2176 = (uint64_t)v2;

}

@end
