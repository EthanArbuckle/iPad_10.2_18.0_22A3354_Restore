@implementation AEAnnotationSidecarConsumer

+ (id)annotationUuidsFromDictionaryRepresentations:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  void *v11;
  const __CFString *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v3, "count")));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = (__CFString *)objc_claimAutoreleasedReturnValue(+[AEAnnotation annotationUuidFromDictionaryRepresentation:](AEAnnotation, "annotationUuidFromDictionaryRepresentation:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v9), (_QWORD)v14));
        if (-[__CFString length](v10, "length"))
        {
          v11 = v4;
          v12 = v10;
        }
        else
        {
          v11 = v4;
          v12 = &stru_296430;
        }
        objc_msgSend(v11, "addObject:", v12);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)modificationDatesFromDictionaryRepresentations:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v3, "count")));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotation lastModificationFromDictionaryRepresentation:](AEAnnotation, "lastModificationFromDictionaryRepresentation:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), (_QWORD)v13));
        if (v10)
        {
          objc_msgSend(v4, "addObject:", v10);
        }
        else
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 0));
          objc_msgSend(v4, "addObject:", v11);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)mergeIntoAnnotationProvider:(id)a3 completionBlock:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  NSNumber *generation;
  NSArray *bookmarks;
  NSMutableSet *acknowledgedMismatchingAssetIDs;
  NSArray *v11;
  void **v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  AEAnnotationSidecarConsumer *v16;
  id v17;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  generation = self->super._generation;
  self->super._generation = 0;

  bookmarks = self->_bookmarks;
  self->_bookmarks = 0;

  acknowledgedMismatchingAssetIDs = self->_acknowledgedMismatchingAssetIDs;
  self->_acknowledgedMismatchingAssetIDs = 0;

  if (v6)
  {
    -[AEAnnotationSidecarConsumer read](self, "read");
    v12 = _NSConcreteStackBlock;
    v13 = 3221225472;
    v14 = sub_CA090;
    v15 = &unk_2909D0;
    v16 = self;
    v17 = v6;
    objc_msgSend(v17, "performBlockOnUserSideQueueAndWait:", &v12);
    -[AEAnnotationSidecarConsumer cacheTimestamp](self, "cacheTimestamp", v12, v13, v14, v15, v16);

  }
  v11 = self->_bookmarks;
  self->_bookmarks = 0;

  if (v7)
    v7[2](v7);

}

+ (id)doesNotExistTimestamp
{
  return CFSTR("DidNotExist");
}

- (id)timestampCacheKey
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSString lastPathComponent](self->super._filePath, "lastPathComponent"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringByAppendingString:", CFSTR("-Timestamp")));

  return v3;
}

- (id)fileTimestamp
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = objc_alloc_init((Class)NSFileManager);
  if (objc_msgSend(v3, "fileExistsAtPath:", self->super._filePath))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "attributesOfItemAtPath:error:", self->super._filePath, 0));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", NSFileModificationDate));
    if (v5)
    {
      v6 = objc_alloc_init((Class)NSDateFormatter);
      objc_msgSend(v6, "setDateFormat:", CFSTR("HH:mm:ss;yyyy-MM-dd"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringFromDate:", v5));

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotationSidecarConsumer doesNotExistTimestamp](AEAnnotationSidecarConsumer, "doesNotExistTimestamp"));
  }
  objc_storeStrong((id *)&self->_timestamp, v7);

  return v7;
}

- (void)cacheTimestamp
{
  NSString *v3;
  void *v4;
  void *v5;
  NSString *timestamp;
  id v7;

  if (-[NSString length](self->_timestamp, "length")
    && (v3 = self->_timestamp,
        v4 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotationSidecarConsumer doesNotExistTimestamp](AEAnnotationSidecarConsumer, "doesNotExistTimestamp")), LOBYTE(v3) = -[NSString isEqualToString:](v3, "isEqualToString:", v4), v4, (v3 & 1) == 0))
  {
    self->super._userDefaultsChanged = 1;
    v7 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    timestamp = self->_timestamp;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationSidecarConsumer timestampCacheKey](self, "timestampCacheKey"));
    objc_msgSend(v7, "setObject:forKey:", timestamp, v5);
  }
  else
  {
    self->super._userDefaultsChanged = 1;
    v7 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationSidecarConsumer timestampCacheKey](self, "timestampCacheKey"));
    objc_msgSend(v7, "removeObjectForKey:", v5);
  }

}

- (void)read
{
  NSNumber *generation;
  NSArray *bookmarks;
  NSString *v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  NSNumber *v12;
  NSNumber *v13;
  id v14;
  void *v15;
  char *v16;
  NSArray *v17;
  NSArray *v18;
  void *v19;
  NSArray *v20;
  NSArray *v21;
  id v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  int v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;

  generation = self->super._generation;
  self->super._generation = 0;

  bookmarks = self->_bookmarks;
  self->_bookmarks = 0;

  v5 = self->_timestamp;
  if (!v5)
    v5 = (NSString *)objc_claimAutoreleasedReturnValue(-[AEAnnotationSidecarConsumer fileTimestamp](self, "fileTimestamp"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotationSidecarConsumer doesNotExistTimestamp](AEAnnotationSidecarConsumer, "doesNotExistTimestamp"));
  v7 = -[NSString isEqualToString:](v5, "isEqualToString:", v6);

  if ((v7 & 1) == 0)
  {
    v8 = objc_msgSend(objc_alloc((Class)NSDictionary), "initWithContentsOfFile:", self->super._filePath);
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotationSidecarProducer defaultBookmarkContainerKey](AEAnnotationSidecarProducer, "defaultBookmarkContainerKey"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v9));

      if (v10)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotationSidecarProducer defaultBookmarkGenerationKey](AEAnnotationSidecarProducer, "defaultBookmarkGenerationKey"));
        v12 = (NSNumber *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v11));
        v13 = self->super._generation;
        self->super._generation = v12;

        v14 = objc_msgSend((id)objc_opt_class(self), "defaultWrapperRevisionKey");
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
        v16 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v15));

        if (v16)
        {
          if (objc_msgSend(CFSTR("5"), "compare:options:", v16, 64) == (id)-1)
          {
            v22 = BCIMLog();
            v23 = objc_claimAutoreleasedReturnValue(v22);
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              v26 = 136315650;
              v27 = "-[AEAnnotationSidecarConsumer read]";
              v28 = 2080;
              v29 = "/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/AssetsEngine/AECore/AEAnnot"
                    "ationSidecarConsumer.m";
              v30 = 1024;
              v31 = 310;
              _os_log_impl(&dword_0, v23, OS_LOG_TYPE_INFO, "%s %s:%d", (uint8_t *)&v26, 0x1Cu);
            }

            v24 = BCIMLog();
            v25 = objc_claimAutoreleasedReturnValue(v24);
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              v26 = 138412546;
              v27 = v16;
              v28 = 2112;
              v29 = CFSTR("5");
              _os_log_impl(&dword_0, v25, OS_LOG_TYPE_INFO, "@\"Can't consume sidecar. Wrapper-Revision too high. Wrapper-Revision {%@} Annotation-Current {%@}\", (uint8_t *)&v26, 0x16u);
            }

          }
          else
          {
            v17 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v16));
            v18 = self->_bookmarks;
            self->_bookmarks = v17;

          }
        }
        else
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotationSidecarProducer legacyBookmarkKey](AEAnnotationSidecarProducer, "legacyBookmarkKey"));
          v20 = (NSArray *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", v19));
          v21 = self->_bookmarks;
          self->_bookmarks = v20;

        }
      }

    }
  }

}

- (BOOL)acknowledgeMergingAnnotationsWithAssetVersionMismatch:(id)a3 assetID:(id)a4 provider:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSMutableSet *v12;
  NSMutableSet *acknowledgedMismatchingAssetIDs;
  void *v14;
  BOOL v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (self->_acknowledgedMismatchingAssetIDs)
  {
    if (v8)
    {
LABEL_3:
      v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingFormat:", CFSTR(":%@"), v8));
      goto LABEL_6;
    }
  }
  else
  {
    v12 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    acknowledgedMismatchingAssetIDs = self->_acknowledgedMismatchingAssetIDs;
    self->_acknowledgedMismatchingAssetIDs = v12;

    if (v8)
      goto LABEL_3;
  }
  v11 = v9;
LABEL_6:
  v14 = v11;
  if ((-[NSMutableSet containsObject:](self->_acknowledgedMismatchingAssetIDs, "containsObject:", v11) & 1) == 0)
  {
    if (!objc_msgSend(v10, "acknowledgeMergingAnnotationsWithAssetVersionMismatch:assetID:", v8, v9))
    {
      v15 = 0;
      goto LABEL_11;
    }
    -[NSMutableSet addObject:](self->_acknowledgedMismatchingAssetIDs, "addObject:", v14);
  }
  v15 = 1;
LABEL_11:

  return v15;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acknowledgedMismatchingAssetIDs, 0);
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_bookmarks, 0);
}

@end
