@implementation PKDiscoveryDriver

- (PKHost)host
{
  return (PKHost *)objc_getProperty(self, a2, 88, 1);
}

- (unint64_t)flags
{
  return self->_flags;
}

- (NSDictionary)attributes
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)installWatchers
{
  NSObject *v3;
  PKDiscoveryLSWatcher *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD handler[4];
  id v18;
  int out_token;
  uint8_t buf[4];
  PKDiscoveryDriver *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  pklog_handle_for_category(6);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v21 = self;
    _os_log_impl(&dword_1AF254000, v3, OS_LOG_TYPE_DEFAULT, "<PKDiscoveryDriver:%p> installing watchers for continuous discovery", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v4 = -[PKDiscoveryLSWatcher initWithDriver:]([PKDiscoveryLSWatcher alloc], "initWithDriver:", self);
  -[PKDiscoveryDriver setLsWatcher:](self, "setLsWatcher:", v4);

  out_token = 0;
  -[PKDiscoveryDriver queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = sub_1AF262DC4;
  handler[3] = &unk_1E5F40AA8;
  objc_copyWeak(&v18, (id *)buf);
  sub_1AF256E3C(&out_token, v5, handler);

  -[PKDiscoveryDriver setAnnotationNotifyToken:](self, "setAnnotationNotifyToken:", out_token);
  v15[0] = v6;
  v15[1] = 3221225472;
  v15[2] = sub_1AF262EC4;
  v15[3] = &unk_1E5F40AD0;
  objc_copyWeak(&v16, (id *)buf);
  v7 = (void *)MEMORY[0x1AF45AEB8](v15);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = sub_1AF262FC4;
  v12[3] = &unk_1E5F40AF8;
  objc_copyWeak(&v14, (id *)buf);
  v10 = v7;
  v13 = v10;
  objc_msgSend(v8, "addObserverForName:object:queue:usingBlock:", CFSTR("com.apple.managedconfiguration.effectivesettingschanged"), 0, v9, v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDiscoveryDriver setMcNotificationToken:](self, "setMcNotificationToken:", v11);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 72, 1);
}

- (id)report
{
  return objc_getProperty(self, a2, 32, 1);
}

- (OS_dispatch_queue)sync
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 80, 1);
}

- (void)setMcNotificationToken:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void)setLsWatcher:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void)setLastResults:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void)setAnnotationNotifyToken:(int)a3
{
  self->_annotationNotifyToken = a3;
}

- (int)annotationNotifyToken
{
  return self->_annotationNotifyToken;
}

- (void)setSync:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void)setReport:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (void)setRelatedActivity:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void)setHost:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void)setFlags:(unint64_t)a3
{
  self->_flags = a3;
}

- (void)setAttributes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void)performWithPreviousResults:(id)a3 forceNotify:(BOOL)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  -[PKDiscoveryDriver relatedActivity](self, "relatedActivity");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1AF255F84;
  block[3] = &unk_1E5F409E0;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  os_activity_apply(v7, block);

}

- (OS_os_activity)relatedActivity
{
  return (OS_os_activity *)objc_getProperty(self, a2, 40, 1);
}

- (PKDiscoveryDriver)initWithAttributes:(id)a3 flags:(unint64_t)a4 host:(id)a5 report:(id)a6
{
  id v10;
  id v11;
  id v12;
  os_activity_t v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  PKDiscoveryDriver *v18;
  PKDiscoveryDriver *v19;
  _QWORD block[4];
  PKDiscoveryDriver *v22;
  id v23;
  os_activity_t v24;
  id v25;
  id v26;
  uint64_t *v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = _os_activity_create(&dword_1AF254000, "continuous-discovery", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v29 = 0;
  v30 = &v29;
  v31 = 0x3032000000;
  v32 = sub_1AF262600;
  v33 = sub_1AF262610;
  v34 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1AF2585AC;
  block[3] = &unk_1E5F40968;
  v22 = self;
  v23 = v10;
  v27 = &v29;
  v28 = a4;
  v24 = v13;
  v25 = v11;
  v26 = v12;
  v14 = v11;
  v15 = v13;
  v16 = v12;
  v17 = v10;
  v18 = self;
  os_activity_apply(v15, block);
  v19 = (PKDiscoveryDriver *)(id)v30[5];

  _Block_object_dispose(&v29, 8);
  return v19;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  _QWORD block[5];

  -[PKDiscoveryDriver relatedActivity](self, "relatedActivity");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1AF262698;
  block[3] = &unk_1E5F40678;
  block[4] = self;
  os_activity_apply(v3, block);

  v4.receiver = self;
  v4.super_class = (Class)PKDiscoveryDriver;
  -[PKDiscoveryDriver dealloc](&v4, sel_dealloc);
}

- (void)_performWithPreviousResults:(id)a3 forceNotify:(BOOL)a4 uninstalledProxies:(id)a5
{
  id v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  PKDiscoveryDriver *v15;
  BOOL v16;

  v11 = a3;
  v8 = a5;
  -[PKDiscoveryDriver report](self, "report");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[PKDiscoveryDriver relatedActivity](self, "relatedActivity");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_1AF262818;
    block[3] = &unk_1E5F40A58;
    v13 = v8;
    v16 = a4;
    v14 = v11;
    v15 = self;
    os_activity_apply(v10, block);

  }
}

- (void)cancel
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  _QWORD block[5];
  uint8_t buf[4];
  PKDiscoveryDriver *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  pklog_handle_for_category(6);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v15 = self;
    _os_log_impl(&dword_1AF254000, v3, OS_LOG_TYPE_DEFAULT, "<PKDiscoveryDriver:%p> explicit cancellation for discovery", buf, 0xCu);
  }

  -[PKDiscoveryDriver report](self, "report");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_get_current_queue();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKDiscoveryDriver sync](self, "sync");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = MEMORY[0x1E0C809B0];
  if (v5 == v6)
  {
    -[PKDiscoveryDriver removeWatchers](self, "removeWatchers");
  }
  else
  {
    -[PKDiscoveryDriver sync](self, "sync");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = sub_1AF262D38;
    block[3] = &unk_1E5F40678;
    block[4] = self;
    dispatch_sync(v8, block);

  }
  -[PKDiscoveryDriver queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = sub_1AF262D40;
  v11[3] = &unk_1E5F40A80;
  v11[4] = self;
  v12 = v4;
  v10 = v4;
  dispatch_async(v9, v11);

}

- (void)removeWatchers
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  PKDiscoveryDriver *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  pklog_handle_for_category(6);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134217984;
    v8 = self;
    _os_log_impl(&dword_1AF254000, v3, OS_LOG_TYPE_DEFAULT, "<PKDiscoveryDriver:%p> removing watchers for continous discovery", (uint8_t *)&v7, 0xCu);
  }

  if (-[PKDiscoveryDriver annotationNotifyToken](self, "annotationNotifyToken"))
  {
    -[PKDiscoveryDriver lsWatcher](self, "lsWatcher");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stopUpdates");

    sub_1AF266230(-[PKDiscoveryDriver annotationNotifyToken](self, "annotationNotifyToken"));
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKDiscoveryDriver mcNotificationToken](self, "mcNotificationToken");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:", v6);

    -[PKDiscoveryDriver setAnnotationNotifyToken:](self, "setAnnotationNotifyToken:", 0);
    -[PKDiscoveryDriver setReport:](self, "setReport:", 0);
  }
}

- (NSSet)lastResults
{
  return (NSSet *)objc_getProperty(self, a2, 48, 1);
}

- (id)mcNotificationToken
{
  return objc_getProperty(self, a2, 56, 1);
}

- (PKDiscoveryLSWatcher)lsWatcher
{
  return (PKDiscoveryLSWatcher *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_sync, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_lsWatcher, 0);
  objc_storeStrong(&self->_mcNotificationToken, 0);
  objc_storeStrong((id *)&self->_lastResults, 0);
  objc_storeStrong((id *)&self->_relatedActivity, 0);
  objc_storeStrong(&self->_report, 0);
  objc_storeStrong((id *)&self->_attributes, 0);
}

@end
