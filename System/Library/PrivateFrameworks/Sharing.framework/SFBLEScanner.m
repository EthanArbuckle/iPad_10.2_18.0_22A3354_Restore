@implementation SFBLEScanner

- (int64_t)rescanIntervalScreenOff
{
  return self->_rescanIntervalScreenOff;
}

- (unsigned)changeFlags
{
  return self->_changeFlags;
}

- (SFBLEScanner)initWithType:(int64_t)a3
{
  SFBLEScanner *v4;
  uint64_t v5;
  OS_dispatch_queue *dispatchQueue;
  SFBLEScanner *v7;
  objc_super v9;
  int v10;
  void *v11;

  v11 = 0;
  v10 = 0;
  v9.receiver = self;
  v9.super_class = (Class)SFBLEScanner;
  v4 = -[SFBLEScanner init](&v9, sel_init);
  if (!v4)
    goto LABEL_6;
  SFMainQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  dispatchQueue = v4->_dispatchQueue;
  v4->_dispatchQueue = (OS_dispatch_queue *)v5;

  v4->_payloadType = a3;
  v4->_rescanInterval = 10.0;
  v4->_rescanIntervalScreenOff = -1;
  v4->_scanRate = 20;
  ASPrintF();
  if (v11)
  {
    v4->_ucat = (LogCategory *)LogCategoryCreateEx();
    free(v11);
    v7 = 0;
    if (!v10)
      v7 = v4;
  }
  else
  {
LABEL_6:
    v7 = 0;
  }

  return v7;
}

- (NSSet)useCases
{
  return self->_useCases;
}

- (NSSet)trackedPeers
{
  return self->_trackedPeers;
}

- (int64_t)scanRate
{
  return self->_scanRate;
}

- (BOOL)scanCache
{
  return self->_scanCache;
}

- (int64_t)rssiThreshold
{
  return self->_rssiThreshold;
}

- (NSData)payloadFilterData
{
  return self->_payloadFilterData;
}

- (NSArray)deviceFilter
{
  return self->_deviceFilter;
}

- (void)_restartIfNeeded
{
  -[SFBLEScanner _restartIfNeeded:](self, "_restartIfNeeded:", 0);
}

uint64_t __30__SFBLEScanner_performUpdate___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 152) = 1;
  return result;
}

_BYTE *__30__SFBLEScanner_performUpdate___block_invoke_2(uint64_t a1)
{
  _BYTE *result;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 152) = 0;
  result = *(_BYTE **)(a1 + 32);
  if (result[9])
  {
    if (!result[48])
      return (_BYTE *)objc_msgSend(result, "_restartIfNeeded");
  }
  return result;
}

uint64_t __40__SFBLEScanner__activateWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_restartIfNeeded");
}

- (void)setScanStateChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (void)setRescanIntervalScreenOff:(int64_t)a3
{
  self->_rescanIntervalScreenOff = a3;
}

- (void)setDeviceLostHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (void)setDeviceFoundHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (void)setDeviceChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (void)_foundDevice:(id)a3 advertisementData:(id)a4 rssi:(int64_t)a5 fields:(id)a6
{
  id v10;
  id v11;
  int64_t v12;
  int64_t v13;
  void *v14;
  uint64_t v15;
  __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  BOOL v19;
  int64_t rssiThreshold;
  int v21;
  void *v22;
  uint64_t v23;
  SFBLEDevice *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSMutableDictionary *devices;
  NSMutableDictionary *v35;
  NSMutableDictionary *v36;
  int v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  char v44;
  uint64_t Int64Ranged;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  char v54;
  uint64_t Int64;
  void *v56;
  unsigned int changeFlags;
  int var0;
  int v59;
  void (**deviceFoundHandler)(id, SFBLEDevice *);
  void (**deviceChangedHandler)(id, SFBLEDevice *, uint64_t);
  int v62;
  int activeScan;
  int v64;
  _BOOL4 v65;
  const char *v66;
  const char *v67;
  int v68;
  id v69;
  void *v70;
  const char *v71;
  SFBLEDevice *v72;
  uint64_t v73;
  id v74;
  const __CFString *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void (**v80)(void *, SFBLEDevice *);
  id v81;
  _QWORD aBlock[5];
  int v83;
  __int16 v84;
  int v85;

  v10 = a3;
  v81 = a4;
  v11 = a6;
  if ((unint64_t)(a5 - 20) >= 0x6B)
    v12 = a5;
  else
    v12 = a5 - 126;
  if ((unint64_t)(v12 - 1) >= 0xFFFFFFFFFFFFFFA5)
    v13 = v12;
  else
    v13 = 0;
  if (v13 < 0 && (self->_rssiLogStdOut || self->_rssiEventLogFile))
  {
    v85 = 0;
    v84 = 0;
    v83 = 0;
    CFDictionaryGetHardwareAddress();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("ch"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "integerValue");

    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (self->_rssiEventLogFile)
    {
      if (v16)
        v17 = v16;
      else
        v17 = &stru_1E483B8E8;
      v72 = (SFBLEDevice *)v13;
      v73 = v15;
      v69 = v10;
      v71 = (const char *)&v83;
      v74 = v81;
      v75 = v17;
      FPrintF();
    }
    if (self->_rssiLogStdOut)
    {
      if (v16)
        v18 = v16;
      else
        v18 = &stru_1E483B8E8;
      v74 = v81;
      v75 = v18;
      v72 = (SFBLEDevice *)v13;
      v73 = v15;
      v69 = v10;
      v71 = (const char *)&v83;
      FPrintF();
    }

  }
  if (v13)
    v19 = !self->_needDups;
  else
    v19 = 1;
  if (v19 || (rssiThreshold = self->_rssiThreshold) == 0 || v13 >= rssiThreshold)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __59__SFBLEScanner__foundDevice_advertisementData_rssi_fields___block_invoke;
    aBlock[3] = &unk_1E4831280;
    aBlock[4] = self;
    v80 = (void (**)(void *, SFBLEDevice *))_Block_copy(aBlock);
    LOBYTE(v83) = 0;
    objc_msgSend((id)gSFNearbyAgent, "idsDeviceForBluetoothDeviceID:conflictDetected:", v10, &v83);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v10);
    v23 = objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      v24 = (SFBLEDevice *)v23;
      if (v22)
      {
        objc_msgSend(v22, "uniqueIDOverride");
        v25 = objc_claimAutoreleasedReturnValue();
        if (v25)
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v25, CFSTR("idsID"));
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v83, v69, v71, v72, v73, v74, v75);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v26, CFSTR("idsIDCD"));

      }
      else
      {
        v25 = 0;
      }
      -[SFBLEDevice advertisementFields](v24, "advertisementFields", v69);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      CFStringGetTypeID();
      CFDictionaryGetTypedValue();
      v78 = (void *)objc_claimAutoreleasedReturnValue();

      v77 = (void *)v25;
      if (v25)
        v25 = objc_msgSend(v78, "isEqual:", v25) - 1;
      CFStringGetTypeID();
      CFDictionaryGetTypedValue();
      v39 = objc_claimAutoreleasedReturnValue();
      v40 = (void *)v39;
      if (v22)
      {
        if (!v39)
        {
          objc_msgSend(v22, "modelIdentifier");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          if (v40)
            objc_msgSend(v11, "setObject:forKeyedSubscript:", v40, CFSTR("model"));
        }
      }
      -[SFBLEDevice advertisementFields](v24, "advertisementFields");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      CFStringGetTypeID();
      CFDictionaryGetTypedValue();
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      v79 = v22;
      v76 = v42;
      if (v40)
      {
        if (objc_msgSend(v42, "isEqual:", v40))
          v25 = v25;
        else
          v25 = v25 | 8;
      }
      -[SFBLEDevice setLastSeen:](v24, "setLastSeen:", CFAbsoluteTimeGetCurrent());
      -[SFBLEDevice advertisementData](v24, "advertisementData");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v43, "isEqual:", v81);

      if ((v44 & 1) == 0)
      {
        -[SFBLEDevice setAdvertisementData:](v24, "setAdvertisementData:", v81);
        v25 = v25 | 1;
      }
      Int64Ranged = CFDictionaryGetInt64Ranged();
      if (-[SFBLEDevice connectedServices](v24, "connectedServices") != (_DWORD)Int64Ranged)
      {
        -[SFBLEDevice setConnectedServices:](v24, "setConnectedServices:", Int64Ranged);
        v25 = v25 | 8;
      }
      if (v13)
      {
        -[SFBLEDevice updateRSSI:](v24, "updateRSSI:", v13);
        v25 = v25 | 4;
      }
      -[SFBLEDevice bluetoothAddress](v24, "bluetoothAddress");
      v46 = objc_claimAutoreleasedReturnValue();
      if (v46)
      {
        v47 = (void *)v46;
      }
      else
      {
        CFDataGetTypeID();
        CFDictionaryGetTypedValue();
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        if (v47)
        {
          -[SFBLEDevice setBluetoothAddress:](v24, "setBluetoothAddress:", v47);
          v25 = v25 | 8;
        }
      }
      CFStringGetTypeID();
      CFDictionaryGetTypedValue();
      v48 = objc_claimAutoreleasedReturnValue();
      v49 = (void *)v48;
      if (v79 && !v48)
      {
        objc_msgSend(v79, "name");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if (v49)
      {
        v50 = v11;
        v51 = v47;
        v52 = v10;
        -[SFBLEDevice name](v24, "name");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = objc_msgSend(v53, "isEqual:", v49);

        if ((v54 & 1) == 0)
        {
          -[SFBLEDevice setName:](v24, "setName:", v49);
          v25 = v25 | 8;
        }
        v10 = v52;
        v47 = v51;
        v11 = v50;
      }
      Int64 = CFDictionaryGetInt64();
      if (v79)
        objc_msgSend(v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("paired"));
      if (!-[SFBLEDevice paired](v24, "paired") || Int64)
      {
        if (!-[SFBLEDevice paired](v24, "paired") && Int64)
        {
          -[SFBLEDevice setPaired:](v24, "setPaired:", 1);
          v25 = v25 | 8;
        }
      }
      else
      {
        objc_msgSend(v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("paired"));
      }
      -[SFBLEDevice counterpartIdentifier](v24, "counterpartIdentifier");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      if (v56)
      {

        if (!v11)
          goto LABEL_95;
      }
      else
      {
        if (-[SFBLEScanner _updateCounterpart:](self, "_updateCounterpart:", v24))
          v25 = v25 | 8;
        else
          v25 = v25;
        if (!v11)
          goto LABEL_95;
      }
      -[SFBLEDevice setAdvertisementFields:](v24, "setAdvertisementFields:", v11);
LABEL_95:
      v80[2](v80, v24);
      changeFlags = self->_changeFlags;
      var0 = self->_ucat->var0;
      if (changeFlags == -1 || (changeFlags & v25) != 0)
      {
        if (var0 <= 8 && (var0 != -1 || _LogCategory_Initialize()))
        {
          v70 = v24;
          LogPrintF();
        }
        deviceChangedHandler = (void (**)(id, SFBLEDevice *, uint64_t))self->_deviceChangedHandler;
        if (deviceChangedHandler)
          deviceChangedHandler[2](deviceChangedHandler, v24, v25);
      }
      else if (var0 <= 8 && (var0 != -1 || _LogCategory_Initialize()))
      {
        v70 = v24;
        LogPrintF();
      }

      v22 = v79;
      v29 = v77;
      goto LABEL_123;
    }
    v27 = CFDictionaryGetInt64();
    CFStringGetTypeID();
    CFDictionaryGetTypedValue();
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = (void *)v28;
    if (v22)
    {
      if (!v28)
      {
        objc_msgSend(v22, "name");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
      }
      CFStringGetTypeID();
      CFDictionaryGetTypedValue();
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (v30 || (objc_msgSend(v22, "modelIdentifier"), (v30 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v30, CFSTR("model"), v69, v71, v72, v73, v74, v75);

      }
      objc_msgSend(v22, "uniqueIDOverride", v69);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (v31)
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v31, CFSTR("idsID"));
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v83);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v32, CFSTR("idsIDCD"));

      objc_msgSend(v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("paired"));
    }
    else
    {
      if (!v27)
      {
        v33 = 0;
        goto LABEL_45;
      }
      v59 = self->_ucat->var0;
      if (v59 <= 60 && (v59 != -1 || _LogCategory_Initialize()))
      {
        v69 = v10;
        LogPrintF();
      }
    }
    v33 = 1;
LABEL_45:
    v24 = objc_alloc_init(SFBLEDevice);
    -[SFBLEDevice setAdvertisementData:](v24, "setAdvertisementData:", v81);
    if (v11)
      -[SFBLEDevice setAdvertisementFields:](v24, "setAdvertisementFields:", v11);
    CFDataGetTypeID();
    -[SFBLEDevice setBluetoothAddress:](v24, "setBluetoothAddress:", CFDictionaryGetTypedValue());
    -[SFBLEDevice setConnectedServices:](v24, "setConnectedServices:", CFDictionaryGetInt64Ranged());
    -[SFBLEDevice setFoundTicks:](v24, "setFoundTicks:", mach_absolute_time());
    -[SFBLEDevice setIdentifier:](v24, "setIdentifier:", v10);
    -[SFBLEDevice setLastSeen:](v24, "setLastSeen:", CFAbsoluteTimeGetCurrent());
    if (v29)
      -[SFBLEDevice setName:](v24, "setName:", v29);
    -[SFBLEDevice setPaired:](v24, "setPaired:", v33, v69);
    if (v13)
      -[SFBLEDevice updateRSSI:](v24, "updateRSSI:", v13);
    -[SFBLEScanner _updateCounterpart:](self, "_updateCounterpart:", v24);
    v80[2](v80, v24);
    devices = self->_devices;
    if (!devices)
    {
      v35 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v36 = self->_devices;
      self->_devices = v35;

      devices = self->_devices;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](devices, "setObject:forKeyedSubscript:", v24, v10);
    v37 = self->_ucat->var0;
    if (v37 <= 8 && (v37 != -1 || _LogCategory_Initialize()))
    {
      v70 = v24;
      LogPrintF();
    }
    deviceFoundHandler = (void (**)(id, SFBLEDevice *))self->_deviceFoundHandler;
    if (deviceFoundHandler)
      deviceFoundHandler[2](deviceFoundHandler, v24);
LABEL_123:

    v62 = -[SFBLEScanner _needActiveScan](self, "_needActiveScan");
    activeScan = self->_activeScan;
    if (activeScan == v62)
    {
LABEL_135:
      if (!self->_needDups && (self->_changeFlags & 0x16) != 0 && -[SFBLEScanner _needDups](self, "_needDups"))
      {
        v68 = self->_ucat->var0;
        if (v68 <= 30 && (v68 != -1 || _LogCategory_Initialize()))
        {
          v70 = v24;
          v71 = (const char *)self->_changeFlags;
          LogPrintF();
        }
        self->_needDups = 1;
      }
      else if (activeScan == v62)
      {
        goto LABEL_147;
      }
      -[SFBLEScanner _restartIfNeeded](self, "_restartIfNeeded", v70, v71, v72);
LABEL_147:
      -[SFBLEScanner _updateRescanTimer](self, "_updateRescanTimer", v70);

      goto LABEL_148;
    }
    v64 = self->_ucat->var0;
    if (v64 <= 30)
    {
      if (v64 != -1)
      {
        v65 = self->_activeScan;
LABEL_127:
        v66 = "yes";
        if (v65)
          v67 = "yes";
        else
          v67 = "no";
        if (!v62)
          v66 = "no";
        v71 = v66;
        v72 = v24;
        v70 = (void *)v67;
        LogPrintF();
        goto LABEL_134;
      }
      if (_LogCategory_Initialize())
      {
        v65 = self->_activeScan;
        goto LABEL_127;
      }
    }
LABEL_134:
    self->_activeScan = v62;
    goto LABEL_135;
  }
  v21 = self->_ucat->var0;
  if (v21 <= 10 && (v21 != -1 || _LogCategory_Initialize()))
    LogPrintF();
LABEL_148:

}

- (void)_restartIfNeeded:(BOOL)a3
{
  _BOOL4 v3;
  int var0;
  int64_t changeFlags;
  int v7;
  int64_t payloadType;
  WPPairing *wpPairing;
  int64_t v10;
  int64_t v11;
  int v12;
  WPNearby *wpNearby;
  int v14;
  unint64_t v15;
  const char *v16;
  CBCentralManager *centralManager;
  int v18;
  WPAWDL *wpAirDrop;
  int64_t v20;
  int64_t scanParamMode;
  _BOOL4 v22;
  int v23;
  int v24;
  const char *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  const char *v30;
  int v31;
  uint64_t v32;
  void *v33;
  void *v34;
  int64_t scanInterval;
  int64_t scanWindow;
  int64_t scanRate;
  int v38;
  WPPairing *v39;
  void *v40;
  int v41;
  int64_t v42;
  uint64_t v43;
  int64_t v44;
  _BOOL4 v45;
  NSData *scanParamFilterData;
  NSData *v47;
  NSData *v48;
  void *v49;
  int v50;
  NSData *scanParamFilterMask;
  NSData *v52;
  int v53;
  NSArray *scanParamPeers;
  NSArray *v55;
  int v56;
  NSSet *scanUseCases;
  NSSet *v58;
  char v59;
  _BOOL4 v60;
  int v61;
  NSData *v62;
  NSUInteger v63;
  int64_t v64;
  const char *v65;
  const char *v66;
  const char *v67;
  NSUInteger v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  const char *v72;
  WPNearby *v73;
  int64_t wpNearbyType;
  NSData *payloadFilterData;
  NSData *payloadFilterMask;
  NSArray *deviceFilter;
  int64_t rssiThreshold;
  void *v79;
  NSData *v80;
  NSData *v81;
  NSData *v82;
  NSData *v83;
  NSArray *v84;
  NSArray *v85;
  NSSet *v86;
  NSSet *v87;
  int64_t v88;
  _BOOL4 scanStarted;
  int v90;
  _BOOL4 v91;
  int v92;
  unint64_t v93;
  const char *v94;
  const char *v95;
  const char *v96;
  const char *v97;
  const char *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void (**scanStateChangedHandler)(id, uint64_t);
  int v109;
  int v110;
  int v111;
  int v112;
  int v113;
  int v114;
  int64_t v115;
  void *v116;
  const char *v117;
  const char *v118;
  int64_t v119;
  uint64_t v120;
  int64_t v121;
  const char *v122;
  const char *v123;
  NSUInteger v124;
  uint64_t v125;
  const char *v126;
  const char *v127;
  int64_t v128;
  NSUInteger v129;
  int64_t v130;
  int64_t v131;
  CBCentralManager *v132;
  _BOOL4 v133;
  _BOOL4 v134;
  void *v135;
  id v136;
  _QWORD v137[5];
  _QWORD v138[7];

  v3 = a3;
  v138[5] = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled)
    goto LABEL_88;
  var0 = self->_ucat->var0;
  if (var0 <= 9 && (var0 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  if (self->_needDups)
  {
    changeFlags = self->_changeFlags;
    if ((changeFlags & 0x16) == 0)
    {
      v7 = self->_ucat->var0;
      if (v7 <= 30)
      {
        if (v7 == -1)
        {
          if (!_LogCategory_Initialize())
            goto LABEL_12;
          changeFlags = self->_changeFlags;
        }
        v115 = changeFlags;
        LogPrintF();
      }
LABEL_12:
      self->_needDups = 0;
    }
  }
  payloadType = self->_payloadType;
  if (payloadType > 14)
  {
    if ((unint64_t)(payloadType - 15) >= 2)
    {
      if (payloadType != 17)
      {
LABEL_38:
        v18 = self->_ucat->var0;
        if (v18 <= 60 && (v18 != -1 || _LogCategory_Initialize()))
          LogPrintF();
        goto LABEL_88;
      }
LABEL_36:
      objc_msgSend(MEMORY[0x1E0C99DE8], "array", v115);
      v136 = (id)objc_claimAutoreleasedReturnValue();
      centralManager = self->_centralManager;
      if (!centralManager)
      {
LABEL_85:

        return;
      }
      switch(-[CBCentralManager state](centralManager, "state"))
      {
        case 5:
          if (self->_payloadType != 17)
            goto LABEL_78;
          objc_msgSend((Class)getCBUUIDClass[0](), "UUIDWithString:", CFSTR("9AA4730F-B25C-4CC3-B821-C931559FC196"));
          v32 = objc_claimAutoreleasedReturnValue();
          if (!v32)
          {
            v114 = self->_ucat->var0;
            if (v114 <= 90 && (v114 != -1 || _LogCategory_Initialize()))
              LogPrintF();

LABEL_88:
            v38 = self->_ucat->var0;
            if (v38 <= 60 && (v38 != -1 || _LogCategory_Initialize()))
              goto LABEL_262;
            return;
          }
          v33 = (void *)v32;
          objc_msgSend(v136, "addObject:", v32);
          objc_msgSend((Class)getCBUUIDClass[0](), "UUIDWithString:", CFSTR("FE25"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v136, "addObject:", v34);
LABEL_78:
          scanInterval = self->_scanInterval;
          if (self->_scanWindow >= 1)
            scanWindow = self->_scanWindow;
          else
            scanWindow = 30;
          if (scanInterval <= 0)
          {
            scanRate = self->_scanRate;
            if (scanRate <= 49)
            {
              if (scanRate <= 39)
              {
                if (scanRate <= 19)
                  scanInterval = 966;
                else
                  scanInterval = 300;
              }
              else
              {
                scanInterval = 40;
              }
            }
            else
            {
              scanInterval = 30;
            }
          }
          if (objc_msgSend(v136, "count"))
          {
            v88 = scanWindow;
          }
          else
          {
            scanInterval = 0;
            v88 = 0;
          }
          scanStarted = self->_scanStarted;
          if (v3 || !self->_scanStarted)
            goto LABEL_208;
          if (self->_activeScan == self->_scanParamActive
            && self->_needDups == self->_scanParamDups
            && scanInterval == self->_scanParamInterval
            && v88 == self->_scanParamWindow)
          {
            v90 = self->_ucat->var0;
            if (v90 <= 20 && (v90 != -1 || _LogCategory_Initialize()))
              LogPrintF();
          }
          else
          {
            scanStarted = 1;
LABEL_208:
            v91 = scanStarted && v3;
            v92 = self->_ucat->var0;
            if (v92 <= 30 && (v92 != -1 || _LogCategory_Initialize()))
            {
              v93 = self->_payloadType + 1;
              if (v93 > 0x12)
                v94 = "?";
              else
                v94 = off_1E4831390[v93];
              v95 = "yes";
              if (self->_activeScan)
                v96 = "yes";
              else
                v96 = "no";
              if (self->_needDups)
                v97 = "yes";
              else
                v97 = "no";
              if (v3)
                v98 = "yes";
              else
                v98 = "no";
              if (!v91)
                v95 = "no";
              v122 = v98;
              v123 = v95;
              v120 = (uint64_t)v96;
              v121 = (int64_t)v97;
              v118 = (const char *)v88;
              v119 = scanInterval;
              v117 = v94;
              LogPrintF();
            }
            if (v91)
              -[CBCentralManager stopScan](self->_centralManager, "stopScan");
            v132 = self->_centralManager;
            getCBCentralManagerScanOptionActive[0]();
            v135 = (void *)objc_claimAutoreleasedReturnValue();
            v137[0] = v135;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_activeScan);
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            v138[0] = v99;
            getCBCentralManagerScanOptionAllowDuplicatesKey[0]();
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            v137[1] = v100;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_needDups);
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            v138[1] = v101;
            getCBCentralManagerScanOptionIsPrivilegedDaemonKey[0]();
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            v137[2] = v102;
            v138[2] = MEMORY[0x1E0C9AAB0];
            getCBCentralManagerScanOptionScanInterval[0]();
            v103 = (void *)objc_claimAutoreleasedReturnValue();
            v137[3] = v103;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", scanInterval);
            v131 = scanInterval;
            v104 = (void *)objc_claimAutoreleasedReturnValue();
            v138[3] = v104;
            getCBCentralManagerScanOptionScanWindow[0]();
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            v137[4] = v105;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v88);
            v130 = v88;
            v106 = (void *)objc_claimAutoreleasedReturnValue();
            v138[4] = v106;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v138, v137, 5);
            v107 = (void *)objc_claimAutoreleasedReturnValue();
            -[CBCentralManager scanForPeripheralsWithServices:options:](v132, "scanForPeripheralsWithServices:options:", v136, v107);

            self->_scanParamActive = self->_activeScan;
            self->_scanParamDups = self->_needDups;
            self->_scanParamInterval = v131;
            self->_scanParamWindow = v130;
          }
          if (self->_scanState != 1)
          {
            self->_scanState = 1;
            scanStateChangedHandler = (void (**)(id, uint64_t))self->_scanStateChangedHandler;
            if (scanStateChangedHandler)
              scanStateChangedHandler[2](scanStateChangedHandler, 1);
          }
          -[SFBLEScanner _startTimeoutIfNeeded](self, "_startTimeoutIfNeeded", v117, v118, v119, v120, v121, v122, v123);

          goto LABEL_190;
        default:
          v31 = self->_ucat->var0;
          if (v31 <= 20 && (v31 != -1 || _LogCategory_Initialize()))
            LogPrintF();
          goto LABEL_85;
      }
    }
    wpNearby = self->_wpNearby;
    if (!wpNearby)
      return;
    if (self->_scanCache && self->_scanStarted)
    {
      v112 = self->_ucat->var0;
      if (v112 <= 20 && (v112 != -1 || _LogCategory_Initialize()))
        goto LABEL_262;
      return;
    }
    if (-[WPNearby state](wpNearby, "state", v115) != 3)
      goto LABEL_252;
    if (!-[SFBLEScanner _needDups](self, "_needDups") && self->_needDups)
    {
      v14 = self->_ucat->var0;
      if (v14 <= 30 && (v14 != -1 || _LogCategory_Initialize()))
      {
        v15 = self->_payloadType + 1;
        if (v15 > 0x12)
          v16 = "?";
        else
          v16 = off_1E4831390[v15];
        v116 = (void *)v16;
        LogPrintF();
      }
      self->_needDups = 0;
    }
    v42 = self->_scanRate;
    v43 = 10;
    if (v42 > 29)
      v43 = 20;
    if (v42 <= 49)
      v44 = v43;
    else
      v44 = 40;
    v45 = v3 || !self->_scanStarted;
    scanParamFilterData = self->_scanParamFilterData;
    v47 = self->_payloadFilterData;
    v48 = scanParamFilterData;
    if (v47 == v48)
    {

    }
    else
    {
      v49 = v48;
      if ((v47 == 0) == (v48 != 0))
        goto LABEL_138;
      v50 = -[NSData isEqual:](v47, "isEqual:", v48);

      if (!v50)
        goto LABEL_139;
    }
    scanParamFilterMask = self->_scanParamFilterMask;
    v47 = self->_payloadFilterMask;
    v52 = scanParamFilterMask;
    if (v47 == v52)
    {

    }
    else
    {
      v49 = v52;
      if ((v47 == 0) == (v52 != 0))
        goto LABEL_138;
      v53 = -[NSData isEqual:](v47, "isEqual:", v52);

      if (!v53)
        goto LABEL_139;
    }
    scanParamPeers = self->_scanParamPeers;
    v47 = self->_deviceFilter;
    v55 = scanParamPeers;
    if (v47 == (NSData *)v55)
    {

    }
    else
    {
      v49 = v55;
      if ((v47 == 0) == (v55 != 0))
        goto LABEL_138;
      v56 = -[NSData isEqual:](v47, "isEqual:", v55);

      if (!v56)
      {
LABEL_139:
        v60 = self->_scanStarted && v3;
        goto LABEL_142;
      }
    }
    if (v44 != self->_scanParamMode
      || self->_rssiThreshold != self->_scanParamRSSI
      || self->_needDups != self->_scanParamDups
      || self->_scanCache != self->_scanParamCache)
    {
      goto LABEL_139;
    }
    scanUseCases = self->_scanUseCases;
    v47 = self->_useCases;
    v58 = scanUseCases;
    if (v47 == (NSData *)v58)
    {

      goto LABEL_242;
    }
    v49 = v58;
    if ((v47 == 0) != (v58 != 0))
    {
      v59 = -[NSData isEqual:](v47, "isEqual:", v58);

      if ((v59 & 1) == 0)
        goto LABEL_139;
LABEL_242:
      if (!v45)
      {
        v110 = self->_ucat->var0;
        if (v110 <= 20 && (v110 != -1 || _LogCategory_Initialize()))
          LogPrintF();
        goto LABEL_189;
      }
      v60 = 0;
      if (self->_scanStarted && v3)
      {
        v109 = self->_ucat->var0;
        if (v109 <= 30 && (v109 != -1 || _LogCategory_Initialize()))
          LogPrintF();
        -[WPNearby clearDuplicatesForType:](self->_wpNearby, "clearDuplicatesForType:", self->_wpNearbyType, v116);
        goto LABEL_188;
      }
LABEL_142:
      v61 = self->_ucat->var0;
      if (v61 > 30 || v61 == -1 && !_LogCategory_Initialize())
      {
LABEL_181:
        if (v60)
          -[WPNearby stopScanningForType:](self->_wpNearby, "stopScanningForType:", self->_wpNearbyType);
        v73 = self->_wpNearby;
        wpNearbyType = self->_wpNearbyType;
        payloadFilterData = self->_payloadFilterData;
        payloadFilterMask = self->_payloadFilterMask;
        deviceFilter = self->_deviceFilter;
        rssiThreshold = self->_rssiThreshold;
        if (rssiThreshold)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_rssiThreshold);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v79 = 0;
        }
        BYTE1(v116) = self->_scanCache;
        LOBYTE(v116) = self->_needDups;
        -[WPNearby startScanningForType:data:mask:peers:scanMode:rssi:duplicates:scanCache:useCaseList:](v73, "startScanningForType:data:mask:peers:scanMode:rssi:duplicates:scanCache:useCaseList:", wpNearbyType, payloadFilterData, payloadFilterMask, deviceFilter, v44, v79, v116, self->_useCases, v119, v120, v121, v122, v123, v124, v125, v126, v127);
        if (rssiThreshold)

LABEL_188:
        v80 = (NSData *)-[NSData copy](self->_payloadFilterData, "copy");
        v81 = self->_scanParamFilterData;
        self->_scanParamFilterData = v80;

        v82 = (NSData *)-[NSData copy](self->_payloadFilterMask, "copy");
        v83 = self->_scanParamFilterMask;
        self->_scanParamFilterMask = v82;

        v84 = (NSArray *)-[NSArray copy](self->_deviceFilter, "copy");
        v85 = self->_scanParamPeers;
        self->_scanParamPeers = v84;

        self->_scanParamMode = v44;
        self->_scanParamRSSI = self->_rssiThreshold;
        self->_scanParamDups = self->_needDups;
        self->_scanParamCache = self->_scanCache;
        v86 = (NSSet *)-[NSSet copy](self->_useCases, "copy");
        v87 = self->_scanUseCases;
        self->_scanUseCases = v86;

LABEL_189:
        -[SFBLEScanner _updateTrackedPeers](self, "_updateTrackedPeers", v116);
        goto LABEL_190;
      }
      if (self->_payloadFilterData)
        v62 = self->_payloadFilterData;
      else
        v62 = (NSData *)&stru_1E483B8E8;
      v63 = -[NSArray count](self->_deviceFilter, "count", v116);
      v64 = self->_scanRate;
      v134 = v3;
      v129 = v63;
      if (v64 <= 19)
      {
        v65 = "Invalid";
        switch(v64)
        {
          case 0:
            goto LABEL_168;
          case 1:
            v65 = "BackgroundOld";
            break;
          case 2:
            v65 = "NormalOld";
            break;
          case 3:
            v65 = "HighOld";
            break;
          case 4:
            v65 = "AggressiveOld";
            break;
          case 10:
            v65 = "Background";
            break;
          default:
            goto LABEL_167;
        }
        goto LABEL_168;
      }
      if (v64 > 39)
      {
        if (v64 == 40)
        {
          v65 = "High";
          goto LABEL_168;
        }
        if (v64 == 50)
        {
          v65 = "Aggressive";
          goto LABEL_168;
        }
      }
      else
      {
        if (v64 == 20)
        {
          v65 = "Normal";
          goto LABEL_168;
        }
        if (v64 == 30)
        {
          v65 = "HighNormal";
LABEL_168:
          v128 = self->_rssiThreshold;
          if (self->_needDups)
            v66 = "yes";
          else
            v66 = "no";
          if (self->_scanCache)
            v67 = "yes";
          else
            v67 = "no";
          v68 = -[NSSet count](self->_trackedPeers, "count");
          -[SFBLEScanner _useCasesToString:](self, "_useCasesToString:", self->_useCases);
          v69 = objc_claimAutoreleasedReturnValue();
          v70 = (void *)v69;
          if (v134)
            v71 = "yes";
          else
            v71 = "no";
          if (v60)
            v72 = "yes";
          else
            v72 = "no";
          v126 = v71;
          v127 = v72;
          v124 = v68;
          v125 = v69;
          v122 = v66;
          v123 = v67;
          v120 = (uint64_t)v65;
          v121 = v128;
          v119 = v129;
          v116 = v62;
          LogPrintF();

          goto LABEL_181;
        }
      }
LABEL_167:
      v65 = "?";
      goto LABEL_168;
    }
LABEL_138:

    goto LABEL_139;
  }
  if (payloadType == -1)
    goto LABEL_36;
  if (payloadType != 5)
  {
    if (payloadType == 7)
    {
      wpPairing = self->_wpPairing;
      if (!wpPairing)
        return;
      if (-[WPPairing state](wpPairing, "state") == 3)
      {
        v10 = self->_scanRate;
        if (v10 <= 49)
          v11 = 2 * (v10 > 39);
        else
          v11 = 3;
        v12 = v3 || !self->_scanStarted;
        v20 = self->_rssiThreshold;
        if (v20 == self->_scanParamRSSI && self->_needDups == self->_scanParamDups)
        {
          scanParamMode = self->_scanParamMode;
          if (((v11 == scanParamMode) & ~v12) != 0)
          {
            v41 = self->_ucat->var0;
            if (v41 <= 20 && (v41 != -1 || _LogCategory_Initialize()))
              LogPrintF();
            goto LABEL_190;
          }
          v22 = self->_scanStarted && v3;
          if (v11 == scanParamMode && v22)
          {
            v23 = self->_ucat->var0;
            if (v23 <= 30 && (v23 != -1 || _LogCategory_Initialize()))
              LogPrintF();
            -[WPPairing clearProximityPairingServiceDuplicates](self->_wpPairing, "clearProximityPairingServiceDuplicates", v115);
LABEL_98:
            self->_scanParamRSSI = self->_rssiThreshold;
            self->_scanParamDups = self->_needDups;
            self->_scanParamMode = v11;
            goto LABEL_190;
          }
        }
        else
        {
          v22 = self->_scanStarted && v3;
        }
        v24 = self->_ucat->var0;
        if (v24 <= 30)
        {
          if (v24 != -1)
          {
            v133 = v3;
LABEL_62:
            v25 = SFScanRateToString(v10);
            if (self->_needDups)
              v26 = "yes";
            else
              v26 = "no";
            -[SFBLEScanner _useCasesToString:](self, "_useCasesToString:", self->_useCases, v115);
            v27 = objc_claimAutoreleasedReturnValue();
            v28 = (void *)v27;
            if (v133)
              v29 = "yes";
            else
              v29 = "no";
            if (v22)
              v30 = "yes";
            else
              v30 = "no";
            v121 = (int64_t)v29;
            v122 = v30;
            v119 = (int64_t)v26;
            v120 = v27;
            v115 = v20;
            v118 = v25;
            LogPrintF();

            goto LABEL_93;
          }
          if (_LogCategory_Initialize())
          {
            v133 = v3;
            v20 = self->_rssiThreshold;
            v10 = self->_scanRate;
            goto LABEL_62;
          }
        }
LABEL_93:
        if (v22)
          -[WPPairing stopProximityPairingServiceScanning](self->_wpPairing, "stopProximityPairingServiceScanning");
        v39 = self->_wpPairing;
        if (self->_rssiThreshold)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          -[WPPairing startProximityPairingServiceScanningWithRSSI:duplicates:scanMode:](v39, "startProximityPairingServiceScanningWithRSSI:duplicates:scanMode:", v40, self->_needDups, v11);

        }
        else
        {
          -[WPPairing startProximityPairingServiceScanningWithRSSI:duplicates:scanMode:](self->_wpPairing, "startProximityPairingServiceScanningWithRSSI:duplicates:scanMode:", 0, self->_needDups, v11);
        }
        goto LABEL_98;
      }
LABEL_252:
      v111 = self->_ucat->var0;
      if (v111 <= 20 && (v111 != -1 || _LogCategory_Initialize()))
        goto LABEL_262;
      return;
    }
    goto LABEL_38;
  }
  wpAirDrop = self->_wpAirDrop;
  if (!wpAirDrop)
    return;
  if (-[WPAWDL state](wpAirDrop, "state") == 3)
  {
    -[WPAWDL stopConnectionlessAWDLServiceScanning](self->_wpAirDrop, "stopConnectionlessAWDLServiceScanning");
    -[WPAWDL startConnectionlessAWDLServiceScanning](self->_wpAirDrop, "startConnectionlessAWDLServiceScanning");
LABEL_190:
    self->_scanStarted = 1;
    -[SFBLEScanner _updateRescanTimer](self, "_updateRescanTimer", v115, v118, v119, v120, v121, v122);
    -[CURetrier succeededDirect](self->_startRetrier, "succeededDirect");
    return;
  }
  v113 = self->_ucat->var0;
  if (v113 <= 20 && (v113 != -1 || _LogCategory_Initialize()))
LABEL_262:
    LogPrintF();
}

- (void)_updateRescanTimer
{
  unint64_t v3;
  int var0;
  int rescanIntervalScreenOff;
  int v7;
  int v8;
  OS_dispatch_source *v9;
  OS_dispatch_source *rescanTimer;
  OS_dispatch_source *v11;
  OS_dispatch_source *v12;
  NSObject *v13;
  OS_dispatch_source *v14;
  _QWORD handler[5];

  v3 = -[NSMutableDictionary count](self->_devices, "count");
  if (self->_rescanInterval <= 0.0 || v3 == 0)
  {
    if (self->_rescanTimer)
    {
      var0 = self->_ucat->var0;
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
        LogPrintF();
      v9 = self->_rescanTimer;
      if (v9)
      {
        v14 = v9;
        dispatch_source_cancel((dispatch_source_t)v9);
        rescanTimer = self->_rescanTimer;
        self->_rescanTimer = 0;

      }
    }
  }
  else
  {
    if (v3 >= 0x15)
      rescanIntervalScreenOff = 60;
    else
      rescanIntervalScreenOff = 10;
    if ((objc_msgSend((id)gSFNearbyAgent, "screenOn") & 1) == 0
      && rescanIntervalScreenOff <= SLODWORD(self->_rescanIntervalScreenOff))
    {
      rescanIntervalScreenOff = self->_rescanIntervalScreenOff;
    }
    if (self->_rescanTimer)
    {
      if (rescanIntervalScreenOff == self->_rescanSecondsActual)
        return;
      v7 = self->_ucat->var0;
      if (v7 <= 30 && (v7 != -1 || _LogCategory_Initialize()))
        LogPrintF();
      CUDispatchTimerSet();
    }
    else
    {
      v8 = self->_ucat->var0;
      if (v8 <= 30 && (v8 != -1 || _LogCategory_Initialize()))
        LogPrintF();
      v11 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
      v12 = self->_rescanTimer;
      self->_rescanTimer = v11;

      v13 = self->_rescanTimer;
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __34__SFBLEScanner__updateRescanTimer__block_invoke;
      handler[3] = &unk_1E482DF78;
      handler[4] = self;
      dispatch_source_set_event_handler(v13, handler);
      CUDispatchTimerSet();
      dispatch_activate((dispatch_object_t)self->_rescanTimer);
    }
    self->_rescanSecondsActual = rescanIntervalScreenOff;
  }
}

- (void)_updateTrackedPeers
{
  NSSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  NSSet *trackedPeersApplied;
  NSSet *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int var0;
  uint64_t v19;
  NSSet *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  NSSet *v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (-[NSSet count](self->_trackedPeers, "count") && !self->_invalidateCalled)
  {
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v12 = self->_trackedPeersApplied;
    v13 = -[NSSet countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v39;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v39 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v16);
          if (!-[NSSet containsObject:](self->_trackedPeers, "containsObject:", v17))
          {
            var0 = self->_ucat->var0;
            if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
            {
              LogPrintF();
              -[WPNearby stopTrackingPeer:forType:](self->_wpNearby, "stopTrackingPeer:forType:", v17, self->_wpNearbyType, v17);
            }
            else
            {
              -[WPNearby stopTrackingPeer:forType:](self->_wpNearby, "stopTrackingPeer:forType:", v17, self->_wpNearbyType, v29);
            }
          }
          ++v16;
        }
        while (v14 != v16);
        v19 = -[NSSet countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
        v14 = v19;
      }
      while (v19);
    }

    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v20 = self->_trackedPeers;
    v21 = -[NSSet countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v35;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v35 != v23)
            objc_enumerationMutation(v20);
          v25 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v24);
          if (!-[NSSet containsObject:](self->_trackedPeersApplied, "containsObject:", v25))
          {
            v26 = self->_ucat->var0;
            if (v26 <= 30 && (v26 != -1 || _LogCategory_Initialize()))
            {
              LogPrintF();
              -[WPNearby startTrackingPeer:forType:](self->_wpNearby, "startTrackingPeer:forType:", v25, self->_wpNearbyType, v25);
            }
            else
            {
              -[WPNearby startTrackingPeer:forType:](self->_wpNearby, "startTrackingPeer:forType:", v25, self->_wpNearbyType, v29);
            }
          }
          ++v24;
        }
        while (v22 != v24);
        v27 = -[NSSet countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
        v22 = v27;
      }
      while (v27);
    }

    v28 = self->_trackedPeers;
    trackedPeersApplied = self->_trackedPeersApplied;
    self->_trackedPeersApplied = v28;
  }
  else
  {
    if (!-[NSSet count](self->_trackedPeersApplied, "count"))
      return;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v3 = self->_trackedPeersApplied;
    v4 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v31;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v31 != v6)
            objc_enumerationMutation(v3);
          v8 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v7);
          v9 = self->_ucat->var0;
          if (v9 <= 30 && (v9 != -1 || _LogCategory_Initialize()))
          {
            v29 = v8;
            LogPrintF();
          }
          -[WPNearby stopTrackingPeer:forType:](self->_wpNearby, "stopTrackingPeer:forType:", v8, self->_wpNearbyType, v29);
          ++v7;
        }
        while (v5 != v7);
        v10 = -[NSSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
        v5 = v10;
      }
      while (v10);
    }

    trackedPeersApplied = self->_trackedPeersApplied;
    self->_trackedPeersApplied = 0;
  }

}

- (BOOL)_needDups
{
  int64_t payloadType;
  NSMutableDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  __int16 Int64Ranged;
  BOOL v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  char v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  payloadType = self->_payloadType;
  if (payloadType != 15)
  {
    if (payloadType != 7)
    {
      LOBYTE(v14) = -[NSMutableDictionary count](self->_devices, "count") != 0;
      return v14;
    }
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v4 = self->_devices;
    v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v28;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v28 != v7)
            objc_enumerationMutation(v4);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "advertisementFields");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (CFDictionaryGetInt64()
            || ((Int64Ranged = CFDictionaryGetInt64Ranged(), (Int64Ranged & 0x12) != 0)
              ? (v12 = (Int64Ranged & 0x200) == 0)
              : (v12 = 0),
                v12))
          {

            goto LABEL_33;
          }
          v13 = CFDictionaryGetInt64Ranged();

          if (v13 == 5)
            goto LABEL_33;
        }
        v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        if (v6)
          continue;
        break;
      }
    }
    goto LABEL_29;
  }
  v14 = objc_msgSend((id)gSFNearbyAgent, "screenOn");
  if (v14)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v4 = self->_devices;
    v15 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v24;
      while (2)
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v24 != v17)
            objc_enumerationMutation(v4);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * j), (_QWORD)v23);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "advertisementFields");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (CFDictionaryGetInt64()
            || CFDictionaryGetInt64() && CFDictionaryGetInt64Ranged() - 50 > 0x1E)
          {

LABEL_33:
            LOBYTE(v14) = 1;
            return v14;
          }
          v21 = CFDictionaryGetInt64Ranged();

          if ((v21 & 0x10) != 0)
            goto LABEL_33;
        }
        v16 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
        if (v16)
          continue;
        break;
      }
    }
LABEL_29:

    LOBYTE(v14) = 0;
  }
  return v14;
}

void __59__SFBLEScanner__foundDevice_advertisementData_rssi_fields___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t Int64;
  int v7;
  id v8;

  v3 = a2;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) == 7)
  {
    v8 = v3;
    objc_msgSend(v3, "advertisementFields");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = CFDictionaryGetInt64Ranged() & 0x24;
    Int64 = CFDictionaryGetInt64();
    if (v5 | Int64)
    {
      if (Int64)
      {
        if (objc_msgSend(v8, "proxPairingTicks"))
        {
          objc_msgSend(v8, "setProxPairingTicks:", 0);
          v7 = **(_DWORD **)(*(_QWORD *)(a1 + 32) + 144);
          if (v7 <= 50 && (v7 != -1 || _LogCategory_Initialize()))
            LogPrintF();
        }
      }
    }
    else if (!objc_msgSend(v8, "proxPairingTicks"))
    {
      objc_msgSend(v8, "setProxPairingTicks:", mach_absolute_time());
    }

    v3 = v8;
  }

}

- (BOOL)_updateCounterpart:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSMutableDictionary *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
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
  v5 = v4;
  if (self->_payloadType == 7
    && (objc_msgSend(v4, "bluetoothAddress"), (v6 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v7 = (void *)v6;
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = self->_devices;
    v9 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v20 != v11)
            objc_enumerationMutation(v8);
          -[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i), (_QWORD)v19);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13;
          if (v13 == v5)
          {
            v15 = 0;
          }
          else
          {
            objc_msgSend(v13, "bluetoothAddress");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v15, "isEqual:", v7))
            {
              objc_msgSend(v14, "identifier");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "setCounterpartIdentifier:", v16);

              v17 = 1;
              goto LABEL_15;
            }
          }

        }
        v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v10);
    }
    v17 = 0;
LABEL_15:

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (BOOL)_needActiveScan
{
  return 0;
}

- (id)_useCasesToString:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t i;
  int v9;
  const char *v10;
  __CFString *v11;
  __CFString *v12;
  const char *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __CFString *v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v19 = 0;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v3);
        if ((v6 & 1) == 0)
          v6 = 1;
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "unsignedIntValue", v14);
        if (v9 >= 0x20000)
        {
          if (v9 >= 327680)
          {
            if (v9 >= 589824)
            {
              if (v9 <= 2147418111)
              {
                switch(v9)
                {
                  case 589824:
                    v10 = "FindNearbyRemote";
                    break;
                  case 589825:
                    v10 = "FindNearbyPencil";
                    break;
                  case 655360:
                    v10 = "AccessDigitalHomeKey";
                    break;
                  default:
LABEL_121:
                    v10 = "?";
                    break;
                }
              }
              else
              {
                switch(v9)
                {
                  case 2147418112:
                    v10 = "InternalTestNoLockScan";
                    break;
                  case 2147418113:
                    v10 = "InternalTestNoScreenOffScan";
                    break;
                  case 2147418114:
                    v10 = "InternalTestScanWithNoDups";
                    break;
                  case 2147418115:
                    v10 = "InternalTestScanWithDups";
                    break;
                  case 2147418116:
                    v10 = "InternalTestScanFor20Seconds";
                    break;
                  case 2147418117:
                    v10 = "InternalTestActiveScan";
                    break;
                  case 2147418118:
                    v10 = "InternalTestUUIDScan";
                    break;
                  case 2147418119:
                    v10 = "InternalTestScanFor10ClockSeconds";
                    break;
                  case 2147418120:
                    v10 = "InternalTestScanBoost";
                    break;
                  default:
                    goto LABEL_121;
                }
              }
            }
            else if (v9 > 458752)
            {
              switch(v9)
              {
                case 524288:
                  v10 = "ADPD";
                  break;
                case 524289:
                  v10 = "ADPDBuffer";
                  break;
                case 524290:
                  v10 = "MicroLocation";
                  break;
                case 524291:
                  v10 = "MicroLocationLeech";
                  break;
                default:
                  if (v9 == 458753)
                  {
                    v10 = "PrecisionFindingFindee";
                  }
                  else
                  {
                    if (v9 != 458754)
                      goto LABEL_121;
                    v10 = "PrecisionFindingFindeeHighPriority";
                  }
                  break;
              }
            }
            else
            {
              switch(v9)
              {
                case 393216:
                  v10 = "CaptiveNetworkJoin";
                  break;
                case 393217:
                  v10 = "UseCaseSIMTransfer";
                  break;
                case 393218:
                  v10 = "MacSetup";
                  break;
                case 393219:
                  v10 = "AppleIDSignIn";
                  break;
                case 393220:
                  v10 = "AppleIDSignInSettings";
                  break;
                default:
                  if (v9 == 327680)
                  {
                    v10 = "RapportThirdParty";
                  }
                  else
                  {
                    if (v9 != 458752)
                      goto LABEL_121;
                    v10 = "PrecisionFindingFinder";
                  }
                  break;
              }
            }
          }
          else
          {
            switch(v9)
            {
              case 131072:
                v10 = "SharingDefault";
                break;
              case 131073:
                v10 = "SharingPhoneAutoUnlock";
                break;
              case 131074:
                v10 = "SharingSiriWatchAuth";
                break;
              case 131075:
                v10 = "SharingMacAutoUnlock";
                break;
              case 131076:
                v10 = "SharingEDTScreenOn";
                break;
              case 131077:
                v10 = "SharingEDTWiFiDisabled";
                break;
              case 131078:
                v10 = "SharingEDTWombatEligibleAsDefaultCamera";
                break;
              case 131079:
                v10 = "SharingEDTWombatCameraPicker";
                break;
              case 131080:
                v10 = "SharingWombatBackground";
                break;
              case 131081:
                v10 = "SharingUniversalControl";
                break;
              case 131082:
                v10 = "SharingPeopleProximity";
                break;
              case 131083:
                v10 = "SharingEDTEnsembleOpenDisplayPrefs";
                break;
              case 131084:
                v10 = "SharingEDTNearbydMotionStopped";
                break;
              case 131085:
                v10 = "SharingDoubleBoostGenericScan";
                break;
              case 131086:
                v10 = "SharingEDTIncomingAdvertisement ";
                break;
              case 131087:
                v10 = "SharingEDTWombatStreamStart";
                break;
              case 131088:
                v10 = "SharingOYAutoUnlock";
                break;
              case 131089:
                goto LABEL_121;
              case 131090:
                v10 = "SharingAirDrop";
                break;
              case 131091:
                v10 = "SharingNearbyInvitationHost";
                break;
              case 131092:
                v10 = "SharingNearbyInvitationParticipant";
                break;
              case 131093:
                v10 = "SharingAirDropAskToAirDrop";
                break;
              case 131094:
                v10 = "SharingAirDropTempIdentity";
                break;
              case 131095:
                v10 = "SharingAirDropNeedsCLink";
                break;
              case 131096:
                v10 = "SharingRemoteWidgetUpdate";
                break;
              case 131097:
                v10 = "SharingCountryCodeUpdate";
                break;
              case 131098:
                v10 = "SharingMacPhoneAutoUnlock";
                break;
              case 131099:
                v10 = "SharingVisionProDiscovery";
                break;
              case 131100:
                v10 = "SharingVisionProStateChange";
                break;
              case 131101:
                v10 = "SharingContinuityScreen";
                break;
              case 131102:
                v10 = "SharingEDTRemoteDisplay";
                break;
              default:
                if (v9 == 196608)
                {
                  v10 = "DigitalIDTSA";
                }
                else
                {
                  if (v9 != 0x40000)
                    goto LABEL_121;
                  v10 = "DigitalCarKeyThirdParty";
                }
                break;
            }
          }
        }
        else
        {
          v10 = "Unspecified";
          switch(v9)
          {
            case 0:
              break;
            case 1:
              v10 = "HealthKit";
              break;
            case 2:
              v10 = "HomeKit";
              break;
            case 3:
              v10 = "FindMyObjectConnection";
              break;
            case 4:
              v10 = "FindMyObjectConnectionTransient";
              break;
            case 5:
              v10 = "MIDI";
              break;
            case 6:
              v10 = "Continuity";
              break;
            case 7:
              v10 = "InstantHotSpot";
              break;
            case 8:
              v10 = "NearBy";
              break;
            case 9:
              v10 = "Sharing";
              break;
            case 10:
              v10 = "HearingSupport";
              break;
            case 11:
              v10 = "Magnet";
              break;
            case 12:
              v10 = "HID";
              break;
            case 13:
              v10 = "LEA";
              break;
            case 14:
              v10 = "External";
              break;
            case 15:
              v10 = "ExternalMedical";
              break;
            case 16:
              v10 = "ExternalLock";
              break;
            case 17:
              v10 = "ExternalWatch";
              break;
            case 18:
              v10 = "SmartRouting";
              break;
            case 19:
              v10 = "DigitalID";
              break;
            case 20:
              v10 = "DigitalKey";
              break;
            case 21:
              v10 = "DigitalCarKey";
              break;
            case 22:
              v10 = "HeySiri";
              break;
            case 23:
              v10 = "ThirdPartyApp";
              break;
            case 24:
              v10 = "CNJ";
              break;
            default:
              switch(v9)
              {
                case 256:
                  v10 = "DevicePresenceDetection";
                  break;
                case 257:
                  v10 = "AudioBox";
                  break;
                case 258:
                  v10 = "SIMTransfer";
                  break;
                case 259:
                  v10 = "ProximityScreenOnLeechScan";
                  break;
                case 260:
                  v10 = "MacMigrate";
                  break;
                case 263:
                  v10 = "HIDUARTService";
                  break;
                case 264:
                  v10 = "AccessibilitySwitchControlPairing";
                  break;
                case 265:
                  v10 = "BaseBandFastConnect";
                  break;
                case 266:
                  v10 = "SafetyAlerts";
                  break;
                case 267:
                  v10 = "LECarPlay";
                  break;
                case 268:
                  v10 = "TCCBluetooth";
                  break;
                case 269:
                  v10 = "AOPBufferLeech";
                  break;
                default:
                  goto LABEL_121;
              }
              break;
          }
        }
        v14 = v10;
        NSAppendPrintF();
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v20, 16, v14);
    }
    while (v5);
  }
  v11 = v19;
  if (!v19)
    v11 = &stru_1E483B8E8;
  v12 = v11;

  return v12;
}

- (void)performUpdate:(id)a3
{
  uint64_t v4;
  NSObject *dispatchQueue;
  void (**v6)(_QWORD);
  NSObject *v7;
  _QWORD v8[5];
  _QWORD block[5];

  v4 = MEMORY[0x1E0C809B0];
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__SFBLEScanner_performUpdate___block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  v6 = (void (**)(_QWORD))a3;
  dispatch_async(dispatchQueue, block);
  v6[2](v6);

  v7 = self->_dispatchQueue;
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __30__SFBLEScanner_performUpdate___block_invoke_2;
  v8[3] = &unk_1E482DF78;
  v8[4] = self;
  dispatch_async(v7, v8);
}

- (void)setUseCases:(id)a3
{
  void *v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = (void *)objc_msgSend(a3, "copy");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __28__SFBLEScanner_setUseCases___block_invoke;
  v6[3] = &unk_1E482D3A0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[SFBLEScanner _invokeBlockActivateSafe:](self, "_invokeBlockActivateSafe:", v6);

}

- (void)setChangeFlags:(unsigned int)a3
{
  _QWORD v3[5];
  unsigned int v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __31__SFBLEScanner_setChangeFlags___block_invoke;
  v3[3] = &unk_1E4830D68;
  v3[4] = self;
  v4 = a3;
  -[SFBLEScanner _invokeBlockActivateSafe:](self, "_invokeBlockActivateSafe:", v3);
}

- (void)setRssiThreshold:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __33__SFBLEScanner_setRssiThreshold___block_invoke;
  v3[3] = &unk_1E482E018;
  v3[4] = self;
  v3[5] = a3;
  -[SFBLEScanner _invokeBlockActivateSafe:](self, "_invokeBlockActivateSafe:", v3);
}

- (void)_invokeBlockActivateSafe:(id)a3
{
  void (**v4)(_QWORD);
  SFBLEScanner *v5;
  NSObject *dispatchQueue;
  _QWORD v7[5];
  void (**v8)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_activateCalled)
  {
    dispatchQueue = v5->_dispatchQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __41__SFBLEScanner__invokeBlockActivateSafe___block_invoke;
    v7[3] = &unk_1E482E0F0;
    v7[4] = v5;
    v8 = v4;
    dispatch_async(dispatchQueue, v7);

  }
  else
  {
    v4[2](v4);
  }
  objc_sync_exit(v5);

}

uint64_t __33__SFBLEScanner_setRssiThreshold___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 360) = *(_QWORD *)(result + 40);
  return result;
}

uint64_t __31__SFBLEScanner_setChangeFlags___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(result + 32) + 260) = *(_DWORD *)(result + 40);
  return result;
}

void __28__SFBLEScanner_setUseCases___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 432), *(id *)(a1 + 40));
}

- (void)_activateWithCompletion:(id)a3
{
  void (**v4)(id, void *);
  int var0;
  int64_t payloadType;
  void *v7;
  WPPairing *v8;
  WPPairing *wpPairing;
  void *v10;
  WPNearby *v11;
  WPNearby *wpNearby;
  CBCentralManager *v13;
  CBCentralManager *centralManager;
  void *v15;
  WPAWDL *v16;
  WPAWDL *wpAirDrop;
  CURetrier *v18;
  CURetrier *startRetrier;
  CURetrier *v20;
  int v21;
  const char *v22;
  uint64_t v23;
  int v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  const char *v34;
  _QWORD v35[5];
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  if (self->_invalidateCalled)
  {
    v23 = 4294960572;
    goto LABEL_42;
  }
  if (self->_startRetrier)
  {
    v23 = 4294960575;
    goto LABEL_42;
  }
  payloadType = self->_payloadType;
  if (payloadType > 14)
  {
    if ((unint64_t)(payloadType - 15) < 2)
    {
      self->_wpNearbyType = payloadType != 15;
      if (self->_wpNearby)
        goto LABEL_26;
      +[SFBLEClient sharedClient](SFBLEClient, "sharedClient");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addNearbyDelegate:", self);
      v11 = (WPNearby *)objc_claimAutoreleasedReturnValue();
      wpNearby = self->_wpNearby;
      self->_wpNearby = v11;

      if (self->_wpNearby)
        goto LABEL_26;
LABEL_52:
      v23 = 4294960567;
LABEL_42:
      v24 = self->_ucat->var0;
      if (v24 <= 60 && (v24 != -1 || _LogCategory_Initialize()))
      {
        v33 = v23;
        LogPrintF();
      }
      if (v4)
      {
        v25 = (void *)MEMORY[0x1E0CB35C8];
        v26 = *MEMORY[0x1E0CB2F90];
        v27 = (int)v23;
        v36 = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", DebugGetErrorString());
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = (void *)v28;
        v30 = CFSTR("?");
        if (v28)
          v30 = (const __CFString *)v28;
        v37[0] = v30;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, &v36, 1, v33, v34);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "errorWithDomain:code:userInfo:", v26, v27, v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v4[2](v4, v32);

      }
      goto LABEL_32;
    }
    if (payloadType != 17)
    {
LABEL_33:
      v21 = self->_ucat->var0;
      if (v21 <= 60)
      {
        if (v21 != -1)
        {
LABEL_35:
          if ((unint64_t)(payloadType + 1) > 0x12)
            v22 = "?";
          else
            v22 = off_1E4831390[payloadType + 1];
          v33 = payloadType;
          v34 = v22;
          LogPrintF();
          goto LABEL_41;
        }
        if (_LogCategory_Initialize())
        {
          payloadType = self->_payloadType;
          goto LABEL_35;
        }
      }
LABEL_41:
      v23 = 4294960561;
      goto LABEL_42;
    }
LABEL_21:
    if (self->_centralManager)
      goto LABEL_26;
    v13 = (CBCentralManager *)objc_msgSend(objc_alloc((Class)getCBCentralManagerClass_0[0]()), "initWithDelegate:queue:", self, self->_dispatchQueue);
    centralManager = self->_centralManager;
    self->_centralManager = v13;

    if (self->_centralManager)
      goto LABEL_26;
    goto LABEL_52;
  }
  if (payloadType == -1)
    goto LABEL_21;
  if (payloadType == 5)
  {
    if (self->_wpAirDrop)
      goto LABEL_26;
    +[SFBLEClient sharedClient](SFBLEClient, "sharedClient");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addAirDropDelegate:", self);
    v16 = (WPAWDL *)objc_claimAutoreleasedReturnValue();
    wpAirDrop = self->_wpAirDrop;
    self->_wpAirDrop = v16;

    if (self->_wpAirDrop)
      goto LABEL_26;
    goto LABEL_52;
  }
  if (payloadType != 7)
    goto LABEL_33;
  if (-[SFBLEScanner _btSessionUsable](self, "_btSessionUsable"))
    -[SFBLEScanner _btSessionEnsureStarted](self, "_btSessionEnsureStarted");
  if (!self->_wpPairing)
  {
    +[SFBLEClient sharedClient](SFBLEClient, "sharedClient");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addPairingDelegate:", self);
    v8 = (WPPairing *)objc_claimAutoreleasedReturnValue();
    wpPairing = self->_wpPairing;
    self->_wpPairing = v8;

    if (!self->_wpPairing)
      goto LABEL_52;
  }
LABEL_26:
  if (self->_rssiLog && !self->_rssiEventLogFile)
    -[SFBLEScanner _rssiLogOpen](self, "_rssiLogOpen");
  v18 = (CURetrier *)objc_alloc_init(MEMORY[0x1E0D1B430]);
  startRetrier = self->_startRetrier;
  self->_startRetrier = v18;

  v20 = self->_startRetrier;
  if (!v20)
    goto LABEL_52;
  -[CURetrier setDispatchQueue:](v20, "setDispatchQueue:", self->_dispatchQueue);
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __40__SFBLEScanner__activateWithCompletion___block_invoke;
  v35[3] = &unk_1E482DF78;
  v35[4] = self;
  -[CURetrier setActionHandler:](self->_startRetrier, "setActionHandler:", v35);
  -[CURetrier startDirect](self->_startRetrier, "startDirect");
  if (v4)
    v4[2](v4, 0);
LABEL_32:

}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)nearby:(id)a3 didDiscoverType:(int64_t)a4 withData:(id)a5 fromPeer:(id)a6 peerInfo:(id)a7
{
  id v12;
  id v13;
  NSObject *dispatchQueue;
  WPNearby *v15;
  WPNearby *wpNearby;
  id v17;

  v17 = a5;
  v12 = a6;
  v13 = a7;
  dispatchQueue = self->_dispatchQueue;
  v15 = (WPNearby *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  wpNearby = self->_wpNearby;

  if (wpNearby && wpNearby == v15 && self->_wpNearbyType == a4)
  {
    -[SFBLEScanner _recordDevice:data:rssi:info:](self, "_recordDevice:data:rssi:info:", v12, v17, 0, v13);
    -[SFBLEScanner foundNearbyDevice:data:peerInfo:](self, "foundNearbyDevice:data:peerInfo:", v12, v17, v13);
  }

}

- (void)foundNearbyDevice:(id)a3 data:(id)a4 peerInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  int64_t wpNearbyType;
  id v23;

  v23 = a3;
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  getWPNearbyKeyRSSI[0]();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v13 = objc_msgSend(v12, "integerValue");
  else
    v13 = 0;
  getWPNearbyKeyManufacturerData[0]();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v15, "length"))
  {
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, CFSTR("mfrD"));
    -[SFBLEScanner _nearbyParseManufacturerData:fields:](self, "_nearbyParseManufacturerData:fields:", v15, v10);
  }
  else
  {
    v19 = objc_retainAutorelease(v8);
    v20 = objc_msgSend(v19, "bytes");
    v21 = v20 + objc_msgSend(v19, "length");
    wpNearbyType = self->_wpNearbyType;
    if (wpNearbyType == 1)
    {
      -[SFBLEScanner _nearbyParseNearbyInfoPtr:end:fields:](self, "_nearbyParseNearbyInfoPtr:end:fields:", v20, v21, v10);
    }
    else if (!wpNearbyType)
    {
      -[SFBLEScanner _nearbyParseNearbyActionPtr:end:fields:](self, "_nearbyParseNearbyActionPtr:end:fields:", v20, v21, v10);
    }
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("kDeviceChannel"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, CFSTR("ch"));
  getWPNearbyKeyDeviceAddress[0]();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v18, "length") == 6)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v18, CFSTR("bdAddr"));
  getWPNearbyKeyPaired[0]();
  if (CFDictionaryGetInt64())
    objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("paired"));
  -[SFBLEScanner _foundDevice:advertisementData:rssi:fields:](self, "_foundDevice:advertisementData:rssi:fields:", v23, v8, v13, v10);

}

- (void)_recordDevice:(id)a3 data:(id)a4 rssi:(id)a5 info:(id)a6
{
  SFBLERecorder *recorder;
  BOOL v8;
  id v9;
  int var0;
  id v11;

  recorder = self->_recorder;
  if (recorder)
  {
    v11 = 0;
    v8 = -[SFBLERecorder recordDevice:data:rssi:info:error:](recorder, "recordDevice:data:rssi:info:error:", a3, a4, a5, a6, &v11);
    v9 = v11;
    if (!v8)
    {
      var0 = self->_ucat->var0;
      if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
        LogPrintF();
    }

  }
}

- (void)_nearbyParseNearbyInfoPtr:(const char *)a3 end:(const char *)a4 fields:(id)a5
{
  id v7;
  char v8;
  char v9;
  void *v10;
  char *v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  void *v16;
  char v17;
  void *v18;
  unsigned int v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  char v24;

  v7 = a5;
  if (a4 - a3 >= 1)
  {
    v9 = *a3++;
    v8 = v9;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9 & 0xF);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("al"));

    if ((v9 & 0x10) != 0)
    {
      objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("meD"));
      if ((v8 & 0x20) == 0)
      {
LABEL_4:
        if ((v8 & 0x40) == 0)
          goto LABEL_6;
        goto LABEL_5;
      }
    }
    else if ((v8 & 0x20) == 0)
    {
      goto LABEL_4;
    }
    objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("rgC"));
    if ((v8 & 0x40) != 0)
LABEL_5:
      objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("adU"));
  }
LABEL_6:
  if (a4 - a3 < 1)
    goto LABEL_30;
  v11 = (char *)(a3 + 1);
  v12 = *a3;
  if (*a3 < 0)
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("ue"));
    if ((v12 & 0x40) == 0)
    {
LABEL_9:
      if ((v12 & 8) == 0)
        goto LABEL_11;
      goto LABEL_10;
    }
  }
  else if ((*a3 & 0x40) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("uw"));
  if ((v12 & 8) != 0)
LABEL_10:
    objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("ds"));
LABEL_11:
  v13 = MEMORY[0x1E0C9AAB0];
  if ((v12 & 0x20) != 0)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("wl"));
  if ((v12 & 4) != 0)
    v14 = v13;
  else
    v14 = MEMORY[0x1E0C9AAA0];
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, CFSTR("wp"));
  v15 = a4 - v11;
  if ((v12 & 0x10) != 0 && v15 >= 3)
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", a3 + 1, 3);
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v16, CFSTR("at"));

    v11 = (char *)(a3 + 4);
    v15 = a4 - (a3 + 4);
  }
  if ((v12 & 2) != 0 && v15 >= 1)
  {
    v17 = *v11++;
    v24 = v17;
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &v24, 1);
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v18, CFSTR("hsi"));

    v15 = a4 - v11;
  }
  if ((v12 & 1) == 0 || v15 < 1)
    goto LABEL_30;
  v19 = *v11;
  if (*v11 < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 2048);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v21, CFSTR("df"));

    if ((v19 & 1) == 0)
    {
LABEL_26:
      if ((v19 & 2) == 0)
        goto LABEL_27;
      goto LABEL_39;
    }
  }
  else if ((v19 & 1) == 0)
  {
    goto LABEL_26;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v22, CFSTR("camS"));

  if ((v19 & 2) == 0)
  {
LABEL_27:
    if ((v19 & 4) == 0)
      goto LABEL_28;
LABEL_40:
    objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("iLagS"));
    if ((v19 & 8) == 0)
      goto LABEL_30;
    goto LABEL_29;
  }
LABEL_39:
  objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("enD"));
  if ((v19 & 4) != 0)
    goto LABEL_40;
LABEL_28:
  if ((v19 & 8) != 0)
  {
LABEL_29:
    v23 = (v19 >> 4) & 7;
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &v23, 1);
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v20, CFSTR("ars"));

  }
LABEL_30:

}

- (void)_nearbyParseManufacturerData:(id)a3 fields:(id)a4
{
  id v6;
  id v7;
  _BYTE *v8;
  uint64_t v9;
  _BYTE *v11;
  unsigned __int8 *v12;
  uint64_t v13;
  int v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v15 = objc_retainAutorelease(v6);
  v8 = (_BYTE *)objc_msgSend(v15, "bytes");
  v9 = objc_msgSend(v15, "length");
  if (v9 >= 2 && *v8 == 76 && !v8[1] && (unint64_t)v9 >= 4)
  {
    v11 = &v8[v9];
    v12 = v8 + 2;
    do
    {
      v13 = v12[1] & 0x1F;
      if (v11 - (v12 + 2) < v13)
        break;
      v14 = *v12;
      v12 += v13 + 2;
      if (v14 == 16)
      {
        -[SFBLEScanner _nearbyParseNearbyInfoPtr:end:fields:](self, "_nearbyParseNearbyInfoPtr:end:fields:");
      }
      else if (v14 == 15)
      {
        -[SFBLEScanner _nearbyParseNearbyActionPtr:end:fields:](self, "_nearbyParseNearbyActionPtr:end:fields:");
      }
    }
    while (v11 - v12 > 1);
  }

}

- (void)nearby:(id)a3 didStartScanningForType:(int64_t)a4
{
  NSObject *dispatchQueue;
  WPNearby *v7;
  WPNearby *wpNearby;
  BOOL v9;
  int var0;
  void (**scanStateChangedHandler)(id, uint64_t);

  dispatchQueue = self->_dispatchQueue;
  v7 = (WPNearby *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  wpNearby = self->_wpNearby;

  if (wpNearby)
    v9 = wpNearby == v7;
  else
    v9 = 0;
  if (v9 && self->_wpNearbyType == a4)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 20 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    if (self->_scanState != 1)
    {
      self->_scanState = 1;
      scanStateChangedHandler = (void (**)(id, uint64_t))self->_scanStateChangedHandler;
      if (scanStateChangedHandler)
        scanStateChangedHandler[2](scanStateChangedHandler, 1);
    }
    -[SFBLEScanner _startTimeoutIfNeeded](self, "_startTimeoutIfNeeded");
  }
}

- (void)_startTimeoutIfNeeded
{
  int var0;
  OS_dispatch_source *v4;
  OS_dispatch_source *timeoutTimer;
  NSObject *v6;
  unint64_t v7;
  dispatch_time_t v8;
  NSObject *v9;
  _QWORD handler[5];

  if (!self->_timeoutFired && self->_timeout > 0.0 && !self->_timeoutTimer)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 20 && (var0 != -1 || _LogCategory_Initialize()))
      goto LABEL_6;
    while (1)
    {
      v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
      timeoutTimer = self->_timeoutTimer;
      self->_timeoutTimer = v4;

      v6 = self->_timeoutTimer;
      if (v6)
        break;
      FatalErrorF();
LABEL_6:
      LogPrintF();
    }
    v7 = (unint64_t)(self->_timeout * 1000000000.0);
    v8 = dispatch_time(0, v7);
    dispatch_source_set_timer(v6, v8, v7, v7 >> 2);
    v9 = self->_timeoutTimer;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __37__SFBLEScanner__startTimeoutIfNeeded__block_invoke;
    handler[3] = &unk_1E482DF78;
    handler[4] = self;
    dispatch_source_set_event_handler(v9, handler);
    dispatch_resume((dispatch_object_t)self->_timeoutTimer);
  }
}

uint64_t __39__SFBLEScanner_activateWithCompletion___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 9) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_activateWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)setDispatchQueue:(id)a3
{
  OS_dispatch_queue *v4;
  OS_dispatch_queue *dispatchQueue;
  SFBLEScanner *obj;

  v4 = (OS_dispatch_queue *)a3;
  obj = self;
  objc_sync_enter(obj);
  if (obj->_activateCalled)
  {
    FatalErrorF();
    __break(1u);
  }
  else
  {
    dispatchQueue = obj->_dispatchQueue;
    obj->_dispatchQueue = v4;

    objc_sync_exit(obj);
  }
}

- (void)activateWithCompletion:(id)a3
{
  id v4;
  SFBLEScanner *v5;
  NSObject *dispatchQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v5->_activateCalled = 1;
  dispatchQueue = v5->_dispatchQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __39__SFBLEScanner_activateWithCompletion___block_invoke;
  v8[3] = &unk_1E482DFC8;
  v8[4] = v5;
  v9 = v4;
  v7 = v4;
  dispatch_async(dispatchQueue, v8);

  objc_sync_exit(v5);
}

uint64_t __26__SFBLEScanner_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__SFBLEScanner_invalidate__block_invoke;
  block[3] = &unk_1E482DF78;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)dealloc
{
  id bluetoothStateChangedHandler;
  NSMutableDictionary *devices;
  NSArray *deviceFilter;
  id deviceFoundHandler;
  id deviceLostHandler;
  id deviceChangedHandler;
  OS_dispatch_queue *dispatchQueue;
  id invalidationHandler;
  NSData *payloadFilterData;
  NSData *payloadFilterMask;
  id scanStateChangedHandler;
  id timeoutHandler;
  LogCategory *ucat;
  SFBLEScanner *v16;
  SEL v17;
  objc_super v18;

  if (self->_btSession)
  {
    FatalErrorF();
    goto LABEL_15;
  }
  if (self->_centralManager)
  {
LABEL_15:
    FatalErrorF();
    goto LABEL_16;
  }
  if (self->_rescanTimer)
  {
LABEL_16:
    FatalErrorF();
    goto LABEL_17;
  }
  if (self->_startRetrier)
  {
LABEL_17:
    FatalErrorF();
    goto LABEL_18;
  }
  if (self->_wpAirDrop)
  {
LABEL_18:
    FatalErrorF();
    goto LABEL_19;
  }
  if (self->_wpNearby)
  {
LABEL_19:
    FatalErrorF();
    goto LABEL_20;
  }
  if (self->_wpPairing)
  {
LABEL_20:
    v16 = (SFBLEScanner *)FatalErrorF();
    -[SFBLEScanner _rssiLogClose](v16, v17);
    return;
  }
  -[SFBLEScanner _rssiLogClose](self, "_rssiLogClose");
  bluetoothStateChangedHandler = self->_bluetoothStateChangedHandler;
  self->_bluetoothStateChangedHandler = 0;

  devices = self->_devices;
  self->_devices = 0;

  deviceFilter = self->_deviceFilter;
  self->_deviceFilter = 0;

  deviceFoundHandler = self->_deviceFoundHandler;
  self->_deviceFoundHandler = 0;

  deviceLostHandler = self->_deviceLostHandler;
  self->_deviceLostHandler = 0;

  deviceChangedHandler = self->_deviceChangedHandler;
  self->_deviceChangedHandler = 0;

  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue)
  {
    self->_dispatchQueue = 0;

  }
  invalidationHandler = self->_invalidationHandler;
  self->_invalidationHandler = 0;

  payloadFilterData = self->_payloadFilterData;
  self->_payloadFilterData = 0;

  payloadFilterMask = self->_payloadFilterMask;
  self->_payloadFilterMask = 0;

  scanStateChangedHandler = self->_scanStateChangedHandler;
  self->_scanStateChangedHandler = 0;

  timeoutHandler = self->_timeoutHandler;
  self->_timeoutHandler = 0;

  ucat = self->_ucat;
  if (ucat)
  {
    if ((ucat->var3 & 0x40000) != 0)
    {
      LogCategory_Remove();
      self->_ucat = 0;
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)SFBLEScanner;
  -[SFBLEScanner dealloc](&v18, sel_dealloc);
}

- (void)_rssiLogClose
{
  int var0;

  if (self->_rssiEventLogFile)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 50 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    FPrintF();
    FPrintF();
    fclose(self->_rssiEventLogFile);
    self->_rssiEventLogFile = 0;
  }
}

- (void)_invalidate
{
  int var0;
  NSMutableDictionary *devices;
  OS_dispatch_source *lostTimer;
  NSObject *v6;
  OS_dispatch_source *v7;
  OS_dispatch_source *rescanTimer;
  NSObject *v9;
  OS_dispatch_source *v10;
  OS_dispatch_source *timeoutTimer;
  NSObject *v12;
  OS_dispatch_source *v13;
  CURetrier *startRetrier;
  int64_t payloadType;
  void *centralManager;
  void *v17;
  void *v18;
  WPNearby *wpNearby;
  uint64_t v20;
  void *v21;
  int v22;
  void (**invalidationHandler)(void);
  id bluetoothStateChangedHandler;
  id deviceFoundHandler;
  id deviceLostHandler;
  id deviceChangedHandler;
  id v28;
  id scanStateChangedHandler;
  id timeoutHandler;
  int v31;
  int64_t v32;
  const char *v33;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled)
    return;
  var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  self->_invalidateCalled = 1;
  devices = self->_devices;
  self->_devices = 0;

  lostTimer = self->_lostTimer;
  if (lostTimer)
  {
    v6 = lostTimer;
    dispatch_source_cancel(v6);
    v7 = self->_lostTimer;
    self->_lostTimer = 0;

  }
  rescanTimer = self->_rescanTimer;
  if (rescanTimer)
  {
    v9 = rescanTimer;
    dispatch_source_cancel(v9);
    v10 = self->_rescanTimer;
    self->_rescanTimer = 0;

  }
  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    v12 = timeoutTimer;
    dispatch_source_cancel(v12);
    v13 = self->_timeoutTimer;
    self->_timeoutTimer = 0;

  }
  -[CURetrier invalidateDirect](self->_startRetrier, "invalidateDirect");
  startRetrier = self->_startRetrier;
  self->_startRetrier = 0;

  payloadType = self->_payloadType;
  if (payloadType > 14)
  {
    switch(payloadType)
    {
      case 15:
        -[SFBLEScanner _updateTrackedPeers](self, "_updateTrackedPeers");
        wpNearby = self->_wpNearby;
        v20 = 0;
        break;
      case 16:
        -[SFBLEScanner _updateTrackedPeers](self, "_updateTrackedPeers");
        wpNearby = self->_wpNearby;
        v20 = 1;
        break;
      case 17:
LABEL_22:
        -[CBCentralManager stopScan](self->_centralManager, "stopScan");
        centralManager = self->_centralManager;
        self->_centralManager = 0;
LABEL_31:

        goto LABEL_32;
      default:
        goto LABEL_39;
    }
    -[WPNearby stopScanningForType:](wpNearby, "stopScanningForType:", v20);
    centralManager = self->_wpNearby;
    if (centralManager)
    {
      +[SFBLEClient sharedClient](SFBLEClient, "sharedClient");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "removeNearbyDelegate:", self);

      centralManager = self->_wpNearby;
    }
    self->_wpNearby = 0;
    goto LABEL_31;
  }
  switch(payloadType)
  {
    case -1:
      goto LABEL_22;
    case 5:
      -[WPAWDL stopConnectionlessAWDLServiceScanning](self->_wpAirDrop, "stopConnectionlessAWDLServiceScanning");
      centralManager = self->_wpAirDrop;
      if (centralManager)
      {
        +[SFBLEClient sharedClient](SFBLEClient, "sharedClient");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "removeAirDropDelegate:", self);

        centralManager = self->_wpAirDrop;
      }
      self->_wpAirDrop = 0;
      goto LABEL_31;
    case 7:
      -[WPPairing stopProximityPairingServiceScanning](self->_wpPairing, "stopProximityPairingServiceScanning");
      centralManager = self->_wpPairing;
      if (centralManager)
      {
        +[SFBLEClient sharedClient](SFBLEClient, "sharedClient");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "removePairingDelegate:", self);

        centralManager = self->_wpPairing;
      }
      self->_wpPairing = 0;
      goto LABEL_31;
  }
LABEL_39:
  v31 = self->_ucat->var0;
  if (v31 > 60)
    goto LABEL_32;
  if (v31 != -1)
    goto LABEL_41;
  if (_LogCategory_Initialize())
  {
    payloadType = self->_payloadType;
LABEL_41:
    v32 = payloadType;
    v33 = SFBLEPayloadTypeToString(payloadType);
    LogPrintF();
  }
LABEL_32:
  self->_scanStarted = 0;
  -[SFBLEScanner _btSessionEnsureStopped](self, "_btSessionEnsureStopped", v32, v33);
  v22 = self->_ucat->var0;
  if (v22 <= 30 && (v22 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  invalidationHandler = (void (**)(void))self->_invalidationHandler;
  if (invalidationHandler)
    invalidationHandler[2]();
  -[SFBLEScanner _rssiLogClose](self, "_rssiLogClose");
  bluetoothStateChangedHandler = self->_bluetoothStateChangedHandler;
  self->_bluetoothStateChangedHandler = 0;

  deviceFoundHandler = self->_deviceFoundHandler;
  self->_deviceFoundHandler = 0;

  deviceLostHandler = self->_deviceLostHandler;
  self->_deviceLostHandler = 0;

  deviceChangedHandler = self->_deviceChangedHandler;
  self->_deviceChangedHandler = 0;

  v28 = self->_invalidationHandler;
  self->_invalidationHandler = 0;

  scanStateChangedHandler = self->_scanStateChangedHandler;
  self->_scanStateChangedHandler = 0;

  timeoutHandler = self->_timeoutHandler;
  self->_timeoutHandler = 0;

}

- (void)_btSessionEnsureStopped
{
  BTSessionImpl **p_btSession;
  int var0;

  p_btSession = &self->_btSession;
  if (self->_btSession)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    ((void (*)(uint64_t))softLinkBTSessionDetachWithQueue[0])((uint64_t)p_btSession);
    *p_btSession = 0;
  }
  self->_btStarted = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_useCases, 0);
  objc_storeStrong((id *)&self->_trackedPeers, 0);
  objc_storeStrong(&self->_timeoutHandler, 0);
  objc_storeStrong(&self->_scanStateChangedHandler, 0);
  objc_storeStrong((id *)&self->_recorder, 0);
  objc_storeStrong((id *)&self->_payloadFilterMask, 0);
  objc_storeStrong((id *)&self->_payloadFilterData, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_deviceChangedHandler, 0);
  objc_storeStrong(&self->_deviceLostHandler, 0);
  objc_storeStrong(&self->_deviceFoundHandler, 0);
  objc_storeStrong((id *)&self->_deviceFilter, 0);
  objc_storeStrong(&self->_bluetoothStateChangedHandler, 0);
  objc_storeStrong((id *)&self->_wpPairing, 0);
  objc_storeStrong((id *)&self->_wpNearby, 0);
  objc_storeStrong((id *)&self->_wpAirDrop, 0);
  objc_storeStrong((id *)&self->_scanUseCases, 0);
  objc_storeStrong((id *)&self->_scanParamPeers, 0);
  objc_storeStrong((id *)&self->_scanParamFilterMask, 0);
  objc_storeStrong((id *)&self->_scanParamFilterData, 0);
  objc_storeStrong((id *)&self->_trackedPeersApplied, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_startRetrier, 0);
  objc_storeStrong((id *)&self->_rescanTimer, 0);
  objc_storeStrong((id *)&self->_lostTimer, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_centralManager, 0);
}

- (NSString)description
{
  unint64_t v3;
  const char *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  int64_t scanRate;
  const char *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSData *payloadFilterData;
  id v19;
  NSUInteger rescanSecondsActual;
  id v21;
  NSUInteger changeFlags;
  id *v23;
  id v24;
  id v25;
  const char *v27;
  uint64_t v28;
  NSUInteger v29;
  NSUInteger v30;
  void *v31;
  const char *v32;
  id v33;
  _QWORD v34[6];
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;

  v41 = 0;
  v3 = self->_payloadType + 1;
  if (v3 > 0x12)
    v4 = "?";
  else
    v4 = off_1E4831390[v3];
  v32 = v4;
  NSAppendPrintF();
  v5 = v41;
  v6 = v5;
  if (self->_invalidateCalled)
  {
    v40 = v5;
    NSAppendPrintF();
    v7 = v40;

    v6 = v7;
  }
  if (self->_activeScan)
  {
    v39 = v6;
    NSAppendPrintF();
    v8 = v6;

    v6 = v8;
  }
  if (self->_needDups)
  {
    v38 = v6;
    NSAppendPrintF();
    v9 = v6;

    v6 = v9;
  }
  if (self->_rssiThreshold)
  {
    v37 = v6;
    NSAppendPrintF();
    v10 = v6;

    v6 = v10;
  }
  if (self->_scanCache)
  {
    v36 = v6;
    NSAppendPrintF();
    v11 = v6;

    v6 = v11;
  }
  v35 = v6;
  scanRate = self->_scanRate;
  if (scanRate > 19)
  {
    if (scanRate > 39)
    {
      if (scanRate == 40)
      {
        v13 = "High";
        goto LABEL_31;
      }
      if (scanRate == 50)
      {
        v13 = "Aggressive";
        goto LABEL_31;
      }
    }
    else
    {
      if (scanRate == 20)
      {
        v13 = "Normal";
        goto LABEL_31;
      }
      if (scanRate == 30)
      {
        v13 = "HighNormal";
        goto LABEL_31;
      }
    }
LABEL_30:
    v13 = "?";
  }
  else
  {
    v13 = "Invalid";
    switch(scanRate)
    {
      case 0:
        break;
      case 1:
        v13 = "BackgroundOld";
        break;
      case 2:
        v13 = "NormalOld";
        break;
      case 3:
        v13 = "HighOld";
        break;
      case 4:
        v13 = "AggressiveOld";
        break;
      case 10:
        v13 = "Background";
        break;
      default:
        goto LABEL_30;
    }
  }
LABEL_31:
  v27 = v13;
  NSAppendPrintF();
  v14 = v35;

  v34[5] = v14;
  v28 = -[NSMutableDictionary count](self->_devices, "count", v27, v32);
  NSAppendPrintF();
  v15 = v14;

  v34[4] = v15;
  v29 = -[NSArray count](self->_deviceFilter, "count", v28);
  NSAppendPrintF();
  v16 = v15;

  v34[3] = v16;
  v30 = -[NSSet count](self->_trackedPeers, "count", v29);
  NSAppendPrintF();
  v17 = v16;

  payloadFilterData = self->_payloadFilterData;
  if (!payloadFilterData)
  {
    if (!self->_payloadFilterMask)
      goto LABEL_35;
    payloadFilterData = (NSData *)&stru_1E483B8E8;
  }
  v34[2] = v17;
  v30 = (NSUInteger)payloadFilterData;
  NSAppendPrintF();
  v19 = v17;

  v17 = v19;
LABEL_35:
  rescanSecondsActual = self->_rescanSecondsActual;
  if ((int)rescanSecondsActual >= 1)
  {
    v34[1] = v17;
    v30 = rescanSecondsActual;
    NSAppendPrintF();
    v21 = v17;

    v17 = v21;
  }
  changeFlags = self->_changeFlags;
  if ((_DWORD)changeFlags)
  {
    if ((_DWORD)changeFlags == -1)
    {
      v34[0] = v17;
      v23 = (id *)v34;
    }
    else
    {
      v33 = v17;
      v30 = changeFlags;
      v23 = &v33;
    }
    NSAppendPrintF();
    v24 = *v23;

    v17 = v24;
  }
  if (!self->_useCases)
  {
    -[SFBLEScanner _useCasesToString:](self, "_useCasesToString:", 0, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    NSAppendPrintF();
    v25 = v17;

    v17 = v25;
  }
  return (NSString *)v17;
}

- (void)setDeviceFilter:(id)a3
{
  id v4;
  int var0;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    v8 = v4;
    LogPrintF();
  }
  v6 = (void *)objc_msgSend(v4, "copy", v8);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __32__SFBLEScanner_setDeviceFilter___block_invoke;
  v9[3] = &unk_1E482D3A0;
  v9[4] = self;
  v10 = v6;
  v7 = v6;
  -[SFBLEScanner _invokeBlockActivateSafe:](self, "_invokeBlockActivateSafe:", v9);

}

void __32__SFBLEScanner_setDeviceFilter___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 272), *(id *)(a1 + 40));
}

- (void)setPayloadFilterData:(id)a3 mask:(id)a4
{
  id v6;
  id v7;
  int var0;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    goto LABEL_3;
  while (1)
  {
    v9 = objc_msgSend(v6, "length", v14, v15);
    if (v9 == objc_msgSend(v7, "length"))
      break;
    v6 = (id)objc_msgSend(v6, "length");
    objc_msgSend(v7, "length");
    FatalErrorF();
LABEL_3:
    v14 = v6;
    v15 = v7;
    LogPrintF();
  }
  v10 = (void *)objc_msgSend(v6, "copy");
  v11 = (void *)objc_msgSend(v7, "copy");
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __42__SFBLEScanner_setPayloadFilterData_mask___block_invoke;
  v16[3] = &unk_1E482EBA0;
  v16[4] = self;
  v17 = v10;
  v18 = v11;
  v12 = v11;
  v13 = v10;
  -[SFBLEScanner _invokeBlockActivateSafe:](self, "_invokeBlockActivateSafe:", v16);

}

void __42__SFBLEScanner_setPayloadFilterData_mask___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 320), *(id *)(a1 + 40));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 328), *(id *)(a1 + 48));
}

- (void)setScanCache:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __29__SFBLEScanner_setScanCache___block_invoke;
  v3[3] = &unk_1E482E4B8;
  v4 = a3;
  v3[4] = self;
  -[SFBLEScanner _invokeBlockActivateSafe:](self, "_invokeBlockActivateSafe:", v3);
}

uint64_t __29__SFBLEScanner_setScanCache___block_invoke(uint64_t result)
{
  int v1;
  uint64_t v2;

  v1 = *(unsigned __int8 *)(result + 40);
  v2 = *(_QWORD *)(result + 32);
  if (v1 != *(unsigned __int8 *)(v2 + 258))
  {
    *(_BYTE *)(v2 + 258) = v1;
    *(_BYTE *)(*(_QWORD *)(result + 32) + 104) = 0;
  }
  return result;
}

- (void)setScanRate:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __28__SFBLEScanner_setScanRate___block_invoke;
  v3[3] = &unk_1E482E018;
  v3[4] = self;
  v3[5] = a3;
  -[SFBLEScanner _invokeBlockActivateSafe:](self, "_invokeBlockActivateSafe:", v3);
}

uint64_t __28__SFBLEScanner_setScanRate___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 376) = *(_QWORD *)(result + 40);
  return result;
}

- (void)setTimeout:(double)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __27__SFBLEScanner_setTimeout___block_invoke;
  v3[3] = &unk_1E482E018;
  v3[4] = self;
  *(double *)&v3[5] = a3;
  -[SFBLEScanner _invokeBlockActivateSafe:](self, "_invokeBlockActivateSafe:", v3);
}

double __27__SFBLEScanner_setTimeout___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  double result;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 128);
  if (v2)
  {
    v3 = v2;
    dispatch_source_cancel(v3);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 128);
    *(_QWORD *)(v4 + 128) = 0;

  }
  result = *(double *)(a1 + 40);
  *(double *)(*(_QWORD *)(a1 + 32) + 408) = result;
  return result;
}

- (void)setTrackedPeers:(id)a3
{
  id v4;
  int var0;
  void *v6;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    v8 = v4;
    LogPrintF();
  }
  v6 = (void *)objc_msgSend(v4, "copy", v8);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __32__SFBLEScanner_setTrackedPeers___block_invoke;
  v9[3] = &unk_1E482D3A0;
  v9[4] = self;
  v10 = v6;
  v7 = v6;
  -[SFBLEScanner _invokeBlockActivateSafe:](self, "_invokeBlockActivateSafe:", v9);

}

void __32__SFBLEScanner_setTrackedPeers___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 424), *(id *)(a1 + 40));
}

_BYTE *__41__SFBLEScanner__invokeBlockActivateSafe___block_invoke(uint64_t a1)
{
  _BYTE *result;

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  result = *(_BYTE **)(a1 + 32);
  if (!result[152])
    return (_BYTE *)objc_msgSend(result, "_restartIfNeeded");
  return result;
}

- (void)_poweredOff
{
  int v3;
  int var0;

  IOPMConnectionGetSystemCapabilities();
  v3 = IOPMIsASleep();
  self->_poweredOffSleep = v3;
  if (v3)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
  else
  {
    -[SFBLEScanner _removeAllDevicesWithReason:](self, "_removeAllDevicesWithReason:", CFSTR("BTPowerOff"));
  }
}

- (void)_poweredOn
{
  int var0;
  CFAbsoluteTime Current;
  NSMutableDictionary *devices;
  _QWORD v6[5];

  if (self->_poweredOffSleep)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    self->_poweredOffSleep = 0;
    Current = CFAbsoluteTimeGetCurrent();
    devices = self->_devices;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __26__SFBLEScanner__poweredOn__block_invoke;
    v6[3] = &__block_descriptor_40_e36_v32__0__NSUUID_8__SFBLEDevice_16_B24l;
    *(CFAbsoluteTime *)&v6[4] = Current;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](devices, "enumerateKeysAndObjectsUsingBlock:", v6);
  }
  -[SFBLEScanner _restartIfNeeded](self, "_restartIfNeeded");
}

uint64_t __26__SFBLEScanner__poweredOn__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setLastSeen:", *(double *)(a1 + 32));
}

- (void)_removeAllDevicesWithReason:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int var0;
  void (**deviceLostHandler)(id, void *);
  uint64_t v13;
  int v14;
  id v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  self->_scanStarted = 0;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = self->_devices;
  v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v18;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v5);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v9), v15, v16, (_QWORD)v17);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        var0 = self->_ucat->var0;
        if (var0 <= 20 && (var0 != -1 || _LogCategory_Initialize()))
        {
          v15 = v4;
          v16 = v10;
          LogPrintF();
        }
        deviceLostHandler = (void (**)(id, void *))self->_deviceLostHandler;
        if (deviceLostHandler)
          deviceLostHandler[2](deviceLostHandler, v10);

        ++v9;
      }
      while (v7 != v9);
      v13 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v7 = v13;
    }
    while (v13);
  }

  -[NSMutableDictionary removeAllObjects](self->_devices, "removeAllObjects");
  self->_activeScan = 0;
  self->_needDups = 0;
  v14 = self->_ucat->var0;
  if (v14 <= 30 && (v14 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  -[SFBLEScanner _updateRescanTimer](self, "_updateRescanTimer", v15, v16);

}

- (void)_rescanTimerFired
{
  int var0;
  int v4;
  int activeScan;
  int v6;
  _BOOL4 v7;
  const char *v8;
  const char *v9;
  OS_dispatch_source *v10;
  OS_dispatch_source *lostTimer;
  NSObject *v12;
  int v13;
  uint64_t v14;
  const char *v15;
  const char *v16;
  _QWORD handler[5];

  var0 = self->_ucat->var0;
  if (self->_poweredOffSleep)
  {
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    return;
  }
  if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize()))
  {
    v14 = -[NSMutableDictionary count](self->_devices, "count");
    LogPrintF();
  }
  v4 = -[SFBLEScanner _needActiveScan](self, "_needActiveScan", v14);
  activeScan = self->_activeScan;
  if (activeScan != v4)
  {
    v6 = self->_ucat->var0;
    if (v6 <= 30)
    {
      if (v6 != -1)
      {
        v7 = self->_activeScan;
LABEL_15:
        v8 = "yes";
        if (v7)
          v9 = "yes";
        else
          v9 = "no";
        if (!v4)
          v8 = "no";
        v15 = v9;
        v16 = v8;
        LogPrintF();
        goto LABEL_22;
      }
      if (_LogCategory_Initialize())
      {
        v7 = self->_activeScan;
        goto LABEL_15;
      }
    }
LABEL_22:
    self->_activeScan = v4;
  }
  if (!-[NSMutableDictionary count](self->_devices, "count", v15, v16))
  {
    if (self->_needDups)
    {
      self->_needDups = 0;
      v13 = self->_ucat->var0;
      if (v13 <= 30 && (v13 != -1 || _LogCategory_Initialize()))
        LogPrintF();
    }
    else if (activeScan == v4)
    {
      return;
    }
  }
  if (!self->_lostTimer)
  {
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_devices, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_33);
    v10 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    lostTimer = self->_lostTimer;
    self->_lostTimer = v10;

    v12 = self->_lostTimer;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __33__SFBLEScanner__rescanTimerFired__block_invoke_2;
    handler[3] = &unk_1E482DF78;
    handler[4] = self;
    dispatch_source_set_event_handler(v12, handler);
    CUDispatchTimerSet();
    dispatch_activate((dispatch_object_t)self->_lostTimer);
  }
  -[SFBLEScanner _restartIfNeeded:](self, "_restartIfNeeded:", 1);
}

uint64_t __33__SFBLEScanner__rescanTimerFired__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setLastSeen:", 0.0);
}

uint64_t __33__SFBLEScanner__rescanTimerFired__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_rescanLostFired");
}

- (void)_rescanLostFired
{
  OS_dispatch_source *lostTimer;
  NSObject *v4;
  OS_dispatch_source *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  double v13;
  int var0;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  lostTimer = self->_lostTimer;
  if (lostTimer)
  {
    v4 = lostTimer;
    dispatch_source_cancel(v4);
    v5 = self->_lostTimer;
    self->_lostTimer = 0;

  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[NSMutableDictionary allKeys](self->_devices, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v10);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v11, v18);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "lastSeen");
        if (v13 == 0.0)
        {
          var0 = self->_ucat->var0;
          if (var0 <= 8 && (var0 != -1 || _LogCategory_Initialize()))
          {
            v18 = v12;
            LogPrintF();
          }
          v15 = _Block_copy(self->_deviceLostHandler);
          v16 = v15;
          if (v15)
            (*((void (**)(void *, void *))v15 + 2))(v15, v12);

          -[NSMutableDictionary removeObjectForKey:](self->_devices, "removeObjectForKey:", v11);
        }

        ++v10;
      }
      while (v8 != v10);
      v17 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      v8 = v17;
    }
    while (v17);
  }

}

- (void)_rssiLogOpen
{
  int var0;
  FILE *v4;
  int v5;
  int v6;
  char __filename[1024];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  bzero(__filename, 0x400uLL);
  SNPrintF();
  NormalizePath();
  if (mkpath() && (!*__error() || *__error()))
  {
    var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }
  SNPrintF();
  __strlcat_chk();
  v4 = fopen(__filename, "a");
  self->_rssiEventLogFile = v4;
  if (v4)
  {
    setlinebuf(v4);
    v5 = self->_ucat->var0;
    if (v5 <= 50 && (v5 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    FPrintF();
    FPrintF();
    FPrintF();
    FPrintF();
  }
  else
  {
    v6 = self->_ucat->var0;
    if (v6 <= 90 && (v6 != -1 || _LogCategory_Initialize()))
    {
      __error();
      LogPrintF();
    }
  }
}

uint64_t __37__SFBLEScanner__startTimeoutIfNeeded__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_timeoutTimerFired");
}

- (void)_timeoutTimerFired
{
  int var0;
  OS_dispatch_source *timeoutTimer;
  NSObject *v5;
  OS_dispatch_source *v6;
  void (**timeoutHandler)(void);

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  var0 = self->_ucat->var0;
  if (var0 <= 20 && (var0 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  self->_timeoutFired = 1;
  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    v5 = timeoutTimer;
    dispatch_source_cancel(v5);
    v6 = self->_timeoutTimer;
    self->_timeoutTimer = 0;

  }
  timeoutHandler = (void (**)(void))self->_timeoutHandler;
  if (timeoutHandler)
  {
    timeoutHandler[2]();
    timeoutHandler = (void (**)(void))self->_timeoutHandler;
  }
  self->_timeoutHandler = 0;

}

uint64_t __34__SFBLEScanner__updateRescanTimer__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_rescanTimerFired");
}

- (void)centralManagerDidUpdateState:(id)a3
{
  CBCentralManager *centralManager;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;
  int var0;
  void (**bluetoothStateChangedHandler)(id, _QWORD);
  CBCentralManager *v10;

  v10 = (CBCentralManager *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  centralManager = self->_centralManager;
  if (centralManager)
    v5 = centralManager == v10;
  else
    v5 = 0;
  if (v5)
  {
    v6 = -[CBCentralManager state](v10, "state");
    if ((unint64_t)(v6 - 1) > 4)
      v7 = 0;
    else
      v7 = qword_1A2AF7B98[v6 - 1];
    var0 = self->_ucat->var0;
    if (var0 <= 40 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    switch(v7)
    {
      case 1:
        -[SFBLEScanner _removeAllDevicesWithReason:](self, "_removeAllDevicesWithReason:", CFSTR("BTReset"));
        break;
      case 2:
        -[SFBLEScanner _poweredOff](self, "_poweredOff");
        break;
      case 3:
        -[SFBLEScanner _poweredOn](self, "_poweredOn");
        break;
    }
    bluetoothStateChangedHandler = (void (**)(id, _QWORD))self->_bluetoothStateChangedHandler;
    if (bluetoothStateChangedHandler)
      bluetoothStateChangedHandler[2](bluetoothStateChangedHandler, v7);
  }

}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  id v10;
  id v11;
  NSObject *dispatchQueue;
  CBCentralManager *v13;
  CBCentralManager *centralManager;
  void *v15;
  id v16;

  v16 = a4;
  v10 = a5;
  v11 = a6;
  dispatchQueue = self->_dispatchQueue;
  v13 = (CBCentralManager *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  centralManager = self->_centralManager;

  if (centralManager && centralManager == v13)
  {
    objc_msgSend(v16, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      -[SFBLEScanner _recordDevice:data:rssi:info:](self, "_recordDevice:data:rssi:info:", v15, 0, v11, v10);
      -[SFBLEScanner foundPeripheralDevice:advertisementData:RSSI:](self, "foundPeripheralDevice:advertisementData:RSSI:", v16, v10, v11);
    }

  }
}

- (void)foundPeripheralDevice:(id)a3 advertisementData:(id)a4 RSSI:(id)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  int var0;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  id v29;

  v29 = a4;
  v8 = a5;
  objc_msgSend(a3, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    getCBAdvertisementDataChannel[0]();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, CFSTR("ch"));
    getCBAdvertisementDataDeviceAddress[0]();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v14, "length") == 6)
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v14, CFSTR("bdAddr"));
    getCBAdvertisementDataManufacturerDataKey[0]();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "objectForKeyedSubscript:", v15);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    if (!v16)
      v16 = objc_alloc_init(MEMORY[0x1E0C99D50]);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_23;
    if (self->_payloadType == 17)
    {
      v27 = v12;
      v28 = v8;
      getCBAdvertisementDataServiceDataKey[0]();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "objectForKeyedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C97778], "UUIDWithString:", CFSTR("FE25"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20)
      {
        if (!-[SFBLEScanner _watchSetupParseData:fields:](self, "_watchSetupParseData:fields:", v20, v10))
        {

          v12 = v27;
          v8 = v28;
LABEL_23:

          goto LABEL_24;
        }
        v21 = v16;
        v16 = v20;
      }
      else
      {
        getCBAdvertisementDataLocalNameKey[0]();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "objectForKeyedSubscript:", v22);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v21, CFSTR("name"));
          -[SFBLEScanner _watchSetupParseName:fields:](self, "_watchSetupParseName:fields:", v21, v10);
        }
      }

      v12 = v27;
      v8 = v28;
    }
    v23 = objc_msgSend(v8, "integerValue");
    getCBAdvertisementDataSaturated[0]();
    if (CFDictionaryGetInt64())
    {
      var0 = self->_ucat->var0;
      if (var0 <= 20 && (var0 != -1 || _LogCategory_Initialize()))
      {
        v25 = v23;
        v26 = v9;
        LogPrintF();
      }
      v23 = 127;
    }
    -[SFBLEScanner _foundDevice:advertisementData:rssi:fields:](self, "_foundDevice:advertisementData:rssi:fields:", v9, v16, v23, v10, v25, v26);
    goto LABEL_23;
  }
LABEL_24:

}

- (void)_watchSetupParseName:(id)a3 fields:(id)a4
{
  id v5;
  void *v6;
  unsigned __int8 v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v5 = a4;
  if ((unint64_t)objc_msgSend(v17, "length") < 8)
  {
    v6 = 0;
    goto LABEL_22;
  }
  objc_msgSend(v17, "substringWithRange:", 0, 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, CFSTR("wi"));
  v7 = objc_msgSend(v17, "characterAtIndex:", 5);
  v8 = MEMORY[0x1E0C80978];
  if (v7 > 0x7Fu)
  {
    if (!__maskrune(v7, 0x500uLL))
      goto LABEL_10;
  }
  else if ((*(_DWORD *)(MEMORY[0x1E0C80978] + 4 * v7 + 60) & 0x500) == 0)
  {
    goto LABEL_10;
  }
  v9 = memchr("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890", (char)v7, 0x3FuLL);
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9 - "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("wv"));

  }
LABEL_10:
  v11 = objc_msgSend(v17, "characterAtIndex:", 6);
  if (v11 > 0x7Fu)
  {
    if (!__maskrune(v11, 0x500uLL))
      goto LABEL_16;
  }
  else if ((*(_DWORD *)(v8 + 4 * v11 + 60) & 0x500) == 0)
  {
    goto LABEL_16;
  }
  v12 = memchr("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890", (char)v11, 0x3FuLL);
  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12 - "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, CFSTR("wm"));

  }
LABEL_16:
  v14 = objc_msgSend(v17, "characterAtIndex:", 7);
  if (v14 > 0x7Fu)
  {
    if (!__maskrune(v14, 0x500uLL))
      goto LABEL_22;
  }
  else if ((*(_DWORD *)(v8 + 4 * v14 + 60) & 0x500) == 0)
  {
    goto LABEL_22;
  }
  v15 = memchr("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890", (char)v14, 0x3FuLL);
  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v15 - "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v16, CFSTR("ws"));

  }
LABEL_22:

}

- (BOOL)_watchSetupParseData:(id)a3 fields:(id)a4
{
  id v5;
  id v6;
  id v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v5 = a3;
  v6 = a4;
  if ((unint64_t)objc_msgSend(v5, "length") >= 0xD
    && (v7 = objc_retainAutorelease(v5), *(_BYTE *)objc_msgSend(v7, "bytes") == 6))
  {
    v8 = 1;
    objc_msgSend(v7, "subdataWithRange:", 1, 4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(objc_alloc(getWatchSetupAdvertisementIdentifierClass()), "initWithPackedIdentifierData:", v9);
    objc_msgSend(v10, "humanReadableName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("name"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v10, "advertisingIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("wi"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", objc_msgSend(v10, "deviceSize"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v13, CFSTR("ws"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", objc_msgSend(v10, "enclosureMaterial"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, CFSTR("wm"));

    objc_msgSend(v7, "subdataWithRange:", 5, 7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(objc_alloc(getWatchSetupAdvertisementIdentifierClass()), "initWithPackedIdentifierData:", v15);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", objc_msgSend(v16, "pairingVersion"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v17, CFSTR("wpv"));

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_btSessionUsable
{
  return 1;
}

- (int)_btSessionEnsureStarted
{
  int var0;
  SFBLEScanner *v4;
  int v5;
  int v6;
  int v7;
  int v8;
  void (*v10)(uint64_t, int, uint64_t, void *);

  if (self->_btStarted)
    return 0;
  var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    LogPrintF();
  v10 = _btSessionEventHandler;
  v4 = self;
  v5 = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, void *))softLinkBTSessionAttachWithQueue[0])((uint64_t)self->_ucat->var4, (uint64_t)&v10, (uint64_t)v4, v4->_dispatchQueue);
  if (v5)
  {
    v6 = v5;
    CFRelease(v4);
    v7 = v6 + 310000;
    if (v6 != -310000)
    {
      v8 = self->_ucat->var0;
      if (v8 <= 60 && (v8 != -1 || _LogCategory_Initialize()))
        LogPrintF();
    }
  }
  else
  {
    v7 = 0;
    self->_btStarted = 1;
  }
  return v7;
}

- (void)awdlDidUpdateState:(id)a3
{
  WPAWDL *wpAirDrop;
  BOOL v5;
  uint64_t v6;
  int var0;
  void (**bluetoothStateChangedHandler)(id, uint64_t);
  WPAWDL *v9;

  v9 = (WPAWDL *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  wpAirDrop = self->_wpAirDrop;
  if (wpAirDrop)
    v5 = wpAirDrop == v9;
  else
    v5 = 0;
  if (v5)
  {
    v6 = -[WPAWDL state](v9, "state");
    var0 = self->_ucat->var0;
    if (var0 <= 40 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    switch(v6)
    {
      case 1:
        -[SFBLEScanner _removeAllDevicesWithReason:](self, "_removeAllDevicesWithReason:", CFSTR("BTReset"));
        break;
      case 2:
        -[SFBLEScanner _poweredOff](self, "_poweredOff");
        break;
      case 3:
        -[SFBLEScanner _poweredOn](self, "_poweredOn");
        break;
    }
    bluetoothStateChangedHandler = (void (**)(id, uint64_t))self->_bluetoothStateChangedHandler;
    if (bluetoothStateChangedHandler)
      bluetoothStateChangedHandler[2](bluetoothStateChangedHandler, v6);
  }

}

- (void)awdlStartedScanning:(id)a3
{
  NSObject *dispatchQueue;
  WPAWDL *v5;
  WPAWDL *wpAirDrop;
  BOOL v7;
  int var0;
  void (**scanStateChangedHandler)(id, uint64_t);

  dispatchQueue = self->_dispatchQueue;
  v5 = (WPAWDL *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  wpAirDrop = self->_wpAirDrop;

  if (wpAirDrop)
    v7 = wpAirDrop == v5;
  else
    v7 = 0;
  if (v7)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 20 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    if (self->_scanState != 1)
    {
      self->_scanState = 1;
      scanStateChangedHandler = (void (**)(id, uint64_t))self->_scanStateChangedHandler;
      if (scanStateChangedHandler)
        scanStateChangedHandler[2](scanStateChangedHandler, 1);
    }
    -[SFBLEScanner _startTimeoutIfNeeded](self, "_startTimeoutIfNeeded");
  }
}

- (void)awdl:(id)a3 failedToStartScanningWithError:(id)a4
{
  NSObject *dispatchQueue;
  WPAWDL *v7;
  WPAWDL *wpAirDrop;
  BOOL v9;
  int var0;
  id v11;
  id v12;

  v12 = a4;
  dispatchQueue = self->_dispatchQueue;
  v7 = (WPAWDL *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  wpAirDrop = self->_wpAirDrop;

  if (wpAirDrop)
    v9 = wpAirDrop == v7;
  else
    v9 = 0;
  if (v9)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
    {
      v11 = v12;
      LogPrintF();
    }
    self->_scanStarted = 0;
    -[CURetrier failedDirect](self->_startRetrier, "failedDirect", v11);
  }

}

- (void)awdl:(id)a3 foundDevice:(id)a4 rssi:(id)a5
{
  id v8;
  NSObject *dispatchQueue;
  WPAWDL *v10;
  WPAWDL *wpAirDrop;
  id v12;

  v12 = a4;
  v8 = a5;
  dispatchQueue = self->_dispatchQueue;
  v10 = (WPAWDL *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  wpAirDrop = self->_wpAirDrop;

  if (wpAirDrop && wpAirDrop == v10)
  {
    -[SFBLEScanner _recordDevice:data:rssi:info:](self, "_recordDevice:data:rssi:info:", 0, v12, v8, 0);
    -[SFBLEScanner foundAWDLDevice:rssi:](self, "foundAWDLDevice:rssi:", v12, v8);
  }

}

- (void)foundAWDLDevice:(id)a3 rssi:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v13 = 0;
  v14 = 0;
  if (objc_msgSend(v6, "length") == 10)
  {
    v8 = objc_retainAutorelease(v6);
    v9 = objc_msgSend(v8, "bytes");
    LODWORD(v13) = 0;
    WORD2(v13) = 0;
    HIBYTE(v13) = *(_BYTE *)(v9 + 1);
    BYTE1(v14) = *(_BYTE *)(v9 + 2);
    v10 = *(_DWORD *)(v9 + 3);
    HIWORD(v14) = *(_WORD *)(v9 + 7);
    *(_DWORD *)((char *)&v14 + 2) = v10;
    BYTE6(v13) = 16;
    LOBYTE(v14) = 0x80;
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", &v13);
    if (v11)
    {
      v12 = (void *)v11;
      -[SFBLEScanner _foundDevice:advertisementData:rssi:fields:](self, "_foundDevice:advertisementData:rssi:fields:", v11, v8, objc_msgSend(v7, "integerValue"), 0);

    }
  }

}

- (void)nearbyDidUpdateState:(id)a3
{
  WPNearby *wpNearby;
  BOOL v5;
  uint64_t v6;
  int var0;
  void (**bluetoothStateChangedHandler)(id, uint64_t);
  WPNearby *v9;

  v9 = (WPNearby *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  wpNearby = self->_wpNearby;
  if (wpNearby)
    v5 = wpNearby == v9;
  else
    v5 = 0;
  if (v5)
  {
    v6 = -[WPNearby state](v9, "state");
    var0 = self->_ucat->var0;
    if (var0 <= 40 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    switch(v6)
    {
      case 1:
        -[SFBLEScanner _removeAllDevicesWithReason:](self, "_removeAllDevicesWithReason:", CFSTR("BTReset"));
        break;
      case 2:
        -[SFBLEScanner _poweredOff](self, "_poweredOff");
        break;
      case 3:
        -[SFBLEScanner _poweredOn](self, "_poweredOn");
        break;
    }
    bluetoothStateChangedHandler = (void (**)(id, uint64_t))self->_bluetoothStateChangedHandler;
    if (bluetoothStateChangedHandler)
      bluetoothStateChangedHandler[2](bluetoothStateChangedHandler, v6);
  }

}

- (void)nearby:(id)a3 didFailToStartScanningForType:(int64_t)a4 WithError:(id)a5
{
  NSObject *dispatchQueue;
  WPNearby *v9;
  WPNearby *wpNearby;
  BOOL v11;
  int var0;
  id v13;
  id v14;

  v14 = a5;
  dispatchQueue = self->_dispatchQueue;
  v9 = (WPNearby *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  wpNearby = self->_wpNearby;

  if (wpNearby)
    v11 = wpNearby == v9;
  else
    v11 = 0;
  if (v11 && self->_wpNearbyType == a4)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
    {
      v13 = v14;
      LogPrintF();
    }
    self->_scanStarted = 0;
    -[CURetrier failedDirect](self->_startRetrier, "failedDirect", v13);
  }

}

- (void)nearby:(id)a3 didLosePeer:(id)a4 type:(int64_t)a5
{
  NSObject *dispatchQueue;
  WPNearby *v9;
  WPNearby *wpNearby;
  BOOL v11;
  void *v12;
  int var0;
  void (**deviceLostHandler)(id, void *);
  int v15;
  id v16;
  id v17;

  v17 = a4;
  dispatchQueue = self->_dispatchQueue;
  v9 = (WPNearby *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  wpNearby = self->_wpNearby;

  if (wpNearby)
    v11 = wpNearby == v9;
  else
    v11 = 0;
  if (!v11 || self->_wpNearbyType != a5)
  {
LABEL_22:
    v12 = 0;
    goto LABEL_25;
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  var0 = self->_ucat->var0;
  if (!v12)
  {
    if (var0 <= 8 && (var0 != -1 || _LogCategory_Initialize()))
    {
      v16 = v17;
      LogPrintF();
    }
    goto LABEL_22;
  }
  if (var0 <= 8 && (var0 != -1 || _LogCategory_Initialize()))
  {
    v16 = v12;
    LogPrintF();
  }
  deviceLostHandler = (void (**)(id, void *))self->_deviceLostHandler;
  if (deviceLostHandler)
    deviceLostHandler[2](deviceLostHandler, v12);
  -[NSMutableDictionary removeObjectForKey:](self->_devices, "removeObjectForKey:", v17, v16);
  if (!-[SFBLEScanner _needDups](self, "_needDups"))
  {
    v15 = self->_ucat->var0;
    if (v15 <= 30 && (v15 != -1 || _LogCategory_Initialize()))
    {
      v16 = v12;
      LogPrintF();
    }
    self->_needDups = 0;
    -[SFBLEScanner _restartIfNeeded](self, "_restartIfNeeded", v16);
  }
LABEL_25:
  -[SFBLEScanner _updateRescanTimer](self, "_updateRescanTimer", v16);

}

- (void)_nearbyParseNearbyActionPtr:(const char *)a3 end:(const char *)a4 fields:(id)a5
{
  uint64_t v7;
  unsigned int v8;
  void *v9;
  unsigned int v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  unsigned int v17;
  void *v18;
  unsigned int v19;
  void *v20;
  int64_t v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  unsigned int v29;
  const char *v30;
  unsigned int v31;
  void *v32;
  void *v33;
  const __CFString *v34;
  BOOL v35;
  id v36;

  v36 = a5;
  if (a4 - a3 < 1)
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    v8 = *(unsigned __int8 *)a3++;
    v7 = v8;
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setObject:forKeyedSubscript:", v9, CFSTR("af1"));

      if ((v7 & 0x20) != 0)
        objc_msgSend(v36, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("nk"));
      if ((v7 & 0x40) != 0)
        objc_msgSend(v36, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("ns"));
    }
  }
  if (a4 - a3 < 1)
  {
    v10 = 0;
    if ((v7 & 0x80) == 0)
      goto LABEL_16;
    goto LABEL_14;
  }
  v11 = *(unsigned __int8 *)a3++;
  v10 = v11;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setObject:forKeyedSubscript:", v12, CFSTR("dt"));

  if (v11 == 50)
    objc_msgSend(v36, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("na"));
  if ((v7 & 0x80) != 0)
  {
LABEL_14:
    if (a4 - a3 >= 3)
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", a3, 3);
      objc_msgSend(v36, "setObject:forKeyedSubscript:", v13, CFSTR("at"));

      a3 += 3;
    }
  }
LABEL_16:
  if ((v10 <= 0x24 && ((1 << v10) & 0x1200480A00) != 0 || v10 == 84) && a4 - a3 >= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)a3 >> 5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setObject:forKeyedSubscript:", v14, CFSTR("cl"));

    v15 = *a3++;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v15 & 0x1F);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setObject:forKeyedSubscript:", v16, CFSTR("md"));

  }
  if ((v10 - 33 <= 0x33 && ((1 << (v10 - 33)) & 0x8000000000009) != 0 || v10 - 9 < 3)
    && a4 - a3 >= 1)
  {
    v17 = *(unsigned __int8 *)a3++;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setObject:forKeyedSubscript:", v18, CFSTR("cc"));

  }
  if (v10 <= 0x2B && ((1 << v10) & 0x80100000242) != 0 || v10 == 84)
  {
    if (a4 - a3 <= 0)
    {
      v24 = v10 == 10;
      goto LABEL_43;
    }
  }
  else
  {
    v21 = a4 - a3;
    v35 = v10 == 33 || v10 == 11;
    if (!v35 || v21 <= 0)
      goto LABEL_30;
  }
  v19 = *(unsigned __int8 *)a3++;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setObject:forKeyedSubscript:", v20, CFSTR("ov"));

  v21 = a4 - a3;
LABEL_30:
  if (v10 == 8 && v21 >= 9)
  {
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", a3, 9);
    objc_msgSend(v36, "setObject:forKeyedSubscript:", v22, CFSTR("ach"));
    a3 += 9;

    v21 = a4 - a3;
  }
  if (v10 == 8 && v21 >= 3)
  {
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", a3, 3);
    objc_msgSend(v36, "setObject:forKeyedSubscript:", v23, CFSTR("ssidH"));
    a3 += 3;
LABEL_46:

    goto LABEL_47;
  }
  v24 = v10 == 10;
  if (v10 == 10 && v21 >= 1)
  {
    v25 = *(unsigned __int8 *)a3++;
    v26 = ((v25 << 11) | (2 * v25)) & 0x2000E | (((v25 >> 4) & 1) << 18) | (16 * ((v25 >> 3) & 1)) & 0xFFFEFFFF | (((v25 >> 5) & 1) << 16);
    if ((v25 & 0x80u) == 0)
      v27 = v26;
    else
      v27 = v26 | 0x400000;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setObject:forKeyedSubscript:", v28, CFSTR("pf"));

    v24 = 1;
  }
LABEL_43:
  if (v24 && a4 - a3 >= 1)
  {
    v29 = *(unsigned __int8 *)a3++;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v29);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setObject:forKeyedSubscript:", v23, CFSTR("ov"));
    goto LABEL_46;
  }
LABEL_47:
  if (v10 == 51 || v10 == 9)
  {
    if (a4 - a3 >= 1)
    {
      v31 = *(unsigned __int8 *)a3;
      v30 = a3 + 1;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setObject:forKeyedSubscript:", v32, CFSTR("af2"));

      if ((v31 & 4) != 0 && a4 - v30 >= 3)
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v30, 3);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = CFSTR("tatag");
LABEL_56:
        objc_msgSend(v36, "setObject:forKeyedSubscript:", v33, v34);

      }
    }
  }
  else if (v10 == 1 && a4 - a3 >= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)a3);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = CFSTR("md");
    goto LABEL_56;
  }

}

- (void)pairingDidUpdateState:(id)a3
{
  WPPairing *wpPairing;
  BOOL v5;
  uint64_t v6;
  int var0;
  void (**bluetoothStateChangedHandler)(id, uint64_t);
  WPPairing *v9;

  v9 = (WPPairing *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  wpPairing = self->_wpPairing;
  if (wpPairing)
    v5 = wpPairing == v9;
  else
    v5 = 0;
  if (v5)
  {
    v6 = -[WPPairing state](v9, "state");
    var0 = self->_ucat->var0;
    if (var0 <= 40 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    switch(v6)
    {
      case 1:
        -[SFBLEScanner _removeAllDevicesWithReason:](self, "_removeAllDevicesWithReason:", CFSTR("BTReset"));
        break;
      case 2:
        -[SFBLEScanner _poweredOff](self, "_poweredOff");
        break;
      case 3:
        -[SFBLEScanner _poweredOn](self, "_poweredOn");
        break;
    }
    bluetoothStateChangedHandler = (void (**)(id, uint64_t))self->_bluetoothStateChangedHandler;
    if (bluetoothStateChangedHandler)
      bluetoothStateChangedHandler[2](bluetoothStateChangedHandler, v6);
  }

}

- (void)pairingStartedScanning:(id)a3
{
  NSObject *dispatchQueue;
  WPPairing *v5;
  WPPairing *wpPairing;
  BOOL v7;
  int var0;
  void (**scanStateChangedHandler)(id, uint64_t);

  dispatchQueue = self->_dispatchQueue;
  v5 = (WPPairing *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  wpPairing = self->_wpPairing;

  if (wpPairing)
    v7 = wpPairing == v5;
  else
    v7 = 0;
  if (v7)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 20 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
    if (self->_scanState != 1)
    {
      self->_scanState = 1;
      scanStateChangedHandler = (void (**)(id, uint64_t))self->_scanStateChangedHandler;
      if (scanStateChangedHandler)
        scanStateChangedHandler[2](scanStateChangedHandler, 1);
    }
    -[SFBLEScanner _startTimeoutIfNeeded](self, "_startTimeoutIfNeeded");
  }
}

- (void)pairing:(id)a3 failedToStartScanningWithError:(id)a4
{
  NSObject *dispatchQueue;
  WPPairing *v7;
  WPPairing *wpPairing;
  BOOL v9;
  int var0;
  id v11;
  id v12;

  v12 = a4;
  dispatchQueue = self->_dispatchQueue;
  v7 = (WPPairing *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  wpPairing = self->_wpPairing;

  if (wpPairing)
    v9 = wpPairing == v7;
  else
    v9 = 0;
  if (v9)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
    {
      v11 = v12;
      LogPrintF();
    }
    self->_scanStarted = 0;
    -[CURetrier failedDirect](self->_startRetrier, "failedDirect", v11);
  }

}

- (void)pairing:(id)a3 foundDevice:(id)a4 payload:(id)a5 rssi:(id)a6 peerInfo:(id)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *dispatchQueue;
  WPPairing *v16;
  WPPairing *wpPairing;
  int var0;
  id v19;
  id v20;
  id v21;

  v21 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  dispatchQueue = self->_dispatchQueue;
  v16 = (WPPairing *)a3;
  dispatch_assert_queue_V2(dispatchQueue);
  wpPairing = self->_wpPairing;

  if (wpPairing && wpPairing == v16)
  {
    var0 = self->_ucat->var0;
    if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize()))
    {
      v19 = v21;
      v20 = v14;
      LogPrintF();
    }
    -[SFBLEScanner _recordDevice:data:rssi:info:](self, "_recordDevice:data:rssi:info:", v21, v12, v13, v14, v19, v20);
    -[SFBLEScanner foundPairingDevice:payload:rssi:peerInfo:withTimeInMachContSeconds:](self, "foundPairingDevice:payload:rssi:peerInfo:withTimeInMachContSeconds:", v21, v12, v13, v14, (double)clock_gettime_nsec_np(_CLOCK_MONOTONIC_RAW) / 1000000000.0);
  }

}

- (void)foundPairingDevice:(id)a3 payload:(id)a4 rssi:(id)a5 peerInfo:(id)a6 withTimeInMachContSeconds:(double)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  int var0;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v21 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFBLEScanner pairingParsePayload:identifier:bleDevice:peerInfo:](self, "pairingParsePayload:identifier:bleDevice:peerInfo:", v12, v21, v15, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v18, CFSTR("sampleTimestamp"));

    getWPPairingKeyAdvertisingChannel[0]();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "objectForKeyedSubscript:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v20, CFSTR("ch"));
    -[SFBLEScanner _foundDevice:advertisementData:rssi:fields:](self, "_foundDevice:advertisementData:rssi:fields:", v21, v12, objc_msgSend(v13, "integerValue"), v16);

  }
  else
  {
    var0 = self->_ucat->var0;
    if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize()))
      LogPrintF();
  }

}

- (id)pairingParsePayload:(id)a3 identifier:(id)a4 bleDevice:(id)a5 peerInfo:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  SFHeadphoneProduct *v29;
  unint64_t v30;
  int v31;
  unsigned __int8 *v32;
  int v33;
  uint64_t v34;
  SFHeadphoneProduct *v35;
  SFHeadphoneProduct *v36;
  id v37;
  char v38;
  unsigned int v39;
  id v40;
  unsigned __int8 *v41;
  char *v42;
  char *v43;
  char *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  unint64_t v50;
  void *v51;
  unint64_t v52;
  void *v53;
  unint64_t v54;
  id v55;
  const __CFString *v56;
  void *v57;
  void *v58;
  void *v59;
  unsigned int v60;
  char v61;
  SFBatteryInfo *v62;
  SFBatteryInfo *v63;
  unsigned int v64;
  uint64_t v65;
  void *v66;
  void *v67;
  SFBLEScanner *v68;
  char v69;
  uint64_t v70;
  uint64_t v71;
  char v72;
  uint64_t v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  const __CFString *v80;
  void *v81;
  void *v82;
  void *v83;
  unsigned int v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t Int64;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  int var0;
  uint64_t v95;
  uint64_t v96;
  int v97;
  unint64_t v98;
  SFHeadphoneProduct *v99;
  unsigned int v100;
  SFHeadphoneProduct *v101;
  int v102;
  int v103;
  int v104;
  char v105;
  void *v106;
  void *v107;
  _BOOL4 v108;
  void *v109;
  int v110;
  double v111;
  double v112;
  char v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  void *v117;
  void *v118;
  const __CFString *v119;
  unsigned int v120;
  double v121;
  unsigned int v122;
  double v123;
  uint64_t v124;
  unsigned int v125;
  uint64_t v126;
  unsigned int v127;
  double v128;
  uint64_t v129;
  SFHeadphoneProduct *v130;
  int v131;
  int v132;
  uint64_t v133;
  void *v134;
  uint64_t v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  const __CFString *v140;
  void *v141;
  SFHeadphoneProduct *v142;
  void *v143;
  const __CFString *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  uint64_t v152;
  uint64_t v153;
  SFBatteryInfo *v154;
  SFBatteryInfo *v155;
  double v156;
  SFBatteryInfo *v157;
  double v158;
  SFBatteryInfo *v159;
  double v160;
  uint64_t v161;
  SFBatteryInfo *v162;
  double v163;
  uint64_t v164;
  unsigned int v165;
  uint64_t v166;
  void *v167;
  void *v168;
  int v169;
  void *v170;
  SFHeadphoneProduct *v171;
  uint64_t v172;
  void *v173;
  const __CFString *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  id v182;
  int v183;
  double v184;
  uint64_t v185;
  double v186;
  int v187;
  uint64_t v188;
  int v189;
  uint64_t v190;
  double v191;
  SFBatteryInfo *v192;
  SFBatteryInfo *v193;
  double v194;
  SFBatteryInfo *v195;
  SFBatteryInfo *v196;
  double v197;
  uint64_t v198;
  SFBatteryInfo *v199;
  SFBatteryInfo *v200;
  double v201;
  uint64_t v202;
  uint64_t v203;
  int v204;
  uint64_t v205;
  SFBLEScanner *v206;
  int v207;
  double v208;
  uint64_t v209;
  unint64_t v210;
  unsigned int v211;
  uint64_t v212;
  unsigned int v213;
  uint64_t v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  SFHeadphoneProduct *v222;
  _BOOL4 v223;
  void *v224;
  void *v225;
  void *v226;
  SFHeadphoneProduct *v227;
  SFHeadphoneProduct *v228;
  void *v229;
  SFHeadphoneProduct *v230;
  int v231;
  void *v232;
  const __CFString *v233;
  SFHeadphoneProduct *v234;
  int v235;
  int v236;
  void *v237;
  void *v238;
  void *v239;
  const __CFString *v240;
  void *v241;
  uint64_t v242;
  void *v243;
  void *v244;
  char v245;
  void *v246;
  void *v247;
  id v248;
  void *v249;
  uint64_t v250;
  SFBatteryInfo *v251;
  SFBatteryInfo *v252;
  double v253;
  void *v254;
  SFBatteryInfo *v255;
  double v256;
  SFBatteryInfo *v257;
  double v258;
  uint64_t v259;
  SFBatteryInfo *v260;
  double v261;
  uint64_t v262;
  void *v263;
  uint64_t v264;
  uint64_t v265;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  uint64_t v270;
  id v271;
  id v273;
  unsigned __int8 v274;
  char v275;
  unsigned int v276;
  uint64_t v277;
  unsigned int v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  unsigned int v283;
  uint64_t v284;
  int v285;
  unsigned int v286;
  uint64_t v287;
  int v288;
  unsigned int v289;
  char v290;
  unsigned __int8 *v291;
  char v292;
  char v293;
  id v294;
  id v295;
  unsigned int v296;
  unsigned int v297;
  unsigned int v298;
  char v299;
  unint64_t v300;
  unint64_t v301;
  unint64_t v302;
  unsigned int v303;
  SFBLEScanner *v304;
  SFBLEScanner *v305;
  unsigned __int8 *v306;
  unsigned __int16 v307;
  unsigned int v308;
  int v309;
  char v310;
  void *v311;
  SFHeadphoneProduct *v312;
  void *v313;
  __int16 v314;
  int v315;
  __int16 v316;
  int v317;
  __int16 v318;
  _QWORD v319[3];

  v319[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = objc_retainAutorelease(a3);
  v14 = objc_msgSend(v13, "bytes");
  v15 = objc_msgSend(v13, "length");

  v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if ((uint64_t)v15 >= 7)
  {
    v313 = v11;
    v311 = v12;
    v17 = *(unsigned __int8 *)(v14 + 4);
    v18 = *(unsigned __int16 *)(v14 + 5);
    v19 = 1;
    if ((v18 - 8194) > 0xD || ((1 << (v18 - 2)) & 0x3001) == 0)
    {
      v35 = -[SFHeadphoneProduct initWithProductID:]([SFHeadphoneProduct alloc], "initWithProductID:", v18);
      -[SFHeadphoneProduct isAirPods](v35, "isAirPods");

      if ((_DWORD)v18 != 8203)
      {
        v36 = -[SFHeadphoneProduct initWithProductID:]([SFHeadphoneProduct alloc], "initWithProductID:", v18);
        v19 = -[SFHeadphoneProduct hasSplitBattery](v36, "hasSplitBattery");

      }
    }
    v309 = v19;
    v21 = v18;
    v312 = -[SFHeadphoneProduct initWithProductID:]([SFHeadphoneProduct alloc], "initWithProductID:", v18);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v17);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v22, CFSTR("subType"));

    if (!(_DWORD)v17 && v15 == 14)
    {
      v23 = v14 + 8;
      v24 = -[SFBLEScanner statusToHeadsetStatus:forProductID:](self, "statusToHeadsetStatus:forProductID:", *(unsigned __int8 *)(v14 + 7), v18);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v25, CFSTR("hsStatus"));

      -[SFBLEScanner modelWithProductID:](self, "modelWithProductID:", v18);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v26, CFSTR("model"));

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v18);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v27, CFSTR("pid"));

      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v23, 6);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v28, CFSTR("publicAddress"));

      objc_msgSend(v16, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("ns"));
      v12 = v311;
      v29 = v312;
LABEL_369:
      v37 = v16;
      goto LABEL_370;
    }
    v30 = v14 + v15;
    v306 = (unsigned __int8 *)(v14 + 7);
    switch((int)v17)
    {
      case 0:
      case 7:
        v304 = self;
        if ((_DWORD)v17)
        {
          if (v15 < 0xD)
            goto LABEL_373;
          v306 = 0;
          v283 = *(unsigned __int8 *)(v14 + 7);
          v31 = *(unsigned __int8 *)(v14 + 8);
          v285 = *(unsigned __int8 *)(v14 + 9);
          v288 = *(unsigned __int8 *)(v14 + 10);
          v32 = (unsigned __int8 *)(v14 + 12);
          v296 = *(unsigned __int8 *)(v14 + 11);
          if ((_DWORD)v17 == 7)
          {
            v291 = (unsigned __int8 *)(v14 + 12);
            v33 = 0;
            v34 = 0;
            goto LABEL_59;
          }
          v95 = 7;
        }
        else
        {
          if (v15 < 0x13)
            goto LABEL_373;
          v283 = *(unsigned __int8 *)(v14 + 13);
          v31 = *(unsigned __int8 *)(v14 + 14);
          v285 = *(unsigned __int8 *)(v14 + 15);
          v288 = *(unsigned __int8 *)(v14 + 16);
          v32 = (unsigned __int8 *)(v14 + 18);
          v95 = 13;
          v296 = *(unsigned __int8 *)(v14 + 17);
        }
        v96 = v14 + v95;
        v34 = *v32;
        v33 = 1;
        v291 = (unsigned __int8 *)(v96 + 6);
LABEL_59:
        v294 = v10;
        if ((_DWORD)v21 == 8203)
        {
          v97 = 1;
        }
        else
        {
          v98 = v30;
          v99 = -[SFHeadphoneProduct initWithProductID:]([SFHeadphoneProduct alloc], "initWithProductID:", v21);
          v97 = -[SFHeadphoneProduct hasSplitCaseColors](v99, "hasSplitCaseColors");

          v30 = v98;
        }
        v302 = v30;
        if ((v33 & v97) == 1)
        {
          if ((uint64_t)(v30 - (_QWORD)v291) < 1)
            v100 = 0;
          else
            v100 = *v291++;
          v114 = v34 >> 4;
          v115 = v100 >> 5;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v34 & 0xF);
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v116, CFSTR("cc"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v114);
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v117, CFSTR("ccR"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v115);
          v118 = (void *)objc_claimAutoreleasedReturnValue();
          v119 = CFSTR("ccC");
        }
        else
        {
          +[SFHeadphoneProduct airPodsMax](SFHeadphoneProduct, "airPodsMax");
          v101 = (SFHeadphoneProduct *)objc_claimAutoreleasedReturnValue();

          if (v312 == v101)
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v34 & 0x1F);
          else
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v34);
          v118 = (void *)objc_claimAutoreleasedReturnValue();
          v119 = CFSTR("cc");
        }
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v118, v119);

        v120 = -[SFBLEScanner statusToHeadsetStatus:forProductID:](v304, "statusToHeadsetStatus:forProductID:", v283, v21);
        v121 = 0.0;
        if (v31 == 255)
        {
          v281 = 0;
          v123 = 0.0;
        }
        else
        {
          v122 = v31 & 0x7F;
          if (v122 >= 0x64)
            v122 = 100;
          v123 = (double)v122 / 100.0;
          v124 = 1;
          if ((v31 & 0x80u) != 0)
            v124 = 2;
          v281 = v124;
        }
        if (v285 == 255)
        {
          v287 = 0;
        }
        else
        {
          v125 = v285 & 0x7F;
          if (v125 >= 0x64)
            v125 = 100;
          v121 = (double)v125 / 100.0;
          v126 = 1;
          if ((v285 & 0x80u) != 0)
            v126 = 2;
          v287 = v126;
        }
        if (v288 == 255)
        {
          v279 = 0;
          v128 = 0.0;
        }
        else
        {
          v127 = v288 & 0x7F;
          if (v127 >= 0x64)
            v127 = 100;
          v128 = (double)v127 / 100.0;
          v129 = 1;
          if ((v288 & 0x80u) != 0)
            v129 = 2;
          v279 = v129;
        }
        if ((v21 - 8194) < 0xE && ((0x3201u >> (v21 - 2)) & 1) != 0)
        {
          v131 = 1;
        }
        else
        {
          v130 = -[SFHeadphoneProduct initWithProductID:]([SFHeadphoneProduct alloc], "initWithProductID:", v21);
          v131 = -[SFHeadphoneProduct hasLid](v130, "hasLid");

        }
        if ((v296 & 0x80u) == 0)
          v132 = 1;
        else
          v132 = v131;
        if (v132)
          v133 = v120;
        else
          v133 = v120 | 0x400;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v133);
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v134, CFSTR("hsStatus"));

        if ((v131 & ((v296 & 8) >> 3)) != 0)
          v135 = MEMORY[0x1E0C9AAB0];
        else
          v135 = MEMORY[0x1E0C9AAA0];
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v135, CFSTR("lc"));
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v296 & 7);
        v136 = (void *)objc_claimAutoreleasedReturnValue();
        v290 = v133;
        if ((v133 & 0x100) != 0)
        {
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v136, CFSTR("locP"));

          v137 = v313;
          objc_msgSend(v313, "advertisementFields");
          v141 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("locS"));
          v139 = (void *)objc_claimAutoreleasedReturnValue();

          v10 = v294;
          if (!v139)
            goto LABEL_129;
          v140 = CFSTR("locS");
        }
        else
        {
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v136, CFSTR("locS"));

          v137 = v313;
          objc_msgSend(v313, "advertisementFields");
          v138 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v138, "objectForKeyedSubscript:", CFSTR("locP"));
          v139 = (void *)objc_claimAutoreleasedReturnValue();

          v10 = v294;
          if (!v139)
            goto LABEL_129;
          v140 = CFSTR("locP");
        }
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v139, v140);
LABEL_129:
        v11 = v137;

        LOBYTE(v317) = 0;
        LOBYTE(v315) = 0;
        -[SFBLEScanner parseStatus3:productID:caseLEDColor:caseLEDStatus:](v304, "parseStatus3:productID:caseLEDColor:caseLEDStatus:", v296, v21, &v317, &v315);
        +[SFHeadphoneProduct airPodsMax](SFHeadphoneProduct, "airPodsMax");
        v142 = (SFHeadphoneProduct *)objc_claimAutoreleasedReturnValue();

        v29 = v312;
        if (v312 == v142)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v283 & 0x1F);
          v143 = (void *)objc_claimAutoreleasedReturnValue();
          v144 = CFSTR("hbT");
          goto LABEL_134;
        }
        if ((_DWORD)v21 == 8207 || (_DWORD)v21 == 8194)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v296 >> 4) & 1);
          v143 = (void *)objc_claimAutoreleasedReturnValue();
          v144 = CFSTR("csVs");
LABEL_134:
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v143, v144);

        }
        if (-[SFHeadphoneProduct supportsDigitalEngraving](v312, "supportsDigitalEngraving")
          && (uint64_t)(v302 - (_QWORD)v291) >= 17)
        {
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v291, 17);
          v145 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v145, CFSTR("engravingData"));

        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v317);
        v146 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v146, CFSTR("csLC"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v315);
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v147, CFSTR("csLS"));

        -[SFBLEScanner modelWithProductID:](v304, "modelWithProductID:", v21);
        v148 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v148, CFSTR("model"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v21);
        v149 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v149, CFSTR("pid"));

        objc_msgSend(v16, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("ns"));
        if ((_DWORD)v17)
        {
          getWPPairingKeyDeviceAddress[0]();
          v150 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v311, "objectForKeyedSubscript:", v150);
          v151 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v151, CFSTR("publicAddress"));

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v306, 6);
          v150 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v150, CFSTR("publicAddress"));
        }
        v152 = v287;
        v153 = v281;

        v55 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        if (!v309)
        {
          v157 = objc_alloc_init(SFBatteryInfo);
          v155 = v157;
          v158 = 1.0;
          if (v123 <= 1.0)
            v158 = v123;
          if (v158 < 0.0001)
            v158 = 0.0001;
          -[SFBatteryInfo setBatteryLevel:](v157, "setBatteryLevel:", v158);
          -[SFBatteryInfo setBatteryState:](v155, "setBatteryState:", v281);
          -[SFBatteryInfo setBatteryType:](v155, "setBatteryType:", 4);
          v12 = v311;
          goto LABEL_173;
        }
        if (v279)
        {
          v154 = objc_alloc_init(SFBatteryInfo);
          v155 = v154;
          v156 = 1.0;
          if (v128 <= 1.0)
            v156 = v128;
          if (v156 < 0.0001)
            v156 = 0.0001;
          -[SFBatteryInfo setBatteryLevel:](v154, "setBatteryLevel:", v156);
          -[SFBatteryInfo setBatteryState:](v155, "setBatteryState:", v279);
          -[SFBatteryInfo setBatteryType:](v155, "setBatteryType:", 1);
          objc_msgSend(v55, "addObject:", v155);
          if (!(v281 | v287))
          {
            v290 = 0x80;
            v152 = 2;
            v153 = 2;
            v121 = 1.0;
            v123 = 1.0;
            v12 = v311;
            goto LABEL_156;
          }
        }
        else
        {
          v155 = 0;
        }
        v12 = v311;
        if (!v281)
        {
LABEL_164:
          if (!v152)
            goto LABEL_174;
          v162 = objc_alloc_init(SFBatteryInfo);

          v163 = 1.0;
          if (v121 <= 1.0)
            v163 = v121;
          if (v163 < 0.0001)
            v163 = 0.0001;
          -[SFBatteryInfo setBatteryLevel:](v162, "setBatteryLevel:", v163);
          -[SFBatteryInfo setBatteryState:](v162, "setBatteryState:", v152);
          if (v290 < 0)
            v164 = 3;
          else
            v164 = 2;
          -[SFBatteryInfo setBatteryType:](v162, "setBatteryType:", v164);
          v155 = v162;
LABEL_173:
          objc_msgSend(v55, "addObject:", v155);
LABEL_174:
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v55, CFSTR("batteryInfo"));

LABEL_175:
          goto LABEL_369;
        }
LABEL_156:
        v159 = objc_alloc_init(SFBatteryInfo);

        v160 = 1.0;
        if (v123 <= 1.0)
          v160 = v123;
        if (v160 < 0.0001)
          v160 = 0.0001;
        -[SFBatteryInfo setBatteryLevel:](v159, "setBatteryLevel:", v160);
        -[SFBatteryInfo setBatteryState:](v159, "setBatteryState:", v153);
        if (v290 < 0)
          v161 = 2;
        else
          v161 = 3;
        -[SFBatteryInfo setBatteryType:](v159, "setBatteryType:", v161);
        objc_msgSend(v55, "addObject:", v159);
        v155 = v159;
        goto LABEL_164;
      case 1:
        if (v15 < 0xA)
          goto LABEL_373;
        v38 = *(_BYTE *)(v14 + 7);
        v39 = *(unsigned __int8 *)(v14 + 8);
        v292 = *(_BYTE *)(v14 + 9);
        if (v15 == 26)
        {
          v40 = v10;
          v297 = 0;
          v278 = 0;
          v276 = 0;
          v286 = 0;
          v289 = 0;
          v41 = (unsigned __int8 *)(v14 + 10);
          v42 = (char *)(v14 + 11);
          v43 = (char *)(v14 + 12);
          v44 = (char *)(v14 + 13);
          v45 = v14 + 14;
          v277 = v14 + 17;
        }
        else
        {
          if (v15 < 0x17)
          {
LABEL_373:
            v37 = 0;
            v12 = v311;
            v29 = v312;
            goto LABEL_370;
          }
          v40 = v10;
          v297 = *(unsigned __int8 *)(v14 + 10);
          v278 = *(unsigned __int8 *)(v14 + 11);
          v41 = (unsigned __int8 *)(v14 + 13);
          v276 = *(unsigned __int8 *)(v14 + 12);
          v42 = (char *)(v14 + 14);
          v43 = (char *)(v14 + 15);
          v44 = (char *)(v14 + 16);
          v45 = v14 + 17;
          v277 = v14 + 20;
          v286 = *(unsigned __int8 *)(v14 + 23);
          v289 = *(unsigned __int8 *)(v14 + 24);
        }
        v102 = *v44;
        v103 = *v43;
        v104 = *v42;
        v303 = *v41;
        v275 = v38;
        v308 = -[SFBLEScanner statusToHeadsetStatus:forProductID:](self, "statusToHeadsetStatus:forProductID:");
        if (-[SFBLEScanner pairingUpdatePairedInfo:fields:bleDevice:](self, "pairingUpdatePairedInfo:fields:bleDevice:", v40, v16, v313))
        {
          if (v15 == 26 || !BluetoothProductIDSupportsOBCState(v21))
          {
            v274 = 0;
          }
          else
          {
            if ((v303 & 0x20) != 0)
              v105 = 2;
            else
              v105 = 1;
            v274 = v105;
          }
          v111 = 0.0;
          if (v104 == -1)
          {
            v284 = 0;
            v112 = 0.0;
          }
          else
          {
            v165 = v104 & 0x7F;
            if (v165 >= 0x64)
              v165 = 100;
            v112 = (double)v165 / 100.0;
            v166 = 1;
            if (v104 < 0)
              v166 = 2;
            v284 = v166;
          }
          if (v103 == -1)
          {
            v280 = 0;
          }
          else
          {
            v211 = v103 & 0x7F;
            if (v211 >= 0x64)
              v211 = 100;
            v111 = (double)v211 / 100.0;
            v212 = 1;
            if (v103 < 0)
              v212 = 2;
            v280 = v212;
          }
          v10 = v40;
          v206 = self;
          if (v102 == -1)
          {
            v282 = 0;
            v208 = 0.0;
          }
          else
          {
            v213 = v102 & 0x7F;
            if (v213 >= 0x64)
              v213 = 100;
            v208 = (double)v213 / 100.0;
            v214 = 1;
            if (v102 < 0)
              v214 = 2;
            v282 = v214;
          }
          v11 = v313;
          v210 = 0x1E0CB3000uLL;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", (v303 >> 2) & 3);
          v215 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v215, CFSTR("asCount"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v303 & 3);
          v216 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v216, CFSTR("aState"));

          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v277, 3);
          v217 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v217, CFSTR("lbic"));

          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v45, 3);
          v218 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v218, CFSTR("lch"));

          objc_msgSend(v16, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("paired"));
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v274);
          v219 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v219, CFSTR("obcState"));

        }
        else
        {
          v110 = v39 & 0xF;
          v111 = 0.0;
          if (v110 == 15)
          {
            v284 = 0;
            v112 = 0.0;
            v10 = v40;
            v11 = v313;
            v113 = v292;
          }
          else
          {
            if (v110 >= 0xA)
              v110 = 10;
            v112 = (double)v110 / 10.0;
            v113 = v292;
            v203 = 1;
            if ((v292 & 0x10) != 0)
              v203 = 2;
            v284 = v203;
            v10 = v40;
            v11 = v313;
          }
          v204 = v39 >> 4;
          if (v39 >> 4 == 15)
          {
            v280 = 0;
          }
          else
          {
            if (v204 >= 0xA)
              v204 = 10;
            v111 = (double)v204 / 10.0;
            v205 = 1;
            if ((v113 & 0x20) != 0)
              v205 = 2;
            v280 = v205;
          }
          v206 = self;
          v207 = v113 & 0xF;
          if (v207 == 15)
          {
            v282 = 0;
            v208 = 0.0;
          }
          else
          {
            if (v207 >= 0xA)
              v207 = 10;
            v208 = (double)v207 / 10.0;
            v209 = 1;
            if ((v113 & 0x40) != 0)
              v209 = 2;
            v282 = v209;
          }
          v210 = 0x1E0CB3000;
        }
        -[SFBLEScanner modelWithProductID:](v206, "modelWithProductID:", v21);
        v220 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v220, CFSTR("model"));

        objc_msgSend(*(id *)(v210 + 2024), "numberWithUnsignedShort:", v21);
        v221 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v221, CFSTR("pid"));

        if (v15 == 26)
          goto LABEL_323;
        LOBYTE(v317) = 0;
        LOBYTE(v315) = 0;
        -[SFBLEScanner parseStatus3:productID:caseLEDColor:caseLEDStatus:](v206, "parseStatus3:productID:caseLEDColor:caseLEDStatus:", v297, v21, &v317, &v315);
        if ((_DWORD)v21 == 8203
          || (v222 = -[SFHeadphoneProduct initWithProductID:]([SFHeadphoneProduct alloc], "initWithProductID:", v21), v223 = -[SFHeadphoneProduct hasSplitCaseColors](v222, "hasSplitCaseColors"), v222, v223))
        {
          objc_msgSend(*(id *)(v210 + 2024), "numberWithUnsignedChar:", v278 & 0xF);
          v224 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v224, CFSTR("cc"));

          objc_msgSend(*(id *)(v210 + 2024), "numberWithUnsignedChar:", v278 >> 4);
          v225 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v225, CFSTR("ccR"));

          objc_msgSend(*(id *)(v210 + 2024), "numberWithUnsignedChar:", v276 >> 5);
          v226 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v226, CFSTR("ccC"));
          v227 = v312;
        }
        else
        {
          +[SFHeadphoneProduct airPodsMax](SFHeadphoneProduct, "airPodsMax");
          v228 = (SFHeadphoneProduct *)objc_claimAutoreleasedReturnValue();

          v229 = *(void **)(v210 + 2024);
          v227 = v312;
          if (v312 == v228)
            objc_msgSend(v229, "numberWithInt:", v278 & 0x1F);
          else
            objc_msgSend(v229, "numberWithUnsignedChar:", v278);
          v226 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v226, CFSTR("cc"));
        }

        +[SFHeadphoneProduct airPodsMax](SFHeadphoneProduct, "airPodsMax");
        v230 = (SFHeadphoneProduct *)objc_claimAutoreleasedReturnValue();

        if (v227 == v230)
        {
          objc_msgSend(*(id *)(v210 + 2024), "numberWithInt:", v275 & 0x1F);
          v232 = (void *)objc_claimAutoreleasedReturnValue();
          v233 = CFSTR("hbT");
        }
        else
        {
          v231 = 1;
          if ((int)v21 > 8205)
          {
            if ((_DWORD)v21 == 8206)
              goto LABEL_308;
            if ((_DWORD)v21 != 8207)
              goto LABEL_306;
          }
          else if ((_DWORD)v21 != 8194)
          {
            if ((_DWORD)v21 == 8203)
              goto LABEL_308;
            goto LABEL_306;
          }
          objc_msgSend(*(id *)(v210 + 2024), "numberWithInt:", (v297 >> 4) & 1);
          v232 = (void *)objc_claimAutoreleasedReturnValue();
          v233 = CFSTR("csVs");
        }
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v232, v233);

        if ((v21 - 8194) >= 0xE || ((0x3201u >> (v21 - 2)) & 1) == 0)
        {
LABEL_306:
          v234 = -[SFHeadphoneProduct initWithProductID:]([SFHeadphoneProduct alloc], "initWithProductID:", v21);
          v231 = -[SFHeadphoneProduct hasLid](v234, "hasLid");

          goto LABEL_308;
        }
        v231 = 1;
LABEL_308:
        if ((v297 & 0x80u) == 0)
          v235 = 1;
        else
          v235 = v231;
        v236 = v308;
        if (!v235)
          v236 = v308 | 0x400;
        objc_msgSend(*(id *)(v210 + 2024), "numberWithInt:", v297 & 7);
        v237 = (void *)objc_claimAutoreleasedReturnValue();
        v308 = v236;
        if ((v236 & 0x100) != 0)
        {
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v237, CFSTR("locP"));

          objc_msgSend(v11, "advertisementFields");
          v241 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v241, "objectForKeyedSubscript:", CFSTR("locS"));
          v239 = (void *)objc_claimAutoreleasedReturnValue();

          if (v239)
          {
            v240 = CFSTR("locS");
            goto LABEL_318;
          }
        }
        else
        {
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v237, CFSTR("locS"));

          objc_msgSend(v11, "advertisementFields");
          v238 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v238, "objectForKeyedSubscript:", CFSTR("locP"));
          v239 = (void *)objc_claimAutoreleasedReturnValue();

          if (v239)
          {
            v240 = CFSTR("locP");
LABEL_318:
            objc_msgSend(v16, "setObject:forKeyedSubscript:", v239, v240);
          }
        }

        if ((v231 & ((v297 & 8) >> 3)) != 0)
          v242 = MEMORY[0x1E0C9AAB0];
        else
          v242 = MEMORY[0x1E0C9AAA0];
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v242, CFSTR("lc"));
        objc_msgSend(*(id *)(v210 + 2024), "numberWithUnsignedChar:", v317);
        v243 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v243, CFSTR("csLC"));

        objc_msgSend(*(id *)(v210 + 2024), "numberWithUnsignedChar:", v315);
        v244 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v244, CFSTR("csLS"));

LABEL_323:
        v245 = v308;
        objc_msgSend(*(id *)(v210 + 2024), "numberWithUnsignedInt:", v308);
        v246 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v246, CFSTR("hsStatus"));

        if (v292 < 0)
        {
          objc_msgSend(*(id *)(v210 + 2024), "numberWithUnsignedInt:", 2048);
          v247 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v247, CFSTR("df"));

        }
        v248 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v249 = v248;
        v250 = v284;
        if (!v309)
        {
          v254 = v248;
          if (v284)
          {
            v255 = objc_alloc_init(SFBatteryInfo);
            v252 = v255;
            v256 = 1.0;
            if (v112 <= 1.0)
              v256 = v112;
            if (v256 < 0.0001)
              v256 = 0.0001;
            -[SFBatteryInfo setBatteryLevel:](v255, "setBatteryLevel:", v256);
            -[SFBatteryInfo setBatteryState:](v252, "setBatteryState:", v284);
            -[SFBatteryInfo setBatteryType:](v252, "setBatteryType:", 4);
            v12 = v311;
            goto LABEL_358;
          }
          v252 = 0;
          v12 = v311;
LABEL_360:
          v263 = v254;
LABEL_361:
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v263, CFSTR("batteryInfo"));
          v264 = MEMORY[0x1E0C9AAA0];
          if ((v303 & 0x40) != 0)
            v265 = MEMORY[0x1E0C9AAB0];
          else
            v265 = MEMORY[0x1E0C9AAA0];
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v265, CFSTR("srConnected"));
          objc_msgSend(*(id *)(v210 + 2024), "numberWithInt:", v286 & 0xF);
          v266 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v266, CFSTR("srAudioRoutingScore1"));

          objc_msgSend(*(id *)(v210 + 2024), "numberWithInt:", v286 >> 4);
          v267 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v267, CFSTR("srAudioRoutingScore2"));

          objc_msgSend(*(id *)(v210 + 2024), "numberWithInt:", v289 & 3);
          v268 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v268, CFSTR("audioIdleTime"));

          objc_msgSend(*(id *)(v210 + 2024), "numberWithInt:", (v289 >> 2) & 3);
          v269 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v269, CFSTR("budsOutofCaseTime"));

          if ((v289 & 0x10) != 0)
            v270 = MEMORY[0x1E0C9AAB0];
          else
            v270 = v264;
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v270, CFSTR("primaryiCloudSignIn"));

LABEL_368:
          v29 = v312;
          goto LABEL_369;
        }
        if (v282)
        {
          v251 = objc_alloc_init(SFBatteryInfo);
          v252 = v251;
          v253 = 1.0;
          if (v208 <= 1.0)
            v253 = v208;
          if (v253 < 0.0001)
            v253 = 0.0001;
          -[SFBatteryInfo setBatteryLevel:](v251, "setBatteryLevel:", v253);
          -[SFBatteryInfo setBatteryState:](v252, "setBatteryState:", v282);
          -[SFBatteryInfo setBatteryType:](v252, "setBatteryType:", 1);
          v254 = v249;
          objc_msgSend(v249, "addObject:", v252);
          if (!(v284 | v280))
          {
            v245 = 0x80;
            v280 = 2;
            v250 = 2;
            v111 = 1.0;
            v112 = 1.0;
            v12 = v311;
LABEL_341:
            v257 = objc_alloc_init(SFBatteryInfo);

            v258 = 1.0;
            if (v112 <= 1.0)
              v258 = v112;
            if (v258 < 0.0001)
              v258 = 0.0001;
            -[SFBatteryInfo setBatteryLevel:](v257, "setBatteryLevel:", v258);
            -[SFBatteryInfo setBatteryState:](v257, "setBatteryState:", v250);
            if (v245 < 0)
              v259 = 2;
            else
              v259 = 3;
            -[SFBatteryInfo setBatteryType:](v257, "setBatteryType:", v259);
            objc_msgSend(v254, "addObject:", v257);
            v252 = v257;
LABEL_349:
            if (v280)
            {
              v260 = objc_alloc_init(SFBatteryInfo);

              v261 = 1.0;
              if (v111 <= 1.0)
                v261 = v111;
              if (v261 < 0.0001)
                v261 = 0.0001;
              -[SFBatteryInfo setBatteryLevel:](v260, "setBatteryLevel:", v261);
              -[SFBatteryInfo setBatteryState:](v260, "setBatteryState:", v280);
              if (v245 < 0)
                v262 = 3;
              else
                v262 = 2;
              -[SFBatteryInfo setBatteryType:](v260, "setBatteryType:", v262);
              v252 = v260;
LABEL_358:
              v263 = v254;
              objc_msgSend(v254, "addObject:", v252);
              goto LABEL_361;
            }
            goto LABEL_360;
          }
        }
        else
        {
          v254 = v248;
          v252 = 0;
        }
        v12 = v311;
        if (!v284)
          goto LABEL_349;
        goto LABEL_341;
      case 2:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v18);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v46, CFSTR("pid"));

        -[SFBLEScanner modelWithProductID:](self, "modelWithProductID:", v18);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v47, CFSTR("model"));

        if (v15 < 8)
          goto LABEL_373;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *v306);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v48, CFSTR("CnxM"));

        v29 = v312;
        if (v15 < 0xE)
        {
          v37 = 0;
          v12 = v311;
          goto LABEL_370;
        }
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v14 + 8, 6);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v49, CFSTR("publicAddress"));

        v12 = v311;
        if (v15 < 0x11)
          goto LABEL_372;
        LOBYTE(v50) = *(_BYTE *)(v14 + 14);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v50 / 10.0);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v51, CFSTR("TxP1"));

        LOBYTE(v52) = *(_BYTE *)(v14 + 15);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v52 / 10.0);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v53, CFSTR("TxP2"));

        LOBYTE(v54) = *(_BYTE *)(v14 + 16);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v54 / 10.0);
        v55 = (id)objc_claimAutoreleasedReturnValue();
        v56 = CFSTR("TxP3");
LABEL_24:
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v55, v56);
        goto LABEL_175;
      case 3:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v18);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v57, CFSTR("pid"));

        -[SFBLEScanner modelWithProductID:](self, "modelWithProductID:", v18);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v58, CFSTR("model"));

        if (v15 < 8)
          goto LABEL_373;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *v306);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v59, CFSTR("cc"));

        if (v15 < 0xB)
          goto LABEL_373;
        v60 = *(unsigned __int8 *)(v14 + 8);
        if (v60 != 255)
        {
          v61 = *(_BYTE *)(v14 + 9);
          if ((v61 & 3) == 1)
          {
            v62 = objc_alloc_init(SFBatteryInfo);
            v63 = v62;
            if (v60 >= 0x64)
              v64 = 100;
            else
              v64 = v60;
            -[SFBatteryInfo setBatteryLevel:](v62, "setBatteryLevel:", (double)v64 / 100.0);
            if ((v61 & 0xC0) == 0x40)
              v65 = 2;
            else
              v65 = 1;
            -[SFBatteryInfo setBatteryState:](v63, "setBatteryState:", v65);
            -[SFBatteryInfo setBatteryType:](v63, "setBatteryType:", 4);
            v319[0] = v63;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v319, 1);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setObject:forKeyedSubscript:", v66, CFSTR("batteryInfo"));

          }
        }
        v12 = v311;
        if (v15 >= 0xD)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)*(__int16 *)(v14 + 11) / 10.0);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v67, CFSTR("TxP1"));

          goto LABEL_368;
        }
        v37 = 0;
        v29 = v312;
        goto LABEL_370;
      case 4:
        if (v15 < 0x1B)
          goto LABEL_373;
        v68 = self;
        v69 = *(_BYTE *)(v14 + 7);
        v298 = *(unsigned __int8 *)(v14 + 8);
        v299 = *(_BYTE *)(v14 + 9);
        v70 = *(unsigned __int8 *)(v14 + 10);
        v71 = *(unsigned __int8 *)(v14 + 11);
        v72 = *(_BYTE *)(v14 + 12);
        v317 = *(_DWORD *)(v14 + 13);
        v318 = *(_WORD *)(v14 + 17);
        v315 = *(_DWORD *)(v14 + 19);
        v316 = *(_WORD *)(v14 + 23);
        v307 = *(_WORD *)(v14 + 25);
        v305 = v68;
        v293 = v69;
        v73 = -[SFBLEScanner statusToHeadsetStatus:forProductID:](v68, "statusToHeadsetStatus:forProductID:");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v71);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v74, CFSTR("cc"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v73);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v75, CFSTR("hsStatus"));

        if ((v70 & 8) != 0)
          v76 = MEMORY[0x1E0C9AAB0];
        else
          v76 = MEMORY[0x1E0C9AAA0];
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v76, CFSTR("lc"));
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v70 & 7);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v310 = v73;
        if ((v73 & 0x100) != 0)
        {
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v77, CFSTR("locP"));

          objc_msgSend(v11, "advertisementFields");
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v106, "objectForKeyedSubscript:", CFSTR("locS"));
          v79 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v79)
            goto LABEL_79;
          v80 = CFSTR("locS");
        }
        else
        {
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v77, CFSTR("locS"));

          objc_msgSend(v11, "advertisementFields");
          v78 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v78, "objectForKeyedSubscript:", CFSTR("locP"));
          v79 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v79)
            goto LABEL_79;
          v80 = CFSTR("locP");
        }
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v79, v80);
LABEL_79:

        v314 = 0;
        -[SFBLEScanner parseStatus3:productID:caseLEDColor:caseLEDStatus:](v305, "parseStatus3:productID:caseLEDColor:caseLEDStatus:", v70, v21, (char *)&v314 + 1, &v314);
        +[SFHeadphoneProduct airPodsPro](SFHeadphoneProduct, "airPodsPro");
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        v295 = v10;
        if (objc_msgSend(v107, "productID") == (_DWORD)v21)
        {
          v108 = 1;
        }
        else
        {
          +[SFHeadphoneProduct b698](SFHeadphoneProduct, "b698");
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v109, "productID") == (_DWORD)v21)
          {
            v108 = 1;
          }
          else
          {
            +[SFHeadphoneProduct b698](SFHeadphoneProduct, "b698");
            v167 = (void *)objc_claimAutoreleasedReturnValue();
            v108 = objc_msgSend(v167, "altProductID") == v21;

          }
        }

        +[SFHeadphoneProduct airPods](SFHeadphoneProduct, "airPods");
        v168 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v168, "productID") == (_DWORD)v21)
        {
          v169 = 1;
        }
        else
        {
          +[SFHeadphoneProduct airPodsSecondGeneration](SFHeadphoneProduct, "airPodsSecondGeneration");
          v170 = (void *)objc_claimAutoreleasedReturnValue();
          v169 = objc_msgSend(v170, "productID") == (_DWORD)v21 || v108;

        }
        +[SFHeadphoneProduct airPodsMax](SFHeadphoneProduct, "airPodsMax");
        v171 = (SFHeadphoneProduct *)objc_claimAutoreleasedReturnValue();

        if (v312 == v171)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v293 & 0x1F);
          v173 = (void *)objc_claimAutoreleasedReturnValue();
          v174 = CFSTR("hbT");
        }
        else
        {
          if (!v169)
            goto LABEL_199;
          if (v108)
            v172 = (v70 >> 4) & 1 | 2;
          else
            v172 = (v70 >> 4) & 1;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v172);
          v173 = (void *)objc_claimAutoreleasedReturnValue();
          v174 = CFSTR("csVs");
        }
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v173, v174);

LABEL_199:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", HIBYTE(v314));
        v175 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v175, CFSTR("csLC"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v314);
        v176 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v176, CFSTR("csLS"));

        -[SFBLEScanner modelWithProductID:](v305, "modelWithProductID:", v21);
        v177 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v177, CFSTR("model"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v21);
        v178 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v178, CFSTR("pid"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v307);
        v179 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v179, CFSTR("pid2"));

        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v317, 6);
        v180 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v180, CFSTR("publicAddress"));

        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v315, 6);
        v181 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v181, CFSTR("publicAddress2"));

        if ((v72 & 1) != 0)
          objc_msgSend(v16, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("notMyCase"));
        v10 = v295;
        -[SFBLEScanner pairingUpdatePairedInfo:fields:bleDevice:](v305, "pairingUpdatePairedInfo:fields:bleDevice:", v295, v16, v313);
        v182 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v183 = v299 & 0xF;
        v184 = 0.0;
        if (v183 == 15)
        {
          v185 = 0;
          v186 = 0.0;
        }
        else
        {
          if (v183 >= 0xA)
            v183 = 10;
          v186 = (double)v183 / 10.0;
          if ((v299 & 0x40) != 0)
            v185 = 2;
          else
            v185 = 1;
        }
        v187 = v298 & 0xF;
        if (v187 == 15)
        {
          v188 = 0;
        }
        else
        {
          if (v187 >= 0xA)
            v187 = 10;
          v184 = (double)v187 / 10.0;
          if ((v299 & 0x10) != 0)
            v188 = 2;
          else
            v188 = 1;
        }
        v189 = v298 >> 4;
        if (v298 >> 4 == 15)
        {
          v190 = 0;
          v191 = 0.0;
        }
        else
        {
          if (v189 >= 0xA)
            v189 = 10;
          v191 = (double)v189 / 10.0;
          if ((v299 & 0x20) != 0)
            v190 = 2;
          else
            v190 = 1;
        }
        if (v185)
        {
          v192 = objc_alloc_init(SFBatteryInfo);
          v193 = v192;
          v194 = 1.0;
          if (v186 <= 1.0)
            v194 = v186;
          if (v194 < 0.0001)
            v194 = 0.0001;
          -[SFBatteryInfo setBatteryLevel:](v192, "setBatteryLevel:", v194);
          -[SFBatteryInfo setBatteryState:](v193, "setBatteryState:", v185);
          -[SFBatteryInfo setBatteryType:](v193, "setBatteryType:", 1);
          objc_msgSend(v182, "addObject:", v193);
          if (!(v190 | v188))
          {
            v310 = 0x80;
            v188 = 2;
            v184 = 1.0;
            v190 = 2;
            v191 = 1.0;
          }

        }
        if (v188)
        {
          v195 = objc_alloc_init(SFBatteryInfo);
          v196 = v195;
          v197 = 1.0;
          if (v184 <= 1.0)
            v197 = v184;
          if (v197 < 0.0001)
            v197 = 0.0001;
          -[SFBatteryInfo setBatteryLevel:](v195, "setBatteryLevel:", v197);
          -[SFBatteryInfo setBatteryState:](v196, "setBatteryState:", v188);
          if (v310 < 0)
            v198 = 2;
          else
            v198 = 3;
          -[SFBatteryInfo setBatteryType:](v196, "setBatteryType:", v198);
          objc_msgSend(v182, "addObject:", v196);

        }
        if (v190)
        {
          v199 = objc_alloc_init(SFBatteryInfo);
          v200 = v199;
          v201 = 1.0;
          if (v191 <= 1.0)
            v201 = v191;
          if (v201 < 0.0001)
            v201 = 0.0001;
          -[SFBatteryInfo setBatteryLevel:](v199, "setBatteryLevel:", v201);
          -[SFBatteryInfo setBatteryState:](v200, "setBatteryState:", v190);
          if (v310 < 0)
            v202 = 3;
          else
            v202 = 2;
          -[SFBatteryInfo setBatteryType:](v200, "setBatteryType:", v202);
          objc_msgSend(v182, "addObject:", v200);

        }
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v182, CFSTR("batteryInfo"));

        v29 = v312;
        v11 = v313;
        v12 = v311;
        goto LABEL_369;
      case 5:
        v300 = v14 + v15;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v18);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v81, CFSTR("pid"));

        -[SFBLEScanner modelWithProductID:](self, "modelWithProductID:", v18);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v82, CFSTR("model"));

        if (v15 >= 8)
        {
          v306 = (unsigned __int8 *)(v14 + 8);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)(v14 + 7));
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v83, CFSTR("osFl"));

        }
        v12 = v311;
        v29 = v312;
        if ((uint64_t)(v300 - (_QWORD)v306) < 1)
          goto LABEL_369;
        v84 = *v306;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v84 & 3);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v85, CFSTR("osBS"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (v84 >> 2) & 3);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v86, CFSTR("osBP"));

        if ((uint64_t)(~(unint64_t)v306 + v300) < 1)
          goto LABEL_369;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v306[1]);
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setObject:forKeyedSubscript:", v87, CFSTR("osCl"));

        if ((uint64_t)(v300 - (_QWORD)v306 - 2) < 18)
          goto LABEL_369;
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v306 + 3, 18);
        v55 = (id)objc_claimAutoreleasedReturnValue();
        v56 = CFSTR("engravingData");
        goto LABEL_24;
      case 6:
        v301 = v14 + v15;
        getWPPairingKeyAccessoryStatusDecrypted[0]();
        v12 = v311;
        Int64 = CFDictionaryGetInt64();
        -[SFBLEScanner pairingUpdatePairedInfo:fields:bleDevice:](self, "pairingUpdatePairedInfo:fields:bleDevice:", v10, v16, v11);
        v29 = v312;
        if (Int64)
        {
          -[SFBLEScanner modelWithProductID:](self, "modelWithProductID:", v21);
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v89, CFSTR("model"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v21);
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v90, CFSTR("pid"));

          getWPPairingKeyDeviceAddress[0]();
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v311, "objectForKeyedSubscript:", v91);
          v92 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v92, CFSTR("publicAddress"));

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKeyedSubscript:", v93, CFSTR("paired"));

          var0 = self->_ucat->var0;
          if (var0 <= 20 && (var0 != -1 || _LogCategory_Initialize()))
          {
            v273 = v16;
            LogPrintF();
          }
          -[SFBLEScanner pairingParseAccessoryStatusPayloadPtr:end:fields:](self, "pairingParseAccessoryStatusPayloadPtr:end:fields:", v306, v301, v16, v273);
        }
        goto LABEL_369;
      default:
        v37 = 0;
        v12 = v311;
        v29 = v312;
        goto LABEL_370;
    }
  }
  v29 = 0;
LABEL_372:
  v37 = 0;
LABEL_370:
  v271 = v37;

  return v271;
}

- (void)pairingParseAccessoryStatusPayloadPtr:(const char *)a3 end:(const char *)a4 fields:(id)a5
{
  id v7;
  const char *v8;
  char v9;
  void *v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  int v14;
  double v15;
  SFBatteryInfo *v16;
  SFBatteryInfo *v17;
  double v18;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v7 = a5;
  if (a4 - a3 < 1)
    goto LABEL_10;
  v9 = *a3;
  v8 = a3 + 1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9 & 7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("locP"));

  v11 = (v9 & 4) != 0 ? MEMORY[0x1E0C9AAB0] : MEMORY[0x1E0C9AAA0];
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("lc"));
  if (a4 - v8 < 1)
  {
LABEL_10:
    LOBYTE(v12) = 0;
    goto LABEL_11;
  }
  v12 = *(unsigned __int8 *)v8;
  if (v12 != 254)
  {
    if (v12 == 255)
      goto LABEL_20;
    if ((v12 & 0x80) != 0)
    {
      v13 = 2;
LABEL_12:
      v14 = v12 & 0x7F;
      if (v14 >= 0x64)
        v14 = 100;
      v15 = (double)v14 / 100.0;
      goto LABEL_15;
    }
LABEL_11:
    v13 = 1;
    goto LABEL_12;
  }
  v15 = 0.8;
  v13 = 2;
LABEL_15:
  v16 = objc_alloc_init(SFBatteryInfo);
  v17 = v16;
  v18 = 1.0;
  if (v15 <= 1.0)
    v18 = v15;
  if (v18 < 0.0001)
    v18 = 0.0001;
  -[SFBatteryInfo setBatteryLevel:](v16, "setBatteryLevel:", v18);
  -[SFBatteryInfo setBatteryState:](v17, "setBatteryState:", v13);
  -[SFBatteryInfo setBatteryType:](v17, "setBatteryType:", 1);
  v20[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v19, CFSTR("batteryInfo"));

LABEL_20:
}

- (BOOL)pairingUpdatePairedInfo:(id)a3 fields:(id)a4 bleDevice:(id)a5
{
  id v8;
  id v9;
  id v10;
  BOOL v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[SFBLEScanner _btSessionUsable](self, "_btSessionUsable"))
    v11 = -[SFBLEScanner pairingUpdatePairedInfoMB:fields:bleDevice:](self, "pairingUpdatePairedInfoMB:fields:bleDevice:", v8, v9, v10);
  else
    v11 = 0;

  return v11;
}

- (BOOL)pairingUpdatePairedInfoMB:(id)a3 fields:(id)a4 bleDevice:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  double Current;
  double v13;
  int v14;
  BOOL v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  int var0;
  uint64_t v22;
  void *v23;
  const char *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  _QWORD *v31;
  uint64_t v32;
  const char *v33;
  int v34;
  int v35;
  int v36;
  __int16 v37;
  int v38;
  uint64_t v39;
  _OWORD v40[2];
  char v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[23];
  _QWORD v57[3];

  v57[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v10, "paired");
  if (!v10 || (Current = CFAbsoluteTimeGetCurrent(), objc_msgSend(v10, "pairCheckTime"), Current - v13 > 1.0))
  {
    if (self->_btSession)
    {
      v57[0] = 0;
      v57[1] = 0;
      v39 = 0;
      objc_msgSend(v8, "getUUIDBytes:", v57);
      v14 = softLinkBTDeviceFromIdentifier((uint64_t)self->_btSession, (uint64_t)v57, (uint64_t)&v39);
      v15 = v14 == 0;
      if (!v14)
      {
        memset(v56, 0, sizeof(v56));
        v55 = 0u;
        v54 = 0u;
        v53 = 0u;
        v52 = 0u;
        v51 = 0u;
        v50 = 0u;
        v49 = 0u;
        v48 = 0u;
        v47 = 0u;
        v46 = 0u;
        v45 = 0u;
        v44 = 0u;
        v43 = 0u;
        v42 = 0u;
        memset(v40, 0, sizeof(v40));
        v37 = 0;
        v36 = 0;
        v41 = 0;
        if (!((unsigned int (*)(uint64_t, uint64_t, uint64_t))softLinkBTDeviceGetName[0])(v39, (uint64_t)&v41, 248)&& v41)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", &v41);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v16, CFSTR("name"));

        }
        v38 = 0;
        if (((unsigned int (*)(uint64_t, uint64_t))softLinkBTDeviceGetPairingStatus[0])(v39, (uint64_t)&v38))
          v11 = v11;
        else
          v11 = v38 != 0;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v11);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, CFSTR("paired"));

        v35 = 0;
        ((void (*)(uint64_t, uint64_t))softLinkBTDeviceIsTemporaryPaired[0])(v39, (uint64_t)&v35);
        objc_msgSend(v10, "setTempPaired:", v35 != 0);
        v34 = 0;
        if (((unsigned int (*)(uint64_t, uint64_t))softLinkBTDeviceGetConnectedServices[0])(v39, (uint64_t)&v34))
        {
          v34 = 0;
        }
        else if (v34)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v19, CFSTR("CnSv"));

        }
        objc_msgSend(v10, "bluetoothAddress");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          objc_msgSend(v9, "setObject:forKeyedSubscript:", v20, CFSTR("publicAddress"));
        }
        else
        {
          LOBYTE(v40[0]) = 0;
          if (!((unsigned int (*)(uint64_t, uint64_t, uint64_t))softLinkBTDeviceGetAddressString[0])(v39, (uint64_t)v40, 32)&& LOBYTE(v40[0])&& !((unsigned int (*)(uint64_t, uint64_t))softLinkBTDeviceAddressFromString[0])((uint64_t)v40, (uint64_t)&v36))
          {
            objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", &v36, 6);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setObject:forKeyedSubscript:", v30, CFSTR("publicAddress"));

          }
        }

      }
      var0 = self->_ucat->var0;
      if (var0 <= 8 && (var0 != -1 || _LogCategory_Initialize()))
      {
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("name"));
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = (void *)v22;
        v24 = "yes";
        if (!(_DWORD)v11)
          v24 = "no";
        v32 = v22;
        v33 = v24;
        v31 = v57;
        LogPrintF();

      }
      v11 = (_DWORD)v11 != 0;
      if (v10)
LABEL_29:
        objc_msgSend(v10, "setPairCheckTime:", CFAbsoluteTimeGetCurrent());
    }
    else
    {
      if (self->_btStarted)
      {
        v18 = self->_ucat->var0;
        if (v18 <= 60 && (v18 != -1 || _LogCategory_Initialize()))
        {
          v31 = v8;
          LogPrintF();
        }
      }
      v15 = 0;
      if (v10)
        goto LABEL_29;
    }
    if (v15)
      goto LABEL_38;
  }
  objc_msgSend(v10, "bluetoothAddress", v31, v32, v33);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v25, CFSTR("publicAddress"));
  if (objc_msgSend(v10, "connectedServices"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v10, "connectedServices"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v26, CFSTR("CnSv"));

  }
  objc_msgSend(v10, "name");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v27, CFSTR("name"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v11);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v28, CFSTR("paired"));

LABEL_38:
  return v11;
}

- (id)modelWithProductID:(unsigned __int16)a3
{
  uint64_t v3;
  SFHeadphoneProduct *v4;
  SFHeadphoneProduct *v5;
  uint64_t v6;
  __CFString *v7;

  v3 = a3;
  v4 = -[SFHeadphoneProduct initWithProductID:]([SFHeadphoneProduct alloc], "initWithProductID:", a3);
  v5 = v4;
  if (v4)
  {
    -[SFHeadphoneProduct bluetoothModel](v4, "bluetoothModel");
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_3:
    v7 = (__CFString *)v6;
    goto LABEL_4;
  }
  if ((int)v3 <= 788)
  {
    switch((_DWORD)v3)
    {
      case 0x266:
        v7 = CFSTR("ATVRemote1,1");
        goto LABEL_4;
      case 0x26D:
        v7 = CFSTR("ATVRemote1,2");
        goto LABEL_4;
      case 0x314:
        v7 = CFSTR("ATVRemote1,3");
        goto LABEL_4;
    }
LABEL_17:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Device1,%u"), v3);
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
  v7 = CFSTR("AirPods1,1");
  switch((int)v3)
  {
    case 8194:
      break;
    case 8195:
      v7 = CFSTR("PowerBeats3,1");
      break;
    case 8196:
    case 8199:
    case 8200:
    case 8209:
    case 8210:
    case 8211:
    case 8212:
    case 8213:
    case 8214:
    case 8216:
    case 8217:
    case 8219:
    case 8220:
    case 8221:
    case 8222:
    case 8223:
    case 8224:
    case 8225:
    case 8226:
    case 8227:
    case 8228:
      goto LABEL_17;
    case 8197:
      v7 = CFSTR("BeatsX1,1");
      break;
    case 8198:
      v7 = CFSTR("BeatsSolo3,1");
      break;
    case 8201:
      v7 = CFSTR("BeatsStudio3,2");
      break;
    case 8202:
      v7 = CFSTR("Device1,8202");
      break;
    case 8203:
      v7 = CFSTR("PowerbeatsPro1,1");
      break;
    case 8204:
      v7 = CFSTR("BeatsSoloPro1,1");
      break;
    case 8205:
      v7 = CFSTR("Powerbeats4,1");
      break;
    case 8206:
      v7 = CFSTR("AirPodsPro1,1");
      break;
    case 8207:
      v7 = CFSTR("AirPods1,3");
      break;
    case 8208:
      v7 = CFSTR("Device1,8208");
      break;
    case 8215:
      v7 = CFSTR("BeatsStudioPro1,1");
      break;
    case 8218:
      v7 = CFSTR("Device1,8218");
      break;
    case 8229:
      v7 = CFSTR("Device1,8229");
      break;
    default:
      if ((_DWORD)v3 == 789)
      {
        v7 = CFSTR("ATVRemote1,4");
      }
      else
      {
        if ((_DWORD)v3 != 21760)
          goto LABEL_17;
        v7 = CFSTR("Device1,21760");
      }
      break;
  }
LABEL_4:

  return v7;
}

- (void)parseStatus3:(unsigned __int8)a3 productID:(unsigned int)a4 caseLEDColor:(unsigned __int8 *)a5 caseLEDStatus:(char *)a6
{
  uint64_t v8;
  unsigned int v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  SFHeadphoneProduct *v13;
  int v14;
  char v15;
  unsigned __int8 v16;
  SFHeadphoneProduct *v17;
  void *v18;
  int v19;
  void *v20;
  int v21;
  SFHeadphoneProduct *v22;

  v8 = *(_QWORD *)&a4;
  v9 = a3;
  if (a4 == 8203)
    goto LABEL_2;
  +[SFHeadphoneProduct b507](SFHeadphoneProduct, "b507");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "productID") == (_DWORD)v8)
    goto LABEL_6;
  +[SFHeadphoneProduct b494](SFHeadphoneProduct, "b494");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "productID") == (_DWORD)v8)
  {

LABEL_6:
    v10 = 1;
    goto LABEL_7;
  }
  +[SFHeadphoneProduct b607](SFHeadphoneProduct, "b607");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "productID");

  if (v19 == (_DWORD)v8
    || (+[SFHeadphoneProduct b463](SFHeadphoneProduct, "b463"),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        v21 = objc_msgSend(v20, "productID"),
        v20,
        v21 == (_DWORD)v8))
  {
LABEL_2:
    v10 = 1;
    goto LABEL_8;
  }
  +[SFHeadphoneProduct b498](SFHeadphoneProduct, "b498");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v11, "productID") == v8;
LABEL_7:

LABEL_8:
  v13 = -[SFHeadphoneProduct initWithProductID:]([SFHeadphoneProduct alloc], "initWithProductID:", v8);
  if (v10)
  {
    v14 = (v9 >> 4) & 3;
    if (v14 == 2)
      v15 = 1;
    else
      v15 = 2 * (v14 != 1);
    if (v9 >= 0x40)
      v16 = 4 * ((v9 & 0xC0) == 64);
    else
      v16 = 3;
  }
  else
  {
    v22 = v13;
    +[SFHeadphoneProduct airPodsMax](SFHeadphoneProduct, "airPodsMax");
    v17 = (SFHeadphoneProduct *)objc_claimAutoreleasedReturnValue();

    v13 = v22;
    v16 = (v9 >> 5) & 3;
    if (v22 == v17)
      v15 = (v9 & 0x10) != 0;
    else
      v15 = v9 >> 7;
  }
  *a5 = v16;
  *a6 = v15;

}

- (unsigned)statusToHeadsetStatus:(unsigned __int8)a3 forProductID:(unsigned __int16)a4
{
  int v4;
  unsigned int v5;
  SFHeadphoneProduct *v6;
  void *v7;
  int v8;
  unsigned int v9;
  SFHeadphoneProduct *v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  unsigned int v17;

  v4 = a4;
  v5 = a3;
  v6 = -[SFHeadphoneProduct initWithProductID:]([SFHeadphoneProduct alloc], "initWithProductID:", a4);
  +[SFHeadphoneProduct airPodsMax](SFHeadphoneProduct, "airPodsMax");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "altProductID");

  if (v8 == v4)
  {
    v9 = (v5 >> 1) & 3;
    goto LABEL_18;
  }
  +[SFHeadphoneProduct airPodsMax](SFHeadphoneProduct, "airPodsMax");
  v10 = (SFHeadphoneProduct *)objc_claimAutoreleasedReturnValue();

  if (v6 == v10)
  {
    v9 = (v5 >> 5) & 3;
LABEL_18:
    if (v9 == 3)
      v16 = 8;
    else
      v16 = dword_1A2AF7BC0[v9];
    goto LABEL_21;
  }
  v11 = v5 & 1;
  v12 = (v5 >> 1) & 3;
  if (v12 == 1)
    v11 = v5 & 1 | 4;
  if (v12 == 2)
    v11 = v5 & 1 | 2;
  if (v12 == 3)
    v11 = v5 & 1 | 8;
  v13 = (v5 >> 3) & 3;
  v14 = v11 | 0x40;
  v15 = v11 | 0x10;
  if (v13 == 1)
    v11 |= 0x20u;
  if (v13 == 2)
    v11 = v15;
  if (v13 == 3)
    v11 = v14;
  v16 = (4 * v5) & 0x180 ^ 0x100 | v11;
LABEL_21:
  if ((v5 & 0x80u) == 0)
    v17 = v16;
  else
    v17 = v16 | 0x200;

  return v17;
}

- (id)bluetoothStateChangedHandler
{
  return self->_bluetoothStateChangedHandler;
}

- (void)setBluetoothStateChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (id)deviceFoundHandler
{
  return self->_deviceFoundHandler;
}

- (id)deviceLostHandler
{
  return self->_deviceLostHandler;
}

- (id)deviceChangedHandler
{
  return self->_deviceChangedHandler;
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 312);
}

- (NSData)payloadFilterMask
{
  return self->_payloadFilterMask;
}

- (double)rescanInterval
{
  return self->_rescanInterval;
}

- (void)setRescanInterval:(double)a3
{
  self->_rescanInterval = a3;
}

- (BOOL)rssiLog
{
  return self->_rssiLog;
}

- (void)setRssiLog:(BOOL)a3
{
  self->_rssiLog = a3;
}

- (BOOL)rssiLogStdOut
{
  return self->_rssiLogStdOut;
}

- (void)setRssiLogStdOut:(BOOL)a3
{
  self->_rssiLogStdOut = a3;
}

- (SFBLERecorder)recorder
{
  return self->_recorder;
}

- (void)setRecorder:(id)a3
{
  objc_storeStrong((id *)&self->_recorder, a3);
}

- (int64_t)scanInterval
{
  return self->_scanInterval;
}

- (void)setScanInterval:(int64_t)a3
{
  self->_scanInterval = a3;
}

- (int64_t)scanState
{
  return self->_scanState;
}

- (id)scanStateChangedHandler
{
  return self->_scanStateChangedHandler;
}

- (int64_t)scanWindow
{
  return self->_scanWindow;
}

- (void)setScanWindow:(int64_t)a3
{
  self->_scanWindow = a3;
}

- (double)timeout
{
  return self->_timeout;
}

- (id)timeoutHandler
{
  return self->_timeoutHandler;
}

- (void)setTimeoutHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

@end
