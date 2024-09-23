@implementation STUConditionMonitor

- (void)dealloc
{
  objc_super v3;

  -[STUConditionMonitor endObserving](self, "endObserving");
  -[STUConditionMonitor setConditionMatcher:](self, "setConditionMatcher:", 0);
  -[STUConditionMonitor setCompletionHandler:](self, "setCompletionHandler:", 0);
  v3.receiver = self;
  v3.super_class = (Class)STUConditionMonitor;
  -[STUConditionMonitor dealloc](&v3, "dealloc");
}

- (id)initObservingObject:(id)a3 keyPaths:(id)a4 condition:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  STUConditionMonitor *v14;
  STUConditionMonitor *v15;
  NSArray *v16;
  NSArray *paths;
  id v18;
  id conditionMatcher;
  id v20;
  id completionHandler;
  objc_super v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v23.receiver = self;
  v23.super_class = (Class)STUConditionMonitor;
  v14 = -[STUConditionMonitor init](&v23, "init");
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_observedObject, v10);
    v16 = (NSArray *)objc_msgSend(v11, "copy");
    paths = v15->_paths;
    v15->_paths = v16;

    v18 = objc_retainBlock(v12);
    conditionMatcher = v15->_conditionMatcher;
    v15->_conditionMatcher = v18;

    v20 = objc_retainBlock(v13);
    completionHandler = v15->_completionHandler;
    v15->_completionHandler = v20;

    -[STUConditionMonitor beginObserving](v15, "beginObserving");
  }

  return v15;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v7;
  void *v8;
  uint64_t (**v9)(void);
  int v10;
  _QWORD block[5];
  objc_super v12;

  if (a6 == CFSTR("KVOContext"))
  {
    v7 = objc_claimAutoreleasedReturnValue(-[STUConditionMonitor conditionMatcher](self, "conditionMatcher", a3, a4, a5));
    if (v7)
    {
      v8 = (void *)v7;
      v9 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(-[STUConditionMonitor conditionMatcher](self, "conditionMatcher"));
      v10 = v9[2]();

      if (v10)
      {
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_1000105D4;
        block[3] = &unk_1000C97E8;
        block[4] = self;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
      }
    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)STUConditionMonitor;
    -[STUConditionMonitor observeValueForKeyPath:ofObject:change:context:](&v12, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (void)beginObserving
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUConditionMonitor paths](self, "paths", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[STUConditionMonitor observedObject](self, "observedObject"));
        objc_msgSend(v9, "addObserver:forKeyPath:options:context:", self, v8, 4, CFSTR("KVOContext"));

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (void)endObserving
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[STUConditionMonitor paths](self, "paths", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[STUConditionMonitor observedObject](self, "observedObject"));
        objc_msgSend(v9, "removeObserver:forKeyPath:context:", self, v8, CFSTR("KVOContext"));

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (void)fire
{
  void *v4;
  void *v5;
  NSString *v6;
  void *v7;
  void (**v8)(void);

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    v6 = NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STUConditionMonitor.m"), 87, CFSTR("%@ must be called from the main thread"), v7);

  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[STUConditionMonitor completionHandler](self, "completionHandler"));

  if (v4)
  {
    v8 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[STUConditionMonitor completionHandler](self, "completionHandler"));
    -[STUConditionMonitor endObserving](self, "endObserving");
    -[STUConditionMonitor setConditionMatcher:](self, "setConditionMatcher:", 0);
    -[STUConditionMonitor setCompletionHandler:](self, "setCompletionHandler:", 0);
    -[STUConditionMonitor setObservedObject:](self, "setObservedObject:", 0);
    v8[2]();

  }
}

- (NSObject)observedObject
{
  return objc_loadWeakRetained((id *)&self->_observedObject);
}

- (void)setObservedObject:(id)a3
{
  objc_storeWeak((id *)&self->_observedObject, a3);
}

- (NSArray)paths
{
  return self->_paths;
}

- (id)conditionMatcher
{
  return self->_conditionMatcher;
}

- (void)setConditionMatcher:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_conditionMatcher, 0);
  objc_storeStrong((id *)&self->_paths, 0);
  objc_destroyWeak((id *)&self->_observedObject);
}

@end
