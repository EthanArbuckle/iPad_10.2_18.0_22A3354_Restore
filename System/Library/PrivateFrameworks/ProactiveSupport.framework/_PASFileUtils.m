@implementation _PASFileUtils

+ (BOOL)iterSortedEntriesInDirectory:(id)a3 selectDirent:(id)a4 onSortedDirent:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  DIR *v15;
  DIR *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  int *v25;
  BOOL v26;
  int *v27;
  char *v28;
  int v29;
  uint64_t v30;
  _QWORD v32[5];
  _QWORD v33[4];
  id v34;
  SEL v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  _BYTE *v40;
  DIR *v41;
  SEL v42;
  id v43;
  _QWORD v44[5];
  id obj;
  uint64_t v46;
  const __CFString *v47;
  uint8_t v48[4];
  uint64_t v49;
  _BYTE buf[24];
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53[5];

  v53[2] = *(id *)MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = objc_retainAutorelease(v11);
  v15 = opendir((const char *)objc_msgSend(v14, "UTF8String"));
  if (v15)
  {
    v16 = v15;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v51 = __Block_byref_object_copy__2560;
    v52 = __Block_byref_object_dispose__2561;
    v53[0] = 0;
    obj = 0;
    +[_PASSqliteDatabase sqliteDatabaseWithFilename:contentProtection:errorHandler:error:](_PASSqliteDatabase, "sqliteDatabaseWithFilename:contentProtection:errorHandler:error:", &stru_1E4431528, 0, 0, &obj);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong(v53, obj);
    if (v17)
    {
      v18 = *(void **)(*(_QWORD *)&buf[8] + 40);
      *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = 0;

      v19 = MEMORY[0x1E0C809B0];
      v44[0] = MEMORY[0x1E0C809B0];
      v44[1] = 3221225472;
      v44[2] = __80___PASFileUtils_iterSortedEntriesInDirectory_selectDirent_onSortedDirent_error___block_invoke;
      v44[3] = &unk_1E4430768;
      v44[4] = buf;
      objc_msgSend(v17, "prepAndRunNonDataQueries:onError:", &unk_1E443F800, v44);
      v20 = *(void **)(*(_QWORD *)&buf[8] + 40);
      if (!v20)
      {
        *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = 0;
        v37[0] = v19;
        v37[1] = 3221225472;
        v37[2] = __80___PASFileUtils_iterSortedEntriesInDirectory_selectDirent_onSortedDirent_error___block_invoke_4;
        v37[3] = &unk_1E4430350;
        v41 = v16;
        v39 = v12;
        v40 = buf;
        v21 = v17;
        v38 = v21;
        v42 = a2;
        v43 = a1;
        objc_msgSend(v21, "writeTransaction:", v37);

        v20 = *(void **)(*(_QWORD *)&buf[8] + 40);
        if (!v20)
        {
          v33[0] = v19;
          v33[1] = 3221225472;
          v33[2] = __80___PASFileUtils_iterSortedEntriesInDirectory_selectDirent_onSortedDirent_error___block_invoke_28;
          v33[3] = &unk_1E4430378;
          v35 = a2;
          v36 = a1;
          v34 = v13;
          v32[0] = v19;
          v32[1] = 3221225472;
          v32[2] = __80___PASFileUtils_iterSortedEntriesInDirectory_selectDirent_onSortedDirent_error___block_invoke_2_32;
          v32[3] = &unk_1E4430768;
          v32[4] = buf;
          if ((objc_msgSend(v21, "prepAndRunQuery:onPrep:onRow:onError:", CFSTR("SELECT dirent FROM dirents ORDER BY name ASC"), 0, v33, v32) & 1) == 0&& !*(_QWORD *)(*(_QWORD *)&buf[8] + 40))
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)v48 = 0;
              _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "_PASFileUtils failed to read dirent row for unknown reason", v48, 2u);
            }
            v46 = *MEMORY[0x1E0CB2D68];
            v47 = CFSTR("_PASFileUtils failed to read dirent row for unknown reason");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v47, &v46, 1);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("_PASFileUtilsErrorDomain"), 2, v22);
            v24 = *(void **)(*(_QWORD *)&buf[8] + 40);
            *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v23;

          }
          v20 = *(void **)(*(_QWORD *)&buf[8] + 40);
          if (!v20)
          {
            v26 = 1;
            goto LABEL_25;
          }
        }
      }
      if (!a6)
        goto LABEL_24;
LABEL_19:
      v26 = 0;
      *a6 = objc_retainAutorelease(v20);
LABEL_25:
      objc_msgSend(v17, "closePermanently");
      closedir(v16);

      _Block_object_dispose(buf, 8);
      goto LABEL_26;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v30 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
      *(_DWORD *)v48 = 138412290;
      v49 = v30;
      _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "_PASFileUtils failed to open dirent db: %@", v48, 0xCu);
      if (a6)
        goto LABEL_18;
    }
    else if (a6)
    {
LABEL_18:
      v20 = *(void **)(*(_QWORD *)&buf[8] + 40);
      goto LABEL_19;
    }
LABEL_24:
    v26 = 0;
    goto LABEL_25;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v27 = __error();
    v28 = strerror(*v27);
    v29 = *__error();
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v14;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = v28;
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v51) = v29;
    _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "_PASFileUtils failed to open directory \"%@\": %s (%d)", buf, 0x1Cu);
    if (a6)
      goto LABEL_15;
LABEL_21:
    v26 = 0;
    goto LABEL_26;
  }
  if (!a6)
    goto LABEL_21;
LABEL_15:
  v25 = __error();
  posixError(*v25);
  v26 = 0;
  *a6 = (id)objc_claimAutoreleasedReturnValue();
LABEL_26:

  return v26;
}

+ (id)mkstempWithPrefix:(id)a3 error:(id *)a4
{
  id v7;
  id v8;
  const char *v9;
  id v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _PASTempfileDescr *v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  int *v23;
  void *v24;
  void *v26;
  uint8_t buf[8];
  uint64_t v28;
  void *v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("_PASFileUtils.m"), 152, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("prefix"));

  }
  objc_msgSend(v7, "stringByAppendingString:", CFSTR("XXXXXX"));
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = (const char *)objc_msgSend(v8, "UTF8String");
  if (v9)
  {
    v10 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithBytes:length:", v9, strlen(v9) + 1));
    v11 = (char *)objc_msgSend(v10, "mutableBytes");
    *__error() = 0;
    v12 = mkstemp(v11);
    if ((v12 & 0x80000000) != 0)
    {
      if (!a4)
      {
        v15 = 0;
        goto LABEL_14;
      }
      v19 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v20 = *MEMORY[0x1E0CB2FE0];
      v21 = *__error();
      v28 = *MEMORY[0x1E0CB2D50];
      v22 = (void *)MEMORY[0x1E0CB3940];
      v23 = __error();
      objc_msgSend(v22, "stringWithUTF8String:", strerror(*v23));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *a4 = (id)objc_msgSend(v19, "initWithDomain:code:userInfo:", v20, v21, v24);

      v15 = 0;
    }
    else
    {
      v13 = v12;
      if (fcntl(v12, 64, 6) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "+[_PASFileUtils mkstempWithPrefix:error:] failed to set PROTECTION_CLASS_F", buf, 2u);
      }
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithCString:encoding:", v11, 4);
      v15 = -[_PASTempfileDescr initWithFd:path:]([_PASTempfileDescr alloc], "initWithFd:path:", v13, v14);
    }

  }
  else
  {
    if (!a4)
    {
      v15 = 0;
      goto LABEL_15;
    }
    v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v17 = *MEMORY[0x1E0CB2FE0];
    v30 = *MEMORY[0x1E0CB2D50];
    v31[0] = CFSTR("path is not valid unicode");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v18 = (id)objc_msgSend(v16, "initWithDomain:code:userInfo:", v17, 22, v10);
    v15 = 0;
    *a4 = v18;
  }
LABEL_14:

LABEL_15:
  return v15;
}

@end
