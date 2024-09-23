@implementation PowerUISmartChargeUtilities

+ (int64_t)currentBatteryLevelWithContext:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;

  v3 = (void *)MEMORY[0x24BE1B180];
  v4 = a3;
  objc_msgSend(v3, "keyPathForBatteryStateDataDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE1B180], "batteryPercentageKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  return v9;
}

+ (id)timelineEventDate:(id)a3 withDefaultsDomain:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)CFPreferencesCopyAppValue(CFSTR("timeline"), (CFStringRef)a4);
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  if (v8)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v10)
    {
      v11 = v10;
      v22 = a1;
      v12 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v24 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("event"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v15, "isEqualToString:", v6);

          if (v16)
          {
            v18 = (void *)MEMORY[0x24BDBCE60];
            objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("date"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "doubleValue");
            objc_msgSend(v18, "dateWithTimeIntervalSinceReferenceDate:");
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v22, "log");
            v20 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
              +[PowerUISmartChargeUtilities timelineEventDate:withDefaultsDomain:].cold.1();

            goto LABEL_14;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v11)
          continue;
        break;
      }
    }
    v17 = 0;
LABEL_14:

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (BOOL)isPluggedInWithContext:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v3 = (void *)MEMORY[0x24BE1B180];
  v4 = a3;
  objc_msgSend(v3, "keyPathForBatteryStateDataDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE1B180], "batteryExternalConnectedKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  return v9;
}

+ (id)log
{
  void *v2;
  os_log_t v3;
  void *v4;

  v2 = (void *)log_log;
  if (!log_log)
  {
    v3 = os_log_create("com.apple.powerui.smartcharging", "utilities");
    v4 = (void *)log_log;
    log_log = (uint64_t)v3;

    v2 = (void *)log_log;
  }
  return v2;
}

+ (BOOL)isiPhone
{
  void *v2;
  char v3;

  v2 = (void *)MGGetStringAnswer();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("iPhone"));

  return v3;
}

+ (MemoryFootprint)getMemoryUsage
{
  NSObject *v3;
  unint64_t v4;
  unint64_t v5;
  mach_msg_type_number_t task_info_outCnt;
  integer_t task_info_out[4];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  int v30;
  MemoryFootprint result;

  v30 = 0;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v15 = 0u;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  *(_OWORD *)task_info_out = 0u;
  v8 = 0u;
  task_info_outCnt = 93;
  if (task_info(*MEMORY[0x24BDAEC58], 0x16u, task_info_out, &task_info_outCnt))
  {
    objc_msgSend(a1, "log");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      +[PowerUISmartChargeUtilities getMemoryUsage].cold.1();

    v4 = -1;
    v5 = -1;
  }
  else
  {
    v5 = (unint64_t)v16 >> 10;
    v4 = *((_QWORD *)&v17 + 1) / 1024;
  }
  result.var1 = v4;
  result.var0 = v5;
  return result;
}

+ (void)logMemoryUsageInternalForEvent:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;

  v4 = a3;
  if (+[PowerUISmartChargeUtilities isInternalBuild](PowerUISmartChargeUtilities, "isInternalBuild"))
  {
    v5 = +[PowerUISmartChargeUtilities getMemoryUsage](PowerUISmartChargeUtilities, "getMemoryUsage");
    v7 = v6;
    objc_msgSend(a1, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      +[PowerUISmartChargeUtilities logMemoryUsageInternalForEvent:].cold.1(v5, v7, (uint64_t)v4, v8);

  }
}

+ (BOOL)isInternalBuild
{
  if (isInternalBuild_onceToken != -1)
    dispatch_once(&isInternalBuild_onceToken, &__block_literal_global_6);
  return isInternalBuild_isInternalBuild;
}

uint64_t __46__PowerUISmartChargeUtilities_isInternalBuild__block_invoke()
{
  uint64_t result;

  result = os_variant_has_internal_ui();
  isInternalBuild_isInternalBuild = result;
  return result;
}

+ (BOOL)isiPad
{
  void *v2;
  char v3;

  v2 = (void *)MGGetStringAnswer();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("iPad"));

  return v3;
}

+ (BOOL)isiPod
{
  void *v2;
  char v3;

  v2 = (void *)MGGetStringAnswer();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("iPod"));

  return v3;
}

+ (BOOL)isUltraWatch
{
  if ((MGIsDeviceOfType() & 1) != 0)
    return 1;
  else
    return MGIsDeviceOfType();
}

+ (BOOL)isOBCSupported
{
  return objc_msgSend((id)objc_opt_class(), "isiPhone");
}

+ (BOOL)isInflowInhibitSupported
{
  return 0;
}

+ (BOOL)isDEoCDryRunSupported
{
  return +[PowerUISmartChargeUtilities isiPhone](PowerUISmartChargeUtilities, "isiPhone");
}

+ (id)getCurrentBootSessionUUID
{
  void *v3;
  void *v4;
  NSObject *v5;
  size_t size;
  uint8_t buf[4];
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  size = 0;
  sysctlbyname("kern.bootsessionuuid", 0, &size, 0, 0);
  v3 = malloc_type_malloc(size, 0x4B0C34FBuLL);
  sysctlbyname("kern.bootsessionuuid", v3, &size, 0, 0);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  free(v3);
  objc_msgSend(a1, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v9 = v4;
    _os_log_impl(&dword_215A71000, v5, OS_LOG_TYPE_DEFAULT, "Current boot session UUID: %@", buf, 0xCu);
  }

  return v4;
}

+ (void)getBatteryLevelDurations:(double *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  NSObject *v19;
  void *v20;
  _QWORD v21[7];
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint8_t buf[24];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__2;
  v27 = __Block_byref_object_dispose__2;
  v28 = 0;
  BiomeLibrary();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "Device");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "Power");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "BatteryLevel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "publisher");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __56__PowerUISmartChargeUtilities_getBatteryLevelDurations___block_invoke;
  v22[3] = &__block_descriptor_40_e23_v16__0__BPSCompletion_8l;
  v22[4] = a1;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __56__PowerUISmartChargeUtilities_getBatteryLevelDurations___block_invoke_18;
  v21[3] = &unk_24D3FBC40;
  v21[4] = &v23;
  v21[5] = a1;
  v21[6] = a3;
  v10 = (id)objc_msgSend(v9, "sinkWithCompletion:receiveInput:", v22, v21);

  if (v24[5])
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceReferenceDate");
    v13 = v12;
    objc_msgSend((id)v24[5], "timestamp");
    v15 = v14;

    objc_msgSend((id)v24[5], "eventBody");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "batteryPercentage");
    v18 = v17;

    if ((unint64_t)(uint64_t)v18 >= 0x65)
    {
      objc_msgSend(a1, "log");
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", (uint64_t)v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        +[PowerUISmartChargeUtilities getBatteryLevelDurations:].cold.1(v20, buf, v19);
      }

    }
    else
    {
      a3[(uint64_t)v18] = v13 - v15 + a3[(uint64_t)v18];
    }
  }
  _Block_object_dispose(&v23, 8);

}

void __56__PowerUISmartChargeUtilities_getBatteryLevelDurations___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (objc_msgSend(v3, "state"))
  {
    objc_msgSend(*(id *)(a1 + 32), "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __56__PowerUISmartChargeUtilities_getBatteryLevelDurations___block_invoke_cold_1(v3);

  }
}

void __56__PowerUISmartChargeUtilities_getBatteryLevelDurations___block_invoke_18(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  unint64_t v13;
  NSObject *v14;

  v4 = a2;
  v5 = v4;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (!*(_QWORD *)(v6 + 40))
    goto LABEL_4;
  objc_msgSend(v4, "timestamp");
  v8 = v7;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "timestamp");
  v10 = v9;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "eventBody");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "batteryPercentage");
  v13 = (uint64_t)v12;

  if (v13 < 0x65)
  {
    *(double *)(*(_QWORD *)(a1 + 48) + 8 * v13) = v8 - v10 + *(double *)(*(_QWORD *)(a1 + 48) + 8 * v13);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
LABEL_4:
    objc_storeStrong((id *)(v6 + 40), a2);
    goto LABEL_8;
  }
  objc_msgSend(*(id *)(a1 + 40), "log");
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    __56__PowerUISmartChargeUtilities_getBatteryLevelDurations___block_invoke_18_cold_1(v13);

LABEL_8:
}

+ (double)percentageOfBatteryDurations:(double *)a3 aboveBatteryLevel:(double)a4
{
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  NSObject *v8;

  v4 = 0;
  v5 = 0.0;
  v6 = 0.0;
  do
  {
    v7 = a3[v4];
    v5 = v5 + v7;
    if ((double)(int)v4 < a4)
      v7 = -0.0;
    v6 = v6 + v7;
    ++v4;
  }
  while (v4 != 101);
  if (v5 != 0.0)
    return v6 / v5;
  objc_msgSend(a1, "log");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    +[PowerUISmartChargeUtilities percentageOfBatteryDurations:aboveBatteryLevel:].cold.1();

  return 0.0;
}

+ (double)areaOverEightyWithBatteryLevelDurations:(double *)a3
{
  double result;

  bzero(a3, 0x328uLL);
  +[PowerUISmartChargeUtilities getBatteryLevelDurations:](PowerUISmartChargeUtilities, "getBatteryLevelDurations:", a3);
  +[PowerUISmartChargeUtilities percentageOfBatteryDurations:aboveBatteryLevel:](PowerUISmartChargeUtilities, "percentageOfBatteryDurations:aboveBatteryLevel:", a3, 75.0);
  return result;
}

+ (BOOL)isDesktopDeviceWithDurations:(double *)a3 withAOEThreshold:(double)a4
{
  return 0;
}

+ (id)percentageOfTimeForBatteryLevels:(double *)a3 withLog:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  double v8;
  unsigned int v9;
  double v10;
  uint64_t i;
  double v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  _OWORD v24[2];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  memset(v24, 0, sizeof(v24));
  v8 = 0.0;
  do
  {
    v9 = v7 / 0x19u;
    if (v9 >= 3)
      v9 = 3;
    v10 = a3[v7];
    *((double *)v24 + v9) = v10 + *((double *)v24 + v9);
    v8 = v8 + v10;
    ++v7;
  }
  while (v7 != 101);
  for (i = 0; i != 4; ++i)
  {
    v12 = *((double *)v24 + i);
    if (v12 <= 0.0)
    {
      objc_msgSend(v6, "setObject:atIndexedSubscript:", &unk_24D443630, i);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v12 / v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:atIndexedSubscript:", v13, i);

      v14 = v5;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", i);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v12);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v21 = v15;
        v22 = 2112;
        v23 = v16;
        _os_log_impl(&dword_215A71000, v14, OS_LOG_TYPE_DEFAULT, "Quartile %@: %@", buf, 0x16u);

      }
    }
  }
  v17 = v5;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v21 = v6;
    v22 = 2112;
    v23 = v18;
    _os_log_impl(&dword_215A71000, v17, OS_LOG_TYPE_DEFAULT, "Desktop Quartile Bins %@ with totalDuration %@", buf, 0x16u);

  }
  return v6;
}

+ (unint64_t)decileClassificationWithTopBinCutOff:(float *)a3
{
  void *v5;
  void *v6;
  void *v7;
  float v8;
  float v9;
  unint64_t v10;
  _QWORD v12[102];

  v12[101] = *MEMORY[0x24BDAC8D0];
  bzero(v12, 0x328uLL);
  objc_msgSend(a1, "getBatteryLevelDurations:", v12);
  objc_msgSend(a1, "log");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "percentageOfTimeForBatteryLevels:withLog:", v12, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectAtIndexedSubscript:", 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "floatValue");
  v9 = v8;

  v10 = 0;
  while (v9 <= a3[v10] || v9 > a3[v10 + 1])
  {
    if (++v10 == 11)
    {
      v10 = 0;
      break;
    }
  }

  return v10;
}

+ (BOOL)deviceWasConnectedToChargerWithinSeconds:(double)a3 withContext:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  BOOL v17;

  v5 = a4;
  objc_msgSend(MEMORY[0x24BE1B180], "keyPathForBatteryStateDataDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE1B180], "batteryExternalConnectedKey");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "BOOLValue");

  if (v10)
  {
    objc_msgSend(MEMORY[0x24BE1B180], "batteryExternalConnectedChangeDateKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      objc_msgSend(MEMORY[0x24BE1B180], "keyPathForPluginStatus");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "lastModifiedDateForContextualKeyPath:", v13);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceDate:", v12);
    v16 = v15;

    v17 = v16 < a3 && v16 > 0.0;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (BOOL)deviceConnectedToWirelessChargerWithContext:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v3 = (void *)MEMORY[0x24BE1B180];
  v4 = a3;
  objc_msgSend(v3, "keyPathForBatteryStateDataDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE1B180], "batteryAdapterIsWirelessKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "BOOLValue");

  return v9;
}

+ (id)roundedDateFromDate:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDBCE48];
  v4 = a3;
  objc_msgSend(v3, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", 124, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (uint64_t)((double)(objc_msgSend(v6, "minute") / 30 + 1) * 30.0);
  objc_msgSend(v6, "setMinute:", 0);
  objc_msgSend(v5, "dateFromComponents:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dateByAddingTimeInterval:", (double)(60 * v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)timeStringFromDate:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;

  v3 = timeStringFromDate__onceToken_0;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&timeStringFromDate__onceToken_0, &__block_literal_global_25);
  objc_msgSend((id)timeStringFromDate__formatter_0, "stringFromDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __50__PowerUISmartChargeUtilities_timeStringFromDate___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDD1500]);
  v1 = (void *)timeStringFromDate__formatter_0;
  timeStringFromDate__formatter_0 = (uint64_t)v0;

  objc_msgSend((id)timeStringFromDate__formatter_0, "setDateStyle:", 1);
  return objc_msgSend((id)timeStringFromDate__formatter_0, "setTimeStyle:", 1);
}

+ (id)pluginEventsBefore:(id)a3 withMinimumDuration:(double)a4 ignoringDisconnectsShorterThan:(double)a5
{
  id v7;
  void *v8;
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
  id v19;
  id v20;
  void *v23;
  void *v24;
  id v25;
  _QWORD v26[10];
  _QWORD v27[5];
  _QWORD v28[5];
  id v29;
  _QWORD v30[5];
  id v31;
  _QWORD v32[5];
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v25 = a3;
  v23 = (void *)os_transaction_create();
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__2;
  v38 = __Block_byref_object_dispose__2;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v39 = (id)objc_claimAutoreleasedReturnValue();
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy__2;
  v32[4] = __Block_byref_object_dispose__2;
  v33 = 0;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__2;
  v30[4] = __Block_byref_object_dispose__2;
  v31 = 0;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__2;
  v28[4] = __Block_byref_object_dispose__2;
  v29 = 0;
  v7 = objc_alloc(MEMORY[0x24BE0CC98]);
  objc_msgSend(v25, "dateByAddingTimeInterval:", -5184000.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithStartDate:endDate:maxEvents:lastN:reversed:", v8, v25, 0, 0, 0);

  BiomeLibrary();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "Device");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "Power");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "PluggedIn");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "publisherWithOptions:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  BiomeLibrary();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "Device");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "TimeZone");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "publisherWithOptions:", v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "orderedMergeWithOther:comparator:", v17, &__block_literal_global_30);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __101__PowerUISmartChargeUtilities_pluginEventsBefore_withMinimumDuration_ignoringDisconnectsShorterThan___block_invoke_2;
  v27[3] = &__block_descriptor_40_e23_v16__0__BPSCompletion_8l;
  v27[4] = a1;
  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __101__PowerUISmartChargeUtilities_pluginEventsBefore_withMinimumDuration_ignoringDisconnectsShorterThan___block_invoke_31;
  v26[3] = &unk_24D3FBCA8;
  v26[4] = v28;
  v26[5] = v30;
  v26[6] = v32;
  v26[7] = &v34;
  *(double *)&v26[8] = a5;
  *(double *)&v26[9] = a4;
  v19 = (id)objc_msgSend(v18, "sinkWithCompletion:receiveInput:", v27, v26);

  v20 = (id)v35[5];
  _Block_object_dispose(v28, 8);

  _Block_object_dispose(v30, 8);
  _Block_object_dispose(v32, 8);

  _Block_object_dispose(&v34, 8);
  return v20;
}

uint64_t __101__PowerUISmartChargeUtilities_pluginEventsBefore_withMinimumDuration_ignoringDisconnectsShorterThan___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(a2, "timestamp");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "timestamp");
  v9 = v8;

  objc_msgSend(v7, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "compare:", v10);

  return v11;
}

void __101__PowerUISmartChargeUtilities_pluginEventsBefore_withMinimumDuration_ignoringDisconnectsShorterThan___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (objc_msgSend(v3, "state"))
  {
    objc_msgSend(*(id *)(a1 + 32), "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __101__PowerUISmartChargeUtilities_pluginEventsBefore_withMinimumDuration_ignoringDisconnectsShorterThan___block_invoke_2_cold_1(v3);

  }
}

void __101__PowerUISmartChargeUtilities_pluginEventsBefore_withMinimumDuration_ignoringDisconnectsShorterThan___block_invoke_31(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  char isKindOfClass;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  PowerUIChargeSession *v30;
  uint64_t v31;
  void *v32;
  double v33;
  uint64_t v34;
  void *v35;
  id v36;

  v36 = a2;
  v3 = (void *)MEMORY[0x2199EC15C]();
  objc_msgSend(v36, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v8 = v36;
    objc_msgSend(v8, "eventBody");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "starting"))
    {
      v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);

      if (!v10)
      {
        v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v12 = v8;
        v13 = *(void **)(v11 + 40);
        *(_QWORD *)(v11 + 40) = v12;
        goto LABEL_17;
      }
    }
    else
    {

    }
    objc_msgSend(v8, "eventBody");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "starting") & 1) == 0)
    {
      v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);

      if (!v14)
        goto LABEL_18;
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "eventBody");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0.0;
      if (objc_msgSend(v15, "hasSecondsFromGMT"))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "eventBody");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "secondsFromGMT");
        v16 = v18;

      }
      v19 = (void *)MEMORY[0x24BDBCE60];
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "timestamp");
      objc_msgSend(v19, "dateWithTimeIntervalSinceReferenceDate:", v16 + v20);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)MEMORY[0x24BDBCE60];
      objc_msgSend(v8, "timestamp");
      objc_msgSend(v21, "dateWithTimeIntervalSinceReferenceDate:", v16 + v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      if (v24)
      {
        objc_msgSend(v24, "endDate");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "timeIntervalSinceDate:", v25);
        v27 = v26;
        v28 = *(double *)(a1 + 64);

        if (v27 < v28)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "removeObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "startDate");
          v29 = objc_claimAutoreleasedReturnValue();

          v13 = (void *)v29;
        }
      }
      v30 = -[PowerUIChargeSession initWithStartDate:withEndDate:withStartSoC:withEndSoC:]([PowerUIChargeSession alloc], "initWithStartDate:withEndDate:withStartSoC:withEndSoC:", v13, v23, 0, 0);
      v31 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v32 = *(void **)(v31 + 40);
      *(_QWORD *)(v31 + 40) = v30;

      objc_msgSend(v23, "timeIntervalSinceDate:", v13);
      if (v33 >= *(double *)(a1 + 72))
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      v34 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v35 = *(void **)(v34 + 40);
      *(_QWORD *)(v34 + 40) = 0;

    }
LABEL_17:

    goto LABEL_18;
  }
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = v36;
  v8 = *(id *)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v7;
LABEL_18:

  objc_autoreleasePoolPop(v3);
}

+ (id)pluginEventsBefore:(id)a3 withMinimumDuration:(double)a4 withMinimumPlugoutBatteryLevel:(double)a5 ignoringDisconnectsShorterThan:(double)a6
{
  id v9;
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
  id v21;
  id v22;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  _QWORD v34[14];
  _QWORD v35[5];
  _QWORD v36[3];
  int v37;
  _QWORD v38[5];
  id v39;
  _QWORD v40[5];
  id v41;
  _QWORD v42[5];
  id v43;
  _QWORD v44[5];
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  _QWORD v52[4];

  v52[2] = *MEMORY[0x24BDAC8D0];
  v33 = a3;
  v24 = (void *)os_transaction_create();
  v46 = 0;
  v47 = &v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__2;
  v50 = __Block_byref_object_dispose__2;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v51 = (id)objc_claimAutoreleasedReturnValue();
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x3032000000;
  v44[3] = __Block_byref_object_copy__2;
  v44[4] = __Block_byref_object_dispose__2;
  v45 = 0;
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3032000000;
  v42[3] = __Block_byref_object_copy__2;
  v42[4] = __Block_byref_object_dispose__2;
  v43 = 0;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3032000000;
  v40[3] = __Block_byref_object_copy__2;
  v40[4] = __Block_byref_object_dispose__2;
  v41 = 0;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = __Block_byref_object_copy__2;
  v38[4] = __Block_byref_object_dispose__2;
  v39 = 0;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  v37 = -1;
  v9 = objc_alloc(MEMORY[0x24BE0CC98]);
  objc_msgSend(v33, "dateByAddingTimeInterval:", -5184000.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithStartDate:endDate:maxEvents:lastN:reversed:", v10, v33, 0, 0, 0);

  BiomeLibrary();
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "Device");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "Power");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "PluggedIn");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "publisherWithOptions:", v11);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  BiomeLibrary();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "Device");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "TimeZone");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "publisherWithOptions:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v52[0] = v13;
  BiomeLibrary();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "Device");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "Power");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "BatteryLevel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "publisherWithOptions:", v11);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v52[1] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v52, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "orderedMergeWithOthers:comparator:", v19, &__block_literal_global_36);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __132__PowerUISmartChargeUtilities_pluginEventsBefore_withMinimumDuration_withMinimumPlugoutBatteryLevel_ignoringDisconnectsShorterThan___block_invoke_2;
  v35[3] = &__block_descriptor_40_e23_v16__0__BPSCompletion_8l;
  v35[4] = a1;
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __132__PowerUISmartChargeUtilities_pluginEventsBefore_withMinimumDuration_withMinimumPlugoutBatteryLevel_ignoringDisconnectsShorterThan___block_invoke_37;
  v34[3] = &unk_24D3FBCF0;
  v34[4] = v38;
  v34[5] = v40;
  v34[6] = v42;
  v34[7] = v36;
  v34[8] = v44;
  v34[9] = &v46;
  *(double *)&v34[10] = a6;
  *(double *)&v34[11] = a4;
  *(double *)&v34[12] = a5;
  v34[13] = a1;
  v21 = (id)objc_msgSend(v20, "sinkWithCompletion:receiveInput:", v35, v34);

  v22 = (id)v47[5];
  _Block_object_dispose(v36, 8);
  _Block_object_dispose(v38, 8);

  _Block_object_dispose(v40, 8);
  _Block_object_dispose(v42, 8);

  _Block_object_dispose(v44, 8);
  _Block_object_dispose(&v46, 8);

  return v22;
}

uint64_t __132__PowerUISmartChargeUtilities_pluginEventsBefore_withMinimumDuration_withMinimumPlugoutBatteryLevel_ignoringDisconnectsShorterThan___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(a2, "timestamp");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "timestamp");
  v9 = v8;

  objc_msgSend(v7, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "compare:", v10);

  return v11;
}

void __132__PowerUISmartChargeUtilities_pluginEventsBefore_withMinimumDuration_withMinimumPlugoutBatteryLevel_ignoringDisconnectsShorterThan___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (objc_msgSend(v3, "state"))
  {
    objc_msgSend(*(id *)(a1 + 32), "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __101__PowerUISmartChargeUtilities_pluginEventsBefore_withMinimumDuration_ignoringDisconnectsShorterThan___block_invoke_2_cold_1(v3);

  }
}

void __132__PowerUISmartChargeUtilities_pluginEventsBefore_withMinimumDuration_withMinimumPlugoutBatteryLevel_ignoringDisconnectsShorterThan___block_invoke_37(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  uint64_t v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  double v15;
  uint64_t v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  void *v33;
  PowerUIChargeSession *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;

  v4 = a2;
  v5 = (void *)MEMORY[0x2199EC15C]();
  objc_msgSend(v4, "eventBody");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(v4, "eventBody");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v10 = objc_opt_isKindOfClass();

    if ((v10 & 1) != 0)
    {
      v8 = *(_QWORD *)(a1 + 40);
      goto LABEL_5;
    }
    v11 = v4;
    objc_msgSend(v11, "eventBody");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "starting"))
    {
      v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);

      if (!v13)
      {
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "eventBody");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "batteryPercentage");
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = (int)v15;
        goto LABEL_11;
      }
    }
    else
    {

    }
    objc_msgSend(v11, "eventBody");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v14, "starting") & 1) == 0)
    {
      v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);

      if (v16)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "eventBody");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 0.0;
        if (objc_msgSend(v17, "hasSecondsFromGMT"))
        {
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "eventBody");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "secondsFromGMT");
          v18 = v20;

        }
        v21 = (void *)MEMORY[0x24BDBCE60];
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "timestamp");
        objc_msgSend(v21, "dateWithTimeIntervalSinceReferenceDate:", v18 + v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)MEMORY[0x24BDBCE60];
        objc_msgSend(v11, "timestamp");
        objc_msgSend(v24, "dateWithTimeIntervalSinceReferenceDate:", v18 + v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
        if (v27)
        {
          objc_msgSend(v27, "endDate");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "timeIntervalSinceDate:", v28);
          v30 = v29;
          v31 = *(double *)(a1 + 80);

          if (v30 < v31)
          {
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "removeObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "startDate");
            v32 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), "startSoC");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v33, "intValue");

            v23 = (void *)v32;
          }
        }
        v34 = [PowerUIChargeSession alloc];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "eventBody");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "batteryPercentage");
        objc_msgSend(v36, "numberWithDouble:");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = -[PowerUIChargeSession initWithStartDate:withEndDate:withStartSoC:withEndSoC:](v34, "initWithStartDate:withEndDate:withStartSoC:withEndSoC:", v23, v26, v35, v38);
        v40 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v41 = *(void **)(v40 + 40);
        *(_QWORD *)(v40 + 40) = v39;

        objc_msgSend(v26, "timeIntervalSinceDate:", v23);
        if (v42 >= *(double *)(a1 + 88))
        {
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "eventBody");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "batteryPercentage");
          v45 = v44;
          v46 = *(double *)(a1 + 96);

          if (v45 >= v46)
          {
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40));
            objc_msgSend(*(id *)(a1 + 104), "log");
            v47 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG))
              __132__PowerUISmartChargeUtilities_pluginEventsBefore_withMinimumDuration_withMinimumPlugoutBatteryLevel_ignoringDisconnectsShorterThan___block_invoke_37_cold_1(a1 + 64, v47, v48, v49, v50, v51, v52, v53);

          }
        }
        v54 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v55 = *(void **)(v54 + 40);
        *(_QWORD *)(v54 + 40) = 0;

        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = -1;
      }
      goto LABEL_24;
    }
LABEL_11:

LABEL_24:
    goto LABEL_25;
  }
  v8 = *(_QWORD *)(a1 + 32);
LABEL_5:
  objc_storeStrong((id *)(*(_QWORD *)(v8 + 8) + 40), a2);
LABEL_25:
  objc_autoreleasePoolPop(v5);

}

+ (id)drainBetweenRelevantEventsBefore:(id)a3 withMinimumDuration:(double)a4
{
  void *v5;
  void *v6;

  objc_msgSend(a1, "drainSessionsInfoBetweenRelevantChargesBefore:withMinimumDuration:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "drainBetweenRelevantEventsFromDrainSessionInfo:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)drainBetweenRelevantEventsFromDrainSessionInfo:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v10, "objectForKey:", CFSTR("drain_depth"), (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("drain_depth"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v12);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

+ (id)curentDateStringFromDate:(id)a3 withFormat:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;

  v5 = (objc_class *)MEMORY[0x24BDD1500];
  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(v5);
  objc_msgSend(v8, "setDateFormat:", v6);

  objc_msgSend(v8, "stringFromDate:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)drainSessionsInfoBetweenRelevantChargesBefore:(id)a3 withMinimumDuration:(double)a4
{
  id v5;
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
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  id v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  _QWORD v34[15];
  _QWORD v35[5];
  _QWORD v36[5];
  id v37;
  _QWORD v38[5];
  id v39;
  _QWORD v40[5];
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  _QWORD v48[5];
  id v49;
  _QWORD v50[5];
  id v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  _QWORD v58[3];
  char v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69;
  _QWORD v70[4];

  v70[2] = *MEMORY[0x24BDAC8D0];
  v32 = a3;
  v23 = (void *)os_transaction_create();
  v24 = (id)objc_opt_new();
  v64 = 0;
  v65 = &v64;
  v66 = 0x3032000000;
  v67 = __Block_byref_object_copy__2;
  v68 = __Block_byref_object_dispose__2;
  v69 = (id)objc_opt_new();
  v60 = 0;
  v61 = &v60;
  v62 = 0x2020000000;
  v63 = 0;
  v58[0] = 0;
  v58[1] = v58;
  v58[2] = 0x2020000000;
  v59 = 0;
  v52 = 0;
  v53 = &v52;
  v54 = 0x3032000000;
  v55 = __Block_byref_object_copy__2;
  v56 = __Block_byref_object_dispose__2;
  v57 = 0;
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x3032000000;
  v50[3] = __Block_byref_object_copy__2;
  v50[4] = __Block_byref_object_dispose__2;
  v51 = 0;
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x3032000000;
  v48[3] = __Block_byref_object_copy__2;
  v48[4] = __Block_byref_object_dispose__2;
  v49 = 0;
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__2;
  v46 = __Block_byref_object_dispose__2;
  v47 = 0;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3032000000;
  v40[3] = __Block_byref_object_copy__2;
  v40[4] = __Block_byref_object_dispose__2;
  v41 = 0;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = __Block_byref_object_copy__2;
  v38[4] = __Block_byref_object_dispose__2;
  v39 = 0;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = __Block_byref_object_copy__2;
  v36[4] = __Block_byref_object_dispose__2;
  v37 = 0;
  v5 = objc_alloc(MEMORY[0x24BE0CC98]);
  objc_msgSend(v32, "dateByAddingTimeInterval:", -5184000.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)objc_msgSend(v5, "initWithStartDate:endDate:maxEvents:lastN:reversed:", v6, v32, 0, 0, 0);

  BiomeLibrary();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "Device");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "Power");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "PluggedIn");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "publisherWithOptions:", v33);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  BiomeLibrary();
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "Device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "Power");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "BatteryLevel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "publisherWithOptions:", v33);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v70[0] = v10;
  BiomeLibrary();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "Device");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "TimeZone");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "publisherWithOptions:", v33);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v70[1] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v70, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "orderedMergeWithOthers:comparator:", v15, &__block_literal_global_42);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __97__PowerUISmartChargeUtilities_drainSessionsInfoBetweenRelevantChargesBefore_withMinimumDuration___block_invoke_2;
  v35[3] = &__block_descriptor_40_e23_v16__0__BPSCompletion_8l;
  v35[4] = a1;
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __97__PowerUISmartChargeUtilities_drainSessionsInfoBetweenRelevantChargesBefore_withMinimumDuration___block_invoke_43;
  v34[3] = &unk_24D3FBD38;
  v34[4] = v36;
  v34[5] = &v52;
  v34[6] = &v60;
  v34[7] = &v42;
  v34[8] = v58;
  v34[9] = v38;
  v34[10] = v50;
  v34[11] = &v64;
  *(double *)&v34[14] = a4;
  v34[12] = v40;
  v34[13] = v48;
  v17 = (id)objc_msgSend(v16, "sinkWithCompletion:receiveInput:", v35, v34);

  if (objc_msgSend((id)v65[5], "count") && v53[5] && !v43[5] && v61[3] >= 1)
  {
    objc_msgSend((id)v65[5], "lastObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", v61[3]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v19, CFSTR("drain_depth"));

    v20 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend((id)v53[5], "timestamp");
    objc_msgSend(v20, "dateWithTimeIntervalSinceReferenceDate:");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v21, CFSTR("drain_end"));

  }
  objc_msgSend(a1, "mergeDrainSessionsInfo:intoResult:", v65[5], v24);

  _Block_object_dispose(v36, 8);
  _Block_object_dispose(v38, 8);

  _Block_object_dispose(v40, 8);
  _Block_object_dispose(&v42, 8);

  _Block_object_dispose(v48, 8);
  _Block_object_dispose(v50, 8);

  _Block_object_dispose(&v52, 8);
  _Block_object_dispose(v58, 8);
  _Block_object_dispose(&v60, 8);
  _Block_object_dispose(&v64, 8);

  return v24;
}

uint64_t __97__PowerUISmartChargeUtilities_drainSessionsInfoBetweenRelevantChargesBefore_withMinimumDuration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(a2, "timestamp");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "timestamp");
  v9 = v8;

  objc_msgSend(v7, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "compare:", v10);

  return v11;
}

void __97__PowerUISmartChargeUtilities_drainSessionsInfoBetweenRelevantChargesBefore_withMinimumDuration___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (objc_msgSend(v3, "state"))
  {
    objc_msgSend(*(id *)(a1 + 32), "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __97__PowerUISmartChargeUtilities_drainSessionsInfoBetweenRelevantChargesBefore_withMinimumDuration___block_invoke_2_cold_1(v3);

  }
}

void __97__PowerUISmartChargeUtilities_drainSessionsInfoBetweenRelevantChargesBefore_withMinimumDuration___block_invoke_43(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  char isKindOfClass;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  char v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  char v29;
  void *v30;
  double v31;
  void *v32;
  double v33;
  void *v34;
  double v35;
  void *v36;
  double v37;
  void *v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  double v51;
  double v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  int v62;
  uint64_t v63;
  void *v64;
  void *v65;
  double v66;
  void *v67;
  double v68;
  void *v69;
  double v70;
  void *v71;
  id v72;

  v72 = a2;
  v4 = (void *)MEMORY[0x2199EC15C]();
  objc_msgSend(v72, "eventBody");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = v72;
    v9 = *(id *)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v8;
  }
  else
  {
    objc_msgSend(v72, "eventBody");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v11 = objc_opt_isKindOfClass();

    if ((v11 & 1) == 0)
    {
      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
        goto LABEL_4;
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), a2);
      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "eventBody");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = objc_msgSend(v61, "starting");

        v63 = *(_QWORD *)(a1 + 56);
        if (v62)
        {
          objc_storeStrong((id *)(*(_QWORD *)(v63 + 8) + 40), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
          if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "count"))
            goto LABEL_4;
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "lastObject");
          v9 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v64, CFSTR("drain_depth"));

          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "eventBody");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = 0.0;
          if (objc_msgSend(v65, "hasSecondsFromGMT"))
          {
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "eventBody");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "secondsFromGMT");
            v66 = v68;

          }
          v69 = (void *)MEMORY[0x24BDBCE60];
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "timestamp");
          objc_msgSend(v69, "dateWithTimeIntervalSinceReferenceDate:", v66 + v70);
          v71 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v71, CFSTR("drain_end"));

          goto LABEL_3;
        }
        if (!*(_QWORD *)(*(_QWORD *)(v63 + 8) + 40))
          goto LABEL_4;
      }
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), "eventBody");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "starting");

      if ((v29 & 1) != 0)
        goto LABEL_4;
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "eventBody");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 0.0;
      if (objc_msgSend(v30, "hasSecondsFromGMT"))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "eventBody");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "secondsFromGMT");
        v31 = v33;

      }
      v34 = (void *)MEMORY[0x24BDBCE60];
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "timestamp");
      objc_msgSend(v34, "dateWithTimeIntervalSinceReferenceDate:", v31 + v35);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      v36 = (void *)MEMORY[0x24BDBCE60];
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "timestamp");
      objc_msgSend(v36, "dateWithTimeIntervalSinceReferenceDate:", v31 + v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "timeIntervalSinceDate:", v9);
      if (v39 >= *(double *)(a1 + 112))
      {
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
        v40 = (void *)objc_opt_new();
        objc_msgSend(v40, "setObject:forKeyedSubscript:", v9, CFSTR("start"));
        objc_msgSend(v40, "setObject:forKeyedSubscript:", v38, CFSTR("end"));
        v41 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(v38, "timeIntervalSinceDate:", v9);
        objc_msgSend(v41, "numberWithDouble:");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setObject:forKeyedSubscript:", v42, CFSTR("charge_duration"));

        v43 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "eventBody");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "batteryPercentage");
        objc_msgSend(v43, "numberWithDouble:");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setObject:forKeyedSubscript:", v45, CFSTR("charge_end_soc"));

        v46 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "eventBody");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "batteryPercentage");
        objc_msgSend(v46, "numberWithDouble:");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setObject:forKeyedSubscript:", v48, CFSTR("charge_start_soc"));

        objc_msgSend(v40, "setObject:forKeyedSubscript:", &unk_24D443630, CFSTR("drain_depth"));
        objc_msgSend(v40, "setObject:forKeyedSubscript:", &unk_24D443630, CFSTR("drain_duration"));
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setObject:forKeyedSubscript:", v49, CFSTR("relevant_charge_session"));

        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), "eventBody");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "batteryPercentage");
        v52 = v51;

        if (v52 <= 0.0)
          objc_msgSend(v40, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], CFSTR("relevant_charge_session"));
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "addObject:", v40);

      }
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
      v53 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v54 = *(void **)(v53 + 40);
      *(_QWORD *)(v53 + 40) = 0;

      v55 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
      v56 = *(void **)(v55 + 40);
      *(_QWORD *)(v55 + 40) = 0;

      v57 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      v58 = *(void **)(v57 + 40);
      *(_QWORD *)(v57 + 40) = 0;

      v59 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
      v60 = *(void **)(v59 + 40);
      *(_QWORD *)(v59 + 40) = 0;

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
      goto LABEL_3;
    }
    v9 = v72;
    v12 = *(_QWORD *)(a1 + 40);
    v13 = *(void **)(*(_QWORD *)(v12 + 8) + 40);
    if (v13)
    {
      objc_msgSend(v13, "eventBody");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "batteryPercentage");
      v16 = v15;
      objc_msgSend(v9, "eventBody");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "batteryPercentage");
      v19 = v18;

      v12 = *(_QWORD *)(a1 + 40);
      if (v16 > v19)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(v12 + 8) + 40), "eventBody");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "batteryPercentage");
        v22 = v21;
        objc_msgSend(v9, "eventBody");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "batteryPercentage");
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = (uint64_t)(v22
                                                                              - v24
                                                                              + (double)*(uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));

        v12 = *(_QWORD *)(a1 + 40);
      }
    }
    objc_storeStrong((id *)(*(_QWORD *)(v12 + 8) + 40), a2);
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "eventBody");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "batteryPercentage");
      v27 = v26;

      if (v27 >= 80.0)
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    }
  }
LABEL_3:

LABEL_4:
  objc_autoreleasePoolPop(v4);

}

+ (void)mergeDrainSessionsInfo:(id)a3 intoResult:(id)a4
{
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  BOOL v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  unint64_t v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  int v42;
  int v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  double v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  int v63;
  void *v64;
  id v65;

  v65 = a3;
  v61 = a4;
  v5 = (void *)objc_opt_new();
  if (objc_msgSend(v65, "count"))
  {
    v6 = 0;
    v7 = 0;
    v8 = 0;
    do
    {
      v9 = v8;
      objc_msgSend(v65, "objectAtIndexedSubscript:", v6, v61);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v10, "mutableCopy");

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("relevant_charge_session"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "BOOLValue");

      v13 = v7;
      if (objc_msgSend(v65, "count") > (unint64_t)v7)
      {
        v14 = v65;
        while (1)
        {
          objc_msgSend(v14, "objectAtIndexedSubscript:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("drain_depth"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "integerValue");

          if (v17)
            break;
          objc_msgSend(v65, "objectAtIndexedSubscript:", v13);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("relevant_charge_session"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v12 |= objc_msgSend(v19, "BOOLValue");

          ++v13;
          ++v7;
          v20 = objc_msgSend(v65, "count") > v13;
          v14 = v65;
          if (!v20)
            goto LABEL_9;
        }
      }
      v14 = v65;
LABEL_9:
      if (objc_msgSend(v14, "count") <= v13)
        break;
      objc_msgSend(v65, "objectAtIndexedSubscript:", v13);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("charge_end_soc"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v22, CFSTR("charge_end_soc"));

      objc_msgSend(v65, "objectAtIndexedSubscript:", v13);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("end"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v24, CFSTR("end"));

      v25 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("end"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("start"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "timeIntervalSinceDate:", v27);
      objc_msgSend(v25, "numberWithDouble:");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v28, CFSTR("charge_duration"));

      objc_msgSend(v65, "objectAtIndexedSubscript:", v13);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "objectForKeyedSubscript:", CFSTR("drain_depth"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v30, CFSTR("drain_depth"));

      objc_msgSend(v65, "objectAtIndexedSubscript:", v13);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("drain_end"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v32, CFSTR("drain_end"));

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v12 & 1);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v33, CFSTR("relevant_charge_session"));

      objc_msgSend(v5, "addObject:", v8);
      v6 = ++v7;
    }
    while (objc_msgSend(v65, "count") > (unint64_t)v7);
  }
  else
  {
    v8 = 0;
  }
  if (!objc_msgSend(v5, "count", v61))
  {
    v60 = v8;
    v36 = v62;
    goto LABEL_28;
  }
  v34 = 0;
  v35 = 0;
  v36 = v62;
  do
  {
    objc_msgSend(v5, "objectAtIndexedSubscript:", v34);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = (void *)objc_msgSend(v37, "mutableCopy");

    objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("drain_depth"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "integerValue");

    v64 = v38;
    objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("drain_end"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v35 + 1;
    v34 = v42;
    if (objc_msgSend(v5, "count") <= (unint64_t)v42)
    {
      v63 = v42;
      v43 = 0;
      goto LABEL_25;
    }
    v43 = 0;
    while (1)
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v34);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "objectForKeyedSubscript:", CFSTR("relevant_charge_session"));
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v45, "BOOLValue") & 1) == 0)
      {

        goto LABEL_21;
      }
      objc_msgSend(v5, "objectAtIndexedSubscript:", v34);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "objectForKeyedSubscript:", CFSTR("charge_start_soc"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v47, "integerValue");

      if (v48 > 0)
        break;
LABEL_21:
      objc_msgSend(v5, "objectAtIndexedSubscript:", v34);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "objectForKeyedSubscript:", CFSTR("drain_depth"));
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v40 += objc_msgSend(v50, "integerValue");

      objc_msgSend(v5, "objectAtIndexedSubscript:", v34);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "objectForKeyedSubscript:", CFSTR("drain_end"));
      v54 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "objectAtIndexedSubscript:", v34);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "objectForKeyedSubscript:", CFSTR("charge_duration"));
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v43 += objc_msgSend(v53, "integerValue");

      ++v34;
      v41 = (void *)v54;
      if (objc_msgSend(v5, "count") <= v34)
        goto LABEL_24;
    }
    v54 = (uint64_t)v41;
LABEL_24:
    v63 = v34;
    v34 = (int)v34;
    v41 = (void *)v54;
    v36 = v62;
LABEL_25:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", v40);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setObject:forKeyedSubscript:", v55, CFSTR("drain_depth"));

    objc_msgSend(v64, "setObject:forKeyedSubscript:", v41, CFSTR("drain_end"));
    v56 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v64, "objectForKeyedSubscript:", CFSTR("end"));
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "timeIntervalSinceDate:", v57);
    objc_msgSend(v56, "numberWithDouble:", v58 - (double)v43);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "setObject:forKeyedSubscript:", v59, CFSTR("drain_duration"));

    v60 = v64;
    objc_msgSend(v36, "addObject:", v64);

    v8 = v64;
    v35 = v63;
  }
  while (objc_msgSend(v5, "count") > v34);
LABEL_28:

}

+ (double)timestampOfFirstEventReachingBatteryLevel:(int)a3 betweenStartTime:(id)a4 andEndTime:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  double v17;
  id v20;
  _QWORD v21[5];
  int v22;
  _QWORD v23[5];
  _QWORD v24[4];
  int v25;
  uint64_t v26;
  double *v27;
  uint64_t v28;
  uint64_t v29;

  v20 = a4;
  v7 = a5;
  v26 = 0;
  v27 = (double *)&v26;
  v28 = 0x2020000000;
  v29 = 0;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0CC98]), "initWithStartDate:endDate:maxEvents:lastN:reversed:", v20, v7, 0, 0, 0);
  BiomeLibrary();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "Device");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "Power");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "BatteryLevel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "publisherWithOptions:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __101__PowerUISmartChargeUtilities_timestampOfFirstEventReachingBatteryLevel_betweenStartTime_andEndTime___block_invoke;
  v24[3] = &__block_descriptor_36_e22_B16__0__BMStoreEvent_8l;
  v25 = a3;
  objc_msgSend(v13, "filterWithIsIncluded:", v24);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v14;
  v23[1] = 3221225472;
  v23[2] = __101__PowerUISmartChargeUtilities_timestampOfFirstEventReachingBatteryLevel_betweenStartTime_andEndTime___block_invoke_2;
  v23[3] = &__block_descriptor_40_e23_v16__0__BPSCompletion_8l;
  v23[4] = a1;
  v21[0] = v14;
  v21[1] = 3221225472;
  v21[2] = __101__PowerUISmartChargeUtilities_timestampOfFirstEventReachingBatteryLevel_betweenStartTime_andEndTime___block_invoke_63;
  v21[3] = &unk_24D3FBD80;
  v22 = a3;
  v21[4] = &v26;
  v16 = (id)objc_msgSend(v15, "sinkWithCompletion:shouldContinue:", v23, v21);

  v17 = v27[3];
  _Block_object_dispose(&v26, 8);

  return v17;
}

BOOL __101__PowerUISmartChargeUtilities_timestampOfFirstEventReachingBatteryLevel_betweenStartTime_andEndTime___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  double v4;
  _BOOL8 v5;

  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "batteryPercentage");
  v5 = v4 >= (double)*(int *)(a1 + 32);

  return v5;
}

void __101__PowerUISmartChargeUtilities_timestampOfFirstEventReachingBatteryLevel_betweenStartTime_andEndTime___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (objc_msgSend(v3, "state"))
  {
    objc_msgSend(*(id *)(a1 + 32), "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __101__PowerUISmartChargeUtilities_timestampOfFirstEventReachingBatteryLevel_betweenStartTime_andEndTime___block_invoke_2_cold_1(v3);

  }
}

BOOL __101__PowerUISmartChargeUtilities_timestampOfFirstEventReachingBatteryLevel_betweenStartTime_andEndTime___block_invoke_63(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;

  v3 = a2;
  objc_msgSend(v3, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "batteryPercentage");
  v6 = v5;
  v7 = (double)*(int *)(a1 + 40);

  if (v6 >= v7)
  {
    objc_msgSend(v3, "timestamp");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v8;
  }

  return v6 < v7;
}

+ (id)historicalFullChargeDurationStartingAt:(int)a3 withMinimumPluginDuration:(int)a4
{
  NSObject *v5;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  _QWORD v25[7];
  int v26;
  int v27;
  _QWORD v28[5];
  _QWORD v29[4];
  _QWORD v30[4];
  uint64_t v31;
  _QWORD v32[4];
  id v33;

  if (a3 > 79)
  {
    v31 = 0;
    v32[0] = &v31;
    v32[1] = 0x3032000000;
    v32[2] = __Block_byref_object_copy__2;
    v32[3] = __Block_byref_object_dispose__2;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v33 = (id)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x2199EC15C]();
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x2020000000;
    v30[3] = 0;
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x2020000000;
    v29[3] = 0;
    BiomeLibrary();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "Device");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "Charging");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "SmartCharging");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "publisher");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "filterWithIsIncluded:", &__block_literal_global_64);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __96__PowerUISmartChargeUtilities_historicalFullChargeDurationStartingAt_withMinimumPluginDuration___block_invoke_2;
    v28[3] = &__block_descriptor_40_e23_v16__0__BPSCompletion_8l;
    v28[4] = a1;
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __96__PowerUISmartChargeUtilities_historicalFullChargeDurationStartingAt_withMinimumPluginDuration___block_invoke_65;
    v25[3] = &unk_24D3FBDC8;
    v25[4] = v30;
    v25[5] = v29;
    v26 = a3;
    v27 = a4;
    v25[6] = &v31;
    v16 = (id)objc_msgSend(v15, "sinkWithCompletion:receiveInput:", v28, v25);

    objc_msgSend(a1, "log");
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      +[PowerUISmartChargeUtilities historicalFullChargeDurationStartingAt:withMinimumPluginDuration:].cold.2((uint64_t)v32, v17, v18, v19, v20, v21, v22, v23);

    _Block_object_dispose(v29, 8);
    _Block_object_dispose(v30, 8);
    objc_autoreleasePoolPop(v9);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", *(_QWORD *)(v32[0] + 40));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    _Block_object_dispose(&v31, 8);

    return v24;
  }
  else
  {
    objc_msgSend(a1, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      +[PowerUISmartChargeUtilities historicalFullChargeDurationStartingAt:withMinimumPluginDuration:].cold.1();

    return MEMORY[0x24BDBD1A8];
  }
}

BOOL __96__PowerUISmartChargeUtilities_historicalFullChargeDurationStartingAt_withMinimumPluginDuration___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  _BOOL8 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = a2;
  objc_msgSend(v2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "obcEvent") == 6)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(v2, "eventBody");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "obcEvent") == 12)
    {
      v4 = 1;
    }
    else
    {
      objc_msgSend(v2, "eventBody");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "obcEvent") == 7)
      {
        v4 = 1;
      }
      else
      {
        objc_msgSend(v2, "eventBody");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "obcEvent") == 9)
        {
          v4 = 1;
        }
        else
        {
          objc_msgSend(v2, "eventBody");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v4 = objc_msgSend(v8, "obcEvent") == 10;

        }
      }

    }
  }

  return v4;
}

void __96__PowerUISmartChargeUtilities_historicalFullChargeDurationStartingAt_withMinimumPluginDuration___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (objc_msgSend(v3, "state"))
  {
    objc_msgSend(*(id *)(a1 + 32), "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __96__PowerUISmartChargeUtilities_historicalFullChargeDurationStartingAt_withMinimumPluginDuration___block_invoke_2_cold_1(v3);

  }
}

void __96__PowerUISmartChargeUtilities_historicalFullChargeDurationStartingAt_withMinimumPluginDuration___block_invoke_65(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  double v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  id v29;

  v29 = a2;
  objc_msgSend(v29, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "obcEvent");

  if (v4 == 12)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    goto LABEL_11;
  }
  objc_msgSend(v29, "eventBody");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "obcEvent");

  objc_msgSend(v29, "eventBody");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 == 6)
  {
    v9 = objc_msgSend(v7, "batteryLevel");
    v10 = *(_DWORD *)(a1 + 56);

    if (v9 > v10)
      goto LABEL_11;
    objc_msgSend(v29, "timestamp");
    v12 = *(_QWORD *)(a1 + 40);
LABEL_10:
    *(_QWORD *)(*(_QWORD *)(v12 + 8) + 24) = v11;
    goto LABEL_11;
  }
  if (objc_msgSend(v7, "obcEvent") == 7)
  {

    v13 = v29;
LABEL_9:
    objc_msgSend(v13, "timestamp");
    v12 = *(_QWORD *)(a1 + 32);
    goto LABEL_10;
  }
  objc_msgSend(v29, "eventBody");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "obcEvent");

  v13 = v29;
  if (v15 == 9)
    goto LABEL_9;
  objc_msgSend(v29, "eventBody");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "obcEvent") != 10)
  {
LABEL_19:

    goto LABEL_11;
  }
  objc_msgSend(v29, "eventBody");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "batteryLevel") != 100
    || *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) == 0.0)
  {

    goto LABEL_19;
  }
  v18 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

  if (v18 != 0.0)
  {
    v19 = *(unsigned int *)(a1 + 56);
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceReferenceDate:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(v29, "timestamp");
    objc_msgSend(v21, "dateWithTimeIntervalSinceReferenceDate:");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[PowerUISmartChargeUtilities timestampOfFirstEventReachingBatteryLevel:betweenStartTime:andEndTime:](PowerUISmartChargeUtilities, "timestampOfFirstEventReachingBatteryLevel:betweenStartTime:andEndTime:", v19, v20, v22);
    v24 = v23;

    objc_msgSend(v29, "timestamp");
    if (v25 - *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) > (double)*(int *)(a1 + 60))
    {
      v26 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      v27 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v29, "timestamp");
      objc_msgSend(v27, "numberWithDouble:", v28 - v24);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "addObject:", v16);
      goto LABEL_19;
    }
  }
LABEL_11:

}

+ (double)cachedHistorical80ToFullDuration
{
  if (cachedHistorical80ToFullDuration_onceToken != -1)
    dispatch_once(&cachedHistorical80ToFullDuration_onceToken, &__block_literal_global_66);
  return *(double *)&cachedHistorical80ToFullDuration_eightyToFullDuration;
}

double __63__PowerUISmartChargeUtilities_cachedHistorical80ToFullDuration__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  double v3;
  double result;
  id v5;
  id v6;

  +[PowerUISmartChargeUtilities historicalFullChargeDurationStartingAt:withMinimumPluginDuration:](PowerUISmartChargeUtilities, "historicalFullChargeDurationStartingAt:withMinimumPluginDuration:", 80, 300);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v5, "count") < 3)
  {
    v2 = v5;
  }
  else
  {
    objc_msgSend(v5, "sortedArrayUsingSelector:", sel_compare_);
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "subarrayWithRange:", 1, objc_msgSend(v0, "count") - 2);
    v1 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v1;
  }
  v6 = v2;
  objc_msgSend(v2, "percentile:", 0.9);
  *(double *)&cachedHistorical80ToFullDuration_eightyToFullDuration = v3 / 60.0;

  return result;
}

+ (id)batteryProperties
{
  mach_port_t v2;
  const __CFDictionary *v3;
  io_service_t MatchingService;
  io_object_t v5;
  CFMutableDictionaryRef v6;
  void *v7;
  CFMutableDictionaryRef properties;

  v2 = *MEMORY[0x24BDD8B20];
  v3 = IOServiceMatching("IOPMPowerSource");
  MatchingService = IOServiceGetMatchingService(v2, v3);
  if (!MatchingService)
    return 0;
  v5 = MatchingService;
  properties = 0;
  IORegistryEntryCreateCFProperties(MatchingService, &properties, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  v6 = properties;
  v7 = (void *)-[__CFDictionary copy](properties, "copy");

  IOObjectRelease(v5);
  return v7;
}

+ (id)concatenateChargeSessions:(id)a3 withMaxDeltaSecondsBetweenEvents:(unint64_t)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  int v24;
  unint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  PowerUIChargeSession *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  id v37;
  void *v38;
  PowerUIChargeSession *v39;
  void *v40;
  id v41;
  uint8_t buf[4];
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if ((unint64_t)objc_msgSend(v5, "count") > 1)
  {
    v37 = a1;
    objc_msgSend(v5, "reverseObjectEnumerator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allObjects");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v41 = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "count");
    LODWORD(v9) = v8 - 1;
    if (v8 >= 2)
    {
      do
      {
        v10 = v9;
        do
        {
          objc_msgSend(v6, "objectAtIndexedSubscript:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v11, "isEqual:", v12))
          {

            v13 = v10;
          }
          else
          {
            objc_msgSend(v6, "objectAtIndexedSubscript:", v10);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            v13 = v10;
            if (v14)
              goto LABEL_10;
          }
          --v10;
        }
        while (v13 > 0);
        LODWORD(v10) = -1;
LABEL_10:
        LODWORD(v9) = v10 - 1;
        if ((int)v10 < 1)
        {
LABEL_18:
          if ((v9 & 0x80000000) == 0)
          {
            v9 = v9;
            while (1)
            {
              objc_msgSend(v6, "objectAtIndexedSubscript:", v9);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "startDate");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "objectAtIndexedSubscript:", v9 + 1);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "endDate");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "timeIntervalSinceDate:", v22);
              v24 = (int)v23;
              v25 = (int)v23 >= 0 ? v24 : -v24;

              if (v25 > a4)
                break;
              v18 = v9-- <= 0;
              if (v18)
                goto LABEL_26;
            }
          }
        }
        else
        {
          v9 = (v10 - 1);
          do
          {
            objc_msgSend(v6, "objectAtIndexedSubscript:", v9);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDBCEF8], "null");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v15, "isEqual:", v16))
            {

            }
            else
            {
              objc_msgSend(v6, "objectAtIndexedSubscript:", v9);
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              if (v17)
                goto LABEL_18;
            }
            v18 = v9-- <= 0;
          }
          while (!v18);
LABEL_26:
          LODWORD(v9) = -1;
        }
        if ((int)v9 >= (int)v10 - 1)
        {
          objc_msgSend(v6, "objectAtIndexedSubscript:", (int)v10);
          v32 = (PowerUIChargeSession *)objc_claimAutoreleasedReturnValue();
          LODWORD(v9) = v10 - 1;
        }
        else
        {
          v39 = [PowerUIChargeSession alloc];
          objc_msgSend(v6, "objectAtIndexedSubscript:", (int)v10);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "startDate");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "objectAtIndexedSubscript:", (int)v9 + 1);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "endDate");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "objectAtIndexedSubscript:", (int)v10);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "startSoC");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "objectAtIndexedSubscript:", (int)v9 + 1);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "endSoC");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = -[PowerUIChargeSession initWithStartDate:withEndDate:withStartSoC:withEndSoC:](v39, "initWithStartDate:withEndDate:withStartSoC:withEndSoC:", v38, v27, v29, v31);

        }
        objc_msgSend(v41, "addObject:", v32);

      }
      while ((int)v9 > 0);
    }
    if (!(_DWORD)v9)
    {
      objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "addObject:", v33);

    }
    objc_msgSend(v37, "log");
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v6, "count") - objc_msgSend(v41, "count"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v44 = v35;
      _os_log_impl(&dword_215A71000, v34, OS_LOG_TYPE_DEFAULT, "Concatenated %@ events", buf, 0xCu);

    }
  }
  else
  {
    v6 = v5;
    v41 = v6;
  }

  return v41;
}

+ (id)recentEngagementHistory
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL8 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _BOOL4 v29;
  _BOOL4 v30;
  void *v31;
  _BOOL4 v32;
  _BOOL4 v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD v38[10];
  _QWORD v39[12];

  v39[10] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  +[PowerUIAnalyticsManager sharedInstance](PowerUIAnalyticsManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "dateByAddingTimeInterval:", -86400.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v2;
  objc_msgSend(v2, "chargingStatisticsFrom:to:", v37, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v37, "dateByAddingTimeInterval:", -259200.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "chargingStatisticsFrom:to:", v37, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numberUnderCharges"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (int)objc_msgSend(v7, "intValue") > 0;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("totalTempDisableEvents"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (int)objc_msgSend(v9, "intValue") > 0;

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("numberChargeSessionsReachingTargetSoC"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (int)objc_msgSend(v11, "intValue") > 0;

  v35 = v4;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("DEoCCount"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (int)objc_msgSend(v12, "intValue") > 0;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("numberUnderCharges"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (int)objc_msgSend(v14, "intValue") > 0;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("totalTempDisableEvents"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (int)objc_msgSend(v15, "intValue") > 0;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("numberChargeSessionsReachingTargetSoC"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (int)objc_msgSend(v16, "intValue") > 0;

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("DEoCCount"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (int)objc_msgSend(v17, "intValue") > 0;

  v38[0] = CFSTR("LastDayEngagement");
  objc_msgSend(v35, "objectForKeyedSubscript:", CFSTR("sawEngagement"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v34;
  v38[1] = CFSTR("LastDayDEoCEngagement");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v13);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v31;
  v38[2] = CFSTR("LastDayInterrupted");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v39[2] = v19;
  v38[3] = CFSTR("LastDayOverride");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v39[3] = v20;
  v38[4] = CFSTR("LastDayFullyCharged");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v33);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v39[4] = v21;
  v38[5] = CFSTR("LastThreeEngagement");
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("sawEngagement"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v39[5] = v22;
  v38[6] = CFSTR("LastThreeDEoCEngagement");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v18);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v39[6] = v23;
  v38[7] = CFSTR("LastThreeInterrupted");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v32);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v39[7] = v24;
  v38[8] = CFSTR("LastThreeOverride");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v30);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v39[8] = v25;
  v38[9] = CFSTR("LastThreeFullyCharged");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v29);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v39[9] = v26;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v39, v38, 10);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

+ (id)filterChargeSessions:(id)a3 startsBefore:(id)a4 dynamicallyAroundDate:(id)a5 withinSeconds:(unint64_t)a6
{
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;

  v9 = a3;
  v10 = (void *)MEMORY[0x24BDBCEB8];
  v11 = a5;
  v12 = a4;
  objc_msgSend(v10, "array");
  v40 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeZone");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "dateByAddingTimeInterval:", (double)objc_msgSend(v14, "secondsFromGMT"));
  v15 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "timeZone");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dateByAddingTimeInterval:", (double)objc_msgSend(v16, "secondsFromGMT"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = (void *)v15;
  objc_msgSend(v13, "components:fromDate:", 96, v15);
  v41 = v13;
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dateFromComponents:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "dateByAddingTimeInterval:", 86400.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    v19 = 0;
    v20 = (double)a6;
    v39 = v17;
    do
    {
      v21 = (void *)MEMORY[0x2199EC15C]();
      objc_msgSend(v9, "objectAtIndexedSubscript:", v19);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "startDate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", (v19 - 1));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "endDate");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v23, "timeIntervalSinceDate:", v25);
      if (v26 >= 0.0)
      {
        objc_msgSend(v23, "timeIntervalSinceDate:", v17);
        if (v27 < 0.0)
        {
          objc_msgSend(v41, "components:fromDate:", 96, v23);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "dateFromComponents:", v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "dateByAddingTimeInterval:", 86400.0);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "timeIntervalSinceDate:", v18);
          if (v31 < 0.0)
            v31 = -v31;
          if (v31 < v20)
            goto LABEL_17;
          objc_msgSend(v30, "timeIntervalSinceDate:", v18);
          if (v32 < 0.0)
            v32 = -v32;
          if (v32 < v20)
            goto LABEL_17;
          objc_msgSend(v29, "timeIntervalSinceDate:", v38);
          if (v33 < 0.0)
            v33 = -v33;
          if (v33 < v20)
          {
LABEL_17:
            objc_msgSend(v9, "objectAtIndexedSubscript:", v19);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "addObject:", v34);

          }
          v17 = v39;
        }
      }

      objc_autoreleasePoolPop(v21);
      ++v19;
    }
    while (objc_msgSend(v9, "count") > v19);
  }

  return v40;
}

+ (BOOL)doesTimeOfDayForDate:(id)a3 fallBetweenDate:(id)a4 andDate:(id)a5
{
  id v7;
  id v8;
  id v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  BOOL v19;
  void *v20;
  void *v22;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(v9, "timeIntervalSinceDate:", v8);
  if (v10 < 86400.0)
  {
    if (doesTimeOfDayForDate_fallBetweenDate_andDate__onceToken != -1)
      dispatch_once(&doesTimeOfDayForDate_fallBetweenDate_andDate__onceToken, &__block_literal_global_101);
    objc_msgSend((id)doesTimeOfDayForDate_fallBetweenDate_andDate__currentCalendar, "components:fromDate:", 96, v8);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)doesTimeOfDayForDate_fallBetweenDate_andDate__currentCalendar, "dateFromComponents:");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)doesTimeOfDayForDate_fallBetweenDate_andDate__currentCalendar, "components:fromDate:", 96, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)doesTimeOfDayForDate_fallBetweenDate_andDate__currentCalendar, "dateFromComponents:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)doesTimeOfDayForDate_fallBetweenDate_andDate__currentCalendar, "components:fromDate:", 96, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)doesTimeOfDayForDate_fallBetweenDate_andDate__currentCalendar, "dateFromComponents:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "earlierDate:", v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "earlierDate:", v11);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if (v16 == v11)
    {
      if ((void *)v17 != v11)
      {
        v19 = 0;
        goto LABEL_11;
      }
    }
    else if ((void *)v17 == v11)
    {
      v19 = 1;
LABEL_11:

      goto LABEL_12;
    }
    objc_msgSend(v15, "earlierDate:", v13);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v20 == v15;

    goto LABEL_11;
  }
  v19 = 1;
LABEL_12:

  return v19;
}

void __76__PowerUISmartChargeUtilities_doesTimeOfDayForDate_fallBetweenDate_andDate___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)doesTimeOfDayForDate_fallBetweenDate_andDate__currentCalendar;
  doesTimeOfDayForDate_fallBetweenDate_andDate__currentCalendar = v0;

}

+ (void)setString:(id)a3 forPreferenceKey:(id)a4 inDomain:(id)a5
{
  CFPreferencesSetAppValue((CFStringRef)a4, a3, (CFStringRef)a5);
}

+ (id)readStringForPreferenceKey:(id)a3 inDomain:(id)a4
{
  return (id)(id)CFPreferencesCopyAppValue((CFStringRef)a3, (CFStringRef)a4);
}

+ (void)setDate:(id)a3 forPreferenceKey:(id)a4 inDomain:(id)a5
{
  __CFString *v7;
  void *v8;
  const void *v9;
  __CFString *key;

  key = (__CFString *)a4;
  v7 = (__CFString *)a5;
  if (a3)
  {
    v8 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(a3, "timeIntervalSinceReferenceDate");
    v9 = (const void *)objc_msgSend(v8, "numberWithDouble:");
  }
  else
  {
    v9 = 0;
  }
  CFPreferencesSetAppValue(key, v9, v7);

}

+ (id)dateForPreferenceKey:(id)a3 inDomain:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)CFPreferencesCopyAppValue((CFStringRef)a3, (CFStringRef)a4);
  v5 = v4;
  if (v4)
  {
    v6 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(v4, "doubleValue");
    objc_msgSend(v6, "dateWithTimeIntervalSinceReferenceDate:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (void)setNumber:(id)a3 forPreferenceKey:(id)a4 inDomain:(id)a5
{
  CFPreferencesSetAppValue((CFStringRef)a4, a3, (CFStringRef)a5);
}

+ (id)numberForPreferenceKey:(id)a3 inDomain:(id)a4
{
  return (id)(id)CFPreferencesCopyAppValue((CFStringRef)a3, (CFStringRef)a4);
}

+ (void)setDict:(id)a3 forPreferenceKey:(id)a4 inDomain:(id)a5
{
  CFPreferencesSetAppValue((CFStringRef)a4, a3, (CFStringRef)a5);
}

+ (id)readDictForPreferenceKey:(id)a3 inDomain:(id)a4
{
  return (id)(id)CFPreferencesCopyAppValue((CFStringRef)a3, (CFStringRef)a4);
}

+ (id)batteryLevelHistogramAroundTime:(id)a3 withDelta:(double)a4 withOffset:(double)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v38[10];
  _QWORD v39[5];
  id v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t (*v50)(uint64_t, uint64_t);
  void (*v51)(uint64_t);
  id v52;
  _QWORD v53[4];
  _QWORD v54[3];
  int v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  void *v59;
  _QWORD v60[4];
  _QWORD v61[6];

  v61[4] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  BiomeLibrary();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "Device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "Power");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "BatteryLevel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v56 = 0;
  v57 = &v56;
  v58 = 0x2020000000;
  v59 = 0;
  v12 = malloc_type_calloc(0x65uLL, 8uLL, 0x100004000313F17uLL);
  v13 = 0;
  v59 = v12;
  do
  {
    *(_QWORD *)(v57[3] + v13) = 0;
    v13 += 8;
  }
  while (v13 != 64);
  v54[0] = 0;
  v54[1] = v54;
  v54[2] = 0x2020000000;
  v55 = -1;
  v53[0] = 0;
  v53[1] = v53;
  v53[2] = 0x2020000000;
  v53[3] = 0;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "dateByAddingTimeInterval:", -2592000.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dateByAddingTimeInterval:", a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v47 = 0;
  v48 = &v47;
  v49 = 0x3032000000;
  v50 = __Block_byref_object_copy__2;
  v51 = __Block_byref_object_dispose__2;
  objc_msgSend(v15, "dateByAddingTimeInterval:", -a4);
  v52 = (id)objc_claimAutoreleasedReturnValue();
  v41 = 0;
  v42 = &v41;
  v43 = 0x3032000000;
  v44 = __Block_byref_object_copy__2;
  v45 = __Block_byref_object_dispose__2;
  objc_msgSend(v15, "dateByAddingTimeInterval:", a4);
  v46 = (id)objc_claimAutoreleasedReturnValue();
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x3032000000;
  v39[3] = __Block_byref_object_copy__2;
  v39[4] = __Block_byref_object_dispose__2;
  v16 = objc_alloc(MEMORY[0x24BDD1508]);
  v40 = (id)objc_msgSend(v16, "initWithStartDate:endDate:", v48[5], v42[5]);
  v17 = objc_alloc(MEMORY[0x24BE0CC98]);
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", -2592000.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "initWithStartDate:endDate:maxEvents:lastN:reversed:", v18, 0, 0, 0, 0);

  objc_msgSend(v11, "publisherWithOptions:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = MEMORY[0x24BDAC760];
  v38[1] = 3221225472;
  v38[2] = __84__PowerUISmartChargeUtilities_batteryLevelHistogramAroundTime_withDelta_withOffset___block_invoke_2;
  v38[3] = &unk_24D3FBE50;
  v38[4] = &v41;
  v38[5] = &v47;
  v38[6] = v39;
  v38[7] = v54;
  v38[8] = &v56;
  v38[9] = v53;
  objc_msgSend(v20, "sinkWithCompletion:receiveInput:", &__block_literal_global_109, v38);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = 0;
  v23 = 0.0;
  v24 = 0.0;
  v25 = 0.0;
  v26 = 0.0;
  do
  {
    if (v22 > 0x13)
    {
      if (v22 > 0x31)
      {
        v27 = (double *)v57[3];
        v28 = v27[v22];
        v29 = v26 + v28;
        v30 = v25 + v28;
        if (v22 <= 0x5E)
          v25 = v30;
        else
          v26 = v29;
      }
      else
      {
        v27 = (double *)v57[3];
        v24 = v24 + v27[v22];
      }
    }
    else
    {
      v27 = (double *)v57[3];
      v23 = v23 + v27[v22];
    }
    ++v22;
  }
  while (v22 != 101);
  free(v27);
  v31 = v26 + v25 + v24 + v23;
  v60[0] = &unk_24D443648;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v26 / v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v61[0] = v32;
  v60[1] = &unk_24D443660;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v25 / v31);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v61[1] = v33;
  v60[2] = &unk_24D443678;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v24 / v31);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v61[2] = v34;
  v60[3] = &unk_24D443630;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v23 / v31);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v61[3] = v35;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v61, v60, 4);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v39, 8);
  _Block_object_dispose(&v41, 8);

  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(v53, 8);
  _Block_object_dispose(v54, 8);
  _Block_object_dispose(&v56, 8);

  return v36;
}

void __84__PowerUISmartChargeUtilities_batteryLevelHistogramAroundTime_withDelta_withOffset___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  double v21;
  uint64_t v22;
  id v23;

  v3 = a2;
  v4 = (void *)MEMORY[0x24BDBCE60];
  v23 = v3;
  objc_msgSend(v3, "timestamp");
  objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceDate:", *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40));
  if (v6 > 0.0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "dateByAddingTimeInterval:", 86400.0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1[5] + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 40), "dateByAddingTimeInterval:", 86400.0);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1[4] + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    v13 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40), *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40));
    v14 = *(_QWORD *)(a1[6] + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "containsDate:", v5))
  {
    v16 = v23;
    if (*(_DWORD *)(*(_QWORD *)(a1[7] + 8) + 24) != -1)
    {
      objc_msgSend(v23, "timestamp");
      v16 = v23;
      v18 = *(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24);
      v19 = *(int *)(*(_QWORD *)(a1[7] + 8) + 24);
      *(double *)(v18 + 8 * v19) = v17 - *(double *)(*(_QWORD *)(a1[9] + 8) + 24) + *(double *)(v18 + 8 * v19);
    }
    objc_msgSend(v16, "eventBody");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "batteryPercentage");
    *(_DWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = (int)v21;

    objc_msgSend(v23, "timestamp");
    *(_QWORD *)(*(_QWORD *)(a1[9] + 8) + 24) = v22;
  }

}

+ (BOOL)deviceHasEnoughPluggedInTimeWithMinimumDays:(double)a3 withContext:(id)a4 withDefaultsDomain:(id)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  NSObject *v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  NSObject *v24;
  BOOL v25;
  int v27;
  double v28;
  __int16 v29;
  double v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)os_transaction_create();
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PowerUISmartChargeUtilities pluginEventsBefore:withMinimumDuration:ignoringDisconnectsShorterThan:](PowerUISmartChargeUtilities, "pluginEventsBefore:withMinimumDuration:ignoringDisconnectsShorterThan:", v8, 1200.0, 300.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PowerUISmartChargeUtilities concatenateChargeSessions:withMaxDeltaSecondsBetweenEvents:](PowerUISmartChargeUtilities, "concatenateChargeSessions:withMaxDeltaSecondsBetweenEvents:", v9, 10);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "startDate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceDate:", v12);
  v14 = v13;

  if (v14 < a3 * 86400.0)
  {
LABEL_9:
    objc_msgSend(a1, "log");
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v27 = 134217984;
      v28 = v14 / 86400.0;
      _os_log_impl(&dword_215A71000, v19, OS_LOG_TYPE_DEFAULT, "Not real carry device: First plugin: %0.2f days ago", (uint8_t *)&v27, 0xCu);
    }
    goto LABEL_11;
  }
  if ((unint64_t)objc_msgSend(v10, "count") < 9)
  {
    objc_msgSend(a1, "log");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v27 = 134217984;
      v28 = COERCE_DOUBLE(objc_msgSend(v10, "count"));
      _os_log_impl(&dword_215A71000, v24, OS_LOG_TYPE_DEFAULT, "Event count: %lu, too low", (uint8_t *)&v27, 0xCu);
    }

    goto LABEL_9;
  }
  objc_msgSend(v10, "lastObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "startDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceDate:", v16);
  v18 = v17;

  if (v18 <= 604800.0)
  {
    v25 = 1;
    goto LABEL_12;
  }
  objc_msgSend(a1, "log");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
    v20 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    objc_msgSend(v10, "lastObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "startDate");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceDate:", v22);
    v27 = 138543618;
    v28 = v20;
    v29 = 2048;
    v30 = v23 / 86400.0;
    _os_log_impl(&dword_215A71000, v19, OS_LOG_TYPE_DEFAULT, "Not real carry device: %{public}@ events, Last plugin: %0.2f days ago", (uint8_t *)&v27, 0x16u);

  }
LABEL_11:

  v25 = 0;
LABEL_12:

  return v25;
}

+ (double)totalPluginDurationAfter:(id)a3 withMinimumDuration:(double)a4 withPluginEvents:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t i;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a5;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    v12 = 0.0;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v14, "startDate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "timeIntervalSinceDate:", v15);
        v17 = v16;

        if (v17 <= 0.0)
        {
          objc_msgSend(v14, "duration");
          if (v18 >= a4)
          {
            objc_msgSend(v14, "duration");
            v12 = v12 + v12 + v19;
          }
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }
  else
  {
    v12 = 0.0;
  }

  return v12;
}

+ (id)getTestVector:(id)a3
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  unint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  id v47;
  id v48;

  v3 = a3;
  v48 = 0;
  objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("(\".+?),(.+?\")"), 1, &v48);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v48;
  v47 = v4;
  v42 = v3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfURL:encoding:error:", v3, 1, &v47);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v47;

  v6 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  objc_msgSend(v6, "setNumberStyle:", 1);
  objc_msgSend(MEMORY[0x24BDBCEA0], "localeWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLocale:", v7);

  v40 = v5;
  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("\n"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "componentsSeparatedByString:", CFSTR(","));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    v12 = 0;
    do
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v8, "count") - 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:atIndexedSubscript:", v13, v12);

      ++v12;
    }
    while (objc_msgSend(v10, "count") > v12);
  }
  if ((unint64_t)(objc_msgSend(v8, "count") - 3) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v14 = 1;
    v43 = v8;
    while (1)
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = v14;
      objc_msgSend(v8, "objectAtIndexedSubscript:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "stringByReplacingMatchesInString:options:range:withTemplate:", v15, 0, 0, objc_msgSend(v16, "length"), CFSTR("$1.$2"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v45 = v17;
      objc_msgSend(v17, "componentsSeparatedByString:", CFSTR(","));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v10, "count"))
        break;
LABEL_17:

      v14 = v46 + 1;
      v8 = v43;
      if (objc_msgSend(v43, "count") - 1 <= (unint64_t)(v46 + 1))
        goto LABEL_18;
    }
    v19 = 0;
    v20 = v46 - 1;
    while (1)
    {
      objc_msgSend(v18, "objectAtIndexedSubscript:", v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "numberFromString:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "objectAtIndexedSubscript:", v19);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (v22)
        break;
      v27 = objc_msgSend(v23, "isEqualToString:", CFSTR("True"));

      if (v27)
      {
        objc_msgSend(v11, "objectAtIndexedSubscript:", v19);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v28;
        v29 = &unk_24D443690;
        goto LABEL_14;
      }
      objc_msgSend(v18, "objectAtIndexedSubscript:", v19);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("False"));

      if (v31)
      {
        objc_msgSend(v11, "objectAtIndexedSubscript:", v19);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = v28;
        v29 = &unk_24D443630;
LABEL_14:
        objc_msgSend(v28, "setObject:atIndexedSubscript:", v29, v20);
LABEL_15:

      }
      if (objc_msgSend(v10, "count") <= (unint64_t)++v19)
        goto LABEL_17;
    }
    objc_msgSend(v6, "numberFromString:", v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", v19);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setObject:atIndexedSubscript:", v25, v20);

    goto LABEL_15;
  }
LABEL_18:
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    v33 = 0;
    do
    {
      v34 = (void *)MEMORY[0x24BDBCE30];
      objc_msgSend(v11, "objectAtIndexedSubscript:", v33);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "arrayWithArray:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndexedSubscript:", v33);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setObject:forKeyedSubscript:", v36, v37);

      ++v33;
    }
    while (objc_msgSend(v10, "count") > v33);
  }
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v32);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  return v38;
}

+ (double)batteryLevelAtDate:(id)a3
{
  id v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  _QWORD v22[5];
  _QWORD v23[5];
  uint64_t v24;
  double *v25;
  uint64_t v26;
  uint64_t v27;

  v4 = a3;
  objc_msgSend(v4, "timeIntervalSinceNow");
  if (v5 <= -10.0)
  {
    v24 = 0;
    v25 = (double *)&v24;
    v26 = 0x2020000000;
    v27 = 0;
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0CC98]), "initWithStartDate:endDate:maxEvents:lastN:reversed:", v4, 0, 20, 0, 1);
    BiomeLibrary();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "Device");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "Power");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "BatteryLevel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "publisherWithOptions:", v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "filterWithIsIncluded:", &__block_literal_global_133);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __50__PowerUISmartChargeUtilities_batteryLevelAtDate___block_invoke_2;
    v23[3] = &__block_descriptor_40_e23_v16__0__BPSCompletion_8l;
    v23[4] = a1;
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __50__PowerUISmartChargeUtilities_batteryLevelAtDate___block_invoke_134;
    v22[3] = &unk_24D3FBE98;
    v22[4] = &v24;
    v19 = (id)objc_msgSend(v18, "sinkWithCompletion:shouldContinue:", v23, v22);

    objc_msgSend(a1, "log");
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      +[PowerUISmartChargeUtilities batteryLevelAtDate:].cold.1();

    v11 = v25[3];
    _Block_object_dispose(&v24, 8);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE1B170], "userContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1B180], "keyPathForBatteryStateDataDictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE1B180], "batteryPercentageKey");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (double)objc_msgSend(v10, "integerValue");

  }
  return v11;
}

uint64_t __50__PowerUISmartChargeUtilities_batteryLevelAtDate___block_invoke()
{
  return 1;
}

void __50__PowerUISmartChargeUtilities_batteryLevelAtDate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (objc_msgSend(v3, "state"))
  {
    objc_msgSend(*(id *)(a1 + 32), "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __50__PowerUISmartChargeUtilities_batteryLevelAtDate___block_invoke_2_cold_1(v3);

  }
}

uint64_t __50__PowerUISmartChargeUtilities_batteryLevelAtDate___block_invoke_134(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "batteryPercentage");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4;

  return 0;
}

+ (id)lastPluggedInDate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  double v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  double v26;
  _QWORD v28[5];
  _QWORD v29[5];
  uint64_t v30;
  _QWORD v31[4];
  id v32;
  _BYTE v33[32];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE1B170], "userContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (+[PowerUISmartChargeUtilities isPluggedInWithContext:](PowerUISmartChargeUtilities, "isPluggedInWithContext:", v3))
  {
    objc_msgSend(MEMORY[0x24BE1B180], "keyPathForBatteryStateDataDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("externalConnectedChangeDate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("externalConnectedChangeDate"));
      v7 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE1B180], "keyPathForPluginStatus");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKeyedSubscript:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "BOOLValue");

      if (v21)
      {
        objc_msgSend(MEMORY[0x24BE1B180], "keyPathForPluginStatus");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "lastModifiedDateForContextualKeyPath:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_19:
        goto LABEL_20;
      }
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v7 = objc_claimAutoreleasedReturnValue();
    }
    v23 = (void *)v7;
    goto LABEL_19;
  }
  v30 = 0;
  v31[0] = &v30;
  v31[1] = 0x3032000000;
  v31[2] = __Block_byref_object_copy__2;
  v31[3] = __Block_byref_object_dispose__2;
  v32 = 0;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0CC98]), "initWithStartDate:endDate:maxEvents:lastN:reversed:", 0, 0, 8, 0, 1);
  BiomeLibrary();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "Device");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "Power");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "PluggedIn");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "publisherWithOptions:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "filterWithIsIncluded:", &__block_literal_global_137);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __48__PowerUISmartChargeUtilities_lastPluggedInDate__block_invoke_2;
  v29[3] = &__block_descriptor_40_e23_v16__0__BPSCompletion_8l;
  v29[4] = a1;
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __48__PowerUISmartChargeUtilities_lastPluggedInDate__block_invoke_138;
  v28[3] = &unk_24D3FBE98;
  v28[4] = &v30;
  v15 = (id)objc_msgSend(v14, "sinkWithCompletion:shouldContinue:", v29, v28);

  v16 = *(void **)(v31[0] + 40);
  if (v16)
  {
    objc_msgSend(v16, "timeIntervalSinceNow");
    if (v17 <= 0.0)
    {
      objc_msgSend(a1, "log");
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(*(id *)(v31[0] + 40), "timeIntervalSinceNow");
        +[PowerUISmartChargeUtilities lastPluggedInDate].cold.3((uint64_t)v31, (uint64_t)v33, v25, v26);
      }

      v24 = *(id *)(v31[0] + 40);
      goto LABEL_16;
    }
    objc_msgSend(a1, "log");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      +[PowerUISmartChargeUtilities lastPluggedInDate].cold.2();
  }
  else
  {
    objc_msgSend(a1, "log");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      +[PowerUISmartChargeUtilities lastPluggedInDate].cold.1();
  }

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v24 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:
  v23 = v24;

  _Block_object_dispose(&v30, 8);
LABEL_20:

  return v23;
}

uint64_t __48__PowerUISmartChargeUtilities_lastPluggedInDate__block_invoke()
{
  return 1;
}

void __48__PowerUISmartChargeUtilities_lastPluggedInDate__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (objc_msgSend(v3, "state"))
  {
    objc_msgSend(*(id *)(a1 + 32), "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __48__PowerUISmartChargeUtilities_lastPluggedInDate__block_invoke_2_cold_1(v3);

  }
}

BOOL __48__PowerUISmartChargeUtilities_lastPluggedInDate__block_invoke_138(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _BOOL8 v10;

  v3 = a2;
  objc_msgSend(v3, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "starting");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(v3, "timestamp");
    objc_msgSend(v6, "dateWithTimeIntervalSinceReferenceDate:");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    v10 = 1;
  }
  else
  {
    v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) == 0;
  }

  return v10;
}

+ (void)getMemoryUsage
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_215A71000, v0, v1, "Couldn't get process memory usage", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_0();
}

+ (void)logMemoryUsageInternalForEvent:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138412802;
  v10 = a3;
  v11 = 2112;
  v12 = v7;
  v13 = 2112;
  v14 = v8;
  _os_log_debug_impl(&dword_215A71000, a4, OS_LOG_TYPE_DEBUG, "(%@) current memory usage: %@ kB - peak usage: %@ kB", (uint8_t *)&v9, 0x20u);

}

+ (void)getBatteryLevelDurations:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_error_impl(&dword_215A71000, log, OS_LOG_TYPE_ERROR, "Skipping battery level %@", buf, 0xCu);

}

void __56__PowerUISmartChargeUtilities_getBatteryLevelDurations___block_invoke_cold_1(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  objc_msgSend(a1, "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  OUTLINED_FUNCTION_5_0(v3, v4);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_2(&dword_215A71000, v5, v6, "Error getting battery stream in batteryLevelDurations: %s", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_0_1();
}

void __56__PowerUISmartChargeUtilities_getBatteryLevelDurations___block_invoke_18_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_2(&dword_215A71000, v2, v3, "Skipping battery level %@", v4, v5, v6, v7, v8);

}

+ (void)percentageOfBatteryDurations:aboveBatteryLevel:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_215A71000, v0, v1, "ERROR: No battery events!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_0();
}

void __101__PowerUISmartChargeUtilities_pluginEventsBefore_withMinimumDuration_ignoringDisconnectsShorterThan___block_invoke_2_cold_1(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  objc_msgSend(a1, "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  OUTLINED_FUNCTION_5_0(v3, v4);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_2(&dword_215A71000, v5, v6, "Error getting plugin biome events in pluginEventsBefore - %s", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_0_1();
}

void __132__PowerUISmartChargeUtilities_pluginEventsBefore_withMinimumDuration_withMinimumPlugoutBatteryLevel_ignoringDisconnectsShorterThan___block_invoke_37_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_215A71000, a2, a3, "  %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __97__PowerUISmartChargeUtilities_drainSessionsInfoBetweenRelevantChargesBefore_withMinimumDuration___block_invoke_2_cold_1(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  objc_msgSend(a1, "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  OUTLINED_FUNCTION_5_0(v3, v4);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_2(&dword_215A71000, v5, v6, "Error getting biome events in drain calculation - %s", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_0_1();
}

void __101__PowerUISmartChargeUtilities_timestampOfFirstEventReachingBatteryLevel_betweenStartTime_andEndTime___block_invoke_2_cold_1(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  objc_msgSend(a1, "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  OUTLINED_FUNCTION_5_0(v3, v4);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_2(&dword_215A71000, v5, v6, "Error getting BatteryLevel in timestampOfFirstEventReachingBatteryLevel: %s", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_0_1();
}

+ (void)historicalFullChargeDurationStartingAt:withMinimumPluginDuration:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_2_0();
  _os_log_fault_impl(&dword_215A71000, v0, OS_LOG_TYPE_FAULT, "historicalFullChargeDurationStartingAt:withMinimumPluginDuration: is not being called with a value of >= 80", v1, 2u);
  OUTLINED_FUNCTION_6_0();
}

+ (void)historicalFullChargeDurationStartingAt:(uint64_t)a3 withMinimumPluginDuration:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_215A71000, a2, a3, "historical80to100Time durations: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __96__PowerUISmartChargeUtilities_historicalFullChargeDurationStartingAt_withMinimumPluginDuration___block_invoke_2_cold_1(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  objc_msgSend(a1, "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  OUTLINED_FUNCTION_5_0(v3, v4);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_2(&dword_215A71000, v5, v6, "Error getting chargingExperience biome events in historical80to100Time: %s", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_0_1();
}

+ (void)timelineEventDate:withDefaultsDomain:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_4_1(&dword_215A71000, v0, v1, "Timeline event '%@' exists %@", v2);
  OUTLINED_FUNCTION_2();
}

+ (void)batteryLevelAtDate:.cold.1()
{
  uint64_t v0;
  int v1;
  os_log_t v2;
  uint8_t v3[12];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  v4 = 2048;
  v5 = v0;
  OUTLINED_FUNCTION_4_1(&dword_215A71000, v1, v2, "Battery level at %@ is %lf", v3);
  OUTLINED_FUNCTION_2();
}

void __50__PowerUISmartChargeUtilities_batteryLevelAtDate___block_invoke_2_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "error");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_2(&dword_215A71000, v3, v4, "Error getting battery level biome events in batteryLevelAtDate %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_0_1();
}

+ (void)lastPluggedInDate
{
  uint64_t v4;

  v4 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  *(_DWORD *)a2 = 134218242;
  *(double *)(a2 + 4) = -a4;
  *(_WORD *)(a2 + 12) = 2112;
  *(_QWORD *)(a2 + 14) = v4;
  OUTLINED_FUNCTION_4_1(&dword_215A71000, a2, a3, "Last plug-in was %.2f seconds ago at %@", (uint8_t *)a2);
}

void __48__PowerUISmartChargeUtilities_lastPluggedInDate__block_invoke_2_cold_1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "error");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_2(&dword_215A71000, v3, v4, "Error getting plugged in biome events in lastPluggedInDate %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_0_1();
}

@end
