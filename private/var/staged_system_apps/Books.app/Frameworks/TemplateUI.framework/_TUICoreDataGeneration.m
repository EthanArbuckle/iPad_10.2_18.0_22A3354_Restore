@implementation _TUICoreDataGeneration

- (_TUICoreDataGeneration)initWithContext:(id)a3 fetchRequest:(id)a4
{
  id v6;
  id v7;
  _TUICoreDataGeneration *v8;
  NSFetchRequest *v9;
  NSFetchRequest *fetchRequest;
  uint64_t v11;
  NSPersistentStoreCoordinator *coordinator;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_TUICoreDataGeneration;
  v8 = -[_TUICoreDataGeneration init](&v14, "init");
  if (v8)
  {
    v9 = (NSFetchRequest *)objc_msgSend(v7, "copy");
    fetchRequest = v8->_fetchRequest;
    v8->_fetchRequest = v9;

    v8->_fetchLock._os_unfair_lock_opaque = 0;
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "persistentStoreCoordinator"));
    coordinator = v8->_coordinator;
    v8->_coordinator = (NSPersistentStoreCoordinator *)v11;

    v8->_count = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v8;
}

- (void)updateCount:(unint64_t)a3
{
  self->_count = a3;
}

- (void)captureTokenFromContext:(id)a3
{
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_33398;
  v4[3] = &unk_23D7D0;
  v4[4] = self;
  v5 = a3;
  v3 = v5;
  objc_msgSend(v3, "performBlockAndWait:", v4);

}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  void *v6;

  v3 = (objc_class *)objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ qgt=%@>"), v5, self->_token));

  return v6;
}

- (void)performBlockAndWait:(id)a3
{
  id v4;
  NSManagedObjectContext *v5;
  NSManagedObjectContext *context;
  NSManagedObjectContext *v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];
  id v14;

  v4 = a3;
  os_unfair_lock_lock(&self->_fetchLock);
  if (!self->_context)
  {
    v5 = (NSManagedObjectContext *)objc_msgSend(objc_alloc((Class)NSManagedObjectContext), "initWithConcurrencyType:", 1);
    context = self->_context;
    self->_context = v5;

    -[NSManagedObjectContext setPersistentStoreCoordinator:](self->_context, "setPersistentStoreCoordinator:", self->_coordinator);
    -[NSManagedObjectContext setUndoManager:](self->_context, "setUndoManager:", 0);
  }
  v7 = self->_context;
  if (self->_fetched)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_335C4;
    v11[3] = &unk_23E5A8;
    v11[4] = self;
    v12 = v4;
    v8 = v4;
    -[NSManagedObjectContext performBlockAndWait:](v7, "performBlockAndWait:", v11);
    v9 = v12;
  }
  else
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_33564;
    v13[3] = &unk_23E580;
    v13[4] = self;
    v14 = v4;
    v10 = v4;
    -[NSManagedObjectContext performBlockAndWait:](v7, "performBlockAndWait:", v13);
    self->_fetched = 1;
    v9 = v14;
  }

  os_unfair_lock_unlock(&self->_fetchLock);
}

- (unint64_t)count
{
  return self->_count;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objects, 0);
  objc_storeStrong((id *)&self->_fetchRequest, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
}

@end
