@implementation CLHeleDevice

- (id)createSetNearOwnerTimeoutTaskInSeconds:(unsigned __int16)a3
{
  uint64_t v3;
  NSObject *v4;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;

  v3 = a3;
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC3C0);
  v4 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289026;
    v6[1] = 0;
    v7 = 2082;
    v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hele creating SetNearOwnerTimeoutTask\"}", (uint8_t *)v6, 0x12u);
  }
  return +[CLDurianTask setNearbyTimeoutHawkeyeTaskWithTimeout:asHele:](CLDurianTask, "setNearbyTimeoutHawkeyeTaskWithTimeout:asHele:", v3, 1);
}

- (id)createFetchTxPowerTaskAsOwner:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v4;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;

  v3 = a3;
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC3C0);
  v4 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289026;
    v6[1] = 0;
    v7 = 2082;
    v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hele creating FetchTxPowerTask\"}", (uint8_t *)v6, 0x12u);
  }
  if (v3)
    return +[CLDurianTask fetchTxPowerTask](CLDurianTask, "fetchTxPowerTask");
  else
    return +[CLDurianTask fetchNonOwnerTxPowerTask](CLDurianTask, "fetchNonOwnerTxPowerTask");
}

- (id)createFetchAISProductDataTask
{
  NSObject *v2;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC3C0);
  v2 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hele creating FetchAISProductDataTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask fetchNonOwnerProductDataTask](CLDurianTask, "fetchNonOwnerProductDataTask");
}

- (id)createFetchAISManufacturerNameTask
{
  NSObject *v2;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC3C0);
  v2 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hele creating FetchAISManufacturerNameTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask fetchNonOwnerManufacturerNameTask](CLDurianTask, "fetchNonOwnerManufacturerNameTask");
}

- (id)createFetchAISModelNameTask
{
  NSObject *v2;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC3C0);
  v2 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hele creating FetchAISModelNameTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask fetchNonOwnerModelNameTask](CLDurianTask, "fetchNonOwnerModelNameTask");
}

- (id)createFetchAISAccessoryCategoryTask
{
  NSObject *v2;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC3C0);
  v2 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hele creating FetchAISAccessoryCategoryTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask fetchNonOwnerAccessoryCategoryTask](CLDurianTask, "fetchNonOwnerAccessoryCategoryTask");
}

- (id)createFetchAISAccessoryCapabilitiesTask
{
  NSObject *v2;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC3C0);
  v2 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hele creating FetchAISAccessoryCapabilitiesTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask fetchNonOwnerAccessoryCapabilitiesTask](CLDurianTask, "fetchNonOwnerAccessoryCapabilitiesTask");
}

- (id)createFetchAISFirmwareVersionTask
{
  NSObject *v2;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC3C0);
  v2 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hele creating FetchAISFirmwareVersionTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask fetchNonOwnerFirmwareVersionTask](CLDurianTask, "fetchNonOwnerFirmwareVersionTask");
}

- (id)createFetchAISFindMyVersionTask
{
  NSObject *v2;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC3C0);
  v2 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hele creating FetchAISFindMyVersionTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask fetchNonOwnerFindMyVersionTask](CLDurianTask, "fetchNonOwnerFindMyVersionTask");
}

- (id)createFetchAISBatteryTypeTask
{
  NSObject *v2;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC3C0);
  v2 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hele creating FetchAISBatteryTypeTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask fetchBatteryTypeGATTTask](CLDurianTask, "fetchBatteryTypeGATTTask");
}

@end
