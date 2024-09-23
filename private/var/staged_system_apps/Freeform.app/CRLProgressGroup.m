@implementation CRLProgressGroup

- (CRLProgressGroup)initWithChildren:(id)a3
{
  id v4;
  CRLProgressGroup *v5;
  NSArray *v6;
  NSArray *children;
  dispatch_queue_t v8;
  OS_dispatch_queue *childrenProgressObserversQueue;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CRLProgressGroup;
  v5 = -[CRLProgress initForSubclass](&v11, "initForSubclass");
  if (v5)
  {
    v6 = (NSArray *)objc_msgSend(v4, "copy");
    children = v5->_children;
    v5->_children = v6;

    v8 = dispatch_queue_create("com.apple.freeform.CRLProgressGroup", 0);
    childrenProgressObserversQueue = v5->_childrenProgressObserversQueue;
    v5->_childrenProgressObserversQueue = (OS_dispatch_queue *)v8;

  }
  return v5;
}

- (id)initForSubclass
{
  unsigned int v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  char *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint8_t buf[4];
  unsigned int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  int v18;

  v2 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101238518);
  v3 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    v12 = v2;
    v13 = 2082;
    v14 = "-[CRLProgressGroup initForSubclass]";
    v15 = 2082;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLProgress.m";
    v17 = 1024;
    v18 = 373;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_101238538);
  v4 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    v6 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v12 = v2;
    v13 = 2114;
    v14 = v6;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLProgressGroup initForSubclass]"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLUtility/CRLProgress.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 373, 0, "Do not call method");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s: %s"), "Do not call method", "-[CRLProgressGroup initForSubclass]"));
  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v9, 0));

  objc_exception_throw(v10);
}

- (double)value
{
  NSArray *v2;
  id v3;
  id v4;
  uint64_t v5;
  double v6;
  void *i;
  double v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = self->_children;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    v6 = 0.0;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), "value", (_QWORD)v10);
        v6 = v6 + v8;
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v6 = 0.0;
  }

  return v6;
}

- (double)maxValue
{
  NSArray *v2;
  id v3;
  id v4;
  uint64_t v5;
  double v6;
  void *i;
  double v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = self->_children;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    v6 = 0.0;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), "maxValue", (_QWORD)v10);
        v6 = v6 + v8;
      }
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v6 = 0.0;
  }

  return v6;
}

- (BOOL)isIndeterminate
{
  NSArray *v3;
  id v4;
  uint64_t v5;
  void *i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  if (-[NSArray count](self->_children, "count"))
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v3 = self->_children;
    v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = *(_QWORD *)v9;
      while (2)
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(v3);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)i), "isIndeterminate", (_QWORD)v8) & 1) != 0)
          {
            LOBYTE(v4) = 1;
            goto LABEL_12;
          }
        }
        v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
        if (v4)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    LOBYTE(v4) = 1;
  }
  return (char)v4;
}

- (id)addProgressObserverWithValueInterval:(double)a3 queue:(id)a4 handler:(id)a5
{
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CRLProgressGroup;
  v6 = -[CRLProgress addProgressObserverWithValueInterval:queue:handler:](&v9, "addProgressObserverWithValueInterval:queue:handler:", a4, a5, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  -[CRLProgressGroup p_updateChildrenProgressObservers](self, "p_updateChildrenProgressObservers");
  return v7;
}

- (void)removeProgressObserver:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLProgressGroup;
  -[CRLProgress removeProgressObserver:](&v4, "removeProgressObserver:", a3);
  -[CRLProgressGroup p_updateChildrenProgressObservers](self, "p_updateChildrenProgressObservers");
}

- (void)p_updateChildrenProgressObservers
{
  NSObject *childrenProgressObserversQueue;
  uint64_t v4;
  _QWORD v5[6];

  -[CRLProgress protected_minProgressObserverValueInterval](self, "protected_minProgressObserverValueInterval");
  childrenProgressObserversQueue = self->_childrenProgressObserversQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100106880;
  v5[3] = &unk_10122DCC8;
  v5[4] = self;
  v5[5] = v4;
  dispatch_async(childrenProgressObserversQueue, v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childrenProgressObserversQueue, 0);
  objc_storeStrong((id *)&self->_childrenProgressObservers, 0);
  objc_storeStrong((id *)&self->_children, 0);
}

@end
