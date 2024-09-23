@implementation AntBlockPowerLimitPolicyClientUwb

- (AntBlockPowerLimitPolicyClientUwb)init
{
  AntBlockPowerLimitPolicyClientUwb *v2;
  NSMutableArray *v3;
  NSMutableArray *mPolicy;
  NSMutableArray *v5;
  NSMutableArray *mPriorityClassPolicy;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AntBlockPowerLimitPolicyClientUwb;
  v2 = -[AntBlockPowerLimitPolicyClientUwb init](&v8, "init");
  v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  mPolicy = v2->_mPolicy;
  v2->_mPolicy = v3;

  v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  mPriorityClassPolicy = v2->_mPriorityClassPolicy;
  v2->_mPriorityClassPolicy = v5;

  return v2;
}

- (void)setParameterDurationGranularity:(unsigned int)a3 LQMThreshold:(unsigned int)a4
{
  self->_mDurationGranularity = a3;
  self->_mLqmThreshold = a4;
}

- (void)extractPolicy:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  unsigned int v14;
  void *v15;
  unsigned int v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  void *v21;
  AntBlockPowerLimitUwbPriorityClassPolicy *v22;
  void *v23;
  void *v24;
  unsigned __int8 v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id obj;
  uint64_t v33;
  id v34;
  unsigned int v35;
  id v36;
  id v37;
  id v38;
  unsigned __int16 v39;
  unsigned int v40;
  void *v41;
  AntBlockPowerLimitUwbBasePolicy *v42;
  id v43;
  void *v44;
  uint64_t v45;
  void *v46;
  id v47;
  void *v48;
  unsigned int v49;
  AntBlockPowerLimitPolicyClientUwb *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  _BYTE v60[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("Duration_Granularity")));
  v6 = objc_msgSend(v5, "integerValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("LQM_Threshold")));
  v50 = self;
  -[AntBlockPowerLimitPolicyClientUwb setParameterDurationGranularity:LQMThreshold:](self, "setParameterDurationGranularity:LQMThreshold:", v6, objc_msgSend(v7, "integerValue"));

  v31 = v4;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("Policy")));
  if (obj)
  {
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
    if (v34)
    {
      v33 = *(_QWORD *)v56;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v56 != v33)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)v8);
          v42 = objc_alloc_init(AntBlockPowerLimitUwbBasePolicy);
          v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("Enable")));
          v40 = objc_msgSend(v48, "BOOLValue");
          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("Uwb_Channel")));
          v39 = (unsigned __int16)objc_msgSend(v46, "integerValue");
          v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("Uwb_Ant_Bitmap")));
          v38 = objc_msgSend(v44, "integerValue");
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("Cellular_Ant_Bitmap")));
          v37 = objc_msgSend(v41, "integerValue");
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("Mitigation_Type")));
          v36 = objc_msgSend(v10, "integerValue");
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("Cellular_TX_Power_Cap")));
          objc_msgSend(v11, "doubleValue");
          v35 = vcvtd_n_s64_f64(v12, 4uLL);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("Coex_Tech")));
          v14 = objc_msgSend(v13, "integerValue");
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("Cellular_Band")));
          v16 = objc_msgSend(v15, "integerValue");
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("Cellular_Center_Frequency_KHz")));
          v18 = objc_msgSend(v17, "integerValue");
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("Cellular_Bandwidth_KHz")));
          -[AntBlockPowerLimitUwbBasePolicy setParameterEnable:UwbChannel:UwbAntBitmap:CellularAntBitmap:MitigationType:CellularTxPowerCap:CoexTech:CellularBand:CellFreq:CellBW:](v42, "setParameterEnable:UwbChannel:UwbAntBitmap:CellularAntBitmap:MitigationType:CellularTxPowerCap:CoexTech:CellularBand:CellFreq:CellBW:", v40, v39, v38, v37, v36, v35, __PAIR64__(v16, v14), __PAIR64__(objc_msgSend(v19, "integerValue"), v18));

          -[AntBlockPowerLimitPolicyClientUwb addPolicy:](v50, "addPolicy:", v42);
          v8 = (char *)v8 + 1;
        }
        while (v34 != v8);
        v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v60, 16);
      }
      while (v34);
    }
  }
  v43 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKey:", CFSTR("Priority_Class_Policy")));
  if (v43)
  {
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v47 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
    if (v47)
    {
      v45 = *(_QWORD *)v52;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v52 != v45)
            objc_enumerationMutation(v43);
          v21 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)v20);
          v22 = objc_alloc_init(AntBlockPowerLimitUwbPriorityClassPolicy);
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKey:", CFSTR("Enable")));
          v49 = objc_msgSend(v23, "BOOLValue");
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKey:", CFSTR("Priority_Class")));
          v25 = objc_msgSend(v24, "integerValue");
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKey:", CFSTR("Mitigation_Required")));
          v27 = objc_msgSend(v26, "BOOLValue");
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKey:", CFSTR("Deny_Voice_Protect")));
          v29 = objc_msgSend(v28, "BOOLValue");
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKey:", CFSTR("Mitigation_Timer_ms")));
          -[AntBlockPowerLimitUwbPriorityClassPolicy setParameterEnable:PriorityClass:MitigationRequired:DenyVoiceProtect:MitigationTimer:](v22, "setParameterEnable:PriorityClass:MitigationRequired:DenyVoiceProtect:MitigationTimer:", v49, v25, v27, v29, objc_msgSend(v30, "integerValue"));

          -[AntBlockPowerLimitPolicyClientUwb addPriorityClassPolicy:](v50, "addPriorityClassPolicy:", v22);
          v20 = (char *)v20 + 1;
        }
        while (v47 != v20);
        v47 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v51, v59, 16);
      }
      while (v47);
    }
  }

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

- (void)addPriorityClassPolicy:(id)a3
{
  NSMutableArray *mPriorityClassPolicy;

  if (a3)
  {
    mPriorityClassPolicy = self->_mPriorityClassPolicy;
    if (mPriorityClassPolicy)
      -[NSMutableArray addObject:](mPriorityClassPolicy, "addObject:");
  }
}

- (id)constructXpcMessage
{
  xpc_object_t v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  xpc_object_t v10;
  xpc_object_t v11;
  id v12;
  id v13;
  uint64_t v14;
  void *j;
  void *v16;
  xpc_object_t v17;
  AntBlockPowerLimitPolicyClientUwb *v19;
  xpc_object_t xdict;
  NSMutableArray *obj;
  NSMutableArray *obja;
  xpc_object_t xarray;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];

  if (!-[NSMutableArray count](self->_mPolicy, "count"))
  {
    v4 = 0;
    return v4;
  }
  v3 = xpc_dictionary_create(0, 0, 0);
  v4 = v3;
  if (!v3)
    return v4;
  xpc_dictionary_set_uint64(v3, "kWCMCellularSetAntBlocking_LQMThreshold", self->_mLqmThreshold);
  xdict = v4;
  xpc_dictionary_set_uint64(v4, "kWCMCellularSetAntBlocking_DurationGranularity", self->_mDurationGranularity);
  xarray = xpc_array_create(0, 0);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v19 = self;
  obj = self->_mPolicy;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        v10 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_BOOL(v10, "kWCMCellularSetAntBlocking_Policy_Enable", (BOOL)objc_msgSend(v9, "mEnable", v19));
        xpc_dictionary_set_uint64(v10, "kWCMCellularSetAntBlocking_Policy_UwbChannel", objc_msgSend(v9, "mUwbChannel"));
        xpc_dictionary_set_uint64(v10, "kWCMCellularSetAntBlocking_Policy_UwbAntBitmap", objc_msgSend(v9, "mUwbAntBitmap"));
        xpc_dictionary_set_uint64(v10, "kWCMCellularSetAntBlocking_Policy_CellularAntBitmap", objc_msgSend(v9, "mCellularAntBitmap"));
        xpc_dictionary_set_int64(v10, "kWCMCellularSetAntBlocking_Policy_CellularPowerCap", (int)objc_msgSend(v9, "mCellularTxPowerCap"));
        xpc_dictionary_set_uint64(v10, "kWCMCellularSetAntBlocking_Policy_MitigationType", objc_msgSend(v9, "mMitigationType"));
        xpc_dictionary_set_uint64(v10, "kWCMCellularSetAntBlocking_Policy_CellularBandInfo_Band", objc_msgSend(v9, "mCellularBand"));
        xpc_dictionary_set_uint64(v10, "kWCMCellularSetAntBlocking_Policy_CellularBandInfo_CoexTech", objc_msgSend(v9, "mCellularCoexTech"));
        xpc_dictionary_set_uint64(v10, "kWCMCellularSetAntBlocking_Policy_CellularBandInfo_CenterFreq", objc_msgSend(v9, "mCellularFrequencyKHz"));
        xpc_dictionary_set_uint64(v10, "kWCMCellularSetAntBlocking_Policy_CellularBandInfo_Bandwidth", objc_msgSend(v9, "mCellularBandwidthKHz"));
        xpc_array_append_value(xarray, v10);

      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v6);
  }

  xpc_dictionary_set_value(v4, "kWCMCellularSetAntBlocking_PolicySet", xarray);
  v11 = xpc_array_create(0, 0);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obja = v19->_mPriorityClassPolicy;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v25;
    do
    {
      for (j = 0; j != v13; j = (char *)j + 1)
      {
        if (*(_QWORD *)v25 != v14)
          objc_enumerationMutation(obja);
        v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)j);
        v17 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_BOOL(v17, "kWCMCellularSetAntBlocking_PriorityClassPolicy_Enable", (BOOL)objc_msgSend(v16, "mEnable"));
        xpc_dictionary_set_BOOL(v17, "kWCMCellularSetAntBlocking_PriorityClassPolicy_DenyProtectVoice", (BOOL)objc_msgSend(v16, "mDenyVoiceProtect"));
        xpc_dictionary_set_BOOL(v17, "kWCMCellularSetAntBlocking_PriorityClassPolicy_NeedMitigation", (BOOL)objc_msgSend(v16, "mMitigationRequired"));
        xpc_dictionary_set_uint64(v17, "kWCMCellularSetAntBlocking_PriorityClassPolicy_PriorityClass", objc_msgSend(v16, "mPriorityClass"));
        xpc_dictionary_set_uint64(v17, "kWCMCellularSetAntBlocking_PriorityClassPolicy_MitigationTimer", objc_msgSend(v16, "mMitigationTimer"));
        xpc_array_append_value(v11, v17);

      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v13);
  }

  xpc_dictionary_set_value(xdict, "kWCMCellularSetAntBlocking_PriorityClassPolicy", v11);
  return xdict;
}

- (unsigned)mDurationGranularity
{
  return self->_mDurationGranularity;
}

- (void)setMDurationGranularity:(unsigned int)a3
{
  self->_mDurationGranularity = a3;
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

- (NSMutableArray)mPriorityClassPolicy
{
  return self->_mPriorityClassPolicy;
}

- (void)setMPriorityClassPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_mPriorityClassPolicy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mPriorityClassPolicy, 0);
  objc_storeStrong((id *)&self->_mPolicy, 0);
}

@end
