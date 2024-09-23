@implementation PLServerChangePublisher

- (void)pauseLaunchEventNotifications
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  PLChangeHandlingGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);
  v5 = v3;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v6, OS_SIGNPOST_EVENT, v4, "Pause WatchUpdate notifications", ", buf, 2u);
  }

  PLChangeHandlingGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "Pause WatchUpdate notifications", v8, 2u);
  }

  atomic_store(1u, (unsigned __int8 *)&self->_suppressWatchNotification);
}

- (PLServerChangePublisher)init
{
  PLServerChangePublisher *v2;
  NSObject *v3;
  uint64_t v4;
  objc_super v6;
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  PLServerChangePublisher *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6.receiver = self;
  v6.super_class = (Class)PLServerChangePublisher;
  v2 = -[PLServerChangePublisher init](&v6, sel_init);
  PLPhotosObjectLifecycleGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = objc_opt_class();
    *(_DWORD *)buf = 138412546;
    v8 = v4;
    v9 = 2048;
    v10 = v2;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEBUG, "%@ %p init", buf, 0x16u);
  }

  return v2;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  uint64_t v6;
  __int16 v7;
  PLServerChangePublisher *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  PLPhotosObjectLifecycleGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v6 = objc_opt_class();
    v7 = 2048;
    v8 = self;
    _os_log_impl(&dword_199541000, v3, OS_LOG_TYPE_DEBUG, "%@ %p dealloc", buf, 0x16u);
  }

  v4.receiver = self;
  v4.super_class = (Class)PLServerChangePublisher;
  -[PLServerChangePublisher dealloc](&v4, sel_dealloc);
}

- (id)publishChangeEvent:(id)a3 delayedSaveActionsDetail:(id)a4 transaction:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  v7 = a3;
  v8 = a5;
  objc_msgSend(v8, "transactionToken");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = v8;
    objc_msgSend(v10, "changeScopes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pathManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    +[PLClientServerTransaction beginServerTransactionWithToken:changeScopes:pathManager:identifier:](PLClientServerTransaction, "beginServerTransactionWithToken:changeScopes:pathManager:identifier:", v9, v11, v12, "-[PLServerChangePublisher publishChangeEvent:delayedSaveActionsDetail:transaction:]");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "completeTransaction");
  }
  -[PLServerChangePublisher distributeChangeEvent:transaction:](self, "distributeChangeEvent:transaction:", v7, v8);

  return v8;
}

- (void)distributeChangeEvent:(id)a3 transaction:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  xpc_object_t xdict;

  xdict = a3;
  v7 = a4;
  v8 = xdict;
  if (!xdict)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLServerChangePublisher.m"), 60, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("event != NULL"));

    v8 = 0;
  }
  if (xpc_dictionary_get_uint64(v8, "eventKind") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLServerChangePublisher.m"), 64, CFSTR("Trying to distribute an invalid event."));

  }
  if (!+[PLLegacyChangeEvent isEmptyEvent:](PLLegacyChangeEvent, "isEmptyEvent:", xdict))
  {
    -[PLServerChangePublisher _postChangeHubNotification](self, "_postChangeHubNotification");
    -[PLServerChangePublisher _postWatchUpdateNotificationIfNotPaused](self, "_postWatchUpdateNotificationIfNotPaused");
  }

}

- (void)_postChangeHubNotification
{
  int64_t *p_postCount;
  unint64_t v3;
  unint64_t v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  unint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  p_postCount = &self->_postCount;
  do
    v3 = __ldaxr((unint64_t *)p_postCount);
  while (__stlxr(v3 + 1, (unint64_t *)p_postCount));
  v4 = atomic_load((unint64_t *)p_postCount);
  PLChangeHandlingGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);
  v7 = v5;
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_DWORD *)buf = 134217984;
    v14 = v4;
    _os_signpost_emit_with_name_impl(&dword_199541000, v8, OS_SIGNPOST_EVENT, v6, "Post ChangeHub notification", "post count: %lld", buf, 0xCu);
  }

  qos_class_self();
  v9 = pl_notify_post_with_retry();
  if ((_DWORD)v9)
  {
    v10 = v9;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLServerChangePublisher _postChangeHubNotification]");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("PLServerChangePublisher.m"), 84, CFSTR("-[PLServerChangePublisher _postChangeHubNotification]: notify_post() failed: (%d)"), v10);

  }
}

- (void)_postWatchUpdateNotificationIfNotPaused
{
  BOOL *p_hasPendingWatchNotification;
  unsigned __int8 v3;

  p_hasPendingWatchNotification = &self->_hasPendingWatchNotification;
  atomic_store(1u, (unsigned __int8 *)&self->_hasPendingWatchNotification);
  v3 = atomic_load((unsigned __int8 *)&self->_suppressWatchNotification);
  if ((v3 & 1) == 0)
  {
    -[PLServerChangePublisher _postWatchUpdateNotification](self, "_postWatchUpdateNotification");
    atomic_store(0, (unsigned __int8 *)p_hasPendingWatchNotification);
  }
}

- (void)_postWatchUpdateNotificationIfPending
{
  BOOL *p_hasPendingWatchNotification;
  unsigned __int8 v3;

  p_hasPendingWatchNotification = &self->_hasPendingWatchNotification;
  v3 = atomic_load((unsigned __int8 *)&self->_hasPendingWatchNotification);
  if ((v3 & 1) != 0)
  {
    -[PLServerChangePublisher _postWatchUpdateNotification](self, "_postWatchUpdateNotification");
    atomic_store(0, (unsigned __int8 *)p_hasPendingWatchNotification);
  }
}

- (void)_postWatchUpdateNotification
{
  unint64_t v2;
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  unint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = atomic_load((unint64_t *)&self->_postCount);
  PLChangeHandlingGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);
  v5 = v3;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_DWORD *)buf = 134217984;
    v12 = v2;
    _os_signpost_emit_with_name_impl(&dword_199541000, v6, OS_SIGNPOST_EVENT, v4, "Post WatchUpdate notification", "post count: %lld", buf, 0xCu);
  }

  v7 = pl_notify_post_with_retry();
  if ((_DWORD)v7)
  {
    v8 = v7;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLServerChangePublisher _postWatchUpdateNotification]");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("PLServerChangePublisher.m"), 112, CFSTR("-[PLServerChangePublisher _postWatchUpdateNotification]: notify_post() failed: (%d)"), v8);

  }
}

- (void)unpauseLaunchEventNotifications
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  PLChangeHandlingGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);
  v5 = v3;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_199541000, v6, OS_SIGNPOST_EVENT, v4, "Unpause WatchUpdate notifications", ", buf, 2u);
  }

  PLChangeHandlingGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_DEFAULT, "Unpause WatchUpdate notifications", v8, 2u);
  }

  atomic_store(0, (unsigned __int8 *)&self->_suppressWatchNotification);
  -[PLServerChangePublisher _postWatchUpdateNotificationIfPending](self, "_postWatchUpdateNotificationIfPending");

}

@end
