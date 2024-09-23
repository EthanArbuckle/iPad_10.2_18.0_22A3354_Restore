@implementation ChromeContextOperation

- (ChromeContextOperation)initWithChromeViewController:(id)a3 fallbackCoordinationBlock:(id)a4
{
  id v6;
  id v7;
  ChromeContextOperation *v8;
  ChromeContextOperation *v9;
  NSMutableArray *v10;
  NSMutableArray *coordinationBlocks;
  NSMutableArray *v12;
  NSMutableArray *completionBlocks;
  id v14;
  id fallbackBlock;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)ChromeContextOperation;
  v8 = -[ChromeContextOperation init](&v17, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_chromeViewController, v6);
    v10 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2);
    coordinationBlocks = v9->_coordinationBlocks;
    v9->_coordinationBlocks = v10;

    v12 = (NSMutableArray *)objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2);
    completionBlocks = v9->_completionBlocks;
    v9->_completionBlocks = v12;

    v14 = objc_msgSend(v7, "copy");
    fallbackBlock = v9->_fallbackBlock;
    v9->_fallbackBlock = v14;

  }
  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  id WeakRetained;
  _QWORD *v7;
  NSMutableArray *v8;
  void *v9;
  NSMutableArray *v10;
  void *v11;

  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v5 = objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  v7 = objc_msgSend(v5, "initWithChromeViewController:fallbackCoordinationBlock:", WeakRetained, self->_fallbackBlock);

  v8 = -[NSMutableArray initWithArray:copyItems:](+[NSMutableArray allocWithZone:](NSMutableArray, "allocWithZone:", a3), "initWithArray:copyItems:", self->_coordinationBlocks, 1);
  v9 = (void *)v7[1];
  v7[1] = v8;

  v10 = -[NSMutableArray initWithArray:copyItems:](+[NSMutableArray allocWithZone:](NSMutableArray, "allocWithZone:", a3), "initWithArray:copyItems:", self->_completionBlocks, 1);
  v11 = (void *)v7[2];
  v7[2] = v10;

  *((_BYTE *)v7 + 40) = self->_executing;
  *((_BYTE *)v7 + 41) = self->_finished;
  return v7;
}

- (BOOL)isConcurrent
{
  return 0;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isExecuting
{
  return self->_executing;
}

- (void)start
{
  id WeakRetained;
  id v4;
  NSObject *v5;
  id v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  const char *v13;
  id v14;
  id v15;
  id v16;
  objc_class *v17;
  NSString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  NSObject *v26;
  id v27;
  objc_class *v28;
  NSString *v29;
  void *v30;
  void *v31;
  void *v32;
  __CFString *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  NSMutableArray *coordinationBlocks;
  NSMutableArray *completionBlocks;
  uint64_t (**fallbackBlock)(id, id, void *, unsigned __int8 *);
  uint64_t v49;
  uint64_t v50;
  id v51;
  NSObject *v52;
  id v53;
  objc_class *v54;
  NSString *v55;
  void *v56;
  void *v57;
  void *v58;
  __CFString *v59;
  void *v60;
  id v61;
  NSObject *v62;
  id v63;
  id v64;
  id v65;
  _QWORD *v66;
  void *v67;
  unsigned int v68;
  id v69;
  NSObject *v70;
  _BOOL4 v71;
  id v72;
  objc_class *v73;
  NSString *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  __CFString *v79;
  id v80;
  id v81;
  void *v82;
  void *v83;
  __CFString *v84;
  id v85;
  _QWORD v86[4];
  id v87;
  id v88;
  id v89;
  ChromeContextOperation *v90;
  unsigned __int8 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  unsigned __int8 v96;
  uint8_t buf[4];
  const __CFString *v98;
  __int16 v99;
  id v100;
  __int16 v101;
  __CFString *v102;
  _BYTE v103[128];

  WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  if (!WeakRetained)
  {
    v14 = sub_100278348();
    v5 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v98 = CFSTR("<nil>");
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}@] Will not process coordination blocks, no chrome", buf, 0xCu);
    }
    goto LABEL_21;
  }
  if (-[ChromeContextOperation isCancelled](self, "isCancelled"))
  {
    v4 = sub_100278348();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = WeakRetained;
      v7 = (objc_class *)objc_opt_class(v6);
      v8 = NSStringFromClass(v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "performSelector:", "accessibilityIdentifier"));
        v11 = v10;
        if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
        {
          v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

          goto LABEL_9;
        }

      }
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_9:

      *(_DWORD *)buf = 138543362;
      v98 = v12;
      v13 = "[%{public}@] Will not process coordination blocks, cancelled";
LABEL_20:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, v13, buf, 0xCu);

    }
LABEL_21:

    -[ChromeContextOperation setFinished:](self, "setFinished:", 1);
    goto LABEL_22;
  }
  if (-[ChromeContextOperation isExecuting](self, "isExecuting"))
  {
    v15 = sub_100278348();
    v5 = objc_claimAutoreleasedReturnValue(v15);
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      goto LABEL_21;
    v16 = WeakRetained;
    v17 = (objc_class *)objc_opt_class(v16);
    v18 = NSStringFromClass(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    if ((objc_opt_respondsToSelector(v16, "accessibilityIdentifier") & 1) != 0)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "performSelector:", "accessibilityIdentifier"));
      v21 = v20;
      if (v20 && !objc_msgSend(v20, "isEqualToString:", v19))
      {
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v19, v16, v21));

        goto LABEL_19;
      }

    }
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v19, v16));
LABEL_19:

    *(_DWORD *)buf = 138543362;
    v98 = v12;
    v13 = "[%{public}@] Will not process coordination blocks, already locked";
    goto LABEL_20;
  }
  v96 = 1;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "contexts"));
  v23 = objc_msgSend(v22, "copy");

  do
  {
    v24 = -[NSMutableArray copy](self->_coordinationBlocks, "copy");
    -[NSMutableArray removeAllObjects](self->_coordinationBlocks, "removeAllObjects");
    v25 = sub_100278348();
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      goto LABEL_31;
    v27 = WeakRetained;
    v28 = (objc_class *)objc_opt_class(v27);
    v29 = NSStringFromClass(v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    if ((objc_opt_respondsToSelector(v27, "accessibilityIdentifier") & 1) != 0)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "performSelector:", "accessibilityIdentifier"));
      v32 = v31;
      if (v31 && !objc_msgSend(v31, "isEqualToString:", v30))
      {
        v33 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v30, v27, v32));

        goto LABEL_30;
      }

    }
    v33 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v30, v27));
LABEL_30:

    v34 = objc_msgSend(v24, "count");
    *(_DWORD *)buf = 138543618;
    v98 = v33;
    v99 = 2048;
    v100 = v34;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "[%{public}@] Will process %lu coordination blocks", buf, 0x16u);

LABEL_31:
    v94 = 0u;
    v95 = 0u;
    v92 = 0u;
    v93 = 0u;
    v35 = v24;
    v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v92, v103, 16);
    if (v36)
    {
      v37 = v36;
      v38 = *(_QWORD *)v93;
      do
      {
        v39 = 0;
        v40 = v23;
        do
        {
          if (*(_QWORD *)v93 != v38)
            objc_enumerationMutation(v35);
          v41 = (*(uint64_t (**)(void))(*(_QWORD *)(*((_QWORD *)&v92 + 1) + 8 * (_QWORD)v39) + 16))();
          v42 = objc_claimAutoreleasedReturnValue(v41);
          v43 = (void *)v42;
          if (v42)
            v44 = (void *)v42;
          else
            v44 = v40;
          v23 = v44;

          v39 = (char *)v39 + 1;
          v40 = v23;
        }
        while (v37 != v39);
        v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v92, v103, 16);
      }
      while (v37);
    }

  }
  while (-[NSMutableArray count](self->_coordinationBlocks, "count"));
  -[ChromeContextOperation setExecuting:](self, "setExecuting:", 1);
  v45 = -[NSMutableArray copy](self->_completionBlocks, "copy");
  coordinationBlocks = self->_coordinationBlocks;
  self->_coordinationBlocks = 0;

  completionBlocks = self->_completionBlocks;
  self->_completionBlocks = 0;

  if (!objc_msgSend(v23, "count"))
  {
    fallbackBlock = (uint64_t (**)(id, id, void *, unsigned __int8 *))self->_fallbackBlock;
    if (fallbackBlock)
    {
      v49 = fallbackBlock[2](fallbackBlock, WeakRetained, &__NSArray0__struct, &v96);
      v50 = objc_claimAutoreleasedReturnValue(v49);

      v23 = (id)v50;
    }
  }
  if (!objc_msgSend(v23, "count"))
  {
    v51 = sub_100278348();
    v52 = objc_claimAutoreleasedReturnValue(v51);
    if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT))
    {
      v53 = WeakRetained;
      v54 = (objc_class *)objc_opt_class(v53);
      v55 = NSStringFromClass(v54);
      v56 = (void *)objc_claimAutoreleasedReturnValue(v55);
      if ((objc_opt_respondsToSelector(v53, "accessibilityIdentifier") & 1) == 0)
        goto LABEL_53;
      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "performSelector:", "accessibilityIdentifier"));
      v58 = v57;
      if (v57 && !objc_msgSend(v57, "isEqualToString:", v56))
      {
        v59 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v56, v53, v58));

      }
      else
      {

LABEL_53:
        v59 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v56, v53));
      }

      *(_DWORD *)buf = 138543362;
      v98 = v59;
      _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_FAULT, "[%{public}@] No contexts after coordination, will complain loudly", buf, 0xCu);

    }
    v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInvalidArgumentException, CFSTR("You cannot allow the chrome to be left with no contexts"), 0));
    objc_msgSend(v60, "raise");

  }
  v61 = sub_10043196C();
  v62 = objc_claimAutoreleasedReturnValue(v61);
  if (os_signpost_enabled(v62))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v62, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "\"ContextOperation\", ", buf, 2u);
  }

  v86[0] = _NSConcreteStackBlock;
  v86[1] = 3221225472;
  v86[2] = sub_100278388;
  v86[3] = &unk_1011AE758;
  v63 = v45;
  v87 = v63;
  v64 = WeakRetained;
  v88 = v64;
  v65 = v23;
  v91 = v96;
  v89 = v65;
  v90 = self;
  v66 = objc_retainBlock(v86);
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "contexts"));
  v68 = objc_msgSend(v65, "isEqualToArray:", v67);

  v69 = sub_100278348();
  v70 = objc_claimAutoreleasedReturnValue(v69);
  v71 = os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG);
  if (!v68)
  {
    if (!v71)
    {
LABEL_76:

      objc_msgSend(v64, "_setContexts:animated:completion:", v65, v96, v66);
      goto LABEL_77;
    }
    v72 = v64;
    v73 = (objc_class *)objc_opt_class(v72);
    v74 = NSStringFromClass(v73);
    v75 = (void *)objc_claimAutoreleasedReturnValue(v74);
    if ((objc_opt_respondsToSelector(v72, "accessibilityIdentifier") & 1) != 0)
    {
      v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "performSelector:", "accessibilityIdentifier"));
      v77 = v76;
      if (v76 && !objc_msgSend(v76, "isEqualToString:", v75))
      {
        v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v75, v72, v77));

        goto LABEL_68;
      }

    }
    v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v75, v72));
LABEL_68:

    v79 = v78;
    v80 = objc_msgSend(v65, "count");
    v81 = v65;
    v82 = v81;
    if (v81)
    {
      if (objc_msgSend(v81, "count"))
      {
        v85 = v80;
        v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "componentsJoinedByString:", CFSTR(", ")));
        v84 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> [%@]"), v82, v83));

        v80 = v85;
      }
      else
      {
        v84 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%p> (empty)"), v82));
      }
    }
    else
    {
      v84 = CFSTR("<nil>");
    }

    *(_DWORD *)buf = 138543874;
    v98 = v79;
    v99 = 2048;
    v100 = v80;
    v101 = 2114;
    v102 = v84;
    _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEBUG, "[%{public}@] Will set %lu contexts on chrome (%{public}@)", buf, 0x20u);

    goto LABEL_76;
  }
  if (v71)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEBUG, "Contexts after coordination identical to existing contexts, just stop here", buf, 2u);
  }

  ((void (*)(_QWORD *))v66[2])(v66);
LABEL_77:

LABEL_22:
}

- (void)addContextCoordinationBlock:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  NSMutableArray *coordinationBlocks;
  id v16;
  uint8_t buf[4];
  __CFString *v18;

  v4 = a3;
  if (v4 && !-[ChromeContextOperation isExecuting](self, "isExecuting"))
  {
    v5 = sub_100278348();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
LABEL_13:

      coordinationBlocks = self->_coordinationBlocks;
      v16 = objc_msgSend(v4, "copy");
      -[NSMutableArray addObject:](coordinationBlocks, "addObject:", v16);

      goto LABEL_14;
    }
    v7 = objc_loadWeakRetained((id *)&self->_chromeViewController);
    v8 = v7;
    if (!v7)
    {
      v14 = CFSTR("<nil>");
      goto LABEL_12;
    }
    v9 = (objc_class *)objc_opt_class(v7);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "performSelector:", "accessibilityIdentifier"));
      v13 = v12;
      if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
      {
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

        goto LABEL_10;
      }

    }
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_10:

LABEL_12:
    *(_DWORD *)buf = 138543362;
    v18 = v14;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%{public}@] Will add coordination block", buf, 0xCu);

    goto LABEL_13;
  }
LABEL_14:

}

- (void)setFallbackCoordinationBlock:(id)a3
{
  id v4;
  id fallbackBlock;

  v4 = objc_msgSend(a3, "copy");
  fallbackBlock = self->_fallbackBlock;
  self->_fallbackBlock = v4;

}

- (void)addCompletionBlock:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  NSMutableArray *completionBlocks;
  id v16;
  uint8_t buf[4];
  __CFString *v18;

  v4 = a3;
  if (v4 && !-[ChromeContextOperation isExecuting](self, "isExecuting"))
  {
    v5 = sub_100278348();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
LABEL_13:

      completionBlocks = self->_completionBlocks;
      v16 = objc_msgSend(v4, "copy");
      -[NSMutableArray addObject:](completionBlocks, "addObject:", v16);

      goto LABEL_14;
    }
    v7 = objc_loadWeakRetained((id *)&self->_chromeViewController);
    v8 = v7;
    if (!v7)
    {
      v14 = CFSTR("<nil>");
      goto LABEL_12;
    }
    v9 = (objc_class *)objc_opt_class(v7);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "performSelector:", "accessibilityIdentifier"));
      v13 = v12;
      if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
      {
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

        goto LABEL_10;
      }

    }
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_10:

LABEL_12:
    *(_DWORD *)buf = 138543362;
    v18 = v14;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%{public}@] Will add completion block", buf, 0xCu);

    goto LABEL_13;
  }
LABEL_14:

}

- (void)setExecuting:(BOOL)a3
{
  if (self->_executing != a3)
  {
    -[ChromeContextOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
    self->_executing = a3;
    -[ChromeContextOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
  }
}

- (void)setFinished:(BOOL)a3
{
  if (self->_finished != a3)
  {
    -[ChromeContextOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
    self->_finished = a3;
    -[ChromeContextOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFinished"));
  }
}

- (void)_completeOperation
{
  -[ChromeContextOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
  -[ChromeContextOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
  self->_executing = 0;
  self->_finished = 1;
  -[ChromeContextOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
  -[ChromeContextOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFinished"));
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_storeStrong(&self->_fallbackBlock, 0);
  objc_storeStrong((id *)&self->_completionBlocks, 0);
  objc_storeStrong((id *)&self->_coordinationBlocks, 0);
}

@end
