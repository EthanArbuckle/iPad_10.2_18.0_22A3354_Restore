@implementation SUSUIMockedSUPreferences

+ (id)sharedInstance
{
  id location;
  dispatch_once_t *v4;

  v4 = (dispatch_once_t *)&sharedInstance_onceToken_0;
  location = 0;
  objc_storeStrong(&location, &__block_literal_global_6);
  if (*v4 != -1)
    dispatch_once(v4, location);
  objc_storeStrong(&location, 0);
  return (id)sharedInstance_sharedInstance_0;
}

void __42__SUSUIMockedSUPreferences_sharedInstance__block_invoke()
{
  SUSUIMockedSUPreferences *v0;
  void *v1;

  v0 = objc_alloc_init(SUSUIMockedSUPreferences);
  v1 = (void *)sharedInstance_sharedInstance_0;
  sharedInstance_sharedInstance_0 = (uint64_t)v0;

}

- (BOOL)isAutomaticDownloadEnabled
{
  id v2;
  const char *v3;
  NSObject *log;
  os_log_type_t type;
  id v7;
  id v8;
  id v9;
  id v10;
  char v11;
  id v12;
  os_log_type_t v13;
  id v14;
  char v15;
  SEL v16;
  SUSUIMockedSUPreferences *v17;
  uint8_t v18[40];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v17 = self;
  v16 = a2;
  v10 = -[SUSUIMockedSUPreferences preferences](self, "preferences");
  v11 = objc_msgSend(v10, "automaticDownloadEnabled");

  v15 = v11 & 1;
  v14 = _SUSUIInternalLoggingFacility();
  v13 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
  {
    log = v14;
    type = v13;
    v9 = +[SUSUITestAutomationManager sharedManager](SUSUITestAutomationManager, "sharedManager");
    v8 = (id)objc_msgSend(v9, "currentSession");
    v7 = (id)objc_msgSend(v8, "correlationId");
    v2 = v7;
    v12 = v2;
    if ((v15 & 1) != 0)
      v3 = "YES";
    else
      v3 = "NO";
    __os_log_helper_16_2_3_8_64_8_32_8_34((uint64_t)v18, (uint64_t)v2, (uint64_t)"-[SUSUIMockedSUPreferences isAutomaticDownloadEnabled]", (uint64_t)v3);
    _os_log_impl(&dword_21BF33000, log, type, "[XCUI correlationId: %@] %s Getting mocked value for SUPreferences key 'automaticDownloadEnabled': %{public}s", v18, 0x20u);

    objc_storeStrong(&v12, 0);
  }
  objc_storeStrong(&v14, 0);
  return v15 & 1;
}

- (void)enableAutomaticDownload:(BOOL)a3
{
  id v3;
  const char *v4;
  BOOL v5;
  id v6;
  NSObject *log;
  os_log_type_t type;
  id v9;
  id v10;
  id v11;
  id v12;
  os_log_type_t v13;
  id v14;
  BOOL v15;
  SEL v16;
  SUSUIMockedSUPreferences *v17;
  uint8_t v18[40];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v17 = self;
  v16 = a2;
  v15 = a3;
  v14 = _SUSUIInternalLoggingFacility();
  v13 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
  {
    log = v14;
    type = v13;
    v11 = +[SUSUITestAutomationManager sharedManager](SUSUITestAutomationManager, "sharedManager");
    v10 = (id)objc_msgSend(v11, "currentSession");
    v9 = (id)objc_msgSend(v10, "correlationId");
    v3 = v9;
    v12 = v3;
    if (v15)
      v4 = "YES";
    else
      v4 = "NO";
    __os_log_helper_16_2_3_8_64_8_32_8_34((uint64_t)v18, (uint64_t)v3, (uint64_t)"-[SUSUIMockedSUPreferences enableAutomaticDownload:]", (uint64_t)v4);
    _os_log_impl(&dword_21BF33000, log, type, "[XCUI correlationId: %@] %s Setting mocked value for SUPreferences setter 'automaticDownloadEnabled': %{public}s", v18, 0x20u);

    objc_storeStrong(&v12, 0);
  }
  objc_storeStrong(&v14, 0);
  v5 = v15;
  v6 = -[SUSUIMockedSUPreferences preferences](v17, "preferences");
  objc_msgSend(v6, "setAutomaticDownloadEnabled:", v5);

}

- (BOOL)isAutomaticUpdateV2Enabled
{
  id v2;
  const char *v3;
  NSObject *log;
  os_log_type_t type;
  id v7;
  id v8;
  id v9;
  id v10;
  char v11;
  id v12;
  os_log_type_t v13;
  id v14;
  char v15;
  SEL v16;
  SUSUIMockedSUPreferences *v17;
  uint8_t v18[40];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v17 = self;
  v16 = a2;
  v10 = -[SUSUIMockedSUPreferences preferences](self, "preferences");
  v11 = objc_msgSend(v10, "automaticUpdateV2Enabled");

  v15 = v11 & 1;
  v14 = _SUSUIInternalLoggingFacility();
  v13 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
  {
    log = v14;
    type = v13;
    v9 = +[SUSUITestAutomationManager sharedManager](SUSUITestAutomationManager, "sharedManager");
    v8 = (id)objc_msgSend(v9, "currentSession");
    v7 = (id)objc_msgSend(v8, "correlationId");
    v2 = v7;
    v12 = v2;
    if ((v15 & 1) != 0)
      v3 = "YES";
    else
      v3 = "NO";
    __os_log_helper_16_2_3_8_64_8_32_8_34((uint64_t)v18, (uint64_t)v2, (uint64_t)"-[SUSUIMockedSUPreferences isAutomaticUpdateV2Enabled]", (uint64_t)v3);
    _os_log_impl(&dword_21BF33000, log, type, "[XCUI correlationId: %@] %s Getting mocked value for SUPreferences key 'automaticUpdateV2Enabled': %{public}s", v18, 0x20u);

    objc_storeStrong(&v12, 0);
  }
  objc_storeStrong(&v14, 0);
  return v15 & 1;
}

- (void)enableAutomaticUpdateV2:(BOOL)a3
{
  id v3;
  const char *v4;
  BOOL v5;
  id v6;
  NSObject *log;
  os_log_type_t type;
  id v9;
  id v10;
  id v11;
  id v12;
  os_log_type_t v13;
  id v14;
  BOOL v15;
  SEL v16;
  SUSUIMockedSUPreferences *v17;
  uint8_t v18[40];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v17 = self;
  v16 = a2;
  v15 = a3;
  v14 = _SUSUIInternalLoggingFacility();
  v13 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
  {
    log = v14;
    type = v13;
    v11 = +[SUSUITestAutomationManager sharedManager](SUSUITestAutomationManager, "sharedManager");
    v10 = (id)objc_msgSend(v11, "currentSession");
    v9 = (id)objc_msgSend(v10, "correlationId");
    v3 = v9;
    v12 = v3;
    if (v15)
      v4 = "YES";
    else
      v4 = "NO";
    __os_log_helper_16_2_3_8_64_8_32_8_34((uint64_t)v18, (uint64_t)v3, (uint64_t)"-[SUSUIMockedSUPreferences enableAutomaticUpdateV2:]", (uint64_t)v4);
    _os_log_impl(&dword_21BF33000, log, type, "[XCUI correlationId: %@] %s Setting mocked value for SUPreferences setter 'automaticUpdateV2Enabled': %{public}s", v18, 0x20u);

    objc_storeStrong(&v12, 0);
  }
  objc_storeStrong(&v14, 0);
  v5 = v15;
  v6 = -[SUSUIMockedSUPreferences preferences](v17, "preferences");
  objc_msgSend(v6, "setAutomaticUpdateV2Enabled:", v5);

}

- (BOOL)previousUserSpecifiedAutomaticUpdateV2Enabled
{
  id v2;
  const char *v3;
  NSObject *log;
  os_log_type_t type;
  id v7;
  id v8;
  id v9;
  id v10;
  char v11;
  id v12;
  os_log_type_t v13;
  id v14;
  char v15;
  SEL v16;
  SUSUIMockedSUPreferences *v17;
  uint8_t v18[40];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v17 = self;
  v16 = a2;
  v10 = -[SUSUIMockedSUPreferences preferences](self, "preferences");
  v11 = objc_msgSend(v10, "previousUserSpecifiedAutomaticUpdateV2Enabled");

  v15 = v11 & 1;
  v14 = _SUSUIInternalLoggingFacility();
  v13 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
  {
    log = v14;
    type = v13;
    v9 = +[SUSUITestAutomationManager sharedManager](SUSUITestAutomationManager, "sharedManager");
    v8 = (id)objc_msgSend(v9, "currentSession");
    v7 = (id)objc_msgSend(v8, "correlationId");
    v2 = v7;
    v12 = v2;
    if ((v15 & 1) != 0)
      v3 = "YES";
    else
      v3 = "NO";
    __os_log_helper_16_2_3_8_64_8_32_8_34((uint64_t)v18, (uint64_t)v2, (uint64_t)"-[SUSUIMockedSUPreferences previousUserSpecifiedAutomaticUpdateV2Enabled]", (uint64_t)v3);
    _os_log_impl(&dword_21BF33000, log, type, "[XCUI correlationId: %@] %s Getting mocked value for SUPreferences key 'previousUserSpecifiedAutomaticUpdateV2Enabled': %{public}s", v18, 0x20u);

    objc_storeStrong(&v12, 0);
  }
  objc_storeStrong(&v14, 0);
  return v15 & 1;
}

- (void)enablePreviousUserSpecifiedAutomaticUpdateV2:(BOOL)a3
{
  id v3;
  const char *v4;
  BOOL v5;
  id v6;
  NSObject *log;
  os_log_type_t type;
  id v9;
  id v10;
  id v11;
  id v12;
  os_log_type_t v13;
  id v14;
  BOOL v15;
  SEL v16;
  SUSUIMockedSUPreferences *v17;
  uint8_t v18[40];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v17 = self;
  v16 = a2;
  v15 = a3;
  v14 = _SUSUIInternalLoggingFacility();
  v13 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
  {
    log = v14;
    type = v13;
    v11 = +[SUSUITestAutomationManager sharedManager](SUSUITestAutomationManager, "sharedManager");
    v10 = (id)objc_msgSend(v11, "currentSession");
    v9 = (id)objc_msgSend(v10, "correlationId");
    v3 = v9;
    v12 = v3;
    if (v15)
      v4 = "YES";
    else
      v4 = "NO";
    __os_log_helper_16_2_3_8_64_8_32_8_34((uint64_t)v18, (uint64_t)v3, (uint64_t)"-[SUSUIMockedSUPreferences enablePreviousUserSpecifiedAutomaticUpdateV2:]", (uint64_t)v4);
    _os_log_impl(&dword_21BF33000, log, type, "[XCUI correlationId: %@] %s Setting mocked value for SUPreferences setter 'previousUserSpecifiedAutomaticUpdateV2Enabled': %{public}s", v18, 0x20u);

    objc_storeStrong(&v12, 0);
  }
  objc_storeStrong(&v14, 0);
  v5 = v15;
  v6 = -[SUSUIMockedSUPreferences preferences](v17, "preferences");
  objc_msgSend(v6, "setPreviousUserSpecifiedAutomaticUpdateV2Enabled:", v5);

}

- (BOOL)autoInstallSecurityResponse
{
  id v2;
  const char *v3;
  NSObject *log;
  os_log_type_t type;
  id v7;
  id v8;
  id v9;
  id v10;
  char v11;
  id v12;
  os_log_type_t v13;
  id v14;
  char v15;
  SEL v16;
  SUSUIMockedSUPreferences *v17;
  uint8_t v18[40];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v17 = self;
  v16 = a2;
  v10 = -[SUSUIMockedSUPreferences preferences](self, "preferences");
  v11 = objc_msgSend(v10, "autoInstallSecurityResponse");

  v15 = v11 & 1;
  v14 = _SUSUIInternalLoggingFacility();
  v13 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
  {
    log = v14;
    type = v13;
    v9 = +[SUSUITestAutomationManager sharedManager](SUSUITestAutomationManager, "sharedManager");
    v8 = (id)objc_msgSend(v9, "currentSession");
    v7 = (id)objc_msgSend(v8, "correlationId");
    v2 = v7;
    v12 = v2;
    if ((v15 & 1) != 0)
      v3 = "YES";
    else
      v3 = "NO";
    __os_log_helper_16_2_3_8_64_8_32_8_34((uint64_t)v18, (uint64_t)v2, (uint64_t)"-[SUSUIMockedSUPreferences autoInstallSecurityResponse]", (uint64_t)v3);
    _os_log_impl(&dword_21BF33000, log, type, "[XCUI correlationId: %@] %s Getting mocked value for SUPreferences key 'autoInstallSecurityResponse': %{public}s", v18, 0x20u);

    objc_storeStrong(&v12, 0);
  }
  objc_storeStrong(&v14, 0);
  return v15 & 1;
}

- (void)enableAutoInstallSecurityResponse:(BOOL)a3
{
  id v3;
  const char *v4;
  BOOL v5;
  id v6;
  NSObject *log;
  os_log_type_t type;
  id v9;
  id v10;
  id v11;
  id v12;
  os_log_type_t v13;
  id v14;
  BOOL v15;
  SEL v16;
  SUSUIMockedSUPreferences *v17;
  uint8_t v18[40];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v17 = self;
  v16 = a2;
  v15 = a3;
  v14 = _SUSUIInternalLoggingFacility();
  v13 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
  {
    log = v14;
    type = v13;
    v11 = +[SUSUITestAutomationManager sharedManager](SUSUITestAutomationManager, "sharedManager");
    v10 = (id)objc_msgSend(v11, "currentSession");
    v9 = (id)objc_msgSend(v10, "correlationId");
    v3 = v9;
    v12 = v3;
    if (v15)
      v4 = "YES";
    else
      v4 = "NO";
    __os_log_helper_16_2_3_8_64_8_32_8_34((uint64_t)v18, (uint64_t)v3, (uint64_t)"-[SUSUIMockedSUPreferences enableAutoInstallSecurityResponse:]", (uint64_t)v4);
    _os_log_impl(&dword_21BF33000, log, type, "[XCUI correlationId: %@] %s Setting mocked value for SUPreferences setter 'autoInstallSecurityResponse': %{public}s", v18, 0x20u);

    objc_storeStrong(&v12, 0);
  }
  objc_storeStrong(&v14, 0);
  v5 = v15;
  v6 = -[SUSUIMockedSUPreferences preferences](v17, "preferences");
  objc_msgSend(v6, "setAutoInstallSecurityResponse:", v5);

}

- (BOOL)previousUserSpecifiedAutoInstallSecurityResponse
{
  id v2;
  const char *v3;
  NSObject *log;
  os_log_type_t type;
  id v7;
  id v8;
  id v9;
  id v10;
  char v11;
  id v12;
  os_log_type_t v13;
  id v14;
  char v15;
  SEL v16;
  SUSUIMockedSUPreferences *v17;
  uint8_t v18[40];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v17 = self;
  v16 = a2;
  v10 = -[SUSUIMockedSUPreferences preferences](self, "preferences");
  v11 = objc_msgSend(v10, "previousUserSpecifiedAutoInstallSecurityResponse");

  v15 = v11 & 1;
  v14 = _SUSUIInternalLoggingFacility();
  v13 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
  {
    log = v14;
    type = v13;
    v9 = +[SUSUITestAutomationManager sharedManager](SUSUITestAutomationManager, "sharedManager");
    v8 = (id)objc_msgSend(v9, "currentSession");
    v7 = (id)objc_msgSend(v8, "correlationId");
    v2 = v7;
    v12 = v2;
    if ((v15 & 1) != 0)
      v3 = "YES";
    else
      v3 = "NO";
    __os_log_helper_16_2_3_8_64_8_32_8_34((uint64_t)v18, (uint64_t)v2, (uint64_t)"-[SUSUIMockedSUPreferences previousUserSpecifiedAutoInstallSecurityResponse]", (uint64_t)v3);
    _os_log_impl(&dword_21BF33000, log, type, "[XCUI correlationId: %@] %s Getting mocked value for SUPreferences key 'previousUserSpecifiedAutoInstallSecurityResponse': %{public}s", v18, 0x20u);

    objc_storeStrong(&v12, 0);
  }
  objc_storeStrong(&v14, 0);
  return v15 & 1;
}

- (void)enablePreviousUserSpecifiedAutoInstallSecurityResponse:(BOOL)a3
{
  id v3;
  const char *v4;
  BOOL v5;
  id v6;
  NSObject *log;
  os_log_type_t type;
  id v9;
  id v10;
  id v11;
  id v12;
  os_log_type_t v13;
  id v14;
  BOOL v15;
  SEL v16;
  SUSUIMockedSUPreferences *v17;
  uint8_t v18[40];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v17 = self;
  v16 = a2;
  v15 = a3;
  v14 = _SUSUIInternalLoggingFacility();
  v13 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
  {
    log = v14;
    type = v13;
    v11 = +[SUSUITestAutomationManager sharedManager](SUSUITestAutomationManager, "sharedManager");
    v10 = (id)objc_msgSend(v11, "currentSession");
    v9 = (id)objc_msgSend(v10, "correlationId");
    v3 = v9;
    v12 = v3;
    if (v15)
      v4 = "YES";
    else
      v4 = "NO";
    __os_log_helper_16_2_3_8_64_8_32_8_34((uint64_t)v18, (uint64_t)v3, (uint64_t)"-[SUSUIMockedSUPreferences enablePreviousUserSpecifiedAutoInstallSecurityResponse:]", (uint64_t)v4);
    _os_log_impl(&dword_21BF33000, log, type, "[XCUI correlationId: %@] %s Setting mocked value for SUPreferences setter 'previousUserSpecifiedAutoInstallSecurityResponse': %{public}s", v18, 0x20u);

    objc_storeStrong(&v12, 0);
  }
  objc_storeStrong(&v14, 0);
  v5 = v15;
  v6 = -[SUSUIMockedSUPreferences preferences](v17, "preferences");
  objc_msgSend(v6, "setPreviousUserSpecifiedAutoInstallSecurityResponse:", v5);

}

- (BOOL)autoInstallSystemAndDataFiles
{
  id v2;
  const char *v3;
  NSObject *log;
  os_log_type_t type;
  id v7;
  id v8;
  id v9;
  id v10;
  char v11;
  id v12;
  os_log_type_t v13;
  id v14;
  char v15;
  SEL v16;
  SUSUIMockedSUPreferences *v17;
  uint8_t v18[40];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v17 = self;
  v16 = a2;
  v10 = -[SUSUIMockedSUPreferences preferences](self, "preferences");
  v11 = objc_msgSend(v10, "autoInstallSystemAndDataFiles");

  v15 = v11 & 1;
  v14 = _SUSUIInternalLoggingFacility();
  v13 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
  {
    log = v14;
    type = v13;
    v9 = +[SUSUITestAutomationManager sharedManager](SUSUITestAutomationManager, "sharedManager");
    v8 = (id)objc_msgSend(v9, "currentSession");
    v7 = (id)objc_msgSend(v8, "correlationId");
    v2 = v7;
    v12 = v2;
    if ((v15 & 1) != 0)
      v3 = "YES";
    else
      v3 = "NO";
    __os_log_helper_16_2_3_8_64_8_32_8_34((uint64_t)v18, (uint64_t)v2, (uint64_t)"-[SUSUIMockedSUPreferences autoInstallSystemAndDataFiles]", (uint64_t)v3);
    _os_log_impl(&dword_21BF33000, log, type, "[XCUI correlationId: %@] %s Getting mocked value for SUPreferences key 'autoInstallSystemAndDataFiles': %{public}s", v18, 0x20u);

    objc_storeStrong(&v12, 0);
  }
  objc_storeStrong(&v14, 0);
  return v15 & 1;
}

- (void)enableAutoInstallSystemAndDataFiles:(BOOL)a3
{
  id v3;
  const char *v4;
  BOOL v5;
  id v6;
  NSObject *log;
  os_log_type_t type;
  id v9;
  id v10;
  id v11;
  id v12;
  os_log_type_t v13;
  id v14;
  BOOL v15;
  SEL v16;
  SUSUIMockedSUPreferences *v17;
  uint8_t v18[40];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v17 = self;
  v16 = a2;
  v15 = a3;
  v14 = _SUSUIInternalLoggingFacility();
  v13 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v14, OS_LOG_TYPE_DEFAULT))
  {
    log = v14;
    type = v13;
    v11 = +[SUSUITestAutomationManager sharedManager](SUSUITestAutomationManager, "sharedManager");
    v10 = (id)objc_msgSend(v11, "currentSession");
    v9 = (id)objc_msgSend(v10, "correlationId");
    v3 = v9;
    v12 = v3;
    if (v15)
      v4 = "YES";
    else
      v4 = "NO";
    __os_log_helper_16_2_3_8_64_8_32_8_34((uint64_t)v18, (uint64_t)v3, (uint64_t)"-[SUSUIMockedSUPreferences enableAutoInstallSystemAndDataFiles:]", (uint64_t)v4);
    _os_log_impl(&dword_21BF33000, log, type, "[XCUI correlationId: %@] %s Setting mocked value for SUPreferences setter 'autoInstallSystemAndDataFiles': %{public}s", v18, 0x20u);

    objc_storeStrong(&v12, 0);
  }
  objc_storeStrong(&v14, 0);
  v5 = v15;
  v6 = -[SUSUIMockedSUPreferences preferences](v17, "preferences");
  objc_msgSend(v6, "setAutoInstallSystemAndDataFiles:", v5);

}

- (BOOL)autoInstallSecurityResponseForceOn
{
  return 0;
}

- (id)preferences
{
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  id v6;
  id v7;
  id v8;
  id v9;
  NSObject *log;
  os_log_type_t type;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  char v19;
  id v20;
  id v21;
  int v22;
  id v23;
  id v24;
  char v25;
  id v26;
  id v27[3];
  id v28;
  uint8_t v29[32];
  uint8_t v30[24];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v27[2] = self;
  v27[1] = (id)a2;
  v16 = +[SUSUITestAutomationManager sharedManager](SUSUITestAutomationManager, "sharedManager");
  v15 = (id)objc_msgSend(v16, "currentSession");
  v27[0] = (id)objc_msgSend(v15, "strategyForServiceType:", 0);

  getSUSMKSoftwareUpdateServicesStrategyBaseClass_0();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = (id)objc_msgSend(v27[0], "options");
    getSUSMKSoftwareUpdateServicesStrategyOptionsClass_0();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v20 = _SUSUIInternalLoggingFacility();
      v19 = 16;
      if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_ERROR))
      {
        v4 = v20;
        v5 = v19;
        v8 = +[SUSUITestAutomationManager sharedManager](SUSUITestAutomationManager, "sharedManager");
        v7 = (id)objc_msgSend(v8, "currentSession");
        v6 = (id)objc_msgSend(v7, "correlationId");
        v3 = v6;
        v18 = v3;
        v17 = (id)objc_opt_class();
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v29, (uint64_t)v3, (uint64_t)v17);
        _os_log_error_impl(&dword_21BF33000, v4, v5, "[XCUI correlationId: %@] The strategy options class %@ doesn't inherit SUSMKSoftwareUpdateServicesStrategyOptions.", v29, 0x16u);

        objc_storeStrong(&v17, 0);
        objc_storeStrong(&v18, 0);
      }
      objc_storeStrong(&v20, 0);
    }
    v28 = (id)objc_msgSend(v21, "preferences");
    v22 = 1;
    objc_storeStrong(&v21, 0);
  }
  else
  {
    v26 = _SUSUIInternalLoggingFacility();
    v25 = 16;
    if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_ERROR))
    {
      log = v26;
      type = v25;
      v14 = +[SUSUITestAutomationManager sharedManager](SUSUITestAutomationManager, "sharedManager");
      v13 = (id)objc_msgSend(v14, "currentSession");
      v12 = (id)objc_msgSend(v13, "correlationId");
      v9 = v12;
      v24 = v9;
      v23 = (id)objc_opt_class();
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v30, (uint64_t)v9, (uint64_t)v23);
      _os_log_error_impl(&dword_21BF33000, log, type, "[XCUI correlationId: %@] The strategy class %@ doesn't inherit SUSMKSoftwareUpdateServicesStrategyBase.", v30, 0x16u);

      objc_storeStrong(&v23, 0);
      objc_storeStrong(&v24, 0);
    }
    objc_storeStrong(&v26, 0);
    v28 = 0;
    v22 = 1;
  }
  objc_storeStrong(v27, 0);
  return v28;
}

@end
