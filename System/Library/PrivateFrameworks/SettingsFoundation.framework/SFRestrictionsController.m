@implementation SFRestrictionsController

+ (id)restrictionSpecifiers
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  SFBundleForSettingsFoundationFramework();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v4 = (void *)MEMORY[0x24BDBCE70];
    objc_msgSend(v2, "pathForResource:ofType:", CFSTR("Restrictions"), CFSTR("plist"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryWithContentsOfFile:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "objectForKey:", CFSTR("items"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v3, "addObjectsFromArray:", v7);
    }
    v8 = (void *)MEMORY[0x24BDBCE70];
    objc_msgSend(v2, "pathForResource:ofType:", CFSTR("5.0~fmf"), CFSTR("plist"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dictionaryWithContentsOfFile:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "objectForKey:", CFSTR("items"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v3, "addObjectsFromArray:", v11);
    }
    v12 = (void *)MEMORY[0x24BDBCE70];
    objc_msgSend(v2, "pathForResource:ofType:", CFSTR("5.0~Restrictions-Assistant"), CFSTR("plist"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "dictionaryWithContentsOfFile:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "objectForKey:", CFSTR("items"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v3, "addObjectsFromArray:", v15);
    }
    v16 = (void *)objc_msgSend(v3, "copy");

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)TCCServices
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v8[12];

  v8[11] = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BEB38E8];
  v8[0] = *MEMORY[0x24BEB3830];
  v8[1] = v2;
  v3 = *MEMORY[0x24BEB38D8];
  v8[2] = *MEMORY[0x24BEB3840];
  v8[3] = v3;
  v4 = *MEMORY[0x24BEB3838];
  v8[4] = *MEMORY[0x24BEB38E0];
  v8[5] = v4;
  v5 = *MEMORY[0x24BEB3998];
  v8[6] = *MEMORY[0x24BEB38C0];
  v8[7] = v5;
  v6 = *MEMORY[0x24BEB3848];
  v8[8] = *MEMORY[0x24BEB38C8];
  v8[9] = v6;
  v8[10] = *MEMORY[0x24BEB38B8];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 11);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)setSpringBoardCapability:(id)a3 enabled:(BOOL)a4
{
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v10;
  id v11;

  v11 = a3;
  v5 = (void *)CFPreferencesCopyAppValue(CFSTR("SBParentalControlsCapabilities"), CFSTR("com.apple.springboard"));
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithArray:", v5);
  v7 = objc_msgSend(v6, "containsObject:", v11);
  if (a4)
  {
    if (v7)
      objc_msgSend(v6, "removeObject:", v11);
  }
  else if ((v7 & 1) == 0)
  {
    objc_msgSend(v6, "addObject:", v11);
  }
  v8 = objc_msgSend(v6, "count");
  if (v8 != objc_msgSend(v5, "count"))
  {
    CFPreferencesSetAppValue(CFSTR("SBParentalControlsCapabilities"), v6, CFSTR("com.apple.springboard"));
    CFPreferencesAppSynchronize(CFSTR("com.apple.springboard"));
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.locationd/Restrictions"), 0, 0, 1u);
    v10 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(v10, SFPreferencesAppChangedRestrictionsEnabledStateNotification, 0, 0, 1u);
  }

}

+ (void)resetRestrictions
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id obj;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD v57[4];
  _QWORD v58[4];
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  +[SFRestrictionsController restrictionSpecifiers](SFRestrictionsController, "restrictionSpecifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v2, "count") + 1);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v2, "count"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  obj = v2;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v54;
    v44 = *MEMORY[0x24BE637C8];
    v43 = (void *)*MEMORY[0x24BE638E8];
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v54 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKey:", CFSTR("MCFeature"), v43);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKey:", CFSTR("capability"));
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = (void *)v9;
        if (v8)
        {
          objc_msgSend(v7, "objectForKey:", CFSTR("MCFeatureIsBool"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "BOOLValue");

          if (v12)
          {
            objc_msgSend(v48, "defaultParametersForBoolSetting:", v8);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (v13)
            {
              objc_msgSend(v45, "setObject:forKey:", v13, v8);
              if (objc_msgSend(v8, "isEqualToString:", v44))
              {
                v14 = v45;
                v15 = v13;
                v16 = v43;
                goto LABEL_14;
              }
            }
            else
            {
              objc_msgSend(v48, "removeBoolSetting:", v8);
            }
          }
          else
          {
            objc_msgSend(v48, "defaultParametersForValueSetting:", v8);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = v46;
            v15 = v13;
            v16 = v8;
LABEL_14:
            objc_msgSend(v14, "setObject:forKey:", v15, v16);
          }

          objc_msgSend(v7, "objectForKey:", CFSTR("PostNotification"));
          v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
            CFNotificationCenterPostNotification(DarwinNotifyCenter, v17, 0, 0, 1u);
          }

          goto LABEL_19;
        }
        if (v9)
          +[SFRestrictionsController setSpringBoardCapability:enabled:](SFRestrictionsController, "setSpringBoardCapability:enabled:", v9, 1);
LABEL_19:

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v60, 16);
    }
    while (v4);
  }

  +[SFRestrictionsController TCCServices](SFRestrictionsController, "TCCServices");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v50;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v50 != v22)
          objc_enumerationMutation(v19);
        +[SFRestrictionsController setSpringBoardCapability:enabled:](SFRestrictionsController, "setSpringBoardCapability:enabled:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * j), 1);
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v49, v59, 16);
    }
    while (v21);
  }
  v24 = *MEMORY[0x24BE63B10];
  objc_msgSend(v48, "defaultParametersForBoolSetting:", *MEMORY[0x24BE63B10]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setObject:forKeyedSubscript:", v25, v24);

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = *MEMORY[0x24BE63B18];
  objc_msgSend(v48, "defaultParametersForIntersectionSetting:", *MEMORY[0x24BE63B18]);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v28, v27);

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = *MEMORY[0x24BE63B20];
  objc_msgSend(v48, "defaultParametersForUnionSetting:", *MEMORY[0x24BE63B20]);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setObject:forKeyedSubscript:", v31, v30);

  v32 = *MEMORY[0x24BE637D8];
  objc_msgSend(v48, "defaultParametersForBoolSetting:", *MEMORY[0x24BE637D8]);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setObject:forKeyedSubscript:", v33, v32);

  v34 = *MEMORY[0x24BE637D0];
  objc_msgSend(v48, "defaultParametersForBoolSetting:", *MEMORY[0x24BE637D0]);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setObject:forKeyedSubscript:", v35, v34);

  v36 = *MEMORY[0x24BE637A8];
  objc_msgSend(v48, "defaultParametersForBoolSetting:", *MEMORY[0x24BE637A8]);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setObject:forKeyedSubscript:", v37, v36);

  v38 = *MEMORY[0x24BE63850];
  objc_msgSend(v48, "defaultParametersForBoolSetting:", *MEMORY[0x24BE63850]);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setObject:forKeyedSubscript:", v39, v38);

  v40 = *MEMORY[0x24BE63B90];
  v57[0] = *MEMORY[0x24BE63B80];
  v57[1] = v40;
  v58[0] = v45;
  v58[1] = v46;
  v41 = *MEMORY[0x24BE63BB8];
  v57[2] = *MEMORY[0x24BE63B48];
  v57[3] = v41;
  v58[2] = v26;
  v58[3] = v29;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v58, v57, 4);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "setParametersForSettingsByType:", v42);

}

+ (void)resetRestrictionsPassword
{
  +[SFRestrictionsPasscodeController setPIN:](SFRestrictionsPasscodeController, "setPIN:", 0);
  +[SFRestrictionsController resetRestrictions](SFRestrictionsController, "resetRestrictions");
}

@end
