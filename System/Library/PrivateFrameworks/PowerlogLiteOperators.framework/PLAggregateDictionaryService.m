@implementation PLAggregateDictionaryService

void __61__PLAggregateDictionaryService_registerForAudioNotifications__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  const __CFString *v31;
  uint64_t v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  _QWORD block[5];
  uint8_t buf[4];
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("entry"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "localCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "localCache");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v6, *(_QWORD *)(a1 + 40));

  if (v6)
  {
    if (v8)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Active"));
      v10 = objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = (void *)v10;
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ActivePID"));
        v12 = objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = (void *)v12;
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ActiveRoute"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            objc_msgSend(v6, "entryDate");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "entryDate");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "timeIntervalSinceDate:", v16);
            v18 = v17;

            objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Active"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v16) = objc_msgSend(v19, "isEqual:", MEMORY[0x1E0C9AAB0]);

            if ((_DWORD)v16)
            {
              v20 = (void *)objc_opt_new();
              objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ActivePID"));
              v21 = (void *)objc_claimAutoreleasedReturnValue();

              if (v21)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.power.audio.NowPlayingApp.%@"), &stru_1E8587D00);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(a1 + 32), "addToDurationScalarKey:withDuration:", v22, v18);
                objc_msgSend(v20, "setObject:forKeyedSubscript:", &stru_1E8587D00, CFSTR("bundleID"));

              }
              objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ActiveRoute"));
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = objc_msgSend(v23, "plCompare:", CFSTR("Speaker"));

              if (v24)
              {
                objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ActiveRoute"));
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                v26 = objc_msgSend(v25, "plCompare:", CFSTR("Headphone"));

                if (v26)
                {
                  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ActiveRoute"));
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  v28 = objc_msgSend(v27, "plCompare:", CFSTR("HeadphonesBT"));

                  if (v28)
                  {
                    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ActiveRoute"));
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    v30 = objc_msgSend(v29, "plCompare:", CFSTR("Headset"));

                    if (v30)
                    {
LABEL_26:
                      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ActiveRoute"));
                      v39 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v20, "setObject:forKeyedSubscript:", v39, CFSTR("activeRoute"));

                      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v18);
                      v40 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v20, "setObject:forKeyedSubscript:", v40, CFSTR("duration"));

                      v33 = v20;
                      AnalyticsSendEventLazy();

LABEL_27:
                      goto LABEL_28;
                    }
                    v31 = CFSTR("com.apple.power.audio.headset.duration");
                  }
                  else
                  {
                    v31 = CFSTR("com.apple.power.audio.headphonesbt.duration");
                  }
                }
                else
                {
                  v31 = CFSTR("com.apple.power.audio.headphone.duration");
                }
              }
              else
              {
                v31 = CFSTR("com.apple.power.audio.speaker.duration");
              }
              objc_msgSend(*(id *)(a1 + 32), "addToDurationScalarKey:withDuration:", v31, v18);
              goto LABEL_26;
            }
          }
        }
        else
        {

        }
      }
    }
  }
  else if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v32 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__PLAggregateDictionaryService_registerForAudioNotifications__block_invoke_2;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v32;
    if (qword_1ED885BB0 != -1)
      dispatch_once(&qword_1ED885BB0, block);
    if (byte_1ED885B99)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("WARNING: PLEntryNotification for %@ triggered but lastEntry returns nil"), v5);
      v33 = (id)objc_claimAutoreleasedReturnValue();
      v34 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAggregateDictionaryService.m");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "lastPathComponent");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAggregateDictionaryService registerForAudioNotifications]_block_invoke");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "logMessage:fromFile:fromFunction:fromLineNumber:", v33, v36, v37, 260);

      PLLogCommon();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v43 = v33;
        _os_log_debug_impl(&dword_1CAF47000, v38, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      goto LABEL_27;
    }
  }
LABEL_28:

}

void __64__PLAggregateDictionaryService_registerForLocationNotifications__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  void *v23;
  int v24;
  void *v25;
  int v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  int v31;
  id v32;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("entry"));
  v32 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "localCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "localCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v32, *(_QWORD *)(a1 + 40));

  if (v4)
  {
    objc_msgSend(v32, "entryDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "entryDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "timeIntervalSinceDate:", v7);
    v9 = v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("accessory"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = objc_msgSend(v10, "isEqual:", MEMORY[0x1E0C9AAB0]);

    if ((_DWORD)v7)
      objc_msgSend(*(id *)(a1 + 32), "addToDurationScalarKey:withDuration:", CFSTR("com.apple.power.location.accessory.duration"), v9);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cell"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqual:", MEMORY[0x1E0C9AAB0]);

    if (v12)
      objc_msgSend(*(id *)(a1 + 32), "addToDurationScalarKey:withDuration:", CFSTR("com.apple.power.location.cell.duration"), v9);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("gps"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isEqual:", MEMORY[0x1E0C9AAB0]);

    if (v14)
      objc_msgSend(*(id *)(a1 + 32), "addToDurationScalarKey:withDuration:", CFSTR("com.apple.power.location.gps.duration"), v9);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("gps_coarse"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqual:", MEMORY[0x1E0C9AAB0]);

    if (v16)
      objc_msgSend(*(id *)(a1 + 32), "addToDurationScalarKey:withDuration:", CFSTR("com.apple.power.location.gps_coarse.duration"), v9);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("lac"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isEqual:", MEMORY[0x1E0C9AAB0]);

    if (v18)
      objc_msgSend(*(id *)(a1 + 32), "addToDurationScalarKey:withDuration:", CFSTR("com.apple.power.location.lac.duration"), v9);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("mcc"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEqual:", MEMORY[0x1E0C9AAB0]);

    if (v20)
      objc_msgSend(*(id *)(a1 + 32), "addToDurationScalarKey:withDuration:", CFSTR("com.apple.power.location.mcc.duration"), v9);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("nmea"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "isEqual:", MEMORY[0x1E0C9AAB0]);

    if (v22)
      objc_msgSend(*(id *)(a1 + 32), "addToDurationScalarKey:withDuration:", CFSTR("com.apple.power.location.nmea.duration"), v9);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pipeline"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "isEqual:", MEMORY[0x1E0C9AAB0]);

    if (v24)
      objc_msgSend(*(id *)(a1 + 32), "addToDurationScalarKey:withDuration:", CFSTR("com.apple.power.location.pipeline.duration"), v9);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("skyhook"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "isEqual:", MEMORY[0x1E0C9AAB0]);

    if (v26)
      objc_msgSend(*(id *)(a1 + 32), "addToDurationScalarKey:withDuration:", CFSTR("com.apple.power.location.skyhook.duration"), v9);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("wifi"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "isEqual:", MEMORY[0x1E0C9AAB0]);

    if (v28)
      objc_msgSend(*(id *)(a1 + 32), "addToDurationScalarKey:withDuration:", CFSTR("com.apple.power.location.wifi.duration"), v9);
    objc_msgSend(v4, "objectForKey:", CFSTR("wifi2"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("wifi2"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "isEqual:", MEMORY[0x1E0C9AAB0]);

      if (v31)
        objc_msgSend(*(id *)(a1 + 32), "addToDurationScalarKey:withDuration:", CFSTR("com.apple.power.location.wifi2.duration"), v9);
    }
  }

}

- (NSMutableDictionary)localCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 128, 1);
}

- (void)addToDurationScalarKey:(id)a3 withDuration:(double)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD block[5];
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v6 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__PLAggregateDictionaryService_addToDurationScalarKey_withDuration___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v6;
    if (qword_1ED885BA8 != -1)
      dispatch_once(&qword_1ED885BA8, block);
    if (_MergedGlobals_1_69)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("AGGD DURATION: %@ += %f"), v5, *(_QWORD *)&a4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAggregateDictionaryService.m");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastPathComponent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAggregateDictionaryService addToDurationScalarKey:withDuration:]");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "logMessage:fromFile:fromFunction:fromLineNumber:", v7, v10, v11, 241);

      PLLogCommon();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v15 = v7;
        _os_log_debug_impl(&dword_1CAF47000, v12, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
  MEMORY[0x1D179B7DC](v5, (uint64_t)a4);

}

void __67__PLAggregateDictionaryService_registerForApplicationNotifications__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  BOOL v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD block[5];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("entry"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("Identifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v2;
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("Reason"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    if (v6)
    {
      v7 = v6;
      v8 = 0x1E0D7F000uLL;
      v9 = *(_QWORD *)v26;
      v22 = v5;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v26 != v9)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v10), "unsignedIntegerValue");
          SBSProcessAssertionGetNameForReason();
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
            v12 = v3 == 0;
          else
            v12 = 1;
          if (!v12)
          {
            objc_msgSend(CFSTR("appBackgroundActiveReason."), "stringByAppendingString:", v11);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "stringByAppendingString:", CFSTR("."));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "stringByAppendingString:", v3);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            MEMORY[0x1D179B7DC](v21, 1);
LABEL_19:

            goto LABEL_20;
          }
          if (objc_msgSend(*(id *)(v8 + 4000), "debugEnabled"))
          {
            v13 = objc_opt_class();
            block[0] = MEMORY[0x1E0C809B0];
            block[1] = 3221225472;
            block[2] = __67__PLAggregateDictionaryService_registerForApplicationNotifications__block_invoke_2;
            block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
            block[4] = v13;
            if (qword_1ED885BE0 != -1)
              dispatch_once(&qword_1ED885BE0, block);
            if (byte_1ED885B9F)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("WARNING: reason or bundleid string for application notification is nil for entry %@"), v23);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = (void *)MEMORY[0x1E0D7FF98];
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAggregateDictionaryService.m");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "lastPathComponent");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAggregateDictionaryService registerForApplicationNotifications]_block_invoke");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "logMessage:fromFile:fromFunction:fromLineNumber:", v21, v16, v17, 599);

              PLLogCommon();
              v18 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412290;
                v30 = v21;
                _os_log_debug_impl(&dword_1CAF47000, v18, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
              }

              v5 = v22;
              v8 = 0x1E0D7F000;
              goto LABEL_19;
            }
          }
LABEL_20:

          ++v10;
        }
        while (v7 != v10);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
      }
      while (v7);
    }
  }

}

void __63__PLAggregateDictionaryService_registerForBatteryNotifications__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  unint64_t v4;
  id v6;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("entry"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Level"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");
  if (currentBatteryState <= 1 && v4 <= 1)
    MEMORY[0x1D179B7DC](CFSTR("com.apple.power.batterytraps"), 1);
  objc_msgSend(*(id *)(a1 + 32), "updateAggregateStateWithEntry:", v6);

}

- (void)updateAggregateStateWithEntry:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  _BOOL4 v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  _BOOL8 *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  uint64_t v20;
  double remainderUnpluggedTime;
  double v22;
  long double v23;
  _BOOL8 v24;
  double v25;
  double v26;
  int v27;
  _DWORD v28[2];
  double v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  id (*v33)(uint64_t);
  void *v34;
  long double v35;
  double v36;
  double v37;
  int v38;
  int v39;
  double v40;
  double v41;
  double v42;
  long double __y;
  _DWORD v44[2];
  double v45;
  double v46;
  int v47;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("AdapterInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "longValue");
  v7 = v6 != 0;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("RawLevel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  objc_msgSend(v4, "entryDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "timeIntervalSince1970");
  v13 = v12;

  -[PLAggregateDictionaryService last_state](self, "last_state");
  if (v47 == -1)
  {
    v44[0] = v6 != 0;
    v44[1] = 0;
    v45 = v10;
    v46 = v13;
    v16 = (_BOOL8 *)v44;
LABEL_20:
    -[PLAggregateDictionaryService setLast_state:](self, "setLast_state:", v16, v24, *(_QWORD *)&v25, *(_QWORD *)&v26);
    goto LABEL_21;
  }
  -[PLAggregateDictionaryService last_state](self, "last_state");
  v14 = v42 - v10;
  __y = v42 - v10;
  -[PLAggregateDictionaryService last_state](self, "last_state");
  v15 = v13 - v40;
  v41 = v13 - v40;
  -[PLAggregateDictionaryService last_state](self, "last_state");
  -[PLAggregateDictionaryService last_state](self, "last_state");
  if (!v38 && !v6)
  {
    if (fabs(v14) <= 1.0)
      goto LABEL_18;
LABEL_10:
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("NominalChargeCapacity"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
      v18 = CFSTR("NominalChargeCapacity");
    else
      v18 = CFSTR("AppleRawMaxCapacity");
    objc_msgSend(v4, "objectForKeyedSubscript:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "longValue");

    self->remainderUnpluggedEnergy = modf(v14 / 100.0 * (double)v20, &__y) + self->remainderUnpluggedEnergy;
    remainderUnpluggedTime = modf(v15, &v41) + self->remainderUnpluggedTime;
    self->remainderUnpluggedTime = remainderUnpluggedTime;
    v37 = 0.0;
    if (fabs(self->remainderUnpluggedEnergy) > 1.0)
    {
      self->remainderUnpluggedEnergy = modf(self->remainderUnpluggedEnergy, &v37);
      __y = v37 + __y;
      remainderUnpluggedTime = self->remainderUnpluggedTime;
    }
    v22 = v41;
    if (fabs(remainderUnpluggedTime) > 1.0)
    {
      self->remainderUnpluggedTime = modf(remainderUnpluggedTime, &v37);
      v22 = v22 + v37;
    }
    v23 = __y;
    MEMORY[0x1D179B7DC](CFSTR("com.apple.power.state.t_unplugged.energy"), (uint64_t)__y);
    MEMORY[0x1D179B7DC](CFSTR("com.apple.power.state.t_unplugged.duration"), (uint64_t)v22);
    v31 = MEMORY[0x1E0C809B0];
    v32 = 3221225472;
    v33 = __62__PLAggregateDictionaryService_updateAggregateStateWithEntry___block_invoke_2;
    v34 = &__block_descriptor_48_e19___NSDictionary_8__0l;
    v35 = v23;
    v36 = v22;
    AnalyticsSendEventLazy();
    v28[0] = v7;
    v28[1] = 0;
    v29 = v10;
    v30 = v13;
    v16 = (_BOOL8 *)v28;
    goto LABEL_20;
  }
  if (!v39 && v6)
  {
    MEMORY[0x1D179B7DC](CFSTR("com.apple.power.state.t_unplugged.count"), 1);
    AnalyticsSendEventLazy();
    goto LABEL_10;
  }
LABEL_18:
  -[PLAggregateDictionaryService last_state](self, "last_state");
  if (v27 == 1)
  {
    v24 = v6 != 0;
    v25 = v10;
    v26 = v13;
    v16 = &v24;
    goto LABEL_20;
  }
LABEL_21:

}

- (AggState)last_state
{
  AggState *result;

  objc_copyStruct(retstr, &self->_last_state, 24, 1, 0);
  return result;
}

- (void)setLast_state:(AggState *)a3
{
  objc_copyStruct(&self->_last_state, a3, 24, 1, 0);
}

void __72__PLAggregateDictionaryService_registerForBacklightLatencyNotifications__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unint64_t v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "objectForKey:", CFSTR("entry"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("backlightEnabledTimestamp"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  objc_msgSend(*(id *)(a1 + 32), "currentMachWakeTime");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  if (objc_msgSend(*(id *)(a1 + 32), "firstScreenOnAfterWake") && (unint64_t)v9)
  {
    v33 = v3;
    v32 = objc_msgSend(*(id *)(a1 + 32), "bucketWakeTime:", objc_msgSend(*(id *)(a1 + 32), "abstimeToNanosec:", (unint64_t)v6 - (unint64_t)v9)/ 0xF4240uLL);
    objc_msgSend(*(id *)(a1 + 32), "wakeReasons");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "componentsSeparatedByString:", CFSTR(" "));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "setWakeReasonString:", CFSTR("com.apple.performance.wake_latency.other"));
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v12 = v11;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v35;
LABEL_5:
      v16 = 0;
      while (1)
      {
        if (*(_QWORD *)v35 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v16);
        objc_msgSend(*(id *)(a1 + 32), "validReasonsDictionary");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "allKeys");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "containsObject:", v17);

        if (v20)
        {
          v21 = *(void **)(a1 + 32);
          objc_msgSend(v21, "validReasonsDictionary");
          v22 = objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)v22, "objectForKeyedSubscript:", v17);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("aggdKey"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setWakeReasonString:", v24);

          objc_msgSend(*(id *)(a1 + 32), "validReasonsDictionary");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "objectForKeyedSubscript:", v17);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("isUserEvent"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v22) = objc_msgSend(v27, "BOOLValue");

          if ((v22 & 1) != 0)
            break;
        }
        if (v14 == ++v16)
        {
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
          if (v14)
            goto LABEL_5;
          break;
        }
      }
    }

    v28 = *(void **)(a1 + 32);
    objc_msgSend(v28, "wakeReasonString");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "logDuration:asDistribution:", v29, (double)v32);

    objc_msgSend(*(id *)(a1 + 32), "setFirstScreenOnAfterWake:", 0);
    v30 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setCurrentMachWakeTime:", v31);

    v3 = v33;
  }

}

- (BOOL)firstScreenOnAfterWake
{
  return self->_firstScreenOnAfterWake;
}

- (NSNumber)currentMachWakeTime
{
  return (NSNumber *)objc_getProperty(self, a2, 96, 1);
}

+ (id)defaults
{
  return &unk_1E864FBE0;
}

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLAggregateDictionaryService;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryEventNoneDefinitions
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("SessionsFile");
  objc_msgSend(a1, "entryEventNoneDefinitionSessionsFile");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)entryEventNoneDefinitionSessionsFile
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  void *v10;
  _QWORD v11[3];
  _QWORD v12[3];
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v13[0] = *MEMORY[0x1E0D80298];
  v2 = *MEMORY[0x1E0D80300];
  v11[0] = *MEMORY[0x1E0D80318];
  v11[1] = v2;
  v12[0] = &unk_1E8653B30;
  v12[1] = MEMORY[0x1E0C9AAA0];
  v11[2] = *MEMORY[0x1E0D80330];
  v12[2] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v3;
  v13[1] = *MEMORY[0x1E0D802F0];
  v9 = CFSTR("SessionsFileData");
  objc_msgSend(MEMORY[0x1E0D7FFB8], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "commonTypeDict_StringFormat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (PLAggregateDictionaryService)init
{
  PLAggregateDictionaryService *v3;
  PLAggregateDictionaryService *v4;
  uint64_t v5;
  NSMutableArray *registeredNotifications;
  uint64_t v7;
  NSNumber *currentMachWakeTime;
  NSString *wakeReasons;
  NSString *wakeReasonString;
  uint64_t v11;
  NSMutableDictionary *localCache;
  objc_super v14;

  if ((objc_msgSend(MEMORY[0x1E0D80020], "isHomePod") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)PLAggregateDictionaryService;
    v4 = -[PLOperator init](&v14, sel_init);
    if (v4)
    {
      v5 = objc_opt_new();
      registeredNotifications = v4->_registeredNotifications;
      v4->_registeredNotifications = (NSMutableArray *)v5;

      v4->_last_state.state = -1;
      v4->_last_state.level = 0.0;
      v4->_last_state.timestamp = 0.0;
      v4->remainderUnpluggedEnergy = 0.0;
      v4->remainderUnpluggedTime = 0.0;
      v4->_firstScreenOnAfterWake = 0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0);
      v7 = objc_claimAutoreleasedReturnValue();
      currentMachWakeTime = v4->_currentMachWakeTime;
      v4->_currentMachWakeTime = (NSNumber *)v7;

      wakeReasons = v4->_wakeReasons;
      v4->_wakeReasons = 0;

      wakeReasonString = v4->_wakeReasonString;
      v4->_wakeReasonString = 0;

      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v11 = objc_claimAutoreleasedReturnValue();
      localCache = v4->_localCache;
      v4->_localCache = (NSMutableDictionary *)v11;

      -[PLAggregateDictionaryService initValidReasonsDictionary](v4, "initValidReasonsDictionary");
    }
    self = v4;
    v3 = self;
  }

  return v3;
}

- (void)initOperatorDependancies
{
  -[PLAggregateDictionaryService registerForAudioNotifications](self, "registerForAudioNotifications");
  -[PLAggregateDictionaryService registerForCameraNotifications](self, "registerForCameraNotifications");
  -[PLAggregateDictionaryService registerForBluetoothNotifications](self, "registerForBluetoothNotifications");
  -[PLAggregateDictionaryService registerForUIKitNotifications](self, "registerForUIKitNotifications");
  -[PLAggregateDictionaryService registerForSpringboardNotifications](self, "registerForSpringboardNotifications");
  -[PLAggregateDictionaryService registerForVideoNotifications](self, "registerForVideoNotifications");
  -[PLAggregateDictionaryService registerForMailNotifications](self, "registerForMailNotifications");
  -[PLAggregateDictionaryService registerForCalendarNotifications](self, "registerForCalendarNotifications");
  -[PLAggregateDictionaryService registerForApplicationNotifications](self, "registerForApplicationNotifications");
  -[PLAggregateDictionaryService registerForLocationNotifications](self, "registerForLocationNotifications");
  currentBatteryState = 0;
  -[PLAggregateDictionaryService registerForBatteryNotifications](self, "registerForBatteryNotifications");
  -[PLAggregateDictionaryService registerForSCDynamicStoreNotifications](self, "registerForSCDynamicStoreNotifications");
  -[PLAggregateDictionaryService registerForSafariNotifications](self, "registerForSafariNotifications");
  -[PLAggregateDictionaryService registerForBacklightLatencyNotifications](self, "registerForBacklightLatencyNotifications");
  -[PLAggregateDictionaryService setupMetricsAggregation](self, "setupMetricsAggregation");
}

- (void)initValidReasonsDictionary
{
  NSMutableDictionary *v3;
  NSMutableDictionary *validReasonsDictionary;
  NSMutableDictionary *v5;
  uint64_t v6;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  NSMutableDictionary *v10;
  uint64_t v11;
  void *v12;
  NSMutableDictionary *v13;
  void *v14;
  NSMutableDictionary *v15;
  void *v16;
  NSMutableDictionary *v17;
  void *v18;
  NSMutableDictionary *v19;
  void *v20;
  NSMutableDictionary *v21;
  void *v22;
  NSMutableDictionary *v23;
  void *v24;
  NSMutableDictionary *v25;
  void *v26;
  NSMutableDictionary *v27;
  void *v28;
  NSMutableDictionary *v29;
  void *v30;
  NSMutableDictionary *v31;
  void *v32;
  NSMutableDictionary *v33;
  void *v34;
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[2];
  _QWORD v41[2];
  _QWORD v42[2];
  _QWORD v43[2];
  _QWORD v44[2];
  _QWORD v45[2];
  _QWORD v46[2];
  _QWORD v47[2];
  _QWORD v48[2];
  _QWORD v49[2];
  _QWORD v50[2];
  _QWORD v51[2];
  _QWORD v52[2];
  _QWORD v53[2];
  _QWORD v54[2];
  _QWORD v55[2];
  _QWORD v56[2];
  _QWORD v57[2];
  _QWORD v58[2];
  _QWORD v59[2];
  _QWORD v60[2];
  _QWORD v61[2];
  _QWORD v62[4];

  v62[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  validReasonsDictionary = self->_validReasonsDictionary;
  self->_validReasonsDictionary = v3;

  v5 = self->_validReasonsDictionary;
  v61[0] = CFSTR("aggdKey");
  v61[1] = CFSTR("isUserEvent");
  v6 = MEMORY[0x1E0C9AAA0];
  v62[0] = CFSTR("com.apple.performance.wake_latency.acc");
  v62[1] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, v61, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", v7, CFSTR("acc"));

  v8 = self->_validReasonsDictionary;
  v59[0] = CFSTR("aggdKey");
  v59[1] = CFSTR("isUserEvent");
  v60[0] = CFSTR("com.apple.performance.wake_latency.baseband");
  v60[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v60, v59, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](v8, "setObject:forKey:", v9, CFSTR("baseband"));

  v10 = self->_validReasonsDictionary;
  v57[0] = CFSTR("aggdKey");
  v57[1] = CFSTR("isUserEvent");
  v11 = MEMORY[0x1E0C9AAB0];
  v58[0] = CFSTR("com.apple.performance.wake_latency.bluetooth");
  v58[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v58, v57, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](v10, "setObject:forKey:", v12, CFSTR("bluetooth"));

  v13 = self->_validReasonsDictionary;
  v55[0] = CFSTR("aggdKey");
  v55[1] = CFSTR("isUserEvent");
  v56[0] = CFSTR("com.apple.performance.wake_latency.halleffect");
  v56[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v56, v55, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](v13, "setObject:forKey:", v14, CFSTR("halleffect"));

  v15 = self->_validReasonsDictionary;
  v53[0] = CFSTR("aggdKey");
  v53[1] = CFSTR("isUserEvent");
  v54[0] = CFSTR("com.apple.performance.wake_latency.halleffect");
  v54[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, v53, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](v15, "setObject:forKey:", v16, CFSTR("halleffect1"));

  v17 = self->_validReasonsDictionary;
  v51[0] = CFSTR("aggdKey");
  v51[1] = CFSTR("isUserEvent");
  v52[0] = CFSTR("com.apple.performance.wake_latency.halleffect");
  v52[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, v51, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](v17, "setObject:forKey:", v18, CFSTR("halleffect2"));

  v19 = self->_validReasonsDictionary;
  v49[0] = CFSTR("aggdKey");
  v49[1] = CFSTR("isUserEvent");
  v50[0] = CFSTR("com.apple.performance.wake_latency.hold");
  v50[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](v19, "setObject:forKey:", v20, CFSTR("hold"));

  v21 = self->_validReasonsDictionary;
  v47[0] = CFSTR("aggdKey");
  v47[1] = CFSTR("isUserEvent");
  v48[0] = CFSTR("com.apple.performance.wake_latency.menu");
  v48[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, v47, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](v21, "setObject:forKey:", v22, CFSTR("menu"));

  v23 = self->_validReasonsDictionary;
  v45[0] = CFSTR("aggdKey");
  v45[1] = CFSTR("isUserEvent");
  v46[0] = CFSTR("com.apple.performance.wake_latency.mikey");
  v46[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](v23, "setObject:forKey:", v24, CFSTR("mikey"));

  v25 = self->_validReasonsDictionary;
  v43[0] = CFSTR("aggdKey");
  v43[1] = CFSTR("isUserEvent");
  v44[0] = CFSTR("com.apple.performance.wake_latency.ringer");
  v44[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](v25, "setObject:forKey:", v26, CFSTR("ringer"));

  v27 = self->_validReasonsDictionary;
  v41[0] = CFSTR("aggdKey");
  v41[1] = CFSTR("isUserEvent");
  v42[0] = CFSTR("com.apple.performance.wake_latency.rtc");
  v42[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 2);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](v27, "setObject:forKey:", v28, CFSTR("rtc"));

  v29 = self->_validReasonsDictionary;
  v39[0] = CFSTR("aggdKey");
  v39[1] = CFSTR("isUserEvent");
  v40[0] = CFSTR("com.apple.performance.wake_latency.stockholm");
  v40[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](v29, "setObject:forKey:", v30, CFSTR("stockholm"));

  v31 = self->_validReasonsDictionary;
  v37[0] = CFSTR("aggdKey");
  v37[1] = CFSTR("isUserEvent");
  v38[0] = CFSTR("com.apple.performance.wake_latency.usb");
  v38[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](v31, "setObject:forKey:", v32, CFSTR("usb"));

  v33 = self->_validReasonsDictionary;
  v35[0] = CFSTR("aggdKey");
  v35[1] = CFSTR("isUserEvent");
  v36[0] = CFSTR("com.apple.performance.wake_latency.wlan");
  v36[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](v33, "setObject:forKey:", v34, CFSTR("wlan"));

}

uint64_t __68__PLAggregateDictionaryService_addToDurationScalarKey_withDuration___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  _MergedGlobals_1_69 = result;
  return result;
}

- (void)logDuration:(double)a3 asDistribution:(id)a4
{
  JUMPOUT(0x1D179B7F4);
}

- (void)registerForAudioNotifications
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *, void *);
  void *v11;
  PLAggregateDictionaryService *v12;
  id v13;

  +[PLOperator entryKeyForType:andName:](PLAudioAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("Routing"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAggregateDictionaryService registeredNotifications](self, "registeredNotifications");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0D7FFC8]);
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __61__PLAggregateDictionaryService_registerForAudioNotifications__block_invoke;
  v11 = &unk_1E8581E70;
  v12 = self;
  v13 = v3;
  v6 = v3;
  v7 = (void *)objc_msgSend(v5, "initWithOperator:forEntryKey:withBlock:", self, v6, &v8);
  objc_msgSend(v4, "addObject:", v7, v8, v9, v10, v11, v12);

}

uint64_t __61__PLAggregateDictionaryService_registerForAudioNotifications__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885B99 = result;
  return result;
}

id __61__PLAggregateDictionaryService_registerForAudioNotifications__block_invoke_126(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)registerForCameraNotifications
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];

  v3 = *MEMORY[0x1E0D80378];
  +[PLOperator entryKeyForType:andName:](PLCameraAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("Camera"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLOperator entryKeyForType:andName:](PLCameraAgent, "entryKeyForType:andName:", v3, CFSTR("Torch"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAggregateDictionaryService registeredNotifications](self, "registeredNotifications");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x1E0D7FFC8]);
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __62__PLAggregateDictionaryService_registerForCameraNotifications__block_invoke;
  v16[3] = &unk_1E8577F48;
  v16[4] = self;
  v9 = (void *)objc_msgSend(v7, "initWithOperator:forEntryKey:withBlock:", self, v4, v16);
  objc_msgSend(v6, "addObject:", v9);

  -[PLAggregateDictionaryService registeredNotifications](self, "registeredNotifications");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc(MEMORY[0x1E0D7FFC8]);
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __62__PLAggregateDictionaryService_registerForCameraNotifications__block_invoke_3;
  v14[3] = &unk_1E8581E70;
  v14[4] = self;
  v15 = v5;
  v12 = v5;
  v13 = (void *)objc_msgSend(v11, "initWithOperator:forEntryKey:withBlock:", self, v12, v14);
  objc_msgSend(v10, "addObject:", v13);

}

void __62__PLAggregateDictionaryService_registerForCameraNotifications__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  id v15;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("entry"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("CameraType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLCameraAgent distributionFromCameraType:](PLCameraAgent, "distributionFromCameraType:", objc_msgSend(v4, "intValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "localCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "localCache");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v3, v5);

    if (v7)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("State"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(v3, "entryDate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "entryDate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "timeIntervalSinceDate:", v11);
        v13 = v12;

        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("State"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v11) = objc_msgSend(v14, "isEqual:", MEMORY[0x1E0C9AAB0]);

        if ((_DWORD)v11)
        {
          objc_msgSend(*(id *)(a1 + 32), "logDuration:asDistribution:", v5, v13);
          v15 = v3;
          AnalyticsSendEventLazy();

        }
      }
    }

  }
}

id __62__PLAggregateDictionaryService_registerForCameraNotifications__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("CameraType");
  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("CameraType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberWithInt:", objc_msgSend(v3, "intValue"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = CFSTR("StateDuration");
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __62__PLAggregateDictionaryService_registerForCameraNotifications__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  char v22;
  _QWORD block[5];
  uint8_t buf[4];
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("entry"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "localCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "localCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v3, *(_QWORD *)(a1 + 40));

  if (v5)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Level"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v3, "entryDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "entryDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "timeIntervalSinceDate:", v9);
      v11 = v10;

      if (objc_msgSend(*(id *)(a1 + 32), "isDebugEnabled")
        && objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v12 = objc_opt_class();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __62__PLAggregateDictionaryService_registerForCameraNotifications__block_invoke_4;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v12;
        if (qword_1ED885BB8 != -1)
          dispatch_once(&qword_1ED885BB8, block);
        if (byte_1ED885B9A)
        {
          v13 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Level"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "stringWithFormat:", CFSTR("LastEntry for Torch:%@ and last Level is %@"), v5, v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          v16 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAggregateDictionaryService.m");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "lastPathComponent");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAggregateDictionaryService registerForCameraNotifications]_block_invoke_3");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v18, v19, 345);

          PLLogCommon();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v25 = v15;
            _os_log_debug_impl(&dword_1CAF47000, v20, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

        }
      }
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Level"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isEqual:", &unk_1E8635970);

      if ((v22 & 1) == 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "logDuration:asDistribution:", CFSTR("com.apple.power.torch.activeDuration"), v11);
        AnalyticsSendEventLazy();
      }
    }
  }

}

uint64_t __62__PLAggregateDictionaryService_registerForCameraNotifications__block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885B9A = result;
  return result;
}

id __62__PLAggregateDictionaryService_registerForCameraNotifications__block_invoke_147(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("StateDuration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)logAggregateUIKitKeyboardActivityKey:(id)a3 withInfo:(id)a4 AggDKey:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  id v26;

  v26 = a3;
  v8 = a5;
  objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("entry"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Process-ID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLAggregateDictionaryService localCache](self, "localCache");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v26);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLAggregateDictionaryService localCache](self, "localCache");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v26);

    }
    -[PLAggregateDictionaryService localCache](self, "localCache");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKeyedSubscript:", v26);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Status"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v17) = objc_msgSend(v19, "isEqual:", MEMORY[0x1E0C9AAB0]);

    if ((_DWORD)v17)
    {
      if (!v18)
      {
        objc_msgSend(v10, "entryDate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLAggregateDictionaryService localCache](self, "localCache");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectForKeyedSubscript:", v26);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setObject:forKeyedSubscript:", v20, v11);
LABEL_9:

      }
    }
    else if (v18)
    {
      objc_msgSend(v10, "entryDate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "timeIntervalSinceDate:", v18);
      v25 = v24;

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.UIKit.%@.screenOnTime"), v8);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PLAggregateDictionaryService logDuration:asDistribution:](self, "logDuration:asDistribution:", v20, v25);
      -[PLAggregateDictionaryService localCache](self, "localCache");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKeyedSubscript:", v26);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "removeObjectForKey:", v11);
      goto LABEL_9;
    }

  }
}

- (void)logAggregateUIKitActivityKey:(id)a3 withInfo:(id)a4 AggDKey:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  v8 = a5;
  objc_msgSend(a4, "objectForKeyedSubscript:", CFSTR("entry"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[PLAggregateDictionaryService localCache](self, "localCache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKeyedSubscript:", v23);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("Status"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Status"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v12, "isEqual:", v13);

      if ((v14 & 1) != 0)
      {
LABEL_7:

        goto LABEL_8;
      }
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("Status"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqual:", MEMORY[0x1E0C9AAB0]);

      if (v16)
      {
        objc_msgSend(v9, "entryDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "entryDate");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "timeIntervalSinceDate:", v18);
        v20 = v19;

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.UIKit.%@.screenOnTime"), v8);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[PLAggregateDictionaryService logDuration:asDistribution:](self, "logDuration:asDistribution:", v21, v20);

      }
    }
    -[PLAggregateDictionaryService localCache](self, "localCache");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v9, v23);

    goto LABEL_7;
  }
LABEL_8:

}

- (void)registerForUIKitNotifications
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[5];
  id v25;

  if (+[PLXPCAgent shouldLogiOSWatchOSOnly](PLXPCAgent, "shouldLogiOSWatchOSOnly"))
  {
    v3 = *MEMORY[0x1E0D80378];
    +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("UIKitKeyboard"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", v3, CFSTR("UIKitAlert"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", v3, CFSTR("UIKitActivity"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLAggregateDictionaryService registeredNotifications](self, "registeredNotifications");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc(MEMORY[0x1E0D7FFC8]);
    v9 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __61__PLAggregateDictionaryService_registerForUIKitNotifications__block_invoke;
    v24[3] = &unk_1E8581E70;
    v24[4] = self;
    v25 = v4;
    v10 = v4;
    v11 = (void *)objc_msgSend(v8, "initWithOperator:forEntryKey:withBlock:", self, v10, v24);
    objc_msgSend(v7, "addObject:", v11);

    -[PLAggregateDictionaryService registeredNotifications](self, "registeredNotifications");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_alloc(MEMORY[0x1E0D7FFC8]);
    v22[0] = v9;
    v22[1] = 3221225472;
    v22[2] = __61__PLAggregateDictionaryService_registerForUIKitNotifications__block_invoke_2;
    v22[3] = &unk_1E8581E70;
    v22[4] = self;
    v23 = v5;
    v14 = v5;
    v15 = (void *)objc_msgSend(v13, "initWithOperator:forEntryKey:withBlock:", self, v14, v22);
    objc_msgSend(v12, "addObject:", v15);

    -[PLAggregateDictionaryService registeredNotifications](self, "registeredNotifications");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_alloc(MEMORY[0x1E0D7FFC8]);
    v20[0] = v9;
    v20[1] = 3221225472;
    v20[2] = __61__PLAggregateDictionaryService_registerForUIKitNotifications__block_invoke_3;
    v20[3] = &unk_1E8581E70;
    v20[4] = self;
    v21 = v6;
    v18 = v6;
    v19 = (void *)objc_msgSend(v17, "initWithOperator:forEntryKey:withBlock:", self, v18, v20);
    objc_msgSend(v16, "addObject:", v19);

  }
}

uint64_t __61__PLAggregateDictionaryService_registerForUIKitNotifications__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "logAggregateUIKitKeyboardActivityKey:withInfo:AggDKey:", *(_QWORD *)(a1 + 40), a2, CFSTR("UIKeyboard"));
}

uint64_t __61__PLAggregateDictionaryService_registerForUIKitNotifications__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "logAggregateUIKitActivityKey:withInfo:AggDKey:", *(_QWORD *)(a1 + 40), a2, CFSTR("UIAlert"));
}

uint64_t __61__PLAggregateDictionaryService_registerForUIKitNotifications__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "logAggregateUIKitActivityKey:withInfo:AggDKey:", *(_QWORD *)(a1 + 40), a2, CFSTR("UIActivity"));
}

- (void)registerForSpringboardNotifications
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = *MEMORY[0x1E0D80390];
  +[PLOperator entryKeyForType:andName:](PLSpringBoardAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("SBAutoLock"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  +[PLOperator entryKeyForType:andName:](PLSpringBoardAgent, "entryKeyForType:andName:", v3, CFSTR("SBNotifications"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAggregateDictionaryService registeredNotifications](self, "registeredNotifications");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFC8]), "initWithOperator:forNotification:withBlock:", self, v9, &__block_literal_global_51);
  objc_msgSend(v5, "addObject:", v6);

  -[PLAggregateDictionaryService registeredNotifications](self, "registeredNotifications");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFC8]), "initWithOperator:forEntryKey:withBlock:", self, v4, &__block_literal_global_171);
  objc_msgSend(v7, "addObject:", v8);

}

void __67__PLAggregateDictionaryService_registerForSpringboardNotifications__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char v3;
  const __CFString *v4;
  void *v5;
  int v6;
  id v7;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("entry"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AutoLockType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", &unk_1E8635970);

  if ((v3 & 1) != 0)
  {
    v4 = CFSTR("com.apple.springboard.autolockCount");
LABEL_5:
    MEMORY[0x1D179B7DC](v4, 1);
    goto LABEL_6;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("AutoLockType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqual:", &unk_1E8635988);

  if (v6)
  {
    v4 = CFSTR("com.apple.springboard.lockscreenDimCount");
    goto LABEL_5;
  }
LABEL_6:

}

void __67__PLAggregateDictionaryService_registerForSpringboardNotifications__block_invoke_170(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  int v9;
  id v10;
  void *v11;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("entry"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("NotificationType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", &unk_1E8635970);

  if ((v5 & 1) != 0)
  {
    v6 = CFSTR("local");
    v7 = CFSTR("com.apple.power.App.LocalNotifications");
LABEL_5:
    MEMORY[0x1D179B7DC](v7, 1);
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("type"));
    goto LABEL_6;
  }
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("NotificationType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", &unk_1E8635988);

  if (v9)
  {
    v6 = CFSTR("remote");
    v7 = CFSTR("com.apple.power.App.RemoteNotifications");
    goto LABEL_5;
  }
LABEL_6:
  v11 = v3;
  v10 = v3;
  AnalyticsSendEventLazy();

}

id __67__PLAggregateDictionaryService_registerForSpringboardNotifications__block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)registerForBluetoothNotifications
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  PLAggregateDictionaryService *v12;
  id v13;

  +[PLOperator entryKeyForType:andName:](PLBluetoothAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("DeviceState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAggregateDictionaryService registeredNotifications](self, "registeredNotifications");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0D7FFC8]);
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __65__PLAggregateDictionaryService_registerForBluetoothNotifications__block_invoke;
  v11 = &unk_1E8581E70;
  v12 = self;
  v13 = v3;
  v6 = v3;
  v7 = (void *)objc_msgSend(v5, "initWithOperator:forEntryKey:withBlock:", self, v6, &v8);
  objc_msgSend(v4, "addObject:", v7, v8, v9, v10, v11, v12);

}

void __65__PLAggregateDictionaryService_registerForBluetoothNotifications__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  int v13;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("entry"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "localCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "localCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v3, *(_QWORD *)(a1 + 40));

  objc_msgSend(v3, "entryDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "entryDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceDate:", v8);
  v10 = v9;

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("DeviceConnected"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v11, "isEqual:", MEMORY[0x1E0C9AAB0]);

  if ((_DWORD)v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "logDuration:asDistribution:", CFSTR("com.apple.power.bluetooth.connected.duration"), v10);
    AnalyticsSendEventLazy();
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("DeviceDiscoverable"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "isEqual:", MEMORY[0x1E0C9AAB0]);

  if (v13)
  {
    objc_msgSend(*(id *)(a1 + 32), "logDuration:asDistribution:", CFSTR("com.apple.power.bluetooth.discoverable.duration"), v10);
    AnalyticsSendEventLazy();
  }

}

id __65__PLAggregateDictionaryService_registerForBluetoothNotifications__block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v4[1] = CFSTR("duration");
  v5[0] = CFSTR("connected");
  v4[0] = CFSTR("state");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id __65__PLAggregateDictionaryService_registerForBluetoothNotifications__block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v4[1] = CFSTR("duration");
  v5[0] = CFSTR("discoverable");
  v4[0] = CFSTR("state");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)registerForVideoNotifications
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  PLAggregateDictionaryService *v12;
  id v13;

  +[PLOperator entryKeyForType:andName:](PLVideoAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("Video"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAggregateDictionaryService registeredNotifications](self, "registeredNotifications");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0D7FFC8]);
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __61__PLAggregateDictionaryService_registerForVideoNotifications__block_invoke;
  v11 = &unk_1E8581E70;
  v12 = self;
  v13 = v3;
  v6 = v3;
  v7 = (void *)objc_msgSend(v5, "initWithOperator:forEntryKey:withBlock:", self, v6, &v8);
  objc_msgSend(v4, "addObject:", v7, v8, v9, v10, v11, v12);

}

void __61__PLAggregateDictionaryService_registerForVideoNotifications__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  id v12;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("entry"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "localCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "localCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v3, *(_QWORD *)(a1 + 40));

  objc_msgSend(v3, "entryDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "entryDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeIntervalSinceDate:", v8);
  v10 = v9;

  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("State"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v11, "isEqual:", &unk_1E86359A0);

  if ((_DWORD)v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "logDuration:asDistribution:", CFSTR("com.apple.power.video.duration"), v10);
    v12 = v3;
    AnalyticsSendEventLazy();

  }
}

id __61__PLAggregateDictionaryService_registerForVideoNotifications__block_invoke_209(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("BundleId");
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("clientDisplayID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("StateDuration");
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)registerForMailNotifications
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v7[5];

  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("MailFetch"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAggregateDictionaryService registeredNotifications](self, "registeredNotifications");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0D7FFC8]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60__PLAggregateDictionaryService_registerForMailNotifications__block_invoke;
  v7[3] = &unk_1E8577F48;
  v7[4] = self;
  v6 = (void *)objc_msgSend(v5, "initWithOperator:forEntryKey:withBlock:", self, v3, v7);
  objc_msgSend(v4, "addObject:", v6);

}

void __60__PLAggregateDictionaryService_registerForMailNotifications__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  double v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  _QWORD block[5];
  _QWORD v42[5];
  _QWORD v43[5];
  _QWORD v44[5];
  uint8_t buf[4];
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("entry"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("account"));
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = (void *)v4;
      objc_msgSend(MEMORY[0x1E0CB3780], "characterSetWithCharactersInString:", CFSTR("/"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "rangeOfCharacterFromSet:", v6);

      if (v7 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
          goto LABEL_36;
        v8 = objc_opt_class();
        v43[0] = MEMORY[0x1E0C809B0];
        v43[1] = 3221225472;
        v43[2] = __60__PLAggregateDictionaryService_registerForMailNotifications__block_invoke_229;
        v43[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v43[4] = v8;
        if (qword_1ED885BC8 != -1)
          dispatch_once(&qword_1ED885BC8, v43);
        if (!byte_1ED885B9C)
          goto LABEL_36;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("WARNING: mail account type has no slash: %@"), v5);
        v9 = objc_claimAutoreleasedReturnValue();
        v10 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAggregateDictionaryService.m");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "lastPathComponent");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAggregateDictionaryService registerForMailNotifications]_block_invoke_2");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v12, v13, 541);

        PLLogCommon();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v46 = (uint64_t)v9;
          _os_log_debug_impl(&dword_1CAF47000, v14, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

        v15 = (uint64_t)v5;
      }
      else
      {
        objc_msgSend(v5, "substringToIndex:", v7);
        v15 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("duration"));
        v27 = objc_claimAutoreleasedReturnValue();
        v9 = v27;
        if (v27 && -[NSObject length](v27, "length"))
        {
          -[NSObject substringToIndex:](v9, "substringToIndex:", -[NSObject length](v9, "length") - 1);
          v28 = objc_claimAutoreleasedReturnValue();

          v29 = (void *)MEMORY[0x1E0CB37E8];
          -[NSObject doubleValue](v28, "doubleValue");
          objc_msgSend(v29, "numberWithDouble:");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(CFSTR("com.apple.mobilemail."), "stringByAppendingString:", v15);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          MEMORY[0x1D179B7DC](objc_msgSend(v31, "stringByAppendingString:", CFSTR(".fetchCount")), 1);
          v32 = objc_msgSend(v31, "stringByAppendingString:", CFSTR(".fetchDuration"));
          objc_msgSend(v30, "doubleValue");
          MEMORY[0x1D179B7DC](v32, (int)(v33 * 1000.0));

          v9 = v28;
        }
        else if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        {
          v34 = objc_opt_class();
          v44[0] = MEMORY[0x1E0C809B0];
          v44[1] = 3221225472;
          v44[2] = __60__PLAggregateDictionaryService_registerForMailNotifications__block_invoke_2;
          v44[3] = &__block_descriptor_40_e5_v8__0lu32l8;
          v44[4] = v34;
          if (qword_1ED885BC0 != -1)
            dispatch_once(&qword_1ED885BC0, v44);
          if (byte_1ED885B9B)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("WARNING: mail fetch durationString is invalid or empty"));
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = (void *)MEMORY[0x1E0D7FF98];
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAggregateDictionaryService.m");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "lastPathComponent");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAggregateDictionaryService registerForMailNotifications]_block_invoke");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "logMessage:fromFile:fromFunction:fromLineNumber:", v35, v38, v39, 538);

            PLLogCommon();
            v40 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v46 = (uint64_t)v35;
              _os_log_debug_impl(&dword_1CAF47000, v40, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
            }

          }
        }
      }
    }
    else
    {
      if (!objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
        goto LABEL_27;
      v21 = objc_opt_class();
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __60__PLAggregateDictionaryService_registerForMailNotifications__block_invoke_235;
      v42[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      v42[4] = v21;
      if (qword_1ED885BD0 != -1)
        dispatch_once(&qword_1ED885BD0, v42);
      if (!byte_1ED885B9D)
      {
LABEL_27:
        v5 = 0;
LABEL_36:

        goto LABEL_37;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("WARNING: mail notification account type is nil for entry %@"), v3);
      v9 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAggregateDictionaryService.m");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "lastPathComponent");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAggregateDictionaryService registerForMailNotifications]_block_invoke_2");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "logMessage:fromFile:fromFunction:fromLineNumber:", v9, v24, v25, 544);

      PLLogCommon();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v46 = (uint64_t)v9;
        _os_log_debug_impl(&dword_1CAF47000, v26, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v15 = 0;
    }
LABEL_35:

    v5 = (void *)v15;
    goto LABEL_36;
  }
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v16 = objc_opt_class();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__PLAggregateDictionaryService_registerForMailNotifications__block_invoke_240;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = v16;
    if (qword_1ED885BD8 != -1)
      dispatch_once(&qword_1ED885BD8, block);
    if (byte_1ED885B9E)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("WARNING: mail notification: thisEntry is invalid! Serious bug in entryNotification system"));
      v15 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAggregateDictionaryService.m");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "lastPathComponent");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAggregateDictionaryService registerForMailNotifications]_block_invoke_2");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "logMessage:fromFile:fromFunction:fromLineNumber:", v15, v19, v20, 547);

      PLLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v46 = v15;
        _os_log_debug_impl(&dword_1CAF47000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }
      goto LABEL_35;
    }
  }
LABEL_37:

}

uint64_t __60__PLAggregateDictionaryService_registerForMailNotifications__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885B9B = result;
  return result;
}

uint64_t __60__PLAggregateDictionaryService_registerForMailNotifications__block_invoke_229(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885B9C = result;
  return result;
}

uint64_t __60__PLAggregateDictionaryService_registerForMailNotifications__block_invoke_235(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885B9D = result;
  return result;
}

uint64_t __60__PLAggregateDictionaryService_registerForMailNotifications__block_invoke_240(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885B9E = result;
  return result;
}

- (void)registerForCalendarNotifications
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  __CFString *v13;
  _QWORD v14[4];
  __CFString *v15;

  v3 = *MEMORY[0x1E0D80390];
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("DACalendarItemsDownloaded"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", v3, CFSTR("DACalendarItemsUploaded"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAggregateDictionaryService registeredNotifications](self, "registeredNotifications");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x1E0D7FFC8]);
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __64__PLAggregateDictionaryService_registerForCalendarNotifications__block_invoke;
  v14[3] = &unk_1E8577F48;
  v15 = CFSTR("com.apple.power.calendar");
  v9 = (void *)objc_msgSend(v7, "initWithOperator:forEntryKey:withBlock:", self, v4, v14);
  objc_msgSend(v6, "addObject:", v9);

  -[PLAggregateDictionaryService registeredNotifications](self, "registeredNotifications");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __64__PLAggregateDictionaryService_registerForCalendarNotifications__block_invoke_3;
  v12[3] = &unk_1E8577F48;
  v13 = CFSTR("com.apple.power.calendar");
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFC8]), "initWithOperator:forEntryKey:withBlock:", self, v5, v12);
  objc_msgSend(v10, "addObject:", v11);

}

void __64__PLAggregateDictionaryService_registerForCalendarNotifications__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("entry"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("NumberOfItemsChanged"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1D179B7DC](CFSTR("com.apple.power.calendar.numberItemsDownloaded"), objc_msgSend(v3, "unsignedLongValue"));
  MEMORY[0x1D179B7DC](CFSTR("com.apple.power.calendar.syncCount"), 1);
  v5 = v3;
  v4 = v3;
  AnalyticsSendEventLazy();

}

id __64__PLAggregateDictionaryService_registerForCalendarNotifications__block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("numberItemsDownloaded");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", objc_msgSend(*(id *)(a1 + 32), "unsignedLongValue"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v4[1] = CFSTR("syncCount");
  v5[0] = v1;
  v5[1] = &unk_1E8635988;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void __64__PLAggregateDictionaryService_registerForCalendarNotifications__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("entry"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("NumberOfItemsChanged"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1D179B7DC](CFSTR("com.apple.power.calendar.numberItemsUploaded"), objc_msgSend(v3, "unsignedLongValue"));
  v5 = v3;
  v4 = v3;
  AnalyticsSendEventLazy();

}

id __64__PLAggregateDictionaryService_registerForCalendarNotifications__block_invoke_4(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("numberItemsUploaded");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", objc_msgSend(*(id *)(a1 + 32), "unsignedLongValue"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)registerForApplicationNotifications
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v7[5];

  +[PLOperator entryKeyForType:andName:](PLApplicationAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("Application"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAggregateDictionaryService registeredNotifications](self, "registeredNotifications");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0D7FFC8]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__PLAggregateDictionaryService_registerForApplicationNotifications__block_invoke;
  v7[3] = &unk_1E8577F48;
  v7[4] = self;
  v6 = (void *)objc_msgSend(v5, "initWithOperator:forNotification:withBlock:", self, v3, v7);
  objc_msgSend(v4, "addObject:", v6);

}

uint64_t __67__PLAggregateDictionaryService_registerForApplicationNotifications__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885B9F = result;
  return result;
}

- (void)registerForLocationNotifications
{
  void *v3;
  id v4;
  void *v5;
  __CFString *v6;

  -[PLAggregateDictionaryService registeredNotifications](self, "registeredNotifications");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D7FFC8]);
  v6 = CFSTR("PLLocationAgent_EventForward_TechStatus");
  v5 = (void *)objc_msgSend(v4, "initWithOperator:forEntryKey:withBlock:", self, MEMORY[0x1E0C809B0], 3221225472, __64__PLAggregateDictionaryService_registerForLocationNotifications__block_invoke, &unk_1E8581E70, self);
  objc_msgSend(v3, "addObject:", v5);

}

- (void)registerForBatteryNotifications
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v6[5];

  -[PLAggregateDictionaryService registeredNotifications](self, "registeredNotifications");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0D7FFC8]);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__PLAggregateDictionaryService_registerForBatteryNotifications__block_invoke;
  v6[3] = &unk_1E8577F48;
  v6[4] = self;
  v5 = (void *)objc_msgSend(v4, "initWithOperator:forEntryKey:withBlock:", self, CFSTR("PLBatteryAgent_EventBackward_Battery"), v6);
  objc_msgSend(v3, "addObject:", v5);

}

- (void)registerForSCDynamicStoreNotifications
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];
  id v23;
  _QWORD v24[5];
  id v25;

  v3 = *MEMORY[0x1E0D80378];
  +[PLOperator entryKeyForType:andName:](PLSCDynamicStoreAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("CellularActive"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLOperator entryKeyForType:andName:](PLSCDynamicStoreAgent, "entryKeyForType:andName:", v3, CFSTR("WifiActive"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLOperator entryKeyForType:andName:](PLSCDynamicStoreAgent, "entryKeyForType:andName:", v3, CFSTR("HotspotActive"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAggregateDictionaryService registeredNotifications](self, "registeredNotifications");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc(MEMORY[0x1E0D7FFC8]);
  v9 = MEMORY[0x1E0C809B0];
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __70__PLAggregateDictionaryService_registerForSCDynamicStoreNotifications__block_invoke;
  v24[3] = &unk_1E8581E70;
  v24[4] = self;
  v25 = v4;
  v10 = v4;
  v11 = (void *)objc_msgSend(v8, "initWithOperator:forEntryKey:withBlock:", self, v10, v24);
  objc_msgSend(v7, "addObject:", v11);

  -[PLAggregateDictionaryService registeredNotifications](self, "registeredNotifications");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc(MEMORY[0x1E0D7FFC8]);
  v22[0] = v9;
  v22[1] = 3221225472;
  v22[2] = __70__PLAggregateDictionaryService_registerForSCDynamicStoreNotifications__block_invoke_337;
  v22[3] = &unk_1E8581E70;
  v22[4] = self;
  v23 = v5;
  v14 = v5;
  v15 = (void *)objc_msgSend(v13, "initWithOperator:forEntryKey:withBlock:", self, v14, v22);
  objc_msgSend(v12, "addObject:", v15);

  -[PLAggregateDictionaryService registeredNotifications](self, "registeredNotifications");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc(MEMORY[0x1E0D7FFC8]);
  v20[0] = v9;
  v20[1] = 3221225472;
  v20[2] = __70__PLAggregateDictionaryService_registerForSCDynamicStoreNotifications__block_invoke_2;
  v20[3] = &unk_1E8581E70;
  v20[4] = self;
  v21 = v6;
  v18 = v6;
  v19 = (void *)objc_msgSend(v17, "initWithOperator:forEntryKey:withBlock:", self, v18, v20);
  objc_msgSend(v16, "addObject:", v19);

}

void __70__PLAggregateDictionaryService_registerForSCDynamicStoreNotifications__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t block;
  uint64_t v27;
  uint64_t (*v28)(uint64_t);
  void *v29;
  uint64_t v30;
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("entry"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "localCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "localCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v3, *(_QWORD *)(a1 + 40));

  if (!v5)
    goto LABEL_17;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("Active"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", MEMORY[0x1E0C9AAB0]);

  if (!v8)
    goto LABEL_17;
  objc_msgSend(v3, "entryDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "entryDate");
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timeIntervalSinceDate:", v10);
  v12 = v11;

  objc_msgSend(*(id *)(a1 + 32), "addToDurationScalarKey:withDuration:", CFSTR("com.apple.power.reachability.cellular.duration"), v12);
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("LinkQuality"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v10) = objc_msgSend(v13, "isEqual:", &unk_1E86359B8);

  if ((v10 & 1) != 0)
  {
    v14 = CFSTR("com.apple.power.link_quality.Good.duration");
  }
  else
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("LinkQuality"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqual:", &unk_1E86359D0);

    if ((v16 & 1) != 0)
    {
      v14 = CFSTR("com.apple.power.link_quality.Bad.duration");
    }
    else
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("LinkQuality"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqual:", &unk_1E86359E8);

      if ((v18 & 1) != 0)
        goto LABEL_10;
      v14 = CFSTR("com.apple.power.link_quality.Poor.duration");
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "addToDurationScalarKey:withDuration:", v14, v12);
LABEL_10:
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v19 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v27 = 3221225472;
    v28 = __70__PLAggregateDictionaryService_registerForSCDynamicStoreNotifications__block_invoke_334;
    v29 = &__block_descriptor_40_e5_v8__0lu32l8;
    v30 = v19;
    if (qword_1ED885BE8 != -1)
      dispatch_once(&qword_1ED885BE8, &block);
    if (byte_1ED885BA0)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Entry for SCDS: %@"), v3, block, v27, v28, v29, v30);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAggregateDictionaryService.m");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "lastPathComponent");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAggregateDictionaryService registerForSCDynamicStoreNotifications]_block_invoke_2");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "logMessage:fromFile:fromFunction:fromLineNumber:", v20, v23, v24, 715);

      PLLogCommon();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v32 = v20;
        _os_log_debug_impl(&dword_1CAF47000, v25, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

    }
  }
LABEL_17:

}

uint64_t __70__PLAggregateDictionaryService_registerForSCDynamicStoreNotifications__block_invoke_334(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885BA0 = result;
  return result;
}

void __70__PLAggregateDictionaryService_registerForSCDynamicStoreNotifications__block_invoke_337(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  id v12;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("entry"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "localCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "localCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, *(_QWORD *)(a1 + 40));

  if (v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Active"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqual:", MEMORY[0x1E0C9AAB0]);

    if (v7)
    {
      objc_msgSend(v12, "entryDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "entryDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "timeIntervalSinceDate:", v9);
      v11 = v10;

      objc_msgSend(*(id *)(a1 + 32), "addToDurationScalarKey:withDuration:", CFSTR("com.apple.power.reachability.wifi.duration"), v11);
    }
  }

}

void __70__PLAggregateDictionaryService_registerForSCDynamicStoreNotifications__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  id v12;

  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("entry"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "localCache");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "localCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v12, *(_QWORD *)(a1 + 40));

  if (v4)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Active"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqual:", MEMORY[0x1E0C9AAB0]);

    if (v7)
    {
      objc_msgSend(v12, "entryDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "entryDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "timeIntervalSinceDate:", v9);
      v11 = v10;

      objc_msgSend(*(id *)(a1 + 32), "addToDurationScalarKey:withDuration:", CFSTR("com.apple.power.reachability.hotspot.duration"), v11);
    }
  }

}

- (void)registerForSafariNotifications
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  _QWORD v7[5];

  +[PLOperator entryKeyForType:andName:](PLXPCAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80378], CFSTR("SafariFetcher"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAggregateDictionaryService registeredNotifications](self, "registeredNotifications");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0D7FFC8]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__PLAggregateDictionaryService_registerForSafariNotifications__block_invoke;
  v7[3] = &unk_1E8577F48;
  v7[4] = self;
  v6 = (void *)objc_msgSend(v5, "initWithOperator:forEntryKey:withBlock:", self, v3, v7);
  objc_msgSend(v4, "addObject:", v6);

}

void __62__PLAggregateDictionaryService_registerForSafariNotifications__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD block[5];
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("entry"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("FetcherState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("start"));

  if (v4)
  {
    if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
    {
      v5 = objc_opt_class();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __62__PLAggregateDictionaryService_registerForSafariNotifications__block_invoke_2;
      block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
      block[4] = v5;
      if (qword_1ED885BF0 != -1)
        dispatch_once(&qword_1ED885BF0, block);
      if (byte_1ED885BA1)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("adding to safari fetcher state"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAggregateDictionaryService.m");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "lastPathComponent");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAggregateDictionaryService registerForSafariNotifications]_block_invoke");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 747);

        PLLogCommon();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v14 = v6;
          _os_log_debug_impl(&dword_1CAF47000, v11, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
        }

      }
    }
    MEMORY[0x1D179B7DC](CFSTR("com.apple.safari.reading_list_items.count"), 1);
  }

}

uint64_t __62__PLAggregateDictionaryService_registerForSafariNotifications__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885BA1 = result;
  return result;
}

- (void)registerForBacklightLatencyNotifications
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  __CFString *v13;
  _QWORD v14[5];

  if (+[PLDisplayAgent shouldLogBacklightControl](PLDisplayAgent, "shouldLogBacklightControl"))
  {
    v3 = *MEMORY[0x1E0D80390];
    +[PLOperator entryKeyForType:andName:](PLDisplayAgent, "entryKeyForType:andName:", *MEMORY[0x1E0D80390], CFSTR("BacklightControl"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLAggregateDictionaryService registeredNotifications](self, "registeredNotifications");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc(MEMORY[0x1E0D7FFC8]);
    v7 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __72__PLAggregateDictionaryService_registerForBacklightLatencyNotifications__block_invoke;
    v14[3] = &unk_1E8577F48;
    v14[4] = self;
    v8 = (void *)objc_msgSend(v6, "initWithOperator:forEntryKey:withBlock:", self, v4, v14);
    objc_msgSend(v5, "addObject:", v8);

    +[PLOperator entryKeyForType:andName:](PLSleepWakeAgent, "entryKeyForType:andName:", v3, CFSTR("CurrentMachWakeTime"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLAggregateDictionaryService registeredNotifications](self, "registeredNotifications");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v7;
    v12[1] = 3221225472;
    v12[2] = __72__PLAggregateDictionaryService_registerForBacklightLatencyNotifications__block_invoke_2;
    v12[3] = &unk_1E8581E70;
    v12[4] = self;
    v13 = CFSTR("CurrentMachWakeTime");
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFC8]), "initWithOperator:forEntryKey:withBlock:", self, v9, v12);
    objc_msgSend(v10, "addObject:", v11);

  }
}

void __72__PLAggregateDictionaryService_registerForBacklightLatencyNotifications__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(a2, "objectForKey:", CFSTR("entry"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v7, "objectForKey:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCurrentMachWakeTime:", v4);

  v5 = *(void **)(a1 + 32);
  objc_msgSend(v7, "objectForKey:", CFSTR("WakeReasons"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWakeReasons:", v6);

  objc_msgSend(*(id *)(a1 + 32), "setFirstScreenOnAfterWake:", 1);
}

- (unint64_t)abstimeToNanosec:(unint64_t)a3
{
  double v4;
  unint64_t v5;
  unint64_t v6;
  mach_timebase_info info;

  v4 = *(double *)&abstimeToNanosec__tmScale;
  if (*(double *)&abstimeToNanosec__tmScale < 0.0)
  {
    info = 0;
    mach_timebase_info(&info);
    LODWORD(v6) = info.denom;
    LODWORD(v5) = info.numer;
    v4 = (double)v5 / (double)v6;
    abstimeToNanosec__tmScale = *(_QWORD *)&v4;
  }
  return (unint64_t)(v4 * (double)a3);
}

- (unint64_t)bucketWakeTime:(unint64_t)a3
{
  unsigned int v3;

  if (a3 < 0x3E8)
  {
    v3 = 10;
    return a3 - (unsigned __int16)a3 % v3;
  }
  if (a3 >> 3 < 0x271)
  {
    v3 = 100;
    return a3 - (unsigned __int16)a3 % v3;
  }
  if (a3 >> 4 <= 0x270)
  {
    v3 = 500;
    return a3 - (unsigned __int16)a3 % v3;
  }
  return 10000;
}

void *__62__PLAggregateDictionaryService_updateAggregateStateWithEntry___block_invoke()
{
  return &unk_1E864FC08;
}

id __62__PLAggregateDictionaryService_updateAggregateStateWithEntry___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("Energy");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("Duration");
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)logEventNoneSessionsFile
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  id v43;
  uint64_t v44;
  _QWORD v45[5];
  id v46;
  _QWORD block[5];
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint8_t buf[4];
  void *v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  +[PLOperator entryKeyForType:andName:](PLAggregateDictionaryService, "entryKeyForType:andName:", *MEMORY[0x1E0D80388], CFSTR("SessionsFile"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentsOfDirectoryAtPath:error:", CFSTR("/var/mobile/Library/Logs/CrashReporter/"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self BEGINSWITH[cd] 'log-power-'"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "filteredArrayUsingPredicate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v6, "count"))
    goto LABEL_32;
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
  if (!v8)
    goto LABEL_31;
  v9 = v8;
  v38 = v2;
  v39 = v6;
  v37 = v4;
  v10 = 0x1E0D7F000uLL;
  v43 = 0;
  v44 = *(_QWORD *)v50;
  v11 = 0.0;
  v40 = v7;
  do
  {
    v12 = 0;
    v41 = v9;
    do
    {
      if (*(_QWORD *)v50 != v44)
        objc_enumerationMutation(v7);
      objc_msgSend(CFSTR("/var/mobile/Library/Logs/CrashReporter/"), "stringByAppendingString:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * v12));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = 0;
      objc_msgSend(v3, "attributesOfItemAtPath:error:", v13, &v48);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v48;
      if (!v15)
      {
        objc_msgSend(v14, "fileModificationDate");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "timeIntervalSince1970");
        v26 = v25;

        if (v26 <= v11)
          goto LABEL_18;
        v18 = v43;
        v43 = v13;
        v11 = v26;
        goto LABEL_17;
      }
      if (objc_msgSend(*(id *)(v10 + 4000), "debugEnabled"))
      {
        v16 = objc_opt_class();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __56__PLAggregateDictionaryService_logEventNoneSessionsFile__block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v16;
        if (qword_1ED885BF8 != -1)
          dispatch_once(&qword_1ED885BF8, block);
        if (byte_1ED885BA2)
        {
          v17 = v3;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Reading file error: %@"), v15);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAggregateDictionaryService.m");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "lastPathComponent");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAggregateDictionaryService logEventNoneSessionsFile]");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "logMessage:fromFile:fromFunction:fromLineNumber:", v18, v21, v22, 940);

          PLLogCommon();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v54 = v18;
            _os_log_debug_impl(&dword_1CAF47000, v23, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v3 = v17;
          v10 = 0x1E0D7F000;
          v7 = v40;
          v9 = v41;
LABEL_17:

        }
      }
LABEL_18:

      ++v12;
    }
    while (v9 != v12);
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
  }
  while (v9);

  v4 = v37;
  v2 = v38;
  v6 = v39;
  if (v43)
  {
    v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:", v38);
    v46 = 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithContentsOfFile:encoding:error:", v43, 4, &v46);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v46;
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v28, CFSTR("SessionsFileData"));

    if (v29)
    {
      if (objc_msgSend(*(id *)(v10 + 4000), "debugEnabled"))
      {
        v30 = objc_opt_class();
        v45[0] = MEMORY[0x1E0C809B0];
        v45[1] = 3221225472;
        v45[2] = __56__PLAggregateDictionaryService_logEventNoneSessionsFile__block_invoke_403;
        v45[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v45[4] = v30;
        if (qword_1ED885C00 != -1)
          dispatch_once(&qword_1ED885C00, v45);
        if (byte_1ED885BA3)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error reading file content: %@"), v29);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLAggregateDictionaryService.m");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "lastPathComponent");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLAggregateDictionaryService logEventNoneSessionsFile]");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "logMessage:fromFile:fromFunction:fromLineNumber:", v31, v34, v35, 957);

          PLLogCommon();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v54 = v31;
            _os_log_debug_impl(&dword_1CAF47000, v36, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
          }

          v6 = v39;
        }
      }
    }
    else
    {
      -[PLOperator logEntry:](self, "logEntry:", v27);
    }

    v7 = v43;
LABEL_31:

  }
LABEL_32:

}

uint64_t __56__PLAggregateDictionaryService_logEventNoneSessionsFile__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885BA2 = result;
  return result;
}

uint64_t __56__PLAggregateDictionaryService_logEventNoneSessionsFile__block_invoke_403(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  byte_1ED885BA3 = result;
  return result;
}

- (void)setupMetricsAggregation
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[5];
  uint8_t buf[16];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  -[PLAggregateDictionaryService setupMetricsListeners](self, "setupMetricsListeners");
  if (((objc_msgSend(MEMORY[0x1E0D80078], "isAppAnalyticsEnabled") & 1) != 0
     || +[PLAggregateDictionaryService metrickitClientsAvailable](PLAggregateDictionaryService, "metrickitClientsAvailable"))&& !objc_msgSend(MEMORY[0x1E0D7FFA0], "BOOLForKey:ifNotSet:", CFSTR("DisableMetricsAggregation"), 0))
  {
    -[PLOperator defaultDoubleForKey:](self, "defaultDoubleForKey:", CFSTR("Interval"));
    objc_msgSend(MEMORY[0x1E0D7FF58], "timeCriterionWithInterval:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v5;
    objc_msgSend(MEMORY[0x1E0D7FF50], "pluggedInCriterion");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v6;
    objc_msgSend(MEMORY[0x1E0D7FF50], "displayOffCriterion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 3);
    v4 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D7FF60], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLOperator workQueue](self, "workQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __55__PLAggregateDictionaryService_setupMetricsAggregation__block_invoke;
    v10[3] = &unk_1E8580A68;
    v10[4] = self;
    objc_msgSend(v8, "scheduleActivityWithIdentifier:withCriteria:withMustRunCriterion:withQueue:withInterruptBlock:withActivityBlock:", CFSTR("com.apple.powerlogd.PLAggregateDictionaryService.dailyTasks"), v4, 0, v9, 0, v10);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D7FF60], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cancelActivityWithIdentifier:", CFSTR("com.apple.powerlogd.PLAggregateDictionaryService.dailyTasks"));

    PLLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CAF47000, v4, OS_LOG_TYPE_INFO, "aggregation disabled", buf, 2u);
    }
  }

}

void __55__PLAggregateDictionaryService_setupMetricsAggregation__block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  NSObject *v4;
  uint8_t v5[8];
  _QWORD block[5];

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "workQueue");
    v3 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __55__PLAggregateDictionaryService_setupMetricsAggregation__block_invoke_2;
    block[3] = &unk_1E85780C8;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(v3, block);

    PLLogCommon();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1CAF47000, v4, OS_LOG_TYPE_DEFAULT, "Dispatched metric summarization activity", v5, 2u);
    }

  }
}

void __55__PLAggregateDictionaryService_setupMetricsAggregation__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  uint8_t v4[16];
  uint8_t buf[16];

  PLLogCommon();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CAF47000, v2, OS_LOG_TYPE_DEFAULT, "Starting metric summarization activity", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "createMetricsFile:", 0);
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "taskMode"))
    objc_msgSend(*(id *)(a1 + 32), "logEventNoneSessionsFile");
  PLLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1CAF47000, v3, OS_LOG_TYPE_DEFAULT, "Finished metric summarization activity", v4, 2u);
  }

}

- (void)setupMetricsListeners
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];
  _QWORD v30[5];
  _QWORD v31[5];
  _QWORD v32[5];
  _QWORD v33[5];
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD v36[5];

  if (objc_msgSend(MEMORY[0x1E0D80020], "internalBuild"))
  {
    v3 = objc_alloc(MEMORY[0x1E0D7FF80]);
    -[PLOperator workQueue](self, "workQueue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = MEMORY[0x1E0C809B0];
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __53__PLAggregateDictionaryService_setupMetricsListeners__block_invoke;
    v36[3] = &unk_1E8577F48;
    v36[4] = self;
    v6 = (void *)objc_msgSend(v3, "initWithWorkQueue:forNotification:requireState:withBlock:", v4, CFSTR("com.apple.powerlogd.metricsAggregate"), 0, v36);
    -[PLAggregateDictionaryService setAggregateMetricsListener:](self, "setAggregateMetricsListener:", v6);

    v7 = objc_alloc(MEMORY[0x1E0D7FF80]);
    -[PLOperator workQueue](self, "workQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v5;
    v35[1] = 3221225472;
    v35[2] = __53__PLAggregateDictionaryService_setupMetricsListeners__block_invoke_419;
    v35[3] = &unk_1E8577F48;
    v35[4] = self;
    v9 = (void *)objc_msgSend(v7, "initWithWorkQueue:forNotification:requireState:withBlock:", v8, CFSTR("com.apple.powerlogd.metricsAggregateToday"), 0, v35);
    -[PLAggregateDictionaryService setAggregateMetricsTodayListener:](self, "setAggregateMetricsTodayListener:", v9);

    v10 = objc_alloc(MEMORY[0x1E0D7FF80]);
    -[PLOperator workQueue](self, "workQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v5;
    v34[1] = 3221225472;
    v34[2] = __53__PLAggregateDictionaryService_setupMetricsListeners__block_invoke_428;
    v34[3] = &unk_1E8577F48;
    v34[4] = self;
    v12 = (void *)objc_msgSend(v10, "initWithWorkQueue:forNotification:requireState:withBlock:", v11, CFSTR("com.apple.powerlogd.metricsAggregateForce"), 0, v34);
    -[PLAggregateDictionaryService setAggregateMetricsForceListener:](self, "setAggregateMetricsForceListener:", v12);

    v13 = objc_alloc(MEMORY[0x1E0D7FF80]);
    -[PLOperator workQueue](self, "workQueue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v5;
    v33[1] = 3221225472;
    v33[2] = __53__PLAggregateDictionaryService_setupMetricsListeners__block_invoke_431;
    v33[3] = &unk_1E8577F48;
    v33[4] = self;
    v15 = (void *)objc_msgSend(v13, "initWithWorkQueue:forNotification:requireState:withBlock:", v14, CFSTR("com.apple.powerlogd.metricsAggregateTodayForce"), 0, v33);
    -[PLAggregateDictionaryService setAggregateMetricsTodayForceListener:](self, "setAggregateMetricsTodayForceListener:", v15);

    v16 = objc_alloc(MEMORY[0x1E0D7FF80]);
    -[PLOperator workQueue](self, "workQueue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = v5;
    v32[1] = 3221225472;
    v32[2] = __53__PLAggregateDictionaryService_setupMetricsListeners__block_invoke_434;
    v32[3] = &unk_1E8577F48;
    v32[4] = self;
    v18 = (void *)objc_msgSend(v16, "initWithWorkQueue:forNotification:requireState:withBlock:", v17, CFSTR("com.apple.powerlogd.metricsAggregate24hrs"), 0, v32);
    -[PLAggregateDictionaryService setAggregateMetrics24hrsListener:](self, "setAggregateMetrics24hrsListener:", v18);

    v19 = objc_alloc(MEMORY[0x1E0D7FF80]);
    -[PLOperator workQueue](self, "workQueue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v5;
    v31[1] = 3221225472;
    v31[2] = __53__PLAggregateDictionaryService_setupMetricsListeners__block_invoke_439;
    v31[3] = &unk_1E8577F48;
    v31[4] = self;
    v21 = (void *)objc_msgSend(v19, "initWithWorkQueue:forNotification:requireState:withBlock:", v20, CFSTR("com.apple.powerlogd.metricsAggregate24hrsForce"), 0, v31);
    -[PLAggregateDictionaryService setAggregateMetrics24hrsForceListener:](self, "setAggregateMetrics24hrsForceListener:", v21);

    v22 = objc_alloc(MEMORY[0x1E0D7FF80]);
    -[PLOperator workQueue](self, "workQueue");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v5;
    v30[1] = 3221225472;
    v30[2] = __53__PLAggregateDictionaryService_setupMetricsListeners__block_invoke_442;
    v30[3] = &unk_1E8577F48;
    v30[4] = self;
    v24 = (void *)objc_msgSend(v22, "initWithWorkQueue:forNotification:requireState:withBlock:", v23, CFSTR("com.apple.powerlogd.metricsAggregate1hr"), 0, v30);
    -[PLAggregateDictionaryService setAggregateMetrics1hrListener:](self, "setAggregateMetrics1hrListener:", v24);

    v25 = objc_alloc(MEMORY[0x1E0D7FF80]);
    -[PLOperator workQueue](self, "workQueue");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v5;
    v29[1] = 3221225472;
    v29[2] = __53__PLAggregateDictionaryService_setupMetricsListeners__block_invoke_447;
    v29[3] = &unk_1E8577F48;
    v29[4] = self;
    v27 = (void *)objc_msgSend(v25, "initWithWorkQueue:forNotification:requireState:withBlock:", v26, CFSTR("com.apple.powerlogd.metricsAggregate1hrForce"), 0, v29);
    -[PLAggregateDictionaryService setAggregateMetrics1hrForceListener:](self, "setAggregateMetrics1hrForceListener:", v27);

    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D80098]), "initWithOperator:withRegistration:withBlock:", self, &unk_1E864FC30, &__block_literal_global_462);
    -[PLAggregateDictionaryService setMetricSummarizationStateResponder:](self, "setMetricSummarizationStateResponder:", v28);

  }
}

void __53__PLAggregateDictionaryService_setupMetricsListeners__block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  uint8_t v4[16];
  uint8_t buf[16];

  if ((objc_msgSend(MEMORY[0x1E0D80078], "isAppAnalyticsEnabled") & 1) != 0
    || +[PLAggregateDictionaryService metrickitClientsAvailable](PLAggregateDictionaryService, "metrickitClientsAvailable"))
  {
    PLLogCommon();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1CAF47000, v2, OS_LOG_TYPE_DEFAULT, "creating metrics file", v4, 2u);
    }

    objc_msgSend(*(id *)(a1 + 32), "createMetricsFile:", 0);
  }
  else
  {
    PLLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CAF47000, v3, OS_LOG_TYPE_DEFAULT, "metrics file notification ignored", buf, 2u);
    }

  }
}

void __53__PLAggregateDictionaryService_setupMetricsListeners__block_invoke_419(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[8];
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0D80078], "isAppAnalyticsEnabled") & 1) != 0
    || +[PLAggregateDictionaryService metrickitClientsAvailable](PLAggregateDictionaryService, "metrickitClientsAvailable"))
  {
    PLLogCommon();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1CAF47000, v2, OS_LOG_TYPE_DEFAULT, "creating metrics file for today", v6, 2u);
    }

    v7[0] = CFSTR("AppAnalyticsEnabled");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(MEMORY[0x1E0D80078], "isAppAnalyticsEnabled"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v3;
    v7[1] = CFSTR("MetrickitClientsAvailable");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", +[PLAggregateDictionaryService metrickitClientsAvailable](PLAggregateDictionaryService, "metrickitClientsAvailable"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2] = CFSTR("today");
    v8[1] = v4;
    v8[2] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
    v5 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "createMetricsFile:", v5);
  }
  else
  {
    PLLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_DEFAULT, "metrics file notification ignored", v6, 2u);
    }
  }

}

void __53__PLAggregateDictionaryService_setupMetricsListeners__block_invoke_428(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[8];
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0D80078], "isAppAnalyticsEnabled") & 1) == 0)
  {
    PLLogCommon();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1CAF47000, v2, OS_LOG_TYPE_DEFAULT, "metrics creation forced", v6, 2u);
    }

  }
  v7[0] = CFSTR("AppAnalyticsEnabled");
  v7[1] = CFSTR("MetrickitClientsAvailable");
  v8[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", +[PLAggregateDictionaryService metrickitClientsAvailable](PLAggregateDictionaryService, "metrickitClientsAvailable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  PLLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_DEFAULT, "creating metrics file", v6, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "createMetricsFile:", v4);
}

void __53__PLAggregateDictionaryService_setupMetricsListeners__block_invoke_431(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint8_t v7[8];
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0D80078], "isAppAnalyticsEnabled") & 1) == 0)
  {
    PLLogCommon();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1CAF47000, v2, OS_LOG_TYPE_DEFAULT, "metrics creation forced", v7, 2u);
    }

  }
  PLLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1CAF47000, v3, OS_LOG_TYPE_DEFAULT, "creating metrics file for today", v7, 2u);
  }

  v4 = MEMORY[0x1E0C9AAB0];
  v9[0] = MEMORY[0x1E0C9AAB0];
  v8[0] = CFSTR("AppAnalyticsEnabled");
  v8[1] = CFSTR("MetrickitClientsAvailable");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", +[PLAggregateDictionaryService metrickitClientsAvailable](PLAggregateDictionaryService, "metrickitClientsAvailable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = CFSTR("today");
  v9[1] = v5;
  v9[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "createMetricsFile:", v6);
}

void __53__PLAggregateDictionaryService_setupMetricsListeners__block_invoke_434(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[8];
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0D80078], "isAppAnalyticsEnabled") & 1) != 0
    || +[PLAggregateDictionaryService metrickitClientsAvailable](PLAggregateDictionaryService, "metrickitClientsAvailable"))
  {
    PLLogCommon();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1CAF47000, v2, OS_LOG_TYPE_DEFAULT, "creating metrics file for last 24hrs", v6, 2u);
    }

    v7[0] = CFSTR("AppAnalyticsEnabled");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(MEMORY[0x1E0D80078], "isAppAnalyticsEnabled"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v3;
    v7[1] = CFSTR("MetrickitClientsAvailable");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", +[PLAggregateDictionaryService metrickitClientsAvailable](PLAggregateDictionaryService, "metrickitClientsAvailable"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2] = CFSTR("last24hrs");
    v8[1] = v4;
    v8[2] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
    v5 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "createMetricsFile:", v5);
  }
  else
  {
    PLLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_DEFAULT, "metrics file notification ignored", v6, 2u);
    }
  }

}

void __53__PLAggregateDictionaryService_setupMetricsListeners__block_invoke_439(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint8_t v7[8];
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0D80078], "isAppAnalyticsEnabled") & 1) == 0)
  {
    PLLogCommon();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1CAF47000, v2, OS_LOG_TYPE_DEFAULT, "metrics creation forced", v7, 2u);
    }

  }
  PLLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1CAF47000, v3, OS_LOG_TYPE_DEFAULT, "creating metrics file for last 24hrs", v7, 2u);
  }

  v4 = MEMORY[0x1E0C9AAB0];
  v9[0] = MEMORY[0x1E0C9AAB0];
  v8[0] = CFSTR("AppAnalyticsEnabled");
  v8[1] = CFSTR("MetrickitClientsAvailable");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", +[PLAggregateDictionaryService metrickitClientsAvailable](PLAggregateDictionaryService, "metrickitClientsAvailable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = CFSTR("last24hrs");
  v9[1] = v5;
  v9[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "createMetricsFile:", v6);
}

void __53__PLAggregateDictionaryService_setupMetricsListeners__block_invoke_442(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[8];
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0D80078], "isAppAnalyticsEnabled") & 1) != 0
    || +[PLAggregateDictionaryService metrickitClientsAvailable](PLAggregateDictionaryService, "metrickitClientsAvailable"))
  {
    PLLogCommon();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1CAF47000, v2, OS_LOG_TYPE_DEFAULT, "creating metrics file for last 1hrs", v6, 2u);
    }

    v7[0] = CFSTR("AppAnalyticsEnabled");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(MEMORY[0x1E0D80078], "isAppAnalyticsEnabled"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v3;
    v7[1] = CFSTR("MetrickitClientsAvailable");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", +[PLAggregateDictionaryService metrickitClientsAvailable](PLAggregateDictionaryService, "metrickitClientsAvailable"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2] = CFSTR("last1hr");
    v8[1] = v4;
    v8[2] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
    v5 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "createMetricsFile:", v5);
  }
  else
  {
    PLLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1CAF47000, v5, OS_LOG_TYPE_DEFAULT, "metrics file notification ignored", v6, 2u);
    }
  }

}

void __53__PLAggregateDictionaryService_setupMetricsListeners__block_invoke_447(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint8_t v7[8];
  _QWORD v8[3];
  _QWORD v9[4];

  v9[3] = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(MEMORY[0x1E0D80078], "isAppAnalyticsEnabled") & 1) == 0)
  {
    PLLogCommon();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1CAF47000, v2, OS_LOG_TYPE_DEFAULT, "metrics creation forced", v7, 2u);
    }

  }
  PLLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1CAF47000, v3, OS_LOG_TYPE_DEFAULT, "creating metrics file for last 1hrs", v7, 2u);
  }

  v4 = MEMORY[0x1E0C9AAB0];
  v9[0] = MEMORY[0x1E0C9AAB0];
  v8[0] = CFSTR("AppAnalyticsEnabled");
  v8[1] = CFSTR("MetrickitClientsAvailable");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", +[PLAggregateDictionaryService metrickitClientsAvailable](PLAggregateDictionaryService, "metrickitClientsAvailable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2] = CFSTR("last1hr");
  v9[1] = v5;
  v9[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "createMetricsFile:", v6);
}

id __53__PLAggregateDictionaryService_setupMetricsListeners__block_invoke_460()
{
  void *v0;
  void *v1;
  void *v2;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("AppAnalyticsEnabled");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(MEMORY[0x1E0D80078], "isAppAnalyticsEnabled"));
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[1] = CFSTR("MetrickitClientsAvailable");
  v5[0] = v0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", +[PLAggregateDictionaryService metrickitClientsAvailable](PLAggregateDictionaryService, "metrickitClientsAvailable"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)createMetricsFile:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  int v11;
  _BOOL4 v12;
  _QWORD block[4];
  NSObject *v14;
  uint8_t buf[4];
  _QWORD v16[2];
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((objc_msgSend(MEMORY[0x1E0D80020], "nonUIBuild") & 1) == 0)
  {
    if (objc_msgSend(MEMORY[0x1E0D80020], "internalBuild")
      && objc_msgSend(MEMORY[0x1E0D7FFA0], "BOOLForKey:ifNotSet:", CFSTR("SignpostReaderDisable"), 0))
    {
      PLLogCommon();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CAF47000, v4, OS_LOG_TYPE_DEFAULT, "signpost collection disabled", buf, 2u);
      }
    }
    else
    {
      if (!v3)
      {
        v17[0] = CFSTR("AppAnalyticsEnabled");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(MEMORY[0x1E0D80078], "isAppAnalyticsEnabled"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v18[0] = v5;
        v17[1] = CFSTR("MetrickitClientsAvailable");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", +[PLAggregateDictionaryService metrickitClientsAvailable](PLAggregateDictionaryService, "metrickitClientsAvailable"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v18[1] = v6;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
        v3 = (id)objc_claimAutoreleasedReturnValue();

      }
      PLQueryRegistered();
      v4 = objc_claimAutoreleasedReturnValue();
      PLLogCommon();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v16[0] = v4;
        _os_log_debug_impl(&dword_1CAF47000, v7, OS_LOG_TYPE_DEBUG, "Response to metrics file: %@", buf, 0xCu);
      }

      PLLogCommon();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        v11 = objc_msgSend(MEMORY[0x1E0D80078], "isAppAnalyticsEnabled");
        v12 = +[PLAggregateDictionaryService metrickitClientsAvailable](PLAggregateDictionaryService, "metrickitClientsAvailable");
        *(_DWORD *)buf = 67109376;
        LODWORD(v16[0]) = v11;
        WORD2(v16[0]) = 1024;
        *(_DWORD *)((char *)v16 + 6) = v12;
        _os_log_debug_impl(&dword_1CAF47000, v8, OS_LOG_TYPE_DEBUG, "AppAnalyticsEnabled : %d, MetrickitClientsAvailable : %d", buf, 0xEu);
      }

      -[NSObject objectForKey:](v4, "objectForKey:", CFSTR("launchesTimeSeries"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(MEMORY[0x1E0D80078], "workQueueForClass:", objc_opt_class());
        v10 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __50__PLAggregateDictionaryService_createMetricsFile___block_invoke;
        block[3] = &unk_1E85780C8;
        v4 = v4;
        v14 = v4;
        dispatch_async(v10, block);

      }
    }

  }
}

void __50__PLAggregateDictionaryService_createMetricsFile___block_invoke(uint64_t a1)
{
  objc_class *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D800B8], "sharedCore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "agents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "operators");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("launchesTimeSeries"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "logEventBackwardAppLaunchTimeSeries:", v7);

  }
}

+ (BOOL)metrickitClientsAvailable
{
  if (qword_1ED885C08 != -1)
    dispatch_once(&qword_1ED885C08, &__block_literal_global_471);
  return byte_1ED885BA4;
}

void __57__PLAggregateDictionaryService_metrickitClientsAvailable__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0D7FFA0], "objectForKey:forApplicationID:synchronize:", CFSTR("MXClientsAvailable"), CFSTR("com.apple.metrickitd"), 1);
  v0 = (id)objc_claimAutoreleasedReturnValue();
  byte_1ED885BA4 = objc_msgSend(v0, "BOOLValue");

}

- (NSMutableArray)registeredNotifications
{
  return (NSMutableArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setRegisteredNotifications:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (PLMonotonicTimer)dailyTaskTimer
{
  return (PLMonotonicTimer *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDailyTaskTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (PLCFNotificationOperatorComposition)blmAggregateCFNotification
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 88, 1);
}

- (void)setBlmAggregateCFNotification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void)setFirstScreenOnAfterWake:(BOOL)a3
{
  self->_firstScreenOnAfterWake = a3;
}

- (void)setCurrentMachWakeTime:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSString)wakeReasons
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setWakeReasons:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSString)wakeReasonString
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setWakeReasonString:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSMutableDictionary)validReasonsDictionary
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 120, 1);
}

- (void)setValidReasonsDictionary:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (void)setLocalCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (PLCFNotificationOperatorComposition)aggregateMetricsListener
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 136, 1);
}

- (void)setAggregateMetricsListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (PLCFNotificationOperatorComposition)aggregateMetricsForceListener
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 144, 1);
}

- (void)setAggregateMetricsForceListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 144);
}

- (PLCFNotificationOperatorComposition)aggregateMetricsTodayListener
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 152, 1);
}

- (void)setAggregateMetricsTodayListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 152);
}

- (PLCFNotificationOperatorComposition)aggregateMetricsTodayForceListener
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 160, 1);
}

- (void)setAggregateMetricsTodayForceListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 160);
}

- (PLCFNotificationOperatorComposition)aggregateMetrics24hrsListener
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 168, 1);
}

- (void)setAggregateMetrics24hrsListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 168);
}

- (PLCFNotificationOperatorComposition)aggregateMetrics24hrsForceListener
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 176, 1);
}

- (void)setAggregateMetrics24hrsForceListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 176);
}

- (PLCFNotificationOperatorComposition)aggregateMetrics1hrListener
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 184, 1);
}

- (void)setAggregateMetrics1hrListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 184);
}

- (PLCFNotificationOperatorComposition)aggregateMetrics1hrForceListener
{
  return (PLCFNotificationOperatorComposition *)objc_getProperty(self, a2, 192, 1);
}

- (void)setAggregateMetrics1hrForceListener:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 192);
}

- (PLXPCResponderOperatorComposition)metricSummarizationStateResponder
{
  return (PLXPCResponderOperatorComposition *)objc_getProperty(self, a2, 200, 1);
}

- (void)setMetricSummarizationStateResponder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 200);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricSummarizationStateResponder, 0);
  objc_storeStrong((id *)&self->_aggregateMetrics1hrForceListener, 0);
  objc_storeStrong((id *)&self->_aggregateMetrics1hrListener, 0);
  objc_storeStrong((id *)&self->_aggregateMetrics24hrsForceListener, 0);
  objc_storeStrong((id *)&self->_aggregateMetrics24hrsListener, 0);
  objc_storeStrong((id *)&self->_aggregateMetricsTodayForceListener, 0);
  objc_storeStrong((id *)&self->_aggregateMetricsTodayListener, 0);
  objc_storeStrong((id *)&self->_aggregateMetricsForceListener, 0);
  objc_storeStrong((id *)&self->_aggregateMetricsListener, 0);
  objc_storeStrong((id *)&self->_localCache, 0);
  objc_storeStrong((id *)&self->_validReasonsDictionary, 0);
  objc_storeStrong((id *)&self->_wakeReasonString, 0);
  objc_storeStrong((id *)&self->_wakeReasons, 0);
  objc_storeStrong((id *)&self->_currentMachWakeTime, 0);
  objc_storeStrong((id *)&self->_blmAggregateCFNotification, 0);
  objc_storeStrong((id *)&self->_dailyTaskTimer, 0);
  objc_storeStrong((id *)&self->_registeredNotifications, 0);
}

@end
