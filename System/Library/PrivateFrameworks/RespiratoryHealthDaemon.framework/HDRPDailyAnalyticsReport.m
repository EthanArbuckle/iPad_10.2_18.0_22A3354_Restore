@implementation HDRPDailyAnalyticsReport

- (HDRPDailyAnalyticsReport)initWithDate:(id)a3 profile:(id)a4 pairedDeviceRegistry:(id)a5 featureAvailabilityProvider:(id)a6 oxygenSaturationSettings:(id)a7 controlCenterUserDefaults:(id)a8 healthDataCollectionAllowed:(BOOL)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  HDRPDailyAnalyticsReport *v19;
  HDRPDailyAnalyticsReport *v20;
  uint64_t v21;
  NSCalendar *calendar;
  uint64_t v23;
  NSDate *endTime;
  uint64_t v25;
  NSDate *startTime;
  id v28;
  id v29;
  objc_super v30;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v29 = a7;
  v28 = a8;
  v30.receiver = self;
  v30.super_class = (Class)HDRPDailyAnalyticsReport;
  v19 = -[HDRPDailyAnalyticsReport init](&v30, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_profile, a4);
    objc_storeStrong((id *)&v20->_pairedDeviceRegistry, a5);
    objc_storeStrong((id *)&v20->_featureAvailabilityProvider, a6);
    objc_storeStrong((id *)&v20->_oxygenSaturationSettings, a7);
    objc_storeStrong((id *)&v20->_controlCenterUserDefaults, a8);
    v20->_healthDataCollectionAllowed = a9;
    objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendarWithLocalTimeZone");
    v21 = objc_claimAutoreleasedReturnValue();
    calendar = v20->_calendar;
    v20->_calendar = (NSCalendar *)v21;

    -[NSCalendar startOfDayForDate:](v20->_calendar, "startOfDayForDate:", v15);
    v23 = objc_claimAutoreleasedReturnValue();
    endTime = v20->_endTime;
    v20->_endTime = (NSDate *)v23;

    -[NSCalendar hk_startOfDateBySubtractingDays:fromDate:](v20->_calendar, "hk_startOfDateBySubtractingDays:fromDate:", 1, v20->_endTime);
    v25 = objc_claimAutoreleasedReturnValue();
    startTime = v20->_startTime;
    v20->_startTime = (NSDate *)v25;

  }
  return v20;
}

- (id)generatePayloadAndReturnError:(id *)a3
{
  void *v5;
  id v6;
  id v7;
  _BOOL8 v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;

  v31 = 0;
  -[HDRPDailyAnalyticsReport _queryForBackgroundOxygenSaturationSamplesInPreviousDayAndReturnError:](self, "_queryForBackgroundOxygenSaturationSamplesInPreviousDayAndReturnError:", &v31);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v31;
  v7 = v6;
  if (!v5)
  {
    v12 = v6;
    if (v12)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v12);
      else
        _HKLogDroppedError();
    }

    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3050], OS_LOG_TYPE_ERROR))
      -[HDRPDailyAnalyticsReport generatePayloadAndReturnError:].cold.1();
    goto LABEL_48;
  }
  v8 = -[HDRPDailyAnalyticsReport isHealthDataCollectionAllowed](self, "isHealthDataCollectionAllowed");
  if (!v8)
  {
    v11 = 0;
    v9 = 0;
    goto LABEL_12;
  }
  v30 = v7;
  -[HDRPDailyAnalyticsReport _queryForOxygenSaturationSamplesInPreviousDays:error:](self, "_queryForOxygenSaturationSamplesInPreviousDays:error:", 1, &v30);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v30;

  if (!v9)
  {
    v12 = v10;
    if (v12)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v12);
      else
        _HKLogDroppedError();
    }

    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3050], OS_LOG_TYPE_ERROR))
      -[HDRPDailyAnalyticsReport generatePayloadAndReturnError:].cold.2();
    goto LABEL_48;
  }
  v29 = v10;
  -[HDRPDailyAnalyticsReport _queryForOxygenSaturationSamplesInPreviousDays:error:](self, "_queryForOxygenSaturationSamplesInPreviousDays:error:", 30, &v29);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v29;

  if (v11)
  {
LABEL_12:
    v13 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("isImproveHealthAndActivityAllowed"));

    v28 = v7;
    -[HDRPDailyAnalyticsReport _queryForHasWornWatchInPreviousDayAndReturnError:](self, "_queryForHasWornWatchInPreviousDayAndReturnError:", &v28);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v28;

    if (!v15)
    {
      v12 = v16;
      if (v12)
      {
        if (a3)
          *a3 = objc_retainAutorelease(v12);
        else
          _HKLogDroppedError();
      }

      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3050], OS_LOG_TYPE_ERROR))
        -[HDRPDailyAnalyticsReport generatePayloadAndReturnError:].cold.4();
      v23 = 0;
      goto LABEL_54;
    }
    v25 = v13;
    v17 = v9;
    v18 = v11;
    v27 = v16;
    -[HDRPDailyAnalyticsReport _gatherDiagnosticAndUsageReportFromBackgroundOxygenSaturationSamplesInPreviousDay:wasWorn:error:](self, "_gatherDiagnosticAndUsageReportFromBackgroundOxygenSaturationSamplesInPreviousDay:wasWorn:error:", v5, v15, &v27);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = v27;

    v21 = (void *)v19;
    if (v19)
    {
      v13 = v25;
      objc_msgSend(v25, "addEntriesFromDictionary:", v21);
      if (!v8)
      {
        v12 = v20;
        v11 = v18;
        v9 = v17;
        goto LABEL_30;
      }
      v19 = (uint64_t)v21;
      v26 = v20;
      -[HDRPDailyAnalyticsReport _gatherImproveHealthAndActivityReportFromBackgroundOxygenSaturationSamplesInPreviousDay:oxygenSaturationSamplesInPreviousDay:oxygenSaturationSamplesInPrevious30Days:error:](self, "_gatherImproveHealthAndActivityReportFromBackgroundOxygenSaturationSamplesInPreviousDay:oxygenSaturationSamplesInPreviousDay:oxygenSaturationSamplesInPrevious30Days:error:", v5, v17, v18, &v26);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v26;

      if (v22)
      {
        objc_msgSend(v25, "addEntriesFromDictionary:", v22);

        v11 = v18;
        v9 = v17;
        v21 = (void *)v19;
        v13 = v25;
LABEL_30:
        v23 = v13;
LABEL_53:

LABEL_54:
        goto LABEL_55;
      }
      v12 = v12;
      v11 = v18;
      v9 = v17;
      if (v12)
      {
        if (a3)
          *a3 = objc_retainAutorelease(v12);
        else
          _HKLogDroppedError();
      }

      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3050], OS_LOG_TYPE_ERROR))
        -[HDRPDailyAnalyticsReport generatePayloadAndReturnError:].cold.6();
    }
    else
    {
      v12 = v20;
      v11 = v18;
      v9 = v17;
      if (v12)
      {
        if (a3)
          *a3 = objc_retainAutorelease(v12);
        else
          _HKLogDroppedError();
      }

      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3050], OS_LOG_TYPE_ERROR))
        -[HDRPDailyAnalyticsReport generatePayloadAndReturnError:].cold.5();
    }
    v23 = 0;
    v21 = (void *)v19;
    v13 = v25;
    goto LABEL_53;
  }
  v12 = v7;
  if (v12)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v12);
    else
      _HKLogDroppedError();
  }

  _HKInitializeLogging();
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3050], OS_LOG_TYPE_ERROR))
    -[HDRPDailyAnalyticsReport generatePayloadAndReturnError:].cold.3();

LABEL_48:
  v23 = 0;
LABEL_55:

  return v23;
}

- (id)_gatherDiagnosticAndUsageReportFromBackgroundOxygenSaturationSamplesInPreviousDay:(id)a3 wasWorn:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
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
  os_log_t *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  id v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v30 = 0;
  -[HDRPDailyAnalyticsReport _numberOfWeeksSinceOnboardedAndReturnError:](self, "_numberOfWeeksSinceOnboardedAndReturnError:", &v30);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v30;
  if (v10)
    goto LABEL_2;
  _HKInitializeLogging();
  v25 = (os_log_t *)MEMORY[0x24BDD3050];
  v26 = (void *)*MEMORY[0x24BDD3050];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3050], OS_LOG_TYPE_DEFAULT))
  {
    v27 = v26;
    v28 = (void *)objc_opt_class();
    *(_DWORD *)buf = 138543362;
    v32 = v28;
    v29 = v28;
    _os_log_impl(&dword_21A8A8000, v27, OS_LOG_TYPE_DEFAULT, "[%{public}@] Number of weeks since onboarded is null", buf, 0xCu);

  }
  if (!v11)
  {
LABEL_2:
    v12 = (void *)objc_opt_new();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, CFSTR("weeksSinceOnboarded"));
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[HDRPDailyAnalyticsReport _hasCompatiblePairedAppleWatch](self, "_hasCompatiblePairedAppleWatch"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("hasCompatiblePairedAppleWatch"));

    -[HDRPDailyAnalyticsReport _activePairedWatchBuild](self, "_activePairedWatchBuild");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v14, CFSTR("activePairedWatchBuild"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, CFSTR("totalNumberOfBackgroundSamplesInPrevious1Day"));

    objc_msgSend(v12, "setObject:forKeyedSubscript:", v9, CFSTR("wasWatchWorn"));
    -[HDRPDailyAnalyticsReport oxygenSaturationSettings](self, "oxygenSaturationSettings");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v16, "oxygenSaturationDisabled") ^ 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v17, CFSTR("settings_bloodOxygenSaturationEnabled"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v16, "backgroundRecordingsEnabled"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v18, CFSTR("settings_backgroundMeasurementsEnabled"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v16, "backgroundRecordingsDuringSleepMode"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v19, CFSTR("settings_backgroundMeasurementsDuringSleepMode"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v16, "backgroundRecordingsDuringTheaterMode"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v20, CFSTR("settings_backgroundMeasurementsDuringTheaterMode"));

    v21 = (void *)MEMORY[0x24BDD16E0];
    -[HDRPDailyAnalyticsReport controlCenterUserDefaults](self, "controlCenterUserDefaults");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "numberWithBool:", objc_msgSend(v22, "BOOLForKey:", CFSTR("hideHunterSensitiveUI")));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v23, CFSTR("settings_hideSensitiveUI"));

  }
  else
  {
    _HKInitializeLogging();
    if (os_log_type_enabled(*v25, OS_LOG_TYPE_ERROR))
      -[HDRPDailyAnalyticsReport _gatherDiagnosticAndUsageReportFromBackgroundOxygenSaturationSamplesInPreviousDay:wasWorn:error:].cold.1();
    if (a5)
    {
      v12 = 0;
      *a5 = objc_retainAutorelease(v11);
    }
    else
    {
      _HKLogDroppedError();
      v12 = 0;
    }
  }

  return v12;
}

- (id)_numberOfWeeksSinceOnboardedAndReturnError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[HDRPDailyAnalyticsReport featureAvailabilityProvider](self, "featureAvailabilityProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "earliestDateLowestOnboardingVersionCompletedWithError:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDRPDailyAnalyticsReport endTime](self, "endTime");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "components:fromDate:toDate:options:", 0x2000, v6, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v9, "weekOfYear"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)_hasCompatiblePairedAppleWatch
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[HDRPDailyAnalyticsReport pairedDeviceRegistry](self, "pairedDeviceRegistry", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getSetupCompletedDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("BD3A4341-7090-4622-9694-2AC0F536C478"));
        LOBYTE(v8) = objc_msgSend(v8, "supportsCapability:", v9);

        if ((v8 & 1) != 0)
        {
          v10 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (id)_activePairedWatchBuild
{
  void *v2;
  void *v3;
  void *v4;

  -[HDRPDailyAnalyticsReport pairedDeviceRegistry](self, "pairedDeviceRegistry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getActivePairedDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "valueForProperty:", *MEMORY[0x24BE6B3E0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_gatherImproveHealthAndActivityReportFromBackgroundOxygenSaturationSamplesInPreviousDay:(id)a3 oxygenSaturationSamplesInPreviousDay:(id)a4 oxygenSaturationSamplesInPrevious30Days:(id)a5 error:(id *)a6
{
  objc_class *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  v9 = (objc_class *)MEMORY[0x24BDBCED8];
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = objc_alloc_init(v9);
  -[HDRPDailyAnalyticsReport _numberOfSamplesWithHeartRateGreaterThan100BPMFromSamples:](self, "_numberOfSamplesWithHeartRateGreaterThan100BPMFromSamples:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("numberOfBackgroundSamplesWithHeartRateGreaterThan100BPMInPrevious1Day"));

  -[HDRPDailyAnalyticsReport _numberOfSamplesWithExerciseMinute5MinutesPriorInPreviousDayAndReturnError:](self, "_numberOfSamplesWithExerciseMinute5MinutesPriorInPreviousDayAndReturnError:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, CFSTR("numberOfBackgroundSamplesWithExerciseMinute5MinutesPriorInPrevious1Day"));

  -[HDRPDailyAnalyticsReport _numberOfForegroundSamplesFromSamples:](self, "_numberOfForegroundSamplesFromSamples:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setObject:forKeyedSubscript:", v16, CFSTR("totalNumberOfForegroundSamplesInPrevious1Day"));
  -[HDRPDailyAnalyticsReport _numberOfForegroundSamplesFromSamples:](self, "_numberOfForegroundSamplesFromSamples:", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "setObject:forKeyedSubscript:", v17, CFSTR("totalNumberOfForegroundSamplesInPrevious30Days"));
  -[HDRPDailyAnalyticsReport _numberOfEveningSamplesFromSamples:](self, "_numberOfEveningSamplesFromSamples:", v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v18, CFSTR("totalNightBackgroundSamplesInPrevious1Day"));

  -[HDRPDailyAnalyticsReport _numberOfSamplesWithHighElevationTakeFromSamples:](self, "_numberOfSamplesWithHighElevationTakeFromSamples:", v12);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "integerValue") <= 0)
    v20 = 0;
  else
    v20 = v19;
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v20, CFSTR("numberOfBackgroundSamplesWithHighElevationTakenInPrevious1Day"));
  -[HDRPDailyAnalyticsReport _numberOfSamplesByTruncatedOxygenSaturationValueFromSamples:keyPrefix:](self, "_numberOfSamplesByTruncatedOxygenSaturationValueFromSamples:keyPrefix:", v12, CFSTR("numberOfBackgroundSamplesInPrevious1Day"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
    objc_msgSend(v13, "addEntriesFromDictionary:", v21);

  return v13;
}

- (id)_queryForBackgroundOxygenSaturationSamplesInPreviousDayAndReturnError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[4];

  v21[3] = *MEMORY[0x24BDAC8D0];
  -[HDRPDailyAnalyticsReport _dateIntervalForPreviousDays:](self, "_dateIntervalForPreviousDays:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3F08], "hkrp_oxygenSaturationType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HDDataEntityPredicateForObjectsFromAppleWatchSources();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDRPDailyAnalyticsReport profile](self, "profile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "metadataManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x24BDD4380];
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", &unk_24DD44C28);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "predicateWithMetadataKey:allowedValues:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  HDSampleEntityPredicateForDateInterval();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x24BE40E20];
  v21[0] = v7;
  v21[1] = v12;
  v21[2] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "predicateMatchingAllPredicates:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)MEMORY[0x24BE40BC0];
  -[HDRPDailyAnalyticsReport profile](self, "profile");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "samplesWithType:profile:encodingOptions:predicate:limit:anchor:error:", v6, v18, 0, v16, 0, 0, a3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)_queryForOxygenSaturationSamplesInPreviousDays:(unint64_t)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[HDRPDailyAnalyticsReport _dateIntervalForPreviousDays:](self, "_dateIntervalForPreviousDays:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3F08], "hkrp_oxygenSaturationType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HDSampleEntityPredicateForDateInterval();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BE40BC0];
  -[HDRPDailyAnalyticsReport profile](self, "profile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "samplesWithType:profile:encodingOptions:predicate:limit:anchor:error:", v7, v10, 0, v8, 0, 0, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_queryForHasWornWatchInPreviousDayAndReturnError:(id *)a3
{
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
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  -[HDRPDailyAnalyticsReport _dateIntervalForPreviousDays:](self, "_dateIntervalForPreviousDays:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD3DC0], "quantityTypeForIdentifier:", *MEMORY[0x24BDD35B8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HDDataEntityPredicateForObjectsFromAppleWatchSources();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HDSampleEntityPredicateForDateInterval();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BE40E20];
  v17[0] = v7;
  v17[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "predicateMatchingAllPredicates:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x24BE40BC0];
  -[HDRPDailyAnalyticsReport profile](self, "profile");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "samplesWithType:profile:encodingOptions:predicate:limit:anchor:error:", v6, v13, 0, v11, 3, 0, a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", (unint64_t)objc_msgSend(v14, "count") > 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)_dateIntervalForPreviousDays:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  -[HDRPDailyAnalyticsReport endTime](self, "endTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCalendar hk_startOfDateBySubtractingDays:fromDate:](self->_calendar, "hk_startOfDateBySubtractingDays:fromDate:", a3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1508]), "initWithStartDate:endDate:", v6, v5);

  return v7;
}

- (id)_numberOfSamplesWithExerciseMinute5MinutesPriorInPreviousDayAndReturnError:(id *)a3
{
  return 0;
}

- (id)_numberOfSamplesWithHeartRateGreaterThan100BPMFromSamples:(id)a3
{
  return 0;
}

- (id)_numberOfForegroundSamplesFromSamples:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "hk_filter:", &__block_literal_global);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __66__HDRPDailyAnalyticsReport__numberOfForegroundSamplesFromSamples___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "sourceRevision");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "source");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE80880]);

  return v5;
}

- (id)_numberOfEveningSamplesFromSamples:(id)a3
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __63__HDRPDailyAnalyticsReport__numberOfEveningSamplesFromSamples___block_invoke;
  v6[3] = &unk_24DD42990;
  v6[4] = self;
  objc_msgSend(a3, "hk_filter:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

BOOL __63__HDRPDailyAnalyticsReport__numberOfEveningSamplesFromSamples___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(a2, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "component:fromDate:", 32, v3);

  return (unint64_t)(v4 - 20) < 0xFFFFFFFFFFFFFFF4;
}

- (id)_numberOfSamplesWithHighElevationTakeFromSamples:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  HKOxygenSaturationLowBarometricPressureThresholdQuantity();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __77__HDRPDailyAnalyticsReport__numberOfSamplesWithHighElevationTakeFromSamples___block_invoke;
  v9[3] = &unk_24DD42990;
  v10 = v4;
  v5 = v4;
  objc_msgSend(v3, "hk_filter:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __77__HDRPDailyAnalyticsReport__numberOfSamplesWithHighElevationTakeFromSamples___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "metadata");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDD3168]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = objc_msgSend(v4, "hk_isLessThanQuantity:", *(_QWORD *)(a1 + 32));
  else
    v5 = 0;

  return v5;
}

- (id)_numberOfSamplesByTruncatedOxygenSaturationValueFromSamples:(id)a3 keyPrefix:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  double v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v5;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v11), "quantity");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "_value");
        v14 = (int)(v13 * 100.0);

        if (v14 >= 100)
          LODWORD(v15) = 100;
        else
          LODWORD(v15) = v14;
        if (v14 >= 70)
          v15 = v15;
        else
          v15 = 0;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_%d"), v6, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v17, "integerValue") + 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v18, v16);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v9);
  }

  return v7;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (NSDate)endTime
{
  return self->_endTime;
}

- (HDProfile)profile
{
  return self->_profile;
}

- (HKFeatureAvailabilityProviding)featureAvailabilityProvider
{
  return self->_featureAvailabilityProvider;
}

- (NRPairedDeviceRegistry)pairedDeviceRegistry
{
  return self->_pairedDeviceRegistry;
}

- (HKRPOxygenSaturationSettings)oxygenSaturationSettings
{
  return self->_oxygenSaturationSettings;
}

- (NSUserDefaults)controlCenterUserDefaults
{
  return self->_controlCenterUserDefaults;
}

- (BOOL)isHealthDataCollectionAllowed
{
  return self->_healthDataCollectionAllowed;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controlCenterUserDefaults, 0);
  objc_storeStrong((id *)&self->_oxygenSaturationSettings, 0);
  objc_storeStrong((id *)&self->_pairedDeviceRegistry, 0);
  objc_storeStrong((id *)&self->_featureAvailabilityProvider, 0);
  objc_storeStrong((id *)&self->_profile, 0);
  objc_storeStrong((id *)&self->_endTime, 0);
  objc_storeStrong((id *)&self->_startTime, 0);
  objc_storeStrong((id *)&self->_calendar, 0);
}

- (void)generatePayloadAndReturnError:.cold.1()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(v1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_21A8A8000, v4, v5, "[%{public}@] Could not fetch backgroundOxygenSaturationSamplesInPreviousDay: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

- (void)generatePayloadAndReturnError:.cold.2()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(v1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_21A8A8000, v4, v5, "[%{public}@] Could not fetch oxygenSaturationSamplesInPreviousDay: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

- (void)generatePayloadAndReturnError:.cold.3()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(v1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_21A8A8000, v4, v5, "[%{public}@] Could not fetch oxygenSaturationSamplesInPrevious30Days: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

- (void)generatePayloadAndReturnError:.cold.4()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(v1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_21A8A8000, v4, v5, "[%{public}@] Could not fetch hasWornWatchInPreviousDay: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

- (void)generatePayloadAndReturnError:.cold.5()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(v1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_21A8A8000, v4, v5, "[%{public}@] Could not gather diagnosticAndUsageReport: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

- (void)generatePayloadAndReturnError:.cold.6()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(v1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_21A8A8000, v4, v5, "[%{public}@] Could not gather improveHealthAndActivityReport: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

- (void)_gatherDiagnosticAndUsageReportFromBackgroundOxygenSaturationSamplesInPreviousDay:wasWorn:error:.cold.1()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(v1);
  v2 = (void *)OUTLINED_FUNCTION_3();
  v3 = OUTLINED_FUNCTION_0(v2);
  OUTLINED_FUNCTION_1(&dword_21A8A8000, v4, v5, "[%{public}@] Could not read number of weeks since onboarded: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_2();
}

@end
