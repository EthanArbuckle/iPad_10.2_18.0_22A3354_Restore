@implementation SUSUIMockedSoftwareUpdateClientManager

- (BOOL)isAutoDownloadEnabled
{
  id v2;
  const __CFString *v3;
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
  SUSUIMockedSoftwareUpdateClientManager *v17;
  uint8_t v18[40];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v17 = self;
  v16 = a2;
  v10 = -[SUSUIMockedSoftwareUpdateClientManager preferences](self, "preferences");
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
      v3 = CFSTR("YES");
    else
      v3 = CFSTR("NO");
    __os_log_helper_16_2_3_8_64_8_32_8_64((uint64_t)v18, (uint64_t)v2, (uint64_t)"-[SUSUIMockedSoftwareUpdateClientManager isAutoDownloadEnabled]", (uint64_t)v3);
    _os_log_impl(&dword_21BF33000, log, type, "[XCUI correlationId: %@] %s Getting mocked value for SUPreferences key 'automaticDownloadEnabled': %@", v18, 0x20u);

    objc_storeStrong(&v12, 0);
  }
  objc_storeStrong(&v14, 0);
  return v15 & 1;
}

- (void)queue_setAutoDownloadEnabled:(BOOL)a3
{
  id v3;
  const __CFString *v4;
  id v5;
  NSObject *log;
  os_log_type_t type;
  id v8;
  id v9;
  id v10;
  id v11;
  os_log_type_t v12;
  id v13;
  BOOL v14;
  SEL v15;
  SUSUIMockedSoftwareUpdateClientManager *v16;
  uint8_t v17[40];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v16 = self;
  v15 = a2;
  v14 = a3;
  v13 = _SUSUIInternalLoggingFacility();
  v12 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
  {
    log = v13;
    type = v12;
    v10 = +[SUSUITestAutomationManager sharedManager](SUSUITestAutomationManager, "sharedManager");
    v9 = (id)objc_msgSend(v10, "currentSession");
    v8 = (id)objc_msgSend(v9, "correlationId");
    v3 = v8;
    v11 = v3;
    if (v14)
      v4 = CFSTR("YES");
    else
      v4 = CFSTR("NO");
    __os_log_helper_16_2_3_8_64_8_32_8_64((uint64_t)v17, (uint64_t)v3, (uint64_t)"-[SUSUIMockedSoftwareUpdateClientManager queue_setAutoDownloadEnabled:]", (uint64_t)v4);
    _os_log_impl(&dword_21BF33000, log, type, "[XCUI correlationId: %@] %s Setting mocked value for SUPreferences setter 'setAutomaticDownloadEnabled': %@", v17, 0x20u);

    objc_storeStrong(&v11, 0);
  }
  objc_storeStrong(&v13, 0);
  v5 = -[SUSUIMockedSoftwareUpdateClientManager preferences](v16, "preferences");
  objc_msgSend(v5, "setAutomaticDownloadEnabled:", v14);

}

- (BOOL)isAutoInstallEnabled
{
  id v2;
  const __CFString *v3;
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
  SUSUIMockedSoftwareUpdateClientManager *v17;
  uint8_t v18[40];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v17 = self;
  v16 = a2;
  v10 = -[SUSUIMockedSoftwareUpdateClientManager preferences](self, "preferences");
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
      v3 = CFSTR("YES");
    else
      v3 = CFSTR("NO");
    __os_log_helper_16_2_3_8_64_8_32_8_64((uint64_t)v18, (uint64_t)v2, (uint64_t)"-[SUSUIMockedSoftwareUpdateClientManager isAutoInstallEnabled]", (uint64_t)v3);
    _os_log_impl(&dword_21BF33000, log, type, "[XCUI correlationId: %@] %s Getting mocked value for SUPreferences key 'automaticUpdateV2Enabled': %@", v18, 0x20u);

    objc_storeStrong(&v12, 0);
  }
  objc_storeStrong(&v14, 0);
  return v15 & 1;
}

- (void)queue_setAutoInstallEnabled:(BOOL)a3
{
  id v3;
  const __CFString *v4;
  id v5;
  NSObject *log;
  os_log_type_t type;
  id v8;
  id v9;
  id v10;
  id v11;
  os_log_type_t v12;
  id v13;
  BOOL v14;
  SEL v15;
  SUSUIMockedSoftwareUpdateClientManager *v16;
  uint8_t v17[40];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v16 = self;
  v15 = a2;
  v14 = a3;
  v13 = _SUSUIInternalLoggingFacility();
  v12 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
  {
    log = v13;
    type = v12;
    v10 = +[SUSUITestAutomationManager sharedManager](SUSUITestAutomationManager, "sharedManager");
    v9 = (id)objc_msgSend(v10, "currentSession");
    v8 = (id)objc_msgSend(v9, "correlationId");
    v3 = v8;
    v11 = v3;
    if (v14)
      v4 = CFSTR("YES");
    else
      v4 = CFSTR("NO");
    __os_log_helper_16_2_3_8_64_8_32_8_64((uint64_t)v17, (uint64_t)v3, (uint64_t)"-[SUSUIMockedSoftwareUpdateClientManager queue_setAutoInstallEnabled:]", (uint64_t)v4);
    _os_log_impl(&dword_21BF33000, log, type, "[XCUI correlationId: %@] %s Setting mocked value for SUPreferences setter 'setAutomaticUpdateV2Enabled': %@", v17, 0x20u);

    objc_storeStrong(&v11, 0);
  }
  objc_storeStrong(&v13, 0);
  v5 = -[SUSUIMockedSoftwareUpdateClientManager preferences](v16, "preferences");
  objc_msgSend(v5, "setAutomaticUpdateV2Enabled:", v14);

}

- (BOOL)isAutoInstallPreviousUserSettingsEnabled
{
  id v2;
  const __CFString *v3;
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
  SUSUIMockedSoftwareUpdateClientManager *v17;
  uint8_t v18[40];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v17 = self;
  v16 = a2;
  v10 = -[SUSUIMockedSoftwareUpdateClientManager preferences](self, "preferences");
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
      v3 = CFSTR("YES");
    else
      v3 = CFSTR("NO");
    __os_log_helper_16_2_3_8_64_8_32_8_64((uint64_t)v18, (uint64_t)v2, (uint64_t)"-[SUSUIMockedSoftwareUpdateClientManager isAutoInstallPreviousUserSettingsEnabled]", (uint64_t)v3);
    _os_log_impl(&dword_21BF33000, log, type, "[XCUI correlationId: %@] %s Getting mocked value for SUPreferences key 'previousUserSpecifiedAutomaticUpdateV2Enabled': %@", v18, 0x20u);

    objc_storeStrong(&v12, 0);
  }
  objc_storeStrong(&v14, 0);
  return v15 & 1;
}

- (void)queue_enableAutoInstallPreviousUserSettings:(BOOL)a3
{
  id v3;
  const __CFString *v4;
  id v5;
  NSObject *log;
  os_log_type_t type;
  id v8;
  id v9;
  id v10;
  id v11;
  os_log_type_t v12;
  id v13;
  BOOL v14;
  SEL v15;
  SUSUIMockedSoftwareUpdateClientManager *v16;
  uint8_t v17[40];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v16 = self;
  v15 = a2;
  v14 = a3;
  v13 = _SUSUIInternalLoggingFacility();
  v12 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
  {
    log = v13;
    type = v12;
    v10 = +[SUSUITestAutomationManager sharedManager](SUSUITestAutomationManager, "sharedManager");
    v9 = (id)objc_msgSend(v10, "currentSession");
    v8 = (id)objc_msgSend(v9, "correlationId");
    v3 = v8;
    v11 = v3;
    if (v14)
      v4 = CFSTR("YES");
    else
      v4 = CFSTR("NO");
    __os_log_helper_16_2_3_8_64_8_32_8_64((uint64_t)v17, (uint64_t)v3, (uint64_t)"-[SUSUIMockedSoftwareUpdateClientManager queue_enableAutoInstallPreviousUserSettings:]", (uint64_t)v4);
    _os_log_impl(&dword_21BF33000, log, type, "[XCUI correlationId: %@] %s Setting mocked value for SUPreferences setter 'setPreviousUserSpecifiedAutomaticUpdateV2Enabled': %@", v17, 0x20u);

    objc_storeStrong(&v11, 0);
  }
  objc_storeStrong(&v13, 0);
  v5 = -[SUSUIMockedSoftwareUpdateClientManager preferences](v16, "preferences");
  objc_msgSend(v5, "setPreviousUserSpecifiedAutomaticUpdateV2Enabled:", v14);

}

- (BOOL)isSecurityResponseEnabled
{
  id v2;
  const __CFString *v3;
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
  SUSUIMockedSoftwareUpdateClientManager *v17;
  uint8_t v18[40];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v17 = self;
  v16 = a2;
  v10 = -[SUSUIMockedSoftwareUpdateClientManager preferences](self, "preferences");
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
      v3 = CFSTR("YES");
    else
      v3 = CFSTR("NO");
    __os_log_helper_16_2_3_8_64_8_32_8_64((uint64_t)v18, (uint64_t)v2, (uint64_t)"-[SUSUIMockedSoftwareUpdateClientManager isSecurityResponseEnabled]", (uint64_t)v3);
    _os_log_impl(&dword_21BF33000, log, type, "[XCUI correlationId: %@] %s Getting mocked value for SUPreferences key 'autoInstallSecurityResponse': %@", v18, 0x20u);

    objc_storeStrong(&v12, 0);
  }
  objc_storeStrong(&v14, 0);
  return v15 & 1;
}

- (void)queue_setSecurityResponseEnabled:(BOOL)a3
{
  id v3;
  const __CFString *v4;
  id v5;
  NSObject *log;
  os_log_type_t type;
  id v8;
  id v9;
  id v10;
  id v11;
  os_log_type_t v12;
  id v13;
  BOOL v14;
  SEL v15;
  SUSUIMockedSoftwareUpdateClientManager *v16;
  uint8_t v17[40];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v16 = self;
  v15 = a2;
  v14 = a3;
  v13 = _SUSUIInternalLoggingFacility();
  v12 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
  {
    log = v13;
    type = v12;
    v10 = +[SUSUITestAutomationManager sharedManager](SUSUITestAutomationManager, "sharedManager");
    v9 = (id)objc_msgSend(v10, "currentSession");
    v8 = (id)objc_msgSend(v9, "correlationId");
    v3 = v8;
    v11 = v3;
    if (v14)
      v4 = CFSTR("YES");
    else
      v4 = CFSTR("NO");
    __os_log_helper_16_2_3_8_64_8_32_8_64((uint64_t)v17, (uint64_t)v3, (uint64_t)"-[SUSUIMockedSoftwareUpdateClientManager queue_setSecurityResponseEnabled:]", (uint64_t)v4);
    _os_log_impl(&dword_21BF33000, log, type, "[XCUI correlationId: %@] %s Setting mocked value for SUPreferences setter 'setAutoInstallSecurityResponse': %@", v17, 0x20u);

    objc_storeStrong(&v11, 0);
  }
  objc_storeStrong(&v13, 0);
  v5 = -[SUSUIMockedSoftwareUpdateClientManager preferences](v16, "preferences");
  objc_msgSend(v5, "setAutoInstallSecurityResponse:", v14);

}

- (BOOL)previousUserSpecifiedSecurityResponseEnabled
{
  id v2;
  const __CFString *v3;
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
  SUSUIMockedSoftwareUpdateClientManager *v17;
  uint8_t v18[40];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v17 = self;
  v16 = a2;
  v10 = -[SUSUIMockedSoftwareUpdateClientManager preferences](self, "preferences");
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
      v3 = CFSTR("YES");
    else
      v3 = CFSTR("NO");
    __os_log_helper_16_2_3_8_64_8_32_8_64((uint64_t)v18, (uint64_t)v2, (uint64_t)"-[SUSUIMockedSoftwareUpdateClientManager previousUserSpecifiedSecurityResponseEnabled]", (uint64_t)v3);
    _os_log_impl(&dword_21BF33000, log, type, "[XCUI correlationId: %@] %s Getting mocked value for SUPreferences key 'previousUserSpecifiedAutoInstallSecurityResponse': %@", v18, 0x20u);

    objc_storeStrong(&v12, 0);
  }
  objc_storeStrong(&v14, 0);
  return v15 & 1;
}

- (void)queue_setPreviousUserSpecifiedSecurityResponseStatus:(BOOL)a3
{
  id v3;
  const __CFString *v4;
  id v5;
  NSObject *log;
  os_log_type_t type;
  id v8;
  id v9;
  id v10;
  id v11;
  os_log_type_t v12;
  id v13;
  BOOL v14;
  SEL v15;
  SUSUIMockedSoftwareUpdateClientManager *v16;
  uint8_t v17[40];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v16 = self;
  v15 = a2;
  v14 = a3;
  v13 = _SUSUIInternalLoggingFacility();
  v12 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
  {
    log = v13;
    type = v12;
    v10 = +[SUSUITestAutomationManager sharedManager](SUSUITestAutomationManager, "sharedManager");
    v9 = (id)objc_msgSend(v10, "currentSession");
    v8 = (id)objc_msgSend(v9, "correlationId");
    v3 = v8;
    v11 = v3;
    if (v14)
      v4 = CFSTR("YES");
    else
      v4 = CFSTR("NO");
    __os_log_helper_16_2_3_8_64_8_32_8_64((uint64_t)v17, (uint64_t)v3, (uint64_t)"-[SUSUIMockedSoftwareUpdateClientManager queue_setPreviousUserSpecifiedSecurityResponseStatus:]", (uint64_t)v4);
    _os_log_impl(&dword_21BF33000, log, type, "[XCUI correlationId: %@] %s Setting mocked value for SUPreferences setter 'setPreviousUserSpecifiedAutoInstallSecurityResponse': %@", v17, 0x20u);

    objc_storeStrong(&v11, 0);
  }
  objc_storeStrong(&v13, 0);
  v5 = -[SUSUIMockedSoftwareUpdateClientManager preferences](v16, "preferences");
  objc_msgSend(v5, "setPreviousUserSpecifiedAutoInstallSecurityResponse:", v14);

}

- (BOOL)isAutomaticInstallSystemDataFilesEnabled
{
  id v2;
  const __CFString *v3;
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
  SUSUIMockedSoftwareUpdateClientManager *v17;
  uint8_t v18[40];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v17 = self;
  v16 = a2;
  v10 = -[SUSUIMockedSoftwareUpdateClientManager preferences](self, "preferences");
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
      v3 = CFSTR("YES");
    else
      v3 = CFSTR("NO");
    __os_log_helper_16_2_3_8_64_8_32_8_64((uint64_t)v18, (uint64_t)v2, (uint64_t)"-[SUSUIMockedSoftwareUpdateClientManager isAutomaticInstallSystemDataFilesEnabled]", (uint64_t)v3);
    _os_log_impl(&dword_21BF33000, log, type, "[XCUI correlationId: %@] %s Getting mocked value for SUPreferences key 'autoInstallSystemAndDataFiles': %@", v18, 0x20u);

    objc_storeStrong(&v12, 0);
  }
  objc_storeStrong(&v14, 0);
  return v15 & 1;
}

- (void)queue_enableAutomaticInstallSystemDataFiles:(BOOL)a3
{
  id v3;
  const __CFString *v4;
  id v5;
  NSObject *log;
  os_log_type_t type;
  id v8;
  id v9;
  id v10;
  id v11;
  os_log_type_t v12;
  id v13;
  BOOL v14;
  SEL v15;
  SUSUIMockedSoftwareUpdateClientManager *v16;
  uint8_t v17[40];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v16 = self;
  v15 = a2;
  v14 = a3;
  v13 = _SUSUIInternalLoggingFacility();
  v12 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
  {
    log = v13;
    type = v12;
    v10 = +[SUSUITestAutomationManager sharedManager](SUSUITestAutomationManager, "sharedManager");
    v9 = (id)objc_msgSend(v10, "currentSession");
    v8 = (id)objc_msgSend(v9, "correlationId");
    v3 = v8;
    v11 = v3;
    if (v14)
      v4 = CFSTR("YES");
    else
      v4 = CFSTR("NO");
    __os_log_helper_16_2_3_8_64_8_32_8_64((uint64_t)v17, (uint64_t)v3, (uint64_t)"-[SUSUIMockedSoftwareUpdateClientManager queue_enableAutomaticInstallSystemDataFiles:]", (uint64_t)v4);
    _os_log_impl(&dword_21BF33000, log, type, "[XCUI correlationId: %@] %s Setting mocked value for SUPreferences setter 'setAutoInstallSystemAndDataFiles': %@", v17, 0x20u);

    objc_storeStrong(&v11, 0);
  }
  objc_storeStrong(&v13, 0);
  v5 = -[SUSUIMockedSoftwareUpdateClientManager preferences](v16, "preferences");
  objc_msgSend(v5, "setAutoInstallSystemAndDataFiles:", v14);

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

  getSUSMKSoftwareUpdateServicesStrategyBaseClass();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = (id)objc_msgSend(v27[0], "options");
    getSUSMKSoftwareUpdateServicesStrategyOptionsClass();
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
