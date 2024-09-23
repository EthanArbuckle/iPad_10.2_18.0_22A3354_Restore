@implementation SearchRecentsOperation

- (SearchRecentsOperation)initWithSearchQuery:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  SearchRecentsOperation *v8;
  NSString *v9;
  NSString *query;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SearchRecentsOperation;
  v8 = -[SearchRecentsOperation init](&v12, "init");
  if (v8)
  {
    v9 = (NSString *)objc_msgSend(v6, "copy");
    query = v8->_query;
    v8->_query = v9;

    objc_storeStrong((id *)&v8->_context, a4);
    v8->_stateLock._os_unfair_lock_opaque = 0;
  }

  return v8;
}

- (void)start
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  NSString *query;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  dispatch_queue_global_t global_queue;
  void *v21;
  void *v22;
  void *v23;
  _QWORD v24[5];
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[2];
  _QWORD v28[2];
  uint64_t v29;
  uint8_t buf[4];
  SearchRecentsOperation *v31;

  if (-[SearchRecentsOperation isCancelled](self, "isCancelled"))
  {
    v3 = sub_10043222C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v31 = self;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "SearchRecentsOperation: %@ - is cancelled before starting", buf, 0xCu);
    }

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "searchRecentsOperation:didMatchResults:", self, &__NSArray0__struct);
  }
  else
  {
    -[SearchRecentsOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
    os_unfair_lock_lock(&self->_stateLock);
    self->_isExecuting = 1;
    os_unfair_lock_unlock(&self->_stateLock);
    -[SearchRecentsOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
    v6 = sub_10043222C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v31 = self;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "SearchRecentsOperation: %@ - collecting results", buf, 0xCu);
    }

    v8 = CRAddressKindMapLocation;
    v29 = CRAddressKindMapLocation;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v29, 1));
    WeakRetained = (id)objc_claimAutoreleasedReturnValue(+[CRSearchPredicate predicateForKey:inCollection:](CRSearchPredicate, "predicateForKey:inCollection:", CFSTR("kind"), v9));

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[CRSearchPredicate predicateForKey:matchingText:comparison:](CRSearchPredicate, "predicateForKey:matchingText:comparison:", CFSTR("displayName"), self->_query, 1));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[CRSearchPredicate predicateForKey:matchingText:comparison:](CRSearchPredicate, "predicateForKey:matchingText:comparison:", CFSTR("address"), self->_query, 1));
    v28[0] = v23;
    v28[1] = v22;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v28, 2));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[CRSearchPredicate predicateSatisfyingAnySubpredicate:](CRSearchPredicate, "predicateSatisfyingAnySubpredicate:", v10));

    v12 = objc_alloc_init((Class)CRSearchQuery);
    v27[0] = WeakRetained;
    v27[1] = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 2));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[CRSearchPredicate predicateSatisfyingAllSubpredicates:](CRSearchPredicate, "predicateSatisfyingAllSubpredicates:", v13));
    objc_msgSend(v12, "setSearchPredicate:", v14);

    query = self->_query;
    v26 = v8;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v26, 1));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[CRSearchQuery frecencyComparatorForSearch:preferredKinds:sendingAddress:queryOptions:](CRSearchQuery, "frecencyComparatorForSearch:preferredKinds:sendingAddress:queryOptions:", query, v16, 0, 0));
    objc_msgSend(v12, "setComparator:", v17);

    v25 = CRRecentsDomainMaps;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v25, 1));
    objc_msgSend(v12, "setDomains:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[CRRecentContactsLibrary defaultInstance](CRRecentContactsLibrary, "defaultInstance"));
    global_queue = dispatch_get_global_queue(25, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue(global_queue);
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100B35530;
    v24[3] = &unk_1011AE168;
    v24[4] = self;
    objc_msgSend(v19, "performRecentsSearch:queue:completion:", v12, v21, v24);

  }
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isFinished
{
  SearchRecentsOperation *v2;
  os_unfair_lock_s *p_stateLock;

  v2 = self;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  LOBYTE(v2) = v2->_isFinished;
  os_unfair_lock_unlock(p_stateLock);
  return (char)v2;
}

- (BOOL)isExecuting
{
  SearchRecentsOperation *v2;
  os_unfair_lock_s *p_stateLock;

  v2 = self;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  LOBYTE(v2) = v2->_isExecuting;
  os_unfair_lock_unlock(p_stateLock);
  return (char)v2;
}

- (SearchRecentsOperationDelegate)delegate
{
  return (SearchRecentsOperationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_query, 0);
}

@end
