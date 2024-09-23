@implementation VUIApplicationNotificationManager

- (void)_applicationDidBecomeActiveNotification:(id)a3
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  VUICDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D951F000, v3, OS_LOG_TYPE_DEFAULT, "VUIApplicationNotificationManager:: activated", v5, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("VUIApplicationDidBecomeActiveNotification"), 0);

}

- (void)listenForApplicationNotifications
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__applicationDidBecomeActiveNotification_, *MEMORY[0x1E0CEB270], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__applicationDidEnterBackgroundNotification_, *MEMORY[0x1E0CEB288], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__applicationWillResignActiveNotification_, *MEMORY[0x1E0CEB358], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__applicationWillTerminateNotification_, *MEMORY[0x1E0CEB360], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__applicationWillEnterForegroundNotification_, *MEMORY[0x1E0CEB350], 0);

}

void __51__VUIApplicationNotificationManager_sharedInstance__block_invoke()
{
  VUIApplicationNotificationManager *v0;
  void *v1;

  v0 = objc_alloc_init(VUIApplicationNotificationManager);
  v1 = (void *)sharedInstance___sharedInstance_1;
  sharedInstance___sharedInstance_1 = (uint64_t)v0;

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_4 != -1)
    dispatch_once(&sharedInstance_onceToken_4, &__block_literal_global_17);
  return (id)sharedInstance___sharedInstance_1;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)VUIApplicationNotificationManager;
  -[VUIApplicationNotificationManager dealloc](&v4, sel_dealloc);
}

- (void)_applicationDidEnterBackgroundNotification:(id)a3
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  VUICDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D951F000, v3, OS_LOG_TYPE_DEFAULT, "VUIApplicationNotificationManager:: backgrounded", v5, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("VUIApplicationDidEnterBackgroundNotification"), 0);

}

- (void)_applicationWillResignActiveNotification:(id)a3
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  VUICDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D951F000, v3, OS_LOG_TYPE_DEFAULT, "VUIApplicationNotificationManager:: deactivated", v5, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("VUIApplicationWillResignActiveNotification"), 0);

}

- (void)_applicationWillTerminateNotification:(id)a3
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  VUICDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D951F000, v3, OS_LOG_TYPE_DEFAULT, "VUIApplicationNotificationManager:: terminated", v5, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("VUIApplicationWillTerminateNotification"), 0);

}

- (void)_applicationWillEnterForegroundNotification:(id)a3
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  VUICDefaultLogObject();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D951F000, v3, OS_LOG_TYPE_DEFAULT, "VUIApplicationNotificationManager:: forgrounded", v5, 2u);
  }

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("VUIApplicationWillEnterForegroundNotification"), 0);

}

@end
