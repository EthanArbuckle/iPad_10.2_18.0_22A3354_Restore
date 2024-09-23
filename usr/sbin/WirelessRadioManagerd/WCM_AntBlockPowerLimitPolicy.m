@implementation WCM_AntBlockPowerLimitPolicy

- (WCM_AntBlockPowerLimitPolicy)init
{
  WCM_AntBlockPowerLimitPolicy *v2;
  AntBlockPowerLimitPolicyClientWiFiCam *v3;
  AntBlockPowerLimitPolicyClientWiFiCam *mWiFiPolicy;
  AntBlockPowerLimitPolicyClientWiFiCam *v5;
  AntBlockPowerLimitPolicyClientWiFiCam *mFrontCamPolicy;
  AntBlockPowerLimitPolicyClientWiFiCam *v7;
  AntBlockPowerLimitPolicyClientWiFiCam *mFaceIdCamPolicy;
  AntBlockPowerLimitPolicyClientWiFiCam *v9;
  AntBlockPowerLimitPolicyClientWiFiCam *mRearTeleCamPolicy;
  AntBlockPowerLimitPolicyClientWiFiCam *v11;
  AntBlockPowerLimitPolicyClientWiFiCam *mRearWideCamPolicy;
  AntBlockPowerLimitPolicyClientWiFiCam *v13;
  AntBlockPowerLimitPolicyClientWiFiCam *mRearUltraWideCamPolicy;
  AntBlockPowerLimitPolicyClientUwb *v15;
  AntBlockPowerLimitPolicyClientUwb *mUwbPolicy;
  AntBlockPowerLimitPolicyClientWiFiCam *v17;
  AntBlockPowerLimitPolicyClientWiFiCam *mE85Policy;
  AntBlockPowerLimitPolicyClientGnssImd *v19;
  AntBlockPowerLimitPolicyClientGnssImd *mGnssImdPolicy;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)WCM_AntBlockPowerLimitPolicy;
  v2 = -[WCM_AntBlockPowerLimitPolicy init](&v22, "init");
  v3 = -[AntBlockPowerLimitPolicyClientWiFiCam initWithClient:]([AntBlockPowerLimitPolicyClientWiFiCam alloc], "initWithClient:", 0);
  mWiFiPolicy = v2->_mWiFiPolicy;
  v2->_mWiFiPolicy = v3;

  v5 = -[AntBlockPowerLimitPolicyClientWiFiCam initWithClient:]([AntBlockPowerLimitPolicyClientWiFiCam alloc], "initWithClient:", 2);
  mFrontCamPolicy = v2->_mFrontCamPolicy;
  v2->_mFrontCamPolicy = v5;

  v7 = -[AntBlockPowerLimitPolicyClientWiFiCam initWithClient:]([AntBlockPowerLimitPolicyClientWiFiCam alloc], "initWithClient:", 3);
  mFaceIdCamPolicy = v2->_mFaceIdCamPolicy;
  v2->_mFaceIdCamPolicy = v7;

  v9 = -[AntBlockPowerLimitPolicyClientWiFiCam initWithClient:]([AntBlockPowerLimitPolicyClientWiFiCam alloc], "initWithClient:", 5);
  mRearTeleCamPolicy = v2->_mRearTeleCamPolicy;
  v2->_mRearTeleCamPolicy = v9;

  v11 = -[AntBlockPowerLimitPolicyClientWiFiCam initWithClient:]([AntBlockPowerLimitPolicyClientWiFiCam alloc], "initWithClient:", 8);
  mRearWideCamPolicy = v2->_mRearWideCamPolicy;
  v2->_mRearWideCamPolicy = v11;

  v13 = -[AntBlockPowerLimitPolicyClientWiFiCam initWithClient:]([AntBlockPowerLimitPolicyClientWiFiCam alloc], "initWithClient:", 4);
  mRearUltraWideCamPolicy = v2->_mRearUltraWideCamPolicy;
  v2->_mRearUltraWideCamPolicy = v13;

  v15 = objc_alloc_init(AntBlockPowerLimitPolicyClientUwb);
  mUwbPolicy = v2->_mUwbPolicy;
  v2->_mUwbPolicy = v15;

  v17 = -[AntBlockPowerLimitPolicyClientWiFiCam initWithClient:]([AntBlockPowerLimitPolicyClientWiFiCam alloc], "initWithClient:", 6);
  mE85Policy = v2->_mE85Policy;
  v2->_mE85Policy = v17;

  v19 = objc_alloc_init(AntBlockPowerLimitPolicyClientGnssImd);
  mGnssImdPolicy = v2->_mGnssImdPolicy;
  v2->_mGnssImdPolicy = v19;

  v2->mPlatformId = 0;
  return v2;
}

- (WCM_AntBlockPowerLimitPolicy)initWithPlatformId:(unint64_t)a3
{
  WCM_AntBlockPowerLimitPolicy *v4;
  AntBlockPowerLimitPolicyClientWiFiCam *v5;
  AntBlockPowerLimitPolicyClientWiFiCam *mWiFiPolicy;
  AntBlockPowerLimitPolicyClientWiFiCam *v7;
  AntBlockPowerLimitPolicyClientWiFiCam *mFrontCamPolicy;
  AntBlockPowerLimitPolicyClientWiFiCam *v9;
  AntBlockPowerLimitPolicyClientWiFiCam *mFaceIdCamPolicy;
  AntBlockPowerLimitPolicyClientWiFiCam *v11;
  AntBlockPowerLimitPolicyClientWiFiCam *mRearTeleCamPolicy;
  AntBlockPowerLimitPolicyClientWiFiCam *v13;
  AntBlockPowerLimitPolicyClientWiFiCam *mRearWideCamPolicy;
  AntBlockPowerLimitPolicyClientWiFiCam *v15;
  AntBlockPowerLimitPolicyClientWiFiCam *mRearUltraWideCamPolicy;
  AntBlockPowerLimitPolicyClientUwb *v17;
  AntBlockPowerLimitPolicyClientUwb *mUwbPolicy;
  AntBlockPowerLimitPolicyClientWiFiCam *v19;
  AntBlockPowerLimitPolicyClientWiFiCam *mE85Policy;
  AntBlockPowerLimitPolicyClientGnssImd *v21;
  AntBlockPowerLimitPolicyClientGnssImd *mGnssImdPolicy;
  NSString *mPlistFileName;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)WCM_AntBlockPowerLimitPolicy;
  v4 = -[WCM_AntBlockPowerLimitPolicy init](&v25, "init");
  v5 = -[AntBlockPowerLimitPolicyClientWiFiCam initWithClient:]([AntBlockPowerLimitPolicyClientWiFiCam alloc], "initWithClient:", 0);
  mWiFiPolicy = v4->_mWiFiPolicy;
  v4->_mWiFiPolicy = v5;

  v7 = -[AntBlockPowerLimitPolicyClientWiFiCam initWithClient:]([AntBlockPowerLimitPolicyClientWiFiCam alloc], "initWithClient:", 2);
  mFrontCamPolicy = v4->_mFrontCamPolicy;
  v4->_mFrontCamPolicy = v7;

  v9 = -[AntBlockPowerLimitPolicyClientWiFiCam initWithClient:]([AntBlockPowerLimitPolicyClientWiFiCam alloc], "initWithClient:", 3);
  mFaceIdCamPolicy = v4->_mFaceIdCamPolicy;
  v4->_mFaceIdCamPolicy = v9;

  v11 = -[AntBlockPowerLimitPolicyClientWiFiCam initWithClient:]([AntBlockPowerLimitPolicyClientWiFiCam alloc], "initWithClient:", 5);
  mRearTeleCamPolicy = v4->_mRearTeleCamPolicy;
  v4->_mRearTeleCamPolicy = v11;

  v13 = -[AntBlockPowerLimitPolicyClientWiFiCam initWithClient:]([AntBlockPowerLimitPolicyClientWiFiCam alloc], "initWithClient:", 8);
  mRearWideCamPolicy = v4->_mRearWideCamPolicy;
  v4->_mRearWideCamPolicy = v13;

  v15 = -[AntBlockPowerLimitPolicyClientWiFiCam initWithClient:]([AntBlockPowerLimitPolicyClientWiFiCam alloc], "initWithClient:", 4);
  mRearUltraWideCamPolicy = v4->_mRearUltraWideCamPolicy;
  v4->_mRearUltraWideCamPolicy = v15;

  v17 = objc_alloc_init(AntBlockPowerLimitPolicyClientUwb);
  mUwbPolicy = v4->_mUwbPolicy;
  v4->_mUwbPolicy = v17;

  v19 = -[AntBlockPowerLimitPolicyClientWiFiCam initWithClient:]([AntBlockPowerLimitPolicyClientWiFiCam alloc], "initWithClient:", 6);
  mE85Policy = v4->_mE85Policy;
  v4->_mE85Policy = v19;

  v21 = objc_alloc_init(AntBlockPowerLimitPolicyClientGnssImd);
  mGnssImdPolicy = v4->_mGnssImdPolicy;
  v4->_mGnssImdPolicy = v21;

  mPlistFileName = v4->mPlistFileName;
  v4->mPlatformId = a3;
  v4->mPlistFileName = 0;

  -[WCM_AntBlockPowerLimitPolicy readAntBlockPowerLimitPolicyPlist](v4, "readAntBlockPowerLimitPolicyPlist");
  return v4;
}

- (void)setPlatform:(unint64_t)a3
{
  self->mPlatformId = a3;
}

- (void)readAntBlockPowerLimitPolicyPlist
{
  NSString *mPlistFileName;
  NSData *v4;
  void *v5;
  void *v6;
  id v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;

  mPlistFileName = self->mPlistFileName;
  if (mPlistFileName)
  {
    v19 = 0;
    v4 = sub_1000896B4((uint64_t)mPlistFileName, (uint64_t)CFSTR("plist"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v18 = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPropertyListSerialization propertyListWithData:options:format:error:](NSPropertyListSerialization, "propertyListWithData:options:format:error:", v5, 2, &v19, &v18));
    v7 = v18;
    if (v6)
      v8 = CFSTR("init: Antenna blocking policy Plist File Found");
    else
      v8 = CFSTR("init: No antenna blocking policy Plist File Found");
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("Wifi_Client")));
    if (v9)
      -[AntBlockPowerLimitPolicyClientWiFiCam extractPolicy:](self->_mWiFiPolicy, "extractPolicy:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("Front_Camera_Client")));

    if (v10)
      -[AntBlockPowerLimitPolicyClientWiFiCam extractPolicy:](self->_mFrontCamPolicy, "extractPolicy:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("FaceId_Camera_Client")));

    if (v11)
      -[AntBlockPowerLimitPolicyClientWiFiCam extractPolicy:](self->_mFaceIdCamPolicy, "extractPolicy:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("Rear_Ultra_Wide_Camera_Client")));

    if (v12)
      -[AntBlockPowerLimitPolicyClientWiFiCam extractPolicy:](self->_mRearUltraWideCamPolicy, "extractPolicy:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("Rear_Wide_Camera_Client")));

    if (v13)
      -[AntBlockPowerLimitPolicyClientWiFiCam extractPolicy:](self->_mRearWideCamPolicy, "extractPolicy:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("Rear_Tele_Camera_Client")));

    if (v14)
      -[AntBlockPowerLimitPolicyClientWiFiCam extractPolicy:](self->_mRearTeleCamPolicy, "extractPolicy:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("Uwb_Client")));

    if (v15)
      -[AntBlockPowerLimitPolicyClientUwb extractPolicy:](self->_mUwbPolicy, "extractPolicy:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("E85_Client")));

    if (v16)
      -[AntBlockPowerLimitPolicyClientWiFiCam extractPolicy:](self->_mE85Policy, "extractPolicy:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("GNSS_IMD_Client")));

    if (v17)
      -[AntBlockPowerLimitPolicyClientGnssImd extractPolicy:](self->_mGnssImdPolicy, "extractPolicy:", v17);

  }
  else
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 0, CFSTR("init: Error: Antenna blocking, power limiting policy plist name is nil!"));
  }
}

- (void)sendPolicy
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[WCM_PolicyManager singleton](WCM_PolicyManager, "singleton"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "cellularController"));

  if (v8)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[AntBlockPowerLimitPolicyClientWiFiCam constructXpcMessage](self->_mWiFiPolicy, "constructXpcMessage"));
    if (v4)
      objc_msgSend(v8, "sendMessage:withArgs:", 1225, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[AntBlockPowerLimitPolicyClientWiFiCam constructXpcMessage](self->_mFrontCamPolicy, "constructXpcMessage"));
    if (v5)
      objc_msgSend(v8, "sendMessage:withArgs:", 1227, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[AntBlockPowerLimitPolicyClientWiFiCam constructXpcMessage](self->_mFaceIdCamPolicy, "constructXpcMessage"));
    if (v6)
      objc_msgSend(v8, "sendMessage:withArgs:", 1227, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[AntBlockPowerLimitPolicyClientUwb constructXpcMessage](self->_mUwbPolicy, "constructXpcMessage"));
    if (v7)
      objc_msgSend(v8, "sendMessage:withArgs:", 1226, v7);

  }
}

- (id)getAntBlockConfigXpcMsgOnClient:(unsigned int)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (a3 <= 8 && ((0x17Fu >> a3) & 1) != 0)
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->super.isa + qword_1001DECC0[a3]), "constructXpcMessage", v3, v4));
  else
    v5 = 0;
  return v5;
}

- (id)getAntBlockConfigGnssImdClient
{
  return self->_mGnssImdPolicy;
}

- (void)decodeWiFiCamXpcMsg:(id)a3 client:(unsigned int)a4
{
  uint64_t v4;
  _BOOL4 v5;
  uint64_t uint64;
  uint64_t v7;
  xpc_object_t value;
  void *v9;
  size_t count;
  size_t v11;
  xpc_object_t v12;
  void *v13;
  int64_t int64;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  xpc_object_t xdict;
  size_t v22;
  uint64_t v23;
  uint64_t v24;
  _BOOL4 v25;

  v4 = *(_QWORD *)&a4;
  xdict = a3;
  v5 = xpc_dictionary_get_BOOL(xdict, "kWCMCellularSetAntBlocking_DenyProtectVoice");
  uint64 = xpc_dictionary_get_uint64(xdict, "kWCMCellularSetAntBlocking_MitigationTimer");
  if ((v4 & 0xFFFFFFFE) == 2)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver: Set Client%d Antenna Blk Policy, cameraId = %llu"), v4, xpc_dictionary_get_uint64(xdict, "kWCMCellularSetAntBlocking_CameraId"), v20);
  }
  else if (!(_DWORD)v4)
  {
    v7 = xpc_dictionary_get_uint64(xdict, "kWCMCellularSetAntBlocking_LQMThreshold");
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver: Set Client%d Antenna Blk Policy, lqmThreshold = %llu, durationGranularity = %llu"), 0, v7, xpc_dictionary_get_uint64(xdict, "kWCMCellularSetAntBlocking_DurationGranularity"));
  }
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver: Set Client%d Antenna Blk Policy, denyVoiceProtect = %d, mitigationTimer = %llu"), v4, v5, uint64);
  value = xpc_dictionary_get_value(xdict, "kWCMCellularSetAntBlocking_PolicySet");
  v9 = (void *)objc_claimAutoreleasedReturnValue(value);
  count = xpc_array_get_count(v9);
  if (count)
  {
    v11 = 0;
    v22 = count;
    v23 = v4;
    do
    {
      v12 = xpc_array_get_value(v9, v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v25 = xpc_dictionary_get_BOOL(v13, "kWCMCellularSetAntBlocking_Policy_Enable");
      v24 = xpc_dictionary_get_uint64(v13, "kWCMCellularSetAntBlocking_Policy_CellularAntBitmap");
      int64 = xpc_dictionary_get_int64(v13, "kWCMCellularSetAntBlocking_Policy_CellularPowerCap");
      v15 = xpc_dictionary_get_uint64(v13, "kWCMCellularSetAntBlocking_Policy_MitigationType");
      v16 = xpc_dictionary_get_uint64(v13, "kWCMCellularSetAntBlocking_Policy_CellularBandInfo_Band");
      v17 = xpc_dictionary_get_uint64(v13, "kWCMCellularSetAntBlocking_Policy_CellularBandInfo_CoexTech");
      v18 = xpc_dictionary_get_uint64(v13, "kWCMCellularSetAntBlocking_Policy_CellularBandInfo_CenterFreq");
      v19 = xpc_dictionary_get_uint64(v13, "kWCMCellularSetAntBlocking_Policy_CellularBandInfo_Bandwidth");
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver: Set Client%d Antenna Blk Policy -- policy[%lu]: enable = %d, cellularAntBitmap = %llu, cellularTxPowerCap = %llu, mitigationType = %llu"), v23, v11, v25, v24, int64, v15);
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver: Set Client%d Antenna Blk Policy -- policy[%lu]: cellularBand = %llu, cellularCoexTech = %llu, frequency = %lluKHz, BW = %lluKHz"), v23, v11, v16, v17, v18, v19);

      ++v11;
    }
    while (v22 != v11);
  }

}

- (void)decodeUwbXpcMsg:(id)a3
{
  uint64_t uint64;
  xpc_object_t value;
  void *v5;
  size_t count;
  size_t v7;
  xpc_object_t v8;
  void *v9;
  _BOOL4 v10;
  uint64_t v11;
  int64_t int64;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  xpc_object_t v18;
  void *v19;
  size_t v20;
  size_t v21;
  size_t i;
  xpc_object_t v23;
  void *v24;
  _BOOL4 v25;
  _BOOL4 v26;
  _BOOL4 v27;
  uint64_t v28;
  xpc_object_t xdict;
  size_t v30;
  void *v31;

  xdict = a3;
  uint64 = xpc_dictionary_get_uint64(xdict, "kWCMCellularSetAntBlocking_LQMThreshold");
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver: Set UWB Antenna Blk Policy, denyVoiceProtect = %llu, durationGranularity = %llu"), uint64, xpc_dictionary_get_uint64(xdict, "kWCMCellularSetAntBlocking_DurationGranularity"));
  value = xpc_dictionary_get_value(xdict, "kWCMCellularSetAntBlocking_PolicySet");
  v5 = (void *)objc_claimAutoreleasedReturnValue(value);
  count = xpc_array_get_count(v5);
  v31 = v5;
  if (count)
  {
    v7 = 0;
    v30 = count;
    do
    {
      v8 = xpc_array_get_value(v5, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v10 = xpc_dictionary_get_BOOL(v9, "kWCMCellularSetAntBlocking_Policy_Enable");
      v11 = xpc_dictionary_get_uint64(v9, "kWCMCellularSetAntBlocking_Policy_CellularAntBitmap");
      int64 = xpc_dictionary_get_int64(v9, "kWCMCellularSetAntBlocking_Policy_CellularPowerCap");
      v13 = xpc_dictionary_get_uint64(v9, "kWCMCellularSetAntBlocking_Policy_MitigationType");
      v14 = xpc_dictionary_get_uint64(v9, "kWCMCellularSetAntBlocking_Policy_CellularBandInfo_Band");
      v15 = xpc_dictionary_get_uint64(v9, "kWCMCellularSetAntBlocking_Policy_CellularBandInfo_CoexTech");
      v16 = xpc_dictionary_get_uint64(v9, "kWCMCellularSetAntBlocking_Policy_CellularBandInfo_CenterFreq");
      v17 = xpc_dictionary_get_uint64(v9, "kWCMCellularSetAntBlocking_Policy_CellularBandInfo_Bandwidth");
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver: Set UWB Antenna Blk Policy -- policy[%lu]: enable = %d, cellularAntBitmap = %llu, cellularTxPowerCap = %llu, mitigationType = %llu"), v7, v10, v11, int64, v13);
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver: Set UWB Antenna Blk Policy -- policy[%lu]: cellularBand = %llu, cellularCoexTech = %llu, frequency = %lluKHz, BW = %lluKHz"), v7, v14, v15, v16, v17);

      v5 = v31;
      ++v7;
    }
    while (v30 != v7);
  }
  v18 = xpc_dictionary_get_value(xdict, "kWCMCellularSetAntBlocking_PriorityClassPolicy");
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  v20 = xpc_array_get_count(v19);
  if (v20)
  {
    v21 = v20;
    for (i = 0; i != v21; ++i)
    {
      v23 = xpc_array_get_value(v19, i);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
      v25 = xpc_dictionary_get_BOOL(v24, "kWCMCellularSetAntBlocking_PriorityClassPolicy_Enable");
      v26 = xpc_dictionary_get_BOOL(v24, "kWCMCellularSetAntBlocking_PriorityClassPolicy_DenyProtectVoice");
      v27 = xpc_dictionary_get_BOOL(v24, "kWCMCellularSetAntBlocking_PriorityClassPolicy_NeedMitigation");
      v28 = xpc_dictionary_get_uint64(v24, "kWCMCellularSetAntBlocking_PriorityClassPolicy_PriorityClass");
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver: Set UWB Antenna Blk Policy -- priorityPolicy[%lu]: enable = %d, priorityClass = %llu, mitigationTimer = %llu"), i, v25, v28, xpc_dictionary_get_uint64(v24, "kWCMCellularSetAntBlocking_PriorityClassPolicy_MitigationTimer"));
      +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Coex ARI driver: Set UWB Antenna Blk Policy -- priorityPolicy[%lu]: denyVoiceProtect = %d, mitigationRequired = %d"), i, v26, v27);

    }
  }

}

- (AntBlockPowerLimitPolicyClientWiFiCam)mWiFiPolicy
{
  return self->_mWiFiPolicy;
}

- (void)setMWiFiPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_mWiFiPolicy, a3);
}

- (AntBlockPowerLimitPolicyClientWiFiCam)mFrontCamPolicy
{
  return self->_mFrontCamPolicy;
}

- (void)setMFrontCamPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_mFrontCamPolicy, a3);
}

- (AntBlockPowerLimitPolicyClientWiFiCam)mFaceIdCamPolicy
{
  return self->_mFaceIdCamPolicy;
}

- (void)setMFaceIdCamPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_mFaceIdCamPolicy, a3);
}

- (AntBlockPowerLimitPolicyClientWiFiCam)mRearWideCamPolicy
{
  return self->_mRearWideCamPolicy;
}

- (void)setMRearWideCamPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_mRearWideCamPolicy, a3);
}

- (AntBlockPowerLimitPolicyClientWiFiCam)mRearUltraWideCamPolicy
{
  return self->_mRearUltraWideCamPolicy;
}

- (void)setMRearUltraWideCamPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_mRearUltraWideCamPolicy, a3);
}

- (AntBlockPowerLimitPolicyClientWiFiCam)mRearTeleCamPolicy
{
  return self->_mRearTeleCamPolicy;
}

- (void)setMRearTeleCamPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_mRearTeleCamPolicy, a3);
}

- (AntBlockPowerLimitPolicyClientUwb)mUwbPolicy
{
  return self->_mUwbPolicy;
}

- (void)setMUwbPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_mUwbPolicy, a3);
}

- (AntBlockPowerLimitPolicyClientWiFiCam)mE85Policy
{
  return self->_mE85Policy;
}

- (void)setME85Policy:(id)a3
{
  objc_storeStrong((id *)&self->_mE85Policy, a3);
}

- (AntBlockPowerLimitPolicyClientGnssImd)mGnssImdPolicy
{
  return self->_mGnssImdPolicy;
}

- (void)setMGnssImdPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_mGnssImdPolicy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mGnssImdPolicy, 0);
  objc_storeStrong((id *)&self->_mE85Policy, 0);
  objc_storeStrong((id *)&self->_mUwbPolicy, 0);
  objc_storeStrong((id *)&self->_mRearTeleCamPolicy, 0);
  objc_storeStrong((id *)&self->_mRearUltraWideCamPolicy, 0);
  objc_storeStrong((id *)&self->_mRearWideCamPolicy, 0);
  objc_storeStrong((id *)&self->_mFaceIdCamPolicy, 0);
  objc_storeStrong((id *)&self->_mFrontCamPolicy, 0);
  objc_storeStrong((id *)&self->_mWiFiPolicy, 0);
  objc_storeStrong((id *)&self->mPlistFileName, 0);
}

@end
