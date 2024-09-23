@implementation CLAvengerScannerPolicy

- (CLAvengerScannerPolicy)initWithDelegate:(id)a3 platformType:(int64_t)a4 supportsPerTypeDuplicateFilter:(BOOL)a5
{
  CLAvengerScannerPolicy *v8;
  CLAvengerScannerPolicy *v9;
  __int128 v10;
  __int128 v11;
  _OWORD v13[4];
  uint64_t v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CLAvengerScannerPolicy;
  v8 = -[CLAvengerScannerPolicy init](&v15, "init");
  v9 = v8;
  if (v8)
  {
    v8->_delegate = (CLAvengerScannerPolicyDelegate *)a3;
    v8->_currentContext.platformType = a4;
    v8->_currentContext.supportsPerTypeDuplicateFilter = a5;
    v10 = *(_OWORD *)&v8->_currentContext.watchAdvertisementBufferScanCount;
    v13[1] = *(_OWORD *)&v8->_currentContext.coexFriendlyAggressiveDiscoveryScanCount;
    v13[2] = v10;
    v11 = *(_OWORD *)&v8->_currentContext.platformType;
    v13[0] = *(_OWORD *)&v8->_currentContext.optedIn;
    v13[3] = v11;
    v14 = *(_QWORD *)&v8->_currentContext.supportsPerTypeDuplicateFilter;
    v8->_currentScanType = -[CLAvengerScannerPolicy resolveNewScanTypeWithNewContext:](v8, "resolveNewScanTypeWithNewContext:", v13);
  }
  return v9;
}

- (int64_t)desiredDefaultScanParameters:(CLAvengerScannerPolicyContext *)a3
{
  int64_t platformType;
  unint64_t totalAdvertisementBuffersAvailable;
  BOOL v5;
  int64_t v6;
  int64_t v7;

  platformType = a3->platformType;
  if (platformType == 3)
    return 2;
  if (platformType != 1)
    return 0;
  totalAdvertisementBuffersAvailable = a3->totalAdvertisementBuffersAvailable;
  if (totalAdvertisementBuffersAvailable >= 2)
  {
    v5 = !a3->optedIn;
    v6 = 6;
    v7 = 4;
    goto LABEL_8;
  }
  if (totalAdvertisementBuffersAvailable != 1)
    return 2;
  v5 = !a3->optedIn;
  v6 = 5;
  v7 = 3;
LABEL_8:
  if (v5)
    return v7;
  else
    return v6;
}

- (int64_t)desiredAggressiveDiscoveryScanParameters:(CLAvengerScannerPolicyContext *)a3
{
  if (a3->aggressiveDiscoveryScanCount)
    return 11;
  else
    return 0;
}

- (int64_t)desiredCoexFriendlyAggressiveDiscoveryScanParameters:(CLAvengerScannerPolicyContext *)a3
{
  NSObject *v4;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;

  if (!a3->coexFriendlyAggressiveDiscoveryScanCount)
    return 0;
  if ((!a3->associatedTo2GHzWiFi || !a3->wifi2GHzCriticalState)
    && !a3->bluetoothAudioActive
    && !a3->downgradedDuringCoexFriendlyAggressiveDiscoveryScan)
  {
    return 11;
  }
  if (!self->_currentContext.downgradedDuringCoexFriendlyAggressiveDiscoveryScan)
  {
    if (qword_1022A0200 != -1)
      dispatch_once(&qword_1022A0200, &stru_1021418B0);
    v4 = qword_1022A0208;
    if (os_log_type_enabled((os_log_t)qword_1022A0208, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 68289026;
      v6[1] = 0;
      v7 = 2082;
      v8 = "";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"CLAvengerScanner: downgrading CoexFriendlyAggressiveDiscovery scan\"}", (uint8_t *)v6, 0x12u);
    }
  }
  self->_currentContext.downgradedDuringCoexFriendlyAggressiveDiscoveryScan = 1;
  return 9;
}

- (int64_t)desiredBTFindingDiscoveryScanParameters:(CLAvengerScannerPolicyContext *)a3
{
  if (!a3->btFindingDiscoveryScanCount)
    return 0;
  if (!a3->associatedTo2GHzWiFi)
    return 12;
  if (a3->wifi2GHzCriticalState)
    return 8;
  return 10;
}

- (int64_t)desiredWatchAdvertisementBufferScanParameters:(CLAvengerScannerPolicyContext *)a3
{
  return a3->watchAdvertisementBufferScanCount && a3->platformType == 2 && a3->totalAdvertisementBuffersAvailable;
}

- (int64_t)desiredHawkeyeLowEnergyScanParameters:(CLAvengerScannerPolicyContext *)a3
{
  if (a3->hawkeyeLowEnergyScanCount)
    return 7;
  else
    return 0;
}

- (int64_t)resolveNewScanTypeWithNewContext:(CLAvengerScannerPolicyContext *)a3
{
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  int64_t v9;
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
  _OWORD v31[4];
  uint64_t v32;
  _OWORD v33[4];
  uint64_t v34;
  _OWORD v35[4];
  uint64_t v36;
  _OWORD v37[4];
  uint64_t v38;
  _OWORD v39[4];
  uint64_t v40;
  _OWORD v41[4];
  uint64_t v42;
  _OWORD v43[4];
  uint64_t v44;
  _OWORD v45[4];
  uint64_t v46;
  _OWORD v47[4];
  uint64_t v48;
  _OWORD v49[4];
  uint64_t v50;
  _OWORD v51[4];
  uint64_t v52;
  _OWORD v53[4];
  uint64_t v54;

  v5 = *(_OWORD *)&a3->platformType;
  v53[2] = *(_OWORD *)&a3->watchAdvertisementBufferScanCount;
  v53[3] = v5;
  v54 = *(_QWORD *)&a3->supportsPerTypeDuplicateFilter;
  v6 = *(_OWORD *)&a3->coexFriendlyAggressiveDiscoveryScanCount;
  v53[0] = *(_OWORD *)&a3->optedIn;
  v53[1] = v6;
  if (-[CLAvengerScannerPolicy desiredDefaultScanParameters:](self, "desiredDefaultScanParameters:", v53) < 1)
  {
    v9 = 0;
  }
  else
  {
    v7 = *(_OWORD *)&a3->platformType;
    v51[2] = *(_OWORD *)&a3->watchAdvertisementBufferScanCount;
    v51[3] = v7;
    v52 = *(_QWORD *)&a3->supportsPerTypeDuplicateFilter;
    v8 = *(_OWORD *)&a3->coexFriendlyAggressiveDiscoveryScanCount;
    v51[0] = *(_OWORD *)&a3->optedIn;
    v51[1] = v8;
    v9 = -[CLAvengerScannerPolicy desiredDefaultScanParameters:](self, "desiredDefaultScanParameters:", v51);
  }
  v10 = *(_OWORD *)&a3->platformType;
  v49[2] = *(_OWORD *)&a3->watchAdvertisementBufferScanCount;
  v49[3] = v10;
  v50 = *(_QWORD *)&a3->supportsPerTypeDuplicateFilter;
  v11 = *(_OWORD *)&a3->coexFriendlyAggressiveDiscoveryScanCount;
  v49[0] = *(_OWORD *)&a3->optedIn;
  v49[1] = v11;
  if (-[CLAvengerScannerPolicy desiredAggressiveDiscoveryScanParameters:](self, "desiredAggressiveDiscoveryScanParameters:", v49) > v9)
  {
    v12 = *(_OWORD *)&a3->platformType;
    v47[2] = *(_OWORD *)&a3->watchAdvertisementBufferScanCount;
    v47[3] = v12;
    v48 = *(_QWORD *)&a3->supportsPerTypeDuplicateFilter;
    v13 = *(_OWORD *)&a3->coexFriendlyAggressiveDiscoveryScanCount;
    v47[0] = *(_OWORD *)&a3->optedIn;
    v47[1] = v13;
    v9 = -[CLAvengerScannerPolicy desiredAggressiveDiscoveryScanParameters:](self, "desiredAggressiveDiscoveryScanParameters:", v47);
  }
  v14 = *(_OWORD *)&a3->platformType;
  v45[2] = *(_OWORD *)&a3->watchAdvertisementBufferScanCount;
  v45[3] = v14;
  v46 = *(_QWORD *)&a3->supportsPerTypeDuplicateFilter;
  v15 = *(_OWORD *)&a3->coexFriendlyAggressiveDiscoveryScanCount;
  v45[0] = *(_OWORD *)&a3->optedIn;
  v45[1] = v15;
  if (-[CLAvengerScannerPolicy desiredBTFindingDiscoveryScanParameters:](self, "desiredBTFindingDiscoveryScanParameters:", v45) > v9)
  {
    v16 = *(_OWORD *)&a3->platformType;
    v43[2] = *(_OWORD *)&a3->watchAdvertisementBufferScanCount;
    v43[3] = v16;
    v44 = *(_QWORD *)&a3->supportsPerTypeDuplicateFilter;
    v17 = *(_OWORD *)&a3->coexFriendlyAggressiveDiscoveryScanCount;
    v43[0] = *(_OWORD *)&a3->optedIn;
    v43[1] = v17;
    v9 = -[CLAvengerScannerPolicy desiredBTFindingDiscoveryScanParameters:](self, "desiredBTFindingDiscoveryScanParameters:", v43);
  }
  v18 = *(_OWORD *)&a3->platformType;
  v41[2] = *(_OWORD *)&a3->watchAdvertisementBufferScanCount;
  v41[3] = v18;
  v42 = *(_QWORD *)&a3->supportsPerTypeDuplicateFilter;
  v19 = *(_OWORD *)&a3->coexFriendlyAggressiveDiscoveryScanCount;
  v41[0] = *(_OWORD *)&a3->optedIn;
  v41[1] = v19;
  if (-[CLAvengerScannerPolicy desiredWatchAdvertisementBufferScanParameters:](self, "desiredWatchAdvertisementBufferScanParameters:", v41) > v9)
  {
    v20 = *(_OWORD *)&a3->platformType;
    v39[2] = *(_OWORD *)&a3->watchAdvertisementBufferScanCount;
    v39[3] = v20;
    v40 = *(_QWORD *)&a3->supportsPerTypeDuplicateFilter;
    v21 = *(_OWORD *)&a3->coexFriendlyAggressiveDiscoveryScanCount;
    v39[0] = *(_OWORD *)&a3->optedIn;
    v39[1] = v21;
    v9 = -[CLAvengerScannerPolicy desiredWatchAdvertisementBufferScanParameters:](self, "desiredWatchAdvertisementBufferScanParameters:", v39);
  }
  v22 = *(_OWORD *)&a3->platformType;
  v37[2] = *(_OWORD *)&a3->watchAdvertisementBufferScanCount;
  v37[3] = v22;
  v38 = *(_QWORD *)&a3->supportsPerTypeDuplicateFilter;
  v23 = *(_OWORD *)&a3->coexFriendlyAggressiveDiscoveryScanCount;
  v37[0] = *(_OWORD *)&a3->optedIn;
  v37[1] = v23;
  if (-[CLAvengerScannerPolicy desiredHawkeyeLowEnergyScanParameters:](self, "desiredHawkeyeLowEnergyScanParameters:", v37) > v9)
  {
    v24 = *(_OWORD *)&a3->platformType;
    v35[2] = *(_OWORD *)&a3->watchAdvertisementBufferScanCount;
    v35[3] = v24;
    v36 = *(_QWORD *)&a3->supportsPerTypeDuplicateFilter;
    v25 = *(_OWORD *)&a3->coexFriendlyAggressiveDiscoveryScanCount;
    v35[0] = *(_OWORD *)&a3->optedIn;
    v35[1] = v25;
    v9 = -[CLAvengerScannerPolicy desiredHawkeyeLowEnergyScanParameters:](self, "desiredHawkeyeLowEnergyScanParameters:", v35);
  }
  v26 = *(_OWORD *)&a3->platformType;
  v33[2] = *(_OWORD *)&a3->watchAdvertisementBufferScanCount;
  v33[3] = v26;
  v34 = *(_QWORD *)&a3->supportsPerTypeDuplicateFilter;
  v27 = *(_OWORD *)&a3->coexFriendlyAggressiveDiscoveryScanCount;
  v33[0] = *(_OWORD *)&a3->optedIn;
  v33[1] = v27;
  if (-[CLAvengerScannerPolicy desiredCoexFriendlyAggressiveDiscoveryScanParameters:](self, "desiredCoexFriendlyAggressiveDiscoveryScanParameters:", v33) > v9)
  {
    v28 = *(_OWORD *)&a3->platformType;
    v31[2] = *(_OWORD *)&a3->watchAdvertisementBufferScanCount;
    v31[3] = v28;
    v32 = *(_QWORD *)&a3->supportsPerTypeDuplicateFilter;
    v29 = *(_OWORD *)&a3->coexFriendlyAggressiveDiscoveryScanCount;
    v31[0] = *(_OWORD *)&a3->optedIn;
    v31[1] = v29;
    return -[CLAvengerScannerPolicy desiredCoexFriendlyAggressiveDiscoveryScanParameters:](self, "desiredCoexFriendlyAggressiveDiscoveryScanParameters:", v31);
  }
  return v9;
}

- (void)updateContext:(CLAvengerScannerPolicyContext *)a3
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  int64_t v9;
  _OWORD v10[4];
  uint64_t v11;

  *(_OWORD *)&self->_currentContext.optedIn = *(_OWORD *)&a3->optedIn;
  v4 = *(_OWORD *)&a3->coexFriendlyAggressiveDiscoveryScanCount;
  v5 = *(_OWORD *)&a3->watchAdvertisementBufferScanCount;
  v6 = *(_OWORD *)&a3->platformType;
  *(unint64_t *)((char *)&self->_currentContext.totalAdvertisementBuffersAvailable + 5) = *(unint64_t *)((char *)&a3->totalAdvertisementBuffersAvailable + 5);
  *(_OWORD *)&self->_currentContext.watchAdvertisementBufferScanCount = v5;
  *(_OWORD *)&self->_currentContext.platformType = v6;
  *(_OWORD *)&self->_currentContext.coexFriendlyAggressiveDiscoveryScanCount = v4;
  v7 = *(_OWORD *)&a3->platformType;
  v10[2] = *(_OWORD *)&a3->watchAdvertisementBufferScanCount;
  v10[3] = v7;
  v11 = *(_QWORD *)&a3->supportsPerTypeDuplicateFilter;
  v8 = *(_OWORD *)&a3->coexFriendlyAggressiveDiscoveryScanCount;
  v10[0] = *(_OWORD *)&a3->optedIn;
  v10[1] = v8;
  v9 = -[CLAvengerScannerPolicy resolveNewScanTypeWithNewContext:](self, "resolveNewScanTypeWithNewContext:", v10);
  if (v9 != self->_currentScanType)
  {
    self->_currentScanType = v9;
    if ((objc_opt_respondsToSelector(self->_delegate, "scanTypeUpdated:") & 1) != 0)
      -[CLAvengerScannerPolicyDelegate scanTypeUpdated:](self->_delegate, "scanTypeUpdated:", self->_currentScanType);
  }
}

- (void)startAggressiveScan
{
  unsigned __int8 v3;
  uint64_t v4;
  unint64_t aggressiveDiscoveryScanCount;
  __int128 v6;
  _QWORD v7[2];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  if (self->_currentContext.aggressiveDiscoveryScanCount != -1)
  {
    v3 = -[CLAvengerScannerPolicy hasActiveAggressiveScan](self, "hasActiveAggressiveScan");
    v4 = *(_QWORD *)&self->_currentContext.optedIn;
    aggressiveDiscoveryScanCount = self->_currentContext.aggressiveDiscoveryScanCount;
    v6 = *(_OWORD *)&self->_currentContext.watchAdvertisementBufferScanCount;
    v8 = *(_OWORD *)&self->_currentContext.coexFriendlyAggressiveDiscoveryScanCount;
    v9 = v6;
    v10 = *(_OWORD *)&self->_currentContext.platformType;
    v11 = *(_QWORD *)&self->_currentContext.supportsPerTypeDuplicateFilter;
    v7[0] = v4;
    v7[1] = aggressiveDiscoveryScanCount + 1;
    -[CLAvengerScannerPolicy updateContext:](self, "updateContext:", v7);
    if ((v3 & 1) == 0)
    {
      if (-[CLAvengerScannerPolicy hasActiveAggressiveScan](self, "hasActiveAggressiveScan"))
      {
        if ((objc_opt_respondsToSelector(self->_delegate, "startedAggressiveDiscoveryScan") & 1) != 0)
          -[CLAvengerScannerPolicyDelegate startedAggressiveDiscoveryScan](self->_delegate, "startedAggressiveDiscoveryScan");
      }
    }
  }
}

- (void)stopAggressiveScan
{
  unsigned int v3;
  uint64_t v4;
  unint64_t aggressiveDiscoveryScanCount;
  __int128 v6;
  _QWORD v7[2];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  if (self->_currentContext.aggressiveDiscoveryScanCount)
  {
    v3 = -[CLAvengerScannerPolicy hasActiveAggressiveScan](self, "hasActiveAggressiveScan");
    v4 = *(_QWORD *)&self->_currentContext.optedIn;
    aggressiveDiscoveryScanCount = self->_currentContext.aggressiveDiscoveryScanCount;
    v6 = *(_OWORD *)&self->_currentContext.watchAdvertisementBufferScanCount;
    v8 = *(_OWORD *)&self->_currentContext.coexFriendlyAggressiveDiscoveryScanCount;
    v9 = v6;
    v10 = *(_OWORD *)&self->_currentContext.platformType;
    v11 = *(_QWORD *)&self->_currentContext.supportsPerTypeDuplicateFilter;
    v7[0] = v4;
    v7[1] = aggressiveDiscoveryScanCount - 1;
    -[CLAvengerScannerPolicy updateContext:](self, "updateContext:", v7);
    if (v3)
    {
      if (!-[CLAvengerScannerPolicy hasActiveAggressiveScan](self, "hasActiveAggressiveScan")
        && (objc_opt_respondsToSelector(self->_delegate, "stoppedAggressiveDiscoveryScan") & 1) != 0)
      {
        -[CLAvengerScannerPolicyDelegate stoppedAggressiveDiscoveryScan](self->_delegate, "stoppedAggressiveDiscoveryScan");
      }
    }
  }
}

- (void)startCoexFriendlyAggressiveScan
{
  unsigned __int8 v3;
  unint64_t coexFriendlyAggressiveDiscoveryScanCount;
  __int128 v5;
  unint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;

  if (self->_currentContext.coexFriendlyAggressiveDiscoveryScanCount != -1)
  {
    v3 = -[CLAvengerScannerPolicy hasActiveAggressiveScan](self, "hasActiveAggressiveScan");
    v5 = *(_OWORD *)&self->_currentContext.optedIn;
    coexFriendlyAggressiveDiscoveryScanCount = self->_currentContext.coexFriendlyAggressiveDiscoveryScanCount;
    v7 = *(_OWORD *)&self->_currentContext.btFindingDiscoveryScanCount;
    v8 = *(_OWORD *)&self->_currentContext.hawkeyeLowEnergyScanCount;
    v9 = *(_OWORD *)&self->_currentContext.totalAdvertisementBuffersAvailable;
    v6 = coexFriendlyAggressiveDiscoveryScanCount + 1;
    -[CLAvengerScannerPolicy updateContext:](self, "updateContext:", &v5);
    if ((v3 & 1) == 0)
    {
      if (-[CLAvengerScannerPolicy hasActiveAggressiveScan](self, "hasActiveAggressiveScan"))
      {
        if ((objc_opt_respondsToSelector(self->_delegate, "startedAggressiveDiscoveryScan") & 1) != 0)
          -[CLAvengerScannerPolicyDelegate startedAggressiveDiscoveryScan](self->_delegate, "startedAggressiveDiscoveryScan");
      }
    }
  }
}

- (void)stopCoexFriendlyAggressiveScan
{
  unsigned int v3;
  unint64_t coexFriendlyAggressiveDiscoveryScanCount;
  BOOL downgradedDuringCoexFriendlyAggressiveDiscoveryScan;
  unint64_t v6;
  __int128 v7;
  unint64_t v8;
  __int128 v9;
  _BYTE v10[28];
  BOOL v11;
  __int16 v12;
  char v13;

  if (self->_currentContext.coexFriendlyAggressiveDiscoveryScanCount)
  {
    v3 = -[CLAvengerScannerPolicy hasActiveAggressiveScan](self, "hasActiveAggressiveScan");
    v7 = *(_OWORD *)&self->_currentContext.optedIn;
    coexFriendlyAggressiveDiscoveryScanCount = self->_currentContext.coexFriendlyAggressiveDiscoveryScanCount;
    v9 = *(_OWORD *)&self->_currentContext.btFindingDiscoveryScanCount;
    *(_OWORD *)v10 = *(_OWORD *)&self->_currentContext.hawkeyeLowEnergyScanCount;
    *(_OWORD *)&v10[12] = *(_OWORD *)((char *)&self->_currentContext.platformType + 4);
    downgradedDuringCoexFriendlyAggressiveDiscoveryScan = self->_currentContext.downgradedDuringCoexFriendlyAggressiveDiscoveryScan;
    v12 = *(_WORD *)(&self->_currentContext.downgradedDuringCoexFriendlyAggressiveDiscoveryScan + 1);
    v13 = *(&self->_currentContext.downgradedDuringCoexFriendlyAggressiveDiscoveryScan + 3);
    v6 = coexFriendlyAggressiveDiscoveryScanCount - 1;
    if (!v6)
      downgradedDuringCoexFriendlyAggressiveDiscoveryScan = 0;
    v8 = v6;
    v11 = downgradedDuringCoexFriendlyAggressiveDiscoveryScan;
    -[CLAvengerScannerPolicy updateContext:](self, "updateContext:", &v7);
    if (v3
      && !-[CLAvengerScannerPolicy hasActiveAggressiveScan](self, "hasActiveAggressiveScan", v7)
      && (objc_opt_respondsToSelector(self->_delegate, "stoppedAggressiveDiscoveryScan") & 1) != 0)
    {
      -[CLAvengerScannerPolicyDelegate stoppedAggressiveDiscoveryScan](self->_delegate, "stoppedAggressiveDiscoveryScan");
    }
  }
}

- (BOOL)hasActiveAggressiveScan
{
  return self->_currentContext.aggressiveDiscoveryScanCount
      || self->_currentContext.coexFriendlyAggressiveDiscoveryScanCount != 0;
}

- (void)startBTFindingScan
{
  unint64_t btFindingDiscoveryScanCount;
  __int128 v4;
  unint64_t v5;
  __int128 v6;
  unint64_t v7;
  unint64_t v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  unint64_t coexFriendlyAggressiveDiscoveryScanCount;

  btFindingDiscoveryScanCount = self->_currentContext.btFindingDiscoveryScanCount;
  if (btFindingDiscoveryScanCount != -1)
  {
    v15 = *(_OWORD *)&self->_currentContext.optedIn;
    coexFriendlyAggressiveDiscoveryScanCount = self->_currentContext.coexFriendlyAggressiveDiscoveryScanCount;
    v4 = *(_OWORD *)&self->_currentContext.platformType;
    v12 = *(_OWORD *)&self->_currentContext.watchAdvertisementBufferScanCount;
    v13 = v4;
    v14 = *(_QWORD *)&self->_currentContext.supportsPerTypeDuplicateFilter;
    v5 = btFindingDiscoveryScanCount + 1;
    if (!btFindingDiscoveryScanCount
      && (objc_opt_respondsToSelector(self->_delegate, "startedBTFindingDiscoveryScan") & 1) != 0)
    {
      -[CLAvengerScannerPolicyDelegate startedBTFindingDiscoveryScan](self->_delegate, "startedBTFindingDiscoveryScan");
    }
    v6 = v15;
    v7 = coexFriendlyAggressiveDiscoveryScanCount;
    v8 = v5;
    v9 = v12;
    v10 = v13;
    v11 = v14;
    -[CLAvengerScannerPolicy updateContext:](self, "updateContext:", &v6);
  }
}

- (void)stopBTFindingScan
{
  unint64_t btFindingDiscoveryScanCount;
  unint64_t coexFriendlyAggressiveDiscoveryScanCount;
  __int128 v5;
  unint64_t v6;
  __int128 v7;
  unint64_t v8;
  unint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;

  btFindingDiscoveryScanCount = self->_currentContext.btFindingDiscoveryScanCount;
  if (btFindingDiscoveryScanCount)
  {
    v7 = *(_OWORD *)&self->_currentContext.optedIn;
    coexFriendlyAggressiveDiscoveryScanCount = self->_currentContext.coexFriendlyAggressiveDiscoveryScanCount;
    v5 = *(_OWORD *)&self->_currentContext.platformType;
    v10 = *(_OWORD *)&self->_currentContext.watchAdvertisementBufferScanCount;
    v11 = v5;
    v12 = *(_QWORD *)&self->_currentContext.supportsPerTypeDuplicateFilter;
    v6 = btFindingDiscoveryScanCount - 1;
    v8 = coexFriendlyAggressiveDiscoveryScanCount;
    v9 = btFindingDiscoveryScanCount - 1;
    -[CLAvengerScannerPolicy updateContext:](self, "updateContext:", &v7);
    if (!v6 && (objc_opt_respondsToSelector(self->_delegate, "stoppedBTFindingDiscoveryScan") & 1) != 0)
      -[CLAvengerScannerPolicyDelegate stoppedBTFindingDiscoveryScan](self->_delegate, "stoppedBTFindingDiscoveryScan");
  }
}

- (void)startWatchAdvertisementBufferScan
{
  unint64_t watchAdvertisementBufferScanCount;
  __int128 v3;
  _OWORD v4[2];
  unint64_t v5;
  __int128 v6;
  __int128 v7;

  watchAdvertisementBufferScanCount = self->_currentContext.watchAdvertisementBufferScanCount;
  if (watchAdvertisementBufferScanCount != -1)
  {
    v3 = *(_OWORD *)&self->_currentContext.coexFriendlyAggressiveDiscoveryScanCount;
    v4[0] = *(_OWORD *)&self->_currentContext.optedIn;
    v4[1] = v3;
    v6 = *(_OWORD *)&self->_currentContext.hawkeyeLowEnergyScanCount;
    v7 = *(_OWORD *)&self->_currentContext.totalAdvertisementBuffersAvailable;
    v5 = watchAdvertisementBufferScanCount + 1;
    -[CLAvengerScannerPolicy updateContext:](self, "updateContext:", v4);
  }
}

- (void)stopWatchAdvertisementBufferScan
{
  unint64_t watchAdvertisementBufferScanCount;
  __int128 v3;
  _OWORD v4[2];
  unint64_t v5;
  __int128 v6;
  __int128 v7;

  watchAdvertisementBufferScanCount = self->_currentContext.watchAdvertisementBufferScanCount;
  if (watchAdvertisementBufferScanCount)
  {
    v3 = *(_OWORD *)&self->_currentContext.coexFriendlyAggressiveDiscoveryScanCount;
    v4[0] = *(_OWORD *)&self->_currentContext.optedIn;
    v4[1] = v3;
    v6 = *(_OWORD *)&self->_currentContext.hawkeyeLowEnergyScanCount;
    v7 = *(_OWORD *)&self->_currentContext.totalAdvertisementBuffersAvailable;
    v5 = watchAdvertisementBufferScanCount - 1;
    -[CLAvengerScannerPolicy updateContext:](self, "updateContext:", v4);
  }
}

- (void)startHawkeyeLowEnergyScan
{
  unint64_t hawkeyeLowEnergyScanCount;
  __int128 v4;
  unint64_t v5;
  _OWORD v6[2];
  unint64_t v7;
  unint64_t v8;
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  unint64_t watchAdvertisementBufferScanCount;

  hawkeyeLowEnergyScanCount = self->_currentContext.hawkeyeLowEnergyScanCount;
  if (hawkeyeLowEnergyScanCount != -1)
  {
    v4 = *(_OWORD *)&self->_currentContext.coexFriendlyAggressiveDiscoveryScanCount;
    v13 = *(_OWORD *)&self->_currentContext.optedIn;
    v14 = v4;
    watchAdvertisementBufferScanCount = self->_currentContext.watchAdvertisementBufferScanCount;
    v11 = *(_OWORD *)&self->_currentContext.platformType;
    v12 = *(_QWORD *)&self->_currentContext.supportsPerTypeDuplicateFilter;
    v5 = hawkeyeLowEnergyScanCount + 1;
    if (!hawkeyeLowEnergyScanCount
      && (objc_opt_respondsToSelector(self->_delegate, "startedHawkeyeLowEnergyScan") & 1) != 0)
    {
      -[CLAvengerScannerPolicyDelegate startedHawkeyeLowEnergyScan](self->_delegate, "startedHawkeyeLowEnergyScan");
    }
    v6[0] = v13;
    v6[1] = v14;
    v7 = watchAdvertisementBufferScanCount;
    v8 = v5;
    v9 = v11;
    v10 = v12;
    -[CLAvengerScannerPolicy updateContext:](self, "updateContext:", v6);
  }
}

- (void)stopHawkeyeLowEnergyScan
{
  unint64_t hawkeyeLowEnergyScanCount;
  __int128 v4;
  unint64_t watchAdvertisementBufferScanCount;
  unint64_t v6;
  _OWORD v7[2];
  unint64_t v8;
  unint64_t v9;
  __int128 v10;
  uint64_t v11;

  hawkeyeLowEnergyScanCount = self->_currentContext.hawkeyeLowEnergyScanCount;
  if (hawkeyeLowEnergyScanCount)
  {
    v4 = *(_OWORD *)&self->_currentContext.coexFriendlyAggressiveDiscoveryScanCount;
    v7[0] = *(_OWORD *)&self->_currentContext.optedIn;
    v7[1] = v4;
    watchAdvertisementBufferScanCount = self->_currentContext.watchAdvertisementBufferScanCount;
    v10 = *(_OWORD *)&self->_currentContext.platformType;
    v11 = *(_QWORD *)&self->_currentContext.supportsPerTypeDuplicateFilter;
    v6 = hawkeyeLowEnergyScanCount - 1;
    v8 = watchAdvertisementBufferScanCount;
    v9 = hawkeyeLowEnergyScanCount - 1;
    -[CLAvengerScannerPolicy updateContext:](self, "updateContext:", v7);
    if (!v6 && (objc_opt_respondsToSelector(self->_delegate, "stoppedHawkeyeLowEnergyScan") & 1) != 0)
      -[CLAvengerScannerPolicyDelegate stoppedHawkeyeLowEnergyScan](self->_delegate, "stoppedHawkeyeLowEnergyScan");
  }
}

- (BOOL)hasActiveBTFindingScan
{
  return self->_currentContext.btFindingDiscoveryScanCount != 0;
}

- (BOOL)optedIn
{
  return self->_currentContext.optedIn;
}

- (void)setOptedIn:(BOOL)a3
{
  BOOL v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  _BYTE v7[23];

  v3 = a3;
  v5 = *(_OWORD *)((char *)&self->_currentContext.coexFriendlyAggressiveDiscoveryScanCount + 1);
  v6 = *(_OWORD *)((char *)&self->_currentContext.watchAdvertisementBufferScanCount + 1);
  *(_OWORD *)v7 = *(_OWORD *)((char *)&self->_currentContext.platformType + 1);
  *(_QWORD *)&v7[15] = *(_QWORD *)&self->_currentContext.supportsPerTypeDuplicateFilter;
  v4 = *(_OWORD *)(&self->_currentContext.optedIn + 1);
  -[CLAvengerScannerPolicy updateContext:](self, "updateContext:", &v3);
}

- (BOOL)associatedTo2GHzWiFi
{
  return self->_currentContext.associatedTo2GHzWiFi;
}

- (void)setAssociatedTo2GHzWiFi:(BOOL)a3
{
  __int128 v3;
  __int128 v4;
  _OWORD v5[4];
  BOOL supportsPerTypeDuplicateFilter;
  BOOL v7;
  int v8;
  __int16 v9;

  v3 = *(_OWORD *)&self->_currentContext.platformType;
  v5[2] = *(_OWORD *)&self->_currentContext.watchAdvertisementBufferScanCount;
  v5[3] = v3;
  supportsPerTypeDuplicateFilter = self->_currentContext.supportsPerTypeDuplicateFilter;
  v4 = *(_OWORD *)&self->_currentContext.coexFriendlyAggressiveDiscoveryScanCount;
  v5[0] = *(_OWORD *)&self->_currentContext.optedIn;
  v5[1] = v4;
  v8 = *(_DWORD *)&self->_currentContext.wifi2GHzCriticalState;
  v9 = *((_WORD *)&self->_currentContext.downgradedDuringCoexFriendlyAggressiveDiscoveryScan + 1);
  v7 = a3;
  -[CLAvengerScannerPolicy updateContext:](self, "updateContext:", v5);
}

- (BOOL)wifi2GHzCriticalState
{
  return self->_currentContext.wifi2GHzCriticalState;
}

- (void)setWifi2GHzCriticalState:(BOOL)a3
{
  __int128 v3;
  __int128 v4;
  _OWORD v5[4];
  __int16 v6;
  BOOL v7;
  int v8;
  char v9;

  v3 = *(_OWORD *)&self->_currentContext.platformType;
  v5[2] = *(_OWORD *)&self->_currentContext.watchAdvertisementBufferScanCount;
  v5[3] = v3;
  v6 = *(_WORD *)&self->_currentContext.supportsPerTypeDuplicateFilter;
  v4 = *(_OWORD *)&self->_currentContext.coexFriendlyAggressiveDiscoveryScanCount;
  v5[0] = *(_OWORD *)&self->_currentContext.optedIn;
  v5[1] = v4;
  v7 = a3;
  v8 = *(_DWORD *)&self->_currentContext.bluetoothAudioActive;
  v9 = *(&self->_currentContext.downgradedDuringCoexFriendlyAggressiveDiscoveryScan + 3);
  -[CLAvengerScannerPolicy updateContext:](self, "updateContext:", v5);
}

- (BOOL)bluetoothAudioActive
{
  return self->_currentContext.bluetoothAudioActive;
}

- (void)setBluetoothAudioActive:(BOOL)a3
{
  __int128 v3;
  __int128 v4;
  int v5;
  _OWORD v6[3];
  _BYTE v7[19];
  BOOL v8;
  int v9;

  v3 = *(_OWORD *)&self->_currentContext.platformType;
  v6[2] = *(_OWORD *)&self->_currentContext.watchAdvertisementBufferScanCount;
  *(_OWORD *)v7 = v3;
  *(_DWORD *)&v7[15] = *(_DWORD *)((char *)&self->_currentContext.totalAdvertisementBuffersAvailable + 7);
  v4 = *(_OWORD *)&self->_currentContext.coexFriendlyAggressiveDiscoveryScanCount;
  v6[0] = *(_OWORD *)&self->_currentContext.optedIn;
  v6[1] = v4;
  v5 = *(_DWORD *)&self->_currentContext.downgradedDuringCoexFriendlyAggressiveDiscoveryScan;
  v8 = a3;
  v9 = v5;
  -[CLAvengerScannerPolicy updateContext:](self, "updateContext:", v6);
}

- (BOOL)downgradedDuringCoexFriendlyAggressiveDiscoveryScan
{
  return self->_currentContext.downgradedDuringCoexFriendlyAggressiveDiscoveryScan;
}

- (unint64_t)totalAdvertisementBuffersAvailable
{
  return self->_currentContext.totalAdvertisementBuffersAvailable;
}

- (void)setTotalAdvertisementBuffersAvailable:(unint64_t)a3
{
  __int128 v3;
  uint64_t v4;
  _OWORD v5[3];
  int64_t platformType;
  unint64_t v7;
  uint64_t v8;

  v3 = *(_OWORD *)&self->_currentContext.coexFriendlyAggressiveDiscoveryScanCount;
  v5[0] = *(_OWORD *)&self->_currentContext.optedIn;
  v5[1] = v3;
  v5[2] = *(_OWORD *)&self->_currentContext.watchAdvertisementBufferScanCount;
  v4 = *(_QWORD *)&self->_currentContext.supportsPerTypeDuplicateFilter;
  platformType = self->_currentContext.platformType;
  v7 = a3;
  v8 = v4;
  -[CLAvengerScannerPolicy updateContext:](self, "updateContext:", v5);
}

- (CLAvengerScannerScanParameters)currentScanParameters
{
  __int128 v3;
  __int128 v4;
  int64x2_t v5;
  int64_t v6;
  __int128 v7;
  unint64_t v8;

  switch(self[2].var2)
  {
    case 0:
      *(_WORD *)&retstr->var0 = 0;
      *(_QWORD *)&v3 = 0xFFFFLL;
      *((_QWORD *)&v3 + 1) = 0xFFFFLL;
      goto LABEL_19;
    case 1:
      retstr->var0 = self[2].var0;
      retstr->var1 = 1;
      v4 = xmmword_101BB5760;
      goto LABEL_9;
    case 2:
      retstr->var0 = self[2].var0;
      retstr->var1 = 1;
      v5 = (int64x2_t)xmmword_101BB5750;
      goto LABEL_17;
    case 3:
      retstr->var0 = self[2].var0;
      retstr->var1 = 1;
      retstr->var2 = 300;
      retstr->var3 = 0;
      v6 = 5;
      goto LABEL_20;
    case 4:
      retstr->var0 = self[2].var0;
      retstr->var1 = 1;
      retstr->var2 = 300;
      retstr->var3 = 0;
      v6 = 7;
      goto LABEL_20;
    case 5:
      retstr->var0 = self[2].var0;
      retstr->var1 = 1;
      *(_OWORD *)&retstr->var2 = xmmword_101BB5720;
      v7 = xmmword_101BB5740;
      goto LABEL_10;
    case 6:
      retstr->var0 = self[2].var0;
      retstr->var1 = 1;
      v4 = xmmword_101BB5720;
LABEL_9:
      *(_OWORD *)&retstr->var2 = v4;
      v7 = xmmword_101BB5730;
LABEL_10:
      *(_OWORD *)&retstr->var4 = v7;
      return self;
    case 7:
      retstr->var0 = self[2].var0;
      retstr->var1 = 1;
      v8 = 300;
      goto LABEL_16;
    case 8:
      *(_WORD *)&retstr->var0 = 257;
      v3 = xmmword_101BB5710;
      goto LABEL_19;
    case 9:
      retstr->var0 = self[2].var0;
      retstr->var1 = 1;
      v8 = 90;
      goto LABEL_16;
    case 0xALL:
      *(_WORD *)&retstr->var0 = 257;
      v3 = xmmword_101BB5700;
      goto LABEL_19;
    case 0xBLL:
      retstr->var0 = self[2].var0;
      retstr->var1 = 1;
      v8 = 30;
LABEL_16:
      v5 = vdupq_n_s64(v8);
LABEL_17:
      *(int64x2_t *)&retstr->var2 = v5;
      retstr->var4 = 0;
      retstr->var5 = 0;
      break;
    case 0xCLL:
      *(_WORD *)&retstr->var0 = 257;
      v3 = xmmword_101BB56F0;
LABEL_19:
      *(_OWORD *)&retstr->var2 = v3;
      v6 = 4 * (self[1].var5 != 0);
LABEL_20:
      retstr->var4 = 0;
      retstr->var5 = v6;
      break;
    default:
      return self;
  }
  return self;
}

+ (id)convertCLAvengerScannerPolicyScanTypeToString:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xB)
    return CFSTR("Off");
  else
    return *(&off_1021418D0 + a3 - 1);
}

- (int64_t)currentScanType
{
  return self->_currentScanType;
}

- (id).cxx_construct
{
  *((_BYTE *)self + 16) = 0;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 69) = 0u;
  return self;
}

@end
