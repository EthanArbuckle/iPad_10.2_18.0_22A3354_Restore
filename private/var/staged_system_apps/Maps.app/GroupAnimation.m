@implementation GroupAnimation

+ (id)animation
{
  return objc_alloc_init((Class)a1);
}

- (GroupAnimation)init
{
  GroupAnimation *v2;
  GroupAnimation *v3;
  double v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GroupAnimation;
  v2 = -[GroupAnimation init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    objc_msgSend((id)objc_opt_class(v2), "defaultAnimationDuration");
    v3->_duration = v4;
    v3->_animated = 1;
  }
  return v3;
}

- (BOOL)hasAnimations
{
  return -[NSMutableArray count](self->_animations, "count") != 0;
}

- (BOOL)isEmpty
{
  return !self->_preparations
      && !-[NSMutableArray count](self->_animations, "count")
      && -[NSMutableArray count](self->_completions, "count") == 0;
}

- (void)addPreparation:(id)a3
{
  -[GroupAnimation addPreparation:animations:completion:](self, "addPreparation:animations:completion:", a3, 0, 0);
}

- (void)addAnimations:(id)a3
{
  -[GroupAnimation addAnimations:completion:](self, "addAnimations:completion:", a3, 0);
}

- (void)addCompletion:(id)a3
{
  -[GroupAnimation addAnimations:completion:](self, "addAnimations:completion:", 0, a3);
}

- (void)addAnimations:(id)a3 completion:(id)a4
{
  -[GroupAnimation addPreparation:animations:completion:](self, "addPreparation:animations:completion:", 0, a3, a4);
}

- (void)addPreparation:(id)a3 animations:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSMutableArray *preparations;
  NSMutableArray *v12;
  NSMutableArray *v13;
  id v14;
  NSMutableArray *animations;
  NSMutableArray *v16;
  NSMutableArray *v17;
  id v18;
  NSMutableArray *completions;
  NSMutableArray *v20;
  NSMutableArray *v21;
  id v22;
  id v23;
  NSObject *v24;
  void *v25;
  id v26;
  NSObject *v27;
  char *v28;
  id v29;
  NSObject *v30;
  void *v31;
  id v32;
  NSObject *v33;
  char *v34;
  id v35;
  NSObject *v36;
  void *v37;
  id v38;
  NSObject *v39;
  char *v40;
  int v41;
  const char *v42;
  __int16 v43;
  const char *v44;
  __int16 v45;
  int v46;
  __int16 v47;
  const char *v48;
  __int16 v49;
  void *v50;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    if (!self->_didPrepare)
      goto LABEL_3;
    v23 = sub_1004318FC();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("cannot add preparations, already prepared")));
      v41 = 136316162;
      v42 = "-[GroupAnimation addPreparation:animations:completion:]";
      v43 = 2080;
      v44 = "GroupAnimation.m";
      v45 = 1024;
      v46 = 87;
      v47 = 2080;
      v48 = "!preparations || !_didPrepare";
      v49 = 2112;
      v50 = v25;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", (uint8_t *)&v41, 0x30u);

    }
    if (sub_100A70734())
    {
      v26 = sub_1004318FC();
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v28 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v41 = 138412290;
        v42 = v28;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v41, 0xCu);

      }
    }
    if (!self->_didPrepare)
    {
LABEL_3:
      preparations = self->_preparations;
      if (!preparations)
      {
        v12 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
        v13 = self->_preparations;
        self->_preparations = v12;

        preparations = self->_preparations;
      }
      v14 = objc_msgSend(v8, "copy");
      -[NSMutableArray addObject:](preparations, "addObject:", v14);

    }
  }
  if (v9)
  {
    if (self->_didAnimate)
    {
      v29 = sub_1004318FC();
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("cannot add animations, already animated")));
        v41 = 136316162;
        v42 = "-[GroupAnimation addPreparation:animations:completion:]";
        v43 = 2080;
        v44 = "GroupAnimation.m";
        v45 = 1024;
        v46 = 94;
        v47 = 2080;
        v48 = "!animations || !_didAnimate";
        v49 = 2112;
        v50 = v31;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", (uint8_t *)&v41, 0x30u);

      }
      if (sub_100A70734())
      {
        v32 = sub_1004318FC();
        v33 = objc_claimAutoreleasedReturnValue(v32);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          v34 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v41 = 138412290;
          v42 = v34;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v41, 0xCu);

        }
      }
    }
    animations = self->_animations;
    if (!animations)
    {
      v16 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      v17 = self->_animations;
      self->_animations = v16;

      animations = self->_animations;
    }
    v18 = objc_msgSend(v9, "copy");
    -[NSMutableArray addObject:](animations, "addObject:", v18);

  }
  if (v10)
  {
    if (self->_didComplete)
    {
      v35 = sub_1004318FC();
      v36 = objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("cannot add completions, already completed")));
        v41 = 136316162;
        v42 = "-[GroupAnimation addPreparation:animations:completion:]";
        v43 = 2080;
        v44 = "GroupAnimation.m";
        v45 = 1024;
        v46 = 101;
        v47 = 2080;
        v48 = "!completion || !_didComplete";
        v49 = 2112;
        v50 = v37;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", (uint8_t *)&v41, 0x30u);

      }
      if (sub_100A70734())
      {
        v38 = sub_1004318FC();
        v39 = objc_claimAutoreleasedReturnValue(v38);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          v40 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v41 = 138412290;
          v42 = v40;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v41, 0xCu);

        }
      }
    }
    completions = self->_completions;
    if (!completions)
    {
      v20 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      v21 = self->_completions;
      self->_completions = v20;

      completions = self->_completions;
    }
    v22 = objc_msgSend(v10, "copy");
    -[NSMutableArray addObject:](completions, "addObject:", v22);

  }
}

- (void)addChildAnimation:(id)a3
{
  id v4;
  id v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v4 = a3;
  if (v4)
  {
    v14 = v4;
    v5 = v4;
    v6 = (objc_class *)objc_opt_class(v5);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    if ((objc_opt_respondsToSelector(v5, "accessibilityIdentifier") & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "performSelector:", "accessibilityIdentifier"));
      v10 = v9;
      if (v9 && !objc_msgSend(v9, "isEqualToString:", v8))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v8, v5, v10));

        goto LABEL_7;
      }

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v8, v5));
LABEL_7:

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("waiting for child animation %@"), v11));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[GroupAnimation addCompletionWaitBlockWithReason:](self, "addCompletionWaitBlockWithReason:", v12));
    objc_msgSend(v5, "addCompletion:", v13);

    v4 = v14;
  }

}

- (id)addCompletionWaitBlockWithReason:(id)a3
{
  id v4;
  id v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD v9[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  -[GroupAnimation _enterCompletionWaitDispatchGroupWithReason:](self, "_enterCompletionWaitDispatchGroupWithReason:", v4);
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100AA28BC;
  v9[3] = &unk_1011AC888;
  objc_copyWeak(&v11, &location);
  v10 = v4;
  v5 = v4;
  v6 = objc_retainBlock(v9);
  v7 = objc_retainBlock(v6);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return v7;
}

- (void)_enterCompletionWaitDispatchGroupWithReason:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  GroupAnimation *v7;
  GroupAnimation *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  NSObject *childAnimationCompletionGroup;
  OS_dispatch_group *v16;
  OS_dispatch_group *v17;
  NSObject *v18;
  _QWORD block[5];
  uint8_t buf[4];
  __CFString *v21;
  __int16 v22;
  id v23;

  v4 = a3;
  v5 = sub_100AA2AFC();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    goto LABEL_11;
  v7 = self;
  v8 = v7;
  if (!v7)
  {
    v14 = CFSTR("<nil>");
    goto LABEL_10;
  }
  v9 = (objc_class *)objc_opt_class(v7);
  v10 = NSStringFromClass(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[GroupAnimation performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
    v13 = v12;
    if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
    {
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

      goto LABEL_8;
    }

  }
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_8:

LABEL_10:
  *(_DWORD *)buf = 138543618;
  v21 = v14;
  v22 = 2112;
  v23 = v4;
  _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] entering completion wait group for reason: %@", buf, 0x16u);

LABEL_11:
  childAnimationCompletionGroup = self->_childAnimationCompletionGroup;
  if (childAnimationCompletionGroup)
  {
    dispatch_group_enter(childAnimationCompletionGroup);
  }
  else
  {
    v16 = (OS_dispatch_group *)dispatch_group_create();
    v17 = self->_childAnimationCompletionGroup;
    self->_childAnimationCompletionGroup = v16;

    dispatch_group_enter((dispatch_group_t)self->_childAnimationCompletionGroup);
    v18 = self->_childAnimationCompletionGroup;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100AA2B3C;
    block[3] = &unk_1011AC860;
    block[4] = self;
    dispatch_group_notify(v18, (dispatch_queue_t)&_dispatch_main_q, block);
  }

}

- (void)_leaveCompletionWaitDispatchGroupWithReason:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  GroupAnimation *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  id v17;

  v4 = a3;
  if (self->_childAnimationCompletionGroup)
  {
    v5 = sub_100AA2AFC();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
LABEL_9:

      dispatch_group_leave((dispatch_group_t)self->_childAnimationCompletionGroup);
      goto LABEL_10;
    }
    v7 = self;
    v8 = (objc_class *)objc_opt_class(v7);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if ((objc_opt_respondsToSelector(v7, "accessibilityIdentifier") & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[GroupAnimation performSelector:](v7, "performSelector:", "accessibilityIdentifier"));
      v12 = v11;
      if (v11 && !objc_msgSend(v11, "isEqualToString:", v10))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v10, v7, v12));

        goto LABEL_8;
      }

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v10, v7));
LABEL_8:

    *(_DWORD *)buf = 138543618;
    v15 = v13;
    v16 = 2112;
    v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] leaving completion wait group for reason: %@", buf, 0x16u);

    goto LABEL_9;
  }
LABEL_10:

}

- (BOOL)hasStarted
{
  return self->_didPrepare || self->_didAnimate || self->_didComplete;
}

- (BOOL)_hasPrepared
{
  return !-[NSMutableArray count](self->_preparations, "count") || self->_didPrepare;
}

- (void)prepare
{
  GroupAnimation *v2;
  GroupAnimation *v3;
  objc_class *v4;
  NSString *v5;
  void *v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  id v12;
  id waitBlock;
  id v14;
  NSObject *v15;
  GroupAnimation *v16;
  objc_class *v17;
  NSString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD *v23;
  id v24;
  NSMutableArray *preparations;
  id v26;
  void *v27;
  NSMutableArray *v28;
  _QWORD v29[5];
  __int128 buf;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v2 = self;
  v3 = v2;
  if (v2)
  {
    v4 = (objc_class *)objc_opt_class(v2);
    v5 = NSStringFromClass(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    if ((objc_opt_respondsToSelector(v3, "accessibilityIdentifier") & 1) != 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[GroupAnimation performSelector:](v3, "performSelector:", "accessibilityIdentifier"));
      v8 = v7;
      if (v7 && !objc_msgSend(v7, "isEqualToString:", v6))
      {
        v9 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v6, v3, v8));

        goto LABEL_7;
      }

    }
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v6, v3));
LABEL_7:

    goto LABEL_9;
  }
  v9 = CFSTR("<nil>");
LABEL_9:

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: blocking on our own complete method call"), v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[GroupAnimation addCompletionWaitBlockWithReason:](v3, "addCompletionWaitBlockWithReason:", v10));
  v12 = objc_msgSend(v11, "copy");
  waitBlock = v3->_waitBlock;
  v3->_waitBlock = v12;

  v14 = sub_100AA2AFC();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    v16 = v3;
    v17 = (objc_class *)objc_opt_class(v16);
    v18 = NSStringFromClass(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    if ((objc_opt_respondsToSelector(v16, "accessibilityIdentifier") & 1) != 0)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[GroupAnimation performSelector:](v16, "performSelector:", "accessibilityIdentifier"));
      v21 = v20;
      if (v20 && !objc_msgSend(v20, "isEqualToString:", v19))
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v19, v16, v21));

        goto LABEL_15;
      }

    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v19, v16));
LABEL_15:

    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v22;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "[%{public}@] preparing", (uint8_t *)&buf, 0xCu);

  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v31 = 0x3032000000;
  v32 = sub_100AA30E4;
  v33 = sub_100AA30F4;
  v34 = 0;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_100AA30FC;
  v29[3] = &unk_1011AFF60;
  v29[4] = &buf;
  v23 = objc_retainBlock(v29);
  while (1)
  {
    v24 = -[NSMutableArray count](v3->_preparations, "count");
    preparations = v3->_preparations;
    if (!v24)
      break;
    v26 = -[NSMutableArray copy](preparations, "copy");
    v27 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v26;

    v28 = v3->_preparations;
    v3->_preparations = 0;

    if (-[GroupAnimation preventsAnimationDuringPreparation](v3, "preventsAnimationDuringPreparation"))
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v23);
    else
      ((void (*)(_QWORD *))v23[2])(v23);
  }
  v3->_preparations = 0;

  v3->_didPrepare = 1;
  _Block_object_dispose(&buf, 8);

}

- (void)animate
{
  id v3;
  NSObject *v4;
  GroupAnimation *v5;
  GroupAnimation *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  id v13;
  NSMutableArray *animations;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  NSMutableArray *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  __CFString *v26;

  v3 = sub_100AA2AFC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = self;
    v6 = v5;
    if (!v5)
    {
      v12 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v7 = (objc_class *)objc_opt_class(v5);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[GroupAnimation performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
      v11 = v10;
      if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
      {
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

        goto LABEL_8;
      }

    }
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    v26 = v12;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}@] animating", buf, 0xCu);

  }
  while (1)
  {

    if (!-[NSMutableArray count](self->_animations, "count"))
      break;
    v13 = -[NSMutableArray copy](self->_animations, "copy");
    animations = self->_animations;
    self->_animations = 0;

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v4 = v13;
    v15 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(_QWORD *)v21 != v17)
            objc_enumerationMutation(v4);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i) + 16))();
        }
        v16 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v16);
    }

  }
  v19 = self->_animations;
  self->_animations = 0;

  self->_didAnimate = 1;
}

- (void)_childAnimationsDidComplete
{
  if (self->_readyToComplete)
    -[GroupAnimation complete:](self, "complete:", 1);
}

- (void)complete:(BOOL)a3
{
  _BOOL8 v3;
  id waitBlock;
  id v6;
  OS_dispatch_group *childAnimationCompletionGroup;
  id v8;
  NSObject *v9;
  _BOOL4 v10;
  GroupAnimation *v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  GroupAnimation *v18;
  objc_class *v19;
  NSString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSMutableArray *completions;
  id v27;
  id v28;
  uint64_t v29;
  void *v30;
  NSMutableArray *v31;
  void (**v32)(id, _BOOL8);
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t v37[128];
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  _BOOL4 v41;

  v3 = a3;
  self->_readyToComplete = 1;
  waitBlock = self->_waitBlock;
  if (waitBlock)
  {
    v32 = (void (**)(id, _BOOL8))objc_retainBlock(waitBlock);
    v6 = self->_waitBlock;
    self->_waitBlock = 0;

    v32[2](v32, v3);
    return;
  }
  childAnimationCompletionGroup = self->_childAnimationCompletionGroup;
  v8 = sub_100AA2AFC();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
  if (childAnimationCompletionGroup)
  {
    if (!v10)
    {
LABEL_11:

      return;
    }
    v11 = self;
    v12 = (objc_class *)objc_opt_class(v11);
    v13 = NSStringFromClass(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    if ((objc_opt_respondsToSelector(v11, "accessibilityIdentifier") & 1) != 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[GroupAnimation performSelector:](v11, "performSelector:", "accessibilityIdentifier"));
      v16 = v15;
      if (v15 && !objc_msgSend(v15, "isEqualToString:", v14))
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v14, v11, v16));

        goto LABEL_10;
      }

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v14, v11));
LABEL_10:

    *(_DWORD *)buf = 138543362;
    v39 = v17;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[%{public}@] ready to complete, but waiting on child animations", buf, 0xCu);

    goto LABEL_11;
  }
  if (v10)
  {
    v18 = self;
    v19 = (objc_class *)objc_opt_class(v18);
    v20 = NSStringFromClass(v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    if ((objc_opt_respondsToSelector(v18, "accessibilityIdentifier") & 1) != 0)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[GroupAnimation performSelector:](v18, "performSelector:", "accessibilityIdentifier"));
      v23 = v22;
      if (v22 && !objc_msgSend(v22, "isEqualToString:", v21))
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v21, v18, v23));

        goto LABEL_18;
      }

    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v21, v18));
LABEL_18:

    *(_DWORD *)buf = 138543618;
    v39 = v24;
    v40 = 1024;
    v41 = v3;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[%{public}@] complete:%d", buf, 0x12u);

  }
  while (1)
  {

    if (!-[NSMutableArray count](self->_completions, "count"))
      break;
    v25 = -[NSMutableArray copy](self->_completions, "copy");
    completions = self->_completions;
    self->_completions = 0;

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v9 = v25;
    v27 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v34;
      do
      {
        v30 = 0;
        do
        {
          if (*(_QWORD *)v34 != v29)
            objc_enumerationMutation(v9);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)v30) + 16))();
          v30 = (char *)v30 + 1;
        }
        while (v28 != v30);
        v28 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v28);
    }

  }
  v31 = self->_completions;
  self->_completions = 0;

  self->_didComplete = 1;
}

- (void)runWithDefaultOptions
{
  objc_msgSend((id)objc_opt_class(self), "defaultAnimationDuration");
  -[GroupAnimation runWithDuration:delay:options:](self, "runWithDuration:delay:options:", 0);
}

- (void)runWithCurrentOptions
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  -[GroupAnimation springDamping](self, "springDamping");
  if (v3 <= 0.0)
  {
    -[GroupAnimation initialVelocity](self, "initialVelocity");
    if (v8 <= 0.0)
    {
      -[GroupAnimation duration](self, "duration");
      v12 = v11;
      -[GroupAnimation delay](self, "delay");
      -[GroupAnimation runWithDuration:delay:options:](self, "runWithDuration:delay:options:", -[GroupAnimation options](self, "options"), v12, v13);
    }
    else
    {
      -[GroupAnimation delay](self, "delay");
      v10 = v9;
      -[GroupAnimation initialVelocity](self, "initialVelocity");
      -[GroupAnimation runWithDelay:initialVelocity:options:](self, "runWithDelay:initialVelocity:options:", -[GroupAnimation options](self, "options"), v10, v14);
    }
  }
  else
  {
    -[GroupAnimation duration](self, "duration");
    v5 = v4;
    -[GroupAnimation delay](self, "delay");
    v7 = v6;
    -[GroupAnimation springDamping](self, "springDamping");
    -[GroupAnimation initialVelocity](self, "initialVelocity");
    -[GroupAnimation runWithDuration:delay:springDamping:initialVelocity:options:](self, "runWithDuration:delay:springDamping:initialVelocity:options:", -[GroupAnimation options](self, "options"), v5, v7);
  }
}

- (void)runWithDuration:(double)a3 delay:(double)a4 options:(unint64_t)a5
{
  id v9;
  NSObject *v10;
  GroupAnimation *v11;
  GroupAnimation *v12;
  objc_class *v13;
  NSString *v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  _QWORD v19[5];
  _QWORD v20[5];
  uint8_t buf[4];
  __CFString *v22;
  __int16 v23;
  double v24;
  __int16 v25;
  double v26;
  __int16 v27;
  unint64_t v28;

  if (!-[GroupAnimation isAnimated](self, "isAnimated"))
  {
    -[GroupAnimation runWithoutAnimation](self, "runWithoutAnimation");
    return;
  }
  v9 = sub_100AA2AFC();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = self;
    v12 = v11;
    if (!v11)
    {
      v18 = CFSTR("<nil>");
      goto LABEL_12;
    }
    v13 = (objc_class *)objc_opt_class(v11);
    v14 = NSStringFromClass(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    if ((objc_opt_respondsToSelector(v12, "accessibilityIdentifier") & 1) != 0)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[GroupAnimation performSelector:](v12, "performSelector:", "accessibilityIdentifier"));
      v17 = v16;
      if (v16 && !objc_msgSend(v16, "isEqualToString:", v15))
      {
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v15, v12, v17));

        goto LABEL_9;
      }

    }
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v15, v12));
LABEL_9:

LABEL_12:
    *(_DWORD *)buf = 138544130;
    v22 = v18;
    v23 = 2048;
    v24 = a3;
    v25 = 2048;
    v26 = a4;
    v27 = 2048;
    v28 = a5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "[%{public}@] runWithDuration:%#.1lf delay:%#.1lfs options:%lu", buf, 0x2Au);

  }
  -[GroupAnimation prepare](self, "prepare");
  v19[4] = self;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100AA3BD4;
  v20[3] = &unk_1011AC860;
  v20[4] = self;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100AA3BDC;
  v19[3] = &unk_1011AE8F8;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", a5, v20, v19, a3, a4);
}

- (void)runWithDelay:(double)a3 initialVelocity:(double)a4 options:(unint64_t)a5
{
  id v9;
  NSObject *v10;
  GroupAnimation *v11;
  GroupAnimation *v12;
  objc_class *v13;
  NSString *v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  _QWORD v19[5];
  _QWORD v20[5];
  uint8_t buf[4];
  __CFString *v22;
  __int16 v23;
  double v24;
  __int16 v25;
  double v26;
  __int16 v27;
  unint64_t v28;

  if (!-[GroupAnimation isAnimated](self, "isAnimated"))
  {
    -[GroupAnimation runWithoutAnimation](self, "runWithoutAnimation");
    return;
  }
  v9 = sub_100AA2AFC();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = self;
    v12 = v11;
    if (!v11)
    {
      v18 = CFSTR("<nil>");
      goto LABEL_12;
    }
    v13 = (objc_class *)objc_opt_class(v11);
    v14 = NSStringFromClass(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    if ((objc_opt_respondsToSelector(v12, "accessibilityIdentifier") & 1) != 0)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[GroupAnimation performSelector:](v12, "performSelector:", "accessibilityIdentifier"));
      v17 = v16;
      if (v16 && !objc_msgSend(v16, "isEqualToString:", v15))
      {
        v18 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v15, v12, v17));

        goto LABEL_9;
      }

    }
    v18 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v15, v12));
LABEL_9:

LABEL_12:
    *(_DWORD *)buf = 138544130;
    v22 = v18;
    v23 = 2048;
    v24 = a3;
    v25 = 2048;
    v26 = a4;
    v27 = 2048;
    v28 = a5;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "[%{public}@] runWithDelay:%#.1lf initialVelocity:%lf options:%lu", buf, 0x2Au);

  }
  -[GroupAnimation prepare](self, "prepare");
  v19[4] = self;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100AA3E50;
  v20[3] = &unk_1011AC860;
  v20[4] = self;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100AA3E58;
  v19[3] = &unk_1011AE8F8;
  +[UIView _animateUsingDefaultDampedSpringWithDelay:initialSpringVelocity:options:animations:completion:](UIView, "_animateUsingDefaultDampedSpringWithDelay:initialSpringVelocity:options:animations:completion:", a5, v20, v19, a3, a4);
}

- (void)runWithDuration:(double)a3 delay:(double)a4 springDamping:(double)a5 initialVelocity:(double)a6 options:(unint64_t)a7
{
  id v13;
  NSObject *v14;
  GroupAnimation *v15;
  GroupAnimation *v16;
  objc_class *v17;
  NSString *v18;
  void *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  _QWORD v23[5];
  _QWORD v24[5];
  uint8_t buf[4];
  __CFString *v26;
  __int16 v27;
  double v28;
  __int16 v29;
  double v30;
  __int16 v31;
  double v32;
  __int16 v33;
  double v34;
  __int16 v35;
  unint64_t v36;

  if (!-[GroupAnimation isAnimated](self, "isAnimated"))
  {
    -[GroupAnimation runWithoutAnimation](self, "runWithoutAnimation");
    return;
  }
  v13 = sub_100AA2AFC();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v15 = self;
    v16 = v15;
    if (!v15)
    {
      v22 = CFSTR("<nil>");
      goto LABEL_12;
    }
    v17 = (objc_class *)objc_opt_class(v15);
    v18 = NSStringFromClass(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    if ((objc_opt_respondsToSelector(v16, "accessibilityIdentifier") & 1) != 0)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[GroupAnimation performSelector:](v16, "performSelector:", "accessibilityIdentifier"));
      v21 = v20;
      if (v20 && !objc_msgSend(v20, "isEqualToString:", v19))
      {
        v22 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v19, v16, v21));

        goto LABEL_9;
      }

    }
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v19, v16));
LABEL_9:

LABEL_12:
    *(_DWORD *)buf = 138544642;
    v26 = v22;
    v27 = 2048;
    v28 = a3;
    v29 = 2048;
    v30 = a4;
    v31 = 2048;
    v32 = a5;
    v33 = 2048;
    v34 = a6;
    v35 = 2048;
    v36 = a7;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "[%{public}@] runWithDuration:%#.1lfs delay:%#.1lfs springDamping:%lf initialVelocity:%lf options:%lu", buf, 0x3Eu);

  }
  -[GroupAnimation prepare](self, "prepare");
  v23[4] = self;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100AA40F8;
  v24[3] = &unk_1011AC860;
  v24[4] = self;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100AA4100;
  v23[3] = &unk_1011AE8F8;
  +[UIView animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:](UIView, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", a7, v24, v23, a3, a4, a5, a6);
}

- (void)runWithoutAnimation
{
  id v3;
  NSObject *v4;
  GroupAnimation *v5;
  GroupAnimation *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  _QWORD v13[5];
  uint8_t buf[4];
  __CFString *v15;

  v3 = sub_100AA2AFC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = self;
    v6 = v5;
    if (!v5)
    {
      v12 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v7 = (objc_class *)objc_opt_class(v5);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[GroupAnimation performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
      v11 = v10;
      if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
      {
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

        goto LABEL_8;
      }

    }
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    v15 = v12;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}@] runWithoutAnimation", buf, 0xCu);

  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100AA42C4;
  v13[3] = &unk_1011AC860;
  v13[4] = self;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v13);
}

- (void)runInCurrentContext
{
  -[GroupAnimation prepare](self, "prepare");
  -[GroupAnimation animate](self, "animate");
  -[GroupAnimation complete:](self, "complete:", 1);
}

+ (double)defaultAnimationDuration
{
  return 0.25;
}

+ (id)animationForAnimatedFlag:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = objc_alloc_init((Class)a1);
  objc_msgSend(v4, "setAnimated:", v3);
  return v4;
}

+ (id)animationForImplicitAnimationState
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "animationForAnimatedFlag:", +[UIView _maps_shouldAdoptImplicitAnimationParameters](UIView, "_maps_shouldAdoptImplicitAnimationParameters")));
  objc_msgSend(v2, "setPreventsAnimationDuringPreparation:", 1);
  return v2;
}

- (BOOL)preventsAnimationDuringPreparation
{
  return self->_preventsAnimationDuringPreparation;
}

- (void)setPreventsAnimationDuringPreparation:(BOOL)a3
{
  self->_preventsAnimationDuringPreparation = a3;
}

- (BOOL)isAnimated
{
  return self->_animated;
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (double)delay
{
  return self->_delay;
}

- (void)setDelay:(double)a3
{
  self->_delay = a3;
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
}

- (double)springDamping
{
  return self->_springDamping;
}

- (void)setSpringDamping:(double)a3
{
  self->_springDamping = a3;
}

- (double)initialVelocity
{
  return self->_initialVelocity;
}

- (void)setInitialVelocity:(double)a3
{
  self->_initialVelocity = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_waitBlock, 0);
  objc_storeStrong((id *)&self->_childAnimationCompletionGroup, 0);
  objc_storeStrong((id *)&self->_completions, 0);
  objc_storeStrong((id *)&self->_animations, 0);
  objc_storeStrong((id *)&self->_preparations, 0);
}

@end
