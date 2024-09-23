@implementation AntBlockPowerLimitPolicyClientGnssImd

- (AntBlockPowerLimitPolicyClientGnssImd)init
{
  AntBlockPowerLimitPolicyClientGnssImd *v2;
  NSMutableArray *v3;
  NSMutableArray *mPolicy;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AntBlockPowerLimitPolicyClientGnssImd;
  v2 = -[AntBlockPowerLimitPolicyClientGnssImd init](&v6, "init");
  v2->_mDenyVoiceProtect = 0;
  v2->_mLqmThreshold = 0;
  v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  mPolicy = v2->_mPolicy;
  v2->_mPolicy = v3;

  v2->_mMitigationTimer_ms = 0;
  v2->_mProtectGnssLowPriority = 0;
  return v2;
}

- (void)setParameter:(BOOL)a3 lqmThreshold:(unsigned int)a4 MitigationTimer:(unsigned int)a5 ProtectGnssLowPriority:(BOOL)a6 L5TunerLqmThreshod:(unsigned int)a7
{
  self->_mDenyVoiceProtect = a3;
  self->_mL5TunerLqmThreshold = a7;
  self->_mMitigationTimer_ms = a5;
  self->_mProtectGnssLowPriority = a6;
  self->_mLqmThreshold = a4;
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

- (void)extractPolicy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  AntBlockPowerLimitGnssImdBasePolicy *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  AntBlockPowerLimitGnssImdAggressorPolicy *v26;
  AntBlockPowerLimitGnssImdAggressorPolicy *v27;
  void *v28;
  id obj;
  uint64_t v30;
  AntBlockPowerLimitPolicyClientGnssImd *v31;
  id v32;
  id v33;
  unsigned int v34;
  void *v35;
  unsigned int v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("Deny_Voice_Protect")));
    v36 = objc_msgSend(v6, "BOOLValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("LQM_Threshold")));
    v8 = objc_msgSend(v7, "integerValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("Mitigation_Timer_ms")));
    v10 = objc_msgSend(v9, "integerValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("Protect_GNSS_Low_Priority")));
    v12 = objc_msgSend(v11, "BOOLValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("L5_Tuner_LQM_Threshold")));
    v31 = self;
    -[AntBlockPowerLimitPolicyClientGnssImd setParameter:lqmThreshold:MitigationTimer:ProtectGnssLowPriority:L5TunerLqmThreshod:](self, "setParameter:lqmThreshold:MitigationTimer:ProtectGnssLowPriority:L5TunerLqmThreshod:", v36, v8, v10, v12, objc_msgSend(v13, "integerValue"));

    v28 = v5;
    obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", CFSTR("Policy")));
    if (obj)
    {
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      if (v32)
      {
        v30 = *(_QWORD *)v39;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v39 != v30)
              objc_enumerationMutation(obj);
            v15 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)v14);
            v16 = objc_alloc_init(AntBlockPowerLimitGnssImdBasePolicy);
            v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("Enable")));
            v34 = objc_msgSend(v37, "BOOLValue");
            v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("GNSS_IMD_Type")));
            v33 = objc_msgSend(v35, "integerValue");
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("GNSS_L5_Tuner_Allowed")));
            v18 = objc_msgSend(v17, "BOOLValue");
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("GNSS_IMD_Parallel_Mitigation_Allowed")));
            v20 = objc_msgSend(v19, "BOOLValue");
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("GNSS_Victim_Center_Frequency_KHz")));
            v22 = objc_msgSend(v21, "integerValue");
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("GNSS_Victim_Bandwidth_KHz")));
            -[AntBlockPowerLimitGnssImdBasePolicy setParameter:ImdType:GnssL5TunerAllowed:ParallelMitigationAllowed:GnssVictimFreq_KHz:GnssVictimBw_KHz:](v16, "setParameter:ImdType:GnssL5TunerAllowed:ParallelMitigationAllowed:GnssVictimFreq_KHz:GnssVictimBw_KHz:", v34, v33, v18, v20, v22, objc_msgSend(v23, "integerValue"));

            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("Cell_Band_1")));
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("Cell_Band_2")));
            v26 = objc_alloc_init(AntBlockPowerLimitGnssImdAggressorPolicy);
            v27 = objc_alloc_init(AntBlockPowerLimitGnssImdAggressorPolicy);
            -[AntBlockPowerLimitGnssImdAggressorPolicy extractPolicy:](v26, "extractPolicy:", v24);
            -[AntBlockPowerLimitGnssImdAggressorPolicy extractPolicy:](v27, "extractPolicy:", v25);
            -[AntBlockPowerLimitGnssImdBasePolicy setCellAggressor1:](v16, "setCellAggressor1:", v26);
            -[AntBlockPowerLimitGnssImdBasePolicy setCellAggressor2:](v16, "setCellAggressor2:", v27);
            -[AntBlockPowerLimitPolicyClientGnssImd addPolicy:](v31, "addPolicy:", v16);

            v14 = (char *)v14 + 1;
          }
          while (v32 != v14);
          v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
        }
        while (v32);
      }
    }

    v5 = v28;
  }

}

- (BOOL)mDenyVoiceProtect
{
  return self->_mDenyVoiceProtect;
}

- (void)setMDenyVoiceProtect:(BOOL)a3
{
  self->_mDenyVoiceProtect = a3;
}

- (unsigned)mLqmThreshold
{
  return self->_mLqmThreshold;
}

- (void)setMLqmThreshold:(unsigned int)a3
{
  self->_mLqmThreshold = a3;
}

- (unsigned)mL5TunerLqmThreshold
{
  return self->_mL5TunerLqmThreshold;
}

- (void)setML5TunerLqmThreshold:(unsigned int)a3
{
  self->_mL5TunerLqmThreshold = a3;
}

- (unsigned)mMitigationTimer_ms
{
  return self->_mMitigationTimer_ms;
}

- (void)setMMitigationTimer_ms:(unsigned int)a3
{
  self->_mMitigationTimer_ms = a3;
}

- (BOOL)mProtectGnssLowPriority
{
  return self->_mProtectGnssLowPriority;
}

- (void)setMProtectGnssLowPriority:(BOOL)a3
{
  self->_mProtectGnssLowPriority = a3;
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
