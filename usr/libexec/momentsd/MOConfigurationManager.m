@implementation MOConfigurationManager

- (MOConfigurationManager)init
{
  return -[MOConfigurationManagerBase initWithDefaultsManager:enableTrialClient:](self, "initWithDefaultsManager:enableTrialClient:", 0, 0);
}

- (MOConfigurationManager)initWithUniverse:(id)a3
{
  id v5;
  uint64_t v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  MOConfigurationManager *v11;
  MOConfigurationManager *v12;
  objc_super v14;

  v5 = a3;
  v7 = (objc_class *)objc_opt_class(MODefaultsManager, v6);
  v8 = NSStringFromClass(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "getService:", v9));

  v14.receiver = self;
  v14.super_class = (Class)MOConfigurationManager;
  v11 = -[MOConfigurationManagerBase initWithDefaultsManager:enableTrialClient:](&v14, "initWithDefaultsManager:enableTrialClient:", v10, 1);
  v12 = v11;
  if (v11)
    objc_storeStrong((id *)&v11->fUniverse, a3);

  return v12;
}

+ (BOOL)getFallbackPermission:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("MOSensedEventCombinedSwitchEvergreen"));
}

+ (id)getSensedEventSettingNameFromResourceType:(unint64_t)a3
{
  id os_log;
  NSObject *v5;

  if (a3 < 0x11)
    return off_1002AD600[a3];
  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    +[MOConfigurationManager getSensedEventSettingNameFromResourceType:].cold.1();

  return 0;
}

+ (id)getSensedEventGroupSettingNameFromResourceType:(unint64_t)a3
{
  id os_log;
  NSObject *v5;

  if (a3 < 0x11)
    return (id)qword_1002AD688[a3];
  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    +[MOConfigurationManager getSensedEventGroupSettingNameFromResourceType:].cold.1();

  return 0;
}

+ (id)getSensedEventSettingNameFromCategory:(unint64_t)a3
{
  id os_log;
  NSObject *v5;

  if (a3 < 0x19)
    return off_1002AD710[a3];
  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    +[MOConfigurationManager getSensedEventSettingNameFromCategory:].cold.1();

  return 0;
}

+ (id)getSensedEventGroupSettingNameFromCategory:(unint64_t)a3
{
  id os_log;
  NSObject *v5;

  if (a3 < 0x19)
    return (id)qword_1002AD7D8[a3];
  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    +[MOConfigurationManager getSensedEventGroupSettingNameFromResourceType:].cold.1();

  return 0;
}

- (BOOL)_isAllowedToPromptEventCategory_prelaunch:(unint64_t)a3
{
  unsigned int v3;
  id os_log;
  NSObject *v5;

  v3 = (a3 < 0x18) & (0xEFE47Eu >> a3);
  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[MOConfigurationManager _isAllowedToPromptEventCategory_prelaunch:].cold.1();

  return v3;
}

- (BOOL)_isAllowedToPromptResourceType_prelaunch:(unint64_t)a3
{
  unsigned int v3;
  id os_log;
  NSObject *v5;

  v3 = (a3 < 0x11) & (0x1FEDCu >> a3);
  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
  v5 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[MOConfigurationManager _isAllowedToPromptResourceType_prelaunch:].cold.1();

  return v3;
}

- (BOOL)_shouldConsiderEventCategory_postlaunch:(unint64_t)a3
{
  MODaemonUniverse *fUniverse;
  objc_class *v5;
  NSString *v6;
  void *v7;
  void *v8;
  id v9;
  BOOL v10;
  id os_log;
  NSObject *v12;

  fUniverse = self->fUniverse;
  v5 = (objc_class *)objc_opt_class(MOOnboardingAndSettingsPersistence, a2);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonUniverse getService:](fUniverse, "getService:", v7));

  v9 = objc_msgSend(v8, "getCollectAndComputeAuthorization");
  v10 = 0;
  switch(a3)
  {
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 0xAuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x13uLL:
    case 0x15uLL:
    case 0x16uLL:
    case 0x17uLL:
    case 0x18uLL:
      v10 = v9 == (id)2;
      break;
    default:
      break;
  }
  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
  v12 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[MOConfigurationManager _shouldConsiderEventCategory_postlaunch:].cold.1();

  return v10;
}

- (BOOL)_isAllowedToPromptEventCategory_postlaunch:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _BOOL8 v9;
  unsigned int v10;
  MODaemonUniverse *fUniverse;
  objc_class *v12;
  NSString *v13;
  void *v14;
  void *v15;

  if (!-[MOConfigurationManager _shouldConsiderEventCategory_postlaunch:](self, "_shouldConsiderEventCategory_postlaunch:"))
  {
    LOBYTE(v10) = 0;
    return v10;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MOConfigurationManager getSensedEventGroupSettingNameFromCategory:](MOConfigurationManager, "getSensedEventGroupSettingNameFromCategory:", a3));
  v6 = objc_claimAutoreleasedReturnValue(+[MOConfigurationManager getSensedEventSettingNameFromCategory:](MOConfigurationManager, "getSensedEventSettingNameFromCategory:", a3));
  v8 = (void *)v6;
  if (!v5)
  {
    v9 = 0;
    if (v6)
      goto LABEL_4;
LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }
  v9 = -[MOConfigurationManagerBase getBoolSettingForKey:withFallback:](self, "getBoolSettingForKey:withFallback:", v5, +[MOConfigurationManager getFallbackPermission:](MOConfigurationManager, "getFallbackPermission:", v5));
  if (!v8)
    goto LABEL_7;
LABEL_4:
  v10 = -[MOConfigurationManagerBase getBoolSettingForKey:withFallback:](self, "getBoolSettingForKey:withFallback:", v8, v9);
LABEL_8:
  if (a3 == 1)
  {
    fUniverse = self->fUniverse;
    v12 = (objc_class *)objc_opt_class(MOOnboardingAndSettingsPersistence, v7);
    v13 = NSStringFromClass(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonUniverse getService:](fUniverse, "getService:", v14));

    v10 &= objc_msgSend(v15, "fetchSignificantLocationEnablementStatus");
  }

  return v10;
}

- (BOOL)_shouldConsiderResourceType_postlaunch:(unint64_t)a3
{
  MODaemonUniverse *fUniverse;
  objc_class *v5;
  NSString *v6;
  void *v7;
  void *v8;
  char *v9;
  BOOL v10;
  id os_log;
  NSObject *v12;

  fUniverse = self->fUniverse;
  v5 = (objc_class *)objc_opt_class(MOOnboardingAndSettingsPersistence, a2);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonUniverse getService:](fUniverse, "getService:", v7));

  v9 = (char *)objc_msgSend(v8, "getCollectAndComputeAuthorization");
  v10 = 0;
  switch(a3)
  {
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 6uLL:
    case 7uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
      v10 = v9 == (char *)2;
      break;
    case 9uLL:
      v10 = (unint64_t)(v9 - 1) < 2;
      break;
    default:
      break;
  }
  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
  v12 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[MOConfigurationManager _shouldConsiderResourceType_postlaunch:].cold.1();

  return v10;
}

- (BOOL)_isAllowedToPromptResourceType_postlaunch:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _BOOL8 v9;
  unsigned int v10;
  MODaemonUniverse *fUniverse;
  objc_class *v12;
  NSString *v13;
  void *v14;
  void *v15;

  if (!-[MOConfigurationManager _shouldConsiderResourceType_postlaunch:](self, "_shouldConsiderResourceType_postlaunch:"))
  {
    LOBYTE(v10) = 0;
    return v10;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MOConfigurationManager getSensedEventGroupSettingNameFromResourceType:](MOConfigurationManager, "getSensedEventGroupSettingNameFromResourceType:", a3));
  v6 = objc_claimAutoreleasedReturnValue(+[MOConfigurationManager getSensedEventSettingNameFromResourceType:](MOConfigurationManager, "getSensedEventSettingNameFromResourceType:", a3));
  v8 = (void *)v6;
  if (v5)
  {
    v9 = -[MOConfigurationManagerBase getBoolSettingForKey:withFallback:](self, "getBoolSettingForKey:withFallback:", v5, +[MOConfigurationManager getFallbackPermission:](MOConfigurationManager, "getFallbackPermission:", v5));
    if (v8)
    {
LABEL_4:
      v10 = -[MOConfigurationManagerBase getBoolSettingForKey:withFallback:](self, "getBoolSettingForKey:withFallback:", v8, v9);
      goto LABEL_8;
    }
  }
  else
  {
    v9 = 0;
    if (v6)
      goto LABEL_4;
  }
  v10 = 0;
LABEL_8:
  if (a3 <= 0xE && ((1 << a3) & 0x5040) != 0)
  {
    fUniverse = self->fUniverse;
    v12 = (objc_class *)objc_opt_class(MOOnboardingAndSettingsPersistence, v7);
    v13 = NSStringFromClass(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonUniverse getService:](fUniverse, "getService:", v14));

    v10 &= objc_msgSend(v15, "fetchSignificantLocationEnablementStatus");
  }

  return v10;
}

- (BOOL)isAllowedToProcessEventCategory:(unint64_t)a3
{
  MODaemonUniverse *fUniverse;
  objc_class *v5;
  NSString *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  id os_log;
  NSObject *v11;

  fUniverse = self->fUniverse;
  v5 = (objc_class *)objc_opt_class(MOOnboardingAndSettingsPersistence, a2);
  v6 = NSStringFromClass(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MODaemonUniverse getService:](fUniverse, "getService:", v7));

  v9 = 0;
  switch(a3)
  {
    case 1uLL:
      v9 = objc_msgSend(v8, "fetchSignificantLocationEnablementStatus");
      break;
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 0xAuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x13uLL:
    case 0x15uLL:
    case 0x16uLL:
    case 0x17uLL:
    case 0x18uLL:
      v9 = 1;
      break;
    default:
      break;
  }
  os_log = _mo_log_facility_get_os_log(&MOLogFacilitySettings);
  v11 = objc_claimAutoreleasedReturnValue(os_log);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[MOConfigurationManager isAllowedToProcessEventCategory:].cold.1();

  return v9;
}

- (MODaemonUniverse)fUniverse
{
  return (MODaemonUniverse *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFUniverse:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->fUniverse, 0);
}

+ (void)getSensedEventSettingNameFromResourceType:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_7();
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:"));
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3((void *)&_mh_execute_header, v1, v2, "Resource type %@ is not implemented", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

+ (void)getSensedEventGroupSettingNameFromResourceType:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_7();
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:"));
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3((void *)&_mh_execute_header, v1, v2, "Category %@ is not implemented", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

+ (void)getSensedEventSettingNameFromCategory:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_7();
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:"));
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3((void *)&_mh_execute_header, v1, v2, "Event category %@ is not implemented", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_5();
}

- (void)_isAllowedToPromptEventCategory_prelaunch:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4();
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:"));
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1((void *)&_mh_execute_header, v1, v2, "isAllowedToPromptEventCategory %@ is %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2_0();
}

- (void)_isAllowedToPromptResourceType_prelaunch:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4();
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:"));
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1((void *)&_mh_execute_header, v1, v2, "isAllowedToPromptResourceType %@ is %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2_0();
}

- (void)_shouldConsiderEventCategory_postlaunch:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4();
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:"));
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1((void *)&_mh_execute_header, v1, v2, "shouldConsiderEventCategory %@ is %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2_0();
}

- (void)_shouldConsiderResourceType_postlaunch:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4();
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:"));
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1((void *)&_mh_execute_header, v1, v2, "shouldConsiderResourceType %@ is %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2_0();
}

- (void)isAllowedToProcessEventCategory:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_4();
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:"));
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1((void *)&_mh_execute_header, v1, v2, "isAllowedToProcessEventCategory %@ is %@", v3, v4, v5, v6, v7);

  OUTLINED_FUNCTION_2_0();
}

@end
