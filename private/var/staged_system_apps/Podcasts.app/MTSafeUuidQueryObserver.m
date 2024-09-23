@implementation MTSafeUuidQueryObserver

- (void)controllerWillChangeContent:(id)a3
{
  NSMutableSet *v4;
  NSMutableSet *currentInserts;
  NSMutableSet *v6;
  NSMutableSet *currentDeletes;
  NSMutableSet *v8;
  NSMutableSet *currentUpdates;

  v4 = objc_opt_new(NSMutableSet);
  currentInserts = self->currentInserts;
  self->currentInserts = v4;

  v6 = objc_opt_new(NSMutableSet);
  currentDeletes = self->currentDeletes;
  self->currentDeletes = v6;

  v8 = objc_opt_new(NSMutableSet);
  currentUpdates = self->currentUpdates;
  self->currentUpdates = v8;

}

- (MTSafeUuidQueryObserver)initWithFetchRequest:(id)a3 managedObjectContext:(id)a4
{
  id v6;
  id v7;
  NSMutableSet *v8;
  NSMutableSet *currentItems;
  MTSafeUuidQueryObserver *v10;
  objc_super v12;

  v6 = a4;
  v7 = a3;
  v8 = objc_opt_new(NSMutableSet);
  currentItems = self->currentItems;
  self->currentItems = v8;

  v12.receiver = self;
  v12.super_class = (Class)MTSafeUuidQueryObserver;
  v10 = -[MTSafeUuidQueryObserver initWithFetchRequest:managedObjectContext:](&v12, "initWithFetchRequest:managedObjectContext:", v7, v6);

  return v10;
}

- (id)addResultsChangedHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  objc_super v8;

  v4 = objc_retainBlock(a3);
  v8.receiver = self;
  v8.super_class = (Class)MTSafeUuidQueryObserver;
  v5 = -[MTSafeUuidQueryObserver addResultsChangedHandler:](&v8, "addResultsChangedHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  return v6;
}

- (void)startObserving
{
  _QWORD v3[5];
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTSafeUuidQueryObserver;
  -[MTSafeUuidQueryObserver startObserving](&v4, "startObserving");
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10001D998;
  v3[3] = &unk_1004A8FB0;
  v3[4] = self;
  -[MTSafeUuidQueryObserver results:](self, "results:", v3);
}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  int v15;
  id v16;

  v9 = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "valueForKey:", CFSTR("uuid")));
  if (v11)
  {
    if (a6 == 2)
    {
      v12 = 16;
    }
    else if (a6 == 1)
    {
      v12 = 8;
    }
    else
    {
      v12 = 24;
    }
    objc_msgSend(*(id *)&self->MTBaseQueryObserver_opaque[v12], "addObject:", v11);
  }
  else
  {
    v13 = _MTLogCategoryDatabase(0, v10);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412290;
      v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "MTSafeUUIDQueryObserver has no UUID for object %@", (uint8_t *)&v15, 0xCu);
    }

  }
}

- (void)notifyObservers
{
  id v3;
  id v4;
  id v5;
  NSMutableSet *currentInserts;
  NSMutableSet *currentDeletes;
  NSMutableSet *currentUpdates;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v10 = -[NSMutableSet mutableCopy](self->currentItems, "mutableCopy");
  objc_msgSend(v10, "intersectSet:", self->currentInserts);
  -[NSMutableSet minusSet:](self->currentInserts, "minusSet:", v10);
  -[NSMutableSet unionSet:](self->currentUpdates, "unionSet:", v10);
  -[NSMutableSet intersectSet:](self->currentDeletes, "intersectSet:", self->currentItems);
  -[NSMutableSet intersectSet:](self->currentUpdates, "intersectSet:", self->currentItems);
  -[NSMutableSet unionSet:](self->currentItems, "unionSet:", self->currentInserts);
  -[NSMutableSet minusSet:](self->currentItems, "minusSet:", self->currentDeletes);
  v3 = -[NSMutableSet copy](self->currentInserts, "copy");
  v4 = -[NSMutableSet copy](self->currentDeletes, "copy");
  v5 = -[NSMutableSet copy](self->currentUpdates, "copy");
  currentInserts = self->currentInserts;
  self->currentInserts = 0;

  currentDeletes = self->currentDeletes;
  self->currentDeletes = 0;

  currentUpdates = self->currentUpdates;
  self->currentUpdates = 0;

  if (objc_msgSend(v5, "count") || objc_msgSend(v3, "count") || objc_msgSend(v4, "count"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTSafeUuidQueryObserver handlers](self, "handlers"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100029688;
    v11[3] = &unk_1004AA468;
    v12 = v4;
    v13 = v3;
    v14 = v5;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v11);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->currentItems, 0);
  objc_storeStrong((id *)&self->currentUpdates, 0);
  objc_storeStrong((id *)&self->currentDeletes, 0);
  objc_storeStrong((id *)&self->currentInserts, 0);
}

@end
