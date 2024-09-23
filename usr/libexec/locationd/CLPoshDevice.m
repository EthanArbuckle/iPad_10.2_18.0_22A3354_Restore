@implementation CLPoshDevice

- (id)createPlayUnauthorizedSoundTaskWithSequence:(id)a3
{
  unsigned int v5;
  char *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  unsigned int v11;
  NSObject *v12;
  NSObject *v13;
  int v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  unsigned int v22;

  v5 = +[CLDurianSettings forcePoshAirPods](CLDurianSettings, "forcePoshAirPods");
  v6 = (char *)objc_msgSend(a3, "type");
  if ((unint64_t)(v6 - 1) < 2)
    return -[CLPoshDevice createPlayUnauthorizedSoundTask](self, "createPlayUnauthorizedSoundTask");
  if (v6)
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BCB68);
    v8 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
    {
      v15 = 68289539;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      v19 = 2113;
      v20 = objc_msgSend(-[NSUUID description](-[CLDurianDevice uuid](self, "uuid"), "description"), "substringToIndex:", 8);
      v21 = 1026;
      v22 = objc_msgSend(a3, "type");
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian unrecognized sound sequence type\", \"item\":%{private, location:escape_only}@, \"soundSequenceType\":%{public}d}", (uint8_t *)&v15, 0x22u);
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BCB68);
    }
    v9 = qword_1022A0038;
    if (os_signpost_enabled((os_log_t)qword_1022A0038))
    {
      v10 = objc_msgSend(-[NSUUID description](-[CLDurianDevice uuid](self, "uuid"), "description"), "substringToIndex:", 8);
      v11 = objc_msgSend(a3, "type");
      v15 = 68289539;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      v19 = 2113;
      v20 = v10;
      v21 = 1026;
      v22 = v11;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian unrecognized sound sequence type", "{\"msg%{public}.0s\":\"#durian unrecognized sound sequence type\", \"item\":%{private, location:escape_only}@, \"soundSequenceType\":%{public}d}", (uint8_t *)&v15, 0x22u);
    }
    return 0;
  }
  if ((_os_feature_enabled_impl("FindMy", "SmilingWheel") & v5) != 1)
  {
    if ((_os_feature_enabled_impl("FindMy", "SmilingWheel") & 1) == 0)
    {
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BCB68);
      v12 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 68289026;
        v16 = 0;
        v17 = 2082;
        v18 = "";
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh not creating ut playsound task since SmilingWheel FF is not enabled\"}", (uint8_t *)&v15, 0x12u);
      }
    }
    if ((v5 & 1) == 0)
    {
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BCB68);
      v13 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
      {
        v15 = 68289026;
        v16 = 0;
        v17 = 2082;
        v18 = "";
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh not creating ut playsound task since Posh AirPods defaults write is not enabled\"}", (uint8_t *)&v15, 0x12u);
      }
    }
    return 0;
  }
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCB68);
  v7 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 68289026;
    v16 = 0;
    v17 = 2082;
    v18 = "";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh creating #ut playsound task\"}", (uint8_t *)&v15, 0x12u);
  }
  return +[CLDurianTask startNonOwnerShortSoundPoshTask](CLDurianTask, "startNonOwnerShortSoundPoshTask");
}

- (id)createPlayUnauthorizedSoundTask
{
  NSObject *v2;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCB68);
  v2 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut playSound\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask startNonOwnerSoundPoshTask](CLDurianTask, "startNonOwnerSoundPoshTask");
}

- (id)createStopPlayingUnauthorizedSoundTask
{
  NSObject *v2;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCB68);
  v2 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut stopSound\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask stopNonOwnerSoundPoshTask](CLDurianTask, "stopNonOwnerSoundPoshTask");
}

- (id)createFetchAISSerialNumberTask
{
  NSObject *v2;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCB68);
  v2 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut getSerialNumber\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask fetchNonOwnerSerialNumberPoshTask](CLDurianTask, "fetchNonOwnerSerialNumberPoshTask");
}

- (id)createFetchAISProductDataTask
{
  NSObject *v2;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCB68);
  v2 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut getProductData\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask fetchNonOwnerProductDataPoshTask](CLDurianTask, "fetchNonOwnerProductDataPoshTask");
}

- (id)createFetchAISManufacturerNameTask
{
  NSObject *v2;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCB68);
  v2 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut getManufacturerName\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask fetchNonOwnerManufacturerNamePoshTask](CLDurianTask, "fetchNonOwnerManufacturerNamePoshTask");
}

- (id)createFetchAISModelNameTask
{
  NSObject *v2;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCB68);
  v2 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut getModelName\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask fetchNonOwnerModelNamePoshTask](CLDurianTask, "fetchNonOwnerModelNamePoshTask");
}

- (id)createFetchAISAccessoryCategoryTask
{
  NSObject *v2;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCB68);
  v2 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut getAccessoryCategory\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask fetchNonOwnerAccessoryCategoryPoshTask](CLDurianTask, "fetchNonOwnerAccessoryCategoryPoshTask");
}

- (id)createFetchAISProtocolImplementationTask
{
  NSObject *v2;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCB68);
  v2 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut getProtocolImplementation\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask fetchNonOwnerProtocolImplementationPoshTask](CLDurianTask, "fetchNonOwnerProtocolImplementationPoshTask");
}

- (id)createFetchAISAccessoryCapabilitiesTask
{
  NSObject *v2;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCB68);
  v2 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut getAccessoryCapabilities\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask fetchNonOwnerAccessoryCapabilitiesPoshTask](CLDurianTask, "fetchNonOwnerAccessoryCapabilitiesPoshTask");
}

- (id)createFetchAISNetworkIdTask
{
  NSObject *v2;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCB68);
  v2 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut getNetworkId\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask fetchNonOwnerNetworkIdPoshTask](CLDurianTask, "fetchNonOwnerNetworkIdPoshTask");
}

- (id)createFetchAISFirmwareVersionTask
{
  NSObject *v2;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCB68);
  v2 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut getFirmwareVersion\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask fetchNonOwnerFirmwareVersionPoshTask](CLDurianTask, "fetchNonOwnerFirmwareVersionPoshTask");
}

- (id)createFetchAISBatteryTypeTask
{
  NSObject *v2;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCB68);
  v2 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut getBatteryType\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask fetchNonOwnerBatteryTypePoshTask](CLDurianTask, "fetchNonOwnerBatteryTypePoshTask");
}

- (id)createFetchAISBatteryLevelTask
{
  NSObject *v2;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCB68);
  v2 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut getBatteryLevel\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask fetchNonOwnerBatteryLevelPoshTask](CLDurianTask, "fetchNonOwnerBatteryLevelPoshTask");
}

- (id)createStartUnauthorizedAggressiveAdvertisingTask
{
  unsigned int v2;
  BOOL v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v7;
  int v8;
  int v9;
  __int16 v10;
  const char *v11;

  v2 = +[CLDurianSettings forcePoshAirPods](CLDurianSettings, "forcePoshAirPods");
  if (_os_feature_enabled_impl("FindMy", "SmilingWheel"))
    v3 = v2 == 0;
  else
    v3 = 1;
  if (v3)
  {
    if ((_os_feature_enabled_impl("FindMy", "SmilingWheel") & 1) == 0)
    {
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BCB68);
      v4 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
      {
        v8 = 68289026;
        v9 = 0;
        v10 = 2082;
        v11 = "";
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh not creating StartUnauthorizedAggressiveAdvertisingTask since SmilingWheel FF is not enabled\"}", (uint8_t *)&v8, 0x12u);
      }
    }
    if ((v2 & 1) == 0)
    {
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BCB68);
      v5 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
      {
        v8 = 68289026;
        v9 = 0;
        v10 = 2082;
        v11 = "";
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh not creating StartUnauthorizedAggressiveAdvertisingTask since Posh AirPods defaults write is not enabled\"}", (uint8_t *)&v8, 0x12u);
      }
    }
    return 0;
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BCB68);
    v7 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 68289026;
      v9 = 0;
      v10 = 2082;
      v11 = "";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh creating StartUnauthorizedAggressiveAdvertisingTask\"}", (uint8_t *)&v8, 0x12u);
    }
    return +[CLDurianTask startNonOwnerPoshAggressiveAdvertisingTask](CLDurianTask, "startNonOwnerPoshAggressiveAdvertisingTask");
  }
}

- (id)createFetchTxPowerTaskAsOwner:(BOOL)a3
{
  unsigned int v3;
  BOOL v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v8;
  int v9;
  int v10;
  __int16 v11;
  const char *v12;

  v3 = +[CLDurianSettings forcePoshAirPods](CLDurianSettings, "forcePoshAirPods", a3);
  if (_os_feature_enabled_impl("FindMy", "SmilingWheel"))
    v4 = v3 == 0;
  else
    v4 = 1;
  if (v4)
  {
    if ((_os_feature_enabled_impl("FindMy", "SmilingWheel") & 1) == 0)
    {
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BCB68);
      v5 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 68289026;
        v10 = 0;
        v11 = 2082;
        v12 = "";
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh not creating FetchTxPowerTask since SmilingWheel FF is not enabled\"}", (uint8_t *)&v9, 0x12u);
      }
    }
    if ((v3 & 1) == 0)
    {
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BCB68);
      v6 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 68289026;
        v10 = 0;
        v11 = 2082;
        v12 = "";
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh not creating FetchTxPowerTask since Posh AirPods defaults write is not enabled\"}", (uint8_t *)&v9, 0x12u);
      }
    }
    return 0;
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BCB68);
    v8 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 68289026;
      v10 = 0;
      v11 = 2082;
      v12 = "";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh creating FetchTxPowerTask\"}", (uint8_t *)&v9, 0x12u);
    }
    return +[CLDurianTask fetchTxPowerGATTTask](CLDurianTask, "fetchTxPowerGATTTask");
  }
}

@end
