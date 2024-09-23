@implementation PLPhotoLibraryFinder

- (PLPhotoLibraryFinder)initWithSearchCriteria:(id)a3
{
  id v5;
  PLPhotoLibraryFinder *v6;
  PLPhotoLibraryFinder *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLPhotoLibraryFinder;
  v6 = -[PLPhotoLibraryFinder init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_searchCriteria, a3);

  return v7;
}

- (BOOL)_isApplicationDomainContainerURL:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.photos")) ^ 1;

  return v4;
}

- (id)_rootURLForPhotoLibraryDomain:(int64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  -[PLPhotoLibraryFinder searchCriteria](self, "searchCriteria");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "internalTestOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5
    && (v6 = *MEMORY[0x1E0D74130],
        objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D74130]),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D73280], "rootURLForPhotoLibraryDomain:", a3);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

  return v9;
}

- (id)_containerRootURLsForDomain:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  int v21;
  id v22;
  void *v23;
  void *v25;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _QWORD v33[3];

  v33[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoLibraryFinder _rootURLForPhotoLibraryDomain:](self, "_rootURLForPhotoLibraryDomain:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a3 == 3)
  {
    -[PLPhotoLibraryFinder searchCriteria](self, "searchCriteria");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "containerIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v7, "URLByAppendingPathComponent:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v10);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D73208], "fileManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *MEMORY[0x1E0C999D0];
      v33[0] = *MEMORY[0x1E0C999D0];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v11;
      v26 = v7;
      objc_msgSend(v11, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v7, v13, 1, &__block_literal_global_52008);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v15 = v14;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v29 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
            v27 = 0;
            v21 = objc_msgSend(v20, "getResourceValue:forKey:error:", &v27, v12, 0);
            v22 = v27;
            v23 = v22;
            if (!v21 || objc_msgSend(v22, "BOOLValue"))
            {
              if (-[PLPhotoLibraryFinder _isApplicationDomainContainerURL:](self, "_isApplicationDomainContainerURL:", v20))
              {
                objc_msgSend(v5, "addObject:", v20);
              }
            }

          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        }
        while (v17);
      }

      v8 = 0;
      v7 = v26;
    }
    goto LABEL_18;
  }
  if (a3 == 2)
  {
    objc_msgSend(v6, "URLByAppendingPathComponent:", CFSTR("com.apple.photos"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v8);
LABEL_18:

  }
  return v5;
}

- (id)_findPhotoLibraryIdentifiersInDomain:(int64_t)a3 options:(unint64_t)a4 error:(id *)a5
{
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;
  _QWORD v30[3];

  v30[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPhotoLibraryFinder _containerRootURLsForDomain:](self, "_containerRootURLsForDomain:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLPhotoLibraryFinder searchCriteria](self, "searchCriteria");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "uuid");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v13 = v10;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v25 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend((id)objc_opt_class(), "_findPhotoLibraryIdentifiersInContainerRootURL:matchingUUID:options:error:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i), v12, a4, a5, (_QWORD)v24);
          v18 = objc_claimAutoreleasedReturnValue();
          if (!v18)
          {

            v9 = 0;
            goto LABEL_12;
          }
          v19 = (void *)v18;
          objc_msgSend(v9, "addObjectsFromArray:", v18);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v15)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v20 = (void *)MEMORY[0x1E0CB35C8];
    v21 = *MEMORY[0x1E0D74498];
    v29 = *MEMORY[0x1E0CB2938];
    v30[0] = CFSTR("Unsupported search criteria");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "errorWithDomain:code:userInfo:", v21, 46309, v13);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v22;
    if (a5)
    {
      v12 = objc_retainAutorelease(v22);
      v9 = 0;
      *a5 = v12;
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

- (id)findMatchingPhotoLibraryIdentifiersAndReturnError:(id *)a3
{
  return -[PLPhotoLibraryFinder findMatchingPhotoLibraryIdentifiersWithOptions:error:](self, "findMatchingPhotoLibraryIdentifiersWithOptions:error:", 0, a3);
}

- (id)findMatchingPhotoLibraryIdentifiersWithOptions:(unint64_t)a3 error:(id *)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  _QWORD *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _QWORD v30[3];

  v30[1] = *MEMORY[0x1E0C80C00];
  -[PLPhotoLibraryFinder searchCriteria](self, "searchCriteria");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "domain");

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = &unk_1E3763C38;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v13)
  {
    v14 = v13;
    v15 = 0;
    v16 = *(_QWORD *)v26;
    while (2)
    {
      v17 = 0;
      v18 = v15;
      do
      {
        if (*(_QWORD *)v26 != v16)
          objc_enumerationMutation(v12);
        v19 = objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v17), "integerValue");
        v24 = v18;
        -[PLPhotoLibraryFinder _findPhotoLibraryIdentifiersInDomain:options:error:](self, "_findPhotoLibraryIdentifiersInDomain:options:error:", v19, a3, &v24);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v24;

        if (!v20)
        {

          v21 = v15;
          goto LABEL_14;
        }
        objc_msgSend(v11, "addObjectsFromArray:", v20);

        ++v17;
        v18 = v15;
      }
      while (v14 != v17);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v14)
        continue;
      break;
    }
  }
  else
  {
    v15 = 0;
  }

  v21 = v15;
  if (!v11)
  {
LABEL_14:
    if (v23)
    {
      v21 = objc_retainAutorelease(v21);
      v11 = 0;
      *v23 = v21;
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (PLPhotoLibrarySearchCriteria)searchCriteria
{
  return self->_searchCriteria;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchCriteria, 0);
}

uint64_t __52__PLPhotoLibraryFinder__containerRootURLsForDomain___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  PLBackendGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x1E0D731F0], "descriptionWithFileURL:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v7;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "[_containerRootURLsForDomain:] Error enumerating library entry at path %@: %@", (uint8_t *)&v9, 0x16u);

  }
  return 1;
}

+ (id)_findPhotoLibraryIdentifiersInContainerRootURL:(id)a3 matchingUUID:(id)a4 options:(unint64_t)a5 error:(id *)a6
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  int v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  id v25;
  void *v26;
  int v27;
  NSObject *v28;
  void *v29;
  void *v31;
  void *v32;
  id v33;
  char v34;
  id v35;
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  id v45;
  _BYTE v46[128];
  _QWORD v47[3];

  v34 = a5;
  v47[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v35 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v33 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D73208], "fileManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *MEMORY[0x1E0C999D0];
  v47[0] = *MEMORY[0x1E0C999D0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v8;
  v32 = v7;
  objc_msgSend(v8, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v7, v10, 1, &__block_literal_global_5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v39 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        v37 = 0;
        v18 = objc_msgSend(v17, "getResourceValue:forKey:error:", &v37, v9, 0);
        v19 = v37;
        v20 = v19;
        if (!v18 || objc_msgSend(v19, "BOOLValue"))
        {
          objc_msgSend(v17, "pathExtension");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0D73280], "photosLibraryExtension");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v21, "isEqualToString:", v22);

          if (v23)
          {
            v36 = 0;
            +[PLPhotoLibraryIdentifier photoLibraryIdentifierWithPhotoLibraryURL:createIfMissing:error:](PLPhotoLibraryIdentifier, "photoLibraryIdentifierWithPhotoLibraryURL:createIfMissing:error:", v17, (v34 & 1) == 0, &v36);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = v36;
            if (v24)
            {
              if (!v35
                || (objc_msgSend(v24, "uuid"),
                    v26 = (void *)objc_claimAutoreleasedReturnValue(),
                    v27 = objc_msgSend(v35, "isEqualToString:", v26),
                    v26,
                    v27))
              {
                objc_msgSend(v33, "addObject:", v24);
              }
            }
            else
            {
              PLBackendGetLog();
              v28 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                objc_msgSend(MEMORY[0x1E0D731F0], "descriptionWithFileURL:", v17);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v43 = v29;
                v44 = 2112;
                v45 = v25;
                _os_log_impl(&dword_199541000, v28, OS_LOG_TYPE_ERROR, "Photo library identifier missing from library URL %@: %@", buf, 0x16u);

              }
            }

          }
        }

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    }
    while (v14);
  }

  return v33;
}

uint64_t __98__PLPhotoLibraryFinder__findPhotoLibraryIdentifiersInContainerRootURL_matchingUUID_options_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  PLBackendGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x1E0D731F0], "descriptionWithFileURL:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v7;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_199541000, v6, OS_LOG_TYPE_ERROR, "[findPhotoLibraryIdentifiersInDomain:] Error enumerating library entry at path %@: %@", (uint8_t *)&v9, 0x16u);

  }
  return 1;
}

@end
