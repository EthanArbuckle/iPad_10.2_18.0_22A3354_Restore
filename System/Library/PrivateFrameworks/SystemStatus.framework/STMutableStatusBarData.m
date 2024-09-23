@implementation STMutableStatusBarData

- (void)setCarPlayEntry:(id)a3
{
  STStatusBarDataEntry *v5;
  STStatusBarDataEntry **p_carPlayEntry;
  STStatusBarDataEntry *carPlayEntry;
  STStatusBarDataEntry *v8;

  v5 = (STStatusBarDataEntry *)a3;
  carPlayEntry = self->super._carPlayEntry;
  p_carPlayEntry = &self->super._carPlayEntry;
  if (carPlayEntry != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_carPlayEntry, a3);
    v5 = v8;
  }

}

- (void)setRadarEntry:(id)a3
{
  STStatusBarDataBoolEntry *v5;
  STStatusBarDataBoolEntry **p_radarEntry;
  STStatusBarDataBoolEntry *radarEntry;
  STStatusBarDataBoolEntry *v8;

  v5 = (STStatusBarDataBoolEntry *)a3;
  radarEntry = self->super._radarEntry;
  p_radarEntry = &self->super._radarEntry;
  if (radarEntry != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_radarEntry, a3);
    v5 = v8;
  }

}

- (void)setVpnEntry:(id)a3
{
  STStatusBarDataEntry *v5;
  STStatusBarDataEntry **p_vpnEntry;
  STStatusBarDataEntry *vpnEntry;
  STStatusBarDataEntry *v8;

  v5 = (STStatusBarDataEntry *)a3;
  vpnEntry = self->super._vpnEntry;
  p_vpnEntry = &self->super._vpnEntry;
  if (vpnEntry != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_vpnEntry, a3);
    v5 = v8;
  }

}

- (void)setDateEntry:(id)a3
{
  STStatusBarDataStringEntry *v5;
  STStatusBarDataStringEntry **p_dateEntry;
  STStatusBarDataStringEntry *dateEntry;
  STStatusBarDataStringEntry *v8;

  v5 = (STStatusBarDataStringEntry *)a3;
  dateEntry = self->super._dateEntry;
  p_dateEntry = &self->super._dateEntry;
  if (dateEntry != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_dateEntry, a3);
    v5 = v8;
  }

}

- (void)setThermalEntry:(id)a3
{
  STStatusBarDataThermalEntry *v5;
  STStatusBarDataThermalEntry **p_thermalEntry;
  STStatusBarDataThermalEntry *thermalEntry;
  STStatusBarDataThermalEntry *v8;

  v5 = (STStatusBarDataThermalEntry *)a3;
  thermalEntry = self->super._thermalEntry;
  p_thermalEntry = &self->super._thermalEntry;
  if (thermalEntry != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_thermalEntry, a3);
    v5 = v8;
  }

}

- (void)setShortTimeEntry:(id)a3
{
  STStatusBarDataStringEntry *v5;
  STStatusBarDataStringEntry **p_shortTimeEntry;
  STStatusBarDataStringEntry *shortTimeEntry;
  STStatusBarDataStringEntry *v8;

  v5 = (STStatusBarDataStringEntry *)a3;
  shortTimeEntry = self->super._shortTimeEntry;
  p_shortTimeEntry = &self->super._shortTimeEntry;
  if (shortTimeEntry != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_shortTimeEntry, a3);
    v5 = v8;
  }

}

- (void)setTimeEntry:(id)a3
{
  STStatusBarDataStringEntry *v5;
  STStatusBarDataStringEntry **p_timeEntry;
  STStatusBarDataStringEntry *timeEntry;
  STStatusBarDataStringEntry *v8;

  v5 = (STStatusBarDataStringEntry *)a3;
  timeEntry = self->super._timeEntry;
  p_timeEntry = &self->super._timeEntry;
  if (timeEntry != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_timeEntry, a3);
    v5 = v8;
  }

}

- (void)setLocationEntry:(id)a3
{
  STStatusBarDataLocationEntry *v5;
  STStatusBarDataLocationEntry **p_locationEntry;
  STStatusBarDataLocationEntry *locationEntry;
  STStatusBarDataLocationEntry *v8;

  v5 = (STStatusBarDataLocationEntry *)a3;
  locationEntry = self->super._locationEntry;
  p_locationEntry = &self->super._locationEntry;
  if (locationEntry != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_locationEntry, a3);
    v5 = v8;
  }

}

- (void)setActivityEntry:(id)a3
{
  STStatusBarDataActivityEntry *v5;
  STStatusBarDataActivityEntry **p_activityEntry;
  STStatusBarDataActivityEntry *activityEntry;
  STStatusBarDataActivityEntry *v8;

  v5 = (STStatusBarDataActivityEntry *)a3;
  activityEntry = self->super._activityEntry;
  p_activityEntry = &self->super._activityEntry;
  if (activityEntry != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_activityEntry, a3);
    v5 = v8;
  }

}

- (id)immutableCopy
{
  STStatusBarData *v3;

  v3 = objc_alloc_init(STStatusBarData);
  _copyValuesFromDataToData((id *)&self->super.super.isa, (id *)&v3->super.isa);
  return v3;
}

- (void)makeUpdateFromData:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    +[STStatusBarData entryKeys](STStatusBarData, "entryKeys", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v4, "valueForKey:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          -[STMutableStatusBarData valueForKey:](self, "valueForKey:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          if (v11)
            v14 = v12 == 0;
          else
            v14 = 1;
          if (!v14 && objc_msgSend(v12, "isEqual:", v11))
            -[STMutableStatusBarData setEntry:forKey:](self, "setEntry:forKey:", 0, v10);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v7);
    }

  }
}

- (void)setEntry:(id)a3 forKey:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)STMutableStatusBarData;
  -[STStatusBarData _internal_setValue:forKey:](&v4, sel__internal_setValue_forKey_, a3, a4);
}

- (void)_applyUpdate:(id)a3 keys:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v6, "valueForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          -[STMutableStatusBarData setEntry:forKey:](self, "setEntry:forKey:", v13, v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

}

- (void)applyUpdate:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  +[STStatusBarData entryKeys](STStatusBarData, "entryKeys");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[STMutableStatusBarData _applyUpdate:keys:](self, "_applyUpdate:keys:", v4, v5);

}

- (void)setBackNavigationEntry:(id)a3
{
  STStatusBarDataStringEntry *v5;
  STStatusBarDataStringEntry *v6;

  v5 = (STStatusBarDataStringEntry *)a3;
  if (self->super._backNavigationEntry != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->super._backNavigationEntry, a3);
    v5 = v6;
  }

}

- (void)setWifiEntry:(id)a3
{
  STStatusBarDataWifiEntry *v5;
  STStatusBarDataWifiEntry **p_wifiEntry;
  STStatusBarDataWifiEntry *wifiEntry;
  STStatusBarDataWifiEntry *v8;

  v5 = (STStatusBarDataWifiEntry *)a3;
  wifiEntry = self->super._wifiEntry;
  p_wifiEntry = &self->super._wifiEntry;
  if (wifiEntry != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_wifiEntry, a3);
    v5 = v8;
  }

}

- (void)setVoiceControlEntry:(id)a3
{
  STStatusBarDataVoiceControlEntry *v5;
  STStatusBarDataVoiceControlEntry **p_voiceControlEntry;
  STStatusBarDataVoiceControlEntry *voiceControlEntry;
  STStatusBarDataVoiceControlEntry *v8;

  v5 = (STStatusBarDataVoiceControlEntry *)a3;
  voiceControlEntry = self->super._voiceControlEntry;
  p_voiceControlEntry = &self->super._voiceControlEntry;
  if (voiceControlEntry != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_voiceControlEntry, a3);
    v5 = v8;
  }

}

- (void)setTtyEntry:(id)a3
{
  STStatusBarDataEntry *v5;
  STStatusBarDataEntry **p_ttyEntry;
  STStatusBarDataEntry *ttyEntry;
  STStatusBarDataEntry *v8;

  v5 = (STStatusBarDataEntry *)a3;
  ttyEntry = self->super._ttyEntry;
  p_ttyEntry = &self->super._ttyEntry;
  if (ttyEntry != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_ttyEntry, a3);
    v5 = v8;
  }

}

- (void)setTetheringEntry:(id)a3
{
  STStatusBarDataTetheringEntry *v5;
  STStatusBarDataTetheringEntry **p_tetheringEntry;
  STStatusBarDataTetheringEntry *tetheringEntry;
  STStatusBarDataTetheringEntry *v8;

  v5 = (STStatusBarDataTetheringEntry *)a3;
  tetheringEntry = self->super._tetheringEntry;
  p_tetheringEntry = &self->super._tetheringEntry;
  if (tetheringEntry != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_tetheringEntry, a3);
    v5 = v8;
  }

}

- (void)setStudentEntry:(id)a3
{
  STStatusBarDataEntry *v5;
  STStatusBarDataEntry **p_studentEntry;
  STStatusBarDataEntry *studentEntry;
  STStatusBarDataEntry *v8;

  v5 = (STStatusBarDataEntry *)a3;
  studentEntry = self->super._studentEntry;
  p_studentEntry = &self->super._studentEntry;
  if (studentEntry != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_studentEntry, a3);
    v5 = v8;
  }

}

- (void)setSensorActivityEntry:(id)a3
{
  STStatusBarDataEntry *v5;
  STStatusBarDataEntry *v6;

  v5 = (STStatusBarDataEntry *)a3;
  if (self->super._sensorActivityEntry != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->super._sensorActivityEntry, a3);
    v5 = v6;
  }

}

- (void)setSecondaryCellularEntry:(id)a3
{
  STStatusBarDataCellularEntry *v5;
  STStatusBarDataCellularEntry **p_secondaryCellularEntry;
  STStatusBarDataCellularEntry *secondaryCellularEntry;
  STStatusBarDataCellularEntry *v8;

  v5 = (STStatusBarDataCellularEntry *)a3;
  secondaryCellularEntry = self->super._secondaryCellularEntry;
  p_secondaryCellularEntry = &self->super._secondaryCellularEntry;
  if (secondaryCellularEntry != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_secondaryCellularEntry, a3);
    v5 = v8;
  }

}

- (void)setSatelliteEntry:(id)a3
{
  STStatusBarDataSatelliteEntry *v5;
  STStatusBarDataSatelliteEntry *v6;

  v5 = (STStatusBarDataSatelliteEntry *)a3;
  if (self->super._satelliteEntry != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->super._satelliteEntry, a3);
    v5 = v6;
  }

}

- (void)setRotationLockEntry:(id)a3
{
  STStatusBarDataEntry *v5;
  STStatusBarDataEntry **p_rotationLockEntry;
  STStatusBarDataEntry *rotationLockEntry;
  STStatusBarDataEntry *v8;

  v5 = (STStatusBarDataEntry *)a3;
  rotationLockEntry = self->super._rotationLockEntry;
  p_rotationLockEntry = &self->super._rotationLockEntry;
  if (rotationLockEntry != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_rotationLockEntry, a3);
    v5 = v8;
  }

}

- (void)setQuietModeEntry:(id)a3
{
  STStatusBarDataQuietModeEntry *v5;
  STStatusBarDataQuietModeEntry **p_quietModeEntry;
  STStatusBarDataQuietModeEntry *quietModeEntry;
  STStatusBarDataQuietModeEntry *v8;

  v5 = (STStatusBarDataQuietModeEntry *)a3;
  quietModeEntry = self->super._quietModeEntry;
  p_quietModeEntry = &self->super._quietModeEntry;
  if (quietModeEntry != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_quietModeEntry, a3);
    v5 = v8;
  }

}

- (void)setPersonNameEntry:(id)a3
{
  STStatusBarDataStringEntry *v5;
  STStatusBarDataStringEntry **p_personNameEntry;
  STStatusBarDataStringEntry *personNameEntry;
  STStatusBarDataStringEntry *v8;

  v5 = (STStatusBarDataStringEntry *)a3;
  personNameEntry = self->super._personNameEntry;
  p_personNameEntry = &self->super._personNameEntry;
  if (personNameEntry != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_personNameEntry, a3);
    v5 = v8;
  }

}

- (void)setMainBatteryEntry:(id)a3
{
  STStatusBarDataBatteryEntry *v5;
  STStatusBarDataBatteryEntry **p_mainBatteryEntry;
  STStatusBarDataBatteryEntry *mainBatteryEntry;
  STStatusBarDataBatteryEntry *v8;

  v5 = (STStatusBarDataBatteryEntry *)a3;
  mainBatteryEntry = self->super._mainBatteryEntry;
  p_mainBatteryEntry = &self->super._mainBatteryEntry;
  if (mainBatteryEntry != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mainBatteryEntry, a3);
    v5 = v8;
  }

}

- (void)setLockEntry:(id)a3
{
  STStatusBarDataLockEntry *v5;
  STStatusBarDataLockEntry **p_lockEntry;
  STStatusBarDataLockEntry *lockEntry;
  STStatusBarDataLockEntry *v8;

  v5 = (STStatusBarDataLockEntry *)a3;
  lockEntry = self->super._lockEntry;
  p_lockEntry = &self->super._lockEntry;
  if (lockEntry != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_lockEntry, a3);
    v5 = v8;
  }

}

- (void)setLiquidDetectionEntry:(id)a3
{
  STStatusBarDataEntry *v5;
  STStatusBarDataEntry **p_liquidDetectionEntry;
  STStatusBarDataEntry *liquidDetectionEntry;
  STStatusBarDataEntry *v8;

  v5 = (STStatusBarDataEntry *)a3;
  liquidDetectionEntry = self->super._liquidDetectionEntry;
  p_liquidDetectionEntry = &self->super._liquidDetectionEntry;
  if (liquidDetectionEntry != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_liquidDetectionEntry, a3);
    v5 = v8;
  }

}

- (void)setForwardNavigationEntry:(id)a3
{
  STStatusBarDataStringEntry *v5;
  STStatusBarDataStringEntry *v6;

  v5 = (STStatusBarDataStringEntry *)a3;
  if (self->super._forwardNavigationEntry != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->super._forwardNavigationEntry, a3);
    v5 = v6;
  }

}

- (void)setElectronicTollCollectionEntry:(id)a3
{
  STStatusBarDataBoolEntry *v5;
  STStatusBarDataBoolEntry **p_electronicTollCollectionEntry;
  STStatusBarDataBoolEntry *electronicTollCollectionEntry;
  STStatusBarDataBoolEntry *v8;

  v5 = (STStatusBarDataBoolEntry *)a3;
  electronicTollCollectionEntry = self->super._electronicTollCollectionEntry;
  p_electronicTollCollectionEntry = &self->super._electronicTollCollectionEntry;
  if (electronicTollCollectionEntry != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_electronicTollCollectionEntry, a3);
    v5 = v8;
  }

}

- (void)setDisplayWarningEntry:(id)a3
{
  STStatusBarDataEntry *v5;
  STStatusBarDataEntry **p_displayWarningEntry;
  STStatusBarDataEntry *displayWarningEntry;
  STStatusBarDataEntry *v8;

  v5 = (STStatusBarDataEntry *)a3;
  displayWarningEntry = self->super._displayWarningEntry;
  p_displayWarningEntry = &self->super._displayWarningEntry;
  if (displayWarningEntry != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_displayWarningEntry, a3);
    v5 = v8;
  }

}

- (void)setDeviceNameEntry:(id)a3
{
  STStatusBarDataStringEntry *v5;
  STStatusBarDataStringEntry **p_deviceNameEntry;
  STStatusBarDataStringEntry *deviceNameEntry;
  STStatusBarDataStringEntry *v8;

  v5 = (STStatusBarDataStringEntry *)a3;
  deviceNameEntry = self->super._deviceNameEntry;
  p_deviceNameEntry = &self->super._deviceNameEntry;
  if (deviceNameEntry != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_deviceNameEntry, a3);
    v5 = v8;
  }

}

- (void)setCellularEntry:(id)a3
{
  STStatusBarDataCellularEntry *v5;
  STStatusBarDataCellularEntry **p_cellularEntry;
  STStatusBarDataCellularEntry *cellularEntry;
  STStatusBarDataCellularEntry *v8;

  v5 = (STStatusBarDataCellularEntry *)a3;
  cellularEntry = self->super._cellularEntry;
  p_cellularEntry = &self->super._cellularEntry;
  if (cellularEntry != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_cellularEntry, a3);
    v5 = v8;
  }

}

- (void)setBluetoothEntry:(id)a3
{
  STStatusBarDataBluetoothEntry *v5;
  STStatusBarDataBluetoothEntry **p_bluetoothEntry;
  STStatusBarDataBluetoothEntry *bluetoothEntry;
  STStatusBarDataBluetoothEntry *v8;

  v5 = (STStatusBarDataBluetoothEntry *)a3;
  bluetoothEntry = self->super._bluetoothEntry;
  p_bluetoothEntry = &self->super._bluetoothEntry;
  if (bluetoothEntry != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_bluetoothEntry, a3);
    v5 = v8;
  }

}

- (void)setAssistantEntry:(id)a3
{
  STStatusBarDataEntry *v5;
  STStatusBarDataEntry **p_assistantEntry;
  STStatusBarDataEntry *assistantEntry;
  STStatusBarDataEntry *v8;

  v5 = (STStatusBarDataEntry *)a3;
  assistantEntry = self->super._assistantEntry;
  p_assistantEntry = &self->super._assistantEntry;
  if (assistantEntry != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_assistantEntry, a3);
    v5 = v8;
  }

}

- (void)setAnnounceNotificationsEntry:(id)a3
{
  STStatusBarDataBoolEntry *v5;
  STStatusBarDataBoolEntry *v6;

  v5 = (STStatusBarDataBoolEntry *)a3;
  if (self->super._announceNotificationsEntry != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->super._announceNotificationsEntry, a3);
    v5 = v6;
  }

}

- (void)setAlarmEntry:(id)a3
{
  STStatusBarDataEntry *v5;
  STStatusBarDataEntry **p_alarmEntry;
  STStatusBarDataEntry *alarmEntry;
  STStatusBarDataEntry *v8;

  v5 = (STStatusBarDataEntry *)a3;
  alarmEntry = self->super._alarmEntry;
  p_alarmEntry = &self->super._alarmEntry;
  if (alarmEntry != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_alarmEntry, a3);
    v5 = v8;
  }

}

- (void)setAirplaneModeEntry:(id)a3
{
  STStatusBarDataEntry *v5;
  STStatusBarDataEntry **p_airplaneModeEntry;
  STStatusBarDataEntry *airplaneModeEntry;
  STStatusBarDataEntry *v8;

  v5 = (STStatusBarDataEntry *)a3;
  airplaneModeEntry = self->super._airplaneModeEntry;
  p_airplaneModeEntry = &self->super._airplaneModeEntry;
  if (airplaneModeEntry != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_airplaneModeEntry, a3);
    v5 = v8;
  }

}

- (void)setAirPlayEntry:(id)a3
{
  STStatusBarDataEntry *v5;
  STStatusBarDataEntry **p_airPlayEntry;
  STStatusBarDataEntry *airPlayEntry;
  STStatusBarDataEntry *v8;

  v5 = (STStatusBarDataEntry *)a3;
  airPlayEntry = self->super._airPlayEntry;
  p_airPlayEntry = &self->super._airPlayEntry;
  if (airPlayEntry != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_airPlayEntry, a3);
    v5 = v8;
  }

}

- (void)setRingerSilenceEntry:(id)a3
{
  STStatusBarDataBoolEntry *v5;
  STStatusBarDataBoolEntry *v6;

  v5 = (STStatusBarDataBoolEntry *)a3;
  if (self->super._ringerSilenceEntry != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->super._ringerSilenceEntry, a3);
    v5 = v6;
  }

}

- (void)setNikeEntry:(id)a3
{
  STStatusBarDataEntry *v5;
  STStatusBarDataEntry **p_nikeEntry;
  STStatusBarDataEntry *nikeEntry;
  STStatusBarDataEntry *v8;

  v5 = (STStatusBarDataEntry *)a3;
  nikeEntry = self->super._nikeEntry;
  p_nikeEntry = &self->super._nikeEntry;
  if (nikeEntry != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_nikeEntry, a3);
    v5 = v8;
  }

}

- (void)setBackgroundActivityEntry:(id)a3
{
  STStatusBarDataBackgroundActivityEntry *v5;
  STStatusBarDataBackgroundActivityEntry *v6;

  v5 = (STStatusBarDataBackgroundActivityEntry *)a3;
  if (self->super._backgroundActivityEntry != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->super._backgroundActivityEntry, a3);
    v5 = v6;
  }

}

- (void)setControlCenterEntry:(id)a3
{
  STStatusBarDataImageEntry *v5;
  STStatusBarDataImageEntry *v6;

  v5 = (STStatusBarDataImageEntry *)a3;
  if (self->super._controlCenterEntry != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->super._controlCenterEntry, a3);
    v5 = v6;
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;

  v4 = (id *)objc_alloc_init((Class)objc_opt_class());
  _copyValuesFromDataToData((id *)&self->super.super.isa, v4);
  return v4;
}

- (void)setVolumeEntry:(id)a3
{
  STStatusBarDataIntegerEntry *v5;
  STStatusBarDataIntegerEntry *v6;

  v5 = (STStatusBarDataIntegerEntry *)a3;
  if (self->super._volumeEntry != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->super._volumeEntry, a3);
    v5 = v6;
  }

}

- (void)setValue:(id)a3 forKey:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)STMutableStatusBarData;
  -[STStatusBarData _internal_setValue:forKey:](&v4, sel__internal_setValue_forKey_, a3, a4);
}

@end
