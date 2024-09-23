@implementation PLCloudRecordOrganizer

- (PLCloudRecordOrganizer)initWithPhotoLibrary:(id)a3
{
  id v5;
  PLCloudRecordOrganizer *v6;
  PLCloudRecordOrganizer *v7;
  NSMutableArray *v8;
  NSMutableArray *assetRecordsWithContainerChange;
  NSMutableArray *v10;
  NSMutableArray *albumRecordsWithContainerChange;
  NSMutableArray *v12;
  NSMutableArray *personRecords;
  NSMutableArray *v14;
  NSMutableArray *scopeRecords;
  NSMutableArray *v16;
  NSMutableArray *masterRecords;
  NSMutableArray *v18;
  NSMutableArray *assetRecords;
  NSMutableArray *v20;
  NSMutableArray *albumRecords;
  NSMutableArray *v22;
  NSMutableArray *memoryRecords;
  NSMutableArray *v24;
  NSMutableArray *faceCropRecords;
  NSMutableArray *v26;
  NSMutableArray *deleteRecords;
  NSMutableArray *v28;
  NSMutableArray *deletePersonRecords;
  NSMutableArray *v30;
  NSMutableArray *expungedRecords;
  NSMutableArray *v32;
  NSMutableArray *suggestionRecords;
  NSMutableArray *v34;
  NSMutableArray *socialGroupRecords;
  PLCloudRecordOrganizer *v36;
  objc_super v38;

  v5 = a3;
  v38.receiver = self;
  v38.super_class = (Class)PLCloudRecordOrganizer;
  v6 = -[PLCloudRecordOrganizer init](&v38, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    assetRecordsWithContainerChange = v7->_assetRecordsWithContainerChange;
    v7->_assetRecordsWithContainerChange = v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    albumRecordsWithContainerChange = v7->_albumRecordsWithContainerChange;
    v7->_albumRecordsWithContainerChange = v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    personRecords = v7->_personRecords;
    v7->_personRecords = v12;

    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    scopeRecords = v7->_scopeRecords;
    v7->_scopeRecords = v14;

    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    masterRecords = v7->_masterRecords;
    v7->_masterRecords = v16;

    v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    assetRecords = v7->_assetRecords;
    v7->_assetRecords = v18;

    v20 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    albumRecords = v7->_albumRecords;
    v7->_albumRecords = v20;

    v22 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    memoryRecords = v7->_memoryRecords;
    v7->_memoryRecords = v22;

    v24 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    faceCropRecords = v7->_faceCropRecords;
    v7->_faceCropRecords = v24;

    v26 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    deleteRecords = v7->_deleteRecords;
    v7->_deleteRecords = v26;

    v28 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    deletePersonRecords = v7->_deletePersonRecords;
    v7->_deletePersonRecords = v28;

    v30 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    expungedRecords = v7->_expungedRecords;
    v7->_expungedRecords = v30;

    v32 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    suggestionRecords = v7->_suggestionRecords;
    v7->_suggestionRecords = v32;

    v34 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    socialGroupRecords = v7->_socialGroupRecords;
    v7->_socialGroupRecords = v34;

    v36 = v7;
  }

  return v7;
}

- (void)organizeRecords:(id)a3
{
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  NSMutableArray **p_deletePersonRecords;
  NSMutableArray **p_expungedRecords;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int16 v13;
  int v14;
  id *v15;
  char isKindOfClass;
  NSMutableArray *masterRecords;
  id v18;
  id v19;
  id v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  int v26;
  int v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  NSObject *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
  if (v5)
  {
    v7 = v5;
    p_deletePersonRecords = &self->_deletePersonRecords;
    p_expungedRecords = &self->_expungedRecords;
    v10 = *(_QWORD *)v31;
    *(_QWORD *)&v6 = 138412290;
    v29 = v6;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v31 != v10)
          objc_enumerationMutation(v4);
        v12 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v11);
        v13 = objc_msgSend(v12, "changeType", v29);
        if ((v13 & 0x400) == 0)
        {
          v14 = objc_msgSend(v12, "inExpunged");
          v15 = (id *)p_expungedRecords;
          if (v14)
          {
LABEL_11:
            objc_msgSend(*v15, "addObject:", v12);
            if ((objc_msgSend(v12, "inExpunged") & 1) != 0)
              goto LABEL_60;
            if ((v13 & 0x400) != 0)
              goto LABEL_17;
          }
          else if ((objc_msgSend(v12, "inExpunged") & 1) != 0)
          {
            goto LABEL_60;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            masterRecords = self->_masterRecords;
LABEL_15:
            -[NSMutableArray addObject:](masterRecords, "addObject:", v12);
            goto LABEL_60;
          }
          goto LABEL_17;
        }
        -[NSMutableArray addObject:](self->_deleteRecords, "addObject:", v12);
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        v15 = (id *)p_deletePersonRecords;
        if ((isKindOfClass & 1) != 0)
          goto LABEL_11;
        if ((objc_msgSend(v12, "inExpunged") & 1) != 0)
          goto LABEL_60;
LABEL_17:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v18 = v12;
          if (objc_msgSend(v18, "hasChangeType:", 16))
            -[NSMutableArray addObject:](self->_assetRecordsWithContainerChange, "addObject:", v18);
          if ((v13 & 0x400) == 0)
            -[NSMutableArray addObject:](self->_assetRecords, "addObject:", v18);

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v19 = v12;
            if (objc_msgSend(v19, "hasChangeType:", 2))
              -[NSMutableArray addObject:](self->_albumRecordsWithContainerChange, "addObject:", v19);
            if ((v13 & 0x400) == 0)
            {
              v20 = v19;
              if (!objc_msgSend(v20, "albumType")
                || objc_msgSend(v20, "albumType") == 3
                || objc_msgSend(v20, "albumType") == 7)
              {
                objc_msgSend(v20, "scopedIdentifier");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "identifier");
                v22 = objc_claimAutoreleasedReturnValue();

                if ((objc_msgSend(CFSTR("----Root-Folder----"), "isEqualToString:", v22) & 1) != 0
                  || (objc_msgSend(CFSTR("----Project-Root-Folder----"), "isEqualToString:", v22) & 1) != 0)
                {
                  if (objc_msgSend(CFSTR("----Root-Folder----"), "isEqualToString:", v22))
                  {
                    +[PLGenericAlbum rootFolderInLibrary:](PLManagedFolder, "rootFolderInLibrary:", self->_photoLibrary);
                    v23 = objc_claimAutoreleasedReturnValue();
                    goto LABEL_41;
                  }
                  if (objc_msgSend(CFSTR("----Project-Root-Folder----"), "isEqualToString:", v22))
                  {
                    +[PLGenericAlbum projectAlbumRootFolderInLibrary:](PLManagedFolder, "projectAlbumRootFolderInLibrary:", self->_photoLibrary);
                    v23 = objc_claimAutoreleasedReturnValue();
LABEL_41:
                    v24 = (void *)v23;
                  }
                  else
                  {
                    if (!*MEMORY[0x1E0D115D0])
                    {
                      __CPLAssetsdOSLogDomain();
                      v25 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138412546;
                        v35 = v20;
                        v36 = 2112;
                        v37 = v22;
                        _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_ERROR, "Received unexpected root folder type in CPLAlbumChange: %@, with identifier: %@", buf, 0x16u);
                      }

                    }
                    v24 = 0;
                  }
                  v26 = objc_msgSend(v24, "customSortAscending");
                  if (v26 != objc_msgSend(v20, "albumSortAscending"))
                    objc_msgSend(v24, "setCustomSortAscending:", objc_msgSend(v20, "albumSortAscending"));
                  v27 = objc_msgSend(v24, "customSortKey");
                  if (v27 != objc_msgSend(v20, "albumSortType"))
                    objc_msgSend(v24, "setCustomSortKey:", objc_msgSend(v20, "albumSortType"));
                  p_deletePersonRecords = &self->_deletePersonRecords;
                  if (objc_msgSend(v24, "cloudLocalState") != 1)
                    objc_msgSend(v24, "setCloudLocalState:", 1);

                }
                else
                {
                  -[NSMutableArray addObject:](self->_albumRecords, "addObject:", v20);
                }
LABEL_57:

              }
              else if (!*MEMORY[0x1E0D115D0])
              {
                __CPLAssetsdOSLogDomain();
                v22 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = v29;
                  v35 = v20;
                  _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_DEFAULT, "We are dropping record %@, not yet handling that type", buf, 0xCu);
                }
                goto LABEL_57;
              }

              p_expungedRecords = &self->_expungedRecords;
            }

            goto LABEL_60;
          }
          if ((v13 & 0x400) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              masterRecords = self->_personRecords;
              goto LABEL_15;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              masterRecords = self->_memoryRecords;
              goto LABEL_15;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              masterRecords = self->_suggestionRecords;
              goto LABEL_15;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              masterRecords = self->_socialGroupRecords;
              goto LABEL_15;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              masterRecords = self->_faceCropRecords;
              goto LABEL_15;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              masterRecords = self->_scopeRecords;
              goto LABEL_15;
            }
          }
        }
LABEL_60:
        ++v11;
      }
      while (v7 != v11);
      v28 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
      v7 = v28;
    }
    while (v28);
  }

}

- (NSMutableArray)assetRecordsWithContainerChange
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSMutableArray)albumRecordsWithContainerChange
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSMutableArray)personRecords
{
  return (NSMutableArray *)objc_getProperty(self, a2, 32, 1);
}

- (NSMutableArray)scopeRecords
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (NSMutableArray)masterRecords
{
  return (NSMutableArray *)objc_getProperty(self, a2, 48, 1);
}

- (NSMutableArray)assetRecords
{
  return (NSMutableArray *)objc_getProperty(self, a2, 56, 1);
}

- (NSMutableArray)albumRecords
{
  return (NSMutableArray *)objc_getProperty(self, a2, 64, 1);
}

- (NSMutableArray)memoryRecords
{
  return (NSMutableArray *)objc_getProperty(self, a2, 72, 1);
}

- (NSMutableArray)faceCropRecords
{
  return (NSMutableArray *)objc_getProperty(self, a2, 80, 1);
}

- (NSMutableArray)deleteRecords
{
  return (NSMutableArray *)objc_getProperty(self, a2, 88, 1);
}

- (NSMutableArray)deletePersonRecords
{
  return (NSMutableArray *)objc_getProperty(self, a2, 96, 1);
}

- (NSMutableArray)expungedRecords
{
  return (NSMutableArray *)objc_getProperty(self, a2, 104, 1);
}

- (NSMutableArray)suggestionRecords
{
  return (NSMutableArray *)objc_getProperty(self, a2, 112, 1);
}

- (NSMutableArray)socialGroupRecords
{
  return (NSMutableArray *)objc_getProperty(self, a2, 120, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_socialGroupRecords, 0);
  objc_storeStrong((id *)&self->_suggestionRecords, 0);
  objc_storeStrong((id *)&self->_expungedRecords, 0);
  objc_storeStrong((id *)&self->_deletePersonRecords, 0);
  objc_storeStrong((id *)&self->_deleteRecords, 0);
  objc_storeStrong((id *)&self->_faceCropRecords, 0);
  objc_storeStrong((id *)&self->_memoryRecords, 0);
  objc_storeStrong((id *)&self->_albumRecords, 0);
  objc_storeStrong((id *)&self->_assetRecords, 0);
  objc_storeStrong((id *)&self->_masterRecords, 0);
  objc_storeStrong((id *)&self->_scopeRecords, 0);
  objc_storeStrong((id *)&self->_personRecords, 0);
  objc_storeStrong((id *)&self->_albumRecordsWithContainerChange, 0);
  objc_storeStrong((id *)&self->_assetRecordsWithContainerChange, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

+ (BOOL)records:(id)a3 containsScopedIdentifier:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "scopedIdentifier", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqual:", v6);

        if ((v12 & 1) != 0)
        {
          LOBYTE(v8) = 1;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

  return v8;
}

@end
