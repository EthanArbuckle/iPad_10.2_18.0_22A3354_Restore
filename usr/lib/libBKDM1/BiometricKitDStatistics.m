@implementation BiometricKitDStatistics

- (BiometricKitDStatistics)init
{
  char *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BiometricKitDStatistics;
  v2 = -[BiometricKitDStatistics init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)*((_QWORD *)v2 + 6);
    *((_QWORD *)v2 + 6) = v3;

    *((_WORD *)v2 + 4) = 0;
    *((_DWORD *)v2 + 6) = 0;
    *((_QWORD *)v2 + 7) = 0;
    *(_DWORD *)(v2 + 11) = 0;
    *(_DWORD *)(v2 + 14) = 0;
    *((_DWORD *)v2 + 8) = 5;
    *((_OWORD *)v2 + 6) = 0u;
    *((_OWORD *)v2 + 7) = 0u;
    *((_OWORD *)v2 + 8) = 0u;
    *((_QWORD *)v2 + 18) = 0;
    *((_QWORD *)v2 + 19) = -1;
    *((_DWORD *)v2 + 10) = -1082130432;
    v5 = (void *)*((_QWORD *)v2 + 11);
    *((_QWORD *)v2 + 10) = 89;
    *((_QWORD *)v2 + 11) = 0;

    v6 = (void *)*((_QWORD *)v2 + 8);
    *((_QWORD *)v2 + 8) = 0;
    *((_QWORD *)v2 + 9) = 0;

  }
  return (BiometricKitDStatistics *)v2;
}

+ (id)statistics
{
  return objc_alloc_init((Class)a1);
}

- (void)serviceMatch
{
  BiometricKitDStatistics *obj;

  obj = self;
  objc_sync_enter(obj);
  -[BiometricKitXPCServerMesa performGetSKSLockStateCommand:outState:](obj->_server, "performGetSKSLockStateCommand:outState:", 501, &obj->_sksLockState);
  obj->_previousSKSLockState = obj->_sksLockState;
  objc_sync_exit(obj);

}

- (void)initSensor
{
  float v2;
  BiometricKitDStatistics *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_calibrationDataState = -[BiometricKitXPCServerMesa getCalibrationDataState](obj->_server, "getCalibrationDataState");
  -[BiometricKitXPCServerMesa getModulationRatio](obj->_server, "getModulationRatio");
  obj->_modulationRatio = v2;
  objc_sync_exit(obj);

}

- (void)startBioOperation:(id)a3
{
  id v4;
  BiometricKitDStatistics *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  NSString *clientName;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSString *v16;
  uint8_t v17[24];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  getOSLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[BiometricKitDStatistics startBioOperation:].cold.1(v17, objc_msgSend(v4, "type"), v6);

  v5->_lastBioOp = objc_msgSend(v4, "type");
  if (objc_msgSend(v4, "type") == 2)
  {
    objc_msgSend(v4, "client");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(v4, "client");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "clientInfo");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9 == 0;

      if (!v10)
      {
        clientName = v5->_clientName;
        v5->_clientName = 0;

        objc_msgSend(v4, "client");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "clientInfo");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("BKClientBundleIdentifier"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "copy");
        v16 = v5->_clientName;
        v5->_clientName = (NSString *)v15;

      }
    }
    -[BiometricKitDStatistics startMatchOperation:](v5, "startMatchOperation:", v4);
  }
  objc_sync_exit(v5);

}

- (void)startMatchOperation:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  NSObject *v9;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "forExtendEnrollment"))
      v6 = 4;
    else
      v6 = 2;
    if (objc_msgSend(v5, "forPreArm"))
      v7 = 5;
    else
      v7 = v6;
    if (objc_msgSend(v5, "forCredentialSet"))
    {
      v8 = objc_msgSend(v5, "useCase");
      v7 = 3;
    }
    else
    {
      v8 = 0;
    }
    if (objc_msgSend(v5, "forUnlock"))
      v7 = 1;
  }
  else
  {
    v8 = 0;
    v7 = 2;
  }
  getOSLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[BiometricKitDStatistics startMatchOperation:].cold.1(v7, v8, v9);

  if (v7 == 5 || v7 == 3)
  {
    -[BiometricKitDStatistics matchOperationStarted](self, "matchOperationStarted");
  }
  else if (v7 == 1)
  {
    -[BiometricKitDStatistics unlockAttemptStarted:](self, "unlockAttemptStarted:", 1);
  }
  self->_lastStartedMatch = v7;
  self->_lastMatchUseCase = v8;

}

- (void)cancel
{
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v2 = *(_DWORD *)(a1 + 24);
  v3 = *(_DWORD *)(a1 + 28);
  v4 = *(unsigned __int8 *)(a1 + 8);
  v5 = *(unsigned __int8 *)(a1 + 12);
  v6 = *(unsigned __int8 *)(a1 + 13);
  v7 = *(_QWORD *)(a1 + 56);
  v8 = *(_QWORD *)(a1 + 64);
  v9 = 136448002;
  v10 = "-[BiometricKitDStatistics cancel]";
  v11 = 1024;
  v12 = v2;
  v13 = 2048;
  v14 = v7;
  v15 = 1024;
  v16 = v3;
  v17 = 1024;
  v18 = v4;
  v19 = 1024;
  v20 = v5;
  v21 = 1024;
  v22 = v6;
  v23 = 2112;
  v24 = v8;
  _os_log_debug_impl(&dword_24B74E000, a2, OS_LOG_TYPE_DEBUG, "%{public}s: O:%d - M:%ld - U:%d - _fO:%d - _hmr:%d - _wfmr:%d, _client:%@", (uint8_t *)&v9, 0x3Eu);
}

- (void)timestampEvent:(unint64_t)a3 absoluteTime:(unint64_t)a4
{
  BiometricKitDStatistics *v5;
  NSObject *v6;

  v5 = self;
  objc_sync_enter(v5);
  getOSLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[BiometricKitDStatistics timestampEvent:absoluteTime:].cold.1();

  if (a3 == 4)
    v5->_prearmedApplePay = 1;
  objc_sync_exit(v5);

}

- (void)matchResult:(id)a3 withDictionary:(id)a4
{
  id v6;
  id v7;
  BiometricKitDStatistics *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  getOSLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[BiometricKitDStatistics matchResult:withDictionary:].cold.1((uint64_t)v6, v9, v10);

  if (v8->_lastStartedMatch != 4)
  {
    v8->_waitingForMatchResult = 0;
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("BKMatchDetailImageMetadata"));
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = objc_msgSend(v11, "bytes");

    if (v12)
    {
      v8->_lastMatchResultWakePin = *(_BYTE *)(v12 + 71) != 0;
      v13 = *(_QWORD *)(v12 + 59);
      if (v8->_lastMatchResultID == v13)
        goto LABEL_17;
      v8->_lastMatchResultID = v13;
    }
    if (v6)
    {
      objc_msgSend(v6, "uuid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "UUIDString");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSMutableDictionary objectForKeyedSubscript:](v8->_templateStats, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
        objc_msgSend(v16, "setMatchCount:", objc_msgSend(v6, "matchCount"));

      if (v8->_matchOperationInProgress)
        -[BiometricKitDStatistics matchOperationFinished:](v8, "matchOperationFinished:", 1);
    }
    else
    {
      if ((v8->_lastStartedMatch | 4) == 5)
        ++v8->_failTouchesToUnlock;
      if (v8->_matchOperationInProgress)
        ++v8->_failTouchesToMatch;
    }
    -[BiometricKitDStatistics matchAttemptFinished:](v8, "matchAttemptFinished:", v6 != 0);
  }
LABEL_17:
  objc_sync_exit(v8);

}

- (void)templateUpdate:(id)a3 withDictionary:(id)a4
{
  id v6;
  id v7;
  BiometricKitDStatistics *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  __int16 *v18;
  void *v19;
  void *v20;
  void *v21;
  __int16 v22;
  double v23;
  NSObject *v24;
  NSObject *v25;
  int v26;
  const char *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  getOSLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[BiometricKitDStatistics templateUpdate:withDictionary:].cold.1(v9, v10, v11, v12, v13, v14, v15, v16);

  if (!v6)
  {
    if (__osLog)
      v24 = __osLog;
    else
      v24 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    v26 = 136316162;
    v27 = "identity";
    v28 = 2048;
    v29 = 0;
    v30 = 2080;
    v31 = "";
    v32 = 2080;
    v33 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitDStatistics.m";
    v34 = 1024;
    v35 = 299;
LABEL_22:
    _os_log_impl(&dword_24B74E000, v24, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v26, 0x30u);
    goto LABEL_11;
  }
  if (v8->_lastStartedMatch == 4)
    goto LABEL_11;
  if (!v7)
  {
    if (__osLog)
      v24 = __osLog;
    else
      v24 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    v26 = 136316162;
    v27 = "details";
    v28 = 2048;
    v29 = 0;
    v30 = 2080;
    v31 = "";
    v32 = 2080;
    v33 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitDStatistics.m";
    v34 = 1024;
    v35 = 302;
    goto LABEL_22;
  }
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("BKTemplateUpdateDetailTopologyData"));
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v18 = (__int16 *)objc_msgSend(v17, "bytes");

  if (v18 && v18[9] != -1)
  {
    objc_msgSend(v6, "uuid");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "UUIDString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableDictionary objectForKeyedSubscript:](v8->_templateStats, "objectForKeyedSubscript:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v22 = objc_msgSend((id)objc_opt_class(), "clusterCount:", v18 + 6);
      v23 = ConvertTransToNodeArea(v18[29], v18[1533]);
      objc_msgSend(v21, "setTotalNodeCount:", v18[1532]);
      objc_msgSend(v21, "setLargestComponentNodeCount:", v18[1530]);
      objc_msgSend(v21, "setTotalArea:", v23);
      objc_msgSend(v21, "setLargestComponentArea:", ConvertTransToNodeArea(v18[29], v18[1531]));
      objc_msgSend(v21, "setClusterCount:", v22);
      objc_msgSend(v21, "setUpdateCount:", objc_msgSend(v6, "updateCount"));
    }
    else
    {
      if (__osLog)
        v25 = __osLog;
      else
        v25 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = 136316162;
        v27 = "info";
        v28 = 2048;
        v29 = 0;
        v30 = 2080;
        v31 = "";
        v32 = 2080;
        v33 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitDStatistics.m";
        v34 = 1024;
        v35 = 310;
        _os_log_impl(&dword_24B74E000, v25, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v26, 0x30u);
      }
    }

  }
LABEL_11:
  objc_sync_exit(v8);

}

- (void)addIdentitity:(id)a3
{
  id v4;
  BiometricKitDStatistics *v5;
  void *v6;
  id v7;
  __int16 *v8;
  void *v9;
  void *v10;
  TemplateInfo *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  int v16;
  const char *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!v4)
  {
    if (__osLog)
      v14 = __osLog;
    else
      v14 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    v16 = 136316162;
    v17 = "identity";
    v18 = 2048;
    v19 = 0;
    v20 = 2080;
    v21 = "";
    v22 = 2080;
    v23 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitDStatistics.m";
    v24 = 1024;
    v25 = 335;
    goto LABEL_17;
  }
  -[BiometricKitXPCServerMesa getNodeTopologyForIdentity:withClient:](v5->_server, "getNodeTopologyForIdentity:withClient:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    if (__osLog)
      v14 = __osLog;
    else
      v14 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_18;
    v16 = 136316162;
    v17 = "topologyData";
    v18 = 2048;
    v19 = 0;
    v20 = 2080;
    v21 = "";
    v22 = 2080;
    v23 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitDStatistics.m";
    v24 = 1024;
    v25 = 338;
LABEL_17:
    _os_log_impl(&dword_24B74E000, v14, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v16, 0x30u);
LABEL_18:
    v11 = 0;
    v10 = 0;
    v7 = 0;
    goto LABEL_6;
  }
  v7 = objc_retainAutorelease(v6);
  v8 = (__int16 *)objc_msgSend(v7, "bytes");
  if (!v8)
  {
    if (__osLog)
      v15 = __osLog;
    else
      v15 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_30;
    v16 = 136316162;
    v17 = "templateTopology";
    v18 = 2048;
    v19 = 0;
    v20 = 2080;
    v21 = "";
    v22 = 2080;
    v23 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitDStatistics.m";
    v24 = 1024;
    v25 = 340;
    goto LABEL_29;
  }
  if (objc_msgSend(v7, "length") != 3060)
  {
    if (__osLog)
      v15 = __osLog;
    else
      v15 = MEMORY[0x24BDACB70];
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      goto LABEL_30;
    v16 = 136316162;
    v17 = "[topologyData length] == sizeof(node_placement_t)";
    v18 = 2048;
    v19 = 0;
    v20 = 2080;
    v21 = "";
    v22 = 2080;
    v23 = "/Library/Caches/com.apple.xbs/Sources/Mesa_NonUI/AppleBiometricServices/biometrickitd/BiometricKitDStatistics.m";
    v24 = 1024;
    v25 = 341;
LABEL_29:
    _os_log_impl(&dword_24B74E000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v16, 0x30u);
LABEL_30:
    v11 = 0;
    v10 = 0;
    goto LABEL_6;
  }
  objc_msgSend(v4, "uuid");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUIDString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc_init(TemplateInfo);
  -[TemplateInfo setTotalNodeCount:](v11, "setTotalNodeCount:", v8[1526]);
  -[TemplateInfo setLargestComponentNodeCount:](v11, "setLargestComponentNodeCount:", v8[1524]);
  -[TemplateInfo setTotalArea:](v11, "setTotalArea:", ConvertTransToNodeArea(v8[23], v8[1527]));
  -[TemplateInfo setLargestComponentArea:](v11, "setLargestComponentArea:", ConvertTransToNodeArea(v8[23], v8[1525]));
  -[TemplateInfo setClusterCount:](v11, "setClusterCount:", (__int16)objc_msgSend((id)objc_opt_class(), "clusterCount:", v8));
  objc_msgSend(v4, "creationTime");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TemplateInfo setCreationTime:](v11, "setCreationTime:", v12);

  -[TemplateInfo setMatchCount:](v11, "setMatchCount:", objc_msgSend(v4, "matchCount"));
  -[TemplateInfo setUpdateCount:](v11, "setUpdateCount:", objc_msgSend(v4, "updateCount"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v4, "userID"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TemplateInfo setUserID:](v11, "setUserID:", v13);

  -[NSMutableDictionary setValue:forKey:](v5->_templateStats, "setValue:forKey:", v11, v10);
LABEL_6:

  objc_sync_exit(v5);
}

- (void)removeIdentity:(id)a3
{
  BiometricKitDStatistics *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_msgSend(v7, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary removeObjectForKey:](v4->_templateStats, "removeObjectForKey:", v6);
  objc_sync_exit(v4);

}

- (void)removeAllIdentities
{
  OUTLINED_FUNCTION_3(&dword_24B74E000, a1, a3, "%{public}s: ", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)resetMatchCounts
{
  OUTLINED_FUNCTION_3(&dword_24B74E000, a1, a3, "%{public}s: ", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)statusMessage:(unsigned int)a3
{
  uint64_t v3;
  BiometricKitDStatistics *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  float v8;
  _QWORD v9[6];

  v3 = *(_QWORD *)&a3;
  v9[5] = *MEMORY[0x24BDAC8D0];
  v4 = self;
  objc_sync_enter(v4);
  getOSLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    +[BLHelper stringFromStatus:](BLHelper, "stringFromStatus:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BiometricKitDStatistics statusMessage:].cold.2(v6, (uint64_t)v9, v3, v5);
  }

  switch((int)v3)
  {
    case '5':
      -[BiometricKitDStatistics lastImageIsProcessed](v4, "lastImageIsProcessed");
      break;
    case '6':
    case '8':
    case 'K':
      v4->_lastBioOp = 2;
      v4->_lastStartedMatch = 5;
      -[BiometricKitDStatistics matchOperationStarted](v4, "matchOperationStarted");
      v4->_deviceWokeUpByHomeButton = 0;
      break;
    case '7':
      v4->_haveImageToProcess = 1;
      break;
    case ';':
    case 'Y':
    case 'Z':
    case '[':
      -[BiometricKitDStatistics handleSensorOperationStatusMessage:](v4, "handleSensorOperationStatusMessage:", v3);
      break;
    case '?':
      getOSLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        -[BiometricKitDStatistics statusMessage:].cold.1((uint64_t)v4, v7);

      if (!v4->_fingerOn
        && v4->_lastBioOp == 2
        && v4->_lastStartedMatch != 4
        && !v4->_waitingForMatchResult
        && !v4->_haveImageToProcess)
      {
        v4->_haveMatchResult = 0;
        v4->_pressureMitigationUsed = 0;
        *(_WORD *)&v4->_haveImageToProcess = 0;
        v4->_homeButtonPressedDuringTouch = 0;
        v4->_sensorCaptureRestartsPerFingerDown = 0;
        v4->_imageCaptureRestartsPerFingerDown = 0;
        v4->_imagesPerFingerDown = 0;
      }
      v4->_fingerOn = 1;
      break;
    case '@':
      if (v4->_lastBioOp == 2
        && v4->_lastStartedMatch != 4
        && !v4->_haveMatchResult
        && !v4->_waitingForMatchResult
        && !v4->_haveImageToProcess
        && !-[BiometricKitDStatistics isPasscodeNeeded](v4, "isPasscodeNeeded"))
      {
        -[BiometricKitDStatistics logFingerOff](v4, "logFingerOff");
      }
      v4->_fingerOn = 0;
      break;
    case 'F':
      ++v4->_imageCaptureRestartsPerFingerDown;
      break;
    case 'H':
      ++v4->_imagesPerFingerDown;
      break;
    case 'M':
      ++v4->_sensorCaptureRestartsPerFingerDown;
      break;
    case 'O':
      v4->_deviceWokeUpByHomeButton = 1;
      break;
    case 'T':
      if (v4->_lastBioOp == 2 && v4->_lastStartedMatch != 4 && !v4->_haveMatchResult && !v4->_waitingForMatchResult)
        -[BiometricKitDStatistics matchAttemptFinished:](v4, "matchAttemptFinished:", 0);
      break;
    case '^':
      v4->_calibrationDataState = -[BiometricKitXPCServerMesa getCalibrationDataState](v4->_server, "getCalibrationDataState");
      -[BiometricKitXPCServerMesa getModulationRatio](v4->_server, "getModulationRatio");
      v4->_modulationRatio = v8;
      break;
    case '_':
      if (v4->_lastBioOp == 2 && v4->_lastStartedMatch != 4)
        v4->_waitingForMatchResult = 1;
      break;
      if (v4->_lastBioOp == 2 && v4->_lastStartedMatch != 4 && !v4->_matchWithDesensePauseLogged)
        v4->_matchWithDesensePauseLogged = 1;
      break;
    case 'a':
      v4->_pressureMitigationUsed = 1;
      break;
    default:
      break;
  }
  objc_sync_exit(v4);

}

- (void)handleSensorOperationStatusMessage:(unsigned int)a3
{
  NSDate *sensorOperationStartDate;
  NSDate *v6;
  NSDate *v7;

  self->_sensorOperationMode = a3;
  if (a3 == 90 || a3 == 59)
  {
    sensorOperationStartDate = self->_sensorOperationStartDate;
    self->_sensorOperationStartDate = 0;

    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
    v7 = self->_sensorOperationStartDate;
    self->_sensorOperationStartDate = v6;

    if (a3 == 59)
      self->_lastBioOp = 3;
  }
}

- (void)matchAttemptFinished:(BOOL)a3
{
  NSObject *v5;

  getOSLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[BiometricKitDStatistics matchAttemptFinished:].cold.1();

  if (!self->_haveMatchResult && !a3)
    ++self->_matchRestarts;
  self->_haveMatchResult = 1;
}

- (void)homeButtonStateChanged:(BOOL)a3
{
  BiometricKitDStatistics *v3;
  NSObject *v4;

  v3 = self;
  objc_sync_enter(v3);
  getOSLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[BiometricKitDStatistics homeButtonStateChanged:].cold.1();

  v3->_homeButtonPressedDuringTouch = 1;
  objc_sync_exit(v3);

}

- (void)lockStateUpdated:(unsigned int)a3
{
  NSObject *v5;
  unsigned int sksLockState;

  getOSLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[BiometricKitDStatistics lockStateUpdated:].cold.1(self, a3, v5);

  sksLockState = self->_sksLockState;
  if (sksLockState != a3)
  {
    self->_sksLockState = a3;
    self->_previousSKSLockState = sksLockState;
    if ((a3 & 1) == 0 && (sksLockState & 1) != 0)
    {
      if ((a3 & 0x20) != 0)
        -[BiometricKitDStatistics unlockedByPasscode](self, "unlockedByPasscode");
      else
        -[BiometricKitDStatistics unlockedByMesa](self, "unlockedByMesa");
    }
  }
}

- (unint64_t)totalClusterCount
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSMutableDictionary objectEnumerator](self->_templateStats, "objectEnumerator", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 += (int)objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "clusterCount");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)totalNodeCount
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSMutableDictionary objectEnumerator](self->_templateStats, "objectEnumerator", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 += (int)objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "totalNodeCount");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)totalPrimaryClusterNodeCount
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[NSMutableDictionary objectEnumerator](self->_templateStats, "objectEnumerator", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 += (int)objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "largestComponentNodeCount");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (double)totalArea
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t i;
  double v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NSMutableDictionary objectEnumerator](self->_templateStats, "objectEnumerator", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    v6 = 0.0;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "totalArea");
        v6 = v6 + v8;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v6 = 0.0;
  }

  return v6;
}

- (double)totalPrimaryClusterArea
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  uint64_t i;
  double v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NSMutableDictionary objectEnumerator](self->_templateStats, "objectEnumerator", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    v6 = 0.0;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "largestComponentArea");
        v6 = v6 + v8;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v6 = 0.0;
  }

  return v6;
}

- (BOOL)isMesaEnabled
{
  BOOL v3;
  BOOL v4;

  v3 = -[BiometricKitXPCServerMesa getEnabledForUnlock](self->_server, "getEnabledForUnlock");
  if (-[NSMutableDictionary count](self->_templateStats, "count"))
    v4 = v3;
  else
    v4 = 0;
  return MKBGetDeviceLockState() != 3 && v4;
}

+ (unsigned)clusterCount:(id *)a3
{
  uint64_t v3;
  unsigned int result;
  signed __int16 *p_var1;
  int v6;

  if (a3->var2 < 1)
    return 0;
  v3 = 0;
  result = 0;
  p_var1 = &a3->var10[0].var1;
  do
  {
    v6 = *p_var1;
    p_var1 += 5;
    if (v3 == v6)
      ++result;
    ++v3;
  }
  while ((unsigned __int16)a3->var2 != v3);
  return result;
}

- (void)unlockedByMesa
{
  if (self->_unlockOperationInProgress)
    -[BiometricKitDStatistics unlockAttemptFinished](self, "unlockAttemptFinished");
}

- (void)unlockedByPasscode
{
  if (self->_unlockOperationInProgress)
    -[BiometricKitDStatistics unlockAttemptFinished](self, "unlockAttemptFinished");
}

- (void)displayStatusChanged:(BOOL)a3
{
  BiometricKitDStatistics *v4;
  NSObject *v5;

  v4 = self;
  objc_sync_enter(v4);
  getOSLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[BiometricKitDStatistics displayStatusChanged:].cold.1();

  if (!a3)
  {
    if (v4->_unlockOperationInProgress)
      -[BiometricKitDStatistics unlockAttemptCanceled:](v4, "unlockAttemptCanceled:", 0);
    -[BiometricKitDStatistics unlockAttemptStarted:](v4, "unlockAttemptStarted:", 0);
  }
  objc_sync_exit(v4);

}

- (void)unlockAttemptCanceled:(BOOL)a3
{
  NSObject *v4;

  getOSLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[BiometricKitDStatistics unlockAttemptCanceled:].cold.1();

  if (self->_unlockOperationInProgress)
    -[BiometricKitDStatistics unlockAttemptFinished](self, "unlockAttemptFinished");
}

- (void)unlockAttemptStarted:(BOOL)a3
{
  NSObject *v5;

  getOSLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[BiometricKitDStatistics unlockAttemptStarted:].cold.1(a3, (uint64_t)self, v5);

  if (!self->_unlockOperationInProgress
    || self->_unlockOperationStartedByCommand
    && (-[BiometricKitDStatistics unlockAttemptCanceled:](self, "unlockAttemptCanceled:", 1),
        !self->_unlockOperationInProgress))
  {
    self->_matchRestarts = 0;
    *(_WORD *)&self->_deviceWokeUpByHomeButton = 0;
    self->_failTouchesToUnlock = 0;
    self->_failQuickTapsToUnlock = 0;
    self->_unlockOperationStartedByCommand = a3;
  }
  if (-[BiometricKitDStatistics isMesaEnabled](self, "isMesaEnabled"))
    self->_unlockOperationInProgress = 1;
}

- (void)unlockAttemptFinished
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_24B74E000, v0, v1, "%{public}s: _unlockOpInProgress: %d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)matchOperationStarted
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_24B74E000, v0, v1, "%{public}s: _matchOpInProgress: %d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)matchOperationFinished:(BOOL)a3
{
  NSObject *v4;

  getOSLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[BiometricKitDStatistics matchOperationFinished:].cold.1();

  self->_matchOperationInProgress = 0;
}

- (BOOL)isPasscodeNeeded
{
  return -[BiometricKitDStatistics passcodeNedded:](self, "passcodeNedded:", self->_sksLockState);
}

- (BOOL)wasPasscodeNeeded
{
  return -[BiometricKitDStatistics passcodeNedded:](self, "passcodeNedded:", self->_previousSKSLockState);
}

- (BOOL)passcodeNedded:(int64_t)a3
{
  return a3 & ((a3 & 0xC) != 8);
}

- (void)lastImageIsProcessed
{
  OUTLINED_FUNCTION_3(&dword_24B74E000, a1, a3, "%{public}s: ", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)logFingerOff
{
  OUTLINED_FUNCTION_3(&dword_24B74E000, a1, a3, "%{public}s: ", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (BOOL)wasDeviceHibernated:(id *)a3
{
  unint64_t var2;
  unint64_t var1;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;

  var1 = a3->var1;
  var2 = a3->var2;
  v5 = var1 - var2;
  v6 = var2 > var1;
  v7 = var2 - var1;
  if (v6)
    v8 = v7;
  else
    v8 = v5;
  getOSLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[BiometricKitDStatistics wasDeviceHibernated:].cold.1(v8, v9);

  return (unint64_t)absoluteToMiliseconds() < 0x32;
}

- (void)wakeGestureUpdate:(int64_t)a3
{
  BiometricKitDStatistics *v4;
  NSObject *v5;

  v4 = self;
  objc_sync_enter(v4);
  getOSLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[BiometricKitDStatistics wakeGestureUpdate:].cold.1();

  if (a3 == 1)
    v4->_deviceWokeUpByLiftToWake = 1;
  objc_sync_exit(v4);

}

- (NSMutableDictionary)templateStats
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setTemplateStats:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (BOOL)fingerOn
{
  return self->_fingerOn;
}

- (void)setFingerOn:(BOOL)a3
{
  self->_fingerOn = a3;
}

- (BOOL)unlockOperationInProgress
{
  return self->_unlockOperationInProgress;
}

- (void)setUnlockOperationInProgress:(BOOL)a3
{
  self->_unlockOperationInProgress = a3;
}

- (BOOL)unlockOperationStartedByCommand
{
  return self->_unlockOperationStartedByCommand;
}

- (void)setUnlockOperationStartedByCommand:(BOOL)a3
{
  self->_unlockOperationStartedByCommand = a3;
}

- (BOOL)matchOperationInProgress
{
  return self->_matchOperationInProgress;
}

- (void)setMatchOperationInProgress:(BOOL)a3
{
  self->_matchOperationInProgress = a3;
}

- (BOOL)haveMatchResult
{
  return self->_haveMatchResult;
}

- (void)setHaveMatchResult:(BOOL)a3
{
  self->_haveMatchResult = a3;
}

- (BOOL)waitingForMatchResult
{
  return self->_waitingForMatchResult;
}

- (void)setWaitingForMatchResult:(BOOL)a3
{
  self->_waitingForMatchResult = a3;
}

- (BOOL)haveImageToProcess
{
  return self->_haveImageToProcess;
}

- (void)setHaveImageToProcess:(BOOL)a3
{
  self->_haveImageToProcess = a3;
}

- (BOOL)matchWithDesensePauseLogged
{
  return self->_matchWithDesensePauseLogged;
}

- (void)setMatchWithDesensePauseLogged:(BOOL)a3
{
  self->_matchWithDesensePauseLogged = a3;
}

- (BOOL)deviceWokeUpByHomeButton
{
  return self->_deviceWokeUpByHomeButton;
}

- (void)setDeviceWokeUpByHomeButton:(BOOL)a3
{
  self->_deviceWokeUpByHomeButton = a3;
}

- (BOOL)deviceWokeUpByLiftToWake
{
  return self->_deviceWokeUpByLiftToWake;
}

- (void)setDeviceWokeUpByLiftToWake:(BOOL)a3
{
  self->_deviceWokeUpByLiftToWake = a3;
}

- (BOOL)pressureMitigationUsed
{
  return self->_pressureMitigationUsed;
}

- (void)setPressureMitigationUsed:(BOOL)a3
{
  self->_pressureMitigationUsed = a3;
}

- (BOOL)prearmedApplePay
{
  return self->_prearmedApplePay;
}

- (void)setPrearmedApplePay:(BOOL)a3
{
  self->_prearmedApplePay = a3;
}

- (BOOL)lastMatchResultWakePin
{
  return self->_lastMatchResultWakePin;
}

- (void)setLastMatchResultWakePin:(BOOL)a3
{
  self->_lastMatchResultWakePin = a3;
}

- (BOOL)homeButtonPressedDuringTouch
{
  return self->_homeButtonPressedDuringTouch;
}

- (void)setHomeButtonPressedDuringTouch:(BOOL)a3
{
  self->_homeButtonPressedDuringTouch = a3;
}

- (int)lastBioOp
{
  return self->_lastBioOp;
}

- (void)setLastBioOp:(int)a3
{
  self->_lastBioOp = a3;
}

- (int64_t)lastStartedMatch
{
  return self->_lastStartedMatch;
}

- (void)setLastStartedMatch:(int64_t)a3
{
  self->_lastStartedMatch = a3;
}

- (int)lastMatchUseCase
{
  return self->_lastMatchUseCase;
}

- (void)setLastMatchUseCase:(int)a3
{
  self->_lastMatchUseCase = a3;
}

- (NSString)clientName
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setClientName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (unint64_t)lastMatchResultID
{
  return self->_lastMatchResultID;
}

- (void)setLastMatchResultID:(unint64_t)a3
{
  self->_lastMatchResultID = a3;
}

- (unsigned)sksLockState
{
  return self->_sksLockState;
}

- (void)setSksLockState:(unsigned int)a3
{
  self->_sksLockState = a3;
}

- (unsigned)previousSKSLockState
{
  return self->_previousSKSLockState;
}

- (void)setPreviousSKSLockState:(unsigned int)a3
{
  self->_previousSKSLockState = a3;
}

- (unint64_t)sensorOperationMode
{
  return self->_sensorOperationMode;
}

- (void)setSensorOperationMode:(unint64_t)a3
{
  self->_sensorOperationMode = a3;
}

- (NSDate)sensorOperationStartDate
{
  return (NSDate *)objc_getProperty(self, a2, 88, 1);
}

- (void)setSensorOperationStartDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (unint64_t)imagesPerFingerDown
{
  return self->_imagesPerFingerDown;
}

- (void)setImagesPerFingerDown:(unint64_t)a3
{
  self->_imagesPerFingerDown = a3;
}

- (unint64_t)sensorCaptureRestartsPerFingerDown
{
  return self->_sensorCaptureRestartsPerFingerDown;
}

- (void)setSensorCaptureRestartsPerFingerDown:(unint64_t)a3
{
  self->_sensorCaptureRestartsPerFingerDown = a3;
}

- (unint64_t)imageCaptureRestartsPerFingerDown
{
  return self->_imageCaptureRestartsPerFingerDown;
}

- (void)setImageCaptureRestartsPerFingerDown:(unint64_t)a3
{
  self->_imageCaptureRestartsPerFingerDown = a3;
}

- (unint64_t)failTouchesToUnlock
{
  return self->_failTouchesToUnlock;
}

- (void)setFailTouchesToUnlock:(unint64_t)a3
{
  self->_failTouchesToUnlock = a3;
}

- (unint64_t)failQuickTapsToUnlock
{
  return self->_failQuickTapsToUnlock;
}

- (void)setFailQuickTapsToUnlock:(unint64_t)a3
{
  self->_failQuickTapsToUnlock = a3;
}

- (unint64_t)failTouchesToMatch
{
  return self->_failTouchesToMatch;
}

- (void)setFailTouchesToMatch:(unint64_t)a3
{
  self->_failTouchesToMatch = a3;
}

- (unint64_t)matchRestarts
{
  return self->_matchRestarts;
}

- (void)setMatchRestarts:(unint64_t)a3
{
  self->_matchRestarts = a3;
}

- (int64_t)calibrationDataState
{
  return self->_calibrationDataState;
}

- (void)setCalibrationDataState:(int64_t)a3
{
  self->_calibrationDataState = a3;
}

- (float)modulationRatio
{
  return self->_modulationRatio;
}

- (void)setModulationRatio:(float)a3
{
  self->_modulationRatio = a3;
}

- (BiometricKitXPCServerMesa)server
{
  return self->_server;
}

- (void)setServer:(id)a3
{
  self->_server = (BiometricKitXPCServerMesa *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sensorOperationStartDate, 0);
  objc_storeStrong((id *)&self->_clientName, 0);
  objc_storeStrong((id *)&self->_templateStats, 0);
}

- (void)startBioOperation:(os_log_t)log .cold.1(uint8_t *buf, int a2, os_log_t log)
{
  *(_DWORD *)buf = 136446466;
  *(_QWORD *)(buf + 4) = "-[BiometricKitDStatistics startBioOperation:]";
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_24B74E000, log, OS_LOG_TYPE_DEBUG, "%{public}s: type: %d", buf, 0x12u);
}

- (void)startMatchOperation:(NSObject *)a3 .cold.1(uint64_t a1, int a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(&unk_251CB3B68, "objectAtIndex:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 136446722;
  v8 = "-[BiometricKitDStatistics startMatchOperation:]";
  v9 = 2112;
  v10 = v5;
  v11 = 1024;
  v12 = a2;
  OUTLINED_FUNCTION_7(&dword_24B74E000, a3, v6, "%{public}s: %@ - UseCase: %d", (uint8_t *)&v7);

  OUTLINED_FUNCTION_6();
}

- (void)timestampEvent:absoluteTime:.cold.1()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  int v3[5];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 136446722;
  OUTLINED_FUNCTION_4();
  v4 = v0;
  v5 = v1;
  _os_log_debug_impl(&dword_24B74E000, v2, OS_LOG_TYPE_DEBUG, "%{public}s: %lu - %llu", (uint8_t *)v3, 0x20u);
}

- (void)matchResult:(uint64_t)a3 withDictionary:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  const char *v3;
  int v4;
  const char *v5;
  __int16 v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (a1)
    v3 = "Match";
  else
    v3 = "NoMatch";
  v4 = 136446466;
  v5 = "-[BiometricKitDStatistics matchResult:withDictionary:]";
  v6 = 2080;
  v7 = v3;
  OUTLINED_FUNCTION_5(&dword_24B74E000, a2, a3, "%{public}s: %s", (uint8_t *)&v4);
  OUTLINED_FUNCTION_2_0();
}

- (void)templateUpdate:(uint64_t)a3 withDictionary:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_24B74E000, a1, a3, "%{public}s: ", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)statusMessage:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  int v3;
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  int v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = *(unsigned __int8 *)(a1 + 8);
  v3 = *(_DWORD *)(a1 + 24);
  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(unsigned __int8 *)(a1 + 13);
  v6 = *(unsigned __int8 *)(a1 + 14);
  v7 = 136447490;
  v8 = "-[BiometricKitDStatistics statusMessage:]";
  v9 = 1024;
  v10 = v2;
  v11 = 1024;
  v12 = v3;
  v13 = 2048;
  v14 = v4;
  v15 = 1024;
  v16 = v5;
  v17 = 1024;
  v18 = v6;
  _os_log_debug_impl(&dword_24B74E000, a2, OS_LOG_TYPE_DEBUG, "%{public}s: FingerON (Fon:%d - Op:%d - M:%ld - _wfmr:%d - _hitp:%d)", (uint8_t *)&v7, 0x2Eu);
}

- (void)statusMessage:(uint64_t)a3 .cold.2(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a2 = 136446722;
  *(_QWORD *)(a2 + 4) = "-[BiometricKitDStatistics statusMessage:]";
  *(_WORD *)(a2 + 12) = 1024;
  *(_DWORD *)(a2 + 14) = a3;
  *(_WORD *)(a2 + 18) = 2112;
  *(_QWORD *)(a2 + 20) = a1;
  OUTLINED_FUNCTION_7(&dword_24B74E000, a4, a3, "%{public}s: %02d (%@)", (uint8_t *)a2);

}

- (void)matchAttemptFinished:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_24B74E000, v0, v1, "%{public}s: %d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)homeButtonStateChanged:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_24B74E000, v0, v1, "%{public}s: HB Pressed: %d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)lockStateUpdated:(NSObject *)a3 .cold.1(_DWORD *a1, int a2, NSObject *a3)
{
  int v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  int v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a1[8];
  v5 = 136446978;
  v6 = "-[BiometricKitDStatistics lockStateUpdated:]";
  v7 = 1024;
  v8 = v4;
  v9 = 1024;
  v10 = a2;
  v11 = 1024;
  v12 = objc_msgSend(a1, "isMesaEnabled");
  _os_log_debug_impl(&dword_24B74E000, a3, OS_LOG_TYPE_DEBUG, "%{public}s: LockState:0x%x -> 0x%x, MesaEnabled:%d", (uint8_t *)&v5, 0x1Eu);
  OUTLINED_FUNCTION_6();
}

- (void)displayStatusChanged:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_24B74E000, v0, v1, "%{public}s: %d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)unlockAttemptCanceled:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_24B74E000, v0, v1, "%{public}s: _unlockOpInProgress: %d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)unlockAttemptStarted:(os_log_t)log .cold.1(char a1, uint64_t a2, os_log_t log)
{
  int v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = *(unsigned __int8 *)(a2 + 9);
  v4 = 136446722;
  v5 = "-[BiometricKitDStatistics unlockAttemptStarted:]";
  v6 = 1024;
  v7 = a1 & 1;
  v8 = 1024;
  v9 = v3;
  _os_log_debug_impl(&dword_24B74E000, log, OS_LOG_TYPE_DEBUG, "%{public}s: byCommand: %d, _unlockOpInProgress: %d", (uint8_t *)&v4, 0x18u);
  OUTLINED_FUNCTION_2_0();
}

- (void)matchOperationFinished:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_24B74E000, v0, v1, "%{public}s: _matchOpInProgress: %d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)wasDeviceHibernated:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  int v4[6];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  absoluteToMiliseconds();
  v4[0] = 136446466;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_24B74E000, a2, v3, "%{public}s: PowerOnButtonPressDelay: %llu", (uint8_t *)v4);
}

- (void)wakeGestureUpdate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 136446466;
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5(&dword_24B74E000, v0, v1, "%{public}s: Gesture: %ld", (uint8_t *)v2);
  OUTLINED_FUNCTION_2_0();
}

@end
