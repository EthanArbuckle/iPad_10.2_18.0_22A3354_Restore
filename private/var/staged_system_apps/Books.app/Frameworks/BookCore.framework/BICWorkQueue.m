@implementation BICWorkQueue

+ (BICWorkQueue)workQueueWithHighPriorityTargetQueue:(id)a3 backgroundTargetQueue:(id)a4 numConcurrentWorkItems:(unint64_t)a5
{
  NSObject *v8;
  NSObject *v9;
  _DWORD *v10;
  NSObject *v11;
  dispatch_queue_attr_t v12;
  NSObject *v13;
  dispatch_queue_attr_t v14;
  NSObject *v15;
  dispatch_queue_t v16;
  dispatch_queue_attr_t v17;
  NSObject *v18;
  dispatch_queue_t v19;
  void *v20;
  void *v21;

  v8 = a4;
  v9 = a3;
  v10 = objc_alloc_init((Class)a1);
  objc_msgSend(v10, "setNumConcurrentWorkItems:", a5);
  if (a5 <= 1)
    v11 = 0;
  else
    v11 = &_dispatch_queue_attr_concurrent;
  v12 = dispatch_queue_attr_make_with_autorelease_frequency(v11, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  v14 = dispatch_queue_attr_make_with_qos_class(v13, QOS_CLASS_USER_INITIATED, 0);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  v16 = dispatch_queue_create_with_target_V2("com.apple.coverWorkQ_high", v15, v9);

  objc_msgSend(v10, "setHighPriorityWorkQ:", v16);
  v17 = dispatch_queue_attr_make_with_qos_class(v13, QOS_CLASS_BACKGROUND, 0);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  v19 = dispatch_queue_create_with_target_V2("com.apple.coverWorkQ_low", v18, v8);

  objc_msgSend(v10, "setLowPriorityWorkQ:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  objc_msgSend(v10, "setAl_workItems:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
  objc_msgSend(v10, "setAl_workingOnItems:", v21);

  objc_msgSend(v10, "setWorkItemTimeout:", 5.0);
  v10[2] = 0;

  return (BICWorkQueue *)v10;
}

- (BOOL)hasLargeBacklog
{
  os_unfair_lock_s *p_accessLock;
  _QWORD *v3;
  _QWORD v5[2];
  void (*v6)(uint64_t);
  void *v7;
  BICWorkQueue *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  p_accessLock = &self->_accessLock;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v6 = sub_73438;
  v7 = &unk_28B700;
  v8 = self;
  v9 = &v10;
  v3 = v5;
  os_unfair_lock_lock_with_options(p_accessLock, 0x10000);
  v6((uint64_t)v3);
  os_unfair_lock_unlock(p_accessLock);

  LOBYTE(p_accessLock) = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return (char)p_accessLock;
}

- (void)addWorkItemWithPriority:(id)a3 description:(id)a4 block:(id)a5
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void **v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  BICWorkQueue *v15;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;

  v11 = _NSConcreteStackBlock;
  v12 = 3221225472;
  v13 = sub_735FC;
  v14 = &unk_28B808;
  v15 = self;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[BICWorkItem workItemWithPriority:description:block:](BICWorkItem, "workItemWithPriority:description:block:", a3, a4, a5));
  v16 = v6;
  os_unfair_lock_lock_with_options(&v15->_accessLock, 0x10000);
  sub_735FC((uint64_t)&v11);
  os_unfair_lock_unlock(&self->_accessLock);
  v7 = BCImageCacheLog();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BICWorkQueue identifier](self, "identifier", v11, v12));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BICWorkQueue _statsString](self, "_statsString"));
    *(_DWORD *)buf = 138543874;
    v18 = v6;
    v19 = 2112;
    v20 = v9;
    v21 = 2114;
    v22 = v10;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "BICWorkQueue: Adding %{public}@ to queue \"%@\". %{public}@", buf, 0x20u);

  }
  -[BICWorkQueue _startNextWorkItem](self, "_startNextWorkItem");

}

- (void)_startNextWorkItem
{
  os_unfair_lock_s *p_accessLock;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD block[5];
  id v15;
  uint64_t *v16;
  _QWORD v17[2];
  void (*v18)(uint64_t);
  void *v19;
  BICWorkQueue *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;

  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_73894;
  v26 = sub_738A4;
  v27 = 0;
  p_accessLock = &self->_accessLock;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v18 = sub_738AC;
  v19 = &unk_28E468;
  v20 = self;
  v21 = &v22;
  v4 = v17;
  os_unfair_lock_lock_with_options(p_accessLock, 0x10000);
  v18((uint64_t)v4);
  os_unfair_lock_unlock(p_accessLock);

  v5 = (void *)v23[5];
  if (v5)
  {
    if ((unint64_t)objc_msgSend(v5, "priority") < 5)
      v6 = objc_claimAutoreleasedReturnValue(-[BICWorkQueue lowPriorityWorkQ](self, "lowPriorityWorkQ"));
    else
      v6 = objc_claimAutoreleasedReturnValue(-[BICWorkQueue highPriorityWorkQ](self, "highPriorityWorkQ"));
    v7 = (void *)v6;
    v8 = BCImageCacheLog();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = v23[5];
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BICWorkQueue identifier](self, "identifier"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[BICWorkQueue _statsString](self, "_statsString"));
      *(_DWORD *)buf = 138543874;
      v29 = v10;
      v30 = 2112;
      v31 = v11;
      v32 = 2114;
      v33 = v12;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "BICWorkQueue: Starting %{public}@ on queue \"%@\". %{public}@", buf, 0x20u);

    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_739BC;
    block[3] = &unk_28B7E0;
    v15 = v7;
    v16 = &v22;
    block[4] = self;
    v13 = v7;
    dispatch_async(v13, block);

  }
  _Block_object_dispose(&v22, 8);

}

- (void)workComplete:(id)a3
{
  id v4;
  _QWORD *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[2];
  void (*v14)(uint64_t);
  void *v15;
  BICWorkQueue *v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v14 = sub_7403C;
  v15 = &unk_28B7E0;
  v18 = &v19;
  v16 = self;
  v4 = a3;
  v17 = v4;
  v5 = v13;
  os_unfair_lock_lock_with_options(&self->_accessLock, 0x10000);
  v14((uint64_t)v5);
  os_unfair_lock_unlock(&self->_accessLock);

  if (*((_BYTE *)v20 + 24))
  {
    v6 = BCImageCacheLog();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BICWorkQueue identifier](self, "identifier"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BICWorkQueue _statsString](self, "_statsString"));
      *(_DWORD *)buf = 138543874;
      v24 = v4;
      v25 = 2112;
      v26 = v8;
      v27 = 2114;
      v28 = v9;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "BICWorkQueue: Finished %{public}@ on queue \"%@\". %{public}@", buf, 0x20u);

    }
    -[BICWorkQueue _startNextWorkItem](self, "_startNextWorkItem");
  }
  else
  {
    v10 = BCImageCacheLog();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[BICWorkQueue identifier](self, "identifier"));
      *(_DWORD *)buf = 138543618;
      v24 = v4;
      v25 = 2112;
      v26 = v12;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "BICWorkQueue: Already timed-out %{public}@ now completed on queue \"%@\", buf, 0x16u);

    }
  }

  _Block_object_dispose(&v19, 8);
}

- (id)_statsString
{
  os_unfair_lock_s *p_accessLock;
  _QWORD *v3;
  void *v4;
  _QWORD v6[2];
  id (*v7)(uint64_t);
  void *v8;
  BICWorkQueue *v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  p_accessLock = &self->_accessLock;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v7 = sub_74220;
  v8 = &unk_28EDA0;
  v9 = self;
  v10 = &v21;
  v11 = &v17;
  v12 = &v13;
  v3 = v6;
  os_unfair_lock_lock_with_options(p_accessLock, 0x10000);
  v7((uint64_t)v3);
  os_unfair_lock_unlock(p_accessLock);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Pending=%tu, WIP=%tu, Finished=%tu."), v22[3], v18[3], v14[3]));
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
  return v4;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BICWorkQueue identifier](self, "identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BICWorkQueue _statsString](self, "_statsString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("BICWorkQueue %@. %@"), v3, v4));

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)manualCompletion
{
  return self->_manualCompletion;
}

- (void)setManualCompletion:(BOOL)a3
{
  self->_manualCompletion = a3;
}

- (double)workItemTimeout
{
  return self->_workItemTimeout;
}

- (void)setWorkItemTimeout:(double)a3
{
  self->_workItemTimeout = a3;
}

- (OS_dispatch_queue)targetQ
{
  return self->_targetQ;
}

- (void)setTargetQ:(id)a3
{
  objc_storeStrong((id *)&self->_targetQ, a3);
}

- (OS_dispatch_queue)highPriorityWorkQ
{
  return self->_highPriorityWorkQ;
}

- (void)setHighPriorityWorkQ:(id)a3
{
  objc_storeStrong((id *)&self->_highPriorityWorkQ, a3);
}

- (OS_dispatch_queue)lowPriorityWorkQ
{
  return self->_lowPriorityWorkQ;
}

- (void)setLowPriorityWorkQ:(id)a3
{
  objc_storeStrong((id *)&self->_lowPriorityWorkQ, a3);
}

- (NSMutableSet)al_workItems
{
  return self->_al_workItems;
}

- (void)setAl_workItems:(id)a3
{
  objc_storeStrong((id *)&self->_al_workItems, a3);
}

- (NSMutableSet)al_workingOnItems
{
  return self->_al_workingOnItems;
}

- (void)setAl_workingOnItems:(id)a3
{
  objc_storeStrong((id *)&self->_al_workingOnItems, a3);
}

- (unint64_t)numConcurrentWorkItems
{
  return self->_numConcurrentWorkItems;
}

- (void)setNumConcurrentWorkItems:(unint64_t)a3
{
  self->_numConcurrentWorkItems = a3;
}

- (unint64_t)al_totalWorkItemsRun
{
  return self->_al_totalWorkItemsRun;
}

- (void)setAl_totalWorkItemsRun:(unint64_t)a3
{
  self->_al_totalWorkItemsRun = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_al_workingOnItems, 0);
  objc_storeStrong((id *)&self->_al_workItems, 0);
  objc_storeStrong((id *)&self->_lowPriorityWorkQ, 0);
  objc_storeStrong((id *)&self->_highPriorityWorkQ, 0);
  objc_storeStrong((id *)&self->_targetQ, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
