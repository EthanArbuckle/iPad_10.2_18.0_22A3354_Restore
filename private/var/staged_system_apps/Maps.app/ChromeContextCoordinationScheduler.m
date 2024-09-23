@implementation ChromeContextCoordinationScheduler

- (ChromeContextCoordinationScheduler)initWithChromeViewController:(id)a3
{
  id v4;
  ChromeContextCoordinationScheduler *v5;
  ChromeContextCoordinationScheduler *v6;
  ChromeContextCoordinationScheduler *v7;

  v4 = a3;
  if (v4)
  {
    v5 = -[ChromeContextCoordinationScheduler init](self, "init");
    v6 = v5;
    if (v5)
      objc_storeWeak((id *)&v5->_chromeViewController, v4);
    self = v6;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)scheduleBlock:(id)a3
{
  -[ChromeContextCoordinationScheduler scheduleBlock:completionHandler:](self, "scheduleBlock:completionHandler:", a3, 0);
}

- (void)scheduleBlock:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  os_signpost_id_t v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  ChromeContextOperation **p_deferredOperation;
  id WeakRetained;
  void *v16;
  id v17;
  unsigned int v18;
  ChromeContextOperation *v19;
  ChromeViewController **p_chromeViewController;
  id v21;
  ChromeContextOperation *v22;
  id v23;
  id v24;
  id v25;
  NSObject *v26;
  id v27;
  void *v28;
  objc_class *v29;
  NSString *v30;
  void *v31;
  void *v32;
  void *v33;
  __CFString *v34;
  void *v35;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  os_signpost_id_t v40;
  uint8_t buf[4];
  __CFString *v42;

  v6 = a3;
  v7 = a4;
  v8 = sub_10043196C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = os_signpost_id_generate(v9);

  v11 = sub_10043196C();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = v12;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, v10, "\"CoordinatedContextChange\", ", buf, 2u);
  }

  p_deferredOperation = &self->_deferredOperation;
  WeakRetained = objc_loadWeakRetained((id *)&self->_deferredOperation);
  if (!WeakRetained
    || (v16 = WeakRetained,
        v17 = objc_loadWeakRetained((id *)&self->_deferredOperation),
        v18 = objc_msgSend(v17, "isExecuting"),
        v17,
        v16,
        v18))
  {
    v19 = [ChromeContextOperation alloc];
    p_chromeViewController = &self->_chromeViewController;
    v21 = objc_loadWeakRetained((id *)&self->_chromeViewController);
    v22 = -[ChromeContextOperation initWithChromeViewController:fallbackCoordinationBlock:](v19, "initWithChromeViewController:fallbackCoordinationBlock:", v21, self->_fallbackBlock);

    -[ChromeContextOperation addContextCoordinationBlock:](v22, "addContextCoordinationBlock:", v6);
    v23 = objc_loadWeakRetained((id *)p_deferredOperation);

    if (v23)
    {
      v24 = objc_loadWeakRetained((id *)p_deferredOperation);
      -[ChromeContextOperation addDependency:](v22, "addDependency:", v24);

    }
    objc_storeWeak((id *)p_deferredOperation, v22);
    v25 = sub_100278348();
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      goto LABEL_19;
    v27 = objc_loadWeakRetained((id *)p_chromeViewController);
    v28 = v27;
    if (!v27)
    {
      v34 = CFSTR("<nil>");
      goto LABEL_18;
    }
    v29 = (objc_class *)objc_opt_class(v27);
    v30 = NSStringFromClass(v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
    if ((objc_opt_respondsToSelector(v28, "accessibilityIdentifier") & 1) != 0)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "performSelector:", "accessibilityIdentifier"));
      v33 = v32;
      if (v32 && !objc_msgSend(v32, "isEqualToString:", v31))
      {
        v34 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v31, v28, v33));

        goto LABEL_15;
      }

    }
    v34 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v31, v28));
LABEL_15:

LABEL_18:
    *(_DWORD *)buf = 138543362;
    v42 = v34;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "[%{public}@] Scheduling coordination block operation", buf, 0xCu);

LABEL_19:
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    objc_msgSend(v35, "addOperation:", v22);

    goto LABEL_20;
  }
  v22 = (ChromeContextOperation *)objc_loadWeakRetained((id *)&self->_deferredOperation);
  -[ChromeContextOperation addContextCoordinationBlock:](v22, "addContextCoordinationBlock:", v6);
LABEL_20:

  v36 = objc_loadWeakRetained((id *)p_deferredOperation);
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_100278E64;
  v38[3] = &unk_1011AE780;
  v39 = v7;
  v40 = v10;
  v37 = v7;
  objc_msgSend(v36, "addCompletionBlock:", v38);

}

- (void)setFallbackBlock:(id)a3
{
  id v4;
  id v5;
  id fallbackBlock;
  id WeakRetained;

  v4 = a3;
  v5 = objc_msgSend(v4, "copy");
  fallbackBlock = self->_fallbackBlock;
  self->_fallbackBlock = v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_deferredOperation);
  objc_msgSend(WeakRetained, "setFallbackCoordinationBlock:", v4);

}

- (void)commit
{
  ChromeContextOperation **p_deferredOperation;
  id WeakRetained;
  void *v5;
  unsigned int v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  id v10;
  void *v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  id v18;
  id v19;
  objc_class *v20;
  NSString *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  objc_class *v27;
  NSString *v28;
  void *v29;
  void *v30;
  void *v31;
  __CFString *v32;
  const char *v33;
  uint8_t buf[4];
  __CFString *v35;

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  p_deferredOperation = &self->_deferredOperation;
  WeakRetained = objc_loadWeakRetained((id *)&self->_deferredOperation);
  v5 = WeakRetained;
  if (!WeakRetained)
  {
    v18 = sub_100278348();
    v8 = objc_claimAutoreleasedReturnValue(v18);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      goto LABEL_36;
    v19 = objc_loadWeakRetained((id *)&self->_chromeViewController);
    v11 = v19;
    if (!v19)
    {
      v17 = CFSTR("<nil>");
      goto LABEL_28;
    }
    v20 = (objc_class *)objc_opt_class(v19);
    v21 = NSStringFromClass(v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    if ((objc_opt_respondsToSelector(v11, "accessibilityIdentifier") & 1) != 0)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "performSelector:", "accessibilityIdentifier"));
      v24 = v23;
      if (v23 && !objc_msgSend(v23, "isEqualToString:", v22))
      {
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v22, v11, v24));

        goto LABEL_18;
      }

    }
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v22, v11));
LABEL_18:

LABEL_28:
    *(_DWORD *)buf = 138543362;
    v35 = v17;
    v33 = "[%{public}@] Nothing to commit: no deferred operation";
LABEL_31:
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, v33, buf, 0xCu);

    goto LABEL_36;
  }
  v6 = objc_msgSend(WeakRetained, "isExecuting");
  v7 = sub_100278348();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (!v6)
  {
    if (!v9)
      goto LABEL_34;
    v25 = objc_loadWeakRetained((id *)&self->_chromeViewController);
    v26 = v25;
    if (!v25)
    {
      v32 = CFSTR("<nil>");
      goto LABEL_33;
    }
    v27 = (objc_class *)objc_opt_class(v25);
    v28 = NSStringFromClass(v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    if ((objc_opt_respondsToSelector(v26, "accessibilityIdentifier") & 1) != 0)
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "performSelector:", "accessibilityIdentifier"));
      v31 = v30;
      if (v30 && !objc_msgSend(v30, "isEqualToString:", v29))
      {
        v32 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v29, v26, v31));

        goto LABEL_26;
      }

    }
    v32 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v29, v26));
LABEL_26:

LABEL_33:
    *(_DWORD *)buf = 138543362;
    v35 = v32;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[%{public}@] Committing deferred operation immediately", buf, 0xCu);

LABEL_34:
    v8 = objc_msgSend(v5, "copy");
    objc_storeWeak((id *)p_deferredOperation, 0);
    if (v8)
    {
      objc_msgSend(v5, "cancel");
      objc_storeWeak((id *)p_deferredOperation, v8);
      -[NSObject start](v8, "start");
    }
    goto LABEL_36;
  }
  if (v9)
  {
    v10 = objc_loadWeakRetained((id *)&self->_chromeViewController);
    v11 = v10;
    if (!v10)
    {
      v17 = CFSTR("<nil>");
      goto LABEL_30;
    }
    v12 = (objc_class *)objc_opt_class(v10);
    v13 = NSStringFromClass(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    if ((objc_opt_respondsToSelector(v11, "accessibilityIdentifier") & 1) != 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "performSelector:", "accessibilityIdentifier"));
      v16 = v15;
      if (v15 && !objc_msgSend(v15, "isEqualToString:", v14))
      {
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v14, v11, v16));

        goto LABEL_10;
      }

    }
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v14, v11));
LABEL_10:

LABEL_30:
    *(_DWORD *)buf = 138543362;
    v35 = v17;
    v33 = "[%{public}@] Nothing to commit: deferred operation is already locked";
    goto LABEL_31;
  }
LABEL_36:

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fallbackBlock, 0);
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_destroyWeak((id *)&self->_deferredOperation);
}

@end
