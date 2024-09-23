@implementation BKLibraryImportMigratedBooksOperation

- (BKLibraryImportMigratedBooksOperation)initWithLibraryAssetProvider:(id)a3
{
  id v5;
  BKLibraryImportMigratedBooksOperation *v6;
  BKLibraryImportMigratedBooksOperation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BKLibraryImportMigratedBooksOperation;
  v6 = -[BKLibraryImportMigratedBooksOperation init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_libraryAssetProvider, a3);

  return v7;
}

- (void)main
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL bu_booksRepositoryURL](NSURL, "bu_booksRepositoryURL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("Migrated"), 1));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v4, 0, 0, 0));

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v10)
        objc_enumerationMutation(v7);
      v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11);
      if ((-[BKLibraryImportMigratedBooksOperation isCancelled](self, "isCancelled", (_QWORD)v14) & 1) != 0)
        break;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryImportMigratedBooksOperation libraryAssetProvider](self, "libraryAssetProvider"));
      objc_msgSend(v13, "importURL:openInPlace:options:completion:", v12, 0, 0, 0);

      if (v9 == (id)++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v9)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (BKLibraryAssetProvider)libraryAssetProvider
{
  return self->_libraryAssetProvider;
}

- (void)setLibraryAssetProvider:(id)a3
{
  objc_storeStrong((id *)&self->_libraryAssetProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryAssetProvider, 0);
}

@end
