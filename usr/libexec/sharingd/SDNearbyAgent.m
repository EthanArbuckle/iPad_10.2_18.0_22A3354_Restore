@implementation SDNearbyAgent

- (BOOL)_deviceCanTriggerEnhancedDiscovery:(id)a3
{
  id v4;
  BOOL v5;
  uint64_t v7;
  void *v8;
  void *v9;
  unsigned __int8 v10;
  void *v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  unsigned __int8 v15;
  unsigned __int8 v16;

  v4 = a3;
  if (!self->_enhancedDiscoveryShouldRun
    && -[SDNearbyAgent _allowEnhancedDiscovery](self, "_allowEnhancedDiscovery")
    && !-[SDNearbyAgent isWifiCritical](self, "isWifiCritical")
    && objc_msgSend(v4, "enhancedDiscovery")
    && objc_msgSend(v4, "paired"))
  {
    v7 = SFDeviceModel();
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "model"));
    if ((objc_msgSend(v9, "containsString:", CFSTR("iPhone")) & 1) != 0)
    {
      if ((objc_msgSend(v8, "containsString:", CFSTR("iPhone")) & 1) == 0)
      {
        v10 = objc_msgSend(v8, "containsString:", CFSTR("Mac"));

        if ((v10 & 1) == 0)
          goto LABEL_20;
        goto LABEL_16;
      }
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "model"));
      if ((objc_msgSend(v11, "containsString:", CFSTR("Mac")) & 1) == 0)
      {

        goto LABEL_20;
      }
      if (!objc_msgSend(v8, "containsString:", CFSTR("iPhone")))
      {
        v15 = objc_msgSend(v8, "containsString:", CFSTR("Mac"));

        if ((v15 & 1) == 0)
        {
LABEL_20:
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "model"));
          if ((objc_msgSend(v12, "containsString:", CFSTR("iPad")) & 1) != 0)
          {
            if ((objc_msgSend(v8, "containsString:", CFSTR("iPad")) & 1) == 0)
            {
              v13 = objc_msgSend(v8, "containsString:", CFSTR("Mac"));

              if ((v13 & 1) == 0)
                goto LABEL_38;
              goto LABEL_28;
            }
            goto LABEL_27;
          }
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "model"));
          if ((objc_msgSend(v14, "containsString:", CFSTR("Mac")) & 1) != 0)
          {
            if (objc_msgSend(v8, "containsString:", CFSTR("iPad")))
            {

LABEL_27:
LABEL_28:
              if (dword_1007B3A28 <= 30
                && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
              {
                LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _deviceCanTriggerEnhancedDiscovery:]", 30, "Device triggered enhanced discovery for Ensemble: %@\n", v4);
              }
LABEL_40:
              v5 = 1;
              goto LABEL_41;
            }
            v16 = objc_msgSend(v8, "containsString:", CFSTR("Mac"));

            if ((v16 & 1) != 0)
              goto LABEL_28;
          }
          else
          {

          }
LABEL_38:
          v5 = 0;
LABEL_41:

          goto LABEL_3;
        }
LABEL_16:
        if (dword_1007B3A28 <= 30
          && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
        {
          LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _deviceCanTriggerEnhancedDiscovery:]", 30, "Device triggered enhanced discovery for Wombat: %@\n", v4);
        }
        goto LABEL_40;
      }

    }
    goto LABEL_16;
  }
  v5 = 0;
LABEL_3:

  return v5;
}

- (int)_allowEnhancedDiscovery
{
  uint64_t allowEnhancedDiscovery;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  int v13;
  BOOL v14;
  int v17;
  id v18;
  id v19;
  int v20;
  int v21;
  uint64_t v22;
  void *i;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  unsigned int v28;
  void *v29;
  unsigned int v30;
  void *v31;
  unsigned int v32;
  void *v33;
  unsigned int v34;
  SDNearbyAgent *v35;
  int v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  const char *v41;
  int v43;
  int v44;
  int v45;
  SDNearbyAgent *v46;
  int v47;
  int v48;
  int v49;
  id obj;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];

  allowEnhancedDiscovery = self->_allowEnhancedDiscovery;
  if ((allowEnhancedDiscovery & 0x80000000) != 0)
  {
    v4 = SFDeviceClassCodeGet(allowEnhancedDiscovery, a2);
    v5 = v4;
    v7 = SFDeviceClassCodeGet(v4, v6);
    v8 = v7;
    v10 = SFDeviceClassCodeGet(v7, v9);
    v11 = v10;
    v13 = SFDeviceClassCodeGet(v10, v12);
    v47 = v5;
    v14 = v5 == 5 || v8 == 3;
    v45 = v11;
    v17 = v14 || v11 == 1 || v13 == 6;
    v43 = v8;
    v44 = v17;
    v46 = self;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent idsDeviceArray](self, "idsDeviceArray"));
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
    if (v18)
    {
      v19 = v18;
      v20 = 0;
      v48 = 0;
      v49 = 0;
      v21 = 0;
      v22 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(_QWORD *)v52 != v22)
            objc_enumerationMutation(obj);
          v24 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)i);
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "modelIdentifier"));
          v26 = GestaltProductTypeStringToDeviceClass();

          if (v24)
            objc_msgSend(v24, "operatingSystemVersion");
          if (DeviceOSVersionAtOrLater(v26, 0, 0, 0, 150400, 120300, 150400, 80500))
          {
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "modelIdentifier"));
            v28 = objc_msgSend(v27, "containsString:", CFSTR("Mac"));

            if (v28)
            {
              ++v20;
            }
            else
            {
              v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "modelIdentifier"));
              v30 = objc_msgSend(v29, "containsString:", CFSTR("iPad"));

              if (v30)
              {
                ++v48;
              }
              else
              {
                v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "modelIdentifier"));
                v32 = objc_msgSend(v31, "containsString:", CFSTR("iPhone"));

                v49 += v32;
              }
            }
          }
          if (DeviceOSVersionAtOrLater(v26, 0, 0, 0, 170000, 140000, 170000, 100000))
          {
            v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "modelIdentifier"));
            v34 = objc_msgSend(v33, "containsString:", CFSTR("AppleTV"));

            v21 += v34;
          }
        }
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
      }
      while (v19);
    }
    else
    {
      v20 = 0;
      v48 = 0;
      v49 = 0;
      v21 = 0;
    }
    if (dword_1007B3A28 <= 30
      && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
    {
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _allowEnhancedDiscovery]", 30, "Devices of required software version for enhanced discovery; macCount=%d, iPadCount=%d, iPhoneCount=%d, tvCount=%d\n",
        v20,
        v48,
        v49,
        v21);
    }
    if (v47 != 5 || v20 || v48 || v49)
    {
      if (v45 == 1 || v43 == 3)
      {
        if (v20 | v21)
        {
          v37 = (void *)objc_claimAutoreleasedReturnValue(+[AVCaptureDevice continuityCaptureLastUsedDate](AVCaptureDevice, "continuityCaptureLastUsedDate"));
          v35 = v46;
          v36 = v44;
          if (v37)
          {
            v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
            objc_msgSend(v38, "timeIntervalSinceDate:", v37);
            v40 = v39;

            if (v40 > 3024000.0)
            {
              -[SDNearbyAgent _unregisterForMagicMountUpdates](v46, "_unregisterForMagicMountUpdates");
              v36 = 0;
            }
            if (dword_1007B3A28 <= 40
              && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 40)))
            {
              v41 = "disable";
              if (v36)
                v41 = "enable";
            }
          }
          else
          {
            if (dword_1007B3A28 <= 30
              && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
            {
              LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _allowEnhancedDiscovery]", 30, "Continuity capture last used date is nil, disable enhanced discovery\n");
            }
            v36 = 0;
          }

        }
        else
        {
          v35 = v46;
          if (dword_1007B3A28 <= 40
            && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 40)))
          {
            LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _allowEnhancedDiscovery]", 40, "On iOS but no other devices available, disable enhanced discovery\n");
          }
          v36 = 0;
        }
        if (v35->_inDiscoverySession && (v36 & 1) == 0)
        {
          if (dword_1007B3A28 <= 30
            && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
          {
            LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _allowEnhancedDiscovery]", 30, "Enabling enhanced discovery because the device is in a discovery session\n");
          }
          v36 = 1;
        }
      }
      else
      {
        v35 = v46;
        v36 = v44;
      }
    }
    else if (dword_1007B3A28 > 40)
    {
      v36 = 0;
      v35 = v46;
    }
    else
    {
      v35 = v46;
      if (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 40))
        LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _allowEnhancedDiscovery]", 40, "On Mac but no other devices available, disable enhanced discovery\n");
      v36 = 0;
    }
    v35->_allowEnhancedDiscovery = v36;

    LODWORD(allowEnhancedDiscovery) = v35->_allowEnhancedDiscovery;
  }
  return allowEnhancedDiscovery;
}

- (id)bleProximityInfo
{
  SDNearbyAgent *v2;
  NSDictionary *bleProximityInfo;
  NSDictionary *v4;

  v2 = self;
  objc_sync_enter(v2);
  bleProximityInfo = v2->_bleProximityInfo;
  if (!bleProximityInfo)
  {
    v2->_bleProximityInfo = (NSDictionary *)&off_10074F8E0;

    bleProximityInfo = v2->_bleProximityInfo;
  }
  v4 = bleProximityInfo;
  objc_sync_exit(v2);

  return v4;
}

- (id)_idsBluetoothDeviceIDsForMe
{
  SDNearbyAgent *v2;
  NSSet *idsBluetoothDeviceIDsForMe;
  NSSet *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  unsigned int v16;
  id v17;
  id v18;
  id *obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v2 = self;
  objc_sync_enter(v2);
  obj = (id *)&v2->super.isa;
  idsBluetoothDeviceIDsForMe = v2->_idsBluetoothDeviceIDsForMe;
  if (idsBluetoothDeviceIDsForMe)
  {
    v4 = idsBluetoothDeviceIDsForMe;
  }
  else
  {
    v5 = objc_alloc_init((Class)NSMutableSet);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CUSystemMonitor meDeviceIDSDeviceID](v2->_systemMonitor, "meDeviceIDSDeviceID"));
    if (v6)
    {
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent idsDeviceArray](v2, "idsDeviceArray"));
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v22;
        do
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(_QWORD *)v22 != v9)
              objc_enumerationMutation(v7);
            v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "nsuuid"));
            if (v12)
            {
              v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uniqueIDOverride"));
              v14 = objc_msgSend(v13, "isEqual:", v6);

              if ((v14 & 1) != 0
                || (v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "modelIdentifier")),
                    v16 = objc_msgSend(v15, "hasPrefix:", CFSTR("Watch")),
                    v15,
                    v16))
              {
                objc_msgSend(v5, "addObject:", v12);
              }
            }

          }
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        }
        while (v8);
      }

    }
    v17 = objc_msgSend(v5, "copy");
    v18 = obj[75];
    obj[75] = v17;

    v4 = (NSSet *)obj[75];
  }
  objc_sync_exit(obj);

  return v4;
}

- (void)_deviceDiscoveryFastScanEvaluate:(id)a3 device:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  unint64_t v11;
  const __CFString *v12;
  int v13;
  uint64_t v14;
  id v15;

  v15 = a3;
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_activityScreenOn && self->_activityUIUnlocked && objc_msgSend(v15, "fastScanMode") == (id)2)
  {
    if (objc_msgSend(v15, "rssiThreshold"))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bleDevice"));
      if (objc_msgSend(v7, "rssi"))
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bleDevice"));
        v9 = objc_msgSend(v8, "rssi");
        v10 = objc_msgSend(v15, "rssiThreshold");

        if ((uint64_t)v9 < (uint64_t)v10)
          goto LABEL_23;
      }
      else
      {

      }
    }
    v11 = (unint64_t)objc_msgSend(v15, "discoveryFlags");
    if ((v11 & 0x20000) != 0 && (objc_msgSend(v6, "needsAWDL") & 1) != 0)
    {
      v12 = CFSTR("MatchAWDL");
LABEL_22:
      -[SDNearbyAgent _deviceDiscoveryFastScanStart:device:reason:](self, "_deviceDiscoveryFastScanStart:device:reason:", v15, v6, v12);
      goto LABEL_23;
    }
    if ((v11 & 0x40) != 0 && (objc_msgSend(v6, "needsKeyboardOnly") & 1) != 0)
    {
      v12 = CFSTR("MatchKeyboard");
      goto LABEL_22;
    }
    if ((v11 & 2) != 0)
    {
      v12 = CFSTR("MatchProx");
      goto LABEL_22;
    }
    if ((v11 & 0x601FF80) != 0 && objc_msgSend(v6, "needsSetup"))
    {
      v13 = objc_msgSend(v6, "deviceActionType");
      if (v13 > 32)
      {
        if (v13 == 33)
        {
          v14 = 0x2000000;
        }
        else if (v13 == 36)
        {
          v14 = 0x4000000;
        }
        else
        {
LABEL_32:
          v14 = 0;
        }
      }
      else
      {
        switch(v13)
        {
          case 8:
            v14 = 2048;
            break;
          case 9:
            v14 = 512;
            break;
          case 10:
          case 12:
          case 14:
          case 15:
          case 16:
          case 17:
          case 18:
          case 19:
            goto LABEL_32;
          case 11:
            v14 = 256;
            break;
          case 13:
            v14 = 1024;
            break;
          case 20:
            v14 = 0x4000;
            break;
          case 21:
            v14 = 0x8000;
            break;
          default:
            if (v13 != 1)
              goto LABEL_32;
            v14 = 128;
            break;
        }
      }
      if ((v14 & v11) != 0)
      {
        v12 = CFSTR("MatchSetup");
        goto LABEL_22;
      }
    }
    else if ((v11 & 0x800000) != 0 && (objc_msgSend(v6, "deviceFlags") & 0x200) != 0)
    {
      v12 = CFSTR("MatchClose");
      goto LABEL_22;
    }
  }
LABEL_23:

}

- (id)bleProximityInfoForType:(id)a3 device:(id)a4
{
  id v6;
  id v7;
  NSDictionary *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = self->_bleProximityInfoOverride;
  if (!v8
    || (v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent bleProximityInfoForType:device:allInfo:](self, "bleProximityInfoForType:device:allInfo:", v6, v7, v8))) == 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent bleProximityInfo](self, "bleProximityInfo"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent bleProximityInfoForType:device:allInfo:](self, "bleProximityInfoForType:device:allInfo:", v6, v7, v10));

  }
  return v9;
}

- (id)idsDeviceForBluetoothDeviceID:(id)a3 conflictDetected:(BOOL *)a4
{
  id v5;
  SDNearbyAgent *v6;
  NSDictionary *idsDeviceBTDictionary;
  NSDictionary *v8;
  NSDictionary *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  NSNumber *v16;
  void *v17;
  NSDictionary *v18;
  NSDictionary *v19;
  NSDictionary *idsDeviceCountBTDictionary;
  void *v21;
  void *v22;
  unsigned int Int64Ranged;
  BOOL v24;
  BOOL v25;
  id v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];

  v5 = a3;
  v6 = self;
  objc_sync_enter(v6);
  idsDeviceBTDictionary = v6->_idsDeviceBTDictionary;
  if (!idsDeviceBTDictionary)
  {
    v27 = v5;
    v8 = (NSDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v9 = (NSDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent idsDeviceArray](v6, "idsDeviceArray"));
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v30 != v12)
            objc_enumerationMutation(v10);
          v14 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "nsuuid"));
          if (v15)
          {
            -[NSDictionary setObject:forKeyedSubscript:](v8, "setObject:forKeyedSubscript:", v14, v15);
            v16 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", CFDictionaryGetInt64Ranged(v9, v15, 0, 0xFFFFFFFFLL, 0) + 1);
            v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
            -[NSDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v17, v15);

          }
        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      }
      while (v11);
    }

    v18 = v6->_idsDeviceBTDictionary;
    v6->_idsDeviceBTDictionary = v8;
    v19 = v8;

    idsDeviceCountBTDictionary = v6->_idsDeviceCountBTDictionary;
    v6->_idsDeviceCountBTDictionary = v9;

    idsDeviceBTDictionary = v6->_idsDeviceBTDictionary;
    v5 = v27;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](idsDeviceBTDictionary, "objectForKeyedSubscript:", v5));
  v22 = v5;
  Int64Ranged = CFDictionaryGetInt64Ranged(v6->_idsDeviceCountBTDictionary, v5, 0, 0xFFFFFFFFLL, 0);
  v24 = (Int64Ranged & 0xFFFFFFFE) == 0 || v21 == 0;
  v25 = !v24;
  if (!v24
    && dword_1007B3A28 <= 30
    && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
  {
    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent idsDeviceForBluetoothDeviceID:conflictDetected:]", 30, "Multiple (%ld) IDS devices are associated with BT ID %@. Picking %@, some info may be inaccurate", Int64Ranged, v22, v21);
  }
  if (a4)
    *a4 = v25;
  objc_sync_exit(v6);

  return v21;
}

- (void)_deviceDiscoveryBLEDeviceChanged:(id)a3 type:(int64_t)a4 changes:(unsigned int)a5
{
  id v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  const char *v12;
  const char *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  SDNearbyAgent *v21;
  NSMutableSet *v22;
  id v23;
  id v24;
  uint64_t v25;
  void *i;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  unsigned int v31;
  unsigned int v32;
  uint64_t v33;
  void *v35;
  void (**v36)(_QWORD, _QWORD, _QWORD);
  id v37;
  void *v38;
  void *v39;
  uint64_t v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];

  v40 = *(_QWORD *)&a5;
  v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
  if (v39)
  {
    switch(a4)
    {
      case 7:
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_ddProximityPairingDevices, "objectForKeyedSubscript:", v39));
        if (!v14)
          goto LABEL_43;
        v37 = v7;
        v38 = v14;
        objc_msgSend(v14, "updateWithBLEDevice:", v7);
        v15 = 2;
        break;
      case 16:
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_ddNearbyInfoDevices, "objectForKeyedSubscript:", v39));
        if (!v16)
          goto LABEL_43;
        v17 = v16;
        objc_msgSend(v16, "updateWithBLEDevice:", v7);
        LODWORD(v40) = -[SDNearbyAgent _bleProximityUpdateNearbyInfoDevice:](self, "_bleProximityUpdateNearbyInfoDevice:", v17) | v40;
        v15 = 1;
        -[SDNearbyAgent _identificationHandleDeviceFound:flags:](self, "_identificationHandleDeviceFound:flags:", v17, 1);
        v37 = v7;
        v38 = v17;
        if (-[SDNearbyAgent _deviceCanTriggerEnhancedDiscovery:](self, "_deviceCanTriggerEnhancedDiscovery:", v17))
        {
          -[SDNearbyAgent _enableEnhancedDiscovery:useCase:](self, "_enableEnhancedDiscovery:useCase:", CFSTR("IncomingAdv"), 131086);
          self->_enhancedDiscoveryAdvActive = 0;
          -[SDNearbyAgent update](self, "update");
          v15 = 1;
        }
        break;
      case 15:
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_ddNearbyActionDevices, "objectForKeyedSubscript:", v39));
        if (!v8)
          goto LABEL_43;
        v9 = v8;
        v10 = objc_msgSend(v8, "deviceActionType");
        objc_msgSend(v9, "updateWithBLEDevice:", v7);
        v11 = objc_msgSend(v9, "deviceActionType");
        if (v11 != v10)
        {
          if (dword_1007B3A28 <= 30
            && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
          {
            v12 = sub_1001FD530(v10);
            v13 = sub_1001FD530(v11);
            LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _deviceDiscoveryBLEDeviceChanged:type:changes:]", 30, "BLE action type changed: %s -> %s, cflags %#{flags}, %@\n", v12, v13, v40, &unk_1005CD135, v7);
          }
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bleDevice"));
          objc_msgSend(v18, "setSetupProximityEstimator:", 0);
          objc_msgSend(v18, "setTriggered:", 0);

        }
        if (v11 == 10)
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "idsIdentifier"));
          v20 = objc_msgSend(v19, "length");

          if (!v20)
            -[SDNearbyAgent idsAddCachedIDSIdentifierToDevice:](self, "idsAddCachedIDSIdentifierToDevice:", v9);
        }
        LODWORD(v40) = -[SDNearbyAgent _bleProximityUpdateNearbyActionDevice:](self, "_bleProximityUpdateNearbyActionDevice:", v9) | v40;
        v37 = v7;
        v38 = v9;
        v15 = 16;
        if ((v40 & 1) != 0)
          -[SDNearbyAgent _identificationHandleDeviceFound:flags:](self, "_identificationHandleDeviceFound:flags:", v9, 16);
        break;
      default:
        goto LABEL_43;
    }
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v21 = self;
    v22 = self->_ddRequests;
    v23 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v24; i = (char *)i + 1)
        {
          if (*(_QWORD *)v42 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
          if (((unint64_t)objc_msgSend(v27, "discoveryFlags") & v15) != 0)
          {
            v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "deviceFilter"));
            if (!v28
              || (v29 = (void *)v28,
                  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "deviceFilter")),
                  v31 = objc_msgSend(v30, "containsObject:", v39),
                  v30,
                  v29,
                  v31))
            {
              v32 = objc_msgSend(v27, "changeFlags");
              if ((objc_msgSend(v27, "discoveryFlags") & 1) != 0
                && objc_msgSend(v27, "rssiChangeDetection"))
              {
                v32 |= 4u;
              }
              v33 = v32 & v40;
              if (v32 == -1 || (_DWORD)v33 != 0)
              {
                v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "deviceChangedHandler"));

                if (v35)
                {
                  v36 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "deviceChangedHandler"));
                  ((void (**)(_QWORD, void *, uint64_t))v36)[2](v36, v38, v33);

                }
                -[SDNearbyAgent _deviceDiscoveryFastScanEvaluate:device:](v21, "_deviceDiscoveryFastScanEvaluate:device:", v27, v38);
              }
            }
          }
        }
        v24 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      }
      while (v24);
    }

    v7 = v37;
  }
LABEL_43:

}

- (id)bleProximityInfoForType:(id)a3 device:(id)a4 allInfo:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  unsigned int v19;
  const char *v20;
  unsigned int v21;
  const char *v22;
  void *v23;
  id v24;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v27;
  id v28;
  CFTypeID v29;
  uint64_t v30;
  id v31;
  CFTypeID v32;
  uint64_t v33;
  id v34;
  CFTypeID v35;
  uint64_t v36;
  id v37;
  CFTypeID v38;
  uint64_t v39;
  id v40;
  CFTypeID v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  CFTypeID v47;
  uint64_t v48;
  id v49;
  CFTypeID v50;
  uint64_t v51;
  id v52;
  CFTypeID v53;
  uint64_t v54;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = SFDeviceModel();
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "model"));
  if (v11
    && (v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet decimalDigitCharacterSet](NSCharacterSet, "decimalDigitCharacterSet")), v14 = objc_msgSend(v11, "rangeOfCharacterFromSet:", v13), v13, v14 != (id)0x7FFFFFFFFFFFFFFFLL))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "substringToIndex:", v14));
    if (v12)
    {
LABEL_4:
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet decimalDigitCharacterSet](NSCharacterSet, "decimalDigitCharacterSet"));
      v17 = -[__CFString rangeOfCharacterFromSet:](v12, "rangeOfCharacterFromSet:", v16);

      if (v17 != (id)0x7FFFFFFFFFFFFFFFLL)
      {
        v18 = objc_claimAutoreleasedReturnValue(-[__CFString substringToIndex:](v12, "substringToIndex:", v17));
        goto LABEL_21;
      }
      goto LABEL_17;
    }
  }
  else
  {
    v15 = 0;
    if (v12)
      goto LABEL_4;
  }
  v19 = objc_msgSend(v8, "deviceModelCode");
  switch(v19)
  {
    case 4u:
      v12 = CFSTR("iPod9,1");
      goto LABEL_14;
    case 6u:
      v20 = "B620ish";
      goto LABEL_13;
    case 5u:
      v20 = "B520ish";
LABEL_13:
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v20));
      goto LABEL_14;
  }
  if (objc_msgSend(v8, "deviceActionType") == 5)
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bleDevice"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "name"));

    if ((unint64_t)objc_msgSend(v44, "length") < 8)
    {
      v12 = 0;
    }
    else
    {
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "substringWithRange:", 7, 1));
      if (objc_msgSend(v45, "isEqualToString:", CFSTR("T")))
        v12 = CFSTR("Watch6,18");
      else
        v12 = 0;

    }
  }
  else
  {
    v12 = 0;
  }
LABEL_14:
  v21 = objc_msgSend(v8, "deviceClassCode");
  if (v21)
  {
    if (v21 > 8)
      v22 = "?";
    else
      v22 = off_10071BCD8[(char)(v21 - 1)];
    v18 = objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v22));
LABEL_21:
    v23 = (void *)v18;
    if (!v11)
      goto LABEL_24;
    goto LABEL_22;
  }
LABEL_17:
  v23 = 0;
  if (!v11)
    goto LABEL_24;
LABEL_22:
  if (v12)
  {
    v24 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@-%@-%@"), v7, v11, v12);
    TypeID = CFDictionaryGetTypeID();
    TypedValue = CFDictionaryGetTypedValue(v9, v24, TypeID, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);

    if (v27)
      goto LABEL_51;
  }
LABEL_24:
  if (v15 && v12)
  {
    v28 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@-%@-%@"), v7, v15, v12);
    v29 = CFDictionaryGetTypeID();
    v30 = CFDictionaryGetTypedValue(v9, v28, v29, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v30);

    if (v27)
      goto LABEL_51;
  }
  else if (!v12)
  {
    goto LABEL_30;
  }
  v31 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@-*-%@"), v7, v12);
  v32 = CFDictionaryGetTypeID();
  v33 = CFDictionaryGetTypedValue(v9, v31, v32, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue(v33);

  if (v27)
    goto LABEL_51;
LABEL_30:
  if (v11 && v23)
  {
    v34 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@-%@-%@"), v7, v11, v23);
    v35 = CFDictionaryGetTypeID();
    v36 = CFDictionaryGetTypedValue(v9, v34, v35, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v36);

    if (v27)
      goto LABEL_51;
  }
  else if (!v11)
  {
    goto LABEL_36;
  }
  v37 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@-%@-*"), v7, v11);
  v38 = CFDictionaryGetTypeID();
  v39 = CFDictionaryGetTypedValue(v9, v37, v38, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue(v39);

  if (v27)
    goto LABEL_51;
LABEL_36:
  if (v15 && v23)
  {
    v40 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@-%@-%@"), v7, v15, v23);
    v41 = CFDictionaryGetTypeID();
    v42 = CFDictionaryGetTypedValue(v9, v40, v41, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v42);

    if (v27)
      goto LABEL_51;
    goto LABEL_47;
  }
  if (v23)
  {
LABEL_47:
    v46 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@-*-%@"), v7, v23);
    v47 = CFDictionaryGetTypeID();
    v48 = CFDictionaryGetTypedValue(v9, v46, v47, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v48);

    if (v27)
      goto LABEL_51;
  }
  if (!v15
    || (v49 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@-%@-*"), v7, v15),
        v50 = CFDictionaryGetTypeID(),
        v51 = CFDictionaryGetTypedValue(v9, v49, v50, 0),
        v27 = (void *)objc_claimAutoreleasedReturnValue(v51),
        v49,
        !v27))
  {
    v52 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@"), v7);
    v53 = CFDictionaryGetTypeID();
    v54 = CFDictionaryGetTypedValue(v9, v52, v53, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v54);

  }
LABEL_51:

  return v27;
}

- (void)_deviceDiscoveryBLEDeviceFound:(id)a3 type:(int64_t)a4
{
  id v6;
  id v7;
  void *v8;
  unsigned __int8 v9;
  unint64_t v10;
  SDNearbyAgent *v11;
  void *v12;
  id v13;
  NSMutableDictionary *ddNearbyActionDevices;
  NSMutableDictionary *v15;
  NSMutableDictionary *v16;
  uint64_t v17;
  NSMutableDictionary *ddProximityPairingDevices;
  NSMutableDictionary *v19;
  NSMutableDictionary *v20;
  NSMutableDictionary *ddNearbyInfoDevices;
  NSMutableDictionary *v22;
  NSMutableDictionary *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  const char *v28;
  NSMutableSet *v29;
  id v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  unsigned int v36;
  void *v37;
  id v38;
  void *v39;
  void (**v40)(_QWORD, _QWORD);
  id v41;
  NSMutableDictionary *v42;
  void *v43;
  void *v44;
  SDNearbyAgent *v45;
  void *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _QWORD v51[5];
  id v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t (*v57)(uint64_t, uint64_t);
  void (*v58)(uint64_t);
  id v59;
  _BYTE v60[128];

  v6 = a3;
  v45 = self;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v44 = v6;
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  if (v46)
  {
    v7 = objc_alloc_init((Class)SFDevice);
    objc_msgSend(v7, "updateWithBLEDevice:", v6);
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent _idsBluetoothDeviceIDsForMe](self, "_idsBluetoothDeviceIDsForMe"));
    if (objc_msgSend(v43, "containsObject:", v46))
    {
      if ((objc_msgSend(v7, "autoUnlockEnabled") & 1) != 0
        || (v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "model")),
            v9 = objc_msgSend(v8, "hasPrefix:", CFSTR("Watch")),
            v8,
            (v9 & 1) == 0))
      {
        objc_msgSend(v7, "setDeviceFlags:", objc_msgSend(v7, "deviceFlags") | 1);
      }
    }
    v10 = a4 - 7;
    if (a4 == 7)
    {
      ddProximityPairingDevices = self->_ddProximityPairingDevices;
      if (!ddProximityPairingDevices)
      {
        v19 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        v20 = self->_ddProximityPairingDevices;
        self->_ddProximityPairingDevices = v19;

        ddProximityPairingDevices = self->_ddProximityPairingDevices;
      }
      v42 = ddProximityPairingDevices;
      v17 = 2;
    }
    else
    {
      v11 = self;
      if (a4 == 16)
      {
        -[SDNearbyAgent _bleProximityUpdateNearbyInfoDevice:](self, "_bleProximityUpdateNearbyInfoDevice:", v7);
        -[SDNearbyAgent _identificationHandleDeviceFound:flags:](self, "_identificationHandleDeviceFound:flags:", v7, 1);
        ddNearbyInfoDevices = self->_ddNearbyInfoDevices;
        if (!ddNearbyInfoDevices)
        {
          v22 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          v23 = self->_ddNearbyInfoDevices;
          self->_ddNearbyInfoDevices = v22;

          ddNearbyInfoDevices = self->_ddNearbyInfoDevices;
        }
        v42 = ddNearbyInfoDevices;
        if (-[SDNearbyAgent _deviceCanTriggerEnhancedDiscovery:](self, "_deviceCanTriggerEnhancedDiscovery:", v7))
        {
          -[SDNearbyAgent _enableEnhancedDiscovery:useCase:](self, "_enableEnhancedDiscovery:useCase:", CFSTR("IncomingAdv"), 131086);
          self->_enhancedDiscoveryAdvActive = 0;
          -[SDNearbyAgent update](self, "update");
        }
        v17 = 1;
      }
      else
      {
        if (a4 != 15)
        {
LABEL_59:

          goto LABEL_60;
        }
        if (objc_msgSend(v7, "deviceActionType") == 10)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "idsIdentifier"));
          v13 = objc_msgSend(v12, "length");

          v11 = self;
          if (!v13)
            -[SDNearbyAgent idsAddCachedIDSIdentifierToDevice:](self, "idsAddCachedIDSIdentifierToDevice:", v7);
        }
        -[SDNearbyAgent _bleProximityUpdateNearbyActionDevice:](v11, "_bleProximityUpdateNearbyActionDevice:", v7);
        -[SDNearbyAgent _identificationHandleDeviceFound:flags:](v11, "_identificationHandleDeviceFound:flags:", v7, 16);
        ddNearbyActionDevices = v11->_ddNearbyActionDevices;
        if (!ddNearbyActionDevices)
        {
          v15 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          v16 = v11->_ddNearbyActionDevices;
          v11->_ddNearbyActionDevices = v15;

          ddNearbyActionDevices = v11->_ddNearbyActionDevices;
        }
        v42 = ddNearbyActionDevices;
        v17 = 16;
      }
    }
    v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rapportIdentifier"));
    v25 = (void *)v24;
    if (v24)
    {
      v54 = 0;
      v55 = &v54;
      v56 = 0x3032000000;
      v57 = sub_1001F248C;
      v58 = sub_1001F249C;
      v59 = 0;
      v51[0] = _NSConcreteStackBlock;
      v51[1] = 3221225472;
      v51[2] = sub_1001FD490;
      v51[3] = &unk_10071B470;
      v51[4] = v24;
      v52 = v46;
      v53 = &v54;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v42, "enumerateKeysAndObjectsUsingBlock:", v51);
      v26 = (void *)v55[5];
      if (v26
        && (objc_msgSend(v26, "paired") & 1) == 0
        && (objc_msgSend((id)v55[5], "deviceFlags") & 0x8000) == 0)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v55[5], "bleDevice"));
        objc_msgSend((id)v55[5], "setIsBLEDeviceReplaced:", 1);
        if (dword_1007B3A28 <= 30
          && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
        {
          if (v10 > 9)
            v28 = "?";
          else
            v28 = off_10071BED0[v10];
          LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _deviceDiscoveryBLEDeviceFound:type:]", 30, "Replace old device: %s, %@ -> %@\n", v28, v55[5], v7);
        }
        -[SDNearbyAgent _deviceDiscoveryBLEDeviceLost:type:](self, "_deviceDiscoveryBLEDeviceLost:type:", v27, a4);

      }
      _Block_object_dispose(&v54, 8);

    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](v42, "setObject:forKeyedSubscript:", v7, v46);
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v29 = self->_ddRequests;
    v30 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
    if (v30)
    {
      v31 = *(_QWORD *)v48;
      do
      {
        v32 = 0;
        do
        {
          if (*(_QWORD *)v48 != v31)
            objc_enumerationMutation(v29);
          v33 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)v32);
          if (((unint64_t)objc_msgSend(v33, "discoveryFlags") & v17) != 0)
          {
            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "deviceFilter"));
            if (!v34
              || (v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "deviceFilter")),
                  v36 = objc_msgSend(v35, "containsObject:", v46),
                  v35,
                  v34,
                  v36))
            {
              if (objc_msgSend(v33, "rssiThreshold")
                && (v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bleDevice")),
                    v38 = objc_msgSend(v37, "rssi"),
                    LODWORD(v38) = (uint64_t)v38 < (uint64_t)objc_msgSend(v33, "rssiThreshold"),
                    v37,
                    (_DWORD)v38))
              {
                if (dword_1007B3A28 <= 10
                  && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 10)))
                {
                  LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _deviceDiscoveryBLEDeviceFound:type:]", 10, "Skip reporting device found %@ with low RSSI to %@\n", v7, v33);
                }
              }
              else
              {
                v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "deviceFoundHandler"));

                if (v39)
                {
                  v40 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "deviceFoundHandler"));
                  ((void (**)(_QWORD, id))v40)[2](v40, v7);

                }
                -[SDNearbyAgent _deviceDiscoveryFastScanEvaluate:device:](v45, "_deviceDiscoveryFastScanEvaluate:device:", v33, v7);
              }
            }
          }
          v32 = (char *)v32 + 1;
        }
        while (v30 != v32);
        v41 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v29, "countByEnumeratingWithState:objects:count:", &v47, v60, 16);
        v30 = v41;
      }
      while (v41);
    }

    goto LABEL_59;
  }
LABEL_60:

}

- (unsigned)_bleProximityUpdateNearbyInfoDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unsigned int v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bleDevice"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "infoProximityEstimator"));
  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent bleProximityInfoForType:device:](self, "bleProximityInfoForType:device:", CFSTR("info"), v4));
    if (!v7
      || (v8 = objc_claimAutoreleasedReturnValue(+[SFProximityEstimator proximityEstimatorWithProximityInfo:](SFProximityEstimator, "proximityEstimatorWithProximityInfo:", v7))) == 0)
    {

      v9 = 0;
      v6 = 0;
      goto LABEL_8;
    }
    v6 = (void *)v8;
    objc_msgSend(v5, "setInfoProximityEstimator:", v8);

  }
  v9 = objc_msgSend(v6, "updateWithSFBLEDevice:", v5);
  if ((v9 & 2) != 0)
    objc_msgSend(v4, "setDistance:", objc_msgSend(v5, "distance"));
LABEL_8:

  return v9;
}

- (void)_identificationHandleDeviceFound:(id)a3 flags:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v11;
  SDBLEIdentifiedDevice *v12;
  SDBLEIdentifiedDevice *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  unsigned __int8 v19;
  id v20;
  CFTypeID v21;
  CFTypeID v22;
  NSMutableDictionary *idDevices;
  NSMutableDictionary *v24;
  NSMutableDictionary *v25;
  NSArray *v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  unsigned __int8 v33;
  BOOL v34;
  int v35;
  CFTypeID v36;
  uint64_t v37;
  void *v38;
  CFTypeID v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  CFTypeID v46;
  uint64_t v47;
  void *v48;
  unsigned __int8 Int64Ranged;
  int v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  void *v55;
  BOOL v56;
  uint64_t v57;
  const char *v58;
  const char *v59;
  CFTypeID v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  OS_dispatch_source *v65;
  OS_dispatch_source *idMaintenanceTimer;
  NSObject *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  _QWORD handler[5];
  unsigned int v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _BYTE v80[128];

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
  if (!v6)
    goto LABEL_99;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bleDevice"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "advertisementFields"));
  TypeID = CFDataGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(v8, CFSTR("at"), TypeID, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);
  v12 = (SDBLEIdentifiedDevice *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_idDevices, "objectForKeyedSubscript:", v6));
  if (v12)
  {
    v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDBLEIdentifiedDevice authTag](v12, "authTag"));
    v15 = v11;
    v16 = v11;
    v17 = v14;
    if (v16 == v17)
    {

    }
    else
    {
      v18 = v17;
      if ((v16 == 0) != (v17 != 0))
      {
        v19 = objc_msgSend(v16, "isEqual:", v17);

        if ((v19 & 1) != 0)
          goto LABEL_13;
      }
      else
      {

      }
      -[SDBLEIdentifiedDevice setAuthTag:](v13, "setAuthTag:", v16);
      v21 = CFDataGetTypeID();
      -[SDBLEIdentifiedDevice setBtAddr:](v13, "setBtAddr:", CFDictionaryGetTypedValue(v8, CFSTR("bdAddr"), v21, 0));
    }
LABEL_13:
    v11 = v15;
LABEL_14:
    -[SDNearbyAgent _identificationIdentifyDevice:sfDevice:](self, "_identificationIdentifyDevice:sfDevice:", v13, v5);
    v20 = (id)objc_claimAutoreleasedReturnValue(-[SDBLEIdentifiedDevice identity](v13, "identity"));
    -[SDBLEIdentifiedDevice setDiscoveryFlags:](v13, "setDiscoveryFlags:", -[SDBLEIdentifiedDevice discoveryFlags](v13, "discoveryFlags") | a4);
    goto LABEL_40;
  }
  if (!objc_msgSend(v5, "paired"))
  {
    if ((unint64_t)-[NSMutableDictionary count](self->_idDevices, "count") > 0x257)
    {
      if (dword_1007B3A28 <= 30
        && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
      {
        LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _identificationHandleDeviceFound:flags:]", 30, "### Max identification devices reached, skipping %@ (%d total)\n", v5, -[NSMutableDictionary count](self->_idDevices, "count"));
      }
      v20 = 0;
      goto LABEL_39;
    }
    v13 = objc_alloc_init(SDBLEIdentifiedDevice);
    -[SDBLEIdentifiedDevice setAuthTag:](v13, "setAuthTag:", v11);
    v22 = CFDataGetTypeID();
    -[SDBLEIdentifiedDevice setBtAddr:](v13, "setBtAddr:", CFDictionaryGetTypedValue(v8, CFSTR("bdAddr"), v22, 0));
    -[SDBLEIdentifiedDevice setIdentifier:](v13, "setIdentifier:", v6);
    idDevices = self->_idDevices;
    if (!idDevices)
    {
      v24 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      v25 = self->_idDevices;
      self->_idDevices = v24;

      idDevices = self->_idDevices;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](idDevices, "setObject:forKeyedSubscript:", v13, v6);
    if (v13)
      goto LABEL_14;
LABEL_34:
    v20 = 0;
    goto LABEL_40;
  }
  v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "rpIdentity"));
  if (!v20)
  {
    v13 = (SDBLEIdentifiedDevice *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "idsIdentifier"));
    if (v13)
    {
      v68 = v11;
      v69 = v8;
      v70 = v7;
      v71 = v6;
      v78 = 0u;
      v79 = 0u;
      v76 = 0u;
      v77 = 0u;
      v26 = self->_idIdentityArray;
      v27 = -[NSArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v76, v80, 16);
      if (!v27)
      {
LABEL_33:

        v20 = 0;
        v13 = 0;
        v7 = v70;
        v6 = v71;
        v11 = v68;
        v8 = v69;
        goto LABEL_40;
      }
      v28 = v27;
      v29 = *(_QWORD *)v77;
LABEL_26:
      v30 = 0;
      while (1)
      {
        if (*(_QWORD *)v77 != v29)
          objc_enumerationMutation(v26);
        v31 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * v30);
        if (objc_msgSend(v31, "type") == 2)
        {
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "idsDeviceID"));
          v33 = objc_msgSend(v32, "isEqual:", v13);

          if ((v33 & 1) != 0)
            break;
        }
        if (v28 == (id)++v30)
        {
          v28 = -[NSArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v76, v80, 16);
          if (v28)
            goto LABEL_26;
          goto LABEL_33;
        }
      }
      v20 = v31;
      v7 = v70;
      objc_msgSend(v70, "setRpIdentity:", v20);

      v6 = v71;
      v11 = v68;
      v8 = v69;
      if (v20)
        goto LABEL_9;
      goto LABEL_39;
    }
    goto LABEL_34;
  }
LABEL_9:
  objc_msgSend(v5, "updateWithRPIdentity:", v20);
LABEL_39:
  v13 = 0;
LABEL_40:
  objc_msgSend(v5, "setAudioRoutingScore:", 0);
  if (v11)
    v34 = v20 == 0;
  else
    v34 = 1;
  v35 = !v34;
  if (!v34)
  {
    v36 = CFDataGetTypeID();
    v37 = CFDictionaryGetTypedValue(v8, CFSTR("ars"), v36, 0);
    v38 = (void *)objc_claimAutoreleasedReturnValue(v37);
    if (v38)
      -[SDNearbyAgent _identificationDecryptAudioRoutingScoreData:device:authTag:identity:](self, "_identificationDecryptAudioRoutingScoreData:device:authTag:identity:", v38, v5, v11, v20);

  }
  if ((a4 & 0x10) != 0 && self->_contactHashesEnabled && objc_msgSend(v5, "deviceActionType") == 8)
  {
    v39 = CFDataGetTypeID();
    v40 = CFDictionaryGetTypedValue(v8, CFSTR("ach"), v39, 0);
    v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
    if ((unint64_t)objc_msgSend(v41, "length") >= 9)
    {
      v72 = v6;
      v42 = v7;
      v43 = v11;
      v44 = v8;
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor contactIdentifierForMediumHashes:](self->_statusMonitor, "contactIdentifierForMediumHashes:", v41));
      objc_msgSend(v5, "setContactIdentifier:", v45);

      v8 = v44;
      v11 = v43;
      v7 = v42;
      v6 = v72;
    }

  }
  objc_msgSend(v5, "setHotspotInfo:", 0);
  if (v35)
  {
    v46 = CFDataGetTypeID();
    v47 = CFDictionaryGetTypedValue(v8, CFSTR("hsi"), v46, 0);
    v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
    if (v48)
      -[SDNearbyAgent _identificationDecryptHotspotData:device:authTag:identity:](self, "_identificationDecryptHotspotData:device:authTag:identity:", v48, v5, v11, v20);

  }
  v75 = 0;
  Int64Ranged = CFDictionaryGetInt64Ranged(v8, CFSTR("al"), 0, 255, &v75);
  v50 = -[SDNearbyAgent _idsShouldEncryptActivityLevel](self, "_idsShouldEncryptActivityLevel");
  v51 = v75;
  if (v50 < 1)
  {
    if (v75)
    {
      v53 = v7;
      v54 = 16;
    }
    else
    {
      v54 = Int64Ranged;
      v53 = v7;
    }
    objc_msgSend(v53, "setDecryptedActivityLevel:", v54);
    goto LABEL_87;
  }
  if (v11 && !v75 && v20)
  {
    v52 = -[SDNearbyAgent _identificationDecryptActivityLevel:device:authTag:identity:](self, "_identificationDecryptActivityLevel:device:authTag:identity:", Int64Ranged, v5, v11, v20);
    objc_msgSend(v7, "setDecryptedActivityLevel:", v52);
    if (dword_1007B3A28 <= 30
      && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
    {
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _identificationHandleDeviceFound:flags:]", 30, "NearbyInfo received activity level: 0x%x after decryption", v52);
    }
    goto LABEL_87;
  }
  v55 = v11;
  if (v75)
    v56 = 1;
  else
    v56 = v11 == 0;
  if (v56)
    v57 = 90;
  else
    v57 = 30;
  if ((int)v57 >= dword_1007B3A28)
  {
    if (dword_1007B3A28 != -1)
    {
LABEL_77:
      v58 = "no";
      if (v55)
        v59 = "yes";
      else
        v59 = "no";
      if (v20)
        v58 = "yes";
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _identificationHandleDeviceFound:flags:]", v57, "### Unable to decrypt activity level with authTag %s identity %s error %d for device %@\n", v59, v58, v51, v5);
      goto LABEL_86;
    }
    if (_LogCategory_Initialize(&dword_1007B3A28, v57))
    {
      v51 = v75;
      goto LABEL_77;
    }
  }
LABEL_86:
  objc_msgSend(v7, "setDecryptedActivityLevel:", 16);
  v11 = v55;
LABEL_87:
  if ((a4 & 0x10) != 0 && objc_msgSend(v5, "deviceActionType") == 8)
  {
    v60 = CFDataGetTypeID();
    v61 = CFDictionaryGetTypedValue(v8, CFSTR("ssidH"), v60, 0);
    v62 = (void *)objc_claimAutoreleasedReturnValue(v61);
    if (objc_msgSend(v62, "length") == (id)3)
    {
      v63 = v8;
      v64 = (void *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor wifiSSIDForSSIDHash:](self->_statusMonitor, "wifiSSIDForSSIDHash:", v62));
      objc_msgSend(v5, "setRequestSSID:", v64);

      v8 = v63;
    }

  }
  if (!self->_idMaintenanceTimer)
  {
    if (dword_1007B3A28 <= 30
      && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
    {
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _identificationHandleDeviceFound:flags:]", 30, "Identification starting maintenance timer\n");
    }
    v65 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
    idMaintenanceTimer = self->_idMaintenanceTimer;
    self->_idMaintenanceTimer = v65;

    v67 = self->_idMaintenanceTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10000D090;
    handler[3] = &unk_1007146D8;
    handler[4] = self;
    dispatch_source_set_event_handler(v67, handler);
    SFDispatchTimerSet(self->_idMaintenanceTimer, 30.0, 30.0, -4.0);
    dispatch_resume((dispatch_object_t)self->_idMaintenanceTimer);
  }

LABEL_99:
}

- (int)_idsShouldEncryptActivityLevel
{
  int idsShouldEncryptActivityLevel;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  idsShouldEncryptActivityLevel = self->_idsShouldEncryptActivityLevel;
  if (idsShouldEncryptActivityLevel < 0)
  {
    if ((-[CUSystemMonitor manateeAvailable](self->_systemMonitor, "manateeAvailable") & 1) != 0)
    {
      v13 = 0u;
      v14 = 0u;
      v15 = 0u;
      v16 = 0u;
      v4 = (id)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent idsDeviceArray](self, "idsDeviceArray"));
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v14;
        while (2)
        {
          for (i = 0; i != v6; i = (char *)i + 1)
          {
            if (*(_QWORD *)v14 != v7)
              objc_enumerationMutation(v4);
            v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
            v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "modelIdentifier"));
            v11 = GestaltProductTypeStringToDeviceClass();

            if (v9)
              objc_msgSend(v9, "operatingSystemVersion");
            if ((_DWORD)v11
              && (DeviceOSVersionAtOrLater(v11, 0, 0, 0, 130202, 101504, 130202, 60102) & 1) == 0)
            {
              if (dword_1007B3A28 <= 20
                && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 20)))
              {
                LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _idsShouldEncryptActivityLevel]", 20, "Not encrypting activity level; IDS device %@ is incompatible with encryption",
                  v9);
              }
              idsShouldEncryptActivityLevel = 0;
              goto LABEL_25;
            }
          }
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
          if (v6)
            continue;
          break;
        }
      }
      idsShouldEncryptActivityLevel = 1;
LABEL_25:

    }
    else
    {
      if (dword_1007B3A28 <= 20
        && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 20)))
      {
        LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _idsShouldEncryptActivityLevel]", 20, "Not encrypting activity level because Manatee is not available.");
      }
      idsShouldEncryptActivityLevel = 0;
    }
    self->_idsShouldEncryptActivityLevel = idsShouldEncryptActivityLevel;
  }
  return idsShouldEncryptActivityLevel;
}

- (BOOL)_identificationIdentifyDevice:(id)a3 sfDevice:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSArray *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  BOOL v22;
  uint64_t v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "authTag"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "btAddr"));
    if (v9)
    {
      v25 = v6;
      v24 = mach_absolute_time();
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v10 = self->_idIdentityArray;
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v11)
      {
        v12 = v11;
        v13 = 0;
        v14 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(_QWORD *)v27 != v14)
              objc_enumerationMutation(v10);
            v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
            if (objc_msgSend(v16, "verifyAuthTag:data:type:error:", v8, v9, 2, 0))
            {
              if (dword_1007B3A28 <= 30
                && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
              {
                v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "identifier"));
                v18 = mach_absolute_time();
                v19 = UpTicksToMicroseconds(v18 - v24);
                LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _identificationIdentifyDevice:sfDevice:]", 30, "Identification identified device %@ -> %@, %llu mus\n", v17, v16, v19);

              }
              if (v13)
              {
                v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "contactID"));

                if (!v20)
                {
                  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "contactID"));
                  objc_msgSend(v13, "setContactID:", v21);

                }
              }
              else
              {
                v13 = v16;
                objc_msgSend(v25, "setIdentity:", v13);
              }
              objc_msgSend(v7, "updateWithRPIdentity:", v16);
            }
          }
          v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        }
        while (v12);
      }
      else
      {
        v13 = 0;
      }

      v22 = v13 != 0;
      v6 = v25;
    }
    else
    {
      v22 = 0;
    }

  }
  else
  {
    v22 = 0;
  }

  return v22;
}

- (void)deviceDiscoveryRequestUpdate:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100009DF4;
  v7[3] = &unk_100714860;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)_bleUpdateScanner:(id)a3 typeFlag:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  unint64_t v16;
  char v17;
  void *v18;
  void *v19;
  id v20;
  int v21;
  unsigned int v22;
  id v23;
  int v24;
  unsigned int v25;
  int v26;
  _BOOL4 v27;
  int v28;
  unsigned __int8 v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  _BOOL4 enhancedDiscoveryShouldRun;
  void *v39;
  id v40;
  _BOOL4 v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  void *v55;
  uint64_t v56;
  unint64_t v57;
  SDNearbyAgent *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  id v62;
  NSMutableSet *obj;
  id v64;
  id v65;
  int v66;
  char v67;
  char v68;
  uint64_t v69;
  _QWORD v70[4];
  id v71;
  id v72;
  id v73;
  id v74;
  void *v75;
  SDNearbyAgent *v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  int v80;
  char v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  char v86;
  _BYTE v87[128];

  v54 = a3;
  if ((a4 & 1) != 0)
  {
    v6 = -[NSMutableSet count](self->_caRequests, "count");
    v7 = 40;
    if (!v6)
      v7 = 0;
    v69 = v7;
  }
  else
  {
    v69 = 0;
  }
  v86 = 0;
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  obj = self->_ddRequests;
  v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v82, v87, 16);
  if (!v8)
  {
    LOBYTE(v10) = 0;
    v65 = 0;
    LOBYTE(v11) = 0;
    v61 = 0;
    v62 = 0;
    v12 = 0;
    v59 = 0x7FFFFFFFFFFFFFFFLL;
    v60 = 0;
    v68 = 1;
    goto LABEL_60;
  }
  v9 = v8;
  v10 = 0;
  v65 = 0;
  v11 = 0;
  v61 = 0;
  v62 = 0;
  v12 = 0;
  v13 = *(_QWORD *)v83;
  v59 = 0x7FFFFFFFFFFFFFFFLL;
  v60 = 0;
  v67 = 0;
  v68 = 1;
  v57 = a4;
  v58 = self;
  v56 = *(_QWORD *)v83;
  do
  {
    v14 = 0;
    v64 = v9;
    do
    {
      if (*(_QWORD *)v83 != v13)
        objc_enumerationMutation(obj);
      v15 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * (_QWORD)v14);
      v16 = (unint64_t)objc_msgSend(v15, "discoveryFlags", v54);
      if ((v16 & a4) != 0)
      {
        v17 = v16;
        if (self->_activityScreenOn || objc_msgSend(v15, "overrideScreenOff"))
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "deviceFilter"));
          v19 = v18;
          if (v18)
          {
            if (!objc_msgSend(v18, "count"))
              goto LABEL_52;
            if ((v67 & 1) == 0)
            {
              v20 = v61;
              if (!v61)
                v20 = objc_alloc_init((Class)NSMutableSet);
              v61 = v20;
              objc_msgSend(v20, "unionSet:", v19);
              v67 = 0;
LABEL_23:
              v21 = v11 | ((v17 & 0x40) == 0);
              if ((v21 & 1) == 0)
                v86 |= 0x20u;
              v22 = objc_msgSend(v15, "trackPeers");
              v66 = v21;
              if (v19 && v22)
              {
                v23 = v60;
                if (!v60)
                  v23 = objc_alloc_init((Class)NSMutableSet);
                v24 = v10;
                v60 = v23;
                objc_msgSend(v23, "unionSet:", v19);
              }
              else
              {
                v24 = v10;
              }
              v25 = objc_msgSend(v15, "changeFlags");
              if ((v25 & 0x10) != 0)
                v26 = 4;
              else
                v26 = (2 * v25) & 4;
              v27 = objc_msgSend(v15, "rssiThreshold") == 0;
              if ((uint64_t)objc_msgSend(v15, "rssiThreshold") < (uint64_t)v65)
                v65 = objc_msgSend(v15, "rssiThreshold");
              v28 = v12;
              v29 = objc_msgSend(v15, "scanCache");
              v30 = (id)v69;
              if ((uint64_t)objc_msgSend(v15, "scanRate") > v69)
                v30 = objc_msgSend(v15, "scanRate");
              if ((uint64_t)objc_msgSend(v15, "scanRateOverride") > (uint64_t)v30)
                v30 = objc_msgSend(v15, "scanRateOverride");
              v69 = (uint64_t)v30;
              if (objc_msgSend(v15, "overrideScreenOff"))
              {
                v31 = (uint64_t)objc_msgSend(v15, "overrideScreenOffRescanInterval");
                v32 = 10;
                if (v31 > 10)
                  v32 = v31;
                v33 = v59;
                if (v59 >= v32)
                  v33 = v32;
                v59 = v33;
              }
              v12 = v28 | v25 | v26;
              v10 = v27 | v24;
              v68 &= v29;
              v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "useCases"));

              if (v34)
              {
                v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "useCases"));
                v36 = (void *)v35;
                a4 = v57;
                self = v58;
                v11 = v66;
                v13 = v56;
                if (v62)
                {
                  if (v35)
                    goto LABEL_49;
                }
                else
                {
                  v62 = objc_alloc_init((Class)NSMutableSet);
                  if (v36)
LABEL_49:
                    objc_msgSend(v62, "unionSet:", v36);
                }

              }
              else
              {
                a4 = v57;
                self = v58;
                v11 = v66;
                v13 = v56;
              }
LABEL_52:

              v9 = v64;
              goto LABEL_53;
            }
          }
          else if ((v67 & 1) == 0)
          {

            v61 = 0;
          }
          v67 = 1;
          goto LABEL_23;
        }
      }
LABEL_53:
      v14 = (char *)v14 + 1;
    }
    while (v9 != v14);
    v37 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v82, v87, 16);
    v9 = v37;
  }
  while (v37);
LABEL_60:

  enhancedDiscoveryShouldRun = self->_enhancedDiscoveryShouldRun;
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "allObjects"));
  v40 = 0;
  if (v86 && (v11 & 1) == 0)
    v40 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &v86, 1);
  v42 = (a4 & 1) == 0 || !enhancedDiscoveryShouldRun;
  v43 = 30;
  if (v69 > 30)
    v43 = v69;
  if (v42)
    v44 = v12;
  else
    v44 = v12 | 4;
  if (v42)
    v45 = v69;
  else
    v45 = v43;
  if ((v10 & 1) != 0)
    v46 = 0;
  else
    v46 = v65;
  if (v45)
    v47 = v45;
  else
    v47 = 20;
  if (v59 == 0x7FFFFFFFFFFFFFFFLL)
    v48 = 10;
  else
    v48 = v59;
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent _bleUpdateUseCases:](self, "_bleUpdateUseCases:", v62, v54));
  v70[0] = _NSConcreteStackBlock;
  v70[1] = 3221225472;
  v70[2] = sub_100008FE0;
  v70[3] = &unk_10071B388;
  v71 = v55;
  v72 = v39;
  v80 = v44;
  v81 = v68 & 1;
  v77 = v46;
  v78 = v47;
  v79 = v48;
  v73 = v40;
  v74 = v60;
  v75 = v49;
  v76 = self;
  v50 = v60;
  v51 = v40;
  v52 = v39;
  v53 = v55;
  objc_msgSend(v53, "performUpdate:", v70);

}

- (id)_bleUpdateUseCases:(id)a3
{
  id v4;

  v4 = objc_msgSend(a3, "mutableCopy");
  if (!v4)
    v4 = objc_alloc_init((Class)NSMutableSet);
  if ((objc_msgSend(v4, "containsObject:", &off_10074BD00) & 1) == 0)
    objc_msgSend(v4, "addObject:", &off_10074BD00);
  if (-[NSMutableSet count](self->_enhancedDiscoveryUseCases, "count"))
    objc_msgSend(v4, "unionSet:", self->_enhancedDiscoveryUseCases);
  if (self->_cameraState == 1
    && (-[NSMutableSet containsObject:](self->_enhancedDiscoveryUseCases, "containsObject:", &off_10074BD18) & 1) == 0)
  {
    objc_msgSend(v4, "addObject:", &off_10074BD30);
    -[SDNearbyAgent _postNotificationForWombatState:](self, "_postNotificationForWombatState:", 3);
  }
  return v4;
}

- (void)_deviceDiscoveryBLEDeviceLost:(id)a3 type:(int64_t)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  SDNearbyAgent *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSMutableSet *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  void *v21;
  void (**v22)(_QWORD, _QWORD);
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "identifier"));
  if (v6)
  {
    if (a4 == 7)
    {
      v13 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_ddProximityPairingDevices, "objectForKeyedSubscript:", v6));
      if (!v13)
        goto LABEL_23;
      v8 = (void *)v13;
      -[NSMutableDictionary removeObjectForKey:](self->_ddProximityPairingDevices, "removeObjectForKey:", v6);
      v9 = 2;
    }
    else
    {
      if (a4 == 16)
      {
        v14 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_ddNearbyInfoDevices, "objectForKeyedSubscript:", v6));
        if (!v14)
          goto LABEL_23;
        v8 = (void *)v14;
        -[NSMutableDictionary removeObjectForKey:](self->_ddNearbyInfoDevices, "removeObjectForKey:", v6);
        v9 = 1;
        v10 = self;
        v11 = v8;
        v12 = 1;
      }
      else
      {
        if (a4 != 15)
          goto LABEL_23;
        v7 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_ddNearbyActionDevices, "objectForKeyedSubscript:", v6));
        if (!v7)
          goto LABEL_23;
        v8 = (void *)v7;
        -[NSMutableDictionary removeObjectForKey:](self->_ddNearbyActionDevices, "removeObjectForKey:", v6);
        v9 = 16;
        v10 = self;
        v11 = v8;
        v12 = 16;
      }
      -[SDNearbyAgent _identificationHandleDeviceLost:flags:](v10, "_identificationHandleDeviceLost:flags:", v11, v12);
    }
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v15 = self->_ddRequests;
    v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(_QWORD *)v24 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
          if (((unint64_t)objc_msgSend(v20, "discoveryFlags", (_QWORD)v23) & v9) != 0)
          {
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "deviceLostHandler"));

            if (v21)
            {
              v22 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "deviceLostHandler"));
              ((void (**)(_QWORD, void *))v22)[2](v22, v8);

            }
          }
        }
        v17 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v17);
    }

  }
LABEL_23:

}

- (void)_identificationHandleDeviceLost:(id)a3 flags:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "identifier"));
  if (v6)
  {
    v11 = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_idDevices, "objectForKeyedSubscript:", v6));
    v8 = v7;
    if (v7)
    {
      v9 = (unint64_t)objc_msgSend(v7, "discoveryFlags");
      v10 = v9 & ~a4;
      if (v10 != v9)
      {
        objc_msgSend(v8, "setDiscoveryFlags:", v10);
        if (!v10)
          objc_msgSend(v8, "setLastUpdateTicks:", mach_absolute_time());
      }
    }

    v6 = v11;
  }

}

- (id)idsBluetoothDeviceIDsForSharing
{
  SDNearbyAgent *v2;
  NSSet *idsBluetoothDevicesSet;
  id v4;
  void *v5;
  NSSet *v6;
  NSSet *v7;
  NSSet *v8;

  v2 = self;
  objc_sync_enter(v2);
  idsBluetoothDevicesSet = v2->_idsBluetoothDevicesSet;
  if (!idsBluetoothDevicesSet)
  {
    v4 = objc_alloc((Class)NSSet);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent _idsBluetoothDeviceIDsForSharingLocked](v2, "_idsBluetoothDeviceIDsForSharingLocked"));
    v6 = (NSSet *)objc_msgSend(v4, "initWithArray:", v5);
    v7 = v2->_idsBluetoothDevicesSet;
    v2->_idsBluetoothDevicesSet = v6;

    idsBluetoothDevicesSet = v2->_idsBluetoothDevicesSet;
  }
  v8 = idsBluetoothDevicesSet;
  objc_sync_exit(v2);

  return v8;
}

- (BOOL)_bleNearbyActionScannerShouldScan
{
  NSMutableSet *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  if (self->_bleNearbyActionScanNever || -[NSMutableSet count](self->_bleDiagnosticModeClients, "count"))
    return 0;
  if (self->_bleNearbyActionScanAlways)
    return 1;
  if (!self->_ddNearbyActionEnabled)
    return 0;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = self->_ddRequests;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (!v5)
  {
LABEL_21:

    return 0;
  }
  v6 = v5;
  v7 = *(_QWORD *)v13;
LABEL_10:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v13 != v7)
      objc_enumerationMutation(v4);
    v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
    if ((objc_msgSend(v9, "discoveryFlags", (_QWORD)v12) & 0x10) == 0
      || !self->_activityScreenOn && !objc_msgSend(v9, "overrideScreenOff"))
    {
      goto LABEL_19;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "deviceFilter"));
    v11 = v10;
    if (!v10 || objc_msgSend(v10, "count"))
      break;

LABEL_19:
    if (v6 == (id)++v8)
    {
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        goto LABEL_10;
      goto LABEL_21;
    }
  }

  if (!self->_ddNearbyActionScreenOff && -[SDNearbyAgent _idsAppleTVCount](self, "_idsAppleTVCount") <= 0)
    return -[SDStatusMonitor screenOn](self->_statusMonitor, "screenOn");
  return 1;
}

- (void)_update
{
  _BOOL4 bleNearbyInfoAdvertiseAlways;
  int v4;
  int v5;
  SDNearbyAgent *v6;

  if (self->_activated)
  {
    bleNearbyInfoAdvertiseAlways = self->_bleNearbyInfoAdvertiseAlways;
    if (!self->_caEnabled)
      goto LABEL_11;
    if (self->_caSingleDevice)
      goto LABEL_12;
    if (-[SDNearbyAgent idsIsSignedIn](self, "idsIsSignedIn"))
    {
      v4 = -[SDNearbyAgent _idsContinuityDeviceCount](self, "_idsContinuityDeviceCount");
      if (!bleNearbyInfoAdvertiseAlways && v4 <= 0)
        goto LABEL_7;
    }
    else
    {
LABEL_11:
      if (!bleNearbyInfoAdvertiseAlways)
      {
LABEL_7:
        -[SDNearbyAgent _activityMonitorEnsureStopped](self, "_activityMonitorEnsureStopped");
        v5 = 0;
LABEL_13:
        if (self->_idEnabled)
          -[SDNearbyAgent _identificationEnsureStarted](self, "_identificationEnsureStarted");
        else
          -[SDNearbyAgent _identificationEnsureStopped](self, "_identificationEnsureStopped");
        if (-[SDNearbyAgent _bleNearbyActionAdvertiserShouldAdvertise](self, "_bleNearbyActionAdvertiserShouldAdvertise"))
        {
          -[SDNearbyAgent _bleNearbyActionAdvertiserEnsureStarted](self, "_bleNearbyActionAdvertiserEnsureStarted");
        }
        else
        {
          -[SDNearbyAgent _bleNearbyActionAdvertiserEnsureStopped](self, "_bleNearbyActionAdvertiserEnsureStopped");
        }
        if (-[SDNearbyAgent _bleNearbyActionScannerShouldScan](self, "_bleNearbyActionScannerShouldScan"))
          -[SDNearbyAgent _bleNearbyActionScannerEnsureStarted](self, "_bleNearbyActionScannerEnsureStarted");
        else
          -[SDNearbyAgent _bleNearbyActionScannerEnsureStopped](self, "_bleNearbyActionScannerEnsureStopped");
        if (-[SDNearbyAgent _bleNearbyInfoAdvertiserShouldAdvertise](self, "_bleNearbyInfoAdvertiserShouldAdvertise")
          || -[SDNearbyAgent _bleNearbyInfoAdvertiserLingerIfNeeded](self, "_bleNearbyInfoAdvertiserLingerIfNeeded"))
        {
          -[SDNearbyAgent _bleNearbyInfoAdvertiserEnsureStarted](self, "_bleNearbyInfoAdvertiserEnsureStarted");
        }
        else
        {
          -[SDNearbyAgent _bleNearbyInfoAdvertiserEnsureStopped](self, "_bleNearbyInfoAdvertiserEnsureStopped");
        }
        if (-[SDNearbyAgent _bleNearbyInfoScannerShouldScan](self, "_bleNearbyInfoScannerShouldScan"))
          -[SDNearbyAgent _bleNearbyInfoScannerEnsureStarted](self, "_bleNearbyInfoScannerEnsureStarted");
        else
          -[SDNearbyAgent _bleNearbyInfoScannerEnsureStopped](self, "_bleNearbyInfoScannerEnsureStopped");
        if (-[SDNearbyAgent _bleProximityPairingScannerShouldScan](self, "_bleProximityPairingScannerShouldScan"))
          -[SDNearbyAgent _bleProximityPairingScannerEnsureStarted](self, "_bleProximityPairingScannerEnsureStarted");
        else
          -[SDNearbyAgent _bleProximityPairingScannerEnsureStopped](self, "_bleProximityPairingScannerEnsureStopped");
        v6 = self;
        objc_sync_enter(v6);
        if (v6->_btPipeEnabled || v6->_btPipeForced)
          -[SDNearbyAgent _btPipeEnsureStarted](v6, "_btPipeEnsureStarted");
        else
          -[SDNearbyAgent _btPipeEnsureStopped](v6, "_btPipeEnsureStopped");
        objc_sync_exit(v6);

        if (v5)
        {
          -[SDNearbyAgent _activityMonitorUpdate](v6, "_activityMonitorUpdate");
        }
        else if (-[SDNearbyAgent _bleNearbyInfoAdvertiserShouldAdvertise](v6, "_bleNearbyInfoAdvertiserShouldAdvertise"))
        {
          -[SDNearbyAgent _bleNearbyInfoAdvertiserUpdate](v6, "_bleNearbyInfoAdvertiserUpdate");
        }
        return;
      }
    }
LABEL_12:
    -[SDNearbyAgent _activityMonitorEnsureStarted](self, "_activityMonitorEnsureStarted");
    v5 = 1;
    goto LABEL_13;
  }
  if (dword_1007B3A28 <= 90 && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 90)))
    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _update]", 90, "### Ignoring update before activate\n");
}

- (BOOL)_bleNearbyInfoAdvertiserShouldAdvertise
{
  uint64_t v3;
  const __CFString *v4;
  BOOL v5;
  const __CFString *v7;
  int DeviceClass;
  unsigned int v9;
  unsigned __int8 v10;
  void *v11;
  unsigned int v12;
  void *v13;
  unsigned int v14;
  NSMutableDictionary *services;
  NSString *v16;
  void *v17;
  _QWORD v18[6];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  if (!-[NSMutableSet count](self->_bleDiagnosticModeClients, "count"))
  {
    if (self->_bleNearbyInfoAdvertiseDisabled)
    {
      v4 = CFSTR("_bleNearbyInfoAdvertiseDisabled");
      goto LABEL_7;
    }
    if (self->_autoUnlockActive)
    {
      v4 = CFSTR("_autoUnlockActive");
      goto LABEL_7;
    }
    if (self->_bleNearbyInfoAdvertiseAlways)
    {
      v7 = CFSTR("_bleNearbyInfoAdvertiseAlways set");
LABEL_26:
      -[SDNearbyAgent _bleNearbyInfoAdvertiserUpdateAdvertiseReason:](self, "_bleNearbyInfoAdvertiserUpdateAdvertiseReason:", v7);
      return 1;
    }
    if (self->_bleNearbyInfoAdvertiseLingerTimer)
    {
      v7 = CFSTR("_bleNearbyInfoAdvertiseLingerTimer");
      goto LABEL_26;
    }
    if (self->_unlockAdvertiseAlways)
    {
      v7 = CFSTR("_unlockAdvertiseAlways");
      goto LABEL_26;
    }
    if (self->_unlockAdvertiseEnabled)
    {
      v7 = CFSTR("_unlockAdvertiseEnabled");
      goto LABEL_26;
    }
    if (self->_unlockAdvertiseWatch)
    {
      v7 = CFSTR("_unlockAdvertiseWatch");
      goto LABEL_26;
    }
    if (self->_unlockAdvertiseWatchLocked)
    {
      v7 = CFSTR("_unlockAdvertiseWatchLocked");
      goto LABEL_26;
    }
    if ((self->_familyFlags & 2) != 0)
    {
      v7 = CFSTR("familyFlags set");
      goto LABEL_26;
    }
    DeviceClass = GestaltGetDeviceClass(0, v3);
    if (DeviceClass == 7 || DeviceClass == 4)
    {
      v7 = CFSTR("device is communal");
      goto LABEL_26;
    }
    v9 = -[SDStatusMonitor screenOn](self->_statusMonitor, "screenOn");
    v10 = -[CUBluetoothClient statusFlags](self->_btConnectedDeviceMonitor, "statusFlags");
    if (v9 && (v10 & 8) != 0)
    {
      v7 = CFSTR("ShareAudio is ongoing while screen on");
      goto LABEL_26;
    }
    if (!-[SDNearbyAgent idsIsSignedIn](self, "idsIsSignedIn"))
    {
      v4 = CFSTR("Not signed into iCloud");
      goto LABEL_7;
    }
    if (-[SDStatusMonitor iCloudSharedPhotoLibraryEnabled](self->_statusMonitor, "iCloudSharedPhotoLibraryEnabled"))
    {
      v7 = CFSTR("Shared iCloud Photo Library is enabled");
      goto LABEL_26;
    }
    if (self->_coreDeviceEnabled)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
      v12 = objc_msgSend(v11, "supportsXcodePairing");

      if (v12)
      {
        v7 = CFSTR("CoreDeviceEnabled");
        goto LABEL_26;
      }
    }
    if (self->_fitnessPairingEnabled)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
      v14 = objc_msgSend(v13, "supportsFitnessPlusPairing");

      if (v14)
      {
        v7 = CFSTR("FitnessPairingEnabled");
        goto LABEL_26;
      }
    }
    if (self->_sessionPairingEnabled)
    {
      v7 = CFSTR("SessionPairingEnabled");
      goto LABEL_26;
    }
    if (-[SDNearbyAgent _idsShouldAdvertiseNearbyInfo](self, "_idsShouldAdvertiseNearbyInfo"))
    {
      v7 = CFSTR("Same account devices");
      goto LABEL_26;
    }
    if (v9)
    {
      v7 = CFSTR("Screen on");
      goto LABEL_26;
    }
    v25 = 0;
    v26 = &v25;
    v27 = 0x2020000000;
    v28 = 0;
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = sub_1001F248C;
    v23 = sub_1001F249C;
    v24 = 0;
    services = self->_services;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1001F24A4;
    v18[3] = &unk_10071B290;
    v18[4] = &v19;
    v18[5] = &v25;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](services, "enumerateKeysAndObjectsUsingBlock:", v18);
    if (*((_BYTE *)v26 + 24))
    {
      v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SFServiceType %s active"), sub_1001F2514((int)objc_msgSend((id)v20[5], "serviceType")));
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      -[SDNearbyAgent _bleNearbyInfoAdvertiserUpdateAdvertiseReason:](self, "_bleNearbyInfoAdvertiserUpdateAdvertiseReason:", v17);

    }
    else
    {
      if (!self->_caEnabled
        || !self->_activityUserActive
        || !self->_caSingleDevice && -[SDNearbyAgent _idsContinuityDeviceCount](self, "_idsContinuityDeviceCount") < 1)
      {
        -[SDNearbyAgent _bleNearbyInfoAdvertiserUpdateAdvertiseReason:](self, "_bleNearbyInfoAdvertiserUpdateAdvertiseReason:", CFSTR("Don't advertise by default"));
        v5 = 0;
        goto LABEL_55;
      }
      -[SDNearbyAgent _bleNearbyInfoAdvertiserUpdateAdvertiseReason:](self, "_bleNearbyInfoAdvertiserUpdateAdvertiseReason:", CFSTR("caEnabled"));
    }
    v5 = 1;
LABEL_55:
    _Block_object_dispose(&v19, 8);

    _Block_object_dispose(&v25, 8);
    return v5;
  }
  v4 = CFSTR("_bleDiagnosticModeClients.count > 0");
LABEL_7:
  -[SDNearbyAgent _bleNearbyInfoAdvertiserUpdateAdvertiseReason:](self, "_bleNearbyInfoAdvertiserUpdateAdvertiseReason:", v4);
  return 0;
}

- (BOOL)idsIsSignedIn
{
  SDNearbyAgent *v2;
  void *v3;
  id v4;
  uint64_t v5;
  void *i;
  const char *v7;
  void *v8;
  void *v9;
  BOOL v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v2 = self;
  objc_sync_enter(v2);
  if ((v2->_idsIsSignedInCache & 0x80000000) == 0)
    goto LABEL_27;
  v2->_idsIsSignedInCache = 0;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService accounts](v2->_idsService, "accounts"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v3);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), "isActive"))
        {
          v2->_idsIsSignedInCache = 1;
          goto LABEL_12;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_12:

  if (!v2->_idsIsSignedInCache)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent _idsDeviceArrayLocked](v2, "_idsDeviceArrayLocked"));
    if (objc_msgSend(v8, "count"))
    {

    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[IDSService devices](v2->_idsService, "devices"));
      v10 = objc_msgSend(v9, "count") == 0;

      if (v10)
        goto LABEL_13;
    }
    v2->_idsIsSignedInCache = 1;
    if (dword_1007B3A28 > 90)
      goto LABEL_27;
    if (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 90))
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent idsIsSignedIn]", 90, "### No active IDS accounts, but has devices\n");
  }
LABEL_13:
  if (dword_1007B3A28 <= 30 && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
  {
    if (v2->_idsIsSignedInCache)
      v7 = "yes";
    else
      v7 = "no";
    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent idsIsSignedIn]", 30, "IsSignedIn: %s\n", v7);
  }
LABEL_27:
  v11 = v2->_idsIsSignedInCache != 0;
  objc_sync_exit(v2);

  return v11;
}

- (void)_bleNearbyInfoAdvertiserUpdateAdvertiseReason:(id)a3
{
  NSString *v5;
  NSString *v6;

  v5 = (NSString *)a3;
  if (self->_bleNearbyInfoAdvertiseReason != v5)
  {
    self->_bleNearbyInfoAdvertiseReasonChanged = 1;
    v6 = v5;
    objc_storeStrong((id *)&self->_bleNearbyInfoAdvertiseReason, a3);
    v5 = v6;
  }

}

- (int)_idsAppleTVCount
{
  int result;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unsigned int v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  result = self->_idsAppleTVCountCache;
  if (result < 0)
  {
    self->_idsAppleTVCountCache = 0;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent idsDeviceArray](self, "idsDeviceArray", 0));
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v8), "modelIdentifier"));
          v10 = objc_msgSend(v9, "hasPrefix:", CFSTR("AppleTV"));

          if (v10)
            ++self->_idsAppleTVCountCache;
          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }

    return self->_idsAppleTVCountCache;
  }
  return result;
}

- (void)_identificationEnsureStarted
{
  NSObject *dispatchQueue;
  _QWORD handler[5];

  if (self->_idIdentitiesChangedNotifyToken == -1)
  {
    if ((-[CUSystemMonitor firstUnlocked](self->_systemMonitor, "firstUnlocked") & 1) != 0)
    {
      if (dword_1007B3A28 <= 30
        && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
      {
        LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _identificationEnsureStarted]", 30, "Identification start\n");
      }
      dispatchQueue = self->_dispatchQueue;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_1001FE018;
      handler[3] = &unk_100714EC8;
      handler[4] = self;
      notify_register_dispatch("com.apple.rapport.identitiesChanged", &self->_idIdentitiesChangedNotifyToken, dispatchQueue, handler);
      -[SDNearbyAgent _identificationGetIdentities](self, "_identificationGetIdentities");
    }
    else if (dword_1007B3A28 <= 20
           && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 20)))
    {
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _identificationEnsureStarted]", 20, "Deferring identification start until FirstUnlock\n");
    }
  }
}

- (void)_btPipeEnsureStarted
{
  SFBLEPipe *v3;
  SFBLEPipe *unlockBtPipe;
  _QWORD v5[5];

  if (!self->_unlockBtPipe)
  {
    if (dword_1007B3A28 <= 50
      && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 50)))
    {
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _btPipeEnsureStarted]", 50, "BTPipe start\n");
    }
    v3 = (SFBLEPipe *)objc_msgSend(objc_alloc((Class)SFBLEPipe), "initWithPriority:", 4);
    unlockBtPipe = self->_unlockBtPipe;
    self->_unlockBtPipe = v3;

    -[SFBLEPipe setDispatchQueue:](self->_unlockBtPipe, "setDispatchQueue:", self->_dispatchQueue);
    -[SFBLEPipe setIdentifier:](self->_unlockBtPipe, "setIdentifier:", CFSTR("com.apple.sharing.pautounlock"));
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1001F5FCC;
    v5[3] = &unk_1007185F0;
    v5[4] = self;
    -[SFBLEPipe setFrameHandler:](self->_unlockBtPipe, "setFrameHandler:", v5);
    -[SFBLEPipe activate](self->_unlockBtPipe, "activate");
  }
}

- (BOOL)_bleProximityPairingScannerShouldScan
{
  if (!self->_bleProximityEnabled
    || !self->_ddProximityPairingEnabled
    || -[NSMutableSet count](self->_bleDiagnosticModeClients, "count"))
  {
    return 0;
  }
  if (self->_ddProximityPairingScreenOff && !self->_systemWillPowerDown)
    return 1;
  return -[SDStatusMonitor screenOn](self->_statusMonitor, "screenOn");
}

- (void)_bleProximityPairingScannerEnsureStarted
{
  SFBLEScanner *bleProximityPairingScanner;
  SFBLEScanner *v4;
  SFBLEScanner *v5;
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];

  bleProximityPairingScanner = self->_bleProximityPairingScanner;
  if (bleProximityPairingScanner)
  {
    -[SDNearbyAgent _bleUpdateScanner:typeFlag:](self, "_bleUpdateScanner:typeFlag:", bleProximityPairingScanner, 2);
  }
  else
  {
    if (dword_1007B3A28 <= 50
      && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 50)))
    {
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _bleProximityPairingScannerEnsureStarted]", 50, "BLE Prox scanner start\n");
    }
    v4 = (SFBLEScanner *)objc_msgSend(objc_alloc((Class)SFBLEScanner), "initWithType:", 7);
    v5 = self->_bleProximityPairingScanner;
    self->_bleProximityPairingScanner = v4;

    -[SFBLEScanner setDispatchQueue:](self->_bleProximityPairingScanner, "setDispatchQueue:", self->_dispatchQueue);
    -[SFBLEScanner setChangeFlags:](self->_bleProximityPairingScanner, "setChangeFlags:", 13);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1001F596C;
    v9[3] = &unk_100715048;
    v9[4] = self;
    -[SFBLEScanner setDeviceFoundHandler:](self->_bleProximityPairingScanner, "setDeviceFoundHandler:", v9);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1001F5A9C;
    v8[3] = &unk_100715048;
    v8[4] = self;
    -[SFBLEScanner setDeviceLostHandler:](self->_bleProximityPairingScanner, "setDeviceLostHandler:", v8);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1001F5BB4;
    v7[3] = &unk_1007150B0;
    v7[4] = self;
    -[SFBLEScanner setDeviceChangedHandler:](self->_bleProximityPairingScanner, "setDeviceChangedHandler:", v7);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1001F5CF4;
    v6[3] = &unk_100715288;
    v6[4] = self;
    -[SFBLEScanner setScanStateChangedHandler:](self->_bleProximityPairingScanner, "setScanStateChangedHandler:", v6);
    -[SDNearbyAgent _bleUpdateScanner:typeFlag:](self, "_bleUpdateScanner:typeFlag:", self->_bleProximityPairingScanner, 2);
    if (self->_bleProximityRSSILog)
      -[SFBLEScanner setRssiLog:](self->_bleProximityPairingScanner, "setRssiLog:", 1);
    -[SFBLEScanner activateWithCompletion:](self->_bleProximityPairingScanner, "activateWithCompletion:", &stru_10071B340);
  }
}

- (BOOL)_bleNearbyInfoScannerShouldScan
{
  NSMutableSet *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  if (self->_systemWillPowerDown || -[NSMutableSet count](self->_bleDiagnosticModeClients, "count"))
    return 0;
  if (-[NSMutableSet count](self->_caRequests, "count"))
    return 1;
  if (!self->_ddNearbyInfoEnabled)
    return 0;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = self->_ddRequests;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (!v5)
  {
LABEL_21:

    return 0;
  }
  v6 = v5;
  v7 = *(_QWORD *)v13;
LABEL_10:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v13 != v7)
      objc_enumerationMutation(v4);
    v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
    if ((objc_msgSend(v9, "discoveryFlags", (_QWORD)v12) & 1) == 0
      || !self->_activityScreenOn && !objc_msgSend(v9, "overrideScreenOff"))
    {
      goto LABEL_19;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "deviceFilter"));
    v11 = v10;
    if (!v10 || objc_msgSend(v10, "count"))
      break;

LABEL_19:
    if (v6 == (id)++v8)
    {
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        goto LABEL_10;
      goto LABEL_21;
    }
  }

  if (self->_ddNearbyInfoScreenOff)
    return 1;
  return -[SDStatusMonitor screenOn](self->_statusMonitor, "screenOn");
}

- (void)_bleNearbyInfoScannerEnsureStopped
{
  SFBLEScanner *bleNearbyInfoScanner;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  NSMutableDictionary *bleNearbyInfoDevices;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  if (self->_bleNearbyInfoScanner
    && dword_1007B3A28 <= 50
    && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 50)))
  {
    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _bleNearbyInfoScannerEnsureStopped]", 50, "BLE NearbyInfo scanner stop\n");
  }
  -[SFBLEScanner invalidate](self->_bleNearbyInfoScanner, "invalidate");
  bleNearbyInfoScanner = self->_bleNearbyInfoScanner;
  self->_bleNearbyInfoScanner = 0;

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_bleNearbyInfoDevices, "allKeys", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_bleNearbyInfoDevices, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i)));
        if (v9)
          -[SDNearbyAgent _deviceDiscoveryBLEDeviceLost:type:](self, "_deviceDiscoveryBLEDeviceLost:type:", v9, 16);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  -[NSMutableDictionary removeAllObjects](self->_bleNearbyInfoDevices, "removeAllObjects");
  bleNearbyInfoDevices = self->_bleNearbyInfoDevices;
  self->_bleNearbyInfoDevices = 0;

}

- (BOOL)_bleNearbyInfoAdvertiserLingerIfNeeded
{
  _BOOL4 bleNearbyInfoAirDropUsable;

  bleNearbyInfoAirDropUsable = self->_bleNearbyInfoAirDropUsable;
  if (self->_bleNearbyInfoAirDropUsable)
  {
    self->_bleNearbyInfoAirDropUsable = 0;
    -[SDNearbyAgent _bleNearbyInfoAdvertiserLingerStart:](self, "_bleNearbyInfoAdvertiserLingerStart:", CFSTR("AirDropUsable"));
  }
  return bleNearbyInfoAirDropUsable;
}

- (void)_bleNearbyInfoAdvertiserEnsureStopped
{
  SFBLEAdvertiser *bleNearbyInfoAdvertiser;
  OS_dispatch_source *bleNearbyInfoAdvertiseLingerTimer;
  OS_dispatch_source *v5;
  NSObject *v6;

  if (self->_bleNearbyInfoAdvertiser
    && dword_1007B3A28 <= 30
    && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
  {
    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _bleNearbyInfoAdvertiserEnsureStopped]", 30, "BLE NearbyInfo advertiser stop. Reason: %@\n", self->_bleNearbyInfoAdvertiseReason);
  }
  -[SDNearbyAgent _disableEnhancedDiscovery:](self, "_disableEnhancedDiscovery:", CFSTR("StopNearbyInfo"));
  -[SFBLEAdvertiser invalidate](self->_bleNearbyInfoAdvertiser, "invalidate");
  bleNearbyInfoAdvertiser = self->_bleNearbyInfoAdvertiser;
  self->_bleNearbyInfoAdvertiser = 0;

  self->_bleNearbyInfoAdvertised = 0;
  bleNearbyInfoAdvertiseLingerTimer = self->_bleNearbyInfoAdvertiseLingerTimer;
  if (bleNearbyInfoAdvertiseLingerTimer)
  {
    v6 = bleNearbyInfoAdvertiseLingerTimer;
    dispatch_source_cancel(v6);
    v5 = self->_bleNearbyInfoAdvertiseLingerTimer;
    self->_bleNearbyInfoAdvertiseLingerTimer = 0;

  }
}

- (void)_disableEnhancedDiscovery:(id)a3
{
  id v4;
  OS_dispatch_source *enhancedDiscoveryTimer;
  NSObject *v6;
  OS_dispatch_source *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[2];

  v4 = a3;
  if (self->_enhancedDiscoveryShouldRun)
  {
    if (dword_1007B3A28 <= 30
      && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
    {
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _disableEnhancedDiscovery:]", 30, "Disable enhanced discovery for reason: %@\n", v4);
    }
    self->_enhancedDiscoveryShouldRun = 0;
    self->_enhancedDiscoveryAdvActive = 0;
    -[NSMutableSet removeAllObjects](self->_enhancedDiscoveryUseCases, "removeAllObjects");
    enhancedDiscoveryTimer = self->_enhancedDiscoveryTimer;
    if (enhancedDiscoveryTimer)
    {
      v6 = enhancedDiscoveryTimer;
      dispatch_source_cancel(v6);
      v7 = self->_enhancedDiscoveryTimer;
      self->_enhancedDiscoveryTimer = 0;

    }
    v10[1] = CFSTR("Enabled");
    v11[0] = v4;
    v10[0] = CFSTR("Reason");
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_enhancedDiscoveryShouldRun));
    v11[1] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 2));
    SFPowerLogEvent(CFSTR("EnhancedDiscovery"), v9);

  }
}

- (void)_bleNearbyActionScannerEnsureStarted
{
  SFBLEScanner *bleNearbyActionScanner;
  SFBLEScanner *v4;
  SFBLEScanner *v5;
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];

  bleNearbyActionScanner = self->_bleNearbyActionScanner;
  if (bleNearbyActionScanner)
  {
    -[SDNearbyAgent _bleUpdateScanner:typeFlag:](self, "_bleUpdateScanner:typeFlag:", bleNearbyActionScanner, 16);
  }
  else
  {
    if (dword_1007B3A28 <= 30
      && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
    {
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _bleNearbyActionScannerEnsureStarted]", 30, "BLE NearbyAction scanner start\n");
    }
    v4 = (SFBLEScanner *)objc_msgSend(objc_alloc((Class)SFBLEScanner), "initWithType:", 15);
    v5 = self->_bleNearbyActionScanner;
    self->_bleNearbyActionScanner = v4;

    -[SFBLEScanner setDispatchQueue:](self->_bleNearbyActionScanner, "setDispatchQueue:", self->_dispatchQueue);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1001F1E44;
    v9[3] = &unk_100715048;
    v9[4] = self;
    -[SFBLEScanner setDeviceFoundHandler:](self->_bleNearbyActionScanner, "setDeviceFoundHandler:", v9);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1001F1F38;
    v8[3] = &unk_100715048;
    v8[4] = self;
    -[SFBLEScanner setDeviceLostHandler:](self->_bleNearbyActionScanner, "setDeviceLostHandler:", v8);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1001F1FF8;
    v7[3] = &unk_1007150B0;
    v7[4] = self;
    -[SFBLEScanner setDeviceChangedHandler:](self->_bleNearbyActionScanner, "setDeviceChangedHandler:", v7);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1001F209C;
    v6[3] = &unk_100715288;
    v6[4] = self;
    -[SFBLEScanner setScanStateChangedHandler:](self->_bleNearbyActionScanner, "setScanStateChangedHandler:", v6);
    -[SDNearbyAgent _bleUpdateScanner:typeFlag:](self, "_bleUpdateScanner:typeFlag:", self->_bleNearbyActionScanner, 16);
    if (self->_bleNearbyActionRSSILog)
      -[SFBLEScanner setRssiLog:](self->_bleNearbyActionScanner, "setRssiLog:", 1);
    -[SFBLEScanner activateWithCompletion:](self->_bleNearbyActionScanner, "activateWithCompletion:", &stru_10071B268);
  }
}

- (BOOL)_bleNearbyActionAdvertiserShouldAdvertise
{
  return !-[NSMutableSet count](self->_bleDiagnosticModeClients, "count")
      && !self->_bleNearbyActionAdvertiseDisabled
      && !self->_preventNearbyActionAdvertising;
}

- (void)_bleNearbyActionAdvertiserEnsureStarted
{
  id v3;
  NSMutableDictionary *v4;
  unsigned __int8 v5;
  int v6;
  NSData *v7;
  const char *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  unsigned __int8 v13;
  int v14;
  void *v15;
  void *v16;
  const char *v17;
  NSData *v18;
  int v19;
  unsigned int v20;
  int v21;
  unsigned __int16 v22;
  char v23;
  int v24;
  unint64_t v25;
  void *v26;
  NSData *v27;
  id v28;
  CC_LONG v29;
  uint64_t v30;
  void *v31;
  void *v32;
  NSData *v33;
  void *v34;
  id v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  unsigned __int8 v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  NSData *bleAuthTagOverride;
  NSData *v52;
  void *v53;
  OS_dispatch_source *v54;
  OS_dispatch_source *v55;
  OS_dispatch_source *bleNearbyActionAdvertiseLingerTimer;
  char *v57;
  SFBLEAdvertiser *v58;
  SFBLEAdvertiser *bleNearbyActionAdvertiser;
  void *v60;
  OS_dispatch_source *v61;
  OS_dispatch_source *v62;
  NSObject *v63;
  dispatch_time_t v64;
  NSObject *v65;
  void *v66;
  NSData *v67;
  SDNearbyAgent *v68;
  const char *v69;
  NSMutableDictionary *obj;
  unsigned __int8 v71;
  unsigned __int8 v72;
  unsigned __int8 v73;
  id v74;
  uint64_t v75;
  id v76;
  char v77;
  uint64_t v78;
  uint64_t v79;
  _QWORD handler[5];
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  unsigned __int8 md[16];
  __int128 v86;
  _BYTE v87[128];

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v4 = self->_services;
  v76 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v81, v87, 16);
  if (!v76)
  {

    v7 = 0;
    v57 = 0;
    v9 = 0;
    goto LABEL_148;
  }
  obj = v4;
  v66 = v3;
  v78 = 0;
  v79 = 0;
  v5 = 0;
  v6 = 0;
  v74 = 0;
  v7 = 0;
  v71 = 0;
  v73 = 0;
  v8 = 0;
  v9 = 0;
  v72 = SFDeviceColorCodeUnknown;
  v75 = *(_QWORD *)v82;
  v77 = 1;
  v68 = self;
LABEL_3:
  v10 = 0;
  while (2)
  {
    if (*(_QWORD *)v82 != v75)
      objc_enumerationMutation(obj);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_services, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * v10)));
    v12 = objc_msgSend(v11, "deviceActionType");
    v13 = v12;
    v14 = 990;
    switch((int)v12)
    {
      case 0:
        goto LABEL_47;
      case 1:
        if ((SFIsDeviceAudioAccessory(v12) & 1) != 0)
          goto LABEL_104;
        v14 = 680;
LABEL_43:
        if (v14 >= v6)
          v5 = v13;
        if (v14 > v6)
          v6 = v14;
LABEL_47:
        if ((!-[CUSystemMonitor screenOn](self->_systemMonitor, "screenOn")
           || -[CUSystemMonitor screenSaverActive](self->_systemMonitor, "screenSaverActive"))
          && !objc_msgSend(v11, "overrideScreenOff"))
        {
          goto LABEL_104;
        }
        if ((uint64_t)objc_msgSend(v11, "advertiseRate") > (uint64_t)v74)
          v74 = objc_msgSend(v11, "advertiseRate");
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "authTagOverride"));
        v16 = v15;
        if (v15)
        {
          v17 = v8;
          v18 = v15;

          v7 = v18;
          v8 = v17;
        }

        if (objc_msgSend(v11, "deviceClassCode"))
          v71 = objc_msgSend(v11, "deviceClassCode");
        if (objc_msgSend(v11, "deviceColorCode"))
          v72 = objc_msgSend(v11, "deviceColorCode");
        if (objc_msgSend(v11, "deviceModelCode"))
          v73 = objc_msgSend(v11, "deviceModelCode");
        if (objc_msgSend(v11, "needsKeyboard"))
          v19 = HIDWORD(v79) | 0x20;
        else
          v19 = HIDWORD(v79);
        v20 = objc_msgSend(v11, "needsSetup");
        v21 = v19 | 0x40;
        if (!v20)
          v21 = v19;
        HIDWORD(v79) = v21;
        v22 = (unsigned __int16)objc_msgSend(v11, "sessionFlags");
        v23 = v22;
        if ((v22 & 0x200) != 0)
        {
          if ((id)-[SDStatusMonitor mediaAccessControlSetting](self->_statusMonitor, "mediaAccessControlSetting") == (id)1)
            v24 = 24;
          else
            v24 = 16;
          HIDWORD(v79) |= v24;
        }
        v25 = (unint64_t)objc_msgSend(v11, "problemFlags");
        if (!v8)
        {
          if (objc_msgSend(v11, "deviceActionType") == 8)
          {
            v26 = v9;
            v27 = v7;
            v28 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "requestSSID")));
            v8 = (const char *)objc_msgSend(v28, "UTF8String");

            if (v8)
            {
              *(_OWORD *)md = 0u;
              v86 = 0u;
              v29 = strlen(v8);
              CC_SHA256(v8, v29, md);
              v8 = (const char *)objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", md, 3);
            }
            v7 = v27;
            v9 = v26;
            self = v68;
          }
          else
          {
            v8 = 0;
          }
        }
        LODWORD(v79) = v79 | ((v23 & 0x80) >> 7);
        if ((v77 & 1) == 0)
        {
          v77 = 0;
          goto LABEL_102;
        }
        if (objc_msgSend(v11, "deviceActionType") != 51)
        {
          v77 = 1;
          goto LABEL_102;
        }
        v69 = v8;
        v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "targetAuthTag"));
        if (v30)
        {
          v31 = (void *)v30;
          v32 = v9;
          v33 = v7;
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "targetAuthTag"));
          v35 = objc_msgSend(v34, "length");

          if (v35 == (id)3)
          {
            v7 = v33;
            v9 = v32;
            self = v68;
            if (!v9)
            {
              v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "targetAuthTag"));
              LODWORD(v79) = v79 | 4;
            }
          }
          else
          {
            v7 = v33;
            v9 = v32;
            self = v68;
          }
        }
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "targetAuthTag"));

        if (v36)
        {
          if (!v9 || (v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "targetAuthTag"))) == 0)
          {
            v77 = 1;
            goto LABEL_91;
          }
          v38 = (void *)v37;
          v67 = v7;
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "targetAuthTag"));
          v40 = objc_msgSend(v9, "isEqual:", v39);

          if ((v40 & 1) != 0)
          {
            v77 = 1;
            v7 = v67;
            self = v68;
LABEL_91:
            v8 = v69;
            goto LABEL_102;
          }
          v7 = v67;
          self = v68;
          v8 = v69;
          if (dword_1007B3A28 <= 40
            && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 40)))
          {
            v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "targetAuthTag"));
            LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _bleNearbyActionAdvertiserEnsureStarted]", 40, "Avoid setting target auth tag as there is more than one to set {%@, %@}", v9, v41);

            v8 = v69;
          }
        }
        else
        {
          v8 = v69;
          if (dword_1007B3A28 <= 40
            && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 40)))
          {
            LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _bleNearbyActionAdvertiserEnsureStarted]", 40, "Avoid setting target auth tag as there is a service with no target auth tag");
          }
        }

        v77 = 0;
        v9 = 0;
        LODWORD(v79) = v79 & 0xFFFFFFFB;
LABEL_102:
        v78 |= v25;
        v42 = objc_msgSend(v11, "deviceActionType");
        if ((_DWORD)v42 == 84)
        {
          v71 = SFDeviceClassCodeGet(v42, v43);
          v73 = SFDeviceModelCodeGet();
          v72 = SFDeviceColorCodeGet();
        }
LABEL_104:

        if (v76 != (id)++v10)
          continue;
        v76 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v81, v87, 16);
        if (v76)
          goto LABEL_3;

        if (BYTE4(v79) || v5 - 28 <= 0x38 && ((1 << (v5 - 28)) & 0x10000001A008053) != 0 || v5 == 19)
        {
          self->_bleNearbyActionAdvertiseActive = 1;
          if (v74)
            v44 = (uint64_t)v74;
          else
            v44 = 40;
          v3 = v66;
          if (v71)
          {
            v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v71));
            objc_msgSend(v66, "setObject:forKeyedSubscript:", v45, CFSTR("cl"));

          }
          if (v72)
          {
            v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v72));
            objc_msgSend(v66, "setObject:forKeyedSubscript:", v46, CFSTR("cc"));

          }
          if (v73)
          {
            v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v73));
            objc_msgSend(v66, "setObject:forKeyedSubscript:", v47, CFSTR("md"));

          }
          if ((v79 & 0x2000000000) != 0)
            objc_msgSend(v66, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("nk"));
          if ((v79 & 0x4000000000) != 0)
            objc_msgSend(v66, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("ns"));
          if (BYTE4(v79))
          {
            v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", BYTE4(v79)));
            objc_msgSend(v66, "setObject:forKeyedSubscript:", v48, CFSTR("af1"));

          }
          if ((_BYTE)v79)
          {
            v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v79));
            objc_msgSend(v66, "setObject:forKeyedSubscript:", v49, CFSTR("af2"));

          }
          if (v9)
            objc_msgSend(v66, "setObject:forKeyedSubscript:", v9, CFSTR("tatag"));
          v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v5));
          objc_msgSend(v66, "setObject:forKeyedSubscript:", v50, CFSTR("dt"));

          -[SDNearbyAgent _bleUpdateAuthTagIfNeeded](self, "_bleUpdateAuthTagIfNeeded");
          bleAuthTagOverride = self->_bleAuthTagOverride;
          if (bleAuthTagOverride || (bleAuthTagOverride = v7) != 0 || (bleAuthTagOverride = self->_bleAuthTag) != 0)
            objc_msgSend(v66, "setObject:forKeyedSubscript:", bleAuthTagOverride, CFSTR("at"));
          if (v5 == 8 && self->_contactHashesEnabled)
          {
            v52 = self->_contactHashesCached;
            if (v52
              || (v52 = (NSData *)objc_claimAutoreleasedReturnValue(-[SDStatusMonitor myMediumHashes](self->_statusMonitor, "myMediumHashes")),
                  objc_storeStrong((id *)&self->_contactHashesCached, v52),
                  v52))
            {
              objc_msgSend(v66, "setObject:forKeyedSubscript:", v52, CFSTR("ach"));

            }
          }
          if (v78)
          {
            v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:"));
            objc_msgSend(v66, "setObject:forKeyedSubscript:", v53, CFSTR("pf"));

          }
          if (v8)
            objc_msgSend(v66, "setObject:forKeyedSubscript:", v8, CFSTR("ssidH"));
          v54 = self->_bleNearbyActionAdvertiseLingerTimer;
          v55 = v54;
          if (v54)
          {
            dispatch_source_cancel((dispatch_source_t)v54);
            bleNearbyActionAdvertiseLingerTimer = self->_bleNearbyActionAdvertiseLingerTimer;
            self->_bleNearbyActionAdvertiseLingerTimer = 0;

          }
          if (self->_bleNearbyActionAdvertiser)
          {
            if (dword_1007B3A28 <= 30
              && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
            {
              LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _bleNearbyActionAdvertiserEnsureStarted]", 30, "BLE NearbyAction advertiser update: %#{flags}\n", BYTE4(v79), &unk_1005CD0BF);
            }
            -[SFBLEAdvertiser setPayloadFields:](self->_bleNearbyActionAdvertiser, "setPayloadFields:", v66);
            if ((id)v44 != -[SFBLEAdvertiser advertiseRate](self->_bleNearbyActionAdvertiser, "advertiseRate"))
              -[SFBLEAdvertiser setAdvertiseRate:](self->_bleNearbyActionAdvertiser, "setAdvertiseRate:", v44);
          }
          else
          {
            if (dword_1007B3A28 <= 30
              && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
            {
              LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _bleNearbyActionAdvertiserEnsureStarted]", 30, "BLE NearbyAction advertiser start: %#{flags}, %##@\n", BYTE4(v79), &unk_1005CD0BF, v66);
            }
            v58 = (SFBLEAdvertiser *)objc_msgSend(objc_alloc((Class)SFBLEAdvertiser), "initWithType:", 15);
            bleNearbyActionAdvertiser = self->_bleNearbyActionAdvertiser;
            self->_bleNearbyActionAdvertiser = v58;

            -[SFBLEAdvertiser setAdvertiseRate:](self->_bleNearbyActionAdvertiser, "setAdvertiseRate:", v44);
            -[SFBLEAdvertiser setDispatchQueue:](self->_bleNearbyActionAdvertiser, "setDispatchQueue:", self->_dispatchQueue);
            v60 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent _idsBluetoothDeviceIDsForLEPipe](self, "_idsBluetoothDeviceIDsForLEPipe"));
            -[SFBLEAdvertiser setLePipeDevices:](self->_bleNearbyActionAdvertiser, "setLePipeDevices:", v60);

            -[SFBLEAdvertiser setPayloadFields:](self->_bleNearbyActionAdvertiser, "setPayloadFields:", v66);
            -[SFBLEAdvertiser activateWithCompletion:](self->_bleNearbyActionAdvertiser, "activateWithCompletion:", &stru_10071B248);
          }
          v57 = (char *)v8;
        }
        else
        {
          v3 = v66;
          v57 = (char *)v8;
LABEL_148:
          self->_bleNearbyActionAdvertiseActive = 0;
          if (self->_bleNearbyActionAdvertiser && !self->_bleNearbyActionAdvertiseLingerTimer)
          {
            if (dword_1007B3A28 <= 30
              && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
            {
              LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _bleNearbyActionAdvertiserEnsureStarted]", 30, "BLE NearbyAction advertiser goodbye update: %#{flags}\n", 0, &unk_1005CD0BF);
            }
            -[SFBLEAdvertiser setPayloadFields:](self->_bleNearbyActionAdvertiser, "setPayloadFields:", v3);
            -[SFBLEAdvertiser setAdvertiseRate:](self->_bleNearbyActionAdvertiser, "setAdvertiseRate:", 50);
            if (dword_1007B3A28 <= 30
              && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
            {
              LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _bleNearbyActionAdvertiserEnsureStarted]", 30, "BLE NearbyAction linger advertise for 5 seconds for goodbyes\n");
            }
            v61 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
            v62 = self->_bleNearbyActionAdvertiseLingerTimer;
            self->_bleNearbyActionAdvertiseLingerTimer = v61;

            v63 = self->_bleNearbyActionAdvertiseLingerTimer;
            v64 = dispatch_time(0, 5000000000);
            dispatch_source_set_timer(v63, v64, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
            v65 = self->_bleNearbyActionAdvertiseLingerTimer;
            handler[0] = _NSConcreteStackBlock;
            handler[1] = 3221225472;
            handler[2] = sub_1001F1CC0;
            handler[3] = &unk_1007146D8;
            handler[4] = self;
            dispatch_source_set_event_handler(v65, handler);
            dispatch_resume((dispatch_object_t)self->_bleNearbyActionAdvertiseLingerTimer);
          }
        }

        return;
      case 4:
        v14 = 480;
        goto LABEL_43;
      case 5:
        v14 = 450;
        goto LABEL_43;
      case 6:
        v14 = 960;
        goto LABEL_43;
      case 7:
        v14 = 470;
        goto LABEL_43;
      case 8:
        v14 = 950;
        goto LABEL_43;
      case 9:
        v14 = 670;
        goto LABEL_43;
      case 10:
        v14 = 630;
        goto LABEL_43;
      case 11:
        v14 = 690;
        goto LABEL_43;
      case 12:
        v14 = 980;
        goto LABEL_43;
      case 13:
        v14 = 660;
        goto LABEL_43;
      case 14:
        v14 = 930;
        goto LABEL_43;
      case 17:
        v14 = 590;
        goto LABEL_43;
      case 18:
        v14 = 580;
        goto LABEL_43;
      case 19:
        v14 = 920;
        goto LABEL_43;
      case 20:
        v14 = 490;
        goto LABEL_43;
      case 21:
        v14 = 460;
        goto LABEL_43;
      case 22:
        v14 = 910;
        goto LABEL_43;
      case 24:
        v14 = 640;
        goto LABEL_43;
      case 25:
      case 30:
        v14 = 940;
        goto LABEL_43;
      case 27:
        v14 = 900;
        goto LABEL_43;
      case 28:
        v14 = 970;
        goto LABEL_43;
      case 29:
        v14 = 880;
        goto LABEL_43;
      case 31:
        v14 = 895;
        goto LABEL_43;
      case 32:
        v14 = 965;
        goto LABEL_43;
      case 33:
        v14 = 700;
        goto LABEL_43;
      case 34:
        v14 = 971;
        goto LABEL_43;
      case 36:
        v14 = 665;
        goto LABEL_43;
      case 43:
        v14 = 966;
        goto LABEL_43;
      case 50:
        goto LABEL_43;
      case 51:
        v14 = 790;
        goto LABEL_43;
      case 53:
        v14 = 890;
        goto LABEL_43;
      case 55:
        v14 = 985;
        goto LABEL_43;
      case 56:
        v14 = 860;
        goto LABEL_43;
      case 84:
        v14 = 870;
        goto LABEL_43;
      default:
        v14 = 1;
        goto LABEL_43;
    }
  }
}

- (void)_activityMonitorEnsureStopped
{
  int activityLevelNotifyToken;
  void *v4;
  void *v5;
  OS_dispatch_source *activityTimer;
  OS_dispatch_source *v7;
  NSObject *v8;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_activityMonitorStarted)
    *(_WORD *)&self->_activityLevel = 0;
  activityLevelNotifyToken = self->_activityLevelNotifyToken;
  if (activityLevelNotifyToken != -1)
  {
    notify_set_state(activityLevelNotifyToken, self->_activityLevel);
    notify_post("com.apple.sharing.activity-level-changed");
    notify_cancel(self->_activityLevelNotifyToken);
    self->_activityLevelNotifyToken = -1;
  }
  if (self->_activityCarPlayRegistered)
  {
    self->_activityCarPlayRegistered = 0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("com.apple.sharingd.CarPlayStatusChanged"), 0);

  }
  if (self->_activityMultipleUsersRegistered)
  {
    self->_activityMultipleUsersRegistered = 0;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("com.apple.sharingd.MultipleUsersLoggedInChanged"), 0);

  }
  activityTimer = self->_activityTimer;
  if (activityTimer)
  {
    v8 = activityTimer;
    dispatch_source_cancel(v8);
    v7 = self->_activityTimer;
    self->_activityTimer = 0;

  }
}

- (void)_identificationMaintenanceTimer
{
  uint64_t v3;
  unint64_t v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  OS_dispatch_source *idMaintenanceTimer;
  NSObject *v13;
  OS_dispatch_source *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = mach_absolute_time();
  v4 = SecondsToUpTicks(60);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_idDevices, "allKeys"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_idDevices, "objectForKeyedSubscript:", v10));
        if (!objc_msgSend(v11, "discoveryFlags") && v3 - (unint64_t)objc_msgSend(v11, "lastUpdateTicks") >= v4)
        {
          -[NSMutableDictionary removeObjectForKey:](self->_idDevices, "removeObjectForKey:", v10);
          if (dword_1007B3A28 <= 30
            && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
          {
            LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _identificationMaintenanceTimer]", 30, "Identification removed stale %@\n", v10);
          }
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  if (!-[NSMutableDictionary count](self->_idDevices, "count"))
  {
    if (dword_1007B3A28 <= 30
      && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
    {
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _identificationMaintenanceTimer]", 30, "Identification stopping maintenance timer\n");
    }
    idMaintenanceTimer = self->_idMaintenanceTimer;
    if (idMaintenanceTimer)
    {
      v13 = idMaintenanceTimer;
      dispatch_source_cancel(v13);
      v14 = self->_idMaintenanceTimer;
      self->_idMaintenanceTimer = 0;

    }
  }
}

- (BOOL)screenOn
{
  return -[SDStatusMonitor screenOn](self->_statusMonitor, "screenOn");
}

+ (SDNearbyAgent)sharedNearbyAgent
{
  if (qword_1007C6DE0 != -1)
    dispatch_once(&qword_1007C6DE0, &stru_10071B170);
  return (SDNearbyAgent *)gSFNearbyAgent;
}

- (id)sharedNearbyPipe
{
  SDNearbyAgent *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  BOOL v7;
  SFBLEPipe *v8;

  v2 = self;
  v3 = objc_sync_enter(v2);
  v5 = SFDeviceClassCodeGet(v3, v4);
  v7 = v5 == 1 || v5 == 7;
  v2->_btPipeForced = v7;
  if (v2->_activated)
  {
    -[SDNearbyAgent _btPipeEnsureStarted](v2, "_btPipeEnsureStarted");
    v8 = v2->_unlockBtPipe;
  }
  else
  {
    if (dword_1007B3A28 <= 90
      && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 90)))
    {
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent sharedNearbyPipe]", 90, "### Ignoring pipe start before activate\n");
    }
    v8 = 0;
  }
  objc_sync_exit(v2);

  return v8;
}

- (SDNearbyAgent)init
{
  SDNearbyAgent *v2;
  uint64_t v3;
  SDNearbyAgent *v4;
  uint64_t v5;
  uint64_t v6;
  OS_dispatch_queue *dispatchQueue;
  __int128 v8;
  NSMutableSet *v9;
  NSMutableSet *enhancedDiscoveryUseCases;
  SDNearbyAgent *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SDNearbyAgent;
  v2 = -[SDNearbyAgent init](&v13, "init");
  v4 = v2;
  if (v2)
  {
    v2->_activityLevelNotifyToken = -1;
    v2->_allowEnhancedDiscovery = -1;
    v2->_caForce = -1;
    v5 = SFMainQueue(v2, v3);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    dispatchQueue = v4->_dispatchQueue;
    v4->_dispatchQueue = (OS_dispatch_queue *)v6;

    v4->_familyNotifyToken = -1;
    v4->_idIdentitiesChangedNotifyToken = -1;
    v4->_idsAppleTVCountCache = -1;
    v4->_idsContinuityDeviceCountCache = -1;
    v4->_idsWatchCountCache = -1;
    v4->_homePodModelCodeOverride = -1;
    *(_QWORD *)&v8 = -1;
    *((_QWORD *)&v8 + 1) = -1;
    *(_OWORD *)&v4->_idsHasActiveWatchCache = v8;
    *(_OWORD *)&v4->_idsIsSignedInCache = v8;
    v9 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    enhancedDiscoveryUseCases = v4->_enhancedDiscoveryUseCases;
    v4->_enhancedDiscoveryUseCases = v9;

    v4->_wombatActivityToken = -1;
    -[SDNearbyAgent prefillDefaultsForGenuineCheckIfNecessary](v4, "prefillDefaultsForGenuineCheckIfNecessary");
    v11 = v4;
  }

  return v4;
}

- (NSString)description
{
  double Current;
  uint64_t activityLevel;
  const char *v4;
  double startTime;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  SDStatusMonitor **p_statusMonitor;
  const char *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  id v15;
  id v16;
  uint64_t audioRoutingScore;
  const char *v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  unsigned int v24;
  const char *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  unsigned int v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  SDNearbyAgent *v47;
  id v48;
  id v49;
  id v50;
  id v51;
  SDNearbyAgent *v52;
  SFBLEAdvertiser *bleNearbyActionAdvertiser;
  const char *v54;
  id v55;
  SFBLEScanner *bleNearbyActionScanner;
  id v57;
  SFBLEAdvertiser *bleNearbyInfoAdvertiser;
  id v59;
  SFBLEScanner *bleNearbyInfoScanner;
  id v61;
  SFBLEScanner *bleProximityPairingScanner;
  id v63;
  id v64;
  unsigned int v65;
  const char *v66;
  id v67;
  const char *v68;
  const char *v69;
  const char *v70;
  const char *v71;
  id v72;
  SDNearbyAgent *v73;
  SFBLEPipe *unlockBtPipe;
  id v75;
  id v76;
  SDNearbyAgent *v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  NSMutableDictionary *idDevices;
  id v91;
  id v92;
  id v93;
  const char *v94;
  const char *v95;
  void *v96;
  id v97;
  unsigned int v98;
  unsigned int v99;
  unsigned int v100;
  const char *v101;
  void *v102;
  id v103;
  id v104;
  SFSystemService *systemService;
  id v106;
  id v107;
  void *v108;
  id v109;
  int v110;
  uint64_t v111;
  void *i;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  id v116;
  id v117;
  NSMutableDictionary *v118;
  id v119;
  uint64_t v120;
  void *v121;
  void *v122;
  uint64_t v123;
  void *v124;
  id v125;
  NSMutableDictionary *v126;
  id v127;
  uint64_t v128;
  void *v129;
  void *v130;
  uint64_t v131;
  void *v132;
  id v133;
  NSMutableDictionary *v134;
  id v135;
  uint64_t v136;
  void *v137;
  void *v138;
  uint64_t v139;
  void *v140;
  id v141;
  id v142;
  id v143;
  const char *v145;
  id v146;
  id v147;
  id v149;
  id v150;
  id v151;
  id v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  id v157;
  id v158;
  id v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  id v164;
  id v165;
  id v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  id v171;
  id v172;
  id v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  id v178;
  id v179;
  id v180;
  id v181;
  id v182;
  id v183;
  _QWORD v184[5];
  id v185;
  id v186;
  id v187;
  id v188;
  id v189;
  id v190;
  id v191;
  id v192;
  id v193;
  id v194;
  id v195;
  id v196;
  id v197;
  id v198;
  id v199;
  id v200;
  id v201;
  id v202;
  id v203;
  id v204;
  id v205;
  id v206;
  id v207;
  id v208;
  id v209;
  id v210;
  id v211;
  id v212;
  id v213;
  id v214;
  id v215;
  id v216;
  id v217;
  void **v218;
  uint64_t v219;
  uint64_t v220;
  void *v221;
  uint64_t *v222;
  uint64_t v223;
  uint64_t *v224;
  uint64_t v225;
  uint64_t v226;
  _BYTE v227[128];
  _BYTE v228[128];
  _BYTE v229[128];
  _BYTE v230[128];

  v217 = 0;
  NSAppendPrintF(&v217, "-- SDNearbyAgent --\n");
  v146 = v217;
  v216 = v146;
  Current = CFAbsoluteTimeGetCurrent();
  activityLevel = self->_activityLevel;
  if (activityLevel > 0xE)
    v4 = "?";
  else
    v4 = off_10071BE58[(char)activityLevel];
  startTime = self->_startTime;
  if (self->_activityTimer)
    v6 = "on";
  else
    v6 = "off";
  -[SDNearbyAgent _activityMonitorLastUserEventDelta](self, "_activityMonitorLastUserEventDelta");
  v8 = v7;
  if (self->_bleNearbyInfoAdvertiseLingerTimer)
    v9 = "on";
  else
    v9 = "off";
  p_statusMonitor = &self->_statusMonitor;
  if (-[SDStatusMonitor screenOn](self->_statusMonitor, "screenOn"))
    v11 = "on";
  else
    v11 = "off";
  if (-[SDStatusMonitor deviceUIUnlocked](*p_statusMonitor, "deviceUIUnlocked"))
    v12 = "unlocked";
  else
    v12 = "locked";
  if (-[SDStatusMonitor smartCoverIsClosed](*p_statusMonitor, "smartCoverIsClosed"))
    v13 = "closed";
  else
    v13 = "not closed";
  if (-[SDStatusMonitor multipleUsersLoggedIn](*p_statusMonitor, "multipleUsersLoggedIn"))
    v14 = "yes";
  else
    v14 = "no";
  v15 = (id)-[SDStatusMonitor systemUIFlags](*p_statusMonitor, "systemUIFlags");
  v16 = -[SDStatusMonitor pairedWatchWristState](*p_statusMonitor, "pairedWatchWristState");
  audioRoutingScore = self->_audioRoutingScore;
  if (audioRoutingScore > 0xF)
    v18 = "?";
  else
    v18 = off_10071B620[audioRoutingScore];
  NSAppendPrintF(&v216, "Up %ll{dur}, level %d (%s), timer %s, last user %.2f secs, linger %s, screen %s (%s), cover %s, multiuser %s, sysUI 0x%X, watch %d, FamF 0x%llX, ARS %s", (unint64_t)(Current - startTime), activityLevel, v4, v6, v8, v9, v11, v12, v13, v14, v15, v16, self->_familyFlags, v18);
  v19 = v216;

  v20 = objc_autoreleasePoolPush();
  v21 = objc_alloc_init((Class)CUAppleIDClient);
  v22 = objc_msgSend(v21, "copyMyAppleIDAndReturnError:", 0);
  v215 = v19;
  NSAppendPrintF(&v215, ", AID '%@'", v22);
  v23 = v215;

  v214 = v23;
  v24 = objc_msgSend(v21, "securityLevel");
  v25 = "?";
  if (v24 <= 5)
    v25 = off_10071B5F0[v24];
  NSAppendPrintF(&v214, " (%s)", v25);
  v26 = v214;

  objc_autoreleasePoolPop(v20);
  v27 = objc_autoreleasePoolPush();
  v223 = 0;
  v224 = &v223;
  v225 = 0x2050000000;
  v28 = (void *)qword_1007C6DF0;
  v226 = qword_1007C6DF0;
  if (!qword_1007C6DF0)
  {
    v218 = _NSConcreteStackBlock;
    v219 = 3221225472;
    v220 = (uint64_t)sub_100208214;
    v221 = &unk_100714258;
    v222 = &v223;
    sub_100208214((uint64_t)&v218);
    v28 = (void *)v224[3];
  }
  v29 = objc_retainAutorelease(v28);
  _Block_object_dispose(&v223, 8);
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "defaultStore"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "activeAccount"));

  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "altDSID"));
  if (!v32)
  {
    v213 = v26;
    v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "accountName"));
LABEL_37:
    v38 = (void *)v40;
    v39 = "Unknown";
    goto LABEL_38;
  }
  v223 = 0;
  v224 = &v223;
  v225 = 0x2050000000;
  v33 = (void *)qword_1007C6E00;
  v226 = qword_1007C6E00;
  if (!qword_1007C6E00)
  {
    v218 = _NSConcreteStackBlock;
    v219 = 3221225472;
    v220 = (uint64_t)sub_1002082F0;
    v221 = &unk_100714258;
    v222 = &v223;
    sub_1002082F0((uint64_t)&v218);
    v33 = (void *)v224[3];
  }
  v34 = objc_retainAutorelease(v33);
  _Block_object_dispose(&v223, 8);
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "sharedInstance"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "authKitAccountWithAltDSID:", v32));
  if (!v36)
  {

    v213 = v26;
    v40 = objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "accountName"));
    goto LABEL_37;
  }
  v37 = objc_msgSend(v35, "securityLevelForAccount:", v36);

  v213 = v26;
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "accountName"));
  v39 = "Unknown";
  switch(v37)
  {
    case 0u:
      break;
    case 1u:
      v39 = "PWOnly";
      break;
    case 2u:
      v39 = "SA";
      break;
    case 3u:
      v39 = "HSA1";
      break;
    case 4u:
      v39 = "HSA2";
      break;
    case 5u:
      v39 = "Managed";
      break;
    default:
      v39 = "?";
      break;
  }
LABEL_38:
  NSAppendPrintF(&v213, ", iTunes '%@' (%s)", v38, v39);
  v41 = v213;

  objc_autoreleasePoolPop(v27);
  v212 = v41;
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[CUSystemMonitor meDeviceFMFDeviceID](self->_systemMonitor, "meDeviceFMFDeviceID"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[CUSystemMonitor meDeviceIDSDeviceID](self->_systemMonitor, "meDeviceIDSDeviceID"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[CUSystemMonitor meDeviceName](self->_systemMonitor, "meDeviceName"));
  NSAppendPrintF(&v212, ", MeDev F<%.8@> I<%.8@> '%@'", v42, v43, v44);
  v45 = v212;

  v211 = v45;
  NSAppendPrintF(&v211, "\n");
  v46 = v211;

  v47 = self;
  if (self->_autoUnlockActive)
  {
    v210 = v46;
    NSAppendPrintF(&v210, "AutoUnlocking:         YES\n");
    v48 = v210;

    v46 = v48;
    v47 = self;
  }
  if (v47->_boostNearbyInfo)
  {
    v209 = v46;
    NSAppendPrintF(&v209, "Boost Nearby Info:     YES\n");
    v49 = v209;

    v46 = v49;
    v47 = self;
  }
  if (-[NSMutableDictionary count](v47->_bleConnections, "count"))
  {
    v208 = v46;
    NSAppendPrintF(&v208, "BLE Connections:       %ld\n", -[NSMutableDictionary count](self->_bleConnections, "count"));
    v50 = v208;

    v46 = v50;
  }
  if (-[NSMutableSet count](self->_bleDiagnosticModeClients, "count"))
  {
    v207 = v46;
    NSAppendPrintF(&v207, "BLE Diag Clients:      %ld\n", -[NSMutableSet count](self->_bleDiagnosticModeClients, "count"));
    v51 = v207;

    v46 = v51;
  }
  v52 = self;
  bleNearbyActionAdvertiser = self->_bleNearbyActionAdvertiser;
  if (bleNearbyActionAdvertiser)
  {
    v206 = v46;
    v54 = "on";
    if (!self->_bleNearbyActionAdvertiseLingerTimer)
      v54 = "off";
    NSAppendPrintF(&v206, "BLE Action Advertiser: %@, linger %s\n", bleNearbyActionAdvertiser, v54);
    v55 = v206;

    v46 = v55;
    v52 = self;
  }
  bleNearbyActionScanner = v52->_bleNearbyActionScanner;
  if (bleNearbyActionScanner)
  {
    v205 = v46;
    NSAppendPrintF(&v205, "BLE Action Scanner:    %@\n", bleNearbyActionScanner);
    v57 = v205;

    v46 = v57;
    v52 = self;
  }
  bleNearbyInfoAdvertiser = v52->_bleNearbyInfoAdvertiser;
  if (bleNearbyInfoAdvertiser)
  {
    v204 = v46;
    NSAppendPrintF(&v204, "BLE Info Advertiser:   %@, advertiseReason: %@\n", bleNearbyInfoAdvertiser, v52->_bleNearbyInfoAdvertiseReason);
    v59 = v204;

    v46 = v59;
    v52 = self;
  }
  bleNearbyInfoScanner = v52->_bleNearbyInfoScanner;
  if (bleNearbyInfoScanner)
  {
    v203 = v46;
    NSAppendPrintF(&v203, "BLE Info Scanner:      %@\n", bleNearbyInfoScanner);
    v61 = v203;

    v46 = v61;
    v52 = self;
  }
  bleProximityPairingScanner = v52->_bleProximityPairingScanner;
  if (bleProximityPairingScanner)
  {
    v202 = v46;
    NSAppendPrintF(&v202, "BLE Prox Scanner:      %@\n", bleProximityPairingScanner);
    v63 = v202;

    v46 = v63;
    v52 = self;
  }
  if (v52->_enhancedDiscovery)
  {
    v201 = v46;
    NSAppendPrintF(&v201, "BLE enhanced discovery: assertions: %s\n", "yes");
    v64 = v201;

    v46 = v64;
    v52 = self;
  }
  v200 = v46;
  v65 = -[SDNearbyAgent _allowEnhancedDiscovery](v52, "_allowEnhancedDiscovery");
  v66 = "no";
  if (self->_enhancedDiscoveryShouldRun)
    v66 = "yes";
  NSAppendPrintF(&v200, "BLE enhanced discovery:        allowed: %d should run:%s\n", v65, v66);
  v67 = v200;

  v199 = v67;
  v68 = "Usable";
  if (self->_cameraState != 1)
    v68 = "?";
  if (self->_cameraState)
    v69 = v68;
  else
    v69 = "Nearby";
  if (self->_isDeviceMounted)
    v70 = "yes";
  else
    v70 = "no";
  if (self->_isDeviceNotInPocket)
    v71 = "yes";
  else
    v71 = "no";
  NSAppendPrintF(&v199, "Camera State: %s MT: %s PK: %s\n", v69, v70, v71);
  v72 = v199;

  v73 = self;
  unlockBtPipe = self->_unlockBtPipe;
  if (unlockBtPipe)
  {
    v198 = v72;
    NSAppendPrintF(&v198, "BT Pipe:               %@\n", unlockBtPipe);
    v75 = v198;

    v72 = v75;
    v73 = self;
  }
  v197 = v72;
  NSAppendPrintF(&v197, "Device Discovery:      %ld request(s)", -[NSMutableSet count](v73->_ddRequests, "count"));
  v76 = v197;

  v77 = self;
  if (self->_coreDeviceEnabled)
  {
    v196 = v76;
    NSAppendPrintF(&v196, ", CoreDevice");
    v78 = v196;

    v76 = v78;
    v77 = self;
  }
  if (v77->_ddNearbyActionEnabled)
  {
    v195 = v76;
    NSAppendPrintF(&v195, ", Action");
    v79 = v195;

    v76 = v79;
    v77 = self;
  }
  if (v77->_ddNearbyActionScreenOff)
  {
    v194 = v76;
    NSAppendPrintF(&v194, ", NAScreenOff");
    v80 = v194;

    v76 = v80;
    v77 = self;
  }
  if (v77->_ddNearbyInfoEnabled)
  {
    v193 = v76;
    NSAppendPrintF(&v193, ", Info");
    v81 = v193;

    v76 = v81;
    v77 = self;
  }
  if (v77->_ddNearbyInfoScreenOff)
  {
    v192 = v76;
    NSAppendPrintF(&v192, ", NIScreenOff");
    v82 = v192;

    v76 = v82;
    v77 = self;
  }
  if (v77->_ddProximityPairingEnabled)
  {
    v191 = v76;
    NSAppendPrintF(&v191, ", Prox");
    v83 = v191;

    v76 = v83;
    v77 = self;
  }
  if (v77->_ddProximityPairingScreenOff)
  {
    v190 = v76;
    NSAppendPrintF(&v190, ", PPScreenOff");
    v84 = v190;

    v76 = v84;
    v77 = self;
  }
  if (v77->_fitnessPairingEnabled)
  {
    v189 = v76;
    NSAppendPrintF(&v189, ", FitPair");
    v85 = v189;

    v76 = v85;
    v77 = self;
  }
  if (v77->_sessionPairingEnabled)
  {
    v188 = v76;
    NSAppendPrintF(&v188, ", SessionPair");
    v86 = v188;

    v76 = v86;
    v77 = self;
  }
  v187 = v76;
  NSAppendPrintF(&v187, ", %ld Action", -[NSMutableDictionary count](v77->_ddNearbyActionDevices, "count"));
  v87 = v187;

  v186 = v87;
  NSAppendPrintF(&v186, ", %ld Info", -[NSMutableDictionary count](self->_ddNearbyInfoDevices, "count"));
  v88 = v186;

  v185 = v88;
  NSAppendPrintF(&v185, ", %ld Prox", -[NSMutableDictionary count](self->_ddProximityPairingDevices, "count"));
  v89 = v185;

  v218 = 0;
  v219 = (uint64_t)&v218;
  v220 = 0x2020000000;
  LODWORD(v221) = 0;
  idDevices = self->_idDevices;
  v184[0] = _NSConcreteStackBlock;
  v184[1] = 3221225472;
  v184[2] = sub_1001ED360;
  v184[3] = &unk_10071B198;
  v184[4] = &v218;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](idDevices, "enumerateKeysAndObjectsUsingBlock:", v184);
  v183 = v89;
  NSAppendPrintF(&v183, ", %u of %ld Identified", *(_DWORD *)(v219 + 24), -[NSMutableDictionary count](self->_idDevices, "count"));
  v91 = v183;

  v182 = v91;
  NSAppendPrintF(&v182, "\n");
  v92 = v182;

  v93 = objc_alloc((Class)IDSService);
  v147 = objc_msgSend(v93, "initWithService:", IDSServiceNameiMessage);
  v181 = v92;
  v94 = "on";
  if (!self->_idsService)
    v94 = "off";
  v145 = v94;
  if (-[SDNearbyAgent idsIsSignedIn](self, "idsIsSignedIn"))
    v95 = "signed in";
  else
    v95 = "not signed in";
  v96 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent idsDeviceArray](self, "idsDeviceArray"));
  v97 = objc_msgSend(v96, "count");
  v98 = -[SDNearbyAgent _idsAppleTVCount](self, "_idsAppleTVCount");
  v99 = -[SDNearbyAgent _idsContinuityDeviceCount](self, "_idsContinuityDeviceCount");
  v100 = -[SDNearbyAgent _idsHomePodCount](self, "_idsHomePodCount");
  if (v147)
    v101 = "on";
  else
    v101 = "off";
  v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v147, "devices"));
  NSAppendPrintF(&v181, "IDS Service:           %s, %s, %ld device(s), %d AppleTV, %d Continuity, %d HomePod, iMessage %s, %ld device(s) ALEncrypted %d\n", v145, v95, v97, v98, v99, v100, v101, objc_msgSend(v102, "count"), -[SDNearbyAgent _idsShouldEncryptActivityLevel](self, "_idsShouldEncryptActivityLevel"));
  v103 = v181;

  v180 = v103;
  NSAppendPrintF(&v180, "Services:              %ld, %ld sessions, %ld setup sessions\n", -[NSMutableDictionary count](self->_services, "count"), -[NSMutableDictionary count](self->_sessions, "count"), -[NSMutableDictionary count](self->_setupSessions, "count"));
  v104 = v180;

  systemService = self->_systemService;
  if (systemService)
  {
    v179 = v104;
    NSAppendPrintF(&v179, "SystemService:         %@\n", systemService);
    v106 = v179;

    v104 = v106;
  }
  v178 = v104;
  NSAppendPrintF(&v178, "\n");
  v107 = v178;

  v176 = 0u;
  v177 = 0u;
  v174 = 0u;
  v175 = 0u;
  v108 = (void *)CFPrefs_CopyKeys(CFSTR("com.apple.Sharing"), 0);
  v109 = objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v174, v230, 16);
  if (!v109)
    goto LABEL_114;
  v110 = 0;
  v111 = *(_QWORD *)v175;
  do
  {
    for (i = 0; i != v109; i = (char *)i + 1)
    {
      if (*(_QWORD *)v175 != v111)
        objc_enumerationMutation(v108);
      v113 = *(_QWORD *)(*((_QWORD *)&v174 + 1) + 8 * (_QWORD)i);
      v114 = objc_opt_class(NSString);
      if ((objc_opt_isKindOfClass(v113, v114) & 1) != 0)
      {
        v115 = (void *)CFPrefs_CopyTypedValue(CFSTR("com.apple.Sharing"), v113, 0, 0);
        v173 = v107;
        NSAppendPrintF(&v173, "Pref: '%@' = '%@'\n", v113, v115);
        v116 = v173;

        ++v110;
        v107 = v116;
      }
    }
    v109 = objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v174, v230, 16);
  }
  while (v109);

  if (v110 >= 1)
  {
    v172 = v107;
    NSAppendPrintF(&v172, "\n");
    v108 = v107;
    v107 = v172;
LABEL_114:

  }
  if (-[NSMutableDictionary count](self->_bleConnections, "count"))
  {
    v171 = v107;
    NSAppendPrintF(&v171, "-- BLE Connections --\n");
    v117 = v171;

    v169 = 0u;
    v170 = 0u;
    v167 = 0u;
    v168 = 0u;
    v118 = self->_bleConnections;
    v119 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v118, "countByEnumeratingWithState:objects:count:", &v167, v229, 16);
    if (v119)
    {
      v120 = *(_QWORD *)v168;
      do
      {
        v121 = 0;
        v122 = v117;
        do
        {
          if (*(_QWORD *)v168 != v120)
            objc_enumerationMutation(v118);
          v123 = *(_QWORD *)(*((_QWORD *)&v167 + 1) + 8 * (_QWORD)v121);
          v166 = v122;
          v124 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_bleConnections, "objectForKeyedSubscript:", v123));
          NSAppendPrintF(&v166, "%@\n", v124);
          v117 = v166;

          v121 = (char *)v121 + 1;
          v122 = v117;
        }
        while (v119 != v121);
        v119 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v118, "countByEnumeratingWithState:objects:count:", &v167, v229, 16);
      }
      while (v119);
    }

    v165 = v117;
    NSAppendPrintF(&v165, "\n");
    v107 = v165;

  }
  if (-[NSMutableDictionary count](self->_setupSessions, "count"))
  {
    v164 = v107;
    NSAppendPrintF(&v164, "-- Setup Sessions --\n");
    v125 = v164;

    v162 = 0u;
    v163 = 0u;
    v160 = 0u;
    v161 = 0u;
    v126 = self->_setupSessions;
    v127 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v126, "countByEnumeratingWithState:objects:count:", &v160, v228, 16);
    if (v127)
    {
      v128 = *(_QWORD *)v161;
      do
      {
        v129 = 0;
        v130 = v125;
        do
        {
          if (*(_QWORD *)v161 != v128)
            objc_enumerationMutation(v126);
          v131 = *(_QWORD *)(*((_QWORD *)&v160 + 1) + 8 * (_QWORD)v129);
          v159 = v130;
          v132 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_setupSessions, "objectForKeyedSubscript:", v131));
          NSAppendPrintF(&v159, "%@ -- %@\n", v131, v132);
          v125 = v159;

          v129 = (char *)v129 + 1;
          v130 = v125;
        }
        while (v127 != v129);
        v127 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v126, "countByEnumeratingWithState:objects:count:", &v160, v228, 16);
      }
      while (v127);
    }

    v158 = v125;
    NSAppendPrintF(&v158, "\n");
    v107 = v158;

  }
  if (-[NSMutableDictionary count](self->_sessions, "count"))
  {
    v157 = v107;
    NSAppendPrintF(&v157, "-- Sessions --\n");
    v133 = v157;

    v155 = 0u;
    v156 = 0u;
    v153 = 0u;
    v154 = 0u;
    v134 = self->_sessions;
    v135 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v134, "countByEnumeratingWithState:objects:count:", &v153, v227, 16);
    if (v135)
    {
      v136 = *(_QWORD *)v154;
      do
      {
        v137 = 0;
        v138 = v133;
        do
        {
          if (*(_QWORD *)v154 != v136)
            objc_enumerationMutation(v134);
          v139 = *(_QWORD *)(*((_QWORD *)&v153 + 1) + 8 * (_QWORD)v137);
          v152 = v138;
          v140 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_sessions, "objectForKeyedSubscript:", v139));
          NSAppendPrintF(&v152, "%@ -- %@\n", v139, v140);
          v133 = v152;

          v137 = (char *)v137 + 1;
          v138 = v133;
        }
        while (v135 != v137);
        v135 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v134, "countByEnumeratingWithState:objects:count:", &v153, v227, 16);
      }
      while (v135);
    }

    v151 = v133;
    NSAppendPrintF(&v151, "\n");
    v107 = v151;

  }
  v150 = v107;
  NSAppendPrintF(&v150, "-- Devices --\n");
  v141 = v150;

  v149 = v141;
  -[SDNearbyAgent idsDevicesAppendDescription:](self, "idsDevicesAppendDescription:", &v149);
  v142 = v149;

  v143 = v142;
  _Block_object_dispose(&v218, 8);

  return (NSString *)v143;
}

- (void)prefillDefaultsForGenuineCheckIfNecessary
{
  id v2;
  unsigned int v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  const __CFString *v22;
  id v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  id v29;
  _BYTE v30[128];

  v2 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.Sharing"));
  if (dword_1007B3A28 <= 30 && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
  {
    v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("hasDoneGenuineDeviceCheck"));
    v4 = CFSTR("NO");
    if (v3)
      v4 = CFSTR("YES");
    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent prefillDefaultsForGenuineCheckIfNecessary]", 30, "GenuineCheckOnLaunch: hasDoneGenuineDeviceCheck %@", v4);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("hasDoneGenuineDeviceCheck")));

  if (!v5)
  {
    v29 = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CBDiscovery devicesWithDiscoveryFlags:error:](CBDiscovery, "devicesWithDiscoveryFlags:error:", 0x800000, &v29));
    v7 = v29;
    v8 = v7;
    if (!v7 || v6)
    {
      v23 = v7;
      v24 = v6;
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v9 = v6;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(_QWORD *)v26 != v12)
              objc_enumerationMutation(v9);
            v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
            if ((objc_msgSend(v14, "deviceFlags") & 1) != 0)
            {
              if (dword_1007B3A28 <= 30
                && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
              {
                LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent prefillDefaultsForGenuineCheckIfNecessary]", 30, "GenuineCheckOnLaunch: device info %@\n", v14);
              }
              v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "btAddressData"));
              v16 = (void *)v15;
              if (v15)
              {
                v17 = CUPrintNSDataAddress(v15);
                v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
                v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "uppercaseString"));

                v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", v19));
                if (!v20)
                {
                  if (dword_1007B3A28 <= 30
                    && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
                  {
                    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent prefillDefaultsForGenuineCheckIfNecessary]", 30, "GenuineCheckOnLaunch: setting device unknown %@\n", v19);
                  }
                  objc_msgSend(v2, "setObject:forKey:", &off_10074E7B0, v19);
                }

              }
            }
            else if (dword_1007B3A28 <= 30
                   && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
            {
              LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent prefillDefaultsForGenuineCheckIfNecessary]", 30, "GenuineCheckOnLaunch: device does not support AACP %@\n", v14);
            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
        }
        while (v11);
      }

      objc_msgSend(v2, "setBool:forKey:", 1, CFSTR("hasDoneGenuineDeviceCheck"));
      objc_msgSend(v2, "synchronize");
      v8 = v23;
      v6 = v24;
      if (dword_1007B3A28 <= 30
        && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
      {
        v21 = objc_msgSend(v2, "BOOLForKey:", CFSTR("hasDoneGenuineDeviceCheck"));
        v22 = CFSTR("NO");
        if (v21)
          v22 = CFSTR("YES");
        LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent prefillDefaultsForGenuineCheckIfNecessary]", 30, "GenuineCheckOnLaunch: finished genuine check %@", v22);
      }
    }
    else if (dword_1007B3A28 <= 90
           && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 90)))
    {
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent prefillDefaultsForGenuineCheckIfNecessary]", 90, "### GenuineCheckOnLaunch CBDiscovery failed %@\n", v8);
    }

  }
}

- (void)setAudioRoutingScore:(int)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  int v5;

  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001ED82C;
  v4[3] = &unk_10071B1C0;
  v5 = a3;
  v4[4] = self;
  dispatch_async(dispatchQueue, v4);
}

- (void)setAutoUnlockActive:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  BOOL v5;

  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001ED988;
  v4[3] = &unk_100715BB0;
  v5 = a3;
  v4[4] = self;
  dispatch_async(dispatchQueue, v4);
}

- (void)setBoostNearbyInfo:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  BOOL v5;

  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001EDAC0;
  v4[3] = &unk_100715BB0;
  v5 = a3;
  v4[4] = self;
  dispatch_async(dispatchQueue, v4);
}

- (void)setEnhancedDiscovery:(BOOL)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  BOOL v5;

  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001EDBF8;
  v4[3] = &unk_100715BB0;
  v5 = a3;
  v4[4] = self;
  dispatch_async(dispatchQueue, v4);
}

- (void)setHotspotInfo:(unsigned int)a3
{
  NSObject *dispatchQueue;
  _QWORD v4[5];
  unsigned int v5;

  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001EDDCC;
  v4[3] = &unk_10071B1C0;
  v5 = a3;
  v4[4] = self;
  dispatch_async(dispatchQueue, v4);
}

- (void)activate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001EDEF0;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activate
{
  void *v3;
  WPNearby *v4;
  WPNearby *bleWPNearby;
  CUBluetoothClient *v6;
  CUBluetoothClient *btConnectedDeviceMonitor;
  NSObject *dispatchQueue;
  int familyNotifyToken;
  void *v10;
  SDStatusMonitor *v11;
  SDStatusMonitor *statusMonitor;
  CUSystemMonitor *v13;
  CUSystemMonitor *systemMonitor;
  CUSystemMonitor *v15;
  id v16;
  uint64_t v17;
  CUTWiFiManager *v18;
  CUTWiFiManager *wifiManager;
  int DeviceClass;
  SFSystemService *v21;
  SFSystemService *systemService;
  _TtC16DaemoniOSLibrary32HeadphoneDigitalEngravingManager *v23;
  _TtC16DaemoniOSLibrary32HeadphoneDigitalEngravingManager *digitalEngravingManager;
  _QWORD v25[5];
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD v28[5];
  _QWORD v29[5];
  _QWORD v30[5];
  _QWORD v31[5];
  _QWORD v32[5];
  _QWORD v33[5];
  _QWORD v34[5];
  _QWORD v35[5];
  _QWORD handler[5];
  _QWORD v37[5];
  uint64_t state64;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1007B3A28 <= 30 && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _activate]", 30, "Activate\n");
  self->_activated = 1;
  self->_startTime = CFAbsoluteTimeGetCurrent();
  if (!self->_bleWPNearby)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[SFBLEClient sharedClient](SFBLEClient, "sharedClient"));
    v4 = (WPNearby *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "addNearbyDelegate:", self));
    bleWPNearby = self->_bleWPNearby;
    self->_bleWPNearby = v4;

  }
  if (!self->_btConnectedDeviceMonitor)
  {
    v6 = (CUBluetoothClient *)objc_alloc_init((Class)CUBluetoothClient);
    btConnectedDeviceMonitor = self->_btConnectedDeviceMonitor;
    self->_btConnectedDeviceMonitor = v6;

    -[CUBluetoothClient setDispatchQueue:](self->_btConnectedDeviceMonitor, "setDispatchQueue:", self->_dispatchQueue);
    -[CUBluetoothClient setFlags:](self->_btConnectedDeviceMonitor, "setFlags:", 24);
    -[CUBluetoothClient setLabel:](self->_btConnectedDeviceMonitor, "setLabel:", CFSTR("Sharing-CA"));
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_1001EE5A8;
    v37[3] = &unk_10071B1E8;
    v37[4] = self;
    -[CUBluetoothClient setDeviceConnectedHandler:](self->_btConnectedDeviceMonitor, "setDeviceConnectedHandler:", v37);
    -[CUBluetoothClient activate](self->_btConnectedDeviceMonitor, "activate");
  }
  if (self->_familyNotifyToken == -1)
  {
    dispatchQueue = self->_dispatchQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1001EE5B4;
    handler[3] = &unk_100714EC8;
    handler[4] = self;
    notify_register_dispatch("com.apple.rapport.familyFlagsChanged", &self->_familyNotifyToken, dispatchQueue, handler);
    familyNotifyToken = self->_familyNotifyToken;
    state64 = 0;
    notify_get_state(familyNotifyToken, &state64);
    self->_familyFlags = state64;
  }
  if (!self->_statusMonitor)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v10, "addObserver:selector:name:object:", self, "_handleAirDropDiscoverableModeChanged:", CFSTR("com.apple.sharingd.DiscoverableModeChanged"), 0);
    objc_msgSend(v10, "addObserver:selector:name:object:", self, "_handleAppleIDChanged:", CFSTR("com.apple.sharingd.AppleIDAccountInfoChanged"), 0);
    objc_msgSend(v10, "addObserver:selector:name:object:", self, "_handleAppleIDChanged:", CFSTR("com.apple.sharingd.AppleIDChanged"), 0);
    objc_msgSend(v10, "addObserver:selector:name:object:", self, "_activityMonitorMediaAccessControlSettingChanged:", CFSTR("com.apple.sharingd.MediaAccessControlSettingChanged"), 0);
    objc_msgSend(v10, "addObserver:selector:name:object:", self, "_activityMonitorWatchWristStateChanged:", CFSTR("com.apple.sharingd.PairedWatchWristStateChanged"), 0);
    objc_msgSend(v10, "addObserver:selector:name:object:", self, "_activityMonitorScreenStateChanged:", CFSTR("com.apple.sharingd.ScreenStateChanged"), 0);
    objc_msgSend(v10, "addObserver:selector:name:object:", self, "_activityMonitorUILockStatusChanged:", CFSTR("com.apple.sharingd.UILockStatusChanged"), 0);
    objc_msgSend(v10, "addObserver:selector:name:object:", self, "_unlockApproveBluetoothIDsChanged:", CFSTR("ApproveBluetoothIDsChanged"), 0);
    objc_msgSend(v10, "addObserver:selector:name:object:", self, "_systemWillSleep", CFSTR("com.apple.sharingd.SystemWillSleep"), 0);
    objc_msgSend(v10, "addObserver:selector:name:object:", self, "_systemHasPoweredOn", CFSTR("com.apple.sharingd.SystemHasPoweredOn"), 0);
    objc_msgSend(v10, "addObserver:selector:name:object:", self, "_btPipeStateChanged:", SFNotificationNamePipeConnectionStateChanged, 0);
    objc_msgSend(v10, "addObserver:selector:name:object:", self, "_smartCoverStatusChanged:", CFSTR("com.apple.sharingd.SmartCoverClosedChanged"), 0);
    objc_msgSend(v10, "addObserver:selector:name:object:", self, "_wirelessCriticalChanged:", CFSTR("com.apple.sharingd.WirelessCriticalChanged"), 0);
    objc_msgSend(v10, "addObserver:selector:name:object:", self, "_mirroringStateChanged:", CFSTR("com.apple.sharingd.MirroringStateChanged"), 0);
    v11 = (SDStatusMonitor *)objc_claimAutoreleasedReturnValue(+[SDStatusMonitor sharedMonitor](SDStatusMonitor, "sharedMonitor"));
    statusMonitor = self->_statusMonitor;
    self->_statusMonitor = v11;

    self->_activityScreenOn = -[SDStatusMonitor screenOn](self->_statusMonitor, "screenOn");
    self->_activityUIUnlocked = -[SDStatusMonitor deviceUIUnlocked](self->_statusMonitor, "deviceUIUnlocked");

  }
  if (!self->_systemMonitor)
  {
    v13 = (CUSystemMonitor *)objc_alloc_init((Class)CUSystemMonitor);
    systemMonitor = self->_systemMonitor;
    self->_systemMonitor = v13;

    -[CUSystemMonitor setDispatchQueue:](self->_systemMonitor, "setDispatchQueue:", self->_dispatchQueue);
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_1001EE65C;
    v35[3] = &unk_1007146D8;
    v35[4] = self;
    -[CUSystemMonitor setBluetoothAddressChangedHandler:](self->_systemMonitor, "setBluetoothAddressChangedHandler:", v35);
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_1001EE6CC;
    v34[3] = &unk_1007146D8;
    v34[4] = self;
    -[CUSystemMonitor setCallChangedHandler:](self->_systemMonitor, "setCallChangedHandler:", v34);
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_1001EE73C;
    v33[3] = &unk_1007146D8;
    v33[4] = self;
    -[CUSystemMonitor setFirstUnlockHandler:](self->_systemMonitor, "setFirstUnlockHandler:", v33);
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1001EE7AC;
    v32[3] = &unk_1007146D8;
    v32[4] = self;
    -[CUSystemMonitor setManateeChangedHandler:](self->_systemMonitor, "setManateeChangedHandler:", v32);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_1001EE824;
    v31[3] = &unk_1007146D8;
    v31[4] = self;
    -[CUSystemMonitor setMeDeviceChangedHandler:](self->_systemMonitor, "setMeDeviceChangedHandler:", v31);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_1001EE894;
    v30[3] = &unk_1007146D8;
    v30[4] = self;
    -[CUSystemMonitor setPrimaryAppleIDChangedHandler:](self->_systemMonitor, "setPrimaryAppleIDChangedHandler:", v30);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1001EE910;
    v29[3] = &unk_1007146D8;
    v29[4] = self;
    -[CUSystemMonitor setScreenOnChangedHandler:](self->_systemMonitor, "setScreenOnChangedHandler:", v29);
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1001EE99C;
    v28[3] = &unk_1007146D8;
    v28[4] = self;
    -[CUSystemMonitor setScreenSaverChangedHandler:](self->_systemMonitor, "setScreenSaverChangedHandler:", v28);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1001EEA0C;
    v27[3] = &unk_1007146D8;
    v27[4] = self;
    -[CUSystemMonitor setSystemLockStateChangedHandler:](self->_systemMonitor, "setSystemLockStateChangedHandler:", v27);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1001EEA14;
    v26[3] = &unk_1007146D8;
    v26[4] = self;
    -[CUSystemMonitor setWifiStateChangedHandler:](self->_systemMonitor, "setWifiStateChangedHandler:", v26);
    v15 = self->_systemMonitor;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1001EEA84;
    v25[3] = &unk_1007146D8;
    v25[4] = self;
    -[CUSystemMonitor activateWithCompletion:](v15, "activateWithCompletion:", v25);
  }
  -[SDNearbyAgent _idsEnsureStarted](self, "_idsEnsureStarted");
  v16 = -[SDNearbyAgent prefsChanged](self, "prefsChanged");
  if (!self->_wifiManager)
  {
    v18 = (CUTWiFiManager *)objc_claimAutoreleasedReturnValue(+[CUTWiFiManager sharedInstance](CUTWiFiManager, "sharedInstance"));
    wifiManager = self->_wifiManager;
    self->_wifiManager = v18;

    v16 = -[CUTWiFiManager addDelegate:](self->_wifiManager, "addDelegate:", self);
  }
  DeviceClass = GestaltGetDeviceClass(v16, v17);
  if ((DeviceClass == 7 || DeviceClass == 4) && !self->_systemService)
  {
    v21 = (SFSystemService *)objc_alloc_init((Class)SFSystemService);
    systemService = self->_systemService;
    self->_systemService = v21;

    -[SFSystemService setDispatchQueue:](self->_systemService, "setDispatchQueue:", self->_dispatchQueue);
    -[SFSystemService activate](self->_systemService, "activate");
  }
  -[SDNearbyAgent _registerForMagicMountUpdates](self, "_registerForMagicMountUpdates");
  v23 = objc_alloc_init(_TtC16DaemoniOSLibrary32HeadphoneDigitalEngravingManager);
  digitalEngravingManager = self->_digitalEngravingManager;
  self->_digitalEngravingManager = v23;

  -[HeadphoneDigitalEngravingManager setFetchEngravingDataHandler:](self->_digitalEngravingManager, "setFetchEngravingDataHandler:", &stru_10071B228);
  -[SDNearbyAgent _registerForWombatActivityNotification](self, "_registerForWombatActivityNotification");
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001EECAC;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  CUSystemMonitor *systemMonitor;
  void *v4;
  SDStatusMonitor *statusMonitor;
  CUBluetoothClient *btConnectedDeviceMonitor;
  CMMagicMountManager *cameraMagicMountManager;
  CMMagicMountManager *v8;
  BrightnessSystemClient *brightnessSystemClient;
  OS_dispatch_source *cameraConfigChangeTimer;
  NSObject *v11;
  OS_dispatch_source *v12;
  SDNearbyAgent *v13;
  int familyNotifyToken;
  NSMutableDictionary *v15;
  id v16;
  uint64_t v17;
  void *i;
  NSMutableDictionary *bleConnections;
  NSMutableSet *bleDiagnosticModeClients;
  void *v21;
  WPNearby *bleWPNearby;
  NSMutableSet *caRequests;
  NSMutableSet *caRequestsNoScans;
  NSMutableSet *ddRequests;
  OS_dispatch_source *ddFastScanTimer;
  NSObject *v27;
  OS_dispatch_source *v28;
  NSMutableDictionary *ddNearbyActionDevices;
  NSMutableDictionary *ddNearbyInfoDevices;
  NSMutableDictionary *ddProximityPairingDevices;
  NSMutableSet *deliveredDonnedIdentifiers;
  NSMutableDictionary *donnedDevices;
  NSMutableDictionary *donStateRetryTimerDictionary;
  NSMutableDictionary *services;
  NSMutableDictionary *sessions;
  NSMutableDictionary *setupSessions;
  SFSystemService *systemService;
  OS_dispatch_source *unlockTestClientTimer;
  NSObject *v40;
  OS_dispatch_source *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1007B3A28 <= 30 && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _invalidate]", 30, "Invalidate\n");
  -[CUSystemMonitor invalidate](self->_systemMonitor, "invalidate");
  systemMonitor = self->_systemMonitor;
  self->_systemMonitor = 0;

  if (self->_statusMonitor)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("com.apple.sharingd.AppleIDAccountInfoChanged"), 0);
    objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("com.apple.sharingd.AppleIDChanged"), 0);
    objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("com.apple.sharingd.MediaAccessControlSettingChanged"), 0);
    objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("com.apple.sharingd.PairedWatchWristStateChanged"), 0);
    objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("com.apple.sharingd.ScreenStateChanged"), 0);
    objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("com.apple.sharingd.UILockStatusChanged"), 0);
    objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("ApproveBluetoothIDsChanged"), 0);
    objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("com.apple.sharingd.SystemWillSleep"), 0);
    objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("com.apple.sharingd.SystemHasPoweredOn"), 0);
    objc_msgSend(v4, "removeObserver:name:object:", self, SFNotificationNamePipeConnectionStateChanged, 0);
    objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("com.apple.sharingd.SmartCoverClosedChanged"), 0);
    objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("com.apple.sharingd.WirelessCriticalChanged"), 0);
    statusMonitor = self->_statusMonitor;
    self->_statusMonitor = 0;

  }
  -[CUBluetoothClient invalidate](self->_btConnectedDeviceMonitor, "invalidate");
  btConnectedDeviceMonitor = self->_btConnectedDeviceMonitor;
  self->_btConnectedDeviceMonitor = 0;

  -[SDNearbyAgent _activityMonitorEnsureStopped](self, "_activityMonitorEnsureStopped");
  -[SDNearbyAgent _identificationEnsureStopped](self, "_identificationEnsureStopped");
  -[SDNearbyAgent _bleNearbyActionAdvertiserEnsureStopped](self, "_bleNearbyActionAdvertiserEnsureStopped");
  -[SDNearbyAgent _bleNearbyActionScannerEnsureStopped](self, "_bleNearbyActionScannerEnsureStopped");
  -[SDNearbyAgent _bleNearbyInfoAdvertiserEnsureStopped](self, "_bleNearbyInfoAdvertiserEnsureStopped");
  -[SDNearbyAgent _bleNearbyInfoScannerEnsureStopped](self, "_bleNearbyInfoScannerEnsureStopped");
  -[SDNearbyAgent _bleProximityPairingScannerEnsureStopped](self, "_bleProximityPairingScannerEnsureStopped");
  cameraMagicMountManager = self->_cameraMagicMountManager;
  if (cameraMagicMountManager)
  {
    -[CMMagicMountManager stopMagicMountUpdates](cameraMagicMountManager, "stopMagicMountUpdates");
    v8 = self->_cameraMagicMountManager;
    self->_cameraMagicMountManager = 0;

  }
  brightnessSystemClient = self->_brightnessSystemClient;
  self->_brightnessSystemClient = 0;

  cameraConfigChangeTimer = self->_cameraConfigChangeTimer;
  if (cameraConfigChangeTimer)
  {
    v11 = cameraConfigChangeTimer;
    dispatch_source_cancel(v11);
    v12 = self->_cameraConfigChangeTimer;
    self->_cameraConfigChangeTimer = 0;

  }
  v13 = self;
  objc_sync_enter(v13);
  -[SDNearbyAgent _btPipeEnsureStopped](v13, "_btPipeEnsureStopped");
  objc_sync_exit(v13);

  familyNotifyToken = v13->_familyNotifyToken;
  if (familyNotifyToken != -1)
  {
    notify_cancel(familyNotifyToken);
    v13->_familyNotifyToken = -1;
  }
  -[SDNearbyAgent _idsEnsureStopped](v13, "_idsEnsureStopped");
  -[SDNearbyAgent _unregisterForWombatActivityNotification](v13, "_unregisterForWombatActivityNotification");
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v15 = v13->_bleConnections;
  v16 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v43 != v17)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)i), "invalidate", (_QWORD)v42);
      }
      v16 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    }
    while (v16);
  }

  -[NSMutableDictionary removeAllObjects](v13->_bleConnections, "removeAllObjects");
  bleConnections = v13->_bleConnections;
  v13->_bleConnections = 0;

  -[NSMutableSet removeAllObjects](v13->_bleDiagnosticModeClients, "removeAllObjects");
  bleDiagnosticModeClients = v13->_bleDiagnosticModeClients;
  v13->_bleDiagnosticModeClients = 0;

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[SFBLEClient sharedClient](SFBLEClient, "sharedClient"));
  objc_msgSend(v21, "removeNearbyDelegate:", v13);

  bleWPNearby = v13->_bleWPNearby;
  v13->_bleWPNearby = 0;

  -[NSMutableSet removeAllObjects](v13->_caRequests, "removeAllObjects");
  caRequests = v13->_caRequests;
  v13->_caRequests = 0;

  -[NSMutableSet removeAllObjects](v13->_ddRequests, "removeAllObjects");
  -[NSMutableSet removeAllObjects](v13->_caRequestsNoScans, "removeAllObjects");
  caRequestsNoScans = v13->_caRequestsNoScans;
  v13->_caRequestsNoScans = 0;

  ddRequests = v13->_ddRequests;
  v13->_ddRequests = 0;

  ddFastScanTimer = v13->_ddFastScanTimer;
  if (ddFastScanTimer)
  {
    v27 = ddFastScanTimer;
    dispatch_source_cancel(v27);
    v28 = v13->_ddFastScanTimer;
    v13->_ddFastScanTimer = 0;

  }
  -[NSMutableDictionary removeAllObjects](v13->_ddNearbyActionDevices, "removeAllObjects", (_QWORD)v42);
  ddNearbyActionDevices = v13->_ddNearbyActionDevices;
  v13->_ddNearbyActionDevices = 0;

  -[NSMutableDictionary removeAllObjects](v13->_ddNearbyInfoDevices, "removeAllObjects");
  ddNearbyInfoDevices = v13->_ddNearbyInfoDevices;
  v13->_ddNearbyInfoDevices = 0;

  -[NSMutableDictionary removeAllObjects](v13->_ddProximityPairingDevices, "removeAllObjects");
  ddProximityPairingDevices = v13->_ddProximityPairingDevices;
  v13->_ddProximityPairingDevices = 0;

  -[NSMutableSet removeAllObjects](v13->_deliveredDonnedIdentifiers, "removeAllObjects");
  deliveredDonnedIdentifiers = v13->_deliveredDonnedIdentifiers;
  v13->_deliveredDonnedIdentifiers = 0;

  -[NSMutableDictionary removeAllObjects](v13->_donnedDevices, "removeAllObjects");
  donnedDevices = v13->_donnedDevices;
  v13->_donnedDevices = 0;

  -[SDNearbyAgent _cancelDonStateRetryTimers](v13, "_cancelDonStateRetryTimers");
  -[NSMutableDictionary removeAllObjects](v13->_donStateRetryTimerDictionary, "removeAllObjects");
  donStateRetryTimerDictionary = v13->_donStateRetryTimerDictionary;
  v13->_donStateRetryTimerDictionary = 0;

  -[NSMutableDictionary removeAllObjects](v13->_services, "removeAllObjects");
  services = v13->_services;
  v13->_services = 0;

  -[NSMutableDictionary removeAllObjects](v13->_sessions, "removeAllObjects");
  sessions = v13->_sessions;
  v13->_sessions = 0;

  -[NSMutableDictionary removeAllObjects](v13->_setupSessions, "removeAllObjects");
  setupSessions = v13->_setupSessions;
  v13->_setupSessions = 0;

  -[SFSystemService invalidate](v13->_systemService, "invalidate");
  systemService = v13->_systemService;
  v13->_systemService = 0;

  unlockTestClientTimer = v13->_unlockTestClientTimer;
  if (unlockTestClientTimer)
  {
    v40 = unlockTestClientTimer;
    dispatch_source_cancel(v40);
    v41 = v13->_unlockTestClientTimer;
    v13->_unlockTestClientTimer = 0;

  }
}

- (void)_handleAirDropDiscoverableModeChanged:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001EF2B8;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_handleAppleIDChanged:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001EF398;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_handleBluetoothDeviceConnected:(id)a3
{
  NSObject *dispatchQueue;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  dispatchQueue = self->_dispatchQueue;
  v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDProximityPairingAgent sharedProximityPairingAgent](SDProximityPairingAgent, "sharedProximityPairingAgent"));
  objc_msgSend(v6, "notifyForNonGenuineDevice:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDProximityPairingAgent sharedProximityPairingAgent](SDProximityPairingAgent, "sharedProximityPairingAgent"));
  objc_msgSend(v7, "promptForAdaptiveControlsProxForDevice:", v5);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDProximityPairingAgent sharedProximityPairingAgent](SDProximityPairingAgent, "sharedProximityPairingAgent"));
  objc_msgSend(v8, "promptForWhatsNewProxForDevice:", v5);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[SDProximityPairingAgent sharedProximityPairingAgent](SDProximityPairingAgent, "sharedProximityPairingAgent"));
  objc_msgSend(v9, "promptForSiriNotificationsForDevice:", v5);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDProximityPairingAgent sharedProximityPairingAgent](SDProximityPairingAgent, "sharedProximityPairingAgent"));
  objc_msgSend(v10, "promptForSpatialAudioProfileForDevice:", v5);

  -[HeadphoneDigitalEngravingManager deviceDidConnect:](self->_digitalEngravingManager, "deviceDidConnect:", v5);
  -[SDNearbyAgent _update](self, "_update");
}

- (void)prefsChanged
{
  uint64_t Int64;
  uint64_t v4;
  uint64_t v5;
  int v6;
  int activityPollSeconds;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  int activityRecentSeconds;
  uint64_t v13;
  _BOOL4 v14;
  uint64_t v15;
  const char *v16;
  const char *v17;
  uint64_t v18;
  int v19;
  const char *v20;
  const char *v21;
  uint64_t v22;
  int v24;
  int caForce;
  uint64_t v26;
  _BOOL4 v27;
  uint64_t v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  _BOOL4 v32;
  uint64_t v33;
  const char *v34;
  const char *v35;
  uint64_t v36;
  _BOOL4 v37;
  uint64_t v38;
  const char *v39;
  const char *v40;
  uint64_t v41;
  _BOOL4 v42;
  uint64_t v43;
  const char *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  int donnedDeviceScanIntervalSeconds;
  uint64_t v50;
  BOOL v51;
  _BOOL4 v52;
  const char *v53;
  const char *v54;
  uint64_t v55;
  _BOOL4 v56;
  uint64_t v57;
  const char *v58;
  const char *v59;
  uint64_t v60;
  _BOOL4 v61;
  uint64_t v62;
  const char *v63;
  const char *v64;
  uint64_t v65;
  _BOOL4 v66;
  uint64_t v67;
  const char *v68;
  const char *v69;
  uint64_t v70;
  _BOOL4 v71;
  const char *v72;
  const char *v73;
  BOOL v74;
  _BOOL4 v75;
  const char *v76;
  const char *v77;
  id v78;
  id v79;
  NSData *bleAuthTagOverride;
  NSData *v81;
  NSData *v82;
  NSData *v83;
  unsigned __int8 v84;
  NSData *v85;
  NSData *v86;
  uint64_t v87;
  uint64_t v88;
  _BOOL4 v89;
  uint64_t v90;
  int IsVirtualMachine;
  const char *v92;
  const char *v93;
  uint64_t v94;
  _BOOL4 v95;
  uint64_t v96;
  const char *v97;
  const char *v98;
  double Double;
  double v101;
  double bleNearbyInfoAdvertiseLingerSecs;
  uint64_t v103;
  _BOOL4 v104;
  uint64_t v105;
  const char *v106;
  const char *v107;
  uint64_t v108;
  BOOL v109;
  _BOOL4 v110;
  const char *v111;
  const char *v112;
  uint64_t v113;
  BOOL v114;
  _BOOL4 v115;
  const char *v116;
  const char *v117;
  uint64_t v118;
  _BOOL4 v119;
  uint64_t v120;
  const char *v121;
  const char *v122;
  uint64_t v123;
  BOOL v124;
  _BOOL4 v125;
  const char *v126;
  const char *v127;
  CFTypeID TypeID;
  void *v129;
  NSDictionary *bleProximityInfoOverride;
  NSDictionary *v131;
  NSDictionary *v132;
  NSDictionary *v133;
  unsigned __int8 v134;
  NSDictionary *v135;
  NSDictionary *v136;
  CFTypeID v137;
  void *v138;
  uint64_t v139;
  _BOOL4 v140;
  uint64_t v141;
  const char *v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  _BOOL4 v146;
  uint64_t v147;
  const char *v149;
  const char *v150;
  uint64_t v151;
  BOOL v152;
  _BOOL4 v153;
  const char *v154;
  const char *v155;
  uint64_t v156;
  BOOL v157;
  _BOOL4 v158;
  const char *v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t homePodModelCodeOverride;
  uint64_t v164;
  BOOL v165;
  _BOOL4 v166;
  const char *v167;
  const char *v168;
  uint64_t v169;
  _BOOL4 v170;
  uint64_t v171;
  const char *v172;
  const char *v173;
  uint64_t v174;
  BOOL v175;
  _BOOL4 v176;
  const char *v177;
  const char *v178;
  uint64_t v179;
  BOOL v180;
  _BOOL4 v181;
  const char *v182;
  const char *v183;
  uint64_t v184;
  BOOL v185;
  _BOOL4 v186;
  const char *v187;
  const char *v188;
  uint64_t v189;
  BOOL v190;
  _BOOL4 v191;
  const char *v192;
  const char *v193;
  uint64_t v194;
  int v195;
  uint64_t v196;

  v195 = 0;
  v196 = 0;
  v194 = 0;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  Int64 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("activityPollSeconds"), &v195);
  v4 = 5;
  if (!v195)
    v4 = Int64;
  v5 = 1000;
  if (v4 < 1000)
    v5 = v4;
  if (v5 <= 1)
    LODWORD(v5) = 1;
  if (v4 < 0)
    v6 = -1;
  else
    v6 = v5;
  activityPollSeconds = self->_activityPollSeconds;
  if (v6 != activityPollSeconds)
  {
    if (dword_1007B3A28 <= 40)
    {
      if (dword_1007B3A28 == -1)
      {
        if (!_LogCategory_Initialize(&dword_1007B3A28, 40))
          goto LABEL_15;
        activityPollSeconds = self->_activityPollSeconds;
      }
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent prefsChanged]", 40, "Activity poll seconds: %d -> %d\n", activityPollSeconds, v6);
    }
LABEL_15:
    self->_activityPollSeconds = v6;
  }
  v8 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("activityRecentSeconds"), &v195);
  v9 = 1000;
  if (v8 < 1000)
    v9 = v8;
  v10 = v9 & ~(v9 >> 63);
  if (v195)
    v11 = 25;
  else
    v11 = v10;
  activityRecentSeconds = self->_activityRecentSeconds;
  if (v11 != activityRecentSeconds)
  {
    if (dword_1007B3A28 <= 40)
    {
      if (dword_1007B3A28 == -1)
      {
        if (!_LogCategory_Initialize(&dword_1007B3A28, 40))
          goto LABEL_26;
        activityRecentSeconds = self->_activityRecentSeconds;
      }
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent prefsChanged]", 40, "Activity recent seconds: %d -> %d\n", activityRecentSeconds, v11);
    }
LABEL_26:
    self->_activityRecentSeconds = v11;
  }
  v13 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("btPipeEnabled"), &v195);
  v14 = v13 != 0;
  if (self->_btPipeEnabled != v14)
  {
    if (dword_1007B3A28 <= 40)
    {
      v15 = v13;
      if (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 40))
      {
        v16 = "yes";
        if (v15)
          v17 = "no";
        else
          v17 = "yes";
        if (!v15)
          v16 = "no";
        LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent prefsChanged]", 40, "BT Pipe enabled: %s -> %s\n", v17, v16);
      }
    }
    self->_btPipeEnabled = v14;
  }
  v18 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("caEnabled"), &v195);
  v19 = v18 != 0;
  if (v195)
    v19 = SFIsDeviceAppleTV(v18) ^ 1;
  if (self->_caEnabled != v19)
  {
    if (dword_1007B3A28 <= 40
      && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 40)))
    {
      v20 = "yes";
      if (v19)
        v21 = "no";
      else
        v21 = "yes";
      if (!v19)
        v20 = "no";
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent prefsChanged]", 40, "Coordinated Alerts enabled: %s -> %s\n", v21, v20);
    }
    self->_caEnabled = v19;
  }
  v22 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("caForce"), &v195);
  if (v22 >= 0 && v195 == 0)
    v24 = v22 != 0;
  else
    v24 = -1;
  caForce = self->_caForce;
  if (v24 != caForce)
  {
    if (dword_1007B3A28 <= 40)
    {
      if (dword_1007B3A28 == -1)
      {
        if (!_LogCategory_Initialize(&dword_1007B3A28, 40))
          goto LABEL_62;
        caForce = self->_caForce;
      }
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent prefsChanged]", 40, "Coordinated Alerts force: %d -> %d\n", caForce, v24);
    }
LABEL_62:
    self->_caForce = v24;
  }
  v26 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("caPhoneCalls"), 0);
  v27 = v26 != 0;
  if (self->_caPhoneCalls != v27)
  {
    if (dword_1007B3A28 <= 40)
    {
      v28 = v26;
      if (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 40))
      {
        v29 = "yes";
        if (v28)
          v30 = "no";
        else
          v30 = "yes";
        if (!v28)
          v29 = "no";
        LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent prefsChanged]", 40, "Coordinated Alerts phone calls: %s -> %s\n", v30, v29);
      }
    }
    self->_caPhoneCalls = v27;
  }
  v31 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("caScanIfVeryActive"), 0);
  v32 = v31 != 0;
  if (self->_caScanIfVeryActive != v32)
  {
    if (dword_1007B3A28 <= 40)
    {
      v33 = v31;
      if (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 40))
      {
        v34 = "yes";
        if (v33)
          v35 = "no";
        else
          v35 = "yes";
        if (!v33)
          v34 = "no";
        LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent prefsChanged]", 40, "Coordinated Alerts scan if very active: %s -> %s\n", v35, v34);
      }
    }
    self->_caScanIfVeryActive = v32;
  }
  v36 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("caScanIfHasVisionOS1"), 0);
  v37 = v36 != 0;
  if (self->_caScanIfHasVisionOS1 != v37)
  {
    if (dword_1007B3A28 <= 40)
    {
      v38 = v36;
      if (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 40))
      {
        v39 = "yes";
        if (v38)
          v40 = "no";
        else
          v40 = "yes";
        if (!v38)
          v39 = "no";
        LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent prefsChanged]", 40, "Coordinated Alerts scan if has visionOS 1.X device(s): %s -> %s\n", v40, v39);
      }
    }
    self->_caScanIfHasVisionOS1 = v37;
  }
  v41 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("caSingleDevice"), 0);
  v42 = v41 != 0;
  if (self->_caSingleDevice != v42)
  {
    if (dword_1007B3A28 <= 40)
    {
      v43 = v41;
      if (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 40))
      {
        v44 = "yes";
        if (v43)
          v45 = "no";
        else
          v45 = "yes";
        if (!v43)
          v44 = "no";
        LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent prefsChanged]", 40, "Coordinated Alerts single device: %s -> %s\n", v45, v44);
      }
    }
    self->_caSingleDevice = v42;
  }
  v46 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("donDevicePeriodicScanIntervalSecs"), &v195);
  if (v46 >= 480)
    v47 = 480;
  else
    v47 = v46;
  if (v47 <= 1)
    LODWORD(v47) = 1;
  if (v195)
    v48 = 480;
  else
    v48 = v47;
  donnedDeviceScanIntervalSeconds = self->_donnedDeviceScanIntervalSeconds;
  if (v48 != donnedDeviceScanIntervalSeconds)
  {
    if (dword_1007B3A28 <= 40)
    {
      if (dword_1007B3A28 == -1)
      {
        if (!_LogCategory_Initialize(&dword_1007B3A28, 40))
          goto LABEL_120;
        donnedDeviceScanIntervalSeconds = self->_donnedDeviceScanIntervalSeconds;
      }
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent prefsChanged]", 40, "Donned device scan interval seconds: %d -> %d\n", donnedDeviceScanIntervalSeconds, v48);
    }
LABEL_120:
    self->_donnedDeviceScanIntervalSeconds = v48;
  }
  v50 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("idEnabled"), &v195);
  if (v195)
    v51 = 0;
  else
    v51 = v50 == 0;
  v52 = !v51;
  if (self->_idEnabled != v52)
  {
    if (dword_1007B3A28 <= 40
      && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 40)))
    {
      v53 = "yes";
      if (v52)
        v54 = "no";
      else
        v54 = "yes";
      if (!v52)
        v53 = "no";
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent prefsChanged]", 40, "Identification enabled: %s -> %s\n", v54, v53);
    }
    self->_idEnabled = v52;
  }
  v55 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("ignoreWristLockState"), 0);
  v56 = v55 != 0;
  if (self->_ignoreWatchWristLockState != v56)
  {
    if (dword_1007B3A28 <= 40)
    {
      v57 = v55;
      if (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 40))
      {
        v58 = "yes";
        if (v57)
          v59 = "no";
        else
          v59 = "yes";
        if (!v57)
          v58 = "no";
        LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent prefsChanged]", 40, "Ignore watch wrist lock state: %s -> %s\n", v59, v58);
      }
    }
    self->_ignoreWatchWristLockState = v56;
  }
  v60 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("nearbyActionAdvertiseDisabled"), 0);
  v61 = v60 != 0;
  if (self->_bleNearbyActionAdvertiseDisabled != v61)
  {
    if (dword_1007B3A28 <= 40)
    {
      v62 = v60;
      if (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 40))
      {
        v63 = "yes";
        if (v62)
          v64 = "no";
        else
          v64 = "yes";
        if (!v62)
          v63 = "no";
        LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent prefsChanged]", 40, "NearbyAction advertise disabled: %s -> %s\n", v64, v63);
      }
    }
    self->_bleNearbyActionAdvertiseDisabled = v61;
  }
  v65 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("nearbyActionRSSILog"), 0);
  v66 = v65 != 0;
  if (self->_bleNearbyActionRSSILog != v66)
  {
    if (dword_1007B3A28 <= 40)
    {
      v67 = v65;
      if (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 40))
      {
        v68 = "yes";
        if (v67)
          v69 = "no";
        else
          v69 = "yes";
        if (!v67)
          v68 = "no";
        LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent prefsChanged]", 40, "NearbyAction RSSI log: %s -> %s\n", v69, v68);
      }
    }
    self->_bleNearbyActionRSSILog = v66;
  }
  v70 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("nearbyActionScan"), &v195);
  v71 = v70 != 0;
  if (self->_bleNearbyActionScanAlways != v71)
  {
    if (dword_1007B3A28 <= 40
      && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 40)))
    {
      v72 = "yes";
      if (v70)
        v73 = "no";
      else
        v73 = "yes";
      if (!v70)
        v72 = "no";
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent prefsChanged]", 40, "NearbyAction scan always: %s -> %s\n", v73, v72);
    }
    self->_bleNearbyActionScanAlways = v71;
  }
  if (v195)
    v74 = 0;
  else
    v74 = v70 == 0;
  v75 = v74;
  if (self->_bleNearbyActionScanNever != v75)
  {
    if (dword_1007B3A28 <= 40
      && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 40)))
    {
      v76 = "yes";
      if (v75)
        v77 = "no";
      else
        v77 = "yes";
      if (!v75)
        v76 = "no";
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent prefsChanged]", 40, "NearbyAction scan never: %s -> %s\n", v77, v76);
    }
    self->_bleNearbyActionScanNever = v75;
  }
  CFPrefs_GetData(CFSTR("com.apple.Sharing"), CFSTR("nearbyAuthTagOverride"), &v196, 8, &v194, &v195);
  if (v195)
  {
    v78 = 0;
  }
  else
  {
    v79 = objc_alloc((Class)NSData);
    v78 = objc_msgSend(v79, "initWithBytes:length:", &v196, v194);
  }
  bleAuthTagOverride = self->_bleAuthTagOverride;
  v81 = (NSData *)v78;
  v82 = bleAuthTagOverride;
  if (v81 == v82)
  {

    v85 = v81;
LABEL_213:

    goto LABEL_214;
  }
  v83 = v82;
  if ((v81 == 0) == (v82 != 0))
  {

LABEL_208:
    if (dword_1007B3A28 <= 40
      && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 40)))
    {
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent prefsChanged]", 40, "Nearby AuthTag override: %@ -> %@\n", self->_bleAuthTagOverride, v81);
    }
    v86 = v81;
    v85 = self->_bleAuthTagOverride;
    self->_bleAuthTagOverride = v86;
    goto LABEL_213;
  }
  v84 = -[NSData isEqual:](v81, "isEqual:", v82);

  if ((v84 & 1) == 0)
    goto LABEL_208;
LABEL_214:
  v87 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("nearbyInfoAdvertiseAlways"), &v195);
  v89 = v87 != 0;
  if (v195)
  {
    v90 = v87;
    IsVirtualMachine = SFDeviceIsVirtualMachine(v87, v88);
    if (v90)
      v89 = 1;
    else
      v89 = IsVirtualMachine;
  }
  if (self->_bleNearbyInfoAdvertiseAlways != v89)
  {
    if (dword_1007B3A28 <= 40
      && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 40)))
    {
      v92 = "yes";
      if (v89)
        v93 = "no";
      else
        v93 = "yes";
      if (!v89)
        v92 = "no";
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent prefsChanged]", 40, "NearbyInfo advertise always: %s -> %s\n", v93, v92);
    }
    self->_bleNearbyInfoAdvertiseAlways = v89;
  }
  v94 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("nearbyInfoAdvertiseDisabled"), 0);
  v95 = v94 != 0;
  if (self->_bleNearbyInfoAdvertiseDisabled != v95)
  {
    if (dword_1007B3A28 <= 40)
    {
      v96 = v94;
      if (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 40))
      {
        v97 = "yes";
        if (v96)
          v98 = "no";
        else
          v98 = "yes";
        if (!v96)
          v97 = "no";
        LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent prefsChanged]", 40, "NearbyInfo advertise disabled: %s -> %s\n", v98, v97);
      }
    }
    self->_bleNearbyInfoAdvertiseDisabled = v95;
  }
  Double = CFPrefs_GetDouble(CFSTR("com.apple.Sharing"), CFSTR("nearbyInfoAdvertiseLingerSecs"), &v195);
  if (Double <= 1000.0 && v195 == 0)
    v101 = Double;
  else
    v101 = 5.0;
  bleNearbyInfoAdvertiseLingerSecs = self->_bleNearbyInfoAdvertiseLingerSecs;
  if (v101 != bleNearbyInfoAdvertiseLingerSecs)
  {
    if (dword_1007B3A28 <= 40)
    {
      if (dword_1007B3A28 == -1)
      {
        if (!_LogCategory_Initialize(&dword_1007B3A28, 40))
          goto LABEL_251;
        bleNearbyInfoAdvertiseLingerSecs = self->_bleNearbyInfoAdvertiseLingerSecs;
      }
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent prefsChanged]", 40, "NearbyInfo advertise linger seconds: %.0f -> %.0f\n", bleNearbyInfoAdvertiseLingerSecs, v101);
    }
LABEL_251:
    self->_bleNearbyInfoAdvertiseLingerSecs = v101;
  }
  v103 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("nearbyInfoRSSILog"), 0);
  v104 = v103 != 0;
  if (self->_bleNearbyInfoRSSILog != v104)
  {
    if (dword_1007B3A28 <= 40)
    {
      v105 = v103;
      if (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 40))
      {
        v106 = "yes";
        if (v105)
          v107 = "no";
        else
          v107 = "yes";
        if (!v105)
          v106 = "no";
        LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent prefsChanged]", 40, "NearbyInfo RSSI log: %s -> %s\n", v107, v106);
      }
    }
    self->_bleNearbyInfoRSSILog = v104;
  }
  v108 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("nearbyInfoWiFiP2P"), &v195);
  if (v195)
    v109 = 0;
  else
    v109 = v108 == 0;
  v110 = !v109;
  if (self->_bleNearbyInfoWiFiP2P != v110)
  {
    if (dword_1007B3A28 <= 40
      && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 40)))
    {
      v111 = "yes";
      if (v110)
        v112 = "no";
      else
        v112 = "yes";
      if (!v110)
        v111 = "no";
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent prefsChanged]", 40, "NearbyInfo WiFiP2P: %s -> %s\n", v112, v111);
    }
    self->_bleNearbyInfoWiFiP2P = v110;
  }
  v113 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("pwsContactHashes"), &v195);
  if (v195)
    v114 = 0;
  else
    v114 = v113 == 0;
  v115 = !v114;
  if (self->_contactHashesEnabled != v115)
  {
    if (dword_1007B3A28 <= 40
      && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 40)))
    {
      v116 = "yes";
      if (v115)
        v117 = "no";
      else
        v117 = "yes";
      if (!v115)
        v116 = "no";
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent prefsChanged]", 40, "ContactHashes: %s -> %s\n", v117, v116);
    }
    self->_contactHashesEnabled = v115;
  }
  v118 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("ppAdvFieldsLog"), 0);
  v119 = v118 != 0;
  if (self->_logProxAdvFields != v119)
  {
    if (dword_1007B3A28 <= 40)
    {
      v120 = v118;
      if (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 40))
      {
        v121 = "yes";
        if (v120)
          v122 = "no";
        else
          v122 = "yes";
        if (!v120)
          v121 = "no";
        LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent prefsChanged]", 40, "Log ProxPairing advertisement fields: %s -> %s\n", v122, v121);
      }
    }
    self->_logProxAdvFields = v119;
  }
  v123 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("ppEnabled"), &v195);
  if (v195)
    v124 = 0;
  else
    v124 = v123 == 0;
  v125 = !v124;
  if (self->_bleProximityEnabled != v125)
  {
    if (dword_1007B3A28 <= 40
      && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 40)))
    {
      v126 = "yes";
      if (v125)
        v127 = "no";
      else
        v127 = "yes";
      if (!v125)
        v126 = "no";
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent prefsChanged]", 40, "Proximity Enabled: %s -> %s\n", v127, v126);
    }
    self->_bleProximityEnabled = v125;
  }
  TypeID = CFDictionaryGetTypeID();
  v129 = (void *)CFPrefs_CopyTypedValue(CFSTR("com.apple.Sharing"), CFSTR("ppInfoOverride"), TypeID, 0);
  bleProximityInfoOverride = self->_bleProximityInfoOverride;
  v131 = v129;
  v132 = bleProximityInfoOverride;
  if (v131 == v132)
  {

    v135 = v131;
  }
  else
  {
    v133 = v132;
    if ((v131 == 0) != (v132 != 0))
    {
      v134 = -[NSDictionary isEqual:](v131, "isEqual:", v132);

      if ((v134 & 1) != 0)
        goto LABEL_337;
    }
    else
    {

    }
    if (dword_1007B3A28 <= 40
      && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 40)))
    {
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent prefsChanged]", 40, "Proximity Info Override: %@\n", v131);
    }
    v136 = v131;
    v135 = self->_bleProximityInfoOverride;
    self->_bleProximityInfoOverride = v136;
  }

LABEL_337:
  v137 = CFDictionaryGetTypeID();
  v138 = (void *)CFPrefs_CopyTypedValue(CFSTR("com.apple.Sharing"), CFSTR("ppRSSIEstimatorInfo"), v137, 0);

  if (v138
    || (v138 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent bleProximityRSSIEstimatorInfo](self, "bleProximityRSSIEstimatorInfo"))) != 0)
  {
    +[SFBLEDevice setRSSIEstimatorInfo:](SFBLEDevice, "setRSSIEstimatorInfo:", v138);

  }
  v139 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("ppRSSILog"), 0);
  v140 = v139 != 0;
  if (self->_bleProximityRSSILog != v140)
  {
    if (dword_1007B3A28 <= 40)
    {
      v141 = v139;
      if (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 40))
      {
        v142 = "yes";
        if (v141)
          v143 = "no";
        else
          v143 = "yes";
        if (!v141)
          v142 = "no";
        LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent prefsChanged]", 40, "Proximity RSSI log: %s -> %s\n", v143, v142);
      }
    }
    self->_bleProximityRSSILog = v140;
  }
  v144 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("shaEnabled"), &v195);
  v146 = v144 != 0;
  if (v195)
  {
    v147 = v144;
    v146 = GestaltGetDeviceClass(v144, v145) - 1 < 3 || v147 != 0;
  }
  if (self->_shareAudioEnabled != v146)
  {
    if (dword_1007B3A28 <= 40
      && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 40)))
    {
      v149 = "yes";
      if (v146)
        v150 = "no";
      else
        v150 = "yes";
      if (!v146)
        v149 = "no";
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent prefsChanged]", 40, "ShareAudio enabled: %s -> %s\n", v150, v149);
    }
    self->_shareAudioEnabled = v146;
  }
  v151 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("homePodIdentifiesAsB520"), &v195);
  if (v195)
    v152 = 1;
  else
    v152 = v151 == 0;
  v153 = !v152;
  if (self->_homePodIdentifiesAsB520 != v153)
  {
    if (dword_1007B3A28 <= 40
      && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 40)))
    {
      v154 = "yes";
      if (v153)
        v155 = "no";
      else
        v155 = "yes";
      if (!v153)
        v154 = "no";
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent prefsChanged]", 40, "HomePod identifying as B520: %s -> %s\n", v155, v154);
    }
    self->_homePodIdentifiesAsB520 = v153;
  }
  v156 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("homePodIdentifiesAsB620"), &v195);
  if (v195)
    v157 = 1;
  else
    v157 = v156 == 0;
  v158 = !v157;
  if (self->_homePodIdentifiesAsB620 != v158)
  {
    if (dword_1007B3A28 <= 40
      && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 40)))
    {
      v159 = "yes";
      if (v158)
        v160 = "no";
      else
        v160 = "yes";
      if (!v158)
        v159 = "no";
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent prefsChanged]", 40, "HomePod identifying as B620: %s -> %s\n", v160, v159);
    }
    self->_homePodIdentifiesAsB620 = v158;
  }
  v161 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("homePodModelCodeOverride"), &v195);
  if (v195)
    v162 = -1;
  else
    v162 = v161;
  homePodModelCodeOverride = self->_homePodModelCodeOverride;
  if (v162 != homePodModelCodeOverride)
  {
    if (dword_1007B3A28 <= 40)
    {
      if (dword_1007B3A28 == -1)
      {
        if (!_LogCategory_Initialize(&dword_1007B3A28, 40))
          goto LABEL_411;
        LODWORD(homePodModelCodeOverride) = self->_homePodModelCodeOverride;
      }
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent prefsChanged]", 40, "HomePod model code override: %d -> %d\n", homePodModelCodeOverride, v162);
    }
LABEL_411:
    self->_homePodModelCodeOverride = v162;
  }
  v164 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("riClientEnabled"), &v195);
  if (v195)
    v165 = 1;
  else
    v165 = v164 == 0;
  v166 = !v165;
  if (self->_isRIClientEnabled != v166)
  {
    if (dword_1007B3A28 <= 40
      && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 40)))
    {
      v167 = "yes";
      if (v166)
        v168 = "no";
      else
        v168 = "yes";
      if (!v166)
        v167 = "no";
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent prefsChanged]", 40, "RIClient is enabled: %s -> %s\n", v168, v167);
    }
    self->_isRIClientEnabled = v166;
  }
  v169 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("simulateDonStateChanges"), 0);
  v170 = v169 != 0;
  if (self->_simulateDonStateChanges != v170)
  {
    if (dword_1007B3A28 <= 40)
    {
      v171 = v169;
      if (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 40))
      {
        v172 = "yes";
        if (v171)
          v173 = "no";
        else
          v173 = "yes";
        if (!v171)
          v172 = "no";
        LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent prefsChanged]", 40, "Simulate don state changes: %s -> %s\n", v173, v172);
      }
    }
    self->_simulateDonStateChanges = v170;
  }
  v174 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("assumeScreenOff"), &v195);
  if (v195)
    v175 = 1;
  else
    v175 = v174 == 0;
  v176 = !v175;
  if (self->_prefWombatAssumeScreenOff != v176)
  {
    if (dword_1007B3A28 <= 40
      && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 40)))
    {
      v177 = "yes";
      if (v176)
        v178 = "no";
      else
        v178 = "yes";
      if (!v176)
        v177 = "no";
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent prefsChanged]", 40, "Assume screen off for Wombat: %s -> %s\n", v178, v177);
    }
    self->_prefWombatAssumeScreenOff = v176;
    -[SDNearbyAgent _updateCameraState](self, "_updateCameraState");
  }
  v179 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("assumeLocked"), &v195);
  if (v195)
    v180 = 1;
  else
    v180 = v179 == 0;
  v181 = !v180;
  if (self->_prefWombatAssumeLocked != v181)
  {
    if (dword_1007B3A28 <= 40
      && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 40)))
    {
      v182 = "yes";
      if (v181)
        v183 = "no";
      else
        v183 = "yes";
      if (!v181)
        v182 = "no";
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent prefsChanged]", 40, "Assume locked for Wombat: %s -> %s\n", v183, v182);
    }
    self->_prefWombatAssumeLocked = v181;
    -[SDNearbyAgent _updateCameraState](self, "_updateCameraState");
  }
  v184 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("assumeMounted"), &v195);
  if (v195)
    v185 = 1;
  else
    v185 = v184 == 0;
  v186 = !v185;
  if (self->_prefWombatAssumeMounted != v186)
  {
    if (dword_1007B3A28 <= 40
      && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 40)))
    {
      v187 = "yes";
      if (v186)
        v188 = "no";
      else
        v188 = "yes";
      if (!v186)
        v187 = "no";
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent prefsChanged]", 40, "Assume mounted for Wombat: %s -> %s\n", v188, v187);
    }
    self->_prefWombatAssumeMounted = v186;
    -[SDNearbyAgent _updateCameraState](self, "_updateCameraState");
  }
  v189 = CFPrefs_GetInt64(CFSTR("com.apple.Sharing"), CFSTR("assumeNotInPocket"), &v195);
  if (v195)
    v190 = 1;
  else
    v190 = v189 == 0;
  v191 = !v190;
  if (self->_prefWombatAssumeNotInPocket != v191)
  {
    if (dword_1007B3A28 <= 40
      && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 40)))
    {
      v192 = "yes";
      if (v191)
        v193 = "no";
      else
        v193 = "yes";
      if (!v191)
        v192 = "no";
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent prefsChanged]", 40, "Assume not in pocket for Wombat: %s -> %s\n", v193, v192);
    }
    self->_prefWombatAssumeNotInPocket = v191;
    -[SDNearbyAgent _updateCameraState](self, "_updateCameraState");
  }
  -[SDNearbyAgent _update](self, "_update");

}

- (void)update
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001F0E84;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (id)_useCasesToHexString:(id)a3
{
  id v3;
  id v4;
  id v5;
  char v6;
  uint64_t v7;
  void *i;
  const char *v9;
  __CFString *v10;
  __CFString *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __CFString *v17;
  _BYTE v18[128];

  v3 = a3;
  v17 = 0;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v3);
        if ((v6 & 1) != 0)
        {
          v9 = ", 0x%x";
        }
        else
        {
          v6 = 1;
          v9 = "0x%x";
        }
        NSAppendPrintF(&v17, v9, objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), "unsignedIntValue"));
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v5);
  }
  v10 = v17;
  if (!v17)
    v10 = &stru_10072FE60;
  v11 = v10;

  return v11;
}

- (void)_activityMonitorEnsureStarted
{
  void *v3;
  void *v4;
  int *p_activityLevelNotifyToken;
  int activityLevelNotifyToken;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_activityCarPlayRegistered)
  {
    self->_activityCarPlayRegistered = 1;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "addObserver:selector:name:object:", self, "_activityMonitorCarPlayStatusChanged:", CFSTR("com.apple.sharingd.CarPlayStatusChanged"), 0);

  }
  if (!self->_activityMultipleUsersRegistered)
  {
    self->_activityMultipleUsersRegistered = 1;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "addObserver:selector:name:object:", self, "_activityMonitorMultipleUsersLoggedInChanged:", CFSTR("com.apple.sharingd.MultipleUsersLoggedInChanged"), 0);

  }
  activityLevelNotifyToken = self->_activityLevelNotifyToken;
  p_activityLevelNotifyToken = &self->_activityLevelNotifyToken;
  *((_BYTE *)p_activityLevelNotifyToken + 5) = 1;
  if (activityLevelNotifyToken == -1)
    notify_register_check("com.apple.sharing.activity-level-changed", p_activityLevelNotifyToken);
}

- (void)_activityMonitorUpdate
{
  OS_dispatch_source *activityTimer;
  OS_dispatch_source *v4;
  OS_dispatch_source *v5;
  uint64_t v6;
  NSObject *v7;
  unint64_t v8;
  dispatch_time_t v9;
  NSObject *v10;
  NSObject *v11;
  OS_dispatch_source *v12;
  uint64_t v13;
  _QWORD v14[5];
  char v15;

  v15 = 0;
  -[SDNearbyAgent _activityMonitorCurrentLevelAndNeedsPoll:recentUserActivity:](self, "_activityMonitorCurrentLevelAndNeedsPoll:recentUserActivity:", &v15, 0);
  activityTimer = self->_activityTimer;
  if (v15)
  {
    if (!activityTimer && self->_activityPollSeconds >= 1)
    {
      v4 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
      v5 = self->_activityTimer;
      self->_activityTimer = v4;

      v7 = self->_activityTimer;
      if (!v7)
      {
        v13 = FatalErrorF("Create activity timer failed", v6);
        sub_1001F1204(v13);
        return;
      }
      v8 = 1000000000 * self->_activityPollSeconds;
      v9 = dispatch_time(0, v8);
      dispatch_source_set_timer(v7, v9, v8, v8 >> 2);
      v10 = self->_activityTimer;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1001F1204;
      v14[3] = &unk_1007146D8;
      v14[4] = self;
      dispatch_source_set_event_handler(v10, v14);
      dispatch_resume((dispatch_object_t)self->_activityTimer);
    }
  }
  else if (activityTimer)
  {
    v11 = activityTimer;
    dispatch_source_cancel(v11);
    v12 = self->_activityTimer;
    self->_activityTimer = 0;

  }
  if (-[SDNearbyAgent _bleNearbyInfoAdvertiserShouldAdvertise](self, "_bleNearbyInfoAdvertiserShouldAdvertise"))
  {
    -[SDNearbyAgent _bleNearbyInfoAdvertiserEnsureStarted](self, "_bleNearbyInfoAdvertiserEnsureStarted");
    -[SDNearbyAgent _bleNearbyInfoAdvertiserUpdate](self, "_bleNearbyInfoAdvertiserUpdate");
  }
  else
  {
    -[SDNearbyAgent _bleNearbyInfoAdvertiserEnsureStopped](self, "_bleNearbyInfoAdvertiserEnsureStopped");
  }
}

- (unsigned)_activityMonitorCurrentLevelAndNeedsPoll:(BOOL *)a3 recentUserActivity:(BOOL *)a4
{
  double v7;
  double v8;
  uint64_t v9;
  BOOL v10;
  unsigned __int8 v11;
  id v12;
  int64_t v13;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  unsigned int activityLevel;
  const char *v18;
  int activityLevelNotifyToken;
  _BOOL8 v21;
  uint64_t v22;

  -[SDNearbyAgent _activityMonitorLastUserEventDelta](self, "_activityMonitorLastUserEventDelta");
  v8 = v7;
  if (!self->_activityMonitorStarted
    || -[SDStatusMonitor multipleUsersLoggedIn](self->_statusMonitor, "multipleUsersLoggedIn"))
  {
    v9 = 0;
    v10 = 0;
    v11 = 1;
    goto LABEL_17;
  }
  v12 = -[CUSystemMonitor activeCallCount](self->_systemMonitor, "activeCallCount");
  if ((int)v12 >= 1
    && (!SFDeviceIsRealityDevice(v12)
     || -[SDStatusMonitor deviceKeyBagUnlockedAndScreenOn](self->_statusMonitor, "deviceKeyBagUnlockedAndScreenOn")))
  {
    v10 = 0;
    v11 = 14;
LABEL_16:
    v9 = 1;
    goto LABEL_17;
  }
  if (-[SDStatusMonitor carplayConnected](self->_statusMonitor, "carplayConnected"))
  {
    v10 = 0;
    v11 = 13;
    goto LABEL_16;
  }
  if (-[SDStatusMonitor deviceUIUnlocked](self->_statusMonitor, "deviceUIUnlocked"))
  {
    if (v8 <= (double)self->_activityRecentSeconds)
    {
      v11 = 11;
      goto LABEL_34;
    }
    v13 = -[SDStatusMonitor pairedWatchWristState](self->_statusMonitor, "pairedWatchWristState");
    if (v13 == 3)
    {
      v11 = 10;
LABEL_34:
      v9 = 1;
      v10 = 1;
      goto LABEL_17;
    }
    if (SFDeviceClassCodeGet(v13, v14) == 3
      && -[SDStatusMonitor smartCoverIsClosed](self->_statusMonitor, "smartCoverIsClosed"))
    {
      goto LABEL_42;
    }
    v21 = -[SDStatusMonitor screenOn](self->_statusMonitor, "screenOn");
    if (v21)
    {
      v9 = 0;
      v10 = 1;
      v11 = 7;
    }
    else
    {
      v9 = 0;
      v10 = 0;
      if (SFDeviceClassCodeGet(v21, v22) == 4)
        v11 = 4;
      else
        v11 = 3;
    }
  }
  else
  {
    v15 = -[SDStatusMonitor pairedWatchWristState](self->_statusMonitor, "pairedWatchWristState");
    if (v15 == 3)
    {
      v10 = 0;
      v11 = 10;
      goto LABEL_16;
    }
    if (SFDeviceClassCodeGet(v15, v16) == 3
      && -[SDStatusMonitor smartCoverIsClosed](self->_statusMonitor, "smartCoverIsClosed"))
    {
LABEL_42:
      v9 = 0;
      v10 = 0;
      v11 = 2;
      goto LABEL_17;
    }
    v9 = 0;
    v10 = 0;
    if (-[SDStatusMonitor screenOn](self->_statusMonitor, "screenOn"))
      v11 = 7;
    else
      v11 = 3;
  }
LABEL_17:
  activityLevel = self->_activityLevel;
  if (v11 == activityLevel)
    goto LABEL_28;
  if (dword_1007B3A28 <= 40)
  {
    if (dword_1007B3A28 == -1)
    {
      if (!_LogCategory_Initialize(&dword_1007B3A28, 40))
        goto LABEL_26;
      activityLevel = self->_activityLevel;
    }
    if (activityLevel > 0xE)
      v18 = "?";
    else
      v18 = off_10071BE58[(char)activityLevel];
    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _activityMonitorCurrentLevelAndNeedsPoll:recentUserActivity:]", 40, "Activity level changed %d (%s) -> %d (%s)\n", activityLevel, v18, v11, off_10071B6A0[(char)v11 - 1]);
  }
LABEL_26:
  self->_activityLevel = v11;
  -[SDNearbyAgent _activityMonitorUpdateUserActive:](self, "_activityMonitorUpdateUserActive:", v9);
  activityLevelNotifyToken = self->_activityLevelNotifyToken;
  if (activityLevelNotifyToken != -1)
  {
    notify_set_state(activityLevelNotifyToken, v11);
    notify_post("com.apple.sharing.activity-level-changed");
  }
LABEL_28:
  if (a3)
    *a3 = v10;
  if (a4)
    *a4 = v8 <= (double)self->_activityRecentSeconds;
  return v11;
}

- (void)_activityMonitorCarPlayStatusChanged:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001F151C;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (double)_activityMonitorLastUserEventDelta
{
  double v2;

  v2 = CACurrentMediaTime();
  return v2 - BKSHIDServicesLastUserEventTime();
}

- (void)_activityMonitorMultipleUsersLoggedInChanged:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001F1664;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activityMonitorScreenStateChanged:(id)a3
{
  unsigned __int8 v4;
  NSObject *dispatchQueue;
  _QWORD v6[5];
  unsigned __int8 v7;

  v4 = -[SDStatusMonitor screenOn](self->_statusMonitor, "screenOn", a3);
  dispatchQueue = self->_dispatchQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001F179C;
  v6[3] = &unk_100715BB0;
  v6[4] = self;
  v7 = v4;
  dispatch_async(dispatchQueue, v6);
}

- (void)_activityMonitorUILockStatusChanged:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001F1840;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activityMonitorUpdateUserActive:(BOOL)a3
{
  if (self->_activityUserActive != a3)
  {
    self->_activityUserActive = a3;
    if (!a3 && self->_bleNearbyInfoAdvertiseLingerSecs > 0.0)
      -[SDNearbyAgent _bleNearbyInfoAdvertiserLingerStart:](self, "_bleNearbyInfoAdvertiserLingerStart:", CFSTR("UserActive"));
  }
}

- (void)_activityMonitorMediaAccessControlSettingChanged:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001F19A4;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_activityMonitorWatchWristStateChanged:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001F1AAC;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)activityStateWithCompletion:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001F1BE0;
  v7[3] = &unk_100714F40;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)_bleNearbyActionAdvertiserEnsureStopped
{
  SFBLEAdvertiser *bleNearbyActionAdvertiser;
  OS_dispatch_source *bleNearbyActionAdvertiseLingerTimer;
  OS_dispatch_source *v5;
  NSObject *v6;

  self->_bleDiagnosticAdvSuppressLogged = 0;
  self->_bleNearbyActionAdvertiseActive = 0;
  if (self->_bleNearbyActionAdvertiser
    && dword_1007B3A28 <= 30
    && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
  {
    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _bleNearbyActionAdvertiserEnsureStopped]", 30, "BLE NearbyAction advertiser stop\n");
  }
  -[SFBLEAdvertiser invalidate](self->_bleNearbyActionAdvertiser, "invalidate");
  bleNearbyActionAdvertiser = self->_bleNearbyActionAdvertiser;
  self->_bleNearbyActionAdvertiser = 0;

  bleNearbyActionAdvertiseLingerTimer = self->_bleNearbyActionAdvertiseLingerTimer;
  if (bleNearbyActionAdvertiseLingerTimer)
  {
    v6 = bleNearbyActionAdvertiseLingerTimer;
    dispatch_source_cancel(v6);
    v5 = self->_bleNearbyActionAdvertiseLingerTimer;
    self->_bleNearbyActionAdvertiseLingerTimer = 0;

  }
}

- (void)_bleNearbyActionScannerEnsureStopped
{
  SFBLEScanner *bleNearbyActionScanner;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  NSMutableDictionary *bleNearbyActionDevices;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  if (self->_bleNearbyActionScanner
    && dword_1007B3A28 <= 30
    && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
  {
    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _bleNearbyActionScannerEnsureStopped]", 30, "BLE NearbyAction scanner stop\n");
  }
  -[SFBLEScanner invalidate](self->_bleNearbyActionScanner, "invalidate");
  bleNearbyActionScanner = self->_bleNearbyActionScanner;
  self->_bleNearbyActionScanner = 0;

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_bleNearbyActionDevices, "allKeys", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_bleNearbyActionDevices, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i)));
        if (v9)
          -[SDNearbyAgent _deviceDiscoveryBLEDeviceLost:type:](self, "_deviceDiscoveryBLEDeviceLost:type:", v9, 15);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  -[NSMutableDictionary removeAllObjects](self->_bleNearbyActionDevices, "removeAllObjects");
  bleNearbyActionDevices = self->_bleNearbyActionDevices;
  self->_bleNearbyActionDevices = 0;

}

- (void)_bleNearbyInfoAdvertiserEnsureStarted
{
  SFBLEAdvertiser *v3;
  SFBLEAdvertiser *bleNearbyInfoAdvertiser;

  if (self->_bleNearbyInfoAdvertiser)
  {
    if (self->_bleNearbyInfoAdvertiseReasonChanged)
    {
      if (dword_1007B3A28 <= 30
        && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
      {
        LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _bleNearbyInfoAdvertiserEnsureStarted]", 30, "BLE NearbyInfo advertiser advertising for reason: %@", self->_bleNearbyInfoAdvertiseReason);
      }
      self->_bleNearbyInfoAdvertiseReasonChanged = 0;
    }
  }
  else
  {
    if (dword_1007B3A28 <= 30
      && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
    {
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _bleNearbyInfoAdvertiserEnsureStarted]", 30, "BLE NearbyInfo advertiser created. Reason: %@\n", self->_bleNearbyInfoAdvertiseReason);
    }
    v3 = (SFBLEAdvertiser *)objc_msgSend(objc_alloc((Class)SFBLEAdvertiser), "initWithType:", 16);
    bleNearbyInfoAdvertiser = self->_bleNearbyInfoAdvertiser;
    self->_bleNearbyInfoAdvertiser = v3;

    -[SFBLEAdvertiser setDispatchQueue:](self->_bleNearbyInfoAdvertiser, "setDispatchQueue:", self->_dispatchQueue);
  }
}

- (void)_bleNearbyInfoAdvertiserUpdate
{
  void *v3;
  uint64_t v4;
  void *v5;
  NSData *bleAuthTagOverride;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  unsigned __int8 v12;
  _BOOL4 unlockAdvertiseEnabled;
  _BOOL4 unlockAdvertiseWatch;
  _BOOL4 unlockAdvertiseWatchLocked;
  int v16;
  NSMutableDictionary *v17;
  id v18;
  int v19;
  int v20;
  int v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  void *i;
  void *v26;
  void *v27;
  unsigned int v28;
  int v29;
  unsigned __int8 v30;
  unsigned __int8 v31;
  unsigned int v32;
  const char *v33;
  const __CFString *v34;
  const char *v35;
  const __CFString *v36;
  id Boolean;
  void *v38;
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  void *v43;
  void *v44;
  int v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_bleNearbyInfoAdvertiser)
    return;
  if (dword_1007B3A28 <= 9 && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 9)))
    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _bleNearbyInfoAdvertiserUpdate]", 9, "BLE NearbyInfo advertiser update\n");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = -[SDNearbyAgent _activityMonitorCurrentLevelAndNeedsPoll:recentUserActivity:](self, "_activityMonitorCurrentLevelAndNeedsPoll:recentUserActivity:", 0, 0);
  if (-[SDNearbyAgent _idsShouldEncryptActivityLevel](self, "_idsShouldEncryptActivityLevel") >= 1)
    v4 = -[SDNearbyAgent _bleEncryptActivityLevel:](self, "_bleEncryptActivityLevel:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v4));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("al"));

  if (-[SDStatusMonitor screenStateSupportsAirDrop](self->_statusMonitor, "screenStateSupportsAirDrop")
    && -[SDStatusMonitor currentConsoleUser](self->_statusMonitor, "currentConsoleUser")
    && -[SDStatusMonitor discoverableLevel](self->_statusMonitor, "discoverableLevel")
    && -[SDStatusMonitor wirelessEnabled](self->_statusMonitor, "wirelessEnabled")
    && !-[SDStatusMonitor isWifiPersonalHotspot](self->_statusMonitor, "isWifiPersonalHotspot"))
  {
    objc_msgSend(v3, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("adU"));
    self->_bleNearbyInfoAirDropUsable = 1;
  }
  else
  {
    if (self->_bleNearbyInfoAirDropUsable)
      -[SDNearbyAgent _bleNearbyInfoAdvertiserLingerStart:](self, "_bleNearbyInfoAdvertiserLingerStart:", CFSTR("AirDropUsable"));
    self->_bleNearbyInfoAirDropUsable = 0;
  }
  -[SDNearbyAgent _bleNearbyInfoAdvertiserUpdateAddAudioRoutingScore:](self, "_bleNearbyInfoAdvertiserUpdateAddAudioRoutingScore:", v3);
  if (!self->_bleNearbyActionAdvertiseActive)
  {
    -[SDNearbyAgent _bleUpdateAuthTagIfNeeded](self, "_bleUpdateAuthTagIfNeeded");
    bleAuthTagOverride = self->_bleAuthTagOverride;
    if (bleAuthTagOverride || (bleAuthTagOverride = self->_bleAuthTag) != 0)
      objc_msgSend(v3, "setObject:forKeyedSubscript:", bleAuthTagOverride, CFSTR("at"));
  }
  -[SDNearbyAgent _bleNearbyInfoAdvertisingUpdateAddCameraState:](self, "_bleNearbyInfoAdvertisingUpdateAddCameraState:", v3);
  if (self->_shareAudioEnabled
    && -[SDStatusMonitor screenOn](self->_statusMonitor, "screenOn")
    && (-[CUBluetoothClient statusFlags](self->_btConnectedDeviceMonitor, "statusFlags") & 8) != 0
    && -[SDNearbyAgent _bleNearbyInfoAdvertiserShouldAddField3](self, "_bleNearbyInfoAdvertiserShouldAddField3"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 2048));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("df"));

  }
  if (self->_enhancedDiscoveryAdvActive)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("enD"));
  -[SDNearbyAgent _bleNearbyInfoAdvertiserUpdateAddHotspotInfo:](self, "_bleNearbyInfoAdvertiserUpdateAddHotspotInfo:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent _idsBluetoothDeviceIDsForLEPipe](self, "_idsBluetoothDeviceIDsForLEPipe"));
  v9 = (id)objc_claimAutoreleasedReturnValue(-[SFBLEAdvertiser lePipeDevices](self->_bleNearbyInfoAdvertiser, "lePipeDevices"));
  v10 = v8;
  v11 = v10;
  if (v9 == v10)
  {

  }
  else
  {
    if ((v10 != 0) != (v9 == 0))
    {
      v12 = objc_msgSend(v9, "isEqual:", v10);

      if ((v12 & 1) != 0)
        goto LABEL_34;
    }
    else
    {

    }
    -[SFBLEAdvertiser setLePipeDevices:](self->_bleNearbyInfoAdvertiser, "setLePipeDevices:", v11);
  }
LABEL_34:
  v43 = v11;
  if (self->_inDiscoverySession)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("iLagS"));
  v44 = v3;
  unlockAdvertiseEnabled = self->_unlockAdvertiseEnabled;
  unlockAdvertiseWatch = self->_unlockAdvertiseWatch;
  unlockAdvertiseWatchLocked = self->_unlockAdvertiseWatchLocked;
  v16 = byte_1007D7F3D;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v17 = self->_services;
  v18 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
  v19 = unlockAdvertiseEnabled;
  v20 = unlockAdvertiseWatch;
  v45 = unlockAdvertiseWatchLocked;
  v21 = v16 != 0;
  if (v18)
  {
    v22 = v18;
    v23 = 0;
    v24 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v22; i = (char *)i + 1)
      {
        if (*(_QWORD *)v47 != v24)
          objc_enumerationMutation(v17);
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_services, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)i)));
        if ((objc_msgSend(v26, "needsAWDL") & 1) == 0
          && (objc_msgSend(v26, "needsKeyboard") & 1) == 0
          && (objc_msgSend(v26, "needsSetup") & 1) == 0)
        {
          if ((uint64_t)objc_msgSend(v26, "advertiseRate") > v23)
            v23 = (uint64_t)objc_msgSend(v26, "advertiseRate");
          v19 |= objc_msgSend(v26, "autoUnlockEnabled");
          v20 |= objc_msgSend(v26, "autoUnlockWatch");
          v21 |= objc_msgSend(v26, "duetSync");
          v45 |= objc_msgSend(v26, "watchLocked");
        }

      }
      v22 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v46, v50, 16);
    }
    while (v22);
  }
  else
  {
    v23 = 0;
  }

  v27 = v44;
  if ((v19 & 1) != 0)
    objc_msgSend(v44, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("ue"));
  if ((v20 & 1) != 0)
    objc_msgSend(v44, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("uw"));
  if ((v45 & 1) != 0)
    objc_msgSend(v44, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("wl"));
  if ((v21 & 1) != 0)
    objc_msgSend(v44, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("ds"));
  if (-[CUSystemMonitor meDeviceIsMe](self->_systemMonitor, "meDeviceIsMe"))
    objc_msgSend(v44, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("meD"));
  if (self->_bleNearbyInfoWiFiP2P)
  {
    v28 = -[CUSystemMonitor manateeAvailable](self->_systemMonitor, "manateeAvailable");
    v29 = -[CUSystemMonitor wifiState](self->_systemMonitor, "wifiState");
    v30 = -[CUSystemMonitor wifiFlags](self->_systemMonitor, "wifiFlags");
    v31 = v30;
    if (v29 && v29 != 10 && (v30 & 0x20) == 0)
    {
      v32 = self->_bleNearbyActionScanner ? v28 : 0;
      if (v32 == 1)
      {
        v27 = v44;
        objc_msgSend(v44, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("wp"));
        goto LABEL_97;
      }
    }
    v27 = v44;
    if (dword_1007B3A28 <= 20
      && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 20)))
    {
      if (v29 <= 19)
      {
        if (!v29)
        {
          v33 = "Unknown";
          goto LABEL_87;
        }
        if (v29 == 10)
        {
          v33 = "Off";
          goto LABEL_87;
        }
      }
      else
      {
        switch(v29)
        {
          case 20:
            v33 = "NotConnected";
            goto LABEL_87;
          case 30:
            v33 = "Connecting";
            goto LABEL_87;
          case 40:
            v33 = "Connected";
LABEL_87:
            if ((v31 & 0x20) != 0)
              v34 = CFSTR("YES");
            else
              v34 = CFSTR("NO");
            if (self->_bleNearbyActionScanner)
              v35 = "on";
            else
              v35 = "off";
            if (-[CUSystemMonitor manateeAvailable](self->_systemMonitor, "manateeAvailable"))
              v36 = CFSTR("YES");
            else
              v36 = CFSTR("NO");
            LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _bleNearbyInfoAdvertiserUpdate]", 20, "WiFiP2P bit is not set, WiFi state: %s, hostAP: %@, NearbyAction scan: %s, Manatee: %@\n", v33, v34, v35, v36);
            goto LABEL_97;
        }
      }
      v33 = "?";
      goto LABEL_87;
    }
  }
LABEL_97:
  Boolean = (id)GestaltGetBoolean(CFSTR("R1Capability"), 0, 0);
  if ((_DWORD)Boolean)
    Boolean = objc_msgSend(v27, "setObject:forKeyedSubscript:", &__kCFBooleanTrue, CFSTR("rgC"));
  if (v23 <= 59 && self->_unlockAdvertiseAggressive || v23 <= 59 && self->_enhancedDiscoveryShouldRun)
  {
    v23 = 60;
  }
  else
  {
    if (v23 > 39 || self->_cameraState != 1)
    {
      if (self->_unlockAdvertiseBackground)
      {
        v38 = v43;
        if (v23 <= 29)
        {
          v41 = daemon_log(Boolean);
          v42 = objc_claimAutoreleasedReturnValue(v41);
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
            sub_100208584(v42);

          v23 = 30;
        }
        goto LABEL_105;
      }
      if (((v19 | v20) & 1) != 0)
      {
        v38 = v43;
        if (v23 > 39)
          goto LABEL_105;
      }
      else
      {
        v38 = v43;
        if (((v23 < 40) & v45) == 0)
        {
          if (!v23)
            v23 = 30;
          goto LABEL_105;
        }
      }
      v23 = 40;
      goto LABEL_105;
    }
    v23 = 40;
  }
  v38 = v43;
LABEL_105:
  if (self->_boostNearbyInfo && v23 < 50)
    v40 = 50;
  else
    v40 = v23;
  if ((id)v40 != -[SFBLEAdvertiser advertiseRate](self->_bleNearbyInfoAdvertiser, "advertiseRate"))
    -[SFBLEAdvertiser setAdvertiseRate:](self->_bleNearbyInfoAdvertiser, "setAdvertiseRate:", v40);
  -[SFBLEAdvertiser setPayloadFields:](self->_bleNearbyInfoAdvertiser, "setPayloadFields:", v27);
  if (!self->_bleNearbyInfoAdvertised)
  {
    if (dword_1007B3A28 <= 30
      && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
    {
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _bleNearbyInfoAdvertiserUpdate]", 30, "BLE NearbyInfo advertiser start: %##@\n", v27);
    }
    self->_bleNearbyInfoAdvertised = 1;
    -[SFBLEAdvertiser activateWithCompletion:](self->_bleNearbyInfoAdvertiser, "activateWithCompletion:", &stru_10071B2B0);
  }

}

- (BOOL)_bleNearbyInfoAdvertiserShouldAddField3
{
  void *v3;
  SFBLEAdvertiser *bleNearbyActionAdvertiser;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SDActivityAdvertiser sharedAdvertiser](SDActivityAdvertiser, "sharedAdvertiser"));
  if (objc_msgSend(v3, "isAdvertising"))
  {
    bleNearbyActionAdvertiser = self->_bleNearbyActionAdvertiser;

    if (bleNearbyActionAdvertiser)
      return 0;
  }
  else
  {

  }
  return 1;
}

- (void)_bleNearbyInfoAdvertiserUpdateAddAudioRoutingScore:(id)a3
{
  id v4;
  unsigned int audioRoutingScore;
  NSData **p_bleAudioRoutingScoreEncryptedData;
  NSData *v7;
  void *v8;
  NSData *v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  NSData *v14;
  const char *v15;
  char v16;
  _OWORD v17[2];

  v4 = a3;
  audioRoutingScore = self->_audioRoutingScore;
  if (audioRoutingScore)
  {
    if (-[SDNearbyAgent _bleNearbyInfoAdvertiserShouldAddField3](self, "_bleNearbyInfoAdvertiserShouldAddField3"))
    {
      p_bleAudioRoutingScoreEncryptedData = &self->_bleAudioRoutingScoreEncryptedData;
      v7 = self->_bleAudioRoutingScoreEncryptedData;
      if (v7)
      {
LABEL_4:
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("ars"));

        goto LABEL_17;
      }
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentity deviceIRKData](self->_idSelfIdentity, "deviceIRKData"));
      if (objc_msgSend(v8, "length"))
      {
        -[SDNearbyAgent _bleUpdateAuthTagIfNeeded](self, "_bleUpdateAuthTagIfNeeded");
        v9 = self->_bleAuthTag;
        if (-[NSData length](v9, "length"))
        {
          memset(v17, 0, sizeof(v17));
          v10 = kCryptoHashDescriptor_SHA512;
          v11 = objc_retainAutorelease(v8);
          v12 = objc_msgSend(v11, "bytes");
          v13 = objc_msgSend(v11, "length");
          v14 = objc_retainAutorelease(v9);
          CryptoHKDF(v10, v12, v13, -[NSData bytes](v14, "bytes"), -[NSData length](v14, "length"), "BLEAdvKeyAudioRoutingScoreInfo", 30, 32, v17);
          v16 = audioRoutingScore & 7;
          ccchacha20(v17, &unk_1005CD103, 0, 1, &v16, &v16);
          v7 = (NSData *)+[NSData _newZeroingDataWithBytes:length:](NSData, "_newZeroingDataWithBytes:length:", &v16, 1);
          objc_storeStrong((id *)p_bleAudioRoutingScoreEncryptedData, v7);
          if (dword_1007B3A28 <= 30
            && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
          {
            v15 = sub_1001ED33C(audioRoutingScore);
            LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _bleNearbyInfoAdvertiserUpdateAddAudioRoutingScore:]", 30, "Updated audio routing score: %s <%@>\n", v15, v7);
          }

          goto LABEL_4;
        }

      }
      goto LABEL_17;
    }
    if (dword_1007B3A28 <= 30
      && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
    {
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _bleNearbyInfoAdvertiserUpdateAddAudioRoutingScore:]", 30, "Skip adding field3 to NearbyInfo advertiser\n");
    }
  }
LABEL_17:

}

- (void)_bleNearbyInfoAdvertiserUpdateAddHotspotInfo:(id)a3
{
  id v4;
  uint64_t hotspotInfo;
  void *v6;
  unsigned int v7;
  NSData **p_bleHotspotEncryptedData;
  NSData *v9;
  void *v10;
  NSData *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  NSData *v16;
  char v17;
  _OWORD v18[2];

  v4 = a3;
  hotspotInfo = self->_hotspotInfo;
  if (!(_DWORD)hotspotInfo)
    goto LABEL_17;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDActivityAdvertiser sharedAdvertiser](SDActivityAdvertiser, "sharedAdvertiser"));
  v7 = objc_msgSend(v6, "isAdvertising");

  if (!v7)
  {
    p_bleHotspotEncryptedData = &self->_bleHotspotEncryptedData;
    v9 = self->_bleHotspotEncryptedData;
    if (v9)
    {
LABEL_7:
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("hsi"));

      goto LABEL_17;
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentity deviceIRKData](self->_idSelfIdentity, "deviceIRKData"));
    if (objc_msgSend(v10, "length"))
    {
      -[SDNearbyAgent _bleUpdateAuthTagIfNeeded](self, "_bleUpdateAuthTagIfNeeded");
      v11 = self->_bleAuthTag;
      if (-[NSData length](v11, "length"))
      {
        memset(v18, 0, sizeof(v18));
        v12 = kCryptoHashDescriptor_SHA512;
        v13 = objc_retainAutorelease(v10);
        v14 = objc_msgSend(v13, "bytes");
        v15 = objc_msgSend(v13, "length");
        v16 = objc_retainAutorelease(v11);
        CryptoHKDF(v12, v14, v15, -[NSData bytes](v16, "bytes"), -[NSData length](v16, "length"), "BLEAdvKeyHotspotInfo", 20, 32, v18);
        v17 = hotspotInfo;
        ccchacha20(v18, &unk_1005CD103, 0, 1, &v17, &v17);
        v9 = (NSData *)+[NSData _newZeroingDataWithBytes:length:](NSData, "_newZeroingDataWithBytes:length:", &v17, 1);
        objc_storeStrong((id *)p_bleHotspotEncryptedData, v9);
        if (dword_1007B3A28 <= 20
          && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 20)))
        {
          LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _bleNearbyInfoAdvertiserUpdateAddHotspotInfo:]", 20, "Updated HotspotInfo: 0x%X <%@>\n", hotspotInfo, v9);
        }

        goto LABEL_7;
      }

    }
    goto LABEL_17;
  }
  if (dword_1007B3A28 <= 30 && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _bleNearbyInfoAdvertiserUpdateAddHotspotInfo:]", 30, "Skip adding hotspot info to NearbyInfo advertiser");
LABEL_17:

}

- (void)_bleNearbyInfoAdvertisingUpdateAddCameraState:(id)a3
{
  if (self->_cameraState == 1)
    objc_msgSend(a3, "setObject:forKeyedSubscript:", &off_10074BCE8, CFSTR("camS"));
}

- (unsigned)_bleEncryptActivityLevel:(unsigned __int8)a3
{
  int v3;
  void *v5;
  uint64_t v6;
  id v7;
  int v8;
  int v9;
  unsigned __int8 v11;
  _OWORD v12[2];

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RPIdentity deviceIRKData](self->_idSelfIdentity, "deviceIRKData"));
  if (objc_msgSend(v5, "length"))
  {
    -[SDNearbyAgent _bleUpdateAuthTagIfNeeded](self, "_bleUpdateAuthTagIfNeeded");
    if (-[NSData length](self->_bleAuthTag, "length"))
    {
      memset(v12, 0, sizeof(v12));
      v6 = kCryptoHashDescriptor_SHA512;
      v7 = objc_retainAutorelease(v5);
      CryptoHKDF(v6, objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"), -[NSData bytes](self->_bleAuthTag, "bytes"), -[NSData length](self->_bleAuthTag, "length"), "BLEAdvKeyActivityLevel", 22, 32, v12);
      v11 = v3 & 0xF;
      ccchacha20(v12, &unk_1005CD103, 0, 1, &v11, &v11);
      v8 = v11 & 0xF;
      v11 &= 0xFu;
      if (dword_1007B3A28 <= 20)
      {
        if (dword_1007B3A28 != -1 || (v9 = _LogCategory_Initialize(&dword_1007B3A28, 20), v8 = v11, v9))
        {
          LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _bleEncryptActivityLevel:]", 20, "NearbyInfo sending activity level, original: 0x%x encrypted:0x%x", v3, v8);
          LOBYTE(v8) = v11;
        }
      }
      LOBYTE(v3) = v8;
    }
    else if (dword_1007B3A28 <= 30
           && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
    {
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _bleEncryptActivityLevel:]", 30, "Not encrypting activity level because BLE AuthTag is not available");
    }
  }
  else if (dword_1007B3A28 <= 30
         && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
  {
    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _bleEncryptActivityLevel:]", 30, "Not encrypting activity level because self IRK is not available");
  }

  return v3;
}

- (void)_bleNearbyInfoAdvertiserLingerStart:(id)a3
{
  id v4;
  double bleNearbyInfoAdvertiseLingerSecs;
  OS_dispatch_source *bleNearbyInfoAdvertiseLingerTimer;
  NSObject *v7;
  OS_dispatch_source *v8;
  OS_dispatch_source *v9;
  OS_dispatch_source *v10;
  NSObject *v11;
  _QWORD handler[6];
  id v13;

  v4 = a3;
  bleNearbyInfoAdvertiseLingerSecs = self->_bleNearbyInfoAdvertiseLingerSecs;
  if (bleNearbyInfoAdvertiseLingerSecs > 0.0)
  {
    if (dword_1007B3A28 <= 30
      && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
    {
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _bleNearbyInfoAdvertiserLingerStart:]", 30, "NearbyInfo Linger advertise start: %@, %.0f seconds\n", v4, *(_QWORD *)&bleNearbyInfoAdvertiseLingerSecs);
    }
    bleNearbyInfoAdvertiseLingerTimer = self->_bleNearbyInfoAdvertiseLingerTimer;
    if (bleNearbyInfoAdvertiseLingerTimer)
    {
      v7 = bleNearbyInfoAdvertiseLingerTimer;
      dispatch_source_cancel(v7);
      v8 = self->_bleNearbyInfoAdvertiseLingerTimer;
      self->_bleNearbyInfoAdvertiseLingerTimer = 0;

    }
    v9 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    v10 = self->_bleNearbyInfoAdvertiseLingerTimer;
    self->_bleNearbyInfoAdvertiseLingerTimer = v9;
    v11 = v9;

    CUDispatchTimerSet(v11, bleNearbyInfoAdvertiseLingerSecs, -1.0, 1.0);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1001F38C8;
    handler[3] = &unk_100715138;
    handler[4] = v11;
    handler[5] = self;
    v13 = v4;
    dispatch_source_set_event_handler(v11, handler);
    dispatch_activate(v11);

  }
}

- (void)_bleNearbyInfoReceivedData:(id)a3 cnx:(id)a4 peer:(id)a5
{
  id v8;
  id v9;
  id v10;
  unsigned __int8 *v11;
  char *v12;
  uint64_t v13;
  unsigned __int8 *v14;
  int v15;
  int v16;
  uint64_t v17;
  const char *v18;
  char *v19;
  const char *v20;
  void *v21;
  void *v22;
  void *v23;
  NSUUID *remoteAppServiceUUID;
  NSUUID *v25;
  NSUUID *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  void (**v32)(_QWORD, _QWORD);
  void *v33;
  id v34;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v34 = objc_retainAutorelease(v8);
  v11 = (unsigned __int8 *)objc_msgSend(v34, "bytes");
  v12 = (char *)objc_msgSend(v34, "length");
  if ((uint64_t)v12 <= 0)
  {
    if (dword_1007B3A28 > 50)
      goto LABEL_23;
    if (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 50))
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _bleNearbyInfoReceivedData:cnx:peer:]", 50, "### BLE NearbyInfo frame no type (%tu bytes)\n");
  }
  else
  {
    v14 = v11 + 1;
    v13 = *v11;
    v15 = 1;
    v16 = 1;
    switch(*v11)
    {
      case 1u:
        if (dword_1007B3A28 <= 50
          && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 50)))
        {
          LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _bleNearbyInfoReceivedData:cnx:peer:]", 50, "BLE NearbyInfo no-op frame\n");
        }
        goto LABEL_23;
      case 2u:
        if (dword_1007B3A28 <= 50
          && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 50)))
        {
          LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _bleNearbyInfoReceivedData:cnx:peer:]", 50, "BLE NearbyInfo PingRequest: %'.32@\n", v34);
        }
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithData:](NSMutableData, "dataWithData:", v34));
        if (!v33)
          break;
        v28 = objc_retainAutorelease(v33);
        *(_BYTE *)objc_msgSend(v28, "mutableBytes") = 3;
        objc_msgSend(v9, "sendData:completion:", v28, 0);
        goto LABEL_52;
      case 3u:
        if (dword_1007B3A28 <= 50
          && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 50)))
        {
          LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _bleNearbyInfoReceivedData:cnx:peer:]", 50, "BLE NearbyInfo PingResponse: %'.32@\n", v34);
        }
        goto LABEL_23;
      case 5u:
      case 6u:
      case 0x10u:
      case 0x11u:
      case 0x12u:
      case 0x13u:
      case 0x14u:
      case 0x1Cu:
      case 0x1Du:
        goto LABEL_5;
      case 7u:
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "subdataWithRange:", 1, (char *)objc_msgSend(v34, "length") - 1));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "peerDevice"));
        -[SDNearbyAgent _unlockReceivedFrameData:peer:device:](self, "_unlockReceivedFrameData:peer:device:", v22, v10, v23);

        goto LABEL_23;
      case 8u:
      case 9u:
      case 0xAu:
        v19 = &v12[(_QWORD)v11];
        if (dword_1007B3A28 <= 20
          && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 20)))
        {
          LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _bleNearbyInfoReceivedData:cnx:peer:]", 20, "BLE NearbyInfo received frame type 0x%02X, %ld bytes\n", v13, objc_msgSend(v34, "length"));
        }
        if (-[SDNearbyAgent _bleNearbyInfoReceivedFrameType:src:end:cnx:](self, "_bleNearbyInfoReceivedFrameType:src:end:cnx:", v13, v14, v19, v9))
        {
          break;
        }
        goto LABEL_23;
      case 0xBu:
        remoteAppServiceUUID = self->_remoteAppServiceUUID;
        if (!remoteAppServiceUUID)
        {
          v25 = (NSUUID *)objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", &unk_1005CD124);
          v26 = self->_remoteAppServiceUUID;
          self->_remoteAppServiceUUID = v25;

          remoteAppServiceUUID = self->_remoteAppServiceUUID;
        }
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_services, "objectForKeyedSubscript:", remoteAppServiceUUID));
        v28 = v27;
        if (v27)
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "eventMessageHandler"));

          if (v29)
          {
            v30 = objc_alloc_init((Class)SFEventMessage);
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "subdataWithRange:", 1, (char *)objc_msgSend(v34, "length") - 1));
            objc_msgSend(v30, "setBodyData:", v31);

            v32 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "eventMessageHandler"));
            ((void (**)(_QWORD, id))v32)[2](v32, v30);

          }
          else if (dword_1007B3A28 <= 90
                 && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 90)))
          {
            LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _bleNearbyInfoReceivedData:cnx:peer:]", 90, "### BLE Remote app frame with no service event handler\n");
          }
        }
        else if (dword_1007B3A28 <= 90
               && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 90)))
        {
          LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _bleNearbyInfoReceivedData:cnx:peer:]", 90, "### BLE Remote app frame with no service\n");
        }
LABEL_52:

        goto LABEL_23;
      case 0x15u:
      case 0x17u:
      case 0x40u:
      case 0x41u:
        v16 = 0;
        goto LABEL_5;
      case 0x16u:
      case 0x18u:
      case 0x1Eu:
      case 0x30u:
      case 0x31u:
        v15 = 0;
LABEL_5:
        if ((unint64_t)v12 > 1)
        {
          v17 = *v14;
          if (dword_1007B3A28 <= 20
            && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 20)))
          {
            if ((v13 - 5) > 0x3C)
              v18 = "?";
            else
              v18 = off_10071B710[(char)(v13 - 5)];
            v20 = sub_1001F2514(v17);
            LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _bleNearbyInfoReceivedData:cnx:peer:]", 20, "BLE NearbyInfo frame %s, %s, %ld bytes, peer %@\n", v18, v20, (char *)objc_msgSend(v34, "length") - 2, v10);
          }
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "subdataWithRange:", 2, (char *)objc_msgSend(v34, "length") - 2));
          if (v15)
            -[SDNearbyAgent serviceReceivedFrameType:serviceType:data:peer:](self, "serviceReceivedFrameType:serviceType:data:peer:", v13, v17, v21, v10);
          if (v16)
            -[SDNearbyAgent sessionReceivedFrameType:serviceType:data:peer:](self, "sessionReceivedFrameType:serviceType:data:peer:", v13, v17, v21, v10);

          goto LABEL_23;
        }
        if (dword_1007B3A28 > 50)
          goto LABEL_23;
        if (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 50))
        {
          sub_1001F407C(v13);
          LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _bleNearbyInfoReceivedData:cnx:peer:]", 50, "### BLE NearbyInfo frame %s, no service type\n");
        }
        break;
      case 0x20u:
        -[SDNearbyAgent _setupHandleCreateSession:data:](self, "_setupHandleCreateSession:data:", v9, v34);
        goto LABEL_23;
      case 0x21u:
        -[SDNearbyAgent _setupHandleSessionCreated:data:](self, "_setupHandleSessionCreated:data:", v9, v34);
        goto LABEL_23;
      case 0x22u:
      case 0x23u:
      case 0x24u:
        -[SDNearbyAgent _setupHandleSessionEncryptedFrame:type:cnx:](self, "_setupHandleSessionEncryptedFrame:type:cnx:", v34, *v11, v9);
        goto LABEL_23;
      default:
        if (dword_1007B3A28 <= 50
          && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 50)))
        {
          LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _bleNearbyInfoReceivedData:cnx:peer:]", 50, "### BLE NearbyInfo unsupported frame type 0x%02X\n");
        }
        goto LABEL_23;
    }
  }
  if (dword_1007B3A28 <= 50 && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 50)))
    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _bleNearbyInfoReceivedData:cnx:peer:]", 50, "### BLE NearbyInfo frame error: %#m\n");
LABEL_23:

}

- (int)_bleNearbyInfoReceivedFrameType:(unsigned __int8)a3 src:(const char *)a4 end:(const char *)a5 cnx:(id)a6
{
  int v8;
  __objc2_meth_list **p_opt_class_meths;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  unsigned int v29;
  NSMutableDictionary *v30;
  id v31;
  id v32;
  uint64_t v33;
  void *i;
  void *v35;
  void *v36;
  _QWORD *v37;
  void (*v38)(void);
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD *v44;
  void (*v45)(void);
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  _QWORD *v54;
  void (*v55)(void);
  void *v56;
  void *v57;
  uint64_t v58;
  int v59;
  int v60;
  int v62;
  SDNearbyAgent *v63;
  SEL v64;
  id v65;
  id v66;
  BOOL *v67;
  id v68;
  void *v69;
  id v70;
  void *v71;
  id v72;
  id v73;
  id v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  unsigned int v79;
  const char *v80;
  _BYTE v81[128];

  v8 = a3;
  v80 = a4;
  v74 = a6;
  v79 = 0;
  p_opt_class_meths = &OBJC_PROTOCOL___SDSharePointBrowserDelegate.opt_class_meths;
  if (a5 - a4 <= 15)
  {
    v79 = -6750;
    if (dword_1007B3A28 <= 50
      && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 50)))
    {
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _bleNearbyInfoReceivedFrameType:src:end:cnx:]", 50, "### BLE NearbyInfo frame no session ID (%tu bytes)\n", a5 - a4);
    }
    v41 = 0;
    goto LABEL_103;
  }
  v72 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", a4);
  v80 = a4 + 16;
  if (a5 - (a4 + 16) <= 15)
  {
    v79 = -6750;
    if (dword_1007B3A28 > 50)
    {
      v27 = 0;
      v73 = 0;
      v11 = 0;
      goto LABEL_98;
    }
    v41 = v72;
    if (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 50))
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _bleNearbyInfoReceivedFrameType:src:end:cnx:]", 50, "### BLE NearbyInfo frame no message ID (%tu bytes)\n", a5 - (a4 + 16));
LABEL_103:
    v27 = 0;
    v73 = 0;
    v11 = 0;
    v69 = 0;
    v19 = 0;
    v17 = 0;
    v18 = 0;
    v42 = 0;
    v25 = 0;
    goto LABEL_73;
  }
  v73 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", a4 + 16);
  v80 = a4 + 32;
  v11 = (void *)CFBinaryPlistStreamedCreateWithBytesEx2(a4 + 32, a5 - (a4 + 32), 112, &v80, &v79);
  if (v79)
  {
    v27 = 0;
LABEL_98:
    v69 = 0;
    goto LABEL_99;
  }
  v12 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v11, v12) & 1) == 0)
  {
    v27 = 0;
    v69 = 0;
LABEL_96:
    v19 = 0;
    v17 = 0;
    v18 = 0;
    v42 = 0;
    v25 = 0;
    v79 = -6756;
LABEL_100:
    v41 = v72;
    goto LABEL_73;
  }
  v13 = CFBinaryPlistStreamedCreateWithBytesEx2(v80, a5 - v80, 112, &v80, &v79);
  v69 = (void *)v13;
  if (v79)
  {
    v27 = 0;
LABEL_99:
    v19 = 0;
    v17 = 0;
    v18 = 0;
    v42 = 0;
    v25 = 0;
    goto LABEL_100;
  }
  v14 = v13;
  v15 = objc_opt_class(NSData);
  if ((objc_opt_isKindOfClass(v14, v15) & 1) == 0)
  {
    v27 = 0;
    goto LABEL_96;
  }
  switch(v8)
  {
    case 10:
      v16 = objc_alloc_init((Class)SFResponseMessage);
      v19 = 0;
      v17 = 0;
      v18 = v16;
      break;
    case 9:
      v16 = objc_alloc_init((Class)SFRequestMessage);
      v19 = 0;
      v18 = 0;
      v17 = v16;
      break;
    case 8:
      v16 = objc_alloc_init((Class)SFEventMessage);
      v17 = 0;
      v18 = 0;
      v19 = v16;
      break;
    default:
      v63 = (SDNearbyAgent *)FatalErrorF("Bad frame type: %d", v8);
      return -[SDNearbyAgent bleNearbyInfoStartConnectionToDevice:owner:connected:](v63, v64, v65, v66, v67);
  }
  v20 = v16;
  objc_msgSend(v20, "setIdentifier:", v73);
  v71 = v11;
  objc_msgSend(v20, "setHeaderFields:", v11);
  objc_msgSend(v20, "setBodyData:", v14);
  v21 = objc_alloc_init((Class)SFDevice);
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "peerDevice"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "identifier"));
  objc_msgSend(v21, "setIdentifier:", v23);

  v70 = v20;
  v24 = v20;
  v25 = v21;
  objc_msgSend(v24, "setPeerDevice:", v21);
  v26 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_sessions, "objectForKeyedSubscript:", v72));
  if (!v26)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "UUIDString"));
    v29 = objc_msgSend(v28, "isEqual:", CFSTR("00000000-0000-0000-0000-000000000000"));

    if (v29)
    {
      v68 = v21;
      v77 = 0u;
      v78 = 0u;
      v75 = 0u;
      v76 = 0u;
      v30 = self->_sessions;
      v31 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v75, v81, 16);
      if (!v31)
      {
        v27 = 0;
        goto LABEL_54;
      }
      v32 = v31;
      v27 = 0;
      v33 = *(_QWORD *)v76;
      while (1)
      {
        for (i = 0; i != v32; i = (char *)i + 1)
        {
          v35 = v27;
          if (*(_QWORD *)v76 != v33)
            objc_enumerationMutation(v30);
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_sessions, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * (_QWORD)i)));

          if (v19)
          {
            v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "eventMessageHandler"));

            if (v36)
            {
              v37 = (_QWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "eventMessageHandler"));
              v38 = (void (*)(void))v37[2];
LABEL_32:
              v38();

              continue;
            }
          }
          if (v17)
          {
            v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "requestMessageHandler"));

            if (v39)
            {
              v37 = (_QWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "requestMessageHandler"));
              v38 = (void (*)(void))v37[2];
              goto LABEL_32;
            }
          }
          if (v18)
          {
            v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "responseMessageInternalHandler"));

            if (v40)
            {
              v37 = (_QWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "responseMessageInternalHandler"));
              v38 = (void (*)(void))v37[2];
              goto LABEL_32;
            }
          }
        }
        v32 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v75, v81, 16);
        if (!v32)
        {
LABEL_54:

          v11 = v71;
          v41 = v72;
          p_opt_class_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___SDSharePointBrowserDelegate + 48);
          v42 = v70;
          v25 = v68;
          goto LABEL_73;
        }
      }
    }
    if (dword_1007B3A28 <= 20
      && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 20)))
    {
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _bleNearbyInfoReceivedFrameType:src:end:cnx:]", 20, "BLE NearbyInfo received service frame type 0x%02X\n", v8);
    }
    v11 = v71;
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("_serviceUUID")));
    if (v48)
    {
      v49 = objc_opt_class(NSData);
      if ((objc_opt_isKindOfClass(v48, v49) & 1) != 0)
      {
        if (objc_msgSend(v48, "length") == (id)16)
        {
          v50 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", objc_msgSend(objc_retainAutorelease(v48), "bytes"));
          if (v50)
          {
            v51 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_services, "objectForKeyedSubscript:", v50));
            v52 = v51;
            v41 = v72;
            p_opt_class_meths = &OBJC_PROTOCOL___SDSharePointBrowserDelegate.opt_class_meths;
            if (!v51)
            {
              v79 = -6720;
              goto LABEL_72;
            }
            if (v19
              && (v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "eventMessageHandler")),
                  v53,
                  v53))
            {
              v54 = (_QWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "eventMessageHandler"));
              v55 = (void (*)(void))v54[2];
            }
            else if (v17
                   && (v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "requestMessageHandler")),
                       v56,
                       v56))
            {
              v54 = (_QWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "requestMessageHandler"));
              v55 = (void (*)(void))v54[2];
            }
            else
            {
              if (!v18
                || (v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "responseMessageInternalHandler")),
                    v57,
                    !v57))
              {
                if (dword_1007B3A28 <= 50)
                {
                  v11 = v71;
                  if (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 50))
                    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _bleNearbyInfoReceivedFrameType:src:end:cnx:]", 50, "### BLE NearbyInfo service receive with no handler: %@\n", v70);
                  goto LABEL_72;
                }
                goto LABEL_71;
              }
              v54 = (_QWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "responseMessageInternalHandler"));
              v55 = (void (*)(void))v54[2];
            }
            v55();

LABEL_71:
            v11 = v71;
LABEL_72:

            v27 = 0;
            v42 = v70;
            goto LABEL_73;
          }
          v52 = 0;
          v62 = -6700;
        }
        else
        {
          v50 = 0;
          v52 = 0;
          v62 = -6743;
        }
      }
      else
      {
        v50 = 0;
        v52 = 0;
        v62 = -6756;
      }
    }
    else
    {
      v50 = 0;
      v52 = 0;
      v62 = -6727;
    }
    v79 = v62;
    v41 = v72;
    p_opt_class_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___SDSharePointBrowserDelegate + 48);
    goto LABEL_72;
  }
  v27 = (void *)v26;
  p_opt_class_meths = &OBJC_PROTOCOL___SDSharePointBrowserDelegate.opt_class_meths;
  if (dword_1007B3A28 <= 20 && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 20)))
    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _bleNearbyInfoReceivedFrameType:src:end:cnx:]", 20, "BLE NearbyInfo received session frame type 0x%02X\n", v8);
  v11 = v71;
  v41 = v72;
  v42 = v70;
  if (v19
    && (v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "eventMessageHandler")), v43,
                                                                                                   v43))
  {
    v44 = (_QWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "eventMessageHandler"));
    v45 = (void (*)(void))v44[2];
  }
  else if (v17
         && (v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "requestMessageHandler")),
             v46,
             v46))
  {
    v44 = (_QWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "requestMessageHandler"));
    v45 = (void (*)(void))v44[2];
  }
  else
  {
    if (!v18
      || (v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "responseMessageInternalHandler")),
          v47,
          !v47))
    {
      if (dword_1007B3A28 <= 50
        && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 50)))
      {
        LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _bleNearbyInfoReceivedFrameType:src:end:cnx:]", 50, "### BLE NearbyInfo session receive with no handler: %@\n", v70);
      }
      goto LABEL_73;
    }
    v44 = (_QWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "responseMessageInternalHandler"));
    v45 = (void (*)(void))v44[2];
  }
  v45();

LABEL_73:
  v58 = v79;
  if (v79)
  {
    v59 = *((_DWORD *)p_opt_class_meths + 650);
    if (v59 <= 50)
    {
      if (v59 != -1 || (v60 = _LogCategory_Initialize(&dword_1007B3A28, 50), v58 = v79, v60))
      {
        LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _bleNearbyInfoReceivedFrameType:src:end:cnx:]", 50, "### BLE NearbyInfo receive frame failed: %#m\n", v58);
        LODWORD(v58) = v79;
      }
    }
  }

  return v58;
}

- (int)bleNearbyInfoStartConnectionToDevice:(id)a3 owner:(id)a4 connected:(BOOL *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  objc_class *v15;
  NSString *v16;
  void *v17;
  id v18;
  NSMutableDictionary *bleConnections;
  NSMutableDictionary *v20;
  NSMutableDictionary *v21;

  v8 = a3;
  v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v10 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_bleConnections, "objectForKeyedSubscript:", v8));
  if (v10)
  {
    v11 = (id)v10;
    if (dword_1007B3A28 <= 30
      && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
    {
      v12 = (objc_class *)objc_opt_class(v9);
      v13 = NSStringFromClass(v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent bleNearbyInfoStartConnectionToDevice:owner:connected:]", 30, "Reusing BLE connection for %@\n", v14);

    }
    objc_msgSend(v11, "addClient:", v9);
    objc_msgSend(v11, "setAcceptor:", 0);
    if (a5)
      *a5 = objc_msgSend(v11, "connectionState") == (id)1;
  }
  else
  {
    if (dword_1007B3A28 <= 30
      && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
    {
      v15 = (objc_class *)objc_opt_class(v9);
      v16 = NSStringFromClass(v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent bleNearbyInfoStartConnectionToDevice:owner:connected:]", 30, "Creating BLE connection for %@\n", v17);

    }
    v18 = objc_alloc_init((Class)SFBLEDevice);
    objc_msgSend(v18, "setIdentifier:", v8);
    objc_msgSend(v18, "setUseBTPipe:", 0);
    v11 = objc_msgSend(objc_alloc((Class)SFBLEConnection), "initWithDevice:acceptor:", v18, 0);
    objc_msgSend(v11, "setDispatchQueue:", self->_dispatchQueue);
    bleConnections = self->_bleConnections;
    if (!bleConnections)
    {
      v20 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      v21 = self->_bleConnections;
      self->_bleConnections = v20;

      bleConnections = self->_bleConnections;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](bleConnections, "setObject:forKeyedSubscript:", v11, v8);
    objc_msgSend(v11, "addClient:", v9);
    objc_msgSend(v11, "activateDirect");
    if (a5)
      *a5 = 0;

  }
  return 0;
}

- (void)bleNearbyInfoStopConnectionToDevice:(id)a3 owner:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_bleConnections, "objectForKeyedSubscript:", v12));
  v8 = v7;
  if (v7 && (objc_msgSend(v7, "removeClient:", v6) & 1) == 0)
  {
    if (dword_1007B3A28 <= 30
      && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
    {
      v9 = (objc_class *)objc_opt_class(v6);
      v10 = NSStringFromClass(v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent bleNearbyInfoStopConnectionToDevice:owner:]", 30, "Invalidating BLE connection for %@\n", v11);

    }
    -[NSMutableDictionary removeObjectForKey:](self->_bleConnections, "removeObjectForKey:", v12);
    objc_msgSend(v8, "invalidate");
  }

}

- (int)bleNearbyInfoSendFrameType:(unsigned __int8)a3 serviceType:(unsigned __int8)a4 data:(id)a5 peer:(id)a6 isSession:(BOOL)a7
{
  _BOOL4 v7;
  int v9;
  unsigned int v10;
  id v12;
  id v13;
  id v14;
  char v15;
  id v16;
  unint64_t v17;
  char v18;
  char v19;
  char *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  int v27;
  const char *v29;
  const char *v30;
  const char *v31;
  unint64_t v32;
  char v33;
  id v34;
  void *v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  id v39;
  unsigned __int8 v40;
  unsigned __int8 v41;
  _QWORD v42[4];
  id v43;
  id v44;
  id v45;
  unsigned __int8 v46;
  char v47;
  unsigned __int8 v48;
  char v49;
  _QWORD v50[4];
  id v51;
  id v52;
  id v53;
  unsigned __int8 v54;
  char v55;
  unsigned __int8 v56;
  char v57;
  char v58;
  unsigned __int8 v59;
  unsigned __int8 v60[9];

  v7 = a7;
  v9 = a4;
  v10 = a3;
  v60[0] = a3;
  v59 = a4;
  v12 = a5;
  v13 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v9)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_bleConnections, "objectForKeyedSubscript:", v13));
    if (v36)
    {
      v14 = objc_alloc_init((Class)NSMutableData);
      v15 = 1;
      objc_msgSend(v14, "appendBytes:length:", v60, 1);
      objc_msgSend(v14, "appendBytes:length:", &v59, 1);
      objc_msgSend(v14, "appendData:", v12);
      v16 = objc_msgSend(v14, "length");
      if ((unint64_t)v16 < 0xEA41)
      {
        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472;
        v37[2] = sub_1001F54A8;
        v37[3] = &unk_10071B300;
        v40 = v60[0];
        v41 = v59;
        v38 = v12;
        v39 = v13;
        objc_msgSend(v36, "sendData:completion:", v14, v37);

        v27 = 0;
      }
      else
      {
        v17 = (unint64_t)v16;
        v35 = v13;
        if (v7)
          v18 = 64;
        else
          v18 = 48;
        if (v7)
          v19 = 65;
        else
          v19 = 49;
        v33 = v19;
        v34 = objc_retainAutorelease(v14);
        v20 = (char *)objc_msgSend(v34, "bytes");
        v21 = 0;
        v58 = 1;
        v32 = v17;
        while (v15 != -1)
        {
          v22 = objc_alloc_init((Class)NSMutableData);

          v57 = v18;
          objc_msgSend(v22, "appendBytes:length:", &v57, 1);
          objc_msgSend(v22, "appendBytes:length:", &v59, 1);
          objc_msgSend(v22, "appendBytes:length:", &v58, 1);
          objc_msgSend(v22, "appendBytes:length:", v20, 59968);
          v50[0] = _NSConcreteStackBlock;
          v50[1] = 3221225472;
          v50[2] = sub_1001F52B0;
          v50[3] = &unk_10071B2D8;
          v54 = v60[0];
          v55 = v58;
          v56 = v59;
          v21 = v22;
          v51 = v21;
          v23 = v12;
          v52 = v23;
          v24 = v35;
          v53 = v24;
          objc_msgSend(v36, "sendData:completion:", v21, v50);

          v20 += 59968;
          v15 = ++v58;
          v17 -= 59968;
          if (v17 <= 0xEA40)
          {
            v25 = objc_alloc_init((Class)NSMutableData);

            v49 = v33;
            objc_msgSend(v25, "appendBytes:length:", &v49, 1);
            objc_msgSend(v25, "appendBytes:length:", &v59, 1);
            objc_msgSend(v25, "appendBytes:length:", &v58, 1);
            objc_msgSend(v25, "appendBytes:length:", v20, v17);
            v42[0] = _NSConcreteStackBlock;
            v42[1] = 3221225472;
            v42[2] = sub_1001F53AC;
            v42[3] = &unk_10071B2D8;
            v46 = v60[0];
            v47 = v58;
            v48 = v59;
            v43 = v25;
            v44 = v23;
            v45 = v24;
            v26 = v25;
            objc_msgSend(v36, "sendData:completion:", v26, v42);

            v27 = 0;
            goto LABEL_14;
          }
        }
        if (dword_1007B3A28 <= 60
          && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 60)))
        {
          LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent bleNearbyInfoSendFrameType:serviceType:data:peer:isSession:]", 60, "### Can't send more than 255 fragments (%zu total bytes)\n", v32);
        }

        v27 = -6764;
LABEL_14:
        v13 = v35;
      }
    }
    else
    {
      if (dword_1007B3A28 <= 60
        && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 60)))
      {
        v30 = sub_1001F407C(v10);
        v31 = sub_1001F2514(v9);
        LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent bleNearbyInfoSendFrameType:serviceType:data:peer:isSession:]", 60, "### BLE Nearby send frame type %s, service %s, %ld bytes, unknown peer %@\n", v30, v31, objc_msgSend(v12, "length"), v13);
      }
      v27 = -6753;
    }
  }
  else
  {
    if (dword_1007B3A28 <= 60
      && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 60)))
    {
      v29 = sub_1001F407C(v10);
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent bleNearbyInfoSendFrameType:serviceType:data:peer:isSession:]", 60, "### BLE Nearby send frame type %s, invalid service 0x%X, %ld bytes, peer %@\n", v29, 0, objc_msgSend(v12, "length"), v13);
    }
    v27 = -6705;
  }

  return v27;
}

- (void)_bleNearbyInfoScannerEnsureStarted
{
  SFBLEScanner *bleNearbyInfoScanner;
  SFBLEScanner *v4;
  SFBLEScanner *v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];

  bleNearbyInfoScanner = self->_bleNearbyInfoScanner;
  if (bleNearbyInfoScanner)
  {
    -[SDNearbyAgent _bleUpdateScanner:typeFlag:](self, "_bleUpdateScanner:typeFlag:", bleNearbyInfoScanner, 1);
  }
  else
  {
    if (dword_1007B3A28 <= 50
      && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 50)))
    {
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _bleNearbyInfoScannerEnsureStarted]", 50, "BLE NearbyInfo scanner start\n");
    }
    v4 = (SFBLEScanner *)objc_msgSend(objc_alloc((Class)SFBLEScanner), "initWithType:", 16);
    v5 = self->_bleNearbyInfoScanner;
    self->_bleNearbyInfoScanner = v4;

    -[SFBLEScanner setDispatchQueue:](self->_bleNearbyInfoScanner, "setDispatchQueue:", self->_dispatchQueue);
    if (-[NSMutableSet count](self->_caRequests, "count"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent _idsBluetoothDeviceIDsForSharing](self, "_idsBluetoothDeviceIDsForSharing"));
      -[SFBLEScanner setDeviceFilter:](self->_bleNearbyInfoScanner, "setDeviceFilter:", v6);

    }
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100005250;
    v10[3] = &unk_100715048;
    v10[4] = self;
    -[SFBLEScanner setDeviceFoundHandler:](self->_bleNearbyInfoScanner, "setDeviceFoundHandler:", v10);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1001F5778;
    v9[3] = &unk_100715048;
    v9[4] = self;
    -[SFBLEScanner setDeviceLostHandler:](self->_bleNearbyInfoScanner, "setDeviceLostHandler:", v9);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000050CC;
    v8[3] = &unk_1007150B0;
    v8[4] = self;
    -[SFBLEScanner setDeviceChangedHandler:](self->_bleNearbyInfoScanner, "setDeviceChangedHandler:", v8);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1001F5838;
    v7[3] = &unk_100715288;
    v7[4] = self;
    -[SFBLEScanner setScanStateChangedHandler:](self->_bleNearbyInfoScanner, "setScanStateChangedHandler:", v7);
    -[SDNearbyAgent _bleUpdateScanner:typeFlag:](self, "_bleUpdateScanner:typeFlag:", self->_bleNearbyInfoScanner, 1);
    if (self->_bleNearbyInfoRSSILog)
      -[SFBLEScanner setRssiLog:](self->_bleNearbyInfoScanner, "setRssiLog:", 1);
    -[SFBLEScanner activateWithCompletion:](self->_bleNearbyInfoScanner, "activateWithCompletion:", &stru_10071B320);
  }
}

- (void)_bleProximityPairingScannerEnsureStopped
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  SFBLEScanner *bleProximityPairingScanner;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  if (self->_bleProximityPairingScanner)
  {
    if (dword_1007B3A28 <= 50
      && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 50)))
    {
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _bleProximityPairingScannerEnsureStopped]", 50, "BLE Prox scanner stop\n");
    }
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_ddProximityPairingDevices, "allKeys", 0));
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v12 != v6)
            objc_enumerationMutation(v3);
          v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_ddProximityPairingDevices, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i)));
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bleDevice"));

          if (v9)
            -[SDNearbyAgent _deviceDiscoveryBLEDeviceLost:type:](self, "_deviceDiscoveryBLEDeviceLost:type:", v9, 7);

        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v5);
    }

    -[SFBLEScanner invalidate](self->_bleProximityPairingScanner, "invalidate");
    bleProximityPairingScanner = self->_bleProximityPairingScanner;
    self->_bleProximityPairingScanner = 0;

  }
}

- (void)_btPipeEnsureStopped
{
  SFBLEPipe *unlockBtPipe;

  if (self->_unlockBtPipe)
  {
    if (dword_1007B3A28 <= 50
      && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 50)))
    {
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _btPipeEnsureStopped]", 50, "BTPipe stop\n");
    }
    -[SFBLEPipe invalidate](self->_unlockBtPipe, "invalidate");
    unlockBtPipe = self->_unlockBtPipe;
    self->_unlockBtPipe = 0;

  }
}

- (void)_btPipeStateChanged:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  const char *v10;
  SFBLEDevice *v11;
  id v12;
  SFBLEDevice *btPipePeer;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  int v17;
  void *v18;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", SFNotificationKeyConnectionState));
  v6 = (unint64_t)objc_msgSend(v5, "integerValue");

  v8 = auto_unlock_log(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if (v6 > 2)
      v10 = "?";
    else
      v10 = off_10071BB08[v6];
    v17 = 136315138;
    v18 = (void *)v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "_btPipeStateChanged to %s", (uint8_t *)&v17, 0xCu);
  }

  if (v6 == 1)
  {
    v11 = (SFBLEDevice *)objc_claimAutoreleasedReturnValue(-[SFBLEPipe getPeerUUID](self->_unlockBtPipe, "getPeerUUID"));
    v12 = objc_alloc_init((Class)SFBLEDevice);
    objc_msgSend(v12, "setIdentifier:", v11);
    objc_msgSend(v12, "setUseBTPipe:", 1);
    btPipePeer = self->_btPipePeer;
    self->_btPipePeer = (SFBLEDevice *)v12;

    v15 = auto_unlock_log(v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412290;
      v18 = v11;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "connected to BT peer %@", (uint8_t *)&v17, 0xCu);
    }

  }
  else
  {
    v11 = self->_btPipePeer;
    self->_btPipePeer = 0;
  }

}

- (void)_btPipeHandleFrameType:(unsigned __int8)a3 data:(id)a4
{
  int v4;
  id v6;
  void *v7;
  void *v8;
  SFBLEDevice *v9;
  void *v10;
  void *v11;
  double Current;
  id v13;
  double *v14;
  double v15;
  const char *v16;
  uint64_t v17;
  int v18;
  int v19;
  int v20;
  int v21;
  id v22;
  double v23;
  id v24;

  v4 = a3;
  v6 = a4;
  v7 = v6;
  switch(v4)
  {
    case 3:
      v24 = v6;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[SFBLEPipe getPeerUUID](self->_unlockBtPipe, "getPeerUUID"));
      v9 = self->_btPipePeer;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SFBLEDevice identifier](v9, "identifier"));

      if (v8 != v10
        && dword_1007B3A28 <= 60
        && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 60)))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[SFBLEDevice identifier](v9, "identifier"));
        LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _btPipeHandleFrameType:data:]", 60, "Received message from unexpected device with BT UUID %@. Expected: %@", v8, v11);

      }
      -[SDNearbyAgent _unlockReceivedFrameData:peer:device:](self, "_unlockReceivedFrameData:peer:device:", v24, v8, v9);

      goto LABEL_23;
    case 2:
      v24 = v6;
      if ((unint64_t)objc_msgSend(v6, "length") <= 7)
      {
        v7 = v24;
        if (dword_1007B3A28 <= 60)
        {
          if (dword_1007B3A28 != -1 || (v20 = _LogCategory_Initialize(&dword_1007B3A28, 60), v7 = v24, v20))
          {
            v22 = objc_msgSend(v7, "length");
            v16 = "### Ping response too small: %ld bytes\n";
LABEL_32:
            v17 = 60;
            goto LABEL_15;
          }
        }
      }
      else
      {
        Current = CFAbsoluteTimeGetCurrent();
        v13 = objc_retainAutorelease(v24);
        v14 = (double *)objc_msgSend(v13, "bytes");
        v7 = v24;
        if (dword_1007B3A28 <= 50)
        {
          v15 = *v14;
          if (dword_1007B3A28 != -1 || (v19 = _LogCategory_Initialize(&dword_1007B3A28, 50), v7 = v24, v19))
          {
            v23 = (Current - v15) * 1000.0;
            v22 = objc_msgSend(v13, "length");
            v16 = "BTPipe ping response: %ld bytes, %.0f ms\n";
            v17 = 50;
LABEL_15:
            LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _btPipeHandleFrameType:data:]", v17, v16, v22, *(_QWORD *)&v23);
LABEL_24:
            v7 = v24;
          }
        }
      }
      break;
    case 1:
      v24 = v6;
      if (dword_1007B3A28 <= 50)
      {
        if (dword_1007B3A28 != -1 || (v18 = _LogCategory_Initialize(&dword_1007B3A28, 50), v7 = v24, v18))
        {
          LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _btPipeHandleFrameType:data:]", 50, "BTPipe ping request: %ld bytes\n", objc_msgSend(v7, "length"));
          v7 = v24;
        }
      }
      if ((unint64_t)objc_msgSend(v7, "length") > 7)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "subdataWithRange:", 0, 8));
        -[SFBLEPipe sendFrameType:payload:completion:](self->_unlockBtPipe, "sendFrameType:payload:completion:", 2, v8, &stru_10071B360);
LABEL_23:

        goto LABEL_24;
      }
      v7 = v24;
      if (dword_1007B3A28 <= 60)
      {
        if (dword_1007B3A28 != -1 || (v21 = _LogCategory_Initialize(&dword_1007B3A28, 60), v7 = v24, v21))
        {
          v22 = objc_msgSend(v7, "length");
          v16 = "### Ping request too small: %ld bytes\n";
          goto LABEL_32;
        }
      }
      break;
  }

}

- (void)_smartCoverStatusChanged:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  _QWORD block[5];

  v4 = a3;
  if (dword_1007B3A28 <= 30 && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _smartCoverStatusChanged:]", 30, "smartCoverStatusChanged notification");
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001F6684;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);

}

- (void)_wirelessCriticalChanged:(id)a3
{
  unsigned int v4;
  const __CFString *v5;
  id v6;

  v6 = a3;
  if (dword_1007B3A28 <= 30 && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
  {
    v4 = -[SDStatusMonitor wirelessCritical](self->_statusMonitor, "wirelessCritical");
    v5 = CFSTR("NO");
    if (v4)
      v5 = CFSTR("YES");
    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _wirelessCriticalChanged:]", 30, "wirelessCriticalChanged notification, wifiCritical=%@", v5, v6);
  }
  if (-[SDStatusMonitor wirelessCritical](self->_statusMonitor, "wirelessCritical"))
  {
    if (dword_1007B3A28 <= 40
      && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 40)))
    {
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _wirelessCriticalChanged:]", 40, "Disabling enhanced discovery\n");
    }
    -[SDNearbyAgent _disableEnhancedDiscovery:](self, "_disableEnhancedDiscovery:", CFSTR("WirelessCritical"));
  }

}

- (void)_mirroringStateChanged:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001F67F0;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_bleAdvertisingAddressChanged
{
  void *v3;
  void *v4;
  NSData *bleAdvertisingAddress;
  NSData *v6;
  NSData *v7;
  NSData *v8;
  unsigned int v9;
  id v10;
  id v11;
  int v12;
  NSData *bleAudioRoutingScoreEncryptedData;
  NSData *bleAuthTag;
  NSData *bleHotspotEncryptedData;
  id obj;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CUSystemMonitor bluetoothAddressData](self->_systemMonitor, "bluetoothAddressData"));
  v4 = v3;
  obj = v3;
  if (v3)
  {
    bleAdvertisingAddress = self->_bleAdvertisingAddress;
    v6 = v3;
    v7 = bleAdvertisingAddress;
    if (v6 == v7)
    {

      v4 = obj;
    }
    else
    {
      v8 = v7;
      if (!v7)
      {

        goto LABEL_12;
      }
      v9 = -[NSData isEqual:](v6, "isEqual:", v7);

      v4 = obj;
      if (!v9)
      {
LABEL_12:
        if (dword_1007B3A28 <= 30
          && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
        {
          if ((id)-[NSData length](v6, "length") == (id)6)
            v11 = -[NSData bytes](objc_retainAutorelease(v6), "bytes");
          else
            v11 = 0;
          LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _bleAdvertisingAddressChanged]", 30, "BLE address changed: %.6a\n", *(double *)&v11);
        }
        objc_storeStrong((id *)&self->_bleAdvertisingAddress, obj);
        bleAudioRoutingScoreEncryptedData = self->_bleAudioRoutingScoreEncryptedData;
        self->_bleAudioRoutingScoreEncryptedData = 0;

        bleAuthTag = self->_bleAuthTag;
        self->_bleAuthTag = 0;

        bleHotspotEncryptedData = self->_bleHotspotEncryptedData;
        self->_bleHotspotEncryptedData = 0;

        -[SDNearbyAgent _update](self, "_update");
        goto LABEL_25;
      }
    }
  }
  if (dword_1007B3A28 <= 30)
  {
    if (dword_1007B3A28 != -1 || (v12 = _LogCategory_Initialize(&dword_1007B3A28, 30), v4 = obj, v12))
    {
      if (objc_msgSend(v4, "length") == (id)6)
        v10 = objc_msgSend(objc_retainAutorelease(obj), "bytes");
      else
        v10 = 0;
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _bleAdvertisingAddressChanged]", 30, "BLE address unchanged: %.6a\n", *(double *)&v10);
LABEL_25:
      v4 = obj;
    }
  }

}

- (void)_bleUpdateAuthTagIfNeeded
{
  NSData *v3;
  uint64_t v4;
  RPIdentity *idSelfIdentity;
  NSData *v6;
  id v7;
  NSData *bleAuthTag;
  NSData *v9;
  void *v10;
  id v11;

  if (!self->_bleAuthTag && self->_idSelfIdentity)
  {
    v3 = self->_bleAdvertisingAddress;
    if ((id)-[NSData length](v3, "length") != (id)6)
    {
      v4 = objc_claimAutoreleasedReturnValue(-[CUSystemMonitor bluetoothAddressData](self->_systemMonitor, "bluetoothAddressData"));

      v3 = (NSData *)v4;
    }
    if ((id)-[NSData length](v3, "length") != (id)6)
      goto LABEL_13;
    idSelfIdentity = self->_idSelfIdentity;
    v11 = 0;
    v6 = (NSData *)objc_claimAutoreleasedReturnValue(-[RPIdentity authTagForData:type:error:](idSelfIdentity, "authTagForData:type:error:", v3, 2, &v11));
    v7 = v11;
    bleAuthTag = self->_bleAuthTag;
    self->_bleAuthTag = v6;

    v9 = self->_bleAuthTag;
    if (!v9)
    {
      if (dword_1007B3A28 <= 90
        && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 90)))
      {
        LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _bleUpdateAuthTagIfNeeded]", 90, "### Generate BLE Auth Tag failed: %{error}\n", v7);
      }
      goto LABEL_12;
    }
    if (dword_1007B3A28 <= 30)
    {
      if (dword_1007B3A28 == -1)
      {
        if (!_LogCategory_Initialize(&dword_1007B3A28, 30))
          goto LABEL_11;
        v9 = self->_bleAuthTag;
      }
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _bleUpdateAuthTagIfNeeded]", 30, "Updated BLE Auth Tag: <%@>\n", v9);
    }
LABEL_11:
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("SDNotificationNameNearbyBLEAuthTagChanged"), self, 0);

LABEL_12:
LABEL_13:

  }
}

- (id)bleProximityEstimatorForActionType:(unsigned __int8)a3 device:(id)a4
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent bleProximityInfoForActionType:device:](self, "bleProximityInfoForActionType:device:", a3, a4));
  if (v4)
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[SFProximityEstimator proximityEstimatorWithProximityInfo:](SFProximityEstimator, "proximityEstimatorWithProximityInfo:", v4));
  else
    v5 = 0;

  return v5;
}

- (void)bleProximityEstimatorsResetDeviceClose
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_ddNearbyActionDevices, "allValues"));
  v3 = v2;
  if (v2)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v4 = v2;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v8), "bleDevice", (_QWORD)v11));
          if (!v9)
          {
            while (1)
              +[NSException raise:format:](NSException, "raise:format:", CFSTR("CUGuardLetNoReturn"), CFSTR("CUGuardLet with no return"));
          }
          v10 = v9;
          objc_msgSend(v9, "setInsideMediumBubble:", 0);
          objc_msgSend(v10, "setInsideSmallBubble:", 0);
          objc_msgSend(v10, "setCloseProximityEstimatorMedium:", 0);
          objc_msgSend(v10, "setCloseProximityEstimatorSmall:", 0);

          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }

  }
}

- (id)bleProximityInfoForActionType:(unsigned __int8)a3 device:(id)a4
{
  const __CFString *v4;

  if ((a3 - 1) > 0x36)
    v4 = CFSTR("atv");
  else
    v4 = (const __CFString *)*((_QWORD *)&off_10071BB20 + (char)(a3 - 1));
  return -[SDNearbyAgent bleProximityInfoForType:device:](self, "bleProximityInfoForType:device:", v4, a4);
}

- (id)bleProximityRSSIEstimatorInfo
{
  id v2;
  CFTypeID TypeID;

  v2 = -[SDNearbyAgent bleProximityInfo](self, "bleProximityInfo");
  TypeID = CFDictionaryGetTypeID();
  return (id)CFDictionaryGetTypedValue(v2, CFSTR("rEst"), TypeID, 0);
}

- (int64_t)bleProximityRSSIThresholdForType:(int64_t)a3 device:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  int64_t v12;
  id v13;
  id v14;
  id v15;

  v6 = a4;
  v7 = SFDeviceModel();
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "model"));

  if ((unint64_t)(a3 - 1) > 7)
  {
LABEL_11:
    v12 = 0;
    goto LABEL_12;
  }
  v10 = *((_QWORD *)&off_10071BD18 + a3 - 1);
  if (v8 && v9)
  {
    v11 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@-%@-%@"), v10, v8, v9);
    v12 = -[SDNearbyAgent bleProximityRSSIThreshold:](self, "bleProximityRSSIThreshold:", v11);

    if (v12)
      goto LABEL_12;
    goto LABEL_7;
  }
  if (v9)
  {
LABEL_7:
    v13 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@-%@"), v10, v9);
    v12 = -[SDNearbyAgent bleProximityRSSIThreshold:](self, "bleProximityRSSIThreshold:", v13);

    if (v12)
      goto LABEL_12;
  }
  if (!v8
    || (v14 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@-%@"), v10, v8),
        v12 = -[SDNearbyAgent bleProximityRSSIThreshold:](self, "bleProximityRSSIThreshold:", v14),
        v14,
        !v12))
  {
    v15 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%@"), v10);
    v12 = -[SDNearbyAgent bleProximityRSSIThreshold:](self, "bleProximityRSSIThreshold:", v15);

    if (!v12)
      goto LABEL_11;
  }
LABEL_12:

  return v12;
}

- (int64_t)bleProximityRSSIThreshold:(id)a3
{
  id v4;
  void *v5;
  CFTypeID TypeID;
  uint64_t TypedValue;
  void *v8;
  int64_t Int64Ranged;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent bleProximityInfo](self, "bleProximityInfo"));
  TypeID = CFDictionaryGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(v5, v4, TypeID, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(TypedValue);

  Int64Ranged = (int)CFDictionaryGetInt64Ranged(v8, CFSTR("rssi"), 0xFFFFFFFF80000000, 0x7FFFFFFFLL, 0);
  return Int64Ranged;
}

- (unsigned)_bleProximityUpdateDeviceCloseNearbyActionDevice:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  unsigned __int8 v6;
  const __CFString *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t Int64Ranged;
  uint64_t Int64;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  unsigned int v33;
  unsigned int v35;
  _QWORD v36[4];
  _QWORD v37[4];
  _QWORD v38[4];
  _QWORD v39[4];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bleDevice"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "model"));
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("AudioAccessory5,1"));

  if ((v6 & 1) != 0)
  {
    v7 = CFSTR("b520ho");
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "model"));
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("AudioAccessory6,1"));

    if (v9)
      v7 = CFSTR("b620ho");
    else
      v7 = CFSTR("ho");
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](SDNearbyAgent, "sharedNearbyAgent"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bleProximityInfoForType:device:", v7, v3));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "closeProximityEstimatorSmall"));
    if (!v12)
    {
      Int64Ranged = CFDictionaryGetInt64Ranged(v11, CFSTR("algo"), 0xFFFFFFFF80000000, 0x7FFFFFFFLL, 0);
      Int64 = CFDictionaryGetInt64(v11, CFSTR("rssiSmallEnter"), 0);
      v15 = CFDictionaryGetInt64(v11, CFSTR("rssiSmallExit"), 0);
      v16 = CFDictionaryGetInt64Ranged(v11, CFSTR("sc"), 0, 0xFFFFFFFFLL, 0);
      v38[0] = CFSTR("algo");
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", Int64Ranged));
      v39[0] = v17;
      v38[1] = CFSTR("rssi");
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", Int64));
      v39[1] = v18;
      v38[2] = CFSTR("rssiExit");
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v15));
      v39[2] = v19;
      v38[3] = CFSTR("sc");
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v16));
      v39[3] = v20;
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v39, v38, 4));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[SFProximityEstimator proximityEstimatorWithProximityInfo:](SFProximityEstimator, "proximityEstimatorWithProximityInfo:", v21));

      objc_msgSend(v4, "setCloseProximityEstimatorSmall:", v12);
    }
    v22 = objc_msgSend(v12, "updateWithSFBLEDevice:", v4);
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "closeProximityEstimatorMedium"));
    if (!v23)
    {
      v24 = CFDictionaryGetInt64Ranged(v11, CFSTR("algo"), 0xFFFFFFFF80000000, 0x7FFFFFFFLL, 0);
      v25 = CFDictionaryGetInt64(v11, CFSTR("rssiMediumEnter"), 0);
      v26 = CFDictionaryGetInt64(v11, CFSTR("rssiMediumExit"), 0);
      v27 = CFDictionaryGetInt64Ranged(v11, CFSTR("sc"), 0, 0xFFFFFFFFLL, 0);
      v36[0] = CFSTR("algo");
      v35 = v22;
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v24));
      v37[0] = v28;
      v36[1] = CFSTR("rssi");
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v25));
      v37[1] = v29;
      v36[2] = CFSTR("rssiExit");
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", v26));
      v37[2] = v30;
      v36[3] = CFSTR("sc");
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v27));
      v37[3] = v31;
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v37, v36, 4));
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[SFProximityEstimator proximityEstimatorWithProximityInfo:](SFProximityEstimator, "proximityEstimatorWithProximityInfo:", v32));

      v22 = v35;
      objc_msgSend(v4, "setCloseProximityEstimatorMedium:", v23);
    }
    v33 = objc_msgSend(v23, "updateWithSFBLEDevice:", v4) | v22;

  }
  else
  {
    if (dword_1007B3A28 <= 90
      && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 90)))
    {
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _bleProximityUpdateDeviceCloseNearbyActionDevice:]", 90, "### No ble proximity info found for %@\n", v3);
    }
    v33 = 0;
  }

  return v33;
}

- (unsigned)_bleProximityUpdateNearbyActionDevice:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bleDevice"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "setupProximityEstimator"));
  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[SDNearbyAgent sharedNearbyAgent](SDNearbyAgent, "sharedNearbyAgent"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bleProximityEstimatorForActionType:device:", objc_msgSend(v4, "deviceActionType"), v4));

    if (!v6)
    {
      v8 = 0;
      goto LABEL_9;
    }
    objc_msgSend(v5, "setSetupProximityEstimator:", v6);
  }
  v8 = objc_msgSend(v6, "updateWithSFBLEDevice:", v5);
  if ((v8 & 2) != 0)
    objc_msgSend(v4, "setDistance:", objc_msgSend(v5, "distance"));
  if ((objc_msgSend(v4, "deviceFlags") & 0x200) != 0)
    v8 |= -[SDNearbyAgent _bleProximityUpdateDeviceCloseNearbyActionDevice:](self, "_bleProximityUpdateDeviceCloseNearbyActionDevice:", v4);
LABEL_9:

  return v8;
}

- (void)_postNotificationForWombatState:(unsigned int)a3
{
  unsigned int v4;
  const char *v5;
  const char *v6;

  if (dword_1007B3A98 == -1)
    notify_register_check("com.apple.sharing.wombat-state", &dword_1007B3A98);
  v4 = dword_1007C6DE8;
  if (dword_1007C6DE8 != a3)
  {
    if (dword_1007B3A28 <= 30)
    {
      if (dword_1007B3A28 != -1)
      {
LABEL_6:
        if (v4 > 3)
          v5 = "?";
        else
          v5 = off_10071BD58[v4];
        if (a3 > 3)
          v6 = "?";
        else
          v6 = off_10071BD58[a3];
        LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _postNotificationForWombatState:]", 30, "Posting notification for wombat state change: %s -> %s (0x%x)\n", v5, v6, a3);
        goto LABEL_15;
      }
      if (_LogCategory_Initialize(&dword_1007B3A28, 30))
      {
        v4 = dword_1007C6DE8;
        goto LABEL_6;
      }
    }
LABEL_15:
    notify_set_state(dword_1007B3A98, a3);
    notify_post("com.apple.sharing.wombat-state");
    dword_1007C6DE8 = a3;
  }
}

- (void)_registerForMagicMountUpdates
{
  int DeviceClass;
  int v4;
  CMMagicMountManager *v5;
  CMMagicMountManager *cameraMagicMountManager;
  uint64_t v7;
  CMMagicMountManager *v8;
  void *v9;
  _QWORD v10[5];

  if (self->_cameraMagicMountManager)
    return;
  DeviceClass = GestaltGetDeviceClass(self, a2);
  if ((DeviceClass | 2) != 3)
    return;
  v4 = DeviceClass;
  if (-[SDNearbyAgent _allowEnhancedDiscovery](self, "_allowEnhancedDiscovery") < 1
    || !+[CMMagicMountManager isAvailable](CMMagicMountManager, "isAvailable"))
  {
    return;
  }
  if (dword_1007B3A28 <= 30 && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _registerForMagicMountUpdates]", 30, "Starting magic mount manager\n");
  v5 = (CMMagicMountManager *)objc_alloc_init((Class)CMMagicMountManager);
  cameraMagicMountManager = self->_cameraMagicMountManager;
  self->_cameraMagicMountManager = v5;

  v7 = 1;
  -[CMMagicMountManager setMagicMountConfiguration:](self->_cameraMagicMountManager, "setMagicMountConfiguration:", 1);
  if (v4 == 1)
    goto LABEL_13;
  if (v4 == 3)
  {
    v7 = 0;
LABEL_13:
    -[CMMagicMountManager setAPWakesAllowed:](self->_cameraMagicMountManager, "setAPWakesAllowed:", v7);
  }
  v8 = self->_cameraMagicMountManager;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001F7868;
  v10[3] = &unk_10071B3B0;
  v10[4] = self;
  -[CMMagicMountManager startMagicMountUpdatesToQueue:withHandler:](v8, "startMagicMountUpdatesToQueue:withHandler:", v9, v10);

  if (dword_1007B3A28 <= 30 && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _registerForMagicMountUpdates]", 30, "Started magic mount manager.\n");
}

- (void)_unregisterForMagicMountUpdates
{
  CMMagicMountManager *cameraMagicMountManager;
  CMMagicMountManager *v4;
  BrightnessSystemClient *brightnessSystemClient;

  cameraMagicMountManager = self->_cameraMagicMountManager;
  if (cameraMagicMountManager)
  {
    -[CMMagicMountManager stopMagicMountUpdates](cameraMagicMountManager, "stopMagicMountUpdates");
    v4 = self->_cameraMagicMountManager;
    self->_cameraMagicMountManager = 0;

    if (dword_1007B3A28 <= 30
      && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
    {
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _unregisterForMagicMountUpdates]", 30, "Stopped magic mount manager.\n");
    }
    brightnessSystemClient = self->_brightnessSystemClient;
    self->_brightnessSystemClient = 0;

    self->_isDeviceMounted = 0;
    -[SDNearbyAgent _updateCameraState](self, "_updateCameraState");
  }
}

- (BOOL)_isDeviceMountedAndScreenOff
{
  _BOOL4 v3;
  unsigned int v4;
  _BOOL4 v5;
  const char *v6;
  _BOOL4 inDiscoverySession;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  BOOL v12;

  v3 = self->_prefWombatAssumeLocked
    || -[CUSystemMonitor systemLockState](self->_systemMonitor, "systemLockState") == 3
    || -[CUSystemMonitor systemLockState](self->_systemMonitor, "systemLockState") == 2;
  if (self->_prefWombatAssumeScreenOff)
    v4 = 1;
  else
    v4 = -[CUSystemMonitor screenOn](self->_systemMonitor, "screenOn") ^ 1;
  v5 = self->_prefWombatAssumeMounted || self->_isDeviceMounted;
  v6 = "yes";
  if (!self->_prefWombatAssumeNotInPocket)
  {
    if (self->_isDeviceNotInPocket)
      v6 = "yes";
    else
      v6 = "no";
  }
  inDiscoverySession = self->_inDiscoverySession;
  if (dword_1007B3A28 <= 30 && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
  {
    v8 = "no";
    if (v4)
      v9 = "yes";
    else
      v9 = "no";
    if (v5)
      v10 = "yes";
    else
      v10 = "no";
    if (v3)
      v11 = "yes";
    else
      v11 = "no";
    if (inDiscoverySession)
      v8 = "yes";
    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _isDeviceMountedAndScreenOff]", 30, "Updating camera state isScreenOff:%s isDeviceMounted:%s isLocked:%s isNotInPocket:%s isInDiscoverySession:%s\n", v9, v10, v11, v6, v8);
  }
  if (inDiscoverySession)
    v12 = 1;
  else
    v12 = v4;
  if (!v5 || v3)
    return v5;
  else
    return v12;
}

- (void)_cameraStateChanged
{
  if (-[SDNearbyAgent _allowEnhancedDiscovery](self, "_allowEnhancedDiscovery"))
  {
    if (self->_prefWombatAssumeMounted || self->_isDeviceMounted)
    {
      if (!self->_prefWombatAssumeNotInPocket && !self->_inDiscoverySession)
      {
        -[SDNearbyAgent _checkBrightnessLuxValue](self, "_checkBrightnessLuxValue");
        return;
      }
    }
    else
    {
      self->_isDeviceNotInPocket = 0;
    }
    -[SDNearbyAgent _updateCameraState](self, "_updateCameraState");
  }
}

- (void)_updateCameraState
{
  _BOOL4 isDeviceNotInPocket;
  int v4;
  int v5;
  const char *v6;
  int cameraState;
  const char *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_prefWombatAssumeNotInPocket)
  {
    isDeviceNotInPocket = self->_isDeviceNotInPocket;
    if (!-[SDNearbyAgent _isDeviceMountedAndScreenOff](self, "_isDeviceMountedAndScreenOff")
      || !isDeviceNotInPocket && !self->_inDiscoverySession)
    {
      goto LABEL_8;
    }
LABEL_7:
    v4 = 0;
    v5 = 1;
    v6 = "Usable";
    goto LABEL_9;
  }
  if (-[SDNearbyAgent _isDeviceMountedAndScreenOff](self, "_isDeviceMountedAndScreenOff"))
    goto LABEL_7;
LABEL_8:
  v5 = 0;
  v6 = "?";
  v4 = 1;
LABEL_9:
  cameraState = self->_cameraState;
  if (v5 == cameraState)
    goto LABEL_26;
  if (dword_1007B3A28 <= 30)
  {
    if (dword_1007B3A28 != -1)
    {
LABEL_12:
      v8 = "?";
      if (cameraState == 1)
        v8 = "Usable";
      if (cameraState)
        v9 = v8;
      else
        v9 = "Nearby";
      if (v4)
        v10 = "Nearby";
      else
        v10 = v6;
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _updateCameraState]", 30, "Camera state changed %s -> %s\n", v9, v10);
      goto LABEL_22;
    }
    if (_LogCategory_Initialize(&dword_1007B3A28, 30))
    {
      cameraState = self->_cameraState;
      goto LABEL_12;
    }
  }
LABEL_22:
  self->_cameraState = v5;
  if ((v4 & 1) != 0)
  {
    -[SDNearbyAgent _disableEnhancedDiscovery:](self, "_disableEnhancedDiscovery:", CFSTR("CameraStateNearby"));
    v11 = 1;
  }
  else
  {
    -[SDNearbyAgent _enableEnhancedDiscovery:useCase:](self, "_enableEnhancedDiscovery:useCase:", CFSTR("CameraStateUsable"), 131078);
    v11 = 2;
  }
  -[SDNearbyAgent _postNotificationForWombatState:](self, "_postNotificationForWombatState:", v11);
LABEL_26:
  -[SDNearbyAgent _update](self, "_update");
}

- (void)_useLuxValue
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001F7DC4;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_checkBrightnessLuxValue
{
  void *v3;
  objc_class *v4;
  BrightnessSystemClient *v5;
  BrightnessSystemClient *brightnessSystemClient;
  void *v12;
  void *v13;
  BrightnessSystemClient *v14;
  id v15;
  float v16;
  float v17;
  _QWORD v18[5];
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (!self->_brightnessSystemClient)
  {
    v20 = 0;
    v21 = &v20;
    v22 = 0x2050000000;
    v3 = (void *)qword_1007C6E10;
    v23 = qword_1007C6E10;
    if (!qword_1007C6E10)
    {
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1002083CC;
      v19[3] = &unk_100714258;
      v19[4] = &v20;
      sub_1002083CC((uint64_t)v19);
      v3 = (void *)v21[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v20, 8);
    v5 = (BrightnessSystemClient *)objc_alloc_init(v4);
    brightnessSystemClient = self->_brightnessSystemClient;
    self->_brightnessSystemClient = v5;

    self->_supportsRearLux = MGGetBoolAnswer(CFSTR("RearALSCapability"));
  }
  __asm { FMOV            V0.2S, #-1.0 }
  *(_QWORD *)&self->_alsLuxValue = _D0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", CFSTR("Lux")));
  v13 = v12;
  if (self->_supportsRearLux)
    objc_msgSend(v12, "addObject:", CFSTR("RLuxOutput"));
  -[BrightnessSystemClient setProperty:forKey:](self->_brightnessSystemClient, "setProperty:forKey:", &__kCFBooleanTrue, CFSTR("ActivateALS"));
  v14 = self->_brightnessSystemClient;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1001F8184;
  v18[3] = &unk_100714AD8;
  v18[4] = self;
  -[BrightnessSystemClient registerNotificationBlock:forProperties:](v14, "registerNotificationBlock:forProperties:", v18, v13);
  if (self->_supportsRearLux)
    -[BrightnessSystemClient setProperty:forKey:](self->_brightnessSystemClient, "setProperty:forKey:", &off_10074BCD0, CFSTR("RLuxSampleWithMaxAge"));
  if (dword_1007B3A28 <= 30 && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _checkBrightnessLuxValue]", 30, "Registered notification for lux properties %@\n", v13);
  v15 = -[BrightnessSystemClient copyPropertyForKey:](self->_brightnessSystemClient, "copyPropertyForKey:", CFSTR("Lux"));
  objc_msgSend(v15, "floatValue");
  v17 = v16;

  if (dword_1007B3A28 <= 30 && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _checkBrightnessLuxValue]", 30, "Current ALS lux value: %f\n", v17);
  if (v17 >= 0.0)
  {
    self->_alsLuxValue = v17;
    -[SDNearbyAgent _useLuxValue](self, "_useLuxValue");
  }

}

- (void)_registerForWombatActivityNotification
{
  NSObject *dispatchQueue;
  _QWORD handler[5];

  if (self->_wombatActivityToken == -1)
  {
    dispatchQueue = self->_dispatchQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1001F8440;
    handler[3] = &unk_100714EC8;
    handler[4] = self;
    notify_register_dispatch("com.apple.rapport.wombat-activity", &self->_wombatActivityToken, dispatchQueue, handler);
  }
}

- (void)_unregisterForWombatActivityNotification
{
  int wombatActivityToken;

  wombatActivityToken = self->_wombatActivityToken;
  if (wombatActivityToken != -1)
  {
    notify_cancel(wombatActivityToken);
    self->_wombatActivityToken = -1;
  }
}

- (void)_discoverySessionStateChange:(BOOL)a3
{
  _BOOL4 inDiscoverySession;
  _BOOL4 v4;
  SDNearbyAgent *v5;
  const char *v6;
  const char *v7;

  inDiscoverySession = self->_inDiscoverySession;
  if (inDiscoverySession != a3)
  {
    v4 = a3;
    v5 = self;
    if (dword_1007B3A28 <= 30)
    {
      if (dword_1007B3A28 != -1)
      {
LABEL_4:
        v6 = "yes";
        if (inDiscoverySession)
          v7 = "yes";
        else
          v7 = "no";
        if (!v4)
          v6 = "no";
        self = (SDNearbyAgent *)LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _discoverySessionStateChange:]", 30, "Discovery session state changed %s -> %s\n", v7, v6);
        goto LABEL_11;
      }
      self = (SDNearbyAgent *)_LogCategory_Initialize(&dword_1007B3A28, 30);
      if ((_DWORD)self)
      {
        inDiscoverySession = v5->_inDiscoverySession;
        goto LABEL_4;
      }
    }
LABEL_11:
    v5->_inDiscoverySession = v4;
    if (SFDeviceClassCodeGet(self, a2) != 6)
      -[SDNearbyAgent _bleNearbyInfoAdvertiserUpdate](v5, "_bleNearbyInfoAdvertiserUpdate");
  }
}

- (void)_cancelDonStateRetryTimers
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_donStateRetryTimerDictionary, "allKeys", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        v9 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_donStateRetryTimerDictionary, "objectForKeyedSubscript:", v8));
        v10 = v9;
        if (v9)
        {
          dispatch_source_cancel(v9);

        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_donStateRetryTimerDictionary, "setObject:forKeyedSubscript:", 0, v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (void)_deliverDonnedEventToDevice:(id)a3 allowRetry:(BOOL)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  SDNearbyAgent *v13;
  BOOL v14;

  v6 = a3;
  v7 = objc_alloc_init((Class)RPCompanionLinkClient);
  objc_msgSend(v7, "setDispatchQueue:", self->_dispatchQueue);
  objc_msgSend(v7, "setUseCase:", 131100);
  objc_msgSend(v7, "setControlFlags:", 6291712);
  objc_msgSend(v7, "setDestinationDevice:", v6);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001F87F4;
  v10[3] = &unk_10071B400;
  v14 = a4;
  v11 = v7;
  v12 = v6;
  v13 = self;
  v8 = v6;
  v9 = v7;
  objc_msgSend(v9, "activateWithCompletion:", v10);

}

- (void)_deliverDonnedEventsStart
{
  RPCompanionLinkClient *activeWatchDiscovery;
  RPCompanionLinkClient *v4;
  RPCompanionLinkClient *v5;
  RPCompanionLinkClient *v6;
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];

  if (-[SDNearbyAgent _idsWatchCount](self, "_idsWatchCount") >= 1)
  {
    activeWatchDiscovery = self->_activeWatchDiscovery;
    if (activeWatchDiscovery)
      -[RPCompanionLinkClient invalidate](activeWatchDiscovery, "invalidate");
    v4 = (RPCompanionLinkClient *)objc_alloc_init((Class)RPCompanionLinkClient);
    v5 = self->_activeWatchDiscovery;
    self->_activeWatchDiscovery = v4;

    -[RPCompanionLinkClient setControlFlags:](self->_activeWatchDiscovery, "setControlFlags:", 2);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1001F8D08;
    v9[3] = &unk_100714A48;
    v9[4] = self;
    -[RPCompanionLinkClient setDeviceFoundHandler:](self->_activeWatchDiscovery, "setDeviceFoundHandler:", v9);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1001F8DFC;
    v8[3] = &unk_100714A48;
    v8[4] = self;
    -[RPCompanionLinkClient setDeviceLostHandler:](self->_activeWatchDiscovery, "setDeviceLostHandler:", v8);
    v6 = self->_activeWatchDiscovery;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1001F8E4C;
    v7[3] = &unk_1007147C8;
    v7[4] = self;
    -[RPCompanionLinkClient activateWithCompletion:](v6, "activateWithCompletion:", v7);
  }
}

- (void)_deliverDoffedEvent
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id obj;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  SDNearbyAgent *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  -[SDNearbyAgent _invalidateWatchDiscoveryIfNeeded](self, "_invalidateWatchDiscoveryIfNeeded");
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](self->_deliveredDonnedIdentifiers, "allObjects"));
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v19;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v19 != v5)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)v6);
        v8 = objc_alloc_init((Class)RPCompanionLinkClient);
        objc_msgSend(v8, "setDispatchQueue:", self->_dispatchQueue);
        objc_msgSend(v8, "setUseCase:", 131100);
        objc_msgSend(v8, "setControlFlags:", 6291712);
        v9 = objc_alloc_init((Class)RPCompanionLinkDevice);
        objc_msgSend(v9, "setIdentifier:", v7);
        objc_msgSend(v8, "setDestinationDevice:", v9);
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_1001F90C0;
        v13[3] = &unk_10071B428;
        v14 = v8;
        v15 = v7;
        v16 = self;
        v17 = v9;
        v10 = v9;
        v11 = v8;
        objc_msgSend(v11, "activateWithCompletion:", v13);

        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v4);
  }

}

- (void)_handleRetryTimerForDevice:(id)a3
{
  void *v4;
  NSObject *v5;
  NSObject *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "idsDeviceIdentifier"));
  v5 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_donStateRetryTimerDictionary, "objectForKeyedSubscript:", v4));
  v6 = v5;
  if (v5)
  {
    dispatch_source_cancel(v5);

  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_donStateRetryTimerDictionary, "setObject:forKeyedSubscript:", 0, v4);
  if (dword_1007B3A28 <= 30 && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _handleRetryTimerForDevice:]", 30, "Retrying to send DONNED state to %@\n", v7);
  -[SDNearbyAgent _deliverDonnedEventToDevice:allowRetry:](self, "_deliverDonnedEventToDevice:allowRetry:", v7, 0);

}

- (void)_invalidateWatchDiscoveryIfNeeded
{
  RPCompanionLinkClient *activeWatchDiscovery;

  if (!-[NSMutableSet count](self->_deliveredDonnedIdentifiers, "count"))
  {
    -[RPCompanionLinkClient invalidate](self->_activeWatchDiscovery, "invalidate");
    activeWatchDiscovery = self->_activeWatchDiscovery;
    self->_activeWatchDiscovery = 0;

  }
}

- (BOOL)_shouldDeliverDonStateUpdates
{
  return GestaltGetDeviceClass(self, a2) == 11 || self->_simulateDonStateChanges;
}

- (void)_updateDonState
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (-[CUSystemMonitor screenOn](self->_systemMonitor, "screenOn"))
    -[SDNearbyAgent _deliverDonnedEventsStart](self, "_deliverDonnedEventsStart");
  else
    -[SDNearbyAgent _deliverDoffedEvent](self, "_deliverDoffedEvent");
}

- (void)nearby:(id)a3 didConnectToPeer:(id)a4 transport:(int64_t)a5 error:(id)a6
{
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  NSMutableDictionary *bleConnections;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;

  v18 = a4;
  v8 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v18)
  {
    v9 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_bleConnections, "objectForKeyedSubscript:"));
    if (v9)
    {
      v10 = (id)v9;
      if (v8)
      {
        if (dword_1007B3A28 <= 50
          && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 50)))
        {
          LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent nearby:didConnectToPeer:transport:error:]", 50, "### Connect to existing %@ failed %@\n", v18, v8);
        }
      }
      else if (dword_1007B3A28 <= 30
             && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
      {
        LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent nearby:didConnectToPeer:transport:error:]", 30, "Connect to existing %@ succeeded\n", v18);
      }
    }
    else if (v8)
    {
      if (dword_1007B3A28 <= 50
        && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 50)))
      {
        LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent nearby:didConnectToPeer:transport:error:]", 50, "### Connect to new %@ failed %@\n", v18, v8);
      }
      v10 = 0;
    }
    else
    {
      if (dword_1007B3A28 <= 30
        && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
      {
        LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent nearby:didConnectToPeer:transport:error:]", 30, "Connect to new %@ succeeded\n", v18);
      }
      v11 = objc_alloc_init((Class)SFBLEDevice);
      objc_msgSend(v11, "setIdentifier:", v18);
      v10 = objc_msgSend(objc_alloc((Class)SFBLEConnection), "initWithDevice:acceptor:", v11, 1);
      objc_msgSend(v10, "setDispatchQueue:", self->_dispatchQueue);
      bleConnections = self->_bleConnections;
      if (!bleConnections)
      {
        v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        v14 = self->_bleConnections;
        self->_bleConnections = v13;

        bleConnections = self->_bleConnections;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](bleConnections, "setObject:forKeyedSubscript:", v10, v18);
      objc_msgSend(v10, "addClient:", self);
      objc_msgSend(v10, "activateDirect");

    }
    v15 = objc_alloc_init((Class)NSMutableDictionary);
    v16 = v15;
    if (v8)
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v8, CFSTR("SDBluetoothNotificationKeyError"));
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v18, CFSTR("SDBluetoothNotificationKeyPeerIdentifier"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v17, "postNotificationName:object:userInfo:", CFSTR("SDNotificationNameNearbyBLEConnected"), self, v16);

  }
  else if (dword_1007B3A28 <= 60
         && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 60)))
  {
    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent nearby:didConnectToPeer:transport:error:]", 60, "### DidConnect with NULL peer, error %@\n", v8);
  }

}

- (void)nearby:(id)a3 didDisconnectFromPeer:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  uint64_t v16;
  void *v17;
  void *v18;
  unsigned int v19;
  id v20;
  id v21;
  uint64_t v22;
  void *j;
  void *v24;
  void *v25;
  void (**v26)(_QWORD, _QWORD, _QWORD);
  void *v27;
  void (**v28)(_QWORD, _QWORD);
  NSString *v29;
  uint64_t v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  uint64_t v38;
  void *k;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void (**v47)(_QWORD, _QWORD);
  id v48;
  void *v49;
  void *v50;
  void *v51;
  NSMutableDictionary *obj;
  NSMutableDictionary *v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  NSErrorUserInfoKey v67;
  const __CFString *v68;
  _BYTE v69[128];
  NSErrorUserInfoKey v70;
  const __CFString *v71;
  _BYTE v72[128];
  _BYTE v73[128];

  v7 = a4;
  v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v8)
  {
    if (dword_1007B3A28 <= 50
      && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 50)))
    {
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent nearby:didDisconnectFromPeer:error:]", 50, "### Disconnect from %@, error %@\n", v7, v8);
    }
  }
  else if (dword_1007B3A28 <= 30
         && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
  {
    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent nearby:didDisconnectFromPeer:error:]", 30, "Disconnect from %@ success\n", v7);
  }
  v54 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_bleConnections, "objectForKeyedSubscript:", v7));
  v10 = v9;
  if (v9 && (objc_msgSend(v9, "removeClient:", self) & 1) == 0)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_bleConnections, "removeObjectForKey:", v7);
    objc_msgSend(v10, "invalidate");
  }
  v51 = v10;
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_setupSessions, "allKeys"));
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v64;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v64 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * (_QWORD)i);
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_setupSessions, "objectForKeyedSubscript:", v16));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "peerIdentifier"));
        v19 = objc_msgSend(v18, "isEqual:", v7);

        if (v19)
        {
          if (dword_1007B3A28 <= 30
            && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
          {
            LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent nearby:didDisconnectFromPeer:error:]", 30, "Removing session %@ on disconnect from peer %@\n", v16, v7);
          }
          -[NSMutableDictionary removeObjectForKey:](self->_setupSessions, "removeObjectForKey:", v16);
        }

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
    }
    while (v13);
  }

  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  obj = self->_services;
  v20 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v60;
    do
    {
      for (j = 0; j != v21; j = (char *)j + 1)
      {
        if (*(_QWORD *)v60 != v22)
          objc_enumerationMutation(obj);
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_services, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)j)));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "peerDisconnectedHandler"));

        if (v25)
        {
          v26 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "peerDisconnectedHandler"));
          ((void (**)(_QWORD, id, id))v26)[2](v26, v7, v54);

        }
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "errorHandler"));

        if (v27)
        {
          v28 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "errorHandler"));
          v70 = NSLocalizedDescriptionKey;
          v29 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", DebugGetErrorString(4294960543, 0, 0));
          v30 = objc_claimAutoreleasedReturnValue(v29);
          v31 = (void *)v30;
          v32 = CFSTR("?");
          if (v30)
            v32 = (const __CFString *)v30;
          v71 = v32;
          v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v71, &v70, 1));
          v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, -6753, v33));
          ((void (**)(_QWORD, void *))v28)[2](v28, v34);

        }
      }
      v21 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v59, v72, 16);
    }
    while (v21);
  }

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v53 = self->_sessions;
  v35 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v53, "countByEnumeratingWithState:objects:count:", &v55, v69, 16);
  v36 = v54;
  if (v35)
  {
    v37 = v35;
    v38 = *(_QWORD *)v56;
    do
    {
      for (k = 0; k != v37; k = (char *)k + 1)
      {
        if (*(_QWORD *)v56 != v38)
          objc_enumerationMutation(v53);
        v40 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_sessions, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * (_QWORD)k)));
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "peerDevice"));
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "identifier"));

        if (objc_msgSend(v42, "isEqual:", v7))
        {
          v67 = NSLocalizedDescriptionKey;
          v68 = CFSTR("kConnectionErr");
          v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1));
          v44 = objc_msgSend(v43, "mutableCopy");

          if (v36)
            objc_msgSend(v44, "setObject:forKeyedSubscript:", v36, NSUnderlyingErrorKey);
          v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, -6753, v44));
          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "errorHandler"));

          if (v46)
          {
            v47 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "errorHandler"));
            ((void (**)(_QWORD, void *))v47)[2](v47, v45);

          }
          v36 = v54;
        }

      }
      v37 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v53, "countByEnumeratingWithState:objects:count:", &v55, v69, 16);
    }
    while (v37);
  }

  v48 = objc_alloc_init((Class)NSMutableDictionary);
  v49 = v48;
  if (v36)
    objc_msgSend(v48, "setObject:forKeyedSubscript:", v36, CFSTR("SDBluetoothNotificationKeyError"));
  objc_msgSend(v49, "setObject:forKeyedSubscript:", v7, CFSTR("SDBluetoothNotificationKeyPeerIdentifier"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v50, "postNotificationName:object:userInfo:", CFSTR("SDNotificationNameNearbyBLEDisconnected"), self, v49);

}

- (void)nearby:(id)a3 didReceiveData:(id)a4 fromPeer:(id)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a4;
  v7 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v7)
  {
    if (dword_1007B3A28 <= 30
      && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
    {
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent nearby:didReceiveData:fromPeer:]", 30, "Received data from %@: %'.32@ (%ld bytes)\n", v7, v10, objc_msgSend(v10, "length"));
    }
    v8 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_bleConnections, "objectForKeyedSubscript:", v7));
    if (v8)
    {
      v9 = (void *)v8;
      -[SDNearbyAgent _bleNearbyInfoReceivedData:cnx:peer:](self, "_bleNearbyInfoReceivedData:cnx:peer:", v10, v8, v7);

    }
    else if (dword_1007B3A28 <= 50
           && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 50)))
    {
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent nearby:didReceiveData:fromPeer:]", 50, "### No connection for received data from %@\n", v7);
    }
  }
  else if (dword_1007B3A28 <= 60
         && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 60)))
  {
    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent nearby:didReceiveData:fromPeer:]", 60, "### DidReceiveData with NULL peer\n");
  }

}

- (void)nearbyDidUpdateState:(id)a3
{
  NSObject *dispatchQueue;
  id v5;
  unint64_t v6;
  const char *v7;
  NSMutableDictionary *sessions;
  _QWORD v9[5];

  dispatchQueue = self->_dispatchQueue;
  v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  v6 = (unint64_t)objc_msgSend(v5, "state");

  if (dword_1007B3A28 <= 40 && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 40)))
  {
    if (v6 > 5)
      v7 = "?";
    else
      v7 = off_10071BD78[v6];
    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent nearbyDidUpdateState:]", 40, "Bluetooth state updated: %s\n", v7);
  }
  sessions = self->_sessions;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001FA138;
  v9[3] = &unk_10071B448;
  v9[4] = v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](sessions, "enumerateKeysAndObjectsUsingBlock:", v9);
}

- (void)coordinatedAlertRequestStart:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  int DeviceClass;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (**v13)(_QWORD, _QWORD, _QWORD, _QWORD);
  uint64_t v14;
  NSMutableSet *caRequests;
  NSMutableSet *v16;
  NSMutableSet *v17;
  uint64_t caMessageNoScans;
  char v19;
  _BOOL4 caScanIfHasVisionOS1;
  void *v21;
  void (**v22)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  int v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  unsigned __int8 v37;
  id v38;
  _BOOL4 v39;
  void *v40;
  void *v41;
  void *v42;
  unsigned int v43;
  _QWORD v44[8];
  _QWORD v45[8];
  _QWORD v46[2];
  _QWORD v47[2];

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1007B3A28 <= 50)
  {
    if (dword_1007B3A28 != -1 || (v5 = _LogCategory_Initialize(&dword_1007B3A28, 50), (_DWORD)v5))
      v5 = LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent coordinatedAlertRequestStart:]", 50, "CoordinatedAlert: start\n");
  }
  if (!self->_caEnabled)
  {
    if (dword_1007B3A28 <= 50
      && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 50)))
    {
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent coordinatedAlertRequestStart:]", 50, "CoordinatedAlert: skipping when disabled\n");
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "completionHandler"));

    v10 = 0;
    v11 = 0;
    v8 = 0;
    v12 = 0;
    v43 = 1;
    if (!v9)
      goto LABEL_51;
LABEL_50:
    v22 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "completionHandler"));
    v22[2](v22, 0, 1, 0);

    v8 = v10;
    v12 = v11;
    goto LABEL_51;
  }
  DeviceClass = GestaltGetDeviceClass(v5, v6);
  v8 = 1;
  if (objc_msgSend(v4, "type") != (id)6)
    goto LABEL_39;
  if (DeviceClass != 1 && DeviceClass != 100)
  {
    if (dword_1007B3A28 <= 50
      && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 50)))
    {
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent coordinatedAlertRequestStart:]", 50, "CoordinatedAlert: skipping Oneness coordinated alert on unsupported platform.\n");
    }
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "completionHandler"));

    if (v8)
    {
      v13 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "completionHandler"));
      v13[2](v13, 0, 0, 0);

      v8 = 0;
    }
  }
  if (DeviceClass == 100 || DeviceClass == 1)
  {
LABEL_39:
    if (!self->_caSingleDevice
      && (!-[SDNearbyAgent idsIsSignedIn](self, "idsIsSignedIn")
       || -[SDNearbyAgent _idsContinuityDeviceCount](self, "_idsContinuityDeviceCount") <= 0))
    {
      if (dword_1007B3A28 <= 50
        && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 50)))
      {
        LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent coordinatedAlertRequestStart:]", 50, "CoordinatedAlert: always alerting when no other devices registered\n");
      }
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "completionHandler"));

      v10 = 0;
      v11 = 0;
      v43 = 0;
      v8 = 0;
      v12 = 0;
      if (!v21)
        goto LABEL_51;
      goto LABEL_50;
    }
  }
  if (!(_DWORD)v8)
  {
    v12 = 0;
    v43 = 0;
LABEL_51:
    if (objc_msgSend(v4, "type") != (id)1)
    {
LABEL_54:
      v44[0] = CFSTR("eventType");
      v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v4, "type")));
      v45[0] = v42;
      v44[1] = CFSTR("activityLevel");
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v43));
      v45[1] = v26;
      v45[2] = &off_10074BF88;
      v44[2] = CFSTR("otherDevicesCount");
      v44[3] = CFSTR("bestIsMe");
      v45[3] = &__kCFBooleanTrue;
      v44[4] = CFSTR("skipScanBcPhoneCall");
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v8));
      v45[4] = v27;
      v44[5] = CFSTR("skipScanBcVeryActive");
      v28 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v12));
      v29 = v12;
      v30 = v4;
      v31 = v8;
      v32 = (void *)v28;
      v45[5] = v28;
      v44[6] = CFSTR("MsgScans");
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_caMessageScans));
      v45[6] = v33;
      v44[7] = CFSTR("MsgNoScans");
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_caMessageNoScans));
      v45[7] = v34;
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v45, v44, 8));
      SFMetricsLog(CFSTR("com.apple.sharing.Coordinated.AlertResult"), v35);

      v36 = v31;
      v4 = v30;

      if (dword_1007B3A28 <= 50
        && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 50)))
      {
        LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent coordinatedAlertRequestStart:]", 50, "CA: Start, type %ld, level %d, devices %d, best %d, skipP %d, skipA %d, scans %u, noScans %u", objc_msgSend(v30, "type"), v43, -1, 1, v36, v29, self->_caMessageScans, self->_caMessageNoScans);
      }
      goto LABEL_58;
    }
    v19 = 0;
    caMessageNoScans = self->_caMessageNoScans + 1;
    self->_caMessageNoScans = caMessageNoScans;
LABEL_53:
    v46[0] = CFSTR("noScans");
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", caMessageNoScans));
    v46[1] = CFSTR("scans");
    v47[0] = v23;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_caMessageScans));
    v47[1] = v24;
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v47, v46, 2));
    SFPowerLogEvent(CFSTR("CoordinatedAlertiMessage"), v25);

    if ((v19 & 1) != 0)
      goto LABEL_58;
    goto LABEL_54;
  }
  if (!self->_caPhoneCalls && objc_msgSend(v4, "type") == (id)2)
  {
    v14 = SFIsDevicePhone();
    if ((v14 & 1) != 0 || SFDeviceIsRealityDevice(v14))
    {
      if (dword_1007B3A28 <= 50
        && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 50)))
      {
        LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent coordinatedAlertRequestStart:]", 50, "CoordinatedAlert: always alerting for phone calls\n");
      }
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "completionHandler"));

      v11 = 0;
      v43 = 0;
      v12 = 0;
      v10 = 1;
      v8 = 1;
      if (!v41)
        goto LABEL_51;
      goto LABEL_50;
    }
  }
  if (self->_caScanIfVeryActive)
  {
    v43 = 0;
    goto LABEL_34;
  }
  v43 = -[SDNearbyAgent _activityMonitorCurrentLevelAndNeedsPoll:recentUserActivity:](self, "_activityMonitorCurrentLevelAndNeedsPoll:recentUserActivity:", 0, 0);
  if (-[SDNearbyAgent _idsVisionOS2OrHigherCount](self, "_idsVisionOS2OrHigherCount") < 1)
  {
    caScanIfHasVisionOS1 = 0;
  }
  else if (-[SDNearbyAgent _idsVisionOS1Count](self, "_idsVisionOS1Count"))
  {
    caScanIfHasVisionOS1 = self->_caScanIfHasVisionOS1;
  }
  else
  {
    caScanIfHasVisionOS1 = 1;
  }
  v37 = -[CUBluetoothClient statusFlags](self->_btConnectedDeviceMonitor, "statusFlags");
  v38 = objc_msgSend(v4, "type");
  v39 = (v37 & 1) == 0 && caScanIfHasVisionOS1;
  if (v38 != (id)2)
    v39 = 0;
  if (v43 != 14)
    v39 = 0;
  if (v43 >= 0xB && !v39)
  {
    if (dword_1007B3A28 <= 50
      && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 50)))
    {
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent coordinatedAlertRequestStart:]", 50, "CoordinatedAlert: skipping when very active\n");
    }
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "completionHandler"));

    v10 = 0;
    v8 = 0;
    v11 = 1;
    v12 = 1;
    if (!v40)
      goto LABEL_51;
    goto LABEL_50;
  }
  if (v39)
  {
    if (dword_1007B3A28 <= 50
      && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 50)))
    {
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent coordinatedAlertRequestStart:]", 50, "CoordinatedAlert: scanning due to visionOS 2.0 or above on account\n");
    }
    v43 = 14;
  }
LABEL_34:
  caRequests = self->_caRequests;
  if (!caRequests)
  {
    v16 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v17 = self->_caRequests;
    self->_caRequests = v16;

    caRequests = self->_caRequests;
  }
  -[NSMutableSet addObject:](caRequests, "addObject:", v4);
  -[SDNearbyAgent _update](self, "_update");
  if (objc_msgSend(v4, "type") == (id)1)
  {
    v8 = 0;
    v12 = 0;
    ++self->_caMessageScans;
    caMessageNoScans = self->_caMessageNoScans;
    v19 = 1;
    goto LABEL_53;
  }
LABEL_58:

}

- (void)coordinatedAlertRequestFinish:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSMutableDictionary *v9;
  id v10;
  id v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unsigned int v23;
  unint64_t v24;
  const char *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  id DeviceClass;
  uint64_t v31;
  const char *v32;
  const char *v33;
  unsigned int v34;
  const char *v35;
  const char *v36;
  const char *v37;
  const char *v38;
  int v39;
  const char *v40;
  id v41;
  BOOL v42;
  uint64_t v43;
  id v44;
  int caForce;
  const char *v46;
  int v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char v62;
  BOOL v63;
  void *v64;
  NSMutableDictionary *obj;
  int obja;
  uint64_t v67;
  void *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _QWORD v73[8];
  _QWORD v74[8];
  _BYTE v75[128];

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v64 = v4;
  if (objc_msgSend(v4, "type") == (id)1)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[SDNearbyAgent _idsBluetoothDeviceIDsForiMessage](self, "_idsBluetoothDeviceIDsForiMessage"));
    goto LABEL_9;
  }
  if (objc_msgSend(v4, "type") == (id)3)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[SDNearbyAgent _idsBluetoothDeviceIDsForSMSRelay](self, "_idsBluetoothDeviceIDsForSMSRelay"));
    goto LABEL_9;
  }
  if (objc_msgSend(v4, "type") == (id)4)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[SDNearbyAgent _idsBluetoothDeviceIDsForAnnouncements](self, "_idsBluetoothDeviceIDsForAnnouncements"));
    goto LABEL_9;
  }
  if (objc_msgSend(v4, "type") == (id)6)
  {
    v5 = objc_claimAutoreleasedReturnValue(-[SDNearbyAgent _idsBluetoothDeviceIDsForOneness](self, "_idsBluetoothDeviceIDsForOneness"));
LABEL_9:
    v6 = (void *)v5;
    if (v5)
      goto LABEL_11;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent _idsBluetoothDeviceIDsForSharing](self, "_idsBluetoothDeviceIDsForSharing"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v7));

  v4 = v64;
LABEL_11:
  v8 = -[SDNearbyAgent _activityMonitorCurrentLevelAndNeedsPoll:recentUserActivity:](self, "_activityMonitorCurrentLevelAndNeedsPoll:recentUserActivity:", 0, 0);
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v9 = self->_bleNearbyInfoDevices;
  v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v69, v75, 16);
  v67 = v8;
  v68 = v6;
  if (v10)
  {
    v11 = v10;
    obj = v9;
    v12 = 0;
    v61 = (char)v8;
    v62 = 1;
    v13 = v8;
    v14 = *(_QWORD *)v70;
    v59 = v13;
    v60 = v13;
    while (1)
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v70 != v14)
          objc_enumerationMutation(obj);
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_bleNearbyInfoDevices, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v69 + 1) + 8 * (_QWORD)v15)));
        if (objc_msgSend(v16, "decryptedActivityLevel") == 16)
          v17 = 0;
        else
          v17 = objc_msgSend(v16, "decryptedActivityLevel");
        v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "identifier"));
        v19 = (void *)v18;
        if (!v6 || v18 && (objc_msgSend(v6, "containsObject:", v18) & 1) != 0)
        {
          if ((_DWORD)v17 == 14)
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent idsDeviceForBluetoothDeviceID:conflictDetected:](self, "idsDeviceForBluetoothDeviceID:conflictDetected:", v19, 0));
            v21 = v20;
            if (v20)
            {
              v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "productName"));
              v23 = objc_msgSend(v22, "isEqualToString:", CFSTR("xrOS"));

              if (v23)
              {
                v4 = v64;
                if (dword_1007B3A28 <= 50
                  && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 50)))
                {
                  LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent coordinatedAlertRequestFinish:]", 50, "CoordinatedAlert finish: device %@ is visionOS and activity level 0x%02X (%s) indicates it is donned\n", v19, 14, "PhoneCall", v57, v58);
                }
                goto LABEL_91;
              }
              v4 = v64;
            }
          }
          else
          {
            v21 = 0;
          }
          if (objc_msgSend(v4, "type") != (id)6 || (_DWORD)v17 != (_DWORD)v67)
            goto LABEL_53;
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "modelIdentifier"));
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "lowercaseString"));

          DeviceClass = (id)GestaltGetDeviceClass(v28, v29);
          if ((_DWORD)DeviceClass == 100
            && (DeviceClass = objc_msgSend(v27, "containsString:", CFSTR("iphone")), (_DWORD)DeviceClass))
          {
            if (dword_1007B3A28 <= 50
              && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 50)))
            {
              v32 = "?";
              if (v67 <= 0xE)
                v32 = off_10071BE58[v61];
              LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent coordinatedAlertRequestFinish:]", 50, "CoordinatedAlert finish: Oneness phone %@ activity level 0x%02X (%s) equals local mac activity level.\n", v19, v17, v32);
            }
            v62 = 0;
            v39 = 2;
          }
          else
          {
            if (GestaltGetDeviceClass(DeviceClass, v31) != 1
              || (objc_msgSend(v27, "containsString:", CFSTR("mac")) & 1) == 0
              && !objc_msgSend(v27, "containsString:", CFSTR("imac")))
            {

              v4 = v64;
LABEL_53:
              if (v17 <= 9)
              {
                if (dword_1007B3A28 <= 50
                  && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 50)))
                {
                  LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent coordinatedAlertRequestFinish:]", 50, "CoordinatedAlert finish: device %@ activity level too low: 0x%02X (%s)\n", v19, v17, off_10071BDE0[(char)v17]);
                }
                goto LABEL_83;
              }
              if (v17 <= v67)
              {
                if (dword_1007B3A28 <= 50
                  && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 50)))
                {
                  v37 = "?";
                  if (((_DWORD)v17 - 10) <= 4)
                    v37 = off_10071BE30[(char)((_BYTE)v17 - 10)];
                  v38 = "?";
                  if (v67 <= 0xE)
                    v38 = off_10071BE58[v61];
                  v58 = v38;
                  v57 = v60;
                  LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent coordinatedAlertRequestFinish:]", 50, "CoordinatedAlert finish: device %@ activity level 0x%02X (%s) is lower than ours 0x%02X (%s)\n", v19, v17, v37);
                }
              }
              else
              {
                v34 = (_DWORD)v17 - 10;
                if ((_DWORD)v17 != 10
                  || (-[CUBluetoothClient statusFlags](self->_btConnectedDeviceMonitor, "statusFlags") & 1) == 0)
                {
                  if (dword_1007B3A28 <= 50
                    && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 50)))
                  {
                    v35 = "?";
                    if (v34 <= 4)
                      v35 = off_10071BE30[(char)v34];
                    v36 = "?";
                    if (v67 <= 0xE)
                      v36 = off_10071BE58[v61];
                    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent coordinatedAlertRequestFinish:]", 50, "CoordinatedAlert finish: device %@ activity level 0x%02X (%s) is higher than ours 0x%02X (%s)\n", v19, v17, v35, v59, v36);
                  }
LABEL_91:
                  v62 = 0;
                  v39 = 2;
LABEL_92:
                  v12 = 1;
                  goto LABEL_96;
                }
                if (dword_1007B3A28 <= 50
                  && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 50)))
                {
                  v40 = "?";
                  if (v67 <= 0xE)
                    v40 = off_10071BE58[v61];
                  v58 = v40;
                  v57 = v67;
                  LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent coordinatedAlertRequestFinish:]", 50, "CoordinatedAlert finish: device %@ activity level 0x%02X (%s) loses over headphones audible, 0x%02X (%s)\n", v19, 10, "Watch");
                }
              }
LABEL_83:
              v39 = 3;
              goto LABEL_92;
            }
            if (dword_1007B3A28 <= 50
              && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 50)))
            {
              v33 = "?";
              if (v67 <= 0xE)
                v33 = off_10071BE58[v61];
              LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent coordinatedAlertRequestFinish:]", 50, "CoordinatedAlert finish: Oneness mac %@ activity level 0x%02X (%s) equals local phone activity level.\n", v19, v17, v33);
            }
            v39 = 3;
          }

          v12 = 1;
          v4 = v64;
        }
        else
        {
          if (dword_1007B3A28 <= 50
            && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 50)))
          {
            v24 = (unint64_t)objc_msgSend(v4, "type");
            v25 = "?";
            if (v24 <= 6)
              v25 = off_10071BDA8[v24];
            LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent coordinatedAlertRequestFinish:]", 50, "CoordinatedAlert finish: device %@ ignored because its %s is disabled\n", v19, v25);
          }
          v21 = 0;
          v39 = 3;
        }
LABEL_96:

        v6 = v68;
        if (v39 != 3)
          goto LABEL_102;
        v15 = (char *)v15 + 1;
      }
      while (v11 != v15);
      v41 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v69, v75, 16);
      v11 = v41;
      if (!v41)
      {
LABEL_102:

        v8 = v67;
        v42 = v62;
        if ((v12 & 1) != 0)
          goto LABEL_113;
        goto LABEL_105;
      }
    }
  }

  v42 = 1;
LABEL_105:
  if (!-[SDStatusMonitor screenOn](self->_statusMonitor, "screenOn")
    && objc_msgSend(v4, "type") == (id)6
    && GestaltGetDeviceClass(6, v43) == 1)
  {
    if (dword_1007B3A28 <= 50
      && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 50)))
    {
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent coordinatedAlertRequestFinish:]", 50, "CoordinatedAlert finish: Oneness screen off phone found no other devices\n");
    }
    v42 = 0;
  }
LABEL_113:
  v44 = -[NSMutableDictionary count](self->_bleNearbyInfoDevices, "count");
  if (!(_DWORD)v44
    && dword_1007B3A28 <= 50
    && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 50)))
  {
    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent coordinatedAlertRequestFinish:]", 50, "CoordinatedAlert finish: no other devices found\n");
  }
  caForce = self->_caForce;
  if ((caForce & 0x80000000) == 0)
  {
    if (dword_1007B3A28 <= 50)
    {
      if (dword_1007B3A28 != -1
        || (v47 = _LogCategory_Initialize(&dword_1007B3A28, 50), caForce = self->_caForce, v47))
      {
        if (caForce)
          v46 = "yes";
        else
          v46 = "no";
        LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent coordinatedAlertRequestFinish:]", 50, "*** Forcing Coordinated Alert 'bestIsMe' to %s\n", v46);
        caForce = self->_caForce;
      }
    }
    v42 = caForce != 0;
  }
  -[NSMutableSet removeObject:](self->_caRequests, "removeObject:", v4);
  v48 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "completionHandler"));
  v49 = (void *)v48;
  if (v48)
    (*(void (**)(uint64_t, _QWORD, BOOL, _QWORD))(v48 + 16))(v48, 0, v42, 0);
  -[SDNearbyAgent _update](self, "_update");
  v73[0] = CFSTR("eventType");
  v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v4, "type")));
  v74[0] = v50;
  v73[1] = CFSTR("activityLevel");
  v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", v8));
  v74[1] = v51;
  v73[2] = CFSTR("otherDevicesCount");
  obja = (int)v44;
  v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v44));
  v74[2] = v52;
  v73[3] = CFSTR("bestIsMe");
  v63 = v42;
  v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v42));
  v74[3] = v53;
  v74[4] = &__kCFBooleanFalse;
  v73[4] = CFSTR("skipScanBcPhoneCall");
  v73[5] = CFSTR("skipScanBcVeryActive");
  v74[5] = &__kCFBooleanFalse;
  v73[6] = CFSTR("MsgScans");
  v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_caMessageScans));
  v74[6] = v54;
  v73[7] = CFSTR("MsgNoScans");
  v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_caMessageNoScans));
  v74[7] = v55;
  v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v74, v73, 8));
  SFMetricsLog(CFSTR("com.apple.sharing.Coordinated.AlertResult"), v56);

  if (dword_1007B3A28 <= 50 && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 50)))
    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent coordinatedAlertRequestFinish:]", 50, "CA: Finish, type %ld, level %d, devices %d, best %d, skipP %d, skipA %d, scans %u, noScans %u", objc_msgSend(v64, "type"), v67, obja, v63, 0, 0, self->_caMessageScans, self->_caMessageNoScans);

}

- (void)coordinatedAlertRequestCancel:(id)a3
{
  NSObject *dispatchQueue;
  id v5;

  dispatchQueue = self->_dispatchQueue;
  v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  if (dword_1007B3A28 <= 50 && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 50)))
    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent coordinatedAlertRequestCancel:]", 50, "CoordinatedAlert cancel\n");
  -[NSMutableSet removeObject:](self->_caRequests, "removeObject:", v5);
  -[NSMutableSet removeObject:](self->_caRequestsNoScans, "removeObject:", v5);

  -[SDNearbyAgent _update](self, "_update");
}

- (BOOL)isWifiCritical
{
  return -[SDStatusMonitor wirelessCritical](self->_statusMonitor, "wirelessCritical");
}

- (void)_enableEnhancedDiscovery:(id)a3
{
  -[SDNearbyAgent _enableEnhancedDiscovery:useCase:](self, "_enableEnhancedDiscovery:useCase:", a3, 0x20000);
}

- (void)_enableEnhancedDiscovery:(id)a3 useCase:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  NSMutableSet *enhancedDiscoveryUseCases;
  void *v8;
  const char *v9;
  NSMutableSet *v10;
  void *v11;
  void *v12;
  void *v13;
  OS_dispatch_source *v14;
  OS_dispatch_source *enhancedDiscoveryTimer;
  NSObject *v16;
  _QWORD handler[5];
  _QWORD v18[2];
  _QWORD v19[2];

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  if (self->_enhancedDiscoveryShouldRun)
  {
    enhancedDiscoveryUseCases = self->_enhancedDiscoveryUseCases;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v4));
    -[NSMutableSet addObject:](enhancedDiscoveryUseCases, "addObject:", v8);

  }
  else if (-[SDNearbyAgent isWifiCritical](self, "isWifiCritical"))
  {
    if (dword_1007B3A28 <= 30
      && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
    {
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _enableEnhancedDiscovery:useCase:]", 30, "Skip enhanced discovery, WiFi is critical\n");
    }
  }
  else
  {
    if (dword_1007B3A28 <= 30
      && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
    {
      if ((int)v4 >= 0x20000)
      {
        if ((int)v4 >= 327680)
        {
          if ((int)v4 >= 589824)
          {
            if ((int)v4 <= 2147418111)
            {
              switch((_DWORD)v4)
              {
                case 0x90000:
                  v9 = "FindNearbyRemote";
                  break;
                case 0x90001:
                  v9 = "FindNearbyPencil";
                  break;
                case 0xA0000:
                  v9 = "AccessDigitalHomeKey";
                  break;
                default:
LABEL_127:
                  v9 = "?";
                  break;
              }
            }
            else
            {
              switch((int)v4)
              {
                case 2147418112:
                  v9 = "InternalTestNoLockScan";
                  break;
                case 2147418113:
                  v9 = "InternalTestNoScreenOffScan";
                  break;
                case 2147418114:
                  v9 = "InternalTestScanWithNoDups";
                  break;
                case 2147418115:
                  v9 = "InternalTestScanWithDups";
                  break;
                case 2147418116:
                  v9 = "InternalTestScanFor20Seconds";
                  break;
                case 2147418117:
                  v9 = "InternalTestActiveScan";
                  break;
                case 2147418118:
                  v9 = "InternalTestUUIDScan";
                  break;
                case 2147418119:
                  v9 = "InternalTestScanFor10ClockSeconds";
                  break;
                case 2147418120:
                  v9 = "InternalTestScanBoost";
                  break;
                default:
                  goto LABEL_127;
              }
            }
          }
          else if ((int)v4 > 458752)
          {
            switch((int)v4)
            {
              case 524288:
                v9 = "ADPD";
                break;
              case 524289:
                v9 = "ADPDBuffer";
                break;
              case 524290:
                v9 = "MicroLocation";
                break;
              case 524291:
                v9 = "MicroLocationLeech";
                break;
              default:
                if ((_DWORD)v4 == 458753)
                {
                  v9 = "PrecisionFindingFindee";
                }
                else
                {
                  if ((_DWORD)v4 != 458754)
                    goto LABEL_127;
                  v9 = "PrecisionFindingFindeeHighPriority";
                }
                break;
            }
          }
          else
          {
            switch((int)v4)
            {
              case 393216:
                v9 = "CaptiveNetworkJoin";
                break;
              case 393217:
                v9 = "UseCaseSIMTransfer";
                break;
              case 393218:
                v9 = "MacSetup";
                break;
              case 393219:
                v9 = "AppleIDSignIn";
                break;
              case 393220:
                v9 = "AppleIDSignInSettings";
                break;
              default:
                if ((_DWORD)v4 == 327680)
                {
                  v9 = "RapportThirdParty";
                }
                else
                {
                  if ((_DWORD)v4 != 458752)
                    goto LABEL_127;
                  v9 = "PrecisionFindingFinder";
                }
                break;
            }
          }
        }
        else
        {
          switch((int)v4)
          {
            case 131072:
              v9 = "SharingDefault";
              break;
            case 131073:
              v9 = "SharingPhoneAutoUnlock";
              break;
            case 131074:
              v9 = "SharingSiriWatchAuth";
              break;
            case 131075:
              v9 = "SharingMacAutoUnlock";
              break;
            case 131076:
              v9 = "SharingEDTScreenOn";
              break;
            case 131077:
              v9 = "SharingEDTWiFiDisabled";
              break;
            case 131078:
              v9 = "SharingEDTWombatEligibleAsDefaultCamera";
              break;
            case 131079:
              v9 = "SharingEDTWombatCameraPicker";
              break;
            case 131080:
              v9 = "SharingWombatBackground";
              break;
            case 131081:
              v9 = "SharingUniversalControl";
              break;
            case 131082:
              v9 = "SharingPeopleProximity";
              break;
            case 131083:
              v9 = "SharingEDTEnsembleOpenDisplayPrefs";
              break;
            case 131084:
              v9 = "SharingEDTNearbydMotionStopped";
              break;
            case 131085:
              v9 = "SharingDoubleBoostGenericScan";
              break;
            case 131086:
              v9 = "SharingEDTIncomingAdvertisement ";
              break;
            case 131087:
              v9 = "SharingEDTWombatStreamStart";
              break;
            case 131088:
              v9 = "SharingOYAutoUnlock";
              break;
            case 131089:
              goto LABEL_127;
            case 131090:
              v9 = "SharingAirDrop";
              break;
            case 131091:
              v9 = "SharingNearbyInvitationHost";
              break;
            case 131092:
              v9 = "SharingNearbyInvitationParticipant";
              break;
            case 131093:
              v9 = "SharingAirDropAskToAirDrop";
              break;
            case 131094:
              v9 = "SharingAirDropTempIdentity";
              break;
            case 131095:
              v9 = "SharingAirDropNeedsCLink";
              break;
            case 131096:
              v9 = "SharingRemoteWidgetUpdate";
              break;
            case 131097:
              v9 = "SharingCountryCodeUpdate";
              break;
            case 131098:
              v9 = "SharingMacPhoneAutoUnlock";
              break;
            case 131099:
              v9 = "SharingVisionProDiscovery";
              break;
            case 131100:
              v9 = "SharingVisionProStateChange";
              break;
            case 131101:
              v9 = "SharingContinuityScreen";
              break;
            case 131102:
              v9 = "SharingEDTRemoteDisplay";
              break;
            default:
              if ((_DWORD)v4 == 196608)
              {
                v9 = "DigitalIDTSA";
              }
              else
              {
                if ((_DWORD)v4 != 0x40000)
                  goto LABEL_127;
                v9 = "DigitalCarKeyThirdParty";
              }
              break;
          }
        }
      }
      else
      {
        v9 = "Unspecified";
        switch((int)v4)
        {
          case 0:
            break;
          case 1:
            v9 = "HealthKit";
            break;
          case 2:
            v9 = "HomeKit";
            break;
          case 3:
            v9 = "FindMyObjectConnection";
            break;
          case 4:
            v9 = "FindMyObjectConnectionTransient";
            break;
          case 5:
            v9 = "MIDI";
            break;
          case 6:
            v9 = "Continuity";
            break;
          case 7:
            v9 = "InstantHotSpot";
            break;
          case 8:
            v9 = "NearBy";
            break;
          case 9:
            v9 = "Sharing";
            break;
          case 10:
            v9 = "HearingSupport";
            break;
          case 11:
            v9 = "Magnet";
            break;
          case 12:
            v9 = "HID";
            break;
          case 13:
            v9 = "LEA";
            break;
          case 14:
            v9 = "External";
            break;
          case 15:
            v9 = "ExternalMedical";
            break;
          case 16:
            v9 = "ExternalLock";
            break;
          case 17:
            v9 = "ExternalWatch";
            break;
          case 18:
            v9 = "SmartRouting";
            break;
          case 19:
            v9 = "DigitalID";
            break;
          case 20:
            v9 = "DigitalKey";
            break;
          case 21:
            v9 = "DigitalCarKey";
            break;
          case 22:
            v9 = "HeySiri";
            break;
          case 23:
            v9 = "ThirdPartyApp";
            break;
          case 24:
            v9 = "CNJ";
            break;
          default:
            switch((int)v4)
            {
              case 256:
                v9 = "DevicePresenceDetection";
                break;
              case 257:
                v9 = "AudioBox";
                break;
              case 258:
                v9 = "SIMTransfer";
                break;
              case 259:
                v9 = "ProximityScreenOnLeechScan";
                break;
              case 260:
                v9 = "MacMigrate";
                break;
              case 263:
                v9 = "HIDUARTService";
                break;
              case 264:
                v9 = "AccessibilitySwitchControlPairing";
                break;
              case 265:
                v9 = "BaseBandFastConnect";
                break;
              case 266:
                v9 = "SafetyAlerts";
                break;
              case 267:
                v9 = "LECarPlay";
                break;
              case 268:
                v9 = "TCCBluetooth";
                break;
              case 269:
                v9 = "AOPBufferLeech";
                break;
              default:
                goto LABEL_127;
            }
            break;
        }
      }
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _enableEnhancedDiscovery:useCase:]", 30, "Enable enhanced discovery for reason '%@' use case '%s' (0x%x)\n", v6, v9, v4);
    }
    self->_enhancedDiscoveryShouldRun = 1;
    self->_enhancedDiscoveryAdvActive = 1;
    v10 = self->_enhancedDiscoveryUseCases;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v4));
    -[NSMutableSet addObject:](v10, "addObject:", v11);

    v19[0] = v6;
    v18[0] = CFSTR("Reason");
    v18[1] = CFSTR("Enabled");
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_enhancedDiscoveryShouldRun));
    v19[1] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v18, 2));
    SFPowerLogEvent(CFSTR("EnhancedDiscovery"), v13);

    if (!self->_enhancedDiscoveryTimer)
    {
      v14 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
      enhancedDiscoveryTimer = self->_enhancedDiscoveryTimer;
      self->_enhancedDiscoveryTimer = v14;

      v16 = self->_enhancedDiscoveryTimer;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_1001FBFC0;
      handler[3] = &unk_1007146D8;
      handler[4] = self;
      dispatch_source_set_event_handler(v16, handler);
      SFDispatchTimerSet(self->_enhancedDiscoveryTimer, 5.0, -1.0, -10.0);
      dispatch_resume((dispatch_object_t)self->_enhancedDiscoveryTimer);
    }
  }

}

- (void)_enhancedDiscoveryScreenChange:(BOOL)a3
{
  _BOOL4 v3;
  double v5;
  double v6;
  _BOOL4 v7;
  const char *v8;
  const char *v9;

  v3 = a3;
  if (-[SDNearbyAgent _allowEnhancedDiscovery](self, "_allowEnhancedDiscovery"))
  {
    if (!v3)
    {
      -[SDNearbyAgent _disableEnhancedDiscovery:](self, "_disableEnhancedDiscovery:", CFSTR("ScreenOff"));
      return;
    }
    -[SDNearbyAgent _activityMonitorLastUserEventDelta](self, "_activityMonitorLastUserEventDelta");
    v6 = v5;
    v7 = v5 < 5.0 && v5 > 0.0;
    if (dword_1007B3A28 <= 20
      && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 20)))
    {
      v8 = "no";
      if (v7)
        v8 = "yes";
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _enhancedDiscoveryScreenChange:]", 20, "Checking user interaction last user=%.2f, within leeway=%s\n", v6, v8);
    }
    if (v7)
    {
      if (-[SDStatusMonitor wirelessCritical](self->_statusMonitor, "wirelessCritical"))
      {
        if (dword_1007B3A28 <= 40
          && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 40)))
        {
          v9 = "Skip enhanced discovery, wireless is critical\n";
LABEL_26:
          LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _enhancedDiscoveryScreenChange:]", 40, v9);
        }
      }
      else
      {
        if (-[SDNearbyAgent _bleNearbyInfoAdvertiserShouldAdvertise](self, "_bleNearbyInfoAdvertiserShouldAdvertise"))
        {
          -[SDNearbyAgent _enableEnhancedDiscovery:useCase:](self, "_enableEnhancedDiscovery:useCase:", CFSTR("UserInitiatedScreenOn"), 131076);
          return;
        }
        if (dword_1007B3A28 <= 40
          && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 40)))
        {
          v9 = "Skip enhanced discovery, nearbyinfo advertiser is disabled\n";
          goto LABEL_26;
        }
      }
    }
    else if (dword_1007B3A28 <= 40
           && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 40)))
    {
      v9 = "Skip enhanced discovery, not user initiated activity\n";
      goto LABEL_26;
    }
  }
}

- (void)_checkConditionsForEnhancedDiscovery
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  self->_allowEnhancedDiscovery = -1;
  if (-[SDNearbyAgent _allowEnhancedDiscovery](self, "_allowEnhancedDiscovery") < 1)
    -[SDNearbyAgent _unregisterForMagicMountUpdates](self, "_unregisterForMagicMountUpdates");
  else
    -[SDNearbyAgent _registerForMagicMountUpdates](self, "_registerForMagicMountUpdates");
}

- (void)_notifyCameraConfigChange
{
  void *v3;
  void *v4;
  OS_dispatch_source *v5;
  OS_dispatch_source *cameraConfigChangeTimer;
  NSObject *v7;
  _QWORD handler[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[AVCaptureDevice continuityCaptureLastUsedDate](AVCaptureDevice, "continuityCaptureLastUsedDate"));
  if (!v3)
  {
    if (dword_1007B3A28 <= 30
      && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
    {
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _notifyCameraConfigChange]", 30, "Post notification that continuity capture on-boarding completed\n");
    }
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("ContinuityCaptureNotificationOnBoardingComplete"), CFSTR("YES"), 0, 1);

    if (!self->_cameraConfigChangeTimer)
    {
      v5 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
      cameraConfigChangeTimer = self->_cameraConfigChangeTimer;
      self->_cameraConfigChangeTimer = v5;

      v7 = self->_cameraConfigChangeTimer;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_1001FC394;
      handler[3] = &unk_1007146D8;
      handler[4] = self;
      dispatch_source_set_event_handler(v7, handler);
      SFDispatchTimerSet(self->_cameraConfigChangeTimer, 1.0, -1.0, -4.0);
      dispatch_resume((dispatch_object_t)self->_cameraConfigChangeTimer);
    }
  }

}

- (void)_enhancedDiscoveryTimerFired
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  -[SDNearbyAgent _disableEnhancedDiscovery:](self, "_disableEnhancedDiscovery:", CFSTR("TimerFired"));
  -[SDNearbyAgent _update](self, "_update");
}

- (void)deviceDiscoveryRequestStart:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001FC4B0;
  v7[3] = &unk_100714860;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)_deviceDiscoveryRequestStart:(id)a3
{
  id v4;
  NSMutableSet *ddRequests;
  NSMutableSet *v6;
  NSMutableSet *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void (**v15)(_QWORD, _QWORD);
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  unsigned int v26;
  void *v27;
  id v28;
  id v29;
  void (**v30)(_QWORD, _QWORD);
  id v31;
  SDNearbyAgent *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1007B3A28 <= 30 && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _deviceDiscoveryRequestStart:]", 30, "DeviceDiscovery start\n");
  ddRequests = self->_ddRequests;
  if (!ddRequests)
  {
    v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v7 = self->_ddRequests;
    self->_ddRequests = v6;

    ddRequests = self->_ddRequests;
  }
  -[NSMutableSet addObject:](ddRequests, "addObject:", v4);
  if ((objc_msgSend(v4, "discoveryFlags") & 0x20) != 0)
  {
    v10 = objc_claimAutoreleasedReturnValue(-[SDNearbyAgent idsBluetoothDeviceIDsForSharing](self, "idsBluetoothDeviceIDsForSharing"));
LABEL_15:
    v8 = (void *)v10;
    objc_msgSend(v4, "setDeviceFilter:", v10);
    goto LABEL_16;
  }
  if ((objc_msgSend(v4, "discoveryFlags") & 0x100000) != 0)
  {
    v10 = objc_claimAutoreleasedReturnValue(-[SDNearbyAgent _idsBluetoothDeviceIDsForMe](self, "_idsBluetoothDeviceIDsForMe"));
    goto LABEL_15;
  }
  if ((objc_msgSend(v4, "discoveryFlags") & 0x200000) != 0)
  {
    v10 = objc_claimAutoreleasedReturnValue(-[SDNearbyAgent _idsBluetoothDeviceIDsForHomePods](self, "_idsBluetoothDeviceIDsForHomePods"));
    goto LABEL_15;
  }
  if ((objc_msgSend(v4, "discoveryFlags") & 0x1000000) == 0)
    goto LABEL_17;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "approveBluetoothIDs"));
  objc_msgSend(v4, "setDeviceFilter:", v9);

LABEL_16:
LABEL_17:
  v32 = self;
  if ((objc_msgSend(v4, "discoveryFlags") & 0x10) != 0)
  {
    v12 = -[SFBLEScanner scanState](self->_bleNearbyActionScanner, "scanState");
    self->_ddNearbyActionEnabled = 1;
    if (objc_msgSend(v4, "overrideScreenOff"))
      self->_ddNearbyActionScreenOff = 1;
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deviceFoundHandler"));

    if (!v11)
      goto LABEL_36;
    v13 = 424;
    goto LABEL_35;
  }
  if ((objc_msgSend(v4, "discoveryFlags") & 1) != 0)
  {
    v12 = -[SFBLEScanner scanState](self->_bleNearbyInfoScanner, "scanState");
    self->_ddNearbyInfoEnabled = 1;
    if (objc_msgSend(v4, "overrideScreenOff"))
      self->_ddNearbyInfoScreenOff = 1;
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deviceFoundHandler"));

    if (!v11)
      goto LABEL_36;
    v13 = 440;
    goto LABEL_35;
  }
  if ((objc_msgSend(v4, "discoveryFlags") & 2) == 0)
  {
    v11 = 0;
    goto LABEL_39;
  }
  v12 = -[SFBLEScanner scanState](self->_bleProximityPairingScanner, "scanState");
  if (!objc_msgSend(v4, "rssiThreshold"))
    objc_msgSend(v4, "setRssiThreshold:", -60);
  self->_ddProximityPairingEnabled = 1;
  if (objc_msgSend(v4, "overrideScreenOff"))
    self->_ddProximityPairingScreenOff = 1;
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deviceFoundHandler"));

  if (v11)
  {
    v13 = 456;
LABEL_35:
    v11 = *(id *)((char *)&self->super.isa + v13);
  }
LABEL_36:
  if (v12)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "scanStateChangedHandler"));

    if (v14)
    {
      v15 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "scanStateChangedHandler"));
      ((void (**)(_QWORD, id))v15)[2](v15, v12);

    }
  }
LABEL_39:
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v16 = v11;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v34;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v34 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", v21));
        if (v22)
        {
          v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deviceFilter"));
          if (!v23
            || (v24 = (void *)v23,
                v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deviceFilter")),
                v26 = objc_msgSend(v25, "containsObject:", v21),
                v25,
                v24,
                v26))
          {
            if (objc_msgSend(v4, "rssiThreshold")
              && (v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "bleDevice")),
                  v28 = objc_msgSend(v27, "rssi"),
                  v29 = objc_msgSend(v4, "rssiThreshold"),
                  v27,
                  (uint64_t)v28 < (uint64_t)v29))
            {
              if (dword_1007B3A28 <= 10
                && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 10)))
              {
                LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _deviceDiscoveryRequestStart:]", 10, "Skip reporting device found %@ with low RSSI to %@\n", v22, v4);
              }
            }
            else
            {
              v30 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deviceFoundHandler"));
              ((void (**)(_QWORD, void *))v30)[2](v30, v22);

            }
          }
        }

        v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      v31 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      v18 = v31;
    }
    while (v31);
  }

  if (objc_msgSend(v4, "fastScanMode") == (id)1)
    -[SDNearbyAgent _deviceDiscoveryFastScanStart:device:reason:](v32, "_deviceDiscoveryFastScanStart:device:reason:", v4, 0, CFSTR("Start"));
  -[SDNearbyAgent _update](v32, "_update");

}

- (void)deviceDiscoveryRequestStop:(id)a3
{
  id v4;
  NSMutableSet *v5;
  id v6;
  id v7;
  char v8;
  int v9;
  int v10;
  char v11;
  int v12;
  uint64_t v13;
  void *i;
  void *v15;
  char v16;
  NSMutableDictionary *ddNearbyActionDevices;
  NSMutableDictionary *ddNearbyInfoDevices;
  NSMutableDictionary *ddProximityPairingDevices;
  id v20;
  SDNearbyAgent *v21;
  char v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1007B3A28 <= 30 && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent deviceDiscoveryRequestStop:]", 30, "DeviceDiscovery stop\n");
  -[NSMutableSet removeObject:](self->_ddRequests, "removeObject:", v4);
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v5 = self->_ddRequests;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (!v6)
  {

    LOBYTE(v12) = 0;
    v11 = 0;
    LOBYTE(v10) = 0;
    v16 = 0;
    LOBYTE(v9) = 0;
    goto LABEL_23;
  }
  v7 = v6;
  v20 = v4;
  v21 = self;
  v8 = 0;
  v9 = 0;
  v22 = 0;
  v10 = 0;
  v11 = 0;
  v12 = 0;
  v13 = *(_QWORD *)v24;
  do
  {
    for (i = 0; i != v7; i = (char *)i + 1)
    {
      if (*(_QWORD *)v24 != v13)
        objc_enumerationMutation(v5);
      v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
      if ((objc_msgSend(v15, "discoveryFlags") & 0x10) != 0)
      {
        v9 |= objc_msgSend(v15, "overrideScreenOff");
        v8 = 1;
      }
      if ((objc_msgSend(v15, "discoveryFlags") & 1) != 0)
      {
        v10 |= objc_msgSend(v15, "overrideScreenOff");
        v22 = 1;
      }
      if ((objc_msgSend(v15, "discoveryFlags") & 2) != 0)
      {
        v12 |= objc_msgSend(v15, "overrideScreenOff");
        v11 = 1;
      }
    }
    v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  }
  while (v7);

  if ((v8 & 1) == 0)
  {
    v4 = v20;
    self = v21;
    v16 = v22;
LABEL_23:
    self->_ddNearbyActionEnabled = 0;
    -[NSMutableDictionary removeAllObjects](self->_ddNearbyActionDevices, "removeAllObjects");
    ddNearbyActionDevices = self->_ddNearbyActionDevices;
    self->_ddNearbyActionDevices = 0;

    self->_ddNearbyActionScreenOff = v9 & 1;
    if ((v16 & 1) != 0)
      goto LABEL_25;
    goto LABEL_24;
  }
  v4 = v20;
  self = v21;
  v21->_ddNearbyActionScreenOff = v9 & 1;
  if ((v22 & 1) == 0)
  {
LABEL_24:
    self->_ddNearbyInfoEnabled = 0;
    -[NSMutableDictionary removeAllObjects](self->_ddNearbyInfoDevices, "removeAllObjects");
    ddNearbyInfoDevices = self->_ddNearbyInfoDevices;
    self->_ddNearbyInfoDevices = 0;

  }
LABEL_25:
  self->_ddNearbyInfoScreenOff = v10 & 1;
  if ((v11 & 1) == 0)
  {
    self->_ddProximityPairingEnabled = 0;
    -[NSMutableDictionary removeAllObjects](self->_ddProximityPairingDevices, "removeAllObjects");
    ddProximityPairingDevices = self->_ddProximityPairingDevices;
    self->_ddProximityPairingDevices = 0;

  }
  self->_ddProximityPairingScreenOff = v12 & 1;
  -[SDNearbyAgent _identificationHandleDiscoveryStop](self, "_identificationHandleDiscoveryStop");
  -[SDNearbyAgent _update](self, "_update");

}

- (void)deviceDiscoveryFastScanTrigger:(id)a3 reason:(id)a4
{
  NSObject *dispatchQueue;
  id v7;
  id v8;

  dispatchQueue = self->_dispatchQueue;
  v7 = a4;
  v8 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  -[SDNearbyAgent _deviceDiscoveryFastScanStart:device:reason:](self, "_deviceDiscoveryFastScanStart:device:reason:", v8, 0, v7);

}

- (void)deviceDiscoveryFastScanCancel:(id)a3 reason:(id)a4
{
  NSObject *dispatchQueue;
  id v7;
  id v8;

  dispatchQueue = self->_dispatchQueue;
  v7 = a4;
  v8 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  objc_msgSend(v8, "setFastScanMode:", 0);
  -[SDNearbyAgent _deviceDiscoveryFastScanStop:reset:reason:](self, "_deviceDiscoveryFastScanStop:reset:reason:", v8, 1, v7);

}

- (void)deviceDiscoveryTriggerEnhancedDiscovery:(id)a3 reason:(id)a4
{
  id v5;

  v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (-[SDNearbyAgent _allowEnhancedDiscovery](self, "_allowEnhancedDiscovery"))
  {
    if (dword_1007B3A28 <= 60
      && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 60)))
    {
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent deviceDiscoveryTriggerEnhancedDiscovery:reason:]", 60, "Deprecated method - applying fallback use case CBUseCaseUnspecified\n");
    }
    -[SDNearbyAgent _enableEnhancedDiscovery:useCase:](self, "_enableEnhancedDiscovery:useCase:", v5, 0);
    -[SDNearbyAgent _update](self, "_update");
  }
  else if (dword_1007B3A28 <= 30
         && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
  {
    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent deviceDiscoveryTriggerEnhancedDiscovery:reason:]", 30, "Skip enhanced discovery as the account state does not allow it.\n");
  }

}

- (void)deviceDiscoveryTriggerEnhancedDiscovery:(id)a3 reason:(id)a4 useCase:(unsigned int)a5
{
  uint64_t v5;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  v5 = *(_QWORD *)&a5;
  v12 = a3;
  v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (-[SDNearbyAgent _allowEnhancedDiscovery](self, "_allowEnhancedDiscovery"))
  {
    if (dword_1007B3A28 <= 10
      && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 10)))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "useCases"));
      v10 = objc_msgSend(v9, "count");
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "useCases"));
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent deviceDiscoveryTriggerEnhancedDiscovery:reason:useCase:]", 10, "Incoming enhanced discovery trigger for reason '%@' with %ld use cases: %@\n", v8, v10, v11);

    }
    -[SDNearbyAgent _enableEnhancedDiscovery:useCase:](self, "_enableEnhancedDiscovery:useCase:", v8, v5);
    -[SDNearbyAgent _update](self, "_update");
  }
  else if (dword_1007B3A28 <= 30
         && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
  {
    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent deviceDiscoveryTriggerEnhancedDiscovery:reason:useCase:]", 30, "Skip enhanced discovery as the account state does not allow it.\n");
  }

}

- (void)_deviceDiscoveryFastScanStart:(id)a3 device:(id)a4 reason:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  OS_dispatch_source *v13;
  OS_dispatch_source *ddFastScanTimer;
  NSObject *v15;
  _QWORD handler[5];
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_activityScreenOn && self->_activityUIUnlocked)
  {
    v11 = mach_absolute_time();
    if ((unint64_t)UpTicksToSeconds(v11 - self->_ddFastScanLastEndTicks) > 0x63)
    {
      if (!objc_msgSend(v8, "scanRateOverride"))
      {
        if (v9)
        {
          if (dword_1007B3A28 <= 50
            && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 50)))
          {
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bleDevice"));
            LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _deviceDiscoveryFastScanStart:device:reason:]", 50, "Fast scan rate start '%@' for %@\n", v10, v12);

          }
        }
        else if (dword_1007B3A28 <= 50
               && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 50)))
        {
          LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _deviceDiscoveryFastScanStart:device:reason:]", 50, "Fast scan rate start '%@'\n", v10);
        }
        objc_msgSend(v8, "setScanRateOverride:", 50);
        -[SDNearbyAgent _update](self, "_update");
      }
      if (!self->_ddFastScanTimer)
      {
        v13 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
        ddFastScanTimer = self->_ddFastScanTimer;
        self->_ddFastScanTimer = v13;

        v15 = self->_ddFastScanTimer;
        handler[0] = _NSConcreteStackBlock;
        handler[1] = 3221225472;
        handler[2] = sub_1001FD240;
        handler[3] = &unk_100715138;
        handler[4] = self;
        v17 = v8;
        v18 = v10;
        dispatch_source_set_event_handler(v15, handler);
        SFDispatchTimerSet(self->_ddFastScanTimer, 10.0, -1.0, -10.0);
        dispatch_resume((dispatch_object_t)self->_ddFastScanTimer);

      }
    }
    else if (!v9
           && dword_1007B3A28 <= 30
           && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
    {
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _deviceDiscoveryFastScanStart:device:reason:]", 30, "Fast scan start too soon (%llu < %u seconds)\n");
    }
  }
  else if (!v9
         && dword_1007B3A28 <= 30
         && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
  {
    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _deviceDiscoveryFastScanStart:device:reason:]", 30, "Fast scan start ignored for UI state (screen %s, unlocked %s)\n");
  }

}

- (void)_deviceDiscoveryFastScanStop:(id)a3 reset:(BOOL)a4 reason:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  _BOOL4 v10;
  NSMutableSet *v11;
  id v12;
  id v13;
  char v14;
  uint64_t v15;
  void *i;
  void *v17;
  uint64_t v18;
  OS_dispatch_source *ddFastScanTimer;
  NSObject *v20;
  OS_dispatch_source *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v6 = a4;
  v8 = a3;
  v9 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (objc_msgSend(v8, "scanRateOverride"))
    v10 = v6;
  else
    v10 = 0;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v11 = self->_ddRequests;
  v12 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v15)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v17, "scanRateOverride"))
        {
          objc_msgSend(v17, "setScanRateOverride:", 0);
          v14 = 1;
        }
      }
      v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v13);

    if ((v14 & 1) != 0)
    {
      if (dword_1007B3A28 <= 50
        && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 50)))
      {
        LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _deviceDiscoveryFastScanStop:reset:reason:]", 50, "Fast scan rate stop '%@'\n", v9);
      }
      if (!v10)
      {
        v18 = mach_absolute_time();
        goto LABEL_24;
      }
LABEL_22:
      v18 = 0;
LABEL_24:
      self->_ddFastScanLastEndTicks = v18;
      goto LABEL_25;
    }
  }
  else
  {

  }
  if (v10)
    goto LABEL_22;
LABEL_25:
  ddFastScanTimer = self->_ddFastScanTimer;
  if (ddFastScanTimer)
  {
    v20 = ddFastScanTimer;
    dispatch_source_cancel(v20);
    v21 = self->_ddFastScanTimer;
    self->_ddFastScanTimer = 0;

  }
  -[SDNearbyAgent _update](self, "_update");

}

- (void)_deviceDiscoveryBLEScanStateChanged:(int64_t)a3 type:(int64_t)a4
{
  uint64_t v5;
  NSMutableSet *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD);
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  switch(a4)
  {
    case 7:
      v5 = 2;
      break;
    case 15:
      v5 = 16;
      break;
    case 16:
      v5 = 1;
      break;
    default:
      return;
  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = self->_ddRequests;
  v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if (((unint64_t)objc_msgSend(v11, "discoveryFlags", (_QWORD)v14) & v5) != 0)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "scanStateChangedHandler"));

          if (v12)
          {
            v13 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "scanStateChangedHandler"));
            v13[2](v13, a3);

          }
        }
      }
      v8 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

}

- (void)diagnosticBLEModeStart:(id)a3
{
  NSMutableSet *bleDiagnosticModeClients;
  NSMutableSet *v5;
  NSMutableSet *v6;
  id v7;

  v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1007B3A28 <= 30 && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent diagnosticBLEModeStart:]", 30, "BLE diagnostic mode start\n");
  bleDiagnosticModeClients = self->_bleDiagnosticModeClients;
  if (!bleDiagnosticModeClients)
  {
    v5 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v6 = self->_bleDiagnosticModeClients;
    self->_bleDiagnosticModeClients = v5;

    bleDiagnosticModeClients = self->_bleDiagnosticModeClients;
  }
  -[NSMutableSet addObject:](bleDiagnosticModeClients, "addObject:", v7);
  -[SDNearbyAgent _update](self, "_update");

}

- (void)diagnosticBLEModeStop:(id)a3
{
  id v4;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1007B3A28 <= 30 && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent diagnosticBLEModeStop:]", 30, "BLE diagnostic mode stop\n");
  -[NSMutableSet removeObject:](self->_bleDiagnosticModeClients, "removeObject:", v4);
  -[SDNearbyAgent _update](self, "_update");

}

- (void)diagnosticMockChanged:(id)a3
{
  id v4;
  int v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (dword_1007B3A28 <= 30)
  {
    if (dword_1007B3A28 != -1 || (v5 = _LogCategory_Initialize(&dword_1007B3A28, 30), v4 = v6, v5))
    {
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent diagnosticMockChanged:]", 30, "Mocking changed event with device: %@\n", v4);
      v4 = v6;
    }
  }
  -[SDNearbyAgent _deviceDiscoveryBLEDeviceChanged:type:changes:](self, "_deviceDiscoveryBLEDeviceChanged:type:changes:", v4, 15, 0);

}

- (void)diagnosticMockFound:(id)a3
{
  id v4;
  int v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (dword_1007B3A28 <= 30)
  {
    if (dword_1007B3A28 != -1 || (v5 = _LogCategory_Initialize(&dword_1007B3A28, 30), v4 = v6, v5))
    {
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent diagnosticMockFound:]", 30, "Mocking found event with device: %@\n", v4);
      v4 = v6;
    }
  }
  -[SDNearbyAgent _deviceDiscoveryBLEDeviceFound:type:](self, "_deviceDiscoveryBLEDeviceFound:type:", v4, 15);

}

- (void)diagnosticMockLost:(id)a3
{
  id v4;
  int v5;
  id v6;

  v4 = a3;
  v6 = v4;
  if (dword_1007B3A28 <= 30)
  {
    if (dword_1007B3A28 != -1 || (v5 = _LogCategory_Initialize(&dword_1007B3A28, 30), v4 = v6, v5))
    {
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent diagnosticMockLost:]", 30, "Mocking lost event with device: %@\n", v4);
      v4 = v6;
    }
  }
  -[SDNearbyAgent _deviceDiscoveryBLEDeviceLost:type:](self, "_deviceDiscoveryBLEDeviceLost:type:", v4, 15);

}

- (void)_identificationCheckFlagsAndACL
{
  id v2;
  id v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  int v12;
  int fitnessPairingEnabled;
  int sessionPairingEnabled;
  int v15;
  int coreDeviceEnabled;
  uint64_t v18;
  NSArray *obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = self->_idIdentityArray;
  v2 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (!v2)
  {
    v18 = 0;
    v4 = 0;
    v5 = 0;
    goto LABEL_35;
  }
  v3 = v2;
  v18 = 0;
  v4 = 0;
  LOBYTE(v5) = 0;
  v6 = *(_QWORD *)v21;
  do
  {
    for (i = 0; i != v3; i = (char *)i + 1)
    {
      if (*(_QWORD *)v21 != v6)
        objc_enumerationMutation(obj);
      v8 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
      if ((objc_msgSend(v8, "featureFlags") & 4) != 0)
      {
        if (dword_1007B3A28 <= 30
          && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
        {
          LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _identificationCheckFlagsAndACL]", 30, "enabled fitness pairing with identity: %@\n", v8);
        }
        BYTE4(v18) = 1;
      }
      if ((v5 & 1) != 0)
        goto LABEL_13;
      if (objc_msgSend(v8, "type") == 13)
      {
        if (dword_1007B3A28 <= 30
          && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
        {
          LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _identificationCheckFlagsAndACL]", 30, "enabled session pairing with identity: %@\n", v8);
        }
LABEL_13:
        v5 = 1;
        goto LABEL_19;
      }
      v5 = 0;
LABEL_19:
      if ((objc_opt_respondsToSelector(v8, "acl") & 1) != 0)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "performSelector:", "acl"));

        if (v9)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("com.apple.developer")));
          v11 = objc_msgSend(v10, "BOOLValue");

          if (v11)
          {
            if (dword_1007B3A28 <= 30
              && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
            {
              LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _identificationCheckFlagsAndACL]", 30, "enabled CoreDevice with identity: %@\n", v8);
            }
            LOBYTE(v18) = 1;
          }
          v4 = v9;
        }
        else
        {
          v4 = 0;
        }
      }
    }
    v3 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  }
  while (v3);
LABEL_35:

  v12 = BYTE4(v18) & 1;
  fitnessPairingEnabled = self->_fitnessPairingEnabled;
  if (fitnessPairingEnabled != v12)
  {
    if (dword_1007B3A28 <= 30)
    {
      if (dword_1007B3A28 != -1)
        goto LABEL_38;
      if (_LogCategory_Initialize(&dword_1007B3A28, 30))
      {
        fitnessPairingEnabled = self->_fitnessPairingEnabled;
LABEL_38:
        LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _identificationCheckFlagsAndACL]", 30, "fitness pairing changed from %d to %d", fitnessPairingEnabled, v12);
      }
    }
    self->_fitnessPairingEnabled = v12;
  }
  sessionPairingEnabled = self->_sessionPairingEnabled;
  if (sessionPairingEnabled != v5)
  {
    if (dword_1007B3A28 <= 30)
    {
      if (dword_1007B3A28 != -1)
        goto LABEL_44;
      if (_LogCategory_Initialize(&dword_1007B3A28, 30))
      {
        sessionPairingEnabled = self->_sessionPairingEnabled;
LABEL_44:
        LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _identificationCheckFlagsAndACL]", 30, "session pairing changed from %d to %d", sessionPairingEnabled, v5);
      }
    }
    self->_sessionPairingEnabled = v5;
  }
  v15 = v18 & 1;
  coreDeviceEnabled = self->_coreDeviceEnabled;
  if (coreDeviceEnabled != v15)
  {
    if (dword_1007B3A28 <= 30)
    {
      if (dword_1007B3A28 != -1)
        goto LABEL_50;
      if (_LogCategory_Initialize(&dword_1007B3A28, 30))
      {
        coreDeviceEnabled = self->_coreDeviceEnabled;
LABEL_50:
        LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _identificationCheckFlagsAndACL]", 30, "CoreDevice changed from %d to %d", coreDeviceEnabled, v15);
      }
    }
    self->_coreDeviceEnabled = v15;
  }

}

- (void)_identificationEnsureStopped
{
  int idIdentitiesChangedNotifyToken;
  OS_dispatch_source *idMaintenanceTimer;
  NSObject *v5;
  OS_dispatch_source *v6;
  NSMutableDictionary *idDevices;

  idIdentitiesChangedNotifyToken = self->_idIdentitiesChangedNotifyToken;
  if (idIdentitiesChangedNotifyToken != -1)
  {
    if (dword_1007B3A28 > 30)
      goto LABEL_7;
    if (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30))
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _identificationEnsureStopped]", 30, "Identification stop\n");
    idIdentitiesChangedNotifyToken = self->_idIdentitiesChangedNotifyToken;
    if (idIdentitiesChangedNotifyToken != -1)
    {
LABEL_7:
      notify_cancel(idIdentitiesChangedNotifyToken);
      self->_idIdentitiesChangedNotifyToken = -1;
    }
  }
  idMaintenanceTimer = self->_idMaintenanceTimer;
  if (idMaintenanceTimer)
  {
    v5 = idMaintenanceTimer;
    dispatch_source_cancel(v5);
    v6 = self->_idMaintenanceTimer;
    self->_idMaintenanceTimer = 0;

  }
  -[NSMutableDictionary removeAllObjects](self->_idDevices, "removeAllObjects");
  idDevices = self->_idDevices;
  self->_idDevices = 0;

}

- (void)_identificationGetIdentities
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  if (dword_1007B3A28 <= 30 && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _identificationGetIdentities]", 30, "Identification get identities\n");
  v3 = objc_alloc_init((Class)RPClient);
  objc_msgSend(v3, "setDispatchQueue:", self->_dispatchQueue);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001FE228;
  v5[3] = &unk_100715548;
  v5[4] = self;
  v6 = v3;
  v4 = v3;
  objc_msgSend(v4, "getIdentitiesWithFlags:completion:", 28075, v5);

}

- (id)idsDeviceIDsForRIServers
{
  id v3;
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = objc_alloc_init((Class)NSMutableSet);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_idIdentityArray;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "model", (_QWORD)v14));
        v11 = objc_msgSend(v10, "hasPrefix:", CFSTR("AppleTV"));

        if (v11)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "idsDeviceID"));
          if (v12)
            objc_msgSend(v3, "addObject:", v12);

        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)idsDeviceIDsForFamily
{
  id v3;
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v3 = objc_alloc_init((Class)NSMutableSet);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = self->_idIdentityArray;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "type", (_QWORD)v15) == 4 || objc_msgSend(v9, "type") == 2)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "model"));
          v11 = objc_msgSend(v10, "hasPrefix:", CFSTR("AppleTV"));

          if (v11)
          {
            v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "idsDeviceID"));
            if (v12)
            {
              v13 = (void *)v12;
              objc_msgSend(v3, "addObject:", v12);

            }
          }
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)_identificationHandleDiscoveryStop
{
  uint64_t v2;
  NSMutableDictionary *idDevices;
  _QWORD v4[5];

  v2 = !self->_ddNearbyInfoEnabled | (16 * !self->_ddNearbyActionEnabled);
  idDevices = self->_idDevices;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001FEB34;
  v4[3] = &unk_10071B490;
  v4[4] = v2;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](idDevices, "enumerateKeysAndObjectsUsingBlock:", v4);
}

- (void)_identificationReIdentify
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  -[SDNearbyAgent _identificationReIdentifySameAccountDevices:type:](self, "_identificationReIdentifySameAccountDevices:type:", self->_ddNearbyActionDevices, 15);
  -[SDNearbyAgent _identificationReIdentifySameAccountDevices:type:](self, "_identificationReIdentifySameAccountDevices:type:", self->_ddNearbyInfoDevices, 16);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](self->_idDevices, "allKeys", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_idDevices, "objectForKeyedSubscript:", v8));
        if (-[SDNearbyAgent _identificationIdentifyDevice:sfDevice:](self, "_identificationIdentifyDevice:sfDevice:", v9, 0))
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_ddNearbyActionDevices, "objectForKeyedSubscript:", v8));
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bleDevice"));

          if (v11)
            -[SDNearbyAgent _deviceDiscoveryBLEDeviceChanged:type:changes:](self, "_deviceDiscoveryBLEDeviceChanged:type:changes:", v11, 15, 1);

          v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_ddNearbyInfoDevices, "objectForKeyedSubscript:", v8));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bleDevice"));

          if (v13)
            -[SDNearbyAgent _deviceDiscoveryBLEDeviceChanged:type:changes:](self, "_deviceDiscoveryBLEDeviceChanged:type:changes:", v13, 16, 1);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

}

- (void)_identificationReIdentifySameAccountDevices:(id)a3 type:(int64_t)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  NSArray *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  unsigned int v22;
  uint64_t v24;
  id v25;
  id v26;
  SDNearbyAgent *v27;
  id obj;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE v39[128];

  v5 = a3;
  v27 = self;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allKeys"));
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v35;
    v24 = *(_QWORD *)v35;
    v25 = v5;
    do
    {
      v9 = 0;
      v26 = v7;
      do
      {
        if (*(_QWORD *)v35 != v8)
          objc_enumerationMutation(obj);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)v9)));
        if (!objc_msgSend(v10, "paired"))
          goto LABEL_30;
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "idsIdentifier"));
        if (!v11)
          goto LABEL_29;
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bleDevice"));
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v12 = v27->_idIdentityArray;
        v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
        if (!v13)
          goto LABEL_28;
        v14 = v13;
        v15 = *(_QWORD *)v31;
        while (2)
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(_QWORD *)v31 != v15)
              objc_enumerationMutation(v12);
            v17 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
            if (objc_msgSend(v17, "type") == 2)
            {
              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "idsDeviceID"));
              v19 = objc_msgSend(v18, "isEqual:", v11);

              if (v19)
              {
                v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "rpIdentity"));
                v21 = v20;
                if (v20)
                {
                  v22 = objc_msgSend(v20, "compareWithRPIdentity:", v17);
                  objc_msgSend(v29, "setRpIdentity:", v17);
                  if (!v22)
                  {
LABEL_27:

                    goto LABEL_28;
                  }
                }
                else
                {
                  objc_msgSend(v29, "setRpIdentity:", v17);
                }
                if (dword_1007B3A28 <= 30
                  && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
                {
                  LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _identificationReIdentifySameAccountDevices:type:]", 30, "Identification identified device: %@, %@, %@\n", v10, v29, v17);
                }
                -[SDNearbyAgent _deviceDiscoveryBLEDeviceChanged:type:changes:](v27, "_deviceDiscoveryBLEDeviceChanged:type:changes:", v29, a4, 1);
                goto LABEL_27;
              }
            }
          }
          v14 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v30, v38, 16);
          if (v14)
            continue;
          break;
        }
LABEL_28:

        v8 = v24;
        v5 = v25;
        v7 = v26;
LABEL_29:

LABEL_30:
        v9 = (char *)v9 + 1;
      }
      while (v9 != v7);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
    }
    while (v7);
  }

}

- (void)_identificationDecryptAudioRoutingScoreData:(id)a3 device:(id)a4 authTag:(id)a5 identity:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  char v19;
  _OWORD v20[2];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a6, "deviceIRKData"));
  if (objc_msgSend(v12, "length"))
  {
    v13 = v11;
    if (objc_msgSend(v13, "length"))
    {
      memset(v20, 0, sizeof(v20));
      v14 = kCryptoHashDescriptor_SHA512;
      v15 = objc_retainAutorelease(v12);
      v16 = objc_msgSend(v15, "bytes");
      v17 = objc_msgSend(v15, "length");
      v18 = objc_retainAutorelease(v13);
      CryptoHKDF(v14, v16, v17, objc_msgSend(v18, "bytes"), objc_msgSend(v18, "length"), "BLEAdvKeyAudioRoutingScoreInfo", 30, 32, v20);
      if (objc_msgSend(v9, "length"))
      {
        v19 = 0;
        ccchacha20(v20, &unk_1005CD103, 0, 1, objc_msgSend(objc_retainAutorelease(v9), "bytes"), &v19);
        objc_msgSend(v10, "setAudioRoutingScore:", v19 & 7);
      }
    }

  }
}

- (void)_identificationDecryptHotspotData:(id)a3 device:(id)a4 authTag:(id)a5 identity:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  unsigned __int8 v19;
  _OWORD v20[2];

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a6, "deviceIRKData"));
  if (objc_msgSend(v12, "length"))
  {
    v13 = v11;
    if (objc_msgSend(v13, "length"))
    {
      memset(v20, 0, sizeof(v20));
      v14 = kCryptoHashDescriptor_SHA512;
      v15 = objc_retainAutorelease(v12);
      v16 = objc_msgSend(v15, "bytes");
      v17 = objc_msgSend(v15, "length");
      v18 = objc_retainAutorelease(v13);
      CryptoHKDF(v14, v16, v17, objc_msgSend(v18, "bytes"), objc_msgSend(v18, "length"), "BLEAdvKeyHotspotInfo", 20, 32, v20);
      if (objc_msgSend(v9, "length"))
      {
        v19 = 0;
        ccchacha20(v20, &unk_1005CD103, 0, 1, objc_msgSend(objc_retainAutorelease(v9), "bytes"), &v19);
        objc_msgSend(v10, "setHotspotInfo:", v19 | 0x100u);
      }
    }

  }
}

- (unsigned)_identificationDecryptActivityLevel:(unsigned __int8)a3 device:(id)a4 authTag:(id)a5 identity:(id)a6
{
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  unsigned __int8 v15;
  char v17;
  unsigned __int8 v18;
  _OWORD v19[2];

  v18 = a3;
  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a6, "deviceIRKData"));
  if (objc_msgSend(v8, "length"))
  {
    v9 = v7;
    if (objc_msgSend(v9, "length"))
    {
      memset(v19, 0, sizeof(v19));
      v10 = kCryptoHashDescriptor_SHA512;
      v11 = objc_retainAutorelease(v8);
      v12 = objc_msgSend(v11, "bytes");
      v13 = objc_msgSend(v11, "length");
      v14 = objc_retainAutorelease(v9);
      CryptoHKDF(v10, v12, v13, objc_msgSend(v14, "bytes"), objc_msgSend(v14, "length"), "BLEAdvKeyActivityLevel", 22, 32, v19);
      v17 = 0;
      ccchacha20(v19, &unk_1005CD103, 0, 1, &v18, &v17);
      v15 = v17 & 0xF;
    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)_idsEnsureStarted
{
  IDSService *v3;
  IDSService *idsService;

  if (!self->_idsService)
  {
    if (dword_1007B3A28 <= 30
      && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
    {
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _idsEnsureStarted]", 30, "IDS start\n");
    }
    v3 = (IDSService *)objc_msgSend(objc_alloc((Class)IDSService), "initWithService:", CFSTR("com.apple.private.alloy.nearby"));
    idsService = self->_idsService;
    self->_idsService = v3;

    -[IDSService addDelegate:queue:](self->_idsService, "addDelegate:queue:", self, self->_dispatchQueue);
  }
}

- (void)_idsEnsureStopped
{
  SDNearbyAgent *v2;
  NSArray *idsBluetoothDevicesArray;
  NSSet *idsBluetoothDevicesSet;
  NSArray *idsBluetoothDeviceIDsForLEPipe;
  NSSet *idsBluetoothDeviceIDsForMe;
  NSDictionary *idsDeviceBTDictionary;
  NSDictionary *idsDeviceCountBTDictionary;
  IDSService *idsService;

  v2 = self;
  objc_sync_enter(v2);
  idsBluetoothDevicesArray = v2->_idsBluetoothDevicesArray;
  v2->_idsBluetoothDevicesArray = 0;

  idsBluetoothDevicesSet = v2->_idsBluetoothDevicesSet;
  v2->_idsBluetoothDevicesSet = 0;

  idsBluetoothDeviceIDsForLEPipe = v2->_idsBluetoothDeviceIDsForLEPipe;
  v2->_idsBluetoothDeviceIDsForLEPipe = 0;

  idsBluetoothDeviceIDsForMe = v2->_idsBluetoothDeviceIDsForMe;
  v2->_idsBluetoothDeviceIDsForMe = 0;

  idsDeviceBTDictionary = v2->_idsDeviceBTDictionary;
  v2->_idsDeviceBTDictionary = 0;

  idsDeviceCountBTDictionary = v2->_idsDeviceCountBTDictionary;
  v2->_idsDeviceCountBTDictionary = 0;

  objc_sync_exit(v2);
  if (v2->_idsService)
  {
    if (dword_1007B3A28 <= 30
      && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
    {
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _idsEnsureStopped]", 30, "IDS stop\n");
    }
    -[IDSService removeDelegate:](v2->_idsService, "removeDelegate:", v2);
    idsService = v2->_idsService;
    v2->_idsService = 0;

  }
}

- (void)idsAddCachedIDSIdentifier:(id)a3 device:(id)a4
{
  SDNearbyAgent *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  void *v13;
  uint64_t Int64;
  void *v15;
  NSMutableDictionary *v16;
  NSMutableDictionary *idsBTtoIDSInfoMap;
  NSNumber *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[2];
  _QWORD v28[2];
  _BYTE v29[128];

  v21 = a3;
  v22 = a4;
  v6 = self;
  objc_sync_enter(v6);
  v7 = mach_absolute_time();
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v6->_idsBTtoIDSInfoMap, "allKeys"));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v8);
        v12 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v6->_idsBTtoIDSInfoMap, "objectForKeyedSubscript:", v12));
        Int64 = CFDictionaryGetInt64(v13, CFSTR("addTicks"), 0);
        if ((unint64_t)UpTicksToSeconds(v7 - Int64) >= 0x385)
        {
          if (dword_1007B3A28 <= 30
            && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
          {
            LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent idsAddCachedIDSIdentifier:device:]", 30, "Remove old IDS cache entry: %@ : %##@\n", v12, v13);
          }
          -[NSMutableDictionary setObject:forKeyedSubscript:](v6->_idsBTtoIDSInfoMap, "setObject:forKeyedSubscript:", 0, v12);
        }

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    }
    while (v9);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "identifier"));
  if (v15)
  {
    if (!v6->_idsBTtoIDSInfoMap)
    {
      v16 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      idsBTtoIDSInfoMap = v6->_idsBTtoIDSInfoMap;
      v6->_idsBTtoIDSInfoMap = v16;

    }
    v27[0] = CFSTR("addTicks");
    v18 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", mach_absolute_time());
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v27[1] = CFSTR("idsID");
    v28[0] = v19;
    v28[1] = v21;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v27, 2));

    if (dword_1007B3A28 <= 30
      && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
    {
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent idsAddCachedIDSIdentifier:device:]", 30, "Add IDS cache entry: %@ : %##@\n", v15, v20);
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](v6->_idsBTtoIDSInfoMap, "setObject:forKeyedSubscript:", v20, v15);

  }
  else if (dword_1007B3A28 <= 90
         && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 90)))
  {
    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent idsAddCachedIDSIdentifier:device:]", 90, "### No BT UUID for %@\n", v21);
  }

  objc_sync_exit(v6);
}

- (void)idsAddCachedIDSIdentifierToDevice:(id)a3
{
  SDNearbyAgent *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "idsIdentifier"));

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v4->_idsBTtoIDSInfoMap, "objectForKeyedSubscript:", v6));
      v8 = v7;
      if (v7)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("idsID")));
        if (v9)
        {
          objc_msgSend(v10, "setIdsIdentifier:", v9);
          if (dword_1007B3A28 <= 30
            && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
          {
            LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent idsAddCachedIDSIdentifierToDevice:]", 30, "Found IDS cache entry for device: %@\n", v10);
          }
        }

      }
    }

  }
  objc_sync_exit(v4);

}

- (id)idsBluetoothDeviceIDsForRIServers
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v14 = objc_alloc_init((Class)NSMutableSet);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent idsDeviceArray](self, "idsDeviceArray"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "modelIdentifier"));
        if (objc_msgSend(v9, "hasPrefix:", CFSTR("AppleTV")))
        {

        }
        else
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "modelIdentifier"));
          v11 = -[SDNearbyAgent isDeviceValidRIServer:](self, "isDeviceValidRIServer:", v10);

          if (!v11)
            continue;
        }
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "nsuuid"));
        if (v12)
          objc_msgSend(v14, "addObject:", v12);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }

  return v14;
}

- (id)_idsBluetoothDeviceIDsForHomePods
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = objc_alloc_init((Class)NSMutableSet);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent idsDeviceArray](self, "idsDeviceArray", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "modelIdentifier"));
        v11 = objc_msgSend(v10, "hasPrefix:", CFSTR("AudioAccessory"));

        if (v11)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "nsuuid"));
          if (v12)
            objc_msgSend(v3, "addObject:", v12);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)_idsBluetoothDeviceIDsForiMessage
{
  id v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v2 = objc_alloc_init((Class)NSMutableSet);
  v3 = objc_alloc((Class)IDSService);
  v4 = objc_msgSend(v3, "initWithService:", IDSServiceNameiMessage);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "devices", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v9), "nsuuid"));
        if (v10)
          objc_msgSend(v2, "addObject:", v10);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v2;
}

- (id)idsBluetoothDeviceIDsForLEPipe
{
  SDNearbyAgent *v2;
  NSArray *idsBluetoothDeviceIDsForLEPipe;
  uint64_t v4;
  NSArray *v5;
  NSArray *v6;

  v2 = self;
  objc_sync_enter(v2);
  idsBluetoothDeviceIDsForLEPipe = v2->_idsBluetoothDeviceIDsForLEPipe;
  if (!idsBluetoothDeviceIDsForLEPipe)
  {
    v4 = objc_claimAutoreleasedReturnValue(-[SDNearbyAgent _idsBluetoothDeviceIDsForLEPipe](v2, "_idsBluetoothDeviceIDsForLEPipe"));
    v5 = v2->_idsBluetoothDeviceIDsForLEPipe;
    v2->_idsBluetoothDeviceIDsForLEPipe = (NSArray *)v4;

    idsBluetoothDeviceIDsForLEPipe = v2->_idsBluetoothDeviceIDsForLEPipe;
  }
  v6 = idsBluetoothDeviceIDsForLEPipe;
  objc_sync_exit(v2);

  return v6;
}

- (id)_idsBluetoothDeviceIDsForLEPipe
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = objc_alloc_init((Class)NSMutableArray);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent idsDeviceArray](self, "idsDeviceArray"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if (v9)
          objc_msgSend(v9, "operatingSystemVersion");
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "modelIdentifier"));
        if ((objc_msgSend(v10, "hasPrefix:", CFSTR("Mac")) & 1) == 0
          && !objc_msgSend(v10, "hasPrefix:", CFSTR("iMac")))
        {
          objc_msgSend(v10, "hasPrefix:", CFSTR("Watch"));
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  if (objc_msgSend(v3, "count"))
    v11 = v3;
  else
    v11 = 0;
  v12 = v11;

  return v12;
}

- (id)_idsBluetoothDeviceIDsForOneness
{
  id v3;
  uint64_t v4;
  uint64_t DeviceClass;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  SDNearbyAgent *v18;
  uint64_t v19;
  void *j;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  void *k;
  void *v30;
  void *v31;
  unsigned int v32;
  void *v33;
  SDNearbyAgent *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  _BYTE v50[128];
  _BYTE v51[128];

  v36 = objc_alloc_init((Class)NSMutableSet);
  v3 = objc_alloc_init((Class)NSMutableSet);
  DeviceClass = GestaltGetDeviceClass(v3, v4);
  if ((_DWORD)DeviceClass == 1)
  {
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent idsDeviceArray](self, "idsDeviceArray"));
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    if (v8)
    {
      v9 = v8;
      v35 = self;
      v10 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v46 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "modelIdentifier", v35));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "lowercaseString"));

          if ((objc_msgSend(v14, "containsString:", CFSTR("mac")) & 1) != 0
            || objc_msgSend(v14, "containsString:", CFSTR("imac")))
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uniqueID"));
            objc_msgSend(v3, "addObject:", v15);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
      }
      while (v9);
      self = v35;
    }
  }
  else
  {
    if (GestaltGetDeviceClass(DeviceClass, v6) != 100)
      goto LABEL_25;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent idsDeviceArray](self, "idsDeviceArray"));
    v16 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
    if (v16)
    {
      v17 = v16;
      v18 = self;
      v19 = *(_QWORD *)v42;
      do
      {
        for (j = 0; j != v17; j = (char *)j + 1)
        {
          if (*(_QWORD *)v42 != v19)
            objc_enumerationMutation(v7);
          v21 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)j);
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "modelIdentifier"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "lowercaseString"));

          if (objc_msgSend(v23, "containsString:", CFSTR("iphone")))
          {
            v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "uniqueID"));
            objc_msgSend(v3, "addObject:", v24);

          }
        }
        v17 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v41, v50, 16);
      }
      while (v17);
      self = v18;
    }
  }

LABEL_25:
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent idsDeviceArray](self, "idsDeviceArray"));
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
  if (v26)
  {
    v27 = v26;
    v28 = *(_QWORD *)v38;
    do
    {
      for (k = 0; k != v27; k = (char *)k + 1)
      {
        if (*(_QWORD *)v38 != v28)
          objc_enumerationMutation(v25);
        v30 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)k);
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "uniqueID"));
        v32 = objc_msgSend(v3, "containsObject:", v31);

        if (v32)
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "nsuuid"));
          if (v33)
            objc_msgSend(v36, "addObject:", v33);

        }
      }
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
    }
    while (v27);
  }

  return v36;
}

- (id)idsBluetoothDeviceIDsForWatches
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = objc_alloc_init((Class)NSMutableSet);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent idsDeviceArray](self, "idsDeviceArray", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "modelIdentifier"));
        v11 = objc_msgSend(v10, "hasPrefix:", CFSTR("Watch"));

        if (v11)
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "nsuuid"));
          if (v12)
            objc_msgSend(v3, "addObject:", v12);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)_idsBluetoothDeviceIDsForSharing
{
  SDNearbyAgent *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent _idsBluetoothDeviceIDsForSharingLocked](v2, "_idsBluetoothDeviceIDsForSharingLocked"));
  objc_sync_exit(v2);

  return v3;
}

- (id)_idsBluetoothDeviceIDsForSharingLocked
{
  NSArray *idsBluetoothDevicesArray;
  NSArray *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSArray *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  idsBluetoothDevicesArray = self->_idsBluetoothDevicesArray;
  if (!idsBluetoothDevicesArray)
  {
    v4 = (NSArray *)objc_alloc_init((Class)NSMutableArray);
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent idsDeviceArray](self, "idsDeviceArray", 0));
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v9), "nsuuid"));
          if (v10)
            -[NSArray addObject:](v4, "addObject:", v10);

          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

    v11 = self->_idsBluetoothDevicesArray;
    self->_idsBluetoothDevicesArray = v4;

    idsBluetoothDevicesArray = self->_idsBluetoothDevicesArray;
  }
  return idsBluetoothDevicesArray;
}

- (id)_idsBluetoothDeviceIDsForSMSRelay
{
  id v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v2 = objc_alloc_init((Class)NSMutableSet);
  v3 = objc_alloc((Class)IDSService);
  v4 = objc_msgSend(v3, "initWithService:", IDSServiceNameSMSRelay);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "devices", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v10, "supportsSMSRelay") & 1) != 0
          || objc_msgSend(v10, "supportsMMSRelay"))
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "nsuuid"));
          if (v11)
            objc_msgSend(v2, "addObject:", v11);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  return v2;
}

- (id)_idsBluetoothDeviceIDsForAnnouncements
{
  dispatch_semaphore_t v2;
  void *v3;
  objc_class *v4;
  id v5;
  NSObject *v6;
  dispatch_time_t v7;
  id v8;
  _QWORD v10[4];
  NSObject *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_1001F248C;
  v17 = sub_1001F249C;
  v18 = 0;
  v18 = objc_alloc_init((Class)NSMutableSet);
  v2 = dispatch_semaphore_create(0);
  v20 = 0;
  v21 = &v20;
  v22 = 0x2050000000;
  v3 = (void *)qword_1007C6E20;
  v23 = qword_1007C6E20;
  if (!qword_1007C6E20)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1002084A8;
    v19[3] = &unk_100714258;
    v19[4] = &v20;
    sub_1002084A8((uint64_t)v19);
    v3 = (void *)v21[3];
  }
  v4 = objc_retainAutorelease(v3);
  _Block_object_dispose(&v20, 8);
  v5 = objc_alloc_init(v4);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100200B60;
  v10[3] = &unk_10071B4B8;
  v12 = &v13;
  v6 = v2;
  v11 = v6;
  objc_msgSend(v5, "getScanningDeviceCandidates:", v10);
  v7 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v6, v7);
  v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v8;
}

- (int)_idsContinuityDeviceCount
{
  int result;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  result = self->_idsContinuityDeviceCountCache;
  if (result < 0)
  {
    if (self->_idsService)
    {
      self->_idsContinuityDeviceCountCache = 0;
      v9 = 0u;
      v10 = 0u;
      v11 = 0u;
      v12 = 0u;
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent idsDeviceArray](self, "idsDeviceArray", 0));
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v10;
        do
        {
          v8 = 0;
          do
          {
            if (*(_QWORD *)v10 != v7)
              objc_enumerationMutation(v4);
            if (objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8), "supportsHandoff"))
              ++self->_idsContinuityDeviceCountCache;
            v8 = (char *)v8 + 1;
          }
          while (v6 != v8);
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
        }
        while (v6);
      }

      return self->_idsContinuityDeviceCountCache;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)idsDeviceArray
{
  SDNearbyAgent *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent _idsDeviceArrayLocked](v2, "_idsDeviceArrayLocked"));
  objc_sync_exit(v2);

  return v3;
}

- (id)_idsDeviceArrayLocked
{
  NSArray *idsDeviceArray;
  NSArray *v4;
  NSArray *v5;

  idsDeviceArray = self->_idsDeviceArray;
  if (!idsDeviceArray)
  {
    if (dword_1007B3A28 <= 30
      && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
    {
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _idsDeviceArrayLocked]", 30, "Get IDSDevices\n");
    }
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue(-[IDSService devices](self->_idsService, "devices"));
    v5 = self->_idsDeviceArray;
    self->_idsDeviceArray = v4;

    idsDeviceArray = self->_idsDeviceArray;
  }
  return idsDeviceArray;
}

- (void)idsDevicesAppendDescription:(id *)a3
{
  const void *v5;
  void *v6;
  uint64_t v7;
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
  id v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  void *i;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  unsigned int v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  unsigned __int8 v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  uint64_t v40;
  void *j;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  unsigned int v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  unsigned __int8 v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  id *v60;
  uint64_t v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];

  v5 = -[NSData bytes](self->_bleAdvertisingAddress, "bytes");
  v6 = (void *)IDSCopyLocalDeviceUniqueID();
  v7 = SFDeviceModel();
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  NSAppendPrintF(a3, "Local BT Addr %.6a, Local IDS UniqueID: %@ (%@)\n", v5, v6, v8);

  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent idsDeviceArray](self, "idsDeviceArray"));
  v57 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v70, v76, 16);
  if (v57)
  {
    v55 = *(_QWORD *)v71;
    v54 = IDSServiceNameiMessage;
    v53 = IDSServiceNameSMSRelay;
    v60 = a3;
    v56 = v9;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v71 != v55)
          objc_enumerationMutation(v9);
        v61 = v10;
        v11 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uniqueIDOverride"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "modelIdentifier"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "productBuildVersion"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "nsuuid"));
        NSAppendPrintF(a3, "%''@, %@, %@, %@, BT=%@", v12, v13, v14, v15, v16);

        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "nsuuid"));
        if (v17)
        {
          v18 = objc_msgSend(objc_alloc((Class)IDSService), "initWithService:", v54);
          v66 = 0u;
          v67 = 0u;
          v68 = 0u;
          v69 = 0u;
          v58 = v18;
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "devices"));
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
          if (v20)
          {
            v21 = v20;
            v22 = *(_QWORD *)v67;
            while (2)
            {
              for (i = 0; i != v21; i = (char *)i + 1)
              {
                if (*(_QWORD *)v67 != v22)
                  objc_enumerationMutation(v19);
                v24 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * (_QWORD)i);
                v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uniqueIDOverride"));
                if (v25)
                {
                  v26 = (void *)v25;
                  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "uniqueIDOverride"));
                  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uniqueIDOverride"));
                  v29 = objc_msgSend(v27, "isEqual:", v28);

                  if (!v29)
                    continue;
                }
                v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "nsuuid"));
                if (v30)
                {
                  v31 = (void *)v30;
                  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "nsuuid"));
                  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "nsuuid"));
                  v34 = objc_msgSend(v32, "isEqual:", v33);

                  if ((v34 & 1) == 0)
                    continue;
                }

                a3 = v60;
                NSAppendPrintF(v60, ", iMessage");
                goto LABEL_20;
              }
              v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
              if (v21)
                continue;
              break;
            }
          }

          a3 = v60;
        }
LABEL_20:
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "nsuuid"));

        if (v35)
        {
          v36 = objc_msgSend(objc_alloc((Class)IDSService), "initWithService:", v53);
          v62 = 0u;
          v63 = 0u;
          v64 = 0u;
          v65 = 0u;
          v59 = v36;
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "devices"));
          v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
          if (v38)
          {
            v39 = v38;
            v40 = *(_QWORD *)v63;
            while (2)
            {
              for (j = 0; j != v39; j = (char *)j + 1)
              {
                if (*(_QWORD *)v63 != v40)
                  objc_enumerationMutation(v37);
                v42 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)j);
                if ((objc_msgSend(v42, "supportsSMSRelay") & 1) != 0
                  || objc_msgSend(v42, "supportsMMSRelay"))
                {
                  v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uniqueIDOverride"));
                  if (!v43
                    || (v44 = (void *)v43,
                        v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "uniqueIDOverride")),
                        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "uniqueIDOverride")),
                        v47 = objc_msgSend(v45, "isEqual:", v46),
                        v46,
                        v45,
                        v44,
                        v47))
                  {
                    v48 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "nsuuid"));
                    if (!v48
                      || (v49 = (void *)v48,
                          v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "nsuuid")),
                          v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "nsuuid")),
                          v52 = objc_msgSend(v50, "isEqual:", v51),
                          v51,
                          v50,
                          v49,
                          (v52 & 1) != 0))
                    {

                      a3 = v60;
                      NSAppendPrintF(v60, ", SMS");
                      goto LABEL_36;
                    }
                  }
                }
              }
              v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
              if (v39)
                continue;
              break;
            }
          }

          a3 = v60;
        }
LABEL_36:
        if (objc_msgSend(v11, "isActive"))
          NSAppendPrintF(a3, ", Active");
        v9 = v56;
        if (objc_msgSend(v11, "isConnected"))
          NSAppendPrintF(a3, ", Connected");
        if (objc_msgSend(v11, "isLocallyPaired"))
          NSAppendPrintF(a3, ", Paired");
        NSAppendPrintF(a3, "\n");
        v10 = v61 + 1;
      }
      while ((id)(v61 + 1) != v57);
      v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v70, v76, 16);
    }
    while (v57);

  }
  else
  {

    NSAppendPrintF(a3, "No devices registered\n");
  }
}

- (BOOL)_idsHasActiveWatch
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  unint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  if (self->_idsHasActiveWatchCache < 0)
  {
    self->_idsHasActiveWatchCache = 0;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent idsDeviceArray](self, "idsDeviceArray", 0));
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v13;
      while (2)
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(_QWORD *)v13 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v8, "isLocallyPaired"))
          {
            if (objc_msgSend(v8, "isActive") && (objc_msgSend(v8, "isConnected") & 1) != 0
              || objc_msgSend(v8, "isConnected")
              && (v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "productBuildVersion")),
                  v10 = (unint64_t)objc_msgSend(v9, "compare:options:", CFSTR("14S"), 65),
                  v9,
                  (v10 & 0x8000000000000000) != 0))
            {
              self->_idsHasActiveWatchCache = 1;
              goto LABEL_16;
            }
          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_16:

  }
  return self->_idsHasActiveWatchCache != 0;
}

- (int)_idsHomePodCount
{
  int result;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  result = self->_idsHomePodCountCache;
  if (result < 0)
  {
    self->_idsHomePodCountCache = 0;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent idsDeviceArray](self, "idsDeviceArray", 0));
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (!v5)
      goto LABEL_13;
    v6 = v5;
    v7 = *(_QWORD *)v14;
    while (1)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "modelIdentifier"));
        if (objc_msgSend(v10, "hasPrefix:", CFSTR("AudioAccessory")))
        {

        }
        else
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "modelIdentifier"));
          v12 = objc_msgSend(v11, "hasPrefix:", CFSTR("HomePod1,"));

          if (!v12)
            continue;
        }
        ++self->_idsHomePodCountCache;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (!v6)
      {
LABEL_13:

        return self->_idsHomePodCountCache;
      }
    }
  }
  return result;
}

- (int)_idsVisionOS1Count
{
  int result;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  result = self->_idsVisionOS1CountCache;
  if (result < 0)
  {
    self->_idsVisionOS1CountCache = 0;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent idsDeviceArray](self, "idsDeviceArray"));
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (!v5)
      goto LABEL_15;
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (1)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "productName"));
        if (!objc_msgSend(v10, "isEqualToString:", CFSTR("xrOS")))
          goto LABEL_12;
        if (!v9)
        {
          v11 = 0;
LABEL_12:

          continue;
        }
        objc_msgSend(v9, "operatingSystemVersion");

        if (v11 == 1)
          ++self->_idsVisionOS1CountCache;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (!v6)
      {
LABEL_15:

        return self->_idsVisionOS1CountCache;
      }
    }
  }
  return result;
}

- (int)_idsVisionOS2OrHigherCount
{
  int result;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  result = self->_idsVisionOS2OrHigherCountCache;
  if (result < 0)
  {
    self->_idsVisionOS2OrHigherCountCache = 0;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent idsDeviceArray](self, "idsDeviceArray"));
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (!v5)
      goto LABEL_15;
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (1)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "productName"));
        if (!objc_msgSend(v10, "isEqualToString:", CFSTR("xrOS")))
          goto LABEL_12;
        if (!v9)
        {
          v11 = 0;
LABEL_12:

          continue;
        }
        objc_msgSend(v9, "operatingSystemVersion");

        if (v11 >= 2)
          ++self->_idsVisionOS2OrHigherCountCache;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (!v6)
      {
LABEL_15:

        return self->_idsVisionOS2OrHigherCountCache;
      }
    }
  }
  return result;
}

- (int)_idsMacCount
{
  int result;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  unsigned int v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  result = self->_idsMacCountCache;
  if (result < 0)
  {
    self->_idsMacCountCache = 0;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent idsDeviceArray](self, "idsDeviceArray", 0));
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v8), "modelIdentifier"));
          v10 = objc_msgSend(v9, "containsString:", CFSTR("Mac"));

          if (v10)
            ++self->_idsMacCountCache;
          v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v6);
    }

    return self->_idsMacCountCache;
  }
  return result;
}

- (void)_idsMeDeviceChanged
{
  SDNearbyAgent *v3;
  NSSet *idsBluetoothDeviceIDsForMe;
  NSMutableSet *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v3 = self;
  objc_sync_enter(v3);
  idsBluetoothDeviceIDsForMe = v3->_idsBluetoothDeviceIDsForMe;
  v3->_idsBluetoothDeviceIDsForMe = 0;

  objc_sync_exit(v3);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v3->_ddRequests;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v10, "discoveryFlags", (_QWORD)v12) & 0x100000) != 0)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent _idsBluetoothDeviceIDsForMe](v3, "_idsBluetoothDeviceIDsForMe"));
          objc_msgSend(v10, "setDeviceFilter:", v11);

        }
      }
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  -[SDNearbyAgent _update](v3, "_update");
}

- (BOOL)_idsShouldAdvertiseNearbyInfo
{
  int idsShouldAdvertiseNearbyInfo;
  void *v5;
  uint64_t v6;
  int DeviceClass;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];

  idsShouldAdvertiseNearbyInfo = self->_idsShouldAdvertiseNearbyInfo;
  if ((idsShouldAdvertiseNearbyInfo & 0x80000000) == 0)
    return idsShouldAdvertiseNearbyInfo > 0;
  self->_idsShouldAdvertiseNearbyInfo = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent idsDeviceArray](self, "idsDeviceArray"));
  DeviceClass = GestaltGetDeviceClass(v5, v6);
  if (DeviceClass == 6)
  {
    if ((unint64_t)objc_msgSend(v5, "count") < 2)
    {
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v8 = v5;
      v15 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v21;
LABEL_19:
        v18 = 0;
        while (1)
        {
          if (*(_QWORD *)v21 != v17)
            objc_enumerationMutation(v8);
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v18), "modelIdentifier", (_QWORD)v20));
          v14 = v19;
          if (v19)
          {
            if ((objc_msgSend(v19, "hasPrefix:", CFSTR("iPhone")) & 1) == 0)
              goto LABEL_30;
          }

          if (v16 == (id)++v18)
          {
            v16 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
            if (v16)
              goto LABEL_19;
            goto LABEL_26;
          }
        }
      }
      goto LABEL_26;
    }
  }
  else if (DeviceClass == 1)
  {
    if ((unint64_t)objc_msgSend(v5, "count") < 2)
    {
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v8 = v5;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v25;
LABEL_8:
        v12 = 0;
        while (1)
        {
          if (*(_QWORD *)v25 != v11)
            objc_enumerationMutation(v8);
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v12), "modelIdentifier"));
          v14 = v13;
          if (v13)
          {
            if ((objc_msgSend(v13, "hasPrefix:", CFSTR("Watch")) & 1) == 0)
              break;
          }

          if (v10 == (id)++v12)
          {
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
            if (v10)
              goto LABEL_8;
            goto LABEL_26;
          }
        }
LABEL_30:
        self->_idsShouldAdvertiseNearbyInfo = 1;

        goto LABEL_31;
      }
LABEL_26:

LABEL_29:
      idsShouldAdvertiseNearbyInfo = self->_idsShouldAdvertiseNearbyInfo;
      return idsShouldAdvertiseNearbyInfo > 0;
    }
  }
  else if (!objc_msgSend(v5, "count"))
  {
    goto LABEL_29;
  }
  self->_idsShouldAdvertiseNearbyInfo = 1;
LABEL_31:

  return 1;
}

- (int)_idsWatchCount
{
  int result;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  SDNearbyAgent *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  result = self->_idsWatchCountCache;
  if (result < 0)
  {
    self->_idsWatchCountCache = 0;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v18 = self;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent idsDeviceArray](self, "idsDeviceArray"));
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v23 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "modelIdentifier"));
          v11 = objc_msgSend(v10, "containsString:", CFSTR("Watch"));

          if (v11)
          {
            v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "modelIdentifier"));
            v13 = GestaltProductTypeStringToDeviceClass();
            if (v9)
            {
              objc_msgSend(v9, "operatingSystemVersion");
              v14 = v21;
              objc_msgSend(v9, "operatingSystemVersion");
              v15 = v20;
              objc_msgSend(v9, "operatingSystemVersion");
              v16 = v19;
            }
            else
            {
              v16 = 0;
              v15 = 0;
              v14 = 0;
              v21 = 0;
              v20 = 0;
              v19 = 0;
            }
            v17 = DeviceOSVersionAtOrLaterEx(v13, v14, v15, v16, 170400, 140400, 170400, 100400, 10100);

            if (v17)
              ++v18->_idsWatchCountCache;
          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v6);
    }

    return v18->_idsWatchCountCache;
  }
  return result;
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7 context:(id)a8
{
  _BOOL4 v10;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v10 = a6;
  v18 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v17 = a8;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1007B3A28 <= 20 && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 20)))
    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent service:account:identifier:didSendWithSuccess:error:context:]", 20, "IDS service %@, account %@, identifier %@, success %d, error %@, context @\n", v18, v14, v15, v10, v16, v17);

}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 hasBeenDeliveredWithContext:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;

  v13 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1007B3A28 <= 20 && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 20)))
    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent service:account:identifier:hasBeenDeliveredWithContext:]", 20, "IDS service %@, account %@, identifier %@, context @\n", v13, v10, v11, v12);

}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v16 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1007B3A28 <= 20 && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 20)))
    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent service:account:incomingMessage:fromID:context:]", 20, "IDS service %@, account %@, message %@, fromID %@, context %@\n", v16, v12, v13, v14, v15);

}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  id v6;
  SDNearbyAgent *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1007B3A28 <= 30 && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent service:activeAccountsChanged:]", 30, "IDS service %@ activeAccountsChanged %@\n", v9, v6);
  v7 = self;
  objc_sync_enter(v7);
  v7->_idsIsSignedInCache = -1;
  objc_sync_exit(v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v8, "postNotificationName:object:", CFSTR("SDNotificationNameIDSAccountsChanged"), v7);

  -[SDNearbyAgent service:devicesChanged:](v7, "service:devicesChanged:", v9, 0);
}

- (void)service:(id)a3 connectedDevicesChanged:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1007B3A28 <= 20 && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 20)))
    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent service:connectedDevicesChanged:]", 20, "IDS service %@ connectedDevicesChanged %@\n", v7, v6);
  self->_idsHasActiveWatchCache = -1;
  -[SDNearbyAgent _update](self, "_update");

}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  id v6;
  SDNearbyAgent *v7;
  NSArray *idsBluetoothDevicesArray;
  NSSet *idsBluetoothDevicesSet;
  NSArray *idsBluetoothDeviceIDsForLEPipe;
  NSSet *idsBluetoothDeviceIDsForMe;
  NSDictionary *idsDeviceBTDictionary;
  NSDictionary *idsDeviceCountBTDictionary;
  void *v14;
  NSMutableSet *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1007B3A28 <= 30 && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent service:devicesChanged:]", 30, "IDS devicesChanged: %d device(s)\n", objc_msgSend(v6, "count"));
  v7 = self;
  objc_sync_enter(v7);
  idsBluetoothDevicesArray = v7->_idsBluetoothDevicesArray;
  v7->_idsBluetoothDevicesArray = 0;

  idsBluetoothDevicesSet = v7->_idsBluetoothDevicesSet;
  v7->_idsBluetoothDevicesSet = 0;

  idsBluetoothDeviceIDsForLEPipe = v7->_idsBluetoothDeviceIDsForLEPipe;
  v7->_idsBluetoothDeviceIDsForLEPipe = 0;

  idsBluetoothDeviceIDsForMe = v7->_idsBluetoothDeviceIDsForMe;
  v7->_idsBluetoothDeviceIDsForMe = 0;

  objc_storeStrong((id *)&v7->_idsDeviceArray, a4);
  idsDeviceBTDictionary = v7->_idsDeviceBTDictionary;
  v7->_idsDeviceBTDictionary = 0;

  idsDeviceCountBTDictionary = v7->_idsDeviceCountBTDictionary;
  v7->_idsDeviceCountBTDictionary = 0;

  v7->_idsIsSignedInCache = -1;
  objc_sync_exit(v7);

  v7->_allowEnhancedDiscovery = -1;
  v7->_idsAppleTVCountCache = -1;
  v7->_idsContinuityDeviceCountCache = -1;
  v7->_idsMacCountCache = -1;
  *(_QWORD *)&v7->_idsShouldAdvertiseNearbyInfo = -1;
  v7->_idsWatchCountCache = -1;
  *(_QWORD *)&v7->_idsHasActiveWatchCache = -1;
  *(_QWORD *)&v7->_idsVisionOS1CountCache = -1;
  if (v7->_bleNearbyInfoScanner)
  {
    if (-[NSMutableSet count](v7->_caRequests, "count"))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent _idsBluetoothDeviceIDsForSharing](v7, "_idsBluetoothDeviceIDsForSharing"));
      -[SFBLEScanner setDeviceFilter:](v7->_bleNearbyInfoScanner, "setDeviceFilter:", v14);

    }
    else
    {
      -[SFBLEScanner setDeviceFilter:](v7->_bleNearbyInfoScanner, "setDeviceFilter:", 0);
    }
  }
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v15 = v7->_ddRequests;
  v16 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v20, "discoveryFlags") & 0x20) != 0)
        {
          v21 = objc_claimAutoreleasedReturnValue(-[SDNearbyAgent idsBluetoothDeviceIDsForSharing](v7, "idsBluetoothDeviceIDsForSharing"));
LABEL_22:
          v22 = (void *)v21;
          objc_msgSend(v20, "setDeviceFilter:", v21);

          continue;
        }
        if ((objc_msgSend(v20, "discoveryFlags") & 0x100000) != 0)
        {
          v21 = objc_claimAutoreleasedReturnValue(-[SDNearbyAgent _idsBluetoothDeviceIDsForMe](v7, "_idsBluetoothDeviceIDsForMe"));
          goto LABEL_22;
        }
        if ((objc_msgSend(v20, "discoveryFlags") & 0x200000) != 0)
        {
          v21 = objc_claimAutoreleasedReturnValue(-[SDNearbyAgent _idsBluetoothDeviceIDsForHomePods](v7, "_idsBluetoothDeviceIDsForHomePods"));
          goto LABEL_22;
        }
        if ((objc_msgSend(v20, "discoveryFlags") & 0x1000000) != 0)
          -[SDNearbyAgent _unlockDeviceFilterChangedForRequest:](v7, "_unlockDeviceFilterChangedForRequest:", v20);
      }
      v17 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v17);
  }

  -[SDNearbyAgent _registerForMagicMountUpdates](v7, "_registerForMagicMountUpdates");
  -[SDNearbyAgent _update](v7, "_update");
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v23, "postNotificationName:object:", CFSTR("SDNotificationNameIDSDevicesChanged"), v7);

}

- (BOOL)isDeviceValidRIServer:(id)a3
{
  if (self->_isRIClientEnabled)
    return objc_msgSend(a3, "hasPrefix:", CFSTR("iProd"));
  else
    return 0;
}

- (BOOL)isTempAuthTagKnown:(id)a3 bluetoothAddressData:(id)a4
{
  id v6;
  id v7;
  NSArray *v8;
  id v9;
  uint64_t v10;
  void *i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v6 = a3;
  v7 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_idIdentityArray;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v8);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i), "verifyAuthTag:data:type:error:", v6, v7, 2, 0, (_QWORD)v13) & 1) != 0)
        {
          LOBYTE(v9) = 1;
          goto LABEL_11;
        }
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v9;
}

- (int)serviceStart:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  id v8;
  uint64_t v9;
  unsigned int v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  int homePodModelCodeOverride;
  int v16;
  NSMutableDictionary *services;
  NSMutableDictionary *v18;
  NSMutableDictionary *v19;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "serviceUUID"));
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1007B3A28 <= 30 && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent serviceStart:]", 30, "Service start: %@\n", v4);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_services, "objectForKeyedSubscript:", v5));

    if (!v6)
    {
      if (objc_msgSend(v4, "needsSetup")
        && ((v7 = objc_msgSend(v4, "deviceActionType"), v7 == 11)
         || v7 == 33
         || objc_msgSend(v4, "deviceActionType") == 9
         || objc_msgSend(v4, "deviceActionType") == 10
         || objc_msgSend(v4, "deviceActionType") == 36
         || objc_msgSend(v4, "deviceActionType") == 1)
        || objc_msgSend(v4, "deviceActionType") == 19
        || objc_msgSend(v4, "deviceActionType") == 22)
      {
        v8 = objc_msgSend(v4, "deviceClassCode");
        if (!(_DWORD)v8)
          objc_msgSend(v4, "setDeviceClassCode:", SFDeviceClassCodeGet(v8, v9));
        v10 = objc_msgSend(v4, "deviceColorCode");
        if (v10 == SFDeviceColorCodeUnknown)
          objc_msgSend(v4, "setDeviceColorCode:", SFDeviceColorCodeGet());
        if (!objc_msgSend(v4, "deviceModelCode"))
          objc_msgSend(v4, "setDeviceModelCode:", SFDeviceModelCodeGet());
        if (self->_homePodIdentifiesAsB520)
        {
          if (dword_1007B3A28 <= 30
            && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
          {
            LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent serviceStart:]", 30, "Forcing this device to identify as a B520\n", v4);
          }
          objc_msgSend(v4, "setDeviceModelCode:", 5);
        }
        if (self->_homePodIdentifiesAsB620)
        {
          if (dword_1007B3A28 <= 30
            && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
          {
            LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent serviceStart:]", 30, "Forcing this device to identify as a B620\n", v4);
          }
          objc_msgSend(v4, "setDeviceModelCode:", 6);
        }
        homePodModelCodeOverride = self->_homePodModelCodeOverride;
        if (homePodModelCodeOverride < 0)
          goto LABEL_45;
        if (dword_1007B3A28 <= 30)
        {
          if (dword_1007B3A28 != -1
            || (v16 = _LogCategory_Initialize(&dword_1007B3A28, 30),
                homePodModelCodeOverride = self->_homePodModelCodeOverride,
                v16))
          {
            LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent serviceStart:]", 30, "Forcing this device to identify with model code %d\n", homePodModelCodeOverride);
            homePodModelCodeOverride = self->_homePodModelCodeOverride;
          }
        }
      }
      else
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
        v12 = (void *)SFServiceIdentifierProxHandoff;

        if (v11 != v12)
          goto LABEL_45;
        v13 = objc_msgSend(v4, "deviceClassCode");
        if (!(_DWORD)v13)
          objc_msgSend(v4, "setDeviceClassCode:", SFDeviceClassCodeGet(v13, v14));
        if (objc_msgSend(v4, "deviceModelCode"))
          goto LABEL_45;
        LOBYTE(homePodModelCodeOverride) = SFDeviceModelCodeGet();
      }
      objc_msgSend(v4, "setDeviceModelCode:", homePodModelCodeOverride);
LABEL_45:
      services = self->_services;
      if (!services)
      {
        v18 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        v19 = self->_services;
        self->_services = v18;

        services = self->_services;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](services, "setObject:forKeyedSubscript:", v4, v5);
      -[SDNearbyAgent _update](self, "_update");
      LODWORD(self) = 0;
      goto LABEL_48;
    }
    self = (SDNearbyAgent *)4294960575;
  }
  else
  {
    self = (SDNearbyAgent *)4294960551;
  }
  if (dword_1007B3A28 <= 60 && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 60)))
    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent serviceStart:]", 60, "### Service start failed: %#m\n", self);
LABEL_48:

  return (int)self;
}

- (void)serviceStop:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "serviceUUID"));
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1007B3A28 <= 30 && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent serviceStop:]", 30, "Service stop: %@\n", v5);
  if (v4)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_services, "removeObjectForKey:", v4);
    -[SDNearbyAgent _update](self, "_update");
  }
  else if (dword_1007B3A28 <= 60
         && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 60)))
  {
    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent serviceStop:]", 60, "### Service stop failed: %#m\n", 4294960551);
  }

}

- (void)serviceReceivedFrameType:(unsigned __int8)a3 serviceType:(unsigned __int8)a4 data:(id)a5 peer:(id)a6
{
  id v10;
  id v11;
  NSMutableDictionary *services;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  unsigned __int8 v18;
  unsigned __int8 v19;

  v10 = a5;
  v11 = a6;
  services = self->_services;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100202F70;
  v15[3] = &unk_10071B4E0;
  v18 = a4;
  v19 = a3;
  v16 = v10;
  v17 = v11;
  v13 = v11;
  v14 = v10;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](services, "enumerateKeysAndObjectsUsingBlock:", v15);

}

- (void)serviceSendEvent:(id)a3 service:(id)a4
{
  -[SDNearbyAgent _sendMessage:frameType:service:session:](self, "_sendMessage:frameType:service:session:", a3, 8, a4, 0);
}

- (void)serviceSendRequest:(id)a3 service:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD);
  const __CFString *v17;
  void *v18;

  v6 = a3;
  v7 = a4;
  v8 = -[SDNearbyAgent _sendMessage:frameType:service:session:](self, "_sendMessage:frameType:service:session:", v6, 9, v7, 0);
  if ((_DWORD)v8)
  {
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "responseMessageInternalHandler"));

    if (v10)
    {
      if (dword_1007B3A28 <= 60
        && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 60)))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
        LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent serviceSendRequest:service:]", 60, "### Completing error response for service request %@ for service %@\n", v11, v12);

      }
      v13 = objc_msgSend(objc_alloc((Class)SFResponseMessage), "initWithRequestMessage:", v6);
      v17 = CFSTR("error");
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v9));
      v18 = v14;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
      objc_msgSend(v13, "setHeaderFields:", v15);

      v16 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "responseMessageInternalHandler"));
      ((void (**)(_QWORD, id))v16)[2](v16, v13);

    }
  }

}

- (void)serviceSendResponse:(id)a3 service:(id)a4
{
  -[SDNearbyAgent _sendMessage:frameType:service:session:](self, "_sendMessage:frameType:service:session:", a3, 10, a4, 0);
}

- (int)sessionStart:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  NSMutableDictionary *bleConnections;
  NSMutableDictionary *v15;
  NSMutableDictionary *v16;
  void *v17;
  id v19;
  id v20;
  void *v21;
  void (**v22)(_QWORD, _QWORD);
  NSMutableDictionary *sessions;
  NSMutableDictionary *v24;
  NSMutableDictionary *v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "peerDevice"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (dword_1007B3A28 <= 30 && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "serviceUUID"));
    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent sessionStart:]", 30, "Session start: service %@, %@\n", v8, v7);

  }
  v9 = 0;
  v10 = 4294960588;
  if (!v6 || !v7)
    goto LABEL_38;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_sessions, "objectForKeyedSubscript:", v7));

  if (v11)
  {
    v9 = 0;
    v10 = 4294960575;
    goto LABEL_38;
  }
  if ((unint64_t)-[NSMutableDictionary count](self->_sessions, "count") > 0x7F)
  {
    v9 = 0;
    v10 = 4294960532;
    goto LABEL_38;
  }
  v12 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_bleConnections, "objectForKeyedSubscript:", v6));
  if (v12)
  {
    v9 = (id)v12;
    if (dword_1007B3A28 <= 30
      && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
    {
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent sessionStart:]", 30, "Reusing BLE connection for session %@\n", v4);
    }
    objc_msgSend(v9, "addClient:", v4);
    objc_msgSend(v9, "setAcceptor:", 0);
  }
  else
  {
    if (dword_1007B3A28 <= 30
      && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
    {
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent sessionStart:]", 30, "Create new BLE connection for session %@\n", v4);
    }
    v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bleDevice"));
    if (!v13)
    {
      v13 = objc_alloc_init((Class)SFBLEDevice);
      objc_msgSend(v13, "setIdentifier:", v6);
    }
    v9 = objc_msgSend(objc_alloc((Class)SFBLEConnection), "initWithDevice:acceptor:", v13, 0);
    objc_msgSend(v9, "setDispatchQueue:", self->_dispatchQueue);
    objc_msgSend(v9, "setSessionFlags:", objc_msgSend(v4, "sessionFlags"));
    bleConnections = self->_bleConnections;
    if (!bleConnections)
    {
      v15 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      v16 = self->_bleConnections;
      self->_bleConnections = v15;

      bleConnections = self->_bleConnections;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](bleConnections, "setObject:forKeyedSubscript:", v9, v6);
    objc_msgSend(v9, "addClient:", v4);
    objc_msgSend(v9, "activateDirect");

  }
  if (!objc_msgSend(v4, "serviceType"))
  {
    v28 = 0;
    v29 = 0;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "serviceUUID"));
    objc_msgSend(v17, "getUUIDBytes:", &v28);

    if (v28 == 0x10000001000000 && v29 == 0xDF80FBF31F000080)
    {
      v27 = -[SDNearbyAgent _setupSendCreateSession:cnx:](self, "_setupSendCreateSession:cnx:", v4, v9);
      if ((_DWORD)v27)
      {
        v10 = v27;
LABEL_38:
        if (dword_1007B3A28 <= 60
          && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 60)))
        {
          LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent sessionStart:]", 60, "### Session start failed: %#m\n", v10);
        }
        goto LABEL_35;
      }
    }
  }
  v19 = -[WPNearby state](self->_bleWPNearby, "state");
  if (v19)
  {
    v20 = v19;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bluetoothStateChangedHandler"));

    if (v21)
    {
      v22 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bluetoothStateChangedHandler"));
      ((void (**)(_QWORD, id))v22)[2](v22, v20);

    }
  }
  sessions = self->_sessions;
  if (!sessions)
  {
    v24 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v25 = self->_sessions;
    self->_sessions = v24;

    sessions = self->_sessions;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](sessions, "setObject:forKeyedSubscript:", v4, v7);
  -[SDNearbyAgent _update](self, "_update");
  LODWORD(v10) = 0;
LABEL_35:

  return v10;
}

- (void)sessionStop:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "peerDevice"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_bleConnections, "objectForKeyedSubscript:", v5));
    if (dword_1007B3A28 <= 30
      && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
    {
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent sessionStop:]", 30, "Session stop: %@, peer %@, connection %@\n", v8, v5, v6);
    }
    if (v6 && (objc_msgSend(v6, "removeClient:", v8) & 1) == 0)
    {
      if (dword_1007B3A28 <= 30
        && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
      {
        LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent sessionStop:]", 30, "Invalidating BLE connection for session %@\n", v8);
      }
      -[NSMutableDictionary removeObjectForKey:](self->_bleConnections, "removeObjectForKey:", v5);
      objc_msgSend(v6, "invalidate");
    }

  }
  else if (dword_1007B3A28 <= 30
         && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
  {
    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent sessionStop:]", 30, "Session stop: %@ (no peer/connection)\n", v8);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));

  if (v7)
    -[NSMutableDictionary removeObjectForKey:](self->_sessions, "removeObjectForKey:", v7);
  -[SDNearbyAgent _update](self, "_update");

}

- (void)sessionReceivedFrameType:(unsigned __int8)a3 serviceType:(unsigned __int8)a4 data:(id)a5 peer:(id)a6
{
  id v10;
  id v11;
  NSMutableDictionary *sessions;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  unsigned __int8 v18;
  unsigned __int8 v19;

  v10 = a5;
  v11 = a6;
  sessions = self->_sessions;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1002038BC;
  v15[3] = &unk_10071B508;
  v18 = a4;
  v19 = a3;
  v16 = v11;
  v17 = v10;
  v13 = v10;
  v14 = v11;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](sessions, "enumerateKeysAndObjectsUsingBlock:", v15);

}

- (void)sessionSendEvent:(id)a3 session:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  BOOL v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  void *v21;
  char v22;
  uint64_t v23;
  uint64_t v24;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "serviceUUID"));
  v23 = 0;
  v24 = 0;
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v8, "getUUIDBytes:", &v23);
    v10 = v23 == 0x10000006000000 && v24 == 0xDF80FBF31F000080;
    v11 = !v10;

    if (!v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "peerDevice"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));

      if (v13)
      {
        v14 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_bleConnections, "objectForKeyedSubscript:", v13));
        if (v14)
        {
          v15 = (void *)v14;
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "headerFields"));

          if (!v16)
          {
            v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bodyData"));
            if (objc_msgSend(v17, "length"))
            {
              v18 = objc_alloc_init((Class)NSMutableData);
              v22 = 11;
              objc_msgSend(v18, "appendBytes:length:", &v22, 1);
              objc_msgSend(v18, "appendData:", v17);
              v19[0] = _NSConcreteStackBlock;
              v19[1] = 3221225472;
              v19[2] = sub_100203CC0;
              v19[3] = &unk_1007156D0;
              v17 = v17;
              v20 = v17;
              v21 = v13;
              objc_msgSend(v15, "sendData:completion:", v18, v19);

            }
            else if (dword_1007B3A28 <= 60
                   && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 60)))
            {
              LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent sessionSendEvent:session:]", 60, "### Attempt to send Remote app message with no body\n");
            }
            goto LABEL_15;
          }
          if (dword_1007B3A28 <= 60
            && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 60)))
          {
            LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent sessionSendEvent:session:]", 60, "### Attempt to send Remote app message with header fields\n");
          }
LABEL_34:
          v17 = 0;
LABEL_15:

          goto LABEL_16;
        }
        if (dword_1007B3A28 <= 60
          && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 60)))
        {
          LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent sessionSendEvent:session:]", 60, "### Send Remote app message to %@ with no connection\n", v13);
        }
      }
      else if (dword_1007B3A28 <= 60
             && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 60)))
      {
        LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent sessionSendEvent:session:]", 60, "### Send Remote app message with no device identifier\n");
      }
      v15 = 0;
      goto LABEL_34;
    }
  }
  -[SDNearbyAgent _sendMessage:frameType:service:session:](self, "_sendMessage:frameType:service:session:", v6, 8, 0, v7);
LABEL_16:

}

- (void)sessionSendRequest:(id)a3 session:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void (**v16)(_QWORD, _QWORD);
  const __CFString *v17;
  void *v18;

  v6 = a3;
  v7 = a4;
  v8 = -[SDNearbyAgent _sendMessage:frameType:service:session:](self, "_sendMessage:frameType:service:session:", v6, 9, 0, v7);
  if ((_DWORD)v8)
  {
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "responseMessageInternalHandler"));

    if (v10)
    {
      if (dword_1007B3A28 <= 60
        && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 60)))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
        LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent sessionSendRequest:session:]", 60, "### Completing error response for request %@ for session %@\n", v11, v12);

      }
      v13 = objc_msgSend(objc_alloc((Class)SFResponseMessage), "initWithRequestMessage:", v6);
      v17 = CFSTR("error");
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v9));
      v18 = v14;
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1));
      objc_msgSend(v13, "setHeaderFields:", v15);

      v16 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "responseMessageInternalHandler"));
      ((void (**)(_QWORD, id))v16)[2](v16, v13);

    }
  }

}

- (void)sessionSendResponse:(id)a3 session:(id)a4
{
  -[SDNearbyAgent _sendMessage:frameType:service:session:](self, "_sendMessage:frameType:service:session:", a3, 10, 0, a4);
}

- (int)_sendMessage:(id)a3 frameType:(unsigned __int8)a4 service:(id)a5 session:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v37;
  void *v38;
  id v39;
  id v40;
  id v41;
  uint64_t v42;
  void *i;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  _BYTE *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id obj;
  void *v65;
  _QWORD v66[4];
  id v67;
  id v68;
  _QWORD v69[4];
  id v70;
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  unsigned int v76;
  unsigned __int8 v77;
  _BYTE v78[128];
  _QWORD v79[2];
  uint64_t v80;
  uint64_t v81;

  v10 = a3;
  v77 = a4;
  v11 = a5;
  v12 = a6;
  v65 = v10;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
  v76 = 0;
  v80 = 0;
  v81 = 0;
  v79[0] = 0;
  v79[1] = 0;
  v63 = v13;
  if (!-[NSMutableDictionary count](self->_bleConnections, "count"))
  {
    v15 = 0;
    v16 = 0;
    v22 = 0;
    v23 = 0;
    v32 = 0;
    v33 = 0;
    v34 = 0;
    v31 = 0;
    v76 = 0;
    goto LABEL_48;
  }
  if (v12)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "peerDevice"));
    v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));

    v16 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
    v17 = v12;
  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "peerDevice"));
    v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "identifier"));

    if (!v15)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_bleConnections, "allValues"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "firstObject"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "peerDevice"));
      v15 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "identifier"));

    }
    v16 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", &unk_1005CD26B);
    v17 = v11;
  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "serviceUUID"));
  if (!v15)
  {
    v76 = 0;
    if (dword_1007B3A28 <= 20
      && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 20)))
    {
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _sendMessage:frameType:service:session:]", 20, "### Send message no device\n");
    }
    v15 = 0;
    v23 = 0;
    goto LABEL_72;
  }
  v23 = objc_alloc_init((Class)NSMutableData);
  objc_msgSend(v23, "appendBytes:length:", &v77, 1);
  if (!v16)
  {
    v76 = -6708;
    if (dword_1007B3A28 <= 60
      && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 60)))
    {
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _sendMessage:frameType:service:session:]", 60, "### Send message no session\n");
    }
    v16 = 0;
    goto LABEL_72;
  }
  objc_msgSend(v16, "getUUIDBytes:", v79);
  objc_msgSend(v23, "appendBytes:length:", v79, 16);
  if (!v13)
  {
    v76 = -6708;
    if (dword_1007B3A28 <= 60
      && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 60)))
    {
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _sendMessage:frameType:service:session:]", 60, "### Send message no message identifier\n");
    }
LABEL_72:
    v32 = 0;
    v33 = 0;
    v34 = 0;
    v31 = 0;
    goto LABEL_48;
  }
  v24 = v11;
  objc_msgSend(v13, "getUUIDBytes:", v79);
  objc_msgSend(v23, "appendBytes:length:", v79, 16);
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "headerFields"));
  if (!v25)
    v25 = &__NSDictionary0__struct;
  v62 = v25;
  v26 = objc_msgSend(v25, "mutableCopy");
  v27 = v26;
  if (v22)
  {
    objc_msgSend(v22, "getUUIDBytes:", &v80);
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", &v80, 16));
    objc_msgSend(v27, "setObject:forKeyedSubscript:", v28, CFSTR("_serviceUUID"));

    v61 = v27;
    v29 = CFBinaryPlistStreamedCreateDataEx(v27, 92, &v76);
    v30 = (void *)v29;
    if (v76)
    {
      v31 = 0;
      v33 = v27;
      v32 = v62;
      v11 = v24;
      v34 = (void *)v29;
      goto LABEL_48;
    }
    objc_msgSend(v23, "appendData:", v29);
    v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "bodyData"));
    v11 = v24;
    if (!v35)
      v35 = objc_claimAutoreleasedReturnValue(+[NSData data](NSData, "data"));
    v60 = (void *)v35;
    v34 = (void *)CFBinaryPlistStreamedCreateDataEx(v35, 92, &v76);

    if (!v76)
    {
      objc_msgSend(v23, "appendData:", v34);
      if (v80 != 0x10000001000000 || v81 != 0xDF80FBF31F000080)
      {
        v59 = v22;
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "deviceIDs"));
        obj = v37;
        if (v37)
        {
          v38 = v37;
          v57 = v34;
          v39 = v23;
          v58 = v11;
          v74 = 0u;
          v75 = 0u;
          v72 = 0u;
          v73 = 0u;
          v40 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v72, v78, 16);
          if (v40)
          {
            v41 = v40;
            v42 = *(_QWORD *)v73;
            do
            {
              for (i = 0; i != v41; i = (char *)i + 1)
              {
                v44 = v15;
                if (*(_QWORD *)v73 != v42)
                  objc_enumerationMutation(obj);
                v15 = *(id *)(*((_QWORD *)&v72 + 1) + 8 * (_QWORD)i);

                v45 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_bleConnections, "objectForKeyedSubscript:", v15));
                if (v45)
                {
                  v69[0] = _NSConcreteStackBlock;
                  v69[1] = 3221225472;
                  v69[2] = sub_100204858;
                  v69[3] = &unk_1007156D0;
                  v70 = v15;
                  v71 = v65;
                  objc_msgSend(v45, "sendData:completion:", v39, v69);

                }
                else if (dword_1007B3A28 <= 60
                       && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 60)))
                {
                  LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _sendMessage:frameType:service:session:]", 60, "### Send message no connection for device %@\n", v15);
                }

              }
              v38 = obj;
              v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v72, v78, 16);
            }
            while (v41);
          }

          v15 = 0;
          v11 = v58;
          v34 = v57;
          v23 = v39;
          v33 = v61;
          v32 = v62;
        }
        else
        {
          v50 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_bleConnections, "objectForKeyedSubscript:", v15));
          if (v50)
          {
            v51 = (void *)v50;
            v66[0] = _NSConcreteStackBlock;
            v66[1] = 3221225472;
            v66[2] = sub_1002048FC;
            v66[3] = &unk_1007156D0;
            v15 = v15;
            v67 = v15;
            v68 = v65;
            objc_msgSend(v51, "sendData:completion:", v23, v66);

          }
          else
          {
            v76 = -6708;
            if (dword_1007B3A28 <= 60
              && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 60)))
            {
              LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _sendMessage:frameType:service:session:]", 60, "### Send message no connection\n");
            }
          }
          v33 = v61;
          v32 = v62;
          v38 = 0;
        }

        v22 = v59;
        goto LABEL_47;
      }
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_bleConnections, "objectForKeyedSubscript:", v15));
      if (v46)
      {
        v47 = v23;
        v48 = objc_retainAutorelease(v23);
        v49 = objc_msgSend(v48, "mutableBytes");
        if (v77 - 8 <= 2)
          *v49 = v77 + 26;
        v76 = -[SDNearbyAgent _setupSendData:sessionIdentifier:cnx:clientSession:](self, "_setupSendData:sessionIdentifier:cnx:clientSession:", v48, v16, v46, v12);
      }
      else
      {
        v47 = v23;
        v76 = -6708;
        if (dword_1007B3A28 <= 60
          && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 60)))
        {
          LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _sendMessage:frameType:service:session:]", 60, "### Send message no connection\n");
        }
      }

      v23 = v47;
    }
    v33 = v61;
    v32 = v62;
LABEL_47:
    v31 = v60;
    goto LABEL_48;
  }
  v76 = -6708;
  if (dword_1007B3A28 > 60)
  {
    v22 = 0;
    v31 = 0;
    v32 = v62;
    v33 = v26;
  }
  else
  {
    v32 = v62;
    v33 = v26;
    if (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 60))
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _sendMessage:frameType:service:session:]", 60, "### Send message no service UUID\n");
    v22 = 0;
    v31 = 0;
  }
  v11 = v24;
  v34 = 0;
LABEL_48:
  v52 = (void *)v76;
  if (v76)
  {
    if (dword_1007B3A28 <= 60)
    {
      if (dword_1007B3A28 != -1
        || (v53 = v31, v54 = _LogCategory_Initialize(&dword_1007B3A28, 60), v31 = v53, v52 = (void *)v76, v54))
      {
        v56 = v52;
        v52 = v31;
        LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _sendMessage:frameType:service:session:]", 60, "### Send message failed: %#m\n", v56);
        v31 = v52;
        LODWORD(v52) = v76;
      }
    }
  }

  return (int)v52;
}

- (int)_setupHandleCreateSession:(id)a3 data:(id)a4
{
  id v6;
  id v7;
  char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  char *v14;
  id v15;
  uint64_t v16;
  void *v17;
  char *v18;
  SDSession *v19;
  void *v20;
  void *v21;
  NSMutableDictionary *setupSessions;
  NSMutableDictionary *v23;
  NSMutableDictionary *v24;
  void *v25;
  void *v26;
  id v27;
  void *v29;
  char v30;
  _OWORD v31[2];
  _OWORD v32[2];
  _OWORD v33[2];
  _OWORD v34[2];

  v6 = a3;
  v7 = objc_retainAutorelease(a4);
  v8 = (char *)objc_msgSend(v7, "bytes");
  v9 = (uint64_t)objc_msgSend(v7, "length");
  if (dword_1007B3A28 <= 50 && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 50)))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "peerDevice"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _setupHandleCreateSession:data:]", 50, "BLE SetupCreateSession received from %@: %'.32@\n", v11, v7);

  }
  memset(v34, 0, sizeof(v34));
  memset(v33, 0, sizeof(v33));
  memset(v32, 0, sizeof(v32));
  memset(v31, 0, sizeof(v31));
  v12 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", &unk_1005CD25A);
  if (!v12)
  {
    v13 = 0;
LABEL_18:
    v16 = 4294960596;
    goto LABEL_21;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_services, "objectForKeyedSubscript:", v12));
  if (!v13)
  {
    v16 = 4294960569;
    goto LABEL_21;
  }
  if (v9 > 16)
  {
    if ((unint64_t)v9 < 0x31)
    {
      v16 = 4294960553;
      goto LABEL_21;
    }
    v14 = v8 + 1;
    v15 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", v8 + 1);
    if (v15)
    {
      v16 = (uint64_t)v15;
      v29 = v13;
      v17 = v6;
      v18 = v8 + 17;
      v19 = (SDSession *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_setupSessions, "objectForKeyedSubscript:", v15));
      if (!v19)
      {
        v19 = objc_alloc_init(SDSession);
        -[SDSession setIdentifier:](v19, "setIdentifier:", v16);
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "peerDevice"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "identifier"));
        -[SDSession setPeerIdentifier:](v19, "setPeerIdentifier:", v21);

        setupSessions = self->_setupSessions;
        if (!setupSessions)
        {
          v23 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          v24 = self->_setupSessions;
          self->_setupSessions = v23;

          setupSessions = self->_setupSessions;
        }
        -[NSMutableDictionary setObject:forKeyedSubscript:](setupSessions, "setObject:forKeyedSubscript:", v19, v16);
      }
      -[SDSession setSessionCreated:](v19, "setSessionCreated:", 1);
      RandomBytes(v33, 32);
      cccurve25519_make_pub(v34, v33);
      cccurve25519(v32, v33, v18);
      CryptoHKDF(kCryptoHashDescriptor_SHA512, v32, 32, "WriteSalt", 9, "WriteKey", 8, 32, v31);
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v31, 32));
      -[SDSession setReadKey:](v19, "setReadKey:", v25);

      -[SDSession setReadNonce:](v19, "setReadNonce:", 0);
      CryptoHKDF(kCryptoHashDescriptor_SHA512, v32, 32, "ReadSalt", 8, "ReadKey", 7, 32, v31);
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v31, 32));
      -[SDSession setWriteKey:](v19, "setWriteKey:", v26);

      -[SDSession setWriteNonce:](v19, "setWriteNonce:", 0);
      v27 = objc_alloc_init((Class)NSMutableData);
      v30 = 33;
      objc_msgSend(v27, "appendBytes:length:", &v30, 1);
      objc_msgSend(v27, "appendBytes:length:", v14, 16);
      objc_msgSend(v27, "appendBytes:length:", v34, 32);
      v6 = v17;
      objc_msgSend(v17, "sendData:completion:", v27, 0);

      LODWORD(v16) = 0;
      v13 = v29;
      goto LABEL_15;
    }
    goto LABEL_18;
  }
  v16 = 4294960588;
LABEL_21:
  if (dword_1007B3A28 <= 60 && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 60)))
    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _setupHandleCreateSession:data:]", 60, "### BLE SetupCreateSession failed: %#m\n", v16);
LABEL_15:

  return v16;
}

- (int)_setupHandleSessionCreated:(id)a3 data:(id)a4
{
  id v6;
  id v7;
  char *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  int v24;
  _OWORD v26[2];
  _OWORD v27[2];

  v6 = a3;
  v7 = objc_retainAutorelease(a4);
  v8 = (char *)objc_msgSend(v7, "bytes");
  v9 = (uint64_t)objc_msgSend(v7, "length");
  if (dword_1007B3A28 <= 50 && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 50)))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "peerDevice"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _setupHandleSessionCreated:data:]", 50, "BLE SetupSessionCreated received from %@: %'.32@\n", v11, v7);

  }
  memset(v27, 0, sizeof(v27));
  memset(v26, 0, sizeof(v26));
  if (v9 <= 16)
  {
    v12 = 0;
    v14 = 0;
    v24 = -6708;
  }
  else if ((unint64_t)v9 < 0x31)
  {
    v12 = 0;
    v14 = 0;
    v24 = -6743;
  }
  else
  {
    v12 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", v8 + 1);
    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_setupSessions, "objectForKeyedSubscript:", v12));
      v14 = v13;
      if (v13)
      {
        v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "dhSecretKey")));
        v16 = objc_msgSend(v15, "bytes");

        if (v16)
        {
          cccurve25519(v27, v16, v8 + 17);
          CryptoHKDF(kCryptoHashDescriptor_SHA512, v27, 32, "ReadSalt", 8, "ReadKey", 7, 32, v26);
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v26, 32));
          objc_msgSend(v14, "setReadKey:", v17);

          objc_msgSend(v14, "setReadNonce:", 0);
          CryptoHKDF(kCryptoHashDescriptor_SHA512, v27, 32, "WriteSalt", 9, "WriteKey", 8, 32, v26);
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v26, 32));
          objc_msgSend(v14, "setWriteKey:", v18);

          objc_msgSend(v14, "setWriteNonce:", 0);
          objc_msgSend(v14, "setSessionCreated:", 1);
          while (1)
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "sendDataQueue"));
            v20 = objc_msgSend(v19, "count");

            if (!v20)
              break;
            v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "sendDataQueue"));
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "firstObject"));

            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "sendDataQueue"));
            objc_msgSend(v23, "removeObjectAtIndex:", 0);

            -[SDNearbyAgent _setupSendData:sessionIdentifier:cnx:clientSession:](self, "_setupSendData:sessionIdentifier:cnx:clientSession:", v22, v12, v6, 0);
          }
          v24 = 0;
        }
        else
        {
          v24 = -6745;
        }
      }
      else
      {
        v24 = -6727;
      }
    }
    else
    {
      v14 = 0;
      v24 = -6700;
    }
  }

  return v24;
}

- (int)_setupHandleSessionEncryptedFrame:(id)a3 type:(unsigned __int8)a4 cnx:(id)a5
{
  id v7;
  id v8;
  id v9;
  char *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v29;
  id v30;
  unsigned int v31;
  _QWORD v32[2];

  v31 = a4;
  v7 = a3;
  v8 = a5;
  v9 = objc_retainAutorelease(v7);
  v10 = (char *)objc_msgSend(v9, "bytes");
  v11 = (uint64_t)objc_msgSend(v9, "length");
  if (dword_1007B3A28 <= 30 && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "peerDevice"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _setupHandleSessionEncryptedFrame:type:cnx:]", 30, "BLE SetupEMsg type 0x%02X received from %@: %'.32@\n", v31, v13, v9);

  }
  memset(v32, 0, 12);
  if (v11 <= 16)
  {
    v22 = 0;
    v17 = 0;
    v15 = 0;
    v25 = 4294960588;
    goto LABEL_13;
  }
  v30 = v9;
  v14 = v11 - 33;
  if ((unint64_t)v11 < 0x21)
  {
    v22 = 0;
    v17 = 0;
    v15 = 0;
    v25 = 4294960553;
LABEL_22:
    v9 = v30;
    goto LABEL_13;
  }
  v15 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", v10 + 1);
  if (!v15)
  {
    v22 = 0;
    v17 = 0;
    v25 = 4294960596;
    goto LABEL_22;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_setupSessions, "objectForKeyedSubscript:", v15));
  if (v16)
  {
    v17 = v16;
    v29 = v15;
    v18 = v8;
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "readKey")));
    v20 = objc_msgSend(v19, "bytes");

    if (v20)
    {
      v21 = (uint64_t)&v10[v11 - 16];
      LODWORD(v32[0]) = 0;
      *(_QWORD *)((char *)v32 + 4) = objc_msgSend(v17, "readNonce");
      v22 = objc_retainAutorelease(objc_msgSend(objc_alloc((Class)NSMutableData), "initWithLength:", v11 - 33));
      v23 = (char *)objc_msgSend(v22, "mutableBytes");
      v24 = chacha20_poly1305_decrypt_all_96x32(v20, v32, v10, 17, v10 + 17, v14, v23, v21);
      if ((_DWORD)v24)
      {
        v25 = v24;
        v8 = v18;
      }
      else
      {
        objc_msgSend(v17, "setReadNonce:", (char *)objc_msgSend(v17, "readNonce") + 1);
        v8 = v18;
        v25 = -[SDNearbyAgent _setupHandleSessionMessageType:src:end:cnx:session:](self, "_setupHandleSessionMessageType:src:end:cnx:session:", v31, v23, &v23[v14], v18, v17);
        if (!(_DWORD)v25)
        {
          v15 = v29;
          v9 = v30;
          goto LABEL_18;
        }
      }
      v15 = v29;
      v9 = v30;
    }
    else
    {
      v22 = 0;
      v25 = 4294960551;
      v8 = v18;
      v15 = v29;
      v9 = v30;
    }
  }
  else
  {
    if (dword_1007B3A28 > 60)
    {
      v22 = 0;
      v17 = 0;
      LODWORD(v25) = -6727;
      v9 = v30;
      goto LABEL_18;
    }
    v9 = v30;
    if (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 60))
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _setupHandleSessionEncryptedFrame:type:cnx:]", 60, "### BLE SetupEMsg session %@ not found\n", v15);
    v22 = 0;
    v17 = 0;
    v25 = 4294960569;
  }
LABEL_13:
  if (dword_1007B3A28 <= 60 && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 60)))
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "peerDevice"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "identifier"));
    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _setupHandleSessionEncryptedFrame:type:cnx:]", 60, "### BLE SetupEMsg type 0x%02X received from %@ failed: %#m\n", v31, v27, v25);

  }
LABEL_18:

  return v25;
}

- (int)_setupHandleSessionMessageType:(unsigned __int8)a3 src:(const char *)a4 end:(const char *)a5 cnx:(id)a6 session:(id)a7
{
  int v10;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  SDNearbyAgent *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void (**v30)(_QWORD, _QWORD);
  void *v31;
  void (**v32)(_QWORD, _QWORD);
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  _QWORD *v38;
  void (*v39)(void);
  void *v40;
  void (**v41)(_QWORD, _QWORD);
  void *v42;
  uint64_t v43;
  void *v44;
  void (**v45)(_QWORD, _QWORD);
  int v46;
  int v48;
  SDNearbyAgent *v49;
  SEL v50;
  id v51;
  id v52;
  void *v53;
  id v54;
  id v55;
  id v56;
  unsigned int v57;
  const char *v58;

  v10 = a3;
  v58 = a4;
  v56 = a6;
  v55 = a7;
  v57 = 0;
  if (a5 - a4 <= 15)
  {
    v57 = -6750;
    if (dword_1007B3A28 <= 60
      && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 60)))
    {
      LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _setupHandleSessionMessageType:src:end:cnx:session:]", 60, "### BLE SetupRecvMsg no message ID (%tu bytes)\n", a5 - a4);
    }
    v12 = 0;
    v53 = 0;
    goto LABEL_65;
  }
  v12 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", a4);
  v58 = a4 + 16;
  v13 = CFBinaryPlistStreamedCreateWithBytesEx2(a4 + 16, a5 - (a4 + 16), 112, &v58, &v57);
  v53 = (void *)v13;
  if (v57)
  {
LABEL_65:
    v16 = 0;
    goto LABEL_66;
  }
  v14 = v13;
  v15 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v14, v15) & 1) == 0)
  {
    v16 = 0;
    goto LABEL_59;
  }
  v16 = (void *)CFBinaryPlistStreamedCreateWithBytesEx2(v58, a5 - v58, 112, &v58, &v57);
  if (v57)
  {
LABEL_66:
    v21 = 0;
    v20 = 0;
    v33 = 0;
    v22 = 0;
    v24 = 0;
    goto LABEL_35;
  }
  v17 = objc_opt_class(NSData);
  if ((objc_opt_isKindOfClass(v16, v17) & 1) == 0)
  {
LABEL_59:
    v21 = 0;
    v20 = 0;
    v33 = 0;
    v22 = 0;
    v24 = 0;
    v28 = 0;
    v57 = -6756;
    goto LABEL_36;
  }
  switch(v10)
  {
    case '$':
      v18 = self;
      v19 = objc_alloc_init((Class)SFResponseMessage);
      v21 = 0;
      v20 = 0;
      v54 = v19;
      break;
    case '#':
      v18 = self;
      v19 = objc_alloc_init((Class)SFRequestMessage);
      v21 = 0;
      v54 = 0;
      v20 = v19;
      break;
    case '"':
      v18 = self;
      v19 = objc_alloc_init((Class)SFEventMessage);
      v20 = 0;
      v54 = 0;
      v21 = v19;
      break;
    default:
      v49 = (SDNearbyAgent *)FatalErrorF("Bad frame type: %d", v10);
      return -[SDNearbyAgent _setupSendCreateSession:cnx:](v49, v50, v51, v52);
  }
  v22 = v19;
  v23 = v12;
  objc_msgSend(v22, "setIdentifier:", v12);
  objc_msgSend(v22, "setHeaderFields:", v14);
  objc_msgSend(v22, "setBodyData:", v16);
  v24 = objc_alloc_init((Class)SFDevice);
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "peerDevice"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "identifier"));
  objc_msgSend(v24, "setIdentifier:", v26);

  objc_msgSend(v22, "setPeerDevice:", v24);
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "clientSession"));
  if (!v27)
  {
    v34 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", &unk_1005CD25A);
    if (v34)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v18->_services, "objectForKeyedSubscript:", v34));
      v36 = v35;
      if (v35)
      {
        if (v21
          && (v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "eventMessageHandler")),
              v37,
              v37))
        {
          v38 = (_QWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "eventMessageHandler"));
          v39 = (void (*)(void))v38[2];
        }
        else
        {
          if (!v20
            || (v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "requestMessageHandler")),
                v42,
                !v42))
          {
            if (v54)
            {
              v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "responseMessageInternalHandler"));

              if (v44)
              {
                v45 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "responseMessageInternalHandler"));
                v33 = v54;
                ((void (**)(_QWORD, id))v45)[2](v45, v54);

                v12 = v23;
                goto LABEL_34;
              }
            }
            if (dword_1007B3A28 <= 60)
            {
              v12 = v23;
              if (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 60))
                LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _setupHandleSessionMessageType:src:end:cnx:session:]", 60, "### BLE NearbyInfo setup service receive with no handler: %@\n", v22);
              goto LABEL_33;
            }
LABEL_32:
            v12 = v23;
LABEL_33:
            v33 = v54;
LABEL_34:

LABEL_35:
            v28 = 0;
            goto LABEL_36;
          }
          v38 = (_QWORD *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "requestMessageHandler"));
          v39 = (void (*)(void))v38[2];
        }
        v39();

        goto LABEL_32;
      }
      v48 = -6727;
    }
    else
    {
      v36 = 0;
      v48 = -6700;
    }
    v57 = v48;
    goto LABEL_32;
  }
  v28 = v27;
  if (v21
    && (v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "eventMessageHandler")), v29,
                                                                                                   v29))
  {
    v30 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "eventMessageHandler"));
    ((void (**)(_QWORD, void *))v30)[2](v30, v21);

    v12 = v23;
  }
  else
  {
    v12 = v23;
    if (!v20
      || (v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "requestMessageHandler")),
          v31,
          !v31))
    {
      v33 = v54;
      if (v54
        && (v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "responseMessageInternalHandler")),
            v40,
            v40))
      {
        v41 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "responseMessageInternalHandler"));
        ((void (**)(_QWORD, id))v41)[2](v41, v54);

      }
      else if (dword_1007B3A28 <= 60
             && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 60)))
      {
        LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _setupHandleSessionMessageType:src:end:cnx:session:]", 60, "### BLE NearbyInfo setup session receive with no handler: %@\n", v22);
      }
      goto LABEL_36;
    }
    v32 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "requestMessageHandler"));
    ((void (**)(_QWORD, void *))v32)[2](v32, v20);

  }
  v33 = v54;
LABEL_36:
  v43 = v57;
  if (v57)
  {
    if (dword_1007B3A28 <= 60)
    {
      if (dword_1007B3A28 != -1 || (v46 = _LogCategory_Initialize(&dword_1007B3A28, 60), v43 = v57, v46))
      {
        LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _setupHandleSessionMessageType:src:end:cnx:session:]", 60, "### BLE SetupRecvMsg failed: %#m\n", v43);
        LODWORD(v43) = v57;
      }
    }
  }

  return v43;
}

- (int)_setupSendCreateSession:(id)a3 cnx:(id)a4
{
  id v6;
  id v7;
  void *v8;
  SDSession *v9;
  void *v10;
  void *v11;
  NSMutableDictionary *setupSessions;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  void *v15;
  id v16;
  int v17;
  char v19;
  _QWORD v20[2];
  _OWORD v21[2];
  _OWORD v22[2];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  if (dword_1007B3A28 <= 50 && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 50)))
    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _setupSendCreateSession:cnx:]", 50, "BLE SetupSendCreateSession %@\n", v8);
  memset(v22, 0, sizeof(v22));
  memset(v21, 0, sizeof(v21));
  v20[0] = 0;
  v20[1] = 0;
  if (v8)
  {
    v9 = (SDSession *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_setupSessions, "objectForKeyedSubscript:", v8));
    if (!v9)
    {
      v9 = objc_alloc_init(SDSession);
      -[SDSession setIdentifier:](v9, "setIdentifier:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "peerDevice"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
      -[SDSession setPeerIdentifier:](v9, "setPeerIdentifier:", v11);

      setupSessions = self->_setupSessions;
      if (!setupSessions)
      {
        v13 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        v14 = self->_setupSessions;
        self->_setupSessions = v13;

        setupSessions = self->_setupSessions;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](setupSessions, "setObject:forKeyedSubscript:", v9, v8);
    }
    -[SDSession setClientSession:](v9, "setClientSession:", v6);
    RandomBytes(v21, 32);
    cccurve25519_make_pub(v22, v21);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", v21, 32));
    -[SDSession setDhSecretKey:](v9, "setDhSecretKey:", v15);

    v16 = objc_alloc_init((Class)NSMutableData);
    v19 = 32;
    objc_msgSend(v16, "appendBytes:length:", &v19, 1);
    objc_msgSend(v8, "getUUIDBytes:", v20);
    objc_msgSend(v16, "appendBytes:length:", v20, 16);
    objc_msgSend(v16, "appendBytes:length:", v22, 32);
    objc_msgSend(v7, "sendData:completion:", v16, 0);

    v17 = 0;
  }
  else if (dword_1007B3A28 <= 60
         && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 60)))
  {
    v17 = -6705;
    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _setupSendCreateSession:cnx:]", 60, "### BLE SetupSendCreateSession failed: %#m\n", 4294960591);
  }
  else
  {
    v17 = -6705;
  }

  return v17;
}

- (int)_setupSendData:(id)a3 sessionIdentifier:(id)a4 cnx:(id)a5 clientSession:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  char *v18;
  char *v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v34;
  id v35;
  _QWORD v36[2];
  int v37;
  id v38;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v36[0] = 0;
  v36[1] = 0;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_setupSessions, "objectForKeyedSubscript:", v11));
  if (v14
    || (v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](self->_setupSessions, "allValues")),
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "firstObject")),
        v30,
        !v13)
    || v14)
  {
LABEL_2:
    if ((objc_msgSend(v14, "sessionCreated") & 1) != 0)
    {
      v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "writeKey")));
      v16 = objc_msgSend(v15, "bytes");

      if (!v16)
      {
        v32 = 4294960551;
        goto LABEL_25;
      }
      v37 = 0;
      v38 = objc_msgSend(v14, "writeNonce");
      objc_msgSend(v14, "setWriteNonce:", (char *)objc_msgSend(v14, "writeNonce") + 1);
      if ((unint64_t)objc_msgSend(v10, "length") < 0x11)
      {
        v32 = 4294960553;
        goto LABEL_25;
      }
      v17 = objc_retainAutorelease(objc_msgSend(v10, "mutableCopy"));
      v18 = (char *)objc_msgSend(v17, "mutableBytes");
      v19 = (char *)objc_msgSend(v17, "length");
      if (*(_OWORD *)(v18 + 1) == 0)
      {
        v35 = v10;
        v20 = v11;
        v21 = v12;
        v22 = v13;
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));
        objc_msgSend(v23, "getUUIDBytes:", v18 + 1);

        v13 = v22;
        v12 = v21;
        v11 = v20;
        v10 = v35;
      }
      chacha20_poly1305_encrypt_all_96x32(v16, &v37, v18, 17, v18 + 17, v19 - 17, v18 + 17, v36);
      objc_msgSend(v17, "appendBytes:length:", v36, 16);
      objc_msgSend(v12, "sendData:completion:", v17, 0);

    }
    else
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "sendDataQueue"));
      v25 = objc_msgSend(v24, "count");

      if ((unint64_t)v25 > 0x7F)
      {
        v32 = 4294960532;
        goto LABEL_25;
      }
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "sendDataQueue"));

      if (!v26)
      {
        v27 = objc_alloc_init((Class)NSMutableArray);
        objc_msgSend(v14, "setSendDataQueue:", v27);

      }
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "sendDataQueue"));
      objc_msgSend(v28, "addObject:", v10);

      if (dword_1007B3A28 <= 30
        && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "sendDataQueue"));
        LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _setupSendData:sessionIdentifier:cnx:clientSession:]", 30, "BLE SetupSendMsg queuing data until session created (%ld)\n", objc_msgSend(v29, "count"));

      }
    }
    LODWORD(v32) = 0;
    goto LABEL_21;
  }
  v31 = v13;
  if (dword_1007B3A28 <= 50 && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 50)))
    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _setupSendData:sessionIdentifier:cnx:clientSession:]", 50, "BLE Setup re-creating lost session ID %@\n", v11);
  v32 = -[SDNearbyAgent _setupSendCreateSession:cnx:](self, "_setupSendCreateSession:cnx:", v31, v12);
  if ((_DWORD)v32)
    goto LABEL_24;
  v34 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_setupSessions, "objectForKeyedSubscript:", v11));
  if (v34)
  {
    v14 = (void *)v34;

    goto LABEL_2;
  }
  if (dword_1007B3A28 <= 60 && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 60)))
    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _setupSendData:sessionIdentifier:cnx:clientSession:]", 60, "### BLE SetupSendMsg no setup session after re-create?\n");
  v32 = 4294960534;
LABEL_24:

  v14 = 0;
LABEL_25:
  if (dword_1007B3A28 <= 60 && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 60)))
    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _setupSendData:sessionIdentifier:cnx:clientSession:]", 60, "### BLE SetupSendMsg failed: %#m\n", v32);
LABEL_21:

  return v32;
}

- (void)startUnlockBLEConnectionWithDevice:(id)a3 encrypted:(BOOL)a4
{
  id v6;
  NSObject *dispatchQueue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a3;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002062B8;
  block[3] = &unk_100715D58;
  block[4] = self;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  dispatch_async(dispatchQueue, block);

}

- (void)_startUnlockBLEConnectionWithDevice:(id)a3 encrypted:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  NSMutableDictionary *bleConnections;
  NSMutableDictionary *v12;
  NSMutableDictionary *v13;
  SDNearbyAgent *v14;
  SEL v15;
  id v16;
  id v17;

  v4 = a4;
  v17 = a3;
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "identifier"));
  if (v6)
  {
    v7 = (void *)v6;
    v8 = objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_bleConnections, "objectForKeyedSubscript:", v6));
    if (v8)
    {
      v9 = (id)v8;
      if (dword_1007B3A28 <= 30
        && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
      {
        LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _startUnlockBLEConnectionWithDevice:encrypted:]", 30, "Reusing BLE connection for unlock\n");
      }
      objc_msgSend(v9, "addClient:", self);
      objc_msgSend(v9, "setAcceptor:", 0);
    }
    else
    {
      if (dword_1007B3A28 <= 30
        && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
      {
        LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _startUnlockBLEConnectionWithDevice:encrypted:]", 30, "Creating BLE connection for unlock\n");
      }
      v9 = objc_msgSend(objc_alloc((Class)SFBLEConnection), "initWithDevice:acceptor:", v17, 0);
      objc_msgSend(v9, "setBleEncrypted:", v4);
      objc_msgSend(v9, "setDispatchQueue:", self->_dispatchQueue);
      objc_msgSend(v9, "setLatencyCritical:", 1);
      objc_msgSend(v9, "setUseCase:", 131075);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDNearbyAgent idsBluetoothDeviceIDsForLEPipe](self, "idsBluetoothDeviceIDsForLEPipe"));
      if (objc_msgSend(v10, "containsObject:", v7))
        objc_msgSend(v9, "setLePipeCapable:", 1);
      bleConnections = self->_bleConnections;
      if (!bleConnections)
      {
        v12 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        v13 = self->_bleConnections;
        self->_bleConnections = v12;

        bleConnections = self->_bleConnections;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](bleConnections, "setObject:forKeyedSubscript:", v9, v7);
      objc_msgSend(v9, "addClient:", self);
      objc_msgSend(v9, "activateDirect");

    }
  }
  else
  {
    v14 = (SDNearbyAgent *)FatalErrorF("Start unlock connection with no identifier");
    -[SDNearbyAgent stopUnlockBLEConnectionWithDevice:](v14, v15, v16);
  }
}

- (void)stopUnlockBLEConnectionWithDevice:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10020652C;
  v7[3] = &unk_100714860;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)_stopUnlockBLEConnectionWithDevice:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  SDNearbyAgent *v8;
  SEL v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v13 = a3;
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
  if (v4)
  {
    v5 = (void *)v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_bleConnections, "objectForKeyedSubscript:", v4));
    v7 = v6;
    if (v6 && (objc_msgSend(v6, "removeClient:", self) & 1) == 0)
    {
      if (dword_1007B3A28 <= 30
        && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
      {
        LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _stopUnlockBLEConnectionWithDevice:]", 30, "Invalidating BLE connection for unlock\n");
      }
      -[NSMutableDictionary removeObjectForKey:](self->_bleConnections, "removeObjectForKey:", v5);
      objc_msgSend(v7, "invalidate");
    }

  }
  else
  {
    v8 = (SDNearbyAgent *)FatalErrorF("Stop unlock connection with no identifier");
    -[SDNearbyAgent sendUnlockData:toBLEDevice:completion:](v8, v9, v10, v11, v12);
  }
}

- (void)sendUnlockData:(id)a3 toBLEDevice:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *dispatchQueue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1002066E8;
  v15[3] = &unk_100715F60;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(dispatchQueue, v15);

}

- (void)sendUnlockDataDirect:(id)a3 toBLEDevice:(id)a4 completion:(id)a5
{
  -[SDNearbyAgent _sendUnlockData:toBLEDevice:direct:completion:](self, "_sendUnlockData:toBLEDevice:direct:completion:", a3, a4, 1, a5);
}

- (void)_sendUnlockData:(id)a3 toBLEDevice:(id)a4 direct:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  void (**v12)(id, void *);
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  SFBLEPipe *unlockBtPipe;
  SDNearbyAgent *v19;
  SEL v20;
  id v21;
  id v22;
  id v23;
  char v24;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, void *))a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
  if (v13)
  {
    v14 = (void *)v13;
    if (self->_unlockBtPipe && objc_msgSend(v11, "useBTPipe"))
    {
      if (dword_1007B3A28 <= 30
        && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
      {
        LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _sendUnlockData:toBLEDevice:direct:completion:]", 30, "Send data req: %@ (%ld bytes)\n", v10, objc_msgSend(v10, "length"));
      }
      unlockBtPipe = self->_unlockBtPipe;
      if (v7)
        -[SFBLEPipe sendFrameTypeDirect:payload:completion:](unlockBtPipe, "sendFrameTypeDirect:payload:completion:", 3, v10, v12);
      else
        -[SFBLEPipe sendFrameType:payload:completion:](unlockBtPipe, "sendFrameType:payload:completion:", 3, v10, v12);
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_bleConnections, "objectForKeyedSubscript:", v14));
      if (v15)
      {
        v24 = 7;
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithBytes:length:](NSMutableData, "dataWithBytes:length:", &v24, 1));
        objc_msgSend(v16, "appendData:", v10);
        if (v7)
          objc_msgSend(v15, "sendDataDirect:completion:", v16, v12);
        else
          objc_msgSend(v15, "sendData:completion:", v16, v12);

      }
      else
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain, -6745, 0));
        v12[2](v12, v17);

      }
    }

  }
  else
  {
    v19 = (SDNearbyAgent *)FatalErrorF("Send unlock data to BLE device with no identifier");
    -[SDNearbyAgent _unlockReceivedFrameData:peer:device:](v19, v20, v21, v22, v23);
  }
}

- (void)_unlockReceivedFrameData:(id)a3 peer:(id)a4 device:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSMutableDictionary *services;
  id v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[2];
  _QWORD v20[2];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (dword_1007B3A28 <= 30 && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 30)))
    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _unlockReceivedFrameData:peer:device:]", 30, "AutoUnlock received %ld bytes from %@\n", objc_msgSend(v8, "length"), v9);
  services = self->_services;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100206A90;
  v16[3] = &unk_10071B530;
  v17 = v8;
  v18 = v9;
  v12 = v9;
  v13 = v8;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](services, "enumerateKeysAndObjectsUsingBlock:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v19[0] = CFSTR("SDNearbyAgentNotificationInfoKeyBLEDevice");
  v19[1] = CFSTR("SDNearbyAgentNotificationInfoKeyBLEData");
  v20[0] = v10;
  v20[1] = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v20, v19, 2));
  objc_msgSend(v14, "postNotificationName:object:userInfo:", CFSTR("SDNearbyAgentNotificationUnlockBLEDataReceived"), self, v15);

}

- (void)_unlockApproveBluetoothIDsChanged:(id)a3
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100206B74;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_unlockDeviceFilterChangedForRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSSet *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void (**v19)(_QWORD, _QWORD);
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void (**v28)(_QWORD, _QWORD);
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deviceFilter"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[SDAutoUnlockTransport sharedTransport](SDAutoUnlockTransport, "sharedTransport"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "approveBluetoothIDs"));
  objc_msgSend(v4, "setDeviceFilter:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deviceFilter"));
  if (!v8)
  {
    v9 = objc_opt_new(NSSet);
    objc_msgSend(v4, "setDeviceFilter:", v9);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deviceFilter"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deviceLostHandler"));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](NSMutableSet, "setWithSet:", v5));
    objc_msgSend(v12, "minusSet:", v10);
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v34;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v34 != v16)
            objc_enumerationMutation(v13);
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_ddNearbyInfoDevices, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)v17)));
          if (v18)
          {
            v19 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deviceLostHandler"));
            ((void (**)(_QWORD, void *))v19)[2](v19, v18);

          }
          v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      }
      while (v15);
    }

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deviceFoundHandler"));

  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithSet:](NSMutableSet, "setWithSet:", v10));
    objc_msgSend(v21, "minusSet:", v5);
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v22 = v21;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v30;
      do
      {
        v26 = 0;
        do
        {
          if (*(_QWORD *)v30 != v25)
            objc_enumerationMutation(v22);
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_ddNearbyInfoDevices, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)v26), (_QWORD)v29));
          if (v27)
          {
            v28 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deviceFoundHandler"));
            ((void (**)(_QWORD, void *))v28)[2](v28, v27);

          }
          v26 = (char *)v26 + 1;
        }
        while (v24 != v26);
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      }
      while (v24);
    }

  }
}

- (void)unlockUpdateAdvertising:(unsigned int)a3 mask:(unsigned int)a4
{
  NSObject *dispatchQueue;
  _QWORD v5[5];
  unsigned int v6;
  unsigned int v7;

  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100206FE0;
  v5[3] = &unk_100716108;
  v6 = a3;
  v7 = a4;
  v5[4] = self;
  dispatch_async(dispatchQueue, v5);
}

- (void)unlockStartTestClientWithDevice:(id)a3
{
  id v4;
  OS_dispatch_source *unlockTestClientTimer;
  NSObject *v6;
  OS_dispatch_source *v7;
  OS_dispatch_source *v8;
  OS_dispatch_source *v9;
  NSObject *v10;
  dispatch_time_t v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD handler[5];
  id v19;

  v4 = a3;
  if (dword_1007B3A28 <= 50 && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 50)))
    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent unlockStartTestClientWithDevice:]", 50, "Unlock test client with device: %@\n", v4);
  -[SDNearbyAgent startUnlockBLEConnectionWithDevice:encrypted:](self, "startUnlockBLEConnectionWithDevice:encrypted:", v4, 1);
  unlockTestClientTimer = self->_unlockTestClientTimer;
  if (unlockTestClientTimer)
  {
    v6 = unlockTestClientTimer;
    dispatch_source_cancel(v6);
    v7 = self->_unlockTestClientTimer;
    self->_unlockTestClientTimer = 0;

  }
  v8 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  v9 = self->_unlockTestClientTimer;
  self->_unlockTestClientTimer = v8;

  v10 = self->_unlockTestClientTimer;
  v11 = dispatch_time(0, 1000000000);
  dispatch_source_set_timer(v10, v11, 0x3B9ACA00uLL, 0xEE6B280uLL);
  v12 = self->_unlockTestClientTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100207310;
  handler[3] = &unk_100714860;
  handler[4] = self;
  v13 = v4;
  v19 = v13;
  dispatch_source_set_event_handler(v12, handler);
  v14 = self->_unlockTestClientTimer;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100207410;
  v16[3] = &unk_100714860;
  v16[4] = self;
  v17 = v13;
  v15 = v13;
  dispatch_source_set_cancel_handler(v14, v16);
  dispatch_resume((dispatch_object_t)self->_unlockTestClientTimer);

}

- (void)unlockStopTestClient
{
  OS_dispatch_source *unlockTestClientTimer;
  OS_dispatch_source *v4;
  NSObject *v5;

  if (dword_1007B3A28 <= 50 && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 50)))
    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent unlockStopTestClient]", 50, "Unlock test client stop\n");
  unlockTestClientTimer = self->_unlockTestClientTimer;
  if (unlockTestClientTimer)
  {
    v5 = unlockTestClientTimer;
    dispatch_source_cancel(v5);
    v4 = self->_unlockTestClientTimer;
    self->_unlockTestClientTimer = 0;

  }
}

- (void)unlockStartTestServer
{
  if (dword_1007B3A28 <= 50 && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 50)))
    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent unlockStartTestServer]", 50, "Unlock start test server\n");
}

- (void)unlockStopTestServer
{
  if (dword_1007B3A28 <= 50 && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 50)))
    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent unlockStopTestServer]", 50, "Unlock stop test server\n");
}

- (void)_systemWillSleep
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100207678;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_systemHasPoweredOn
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002076E4;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (BOOL)hasAdHocPairings
{
  NSArray *v2;
  id v3;
  uint64_t v4;
  void *i;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_idIdentityArray;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)i), "type", (_QWORD)v7) == 15)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v3;
}

- (NSArray)adHocPairedDeviceIdentities
{
  void *v3;
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_idIdentityArray;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "type", (_QWORD)v11) == 15)
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (void)cutWiFiManagerLinkDidChange:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  NSObject *dispatchQueue;
  _QWORD block[5];

  v6 = a3;
  v7 = a4;
  if (dword_1007B3A28 <= 50 && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 50)))
    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent cutWiFiManagerLinkDidChange:context:]", 50, "WifiManager cutWiFiManagerLinkDidChange");
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1002079E8;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);

}

- (void)testPipePing
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100207A48;
  block[3] = &unk_1007146D8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_testPipePing
{
  CFAbsoluteTime *v3;
  id v4;

  if (self->_unlockBtPipe)
  {
    v4 = objc_retainAutorelease(objc_msgSend(objc_alloc((Class)NSMutableData), "initWithLength:", 8));
    v3 = (CFAbsoluteTime *)objc_msgSend(v4, "mutableBytes");
    *v3 = CFAbsoluteTimeGetCurrent();
    -[SFBLEPipe sendFrameType:payload:completion:](self->_unlockBtPipe, "sendFrameType:payload:completion:", 1, v4, &stru_10071B570);

  }
  else if (dword_1007B3A28 <= 50
         && (dword_1007B3A28 != -1 || _LogCategory_Initialize(&dword_1007B3A28, 50)))
  {
    LogPrintF(&dword_1007B3A28, "-[SDNearbyAgent _testPipePing]", 50, "### BT Pipe not enabled\n");
  }
}

- (BOOL)autoUnlockActive
{
  return self->_autoUnlockActive;
}

- (int)audioRoutingScore
{
  return self->_audioRoutingScore;
}

- (NSData)bleAuthTag
{
  return self->_bleAuthTag;
}

- (BOOL)boostNearbyInfo
{
  return self->_boostNearbyInfo;
}

- (CUBluetoothClient)btConnectedDeviceMonitor
{
  return self->_btConnectedDeviceMonitor;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (BOOL)enhancedDiscovery
{
  return self->_enhancedDiscovery;
}

- (unsigned)hotspotInfo
{
  return self->_hotspotInfo;
}

- (RPIdentity)idSelfIdentity
{
  return self->_idSelfIdentity;
}

- (BOOL)inDiscoverySession
{
  return self->_inDiscoverySession;
}

- (BOOL)preventNearbyActionAdvertising
{
  return self->_preventNearbyActionAdvertising;
}

- (void)setPreventNearbyActionAdvertising:(BOOL)a3
{
  self->_preventNearbyActionAdvertising = a3;
}

- (RPIdentity)temporarySelfIdentity
{
  return self->_temporarySelfIdentity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_temporarySelfIdentity, 0);
  objc_storeStrong((id *)&self->_idSelfIdentity, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_btConnectedDeviceMonitor, 0);
  objc_storeStrong((id *)&self->_bleAuthTag, 0);
  objc_storeStrong((id *)&self->_digitalEngravingManager, 0);
  objc_storeStrong((id *)&self->_wifiManager, 0);
  objc_storeStrong((id *)&self->_idMaintenanceTimer, 0);
  objc_storeStrong((id *)&self->_idIdentityArray, 0);
  objc_storeStrong((id *)&self->_idDevices, 0);
  objc_storeStrong((id *)&self->_unlockTestClientTimer, 0);
  objc_storeStrong((id *)&self->_unlockBtPipe, 0);
  objc_storeStrong((id *)&self->_tempDonDeviceDiscovery, 0);
  objc_storeStrong((id *)&self->_tempDonDeviceScanTimer, 0);
  objc_storeStrong((id *)&self->_systemService, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_statusMonitor, 0);
  objc_storeStrong((id *)&self->_setupSessions, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong((id *)&self->_services, 0);
  objc_storeStrong((id *)&self->_remoteAppServiceUUID, 0);
  objc_storeStrong((id *)&self->_periodicScanTimer, 0);
  objc_storeStrong((id *)&self->_idsService, 0);
  objc_storeStrong((id *)&self->_idsDeviceCountBTDictionary, 0);
  objc_storeStrong((id *)&self->_idsDeviceBTDictionary, 0);
  objc_storeStrong((id *)&self->_idsDeviceArray, 0);
  objc_storeStrong((id *)&self->_idsBTtoIDSInfoMap, 0);
  objc_storeStrong((id *)&self->_idsBluetoothDeviceIDsForMe, 0);
  objc_storeStrong((id *)&self->_idsBluetoothDeviceIDsForLEPipe, 0);
  objc_storeStrong((id *)&self->_idsBluetoothDevicesSet, 0);
  objc_storeStrong((id *)&self->_idsBluetoothDevicesArray, 0);
  objc_storeStrong((id *)&self->_enhancedDiscoveryUseCases, 0);
  objc_storeStrong((id *)&self->_enhancedDiscoveryTimer, 0);
  objc_storeStrong((id *)&self->_donStateRetryTimerDictionary, 0);
  objc_storeStrong((id *)&self->_donnedDevices, 0);
  objc_storeStrong((id *)&self->_deliveredDonnedIdentifiers, 0);
  objc_storeStrong((id *)&self->_ddRequests, 0);
  objc_storeStrong((id *)&self->_ddProximityPairingDevices, 0);
  objc_storeStrong((id *)&self->_ddNearbyInfoDevices, 0);
  objc_storeStrong((id *)&self->_ddNearbyActionDevices, 0);
  objc_storeStrong((id *)&self->_ddFastScanTimer, 0);
  objc_storeStrong((id *)&self->_contactHashesCached, 0);
  objc_storeStrong((id *)&self->_caRequestsNoScans, 0);
  objc_storeStrong((id *)&self->_caRequests, 0);
  objc_storeStrong((id *)&self->_cameraConfigChangeTimer, 0);
  objc_storeStrong((id *)&self->_cameraMagicMountManager, 0);
  objc_storeStrong((id *)&self->_btPipePeer, 0);
  objc_storeStrong((id *)&self->_brightnessSystemClient, 0);
  objc_storeStrong((id *)&self->_bleProximityPairingScanner, 0);
  objc_storeStrong((id *)&self->_bleProximityInfoOverride, 0);
  objc_storeStrong((id *)&self->_bleProximityInfo, 0);
  objc_storeStrong((id *)&self->_bleWPNearby, 0);
  objc_storeStrong((id *)&self->_bleNearbyInfoScanner, 0);
  objc_storeStrong((id *)&self->_bleNearbyInfoDevices, 0);
  objc_storeStrong((id *)&self->_bleNearbyInfoAdvertiseLingerTimer, 0);
  objc_storeStrong((id *)&self->_bleNearbyInfoAdvertiseReason, 0);
  objc_storeStrong((id *)&self->_bleNearbyInfoAdvertiser, 0);
  objc_storeStrong((id *)&self->_bleNearbyActionScanner, 0);
  objc_storeStrong((id *)&self->_bleNearbyActionDevices, 0);
  objc_storeStrong((id *)&self->_bleNearbyActionAdvertiseLingerTimer, 0);
  objc_storeStrong((id *)&self->_bleNearbyActionAdvertiser, 0);
  objc_storeStrong((id *)&self->_bleHotspotEncryptedData, 0);
  objc_storeStrong((id *)&self->_bleDiagnosticModeClients, 0);
  objc_storeStrong((id *)&self->_bleConnections, 0);
  objc_storeStrong((id *)&self->_bleAuthTagOverride, 0);
  objc_storeStrong((id *)&self->_bleAudioRoutingScoreEncryptedData, 0);
  objc_storeStrong((id *)&self->_bleAdvertisingAddress, 0);
  objc_storeStrong((id *)&self->_activityTimer, 0);
  objc_storeStrong((id *)&self->_activeWatchDiscovery, 0);
}

@end
