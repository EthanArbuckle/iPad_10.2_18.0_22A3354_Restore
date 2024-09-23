@implementation BTStateWatcher

- (BTStateWatcher)initWithURL:(id)a3 action:(id)a4
{
  id v6;
  id v7;
  BTStateWatcher *v8;
  BTStateWatcher *v9;
  const __CFURL *v10;
  __CFString *v11;
  unsigned int v12;
  BTStateWatcher *v13;
  BTStateWatcher *v14;
  void *v15;
  void *v16;
  objc_super v18;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)BTStateWatcher;
  v8 = -[BTStateWatcher init](&v19, "init");
  if (v8)
  {
    v9 = v8;
    v10 = (const __CFURL *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "standardizedURL"));
    v11 = (__CFString *)CFURLCopyPath(v10);
    v12 = -[__CFString hasSuffix:](v11, "hasSuffix:", CFSTR("/"));
    CFRelease(v11);
    v18.receiver = v9;
    v18.super_class = (Class)BTStateWatcher;
    v13 = -[BTStateWatcher init](&v18, "init");
    v14 = v13;
    if (v12)
    {
      -[BTStateWatcher setDirectoryURL:](v13, "setDirectoryURL:", v10);
      -[BTStateWatcher setTargetFilename:](v14, "setTargetFilename:", 0);
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[__CFURL URLByDeletingLastPathComponent](v10, "URLByDeletingLastPathComponent"));
      -[BTStateWatcher setDirectoryURL:](v14, "setDirectoryURL:", v15);

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[__CFURL lastPathComponent](v10, "lastPathComponent"));
      -[BTStateWatcher setTargetFilename:](v14, "setTargetFilename:", v16);

    }
    -[BTStateWatcher setBlock:](v14, "setBlock:", v7);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)dealloc
{
  objc_super v3;

  -[BTStateWatcher cancel](self, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)BTStateWatcher;
  -[BTStateWatcher dealloc](&v3, "dealloc");
}

- (BOOL)start
{
  void *v3;
  BOOL v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  int v10;
  uintptr_t v11;
  dispatch_queue_global_t global_queue;
  NSObject *v13;
  dispatch_source_t v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  dispatch_source_t v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void **v29;
  uint64_t v30;
  void (*v31)(uint64_t);
  void *v32;
  BTStateWatcher *v33;
  id v34;
  _QWORD handler[5];
  id v36;
  id location;
  _QWORD block[5];
  _BYTE v39[16];
  uint8_t buf[16];
  uint8_t v41[24];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BTStateWatcher block](self, "block"));

  if (v3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100074220;
    block[3] = &unk_1001E20E8;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    return 1;
  }
  else
  {
    objc_initWeak(&location, self);
    v5 = (id)qword_100218BD8;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[BTStateWatcher directoryURL](self, "directoryURL"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[BTStateWatcher targetFilename](self, "targetFilename"));
      sub_10016DA78(v6, v7, v41, v5);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BTStateWatcher directoryURL](self, "directoryURL"));
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "path")));
    -[BTStateWatcher setFd:](self, "setFd:", open((const char *)objc_msgSend(v9, "fileSystemRepresentation"), 0x8000));

    v10 = -[BTStateWatcher fd](self, "fd");
    v4 = v10 > 0;
    if (v10 < 1)
    {
      v26 = (id)qword_100218BD8;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[BTStateWatcher directoryURL](self, "directoryURL"));
        sub_10016DA28(v27, buf, v26);
      }

    }
    else
    {
      v11 = -[BTStateWatcher fd](self, "fd");
      global_queue = dispatch_get_global_queue(0, 0);
      v13 = objc_claimAutoreleasedReturnValue(global_queue);
      v14 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_vnode, v11, 2uLL, v13);
      -[BTStateWatcher setDispatchSourceChange:](self, "setDispatchSourceChange:", v14);

      v15 = objc_claimAutoreleasedReturnValue(-[BTStateWatcher dispatchSourceChange](self, "dispatchSourceChange"));
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_10007428C;
      handler[3] = &unk_1001E3F78;
      handler[4] = self;
      objc_copyWeak(&v36, &location);
      dispatch_source_set_event_handler(v15, handler);

      v16 = objc_claimAutoreleasedReturnValue(-[BTStateWatcher dispatchSourceChange](self, "dispatchSourceChange"));
      dispatch_resume(v16);

      v17 = (id)qword_100218BD8;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[BTStateWatcher directoryURL](self, "directoryURL"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "path"));
        sub_10016D9D8(v19, (uint64_t)buf, v17, v18);
      }

      v20 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_vnode, -[BTStateWatcher fd](self, "fd"), 0x61uLL, v13);
      -[BTStateWatcher setDispatchSourceAbort:](self, "setDispatchSourceAbort:", v20);

      v21 = objc_claimAutoreleasedReturnValue(-[BTStateWatcher dispatchSourceAbort](self, "dispatchSourceAbort"));
      v29 = _NSConcreteStackBlock;
      v30 = 3221225472;
      v31 = sub_1000742E8;
      v32 = &unk_1001E3F78;
      v33 = self;
      objc_copyWeak(&v34, &location);
      dispatch_source_set_event_handler(v21, &v29);

      v22 = objc_claimAutoreleasedReturnValue(-[BTStateWatcher dispatchSourceAbort](self, "dispatchSourceAbort", v29, v30, v31, v32, v33));
      dispatch_resume(v22);

      v23 = (id)qword_100218BD8;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[BTStateWatcher directoryURL](self, "directoryURL"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "path"));
        sub_10016D988(v25, (uint64_t)v39, v23, v24);
      }

      objc_destroyWeak(&v34);
      objc_destroyWeak(&v36);
    }
    objc_destroyWeak(&location);
  }
  return v4;
}

+ (id)monitorURL:(id)a3 action:(id)a4
{
  id v5;
  id v6;
  BTStateWatcher *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v5 = a4;
  v6 = a3;
  v7 = -[BTStateWatcher initWithURL:action:]([BTStateWatcher alloc], "initWithURL:action:", v6, v5);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BTStateWatcher targetFilename](v7, "targetFilename"));
  if (v8)
  {
    v9 = qword_100218BD8;
    if (os_log_type_enabled((os_log_t)qword_100218BD8, OS_LOG_TYPE_DEBUG))
      sub_10016DC00(v9, v10, v11, v12, v13, v14, v15, v16);
    -[BTStateWatcher directoryChanged](v7, "directoryChanged");
  }
  if (!-[BTStateWatcher triggered](v7, "triggered") && !-[BTStateWatcher start](v7, "start"))
  {
    -[BTStateWatcher cancel](v7, "cancel");

    v7 = 0;
  }
  return v7;
}

+ (id)monitorBuddyStateWithAction:(id)a3
{
  id v3;
  BTStateWatcher *v4;
  BTStateWatcher *v5;
  BTStateWatcher *v6;
  BTStateWatcher *v7;
  void **v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  BTStateWatcher *v13;
  int v14;
  int out_token;

  v3 = a3;
  v4 = objc_opt_new(BTStateWatcher);
  -[BTStateWatcher setIsWatchingBuddy:](v4, "setIsWatchingBuddy:", 1);
  -[BTStateWatcher setBlock:](v4, "setBlock:", v3);

  out_token = -1;
  v9 = _NSConcreteStackBlock;
  v10 = 3221225472;
  v11 = sub_10007451C;
  v12 = &unk_1001E44B8;
  v14 = -1;
  v13 = v4;
  v5 = v4;
  notify_register_dispatch("com.apple.purplebuddy.setupdone", &out_token, (dispatch_queue_t)&_dispatch_main_q, &v9);
  if (-[BTStateWatcher start](v5, "start", v9, v10, v11, v12))
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

+ (id)monitorFirstUnlockWithAction:(id)a3
{
  id v3;
  BTStateWatcher *v4;
  BTStateWatcher *v5;
  BTStateWatcher *v6;
  BTStateWatcher *v7;
  void **v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  BTStateWatcher *v13;
  int v14;
  int out_token;

  v3 = a3;
  v4 = objc_opt_new(BTStateWatcher);
  -[BTStateWatcher setBlock:](v4, "setBlock:", v3);

  out_token = -1;
  v9 = _NSConcreteStackBlock;
  v10 = 3221225472;
  v11 = sub_100074690;
  v12 = &unk_1001E44B8;
  v14 = -1;
  v13 = v4;
  v5 = v4;
  notify_register_dispatch("com.apple.mobile.keybagd.first_unlock", &out_token, (dispatch_queue_t)&_dispatch_main_q, &v9);
  if (-[BTStateWatcher start](v5, "start", v9, v10, v11, v12))
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

- (void)directoryChanged
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  id v23;
  _QWORD block[5];
  _BYTE v25[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BTStateWatcher targetFilename](self, "targetFilename"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BTStateWatcher directoryURL](self, "directoryURL"));
    v23 = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v5, 0, 0, &v23));
    v7 = v23;

    if (v7)
    {
      v8 = (void *)qword_100218BD8;
      if (os_log_type_enabled((os_log_t)qword_100218BD8, OS_LOG_TYPE_ERROR))
        sub_10016DCB4(v8, self, (uint64_t)v7);
      -[BTStateWatcher cancel](self, "cancel");
    }
    else
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v18 = v6;
      v9 = v6;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v20;
        while (2)
        {
          v13 = 0;
          do
          {
            if (*(_QWORD *)v20 != v12)
              objc_enumerationMutation(v9);
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1)
                                                                               + 8 * (_QWORD)v13), "lastPathComponent"));
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[BTStateWatcher targetFilename](self, "targetFilename"));
            v16 = objc_msgSend(v14, "isEqualToString:", v15);

            if (v16)
            {
              -[BTStateWatcher fileDiscovered](self, "fileDiscovered");

              v6 = v18;
              goto LABEL_18;
            }
            v13 = (char *)v13 + 1;
          }
          while (v11 != v13);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
          if (v11)
            continue;
          break;
        }
      }

      v17 = (void *)qword_100218BD8;
      v6 = v18;
      if (os_log_type_enabled((os_log_t)qword_100218BD8, OS_LOG_TYPE_DEBUG))
        sub_10016DC34(v17);
    }
LABEL_18:

  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000749A0;
    block[3] = &unk_1001E20E8;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)fileDiscovered
{
  void *v3;
  _QWORD block[5];

  v3 = (void *)qword_100218BD8;
  if (os_log_type_enabled((os_log_t)qword_100218BD8, OS_LOG_TYPE_DEBUG))
    sub_10016DD5C(v3);
  -[BTStateWatcher setTriggered:](self, "setTriggered:", 1);
  -[BTStateWatcher cancel](self, "cancel");
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100074A78;
  block[3] = &unk_1001E20E8;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)cancel
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  __CFNotificationCenter *DarwinNotifyCenter;

  v3 = qword_100218BD8;
  if (os_log_type_enabled((os_log_t)qword_100218BD8, OS_LOG_TYPE_DEBUG))
    sub_10016DDDC(v3, v4, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BTStateWatcher dispatchSourceChange](self, "dispatchSourceChange"));

  if (v11)
  {
    v12 = objc_claimAutoreleasedReturnValue(-[BTStateWatcher dispatchSourceChange](self, "dispatchSourceChange"));
    dispatch_source_cancel(v12);

    -[BTStateWatcher setDispatchSourceChange:](self, "setDispatchSourceChange:", 0);
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BTStateWatcher dispatchSourceAbort](self, "dispatchSourceAbort"));

  if (v13)
  {
    v14 = objc_claimAutoreleasedReturnValue(-[BTStateWatcher dispatchSourceAbort](self, "dispatchSourceAbort"));
    dispatch_source_cancel(v14);

    -[BTStateWatcher setDispatchSourceAbort:](self, "setDispatchSourceAbort:", 0);
  }
  if (-[BTStateWatcher fd](self, "fd") >= 1)
  {
    close(-[BTStateWatcher fd](self, "fd"));
    -[BTStateWatcher setFd:](self, "setFd:", 0);
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  if (DarwinNotifyCenter)
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, BYSetupAssistantFinishedDarwinNotification, 0);
}

- (NSURL)directoryURL
{
  return self->_directoryURL;
}

- (void)setDirectoryURL:(id)a3
{
  objc_storeStrong((id *)&self->_directoryURL, a3);
}

- (NSString)targetFilename
{
  return self->_targetFilename;
}

- (void)setTargetFilename:(id)a3
{
  objc_storeStrong((id *)&self->_targetFilename, a3);
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int)fd
{
  return self->_fd;
}

- (void)setFd:(int)a3
{
  self->_fd = a3;
}

- (OS_dispatch_source)dispatchSourceChange
{
  return self->_dispatchSourceChange;
}

- (void)setDispatchSourceChange:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchSourceChange, a3);
}

- (OS_dispatch_source)dispatchSourceAbort
{
  return self->_dispatchSourceAbort;
}

- (void)setDispatchSourceAbort:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchSourceAbort, a3);
}

- (BOOL)triggered
{
  return self->_triggered;
}

- (void)setTriggered:(BOOL)a3
{
  self->_triggered = a3;
}

- (BOOL)isWatchingBuddy
{
  return self->_isWatchingBuddy;
}

- (void)setIsWatchingBuddy:(BOOL)a3
{
  self->_isWatchingBuddy = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchSourceAbort, 0);
  objc_storeStrong((id *)&self->_dispatchSourceChange, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_targetFilename, 0);
  objc_storeStrong((id *)&self->_directoryURL, 0);
}

@end
