@implementation CLPersistenceStore

- (CLPersistenceStore)initWithURL:(id)a3 useCloudKit:(BOOL)a4
{
  _BOOL4 v4;
  CLPersistenceStore *v7;
  NSPersistentStoreDescription *v8;
  objc_super v10;

  v4 = a4;
  if (!a3)
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CLPersistenceStore.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("URL"));
  v10.receiver = self;
  v10.super_class = (Class)CLPersistenceStore;
  v7 = -[CLPersistenceStore init](&v10, "init");
  if (v7)
  {
    v8 = objc_opt_new(NSPersistentStoreDescription);
    v7->_storeDescription = v8;
    -[NSPersistentStoreDescription setShouldAddStoreAsynchronously:](v8, "setShouldAddStoreAsynchronously:", 0);
    -[NSPersistentStoreDescription setShouldMigrateStoreAutomatically:](v7->_storeDescription, "setShouldMigrateStoreAutomatically:", 1);
    -[NSPersistentStoreDescription setShouldInferMappingModelAutomatically:](v7->_storeDescription, "setShouldInferMappingModelAutomatically:", 1);
    -[NSPersistentStoreDescription setURL:](v7->_storeDescription, "setURL:", a3);
    -[NSPersistentStoreDescription setType:](v7->_storeDescription, "setType:", NSSQLiteStoreType);
    -[NSPersistentStoreDescription setOption:forKey:](v7->_storeDescription, "setOption:forKey:", NSFileProtectionCompleteUnlessOpen, NSPersistentStoreFileProtectionKey);
    -[NSPersistentStoreDescription setValue:forPragmaNamed:](v7->_storeDescription, "setValue:forPragmaNamed:", CFSTR("WAL"), CFSTR("journal_mode"));
    if (v4)
      -[CLPersistenceStore setUpCloudKit](v7, "setUpCloudKit");
  }
  return v7;
}

- (void)setUpCloudKit
{
  if (objc_msgSend(CFSTR("com.apple.locationd.clx"), "isEqualToString:", CFSTR("com.apple.locationd.clx")))
  {
    -[CLPersistenceStore setUpCloudKitForProd](self, "setUpCloudKitForProd");
  }
  else if (objc_msgSend(CFSTR("com.apple.locationd.clx"), "isEqualToString:", CFSTR("com.apple.locationd.clx.test")))
  {
    -[CLPersistenceStore setUpCloudKitForTest](self, "setUpCloudKitForTest");
  }
  else
  {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CLPersistenceStore.m"), 74, CFSTR("CoreData+CloudKit, Please implement setUpCloudKit for this new container %@"), CFSTR("com.apple.locationd.clx"));
  }
}

- (void)setUpCloudKitForProd
{
  id v3;
  id v4;
  id v5;
  id v6;

  v3 = objc_alloc_init((Class)CKContainerOptions);
  objc_msgSend(v3, "setUseZoneWidePCS:", 1);
  v4 = objc_msgSend(objc_alloc((Class)NSCloudKitMirroringDelegateOptions), "initWithContainerIdentifier:", CFSTR("com.apple.locationd.clx"));
  objc_msgSend(v4, "setContainerOptions:", v3);
  objc_msgSend(v4, "setUseDeviceToDeviceEncryption:", 1);
  objc_msgSend(v4, "setOperationMemoryThresholdBytes:", &off_10221CE60);
  v5 = objc_msgSend(objc_alloc((Class)NSCloudKitMirroringDelegate), "initWithOptions:", v4);
  -[NSPersistentStoreDescription setMirroringDelegate:](self->_storeDescription, "setMirroringDelegate:", v5);
  v6 = objc_msgSend(objc_alloc((Class)NSPersistentCloudKitContainerOptions), "initWithContainerIdentifier:", CFSTR("com.apple.locationd.clx"));
  objc_msgSend(v6, "setApsConnectionMachServiceName:", CFSTR("com.apple.aps.locationd"));
  objc_msgSend(v6, "setUseDeviceToDeviceEncryption:", 1);
  -[NSPersistentStoreDescription setCloudKitContainerOptions:](self->_storeDescription, "setCloudKitContainerOptions:", v6);
  -[NSPersistentStoreDescription setOption:forKey:](self->_storeDescription, "setOption:forKey:", +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", 2), NSPersistentStoreConnectionPoolMaxSizeKey);

}

- (void)setUpCloudKitForTest
{
  id v3;
  id v4;
  id v5;

  v3 = objc_msgSend(objc_alloc((Class)NSCloudKitMirroringDelegateOptions), "initWithContainerIdentifier:", CFSTR("com.apple.locationd.clx"));
  v4 = objc_msgSend(objc_alloc((Class)NSCloudKitMirroringDelegate), "initWithOptions:", v3);
  -[NSPersistentStoreDescription setMirroringDelegate:](self->_storeDescription, "setMirroringDelegate:", v4);
  v5 = objc_msgSend(objc_alloc((Class)NSPersistentCloudKitContainerOptions), "initWithContainerIdentifier:", CFSTR("com.apple.locationd.clx"));
  objc_msgSend(v5, "setApsConnectionMachServiceName:", CFSTR("com.apple.aps.locationd"));
  -[NSPersistentStoreDescription setCloudKitContainerOptions:](self->_storeDescription, "setCloudKitContainerOptions:", v5);

}

- (BOOL)loadWithCoordinator:(id)a3
{
  NSPersistentStoreDescription *storeDescription;
  uint64_t v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = sub_100207290;
  v12 = sub_100207DB8;
  v13 = 0;
  storeDescription = self->_storeDescription;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1010DB8CC;
  v7[3] = &unk_102199FD8;
  v7[4] = &v8;
  objc_msgSend(a3, "addPersistentStoreWithDescription:completionHandler:", storeDescription, v7);
  v5 = v9[5];
  if (v5)
    NSLog(CFSTR("CoreData, Could not add store with error = %@"), v9[5]);
  else
    NSLog(CFSTR("CoreData, Successfully loaded store into NSPersistentStoreCoordinator!"));
  _Block_object_dispose(&v8, 8);
  return v5 == 0;
}

- (NSURL)url
{
  return -[NSPersistentStoreDescription URL](self->_storeDescription, "URL");
}

- (NSString)storeType
{
  return -[NSPersistentStoreDescription type](self->_storeDescription, "type");
}

- (NSDictionary)options
{
  return -[NSPersistentStoreDescription options](self->_storeDescription, "options");
}

- (id)persistentStoreDescription
{
  return self->_storeDescription;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLPersistenceStore;
  -[CLPersistenceStore dealloc](&v3, "dealloc");
}

@end
