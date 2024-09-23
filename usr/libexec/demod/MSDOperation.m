@implementation MSDOperation

- (MSDOperation)initWithContext:(id)a3
{
  id v4;
  MSDOperation *v5;
  MSDOperation *v6;
  id v7;
  NSObject *v8;
  id v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MSDOperation;
  v5 = -[MSDOperation init](&v11, "init");
  v6 = v5;
  if (v5)
  {
    -[MSDOperation setContext:](v5, "setContext:", v4);
    -[MSDOperation setComponent:](v6, "setComponent:", 0);
    -[MSDOperation setFlag:](v6, "setFlag:", 0);
    -[MSDOperation setCheckpointBarrier:](v6, "setCheckpointBarrier:", 0);
    -[MSDOperation setObserver:](v6, "setObserver:", 0);
    v7 = sub_100060640();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    -[MSDOperation setSignpostId:](v6, "setSignpostId:", os_signpost_id_generate(v8));

    v9 = objc_alloc_init((Class)NSMutableSet);
    -[MSDOperation setDependents:](v6, "setDependents:", v9);

  }
  return v6;
}

- (NSString)identifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(self, a2);
  return NSStringFromClass(v2);
}

- (MSDOperationContext)context
{
  return self->_context;
}

- (int64_t)type
{
  return 0;
}

- (BOOL)retryable
{
  return -[MSDOperation flag](self, "flag") & 1;
}

- (void)setRetryable:(BOOL)a3
{
  -[MSDOperation setFlag:](self, "setFlag:", -[MSDOperation flag](self, "flag") & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (BOOL)skipped
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v3 = objc_msgSend(v2, "skipped");

  return v3;
}

- (void)setSkipped:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  objc_msgSend(v4, "setSkipped:", v3);

}

- (void)main
{
  NSObject *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  unint64_t v10;
  os_signpost_id_t v11;
  id v12;
  NSObject *v13;
  unint64_t v14;
  os_signpost_id_t v15;
  unsigned int v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  os_activity_scope_state_s v21;
  uint8_t buf[4];
  MSDOperation *v23;
  __int16 v24;
  unsigned int v25;

  v3 = _os_activity_create((void *)&_mh_execute_header, "Perform Operation", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v21.opaque[0] = 0;
  v21.opaque[1] = 0;
  os_activity_scope_enter(v3, &v21);
  v4 = sub_1000604F0();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v23 = self;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: entered.", buf, 0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation observer](self, "observer"));
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation observer](self, "observer"));
    objc_msgSend(v7, "operationDidStart:", self);

  }
  v8 = sub_100060640();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = -[MSDOperation signpostId](self, "signpostId");
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v11 = v10;
    if (os_signpost_enabled(v9))
    {
      *(_DWORD *)buf = 138412290;
      v23 = self;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, v11, "Perform Operation", "Operation name: %{xcode:string}@", buf, 0xCu);
    }
  }

  -[MSDOperation execute](self, "execute");
  v12 = sub_100060640();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  v14 = -[MSDOperation signpostId](self, "signpostId");
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v15 = v14;
    if (os_signpost_enabled(v13))
    {
      v16 = -[MSDOperation result](self, "result");
      *(_DWORD *)buf = 138412546;
      v23 = self;
      v24 = 1024;
      v25 = v16;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_END, v15, "Perform Operation", "Operation name: %{xcode:string}@ result: %{xcode:BOOLean}d", buf, 0x12u);
    }
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation observer](self, "observer"));
  if (v17)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation observer](self, "observer"));
    objc_msgSend(v18, "operationWillFinish:", self);

  }
  v19 = sub_1000604F0();
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v23 = self;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: will return.", buf, 0xCu);
  }

  os_activity_scope_leave(&v21);
}

- (void)addObserver:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "conformsToProtocol:", &OBJC_PROTOCOL___MSDOperationObserver) & 1) == 0)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MSDOperation.m"), 116, CFSTR("Observer does not conform to protocol"));

  }
  -[MSDOperation setObserver:](self, "setObserver:", v6);

}

- (id)methodSelectors
{
  return +[NSArray array](NSArray, "array");
}

- (void)execute
{
  id v3;
  __int128 v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  const char *v10;
  NSString *v11;
  void *v12;
  uint64_t (*v13)(MSDOperation *, const char *);
  id v14;
  NSObject *v15;
  unint64_t v16;
  os_signpost_id_t v17;
  int v18;
  id v19;
  NSObject *v20;
  unint64_t v21;
  os_signpost_id_t v22;
  unsigned int v23;
  uint64_t v24;
  id v25;
  NSObject *v26;
  __int128 v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  void *v34;
  _BYTE v35[128];

  if (-[MSDOperation canPassCheckpoint](self, "canPassCheckpoint"))
  {
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(-[MSDOperation methodSelectors](self, "methodSelectors"));
    v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
    if (v3)
    {
      v5 = v3;
      v6 = *(_QWORD *)v30;
      *(_QWORD *)&v4 = 67109120;
      v27 = v4;
      while (2)
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v30 != v6)
            objc_enumerationMutation(obj);
          v8 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
          v9 = objc_autoreleasePoolPush();
          v10 = (const char *)objc_msgSend(v8, "pointerValue");
          v11 = NSStringFromSelector(v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
          v13 = (uint64_t (*)(MSDOperation *, const char *))-[MSDOperation methodForSelector:](self, "methodForSelector:", v10);
          v14 = sub_100060640();
          v15 = objc_claimAutoreleasedReturnValue(v14);
          v16 = -[MSDOperation signpostId](self, "signpostId");
          if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            v17 = v16;
            if (os_signpost_enabled(v15))
            {
              *(_DWORD *)buf = 138412290;
              v34 = v12;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_INTERVAL_BEGIN, v17, "Execute Method Selector", "Selector name: %{xcode:string}@", buf, 0xCu);
            }
          }

          v18 = v13(self, v10);
          v19 = sub_100060640();
          v20 = objc_claimAutoreleasedReturnValue(v19);
          v21 = -[MSDOperation signpostId](self, "signpostId");
          if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
          {
            v22 = v21;
            if (os_signpost_enabled(v20))
            {
              *(_DWORD *)buf = v27;
              LODWORD(v34) = v18;
              _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_INTERVAL_END, v22, "Execute Method Selector", "Selector result: %{xcode:BOOLean}d", buf, 8u);
            }
          }

          if ((v18 & 1) == 0)
          {
            v25 = sub_1000604F0();
            v26 = objc_claimAutoreleasedReturnValue(v25);
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
              sub_1000C1E40((uint64_t)v12, v26);

            objc_autoreleasePoolPop(v9);
LABEL_21:
            v24 = 0;
            goto LABEL_22;
          }
          v23 = -[MSDOperation canPassCheckpoint](self, "canPassCheckpoint");

          objc_autoreleasePoolPop(v9);
          if (!v23)
            goto LABEL_21;
        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v35, 16);
        if (v5)
          continue;
        break;
      }
    }
    v24 = 1;
LABEL_22:

  }
  else
  {
    v24 = 0;
  }
  -[MSDOperation setResult:](self, "setResult:", v24, v27);
}

- (BOOL)canPassCheckpoint
{
  id v3;
  NSObject *v4;
  const char *v5;
  id v6;
  BOOL v7;
  void *v9;
  unsigned int v10;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  unint64_t v15;
  os_signpost_id_t v16;
  void *v17;
  id v18;
  NSObject *v19;
  unint64_t v20;
  os_signpost_id_t v21;
  id v22;
  int v23;
  MSDOperation *v24;

  if (-[MSDOperation isCancelled](self, "isCancelled"))
  {
    v3 = sub_1000604F0();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 138543362;
      v24 = self;
      v5 = "%{public}@ is cancelled.";
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v23, 0xCu);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (-[MSDOperation skipped](self, "skipped"))
  {
    v6 = sub_1000604F0();
    v4 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 138543362;
      v24 = self;
      v5 = "%{public}@ is skipped.";
      goto LABEL_7;
    }
LABEL_8:
    v7 = 0;
    goto LABEL_9;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation checkpointBarrier](self, "checkpointBarrier"));
  v10 = objc_msgSend(v9, "activated");

  if (!v10)
    return 1;
  v11 = sub_1000604F0();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v23 = 138543362;
    v24 = self;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ is halted by checkpoint barrier.", (uint8_t *)&v23, 0xCu);
  }

  v13 = sub_100060640();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  v15 = -[MSDOperation signpostId](self, "signpostId");
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v16 = v15;
    if (os_signpost_enabled(v14))
    {
      v23 = 138412290;
      v24 = self;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_BEGIN, v16, "Encounter Checkpoint Barrier", "Operation name: %{xcode:string}@", (uint8_t *)&v23, 0xCu);
    }
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation checkpointBarrier](self, "checkpointBarrier"));
  objc_msgSend(v17, "waitUntilClear");

  v18 = sub_100060640();
  v19 = objc_claimAutoreleasedReturnValue(v18);
  v20 = -[MSDOperation signpostId](self, "signpostId");
  if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v21 = v20;
    if (os_signpost_enabled(v19))
    {
      LOWORD(v23) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_INTERVAL_END, v21, "Encounter Checkpoint Barrier", (const char *)&unk_10012A35F, (uint8_t *)&v23, 2u);
    }
  }

  v22 = sub_1000604F0();
  v4 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v23 = 138543362;
    v24 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ is free of checkpoint barrier.", (uint8_t *)&v23, 0xCu);
  }
  v7 = 1;
LABEL_9:

  return v7;
}

- (BOOL)isRoot
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation dependencies](self, "dependencies"));
  v3 = objc_msgSend(v2, "count") == 0;

  return v3;
}

- (BOOL)isLeaf
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation dependents](self, "dependents"));
  v3 = objc_msgSend(v2, "count") == 0;

  return v3;
}

- (BOOL)isAllDependentInComponentCancelled
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation dependents](self, "dependents", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation component](self, "component"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "component"));

        if (v9 == v10 && !objc_msgSend(v8, "isCancelled"))
        {
          v11 = 0;
          goto LABEL_12;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v5)
        continue;
      break;
    }
  }
  v11 = 1;
LABEL_12:

  return v11;
}

- (void)addDependency:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MSDOperation;
  v4 = a3;
  -[MSDOperation addDependency:](&v6, "addDependency:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dependents", v6.receiver, v6.super_class));

  objc_msgSend(v5, "addObject:", self);
}

- (void)produceNewDependentOperation:(id)a3 forRollback:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  dispatch_queue_global_t global_queue;
  NSObject *v11;
  _QWORD block[5];
  id v13;
  BOOL v14;
  uint8_t buf[4];
  MSDOperation *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  _BOOL4 v20;

  v4 = a4;
  v6 = a3;
  v7 = sub_1000604F0();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v16 = self;
    v17 = 2114;
    v18 = v6;
    v19 = 1026;
    v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: New dependent operation produced: %{public}@ for rollback: %{public, BOOL}d", buf, 0x1Cu);
  }

  objc_msgSend(v6, "addDependency:", self);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation observer](self, "observer"));

  if (v9)
  {
    global_queue = dispatch_get_global_queue(21, 0);
    v11 = objc_claimAutoreleasedReturnValue(global_queue);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000666F0;
    block[3] = &unk_10013EB00;
    block[4] = self;
    v13 = v6;
    v14 = v4;
    dispatch_async(v11, block);

  }
}

- (id)allDependentOperations
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = objc_alloc_init((Class)NSMutableSet);
  v4 = objc_alloc_init((Class)NSMutableArray);
  objc_msgSend(v4, "addObject:", self);
  while (objc_msgSend(v4, "count"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndex:", 0));
    objc_msgSend(v4, "removeObjectAtIndex:", 0);
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v15 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dependents"));
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "component"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation component](self, "component"));

          if (v12 == v13 && (objc_msgSend(v3, "containsObject:", v11) & 1) == 0)
          {
            objc_msgSend(v3, "addObject:", v11);
            objc_msgSend(v4, "addObject:", v11);
          }
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
    }

  }
  return v3;
}

- (BOOL)rollback
{
  return 1;
}

- (id)description
{
  unsigned int v3;
  __CFString *v4;
  __CFString *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = -[MSDOperation result](self, "result");
  v4 = CFSTR("NO");
  if (v3)
    v4 = CFSTR("YES");
  v5 = v4;
  v6 = -[MSDOperation flag](self, "flag");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation identifier](self, "identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperation context](self, "context"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "uniqueName"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: Name=%@ Result=%@ Flag=%lx>"), v7, v9, v5, v6));

  return v10;
}

- (BOOL)runInstallInParallel
{
  return 0;
}

- (MSDComponent)component
{
  return self->_component;
}

- (void)setComponent:(id)a3
{
  objc_storeStrong((id *)&self->_component, a3);
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (unint64_t)signpostId
{
  return self->_signpostId;
}

- (void)setSignpostId:(unint64_t)a3
{
  self->_signpostId = a3;
}

- (NSMutableSet)dependents
{
  return self->_dependents;
}

- (void)setDependents:(id)a3
{
  objc_storeStrong((id *)&self->_dependents, a3);
}

- (BOOL)result
{
  return self->_result;
}

- (void)setResult:(BOOL)a3
{
  self->_result = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (unint64_t)flag
{
  return self->_flag;
}

- (void)setFlag:(unint64_t)a3
{
  self->_flag = a3;
}

- (MSDOperationBarrier)checkpointBarrier
{
  return self->_checkpointBarrier;
}

- (void)setCheckpointBarrier:(id)a3
{
  objc_storeStrong((id *)&self->_checkpointBarrier, a3);
}

- (MSDOperationObserver)observer
{
  return (MSDOperationObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void)setObserver:(id)a3
{
  objc_storeWeak((id *)&self->_observer, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_checkpointBarrier, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_dependents, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_component, 0);
}

@end
