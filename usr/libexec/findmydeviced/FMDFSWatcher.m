@implementation FMDFSWatcher

- (FMDFSWatcher)init
{
  -[FMDFSWatcher doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (FMDFSWatcher)initWithURL:(id)a3 action:(id)a4
{
  id v6;
  id v7;
  FMDFSWatcher *v8;
  FMDFSWatcher *v9;
  const __CFURL *v10;
  __CFString *v11;
  unsigned int v12;
  FMDFSWatcher *v13;
  FMDFSWatcher *v14;
  void *v15;
  void *v16;
  objc_super v18;
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)FMDFSWatcher;
  v8 = -[FMDFSWatcher init](&v19, "init");
  if (v8)
  {
    v9 = v8;
    v10 = (const __CFURL *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "standardizedURL"));
    v11 = (__CFString *)CFURLCopyPath(v10);
    v12 = -[__CFString hasSuffix:](v11, "hasSuffix:", CFSTR("/"));
    CFRelease(v11);
    v18.receiver = v9;
    v18.super_class = (Class)FMDFSWatcher;
    v13 = -[FMDFSWatcher init](&v18, "init");
    v14 = v13;
    if (v12)
    {
      -[FMDFSWatcher setDirectoryURL:](v13, "setDirectoryURL:", v10);
      -[FMDFSWatcher setTargetFilename:](v14, "setTargetFilename:", 0);
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[__CFURL URLByDeletingLastPathComponent](v10, "URLByDeletingLastPathComponent"));
      -[FMDFSWatcher setDirectoryURL:](v14, "setDirectoryURL:", v15);

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[__CFURL lastPathComponent](v10, "lastPathComponent"));
      -[FMDFSWatcher setTargetFilename:](v14, "setTargetFilename:", v16);

    }
    -[FMDFSWatcher setBlock:](v14, "setBlock:", v7);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)start
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  int v9;
  uintptr_t v10;
  dispatch_queue_global_t global_queue;
  NSObject *v12;
  dispatch_source_t v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  dispatch_source_t v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  _QWORD v34[5];
  id v35;
  _QWORD handler[5];
  id v37;
  id location;
  uint8_t v39[4];
  void *v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;

  objc_initWeak(&location, self);
  v3 = sub_1000031B8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFSWatcher directoryURL](self, "directoryURL"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFSWatcher targetFilename](self, "targetFilename"));
    *(_DWORD *)buf = 138412546;
    v42 = v5;
    v43 = 2112;
    v44 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Starting to watch for existence of %@/%@", buf, 0x16u);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFSWatcher directoryURL](self, "directoryURL"));
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "path")));
  -[FMDFSWatcher setFd:](self, "setFd:", open((const char *)objc_msgSend(v8, "fileSystemRepresentation"), 0x8000));

  v9 = -[FMDFSWatcher fd](self, "fd");
  if (v9 < 1)
  {
    v27 = sub_1000031B8();
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFSWatcher directoryURL](self, "directoryURL"));
      sub_10022BC1C(v29, buf, v28);
    }

    v30 = sub_1000031B8();
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFSWatcher directoryURL](self, "directoryURL"));
      *(_DWORD *)v39 = 138412290;
      v40 = v32;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Failed to open %@", v39, 0xCu);

    }
  }
  else
  {
    v10 = -[FMDFSWatcher fd](self, "fd");
    global_queue = dispatch_get_global_queue(0, 0);
    v12 = objc_claimAutoreleasedReturnValue(global_queue);
    v13 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_vnode, v10, 2uLL, v12);
    -[FMDFSWatcher setDispatchSourceChange:](self, "setDispatchSourceChange:", v13);

    v14 = objc_claimAutoreleasedReturnValue(-[FMDFSWatcher dispatchSourceChange](self, "dispatchSourceChange"));
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10008F0F4;
    handler[3] = &unk_1002C4530;
    handler[4] = self;
    objc_copyWeak(&v37, &location);
    dispatch_source_set_event_handler(v14, handler);

    v15 = objc_claimAutoreleasedReturnValue(-[FMDFSWatcher dispatchSourceChange](self, "dispatchSourceChange"));
    dispatch_resume(v15);

    v16 = sub_1000031B8();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFSWatcher directoryURL](self, "directoryURL"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "path"));
      *(_DWORD *)buf = 138412290;
      v42 = v19;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Started monitoring changes to directory: %@", buf, 0xCu);

    }
    v20 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_vnode, -[FMDFSWatcher fd](self, "fd"), 0x61uLL, v12);
    -[FMDFSWatcher setDispatchSourceAbort:](self, "setDispatchSourceAbort:", v20);

    v21 = objc_claimAutoreleasedReturnValue(-[FMDFSWatcher dispatchSourceAbort](self, "dispatchSourceAbort"));
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_10008F1D4;
    v34[3] = &unk_1002C4530;
    v34[4] = self;
    objc_copyWeak(&v35, &location);
    dispatch_source_set_event_handler(v21, v34);

    v22 = objc_claimAutoreleasedReturnValue(-[FMDFSWatcher dispatchSourceAbort](self, "dispatchSourceAbort"));
    dispatch_resume(v22);

    v23 = sub_1000031B8();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFSWatcher directoryURL](self, "directoryURL"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "path"));
      *(_DWORD *)buf = 138412290;
      v42 = v26;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Started monitoring for removal of directory: %@", buf, 0xCu);

    }
    objc_destroyWeak(&v35);
    objc_destroyWeak(&v37);
  }
  objc_destroyWeak(&location);
  return v9 > 0;
}

+ (id)monitorURL:(id)a3 action:(id)a4
{
  id v5;
  id v6;
  FMDFSWatcher *v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint8_t v12[16];

  v5 = a4;
  v6 = a3;
  v7 = -[FMDFSWatcher initWithURL:action:]([FMDFSWatcher alloc], "initWithURL:action:", v6, v5);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFSWatcher targetFilename](v7, "targetFilename"));
  if (v8)
  {
    v9 = sub_1000031B8();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Calling directory changed on startup", v12, 2u);
    }

    -[FMDFSWatcher directoryChanged](v7, "directoryChanged");
  }
  if (!-[FMDFSWatcher triggered](v7, "triggered") && !-[FMDFSWatcher start](v7, "start"))
  {
    -[FMDFSWatcher cancel](v7, "cancel");

    v7 = 0;
  }
  return v7;
}

- (void)directoryChanged
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  id v21;
  void *v22;
  void (**v23)(void);
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  _BYTE v34[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFSWatcher targetFilename](self, "targetFilename"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFSWatcher directoryURL](self, "directoryURL"));
    v29 = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v5, 0, 0, &v29));
    v7 = v29;

    if (v7)
    {
      v8 = sub_1000031B8();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_10022BC70(self, (uint64_t)v7, v9);

      v10 = sub_1000031B8();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFSWatcher directoryURL](self, "directoryURL"));
        *(_DWORD *)buf = 138412546;
        v31 = v12;
        v32 = 2112;
        v33 = v7;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Error while trying to read the contents of directory %@: %@", buf, 0x16u);

      }
      -[FMDFSWatcher cancel](self, "cancel");
    }
    else
    {
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v24 = v6;
      v13 = v6;
      v14 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v26;
        while (2)
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v26 != v16)
              objc_enumerationMutation(v13);
            v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1)
                                                                               + 8 * (_QWORD)v17), "lastPathComponent"));
            v19 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFSWatcher targetFilename](self, "targetFilename"));
            v20 = objc_msgSend(v18, "isEqualToString:", v19);

            if (v20)
            {
              -[FMDFSWatcher fileDiscovered](self, "fileDiscovered");
              goto LABEL_20;
            }
            v17 = (char *)v17 + 1;
          }
          while (v15 != v17);
          v15 = -[NSObject countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
          if (v15)
            continue;
          break;
        }
      }

      v21 = sub_1000031B8();
      v13 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFSWatcher targetFilename](self, "targetFilename"));
        *(_DWORD *)buf = 138412290;
        v31 = v22;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "File was not found in the directory yet: %@", buf, 0xCu);

      }
LABEL_20:

      v6 = v24;
    }

  }
  else
  {
    v23 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[FMDFSWatcher block](self, "block"));
    v23[2]();

  }
}

- (void)fileDiscovered
{
  id v3;
  NSObject *v4;
  void *v5;
  void (**v6)(void);
  int v7;
  void *v8;

  v3 = sub_1000031B8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFSWatcher targetFilename](self, "targetFilename"));
    v7 = 138412290;
    v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Found file being watched: %@", (uint8_t *)&v7, 0xCu);

  }
  -[FMDFSWatcher setTriggered:](self, "setTriggered:", 1);
  -[FMDFSWatcher cancel](self, "cancel");
  v6 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[FMDFSWatcher block](self, "block"));
  v6[2]();

}

- (void)cancel
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  uint8_t v9[16];

  v3 = sub_1000031B8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Deinitializing watcher", v9, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFSWatcher dispatchSourceChange](self, "dispatchSourceChange"));
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[FMDFSWatcher dispatchSourceChange](self, "dispatchSourceChange"));
    dispatch_source_cancel(v6);

    -[FMDFSWatcher setDispatchSourceChange:](self, "setDispatchSourceChange:", 0);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FMDFSWatcher dispatchSourceAbort](self, "dispatchSourceAbort"));

  if (v7)
  {
    v8 = objc_claimAutoreleasedReturnValue(-[FMDFSWatcher dispatchSourceAbort](self, "dispatchSourceAbort"));
    dispatch_source_cancel(v8);

    -[FMDFSWatcher setDispatchSourceAbort:](self, "setDispatchSourceAbort:", 0);
  }
  if (-[FMDFSWatcher fd](self, "fd") >= 1)
  {
    close(-[FMDFSWatcher fd](self, "fd"));
    -[FMDFSWatcher setFd:](self, "setFd:", 0);
  }
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchSourceAbort, 0);
  objc_storeStrong((id *)&self->_dispatchSourceChange, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_targetFilename, 0);
  objc_storeStrong((id *)&self->_directoryURL, 0);
}

@end
