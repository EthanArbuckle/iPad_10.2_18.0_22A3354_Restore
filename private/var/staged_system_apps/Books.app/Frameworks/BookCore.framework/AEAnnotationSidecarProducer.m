@implementation AEAnnotationSidecarProducer

- (AEAnnotationSidecarProducer)initWithName:(id)a3
{
  id v4;
  AEAnnotationSidecarProducer *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSString *filePath;

  v4 = a3;
  v5 = -[AEAnnotationSidecarProducer init](self, "init");
  if (v5 && objc_msgSend(v4, "length"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL bu_booksRepositoryURL](NSURL, "bu_booksRepositoryURL"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "URLByAppendingPathComponent:", v4));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "path"));
    filePath = v5->_filePath;
    v5->_filePath = (NSString *)v8;

  }
  return v5;
}

- (void)dealloc
{
  NSString *filePath;
  NSNumber *generation;
  void *v5;
  objc_super v6;

  filePath = self->_filePath;
  self->_filePath = 0;

  generation = self->_generation;
  self->_generation = 0;

  if (self->_userDefaultsChanged)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v5, "synchronize");

  }
  v6.receiver = self;
  v6.super_class = (Class)AEAnnotationSidecarProducer;
  -[AEAnnotationSidecarProducer dealloc](&v6, "dealloc");
}

+ (id)legacyBookmarkKey
{
  return CFSTR("Bookmarks");
}

+ (id)defaultBookmarkGenerationKey
{
  return CFSTR("Generation");
}

+ (id)defaultWrapperRevisionKey
{
  return CFSTR("Wrapper-Revision");
}

+ (id)defaultBookmarkContainerKey
{
  return CFSTR("Bookmark-Container-12202011");
}

- (id)generationCacheKey
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSString lastPathComponent](self->_filePath, "lastPathComponent"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringByAppendingString:", CFSTR("-Generation")));

  return v3;
}

- (id)cachedGeneration
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationSidecarProducer generationCacheKey](self, "generationCacheKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", v2));

  return v4;
}

- (void)cacheGeneration
{
  int v3;
  NSNumber *generation;
  void *v5;
  id v6;

  v3 = -[NSNumber intValue](self->_generation, "intValue");
  self->_userDefaultsChanged = 1;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  if (v3 < 1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationSidecarProducer generationCacheKey](self, "generationCacheKey"));
    objc_msgSend(v6, "removeObjectForKey:", v5);
  }
  else
  {
    generation = self->_generation;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationSidecarProducer generationCacheKey](self, "generationCacheKey"));
    objc_msgSend(v6, "setObject:forKey:", generation, v5);
  }

}

- (void)rewriteWithAnnotationProvider:(id)a3 completionBlock:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  NSNumber *generation;
  NSUInteger v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v13[5];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  generation = self->_generation;
  self->_generation = 0;

  v9 = -[NSString length](self->_filePath, "length");
  if (v6 && v9)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = sub_10A674;
    v19 = sub_10A684;
    v20 = 0;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10A68C;
    v14[3] = &unk_2914C0;
    v14[4] = &v15;
    objc_msgSend(v6, "performBlockOnUserSideQueueAndWait:", v14);
    if (v16[5])
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationSidecarProducer cachedGeneration](self, "cachedGeneration"));
      v11 = objc_msgSend(v10, "unsignedLongLongValue");
      if (v11 >= objc_msgSend((id)v16[5], "unsignedLongLongValue"))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        objc_msgSend(v12, "fileExistsAtPath:", self->_filePath);

      }
      objc_storeStrong((id *)&self->_generation, (id)v16[5]);
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10A7DC;
      v13[3] = &unk_2914E8;
      v13[4] = self;
      objc_msgSend(v6, "performBlockOnUserSideQueueAndWait:", v13);
      -[AEAnnotationSidecarProducer cacheGeneration](self, "cacheGeneration");

    }
    _Block_object_dispose(&v15, 8);

  }
  if (v7)
    v7[2](v7);

}

- (id)newBookmarkDictionarysArray:(id)a3 modern:(BOOL)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = objc_autoreleasePoolPush();
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotation userAnnotationTypeValues](AEAnnotation, "userAnnotationTypeValues"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("annotationType"), v6));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotation modernDictionaryRepresentationForAnnotationsMatchingPredicate:inManagedObjectContext:](AEAnnotation, "modernDictionaryRepresentationForAnnotationsMatchingPredicate:inManagedObjectContext:", v7, v4));
  objc_autoreleasePoolPop(v5);

  return v8;
}

- (id)maxAnnotationVersionInMOC:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  id v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithValue:](NSPredicate, "predicateWithValue:", 1));
  v16 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotation maxAnnotationVersionForAssetsWithPredicate:inManagedObjectContext:](AEAnnotation, "maxAnnotationVersionForAssetsWithPredicate:inManagedObjectContext:", v4, v3));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allValues"));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v6);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i), "valueForKey:", CFSTR("futureProofing2")));
        v13 = v12;
        if (v12)
        {
          if (v9)
          {
            if (objc_msgSend(v9, "compare:options:", v12, 64))
            {
              v14 = v13;

              v9 = v14;
            }
          }
          else
          {
            v9 = v12;
          }
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)appendData:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithContentsOfFile:", self->_filePath);
  if (!v5)
    v5 = objc_alloc_init((Class)NSMutableDictionary);
  v9 = v5;
  v6 = objc_msgSend((id)objc_opt_class(self), "defaultBookmarkContainerKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v9, "setObject:forKey:", v4, v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v9, 100, 0, 0));
  objc_msgSend(v8, "writeToFile:atomically:", self->_filePath, 1);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generation, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
}

@end
