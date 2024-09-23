@implementation MSDComponentManager

- (MSDComponentManager)initWithComponents:(id)a3 andProcessor:(id)a4
{
  id v6;
  id v7;
  MSDComponentManager *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  id v22;
  NSObject *v23;
  uint64_t v24;
  uint8_t v26[16];
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  _BYTE v32[128];

  v6 = a3;
  v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)MSDComponentManager;
  v8 = -[MSDComponentManager init](&v31, "init");
  if (v8)
  {
    v9 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 0);
    -[MSDComponentManager setActiveComponents:](v8, "setActiveComponents:", v9);

    v10 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 0);
    -[MSDComponentManager setRetryableComponents:](v8, "setRetryableComponents:", v10);

    v11 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 0);
    -[MSDComponentManager setRemovableComponents:](v8, "setRemovableComponents:", v11);

    v12 = objc_msgSend(v6, "mutableCopy");
    -[MSDComponentManager setPendingComponents:](v8, "setPendingComponents:", v12);

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "reverseObjectEnumerator"));
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v28;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v28 != v16)
            objc_enumerationMutation(v13);
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)v17), "createRemovableCounterpartComponent"));
          if (v18)
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentManager removableComponents](v8, "removableComponents"));
            objc_msgSend(v19, "addObject:", v18);

          }
          v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v15);
    }

    -[MSDComponentManager setComponentProcessor:](v8, "setComponentProcessor:", v7);
    -[MSDComponentManager setComponentListLock:](v8, "setComponentListLock:", 0);
    if (os_variant_has_internal_content("com.apple.mobilestoredemod")
      && (v20 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTestPreferences sharedInstance](MSDTestPreferences, "sharedInstance")),
          v21 = objc_msgSend(v20, "disableParallelProcessing"),
          v20,
          v21))
    {
      v22 = sub_1000604F0();
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v26 = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Disabling parallel processing as requested.", v26, 2u);
      }

      v24 = 0;
    }
    else
    {
      v24 = 1;
    }
    -[MSDComponentManager setParallelProcessing:](v8, "setParallelProcessing:", v24);
  }

  return v8;
}

- (void)startProcessingAllComponents
{
  id v3;
  NSObject *v4;
  os_unfair_lock_s *p_componentListLock;
  void *v6;
  int v7;
  const char *v8;

  v3 = sub_1000604F0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[MSDComponentManager startProcessingAllComponents]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v7, 0xCu);
  }

  p_componentListLock = &self->_componentListLock;
  os_unfair_lock_lock(&self->_componentListLock);
  -[MSDComponentManager _enforceFreeDiskSpaceRequirement](self, "_enforceFreeDiskSpaceRequirement");
  -[MSDComponentManager _startProcessingComponentsOnRetry:](self, "_startProcessingComponentsOnRetry:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentManager componentProcessor](self, "componentProcessor"));
  objc_msgSend(v6, "resume");

  os_unfair_lock_unlock(p_componentListLock);
}

- (BOOL)waitForProcessingCompletionTillDate:(id)a3 outError:(id *)a4
{
  id v6;
  dispatch_semaphore_t v7;
  id v8;
  NSObject *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  double v16;
  dispatch_time_t v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  id v22;
  BOOL v23;
  void *v24;
  id v25;
  NSObject *v26;
  _QWORD v28[4];
  NSObject *v29;
  uint64_t *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  id v45;

  v6 = a3;
  v7 = dispatch_semaphore_create(0);
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = sub_100008ED8;
  v40 = sub_100008EE8;
  v41 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v8 = sub_1000604F0();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v43 = "-[MSDComponentManager waitForProcessingCompletionTillDate:outError:]";
    v44 = 2114;
    v45 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: entered with deadline %{public}@", buf, 0x16u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentManager activeComponents](self, "activeComponents"));
  v11 = objc_msgSend(v10, "count") == 0;

  if (!v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100008EF0;
    v28[3] = &unk_10013D970;
    v30 = &v32;
    v31 = &v36;
    v14 = v7;
    v29 = v14;
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "addObserverForName:object:queue:usingBlock:", CFSTR("MSDComponentManagerComplete"), 0, v13, v28));

    if (v6)
    {
      objc_msgSend(v6, "timeIntervalSinceNow");
      v17 = dispatch_time(0, (uint64_t)(v16 * 1000000000.0));
      if (dispatch_semaphore_wait(v14, v17))
      {
        v18 = sub_1000604F0();
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Timed out waiting for processing of all components to complete.", buf, 2u);
        }

        v20 = objc_claimAutoreleasedReturnValue(+[NSError errorDomainMSDWithCode:message:](NSError, "errorDomainMSDWithCode:message:", 3727741184, CFSTR("Cannot finish update within given time.")));
        v21 = (void *)v37[5];
        v37[5] = v20;

        -[MSDComponentManager _cancelAllOperations](self, "_cancelAllOperations");
      }
      if (!a4)
      {
LABEL_10:
        if (!v15)
          goto LABEL_18;
        goto LABEL_17;
      }
    }
    else
    {
      dispatch_semaphore_wait(v14, 0xFFFFFFFFFFFFFFFFLL);
      if (!a4)
        goto LABEL_10;
    }
    *a4 = objc_retainAutorelease((id)v37[5]);
    if (!v15)
    {
LABEL_18:
      v25 = sub_1000604F0();
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v43 = "-[MSDComponentManager waitForProcessingCompletionTillDate:outError:]";
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%s: will return.", buf, 0xCu);
      }

      v23 = *((_BYTE *)v33 + 24) != 0;
      goto LABEL_21;
    }
LABEL_17:
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v24, "removeObserver:", v15);

    goto LABEL_18;
  }
  v22 = sub_1000604F0();
  v15 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "No more active component to process.", buf, 2u);
  }
  v23 = 1;
LABEL_21:

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

  return v23;
}

- (void)pauseProcessing
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;

  v3 = sub_1000604F0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[MSDComponentManager pauseProcessing]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s called.", (uint8_t *)&v6, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentManager componentProcessor](self, "componentProcessor"));
  objc_msgSend(v5, "suspend");

}

- (void)resumeProcessing
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;

  v3 = sub_1000604F0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[MSDComponentManager resumeProcessing]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s called.", (uint8_t *)&v6, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentManager componentProcessor](self, "componentProcessor"));
  objc_msgSend(v5, "resume");

}

- (void)abortProcessing
{
  void *v3;
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorDomainMSDWithCode:message:](NSError, "errorDomainMSDWithCode:message:", 3727741185, CFSTR("Operation canceled.")));
  v4 = sub_1000604F0();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[MSDComponentManager abortProcessing]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v6, 0xCu);
  }

  -[MSDComponentManager _cancelAllOperations](self, "_cancelAllOperations");
  -[MSDComponentManager _postCompletionNotificationWithResult:andError:](self, "_postCompletionNotificationWithResult:andError:", 0, v3);

}

- (void)_startProcessingComponentsOnRetry:(BOOL)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  -[MSDComponentManager _setupInterComponentDependencyOnRetry:](self, "_setupInterComponentDependencyOnRetry:", a3);
  if (-[MSDComponentManager parallelProcessing](self, "parallelProcessing"))
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentManager activeComponents](self, "activeComponents", 0));
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          -[MSDComponentManager _dispatchComponent:](self, "_dispatchComponent:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8));
          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
  else
  {
    -[MSDComponentManager _dispatchNextComponent](self, "_dispatchNextComponent");
  }
}

- (void)_cancelAllOperations
{
  os_unfair_lock_s *p_componentListLock;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  p_componentListLock = &self->_componentListLock;
  os_unfair_lock_lock(&self->_componentListLock);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentManager activeComponents](self, "activeComponents"));
  objc_msgSend(v4, "removeAllObjects");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentManager retryableComponents](self, "retryableComponents"));
  objc_msgSend(v5, "removeAllObjects");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentManager removableComponents](self, "removableComponents"));
  objc_msgSend(v6, "removeAllObjects");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentManager pendingComponents](self, "pendingComponents"));
  objc_msgSend(v7, "removeAllObjects");

  os_unfair_lock_unlock(p_componentListLock);
  v8 = (id)objc_claimAutoreleasedReturnValue(-[MSDComponentManager componentProcessor](self, "componentProcessor"));
  objc_msgSend(v8, "cancel");

}

- (void)_dispatchNextComponent
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentManager activeComponents](self, "activeComponents"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));

  if (v4)
  {
    v5 = sub_1000604F0();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "name"));
      v8 = 138543362;
      v9 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Dispatching component %{public}@ ...", (uint8_t *)&v8, 0xCu);

    }
    -[MSDComponentManager _dispatchComponent:](self, "_dispatchComponent:", v4);
  }

}

- (void)_postCompletionNotificationWithResult:(BOOL)a3 andError:(id)a4
{
  _BOOL8 v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v8 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", 2));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4));
  objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("Result"));

  if (v8)
    objc_msgSend(v5, "setObject:forKey:", v8, CFSTR("Error"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("MSDComponentManagerComplete"), 0, v5);

}

- (void)_dispatchComponent:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "addObserver:", self);
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MSDComponentManager componentProcessor](self, "componentProcessor"));
  objc_msgSend(v5, "process:", v4);

}

- (void)_handleNewOperationStagedForComponent:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;

  v4 = a3;
  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543362;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "New operation staged for component: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentManager componentProcessor](self, "componentProcessor"));
  objc_msgSend(v7, "process:", v4);

}

- (void)_handleCompleteComponent:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  MSDComponentManager *v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  NSObject *v22;
  _BOOL4 v23;
  int v24;
  id v25;

  v4 = a3;
  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v24 = 138543362;
    v25 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "All operations complete for component: %{public}@", (uint8_t *)&v24, 0xCu);
  }

  os_unfair_lock_lock(&self->_componentListLock);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentManager activeComponents](self, "activeComponents"));
  objc_msgSend(v7, "removeObject:", v4);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentManager activeComponents](self, "activeComponents"));
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    if (!-[MSDComponentManager parallelProcessing](self, "parallelProcessing"))
      -[MSDComponentManager _dispatchNextComponent](self, "_dispatchNextComponent");
    goto LABEL_15;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentManager retryableComponents](self, "retryableComponents"));
  v11 = objc_msgSend(v10, "count");

  if (v11)
  {
    v12 = sub_1000604F0();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Processing retryable components...", (uint8_t *)&v24, 2u);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentManager activeComponents](self, "activeComponents"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentManager retryableComponents](self, "retryableComponents"));
    objc_msgSend(v14, "addObjectsFromArray:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentManager retryableComponents](self, "retryableComponents"));
    objc_msgSend(v16, "removeAllObjects");

    v17 = self;
    v18 = 1;
LABEL_14:
    -[MSDComponentManager _startProcessingComponentsOnRetry:](v17, "_startProcessingComponentsOnRetry:", v18);
    goto LABEL_15;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentManager pendingComponents](self, "pendingComponents"));
  v20 = objc_msgSend(v19, "count");

  v21 = sub_1000604F0();
  v22 = objc_claimAutoreleasedReturnValue(v21);
  v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
  if (v20)
  {
    if (v23)
    {
      LOWORD(v24) = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Processing pending components...", (uint8_t *)&v24, 2u);
    }

    -[MSDComponentManager _enforceFreeDiskSpaceRequirement](self, "_enforceFreeDiskSpaceRequirement");
    v17 = self;
    v18 = 0;
    goto LABEL_14;
  }
  if (v23)
  {
    LOWORD(v24) = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "All components complete!", (uint8_t *)&v24, 2u);
  }

  -[MSDComponentManager _postCompletionNotificationWithResult:andError:](self, "_postCompletionNotificationWithResult:andError:", 1, 0);
LABEL_15:
  os_unfair_lock_unlock(&self->_componentListLock);

}

- (void)_handleRetryComponent:(id)a3 forComponent:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = sub_1000604F0();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    sub_1000B7C64((uint64_t)v6, v9);

  os_unfair_lock_lock(&self->_componentListLock);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentManager retryableComponents](self, "retryableComponents"));
  objc_msgSend(v10, "addObject:", v6);

  os_unfair_lock_unlock(&self->_componentListLock);
  -[MSDComponentManager _handleCompleteComponent:](self, "_handleCompleteComponent:", v7);

}

- (void)_enforceFreeDiskSpaceRequirement
{
  id v3;
  void *v4;
  _BYTE *v5;
  unint64_t v6;
  id v7;
  NSObject *v8;
  __int128 v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  _BYTE *v15;
  void *v16;
  _BYTE *v17;
  id v18;
  NSObject *v19;
  BOOL v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  _BOOL4 v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  NSObject *v34;
  void *v35;
  __int128 v36;
  MSDComponentManager *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  unint64_t v43;
  __int16 v44;
  id v45;
  __int16 v46;
  _BYTE *v47;
  _BYTE v48[128];

  v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDTargetDevice sharedInstance](MSDTargetDevice, "sharedInstance"));
  v5 = objc_msgSend(v4, "getFreeSpace");

  v6 = -[MSDComponentManager _calculateFreeSpaceToReserve:](self, "_calculateFreeSpaceToReserve:", v5);
  v7 = sub_1000604F0();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v43 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Trying to enforce free disk space requirement:  %{iec-bytes}llu", buf, 0xCu);
  }

  *(_QWORD *)&v9 = 138543362;
  v36 = v9;
  v37 = self;
  while (1)
  {
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentManager pendingComponents](self, "pendingComponents", v36));
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v39;
      while (2)
      {
        v14 = 0;
        v15 = v5;
        do
        {
          if (*(_QWORD *)v39 != v13)
            objc_enumerationMutation(v10);
          v16 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)v14);
          v17 = objc_msgSend(v16, "diskSpaceRequired");
          v18 = sub_1000604F0();
          v19 = objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543874;
            v43 = (unint64_t)v16;
            v44 = 2048;
            v45 = v17;
            v46 = 2048;
            v47 = v15;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: Free space needed=%{iec-bytes}llu, Free space left=%{iec-bytes}llu", buf, 0x20u);
          }

          v20 = v15 >= v17;
          v5 = (_BYTE *)(v15 - v17);
          if (v5 == 0 || !v20 || (unint64_t)v5 <= v6)
          {
            v21 = sub_1000604F0();
            v22 = objc_claimAutoreleasedReturnValue(v21);
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v36;
              v43 = (unint64_t)v16;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: Not enough free space left for this component.", buf, 0xCu);
            }

            v5 = v15;
            self = v37;
            goto LABEL_20;
          }
          objc_msgSend(v3, "addObject:", v16);
          v14 = (char *)v14 + 1;
          v15 = v5;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
        self = v37;
        if (v12)
          continue;
        break;
      }
    }
LABEL_20:

    if (objc_msgSend(v3, "count"))
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentManager activeComponents](self, "activeComponents"));
      objc_msgSend(v32, "addObjectsFromArray:", v3);

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentManager pendingComponents](self, "pendingComponents"));
      objc_msgSend(v24, "removeObjectsInArray:", v3);
      goto LABEL_33;
    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentManager removableComponents](self, "removableComponents"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "firstObject"));

    if (v24)
      break;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentManager pendingComponents](self, "pendingComponents"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "firstObject"));

    v27 = sub_1000604F0();
    v28 = objc_claimAutoreleasedReturnValue(v27);
    v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
    if (!v26)
    {
      if (v29)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "No more pending component to discard.", buf, 2u);
      }
      goto LABEL_32;
    }
    if (v29)
    {
      *(_DWORD *)buf = v36;
      v43 = (unint64_t)v26;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Discarding one pending component due to insufficient disk space: %{public}@", buf, 0xCu);
    }

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentManager activeComponents](self, "activeComponents"));
    objc_msgSend(v30, "addObject:", v26);

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentManager pendingComponents](self, "pendingComponents"));
    objc_msgSend(v31, "removeObject:", v26);

    objc_msgSend(v26, "discardStagedOperationsAndTriggerCompletion");
  }
  v33 = sub_1000604F0();
  v34 = objc_claimAutoreleasedReturnValue(v33);
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = v36;
    v43 = (unint64_t)v24;
    _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Removing existing component to free up disk space: %{public}@", buf, 0xCu);
  }

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentManager activeComponents](self, "activeComponents"));
  objc_msgSend(v35, "addObject:", v24);

  v28 = objc_claimAutoreleasedReturnValue(-[MSDComponentManager removableComponents](self, "removableComponents"));
  -[NSObject removeObject:](v28, "removeObject:", v24);
LABEL_32:

LABEL_33:
}

- (unint64_t)_calculateFreeSpaceToReserve:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  id v8;
  NSObject *v9;

  v4 = (void *)MGCopyAnswer(CFSTR("DiskUsage"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", kMGQDiskUsageAmountDataReserved));
  v6 = v5;
  if (v5)
  {
    v7 = (unint64_t)objc_msgSend(v5, "unsignedLongLongValue");
  }
  else
  {
    v8 = sub_1000604F0();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      sub_1000B7CD8(v9);

    v7 = 5 * a3 / 0x64;
  }

  return v7;
}

- (void)_setupInterComponentDependencyOnRetry:(BOOL)a3
{
  void *v5;
  _QWORD v6[6];
  BOOL v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[5];
  id v11;

  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = sub_100008ED8;
  v10[4] = sub_100008EE8;
  v11 = objc_alloc_init((Class)NSMutableDictionary);
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3032000000;
  v8[3] = sub_100008ED8;
  v8[4] = sub_100008EE8;
  v9 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDComponentManager activeComponents](self, "activeComponents"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000A0D4;
  v6[3] = &unk_10013D998;
  v7 = a3;
  v6[4] = v8;
  v6[5] = v10;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v6);

  _Block_object_dispose(v8, 8);
  _Block_object_dispose(v10, 8);

}

- (void)component:(id)a3 didProduceClonedComponent:(id)a4
{
  -[MSDComponentManager _handleRetryComponent:forComponent:](self, "_handleRetryComponent:forComponent:", a4, a3);
}

- (void)componentDidHaveNewOperationStaged:(id)a3
{
  -[MSDComponentManager _handleNewOperationStagedForComponent:](self, "_handleNewOperationStagedForComponent:", a3);
}

- (BOOL)result
{
  return self->_result;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 16, 1);
}

- (NSMutableArray)activeComponents
{
  return self->_activeComponents;
}

- (void)setActiveComponents:(id)a3
{
  objc_storeStrong((id *)&self->_activeComponents, a3);
}

- (NSMutableArray)retryableComponents
{
  return self->_retryableComponents;
}

- (void)setRetryableComponents:(id)a3
{
  objc_storeStrong((id *)&self->_retryableComponents, a3);
}

- (NSMutableArray)removableComponents
{
  return self->_removableComponents;
}

- (void)setRemovableComponents:(id)a3
{
  objc_storeStrong((id *)&self->_removableComponents, a3);
}

- (NSMutableArray)pendingComponents
{
  return self->_pendingComponents;
}

- (void)setPendingComponents:(id)a3
{
  objc_storeStrong((id *)&self->_pendingComponents, a3);
}

- (MSDComponentProcessor)componentProcessor
{
  return self->_componentProcessor;
}

- (void)setComponentProcessor:(id)a3
{
  objc_storeStrong((id *)&self->_componentProcessor, a3);
}

- (os_unfair_lock_s)componentListLock
{
  return self->_componentListLock;
}

- (void)setComponentListLock:(os_unfair_lock_s)a3
{
  self->_componentListLock = a3;
}

- (BOOL)parallelProcessing
{
  return self->_parallelProcessing;
}

- (void)setParallelProcessing:(BOOL)a3
{
  self->_parallelProcessing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_componentProcessor, 0);
  objc_storeStrong((id *)&self->_pendingComponents, 0);
  objc_storeStrong((id *)&self->_removableComponents, 0);
  objc_storeStrong((id *)&self->_retryableComponents, 0);
  objc_storeStrong((id *)&self->_activeComponents, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
