@implementation AntBlockPowerLimitPolicyClientWiFiCam

- (AntBlockPowerLimitPolicyClientWiFiCam)init
{
  AntBlockPowerLimitPolicyClientWiFiCam *v2;
  NSMutableArray *v3;
  NSMutableArray *mPolicy;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AntBlockPowerLimitPolicyClientWiFiCam;
  v2 = -[AntBlockPowerLimitPolicyClientWiFiCam init](&v6, "init");
  v2->_mClient = 100;
  v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  mPolicy = v2->_mPolicy;
  v2->_mPolicy = v3;

  return v2;
}

- (AntBlockPowerLimitPolicyClientWiFiCam)initWithClient:(unsigned int)a3
{
  AntBlockPowerLimitPolicyClientWiFiCam *v4;
  NSMutableArray *v5;
  NSMutableArray *mPolicy;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AntBlockPowerLimitPolicyClientWiFiCam;
  v4 = -[AntBlockPowerLimitPolicyClientWiFiCam init](&v8, "init");
  v4->_mClient = a3;
  v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  mPolicy = v4->_mPolicy;
  v4->_mPolicy = v5;

  return v4;
}

- (void)setParameterDenyVoiceProtect:(BOOL)a3 MitigationTimer:(unsigned int)a4 DurationGranularity:(unsigned int)a5 LQMThreshold:(unsigned int)a6
{
  self->_mDenyVoiceProtect = a3;
  self->_mDurationGranularity = a5;
  self->_mMitigationTimer = a4;
  self->_mLqmThreshold = a6;
}

- (void)extractPolicy:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *i;
  void *v17;
  unsigned int mClient;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  unsigned int v27;
  void *v28;
  void *v29;
  id v30;
  id obj;
  uint64_t v32;
  AntBlockPowerLimitPolicyClientWiFiCam *v33;
  id v34;
  id v35;
  id v36;
  unsigned int v37;
  void *v38;
  void *v39;
  void *v40;
  AntBlockPowerLimitWiFiCamBasePolicy *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];

  v4 = a3;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Extract antenna blocking/Power limiting policy for client %u"), self->_mClient);
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("Deny_Voice_Protect")));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("Deny_Voice_Protect")));
    v5 = objc_msgSend(v6, "BOOLValue");

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("Mitigation_Timer_ms")));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("Mitigation_Timer_ms")));
    v9 = objc_msgSend(v8, "integerValue");

  }
  else
  {
    v9 = 0;
  }
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("Duration_Granularity")));

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("Duration_Granularity")));
    v10 = objc_msgSend(v11, "integerValue");

  }
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("LQM_Threshold")));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("LQM_Threshold")));
    v12 = objc_msgSend(v13, "integerValue");

  }
  -[AntBlockPowerLimitPolicyClientWiFiCam setParameterDenyVoiceProtect:MitigationTimer:DurationGranularity:LQMThreshold:](self, "setParameterDenyVoiceProtect:MitigationTimer:DurationGranularity:LQMThreshold:", v5, v9, v10, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("Policy")));
  v15 = v14;
  if (!v14)
  {
    +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("No policies found for client %u"), self->_mClient);
    goto LABEL_25;
  }
  v30 = v4;
  +[WCM_Logging logLevel:message:](WCM_Logging, "logLevel:message:", 3, CFSTR("Extracted %lu policies for client %u"), objc_msgSend(v14, "count"), self->_mClient);
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v29 = v15;
  obj = v15;
  v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (!v34)
    goto LABEL_23;
  v32 = *(_QWORD *)v43;
  v33 = self;
  do
  {
    for (i = 0; i != v34; i = (char *)i + 1)
    {
      if (*(_QWORD *)v43 != v32)
        objc_enumerationMutation(obj);
      v17 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)i);
      v41 = objc_alloc_init(AntBlockPowerLimitWiFiCamBasePolicy);
      mClient = self->_mClient;
      if (mClient == 6)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKey:", CFSTR("USB_Rate")));
        -[AntBlockPowerLimitWiFiCamBasePolicy setParameterUsbRate:](v41, "setParameterUsbRate:", objc_msgSend(v19, "integerValue"));
      }
      else
      {
        if (mClient)
          goto LABEL_21;
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKey:", CFSTR("Condition_Id")));
        -[AntBlockPowerLimitWiFiCamBasePolicy setParameterConditionId:](v41, "setParameterConditionId:", objc_msgSend(v19, "integerValue"));
      }

LABEL_21:
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKey:", CFSTR("Enable")));
      v37 = objc_msgSend(v40, "BOOLValue");
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKey:", CFSTR("Cellular_Ant_Bitmap")));
      v36 = objc_msgSend(v39, "integerValue");
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKey:", CFSTR("Mitigation_Type")));
      v35 = objc_msgSend(v38, "integerValue");
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKey:", CFSTR("Cellular_TX_Power_Cap")));
      objc_msgSend(v20, "doubleValue");
      LODWORD(self) = vcvtd_n_s64_f64(v21, 4uLL);
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKey:", CFSTR("Coex_Tech")));
      v23 = objc_msgSend(v22, "integerValue");
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKey:", CFSTR("Cellular_Band")));
      v25 = objc_msgSend(v24, "integerValue");
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKey:", CFSTR("Cellular_Center_Frequency_KHz")));
      v27 = objc_msgSend(v26, "integerValue");
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKey:", CFSTR("Cellular_Bandwidth_KHz")));
      -[AntBlockPowerLimitWiFiCamBasePolicy setParameterEnable:CellularAntBitmap:MitigationType:CellularTxPowerCap:CoexTech:CellularBand:CellFreq:CellBW:](v41, "setParameterEnable:CellularAntBitmap:MitigationType:CellularTxPowerCap:CoexTech:CellularBand:CellFreq:CellBW:", v37, v36, v35, self, v23, v25, __PAIR64__(objc_msgSend(v28, "integerValue"), v27));

      self = v33;
      -[AntBlockPowerLimitPolicyClientWiFiCam addPolicy:](v33, "addPolicy:", v41);

    }
    v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  }
  while (v34);
LABEL_23:

  v15 = v29;
  v4 = v30;
LABEL_25:

}

- (void)addPolicy:(id)a3
{
  NSMutableArray *mPolicy;

  if (a3)
  {
    mPolicy = self->_mPolicy;
    if (mPolicy)
      -[NSMutableArray addObject:](mPolicy, "addObject:");
  }
}

- (id)constructXpcMessage
{
  xpc_object_t v3;
  void *v4;
  unsigned int mClient;
  const char *v6;
  const char *v7;
  uint64_t v8;
  xpc_object_t v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  xpc_object_t v15;
  unsigned int v16;
  unsigned int v17;
  const char *v18;
  NSMutableArray *obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  if (!-[NSMutableArray count](self->_mPolicy, "count"))
  {
    v4 = 0;
    return v4;
  }
  v3 = xpc_dictionary_create(0, 0, 0);
  v4 = v3;
  if (!v3)
    return v4;
  mClient = self->_mClient;
  v6 = "kWCMCellularSetAntBlocking_LQMThreshold";
  v7 = "kWCMCellularSetAntBlocking_CameraId";
  v8 = 24;
  switch(mClient)
  {
    case 0u:
      xpc_dictionary_set_uint64(v3, "kWCMCellularSetAntBlocking_LQMThreshold", self->_mLqmThreshold);
      v6 = "kWCMCellularSetAntBlocking_DurationGranularity";
      v8 = 16;
      goto LABEL_5;
    case 2u:
    case 3u:
    case 4u:
    case 5u:
    case 8u:
      goto LABEL_6;
    case 6u:
LABEL_5:
      mClient = *(_DWORD *)((char *)&self->super.isa + v8);
      v7 = v6;
LABEL_6:
      xpc_dictionary_set_uint64(v4, v7, mClient);
      break;
    default:
      break;
  }
  xpc_dictionary_set_BOOL(v4, "kWCMCellularSetAntBlocking_DenyProtectVoice", self->_mDenyVoiceProtect);
  xpc_dictionary_set_uint64(v4, "kWCMCellularSetAntBlocking_MitigationTimer", self->_mMitigationTimer);
  v9 = xpc_array_create(0, 0);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = self->_mPolicy;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v15 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_BOOL(v15, "kWCMCellularSetAntBlocking_Policy_Enable", (BOOL)objc_msgSend(v14, "mEnable"));
        xpc_dictionary_set_uint64(v15, "kWCMCellularSetAntBlocking_Policy_CellularAntBitmap", objc_msgSend(v14, "mCellularAntBitmap"));
        xpc_dictionary_set_int64(v15, "kWCMCellularSetAntBlocking_Policy_CellularPowerCap", (int)objc_msgSend(v14, "mCellularTxPowerCap"));
        xpc_dictionary_set_uint64(v15, "kWCMCellularSetAntBlocking_Policy_MitigationType", objc_msgSend(v14, "mMitigationType"));
        xpc_dictionary_set_uint64(v15, "kWCMCellularSetAntBlocking_Policy_CellularBandInfo_Band", objc_msgSend(v14, "mCellularBand"));
        xpc_dictionary_set_uint64(v15, "kWCMCellularSetAntBlocking_Policy_CellularBandInfo_CoexTech", objc_msgSend(v14, "mCellularCoexTech"));
        xpc_dictionary_set_uint64(v15, "kWCMCellularSetAntBlocking_Policy_CellularBandInfo_CenterFreq", objc_msgSend(v14, "mCellularFrequencyKHz"));
        xpc_dictionary_set_uint64(v15, "kWCMCellularSetAntBlocking_Policy_CellularBandInfo_Bandwidth", objc_msgSend(v14, "mCellularBandwidthKHz"));
        v16 = self->_mClient;
        if (v16 == 6)
        {
          v17 = objc_msgSend(v14, "mUsbRate");
          v18 = "kWCMCellularSetAntBlocking_Policy_UsbRate";
        }
        else
        {
          if (v16)
            goto LABEL_17;
          v17 = objc_msgSend(v14, "mConditionId");
          v18 = "kWCMCellularSetAntBlocking_Policy_ConditionId";
        }
        xpc_dictionary_set_uint64(v15, v18, v17);
LABEL_17:
        xpc_array_append_value(v9, v15);

      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }

  xpc_dictionary_set_value(v4, "kWCMCellularSetAntBlocking_PolicySet", v9);
  return v4;
}

- (unsigned)mClient
{
  return self->_mClient;
}

- (void)setMClient:(unsigned int)a3
{
  self->_mClient = a3;
}

- (BOOL)mDenyVoiceProtect
{
  return self->_mDenyVoiceProtect;
}

- (void)setMDenyVoiceProtect:(BOOL)a3
{
  self->_mDenyVoiceProtect = a3;
}

- (unsigned)mDurationGranularity
{
  return self->_mDurationGranularity;
}

- (void)setMDurationGranularity:(unsigned int)a3
{
  self->_mDurationGranularity = a3;
}

- (unsigned)mMitigationTimer
{
  return self->_mMitigationTimer;
}

- (void)setMMitigationTimer:(unsigned int)a3
{
  self->_mMitigationTimer = a3;
}

- (unsigned)mLqmThreshold
{
  return self->_mLqmThreshold;
}

- (void)setMLqmThreshold:(unsigned int)a3
{
  self->_mLqmThreshold = a3;
}

- (NSMutableArray)mPolicy
{
  return self->_mPolicy;
}

- (void)setMPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_mPolicy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mPolicy, 0);
}

@end
