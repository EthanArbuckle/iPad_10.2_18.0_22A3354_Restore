@implementation PLPhotoLibraryPathManagerUBF

- (PLPhotoLibraryPathManagerUBF)initWithLibraryURL:(id)a3 bundleScope:(unsigned __int16)a4
{
  PLPhotoLibraryPathManagerUBF *v4;
  PLPhotoLibraryPathManagerUBF *v5;
  void *v6;
  uint64_t v7;
  NSString *databaseDirectory;
  uint64_t v9;
  NSString *searchDatabaseDirectory;
  void *v11;
  uint64_t v12;
  NSString *originalsDirectory;
  void *v14;
  uint64_t v15;
  NSString *privateDirectory;
  uint64_t v17;
  NSString *privateCacheDirectory;
  uint64_t v19;
  NSString *restoreInfoDirectory;
  void *v21;
  uint64_t v22;
  NSString *scopesBaseDirectory;
  uint64_t v24;
  NSString *scopesPhotoCloudSharingDirectory;
  uint64_t v26;
  NSString *scopesPhotoCloudSharingDataDirectory;
  uint64_t v28;
  NSString *scopesPhotoCloudSharingMetadataDirectory;
  uint64_t v30;
  NSString *scopesPhotoCloudSharingCacheDirectory;
  uint64_t v32;
  NSString *scopesMomentSharedDirectory;
  uint64_t v34;
  NSString *scopesSyndicationDirectory;
  uint64_t v36;
  NSString *scopesLockedDirectory;
  void *v38;
  uint64_t v39;
  NSString *resourcesDirectory;
  void *v41;
  uint64_t v42;
  NSString *rendersDirectory;
  void *v44;
  uint64_t v45;
  NSString *derivativesDirectory;
  void *v47;
  uint64_t v48;
  NSString *derivativesThumbsDirectory;
  void *v50;
  uint64_t v51;
  NSString *derivativesMasterThumbsDirectory;
  void *v53;
  uint64_t v54;
  NSString *journalsDirectory;
  void *v56;
  uint64_t v57;
  NSString *resourcesCPLDataDirectory;
  void *v59;
  uint64_t v60;
  NSString *resourcesPhotoStreamsDataDirectory;
  void *v62;
  uint64_t v63;
  NSString *resourcesProjectsDataDirectory;
  void *v65;
  uint64_t v66;
  NSString *resourcesProjectsLegacyDirectory;
  void *v68;
  uint64_t v69;
  NSString *resourcesAnalyticsDirectory;
  void *v71;
  uint64_t v72;
  NSString *resourcesComputeDirectory;
  void *v74;
  uint64_t v75;
  NSString *resourcesSmartSharingDirectory;
  void *v77;
  uint64_t v78;
  NSString *resourcesPartialVideoDirectory;
  void *v80;
  uint64_t v81;
  NSString *externalDirectory;
  void *v83;
  uint64_t v84;
  NSString *internalDirectory;
  NSFileManager *v86;
  NSFileManager *fm;
  objc_super v89;

  v89.receiver = self;
  v89.super_class = (Class)PLPhotoLibraryPathManagerUBF;
  v4 = -[PLPhotoLibraryPathManagerCore initWithLibraryURL:bundleScope:](&v89, sel_initWithLibraryURL_bundleScope_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[PLPhotoLibraryPathManagerCore baseDirectory](v4, "baseDirectory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("database"));
    v7 = objc_claimAutoreleasedReturnValue();
    databaseDirectory = v5->_databaseDirectory;
    v5->_databaseDirectory = (NSString *)v7;

    -[NSString stringByAppendingPathComponent:](v5->_databaseDirectory, "stringByAppendingPathComponent:", CFSTR("search"));
    v9 = objc_claimAutoreleasedReturnValue();
    searchDatabaseDirectory = v5->_searchDatabaseDirectory;
    v5->_searchDatabaseDirectory = (NSString *)v9;

    -[PLPhotoLibraryPathManagerCore baseDirectory](v5, "baseDirectory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByAppendingPathComponent:", CFSTR("originals"));
    v12 = objc_claimAutoreleasedReturnValue();
    originalsDirectory = v5->_originalsDirectory;
    v5->_originalsDirectory = (NSString *)v12;

    PLBundleIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPhotoLibraryPathManagerCore privateDirectoryWithBundleIdentifier:createIfNeeded:](v5, "privateDirectoryWithBundleIdentifier:createIfNeeded:", v14, 0);
    v15 = objc_claimAutoreleasedReturnValue();
    privateDirectory = v5->_privateDirectory;
    v5->_privateDirectory = (NSString *)v15;

    -[NSString stringByAppendingPathComponent:](v5->_privateDirectory, "stringByAppendingPathComponent:", CFSTR("caches"));
    v17 = objc_claimAutoreleasedReturnValue();
    privateCacheDirectory = v5->_privateCacheDirectory;
    v5->_privateCacheDirectory = (NSString *)v17;

    -[NSString stringByAppendingPathComponent:](v5->_privateCacheDirectory, "stringByAppendingPathComponent:", CFSTR("restore"));
    v19 = objc_claimAutoreleasedReturnValue();
    restoreInfoDirectory = v5->_restoreInfoDirectory;
    v5->_restoreInfoDirectory = (NSString *)v19;

    -[PLPhotoLibraryPathManagerCore baseDirectory](v5, "baseDirectory");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringByAppendingPathComponent:", CFSTR("scopes"));
    v22 = objc_claimAutoreleasedReturnValue();
    scopesBaseDirectory = v5->_scopesBaseDirectory;
    v5->_scopesBaseDirectory = (NSString *)v22;

    -[NSString stringByAppendingPathComponent:](v5->_scopesBaseDirectory, "stringByAppendingPathComponent:", CFSTR("cloudsharing"));
    v24 = objc_claimAutoreleasedReturnValue();
    scopesPhotoCloudSharingDirectory = v5->_scopesPhotoCloudSharingDirectory;
    v5->_scopesPhotoCloudSharingDirectory = (NSString *)v24;

    -[NSString stringByAppendingPathComponent:](v5->_scopesPhotoCloudSharingDirectory, "stringByAppendingPathComponent:", CFSTR("data"));
    v26 = objc_claimAutoreleasedReturnValue();
    scopesPhotoCloudSharingDataDirectory = v5->_scopesPhotoCloudSharingDataDirectory;
    v5->_scopesPhotoCloudSharingDataDirectory = (NSString *)v26;

    -[NSString stringByAppendingPathComponent:](v5->_scopesPhotoCloudSharingDirectory, "stringByAppendingPathComponent:", CFSTR("metadata"));
    v28 = objc_claimAutoreleasedReturnValue();
    scopesPhotoCloudSharingMetadataDirectory = v5->_scopesPhotoCloudSharingMetadataDirectory;
    v5->_scopesPhotoCloudSharingMetadataDirectory = (NSString *)v28;

    -[NSString stringByAppendingPathComponent:](v5->_scopesPhotoCloudSharingDirectory, "stringByAppendingPathComponent:", CFSTR("caches"));
    v30 = objc_claimAutoreleasedReturnValue();
    scopesPhotoCloudSharingCacheDirectory = v5->_scopesPhotoCloudSharingCacheDirectory;
    v5->_scopesPhotoCloudSharingCacheDirectory = (NSString *)v30;

    -[NSString stringByAppendingPathComponent:](v5->_scopesBaseDirectory, "stringByAppendingPathComponent:", CFSTR("momentshared"));
    v32 = objc_claimAutoreleasedReturnValue();
    scopesMomentSharedDirectory = v5->_scopesMomentSharedDirectory;
    v5->_scopesMomentSharedDirectory = (NSString *)v32;

    -[NSString stringByAppendingPathComponent:](v5->_scopesBaseDirectory, "stringByAppendingPathComponent:", CFSTR("syndication"));
    v34 = objc_claimAutoreleasedReturnValue();
    scopesSyndicationDirectory = v5->_scopesSyndicationDirectory;
    v5->_scopesSyndicationDirectory = (NSString *)v34;

    -[NSString stringByAppendingPathComponent:](v5->_scopesBaseDirectory, "stringByAppendingPathComponent:", CFSTR("locked"));
    v36 = objc_claimAutoreleasedReturnValue();
    scopesLockedDirectory = v5->_scopesLockedDirectory;
    v5->_scopesLockedDirectory = (NSString *)v36;

    -[PLPhotoLibraryPathManagerCore baseDirectory](v5, "baseDirectory");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "stringByAppendingPathComponent:", CFSTR("resources"));
    v39 = objc_claimAutoreleasedReturnValue();
    resourcesDirectory = v5->_resourcesDirectory;
    v5->_resourcesDirectory = (NSString *)v39;

    -[PLPhotoLibraryPathManagerCore baseDirectory](v5, "baseDirectory");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "stringByAppendingPathComponent:", CFSTR("resources/renders"));
    v42 = objc_claimAutoreleasedReturnValue();
    rendersDirectory = v5->_rendersDirectory;
    v5->_rendersDirectory = (NSString *)v42;

    -[PLPhotoLibraryPathManagerCore baseDirectory](v5, "baseDirectory");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "stringByAppendingPathComponent:", CFSTR("resources/derivatives"));
    v45 = objc_claimAutoreleasedReturnValue();
    derivativesDirectory = v5->_derivativesDirectory;
    v5->_derivativesDirectory = (NSString *)v45;

    -[PLPhotoLibraryPathManagerCore baseDirectory](v5, "baseDirectory");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "stringByAppendingPathComponent:", CFSTR("resources/derivatives/thumbs"));
    v48 = objc_claimAutoreleasedReturnValue();
    derivativesThumbsDirectory = v5->_derivativesThumbsDirectory;
    v5->_derivativesThumbsDirectory = (NSString *)v48;

    -[PLPhotoLibraryPathManagerCore baseDirectory](v5, "baseDirectory");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "stringByAppendingPathComponent:", CFSTR("resources/derivatives/masters"));
    v51 = objc_claimAutoreleasedReturnValue();
    derivativesMasterThumbsDirectory = v5->_derivativesMasterThumbsDirectory;
    v5->_derivativesMasterThumbsDirectory = (NSString *)v51;

    -[PLPhotoLibraryPathManagerCore baseDirectory](v5, "baseDirectory");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "stringByAppendingPathComponent:", CFSTR("resources/journals"));
    v54 = objc_claimAutoreleasedReturnValue();
    journalsDirectory = v5->_journalsDirectory;
    v5->_journalsDirectory = (NSString *)v54;

    -[PLPhotoLibraryPathManagerCore baseDirectory](v5, "baseDirectory");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "stringByAppendingPathComponent:", CFSTR("resources/cpl"));
    v57 = objc_claimAutoreleasedReturnValue();
    resourcesCPLDataDirectory = v5->_resourcesCPLDataDirectory;
    v5->_resourcesCPLDataDirectory = (NSString *)v57;

    -[PLPhotoLibraryPathManagerCore baseDirectory](v5, "baseDirectory");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "stringByAppendingPathComponent:", CFSTR("resources/streams"));
    v60 = objc_claimAutoreleasedReturnValue();
    resourcesPhotoStreamsDataDirectory = v5->_resourcesPhotoStreamsDataDirectory;
    v5->_resourcesPhotoStreamsDataDirectory = (NSString *)v60;

    -[PLPhotoLibraryPathManagerCore baseDirectory](v5, "baseDirectory");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "stringByAppendingPathComponent:", CFSTR("resources/projects/data"));
    v63 = objc_claimAutoreleasedReturnValue();
    resourcesProjectsDataDirectory = v5->_resourcesProjectsDataDirectory;
    v5->_resourcesProjectsDataDirectory = (NSString *)v63;

    -[PLPhotoLibraryPathManagerCore baseDirectory](v5, "baseDirectory");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "stringByAppendingPathComponent:", CFSTR("resources/projects/legacy"));
    v66 = objc_claimAutoreleasedReturnValue();
    resourcesProjectsLegacyDirectory = v5->_resourcesProjectsLegacyDirectory;
    v5->_resourcesProjectsLegacyDirectory = (NSString *)v66;

    -[PLPhotoLibraryPathManagerCore baseDirectory](v5, "baseDirectory");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "stringByAppendingPathComponent:", CFSTR("resources/caches/analytics"));
    v69 = objc_claimAutoreleasedReturnValue();
    resourcesAnalyticsDirectory = v5->_resourcesAnalyticsDirectory;
    v5->_resourcesAnalyticsDirectory = (NSString *)v69;

    -[PLPhotoLibraryPathManagerCore baseDirectory](v5, "baseDirectory");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "stringByAppendingPathComponent:", CFSTR("resources/caches/compute"));
    v72 = objc_claimAutoreleasedReturnValue();
    resourcesComputeDirectory = v5->_resourcesComputeDirectory;
    v5->_resourcesComputeDirectory = (NSString *)v72;

    -[PLPhotoLibraryPathManagerCore baseDirectory](v5, "baseDirectory");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "stringByAppendingPathComponent:", CFSTR("resources/smartsharing"));
    v75 = objc_claimAutoreleasedReturnValue();
    resourcesSmartSharingDirectory = v5->_resourcesSmartSharingDirectory;
    v5->_resourcesSmartSharingDirectory = (NSString *)v75;

    -[PLPhotoLibraryPathManagerCore baseDirectory](v5, "baseDirectory");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "stringByAppendingPathComponent:", CFSTR("resources/partialvideo"));
    v78 = objc_claimAutoreleasedReturnValue();
    resourcesPartialVideoDirectory = v5->_resourcesPartialVideoDirectory;
    v5->_resourcesPartialVideoDirectory = (NSString *)v78;

    PLBundleIdentifier();
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPhotoLibraryPathManagerUBF _externalDirectoryWithBundleIdentifier:createIfNeeded:](v5, "_externalDirectoryWithBundleIdentifier:createIfNeeded:", v80, 0);
    v81 = objc_claimAutoreleasedReturnValue();
    externalDirectory = v5->_externalDirectory;
    v5->_externalDirectory = (NSString *)v81;

    -[PLPhotoLibraryPathManagerCore baseDirectory](v5, "baseDirectory");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "stringByAppendingPathComponent:", CFSTR("internal"));
    v84 = objc_claimAutoreleasedReturnValue();
    internalDirectory = v5->_internalDirectory;
    v5->_internalDirectory = (NSString *)v84;

    v86 = (NSFileManager *)objc_alloc_init(MEMORY[0x1E0CB3620]);
    fm = v5->_fm;
    v5->_fm = v86;

    -[PLPhotoLibraryPathManagerCore postInit](v5, "postInit");
  }
  return v5;
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
  -[PLPhotoLibraryPathManagerUBF convertPhotoLibraryPathType:](self, "convertPhotoLibraryPathType:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoLibraryPathManagerUBF addToPath:leafType:additionalPathComponents:](self, "addToPath:leafType:additionalPathComponents:", v9, v5, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)convertPhotoLibraryPathType:(unsigned __int8)a3
{
  uint64_t v3;
  id v4;

  switch(a3)
  {
    case 0u:
    case 0x23u:
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Invalid path type conversion: %s"), "-[PLPhotoLibraryPathManagerUBF convertPhotoLibraryPathType:]");
      goto LABEL_35;
    case 1u:
    case 0x1Cu:
      -[PLPhotoLibraryPathManagerCore baseDirectory](self, "baseDirectory");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      return v4;
    case 2u:
      v3 = 128;
      goto LABEL_32;
    case 3u:
      v3 = 136;
      goto LABEL_32;
    case 4u:
    case 0x1Du:
    case 0x1Fu:
      v3 = 144;
      goto LABEL_32;
    case 5u:
    case 0x21u:
      v3 = 152;
      goto LABEL_32;
    case 6u:
      v3 = 160;
      goto LABEL_32;
    case 7u:
      v3 = 240;
      goto LABEL_32;
    case 8u:
      v3 = 248;
      goto LABEL_32;
    case 9u:
      v3 = 256;
      goto LABEL_32;
    case 0xAu:
      v3 = 264;
      goto LABEL_32;
    case 0xBu:
      v3 = 272;
      goto LABEL_32;
    case 0xCu:
      v3 = 280;
      goto LABEL_32;
    case 0xDu:
    case 0x22u:
      v3 = 288;
      goto LABEL_32;
    case 0xEu:
      v3 = 296;
      goto LABEL_32;
    case 0xFu:
      v3 = 304;
      goto LABEL_32;
    case 0x10u:
      v3 = 312;
      goto LABEL_32;
    case 0x11u:
      v3 = 320;
      goto LABEL_32;
    case 0x12u:
      v3 = 328;
      goto LABEL_32;
    case 0x13u:
      v3 = 344;
      goto LABEL_32;
    case 0x14u:
      v3 = 336;
      goto LABEL_32;
    case 0x15u:
      v3 = 184;
      goto LABEL_32;
    case 0x16u:
      v3 = 192;
      goto LABEL_32;
    case 0x17u:
      v3 = 200;
      goto LABEL_32;
    case 0x18u:
      v3 = 208;
      goto LABEL_32;
    case 0x19u:
      v3 = 224;
      goto LABEL_32;
    case 0x1Au:
      v3 = 216;
      goto LABEL_32;
    case 0x1Bu:
      v3 = 232;
LABEL_32:
      v4 = *(id *)((char *)&self->super.super.isa + v3);
      break;
    case 0x1Eu:
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Invalid video key frames legacy path type (non-UBF only): %s"), "-[PLPhotoLibraryPathManagerUBF convertPhotoLibraryPathType:]");
LABEL_35:
      v4 = 0;
      break;
    case 0x20u:
      -[PLPhotoLibraryPathManagerUBF photoDirectoryWithType:leafType:additionalPathComponents:](self, "photoDirectoryWithType:leafType:additionalPathComponents:", 13, 3, 0);
      v4 = (id)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v4 = 0;
      break;
  }
  return v4;
}

- (id)addToPath:(id)a3 leafType:(unsigned __int8)a4 additionalPathComponents:(id)a5
{
  int v6;
  id v7;
  id v8;
  id v9;
  id v10;
  __CFString *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v6 = a4;
  v7 = a3;
  v8 = a5;
  switch(v6)
  {
    case 0:
    case 4:
      v9 = v7;
      goto LABEL_10;
    case 1:
      v10 = v7;
      goto LABEL_7;
    case 2:
      v11 = CFSTR("PLPhotoLibrarySubPathLeafTypeDerivatives");
      objc_msgSend(CFSTR("PLPhotoLibrarySubPathLeafTypeDerivatives"), "substringFromIndex:", objc_msgSend(CFSTR("PLPhotoLibrarySubPathLeafType"), "length"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lowercaseString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "stringByAppendingPathComponent:", v13);
      v9 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_8;
    case 3:
      objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("cloudsync.noindex"));
      v10 = (id)objc_claimAutoreleasedReturnValue();
LABEL_7:
      v9 = v10;
      goto LABEL_8;
    default:
      v9 = 0;
LABEL_8:
      if (objc_msgSend(v8, "length"))
      {
        objc_msgSend(v9, "stringByAppendingPathComponent:", v8);
        v14 = objc_claimAutoreleasedReturnValue();

        v9 = (id)v14;
      }
LABEL_10:

      return v9;
  }
}

- (id)basePrivateDirectoryPath
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3940];
  -[PLPhotoLibraryPathManagerCore baseDirectory](self, "baseDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  v7[1] = CFSTR("private");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathWithComponents:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_externalDirectoryWithBundleIdentifier:(id)a3 createIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _BOOL4 v13;
  id v14;
  NSObject *v15;
  id v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  id v23;
  _QWORD v24[3];

  v4 = a4;
  v24[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1E0CB3940];
  -[PLPhotoLibraryPathManagerCore baseDirectory](self, "baseDirectory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v8;
  v24[1] = CFSTR("external");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pathWithComponents:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v10, "stringByAppendingPathComponent:", v6);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = v10;
  }
  v12 = v11;
  if (v4)
  {
    v17 = 0;
    v13 = -[PLPhotoLibraryPathManagerCore validateCreationRequestWithError:](self, "validateCreationRequestWithError:", &v17);
    v14 = v17;
    if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v15 = objc_claimAutoreleasedReturnValue();
      -[NSObject createDirectoryAtPath:withIntermediateDirectories:attributes:error:](v15, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v12, 1, 0, 0);
    }
    else
    {
      PLBackendGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136446722;
        v19 = "-[PLPhotoLibraryPathManagerUBF _externalDirectoryWithBundleIdentifier:createIfNeeded:]";
        v20 = 2112;
        v21 = v12;
        v22 = 2112;
        v23 = v14;
        _os_log_impl(&dword_199DF7000, v15, OS_LOG_TYPE_ERROR, "%{public}s: failed to create directory: %@ with error: %@", buf, 0x20u);
      }
    }

  }
  return v12;
}

- (unsigned)photoLibraryPathTypeForBundleScope:(unsigned __int16)a3
{
  unint64_t v3;

  v3 = 0x1B1A151901uLL >> (8 * a3);
  if (a3 >= 6u)
    LOBYTE(v3) = 0;
  return v3 & 0x1F;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fm, 0);
  objc_storeStrong((id *)&self->_internalDirectory, 0);
  objc_storeStrong((id *)&self->_externalDirectory, 0);
  objc_storeStrong((id *)&self->_resourcesPartialVideoDirectory, 0);
  objc_storeStrong((id *)&self->_resourcesSmartSharingDirectory, 0);
  objc_storeStrong((id *)&self->_resourcesComputeDirectory, 0);
  objc_storeStrong((id *)&self->_resourcesAnalyticsDirectory, 0);
  objc_storeStrong((id *)&self->_resourcesProjectsLegacyDirectory, 0);
  objc_storeStrong((id *)&self->_resourcesProjectsDataDirectory, 0);
  objc_storeStrong((id *)&self->_resourcesPhotoStreamsDataDirectory, 0);
  objc_storeStrong((id *)&self->_resourcesCPLDataDirectory, 0);
  objc_storeStrong((id *)&self->_derivativesMasterThumbsDirectory, 0);
  objc_storeStrong((id *)&self->_derivativesThumbsDirectory, 0);
  objc_storeStrong((id *)&self->_derivativesDirectory, 0);
  objc_storeStrong((id *)&self->_rendersDirectory, 0);
  objc_storeStrong((id *)&self->_journalsDirectory, 0);
  objc_storeStrong((id *)&self->_resourcesDirectory, 0);
  objc_storeStrong((id *)&self->_scopesLockedDirectory, 0);
  objc_storeStrong((id *)&self->_scopesMomentSharedDirectory, 0);
  objc_storeStrong((id *)&self->_scopesSyndicationDirectory, 0);
  objc_storeStrong((id *)&self->_scopesPhotoCloudSharingCacheDirectory, 0);
  objc_storeStrong((id *)&self->_scopesPhotoCloudSharingMetadataDirectory, 0);
  objc_storeStrong((id *)&self->_scopesPhotoCloudSharingDataDirectory, 0);
  objc_storeStrong((id *)&self->_scopesPhotoCloudSharingDirectory, 0);
  objc_storeStrong((id *)&self->_scopesBaseDirectory, 0);
  objc_storeStrong((id *)&self->_restoreInfoDirectory, 0);
  objc_storeStrong((id *)&self->_privateCacheDirectory, 0);
  objc_storeStrong((id *)&self->_privateDirectory, 0);
  objc_storeStrong((id *)&self->_originalsDirectory, 0);
  objc_storeStrong((id *)&self->_searchDatabaseDirectory, 0);
  objc_storeStrong((id *)&self->_databaseDirectory, 0);
}

- (id)photosDatabasePath
{
  return -[NSString stringByAppendingPathComponent:](self->_databaseDirectory, "stringByAppendingPathComponent:", CFSTR("Photos.sqlite"));
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

  -[PLPhotoLibraryPathManagerUBF _externalDirectoryWithBundleIdentifier:createIfNeeded:](self, "_externalDirectoryWithBundleIdentifier:createIfNeeded:", v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v8);
  -[PLPhotoLibraryPathManagerCore privateDirectoryWithBundleIdentifier:createIfNeeded:](self, "privateDirectoryWithBundleIdentifier:createIfNeeded:", v7, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v9);

  return v6;
}

- (id)pathsForClientAccess:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v44;
  int v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "directDatabaseAccessAuthorized");
  -[PLPhotoLibraryPathManagerUBF _externalDirectoryWithBundleIdentifier:createIfNeeded:](self, "_externalDirectoryWithBundleIdentifier:createIfNeeded:", 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v46 = v5;
  -[PLPhotoLibraryPathManagerUBF corePathsWithError:directDatabaseAccess:limitedLibrary:](self, "corePathsWithError:directDatabaseAccess:limitedLibrary:", 0, v5, objc_msgSend(v4, "limitedLibraryMode"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v49;
    v12 = MEMORY[0x1E0C9AAA0];
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v49 != v11)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        if ((objc_msgSend(v14, "hasPrefix:", v6) & 1) == 0)
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, v14);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    }
    while (v10);
  }

  -[PLPhotoLibraryPathManagerUBF clientOwnedDirectoryPathsForClientAccess:](self, "clientOwnedDirectoryPathsForClientAccess:", v4);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addEntriesFromDictionary:");
  if ((objc_msgSend(v4, "limitedLibraryMode") & 1) == 0)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], self->_scopesBaseDirectory);
  if (objc_msgSend(v4, "cloudInternalEntitled"))
  {
    objc_msgSend(v4, "trustedCallerBundleID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "isEqualToString:", CFSTR("com.apple.mediastream.mstreamd")))
    {
      -[PLPhotoLibraryPathManagerCore photoDirectoryWithType:](self, "photoDirectoryWithType:", 21);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
        objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v16);
      -[PLPhotoLibraryPathManagerCore photoDirectoryWithType:](self, "photoDirectoryWithType:", 14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
        objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v17);

    }
  }
  v18 = (void *)objc_opt_class();
  -[PLPhotoLibraryPathManagerCore libraryURL](self, "libraryURL");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v18, "wellKnownPhotoLibraryIdentifierForURL:", v19);

  if (v20 <= 1)
  {
    -[PLPhotoLibraryPathManagerCore pathForCPLStatus](self, "pathForCPLStatus");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
      objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], v21);

  }
  if (v46 && objc_msgSend(v4, "directDatabaseWriteAuthorized"))
  {
    -[PLPhotoLibraryPathManagerCore photoDirectoryWithType:createIfNeeded:error:](self, "photoDirectoryWithType:createIfNeeded:error:", 2, 0, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v23)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPhotoLibraryPathManagerUBF.m"), 545, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dict[databaseDirectory] != nil"));

      }
      objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v22);
    }

  }
  -[PLPhotoLibraryPathManagerCore photoDirectoryWithType:createIfNeeded:error:](self, "photoDirectoryWithType:createIfNeeded:error:", 17, 1, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "analyticsCacheWriteEntitled") & 1) != 0)
  {
    v25 = MEMORY[0x1E0C9AAB0];
LABEL_35:
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v25, v24);
    goto LABEL_36;
  }
  if (objc_msgSend(v4, "analyticsCacheReadEntitled"))
  {
    v25 = MEMORY[0x1E0C9AAA0];
    goto LABEL_35;
  }
LABEL_36:
  if ((objc_msgSend(v4, "analyticsCacheWriteEntitled") & 1) != 0
    || objc_msgSend(v4, "analyticsCacheReadEntitled"))
  {
    -[PLPhotoLibraryPathManagerCore photoDirectoryWithType:createIfNeeded:error:](self, "photoDirectoryWithType:createIfNeeded:error:", 17, 1, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "analyticsCacheWriteEntitled"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v27, v26);

  }
  if ((objc_msgSend(v4, "smartSharingCacheWriteEntitled") & 1) != 0
    || objc_msgSend(v4, "smartSharingCacheReadEntitled"))
  {
    -[PLPhotoLibraryPathManagerCore photoDirectoryWithType:createIfNeeded:error:](self, "photoDirectoryWithType:createIfNeeded:error:", 20, 1, 0);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "smartSharingCacheWriteEntitled"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v29, v28);

  }
  if (objc_msgSend(v4, "internalDataReadWriteAuthorized"))
  {
    -[PLPhotoLibraryPathManagerCore internalDirectoryWithSubType:additionalPathComponents:createIfNeeded:error:](self, "internalDirectoryWithSubType:additionalPathComponents:createIfNeeded:error:", 1, 0, 1, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v30);
    -[PLPhotoLibraryPathManagerCore internalDirectoryWithSubType:additionalPathComponents:createIfNeeded:error:](self, "internalDirectoryWithSubType:additionalPathComponents:createIfNeeded:error:", 3, 0, 1, 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v31, v32);
    -[PLPhotoLibraryPathManagerCore internalDirectoryWithSubType:additionalPathComponents:createIfNeeded:error:](self, "internalDirectoryWithSubType:additionalPathComponents:createIfNeeded:error:", 4, 0, 1, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v31, v33);

  }
  -[PLPhotoLibraryPathManagerCore capabilities](self, "capabilities");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "isNetworkVolume");

  if (v35)
  {
    -[PLPhotoLibraryPathManagerUBF photosDatabasePath](self, "photosDatabasePath");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLFileUtilities proxyLockFilePathForDatabasePath:](PLFileUtilities, "proxyLockFilePathForDatabasePath:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "stringByDeletingLastPathComponent");
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
      objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v38);
    -[PLPhotoLibraryPathManagerCore photoDirectoryWithType:createIfNeeded:error:](self, "photoDirectoryWithType:createIfNeeded:error:", 2, 0, 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLFileUtilities proxyLockCoordinatingFilePathForDatabaseDirectory:databaseName:](PLFileUtilities, "proxyLockCoordinatingFilePathForDatabaseDirectory:databaseName:", v39, CFSTR("Photos.sqlite"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (v40)
      objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v40);

  }
  if ((objc_msgSend(v4, "coreSceneUnderstandingTaxonomyReadAuthorized") & 1) != 0
    || objc_msgSend(v4, "coreSceneUnderstandingTaxonomyWriteAuthorized"))
  {
    -[PLPhotoLibraryPathManagerCore internalDirectoryWithSubType:additionalPathComponents:createIfNeeded:error:](self, "internalDirectoryWithSubType:additionalPathComponents:createIfNeeded:error:", 5, 0, 1, 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v4, "coreSceneUnderstandingTaxonomyWriteAuthorized"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v42, v41);

  }
  return v7;
}

- (id)pathsForPermissionCheck
{
  id v3;
  void *v4;
  void *v5;

  pl_dispatch_once(&PLIsReallyAssetsd_didCheckReadOnly, &__block_literal_global_42_3368);
  if (!PLIsReallyAssetsd_isAssetsd)
    goto LABEL_5;
  -[PLPhotoLibraryPathManagerUBF corePathsWithError:directDatabaseAccess:limitedLibrary:](self, "corePathsWithError:directDatabaseAccess:limitedLibrary:", 0, 1, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[PLPhotoLibraryPathManagerUBF basePrivateDirectoryPath](self, "basePrivateDirectoryPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  -[PLPhotoLibraryPathManagerCore photoDirectoryWithType:createIfNeeded:error:](self, "photoDirectoryWithType:createIfNeeded:error:", 11, 1, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v3, "addObject:", v5);

  if (!v3)
LABEL_5:
    v3 = objc_alloc_init(MEMORY[0x1E0C99E60]);
  return v3;
}

- (id)pathsForExternalWriters
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99E60];
  -[PLPhotoLibraryPathManagerUBF basePrivateDirectoryPath](self, "basePrivateDirectoryPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  -[PLPhotoLibraryPathManagerUBF _externalDirectoryWithBundleIdentifier:createIfNeeded:](self, "_externalDirectoryWithBundleIdentifier:createIfNeeded:", 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)createPathsForNewLibrariesWithError:(id *)a3
{
  _BOOL4 v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  BOOL v20;
  BOOL v21;
  uint64_t v22;
  void *v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  void *v27;
  void *v29;
  void *v30;
  char v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  id v36;
  id v37;
  id v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD v43[2];
  _QWORD v44[2];
  uint64_t v45;
  void *v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  pl_dispatch_once(&PLIsReallyAssetsd_didCheckReadOnly, &__block_literal_global_42_3368);
  if (!PLIsReallyAssetsd_isAssetsd && !PFProcessIsLaunchedToExecuteTests())
  {
    v7 = 0;
    goto LABEL_7;
  }
  v38 = 0;
  v5 = -[PLPhotoLibraryPathManagerUBF ensureFileProviderSyncExclusionAttributeIsSetWithError:](self, "ensureFileProviderSyncExclusionAttributeIsSetWithError:", &v38);
  v6 = v38;
  v7 = v6;
  if (!v5)
  {
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid client access"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v39 = *MEMORY[0x1E0CB2D50];
    v40 = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", CFSTR("com.apple.photos.error"), 46800, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_29:
    v21 = 0;
    goto LABEL_30;
  }
  v37 = v6;
  -[PLPhotoLibraryPathManagerUBF corePathsWithError:directDatabaseAccess:limitedLibrary:](self, "corePathsWithError:directDatabaseAccess:limitedLibrary:", &v37, 1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v37;

  if (v9)
  {
    -[PLPhotoLibraryPathManagerUBF extendedPathsWithError:](self, "extendedPathsWithError:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v36 = 0;
    -[PLPhotoLibraryPathManagerUBF extendedPathsWithError:](self, "extendedPathsWithError:", &v36);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v36;
  }
  v13 = objc_msgSend(v8, "count");
  v14 = objc_msgSend(v10, "count");
  objc_msgSend(v8, "unionSet:", v10);
  if (!v13 || !v14 || objc_msgSend(v8, "count") != v14 + v13 || v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed expected directory count"));
    v22 = objc_claimAutoreleasedReturnValue();
    v7 = (id)v22;
    if (v9)
    {
      v43[0] = *MEMORY[0x1E0CB2D50];
      v43[1] = *MEMORY[0x1E0CB3388];
      v44[0] = v22;
      v44[1] = v9;
      v23 = (void *)MEMORY[0x1E0C99D80];
      v24 = v44;
      v25 = v43;
      v26 = 2;
    }
    else
    {
      v41 = *MEMORY[0x1E0CB2D50];
      v42 = v22;
      v23 = (void *)MEMORY[0x1E0C99D80];
      v24 = &v42;
      v25 = &v41;
      v26 = 1;
    }
    objc_msgSend(v23, "dictionaryWithObjects:forKeys:count:", v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.photos.error"), 46800, v27);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_29;
  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v7 = v8;
  v15 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v47, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v33;
    while (2)
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v33 != v17)
          objc_enumerationMutation(v7);
        v19 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
        v31 = 0;
        if (-[NSFileManager fileExistsAtPath:isDirectory:](self->_fm, "fileExistsAtPath:isDirectory:", v19, &v31))
          v20 = v31 == 0;
        else
          v20 = 1;
        if (v20)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to validate path exists: %@"), v19);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = *MEMORY[0x1E0CB2D50];
          v46 = v29;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.photos.error"), 46800, v30);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          v21 = 0;
          goto LABEL_35;
        }
      }
      v16 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v47, 16);
      v21 = 1;
      if (v16)
        continue;
      break;
    }
    v12 = 0;
  }
  else
  {
    v12 = 0;
    v21 = 1;
  }
LABEL_35:
  v8 = v7;
LABEL_30:

  if (a3)
    *a3 = objc_retainAutorelease(v12);

  return v21;
}

- (id)corePathsWithError:(id *)a3 directDatabaseAccess:(BOOL)a4 limitedLibrary:(BOOL)a5
{
  _BOOL4 v6;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v18;
  id v19;
  id v20;

  v6 = a4;
  v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  if (!v6)
  {
    if (a5)
    {
      v11 = 0;
      goto LABEL_16;
    }
    goto LABEL_10;
  }
  v20 = 0;
  -[PLPhotoLibraryPathManagerCore photoDirectoryWithType:createIfNeeded:error:](self, "photoDirectoryWithType:createIfNeeded:error:", 2, 1, &v20);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v20;
  if (v10)
    objc_msgSend(v9, "addObject:", v10);

  if (!a5)
  {
    if (v11)
    {
      -[PLPhotoLibraryPathManagerCore photoDirectoryWithType:createIfNeeded:error:](self, "photoDirectoryWithType:createIfNeeded:error:", 4, 1, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
LABEL_12:

        if (v11)
        {
          -[PLPhotoLibraryPathManagerCore photoDirectoryWithType:createIfNeeded:error:](self, "photoDirectoryWithType:createIfNeeded:error:", 7, 1, 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v13)
          {
LABEL_15:

            goto LABEL_16;
          }
        }
        else
        {
          v18 = 0;
          -[PLPhotoLibraryPathManagerCore photoDirectoryWithType:createIfNeeded:error:](self, "photoDirectoryWithType:createIfNeeded:error:", 7, 1, &v18);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v18;
          if (!v13)
            goto LABEL_15;
        }
        objc_msgSend(v9, "addObject:", v13);
        goto LABEL_15;
      }
LABEL_11:
      objc_msgSend(v9, "addObject:", v12);
      goto LABEL_12;
    }
LABEL_10:
    v19 = 0;
    -[PLPhotoLibraryPathManagerCore photoDirectoryWithType:createIfNeeded:error:](self, "photoDirectoryWithType:createIfNeeded:error:", 4, 1, &v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v19;
    if (!v12)
      goto LABEL_12;
    goto LABEL_11;
  }
LABEL_16:
  -[PLPhotoLibraryPathManagerUBF _externalDirectoryWithBundleIdentifier:createIfNeeded:](self, "_externalDirectoryWithBundleIdentifier:createIfNeeded:", 0, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    objc_msgSend(v9, "addObject:", v14);

  if (a3)
    *a3 = objc_retainAutorelease(v11);
  if (v11)
    v15 = 0;
  else
    v15 = v9;
  v16 = v15;

  return v16;
}

- (id)extendedPathsWithError:(id *)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;

  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v21 = 0;
  -[PLPhotoLibraryPathManagerCore photoDirectoryWithType:createIfNeeded:error:](self, "photoDirectoryWithType:createIfNeeded:error:", 5, 1, &v21);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v21;
  if (v6)
    objc_msgSend(v5, "addObject:", v6);

  if (v7)
  {
    -[PLPhotoLibraryPathManagerCore photoDirectoryWithType:createIfNeeded:error:](self, "photoDirectoryWithType:createIfNeeded:error:", 8, 1, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
      goto LABEL_6;
    goto LABEL_5;
  }
  v20 = 0;
  -[PLPhotoLibraryPathManagerCore photoDirectoryWithType:createIfNeeded:error:](self, "photoDirectoryWithType:createIfNeeded:error:", 8, 1, &v20);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v20;
  if (v8)
LABEL_5:
    objc_msgSend(v5, "addObject:", v8);
LABEL_6:

  if (v7)
  {
    -[PLPhotoLibraryPathManagerCore photoDirectoryWithType:createIfNeeded:error:](self, "photoDirectoryWithType:createIfNeeded:error:", 25, 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
      goto LABEL_9;
    goto LABEL_8;
  }
  v19 = 0;
  -[PLPhotoLibraryPathManagerCore photoDirectoryWithType:createIfNeeded:error:](self, "photoDirectoryWithType:createIfNeeded:error:", 25, 1, &v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v19;
  if (v9)
LABEL_8:
    objc_msgSend(v5, "addObject:", v9);
LABEL_9:

  if (v7)
  {
    -[PLPhotoLibraryPathManagerCore photoDirectoryWithType:createIfNeeded:error:](self, "photoDirectoryWithType:createIfNeeded:error:", 21, 1, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
      goto LABEL_12;
    goto LABEL_11;
  }
  v18 = 0;
  -[PLPhotoLibraryPathManagerCore photoDirectoryWithType:createIfNeeded:error:](self, "photoDirectoryWithType:createIfNeeded:error:", 21, 1, &v18);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v18;
  if (v10)
LABEL_11:
    objc_msgSend(v5, "addObject:", v10);
LABEL_12:

  if (v7)
  {
    -[PLPhotoLibraryPathManagerCore photoDirectoryWithType:createIfNeeded:error:](self, "photoDirectoryWithType:createIfNeeded:error:", 26, 1, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
      goto LABEL_15;
    goto LABEL_14;
  }
  v17 = 0;
  -[PLPhotoLibraryPathManagerCore photoDirectoryWithType:createIfNeeded:error:](self, "photoDirectoryWithType:createIfNeeded:error:", 26, 1, &v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v17;
  if (v11)
LABEL_14:
    objc_msgSend(v5, "addObject:", v11);
LABEL_15:

  if (v7)
  {
    -[PLPhotoLibraryPathManagerCore privateCacheDirectoryWithSubType:createIfNeeded:error:](self, "privateCacheDirectoryWithSubType:createIfNeeded:error:", 15, 1, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
      goto LABEL_18;
    goto LABEL_17;
  }
  v16 = 0;
  -[PLPhotoLibraryPathManagerCore privateCacheDirectoryWithSubType:createIfNeeded:error:](self, "privateCacheDirectoryWithSubType:createIfNeeded:error:", 15, 1, &v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v16;
  if (v12)
LABEL_17:
    objc_msgSend(v5, "addObject:", v12);
LABEL_18:

  if (a3)
    *a3 = objc_retainAutorelease(v7);
  if (v7)
    v13 = 0;
  else
    v13 = v5;
  v14 = v13;

  return v14;
}

- (id)pathsForLibraryFilesystemSizeCalculation
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[PLPhotoLibraryPathManagerCore baseDirectory](self, "baseDirectory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)pathsForFinderSyncFilesystemSizeCalculation
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (id)privateDirectoryWithSubType:(unsigned __int8)a3 leafType:(unsigned __int8)a4 additionalPathComponents:(id)a5
{
  uint64_t v5;
  unsigned int v6;
  id v8;
  NSString *v9;
  NSString *privateDirectory;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  v9 = self->_privateDirectory;
  if (v6)
  {
    privateDirectory = self->_privateDirectory;
    if (v6 < 0x11)
    {
      if (v6 <= 0xA)
      {
        v11 = off_1E376BD40[v6];
LABEL_7:
        v12 = v11;
        -[__CFString substringFromIndex:](v12, "substringFromIndex:", objc_msgSend(CFSTR("PLPhotoLibrarySubPathType"), "length"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "lowercaseString");
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        -[NSString stringByAppendingPathComponent:](privateDirectory, "stringByAppendingPathComponent:", v14);
        v15 = objc_claimAutoreleasedReturnValue();

        v9 = (NSString *)v15;
        goto LABEL_8;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Invalid type %d: %s"), v6, "NSString *PLStringFromPLPhotoLibrarySubPathType(PLPhotoLibrarySubPathType)");
    }
    v11 = CFSTR("PLPhotoLibrarySubPathTypeLast");
    goto LABEL_7;
  }
LABEL_8:
  -[PLPhotoLibraryPathManagerUBF addToPath:leafType:additionalPathComponents:](self, "addToPath:leafType:additionalPathComponents:", v9, v5, v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)privateCacheDirectoryWithSubType:(unsigned __int8)a3 leafType:(unsigned __int8)a4 additionalPathComponents:(id)a5
{
  uint64_t v5;
  unsigned int v6;
  id v8;
  NSString *v9;
  NSString *privateCacheDirectory;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  v9 = self->_privateCacheDirectory;
  if (v6)
  {
    privateCacheDirectory = self->_privateCacheDirectory;
    if (v6 < 0x11)
    {
      v11 = off_1E376BDB8[v6];
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99750], CFSTR("Invalid type %d: %s"), v6, "NSString *PLStringFromPLPhotoLibraryCacheSubPathType(PLPhotoLibraryCacheSubPathType)");
      v11 = CFSTR("PLPhotoLibraryCacheSubPathTypeLast");
    }
    v12 = v11;
    -[__CFString substringFromIndex:](v12, "substringFromIndex:", objc_msgSend(CFSTR("PLPhotoLibraryCacheSubPathType"), "length"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lowercaseString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSString stringByAppendingPathComponent:](privateCacheDirectory, "stringByAppendingPathComponent:", v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v9 = (NSString *)v15;
  }
  -[PLPhotoLibraryPathManagerUBF addToPath:leafType:additionalPathComponents:](self, "addToPath:leafType:additionalPathComponents:", v9, v5, v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
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

  v5 = a4;
  v6 = a3;
  v8 = a5;
  if ((v6 - 1) >= 3)
  {
    if (v6 != 4 && v6)
    {
      v13 = 0;
    }
    else
    {
      -[PLPhotoLibraryPathManagerUBF _externalDirectoryWithBundleIdentifier:createIfNeeded:](self, "_externalDirectoryWithBundleIdentifier:createIfNeeded:", 0, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
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
  -[PLPhotoLibraryPathManagerUBF addToPath:leafType:additionalPathComponents:](self, "addToPath:leafType:additionalPathComponents:", v13, v5, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
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
  -[PLPhotoLibraryPathManagerUBF addToPath:leafType:additionalPathComponents:](self, "addToPath:leafType:additionalPathComponents:", v11, 1, v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)pathToAssetsToAlbumsMapping
{
  return -[NSString stringByAppendingPathComponent:](self->_privateDirectory, "stringByAppendingPathComponent:", CFSTR("assetsToAlbumsMapping.plist"));
}

- (id)syncInfoPath
{
  return -[NSString stringByAppendingPathComponent:](self->_privateDirectory, "stringByAppendingPathComponent:", CFSTR("syncInfo.plist"));
}

- (void)enumerateBundleScopesWithBlock:(id)a3
{
  int v5;
  void *v6;
  PLPhotoLibraryPathManager *v7;
  void *v8;
  unsigned int v9;
  PLPhotoLibraryPathManager *v10;
  void *v11;
  id v12;

  v12 = a3;
  if (-[PLPhotoLibraryPathManagerCore bundleScope](self, "bundleScope"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPhotoLibraryPathManagerUBF.m"), 796, CFSTR("can only enumerate bundle scopes on main bundle scoped path manager"));

  }
  v5 = 0;
  do
  {
    v6 = (void *)MEMORY[0x19AEC2E4C]();
    v7 = [PLPhotoLibraryPathManager alloc];
    -[PLPhotoLibraryPathManagerCore libraryURL](self, "libraryURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (unsigned __int16)v5;
    v10 = -[PLPhotoLibraryPathManager initWithLibraryURL:bundleScope:libraryFormat:](v7, "initWithLibraryURL:bundleScope:libraryFormat:", v8, (unsigned __int16)v5, 2);

    (*((void (**)(id, _QWORD, _QWORD, PLPhotoLibraryPathManager *))v12 + 2))(v12, (unsigned __int16)v5, -[PLPhotoLibraryPathManagerUBF photoLibraryPathTypeForBundleScope:](self, "photoLibraryPathTypeForBundleScope:", (unsigned __int16)v5), v10);
    objc_autoreleasePoolPop(v6);
    ++v5;
  }
  while (v9 < 4);

}

- (BOOL)shouldUseFileIdentifierForBundleScope:(unsigned __int16)a3
{
  return 1;
}

- (id)urlWithIdentifier:(id)a3
{
  id v4;
  PLPhotoLibraryPathManagerUBF *v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v17;
  char v18;
  unsigned int v19;
  int v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;

  v4 = a3;
  v5 = self;
  if (objc_msgSend(v4, "bundleScope"))
  {
    -[PLPhotoLibraryPathManagerUBF _scopedInternalPathManagerWithBundleScope:](v5, "_scopedInternalPathManagerWithBundleScope:", objc_msgSend(v4, "bundleScope"));
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (PLPhotoLibraryPathManagerUBF *)v6;
  }
  objc_msgSend(v4, "uuid");
  v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v23 = objc_msgSend(v25, "UTF8String");
  objc_msgSend(v4, "extension");
  v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v22 = objc_msgSend(v24, "UTF8String");
  v21 = objc_msgSend(v4, "resourceType");
  v20 = objc_msgSend(v4, "resourceVersion");
  v19 = objc_msgSend(v4, "recipeId");
  v18 = objc_msgSend(v4, "isData");
  -[PLPhotoLibraryPathManagerCore photoDirectoryWithType:](v5, "photoDirectoryWithType:", 4);
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v17 = objc_msgSend(v7, "UTF8String");
  -[PLPhotoLibraryPathManagerCore photoDirectoryWithType:](v5, "photoDirectoryWithType:", 9);
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = objc_msgSend(v8, "UTF8String");
  -[PLPhotoLibraryPathManagerCore photoDirectoryWithType:](v5, "photoDirectoryWithType:", 10);
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v11 = objc_msgSend(v10, "UTF8String");
  -[PLPhotoLibraryPathManagerCore photoDirectoryWithType:](v5, "photoDirectoryWithType:", 18);
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v13 = objc_msgSend(v12, "UTF8String");
  -[PLPhotoLibraryPathManagerCore photoDirectoryWithType:](v5, "photoDirectoryWithType:", 12);
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  PLURLForResourceProperties(v23, v22, v21, v20, v19, v18, v17, v9, v11, v13, objc_msgSend(v14, "UTF8String"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)setExtendedAttributesWithIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PLPhotoLibraryPathManagerUBF urlWithIdentifier:](self, "urlWithIdentifier:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PLPhotoLibraryPathManagerUBF setExtendedAttributesWithIdentifier:andURL:](self, "setExtendedAttributesWithIdentifier:andURL:", v4, v5);

}

- (void)setExtendedAttributesWithIdentifier:(id)a3 andURL:(id)a4
{
  id v6;
  id v7;
  BOOL v8;
  void *v9;
  uint64_t v10;
  NSFileManager *fm;
  void *v12;
  int v13;
  BOOL v14;
  id v15;
  id v16;
  const char *v17;
  void *v18;
  const char *v19;
  id v20;
  const char *v21;
  void *v22;
  int *v23;
  char *v24;
  unsigned __int8 v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;
  __int16 v30;
  char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  pl_dispatch_once(&PLIsReallyAssetsd_didCheckReadOnly, &__block_literal_global_42_3368);
  if (PLIsReallyAssetsd_isAssetsd)
    v8 = 0;
  else
    v8 = __PLIsAssetsdProxyService == 0;
  if (!v8 && !objc_msgSend(v6, "resourceVersion"))
  {
    objc_msgSend(v6, "originalFilename");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "length");

    if (v10)
    {
      v25 = 0;
      fm = self->_fm;
      objc_msgSend(v7, "path");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(fm) = -[NSFileManager fileExistsAtPath:isDirectory:](fm, "fileExistsAtPath:isDirectory:", v12, &v25);
      v13 = v25;

      if ((_DWORD)fm)
        v14 = v13 == 0;
      else
        v14 = 0;
      if (v14)
      {
        objc_msgSend(v6, "originalFilename");
        v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v17 = (const char *)objc_msgSend(v16, "UTF8String");

        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v17, strlen(v17));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = (const char *)objc_msgSend(CFSTR("com.apple.assetsd.originalFilename"), "UTF8String");
        objc_msgSend(v7, "path");
        v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v21 = (const char *)objc_msgSend(v20, "UTF8String");
        v15 = objc_retainAutorelease(v18);
        LODWORD(v19) = setxattr(v21, v19, (const void *)objc_msgSend(v15, "bytes"), objc_msgSend(v15, "length"), 0, 0);

        if ((_DWORD)v19 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v6, "originalFilename");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = __error();
          v24 = strerror(*v23);
          *(_DWORD *)buf = 138412802;
          v27 = v22;
          v28 = 2112;
          v29 = v7;
          v30 = 2080;
          v31 = v24;
          _os_log_error_impl(&dword_199DF7000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to write originalFilename (\"%@\") to url: %@ Error: %s", buf, 0x20u);

        }
        goto LABEL_17;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v6, "originalFilename");
        v15 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v27 = v15;
        v28 = 2112;
        v29 = v7;
        _os_log_debug_impl(&dword_199DF7000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Failed to write originalfilename (\"%@\") to url: %@", buf, 0x16u);
LABEL_17:

      }
    }
  }

}

- (void)obtainAccessAndWaitWithFileWithIdentifier:(id)a3 mode:(unsigned __int8)a4 toURLWithHandler:(id)a5
{
  int v6;
  id v8;
  void (**v9)(id, void *, id);
  void *v10;
  id v11;
  void *v12;
  void *v13;
  BOOL v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v6 = a4;
  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void (**)(id, void *, id))a5;
  -[PLPhotoLibraryPathManagerUBF urlWithIdentifier:](self, "urlWithIdentifier:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    pl_dispatch_once(&PLIsReallyAssetsd_didCheckReadOnly, &__block_literal_global_42_3368);
    v11 = 0;
    if (v6 == 2 && (PLIsReallyAssetsd_isAssetsd != 0) | __PLIsAssetsdProxyService & 1)
    {
      objc_msgSend(v10, "URLByDeletingLastPathComponent");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "path");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 0;
      v14 = +[PLFileUtilities createDirectoryAtPath:error:](PLFileUtilities, "createDirectoryAtPath:error:", v13, &v15);
      v11 = v15;

      if (!v14)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v17 = v10;
          v18 = 2112;
          v19 = v11;
          _os_log_error_impl(&dword_199DF7000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to create intermediate path for write request to url: %@ Create dir error: %@", buf, 0x16u);
        }

        v10 = 0;
      }

    }
    v9[2](v9, v10, v11);
  }
  else
  {
    v11 = 0;
  }

  if (v6 == 2)
    -[PLPhotoLibraryPathManagerUBF setExtendedAttributesWithIdentifier:andURL:](self, "setExtendedAttributesWithIdentifier:andURL:", v8, v10);

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

- (id)assetAbbreviatedMetadataDirectoryForDirectory:(id)a3 type:(unsigned __int8)a4 bundleScope:(unsigned __int16)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  -[PLPhotoLibraryPathManagerUBF _scopedInternalPathManagerWithBundleScope:](self, "_scopedInternalPathManagerWithBundleScope:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "photoDirectoryWithType:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoLibraryPathManagerCore assetAbbreviatedMetadataDirectoryForDirectory:rootPath:](self, "assetAbbreviatedMetadataDirectoryForDirectory:rootPath:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)assetMainFilePathWithDirectory:(id)a3 filename:(id)a4 bundleScope:(unsigned __int16)a5
{
  uint64_t v5;
  id v9;
  id v10;
  PLPhotoLibraryPathManager *v11;
  void *v12;
  PLPhotoLibraryPathManagerUBF *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v19;
  void *v20;
  void *v21;

  v5 = a5;
  v9 = a3;
  v10 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPhotoLibraryPathManagerUBF.m"), 899, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("directory"));

  }
  if (-[PLPhotoLibraryPathManagerCore bundleScope](self, "bundleScope"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPhotoLibraryPathManagerUBF.m"), 900, CFSTR("can only access asset main file path on main bundle scoped path manager"));

  }
  if ((objc_msgSend(v9, "hasPrefix:", CFSTR("/")) & 1) == 0)
  {
    if (v5 <= 4)
    {
      if (((1 << v5) & 0x1A) != 0)
      {
        v11 = [PLPhotoLibraryPathManager alloc];
        -[PLPhotoLibraryPathManagerCore libraryURL](self, "libraryURL");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[PLPhotoLibraryPathManager initWithLibraryURL:bundleScope:libraryFormat:](v11, "initWithLibraryURL:bundleScope:libraryFormat:", v12, v5, 2);

        if (v13)
        {
LABEL_9:
          if ((_DWORD)v5 == 2)
            v14 = 22;
          else
            v14 = 4;
          -[PLPhotoLibraryPathManagerCore photoDirectoryWithType:](v13, "photoDirectoryWithType:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "stringByAppendingPathComponent:", v9);
          v16 = objc_claimAutoreleasedReturnValue();

          v9 = (id)v16;
          goto LABEL_13;
        }
      }
      else
      {
        v13 = self;
        if (v13)
          goto LABEL_9;
      }
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPhotoLibraryPathManagerUBF.m"), 917, CFSTR("Cannot resolve path manager from invalid bundle scope %d"), v5);

    v13 = 0;
    goto LABEL_9;
  }
LABEL_13:
  objc_msgSend(v9, "stringByAppendingPathComponent:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)_scopedInternalPathManagerWithBundleScope:(unsigned __int16)a3
{
  uint64_t v3;
  PLPhotoLibraryPathManagerUBF *v5;
  void *v6;
  PLPhotoLibraryPathManagerUBF *v7;
  void *v8;
  uint64_t v9;
  void *v11;

  v3 = a3;
  v5 = self;
  if (-[PLPhotoLibraryPathManagerCore bundleScope](v5, "bundleScope") != (_DWORD)v3)
  {
    if (-[PLPhotoLibraryPathManagerCore bundleScope](v5, "bundleScope"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, v5, CFSTR("PLPhotoLibraryPathManagerUBF.m"), 931, CFSTR("Requesting a scoped path managed from a non-main scoped path manager is not supported"));

    }
    -[PLPhotoLibraryPathManagerCore photoDirectoryWithType:](v5, "photoDirectoryWithType:", -[PLPhotoLibraryPathManagerUBF photoLibraryPathTypeForBundleScope:](v5, "photoLibraryPathTypeForBundleScope:", v3));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = [PLPhotoLibraryPathManagerUBF alloc];
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v6, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PLPhotoLibraryPathManagerUBF initWithLibraryURL:bundleScope:](v7, "initWithLibraryURL:bundleScope:", v8, v3);

    v5 = (PLPhotoLibraryPathManagerUBF *)v9;
  }
  return v5;
}

- (BOOL)updateTimeMachineExclusionAttributeForExcludePath:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  BOOL v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
LABEL_8:
    v7 = 1;
    goto LABEL_9;
  }
  pl_dispatch_once(&PLIsReallyAssetsd_didCheckReadOnly, &__block_literal_global_42_3368);
  if (!PLIsReallyAssetsd_isAssetsd && (__PLIsAssetsdProxyService & 1) == 0)
  {
    pl_dispatch_once(&PLIsInternalTool_didCheckReadOnly, &__block_literal_global_45_3377);
    if (!PLIsInternalTool_isInternalTool)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        v9 = 138412290;
        v10 = v5;
        _os_log_fault_impl(&dword_199DF7000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unauthorized client attempting to set time machine exclusion attribute on path: %@", (uint8_t *)&v9, 0xCu);
      }
      goto LABEL_8;
    }
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[PLPhotoLibraryPathManagerCore setTimeMachineExclusionAttribute:url:error:](PLPhotoLibraryPathManagerCore, "setTimeMachineExclusionAttribute:url:error:", 1, v6, a4);

LABEL_9:
  return v7;
}

- (BOOL)ensureFileProviderSyncExclusionAttributeIsSetWithError:(id *)a3
{
  return 1;
}

+ (id)allPhotosPathsOnThisDevice
{
  if (allPhotosPathsOnThisDevice_onceToken != -1)
    dispatch_once(&allPhotosPathsOnThisDevice_onceToken, &__block_literal_global_123);
  return (id)allPhotosPathsOnThisDevice_bundlePaths;
}

void __58__PLPhotoLibraryPathManagerUBF_allPhotosPathsOnThisDevice__block_invoke()
{
  id v0;
  uint64_t i;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v0 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  for (i = 0; i != 4; ++i)
  {
    if ((i | 2) == 3)
    {
      +[PLPhotoLibraryPathManagerCore wellKnownPhotoLibraryURLForIdentifier:](PLPhotoLibraryPathManagerCore, "wellKnownPhotoLibraryURLForIdentifier:", i);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = v2;
      if (v2)
      {
        objc_msgSend(v2, "path");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v0, "addObject:", v4);

      }
    }
  }
  v5 = (void *)allPhotosPathsOnThisDevice_bundlePaths;
  allPhotosPathsOnThisDevice_bundlePaths = (uint64_t)v0;

}

@end
