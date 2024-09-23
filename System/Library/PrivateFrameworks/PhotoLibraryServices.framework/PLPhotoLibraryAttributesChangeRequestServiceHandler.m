@implementation PLPhotoLibraryAttributesChangeRequestServiceHandler

- (PLPhotoLibraryAttributesChangeRequestServiceHandler)initWithPhotoLibraryAttributesChanges:(id)a3 clientAuthorization:(id)a4
{
  id v8;
  id v9;
  PLPhotoLibraryAttributesChangeRequestServiceHandler *v10;
  PLPhotoLibraryAttributesChangeRequestServiceHandler *v11;
  void *v13;

  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPhotoLibraryAttributesChangeRequestServiceHandler.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("changes"));

  }
  v10 = -[PLPhotoLibraryAttributesChangeRequestServiceHandler init](self, "init");
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_changes, a3);
    objc_storeStrong((id *)&v11->_clientAuthorization, a4);
  }

  return v11;
}

- (int64_t)accessScopeOptionsRequirement
{
  return 7;
}

- (BOOL)validateChangesWithLibrary:(id)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)applyChangesWithLibrary:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  BOOL v26;
  uint64_t v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  id v51;
  uint64_t v52;
  id v53;
  id v54;
  id v55;
  uint64_t v56;
  const __CFString *v57;
  uint64_t v58;
  const __CFString *v59;
  uint64_t v60;
  const __CFString *v61;
  uint64_t v62;
  const __CFString *v63;
  uint8_t buf[4];
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PLPhotoLibraryAttributesChangeRequestServiceHandler changes](self, "changes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "enableCloudSyncValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PLPhotoLibraryAttributesChangeRequestServiceHandler changes](self, "changes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cloudResourcePrefetchModeValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLPhotoLibraryBundleController sharedBundleController](PLPhotoLibraryBundleController, "sharedBundleController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pathManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "libraryURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "openBundleAtLibraryURL:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    v22 = (void *)MEMORY[0x1E0CB35C8];
    v23 = *MEMORY[0x1E0D74498];
    v56 = *MEMORY[0x1E0CB2938];
    v57 = CFSTR("Error accessing photo library bundle");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v57, &v56, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", v23, 41003, v24);
    v21 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (!v8)
  {
    v21 = 0;
    if (!v10)
      goto LABEL_22;
    goto LABEL_20;
  }
  PLPhotoKitGetLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    -[PLPhotoLibraryAttributesChangeRequestServiceHandler changes](self, "changes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "enableCloudSyncValue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v65 = v17;
    _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_DEFAULT, "Updating cloud sync enabled with requested state: %{public}@", buf, 0xCu);

  }
  if (objc_msgSend(v14, "isSystemPhotoLibrary"))
  {
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *MEMORY[0x1E0D74498];
    v62 = *MEMORY[0x1E0CB2938];
    v63 = CFSTR("Cannot set the SPL as an app library");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v63, &v62, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, 41005, v20);
    v21 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "BOOLValue");
LABEL_9:
    v25 = v21;
    goto LABEL_10;
  }
  v27 = objc_msgSend(v8, "BOOLValue");
  if ((_DWORD)v27)
  {
    v55 = 0;
    v28 = -[PLPhotoLibraryAttributesChangeRequestServiceHandler _establishCPLAppLibraryWithLibraryBundle:error:](self, "_establishCPLAppLibraryWithLibraryBundle:error:", v14, &v55);
    v21 = v55;
    if (!v28)
      goto LABEL_9;
    PLCPLRecordEnableForCurrentAccount();
  }
  else
  {
    v21 = 0;
  }
  objc_msgSend(v14, "libraryServicesManager");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setICloudPhotosEnabledInternal:", v27);

  objc_msgSend(v14, "libraryServicesManager");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "cplReadiness");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "processCloudPhotosLibraryStateChange:", v27);

  if (v10)
  {
LABEL_20:
    v32 = objc_msgSend(v10, "integerValue");
    objc_msgSend(v14, "libraryServicesManager");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "cloudPhotoLibraryManager");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    if (v34)
    {
      v35 = objc_msgSend(v34, "setPrefetchMode:error:", v32, a4);

      if (!v35)
        goto LABEL_9;
      goto LABEL_22;
    }
    v44 = (void *)MEMORY[0x1E0CB35C8];
    v45 = *MEMORY[0x1E0D74498];
    v60 = *MEMORY[0x1E0CB2938];
    v61 = CFSTR("Set prefetch mode requires cloud sync enabled");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "errorWithDomain:code:userInfo:", v45, 45702, v24);
    v46 = objc_claimAutoreleasedReturnValue();

    v21 = (id)v46;
LABEL_8:

    goto LABEL_9;
  }
LABEL_22:
  -[PLPhotoLibraryAttributesChangeRequestServiceHandler changes](self, "changes");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "name");
  v37 = objc_claimAutoreleasedReturnValue();

  -[PLPhotoLibraryAttributesChangeRequestServiceHandler changes](self, "changes");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "userDescription");
  v39 = objc_claimAutoreleasedReturnValue();

  if (v37 | v39)
  {
    v52 = v37;
    objc_msgSend(v6, "pathManager");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "libraryURL");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v21;
    +[PLPhotoLibraryIdentifier photoLibraryIdentifierWithPhotoLibraryURL:createIfMissing:error:](PLPhotoLibraryIdentifier, "photoLibraryIdentifierWithPhotoLibraryURL:createIfMissing:error:", v41, 1, &v54);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v54;

    if (v42)
    {
      v37 = v52;
      v53 = v51;
      v43 = objc_msgSend(v42, "setValuesForName:userDescription:error:", v52, v39, &v53);
      v21 = v53;

    }
    else
    {
      v47 = (void *)MEMORY[0x1E0CB35C8];
      v48 = *MEMORY[0x1E0D74498];
      v58 = *MEMORY[0x1E0CB2938];
      v59 = CFSTR("Error accessing photo library identifier");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "errorWithDomain:code:userInfo:", v48, 41003, v49);
      v21 = (id)objc_claimAutoreleasedReturnValue();

      v43 = 0;
      v37 = v52;
    }

  }
  else
  {
    v43 = 1;
  }

  v25 = v21;
  if (v43)
  {
    v26 = 1;
    goto LABEL_31;
  }
LABEL_10:
  if (a4)
  {
    v25 = objc_retainAutorelease(v25);
    v26 = 0;
    *a4 = v25;
  }
  else
  {
    v26 = 0;
  }
LABEL_31:

  return v26;
}

- (BOOL)_establishCPLAppLibraryWithLibraryBundle:(id)a3 error:(id *)a4
{
  id v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  char v16;
  id v17;
  id v18;
  BOOL v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v26;
  _QWORD v27[2];
  _QWORD v28[2];
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_msgSend(v5, "isSystemPhotoLibrary");
  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v8 = *MEMORY[0x1E0D74498];
    v29 = *MEMORY[0x1E0CB2938];
    v30[0] = CFSTR("Cannot set the SPL as an app library");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 41005, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  objc_msgSend(v5, "libraryServicesManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "cplSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isAppLibrary");

  if ((v13 & 1) == 0)
  {
    objc_msgSend(v5, "libraryServicesManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "cplSettings");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v10;
    v16 = objc_msgSend(v15, "setAppLibrary:error:", 1, &v26);
    v17 = v26;

    if ((v16 & 1) == 0)
    {
      v20 = (void *)MEMORY[0x1E0CB35C8];
      v21 = *MEMORY[0x1E0D74498];
      v22 = *MEMORY[0x1E0CB3388];
      v27[0] = *MEMORY[0x1E0CB2938];
      v27[1] = v22;
      v28[0] = CFSTR("Error updating app library setting");
      v28[1] = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, 41033, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = v24;
      goto LABEL_10;
    }
    v10 = v17;
  }
  v18 = v10;
  if (!v6)
  {
    v19 = 1;
    goto LABEL_13;
  }
LABEL_10:
  if (a4)
  {
    v18 = objc_retainAutorelease(v18);
    v19 = 0;
    *a4 = v18;
  }
  else
  {
    v19 = 0;
  }
LABEL_13:

  return v19;
}

- (PLPhotoLibraryAttributesChanges)changes
{
  return (PLPhotoLibraryAttributesChanges *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changes, 0);
  objc_storeStrong((id *)&self->_clientAuthorization, 0);
}

@end
