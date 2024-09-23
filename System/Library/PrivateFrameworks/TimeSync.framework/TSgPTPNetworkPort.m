@implementation TSgPTPNetworkPort

- (TSgPTPNetworkPort)initWithImplDC:(id)a3
{
  id v5;
  TSgPTPNetworkPort *v6;
  TSgPTPNetworkPort *v7;
  uint64_t v8;
  objc_super v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316418;
      v12 = "[portImpl isKindOfClass:[TSDgPTPNetworkPort class]]";
      v13 = 2048;
      v14 = 0;
      v15 = 2048;
      v16 = 0;
      v17 = 2080;
      v18 = "";
      v19 = 2080;
      v20 = "/Library/Caches/com.apple.xbs/Sources/TimeSync/TimeSync/API/TSgPTPPort.m";
      v21 = 1024;
      v22 = 919;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Assert: %s (value 0x%lx %lu), %s file: %s, line: %d\n", buf, 0x3Au);
    }
    v7 = 0;
    goto LABEL_4;
  }
  v10.receiver = self;
  v10.super_class = (Class)TSgPTPNetworkPort;
  v6 = -[TSgPTPPort initWithImplDC:](&v10, sel_initWithImplDC_, v5);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_impl, a3);
    v7->_clientLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
    v8 = objc_claimAutoreleasedReturnValue();
    self = (TSgPTPNetworkPort *)v7->_clients;
    v7->_clients = (NSPointerArray *)v8;
LABEL_4:

  }
  return v7;
}

+ (id)keyPathsForValuesAffectingRemoteClockIdentity
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.remoteClockIdentity"), 0);
}

- (unint64_t)remoteClockIdentity
{
  return -[_TSF_TSDgPTPNetworkPort remoteClockIdentity](self->_impl, "remoteClockIdentity");
}

+ (id)keyPathsForValuesAffectingRemotePortNumber
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.remotePortNumber"), 0);
}

- (unsigned)remotePortNumber
{
  return -[_TSF_TSDgPTPNetworkPort remotePortNumber](self->_impl, "remotePortNumber");
}

+ (id)keyPathsForValuesAffectingRemoteIsSameDevice
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.remoteIsSameDevice"), 0);
}

- (BOOL)remoteIsSameDevice
{
  return -[_TSF_TSDgPTPNetworkPort remoteIsSameDevice](self->_impl, "remoteIsSameDevice");
}

+ (id)keyPathsForValuesAffectingAsCapable
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.asCapable"), 0);
}

- (BOOL)isASCapable
{
  return -[_TSF_TSDgPTPNetworkPort isASCapable](self->_impl, "isASCapable");
}

+ (id)keyPathsForValuesAffectingPropagationDelay
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.propagationDelay"), 0);
}

- (unsigned)propagationDelay
{
  return -[_TSF_TSDgPTPNetworkPort propagationDelay](self->_impl, "propagationDelay");
}

+ (id)keyPathsForValuesAffectingMaximumPropagationDelay
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.maximumPropagationDelay"), 0);
}

- (unsigned)maximumPropagationDelay
{
  return -[_TSF_TSDgPTPNetworkPort maximumPropagationDelay](self->_impl, "maximumPropagationDelay");
}

+ (id)keyPathsForValuesAffectingMinimumPropagationDelay
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.minimumPropagationDelay"), 0);
}

- (unsigned)minimumPropagationDelay
{
  return -[_TSF_TSDgPTPNetworkPort minimumPropagationDelay](self->_impl, "minimumPropagationDelay");
}

+ (id)keyPathsForValuesAffectingPropagationDelayLimit
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.propagationDelayLimit"), 0);
}

- (unsigned)propagationDelayLimit
{
  return -[_TSF_TSDgPTPNetworkPort propagationDelayLimit](self->_impl, "propagationDelayLimit");
}

+ (id)keyPathsForValuesAffectingMaximumRawDelay
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.maximumRawDelay"), 0);
}

- (unsigned)maximumRawDelay
{
  return -[_TSF_TSDgPTPNetworkPort maximumRawDelay](self->_impl, "maximumRawDelay");
}

+ (id)keyPathsForValuesAffectingMinimumRawDelay
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.minimumRawDelay"), 0);
}

- (unsigned)minimumRawDelay
{
  return -[_TSF_TSDgPTPNetworkPort minimumRawDelay](self->_impl, "minimumRawDelay");
}

+ (id)keyPathsForValuesAffectingSourceAddressString
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.sourceAddressString"), 0);
}

- (NSString)sourceAddressString
{
  return -[_TSF_TSDgPTPNetworkPort sourceAddressString](self->_impl, "sourceAddressString");
}

+ (id)keyPathsForValuesAffectingDestinationAddressString
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.destinationAddressString"), 0);
}

- (NSString)destinationAddressString
{
  return -[_TSF_TSDgPTPNetworkPort destinationAddressString](self->_impl, "destinationAddressString");
}

+ (id)keyPathsForValuesAffectingLocalSyncLogMeanInterval
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.localSyncLogMeanInterval"), 0);
}

- (char)localSyncLogMeanInterval
{
  return -[_TSF_TSDgPTPNetworkPort localSyncLogMeanInterval](self->_impl, "localSyncLogMeanInterval");
}

+ (id)keyPathsForValuesAffectingRemoteSyncLogMeanInterval
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.remoteSyncLogMeanInterval"), 0);
}

- (char)remoteSyncLogMeanInterval
{
  return -[_TSF_TSDgPTPNetworkPort remoteSyncLogMeanInterval](self->_impl, "remoteSyncLogMeanInterval");
}

+ (id)keyPathsForValuesAffectingLocalAnnounceLogMeanInterval
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.localAnnounceLogMeanInterval"), 0);
}

- (char)localAnnounceLogMeanInterval
{
  return -[_TSF_TSDgPTPNetworkPort localAnnounceLogMeanInterval](self->_impl, "localAnnounceLogMeanInterval");
}

+ (id)keyPathsForValuesAffectingRemoteAnnounceLogMeanInterval
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.remoteAnnounceLogMeanInterval"), 0);
}

- (char)remoteAnnounceLogMeanInterval
{
  return -[_TSF_TSDgPTPNetworkPort remoteAnnounceLogMeanInterval](self->_impl, "remoteAnnounceLogMeanInterval");
}

+ (id)keyPathsForValuesAffectingLocalLinkType
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.localLinkType"), 0);
}

- (unsigned)localLinkType
{
  return -[_TSF_TSDgPTPNetworkPort localLinkType](self->_impl, "localLinkType");
}

+ (id)keyPathsForValuesAffectingRemoteLinkType
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.remoteLinkType"), 0);
}

- (unsigned)remoteLinkType
{
  return -[_TSF_TSDgPTPNetworkPort remoteLinkType](self->_impl, "remoteLinkType");
}

+ (id)keyPathsForValuesAffectingLocalTimestampingMode
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.localTimestampingMode"), 0);
}

- (unsigned)localTimestampingMode
{
  return -[_TSF_TSDgPTPNetworkPort localTimestampingMode](self->_impl, "localTimestampingMode");
}

+ (id)keyPathsForValuesAffectingRemoteTimestampingMode
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.remoteTimestampingMode"), 0);
}

- (unsigned)remoteTimestampingMode
{
  return -[_TSF_TSDgPTPNetworkPort remoteTimestampingMode](self->_impl, "remoteTimestampingMode");
}

+ (id)keyPathsForValuesAffectingLocalOscillatorType
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.localOscillatorType"), 0);
}

- (unsigned)localOscillatorType
{
  return -[_TSF_TSDgPTPNetworkPort localOscillatorType](self->_impl, "localOscillatorType");
}

+ (id)keyPathsForValuesAffectingRemoteOscillatorType
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.remoteOscillatorType"), 0);
}

- (unsigned)remoteOscillatorType
{
  return -[_TSF_TSDgPTPNetworkPort remoteOscillatorType](self->_impl, "remoteOscillatorType");
}

+ (id)keyPathsForValuesAffectingHasLocalFrequencyToleranceLower
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.hasLocalFrequencyToleranceUpper"), 0);
}

- (BOOL)hasLocalFrequencyToleranceLower
{
  return -[_TSF_TSDgPTPNetworkPort hasLocalFrequencyToleranceLower](self->_impl, "hasLocalFrequencyToleranceLower");
}

+ (id)keyPathsForValuesAffectingLocalFrequencyToleranceLower
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.localFrequencyToleranceLower"), 0);
}

- (int)localFrequencyToleranceLower
{
  return -[_TSF_TSDgPTPNetworkPort localFrequencyToleranceLower](self->_impl, "localFrequencyToleranceLower");
}

+ (id)keyPathsForValuesAffectingHasLocalFrequencyToleranceUpper
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.hasLocalFrequencyToleranceUpper"), 0);
}

- (BOOL)hasLocalFrequencyToleranceUpper
{
  return -[_TSF_TSDgPTPNetworkPort hasLocalFrequencyToleranceUpper](self->_impl, "hasLocalFrequencyToleranceUpper");
}

+ (id)keyPathsForValuesAffectingLocalFrequencyToleranceUpper
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.localFrequencyToleranceUpper"), 0);
}

- (int)localFrequencyToleranceUpper
{
  return -[_TSF_TSDgPTPNetworkPort localFrequencyToleranceUpper](self->_impl, "localFrequencyToleranceUpper");
}

+ (id)keyPathsForValuesAffectingHasRemoteFrequencyToleranceLower
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.hasRemoteFrequencyToleranceLower"), 0);
}

- (BOOL)hasRemoteFrequencyToleranceLower
{
  return -[_TSF_TSDgPTPNetworkPort hasRemoteFrequencyToleranceLower](self->_impl, "hasRemoteFrequencyToleranceLower");
}

+ (id)keyPathsForValuesAffectingRemoteFrequencyToleranceLower
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.remoteFrequencyToleranceLower"), 0);
}

- (int)remoteFrequencyToleranceLower
{
  return -[_TSF_TSDgPTPNetworkPort remoteFrequencyToleranceLower](self->_impl, "remoteFrequencyToleranceLower");
}

+ (id)keyPathsForValuesAffectingHasRemoteFrequencyToleranceUpper
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.hasRemoteFrequencyToleranceUpper"), 0);
}

- (BOOL)hasRemoteFrequencyToleranceUpper
{
  return -[_TSF_TSDgPTPNetworkPort hasRemoteFrequencyToleranceUpper](self->_impl, "hasRemoteFrequencyToleranceUpper");
}

+ (id)keyPathsForValuesAffectingRemoteFrequencyToleranceUpper
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.remoteFrequencyToleranceUpper"), 0);
}

- (int)remoteFrequencyToleranceUpper
{
  return -[_TSF_TSDgPTPNetworkPort remoteFrequencyToleranceUpper](self->_impl, "remoteFrequencyToleranceUpper");
}

+ (id)keyPathsForValuesAffectingHasLocalFrequencyStabilityLower
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.hasLocalFrequencyStabilityLower"), 0);
}

- (BOOL)hasLocalFrequencyStabilityLower
{
  return -[_TSF_TSDgPTPNetworkPort hasLocalFrequencyStabilityLower](self->_impl, "hasLocalFrequencyStabilityLower");
}

+ (id)keyPathsForValuesAffectingLocalFrequencyStabilityLower
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.localFrequencyStabilityLower"), 0);
}

- (int)localFrequencyStabilityLower
{
  return -[_TSF_TSDgPTPNetworkPort localFrequencyStabilityLower](self->_impl, "localFrequencyStabilityLower");
}

+ (id)keyPathsForValuesAffectingHasLocalFrequencyStabilityUpper
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.hasLocalFrequencyStabilityUpper"), 0);
}

- (BOOL)hasLocalFrequencyStabilityUpper
{
  return -[_TSF_TSDgPTPNetworkPort hasLocalFrequencyStabilityUpper](self->_impl, "hasLocalFrequencyStabilityUpper");
}

+ (id)keyPathsForValuesAffectingLocalFrequencyStabilityUpper
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.localFrequencyStabilityUpper"), 0);
}

- (int)localFrequencyStabilityUpper
{
  return -[_TSF_TSDgPTPNetworkPort localFrequencyStabilityUpper](self->_impl, "localFrequencyStabilityUpper");
}

+ (id)keyPathsForValuesAffectingHasRemoteFrequencyStabilityLower
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.hasRemoteFrequencyStabilityLower"), 0);
}

- (BOOL)hasRemoteFrequencyStabilityLower
{
  return -[_TSF_TSDgPTPNetworkPort hasRemoteFrequencyStabilityLower](self->_impl, "hasRemoteFrequencyStabilityLower");
}

+ (id)keyPathsForValuesAffectingRemoteFrequencyStabilityLower
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.remoteFrequencyStabilityLower"), 0);
}

- (int)remoteFrequencyStabilityLower
{
  return -[_TSF_TSDgPTPNetworkPort remoteFrequencyStabilityLower](self->_impl, "remoteFrequencyStabilityLower");
}

+ (id)keyPathsForValuesAffectingHasRemoteFrequencyStabilityUpper
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.hasRemoteFrequencyStabilityUpper"), 0);
}

- (BOOL)hasRemoteFrequencyStabilityUpper
{
  return -[_TSF_TSDgPTPNetworkPort hasRemoteFrequencyStabilityUpper](self->_impl, "hasRemoteFrequencyStabilityUpper");
}

+ (id)keyPathsForValuesAffectingRemoteFrequencyStabilityUpper
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.remoteFrequencyStabilityUpper"), 0);
}

- (int)remoteFrequencyStabilityUpper
{
  return -[_TSF_TSDgPTPNetworkPort remoteFrequencyStabilityUpper](self->_impl, "remoteFrequencyStabilityUpper");
}

+ (id)keyPathsForValuesAffectingOverridenReceiveMatching
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.overridenReceiveMatching"), 0);
}

- (BOOL)overridenReceiveMatching
{
  return -[_TSF_TSDgPTPNetworkPort overridenReceiveMatching](self->_impl, "overridenReceiveMatching");
}

+ (id)keyPathsForValuesAffectingOverridenReceiveClockIdentity
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.overridenReceiveClockIdentity"), 0);
}

- (unint64_t)overridenReceiveClockIdentity
{
  return -[_TSF_TSDgPTPNetworkPort overridenReceiveClockIdentity](self->_impl, "overridenReceiveClockIdentity");
}

+ (id)keyPathsForValuesAffectingOverridenReceivePortNumber
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.overridenReceivePortNumber"), 0);
}

- (unsigned)overridenReceivePortNumber
{
  return -[_TSF_TSDgPTPNetworkPort overridenReceivePortNumber](self->_impl, "overridenReceivePortNumber");
}

+ (id)keyPathsForValuesAffectingInterfaceName
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.interfaceName"), 0);
}

- (NSString)interfaceName
{
  return -[_TSF_TSDgPTPNetworkPort interfaceName](self->_impl, "interfaceName");
}

+ (id)keyPathsForValuesAffectingEnabled
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("_impl.enabled"), 0);
}

- (BOOL)enabled
{
  return -[_TSF_TSDgPTPNetworkPort enabled](self->_impl, "enabled");
}

- (BOOL)requestRemoteMessageIntervalsWithPDelayMessageInterval:(char)a3 syncMessageInterval:(char)a4 announceMessageInterval:(char)a5 error:(id *)a6
{
  return -[_TSF_TSDgPTPNetworkPort requestRemoteMessageIntervalsWithPDelayMessageInterval:syncMessageInterval:announceMessageInterval:error:](self->_impl, "requestRemoteMessageIntervalsWithPDelayMessageInterval:syncMessageInterval:announceMessageInterval:error:", a3, a4, a5, a6);
}

- (BOOL)overrideReceiveMatchingWithRemoteClockIdentity:(unint64_t)a3 remotePortNumber:(unsigned __int16)a4 error:(id *)a5
{
  return -[_TSF_TSDgPTPNetworkPort overrideReceiveMatchingWithRemoteClockIdentity:remotePortNumber:error:](self->_impl, "overrideReceiveMatchingWithRemoteClockIdentity:remotePortNumber:error:", a3, a4, a5);
}

- (BOOL)restoreReceiveMatchingError:(id *)a3
{
  return -[_TSF_TSDgPTPNetworkPort restoreReceiveMatchingError:](self->_impl, "restoreReceiveMatchingError:", a3);
}

- (BOOL)enablePortError:(id *)a3
{
  return -[_TSF_TSDgPTPNetworkPort enablePortError:](self->_impl, "enablePortError:", a3);
}

- (BOOL)disablePortError:(id *)a3
{
  return -[_TSF_TSDgPTPNetworkPort disablePortError:](self->_impl, "disablePortError:", a3);
}

- (BOOL)getCurrentPortInfo:(id *)a3 error:(id *)a4
{
  return -[_TSF_TSDgPTPNetworkPort getCurrentPortInfo:error:](self->_impl, "getCurrentPortInfo:error:", a3, a4);
}

- (BOOL)registerAsyncCallbackError:(id *)a3
{
  return -[_TSF_TSDgPTPNetworkPort registerAsyncCallbackError:](self->_impl, "registerAsyncCallbackError:", a3);
}

- (BOOL)deregisterAsyncCallbackError:(id *)a3
{
  return -[_TSF_TSDgPTPNetworkPort deregisterAsyncCallbackError:](self->_impl, "deregisterAsyncCallbackError:", a3);
}

- (void)addClient:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  NSPointerArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "description");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = objc_msgSend(v5, "UTF8String");
    -[TSgPTPNetworkPort description](self, "description");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 136315394;
    v19 = v6;
    v20 = 2080;
    v21 = objc_msgSend(v7, "UTF8String");
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Adding Client %s to port %s\n", buf, 0x16u);

  }
  os_unfair_lock_lock(&self->_clientLock);
  -[NSPointerArray compact](self->_clients, "compact");
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = self->_clients;
  v9 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    while (2)
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        if (*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12) == v4)
        {

          goto LABEL_14;
        }
        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v10)
        continue;
      break;
    }
  }

  -[NSPointerArray addPointer:](self->_clients, "addPointer:", v4, (_QWORD)v13);
  if (-[NSPointerArray count](self->_clients, "count") == 1)
    -[_TSF_TSDgPTPNetworkPort addClient:](self->_impl, "addClient:", self);
LABEL_14:
  os_unfair_lock_unlock(&self->_clientLock);

}

- (void)removeClient:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  NSPointerArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "description");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = objc_msgSend(v5, "UTF8String");
    -[TSgPTPNetworkPort description](self, "description");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 136315394;
    v21 = v6;
    v22 = 2080;
    v23 = objc_msgSend(v7, "UTF8String");
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Removing Client %s from port %s\n", buf, 0x16u);

  }
  os_unfair_lock_lock(&self->_clientLock);
  -[NSPointerArray compact](self->_clients, "compact");
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v8 = self->_clients;
  v9 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v16;
    while (2)
    {
      v13 = 0;
      v14 = v11 + v10;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v8);
        if (*(id *)(*((_QWORD *)&v15 + 1) + 8 * v13) == v4)
        {

          -[NSPointerArray removePointerAtIndex:](self->_clients, "removePointerAtIndex:", v11 + v13, (_QWORD)v15);
          goto LABEL_13;
        }
        ++v13;
      }
      while (v10 != v13);
      v10 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      v11 = v14;
      if (v10)
        continue;
      break;
    }
  }

LABEL_13:
  if (!-[NSPointerArray count](self->_clients, "count", (_QWORD)v15))
    -[_TSF_TSDgPTPNetworkPort removeClient:](self->_impl, "removeClient:", self);
  os_unfair_lock_unlock(&self->_clientLock);

}

- (void)didChangeASCapable:(BOOL)a3 forPort:(id)a4
{
  _BOOL8 v4;
  os_unfair_lock_s *p_clientLock;
  objc_class *v7;
  void *v8;
  unint64_t v9;
  int v10;
  const __CFString *v11;
  NSPointerArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  unint64_t v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const __CFString *v30;
  uint64_t v31;

  v4 = a3;
  v31 = *MEMORY[0x1E0C80C00];
  p_clientLock = &self->_clientLock;
  os_unfair_lock_lock(&self->_clientLock);
  -[NSPointerArray compact](self->_clients, "compact");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[TSgPTPPort clockIdentifier](self, "clockIdentifier");
    v10 = -[TSgPTPPort portNumber](self, "portNumber");
    v11 = CFSTR("NO");
    *(_DWORD *)buf = 138413058;
    v25 = 2048;
    v24 = v8;
    if (v4)
      v11 = CFSTR("YES");
    v26 = v9;
    v27 = 1024;
    v28 = v10;
    v29 = 2112;
    v30 = v11;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TSgPTPNetworkPort(%@,%016llx.%hu): changedASCapable:%@", buf, 0x26u);

  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v12 = self->_clients;
  v13 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v16);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v17, "didChangeASCapable:forPort:", v4, self, (_QWORD)v18);
        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v14);
  }

  os_unfair_lock_unlock(p_clientLock);
}

- (void)didChangeAdministrativeEnable:(BOOL)a3 forPort:(id)a4
{
  _BOOL8 v4;
  os_unfair_lock_s *p_clientLock;
  objc_class *v7;
  void *v8;
  unint64_t v9;
  int v10;
  const __CFString *v11;
  NSPointerArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  unint64_t v26;
  __int16 v27;
  int v28;
  __int16 v29;
  const __CFString *v30;
  uint64_t v31;

  v4 = a3;
  v31 = *MEMORY[0x1E0C80C00];
  p_clientLock = &self->_clientLock;
  os_unfair_lock_lock(&self->_clientLock);
  -[NSPointerArray compact](self->_clients, "compact");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[TSgPTPPort clockIdentifier](self, "clockIdentifier");
    v10 = -[TSgPTPPort portNumber](self, "portNumber");
    v11 = CFSTR("NO");
    *(_DWORD *)buf = 138413058;
    v25 = 2048;
    v24 = v8;
    if (v4)
      v11 = CFSTR("YES");
    v26 = v9;
    v27 = 1024;
    v28 = v10;
    v29 = 2112;
    v30 = v11;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TSgPTPNetworkPort(%@,%016llx.%hu): changedAdministrativeEnable:%@", buf, 0x26u);

  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v12 = self->_clients;
  v13 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v16);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v17, "didChangeAdministrativeEnable:forPort:", v4, self, (_QWORD)v18);
        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v14);
  }

  os_unfair_lock_unlock(p_clientLock);
}

- (void)didTimeoutOnMACLookupForPort:(id)a3
{
  os_unfair_lock_s *p_clientLock;
  objc_class *v5;
  void *v6;
  NSPointerArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  unint64_t v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  p_clientLock = &self->_clientLock;
  os_unfair_lock_lock(&self->_clientLock);
  -[NSPointerArray compact](self->_clients, "compact");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v19 = v6;
    v20 = 2048;
    v21 = -[TSgPTPPort clockIdentifier](self, "clockIdentifier");
    v22 = 1024;
    v23 = -[TSgPTPPort portNumber](self, "portNumber");
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TSgPTPNetworkPort(%@,%016llx.%hu): timedoutMACLookup", buf, 0x1Cu);

  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = self->_clients;
  v8 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "didTimeoutOnMACLookupForPort:", self, (_QWORD)v13);
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  os_unfair_lock_unlock(p_clientLock);
}

- (void)didAnnounceTimeoutForPort:(id)a3
{
  os_unfair_lock_s *p_clientLock;
  objc_class *v5;
  void *v6;
  NSPointerArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  unint64_t v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  p_clientLock = &self->_clientLock;
  os_unfair_lock_lock(&self->_clientLock);
  -[NSPointerArray compact](self->_clients, "compact");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v19 = v6;
    v20 = 2048;
    v21 = -[TSgPTPPort clockIdentifier](self, "clockIdentifier");
    v22 = 1024;
    v23 = -[TSgPTPPort portNumber](self, "portNumber");
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TSgPTPNetworkPort(%@,%016llx.%hu): announceTimeout", buf, 0x1Cu);

  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = self->_clients;
  v8 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "didAnnounceTimeoutForPort:", self, (_QWORD)v13);
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  os_unfair_lock_unlock(p_clientLock);
}

- (void)didSyncTimeoutForPort:(id)a3
{
  os_unfair_lock_s *p_clientLock;
  objc_class *v5;
  void *v6;
  NSPointerArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  unint64_t v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  p_clientLock = &self->_clientLock;
  os_unfair_lock_lock(&self->_clientLock);
  -[NSPointerArray compact](self->_clients, "compact");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v19 = v6;
    v20 = 2048;
    v21 = -[TSgPTPPort clockIdentifier](self, "clockIdentifier");
    v22 = 1024;
    v23 = -[TSgPTPPort portNumber](self, "portNumber");
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TSgPTPNetworkPort(%@,%016llx.%hu): syncTimeout", buf, 0x1Cu);

  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = self->_clients;
  v8 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "didSyncTimeoutForPort:", self, (_QWORD)v13);
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  os_unfair_lock_unlock(p_clientLock);
}

- (void)didSyncTimeoutWithMean:(int64_t)a3 median:(int64_t)a4 standardDeviation:(unint64_t)a5 minimum:(int64_t)a6 maximum:(int64_t)a7 numberOfSamples:(unsigned int)a8 forPort:(id)a9
{
  objc_class *v13;
  void *v14;
  NSPointerArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  os_unfair_lock_t lock;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  unint64_t v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int64_t v37;
  __int16 v38;
  int64_t v39;
  __int16 v40;
  unint64_t v41;
  __int16 v42;
  int64_t v43;
  __int16 v44;
  int64_t v45;
  __int16 v46;
  unsigned int v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  lock = &self->_clientLock;
  os_unfair_lock_lock(&self->_clientLock);
  -[NSPointerArray compact](self->_clients, "compact");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138414338;
    v31 = v14;
    v32 = 2048;
    v33 = -[TSgPTPPort clockIdentifier](self, "clockIdentifier");
    v34 = 1024;
    v35 = -[TSgPTPPort portNumber](self, "portNumber");
    v36 = 2048;
    v37 = a3;
    v38 = 2048;
    v39 = a4;
    v40 = 2048;
    v41 = a5;
    v42 = 2048;
    v43 = a6;
    v44 = 2048;
    v45 = a7;
    v46 = 1024;
    v47 = a8;
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TSgPTPNetworkPort(%@,%016llx.%hu): syncTimeoutWithMean:%lld median:%lld standardDeviation:%llu minimum:%lld maximum:%lld numberOfSamples:%u", buf, 0x54u);

  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v15 = self->_clients;
  v16 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v26;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v26 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v19);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v20, "didSyncTimeoutWithMean:median:standardDeviation:minimum:maximum:numberOfSamples:forPort:", a3, a4, a5, a6, a7, a8, self);
        ++v19;
      }
      while (v17 != v19);
      v17 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v17);
  }

  os_unfair_lock_unlock(lock);
}

- (void)didTerminateServiceForPort:(id)a3
{
  os_unfair_lock_s *p_clientLock;
  objc_class *v5;
  void *v6;
  NSPointerArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  unint64_t v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  p_clientLock = &self->_clientLock;
  os_unfair_lock_lock(&self->_clientLock);
  -[NSPointerArray compact](self->_clients, "compact");
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v19 = v6;
    v20 = 2048;
    v21 = -[TSgPTPPort clockIdentifier](self, "clockIdentifier");
    v22 = 1024;
    v23 = -[TSgPTPPort portNumber](self, "portNumber");
    _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TSgPTPNetworkPort(%@,%016llx.%hu): terminatedService", buf, 0x1Cu);

  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = self->_clients;
  v8 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "didTerminateServiceForPort:", self, (_QWORD)v13);
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSPointerArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  os_unfair_lock_unlock(p_clientLock);
  -[TSgPTPPort serviceTerminated](self, "serviceTerminated");
}

+ (id)diagnosticDescriptionForInfo:(id)a3 withIndent:(id)a4
{
  id v6;
  id v7;
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
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  const __CFString *v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  const __CFString *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  const __CFString *v56;
  id v57;
  objc_super v59;

  v6 = a3;
  v7 = a4;
  v59.receiver = a1;
  v59.super_class = (Class)&OBJC_METACLASS___TSgPTPNetworkPort;
  objc_msgSendSuper2(&v59, sel_diagnosticDescriptionForInfo_withIndent_, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("InterfaceName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "appendFormat:", CFSTR("%@    Interface: "), v7);
  if (v9)
    objc_msgSend(v8, "appendFormat:", CFSTR("%@\n"), v9);
  else
    objc_msgSend(v8, "appendString:", CFSTR("Could not read property\n"));
  objc_msgSend(v8, "appendFormat:", CFSTR("%@    Source Address: "), v7);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("SourceAddress"));
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    objc_msgSend(v8, "appendFormat:", CFSTR("%@\n"), v10);
  else
    objc_msgSend(v8, "appendString:", CFSTR("Could not read property\n"));
  objc_msgSend(v8, "appendFormat:", CFSTR("%@    Destination Address: "), v7);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("DestinationAddress"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    objc_msgSend(v8, "appendFormat:", CFSTR("%@\n"), v12);
  else
    objc_msgSend(v8, "appendString:", CFSTR("Could not read property\n"));
  objc_msgSend(v8, "appendFormat:", CFSTR("%@    Announce Clock Priority 1: "), v7);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ClockPriority1"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
    objc_msgSend(v8, "appendFormat:", CFSTR("%hhu\n"), objc_msgSend(v13, "unsignedCharValue"));
  else
    objc_msgSend(v8, "appendString:", CFSTR("Could not read property\n"));
  objc_msgSend(v8, "appendFormat:", CFSTR("%@    Announce Clock Class: "), v7);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ClockClass"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    objc_msgSend(v8, "appendFormat:", CFSTR("%hhu\n"), objc_msgSend(v15, "unsignedCharValue"));
  else
    objc_msgSend(v8, "appendString:", CFSTR("Could not read property\n"));
  objc_msgSend(v8, "appendFormat:", CFSTR("%@    Announce Clock Accuracy: "), v7);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ClockAccuracy"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    objc_msgSend(v8, "appendFormat:", CFSTR("%hhu\n"), objc_msgSend(v16, "unsignedCharValue"));
  else
    objc_msgSend(v8, "appendString:", CFSTR("Could not read property\n"));
  objc_msgSend(v8, "appendFormat:", CFSTR("%@    Announce Offset Scaled Log Variance: "), v7);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("OffsetScaledLogVariance"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    objc_msgSend(v8, "appendFormat:", CFSTR("%hu\n"), objc_msgSend(v17, "unsignedShortValue"));
  else
    objc_msgSend(v8, "appendString:", CFSTR("Could not read property\n"));
  objc_msgSend(v8, "appendFormat:", CFSTR("%@    Announce Clock Priority 2: "), v7);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ClockPriority2"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
    objc_msgSend(v8, "appendFormat:", CFSTR("%hhu\n"), objc_msgSend(v18, "unsignedCharValue"));
  else
    objc_msgSend(v8, "appendString:", CFSTR("Could not read property\n"));
  objc_msgSend(v8, "appendFormat:", CFSTR("%@    Announce Grandmaster Identity: "), v7);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("GrandmasterID"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
    objc_msgSend(v8, "appendFormat:", CFSTR("%016llx\n"), objc_msgSend(v19, "unsignedLongLongValue"));
  else
    objc_msgSend(v8, "appendString:", CFSTR("Could not read property\n"));
  objc_msgSend(v8, "appendFormat:", CFSTR("%@    Announce Steps Removed: "), v7);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("StepsRemoved"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
    objc_msgSend(v8, "appendFormat:", CFSTR("%hu\n"), objc_msgSend(v20, "unsignedShortValue"));
  else
    objc_msgSend(v8, "appendString:", CFSTR("Could not read property\n"));
  objc_msgSend(v8, "appendFormat:", CFSTR("%@    Announce Time Source: "), v7);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("TimeSource"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
    objc_msgSend(v8, "appendFormat:", CFSTR("%hhu\n"), objc_msgSend(v21, "unsignedCharValue"));
  else
    objc_msgSend(v8, "appendString:", CFSTR("Could not read property\n"));
  objc_msgSend(v8, "appendFormat:", CFSTR("%@    Received Clock Priority 1: "), v7);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ReceivedClockPriority1"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
    objc_msgSend(v8, "appendFormat:", CFSTR("%hhu\n"), objc_msgSend(v22, "unsignedCharValue"));
  else
    objc_msgSend(v8, "appendString:", CFSTR("Could not read property\n"));
  objc_msgSend(v8, "appendFormat:", CFSTR("%@    Received Clock Class: "), v7);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ReceivedClockClass"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
    objc_msgSend(v8, "appendFormat:", CFSTR("%hhu\n"), objc_msgSend(v23, "unsignedCharValue"));
  else
    objc_msgSend(v8, "appendString:", CFSTR("Could not read property\n"));
  objc_msgSend(v8, "appendFormat:", CFSTR("%@    Received Clock Accuracy: "), v7);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ReceivedClockAccuracy"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
    objc_msgSend(v8, "appendFormat:", CFSTR("%hhu\n"), objc_msgSend(v24, "unsignedCharValue"));
  else
    objc_msgSend(v8, "appendString:", CFSTR("Could not read property\n"));
  objc_msgSend(v8, "appendFormat:", CFSTR("%@    Received Offset Scaled Log Variance: "), v7);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ReceivedOffsetScaledLogVariance"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
    objc_msgSend(v8, "appendFormat:", CFSTR("%hu\n"), objc_msgSend(v25, "unsignedShortValue"));
  else
    objc_msgSend(v8, "appendString:", CFSTR("Could not read property\n"));
  objc_msgSend(v8, "appendFormat:", CFSTR("%@    Received Clock Priority 2: "), v7);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ReceivedClockPriority2"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
    objc_msgSend(v8, "appendFormat:", CFSTR("%hhu\n"), objc_msgSend(v26, "unsignedCharValue"));
  else
    objc_msgSend(v8, "appendString:", CFSTR("Could not read property\n"));
  objc_msgSend(v8, "appendFormat:", CFSTR("%@    Received Grandmaster Identity: "), v7);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ReceivedGrandmasterID"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
    objc_msgSend(v8, "appendFormat:", CFSTR("%016llx\n"), objc_msgSend(v27, "unsignedLongLongValue"));
  else
    objc_msgSend(v8, "appendString:", CFSTR("Could not read property\n"));
  objc_msgSend(v8, "appendFormat:", CFSTR("%@    Received Steps Removed: "), v7);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ReceivedStepsRemoved"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
    objc_msgSend(v8, "appendFormat:", CFSTR("%hu\n"), objc_msgSend(v28, "unsignedShortValue"));
  else
    objc_msgSend(v8, "appendString:", CFSTR("Could not read property\n"));
  objc_msgSend(v8, "appendFormat:", CFSTR("%@    Received Time Source: "), v7);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("ReceivedTimeSource"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
    objc_msgSend(v8, "appendFormat:", CFSTR("%hhu\n"), objc_msgSend(v29, "unsignedCharValue"));
  else
    objc_msgSend(v8, "appendString:", CFSTR("Could not read property\n"));
  objc_msgSend(v8, "appendFormat:", CFSTR("%@    Local Link Type: "), v7);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("LocalLinkType"));
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    switch(objc_msgSend(v30, "unsignedCharValue"))
    {
      case 0u:
        v31 = CFSTR("Unknown\n");
        goto LABEL_62;
      case 1u:
        v31 = CFSTR("AVB Ethernet\n");
        goto LABEL_62;
      case 2u:
        v31 = CFSTR("Ethernet\n");
        goto LABEL_62;
      case 3u:
        v31 = CFSTR("Infrastructure WiFi\n");
        goto LABEL_62;
      case 4u:
        v31 = CFSTR("Peer to Peer WiFi\n");
        goto LABEL_62;
      case 5u:
        v31 = CFSTR("Timing Measurement\n");
        goto LABEL_62;
      case 6u:
        v31 = CFSTR("Fine Timing Measurement\n");
        goto LABEL_62;
      default:
        objc_msgSend(v8, "appendFormat:", CFSTR("Undefined link type %hhu\n"), objc_msgSend(v30, "unsignedCharValue"));
        break;
    }
  }
  else
  {
    v31 = CFSTR("Could not read property\n");
LABEL_62:
    objc_msgSend(v8, "appendString:", v31);
  }
  objc_msgSend(v8, "appendFormat:", CFSTR("%@    Remote Link Type: "), v7);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("RemoteLinkType"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    switch(objc_msgSend(v32, "unsignedCharValue"))
    {
      case 0u:
        v33 = CFSTR("Unknown\n");
        goto LABEL_67;
      case 1u:
        v33 = CFSTR("AVB Ethernet\n");
        goto LABEL_67;
      case 2u:
        v33 = CFSTR("Ethernet\n");
        goto LABEL_67;
      case 3u:
        v33 = CFSTR("Infrastructure WiFi\n");
        goto LABEL_67;
      case 4u:
        v33 = CFSTR("Peer to Peer WiFi\n");
        goto LABEL_67;
      case 5u:
        v33 = CFSTR("Timing Measurement\n");
        goto LABEL_67;
      case 6u:
        v33 = CFSTR("Fine Timing Measurement\n");
        goto LABEL_67;
      default:
        objc_msgSend(v8, "appendFormat:", CFSTR("Undefined link type %hhu\n"), objc_msgSend(v32, "unsignedCharValue"));
        break;
    }
  }
  else
  {
    v33 = CFSTR("Could not read property\n");
LABEL_67:
    objc_msgSend(v8, "appendString:", v33);
  }
  objc_msgSend(v8, "appendFormat:", CFSTR("%@    Local Timestamping Mode: "), v7);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("LocalTimestampingMode"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v34)
  {
    switch(objc_msgSend(v34, "unsignedCharValue"))
    {
      case 0u:
        v35 = CFSTR("Unknown\n");
        goto LABEL_76;
      case 1u:
        v35 = CFSTR("Hardware\n");
        goto LABEL_76;
      case 2u:
        v35 = CFSTR("Interrupt\n");
        goto LABEL_76;
      case 3u:
        v35 = CFSTR("Software\n");
        goto LABEL_76;
      default:
        objc_msgSend(v8, "appendFormat:", CFSTR("Undefined link type %hhu\n"), objc_msgSend(v34, "unsignedCharValue"));
        break;
    }
  }
  else
  {
    v35 = CFSTR("Could not read property\n");
LABEL_76:
    objc_msgSend(v8, "appendString:", v35);
  }
  objc_msgSend(v8, "appendFormat:", CFSTR("%@    Remote Timestamping Mode: "), v7);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("RemoteTimestampingMode"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    switch(objc_msgSend(v36, "unsignedCharValue"))
    {
      case 0u:
        v37 = CFSTR("Unknown\n");
        goto LABEL_85;
      case 1u:
        v37 = CFSTR("Hardware\n");
        goto LABEL_85;
      case 2u:
        v37 = CFSTR("Interrupt\n");
        goto LABEL_85;
      case 3u:
        v37 = CFSTR("Software\n");
        goto LABEL_85;
      default:
        objc_msgSend(v8, "appendFormat:", CFSTR("Undefined link type %hhu\n"), objc_msgSend(v36, "unsignedCharValue"));
        break;
    }
  }
  else
  {
    v37 = CFSTR("Could not read property\n");
LABEL_85:
    objc_msgSend(v8, "appendString:", v37);
  }
  objc_msgSend(v8, "appendFormat:", CFSTR("%@    Local Oscillator Type: "), v7);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("LocalOscillatorType"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    switch(objc_msgSend(v38, "unsignedCharValue"))
    {
      case 0u:
        v39 = CFSTR("Unknown\n");
        goto LABEL_90;
      case 1u:
        v39 = CFSTR("Crystal\n");
        goto LABEL_90;
      case 2u:
        v39 = CFSTR("MEMS\n");
        goto LABEL_90;
      case 3u:
        v39 = CFSTR("TCXO\n");
        goto LABEL_90;
      case 4u:
        v39 = CFSTR("VCO\n");
        goto LABEL_90;
      case 5u:
        v39 = CFSTR("VCYCXO\n");
        goto LABEL_90;
      case 6u:
        v39 = CFSTR("OCXO\n");
        goto LABEL_90;
      case 7u:
        v39 = CFSTR("DOCXO\n");
        goto LABEL_90;
      case 8u:
        v39 = CFSTR("VCOCXO\n");
        goto LABEL_90;
      case 9u:
        v39 = CFSTR("VCDOCXO\n");
        goto LABEL_90;
      default:
        objc_msgSend(v8, "appendFormat:", CFSTR("Undefined oscillator type %hhu\n"), objc_msgSend(v38, "unsignedCharValue"));
        break;
    }
  }
  else
  {
    v39 = CFSTR("Could not read property\n");
LABEL_90:
    objc_msgSend(v8, "appendString:", v39);
  }
  objc_msgSend(v8, "appendFormat:", CFSTR("%@    Remote Oscillator Type: "), v7);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("RemoteOscillatorType"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (v40)
  {
    switch(objc_msgSend(v40, "unsignedCharValue"))
    {
      case 0u:
        v41 = CFSTR("Unknown\n");
        goto LABEL_95;
      case 1u:
        v41 = CFSTR("Crystal\n");
        goto LABEL_95;
      case 2u:
        v41 = CFSTR("MEMS\n");
        goto LABEL_95;
      case 3u:
        v41 = CFSTR("TCXO\n");
        goto LABEL_95;
      case 4u:
        v41 = CFSTR("VCO\n");
        goto LABEL_95;
      case 5u:
        v41 = CFSTR("VCYCXO\n");
        goto LABEL_95;
      case 6u:
        v41 = CFSTR("OCXO\n");
        goto LABEL_95;
      case 7u:
        v41 = CFSTR("DOCXO\n");
        goto LABEL_95;
      case 8u:
        v41 = CFSTR("VCOCXO\n");
        goto LABEL_95;
      case 9u:
        v41 = CFSTR("VCDOCXO\n");
        goto LABEL_95;
      default:
        objc_msgSend(v8, "appendFormat:", CFSTR("Undefined oscillator type %hhu\n"), objc_msgSend(v40, "unsignedCharValue"));
        break;
    }
  }
  else
  {
    v41 = CFSTR("Could not read property\n");
LABEL_95:
    objc_msgSend(v8, "appendString:", v41);
  }
  objc_msgSend(v8, "appendFormat:", CFSTR("%@    Local Frequency Tolerance Lower: "), v7);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("LocalFrequencyToleranceLower"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
    objc_msgSend(v8, "appendFormat:", CFSTR("%d ppb\n"), objc_msgSend(v42, "intValue"));
  else
    objc_msgSend(v8, "appendString:", CFSTR("Could not read property\n"));
  objc_msgSend(v8, "appendFormat:", CFSTR("%@    Local Frequency Tolerance Upper: "), v7);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("LocalFrequencyToleranceUpper"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
    objc_msgSend(v8, "appendFormat:", CFSTR("%d ppb\n"), objc_msgSend(v43, "intValue"));
  else
    objc_msgSend(v8, "appendString:", CFSTR("Could not read property\n"));
  objc_msgSend(v8, "appendFormat:", CFSTR("%@    Remote Frequency Tolerance Lower: "), v7);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("RemoteFrequencyToleranceLower"));
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  if (v44)
    objc_msgSend(v8, "appendFormat:", CFSTR("%d ppb\n"), objc_msgSend(v44, "intValue"));
  else
    objc_msgSend(v8, "appendString:", CFSTR("Could not read property\n"));
  objc_msgSend(v8, "appendFormat:", CFSTR("%@    Remote Frequency Tolerance Upper: "), v7);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("RemoteFrequencyToleranceUpper"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  if (v45)
    objc_msgSend(v8, "appendFormat:", CFSTR("%d ppb\n"), objc_msgSend(v45, "intValue"));
  else
    objc_msgSend(v8, "appendString:", CFSTR("Could not read property\n"));
  objc_msgSend(v8, "appendFormat:", CFSTR("%@    Local Frequency Stability Lower: "), v7);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("LocalFrequencyStabilityLower"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
    objc_msgSend(v8, "appendFormat:", CFSTR("%d ppb\n"), objc_msgSend(v46, "intValue"));
  else
    objc_msgSend(v8, "appendString:", CFSTR("Could not read property\n"));
  objc_msgSend(v8, "appendFormat:", CFSTR("%@    Local Frequency Stability Upper: "), v7);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("LocalFrequencyStabilityUpper"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  if (v47)
    objc_msgSend(v8, "appendFormat:", CFSTR("%d ppb\n"), objc_msgSend(v47, "intValue"));
  else
    objc_msgSend(v8, "appendString:", CFSTR("Could not read property\n"));
  objc_msgSend(v8, "appendFormat:", CFSTR("%@    Remote Frequency Stability Lower: "), v7);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("RemoteFrequencyStabilityLower"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (v48)
    objc_msgSend(v8, "appendFormat:", CFSTR("%d ppb\n"), objc_msgSend(v48, "intValue"));
  else
    objc_msgSend(v8, "appendString:", CFSTR("Could not read property\n"));
  objc_msgSend(v8, "appendFormat:", CFSTR("%@    Remote Frequency Stability Upper: "), v7);
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("RemoteFrequencyStabilityUpper"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (v49)
    objc_msgSend(v8, "appendFormat:", CFSTR("%d ppb\n"), objc_msgSend(v49, "intValue"));
  else
    objc_msgSend(v8, "appendString:", CFSTR("Could not read property\n"));
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("OverridenReceiveMatching"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  if (v50)
  {
    if (objc_msgSend(v50, "BOOLValue"))
      v51 = CFSTR("YES");
    else
      v51 = CFSTR("NO");
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Overriden Receive Matching: %@\n"), v7, v51);
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Overriden Receive Clock Identity: "), v7);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("OverridenReceiveClockIdentity"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    if (v52)
      objc_msgSend(v8, "appendFormat:", CFSTR("0x%016llx\n"), objc_msgSend(v52, "unsignedLongLongValue"));
    else
      objc_msgSend(v8, "appendString:", CFSTR("Could not read property\n"));
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    Overriden Receive Port Number: "), v7);
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("OverridenReceivePortNumber"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    if (v53)
    {
      objc_msgSend(v8, "appendFormat:", CFSTR("%hu\n"), objc_msgSend(v53, "unsignedShortValue"));

    }
    else
    {
      objc_msgSend(v8, "appendString:", CFSTR("Could not read property\n"));
    }
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("PTPPortEnabled"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v54;
  if (v54)
  {
    if (objc_msgSend(v54, "BOOLValue"))
      v56 = CFSTR("YES");
    else
      v56 = CFSTR("NO");
    objc_msgSend(v8, "appendFormat:", CFSTR("%@    PTP Port Enabled: %@\n"), v7, v56);
  }
  v57 = v8;

  return v57;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clients, 0);
  objc_storeStrong((id *)&self->_impl, 0);
}

@end
