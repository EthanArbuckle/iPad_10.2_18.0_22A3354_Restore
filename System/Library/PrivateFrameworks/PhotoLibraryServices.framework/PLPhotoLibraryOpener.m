@implementation PLPhotoLibraryOpener

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryServicesManager, 0);
}

- (BOOL)openPhotoLibraryDatabaseWithAutoUpgrade:(BOOL)a3 autoCreate:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  PLLibraryOpenerCreationOptions *v24;
  void *v25;
  id *v26;
  void *v27;
  int v28;
  void *v29;
  PLLibraryOpenerCreationOptions *v30;
  void *v31;
  PLLibraryOpenerCreationOptions *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  id v38;
  id v39;
  int v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  uint64_t v47;
  NSObject *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  id *v68;
  PLLibraryOpenerCreationOptions *v69;
  id v70;
  id v71;
  id v72;
  unsigned __int8 v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  PLLibraryOpenerCreationOptions *v77;
  _QWORD v78[2];
  _QWORD v79[2];
  uint8_t buf[4];
  void *v81;
  __int16 v82;
  id v83;
  uint64_t v84;

  v6 = a4;
  v84 = *MEMORY[0x1E0C80C00];
  -[PLPhotoLibraryOpener libraryServicesManager](self, "libraryServicesManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pathManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "libraryURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLPhotoLibraryOpener libraryServicesManager](self, "libraryServicesManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "state");

  if (v14 != 7)
  {
    v68 = a5;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = 0;
    objc_msgSend(v12, "path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v16;
    v19 = objc_msgSend(v16, "fileExistsAtPath:isDirectory:", v17, &v73);
    v20 = v73;

    if (v19 && v20)
    {
      -[PLPhotoLibraryOpener libraryServicesManager](self, "libraryServicesManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "modelMigrator");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = 0;
      v23 = objc_msgSend(v22, "isPhotoLibraryDatabaseReadyForOpen:", &v72);
      v24 = (PLLibraryOpenerCreationOptions *)v72;

      if (v23)
      {

        v25 = v18;
        v26 = v68;
        goto LABEL_7;
      }
      v71 = 0;
      v40 = -[PLPhotoLibraryOpener lightweightPermissionCheckWithError:](self, "lightweightPermissionCheckWithError:", &v71);
      v38 = v71;
      if ((v40 & 1) != 0)
      {
        -[PLPhotoLibraryOpener libraryServicesManager](self, "libraryServicesManager");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v42 = objc_msgSend(v41, "isCreateMode");

        if (v42)
        {
          -[PLPhotoLibraryOpener libraryServicesManager](self, "libraryServicesManager");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "openerCreationOptions");
          v44 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v44)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPhotoLibraryOpener.m"), 248, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("openerCreationOptions != nil"));

          }
          v15 = -[PLPhotoLibraryOpener createPhotoLibraryDatabaseWithOptions:error:](self, "createPhotoLibraryDatabaseWithOptions:error:", v44, v68);

          v25 = v18;
          goto LABEL_32;
        }
        if (a3)
        {
          v47 = 0;
        }
        else
        {
          PLLibraryServicesGetLog();
          v57 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v12, "path");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v81 = v58;
            _os_log_impl(&dword_199541000, v57, OS_LOG_TYPE_ERROR, "Unable to open photo library because it requires upgrading: %@", buf, 0xCu);

          }
          v66 = (void *)MEMORY[0x1E0CB35C8];
          v67 = *MEMORY[0x1E0D74498];
          v78[0] = *MEMORY[0x1E0CB2AA0];
          objc_msgSend(v12, "path");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v79[0] = v59;
          v78[1] = *MEMORY[0x1E0CB2938];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Schema versions: library=%d, %s=%d"), -[PLLibraryOpenerCreationOptions intValue](v24, "intValue"), "assetsd", +[PLModelMigrator currentModelVersion](PLModelMigrator, "currentModelVersion"));
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v79[1] = v60;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v79, v78, 2);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v66, "errorWithDomain:code:userInfo:", v67, 41013, v61);
          v47 = objc_claimAutoreleasedReturnValue();

        }
        -[PLPhotoLibraryOpener libraryServicesManager](self, "libraryServicesManager");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "migrationServiceProxy");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "boost");

        v25 = v18;
LABEL_28:
        v26 = v68;

        v24 = (PLLibraryOpenerCreationOptions *)v47;
        if (v47)
          goto LABEL_29;
        if (v14 >= 1 && PLHasPathFromSourceStateToTargetState() && self->_reportInProgressUpgrades)
        {
          PLLibraryServicesGetLog();
          v49 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v12, "path");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v81 = v50;
            _os_log_impl(&dword_199541000, v49, OS_LOG_TYPE_ERROR, "Unable to open photo library because it is already being upgraded: %@", buf, 0xCu);

          }
          v51 = (void *)MEMORY[0x1E0CB35C8];
          v52 = *MEMORY[0x1E0D74498];
          v74 = *MEMORY[0x1E0CB2AA0];
          objc_msgSend(v12, "path");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v75 = v53;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v75, &v74, 1);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "errorWithDomain:code:userInfo:", v52, 41013, v54);
          v24 = (PLLibraryOpenerCreationOptions *)objc_claimAutoreleasedReturnValue();

          -[PLPhotoLibraryOpener libraryServicesManager](self, "libraryServicesManager");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "migrationServiceProxy");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "boost");

          if (v24)
          {
LABEL_29:
            if (v26)
            {
              v24 = objc_retainAutorelease(v24);
              v15 = 0;
              *v26 = v24;
            }
            else
            {
              v15 = 0;
            }
LABEL_32:

            goto LABEL_33;
          }
        }
LABEL_7:
        -[PLPhotoLibraryOpener libraryServicesManager](self, "libraryServicesManager");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = 0;
        v28 = objc_msgSend(v27, "activate:", &v70);
        v24 = (PLLibraryOpenerCreationOptions *)v70;

        if (v28)
        {
          -[PLPhotoLibraryOpener libraryServicesManager](self, "libraryServicesManager");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = v24;
          objc_msgSend(v29, "awaitLibraryState:error:", 7, &v69);
          v30 = v69;

          v24 = v30;
        }
        if (!v24)
        {
          v15 = 1;
LABEL_33:

          goto LABEL_34;
        }
        goto LABEL_29;
      }
      PLLibraryServicesGetLog();
      v45 = objc_claimAutoreleasedReturnValue();
      v25 = v18;
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v12, "path");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v81 = v46;
        v82 = 2112;
        v83 = v38;
        _os_log_impl(&dword_199541000, v45, OS_LOG_TYPE_ERROR, "Unable to open photo library because of insufficient permissions: %@, %@", buf, 0x16u);

      }
      v39 = v38;
      v38 = v39;
    }
    else
    {
      if (v6)
      {
        -[PLPhotoLibraryOpener libraryServicesManager](self, "libraryServicesManager");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "openerCreationOptions");
        v24 = (PLLibraryOpenerCreationOptions *)objc_claimAutoreleasedReturnValue();

        v25 = v18;
        if (!v24)
        {
          v32 = [PLLibraryOpenerCreationOptions alloc];
          -[PLPhotoLibraryOpener libraryServicesManager](self, "libraryServicesManager");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = -[PLLibraryOpenerCreationOptions initWithWellKnownLibraryIdentifier:](v32, "initWithWellKnownLibraryIdentifier:", objc_msgSend(v33, "wellKnownPhotoLibraryIdentifier"));

          if (!v24)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v64, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPhotoLibraryOpener.m"), 270, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("openerCreationOptions != nil"));

          }
        }
        v15 = -[PLPhotoLibraryOpener createPhotoLibraryDatabaseWithOptions:error:](self, "createPhotoLibraryDatabaseWithOptions:error:", v24, v68);
        goto LABEL_32;
      }
      PLLibraryServicesGetLog();
      v34 = objc_claimAutoreleasedReturnValue();
      v25 = v18;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v12, "path");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v81 = v35;
        _os_log_impl(&dword_199541000, v34, OS_LOG_TYPE_ERROR, "Unable to open photo library because it does not exist at path %@.", buf, 0xCu);

      }
      v36 = (void *)MEMORY[0x1E0CB35C8];
      v37 = *MEMORY[0x1E0D74498];
      v76 = *MEMORY[0x1E0CB2AA0];
      objc_msgSend(v12, "path");
      v24 = (PLLibraryOpenerCreationOptions *)objc_claimAutoreleasedReturnValue();
      v77 = v24;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v77, &v76, 1);
      v38 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "errorWithDomain:code:userInfo:", v37, 41015, v38);
      v39 = (id)objc_claimAutoreleasedReturnValue();
    }
    v47 = (uint64_t)v39;
    goto LABEL_28;
  }
  v15 = 1;
LABEL_34:

  return v15;
}

- (PLLibraryServicesManager)libraryServicesManager
{
  return (PLLibraryServicesManager *)objc_getProperty(self, a2, 16, 1);
}

- (PLPhotoLibraryOpener)initWithLibraryServicesManager:(id)a3 reportInProgressUpgrades:(BOOL)a4
{
  id v7;
  PLPhotoLibraryOpener *v8;
  PLPhotoLibraryOpener *v9;
  PLPhotoLibraryOpener *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PLPhotoLibraryOpener;
  v8 = -[PLPhotoLibraryOpener init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_libraryServicesManager, a3);
    v9->_reportInProgressUpgrades = a4;
    v10 = v9;
  }

  return v9;
}

- (BOOL)createPhotoLibraryDatabaseWithOptions:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  id *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  int v34;
  NSObject *v35;
  void *v36;
  BOOL v37;
  void *v39;
  void *v40;
  id *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  unsigned __int8 v46;
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  id v50;
  uint64_t v51;
  _QWORD v52[2];

  v52[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if ((PLIsAssetsd() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPhotoLibraryOpener.m"), 155, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PLIsAssetsd()"));

  }
  objc_msgSend(MEMORY[0x1E0D73208], "fileManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0;
  -[PLPhotoLibraryOpener libraryServicesManager](self, "libraryServicesManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pathManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "libraryURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = objc_msgSend(v8, "fileExistsAtPath:isDirectory:", v12, &v46);
  v13 = v46;

  if ((_DWORD)v10 && v13)
  {
    if ((objc_msgSend((id)objc_opt_class(), "canAutomaticallyCreateLibrary") & 1) != 0)
      goto LABEL_16;
    objc_msgSend(v8, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v11, 0, 0, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject count](v14, "count"))
    {
      v15 = a4;
      PLLibraryServicesGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v11, "path");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v48 = v17;
        _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "It is forbidden to create a photo library where one already exists at path %@.", buf, 0xCu);

      }
      v18 = (void *)MEMORY[0x1E0CB35C8];
      v19 = *MEMORY[0x1E0D74498];
      v51 = *MEMORY[0x1E0CB2AA0];
      objc_msgSend(v11, "path");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v52[0] = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, &v51, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, 41005, v21);
      v22 = (id)objc_claimAutoreleasedReturnValue();

      a4 = v15;
    }
    else
    {
      v22 = 0;
    }
  }
  else
  {
    v45 = 0;
    v23 = objc_msgSend(v8, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v11, 1, 0, &v45);
    v22 = v45;
    if ((v23 & 1) != 0)
      goto LABEL_15;
    PLLibraryServicesGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v11, "path");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v48 = v24;
      v49 = 2112;
      v50 = v22;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "PLPhotoLibraryOpener createPhotoLibraryDatabaseWithOptions failed to create directory at %@ : %@", buf, 0x16u);

    }
  }

LABEL_15:
  if (v22)
    goto LABEL_26;
LABEL_16:
  v40 = v8;
  v41 = a4;
  -[PLPhotoLibraryOpener libraryServicesManager](self, "libraryServicesManager");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setCreateMode:options:", 1, v7);

  objc_msgSend(v7, "libraryName");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v26)
  {
    objc_msgSend(v11, "lastPathComponent");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringByDeletingPathExtension");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v7, "containerIdentifier");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uuid");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "userDescription");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0;
  +[PLPhotoLibraryIdentifier createPhotoLibraryIdentifierWithPhotoLibraryURL:containerIdentifier:uuid:name:userDescription:error:](PLPhotoLibraryIdentifier, "createPhotoLibraryIdentifierWithPhotoLibraryURL:containerIdentifier:uuid:name:userDescription:error:", v11, v28, v29, v26, v30, &v44);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v44;

  if (!v31)
  {
    PLLibraryServicesGetLog();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v48 = v11;
      v49 = 2112;
      v50 = v32;
      _os_log_impl(&dword_199541000, v35, OS_LOG_TYPE_ERROR, "Error creating library identifier for %@ %@", buf, 0x16u);
    }
    goto LABEL_23;
  }
  -[PLPhotoLibraryOpener libraryServicesManager](self, "libraryServicesManager");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v32;
  v34 = objc_msgSend(v33, "activate:", &v43);
  v22 = v43;

  if (v34)
  {
    -[PLPhotoLibraryOpener libraryServicesManager](self, "libraryServicesManager");
    v35 = objc_claimAutoreleasedReturnValue();
    v42 = v22;
    -[NSObject awaitLibraryState:error:](v35, "awaitLibraryState:error:", 7, &v42);
    v32 = v42;

LABEL_23:
    v8 = v40;

    v22 = v32;
    goto LABEL_25;
  }
  v8 = v40;
LABEL_25:
  -[PLPhotoLibraryOpener libraryServicesManager](self, "libraryServicesManager");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setCreateMode:options:", 0, 0);

  a4 = v41;
  if (!v22)
  {
    v37 = 1;
    goto LABEL_30;
  }
LABEL_26:
  if (a4)
  {
    v22 = objc_retainAutorelease(v22);
    v37 = 0;
    *a4 = v22;
  }
  else
  {
    v37 = 0;
  }
LABEL_30:

  return v37;
}

- (BOOL)lightweightPermissionCheckWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  BOOL v20;
  id v21;
  BOOL v22;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _QWORD v30[2];
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  -[PLPhotoLibraryOpener libraryServicesManager](self, "libraryServicesManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pathManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "photoDirectoryWithType:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v7;
  v31[0] = MEMORY[0x1E0C9AAB0];
  -[PLPhotoLibraryOpener libraryServicesManager](self, "libraryServicesManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "pathManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "photosDatabasePath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v10;
  v31[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v26 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v12, "objectForKeyedSubscript:", v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "BOOLValue");
        v24 = 0;
        v20 = -[PLPhotoLibraryOpener lightweightPermissionCheckWithPath:isDir:error:](self, "lightweightPermissionCheckWithPath:isDir:error:", v17, v19, &v24);
        v21 = v24;

        if (!v20)
        {
          if (a3)
            *a3 = objc_retainAutorelease(v21);

          v22 = 0;
          goto LABEL_13;
        }

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v14)
        continue;
      break;
    }
  }
  v22 = 1;
LABEL_13:

  return v22;
}

- (BOOL)lightweightPermissionCheckWithPath:(id)a3 isDir:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v9;
  void *v10;
  int v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  int v28;
  NSObject *v29;
  int v30;
  void *v31;
  int v32;
  uint64_t v33;
  __CFString *v34;
  uint64_t v35;
  __CFString *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  char v41;
  NSObject *v42;
  BOOL v43;
  void *v45;
  PLPhotoLibraryOpener *v46;
  void *v47;
  uint64_t v48;
  id v49;
  id *v50;
  id v51;
  char v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  id v58;
  id v59;
  _QWORD v60[3];
  _QWORD v61[3];
  uint8_t v62[128];
  uint8_t buf[4];
  id v64;
  __int16 v65;
  id v66;
  uint64_t v67;

  v6 = a4;
  v67 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPhotoLibraryOpener.m"), 331, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("path"));

  }
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = 0;
  v11 = objc_msgSend(v10, "checkResourceIsReachableAndReturnError:", &v59);
  v12 = v59;
  if (v11)
  {
    v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v14 = MEMORY[0x1E0C9AAB0];
    objc_msgSend(v13, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C99A10]);
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0C99A50]);
    v15 = *MEMORY[0x1E0C99C08];
    objc_msgSend(v13, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0C99C08]);
    if (v6)
      objc_msgSend(v13, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0C999E8]);
    v53 = v13;
    objc_msgSend(v13, "allKeys");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v12;
    objc_msgSend(v10, "resourceValuesForKeys:error:", v16, &v58);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v58;

    if (v17)
    {
      v48 = v15;
      v50 = a5;
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      objc_msgSend(v17, "keyEnumerator");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
      if (v20)
      {
        v21 = v20;
        v46 = self;
        v47 = v10;
        v49 = v18;
        v51 = v9;
        v22 = *(_QWORD *)v55;
        v52 = 1;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v55 != v22)
              objc_enumerationMutation(v19);
            v24 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
            objc_msgSend(v17, "objectForKeyedSubscript:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "BOOLValue");
            objc_msgSend(v53, "objectForKeyedSubscript:", v24);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "BOOLValue");

            if (v26 != v28)
            {
              PLBackendGetLog();
              v29 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v64 = v51;
                v65 = 2112;
                v66 = v24;
                _os_log_impl(&dword_199541000, v29, OS_LOG_TYPE_DEFAULT, "LibraryServicesManager %@ has incorrect permissions for %@", buf, 0x16u);
              }

              v52 = 0;
            }
          }
          v21 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
        }
        while (v21);

        v30 = v52 & 1;
        v9 = v51;
        if (!v50)
        {
          v10 = v47;
          v18 = v49;
          goto LABEL_33;
        }
        v10 = v47;
        v18 = v49;
        if ((v52 & 1) != 0)
        {
LABEL_33:

          v43 = v30 != 0;
          goto LABEL_34;
        }
        objc_msgSend(v17, "objectForKeyedSubscript:", v48);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "BOOLValue");

        if (v32)
          v33 = 46105;
        else
          v33 = 46104;
        v34 = CFSTR("Path is on read-only volume");
        if (!v32)
          v34 = CFSTR("Error accessing path");
        v35 = *MEMORY[0x1E0CB2AA0];
        v60[0] = *MEMORY[0x1E0CB2938];
        v60[1] = v35;
        v61[0] = v34;
        v61[1] = v51;
        v60[2] = *MEMORY[0x1E0CB3308];
        v36 = v34;
        -[PLPhotoLibraryOpener libraryServicesManager](v46, "libraryServicesManager");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "pathManager");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "libraryURL");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v61[2] = v39;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, v60, 3);
        v19 = objc_claimAutoreleasedReturnValue();

        v40 = objc_alloc(MEMORY[0x1E0CB35C8]);
        v41 = v52;
        v18 = v49;
        *v50 = (id)objc_msgSend(v40, "initWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], v33, v19);
LABEL_32:

        v30 = v41 & 1;
        goto LABEL_33;
      }
    }
    else
    {
      PLBackendGetLog();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v64 = v9;
        v65 = 2112;
        v66 = v18;
        _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_DEFAULT, "LibraryServicesManager failed to access resource values for path: %@. Error: %@", buf, 0x16u);
      }
    }
    v41 = 1;
    goto LABEL_32;
  }
  PLBackendGetLog();
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v64 = v9;
    _os_log_impl(&dword_199541000, v42, OS_LOG_TYPE_DEFAULT, "LibraryServicesManager %@ is not reachable", buf, 0xCu);
  }

  v43 = 1;
  v18 = v12;
LABEL_34:

  return v43;
}

+ (BOOL)canAutomaticallyCreateLibrary
{
  return 1;
}

+ (BOOL)_validateUniqueLibraryIdentifierUUIDWithCreationOptions:(id)a3
{
  id v3;
  PLPhotoLibrarySearchCriteria *v4;
  void *v5;
  void *v6;
  void *v7;
  PLPhotoLibraryFinder *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(PLPhotoLibrarySearchCriteria);
  objc_msgSend(v3, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoLibrarySearchCriteria setUuid:](v4, "setUuid:", v5);

  -[PLPhotoLibrarySearchCriteria setDomain:](v4, "setDomain:", objc_msgSend(v3, "domain"));
  objc_msgSend(v3, "containerIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoLibrarySearchCriteria setContainerIdentifier:](v4, "setContainerIdentifier:", v6);

  objc_msgSend(v3, "internalTestOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoLibrarySearchCriteria setInternalTestOptions:](v4, "setInternalTestOptions:", v7);

  v8 = -[PLPhotoLibraryFinder initWithSearchCriteria:]([PLPhotoLibraryFinder alloc], "initWithSearchCriteria:", v4);
  -[PLPhotoLibraryFinder findMatchingPhotoLibraryIdentifiersWithOptions:error:](v8, "findMatchingPhotoLibraryIdentifiersWithOptions:error:", 1, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  if (v10)
  {
    PLLibraryServicesGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "uuid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v12;
      v16 = 2112;
      v17 = v9;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "Library identifier %{public}@ already exists: %@", (uint8_t *)&v14, 0x16u);

    }
  }

  return v10 == 0;
}

+ (id)_resolvePhotoLibraryBundleURLWithOptions:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  int v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "internalTestOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "libraryBundleURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D73280], "rootURLForPhotoLibraryDomain:", objc_msgSend(v4, "domain"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v9 = *MEMORY[0x1E0D74130];
      objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D74130]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(v5, "objectForKeyedSubscript:", v9);
        v11 = objc_claimAutoreleasedReturnValue();

        v8 = (void *)v11;
      }
    }
    objc_msgSend(v4, "containerIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLByAppendingPathComponent:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "uuid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "URLByAppendingPathComponent:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D73280], "photosLibraryExtension");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "URLByAppendingPathExtension:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D73208], "fileManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "path");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "fileExistsAtPath:isDirectory:", v19, 0);

    if (v20)
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "UUIDString");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      PLLibraryServicesGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v4, "uuid");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D73280], "photosLibraryExtension");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 138543874;
        v31 = v24;
        v32 = 2114;
        v33 = v22;
        v34 = 2114;
        v35 = v25;
        _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_ERROR, "Failed to create photo library bundle with name matching identifier UUID %{public}@, renamed as %{public}@.%{public}@", (uint8_t *)&v30, 0x20u);

      }
      objc_msgSend(v13, "URLByAppendingPathComponent:", v22);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D73280], "photosLibraryExtension");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "URLByAppendingPathExtension:", v27);
      v28 = objc_claimAutoreleasedReturnValue();

      v17 = (void *)v28;
    }
    else
    {
      v22 = v14;
    }
    v7 = v17;

  }
  return v7;
}

+ (id)createManagedPhotoLibraryOnFilesystemWithOptions:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  void *v10;

  v6 = a3;
  if ((PLIsAssetsd() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLPhotoLibraryOpener.m"), 116, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PLIsAssetsd()"));

  }
  v7 = v6;
  PLSafeResultWithUnfairLock();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (BOOL)deleteLibraryFromFilesystemAtURL:(id)a3 error:(id *)a4
{
  id v7;
  void *v8;
  char v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  dispatch_time_t v25;
  NSObject *v26;
  NSObject *v27;
  BOOL v28;
  void *v30;
  _QWORD block[4];
  id v32;
  id v33;
  uint64_t *v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if ((PLIsAssetsd() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLPhotoLibraryOpener.m"), 376, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PLIsAssetsd()"));

  }
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  v9 = objc_msgSend(v8, "removeItemAtURL:error:", v7, &v36);
  v10 = v36;

  v40 = v9;
  if (!*((_BYTE *)v38 + 24))
  {
    PLBackendGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v42 = v7;
      v43 = 2112;
      v44 = v10;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "Error removing photo library at %@ : %@", buf, 0x16u);
    }

    if (objc_msgSend(v10, "code") == 513)
    {
      objc_msgSend(v10, "domain");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0CB28A8]);

      if (v13)
      {
        objc_msgSend(v10, "userInfo");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v15, "code") == 66)
        {
          objc_msgSend(v15, "domain");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0CB2FE0]);

          if (v17)
          {
            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "path");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = 0;
            objc_msgSend(v18, "subpathsOfDirectoryAtPath:error:", v19, &v35);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v35;

            if (v20)
            {
              PLBackendGetLog();
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(v20, "componentsJoinedByString:", CFSTR(", "));
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v42 = v23;
                _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, "Photo library bundle still contains:%@", buf, 0xCu);

              }
              objc_msgSend(v20, "sortedArrayUsingComparator:", &__block_literal_global_60129);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v25 = dispatch_time(0, 3000000000);
              dispatch_get_global_queue(21, 0);
              v26 = objc_claimAutoreleasedReturnValue();
              block[0] = MEMORY[0x1E0C809B0];
              block[1] = 3221225472;
              block[2] = __63__PLPhotoLibraryOpener_deleteLibraryFromFilesystemAtURL_error___block_invoke_2;
              block[3] = &unk_1E3676EA0;
              v32 = v24;
              v33 = v7;
              v34 = &v37;
              v27 = v24;
              dispatch_after(v25, v26, block);

            }
            else
            {
              PLBackendGetLog();
              v27 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v42 = v21;
                _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_ERROR, "Cannot get library bundle contents:%@", buf, 0xCu);
              }
            }

          }
        }

      }
    }
  }
  if (*((_BYTE *)v38 + 24))
  {
    v28 = 1;
  }
  else
  {
    v28 = 0;
    if (a4 && v10)
    {
      *a4 = objc_retainAutorelease(v10);
      v28 = *((_BYTE *)v38 + 24) != 0;
    }
  }
  _Block_object_dispose(&v37, 8);

  return v28;
}

void __63__PLPhotoLibraryOpener_deleteLibraryFromFilesystemAtURL_error___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  id v14;
  const char *v15;
  BOOL v16;
  NSObject *v17;
  int v18;
  NSObject *v19;
  const char *v20;
  int v21;
  __int128 v22;
  unsigned __int8 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  int v29;
  __int16 v30;
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v25;
    *(_QWORD *)&v4 = 67109378;
    v22 = v4;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v25 != v6)
          objc_enumerationMutation(v2);
        v8 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 40), "path", v22);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringByAppendingPathComponent:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v23 = 0;
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "fileExistsAtPath:isDirectory:", v10, &v23);
        v13 = v23;

        v14 = objc_retainAutorelease(v10);
        v15 = (const char *)objc_msgSend(v14, "fileSystemRepresentation");
        if (v12)
          v16 = v13 == 0;
        else
          v16 = 1;
        if (v16)
        {
          if (unlink(v15))
          {
            PLBackendGetLog();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              v18 = *__error();
              *(_DWORD *)buf = v22;
              v29 = v18;
              v30 = 2112;
              v31 = v14;
              v19 = v17;
              v20 = "unlink failed with errno %d for path %@";
              goto LABEL_17;
            }
LABEL_18:

            goto LABEL_20;
          }
        }
        else if (rmdir(v15))
        {
          PLBackendGetLog();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            v21 = *__error();
            *(_DWORD *)buf = v22;
            v29 = v21;
            v30 = 2112;
            v31 = v14;
            v19 = v17;
            v20 = "rmdir failed with errno %d for path %@";
LABEL_17:
            _os_log_impl(&dword_199541000, v19, OS_LOG_TYPE_ERROR, v20, buf, 0x12u);
          }
          goto LABEL_18;
        }
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
LABEL_20:

      }
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v5);
  }

}

uint64_t __63__PLPhotoLibraryOpener_deleteLibraryFromFilesystemAtURL_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "length");
  if (v6 <= objc_msgSend(v5, "length"))
  {
    v8 = objc_msgSend(v4, "length");
    v7 = v8 != objc_msgSend(v5, "length");
  }
  else
  {
    v7 = -1;
  }

  return v7;
}

id __79__PLPhotoLibraryOpener_createManagedPhotoLibraryOnFilesystemWithOptions_error___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  PLPhotoLibraryOpener *v9;
  uint64_t v10;
  BOOL v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  _QWORD *v22;
  id v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  id v30;
  id v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  id v36;
  _QWORD v37[2];
  _QWORD v38[2];
  uint64_t v39;
  _QWORD v40[2];

  v40[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 32);
  v32 = 0;
  objc_msgSend(v2, "_resolvePhotoLibraryBundleURLWithOptions:error:", v3, &v32);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v32;
  if (!v4)
  {
LABEL_14:
    v22 = *(_QWORD **)(a1 + 48);
    v23 = v5;
    v4 = 0;
    if (v22)
      goto LABEL_12;
    goto LABEL_15;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "hasCustomUUID")
    && (objc_msgSend(*(id *)(a1 + 40), "_validateUniqueLibraryIdentifierUUIDWithCreationOptions:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {

    v24 = (void *)MEMORY[0x1E0CB35C8];
    v25 = *MEMORY[0x1E0D74498];
    v39 = *MEMORY[0x1E0CB3388];
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v25, 46110, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v26;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, &v39, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", v25, 46018, v27);
    v28 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v28;
    goto LABEL_14;
  }
  +[PLPhotoLibraryBundleController sharedBundleController](PLPhotoLibraryBundleController, "sharedBundleController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lookupOrCreateBundleForLibraryURL:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "libraryServicesManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PLPhotoLibraryOpener initWithLibraryServicesManager:reportInProgressUpgrades:]([PLPhotoLibraryOpener alloc], "initWithLibraryServicesManager:reportInProgressUpgrades:", v8, 0);
  v10 = *(_QWORD *)(a1 + 32);
  v31 = v5;
  v11 = -[PLPhotoLibraryOpener createPhotoLibraryDatabaseWithOptions:error:](v9, "createPhotoLibraryDatabaseWithOptions:error:", v10, &v31);
  v12 = v31;

  if (!v11)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0D74498];
    v15 = *MEMORY[0x1E0CB3388];
    v37[0] = *MEMORY[0x1E0CB3308];
    v37[1] = v15;
    v38[0] = v4;
    v38[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
    v16 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 46018, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "bundleController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "shutdownBundle:reason:", v7, v17);

    v19 = *(void **)(a1 + 40);
    v30 = 0;
    LOBYTE(v16) = objc_msgSend(v19, "deleteLibraryFromFilesystemAtURL:error:", v4, &v30);
    v20 = v30;
    if ((v16 & 1) == 0)
    {
      PLLibraryServicesGetLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v34 = v4;
        v35 = 2112;
        v36 = v20;
        _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_ERROR, "Failed to cleanup after failed library creation with URL: %@  error %@", buf, 0x16u);
      }

    }
    v7 = 0;
  }

  v22 = *(_QWORD **)(a1 + 48);
  v23 = v12;
  if (!v7)
  {
    if (v22)
    {
LABEL_12:
      v23 = objc_retainAutorelease(v23);
      v7 = 0;
      *v22 = v23;
      goto LABEL_16;
    }
LABEL_15:
    v7 = 0;
  }
LABEL_16:

  return v7;
}

@end
