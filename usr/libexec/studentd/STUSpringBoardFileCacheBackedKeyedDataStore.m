@implementation STUSpringBoardFileCacheBackedKeyedDataStore

- (STUSpringBoardFileCacheBackedKeyedDataStore)initWithDirectoryURL:(id)a3 maximumTotalFileSize:(unint64_t)a4 maximumTotalFileCount:(unint64_t)a5
{
  id v9;
  STUSpringBoardFileCacheBackedKeyedDataStore *v10;
  STUSpringBoardFileCacheBackedKeyedDataStore *v11;
  SBFFileCacheFileStore *v12;
  SBFFileCacheFileStore *fileStore;
  SBFFileCache *v14;
  SBFFileCache *fileCache;
  objc_super v17;

  v9 = a3;
  v17.receiver = self;
  v17.super_class = (Class)STUSpringBoardFileCacheBackedKeyedDataStore;
  v10 = -[STUSpringBoardFileCacheBackedKeyedDataStore init](&v17, "init");
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_directoryURL, a3);
    v12 = (SBFFileCacheFileStore *)objc_msgSend(objc_alloc((Class)SBFFileCacheFileStore), "initWithDirectoryURL:", v9);
    fileStore = v11->_fileStore;
    v11->_fileStore = v12;

    v14 = (SBFFileCache *)objc_msgSend(objc_alloc((Class)SBFFileCache), "initWithStore:faultHandler:", v11->_fileStore, v11);
    fileCache = v11->_fileCache;
    v11->_fileCache = v14;

    -[SBFFileCache setMaxTotalFileSize:](v11->_fileCache, "setMaxTotalFileSize:", a4);
    -[SBFFileCache setMaxTotalFileCount:](v11->_fileCache, "setMaxTotalFileCount:", a5);
  }

  return v11;
}

- (void)createDirectoryIfNeeded
{
  void *v2;
  void *v3;
  void *v4;
  unsigned __int8 v5;
  id v6;
  void *v7;
  id v8;
  NSFileAttributeKey v9;
  _UNKNOWN **v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[STUSpringBoardFileCacheBackedKeyedDataStore directoryURL](self, "directoryURL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v9 = NSFilePosixPermissions;
  v10 = &off_1000D4110;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
  v8 = 0;
  v5 = objc_msgSend(v3, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v2, 1, v4, &v8);
  v6 = v8;

  if ((v5 & 1) == 0)
  {
    if (qword_1000FC128 != -1)
      dispatch_once(&qword_1000FC128, &stru_1000C9DE0);
    v7 = (void *)qword_1000FC120;
    if (os_log_type_enabled((os_log_t)qword_1000FC120, OS_LOG_TYPE_ERROR))
      sub_10007AD28(v7, v6);
  }

}

- (BOOL)setData:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  BOOL v13;

  v8 = a3;
  v9 = a4;
  if (v8)
  {
    -[STUSpringBoardFileCacheBackedKeyedDataStore createDirectoryIfNeeded](self, "createDirectoryIfNeeded");
    v10 = objc_msgSend(objc_alloc((Class)NSFileWrapper), "initRegularFileWithContents:", v8);
    objc_msgSend(v10, "setFilename:", v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[STUSpringBoardFileCacheBackedKeyedDataStore fileStore](self, "fileStore"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[STUSpringBoardFileCacheBackedKeyedDataStore fileCache](self, "fileCache"));
    objc_msgSend(v11, "fileCache:storeFileWrapper:", v12, v10);

    v13 = 1;
    v9 = v10;
  }
  else
  {
    v13 = -[STUSpringBoardFileCacheBackedKeyedDataStore removeDataForKey:error:](self, "removeDataForKey:error:", v9, a5);
  }

  return v13;
}

- (id)dataForKey:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[STUSpringBoardFileCacheBackedKeyedDataStore fileStore](self, "fileStore"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[STUSpringBoardFileCacheBackedKeyedDataStore fileCache](self, "fileCache"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fileCache:loadFileWrapperNamed:", v7, v5));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "regularFileContents"));
  return v9;
}

- (BOOL)removeDataForKey:(id)a3 error:(id *)a4
{
  void *v6;
  NSString *v7;
  void *v8;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3, a4));
  v7 = NSStringFromSelector(a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUSpringBoardFileCacheBackedKeyedDataStore.m"), 79, CFSTR("Unimplemented method: %@"), v8);

  return 0;
}

- (BOOL)removeAllDataWithError:(id *)a3
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUSpringBoardFileCacheBackedKeyedDataStore fileCache](self, "fileCache", a3));
  objc_msgSend(v3, "removeAllFiles");

  return 1;
}

- (void)fileCache:(id)a3 loadFileForIdentifier:(id)a4 completionHandler:(id)a5
{
  (*((void (**)(id, _QWORD, _QWORD))a5 + 2))(a5, 0, 0);
}

- (NSURL)directoryURL
{
  return self->_directoryURL;
}

- (SBFFileCacheFileStore)fileStore
{
  return self->_fileStore;
}

- (SBFFileCache)fileCache
{
  return self->_fileCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileCache, 0);
  objc_storeStrong((id *)&self->_fileStore, 0);
  objc_storeStrong((id *)&self->_directoryURL, 0);
}

@end
