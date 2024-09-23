@implementation CLHawkeyeDevice

- (id)createPlaySoundTaskWithSequence:(id)a3
{
  NSObject *v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  id v10;
  const char *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  NSObject *v16;
  id v17;
  unsigned int v18;
  uint64_t v19;
  id v20;
  unsigned int v21;
  int v22;
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  unsigned int v29;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCB48);
  v5 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 68289026;
    v23 = 0;
    v24 = 2082;
    v25 = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating PlaySoundTask\"}", (uint8_t *)&v22, 0x12u);
  }
  v6 = objc_msgSend(a3, "type");
  if (!v6)
    return +[CLDurianTask startShortSoundHawkeyeTask](CLHawkeyeTask, "startShortSoundHawkeyeTask");
  if (v6 == (id)1)
    return +[CLDurianTask startSoundHawkeyeTask](CLDurianTask, "startSoundHawkeyeTask");
  if (v6 == (id)2)
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BCB48);
    v7 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
    {
      v8 = objc_msgSend(-[NSUUID description](-[CLDurianDevice uuid](self, "uuid"), "description"), "substringToIndex:", 8);
      v22 = 68289283;
      v23 = 0;
      v24 = 2082;
      v25 = "";
      v26 = 2113;
      v27 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian custom sound sequence type not supported for #hawkeye\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v22, 0x1Cu);
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BCB48);
    }
    v9 = qword_1022A0038;
    if (!os_signpost_enabled((os_log_t)qword_1022A0038))
      return 0;
    v10 = objc_msgSend(-[NSUUID description](-[CLDurianDevice uuid](self, "uuid"), "description"), "substringToIndex:", 8);
    v22 = 68289283;
    v23 = 0;
    v24 = 2082;
    v25 = "";
    v26 = 2113;
    v27 = v10;
    v11 = "#durian custom sound sequence type not supported for #hawkeye";
    v12 = "{\"msg%{public}.0s\":\"#durian custom sound sequence type not supported for #hawkeye\", \"item\":%{private, lo"
          "cation:escape_only}@}";
    v13 = v9;
    v14 = 28;
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BCB48);
    v16 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
    {
      v17 = objc_msgSend(-[NSUUID description](-[CLDurianDevice uuid](self, "uuid"), "description"), "substringToIndex:", 8);
      v18 = objc_msgSend(a3, "type");
      v22 = 68289539;
      v23 = 0;
      v24 = 2082;
      v25 = "";
      v26 = 2113;
      v27 = v17;
      v28 = 1026;
      v29 = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian unrecognized sound sequence type\", \"item\":%{private, location:escape_only}@, \"soundSequenceType\":%{public}d}", (uint8_t *)&v22, 0x22u);
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BCB48);
    }
    v19 = qword_1022A0038;
    if (!os_signpost_enabled((os_log_t)qword_1022A0038))
      return 0;
    v20 = objc_msgSend(-[NSUUID description](-[CLDurianDevice uuid](self, "uuid"), "description"), "substringToIndex:", 8);
    v21 = objc_msgSend(a3, "type");
    v22 = 68289539;
    v23 = 0;
    v24 = 2082;
    v25 = "";
    v26 = 2113;
    v27 = v20;
    v28 = 1026;
    v29 = v21;
    v11 = "#durian unrecognized sound sequence type";
    v12 = "{\"msg%{public}.0s\":\"#durian unrecognized sound sequence type\", \"item\":%{private, location:escape_only}@,"
          " \"soundSequenceType\":%{public}d}";
    v13 = v19;
    v14 = 34;
  }
  _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v11, v12, (uint8_t *)&v22, v14);
  return 0;
}

- (id)createPlayUnauthorizedSoundTaskWithSequence:(id)a3
{
  NSObject *v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  id v10;
  const char *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  NSObject *v16;
  id v17;
  unsigned int v18;
  uint64_t v19;
  id v20;
  unsigned int v21;
  int v22;
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  id v27;
  __int16 v28;
  unsigned int v29;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCB48);
  v5 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 68289026;
    v23 = 0;
    v24 = 2082;
    v25 = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating PlayUnauthorizedSoundTask\"}", (uint8_t *)&v22, 0x12u);
  }
  v6 = objc_msgSend(a3, "type");
  if (!v6)
    return +[CLDurianTask startNonOwnerShortSoundHawkeyeTask](CLHawkeyeTask, "startNonOwnerShortSoundHawkeyeTask");
  if (v6 == (id)1)
    return +[CLDurianTask startNonOwnerSoundHawkeyeTask](CLDurianTask, "startNonOwnerSoundHawkeyeTask");
  if (v6 == (id)2)
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BCB48);
    v7 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
    {
      v8 = objc_msgSend(-[NSUUID description](-[CLDurianDevice uuid](self, "uuid"), "description"), "substringToIndex:", 8);
      v22 = 68289283;
      v23 = 0;
      v24 = 2082;
      v25 = "";
      v26 = 2113;
      v27 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian custom sound sequence type not supported for #hawkeye\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v22, 0x1Cu);
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BCB48);
    }
    v9 = qword_1022A0038;
    if (!os_signpost_enabled((os_log_t)qword_1022A0038))
      return 0;
    v10 = objc_msgSend(-[NSUUID description](-[CLDurianDevice uuid](self, "uuid"), "description"), "substringToIndex:", 8);
    v22 = 68289283;
    v23 = 0;
    v24 = 2082;
    v25 = "";
    v26 = 2113;
    v27 = v10;
    v11 = "#durian custom sound sequence type not supported for #hawkeye";
    v12 = "{\"msg%{public}.0s\":\"#durian custom sound sequence type not supported for #hawkeye\", \"item\":%{private, lo"
          "cation:escape_only}@}";
    v13 = v9;
    v14 = 28;
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BCB48);
    v16 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
    {
      v17 = objc_msgSend(-[NSUUID description](-[CLDurianDevice uuid](self, "uuid"), "description"), "substringToIndex:", 8);
      v18 = objc_msgSend(a3, "type");
      v22 = 68289539;
      v23 = 0;
      v24 = 2082;
      v25 = "";
      v26 = 2113;
      v27 = v17;
      v28 = 1026;
      v29 = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian unrecognized sound sequence type\", \"item\":%{private, location:escape_only}@, \"soundSequenceType\":%{public}d}", (uint8_t *)&v22, 0x22u);
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BCB48);
    }
    v19 = qword_1022A0038;
    if (!os_signpost_enabled((os_log_t)qword_1022A0038))
      return 0;
    v20 = objc_msgSend(-[NSUUID description](-[CLDurianDevice uuid](self, "uuid"), "description"), "substringToIndex:", 8);
    v21 = objc_msgSend(a3, "type");
    v22 = 68289539;
    v23 = 0;
    v24 = 2082;
    v25 = "";
    v26 = 2113;
    v27 = v20;
    v28 = 1026;
    v29 = v21;
    v11 = "#durian unrecognized sound sequence type";
    v12 = "{\"msg%{public}.0s\":\"#durian unrecognized sound sequence type\", \"item\":%{private, location:escape_only}@,"
          " \"soundSequenceType\":%{public}d}";
    v13 = v19;
    v14 = 34;
  }
  _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v11, v12, (uint8_t *)&v22, v14);
  return 0;
}

- (id)createStopPlayingSoundTask
{
  NSObject *v2;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCB48);
  v2 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating StopPlayingSoundTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask stopSoundHawkeyeTask](CLDurianTask, "stopSoundHawkeyeTask");
}

- (id)createStopPlayingUnauthorizedSoundTask
{
  NSObject *v2;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCB48);
  v2 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating StopPlayingUnauthorizedSoundTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask stopNonOwnerSoundHawkeyeTask](CLDurianTask, "stopNonOwnerSoundHawkeyeTask");
}

- (id)createInitRangingTaskWithMacAddress:(id)a3
{
  NSObject *v3;
  _DWORD v5[2];
  __int16 v6;
  const char *v7;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCB48);
  v3 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 68289026;
    v5[1] = 0;
    v6 = 2082;
    v7 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating InitRangingTask\"}", (uint8_t *)v5, 0x12u);
  }
  return +[CLDurianTask initRangingHawkeyeTask](CLDurianTask, "initRangingHawkeyeTask");
}

- (id)createDeinitRangingTask
{
  NSObject *v2;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCB48);
  v2 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating DeinitRangingTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask deinitRangingHawkeyeTask](CLDurianTask, "deinitRangingHawkeyeTask");
}

- (id)createConfigureRangingTaskWithMacAddress:(id)a3 countryCode:(unsigned __int8)a4 uwbChannel:(unsigned __int8)a5 acqPreamble:(unsigned __int8)a6 trackingPreamble:(unsigned __int8)a7 interval:(unsigned __int16)a8
{
  NSObject *v15;
  char v16;
  char *v17;
  NSObject *v18;
  id v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v29;
  int v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  int v36;
  __int16 v37;
  int v38;
  __int16 v39;
  int v40;
  __int16 v41;
  int v42;
  __int16 v43;
  int v44;
  __int16 v45;
  int v46;
  __int16 v47;
  int v48;
  __int16 v49;
  int v50;
  _BYTE v51[2];
  unsigned __int16 v52;
  char v53;
  unsigned __int8 v54;
  unsigned __int8 v55;
  unsigned __int8 v56;
  unsigned __int8 v57;
  unsigned __int8 v58;
  unsigned __int8 v59;
  unsigned __int8 v60;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCB48);
  v15 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v29 = 68289026;
    v30 = 0;
    v31 = 2082;
    v32 = "";
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating ConfigureRangingTask\"}", (uint8_t *)&v29, 0x12u);
  }
  v16 = a5 & 3 | (4 * (a6 & 3)) & 0xCF | (16 * (a7 & 3)) | 0x80;
  v17 = (char *)objc_msgSend(a3, "bytes");
  v51[0] = a4;
  v51[1] = v16;
  v52 = a8;
  v53 = *v17;
  v54 = v17[1];
  v55 = v17[2];
  v56 = v17[3];
  v57 = v17[4];
  v58 = v17[5];
  v59 = v17[6];
  v60 = v17[7];
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCB48);
  v18 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v19 = objc_msgSend(-[NSUUID description](-[CLDurianDevice uuid](self, "uuid"), "description"), "substringToIndex:", 8);
    v20 = *v17;
    v21 = v17[1];
    v22 = v17[2];
    v23 = v17[3];
    v24 = v17[4];
    v25 = v17[5];
    v26 = v17[6];
    v27 = v17[7];
    v29 = 68291331;
    v30 = 0;
    v31 = 2082;
    v32 = "";
    v33 = 2113;
    v34 = v19;
    v35 = 1026;
    v36 = v20;
    v37 = 1026;
    v38 = v21;
    v39 = 1026;
    v40 = v22;
    v41 = 1026;
    v42 = v23;
    v43 = 1026;
    v44 = v24;
    v45 = 1026;
    v46 = v25;
    v47 = 1026;
    v48 = v26;
    v49 = 1026;
    v50 = v27;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian macaddress fix2\", \"item\":%{private, location:escape_only}@, \"0\":%{public}d, \"1\":%{public}d, \"2\":%{public}d, \"3\":%{public}d, \"4\":%{public}d, \"5\":%{public}d, \"6\":%{public}d, \"7\":%{public}d}", (uint8_t *)&v29, 0x4Cu);
  }
  return +[CLDurianTask configureRangingHawkeyeTaskWithPayload:](CLDurianTask, "configureRangingHawkeyeTaskWithPayload:", v51);
}

- (id)createStartRangingTaskWithTargetEventCounter:(unsigned __int16)a3
{
  uint64_t v3;
  NSObject *v4;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;

  v3 = a3;
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCB48);
  v4 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289026;
    v6[1] = 0;
    v7 = 2082;
    v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating StartRangingTask\"}", (uint8_t *)v6, 0x12u);
  }
  return +[CLDurianTask startRangingHawkeyeTaskWithTargetEventCounter:](CLDurianTask, "startRangingHawkeyeTaskWithTargetEventCounter:", v3);
}

- (id)createStopRangingTask
{
  NSObject *v2;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCB48);
  v2 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating StopRangingTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask stopRangingHawkeyeTask](CLDurianTask, "stopRangingHawkeyeTask");
}

- (id)createGetMultiStatusTask
{
  NSObject *v2;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCB48);
  v2 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating GetMultiStatusTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask getMultiStatusHawkeyeTask](CLDurianTask, "getMultiStatusHawkeyeTask");
}

- (id)createGetGroupStatusTask
{
  NSObject *v2;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCB48);
  v2 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating GetGroupStatusTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask getGroupStatusHawkeyeTask](CLDurianTask, "getGroupStatusHawkeyeTask");
}

- (id)createDumpLogsTaskOfType:(unint64_t)a3
{
  NSObject *v5;
  NSObject *v6;
  id v7;
  int v9;
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  id v14;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCB48);
  v5 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 68289026;
    v10 = 0;
    v11 = 2082;
    v12 = "";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating DumpLogsTask\"}", (uint8_t *)&v9, 0x12u);
  }
  if (a3 != 4)
    return 0;
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCB48);
  v6 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_msgSend(-[NSUUID description](-[CLDurianDevice uuid](self, "uuid"), "description"), "substringToIndex:", 8);
    v9 = 68289283;
    v10 = 0;
    v11 = 2082;
    v12 = "";
    v13 = 2113;
    v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye dumpLogs\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v9, 0x1Cu);
  }
  return +[CLDurianTask retrieveLogsHawkeyeTask](CLDurianTask, "retrieveLogsHawkeyeTask");
}

- (id)createSetKeyRollTimeoutTaskWithInterval:(unsigned int)a3
{
  NSObject *v4;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCB48);
  v4 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289026;
    v6[1] = 0;
    v7 = 2082;
    v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating SetKeyRollTimeoutTask\"}", (uint8_t *)v6, 0x12u);
  }
  return +[CLDurianTask setKeyRotationTimeoutHawkeyeTaskWithTimeout:](CLDurianTask, "setKeyRotationTimeoutHawkeyeTaskWithTimeout:", 1000 * a3);
}

- (id)createInduceCrashTask
{
  NSObject *v2;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCB48);
  v2 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating InduceCrashTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask resetHawkeyeTask](CLDurianTask, "resetHawkeyeTask");
}

- (id)createStartUnauthorizedAggressiveAdvertisingTask
{
  NSObject *v2;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCB48);
  v2 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating StartUnauthorizedAggressiveAdvertisingTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask startNonOwnerAggressiveAdvertisingTask](CLDurianTask, "startNonOwnerAggressiveAdvertisingTask");
}

- (id)createSetTestModeTaskWithMode:(int)a3
{
  unsigned __int8 v3;
  NSObject *v4;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;

  v3 = a3;
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCB48);
  v4 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289026;
    v6[1] = 0;
    v7 = 2082;
    v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating SetTestModeTask\"}", (uint8_t *)v6, 0x12u);
  }
  return +[CLDurianTask testModeTask:](CLDurianTask, "testModeTask:", v3);
}

- (id)createSetHawkeyeUTMotionConfigTaskWithSeparatedUTTimeoutSeconds:(unsigned int)a3 separatedUTBackoffTimeoutSeconds:(unsigned int)a4
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  _DWORD v8[2];
  __int16 v9;
  const char *v10;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCB48);
  v6 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 68289026;
    v8[1] = 0;
    v9 = 2082;
    v10 = "";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating SetHawkeyeUTMotionConfigTask\"}", (uint8_t *)v8, 0x12u);
  }
  return +[CLDurianTask setHawkeyeUTMotionConfigWithSeparatedUTTimeoutSeconds:separatedUTBackoffTimeoutSeconds:](CLDurianTask, "setHawkeyeUTMotionConfigWithSeparatedUTTimeoutSeconds:separatedUTBackoffTimeoutSeconds:", v5, v4);
}

- (id)createFetchAISProductDataTask
{
  NSObject *v2;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCB48);
  v2 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating FetchAISProductDataTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask fetchProductDataGATTTask](CLDurianTask, "fetchProductDataGATTTask");
}

- (id)createUnpairDeviceTask
{
  NSObject *v2;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCB48);
  v2 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating UnpairDeviceTask \"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask unpairHawkeyeTask](CLDurianTask, "unpairHawkeyeTask");
}

- (id)createFetchAISManufacturerNameTask
{
  NSObject *v2;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCB48);
  v2 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating FetchAISManufacturerNameTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask fetchManufacturerNameGATTTask](CLDurianTask, "fetchManufacturerNameGATTTask");
}

- (id)createFetchAISModelNameTask
{
  NSObject *v2;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCB48);
  v2 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating FetchAISModelNameTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask fetchModelNameGATTTask](CLDurianTask, "fetchModelNameGATTTask");
}

- (id)createFetchAISModelColorCodeTask
{
  NSObject *v2;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCB48);
  v2 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating FetchAISModelColorCodeTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask fetchModelColorCodeGATTTask](CLDurianTask, "fetchModelColorCodeGATTTask");
}

- (id)createFetchAISAccessoryCategoryTask
{
  NSObject *v2;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCB48);
  v2 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating FetchAISAccessoryCategoryTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask fetchAccessoryCategoryGATTTask](CLDurianTask, "fetchAccessoryCategoryGATTTask");
}

- (id)createFetchAISAccessoryCapabilitiesTask
{
  NSObject *v2;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCB48);
  v2 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating FetchAISAccessoryCapabilitiesTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask fetchAccessoryCapabilitiesGATTTask](CLDurianTask, "fetchAccessoryCapabilitiesGATTTask");
}

- (id)createFetchAISFirmwareVersionTask
{
  NSObject *v2;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCB48);
  v2 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating FetchAISFirmwareVersionTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask fetchFirmwareVersionGATTTask](CLDurianTask, "fetchFirmwareVersionGATTTask");
}

- (id)createFetchAISFindMyVersionTask
{
  NSObject *v2;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCB48);
  v2 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating FetchAISFindMyVersionTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask fetchFindMyVersionGATTTask](CLDurianTask, "fetchFindMyVersionGATTTask");
}

- (id)createFetchAISSerialNumberTask
{
  NSObject *v2;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCB48);
  v2 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating FetchSerialNumberTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask getSerialNumberTask](CLDurianTask, "getSerialNumberTask");
}

- (id)createFetchCurrentPrimaryKeyTask
{
  NSObject *v2;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCB48);
  v2 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating FetchCurrentPrimaryKeyTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask getCurrentPrimaryKeyTask](CLDurianTask, "getCurrentPrimaryKeyTask");
}

- (id)createFetchiCloudIdentifierTask
{
  NSObject *v2;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCB48);
  v2 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating FetchiCloudIdentifierTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask getiCloudIdentifierTask](CLDurianTask, "getiCloudIdentifierTask");
}

- (id)createFetchAISBatteryTypeTask
{
  NSObject *v2;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCB48);
  v2 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating FetchAISBatteryTypeTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask fetchBatteryTypeGATTTask](CLDurianTask, "fetchBatteryTypeGATTTask");
}

- (id)createFetchFirmwareVersionTaskWithCrashLogs:(BOOL)a3
{
  NSObject *v3;
  _DWORD v5[2];
  __int16 v6;
  const char *v7;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCB48);
  v3 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 68289026;
    v5[1] = 0;
    v6 = 2082;
    v7 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating FetchFirmwareVersionTask\"}", (uint8_t *)v5, 0x12u);
  }
  return +[CLDurianTask fetchFirmwareVersionGATTTask](CLDurianTask, "fetchFirmwareVersionGATTTask");
}

- (id)createFetchBatteryStatusTask
{
  NSObject *v2;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCB48);
  v2 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating FetchBatteryStatusTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask fetchBatteryLevelGATTTask](CLDurianTask, "fetchBatteryLevelGATTTask");
}

- (id)createSetMaxConnectionsTaskWithCount:(int)a3
{
  unsigned __int8 v3;
  NSObject *v4;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;

  v3 = a3;
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCB48);
  v4 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289026;
    v6[1] = 0;
    v7 = 2082;
    v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating SetMaxConnectionsTask\"}", (uint8_t *)v6, 0x12u);
  }
  return +[CLDurianTask setMaxConnectionsHawkeyeTaskWithCount:](CLDurianTask, "setMaxConnectionsHawkeyeTaskWithCount:", v3);
}

- (id)unpair
{
  NSObject *v2;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCB48);
  v2 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating unpairTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask unpairHawkeyeTask](CLDurianTask, "unpairHawkeyeTask");
}

- (id)createSetNearOwnerTimeoutTaskInSeconds:(unsigned __int16)a3
{
  uint64_t v3;
  NSObject *v4;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;

  v3 = a3;
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCB48);
  v4 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289026;
    v6[1] = 0;
    v7 = 2082;
    v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating SetNearOwnerTimeoutTask\"}", (uint8_t *)v6, 0x12u);
  }
  return +[CLDurianTask setNearbyTimeoutHawkeyeTaskWithTimeout:asHele:](CLDurianTask, "setNearbyTimeoutHawkeyeTaskWithTimeout:asHele:", v3, 0);
}

- (id)createRollWildKeyTask
{
  NSObject *v2;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCB48);
  v2 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating RollWildKeyTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask latchSeparatedKeyHawkeyeTask](CLDurianTask, "latchSeparatedKeyHawkeyeTask");
}

- (id)createFetchTxPowerTaskAsOwner:(BOOL)a3
{
  NSObject *v3;
  _DWORD v5[2];
  __int16 v6;
  const char *v7;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCB48);
  v3 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 68289026;
    v5[1] = 0;
    v6 = 2082;
    v7 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating FetchTxPowerTask\"}", (uint8_t *)v5, 0x12u);
  }
  return +[CLDurianTask fetchTxPowerGATTTask](CLDurianTask, "fetchTxPowerGATTTask");
}

- (id)createStartAggressiveAdvertisingTaskWithTimeout:(unsigned int)a3
{
  uint64_t v3;
  NSObject *v4;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;

  v3 = *(_QWORD *)&a3;
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCB48);
  v4 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289026;
    v6[1] = 0;
    v7 = 2082;
    v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating StartAggressiveAdvertisingTask\"}", (uint8_t *)v6, 0x12u);
  }
  return +[CLDurianTask startAggressiveAdvertisingTaskWithTimeout:](CLDurianTask, "startAggressiveAdvertisingTaskWithTimeout:", v3);
}

- (id)createStopAggressiveAdvertisingTask
{
  NSObject *v2;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCB48);
  v2 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating StopAggressiveAdvertisingTask\"}", (uint8_t *)v4, 0x12u);
  }
  return +[CLDurianTask stopAggressiveAdvertisingTask](CLDurianTask, "stopAggressiveAdvertisingTask");
}

- (id)createSetPersistentConnectionTaskWithState:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v4;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;

  v3 = a3;
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCB48);
  v4 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289026;
    v6[1] = 0;
    v7 = 2082;
    v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye creating SetPersistentConnectionTask\"}", (uint8_t *)v6, 0x12u);
  }
  return +[CLDurianTask enablePersistentConnectionsHawkeyeTask:](CLDurianTask, "enablePersistentConnectionsHawkeyeTask:", v3);
}

- (unsigned)getRangingStatusForOpcode:(unsigned __int16)a3 data:(char *)a4
{
  int v5;
  NSObject *v7;
  NSObject *v9;
  id v10;
  NSObject *v11;
  id v12;
  int v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  int v20;

  v5 = a3;
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCB48);
  v7 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 68289026;
    v14 = 0;
    v15 = 2082;
    v16 = "";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye parsing ranging-status\"}", (uint8_t *)&v13, 0x12u);
  }
  if (v5 <= 20)
  {
    if (v5 != 1 && v5 != 3 && v5 != 6)
      goto LABEL_17;
    return *(_DWORD *)(a4 + 2);
  }
  if (v5 > 1801)
  {
    if (v5 != 1802 && v5 != 2058)
      goto LABEL_17;
    return *(_DWORD *)(a4 + 2);
  }
  if (v5 == 21 || v5 == 34)
    return *(_DWORD *)(a4 + 2);
LABEL_17:
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCB48);
  v9 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_FAULT))
  {
    v10 = objc_msgSend(-[NSUUID description](-[CLDurianDevice uuid](self, "uuid"), "description"), "substringToIndex:", 8);
    v13 = 68289539;
    v14 = 0;
    v15 = 2082;
    v16 = "";
    v17 = 2113;
    v18 = v10;
    v19 = 1026;
    v20 = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#durian unknown opcode in ranging completion for hawkeye-device\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d}", (uint8_t *)&v13, 0x22u);
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BCB48);
  }
  v11 = qword_1022A0038;
  if (os_signpost_enabled((os_log_t)qword_1022A0038))
  {
    v12 = objc_msgSend(-[NSUUID description](-[CLDurianDevice uuid](self, "uuid"), "description"), "substringToIndex:", 8);
    v13 = 68289539;
    v14 = 0;
    v15 = 2082;
    v16 = "";
    v17 = 2113;
    v18 = v12;
    v19 = 1026;
    v20 = v5;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian unknown opcode in ranging completion for hawkeye-device", "{\"msg%{public}.0s\":\"#durian unknown opcode in ranging completion for hawkeye-device\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d}", (uint8_t *)&v13, 0x22u);
  }
  return 0x7FFFFFFF;
}

- (unsigned)getRangeEndReasonForOpcode:(unsigned __int16)a3 data:(char *)a4
{
  int v5;
  NSObject *v7;
  NSObject *v9;
  id v10;
  NSObject *v11;
  id v12;
  int v13;
  int v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  int v20;

  v5 = a3;
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCB48);
  v7 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 68289026;
    v14 = 0;
    v15 = 2082;
    v16 = "";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye parsing ranging-end-reason\"}", (uint8_t *)&v13, 0x12u);
  }
  if (v5 == 2051 || v5 == 3)
    return a4[6];
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCB48);
  v9 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_FAULT))
  {
    v10 = objc_msgSend(-[NSUUID description](-[CLDurianDevice uuid](self, "uuid"), "description"), "substringToIndex:", 8);
    v13 = 68289539;
    v14 = 0;
    v15 = 2082;
    v16 = "";
    v17 = 2113;
    v18 = v10;
    v19 = 1026;
    v20 = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#durian unknown opcode in ranging start completion\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d}", (uint8_t *)&v13, 0x22u);
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BCB48);
  }
  v11 = qword_1022A0038;
  if (os_signpost_enabled((os_log_t)qword_1022A0038))
  {
    v12 = objc_msgSend(-[NSUUID description](-[CLDurianDevice uuid](self, "uuid"), "description"), "substringToIndex:", 8);
    v13 = 68289539;
    v14 = 0;
    v15 = 2082;
    v16 = "";
    v17 = 2113;
    v18 = v12;
    v19 = 1026;
    v20 = v5;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian unknown opcode in ranging start completion", "{\"msg%{public}.0s\":\"#durian unknown opcode in ranging start completion\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d}", (uint8_t *)&v13, 0x22u);
  }
  return 127;
}

- (unint64_t)getMultiStatusFromData:(char *)a3
{
  NSObject *v4;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BCB48);
  v4 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 68289026;
    v6[1] = 0;
    v7 = 2082;
    v8 = "";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye parsing multi-status \"}", (uint8_t *)v6, 0x12u);
  }
  return *(int *)(a3 + 2);
}

@end
