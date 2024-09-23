@implementation POConfigurationVersion

- (POConfigurationVersion)initWithConfigurationType:(int64_t)a3
{
  NSObject *v5;
  POConfigurationVersion *v6;
  POConfigurationVersion *v7;
  id v8;
  uint32_t v9;
  NSObject *v10;
  objc_super v12;

  PO_LOG_POConfigurationVersion();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[POConfigurationVersion initWithConfigurationType:].cold.2((uint64_t)self, v5);

  v12.receiver = self;
  v12.super_class = (Class)POConfigurationVersion;
  v6 = -[POConfigurationVersion init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_token = -1;
    v6->_version = 0;
    v6->_type = a3;
    +[POConfigurationVersion notificationForType:](POConfigurationVersion, "notificationForType:", a3);
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v9 = notify_register_check((const char *)objc_msgSend(v8, "UTF8String"), &v7->_token);

    if (v9)
    {
      PO_LOG_POConfigurationVersion();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[POConfigurationVersion initWithConfigurationType:].cold.1();

    }
  }
  return v7;
}

- (void)dealloc
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_2(&dword_24440D000, v0, v1, "notify_cancel() failed with %u", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (int64_t)checkVersion
{
  POConfigurationVersion *v2;
  uint64_t v3;
  unint64_t v4;
  int64_t v5;
  NSObject *v6;
  unint64_t version;
  int v9;
  const char *v10;
  __int16 v11;
  unint64_t v12;
  __int16 v13;
  unint64_t v14;
  __int16 v15;
  POConfigurationVersion *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  objc_sync_enter(v2);
  v3 = -[POConfigurationVersion _state](v2, "_state");
  v4 = v3;
  if (v3 == -1)
  {
    v2->_version = -1;
    v5 = 2;
  }
  else
  {
    if (!v3)
    {
      -[POConfigurationVersion increaseVersionWithMessage:](v2, "increaseVersionWithMessage:", CFSTR("first load"));
LABEL_6:
      v5 = 0;
      goto LABEL_10;
    }
    if (v3 == v2->_version)
      goto LABEL_6;
    PO_LOG_POConfigurationVersion();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      version = v2->_version;
      v9 = 136315906;
      v10 = "-[POConfigurationVersion checkVersion]";
      v11 = 2048;
      v12 = version;
      v13 = 2048;
      v14 = v4;
      v15 = 2112;
      v16 = v2;
      _os_log_impl(&dword_24440D000, v6, OS_LOG_TYPE_DEFAULT, "%s config version changed from from 0x%016llX to 0x%016llX on %@", (uint8_t *)&v9, 0x2Au);
    }

    v2->_version = v4;
    v5 = 1;
  }
LABEL_10:
  objc_sync_exit(v2);

  return v5;
}

- (void)increaseVersionWithMessage:(id)a3
{
  id v4;
  POConfigurationVersion *v5;
  void *v6;
  double v7;
  NSObject *v8;
  uint64_t v9;
  unint64_t version;
  int v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  unint64_t v16;
  __int16 v17;
  id v18;
  __int16 v19;
  POConfigurationVersion *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSince1970");
  v5->_version = (unint64_t)(v7 * 1000.0);

  PO_LOG_POConfigurationVersion();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = -[POConfigurationVersion _state](v5, "_state");
    version = v5->_version;
    v11 = 136316162;
    v12 = "-[POConfigurationVersion increaseVersionWithMessage:]";
    v13 = 2048;
    v14 = v9;
    v15 = 2048;
    v16 = version;
    v17 = 2114;
    v18 = v4;
    v19 = 2112;
    v20 = v5;
    _os_log_impl(&dword_24440D000, v8, OS_LOG_TYPE_DEFAULT, "%s config version increased from 0x%016llX to 0x%016llX (%{public}@) on %@", (uint8_t *)&v11, 0x34u);
  }

  -[POConfigurationVersion _setStateAndNotify:type:](v5, "_setStateAndNotify:type:", v5->_version, v5->_type);
  objc_sync_exit(v5);

}

- (void)setPlatformSSOUnavailable
{
  NSObject *v3;
  POConfigurationVersion *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  POConfigurationVersion *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  PO_LOG_POConfigurationVersion();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[POConfigurationVersion setPlatformSSOUnavailable]";
    v8 = 2112;
    v9 = self;
    _os_log_impl(&dword_24440D000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v6, 0x16u);
  }

  v4 = self;
  objc_sync_enter(v4);
  v4->_version = -1;
  PO_LOG_POConfigurationVersion();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v6) = 0;
    _os_log_impl(&dword_24440D000, v5, OS_LOG_TYPE_DEFAULT, "set config version to PlatformSSO unavailable", (uint8_t *)&v6, 2u);
  }

  -[POConfigurationVersion _setStateAndNotify:type:](v4, "_setStateAndNotify:type:", v4->_version, 0);
  -[POConfigurationVersion _setStateAndNotify:type:](v4, "_setStateAndNotify:type:", v4->_version, 1);
  -[POConfigurationVersion _setStateAndNotify:type:](v4, "_setStateAndNotify:type:", v4->_version, 2);
  objc_sync_exit(v4);

}

- (int64_t)version
{
  return self->_version;
}

- (void)reset
{
  POConfigurationVersion *obj;

  obj = self;
  objc_sync_enter(obj);
  -[POConfigurationVersion increaseVersionWithMessage:](obj, "increaseVersionWithMessage:", CFSTR("reset"));
  obj->_version = -1;
  objc_sync_exit(obj);

}

- (unint64_t)_state
{
  int token;
  NSObject *v3;
  uint64_t state64;

  state64 = -1;
  token = self->_token;
  if (token == -1)
  {
    PO_LOG_POConfigurationVersion();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[POConfigurationVersion _state].cold.1(v3);
    goto LABEL_7;
  }
  if (notify_get_state(token, &state64))
  {
    PO_LOG_POConfigurationVersion();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[POConfigurationVersion _state].cold.2();
LABEL_7:

  }
  return state64;
}

- (void)_setStateAndNotify:(unint64_t)a3 type:(int64_t)a4
{
  NSObject *v5;
  id v6;
  uint32_t v7;
  NSObject *v8;

  if (notify_set_state(self->_token, a3))
  {
    PO_LOG_POConfigurationVersion();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[POConfigurationVersion _setStateAndNotify:type:].cold.2();

  }
  +[POConfigurationVersion notificationForType:](POConfigurationVersion, "notificationForType:", a4);
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v7 = notify_post((const char *)objc_msgSend(v6, "UTF8String"));

  if (v7)
  {
    PO_LOG_POConfigurationVersion();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[POConfigurationVersion _setStateAndNotify:type:].cold.1();

  }
}

+ (id)notificationForType:(int64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("/com.apple.PlatformSSO.user.version");
  if (a3 == 1)
    v3 = CFSTR("/com.apple.PlatformSSO.login.version");
  if (a3 == 2)
    return CFSTR("/com.apple.PlatformSSO.device.version");
  else
    return (id)v3;
}

- (void)initWithConfigurationType:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_2(&dword_24440D000, v0, v1, "notify_register_check() failed with %u", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)initWithConfigurationType:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "-[POConfigurationVersion initWithConfigurationType:]";
  v4 = 2112;
  v5 = a1;
  _os_log_debug_impl(&dword_24440D000, a2, OS_LOG_TYPE_DEBUG, "%s  on %@", (uint8_t *)&v2, 0x16u);
}

- (void)_state
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_2(&dword_24440D000, v0, v1, "notify_get_state() failed with error %u", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)_setStateAndNotify:type:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_2(&dword_24440D000, v0, v1, "notify_post() failed with error %u", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

- (void)_setStateAndNotify:type:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_0_2(&dword_24440D000, v0, v1, "notify_set_state() failed with error %u", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_2();
}

@end
