@implementation THUserDataManager

+ (id)managedObjectModel
{
  NSString *v2;
  id v3;

  v2 = -[NSBundle pathForResource:ofType:](+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(THUserDataManager, a2)), "pathForResource:ofType:", CFSTR("UserDataManager"), CFSTR("mom"));
  if (!v2)
    +[NSException raise:format:](NSException, "raise:format:", CFSTR("[THUserDataManager managedObjectModel]"), CFSTR("[[NSBundle bundleForClass:[THUserDataManager class]] pathForResource:@\"UserDataManager\" ofType:@\"mom\"] failed"));
  v3 = objc_msgSend(objc_alloc((Class)NSManagedObjectModel), "initWithContentsOfURL:", +[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v2));
  if (!v3)
    +[NSException raise:format:](NSException, "raise:format:", CFSTR("[THUserDataManager managedObjectModel]"), CFSTR("NSManagedObjectModel failed"));
  return v3;
}

+ (id)persistentStoreCoordinatorOptions
{
  return +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", CFSTR("0"), CFSTR("synchronous"), 0), NSSQLitePragmasOption, +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1), NSInferMappingModelAutomaticallyOption, +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1), NSMigratePersistentStoresAutomaticallyOption, 0);
}

- (void)logError:(id)a3
{
  if (a3)
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THUserDataManager logError:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THUserDataManager.m"), 79, CFSTR("THUserDataManager error: %@"), objc_msgSend(a3, "description"));
}

- (THUserDataManager)initWithBookDescription:(id)a3
{
  THUserDataManager *v4;
  uint64_t v5;
  id v6;
  NSPersistentStoreCoordinator *mPSC;
  NSURL *v8;
  uint64_t v9;
  NSPersistentStoreCoordinator *v10;
  NSURL *v11;
  uint64_t v12;
  id v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)THUserDataManager;
  v4 = -[THUserDataManager init](&v15, "init");
  if (v4)
  {
    +[THApplicationDelegate ensureContextDirectoryExists:](THApplicationDelegate, "ensureContextDirectoryExists:", objc_msgSend(a3, "asset"));
    v4->mPSC = (NSPersistentStoreCoordinator *)objc_msgSend(objc_alloc((Class)NSPersistentStoreCoordinator), "initWithManagedObjectModel:", objc_msgSend((id)objc_opt_class(v4, v5), "managedObjectModel"));
    v6 = objc_msgSend(a3, "userDataPath");
    mPSC = v4->mPSC;
    if (!mPSC)
    {
      +[NSException raise:format:](NSException, "raise:format:", CFSTR("[THUserDataManager init]"), CFSTR("NSPersistentStoreCoordinator failed"));
      mPSC = v4->mPSC;
    }
    v14 = 0;
    v8 = +[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v6, 0);
    if (!-[NSPersistentStoreCoordinator addPersistentStoreWithType:configuration:URL:options:error:](mPSC, "addPersistentStoreWithType:configuration:URL:options:error:", NSSQLiteStoreType, 0, v8, objc_msgSend((id)objc_opt_class(v4, v9), "persistentStoreCoordinatorOptions"), &v14))
    {
      if (v14)
        objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THUserDataManager initWithBookDescription:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/THUserDataManager.m"), 107, CFSTR("THUserDataManager : The User Data model has changed since you last opened this document.  Deleting out-of-date database.  This discards all user data.  See <rdar://problem/9504409>."));
      -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", v6, 0);
      v14 = 0;
      v10 = v4->mPSC;
      v11 = +[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v6, 0);
      if (!-[NSPersistentStoreCoordinator addPersistentStoreWithType:configuration:URL:options:error:](v10, "addPersistentStoreWithType:configuration:URL:options:error:", NSSQLiteStoreType, 0, v11, objc_msgSend((id)objc_opt_class(v4, v12), "persistentStoreCoordinatorOptions"), &v14))
      {
        -[THUserDataManager logError:](v4, "logError:", v14);
        +[NSException raise:format:](NSException, "raise:format:", CFSTR("[THUserDataManager init]"), CFSTR("Error adding Store to PSC: %@"), objc_msgSend(v14, "localizedDescription"));
      }
    }
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  self->mPersistentStore = 0;
  self->mPSC = 0;

  self->mMetadataDictionary = 0;
  v3.receiver = self;
  v3.super_class = (Class)THUserDataManager;
  -[THUserDataManager dealloc](&v3, "dealloc");
}

- (id)newManagedObjectContext
{
  id v3;

  if (!self->mPSC)
    return 0;
  v3 = objc_msgSend(objc_alloc((Class)NSManagedObjectContext), "initWithConcurrencyType:", 0);
  objc_msgSend(v3, "setPersistentStoreCoordinator:", self->mPSC);
  objc_msgSend(v3, "setUndoManager:", 0);
  return v3;
}

- (void)save:(id)a3
{
  NSPersistentStoreCoordinator *mPSC;
  NSPersistentStoreCoordinator *v6;
  NSPersistentStoreCoordinator **p_mPSC;
  _QWORD v8[6];
  uint64_t v9;

  v9 = 0;
  p_mPSC = &self->mPSC;
  mPSC = self->mPSC;
  v6 = p_mPSC[1];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_86D7C;
  v8[3] = &unk_426E28;
  v8[4] = self;
  v8[5] = v6;
  -[NSPersistentStoreCoordinator performBlockAndWait:](mPSC, "performBlockAndWait:", v8);
  if ((objc_msgSend(a3, "save:", &v9) & 1) == 0)
    -[THUserDataManager logError:](self, "logError:", v9);
}

- (void)p_cacheMetadataDictionary
{
  id v3;
  NSMutableDictionary *v4;

  if (!self->mMetadataDictionary)
  {
    v3 = -[NSDictionary objectForKey:](-[NSPersistentStoreCoordinator metadataForPersistentStore:](self->mPSC, "metadataForPersistentStore:", self->mPersistentStore), "objectForKey:", CFSTR("THUserData-Metadata"));
    if (v3)
      v4 = (NSMutableDictionary *)objc_msgSend(v3, "mutableCopy");
    else
      v4 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    self->mMetadataDictionary = v4;
    self->mMetadataDictionaryDirty = 0;
  }
}

- (void)setMetadataObject:(id)a3 forKey:(id)a4
{
  NSPersistentStoreCoordinator *mPSC;
  _QWORD v5[7];

  if (self->mPersistentStore)
  {
    mPSC = self->mPSC;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_86EC8;
    v5[3] = &unk_426F18;
    v5[4] = self;
    v5[5] = a3;
    v5[6] = a4;
    -[NSPersistentStoreCoordinator performBlockAndWait:](mPSC, "performBlockAndWait:", v5);
  }
}

- (id)metadataObjectForKey:(id)a3
{
  NSPersistentStoreCoordinator *mPSC;
  void *v4;
  id v5;
  _QWORD v7[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = sub_86FF0;
  v12 = sub_87000;
  v13 = 0;
  if (self->mPersistentStore)
  {
    mPSC = self->mPSC;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_8700C;
    v7[3] = &unk_4281A0;
    v7[5] = a3;
    v7[6] = &v8;
    v7[4] = self;
    -[NSPersistentStoreCoordinator performBlockAndWait:](mPSC, "performBlockAndWait:", v7);
    v4 = (void *)v9[5];
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;
  _Block_object_dispose(&v8, 8);
  return v5;
}

@end
