@implementation QLDiskCacheFileInfoEnumerator

- (QLDiskCacheFileInfoEnumerator)initWithDiskCache:(id)a3 forUbiquitousFiles:(BOOL)a4 extraInfo:(BOOL)a5
{
  QLDiskCacheFileInfoEnumerator *result;

  result = -[QLDiskCacheEnumerator initWithDiskCache:](self, "initWithDiskCache:", a3);
  if (result)
  {
    result->_ubiquitous = a4;
    result->_extraInfo = a5;
  }
  return result;
}

- (id)nextFileInfo
{
  QLCacheIndexDatabaseFileInfoEnumerator *indexEnumerator;
  void *v4;
  QLCacheIndexDatabaseFileInfoEnumerator *v5;
  QLCacheIndexDatabaseFileInfoEnumerator *v6;
  _BOOL4 v7;
  id v8;
  QLCacheFileInfo *v9;
  QLCacheFileInfo *v10;
  double v11;
  double v12;
  id v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;

  v17 = 0;
  v16 = 0;
  v15 = 0;
  indexEnumerator = self->_indexEnumerator;
  if (!indexEnumerator)
  {
    -[QLDiskCache indexDatabase](self->super._diskCache, "indexDatabase");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "enumeratorForAllUbiquitousFiles:withExtraInfo:", self->_ubiquitous, self->_extraInfo);
    v5 = (QLCacheIndexDatabaseFileInfoEnumerator *)objc_claimAutoreleasedReturnValue();
    v6 = self->_indexEnumerator;
    self->_indexEnumerator = v5;

    indexEnumerator = self->_indexEnumerator;
  }
  v18 = 0;
  v14 = 0;
  v7 = -[QLCacheIndexDatabaseFileInfoEnumerator nextFileWithCacheId:versionedFileIdentifier:thumbnailCount:minSize:maxSize:totalDataLength:](indexEnumerator, "nextFileWithCacheId:versionedFileIdentifier:thumbnailCount:minSize:maxSize:totalDataLength:", &v18, &v14, (char *)&v17 + 4, &v17, &v16, &v15);
  v8 = v14;
  v9 = 0;
  if (v7)
  {
    v10 = [QLCacheFileInfo alloc];
    LODWORD(v12) = v16;
    LODWORD(v11) = v17;
    v9 = -[QLCacheFileInfo initWithCacheId:versionedFileIdentifier:thumbnailCount:minSize:maxSize:totalDataLength:](v10, "initWithCacheId:versionedFileIdentifier:thumbnailCount:minSize:maxSize:totalDataLength:", v18, v8, HIDWORD(v17), v15, v11, v12);
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexEnumerator, 0);
}

@end
