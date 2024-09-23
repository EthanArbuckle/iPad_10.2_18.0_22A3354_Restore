@implementation PRSPosterArchiver

+ (int64_t)minSupportedArchiveVersion
{
  return 1;
}

+ (id)archiveExtensionForFormat:(int64_t)a3
{
  if (a3 == 1)
    return CFSTR("zapa");
  else
    return CFSTR("apa");
}

+ (int64_t)formatForDataAtURL:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  int64_t v9;
  NSObject *v10;
  id v12;
  id v13;

  v4 = a3;
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForReadingFromURL:error:", v4, &v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v13;
  if (v5)
  {
    v12 = 0;
    objc_msgSend(v5, "readDataUpToLength:error:", 4, &v12);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v12;

    if (v7)
    {
      v9 = objc_msgSend(a1, "formatForData:", v7);
    }
    else
    {
      PRSLogArchiver();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        +[PRSPosterArchiver formatForDataAtURL:].cold.2();

      v9 = -1;
    }
  }
  else
  {
    PRSLogArchiver();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[PRSPosterArchiver formatForDataAtURL:].cold.1();
    v9 = -1;
    v8 = v6;
  }

  return v9;
}

+ (int64_t)formatForData:(id)a3
{
  id v3;
  unsigned __int8 *v4;
  int v5;
  int64_t v6;

  v3 = a3;
  if ((unint64_t)objc_msgSend(v3, "length") < 4)
    goto LABEL_12;
  v4 = (unsigned __int8 *)objc_msgSend(objc_retainAutorelease(v3), "bytes");
  v5 = *v4;
  if (v5 == 65)
  {
    if (v4[1] == 65 && v4[2] == 48 && v4[3] == 49)
    {
      v6 = 0;
      goto LABEL_13;
    }
LABEL_12:
    v6 = -1;
    goto LABEL_13;
  }
  if (v5 != 80 || v4[1] != 75 || v4[2] != 3 || v4[3] != 4)
    goto LABEL_12;
  v6 = 1;
LABEL_13:

  return v6;
}

+ (id)archiveConfiguration:(id)a3 format:(int64_t)a4 error:(id *)a5
{
  id v7;
  PRSPosterArchiver *v8;
  void *v9;

  v7 = a3;
  v8 = objc_alloc_init(PRSPosterArchiver);
  -[PRSPosterArchiver archiveConfiguration:format:error:](v8, "archiveConfiguration:format:error:", v7, a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)unarchiveConfigurationAtURL:(id)a3 format:(int64_t)a4 error:(id *)a5
{
  id v7;
  PRSPosterArchiver *v8;
  void *v9;

  v7 = a3;
  v8 = objc_alloc_init(PRSPosterArchiver);
  -[PRSPosterArchiver unarchiveConfigurationAtURL:format:error:](v8, "unarchiveConfigurationAtURL:format:error:", v7, a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)unarchiveConfigurationFromData:(id)a3 format:(int64_t)a4 error:(id *)a5
{
  id v7;
  PRSPosterArchiver *v8;
  void *v9;

  v7 = a3;
  v8 = objc_alloc_init(PRSPosterArchiver);
  -[PRSPosterArchiver unarchiveConfigurationFromData:format:error:](v8, "unarchiveConfigurationFromData:format:error:", v7, a4, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)markURLPurgableAfterOneHour:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  NSObject *v13;
  id v15;

  v5 = (void *)MEMORY[0x1E0C99D48];
  v6 = a3;
  objc_msgSend(v5, "currentCalendar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v8, "setHour:", 1);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dateByAddingComponents:toDate:options:", v8, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0;
  v11 = objc_msgSend(v6, "prs_setPurgable:afterDate:error:", 1, v10, &v15);

  v12 = v15;
  if (v12)
  {
    PRSLogArchiver();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[PRSPosterArchiver markURLPurgableAfterOneHour:error:].cold.1();

    if (a4)
      *a4 = objc_retainAutorelease(v12);
  }

  return v11;
}

- (PRSPosterArchiver)init
{
  void *v3;
  PRSPosterArchiver *v4;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PRSPosterArchiver initWithFileManager:](self, "initWithFileManager:", v3);

  return v4;
}

- (PRSPosterArchiver)initWithFileManager:(id)a3
{
  id v5;
  PRSPosterArchiver *v6;
  PRSPosterArchiver *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PRSPosterArchiver;
  v6 = -[PRSPosterArchiver init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_fileManager, a3);

  return v7;
}

- (PRSPosterArchiver)initWithFileManager:(id)a3 processHandle:(id)a4
{
  id v7;
  id v8;
  PRSPosterArchiver *v9;
  PRSPosterArchiver *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PRSPosterArchiver;
  v9 = -[PRSPosterArchiver init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_fileManager, a3);
    objc_storeStrong((id *)&v10->_processHandle, a4);
  }

  return v10;
}

- (id)archiveConfiguration:(id)a3 format:(int64_t)a4 error:(id *)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  const __CFString **v12;
  uint64_t *v13;
  PRSPosterConfigurationAttributes *v14;
  void *v15;
  PRSPosterArchiveManifest *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  id v31;
  NSObject *v32;
  id v33;
  void *v34;
  NSObject *v35;
  char v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  char v41;
  NSObject *v42;
  id *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  NSObject *v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v58;
  void *v59;
  uint64_t v60;
  id v61;
  NSObject *v62;
  NSObject *v63;
  id v64;
  id *v65;
  PRSPosterArchiveManifest *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  uint64_t v80;
  id v81;
  uint64_t v82;
  const __CFString *v83;
  uint64_t v84;
  _QWORD v85[3];

  v85[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (a4 == -1)
  {
    PRSLogArchiver();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      -[PRSPosterArchiver archiveConfiguration:format:error:].cold.1();

    v10 = (void *)MEMORY[0x1E0CB35C8];
    v84 = *MEMORY[0x1E0CB2D50];
    v85[0] = CFSTR("Cannot archive to unknown format");
    v11 = (void *)MEMORY[0x1E0C99D80];
    v12 = (const __CFString **)v85;
    v13 = &v84;
    goto LABEL_16;
  }
  if (a4
    || !-[BSProcessHandle hasEntitlement:](self->_processHandle, "hasEntitlement:", CFSTR("com.apple.posterboardservices.disallowArchivingAppleArchive")))
  {
    v65 = a5;
    v64 = v8;
    v14 = -[PRSPosterConfigurationAttributes initWithConfiguration:]([PRSPosterConfigurationAttributes alloc], "initWithConfiguration:", v8);
    -[PRSPosterConfigurationAttributes extensionIdentifier](v14, "extensionIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[PRSPosterArchiveManifest initWithConfigurationAttributes:]([PRSPosterArchiveManifest alloc], "initWithConfigurationAttributes:", v14);
    -[PRSPosterConfigurationAttributes posterUUID](v14, "posterUUID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "UUIDString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = v15;
    objc_msgSend(v15, "stringByAppendingFormat:", CFSTR("-%@"), v18);
    v19 = objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)objc_opt_class(), "archiveExtensionForFormat:", a4);
    v20 = objc_claimAutoreleasedReturnValue();
    -[PRSPosterArchiver fileManager](self, "fileManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "temporaryDirectory");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "URLByAppendingPathComponent:", v19);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = (void *)v20;
    objc_msgSend(v23, "URLByAppendingPathExtension:", v20);
    v71 = (void *)objc_claimAutoreleasedReturnValue();

    -[PRSPosterArchiver fileManager](self, "fileManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = 0;
    v67 = v22;
    objc_msgSend(v24, "URLForDirectory:inDomain:appropriateForURL:create:error:", 99, 1, v22, 1, &v79);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v79;

    v73 = v25;
    v68 = (void *)v19;
    objc_msgSend(v25, "URLByAppendingPathComponent:", v19);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PRSPosterArchiver fileManager](self, "fileManager");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    PFFileProtectionNoneAttributes();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = v26;
    v30 = objc_msgSend(v28, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v27, 1, v29, &v78);
    v31 = v78;

    v70 = v27;
    v66 = v16;
    if ((v30 & 1) != 0)
    {
      v77 = 0;
      -[PRSPosterArchiveManifest dataRepresentationWithError:](v16, "dataRepresentationWithError:", &v77);
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = v77;

      if (v32)
      {
        objc_msgSend(v27, "URLByAppendingPathComponent:", CFSTR("manifest"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "URLByAppendingPathExtension:", CFSTR("plist"));
        v35 = objc_claimAutoreleasedReturnValue();

        v76 = v33;
        v36 = -[NSObject writeToURL:options:error:](v32, "writeToURL:options:error:", v35, 0, &v76);
        v37 = v76;

        if ((v36 & 1) != 0)
        {
          v62 = v35;
          -[PRSPosterArchiver fileManager](self, "fileManager");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[PRSPosterConfigurationAttributes identifierURL](v14, "identifierURL");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "URLByAppendingPathComponent:", CFSTR("configuration"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          v75 = v37;
          v41 = objc_msgSend(v38, "copyItemAtURL:toURL:error:", v39, v40, &v75);
          v61 = v75;

          if ((v41 & 1) != 0)
          {
            objc_msgSend(v27, "URLByAppendingPathExtension:", v72);
            v42 = objc_claimAutoreleasedReturnValue();
            v43 = v65;
            if (a4)
            {
              -[PRSPosterArchiver fileManager](self, "fileManager");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              PRSZipArchiverCompressDirectory(v27, v42, v44);

            }
            else
            {
              PRSAppleArchiveCompressDirectory(v27, v42);
            }
            v35 = v62;
            v51 = v42;
            -[PRSPosterArchiver fileManager](self, "fileManager");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "removeItemAtURL:error:", v71, 0);

            -[PRSPosterArchiver fileManager](self, "fileManager");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v74 = v61;
            v63 = v51;
            LODWORD(v51) = objc_msgSend(v53, "moveItemAtURL:toURL:error:", v51, v71, &v74);
            v37 = v74;

            if ((_DWORD)v51)
              v49 = v71;
            else
              v49 = 0;
            v50 = v63;
            v8 = v64;
          }
          else
          {
            PRSLogArchiver();
            v50 = objc_claimAutoreleasedReturnValue();
            v43 = v65;
            if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
            {
              v37 = v61;
              -[PRSPosterArchiver archiveConfiguration:format:error:].cold.5();
              v49 = 0;
            }
            else
            {
              v49 = 0;
              v37 = v61;
            }
            v35 = v62;
            v8 = v64;
          }
        }
        else
        {
          PRSLogArchiver();
          v50 = objc_claimAutoreleasedReturnValue();
          v8 = v64;
          v43 = v65;
          if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
            -[PRSPosterArchiver archiveConfiguration:format:error:].cold.6();
          v49 = 0;
        }

        v33 = v37;
      }
      else
      {
        PRSLogArchiver();
        v35 = objc_claimAutoreleasedReturnValue();
        v8 = v64;
        v43 = v65;
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          -[PRSPosterArchiver archiveConfiguration:format:error:].cold.4();
        v49 = 0;
      }

      v31 = v33;
    }
    else
    {
      PRSLogArchiver();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        -[PRSPosterArchiver archiveConfiguration:format:error:].cold.7();
      v49 = 0;
      v8 = v64;
      v43 = v65;
    }
    v54 = v73;

    -[PRSPosterArchiver fileManager](self, "fileManager");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "removeItemAtURL:error:", v73, 0);

    if (v49)
    {
      v56 = v71;
      objc_msgSend((id)objc_opt_class(), "markURLPurgableAfterOneHour:error:", v71, 0);
      if (!v43)
      {
LABEL_41:
        v47 = v49;

        v48 = v47;
        goto LABEL_42;
      }
    }
    else
    {
      PRSLogArchiver();
      v58 = objc_claimAutoreleasedReturnValue();
      v56 = v71;
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
        -[PRSPosterArchiver archiveConfiguration:format:error:].cold.3();

      if (v31)
      {
        v80 = *MEMORY[0x1E0CB3388];
        v81 = v31;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v81, &v80, 1);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v59 = 0;
      }
      v60 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("PRSPosterArchiverErrorDomain"), 2, v59);

      v31 = (id)v60;
      v54 = v73;
      if (!v43)
        goto LABEL_41;
    }
    *v43 = objc_retainAutorelease(v31);
    goto LABEL_41;
  }
  PRSLogArchiver();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[PRSPosterArchiver archiveConfiguration:format:error:].cold.2();

  v10 = (void *)MEMORY[0x1E0CB35C8];
  v82 = *MEMORY[0x1E0CB2D50];
  v83 = CFSTR("Process has disallow AppleArchive entitlement and thus cannot archive to that format");
  v11 = (void *)MEMORY[0x1E0C99D80];
  v12 = &v83;
  v13 = &v82;
LABEL_16:
  objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", v12, v13, 1);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("PRSPosterArchiverErrorDomain"), 6, v46);
  v47 = (id)objc_claimAutoreleasedReturnValue();

  if (a5)
  {
    v47 = objc_retainAutorelease(v47);
    v48 = 0;
    *a5 = v47;
  }
  else
  {
    v48 = 0;
  }
LABEL_42:

  return v48;
}

- (id)unarchiveConfigurationAtURL:(id)a3 format:(int64_t)a4 error:(id *)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  const __CFString **v12;
  uint64_t *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const __CFString *v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (a4 == -1)
    a4 = objc_msgSend((id)objc_opt_class(), "formatForDataAtURL:", v8);
  if (a4 == 1)
  {
    v21 = 0;
    -[PRSPosterArchiver unarchiveConfigurationZipArchiveAtURL:manifest:error:](self, "unarchiveConfigurationZipArchiveAtURL:manifest:error:", v8, &v21, a5);
    v14 = objc_claimAutoreleasedReturnValue();
LABEL_18:
    v18 = (void *)v14;
    goto LABEL_19;
  }
  if (!a4)
  {
    if (-[BSProcessHandle hasEntitlement:](self->_processHandle, "hasEntitlement:", CFSTR("com.apple.posterboardservices.disallowArchivingAppleArchive")))
    {
      PRSLogArchiver();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[PRSPosterArchiver unarchiveConfigurationAtURL:format:error:].cold.2();

      v10 = (void *)MEMORY[0x1E0CB35C8];
      v22 = *MEMORY[0x1E0CB2D50];
      v23 = CFSTR("Process has disallow AppleArchive entitlement and thus cannot unarchive that format");
      v11 = (void *)MEMORY[0x1E0C99D80];
      v12 = &v23;
      v13 = &v22;
      goto LABEL_14;
    }
    goto LABEL_17;
  }
  if (a4 != -1)
  {
LABEL_17:
    v20 = 0;
    -[PRSPosterArchiver unarchiveConfigurationAppleArchiveAtURL:manifest:error:](self, "unarchiveConfigurationAppleArchiveAtURL:manifest:error:", v8, &v20, a5);
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  PRSLogArchiver();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[PRSPosterArchiver unarchiveConfigurationAtURL:format:error:].cold.1();

  v10 = (void *)MEMORY[0x1E0CB35C8];
  v24 = *MEMORY[0x1E0CB2D50];
  v25[0] = CFSTR("Unable to resolve format for file to be unarchived");
  v11 = (void *)MEMORY[0x1E0C99D80];
  v12 = (const __CFString **)v25;
  v13 = &v24;
LABEL_14:
  objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", v12, v13, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("PRSPosterArchiverErrorDomain"), 6, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5)
    *a5 = objc_retainAutorelease(v17);

  v18 = 0;
LABEL_19:

  return v18;
}

- (id)unarchiveConfigurationFromData:(id)a3 format:(int64_t)a4 error:(id *)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  const __CFString **v12;
  uint64_t *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const __CFString *v23;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (a4 == -1)
    a4 = objc_msgSend((id)objc_opt_class(), "formatForData:", v8);
  if (a4 == 1)
  {
    v21 = 0;
    -[PRSPosterArchiver unarchiveConfigurationZipArchiveData:manifest:error:](self, "unarchiveConfigurationZipArchiveData:manifest:error:", v8, &v21, a5);
    v14 = objc_claimAutoreleasedReturnValue();
LABEL_18:
    v18 = (void *)v14;
    goto LABEL_19;
  }
  if (!a4)
  {
    if (-[BSProcessHandle hasEntitlement:](self->_processHandle, "hasEntitlement:", CFSTR("com.apple.posterboardservices.disallowArchivingAppleArchive")))
    {
      PRSLogArchiver();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[PRSPosterArchiver unarchiveConfigurationAtURL:format:error:].cold.2();

      v10 = (void *)MEMORY[0x1E0CB35C8];
      v22 = *MEMORY[0x1E0CB2D50];
      v23 = CFSTR("Process has disallow AppleArchive entitlement and thus cannot unarchive that format");
      v11 = (void *)MEMORY[0x1E0C99D80];
      v12 = &v23;
      v13 = &v22;
      goto LABEL_14;
    }
    goto LABEL_17;
  }
  if (a4 != -1)
  {
LABEL_17:
    v20 = 0;
    -[PRSPosterArchiver unarchiveConfigurationAppleArchiveData:manifest:error:](self, "unarchiveConfigurationAppleArchiveData:manifest:error:", v8, &v20, a5);
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  PRSLogArchiver();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[PRSPosterArchiver unarchiveConfigurationAtURL:format:error:].cold.1();

  v10 = (void *)MEMORY[0x1E0CB35C8];
  v24 = *MEMORY[0x1E0CB2D50];
  v25[0] = CFSTR("Unable to resolve format for file to be unarchived");
  v11 = (void *)MEMORY[0x1E0C99D80];
  v12 = (const __CFString **)v25;
  v13 = &v24;
LABEL_14:
  objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", v12, v13, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("PRSPosterArchiverErrorDomain"), 6, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (a5)
    *a5 = objc_retainAutorelease(v17);

  v18 = 0;
LABEL_19:

  return v18;
}

- (id)unarchiveConfigurationAppleArchiveAtURL:(id)a3 manifest:(id *)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v8 = a3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __76__PRSPosterArchiver_unarchiveConfigurationAppleArchiveAtURL_manifest_error___block_invoke;
  v12[3] = &unk_1E4D42778;
  v13 = v8;
  v9 = v8;
  -[PRSPosterArchiver _unarchiveWithHandler:manifest:error:](self, "_unarchiveWithHandler:manifest:error:", v12, a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

BOOL __76__PRSPosterArchiver_unarchiveConfigurationAppleArchiveAtURL_manifest_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  AAByteStream_impl *v5;
  _BOOL8 v6;

  v3 = objc_retainAutorelease(*(id *)(a1 + 32));
  v4 = a2;
  v5 = AAFileStreamOpenWithPath((const char *)objc_msgSend(v3, "fileSystemRepresentation"), 0, 0);
  v6 = PRSAppleArchiveDecompressStream(v5, v4);

  return v6;
}

- (id)unarchiveConfigurationZipArchiveAtURL:(id)a3 manifest:(id *)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v8 = a3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __74__PRSPosterArchiver_unarchiveConfigurationZipArchiveAtURL_manifest_error___block_invoke;
  v12[3] = &unk_1E4D42778;
  v13 = v8;
  v9 = v8;
  -[PRSPosterArchiver _unarchiveWithHandler:manifest:error:](self, "_unarchiveWithHandler:manifest:error:", v12, a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __74__PRSPosterArchiver_unarchiveConfigurationZipArchiveAtURL_manifest_error___block_invoke(uint64_t a1, NSURL *a2)
{
  return PRSUnarchiverZip(*(NSURL **)(a1 + 32), a2);
}

- (id)unarchiveConfigurationAppleArchiveData:(id)a3 manifest:(id *)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *Serial;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  _QWORD block[4];
  id v22;
  id v23;

  v8 = a3;
  objc_msgSend(MEMORY[0x1E0CB3860], "pipe");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fileHandleForWriting");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fileHandleForReading");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  Serial = BSDispatchQueueCreateSerial();
  v13 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__PRSPosterArchiver_unarchiveConfigurationAppleArchiveData_manifest_error___block_invoke;
  block[3] = &unk_1E4D427A0;
  v22 = v10;
  v23 = v8;
  v14 = v8;
  v15 = v10;
  dispatch_async(Serial, block);
  v19[0] = v13;
  v19[1] = 3221225472;
  v19[2] = __75__PRSPosterArchiver_unarchiveConfigurationAppleArchiveData_manifest_error___block_invoke_2;
  v19[3] = &unk_1E4D42778;
  v20 = v11;
  v16 = v11;
  -[PRSPosterArchiver _unarchiveWithHandler:manifest:error:](self, "_unarchiveWithHandler:manifest:error:", v19, a4, a5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "closeFile");

  return v17;
}

uint64_t __75__PRSPosterArchiver_unarchiveConfigurationAppleArchiveData_manifest_error___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "writeData:error:", *(_QWORD *)(a1 + 40), 0);
  return objc_msgSend(*(id *)(a1 + 32), "closeFile");
}

BOOL __75__PRSPosterArchiver_unarchiveConfigurationAppleArchiveData_manifest_error___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  AAByteStream_impl *v4;
  _BOOL8 v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  v4 = AAFileStreamOpenWithFD(objc_msgSend(v2, "fileDescriptor"), 0);
  v5 = PRSAppleArchiveDecompressStream(v4, v3);

  return v5;
}

- (id)unarchiveConfigurationZipArchiveData:(id)a3 manifest:(id *)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v8 = a3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __73__PRSPosterArchiver_unarchiveConfigurationZipArchiveData_manifest_error___block_invoke;
  v12[3] = &unk_1E4D42778;
  v13 = v8;
  v9 = v8;
  -[PRSPosterArchiver _unarchiveWithHandler:manifest:error:](self, "_unarchiveWithHandler:manifest:error:", v12, a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

uint64_t __73__PRSPosterArchiver_unarchiveConfigurationZipArchiveData_manifest_error___block_invoke(uint64_t a1, NSURL *a2)
{
  return PRSUnarchiverZip(*(NSData **)(a1 + 32), a2);
}

- (id)_unarchiveWithHandler:(id)a3 manifest:(id *)a4 error:(id *)a5
{
  uint64_t (**v7)(id, void *);
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  PRSPosterArchiveManifest *v24;
  NSObject *p_super;
  uint64_t v26;
  NSObject *v27;
  id v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  id v35;
  _BOOL4 v36;
  NSObject *v37;
  _BOOL4 v38;
  NSObject *v39;
  id v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  char v50;
  NSObject *v51;
  NSObject *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  id v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  id v65;
  NSObject *v66;
  void *v67;
  uint64_t v68;
  char v70;
  NSObject *v71;
  void *v72;
  id *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t (**v81)(id, void *);
  id v82;
  id v83;
  void (**v84)(void);
  void *v85;
  id v87;
  id v88;
  id v89;
  id v90;
  id v91;
  _QWORD v92[4];
  id v93;
  id v94;
  id v95;
  uint64_t v96;
  id v97;
  uint64_t v98;
  void *v99;
  uint64_t v100;
  _QWORD v101[3];

  v101[1] = *MEMORY[0x1E0C80C00];
  v7 = (uint64_t (**)(id, void *))a3;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PRSPosterArchiver fileManager](self, "fileManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "temporaryDirectory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "URLByAppendingPathComponent:", CFSTR("PosterConfigurations"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = v9;
  objc_msgSend(v9, "UUIDString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "URLByAppendingPathComponent:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v95 = 0;
  objc_msgSend(v10, "URLForDirectory:inDomain:appropriateForURL:create:error:", 99, 1, v11, 1, &v95);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v95;
  if (v15)
  {
    v92[0] = MEMORY[0x1E0C809B0];
    v92[1] = 3221225472;
    v92[2] = __58__PRSPosterArchiver__unarchiveWithHandler_manifest_error___block_invoke;
    v92[3] = &unk_1E4D427A0;
    v17 = v8;
    v93 = v17;
    v82 = v10;
    v94 = v82;
    v84 = (void (**)(void))MEMORY[0x1A85A457C](v92);
    v83 = v8;
    if ((v7[2](v7, v15) & 1) != 0)
    {
      v73 = a4;
      v74 = v11;
      v18 = v14;
      v81 = v7;
      objc_msgSend(v15, "URLByAppendingPathComponent:", CFSTR("configuration"));
      v19 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "URLByAppendingPathComponent:", CFSTR("manifest"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "URLByAppendingPathExtension:", CFSTR("plist"));
      v21 = objc_claimAutoreleasedReturnValue();

      v79 = (void *)v19;
      objc_msgSend(v17, "addObject:", v19);
      objc_msgSend(v17, "addObject:", v21);
      v91 = v16;
      v75 = (void *)v21;
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v21, 0, &v91);
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = v91;

      v77 = (void *)v22;
      if (v22)
      {
        v24 = -[PRSPosterArchiveManifest initWithDataRepresentation:]([PRSPosterArchiveManifest alloc], "initWithDataRepresentation:", v22);
        if (v24)
        {
          p_super = &v24->super;
          v26 = -[PRSPosterArchiveManifest archiveVersion](v24, "archiveVersion");
          v14 = v18;
          if (v26 >= objc_msgSend((id)objc_opt_class(), "minSupportedArchiveVersion"))
          {
            -[NSObject extensionIdentifier](p_super, "extensionIdentifier");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "URLByAppendingPathComponent:", v42);
            v43 = objc_claimAutoreleasedReturnValue();

            v44 = (void *)MEMORY[0x1E0C99E98];
            -[NSObject configurationUUID](p_super, "configurationUUID");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v71 = v43;
            objc_msgSend(v44, "pf_posterPathIdentifierURLProviderURL:type:posterUUID:", v43, 3, v45);
            v46 = (void *)objc_claimAutoreleasedReturnValue();

            v72 = v46;
            objc_msgSend(v46, "URLByDeletingLastPathComponent");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            PFPosterPathFileAttributes();
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v90 = v23;
            v70 = objc_msgSend(v82, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v47, 1, v48, &v90);
            v49 = v90;

            v11 = v74;
            if ((v70 & 1) != 0)
            {
              v89 = v49;
              v50 = objc_msgSend(v82, "copyItemAtURL:toURL:error:", v79, v72, &v89);
              v23 = v89;

              v7 = v81;
              if ((v50 & 1) != 0)
              {
                if (v73)
                {
                  p_super = objc_retainAutorelease(p_super);
                  *v73 = p_super;
                }
              }
              else
              {
                PRSLogArchiver();
                v52 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
                  -[PRSPosterArchiver _unarchiveWithHandler:manifest:error:].cold.7();

                p_super = 0;
              }
              v33 = v75;
            }
            else
            {
              PRSLogArchiver();
              v51 = objc_claimAutoreleasedReturnValue();
              v7 = v81;
              if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
                -[PRSPosterArchiver _unarchiveWithHandler:manifest:error:].cold.8();

              p_super = 0;
              v33 = v75;
              v23 = v49;
            }
            v32 = p_super;

            p_super = v71;
          }
          else
          {
            PRSLogArchiver();
            v27 = objc_claimAutoreleasedReturnValue();
            v11 = v74;
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
              -[PRSPosterArchiver _unarchiveWithHandler:manifest:error:].cold.6(p_super, (uint64_t)self, v27);

            v28 = objc_alloc(MEMORY[0x1E0CB35C8]);
            v98 = *MEMORY[0x1E0CB2D50];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Archive version %lu is older than min supported %lu"), -[NSObject archiveVersion](p_super, "archiveVersion"), objc_msgSend((id)objc_opt_class(), "minSupportedArchiveVersion"));
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v99 = v29;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v99, &v98, 1);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v28, "initWithDomain:code:userInfo:", CFSTR("PRSPosterArchiverErrorDomain"), 4, v30);

            v32 = 0;
            v23 = (id)v31;
            v7 = v81;
            v33 = v75;
          }
        }
        else
        {
          PRSLogArchiver();
          v39 = objc_claimAutoreleasedReturnValue();
          v14 = v18;
          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
            -[PRSPosterArchiver _unarchiveWithHandler:manifest:error:].cold.5();

          v40 = objc_alloc(MEMORY[0x1E0CB35C8]);
          v100 = *MEMORY[0x1E0CB2D50];
          v101[0] = CFSTR("Archive is unsupported");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v101, &v100, 1);
          p_super = objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v40, "initWithDomain:code:userInfo:", CFSTR("PRSPosterArchiverErrorDomain"), 4, p_super);

          v32 = 0;
          v23 = (id)v41;
          v7 = v81;
          v11 = v74;
          v33 = v75;
        }
      }
      else
      {
        PRSLogArchiver();
        p_super = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
        {
          v33 = (void *)v21;
          -[PRSPosterArchiver _unarchiveWithHandler:manifest:error:].cold.4();
          v32 = 0;
          v7 = v81;
        }
        else
        {
          v32 = 0;
          v7 = v81;
          v33 = (void *)v21;
        }
        v14 = v18;
        v11 = v74;
      }

      v36 = v23 != 0;
      if (v32 && !v23)
      {
        v78 = v10;
        v84[2]();
        -[NSObject extensionIdentifier](v32, "extensionIdentifier");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "URLByAppendingPathComponent:", v53);
        v54 = objc_claimAutoreleasedReturnValue();

        PFPosterPathFileAttributes();
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v88 = 0;
        objc_msgSend(v82, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v14, 1, v55, &v88);
        v56 = v88;

        -[NSObject extensionIdentifier](v32, "extensionIdentifier");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "URLByAppendingPathComponent:isDirectory:", v57, 1);
        v58 = objc_claimAutoreleasedReturnValue();

        v87 = v56;
        v80 = (void *)v54;
        objc_msgSend(v82, "moveItemAtURL:toURL:error:", v54, v58, &v87);
        v23 = v87;

        v59 = (void *)MEMORY[0x1E0D7F8E0];
        -[NSObject extensionIdentifier](v32, "extensionIdentifier");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject role](v32, "role");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject configurationUUID](v32, "configurationUUID");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "configurationIdentityWithProvider:identifier:role:posterUUID:version:supplement:", v60, 0, v61, v62, -[NSObject latestConfigurationVersion](v32, "latestConfigurationVersion"), -[NSObject latestConfigurationSupplement](v32, "latestConfigurationSupplement"));
        v63 = objc_claimAutoreleasedReturnValue();

        v14 = (void *)v58;
        objc_msgSend(MEMORY[0x1E0D7F8E8], "pathWithProviderURL:identity:", v58, v63);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = -[PRSPosterConfiguration _initWithPath:]([PRSPosterConfiguration alloc], "_initWithPath:", v64);
        v76 = (void *)v63;
        if (v65)
        {
          v7 = v81;
          v8 = v83;
        }
        else
        {
          PRSLogArchiver();
          v66 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
            -[PRSPosterArchiver _unarchiveWithHandler:manifest:error:].cold.3();

          v7 = v81;
          if (v23)
          {
            v96 = *MEMORY[0x1E0CB3388];
            v97 = v23;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v97, &v96, 1);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v67 = 0;
          }
          v68 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("PRSPosterArchiverErrorDomain"), 3, v67);

          v23 = (id)v68;
          v8 = v83;
          v14 = (void *)v58;
        }
        objc_msgSend(v82, "removeItemAtURL:error:", v15, 0);
        v10 = v78;
        if (a5 && v23)
          *a5 = objc_retainAutorelease(v23);
        v35 = v65;

LABEL_56:
        v16 = v23;
        goto LABEL_57;
      }
    }
    else
    {
      v23 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("PRSPosterArchiverErrorDomain"), 3, 0);

      v32 = 0;
      v36 = v23 != 0;
    }
    -[NSFileManager removeItemAtURL:error:](self->_fileManager, "removeItemAtURL:error:", v15, 0);
    v84[2]();
    PRSLogArchiver();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      -[PRSPosterArchiver _unarchiveWithHandler:manifest:error:].cold.2();

    if (a5)
      v38 = v36;
    else
      v38 = 0;
    if (v38)
    {
      v23 = objc_retainAutorelease(v23);
      v35 = 0;
      *a5 = v23;
    }
    else
    {
      v35 = 0;
    }
    v8 = v83;
    goto LABEL_56;
  }
  PRSLogArchiver();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    -[PRSPosterArchiver _unarchiveWithHandler:manifest:error:].cold.1();

  v35 = 0;
  if (a5 && v16)
  {
    v16 = objc_retainAutorelease(v16);
    v35 = 0;
    *a5 = v16;
  }
LABEL_57:

  return v35;
}

void __58__PRSPosterArchiver__unarchiveWithHandler_manifest_error___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __58__PRSPosterArchiver__unarchiveWithHandler_manifest_error___block_invoke_2;
  v3[3] = &unk_1E4D427C8;
  v2 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v3);
  objc_msgSend(*(id *)(a1 + 32), "removeAllObjects");

}

uint64_t __58__PRSPosterArchiver__unarchiveWithHandler_manifest_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeItemAtURL:error:", a2, 0);
}

- (NSFileManager)fileManager
{
  return self->_fileManager;
}

- (void)setFileManager:(id)a3
{
  objc_storeStrong((id *)&self->_fileManager, a3);
}

- (BSProcessHandle)processHandle
{
  return self->_processHandle;
}

- (void)setProcessHandle:(id)a3
{
  objc_storeStrong((id *)&self->_processHandle, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processHandle, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
}

+ (id)archiveConfiguration:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(a1, "archiveConfiguration:format:error:", a3, 0, a4);
}

+ (id)unarchiveConfigurationAtURL:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(a1, "unarchiveConfigurationAtURL:format:error:", a3, -1, a4);
}

+ (id)unarchiveConfigurationFromData:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(a1, "unarchiveConfigurationFromData:format:error:", a3, -1, a4);
}

- (id)archiveConfiguration:(id)a3 error:(id *)a4
{
  return -[PRSPosterArchiver archiveConfiguration:format:error:](self, "archiveConfiguration:format:error:", a3, 0, a4);
}

- (id)unarchiveConfigurationAtURL:(id)a3 error:(id *)a4
{
  return -[PRSPosterArchiver unarchiveConfigurationAtURL:format:error:](self, "unarchiveConfigurationAtURL:format:error:", a3, -1, a4);
}

- (id)unarchiveConfigurationFromData:(id)a3 error:(id *)a4
{
  return -[PRSPosterArchiver unarchiveConfigurationFromData:format:error:](self, "unarchiveConfigurationFromData:format:error:", a3, -1, a4);
}

+ (void)formatForDataAtURL:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5_0(&dword_1A4996000, v0, v1, "Could not open file handle for reading from URL %@: %@");
  OUTLINED_FUNCTION_4_0();
}

+ (void)formatForDataAtURL:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5_0(&dword_1A4996000, v0, v1, "Could not read data from file handle %@: %@");
  OUTLINED_FUNCTION_4_0();
}

+ (void)markURLPurgableAfterOneHour:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_1A4996000, v0, v1, "Failed to mark URL as purgable: %{public}@", v2);
  OUTLINED_FUNCTION_4_0();
}

- (void)archiveConfiguration:format:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_3_1(&dword_1A4996000, v0, v1, "Cannot archive to unknown format", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11();
}

- (void)archiveConfiguration:format:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_3_1(&dword_1A4996000, v0, v1, "Process has disallow AppleArchive entitlement and thus cannot archive to that format", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11();
}

- (void)archiveConfiguration:format:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_3_1(&dword_1A4996000, v0, v1, "Failed to get final archive URL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11();
}

- (void)archiveConfiguration:format:error:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_1A4996000, v0, v1, "Unable to create poster manifest data: %@", v2);
  OUTLINED_FUNCTION_4_0();
}

- (void)archiveConfiguration:format:error:.cold.5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5_0(&dword_1A4996000, v0, v1, "Unable to copy configuration contents to container URL %@ : %@");
  OUTLINED_FUNCTION_4_0();
}

- (void)archiveConfiguration:format:error:.cold.6()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5_0(&dword_1A4996000, v0, v1, "Unable to write manifest data to URL %@: %@");
  OUTLINED_FUNCTION_4_0();
}

- (void)archiveConfiguration:format:error:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_1A4996000, v0, v1, "Unable to create container directory for archiving: %@", v2);
  OUTLINED_FUNCTION_4_0();
}

- (void)unarchiveConfigurationAtURL:format:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_3_1(&dword_1A4996000, v0, v1, "Unable to resolve format for file to be unarchived", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11();
}

- (void)unarchiveConfigurationAtURL:format:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_3_1(&dword_1A4996000, v0, v1, "Process has disallow AppleArchive entitlement and thus cannot unarchive that format", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11();
}

- (void)_unarchiveWithHandler:manifest:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_1A4996000, v0, v1, "Unable to create placement URL: %@", v2);
  OUTLINED_FUNCTION_4_0();
}

- (void)_unarchiveWithHandler:manifest:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_3_1(&dword_1A4996000, v0, v1, "Manifest is nil due to prior errors (or not found), bailing.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11();
}

- (void)_unarchiveWithHandler:manifest:error:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_1A4996000, v0, v1, "Unable to create incoming poster configuration: %@", v2);
  OUTLINED_FUNCTION_4_0();
}

- (void)_unarchiveWithHandler:manifest:error:.cold.4()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5_0(&dword_1A4996000, v0, v1, "Manifest data failed to load from URL %@, error: %@");
  OUTLINED_FUNCTION_4_0();
}

- (void)_unarchiveWithHandler:manifest:error:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_12();
  OUTLINED_FUNCTION_3_1(&dword_1A4996000, v0, v1, "No manifest found, Unsupported archive", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_11();
}

- (void)_unarchiveWithHandler:(void *)a1 manifest:(uint64_t)a2 error:(NSObject *)a3 .cold.6(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = 134218240;
  v6 = objc_msgSend(a1, "archiveVersion");
  v7 = 2048;
  v8 = objc_msgSend((id)objc_opt_class(), "minSupportedArchiveVersion");
  OUTLINED_FUNCTION_8(&dword_1A4996000, a3, v4, "Archive version %lu is older than min supported %lu", (uint8_t *)&v5);
}

- (void)_unarchiveWithHandler:manifest:error:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_1A4996000, v0, v1, "Unable to copy contents for poster configuration: %@", v2);
  OUTLINED_FUNCTION_4_0();
}

- (void)_unarchiveWithHandler:manifest:error:.cold.8()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_1(&dword_1A4996000, v0, v1, "Unable to create directory for poster configuration: %@", v2);
  OUTLINED_FUNCTION_4_0();
}

@end
