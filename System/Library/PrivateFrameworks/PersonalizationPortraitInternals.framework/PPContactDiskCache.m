@implementation PPContactDiskCache

- (PPContactDiskCache)initWithPath:(id)a3
{
  id v5;
  PPContactDiskCache *v6;
  PPContactDiskCache *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PPContactDiskCache;
  v6 = -[PPContactDiskCache init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_path, a3);

  return v7;
}

- (id)path
{
  return self->_path;
}

- (BOOL)isEmpty
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  int v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentsOfDirectoryAtPath:error:", self->_path, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "pathExtension", (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("pb"));

        v8 += v12;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
    v13 = v8 == 0;
  }
  else
  {
    v13 = 1;
  }

  return v13;
}

- (BOOL)iterNameRecordCacheWithError:(id *)a3 block:(id)a4
{
  void *v5;
  int v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  BOOL v10;
  NSString *path;
  BOOL v12;
  NSString *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  int64_t lastCreatedAt;
  uint64_t v28;
  int v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  void *v40;
  void *v41;
  PPInternalContactNameRecord *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  NSObject *v46;
  NSString *v48;
  id *v49;
  uint64_t v50;
  NSObject *v51;
  PPContactDiskCache *v52;
  uint64_t v53;
  void (**v54)(id, void *, _BYTE *);
  void *v55;
  void *v56;
  void *v57;
  char v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  unsigned __int8 v68;
  _BYTE v69[128];
  _BYTE v70[128];
  int buf;
  NSString *v72;
  __int16 v73;
  int v74;
  uint64_t v75;

  v49 = a3;
  v75 = *MEMORY[0x1E0C80C00];
  v54 = (void (**)(id, void *, _BYTE *))a4;
  v68 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fileExistsAtPath:isDirectory:", self->_path, &v68);
  v7 = v68;

  pp_contacts_log_handle();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v6)
    v10 = v7 == 0;
  else
    v10 = 1;
  if (v10)
  {
    if (v9)
    {
      path = self->_path;
      buf = 138412546;
      v72 = path;
      v73 = 1024;
      v74 = v68;
      v12 = 1;
      _os_log_impl(&dword_1C392E000, v8, OS_LOG_TYPE_INFO, "PPPB: No name record cache at: %@ (isDirectory=%d)", (uint8_t *)&buf, 0x12u);
    }
    else
    {
      v12 = 1;
    }
  }
  else
  {
    if (v9)
    {
      v13 = self->_path;
      buf = 138412290;
      v72 = v13;
      _os_log_impl(&dword_1C392E000, v8, OS_LOG_TYPE_INFO, "PPPB: loading contact record cache from: %@", (uint8_t *)&buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "enumeratorAtPath:", self->_path);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v67 = 0u;
      v65 = 0u;
      v66 = 0u;
      v64 = 0u;
      v8 = v15;
      v16 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v65;
        v50 = *(_QWORD *)v65;
        v51 = v8;
        v52 = self;
LABEL_13:
        v19 = 0;
        v53 = v17;
        while (1)
        {
          if (*(_QWORD *)v65 != v18)
            objc_enumerationMutation(v8);
          v20 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * v19);
          objc_msgSend(v20, "pathExtension", v49);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "isEqualToString:", CFSTR("pb"));

          if (v22)
          {
            v23 = (void *)MEMORY[0x1C3BD6630]();
            -[NSString stringByAppendingPathComponent:](self->_path, "stringByAppendingPathComponent:", v20);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_autoreleasePoolPop(v23);
            v63 = 0;
            -[PPContactDiskCache _cacheObjectFromFilePath:error:](self, "_cacheObjectFromFilePath:error:", v24, &v63);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = v63;
            v57 = v26;
            if (v25)
            {
              v56 = v24;
              if (objc_msgSend(v25, "hasCreatedAt"))
              {
                lastCreatedAt = self->_lastCreatedAt;
                v28 = objc_msgSend(v25, "createdAt");
                if (lastCreatedAt && v28 >= self->_lastCreatedAt)
                  v28 = self->_lastCreatedAt;
              }
              else
              {
                v28 = 1;
              }
              self->_lastCreatedAt = v28;
              v30 = objc_alloc(MEMORY[0x1E0C99E08]);
              objc_msgSend(v25, "records");
              v31 = v25;
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = (void *)objc_msgSend(v30, "initWithCapacity:", objc_msgSend(v32, "count"));

              v61 = 0u;
              v62 = 0u;
              v59 = 0u;
              v60 = 0u;
              v55 = v31;
              objc_msgSend(v31, "records");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
              if (v35)
              {
                v36 = v35;
                v37 = *(_QWORD *)v60;
                do
                {
                  for (i = 0; i != v36; ++i)
                  {
                    if (*(_QWORD *)v60 != v37)
                      objc_enumerationMutation(v34);
                    v39 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
                    v40 = (void *)MEMORY[0x1C3BD6630]();
                    objc_msgSend(v39, "sourceIdentifier");
                    v41 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v41)
                    {
                      v42 = -[PPInternalContactNameRecord initWithPBContactNameRecord:]([PPInternalContactNameRecord alloc], "initWithPBContactNameRecord:", v39);
                      objc_msgSend(v39, "sourceIdentifier");
                      v43 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v33, "setObject:forKeyedSubscript:", v42, v43);

                    }
                    objc_autoreleasePoolPop(v40);
                  }
                  v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
                }
                while (v36);
              }

              v58 = 0;
              v44 = (void *)MEMORY[0x1C3BD6630]();
              v54[2](v54, v33, &v58);
              objc_autoreleasePoolPop(v44);
              if (v58)
              {
                pp_contacts_log_handle();
                v45 = objc_claimAutoreleasedReturnValue();
                v18 = v50;
                v8 = v51;
                v17 = v53;
                v25 = v55;
                v24 = v56;
                if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
                {
                  LOWORD(buf) = 0;
                  _os_log_impl(&dword_1C392E000, v45, OS_LOG_TYPE_INFO, "PPPB: client stopped iteration early", (uint8_t *)&buf, 2u);
                }

                v29 = 2;
              }
              else
              {
                v29 = 0;
                v18 = v50;
                v8 = v51;
                v17 = v53;
                v25 = v55;
                v24 = v56;
              }

              self = v52;
            }
            else
            {
              if (v49)
                *v49 = objc_retainAutorelease(v26);
              v29 = 1;
            }

            if (v29)
              break;
          }
          if (++v19 == v17)
          {
            v17 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
            if (v17)
              goto LABEL_13;
            goto LABEL_45;
          }
        }
      }
      else
      {
LABEL_45:
        LOBYTE(v29) = 0;
      }

      v12 = (v29 & 1) == 0;
    }
    else
    {
      pp_contacts_log_handle();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        v48 = self->_path;
        buf = 138412290;
        v72 = v48;
        _os_log_error_impl(&dword_1C392E000, v46, OS_LOG_TYPE_ERROR, "PPPB: failed to create enumerator for %@", (uint8_t *)&buf, 0xCu);
      }

      v12 = (char)v49;
      if (v49)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D70D10], 14, 0);
        v8 = 0;
        v12 = 0;
        *v49 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v8 = 0;
      }
    }
  }

  return v12;
}

- (id)_cacheObjectFromFilePath:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  PPPBContactNameRecordCache *v8;
  PPPBContactNameRecordCache *v9;
  PPPBContactNameRecordCache *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  id v16;
  uint64_t v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v16 = 0;
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithContentsOfFile:options:error:", v5, 1, &v16);
  v7 = v16;
  if (v6)
  {
    v8 = -[PPPBContactNameRecordCache initWithData:]([PPPBContactNameRecordCache alloc], "initWithData:", v6);
    if (v8)
    {
      v9 = v8;
      v10 = v9;
    }
    else
    {
      pp_contacts_log_handle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v5;
        _os_log_impl(&dword_1C392E000, v14, OS_LOG_TYPE_DEFAULT, "PPPB: malformed contact name record cache file at %@", buf, 0xCu);
      }

      if (a4)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D70D10], 16, 0);
        v9 = 0;
        v10 = 0;
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = 0;
        v10 = 0;
      }
    }
    goto LABEL_18;
  }
  pp_contacts_log_handle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v20 = v5;
    v21 = 2112;
    v22 = v7;
    _os_log_impl(&dword_1C392E000, v11, OS_LOG_TYPE_DEFAULT, "PPPB: failed to read %@: error: %@", buf, 0x16u);
  }

  if (a4)
  {
    v12 = (void *)MEMORY[0x1E0CB35C8];
    v13 = *MEMORY[0x1E0D70D10];
    if (v7)
    {
      v17 = *MEMORY[0x1E0CB3388];
      v18 = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
      v9 = (PPPBContactNameRecordCache *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    objc_msgSend(v12, "errorWithDomain:code:userInfo:", v13, 15, v9);
    v10 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    if (v7)
LABEL_18:

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
}

@end
