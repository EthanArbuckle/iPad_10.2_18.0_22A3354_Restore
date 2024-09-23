@implementation _DASAssertion

- (id)_initWithUnderlyingAssertion:(id)a3 forPid:(int)a4
{
  id v7;
  _DASAssertion *v8;
  _DASAssertion *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_DASAssertion;
  v8 = -[_DASAssertion init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeStrong(&v8->_underlyingAssertion, a3);
    v9->_pid = a4;
    v9->_lock._os_unfair_lock_opaque = 0;
  }

  return v9;
}

- (_DASAssertion)initWithRBSAssertion:(id)a3 forPid:(int)a4
{
  uint64_t v4;
  id v6;
  _DASAssertion *v7;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = -[_DASAssertion _initWithUnderlyingAssertion:forPid:](self, "_initWithUnderlyingAssertion:forPid:", v6, v4);
  if (v7)
    objc_msgSend(v6, "addObserver:", v7);

  return v7;
}

- (BOOL)acquireWithError:(id *)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_DASAssertion underlyingAssertion](self, "underlyingAssertion"));
  LOBYTE(a3) = objc_msgSend(v4, "acquireWithError:", a3);

  return (char)a3;
}

- (BOOL)invalidateWithError:(id *)a3
{
  return -[_DASAssertion _invalidateCallingHandler:withError:](self, "_invalidateCallingHandler:withError:", 1, a3);
}

- (BOOL)_invalidateCallingHandler:(BOOL)a3 withError:(id *)a4
{
  _BOOL4 v5;
  void *v7;
  unsigned __int8 v8;
  dispatch_queue_global_t global_queue;
  NSObject *v10;
  _QWORD v12[4];
  id v13;
  id location;

  v5 = a3;
  if (!-[_DASAssertion isValid](self, "isValid"))
    return 1;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_DASAssertion underlyingAssertion](self, "underlyingAssertion"));
  v8 = objc_msgSend(v7, "invalidateWithError:", a4);

  if (v5)
  {
    objc_initWeak(&location, self);
    global_queue = dispatch_get_global_queue(0, 0);
    v10 = objc_claimAutoreleasedReturnValue(global_queue);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1000D6470;
    v12[3] = &unk_10015D9E0;
    objc_copyWeak(&v13, &location);
    dispatch_async(v10, v12);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  return v8;
}

- (BOOL)invalidateAndKillWithExplanation:(id)a3 code:(unint64_t)a4 error:(id *)a5
{
  id v8;
  id v9;
  BOOL v10;
  void *v11;
  void *v12;
  id v13;
  unsigned __int8 v14;
  id v15;
  NSObject *v16;
  id v18;

  v8 = a3;
  if (-[_DASAssertion isValid](self, "isValid"))
  {
    v9 = objc_msgSend(objc_alloc((Class)RBSTerminateContext), "initWithExplanation:", v8);
    v10 = 1;
    objc_msgSend(v9, "setReportType:", 1);
    objc_msgSend(v9, "setExceptionCode:", a4);
    objc_msgSend(v9, "setMaximumTerminationResistance:", 20);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessIdentifier identifierWithPid:](RBSProcessIdentifier, "identifierWithPid:", -[_DASAssertion pid](self, "pid")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[RBSProcessPredicate predicateMatchingIdentifier:](RBSProcessPredicate, "predicateMatchingIdentifier:", v11));

    v13 = objc_msgSend(objc_alloc((Class)RBSTerminateRequest), "initWithPredicate:context:", v12, v9);
    v18 = 0;
    v14 = objc_msgSend(v13, "execute:", &v18);
    v15 = v18;
    if ((v14 & 1) == 0)
    {
      v16 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("bar")));
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        sub_1000EB894(self, (uint64_t)v15, v16);

      v10 = -[_DASAssertion invalidateWithError:](self, "invalidateWithError:", a5);
    }

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

- (BOOL)isValid
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_DASAssertion underlyingAssertion](self, "underlyingAssertion"));
  v3 = objc_msgSend(v2, "isValid");

  return v3;
}

- (void)_callInvalidationHandler:(BOOL)a3
{
  _BOOL8 v3;
  os_unfair_lock_s *p_lock;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void (**v11)(_QWORD, _QWORD);
  int v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;

  v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_DASAssertion invalidationHandler](self, "invalidationHandler"));

  if (v6)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("bar")));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_claimAutoreleasedReturnValue(-[_DASAssertion underlyingAssertion](self, "underlyingAssertion"));
      v9 = (void *)v8;
      v10 = CFSTR("NO");
      if (v3)
        v10 = CFSTR("YES");
      v12 = 138412546;
      v13 = v8;
      v14 = 2112;
      v15 = v10;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Calling invalidation handler for assertion %@, server-initiated: %@", (uint8_t *)&v12, 0x16u);

    }
    v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[_DASAssertion invalidationHandler](self, "invalidationHandler"));
    -[_DASAssertion setInvalidationHandler:](self, "setInvalidationHandler:", 0);
    -[_DASAssertion setWarningHandler:](self, "setWarningHandler:", 0);
    os_unfair_lock_unlock(p_lock);
    if (v11)
    {
      v11[2](v11, v3);

    }
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)_callWarningHandler
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void (**v5)(_QWORD);

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_DASAssertion warningHandler](self, "warningHandler"));

  if (v4)
  {
    v5 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue(-[_DASAssertion warningHandler](self, "warningHandler"));
    -[_DASAssertion setWarningHandler:](self, "setWarningHandler:", 0);
    os_unfair_lock_unlock(p_lock);
    if (v5)
    {
      v5[2](v5);

    }
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
  }
}

- (void)assertion:(id)a3 didInvalidateWithError:(id)a4
{
  id v5;
  NSObject *v6;
  int v7;
  id v8;

  v5 = a3;
  v6 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("bar")));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Did invalidate assertion %@", (uint8_t *)&v7, 0xCu);
  }

  -[_DASAssertion _callInvalidationHandler:](self, "_callInvalidationHandler:", 1);
}

- (void)assertionWillInvalidate:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("bar")));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Will invalidate assertion %@", (uint8_t *)&v6, 0xCu);
  }

  -[_DASAssertion _callWarningHandler](self, "_callWarningHandler");
}

- (NSString)description
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_DASAssertion underlyingAssertion](self, "underlyingAssertion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("_DASAssertion for underlying assertion: %@"), v2));

  return (NSString *)v3;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;

  if (-[_DASAssertion isValid](self, "isValid"))
  {
    v3 = objc_claimAutoreleasedReturnValue(+[_DASDaemonLogger logForCategory:](_DASDaemonLogger, "logForCategory:", CFSTR("bar")));
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      sub_1000EB930((uint64_t)self, v3);

    -[_DASAssertion _invalidateCallingHandler:withError:](self, "_invalidateCallingHandler:withError:", 0, 0);
  }
  v4.receiver = self;
  v4.super_class = (Class)_DASAssertion;
  -[_DASAssertion dealloc](&v4, "dealloc");
}

- (id)underlyingAssertion
{
  return objc_getProperty(self, a2, 16, 1);
}

- (int)pid
{
  return self->_pid;
}

- (id)invalidationHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (id)warningHandler
{
  return objc_getProperty(self, a2, 32, 1);
}

- (void)setWarningHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (void)setLock:(os_unfair_lock_s)a3
{
  self->_lock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_warningHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_underlyingAssertion, 0);
}

@end
