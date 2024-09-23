@implementation BKLibraryOperationObserver

- (void)setup
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "libraryOperationCompleteNotificationReceived:", BKLibraryOperationCompleteNotification, 0);

}

- (BKLibraryOperationObserver)init
{
  BKLibraryOperationObserver *v2;
  BKLibraryOperationObserver *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKLibraryOperationObserver;
  v2 = -[BKLibraryOperationObserver init](&v5, "init");
  v3 = v2;
  if (v2)
    -[BKLibraryOperationObserver setup](v2, "setup");
  return v3;
}

- (void)libraryOperationCompleteNotificationReceived:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  BOOL v11;
  id v12;

  v12 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "userInfo"));

  v5 = v12;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "userInfo"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", BKLibraryOperationTypeKey));
    v8 = objc_msgSend(v7, "unsignedIntegerValue");

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "userInfo"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", BKLibraryOperationAssetIDsKey));

    if (objc_msgSend(v10, "count"))
      v11 = v8 == 0;
    else
      v11 = 0;
    if (v11)
      -[BKLibraryOperationObserver invalidateBookIndices:](self, "invalidateBookIndices:", v10);

    v5 = v12;
  }

}

- (void)invalidateBookIndices:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        v7 = *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i);
        +[AEPictureBookRenderingCache purgeCacheForIdentifier:](AEPictureBookRenderingCache, "purgeCacheForIdentifier:", v7, (_QWORD)v8);
        +[AEPdfRenderingCache purgeCacheForIdentifier:](AEPdfRenderingCache, "purgeCacheForIdentifier:", v7);
        +[BEPageSnapshotCache purgeCacheForIdentifier:](BEPageSnapshotCache, "purgeCacheForIdentifier:", v7);
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  +[BKTextIndex invalidateBookIndicesWithNames:](BKTextIndex, "invalidateBookIndicesWithNames:", v3);
}

@end
