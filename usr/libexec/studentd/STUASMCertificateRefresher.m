@implementation STUASMCertificateRefresher

- (STUASMCertificateRefresher)initWithRosterProvider:(id)a3 certificateConduit:(id)a4 IDSCacheClearer:(id)a5
{
  id v9;
  id v10;
  id v11;
  STUASMCertificateRefresher *v12;
  STUASMCertificateRefresher *v13;
  NSMutableSet *v14;
  NSMutableSet *refreshOperations;
  objc_super v17;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)STUASMCertificateRefresher;
  v12 = -[STUASMCertificateRefresher init](&v17, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_rosterProvider, a3);
    objc_storeStrong((id *)&v13->_certificateConduit, a4);
    objc_storeStrong((id *)&v13->_IDSCacheClearer, a5);
    v14 = objc_opt_new(NSMutableSet);
    refreshOperations = v13->_refreshOperations;
    v13->_refreshOperations = v14;

  }
  return v13;
}

- (void)refreshCertificatesForCourseWithIdentifier:(id)a3 instructorIdentifier:(id)a4 targetIPAddress:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = sub_100061780();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "stringValue"));
    v18 = 138543874;
    v19 = v16;
    v20 = 2114;
    v21 = v11;
    v22 = 2114;
    v23 = v12;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Asked to refresh certificates for course identifier %{public}@, instructor identifier %{public}@, target IP address %{public}@", (uint8_t *)&v18, 0x20u);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[STUASMCertificateRefresher refreshCertificatesOperationForCourseIdentifier:instructorIdentifier:targetIPAddress:](self, "refreshCertificatesOperationForCourseIdentifier:instructorIdentifier:targetIPAddress:", v10, v11, v12));
  -[STUASMCertificateRefresher attachCompletionBlock:toOperation:](self, "attachCompletionBlock:toOperation:", v13, v17);

}

- (void)cancelRefreshCertificatesForCourseWithIdentifier:(id)a3 targetIPAddress:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t v21[128];
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[STUASMCertificateRefresher existingRefreshCertificatesOperationsForCourseIdentifier:targetIPAddress:](self, "existingRefreshCertificatesOperationsForCourseIdentifier:targetIPAddress:", v6, v7));
  if (objc_msgSend(v8, "count"))
  {
    v9 = sub_100061780();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringValue"));
      *(_DWORD *)buf = 138543618;
      v23 = v11;
      v24 = 2114;
      v25 = v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Canceling refresh certificates for course identifier %{public}@, target IP address %{public}@", buf, 0x16u);

    }
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v12 = v8;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v18;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v18 != v15)
            objc_enumerationMutation(v12);
          -[STUASMCertificateRefresher cancelOperation:](self, "cancelOperation:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v16), (_QWORD)v17);
          v16 = (char *)v16 + 1;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v14);
    }

  }
}

- (void)attachCompletionBlock:(id)a3 toOperation:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void **v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  id v14;
  id v15;

  v5 = a3;
  v10 = _NSConcreteStackBlock;
  v11 = 3221225472;
  v12 = sub_100061A4C;
  v13 = &unk_1000CAF70;
  v14 = a4;
  v15 = v5;
  v6 = v5;
  v7 = v14;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBlockOperation blockOperationWithBlock:](NSBlockOperation, "blockOperationWithBlock:", &v10));
  objc_msgSend(v8, "addDependency:", v7, v10, v11, v12, v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
  objc_msgSend(v9, "addOperation:", v8);

}

- (id)refreshCertificatesOperationForCourseIdentifier:(id)a3 instructorIdentifier:(id)a4 targetIPAddress:(id)a5
{
  id v8;
  id v9;
  id v10;
  STURefreshASMCertificatesOperation *v11;
  STURefreshASMCertificatesOperation *v12;
  void *v13;
  void *v14;
  void *v15;
  STURefreshASMCertificatesOperation *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  NSObject *v21;
  void *v22;
  void **v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  STURefreshASMCertificatesOperation *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id location;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (STURefreshASMCertificatesOperation *)objc_claimAutoreleasedReturnValue(-[STUASMCertificateRefresher existingRefreshCertificatesOperationForCourseIdentifier:instructorIdentifier:targetIPAddress:](self, "existingRefreshCertificatesOperationForCourseIdentifier:instructorIdentifier:targetIPAddress:", v8, v9, v10));
  if (!v11)
  {
    v12 = [STURefreshASMCertificatesOperation alloc];
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[STUASMCertificateRefresher rosterProvider](self, "rosterProvider"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[STUASMCertificateRefresher certificateConduit](self, "certificateConduit"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[STUASMCertificateRefresher IDSCacheClearer](self, "IDSCacheClearer"));
    v16 = -[STURefreshASMCertificatesOperation initWithCourseIdentifier:instructorIdentifier:targetIPAddress:rosterProvider:certificateConduit:IDSCacheClearer:](v12, "initWithCourseIdentifier:instructorIdentifier:targetIPAddress:rosterProvider:certificateConduit:IDSCacheClearer:", v8, v9, v10, v13, v14, v15);

    objc_initWeak(&location, self);
    v24 = _NSConcreteStackBlock;
    v25 = 3221225472;
    v26 = sub_100061D28;
    v27 = &unk_1000CB908;
    objc_copyWeak(&v32, &location);
    v11 = v16;
    v28 = v11;
    v17 = v8;
    v29 = v17;
    v18 = v9;
    v30 = v18;
    v19 = v10;
    v31 = v19;
    -[STUASMCertificateRefresher attachCompletionBlock:toOperation:](self, "attachCompletionBlock:toOperation:", &v24, v11);
    v20 = sub_100061780();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "stringValue", v24, v25, v26, v27, v28, v29, v30));
      *(_DWORD *)buf = 138543874;
      v35 = v22;
      v36 = 2114;
      v37 = v18;
      v38 = 2114;
      v39 = v19;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Starting refresh certificates operation for course identifier %{public}@, instructor identifier %{public}@, target IP address %{public}@", buf, 0x20u);

    }
    -[STUASMCertificateRefresher enqueueOperation:](self, "enqueueOperation:", v11);

    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }

  return v11;
}

- (void)refreshCertificatesOperationDidFinish:(id)a3 courseIdentifier:(id)a4 instructorIdentifier:(id)a5 targetIPAddress:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[STUASMCertificateRefresher refreshOperations](self, "refreshOperations"));
  v15 = objc_msgSend(v14, "containsObject:", v10);

  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[STUASMCertificateRefresher refreshOperations](self, "refreshOperations"));
    objc_msgSend(v16, "removeObject:", v10);

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "error"));
    if (v17)
    {
      v18 = sub_100061780();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringValue"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "verboseDescription"));
        v29 = 138544130;
        v30 = v27;
        v31 = 2114;
        v32 = v12;
        v33 = 2114;
        v34 = v13;
        v35 = 2114;
        v36 = v28;
        _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Refresh ASM certificates operation for course identifier %{public}@, instructor identifier %{public}@, target IP address %{public}@ failed: %{public}@", (uint8_t *)&v29, 0x2Au);

      }
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "finishedDate"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "startedDate"));
    objc_msgSend(v20, "timeIntervalSinceDate:", v21);
    v23 = v22;

    v24 = sub_100061780();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringValue"));
      v29 = 134218754;
      v30 = v23;
      v31 = 2114;
      v32 = v26;
      v33 = 2114;
      v34 = v12;
      v35 = 2114;
      v36 = v13;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "It took %.2f seconds to refresh certificates for course identifier %{public}@, instructor identifier %{public}@, target IP address %{public}@", (uint8_t *)&v29, 0x2Au);

    }
  }

}

- (id)existingRefreshCertificatesOperationForCourseIdentifier:(id)a3 instructorIdentifier:(id)a4 targetIPAddress:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[STUASMCertificateRefresher refreshOperations](self, "refreshOperations", 0));
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v15, "isForCourseIdentifier:instructorIdentifier:targetIPAddress:", v8, v9, v10) & 1) != 0)
        {
          v12 = v15;
          goto LABEL_11;
        }
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v12)
        continue;
      break;
    }
  }
LABEL_11:

  return v12;
}

- (id)existingRefreshCertificatesOperationsForCourseIdentifier:(id)a3 targetIPAddress:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[STUASMCertificateRefresher refreshOperations](self, "refreshOperations"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000621D0;
  v13[3] = &unk_1000CB930;
  v14 = v6;
  v15 = v7;
  v9 = v7;
  v10 = v6;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "crk_filterUsingBlock:", v13));

  return v11;
}

- (void)enqueueOperation:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[STUASMCertificateRefresher refreshOperations](self, "refreshOperations"));
  objc_msgSend(v5, "addObject:", v4);

  v6 = (id)objc_claimAutoreleasedReturnValue(+[CATOperationQueue crk_backgroundQueue](CATOperationQueue, "crk_backgroundQueue"));
  objc_msgSend(v6, "addOperation:", v4);

}

- (void)cancelOperation:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUASMCertificateRefresher refreshOperations](self, "refreshOperations"));
  objc_msgSend(v4, "removeObject:", v5);

  objc_msgSend(v5, "cancel");
}

- (CRKASMRosterProviding)rosterProvider
{
  return self->_rosterProvider;
}

- (CRKCertificateConduit)certificateConduit
{
  return self->_certificateConduit;
}

- (STUIDSCacheClearer)IDSCacheClearer
{
  return self->_IDSCacheClearer;
}

- (NSMutableSet)refreshOperations
{
  return self->_refreshOperations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refreshOperations, 0);
  objc_storeStrong((id *)&self->_IDSCacheClearer, 0);
  objc_storeStrong((id *)&self->_certificateConduit, 0);
  objc_storeStrong((id *)&self->_rosterProvider, 0);
}

@end
