@implementation BICCoreDataPersistentStoring

+ (id)_imageSetFetchRequest
{
  return +[BICImageSet fetchRequest](BICImageSet, "fetchRequest");
}

+ (id)_imageEntryFetchRequest
{
  return +[BICImageEntry fetchRequest](BICImageEntry, "fetchRequest");
}

+ (id)_predicateForToBeDeletedImageEntriesInLevelID:(signed __int16)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithShort:](NSNumber, "numberWithShort:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("state = %@ AND level = %@"), &off_2A9608, v3));

  return v4;
}

+ (id)_predicateForImageSetWithID:(id)a3
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("identifier = %@"), a3);
}

+ (id)_predicateForImageSetsWithIDs:(id)a3
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("identifier in %@"), a3);
}

+ (id)_predicateForImageEntriesMatchingAddedEntries:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "valueForKey:", CFSTR("entryLocation")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("entryLocation IN %@"), v3));

  return v4;
}

- (BICCoreDataPersistentStoring)initWithURL:(id)a3
{
  id v5;
  BICCoreDataPersistentStoring *v6;
  BICCoreDataPersistentStoring *v7;
  id v8;
  id *v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id *v14;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BICCoreDataPersistentStoring;
  v6 = -[BICCoreDataPersistentStoring init](&v15, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_url, a3);
    v8 = objc_alloc((Class)BUCoalescingCallBlock);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_B4C6C;
    v13[3] = &unk_28B728;
    v9 = v7;
    v14 = v9;
    v10 = objc_msgSend(v8, "initWithNotifyBlock:blockDescription:", v13, CFSTR("CoreData Saves"));
    v11 = v9[5];
    v9[5] = v10;

    objc_msgSend(v9[5], "setCoalescingDelay:", 5.0);
  }

  return v7;
}

- (void)_commonInit
{
  int64_t *p_onceToken;
  int64_t onceToken;
  _QWORD block[5];

  onceToken = self->_onceToken;
  p_onceToken = &self->_onceToken;
  block[4] = self;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_B4E68;
  block[3] = &unk_28B960;
  if (onceToken != -1)
    dispatch_once(p_onceToken, block);
}

- (id)imageSetForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v16;

  v4 = a3;
  -[BICCoreDataPersistentStoring _commonInit](self, "_commonInit");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BICCoreDataPersistentStoring _imageSetFetchRequest](BICCoreDataPersistentStoring, "_imageSetFetchRequest"));
  objc_msgSend(v5, "setIncludesPendingChanges:", 1);
  objc_msgSend(v5, "setReturnsObjectsAsFaults:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BICCoreDataPersistentStoring _predicateForImageSetWithID:](BICCoreDataPersistentStoring, "_predicateForImageSetWithID:", v4));
  objc_msgSend(v5, "setPredicate:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BICCoreDataPersistentStoring backgroundContext](self, "backgroundContext"));
  v16 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "executeFetchRequest:error:", v5, &v16));
  v9 = v16;

  if ((unint64_t)objc_msgSend(v8, "count") >= 2)
  {
    v10 = BCImageCacheLog();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1B69B4();

  }
  if (v9)
  {
    v12 = BCImageCacheLog();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1B6954();

  }
  if (objc_msgSend(v8, "count"))
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", 0));
  else
    v14 = 0;

  return v14;
}

- (id)addNewImageSetWithIdentifier:(id)a3
{
  id v4;
  BICImageSet *v5;
  void *v6;
  BICImageSet *v7;

  v4 = a3;
  -[BICCoreDataPersistentStoring _commonInit](self, "_commonInit");
  v5 = [BICImageSet alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BICCoreDataPersistentStoring backgroundContext](self, "backgroundContext"));
  v7 = -[BICImageSet initWithContext:](v5, "initWithContext:", v6);

  -[BICImageSet setIdentifier:](v7, "setIdentifier:", v4);
  return v7;
}

- (id)addNewImageEntryToSet:(id)a3
{
  id v4;
  BICImageEntry *v5;
  void *v6;
  BICImageEntry *v7;

  v4 = a3;
  -[BICCoreDataPersistentStoring _commonInit](self, "_commonInit");
  v5 = [BICImageEntry alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BICCoreDataPersistentStoring backgroundContext](self, "backgroundContext"));
  v7 = -[BICImageEntry initWithContext:](v5, "initWithContext:", v6);

  -[BICImageEntry setImageSet:](v7, "setImageSet:", v4);
  return v7;
}

- (void)performBlock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BICCoreDataPersistentStoring _commonInit](self, "_commonInit");
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BICCoreDataPersistentStoring backgroundContext](self, "backgroundContext"));
  objc_msgSend(v5, "performBlock:", v4);

}

- (void)performBlockAndWait:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BICCoreDataPersistentStoring _commonInit](self, "_commonInit");
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BICCoreDataPersistentStoring backgroundContext](self, "backgroundContext"));
  objc_msgSend(v5, "performBlockAndWait:", v4);

}

- (void)deleteObject:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[BICCoreDataPersistentStoring _commonInit](self, "_commonInit");
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BICCoreDataPersistentStoring backgroundContext](self, "backgroundContext"));
  objc_msgSend(v5, "deleteObject:", v4);

}

- (void)processPendingChanges
{
  id v3;

  -[BICCoreDataPersistentStoring _commonInit](self, "_commonInit");
  v3 = (id)objc_claimAutoreleasedReturnValue(-[BICCoreDataPersistentStoring backgroundContext](self, "backgroundContext"));
  objc_msgSend(v3, "processPendingChanges");

}

- (void)saveIfNeeded
{
  void *v3;
  unsigned int v4;
  id v5;

  -[BICCoreDataPersistentStoring _commonInit](self, "_commonInit");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BICCoreDataPersistentStoring backgroundContext](self, "backgroundContext"));
  v4 = objc_msgSend(v3, "hasChanges");

  if (v4)
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[BICCoreDataPersistentStoring coalescingSaves](self, "coalescingSaves"));
    objc_msgSend(v5, "signalWithCompletion:", &stru_290668);

  }
}

- (id)fetchAllImageSets
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  id v11;

  -[BICCoreDataPersistentStoring _commonInit](self, "_commonInit");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BICCoreDataPersistentStoring _imageSetFetchRequest](BICCoreDataPersistentStoring, "_imageSetFetchRequest"));
  objc_msgSend(v3, "setIncludesPendingChanges:", 1);
  objc_msgSend(v3, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(v3, "setFetchBatchSize:", 64);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithValue:](NSPredicate, "predicateWithValue:", 1));
  objc_msgSend(v3, "setPredicate:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BICCoreDataPersistentStoring backgroundContext](self, "backgroundContext"));
  v11 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "executeFetchRequest:error:", v3, &v11));
  v7 = v11;

  if (v7)
  {
    v8 = BCImageCacheLog();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1B6A14();

  }
  return v6;
}

- (id)fetchImageSetsWithIDs:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  id v13;

  v4 = a3;
  -[BICCoreDataPersistentStoring _commonInit](self, "_commonInit");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BICCoreDataPersistentStoring _imageSetFetchRequest](BICCoreDataPersistentStoring, "_imageSetFetchRequest"));
  objc_msgSend(v5, "setIncludesPendingChanges:", 1);
  objc_msgSend(v5, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(v5, "setFetchBatchSize:", 32 * ((unint64_t)objc_msgSend(v4, "count") > 0x40));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BICCoreDataPersistentStoring _predicateForImageSetsWithIDs:](BICCoreDataPersistentStoring, "_predicateForImageSetsWithIDs:", v4));

  objc_msgSend(v5, "setPredicate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BICCoreDataPersistentStoring backgroundContext](self, "backgroundContext"));
  v13 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "executeFetchRequest:error:", v5, &v13));
  v9 = v13;

  if (v9)
  {
    v10 = BCImageCacheLog();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1B6A74();

  }
  return v8;
}

- (id)fetchImageSetsWithDescribedImages:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "valueForKey:", CFSTR("identifier")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BICCoreDataPersistentStoring fetchImageSetsWithIDs:](self, "fetchImageSetsWithIDs:", v4));

  return v5;
}

- (void)removeImageSets:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  BICCoreDataPersistentStoring *v9;

  v4 = a3;
  -[BICCoreDataPersistentStoring _commonInit](self, "_commonInit");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BICCoreDataPersistentStoring backgroundContext](self, "backgroundContext"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_B5864;
  v7[3] = &unk_28B808;
  v8 = v4;
  v9 = self;
  v6 = v4;
  objc_msgSend(v5, "performBlock:", v7);

}

- (id)fetchToBeDeletedImageEntriesInLevelID:(signed __int16)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  id v13;

  v3 = a3;
  -[BICCoreDataPersistentStoring _commonInit](self, "_commonInit");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BICCoreDataPersistentStoring _imageEntryFetchRequest](BICCoreDataPersistentStoring, "_imageEntryFetchRequest"));
  objc_msgSend(v5, "setIncludesPendingChanges:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BICCoreDataPersistentStoring _predicateForToBeDeletedImageEntriesInLevelID:](BICCoreDataPersistentStoring, "_predicateForToBeDeletedImageEntriesInLevelID:", v3));
  objc_msgSend(v5, "setPredicate:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BICCoreDataPersistentStoring backgroundContext](self, "backgroundContext"));
  v13 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "executeFetchRequest:error:", v5, &v13));
  v9 = v13;

  if (v9)
  {
    v10 = BCImageCacheLog();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1B6B34();

  }
  return v8;
}

- (id)fetchImageEntriesMatchingAddedEntries:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  id v13;

  v4 = a3;
  -[BICCoreDataPersistentStoring _commonInit](self, "_commonInit");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BICCoreDataPersistentStoring _imageEntryFetchRequest](BICCoreDataPersistentStoring, "_imageEntryFetchRequest"));
  objc_msgSend(v5, "setIncludesPendingChanges:", 1);
  objc_msgSend(v5, "setReturnsObjectsAsFaults:", 0);
  objc_msgSend(v5, "setFetchBatchSize:", 32);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BICCoreDataPersistentStoring _predicateForImageEntriesMatchingAddedEntries:](BICCoreDataPersistentStoring, "_predicateForImageEntriesMatchingAddedEntries:", v4));

  objc_msgSend(v5, "setPredicate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BICCoreDataPersistentStoring backgroundContext](self, "backgroundContext"));
  v13 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "executeFetchRequest:error:", v5, &v13));
  v9 = v13;

  if (v9)
  {
    v10 = BCImageCacheLog();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1B6B94();

  }
  return v8;
}

- (id)fetchImageEntriesWithLocations:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  id v13;

  v4 = a3;
  -[BICCoreDataPersistentStoring _commonInit](self, "_commonInit");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BICCoreDataPersistentStoring _imageEntryFetchRequest](BICCoreDataPersistentStoring, "_imageEntryFetchRequest"));
  objc_msgSend(v5, "setIncludesPendingChanges:", 1);
  objc_msgSend(v5, "setReturnsObjectsAsFaults:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("entryLocation in %@"), v4));

  objc_msgSend(v5, "setPredicate:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BICCoreDataPersistentStoring backgroundContext](self, "backgroundContext"));
  v13 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "executeFetchRequest:error:", v5, &v13));
  v9 = v13;

  if (v9)
  {
    v10 = BCImageCacheLog();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_1B6BF4();

  }
  return v8;
}

- (void)clean:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;

  v4 = a3;
  -[BICCoreDataPersistentStoring _commonInit](self, "_commonInit");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BICCoreDataPersistentStoring url](self, "url"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[BICCoreDataPersistentStoring _imageSetFetchRequest](BICCoreDataPersistentStoring, "_imageSetFetchRequest"));
    objc_msgSend(v6, "setIncludesPendingChanges:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithValue:](NSPredicate, "predicateWithValue:", 1));
    objc_msgSend(v6, "setPredicate:", v7);

    v8 = objc_msgSend(objc_alloc((Class)NSBatchDeleteRequest), "initWithFetchRequest:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BICCoreDataPersistentStoring backgroundContext](self, "backgroundContext"));
    v10 = objc_msgSend(v9, "executeRequest:error:", v8, 0);

    v11 = objc_retainBlock(v4);
    v12 = v11;
    if (v11)
      (*((void (**)(id))v11 + 2))(v11);

  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BICCoreDataPersistentStoring backgroundContext](self, "backgroundContext"));
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_B5E98;
    v14[3] = &unk_28C080;
    v14[4] = self;
    v15 = v4;
    objc_msgSend(v13, "performBlock:", v14);

  }
}

- (NSPersistentContainer)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
  objc_storeStrong((id *)&self->_container, a3);
}

- (NSManagedObjectContext)backgroundContext
{
  return self->_backgroundContext;
}

- (void)setBackgroundContext:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundContext, a3);
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (int64_t)onceToken
{
  return self->_onceToken;
}

- (void)setOnceToken:(int64_t)a3
{
  self->_onceToken = a3;
}

- (BUCoalescingCallBlock)coalescingSaves
{
  return self->_coalescingSaves;
}

- (void)setCoalescingSaves:(id)a3
{
  objc_storeStrong((id *)&self->_coalescingSaves, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coalescingSaves, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_backgroundContext, 0);
  objc_storeStrong((id *)&self->_container, 0);
}

@end
