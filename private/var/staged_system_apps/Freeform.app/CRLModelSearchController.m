@implementation CRLModelSearchController

- (void)setEditingCoordinator:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_editingCoordinator);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_editingCoordinator, obj);
    -[CRLModelSearchController stopCountingHits](self, "stopCountingHits");
    v5 = obj;
  }

}

- (CRLModelSearchController)init
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
    dispatch_once(&qword_10147E370, &stru_10124D8D0);
  v3 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109890;
    v12 = v2;
    v13 = 2082;
    v14 = "-[CRLModelSearchController init]";
    v15 = 2082;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLModelSearchController.m";
    v17 = 1024;
    v18 = 81;
    _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Do not call method", buf, 0x22u);
  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10124D8F0);
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
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLModelSearchController init]"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLModelSearchController.m"));
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 81, 0, "Do not call method");

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s: %s"), "Do not call method", "-[CRLModelSearchController init]"));
  v10 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v9, 0));

  objc_exception_throw(v10);
}

- (CRLModelSearchController)initWithEditingCoordinator:(id)a3 delegate:(id)a4 modelSearchesRunSynchronously:(BOOL)a5
{
  id v8;
  id v9;
  CRLModelSearchController *v10;
  CRLModelSearchController *v11;
  uint64_t v12;
  NSMutableArray *layoutSearchResults;
  uint64_t v14;
  NSMutableDictionary *layoutSearchCountForRootIndexMap;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CRLModelSearchController;
  v10 = -[CRLModelSearchController init](&v17, "init");
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_editingCoordinator, v8);
    v12 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    layoutSearchResults = v11->_layoutSearchResults;
    v11->_layoutSearchResults = (NSMutableArray *)v12;

    v14 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    layoutSearchCountForRootIndexMap = v11->_layoutSearchCountForRootIndexMap;
    v11->_layoutSearchCountForRootIndexMap = (NSMutableDictionary *)v14;

    objc_storeWeak((id *)&v11->_findReplaceDelegate, v9);
    v11->_modelSearchesRunSynchronously = a5;
  }

  return v11;
}

- (void)setSearchProgressBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController progressBlock](self, "progressBlock"));

  if (v4 != v6)
  {
    -[CRLModelSearchController stopCountingHits](self, "stopCountingHits");
    -[CRLModelSearchController setProgressBlock:](self, "setProgressBlock:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController progressBlock](self, "progressBlock"));

    if (v5)
      -[CRLModelSearchController startCountingHits](self, "startCountingHits");
  }

}

- (unint64_t)searchResultsCount
{
  void *v3;
  id v4;
  unint64_t result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController layoutSearchResults](self, "layoutSearchResults"));
  v4 = objc_msgSend(v3, "count");

  result = -[CRLModelSearchController currentSearchResultsCount](self, "currentSearchResultsCount");
  if ((unint64_t)v4 > result)
    return (unint64_t)v4;
  return result;
}

- (_TtC8Freeform8CRLBoard)board
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController editingCoordinator](self, "editingCoordinator"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "mainBoard"));

  return (_TtC8Freeform8CRLBoard *)v3;
}

- (BOOL)searchCriteriaIsValid
{
  return 1;
}

- (BOOL)respondsToSearch
{
  unsigned int v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  Class v7;
  NSString *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  char *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  Class v16;
  NSString *v17;
  void *v18;
  uint64_t v19;
  Class v20;
  NSString *v21;
  void *v22;
  void *v23;
  id v24;
  uint8_t buf[4];
  unsigned int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  void *v34;

  v3 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10124D910);
  v4 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    objc_opt_class(self, v6);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    *(_DWORD *)buf = 67110146;
    v26 = v3;
    v27 = 2082;
    v28 = "-[CRLModelSearchController respondsToSearch]";
    v29 = 2082;
    v30 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLModelSearchController.m";
    v31 = 1024;
    v32 = 122;
    v33 = 2114;
    v34 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);

  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10124D930);
  v10 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v11 = v10;
    v12 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v26 = v3;
    v27 = 2114;
    v28 = v12;
    _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLModelSearchController respondsToSearch]"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLModelSearchController.m"));
  objc_opt_class(self, v15);
  v17 = NSStringFromClass(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 122, 0, "Abstract method not overridden by %{public}@", v18);

  objc_opt_class(self, v19);
  v21 = NSStringFromClass(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v22, "-[CRLModelSearchController respondsToSearch]"));
  v24 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v23, 0));

  objc_exception_throw(v24);
}

- (id)getNextSearchFromCurrentSearchable
{
  unsigned int v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  Class v7;
  NSString *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  char *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  Class v16;
  NSString *v17;
  void *v18;
  uint64_t v19;
  Class v20;
  NSString *v21;
  void *v22;
  void *v23;
  id v24;
  uint8_t buf[4];
  unsigned int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  void *v34;

  v3 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10124D950);
  v4 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    objc_opt_class(self, v6);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    *(_DWORD *)buf = 67110146;
    v26 = v3;
    v27 = 2082;
    v28 = "-[CRLModelSearchController getNextSearchFromCurrentSearchable]";
    v29 = 2082;
    v30 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLModelSearchController.m";
    v31 = 1024;
    v32 = 127;
    v33 = 2114;
    v34 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);

  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10124D970);
  v10 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v11 = v10;
    v12 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v26 = v3;
    v27 = 2114;
    v28 = v12;
    _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLModelSearchController getNextSearchFromCurrentSearchable]"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLModelSearchController.m"));
  objc_opt_class(self, v15);
  v17 = NSStringFromClass(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 127, 0, "Abstract method not overridden by %{public}@", v18);

  objc_opt_class(self, v19);
  v21 = NSStringFromClass(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v22, "-[CRLModelSearchController getNextSearchFromCurrentSearchable]"));
  v24 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v23, 0));

  objc_exception_throw(v24);
}

- (void)continueSearch
{
  unsigned int v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  Class v7;
  NSString *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  char *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  Class v16;
  NSString *v17;
  void *v18;
  uint64_t v19;
  Class v20;
  NSString *v21;
  void *v22;
  void *v23;
  id v24;
  uint8_t buf[4];
  unsigned int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  void *v34;

  v3 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10124D990);
  v4 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    objc_opt_class(self, v6);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    *(_DWORD *)buf = 67110146;
    v26 = v3;
    v27 = 2082;
    v28 = "-[CRLModelSearchController continueSearch]";
    v29 = 2082;
    v30 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLModelSearchController.m";
    v31 = 1024;
    v32 = 132;
    v33 = 2114;
    v34 = v9;
    _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);

  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10124D9B0);
  v10 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v11 = v10;
    v12 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v26 = v3;
    v27 = 2114;
    v28 = v12;
    _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLModelSearchController continueSearch]"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLModelSearchController.m"));
  objc_opt_class(self, v15);
  v17 = NSStringFromClass(v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v13, v14, 132, 0, "Abstract method not overridden by %{public}@", v18);

  objc_opt_class(self, v19);
  v21 = NSStringFromClass(v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v22, "-[CRLModelSearchController continueSearch]"));
  v24 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v23, 0));

  objc_exception_throw(v24);
}

- (void)continueCountingHits
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  uint64_t v7;
  void *v8;
  unsigned int v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  unsigned int v28;
  void *v29;
  void *v30;
  void (**v31)(_QWORD, _QWORD, _QWORD);
  _QWORD block[5];

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124D9D0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1A7B4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124D9F0);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLModelSearchController continueCountingHits]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLModelSearchController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 138, 0, "This operation must only be performed on the main thread.");

  }
  v6 = -[CRLModelSearchController modelSearchesRunSynchronously](self, "modelSearchesRunSynchronously");
  v7 = objc_claimAutoreleasedReturnValue(-[CRLModelSearchController currentModelEnumerator](self, "currentModelEnumerator"));
  if (v7)
  {
    v8 = (void *)v7;
    v9 = -[CRLModelSearchController searchCriteriaIsValid](self, "searchCriteriaIsValid");

    if (v9)
    {
      while (1)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController currentSearchable](self, "currentSearchable"));

        if (v10)
        {
          v11 = 0;
        }
        else
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController currentModelEnumerator](self, "currentModelEnumerator"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "nextObject"));

          v11 = v13 == 0;
          if (v13)
          {
            v20 = sub_100221DDC(v13, 1, v14, v15, v16, v17, v18, v19, (uint64_t)&OBJC_PROTOCOL___CRLSearchable);
            v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
            -[CRLModelSearchController setCurrentSearchable:](self, "setCurrentSearchable:", v21);

          }
        }
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController currentSearchable](self, "currentSearchable"));

        if (v22)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController currentSearch](self, "currentSearch"));

          if (v23)
          {
            -[CRLModelSearchController continueSearch](self, "continueSearch");
          }
          else if (-[CRLModelSearchController respondsToSearch](self, "respondsToSearch"))
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController getNextSearchFromCurrentSearchable](self, "getNextSearchFromCurrentSearchable"));
            -[CRLModelSearchController setCurrentSearch:](self, "setCurrentSearch:", v24);

          }
          v25 = objc_claimAutoreleasedReturnValue(-[CRLModelSearchController currentSearch](self, "currentSearch"));
          if (v25)
          {
            v26 = (void *)v25;
            v27 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController currentSearch](self, "currentSearch"));
            v28 = objc_msgSend(v27, "isComplete");

            if (v28)
              -[CRLModelSearchController setCurrentSearch:](self, "setCurrentSearch:", 0);
          }
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController currentSearch](self, "currentSearch"));

          if (!v29)
            -[CRLModelSearchController setCurrentSearchable:](self, "setCurrentSearchable:", 0);
        }
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController progressBlock](self, "progressBlock"));
        if (v30)
        {

          if (v11 | v6 ^ 1)
          {
            v31 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[CRLModelSearchController progressBlock](self, "progressBlock"));
            v31[2](v31, -[CRLModelSearchController currentSearchResultsCount](self, "currentSearchResultsCount"), v11);

          }
        }
        if (v11)
          break;
        if ((v6 & 1) == 0)
        {
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1002CE548;
          block[3] = &unk_10122D110;
          block[4] = self;
          dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
          return;
        }
      }
      -[CRLModelSearchController setCurrentModelEnumerator:](self, "setCurrentModelEnumerator:", 0);
    }
  }
}

- (void)stopCountingHits
{
  void *v3;
  void *v4;
  void *v5;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124DA10);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1A834();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124DA30);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLModelSearchController stopCountingHits]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLModelSearchController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 192, 0, "This operation must only be performed on the main thread.");

  }
  -[CRLModelSearchController setCurrentSearchResultsCount:](self, "setCurrentSearchResultsCount:", 0);
  -[CRLModelSearchController setCurrentModelEnumerator:](self, "setCurrentModelEnumerator:", 0);
  -[CRLModelSearchController setCurrentSearch:](self, "setCurrentSearch:", 0);
}

- (id)modelEnumeratorForUserSearch
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController board](self, "board"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "modelEnumeratorWithFlags:", 1));

  return v3;
}

- (void)startCountingHits
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD block[5];

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124DA50);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1A8B4();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124DA70);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLModelSearchController startCountingHits]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLModelSearchController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 204, 0, "This operation must only be performed on the main thread.");

  }
  -[CRLModelSearchController setCurrentSearchable:](self, "setCurrentSearchable:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController findReplaceDelegate](self, "findReplaceDelegate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "modelEnumeratorForSearchWithFlags:", 1));
  -[CRLModelSearchController setCurrentModelEnumerator:](self, "setCurrentModelEnumerator:", v7);

  -[CRLModelSearchController setCurrentSearchResultsCount:](self, "setCurrentSearchResultsCount:", 0);
  -[CRLModelSearchController setCurrentSearchStartTime:](self, "setCurrentSearchStartTime:", CFAbsoluteTimeGetCurrent());
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController currentModelEnumerator](self, "currentModelEnumerator"));

  if (v8)
  {
    if (-[CRLModelSearchController modelSearchesRunSynchronously](self, "modelSearchesRunSynchronously"))
    {
      -[CRLModelSearchController continueCountingHits](self, "continueCountingHits");
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1002CE9D8;
      block[3] = &unk_10122D110;
      block[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

+ (void)assertSearchTargetImplementsProperMethods:(id)a3
{
  id v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  if ((objc_opt_respondsToSelector(v3, "layoutSearchForString:options:hitBlock:completionBlock:") & 1) == 0
    && (objc_opt_respondsToSelector(v3, "layoutSearchForAnnotationWithHitBlock:") & 1) == 0
    && (objc_opt_respondsToSelector(v3, "layoutSearchForPencilAnnotationWithHitBlock:") & 1) == 0
    && (objc_opt_respondsToSelector(v3, "layoutSearchForSpellingErrorsWithHitBlock:stop:") & 1) == 0
    && (objc_opt_respondsToSelector(v3, "childSearchTargets") & 1) == 0)
  {
    v4 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124DA90);
    v5 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1A934((uint64_t)v3, v4, v5);
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124DAB0);
    v6 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLModelSearchController assertSearchTargetImplementsProperMethods:]"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLModelSearchController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v7, v8, 229, 0, "Search target %@ does not respond to one of the necessary protocol methods.", v3);

  }
}

- (void)invalidateSearchResults
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unsigned int v9;

  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124DAD0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1A9EC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124DAF0);
    v3 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLModelSearchController invalidateSearchResults]"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLModelSearchController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 233, 0, "This operation must only be performed on the main thread.");

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController layoutSearchResults](self, "layoutSearchResults"));
  objc_msgSend(v6, "removeAllObjects");

  -[CRLModelSearchController setCurrentRootSearchTargetRange:](self, "setCurrentRootSearchTargetRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
  -[CRLModelSearchController setPrimaryFindResultSearchReference:](self, "setPrimaryFindResultSearchReference:", 0);
  -[CRLModelSearchController stopCountingHits](self, "stopCountingHits");
  v7 = objc_claimAutoreleasedReturnValue(-[CRLModelSearchController progressBlock](self, "progressBlock"));
  if (v7)
  {
    v8 = (void *)v7;
    v9 = -[CRLModelSearchController searchCriteriaIsValid](self, "searchCriteriaIsValid");

    if (v9)
      -[CRLModelSearchController startCountingHits](self, "startCountingHits");
  }
}

- (void)invalidateSearchResultsCountPerRootIndexForRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  signed int v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];

  if (a3.location != 0x7FFFFFFFFFFFFFFFLL || a3.length != 0)
  {
    length = a3.length;
    location = a3.location;
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController layoutSearchCountForRootIndexMap](self, "layoutSearchCountForRootIndexMap", 0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "allKeys"));

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)i);
          v14 = objc_msgSend(v13, "intValue");
          if (v14 >= location && v14 - location < length)
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController layoutSearchCountForRootIndexMap](self, "layoutSearchCountForRootIndexMap"));
            objc_msgSend(v16, "removeObjectForKey:", v13);

          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v10);
    }

  }
}

- (unint64_t)findResultIndex
{
  void *v3;
  unint64_t v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController primaryFindResultSearchReference](self, "primaryFindResultSearchReference"));
  v4 = -[CRLModelSearchController indexOfVisibleSearchReference:](self, "indexOfVisibleSearchReference:", v3);

  return v4;
}

- (void)performSearchWithSearchTarget:(id)a3 resultsArray:(id)a4
{
  id v6;
  id v7;
  unsigned int v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  Class v12;
  NSString *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  char *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  Class v21;
  NSString *v22;
  void *v23;
  uint64_t v24;
  Class v25;
  NSString *v26;
  void *v27;
  void *v28;
  id v29;
  uint8_t buf[4];
  unsigned int v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  void *v39;

  v6 = a3;
  v7 = a4;
  v8 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10124DB10);
  v9 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v10 = v9;
    objc_opt_class(self, v11);
    v13 = NSStringFromClass(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    *(_DWORD *)buf = 67110146;
    v31 = v8;
    v32 = 2082;
    v33 = "-[CRLModelSearchController performSearchWithSearchTarget:resultsArray:]";
    v34 = 2082;
    v35 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLModelSearchController.m";
    v36 = 1024;
    v37 = 263;
    v38 = 2114;
    v39 = v14;
    _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Abstract method not overridden by %{public}@", buf, 0x2Cu);

  }
  if (qword_10147E370 != -1)
    dispatch_once(&qword_10147E370, &stru_10124DB30);
  v15 = off_1013D9070;
  if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
  {
    v16 = v15;
    v17 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
    *(_DWORD *)buf = 67109378;
    v31 = v8;
    v32 = 2114;
    v33 = v17;
    _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLModelSearchController performSearchWithSearchTarget:resultsArray:]"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLModelSearchController.m"));
  objc_opt_class(self, v20);
  v22 = NSStringFromClass(v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
  +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v18, v19, 263, 0, "Abstract method not overridden by %{public}@", v23);

  objc_opt_class(self, v24);
  v26 = NSStringFromClass(v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v27, "-[CRLModelSearchController performSearchWithSearchTarget:resultsArray:]"));
  v29 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v28, 0));

  objc_exception_throw(v29);
}

- (void)sortLayoutSearchResultsArray:(id)a3
{
  objc_msgSend(a3, "sortUsingComparator:", &stru_10124DB50);
}

- (unint64_t)_layoutSearchResultsIndexAtOrBeforeSearchReference:(id)a3 inDirection:(unint64_t)a4 isOrdredSame:(BOOL *)a5
{
  id v8;
  void *v9;
  char *v10;
  char *v11;
  char *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  double v17;
  id v18;
  id v19;
  BOOL v20;

  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController layoutSearchResults](self, "layoutSearchResults"));
  v10 = (char *)objc_msgSend(v9, "count");

  if (v10)
  {
    v11 = 0;
    v12 = v10 - 1;
    while (1)
    {
      v13 = (unint64_t)(a4 ? v12 : v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController layoutSearchResults](self, "layoutSearchResults"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndexedSubscript:", v13));

      *(_QWORD *)&v17 = objc_opt_class(self, v16).n128_u64[0];
      v19 = objc_msgSend(v18, "compareSearchReference:toSearchReference:", v8, v15, v17);
      if (!v19)
        break;
      if (!a4 && v19 == (id)1 || a4 == 1 && v19 == (id)-1)
      {
        if (!a5)
          goto LABEL_18;
        v20 = 0;
        goto LABEL_17;
      }

      ++v11;
      if (--v12 == (char *)-1)
        goto LABEL_12;
    }
    if (!a5)
      goto LABEL_18;
    v20 = 1;
LABEL_17:
    *a5 = v20;
LABEL_18:

  }
  else
  {
LABEL_12:
    v13 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v13;
}

- (unint64_t)_layoutSearchResultsIndexAtOrAfterSearchReference:(id)a3 inDirection:(unint64_t)a4 isOrdredSame:(BOOL *)a5
{
  id v8;
  void *v9;
  char *v10;
  char *v11;
  char *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  double v17;
  id v18;
  id v19;
  BOOL v20;

  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController layoutSearchResults](self, "layoutSearchResults"));
  v10 = (char *)objc_msgSend(v9, "count");

  if (v10)
  {
    v11 = 0;
    v12 = v10 - 1;
    while (1)
    {
      v13 = (unint64_t)(a4 ? v12 : v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController layoutSearchResults](self, "layoutSearchResults"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndexedSubscript:", v13));

      *(_QWORD *)&v17 = objc_opt_class(self, v16).n128_u64[0];
      v19 = objc_msgSend(v18, "compareSearchReference:toSearchReference:", v8, v15, v17);
      if (!v19)
        break;
      if (!a4 && v19 == (id)-1 || a4 == 1 && v19 == (id)1)
      {
        if (!a5)
          goto LABEL_18;
        v20 = 0;
        goto LABEL_17;
      }

      ++v11;
      if (--v12 == (char *)-1)
        goto LABEL_12;
    }
    if (!a5)
      goto LABEL_18;
    v20 = 1;
LABEL_17:
    *a5 = v20;
LABEL_18:

  }
  else
  {
LABEL_12:
    v13 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v13;
}

- (void)_buildLayoutSearchResultsForRootSearchTargetsInRange:(_NSRange)a3 resultsArray:(id)a4
{
  NSUInteger length;
  char *location;
  id v7;
  uint64_t v8;
  id v9;
  __int128 v10;
  unsigned int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _BYTE *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *i;
  void *v25;
  _BYTE *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  char *v31;
  void *v32;
  __int128 v33;
  void *v34;
  char *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[5];
  id v41;
  uint8_t v42[128];
  uint8_t buf[4];
  unsigned int v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  int v50;

  length = a3.length;
  location = (char *)a3.location;
  v7 = a4;
  if (location != -[CRLModelSearchController currentRootSearchTargetRange](self, "currentRootSearchTargetRange")
    || length != v8)
  {
    v34 = v7;
    -[CRLModelSearchController setCurrentRootSearchTargetRange:](self, "setCurrentRootSearchTargetRange:", location, length);
    v9 = objc_alloc_init((Class)NSMutableSet);
    v35 = &location[length];
    if (location < &location[length])
    {
      *(_QWORD *)&v10 = 67109378;
      v33 = v10;
      do
      {
        if (location == (char *)0x7FFFFFFFFFFFFFFFLL)
        {
          v11 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10124DB70);
          v12 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109890;
            v44 = v11;
            v45 = 2082;
            v46 = "-[CRLModelSearchController _buildLayoutSearchResultsForRootSearchTargetsInRange:resultsArray:]";
            v47 = 2082;
            v48 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLModelSearchController.m";
            v49 = 1024;
            v50 = 348;
            _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Got an invalid root index while searching", buf, 0x22u);
          }
          if (qword_10147E370 != -1)
            dispatch_once(&qword_10147E370, &stru_10124DB90);
          v13 = off_1013D9070;
          if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
          {
            v30 = v13;
            v31 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
            *(_DWORD *)buf = v33;
            v44 = v11;
            v45 = 2114;
            v46 = v31;
            _os_log_error_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

          }
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLModelSearchController _buildLayoutSearchResultsForRootSearchTargetsInRange:resultsArray:]", v33));
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLModelSearchController.m"));
          +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 348, 0, "Got an invalid root index while searching");

        }
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array", v33));
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController findReplaceDelegate](self, "findReplaceDelegate"));
        v40[0] = _NSConcreteStackBlock;
        v40[1] = 3221225472;
        v40[2] = sub_1002CFA10;
        v40[3] = &unk_10124DBB8;
        v40[4] = self;
        v18 = v16;
        v41 = v18;
        objc_msgSend(v17, "withRootSearchTargetAtIndex:executeBlock:", location, v40);

        v19 = objc_msgSend(v9, "count");
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v20 = v18;
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
        if (v21)
        {
          v22 = v21;
          v23 = *(_QWORD *)v37;
          do
          {
            for (i = 0; i != v22; i = (char *)i + 1)
            {
              if (*(_QWORD *)v37 != v23)
                objc_enumerationMutation(v20);
              v25 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
              objc_msgSend(v25, "setRootIndex:", location);
              objc_msgSend(v9, "addObject:", v25);
            }
            v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
          }
          while (v22);
        }

        v26 = objc_msgSend(v9, "count");
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", location));
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v26 - v19));
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController layoutSearchCountForRootIndexMap](self, "layoutSearchCountForRootIndexMap"));
        objc_msgSend(v29, "setObject:forKey:", v28, v27);

        ++location;
      }
      while (location != v35);
    }
    v7 = v34;
    objc_msgSend(v34, "removeAllObjects");
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allObjects"));
    objc_msgSend(v34, "addObjectsFromArray:", v32);

    -[CRLModelSearchController sortLayoutSearchResultsArray:](self, "sortLayoutSearchResultsArray:", v34);
  }

}

- (unint64_t)nextRootSearchTargetFromIndex:(unint64_t)a3 inDirection:(unint64_t)a4
{
  void *v7;
  char v8;
  void *v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController findReplaceDelegate](self, "findReplaceDelegate"));
  v8 = objc_opt_respondsToSelector(v7, "nextRootSearchTargetIndexFromIndex:forString:options:inDirection:");

  if ((v8 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController findReplaceDelegate](self, "findReplaceDelegate"));
    v10 = objc_msgSend(v9, "nextRootSearchTargetIndexFromIndex:forString:options:inDirection:", a3, 0, 1, a4);

  }
  else
  {
    v10 = -[CRLModelSearchController nextRootSearchTargetIndexFromIndex:forString:options:inDirection:](self, "nextRootSearchTargetIndexFromIndex:forString:options:inDirection:", a3, 0, 1, a4);
  }
  if (v10 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController findReplaceDelegate](self, "findReplaceDelegate"));
    v12 = objc_opt_respondsToSelector(v11, "nextRootSearchTargetIndexFromIndex:forString:options:inDirection:");

    if ((v12 & 1) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController findReplaceDelegate](self, "findReplaceDelegate"));
      v10 = objc_msgSend(v13, "nextRootSearchTargetIndexFromIndex:forString:options:inDirection:", 0x7FFFFFFFFFFFFFFFLL, 0, 1, a4);

    }
    else
    {
      v10 = -[CRLModelSearchController nextRootSearchTargetIndexFromIndex:forString:options:inDirection:](self, "nextRootSearchTargetIndexFromIndex:forString:options:inDirection:", 0x7FFFFFFFFFFFFFFFLL, 0, 1, a4);
    }
    if (v10 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124DBD8);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E1AA6C();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124DBF8);
      v14 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE7468(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLModelSearchController nextRootSearchTargetFromIndex:inDirection:]"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLModelSearchController.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v15, v16, 395, 0, "Could not find next root search target. Defaulting to 0.");

      return 0;
    }
  }
  return (unint64_t)v10;
}

- (unint64_t)nextRootSearchTargetIndexFromIndex:(unint64_t)a3 forString:(id)a4 options:(unint64_t)a5 inDirection:(unint64_t)a6
{
  id v9;
  void *v10;
  void *v11;
  char *v12;

  v9 = a4;
  if (a6 == 1)
  {
    if (a3)
    {
      if (a3 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController findReplaceDelegate](self, "findReplaceDelegate"));
        a3 = (unint64_t)objc_msgSend(v10, "rootSearchTargetCountThroughIndex:", 0x7FFFFFFFFFFFFFFFLL) - 1;

      }
      else
      {
        --a3;
      }
    }
    else
    {
      a3 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else if (!a6)
  {
    if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    {
      a3 = 0;
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController findReplaceDelegate](self, "findReplaceDelegate"));
      v12 = (char *)objc_msgSend(v11, "rootSearchTargetCountThroughIndex:", a3) - 1;

      if ((unint64_t)v12 > a3)
        ++a3;
      else
        a3 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }

  return a3;
}

- (unint64_t)_layoutSearchResultsIndexNearestToSearchReference:(id)a3 inDirection:(unint64_t)a4 isOrdredSame:(BOOL *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  BOOL v21;
  unint64_t v22;
  void *v23;
  char i;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  unint64_t v28;
  id v29;
  uint64_t v30;
  char *v31;
  id v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  BOOL v38;
  BOOL v39;
  char v40;
  void *v41;
  uint64_t v43;
  id v44;

  v8 = a3;
  v9 = -[CRLModelSearchController currentRootSearchTargetRange](self, "currentRootSearchTargetRange");
  v11 = v10;
  objc_msgSend(v8, "searchReferencePoint");
  v13 = v12;
  v15 = v14;
  v16 = (char *)-[CRLModelSearchController currentRootSearchTargetRange](self, "currentRootSearchTargetRange");
  v18 = v17 - 1;
  if (a4)
    v18 = 0;
  v19 = &v16[v18];
  v21 = v13 >= INFINITY || v15 >= INFINITY || v19 == (char *)0x7FFFFFFFFFFFFFFFLL;
  v22 = 0x7FFFFFFFFFFFFFFFLL;
  if (!v21)
  {
    v43 = v11;
    v44 = v9;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSetWithIndex:](NSMutableIndexSet, "indexSetWithIndex:", v19));
    for (i = 0; ; i |= v39)
    {
      v26 = (char *)-[CRLModelSearchController currentRootSearchTargetRange](self, "currentRootSearchTargetRange");
      v27 = a4 ? 0 : v25 - 1;
      v28 = (i & 1) != 0
          ? -[CRLModelSearchController _layoutSearchResultsIndexAtOrBeforeSearchReference:inDirection:isOrdredSame:](self, "_layoutSearchResultsIndexAtOrBeforeSearchReference:inDirection:isOrdredSame:", v8, a4, a5): -[CRLModelSearchController _layoutSearchResultsIndexAtOrAfterSearchReference:inDirection:isOrdredSame:](self, "_layoutSearchResultsIndexAtOrAfterSearchReference:inDirection:isOrdredSame:", v8, a4, a5);
      v22 = v28;
      if (v28 != 0x7FFFFFFFFFFFFFFFLL)
        break;
      if (!-[CRLModelSearchController _nextSearchTargetWithMatchInDirection:](self, "_nextSearchTargetWithMatchInDirection:", a4)|| (v29 = -[CRLModelSearchController currentRootSearchTargetRange](self, "currentRootSearchTargetRange"), (objc_msgSend(v23, "containsIndexesInRange:", v29, v30) & 1) != 0))
      {
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController layoutSearchResults](self, "layoutSearchResults"));
        -[CRLModelSearchController _buildLayoutSearchResultsForRootSearchTargetsInRange:resultsArray:](self, "_buildLayoutSearchResultsForRootSearchTargetsInRange:resultsArray:", v44, v43, v41);

        break;
      }
      v31 = &v26[v27];
      v32 = -[CRLModelSearchController currentRootSearchTargetRange](self, "currentRootSearchTargetRange");
      objc_msgSend(v23, "addIndexesInRange:", v32, v33);
      v34 = (char *)-[CRLModelSearchController currentRootSearchTargetRange](self, "currentRootSearchTargetRange");
      v36 = v35 - 1;
      if (a4)
        v36 = 0;
      v37 = &v34[v36];
      v38 = v37 > v31;
      v39 = v37 < v31;
      v40 = v38;
      if (a4)
        v39 = v40;
    }

  }
  return v22;
}

- (BOOL)_nextSearchTargetWithMatchInDirection:(unint64_t)a3
{
  uint64_t v5;
  void *v7;
  void *v8;
  void *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  void *v14;
  __int128 v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  id v20;
  unint64_t v21;
  void *v23;
  id v24;
  unint64_t v25;
  unsigned int v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  NSObject *v38;
  char *v39;
  __int128 v41;
  uint8_t buf[4];
  unsigned int v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  const char *v47;
  __int16 v48;
  int v49;

  if (-[CRLModelSearchController currentRootSearchTargetRange](self, "currentRootSearchTargetRange") == (id)0x7FFFFFFFFFFFFFFFLL
    && v5 == 0)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124DC18);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1AAEC();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124DC38);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLModelSearchController _nextSearchTargetWithMatchInDirection:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLModelSearchController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 490, 0, "must have a valid search target at this point");

  }
  v10 = (char *)-[CRLModelSearchController currentRootSearchTargetRange](self, "currentRootSearchTargetRange");
  v12 = v11 - 1;
  if (a3)
    v12 = 0;
  if (&v10[v12] == (char *)0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSetWithIndex:](NSMutableIndexSet, "indexSetWithIndex:"));
  *(_QWORD *)&v15 = 67109378;
  v41 = v15;
  while (1)
  {
    v16 = (char *)-[CRLModelSearchController currentRootSearchTargetRange](self, "currentRootSearchTargetRange", v41);
    v18 = v17 - 1;
    if (a3)
      v18 = 0;
    v19 = -[CRLModelSearchController nextRootSearchTargetFromIndex:inDirection:](self, "nextRootSearchTargetFromIndex:inDirection:", &v16[v18], a3);
    v20 = -[CRLModelSearchController currentRootSearchTargetRange](self, "currentRootSearchTargetRange");
    if (v19 < (unint64_t)v20 || v19 - (unint64_t)v20 >= v21)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController layoutSearchResults](self, "layoutSearchResults"));
      -[CRLModelSearchController _buildLayoutSearchResultsForRootSearchTargetsInRange:resultsArray:](self, "_buildLayoutSearchResultsForRootSearchTargetsInRange:resultsArray:", v19, 1, v23);

    }
    v24 = -[CRLModelSearchController currentRootSearchTargetRange](self, "currentRootSearchTargetRange");
    if (v19 < (unint64_t)v24 || v19 - (unint64_t)v24 >= v25)
    {
      v27 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124DC58);
      v28 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109890;
        v43 = v27;
        v44 = 2082;
        v45 = "-[CRLModelSearchController _nextSearchTargetWithMatchInDirection:]";
        v46 = 2082;
        v47 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLModelSearchController.m";
        v48 = 1024;
        v49 = 505;
        _os_log_error_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d rebulding cache must update current index", buf, 0x22u);
      }
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10124DC78);
      v29 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      {
        v38 = v29;
        v39 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
        *(_DWORD *)buf = v41;
        v43 = v27;
        v44 = 2114;
        v45 = v39;
        _os_log_error_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

      }
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLModelSearchController _nextSearchTargetWithMatchInDirection:]"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLModelSearchController.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v30, v31, 505, 0, "rebulding cache must update current index");

    }
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController layoutSearchResults](self, "layoutSearchResults"));
    v33 = objc_msgSend(v32, "count");
    v13 = v33 != 0;

    if (v33)
      break;
    v34 = -[CRLModelSearchController currentRootSearchTargetRange](self, "currentRootSearchTargetRange");
    if ((objc_msgSend(v14, "containsIndexesInRange:", v34, v35) & 1) != 0)
      break;
    v36 = -[CRLModelSearchController currentRootSearchTargetRange](self, "currentRootSearchTargetRange");
    objc_msgSend(v14, "addIndexesInRange:", v36, v37);
  }

  return v13;
}

- (id)_firstResultInDirection:(unint64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController layoutSearchResults](self, "layoutSearchResults"));
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController layoutSearchResults](self, "layoutSearchResults"));
    v8 = v7;
    if (a3)
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastObject"));
    else
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", 0));
    v10 = (void *)v9;

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)_lastResultInDirection:(unint64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController layoutSearchResults](self, "layoutSearchResults"));
  v6 = objc_msgSend(v5, "count");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController layoutSearchResults](self, "layoutSearchResults"));
    v8 = v7;
    if (a3)
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", 0));
    else
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastObject"));
    v10 = (void *)v9;

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (void)buildSearchResultsIfNecessary
{
  uint64_t v3;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  if (-[CRLModelSearchController currentRootSearchTargetRange](self, "currentRootSearchTargetRange") == (id)0x7FFFFFFFFFFFFFFFLL
    && v3 == 0)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController findReplaceDelegate](self, "findReplaceDelegate"));
    v5 = objc_msgSend(v9, "visibleRootIndexRange");
    v7 = v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController layoutSearchResults](self, "layoutSearchResults"));
    -[CRLModelSearchController _buildLayoutSearchResultsForRootSearchTargetsInRange:resultsArray:](self, "_buildLayoutSearchResultsForRootSearchTargetsInRange:resultsArray:", v5, v7, v8);

  }
}

- (void)buildVisibleSearchResultsIfNecessary
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v3 = -[CRLModelSearchController currentRootSearchTargetRange](self, "currentRootSearchTargetRange");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController findReplaceDelegate](self, "findReplaceDelegate"));
  v7 = objc_msgSend(v6, "visibleRootIndexRange");
  v9 = v8;

  if (v3 != v7 || v5 != v9)
  {
    v14 = (id)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController findReplaceDelegate](self, "findReplaceDelegate"));
    v10 = objc_msgSend(v14, "visibleRootIndexRange");
    v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController layoutSearchResults](self, "layoutSearchResults"));
    -[CRLModelSearchController _buildLayoutSearchResultsForRootSearchTargetsInRange:resultsArray:](self, "_buildLayoutSearchResultsForRootSearchTargetsInRange:resultsArray:", v10, v12, v13);

  }
}

- (id)firstVisibleResultInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  _QWORD v14[9];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = sub_1002D084C;
  v19 = sub_1002D085C;
  v20 = 0;
  v8 = objc_alloc_init((Class)NSMutableArray);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController findReplaceDelegate](self, "findReplaceDelegate"));
  v10 = objc_msgSend(v9, "visibleRootIndexRange");
  -[CRLModelSearchController _buildLayoutSearchResultsForRootSearchTargetsInRange:resultsArray:](self, "_buildLayoutSearchResultsForRootSearchTargetsInRange:resultsArray:", v10, v11, v8);

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1002D0864;
  v14[3] = &unk_10124DCA0;
  *(CGFloat *)&v14[5] = x;
  *(CGFloat *)&v14[6] = y;
  *(CGFloat *)&v14[7] = width;
  *(CGFloat *)&v14[8] = height;
  v14[4] = &v15;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v14);
  v12 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v12;
}

- (unint64_t)indexOfVisibleSearchReference:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char *v10;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController layoutSearchResults](self, "layoutSearchResults"));
    v6 = objc_msgSend(v5, "indexOfObject:", v4);

    if (v6 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = (char *)-[CRLModelSearchController _resultCountInRootObjectRange:](self, "_resultCountInRootObjectRange:", 0, -[CRLModelSearchController currentRootSearchTargetRange](self, "currentRootSearchTargetRange"))+ (_QWORD)v6+ 1;
      goto LABEL_14;
    }
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124DCC0);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E1AB6C();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10124DCE0);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE7468(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLModelSearchController indexOfVisibleSearchReference:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLModelSearchController.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 575, 0, "Could not find searchReference in current root search target range");

  }
  v10 = 0;
LABEL_14:

  return (unint64_t)v10;
}

- (unint64_t)_resultCountInRootObjectRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  id v6;
  uint64_t v7;
  unint64_t v8;
  CFArrayRef (__cdecl **v9)(CTFontDescriptorRef, CFSetRef);
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  NSObject *v16;
  CFArrayRef (__cdecl **v17)(CTFontDescriptorRef, CFSetRef);
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  char *v22;
  uint64_t v24;
  id v25;
  id v26;
  uint8_t buf[4];
  unsigned int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  const char *v36;

  length = a3.length;
  location = a3.location;
  v6 = -[CRLModelSearchController currentRootSearchTargetRange](self, "currentRootSearchTargetRange");
  v24 = v7;
  v25 = v6;
  v26 = objc_alloc_init((Class)NSMutableArray);
  if (location >= location + length)
  {
    v8 = 0;
  }
  else
  {
    v8 = 0;
    v9 = &CTFontDescriptorCreateMatchingFontDescriptors_ptr;
    do
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9[427], "numberWithUnsignedInteger:", location));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController layoutSearchCountForRootIndexMap](self, "layoutSearchCountForRootIndexMap"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKey:", v10));

      if (!v12)
        -[CRLModelSearchController _buildLayoutSearchResultsForRootSearchTargetsInRange:resultsArray:](self, "_buildLayoutSearchResultsForRootSearchTargetsInRange:resultsArray:", location, 1, v26);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController layoutSearchCountForRootIndexMap](self, "layoutSearchCountForRootIndexMap"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", v10));

      if (v14)
      {
        v8 += (int)objc_msgSend(v14, "intValue");
      }
      else
      {
        v15 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10124DD00);
        v16 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67110146;
          v28 = v15;
          v29 = 2082;
          v30 = "-[CRLModelSearchController _resultCountInRootObjectRange:]";
          v31 = 2082;
          v32 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLModelSearchController.m";
          v33 = 1024;
          v34 = 601;
          v35 = 2082;
          v36 = "rootCount";
          _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d invalid nil value for '%{public}s'", buf, 0x2Cu);
        }
        if (qword_10147E370 != -1)
          dispatch_once(&qword_10147E370, &stru_10124DD20);
        v17 = v9;
        v18 = off_1013D9070;
        if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        {
          v21 = v18;
          v22 = (char *)objc_claimAutoreleasedReturnValue(+[CRLAssertionHandler packedBacktraceString](CRLAssertionHandler, "packedBacktraceString"));
          *(_DWORD *)buf = 67109378;
          v28 = v15;
          v29 = 2114;
          v30 = v22;
          _os_log_error_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: Assertion backtrace: >>%{public}@<<", buf, 0x12u);

        }
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLModelSearchController _resultCountInRootObjectRange:]"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLKit/CRLModelSearchController.m"));
        +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v19, v20, 601, 0, "invalid nil value for '%{public}s'", "rootCount");

        v9 = v17;
      }

      ++location;
      --length;
    }
    while (length);
  }
  -[CRLModelSearchController _buildLayoutSearchResultsForRootSearchTargetsInRange:resultsArray:](self, "_buildLayoutSearchResultsForRootSearchTargetsInRange:resultsArray:", v25, v24, v26);

  return v8;
}

- (unint64_t)layoutSearchResultsIndexOfSearchReference:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController layoutSearchResults](self, "layoutSearchResults"));
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  return (unint64_t)v6;
}

- (id)searchReferenceAfterReference:(id)a3 inDirection:(unint64_t)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  char *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  uint64_t v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  _QWORD v39[5];
  id v40;
  uint64_t *v41;
  unint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;

  v6 = a3;
  -[CRLModelSearchController buildSearchResultsIfNecessary](self, "buildSearchResultsIfNecessary");
  v44 = 0;
  v45 = &v44;
  v46 = 0x3032000000;
  v47 = sub_1002D084C;
  v48 = sub_1002D085C;
  v49 = 0;
  if (!v6)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController layoutSearchResults](self, "layoutSearchResults"));
    v18 = objc_msgSend(v17, "count");

    if (!v18)
      -[CRLModelSearchController _nextSearchTargetWithMatchInDirection:](self, "_nextSearchTargetWithMatchInDirection:", a4);
    v16 = objc_claimAutoreleasedReturnValue(-[CRLModelSearchController _firstResultInDirection:](self, "_firstResultInDirection:", a4));
    goto LABEL_17;
  }
  v43 = 0;
  v7 = -[CRLModelSearchController layoutSearchResultsIndexOfSearchReference:](self, "layoutSearchResultsIndexOfSearchReference:", v6);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_12;
  v7 = -[CRLModelSearchController _layoutSearchResultsIndexNearestToSearchReference:inDirection:isOrdredSame:](self, "_layoutSearchResultsIndexNearestToSearchReference:inDirection:isOrdredSame:", v6, a4, &v43);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (!v43)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController layoutSearchResults](self, "layoutSearchResults"));
      v32 = objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectAtIndex:", v7));
      v33 = (void *)v45[5];
      v45[5] = v32;

      goto LABEL_28;
    }
LABEL_12:
    if (a4)
    {
      v19 = 0;
    }
    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController layoutSearchResults](self, "layoutSearchResults"));
      v19 = (char *)objc_msgSend(v20, "count") - 1;

    }
    if ((char *)v7 == v19)
      goto LABEL_16;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController layoutSearchResults](self, "layoutSearchResults"));
    v23 = v22;
    if (a4)
      v24 = v7 - 1;
    else
      v24 = v7 + 1;
    v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectAtIndex:", v24));
    v26 = (void *)v45[5];
    v45[5] = v25;

    goto LABEL_28;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController layoutSearchResults](self, "layoutSearchResults"));
  v9 = objc_msgSend(v8, "count");

  if (!v9)
    -[CRLModelSearchController _nextSearchTargetWithMatchInDirection:](self, "_nextSearchTargetWithMatchInDirection:", a4);
  *(_QWORD *)&v11 = objc_opt_class(self, v10).n128_u64[0];
  v13 = v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController _firstResultInDirection:](self, "_firstResultInDirection:", a4, v11));
  LODWORD(v13) = objc_msgSend(v13, "searchReference:isBeforeSearchReference:inDirection:", v6, v14, a4);

  if ((_DWORD)v13)
  {
    v16 = objc_claimAutoreleasedReturnValue(-[CRLModelSearchController _firstResultInDirection:](self, "_firstResultInDirection:", a4));
LABEL_17:
    v21 = (void *)v45[5];
    v45[5] = v16;

    goto LABEL_28;
  }
  *(_QWORD *)&v27 = objc_opt_class(self, v15).n128_u64[0];
  v29 = v28;
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController _lastResultInDirection:](self, "_lastResultInDirection:", a4, v27));
  LODWORD(v29) = objc_msgSend(v29, "searchReference:isAfterSearchReference:inDirection:", v6, v30, a4);

  if ((_DWORD)v29)
  {
LABEL_16:
    -[CRLModelSearchController _nextSearchTargetWithMatchInDirection:](self, "_nextSearchTargetWithMatchInDirection:", a4);
    v16 = objc_claimAutoreleasedReturnValue(-[CRLModelSearchController _firstResultInDirection:](self, "_firstResultInDirection:", a4));
    goto LABEL_17;
  }
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[CRLModelSearchController layoutSearchResults](self, "layoutSearchResults"));
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_1002D12BC;
  v39[3] = &unk_10124DD48;
  v39[4] = self;
  v40 = v6;
  v41 = &v44;
  v42 = a4;
  objc_msgSend(v34, "enumerateObjectsWithOptions:usingBlock:", 2 * (a4 != 0), v39);

  if (!v45[5])
  {
    -[CRLModelSearchController _nextSearchTargetWithMatchInDirection:](self, "_nextSearchTargetWithMatchInDirection:", a4);
    v35 = objc_claimAutoreleasedReturnValue(-[CRLModelSearchController _firstResultInDirection:](self, "_firstResultInDirection:", a4));
    v36 = (void *)v45[5];
    v45[5] = v35;

  }
LABEL_28:
  v37 = (id)v45[5];
  _Block_object_dispose(&v44, 8);

  return v37;
}

+ (BOOL)p_searchReference:(id)a3 comparedWithSearchReference:(id)a4 inDirection:(unint64_t)a5 before:(BOOL)a6
{
  _BOOL4 v6;
  id v8;
  uint64_t v9;
  uint64_t v10;

  v6 = a6;
  v8 = objc_msgSend(a1, "compareSearchReference:toSearchReference:", a3, a4);
  v9 = -1;
  if (!v6)
    v9 = 1;
  v10 = 1;
  if (!v6)
    v10 = -1;
  if (a5)
    v9 = v10;
  return v8 == (id)v9;
}

+ (BOOL)searchReference:(id)a3 isBeforeSearchReference:(id)a4 inDirection:(unint64_t)a5
{
  return _objc_msgSend(a1, "p_searchReference:comparedWithSearchReference:inDirection:before:", a3, a4, a5, 1);
}

+ (BOOL)searchReference:(id)a3 isAfterSearchReference:(id)a4 inDirection:(unint64_t)a5
{
  return _objc_msgSend(a1, "p_searchReference:comparedWithSearchReference:inDirection:before:", a3, a4, a5, 0);
}

+ (int64_t)compareSearchReference:(id)a3 toSearchReference:(id)a4
{
  return sub_1002CD254(a3, a4);
}

- (CRLFindReplaceDelegate)findReplaceDelegate
{
  return (CRLFindReplaceDelegate *)objc_loadWeakRetained((id *)&self->_findReplaceDelegate);
}

- (BOOL)modelSearchesRunSynchronously
{
  return self->_modelSearchesRunSynchronously;
}

- (void)setModelSearchesRunSynchronously:(BOOL)a3
{
  self->_modelSearchesRunSynchronously = a3;
}

- (_TtC8Freeform21CRLEditingCoordinator)editingCoordinator
{
  return (_TtC8Freeform21CRLEditingCoordinator *)objc_loadWeakRetained((id *)&self->_editingCoordinator);
}

- (CRLSearchReference)startingPointSearchReference
{
  return self->_startingPointSearchReference;
}

- (void)setStartingPointSearchReference:(id)a3
{
  objc_storeStrong((id *)&self->_startingPointSearchReference, a3);
}

- (CRLSearchReference)primaryFindResultSearchReference
{
  return self->_primaryFindResultSearchReference;
}

- (void)setPrimaryFindResultSearchReference:(id)a3
{
  objc_storeStrong((id *)&self->_primaryFindResultSearchReference, a3);
}

- (NSEnumerator)currentModelEnumerator
{
  return self->_currentModelEnumerator;
}

- (void)setCurrentModelEnumerator:(id)a3
{
  objc_storeStrong((id *)&self->_currentModelEnumerator, a3);
}

- (CRLSearchable)currentSearchable
{
  return self->_currentSearchable;
}

- (void)setCurrentSearchable:(id)a3
{
  self->_currentSearchable = (CRLSearchable *)a3;
}

- (CRLSearch)currentSearch
{
  return self->_currentSearch;
}

- (void)setCurrentSearch:(id)a3
{
  objc_storeStrong((id *)&self->_currentSearch, a3);
}

- (double)currentSearchStartTime
{
  return self->_currentSearchStartTime;
}

- (void)setCurrentSearchStartTime:(double)a3
{
  self->_currentSearchStartTime = a3;
}

- (unint64_t)currentSearchResultsCount
{
  return self->_currentSearchResultsCount;
}

- (void)setCurrentSearchResultsCount:(unint64_t)a3
{
  self->_currentSearchResultsCount = a3;
}

- (_NSRange)currentRootSearchTargetRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_currentRootSearchTargetRange.length;
  location = self->_currentRootSearchTargetRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setCurrentRootSearchTargetRange:(_NSRange)a3
{
  self->_currentRootSearchTargetRange = a3;
}

- (NSMutableArray)layoutSearchResults
{
  return self->_layoutSearchResults;
}

- (void)setLayoutSearchResults:(id)a3
{
  objc_storeStrong((id *)&self->_layoutSearchResults, a3);
}

- (NSMutableDictionary)layoutSearchCountForRootIndexMap
{
  return self->_layoutSearchCountForRootIndexMap;
}

- (void)setLayoutSearchCountForRootIndexMap:(id)a3
{
  objc_storeStrong((id *)&self->_layoutSearchCountForRootIndexMap, a3);
}

- (id)progressBlock
{
  return self->_progressBlock;
}

- (void)setProgressBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_progressBlock, 0);
  objc_storeStrong((id *)&self->_layoutSearchCountForRootIndexMap, 0);
  objc_storeStrong((id *)&self->_layoutSearchResults, 0);
  objc_storeStrong((id *)&self->_currentSearch, 0);
  objc_storeStrong((id *)&self->_currentModelEnumerator, 0);
  objc_storeStrong((id *)&self->_primaryFindResultSearchReference, 0);
  objc_storeStrong((id *)&self->_startingPointSearchReference, 0);
  objc_destroyWeak((id *)&self->_editingCoordinator);
  objc_destroyWeak((id *)&self->_findReplaceDelegate);
}

@end
