@implementation MODefaultsManager

- (MODefaultsManager)init
{
  return -[MODefaultsManager initWithUniverse:](self, "initWithUniverse:", 0);
}

- (MODefaultsManager)initWithUniverse:(id)a3
{
  MODefaultsManager *v3;
  uint64_t v4;
  NSUserDefaults *userDefaults;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MODefaultsManager;
  v3 = -[MODefaultsManager init](&v7, sel_init, a3);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v4 = objc_claimAutoreleasedReturnValue();
    userDefaults = v3->_userDefaults;
    v3->_userDefaults = (NSUserDefaults *)v4;

  }
  return v3;
}

- (id)objectForKey:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  if (v4)
  {
    -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    _mo_log_facility_get_os_log(MOLogFacilityDefaults);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[MODefaultsManager objectForKey:].cold.3((uint64_t)v4, (uint64_t)v5, v6);
  }
  else
  {
    _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[MODefaultsManager objectForKey:].cold.2();

    _mo_log_facility_get_os_log(MOLogFacilityDefaults);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[MODefaultsManager objectForKey:].cold.1(v6, v8, v9, v10, v11, v12, v13, v14);
    v5 = 0;
  }

  return v5;
}

- (id)objectForKeyWithoutLog:(id)a3
{
  void *v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (a3)
  {
    -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[MODefaultsManager objectForKeyWithoutLog:].cold.2();

    _mo_log_facility_get_os_log(MOLogFacilityDefaults);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[MODefaultsManager objectForKeyWithoutLog:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);

    v3 = 0;
  }
  return v3;
}

- (void)deleteObjectForKey:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    _mo_log_facility_get_os_log(MOLogFacilityDefaults);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7 = 136315394;
      v8 = "-[MODefaultsManager deleteObjectForKey:]";
      v9 = 2112;
      v10 = v4;
      _os_log_impl(&dword_243AAA000, v5, OS_LOG_TYPE_INFO, "%s, deleting key, %@", (uint8_t *)&v7, 0x16u);
    }

    -[NSUserDefaults removeObjectForKey:](self->_userDefaults, "removeObjectForKey:", v4);
  }
  else
  {
    _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[MODefaultsManager deleteObjectForKey:].cold.1();

  }
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    _mo_log_facility_get_os_log(MOLogFacilityDefaults);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v10 = 136315650;
      v11 = "-[MODefaultsManager setObject:forKey:]";
      v12 = 2112;
      v13 = v7;
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_243AAA000, v8, OS_LOG_TYPE_INFO, "%s, key, %@, value, %@", (uint8_t *)&v10, 0x20u);
    }

    -[NSUserDefaults setObject:forKey:](self->_userDefaults, "setObject:forKey:", v6, v7);
  }
  else
  {
    _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[MODefaultsManager setObject:forKey:].cold.1();

  }
}

- (void)setObjectWithoutLog:(id)a3 forKey:(id)a4
{
  NSObject *v4;

  if (a4)
  {
    -[NSUserDefaults setObject:forKey:](self->_userDefaults, "setObject:forKey:", a3);
  }
  else
  {
    _mo_log_facility_get_os_log(MOLogFacilityGeneral);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[MODefaultsManager setObjectWithoutLog:forKey:].cold.1();

  }
}

- (MODefaultsManager)initWithSuiteName:(id)a3
{
  id v4;
  MODefaultsManager *v5;
  uint64_t v6;
  NSUserDefaults *userDefaults;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MODefaultsManager;
  v5 = -[MODefaultsManager init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", v4);
    userDefaults = v5->_userDefaults;
    v5->_userDefaults = (NSUserDefaults *)v6;

  }
  return v5;
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

- (void)objectForKey:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_243AAA000, a1, a3, "%s, key cannot be nil!", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)objectForKey:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_243AAA000, v0, v1, "Invalid parameter not satisfying: key (in %s:%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)objectForKey:(os_log_t)log .cold.3(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 136315650;
  v4 = "-[MODefaultsManager objectForKey:]";
  v5 = 2112;
  v6 = a1;
  v7 = 2112;
  v8 = a2;
  _os_log_debug_impl(&dword_243AAA000, log, OS_LOG_TYPE_DEBUG, "%s, key, %@, value, %@", (uint8_t *)&v3, 0x20u);
}

- (void)objectForKeyWithoutLog:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_243AAA000, a1, a3, "%s, key cannot be nil!", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)objectForKeyWithoutLog:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_243AAA000, v0, v1, "Invalid parameter not satisfying: key (in %s:%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)deleteObjectForKey:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_243AAA000, v0, v1, "Invalid parameter not satisfying: key (in %s:%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setObject:forKey:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_243AAA000, v0, v1, "Invalid parameter not satisfying: key (in %s:%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)setObjectWithoutLog:forKey:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_243AAA000, v0, v1, "Invalid parameter not satisfying: key (in %s:%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
