@implementation CLDurianDevice

- (CLDurianDevice)initWithUUID:(id)a3 queue:(id)a4 centralManager:(id)a5
{
  CLDurianDevice *v8;
  double v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CLDurianDevice;
  v8 = -[CLDurianDevice init](&v11, "init");
  if (v8)
  {
    v8->_uuid = (NSUUID *)objc_msgSend(a3, "copy");
    v8->_queue = (OS_dispatch_queue *)a4;
    v8->_centralManager = (CBCentralManager *)a5;
    v8->_activePeripheralReady = 0;
    v8->_pendingTasks = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v8->_preemptedTasks = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v8->_activeTaskTimeouts = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v8->_preemptedTaskTimeouts = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v8->_activeTaskAcknowledged = 0;
    v8->_deviceState = 0;
    sub_101536DD8();
    v8->_stateLastUpdated = v9;
    v8->_lastAlertDate = 0;
    v8->_lastObservationTime = 0.0;
    v8->_connectReason = 0;
    v8->_disconnectReason = 0;
    v8->_connectionTime = 0.0;
    v8->_lastDisconnectionTime = mach_continuous_time();
    v8->_lastProactiveMaintenanceTime = mach_continuous_time();
    v8->_isMultiConnectionEnabled = 0;
    v8->_mutexState = 0;
    v8->_connectionEventSpmiRequested = 0;
    *(_OWORD *)&v8->_currentLatencyStartTime = 0u;
    *(_OWORD *)&v8->_commandedLatencyTime = 0u;
    v8->_latencyCommandResponseArrived = 1;
    v8->_latencyTimeoutBlock = 0;
    v8->_uarpMessage = 0;
    v8->_keyRollInterval = 900;
    *(_WORD *)&v8->_isPlayingSound = 0;
    v8->_btFindingState = 0;
    v8->_pendingSoundTask = 0;
    *(_WORD *)&v8->_isClassicallyConnected = 0;
    v8->_lastGroupClassicDisconnectionTime = 0;
    v8->_taUnknownBeacon = 0;
  }
  return v8;
}

- (void)dealloc
{
  id latencyTimeoutBlock;
  objc_super v4;

  latencyTimeoutBlock = self->_latencyTimeoutBlock;
  if (latencyTimeoutBlock)
    _Block_release(latencyTimeoutBlock);
  v4.receiver = self;
  v4.super_class = (Class)CLDurianDevice;
  -[CLDurianDevice dealloc](&v4, "dealloc");
}

+ (BOOL)isDurianConnectionLatency:(int64_t)a3 lowerThan:(int64_t)a4
{
  BOOL v5;

  v5 = a4 == -6 || a3 < a4;
  if (a3 == a4)
    v5 = 0;
  return a3 != -6 && v5;
}

- (int64_t)connectionPriority
{
  int64_t v3;
  NSMutableArray *pendingTasks;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  if (self->_activePeripheral)
    v3 = 0;
  else
    v3 = -1;
  if (-[NSMutableArray count](self->_pendingTasks, "count"))
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    pendingTasks = self->_pendingTasks;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](pendingTasks, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      v3 = 1;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(pendingTasks);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i), "userTask") & 1) != 0)
          {
            v3 = 3;
            goto LABEL_16;
          }
        }
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](pendingTasks, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v6)
          continue;
        break;
      }
    }
    else
    {
      v3 = 1;
    }
  }
LABEL_16:
  if (v3 >= 2 || !self->_firmwareUpdateMode)
    return v3;
  else
    return 2;
}

- (unint64_t)connectionState
{
  if (!-[CLDurianDevice isConnected](self, "isConnected"))
    return -[CLDurianDevice isAttemptingConnection](self, "isAttemptingConnection");
  if (-[CLDurianDevice isLeashSlotInUse](self, "isLeashSlotInUse"))
    return 4;
  return 2;
}

- (NSString)currentTaskName
{
  return (NSString *)objc_msgSend(-[NSMutableArray objectAtIndex:](self->_pendingTasks, "objectAtIndex:", 0), "opcodeDescription");
}

- (BOOL)connectionAllowed
{
  SPSimpleBeacon *beacon;

  beacon = self->_beacon;
  if (beacon)
    return -[SPSimpleBeacon connectionAllowed](beacon, "connectionAllowed");
  else
    return 1;
}

- (NSUUID)groupUuid
{
  return (NSUUID *)-[SPSimpleBeacon groupIdentifier](self->_beacon, "groupIdentifier");
}

- (unsigned)groupPartNumber
{
  return -[SPSimpleBeacon partIdentifier](self->_beacon, "partIdentifier");
}

- (unint64_t)buildNumber
{
  return +[CLDurianVersionNumberUtilities getNumberFromString:](CLDurianVersionNumberUtilities, "getNumberFromString:", -[SPSimpleBeacon systemVersion](self->_beacon, "systemVersion"));
}

- (BOOL)isRangingSessionTask:(unsigned __int16)a3
{
  unsigned int v3;
  BOOL result;

  v3 = a3;
  if (-[CLDurianDevice isHawkeyeAccessory](self, "isHawkeyeAccessory"))
    return v3 == 1804 || v3 - 1801 < 2;
  result = 1;
  if ((v3 > 0x25 || ((1 << v3) & 0x3400100000) == 0) && (v3 - 2057 > 3 || v3 == 2059))
    return 0;
  return result;
}

- (BOOL)isSoundCompleteTask:(unsigned __int16)a3
{
  int v3;
  int v4;

  v3 = a3;
  if (-[CLDurianDevice isHawkeyeAccessory](self, "isHawkeyeAccessory"))
    v4 = 525;
  else
    v4 = 9;
  return v4 == v3;
}

- (BOOL)isCancellablePlaySoundTask:(unsigned __int16)a3
{
  return a3 == 40;
}

- (BOOL)isAggAdvCompleteTask:(unsigned __int16)a3
{
  int v3;
  BOOL result;

  v3 = a3;
  result = -[CLDurianDevice isHawkeyeAccessory](self, "isHawkeyeAccessory");
  if (v3 != 532)
    return 0;
  return result;
}

- (BOOL)isNonOwnerSoundCompleteTask:(unsigned __int16)a3
{
  int v3;
  BOOL result;

  v3 = a3;
  if (-[CLDurianDevice isPoshAccessory](self, "isPoshAccessory")
    || -[CLDurianDevice isHawkeyeAccessory](self, "isHawkeyeAccessory"))
  {
    return v3 == 771;
  }
  result = -[CLDurianDevice isAirTag](self, "isAirTag");
  if (v3 != 2062)
    return 0;
  return result;
}

- (BOOL)isNonOwnerSoundTask:(unsigned __int16)a3
{
  BOOL result;

  result = 1;
  if ((int)a3 <= 793)
  {
    if (a3 == 175 || a3 == 768)
      return result;
    return 0;
  }
  if (a3 != 794 && a3 != 2061)
    return 0;
  return result;
}

- (BOOL)isAggresiveAdvertisingCompleteTask:(unsigned __int16)a3
{
  int v3;
  BOOL result;

  v3 = a3;
  result = -[CLDurianDevice isHawkeyeAccessory](self, "isHawkeyeAccessory");
  if (v3 != 532)
    return 0;
  return result;
}

- (BOOL)isFirmwareVersionCrashTask:(unsigned __int16)a3
{
  return (a3 & 0xFFFE) == 16;
}

- (BOOL)isActiveTaskOpcode:(unsigned __int16)a3
{
  int v3;
  unsigned int v5;
  CLDurianTask *v6;
  uint64_t v7;
  CLDurianTask *v8;
  uint64_t v9;
  CLDurianTask *v10;
  NSObject *v11;
  id v12;
  unsigned int v13;
  _DWORD v15[2];
  __int16 v16;
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  unsigned int v21;
  __int16 v22;
  int v23;

  v3 = a3;
  v5 = -[CLDurianDevice isHawkeyeAccessory](self, "isHawkeyeAccessory");
  v6 = -[CLDurianDevice activeTask](self, "activeTask");
  v8 = v6;
  if (!v5)
  {
    v13 = -[CLDurianCommand opcode](-[CLDurianTask command](v6, "command"), "opcode");
    return v13 == v3;
  }
  v9 = objc_opt_class(CLHawkeyeTask, v7);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
  {
    v10 = -[CLDurianDevice activeTask](self, "activeTask");
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
    v11 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      v15[0] = 68289795;
      v15[1] = 0;
      v16 = 2082;
      v17 = "";
      v18 = 2113;
      v19 = v12;
      v20 = 1026;
      v21 = -[CLDurianTask hawkeyeOpcode](v10, "hawkeyeOpcode");
      v22 = 1026;
      v23 = v3;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye isActiveTaskOpcode\", \"item\":%{private, location:escape_only}@, \"active\":%{public}d, \"param\":%{public}d}", (uint8_t *)v15, 0x28u);
    }
    v13 = -[CLDurianTask hawkeyeOpcode](v10, "hawkeyeOpcode");
    return v13 == v3;
  }
  return 0;
}

- (BOOL)isAckTask:(unsigned __int16)a3
{
  int v3;
  CLDurianTask *v5;
  uint64_t v6;
  uint64_t v7;
  BOOL result;
  CLDurianTask *v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a3;
  if (-[CLDurianDevice isAirTag](self, "isAirTag"))
  {
    v5 = -[CLDurianDevice activeTask](self, "activeTask");
    v7 = objc_opt_class(CLDurianGATTWriteTask, v6);
    if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
      return v3 == 2048;
  }
  if (!-[CLDurianDevice isHawkeyeAccessory](self, "isHawkeyeAccessory"))
  {
    if (-[CLDurianDevice isPoshAccessory](self, "isPoshAccessory")
      && (v10 = -[CLDurianDevice activeTask](self, "activeTask"),
          v12 = objc_opt_class(CLDurianGATTWriteTask, v11),
          (objc_opt_isKindOfClass(v10, v12) & 1) != 0))
    {
      return v3 == 770;
    }
    else
    {
      return v3 == 0;
    }
  }
  result = 1;
  if (v3 > 1282)
  {
    if (v3 != 1283 && v3 != 1792)
      return 0;
  }
  else if (v3 != 523 && v3 != 770)
  {
    return 0;
  }
  return result;
}

- (BOOL)isNackTask:(unsigned __int16)a3
{
  int v3;
  int v5;

  v3 = a3;
  v5 = 767;
  if (!-[CLDurianDevice isHawkeyeAccessory](self, "isHawkeyeAccessory"))
  {
    if (-[CLDurianDevice isPoshAccessory](self, "isPoshAccessory"))
      v5 = 767;
    else
      v5 = 255;
  }
  return v5 == v3;
}

- (BOOL)isMultiStatusResponse:(unsigned __int16)a3
{
  int v3;
  int v4;

  v3 = a3;
  if (-[CLDurianDevice isHawkeyeAccessory](self, "isHawkeyeAccessory"))
    v4 = 524;
  else
    v4 = 12;
  return v4 == v3;
}

- (BOOL)isSetMaxConnectionsTask:(unsigned __int16)a3
{
  int v3;
  int v4;

  v3 = a3;
  if (-[CLDurianDevice isHawkeyeAccessory](self, "isHawkeyeAccessory"))
    v4 = 519;
  else
    v4 = 11;
  return v4 == v3;
}

- (BOOL)isMutexTask:(unsigned __int16)a3
{
  return a3 == 14;
}

- (BOOL)isKeyRollTask:(unsigned __int16)a3
{
  int v3;
  int v4;

  v3 = a3;
  if (-[CLDurianDevice isHawkeyeAccessory](self, "isHawkeyeAccessory"))
    v4 = 522;
  else
    v4 = 41;
  return v4 == v3;
}

- (BOOL)isGroupStatusResponse:(unsigned __int16)a3
{
  int v3;
  BOOL result;

  v3 = a3;
  result = -[CLDurianDevice isHawkeyeAccessory](self, "isHawkeyeAccessory");
  if (v3 != 552)
    return 0;
  return result;
}

- (BOOL)isRangingStartTask:(unsigned __int16)a3
{
  int v3;
  unsigned int v4;
  BOOL v6;

  v3 = a3;
  v4 = -[CLDurianDevice isHawkeyeAccessory](self, "isHawkeyeAccessory");
  v6 = v3 == 1795 || v3 == 3;
  if (v4)
    return v6;
  else
    return (v3 & 0xFFFFF7FF) == 3;
}

- (BOOL)isRangingCompleteTask:(unsigned __int16)a3
{
  int v3;
  int v4;

  v3 = a3;
  if (-[CLDurianDevice isHawkeyeAccessory](self, "isHawkeyeAccessory"))
    v4 = 1800;
  else
    v4 = 2056;
  return v4 == v3 || v3 == 4;
}

- (BOOL)isFwdlAbortTask:(unsigned __int16)a3
{
  return a3 == 32;
}

- (BOOL)isNordicCrashTask:(unsigned __int16)a3
{
  return a3 == 16;
}

- (BOOL)isR1CrashTask:(unsigned __int16)a3
{
  return a3 == 17;
}

- (BOOL)isUserStatsV2Opcode:(unsigned __int16)a3
{
  return a3 == 23;
}

- (BOOL)isEndpointTask:(unsigned __int16)a3
{
  int v3;
  CLDurianTask *v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  NSObject *v9;
  id v10;
  CLDurianTask *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  NSObject *v15;
  id v16;
  _BOOL4 v18;
  BOOL result;
  unsigned int v20;
  CLDurianTask *v21;
  uint64_t v22;
  CLDurianTask *v23;
  uint64_t v24;
  unsigned int v25;
  NSObject *v26;
  id v27;
  BOOL v28;
  BOOL v29;
  unsigned int v31;
  int v32;
  int v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  unsigned int v39;
  __int16 v40;
  int v41;

  v3 = a3;
  if (-[CLDurianDevice isPoshAccessory](self, "isPoshAccessory"))
  {
    v5 = -[CLDurianDevice activeTask](self, "activeTask");
    v7 = objc_opt_class(CLDurianGATTWriteTask, v6);
    if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
    {
      v8 = -[CLDurianCommand opcode](-[CLDurianTask command](-[CLDurianDevice activeTask](self, "activeTask"), "command"), "opcode");
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC538);
      v9 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
      {
        v10 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
        v32 = 68289795;
        v33 = 0;
        v34 = 2082;
        v35 = "";
        v36 = 2113;
        v37 = v10;
        v38 = 1026;
        v39 = v8;
        v40 = 1026;
        v41 = v3;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut endpoint check\", \"item\":%{private, location:escape_only}@, \"active\":%{public}d, \"param\":%{public}d}", (uint8_t *)&v32, 0x28u);
      }
      if (v3 == 771
        || v3 == 1029 && v8 == 1028
        || v3 == 2051 && v8 == 3
        || v3 == 2052 && v8 == 4
        || v3 == 2053 && v8 == 5
        || v3 == 2054 && v8 == 6
        || v3 == 2055 && v8 == 7
        || v3 == 2056 && v8 == 8
        || v3 == 2057 && v8 == 9
        || v3 == 2058 && v8 == 10
        || v3 == 2059 && v8 == 11
        || v3 == 2060 && v8 == 12)
      {
        return 1;
      }
    }
  }
  if (-[CLDurianDevice isAirTag](self, "isAirTag"))
  {
    v11 = -[CLDurianDevice activeTask](self, "activeTask");
    v13 = objc_opt_class(CLDurianGATTWriteTask, v12);
    if ((objc_opt_isKindOfClass(v11, v13) & 1) != 0)
    {
      v14 = -[CLDurianCommand opcode](-[CLDurianTask command](-[CLDurianDevice activeTask](self, "activeTask"), "command"), "opcode");
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC538);
      v15 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
      {
        v16 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
        v32 = 68289795;
        v33 = 0;
        v34 = 2082;
        v35 = "";
        v36 = 2113;
        v37 = v16;
        v38 = 1026;
        v39 = v14;
        v40 = 1026;
        v41 = v3;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #ut endpoint check\", \"item\":%{private, location:escape_only}@, \"active\":%{public}d, \"param\":%{public}d}", (uint8_t *)&v32, 0x28u);
      }
      if (v3 == 2054 && v14 == 2049 || v3 == 2055 && v14 == 2050 || v3 == 2056 && v14 - 2051 < 2)
        return 1;
      v18 = v3 != 2059 || v14 != 2053;
      result = 1;
      if (v3 == 2062 || !v18)
        return result;
    }
  }
  v20 = -[CLDurianDevice isHawkeyeAccessory](self, "isHawkeyeAccessory");
  v21 = -[CLDurianDevice activeTask](self, "activeTask");
  v23 = v21;
  if (!v20)
  {
    v31 = -[CLDurianCommand opcode](-[CLDurianTask command](v21, "command"), "opcode");
    if (((v3 - 23) > 2 || v31 != 181) && (v3 != 4 || v31 != 3))
      return v3 == 2056 && v31 == 2051;
    return 1;
  }
  v24 = objc_opt_class(CLHawkeyeTask, v22);
  if ((objc_opt_isKindOfClass(v23, v24) & 1) == 0)
    return 0;
  v25 = -[CLDurianTask hawkeyeOpcode](-[CLDurianDevice activeTask](self, "activeTask"), "hawkeyeOpcode");
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC538);
  v26 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v27 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
    v32 = 68289795;
    v33 = 0;
    v34 = 2082;
    v35 = "";
    v36 = 2113;
    v37 = v27;
    v38 = 1026;
    v39 = v25;
    v40 = 1026;
    v41 = v3;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye endpoint check\", \"item\":%{private, location:escape_only}@, \"active\":%{public}d, \"param\":%{public}d}", (uint8_t *)&v32, 0x28u);
  }
  if (v3 == 524 && v25 == 521 || v3 == 526 && v25 == 518)
    return 1;
  result = 1;
  if (v3 != 525
    && v3 != 532
    && v3 != 1282
    && (v3 != 530 || v25 != 529)
    && (v3 != 546 || v25 != 537)
    && (v3 != 547 || v25 != 538)
    && (v3 != 550 || v25 != 541))
  {
    v28 = v3 == 552 && v25 == 551;
    v29 = v28;
    if (v3 != 771
      && !v29
      && (v3 != 784 || v25 != 773)
      && (v3 != 785 || v25 != 774)
      && (v3 != 786 || v25 != 775)
      && (v3 != 787 || v25 != 776)
      && (v3 != 788 || v25 != 777)
      && (v3 != 790 || v25 != 779)
      && (v3 != 791 || v25 != 780)
      && (v3 != 792 || v25 != 781)
      && (v3 != 793 || v25 != 782)
      && ((v3 - 1026) > 3 || v3 == 1028)
      && (v3 != 1798 || v25 != 1793)
      && (v3 != 1799 || v25 != 1794)
      && (v3 != 1800 || v25 - 1795 >= 2))
    {
      return v3 == 1803 && v25 == 1797;
    }
  }
  return result;
}

- (BOOL)cancelAnyPendingPlaySound
{
  NSMutableArray *pendingTasks;
  id v4;
  id v5;
  BOOL v6;
  uint64_t v7;
  void *i;
  CLDurianTask *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  pendingTasks = self->_pendingTasks;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](pendingTasks, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v12;
  do
  {
    for (i = 0; i != v5; i = (char *)i + 1)
    {
      if (*(_QWORD *)v12 != v7)
        objc_enumerationMutation(pendingTasks);
      v9 = *(CLDurianTask **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
      if (v9 != self->_activeTask
        && -[CLDurianDevice isCancellablePlaySoundTask:](self, "isCancellablePlaySoundTask:", objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i), "translatedOpcode")))
      {
        -[CLDurianTask cancel](v9, "cancel");
        v6 = 1;
      }
    }
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](pendingTasks, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  }
  while (v5);
  return v6;
}

- (void)logTaskCounts:(id)a3
{
  NSObject *v5;
  id v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  _DWORD v10[2];
  __int16 v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  unsigned int v18;
  __int16 v19;
  unsigned int v20;
  __int16 v21;
  unsigned int v22;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC538);
  v5 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
    v7 = -[NSMutableArray count](self->_pendingTasks, "count");
    v8 = -[NSMutableArray count](self->_preemptedTasks, "count");
    v9 = -[CLDurianTask translatedOpcode](self->_activeTask, "translatedOpcode");
    v10[0] = 68290307;
    v10[1] = 0;
    v11 = 2082;
    v12 = "";
    v13 = 2113;
    v14 = v6;
    v15 = 2113;
    v16 = a3;
    v17 = 1025;
    v18 = v7;
    v19 = 1025;
    v20 = v8;
    v21 = 1026;
    v22 = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian task counts\", \"item\":%{private, location:escape_only}@, \"action\":%{private, location:escape_only}@, \"pending\":%{private}d, \"preempted\":%{private}d, \"active\":%{public}d}", (uint8_t *)v10, 0x38u);
  }
}

- (void)handleKeyRollData:(id)a3
{
  NSObject *v5;
  id v6;
  uint64_t lastObservedIndex;
  _DWORD v8[2];
  __int16 v9;
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  __int16 v15;
  uint64_t v16;

  if (-[CLDurianDevice isAirTag](self, "isAirTag"))
    self->_lastObservedIndex = *(_DWORD *)((char *)objc_msgSend(a3, "bytes") + 2);
  if (-[CLDurianDevice isHawkeyeAccessory](self, "isHawkeyeAccessory"))
    self->_lastObservedIndex = *(_DWORD *)((char *)objc_msgSend(a3, "bytes") + 3);
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC538);
  v5 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
    lastObservedIndex = self->_lastObservedIndex;
    v8[0] = 68289795;
    v8[1] = 0;
    v9 = 2082;
    v10 = "";
    v11 = 2113;
    v12 = v6;
    v13 = 2113;
    v14 = a3;
    v15 = 2050;
    v16 = lastObservedIndex;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian received key roll notification\", \"item\":%{private, location:escape_only}@, \"data\":%{private, location:escape_only}@, \"index\":%{public}ld}", (uint8_t *)v8, 0x30u);
  }
  -[CLDurianDeviceDelegate device:didReceiveKeyRollIndex:](-[CLDurianDevice delegate](self, "delegate"), "device:didReceiveKeyRollIndex:", self, self->_lastObservedIndex);
}

- (unsigned)numPendingTasks
{
  return -[NSMutableArray count](self->_pendingTasks, "count");
}

- (BOOL)isOnlyRemainingTask
{
  return -[NSMutableArray count](self->_pendingTasks, "count") == (id)1
      && -[NSMutableArray count](self->_preemptedTasks, "count") == 0;
}

- (void)failAllTasksWithError:(int64_t)a3
{
  uint64_t *v4;
  uint64_t *v5;
  NSObject *v6;
  id v7;
  NSObject *v9;
  id v10;
  id v11;
  unsigned int v12;
  unsigned int v13;
  CLDurianTask *activeTask;
  id v15;
  __int128 v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  NSObject *v21;
  id v22;
  unsigned int v23;
  id v24;
  unint64_t v25;
  id v26;
  __int128 v27;
  id v28;
  uint64_t v29;
  void *i;
  void *v31;
  NSObject *v32;
  id v33;
  unsigned int v34;
  id v35;
  id v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  NSMutableArray *obj;
  NSMutableArray *obja;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  NSErrorUserInfoKey v50;
  const __CFString *v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t buf;
  __int16 v55;
  const char *v56;
  __int16 v57;
  id v58;
  __int16 v59;
  int v60;
  __int16 v61;
  id v62;
  __int16 v63;
  _BYTE v64[10];

  v4 = &qword_1022A0000;
  v5 = &qword_1022A0000;
  if (self->_firmwareUpdateReboot)
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
    v6 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      buf = 68289283;
      v55 = 2082;
      v56 = "";
      v57 = 2113;
      v58 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian Rebooting after firmware update, wait before failing tasks\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x1Cu);
    }
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
    v9 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      v11 = -[CLDurianTask opcodeDescription](self->_activeTask, "opcodeDescription");
      v12 = -[NSMutableArray count](self->_pendingTasks, "count");
      v13 = -[NSMutableArray count](self->_preemptedTasks, "count");
      buf = 68290307;
      v55 = 2082;
      v56 = "";
      v57 = 2113;
      v58 = v10;
      v59 = 1026;
      v60 = a3;
      v61 = 2113;
      v62 = v11;
      v5 = &qword_1022A0000;
      v63 = 1026;
      *(_DWORD *)v64 = v12;
      v4 = &qword_1022A0000;
      *(_WORD *)&v64[4] = 1026;
      *(_DWORD *)&v64[6] = v13;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian failing all tasks\", \"item\":%{private, location:escape_only}@, \"error\":%{public}d, \"active\":%{private, location:escape_only}@, \"pending\":%{public}d, \"preempted\":%{public}d}", (uint8_t *)&buf, 0x38u);
    }
    activeTask = self->_activeTask;
    if (activeTask)
    {
      -[CLDurianDevice cancelTimeoutForTask:dictionary:](self, "cancelTimeoutForTask:dictionary:", activeTask, self->_activeTaskTimeouts);
      -[CLDurianDevice setActiveTask:](self, "setActiveTask:", 0);
    }
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    obj = self->_pendingTasks;
    v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
    if (v15)
    {
      v17 = v15;
      v18 = *(_QWORD *)v47;
      *(_QWORD *)&v16 = 68290051;
      v38 = v16;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v47 != v18)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)v19);
          if (qword_1022A0030 != -1)
            dispatch_once(&qword_1022A0030, &stru_1021BC538);
          v21 = qword_1022A0038;
          if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
          {
            v22 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
            v23 = objc_msgSend(objc_msgSend(v20, "command"), "opcode");
            v24 = -[CBPeripheral identifier](self->_activePeripheral, "identifier");
            buf = v38;
            v55 = 2082;
            v56 = "";
            v57 = 2113;
            v58 = v22;
            v5 = &qword_1022A0000;
            v59 = 1026;
            v60 = v23;
            v4 = &qword_1022A0000;
            v61 = 2114;
            v62 = v24;
            v63 = 2113;
            *(_QWORD *)v64 = v20;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian failing task\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d, \"peripheralUUID\":%{public, location:escape_only}@, \"task\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x36u);
          }
          if (objc_msgSend(objc_msgSend(v20, "command", v38), "opcode") == 14)
            -[CLDurianDevice setMutexState:](self, "setMutexState:", 0);
          -[CLDurianDeviceDelegate device:didFailToCompleteTask:withError:andDisconnect:](-[CLDurianDevice delegate](self, "delegate"), "device:didFailToCompleteTask:withError:andDisconnect:", self, v20, a3, 1);
          if (objc_msgSend(objc_msgSend(v20, "command"), "opcode") == 527)
            self->_btFindingState = 0;
          v19 = (char *)v19 + 1;
        }
        while (v17 != v19);
        v17 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
      }
      while (v17);
    }
    v25 = a3;
    -[NSMutableArray removeAllObjects](self->_pendingTasks, "removeAllObjects");
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    obja = self->_preemptedTasks;
    v26 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
    if (v26)
    {
      v28 = v26;
      v29 = *(_QWORD *)v43;
      *(_QWORD *)&v27 = 68290051;
      v39 = v27;
      do
      {
        for (i = 0; i != v28; i = (char *)i + 1)
        {
          if (*(_QWORD *)v43 != v29)
            objc_enumerationMutation(obja);
          v31 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)i);
          if (v4[6] != -1)
            dispatch_once(&qword_1022A0030, &stru_1021BC538);
          v32 = v5[7];
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            v33 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
            v34 = objc_msgSend(objc_msgSend(v31, "command"), "opcode");
            v35 = objc_msgSend(objc_msgSend(-[CBPeripheral identifier](self->_activePeripheral, "identifier"), "description"), "substringToIndex:", 8);
            buf = v39;
            v55 = 2082;
            v56 = "";
            v57 = 2113;
            v58 = v33;
            v5 = &qword_1022A0000;
            v59 = 1026;
            v60 = v34;
            v4 = &qword_1022A0000;
            v61 = 2113;
            v62 = v35;
            v63 = 2113;
            *(_QWORD *)v64 = v31;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian failing preempted task\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d, \"periph\":%{private, location:escape_only}@, \"task\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x36u);
          }
          -[CLDurianDeviceDelegate device:didFailToCompleteTask:withError:andDisconnect:](-[CLDurianDevice delegate](self, "delegate", v39), "device:didFailToCompleteTask:withError:andDisconnect:", self, v31, v25, 1);
          -[CLDurianDevice cancelTimeoutForTask:dictionary:](self, "cancelTimeoutForTask:dictionary:", v31, self->_preemptedTaskTimeouts);
        }
        v28 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
      }
      while (v28);
    }
    -[NSMutableArray removeAllObjects](self->_preemptedTasks, "removeAllObjects");
    if (self->_preparingForRanging)
    {
      v36 = objc_alloc((Class)NSError);
      v37 = kCLErrorDomainPrivate;
      v50 = NSLocalizedDescriptionKey;
      v51 = sub_101536DEC(v25);
      -[CLDurianDeviceDelegate device:didPrepareForRangingWithError:](-[CLDurianDevice delegate](self, "delegate"), "device:didPrepareForRangingWithError:", self, objc_msgSend(v36, "initWithDomain:code:userInfo:", v37, v25, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1)));
    }
    -[CLDurianDevice logTaskCounts:](self, "logTaskCounts:", CFSTR("failall"));
    *(_WORD *)&self->_isPlayingSound = 0;
    self->_preparingForRanging = 0;
    self->_pendingSoundTask = 0;
  }
}

- (void)requestDiscoveryScan
{
  NSObject *v3;
  id v4;
  NSObject *v5;
  id v6;
  int v7;
  int v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  id v12;

  if ((objc_opt_respondsToSelector(-[CLDurianDevice delegate](self, "delegate"), "requestDiscoveryScan") & 1) != 0)
  {
    -[CLDurianDeviceDelegate requestDiscoveryScan](-[CLDurianDevice delegate](self, "delegate"), "requestDiscoveryScan");
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
    v3 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_FAULT))
    {
      v4 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      v7 = 68289283;
      v8 = 0;
      v9 = 2082;
      v10 = "";
      v11 = 2113;
      v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#durian no delegate or method for scan requests\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v7, 0x1Cu);
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC538);
    }
    v5 = qword_1022A0038;
    if (os_signpost_enabled((os_log_t)qword_1022A0038))
    {
      v6 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      v7 = 68289283;
      v8 = 0;
      v9 = 2082;
      v10 = "";
      v11 = 2113;
      v12 = v6;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian no delegate or method for scan requests", "{\"msg%{public}.0s\":\"#durian no delegate or method for scan requests\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v7, 0x1Cu);
    }
  }
}

- (double)getLastCarScanTime
{
  double result;

  -[CLDurianDeviceDelegate getLastCarScanTime](-[CLDurianDevice delegate](self, "delegate"), "getLastCarScanTime");
  return result;
}

- (void)acquireMutexForTask:(id)a3
{
  NSObject *v5;
  id v6;
  unint64_t mutexState;
  _DWORD v8[2];
  __int16 v9;
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  int v14;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC538);
  v5 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
    mutexState = self->_mutexState;
    v8[0] = 68289539;
    v8[1] = 0;
    v9 = 2082;
    v10 = "";
    v11 = 2113;
    v12 = v6;
    v13 = 1026;
    v14 = mutexState;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #mutex acquire\", \"item\":%{private, location:escape_only}@, \"prior state\":%{public}d}", (uint8_t *)v8, 0x22u);
  }
  if ((self->_mutexState | 2) == 2)
  {
    -[CLDurianDevice enqueueTask:](self, "enqueueTask:", +[CLDurianTask setMutexAction:withLatency:](CLDurianTask, "setMutexAction:withLatency:", 1, objc_msgSend(a3, "desiredLatency")));
    -[CLDurianDevice setMutexState:](self, "setMutexState:", 1);
  }
}

- (void)releaseMutexWithReason:(id)a3
{
  NSObject *v5;
  id v6;
  unint64_t mutexState;
  _DWORD v8[2];
  __int16 v9;
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  id v14;
  __int16 v15;
  int v16;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC538);
  v5 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
    mutexState = self->_mutexState;
    v8[0] = 68289795;
    v8[1] = 0;
    v9 = 2082;
    v10 = "";
    v11 = 2113;
    v12 = v6;
    v13 = 2113;
    v14 = a3;
    v15 = 1026;
    v16 = mutexState;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #mutex release\", \"item\":%{private, location:escape_only}@, \"reason\":%{private, location:escape_only}@, \"prior state\":%{public}d}", (uint8_t *)v8, 0x2Cu);
  }
  if ((self->_mutexState | 2) == 3)
  {
    -[CLDurianDevice enqueueTask:](self, "enqueueTask:", +[CLDurianTask setMutexAction:](CLDurianTask, "setMutexAction:", 0));
    -[CLDurianDevice setMutexState:](self, "setMutexState:", 2);
  }
}

- (void)handleMutexErrorOnAction:(unint64_t)a3
{
  uint64_t *v5;
  NSObject *v6;
  id v7;
  unsigned int v8;
  NSMutableArray *pendingTasks;
  id v10;
  __int128 v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  unsigned int v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t *v19;
  id v20;
  unsigned int v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  unsigned int v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];

  v5 = &qword_1022A0000;
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC538);
  v6 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
    v8 = -[NSMutableArray count](self->_pendingTasks, "count");
    *(_DWORD *)buf = 68289795;
    v28 = 0;
    v29 = 2082;
    v30 = "";
    v31 = 2113;
    v32 = v7;
    v33 = 1026;
    v34 = v8;
    v35 = 1026;
    LODWORD(v36) = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #mutex error\", \"item\":%{private, location:escape_only}@, \"tasks\":%{public}d, \"action\":%{public}d}", buf, 0x28u);
  }
  if (a3 == 1)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    pendingTasks = self->_pendingTasks;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](pendingTasks, "countByEnumeratingWithState:objects:count:", &v23, v37, 16);
    if (v10)
    {
      v12 = v10;
      v13 = *(_QWORD *)v24;
      *(_QWORD *)&v11 = 68289795;
      v22 = v11;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v24 != v13)
            objc_enumerationMutation(pendingTasks);
          v15 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
          v16 = objc_msgSend(objc_msgSend(v15, "command", v22), "opcode");
          if ((objc_msgSend(v15, "isMutexProtectedSoundTask") & 1) != 0)
          {
            v17 = 13;
          }
          else if ((objc_msgSend(v15, "isMutexProtectedRangingTask") & 1) != 0)
          {
            v17 = 12;
          }
          else if (v16 == 19)
          {
            v17 = 14;
          }
          else
          {
            if (!objc_msgSend(v15, "requiresMutex"))
              continue;
            v17 = 16;
          }
          -[CLDurianDeviceDelegate device:didFailToCompleteTask:withError:andDisconnect:](-[CLDurianDevice delegate](self, "delegate"), "device:didFailToCompleteTask:withError:andDisconnect:", self, v15, v17, 0);
          objc_msgSend(v15, "cancel");
          if (v5[6] != -1)
            dispatch_once(&qword_1022A0030, &stru_1021BC538);
          v18 = qword_1022A0038;
          if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
          {
            v19 = v5;
            v20 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
            v21 = objc_msgSend(objc_msgSend(v15, "command"), "opcode");
            *(_DWORD *)buf = v22;
            v28 = 0;
            v29 = 2082;
            v30 = "";
            v31 = 2113;
            v32 = v20;
            v5 = v19;
            v33 = 1026;
            v34 = v21;
            v35 = 2113;
            v36 = v15;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #mutex cancelling task\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d, \"task\":%{private, location:escape_only}@}", buf, 0x2Cu);
          }
        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](pendingTasks, "countByEnumeratingWithState:objects:count:", &v23, v37, 16);
      }
      while (v12);
    }
  }
}

- (void)handleMutexAlreadyHeldOnTask:(id)a3
{
  NSObject *v5;
  id v6;
  unint64_t mutexState;
  CLDurianDeviceDelegate *v8;
  CLDurianDevice *v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  unint64_t v14;
  int v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  int v22;
  __int16 v23;
  unsigned int v24;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC538);
  v5 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
    mutexState = self->_mutexState;
    v15 = 68289795;
    v16 = 0;
    v17 = 2082;
    v18 = "";
    v19 = 2113;
    v20 = v6;
    v21 = 1025;
    v22 = mutexState;
    v23 = 1026;
    v24 = objc_msgSend(objc_msgSend(a3, "command"), "opcode");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #mutex locked by another\", \"item\":%{private, location:escape_only}@, \"mutexState\":%{private}d, \"opcode\":%{public}d}", (uint8_t *)&v15, 0x28u);
  }
  if (objc_msgSend(a3, "isMutexProtectedSoundTask"))
  {
    v8 = -[CLDurianDevice delegate](self, "delegate");
    v9 = self;
    v10 = a3;
    v11 = 13;
LABEL_9:
    -[CLDurianDeviceDelegate device:didFailToCompleteTask:withError:andDisconnect:](v8, "device:didFailToCompleteTask:withError:andDisconnect:", v9, v10, v11, 0);
    return;
  }
  if (objc_msgSend(a3, "isMutexProtectedRangingTask"))
  {
    v8 = -[CLDurianDevice delegate](self, "delegate");
    v9 = self;
    v10 = a3;
    v11 = 12;
    goto LABEL_9;
  }
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC538);
  v12 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v13 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
    v14 = self->_mutexState;
    v15 = 68289539;
    v16 = 0;
    v17 = 2082;
    v18 = "";
    v19 = 2113;
    v20 = v13;
    v21 = 1025;
    v22 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #mutex fail on unprotected opcode\", \"item\":%{private, location:escape_only}@, \"mutexState\":%{private}d}", (uint8_t *)&v15, 0x22u);
  }
}

- (void)handleMultiStatusReply:(unint64_t)a3
{
  int v3;
  uint64_t v5;
  id v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  uint64_t v10;
  id v11;
  unsigned int v12;
  uint64_t v13;
  _BYTE v14[32];
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;

  v3 = a3;
  if (-[CLDurianDevice isAirTag](self, "isAirTag"))
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
    v5 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      v13 = 68291331;
      *(_WORD *)v14 = 2082;
      *(_QWORD *)&v14[2] = "";
      *(_WORD *)&v14[10] = 2113;
      *(_QWORD *)&v14[12] = v6;
      *(_WORD *)&v14[20] = 1025;
      *(_DWORD *)&v14[22] = v3;
      *(_WORD *)&v14[26] = 1025;
      *(_DWORD *)&v14[28] = v3 & 1;
      LOWORD(v15) = 1025;
      *(_DWORD *)((char *)&v15 + 2) = v3 & 2;
      HIWORD(v15) = 1025;
      LODWORD(v16) = v3 & 4;
      WORD2(v16) = 1025;
      *(_DWORD *)((char *)&v16 + 6) = v3 & 8;
      WORD5(v16) = 1025;
      HIDWORD(v16) = v3 & 0x10;
      LOWORD(v17) = 1025;
      *(_DWORD *)((char *)&v17 + 2) = v3 & 0x20;
      HIWORD(v17) = 1025;
      LODWORD(v18) = v3 & 0x40;
      v7 = "{\"msg%{public}.0s\":\"#durian #multi status\", \"item\":%{private, location:escape_only}@, \"status\":%{priv"
           "ate}d, \"leashed\":%{private}d, \"ranging\":%{private}d, \"sound\":%{private}d, \"fwdl\":%{private}d, \"rosei"
           "nit\":%{private}d, \"encrypted\":%{private}d, \"mutex\":%{private}d}";
      v8 = v5;
      v9 = 76;
LABEL_11:
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v13, v9);
    }
  }
  else if (-[CLDurianDevice isHawkeyeAccessory](self, "isHawkeyeAccessory"))
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
    v10 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      v13 = 68290819;
      *(_WORD *)v14 = 2082;
      *(_QWORD *)&v14[2] = "";
      *(_WORD *)&v14[10] = 2113;
      *(_QWORD *)&v14[12] = v11;
      *(_WORD *)&v14[20] = 1025;
      *(_DWORD *)&v14[22] = v3;
      *(_WORD *)&v14[26] = 1025;
      *(_DWORD *)&v14[28] = v3 & 1;
      LOWORD(v15) = 1025;
      *(_DWORD *)((char *)&v15 + 2) = v3 & 4;
      HIWORD(v15) = 1025;
      LODWORD(v16) = v3 & 8;
      WORD2(v16) = 1025;
      *(_DWORD *)((char *)&v16 + 6) = v3 & 0x20;
      WORD5(v16) = 1025;
      HIDWORD(v16) = v3 & 0x40;
      v7 = "{\"msg%{public}.0s\":\"#durian #multi status\", \"item\":%{private, location:escape_only}@, \"status\":%{priv"
           "ate}d, \"leashed\":%{private}d, \"sound\":%{private}d, \"fwdl\":%{private}d, \"encrypted\":%{private}d, \"oth"
           "erconnected\":%{private}d}";
      v8 = v10;
      v9 = 64;
      goto LABEL_11;
    }
  }
  v12 = -[CLDurianDevice isAirTag](self, "isAirTag", v13, *(_OWORD *)v14, *(_OWORD *)&v14[16], v15, v16, v17, v18);
  if ((v3 & 0x40) == 0 || v12)
    -[CLDurianDevice sendHelloSequence](self, "sendHelloSequence");
}

- (void)handleGroupStatusReply:(id)a3
{
  unsigned __int8 *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  _DWORD v10[2];
  __int16 v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;

  if (-[CLDurianDevice isHawkeyeAccessory](self, "isHawkeyeAccessory"))
  {
    v5 = (unsigned __int8 *)objc_msgSend(a3, "bytes");
    v6 = v5[3];
    if ((unint64_t)objc_msgSend(a3, "length") < 5)
      v7 = 255;
    else
      v7 = v5[4];
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
    v8 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      v10[0] = 68289795;
      v10[1] = 0;
      v11 = 2082;
      v12 = "";
      v13 = 2113;
      v14 = v9;
      v15 = 1026;
      v16 = v6;
      v17 = 1026;
      v18 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian groupstatus\", \"item\":%{private, location:escape_only}@, \"maint\":%{public}d, \"relation\":%{public}d}", (uint8_t *)v10, 0x28u);
    }
    -[CLDurianDeviceDelegate device:didReceiveGroupRelationStatus:andMainteanceStatus:](-[CLDurianDevice delegate](self, "delegate"), "device:didReceiveGroupRelationStatus:andMainteanceStatus:", self, v7, v6);
  }
}

- (void)handleMultiDownloading
{
  NSObject *v3;
  id v4;
  _DWORD v5[2];
  __int16 v6;
  const char *v7;
  __int16 v8;
  id v9;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC538);
  v3 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
    v5[0] = 68289283;
    v5[1] = 0;
    v6 = 2082;
    v7 = "";
    v8 = 2113;
    v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #multi abortfwdl\", \"item\":%{private, location:escape_only}@}", (uint8_t *)v5, 0x1Cu);
  }
  -[CLDurianDevice enqueueTask:](self, "enqueueTask:", +[CLDurianTask fwdlAbortTask](CLDurianTask, "fwdlAbortTask"));
}

- (BOOL)isAttemptingConnection
{
  return (id)-[CLDurianConnectionAttempt state](self->_activeConnectionAttempt, "state") == (id)1;
}

- (int)numPossiblePeripherals
{
  return -[NSArray count](-[CLDurianConnectionAttempt possiblePeripherals](self->_activeConnectionAttempt, "possiblePeripherals"), "count");
}

- (BOOL)isConnected
{
  return (id)-[CBPeripheral state](self->_activePeripheral, "state") == (id)2;
}

- (BOOL)isLeashable
{
  return self->_leashState != 0;
}

- (BOOL)isLeashSlotInUse
{
  return (self->_leashState & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (void)resetLeashState
{
  NSObject *v3;
  id v4;
  unint64_t leashState;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;
  __int16 v9;
  id v10;
  __int16 v11;
  int v12;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC538);
  v3 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
    leashState = self->_leashState;
    v6[0] = 68289539;
    v6[1] = 0;
    v7 = 2082;
    v8 = "";
    v9 = 2113;
    v10 = v4;
    v11 = 1026;
    v12 = leashState;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #leash reset state\", \"item\":%{private, location:escape_only}@, \"prior\":%{public}d}", (uint8_t *)v6, 0x22u);
  }
  if (-[CLDurianDevice isLeashSlotInUse](self, "isLeashSlotInUse"))
    self->_leashState = 1;
}

- (BOOL)leashNeedsConfiguring
{
  return self->_leashState != 3;
}

- (NSData)address
{
  if (self->_activePeripheral)
    return (NSData *)-[CLFindMyAccessoryConnectionMaterial address](self->_activePeripheralMaterial, "address");
  else
    return 0;
}

- (void)handleFailureToConnectWithError:(int64_t)a3
{
  NSObject *v5;
  id v6;
  id v7;
  uint64_t v8;
  double v9;
  NSObject *v10;
  id v11;
  id v12;
  uint64_t v13;
  NSDictionary *v14;
  id v15;
  NSErrorUserInfoKey v16;
  const __CFString *v17;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  int v27;
  __int16 v28;
  uint64_t v29;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC538);
  v5 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
    v7 = objc_msgSend(-[NSUUID description](-[CLDurianConnectionAttempt identifier](self->_activeConnectionAttempt, "identifier"), "description"), "substringToIndex:", 8);
    -[CLDurianConnectionAttempt attemptDuration](self->_activeConnectionAttempt, "attemptDuration");
    *(_DWORD *)buf = 68290051;
    v19 = 0;
    v20 = 2082;
    v21 = "";
    v22 = 2113;
    v23 = v6;
    v24 = 2113;
    v25 = v7;
    v26 = 1026;
    v27 = a3;
    v28 = 2050;
    v29 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connectattempt failure\", \"item\":%{private, location:escape_only}@, \"attemptId\":%{private, location:escape_only}@, \"error\":%{public}d, \"ttc\":\"%{public}.1f\"}", buf, 0x36u);
  }
  self->_maintenanceOnlyCondition = 0;
  if (-[CLDurianConnectionAttempt connectionAttemptCount](-[CLDurianDevice activeConnectionAttempt](self, "activeConnectionAttempt"), "connectionAttemptCount"))
  {
    -[CLDurianDevice intervalSinceLastSearchPartyKeyObservation](self, "intervalSinceLastSearchPartyKeyObservation");
    +[CLDurianMetricManager submitConnectionAttemptEvent:numberBTConnectionAttempts:connectionReason:deviceType:](CLDurianMetricManager, "submitConnectionAttemptEvent:numberBTConnectionAttempts:connectionReason:deviceType:", -[CLDurianConnectionAttempt connectionAttemptCount](-[CLDurianDevice activeConnectionAttempt](self, "activeConnectionAttempt"), "connectionAttemptCount"), -[CLDurianDevice getConnectionReason](self, "getConnectionReason"), -[CLDurianDevice prettyBeaconType](self, "prettyBeaconType"), v9);
  }
  -[CLDurianDevice clearConnectionAttemptReasons](self, "clearConnectionAttemptReasons");
  self->_isProactiveAttempt = 0;
  -[CLDurianDevice resetLeashState](self, "resetLeashState");
  -[CLDurianDevice transitionToState:event:task:](self, "transitionToState:event:task:", 0, 4, 0);
  -[CLDurianDevice failAllTasksWithError:](self, "failAllTasksWithError:", a3);
  -[CLDurianDeviceDelegate didFailToConnectDevice:withError:](-[CLDurianDevice delegate](self, "delegate"), "didFailToConnectDevice:withError:", self, a3);
  if (self->_firmwareUpdateMode)
  {
    if (!self->_firmwareUpdateReboot)
    {
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC538);
      v10 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
      {
        v11 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
        *(_DWORD *)buf = 68289283;
        v19 = 0;
        v20 = 2082;
        v21 = "";
        v22 = 2113;
        v23 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian fwdl failure exit\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
      }
      v12 = objc_alloc((Class)NSError);
      v13 = kCLErrorDomainPrivate;
      v16 = NSLocalizedDescriptionKey;
      v17 = sub_101536DEC(a3);
      v14 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v17, &v16, 1);
      v15 = objc_msgSend(v12, "initWithDomain:code:userInfo:", v13, a3, v14, v16);
      -[CLDurianDevice informFirmwareUpdateFailureToClientWithError:](self, "informFirmwareUpdateFailureToClientWithError:", v15);

    }
    -[CLDurianDevice exitFirmwareUpdateMode](self, "exitFirmwareUpdateMode");
  }
}

- (void)removePossiblePeripheral:(id)a3
{
  _BOOL4 v5;
  _BOOL4 v6;
  NSObject *v7;
  id v8;
  int v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  int v14;
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  _BYTE v21[10];
  id v22;
  _BYTE v23[6];
  _BOOL4 v24;
  __int16 v25;
  _BOOL4 v26;

  -[CLDurianConnectionAttempt removePossiblePeripheral:](-[CLDurianDevice activeConnectionAttempt](self, "activeConnectionAttempt"), "removePossiblePeripheral:", a3);
  if (-[CLDurianDevice activePeripheral](self, "activePeripheral"))
    v5 = 0;
  else
    v5 = (id)-[CLDurianConnectionAttempt state](-[CLDurianDevice activeConnectionAttempt](self, "activeConnectionAttempt"), "state") == (id)3;
  if (-[CLDurianDevice pendingConnectionAttempt](self, "pendingConnectionAttempt"))
    v6 = (id)-[CLDurianConnectionAttempt state](-[CLDurianDevice pendingConnectionAttempt](self, "pendingConnectionAttempt"), "state") == (id)3;
  else
    v6 = 1;
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC538);
  v7 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEBUG))
  {
    v8 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
    v14 = 68290819;
    v15 = 0;
    v16 = 2082;
    v17 = "";
    v18 = 2113;
    v19 = v8;
    v20 = 1026;
    *(_DWORD *)v21 = v5;
    *(_WORD *)&v21[4] = 1026;
    *(_DWORD *)&v21[6] = v6;
    LOWORD(v22) = 1026;
    *(_DWORD *)((char *)&v22 + 2) = -[CLDurianDevice activePeripheral](self, "activePeripheral") != 0;
    HIWORD(v22) = 1026;
    *(_DWORD *)v23 = (id)-[CLDurianConnectionAttempt state](-[CLDurianDevice activeConnectionAttempt](self, "activeConnectionAttempt"), "state") == (id)3;
    *(_WORD *)&v23[4] = 1026;
    v24 = -[CLDurianDevice pendingConnectionAttempt](self, "pendingConnectionAttempt") != 0;
    v25 = 1026;
    v26 = (id)-[CLDurianConnectionAttempt state](-[CLDurianDevice activeConnectionAttempt](self, "activeConnectionAttempt"), "state") == (id)3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#durian #connection failcheck\", \"item\":%{private, location:escape_only}@, \"active\":%{public}hhd, \"pending\":%{public}hhd, \"activePeriph\":%{public}hhd, \"activeState\":%{public}hhd, \"pendingAttempt\":%{public}hhd, \"pendingState\":%{public}hhd}", (uint8_t *)&v14, 0x40u);
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
  }
  v9 = v5 && v6;
  v10 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
    v12 = objc_msgSend(-[NSUUID description](-[CLDurianConnectionAttempt identifier](self->_activeConnectionAttempt, "identifier"), "description"), "substringToIndex:", 8);
    v13 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "identifier"), "description"), "substringToIndex:", 8);
    v14 = 68290051;
    v15 = 0;
    v16 = 2082;
    v17 = "";
    v18 = 2113;
    v19 = v11;
    v20 = 2113;
    *(_QWORD *)v21 = v12;
    *(_WORD *)&v21[8] = 2113;
    v22 = v13;
    *(_WORD *)v23 = 1026;
    *(_DWORD *)&v23[2] = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connectattempt remove peripheral\", \"item\":%{private, location:escape_only}@, \"attemptId\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@, \"failed\":%{public}hhd}", (uint8_t *)&v14, 0x36u);
  }
  if (v9)
    -[CLDurianDevice handleFailureToConnectWithError:](self, "handleFailureToConnectWithError:", 3);
}

- (void)removeAllPossiblePeripherals
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v3 = -[NSArray copy](-[CLDurianConnectionAttempt possiblePeripherals](-[CLDurianDevice activeConnectionAttempt](self, "activeConnectionAttempt"), "possiblePeripherals"), "copy");
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[CLDurianDevice removePossiblePeripheral:](self, "removePossiblePeripheral:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v7));
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (double)secondsSinceLastDisconnection
{
  uint64_t v2;
  double result;

  v2 = mach_continuous_time() - self->_lastDisconnectionTime;
  TMConvertTicksToSeconds(v2);
  return result;
}

- (double)secondsSinceLastProactiveMaintenanceAttempt
{
  uint64_t v2;
  double result;

  v2 = mach_continuous_time() - self->_lastProactiveMaintenanceTime;
  TMConvertTicksToSeconds(v2);
  return result;
}

- (void)setActivePeripheral:(id)a3
{
  NSObject *v4;
  id v5;
  double v6;
  id latencyTimeoutBlock;
  _DWORD v8[2];
  __int16 v9;
  const char *v10;
  __int16 v11;
  id v12;

  -[CLDurianDevice setActivePeripheral:withError:](self, "setActivePeripheral:withError:", a3, 0);
  if (-[CLDurianDevice activePeripheral](self, "activePeripheral"))
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
    v4 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_INFO))
    {
      v5 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      v8[0] = 68289283;
      v8[1] = 0;
      v9 = 2082;
      v10 = "";
      v11 = 2113;
      v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#durian #latency initializing\", \"item\":%{private, location:escape_only}@}", (uint8_t *)v8, 0x1Cu);
    }
    sub_101536DD8();
    self->_currentLatencyStartTime = v6;
    self->_currentLatency = 0;
    self->_commandedLatencyTime = v6;
    self->_commandedLatency = 0;
    self->_latencyCommandResponseArrived = 1;
    latencyTimeoutBlock = self->_latencyTimeoutBlock;
    if (latencyTimeoutBlock)
      _Block_release(latencyTimeoutBlock);
    self->_latencyTimeoutBlock = 0;
  }
}

- (void)activate
{
  CLFindMyAccessoryConnectionMaterial *activePeripheralMaterial;
  NSObject *v4;
  id v5;
  unsigned int lastObservedIndex;
  _DWORD v7[2];
  __int16 v8;
  const char *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  unsigned int v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;

  -[CLDurianDeviceDelegate cancelConnectionTimeoutForPeripheral:](self->_delegate, "cancelConnectionTimeoutForPeripheral:", -[CLDurianDevice activePeripheral](self, "activePeripheral"));
  self->_preparingForRanging = 0;
  -[CLDurianDevice setDesiredConnectionLatency](self, "setDesiredConnectionLatency");
  -[CLDurianDevice transitionToState:event:task:](self, "transitionToState:event:task:", 4, 7, 0);
  -[CLDurianDevice setActivePeripheralReady:](self, "setActivePeripheralReady:", 1);
  activePeripheralMaterial = self->_activePeripheralMaterial;
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC538);
  v4 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
    lastObservedIndex = self->_lastObservedIndex;
    v7[0] = 68290051;
    v7[1] = 0;
    v8 = 2082;
    v9 = "";
    v10 = 2113;
    v11 = v5;
    v12 = 1026;
    v13 = lastObservedIndex;
    v14 = 2114;
    v15 = -[CLFindMyAccessoryConnectionMaterial primaryIndex](activePeripheralMaterial, "primaryIndex");
    v16 = 2114;
    v17 = -[CLFindMyAccessoryConnectionMaterial secondaryIndex](activePeripheralMaterial, "secondaryIndex");
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connection activate\", \"item\":%{private, location:escape_only}@, \"prior lastObserved\":%{public}d, \"primaryIndex\":%{public, location:escape_only}@, \"secondaryIndex\":%{public, location:escape_only}@}", (uint8_t *)v7, 0x36u);
  }
  if (!-[CLDurianDevice isHawkeyeAccessory](self, "isHawkeyeAccessory"))
    self->_lastObservedIndex = objc_msgSend(-[CLFindMyAccessoryConnectionMaterial primaryIndex](-[CLDurianDevice activePeripheralMaterial](self, "activePeripheralMaterial"), "primaryIndex"), "unsignedIntValue");
}

- (void)discoverHawkeyeService
{
  NSArray *v3;
  NSObject *v4;
  id v5;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;
  __int16 v9;
  id v10;
  __int16 v11;
  unsigned int v12;
  __int16 v13;
  NSArray *v14;
  _QWORD v15[4];

  v15[0] = +[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID");
  v15[1] = +[CBUUID _cl_HawkeyeAccessoryInformationServiceUUID](CBUUID, "_cl_HawkeyeAccessoryInformationServiceUUID");
  v15[2] = +[CBUUID _cl_HawkeyeAccessoryFirmwareUpdateServiceUUID](CBUUID, "_cl_HawkeyeAccessoryFirmwareUpdateServiceUUID");
  v15[3] = +[CBUUID _cl_BtTxPowerServiceUUID](CBUUID, "_cl_BtTxPowerServiceUUID");
  v3 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 4);
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC538);
  v4 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
    v6[0] = 68289795;
    v6[1] = 0;
    v7 = 2082;
    v8 = "";
    v9 = 2113;
    v10 = v5;
    v11 = 1026;
    v12 = -[NSArray count](v3, "count");
    v13 = 2113;
    v14 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye requesting service-discovery\", \"item\":%{private, location:escape_only}@, \"count\":%{public}d, \"service\":%{private, location:escape_only}@}", (uint8_t *)v6, 0x2Cu);
  }
  -[CBPeripheral discoverServices:](self->_activePeripheral, "discoverServices:", v3);
}

- (void)discoverPoshService
{
  NSArray *v3;
  NSObject *v4;
  id v5;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;
  __int16 v9;
  id v10;
  __int16 v11;
  unsigned int v12;
  __int16 v13;
  NSArray *v14;
  id v15;

  v15 = +[CBUUID _cl_PoshAccessoryNonOwnerServiceUUID](CBUUID, "_cl_PoshAccessoryNonOwnerServiceUUID");
  v3 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v15, 1);
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC538);
  v4 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
    v6[0] = 68289795;
    v6[1] = 0;
    v7 = 2082;
    v8 = "";
    v9 = 2113;
    v10 = v5;
    v11 = 1026;
    v12 = -[NSArray count](v3, "count");
    v13 = 2113;
    v14 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh requesting service-discovery\", \"item\":%{private, location:escape_only}@, \"count\":%{public}d, \"service\":%{private, location:escape_only}@}", (uint8_t *)v6, 0x2Cu);
  }
  -[CBPeripheral discoverServices:](self->_activePeripheral, "discoverServices:", v3);
}

+ (id)_convertTASPAdvertisementDeviceTypeToSPBeaconType:(unint64_t)a3
{
  id *v3;

  if (a3 - 1 > 2)
    v3 = (id *)&SPBeaconTypeNone;
  else
    v3 = (id *)*(&off_1021BC558 + a3 - 1);
  return *v3;
}

- (id)getBeaconType
{
  SPSimpleBeacon *beacon;
  TAUnknownBeacon *taUnknownBeacon;
  NSObject *v6;
  id v7;
  NSObject *v8;
  id v9;
  int v10;
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;

  beacon = self->_beacon;
  if (beacon)
    return -[SPSimpleBeacon type](beacon, "type");
  beacon = self->_unownedBeacon;
  if (beacon)
    return -[SPSimpleBeacon type](beacon, "type");
  taUnknownBeacon = self->_taUnknownBeacon;
  if (taUnknownBeacon)
    return +[CLDurianDevice _convertTASPAdvertisementDeviceTypeToSPBeaconType:](CLDurianDevice, "_convertTASPAdvertisementDeviceTypeToSPBeaconType:", -[TAUnknownBeacon deviceType](taUnknownBeacon, "deviceType"));
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC538);
  v6 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
  {
    v7 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
    v10 = 68289283;
    v11 = 0;
    v12 = 2082;
    v13 = "";
    v14 = 2113;
    v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian beacon type requested with no valid beacon\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v10, 0x1Cu);
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
  }
  v8 = qword_1022A0038;
  if (os_signpost_enabled((os_log_t)qword_1022A0038))
  {
    v9 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
    v10 = 68289283;
    v11 = 0;
    v12 = 2082;
    v13 = "";
    v14 = 2113;
    v15 = v9;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian beacon type requested with no valid beacon", "{\"msg%{public}.0s\":\"#durian beacon type requested with no valid beacon\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v10, 0x1Cu);
  }
  return (id)SPBeaconTypeNone;
}

- (NSString)accessoryTypeName
{
  unsigned int v3;
  unsigned int v4;
  const __CFString *v5;
  const __CFString *v6;
  unsigned int v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  unsigned int v12;
  const __CFString *v13;
  NSString *v14;
  __CFString *v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD v19[4];
  _QWORD v20[3];
  _QWORD v21[2];

  v3 = -[CLDurianDevice isAirTag](self, "isAirTag");
  v4 = v3;
  if (v3)
    v5 = CFSTR("Apple");
  else
    v5 = CFSTR("Unknown");
  if (v3)
    v6 = CFSTR("D");
  else
    v6 = CFSTR("Unknown");
  v7 = -[CLDurianDevice isHawkeyeAccessory](self, "isHawkeyeAccessory");
  if (v7 | v4)
    v8 = CFSTR("Accessory");
  else
    v8 = CFSTR("Unknown");
  if (v7)
    v9 = CFSTR("ThirdParty");
  else
    v9 = v5;
  if (v7)
    v10 = CFSTR("H");
  else
    v10 = v6;
  if (-[CLDurianDevice isHeleAccessory](self, "isHeleAccessory"))
  {
    v8 = CFSTR("HeleAccessory");
    v9 = CFSTR("Apple");
    v11 = CFSTR("L");
  }
  else
  {
    v11 = v10;
  }
  if (-[CLDurianDevice isPoshAccessory](self, "isPoshAccessory")
    && !-[CLDurianDevice isFindMyNetwork](self, "isFindMyNetwork"))
  {
    v11 = CFSTR("P");
    v9 = CFSTR("ThirdParty");
    v8 = CFSTR("Accessory");
  }
  v12 = -[CLDurianDevice isPoshAccessory](self, "isPoshAccessory");
  v13 = CFSTR("NP");
  if (v12)
    v13 = CFSTR("P");
  v21[0] = v11;
  v21[1] = v13;
  v14 = -[NSArray componentsJoinedByString:](+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v21, 2), "componentsJoinedByString:", CFSTR(":"));
  if (!-[CLDurianDevice unownedBeacon](self, "unownedBeacon")
    || !-[SPUnknownBeacon metadata](-[CLDurianDevice unownedBeacon](self, "unownedBeacon"), "metadata"))
  {
    goto LABEL_32;
  }
  if (objc_msgSend(objc_msgSend(-[SPUnknownBeacon metadata](-[CLDurianDevice unownedBeacon](self, "unownedBeacon"), "metadata"), "manufacturerName"), "length"))
  {
    v9 = (const __CFString *)objc_msgSend(-[SPUnknownBeacon metadata](-[CLDurianDevice unownedBeacon](self, "unownedBeacon"), "metadata"), "manufacturerName");
  }
  if (objc_msgSend(objc_msgSend(-[SPUnknownBeacon metadata](-[CLDurianDevice unownedBeacon](self, "unownedBeacon"), "metadata"), "modelName"), "length"))
  {
    v8 = (const __CFString *)objc_msgSend(-[SPUnknownBeacon metadata](-[CLDurianDevice unownedBeacon](self, "unownedBeacon"), "metadata"), "modelName");
  }
  if (objc_msgSend(objc_msgSend(-[SPUnknownBeacon metadata](-[CLDurianDevice unownedBeacon](self, "unownedBeacon"), "metadata"), "productData"), "length") == (id)8)v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%X:%X"), *(unsigned int *)objc_msgSend(objc_msgSend(objc_msgSend(-[SPUnknownBeacon metadata](-[CLDurianDevice unownedBeacon](self, "unownedBeacon"), "metadata"), "productData"), "subdataWithRange:", 0, 4), "bytes"),
            *(unsigned int *)objc_msgSend(objc_msgSend(objc_msgSend(-[SPUnknownBeacon metadata](-[CLDurianDevice unownedBeacon](self, "unownedBeacon"), "metadata"), "productData"), "subdataWithRange:", 4, 4), "bytes"));
  else
LABEL_32:
    v15 = CFSTR("Unknown");
  if (-[CLDurianDevice taUnknownBeacon](self, "taUnknownBeacon")
    && -[TAUnknownBeacon accessoryInfo](-[CLDurianDevice taUnknownBeacon](self, "taUnknownBeacon"), "accessoryInfo"))
  {
    if (objc_msgSend(objc_msgSend(-[TAUnknownBeacon accessoryInfo](-[CLDurianDevice taUnknownBeacon](self, "taUnknownBeacon"), "accessoryInfo"), "manufacturerName"), "length"))
    {
      v9 = (const __CFString *)objc_msgSend(-[TAUnknownBeacon accessoryInfo](-[CLDurianDevice taUnknownBeacon](self, "taUnknownBeacon"), "accessoryInfo"), "manufacturerName");
    }
    if (objc_msgSend(objc_msgSend(-[TAUnknownBeacon accessoryInfo](-[CLDurianDevice taUnknownBeacon](self, "taUnknownBeacon"), "accessoryInfo"), "modelName"), "length"))
    {
      v8 = (const __CFString *)objc_msgSend(-[TAUnknownBeacon accessoryInfo](-[CLDurianDevice taUnknownBeacon](self, "taUnknownBeacon"), "accessoryInfo"), "modelName");
    }
    if (objc_msgSend(objc_msgSend(-[TAUnknownBeacon accessoryInfo](-[CLDurianDevice taUnknownBeacon](self, "taUnknownBeacon"), "accessoryInfo"), "productData"), "length") == (id)8)v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%X:%X"), *(unsigned int *)objc_msgSend(objc_msgSend(objc_msgSend(-[TAUnknownBeacon accessoryInfo](-[CLDurianDevice taUnknownBeacon](self, "taUnknownBeacon"), "accessoryInfo"), "productData"), "subdataWithRange:", 0,
                                   4),
                                 "bytes"),
              *(unsigned int *)objc_msgSend(objc_msgSend(objc_msgSend(-[TAUnknownBeacon accessoryInfo](-[CLDurianDevice taUnknownBeacon](self, "taUnknownBeacon"), "accessoryInfo"), "productData"), "subdataWithRange:", 4, 4), "bytes"));
  }
  if (-[CLDurianDevice beacon](self, "beacon"))
  {
    if (objc_msgSend(-[SPSimpleBeacon manufacturerName](-[CLDurianDevice beacon](self, "beacon"), "manufacturerName"), "length"))
    {
      v9 = (const __CFString *)-[SPSimpleBeacon manufacturerName](-[CLDurianDevice beacon](self, "beacon"), "manufacturerName");
    }
    if (objc_msgSend(-[SPSimpleBeacon modelName](-[CLDurianDevice beacon](self, "beacon"), "modelName"), "length"))
      v8 = (const __CFString *)-[SPSimpleBeacon modelName](-[CLDurianDevice beacon](self, "beacon"), "modelName");
  }
  if (-[SPSimpleBeacon productId](-[CLDurianDevice beacon](self, "beacon"), "productId")
    && -[SPSimpleBeacon vendorId](-[CLDurianDevice beacon](self, "beacon"), "vendorId"))
  {
    v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%X:%X"), -[SPSimpleBeacon vendorId](-[CLDurianDevice beacon](self, "beacon"), "vendorId"), -[SPSimpleBeacon productId](-[CLDurianDevice beacon](self, "beacon"), "productId"));
  }
  if (-[__CFString isEqualToString:](v15, "isEqualToString:", CFSTR("Unknown")))
  {
    v20[0] = v14;
    v20[1] = v9;
    v20[2] = v8;
    v16 = v20;
    v17 = 3;
  }
  else
  {
    v19[0] = v14;
    v19[1] = v9;
    v19[2] = v8;
    v19[3] = v15;
    v16 = v19;
    v17 = 4;
  }
  return -[NSArray componentsJoinedByString:](+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, v17), "componentsJoinedByString:", CFSTR(":"));
}

- (BOOL)isPoshAccessory
{
  unsigned __int8 v3;
  SEL v4;
  SEL v5;
  SPUnknownBeacon *unownedBeacon;
  id v7;
  NSObject *v8;
  id v9;
  TAUnknownBeacon *taUnknownBeacon;
  id v11;
  NSObject *v12;
  id v13;
  NSObject *v14;
  id v15;
  int v17;
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  _BOOL4 v24;

  if ((_os_feature_enabled_impl("CoreLocation", "StandardUT") & 1) != 0)
  {
    v3 = +[CLDurianSettings forceEnablePosh](CLDurianSettings, "forceEnablePosh");
    v4 = NSSelectorFromString(CFSTR("isPosh"));
    v5 = NSSelectorFromString(CFSTR("isPoshAccessory"));
    unownedBeacon = self->_unownedBeacon;
    if (unownedBeacon && (objc_opt_respondsToSelector(unownedBeacon, v4) & 1) != 0)
    {
      v7 = -[SPUnknownBeacon performSelector:](self->_unownedBeacon, "performSelector:", v4);
      v3 = v7 != 0;
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC538);
      v8 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEBUG))
      {
        v9 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
        v17 = 68289539;
        v18 = 0;
        v19 = 2082;
        v20 = "";
        v21 = 2113;
        v22 = v9;
        v23 = 1025;
        v24 = v7 != 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#durian #posh SPUnknownBeacon responds to isPosh selector\", \"item\":%{private, location:escape_only}@, \"isPosh\":%{private}hhd}", (uint8_t *)&v17, 0x22u);
      }
    }
    taUnknownBeacon = self->_taUnknownBeacon;
    if (taUnknownBeacon && (objc_opt_respondsToSelector(taUnknownBeacon, v5) & 1) != 0)
    {
      v11 = -[TAUnknownBeacon performSelector:](self->_taUnknownBeacon, "performSelector:", v5);
      v3 = v11 != 0;
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC538);
      v12 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEBUG))
      {
        v13 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
        v17 = 68289539;
        v18 = 0;
        v19 = 2082;
        v20 = "";
        v21 = 2113;
        v22 = v13;
        v23 = 1025;
        v24 = v11 != 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#durian #posh TAUnknownBeacon responds to isPosh selector\", \"item\":%{private, location:escape_only}@, \"isPosh\":%{private}hhd}", (uint8_t *)&v17, 0x22u);
      }
    }
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
    v14 = qword_1022A0038;
    v3 = 0;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      v17 = 68289283;
      v18 = 0;
      v19 = 2082;
      v20 = "";
      v21 = 2113;
      v22 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh not enabled\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v17, 0x1Cu);
      return 0;
    }
  }
  return v3;
}

- (BOOL)shouldActivateDevicePostConnection
{
  id v3;
  unsigned int v4;
  unsigned int v5;
  NSObject *v6;
  id v7;
  _DWORD v9[2];
  __int16 v10;
  const char *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  unsigned int v15;
  __int16 v16;
  unsigned int v17;

  v3 = -[CLDurianDevice getBeaconType](self, "getBeaconType");
  v4 = objc_msgSend(v3, "isEqual:", SPBeaconTypeDurian);
  if (v4)
    v5 = !-[CLDurianDevice isPoshAccessory](self, "isPoshAccessory");
  else
    v5 = 0;
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC538);
  v6 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEBUG))
  {
    v7 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
    v9[0] = 68289795;
    v9[1] = 0;
    v10 = 2082;
    v11 = "";
    v12 = 2113;
    v13 = v7;
    v14 = 1026;
    v15 = v4;
    v16 = 1026;
    v17 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#durian activate device\", \"item\":%{private, location:escape_only}@, \"isBeaconTypeDurian\":%{public}hhd, \"shouldActivateDevice\":%{public}hhd}", (uint8_t *)v9, 0x28u);
  }
  return v5;
}

- (BOOL)shouldDiscoverHawkeyeServices
{
  id v3;
  id v4;
  unsigned int v5;

  v3 = -[CLDurianDevice getBeaconType](self, "getBeaconType");
  if ((objc_msgSend(v3, "isEqual:", SPBeaconTypeAccessory) & 1) != 0
    || (v4 = -[CLDurianDevice getBeaconType](self, "getBeaconType"),
        (v5 = objc_msgSend(v4, "isEqual:", SPBeaconTypeHele)) != 0))
  {
    LOBYTE(v5) = !-[CLDurianDevice isPoshAccessory](self, "isPoshAccessory");
  }
  return v5;
}

- (BOOL)isAirTag
{
  id v3;
  unsigned int v4;

  v3 = -[CLDurianDevice getBeaconType](self, "getBeaconType");
  v4 = objc_msgSend(v3, "isEqual:", SPBeaconTypeDurian);
  if (v4)
    LOBYTE(v4) = !-[CLDurianDevice isPoshAccessory](self, "isPoshAccessory");
  return v4;
}

- (BOOL)isHawkeyeAccessory
{
  id v3;
  id v4;
  unsigned int v5;

  v3 = -[CLDurianDevice getBeaconType](self, "getBeaconType");
  if ((objc_msgSend(v3, "isEqual:", SPBeaconTypeAccessory) & 1) != 0
    || (v4 = -[CLDurianDevice getBeaconType](self, "getBeaconType"),
        (v5 = objc_msgSend(v4, "isEqual:", SPBeaconTypeHele)) != 0))
  {
    LOBYTE(v5) = !-[CLDurianDevice isPoshAccessory](self, "isPoshAccessory");
  }
  return v5;
}

- (BOOL)isHeleAccessory
{
  unsigned int v3;
  id v4;

  if (+[CLDurianSettings hawkeyeTestMode](CLDurianSettings, "hawkeyeTestMode") != 8)
  {
    v4 = -[CLDurianDevice getBeaconType](self, "getBeaconType");
    v3 = objc_msgSend(v4, "isEqual:", SPBeaconTypeHele);
    if (!v3)
      return v3;
LABEL_5:
    LOBYTE(v3) = !-[CLDurianDevice isPoshAccessory](self, "isPoshAccessory");
    return v3;
  }
  if (-[CLDurianDevice isHawkeyeAccessory](self, "isHawkeyeAccessory"))
    goto LABEL_5;
  LOBYTE(v3) = 0;
  return v3;
}

- (id)prettyBeaconType
{
  NSObject *v4;
  id v5;
  NSObject *v6;
  id v7;
  unsigned int v8;
  int v9;
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  unsigned int v16;

  if (-[CLDurianDevice isAirTag](self, "isAirTag"))
    return CFSTR("durian");
  if (-[CLDurianDevice isHeleAccessory](self, "isHeleAccessory"))
    return CFSTR("hele");
  if (-[CLDurianDevice isHawkeyeAccessory](self, "isHawkeyeAccessory"))
    return CFSTR("hawkeye");
  if (-[CLDurianDevice isPoshAccessory](self, "isPoshAccessory"))
    return CFSTR("posh");
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC538);
  v4 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
  {
    v5 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
    v9 = 68289539;
    v10 = 0;
    v11 = 2082;
    v12 = "";
    v13 = 2113;
    v14 = v5;
    v15 = 1026;
    v16 = -[CLDurianDevice getBeaconType](self, "getBeaconType");
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian unknown beacon type\", \"item\":%{private, location:escape_only}@, \"beaconType\":%{public}d}", (uint8_t *)&v9, 0x22u);
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
  }
  v6 = qword_1022A0038;
  if (os_signpost_enabled((os_log_t)qword_1022A0038))
  {
    v7 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
    v8 = -[CLDurianDevice getBeaconType](self, "getBeaconType");
    v9 = 68289539;
    v10 = 0;
    v11 = 2082;
    v12 = "";
    v13 = 2113;
    v14 = v7;
    v15 = 1026;
    v16 = v8;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian unknown beacon type", "{\"msg%{public}.0s\":\"#durian unknown beacon type\", \"item\":%{private, location:escape_only}@, \"beaconType\":%{public}d}", (uint8_t *)&v9, 0x22u);
  }
  return CFSTR("na");
}

- (BOOL)isCapableOfAllHawkeyeServices
{
  _BOOL4 v3;

  v3 = -[CLDurianDevice isHawkeyeAccessory](self, "isHawkeyeAccessory");
  if (v3)
    LOBYTE(v3) = !-[CLDurianDevice isHeleAccessory](self, "isHeleAccessory");
  return v3;
}

- (BOOL)isCapableOfDynamicConnectionLatency
{
  if (-[CLDurianDevice isHawkeyeAccessory](self, "isHawkeyeAccessory"))
    return !-[CLDurianDevice isHeleAccessory](self, "isHeleAccessory");
  else
    return 1;
}

- (BOOL)isCapableOfFirmwareUpdate
{
  if (-[CLDurianDevice beacon](self, "beacon")
    && -[SPSimpleBeacon manufacturerName](-[CLDurianDevice beacon](self, "beacon"), "manufacturerName")
    && -[CLDurianDevice isHawkeyeAccessory](self, "isHawkeyeAccessory"))
  {
    return objc_msgSend(-[SPSimpleBeacon manufacturerName](-[CLDurianDevice beacon](self, "beacon"), "manufacturerName"), "isEqualToString:", CFSTR("Apple"));
  }
  else
  {
    return 0;
  }
}

- (void)addHawkeyeTestModeTask
{
  unsigned __int8 v3;
  int v4;
  id v5;
  NSObject *v6;
  id v7;
  _DWORD v8[2];
  __int16 v9;
  const char *v10;
  __int16 v11;
  id v12;
  __int16 v13;
  int v14;

  v3 = +[CLDurianSettings hawkeyeTestMode](CLDurianSettings, "hawkeyeTestMode");
  v4 = v3;
  if (v3)
  {
    v5 = +[CLDurianTask testModeTask:](CLDurianTask, "testModeTask:", v3);
    if (v5)
    {
      -[CLDurianDevice enqueueTask:](self, "enqueueTask:", v5);
    }
    else
    {
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC538);
      v6 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
      {
        v7 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
        v8[0] = 68289539;
        v8[1] = 0;
        v9 = 2082;
        v10 = "";
        v11 = 2113;
        v12 = v7;
        v13 = 1026;
        v14 = v4;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian unrecognized hawkeye test mode\", \"item\":%{private, location:escape_only}@, \"testMode\":%{public}d}", (uint8_t *)v8, 0x22u);
      }
    }
  }
}

- (BOOL)isTAAISDevice
{
  return -[CLDurianDevice taUnknownBeacon](self, "taUnknownBeacon")
      && (-[NSUUID isEqual:](-[CLDurianDevice uuid](self, "uuid"), "isEqual:", -[TAUnknownBeacon identifier](-[CLDurianDevice taUnknownBeacon](self, "taUnknownBeacon"), "identifier")) & 1) != 0;
}

- (unint64_t)ownership
{
  SPUnknownBeacon *unownedBeacon;
  NSObject *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  int v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;

  unownedBeacon = self->_unownedBeacon;
  if (self->_beacon)
  {
    if (unownedBeacon || self->_taUnknownBeacon)
    {
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC538);
      v4 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_FAULT))
      {
        v5 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
        v6 = -[SPSimpleBeacon description](self->_beacon, "description");
        v7 = -[SPUnknownBeacon description](self->_unownedBeacon, "description");
        v8 = -[TAUnknownBeacon description](self->_taUnknownBeacon, "description");
        v15 = 68290051;
        v16 = 0;
        v17 = 2082;
        v18 = "";
        v19 = 2113;
        v20 = v5;
        v21 = 2113;
        v22 = v6;
        v23 = 2113;
        v24 = v7;
        v25 = 2113;
        v26 = v8;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#durian device has both owner and non-owner beacons\", \"item\":%{private, location:escape_only}@, \"beacon\":%{private, location:escape_only}@, \"unownedBeacon\":%{private, location:escape_only}@, \"taUnknownBeacon\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x3Au);
        if (qword_1022A0030 != -1)
          dispatch_once(&qword_1022A0030, &stru_1021BC538);
      }
      v9 = qword_1022A0038;
      if (os_signpost_enabled((os_log_t)qword_1022A0038))
      {
        v10 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
        v11 = -[SPSimpleBeacon description](self->_beacon, "description");
        v12 = -[SPUnknownBeacon description](self->_unownedBeacon, "description");
        v13 = -[TAUnknownBeacon description](self->_taUnknownBeacon, "description");
        v15 = 68290051;
        v16 = 0;
        v17 = 2082;
        v18 = "";
        v19 = 2113;
        v20 = v10;
        v21 = 2113;
        v22 = v11;
        v23 = 2113;
        v24 = v12;
        v25 = 2113;
        v26 = v13;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian device has both owner and non-owner beacons", "{\"msg%{public}.0s\":\"#durian device has both owner and non-owner beacons\", \"item\":%{private, location:escape_only}@, \"beacon\":%{private, location:escape_only}@, \"unownedBeacon\":%{private, location:escape_only}@, \"taUnknownBeacon\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x3Au);
      }
      return 0;
    }
    else
    {
      return 1;
    }
  }
  else if (unownedBeacon)
  {
    return 2;
  }
  else
  {
    return 2 * (self->_taUnknownBeacon != 0);
  }
}

- (void)setActivePeripheral:(id)a3 withError:(id)a4
{
  double v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  unint64_t maintenanceOnlyCondition;
  id v13;
  unsigned int v14;
  id v15;
  NSString *connectReason;
  NSObject *v17;
  id v18;
  unint64_t lastGroupMaintenance;
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  NSString *disconnectReason;
  CBPeripheral *v25;
  NSObject *v26;
  id v27;
  unsigned int v28;
  NSObject *v29;
  id v30;
  int v31;
  int v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  unint64_t v38;
  __int16 v39;
  id v40;
  __int16 v41;
  _BYTE v42[10];
  __int16 v43;
  id v44;
  __int16 v45;
  NSString *v46;

  self->_mutexState = 0;
  self->_lastMaxConnectionsSent = 0;
  if (a3)
  {
    -[CLDurianDevice intervalSinceLastSearchPartyKeyObservation](self, "intervalSinceLastSearchPartyKeyObservation");
    +[CLDurianMetricManager submitConnectionAttemptEvent:numberBTConnectionAttempts:connectionReason:deviceType:](CLDurianMetricManager, "submitConnectionAttemptEvent:numberBTConnectionAttempts:connectionReason:deviceType:", -[CLDurianConnectionAttempt connectionAttemptCount](-[CLDurianDevice activeConnectionAttempt](self, "activeConnectionAttempt"), "connectionAttemptCount"), -[CLDurianDevice getConnectionReason](self, "getConnectionReason"), -[CLDurianDevice prettyBeaconType](self, "prettyBeaconType"), v7);
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
    v8 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      v10 = -[SPSimpleBeacon name](self->_beacon, "name");
      v11 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "identifier"), "description"), "substringToIndex:", 8);
      maintenanceOnlyCondition = self->_maintenanceOnlyCondition;
      v13 = a4;
      v14 = -[CLDurianDevice isLeashSlotInUse](self, "isLeashSlotInUse");
      v15 = objc_msgSend(+[CLDurianVersionNumberUtilities getStringFromNumber:](CLDurianVersionNumberUtilities, "getStringFromNumber:", -[CLDurianDevice buildNumber](self, "buildNumber")), "UTF8String");
      connectReason = self->_connectReason;
      v31 = 68290819;
      v32 = 0;
      v33 = 2082;
      v34 = "";
      v35 = 2113;
      v36 = v9;
      v37 = 2113;
      v38 = (unint64_t)v10;
      v39 = 2113;
      v40 = v11;
      v41 = 1026;
      *(_DWORD *)v42 = maintenanceOnlyCondition;
      *(_WORD *)&v42[4] = 1026;
      *(_DWORD *)&v42[6] = v14;
      a4 = v13;
      v43 = 2082;
      v44 = v15;
      v45 = 2114;
      v46 = connectReason;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connection established\", \"item\":%{private, location:escape_only}@, \"name\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@, \"maint\":%{public}d, \"leashslot\":%{public}d, \"version\":%{public, location:escape_only}s, \"reason\":%{public, location:escape_only}@}", (uint8_t *)&v31, 0x50u);
    }
    if (self->_isProactiveAttempt)
      ++self->_numProactiveConnects;
    if (self->_maintenanceOnlyCondition && -[CLDurianDevice groupUuid](self, "groupUuid"))
    {
      self->_lastGroupMaintenance = mach_continuous_time();
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC538);
      v17 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
      {
        v18 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
        lastGroupMaintenance = self->_lastGroupMaintenance;
        v31 = 68289539;
        v32 = 0;
        v33 = 2082;
        v34 = "";
        v35 = 2113;
        v36 = v18;
        v37 = 2050;
        v38 = lastGroupMaintenance;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint groupdelta\", \"item\":%{private, location:escape_only}@, \"set\":%{public}llu}", (uint8_t *)&v31, 0x26u);
      }
    }
    -[CLDurianDevice sendConnectionMetric](self, "sendConnectionMetric");
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
    v20 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v21 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      v22 = -[SPSimpleBeacon name](self->_beacon, "name");
      v23 = objc_msgSend(objc_msgSend(objc_msgSend(0, "identifier"), "description"), "substringToIndex:", 8);
      disconnectReason = self->_disconnectReason;
      v31 = 68290051;
      v33 = 2082;
      v32 = 0;
      v34 = "";
      v35 = 2113;
      v36 = v21;
      v37 = 2113;
      v38 = (unint64_t)v22;
      v39 = 2113;
      v40 = v23;
      v41 = 2114;
      *(_QWORD *)v42 = disconnectReason;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connection established\", \"item\":%{private, location:escape_only}@, \"name\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@, \"disconnect\":%{public, location:escape_only}@}", (uint8_t *)&v31, 0x3Au);
    }
    self->_connectionEventSpmiRequested = 0;
    self->_isRoseInitialized = 0;
    -[CLDurianDevice setActivePeripheralMaterial:](self, "setActivePeripheralMaterial:", 0);
    self->_maintenanceOnlyCondition = 0;
    -[CLDurianDevice resetLeashState](self, "resetLeashState");
    self->_btFindingState = 0;
    self->_lastDisconnectionTime = mach_continuous_time();
    self->_isProactiveAttempt = 0;
    *(_QWORD *)&self->_keyRollInterval = 900;
  }

  objc_msgSend(a3, "setDelegate:", self);
  v25 = (CBPeripheral *)a3;
  self->_activePeripheral = v25;
  self->_maxPacketSizeForGATTWriteWithResponse = -[CBPeripheral maximumWriteValueLengthForType:](v25, "maximumWriteValueLengthForType:", 1);
  -[CLDurianDeviceDelegate device:didUpdateActivePeripheral:withError:](-[CLDurianDevice delegate](self, "delegate"), "device:didUpdateActivePeripheral:withError:", self, a3, a4);
  self->_activePeripheralReady = 0;
  if (a3)
  {
    -[CLDurianDevice setActiveConnectionAttempt:](self, "setActiveConnectionAttempt:", 0);
    -[CLDurianDevice setPendingConnectionAttempt:](self, "setPendingConnectionAttempt:", 0);
    if (self->_firmwareUpdateReboot)
      -[CLDurianDevice exitFirmwareUpdateMode](self, "exitFirmwareUpdateMode");
    if (!self->_retrievingPersonalizationInformation)
    {
      if (objc_msgSend(-[CLFindMyAccessoryConnectionMaterial ltk](self->_activePeripheralMaterial, "ltk"), "length")
        || !-[CLDurianDevice beacon](self, "beacon")
        || objc_msgSend(objc_msgSend(-[NSMutableArray firstObject](self->_pendingTasks, "firstObject"), "command"), "opcode") == 175|| objc_msgSend(objc_msgSend(-[NSMutableArray firstObject](self->_pendingTasks, "firstObject"), "command"), "opcode") == 220|| objc_msgSend(objc_msgSend(-[NSMutableArray firstObject](self->_pendingTasks, "firstObject"), "command"), "opcode") == 2061|| objc_msgSend(objc_msgSend(-[NSMutableArray firstObject](self->_pendingTasks, "firstObject"), "command"), "opcode") == 768|| objc_msgSend(objc_msgSend(-[NSMutableArray firstObject](self->_pendingTasks, "firstObject"), "command"), "opcode") == 769|| objc_msgSend(objc_msgSend(-[NSMutableArray firstObject](self->_pendingTasks, "firstObject"), "command"), "opcode") == 794)
      {
        if (-[CBPeripheral isLinkEncrypted](self->_activePeripheral, "isLinkEncrypted"))
          -[CLDurianDevice checkPreHelloConditions](self, "checkPreHelloConditions");
      }
      else
      {
        if (qword_1022A0030 != -1)
          dispatch_once(&qword_1022A0030, &stru_1021BC538);
        v29 = qword_1022A0038;
        if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
        {
          v30 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
          v31 = 68289283;
          v32 = 0;
          v33 = 2082;
          v34 = "";
          v35 = 2113;
          v36 = v30;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connection unauthorized, fetching key index\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v31, 0x1Cu);
        }
        -[NSMutableArray insertObject:atIndex:](self->_pendingTasks, "insertObject:atIndex:", +[CLDurianTask fetchCurrentKeyIndexTask](CLDurianTask, "fetchCurrentKeyIndexTask"), 0);
        -[CLDurianDevice logTaskCounts:](self, "logTaskCounts:", CFSTR("utconnect"));
      }
    }
  }
  else if (-[CLDurianDevice mutexState](self, "mutexState"))
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
    v26 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v27 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      v28 = -[CLDurianDevice mutexState](self, "mutexState");
      v31 = 68289539;
      v32 = 0;
      v33 = 2082;
      v34 = "";
      v35 = 2113;
      v36 = v27;
      v37 = 1026;
      LODWORD(v38) = v28;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #mutex free on disconnect\", \"item\":%{private, location:escape_only}@, \"prior\":%{public}d}", (uint8_t *)&v31, 0x22u);
    }
    -[CLDurianDevice setMutexState:](self, "setMutexState:", 0);
  }
}

- (void)setActivePeripheralReady:(BOOL)a3
{
  self->_activePeripheralReady = a3;
  if (a3)
  {
    if (self->_retrievingPersonalizationInformation)
      -[CLDurianDevice getPersonalizationInformation](self, "getPersonalizationInformation");
    else
      -[CLDurianDevice processNextTask:](self, "processNextTask:", CFSTR("setActivePeripheralReady"));
  }
}

- (void)checkPreHelloConditions
{
  NSObject *v3;
  id v4;
  _DWORD v5[2];
  __int16 v6;
  const char *v7;
  __int16 v8;
  id v9;
  __int16 v10;
  id v11;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC538);
  v3 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
    v5[0] = 68289539;
    v5[1] = 0;
    v6 = 2082;
    v7 = "";
    v8 = 2113;
    v9 = v4;
    v10 = 2113;
    v11 = -[CLDurianDevice prettyBeaconType](self, "prettyBeaconType");
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian checking pre hello\", \"item\":%{private, location:escape_only}@, \"beaconType\":%{private, location:escape_only}@}", (uint8_t *)v5, 0x26u);
  }
  if (-[CLDurianDevice isAirTag](self, "isAirTag"))
    -[CLDurianDevice enqueueTask:](self, "enqueueTask:", +[CLDurianTask fetchMultiStatusTask](CLDurianTask, "fetchMultiStatusTask"));
  if (-[CLDurianDevice isHawkeyeAccessory](self, "isHawkeyeAccessory"))
  {
    if (!self->_firmwareUpdateMode)
      -[CLDurianDevice enqueueTask:](self, "enqueueTask:", +[CLDurianTask getMultiStatusHawkeyeTask](CLDurianTask, "getMultiStatusHawkeyeTask"));
  }
}

- (void)sendHelloSequence
{
  NSObject *v3;
  id v4;
  unsigned int keyRollInterval;
  unsigned int v6;
  _DWORD v7[2];
  __int16 v8;
  const char *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  unsigned int v13;
  __int16 v14;
  unsigned int v15;
  __int16 v16;
  id v17;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC538);
  v3 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
    v7[0] = 68290051;
    v7[1] = 0;
    v8 = 2082;
    v9 = "";
    v10 = 2113;
    v11 = v4;
    v12 = 1025;
    v13 = -[SPSimpleBeacon connectableDeviceCount](-[CLDurianDevice beacon](self, "beacon"), "connectableDeviceCount");
    v14 = 1026;
    v15 = -[CLDurianDevice isLeashSlotInUse](self, "isLeashSlotInUse");
    v16 = 2114;
    v17 = -[CLDurianDevice prettyBeaconType](self, "prettyBeaconType");
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian sending hello\", \"item\":%{private, location:escape_only}@, \"connectableDevices\":%{private}d, \"leashslot\":%{public}d, \"type\":%{public, location:escape_only}@}", (uint8_t *)v7, 0x32u);
  }
  if (-[CLDurianDevice isAirTag](self, "isAirTag"))
  {
    -[CLDurianDevice enqueueTask:](self, "enqueueTask:", +[CLDurianTask setCentralReferenceTimeTask](CLDurianTask, "setCentralReferenceTimeTask"));
    -[CLDurianDevice enqueueTask:](self, "enqueueTask:", +[CLDurianTask rollWildKeyTask](CLDurianTask, "rollWildKeyTask"));
    if (!-[CLDurianDevice isLeashSlotInUse](self, "isLeashSlotInUse"))
      -[CLDurianDevice enqueueTask:](self, "enqueueTask:", +[CLDurianTask setNearOwnerTimeoutTaskWithTimeout:](CLDurianTask, "setNearOwnerTimeoutTaskWithTimeout:", self->_nearOwnerTimeout));
    -[CLDurianDevice enqueueTask:](self, "enqueueTask:", +[CLDurianTask fetchFirmwareVersionTaskWithCrashLogs:](CLDurianTask, "fetchFirmwareVersionTaskWithCrashLogs:", 1));
    -[CLDurianDevice enqueueTask:](self, "enqueueTask:", +[CLDurianTask setMaxConnectionsTaskWithCount:](CLDurianTask, "setMaxConnectionsTaskWithCount:", -[SPSimpleBeacon connectableDeviceCount](-[CLDurianDevice beacon](self, "beacon"), "connectableDeviceCount")));
    keyRollInterval = self->_keyRollInterval;
    if (keyRollInterval != 900)
      -[CLDurianDevice enqueueTask:](self, "enqueueTask:", +[CLDurianTask setKeyRotationTimeoutTaskWithTimeout:](CLDurianTask, "setKeyRotationTimeoutTaskWithTimeout:", 1000 * keyRollInterval));
    if (sub_101536E10())
      -[CLDurianDevice enqueueTask:](self, "enqueueTask:", +[CLDurianTask checkCrashesTask](CLDurianTask, "checkCrashesTask"));
  }
  if (-[CLDurianDevice isHawkeyeAccessory](self, "isHawkeyeAccessory"))
  {
    -[CLDurianDevice setHawkeyeTestMode:](self, "setHawkeyeTestMode:", +[CLDurianSettings hawkeyeTestMode](CLDurianSettings, "hawkeyeTestMode"));
    -[CLDurianDevice enqueueTask:](self, "enqueueTask:", +[CLDurianTask setUtcHawkeyeTask](CLDurianTask, "setUtcHawkeyeTask"));
    -[CLDurianDevice enqueueTask:](self, "enqueueTask:", +[CLDurianTask latchSeparatedKeyHawkeyeTask](CLDurianTask, "latchSeparatedKeyHawkeyeTask"));
    if (!-[CLDurianDevice isLeashSlotInUse](self, "isLeashSlotInUse"))
      -[CLDurianDevice enqueueTask:](self, "enqueueTask:", +[CLDurianTask setNearbyTimeoutHawkeyeTaskWithTimeout:asHele:](CLDurianTask, "setNearbyTimeoutHawkeyeTaskWithTimeout:asHele:", self->_nearOwnerTimeout, -[CLDurianDevice isHeleAccessory](self, "isHeleAccessory")));
    if (-[CLDurianDevice isCapableOfAllHawkeyeServices](self, "isCapableOfAllHawkeyeServices"))
      -[CLDurianDevice enqueueTask:](self, "enqueueTask:", +[CLDurianTask fetchFirmwareVersionGATTTask](CLDurianTask, "fetchFirmwareVersionGATTTask"));
    if (-[CLDurianDevice groupUuid](self, "groupUuid"))
      -[CLDurianDevice enqueueTask:](self, "enqueueTask:", +[CLDurianTask getGroupStatusHawkeyeTask](CLDurianTask, "getGroupStatusHawkeyeTask"));
    -[CLDurianDevice enqueueTask:](self, "enqueueTask:", +[CLDurianTask setMaxConnectionsHawkeyeTaskWithCount:](CLDurianTask, "setMaxConnectionsHawkeyeTaskWithCount:", -[SPSimpleBeacon connectableDeviceCount](-[CLDurianDevice beacon](self, "beacon"), "connectableDeviceCount")));
    v6 = self->_keyRollInterval;
    if (v6 != 900)
      -[CLDurianDevice enqueueTask:](self, "enqueueTask:", +[CLDurianTask setKeyRotationTimeoutHawkeyeTaskWithTimeout:](CLDurianTask, "setKeyRotationTimeoutHawkeyeTaskWithTimeout:", 1000 * v6));
    -[CLDurianDevice addHawkeyeTestModeTask](self, "addHawkeyeTestModeTask");
  }
}

- (id)nextAlignedKeyRollDate
{
  double v2;
  double v3;

  v2 = (double)-[CLDurianDevice keyRollInterval](self, "keyRollInterval");
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  return +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", ceil(v3 / v2) * v2);
}

- (unsigned)keysRemainingUntilWildRoll
{
  double v3;
  double v4;

  -[NSDate timeIntervalSinceNow](-[NSCalendar nextDateAfterDate:matchingHour:minute:second:options:](+[NSCalendar calendarWithIdentifier:](NSCalendar, "calendarWithIdentifier:", NSCalendarIdentifierGregorian), "nextDateAfterDate:matchingHour:minute:second:options:", +[NSDate date](NSDate, "date"), 4, 0, 0, 1024), "timeIntervalSinceNow");
  v4 = ceil(v3 / (double)-[CLDurianDevice keyRollInterval](self, "keyRollInterval"));
  if (v4 > 96.0)
    return (int)96.0;
  return (int)v4;
}

- (void)alignClockWithCurrentIndex:(unsigned int)a3
{
  uint64_t v3;
  id v5;
  unsigned int v6;
  id v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  int v15;
  int v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  id v26;

  v3 = *(_QWORD *)&a3;
  v5 = -[CLDurianDevice nextAlignedKeyRollDate](self, "nextAlignedKeyRollDate");
  v6 = -[CLDurianDevice keysRemainingUntilWildRoll](self, "keysRemainingUntilWildRoll");
  if (-[CLDurianDevice isAirTag](self, "isAirTag"))
  {
    if ((uint64_t)-[SPSimpleBeacon batteryLevel](-[CLDurianDevice beacon](self, "beacon"), "batteryLevel") <= 4)
    {
      v7 = objc_msgSend(objc_alloc((Class)CLFindMyAccessoryAbsoluteWildConfiguration), "initWithDesiredNextKeyRollDate:nextWildIndex:", v5, v6 + v3);
      v8 = +[CLDurianTask setAbsoluteWildModeConfigurationTaskWithConfiguration:](CLDurianTask, "setAbsoluteWildModeConfigurationTaskWithConfiguration:", v7);

      -[CLDurianDevice enqueueTask:](self, "enqueueTask:", v8);
      goto LABEL_9;
    }
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
    v9 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      v15 = 68289283;
      v16 = 0;
      v17 = 2082;
      v18 = "";
      v19 = 2113;
      v20 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian skipping WildConfiguration due to low battery\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x1Cu);
    }
  }
  v8 = 0;
LABEL_9:
  if (-[CLDurianDevice isHawkeyeAccessory](self, "isHawkeyeAccessory"))
  {
    v11 = objc_msgSend(objc_alloc((Class)CLFindMyAccessoryAbsoluteWildConfiguration), "initWithDesiredNextKeyRollDate:nextWildIndex:", v5, v6 + v3);
    -[CLDurianDevice enqueueTask:](self, "enqueueTask:", +[CLDurianTask configureSeparatedStateHawkeyeTaskWithConfiguration:currentIndex:](CLDurianTask, "configureSeparatedStateHawkeyeTaskWithConfiguration:currentIndex:", v11, v3));

  }
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC538);
  v12 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v13 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
    v14 = objc_msgSend(v8, "performSelector:", "configuration");
    v15 = 68290051;
    v17 = 2082;
    v16 = 0;
    v18 = "";
    v19 = 2113;
    v20 = v13;
    v21 = 2049;
    v22 = v3;
    v23 = 2049;
    v24 = v6;
    v25 = 2113;
    v26 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian aligning clock given current index\", \"item\":%{private, location:escape_only}@, \"currentIndex\":%{private}lu, \"keysRemaining\":%{private}lu, \"config\":%{private, location:escape_only}@}", (uint8_t *)&v15, 0x3Au);
  }
}

- (void)processNextTask:(id)a3
{
  const __CFString *v5;
  unsigned int v6;
  const __CFString *v7;
  const __CFString *v8;
  NSObject *v9;
  id v10;
  __int128 v11;
  char v12;
  NSObject *v13;
  id v14;
  id v15;
  unsigned int v16;
  NSMutableArray *preemptedTasks;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  void *v23;
  NSObject *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t buf;
  __int16 v33;
  const char *v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  __int16 v39;
  const __CFString *v40;

  if (self->_activeTask)
    v5 = CFSTR("activetask");
  else
    v5 = 0;
  v6 = -[CLDurianDevice isConnected](self, "isConnected");
  v7 = CFSTR("notconnected");
  if (v6)
    v7 = v5;
  if (!self->_activePeripheralReady)
    v7 = CFSTR("periphnotready");
  if (self->_firmwareUpdateReboot)
    v8 = CFSTR("fwdlreboot");
  else
    v8 = v7;
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC538);
  v9 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
    buf = 68289795;
    v33 = 2082;
    v34 = "";
    v35 = 2113;
    v36 = v10;
    v37 = 2114;
    v38 = a3;
    v39 = 2114;
    v40 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian processNextTask\", \"item\":%{private, location:escape_only}@, \"from\":%{public, location:escape_only}@, \"skip\":%{public, location:escape_only}@}", (uint8_t *)&buf, 0x30u);
  }
  if (!v8)
  {
    v12 = 0;
    if (objc_msgSend(-[NSMutableArray firstObject](self->_pendingTasks, "firstObject"), "isCancelled"))
    {
      *(_QWORD *)&v11 = 68289539;
      v26 = v11;
      do
      {
        if (qword_1022A0030 != -1)
          dispatch_once(&qword_1022A0030, &stru_1021BC538);
        v13 = qword_1022A0038;
        if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
        {
          v14 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
          v15 = -[NSMutableArray firstObject](self->_pendingTasks, "firstObject");
          buf = v26;
          v33 = 2082;
          v34 = "";
          v35 = 2113;
          v36 = v14;
          v37 = 2113;
          v38 = v15;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian skipping cancelled task\", \"item\":%{private, location:escape_only}@, \"task\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x26u);
        }
        v16 = objc_msgSend(objc_msgSend(-[NSMutableArray firstObject](self->_pendingTasks, "firstObject", v26), "command"), "opcode");
        -[NSMutableArray removeObjectAtIndex:](self->_pendingTasks, "removeObjectAtIndex:", 0);
        -[CLDurianDevice logTaskCounts:](self, "logTaskCounts:", CFSTR("cancelled"));
        if (v16 == 2053 || v16 == 6)
          v12 = 1;
      }
      while ((objc_msgSend(-[NSMutableArray firstObject](self->_pendingTasks, "firstObject"), "isCancelled") & 1) != 0);
    }
    if (-[NSMutableArray count](self->_pendingTasks, "count"))
    {
      if (-[NSMutableArray count](self->_preemptedTasks, "count"))
      {
        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        preemptedTasks = self->_preemptedTasks;
        v19 = -[NSMutableArray countByEnumeratingWithState:objects:count:](preemptedTasks, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v28;
          while (2)
          {
            for (i = 0; i != v20; i = (char *)i + 1)
            {
              if (*(_QWORD *)v28 != v21)
                objc_enumerationMutation(preemptedTasks);
              v23 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
              if ((objc_msgSend(-[NSMutableArray firstObject](self->_pendingTasks, "firstObject"), "shouldPreemptTask:", v23) & 1) == 0)
              {
                if (qword_1022A0030 != -1)
                  dispatch_once(&qword_1022A0030, &stru_1021BC538);
                v24 = qword_1022A0038;
                if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
                {
                  v25 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
                  buf = 68289539;
                  v33 = 2082;
                  v34 = "";
                  v35 = 2113;
                  v36 = v25;
                  v37 = 2114;
                  v38 = v23;
                  _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian ongoing task cannot be preempted by next task\", \"item\":%{private, location:escape_only}@, \"ongoingTask\":%{public, location:escape_only}@}", (uint8_t *)&buf, 0x26u);
                }
                return;
              }
            }
            v20 = -[NSMutableArray countByEnumeratingWithState:objects:count:](preemptedTasks, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
            if (v20)
              continue;
            break;
          }
        }
      }
      -[CLDurianDevice setActiveTask:](self, "setActiveTask:", -[NSMutableArray objectAtIndex:](self->_pendingTasks, "objectAtIndex:", 0));
      -[CLDurianDevice executeTask:](self, "executeTask:", -[CLDurianDevice activeTask](self, "activeTask"));
    }
    if ((v12 & 1) != 0)
      -[CLDurianDevice releaseMutexWithReason:](self, "releaseMutexWithReason:", CFSTR("TaskCancelled"));
  }
}

- (void)processAcknowledgedTask
{
  int v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  id v9;
  int v10;
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  int v17;

  self->_activeTaskAcknowledged = 1;
  -[CLDurianDeviceDelegate device:didAcknowledgeCommandForTask:](-[CLDurianDevice delegate](self, "delegate"), "device:didAcknowledgeCommandForTask:", self, -[CLDurianDevice activeTask](self, "activeTask"));
  v3 = -[CLDurianTask translatedOpcode](self->_activeTask, "translatedOpcode");
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC538);
  v4 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
    v10 = 68289539;
    v11 = 0;
    v12 = 2082;
    v13 = "";
    v14 = 2113;
    v15 = v5;
    v16 = 1026;
    v17 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian processAcknowledged\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d}", (uint8_t *)&v10, 0x22u);
  }
  if (v3 <= 769)
  {
    if (v3 != 40 && v3 != 175)
      goto LABEL_19;
LABEL_15:
    self->_isPlayingSound = 1;
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
    v8 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      v10 = 68289539;
      v11 = 0;
      v12 = 2082;
      v13 = "";
      v14 = 2113;
      v15 = v9;
      v16 = 1026;
      v17 = v3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian isPlayingSound\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d}", (uint8_t *)&v10, 0x22u);
    }
    goto LABEL_19;
  }
  if (v3 == 2061)
    goto LABEL_15;
  if (v3 != 770)
  {
LABEL_19:
    if ((v3 & 0xFFFFF7FF) == 3)
      self->_isRanging = 1;
    if (v3 == 527)
    {
      self->_btFindingState = 2;
      if (self->_pendingSoundTask)
      {
        -[CLDurianDevice enqueueTask:](self, "enqueueTask:");
        self->_pendingSoundTask = 0;
      }
    }
    return;
  }
  self->_isPlayingSound = 1;
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC538);
  v6 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
    v10 = 68289539;
    v11 = 0;
    v12 = 2082;
    v13 = "";
    v14 = 2113;
    v15 = v7;
    v16 = 1026;
    v17 = 770;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut isPlayingSound\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d}", (uint8_t *)&v10, 0x22u);
  }
}

- (void)processCompletedTask
{
  int v3;
  NSObject *v4;
  id v5;
  NSObject *v6;
  id v7;
  int v8;
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  int v15;

  v3 = -[CLDurianTask translatedOpcode](self->_activeTask, "translatedOpcode");
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC538);
  v4 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
    v8 = 68289539;
    v9 = 0;
    v10 = 2082;
    v11 = "";
    v12 = 2113;
    v13 = v5;
    v14 = 1026;
    v15 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian processCompleted\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d}", (uint8_t *)&v8, 0x22u);
  }
  if (v3 > 767)
  {
    if (v3 == 768)
    {
LABEL_9:
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC538);
      v6 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
      {
        v7 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
        v8 = 68289539;
        v9 = 0;
        v10 = 2082;
        v11 = "";
        v12 = 2113;
        v13 = v7;
        v14 = 1026;
        v15 = v3;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut isPlayingSound completed\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d}", (uint8_t *)&v8, 0x22u);
      }
      goto LABEL_15;
    }
    if (v3 != 2061)
    {
      if (v3 != 794)
        goto LABEL_16;
      goto LABEL_9;
    }
LABEL_15:
    self->_isPlayingSound = 0;
    goto LABEL_16;
  }
  if (v3 == 40 || v3 == 175)
    goto LABEL_15;
LABEL_16:
  if ((v3 & 0xFFFFF7FF) == 3)
    self->_isRanging = 0;
  if ((v3 - 527) < 2 || v3 == 772)
    self->_btFindingState = 0;
}

- (void)completeCurrentTask
{
  NSObject *v3;
  id v4;
  unsigned int v5;
  id v6;
  _DWORD v7[2];
  __int16 v8;
  const char *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  unsigned int v13;
  __int16 v14;
  id v15;

  if (self->_activeTask)
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
    v3 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v4 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      v5 = -[CLDurianCommand opcode](-[CLDurianTask command](self->_activeTask, "command"), "opcode");
      v6 = -[CLDurianTask opcodeDescription](self->_activeTask, "opcodeDescription");
      v7[0] = 68289795;
      v7[1] = 0;
      v8 = 2082;
      v9 = "";
      v10 = 2113;
      v11 = v4;
      v12 = 1026;
      v13 = v5;
      v14 = 2113;
      v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian completing task\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d, \"task\":%{private, location:escape_only}@}", (uint8_t *)v7, 0x2Cu);
    }
    -[CLDurianDevice cancelTimeoutForTask:dictionary:](self, "cancelTimeoutForTask:dictionary:", self->_activeTask, self->_activeTaskTimeouts);
    -[NSMutableArray removeObject:](self->_pendingTasks, "removeObject:", self->_activeTask);
    -[CLDurianDevice logTaskCounts:](self, "logTaskCounts:", CFSTR("completed"));
    -[CLDurianDevice processCompletedTask](self, "processCompletedTask");
    -[CLDurianTask complete](self->_activeTask, "complete");
    -[CLDurianDevice setActiveTask:](self, "setActiveTask:", 0);
  }
  self->_activeTaskAcknowledged = 0;
  -[CLDurianDevice processNextTask:](self, "processNextTask:", CFSTR("completeCurrentTask"));
  if (-[CLDurianDevice isTaskQueueEmpty](self, "isTaskQueueEmpty"))
  {
    if (!-[CLDurianDevice isLeashSlotInUse](self, "isLeashSlotInUse") && self->_maintenanceOnlyCondition)
      -[CLDurianDevice requestDisconnection:](self, "requestDisconnection:", CFSTR("MaintenanceComplete"));
    if (self->_preparingForRanging)
      -[CLDurianDevice checkPrepareRanging](self, "checkPrepareRanging");
    if (-[CLDurianDevice isTAAISDevice](self, "isTAAISDevice"))
      -[CLDurianDevice requestDisconnection:](self, "requestDisconnection:", CFSTR("AISFetchComplete"));
  }
}

- (BOOL)isTaskQueueEmpty
{
  return !self->_activeTask
      && !-[NSMutableArray count](self->_pendingTasks, "count")
      && -[NSMutableArray count](self->_preemptedTasks, "count") == 0;
}

- (void)failedToSendBytes:(id)a3
{
  NSObject *v5;
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  int v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC538);
  v5 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
  {
    v6 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
    v7 = objc_msgSend(objc_msgSend(-[CBPeripheral identifier](self->_activePeripheral, "identifier"), "description"), "substringToIndex:", 8);
    v11 = 68289795;
    v12 = 0;
    v13 = 2082;
    v14 = "";
    v15 = 2113;
    v16 = v6;
    v17 = 2113;
    v18 = v7;
    v19 = 2113;
    v20 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian failed to send bytes\", \"item\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@, \"byteCount\":%{private, location:escape_only}@}", (uint8_t *)&v11, 0x30u);
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
  }
  v8 = qword_1022A0038;
  if (os_signpost_enabled((os_log_t)qword_1022A0038))
  {
    v9 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
    v10 = objc_msgSend(objc_msgSend(-[CBPeripheral identifier](self->_activePeripheral, "identifier"), "description"), "substringToIndex:", 8);
    v11 = 68289795;
    v12 = 0;
    v13 = 2082;
    v14 = "";
    v15 = 2113;
    v16 = v9;
    v17 = 2113;
    v18 = v10;
    v19 = 2113;
    v20 = a3;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian failed to send bytes", "{\"msg%{public}.0s\":\"#durian failed to send bytes\", \"item\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@, \"byteCount\":%{private, location:escape_only}@}", (uint8_t *)&v11, 0x30u);
  }
  -[CLDurianDevice transitionToState:event:task:](self, "transitionToState:event:task:", 4, 8, -[CLDurianDevice activeTask](self, "activeTask"));
  -[CLDurianDeviceDelegate device:didFailToCompleteTask:withError:andDisconnect:](-[CLDurianDevice delegate](self, "delegate"), "device:didFailToCompleteTask:withError:andDisconnect:", self, -[CLDurianDevice activeTask](self, "activeTask"), 4, 1);
  -[CLDurianDevice completeCurrentTask](self, "completeCurrentTask");
}

- (void)didReceiveData:(id)a3
{
  NSObject *v5;
  id v6;
  NSObject *v7;
  id v8;
  int v9;
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  id v14;

  if (objc_msgSend(a3, "length"))
  {
    objc_msgSend(a3, "bytes");
    -[CLDurianDevice handleDurianData:opcode:ackOpcode:](self, "handleDurianData:opcode:ackOpcode:", a3);
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
    v5 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
    {
      v6 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      v9 = 68289283;
      v10 = 0;
      v11 = 2082;
      v12 = "";
      v13 = 2113;
      v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian received airtag data too short\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v9, 0x1Cu);
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC538);
    }
    v7 = qword_1022A0038;
    if (os_signpost_enabled((os_log_t)qword_1022A0038))
    {
      v8 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      v9 = 68289283;
      v10 = 0;
      v11 = 2082;
      v12 = "";
      v13 = 2113;
      v14 = v8;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian received airtag data too short", "{\"msg%{public}.0s\":\"#durian received airtag data too short\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v9, 0x1Cu);
    }
  }
}

- (void)handleDurianData:(id)a3 opcode:(unsigned __int16)a4 ackOpcode:(unsigned __int16)a5
{
  uint64_t v5;
  uint64_t v6;
  _BOOL4 isMultiConnectionEnabled;
  uint64_t *v10;
  NSObject *v11;
  id v12;
  unsigned int v13;
  NSObject *v14;
  id v15;
  unsigned int v16;
  id v17;
  CLDurianTask *activeTask;
  unsigned int v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  NSObject *v23;
  id v24;
  unsigned int v25;
  CLDurianTask *v26;
  uint64_t v27;
  NSObject *v28;
  id v29;
  id v30;
  CLDurianTask *v31;
  NSObject *v32;
  id v33;
  CLDurianCommand *v34;
  CLDurianTask *v35;
  unsigned int v36;
  unsigned int v37;
  NSObject *v38;
  id v39;
  unsigned int lastObservedIndex;
  unsigned int v41;
  int v42;
  NSObject *v43;
  id v44;
  CLDurianCommand *v45;
  int v46;
  unsigned int v47;
  CLDurianDeviceDelegate *v48;
  uint64_t v49;
  uint64_t v50;
  NSObject *v51;
  id v52;
  const char *v53;
  char v54;
  CLDurianTask *v55;
  uint64_t v56;
  uint64_t v57;
  CLDurianTask *v58;
  CLDurianTask *v59;
  uint64_t v60;
  NSObject *v61;
  id v62;
  int lastMaxConnectionsSent;
  _BOOL4 v64;
  _BOOL4 v65;
  NSObject *v66;
  id v67;
  unsigned int v68;
  id v69;
  id v70;
  uint64_t v71;
  void *v72;
  void *v73;
  unsigned int v74;
  uint64_t *v75;
  NSObject *v76;
  id v77;
  CLDurianCommand *v78;
  NSObject *v79;
  id v80;
  unsigned __int8 *v81;
  int v82;
  int v83;
  NSObject *v84;
  id v85;
  unint64_t mutexState;
  id v87;
  NSObject *v88;
  id v89;
  _BOOL4 v90;
  NSObject *v91;
  id v92;
  _BOOL4 v93;
  unsigned int v94;
  int v95;
  _BOOL4 v96;
  NSMutableArray *obj;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  _BYTE v102[128];
  uint64_t buf;
  __int16 v104;
  const char *v105;
  __int16 v106;
  id v107;
  __int16 v108;
  _BYTE v109[10];
  _BYTE v110[10];
  __int16 v111;
  id v112;

  v5 = a5;
  v6 = a4;
  isMultiConnectionEnabled = self->_isMultiConnectionEnabled;
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC538);
  v10 = &qword_1022A0000;
  v11 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v12 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
    buf = 68290051;
    v104 = 2082;
    v105 = "";
    v106 = 2113;
    v107 = v12;
    v108 = 1026;
    *(_DWORD *)v109 = v6;
    *(_WORD *)&v109[4] = 1026;
    *(_DWORD *)&v109[6] = v5;
    *(_WORD *)v110 = 2113;
    *(_QWORD *)&v110[2] = a3;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian received data\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d, \"acked opcode\":%{public}d, \"data\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x32u);
  }
  if (-[CLDurianDevice isNackTask:](self, "isNackTask:", v6))
  {
    v13 = -[CLDurianCommand opcode](-[CLDurianTask command](self->_activeTask, "command"), "opcode");
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
    v14 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      v16 = -[CLDurianCommand opcode](-[CLDurianTask command](-[CLDurianDevice activeTask](self, "activeTask"), "command"), "opcode");
      v17 = objc_msgSend(+[CLDurianVersionNumberUtilities getStringFromNumber:](CLDurianVersionNumberUtilities, "getStringFromNumber:", -[CLDurianDevice buildNumber](self, "buildNumber")), "UTF8String");
      buf = 68290307;
      v104 = 2082;
      v105 = "";
      v106 = 2113;
      v107 = v15;
      v108 = 1026;
      *(_DWORD *)v109 = v5;
      *(_WORD *)&v109[4] = 1026;
      *(_DWORD *)&v109[6] = v16;
      *(_WORD *)v110 = 2082;
      *(_QWORD *)&v110[2] = v17;
      v111 = 2113;
      v112 = a3;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian received nack\", \"item\":%{private, location:escape_only}@, \"nack opcode\":%{public}d, \"active opcode\":%{public}d, \"version\":%{public, location:escape_only}s, \"data\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x3Cu);
    }
    activeTask = self->_activeTask;
    if (!activeTask || v13 != (_DWORD)v5)
      goto LABEL_142;
    v19 = -[CLDurianTask isMutexProtectedRangingTask](activeTask, "isMutexProtectedRangingTask");
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
    v20 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v21 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      buf = 68289795;
      v104 = 2082;
      v105 = "";
      v106 = 2113;
      v107 = v21;
      v108 = 1026;
      *(_DWORD *)v109 = v13;
      *(_WORD *)&v109[4] = 1026;
      *(_DWORD *)&v109[6] = v19;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian handle nack\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d, \"rangeProtected\":%{public}d}", (uint8_t *)&buf, 0x28u);
    }
    if (v19)
      v22 = 12;
    else
      v22 = 1;
    -[CLDurianDeviceDelegate device:didFailToCompleteTask:withError:andDisconnect:](-[CLDurianDevice delegate](self, "delegate"), "device:didFailToCompleteTask:withError:andDisconnect:", self, self->_activeTask, v22, 0);
    goto LABEL_141;
  }
  if (-[CLDurianDevice isAckTask:](self, "isAckTask:", v6)
    && -[CLDurianDevice isActiveTaskOpcode:](self, "isActiveTaskOpcode:", v5))
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
    v23 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v24 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      buf = 68289539;
      v104 = 2082;
      v105 = "";
      v106 = 2113;
      v107 = v24;
      v108 = 1026;
      *(_DWORD *)v109 = v5;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian received ack for active task\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d}", (uint8_t *)&buf, 0x22u);
    }
    -[CLDurianDevice processAcknowledgedTask](self, "processAcknowledgedTask");
    v25 = -[CLDurianTask expectsResponse](-[CLDurianDevice activeTask](self, "activeTask"), "expectsResponse");
    v26 = -[CLDurianDevice activeTask](self, "activeTask");
    if (v25)
    {
      -[CLDurianDevice transitionToState:event:task:](self, "transitionToState:event:task:", 6, 12, v26);
      if (!objc_msgSend(-[NSMutableArray firstObject](self->_pendingTasks, "firstObject"), "shouldPreemptTask:", -[CLDurianDevice activeTask](self, "activeTask")))
      {
        v54 = 0;
LABEL_95:
        v59 = self->_activeTask;
        v60 = objc_opt_class(CLDurianGATTRepeatedReadTask, v27);
        if ((objc_opt_isKindOfClass(v59, v60) & 1) != 0)
          -[CBPeripheral readValueForCharacteristic:](self->_activePeripheral, "readValueForCharacteristic:", -[CLDurianTask characteristic](-[CLDurianDevice activeTask](self, "activeTask"), "characteristic"));
        if (-[CLDurianDevice isSetMaxConnectionsTask:](self, "isSetMaxConnectionsTask:", v5))
        {
          self->_isMultiConnectionEnabled = self->_lastMaxConnectionsSent > 1u;
          if (qword_1022A0030 != -1)
            dispatch_once(&qword_1022A0030, &stru_1021BC538);
          v61 = qword_1022A0038;
          if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEBUG))
          {
            v62 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
            lastMaxConnectionsSent = self->_lastMaxConnectionsSent;
            v64 = self->_isMultiConnectionEnabled;
            buf = 68289795;
            v104 = 2082;
            v105 = "";
            v106 = 2113;
            v107 = v62;
            v108 = 1026;
            *(_DWORD *)v109 = lastMaxConnectionsSent;
            *(_WORD *)&v109[4] = 1025;
            *(_DWORD *)&v109[6] = v64;
            _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#durian #multi setmax\", \"item\":%{private, location:escape_only}@, \"sent\":%{public}d, \"enabled\":%{private}d}", (uint8_t *)&buf, 0x28u);
          }
          self->_lastMaxConnectionsSent = 0;
        }
        if ((v54 & 1) == 0)
          goto LABEL_142;
        goto LABEL_141;
      }
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC538);
      v28 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
      {
        v29 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
        v30 = -[NSMutableArray firstObject](self->_pendingTasks, "firstObject");
        v31 = -[CLDurianDevice activeTask](self, "activeTask");
        buf = 68289795;
        v104 = 2082;
        v105 = "";
        v106 = 2113;
        v107 = v29;
        v108 = 2113;
        *(_QWORD *)v109 = v30;
        *(_WORD *)&v109[8] = 2113;
        *(_QWORD *)v110 = v31;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian received data, enqueuing preempted task\", \"item\":%{private, location:escape_only}@, \"pendingTask\":%{private, location:escape_only}@, \"activeTask\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x30u);
      }
      -[NSMutableArray addObject:](self->_preemptedTasks, "addObject:", -[CLDurianDevice activeTask](self, "activeTask"));
      -[CLDurianDevice schedulePreemptedTaskTimeout:forTask:](self, "schedulePreemptedTaskTimeout:forTask:", 10, -[CLDurianDevice activeTask](self, "activeTask"));
      -[CLDurianDevice logTaskCounts:](self, "logTaskCounts:", CFSTR("ackcheck"));
    }
    else
    {
      -[CLDurianDevice transitionToState:event:task:](self, "transitionToState:event:task:", 4, 12, v26);
      -[CLDurianDeviceDelegate device:didCompleteTask:withCompletionCommand:](-[CLDurianDevice delegate](self, "delegate"), "device:didCompleteTask:withCompletionCommand:", self, -[CLDurianDevice activeTask](self, "activeTask"), 0);
    }
    v54 = 1;
    goto LABEL_95;
  }
  if (!-[CLDurianTask expectsResponse](-[CLDurianDevice activeTask](self, "activeTask"), "expectsResponse")
    || !-[CLDurianDevice isActiveTaskOpcode:](self, "isActiveTaskOpcode:", v6)
    && !-[CLDurianDevice isEndpointTask:](self, "isEndpointTask:", v6))
  {
    if (-[CLDurianDevice isRangingSessionTask:](self, "isRangingSessionTask:", v6))
    {
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC538);
      v43 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
      {
        v44 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
        buf = 68289539;
        v104 = 2082;
        v105 = "";
        v106 = 2113;
        v107 = v44;
        v108 = 1026;
        *(_DWORD *)v109 = v6;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian received ranging session data\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d}", (uint8_t *)&buf, 0x22u);
      }
      v45 = -[CLDurianCommand initWithData:]([CLDurianCommand alloc], "initWithData:", a3);
      -[CLDurianDeviceDelegate device:didReceiveRangingResponse:withOpcode:](-[CLDurianDevice delegate](self, "delegate"), "device:didReceiveRangingResponse:withOpcode:", self, v45, v6);
LABEL_72:

      goto LABEL_73;
    }
    if (-[CLDurianDevice isSoundCompleteTask:](self, "isSoundCompleteTask:", v6))
    {
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC538);
      v51 = qword_1022A0038;
      if (!os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
        goto LABEL_73;
      v52 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      buf = 68289283;
      v104 = 2082;
      v105 = "";
      v106 = 2113;
      v107 = v52;
      v53 = "{\"msg%{public}.0s\":\"#durian received sound session response\", \"item\":%{private, location:escape_only}@}";
    }
    else
    {
      if (-[CLDurianDevice isFirmwareVersionCrashTask:](self, "isFirmwareVersionCrashTask:", v6))
      {
        v55 = -[CLDurianDevice activeTask](self, "activeTask");
        v57 = objc_opt_class(CLDurianFetchFirmwareVersionTask, v56);
        if ((objc_opt_isKindOfClass(v55, v57) & 1) != 0)
        {
          v58 = -[CLDurianDevice activeTask](self, "activeTask");
          if (-[CLDurianDevice isNordicCrashTask:](self, "isNordicCrashTask:", v6))
          {
            -[CLDurianTask appendNordicCrashData:](v58, "appendNordicCrashData:", a3);
          }
          else if (-[CLDurianDevice isR1CrashTask:](self, "isR1CrashTask:", v6))
          {
            -[CLDurianTask appendRoseCrashData:](v58, "appendRoseCrashData:", a3);
          }
          goto LABEL_73;
        }
      }
      if (-[CLDurianDevice isGroupStatusResponse:](self, "isGroupStatusResponse:", v6))
      {
        -[CLDurianDevice handleGroupStatusReply:](self, "handleGroupStatusReply:", a3);
        goto LABEL_73;
      }
      if (-[CLDurianDevice isKeyRollTask:](self, "isKeyRollTask:", v6))
      {
        -[CLDurianDevice handleKeyRollData:](self, "handleKeyRollData:", a3);
        if (!self->_firmwareUpdateMode && self->_leashState == 3)
        {
          if (-[CLDurianDevice isAirTag](self, "isAirTag"))
            -[CLDurianDevice enqueueTask:](self, "enqueueTask:", +[CLDurianTask rollWildKeyTask](CLDurianTask, "rollWildKeyTask"));
          if (-[CLDurianDevice isHawkeyeAccessory](self, "isHawkeyeAccessory"))
          {
            if (qword_1022A0030 != -1)
              dispatch_once(&qword_1022A0030, &stru_1021BC538);
            v79 = qword_1022A0038;
            if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
            {
              v80 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
              buf = 68289283;
              v104 = 2082;
              v105 = "";
              v106 = 2113;
              v107 = v80;
              _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye rollWildKey\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x1Cu);
            }
            -[CLDurianDevice enqueueTask:](self, "enqueueTask:", +[CLDurianTask latchSeparatedKeyHawkeyeTask](CLDurianTask, "latchSeparatedKeyHawkeyeTask"));
          }
        }
        goto LABEL_73;
      }
      if (!self->_isMultiConnectionEnabled)
        goto LABEL_182;
      if (-[CLDurianDevice isMutexTask:](self, "isMutexTask:", v6))
      {
        v45 = -[CLDurianCommand initWithData:]([CLDurianCommand alloc], "initWithData:", a3);
        v81 = -[NSData bytes](-[CLDurianCommand payload](v45, "payload"), "bytes");
        v82 = *v81;
        v83 = v81[1];
        if (qword_1022A0030 != -1)
          dispatch_once(&qword_1022A0030, &stru_1021BC538);
        v84 = qword_1022A0038;
        if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
        {
          v85 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
          mutexState = self->_mutexState;
          buf = 68290051;
          v104 = 2082;
          v105 = "";
          v106 = 2113;
          v107 = v85;
          v108 = 1025;
          *(_DWORD *)v109 = v82;
          *(_WORD *)&v109[4] = 1025;
          *(_DWORD *)&v109[6] = v83;
          *(_WORD *)v110 = 1025;
          *(_DWORD *)&v110[2] = mutexState;
          _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #mutex outside response\", \"item\":%{private, location:escape_only}@, \"mutexAction\":%{private}d, \"mutexResponse\":%{private}d, \"prior mutexState\":%{private}d}", (uint8_t *)&buf, 0x2Eu);
        }
        if (!(v82 | v83))
          -[CLDurianDevice setMutexState:](self, "setMutexState:", 0);
        goto LABEL_72;
      }
      if (!self->_isMultiConnectionEnabled || !-[CLDurianDevice isFwdlAbortTask:](self, "isFwdlAbortTask:", v5))
      {
LABEL_182:
        if (-[NSMutableArray count](self->_preemptedTasks, "count"))
        {
          v46 = 0;
          v65 = isMultiConnectionEnabled;
LABEL_114:
          v96 = v65;
          if (qword_1022A0030 != -1)
            dispatch_once(&qword_1022A0030, &stru_1021BC538);
          v66 = qword_1022A0038;
          if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
          {
            v67 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
            v68 = -[NSMutableArray count](self->_preemptedTasks, "count");
            buf = 68289795;
            v104 = 2082;
            v105 = "";
            v106 = 2113;
            v107 = v67;
            v108 = 1026;
            *(_DWORD *)v109 = v68;
            *(_WORD *)&v109[4] = 1026;
            *(_DWORD *)&v109[6] = v6;
            _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian preemption check\", \"item\":%{private, location:escape_only}@, \"queue\":%{public}d, \"opcode\":%{public}d}", (uint8_t *)&buf, 0x28u);
          }
          v100 = 0u;
          v101 = 0u;
          v98 = 0u;
          v99 = 0u;
          obj = self->_preemptedTasks;
          v69 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v98, v102, 16);
          if (v69)
          {
            v70 = v69;
            v71 = *(_QWORD *)v99;
            v94 = v5;
            v95 = v46;
LABEL_120:
            v72 = 0;
            while (1)
            {
              if (*(_QWORD *)v99 != v71)
                objc_enumerationMutation(obj);
              v73 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * (_QWORD)v72);
              v74 = objc_msgSend(objc_msgSend(v73, "command"), "opcode");
              if (qword_1022A0030 != -1)
                dispatch_once(&qword_1022A0030, &stru_1021BC538);
              v75 = v10;
              v76 = v10[7];
              if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
              {
                v77 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
                buf = 68289539;
                v104 = 2082;
                v105 = "";
                v106 = 2113;
                v107 = v77;
                v108 = 1026;
                *(_DWORD *)v109 = v74;
                _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian preempted opcode\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d}", (uint8_t *)&buf, 0x22u);
              }
              if (objc_msgSend(objc_msgSend(v73, "command"), "opcode") == (_DWORD)v6
                || -[CLDurianDevice isSoundCompleteTask:](self, "isSoundCompleteTask:", v6)
                || -[CLDurianDevice isAggAdvCompleteTask:](self, "isAggAdvCompleteTask:", v6)
                || -[CLDurianDevice isRangingStartTask:](self, "isRangingStartTask:", objc_msgSend(objc_msgSend(v73, "command"), "opcode"))&& -[CLDurianDevice isRangingCompleteTask:](self, "isRangingCompleteTask:", v6)|| -[CLDurianDevice isNonOwnerSoundCompleteTask:](self, "isNonOwnerSoundCompleteTask:", v6))
              {
                break;
              }
              v72 = (char *)v72 + 1;
              v10 = v75;
              if (v70 == v72)
              {
                v70 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v98, v102, 16);
                v5 = v94;
                v46 = v95;
                if (v70)
                  goto LABEL_120;
                goto LABEL_135;
              }
            }
            v78 = -[CLDurianCommand initWithData:]([CLDurianCommand alloc], "initWithData:", a3);
            -[CLDurianDeviceDelegate device:didCompleteTask:withCompletionCommand:](-[CLDurianDevice delegate](self, "delegate"), "device:didCompleteTask:withCompletionCommand:", self, v73, v78);

            -[CLDurianDevice cancelTimeoutForTask:dictionary:](self, "cancelTimeoutForTask:dictionary:", v73, self->_preemptedTaskTimeouts);
            -[NSMutableArray removeObject:](self->_preemptedTasks, "removeObject:", v73);
            -[CLDurianDevice logTaskCounts:](self, "logTaskCounts:", CFSTR("preemptdone"));
            -[CLDurianDevice processNextTask:](self, "processNextTask:", CFSTR("didReceiveData"));
            if (self->_preparingForRanging)
              -[CLDurianDevice checkPrepareRanging](self, "checkPrepareRanging");
            if ((v95 & 1) == 0)
              goto LABEL_142;
            goto LABEL_141;
          }
LABEL_135:
          if (!v96)
          {
            if (!v46)
              goto LABEL_142;
            goto LABEL_141;
          }
LABEL_75:
          v47 = -[CLDurianDevice isAckTask:](self, "isAckTask:", v6);
          v48 = -[CLDurianDevice delegate](self, "delegate");
          if (v47)
          {
            v49 = v5;
            v50 = 1;
          }
          else
          {
            v49 = v6;
            v50 = 0;
          }
          -[CLDurianDeviceDelegate device:checkForEchoOfOpcode:fromAck:](v48, "device:checkForEchoOfOpcode:fromAck:", self, v49, v50);
          if ((v46 & 1) == 0)
            goto LABEL_142;
          goto LABEL_141;
        }
        if (qword_1022A0030 != -1)
          dispatch_once(&qword_1022A0030, &stru_1021BC538);
        v88 = qword_1022A0038;
        if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
        {
          v89 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
          v90 = self->_isMultiConnectionEnabled;
          buf = 68290051;
          v104 = 2082;
          v105 = "";
          v106 = 2113;
          v107 = v89;
          v108 = 1026;
          *(_DWORD *)v109 = v6;
          *(_WORD *)&v109[4] = 1026;
          *(_DWORD *)&v109[6] = v90;
          *(_WORD *)v110 = 2113;
          *(_QWORD *)&v110[2] = a3;
          _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian received unexpected data\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d, \"multi\":%{public}d, \"data\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x32u);
          if (qword_1022A0030 != -1)
            dispatch_once(&qword_1022A0030, &stru_1021BC538);
        }
        v91 = qword_1022A0038;
        if (os_signpost_enabled((os_log_t)qword_1022A0038))
        {
          v92 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
          v93 = self->_isMultiConnectionEnabled;
          buf = 68290051;
          v104 = 2082;
          v105 = "";
          v106 = 2113;
          v107 = v92;
          v108 = 1026;
          *(_DWORD *)v109 = v6;
          *(_WORD *)&v109[4] = 1026;
          *(_DWORD *)&v109[6] = v93;
          *(_WORD *)v110 = 2113;
          *(_QWORD *)&v110[2] = a3;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v91, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian received unexpected data", "{\"msg%{public}.0s\":\"#durian received unexpected data\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d, \"multi\":%{public}d, \"data\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x32u);
        }
LABEL_73:
        if (!isMultiConnectionEnabled)
        {
LABEL_142:
          -[CLDurianDevice logTaskCounts:](self, "logTaskCounts:", CFSTR("handled"));
          return;
        }
        LOBYTE(v46) = 0;
        goto LABEL_75;
      }
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC538);
      v51 = qword_1022A0038;
      if (!os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
        goto LABEL_73;
      v87 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      buf = 68289283;
      v104 = 2082;
      v105 = "";
      v106 = 2113;
      v107 = v87;
      v53 = "{\"msg%{public}.0s\":\"#durian #multi outside fwdlabort\", \"item\":%{private, location:escape_only}@}";
    }
    _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, v53, (uint8_t *)&buf, 0x1Cu);
    goto LABEL_73;
  }
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC538);
  v32 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v33 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
    buf = 68289539;
    v104 = 2082;
    v105 = "";
    v106 = 2113;
    v107 = v33;
    v108 = 1026;
    *(_DWORD *)v109 = v6;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian received response for active task\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d}", (uint8_t *)&buf, 0x22u);
  }
  -[CLDurianDevice transitionToState:event:task:](self, "transitionToState:event:task:", 4, 13, -[CLDurianDevice activeTask](self, "activeTask"));
  v34 = -[CLDurianCommand initWithData:]([CLDurianCommand alloc], "initWithData:", a3);
  if (!-[CLDurianDevice isUserStatsV2Opcode:](self, "isUserStatsV2Opcode:", v6)
    || (v35 = -[CLDurianDevice activeTask](self, "activeTask"),
        -[CLDurianTask appendUserStatsData:](v35, "appendUserStatsData:", -[CLDurianCommand payload](v34, "payload")),
        -[CLDurianTask isComplete](v35, "isComplete")))
  {
    if (-[CLDurianDevice isMultiStatusResponse:](self, "isMultiStatusResponse:", v6))
    {
      if (-[CLDurianDevice isAirTag](self, "isAirTag"))
        -[CLDurianDevice handleMultiStatusReply:](self, "handleMultiStatusReply:", *(unsigned __int8 *)-[NSData bytes](-[CLDurianCommand payload](v34, "payload"), "bytes"));
      if (-[CLDurianDevice isHawkeyeAccessory](self, "isHawkeyeAccessory"))
        -[CLDurianDevice handleMultiStatusReply:](self, "handleMultiStatusReply:", *((unsigned __int8 *)objc_msgSend(a3, "bytes") + 3));
    }
    if (-[CLDurianDevice isGroupStatusResponse:](self, "isGroupStatusResponse:", v6)
      && -[CLDurianDevice isHawkeyeAccessory](self, "isHawkeyeAccessory"))
    {
      -[CLDurianDevice handleGroupStatusReply:](self, "handleGroupStatusReply:", a3);
    }
    v36 = -[CLDurianDevice isHawkeyeAccessory](self, "isHawkeyeAccessory");
    if ((_DWORD)v6 == 526 && v36)
    {
      v37 = *(_DWORD *)((char *)objc_msgSend(a3, "bytes") + 3);
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC538);
      v38 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
      {
        v39 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
        lastObservedIndex = self->_lastObservedIndex;
        buf = 68289795;
        v104 = 2082;
        v105 = "";
        v106 = 2113;
        v107 = v39;
        v108 = 1025;
        *(_DWORD *)v109 = v37;
        *(_WORD *)&v109[4] = 1025;
        *(_DWORD *)&v109[6] = lastObservedIndex;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian received latched index\", \"item\":%{private, location:escape_only}@, \"response\":%{private}d, \"prior lastObserved\":%{private}d}", (uint8_t *)&buf, 0x28u);
      }
      self->_lastObservedIndex = v37;
    }
    v41 = -[CLDurianDevice isPoshAccessory](self, "isPoshAccessory");
    if ((_DWORD)v6 == 771)
      v42 = v41;
    else
      v42 = 0;
    if (!-[CLDurianDevice isHawkeyeAccessory](self, "isHawkeyeAccessory"))
      goto LABEL_108;
    if ((int)v6 <= 770)
    {
      if ((_DWORD)v6 != 525 && (_DWORD)v6 != 532)
        goto LABEL_108;
    }
    else if ((_DWORD)v6 != 771 && (_DWORD)v6 != 1803 && (_DWORD)v6 != 1800)
    {
      goto LABEL_108;
    }
    v42 = 1;
LABEL_108:
    if (-[CLDurianDevice isAirTag](self, "isAirTag") && (v6 - 2056) <= 6 && ((1 << (v6 - 8)) & 0x49) != 0)
    {
      -[CLDurianDeviceDelegate device:didCompleteTask:withCompletionCommand:](-[CLDurianDevice delegate](self, "delegate"), "device:didCompleteTask:withCompletionCommand:", self, -[CLDurianDevice activeTask](self, "activeTask"), v34);

    }
    else
    {
      -[CLDurianDeviceDelegate device:didCompleteTask:withCompletionCommand:](-[CLDurianDevice delegate](self, "delegate"), "device:didCompleteTask:withCompletionCommand:", self, -[CLDurianDevice activeTask](self, "activeTask"), v34);

      if (!v42)
      {
LABEL_141:
        -[CLDurianDevice completeCurrentTask](self, "completeCurrentTask");
        goto LABEL_142;
      }
    }
    v65 = 0;
    v46 = 1;
    goto LABEL_114;
  }
}

- (void)handleInvalidData:(int64_t)a3
{
  NSObject *v5;
  id v6;
  NSObject *v7;
  id v8;
  const __CFString *v9;
  CLDurianTask *activeTask;
  CLDurianDeviceDelegate *delegate;
  int v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  const __CFString *v19;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC538);
  v5 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
  {
    v6 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
    v12 = 68289539;
    v13 = 0;
    v14 = 2082;
    v15 = "";
    v16 = 2113;
    v17 = v6;
    v18 = 2113;
    v19 = sub_101536DEC(a3);
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #hawkeye invalid data\", \"item\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v12, 0x26u);
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
  }
  v7 = qword_1022A0038;
  if (os_signpost_enabled((os_log_t)qword_1022A0038))
  {
    v8 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
    v9 = sub_101536DEC(a3);
    v12 = 68289539;
    v13 = 0;
    v14 = 2082;
    v15 = "";
    v16 = 2113;
    v17 = v8;
    v18 = 2113;
    v19 = v9;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #hawkeye invalid data", "{\"msg%{public}.0s\":\"#durian #hawkeye invalid data\", \"item\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v12, 0x26u);
  }
  activeTask = self->_activeTask;
  delegate = self->_delegate;
  if (activeTask)
    -[CLDurianDeviceDelegate device:didFailToCompleteTask:withError:andDisconnect:](delegate, "device:didFailToCompleteTask:withError:andDisconnect:", self, activeTask, a3, 1);
  else
    -[CLDurianDeviceDelegate device:didReceiveInvalidDataWithError:](delegate, "device:didReceiveInvalidDataWithError:", self, a3);
}

- (BOOL)checkPoshDataValidity:(id)a3
{
  CLDurianDevice *v5;
  uint64_t v6;
  int v7;
  unsigned int v8;
  NSObject *v9;
  id v10;
  _BOOL4 isMultiConnectionEnabled;
  unsigned int v12;
  NSObject *v13;
  id v14;
  NSObject *v16;
  id v17;
  unsigned int v18;
  int v19;
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  int v26;
  __int16 v27;
  unsigned int v28;
  __int16 v29;
  unsigned int v30;
  __int16 v31;
  unsigned int v32;

  if ((unint64_t)objc_msgSend(a3, "length") > 1)
  {
    v7 = *(unsigned __int16 *)objc_msgSend(a3, "bytes");
    if ((v7 - 2051) >= 0xA && (v7 - 770) >= 2 && v7 != 1029)
    {
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC538);
      v9 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
      {
        v10 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
        isMultiConnectionEnabled = self->_isMultiConnectionEnabled;
        v19 = 68289795;
        v20 = 0;
        v21 = 2082;
        v22 = "";
        v23 = 2113;
        v24 = v10;
        v25 = 1025;
        v26 = v7;
        v27 = 1026;
        v28 = isMultiConnectionEnabled;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut invalid opcode\", \"item\":%{private, location:escape_only}@, \"opcode\":%{private}d, \"multi\":%{public}d}", (uint8_t *)&v19, 0x28u);
      }
    }
    if (v7 > 2050)
    {
      v8 = 10;
      switch(v7)
      {
        case 2051:
        case 2054:
          goto LABEL_28;
        case 2052:
        case 2053:
          v12 = 66;
          goto LABEL_20;
        case 2055:
        case 2056:
        case 2058:
          goto LABEL_17;
        case 2057:
        case 2059:
        case 2060:
          v8 = 3;
          goto LABEL_28;
        default:
          goto LABEL_23;
      }
    }
    switch(v7)
    {
      case 770:
LABEL_17:
        v8 = 6;
        break;
      case 771:
        v12 = 4;
        goto LABEL_20;
      case 1029:
        v12 = 0x7FFFFFFF;
LABEL_20:
        if ((unint64_t)objc_msgSend(a3, "length") < 2 || (unint64_t)objc_msgSend(a3, "length") > v12)
        {
          v8 = 2;
LABEL_31:
          if (qword_1022A0030 != -1)
            dispatch_once(&qword_1022A0030, &stru_1021BC538);
          v16 = qword_1022A0038;
          if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
          {
            v17 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
            v18 = objc_msgSend(a3, "length");
            v19 = 68290307;
            v20 = 0;
            v21 = 2082;
            v22 = "";
            v23 = 2113;
            v24 = v17;
            v25 = 1026;
            v26 = v7;
            v27 = 1026;
            v28 = v18;
            v29 = 1026;
            v30 = v8;
            v31 = 1026;
            v32 = v12;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh unexpected length\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d, \"datalen\":%{public}d, \"expected\":%{public}d, \"max\":%{public}d}", (uint8_t *)&v19, 0x34u);
          }
          v5 = self;
          v6 = 21;
          goto LABEL_36;
        }
        return 1;
      default:
LABEL_23:
        if (qword_1022A0030 != -1)
          dispatch_once(&qword_1022A0030, &stru_1021BC538);
        v13 = qword_1022A0038;
        if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
        {
          v14 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
          v19 = 68289539;
          v20 = 0;
          v21 = 2082;
          v22 = "";
          v23 = 2113;
          v24 = v14;
          v25 = 1026;
          v26 = v7;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh #ut unspecified opcode for length check\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d}", (uint8_t *)&v19, 0x22u);
        }
        v8 = 2;
        break;
    }
LABEL_28:
    if (objc_msgSend(a3, "length") != (id)v8)
    {
      v12 = 0;
      goto LABEL_31;
    }
    return 1;
  }
  v5 = self;
  v6 = 25;
LABEL_36:
  -[CLDurianDevice handleInvalidData:](v5, "handleInvalidData:", v6);
  return 0;
}

- (BOOL)checkHawkeyeDataValidity:(id)a3
{
  CLDurianDevice *v5;
  uint64_t v6;
  int v7;
  BOOL v9;
  BOOL v11;
  BOOL result;
  unsigned int v13;
  int v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  _BOOL4 v18;
  id v19;
  _BOOL4 isMultiConnectionEnabled;
  NSObject *v21;
  id v22;
  NSObject *v23;
  id v24;
  int v25;
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  int v32;
  __int16 v33;
  unsigned int v34;
  __int16 v35;
  unsigned int v36;
  __int16 v37;
  int v38;

  if ((unint64_t)objc_msgSend(a3, "length") <= 2)
  {
    v5 = self;
    v6 = 25;
LABEL_56:
    -[CLDurianDevice handleInvalidData:](v5, "handleInvalidData:", v6);
    return 0;
  }
  v7 = *(unsigned __int16 *)((char *)objc_msgSend(a3, "bytes") + 1);
  if (v7 <= 0x501)
  {
    if ((v7 - 770) > 0x17 || ((1 << (v7 - 2)) & 0xFFC003) == 0)
    {
      v9 = (v7 - 522) > 0x1E || ((1 << (v7 - 10)) & 0x5300051F) == 0;
      if (v9 && ((v7 - 1026) > 4 || v7 == 1028))
        goto LABEL_59;
    }
LABEL_28:
    result = 1;
    v13 = 7;
    if (v7 > 1025)
    {
      if (v7 > 2047)
      {
        switch(v7)
        {
          case 2048:
          case 2054:
          case 2055:
          case 2058:
          case 2059:
            goto LABEL_48;
          case 2056:
LABEL_44:
            v13 = 8;
            goto LABEL_48;
          case 2057:
LABEL_45:
            v13 = 23;
            goto LABEL_48;
          case 2060:
          case 2062:
LABEL_36:
            v13 = 3;
            goto LABEL_48;
          default:
            goto LABEL_67;
        }
      }
      if (v7 > 1281)
      {
        switch(v7)
        {
          case 1792:
          case 1798:
          case 1799:
          case 1802:
          case 1803:
            goto LABEL_48;
          case 1793:
          case 1794:
          case 1795:
          case 1796:
          case 1797:
            goto LABEL_67;
          case 1800:
            goto LABEL_44;
          case 1801:
            goto LABEL_45;
          case 1804:
            goto LABEL_36;
          default:
            if (v7 == 1282)
              return result;
            if (v7 == 1283)
              goto LABEL_48;
            goto LABEL_67;
        }
      }
      if ((v7 - 1026) < 2 || v7 == 1029)
        return result;
      if (v7 != 1030)
      {
LABEL_67:
        if (qword_1022A0030 != -1)
          dispatch_once(&qword_1022A0030, &stru_1021BC538);
        v21 = qword_1022A0038;
        if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
        {
          v22 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
          v25 = 68289539;
          v26 = 0;
          v27 = 2082;
          v28 = "";
          v29 = 2113;
          v30 = v22;
          v31 = 1026;
          v32 = v7;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #hawkeye unspecified opcode for length check\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d}", (uint8_t *)&v25, 0x22u);
          if (qword_1022A0030 != -1)
            dispatch_once(&qword_1022A0030, &stru_1021BC538);
        }
        v23 = qword_1022A0038;
        if (os_signpost_enabled((os_log_t)qword_1022A0038))
        {
          v24 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
          v25 = 68289539;
          v26 = 0;
          v27 = 2082;
          v28 = "";
          v29 = 2113;
          v30 = v24;
          v31 = 1026;
          v32 = v7;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #hawkeye unspecified opcode for length check", "{\"msg%{public}.0s\":\"#durian #hawkeye unspecified opcode for length check\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d}", (uint8_t *)&v25, 0x22u);
        }
        return 1;
      }
    }
    else
    {
      if (v7 > 551)
      {
        switch(v7)
        {
          case 770:
            goto LABEL_48;
          case 771:
            goto LABEL_36;
          case 772:
          case 773:
          case 774:
          case 775:
          case 776:
          case 777:
          case 778:
          case 779:
          case 780:
          case 781:
          case 782:
          case 783:
            goto LABEL_67;
          case 784:
            goto LABEL_43;
          case 785:
          case 786:
          case 787:
          case 788:
          case 789:
          case 790:
          case 791:
          case 792:
          case 793:
            return result;
          default:
            if (v7 != 552)
              goto LABEL_67;
            if ((unint64_t)objc_msgSend(a3, "length") >= 4 && (unint64_t)objc_msgSend(a3, "length") <= 5)
              return 1;
            v13 = 4;
            v14 = 5;
            break;
        }
        goto LABEL_51;
      }
      switch(v7)
      {
        case 522:
        case 523:
        case 524:
        case 526:
          break;
        case 525:
        case 532:
          goto LABEL_36;
        case 527:
        case 528:
        case 529:
        case 531:
          goto LABEL_67;
        case 530:
          goto LABEL_43;
        default:
          if ((v7 - 546) < 2)
            break;
          if (v7 != 550)
            goto LABEL_67;
LABEL_43:
          v13 = 4;
          break;
      }
    }
LABEL_48:
    if (objc_msgSend(a3, "length") != (id)v13)
    {
      v14 = 0;
LABEL_51:
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC538);
      v15 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
      {
        v16 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
        v25 = 68290307;
        v26 = 0;
        v27 = 2082;
        v28 = "";
        v29 = 2113;
        v30 = v16;
        v31 = 1026;
        v32 = v7;
        v33 = 1026;
        v34 = objc_msgSend(a3, "length");
        v35 = 1026;
        v36 = v13;
        v37 = 1026;
        v38 = v14;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye unexpected length\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d, \"datalen\":%{public}d, \"expected\":%{public}d, \"max\":%{public}d}", (uint8_t *)&v25, 0x34u);
      }
      v5 = self;
      v6 = 21;
      goto LABEL_56;
    }
    return 1;
  }
  if ((v7 - 2048) <= 0xE && ((1 << v7) & 0x5FC1) != 0)
    goto LABEL_28;
  v11 = (v7 - 1792) > 0xC || ((1 << v7) & 0x1FC1) == 0;
  if (!v11 || (v7 - 1282) < 2)
    goto LABEL_28;
LABEL_59:
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC538);
  v17 = qword_1022A0038;
  v18 = os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT);
  result = 0;
  if (v18)
  {
    v19 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
    isMultiConnectionEnabled = self->_isMultiConnectionEnabled;
    v25 = 68289795;
    v26 = 0;
    v27 = 2082;
    v28 = "";
    v29 = 2113;
    v30 = v19;
    v31 = 1025;
    v32 = v7;
    v33 = 1026;
    v34 = isMultiConnectionEnabled;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye invalid opcode\", \"item\":%{private, location:escape_only}@, \"opcode\":%{private}d, \"multi\":%{public}d}", (uint8_t *)&v25, 0x28u);
    return 0;
  }
  return result;
}

- (BOOL)supportsFragmentationForOpcode:(unsigned __int16)a3
{
  CLDurianDevice *v3;
  int v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  id v9;
  int v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  int v18;

  v3 = self;
  LOBYTE(self) = 1;
  if ((a3 - 1026) > 3 || a3 == 1028)
  {
    v5 = a3;
    if (a3 != 1282)
    {
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC538);
      v6 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
      {
        v7 = objc_msgSend(-[NSUUID description](v3->_uuid, "description"), "substringToIndex:", 8);
        v11 = 68289539;
        v12 = 0;
        v13 = 2082;
        v14 = "";
        v15 = 2113;
        v16 = v7;
        v17 = 1026;
        v18 = v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #hawkeye fragmentation not supported for opcode\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d}", (uint8_t *)&v11, 0x22u);
        if (qword_1022A0030 != -1)
          dispatch_once(&qword_1022A0030, &stru_1021BC538);
      }
      v8 = qword_1022A0038;
      LODWORD(self) = os_signpost_enabled((os_log_t)qword_1022A0038);
      if ((_DWORD)self)
      {
        v9 = objc_msgSend(-[NSUUID description](v3->_uuid, "description"), "substringToIndex:", 8);
        v11 = 68289539;
        v12 = 0;
        v13 = 2082;
        v14 = "";
        v15 = 2113;
        v16 = v9;
        v17 = 1026;
        v18 = v5;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #hawkeye fragmentation not supported for opcode", "{\"msg%{public}.0s\":\"#durian #hawkeye fragmentation not supported for opcode\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d}", (uint8_t *)&v11, 0x22u);
        LOBYTE(self) = 0;
      }
    }
  }
  return (char)self;
}

- (BOOL)isPoshOptionalOpcode:(unsigned __int16)a3
{
  return (a3 - 11) < 2;
}

- (void)didReceivePoshData:(id)a3 withCharacteristic:(id)a4 error:(id)a5
{
  NSObject *v7;
  id v8;
  CLDurianTask *v10;
  CLDurianTask *v11;
  unsigned __int16 *v12;
  uint64_t v13;
  NSObject *v14;
  id v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  id v24;
  NSObject *v25;
  id v26;
  unsigned int v27;
  CLDurianCommand *v28;
  int v29;
  int v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  _BYTE v36[10];
  _BYTE v37[6];
  uint64_t v38;
  _DWORD v39[4];

  if (a5)
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
    v7 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      v29 = 68289539;
      v30 = 0;
      v31 = 2082;
      v32 = "";
      v33 = 2113;
      v34 = v8;
      v35 = 2113;
      *(_QWORD *)v36 = a5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh didReceivePoshData error\", \"item\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v29, 0x26u);
    }
LABEL_6:
    -[CLDurianDevice handleInvalidData:](self, "handleInvalidData:", 1);
    return;
  }
  if (!objc_msgSend(a3, "length"))
  {
    -[CLDurianDevice handleInvalidData:](self, "handleInvalidData:", 25);
    return;
  }
  v10 = -[CLDurianDevice activeTask](self, "activeTask");
  v11 = v10;
  if (v10
    && (-[CLDurianTask conformsToProtocol:](v10, "conformsToProtocol:", &OBJC_PROTOCOL___CLGATTTaskInformationProtocol) & 1) == 0)
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
    v19 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_FAULT))
    {
      v20 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      v29 = 68289283;
      v30 = 0;
      v31 = 2082;
      v32 = "";
      v33 = 2113;
      v34 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#durian #posh trying to handle new data but current active task doesn't conform to CLGATTTaskInformationProtocol\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v29, 0x1Cu);
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC538);
    }
    v21 = qword_1022A0038;
    if (os_signpost_enabled((os_log_t)qword_1022A0038))
    {
      v22 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      v29 = 68289283;
      v30 = 0;
      v31 = 2082;
      v32 = "";
      v33 = 2113;
      v34 = v22;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v21, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #posh trying to handle new data but current active task doesn't conform to CLGATTTaskInformationProtocol", "{\"msg%{public}.0s\":\"#durian #posh trying to handle new data but current active task doesn't conform to CLGATTTaskInformationProtocol\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v29, 0x1Cu);
    }
    goto LABEL_6;
  }
  v12 = (unsigned __int16 *)objc_msgSend(a3, "bytes");
  v13 = *v12;
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC538);
  v14 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v15 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
    v29 = 68290307;
    v30 = 0;
    v31 = 2082;
    v32 = "";
    v33 = 2113;
    v34 = v15;
    v35 = 2113;
    *(_QWORD *)v36 = a3;
    *(_WORD *)&v36[8] = 1026;
    *(_DWORD *)v37 = v13;
    *(_WORD *)&v37[4] = 2114;
    v38 = -[CLDurianTask opcodeDescription](-[CLDurianDevice activeTask](self, "activeTask"), "opcodeDescription");
    LOWORD(v39[0]) = 1026;
    *(_DWORD *)((char *)v39 + 2) = -[CLDurianTask expectsResponse](v11, "expectsResponse");
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh didReceivePoshData\", \"item\":%{private, location:escape_only}@, \"value\":%{private, location:escape_only}@, \"opcode\":%{public}d, \"active\":%{public, location:escape_only}@, \"expectsResponse\":%{public}d}", (uint8_t *)&v29, 0x3Cu);
  }
  if (-[CLDurianDevice checkPoshDataValidity:](self, "checkPoshDataValidity:", a3))
  {
    if ((_DWORD)v13 == 770)
    {
      v16 = v12[1];
      v17 = v12[2];
      if (v17)
      {
        v18 = 28;
        switch(v17)
        {
          case 1:
            switch((_DWORD)v16)
            {
              case 0x31A:
                goto LABEL_22;
              case 0x301:
                -[CLDurianTask setExpectsResponse:](v11, "setExpectsResponse:", 0);
                v18 = 24;
                break;
              case 0x300:
LABEL_22:
                -[CLDurianTask setExpectsResponse:](v11, "setExpectsResponse:", 0);
                v18 = 23;
                break;
              default:
                v18 = 27;
                break;
            }
LABEL_39:
            -[CLDurianDevice isPoshOptionalOpcode:](self, "isPoshOptionalOpcode:", v16);
LABEL_40:
            if (qword_1022A0030 != -1)
              dispatch_once(&qword_1022A0030, &stru_1021BC538);
            v25 = qword_1022A0038;
            if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
            {
              v26 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
              v29 = 68290563;
              v30 = 0;
              v31 = 2082;
              v32 = "";
              v33 = 2113;
              v34 = v26;
              v35 = 1026;
              *(_DWORD *)v36 = v16;
              *(_WORD *)&v36[4] = 1026;
              *(_DWORD *)&v36[6] = v17;
              *(_WORD *)v37 = 1026;
              *(_DWORD *)&v37[2] = v18;
              v38 = 0x402000000010402;
              v39[0] = ((unsigned __int16)(v17 + 1) < 6u) & (0x31u >> (v17 + 1));
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh response error\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d, \"response\":%{public}d, \"error\":%{public}d, \"fail\":%{public}hhd, \"disconnect\":%{public}hhd}", (uint8_t *)&v29, 0x3Au);
            }
            -[CLDurianDeviceDelegate device:didFailToCompleteTask:withError:andDisconnect:](self->_delegate, "device:didFailToCompleteTask:withError:andDisconnect:", self, self->_activeTask, v18, ((unsigned __int16)(v17 + 1) < 6u) & (0x31u >> (v17 + 1)));
            break;
          case 2:
            goto LABEL_39;
          case 3:
            v18 = 29;
            goto LABEL_39;
          case 4:
            v18 = 30;
            goto LABEL_39;
          default:
            v27 = -[CLDurianDevice isPoshOptionalOpcode:](self, "isPoshOptionalOpcode:", v16);
            if (v17 == 0xFFFF)
              v18 = 31;
            else
              v18 = 1;
            if (v17 != 0xFFFF || !v27)
              goto LABEL_40;
            v28 = -[CLDurianCommand initWithData:]([CLDurianCommand alloc], "initWithData:", a3);
            -[CLDurianDeviceDelegate device:didCompleteTask:withCompletionCommand:](-[CLDurianDevice delegate](self, "delegate"), "device:didCompleteTask:withCompletionCommand:", self, -[CLDurianDevice activeTask](self, "activeTask"), v28);

            break;
        }
        -[CLDurianDevice completeCurrentTask](self, "completeCurrentTask");
        return;
      }
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC538);
      v23 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
      {
        v24 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
        v29 = 68289795;
        v30 = 0;
        v31 = 2082;
        v32 = "";
        v33 = 2113;
        v34 = v24;
        v35 = 1026;
        *(_DWORD *)v36 = v16;
        *(_WORD *)&v36[4] = 1026;
        *(_DWORD *)&v36[6] = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh command response\", \"item\":%{private, location:escape_only}@, \"acked opcode\":%{public}d, \"response\":%{public}d}", (uint8_t *)&v29, 0x28u);
      }
    }
    else
    {
      v16 = 0;
    }
    -[CLDurianDevice handleDurianData:opcode:ackOpcode:](self, "handleDurianData:opcode:ackOpcode:", a3, v13, v16);
  }
}

- (void)didReceiveHawkeyeData:(id)a3 withCharacteristic:(id)a4 error:(id)a5
{
  NSObject *v7;
  id v8;
  CLDurianDevice *v9;
  uint64_t v10;
  NSMutableData *v12;
  CLDurianTask *v13;
  CLDurianTask *v14;
  unsigned __int8 v15;
  unsigned __int8 *v16;
  int v17;
  unsigned __int16 v18;
  unsigned __int8 v19;
  char *v20;
  id v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  id v25;
  int fragmentedOpcode;
  char *v27;
  char *v28;
  NSMutableData *v29;
  uint64_t v30;
  NSObject *v31;
  id v32;
  NSObject *v33;
  id v34;
  NSObject *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  CLDurianDevice *v41;
  uint64_t v42;
  NSObject *v43;
  id v44;
  id v45;
  unsigned int v46;
  id v47;
  unsigned int v48;
  uint64_t v49;
  NSObject *v50;
  id v51;
  unsigned __int16 v52;
  NSObject *v53;
  id v54;
  unsigned int v55;
  uint64_t v56;
  int v57;
  NSObject *v58;
  id v59;
  int v60;
  int v61;
  __int16 v62;
  const char *v63;
  __int16 v64;
  id v65;
  __int16 v66;
  _BYTE v67[10];
  _BYTE v68[20];
  id v69;

  if (a5)
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
    v7 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      v60 = 68289539;
      v61 = 0;
      v62 = 2082;
      v63 = "";
      v64 = 2113;
      v65 = v8;
      v66 = 2113;
      *(_QWORD *)v67 = a5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye didReceiveHawkeyeData error\", \"item\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v60, 0x26u);
    }
LABEL_6:
    v9 = self;
    v10 = 1;
LABEL_7:
    -[CLDurianDevice handleInvalidData:](v9, "handleInvalidData:", v10);
    return;
  }
  v12 = (NSMutableData *)a3;
  if (!objc_msgSend(a3, "length"))
    goto LABEL_52;
  v13 = -[CLDurianDevice activeTask](self, "activeTask");
  v14 = v13;
  if (!v13)
    goto LABEL_14;
  if ((-[CLDurianTask conformsToProtocol:](v13, "conformsToProtocol:", &OBJC_PROTOCOL___CLGATTTaskInformationProtocol) & 1) == 0)
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
    v22 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_FAULT))
    {
      v23 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      v60 = 68289283;
      v61 = 0;
      v62 = 2082;
      v63 = "";
      v64 = 2113;
      v65 = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye trying to handle new data but current active task doesn't conform to CLGATTTaskInformationProtocol\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v60, 0x1Cu);
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC538);
    }
    v24 = qword_1022A0038;
    if (os_signpost_enabled((os_log_t)qword_1022A0038))
    {
      v25 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      v60 = 68289283;
      v61 = 0;
      v62 = 2082;
      v63 = "";
      v64 = 2113;
      v65 = v25;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v24, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #hawkeye trying to handle new data but current active task doesn't conform to CLGATTTaskInformationProtocol", "{\"msg%{public}.0s\":\"#durian #hawkeye trying to handle new data but current active task doesn't conform to CLGATTTaskInformationProtocol\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v60, 0x1Cu);
    }
    goto LABEL_6;
  }
  if (objc_msgSend(-[CLDurianTask serviceUUID](v14, "serviceUUID"), "isEqual:", objc_msgSend(objc_msgSend(a4, "service"), "UUID")))v15 = objc_msgSend(-[CLDurianTask characteristicUUID](v14, "characteristicUUID"), "isEqual:", objc_msgSend(a4, "UUID"));
  else
LABEL_14:
    v15 = 0;
  v16 = (unsigned __int8 *)-[NSMutableData bytes](v12, "bytes");
  v17 = *v16;
  if (!*v16)
  {
    if ((v15 & 1) == 0)
    {
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC538);
      v33 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_FAULT))
      {
        v34 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
        v60 = 68290307;
        v61 = 0;
        v62 = 2082;
        v63 = "";
        v64 = 2113;
        v65 = v34;
        v66 = 2113;
        *(_QWORD *)v67 = objc_msgSend(objc_msgSend(a4, "service"), "UUID");
        *(_WORD *)&v67[8] = 2113;
        *(_QWORD *)v68 = objc_msgSend(a4, "UUID");
        *(_WORD *)&v68[8] = 2113;
        *(_QWORD *)&v68[10] = -[CLDurianTask serviceUUID](v14, "serviceUUID");
        *(_WORD *)&v68[18] = 2113;
        v69 = -[CLDurianTask characteristicUUID](v14, "characteristicUUID");
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye encountering simultaneous streaming fragments, aborting as CL cannot handle it\", \"item\":%{private, location:escape_only}@, \"incomingServiceUUID\":%{private, location:escape_only}@, \"incomingCharacteristicUUID\":%{private, location:escape_only}@, \"activeServiceUUID\":%{private, location:escape_only}@, \"activeCharacteristicUUID\":%{private, location:escape_only}@}", (uint8_t *)&v60, 0x44u);
        if (qword_1022A0030 != -1)
          dispatch_once(&qword_1022A0030, &stru_1021BC538);
      }
      v35 = qword_1022A0038;
      if (os_signpost_enabled((os_log_t)qword_1022A0038))
      {
        v36 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
        v37 = objc_msgSend(objc_msgSend(a4, "service"), "UUID");
        v38 = objc_msgSend(a4, "UUID");
        v39 = -[CLDurianTask serviceUUID](v14, "serviceUUID");
        v40 = -[CLDurianTask characteristicUUID](v14, "characteristicUUID");
        v60 = 68290307;
        v61 = 0;
        v62 = 2082;
        v63 = "";
        v64 = 2113;
        v65 = v36;
        v66 = 2113;
        *(_QWORD *)v67 = v37;
        *(_WORD *)&v67[8] = 2113;
        *(_QWORD *)v68 = v38;
        *(_WORD *)&v68[8] = 2113;
        *(_QWORD *)&v68[10] = v39;
        *(_WORD *)&v68[18] = 2113;
        v69 = v40;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v35, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #hawkeye encountering simultaneous streaming fragments, aborting as CL cannot handle it", "{\"msg%{public}.0s\":\"#durian #hawkeye encountering simultaneous streaming fragments, aborting as CL cannot handle it\", \"item\":%{private, location:escape_only}@, \"incomingServiceUUID\":%{private, location:escape_only}@, \"incomingCharacteristicUUID\":%{private, location:escape_only}@, \"activeServiceUUID\":%{private, location:escape_only}@, \"activeCharacteristicUUID\":%{private, location:escape_only}@}", (uint8_t *)&v60, 0x44u);
      }
      v9 = self;
      v10 = 26;
      goto LABEL_7;
    }
    fragmentedOpcode = self->_fragmentedOpcode;
    v27 = -[NSMutableData length](v12, "length");
    if (fragmentedOpcode)
    {
      v28 = v27 - 1;
      v29 = v12;
      v30 = 1;
      goto LABEL_32;
    }
    if ((unint64_t)v27 > 2)
    {
      v52 = *(_WORD *)(v16 + 1);
      if (!-[CLDurianDevice supportsFragmentationForOpcode:](self, "supportsFragmentationForOpcode:", v52))
      {
        v41 = self;
        v42 = 32;
        goto LABEL_53;
      }
      self->_fragmentedOpcode = v52;
      v28 = (char *)-[NSMutableData length](v12, "length") - 3;
      v29 = v12;
      v30 = 3;
LABEL_32:
      -[CLDurianDeviceDelegate device:didReceiveHawkeyeDataFragment:duringActiveTask:](self->_delegate, "device:didReceiveHawkeyeDataFragment:duringActiveTask:", self, -[NSMutableData subdataWithRange:](v29, "subdataWithRange:", v30, v28), v14);
      return;
    }
LABEL_52:
    v41 = self;
    v42 = 25;
LABEL_53:
    -[CLDurianDevice handleInvalidData:](v41, "handleInvalidData:", v42);
    return;
  }
  if (v17 != 1)
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
    v31 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v32 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      v60 = 68289539;
      v61 = 0;
      v62 = 2082;
      v63 = "";
      v64 = 2113;
      v65 = v32;
      v66 = 1025;
      *(_DWORD *)v67 = v17;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye unexpected fragmentation\", \"item\":%{private, location:escape_only}@, \"fragementStatus\":%{private}d}", (uint8_t *)&v60, 0x22u);
    }
    return;
  }
  v18 = self->_fragmentedOpcode;
  if (v18)
    v19 = v15;
  else
    v19 = 0;
  v20 = -[NSMutableData length](v12, "length");
  if ((v19 & 1) != 0)
  {
    v21 = -[NSMutableData subdataWithRange:](v12, "subdataWithRange:", 1, v20 - 1);
    LOBYTE(v60) = *v16;
    *(_WORD *)((char *)&v60 + 1) = self->_fragmentedOpcode;
    v12 = +[NSMutableData dataWithBytes:length:](NSMutableData, "dataWithBytes:length:", &v60, 3);
    -[NSMutableData appendData:](v12, "appendData:", v21);
    v16 = (unsigned __int8 *)-[NSMutableData bytes](v12, "bytes");
    self->_fragmentedOpcode = 0;
    goto LABEL_39;
  }
  if ((unint64_t)v20 <= 2)
    goto LABEL_52;
  v18 = *(_WORD *)(v16 + 1);
LABEL_39:
  if (-[CLDurianDevice hawkeyeTestMode](self, "hawkeyeTestMode"))
  {
    if (*(_WORD *)(v16 + 1) == 522)
    {
      if (-[CLDurianDevice hawkeyeTestMode](self, "hawkeyeTestMode") == 5)
      {
        v16[1] = rand();
        v16[2] = rand();
      }
      else if (-[CLDurianDevice hawkeyeTestMode](self, "hawkeyeTestMode") == 6)
      {
        *v16 = 1;
      }
    }
    if (-[CLDurianDevice hawkeyeTestMode](self, "hawkeyeTestMode") == 4)
      v16[5] = 2;
  }
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC538);
  v43 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v44 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
    v45 = -[CLDurianTask opcodeDescription](-[CLDurianDevice activeTask](self, "activeTask"), "opcodeDescription");
    v46 = -[CLDurianTask expectsResponse](v14, "expectsResponse");
    v60 = 68290307;
    v61 = 0;
    v62 = 2082;
    v63 = "";
    v64 = 2113;
    v65 = v44;
    v66 = 2113;
    *(_QWORD *)v67 = v12;
    *(_WORD *)&v67[8] = 1026;
    *(_DWORD *)v68 = v18;
    *(_WORD *)&v68[4] = 2114;
    *(_QWORD *)&v68[6] = v45;
    *(_WORD *)&v68[14] = 1026;
    *(_DWORD *)&v68[16] = v46;
    _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye didReceiveHawkeyeData\", \"item\":%{private, location:escape_only}@, \"value\":%{private, location:escape_only}@, \"opcode\":%{public}d, \"active\":%{public, location:escape_only}@, \"expectsResponse\":%{public}d}", (uint8_t *)&v60, 0x3Cu);
  }
  if (-[CLDurianDevice checkHawkeyeDataValidity:](self, "checkHawkeyeDataValidity:", v12))
  {
    v47 = 0;
    if (v18 > 0x502u)
    {
      if (v18 != 1283 && v18 != 2048 && v18 != 1792)
        goto LABEL_80;
    }
    else if (v18 != 523 && v18 != 770 && v18 != 1030)
    {
LABEL_80:
      -[CLDurianDevice handleDurianData:opcode:ackOpcode:](self, "handleDurianData:opcode:ackOpcode:", v12, v18, v47);
      return;
    }
    v47 = (id)*(unsigned __int16 *)(v16 + 3);
    v48 = *(unsigned __int16 *)(v16 + 5);
    if (!*(_WORD *)(v16 + 5))
    {
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC538);
      v50 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
      {
        v51 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
        v60 = 68289795;
        v61 = 0;
        v62 = 2082;
        v63 = "";
        v64 = 2113;
        v65 = v51;
        v66 = 1026;
        *(_DWORD *)v67 = (_DWORD)v47;
        *(_WORD *)&v67[4] = 1026;
        *(_DWORD *)&v67[6] = 0;
        _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye command response\", \"item\":%{private, location:escape_only}@, \"acked opcode\":%{public}d, \"response\":%{public}d}", (uint8_t *)&v60, 0x28u);
      }
      goto LABEL_80;
    }
    v49 = 28;
    switch(*(_WORD *)(v16 + 5))
    {
      case 1:
        if ((v47 & 0xFFFFFEFF) == 0x201)
        {
          -[CLDurianTask setExpectsResponse:](v14, "setExpectsResponse:", 0);
          v49 = 24;
        }
        else if ((v47 & 0xFFFFFEFF) == 0x200)
        {
          -[CLDurianTask setExpectsResponse:](v14, "setExpectsResponse:", 0);
          v49 = 23;
        }
        else
        {
          v49 = 27;
        }
        goto LABEL_96;
      case 2:
        goto LABEL_96;
      case 3:
        v49 = 29;
        goto LABEL_96;
      case 4:
        v49 = 30;
        goto LABEL_96;
      default:
        if (v48 == 0xFFFF)
        {
          if ((_DWORD)v47 == 551)
          {
            if (qword_1022A0030 != -1)
              dispatch_once(&qword_1022A0030, &stru_1021BC538);
            v53 = qword_1022A0038;
            if (!os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
            {
              v56 = 0;
              LODWORD(v47) = 551;
              v57 = 1;
              v49 = 31;
              goto LABEL_102;
            }
            v54 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
            v47 = objc_msgSend(-[NSUUID description](-[CLDurianDevice groupUuid](self, "groupUuid"), "description"), "substringToIndex:", 8);
            v55 = -[CLDurianDevice groupPartNumber](self, "groupPartNumber");
            v60 = 68289795;
            v61 = 0;
            v62 = 2082;
            v63 = "";
            v64 = 2113;
            v65 = v54;
            v66 = 2113;
            *(_QWORD *)v67 = v47;
            *(_WORD *)&v67[8] = 1026;
            *(_DWORD *)v68 = v55;
            _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye group status invalid\", \"item\":%{private, location:escape_only}@, \"group\":%{private, location:escape_only}@, \"part\":%{public}d}", (uint8_t *)&v60, 0x2Cu);
            v56 = 0;
            v57 = 1;
            LODWORD(v47) = 551;
            v49 = 31;
LABEL_100:
            if (qword_1022A0030 != -1)
              dispatch_once(&qword_1022A0030, &stru_1021BC538);
LABEL_102:
            v58 = qword_1022A0038;
            if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
            {
              v59 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
              v60 = 68290563;
              v61 = 0;
              v62 = 2082;
              v63 = "";
              v64 = 2113;
              v65 = v59;
              v66 = 1026;
              *(_DWORD *)v67 = (_DWORD)v47;
              *(_WORD *)&v67[4] = 1026;
              *(_DWORD *)&v67[6] = v48;
              *(_WORD *)v68 = 1026;
              *(_DWORD *)&v68[2] = v49;
              *(_WORD *)&v68[6] = 1026;
              *(_DWORD *)&v68[8] = v57;
              *(_WORD *)&v68[12] = 1026;
              *(_DWORD *)&v68[14] = v56;
              _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye response error\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d, \"response\":%{public}d, \"error\":%{public}d, \"fail\":%{public}hhd, \"disconnect\":%{public}hhd}", (uint8_t *)&v60, 0x3Au);
            }
            if (v57)
              -[CLDurianDeviceDelegate device:didFailToCompleteTask:withError:andDisconnect:](self->_delegate, "device:didFailToCompleteTask:withError:andDisconnect:", self, self->_activeTask, v49, v56);
            -[CLDurianDevice completeCurrentTask](self, "completeCurrentTask");
            return;
          }
          v49 = 31;
        }
        else
        {
          v49 = 1;
        }
LABEL_96:
        v56 = ((unsigned __int16)(v48 + 1) < 6u) & (0x31u >> (v48 + 1));
        v57 = 1;
        if ((_DWORD)v47 == 515 && v48 <= 4 && v48 != 3)
        {
          -[CLDurianDevice enqueueTask:](self, "enqueueTask:", +[CLDurianTask setNearbyTimeoutHawkeyeTaskWithTimeout:asHele:](CLDurianTask, "setNearbyTimeoutHawkeyeTaskWithTimeout:asHele:", 3600, 0));
          v57 = 0;
          LODWORD(v47) = 515;
        }
        goto LABEL_100;
    }
  }
}

- (void)requestDisconnection:(id)a3
{
  -[CLDurianDevice setDisconnectionReason:](self, "setDisconnectionReason:", a3);
  -[CLDurianDeviceDelegate requestDisconnectionForDevice:](-[CLDurianDevice delegate](self, "delegate"), "requestDisconnectionForDevice:", self);
}

- (void)cancelConnectionTimeoutForPeripheral:(id)a3
{
  -[CLDurianDeviceDelegate cancelConnectionTimeoutForPeripheral:](-[CLDurianDevice delegate](self, "delegate", a3), "cancelConnectionTimeoutForPeripheral:", -[CLDurianDevice activePeripheral](self, "activePeripheral"));
}

- (void)checkPrepareRanging
{
  unsigned int v3;
  unsigned int v4;
  id v5;
  uint64_t v6;
  id v7;
  BOOL v8;
  NSObject *v9;
  id v10;
  _BOOL4 preparingForRanging;
  int64_t currentLatency;
  _DWORD v13[2];
  __int16 v14;
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  _BOOL4 v19;
  __int16 v20;
  int v21;
  __int16 v22;
  unsigned int v23;
  __int16 v24;
  unsigned int v25;
  NSErrorUserInfoKey v26;
  const __CFString *v27;

  if (!-[CLDurianDevice isCapableOfDynamicConnectionLatency](self, "isCapableOfDynamicConnectionLatency"))
  {
    v5 = objc_alloc((Class)NSError);
    v6 = kCLErrorDomainPrivate;
    v26 = NSLocalizedDescriptionKey;
    v27 = sub_101536DEC(0x26uLL);
    v7 = objc_msgSend(v5, "initWithDomain:code:userInfo:", v6, 38, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1));
    -[CLDurianDeviceDelegate device:didPrepareForRangingWithError:](-[CLDurianDevice delegate](self, "delegate"), "device:didPrepareForRangingWithError:", self, v7);

    return;
  }
  v3 = !+[CLDurianDevice isDurianConnectionLatency:lowerThan:](CLDurianDevice, "isDurianConnectionLatency:lowerThan:", 0, self->_currentLatency);
  if ((v3 & 1) == 0)
  {
    -[CLDurianDevice setDesiredConnectionLatency](self, "setDesiredConnectionLatency");
    v4 = -[CLDurianDevice isTaskQueueEmpty](self, "isTaskQueueEmpty");
LABEL_8:
    v8 = 1;
    goto LABEL_9;
  }
  if (!-[CLDurianDevice isTaskQueueEmpty](self, "isTaskQueueEmpty"))
  {
    v4 = 0;
    goto LABEL_8;
  }
  -[CLDurianDeviceDelegate device:didPrepareForRangingWithError:](-[CLDurianDevice delegate](self, "delegate"), "device:didPrepareForRangingWithError:", self, 0);
  v8 = 0;
  v4 = 1;
LABEL_9:
  self->_preparingForRanging = v8;
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC538);
  v9 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
    preparingForRanging = self->_preparingForRanging;
    currentLatency = self->_currentLatency;
    v13[0] = 68290307;
    v13[1] = 0;
    v14 = 2082;
    v15 = "";
    v16 = 2113;
    v17 = v10;
    v18 = 1026;
    v19 = preparingForRanging;
    v20 = 1026;
    v21 = currentLatency;
    v22 = 1026;
    v23 = v3;
    v24 = 1026;
    v25 = v4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian check prepare ranging\", \"item\":%{private, location:escape_only}@, \"preparing\":%{public}hhd, \"latency\":%{public}d, \"already\":%{public}hhd, \"emptyq\":%{public}hhd}", (uint8_t *)v13, 0x34u);
  }
}

- (void)setDesiredConnectionLatency
{
  NSObject *v3;
  NSUUID *v4;
  int64_t currentLatency;
  double v6;
  double v7;
  double v8;
  BOOL v9;
  uint64_t v10;
  NSUUID *v11;
  int64_t v12;
  const char *v13;
  uint64_t v14;
  NSUUID *v15;
  NSUUID *uuid;
  NSObject *v17;
  uint32_t v18;
  double commandedLatencyTime;
  uint64_t v20;
  NSUUID *v21;
  CBCentralManager *centralManager;
  CBPeripheral *activePeripheral;
  NSObject *v24;
  NSUUID *v25;
  id v26;
  CLDurianTask *v27;
  int64_t commandedLatency;
  int64_t v29;
  double v30;
  NSUUID *v31;
  int64_t v32;
  _QWORD v33[5];
  char v34;
  int64_t v35;
  uint8_t buf[4];
  int v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  NSUUID *v41;
  __int16 v42;
  _BYTE v43[18];
  __int16 v44;
  int v45;
  __int16 v46;
  int v47;
  __int16 v48;
  double v49;
  __int16 v50;
  double v51;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC538);
  v3 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (NSUUID *)objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
    currentLatency = self->_currentLatency;
    *(_DWORD *)buf = 68289539;
    v37 = 0;
    v38 = 2082;
    v39 = "";
    v40 = 2113;
    v41 = v4;
    v42 = 1025;
    *(_DWORD *)v43 = currentLatency;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian latency evaluation\", \"item\":%{private, location:escape_only}@, \"ci\":%{private}d}", buf, 0x22u);
  }
  if (!self->_activePeripheral)
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
    v14 = qword_1022A0038;
    if (!os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
      return;
    v15 = (NSUUID *)objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
    *(_DWORD *)buf = 68289283;
    v37 = 0;
    v38 = 2082;
    v39 = "";
    v40 = 2113;
    v41 = v15;
    v13 = "{\"msg%{public}.0s\":\"#durian #latency notactive\", \"item\":%{private, location:escape_only}@}";
    goto LABEL_26;
  }
  if (!-[CLDurianDevice isCapableOfDynamicConnectionLatency](self, "isCapableOfDynamicConnectionLatency"))
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
    v14 = qword_1022A0038;
    if (!os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
      return;
    uuid = self->_uuid;
    *(_DWORD *)buf = 68289283;
    v37 = 0;
    v38 = 2082;
    v39 = "";
    v40 = 2113;
    v41 = uuid;
    v13 = "{\"msg%{public}.0s\":\"#durian #latency notsupported\", \"device\":%{private, location:escape_only}@}";
LABEL_26:
    v17 = v14;
    v18 = 28;
    goto LABEL_27;
  }
  sub_101536DD8();
  v7 = v6;
  v8 = (double)+[CLDurianDevice convertToMaxIntervalMsFromConnectionLatency:](CLDurianDevice, "convertToMaxIntervalMsFromConnectionLatency:", self->_currentLatency)* 20.0/ 1000.0+ 2.0;
  if (!self->_latencyCommandResponseArrived)
  {
    commandedLatencyTime = self->_commandedLatencyTime;
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
    v20 = qword_1022A0038;
    if (!os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
      return;
    v21 = (NSUUID *)objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
    *(_DWORD *)buf = 68289795;
    v37 = 0;
    v38 = 2082;
    v39 = "";
    v40 = 2113;
    v41 = v21;
    v42 = 1026;
    *(_DWORD *)v43 = (unint64_t)(v7 - commandedLatencyTime);
    *(_WORD *)&v43[4] = 2049;
    *(double *)&v43[6] = v8;
    v13 = "{\"msg%{public}.0s\":\"#durian latency inprogress\", \"item\":%{private, location:escape_only}@, \"timeSinceRe"
          "quest\":%{public}d, \"waitTime\":\"%{private}.1f\"}";
    v17 = v20;
    v18 = 44;
LABEL_27:
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v13, buf, v18);
    return;
  }
  v35 = -6;
  v34 = 0;
  -[CLDurianDevice determineCandidateLatency:forceCandidateLatency:](self, "determineCandidateLatency:forceCandidateLatency:", &v35, &v34);
  if (!+[CLDurianDevice isDurianConnectionLatency:lowerThan:](CLDurianDevice, "isDurianConnectionLatency:lowerThan:", v35, self->_currentLatency)&& (v7 - self->_currentLatencyStartTime <= 29.0 ? (v9 = v34 == 0) : (v9 = 0), v9))
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
    v10 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v31 = (NSUUID *)objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      v32 = self->_currentLatency;
      *(_DWORD *)buf = 68289795;
      v37 = 0;
      v38 = 2082;
      v39 = "";
      v40 = 2113;
      v41 = v31;
      v42 = 1025;
      *(_DWORD *)v43 = v32;
      *(_WORD *)&v43[4] = 1025;
      *(_DWORD *)&v43[6] = v35;
      v13 = "{\"msg%{public}.0s\":\"#durian latency alreadylower\", \"item\":%{private, location:escape_only}@, \"current"
            "\":%{private}d, \"candidate\":%{private}d}";
      goto LABEL_42;
    }
  }
  else if (v35 == self->_currentLatency)
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
    v10 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (NSUUID *)objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      v12 = self->_currentLatency;
      *(_DWORD *)buf = 68289795;
      v37 = 0;
      v38 = 2082;
      v39 = "";
      v40 = 2113;
      v41 = v11;
      v42 = 1025;
      *(_DWORD *)v43 = v12;
      *(_WORD *)&v43[4] = 1025;
      *(_DWORD *)&v43[6] = v35;
      v13 = "{\"msg%{public}.0s\":\"#durian latency alreadyat\", \"item\":%{private, location:escape_only}@, \"current\":"
            "%{private}d, \"candidate\":%{private}d}";
LABEL_42:
      v17 = v10;
      v18 = 40;
      goto LABEL_27;
    }
  }
  else
  {
    centralManager = self->_centralManager;
    activePeripheral = self->_activePeripheral;
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10150F014;
    v33[3] = &unk_102143618;
    v33[4] = self;
    -[CBCentralManager setDesiredConnectionLatency:forPeripheral:completion:](centralManager, "setDesiredConnectionLatency:forPeripheral:completion:", v35, activePeripheral, v33);
    self->_commandedLatency = v35;
    self->_commandedLatencyTime = v7;
    self->_latencyCommandResponseArrived = 0;
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
    v24 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v25 = (NSUUID *)objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      v26 = -[CBPeripheral identifier](self->_activePeripheral, "identifier");
      v27 = -[CLDurianDevice activeTask](self, "activeTask");
      commandedLatency = self->_commandedLatency;
      v29 = self->_currentLatency;
      v30 = v7 - self->_currentLatencyStartTime;
      *(_DWORD *)buf = 68290819;
      v37 = 0;
      v38 = 2082;
      v39 = "";
      v40 = 2113;
      v41 = v25;
      v42 = 2114;
      *(_QWORD *)v43 = v26;
      *(_WORD *)&v43[8] = 2113;
      *(_QWORD *)&v43[10] = v27;
      v44 = 1025;
      v45 = commandedLatency;
      v46 = 1025;
      v47 = v29;
      v48 = 2049;
      v49 = v8;
      v50 = 2049;
      v51 = v30;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #latency request update\", \"item\":%{private, location:escape_only}@, \"peripheralUUID\":%{public, location:escape_only}@, \"task\":%{private, location:escape_only}@, \"commanded\":%{private}d, \"current\":%{private}d, \"timeout\":\"%{private}.1f\", \"delta\":\"%{private}.1f\"}", buf, 0x50u);
    }
    -[CLDurianDevice scheduleLatencyTimeout:](self, "scheduleLatencyTimeout:", v8);
  }
}

- (void)determineCandidateLatency:(int64_t *)a3 forceCandidateLatency:(BOOL *)a4
{
  int64_t v7;
  NSMutableArray *pendingTasks;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  if (self->_firmwareUpdateMode)
  {
    *a3 = -7;
    return;
  }
  if (self->_preparingForRanging)
  {
    *a3 = 0;
LABEL_8:
    *a4 = 1;
    return;
  }
  if (-[CLDurianCommand opcode](-[CLDurianTask command](-[CLDurianDevice activeTask](self, "activeTask"), "command"), "opcode") == 3|| -[CLDurianCommand opcode](-[CLDurianTask command](-[CLDurianDevice activeTask](self, "activeTask"), "command"), "opcode") == 2051)
  {
    *a3 = -[CLDurianTask desiredLatency](-[CLDurianDevice activeTask](self, "activeTask"), "desiredLatency");
    goto LABEL_8;
  }
  v7 = -6;
  if (self->_isRoseInitialized)
    v7 = 0;
  *a3 = v7;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  pendingTasks = self->_pendingTasks;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](pendingTasks, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(pendingTasks);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if (+[CLDurianDevice isDurianConnectionLatency:lowerThan:](CLDurianDevice, "isDurianConnectionLatency:lowerThan:", objc_msgSend(v13, "desiredLatency"), *a3))
        {
          *a3 = (int64_t)objc_msgSend(v13, "desiredLatency");
        }
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](pendingTasks, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }
  if (self->_maintenanceOnlyCondition && -[CLDurianDevice isLeashSlotInUse](self, "isLeashSlotInUse") && *a3 == -6)
    goto LABEL_8;
}

- (void)scheduleLatencyTimeout:(double)a3
{
  NSObject *v4;
  NSUUID *uuid;
  NSObject *v6;
  NSUUID *v7;
  dispatch_time_t v8;
  dispatch_block_t v9;
  _QWORD block[5];
  uint8_t buf[4];
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  NSUUID *v16;

  if (self->_latencyTimeoutBlock)
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
    v4 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
    {
      uuid = self->_uuid;
      *(_DWORD *)buf = 68289283;
      v12 = 0;
      v13 = 2082;
      v14 = "";
      v15 = 2113;
      v16 = uuid;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian latency concurrent timeouts\", \"device\":%{private, location:escape_only}@}", buf, 0x1Cu);
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC538);
    }
    v6 = qword_1022A0038;
    if (os_signpost_enabled((os_log_t)qword_1022A0038))
    {
      v7 = self->_uuid;
      *(_DWORD *)buf = 68289283;
      v12 = 0;
      v13 = 2082;
      v14 = "";
      v15 = 2113;
      v16 = v7;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian latency concurrent timeouts", "{\"msg%{public}.0s\":\"#durian latency concurrent timeouts\", \"device\":%{private, location:escape_only}@}", buf, 0x1Cu);
    }
  }
  else
  {
    v8 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10150F61C;
    block[3] = &unk_10212BB58;
    block[4] = self;
    v9 = dispatch_block_create((dispatch_block_flags_t)0, block);
    self->_latencyTimeoutBlock = v9;
    dispatch_after(v8, (dispatch_queue_t)self->_queue, v9);
  }
}

- (void)clearLatencyTimeoutAndCancel:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  id v6;
  _BOOL4 v7;
  id latencyTimeoutBlock;
  _DWORD v9[2];
  __int16 v10;
  const char *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  _BOOL4 v15;
  __int16 v16;
  _BOOL4 v17;

  v3 = a3;
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC538);
  v5 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
    v7 = self->_latencyTimeoutBlock != 0;
    v9[0] = 68289795;
    v9[1] = 0;
    v10 = 2082;
    v11 = "";
    v12 = 2113;
    v13 = v6;
    v14 = 1026;
    v15 = v3;
    v16 = 1026;
    v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian latency clear time out\", \"item\":%{private, location:escape_only}@, \"cancel\":%{public}hhd, \"block\":%{public}hhd}", (uint8_t *)v9, 0x28u);
  }
  latencyTimeoutBlock = self->_latencyTimeoutBlock;
  if (latencyTimeoutBlock)
  {
    if (v3)
    {
      dispatch_block_cancel(latencyTimeoutBlock);
      latencyTimeoutBlock = self->_latencyTimeoutBlock;
    }
    _Block_release(latencyTimeoutBlock);
    self->_latencyTimeoutBlock = 0;
    self->_latencyCommandResponseArrived = 1;
  }
}

+ (int64_t)convertToLatencyFromConnectionInterval:(int)a3
{
  NSObject *v5;
  NSObject *v6;
  int v7;
  int v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;

  if (a3 == 15)
    return -7;
  if ((a3 - 10) < 0x15)
    return 0;
  if ((a3 - 100) < 0x15)
    return 1;
  if ((a3 - 970) < 0x1F)
    return -6;
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC538);
  v5 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
  {
    v7 = 68289283;
    v8 = 0;
    v9 = 2082;
    v10 = "";
    v11 = 2049;
    v12 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #latency unexpected ms\", \"intervalMs\":%{private}ld}", (uint8_t *)&v7, 0x1Cu);
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
  }
  v6 = qword_1022A0038;
  if (os_signpost_enabled((os_log_t)qword_1022A0038))
  {
    v7 = 68289283;
    v8 = 0;
    v9 = 2082;
    v10 = "";
    v11 = 2049;
    v12 = a3;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #latency unexpected ms", "{\"msg%{public}.0s\":\"#durian #latency unexpected ms\", \"intervalMs\":%{private}ld}", (uint8_t *)&v7, 0x1Cu);
  }
  return -99;
}

+ (int)convertToMaxIntervalMsFromConnectionLatency:(int64_t)a3
{
  int64_t v4;
  NSObject *v5;
  NSObject *v6;
  int v8;
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int64_t v13;

  v4 = a3 + 7;
  if ((unint64_t)(a3 + 7) < 9 && ((0x183u >> v4) & 1) != 0)
    return dword_101CC5E48[v4];
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC538);
  v5 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
  {
    v8 = 68289282;
    v9 = 0;
    v10 = 2082;
    v11 = "";
    v12 = 2050;
    v13 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #latency unexpected value\", \"latency\":%{public}ld}", (uint8_t *)&v8, 0x1Cu);
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
  }
  v6 = qword_1022A0038;
  if (os_signpost_enabled((os_log_t)qword_1022A0038))
  {
    v8 = 68289282;
    v9 = 0;
    v10 = 2082;
    v11 = "";
    v12 = 2050;
    v13 = a3;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #latency unexpected value", "{\"msg%{public}.0s\":\"#durian #latency unexpected value\", \"latency\":%{public}ld}", (uint8_t *)&v8, 0x1Cu);
  }
  return 1000;
}

- (void)didUpdateConnectionInterval:(id)a3 latency:(id)a4 supervisionTimeout:(id)a5
{
  NSObject *v7;
  id v8;
  id v9;
  double v10;
  _DWORD v11[2];
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  CLDurianTask *v19;
  __int16 v20;
  id v21;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC538);
  v7 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
    v9 = objc_msgSend(objc_msgSend(-[CBPeripheral identifier](self->_activePeripheral, "identifier"), "description"), "substringToIndex:", 8);
    v11[0] = 68290051;
    v11[1] = 0;
    v12 = 2082;
    v13 = "";
    v14 = 2113;
    v15 = v8;
    v16 = 2113;
    v17 = v9;
    v18 = 2113;
    v19 = -[CLDurianDevice activeTask](self, "activeTask");
    v20 = 2113;
    v21 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #latency didUpdateConnectionInterval\", \"item\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@, \"task\":%{private, location:escape_only}@, \"interval\":%{private, location:escape_only}@}", (uint8_t *)v11, 0x3Au);
  }
  self->_currentLatency = +[CLDurianDevice convertToLatencyFromConnectionInterval:](CLDurianDevice, "convertToLatencyFromConnectionInterval:", objc_msgSend(a3, "intValue"));
  sub_101536DD8();
  self->_currentLatencyStartTime = v10;
  -[CLDurianDevice clearLatencyTimeoutAndCancel:](self, "clearLatencyTimeoutAndCancel:", 1);
  if (self->_preparingForRanging)
    -[CLDurianDevice checkPrepareRanging](self, "checkPrepareRanging");
  -[CLDurianDevice setDesiredConnectionLatency](self, "setDesiredConnectionLatency");
}

- (void)didUpdateMTUForDevice
{
  NSObject *v3;
  id v4;
  unint64_t maxPacketSizeForGATTWriteWithResponse;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;
  __int16 v9;
  id v10;
  __int16 v11;
  unint64_t v12;

  self->_maxPacketSizeForGATTWriteWithResponse = -[CBPeripheral maximumWriteValueLengthForType:](self->_activePeripheral, "maximumWriteValueLengthForType:", 1);
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC538);
  v3 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
    maxPacketSizeForGATTWriteWithResponse = self->_maxPacketSizeForGATTWriteWithResponse;
    v6[0] = 68289539;
    v6[1] = 0;
    v7 = 2082;
    v8 = "";
    v9 = 2113;
    v10 = v4;
    v11 = 2049;
    v12 = maxPacketSizeForGATTWriteWithResponse;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian updating MTU size\", \"item\":%{private, location:escape_only}@, \"MTUSize\":%{private}lu}", (uint8_t *)v6, 0x26u);
  }
}

- (void)checkHelloMaintenanceTask:(id)a3
{
  unsigned int v5;
  unsigned int v6;
  NSObject *v7;
  id v8;
  _DWORD v9[2];
  __int16 v10;
  const char *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  unsigned int v15;
  __int16 v16;
  id v17;

  v5 = objc_msgSend(a3, "translatedOpcode");
  v6 = v5;
  if ((v5 > 0x2B || ((1 << v5) & 0x88000009C81) == 0)
    && (v5 - 517 > 0x23 || ((1 << (v5 - 5)) & 0xE60100001) == 0)
    && (v5 - 177 > 0x29 || ((1 << (v5 + 79)) & 0x24000100011) == 0)
    && self->_maintenanceOnlyCondition)
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
    v7 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      v9[0] = 68289795;
      v9[1] = 0;
      v10 = 2082;
      v11 = "";
      v12 = 2113;
      v13 = v8;
      v14 = 1026;
      v15 = v6;
      v16 = 2113;
      v17 = objc_msgSend(a3, "opcodeDescription");
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #maint only disabled\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d, \"task\":%{private, location:escape_only}@}", (uint8_t *)v9, 0x2Cu);
    }
    self->_maintenanceOnlyCondition = 0;
  }
}

- (BOOL)preprocessTask:(id)a3
{
  unsigned int v5;
  unsigned int v6;
  _BOOL4 v7;
  int64_t btFindingState;
  NSObject *v9;
  id v10;
  int64_t v11;
  _BOOL4 v12;
  _DWORD v14[2];
  __int16 v15;
  const char *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  unsigned int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  _BOOL4 v24;
  __int16 v25;
  _BOOL4 v26;

  v5 = objc_msgSend(objc_msgSend(a3, "command"), "opcode");
  v6 = v5;
  if (v5 == 40)
  {
    btFindingState = self->_btFindingState;
    if (btFindingState == 1)
    {
      if (!self->_pendingSoundTask)
      {
        v7 = 0;
        self->_pendingSoundTask = (CLDurianTask *)a3;
        goto LABEL_11;
      }
    }
    else if (btFindingState == 2)
    {
      -[CLDurianDevice enqueueTask:](self, "enqueueTask:", +[CLDurianTask stopAggressiveAdvertisingTask](CLDurianTask, "stopAggressiveAdvertisingTask"));
    }
    goto LABEL_10;
  }
  if (v5 != 527)
  {
    LOBYTE(v7) = 1;
    return v7;
  }
  if (self->_btFindingState)
  {
LABEL_10:
    v7 = 1;
    goto LABEL_11;
  }
  v7 = 1;
  self->_btFindingState = 1;
LABEL_11:
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC538);
  v9 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
    v11 = self->_btFindingState;
    v12 = self->_pendingSoundTask != 0;
    v14[0] = 68290307;
    v14[1] = 0;
    v15 = 2082;
    v16 = "";
    v17 = 2113;
    v18 = v10;
    v19 = 1026;
    v20 = v6;
    v21 = 1026;
    v22 = v11;
    v23 = 1026;
    v24 = v12;
    v25 = 1026;
    v26 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian preprocessing task\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d, \"btfind\":%{public}d, \"pendingsound\":%{public}hhd, \"enqueue\":%{public}d}", (uint8_t *)v14, 0x34u);
  }
  return v7;
}

- (void)enqueueTask:(id)a3
{
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  NSObject *v8;
  unsigned int v9;
  id v10;
  id v11;
  _BOOL4 v12;
  unsigned int v13;
  NSObject *v14;
  id v15;
  CLDurianTask *v16;
  NSObject *v17;
  id v18;
  unsigned int v19;
  NSObject *v20;
  id v21;
  unsigned int v22;
  uint64_t v23;
  id v24;
  CLDurianTask *v25;
  const char *v26;
  NSObject *v27;
  uint32_t v28;
  uint64_t v29;
  id v30;
  CLDurianTask *v31;
  unsigned int v32;
  uint64_t v33;
  _BYTE v34[42];
  __int16 v35;
  unsigned int v36;
  __int16 v37;
  _BOOL4 v38;
  __int16 v39;
  unsigned int v40;

  if (a3)
  {
    v5 = objc_msgSend(objc_msgSend(a3, "command"), "opcode");
    v6 = -[CLDurianDevice preprocessTask:](self, "preprocessTask:", a3);
    v7 = objc_msgSend(a3, "shouldPreemptTask:", -[CLDurianDevice activeTask](self, "activeTask"));
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
    v8 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v7;
      v10 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      v11 = objc_msgSend(a3, "opcodeDescription");
      v12 = -[CLDurianDevice activeTask](self, "activeTask") != 0;
      v13 = -[NSMutableArray count](self->_pendingTasks, "count");
      v33 = 68290819;
      *(_WORD *)v34 = 2082;
      *(_QWORD *)&v34[2] = "";
      *(_WORD *)&v34[10] = 2113;
      *(_QWORD *)&v34[12] = v10;
      v7 = v9;
      *(_WORD *)&v34[20] = 1026;
      *(_DWORD *)&v34[22] = v5;
      *(_WORD *)&v34[26] = 2113;
      *(_QWORD *)&v34[28] = v11;
      *(_WORD *)&v34[36] = 1026;
      *(_DWORD *)&v34[38] = v9;
      v35 = 1026;
      v36 = v6;
      v37 = 1026;
      v38 = v12;
      v39 = 1025;
      v40 = v13;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian enqueuing task\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d, \"task\":%{private, location:escape_only}@, \"preempt\":%{public}d, \"enqueue\":%{public}d, \"active\":%{public}hhd, \"length\":%{private}d}", (uint8_t *)&v33, 0x44u);
    }
    if (v6)
    {
      if (!v7)
      {
        -[NSMutableArray addObject:](self->_pendingTasks, "addObject:", a3);
LABEL_34:
        -[CLDurianDevice logTaskCounts:](self, "logTaskCounts:", CFSTR("enqueue"));
        if (-[CLDurianDevice isAirTag](self, "isAirTag") && self->_firmwareUpdateMode)
        {
          -[CLDurianDevice preemptFirmwareUpdate](self, "preemptFirmwareUpdate");
        }
        else if (-[CLDurianDevice activeTask](self, "activeTask")
               && (self->_activeTaskAcknowledged ? (v32 = v7) : (v32 = 0), v32 == 1))
        {
          -[CLDurianDevice completeCurrentTask](self, "completeCurrentTask");
        }
        else
        {
          -[CLDurianDevice processNextTask:](self, "processNextTask:", CFSTR("enqueueTask"));
        }
        return;
      }
      if (-[CLDurianDevice activeTask](self, "activeTask"))
      {
        if (-[CLDurianTask shouldCompleteOnPreemptionByTask:](-[CLDurianDevice activeTask](self, "activeTask"), "shouldCompleteOnPreemptionByTask:", a3))
        {
          if (qword_1022A0030 != -1)
            dispatch_once(&qword_1022A0030, &stru_1021BC538);
          v14 = qword_1022A0038;
          if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
          {
            v15 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
            v16 = -[CLDurianDevice activeTask](self, "activeTask");
            v33 = 68289539;
            *(_WORD *)v34 = 2082;
            *(_QWORD *)&v34[2] = "";
            *(_WORD *)&v34[10] = 2113;
            *(_QWORD *)&v34[12] = v15;
            *(_WORD *)&v34[20] = 2113;
            *(_QWORD *)&v34[22] = v16;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian complete current active task on preemption\", \"item\":%{private, location:escape_only}@, \"task\":%{private, location:escape_only}@}", (uint8_t *)&v33, 0x26u);
          }
          -[CLDurianDevice completeCurrentTask](self, "completeCurrentTask");
        }
        else
        {
          if (self->_activeTaskAcknowledged)
          {
            -[NSMutableArray addObject:](self->_preemptedTasks, "addObject:", -[CLDurianDevice activeTask](self, "activeTask"));
            -[CLDurianDevice schedulePreemptedTaskTimeout:forTask:](self, "schedulePreemptedTaskTimeout:forTask:", 10, -[CLDurianDevice activeTask](self, "activeTask"));
            -[CLDurianDevice logTaskCounts:](self, "logTaskCounts:", CFSTR("preempt"));
            if (qword_1022A0030 != -1)
              dispatch_once(&qword_1022A0030, &stru_1021BC538);
            v23 = qword_1022A0038;
            if (!os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
              goto LABEL_33;
            v24 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
            v25 = -[CLDurianDevice activeTask](self, "activeTask");
            v33 = 68289539;
            *(_WORD *)v34 = 2082;
            *(_QWORD *)&v34[2] = "";
            *(_WORD *)&v34[10] = 2113;
            *(_QWORD *)&v34[12] = v24;
            *(_WORD *)&v34[20] = 2113;
            *(_QWORD *)&v34[22] = v25;
            v26 = "{\"msg%{public}.0s\":\"#durian enqueuing preempted task\", \"item\":%{private, location:escape_only}@,"
                  " \"task\":%{private, location:escape_only}@}";
            v27 = v23;
            v28 = 38;
          }
          else
          {
            if (qword_1022A0030 != -1)
              dispatch_once(&qword_1022A0030, &stru_1021BC538);
            v29 = qword_1022A0038;
            if (!os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
              goto LABEL_33;
            v30 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
            v31 = -[CLDurianDevice activeTask](self, "activeTask");
            v33 = 68289795;
            *(_WORD *)v34 = 2082;
            *(_QWORD *)&v34[2] = "";
            *(_WORD *)&v34[10] = 2113;
            *(_QWORD *)&v34[12] = v30;
            *(_WORD *)&v34[20] = 2113;
            *(_QWORD *)&v34[22] = v31;
            *(_WORD *)&v34[30] = 2113;
            *(_QWORD *)&v34[32] = a3;
            v26 = "{\"msg%{public}.0s\":\"#durian task attempted preempt, but awaiting ack\", \"item\":%{private, locatio"
                  "n:escape_only}@, \"activetask\":%{private, location:escape_only}@, \"newtask\":%{private, location:escape_only}@}";
            v27 = v29;
            v28 = 48;
          }
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, v26, (uint8_t *)&v33, v28);
        }
      }
LABEL_33:
      -[NSMutableArray insertObject:atIndex:](self->_pendingTasks, "insertObject:atIndex:", a3, 0, v33, *(_OWORD *)v34, *(_OWORD *)&v34[16], *(_QWORD *)&v34[32]);
      goto LABEL_34;
    }
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
    v17 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
    {
      v18 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      v19 = -[NSMutableArray count](self->_pendingTasks, "count");
      v33 = 68289539;
      *(_WORD *)v34 = 2082;
      *(_QWORD *)&v34[2] = "";
      *(_WORD *)&v34[10] = 2113;
      *(_QWORD *)&v34[12] = v18;
      *(_WORD *)&v34[20] = 1025;
      *(_DWORD *)&v34[22] = v19;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian enqueuing nil task not supported\", \"item\":%{private, location:escape_only}@, \"length\":%{private}d}", (uint8_t *)&v33, 0x22u);
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC538);
    }
    v20 = qword_1022A0038;
    if (os_signpost_enabled((os_log_t)qword_1022A0038))
    {
      v21 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      v22 = -[NSMutableArray count](self->_pendingTasks, "count");
      v33 = 68289539;
      *(_WORD *)v34 = 2082;
      *(_QWORD *)&v34[2] = "";
      *(_WORD *)&v34[10] = 2113;
      *(_QWORD *)&v34[12] = v21;
      *(_WORD *)&v34[20] = 1025;
      *(_DWORD *)&v34[22] = v22;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian enqueuing nil task not supported", "{\"msg%{public}.0s\":\"#durian enqueuing nil task not supported\", \"item\":%{private, location:escape_only}@, \"length\":%{private}d}", (uint8_t *)&v33, 0x22u);
    }
  }
}

- (void)schedulePreemptedTaskTimeout:(int64_t)a3 forTask:(id)a4
{
  _QWORD v4[6];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1015109DC;
  v4[3] = &unk_10212BB30;
  v4[4] = self;
  v4[5] = a4;
  -[CLDurianDevice scheduleTimeout:forTaskUuid:withBlock:dictionary:](self, "scheduleTimeout:forTaskUuid:withBlock:dictionary:", a3, objc_msgSend(a4, "uuid"), dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, v4), self->_preemptedTaskTimeouts);
}

- (void)scheduleActiveTaskTimeout:(int64_t)a3 forTask:(id)a4
{
  _QWORD v4[6];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_101510C1C;
  v4[3] = &unk_10212BB30;
  v4[4] = self;
  v4[5] = a4;
  -[CLDurianDevice scheduleTimeout:forTaskUuid:withBlock:dictionary:](self, "scheduleTimeout:forTaskUuid:withBlock:dictionary:", a3, objc_msgSend(a4, "uuid"), dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, v4), self->_activeTaskTimeouts);
}

- (void)scheduleTimeout:(int64_t)a3 forTaskUuid:(id)a4 withBlock:(id)a5 dictionary:(id)a6
{
  dispatch_time_t v10;

  v10 = dispatch_time(0, 1000000000 * a3);
  dispatch_after(v10, (dispatch_queue_t)self->_queue, a5);
  objc_msgSend(a6, "setObject:forKey:", a5, a4);
  _Block_release(a5);
}

- (void)cancelTimeoutForTask:(id)a3 dictionary:(id)a4
{
  id v6;

  v6 = objc_msgSend(a4, "objectForKey:", objc_msgSend(a3, "uuid"));
  if (!v6)
    sub_101519450();
  dispatch_block_cancel(v6);
  objc_msgSend(a4, "removeObjectForKey:", objc_msgSend(a3, "uuid"));
}

- (void)executeTask:(id)a3
{
  unsigned int v5;
  id v6;
  char v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  id v17;
  unint64_t maintenanceOnlyCondition;
  int64_t currentLatency;
  uint64_t v20;
  uint64_t v21;
  id v22;
  NSObject *v23;
  id v24;
  id v25;
  unint64_t maxPacketSizeForGATTWriteWithResponse;
  CBCharacteristic *poshNonOwnerCharacteristic;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  id v31;
  NSArray *v32;
  CBPeripheral *activePeripheral;
  uint64_t v34;
  id v35;
  const char *v36;
  uint64_t v37;
  CBCharacteristic *hawkeyeConfigurationCharacteristic;
  NSObject *v39;
  id v40;
  id v41;
  uint64_t v42;
  id v43;
  id v44;
  id v45;
  uint64_t v46;
  id v47;
  const char *v48;
  id v49;
  NSObject *v50;
  id v51;
  id v52;
  unint64_t v53;
  NSObject *v54;
  id v55;
  id v56;
  unint64_t v57;
  uint64_t v58;
  id v59;
  int lastMaxConnectionsSent;
  NSObject *v61;
  os_log_type_t v62;
  uint32_t v63;
  id v64;
  uint64_t v65;
  id v66;
  int v67;
  NSObject *v68;
  os_log_type_t v69;
  uint32_t v70;
  id v71;
  NSObject *v72;
  id v73;
  unsigned int v74;
  id v75;
  id v76;
  NSObject *v77;
  id v78;
  unsigned int v79;
  id v80;
  id v81;
  id v82;
  id v83;
  uint8_t buf[4];
  int v85;
  __int16 v86;
  const char *v87;
  __int16 v88;
  id v89;
  __int16 v90;
  _BYTE v91[28];
  int v92;
  __int16 v93;
  id v94;

  -[CLDurianDevice checkHelloMaintenanceTask:](self, "checkHelloMaintenanceTask:");
  v5 = objc_msgSend(objc_msgSend(a3, "command"), "opcode");
  v6 = objc_msgSend(a3, "timeoutSeconds");
  v7 = self->_currentLatency == -6;
  -[CLDurianDevice setDesiredConnectionLatency](self, "setDesiredConnectionLatency");
  objc_msgSend(a3, "willStart");
  v8 = objc_msgSend(objc_msgSend(a3, "command"), "bytes");
  v10 = objc_opt_class(CLHawkeyeTask, v9);
  if ((objc_opt_isKindOfClass(a3, v10) & 1) != 0)
    v8 = objc_msgSend(a3, "hawkeyePayload");
  v12 = objc_opt_class(CLDurianGATTWriteTask, v11);
  if ((objc_opt_isKindOfClass(a3, v12) & 1) != 0)
    v8 = objc_msgSend(a3, "characteristicPayload");
  v13 = (_QWORD)v6 << v7;
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC538);
  v14 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v16 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
    v17 = objc_msgSend(a3, "opcodeDescription");
    maintenanceOnlyCondition = self->_maintenanceOnlyCondition;
    currentLatency = self->_currentLatency;
    *(_DWORD *)buf = 68290819;
    v85 = 0;
    v86 = 2082;
    v87 = "";
    v88 = 2113;
    v89 = v16;
    v90 = 1026;
    *(_DWORD *)v91 = v5;
    *(_WORD *)&v91[4] = 2113;
    *(_QWORD *)&v91[6] = v17;
    *(_WORD *)&v91[14] = 1025;
    *(_DWORD *)&v91[16] = maintenanceOnlyCondition;
    *(_WORD *)&v91[20] = 1026;
    *(_DWORD *)&v91[22] = currentLatency;
    *(_WORD *)&v91[26] = 1026;
    v92 = v13;
    v93 = 2113;
    v94 = v8;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian executing task\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d, \"task\":%{private, location:escape_only}@, \"maintOnly\":%{private}d, \"latency\":%{public}d, \"timeout\":%{public}d, \"bytes\":%{private, location:escape_only}@}", buf, 0x48u);
  }
  v20 = objc_opt_class(CLDurianGATTTask, v15);
  if ((objc_opt_isKindOfClass(a3, v20) & 1) != 0 && -[CLDurianDevice isPoshAccessory](self, "isPoshAccessory"))
  {
    v22 = objc_msgSend(a3, "characteristicPayload");
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
    v23 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v24 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      v25 = objc_msgSend(a3, "characteristicPayload");
      maxPacketSizeForGATTWriteWithResponse = self->_maxPacketSizeForGATTWriteWithResponse;
      *(_DWORD *)buf = 68290051;
      v86 = 2082;
      v85 = 0;
      v87 = "";
      v88 = 2113;
      v89 = v24;
      v90 = 2113;
      *(_QWORD *)v91 = v25;
      *(_WORD *)&v91[8] = 2113;
      *(_QWORD *)&v91[10] = v22;
      *(_WORD *)&v91[18] = 2049;
      *(_QWORD *)&v91[20] = maxPacketSizeForGATTWriteWithResponse;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh WriteTask\", \"item\":%{private, location:escape_only}@, \"characteristic\":%{private, location:escape_only}@, \"packet\":%{private, location:escape_only}@, \"maxPacketSize\":%{private}lu}", buf, 0x3Au);
    }
    poshNonOwnerCharacteristic = self->_poshNonOwnerCharacteristic;
    if (poshNonOwnerCharacteristic)
    {
      -[CBPeripheral writeValue:forCharacteristic:type:](self->_activePeripheral, "writeValue:forCharacteristic:type:", v22, poshNonOwnerCharacteristic, 0);
    }
    else
    {
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC538);
      v50 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
      {
        v51 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
        v52 = objc_msgSend(a3, "characteristicPayload");
        v53 = self->_maxPacketSizeForGATTWriteWithResponse;
        *(_DWORD *)buf = 68290051;
        v86 = 2082;
        v85 = 0;
        v87 = "";
        v88 = 2113;
        v89 = v51;
        v90 = 2113;
        *(_QWORD *)v91 = v52;
        *(_WORD *)&v91[8] = 2113;
        *(_QWORD *)&v91[10] = v22;
        *(_WORD *)&v91[18] = 2049;
        *(_QWORD *)&v91[20] = v53;
        _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #posh gatt task for posh accessory received, but posh characteristic was not discovered\", \"item\":%{private, location:escape_only}@, \"characteristic\":%{private, location:escape_only}@, \"packet\":%{private, location:escape_only}@, \"maxPacketSize\":%{private}lu}", buf, 0x3Au);
        if (qword_1022A0030 != -1)
          dispatch_once(&qword_1022A0030, &stru_1021BC538);
      }
      v54 = qword_1022A0038;
      if (os_signpost_enabled((os_log_t)qword_1022A0038))
      {
        v55 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
        v56 = objc_msgSend(a3, "characteristicPayload");
        v57 = self->_maxPacketSizeForGATTWriteWithResponse;
        *(_DWORD *)buf = 68290051;
        v86 = 2082;
        v85 = 0;
        v87 = "";
        v88 = 2113;
        v89 = v55;
        v90 = 2113;
        *(_QWORD *)v91 = v56;
        *(_WORD *)&v91[8] = 2113;
        *(_QWORD *)&v91[10] = v22;
        *(_WORD *)&v91[18] = 2049;
        *(_QWORD *)&v91[20] = v57;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v54, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #posh gatt task for posh accessory received, but posh characteristic was not discovered", "{\"msg%{public}.0s\":\"#durian #posh gatt task for posh accessory received, but posh characteristic was not discovered\", \"item\":%{private, location:escape_only}@, \"characteristic\":%{private, location:escape_only}@, \"packet\":%{private, location:escape_only}@, \"maxPacketSize\":%{private}lu}", buf, 0x3Au);
      }
    }
    goto LABEL_89;
  }
  v28 = objc_opt_class(CLDurianGATTTask, v21);
  if ((objc_opt_isKindOfClass(a3, v28) & 1) != 0)
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
    v30 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v31 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      v83 = objc_msgSend(a3, "serviceUUID");
      v32 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v83, 1);
      *(_DWORD *)buf = 68289539;
      v85 = 0;
      v86 = 2082;
      v87 = "";
      v88 = 2113;
      v89 = v31;
      v90 = 2113;
      *(_QWORD *)v91 = v32;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian requesting service-discovery\", \"item\":%{private, location:escape_only}@, \"service\":%{private, location:escape_only}@}", buf, 0x26u);
    }
    activePeripheral = self->_activePeripheral;
    v82 = objc_msgSend(a3, "serviceUUID");
    -[CBPeripheral discoverServices:](activePeripheral, "discoverServices:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v82, 1));
    if (v5 == 2053)
    {
      self->_isRoseInitialized = 0;
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC538);
      v34 = qword_1022A0038;
      if (!os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
        goto LABEL_89;
      v49 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      *(_DWORD *)buf = 68289283;
      v85 = 0;
      v86 = 2082;
      v87 = "";
      v88 = 2113;
      v89 = v49;
      v36 = "{\"msg%{public}.0s\":\"#durian #ut #rose stopped\", \"item\":%{private, location:escape_only}@}";
    }
    else
    {
      if (v5 != 2049)
        goto LABEL_89;
      self->_isRoseInitialized = 1;
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC538);
      v34 = qword_1022A0038;
      if (!os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
        goto LABEL_89;
      v35 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      *(_DWORD *)buf = 68289283;
      v85 = 0;
      v86 = 2082;
      v87 = "";
      v88 = 2113;
      v89 = v35;
      v36 = "{\"msg%{public}.0s\":\"#durian #ut #rose initialized\", \"item\":%{private, location:escape_only}@}";
    }
    goto LABEL_87;
  }
  v37 = objc_opt_class(CLHawkeyeTask, v29);
  if ((objc_opt_isKindOfClass(a3, v37) & 1) == 0)
  {
    if (v5 == 11)
    {
      objc_msgSend(objc_msgSend(objc_msgSend(a3, "command"), "bytes"), "getBytes:range:", &self->_lastMaxConnectionsSent, 1, 1);
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC538);
      v58 = qword_1022A0038;
      if (!os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEBUG))
        goto LABEL_78;
      v59 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      lastMaxConnectionsSent = self->_lastMaxConnectionsSent;
      *(_DWORD *)buf = 68289539;
      v85 = 0;
      v86 = 2082;
      v87 = "";
      v88 = 2113;
      v89 = v59;
      v90 = 1026;
      *(_DWORD *)v91 = lastMaxConnectionsSent;
      v48 = "{\"msg%{public}.0s\":\"#durian #multi setmax\", \"item\":%{private, location:escape_only}@, \"sent\":%{public}d}";
      v61 = v58;
      v62 = OS_LOG_TYPE_DEBUG;
      v63 = 34;
    }
    else
    {
      if (v5 == 6)
      {
        self->_isRoseInitialized = 0;
        if (qword_1022A0030 != -1)
          dispatch_once(&qword_1022A0030, &stru_1021BC538);
        v46 = qword_1022A0038;
        if (!os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
          goto LABEL_78;
        v64 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
        *(_DWORD *)buf = 68289283;
        v85 = 0;
        v86 = 2082;
        v87 = "";
        v88 = 2113;
        v89 = v64;
        v48 = "{\"msg%{public}.0s\":\"#durian #rose stopped\", \"item\":%{private, location:escape_only}@}";
      }
      else
      {
        if (v5 != 1)
          goto LABEL_78;
        self->_isRoseInitialized = 1;
        if (qword_1022A0030 != -1)
          dispatch_once(&qword_1022A0030, &stru_1021BC538);
        v46 = qword_1022A0038;
        if (!os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
          goto LABEL_78;
        v47 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
        *(_DWORD *)buf = 68289283;
        v85 = 0;
        v86 = 2082;
        v87 = "";
        v88 = 2113;
        v89 = v47;
        v48 = "{\"msg%{public}.0s\":\"#durian #rose initialized\", \"item\":%{private, location:escape_only}@}";
      }
      v61 = v46;
      v62 = OS_LOG_TYPE_DEFAULT;
      v63 = 28;
    }
    _os_log_impl((void *)&_mh_execute_header, v61, v62, v48, buf, v63);
LABEL_78:
    -[CBCentralManager sendData:toPeripheral:](self->_centralManager, "sendData:toPeripheral:", objc_msgSend(objc_msgSend(a3, "command"), "bytes"), self->_activePeripheral);
LABEL_89:
    -[CLDurianDevice scheduleActiveTaskTimeout:forTask:](self, "scheduleActiveTaskTimeout:forTask:", v13, a3);
    return;
  }
  if (objc_msgSend(a3, "isConfigurationControlPointTask")
    && (hawkeyeConfigurationCharacteristic = self->_hawkeyeConfigurationCharacteristic) != 0
    || objc_msgSend(a3, "isPairedOwnerInformationControlPointTask")
    && (hawkeyeConfigurationCharacteristic = self->_hawkeyePairedOwnerInformationCharacteristic) != 0
    || objc_msgSend(a3, "isNonOwnerControlPointTask")
    && (hawkeyeConfigurationCharacteristic = self->_hawkeyeNonOwnerCharacteristic) != 0
    || objc_msgSend(a3, "isDebugControlPointTask")
    && (hawkeyeConfigurationCharacteristic = self->_hawkeyeDebugCharacteristic) != 0
    || objc_msgSend(a3, "isPreciseFindingControlPointTask")
    && (hawkeyeConfigurationCharacteristic = self->_hawkeyePreciseFindingCharacteristic) != 0)
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
    v39 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v40 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      v41 = objc_msgSend(a3, "hawkeyePayload");
      v42 = v13;
      v43 = -[CBCharacteristic UUID](hawkeyeConfigurationCharacteristic, "UUID");
      v44 = objc_msgSend(a3, "opcodeDescription");
      *(_DWORD *)buf = 68290051;
      v86 = 2082;
      v85 = 0;
      v87 = "";
      v88 = 2113;
      v89 = v40;
      v90 = 2114;
      *(_QWORD *)v91 = v41;
      *(_WORD *)&v91[8] = 2114;
      *(_QWORD *)&v91[10] = v43;
      v13 = v42;
      *(_WORD *)&v91[18] = 2114;
      *(_QWORD *)&v91[20] = v44;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye task\", \"item\":%{private, location:escape_only}@, \"payload\":%{public, location:escape_only}@, \"characteristic\":%{public, location:escape_only}@, \"task\":%{public, location:escape_only}@}", buf, 0x3Au);
    }
    -[CBPeripheral writeValue:forCharacteristic:type:](self->_activePeripheral, "writeValue:forCharacteristic:type:", objc_msgSend(a3, "hawkeyePayload"), hawkeyeConfigurationCharacteristic, 0);
    switch(v5)
    {
      case 0xBu:
        objc_msgSend(objc_msgSend(objc_msgSend(a3, "command"), "bytes"), "getBytes:range:", &self->_lastMaxConnectionsSent, 1, 1);
        if (qword_1022A0030 != -1)
          dispatch_once(&qword_1022A0030, &stru_1021BC538);
        v65 = qword_1022A0038;
        if (!os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEBUG))
          goto LABEL_89;
        v66 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
        v67 = self->_lastMaxConnectionsSent;
        *(_DWORD *)buf = 68289539;
        v85 = 0;
        v86 = 2082;
        v87 = "";
        v88 = 2113;
        v89 = v66;
        v90 = 1026;
        *(_DWORD *)v91 = v67;
        v36 = "{\"msg%{public}.0s\":\"#durian #multi setmax\", \"item\":%{private, location:escape_only}@, \"sent\":%{public}d}";
        v68 = v65;
        v69 = OS_LOG_TYPE_DEBUG;
        v70 = 34;
        goto LABEL_88;
      case 6u:
        self->_isRoseInitialized = 0;
        if (qword_1022A0030 != -1)
          dispatch_once(&qword_1022A0030, &stru_1021BC538);
        v34 = qword_1022A0038;
        if (!os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
          goto LABEL_89;
        v71 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
        *(_DWORD *)buf = 68289283;
        v85 = 0;
        v86 = 2082;
        v87 = "";
        v88 = 2113;
        v89 = v71;
        v36 = "{\"msg%{public}.0s\":\"#durian #rose stopped\", \"item\":%{private, location:escape_only}@}";
        break;
      case 1u:
        self->_isRoseInitialized = 1;
        if (qword_1022A0030 != -1)
          dispatch_once(&qword_1022A0030, &stru_1021BC538);
        v34 = qword_1022A0038;
        if (!os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
          goto LABEL_89;
        v45 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
        *(_DWORD *)buf = 68289283;
        v85 = 0;
        v86 = 2082;
        v87 = "";
        v88 = 2113;
        v89 = v45;
        v36 = "{\"msg%{public}.0s\":\"#durian #rose initialized\", \"item\":%{private, location:escape_only}@}";
        break;
      default:
        goto LABEL_89;
    }
LABEL_87:
    v68 = v34;
    v69 = OS_LOG_TYPE_DEFAULT;
    v70 = 28;
LABEL_88:
    _os_log_impl((void *)&_mh_execute_header, v68, v69, v36, buf, v70);
    goto LABEL_89;
  }
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC538);
  v72 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
  {
    v73 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
    v74 = objc_msgSend(a3, "hawkeyeOpcode");
    v75 = objc_msgSend(a3, "serviceUUID");
    v76 = objc_msgSend(a3, "characteristicUUID");
    *(_DWORD *)buf = 68290051;
    v85 = 0;
    v86 = 2082;
    v87 = "";
    v88 = 2113;
    v89 = v73;
    v90 = 1026;
    *(_DWORD *)v91 = v74;
    *(_WORD *)&v91[4] = 2114;
    *(_QWORD *)&v91[6] = v75;
    *(_WORD *)&v91[14] = 2114;
    *(_QWORD *)&v91[16] = v76;
    _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #hawkeye unhandled task type\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d, \"serviceUUID\":%{public, location:escape_only}@, \"characteristicUUID\":%{public, location:escape_only}@}", buf, 0x36u);
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
  }
  v77 = qword_1022A0038;
  if (os_signpost_enabled((os_log_t)qword_1022A0038))
  {
    v78 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
    v79 = objc_msgSend(a3, "hawkeyeOpcode");
    v80 = objc_msgSend(a3, "serviceUUID");
    v81 = objc_msgSend(a3, "characteristicUUID");
    *(_DWORD *)buf = 68290051;
    v85 = 0;
    v86 = 2082;
    v87 = "";
    v88 = 2113;
    v89 = v78;
    v90 = 1026;
    *(_DWORD *)v91 = v79;
    *(_WORD *)&v91[4] = 2114;
    *(_QWORD *)&v91[6] = v80;
    *(_WORD *)&v91[14] = 2114;
    *(_QWORD *)&v91[16] = v81;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v77, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #hawkeye unhandled task type", "{\"msg%{public}.0s\":\"#durian #hawkeye unhandled task type\", \"item\":%{private, location:escape_only}@, \"opcode\":%{public}d, \"serviceUUID\":%{public, location:escape_only}@, \"characteristicUUID\":%{public, location:escape_only}@}", buf, 0x36u);
  }
  -[CLDurianDeviceDelegate device:didFailToCompleteTask:withError:andDisconnect:](-[CLDurianDevice delegate](self, "delegate"), "device:didFailToCompleteTask:withError:andDisconnect:", self, -[CLDurianDevice activeTask](self, "activeTask"), 34, 0);
  -[NSMutableArray removeObject:](self->_pendingTasks, "removeObject:", self->_activeTask);
  -[CLDurianDevice logTaskCounts:](self, "logTaskCounts:", CFSTR("unsupported"));
  -[CLDurianTask complete](self->_activeTask, "complete");
  -[CLDurianDevice setActiveTask:](self, "setActiveTask:", 0);
  -[CLDurianDevice processNextTask:](self, "processNextTask:", CFSTR("completeCurrentTask"));
}

- (void)getPersonalizationInformation
{
  NSObject *v3;
  id v4;
  CLDurianFirmwareUpdater *v5;
  NSObject *v6;
  id v7;
  const char *v8;
  id v9;
  int v10;
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;

  self->_retrievingPersonalizationInformation = 1;
  self->_firmwareUpdateMode = 1;
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC538);
  v3 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
    v10 = 68289283;
    v11 = 0;
    v12 = 2082;
    v13 = "";
    v14 = 2113;
    v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian getPersonalizationInfo\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v10, 0x1Cu);
  }
  if (self->_activePeripheral)
  {
    -[CLDurianDevice setDesiredConnectionLatency](self, "setDesiredConnectionLatency");
    v5 = -[CLDurianFirmwareUpdater initWithDelegate:peripheral:]([CLDurianFirmwareUpdater alloc], "initWithDelegate:peripheral:", self, self->_activePeripheral);
    self->_firmwareUpdater = v5;
    -[CLDurianFirmwareUpdater getPersonalizationInformation](v5, "getPersonalizationInformation");
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
    v6 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      v10 = 68289283;
      v11 = 0;
      v12 = 2082;
      v13 = "";
      v14 = 2113;
      v15 = v7;
      v8 = "{\"msg%{public}.0s\":\"#durian kick off getPersonalizationInfo\", \"item\":%{private, location:escape_only}@}";
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v10, 0x1Cu);
    }
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
    v6 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      v10 = 68289283;
      v11 = 0;
      v12 = 2082;
      v13 = "";
      v14 = 2113;
      v15 = v9;
      v8 = "{\"msg%{public}.0s\":\"#durian wait for connection to getPersonalizationInfo\", \"item\":%{private, location:escape_only}@}";
      goto LABEL_14;
    }
  }
}

- (void)updateFirmwareWithAssetURL:(id)a3
{
  NSObject *v4;
  id v5;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;
  __int16 v9;
  id v10;

  self->_firmwareUpdateInProgress = 1;
  -[CLDurianFirmwareUpdater startFirmwareUpdate:](self->_firmwareUpdater, "startFirmwareUpdate:", a3);
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC538);
  v4 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
    v6[0] = 68289283;
    v6[1] = 0;
    v7 = 2082;
    v8 = "";
    v9 = 2113;
    v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian kick off updateFirmwareWithManifest\", \"item\":%{private, location:escape_only}@}", (uint8_t *)v6, 0x1Cu);
  }
}

- (void)handleDisconnectionDuringFirmwareUpdate
{
  id v3;
  id v4;
  NSErrorUserInfoKey v5;
  const __CFString *v6;

  v3 = objc_alloc((Class)NSError);
  v5 = NSLocalizedDescriptionKey;
  v6 = CFSTR("Disconnected from Device");
  v4 = objc_msgSend(v3, "initWithDomain:code:userInfo:", kCLErrorDomainPrivate, 5, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1));
  -[CLDurianDevice informFirmwareUpdateFailureToClientWithError:](self, "informFirmwareUpdateFailureToClientWithError:", v4);
  -[CLDurianDevice exitFirmwareUpdateMode](self, "exitFirmwareUpdateMode");

}

- (void)preemptFirmwareUpdate
{
  id v3;
  id v4;
  NSErrorUserInfoKey v5;
  const __CFString *v6;

  v3 = objc_alloc((Class)NSError);
  v5 = NSLocalizedDescriptionKey;
  v6 = CFSTR("Firmware update preempted by user intitiated action");
  v4 = objc_msgSend(v3, "initWithDomain:code:userInfo:", kCLErrorDomainPrivate, 7, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1));
  -[CLDurianDevice abortFirmwareUpdate:](self, "abortFirmwareUpdate:", v4);

}

- (BOOL)allowFirmwareUpdate
{
  NSObject *v3;
  _BOOL4 v4;
  BOOL result;
  id v6;
  _BOOL4 v7;
  _BOOL4 firmwareUpdateMode;
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  _DWORD v12[2];
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  _BOOL4 v18;
  __int16 v19;
  _BOOL4 v20;
  __int16 v21;
  _BOOL4 v22;
  __int16 v23;
  _BOOL4 v24;
  __int16 v25;
  _BOOL4 v26;

  if (self->_activePeripheral
    && self->_firmwareUpdateMode
    && !self->_retrievingPersonalizationInformation
    && !self->_firmwareUpdateInProgress
    && !self->_firmwareUpdateReboot)
  {
    return 1;
  }
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC538);
  v3 = qword_1022A0038;
  v4 = os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT);
  result = 0;
  if (v4)
  {
    v6 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
    v7 = self->_activePeripheral != 0;
    firmwareUpdateMode = self->_firmwareUpdateMode;
    v9 = !self->_retrievingPersonalizationInformation;
    v10 = !self->_firmwareUpdateInProgress;
    v11 = !self->_firmwareUpdateReboot;
    v12[0] = 68290563;
    v12[1] = 0;
    v13 = 2082;
    v14 = "";
    v15 = 2113;
    v16 = v6;
    v17 = 1025;
    v18 = v7;
    v19 = 1025;
    v20 = firmwareUpdateMode;
    v21 = 1025;
    v22 = v9;
    v23 = 1025;
    v24 = v10;
    v25 = 1025;
    v26 = v11;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian block fwupdate\", \"item\":%{private, location:escape_only}@, \"periph\":%{private}hhd, \"mode\":%{private}hhd, \"retrieving\":%{private}hhd, \"inprogress\":%{private}hhd, \"reboot\":%{private}hhd}", (uint8_t *)v12, 0x3Au);
    return 0;
  }
  return result;
}

- (void)abortFirmwareUpdate:(id)a3
{
  NSObject *v5;
  id v6;
  NSObject *v7;
  id v8;
  int v9;
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  id v14;

  if (!self->_firmwareUpdateMode || self->_firmwareUpdateReboot)
    return;
  if (!self->_firmwareUpdater)
  {
    -[CLDurianDevice exitFirmwareUpdateMode](self, "exitFirmwareUpdateMode");
    if (!a3)
      return;
    goto LABEL_17;
  }
  if (self->_abortingFirmwareUpdate)
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
    v5 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      v9 = 68289283;
      v10 = 0;
      v11 = 2082;
      v12 = "";
      v13 = 2113;
      v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian Already aborting FW update for device, wait.\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v9, 0x1Cu);
    }
    return;
  }
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC538);
  v7 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
    v9 = 68289283;
    v10 = 0;
    v11 = 2082;
    v12 = "";
    v13 = 2113;
    v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian abortFirmwareUpdate\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v9, 0x1Cu);
  }
  -[CLDurianFirmwareUpdater abortFirmwareUpdate](self->_firmwareUpdater, "abortFirmwareUpdate");
  self->_abortingFirmwareUpdate = 1;
  if (a3)
LABEL_17:
    -[CLDurianDevice informFirmwareUpdateFailureToClientWithError:](self, "informFirmwareUpdateFailureToClientWithError:", a3);
}

- (void)informFirmwareUpdateFailureToClientWithError:(id)a3
{
  _BOOL4 retrievingPersonalizationInformation;
  CLDurianDeviceDelegate *delegate;
  id v7;
  id v8;
  _QWORD *v9;
  _QWORD *v10;
  const __CFString *v11;
  const __CFString *disconnectReason;
  uint64_t v13;
  _QWORD v14[2];
  _QWORD v15[2];
  _QWORD v16[3];
  _QWORD v17[3];
  _QWORD v18[3];
  _QWORD v19[3];

  retrievingPersonalizationInformation = self->_retrievingPersonalizationInformation;
  delegate = self->_delegate;
  if (retrievingPersonalizationInformation)
    -[CLDurianDeviceDelegate didRetrievePersonalizationInfo:forDevice:error:](delegate, "didRetrievePersonalizationInfo:forDevice:error:", 0, self, a3);
  else
    -[CLDurianDeviceDelegate didUpdateFirmwareForDevice:error:](delegate, "didUpdateFirmwareForDevice:error:", self, a3);
  v7 = objc_msgSend(a3, "domain");
  if (objc_msgSend(v7, "isEqualToString:", kCLErrorDomainPrivate))
  {
    v8 = objc_msgSend(a3, "code");
    if (v8 == (id)5)
    {
      v17[0] = CFSTR("firmwareUpdateFailed");
      v16[0] = CFSTR("event");
      v16[1] = CFSTR("reason");
      v11 = sub_101536DEC((unint64_t)objc_msgSend(a3, "code"));
      v16[2] = CFSTR("disconnectReason");
      disconnectReason = (const __CFString *)self->_disconnectReason;
      if (!disconnectReason)
        disconnectReason = CFSTR("NotSet");
      v17[1] = v11;
      v17[2] = disconnectReason;
      v9 = v17;
      v10 = v16;
    }
    else
    {
      if (v8 != (id)7)
      {
        v15[0] = CFSTR("firmwareUpdateFailed");
        v14[0] = CFSTR("event");
        v14[1] = CFSTR("reason");
        v15[1] = sub_101536DEC((unint64_t)objc_msgSend(a3, "code"));
        v9 = v15;
        v10 = v14;
        v13 = 2;
        goto LABEL_13;
      }
      v19[0] = CFSTR("firmwareUpdateFailed");
      v18[0] = CFSTR("event");
      v18[1] = CFSTR("reason");
      v19[1] = sub_101536DEC((unint64_t)objc_msgSend(a3, "code"));
      v18[2] = CFSTR("firmwareUpdateblockingTask");
      v19[2] = -[CLDurianDevice currentTaskName](self, "currentTaskName");
      v9 = v19;
      v10 = v18;
    }
    v13 = 3;
LABEL_13:
    -[CLDurianDeviceDelegate sendFirmwareUpdateMetrics:forDevice:](self->_delegate, "sendFirmwareUpdateMetrics:forDevice:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v10, v13), self);
  }
}

- (void)enterFirmwareUpdateMode
{
  self->_firmwareUpdateMode = 1;
}

- (void)exitFirmwareUpdateMode
{
  CLDurianFirmwareUpdater *firmwareUpdater;

  self->_firmwareUpdateMode = 0;
  *(_DWORD *)&self->_retrievingPersonalizationInformation = 0;
  firmwareUpdater = self->_firmwareUpdater;
  if (firmwareUpdater)
  {

    self->_firmwareUpdater = 0;
  }
  if (self->_activePeripheral)
  {
    -[CLDurianDevice setDesiredConnectionLatency](self, "setDesiredConnectionLatency");
    -[CBPeripheral setDelegate:](self->_activePeripheral, "setDelegate:", self);
    -[CLDurianDevice processNextTask:](self, "processNextTask:", CFSTR("exitFirmwareUpdateMode"));
  }
}

- (void)processUARPMessage:(id)a3
{
  int v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  id v11;
  int v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;

  v5 = *(unsigned __int8 *)objc_msgSend(a3, "bytes");
  if (!self->_uarpMessage)
    self->_uarpMessage = (NSMutableData *)objc_alloc_init((Class)NSMutableData);
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC538);
  v6 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
  {
    v7 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
    v12 = 68289539;
    v13 = 0;
    v14 = 2082;
    v15 = "";
    v16 = 2113;
    v17 = v7;
    v18 = 2113;
    v19 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate Received message from accessory\", \"item\":%{private, location:escape_only}@, \"message\":%{private, location:escape_only}@}", (uint8_t *)&v12, 0x26u);
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
  }
  v8 = qword_1022A0038;
  if (os_signpost_enabled((os_log_t)qword_1022A0038))
  {
    v9 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
    v12 = 68289539;
    v13 = 0;
    v14 = 2082;
    v15 = "";
    v16 = 2113;
    v17 = v9;
    v18 = 2113;
    v19 = a3;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#hawkeye #firmwareUpdate Received message from accessory", "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate Received message from accessory\", \"item\":%{private, location:escape_only}@, \"message\":%{private, location:escape_only}@}", (uint8_t *)&v12, 0x26u);
  }
  -[NSMutableData appendData:](self->_uarpMessage, "appendData:", objc_msgSend(a3, "subdataWithRange:", 1, (char *)objc_msgSend(a3, "length") - 1));
  if (v5)
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
    v10 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      v12 = 68289283;
      v13 = 0;
      v14 = 2082;
      v15 = "";
      v16 = 2113;
      v17 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate Received last fragment for UARP message, sending to CoreUARP\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v12, 0x1Cu);
    }
    -[CLDurianDeviceDelegate didReceiveUarpMessage:fromDevice:](self->_delegate, "didReceiveUarpMessage:fromDevice:", objc_msgSend(objc_alloc((Class)NSData), "initWithData:", self->_uarpMessage), self);

    self->_uarpMessage = 0;
  }
}

- (NSData)addressFromUnknownBeacon
{
  if (-[CLDurianDevice unownedBeacon](self, "unownedBeacon")
    && (unint64_t)objc_msgSend(-[SPUnknownBeacon advertisement](-[CLDurianDevice unownedBeacon](self, "unownedBeacon"), "advertisement"), "length") >= 6)
  {
    return (NSData *)objc_msgSend(-[SPUnknownBeacon advertisement](-[CLDurianDevice unownedBeacon](self, "unownedBeacon"), "advertisement"), "subdataWithRange:", 0, 6);
  }
  if (-[CLDurianDevice taUnknownBeacon](self, "taUnknownBeacon")
    && objc_msgSend(-[TAUnknownBeacon address](-[CLDurianDevice taUnknownBeacon](self, "taUnknownBeacon"), "address"), "length") == (id)6)
  {
    return (NSData *)-[TAUnknownBeacon address](-[CLDurianDevice taUnknownBeacon](self, "taUnknownBeacon"), "address");
  }
  return +[NSData data](NSData, "data");
}

- (BOOL)isFindMyNetwork
{
  SEL v3;
  SPUnknownBeacon *unownedBeacon;
  id v5;
  BOOL v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  id v10;
  const char *v11;
  id v12;
  TAUnknownBeacon *taUnknownBeacon;
  id v15;
  NSObject *v16;
  id v17;
  int v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  _BOOL4 v25;

  if (!-[CLDurianDevice isPoshAccessory](self, "isPoshAccessory"))
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
    v9 = qword_1022A0038;
    if (!os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
      return 1;
    v10 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
    v18 = 68289283;
    v19 = 0;
    v20 = 2082;
    v21 = "";
    v22 = 2113;
    v23 = v10;
    v11 = "{\"msg%{public}.0s\":\"#durian findmy is enabled by default for all non-posh accessories\", \"item\":%{private"
          ", location:escape_only}@}";
    goto LABEL_17;
  }
  if ((_os_feature_enabled_impl("CoreLocation", "StandardUT") & 1) == 0)
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
    v9 = qword_1022A0038;
    if (!os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
      return 1;
    v12 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
    v18 = 68289283;
    v19 = 0;
    v20 = 2082;
    v21 = "";
    v22 = 2113;
    v23 = v12;
    v11 = "{\"msg%{public}.0s\":\"#durian #posh feature flag is not enabled, defaulting to apple-posh behavior\", \"item\"
          ":%{private, location:escape_only}@}";
LABEL_17:
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v18, 0x1Cu);
    return 1;
  }
  v3 = NSSelectorFromString(CFSTR("isFindMyNetwork"));
  unownedBeacon = self->_unownedBeacon;
  if (unownedBeacon && (objc_opt_respondsToSelector(unownedBeacon, v3) & 1) != 0)
  {
    v5 = -[SPUnknownBeacon performSelector:](self->_unownedBeacon, "performSelector:", v3);
    v6 = v5 != 0;
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
    v7 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      v18 = 68289539;
      v19 = 0;
      v20 = 2082;
      v21 = "";
      v22 = 2113;
      v23 = v8;
      v24 = 1026;
      v25 = v5 != 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh SPUnknownBeacon responds to isFindMyNetwork selector\", \"item\":%{private, location:escape_only}@, \"isApple\":%{public}hhd}", (uint8_t *)&v18, 0x22u);
    }
  }
  else
  {
    v6 = 1;
  }
  taUnknownBeacon = self->_taUnknownBeacon;
  if (taUnknownBeacon && (objc_opt_respondsToSelector(taUnknownBeacon, v3) & 1) != 0)
  {
    v15 = -[TAUnknownBeacon performSelector:](self->_taUnknownBeacon, "performSelector:", v3);
    v6 = v15 != 0;
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
    v16 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      v18 = 68289539;
      v19 = 0;
      v20 = 2082;
      v21 = "";
      v22 = 2113;
      v23 = v17;
      v24 = 1026;
      v25 = v15 != 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh TAUnknownBeacon responds to isFindMyNetwork selector\", \"item\":%{private, location:escape_only}@, \"isApple\":%{public}hhd}", (uint8_t *)&v18, 0x22u);
    }
  }
  return v6;
}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  NSObject *v6;
  id v7;
  id v8;
  CLDurianTask *v9;
  unsigned int v10;
  unsigned int v11;
  CLDurianTask *activeTask;
  NSObject *v13;
  id v14;
  CLDurianTask *v15;
  uint64_t v16;
  uint64_t v17;
  CLDurianTask *v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *i;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  CLDurianTask *v28;
  const char *v29;
  NSObject *v30;
  uint32_t v31;
  NSObject *v32;
  id v33;
  CLDurianTask *v34;
  NSObject *v35;
  id v36;
  CLDurianTask *v37;
  id v38;
  id v39;
  id v40;
  int v41;
  uint64_t v42;
  void *v43;
  void *v44;
  NSArray *v45;
  NSObject *v46;
  id v47;
  NSObject *v48;
  id v49;
  NSArray *v50;
  id v51;
  id v52;
  int v53;
  void *v54;
  void *v55;
  NSArray *v56;
  NSObject *v57;
  id v58;
  NSArray *v59;
  NSObject *v60;
  id v61;
  NSArray *v62;
  NSObject *v63;
  id v64;
  NSArray *v65;
  NSObject *v66;
  id v67;
  uint64_t v68;
  id v69;
  int poshCharacteristicsToDiscover;
  id v71;
  int hawkeyeCharacteristicsToDiscover;
  id obj;
  uint64_t v74;
  CLDurianDevice *v75;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  id v89;
  id v90;
  _BYTE v91[128];
  id v92;
  _QWORD v93[10];
  _QWORD v94[5];
  id v95;
  _BYTE v96[128];
  id v97;
  _BYTE v98[128];
  uint64_t buf;
  __int16 v100;
  const char *v101;
  __int16 v102;
  id v103;
  __int16 v104;
  _BYTE v105[10];
  CLDurianTask *v106;
  __int16 v107;
  unsigned int v108;
  __int16 v109;
  unsigned int v110;

  if (a4 || !objc_msgSend(objc_msgSend(a3, "services"), "count"))
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
    v6 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      v8 = objc_msgSend(objc_msgSend(-[CBPeripheral identifier](self->_activePeripheral, "identifier"), "description"), "substringToIndex:", 8);
      v9 = (CLDurianTask *)objc_msgSend(a4, "localizedDescription");
      v10 = objc_msgSend(objc_msgSend(a3, "services"), "count");
      v11 = -[CLDurianTask translatedOpcode](self->_activeTask, "translatedOpcode");
      buf = 68290307;
      v100 = 2082;
      v101 = "";
      v102 = 2113;
      v103 = v7;
      v104 = 2113;
      *(_QWORD *)v105 = v8;
      *(_WORD *)&v105[8] = 2113;
      v106 = v9;
      v107 = 1026;
      v108 = v10;
      v109 = 1026;
      v110 = v11;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian failed to discover services\", \"item\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@, \"count\":%{public}d, \"activeOpcode\":%{public}d}", (uint8_t *)&buf, 0x3Cu);
    }
    activeTask = self->_activeTask;
    if (activeTask)
      -[CLDurianDeviceDelegate device:didFailToCompleteTask:withError:andDisconnect:](self->_delegate, "device:didFailToCompleteTask:withError:andDisconnect:", self, activeTask, 33, 1);
    else
      -[CLDurianDevice requestDisconnection:](self, "requestDisconnection:", CFSTR("MissingServiceCharacteristic"));
    return;
  }
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC538);
  v13 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v14 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
    buf = 68289539;
    v100 = 2082;
    v101 = "";
    v102 = 2113;
    v103 = v14;
    v104 = 2113;
    *(_QWORD *)v105 = objc_msgSend(a3, "services");
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian discovered services\", \"item\":%{private, location:escape_only}@, \"service\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x26u);
  }
  v75 = self;
  if (!self->_activePeripheralReady)
  {
    if (-[CLDurianDevice isPoshAccessory](self, "isPoshAccessory"))
    {
      v87 = 0u;
      v88 = 0u;
      v85 = 0u;
      v86 = 0u;
      v38 = objc_msgSend(a3, "services");
      v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v85, v98, 16);
      if (v39)
      {
        v40 = v39;
        v41 = 0;
        v42 = *(_QWORD *)v86;
        do
        {
          v43 = 0;
          do
          {
            if (*(_QWORD *)v86 != v42)
              objc_enumerationMutation(v38);
            v44 = *(void **)(*((_QWORD *)&v85 + 1) + 8 * (_QWORD)v43);
            if (objc_msgSend(objc_msgSend(v44, "UUID"), "isEqual:", +[CBUUID _cl_PoshAccessoryNonOwnerServiceUUID](CBUUID, "_cl_PoshAccessoryNonOwnerServiceUUID")))
            {
              v97 = +[CBUUID _cl_PoshAccessoryNonOwnerCharacteristicUUID](CBUUID, "_cl_PoshAccessoryNonOwnerCharacteristicUUID");
              v45 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v97, 1);
              if (qword_1022A0030 != -1)
                dispatch_once(&qword_1022A0030, &stru_1021BC538);
              v46 = qword_1022A0038;
              if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
              {
                v47 = objc_msgSend(-[NSUUID description](v75->_uuid, "description"), "substringToIndex:", 8);
                buf = 68289539;
                v100 = 2082;
                v101 = "";
                v102 = 2113;
                v103 = v47;
                v104 = 2113;
                *(_QWORD *)v105 = v45;
                _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh requesting characteristic-discovery\", \"item\":%{private, location:escape_only}@, \"characteristics\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x26u);
              }
              objc_msgSend(a3, "discoverCharacteristics:forService:", v45, v44);
              ++v41;
            }
            v43 = (char *)v43 + 1;
          }
          while (v40 != v43);
          v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v85, v98, 16);
        }
        while (v40);
      }
      else
      {
        v41 = 0;
      }
      v75->_poshCharacteristicsToDiscover = objc_msgSend(objc_msgSend(a3, "services"), "count");
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC538);
      v68 = qword_1022A0038;
      if (!os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
        return;
      v69 = objc_msgSend(-[NSUUID description](v75->_uuid, "description"), "substringToIndex:", 8);
      poshCharacteristicsToDiscover = v75->_poshCharacteristicsToDiscover;
      buf = 68289795;
      v100 = 2082;
      v101 = "";
      v102 = 2113;
      v103 = v69;
      v104 = 1026;
      *(_DWORD *)v105 = poshCharacteristicsToDiscover;
      *(_WORD *)&v105[4] = 1026;
      *(_DWORD *)&v105[6] = v41;
      v29 = "{\"msg%{public}.0s\":\"#durian #posh didDiscoverServices\", \"item\":%{private, location:escape_only}@, \"ch"
            "ars\":%{public}d, \"matched\":%{public}d}";
    }
    else
    {
      if (self->_activePeripheralReady || !-[CLDurianDevice isHawkeyeAccessory](self, "isHawkeyeAccessory"))
        goto LABEL_14;
      v83 = 0u;
      v84 = 0u;
      v81 = 0u;
      v82 = 0u;
      obj = objc_msgSend(a3, "services");
      v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v96, 16);
      if (v51)
      {
        v52 = v51;
        v53 = 0;
        v74 = *(_QWORD *)v82;
        do
        {
          v54 = 0;
          do
          {
            if (*(_QWORD *)v82 != v74)
              objc_enumerationMutation(obj);
            v55 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * (_QWORD)v54);
            if (objc_msgSend(objc_msgSend(v55, "UUID"), "isEqual:", +[CBUUID _cl_BtTxPowerServiceUUID](CBUUID, "_cl_BtTxPowerServiceUUID")))
            {
              v95 = +[CBUUID _cl_BtTxPowerCharacteristicUUID](CBUUID, "_cl_BtTxPowerCharacteristicUUID");
              v56 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v95, 1);
              if (qword_1022A0030 != -1)
                dispatch_once(&qword_1022A0030, &stru_1021BC538);
              v57 = qword_1022A0038;
              if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
              {
                v58 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
                buf = 68289539;
                v100 = 2082;
                v101 = "";
                v102 = 2113;
                v103 = v58;
                v104 = 2113;
                *(_QWORD *)v105 = v56;
                _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye requesting characteristic-discovery\", \"item\":%{private, location:escape_only}@, \"characteristics\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x26u);
              }
              objc_msgSend(a3, "discoverCharacteristics:forService:", v56, v55);
              ++v53;
            }
            if (objc_msgSend(objc_msgSend(v55, "UUID"), "isEqual:", +[CBUUID _cl_HawkeyeFindMyNetworkServiceUUID](CBUUID, "_cl_HawkeyeFindMyNetworkServiceUUID")))
            {
              v94[0] = +[CBUUID _cl_HawkeyeConfigurationCharacteristicUUID](CBUUID, "_cl_HawkeyeConfigurationCharacteristicUUID");
              v94[1] = +[CBUUID _cl_HawkeyeNonOwnerCharacteristicUUID](CBUUID, "_cl_HawkeyeNonOwnerCharacteristicUUID");
              v94[2] = +[CBUUID _cl_HawkeyePairedOwnerInformationCharacteristicUUID](CBUUID, "_cl_HawkeyePairedOwnerInformationCharacteristicUUID");
              v94[3] = +[CBUUID _cl_HawkeyeDebugCharacteristicUUID](CBUUID, "_cl_HawkeyeDebugCharacteristicUUID");
              v94[4] = +[CBUUID _cl_HawkeyePreciseFindingCharacteristicUUID](CBUUID, "_cl_HawkeyePreciseFindingCharacteristicUUID");
              v59 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v94, 5);
              if (qword_1022A0030 != -1)
                dispatch_once(&qword_1022A0030, &stru_1021BC538);
              v60 = qword_1022A0038;
              if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
              {
                v61 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
                buf = 68289539;
                v100 = 2082;
                v101 = "";
                v102 = 2113;
                v103 = v61;
                v104 = 2113;
                *(_QWORD *)v105 = v59;
                _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye requesting characteristic-discovery\", \"item\":%{private, location:escape_only}@, \"characteristics\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x26u);
              }
              objc_msgSend(a3, "discoverCharacteristics:forService:", v59, v55);
              v53 += 10;
            }
            if (objc_msgSend(objc_msgSend(v55, "UUID"), "isEqual:", +[CBUUID _cl_HawkeyeAccessoryInformationServiceUUID](CBUUID, "_cl_HawkeyeAccessoryInformationServiceUUID")))
            {
              v93[0] = +[CBUUID _cl_HawkeyeAccessoryInformationServiceProductDataCharacteristicUUID](CBUUID, "_cl_HawkeyeAccessoryInformationServiceProductDataCharacteristicUUID");
              v93[1] = +[CBUUID _cl_HawkeyeAccessoryInformationServiceManufacturerNameCharacteristicUUID](CBUUID, "_cl_HawkeyeAccessoryInformationServiceManufacturerNameCharacteristicUUID");
              v93[2] = +[CBUUID _cl_HawkeyeAccessoryInformationServiceModelNameCharacteristicUUID](CBUUID, "_cl_HawkeyeAccessoryInformationServiceModelNameCharacteristicUUID");
              v93[3] = +[CBUUID _cl_HawkeyeAccessoryInformationServiceModelColorCodeCharacteristicUUID](CBUUID, "_cl_HawkeyeAccessoryInformationServiceModelColorCodeCharacteristicUUID");
              v93[4] = +[CBUUID _cl_HawkeyeAccessoryInformationServiceAccessoryCategoryCharacteristicUUID](CBUUID, "_cl_HawkeyeAccessoryInformationServiceAccessoryCategoryCharacteristicUUID");
              v93[5] = +[CBUUID _cl_HawkeyeAccessoryInformationServiceAccessoryCapabilitiesCharacteristicUUID](CBUUID, "_cl_HawkeyeAccessoryInformationServiceAccessoryCapabilitiesCharacteristicUUID");
              v93[6] = +[CBUUID _cl_HawkeyeAccessoryInformationServiceFirmwareVersionCharacteristicUUID](CBUUID, "_cl_HawkeyeAccessoryInformationServiceFirmwareVersionCharacteristicUUID");
              v93[7] = +[CBUUID _cl_HawkeyeAccessoryInformationServiceFindMyVersionCharacteristicUUID](CBUUID, "_cl_HawkeyeAccessoryInformationServiceFindMyVersionCharacteristicUUID");
              v93[8] = +[CBUUID _cl_HawkeyeAccessoryInformationServiceBatteryTypeCharacteristicUUID](CBUUID, "_cl_HawkeyeAccessoryInformationServiceBatteryTypeCharacteristicUUID");
              v93[9] = +[CBUUID _cl_HawkeyeAccessoryInformationServiceBatteryLevelCharacteristicUUID](CBUUID, "_cl_HawkeyeAccessoryInformationServiceBatteryLevelCharacteristicUUID");
              v62 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v93, 10);
              if (qword_1022A0030 != -1)
                dispatch_once(&qword_1022A0030, &stru_1021BC538);
              v63 = qword_1022A0038;
              if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
              {
                v64 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
                buf = 68289539;
                v100 = 2082;
                v101 = "";
                v102 = 2113;
                v103 = v64;
                v104 = 2113;
                *(_QWORD *)v105 = v62;
                _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye requesting characteristic-discovery\", \"item\":%{private, location:escape_only}@, \"characteristics\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x26u);
              }
              objc_msgSend(a3, "discoverCharacteristics:forService:", v62, v55);
              v53 += 100;
            }
            if (objc_msgSend(objc_msgSend(v55, "UUID"), "isEqual:", +[CBUUID _cl_HawkeyeAccessoryFirmwareUpdateServiceUUID](CBUUID, "_cl_HawkeyeAccessoryFirmwareUpdateServiceUUID")))
            {
              v92 = +[CBUUID _cl_HawkeyeAccessoryFirmwareUpdateMsgCharacteristicUUID](CBUUID, "_cl_HawkeyeAccessoryFirmwareUpdateMsgCharacteristicUUID");
              v65 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v92, 1);
              if (qword_1022A0030 != -1)
                dispatch_once(&qword_1022A0030, &stru_1021BC538);
              v66 = qword_1022A0038;
              if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
              {
                v67 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
                buf = 68289539;
                v100 = 2082;
                v101 = "";
                v102 = 2113;
                v103 = v67;
                v104 = 2113;
                *(_QWORD *)v105 = v65;
                _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye requesting characteristic-discovery\", \"item\":%{private, location:escape_only}@, \"characteristics\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x26u);
              }
              objc_msgSend(a3, "discoverCharacteristics:forService:", v65, v55);
              v53 += 1000;
            }
            v54 = (char *)v54 + 1;
          }
          while (v52 != v54);
          v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v96, 16);
        }
        while (v52);
      }
      else
      {
        v53 = 0;
      }
      self->_hawkeyeCharacteristicsToDiscover = objc_msgSend(objc_msgSend(a3, "services"), "count");
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC538);
      v68 = qword_1022A0038;
      if (!os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
        return;
      v71 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      hawkeyeCharacteristicsToDiscover = self->_hawkeyeCharacteristicsToDiscover;
      buf = 68289795;
      v100 = 2082;
      v101 = "";
      v102 = 2113;
      v103 = v71;
      v104 = 1026;
      *(_DWORD *)v105 = hawkeyeCharacteristicsToDiscover;
      *(_WORD *)&v105[4] = 1026;
      *(_DWORD *)&v105[6] = v53;
      v29 = "{\"msg%{public}.0s\":\"#durian #hawkeye didDiscoverServices\", \"item\":%{private, location:escape_only}@, \"
            "chars\":%{public}d, \"matched\":%{public}d}";
    }
    v30 = v68;
    v31 = 40;
    goto LABEL_96;
  }
LABEL_14:
  v15 = -[CLDurianDevice activeTask](self, "activeTask");
  v17 = objc_opt_class(CLDurianGATTTask, v16);
  if ((objc_opt_isKindOfClass(v15, v17) & 1) != 0)
  {
    v18 = -[CLDurianDevice activeTask](self, "activeTask");
    v77 = 0u;
    v78 = 0u;
    v79 = 0u;
    v80 = 0u;
    v19 = objc_msgSend(a3, "services");
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v77, v91, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v78;
      while (2)
      {
        for (i = 0; i != v21; i = (char *)i + 1)
        {
          if (*(_QWORD *)v78 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(objc_msgSend(v24, "UUID"), "isEqual:", -[CLDurianTask serviceUUID](v18, "serviceUUID")))
          {
            if (qword_1022A0030 != -1)
              dispatch_once(&qword_1022A0030, &stru_1021BC538);
            v48 = qword_1022A0038;
            if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
            {
              v49 = objc_msgSend(-[NSUUID description](v75->_uuid, "description"), "substringToIndex:", 8);
              v90 = -[CLDurianTask characteristicUUID](v18, "characteristicUUID");
              v50 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v90, 1);
              buf = 68289539;
              v100 = 2082;
              v101 = "";
              v102 = 2113;
              v103 = v49;
              v104 = 2113;
              *(_QWORD *)v105 = v50;
              _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian requesting characteristic-discovery\", \"item\":%{private, location:escape_only}@, \"characteristics\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x26u);
            }
            v89 = -[CLDurianTask characteristicUUID](v18, "characteristicUUID");
            objc_msgSend(a3, "discoverCharacteristics:forService:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v89, 1), v24);
            return;
          }
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v77, v91, 16);
        if (v21)
          continue;
        break;
      }
    }
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
    v25 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v26 = objc_msgSend(-[NSUUID description](v75->_uuid, "description"), "substringToIndex:", 8);
      v27 = objc_msgSend(objc_msgSend(-[CBPeripheral identifier](v75->_activePeripheral, "identifier"), "description"), "substringToIndex:", 8);
      v28 = v75->_activeTask;
      buf = 68289795;
      v100 = 2082;
      v101 = "";
      v102 = 2113;
      v103 = v26;
      v104 = 2113;
      *(_QWORD *)v105 = v27;
      *(_WORD *)&v105[8] = 2113;
      v106 = v28;
      v29 = "{\"msg%{public}.0s\":\"#durian failed to discover service for task\", \"item\":%{private, location:escape_on"
            "ly}@, \"periph\":%{private, location:escape_only}@, \"task\":%{private, location:escape_only}@}";
      v30 = v25;
      v31 = 48;
LABEL_96:
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, v29, (uint8_t *)&buf, v31);
    }
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
    v32 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
    {
      v33 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      v34 = -[CLDurianDevice activeTask](self, "activeTask");
      buf = 68289539;
      v100 = 2082;
      v101 = "";
      v102 = 2113;
      v103 = v33;
      v104 = 2113;
      *(_QWORD *)v105 = v34;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian discovered services, but active task is not a GATT task\", \"item\":%{private, location:escape_only}@, \"task\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x26u);
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC538);
    }
    v35 = qword_1022A0038;
    if (os_signpost_enabled((os_log_t)qword_1022A0038))
    {
      v36 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      v37 = -[CLDurianDevice activeTask](self, "activeTask");
      buf = 68289539;
      v100 = 2082;
      v101 = "";
      v102 = 2113;
      v103 = v36;
      v104 = 2113;
      *(_QWORD *)v105 = v37;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v35, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian discovered services, but active task is not a GATT task", "{\"msg%{public}.0s\":\"#durian discovered services, but active task is not a GATT task\", \"item\":%{private, location:escape_only}@, \"task\":%{private, location:escape_only}@}", (uint8_t *)&buf, 0x26u);
    }
  }
}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  CLDurianDevice *v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  id v16;
  unsigned int v17;
  id v18;
  int poshCharacteristicsToDiscover;
  id v20;
  id v21;
  uint64_t v22;
  _UNKNOWN **v23;
  void *v24;
  void *v25;
  NSObject *v26;
  id v27;
  NSObject *v28;
  id v29;
  CLDurianTask *v30;
  _UNKNOWN **v31;
  id v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  NSObject *v37;
  id v38;
  NSObject *v39;
  id v40;
  id v41;
  id v42;
  uint64_t v43;
  _UNKNOWN **v44;
  void *v45;
  void *v46;
  NSObject *v47;
  id v48;
  NSObject *v49;
  id v50;
  _UNKNOWN **v51;
  id v52;
  uint64_t v53;
  CLDurianTask *v54;
  id v55;
  id v56;
  id v57;
  NSObject *v58;
  id v59;
  unsigned int v60;
  id v61;
  int hawkeyeCharacteristicsToDiscover;
  id v63;
  id v64;
  id v65;
  uint64_t v66;
  void *v67;
  void *v68;
  NSObject *v69;
  id v70;
  CLDurianDevice *v71;
  NSObject *v72;
  id v73;
  NSObject *v74;
  id v75;
  NSObject *v76;
  id v77;
  NSObject *v78;
  id v79;
  NSObject *v80;
  id v81;
  id v82;
  id v83;
  NSObject *v84;
  id v85;
  NSObject *v86;
  id v87;
  NSObject *v88;
  id v89;
  NSObject *v90;
  id v91;
  NSObject *v92;
  id v93;
  NSObject *v94;
  id v95;
  NSObject *v96;
  id v97;
  NSObject *v98;
  id v99;
  NSObject *v100;
  id v101;
  NSObject *v102;
  id v103;
  NSObject *v104;
  id v105;
  NSObject *v106;
  id v107;
  CLDurianTask *v108;
  uint64_t v109;
  uint64_t v110;
  CLDurianTask *v111;
  uint64_t v112;
  uint64_t v113;
  CLDurianTask *v114;
  id v115;
  id v116;
  id v117;
  uint64_t v118;
  void *v119;
  void *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  CLDurianDevice *v126;
  NSObject *v127;
  id v128;
  id v129;
  id v130;
  uint64_t v131;
  id v132;
  NSObject *v133;
  id v134;
  id v135;
  unint64_t maxPacketSizeForGATTWriteWithResponse;
  NSObject *v137;
  id v138;
  id v139;
  id v140;
  NSObject *v141;
  id v142;
  CLDurianTask *v143;
  NSObject *v144;
  id v145;
  CLDurianTask *v146;
  id v147;
  CLDurianTask *activeTask;
  CLDurianTask *v149;
  id obj;
  id obja;
  id v152;
  id v153;
  char v154;
  char v155;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  _BYTE v174[128];
  _BYTE v175[128];
  uint8_t v176[128];
  uint8_t buf[4];
  int v178;
  __int16 v179;
  const char *v180;
  __int16 v181;
  id v182;
  __int16 v183;
  _BYTE v184[20];
  id v185;
  __int16 v186;
  id v187;
  __int16 v188;
  id v189;
  _BYTE v190[128];

  if (a5 || (v12 = self, !objc_msgSend(objc_msgSend(a4, "characteristics"), "count")))
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
    v7 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      v9 = objc_msgSend(a4, "UUID");
      v10 = objc_msgSend(objc_msgSend(-[CBPeripheral identifier](self->_activePeripheral, "identifier"), "description"), "substringToIndex:", 8);
      *(_DWORD *)buf = 68290307;
      v178 = 0;
      v179 = 2082;
      v180 = "";
      v181 = 2113;
      v182 = v8;
      v183 = 2113;
      *(_QWORD *)v184 = v9;
      *(_WORD *)&v184[8] = 2113;
      *(_QWORD *)&v184[10] = v10;
      *(_WORD *)&v184[18] = 2113;
      v185 = objc_msgSend(a5, "localizedDescription");
      v186 = 1026;
      LODWORD(v187) = objc_msgSend(objc_msgSend(a4, "characteristics"), "count");
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian failed to discover characteristic\", \"item\":%{private, location:escape_only}@, \"service\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@, \"count\":%{public}d}", buf, 0x40u);
    }
    if (-[NSMutableArray count](self->_pendingTasks, "count"))
      v11 = -[NSMutableArray objectAtIndex:](self->_pendingTasks, "objectAtIndex:", 0);
    else
      v11 = 0;
    -[CLDurianDevice setDisconnectionReason:](self, "setDisconnectionReason:", CFSTR("MissingServiceCharacteristic"));
    -[CLDurianDeviceDelegate device:didFailToCompleteTask:withError:andDisconnect:](self->_delegate, "device:didFailToCompleteTask:withError:andDisconnect:", self, v11, 33, 1);
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
    v13 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_msgSend(-[NSUUID description](v12->_uuid, "description"), "substringToIndex:", 8);
      *(_DWORD *)buf = 68289795;
      v178 = 0;
      v179 = 2082;
      v180 = "";
      v181 = 2113;
      v182 = v14;
      v183 = 2113;
      *(_QWORD *)v184 = objc_msgSend(a4, "UUID");
      *(_WORD *)&v184[8] = 1026;
      *(_DWORD *)&v184[10] = objc_msgSend(objc_msgSend(a4, "characteristics"), "count");
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian discovered characteristics for service \", \"item\":%{private, location:escape_only}@, \"service\":%{private, location:escape_only}@, \"count\":%{public}d}", buf, 0x2Cu);
    }
    if (-[CLDurianDevice isPoshAccessory](v12, "isPoshAccessory"))
    {
      --v12->_poshCharacteristicsToDiscover;
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC538);
      v15 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
      {
        v16 = objc_msgSend(-[NSUUID description](v12->_uuid, "description"), "substringToIndex:", 8);
        v17 = objc_msgSend(objc_msgSend(a4, "characteristics"), "count");
        v18 = objc_msgSend(a4, "UUID");
        poshCharacteristicsToDiscover = v12->_poshCharacteristicsToDiscover;
        *(_DWORD *)buf = 68290051;
        v179 = 2082;
        v178 = 0;
        v180 = "";
        v181 = 2113;
        v182 = v16;
        v183 = 1026;
        *(_DWORD *)v184 = v17;
        *(_WORD *)&v184[4] = 2113;
        *(_QWORD *)&v184[6] = v18;
        *(_WORD *)&v184[14] = 1026;
        *(_DWORD *)&v184[16] = poshCharacteristicsToDiscover;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh didDiscoverCharacteristics\", \"item\":%{private, location:escape_only}@, \"count\":%{public}d, \"service\":%{private, location:escape_only}@, \"left\":%{public}d}", buf, 0x32u);
      }
      activeTask = v12->_activeTask;
      v170 = 0u;
      v171 = 0u;
      v172 = 0u;
      v173 = 0u;
      obj = objc_msgSend(a4, "characteristics");
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v170, v190, 16);
      if (v20)
      {
        v21 = v20;
        v154 = 0;
        v22 = *(_QWORD *)v171;
        v23 = &CMHgalCaptureMode_ptr;
        do
        {
          v24 = 0;
          do
          {
            if (*(_QWORD *)v171 != v22)
              objc_enumerationMutation(obj);
            v25 = *(void **)(*((_QWORD *)&v170 + 1) + 8 * (_QWORD)v24);
            if (objc_msgSend(objc_msgSend(v25, "UUID"), "isEqual:", objc_msgSend(v23[403], "_cl_PoshAccessoryNonOwnerCharacteristicUUID")))
            {
              if (qword_1022A0030 != -1)
                dispatch_once(&qword_1022A0030, &stru_1021BC538);
              v26 = qword_1022A0038;
              if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
              {
                v27 = objc_msgSend(-[NSUUID description](v12->_uuid, "description"), "substringToIndex:", 8);
                *(_DWORD *)buf = 68289283;
                v178 = 0;
                v179 = 2082;
                v180 = "";
                v181 = 2113;
                v182 = v27;
                _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #ut #posh non-owner Control Point\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
              }
              -[CLDurianDevice setPoshNonOwnerCharacteristic:](v12, "setPoshNonOwnerCharacteristic:", v25);
              v154 = 1;
            }
            objc_msgSend(a3, "setNotifyValue:forCharacteristic:", v154 & 1, v25);
            if (qword_1022A0030 != -1)
              dispatch_once(&qword_1022A0030, &stru_1021BC538);
            v28 = qword_1022A0038;
            if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
            {
              v29 = objc_msgSend(-[NSUUID description](v12->_uuid, "description"), "substringToIndex:", 8);
              v152 = objc_msgSend(v25, "UUID");
              v30 = -[CLDurianDevice activeTask](v12, "activeTask");
              v31 = v23;
              v32 = v21;
              v33 = v22;
              v34 = objc_msgSend(v25, "value");
              v35 = -[CLDurianTask characteristicPayload](activeTask, "characteristicPayload");
              v36 = objc_msgSend(v25, "properties");
              *(_DWORD *)buf = 68290563;
              v178 = 0;
              v179 = 2082;
              v180 = "";
              v181 = 2113;
              v182 = v29;
              v183 = 2113;
              *(_QWORD *)v184 = v152;
              *(_WORD *)&v184[8] = 2113;
              *(_QWORD *)&v184[10] = v30;
              v12 = self;
              *(_WORD *)&v184[18] = 2113;
              v185 = v34;
              v22 = v33;
              v21 = v32;
              v23 = v31;
              v186 = 2113;
              v187 = v35;
              v188 = 2050;
              v189 = v36;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #ut #posh enabling notifications & indications for characteristic\", \"item\":%{private, location:escape_only}@, \"characteristic\":%{private, location:escape_only}@, \"task\":%{private, location:escape_only}@, \"value\":%{private, location:escape_only}@, \"payload\":%{private, location:escape_only}@, \"characteristic properties\":%{public}ld}", buf, 0x4Eu);
            }
            v24 = (char *)v24 + 1;
          }
          while (v21 != v24);
          v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v170, v190, 16);
        }
        while (v21);
      }
      if (!v12->_poshCharacteristicsToDiscover)
      {
        if (!v12->_poshNonOwnerCharacteristic)
        {
          if (qword_1022A0030 != -1)
            dispatch_once(&qword_1022A0030, &stru_1021BC538);
          v37 = qword_1022A0038;
          if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
          {
            v38 = objc_msgSend(-[NSUUID description](v12->_uuid, "description"), "substringToIndex:", 8);
            *(_DWORD *)buf = 68289539;
            v178 = 0;
            v179 = 2082;
            v180 = "";
            v181 = 2113;
            v182 = v38;
            v183 = 2082;
            *(_QWORD *)v184 = "config";
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #posh failed to discover\", \"item\":%{private, location:escape_only}@, \"characteristic\":%{public, location:escape_only}s}", buf, 0x26u);
            if (qword_1022A0030 != -1)
              dispatch_once(&qword_1022A0030, &stru_1021BC538);
          }
          v39 = qword_1022A0038;
          if (os_signpost_enabled((os_log_t)qword_1022A0038))
          {
            v40 = objc_msgSend(-[NSUUID description](v12->_uuid, "description"), "substringToIndex:", 8);
            *(_DWORD *)buf = 68289539;
            v178 = 0;
            v179 = 2082;
            v180 = "";
            v181 = 2113;
            v182 = v40;
            v183 = 2082;
            *(_QWORD *)v184 = "config";
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v39, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #posh failed to discover", "{\"msg%{public}.0s\":\"#durian #posh failed to discover\", \"item\":%{private, location:escape_only}@, \"characteristic\":%{public, location:escape_only}s}", buf, 0x26u);
          }
        }
        -[CLDurianDevice activate](v12, "activate");
      }
      return;
    }
    v147 = a4;
    if (-[CLDurianDevice isAirTag](v12, "isAirTag"))
    {
      v149 = v12->_activeTask;
      v166 = 0u;
      v167 = 0u;
      v168 = 0u;
      v169 = 0u;
      obja = objc_msgSend(a4, "characteristics");
      v41 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v166, v176, 16);
      if (v41)
      {
        v42 = v41;
        v155 = 0;
        v43 = *(_QWORD *)v167;
        v44 = &CMHgalCaptureMode_ptr;
        do
        {
          v45 = 0;
          do
          {
            if (*(_QWORD *)v167 != v43)
              objc_enumerationMutation(obja);
            v46 = *(void **)(*((_QWORD *)&v166 + 1) + 8 * (_QWORD)v45);
            if (objc_msgSend(objc_msgSend(v46, "UUID"), "isEqual:", objc_msgSend(v44[403], "_cl_DurianUnauthorizedPrecisionFindingCharacteristicUUID")))
            {
              if (qword_1022A0030 != -1)
                dispatch_once(&qword_1022A0030, &stru_1021BC538);
              v47 = qword_1022A0038;
              if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
              {
                v48 = objc_msgSend(-[NSUUID description](v12->_uuid, "description"), "substringToIndex:", 8);
                *(_DWORD *)buf = 68289283;
                v178 = 0;
                v179 = 2082;
                v180 = "";
                v181 = 2113;
                v182 = v48;
                _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #ut Precise Finding Control Point\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
              }
              -[CLDurianDevice setDurianNonOwnerPreciseFindingCharacteristic:](v12, "setDurianNonOwnerPreciseFindingCharacteristic:", v46);
              v155 = 1;
            }
            objc_msgSend(a3, "setNotifyValue:forCharacteristic:", v155 & 1, v46);
            if (qword_1022A0030 != -1)
              dispatch_once(&qword_1022A0030, &stru_1021BC538);
            v49 = qword_1022A0038;
            if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
            {
              v153 = objc_msgSend(-[NSUUID description](v12->_uuid, "description"), "substringToIndex:", 8);
              v50 = objc_msgSend(v46, "UUID");
              v51 = v44;
              v52 = v42;
              v53 = v43;
              v54 = -[CLDurianDevice activeTask](self, "activeTask");
              v55 = objc_msgSend(v46, "value");
              v56 = -[CLDurianTask characteristicPayload](v149, "characteristicPayload");
              v57 = objc_msgSend(v46, "properties");
              *(_DWORD *)buf = 68290563;
              v178 = 0;
              v179 = 2082;
              v180 = "";
              v181 = 2113;
              v182 = v153;
              v183 = 2113;
              *(_QWORD *)v184 = v50;
              v12 = self;
              *(_WORD *)&v184[8] = 2113;
              *(_QWORD *)&v184[10] = v54;
              v43 = v53;
              v42 = v52;
              v44 = v51;
              *(_WORD *)&v184[18] = 2113;
              v185 = v55;
              v186 = 2113;
              v187 = v56;
              v188 = 2049;
              v189 = v57;
              _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #ut enabling notifications & indications for characteristic\", \"item\":%{private, location:escape_only}@, \"characteristic\":%{private, location:escape_only}@, \"task\":%{private, location:escape_only}@, \"value\":%{private, location:escape_only}@, \"payload\":%{private, location:escape_only}@, \"characteristic properties\":%{private}ld}", buf, 0x4Eu);
            }
            v45 = (char *)v45 + 1;
          }
          while (v42 != v45);
          v42 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v166, v176, 16);
        }
        while (v42);
      }
    }
    if (!-[CLDurianDevice isHawkeyeAccessory](v12, "isHawkeyeAccessory"))
      goto LABEL_169;
    --v12->_hawkeyeCharacteristicsToDiscover;
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
    v58 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v59 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      v60 = objc_msgSend(objc_msgSend(v147, "characteristics"), "count");
      v61 = objc_msgSend(v147, "UUID");
      hawkeyeCharacteristicsToDiscover = self->_hawkeyeCharacteristicsToDiscover;
      *(_DWORD *)buf = 68290051;
      v179 = 2082;
      v178 = 0;
      v180 = "";
      v181 = 2113;
      v182 = v59;
      v183 = 1026;
      *(_DWORD *)v184 = v60;
      *(_WORD *)&v184[4] = 2113;
      *(_QWORD *)&v184[6] = v61;
      *(_WORD *)&v184[14] = 1026;
      *(_DWORD *)&v184[16] = hawkeyeCharacteristicsToDiscover;
      _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye didDiscoverCharacteristics\", \"item\":%{private, location:escape_only}@, \"count\":%{public}d, \"service\":%{private, location:escape_only}@, \"left\":%{public}d}", buf, 0x32u);
    }
    v164 = 0u;
    v165 = 0u;
    v162 = 0u;
    v163 = 0u;
    v63 = objc_msgSend(v147, "characteristics");
    v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v162, v175, 16);
    if (v64)
    {
      v65 = v64;
      v66 = *(_QWORD *)v163;
      do
      {
        v67 = 0;
        do
        {
          if (*(_QWORD *)v163 != v66)
            objc_enumerationMutation(v63);
          v68 = *(void **)(*((_QWORD *)&v162 + 1) + 8 * (_QWORD)v67);
          if (objc_msgSend(objc_msgSend(v68, "UUID"), "isEqual:", +[CBUUID _cl_HawkeyeConfigurationCharacteristicUUID](CBUUID, "_cl_HawkeyeConfigurationCharacteristicUUID")))
          {
            if (qword_1022A0030 != -1)
              dispatch_once(&qword_1022A0030, &stru_1021BC538);
            v69 = qword_1022A0038;
            if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
            {
              v70 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
              *(_DWORD *)buf = 68289283;
              v178 = 0;
              v179 = 2082;
              v180 = "";
              v181 = 2113;
              v182 = v70;
              _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye Configuration Control Point\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
            }
            v71 = self;
            -[CLDurianDevice setHawkeyeConfigurationCharacteristic:](self, "setHawkeyeConfigurationCharacteristic:", v68);
            goto LABEL_82;
          }
          if (objc_msgSend(objc_msgSend(v68, "UUID"), "isEqual:", +[CBUUID _cl_HawkeyeNonOwnerCharacteristicUUID](CBUUID, "_cl_HawkeyeNonOwnerCharacteristicUUID")))
          {
            if (qword_1022A0030 != -1)
              dispatch_once(&qword_1022A0030, &stru_1021BC538);
            v72 = qword_1022A0038;
            if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
            {
              v73 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
              *(_DWORD *)buf = 68289283;
              v178 = 0;
              v179 = 2082;
              v180 = "";
              v181 = 2113;
              v182 = v73;
              _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye Non-Owner Control Point\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
            }
            -[CLDurianDevice setHawkeyeNonOwnerCharacteristic:](self, "setHawkeyeNonOwnerCharacteristic:", v68);
LABEL_108:
            objc_msgSend(a3, "setNotifyValue:forCharacteristic:", 1, v68);
            goto LABEL_109;
          }
          if (objc_msgSend(objc_msgSend(v68, "UUID"), "isEqual:", +[CBUUID _cl_HawkeyePairedOwnerInformationCharacteristicUUID](CBUUID, "_cl_HawkeyePairedOwnerInformationCharacteristicUUID")))
          {
            if (qword_1022A0030 != -1)
              dispatch_once(&qword_1022A0030, &stru_1021BC538);
            v74 = qword_1022A0038;
            if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
            {
              v75 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
              *(_DWORD *)buf = 68289283;
              v178 = 0;
              v179 = 2082;
              v180 = "";
              v181 = 2113;
              v182 = v75;
              _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye Paired Owner Information Control Point\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
            }
            -[CLDurianDevice setHawkeyePairedOwnerInformationCharacteristic:](self, "setHawkeyePairedOwnerInformationCharacteristic:", v68);
            goto LABEL_108;
          }
          if (objc_msgSend(objc_msgSend(v68, "UUID"), "isEqual:", +[CBUUID _cl_HawkeyeDebugCharacteristicUUID](CBUUID, "_cl_HawkeyeDebugCharacteristicUUID")))
          {
            if (qword_1022A0030 != -1)
              dispatch_once(&qword_1022A0030, &stru_1021BC538);
            v76 = qword_1022A0038;
            if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
            {
              v77 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
              *(_DWORD *)buf = 68289283;
              v178 = 0;
              v179 = 2082;
              v180 = "";
              v181 = 2113;
              v182 = v77;
              _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye Debug Control Point\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
            }
            -[CLDurianDevice setHawkeyeDebugCharacteristic:](self, "setHawkeyeDebugCharacteristic:", v68);
            goto LABEL_108;
          }
          if (objc_msgSend(objc_msgSend(v68, "UUID"), "isEqual:", +[CBUUID _cl_HawkeyePreciseFindingCharacteristicUUID](CBUUID, "_cl_HawkeyePreciseFindingCharacteristicUUID")))
          {
            if (qword_1022A0030 != -1)
              dispatch_once(&qword_1022A0030, &stru_1021BC538);
            v78 = qword_1022A0038;
            if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
            {
              v79 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
              *(_DWORD *)buf = 68289283;
              v178 = 0;
              v179 = 2082;
              v180 = "";
              v181 = 2113;
              v182 = v79;
              _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye Precise Finding Control Point\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
            }
            -[CLDurianDevice setHawkeyePreciseFindingCharacteristic:](self, "setHawkeyePreciseFindingCharacteristic:", v68);
            goto LABEL_108;
          }
          if (objc_msgSend(objc_msgSend(v68, "UUID"), "isEqual:", +[CBUUID _cl_HawkeyeAccessoryFirmwareUpdateMsgCharacteristicUUID](CBUUID, "_cl_HawkeyeAccessoryFirmwareUpdateMsgCharacteristicUUID")))
          {
            if (qword_1022A0030 != -1)
              dispatch_once(&qword_1022A0030, &stru_1021BC538);
            v80 = qword_1022A0038;
            if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
            {
              v81 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
              v82 = objc_msgSend(v68, "UUID");
              *(_DWORD *)buf = 68289539;
              v178 = 0;
              v179 = 2082;
              v180 = "";
              v181 = 2113;
              v182 = v81;
              v183 = 2114;
              *(_QWORD *)v184 = v82;
              _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye #firmwareUpdate Discovered Firmware Update\", \"item\":%{private, location:escape_only}@, \"characteristic\":%{public, location:escape_only}@}", buf, 0x26u);
            }
            v71 = self;
            -[CLDurianDevice setHawkeyeFirmwareUpdateCharacteristic:](self, "setHawkeyeFirmwareUpdateCharacteristic:", v68);
LABEL_82:
            if ((id)-[CLDurianDevice ownership](v71, "ownership") == (id)1)
              goto LABEL_108;
          }
LABEL_109:
          v67 = (char *)v67 + 1;
        }
        while (v65 != v67);
        v83 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v162, v175, 16);
        v65 = v83;
      }
      while (v83);
    }
    v12 = self;
    if (!self->_hawkeyeCharacteristicsToDiscover)
    {
      if (!self->_hawkeyeConfigurationCharacteristic)
      {
        if (qword_1022A0030 != -1)
          dispatch_once(&qword_1022A0030, &stru_1021BC538);
        v84 = qword_1022A0038;
        if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
        {
          v85 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
          *(_DWORD *)buf = 68289539;
          v178 = 0;
          v179 = 2082;
          v180 = "";
          v181 = 2113;
          v182 = v85;
          v183 = 2082;
          *(_QWORD *)v184 = "config";
          _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #hawkeye failed to discover\", \"item\":%{private, location:escape_only}@, \"characteristic\":%{public, location:escape_only}s}", buf, 0x26u);
          if (qword_1022A0030 != -1)
            dispatch_once(&qword_1022A0030, &stru_1021BC538);
        }
        v86 = qword_1022A0038;
        if (os_signpost_enabled((os_log_t)qword_1022A0038))
        {
          v87 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
          *(_DWORD *)buf = 68289539;
          v178 = 0;
          v179 = 2082;
          v180 = "";
          v181 = 2113;
          v182 = v87;
          v183 = 2082;
          *(_QWORD *)v184 = "config";
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v86, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #hawkeye failed to discover", "{\"msg%{public}.0s\":\"#durian #hawkeye failed to discover\", \"item\":%{private, location:escape_only}@, \"characteristic\":%{public, location:escape_only}s}", buf, 0x26u);
        }
      }
      if (!self->_hawkeyeNonOwnerCharacteristic)
      {
        if (qword_1022A0030 != -1)
          dispatch_once(&qword_1022A0030, &stru_1021BC538);
        v88 = qword_1022A0038;
        if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
        {
          v89 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
          *(_DWORD *)buf = 68289539;
          v178 = 0;
          v179 = 2082;
          v180 = "";
          v181 = 2113;
          v182 = v89;
          v183 = 2082;
          *(_QWORD *)v184 = "nonowner";
          _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #hawkeye failed to discover\", \"item\":%{private, location:escape_only}@, \"characteristic\":%{public, location:escape_only}s}", buf, 0x26u);
          if (qword_1022A0030 != -1)
            dispatch_once(&qword_1022A0030, &stru_1021BC538);
        }
        v90 = qword_1022A0038;
        if (os_signpost_enabled((os_log_t)qword_1022A0038))
        {
          v91 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
          *(_DWORD *)buf = 68289539;
          v178 = 0;
          v179 = 2082;
          v180 = "";
          v181 = 2113;
          v182 = v91;
          v183 = 2082;
          *(_QWORD *)v184 = "nonowner";
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v90, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #hawkeye failed to discover", "{\"msg%{public}.0s\":\"#durian #hawkeye failed to discover\", \"item\":%{private, location:escape_only}@, \"characteristic\":%{public, location:escape_only}s}", buf, 0x26u);
        }
      }
      if (!self->_hawkeyePairedOwnerInformationCharacteristic)
      {
        if (qword_1022A0030 != -1)
          dispatch_once(&qword_1022A0030, &stru_1021BC538);
        v92 = qword_1022A0038;
        if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
        {
          v93 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
          *(_DWORD *)buf = 68289539;
          v178 = 0;
          v179 = 2082;
          v180 = "";
          v181 = 2113;
          v182 = v93;
          v183 = 2082;
          *(_QWORD *)v184 = "pairedowner";
          _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #hawkeye failed to discover\", \"item\":%{private, location:escape_only}@, \"characteristic\":%{public, location:escape_only}s}", buf, 0x26u);
          if (qword_1022A0030 != -1)
            dispatch_once(&qword_1022A0030, &stru_1021BC538);
        }
        v94 = qword_1022A0038;
        if (os_signpost_enabled((os_log_t)qword_1022A0038))
        {
          v95 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
          *(_DWORD *)buf = 68289539;
          v178 = 0;
          v179 = 2082;
          v180 = "";
          v181 = 2113;
          v182 = v95;
          v183 = 2082;
          *(_QWORD *)v184 = "pairedowner";
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v94, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #hawkeye failed to discover", "{\"msg%{public}.0s\":\"#durian #hawkeye failed to discover\", \"item\":%{private, location:escape_only}@, \"characteristic\":%{public, location:escape_only}s}", buf, 0x26u);
        }
      }
      if (!self->_hawkeyeDebugCharacteristic)
      {
        if (qword_1022A0030 != -1)
          dispatch_once(&qword_1022A0030, &stru_1021BC538);
        v96 = qword_1022A0038;
        if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
        {
          v97 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
          *(_DWORD *)buf = 68289539;
          v178 = 0;
          v179 = 2082;
          v180 = "";
          v181 = 2113;
          v182 = v97;
          v183 = 2082;
          *(_QWORD *)v184 = "debug";
          _os_log_impl((void *)&_mh_execute_header, v96, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #hawkeye failed to discover\", \"item\":%{private, location:escape_only}@, \"characteristic\":%{public, location:escape_only}s}", buf, 0x26u);
          if (qword_1022A0030 != -1)
            dispatch_once(&qword_1022A0030, &stru_1021BC538);
        }
        v98 = qword_1022A0038;
        if (os_signpost_enabled((os_log_t)qword_1022A0038))
        {
          v99 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
          *(_DWORD *)buf = 68289539;
          v178 = 0;
          v179 = 2082;
          v180 = "";
          v181 = 2113;
          v182 = v99;
          v183 = 2082;
          *(_QWORD *)v184 = "debug";
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v98, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #hawkeye failed to discover", "{\"msg%{public}.0s\":\"#durian #hawkeye failed to discover\", \"item\":%{private, location:escape_only}@, \"characteristic\":%{public, location:escape_only}s}", buf, 0x26u);
        }
      }
      if (!self->_hawkeyePreciseFindingCharacteristic)
      {
        if (qword_1022A0030 != -1)
          dispatch_once(&qword_1022A0030, &stru_1021BC538);
        v100 = qword_1022A0038;
        if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
        {
          v101 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
          *(_DWORD *)buf = 68289539;
          v178 = 0;
          v179 = 2082;
          v180 = "";
          v181 = 2113;
          v182 = v101;
          v183 = 2082;
          *(_QWORD *)v184 = "r1finding";
          _os_log_impl((void *)&_mh_execute_header, v100, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #hawkeye failed to discover\", \"item\":%{private, location:escape_only}@, \"characteristic\":%{public, location:escape_only}s}", buf, 0x26u);
          if (qword_1022A0030 != -1)
            dispatch_once(&qword_1022A0030, &stru_1021BC538);
        }
        v102 = qword_1022A0038;
        if (os_signpost_enabled((os_log_t)qword_1022A0038))
        {
          v103 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
          *(_DWORD *)buf = 68289539;
          v178 = 0;
          v179 = 2082;
          v180 = "";
          v181 = 2113;
          v182 = v103;
          v183 = 2082;
          *(_QWORD *)v184 = "r1finding";
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v102, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #hawkeye failed to discover", "{\"msg%{public}.0s\":\"#durian #hawkeye failed to discover\", \"item\":%{private, location:escape_only}@, \"characteristic\":%{public, location:escape_only}s}", buf, 0x26u);
        }
      }
      if (!self->_hawkeyeFirmwareUpdateCharacteristic)
      {
        if (qword_1022A0030 != -1)
          dispatch_once(&qword_1022A0030, &stru_1021BC538);
        v104 = qword_1022A0038;
        if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
        {
          v105 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
          *(_DWORD *)buf = 68289539;
          v178 = 0;
          v179 = 2082;
          v180 = "";
          v181 = 2113;
          v182 = v105;
          v183 = 2082;
          *(_QWORD *)v184 = "fwupdate";
          _os_log_impl((void *)&_mh_execute_header, v104, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #hawkeye failed to discover\", \"item\":%{private, location:escape_only}@, \"characteristic\":%{public, location:escape_only}s}", buf, 0x26u);
          if (qword_1022A0030 != -1)
            dispatch_once(&qword_1022A0030, &stru_1021BC538);
        }
        v106 = qword_1022A0038;
        if (os_signpost_enabled((os_log_t)qword_1022A0038))
        {
          v107 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
          *(_DWORD *)buf = 68289539;
          v178 = 0;
          v179 = 2082;
          v180 = "";
          v181 = 2113;
          v182 = v107;
          v183 = 2082;
          *(_QWORD *)v184 = "fwupdate";
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v106, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #hawkeye failed to discover", "{\"msg%{public}.0s\":\"#durian #hawkeye failed to discover\", \"item\":%{private, location:escape_only}@, \"characteristic\":%{public, location:escape_only}s}", buf, 0x26u);
        }
      }
      -[CLDurianDevice activate](self, "activate");
    }
    v108 = -[CLDurianDevice activeTask](self, "activeTask");
    v110 = objc_opt_class(CLHawkeyeTask, v109);
    if ((objc_opt_isKindOfClass(v108, v110) & 1) == 0)
    {
LABEL_169:
      v111 = -[CLDurianDevice activeTask](v12, "activeTask");
      v113 = objc_opt_class(CLDurianGATTTask, v112);
      if ((objc_opt_isKindOfClass(v111, v113) & 1) != 0)
      {
        v114 = -[CLDurianDevice activeTask](v12, "activeTask");
        v158 = 0u;
        v159 = 0u;
        v160 = 0u;
        v161 = 0u;
        v115 = objc_msgSend(v147, "characteristics");
        v116 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v158, v174, 16);
        if (v116)
        {
          v117 = v116;
          v118 = *(_QWORD *)v159;
          do
          {
            v119 = 0;
            do
            {
              if (*(_QWORD *)v159 != v118)
                objc_enumerationMutation(v115);
              v120 = *(void **)(*((_QWORD *)&v158 + 1) + 8 * (_QWORD)v119);
              if (objc_msgSend(objc_msgSend(v120, "UUID"), "isEqual:", -[CLDurianTask characteristicUUID](v114, "characteristicUUID")))
              {
                -[CLDurianTask setCharacteristic:](v114, "setCharacteristic:", v120);
                v122 = objc_opt_class(CLDurianGATTRepeatedReadTask, v121);
                if ((objc_opt_isKindOfClass(v114, v122) & 1) != 0)
                {
                  -[CBCentralManager sendData:toPeripheral:](self->_centralManager, "sendData:toPeripheral:", -[CLDurianCommand bytes](-[CLDurianTask command](v114, "command"), "bytes"), self->_activePeripheral);
                }
                else
                {
                  v124 = objc_opt_class(CLDurianGATTReadTask, v123);
                  if ((objc_opt_isKindOfClass(v114, v124) & 1) != 0)
                  {
                    v126 = self;
                    if (-[CLDurianDevice isHawkeyeAccessory](self, "isHawkeyeAccessory"))
                    {
                      if (qword_1022A0030 != -1)
                        dispatch_once(&qword_1022A0030, &stru_1021BC538);
                      v127 = qword_1022A0038;
                      v126 = self;
                      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
                      {
                        v128 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
                        v129 = -[CLDurianTask characteristic](v114, "characteristic");
                        v130 = -[CLDurianTask characteristicPayload](v114, "characteristicPayload");
                        *(_DWORD *)buf = 68289795;
                        v178 = 0;
                        v179 = 2082;
                        v180 = "";
                        v181 = 2113;
                        v182 = v128;
                        v183 = 2113;
                        *(_QWORD *)v184 = v129;
                        *(_WORD *)&v184[8] = 2113;
                        *(_QWORD *)&v184[10] = v130;
                        _os_log_impl((void *)&_mh_execute_header, v127, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye ReadTask\", \"item\":%{private, location:escape_only}@, \"characteristic\":%{private, location:escape_only}@, \"payload\":%{private, location:escape_only}@}", buf, 0x30u);
                      }
                    }
                    -[CBPeripheral readValueForCharacteristic:](v126->_activePeripheral, "readValueForCharacteristic:", -[CLDurianTask characteristic](v114, "characteristic"));
                  }
                  else
                  {
                    v131 = objc_opt_class(CLDurianGATTWriteTask, v125);
                    if ((objc_opt_isKindOfClass(v114, v131) & 1) != 0)
                    {
                      v132 = -[CLDurianTask characteristicPayload](v114, "characteristicPayload");
                      if (-[CLDurianDevice isHawkeyeAccessory](self, "isHawkeyeAccessory"))
                        v132 = -[CLDurianTask nextPacketOfMaxSize:](v114, "nextPacketOfMaxSize:", self->_maxPacketSizeForGATTWriteWithResponse);
                      if (qword_1022A0030 != -1)
                        dispatch_once(&qword_1022A0030, &stru_1021BC538);
                      v133 = qword_1022A0038;
                      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
                      {
                        v134 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
                        v135 = -[CLDurianTask characteristic](v114, "characteristic");
                        maxPacketSizeForGATTWriteWithResponse = self->_maxPacketSizeForGATTWriteWithResponse;
                        *(_DWORD *)buf = 68290051;
                        v178 = 0;
                        v179 = 2082;
                        v180 = "";
                        v181 = 2113;
                        v182 = v134;
                        v183 = 2113;
                        *(_QWORD *)v184 = v135;
                        *(_WORD *)&v184[8] = 2113;
                        *(_QWORD *)&v184[10] = v132;
                        *(_WORD *)&v184[18] = 2049;
                        v185 = (id)maxPacketSizeForGATTWriteWithResponse;
                        _os_log_impl((void *)&_mh_execute_header, v133, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian WriteTask\", \"item\":%{private, location:escape_only}@, \"characteristic\":%{private, location:escape_only}@, \"packet\":%{private, location:escape_only}@, \"maxPacketSize\":%{private}lu}", buf, 0x3Au);
                      }
                      -[CBPeripheral writeValue:forCharacteristic:type:](self->_activePeripheral, "writeValue:forCharacteristic:type:", v132, -[CLDurianTask characteristic](v114, "characteristic"), 0);
                    }
                  }
                }
              }
              v119 = (char *)v119 + 1;
            }
            while (v117 != v119);
            v117 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v158, v174, 16);
          }
          while (v117);
        }
        if (!-[CLDurianTask characteristic](v114, "characteristic"))
        {
          if (qword_1022A0030 != -1)
            dispatch_once(&qword_1022A0030, &stru_1021BC538);
          v137 = qword_1022A0038;
          if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
          {
            v138 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
            v139 = objc_msgSend(objc_msgSend(-[CBPeripheral identifier](self->_activePeripheral, "identifier"), "description"), "substringToIndex:", 8);
            v140 = -[CLDurianTask characteristicUUID](v114, "characteristicUUID");
            *(_DWORD *)buf = 68289795;
            v178 = 0;
            v179 = 2082;
            v180 = "";
            v181 = 2113;
            v182 = v138;
            v183 = 2113;
            *(_QWORD *)v184 = v139;
            *(_WORD *)&v184[8] = 2113;
            *(_QWORD *)&v184[10] = v140;
            _os_log_impl((void *)&_mh_execute_header, v137, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian failed to discover needed characteristic\", \"item\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@, \"characteristic\":%{private, location:escape_only}@}", buf, 0x30u);
          }
        }
      }
      else
      {
        if (qword_1022A0030 != -1)
          dispatch_once(&qword_1022A0030, &stru_1021BC538);
        v141 = qword_1022A0038;
        if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
        {
          v142 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
          v143 = -[CLDurianDevice activeTask](self, "activeTask");
          *(_DWORD *)buf = 68289539;
          v178 = 0;
          v179 = 2082;
          v180 = "";
          v181 = 2113;
          v182 = v142;
          v183 = 2113;
          *(_QWORD *)v184 = v143;
          _os_log_impl((void *)&_mh_execute_header, v141, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian discovered characteristics, but active task is not a GATT task\", \"item\":%{private, location:escape_only}@, \"task\":%{private, location:escape_only}@}", buf, 0x26u);
          if (qword_1022A0030 != -1)
            dispatch_once(&qword_1022A0030, &stru_1021BC538);
        }
        v144 = qword_1022A0038;
        if (os_signpost_enabled((os_log_t)qword_1022A0038))
        {
          v145 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
          v146 = -[CLDurianDevice activeTask](self, "activeTask");
          *(_DWORD *)buf = 68289539;
          v178 = 0;
          v179 = 2082;
          v180 = "";
          v181 = 2113;
          v182 = v145;
          v183 = 2113;
          *(_QWORD *)v184 = v146;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v144, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian discovered characteristics, but active task is not a GATT task", "{\"msg%{public}.0s\":\"#durian discovered characteristics, but active task is not a GATT task\", \"item\":%{private, location:escape_only}@, \"task\":%{private, location:escape_only}@}", buf, 0x26u);
        }
      }
    }
  }
}

- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5
{
  NSObject *v9;
  id v10;
  CLDurianTask *v11;
  uint64_t v12;
  uint64_t v13;
  CLDurianTask *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  NSObject *v28;
  id v29;
  id v30;
  id v31;
  NSObject *v32;
  id v33;
  id v34;
  CLDurianTask *v35;
  id v36;
  const char *v37;
  id v38;
  id v39;
  CLDurianTask *v40;
  id v41;
  CLDurianTask *v42;
  uint64_t v43;
  uint64_t v44;
  CLDurianTask *v45;
  NSObject *v46;
  id v47;
  NSObject *v48;
  id v49;
  id v50;
  CLDurianTask *v51;
  NSObject *v52;
  id v53;
  id v54;
  CLDurianTask *v55;
  NSObject *v56;
  id v57;
  int v58;
  int v59;
  __int16 v60;
  const char *v61;
  __int16 v62;
  id v63;
  __int16 v64;
  id v65;
  __int16 v66;
  id v67;
  __int16 v68;
  id v69;

  if (-[CLDurianDevice isHawkeyeAccessory](self, "isHawkeyeAccessory"))
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
    v9 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v10 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      v58 = 68290051;
      v59 = 0;
      v60 = 2082;
      v61 = "";
      v62 = 2113;
      v63 = v10;
      v64 = 2113;
      v65 = objc_msgSend(objc_msgSend(objc_msgSend(a3, "identifier"), "description"), "substringToIndex:", 8);
      v66 = 2113;
      v67 = a4;
      v68 = 2113;
      v69 = a5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye didWriteValueForCharacteristic\", \"item\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@, \"characteristic\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v58, 0x3Au);
    }
  }
  v11 = -[CLDurianDevice activeTask](self, "activeTask");
  v13 = objc_opt_class(CLDurianGATTWriteTask, v12);
  if ((objc_opt_isKindOfClass(v11, v13) & 1) != 0
    || (v14 = -[CLDurianDevice activeTask](self, "activeTask"),
        v16 = objc_opt_class(CLHawkeyeTask, v15),
        (objc_opt_isKindOfClass(v14, v16) & 1) != 0))
  {
    if (a5)
    {
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC538);
      v17 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
      {
        v18 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
        v19 = objc_msgSend(objc_msgSend(-[CBPeripheral identifier](self->_activePeripheral, "identifier"), "description"), "substringToIndex:", 8);
        v20 = objc_msgSend(a4, "UUID");
        v21 = objc_msgSend(a5, "localizedDescription");
        v58 = 68290051;
        v59 = 0;
        v60 = 2082;
        v61 = "";
        v62 = 2113;
        v63 = v18;
        v64 = 2113;
        v65 = v19;
        v66 = 2113;
        v67 = v20;
        v68 = 2113;
        v69 = v21;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian error writing value for characteristic\", \"item\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@, \"characteristicUUID\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v58, 0x3Au);
        if (qword_1022A0030 != -1)
          dispatch_once(&qword_1022A0030, &stru_1021BC538);
      }
      v22 = qword_1022A0038;
      if (os_signpost_enabled((os_log_t)qword_1022A0038))
      {
        v23 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
        v24 = objc_msgSend(objc_msgSend(-[CBPeripheral identifier](self->_activePeripheral, "identifier"), "description"), "substringToIndex:", 8);
        v25 = objc_msgSend(a4, "UUID");
        v26 = objc_msgSend(a5, "localizedDescription");
        v58 = 68290051;
        v59 = 0;
        v60 = 2082;
        v61 = "";
        v62 = 2113;
        v63 = v23;
        v64 = 2113;
        v65 = v24;
        v66 = 2113;
        v67 = v25;
        v68 = 2113;
        v69 = v26;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian error writing value for characteristic", "{\"msg%{public}.0s\":\"#durian error writing value for characteristic\", \"item\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@, \"characteristicUUID\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v58, 0x3Au);
      }
      if (-[CLDurianDevice isNonOwnerSoundTask:](self, "isNonOwnerSoundTask:", -[CLDurianCommand opcode](-[CLDurianTask command](-[CLDurianDevice activeTask](self, "activeTask"), "command"), "opcode")))
      {
        v27 = 1;
      }
      else
      {
        v27 = 42;
      }
      -[CLDurianDeviceDelegate device:didFailToCompleteTask:withError:andDisconnect:](-[CLDurianDevice delegate](self, "delegate"), "device:didFailToCompleteTask:withError:andDisconnect:", self, -[CLDurianDevice activeTask](self, "activeTask"), v27, 1);
      -[CLDurianDevice completeCurrentTask](self, "completeCurrentTask");
    }
    else
    {
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC538);
      v28 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
      {
        v29 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
        v30 = objc_msgSend(a4, "UUID");
        v31 = objc_msgSend(a4, "value");
        v58 = 68289795;
        v59 = 0;
        v60 = 2082;
        v61 = "";
        v62 = 2113;
        v63 = v29;
        v64 = 2113;
        v65 = v30;
        v66 = 2113;
        v67 = v31;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian wrote value for characteristic\", \"item\":%{private, location:escape_only}@, \"characteristicUUID\":%{private, location:escape_only}@, \"value\":%{private, location:escape_only}@}", (uint8_t *)&v58, 0x30u);
      }
    }
    if (-[CLDurianDevice isPoshAccessory](self, "isPoshAccessory")
      && objc_msgSend(objc_msgSend(a4, "UUID"), "isEqual:", +[CBUUID _cl_PoshAccessoryNonOwnerCharacteristicUUID](CBUUID, "_cl_PoshAccessoryNonOwnerCharacteristicUUID")))
    {
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC538);
      v32 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
      {
        v33 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
        v34 = objc_msgSend(a4, "UUID");
        v35 = -[CLDurianDevice activeTask](self, "activeTask");
        v36 = objc_msgSend(a4, "value");
        v58 = 68290051;
        v59 = 0;
        v60 = 2082;
        v61 = "";
        v62 = 2113;
        v63 = v33;
        v64 = 2113;
        v65 = v34;
        v66 = 2113;
        v67 = v35;
        v68 = 2113;
        v69 = v36;
        v37 = "{\"msg%{public}.0s\":\"#durian #ut #posh wrote to characteristic\", \"item\":%{private, location:escape_on"
              "ly}@, \"characteristic\":%{private, location:escape_only}@, \"task\":%{private, location:escape_only}@, \"
              "value\":%{private, location:escape_only}@}";
LABEL_36:
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, v37, (uint8_t *)&v58, 0x3Au);
      }
    }
    else if (-[CLDurianDevice isAirTag](self, "isAirTag")
           && objc_msgSend(objc_msgSend(a4, "UUID"), "isEqual:", +[CBUUID _cl_DurianUnauthorizedPrecisionFindingCharacteristicUUID](CBUUID, "_cl_DurianUnauthorizedPrecisionFindingCharacteristicUUID")))
    {
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC538);
      v32 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
      {
        v38 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
        v39 = objc_msgSend(a4, "UUID");
        v40 = -[CLDurianDevice activeTask](self, "activeTask");
        v41 = objc_msgSend(a4, "value");
        v58 = 68290051;
        v59 = 0;
        v60 = 2082;
        v61 = "";
        v62 = 2113;
        v63 = v38;
        v64 = 2113;
        v65 = v39;
        v66 = 2113;
        v67 = v40;
        v68 = 2113;
        v69 = v41;
        v37 = "{\"msg%{public}.0s\":\"#durian #ut wrote to characteristic\", \"item\":%{private, location:escape_only}@, "
              "\"characteristic\":%{private, location:escape_only}@, \"task\":%{private, location:escape_only}@, \"value\"
              ":%{private, location:escape_only}@}";
        goto LABEL_36;
      }
    }
    else
    {
      v42 = -[CLDurianDevice activeTask](self, "activeTask");
      v44 = objc_opt_class(CLDurianGATTWriteTask, v43);
      if ((objc_opt_isKindOfClass(v42, v44) & 1) != 0)
      {
        v45 = -[CLDurianDevice activeTask](self, "activeTask");
        if (-[CLDurianDevice isHawkeyeAccessory](self, "isHawkeyeAccessory")
          && (-[CLDurianTask doneSendingPayload](v45, "doneSendingPayload") & 1) == 0)
        {
          if (qword_1022A0030 != -1)
            dispatch_once(&qword_1022A0030, &stru_1021BC538);
          v56 = qword_1022A0038;
          if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
          {
            v57 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
            v58 = 68289283;
            v59 = 0;
            v60 = 2082;
            v61 = "";
            v62 = 2113;
            v63 = v57;
            _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye Sending next fragment of the message\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v58, 0x1Cu);
          }
          -[CBPeripheral writeValue:forCharacteristic:type:](self->_activePeripheral, "writeValue:forCharacteristic:type:", -[CLDurianTask nextPacketOfMaxSize:](v45, "nextPacketOfMaxSize:", self->_maxPacketSizeForGATTWriteWithResponse), -[CLDurianTask characteristic](v45, "characteristic"), 0);
        }
        else
        {
          if (qword_1022A0030 != -1)
            dispatch_once(&qword_1022A0030, &stru_1021BC538);
          v46 = qword_1022A0038;
          if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
          {
            v47 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
            v58 = 68289283;
            v59 = 0;
            v60 = 2082;
            v61 = "";
            v62 = 2113;
            v63 = v47;
            _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye Sent last message fragment\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v58, 0x1Cu);
          }
          -[CLDurianDeviceDelegate device:didCompleteTask:withCompletionCommand:](-[CLDurianDevice delegate](self, "delegate"), "device:didCompleteTask:withCompletionCommand:", self, -[CLDurianDevice activeTask](self, "activeTask"), 0);
          -[CLDurianDevice completeCurrentTask](self, "completeCurrentTask");
        }
      }
    }
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
    v48 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
    {
      v49 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      v50 = objc_msgSend(a4, "UUID");
      v51 = -[CLDurianDevice activeTask](self, "activeTask");
      v58 = 68289795;
      v59 = 0;
      v60 = 2082;
      v61 = "";
      v62 = 2113;
      v63 = v49;
      v64 = 2113;
      v65 = v50;
      v66 = 2113;
      v67 = v51;
      _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian received characteristic write callback, but active task is not a GATTWriteTask\", \"item\":%{private, location:escape_only}@, \"characteristic\":%{private, location:escape_only}@, \"task\":%{private, location:escape_only}@}", (uint8_t *)&v58, 0x30u);
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC538);
    }
    v52 = qword_1022A0038;
    if (os_signpost_enabled((os_log_t)qword_1022A0038))
    {
      v53 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      v54 = objc_msgSend(a4, "UUID");
      v55 = -[CLDurianDevice activeTask](self, "activeTask");
      v58 = 68289795;
      v59 = 0;
      v60 = 2082;
      v61 = "";
      v62 = 2113;
      v63 = v53;
      v64 = 2113;
      v65 = v54;
      v66 = 2113;
      v67 = v55;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v52, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian received characteristic write callback, but active task is not a GATTWriteTask", "{\"msg%{public}.0s\":\"#durian received characteristic write callback, but active task is not a GATTWriteTask\", \"item\":%{private, location:escape_only}@, \"characteristic\":%{private, location:escape_only}@, \"task\":%{private, location:escape_only}@}", (uint8_t *)&v58, 0x30u);
    }
  }
}

- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5
{
  CLDurianTask *v7;
  uint64_t v8;
  uint64_t v9;
  CLDurianTask *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  CLDurianTask *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  CLDurianTask *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  CLDurianTask *v26;
  NSObject *v27;
  id v28;
  NSObject *v29;
  id v30;
  id v31;
  CLDurianTask *v32;
  int v33;
  int v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  id v40;
  __int16 v41;
  CLDurianTask *v42;
  __int16 v43;
  _BOOL4 v44;
  __int16 v45;
  CLDurianCommand *v46;

  v7 = -[CLDurianDevice activeTask](self, "activeTask", a3, a4, a5);
  v9 = objc_opt_class(CLHawkeyeTask, v8);
  if ((objc_opt_isKindOfClass(v7, v9) & 1) != 0
    || (v10 = -[CLDurianDevice activeTask](self, "activeTask"),
        v12 = objc_opt_class(CLDurianGATTWriteTask, v11),
        (objc_opt_isKindOfClass(v10, v12) & 1) != 0))
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
    v13 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      v33 = 68289283;
      v34 = 0;
      v35 = 2082;
      v36 = "";
      v37 = 2113;
      v38 = v14;
      v15 = "{\"msg%{public}.0s\":\"#durian #hawkeye #ut didUpdateNotificationState\", \"item\":%{private, location:escape_only}@}";
      v16 = v13;
      v17 = 28;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v33, v17);
    }
  }
  else
  {
    v18 = -[CLDurianDevice activeTask](self, "activeTask");
    v20 = objc_opt_class(CLDurianGATTReadTask, v19);
    LOBYTE(v18) = objc_opt_isKindOfClass(v18, v20);
    v22 = -[CLDurianDevice activeTask](self, "activeTask");
    if ((v18 & 1) != 0)
    {
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC538);
      v23 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
      {
        v24 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
        v33 = 68290307;
        v34 = 0;
        v35 = 2082;
        v36 = "";
        v37 = 2113;
        v38 = v24;
        v39 = 2114;
        v40 = a4;
        v41 = 2114;
        v42 = (CLDurianTask *)-[CLDurianTask characteristic](v22, "characteristic");
        v43 = 1026;
        v44 = -[CLDurianTask characteristic](v22, "characteristic") == a4;
        v45 = 2114;
        v46 = -[CLDurianTask command](v22, "command");
        v15 = "{\"msg%{public}.0s\":\"#durian #hawkeye #posh didUpdateNotificationState GATTRead\", \"item\":%{private, l"
              "ocation:escape_only}@, \"characteristic\":%{public, location:escape_only}@, \"active\":%{public, location:"
              "escape_only}@, \"send\":%{public}hhd, \"command\":%{public, location:escape_only}@}";
        v16 = v23;
        v17 = 64;
        goto LABEL_7;
      }
    }
    else
    {
      v25 = objc_opt_class(CLDurianGATTRepeatedReadTask, v21);
      if ((objc_opt_isKindOfClass(v22, v25) & 1) != 0)
      {
        v26 = -[CLDurianDevice activeTask](self, "activeTask");
        if (-[CLDurianTask characteristic](v26, "characteristic") == a4)
          -[CBCentralManager sendData:toPeripheral:](self->_centralManager, "sendData:toPeripheral:", -[CLDurianCommand bytes](-[CLDurianTask command](v26, "command"), "bytes"), self->_activePeripheral);
      }
      else
      {
        if (qword_1022A0030 != -1)
          dispatch_once(&qword_1022A0030, &stru_1021BC538);
        v27 = qword_1022A0038;
        if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
        {
          v28 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
          v33 = 68289795;
          v34 = 0;
          v35 = 2082;
          v36 = "";
          v37 = 2113;
          v38 = v28;
          v39 = 2113;
          v40 = objc_msgSend(a4, "UUID");
          v41 = 2113;
          v42 = -[CLDurianDevice activeTask](self, "activeTask");
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian received characteristic notification state update, but active task is not a GATTReceiveTask\", \"item\":%{private, location:escape_only}@, \"characteristic\":%{private, location:escape_only}@, \"task\":%{private, location:escape_only}@}", (uint8_t *)&v33, 0x30u);
          if (qword_1022A0030 != -1)
            dispatch_once(&qword_1022A0030, &stru_1021BC538);
        }
        v29 = qword_1022A0038;
        if (os_signpost_enabled((os_log_t)qword_1022A0038))
        {
          v30 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
          v31 = objc_msgSend(a4, "UUID");
          v32 = -[CLDurianDevice activeTask](self, "activeTask");
          v33 = 68289795;
          v34 = 0;
          v35 = 2082;
          v36 = "";
          v37 = 2113;
          v38 = v30;
          v39 = 2113;
          v40 = v31;
          v41 = 2113;
          v42 = v32;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v29, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian received characteristic notification state update, but active task is not a GATTReceiveTask", "{\"msg%{public}.0s\":\"#durian received characteristic notification state update, but active task is not a GATTReceiveTask\", \"item\":%{private, location:escape_only}@, \"characteristic\":%{private, location:escape_only}@, \"task\":%{private, location:escape_only}@}", (uint8_t *)&v33, 0x30u);
        }
      }
    }
  }
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  NSObject *v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  CLDurianTask *v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  CLDurianTask *v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  NSObject *v25;
  id v26;
  CLDurianTask *activeTask;
  uint64_t v28;
  CLDurianTask *v29;
  NSObject *v30;
  uint64_t v31;
  id v32;
  id v33;
  CLDurianTask *v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  id v38;
  unsigned int v39;
  NSObject *v40;
  id v41;
  unsigned int v42;
  uint64_t v43;
  NSObject *v44;
  id v45;
  CLDurianTask *v46;
  id v47;
  int v48;
  int v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  id v53;
  __int16 v54;
  id v55;
  __int16 v56;
  CLDurianTask *v57;
  __int16 v58;
  id v59;
  __int16 v60;
  id v61;

  if (a5)
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
    v8 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      v10 = -[CBPeripheral identifier](self->_activePeripheral, "identifier");
      v48 = 68290051;
      v50 = 2082;
      v49 = 0;
      v51 = "";
      v52 = 2113;
      v53 = v9;
      v54 = 2114;
      v55 = v10;
      v56 = 2113;
      v57 = (CLDurianTask *)objc_msgSend(objc_msgSend(a4, "UUID"), "description");
      v58 = 2113;
      v59 = objc_msgSend(a5, "localizedDescription");
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian error updating value for characteristic\", \"item\":%{private, location:escape_only}@, \"peripheralUUID\":%{public, location:escape_only}@, \"characteristic\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", (uint8_t *)&v48, 0x3Au);
    }
  }
  if (-[CLDurianDevice isPoshAccessory](self, "isPoshAccessory", a3)
    && objc_msgSend(objc_msgSend(a4, "UUID"), "isEqual:", +[CBUUID _cl_PoshAccessoryNonOwnerCharacteristicUUID](CBUUID, "_cl_PoshAccessoryNonOwnerCharacteristicUUID")))
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
    v11 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v12 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      v13 = objc_msgSend(a4, "UUID");
      v14 = -[CLDurianDevice activeTask](self, "activeTask");
      v15 = objc_msgSend(a4, "value");
      v48 = 68290307;
      v49 = 0;
      v50 = 2082;
      v51 = "";
      v52 = 2113;
      v53 = v12;
      v54 = 2113;
      v55 = v13;
      v56 = 2113;
      v57 = v14;
      v58 = 2113;
      v59 = a4;
      v60 = 2113;
      v61 = v15;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #ut #posh received data for characteristic\", \"item\":%{private, location:escape_only}@, \"characteristic\":%{private, location:escape_only}@, \"task\":%{private, location:escape_only}@, \"characteristic\":%{private, location:escape_only}@, \"value\":%{private, location:escape_only}@}", (uint8_t *)&v48, 0x44u);
    }
    if (-[CLDurianTask characteristic](-[CLDurianDevice activeTask](self, "activeTask"), "characteristic") == a4)
    {
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC538);
      v16 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
      {
        v17 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
        v18 = objc_msgSend(a4, "UUID");
        v19 = (CLDurianTask *)objc_msgSend(a4, "value");
        v48 = 68289795;
        v49 = 0;
        v50 = 2082;
        v51 = "";
        v52 = 2113;
        v53 = v17;
        v54 = 2113;
        v55 = v18;
        v56 = 2113;
        v57 = v19;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #posh read characteristic\", \"item\":%{private, location:escape_only}@, \"characteristicUUID\":%{private, location:escape_only}@, \"value\":%{private, location:escape_only}@}", (uint8_t *)&v48, 0x30u);
      }
    }
    -[CLDurianDevice didReceivePoshData:withCharacteristic:error:](self, "didReceivePoshData:withCharacteristic:error:", objc_msgSend(a4, "value"), a4, a5);
    return;
  }
  if (-[CLDurianDevice isHawkeyeAccessory](self, "isHawkeyeAccessory"))
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
    v20 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v21 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      v48 = 68289539;
      v49 = 0;
      v50 = 2082;
      v51 = "";
      v52 = 2113;
      v53 = v21;
      v54 = 2113;
      v55 = a4;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye didUpdateValue\", \"item\":%{private, location:escape_only}@, \"characteristic\":%{private, location:escape_only}@}", (uint8_t *)&v48, 0x26u);
    }
    if ((objc_msgSend(objc_msgSend(a4, "UUID"), "isEqual:", +[CBUUID _cl_HawkeyeConfigurationCharacteristicUUID](CBUUID, "_cl_HawkeyeConfigurationCharacteristicUUID")) & 1) != 0|| (objc_msgSend(objc_msgSend(a4, "UUID"), "isEqual:", +[CBUUID _cl_HawkeyeDebugCharacteristicUUID](CBUUID, "_cl_HawkeyeDebugCharacteristicUUID")) & 1) != 0|| (objc_msgSend(objc_msgSend(a4, "UUID"), "isEqual:", +[CBUUID _cl_HawkeyePairedOwnerInformationCharacteristicUUID](CBUUID, "_cl_HawkeyePairedOwnerInformationCharacteristicUUID")) & 1) != 0|| (objc_msgSend(objc_msgSend(a4, "UUID"),
                          "isEqual:",
                          +[CBUUID _cl_HawkeyeNonOwnerCharacteristicUUID](CBUUID, "_cl_HawkeyeNonOwnerCharacteristicUUID")) & 1) != 0|| objc_msgSend(objc_msgSend(a4, "UUID"), "isEqual:", +[CBUUID _cl_HawkeyePreciseFindingCharacteristicUUID](CBUUID, "_cl_HawkeyePreciseFindingCharacteristicUUID")))
    {
      goto LABEL_40;
    }
    if (objc_msgSend(objc_msgSend(a4, "UUID"), "isEqual:", +[CBUUID _cl_HawkeyeAccessoryFirmwareUpdateMsgCharacteristicUUID](CBUUID, "_cl_HawkeyeAccessoryFirmwareUpdateMsgCharacteristicUUID")))
    {
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC538);
      v22 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
      {
        v23 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
        v48 = 68289283;
        v49 = 0;
        v50 = 2082;
        v51 = "";
        v52 = 2113;
        v53 = v23;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#hawkeye #firmwareUpdate Received UARP fragment\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v48, 0x1Cu);
      }
      -[CLDurianDevice processUARPMessage:](self, "processUARPMessage:", objc_msgSend(a4, "value"));
      return;
    }
  }
  if (-[CLDurianDevice isAirTag](self, "isAirTag")
    && objc_msgSend(objc_msgSend(a4, "UUID"), "isEqual:", +[CBUUID _cl_DurianUnauthorizedPrecisionFindingCharacteristicUUID](CBUUID, "_cl_DurianUnauthorizedPrecisionFindingCharacteristicUUID")))
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
    v25 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v26 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      v48 = 68289539;
      v49 = 0;
      v50 = 2082;
      v51 = "";
      v52 = 2113;
      v53 = v26;
      v54 = 2113;
      v55 = a4;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #ut didUpdateValue\", \"item\":%{private, location:escape_only}@, \"characteristic\":%{private, location:escape_only}@}", (uint8_t *)&v48, 0x26u);
    }
LABEL_40:
    -[CLDurianDevice didReceiveHawkeyeData:withCharacteristic:error:](self, "didReceiveHawkeyeData:withCharacteristic:error:", objc_msgSend(a4, "value"), a4, a5);
    return;
  }
  activeTask = self->_activeTask;
  v28 = objc_opt_class(CLDurianGATTTask, v24);
  if ((objc_opt_isKindOfClass(activeTask, v28) & 1) != 0)
  {
    v29 = -[CLDurianDevice activeTask](self, "activeTask");
    if (-[CLDurianTask characteristic](v29, "characteristic") == a4)
    {
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC538);
      v30 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
      {
        v32 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
        v33 = objc_msgSend(a4, "UUID");
        v34 = (CLDurianTask *)objc_msgSend(a4, "value");
        v48 = 68289795;
        v49 = 0;
        v50 = 2082;
        v51 = "";
        v52 = 2113;
        v53 = v32;
        v54 = 2113;
        v55 = v33;
        v56 = 2113;
        v57 = v34;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian read characteristic\", \"item\":%{private, location:escape_only}@, \"characteristicUUID\":%{private, location:escape_only}@, \"value\":%{private, location:escape_only}@}", (uint8_t *)&v48, 0x30u);
      }
      v35 = objc_opt_class(CLDurianGATTRepeatedReadTask, v31);
      if ((objc_opt_isKindOfClass(v29, v35) & 1) != 0)
      {
        -[CLDurianTask appendRecievedData:](v29, "appendRecievedData:", objc_msgSend(a4, "value"));
        if (objc_msgSend(objc_msgSend(a4, "value"), "length"))
          -[CBPeripheral readValueForCharacteristic:](self->_activePeripheral, "readValueForCharacteristic:", -[CLDurianTask characteristic](v29, "characteristic"));
      }
      else
      {
        v43 = objc_opt_class(CLDurianGATTReadTask, v36);
        if ((objc_opt_isKindOfClass(v29, v43) & 1) != 0)
        {
          if (-[CLDurianDevice isHawkeyeAccessory](self, "isHawkeyeAccessory"))
          {
            if (qword_1022A0030 != -1)
              dispatch_once(&qword_1022A0030, &stru_1021BC538);
            v44 = qword_1022A0038;
            if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
            {
              v45 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
              v46 = (CLDurianTask *)objc_msgSend(a4, "value");
              v48 = 68289795;
              v49 = 0;
              v50 = 2082;
              v51 = "";
              v52 = 2113;
              v53 = v45;
              v54 = 2113;
              v55 = a4;
              v56 = 2113;
              v57 = v46;
              _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye GATTRead\", \"item\":%{private, location:escape_only}@, \"characteristic\":%{private, location:escape_only}@, \"value\":%{private, location:escape_only}@}", (uint8_t *)&v48, 0x30u);
            }
          }
          v47 = objc_msgSend(a4, "value");
          if (-[CLDurianDevice hawkeyeTestMode](self, "hawkeyeTestMode") == 7)
          {
            LOBYTE(v48) = 3;
            v47 = objc_msgSend(objc_alloc((Class)NSData), "initWithBytes:length:", &v48, 1);
          }
          -[CLDurianTask setReadData:](v29, "setReadData:", v47);
          -[CLDurianDeviceDelegate device:didCompleteTask:withCompletionCommand:](-[CLDurianDevice delegate](self, "delegate"), "device:didCompleteTask:withCompletionCommand:", self, v29, 0);
          -[CLDurianDevice completeCurrentTask](self, "completeCurrentTask");
        }
      }
    }
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
    v37 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
    {
      v38 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      v39 = -[CLDurianCommand opcode](-[CLDurianTask command](self->_activeTask, "command"), "opcode");
      v48 = 68289795;
      v49 = 0;
      v50 = 2082;
      v51 = "";
      v52 = 2113;
      v53 = v38;
      v54 = 2113;
      v55 = a4;
      v56 = 1026;
      LODWORD(v57) = v39;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian unexpected characteristic\", \"item\":%{private, location:escape_only}@, \"characteristic\":%{private, location:escape_only}@, \"opcode\":%{public}d}", (uint8_t *)&v48, 0x2Cu);
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC538);
    }
    v40 = qword_1022A0038;
    if (os_signpost_enabled((os_log_t)qword_1022A0038))
    {
      v41 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      v42 = -[CLDurianCommand opcode](-[CLDurianTask command](self->_activeTask, "command"), "opcode");
      v48 = 68289795;
      v49 = 0;
      v50 = 2082;
      v51 = "";
      v52 = 2113;
      v53 = v41;
      v54 = 2113;
      v55 = a4;
      v56 = 1026;
      LODWORD(v57) = v42;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v40, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian unexpected characteristic", "{\"msg%{public}.0s\":\"#durian unexpected characteristic\", \"item\":%{private, location:escape_only}@, \"characteristic\":%{private, location:escape_only}@, \"opcode\":%{public}d}", (uint8_t *)&v48, 0x2Cu);
    }
  }
}

- (void)didGetPersonalizationInformation:(id)a3
{
  -[CLDurianDeviceDelegate didRetrievePersonalizationInfo:forDevice:error:](self->_delegate, "didRetrievePersonalizationInfo:forDevice:error:", a3, self, 0);
  self->_retrievingPersonalizationInformation = 0;
}

- (void)didCompleteFirmwareUpdate:(id)a3
{
  if (a3)
  {
    -[CLDurianDevice informFirmwareUpdateFailureToClientWithError:](self, "informFirmwareUpdateFailureToClientWithError:");
    -[CLDurianDevice exitFirmwareUpdateMode](self, "exitFirmwareUpdateMode");
  }
  else
  {
    -[CLDurianDeviceDelegate didUpdateFirmwareForDevice:error:](self->_delegate, "didUpdateFirmwareForDevice:error:", self, 0);
    *(_WORD *)&self->_firmwareUpdateInProgress = 256;
  }
}

- (void)didAbortFirmwareUpdate
{
  NSObject *v3;
  id v4;
  id v5;
  NSErrorUserInfoKey v6;
  const __CFString *v7;
  uint8_t buf[4];
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  id v13;

  if (!self->_abortingFirmwareUpdate)
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
    v3 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v4 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      *(_DWORD *)buf = 68289283;
      v9 = 0;
      v10 = 2082;
      v11 = "";
      v12 = 2113;
      v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #multi didAbortFirmwareUpdate\", \"item\":%{private, location:escape_only}@}", buf, 0x1Cu);
    }
    v5 = objc_alloc((Class)NSError);
    v6 = NSLocalizedDescriptionKey;
    v7 = CFSTR("Firmware update aborted by device");
    -[CLDurianDevice informFirmwareUpdateFailureToClientWithError:](self, "informFirmwareUpdateFailureToClientWithError:", objc_msgSend(v5, "initWithDomain:code:userInfo:", kCLErrorDomainPrivate, 15, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v7, &v6, 1)));
  }
  -[CLDurianDevice exitFirmwareUpdateMode](self, "exitFirmwareUpdateMode");
}

- (id)startEventCounter
{
  NSObject *v3;
  id v4;
  id v5;
  id v6;
  NSObject *v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  NSErrorUserInfoKey v14;
  const __CFString *v15;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;

  if (self->_connectionEventSpmiRequested)
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
    v3 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v4 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      v5 = objc_msgSend(objc_msgSend(-[CBPeripheral identifier](self->_activePeripheral, "identifier"), "description"), "substringToIndex:", 8);
      *(_DWORD *)buf = 68289539;
      v17 = 0;
      v18 = 2082;
      v19 = "";
      v20 = 2113;
      v21 = v4;
      v22 = 2113;
      v23 = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian startEventCounter requested but already on\", \"item\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@}", buf, 0x26u);
    }
    return 0;
  }
  else if (self->_activePeripheral)
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
    v8 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      v10 = objc_msgSend(objc_msgSend(-[CBPeripheral identifier](self->_activePeripheral, "identifier"), "description"), "substringToIndex:", 8);
      *(_DWORD *)buf = 68289539;
      v17 = 0;
      v18 = 2082;
      v19 = "";
      v20 = 2113;
      v21 = v9;
      v22 = 2113;
      v23 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian startEventCounter\", \"item\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@}", buf, 0x26u);
    }
    v6 = -[CBCentralManager startConnectionEventCounterForPeripheral:](self->_centralManager, "startConnectionEventCounterForPeripheral:", self->_activePeripheral);
    if (!v6)
      self->_connectionEventSpmiRequested = 1;
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
    v11 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68289026;
      v17 = 0;
      v18 = 2082;
      v19 = "";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian startEventCounter active peripheral is nil\"}", buf, 0x12u);
    }
    v12 = objc_alloc((Class)NSError);
    v14 = NSLocalizedDescriptionKey;
    v15 = CFSTR("cannot startEventCounter, active peripheral is nil");
    v6 = objc_msgSend(v12, "initWithDomain:code:userInfo:", kCLErrorDomainPrivate, 6, +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));
    v13 = v6;
  }
  return v6;
}

- (id)stopEventCounter
{
  NSObject *v3;
  id v4;
  id v5;
  id result;
  NSObject *v7;
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  int v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;

  if (self->_connectionEventSpmiRequested)
  {
    if (!self->_activePeripheral)
    {
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BC538);
      v10 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
      {
        v11 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
        v12 = 68289283;
        v13 = 0;
        v14 = 2082;
        v15 = "";
        v16 = 2113;
        v17 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian stopEventCounter active peripheral is nil, assuming connection event SPMI has stopped\", \"item\":%{private, location:escape_only}@}", (uint8_t *)&v12, 0x1Cu);
      }
      result = 0;
      goto LABEL_19;
    }
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
    v3 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v4 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      v5 = objc_msgSend(objc_msgSend(-[CBPeripheral identifier](self->_activePeripheral, "identifier"), "description"), "substringToIndex:", 8);
      v12 = 68289539;
      v13 = 0;
      v14 = 2082;
      v15 = "";
      v16 = 2113;
      v17 = v4;
      v18 = 2113;
      v19 = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian stopEventCounter\", \"item\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@}", (uint8_t *)&v12, 0x26u);
    }
    result = -[CBCentralManager stopConnectionEventCounterForPeripheral:](self->_centralManager, "stopConnectionEventCounterForPeripheral:", self->_activePeripheral);
    if (!result)
LABEL_19:
      self->_connectionEventSpmiRequested = 0;
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
    v7 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
      v9 = objc_msgSend(objc_msgSend(-[CBPeripheral identifier](self->_activePeripheral, "identifier"), "description"), "substringToIndex:", 8);
      v12 = 68289539;
      v13 = 0;
      v14 = 2082;
      v15 = "";
      v16 = 2113;
      v17 = v8;
      v18 = 2113;
      v19 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian stopEventCounter requested but already off\", \"item\":%{private, location:escape_only}@, \"periph\":%{private, location:escape_only}@}", (uint8_t *)&v12, 0x26u);
    }
    return 0;
  }
  return result;
}

- (void)setReconnecting:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  id v6;
  _DWORD v7[2];
  __int16 v8;
  const char *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  _BOOL4 v13;

  v3 = a3;
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC538);
  v5 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
    v7[0] = 68289539;
    v7[1] = 0;
    v8 = 2082;
    v9 = "";
    v10 = 2113;
    v11 = v6;
    v12 = 1026;
    v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #connection setReconnecting\", \"item\":%{private, location:escape_only}@, \"reconnecting\":%{public}hhd}", (uint8_t *)v7, 0x22u);
  }
  self->_reconnecting = v3;
}

- (BOOL)reconnecting
{
  return self->_reconnecting;
}

- (id)getConnectionReason
{
  return self->_connectReason;
}

- (void)setConnectionReason:(id)a3
{
  NSObject *v5;
  id v6;
  NSString *connectReason;
  id v8;
  _BOOL4 v9;
  _DWORD v10[2];
  __int16 v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  id v16;
  __int16 v17;
  NSString *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  _BOOL4 v22;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC538);
  v5 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
    connectReason = self->_connectReason;
    v8 = -[SPSimpleBeacon name](self->_beacon, "name");
    v9 = self->_activePeripheral != 0;
    v10[0] = 68290307;
    v10[1] = 0;
    v11 = 2082;
    v12 = "";
    v13 = 2113;
    v14 = v6;
    v15 = 2113;
    v16 = a3;
    v17 = 2113;
    v18 = connectReason;
    v19 = 2113;
    v20 = v8;
    v21 = 1025;
    v22 = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #metrics setConnectReason\", \"item\":%{private, location:escape_only}@, \"reason\":%{private, location:escape_only}@, \"prior\":%{private, location:escape_only}@, \"name\":%{private, location:escape_only}@, \"isActivePeripheral\":%{private}d}", (uint8_t *)v10, 0x40u);
  }
  if (!self->_connectReason)
  {
    self->_connectReason = (NSString *)a3;

    self->_disconnectReason = 0;
  }
}

- (void)setDisconnectionReason:(id)a3
{
  NSObject *v5;
  id v6;
  NSString *disconnectReason;
  id v8;
  _DWORD v9[2];
  __int16 v10;
  const char *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  id v15;
  __int16 v16;
  NSString *v17;
  __int16 v18;
  id v19;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC538);
  v5 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
    disconnectReason = self->_disconnectReason;
    v8 = -[SPSimpleBeacon name](self->_beacon, "name");
    v9[0] = 68290051;
    v9[1] = 0;
    v10 = 2082;
    v11 = "";
    v12 = 2113;
    v13 = v6;
    v14 = 2113;
    v15 = a3;
    v16 = 2113;
    v17 = disconnectReason;
    v18 = 2113;
    v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #metrics setDisconnectReason\", \"item\":%{private, location:escape_only}@, \"reason\":%{private, location:escape_only}@, \"prior\":%{private, location:escape_only}@, \"name\":%{private, location:escape_only}@}", (uint8_t *)v9, 0x3Au);
  }
  if (!self->_disconnectReason)
    self->_disconnectReason = (NSString *)a3;
}

- (void)sendConnectionMetric
{
  const __CFString *connectReason;
  _QWORD v4[2];
  _QWORD v5[2];

  v4[0] = CFSTR("event");
  v4[1] = CFSTR("reason");
  connectReason = (const __CFString *)self->_connectReason;
  if (!connectReason)
    connectReason = CFSTR("NotSet");
  v5[0] = CFSTR("BtConnect");
  v5[1] = connectReason;
  -[CLDurianDeviceDelegate sendConnectionMetrics:forDevice:](self->_delegate, "sendConnectionMetrics:forDevice:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v5, v4, 2), self);
  self->_connectionTime = CFAbsoluteTimeGetCurrent();
}

- (void)resetHeleMaintMetrics
{
  *(_WORD *)&self->_numProactiveAttempts = 0;
}

- (void)sendDisconnectionMetric
{
  double v3;
  _QWORD v4[4];
  const __CFString *v5;
  int8x16_t v6;
  NSNumber *v7;

  if (self->_connectionTime == 0.0)
    v3 = -1.0;
  else
    v3 = CFAbsoluteTimeGetCurrent() - self->_connectionTime;
  v5 = CFSTR("BtDisconnect");
  v4[0] = CFSTR("event");
  v4[1] = CFSTR("connect");
  v6 = vbslq_s8((int8x16_t)vceqzq_s64(*(int64x2_t *)&self->_connectReason), (int8x16_t)vdupq_n_s64((unint64_t)CFSTR("NotSet")), *(int8x16_t *)&self->_connectReason);
  v4[2] = CFSTR("reason");
  v4[3] = CFSTR("duration");
  v7 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v3);
  -[CLDurianDeviceDelegate sendConnectionMetrics:forDevice:](self->_delegate, "sendConnectionMetrics:forDevice:", +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v5, v4, 4), self);
  -[CLDurianDevice clearConnectionAttemptReasons](self, "clearConnectionAttemptReasons");
}

- (void)clearConnectionAttemptReasons
{
  NSObject *v3;
  id v4;
  NSString *connectReason;
  id v6;
  _DWORD v7[2];
  __int16 v8;
  const char *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  NSString *v13;
  __int16 v14;
  id v15;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC538);
  v3 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
    connectReason = self->_connectReason;
    v6 = -[SPSimpleBeacon name](self->_beacon, "name");
    v7[0] = 68289795;
    v7[1] = 0;
    v8 = 2082;
    v9 = "";
    v10 = 2113;
    v11 = v4;
    v12 = 2113;
    v13 = connectReason;
    v14 = 2113;
    v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #metrics clearConnectionAttempt\", \"item\":%{private, location:escape_only}@, \"prior\":%{private, location:escape_only}@, \"name\":%{private, location:escape_only}@}", (uint8_t *)v7, 0x30u);
  }
  self->_connectionTime = 0.0;

  self->_connectReason = 0;
  self->_disconnectReason = 0;
}

- (double)intervalSinceLastSearchPartyKeyObservation
{
  double v3;
  double v4;
  NSObject *v5;
  id v6;
  unsigned int v7;
  _DWORD v9[2];
  __int16 v10;
  const char *v11;
  __int16 v12;
  id v13;
  __int16 v14;
  int v15;
  __int16 v16;
  unsigned int v17;

  if (!self->_beacon)
    return 0.0;
  -[NSDate timeIntervalSinceDate:](+[NSDate date](NSDate, "date"), "timeIntervalSinceDate:", objc_msgSend(-[SPSimpleBeacon keySyncRecord](self->_beacon, "keySyncRecord"), "lastIndexObservationDate"));
  v4 = v3;
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC538);
  v5 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
    v7 = objc_msgSend(-[SPSimpleBeacon keySyncRecord](self->_beacon, "keySyncRecord"), "lastIndexObserved");
    v9[0] = 68289795;
    v9[1] = 0;
    v10 = 2082;
    v11 = "";
    v12 = 2113;
    v13 = v6;
    v14 = 1026;
    v15 = (int)v4;
    v16 = 1026;
    v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #metric keyFetchEvent\", \"item\":%{private, location:escape_only}@, \"lastObservation\":%{public}d, \"index\":%{public}d}", (uint8_t *)v9, 0x28u);
  }
  return v4;
}

- (void)transitionToState:(int64_t)a3 event:(int64_t)a4 task:(id)a5
{
  NSObject *v9;
  id v10;
  unint64_t stateLastUpdated;
  double v12;
  double v13;
  id v14;
  double v15;
  _DWORD v16[2];
  __int16 v17;
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  unint64_t v22;
  __int16 v23;
  double v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC538);
  v9 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_msgSend(-[NSUUID description](self->_uuid, "description"), "substringToIndex:", 8);
    stateLastUpdated = (unint64_t)self->_stateLastUpdated;
    sub_101536DD8();
    v13 = v12 - self->_stateLastUpdated;
    v14 = -[CLDurianDevice deviceStateToString:](self, "deviceStateToString:", self->_deviceState);
    v16[0] = 68290819;
    v17 = 2082;
    v16[1] = 0;
    v18 = "";
    v19 = 2113;
    v20 = v10;
    v21 = 2049;
    v22 = stateLastUpdated;
    v23 = 2049;
    v24 = v13;
    v25 = 2113;
    v26 = v14;
    v27 = 2113;
    v28 = -[CLDurianDevice deviceStateToString:](self, "deviceStateToString:", a3);
    v29 = 2113;
    v30 = -[CLDurianDevice eventToString:](self, "eventToString:", a4);
    v31 = 2113;
    v32 = a5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian state\", \"item\":%{private, location:escape_only}@, \"lastUpdated\":%{private}llu, \"timeElapsed\":\"%{private}0.3f\", \"from\":%{private, location:escape_only}@, \"to\":%{private, location:escape_only}@, \"event\":%{private, location:escape_only}@, \"task\":%{private, location:escape_only}@}", (uint8_t *)v16, 0x58u);
  }
  self->_deviceState = a3;
  sub_101536DD8();
  self->_stateLastUpdated = v15;
}

- (id)deviceStateToString:(int64_t)a3
{
  if ((unint64_t)a3 > 6)
    return 0;
  else
    return *(&off_1021BC570 + a3);
}

- (id)eventToString:(int64_t)a3
{
  if ((unint64_t)a3 > 0xD)
    return 0;
  else
    return *(&off_1021BC5A8 + a3);
}

- (id)firstPendingTask
{
  return -[NSMutableArray objectAtIndex:](self->_pendingTasks, "objectAtIndex:", 0);
}

- (id)getPendingTasks
{
  return self->_pendingTasks;
}

- (id)createPlaySoundTaskWithSequence:(id)a3
{
  return 0;
}

- (id)createPlayUnauthorizedSoundTaskWithSequence:(id)a3
{
  return 0;
}

- (id)createStopPlayingSoundTask
{
  return 0;
}

- (id)createStopPlayingUnauthorizedSoundTask
{
  return 0;
}

- (id)createInitRangingTaskWithMacAddress:(id)a3
{
  return 0;
}

- (id)createConfigureRangingTaskWithMacAddress:(id)a3 countryCode:(unsigned __int8)a4 uwbChannel:(unsigned __int8)a5 acqPreamble:(unsigned __int8)a6 trackingPreamble:(unsigned __int8)a7 interval:(unsigned __int16)a8
{
  return 0;
}

- (id)createStartRangingTaskWithTargetEventCounter:(unsigned __int16)a3
{
  return 0;
}

- (id)createStopRangingTask
{
  return 0;
}

- (id)createDeinitRangingTask
{
  return 0;
}

- (id)createGetMultiStatusTask
{
  return 0;
}

- (id)createGetGroupStatusTask
{
  return 0;
}

- (id)createDumpLogsTaskOfType:(unint64_t)a3
{
  return 0;
}

- (id)createSetKeyRollTimeoutTaskWithInterval:(unsigned int)a3
{
  return 0;
}

- (id)createInduceCrashTask
{
  return 0;
}

- (id)createSetUnauthorizedPlaySoundRateLimitTask:(BOOL)a3
{
  return 0;
}

- (id)createFetchTxPowerTaskAsOwner:(BOOL)a3
{
  return 0;
}

- (id)createStartAggressiveAdvertisingTaskWithTimeout:(unsigned int)a3
{
  return 0;
}

- (id)createStopAggressiveAdvertisingTask
{
  return 0;
}

- (id)createStartUnauthorizedAggressiveAdvertisingTask
{
  return 0;
}

- (id)createSetTestModeTaskWithMode:(int)a3
{
  return 0;
}

- (id)createSetHawkeyeUTMotionConfigTaskWithSeparatedUTTimeoutSeconds:(unsigned int)a3 separatedUTBackoffTimeoutSeconds:(unsigned int)a4
{
  return 0;
}

- (id)createSetAccelerometerSlopeModeTaskWithConfiguration:(id)a3
{
  return 0;
}

- (id)createSetAccelerometerOrientationModeTaskWithConfiguration:(id)a3
{
  return 0;
}

- (id)createFetchAccelerometerSlopeModeTaskWithConfiguration
{
  return 0;
}

- (id)createFetchAccelerometerOrientationModeTaskWithConfiguration
{
  return 0;
}

- (id)createFetchAccelerometerModeTask
{
  return 0;
}

- (id)createFetchAISProductDataTask
{
  return 0;
}

- (id)createFetchAISManufacturerNameTask
{
  return 0;
}

- (id)createFetchAISModelNameTask
{
  return 0;
}

- (id)createFetchAISModelColorCodeTask
{
  return 0;
}

- (id)createFetchAISAccessoryCategoryTask
{
  return 0;
}

- (id)createFetchAISAccessoryCapabilitiesTask
{
  return 0;
}

- (id)createFetchAISFirmwareVersionTask
{
  return 0;
}

- (id)createFetchAISFindMyVersionTask
{
  return 0;
}

- (id)createFetchAISSerialNumberTask
{
  return 0;
}

- (id)createFetchCurrentPrimaryKeyTask
{
  return 0;
}

- (id)createFetchiCloudIdentifierTask
{
  return 0;
}

- (id)createFetchAISBatteryTypeTask
{
  return 0;
}

- (id)createFetchFirmwareVersionTaskWithCrashLogs:(BOOL)a3
{
  return 0;
}

- (id)createFetchBatteryStatusTask
{
  return 0;
}

- (id)createSetBatteryStatusTaskWithStatus:(unint64_t)a3
{
  return 0;
}

- (id)createFetchUserStatsTaskWithPersistence:(BOOL)a3
{
  return 0;
}

- (id)createSetMaxConnectionsTaskWithCount:(int)a3
{
  return 0;
}

- (id)createUnpairDeviceTask
{
  return 0;
}

- (id)createSetObfuscatedIdentifierTaskWithIdentifier:(id)a3
{
  return 0;
}

- (id)createSetNearOwnerTimeoutTaskInSeconds:(unsigned __int16)a3
{
  return 0;
}

- (id)createSetTagTypeTaskWithType:(unsigned __int8)a3
{
  return 0;
}

- (id)createSetWildModeTaskWithConfiguration:(id)a3
{
  return 0;
}

- (id)createRollWildKeyTask
{
  return 0;
}

- (unsigned)getRangingStatusForOpcode:(unsigned __int16)a3 data:(char *)a4
{
  int v4;
  NSObject *v5;
  NSObject *v6;
  int v8;
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;

  v4 = a3;
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC538);
  v5 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_FAULT))
  {
    v8 = 68289282;
    v9 = 0;
    v10 = 2082;
    v11 = "";
    v12 = 1026;
    v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#durian getRangingStatusForOpcode called for unknown device\", \"opcode\":%{public}d}", (uint8_t *)&v8, 0x18u);
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
  }
  v6 = qword_1022A0038;
  if (os_signpost_enabled((os_log_t)qword_1022A0038))
  {
    v8 = 68289282;
    v9 = 0;
    v10 = 2082;
    v11 = "";
    v12 = 1026;
    v13 = v4;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian getRangingStatusForOpcode called for unknown device", "{\"msg%{public}.0s\":\"#durian getRangingStatusForOpcode called for unknown device\", \"opcode\":%{public}d}", (uint8_t *)&v8, 0x18u);
  }
  return 0x7FFFFFFF;
}

- (unsigned)getRangeEndReasonForOpcode:(unsigned __int16)a3 data:(char *)a4
{
  int v4;
  NSObject *v5;
  NSObject *v6;
  int v8;
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;

  v4 = a3;
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BC538);
  v5 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_FAULT))
  {
    v8 = 68289282;
    v9 = 0;
    v10 = 2082;
    v11 = "";
    v12 = 1026;
    v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#durian getRangeEndReasonForOpcode called for unknown device\", \"opcode\":%{public}d}", (uint8_t *)&v8, 0x18u);
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BC538);
  }
  v6 = qword_1022A0038;
  if (os_signpost_enabled((os_log_t)qword_1022A0038))
  {
    v8 = 68289282;
    v9 = 0;
    v10 = 2082;
    v11 = "";
    v12 = 1026;
    v13 = v4;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian getRangeEndReasonForOpcode called for unknown device", "{\"msg%{public}.0s\":\"#durian getRangeEndReasonForOpcode called for unknown device\", \"opcode\":%{public}d}", (uint8_t *)&v8, 0x18u);
  }
  return 127;
}

- (unint64_t)getMultiStatusFromData:(char *)a3
{
  return 0;
}

- (id)createSetPersistentConnectionTaskWithState:(BOOL)a3
{
  return 0;
}

- (id)createFetchAISProtocolImplementationTask
{
  return 0;
}

- (id)createFetchAISNetworkIdTask
{
  return 0;
}

- (id)createFetchAISBatteryLevelTask
{
  return 0;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (unint64_t)leashState
{
  return self->_leashState;
}

- (void)setLeashState:(unint64_t)a3
{
  self->_leashState = a3;
}

- (BOOL)isRoseInitialized
{
  return self->_isRoseInitialized;
}

- (BOOL)retrievingPersonalizationInformation
{
  return self->_retrievingPersonalizationInformation;
}

- (BOOL)firmwareUpdateInProgress
{
  return self->_firmwareUpdateInProgress;
}

- (BOOL)firmwareUpdateReboot
{
  return self->_firmwareUpdateReboot;
}

- (BOOL)abortingFirmwareUpdate
{
  return self->_abortingFirmwareUpdate;
}

- (BOOL)firmwareUpdateMode
{
  return self->_firmwareUpdateMode;
}

- (CBPeripheral)activePeripheral
{
  return self->_activePeripheral;
}

- (CLFindMyAccessoryConnectionMaterial)activePeripheralMaterial
{
  return self->_activePeripheralMaterial;
}

- (void)setActivePeripheralMaterial:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (BOOL)activePeripheralReady
{
  return self->_activePeripheralReady;
}

- (unint64_t)maintenanceOnlyCondition
{
  return self->_maintenanceOnlyCondition;
}

- (void)setMaintenanceOnlyCondition:(unint64_t)a3
{
  self->_maintenanceOnlyCondition = a3;
}

- (unsigned)proactiveMaintenanceCount
{
  return self->_proactiveMaintenanceCount;
}

- (void)setProactiveMaintenanceCount:(unsigned int)a3
{
  self->_proactiveMaintenanceCount = a3;
}

- (BOOL)isMultiConnectionEnabled
{
  return self->_isMultiConnectionEnabled;
}

- (void)setIsMultiConnectionEnabled:(BOOL)a3
{
  self->_isMultiConnectionEnabled = a3;
}

- (unsigned)lastMaxConnectionsSent
{
  return self->_lastMaxConnectionsSent;
}

- (void)setLastMaxConnectionsSent:(unsigned __int8)a3
{
  self->_lastMaxConnectionsSent = a3;
}

- (unsigned)nearOwnerTimeout
{
  return self->_nearOwnerTimeout;
}

- (void)setNearOwnerTimeout:(unsigned __int16)a3
{
  self->_nearOwnerTimeout = a3;
}

- (unint64_t)mutexState
{
  return self->_mutexState;
}

- (void)setMutexState:(unint64_t)a3
{
  self->_mutexState = a3;
}

- (BOOL)isPlayingSound
{
  return self->_isPlayingSound;
}

- (void)setIsPlayingSound:(BOOL)a3
{
  self->_isPlayingSound = a3;
}

- (BOOL)isRanging
{
  return self->_isRanging;
}

- (void)setIsRanging:(BOOL)a3
{
  self->_isRanging = a3;
}

- (int64_t)btFindingState
{
  return self->_btFindingState;
}

- (SPSimpleBeacon)beacon
{
  return (SPSimpleBeacon *)objc_getProperty(self, a2, 320, 1);
}

- (void)setBeacon:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 320);
}

- (SPUnknownBeacon)unownedBeacon
{
  return (SPUnknownBeacon *)objc_getProperty(self, a2, 328, 1);
}

- (void)setUnownedBeacon:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 328);
}

- (NSDate)lastAlertDate
{
  return self->_lastAlertDate;
}

- (void)setLastAlertDate:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 336);
}

- (char)quarterHourDisconnect
{
  return self->_quarterHourDisconnect;
}

- (void)setQuarterHourDisconnect:(char)a3
{
  self->_quarterHourDisconnect = a3;
}

- (SPCommandKeysCriteria)lastReconciledCriteria
{
  return self->_lastReconciledCriteria;
}

- (void)setLastReconciledCriteria:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 344);
}

- (NSData)lastReconciledAddress
{
  return self->_lastReconciledAddress;
}

- (void)setLastReconciledAddress:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 352);
}

- (unsigned)lastObservedIndex
{
  return self->_lastObservedIndex;
}

- (void)setLastObservedIndex:(unsigned int)a3
{
  self->_lastObservedIndex = a3;
}

- (double)lastObservationTime
{
  return self->_lastObservationTime;
}

- (void)setLastObservationTime:(double)a3
{
  self->_lastObservationTime = a3;
}

- (unint64_t)lastDisconnectionTime
{
  return self->_lastDisconnectionTime;
}

- (void)setLastDisconnectionTime:(unint64_t)a3
{
  self->_lastDisconnectionTime = a3;
}

- (unint64_t)lastProactiveMaintenanceTime
{
  return self->_lastProactiveMaintenanceTime;
}

- (void)setLastProactiveMaintenanceTime:(unint64_t)a3
{
  self->_lastProactiveMaintenanceTime = a3;
}

- (unsigned)keyRollInterval
{
  return self->_keyRollInterval;
}

- (void)setKeyRollInterval:(unsigned int)a3
{
  self->_keyRollInterval = a3;
}

- (unsigned)nearOwnerTimeoutOverride
{
  return self->_nearOwnerTimeoutOverride;
}

- (void)setNearOwnerTimeoutOverride:(unsigned int)a3
{
  self->_nearOwnerTimeoutOverride = a3;
}

- (unsigned)aggressiveAdvertisingTimeout
{
  return self->_aggressiveAdvertisingTimeout;
}

- (void)setAggressiveAdvertisingTimeout:(unsigned int)a3
{
  self->_aggressiveAdvertisingTimeout = a3;
}

- (unsigned)hawkeyeTestMode
{
  return self->_hawkeyeTestMode;
}

- (void)setHawkeyeTestMode:(unsigned __int8)a3
{
  self->_hawkeyeTestMode = a3;
}

- (int64_t)currentLatency
{
  return self->_currentLatency;
}

- (int64_t)commandedLatency
{
  return self->_commandedLatency;
}

- (CLDurianFirmwareUpdater)firmwareUpdater
{
  return self->_firmwareUpdater;
}

- (void)setFirmwareUpdater:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 384);
}

- (CLDurianConnectionAttempt)activeConnectionAttempt
{
  return (CLDurianConnectionAttempt *)objc_getProperty(self, a2, 96, 1);
}

- (void)setActiveConnectionAttempt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (CLDurianConnectionAttempt)pendingConnectionAttempt
{
  return (CLDurianConnectionAttempt *)objc_getProperty(self, a2, 392, 1);
}

- (void)setPendingConnectionAttempt:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 392);
}

- (unint64_t)lastReconciliationTime
{
  return self->_lastReconciliationTime;
}

- (void)setLastReconciliationTime:(unint64_t)a3
{
  self->_lastReconciliationTime = a3;
}

- (unsigned)numProactiveAttempts
{
  return self->_numProactiveAttempts;
}

- (void)setNumProactiveAttempts:(unsigned __int8)a3
{
  self->_numProactiveAttempts = a3;
}

- (unsigned)numProactiveConnects
{
  return self->_numProactiveConnects;
}

- (void)setNumProactiveConnects:(unsigned __int8)a3
{
  self->_numProactiveConnects = a3;
}

- (BOOL)isProactiveAttempt
{
  return self->_isProactiveAttempt;
}

- (void)setIsProactiveAttempt:(BOOL)a3
{
  self->_isProactiveAttempt = a3;
}

- (unint64_t)lastGroupMaintenance
{
  return self->_lastGroupMaintenance;
}

- (void)setLastGroupMaintenance:(unint64_t)a3
{
  self->_lastGroupMaintenance = a3;
}

- (unint64_t)lastAdvertisementDelta
{
  return self->_lastAdvertisementDelta;
}

- (void)setLastAdvertisementDelta:(unint64_t)a3
{
  self->_lastAdvertisementDelta = a3;
}

- (unint64_t)lastGroupClassicDisconnectionTime
{
  return self->_lastGroupClassicDisconnectionTime;
}

- (void)setLastGroupClassicDisconnectionTime:(unint64_t)a3
{
  self->_lastGroupClassicDisconnectionTime = a3;
}

- (double)lastGroupClassicDisconnectionDelta
{
  return self->_lastGroupClassicDisconnectionDelta;
}

- (void)setLastGroupClassicDisconnectionDelta:(double)a3
{
  self->_lastGroupClassicDisconnectionDelta = a3;
}

- (BOOL)isClassicallyConnected
{
  return self->_isClassicallyConnected;
}

- (void)setIsClassicallyConnected:(BOOL)a3
{
  self->_isClassicallyConnected = a3;
}

- (CBCharacteristic)durianNonOwnerPreciseFindingCharacteristic
{
  return (CBCharacteristic *)objc_getProperty(self, a2, 440, 1);
}

- (void)setDurianNonOwnerPreciseFindingCharacteristic:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 440);
}

- (CBCharacteristic)poshNonOwnerCharacteristic
{
  return (CBCharacteristic *)objc_getProperty(self, a2, 448, 1);
}

- (void)setPoshNonOwnerCharacteristic:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 448);
}

- (BOOL)pendingDisconnect
{
  return self->_pendingDisconnect;
}

- (void)setPendingDisconnect:(BOOL)a3
{
  self->_pendingDisconnect = a3;
}

- (TAUnknownBeacon)taUnknownBeacon
{
  return self->_taUnknownBeacon;
}

- (void)setTaUnknownBeacon:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
}

- (CBCharacteristic)hawkeyeConfigurationCharacteristic
{
  return (CBCharacteristic *)objc_getProperty(self, a2, 464, 1);
}

- (void)setHawkeyeConfigurationCharacteristic:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 464);
}

- (CBCharacteristic)hawkeyePairedOwnerInformationCharacteristic
{
  return (CBCharacteristic *)objc_getProperty(self, a2, 472, 1);
}

- (void)setHawkeyePairedOwnerInformationCharacteristic:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 472);
}

- (CBCharacteristic)hawkeyeDebugCharacteristic
{
  return (CBCharacteristic *)objc_getProperty(self, a2, 480, 1);
}

- (void)setHawkeyeDebugCharacteristic:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 480);
}

- (CBCharacteristic)hawkeyePreciseFindingCharacteristic
{
  return (CBCharacteristic *)objc_getProperty(self, a2, 488, 1);
}

- (void)setHawkeyePreciseFindingCharacteristic:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 488);
}

- (CBCharacteristic)hawkeyeFirmwareUpdateCharacteristic
{
  return (CBCharacteristic *)objc_getProperty(self, a2, 496, 1);
}

- (void)setHawkeyeFirmwareUpdateCharacteristic:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 496);
}

- (CBCharacteristic)hawkeyeNonOwnerCharacteristic
{
  return (CBCharacteristic *)objc_getProperty(self, a2, 504, 1);
}

- (void)setHawkeyeNonOwnerCharacteristic:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 504);
}

- (CLDurianDeviceDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CLDurianDeviceDelegate *)a3;
}

- (CLDurianTask)activeTask
{
  return (CLDurianTask *)objc_getProperty(self, a2, 520, 1);
}

- (void)setActiveTask:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 520);
}

@end
