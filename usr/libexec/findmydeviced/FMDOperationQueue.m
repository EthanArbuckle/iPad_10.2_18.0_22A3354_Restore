@implementation FMDOperationQueue

- (FMDOperationQueue)initWithIdentifier:(id)a3
{
  id v4;
  FMDOperationQueue *v5;
  id v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)FMDOperationQueue;
  v5 = -[FMDOperationQueue init](&v10, "init");
  if (v5)
  {
    v6 = objc_alloc_init((Class)NSOperationQueue);
    -[FMDOperationQueue setRequestsOperationQueue:](v5, "setRequestsOperationQueue:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDOperationQueue requestsOperationQueue](v5, "requestsOperationQueue"));
    objc_msgSend(v7, "setMaxConcurrentOperationCount:", 1);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    -[FMDOperationQueue setRequests:](v5, "setRequests:", v8);

    -[FMDOperationQueue setIdentifier:](v5, "setIdentifier:", v4);
    -[FMDOperationQueue setQueueCount:](v5, "setQueueCount:", 0);
    -[FMDOperationQueue setIsPaused:](v5, "setIsPaused:", 0);
  }

  return v5;
}

- (BOOL)addRequest:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDOperationQueue requestsOperationQueue](self, "requestsOperationQueue"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100093E18;
    v7[3] = &unk_1002C11E8;
    objc_copyWeak(&v9, &location);
    v8 = v4;
    objc_msgSend(v5, "addOperationWithBlock:", v7);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

  return v4 != 0;
}

- (BOOL)cancelRequest:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;
  uint8_t buf[4];
  FMDOperationQueue *v14;
  __int16 v15;
  id v16;

  v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    v5 = sub_100052F5C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v14 = self;
      v15 = 2112;
      v16 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%@ action to be removed - %@", buf, 0x16u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDOperationQueue requestsOperationQueue](self, "requestsOperationQueue"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100094168;
    v9[3] = &unk_1002C11E8;
    objc_copyWeak(&v11, &location);
    v10 = v4;
    objc_msgSend(v7, "addOperationWithBlock:", v9);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

  return v4 != 0;
}

- (void)processRequests
{
  id v3;
  NSObject *v4;
  const char *v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint8_t buf[4];
  FMDOperationQueue *v26;
  __int16 v27;
  NSObject *v28;

  if (-[FMDOperationQueue isPaused](self, "isPaused"))
  {
    v3 = sub_100052F5C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = self;
      v5 = "%@ queue paused";
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v5, buf, 0xCu);
    }
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDOperationQueue requests](self, "requests"));
    v7 = objc_msgSend(v6, "count");

    if (v7)
    {
      if ((id)-[FMDOperationQueue queueCount](self, "queueCount") == (id)1)
      {
        v8 = sub_100052F5C();
        v4 = objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          v9 = objc_claimAutoreleasedReturnValue(-[FMDOperationQueue headAction](self, "headAction"));
          *(_DWORD *)buf = 138412546;
          v26 = self;
          v27 = 2112;
          v28 = v9;
          _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@ Queue BUSY with %@", buf, 0x16u);

        }
      }
      else
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMDOperationQueue requests](self, "requests"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndex:", 0));
        -[FMDOperationQueue setHeadAction:](self, "setHeadAction:", v12);

        v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMDOperationQueue headAction](self, "headAction"));
        v15 = objc_opt_class(v13, v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[FMDOperationQueue headAction](self, "headAction"));
        v4 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%p"), v15, v16));

        v17 = sub_100052F5C();
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v26 = self;
          v27 = 2112;
          v28 = v4;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%@ HEAD ACTION - %@", buf, 0x16u);
        }

        v19 = (void *)objc_claimAutoreleasedReturnValue(-[FMDOperationQueue headAction](self, "headAction"));
        if (v19)
        {
          v20 = (void *)objc_claimAutoreleasedReturnValue(-[FMDOperationQueue requests](self, "requests"));
          objc_msgSend(v20, "removeObjectAtIndex:", 0);

        }
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[FMDOperationQueue headAction](self, "headAction"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[FMDOperationQueue wrapAction:](self, "wrapAction:", v21));

        v23 = (void *)objc_claimAutoreleasedReturnValue(+[ActionManager sharedManager](ActionManager, "sharedManager"));
        v24 = objc_msgSend(v23, "enqueueAction:", v22);

        -[FMDOperationQueue setQueueCount:](self, "setQueueCount:", (char *)-[FMDOperationQueue queueCount](self, "queueCount") + 1);
      }
    }
    else
    {
      -[FMDOperationQueue setHeadAction:](self, "setHeadAction:", 0);
      v10 = sub_100052F5C();
      v4 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v26 = self;
        v5 = "%@ no actions found";
        goto LABEL_10;
      }
    }
  }

}

- (id)wrapAction:(id)a3
{
  id v4;
  FMDActionDecorator *v5;
  FMDActionDecorator *v6;
  _QWORD v8[4];
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = [FMDActionDecorator alloc];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100094708;
  v8[3] = &unk_1002C1378;
  objc_copyWeak(&v9, &location);
  v6 = -[FMDActionDecorator initWithAction:usingCompletion:](v5, "initWithAction:usingCompletion:", v4, v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v6;
}

- (BOOL)shouldAddAction:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDOperationQueue requests](self, "requests", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), "shouldCancelAction:", v4) & 1) != 0)
        {
          v10 = 0;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v7)
        continue;
      break;
    }
  }
  v10 = 1;
LABEL_11:

  return v10;
}

- (BOOL)replacedExsitingAction:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  BOOL v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v4 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDOperationQueue requests](self, "requests"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100094AEC;
  v10[3] = &unk_1002C47E0;
  v6 = v4;
  v11 = v6;
  v12 = &v18;
  v13 = &v14;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);

  if (*((_BYTE *)v15 + 24))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDOperationQueue requests](self, "requests"));
    objc_msgSend(v7, "replaceObjectAtIndex:withObject:", v19[3], v6);

    v8 = *((_BYTE *)v15 + 24) != 0;
  }
  else
  {
    v8 = 0;
  }

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  return v8;
}

- (id)description
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_opt_class(self, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMDOperationQueue identifier](self, "identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDOperationQueue headAction](self, "headAction"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%p-%@-%@"), v3, self, v4, v5));

  return v6;
}

- (NSMutableArray)requests
{
  return (NSMutableArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRequests:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (Action)headAction
{
  return self->_headAction;
}

- (void)setHeadAction:(id)a3
{
  objc_storeStrong((id *)&self->_headAction, a3);
}

- (NSOperationQueue)requestsOperationQueue
{
  return self->_requestsOperationQueue;
}

- (void)setRequestsOperationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_requestsOperationQueue, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (unint64_t)queueCount
{
  return self->_queueCount;
}

- (void)setQueueCount:(unint64_t)a3
{
  self->_queueCount = a3;
}

- (BOOL)isPaused
{
  return self->_isPaused;
}

- (void)setIsPaused:(BOOL)a3
{
  self->_isPaused = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_requestsOperationQueue, 0);
  objc_storeStrong((id *)&self->_headAction, 0);
  objc_storeStrong((id *)&self->_requests, 0);
}

@end
