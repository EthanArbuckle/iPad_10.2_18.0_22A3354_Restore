@implementation RTXPCActivityCriteria

+ (const)convertPriority:(unint64_t)a3
{
  const char **v4;
  NSObject *v6;
  int v7;
  unint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (a3 == 2)
    {
      v4 = (const char **)MEMORY[0x1E0C80888];
      return *v4;
    }
    if (a3 == 1)
    {
      v4 = (const char **)MEMORY[0x1E0C80880];
      return *v4;
    }
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 134218498;
      v8 = a3;
      v9 = 2080;
      v10 = "+[RTXPCActivityCriteria convertPriority:]";
      v11 = 1024;
      v12 = 81;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "unsupported priority, %lu (in %s:%d)", (uint8_t *)&v7, 0x1Cu);
    }

  }
  return 0;
}

+ (const)convertNetworkTransferDirection:(unint64_t)a3
{
  const char *result;
  const char **v5;
  NSObject *v6;
  int v7;
  unint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  result = 0;
  switch(a3)
  {
    case 0uLL:
      return result;
    case 1uLL:
      v5 = (const char **)MEMORY[0x1E0C80858];
      goto LABEL_8;
    case 2uLL:
      v5 = (const char **)MEMORY[0x1E0C80818];
      goto LABEL_8;
    case 3uLL:
      v5 = (const char **)MEMORY[0x1E0C80820];
LABEL_8:
      result = *v5;
      break;
    default:
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7 = 134218498;
        v8 = a3;
        v9 = 2080;
        v10 = "+[RTXPCActivityCriteria convertNetworkTransferDirection:]";
        v11 = 1024;
        v12 = 101;
        _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "unsupported network transfer direction, %lu (in %s:%d)", (uint8_t *)&v7, 0x1Cu);
      }

      result = 0;
      break;
  }
  return result;
}

- (RTXPCActivityCriteria)init
{
  return -[RTXPCActivityCriteria initWithInterval:gracePeriod:priority:requireNetworkConnectivity:requireInexpensiveNetworkConnectivity:networkTransferDirection:allowBattery:powerNap:](self, "initWithInterval:gracePeriod:priority:requireNetworkConnectivity:requireInexpensiveNetworkConnectivity:networkTransferDirection:allowBattery:powerNap:", 1, 0, 0, 0, 0, 0, 1.79769313e308, 1.79769313e308);
}

- (RTXPCActivityCriteria)initWithInterval:(double)a3 gracePeriod:(double)a4 priority:(unint64_t)a5 requireNetworkConnectivity:(BOOL)a6 requireInexpensiveNetworkConnectivity:(BOOL)a7 networkTransferDirection:(unint64_t)a8 allowBattery:(BOOL)a9 powerNap:(BOOL)a10 delay:(double)a11
{
  _BOOL8 v13;
  _BOOL8 v15;
  _BOOL8 v16;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v25;
  uint8_t buf[4];
  int v27;
  uint64_t v28;

  v13 = a9;
  v15 = a7;
  v16 = a6;
  v28 = *MEMORY[0x1E0C80C00];
  if (a8 >= 4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityXPCActivity);
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 67109120;
      v27 = a8;
      _os_log_fault_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_FAULT, "receive unexpected network transfer direction when initializing criteria, %d", buf, 8u);
    }

    v21 = 0;
    v22 = 0;
  }
  else
  {
    v21 = qword_1D1EED520[a8];
    v22 = qword_1D1EED540[a8];
  }
  LOBYTE(v25) = a10;
  return -[RTXPCActivityCriteria initWithInterval:gracePeriod:priority:requireNetworkConnectivity:requireInexpensiveNetworkConnectivity:networkTransferUploadSize:networkTransferDownloadSize:allowBattery:powerNap:delay:requireBatteryLevel:](self, "initWithInterval:gracePeriod:priority:requireNetworkConnectivity:requireInexpensiveNetworkConnectivity:networkTransferUploadSize:networkTransferDownloadSize:allowBattery:powerNap:delay:requireBatteryLevel:", a5, v16, v15, v21, v22, v13, a3, a4, a11, v25, 0);
}

- (RTXPCActivityCriteria)initWithInterval:(double)a3 gracePeriod:(double)a4 priority:(unint64_t)a5 requireNetworkConnectivity:(BOOL)a6 requireInexpensiveNetworkConnectivity:(BOOL)a7 networkTransferDirection:(unint64_t)a8 allowBattery:(BOOL)a9 powerNap:(BOOL)a10
{
  return -[RTXPCActivityCriteria initWithInterval:gracePeriod:priority:requireNetworkConnectivity:requireInexpensiveNetworkConnectivity:networkTransferDirection:allowBattery:powerNap:delay:](self, "initWithInterval:gracePeriod:priority:requireNetworkConnectivity:requireInexpensiveNetworkConnectivity:networkTransferDirection:allowBattery:powerNap:delay:", a5, a6, a7, a8, a9, a10);
}

- (RTXPCActivityCriteria)initWithInterval:(double)a3 gracePeriod:(double)a4 priority:(unint64_t)a5 requireNetworkConnectivity:(BOOL)a6 requireInexpensiveNetworkConnectivity:(BOOL)a7 networkTransferUploadSize:(unint64_t)a8 networkTransferDownloadSize:(unint64_t)a9 allowBattery:(BOOL)a10 powerNap:(BOOL)a11 delay:(double)a12 requireBatteryLevel:(id)a13
{
  id v23;
  NSObject *v24;
  const char *v25;
  RTXPCActivityCriteria *v26;
  RTXPCActivityCriteria *v28;
  RTXPCActivityCriteria *v29;
  objc_super v30;
  uint8_t buf[16];

  v23 = a13;
  if (a3 < 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v25 = "Invalid parameter not satisfying: interval >= 0";
LABEL_10:
      _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, v25, buf, 2u);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  if (a4 < 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v25 = "Invalid parameter not satisfying: gracePeriod >= 0";
      goto LABEL_10;
    }
LABEL_11:

    v26 = 0;
    goto LABEL_12;
  }
  if (a12 < 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v25 = "Invalid parameter not satisfying: delay >= 0";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  v30.receiver = self;
  v30.super_class = (Class)RTXPCActivityCriteria;
  v28 = -[RTXPCActivityCriteria init](&v30, sel_init);
  v29 = v28;
  if (v28)
  {
    v28->_interval = a3;
    v28->_delay = a12;
    v28->_gracePeriod = a4;
    v28->_priority = a5;
    v28->_requireNetworkConnectivity = a6;
    v28->_requireInexpensiveNetworkConnectivity = a7;
    v28->_networkTransferUploadSize = a8;
    v28->_networkTransferDownloadSize = a9;
    v28->_allowBattery = a10;
    v28->_powerNap = a11;
    v28->_expectedDuration = NAN;
    *(_DWORD *)&v28->_cpuIntensive = 0;
    objc_storeStrong((id *)&v28->_requireBatteryLevel, a13);
  }
  self = v29;
  v26 = self;
LABEL_12:

  return v26;
}

- (id)description
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  const __CFString *v10;
  uint64_t v11;
  const __CFString *v12;
  const __CFString *v13;
  uint64_t v14;
  uint64_t v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  void *v23;
  const __CFString *v25;
  const __CFString *v26;
  uint64_t v27;
  void *v28;

  v28 = (void *)MEMORY[0x1E0CB3940];
  -[RTXPCActivityCriteria interval](self, "interval");
  v4 = v3;
  -[RTXPCActivityCriteria delay](self, "delay");
  v6 = v5;
  -[RTXPCActivityCriteria gracePeriod](self, "gracePeriod");
  v8 = v7;
  v27 = objc_msgSend((id)objc_opt_class(), "convertPriority:", -[RTXPCActivityCriteria priority](self, "priority"));
  if (-[RTXPCActivityCriteria requireNetworkConnectivity](self, "requireNetworkConnectivity"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  v26 = v9;
  if (-[RTXPCActivityCriteria requireInexpensiveNetworkConnectivity](self, "requireInexpensiveNetworkConnectivity"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  v25 = v10;
  v11 = objc_msgSend((id)objc_opt_class(), "convertNetworkTransferDirection:", -[RTXPCActivityCriteria networkTransferDirection](self, "networkTransferDirection"));
  if (-[RTXPCActivityCriteria allowBattery](self, "allowBattery"))
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  if (-[RTXPCActivityCriteria powerNap](self, "powerNap"))
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  -[RTXPCActivityCriteria expectedDuration](self, "expectedDuration");
  v15 = v14;
  if (-[RTXPCActivityCriteria cpuIntensive](self, "cpuIntensive"))
    v16 = CFSTR("YES");
  else
    v16 = CFSTR("NO");
  if (-[RTXPCActivityCriteria userRequestedBackgroundTask](self, "userRequestedBackgroundTask"))
    v17 = CFSTR("YES");
  else
    v17 = CFSTR("NO");
  if (-[RTXPCActivityCriteria postInstall](self, "postInstall"))
    v18 = CFSTR("YES");
  else
    v18 = CFSTR("NO");
  if (-[RTXPCActivityCriteria requiresBuddyComplete](self, "requiresBuddyComplete"))
    v19 = CFSTR("YES");
  else
    v19 = CFSTR("NO");
  v20 = -[RTXPCActivityCriteria networkTransferUploadSize](self, "networkTransferUploadSize");
  v21 = -[RTXPCActivityCriteria networkTransferDownloadSize](self, "networkTransferDownloadSize");
  -[RTXPCActivityCriteria requireBatteryLevel](self, "requireBatteryLevel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "stringWithFormat:", CFSTR("interval, %.2f, delay, %.2f, gracePeriod, %.2f, priority, %s, requireNetworkConnectivity, %@, requireInexpensiveNetworkConnectivity, %@, networkTransferDirection, %s, allowBattery, %@, powerNap, %@, expectedDuration, %.2f, cpuIntensive, %@, userRequestedBackgroundTask, %@, postInstall, %@, requiresBuddyComplete, %@, uploadSize, %d, downloadSize, %d, requireBatteryLevel, %@"), v4, v6, v8, v27, v26, v25, v11, v12, v13, v15, v16, v17, v18, v19, v20, v21,
    v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  unint64_t v14;
  int v15;
  int v16;
  unint64_t v17;
  int v18;
  int v19;
  double v20;
  double v21;
  double v22;
  int v23;
  int v24;
  int v25;
  int v26;
  unint64_t v27;
  unint64_t v28;
  void *v29;
  void *v30;
  BOOL v31;

  v4 = a3;
  -[RTXPCActivityCriteria interval](self, "interval");
  v6 = v5;
  objc_msgSend(v4, "interval");
  if (v6 != v7)
    goto LABEL_18;
  -[RTXPCActivityCriteria delay](self, "delay");
  v9 = v8;
  objc_msgSend(v4, "delay");
  if (v9 != v10)
    goto LABEL_18;
  -[RTXPCActivityCriteria gracePeriod](self, "gracePeriod");
  v12 = v11;
  objc_msgSend(v4, "gracePeriod");
  if (v12 != v13)
    goto LABEL_18;
  v14 = -[RTXPCActivityCriteria priority](self, "priority");
  if (v14 != objc_msgSend(v4, "priority"))
    goto LABEL_18;
  v15 = -[RTXPCActivityCriteria requireNetworkConnectivity](self, "requireNetworkConnectivity");
  if (v15 != objc_msgSend(v4, "requireNetworkConnectivity"))
    goto LABEL_18;
  v16 = -[RTXPCActivityCriteria requireInexpensiveNetworkConnectivity](self, "requireInexpensiveNetworkConnectivity");
  if (v16 != objc_msgSend(v4, "requireInexpensiveNetworkConnectivity"))
    goto LABEL_18;
  v17 = -[RTXPCActivityCriteria networkTransferDirection](self, "networkTransferDirection");
  if (v17 != objc_msgSend(v4, "networkTransferDirection"))
    goto LABEL_18;
  v18 = -[RTXPCActivityCriteria allowBattery](self, "allowBattery");
  if (v18 != objc_msgSend(v4, "allowBattery"))
    goto LABEL_18;
  v19 = -[RTXPCActivityCriteria powerNap](self, "powerNap");
  if (v19 != objc_msgSend(v4, "powerNap"))
    goto LABEL_18;
  -[RTXPCActivityCriteria expectedDuration](self, "expectedDuration");
  v21 = v20;
  objc_msgSend(v4, "expectedDuration");
  if (v21 != v22)
    goto LABEL_18;
  v23 = -[RTXPCActivityCriteria cpuIntensive](self, "cpuIntensive");
  if (v23 == objc_msgSend(v4, "cpuIntensive")
    && (v24 = -[RTXPCActivityCriteria userRequestedBackgroundTask](self, "userRequestedBackgroundTask"),
        v24 == objc_msgSend(v4, "userRequestedBackgroundTask"))
    && (v25 = -[RTXPCActivityCriteria postInstall](self, "postInstall"),
        v25 == objc_msgSend(v4, "postInstall"))
    && (v26 = -[RTXPCActivityCriteria requiresBuddyComplete](self, "requiresBuddyComplete"),
        v26 == objc_msgSend(v4, "requiresBuddyComplete"))
    && (v27 = -[RTXPCActivityCriteria networkTransferUploadSize](self, "networkTransferUploadSize"),
        v27 == objc_msgSend(v4, "networkTransferUploadSize"))
    && (v28 = -[RTXPCActivityCriteria networkTransferDownloadSize](self, "networkTransferDownloadSize"),
        v28 == objc_msgSend(v4, "networkTransferDownloadSize")))
  {
    -[RTXPCActivityCriteria requireBatteryLevel](self, "requireBatteryLevel");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "requireBatteryLevel");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v29 == v30;

  }
  else
  {
LABEL_18:
    v31 = 0;
  }

  return v31;
}

- (double)interval
{
  return self->_interval;
}

- (double)delay
{
  return self->_delay;
}

- (double)gracePeriod
{
  return self->_gracePeriod;
}

- (unint64_t)priority
{
  return self->_priority;
}

- (BOOL)requireNetworkConnectivity
{
  return self->_requireNetworkConnectivity;
}

- (BOOL)requireInexpensiveNetworkConnectivity
{
  return self->_requireInexpensiveNetworkConnectivity;
}

- (unint64_t)networkTransferDirection
{
  return self->_networkTransferDirection;
}

- (BOOL)allowBattery
{
  return self->_allowBattery;
}

- (BOOL)powerNap
{
  return self->_powerNap;
}

- (unint64_t)networkTransferUploadSize
{
  return self->_networkTransferUploadSize;
}

- (unint64_t)networkTransferDownloadSize
{
  return self->_networkTransferDownloadSize;
}

- (NSNumber)requireBatteryLevel
{
  return self->_requireBatteryLevel;
}

- (double)expectedDuration
{
  return self->_expectedDuration;
}

- (void)setExpectedDuration:(double)a3
{
  self->_expectedDuration = a3;
}

- (BOOL)cpuIntensive
{
  return self->_cpuIntensive;
}

- (void)setCpuIntensive:(BOOL)a3
{
  self->_cpuIntensive = a3;
}

- (BOOL)userRequestedBackgroundTask
{
  return self->_userRequestedBackgroundTask;
}

- (void)setUserRequestedBackgroundTask:(BOOL)a3
{
  self->_userRequestedBackgroundTask = a3;
}

- (BOOL)postInstall
{
  return self->_postInstall;
}

- (void)setPostInstall:(BOOL)a3
{
  self->_postInstall = a3;
}

- (BOOL)requiresBuddyComplete
{
  return self->_requiresBuddyComplete;
}

- (void)setRequiresBuddyComplete:(BOOL)a3
{
  self->_requiresBuddyComplete = a3;
}

- (NSMutableDictionary)additionalCriteria
{
  return self->_additionalCriteria;
}

- (void)setAdditionalCriteria:(id)a3
{
  objc_storeStrong((id *)&self->_additionalCriteria, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalCriteria, 0);
  objc_storeStrong((id *)&self->_requireBatteryLevel, 0);
}

@end
