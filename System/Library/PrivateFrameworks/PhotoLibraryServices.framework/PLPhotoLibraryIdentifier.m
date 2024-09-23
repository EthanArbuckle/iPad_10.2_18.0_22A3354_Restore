@implementation PLPhotoLibraryIdentifier

- (PLPhotoLibraryIdentifier)initWithIdentifierPayload:(id)a3
{
  id v6;
  PLPhotoLibraryIdentifier *v7;
  PLPhotoLibraryIdentifier *v8;
  void *v10;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPhotoLibraryIdentifier.m"), 264, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifierPayload"));

  }
  v7 = -[PLPhotoLibraryIdentifier init](self, "init");
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_payload, a3);

  return v8;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PLPhotoLibraryIdentifier;
  -[PLPhotoLibraryIdentifier description](&v9, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoLibraryIdentifier uuid](self, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoLibraryIdentifier name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoLibraryIdentifier userDescription](self, "userDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(": UUID:[%@], name:[%@], userDescription:[%@]"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[PLPhotoLibraryIdentifier name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("Name"));

  -[PLPhotoLibraryIdentifier userDescription](self, "userDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("UserDescription"));

  -[PLPhotoLibraryIdentifier uuid](self, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("UUID"));

  -[PLPhotoLibraryIdentifier path](self, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("Path"));

  -[PLPhotoLibraryIdentifier containerIdentifier](self, "containerIdentifier");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v9, CFSTR("ContainerIdentifier"));

}

- (PLPhotoLibraryIdentifier)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  PLPhotoLibraryIdentifier *v13;
  NSObject *v14;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UserDescription"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("UUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Path"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ContainerIdentifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D73280]), "initWithBaseDirectory:", v8);
  v16 = 0;
  +[PLPhotoLibraryIdentifier _buildIdentifierMapForPathManager:containerIdentifier:uuid:name:userDescription:error:](PLPhotoLibraryIdentifier, "_buildIdentifierMapForPathManager:containerIdentifier:uuid:name:userDescription:error:", v10, v9, v7, v5, v6, &v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v16;
  if (v11)
  {
    v13 = -[PLPhotoLibraryIdentifier initWithIdentifierPayload:](self, "initWithIdentifierPayload:", v11);
  }
  else
  {
    PLBackendGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v18 = v8;
      v19 = 2112;
      v20 = v12;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Invalid photo library identifier from coder init for library path %@. Error: %@", buf, 0x16u);
    }

    v13 = 0;
  }

  return v13;
}

- (NSString)name
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](self->_payload, "objectForKeyedSubscript:", CFSTR("Name"));
}

- (NSString)uuid
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](self->_payload, "objectForKeyedSubscript:", CFSTR("UUID"));
}

- (NSString)userDescription
{
  return (NSString *)-[NSDictionary objectForKeyedSubscript:](self->_payload, "objectForKeyedSubscript:", CFSTR("UserDescription"));
}

- (id)path
{
  return -[NSDictionary objectForKeyedSubscript:](self->_payload, "objectForKeyedSubscript:", CFSTR("Path"));
}

- (NSURL)libraryURL
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E98];
  -[PLPhotoLibraryIdentifier path](self, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fileURLWithPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v4;
}

- (NSString)containerIdentifier
{
  __CFString *v2;

  -[NSDictionary objectForKeyedSubscript:](self->_payload, "objectForKeyedSubscript:", CFSTR("ContainerIdentifier"));
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    v2 = CFSTR("com.apple.photos");
  return (NSString *)v2;
}

- (int64_t)domain
{
  void *v2;
  int v3;

  -[PLPhotoLibraryIdentifier containerIdentifier](self, "containerIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.photos"));

  if (v3)
    return 2;
  else
    return 3;
}

- (BOOL)setValuesForName:(id)a3 userDescription:(id)a4 error:(id *)a5
{
  unint64_t v8;
  unint64_t v9;
  PLPhotoLibraryIdentifier *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;

  v8 = (unint64_t)a3;
  v9 = (unint64_t)a4;
  if (v8 | v9)
  {
    v10 = self;
    objc_sync_enter(v10);
    objc_msgSend((id)objc_opt_class(), "_stripWellKnownIdentifierFromIdentifierMap:", v10->_payload);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v8)
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v8, CFSTR("Name"));
    if (v9)
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v9, CFSTR("UserDescription"));
    v13 = (void *)MEMORY[0x1E0D73158];
    -[PLPhotoLibraryIdentifier libraryURL](v10, "libraryURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "appPrivateDataForLibraryURL:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(v15, "setValue:forKeyPath:error:", v12, CFSTR("Library.Identifier"), a5);
    if (v16)
      objc_storeStrong((id *)&v10->_payload, v12);

    objc_sync_exit(v10);
  }
  else
  {
    LOBYTE(v16) = 1;
  }

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payload, 0);
}

+ (id)_existingPhotoLibraryIdentifierRecordForLibraryURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  PLPhotoLibraryIdentifier *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  os_unfair_lock_assert_owner((const os_unfair_lock *)&s_identifierGenerationLock);
  objc_msgSend(MEMORY[0x1E0D73158], "appPrivateDataForLibraryURL:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "valueForKeyPath:", CFSTR("Library.Identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_8;
  if (objc_msgSend(a1, "_isValidLibraryURL:identifierMap:", v6, v8))
  {
    objc_msgSend(a1, "_addWellKnownIdentifierFromIdentifierMap:libraryURL:", v8, v6);
    v9 = objc_claimAutoreleasedReturnValue();

    v10 = -[PLPhotoLibraryIdentifier initWithIdentifierPayload:]([PLPhotoLibraryIdentifier alloc], "initWithIdentifierPayload:", v9);
    v11 = 0;
    v8 = (void *)v9;
    goto LABEL_9;
  }
  v12 = (void *)MEMORY[0x1E0CB35C8];
  v13 = *MEMORY[0x1E0D74498];
  v18 = *MEMORY[0x1E0CB2938];
  v19[0] = CFSTR("Mismatched library url");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, &v18, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 46109, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v15;
  if (!v15)
  {
LABEL_8:
    v10 = 0;
    v11 = 0;
    goto LABEL_9;
  }
  v11 = v16;
  if (a4)
    *a4 = objc_retainAutorelease(v16);

  v10 = 0;
LABEL_9:

  return v10;
}

+ (id)photoLibraryIdentifierWithPhotoLibraryURL:(id)a3 createIfMissing:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  id v10;
  id v11;
  BOOL v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  id v20;
  id v21;
  _QWORD v22[2];
  _QWORD v23[3];

  v6 = a4;
  v23[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&s_identifierGenerationLock);
  v21 = 0;
  objc_msgSend(a1, "_existingPhotoLibraryIdentifierRecordForLibraryURL:error:", v8, &v21);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v21;
  v11 = v10;
  if (v9 || (!v10 ? (v12 = !v6) : (v12 = 1), v12))
  {
    if (!v10)
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v14 = *MEMORY[0x1E0D74498];
      v15 = *MEMORY[0x1E0CB3308];
      v22[0] = *MEMORY[0x1E0CB2938];
      v22[1] = v15;
      v23[0] = CFSTR("Library identifier does not exist for this url");
      v23[1] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, 46111, v16);
      v11 = (id)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v20 = 0;
    objc_msgSend(a1, "_createPhotoLibraryIdentifierWithPhotoLibraryURL:containerIdentifier:uuid:name:userDescription:error:", v8, CFSTR("com.apple.photos"), 0, 0, 0, &v20);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v20;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&s_identifierGenerationLock);
  v17 = v11;
  v18 = v17;
  if (!v9 && a5)
    *a5 = objc_retainAutorelease(v17);

  return v9;
}

+ (id)createPhotoLibraryIdentifierWithPhotoLibraryURL:(id)a3 containerIdentifier:(id)a4 name:(id)a5 userDescription:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;

  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&s_identifierGenerationLock);
  objc_msgSend(a1, "_createPhotoLibraryIdentifierWithPhotoLibraryURL:containerIdentifier:uuid:name:userDescription:error:", v15, v14, 0, v13, v12, a7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock((os_unfair_lock_t)&s_identifierGenerationLock);
  return v16;
}

+ (id)createPhotoLibraryIdentifierWithPhotoLibraryURL:(id)a3 containerIdentifier:(id)a4 uuid:(id)a5 name:(id)a6 userDescription:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;

  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&s_identifierGenerationLock);
  objc_msgSend(a1, "_createPhotoLibraryIdentifierWithPhotoLibraryURL:containerIdentifier:uuid:name:userDescription:error:", v18, v17, v16, v15, v14, a8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock((os_unfair_lock_t)&s_identifierGenerationLock);
  return v19;
}

+ (id)_createPhotoLibraryIdentifierWithPhotoLibraryURL:(id)a3 containerIdentifier:(id)a4 uuid:(id)a5 name:(id)a6 userDescription:(id)a7 error:(id *)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  PLPhotoLibraryIdentifier *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  id v37;
  void *v38;
  void *v39;
  int v40;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  uint64_t v57;
  const __CFString *v58;
  uint64_t v59;
  const __CFString *v60;
  uint64_t v61;
  _QWORD v62[2];

  v62[1] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLPhotoLibraryIdentifier.m"), 155, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("libraryURL"));

  }
  if ((PLIsReallyAssetsd() & 1) == 0 && (MEMORY[0x19AEC0720]() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLPhotoLibraryIdentifier.m"), 156, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("PLIsReallyAssetsd() || PLIsXcTest()"));

  }
  os_unfair_lock_assert_owner((const os_unfair_lock *)&s_identifierGenerationLock);
  objc_msgSend(a1, "_existingPhotoLibraryIdentifierRecordForLibraryURL:error:", v15, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    v21 = (void *)MEMORY[0x1E0CB35C8];
    v22 = *MEMORY[0x1E0D74498];
    v61 = *MEMORY[0x1E0CB2938];
    v62[0] = CFSTR("Library identifier is already persisted for this url");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, &v61, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "errorWithDomain:code:userInfo:", v22, 46110, v23);
    v24 = (id)objc_claimAutoreleasedReturnValue();
    v25 = 0;
LABEL_8:

    v26 = v24;
    goto LABEL_9;
  }
  v52 = v17;
  v53 = v16;
  v30 = (void *)MEMORY[0x1E0D73208];
  objc_msgSend(v15, "path");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = 0;
  objc_msgSend(v30, "realPathForPath:error:", v31, &v56);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v56;

  if (!v23)
  {
    v42 = (void *)MEMORY[0x1E0CB35C8];
    v43 = *MEMORY[0x1E0D74498];
    v57 = *MEMORY[0x1E0CB2938];
    v58 = CFSTR("Failed to access realpath for library url");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v58, &v57, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "errorWithDomain:code:userInfo:", v43, 46102, v23);
    v24 = (id)objc_claimAutoreleasedReturnValue();

    v25 = 0;
    v17 = v52;
    v16 = v53;
    goto LABEL_8;
  }
  v51 = v19;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v23, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D73280]), "initWithLibraryURL:", v33);
  if (objc_msgSend(v25, "isUBF"))
  {
    objc_msgSend(MEMORY[0x1E0D73280], "photosLibraryExtension");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "pathExtension");
    v50 = v18;
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "isEqualToString:", v35);

    v18 = v50;
    if ((v36 & 1) == 0)
    {
      v44 = (void *)MEMORY[0x1E0CB35C8];
      v45 = *MEMORY[0x1E0D74498];
      v59 = *MEMORY[0x1E0CB2938];
      v60 = CFSTR("Invalid library file extension");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v60, &v59, 1);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = v45;
      v18 = v50;
      objc_msgSend(v44, "errorWithDomain:code:userInfo:", v47, 46102, v46);
      v24 = (id)objc_claimAutoreleasedReturnValue();

      v17 = v52;
      v16 = v53;
LABEL_23:
      v19 = v51;
      goto LABEL_8;
    }
  }

  v55 = v32;
  v17 = v52;
  v19 = v51;
  objc_msgSend(a1, "_buildIdentifierMapForPathManager:containerIdentifier:uuid:name:userDescription:error:", v25, v53, v52, v18, v51, &v55);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v55;

  if (v23)
  {
    v37 = v18;
    objc_msgSend(MEMORY[0x1E0D73158], "appPrivateDataForLibraryURL:", v15);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_stripWellKnownIdentifierFromIdentifierMap:", v23);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v26;
    v40 = objc_msgSend(v38, "setValue:forKeyPath:error:", v39, CFSTR("Library.Identifier"), &v54);
    v24 = v54;

    if (v40)
    {
      v29 = -[PLPhotoLibraryIdentifier initWithIdentifierPayload:]([PLPhotoLibraryIdentifier alloc], "initWithIdentifierPayload:", v23);

      v28 = v24;
      v17 = v52;
      v16 = v53;
      v18 = v37;
      v19 = v51;
      goto LABEL_18;
    }

    v17 = v52;
    v16 = v53;
    v18 = v37;
    goto LABEL_23;
  }
  v16 = v53;
LABEL_9:
  v27 = v26;
  v28 = v27;
  if (a8)
  {
    v28 = objc_retainAutorelease(v27);
    v29 = 0;
    *a8 = v28;
  }
  else
  {
    v29 = 0;
  }
LABEL_18:

  return v29;
}

+ (id)_buildIdentifierMapForPathManager:(id)a3 containerIdentifier:(id)a4 uuid:(id)a5 name:(id)a6 userDescription:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  const __CFString *v30;
  const __CFString *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v40;
  __CFString *v42;
  __CFString *v43;
  id v44;
  uint64_t v45;
  const __CFString *v46;
  _QWORD v47[6];
  _QWORD v48[8];

  v48[6] = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v43 = (__CFString *)a4;
  v15 = a5;
  v16 = a6;
  v42 = (__CFString *)a7;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLPhotoLibraryIdentifier.m"), 208, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pathManager"));

  }
  v17 = (void *)MEMORY[0x1E0D73208];
  objc_msgSend(v14, "libraryURL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "path");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0;
  objc_msgSend(v17, "realPathForPath:error:", v19, &v44);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v44;

  if (!v20)
  {
    objc_msgSend(v14, "libraryURL");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "path");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringByStandardizingPath");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v20)
    {
      v35 = (void *)MEMORY[0x1E0CB35C8];
      v36 = *MEMORY[0x1E0D74498];
      v45 = *MEMORY[0x1E0CB2938];
      v46 = CFSTR("Failed to access realpath for library url");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "errorWithDomain:code:userInfo:", v36, 46102, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      v34 = v38;
      v20 = 0;
LABEL_18:
      if (a8)
      {
        v34 = objc_retainAutorelease(v34);
        v33 = 0;
        *a8 = v34;
      }
      else
      {
        v33 = 0;
      }
      goto LABEL_21;
    }
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v20, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "length"))
  {
    v25 = v15;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "UUIDString");
    v25 = (id)objc_claimAutoreleasedReturnValue();

  }
  v27 = v15;
  if (objc_msgSend(v16, "length"))
  {
    v28 = v16;
  }
  else
  {
    objc_msgSend(v24, "lastPathComponent");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "stringByDeletingPathExtension");
    v28 = (id)objc_claimAutoreleasedReturnValue();

  }
  v47[0] = CFSTR("Name");
  v47[1] = CFSTR("UserDescription");
  v30 = &stru_1E36789C0;
  if (v42)
    v30 = v42;
  v48[0] = v28;
  v48[1] = v30;
  v47[2] = CFSTR("Path");
  v47[3] = CFSTR("UUID");
  v31 = CFSTR("com.apple.photos");
  v48[2] = v20;
  v48[3] = v25;
  if (v43)
    v31 = v43;
  v48[4] = v31;
  v47[4] = CFSTR("ContainerIdentifier");
  v47[5] = CFSTR("WellKnownIdentifier");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(MEMORY[0x1E0D73280], "wellKnownPhotoLibraryIdentifierForURL:", v24));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v48[5] = v32;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 6);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = v21;
  v15 = v27;
  if (!v33)
    goto LABEL_18;
LABEL_21:

  return v33;
}

+ (id)_stripWellKnownIdentifierFromIdentifierMap:(id)a3
{
  id v5;
  void *v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLPhotoLibraryIdentifier.m"), 236, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifierPayload"));

  }
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  objc_msgSend(v6, "removeObjectForKey:", CFSTR("WellKnownIdentifier"));

  return v6;
}

+ (id)_addWellKnownIdentifierFromIdentifierMap:(id)a3 libraryURL:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  void *v14;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLPhotoLibraryIdentifier.m"), 243, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifierPayload"));

    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PLPhotoLibraryIdentifier.m"), 244, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("libraryURL"));

    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  v10 = (void *)objc_msgSend(v7, "mutableCopy");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(MEMORY[0x1E0D73280], "wellKnownPhotoLibraryIdentifierForURL:", v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("WellKnownIdentifier"));

  return v10;
}

+ (BOOL)_isValidLibraryURL:(id)a3 identifierMap:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  char v12;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0D73208];
  objc_msgSend(v5, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  objc_msgSend(v7, "realPathForPath:error:", v8, &v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v14;

  if (v9)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Path"));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "isEqualToString:", v11);
  }
  else
  {
    PLBackendGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v16 = v5;
      v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "Failed to access realpath for library identifier url: %@. Error: %@", buf, 0x16u);
    }
    v12 = 0;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
