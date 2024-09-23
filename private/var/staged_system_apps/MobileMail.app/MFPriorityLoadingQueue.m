@implementation MFPriorityLoadingQueue

- (void)setItemHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void)setComparator:(id)a3
{
  id v4;
  Block_layout *v5;
  Block_layout *v6;
  Block_layout *v7;
  id comparator;
  Block_layout *v9;

  v4 = a3;
  v5 = (Block_layout *)objc_msgSend(v4, "copy");
  v6 = v5;
  if (!v5)
    v5 = &stru_100522478;
  v9 = objc_retainBlock(v5);

  os_unfair_lock_lock(&self->_lock);
  if (self->_comparator != v9)
  {
    v7 = objc_retainBlock(v9);
    comparator = self->_comparator;
    self->_comparator = v7;

    -[MFPriorityLoadingQueue _locked_reorderQueue](self, "_locked_reorderQueue");
  }
  os_unfair_lock_unlock(&self->_lock);

}

- (MFPriorityLoadingQueue)initWithScheduler:(id)a3
{
  id v5;
  MFPriorityLoadingQueue *v6;
  id v7;
  id comparator;
  uint64_t v9;
  EFQueue *queue;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MFPriorityLoadingQueue;
  v6 = -[MFPriorityLoadingQueue init](&v12, "init");
  if (v6)
  {
    v7 = objc_msgSend(&stru_100522478, "copy");
    comparator = v6->_comparator;
    v6->_comparator = v7;

    objc_storeStrong((id *)&v6->_scheduler, a3);
    v9 = objc_claimAutoreleasedReturnValue(+[EFQueue priorityQueueWithComparator:](EFQueue, "priorityQueueWithComparator:", v6->_comparator));
    queue = v6->_queue;
    v6->_queue = (EFQueue *)v9;

  }
  return v6;
}

- (void)_locked_reorderQueue
{
  void *v3;
  EFQueue *v4;
  EFQueue *queue;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[EFQueue drain](self->_queue, "drain"));
  v4 = (EFQueue *)objc_claimAutoreleasedReturnValue(+[EFQueue priorityQueueWithComparator:](EFQueue, "priorityQueueWithComparator:", self->_comparator));
  queue = self->_queue;
  self->_queue = v4;

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        -[EFQueue enqueue:](self->_queue, "enqueue:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), (_QWORD)v10);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)dealloc
{
  objc_super v3;

  -[MFPriorityLoadingQueue _locked_cancelWorkItem](self, "_locked_cancelWorkItem");
  v3.receiver = self;
  v3.super_class = (Class)MFPriorityLoadingQueue;
  -[MFPriorityLoadingQueue dealloc](&v3, "dealloc");
}

- (void)_locked_cancelWorkItem
{
  uint64_t v3;
  NSObject *v4;
  EFCancelable *workItemCancelable;
  int v6;
  EFCancelable *v7;

  if (self->_workItemCancelable)
  {
    v3 = MFLogGeneral(self);
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      workItemCancelable = self->_workItemCancelable;
      v6 = 134217984;
      v7 = workItemCancelable;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "#priorityLoadingQueue canceling token: %p", (uint8_t *)&v6, 0xCu);
    }

    -[EFCancelable cancel](self->_workItemCancelable, "cancel");
  }
}

- (void)immediatelyProcessQueue
{
  -[MFPriorityLoadingQueue _processQueue](self, "_processQueue");
}

- (void)_processQueue
{
  void *v4;

  if (pthread_main_np() != 1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MFPriorityLoadingQueue.m"), 81, CFSTR("Current thread must be main"));

  }
  objc_msgSend((id)objc_opt_class(self), "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_processQueue", 0);
  os_unfair_lock_lock(&self->_lock);
  -[MFPriorityLoadingQueue _locked_processQueue](self, "_locked_processQueue");
  os_unfair_lock_unlock(&self->_lock);
}

- (void)_locked_processQueue
{
  void *v3;
  id v4;
  EFScheduler *scheduler;
  id v6;
  EFCancelable *v7;
  EFCancelable *workItemCancelable;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  EFCancelable *v12;
  _QWORD v13[6];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  EFCancelable *v18;

  if (!self->_workItemCancelable)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[EFQueue dequeue](self->_queue, "dequeue"));
    if (v3)
    {
      v4 = objc_retainBlock(self->_itemHandler);
      scheduler = self->_scheduler;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10019B374;
      v13[3] = &unk_1005224A0;
      v13[4] = self;
      v13[5] = v3;
      v6 = v4;
      v14 = v6;
      v7 = (EFCancelable *)objc_claimAutoreleasedReturnValue(-[EFScheduler performCancelableBlock:](scheduler, "performCancelableBlock:", v13));
      workItemCancelable = self->_workItemCancelable;
      self->_workItemCancelable = v7;

      v10 = MFLogGeneral(v9);
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = self->_workItemCancelable;
        *(_DWORD *)buf = 138412546;
        v16 = v3;
        v17 = 2048;
        v18 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "#priorityLoadingQueue scheduled work %@ with token: %p", buf, 0x16u);
      }

    }
  }
}

- (void)_performItem:(id)a3 handler:(id)a4 cancelationToken:(id)a5
{
  id v8;
  void (**v9)(id, id, id);
  id v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  EFCancelable *workItemCancelable;
  EFCancelable *v20;
  id v21;
  int v22;
  EFCancelable *v23;

  v8 = a3;
  v9 = (void (**)(id, id, id))a4;
  v10 = a5;
  v11 = objc_msgSend(v10, "isCanceled");
  if ((v11 & 1) != 0)
  {
    v12 = MFLogGeneral(v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v22 = 134217984;
      v23 = (EFCancelable *)v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "#priorityLoadingQueue token already canceled, not calling item handler: %p", (uint8_t *)&v22, 0xCu);
    }

  }
  else
  {
    v14 = MFLogGeneral(v11);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v22 = 134217984;
      v23 = (EFCancelable *)v10;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "#priorityLoadingQueue calling item handler with token: %p", (uint8_t *)&v22, 0xCu);
    }

    v9[2](v9, v8, v10);
  }
  os_unfair_lock_lock(&self->_lock);
  v17 = MFLogGeneral(v16);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    workItemCancelable = self->_workItemCancelable;
    v22 = 134217984;
    v23 = workItemCancelable;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "#priorityLoadingQueue finished work for token: %p", (uint8_t *)&v22, 0xCu);
  }

  v20 = self->_workItemCancelable;
  self->_workItemCancelable = 0;

  v21 = -[EFQueue count](self->_queue, "count");
  os_unfair_lock_unlock(&self->_lock);
  if (v21)
    -[MFPriorityLoadingQueue _noteQueueNeedsProcessing](self, "_noteQueueNeedsProcessing");

}

- (void)_noteQueueNeedsProcessing
{
  void *v3;
  _QWORD v4[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10019B624;
  v4[3] = &unk_10051AA98;
  v4[4] = self;
  objc_msgSend(v3, "performBlock:", v4);

}

- (void)enqueue:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  id v8;

  v4 = a3;
  v5 = MFLogGeneral(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "#priorityLoadingQueue enquing work item: %@", (uint8_t *)&v7, 0xCu);
  }

  os_unfair_lock_lock(&self->_lock);
  -[EFQueue enqueue:replaceIfExists:](self->_queue, "enqueue:replaceIfExists:", v4, 1);
  os_unfair_lock_unlock(&self->_lock);
  -[MFPriorityLoadingQueue _noteQueueNeedsProcessing](self, "_noteQueueNeedsProcessing");

}

- (id)dequeue
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[EFQueue dequeue](self->_queue, "dequeue"));
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)dequeueObject:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[EFQueue dequeueObject:](self->_queue, "dequeueObject:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (id)drain
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint8_t v7[16];

  v3 = MFLogGeneral(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "#priorityLoadingQueue removing all work items", v7, 2u);
  }

  os_unfair_lock_lock(&self->_lock);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[EFQueue drain](self->_queue, "drain"));
  -[MFPriorityLoadingQueue _locked_cancelWorkItem](self, "_locked_cancelWorkItem");
  os_unfair_lock_unlock(&self->_lock);
  return v5;
}

- (NSArray)allObjects
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[EFQueue allObjects](self->_queue, "allObjects"));
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (id)comparator
{
  return self->_comparator;
}

- (id)itemHandler
{
  return self->_itemHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_itemHandler, 0);
  objc_storeStrong(&self->_comparator, 0);
  objc_storeStrong((id *)&self->_workItemCancelable, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
}

@end
