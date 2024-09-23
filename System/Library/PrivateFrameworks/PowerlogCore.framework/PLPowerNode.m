@implementation PLPowerNode

- (PLPowerNode)initWithName:(id)a3 withFGEnergy:(double)a4 withBGEnergy:(double)a5 withFGTime:(double)a6 withBGTime:(double)a7 withBGAudioTime:(double)a8 withBGLocationTime:(double)a9 withRootNodeEnergyRows:(id)a10
{
  id v19;
  id v20;
  PLPowerNode *v21;
  objc_super v23;

  v19 = a3;
  v20 = a10;
  if (v19)
  {
    v23.receiver = self;
    v23.super_class = (Class)PLPowerNode;
    v21 = -[PLPowerNode init](&v23, sel_init);
    self = v21;
    if (v21)
    {
      objc_storeStrong((id *)&v21->_name, a3);
      self->_fgEnergy = a4;
      self->_bgEnergy = a5;
      self->_fgTime = a6;
      self->_bgTime = a7;
      self->_bgAudioTime = a8;
      self->_bgLocationTime = a9;
      objc_storeStrong((id *)&self->_rootNodeEnergyRows, a10);
    }
  }

  return self;
}

- (id)energy
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[2];
  _QWORD v31[2];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[PLPowerNode rootNodeEnergyRows](self, "rootNodeEnergyRows");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v27 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("RootNodeID"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "intValue");

        if (v11)
        {
          objc_msgSend(&unk_1E6AF5EE8, "objectAtIndexedSubscript:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("FGEnergy"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "doubleValue");
          v15 = v14;

          objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("BGEnergy"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "doubleValue");
          v18 = v17;

          -[PLPowerNode fgTime](self, "fgTime");
          if (v19 <= 60.0 || (v19 = v15 / 1000.0, v15 / 1000.0 <= 0.0))
          {
            objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E6ABACB8, v12, v19);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", llround(v19));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, v12);

          }
          -[PLPowerNode bgTime](self, "bgTime");
          if (v21 <= 60.0 || (v21 = v18 / 1000.0, v18 / 1000.0 <= 0.0))
          {
            objc_msgSend(v4, "setObject:forKeyedSubscript:", &unk_1E6ABACB8, v12, v21);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", llround(v21));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v22, v12);

          }
        }
      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    }
    while (v6);
  }

  v30[0] = CFSTR("fg");
  v30[1] = CFSTR("bg");
  v31[0] = v3;
  v31[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)time
{
  void *v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[3];
  _QWORD v19[3];
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v20[0] = CFSTR("fg");
  v3 = (void *)MEMORY[0x1E0CB37E8];
  -[PLPowerNode fgTime](self, "fgTime");
  objc_msgSend(v3, "numberWithLong:", llround(v4));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = CFSTR("bg");
  v21[0] = v5;
  v18[0] = CFSTR("total");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[PLPowerNode bgTime](self, "bgTime");
  objc_msgSend(v6, "numberWithLong:", llround(v7));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v8;
  v18[1] = CFSTR("audio");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[PLPowerNode bgAudioTime](self, "bgAudioTime");
  objc_msgSend(v9, "numberWithLong:", llround(v10));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v11;
  v18[2] = CFSTR("location");
  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[PLPowerNode bgLocationTime](self, "bgLocationTime");
  objc_msgSend(v12, "numberWithLong:", llround(v13));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)serialize
{
  PLValueComparison *v3;
  void *v4;
  PLValueComparison *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  const __CFString *v13;
  void *v14;
  uint64_t v15;
  const __CFString *v16;
  uint64_t v17;
  const __CFString *v18;
  uint64_t v19;
  const __CFString *v20;
  const __CFString *v21;
  void *v22;
  const __CFString *v23;
  int v24;
  const __CFString *v25;
  void *v26;
  __CFString *v27;
  void *v28;
  PLValueComparison *v29;
  __CFString *v30;
  void *v31;
  void *v32;
  void *v34;
  __CFString *v35;
  __CFString *v36;
  __CFString *v37;
  __CFString *v38;
  __CFString *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  _QWORD v47[12];
  _QWORD v48[12];
  _QWORD v49[3];

  v49[1] = *MEMORY[0x1E0C80C00];
  v3 = [PLValueComparison alloc];
  -[PLPowerNode name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PLValueComparison initWithKey:withValue:withComparisonOperation:](v3, "initWithKey:withValue:withComparisonOperation:", CFSTR("AppBundleId"), v4, 0);

  +[PowerlogCore sharedCore](PowerlogCore, "sharedCore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "storage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lastEntryForKey:withComparisons:isSingleton:", CFSTR("PLApplicationAgent_EventNone_AllApps"), v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9
    && (objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AppIs3rdParty")),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "BOOLValue"),
        v10,
        v11))
  {
    v47[0] = CFSTR("app_bundleid");
    -[PLPowerNode name](self, "name");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = v46;
    v47[1] = CFSTR("app_build_version");
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AppBuildVersion"));
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AppBuildVersion"));
      v13 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = &stru_1E6A56538;
    }
    v39 = (__CFString *)v13;
    v48[1] = v13;
    v47[2] = CFSTR("app_version");
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AppBundleVersion"));
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AppBundleVersion"));
      v16 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = &stru_1E6A56538;
    }
    v38 = (__CFString *)v16;
    v48[2] = v16;
    v47[3] = CFSTR("app_sessionreporter_key");
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AppVendorID"));
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AppVendorID"));
      v18 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = &stru_1E6A56538;
    }
    v37 = (__CFString *)v18;
    v48[3] = v18;
    v47[4] = CFSTR("app_adamid");
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AppItemID"));
    v19 = objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AppItemID"));
      v20 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = &stru_1E6A56538;
    }
    v36 = (__CFString *)v20;
    v48[4] = v20;
    v47[5] = CFSTR("app_cohort");
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AppCohort"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (void *)v12;
    if (v41)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AppCohort"));
      v21 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = &stru_1E6A56538;
    }
    v35 = (__CFString *)v21;
    v48[5] = v21;
    v47[6] = CFSTR("app_storefront");
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AppStoreFront"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AppStoreFront"));
      v23 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = &stru_1E6A56538;
    }
    v48[6] = v23;
    v47[7] = CFSTR("app_is_beta");
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AppIsBeta"), v23);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v40, "BOOLValue");
    v25 = CFSTR("false");
    if (v24)
      v25 = CFSTR("true");
    v48[7] = v25;
    v47[8] = CFSTR("app_arch");
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AppArchitecture"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (void *)v17;
    if (v26)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AppArchitecture"));
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v27 = &stru_1E6A56538;
    }
    v42 = (void *)v19;
    v44 = (void *)v15;
    v48[8] = v27;
    v47[9] = CFSTR("slice_uuid");
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AppUUID"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v5;
    if (v28)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("AppUUID"));
      v30 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v30 = &stru_1E6A56538;
    }
    v48[9] = v30;
    v47[10] = CFSTR("app_energy");
    -[PLPowerNode energy](self, "energy");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v48[10] = v31;
    v47[11] = CFSTR("app_time");
    -[PLPowerNode time](self, "time");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v48[11] = v32;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    v5 = v29;
    if (v26)

    if (v22)
    if (v41)

    if (v42)
    if (v43)

    if (v44)
    if (v45)

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (double)fgEnergy
{
  return self->_fgEnergy;
}

- (void)setFgEnergy:(double)a3
{
  self->_fgEnergy = a3;
}

- (double)bgEnergy
{
  return self->_bgEnergy;
}

- (void)setBgEnergy:(double)a3
{
  self->_bgEnergy = a3;
}

- (double)fgTime
{
  return self->_fgTime;
}

- (void)setFgTime:(double)a3
{
  self->_fgTime = a3;
}

- (double)bgTime
{
  return self->_bgTime;
}

- (void)setBgTime:(double)a3
{
  self->_bgTime = a3;
}

- (double)bgAudioTime
{
  return self->_bgAudioTime;
}

- (void)setBgAudioTime:(double)a3
{
  self->_bgAudioTime = a3;
}

- (double)bgLocationTime
{
  return self->_bgLocationTime;
}

- (void)setBgLocationTime:(double)a3
{
  self->_bgLocationTime = a3;
}

- (NSArray)rootNodeEnergyRows
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setRootNodeEnergyRows:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootNodeEnergyRows, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
