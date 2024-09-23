@implementation VOSBluetoothManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_11);
  if ((objc_msgSend((id)_bluetoothManagerSharedInstance, "available") & 1) == 0)
    objc_msgSend((id)_bluetoothManagerSharedInstance, "attach:", &unk_24CBBC870);
  return (id)_bluetoothManagerSharedInstance;
}

void __37__VOSBluetoothManager_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  if (!_bluetoothManagerSharedInstance)
  {
    v0 = objc_msgSend(objc_allocWithZone((Class)VOSBluetoothManager), "init");
    v1 = (void *)_bluetoothManagerSharedInstance;
    _bluetoothManagerSharedInstance = v0;

  }
}

- (BOOL)isValidBrailleDevice:(id)a3
{
  id v4;
  NSDictionary *v5;
  NSDictionary *brailleDriverDeviceDetectionInfo;
  NSObject *v7;
  NSDictionary *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  NSObject *v24;
  void *v25;
  int v26;
  _BOOL8 v27;
  NSObject *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  VOSBluetoothManager *v36;
  uint64_t v37;
  id v38;
  NSDictionary *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "name");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isNameCached") & 1) != 0)
  {
    if (!self->_brailleDriverDeviceDetectionInfo)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "brailleDriverDeviceDetectionInfo");
      v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
      brailleDriverDeviceDetectionInfo = self->_brailleDriverDeviceDetectionInfo;
      self->_brailleDriverDeviceDetectionInfo = v5;

    }
    objc_msgSend(MEMORY[0x24BDD1548], "expressionForEvaluatedObject");
    v7 = objc_claimAutoreleasedReturnValue();
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v50 = 0u;
    v8 = self->_brailleDriverDeviceDetectionInfo;
    v9 = -[NSDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v47, v58, 16);
    if (v9)
    {
      v10 = v9;
      v41 = *(_QWORD *)v48;
      v38 = v4;
      v39 = v8;
      v36 = self;
      do
      {
        v11 = 0;
        v12 = (_QWORD *)MEMORY[0x24BE843E8];
        v37 = v10;
        do
        {
          if (*(_QWORD *)v48 != v41)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * v11);
          buf[0] = 0;
          -[NSDictionary objectForKey:](self->_brailleDriverDeviceDetectionInfo, "objectForKey:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          __UIAccessibilitySafeClass();
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (buf[0])
            abort();
          objc_msgSend(v15, "objectForKey:", *v12);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v40 = v16;
              objc_msgSend(v16, "objectForKey:", *MEMORY[0x24BE843E0]);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = 0u;
              v44 = 0u;
              v45 = 0u;
              v46 = 0u;
              v18 = v17;
              v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v43, v57, 16);
              if (v19)
              {
                v20 = v19;
                v21 = *(_QWORD *)v44;
                while (2)
                {
                  for (i = 0; i != v20; ++i)
                  {
                    if (*(_QWORD *)v44 != v21)
                      objc_enumerationMutation(v18);
                    v23 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD14D8]), "initWithObject:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i));
                    v24 = v7;
                    v25 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x24BDD14B8]), "initWithLeftExpression:rightExpression:modifier:type:options:", v7, v23, 0, 6, 0);
                    v26 = objc_msgSend(v25, "evaluateWithObject:", v42);

                    if (v26)
                    {

                      v27 = 1;
                      v4 = v38;
                      v7 = v24;
                      goto LABEL_30;
                    }
                    v7 = v24;
                  }
                  v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v43, v57, 16);
                  if (v20)
                    continue;
                  break;
                }
              }

              self = v36;
              v8 = v39;
              v16 = v40;
              v10 = v37;
              v12 = (_QWORD *)MEMORY[0x24BE843E8];
            }
          }

          ++v11;
        }
        while (v11 != v10);
        v10 = -[NSDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v47, v58, 16);
        v4 = v38;
      }
      while (v10);
    }

    objc_msgSend(v4, "device");
    BTDeviceGetSupportedServices();
    objc_msgSend(v4, "device");
    BTDeviceGetDeviceType();
    v27 = 0;
    AXLogBrailleHW();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", 0);
      v31 = v7;
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v52 = v29;
      v53 = 2112;
      v54 = v30;
      v55 = 2112;
      v56 = v32;
      _os_log_impl(&dword_211371000, v28, OS_LOG_TYPE_DEFAULT, "Check service type: %@ = %@ %@", buf, 0x20u);

      v7 = v31;
    }

LABEL_30:
    AXLogBrailleHW();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v27);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v52 = v34;
      v53 = 2112;
      v54 = v42;
      _os_log_impl(&dword_211371000, v33, OS_LOG_TYPE_DEFAULT, "Valid braille device %@ %@", buf, 0x16u);

    }
  }
  else
  {
    AXLogBrailleHW();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_211371000, v7, OS_LOG_TYPE_DEFAULT, "Not valid braille device: no name cache", buf, 2u);
    }
    LOBYTE(v27) = 0;
  }

  return v27;
}

- (BOOL)isPairedDeviceBrailleDisplay:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t i;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "voiceOverBrailleDisplays");
  v5 = objc_claimAutoreleasedReturnValue();

  v6 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    v9 = (_QWORD *)MEMORY[0x24BE843D8];
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "objectForKey:", *v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "address");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "isEqualToString:", v12);

        if ((v13 & 1) != 0)
        {
          v15 = 1;
          goto LABEL_13;
        }
      }
      v7 = -[NSObject countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
      if (v7)
        continue;
      break;
    }
  }

  VOTLogBraille();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v3, "address");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v22 = v14;
    _os_log_impl(&dword_211371000, v5, OS_LOG_TYPE_INFO, "Skipping paired device %@ because did not match paired Braille devices", buf, 0xCu);

  }
  v15 = 0;
LABEL_13:

  return v15;
}

- (void)unpairBTLEDevice:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VOSBluetoothManager;
  v4 = a3;
  -[AXUIBluetoothHelper unpairBTLEDevice:](&v5, sel_unpairBTLEDevice_, v4);
  -[VOSBluetoothManager _removeDeviceFromBrailleCache:](self, "_removeDeviceFromBrailleCache:", v4, v5.receiver, v5.super_class);

}

- (BOOL)unpairDevice:(id)a3
{
  id v4;
  _BOOL4 v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)VOSBluetoothManager;
  v5 = -[AXUIBluetoothHelper unpairDevice:](&v7, sel_unpairDevice_, v4);
  if (v5)
    -[VOSBluetoothManager _removeDeviceFromBrailleCache:](self, "_removeDeviceFromBrailleCache:", v4);

  return v5;
}

- (NSArray)pairedBrailleDevices
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[AXUIBluetoothHelper pairedDevices](self, "pairedDevices");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __43__VOSBluetoothManager_pairedBrailleDevices__block_invoke;
  v6[3] = &unk_24CBAD788;
  v6[4] = self;
  objc_msgSend(v3, "axFilterObjectsUsingBlock:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

uint64_t __43__VOSBluetoothManager_pairedBrailleDevices__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "isValidBrailleDevice:", a2);
}

- (BOOL)btleDeviceIsPaired:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  char v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VOSBluetoothManager;
  if (-[AXUIBluetoothHelper btleDeviceIsPaired:](&v14, sel_btleDeviceIsPaired_, v4)
    || (objc_msgSend(v4, "address"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = (void *)_AXSVoiceOverTouchCopyTactileGraphicsDisplay(),
        v7 = objc_msgSend(v5, "isEqualToString:", v6),
        v6,
        v5,
        (v7 & 1) != 0))
  {
    v8 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "voiceOverBrailleDisplays");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __42__VOSBluetoothManager_btleDeviceIsPaired___block_invoke;
    v12[3] = &unk_24CBAD7B0;
    v13 = v4;
    v8 = objc_msgSend(v10, "ax_containsObjectUsingBlock:", v12);

  }
  return v8;
}

uint64_t __42__VOSBluetoothManager_btleDeviceIsPaired___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "objectForKey:", *MEMORY[0x24BE843D8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "address");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

- (void)_removeDeviceFromBrailleCache:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  NSObject *v8;
  os_log_type_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  os_log_type_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  char v27;
  void *v28;
  NSObject *v29;
  os_log_type_t v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, void *);
  void *v38;
  id v39;
  uint8_t buf[4];
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BE00700], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "ignoreLogging");

  if ((v6 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE00700], "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v8 = objc_claimAutoreleasedReturnValue();

    v9 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v8, v9))
    {
      AXColorizeFormatLog();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = v4;
      _AXStringForArgs();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, v9))
      {
        *(_DWORD *)buf = 138543362;
        v41 = v11;
        _os_log_impl(&dword_211371000, v8, v9, "%{public}@", buf, 0xCu);
      }

    }
  }
  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance", v33);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "voiceOverBrailleDisplays");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend((id)v13, "mutableCopy");

  v35 = MEMORY[0x24BDAC760];
  v36 = 3221225472;
  v37 = __53__VOSBluetoothManager__removeDeviceFromBrailleCache___block_invoke;
  v38 = &unk_24CBAD7D8;
  v15 = v4;
  v39 = v15;
  objc_msgSend(v14, "ax_removeObjectsFromArrayUsingBlock:", &v35);
  objc_msgSend(MEMORY[0x24BE00700], "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v13) = objc_msgSend(v16, "ignoreLogging");

  if ((v13 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BE00700], "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v18 = objc_claimAutoreleasedReturnValue();

    v19 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v18, v19))
    {
      AXColorizeFormatLog();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v14;
      _AXStringForArgs();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, v19))
      {
        *(_DWORD *)buf = 138543362;
        v41 = v21;
        _os_log_impl(&dword_211371000, v18, v19, "%{public}@", buf, 0xCu);
      }

    }
  }
  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance", v34, v35, v36, v37, v38);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setVoiceOverBrailleDisplays:", v14);

  objc_msgSend(v15, "address");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)_AXSVoiceOverTouchCopyTactileGraphicsDisplay();
  v25 = objc_msgSend(v23, "isEqualToString:", v24);

  if (v25)
  {
    _AXSVoiceOverTouchSetTactileGraphicsDisplay();
    objc_msgSend(MEMORY[0x24BE00700], "sharedInstance");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "ignoreLogging");

    if ((v27 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BE00700], "identifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      AXLoggerForFacility();
      v29 = objc_claimAutoreleasedReturnValue();

      v30 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v29, v30))
      {
        AXColorizeFormatLog();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        _AXStringForArgs();
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, v30))
        {
          *(_DWORD *)buf = 138543362;
          v41 = v32;
          _os_log_impl(&dword_211371000, v29, v30, "%{public}@", buf, 0xCu);
        }

      }
    }
  }
  -[AXUIBluetoothHelper postNotificationName:object:](self, "postNotificationName:object:", *MEMORY[0x24BE007C8], v15);

}

uint64_t __53__VOSBluetoothManager__removeDeviceFromBrailleCache___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "objectForKey:", *MEMORY[0x24BE843D8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "address");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

- (id)alertControllerWithVOSBluetoothResult:(unint64_t)a3 device:(id)a4 buttonHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[4];
  id v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;

  v7 = a4;
  v8 = a5;
  if (*MEMORY[0x24BE007C0] == a3)
  {
    v9 = (void *)MEMORY[0x24BDD17C8];
    VOSLocString(CFSTR("ERROR_UNSUPPORTED_DEVICE"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "paired"))
      v13 = CFSTR("FORGET_DEVICE");
    else
      v13 = CFSTR("OK");
    goto LABEL_17;
  }
  if (*MEMORY[0x24BE007B8] == a3)
  {
    v14 = (void *)MEMORY[0x24BDD17C8];
    v15 = CFSTR("ERROR_INCORRECT_PIN");
  }
  else if (*MEMORY[0x24BE007A8] == a3)
  {
    v14 = (void *)MEMORY[0x24BDD17C8];
    v15 = CFSTR("LOADING_FAILURE");
  }
  else
  {
    if (*MEMORY[0x24BE007B0] == a3)
    {
      if ((objc_msgSend(v7, "paired") & 1) != 0)
      {
        v16 = 0;
        v12 = 0;
        goto LABEL_18;
      }
      v31 = (void *)MEMORY[0x24BDD17C8];
      VOSLocString(CFSTR("ERROR_PAIRING_TIMEOUT"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)MEMORY[0x24BDD17C8];
      VOSLocString(CFSTR("ERROR_GEN_PAIRING_FAILURE"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "name");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "stringWithFormat:", v33, v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "stringWithFormat:", CFSTR("%@ %@"), v17, v35);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_16;
    }
    v14 = (void *)MEMORY[0x24BDD17C8];
    if (objc_msgSend(v7, "paired"))
      v15 = CFSTR("ERROR_GEN_CONNECTION_FAILURE");
    else
      v15 = CFSTR("ERROR_GEN_PAIRING_FAILURE");
  }
  VOSLocString(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "name");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", v17, v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_16:
  v13 = CFSTR("OK");
LABEL_17:
  VOSLocString(v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:
  v44 = 0;
  v45 = &v44;
  v46 = 0x2050000000;
  v19 = (void *)getUIAlertControllerClass_softClass;
  v47 = getUIAlertControllerClass_softClass;
  v20 = MEMORY[0x24BDAC760];
  if (!getUIAlertControllerClass_softClass)
  {
    v39 = MEMORY[0x24BDAC760];
    v40 = 3221225472;
    v41 = __getUIAlertControllerClass_block_invoke;
    v42 = &unk_24CBAD828;
    v43 = &v44;
    __getUIAlertControllerClass_block_invoke((uint64_t)&v39);
    v19 = (void *)v45[3];
  }
  v21 = objc_retainAutorelease(v19);
  _Block_object_dispose(&v44, 8);
  if (objc_msgSend(v7, "paired"))
    v22 = CFSTR("CONNECTION_FAILED_TITLE");
  else
    v22 = CFSTR("PAIRING_FAILED_TITLE");
  VOSLocString(v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "alertControllerWithTitle:message:preferredStyle:", v23, v12, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v44 = 0;
  v45 = &v44;
  v46 = 0x2050000000;
  v25 = (void *)getUIAlertActionClass_softClass;
  v47 = getUIAlertActionClass_softClass;
  if (!getUIAlertActionClass_softClass)
  {
    v39 = v20;
    v40 = 3221225472;
    v41 = __getUIAlertActionClass_block_invoke;
    v42 = &unk_24CBAD828;
    v43 = &v44;
    __getUIAlertActionClass_block_invoke((uint64_t)&v39);
    v25 = (void *)v45[3];
  }
  v26 = objc_retainAutorelease(v25);
  _Block_object_dispose(&v44, 8);
  v36[0] = v20;
  v36[1] = 3221225472;
  v36[2] = __82__VOSBluetoothManager_alertControllerWithVOSBluetoothResult_device_buttonHandler___block_invoke;
  v36[3] = &unk_24CBAD800;
  v37 = v7;
  v38 = v8;
  v27 = v8;
  v28 = v7;
  objc_msgSend(v26, "actionWithTitle:style:handler:", v16, 0, v36);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addAction:", v29);

  return v24;
}

uint64_t __82__VOSBluetoothManager_alertControllerWithVOSBluetoothResult_device_buttonHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  uint64_t result;

  objc_msgSend(a2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  VOSLocString(CFSTR("FORGET_DEVICE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  if (v5)
    objc_msgSend(*(id *)(a1 + 32), "unpair");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_brailleDriverDeviceDetectionInfo, 0);
}

@end
