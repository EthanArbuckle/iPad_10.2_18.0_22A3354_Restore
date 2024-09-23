@implementation SCROServer

+ (SCROServer)sharedServer
{
  if (sharedServer_onceToken != -1)
    dispatch_once(&sharedServer_onceToken, &__block_literal_global_10);
  return (SCROServer *)(id)_sharedServer;
}

void __26__SCROServer_sharedServer__block_invoke()
{
  SCROServer *v0;
  void *v1;

  v0 = objc_alloc_init(SCROServer);
  v1 = (void *)_sharedServer;
  _sharedServer = (uint64_t)v0;

}

- (SCROServer)init
{
  SCROServer *v2;
  NSLock *v3;
  NSLock *contentLock;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SCROServer;
  v2 = -[SCROServer init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    contentLock = v2->_contentLock;
    v2->_contentLock = v3;

    -[SCROServer _deleteOldResources](v2, "_deleteOldResources");
    -[SCROServer _ensureResourcesExist](v2, "_ensureResourcesExist");
  }
  return v2;
}

- (int64_t)_clientCount
{
  int64_t clientCount;

  -[NSLock lock](self->_contentLock, "lock");
  clientCount = self->_clientCount;
  -[NSLock unlock](self->_contentLock, "unlock");
  return clientCount;
}

- (int64_t)_incrementClientCount
{
  int64_t v3;

  -[NSLock lock](self->_contentLock, "lock");
  v3 = self->_clientCount + 1;
  self->_clientCount = v3;
  -[NSLock unlock](self->_contentLock, "unlock");
  return v3;
}

- (void)_setClientCount:(int64_t)a3
{
  -[NSLock lock](self->_contentLock, "lock");
  self->_clientCount = a3;
  -[NSLock unlock](self->_contentLock, "unlock");
}

- (__CFRunLoopTimer)_deathTimer
{
  __CFRunLoopTimer *deathTimer;

  -[NSLock lock](self->_contentLock, "lock");
  deathTimer = self->_deathTimer;
  -[NSLock unlock](self->_contentLock, "unlock");
  return deathTimer;
}

- (int)_registerForNotificationOnDeathPort:(unsigned int)a3
{
  kern_return_t v5;
  mach_port_t previous;

  previous = 0;
  -[NSLock lock](self->_contentLock, "lock");
  v5 = mach_port_request_notification(*MEMORY[0x24BDAEC58], a3, 72, 0, self->_deathPort, 0x15u, &previous);
  -[NSLock unlock](self->_contentLock, "unlock");
  return v5;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (id)delegate
{
  return self->_delegate;
}

- (BOOL)isRegisteredWithMach
{
  return self->_isRegisteredWithMach;
}

- (BOOL)registerWithMach
{
  return -[SCROServer _registerWithMachServiceName:](self, "_registerWithMachServiceName:", "com.apple.scrod");
}

- (BOOL)_registerWithMachServiceName:(char *)a3
{
  BOOL v3;
  __CFRunLoop *Current;
  ipc_space_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  __CFRunLoopSource *v12;
  __CFRunLoopSource *v13;
  const __CFString *v14;
  CFAbsoluteTime v15;
  __CFRunLoopTimer *v16;
  CFRunLoopTimerContext context;
  mach_port_t special_port;

  if (self->_isRegisteredWithMach)
    return 1;
  special_port = 0;
  Current = CFRunLoopGetCurrent();
  v7 = (ipc_space_t *)MEMORY[0x24BDAEC58];
  v8 = task_get_special_port(*MEMORY[0x24BDAEC58], 4, &special_port);
  if ((_DWORD)v8)
  {
    NSLog(CFSTR("ERROR [%d]:  Could not get bootstrap port. Exiting."), v8);
  }
  else
  {
    v9 = bootstrap_check_in(special_port, a3, &self->_serverPort);
    if ((_DWORD)v9)
    {
      NSLog(CFSTR("ERROR [%d]:  Could not checkin. Exiting."), v9);
    }
    else
    {
      v11 = MSHCreateMIGServerSource();
      if (v11)
      {
        v12 = (__CFRunLoopSource *)v11;
        -[NSLock lock](self->_contentLock, "lock");
        self->_serverSource = v12;
        -[NSLock unlock](self->_contentLock, "unlock");
        mach_port_deallocate(*v7, special_port);
        v3 = 1;
        v13 = (__CFRunLoopSource *)MSHCreateMachServerSource();
        self->_deathSource = v13;
        if (v13)
        {
          context.version = 0;
          memset(&context.retain, 0, 24);
          context.info = self;
          -[NSLock lock](self->_contentLock, "lock");
          self->_deathPort = MSHGetMachPortFromSource();
          v14 = (const __CFString *)*MEMORY[0x24BDBD598];
          CFRunLoopAddSource(Current, self->_deathSource, (CFRunLoopMode)*MEMORY[0x24BDBD598]);
          v15 = CFAbsoluteTimeGetCurrent();
          v16 = CFRunLoopTimerCreate(0, v15 + 3.0, 3.0, 0, 0, (CFRunLoopTimerCallBack)_deathTimerHandler, &context);
          self->_deathTimer = v16;
          CFRunLoopAddTimer(Current, v16, v14);
          -[NSLock unlock](self->_contentLock, "unlock");
          self->_isRegisteredWithMach = 1;
          return v3;
        }
        NSLog(CFSTR("ERROR:  Could not create Death Port for Screen Reader Output Server Source.  Exiting."));
      }
      else
      {
        NSLog(CFSTR("ERROR:  Could not create MIG Server Source. Exiting."));
      }
    }
  }
  -[SCROServer unregisterWithMach](self, "unregisterWithMach");
  return 0;
}

- (void)unregisterWithMach
{
  __CFRunLoopTimer *deathTimer;
  __CFRunLoopSource *serverSource;
  __CFRunLoopSource *deathSource;

  self->_isRegisteredWithMach = 0;
  -[NSLock lock](self->_contentLock, "lock");
  deathTimer = self->_deathTimer;
  if (deathTimer)
  {
    CFRunLoopTimerInvalidate(deathTimer);
    CFRelease(self->_deathTimer);
    self->_deathTimer = 0;
  }
  serverSource = self->_serverSource;
  if (serverSource)
  {
    CFRelease(serverSource);
    self->_serverSource = 0;
  }
  -[NSLock unlock](self->_contentLock, "unlock");
  deathSource = self->_deathSource;
  if (deathSource)
  {
    CFRunLoopSourceInvalidate(deathSource);
    CFRelease(self->_deathSource);
    self->_deathSource = 0;
  }
  if (self->_serverPort)
    self->_serverPort = 0;
  -[NSLock lock](self->_contentLock, "lock");
  if (self->_deathPort)
    self->_deathPort = 0;
  -[NSLock unlock](self->_contentLock, "unlock");
}

- (__CFRunLoopSource)serverSource
{
  __CFRunLoopSource *serverSource;

  -[NSLock lock](self->_contentLock, "lock");
  serverSource = self->_serverSource;
  -[NSLock unlock](self->_contentLock, "unlock");
  return serverSource;
}

- (void)_deleteOldResources
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  id v6;

  NSHomeDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("/Library/Accessibility/ktoa_u_kwa.dic"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fileExistsAtPath:", v6);

  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeItemAtPath:error:", v6, 0);

  }
}

- (BOOL)_ensureResourcesExist
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  BOOL v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  NSObject *v15;
  int data_block;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  id v20[2];
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint8_t buf[4];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  NSHomeDirectory();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("/Library/Accessibility/ktoa_u_kwa_v5.dic"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "fileExistsAtPath:", v3);

  if ((v5 & 1) == 0)
  {
    archive_read_new();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/ScreenReader/BrailleTables/BrailleNBSC.brailletable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "resourcePath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingString:", CFSTR("/ktoa_u_kwa"));
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v9, "UTF8String");

    if (archive_read_support_format_zip())
    {
      _SCROD_LOG();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v25 = archive_error_string();
        v11 = "NBSC Braille for text: (init) archive_read unable to set supported formats: %s.";
        v12 = v10;
        v13 = 12;
LABEL_9:
        _os_log_impl(&dword_2115BB000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
        goto LABEL_10;
      }
      goto LABEL_10;
    }
    if (archive_read_open_filename())
    {
      _SCROD_LOG();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v11 = "NBSC Braille for text: (init) failed to unzip.";
        v12 = v10;
        v13 = 2;
        goto LABEL_9;
      }
LABEL_10:

      v6 = 0;
      goto LABEL_11;
    }
    v23 = 0;
    if (archive_read_next_header())
    {
      _SCROD_LOG();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2115BB000, v15, OS_LOG_TYPE_DEFAULT, "NBSC Braille for text: (init) failed to read header.", buf, 2u);
      }
      v6 = 0;
      goto LABEL_28;
    }
    objc_msgSend(MEMORY[0x24BDBCEC8], "data");
    v15 = objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v22 = 0;
    v20[1] = 0;
    while (1)
    {
      data_block = archive_read_data_block();
      if (data_block)
        break;
      -[NSObject appendBytes:length:](v15, "appendBytes:length:", v22, v21);
    }
    if (data_block == 1)
    {
      v20[0] = 0;
      -[NSObject writeToFile:options:error:](v15, "writeToFile:options:error:", v3, 1, v20);
      v17 = v20[0];
      v6 = v17 == 0;
      if (!v17)
      {
LABEL_27:

LABEL_28:
        goto LABEL_11;
      }
      _SCROD_LOG();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        -[NSObject localizedDescription](v17, "localizedDescription");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v25 = (uint64_t)v19;
        _os_log_impl(&dword_2115BB000, v18, OS_LOG_TYPE_DEFAULT, "NBSC Braille for text: writing the unzipped file of ktoa_u_kwa.zip failed: %@", buf, 0xCu);

      }
    }
    else
    {
      _SCROD_LOG();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v25 = archive_error_string();
        _os_log_impl(&dword_2115BB000, v17, OS_LOG_TYPE_DEFAULT, "NBSC Braille for text: can't read ktoa_u_kwp.zip: %s", buf, 0xCu);
      }
    }
    v6 = 0;
    goto LABEL_27;
  }
  v6 = 1;
LABEL_11:

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_contentLock, 0);
}

@end
