@implementation RTEventAgentManager

- (RTEventAgentManager)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithPlatform_);
}

- (RTEventAgentManager)initWithPlatform:(id)a3
{
  id v5;
  RTEventAgentManager *v6;
  RTEventAgentManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RTEventAgentManager;
  v6 = -[RTXPCListener initWithMachServiceName:](&v9, sel_initWithMachServiceName_, CFSTR("com.apple.routined.event"));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_platform, a3);
    -[RTEventAgentManager setup](v7, "setup");
  }

  return v7;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)RTEventAgentManager;
  -[RTEventAgentManager dealloc](&v4, sel_dealloc);
}

- (void)_setup
{
  void *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v5;
  NSObject *v6;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[RTXPCListener queue](self, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTEventAgentManager _setQueue:](self, "_setQueue:", v3);

  -[RTEventAgentManager setDelegate:](self, "setDelegate:", self);
  -[RTEventAgentManager resume](self, "resume");
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.routined.event"), 0, 0, 1u);
  if (-[RTPlatform internalInstall](self->_platform, "internalInstall"))
  {
    v5 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v5, self, (CFNotificationCallback)onLaunchDaemonWithRestorationIdentifierFromDefaults, CFSTR("LaunchDaemonWithRestorationIdentifier"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = CFSTR("com.apple.routined.event");
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "listening on mach port, %@", (uint8_t *)&v7, 0xCu);
  }

}

- (void)setup
{
  NSObject *v3;
  _QWORD block[5];

  -[RTXPCListener queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__RTEventAgentManager_setup__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __28__RTEventAgentManager_setup__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setup");
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  int v11;
  void *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    +[RTXPC executablePathOfConnection:](RTXPC, "executablePathOfConnection:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "processIdentifier");
    +[RTXPC signingIdentifierOfConnection:](RTXPC, "signingIdentifierOfConnection:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412802;
    v12 = v7;
    v13 = 1024;
    v14 = v8;
    v15 = 2112;
    v16 = v9;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "incoming connetion from %@(%d), signing identifier, %@", (uint8_t *)&v11, 0x1Cu);

  }
  -[RTEventAgentManager setPluginConnection:](self, "setPluginConnection:", v5);

  return 1;
}

- (void)setPluginConnection:(id)a3
{
  id v5;
  NSXPCConnection *pluginConnection;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint8_t v11[16];

  v5 = a3;
  objc_storeStrong((id *)&self->_pluginConnection, a3);
  pluginConnection = self->_pluginConnection;
  -[RTXPCListener queue](self, "queue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection _setQueue:](pluginConnection, "_setQueue:", v7);

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFD0C6E8);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setRemoteObjectInterface:](self->_pluginConnection, "setRemoteObjectInterface:", v8);

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFCC1748);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSXPCConnection setExportedInterface:](self->_pluginConnection, "setExportedInterface:", v9);

  -[NSXPCConnection setExportedObject:](self->_pluginConnection, "setExportedObject:", self);
  -[NSXPCConnection setInterruptionHandler:](self->_pluginConnection, "setInterruptionHandler:", &__block_literal_global_102);
  -[NSXPCConnection setInvalidationHandler:](self->_pluginConnection, "setInvalidationHandler:", &__block_literal_global_55);
  -[NSXPCConnection resume](self->_pluginConnection, "resume");
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "UserEventAgent plugin connected", v11, 2u);
  }

}

void __43__RTEventAgentManager_setPluginConnection___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1D1A22000, v0, OS_LOG_TYPE_INFO, "handle xpc interruption for UserEventAgent plugin", v1, 2u);
  }

}

void __43__RTEventAgentManager_setPluginConnection___block_invoke_54()
{
  NSObject *v0;
  uint8_t v1[16];

  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1D1A22000, v0, OS_LOG_TYPE_INFO, "handle xpc invalidation for UserEventAgent plugin", v1, 2u);
  }

}

- (void)onLaunchDaemonWithRestorationIdentifierFromDefaults
{
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  SEL v8;

  if (-[RTPlatform internalInstall](self->_platform, "internalInstall"))
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("LaunchDaemonWithRestorationIdentifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6[0] = MEMORY[0x1E0C809B0];
      v6[1] = 3221225472;
      v6[2] = __74__RTEventAgentManager_onLaunchDaemonWithRestorationIdentifierFromDefaults__block_invoke;
      v6[3] = &unk_1E92A2EB0;
      v8 = a2;
      v7 = v5;
      -[RTEventAgentManager launchDaemonWithRestorationIdentifier:withReply:](self, "launchDaemonWithRestorationIdentifier:withReply:", v7, v6);

    }
  }
}

void __74__RTEventAgentManager_onLaunchDaemonWithRestorationIdentifierFromDefaults__block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  void *v5;
  uint64_t v6;
  const __CFString *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = CFSTR("NO");
    v8 = 138412802;
    v9 = v5;
    if (a2)
      v7 = CFSTR("YES");
    v10 = 2112;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%@, restoration identifier, %@, client launched, %@", (uint8_t *)&v8, 0x20u);

  }
}

- (void)_launchDaemonWithRestorationIdentifier:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v11 = 138412290;
    v12 = v6;
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "launch daemon with restoration identifer, %@", (uint8_t *)&v11, 0xCu);
  }

  -[RTEventAgentManager pluginConnection](self, "pluginConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "remoteObjectProxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "launchDaemonWithRestorationIdentifier:reply:", v6, v7);

}

- (void)launchDaemonWithRestorationIdentifier:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[RTXPCListener queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__RTEventAgentManager_launchDaemonWithRestorationIdentifier_withReply___block_invoke;
  block[3] = &unk_1E9296F70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __71__RTEventAgentManager_launchDaemonWithRestorationIdentifier_withReply___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_launchDaemonWithRestorationIdentifier:withReply:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)checkin
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "UserEventAgent plugin %@", (uint8_t *)&v5, 0xCu);

  }
}

- (NSXPCConnection)pluginConnection
{
  return self->_pluginConnection;
}

- (RTPlatform)platform
{
  return self->_platform;
}

- (void)setPlatform:(id)a3
{
  objc_storeStrong((id *)&self->_platform, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_pluginConnection, 0);
}

@end
