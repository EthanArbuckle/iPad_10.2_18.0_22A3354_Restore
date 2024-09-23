@implementation BENavigationHandler

- (BENavigationHandler)initWithMode:(unint64_t)a3
{
  BENavigationHandler *v4;
  uint64_t v5;
  BEDocumentExternalLoadApprovalCache *approvalCache;
  uint64_t v7;
  NSHashTable *observers;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BENavigationHandler;
  v4 = -[BENavigationHandler init](&v10, "init");
  if (v4)
  {
    v5 = objc_claimAutoreleasedReturnValue(+[BEDocumentExternalLoadApprovalCache sharedInstance](BEDocumentExternalLoadApprovalCache, "sharedInstance"));
    approvalCache = v4->_approvalCache;
    v4->_approvalCache = (BEDocumentExternalLoadApprovalCache *)v5;

    v4->_mode = a3;
    v7 = objc_claimAutoreleasedReturnValue(+[NSHashTable weakObjectsHashTable](NSHashTable, "weakObjectsHashTable"));
    observers = v4->__observers;
    v4->__observers = (NSHashTable *)v7;

    v4->_accessLock._os_unfair_lock_opaque = 0;
    v4->_retryCount = 0;
    v4->_observerCount = 0;
    v4->_maxReloadAttempts = 3;
    v4->_loadTimeout = 10.0;
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[BENavigationHandler _cancelTimeout](self, "_cancelTimeout");
  v3.receiver = self;
  v3.super_class = (Class)BENavigationHandler;
  -[BENavigationHandler dealloc](&v3, "dealloc");
}

- (void)performAfterLoadCompleteOrFailure:(id)a3
{
  id v4;
  NSMutableArray *postLoadCompleteOrFailureWork;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;
  id v9;
  id v10;

  v4 = a3;
  postLoadCompleteOrFailureWork = self->_postLoadCompleteOrFailureWork;
  v10 = v4;
  if (!postLoadCompleteOrFailureWork)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_postLoadCompleteOrFailureWork;
    self->_postLoadCompleteOrFailureWork = v6;

    v4 = v10;
    postLoadCompleteOrFailureWork = self->_postLoadCompleteOrFailureWork;
  }
  v8 = objc_msgSend(v4, "copy");
  v9 = objc_retainBlock(v8);
  -[NSMutableArray addObject:](postLoadCompleteOrFailureWork, "addObject:", v9);

}

- (void)requestCancelationOfCurrentNavigation
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BENavigationHandler allObservers](self, "allObservers", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v8, "navigationHandlerWillCancelCurrentNavigation:") & 1) != 0)
          objc_msgSend(v8, "navigationHandlerWillCancelCurrentNavigation:", self);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)addObserver:(id)a3
{
  os_unfair_lock_s *p_accessLock;
  id v4;
  _QWORD v5[5];
  id v6;

  p_accessLock = &self->_accessLock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1AF64;
  v5[3] = &unk_377928;
  v5[4] = self;
  v6 = a3;
  v4 = v6;
  os_unfair_lock_lock(p_accessLock);
  sub_1AF64((uint64_t)v5);
  os_unfair_lock_unlock(p_accessLock);

}

- (void)removeObserver:(id)a3
{
  os_unfair_lock_s *p_accessLock;
  id v4;
  _QWORD v5[5];
  id v6;

  p_accessLock = &self->_accessLock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1B09C;
  v5[3] = &unk_377928;
  v5[4] = self;
  v6 = a3;
  v4 = v6;
  os_unfair_lock_lock(p_accessLock);
  sub_1B09C((uint64_t)v5);
  os_unfair_lock_unlock(p_accessLock);

}

- (id)allObservers
{
  os_unfair_lock_s *p_accessLock;
  _QWORD *v3;
  id v4;
  _QWORD v6[2];
  void (*v7)(uint64_t);
  void *v8;
  BENavigationHandler *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_1B1E0;
  v15 = sub_1B1F0;
  v16 = 0;
  p_accessLock = &self->_accessLock;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v7 = sub_1B1F8;
  v8 = &unk_377FC8;
  v9 = self;
  v10 = &v11;
  v3 = v6;
  os_unfair_lock_lock(p_accessLock);
  v7((uint64_t)v3);
  os_unfair_lock_unlock(p_accessLock);

  v4 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v4;
}

- (void)setDelegate:(id)a3
{
  id v4;
  BENavigationHandlerDelegate **p_delegate;
  void *v6;
  id WeakRetained;
  id v8;

  v4 = a3;
  v8 = v4;
  if (v4)
  {
    -[BENavigationHandler addObserver:](self, "addObserver:", v4);
    p_delegate = &self->_delegate;
    v6 = v8;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    -[BENavigationHandler removeObserver:](self, "removeObserver:", WeakRetained);

    p_delegate = &self->_delegate;
    v6 = 0;
  }
  objc_storeWeak((id *)p_delegate, v6);

}

- (void)_notifyLoadCompleteIfNecessary
{
  void *v3;
  void *v4;
  unsigned int v5;
  _QWORD *v6;
  void (*v7)(_QWORD *, _QWORD, _QWORD *);
  BENavigationHandler *v8;
  BENavigationHandler *v9;
  id v10;
  NSObject *v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[4];
  BENavigationHandler *v26;
  uint8_t v27[128];
  uint8_t buf[4];
  BENavigationHandler *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  BENavigationHandler *v33;

  -[BENavigationHandler _cancelTimeout](self, "_cancelTimeout");
  if (!-[BENavigationHandler webViewLoadComplete](self, "webViewLoadComplete"))
    return;
  if (-[BENavigationHandler shouldWaitForJavascriptLoadComplete](self, "shouldWaitForJavascriptLoadComplete"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[WKNavigationResponse response](self->_pendingMainFrameLoadURLResponse, "response"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "MIMEType"));
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("application/xhtml+xml")))
    {

      goto LABEL_6;
    }
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("text/html"));

    if (v5)
    {
LABEL_6:
      if (!-[BENavigationHandler javascriptLoadComplete](self, "javascriptLoadComplete"))
        return;
    }
  }
  v6 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_postLoadCompleteOrFailureWork, "firstObject"));
  if (v6)
  {
    -[NSMutableArray removeObjectAtIndex:](self->_postLoadCompleteOrFailureWork, "removeObjectAtIndex:", 0);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1B5D4;
    v25[3] = &unk_377CA0;
    v26 = self;
    v7 = (void (*)(_QWORD *, _QWORD, _QWORD *))v6[2];
    v8 = v26;
    v7(v6, 0, v25);
    v9 = v26;
  }
  else
  {
    v8 = (BENavigationHandler *)objc_claimAutoreleasedReturnValue(-[BENavigationHandler mainFrameNavigationURL](self, "mainFrameNavigationURL"));
    -[BENavigationHandler setMainFrameNavigationURL:](self, "setMainFrameNavigationURL:", 0);
    v9 = (BENavigationHandler *)objc_claimAutoreleasedReturnValue(-[BENavigationHandler webView](self, "webView"));
    -[BENavigationHandler setBe_hasPendingOperations:](v9, "setBe_hasPendingOperations:", 0);
    -[BENavigationHandler setBe_hasCompletedLoad:](v9, "setBe_hasCompletedLoad:", 1);
    -[BENavigationHandler setBe_requiresReload:](v9, "setBe_requiresReload:", 0);
    v10 = _BookEPUBLog();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = (objc_class *)objc_opt_class(v9);
      v13 = NSStringFromClass(v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      *(_DWORD *)buf = 138412802;
      v29 = v8;
      v30 = 2112;
      v31 = v14;
      v32 = 2048;
      v33 = v9;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "Notifying delegate load of %@ in <%@:%p> is complete & JS has been executed", buf, 0x20u);

    }
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BENavigationHandler allObservers](self, "allObservers"));
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(_QWORD *)v22 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
          if ((objc_opt_respondsToSelector(v20, "navigationHandler:didFinishLoadOfURL:") & 1) != 0)
            objc_msgSend(v20, "navigationHandler:didFinishLoadOfURL:", self, v8);
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
      }
      while (v17);
    }

    v6 = 0;
  }

}

- (void)_notifyLoadFailureError:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  void (*v9)(_QWORD *, id, _QWORD *);
  BENavigationHandler *v10;
  id v11;
  NSObject *v12;
  BENavigationHandler *v13;
  _QWORD v14[4];
  BENavigationHandler *v15;
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;

  v6 = a3;
  v7 = a4;
  -[BENavigationHandler _cancelTimeout](self, "_cancelTimeout");
  v8 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_postLoadCompleteOrFailureWork, "firstObject"));
  if (v8)
  {
    -[NSMutableArray removeObjectAtIndex:](self->_postLoadCompleteOrFailureWork, "removeObjectAtIndex:", 0);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1B778;
    v14[3] = &unk_377FF0;
    v15 = self;
    v16 = v6;
    v17 = v7;
    v9 = (void (*)(_QWORD *, id, _QWORD *))v8[2];
    v10 = v15;
    v9(v8, v16, v14);

  }
  else
  {
    v11 = _BookEPUBLog();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v6;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_ERROR, "Notifying delegate load Failure - %@", buf, 0xCu);
    }

    v13 = (BENavigationHandler *)objc_retainBlock(v7);
    v10 = v13;
    if (v13)
      ((void (*)(BENavigationHandler *))v13->_delegate)(v13);
  }

}

- (void)_startContentLoadTimeout
{
  -[BENavigationHandler loadTimeout](self, "loadTimeout");
  -[BENavigationHandler performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "_contentLoadTimeout", 0);
}

- (void)_cancelTimeout
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_contentLoadTimeout", 0);
  if (-[BENavigationHandler reloadTimeoutActive](self, "reloadTimeoutActive"))
  {
    v3 = _BookEPUBLog();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_ERROR, "Reload timeout active when canceling our timeout.  Also canceling reload timeout.", v5, 2u);
    }

    -[BENavigationHandler _cancelReloadTimeout](self, "_cancelReloadTimeout");
  }
}

- (void)_startReloadTimeout
{
  -[BENavigationHandler performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "_reloadTimeout", 0, 3.0);
  -[BENavigationHandler setReloadTimeoutActive:](self, "setReloadTimeoutActive:", 1);
}

- (void)_cancelReloadTimeout
{
  -[BENavigationHandler setReloadTimeoutActive:](self, "setReloadTimeoutActive:", 0);
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_reloadTimeout", 0);
}

- (void)_startProvisionalLoadTimeout
{
  -[BENavigationHandler performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "_provisionalLoadTimeout", 0, 1.0);
}

- (void)_cancelProvisionalLoadTimeout
{
  -[BENavigationHandler setReloadTimeoutActive:](self, "setReloadTimeoutActive:", 0);
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_provisionalLoadTimeout", 0);
}

- (void)webView:(id)a3 decidePolicyForNavigationAction:(id)a4 decisionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  char v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = 0;
  if ((self->_mode & 0xFFFFFFFFFFFFFFFELL) == 2)
    -[BENavigationHandler _decidePolicyForFootnoteOrPreviewNavigationAction:shouldObserveProvisionalLoadTimeout:webView:decisionHandler:](self, "_decidePolicyForFootnoteOrPreviewNavigationAction:shouldObserveProvisionalLoadTimeout:webView:decisionHandler:", v9, &v11, v8, v10);
  else
    -[BENavigationHandler _decidePolicyForContentNavigationAction:shouldObserveProvisionalLoadTimeout:webView:decisionHandler:](self, "_decidePolicyForContentNavigationAction:shouldObserveProvisionalLoadTimeout:webView:decisionHandler:", v9, &v11, v8, v10);
  if (v11)
    -[BENavigationHandler _startProvisionalLoadTimeout](self, "_startProvisionalLoadTimeout");

}

- (void)webView:(id)a3 decidePolicyForNavigationResponse:(id)a4 decisionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v11 = a4;
  v8 = a5;
  if (objc_msgSend(v11, "isForMainFrame"))
    objc_storeStrong((id *)&self->_pendingMainFrameLoadURLResponse, a4);
  v9 = objc_retainBlock(v8);
  v10 = v9;
  if (v9)
    (*((void (**)(id, uint64_t))v9 + 2))(v9, 1);

}

- (void)webView:(id)a3 didStartProvisionalNavigation:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "_request"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URL"));
  v9 = v8;
  if (v8)
    v10 = v8;
  else
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "URL"));
  v11 = v10;

  -[BENavigationHandler setMainFrameNavigationURL:](self, "setMainFrameNavigationURL:", v11);
  -[BENavigationHandler setWebViewLoadComplete:](self, "setWebViewLoadComplete:", 0);
  -[BENavigationHandler setJavascriptLoadComplete:](self, "setJavascriptLoadComplete:", 0);
  -[BENavigationHandler setWebView:](self, "setWebView:", v6);
  objc_msgSend(v6, "setBe_hasPendingOperations:", 1);
  objc_msgSend(v6, "setBe_hasCompletedLoad:", 0);
  -[BENavigationHandler _cancelReloadTimeout](self, "_cancelReloadTimeout");
  -[BENavigationHandler _cancelProvisionalLoadTimeout](self, "_cancelProvisionalLoadTimeout");
  -[BENavigationHandler _startContentLoadTimeout](self, "_startContentLoadTimeout");
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BENavigationHandler allObservers](self, "allObservers", 0));
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v17, "navigationHandler:didStartLoadOfURL:") & 1) != 0)
          objc_msgSend(v17, "navigationHandler:didStartLoadOfURL:", self, v11);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v14);
  }

}

- (void)webView:(id)a3 didFailProvisionalNavigation:(id)a4 withError:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[BENavigationHandler _cancelProvisionalLoadTimeout](self, "_cancelProvisionalLoadTimeout");
  objc_initWeak(&location, self);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1BD30;
  v13[3] = &unk_378018;
  objc_copyWeak(&v16, &location);
  v13[4] = self;
  v11 = v9;
  v14 = v11;
  v12 = v10;
  v15 = v12;
  -[BENavigationHandler _notifyLoadFailureError:completion:](self, "_notifyLoadFailureError:completion:", v12, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  WKNavigationResponse *pendingMainFrameLoadURLResponse;

  -[BENavigationHandler setRetryCount:](self, "setRetryCount:", 0, a4);
  -[BENavigationHandler setWebViewLoadComplete:](self, "setWebViewLoadComplete:", 1);
  -[BENavigationHandler _notifyLoadCompleteIfNecessary](self, "_notifyLoadCompleteIfNecessary");
  pendingMainFrameLoadURLResponse = self->_pendingMainFrameLoadURLResponse;
  self->_pendingMainFrameLoadURLResponse = 0;

}

- (void)webView:(id)a3 didFailNavigation:(id)a4 withError:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  objc_class *v15;
  NSString *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  id location;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  id v35;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_request"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "URL"));

  v13 = _BookEPUBLog();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v15 = (objc_class *)objc_opt_class(v8);
    v16 = NSStringFromClass(v15);
    v17 = (id)objc_claimAutoreleasedReturnValue(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "be_identifier"));
    *(_DWORD *)buf = 138544386;
    v27 = v17;
    v28 = 2114;
    v29 = v18;
    v30 = 2160;
    v31 = 1752392040;
    v32 = 2112;
    v33 = v12;
    v34 = 2114;
    v35 = v10;
    _os_log_impl(&dword_0, v14, OS_LOG_TYPE_ERROR, "<%{public}@ %{public}@> didFailNavigation url:%{mask.hash}@ error: %{public}@", buf, 0x34u);

  }
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1C108;
  v21[3] = &unk_378018;
  objc_copyWeak(&v24, &location);
  v21[4] = self;
  v19 = v12;
  v22 = v19;
  v20 = v10;
  v23 = v20;
  -[BENavigationHandler _notifyLoadFailureError:completion:](self, "_notifyLoadFailureError:completion:", v20, v21);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

}

- (void)_webView:(id)a3 webContentProcessDidTerminateWithReason:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "URL"));
  v8 = _BookEPUBLog();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "be_identifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
    v13 = 138544130;
    v14 = v10;
    v15 = 2160;
    v16 = 1752392040;
    v17 = 2112;
    v18 = v7;
    v19 = 2114;
    v20 = v11;
    _os_log_impl(&dword_0, v9, OS_LOG_TYPE_ERROR, "webView %{public}@ url: %{mask.hash}@ - webContentProcessDidTerminateWithReason: %{public}@", (uint8_t *)&v13, 0x2Au);

  }
  if ((unint64_t)(a4 - 1) >= 3)
    v12 = 0;
  else
    v12 = a4;
  -[BENavigationHandler _webView:contentFailedToLoadWithReason:](self, "_webView:contentFailedToLoadWithReason:", v6, v12);

}

- (void)_contentLoadTimeout
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BENavigationHandler webView](self, "webView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URL"));
  v5 = _BookEPUBLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "be_identifier"));
    v8 = 138543874;
    v9 = v7;
    v10 = 2160;
    v11 = 1752392040;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_ERROR, "webView: %{public}@ url: %{mask.hash}@ - _contentLoadTimeout", (uint8_t *)&v8, 0x20u);

  }
  -[BENavigationHandler _webView:contentFailedToLoadWithReason:](self, "_webView:contentFailedToLoadWithReason:", v3, 32);

}

- (void)_reloadTimeout
{
  void *v3;
  void *v4;
  char *v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  int v15;
  NSObject *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  NSObject *v20;

  -[BENavigationHandler setReloadTimeoutActive:](self, "setReloadTimeoutActive:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BENavigationHandler webView](self, "webView"));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v5 = (char *)objc_msgSend(v4, "applicationState");

    if (v5 == (_BYTE *)&dword_0 + 2)
    {
      objc_msgSend(v3, "setBe_requiresReload:", 1);
      v6 = _BookEPUBLog();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "be_identifier"));
        v15 = 138543362;
        v16 = v8;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "webView: %{public}@ Received reloadTimeout, but we are backgrounded.  Ignoring.", (uint8_t *)&v15, 0xCu);
LABEL_13:

      }
    }
    else
    {
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URL"));
      v10 = _BookEPUBLog();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "be_identifier"));
        v15 = 138543874;
        v16 = v12;
        v17 = 2160;
        v18 = 1752392040;
        v19 = 2112;
        v20 = v7;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_ERROR, "webView: %{public}@ url: %{mask.hash}@ - _reloadTimeout", (uint8_t *)&v15, 0x20u);

      }
      if (!v7)
      {
        v13 = _BookEPUBLog();
        v8 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "be_identifier"));
          v15 = 138543362;
          v16 = v14;
          _os_log_impl(&dword_0, v8, OS_LOG_TYPE_ERROR, "webView: %{public}@ Received reloadTimeout, but our webView has no url.  Ignoring.", (uint8_t *)&v15, 0xCu);

        }
        goto LABEL_13;
      }
      -[BENavigationHandler _webView:contentFailedToLoadWithReason:](self, "_webView:contentFailedToLoadWithReason:", v3, 64);
    }
  }
  else
  {
    v9 = _BookEPUBLog();
    v7 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_ERROR, "Received reloadTimeout, but our webView is gone.  Ignoring.", (uint8_t *)&v15, 2u);
    }
  }

}

- (void)_provisionalLoadTimeout
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BENavigationHandler webView](self, "webView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URL"));
  v5 = _BookEPUBLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "be_identifier"));
    v8 = 138543874;
    v9 = v7;
    v10 = 2160;
    v11 = 1752392040;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_ERROR, "webView: %{public}@ url: %{mask.hash}@ - _provisionalLoadTimeout #LOADTIMEOUT!", (uint8_t *)&v8, 0x20u);

  }
  -[BENavigationHandler _webView:contentFailedToLoadWithReason:](self, "_webView:contentFailedToLoadWithReason:", v3, 32);

}

- (void)attemptReload
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  void *v14;
  id v15;
  NSObject *v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  unint64_t v33;
  __int16 v34;
  unint64_t v35;
  _BYTE v36[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BENavigationHandler webView](self, "webView"));
  if (v3)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BENavigationHandler allObservers](self, "allObservers", 0));
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v25 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
          if ((objc_opt_respondsToSelector(v9, "navigationHandlerWebContentProcessAttemptingReload:") & 1) != 0)
            objc_msgSend(v9, "navigationHandlerWebContentProcessAttemptingReload:", self);
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
      }
      while (v6);
    }

    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "reloadFromOrigin"));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URL"));
    v12 = _BookEPUBLog();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "be_identifier"));
      *(_DWORD *)buf = 138543874;
      v29 = (uint64_t)v14;
      v30 = 2160;
      v31 = 1752392040;
      v32 = 2112;
      v33 = v11;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "webView: %{public}@ Attempting reload of url: %{mask.hash}@", buf, 0x20u);

    }
    if (v10 | v11)
    {
      -[BENavigationHandler setRetryCount:](self, "setRetryCount:", (char *)-[BENavigationHandler retryCount](self, "retryCount") + 1);
      v15 = _BookEPUBLog();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = -[BENavigationHandler retryCount](self, "retryCount");
        v18 = -[BENavigationHandler maxReloadAttempts](self, "maxReloadAttempts");
        *(_DWORD *)buf = 141558786;
        v29 = 1752392040;
        v30 = 2112;
        v31 = v11;
        v32 = 2048;
        v33 = v17;
        v34 = 2048;
        v35 = v18;
        _os_log_impl(&dword_0, v16, OS_LOG_TYPE_DEFAULT, "Attempting reload of url: %{mask.hash}@ - %ld/%ldattempts", buf, 0x2Au);
      }

      v19 = objc_opt_class(BEWKWebView);
      v20 = BUDynamicCast(v19, v3);
      v21 = objc_claimAutoreleasedReturnValue(v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject be_updateAXValueForMessage:](v21, "be_updateAXValueForMessage:", &__kCFBooleanTrue));
      -[NSObject be_updateAXCurrentReadingStateWithMessage:forValue:](v21, "be_updateAXCurrentReadingStateWithMessage:forValue:", CFSTR("BEWebProcessPluginNeedsReloadParameterKey"), v22);

      -[NSObject be_enableAX](v21, "be_enableAX");
      -[NSObject setBe_requiresReload:](v21, "setBe_requiresReload:", 0);
      -[BENavigationHandler _startReloadTimeout](self, "_startReloadTimeout");
    }
    else
    {
      v23 = _BookEPUBLog();
      v21 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v29 = (uint64_t)CFSTR("navigation");
        v30 = 2112;
        v31 = (uint64_t)CFSTR("url");
        _os_log_impl(&dword_0, v21, OS_LOG_TYPE_ERROR, "Attempting reload, but we don't have %@ %@", buf, 0x16u);
      }
    }

  }
}

- (void)_webView:(id)a3 contentFailedToLoadWithReason:(unint64_t)a4
{
  id v6;
  void *v7;
  const __CFString *v8;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  char *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *j;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  uint64_t v36;
  void *i;
  void *v38;
  WKNavigationResponse *pendingMainFrameLoadURLResponse;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  NSErrorUserInfoKey v49;
  const __CFString *v50;
  uint8_t v51[128];
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  NSObject *v57;
  __int16 v58;
  const __CFString *v59;
  __int16 v60;
  void *v61;

  v6 = a3;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "be_clearRegisteredFonts");
    v8 = CFSTR("Crash");
    switch(a4)
    {
      case 0uLL:
        v8 = CFSTR("Memory Limit");
        break;
      case 1uLL:
        v8 = CFSTR("CPU Limit");
        break;
      case 2uLL:
        v8 = CFSTR("Client Request");
        break;
      case 3uLL:
        break;
      default:
        if (a4 == 32)
        {
          v8 = CFSTR("Internal Timeout");
        }
        else if (a4 == 64)
        {
          v8 = CFSTR("Reload Timeout");
        }
        else
        {
          v8 = CFSTR("<Unhandled Case>");
        }
        break;
    }
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "URL"));
    v11 = _BookEPUBLog();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "be_identifier"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
      *(_DWORD *)buf = 138544386;
      v53 = v13;
      v54 = 2160;
      v55 = 1752392040;
      v56 = 2112;
      v57 = v10;
      v58 = 2114;
      v59 = v8;
      v60 = 2114;
      v61 = v14;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_FAULT, "webView:%{public}@ url: %{mask.hash}@ - contentFailedToLoadWithReason: %{public}@(%{public}@)", buf, 0x34u);

    }
    if (v10)
    {
      v15 = -[BENavigationHandler retryCount](self, "retryCount");
      if (v15 >= -[BENavigationHandler maxReloadAttempts](self, "maxReloadAttempts"))
      {
        objc_msgSend(v7, "setBe_requiresReload:", 1);
        v49 = NSDebugDescriptionErrorKey;
        v50 = v8;
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v50, &v49, 1));
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", WKErrorDomain, a4, v27));

        v29 = _BookEPUBLog();
        v30 = objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "be_identifier"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
          *(_DWORD *)buf = 138544386;
          v53 = v31;
          v54 = 2160;
          v55 = 1752392040;
          v56 = 2112;
          v57 = v10;
          v58 = 2114;
          v59 = v8;
          v60 = 2114;
          v61 = v32;
          _os_log_impl(&dword_0, v30, OS_LOG_TYPE_DEFAULT, "webView:%{public}@ Max reload attempts reached for url: %{mask.hash}@ reason: %{public}@(%{public}@).", buf, 0x34u);

        }
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[BENavigationHandler allObservers](self, "allObservers"));
        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
        if (v34)
        {
          v35 = v34;
          v36 = *(_QWORD *)v41;
          do
          {
            for (i = 0; i != v35; i = (char *)i + 1)
            {
              if (*(_QWORD *)v41 != v36)
                objc_enumerationMutation(v33);
              v38 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i);
              if ((objc_opt_respondsToSelector(v38, "navigationHandlerWebContentLoadFailed:reason:") & 1) != 0)
                objc_msgSend(v38, "navigationHandlerWebContentLoadFailed:reason:", self, v28);
            }
            v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
          }
          while (v35);
        }

        -[BENavigationHandler _notifyLoadFailureError:completion:](self, "_notifyLoadFailureError:completion:", v28, &stru_378038);
      }
      else
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
        v17 = (char *)objc_msgSend(v16, "applicationState");

        if (v17 == (_BYTE *)&dword_0 + 2)
        {
          v18 = _BookEPUBLog();
          v19 = objc_claimAutoreleasedReturnValue(v18);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "be_identifier"));
            *(_DWORD *)buf = 138543362;
            v53 = v20;
            _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "Application is in the background.  Marking reload required for webView:%{public}@", buf, 0xCu);

          }
          objc_msgSend(v7, "setBe_requiresReload:", 1);
        }
        else
        {
          -[BENavigationHandler attemptReload](self, "attemptReload");
        }
      }
    }
    else
    {
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[BENavigationHandler allObservers](self, "allObservers"));
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v45;
        do
        {
          for (j = 0; j != v23; j = (char *)j + 1)
          {
            if (*(_QWORD *)v45 != v24)
              objc_enumerationMutation(v21);
            v26 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)j);
            if ((objc_opt_respondsToSelector(v26, "navigationHandlerWebContentProcessFailedWithNoURL:") & 1) != 0)
              objc_msgSend(v26, "navigationHandlerWebContentProcessFailedWithNoURL:", v7);
          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
        }
        while (v23);
      }

    }
    pendingMainFrameLoadURLResponse = self->_pendingMainFrameLoadURLResponse;
    self->_pendingMainFrameLoadURLResponse = 0;

  }
  else
  {
    v9 = _BookEPUBLog();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_ERROR, "Content failed to load but we did not capture an associated webView! This means we can't call reload and we're stuck with a failed webview. We won't attempt to reload", buf, 2u);
    }
  }

}

- (void)_webView:(id)a3 renderingProgressDidChange:(unint64_t)a4
{
  __int16 v4;
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *j;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];

  v4 = a4;
  v6 = a3;
  if ((v4 & 0x100) != 0)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BENavigationHandler allObservers](self, "allObservers"));
    v13 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v23 != v15)
            objc_enumerationMutation(v7);
          v17 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
          if ((objc_opt_respondsToSelector(v17, "navigationHandlerFirstSignificantPaintCompleted:") & 1) != 0)
            objc_msgSend(v17, "navigationHandlerFirstSignificantPaintCompleted:", self);
        }
        v14 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v14);
    }
    goto LABEL_22;
  }
  if ((v4 & 0x40) != 0)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BENavigationHandler allObservers](self, "allObservers", 0));
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      do
      {
        for (j = 0; j != v9; j = (char *)j + 1)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)j);
          if ((objc_opt_respondsToSelector(v12, "navigationHandlerFirstPaintCompleted:") & 1) != 0)
            objc_msgSend(v12, "navigationHandlerFirstPaintCompleted:", self);
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      }
      while (v9);
    }
LABEL_22:

  }
}

- (void)userContentController:(id)a3 didReceiveScriptMessage:(id)a4
{
  void *v5;
  unsigned int v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "name", a3));
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("BENavigationHandlerJSLoadComplete"));

  if (v6)
  {
    -[BENavigationHandler setJavascriptLoadComplete:](self, "setJavascriptLoadComplete:", 1);
    -[BENavigationHandler _notifyLoadCompleteIfNecessary](self, "_notifyLoadCompleteIfNecessary");
  }
}

- (BOOL)_navigationIsUserInitiatedAndNotYetApproved:(id)a3
{
  id v4;
  unsigned __int8 v5;

  v4 = a3;
  if (-[BEDocumentExternalLoadApprovalCache didApproveLoadingExternalContentForBookID:](self->_approvalCache, "didApproveLoadingExternalContentForBookID:", self->_bookID)|| objc_msgSend(v4, "navigationType"))
  {
    v5 = 0;
  }
  else
  {
    v5 = objc_msgSend(v4, "_isUserInitiated");
  }

  return v5;
}

- (void)_decidePolicyForFootnoteOrPreviewNavigationAction:(id)a3 shouldObserveProvisionalLoadTimeout:(BOOL *)a4 webView:(id)a5 decisionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  unsigned int v21;
  void *v22;
  void *v23;
  unsigned __int8 v24;
  BEDocumentExternalLoadApprovalCache *v25;
  void *v26;
  NSString *v27;
  id v28;
  NSString *v29;
  BEDocumentExternalLoadApprovalCache *v30;
  void *v31;
  id v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  BEDocumentExternalLoadApprovalCache *v37;
  NSString *v38;
  id v39;
  id v40;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "request"));
  v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "URL"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v14, "absoluteURL"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "standardizedURL"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "fragment"));
  LOBYTE(v14) = objc_msgSend(v17, "hasSuffix:", CFSTR("__ibooks_ignore_load"));

  if ((v14 & 1) != 0)
  {
    v18 = 0;
    goto LABEL_31;
  }
  if ((BEURLHandlerURLIsApprovedToLoad(v16) & 1) != 0)
  {
    v18 = 1;
    goto LABEL_31;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[BENavigationHandler delegate](self, "delegate"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "targetFrame"));
  if (BEURLHandlerSchemeIsOkForBookToLoad(v16))
  {
    if (v20)
    {
      if (objc_msgSend(v20, "isMainFrame"))
      {
        if ((objc_opt_respondsToSelector(v19, "navigationHandler:handleInternalLoadRequest:") & 1) != 0)
        {
          v21 = objc_msgSend(v19, "navigationHandler:handleInternalLoadRequest:", self, v16);
        }
        else if ((objc_opt_respondsToSelector(v19, "urlForNavigationHandler") & 1) != 0)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "urlForNavigationHandler"));
          v21 = objc_msgSend(v16, "be_isEquivalentToURL:ignoringFragment:", v23, 1);

        }
        else
        {
          v21 = 1;
        }
        if (a4)
          *a4 = v21;
        goto LABEL_30;
      }
      goto LABEL_27;
    }
    if ((objc_opt_respondsToSelector(v19, "navigationHandler:handleInternalLoadRequestForNewWindow:") & 1) != 0)
      objc_msgSend(v19, "navigationHandler:handleInternalLoadRequestForNewWindow:", self, v16);
LABEL_29:
    v21 = 0;
    goto LABEL_30;
  }
  if (!v20 || objc_msgSend(v20, "isMainFrame"))
  {
    if ((objc_opt_respondsToSelector(v19, "navigationHandler:handleExternalLoadRequest:likelyUserInitiated:") & 1) != 0)
      objc_msgSend(v19, "navigationHandler:handleExternalLoadRequest:likelyUserInitiated:", self, v16, objc_msgSend(v10, "navigationType") == 0);
    goto LABEL_29;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[BEExternalIframeJS urlForExternalIframeAuthorization](self->_externalIframeJS, "urlForExternalIframeAuthorization"));
  if ((objc_msgSend(v16, "isEqual:", v22) & 1) != 0)
  {

    goto LABEL_21;
  }
  v24 = -[BENavigationHandler _navigationIsUserInitiatedAndNotYetApproved:](self, "_navigationIsUserInitiatedAndNotYetApproved:", v10);

  if ((v24 & 1) != 0)
  {
LABEL_21:
    if ((objc_opt_respondsToSelector(v19, "navigationHandler:handleUserRequestForFrameToLoadExternalURL:completion:") & 1) != 0)
    {
      v25 = self->_approvalCache;
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[BEExternalIframeJS postApprovalToLoadScript](self->_externalIframeJS, "postApprovalToLoadScript"));
      v27 = self->_bookID;
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_1D814;
      v36[3] = &unk_3780E0;
      v37 = v25;
      v38 = v27;
      v39 = v11;
      v40 = v26;
      v28 = v26;
      v29 = v27;
      v30 = v25;
      objc_msgSend(v19, "navigationHandler:handleUserRequestForFrameToLoadExternalURL:completion:", self, v16, v36);

    }
    goto LABEL_29;
  }
  if (!-[BEDocumentExternalLoadApprovalCache didApproveLoadingExternalContentForBookID:](self->_approvalCache, "didApproveLoadingExternalContentForBookID:", self->_bookID))
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[BEExternalIframeJS preApprovalToLoadScriptForURL:](self->_externalIframeJS, "preApprovalToLoadScriptForURL:", v16));
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_1DA1C;
    v34[3] = &unk_378108;
    v35 = v16;
    objc_msgSend(v11, "evaluateJavaScript:completionHandler:", v31, v34);

    goto LABEL_29;
  }
LABEL_27:
  v21 = 1;
LABEL_30:

  v18 = v21;
LABEL_31:
  v32 = objc_retainBlock(v12);
  v33 = v32;
  if (v32)
    (*((void (**)(id, uint64_t))v32 + 2))(v32, v18);

}

- (BENavigationHandlerDelegate)delegate
{
  return (BENavigationHandlerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)shouldWaitForJavascriptLoadComplete
{
  return self->_shouldWaitForJavascriptLoadComplete;
}

- (void)setShouldWaitForJavascriptLoadComplete:(BOOL)a3
{
  self->_shouldWaitForJavascriptLoadComplete = a3;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (NSString)bookID
{
  return self->_bookID;
}

- (void)setBookID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BEExternalIframeJS)externalIframeJS
{
  return self->_externalIframeJS;
}

- (void)setExternalIframeJS:(id)a3
{
  objc_storeStrong((id *)&self->_externalIframeJS, a3);
}

- (unint64_t)maxReloadAttempts
{
  return self->_maxReloadAttempts;
}

- (void)setMaxReloadAttempts:(unint64_t)a3
{
  self->_maxReloadAttempts = a3;
}

- (double)loadTimeout
{
  return self->_loadTimeout;
}

- (void)setLoadTimeout:(double)a3
{
  self->_loadTimeout = a3;
}

- (NSMutableArray)postLoadCompleteOrFailureWork
{
  return self->_postLoadCompleteOrFailureWork;
}

- (void)setPostLoadCompleteOrFailureWork:(id)a3
{
  objc_storeStrong((id *)&self->_postLoadCompleteOrFailureWork, a3);
}

- (BEDocumentExternalLoadApprovalCache)approvalCache
{
  return self->_approvalCache;
}

- (void)setApprovalCache:(id)a3
{
  objc_storeStrong((id *)&self->_approvalCache, a3);
}

- (WKNavigationResponse)pendingMainFrameLoadURLResponse
{
  return self->_pendingMainFrameLoadURLResponse;
}

- (void)setPendingMainFrameLoadURLResponse:(id)a3
{
  objc_storeStrong((id *)&self->_pendingMainFrameLoadURLResponse, a3);
}

- (BOOL)javascriptLoadComplete
{
  return self->_javascriptLoadComplete;
}

- (void)setJavascriptLoadComplete:(BOOL)a3
{
  self->_javascriptLoadComplete = a3;
}

- (BOOL)webViewLoadComplete
{
  return self->_webViewLoadComplete;
}

- (void)setWebViewLoadComplete:(BOOL)a3
{
  self->_webViewLoadComplete = a3;
}

- (NSURL)mainFrameNavigationURL
{
  return self->_mainFrameNavigationURL;
}

- (void)setMainFrameNavigationURL:(id)a3
{
  objc_storeStrong((id *)&self->_mainFrameNavigationURL, a3);
}

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(unint64_t)a3
{
  self->_retryCount = a3;
}

- (BOOL)reloadTimeoutActive
{
  return self->_reloadTimeoutActive;
}

- (void)setReloadTimeoutActive:(BOOL)a3
{
  self->_reloadTimeoutActive = a3;
}

- (unint64_t)observerCount
{
  return self->_observerCount;
}

- (void)setObserverCount:(unint64_t)a3
{
  self->_observerCount = a3;
}

- (NSHashTable)_observers
{
  return self->__observers;
}

- (void)set_observers:(id)a3
{
  objc_storeStrong((id *)&self->__observers, a3);
}

- (os_unfair_lock_s)accessLock
{
  return self->_accessLock;
}

- (void)setAccessLock:(os_unfair_lock_s)a3
{
  self->_accessLock = a3;
}

- (WKWebView)webView
{
  return (WKWebView *)objc_loadWeakRetained((id *)&self->_webView);
}

- (void)setWebView:(id)a3
{
  objc_storeWeak((id *)&self->_webView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_webView);
  objc_storeStrong((id *)&self->__observers, 0);
  objc_storeStrong((id *)&self->_mainFrameNavigationURL, 0);
  objc_storeStrong((id *)&self->_pendingMainFrameLoadURLResponse, 0);
  objc_storeStrong((id *)&self->_approvalCache, 0);
  objc_storeStrong((id *)&self->_postLoadCompleteOrFailureWork, 0);
  objc_storeStrong((id *)&self->_externalIframeJS, 0);
  objc_storeStrong((id *)&self->_bookID, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
