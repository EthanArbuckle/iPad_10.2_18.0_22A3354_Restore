@implementation _TSF_TSDgPTPNetworkPort

+ (id)iokitMatchingDictionaryForClockIdentifier:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("IOProviderClass");
  v9[1] = CFSTR("IOPropertyMatch");
  v10[0] = CFSTR("IOTimeSyncNetworkPort");
  v7 = CFSTR("ClockIdentifier");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (_TSF_TSDgPTPNetworkPort)initWithService:(id)a3 pid:(int)a4
{
  uint64_t v4;
  id v6;
  NSPointerArray *v7;
  NSPointerArray *clients;
  _TSF_TSDgPTPNetworkPort *v9;
  _TSF_IODConnection *v10;
  _TSF_IODConnection *connection;
  uint64_t v12;
  NSString *interfaceName;
  uint64_t v14;
  NSString *sourceAddressString;
  uint64_t v16;
  NSString *destinationAddressString;
  objc_super v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v4 = *(_QWORD *)&a4;
  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
  v7 = (NSPointerArray *)objc_claimAutoreleasedReturnValue();
  clients = self->_clients;
  self->_clients = v7;

  self->_clientsLock._os_unfair_lock_opaque = 0;
  v19.receiver = self;
  v19.super_class = (Class)_TSF_TSDgPTPNetworkPort;
  v9 = -[_TSF_TSDgPTPPort initWithService:pid:](&v19, sel_initWithService_pid_, v6, v4);
  if (v9)
  {
    v10 = -[_TSF_IODConnection initWithService:andType:]([_TSF_IODConnection alloc], "initWithService:andType:", v6, 42);
    connection = v9->_connection;
    v9->_connection = v10;

    if (v9->_connection)
    {
      -[_TSF_TSDgPTPNetworkPort _interfaceName](v9, "_interfaceName");
      v12 = objc_claimAutoreleasedReturnValue();
      interfaceName = v9->_interfaceName;
      v9->_interfaceName = (NSString *)v12;

      v9->_remoteClockIdentity = -[_TSF_TSDgPTPNetworkPort _remoteClockIdentity](v9, "_remoteClockIdentity");
      v9->_remotePortNumber = -[_TSF_TSDgPTPNetworkPort _remotePortNumber](v9, "_remotePortNumber");
      v9->_remoteIsSameDevice = -[_TSF_TSDgPTPNetworkPort _remoteIsSameDevice](v9, "_remoteIsSameDevice");
      v9->_asCapable = -[_TSF_TSDgPTPNetworkPort _isASCapable](v9, "_isASCapable");
      v9->_propagationDelay = -[_TSF_TSDgPTPNetworkPort _propagationDelay](v9, "_propagationDelay");
      v9->_maximumPropagationDelay = -[_TSF_TSDgPTPNetworkPort _maximumPropagationDelay](v9, "_maximumPropagationDelay");
      v9->_minimumPropagationDelay = -[_TSF_TSDgPTPNetworkPort _minimumPropagationDelay](v9, "_minimumPropagationDelay");
      v9->_propagationDelayLimit = -[_TSF_TSDgPTPNetworkPort _propagationDelayLimit](v9, "_propagationDelayLimit");
      v9->_maximumRawDelay = -[_TSF_TSDgPTPNetworkPort _maximumRawDelay](v9, "_maximumRawDelay");
      v9->_minimumRawDelay = -[_TSF_TSDgPTPNetworkPort _minimumRawDelay](v9, "_minimumRawDelay");
      v9->_localSyncLogMeanInterval = -[_TSF_TSDgPTPNetworkPort _localSyncLogMeanInterval](v9, "_localSyncLogMeanInterval");
      v9->_remoteSyncLogMeanInterval = -[_TSF_TSDgPTPNetworkPort _remoteSyncLogMeanInterval](v9, "_remoteSyncLogMeanInterval");
      v9->_localAnnounceLogMeanInterval = -[_TSF_TSDgPTPNetworkPort _localAnnounceLogMeanInterval](v9, "_localAnnounceLogMeanInterval");
      v9->_remoteAnnounceLogMeanInterval = -[_TSF_TSDgPTPNetworkPort _remoteAnnounceLogMeanInterval](v9, "_remoteAnnounceLogMeanInterval");
      v9->_localLinkType = -[_TSF_TSDgPTPNetworkPort _localLinkType](v9, "_localLinkType");
      v9->_remoteLinkType = -[_TSF_TSDgPTPNetworkPort _remoteLinkType](v9, "_remoteLinkType");
      v9->_localTimestampingMode = -[_TSF_TSDgPTPNetworkPort _localTimestampingMode](v9, "_localTimestampingMode");
      v9->_remoteTimestampingMode = -[_TSF_TSDgPTPNetworkPort _remoteTimestampingMode](v9, "_remoteTimestampingMode");
      v9->_localOscillatorType = -[_TSF_TSDgPTPNetworkPort _localOscillatorType](v9, "_localOscillatorType");
      v9->_remoteOscillatorType = -[_TSF_TSDgPTPNetworkPort _remoteOscillatorType](v9, "_remoteOscillatorType");
      v9->_hasLocalFrequencyToleranceLower = -[_TSF_TSDgPTPNetworkPort _hasLocalFrequencyToleranceLower](v9, "_hasLocalFrequencyToleranceLower");
      v9->_localFrequencyToleranceLower = -[_TSF_TSDgPTPNetworkPort _localFrequencyToleranceLower](v9, "_localFrequencyToleranceLower");
      v9->_hasLocalFrequencyToleranceUpper = -[_TSF_TSDgPTPNetworkPort _hasLocalFrequencyToleranceUpper](v9, "_hasLocalFrequencyToleranceUpper");
      v9->_localFrequencyToleranceUpper = -[_TSF_TSDgPTPNetworkPort _localFrequencyToleranceUpper](v9, "_localFrequencyToleranceUpper");
      v9->_hasRemoteFrequencyToleranceLower = -[_TSF_TSDgPTPNetworkPort _hasRemoteFrequencyToleranceLower](v9, "_hasRemoteFrequencyToleranceLower");
      v9->_remoteFrequencyToleranceLower = -[_TSF_TSDgPTPNetworkPort _remoteFrequencyToleranceLower](v9, "_remoteFrequencyToleranceLower");
      v9->_hasRemoteFrequencyToleranceUpper = -[_TSF_TSDgPTPNetworkPort _hasRemoteFrequencyToleranceUpper](v9, "_hasRemoteFrequencyToleranceUpper");
      v9->_remoteFrequencyToleranceUpper = -[_TSF_TSDgPTPNetworkPort _remoteFrequencyToleranceUpper](v9, "_remoteFrequencyToleranceUpper");
      v9->_hasLocalFrequencyStabilityLower = -[_TSF_TSDgPTPNetworkPort _hasLocalFrequencyStabilityLower](v9, "_hasLocalFrequencyStabilityLower");
      v9->_localFrequencyStabilityLower = -[_TSF_TSDgPTPNetworkPort _localFrequencyStabilityLower](v9, "_localFrequencyStabilityLower");
      v9->_hasLocalFrequencyStabilityUpper = -[_TSF_TSDgPTPNetworkPort _hasLocalFrequencyStabilityUpper](v9, "_hasLocalFrequencyStabilityUpper");
      v9->_localFrequencyStabilityUpper = -[_TSF_TSDgPTPNetworkPort _localFrequencyStabilityUpper](v9, "_localFrequencyStabilityUpper");
      v9->_hasRemoteFrequencyStabilityLower = -[_TSF_TSDgPTPNetworkPort _hasRemoteFrequencyStabilityLower](v9, "_hasRemoteFrequencyStabilityLower");
      v9->_remoteFrequencyStabilityLower = -[_TSF_TSDgPTPNetworkPort _remoteFrequencyStabilityLower](v9, "_remoteFrequencyStabilityLower");
      v9->_hasRemoteFrequencyStabilityUpper = -[_TSF_TSDgPTPNetworkPort _hasRemoteFrequencyStabilityUpper](v9, "_hasRemoteFrequencyStabilityUpper");
      v9->_remoteFrequencyStabilityUpper = -[_TSF_TSDgPTPNetworkPort _remoteFrequencyStabilityUpper](v9, "_remoteFrequencyStabilityUpper");
      -[_TSF_TSDgPTPNetworkPort _sourceAddressString](v9, "_sourceAddressString");
      v14 = objc_claimAutoreleasedReturnValue();
      sourceAddressString = v9->_sourceAddressString;
      v9->_sourceAddressString = (NSString *)v14;

      -[_TSF_TSDgPTPNetworkPort _destinationAddressString](v9, "_destinationAddressString");
      v16 = objc_claimAutoreleasedReturnValue();
      destinationAddressString = v9->_destinationAddressString;
      v9->_destinationAddressString = (NSString *)v16;

      v9->_overridenReceiveMatching = -[_TSF_TSDgPTPNetworkPort _overridenReceiveMatching](v9, "_overridenReceiveMatching");
      v9->_overridenReceiveClockIdentity = -[_TSF_TSDgPTPNetworkPort _overridenReceiveClockIdentity](v9, "_overridenReceiveClockIdentity");
      v9->_overridenReceivePortNumber = -[_TSF_TSDgPTPNetworkPort _overridenReceivePortNumber](v9, "_overridenReceivePortNumber");
      v9->_enabled = -[_TSF_TSDgPTPNetworkPort _enabled](v9, "_enabled");
      v9->_asyncCallbackRefcon = 0;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        v21 = "_connection != nil";
        v22 = 2048;
        v23 = 0;
        v24 = 2048;
        v25 = 0;
        v26 = 2080;
        v27 = "";
        v28 = 2080;
        v29 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPPort.m";
        v30 = 1024;
        v31 = 725;
        _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
      }

      v9 = 0;
    }
  }

  return v9;
}

- (void)updateProperties
{
  BOOL v3;
  int v4;
  void *v5;
  void *v6;
  BOOL v7;
  unint64_t v8;
  unsigned __int16 v9;
  BOOL v10;
  NSObject *v11;
  id v12;
  id v13;
  int v14;
  BOOL v15;
  int v16;
  BOOL v17;
  int v18;
  BOOL v19;
  int v20;
  int v21;
  BOOL v22;
  int v23;
  BOOL v24;
  int v25;
  BOOL v26;
  BOOL v27;
  unsigned __int8 v28;
  unsigned __int8 v29;
  unsigned __int8 v30;
  unsigned __int8 v31;
  unsigned __int8 v32;
  unsigned __int8 v33;
  char v34;
  unsigned int v35;
  char v36;
  unsigned int v37;
  char v38;
  unsigned int v39;
  char v40;
  unsigned int v41;
  unsigned int v42;
  BOOL v43;
  BOOL v44;
  unsigned __int16 v45;
  unint64_t v46;
  _QWORD block[5];
  id v48;
  id v49;
  unint64_t v50;
  unint64_t v51;
  unsigned int v52;
  unsigned int v53;
  unsigned int v54;
  unsigned int v55;
  unsigned int v56;
  int v57;
  int v58;
  int v59;
  int v60;
  int v61;
  int v62;
  int v63;
  int v64;
  unsigned __int16 v65;
  unsigned __int16 v66;
  BOOL v67;
  BOOL v68;
  char v69;
  char v70;
  char v71;
  char v72;
  unsigned __int8 v73;
  unsigned __int8 v74;
  unsigned __int8 v75;
  unsigned __int8 v76;
  unsigned __int8 v77;
  unsigned __int8 v78;
  BOOL v79;
  BOOL v80;
  BOOL v81;
  BOOL v82;
  BOOL v83;
  BOOL v84;
  BOOL v85;
  BOOL v86;
  BOOL v87;
  BOOL v88;
  objc_super v89;

  v89.receiver = self;
  v89.super_class = (Class)_TSF_TSDgPTPNetworkPort;
  -[_TSF_TSDgPTPPort updateProperties](&v89, sel_updateProperties);
  v46 = -[_TSF_TSDgPTPNetworkPort _remoteClockIdentity](self, "_remoteClockIdentity");
  v45 = -[_TSF_TSDgPTPNetworkPort _remotePortNumber](self, "_remotePortNumber");
  v44 = -[_TSF_TSDgPTPNetworkPort _remoteIsSameDevice](self, "_remoteIsSameDevice");
  v43 = -[_TSF_TSDgPTPNetworkPort _isASCapable](self, "_isASCapable");
  v42 = -[_TSF_TSDgPTPNetworkPort _propagationDelay](self, "_propagationDelay");
  v41 = -[_TSF_TSDgPTPNetworkPort _maximumPropagationDelay](self, "_maximumPropagationDelay");
  v39 = -[_TSF_TSDgPTPNetworkPort _minimumPropagationDelay](self, "_minimumPropagationDelay");
  v37 = -[_TSF_TSDgPTPNetworkPort _maximumRawDelay](self, "_maximumRawDelay");
  v35 = -[_TSF_TSDgPTPNetworkPort _minimumRawDelay](self, "_minimumRawDelay");
  v40 = -[_TSF_TSDgPTPNetworkPort _localSyncLogMeanInterval](self, "_localSyncLogMeanInterval");
  v38 = -[_TSF_TSDgPTPNetworkPort _remoteSyncLogMeanInterval](self, "_remoteSyncLogMeanInterval");
  v36 = -[_TSF_TSDgPTPNetworkPort _localAnnounceLogMeanInterval](self, "_localAnnounceLogMeanInterval");
  v34 = -[_TSF_TSDgPTPNetworkPort _remoteAnnounceLogMeanInterval](self, "_remoteAnnounceLogMeanInterval");
  v33 = -[_TSF_TSDgPTPNetworkPort _localLinkType](self, "_localLinkType");
  v32 = -[_TSF_TSDgPTPNetworkPort _remoteLinkType](self, "_remoteLinkType");
  v31 = -[_TSF_TSDgPTPNetworkPort _localTimestampingMode](self, "_localTimestampingMode");
  v30 = -[_TSF_TSDgPTPNetworkPort _remoteTimestampingMode](self, "_remoteTimestampingMode");
  v29 = -[_TSF_TSDgPTPNetworkPort _localOscillatorType](self, "_localOscillatorType");
  v28 = -[_TSF_TSDgPTPNetworkPort _remoteOscillatorType](self, "_remoteOscillatorType");
  v27 = -[_TSF_TSDgPTPNetworkPort _hasLocalFrequencyToleranceLower](self, "_hasLocalFrequencyToleranceLower");
  v20 = -[_TSF_TSDgPTPNetworkPort _localFrequencyToleranceLower](self, "_localFrequencyToleranceLower");
  v26 = -[_TSF_TSDgPTPNetworkPort _hasLocalFrequencyToleranceUpper](self, "_hasLocalFrequencyToleranceUpper");
  v25 = -[_TSF_TSDgPTPNetworkPort _localFrequencyToleranceUpper](self, "_localFrequencyToleranceUpper");
  v24 = -[_TSF_TSDgPTPNetworkPort _hasRemoteFrequencyToleranceLower](self, "_hasRemoteFrequencyToleranceLower");
  v23 = -[_TSF_TSDgPTPNetworkPort _remoteFrequencyToleranceLower](self, "_remoteFrequencyToleranceLower");
  v22 = -[_TSF_TSDgPTPNetworkPort _hasRemoteFrequencyToleranceUpper](self, "_hasRemoteFrequencyToleranceUpper");
  v21 = -[_TSF_TSDgPTPNetworkPort _remoteFrequencyToleranceUpper](self, "_remoteFrequencyToleranceUpper");
  v19 = -[_TSF_TSDgPTPNetworkPort _hasLocalFrequencyStabilityLower](self, "_hasLocalFrequencyStabilityLower");
  v18 = -[_TSF_TSDgPTPNetworkPort _localFrequencyStabilityLower](self, "_localFrequencyStabilityLower");
  v17 = -[_TSF_TSDgPTPNetworkPort _hasLocalFrequencyStabilityUpper](self, "_hasLocalFrequencyStabilityUpper");
  v16 = -[_TSF_TSDgPTPNetworkPort _localFrequencyStabilityUpper](self, "_localFrequencyStabilityUpper");
  v15 = -[_TSF_TSDgPTPNetworkPort _hasRemoteFrequencyStabilityLower](self, "_hasRemoteFrequencyStabilityLower");
  v14 = -[_TSF_TSDgPTPNetworkPort _remoteFrequencyStabilityLower](self, "_remoteFrequencyStabilityLower");
  v3 = -[_TSF_TSDgPTPNetworkPort _hasRemoteFrequencyStabilityUpper](self, "_hasRemoteFrequencyStabilityUpper");
  v4 = -[_TSF_TSDgPTPNetworkPort _remoteFrequencyStabilityUpper](self, "_remoteFrequencyStabilityUpper");
  -[_TSF_TSDgPTPNetworkPort _sourceAddressString](self, "_sourceAddressString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TSF_TSDgPTPNetworkPort _destinationAddressString](self, "_destinationAddressString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_TSF_TSDgPTPNetworkPort _overridenReceiveMatching](self, "_overridenReceiveMatching");
  v8 = -[_TSF_TSDgPTPNetworkPort _overridenReceiveClockIdentity](self, "_overridenReceiveClockIdentity");
  v9 = -[_TSF_TSDgPTPNetworkPort _overridenReceivePortNumber](self, "_overridenReceivePortNumber");
  v10 = -[_TSF_TSDgPTPNetworkPort _enabled](self, "_enabled");
  -[_TSF_TSDgPTPPort propertyUpdateQueue](self, "propertyUpdateQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[4] = self;
  v50 = v46;
  v65 = v45;
  v67 = v44;
  v68 = v43;
  v52 = v42;
  v53 = v41;
  v54 = v39;
  v55 = v37;
  v56 = v35;
  v57 = v20;
  block[0] = MEMORY[0x1E0C809B0];
  block[2] = __43___TSF_TSDgPTPNetworkPort_updateProperties__block_invoke;
  block[3] = &unk_1E694B270;
  block[1] = 3221225472;
  v69 = v40;
  v70 = v38;
  v71 = v36;
  v72 = v34;
  v73 = v33;
  v74 = v32;
  v75 = v31;
  v76 = v30;
  v77 = v29;
  v78 = v28;
  v79 = v27;
  v80 = v26;
  v81 = v24;
  v58 = v25;
  v59 = v23;
  v82 = v22;
  v83 = v19;
  v60 = v21;
  v61 = v18;
  v84 = v17;
  v85 = v15;
  v62 = v16;
  v63 = v14;
  v86 = v3;
  v64 = v4;
  v48 = v5;
  v49 = v6;
  v87 = v7;
  v51 = v8;
  v66 = v9;
  v88 = v10;
  v12 = v6;
  v13 = v5;
  dispatch_async(v11, block);

}

- (_TSF_IODConnection)connection
{
  return self->_connection;
}

- (unint64_t)_remoteClockIdentity
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[_TSF_TSDgPTPPort service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iodPropertyForKey:", CFSTR("RemoteClockIdentity"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "unsignedLongLongValue");
  else
    v4 = 0;

  return v4;
}

- (unsigned)_remotePortNumber
{
  void *v2;
  void *v3;
  unsigned __int16 v4;

  -[_TSF_TSDgPTPPort service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iodPropertyForKey:", CFSTR("RemotePortNumber"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "unsignedShortValue");
  else
    v4 = 0;

  return v4;
}

- (BOOL)_remoteIsSameDevice
{
  void *v2;
  void *v3;
  char v4;

  -[_TSF_TSDgPTPPort service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iodPropertyForKey:", CFSTR("RemoteIsSameDevice"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (BOOL)_isASCapable
{
  void *v2;
  void *v3;
  char v4;

  -[_TSF_TSDgPTPPort service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iodPropertyForKey:", CFSTR("ASCapable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (unsigned)_propagationDelay
{
  void *v2;
  void *v3;
  unsigned int v4;

  -[_TSF_TSDgPTPPort service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iodPropertyForKey:", CFSTR("LinkPropagationDelay"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "unsignedIntValue");
  else
    v4 = 0;

  return v4;
}

- (unsigned)_maximumPropagationDelay
{
  void *v2;
  void *v3;
  unsigned int v4;

  -[_TSF_TSDgPTPPort service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iodPropertyForKey:", CFSTR("MaximumPropagationDelay"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "unsignedIntValue");
  else
    v4 = 0;

  return v4;
}

- (unsigned)_minimumPropagationDelay
{
  void *v2;
  void *v3;
  unsigned int v4;

  -[_TSF_TSDgPTPPort service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iodPropertyForKey:", CFSTR("MinimumPropagationDelay"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "unsignedIntValue");
  else
    v4 = -1;

  return v4;
}

- (unsigned)_propagationDelayLimit
{
  void *v2;
  void *v3;
  unsigned int v4;

  -[_TSF_TSDgPTPPort service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iodPropertyForKey:", CFSTR("PropagationDelayLimit"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "unsignedIntValue");
  else
    v4 = 0;

  return v4;
}

- (unsigned)_maximumRawDelay
{
  void *v2;
  void *v3;
  unsigned int v4;

  -[_TSF_TSDgPTPPort service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iodPropertyForKey:", CFSTR("MaximumRawDelay"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "unsignedIntValue");
  else
    v4 = 0;

  return v4;
}

- (unsigned)_minimumRawDelay
{
  void *v2;
  void *v3;
  unsigned int v4;

  -[_TSF_TSDgPTPPort service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iodPropertyForKey:", CFSTR("MinimumRawDelay"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "unsignedIntValue");
  else
    v4 = -1;

  return v4;
}

- (id)_sourceAddressString
{
  return CFSTR("Unknown");
}

- (id)_destinationAddressString
{
  return CFSTR("Unknown");
}

- (char)_localSyncLogMeanInterval
{
  void *v2;
  void *v3;
  char v4;

  -[_TSF_TSDgPTPPort service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iodPropertyForKey:", CFSTR("LocalSyncLogMeanInterval"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "charValue");
  else
    v4 = 0;

  return v4;
}

- (char)_remoteSyncLogMeanInterval
{
  void *v2;
  void *v3;
  char v4;

  -[_TSF_TSDgPTPPort service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iodPropertyForKey:", CFSTR("RemoteSyncLogMeanInterval"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "charValue");
  else
    v4 = 0;

  return v4;
}

- (char)_localAnnounceLogMeanInterval
{
  void *v2;
  void *v3;
  char v4;

  -[_TSF_TSDgPTPPort service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iodPropertyForKey:", CFSTR("LocalAnnounceLogMeanInterval"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "charValue");
  else
    v4 = 0;

  return v4;
}

- (char)_remoteAnnounceLogMeanInterval
{
  void *v2;
  void *v3;
  char v4;

  -[_TSF_TSDgPTPPort service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iodPropertyForKey:", CFSTR("RemoteAnnounceLogMeanInterval"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "charValue");
  else
    v4 = 0;

  return v4;
}

- (unsigned)_localLinkType
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  -[_TSF_TSDgPTPPort service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iodPropertyForKey:", CFSTR("LocalLinkType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "unsignedCharValue");
  else
    v4 = 0;

  return v4;
}

- (unsigned)_remoteLinkType
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  -[_TSF_TSDgPTPPort service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iodPropertyForKey:", CFSTR("RemoteLinkType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "unsignedCharValue");
  else
    v4 = 0;

  return v4;
}

- (unsigned)_localTimestampingMode
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  -[_TSF_TSDgPTPPort service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iodPropertyForKey:", CFSTR("LocalTimestampingMode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "unsignedCharValue");
  else
    v4 = 0;

  return v4;
}

- (unsigned)_remoteTimestampingMode
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  -[_TSF_TSDgPTPPort service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iodPropertyForKey:", CFSTR("RemoteTimestampingMode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "unsignedCharValue");
  else
    v4 = 0;

  return v4;
}

- (unsigned)_localOscillatorType
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  -[_TSF_TSDgPTPPort service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iodPropertyForKey:", CFSTR("LocalOscillatorType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "unsignedCharValue");
  else
    v4 = 0;

  return v4;
}

- (unsigned)_remoteOscillatorType
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  -[_TSF_TSDgPTPPort service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iodPropertyForKey:", CFSTR("RemoteOscillatorType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "unsignedCharValue");
  else
    v4 = 0;

  return v4;
}

- (BOOL)_hasLocalFrequencyToleranceLower
{
  void *v2;
  void *v3;

  -[_TSF_TSDgPTPPort service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iodPropertyForKey:", CFSTR("LocalFrequencyToleranceLower"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3 != 0;
}

- (int)_localFrequencyToleranceLower
{
  void *v2;
  void *v3;
  int v4;

  -[_TSF_TSDgPTPPort service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iodPropertyForKey:", CFSTR("LocalFrequencyToleranceLower"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "intValue");
  else
    v4 = 0;

  return v4;
}

- (BOOL)_hasLocalFrequencyToleranceUpper
{
  void *v2;
  void *v3;

  -[_TSF_TSDgPTPPort service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iodPropertyForKey:", CFSTR("LocalFrequencyToleranceUpper"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3 != 0;
}

- (int)_localFrequencyToleranceUpper
{
  void *v2;
  void *v3;
  int v4;

  -[_TSF_TSDgPTPPort service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iodPropertyForKey:", CFSTR("LocalFrequencyToleranceUpper"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "intValue");
  else
    v4 = 0;

  return v4;
}

- (BOOL)_hasRemoteFrequencyToleranceLower
{
  void *v2;
  void *v3;

  -[_TSF_TSDgPTPPort service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iodPropertyForKey:", CFSTR("RemoteFrequencyToleranceLower"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3 != 0;
}

- (int)_remoteFrequencyToleranceLower
{
  void *v2;
  void *v3;
  int v4;

  -[_TSF_TSDgPTPPort service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iodPropertyForKey:", CFSTR("RemoteFrequencyToleranceLower"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "intValue");
  else
    v4 = 0;

  return v4;
}

- (BOOL)_hasRemoteFrequencyToleranceUpper
{
  void *v2;
  void *v3;

  -[_TSF_TSDgPTPPort service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iodPropertyForKey:", CFSTR("RemoteFrequencyToleranceUpper"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3 != 0;
}

- (int)_remoteFrequencyToleranceUpper
{
  void *v2;
  void *v3;
  int v4;

  -[_TSF_TSDgPTPPort service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iodPropertyForKey:", CFSTR("RemoteFrequencyToleranceUpper"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "intValue");
  else
    v4 = 0;

  return v4;
}

- (BOOL)_hasLocalFrequencyStabilityLower
{
  void *v2;
  void *v3;

  -[_TSF_TSDgPTPPort service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iodPropertyForKey:", CFSTR("LocalFrequencyStabilityLower"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3 != 0;
}

- (int)_localFrequencyStabilityLower
{
  void *v2;
  void *v3;
  int v4;

  -[_TSF_TSDgPTPPort service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iodPropertyForKey:", CFSTR("LocalFrequencyStabilityLower"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "intValue");
  else
    v4 = 0;

  return v4;
}

- (BOOL)_hasLocalFrequencyStabilityUpper
{
  void *v2;
  void *v3;

  -[_TSF_TSDgPTPPort service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iodPropertyForKey:", CFSTR("LocalFrequencyStabilityUpper"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3 != 0;
}

- (int)_localFrequencyStabilityUpper
{
  void *v2;
  void *v3;
  int v4;

  -[_TSF_TSDgPTPPort service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iodPropertyForKey:", CFSTR("LocalFrequencyStabilityUpper"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "intValue");
  else
    v4 = 0;

  return v4;
}

- (BOOL)_hasRemoteFrequencyStabilityLower
{
  void *v2;
  void *v3;

  -[_TSF_TSDgPTPPort service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iodPropertyForKey:", CFSTR("RemoteFrequencyStabilityLower"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3 != 0;
}

- (int)_remoteFrequencyStabilityLower
{
  void *v2;
  void *v3;
  int v4;

  -[_TSF_TSDgPTPPort service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iodPropertyForKey:", CFSTR("RemoteFrequencyStabilityLower"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "intValue");
  else
    v4 = 0;

  return v4;
}

- (BOOL)_hasRemoteFrequencyStabilityUpper
{
  void *v2;
  void *v3;

  -[_TSF_TSDgPTPPort service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iodPropertyForKey:", CFSTR("RemoteFrequencyStabilityUpper"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3 != 0;
}

- (int)_remoteFrequencyStabilityUpper
{
  void *v2;
  void *v3;
  int v4;

  -[_TSF_TSDgPTPPort service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iodPropertyForKey:", CFSTR("RemoteFrequencyStabilityUpper"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "intValue");
  else
    v4 = 0;

  return v4;
}

- (BOOL)_overridenReceiveMatching
{
  void *v2;
  void *v3;
  char v4;

  -[_TSF_TSDgPTPPort service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iodPropertyForKey:", CFSTR("OverridenReceiveMatching"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (unint64_t)_overridenReceiveClockIdentity
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[_TSF_TSDgPTPPort service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iodPropertyForKey:", CFSTR("OverridenReceiveClockIdentity"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "unsignedLongLongValue");
  else
    v4 = -1;

  return v4;
}

- (unsigned)_overridenReceivePortNumber
{
  void *v2;
  void *v3;
  unsigned __int16 v4;

  -[_TSF_TSDgPTPPort service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iodPropertyForKey:", CFSTR("OverridenReceivePortNumber"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "unsignedShortValue");
  else
    v4 = -1;

  return v4;
}

- (BOOL)_enabled
{
  void *v2;
  void *v3;
  char v4;

  -[_TSF_TSDgPTPPort service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iodPropertyForKey:", CFSTR("PTPPortEnabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (id)_interfaceName
{
  void *v2;
  void *v3;

  -[_TSF_TSDgPTPPort service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iodPropertyForKey:", CFSTR("InterfaceName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)requestRemoteMessageIntervalsWithPDelayMessageInterval:(char)a3 syncMessageInterval:(char)a4 announceMessageInterval:(char)a5 error:(id *)a6
{
  BOOL v6;
  int v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v21[0] = a3;
  v21[1] = a4;
  v21[2] = a5;
  v6 = -[_TSF_IODConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:](self->_connection, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 0, v21, 3, 0, &v8, 0);
  if (!v6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v10 = "result == YES";
    v11 = 2048;
    v12 = 0;
    v13 = 2048;
    v14 = 0;
    v15 = 2080;
    v16 = "";
    v17 = 2080;
    v18 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPPort.m";
    v19 = 1024;
    v20 = 1569;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v6;
}

- (BOOL)overrideReceiveMatchingWithRemoteClockIdentity:(unint64_t)a3 remotePortNumber:(unsigned __int16)a4 error:(id *)a5
{
  BOOL v5;
  int v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v20[0] = a3;
  v20[1] = a4;
  v5 = -[_TSF_IODConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:](self->_connection, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 1, v20, 2, 0, &v7, 0);
  if (!v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v9 = "result == YES";
    v10 = 2048;
    v11 = 0;
    v12 = 2048;
    v13 = 0;
    v14 = 2080;
    v15 = "";
    v16 = 2080;
    v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPPort.m";
    v18 = 1024;
    v19 = 1585;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v5;
}

- (BOOL)restoreReceiveMatchingError:(id *)a3
{
  BOOL v3;
  int v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = 0;
  v3 = -[_TSF_IODConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:](self->_connection, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 2, 0, 0, 0, &v5, 0);
  if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v7 = "result == YES";
    v8 = 2048;
    v9 = 0;
    v10 = 2048;
    v11 = 0;
    v12 = 2080;
    v13 = "";
    v14 = 2080;
    v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPPort.m";
    v16 = 1024;
    v17 = 1597;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v3;
}

- (BOOL)enablePortError:(id *)a3
{
  BOOL v3;
  int v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = 0;
  v3 = -[_TSF_IODConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:](self->_connection, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 3, 0, 0, 0, &v5, 0);
  if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v7 = "result == YES";
    v8 = 2048;
    v9 = 0;
    v10 = 2048;
    v11 = 0;
    v12 = 2080;
    v13 = "";
    v14 = 2080;
    v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPPort.m";
    v16 = 1024;
    v17 = 1609;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v3;
}

- (BOOL)disablePortError:(id *)a3
{
  BOOL v3;
  int v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = 0;
  v3 = -[_TSF_IODConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:](self->_connection, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 4, 0, 0, 0, &v5, 0);
  if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316418;
    v7 = "result == YES";
    v8 = 2048;
    v9 = 0;
    v10 = 2048;
    v11 = 0;
    v12 = 2080;
    v13 = "";
    v14 = 2080;
    v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPPort.m";
    v16 = 1024;
    v17 = 1621;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v3;
}

- (BOOL)getCurrentPortInfo:(id *)a3 error:(id *)a4
{
  NSObject *v6;
  _QWORD v9[6];

  if (a3)
  {
    -[_TSF_TSDgPTPPort propertyUpdateQueue](self, "propertyUpdateQueue", a3, a4);
    v6 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __52___TSF_TSDgPTPNetworkPort_getCurrentPortInfo_error___block_invoke;
    v9[3] = &unk_1E694B1D8;
    v9[4] = self;
    v9[5] = a3;
    dispatch_sync(v6, v9);

  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("TSDErrorDomain"), -536870206, 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return a3 != 0;
}

- (void)_handleRefreshConnection
{
  BOOL v3;
  NSPointerArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_unfair_lock_t lock;
  _QWORD block[6];
  BOOL v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[_TSF_TSDgPTPNetworkPort updateProperties](self, "updateProperties");
  v3 = -[_TSF_TSDgPTPNetworkPort _isASCapable](self, "_isASCapable");
  lock = &self->_clientsLock;
  os_unfair_lock_lock(&self->_clientsLock);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_clients;
  v5 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          -[_TSF_TSDgPTPPort propertyUpdateQueue](self, "propertyUpdateQueue", lock);
          v10 = objc_claimAutoreleasedReturnValue();
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __51___TSF_TSDgPTPNetworkPort__handleRefreshConnection__block_invoke;
          block[3] = &unk_1E694B298;
          v13 = v3;
          block[4] = v9;
          block[5] = self;
          dispatch_async(v10, block);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  os_unfair_lock_unlock(lock);
}

- (void)_handleNotification:(int)a3 withArg1:(unint64_t)a4 arg2:(unint64_t)a5 arg3:(unint64_t)a6 arg4:(unint64_t)a7 arg5:(unint64_t)a8 arg6:(unint64_t)a9
{
  int v10;
  id v11;
  NSObject *v12;
  const char *v13;
  id v14;
  NSPointerArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  os_unfair_lock_t lock;
  NSObject *queue;
  _QWORD block[7];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t v34[128];
  uint8_t buf[4];
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  -[_TSF_TSDgPTPPort propertyUpdateQueue](self, "propertyUpdateQueue");
  queue = objc_claimAutoreleasedReturnValue();
  v10 = a3 - 4000;
  switch(a3)
  {
    case 4000:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        -[_TSF_TSDgPTPNetworkPort description](self, "description");
        v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *(_DWORD *)buf = 136315138;
        v36 = objc_msgSend(v11, "UTF8String");
        v12 = MEMORY[0x1E0C81028];
        v13 = "%s: notification for MAC lookup timeout\n";
        goto LABEL_13;
      }
      break;
    case 4001:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        -[_TSF_TSDgPTPNetworkPort description](self, "description");
        v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *(_DWORD *)buf = 136315138;
        v36 = objc_msgSend(v11, "UTF8String");
        v12 = MEMORY[0x1E0C81028];
        v13 = "%s: notification for sync timeout\n";
        goto LABEL_13;
      }
      break;
    case 4002:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        -[_TSF_TSDgPTPNetworkPort description](self, "description");
        v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *(_DWORD *)buf = 136315138;
        v36 = objc_msgSend(v14, "UTF8String");
        _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: notification for AS capable change\n", buf, 0xCu);

      }
      -[_TSF_TSDgPTPNetworkPort updateProperties](self, "updateProperties");
      break;
    case 4003:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        -[_TSF_TSDgPTPNetworkPort description](self, "description");
        v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *(_DWORD *)buf = 136315138;
        v36 = objc_msgSend(v11, "UTF8String");
        v12 = MEMORY[0x1E0C81028];
        v13 = "%s: notification for admin enable\n";
        goto LABEL_13;
      }
      break;
    case 4004:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        -[_TSF_TSDgPTPNetworkPort description](self, "description");
        v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *(_DWORD *)buf = 136315138;
        v36 = objc_msgSend(v11, "UTF8String");
        v12 = MEMORY[0x1E0C81028];
        v13 = "%s: notification for announce timeout\n";
LABEL_13:
        _os_log_impl(&dword_1B56CB000, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 0xCu);

      }
      break;
    default:
      break;
  }
  lock = &self->_clientsLock;
  os_unfair_lock_lock(&self->_clientsLock);
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v15 = self->_clients;
  v16 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v31 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        switch(v10)
        {
          case 0:
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v20, "didTimeoutOnMACLookupForPort:", self);
            break;
          case 1:
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v20, "didSyncTimeoutForPort:", self);
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v20, "didSyncTimeoutWithMean:median:standardDeviation:minimum:maximum:numberOfSamples:forPort:", a4, a5, a6, a7, a8, a9, self, lock);
            break;
          case 2:
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              block[0] = MEMORY[0x1E0C809B0];
              block[1] = 3221225472;
              block[2] = __81___TSF_TSDgPTPNetworkPort__handleNotification_withArg1_arg2_arg3_arg4_arg5_arg6___block_invoke;
              block[3] = &unk_1E694B2C0;
              block[4] = v20;
              block[5] = self;
              block[6] = a4;
              dispatch_async(queue, block);
            }
            break;
          case 3:
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v20, "didChangeAdministrativeEnable:forPort:", a4 != 0, self);
            break;
          case 4:
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v20, "didAnnounceTimeoutForPort:", self);
            break;
          default:
            continue;
        }
      }
      v17 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v17);
  }

  os_unfair_lock_unlock(lock);
}

- (BOOL)registerAsyncCallbackError:(id *)a3
{
  void *v4;
  void *v5;
  char v6;
  void *v7;

  +[_TSF_TSDCallbackRefconMap sharedTSDCallbackRefconMap](_TSF_TSDCallbackRefconMap, "sharedTSDCallbackRefconMap", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  self->_asyncCallbackRefcon = objc_msgSend(v4, "allocateRefcon:", self);

  -[_TSF_TSDgPTPNetworkPort connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "registerAsyncNotificationsWithSelector:callBack:refcon:callbackQueue:", 5, asyncNotificationsCallback, self->_asyncCallbackRefcon, _sharedNotificationsQueue);

  if ((v6 & 1) == 0)
  {
    +[_TSF_TSDCallbackRefconMap sharedTSDCallbackRefconMap](_TSF_TSDCallbackRefconMap, "sharedTSDCallbackRefconMap");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "releaseRefcon:", self->_asyncCallbackRefcon);

  }
  return v6;
}

- (BOOL)deregisterAsyncCallbackError:(id *)a3
{
  void *v4;
  void *v5;
  char v6;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  +[_TSF_TSDCallbackRefconMap sharedTSDCallbackRefconMap](_TSF_TSDCallbackRefconMap, "sharedTSDCallbackRefconMap", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "releaseRefcon:", self->_asyncCallbackRefcon);

  -[_TSF_TSDgPTPNetworkPort connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "deregisterAsyncNotificationsWithSelector:", 6);

  if ((v6 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136316418;
    v9 = "result == YES";
    v10 = 2048;
    v11 = 0;
    v12 = 2048;
    v13 = 0;
    v14 = 2080;
    v15 = "";
    v16 = 2080;
    v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/clocksyncd/IOKit/TSDgPTPPort.m";
    v18 = 1024;
    v19 = 1809;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v8, 0x3Au);
  }
  return v6;
}

- (void)addClient:(id)a3
{
  id v4;
  NSPointerArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_clientsLock);
  -[NSPointerArray compact](self->_clients, "compact");
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = self->_clients;
  v6 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        if (*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9) == v4)
        {

          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v7)
        continue;
      break;
    }
  }

  -[NSPointerArray addPointer:](self->_clients, "addPointer:", v4, (_QWORD)v10);
LABEL_11:
  os_unfair_lock_unlock(&self->_clientsLock);

}

- (void)removeClient:(id)a3
{
  id v4;
  NSPointerArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_clientsLock);
  -[NSPointerArray compact](self->_clients, "compact");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_clients;
  v6 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v13;
    while (2)
    {
      v10 = 0;
      v11 = v8 + v7;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v5);
        if (*(id *)(*((_QWORD *)&v12 + 1) + 8 * v10) == v4)
        {

          -[NSPointerArray removePointerAtIndex:](self->_clients, "removePointerAtIndex:", v8 + v10, (_QWORD)v12);
          goto LABEL_11;
        }
        ++v10;
      }
      while (v7 != v10);
      v7 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v8 = v11;
      if (v7)
        continue;
      break;
    }
  }

LABEL_11:
  os_unfair_lock_unlock(&self->_clientsLock);

}

- (void)serviceTerminated
{
  NSPointerArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  objc_super v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)_TSF_TSDgPTPNetworkPort;
  -[_TSF_TSDgPTPPort serviceTerminated](&v13, sel_serviceTerminated);
  os_unfair_lock_lock(&self->_clientsLock);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v3 = self->_clients;
  v4 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v7);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v8, "didTerminateServiceForPort:", self, (_QWORD)v9);
        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    }
    while (v5);
  }

  os_unfair_lock_unlock(&self->_clientsLock);
}

- (id)propertiesForXPC
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_TSF_TSDgPTPNetworkPort;
  -[_TSF_TSDgPTPPort propertiesForXPC](&v12, sel_propertiesForXPC);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("OverridenReceiveClockIdentity"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, CFSTR("OverridenReceiveClockIdentity"));

  }
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("OverridenReceivePortNumber"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 0xFFFFLL);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v6, CFSTR("OverridenReceivePortNumber"));

  }
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("MinimumPropagationDelay"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 0xFFFFFFFFLL);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v8, CFSTR("MinimumPropagationDelay"));

  }
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("MinimumRawDelay"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 0xFFFFFFFFLL);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v10, CFSTR("MinimumRawDelay"));

  }
  return v2;
}

+ (id)diagnosticInfoForService:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  objc_super v10;

  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS____TSF_TSDgPTPNetworkPort;
  v3 = a3;
  objc_msgSendSuper2(&v10, sel_diagnosticInfoForService_, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "parentIteratorInServicePlaneWithError:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52___TSF_TSDgPTPNetworkPort_diagnosticInfoForService___block_invoke;
  v8[3] = &unk_1E694B188;
  v6 = v4;
  v9 = v6;
  objc_msgSend(v5, "enumerateWithBlock:", v8);

  return v6;
}

- (unint64_t)remoteClockIdentity
{
  return self->_remoteClockIdentity;
}

- (void)setRemoteClockIdentity:(unint64_t)a3
{
  self->_remoteClockIdentity = a3;
}

- (unsigned)remotePortNumber
{
  return self->_remotePortNumber;
}

- (void)setRemotePortNumber:(unsigned __int16)a3
{
  self->_remotePortNumber = a3;
}

- (BOOL)remoteIsSameDevice
{
  return self->_remoteIsSameDevice;
}

- (void)setRemoteIsSameDevice:(BOOL)a3
{
  self->_remoteIsSameDevice = a3;
}

- (BOOL)isASCapable
{
  return self->_asCapable;
}

- (void)setAsCapable:(BOOL)a3
{
  self->_asCapable = a3;
}

- (unsigned)propagationDelay
{
  return self->_propagationDelay;
}

- (void)setPropagationDelay:(unsigned int)a3
{
  self->_propagationDelay = a3;
}

- (unsigned)maximumPropagationDelay
{
  return self->_maximumPropagationDelay;
}

- (void)setMaximumPropagationDelay:(unsigned int)a3
{
  self->_maximumPropagationDelay = a3;
}

- (unsigned)minimumPropagationDelay
{
  return self->_minimumPropagationDelay;
}

- (void)setMinimumPropagationDelay:(unsigned int)a3
{
  self->_minimumPropagationDelay = a3;
}

- (unsigned)propagationDelayLimit
{
  return self->_propagationDelayLimit;
}

- (void)setPropagationDelayLimit:(unsigned int)a3
{
  self->_propagationDelayLimit = a3;
}

- (unsigned)maximumRawDelay
{
  return self->_maximumRawDelay;
}

- (void)setMaximumRawDelay:(unsigned int)a3
{
  self->_maximumRawDelay = a3;
}

- (unsigned)minimumRawDelay
{
  return self->_minimumRawDelay;
}

- (void)setMinimumRawDelay:(unsigned int)a3
{
  self->_minimumRawDelay = a3;
}

- (char)localSyncLogMeanInterval
{
  return self->_localSyncLogMeanInterval;
}

- (void)setLocalSyncLogMeanInterval:(char)a3
{
  self->_localSyncLogMeanInterval = a3;
}

- (char)remoteSyncLogMeanInterval
{
  return self->_remoteSyncLogMeanInterval;
}

- (void)setRemoteSyncLogMeanInterval:(char)a3
{
  self->_remoteSyncLogMeanInterval = a3;
}

- (char)localAnnounceLogMeanInterval
{
  return self->_localAnnounceLogMeanInterval;
}

- (void)setLocalAnnounceLogMeanInterval:(char)a3
{
  self->_localAnnounceLogMeanInterval = a3;
}

- (char)remoteAnnounceLogMeanInterval
{
  return self->_remoteAnnounceLogMeanInterval;
}

- (void)setRemoteAnnounceLogMeanInterval:(char)a3
{
  self->_remoteAnnounceLogMeanInterval = a3;
}

- (unsigned)localLinkType
{
  return self->_localLinkType;
}

- (void)setLocalLinkType:(unsigned __int8)a3
{
  self->_localLinkType = a3;
}

- (unsigned)remoteLinkType
{
  return self->_remoteLinkType;
}

- (void)setRemoteLinkType:(unsigned __int8)a3
{
  self->_remoteLinkType = a3;
}

- (unsigned)localTimestampingMode
{
  return self->_localTimestampingMode;
}

- (void)setLocalTimestampingMode:(unsigned __int8)a3
{
  self->_localTimestampingMode = a3;
}

- (unsigned)remoteTimestampingMode
{
  return self->_remoteTimestampingMode;
}

- (void)setRemoteTimestampingMode:(unsigned __int8)a3
{
  self->_remoteTimestampingMode = a3;
}

- (unsigned)localOscillatorType
{
  return self->_localOscillatorType;
}

- (void)setLocalOscillatorType:(unsigned __int8)a3
{
  self->_localOscillatorType = a3;
}

- (unsigned)remoteOscillatorType
{
  return self->_remoteOscillatorType;
}

- (void)setRemoteOscillatorType:(unsigned __int8)a3
{
  self->_remoteOscillatorType = a3;
}

- (BOOL)hasLocalFrequencyToleranceLower
{
  return self->_hasLocalFrequencyToleranceLower;
}

- (void)setHasLocalFrequencyToleranceLower:(BOOL)a3
{
  self->_hasLocalFrequencyToleranceLower = a3;
}

- (int)localFrequencyToleranceLower
{
  return self->_localFrequencyToleranceLower;
}

- (void)setLocalFrequencyToleranceLower:(int)a3
{
  self->_localFrequencyToleranceLower = a3;
}

- (BOOL)hasLocalFrequencyToleranceUpper
{
  return self->_hasLocalFrequencyToleranceUpper;
}

- (void)setHasLocalFrequencyToleranceUpper:(BOOL)a3
{
  self->_hasLocalFrequencyToleranceUpper = a3;
}

- (int)localFrequencyToleranceUpper
{
  return self->_localFrequencyToleranceUpper;
}

- (void)setLocalFrequencyToleranceUpper:(int)a3
{
  self->_localFrequencyToleranceUpper = a3;
}

- (BOOL)hasRemoteFrequencyToleranceLower
{
  return self->_hasRemoteFrequencyToleranceLower;
}

- (void)setHasRemoteFrequencyToleranceLower:(BOOL)a3
{
  self->_hasRemoteFrequencyToleranceLower = a3;
}

- (int)remoteFrequencyToleranceLower
{
  return self->_remoteFrequencyToleranceLower;
}

- (void)setRemoteFrequencyToleranceLower:(int)a3
{
  self->_remoteFrequencyToleranceLower = a3;
}

- (BOOL)hasRemoteFrequencyToleranceUpper
{
  return self->_hasRemoteFrequencyToleranceUpper;
}

- (void)setHasRemoteFrequencyToleranceUpper:(BOOL)a3
{
  self->_hasRemoteFrequencyToleranceUpper = a3;
}

- (int)remoteFrequencyToleranceUpper
{
  return self->_remoteFrequencyToleranceUpper;
}

- (void)setRemoteFrequencyToleranceUpper:(int)a3
{
  self->_remoteFrequencyToleranceUpper = a3;
}

- (BOOL)hasLocalFrequencyStabilityLower
{
  return self->_hasLocalFrequencyStabilityLower;
}

- (void)setHasLocalFrequencyStabilityLower:(BOOL)a3
{
  self->_hasLocalFrequencyStabilityLower = a3;
}

- (int)localFrequencyStabilityLower
{
  return self->_localFrequencyStabilityLower;
}

- (void)setLocalFrequencyStabilityLower:(int)a3
{
  self->_localFrequencyStabilityLower = a3;
}

- (BOOL)hasLocalFrequencyStabilityUpper
{
  return self->_hasLocalFrequencyStabilityUpper;
}

- (void)setHasLocalFrequencyStabilityUpper:(BOOL)a3
{
  self->_hasLocalFrequencyStabilityUpper = a3;
}

- (int)localFrequencyStabilityUpper
{
  return self->_localFrequencyStabilityUpper;
}

- (void)setLocalFrequencyStabilityUpper:(int)a3
{
  self->_localFrequencyStabilityUpper = a3;
}

- (BOOL)hasRemoteFrequencyStabilityLower
{
  return self->_hasRemoteFrequencyStabilityLower;
}

- (void)setHasRemoteFrequencyStabilityLower:(BOOL)a3
{
  self->_hasRemoteFrequencyStabilityLower = a3;
}

- (int)remoteFrequencyStabilityLower
{
  return self->_remoteFrequencyStabilityLower;
}

- (void)setRemoteFrequencyStabilityLower:(int)a3
{
  self->_remoteFrequencyStabilityLower = a3;
}

- (BOOL)hasRemoteFrequencyStabilityUpper
{
  return self->_hasRemoteFrequencyStabilityUpper;
}

- (void)setHasRemoteFrequencyStabilityUpper:(BOOL)a3
{
  self->_hasRemoteFrequencyStabilityUpper = a3;
}

- (int)remoteFrequencyStabilityUpper
{
  return self->_remoteFrequencyStabilityUpper;
}

- (void)setRemoteFrequencyStabilityUpper:(int)a3
{
  self->_remoteFrequencyStabilityUpper = a3;
}

- (NSString)sourceAddressString
{
  return self->_sourceAddressString;
}

- (void)setSourceAddressString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (NSString)destinationAddressString
{
  return self->_destinationAddressString;
}

- (void)setDestinationAddressString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (NSString)interfaceName
{
  return self->_interfaceName;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (BOOL)overridenReceiveMatching
{
  return self->_overridenReceiveMatching;
}

- (void)setOverridenReceiveMatching:(BOOL)a3
{
  self->_overridenReceiveMatching = a3;
}

- (unint64_t)overridenReceiveClockIdentity
{
  return self->_overridenReceiveClockIdentity;
}

- (void)setOverridenReceiveClockIdentity:(unint64_t)a3
{
  self->_overridenReceiveClockIdentity = a3;
}

- (unsigned)overridenReceivePortNumber
{
  return self->_overridenReceivePortNumber;
}

- (void)setOverridenReceivePortNumber:(unsigned __int16)a3
{
  self->_overridenReceivePortNumber = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interfaceName, 0);
  objc_storeStrong((id *)&self->_destinationAddressString, 0);
  objc_storeStrong((id *)&self->_sourceAddressString, 0);
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
