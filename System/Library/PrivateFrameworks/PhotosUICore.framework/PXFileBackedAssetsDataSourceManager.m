@implementation PXFileBackedAssetsDataSourceManager

- (PXFileBackedAssetsDataSourceManager)initWithFileURLsBySection:(id)a3
{
  id v4;
  PXFileBackedAssetsDataSourceManager *v5;
  uint64_t v6;
  NSMutableDictionary *fileURLsBySection;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXFileBackedAssetsDataSourceManager;
  v5 = -[PXSectionedDataSourceManager init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "mutableCopy");
    fileURLsBySection = v5->_fileURLsBySection;
    v5->_fileURLsBySection = (NSMutableDictionary *)v6;

    -[PXFileBackedAssetsDataSourceManager _createDataSource](v5, "_createDataSource");
  }

  return v5;
}

- (void)_createDataSource
{
  PXFileBackedAssetsDataSource *v3;
  void *v4;
  PXFileBackedAssetsDataSource *v5;

  v3 = [PXFileBackedAssetsDataSource alloc];
  v4 = (void *)-[NSMutableDictionary copy](self->_fileURLsBySection, "copy");
  v5 = -[PXFileBackedAssetsDataSource initWithFileURLsBySection:](v3, "initWithFileURLsBySection:", v4);

  -[PXSectionedDataSourceManager setDataSource:changeDetails:](self, "setDataSource:changeDetails:", v5, 0);
}

- (void)removeFileURLsAtIndexes:(id)a3 inSection:(int64_t)a4
{
  id v6;
  NSMutableDictionary *fileURLsBySection;
  void *v8;
  void *v9;
  void *v10;
  NSMutableDictionary *v11;
  void *v12;
  void *v13;
  PXFileBackedAssetsDataSource *v14;
  void *v15;
  PXFileBackedAssetsDataSource *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  fileURLsBySection = self->_fileURLsBySection;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](fileURLsBySection, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  objc_msgSend(v10, "removeObjectsAtIndexes:", v6);
  v11 = self->_fileURLsBySection;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", v10, v12);

  -[PXSectionedDataSourceManager dataSource](self, "dataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = [PXFileBackedAssetsDataSource alloc];
  v15 = (void *)-[NSMutableDictionary copy](self->_fileURLsBySection, "copy");
  v16 = -[PXFileBackedAssetsDataSource initWithFileURLsBySection:](v14, "initWithFileURLsBySection:", v15);

  if (v13)
  {
    v24 = objc_alloc((Class)off_1E50B4A18);
    v23 = objc_msgSend(v13, "identifier");
    v17 = -[PXFileBackedAssetsDataSource identifier](v16, "identifier");
    objc_msgSend(off_1E50B1608, "changeDetailsWithNoChanges");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v19;
    v20 = (void *)objc_msgSend(objc_alloc((Class)off_1E50B1608), "initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:", v6, 0, 0, 0, 0);
    v26[0] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(v24, "initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:", v23, v17, v18, v21, 0);

  }
  else
  {
    v22 = 0;
  }
  -[PXSectionedDataSourceManager setDataSource:changeDetails:](self, "setDataSource:changeDetails:", v16, v22);

}

- (void)insertFileURL:(id)a3 atIndex:(int64_t)a4 inSection:(int64_t)a5
{
  NSMutableDictionary *fileURLsBySection;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSMutableDictionary *v14;
  void *v15;
  void *v16;
  PXFileBackedAssetsDataSource *v17;
  void *v18;
  PXFileBackedAssetsDataSource *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  fileURLsBySection = self->_fileURLsBySection;
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = a3;
  objc_msgSend(v9, "numberWithInteger:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](fileURLsBySection, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  objc_msgSend(v13, "insertObject:atIndex:", v10, a4);
  v14 = self->_fileURLsBySection;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v13, v15);

  -[PXSectionedDataSourceManager dataSource](self, "dataSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = [PXFileBackedAssetsDataSource alloc];
  v18 = (void *)-[NSMutableDictionary copy](self->_fileURLsBySection, "copy");
  v19 = -[PXFileBackedAssetsDataSource initWithFileURLsBySection:](v17, "initWithFileURLsBySection:", v18);

  if (v16)
  {
    v29 = objc_alloc((Class)off_1E50B4A18);
    v28 = objc_msgSend(v16, "identifier");
    v27 = -[PXFileBackedAssetsDataSource identifier](v19, "identifier");
    objc_msgSend(off_1E50B1608, "changeDetailsWithNoChanges");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a5);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v21;
    v22 = objc_alloc((Class)off_1E50B1608);
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", a4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v22, "initWithIncrementalChangeDetailsRemovedIndexes:insertedIndexes:movesToIndexes:movesFromIndexes:changedIndexes:", 0, v23, 0, 0, 0);
    v31[0] = v24;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v29, "initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:", v28, v27, v20, v25, 0);

  }
  else
  {
    v26 = 0;
  }
  -[PXSectionedDataSourceManager setDataSource:changeDetails:](self, "setDataSource:changeDetails:", v19, v26);

}

- (NSDictionary)fileURLsBySection
{
  return &self->_fileURLsBySection->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURLsBySection, 0);
}

+ (id)emptyFileBackedDataSourceManager
{
  PXFileBackedAssetsDataSourceManager *v2;

  v2 = [PXFileBackedAssetsDataSourceManager alloc];
  return -[PXFileBackedAssetsDataSourceManager initWithFileURLsBySection:](v2, "initWithFileURLsBySection:", MEMORY[0x1E0C9AA70]);
}

+ (id)fileBackedDataSourceManagerWithDirectory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  int v8;
  BOOL v9;
  NSObject *v10;
  PXFileBackedAssetsDataSourceManager *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  int v27;
  void *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  id v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  id v42;
  unsigned __int8 v43;
  void *v44;
  void *v45;
  uint8_t v46[128];
  uint8_t buf[4];
  id v48;
  __int16 v49;
  void *v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0;
  objc_msgSend(v4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v6, &v43);
  v8 = v43;

  if (v7)
    v9 = v8 == 0;
  else
    v9 = 1;
  if (v9)
  {
    PLUIGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v48 = v4;
      _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_ERROR, "[PXFileBackedAssetsDataSourceManager]: %@ does not exist or is not a directory", buf, 0xCu);
    }

    objc_msgSend(a1, "emptyFileBackedDataSourceManager");
    v11 = (PXFileBackedAssetsDataSourceManager *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v42 = 0;
    objc_msgSend(v5, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v4, 0, 0, &v42);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v42;
    v14 = v13;
    if (v12)
    {
      v33 = a1;
      v34 = v13;
      v35 = v5;
      v36 = v4;
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v15 = v12;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v39;
        v19 = *MEMORY[0x1E0CEC520];
        v20 = *MEMORY[0x1E0CEC568];
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v39 != v18)
              objc_enumerationMutation(v15);
            v22 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
            v23 = (void *)MEMORY[0x1E0D752F0];
            objc_msgSend(v22, "pathExtension");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "typeWithFilenameExtension:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            if (v25)
            {
              v26 = objc_msgSend(v25, "conformsToType:", v19);
              v27 = objc_msgSend(v25, "conformsToType:", v20);
              if ((v26 & 1) != 0 || v27)
                objc_msgSend(v37, "addObject:", v22);
            }

          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
        }
        while (v17);
      }

      if (objc_msgSend(v37, "count"))
      {
        v44 = &unk_1E53ED830;
        v28 = (void *)objc_msgSend(v37, "copy");
        v45 = v28;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        v11 = -[PXFileBackedAssetsDataSourceManager initWithFileURLsBySection:]([PXFileBackedAssetsDataSourceManager alloc], "initWithFileURLsBySection:", v29);
        v4 = v36;
      }
      else
      {
        PLUIGetLog();
        v31 = objc_claimAutoreleasedReturnValue();
        v4 = v36;
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v48 = v36;
          _os_log_impl(&dword_1A6789000, v31, OS_LOG_TYPE_ERROR, "[PXFileBackedAssetsDataSourceManager]: There are no recognized media files at %@", buf, 0xCu);
        }

        objc_msgSend(v33, "emptyFileBackedDataSourceManager");
        v11 = (PXFileBackedAssetsDataSourceManager *)objc_claimAutoreleasedReturnValue();
      }
      v5 = v35;
      v14 = v34;

    }
    else
    {
      PLUIGetLog();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v48 = v4;
        v49 = 2112;
        v50 = v14;
        _os_log_impl(&dword_1A6789000, v30, OS_LOG_TYPE_ERROR, "[PXFileBackedAssetsDataSourceManager]: Failed to get contents of directory %@: %@", buf, 0x16u);
      }

      objc_msgSend(a1, "emptyFileBackedDataSourceManager");
      v11 = (PXFileBackedAssetsDataSourceManager *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v11;
}

@end
