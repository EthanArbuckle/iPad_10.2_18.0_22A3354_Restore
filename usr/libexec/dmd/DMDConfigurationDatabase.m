@implementation DMDConfigurationDatabase

+ (id)managedObjectModel
{
  if (qword_1000EB830 != -1)
    dispatch_once(&qword_1000EB830, &stru_1000BA718);
  return (id)qword_1000EB828;
}

- (id)description
{
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = sub_1000274DC;
  v12 = sub_1000274EC;
  v13 = 0;
  v3 = -[DMDConfigurationDatabase newBackgroundContext](self, "newBackgroundContext");
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000274F4;
  v7[3] = &unk_1000B9F10;
  v7[4] = &v8;
  objc_msgSend(v3, "performBlockAndWait:", v7);

  v4 = objc_opt_class(self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p\n%@>"), v4, self, v9[5]));
  _Block_object_dispose(&v8, 8);

  return v5;
}

+ (id)descriptionForSQLiteStoreWithDatabaseURL:(id)a3
{
  id v3;
  NSPersistentStoreDescription *v4;

  v3 = a3;
  v4 = objc_opt_new(NSPersistentStoreDescription);
  -[NSPersistentStoreDescription setType:](v4, "setType:", NSSQLiteStoreType);
  -[NSPersistentStoreDescription setURL:](v4, "setURL:", v3);

  return v4;
}

+ (id)newUserDatabase
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager dmd_userConfigurationDatabaseURL](NSFileManager, "dmd_userConfigurationDatabaseURL"));
  v4 = objc_msgSend(a1, "_newDatabaseWithURL:", v3);

  return v4;
}

+ (id)_newDatabaseWithURL:(id)a3
{
  id v4;
  DMDConfigurationDatabase *v5;
  void *v6;
  void *v7;
  void *v9;

  v4 = a3;
  v5 = objc_opt_new(DMDConfigurationDatabase);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "descriptionForSQLiteStoreWithDatabaseURL:", v4));

  v9 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
  -[DMDConfigurationDatabase setPersistentStoreDescriptions:](v5, "setPersistentStoreDescriptions:", v7);

  return v5;
}

- (DMDConfigurationDatabase)init
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  id v6;
  void *v7;
  DMDConfigurationDatabase *v8;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = objc_msgSend((id)objc_opt_class(self), "managedObjectModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = -[DMDConfigurationDatabase initWithName:managedObjectModel:](self, "initWithName:managedObjectModel:", v5, v7);

  return v8;
}

- (void)performBackgroundTask:(id)a3
{
  id v5;
  id v6;
  void *v7;
  objc_super v8;
  _QWORD v9[4];
  id v10;

  v5 = a3;
  if (!v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDConfigurationDatabase.m"), 67, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block"));

  }
  v9[1] = 3221225472;
  v9[2] = sub_100027818;
  v9[3] = &unk_1000BA740;
  v10 = v5;
  v8.receiver = self;
  v8.super_class = (Class)DMDConfigurationDatabase;
  v9[0] = _NSConcreteStackBlock;
  v6 = v5;
  -[DMDConfigurationDatabase performBackgroundTask:](&v8, "performBackgroundTask:", v9);

}

@end
