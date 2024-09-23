@implementation TSDgPTPNetworkPort

+ (id)iokitMatchingDictionaryForClockIdentifier:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[2];

  v9[0] = CFSTR("IOProviderClass");
  v9[1] = CFSTR("IOPropertyMatch");
  v10[0] = CFSTR("IOTimeSyncNetworkPort");
  v7 = CFSTR("ClockIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
  v8 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v8, &v7, 1));
  v10[1] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 2));

  return v5;
}

- (TSDgPTPNetworkPort)initWithService:(id)a3 pid:(int)a4
{
  uint64_t v4;
  id v6;
  NSPointerArray *v7;
  NSPointerArray *clients;
  TSDgPTPNetworkPort *v9;
  IODConnection *v10;
  IODConnection *connection;
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

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v7 = (NSPointerArray *)objc_claimAutoreleasedReturnValue(+[NSPointerArray weakObjectsPointerArray](NSPointerArray, "weakObjectsPointerArray"));
  clients = self->_clients;
  self->_clients = v7;

  self->_clientsLock._os_unfair_lock_opaque = 0;
  v19.receiver = self;
  v19.super_class = (Class)TSDgPTPNetworkPort;
  v9 = -[TSDgPTPPort initWithService:pid:](&v19, "initWithService:pid:", v6, v4);
  if (v9)
  {
    v10 = -[IODConnection initWithService:andType:]([IODConnection alloc], "initWithService:andType:", v6, 42);
    connection = v9->_connection;
    v9->_connection = v10;

    if (v9->_connection)
    {
      v12 = objc_claimAutoreleasedReturnValue(-[TSDgPTPNetworkPort _interfaceName](v9, "_interfaceName"));
      interfaceName = v9->_interfaceName;
      v9->_interfaceName = (NSString *)v12;

      v9->_remoteClockIdentity = -[TSDgPTPNetworkPort _remoteClockIdentity](v9, "_remoteClockIdentity");
      v9->_remotePortNumber = -[TSDgPTPNetworkPort _remotePortNumber](v9, "_remotePortNumber");
      v9->_remoteIsSameDevice = -[TSDgPTPNetworkPort _remoteIsSameDevice](v9, "_remoteIsSameDevice");
      v9->_asCapable = -[TSDgPTPNetworkPort _isASCapable](v9, "_isASCapable");
      v9->_propagationDelay = -[TSDgPTPNetworkPort _propagationDelay](v9, "_propagationDelay");
      v9->_maximumPropagationDelay = -[TSDgPTPNetworkPort _maximumPropagationDelay](v9, "_maximumPropagationDelay");
      v9->_minimumPropagationDelay = -[TSDgPTPNetworkPort _minimumPropagationDelay](v9, "_minimumPropagationDelay");
      v9->_propagationDelayLimit = -[TSDgPTPNetworkPort _propagationDelayLimit](v9, "_propagationDelayLimit");
      v9->_maximumRawDelay = -[TSDgPTPNetworkPort _maximumRawDelay](v9, "_maximumRawDelay");
      v9->_minimumRawDelay = -[TSDgPTPNetworkPort _minimumRawDelay](v9, "_minimumRawDelay");
      v9->_localSyncLogMeanInterval = -[TSDgPTPNetworkPort _localSyncLogMeanInterval](v9, "_localSyncLogMeanInterval");
      v9->_remoteSyncLogMeanInterval = -[TSDgPTPNetworkPort _remoteSyncLogMeanInterval](v9, "_remoteSyncLogMeanInterval");
      v9->_localAnnounceLogMeanInterval = -[TSDgPTPNetworkPort _localAnnounceLogMeanInterval](v9, "_localAnnounceLogMeanInterval");
      v9->_remoteAnnounceLogMeanInterval = -[TSDgPTPNetworkPort _remoteAnnounceLogMeanInterval](v9, "_remoteAnnounceLogMeanInterval");
      v9->_localLinkType = -[TSDgPTPNetworkPort _localLinkType](v9, "_localLinkType");
      v9->_remoteLinkType = -[TSDgPTPNetworkPort _remoteLinkType](v9, "_remoteLinkType");
      v9->_localTimestampingMode = -[TSDgPTPNetworkPort _localTimestampingMode](v9, "_localTimestampingMode");
      v9->_remoteTimestampingMode = -[TSDgPTPNetworkPort _remoteTimestampingMode](v9, "_remoteTimestampingMode");
      v9->_localOscillatorType = -[TSDgPTPNetworkPort _localOscillatorType](v9, "_localOscillatorType");
      v9->_remoteOscillatorType = -[TSDgPTPNetworkPort _remoteOscillatorType](v9, "_remoteOscillatorType");
      v9->_hasLocalFrequencyToleranceLower = -[TSDgPTPNetworkPort _hasLocalFrequencyToleranceLower](v9, "_hasLocalFrequencyToleranceLower");
      v9->_localFrequencyToleranceLower = -[TSDgPTPNetworkPort _localFrequencyToleranceLower](v9, "_localFrequencyToleranceLower");
      v9->_hasLocalFrequencyToleranceUpper = -[TSDgPTPNetworkPort _hasLocalFrequencyToleranceUpper](v9, "_hasLocalFrequencyToleranceUpper");
      v9->_localFrequencyToleranceUpper = -[TSDgPTPNetworkPort _localFrequencyToleranceUpper](v9, "_localFrequencyToleranceUpper");
      v9->_hasRemoteFrequencyToleranceLower = -[TSDgPTPNetworkPort _hasRemoteFrequencyToleranceLower](v9, "_hasRemoteFrequencyToleranceLower");
      v9->_remoteFrequencyToleranceLower = -[TSDgPTPNetworkPort _remoteFrequencyToleranceLower](v9, "_remoteFrequencyToleranceLower");
      v9->_hasRemoteFrequencyToleranceUpper = -[TSDgPTPNetworkPort _hasRemoteFrequencyToleranceUpper](v9, "_hasRemoteFrequencyToleranceUpper");
      v9->_remoteFrequencyToleranceUpper = -[TSDgPTPNetworkPort _remoteFrequencyToleranceUpper](v9, "_remoteFrequencyToleranceUpper");
      v9->_hasLocalFrequencyStabilityLower = -[TSDgPTPNetworkPort _hasLocalFrequencyStabilityLower](v9, "_hasLocalFrequencyStabilityLower");
      v9->_localFrequencyStabilityLower = -[TSDgPTPNetworkPort _localFrequencyStabilityLower](v9, "_localFrequencyStabilityLower");
      v9->_hasLocalFrequencyStabilityUpper = -[TSDgPTPNetworkPort _hasLocalFrequencyStabilityUpper](v9, "_hasLocalFrequencyStabilityUpper");
      v9->_localFrequencyStabilityUpper = -[TSDgPTPNetworkPort _localFrequencyStabilityUpper](v9, "_localFrequencyStabilityUpper");
      v9->_hasRemoteFrequencyStabilityLower = -[TSDgPTPNetworkPort _hasRemoteFrequencyStabilityLower](v9, "_hasRemoteFrequencyStabilityLower");
      v9->_remoteFrequencyStabilityLower = -[TSDgPTPNetworkPort _remoteFrequencyStabilityLower](v9, "_remoteFrequencyStabilityLower");
      v9->_hasRemoteFrequencyStabilityUpper = -[TSDgPTPNetworkPort _hasRemoteFrequencyStabilityUpper](v9, "_hasRemoteFrequencyStabilityUpper");
      v9->_remoteFrequencyStabilityUpper = -[TSDgPTPNetworkPort _remoteFrequencyStabilityUpper](v9, "_remoteFrequencyStabilityUpper");
      v14 = objc_claimAutoreleasedReturnValue(-[TSDgPTPNetworkPort _sourceAddressString](v9, "_sourceAddressString"));
      sourceAddressString = v9->_sourceAddressString;
      v9->_sourceAddressString = (NSString *)v14;

      v16 = objc_claimAutoreleasedReturnValue(-[TSDgPTPNetworkPort _destinationAddressString](v9, "_destinationAddressString"));
      destinationAddressString = v9->_destinationAddressString;
      v9->_destinationAddressString = (NSString *)v16;

      v9->_overridenReceiveMatching = -[TSDgPTPNetworkPort _overridenReceiveMatching](v9, "_overridenReceiveMatching");
      v9->_overridenReceiveClockIdentity = -[TSDgPTPNetworkPort _overridenReceiveClockIdentity](v9, "_overridenReceiveClockIdentity");
      v9->_overridenReceivePortNumber = -[TSDgPTPNetworkPort _overridenReceivePortNumber](v9, "_overridenReceivePortNumber");
      v9->_enabled = -[TSDgPTPNetworkPort _enabled](v9, "_enabled");
      v9->_asyncCallbackRefcon = 0;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
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
        v29 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPPort.m";
        v30 = 1024;
        v31 = 725;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
      }

      v9 = 0;
    }
  }

  return v9;
}

- (void)updateProperties
{
  unsigned __int8 v3;
  unsigned int v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  unint64_t v8;
  unsigned __int16 v9;
  unsigned __int8 v10;
  NSObject *v11;
  id v12;
  id v13;
  unsigned int v14;
  unsigned __int8 v15;
  unsigned int v16;
  unsigned __int8 v17;
  unsigned int v18;
  unsigned __int8 v19;
  unsigned int v20;
  unsigned int v21;
  unsigned __int8 v22;
  unsigned int v23;
  unsigned __int8 v24;
  unsigned int v25;
  unsigned __int8 v26;
  unsigned __int8 v27;
  unsigned __int8 v28;
  unsigned __int8 v29;
  unsigned __int8 v30;
  unsigned __int8 v31;
  unsigned __int8 v32;
  unsigned __int8 v33;
  unsigned __int8 v34;
  unsigned int v35;
  unsigned __int8 v36;
  unsigned int v37;
  unsigned __int8 v38;
  unsigned int v39;
  unsigned __int8 v40;
  unsigned int v41;
  unsigned int v42;
  unsigned __int8 v43;
  unsigned __int8 v44;
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
  unsigned int v57;
  unsigned int v58;
  unsigned int v59;
  unsigned int v60;
  unsigned int v61;
  unsigned int v62;
  unsigned int v63;
  unsigned int v64;
  unsigned __int16 v65;
  unsigned __int16 v66;
  unsigned __int8 v67;
  unsigned __int8 v68;
  unsigned __int8 v69;
  unsigned __int8 v70;
  unsigned __int8 v71;
  unsigned __int8 v72;
  unsigned __int8 v73;
  unsigned __int8 v74;
  unsigned __int8 v75;
  unsigned __int8 v76;
  unsigned __int8 v77;
  unsigned __int8 v78;
  unsigned __int8 v79;
  unsigned __int8 v80;
  unsigned __int8 v81;
  unsigned __int8 v82;
  unsigned __int8 v83;
  unsigned __int8 v84;
  unsigned __int8 v85;
  unsigned __int8 v86;
  unsigned __int8 v87;
  unsigned __int8 v88;
  objc_super v89;

  v89.receiver = self;
  v89.super_class = (Class)TSDgPTPNetworkPort;
  -[TSDgPTPPort updateProperties](&v89, "updateProperties");
  v46 = -[TSDgPTPNetworkPort _remoteClockIdentity](self, "_remoteClockIdentity");
  v45 = -[TSDgPTPNetworkPort _remotePortNumber](self, "_remotePortNumber");
  v44 = -[TSDgPTPNetworkPort _remoteIsSameDevice](self, "_remoteIsSameDevice");
  v43 = -[TSDgPTPNetworkPort _isASCapable](self, "_isASCapable");
  v42 = -[TSDgPTPNetworkPort _propagationDelay](self, "_propagationDelay");
  v41 = -[TSDgPTPNetworkPort _maximumPropagationDelay](self, "_maximumPropagationDelay");
  v39 = -[TSDgPTPNetworkPort _minimumPropagationDelay](self, "_minimumPropagationDelay");
  v37 = -[TSDgPTPNetworkPort _maximumRawDelay](self, "_maximumRawDelay");
  v35 = -[TSDgPTPNetworkPort _minimumRawDelay](self, "_minimumRawDelay");
  v40 = -[TSDgPTPNetworkPort _localSyncLogMeanInterval](self, "_localSyncLogMeanInterval");
  v38 = -[TSDgPTPNetworkPort _remoteSyncLogMeanInterval](self, "_remoteSyncLogMeanInterval");
  v36 = -[TSDgPTPNetworkPort _localAnnounceLogMeanInterval](self, "_localAnnounceLogMeanInterval");
  v34 = -[TSDgPTPNetworkPort _remoteAnnounceLogMeanInterval](self, "_remoteAnnounceLogMeanInterval");
  v33 = -[TSDgPTPNetworkPort _localLinkType](self, "_localLinkType");
  v32 = -[TSDgPTPNetworkPort _remoteLinkType](self, "_remoteLinkType");
  v31 = -[TSDgPTPNetworkPort _localTimestampingMode](self, "_localTimestampingMode");
  v30 = -[TSDgPTPNetworkPort _remoteTimestampingMode](self, "_remoteTimestampingMode");
  v29 = -[TSDgPTPNetworkPort _localOscillatorType](self, "_localOscillatorType");
  v28 = -[TSDgPTPNetworkPort _remoteOscillatorType](self, "_remoteOscillatorType");
  v27 = -[TSDgPTPNetworkPort _hasLocalFrequencyToleranceLower](self, "_hasLocalFrequencyToleranceLower");
  v20 = -[TSDgPTPNetworkPort _localFrequencyToleranceLower](self, "_localFrequencyToleranceLower");
  v26 = -[TSDgPTPNetworkPort _hasLocalFrequencyToleranceUpper](self, "_hasLocalFrequencyToleranceUpper");
  v25 = -[TSDgPTPNetworkPort _localFrequencyToleranceUpper](self, "_localFrequencyToleranceUpper");
  v24 = -[TSDgPTPNetworkPort _hasRemoteFrequencyToleranceLower](self, "_hasRemoteFrequencyToleranceLower");
  v23 = -[TSDgPTPNetworkPort _remoteFrequencyToleranceLower](self, "_remoteFrequencyToleranceLower");
  v22 = -[TSDgPTPNetworkPort _hasRemoteFrequencyToleranceUpper](self, "_hasRemoteFrequencyToleranceUpper");
  v21 = -[TSDgPTPNetworkPort _remoteFrequencyToleranceUpper](self, "_remoteFrequencyToleranceUpper");
  v19 = -[TSDgPTPNetworkPort _hasLocalFrequencyStabilityLower](self, "_hasLocalFrequencyStabilityLower");
  v18 = -[TSDgPTPNetworkPort _localFrequencyStabilityLower](self, "_localFrequencyStabilityLower");
  v17 = -[TSDgPTPNetworkPort _hasLocalFrequencyStabilityUpper](self, "_hasLocalFrequencyStabilityUpper");
  v16 = -[TSDgPTPNetworkPort _localFrequencyStabilityUpper](self, "_localFrequencyStabilityUpper");
  v15 = -[TSDgPTPNetworkPort _hasRemoteFrequencyStabilityLower](self, "_hasRemoteFrequencyStabilityLower");
  v14 = -[TSDgPTPNetworkPort _remoteFrequencyStabilityLower](self, "_remoteFrequencyStabilityLower");
  v3 = -[TSDgPTPNetworkPort _hasRemoteFrequencyStabilityUpper](self, "_hasRemoteFrequencyStabilityUpper");
  v4 = -[TSDgPTPNetworkPort _remoteFrequencyStabilityUpper](self, "_remoteFrequencyStabilityUpper");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPNetworkPort _sourceAddressString](self, "_sourceAddressString"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPNetworkPort _destinationAddressString](self, "_destinationAddressString"));
  v7 = -[TSDgPTPNetworkPort _overridenReceiveMatching](self, "_overridenReceiveMatching");
  v8 = -[TSDgPTPNetworkPort _overridenReceiveClockIdentity](self, "_overridenReceiveClockIdentity");
  v9 = -[TSDgPTPNetworkPort _overridenReceivePortNumber](self, "_overridenReceivePortNumber");
  v10 = -[TSDgPTPNetworkPort _enabled](self, "_enabled");
  v11 = objc_claimAutoreleasedReturnValue(-[TSDgPTPPort propertyUpdateQueue](self, "propertyUpdateQueue"));
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
  block[0] = _NSConcreteStackBlock;
  block[2] = sub_10000F9E0;
  block[3] = &unk_10003C6C8;
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

- (IODConnection)connection
{
  return self->_connection;
}

- (unint64_t)_remoteClockIdentity
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iodPropertyForKey:", CFSTR("RemoteClockIdentity")));

  if (v3)
    v4 = objc_msgSend(v3, "unsignedLongLongValue");
  else
    v4 = 0;

  return (unint64_t)v4;
}

- (unsigned)_remotePortNumber
{
  void *v2;
  void *v3;
  unsigned __int16 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iodPropertyForKey:", CFSTR("RemotePortNumber")));

  if (v3)
    v4 = (unsigned __int16)objc_msgSend(v3, "unsignedShortValue");
  else
    v4 = 0;

  return v4;
}

- (BOOL)_remoteIsSameDevice
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iodPropertyForKey:", CFSTR("RemoteIsSameDevice")));

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
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iodPropertyForKey:", CFSTR("ASCapable")));

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

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iodPropertyForKey:", CFSTR("LinkPropagationDelay")));

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

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iodPropertyForKey:", CFSTR("MaximumPropagationDelay")));

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

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iodPropertyForKey:", CFSTR("MinimumPropagationDelay")));

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

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iodPropertyForKey:", CFSTR("PropagationDelayLimit")));

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

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iodPropertyForKey:", CFSTR("MaximumRawDelay")));

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

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iodPropertyForKey:", CFSTR("MinimumRawDelay")));

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

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iodPropertyForKey:", CFSTR("LocalSyncLogMeanInterval")));

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

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iodPropertyForKey:", CFSTR("RemoteSyncLogMeanInterval")));

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

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iodPropertyForKey:", CFSTR("LocalAnnounceLogMeanInterval")));

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

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iodPropertyForKey:", CFSTR("RemoteAnnounceLogMeanInterval")));

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

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iodPropertyForKey:", CFSTR("LocalLinkType")));

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

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iodPropertyForKey:", CFSTR("RemoteLinkType")));

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

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iodPropertyForKey:", CFSTR("LocalTimestampingMode")));

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

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iodPropertyForKey:", CFSTR("RemoteTimestampingMode")));

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

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iodPropertyForKey:", CFSTR("LocalOscillatorType")));

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

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iodPropertyForKey:", CFSTR("RemoteOscillatorType")));

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

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iodPropertyForKey:", CFSTR("LocalFrequencyToleranceLower")));

  return v3 != 0;
}

- (int)_localFrequencyToleranceLower
{
  void *v2;
  void *v3;
  int v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iodPropertyForKey:", CFSTR("LocalFrequencyToleranceLower")));

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

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iodPropertyForKey:", CFSTR("LocalFrequencyToleranceUpper")));

  return v3 != 0;
}

- (int)_localFrequencyToleranceUpper
{
  void *v2;
  void *v3;
  int v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iodPropertyForKey:", CFSTR("LocalFrequencyToleranceUpper")));

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

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iodPropertyForKey:", CFSTR("RemoteFrequencyToleranceLower")));

  return v3 != 0;
}

- (int)_remoteFrequencyToleranceLower
{
  void *v2;
  void *v3;
  int v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iodPropertyForKey:", CFSTR("RemoteFrequencyToleranceLower")));

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

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iodPropertyForKey:", CFSTR("RemoteFrequencyToleranceUpper")));

  return v3 != 0;
}

- (int)_remoteFrequencyToleranceUpper
{
  void *v2;
  void *v3;
  int v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iodPropertyForKey:", CFSTR("RemoteFrequencyToleranceUpper")));

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

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iodPropertyForKey:", CFSTR("LocalFrequencyStabilityLower")));

  return v3 != 0;
}

- (int)_localFrequencyStabilityLower
{
  void *v2;
  void *v3;
  int v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iodPropertyForKey:", CFSTR("LocalFrequencyStabilityLower")));

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

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iodPropertyForKey:", CFSTR("LocalFrequencyStabilityUpper")));

  return v3 != 0;
}

- (int)_localFrequencyStabilityUpper
{
  void *v2;
  void *v3;
  int v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iodPropertyForKey:", CFSTR("LocalFrequencyStabilityUpper")));

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

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iodPropertyForKey:", CFSTR("RemoteFrequencyStabilityLower")));

  return v3 != 0;
}

- (int)_remoteFrequencyStabilityLower
{
  void *v2;
  void *v3;
  int v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iodPropertyForKey:", CFSTR("RemoteFrequencyStabilityLower")));

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

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iodPropertyForKey:", CFSTR("RemoteFrequencyStabilityUpper")));

  return v3 != 0;
}

- (int)_remoteFrequencyStabilityUpper
{
  void *v2;
  void *v3;
  int v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iodPropertyForKey:", CFSTR("RemoteFrequencyStabilityUpper")));

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
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iodPropertyForKey:", CFSTR("OverridenReceiveMatching")));

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

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iodPropertyForKey:", CFSTR("OverridenReceiveClockIdentity")));

  if (v3)
    v4 = (unint64_t)objc_msgSend(v3, "unsignedLongLongValue");
  else
    v4 = -1;

  return v4;
}

- (unsigned)_overridenReceivePortNumber
{
  void *v2;
  void *v3;
  unsigned __int16 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iodPropertyForKey:", CFSTR("OverridenReceivePortNumber")));

  if (v3)
    v4 = (unsigned __int16)objc_msgSend(v3, "unsignedShortValue");
  else
    v4 = -1;

  return v4;
}

- (BOOL)_enabled
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iodPropertyForKey:", CFSTR("PTPPortEnabled")));

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

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPPort service](self, "service"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "iodPropertyForKey:", CFSTR("InterfaceName")));

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
  _QWORD v21[3];

  v8 = 0;
  v21[0] = a3;
  v21[1] = a4;
  v21[2] = a5;
  v6 = -[IODConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:](self->_connection, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 0, v21, 3, 0, &v8, 0);
  if (!v6 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
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
    v18 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPPort.m";
    v19 = 1024;
    v20 = 1569;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
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
  _QWORD v20[2];

  v7 = 0;
  v20[0] = a3;
  v20[1] = a4;
  v5 = -[IODConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:](self->_connection, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 1, v20, 2, 0, &v7, 0);
  if (!v5 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
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
    v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPPort.m";
    v18 = 1024;
    v19 = 1585;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
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

  v5 = 0;
  v3 = -[IODConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:](self->_connection, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 2, 0, 0, 0, &v5, 0);
  if (!v3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
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
    v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPPort.m";
    v16 = 1024;
    v17 = 1597;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
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

  v5 = 0;
  v3 = -[IODConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:](self->_connection, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 3, 0, 0, 0, &v5, 0);
  if (!v3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
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
    v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPPort.m";
    v16 = 1024;
    v17 = 1609;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
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

  v5 = 0;
  v3 = -[IODConnection callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:](self->_connection, "callMethodWithSelector:scalarInputs:scalarInputCount:scalarOutputs:scalarOutputCount:error:", 4, 0, 0, 0, &v5, 0);
  if (!v3 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
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
    v15 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPPort.m";
    v16 = 1024;
    v17 = 1621;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
  }
  return v3;
}

- (BOOL)getCurrentPortInfo:(id *)a3 error:(id *)a4
{
  NSObject *v6;
  _QWORD v8[6];

  if (a3)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[TSDgPTPPort propertyUpdateQueue](self, "propertyUpdateQueue", a3, a4));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100011400;
    v8[3] = &unk_10003C6F0;
    v8[4] = self;
    v8[5] = a3;
    dispatch_sync(v6, v8);

  }
  else if (a4)
  {
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("TSDErrorDomain"), -536870206, 0));
  }
  return a3 != 0;
}

- (void)_handleRefreshConnection
{
  unsigned __int8 v3;
  NSPointerArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  NSObject *v10;
  os_unfair_lock_t lock;
  _QWORD block[6];
  unsigned __int8 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  -[TSDgPTPNetworkPort updateProperties](self, "updateProperties");
  v3 = -[TSDgPTPNetworkPort _isASCapable](self, "_isASCapable");
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
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v9, "didChangeASCapable:forPort:") & 1) != 0)
        {
          v10 = objc_claimAutoreleasedReturnValue(-[TSDgPTPPort propertyUpdateQueue](self, "propertyUpdateQueue", lock));
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_100011638;
          block[3] = &unk_10003C718;
          v13 = v3;
          block[4] = v9;
          block[5] = self;
          dispatch_async(v10, block);

        }
      }
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
  const char *v12;
  id v13;
  NSPointerArray *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  os_unfair_lock_t lock;
  NSObject *queue;
  _QWORD block[7];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t v33[128];
  uint8_t buf[4];
  id v35;

  queue = objc_claimAutoreleasedReturnValue(-[TSDgPTPPort propertyUpdateQueue](self, "propertyUpdateQueue"));
  v10 = a3 - 4000;
  switch(a3)
  {
    case 4000:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[TSDgPTPNetworkPort description](self, "description")));
        *(_DWORD *)buf = 136315138;
        v35 = objc_msgSend(v11, "UTF8String");
        v12 = "%s: notification for MAC lookup timeout\n";
        goto LABEL_13;
      }
      break;
    case 4001:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[TSDgPTPNetworkPort description](self, "description")));
        *(_DWORD *)buf = 136315138;
        v35 = objc_msgSend(v11, "UTF8String");
        v12 = "%s: notification for sync timeout\n";
        goto LABEL_13;
      }
      break;
    case 4002:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[TSDgPTPNetworkPort description](self, "description")));
        *(_DWORD *)buf = 136315138;
        v35 = objc_msgSend(v13, "UTF8String");
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%s: notification for AS capable change\n", buf, 0xCu);

      }
      -[TSDgPTPNetworkPort updateProperties](self, "updateProperties");
      break;
    case 4003:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[TSDgPTPNetworkPort description](self, "description")));
        *(_DWORD *)buf = 136315138;
        v35 = objc_msgSend(v11, "UTF8String");
        v12 = "%s: notification for admin enable\n";
        goto LABEL_13;
      }
      break;
    case 4004:
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[TSDgPTPNetworkPort description](self, "description")));
        *(_DWORD *)buf = 136315138;
        v35 = objc_msgSend(v11, "UTF8String");
        v12 = "%s: notification for announce timeout\n";
LABEL_13:
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v12, buf, 0xCu);

      }
      break;
    default:
      break;
  }
  lock = &self->_clientsLock;
  os_unfair_lock_lock(&self->_clientsLock);
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v14 = self->_clients;
  v15 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v30 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
        switch(v10)
        {
          case 0:
            if ((objc_opt_respondsToSelector(*(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i), "didTimeoutOnMACLookupForPort:") & 1) != 0)objc_msgSend(v19, "didTimeoutOnMACLookupForPort:", self);
            break;
          case 1:
            if ((objc_opt_respondsToSelector(*(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i), "didSyncTimeoutForPort:") & 1) != 0)objc_msgSend(v19, "didSyncTimeoutForPort:", self);
            if ((objc_opt_respondsToSelector(v19, "didSyncTimeoutWithMean:median:standardDeviation:minimum:maximum:numberOfSamples:forPort:") & 1) != 0)objc_msgSend(v19, "didSyncTimeoutWithMean:median:standardDeviation:minimum:maximum:numberOfSamples:forPort:", a4, a5, a6, a7, a8, a9, self, lock);
            break;
          case 2:
            if ((objc_opt_respondsToSelector(*(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i), "didChangeASCapable:forPort:") & 1) != 0)
            {
              block[0] = _NSConcreteStackBlock;
              block[1] = 3221225472;
              block[2] = sub_100011B30;
              block[3] = &unk_10003C740;
              block[4] = v19;
              block[5] = self;
              block[6] = a4;
              dispatch_async(queue, block);
            }
            break;
          case 3:
            if ((objc_opt_respondsToSelector(*(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i), "didChangeAdministrativeEnable:forPort:") & 1) != 0)objc_msgSend(v19, "didChangeAdministrativeEnable:forPort:", a4 != 0, self);
            break;
          case 4:
            if ((objc_opt_respondsToSelector(*(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i), "didAnnounceTimeoutForPort:") & 1) != 0)objc_msgSend(v19, "didAnnounceTimeoutForPort:", self);
            break;
          default:
            continue;
        }
      }
      v16 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v16);
  }

  os_unfair_lock_unlock(lock);
}

- (BOOL)registerAsyncCallbackError:(id *)a3
{
  void *v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TSDCallbackRefconMap sharedTSDCallbackRefconMap](TSDCallbackRefconMap, "sharedTSDCallbackRefconMap", a3));
  self->_asyncCallbackRefcon = (unint64_t)objc_msgSend(v4, "allocateRefcon:", self);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPNetworkPort connection](self, "connection"));
  v6 = objc_msgSend(v5, "registerAsyncNotificationsWithSelector:callBack:refcon:callbackQueue:", 5, sub_100008184, self->_asyncCallbackRefcon, qword_100047C38);

  if ((v6 & 1) == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[TSDCallbackRefconMap sharedTSDCallbackRefconMap](TSDCallbackRefconMap, "sharedTSDCallbackRefconMap"));
    objc_msgSend(v7, "releaseRefcon:", self->_asyncCallbackRefcon);

  }
  return v6;
}

- (BOOL)deregisterAsyncCallbackError:(id *)a3
{
  void *v4;
  void *v5;
  unsigned __int8 v6;
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

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TSDCallbackRefconMap sharedTSDCallbackRefconMap](TSDCallbackRefconMap, "sharedTSDCallbackRefconMap", a3));
  objc_msgSend(v4, "releaseRefcon:", self->_asyncCallbackRefcon);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TSDgPTPNetworkPort connection](self, "connection"));
  v6 = objc_msgSend(v5, "deregisterAsyncNotificationsWithSelector:", 6);

  if ((v6 & 1) == 0 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
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
    v17 = "/Library/Caches/com.apple.xbs/Sources/TimeSync_exec/clocksyncd/IOKit/TSDgPTPPort.m";
    v18 = 1024;
    v19 = 1809;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", (uint8_t *)&v8, 0x3Au);
  }
  return v6;
}

- (void)addClient:(id)a3
{
  id v4;
  NSPointerArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

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
        if (*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9) == v4)
        {

          goto LABEL_11;
        }
        v9 = (char *)v9 + 1;
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
  char *v6;
  char *v7;
  char *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  os_unfair_lock_lock(&self->_clientsLock);
  -[NSPointerArray compact](self->_clients, "compact");
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_clients;
  v6 = (char *)-[NSPointerArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v13;
    while (2)
    {
      v10 = 0;
      v11 = &v7[(_QWORD)v8];
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v5);
        if (*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v10) == v4)
        {

          -[NSPointerArray removePointerAtIndex:](self->_clients, "removePointerAtIndex:", &v10[(_QWORD)v8], (_QWORD)v12);
          goto LABEL_11;
        }
        ++v10;
      }
      while (v7 != v10);
      v7 = (char *)-[NSPointerArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
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
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  objc_super v13;
  _BYTE v14[128];

  v13.receiver = self;
  v13.super_class = (Class)TSDgPTPNetworkPort;
  -[TSDgPTPPort serviceTerminated](&v13, "serviceTerminated");
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
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v8, "didTerminateServiceForPort:") & 1) != 0)
          objc_msgSend(v8, "didTerminateServiceForPort:", self, (_QWORD)v9);
      }
      v5 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    }
    while (v5);
  }

  os_unfair_lock_unlock(&self->_clientsLock);
}

- (id)propertiesForXPC
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)TSDgPTPNetworkPort;
  v2 = -[TSDgPTPPort propertiesForXPC](&v13, "propertiesForXPC");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("OverridenReceiveClockIdentity")));

  if (!v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", -1));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("OverridenReceiveClockIdentity"));

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("OverridenReceivePortNumber")));

  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedShort:](NSNumber, "numberWithUnsignedShort:", 0xFFFFLL));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("OverridenReceivePortNumber"));

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MinimumPropagationDelay")));

  if (!v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 0xFFFFFFFFLL));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("MinimumPropagationDelay"));

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MinimumRawDelay")));

  if (!v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 0xFFFFFFFFLL));
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("MinimumRawDelay"));

  }
  return v3;
}

+ (id)diagnosticInfoForService:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  objc_super v11;

  v11.receiver = a1;
  v11.super_class = (Class)&OBJC_METACLASS___TSDgPTPNetworkPort;
  v3 = a3;
  v4 = objc_msgSendSuper2(&v11, "diagnosticInfoForService:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "parentIteratorInServicePlaneWithError:", 0));

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000123B0;
  v9[3] = &unk_10003C768;
  v7 = v5;
  v10 = v7;
  objc_msgSend(v6, "enumerateWithBlock:", v9);

  return v7;
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
