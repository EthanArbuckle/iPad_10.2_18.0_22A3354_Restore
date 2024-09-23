@implementation MailSceneBackgroundQueryMonitor

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000F538C;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005A9DD0 != -1)
    dispatch_once(&qword_1005A9DD0, block);
  return (OS_os_log *)(id)qword_1005A9DC8;
}

- (MailSceneBackgroundQueryMonitor)initWithQuery:(id)a3 repository:(id)a4 changeTypes:(int64_t)a5
{
  id v9;
  id v10;
  MailSceneBackgroundQueryMonitor *v11;
  MailSceneBackgroundQueryMonitor *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MailSceneBackgroundQueryMonitor;
  v11 = -[MailSceneBackgroundQueryMonitor init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    v11->_changeTypes = a5;
    objc_storeStrong((id *)&v11->_query, a3);
    objc_storeStrong((id *)&v12->_repository, a4);
  }

  return v12;
}

- (MailSceneBackgroundQueryMonitor)initWithMessageListItems:(id)a3 messageList:(id)a4 messageRepository:(id)a5 changeTypes:(int64_t)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  MailSceneBackgroundQueryMonitor *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t v32;

  v10 = a3;
  v11 = a4;
  v28 = v10;
  v29 = a5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "ef_compactMapSelector:", "displayMessageObjectID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "query"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "predicate"));

  v15 = 0;
  if (objc_msgSend(v12, "count") && v14)
  {
    v31 = v14;
    v32 = objc_claimAutoreleasedReturnValue(+[EMMessage predicateForMessagesWithObjectIDs:](EMMessage, "predicateForMessagesWithObjectIDs:", v12));
    v26 = (void *)v32;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v31, 2));
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v16));

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[EMMessageListItemPredicates sortDescriptorForDateAscending:](EMMessageListItemPredicates, "sortDescriptorForDateAscending:", 0));
    v18 = objc_msgSend(v12, "count");
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "ef_publicDescription"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("MailSceneBackgroundQueryMonitor query of %lu items originating from %@"), v18, v19));

    v21 = objc_alloc((Class)EMQuery);
    v22 = objc_opt_class(EMMessage);
    v30 = v17;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v30, 1));
    v24 = objc_msgSend(v21, "initWithTargetClass:predicate:sortDescriptors:queryOptions:label:", v22, v27, v23, 0, v20);

    self = -[MailSceneBackgroundQueryMonitor initWithQuery:repository:changeTypes:](self, "initWithQuery:repository:changeTypes:", v24, v29, a6);
    v15 = self;
  }

  return v15;
}

- (void)beginMonitoringWithHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;

  v4 = a3;
  -[MailSceneBackgroundQueryMonitor setHandler:](self, "setHandler:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MailSceneBackgroundQueryMonitor collection](self, "collection"));

  if (!v5)
  {
    v6 = objc_alloc((Class)EMQueryingCollection);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MailSceneBackgroundQueryMonitor query](self, "query"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MailSceneBackgroundQueryMonitor repository](self, "repository"));
    v9 = objc_msgSend(v6, "initWithQuery:repository:", v7, v8);
    -[MailSceneBackgroundQueryMonitor setCollection:](self, "setCollection:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MailSceneBackgroundQueryMonitor collection](self, "collection"));
    objc_msgSend(v10, "beginObserving:", self);

    v11 = objc_claimAutoreleasedReturnValue(+[MailSceneBackgroundQueryMonitor log](MailSceneBackgroundQueryMonitor, "log"));
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MailSceneBackgroundQueryMonitor collection](self, "collection"));
      v13 = 138412290;
      v14 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Created and started observing collection: %@", (uint8_t *)&v13, 0xCu);

    }
  }

}

- (void)endMonitoring
{
  void *v3;

  -[MailSceneBackgroundQueryMonitor setHandler:](self, "setHandler:", 0);
  -[MailSceneBackgroundQueryMonitor setCompletedInitialLoad:](self, "setCompletedInitialLoad:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MailSceneBackgroundQueryMonitor collection](self, "collection"));
  objc_msgSend(v3, "stopObserving:", self);

  -[MailSceneBackgroundQueryMonitor setCollection:](self, "setCollection:", 0);
}

- (void)_changeOccurred:(int64_t)a3
{
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;

  v5 = sub_1000F5C08(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  if (!-[MailSceneBackgroundQueryMonitor completedInitialLoad](self, "completedInitialLoad")
    || (a3 & ~(unint64_t)-[MailSceneBackgroundQueryMonitor changeTypes](self, "changeTypes")) != 0)
  {
    if (-[MailSceneBackgroundQueryMonitor completedInitialLoad](self, "completedInitialLoad"))
    {
      v8 = objc_claimAutoreleasedReturnValue(+[MailSceneBackgroundQueryMonitor log](MailSceneBackgroundQueryMonitor, "log"));
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = sub_1000F5C08((char)-[MailSceneBackgroundQueryMonitor changeTypes](self, "changeTypes"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
        v11 = 138543618;
        v12 = v6;
        v13 = 2114;
        v14 = v10;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Change occurred: %{public}@. Ignoring since we are only reacting to %{public}@", (uint8_t *)&v11, 0x16u);

      }
    }
    else
    {
      v8 = objc_claimAutoreleasedReturnValue(+[MailSceneBackgroundQueryMonitor log](MailSceneBackgroundQueryMonitor, "log"));
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v11 = 138543362;
        v12 = v6;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Change occurred: %{public}@. Ignoring since initial load has not completed.", (uint8_t *)&v11, 0xCu);
      }
    }
  }
  else
  {
    v7 = objc_claimAutoreleasedReturnValue(+[MailSceneBackgroundQueryMonitor log](MailSceneBackgroundQueryMonitor, "log"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138543362;
      v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Change occurred: %{public}@. Notifying handler...", (uint8_t *)&v11, 0xCu);
    }

    v8 = objc_claimAutoreleasedReturnValue(-[MailSceneBackgroundQueryMonitor handler](self, "handler"));
    -[NSObject monitor:requestsAction:](v8, "monitor:requestsAction:", self, -[MailSceneBackgroundQueryMonitor action](self, "action"));
  }

}

- (void)collection:(id)a3 addedItemIDs:(id)a4 before:(id)a5
{
  id v6;
  NSObject *v7;
  uint64_t v8;

  v6 = a4;
  v7 = objc_claimAutoreleasedReturnValue(+[MailSceneBackgroundQueryMonitor log](MailSceneBackgroundQueryMonitor, "log"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    sub_100392CB8((uint64_t)&v8, (uint64_t)objc_msgSend(v6, "count"));

  -[MailSceneBackgroundQueryMonitor _changeOccurred:](self, "_changeOccurred:", 1);
}

- (void)collection:(id)a3 addedItemIDs:(id)a4 after:(id)a5
{
  id v6;
  NSObject *v7;
  uint64_t v8;

  v6 = a4;
  v7 = objc_claimAutoreleasedReturnValue(+[MailSceneBackgroundQueryMonitor log](MailSceneBackgroundQueryMonitor, "log"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    sub_100392CB8((uint64_t)&v8, (uint64_t)objc_msgSend(v6, "count"));

  -[MailSceneBackgroundQueryMonitor _changeOccurred:](self, "_changeOccurred:", 1);
}

- (void)collection:(id)a3 movedItemIDs:(id)a4 before:(id)a5
{
  id v6;
  NSObject *v7;
  uint64_t v8;

  v6 = a4;
  v7 = objc_claimAutoreleasedReturnValue(+[MailSceneBackgroundQueryMonitor log](MailSceneBackgroundQueryMonitor, "log"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    sub_100392CEC((uint64_t)&v8, (uint64_t)objc_msgSend(v6, "count"));

  -[MailSceneBackgroundQueryMonitor _changeOccurred:](self, "_changeOccurred:", 2);
}

- (void)collection:(id)a3 movedItemIDs:(id)a4 after:(id)a5
{
  id v6;
  NSObject *v7;
  uint64_t v8;

  v6 = a4;
  v7 = objc_claimAutoreleasedReturnValue(+[MailSceneBackgroundQueryMonitor log](MailSceneBackgroundQueryMonitor, "log"));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    sub_100392CEC((uint64_t)&v8, (uint64_t)objc_msgSend(v6, "count"));

  -[MailSceneBackgroundQueryMonitor _changeOccurred:](self, "_changeOccurred:", 2);
}

- (void)collection:(id)a3 changedItemIDs:(id)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;

  v5 = a4;
  v6 = objc_claimAutoreleasedReturnValue(+[MailSceneBackgroundQueryMonitor log](MailSceneBackgroundQueryMonitor, "log"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_100392D20((uint64_t)&v7, (uint64_t)objc_msgSend(v5, "count"));

  -[MailSceneBackgroundQueryMonitor _changeOccurred:](self, "_changeOccurred:", 4);
}

- (void)collection:(id)a3 deletedItemIDs:(id)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;

  v5 = a4;
  v6 = objc_claimAutoreleasedReturnValue(+[MailSceneBackgroundQueryMonitor log](MailSceneBackgroundQueryMonitor, "log"));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_100392D54((uint64_t)&v7, (uint64_t)objc_msgSend(v5, "count"));

  -[MailSceneBackgroundQueryMonitor _changeOccurred:](self, "_changeOccurred:", 8);
}

- (void)collection:(id)a3 replacedExistingItemID:(id)a4 withNewItemID:(id)a5
{
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = objc_claimAutoreleasedReturnValue(+[MailSceneBackgroundQueryMonitor log](MailSceneBackgroundQueryMonitor, "log", a3, a4, a5));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_100392D88(v6, v7, v8, v9, v10, v11, v12, v13);

  -[MailSceneBackgroundQueryMonitor _changeOccurred:](self, "_changeOccurred:", 16);
}

- (void)collectionDidFinishInitialLoad:(id)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = objc_claimAutoreleasedReturnValue(+[MailSceneBackgroundQueryMonitor log](MailSceneBackgroundQueryMonitor, "log", a3));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_100392DBC(v4, v5, v6, v7, v8, v9, v10, v11);

  -[MailSceneBackgroundQueryMonitor setCompletedInitialLoad:](self, "setCompletedInitialLoad:", 1);
}

- (NSString)ef_publicDescription
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;

  v3 = objc_opt_class(self);
  v4 = sub_1000F5C08((char)-[MailSceneBackgroundQueryMonitor changeTypes](self, "changeTypes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p> observingChanges=%@"), v3, self, v5));

  return (NSString *)v6;
}

- (int64_t)action
{
  return self->_action;
}

- (void)setAction:(int64_t)a3
{
  self->_action = a3;
}

- (int64_t)changeTypes
{
  return self->_changeTypes;
}

- (void)setChangeTypes:(int64_t)a3
{
  self->_changeTypes = a3;
}

- (EMQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
  objc_storeStrong((id *)&self->_query, a3);
}

- (EMRepository)repository
{
  return self->_repository;
}

- (void)setRepository:(id)a3
{
  objc_storeStrong((id *)&self->_repository, a3);
}

- (EMQueryingCollection)collection
{
  return self->_collection;
}

- (void)setCollection:(id)a3
{
  objc_storeStrong((id *)&self->_collection, a3);
}

- (BOOL)completedInitialLoad
{
  return self->_completedInitialLoad;
}

- (void)setCompletedInitialLoad:(BOOL)a3
{
  self->_completedInitialLoad = a3;
}

- (MailSceneBackgroundResultHandler)handler
{
  return (MailSceneBackgroundResultHandler *)objc_loadWeakRetained((id *)&self->_handler);
}

- (void)setHandler:(id)a3
{
  objc_storeWeak((id *)&self->_handler, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_handler);
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_repository, 0);
  objc_storeStrong((id *)&self->_query, 0);
}

@end
