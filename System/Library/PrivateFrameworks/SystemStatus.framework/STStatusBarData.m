@implementation STStatusBarData

- (STStatusBarDataCellularEntry)cellularEntry
{
  return self->_cellularEntry;
}

- (STStatusBarDataCellularEntry)secondaryCellularEntry
{
  return self->_secondaryCellularEntry;
}

- (STStatusBarDataBackgroundActivityEntry)backgroundActivityEntry
{
  return self->_backgroundActivityEntry;
}

- (id)dataByRemovingEntriesForKeys:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[STStatusBarData mutableCopy](self, "mutableCopy");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "setEntry:forKey:", 0, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10++), (_QWORD)v13);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  _STStatusBarDataMatchingMutabilityOfData(v5, self);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)mutableCopy
{
  STMutableStatusBarData *v3;

  v3 = objc_alloc_init(STMutableStatusBarData);
  _copyValuesFromDataToData((id *)&self->super.isa, (id *)&v3->super.super.isa);
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ringerSilenceEntry, 0);
  objc_storeStrong((id *)&self->_controlCenterEntry, 0);
  objc_storeStrong((id *)&self->_forwardNavigationEntry, 0);
  objc_storeStrong((id *)&self->_backNavigationEntry, 0);
  objc_storeStrong((id *)&self->_backgroundActivityEntry, 0);
  objc_storeStrong((id *)&self->_volumeEntry, 0);
  objc_storeStrong((id *)&self->_announceNotificationsEntry, 0);
  objc_storeStrong((id *)&self->_sensorActivityEntry, 0);
  objc_storeStrong((id *)&self->_satelliteEntry, 0);
  objc_storeStrong((id *)&self->_alarmEntry, 0);
  objc_storeStrong((id *)&self->_carPlayEntry, 0);
  objc_storeStrong((id *)&self->_airPlayEntry, 0);
  objc_storeStrong((id *)&self->_voiceControlEntry, 0);
  objc_storeStrong((id *)&self->_displayWarningEntry, 0);
  objc_storeStrong((id *)&self->_liquidDetectionEntry, 0);
  objc_storeStrong((id *)&self->_vpnEntry, 0);
  objc_storeStrong((id *)&self->_studentEntry, 0);
  objc_storeStrong((id *)&self->_assistantEntry, 0);
  objc_storeStrong((id *)&self->_nikeEntry, 0);
  objc_storeStrong((id *)&self->_ttyEntry, 0);
  objc_storeStrong((id *)&self->_airplaneModeEntry, 0);
  objc_storeStrong((id *)&self->_rotationLockEntry, 0);
  objc_storeStrong((id *)&self->_radarEntry, 0);
  objc_storeStrong((id *)&self->_electronicTollCollectionEntry, 0);
  objc_storeStrong((id *)&self->_quietModeEntry, 0);
  objc_storeStrong((id *)&self->_lockEntry, 0);
  objc_storeStrong((id *)&self->_locationEntry, 0);
  objc_storeStrong((id *)&self->_tetheringEntry, 0);
  objc_storeStrong((id *)&self->_activityEntry, 0);
  objc_storeStrong((id *)&self->_thermalEntry, 0);
  objc_storeStrong((id *)&self->_bluetoothEntry, 0);
  objc_storeStrong((id *)&self->_mainBatteryEntry, 0);
  objc_storeStrong((id *)&self->_wifiEntry, 0);
  objc_storeStrong((id *)&self->_secondaryCellularEntry, 0);
  objc_storeStrong((id *)&self->_cellularEntry, 0);
  objc_storeStrong((id *)&self->_deviceNameEntry, 0);
  objc_storeStrong((id *)&self->_personNameEntry, 0);
  objc_storeStrong((id *)&self->_dateEntry, 0);
  objc_storeStrong((id *)&self->_shortTimeEntry, 0);
  objc_storeStrong((id *)&self->_timeEntry, 0);
}

- (STStatusBarDataWifiEntry)wifiEntry
{
  return self->_wifiEntry;
}

- (STStatusBarDataActivityEntry)activityEntry
{
  return self->_activityEntry;
}

- (STStatusBarDataBatteryEntry)mainBatteryEntry
{
  return self->_mainBatteryEntry;
}

- (STStatusBarDataImageEntry)controlCenterEntry
{
  return self->_controlCenterEntry;
}

- (STStatusBarDataLocationEntry)locationEntry
{
  return self->_locationEntry;
}

- (STStatusBarDataStringEntry)backNavigationEntry
{
  return self->_backNavigationEntry;
}

- (STStatusBarDataQuietModeEntry)quietModeEntry
{
  return self->_quietModeEntry;
}

- (STStatusBarDataBluetoothEntry)bluetoothEntry
{
  return self->_bluetoothEntry;
}

- (STStatusBarDataStringEntry)shortTimeEntry
{
  return self->_shortTimeEntry;
}

- (STStatusBarDataBoolEntry)ringerSilenceEntry
{
  return self->_ringerSilenceEntry;
}

- (STStatusBarDataEntry)vpnEntry
{
  return self->_vpnEntry;
}

- (STStatusBarDataThermalEntry)thermalEntry
{
  return self->_thermalEntry;
}

- (STStatusBarDataVoiceControlEntry)voiceControlEntry
{
  return self->_voiceControlEntry;
}

- (STStatusBarDataEntry)ttyEntry
{
  return self->_ttyEntry;
}

- (STStatusBarDataEntry)sensorActivityEntry
{
  return self->_sensorActivityEntry;
}

- (STStatusBarDataEntry)carPlayEntry
{
  return self->_carPlayEntry;
}

- (STStatusBarDataEntry)alarmEntry
{
  return self->_alarmEntry;
}

- (STStatusBarDataEntry)airplaneModeEntry
{
  return self->_airplaneModeEntry;
}

- (STStatusBarDataEntry)airPlayEntry
{
  return self->_airPlayEntry;
}

- (STStatusBarDataEntry)studentEntry
{
  return self->_studentEntry;
}

- (STStatusBarDataSatelliteEntry)satelliteEntry
{
  return self->_satelliteEntry;
}

- (STStatusBarDataEntry)rotationLockEntry
{
  return self->_rotationLockEntry;
}

- (STStatusBarDataEntry)liquidDetectionEntry
{
  return self->_liquidDetectionEntry;
}

- (STStatusBarDataEntry)assistantEntry
{
  return self->_assistantEntry;
}

- (STStatusBarDataStringEntry)timeEntry
{
  return self->_timeEntry;
}

- (STStatusBarDataStringEntry)dateEntry
{
  return self->_dateEntry;
}

- (STStatusBarDataIntegerEntry)volumeEntry
{
  return self->_volumeEntry;
}

- (STStatusBarDataTetheringEntry)tetheringEntry
{
  return self->_tetheringEntry;
}

- (STStatusBarDataBoolEntry)radarEntry
{
  return self->_radarEntry;
}

- (STStatusBarDataStringEntry)personNameEntry
{
  return self->_personNameEntry;
}

- (STStatusBarDataLockEntry)lockEntry
{
  return self->_lockEntry;
}

- (STStatusBarDataStringEntry)forwardNavigationEntry
{
  return self->_forwardNavigationEntry;
}

- (STStatusBarDataBoolEntry)electronicTollCollectionEntry
{
  return self->_electronicTollCollectionEntry;
}

- (STStatusBarDataEntry)displayWarningEntry
{
  return self->_displayWarningEntry;
}

- (STStatusBarDataStringEntry)deviceNameEntry
{
  return self->_deviceNameEntry;
}

- (STStatusBarDataBoolEntry)announceNotificationsEntry
{
  return self->_announceNotificationsEntry;
}

- (BOOL)isEmpty
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  BOOL v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend((id)objc_opt_class(), "entryKeys", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        -[STStatusBarData valueForKey:](self, "valueForKey:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i));
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          v9 = 0;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = 1;
LABEL_11:

  return v9;
}

- (void)_internal_setValue:(id)a3 forKey:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)STStatusBarData;
  -[STStatusBarData setValue:forKey:](&v4, sel_setValue_forKey_, a3, a4);
}

+ (NSSet)entryKeys
{
  if (qword_1ED0CB3B0 != -1)
    dispatch_once(&qword_1ED0CB3B0, &__block_literal_global_574);
  return (NSSet *)(id)qword_1ED0CB3A8;
}

- (id)dataByApplyingOverlay:(id)a3
{
  STStatusBarData *v4;
  STStatusBarData *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  STStatusBarData *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = (STStatusBarData *)a3;
  v5 = v4;
  if (!v4 || v4 == self)
    goto LABEL_17;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[STStatusBarData existingEntryKeys](v4, "existingEntryKeys", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (!v7)
  {

LABEL_17:
    v15 = self;
    goto LABEL_18;
  }
  v8 = v7;
  v9 = 0;
  v10 = *(_QWORD *)v18;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v18 != v10)
        objc_enumerationMutation(v6);
      v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
      -[STStatusBarData valueForKey:](self, "valueForKey:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        if (!v9)
          v9 = -[STStatusBarData mutableCopy](self, "mutableCopy");
        -[STStatusBarData valueForKey:](v5, "valueForKey:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setEntry:forKey:", v14, v12);

      }
    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  }
  while (v8);

  if (!v9)
    goto LABEL_17;
  _STStatusBarDataMatchingMutabilityOfData(v9, self);
  v15 = (STStatusBarData *)objc_claimAutoreleasedReturnValue();

LABEL_18:
  return v15;
}

- (NSSet)existingEntryKeys
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend((id)objc_opt_class(), "entryKeys", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        -[STStatusBarData valueForKey:](self, "valueForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v3, "addObject:", v9);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return (NSSet *)v3;
}

+ (void)dateFormatterForDate:(id *)a3 time:(id *)a4 shortTime:(id *)a5
{
  if (_MergedGlobals_9 == -1)
  {
    if (!a3)
      goto LABEL_4;
    goto LABEL_3;
  }
  dispatch_once(&_MergedGlobals_9, &__block_literal_global_10);
  if (a3)
LABEL_3:
    *a3 = objc_retainAutorelease((id)qword_1ED0CB430);
LABEL_4:
  if (a4)
    *a4 = objc_retainAutorelease((id)qword_1ED0CB438);
  if (a5)
    *a5 = objc_retainAutorelease((id)qword_1ED0CB440);
}

void __63__STStatusBarData_NSDate__dateFormatterForDate_time_shortTime___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  __CFString *v30;

  v0 = (void *)MEMORY[0x1E0CB3578];
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "dateFormatFromTemplate:options:locale:", CFSTR("EEEMMMd"), 0, v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  v4 = CFSTR("EEE MMM d");
  if (v2)
    v4 = (__CFString *)v2;
  v5 = v4;

  objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[__CFString rangeOfCharacterFromSet:](v5, "rangeOfCharacterFromSet:", v6);
  v9 = v8;

  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v30 = v5;
  }
  else
  {
    do
    {
      -[__CFString stringByReplacingCharactersInRange:withString:](v5, "stringByReplacingCharactersInRange:withString:", v7, v9, &stru_1E91E65E8);
      v30 = (__CFString *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[__CFString rangeOfCharacterFromSet:](v30, "rangeOfCharacterFromSet:", v10);
      v9 = v11;

      v5 = v30;
    }
    while (v7 != 0x7FFFFFFFFFFFFFFFLL);
  }
  v12 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v13 = (void *)qword_1ED0CB430;
  qword_1ED0CB430 = (uint64_t)v12;

  v14 = (void *)qword_1ED0CB430;
  objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTimeZone:", v15);

  v16 = (void *)qword_1ED0CB430;
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setLocale:", v17);

  objc_msgSend((id)qword_1ED0CB430, "setDateFormat:", v30);
  v18 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v19 = (void *)qword_1ED0CB438;
  qword_1ED0CB438 = (uint64_t)v18;

  v20 = (void *)qword_1ED0CB438;
  objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTimeZone:", v21);

  v22 = (void *)qword_1ED0CB438;
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setLocale:", v23);

  objc_msgSend((id)qword_1ED0CB438, "setDateStyle:", 0);
  objc_msgSend((id)qword_1ED0CB438, "setTimeStyle:", 1);
  v24 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v25 = (void *)qword_1ED0CB440;
  qword_1ED0CB440 = (uint64_t)v24;

  v26 = (void *)qword_1ED0CB440;
  objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setTimeZone:", v27);

  v28 = (void *)qword_1ED0CB440;
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setLocale:", v29);

  objc_msgSend((id)qword_1ED0CB440, "setDateStyle:", 0);
  objc_msgSend((id)qword_1ED0CB440, "setTimeStyle:", 1);
  objc_msgSend((id)qword_1ED0CB440, "setAMSymbol:", &stru_1E91E65E8);
  objc_msgSend((id)qword_1ED0CB440, "setPMSymbol:", &stru_1E91E65E8);

}

- (STStatusBarData)initWithDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  STStatusBarData *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[STStatusBarDataDateTimeEntry entryForDateWithDateValue:](STStatusBarDataDateTimeEntry, "entryForDateWithDateValue:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[STStatusBarDataDateTimeEntry entryForTimeWithDateValue:](STStatusBarDataDateTimeEntry, "entryForTimeWithDateValue:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[STStatusBarDataDateTimeEntry entryForShortTimeWithDateValue:](STStatusBarDataDateTimeEntry, "entryForShortTimeWithDateValue:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = CFSTR("dateEntry");
  v11[1] = CFSTR("timeEntry");
  v12[0] = v5;
  v12[1] = v6;
  v11[2] = CFSTR("shortTimeEntry");
  v12[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[STStatusBarData initWithKeysAndEntries:](self, "initWithKeysAndEntries:", v8);

  return v9;
}

- (NSDate)dateFromEntries
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;

  -[STStatusBarData dateEntry](self, "dateEntry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STStatusBarData timeEntry](self, "timeEntry");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[STStatusBarData shortTimeEntry](self, "shortTimeEntry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v4;
      goto LABEL_7;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v5;
      goto LABEL_7;
    }
    v28 = 0;
    v29 = 0;
    v27 = 0;
    objc_msgSend((id)objc_opt_class(), "dateFormatterForDate:time:shortTime:", &v29, &v28, &v27);
    v26 = v29;
    v25 = v28;
    v24 = v27;
    objc_msgSend(v3, "stringValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringValue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v9, "length");
    v13 = objc_msgSend(v10, "length");
    v14 = objc_msgSend(v11, "length");
    v15 = v14;
    if (!v12 && !v13)
    {
      v7 = 0;
      if (!v14)
      {
LABEL_26:

        goto LABEL_8;
      }
    }
    if (v12)
    {
      objc_msgSend(v26, "dateFromString:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (v13)
    {
      v16 = v25;
      v17 = v10;
    }
    else
    {
      if (!v15)
      {
        v7 = 0;
        goto LABEL_22;
      }
      v16 = v24;
      v17 = v11;
    }
    objc_msgSend(v16, "dateFromString:", v17);
    v18 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v18;
    if (v12 && v18)
    {
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "startOfDayForDate:", v12);
      v22 = v12;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "startOfDayForDate:", v7);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "timeIntervalSinceDate:", v20);
      objc_msgSend(v19, "dateByAddingTimeInterval:");
      v21 = (id)objc_claimAutoreleasedReturnValue();

      v12 = v22;
      goto LABEL_24;
    }
LABEL_22:
    if (!v12)
    {
LABEL_25:

      goto LABEL_26;
    }
    v21 = v12;
LABEL_24:

    v7 = v21;
    goto LABEL_25;
  }
  v6 = v3;
LABEL_7:
  objc_msgSend(v6, "dateValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return (NSDate *)v7;
}

- (BOOL)dateFromEntriesIncludesDate
{
  void *v2;
  void *v3;

  -[STStatusBarData dateEntry](self, "dateEntry");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "length") != 0;
  return (char)v2;
}

- (BOOL)dateFromEntriesIncludesTime
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  -[STStatusBarData timeEntry](self, "timeEntry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[STStatusBarData shortTimeEntry](self, "shortTimeEntry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v4, "length");
  LOBYTE(v7) = (v7 | objc_msgSend(v6, "length")) != 0;

  return v7;
}

+ (NSDateFormatter)timeFormatter
{
  id v3;

  v3 = 0;
  objc_msgSend(a1, "dateFormatterForDate:time:shortTime:", 0, &v3, 0);
  return (NSDateFormatter *)v3;
}

+ (NSDateFormatter)shortTimeFormatter
{
  id v3;

  v3 = 0;
  objc_msgSend(a1, "dateFormatterForDate:time:shortTime:", 0, 0, &v3);
  return (NSDateFormatter *)v3;
}

+ (NSDateFormatter)dateFormatter
{
  id v3;

  v3 = 0;
  objc_msgSend(a1, "dateFormatterForDate:time:shortTime:", &v3, 0, 0);
  return (NSDateFormatter *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (STStatusBarData)staticDisplayData
{
  if (qword_1ED0CB3A0 != -1)
    dispatch_once(&qword_1ED0CB3A0, &__block_literal_global_12);
  return (STStatusBarData *)(id)_MergedGlobals_1;
}

void __36__STStatusBarData_staticDisplayData__block_invoke()
{
  void *v0;
  void *v1;
  STMutableStatusBarData *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v12 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v12, "setMonth:", 1);
  objc_msgSend(v12, "setDay:", 9);
  objc_msgSend(v12, "setYear:", 2007);
  objc_msgSend(v12, "setHour:", 9);
  objc_msgSend(v12, "setMinute:", 41);
  objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "dateFromComponents:", v12);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = -[STStatusBarData initWithDate:]([STMutableStatusBarData alloc], "initWithDate:", v1);
  LOBYTE(v11) = 0;
  LOBYTE(v10) = 0;
  BYTE2(v9) = 0;
  LOWORD(v9) = 0;
  +[STStatusBarDataCellularEntry entryWithType:stringValue:crossfadeStringValue:badgeStringValue:wifiCalling:callForwarding:showsSOSWhenDisabled:sosAvailable:isBootstrapCellular:status:lowDataMode:rawValue:displayValue:displayRawValue:](STStatusBarDataCellularEntry, "entryWithType:stringValue:crossfadeStringValue:badgeStringValue:wifiCalling:callForwarding:showsSOSWhenDisabled:sosAvailable:isBootstrapCellular:status:lowDataMode:rawValue:displayValue:displayRawValue:", 5, CFSTR("Carrier"), 0, 0, 0, 0, v9, 5, v10, 0, 4, v11);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STMutableStatusBarData setCellularEntry:](v2, "setCellularEntry:", v3);

  +[STStatusBarDataWifiEntry entryWithType:status:lowDataMode:rawValue:displayValue:displayRawValue:](STStatusBarDataWifiEntry, "entryWithType:status:lowDataMode:rawValue:displayValue:displayRawValue:", 0, 5, 0, 0, 3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[STMutableStatusBarData setWifiEntry:](v2, "setWifiEntry:", v4);

  objc_msgSend(MEMORY[0x1E0CB37F0], "localizedStringFromNumber:numberStyle:", &unk_1E91FAE98, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[STStatusBarDataBatteryEntry entryWithCapacity:state:saverMode:prominentlyShowsDetailString:detailString:](STStatusBarDataBatteryEntry, "entryWithCapacity:state:saverMode:prominentlyShowsDetailString:detailString:", 100, 0, 0, 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[STMutableStatusBarData setMainBatteryEntry:](v2, "setMainBatteryEntry:", v6);

  -[STMutableStatusBarData immutableCopy](v2, "immutableCopy");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)_MergedGlobals_1;
  _MergedGlobals_1 = v7;

}

void __28__STStatusBarData_entryKeys__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("timeEntry"), CFSTR("shortTimeEntry"), CFSTR("dateEntry"), CFSTR("personNameEntry"), CFSTR("deviceNameEntry"), CFSTR("cellularEntry"), CFSTR("secondaryCellularEntry"), CFSTR("wifiEntry"), CFSTR("mainBatteryEntry"), CFSTR("bluetoothEntry"), CFSTR("thermalEntry"), CFSTR("activityEntry"), CFSTR("tetheringEntry"), CFSTR("lockEntry"), CFSTR("quietModeEntry"), CFSTR("electronicTollCollectionEntry"), CFSTR("rotationLockEntry"),
    CFSTR("locationEntry"),
    CFSTR("airplaneModeEntry"),
    CFSTR("ttyEntry"),
    CFSTR("assistantEntry"),
    CFSTR("studentEntry"),
    CFSTR("vpnEntry"),
    CFSTR("liquidDetectionEntry"),
    CFSTR("displayWarningEntry"),
    CFSTR("voiceControlEntry"),
    CFSTR("airPlayEntry"),
    CFSTR("carPlayEntry"),
    CFSTR("alarmEntry"),
    CFSTR("satelliteEntry"),
    CFSTR("sensorActivityEntry"),
    CFSTR("radarEntry"),
    CFSTR("announceNotificationsEntry"),
    CFSTR("volumeEntry"),
    CFSTR("backgroundActivityEntry"),
    CFSTR("backNavigationEntry"),
    CFSTR("forwardNavigationEntry"),
    CFSTR("controlCenterEntry"),
    CFSTR("ringerSilenceEntry"),
    0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)qword_1ED0CB3A8;
  qword_1ED0CB3A8 = v0;

}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  unint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend((id)objc_opt_class(), "entryKeys", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        -[STStatusBarData valueForKey:](self, "valueForKey:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          v10 = (id)objc_msgSend(v3, "appendObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  v11 = objc_msgSend(v3, "hash");
  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend((id)objc_opt_class(), "entryKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        -[STStatusBarData valueForKey:](self, "valueForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v4, "encodeObject:forKey:", v11, v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

}

- (STStatusBarData)initWithCoder:(id)a3
{
  id v4;
  STStatusBarData *v5;
  STMutableStatusBarData *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __CFString *v10;
  uint64_t i;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __CFString *v15;
  uint64_t v16;
  id v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)STStatusBarData;
  v5 = -[STStatusBarData init](&v24, sel_init);
  v6 = objc_alloc_init(STMutableStatusBarData);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend((id)objc_opt_class(), "entryKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    v10 = CFSTR("satelliteEntry");
    v18 = v4;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), v12);
        v13 = objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v14 = (void *)v13;
          if (-[__CFString isEqualToString:](v10, "isEqualToString:", v12))
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              v15 = v10;
              if ((objc_msgSend(v14, "isEnabled") & 1) != 0)
                +[STStatusBarDataSatelliteEntry entryWithConnectionStatus:](STStatusBarDataSatelliteEntry, "entryWithConnectionStatus:", 1);
              else
                +[STStatusBarDataEntry disabledEntry](STStatusBarDataSatelliteEntry, "disabledEntry");
              v16 = objc_claimAutoreleasedReturnValue();

              v14 = (void *)v16;
              v10 = v15;
              v4 = v18;
            }
          }
          -[STMutableStatusBarData setEntry:forKey:](v6, "setEntry:forKey:", v14, v12);

        }
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v8);
  }

  _copyValuesFromDataToData((id *)&v6->super.super.isa, (id *)&v5->super.isa);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int isKindOfClass;
  BOOL v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  if (((isKindOfClass ^ objc_opt_isKindOfClass()) & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    v7 = v4;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend((id)objc_opt_class(), "entryKeys", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
          -[STStatusBarData valueForKey:](self, "valueForKey:", v13);
          v14 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "valueForKey:", v13);
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = (void *)v15;
          if (v14 | v15)
          {
            v17 = !v14 || v15 == 0;
            if (v17
              || ((objc_msgSend((id)v14, "isEnabled") & 1) != 0 || objc_msgSend(v16, "isEnabled"))
              && (BSEqualObjects() & 1) == 0)
            {

              v6 = 0;
              goto LABEL_20;
            }
          }

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        if (v10)
          continue;
        break;
      }
    }
    v6 = 1;
LABEL_20:

  }
  return v6;
}

- (NSString)description
{
  return (NSString *)-[STStatusBarData descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (NSString)debugDescription
{
  return (NSString *)-[STStatusBarData debugDescriptionWithMultilinePrefix:](self, "debugDescriptionWithMultilinePrefix:", 0);
}

- (STStatusBarData)initWithEntry:(id)a3 forKey:(id)a4
{
  id v5;
  id v6;
  STStatusBarData *v7;
  STMutableStatusBarData *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)STStatusBarData;
  v5 = a4;
  v6 = a3;
  v7 = -[STStatusBarData init](&v10, sel_init);
  v8 = objc_alloc_init(STMutableStatusBarData);
  -[STMutableStatusBarData setEntry:forKey:](v8, "setEntry:forKey:", v6, v5, v10.receiver, v10.super_class);

  _copyValuesFromDataToData((id *)&v8->super.super.isa, (id *)&v7->super.isa);
  return v7;
}

- (STStatusBarData)initWithKeysAndEntries:(id)a3
{
  id v4;
  STStatusBarData *v5;
  STMutableStatusBarData *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  objc_super v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)STStatusBarData;
  v5 = -[STStatusBarData init](&v19, sel_init);
  v6 = objc_alloc_init(STMutableStatusBarData);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v7, "objectForKeyedSubscript:", v12, (_QWORD)v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          -[STMutableStatusBarData setEntry:forKey:](v6, "setEntry:forKey:", v13, v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v9);
  }

  _copyValuesFromDataToData((id *)&v6->super.super.isa, (id *)&v5->super.isa);
  return v5;
}

- (id)dataByApplyingUpdate:(id)a3 keys:(id)a4
{
  id v6;
  id v7;
  STMutableStatusBarData *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(STMutableStatusBarData);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v6, "valueForKey:", v14, (_QWORD)v18);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v15)
        {
          -[STStatusBarData valueForKey:](self, "valueForKey:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v15)
            continue;
        }
        -[STMutableStatusBarData setEntry:forKey:](v8, "setEntry:forKey:", v15, v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v11);
  }

  _STStatusBarDataMatchingMutabilityOfData(v8, self);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)updateFromData:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = -[STStatusBarData mutableCopy](self, "mutableCopy");
  objc_msgSend(v5, "makeUpdateFromData:", v4);

  _STStatusBarDataMatchingMutabilityOfData(v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dataByReplacingEntry:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = -[STStatusBarData mutableCopy](self, "mutableCopy");
  objc_msgSend(v8, "setEntry:forKey:", v7, v6);

  _STStatusBarDataMatchingMutabilityOfData(v8, self);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STStatusBarData succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STStatusBarData descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STStatusBarData _descriptionBuilderWithMultilinePrefix:forDebug:](self, "_descriptionBuilderWithMultilinePrefix:forDebug:", a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[STStatusBarData _descriptionBuilderWithMultilinePrefix:forDebug:](self, "_descriptionBuilderWithMultilinePrefix:forDebug:", a3, 0);
}

- (id)_descriptionBuilderWithMultilinePrefix:(id)a3 forDebug:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  id v14;

  v4 = a4;
  v6 = a3;
  -[STStatusBarData succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUseDebugDescription:", v4);
  objc_msgSend(v7, "setActiveMultilinePrefix:", v6);

  objc_msgSend(v7, "activeMultilinePrefix");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __67__STStatusBarData__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke;
  v13[3] = &unk_1E91E4AD8;
  v13[4] = self;
  v9 = v7;
  v14 = v9;
  objc_msgSend(v9, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("entries"), v8, v13);

  v10 = v14;
  v11 = v9;

  return v11;
}

void __67__STStatusBarData__descriptionBuilderWithMultilinePrefix_forDebug___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  id v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  objc_msgSend((id)objc_opt_class(), "entryKeys", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "valueForKey:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
          v9 = (id)objc_msgSend(*(id *)(a1 + 40), "appendObject:withName:", v8, v7);

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

- (void)setValue:(id)a3 forKey:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)STStatusBarData;
  -[STStatusBarData setValue:forKey:](&v4, sel_setValue_forKey_, a3, a4);
}

- (id)entryForKey:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)STStatusBarData;
  -[STStatusBarData valueForKey:](&v4, sel_valueForKey_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (STStatusBarDataEntry)nikeEntry
{
  return self->_nikeEntry;
}

@end
