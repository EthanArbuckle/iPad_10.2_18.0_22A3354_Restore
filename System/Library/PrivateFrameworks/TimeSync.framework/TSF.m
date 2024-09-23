@implementation TSF

void __50___TSF_TSDClockSyncManager_sharedClockSyncManager__block_invoke()
{
  void *v0;
  _TSF_TSDClockSyncManager *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1B5E4E6F0]();
  v1 = objc_alloc_init(_TSF_TSDClockSyncManager);
  v2 = (void *)_sharedClockSyncManager;
  _sharedClockSyncManager = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

uint64_t __56___TSF_TSDgPTPManager_notifyWhengPTPManagerIsAvailable___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __58___TSF_TSDgPTPManager_notifyWhengPTPManagerIsUnavailable___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __40___TSF_TSDgPTPManager_sharedgPTPManager__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  id v2;

  v0 = dispatch_queue_create("com.apple.TimeSync.TSDgPTPManager.shared", 0);
  v1 = (void *)_sharedgPTPManagerQueue;
  _sharedgPTPManagerQueue = (uint64_t)v0;

  +[_TSF_TSDClockManager sharedClockManager](_TSF_TSDClockManager, "sharedClockManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addgPTPServicesWithError:", 0);

}

void __40___TSF_TSDgPTPManager_sharedgPTPManager__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = (void *)MEMORY[0x1B5E4E6F0]();
  if (!_sharedgPTPManager_0)
  {
    +[_TSF_TSDClockManager sharedClockManager](_TSF_TSDClockManager, "sharedClockManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addgPTPServicesWithError:", 0);
    objc_msgSend(*(id *)(a1 + 32), "gPTPManager");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)_sharedgPTPManager_0;
    _sharedgPTPManager_0 = v4;

  }
  objc_autoreleasePoolPop(v2);
}

intptr_t __56___TSF_TSDgPTPManager_sharedgPTPManagerSyncWithTimeout___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __35___TSF_TSDgPTPManager_systemDomain__block_invoke(uint64_t a1)
{
  void *v2;
  _TSF_TSDgPTPClock *v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (!v2)
  {
    v3 = -[_TSF_TSDKernelClock initWithClockIdentifier:]([_TSF_TSDgPTPClock alloc], "initWithClockIdentifier:", objc_msgSend(*(id *)(a1 + 32), "systemDomainClockIdentifier"));
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 24);
    *(_QWORD *)(v4 + 24) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2);
}

void __37___TSF_TSDgPTPManager_diagnosticInfo__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = (void *)MEMORY[0x1B5E4E6F0]();
  if (objc_msgSend(v5, "conformsToIOClassName:", CFSTR("IOTimeSyncDomain")))
  {
    +[_TSF_TSDgPTPClock diagnosticInfoForService:](_TSF_TSDgPTPClock, "diagnosticInfoForService:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

  }
  objc_autoreleasePoolPop(v3);

}

void __40___TSF_TSDgPTPPort_initWithService_pid___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.TimeSync.TSDgPTPPort.sharedNotificationsQueue", 0);
  v1 = (void *)_sharedNotificationsQueue;
  _sharedNotificationsQueue = (uint64_t)v0;

}

void __40___TSF_TSDgPTPPort_initWithService_pid___block_invoke_51(uint64_t a1, void *a2, int a3)
{
  void *v5;
  _BYTE *WeakRetained;
  void *v7;
  id v8;

  v8 = a2;
  v5 = (void *)MEMORY[0x1B5E4E6F0]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    if (a3 == -536870608)
    {
      if (WeakRetained[32])
        objc_msgSend(WeakRetained, "updateProperties");
    }
    else if (a3 == -536870896)
    {
      objc_msgSend(WeakRetained, "serviceTerminated");
    }
  }

  objc_autoreleasePoolPop(v5);
}

void __36___TSF_TSDgPTPPort_updateProperties__block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1B5E4E6F0]();
  if (objc_msgSend(*(id *)(a1 + 32), "portRole") != *(_DWORD *)(a1 + 48))
    objc_msgSend(*(id *)(a1 + 32), "setPortRole:");
  if (objc_msgSend(*(id *)(a1 + 32), "clockIdentifier") != *(_QWORD *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "setClockIdentifier:");
  objc_autoreleasePoolPop(v2);
}

void __43___TSF_TSDgPTPNetworkPort_updateProperties__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  int v4;
  int v5;
  int v6;
  unsigned __int8 v7;
  int v8;
  unsigned __int8 v9;
  int v10;
  unsigned __int8 v11;
  int v12;
  unsigned __int8 v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  void *v31;
  char v32;
  void *v33;
  char v34;
  int v35;
  int v36;
  int v37;
  int v38;

  v2 = (void *)MEMORY[0x1B5E4E6F0]();
  if (objc_msgSend(*(id *)(a1 + 32), "remoteClockIdentity") != *(_QWORD *)(a1 + 56))
    objc_msgSend(*(id *)(a1 + 32), "setRemoteClockIdentity:");
  if (objc_msgSend(*(id *)(a1 + 32), "remotePortNumber") != *(unsigned __int16 *)(a1 + 124))
    objc_msgSend(*(id *)(a1 + 32), "setRemotePortNumber:");
  v3 = objc_msgSend(*(id *)(a1 + 32), "remoteIsSameDevice");
  v4 = *(unsigned __int8 *)(a1 + 128);
  if (v4 != v3)
    objc_msgSend(*(id *)(a1 + 32), "setRemoteIsSameDevice:", v4 != 0);
  v5 = objc_msgSend(*(id *)(a1 + 32), "isASCapable");
  v6 = *(unsigned __int8 *)(a1 + 129);
  if (v6 != v5)
    objc_msgSend(*(id *)(a1 + 32), "setAsCapable:", v6 != 0);
  if (objc_msgSend(*(id *)(a1 + 32), "propagationDelay") != *(_DWORD *)(a1 + 72))
    objc_msgSend(*(id *)(a1 + 32), "setPropagationDelay:");
  if (objc_msgSend(*(id *)(a1 + 32), "maximumPropagationDelay") != *(_DWORD *)(a1 + 76))
    objc_msgSend(*(id *)(a1 + 32), "setMaximumPropagationDelay:");
  if (objc_msgSend(*(id *)(a1 + 32), "minimumPropagationDelay") != *(_DWORD *)(a1 + 80))
    objc_msgSend(*(id *)(a1 + 32), "setMinimumPropagationDelay:");
  if (objc_msgSend(*(id *)(a1 + 32), "maximumRawDelay") != *(_DWORD *)(a1 + 84))
    objc_msgSend(*(id *)(a1 + 32), "setMaximumRawDelay:");
  if (objc_msgSend(*(id *)(a1 + 32), "minimumRawDelay") != *(_DWORD *)(a1 + 88))
    objc_msgSend(*(id *)(a1 + 32), "setMinimumRawDelay:");
  v7 = objc_msgSend(*(id *)(a1 + 32), "localSyncLogMeanInterval");
  v8 = *(unsigned __int8 *)(a1 + 130);
  if (v8 != v7)
    objc_msgSend(*(id *)(a1 + 32), "setLocalSyncLogMeanInterval:", (char)v8);
  v9 = objc_msgSend(*(id *)(a1 + 32), "remoteSyncLogMeanInterval");
  v10 = *(unsigned __int8 *)(a1 + 131);
  if (v10 != v9)
    objc_msgSend(*(id *)(a1 + 32), "setRemoteSyncLogMeanInterval:", (char)v10);
  v11 = objc_msgSend(*(id *)(a1 + 32), "localAnnounceLogMeanInterval");
  v12 = *(unsigned __int8 *)(a1 + 132);
  if (v12 != v11)
    objc_msgSend(*(id *)(a1 + 32), "setLocalAnnounceLogMeanInterval:", (char)v12);
  v13 = objc_msgSend(*(id *)(a1 + 32), "remoteAnnounceLogMeanInterval");
  v14 = *(unsigned __int8 *)(a1 + 133);
  if (v14 != v13)
    objc_msgSend(*(id *)(a1 + 32), "setRemoteAnnounceLogMeanInterval:", (char)v14);
  if (objc_msgSend(*(id *)(a1 + 32), "localLinkType") != *(unsigned __int8 *)(a1 + 134))
    objc_msgSend(*(id *)(a1 + 32), "setLocalLinkType:");
  if (objc_msgSend(*(id *)(a1 + 32), "remoteLinkType") != *(unsigned __int8 *)(a1 + 135))
    objc_msgSend(*(id *)(a1 + 32), "setRemoteLinkType:");
  if (objc_msgSend(*(id *)(a1 + 32), "localTimestampingMode") != *(unsigned __int8 *)(a1 + 136))
    objc_msgSend(*(id *)(a1 + 32), "setLocalTimestampingMode:");
  if (objc_msgSend(*(id *)(a1 + 32), "remoteTimestampingMode") != *(unsigned __int8 *)(a1 + 137))
    objc_msgSend(*(id *)(a1 + 32), "setRemoteTimestampingMode:");
  if (objc_msgSend(*(id *)(a1 + 32), "localOscillatorType") != *(unsigned __int8 *)(a1 + 138))
    objc_msgSend(*(id *)(a1 + 32), "setLocalOscillatorType:");
  if (objc_msgSend(*(id *)(a1 + 32), "remoteOscillatorType") != *(unsigned __int8 *)(a1 + 139))
    objc_msgSend(*(id *)(a1 + 32), "setRemoteOscillatorType:");
  v15 = objc_msgSend(*(id *)(a1 + 32), "hasLocalFrequencyToleranceLower");
  v16 = *(unsigned __int8 *)(a1 + 140);
  if (v16 != v15)
    objc_msgSend(*(id *)(a1 + 32), "setHasLocalFrequencyToleranceLower:", v16 != 0);
  if (objc_msgSend(*(id *)(a1 + 32), "localFrequencyToleranceLower") != *(_DWORD *)(a1 + 92))
    objc_msgSend(*(id *)(a1 + 32), "setLocalFrequencyToleranceLower:");
  v17 = objc_msgSend(*(id *)(a1 + 32), "hasLocalFrequencyToleranceUpper");
  v18 = *(unsigned __int8 *)(a1 + 141);
  if (v18 != v17)
    objc_msgSend(*(id *)(a1 + 32), "setHasLocalFrequencyToleranceUpper:", v18 != 0);
  if (objc_msgSend(*(id *)(a1 + 32), "localFrequencyToleranceUpper") != *(_DWORD *)(a1 + 96))
    objc_msgSend(*(id *)(a1 + 32), "setLocalFrequencyToleranceUpper:");
  v19 = objc_msgSend(*(id *)(a1 + 32), "hasRemoteFrequencyToleranceLower");
  v20 = *(unsigned __int8 *)(a1 + 142);
  if (v20 != v19)
    objc_msgSend(*(id *)(a1 + 32), "setHasRemoteFrequencyToleranceLower:", v20 != 0);
  if (objc_msgSend(*(id *)(a1 + 32), "remoteFrequencyToleranceLower") != *(_DWORD *)(a1 + 100))
    objc_msgSend(*(id *)(a1 + 32), "setRemoteFrequencyToleranceLower:");
  v21 = objc_msgSend(*(id *)(a1 + 32), "hasRemoteFrequencyToleranceUpper");
  v22 = *(unsigned __int8 *)(a1 + 143);
  if (v22 != v21)
    objc_msgSend(*(id *)(a1 + 32), "setHasRemoteFrequencyToleranceUpper:", v22 != 0);
  if (objc_msgSend(*(id *)(a1 + 32), "remoteFrequencyToleranceUpper") != *(_DWORD *)(a1 + 104))
    objc_msgSend(*(id *)(a1 + 32), "setRemoteFrequencyToleranceUpper:");
  v23 = objc_msgSend(*(id *)(a1 + 32), "hasLocalFrequencyStabilityLower");
  v24 = *(unsigned __int8 *)(a1 + 144);
  if (v24 != v23)
    objc_msgSend(*(id *)(a1 + 32), "setHasLocalFrequencyStabilityLower:", v24 != 0);
  if (objc_msgSend(*(id *)(a1 + 32), "localFrequencyStabilityLower") != *(_DWORD *)(a1 + 108))
    objc_msgSend(*(id *)(a1 + 32), "setLocalFrequencyStabilityLower:");
  v25 = objc_msgSend(*(id *)(a1 + 32), "hasLocalFrequencyStabilityUpper");
  v26 = *(unsigned __int8 *)(a1 + 145);
  if (v26 != v25)
    objc_msgSend(*(id *)(a1 + 32), "setHasLocalFrequencyStabilityUpper:", v26 != 0);
  if (objc_msgSend(*(id *)(a1 + 32), "localFrequencyStabilityUpper") != *(_DWORD *)(a1 + 112))
    objc_msgSend(*(id *)(a1 + 32), "setLocalFrequencyStabilityUpper:");
  v27 = objc_msgSend(*(id *)(a1 + 32), "hasRemoteFrequencyStabilityLower");
  v28 = *(unsigned __int8 *)(a1 + 146);
  if (v28 != v27)
    objc_msgSend(*(id *)(a1 + 32), "setHasRemoteFrequencyStabilityLower:", v28 != 0);
  if (objc_msgSend(*(id *)(a1 + 32), "remoteFrequencyStabilityLower") != *(_DWORD *)(a1 + 116))
    objc_msgSend(*(id *)(a1 + 32), "setRemoteFrequencyStabilityLower:");
  v29 = objc_msgSend(*(id *)(a1 + 32), "hasRemoteFrequencyStabilityUpper");
  v30 = *(unsigned __int8 *)(a1 + 147);
  if (v30 != v29)
    objc_msgSend(*(id *)(a1 + 32), "setHasRemoteFrequencyStabilityUpper:", v30 != 0);
  if (objc_msgSend(*(id *)(a1 + 32), "remoteFrequencyStabilityUpper") != *(_DWORD *)(a1 + 120))
    objc_msgSend(*(id *)(a1 + 32), "setRemoteFrequencyStabilityUpper:");
  objc_msgSend(*(id *)(a1 + 32), "sourceAddressString");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "isEqualToString:", *(_QWORD *)(a1 + 40));

  if ((v32 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "setSourceAddressString:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "destinationAddressString");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "isEqualToString:", *(_QWORD *)(a1 + 48));

  if ((v34 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "setDestinationAddressString:", *(_QWORD *)(a1 + 48));
  v35 = objc_msgSend(*(id *)(a1 + 32), "overridenReceiveMatching");
  v36 = *(unsigned __int8 *)(a1 + 148);
  if (v36 != v35)
    objc_msgSend(*(id *)(a1 + 32), "setOverridenReceiveMatching:", v36 != 0);
  if (objc_msgSend(*(id *)(a1 + 32), "overridenReceiveClockIdentity") != *(_QWORD *)(a1 + 64))
    objc_msgSend(*(id *)(a1 + 32), "setOverridenReceiveClockIdentity:");
  if (objc_msgSend(*(id *)(a1 + 32), "overridenReceivePortNumber") != *(unsigned __int16 *)(a1 + 126))
    objc_msgSend(*(id *)(a1 + 32), "setOverridenReceivePortNumber:");
  v37 = objc_msgSend(*(id *)(a1 + 32), "enabled");
  v38 = *(unsigned __int8 *)(a1 + 149);
  if (v38 != v37)
    objc_msgSend(*(id *)(a1 + 32), "setEnabled:", v38 != 0);
  objc_autoreleasePoolPop(v2);
}

uint64_t __52___TSF_TSDgPTPNetworkPort_getCurrentPortInfo_error___block_invoke(uint64_t a1)
{
  uint64_t result;

  **(_DWORD **)(a1 + 40) = objc_msgSend(*(id *)(a1 + 32), "portRole");
  *(_DWORD *)(*(_QWORD *)(a1 + 40) + 4) = objc_msgSend(*(id *)(a1 + 32), "portType");
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 8) = objc_msgSend(*(id *)(a1 + 32), "localLinkType");
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 9) = objc_msgSend(*(id *)(a1 + 32), "remoteLinkType");
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 10) = objc_msgSend(*(id *)(a1 + 32), "localTimestampingMode");
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 11) = objc_msgSend(*(id *)(a1 + 32), "remoteTimestampingMode");
  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16) = objc_msgSend(*(id *)(a1 + 32), "remoteClockIdentity");
  result = objc_msgSend(*(id *)(a1 + 32), "remotePortNumber");
  *(_WORD *)(*(_QWORD *)(a1 + 40) + 24) = result;
  return result;
}

void __51___TSF_TSDgPTPNetworkPort__handleRefreshConnection__block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1B5E4E6F0]();
  objc_msgSend(*(id *)(a1 + 32), "didChangeASCapable:forPort:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
  objc_autoreleasePoolPop(v2);
}

void __81___TSF_TSDgPTPNetworkPort__handleNotification_withArg1_arg2_arg3_arg4_arg5_arg6___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1B5E4E6F0]();
  objc_msgSend(*(id *)(a1 + 32), "didChangeASCapable:forPort:", *(_QWORD *)(a1 + 48) != 0, *(_QWORD *)(a1 + 40));
  objc_autoreleasePoolPop(v2);
}

void __52___TSF_TSDgPTPNetworkPort_diagnosticInfoForService___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = (void *)MEMORY[0x1B5E4E6F0]();
  if ((objc_msgSend(v5, "conformsToIOClassName:", CFSTR("IOEthernetInterface")) & 1) != 0
    || objc_msgSend(v5, "conformsToIOClassName:", CFSTR("IOTimeSyncInterfaceAdapter")))
  {
    objc_msgSend(v5, "iodPropertyForKey:", CFSTR("BSD Name"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, CFSTR("BSD Name"));

  }
  objc_autoreleasePoolPop(v3);

}

void __41___TSF_TSDgPTPFDPtPPort_updateProperties__block_invoke(uint64_t a1)
{
  void *v2;
  unsigned __int8 v3;
  int v4;
  unsigned __int8 v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;

  v2 = (void *)MEMORY[0x1B5E4E6F0]();
  v3 = objc_msgSend(*(id *)(a1 + 32), "localPDelayLogMeanInterval");
  v4 = *(unsigned __int8 *)(a1 + 48);
  if (v4 != v3)
    objc_msgSend(*(id *)(a1 + 32), "setLocalPDelayLogMeanInterval:", (char)v4);
  v5 = objc_msgSend(*(id *)(a1 + 32), "remotePDelayLogMeanInterval");
  v6 = *(unsigned __int8 *)(a1 + 49);
  if (v6 != v5)
    objc_msgSend(*(id *)(a1 + 32), "setRemotePDelayLogMeanInterval:", (char)v6);
  v7 = objc_msgSend(*(id *)(a1 + 32), "multipleRemotes");
  v8 = *(unsigned __int8 *)(a1 + 50);
  if (v8 != v7)
    objc_msgSend(*(id *)(a1 + 32), "setMultipleRemotes:", v8 != 0);
  v9 = objc_msgSend(*(id *)(a1 + 32), "measuringPDelay");
  v10 = *(unsigned __int8 *)(a1 + 51);
  if (v10 != v9)
    objc_msgSend(*(id *)(a1 + 32), "setMeasuringPDelay:", v10 != 0);
  objc_msgSend(*(id *)(a1 + 32), "setStatistics:", *(_QWORD *)(a1 + 40));
  objc_autoreleasePoolPop(v2);
}

void __41___TSF_TSDgPTPFDEtEPort_updateProperties__block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1B5E4E6F0]();
  objc_msgSend(*(id *)(a1 + 32), "setStatistics:", *(_QWORD *)(a1 + 40));
  objc_autoreleasePoolPop(v2);
}

void __33___TSF_TSDIOKServiceMatcher_init__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  id v2;
  uint64_t v3;
  void *v4;

  v0 = dispatch_queue_create("com.apple.TimeSync.TSIOKServiceMatcherClassNotifier.sharedNotificationsQueue", 0);
  v1 = (void *)_sharedTSDIOKServiceMatcherNotificationsQueue;
  _sharedTSDIOKServiceMatcherNotificationsQueue = (uint64_t)v0;

  v2 = objc_alloc(MEMORY[0x1E0D39F00]);
  v3 = objc_msgSend(v2, "initOnDispatchQueue:", _sharedTSDIOKServiceMatcherNotificationsQueue);
  v4 = (void *)_sharedTSDIOKServiceMatcherNotificationsPort;
  _sharedTSDIOKServiceMatcherNotificationsPort = v3;

}

void __70___TSF_TSDIOKServiceMatcher_startNotificationsWithMatchingDictionary___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id WeakRetained;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v3 = (void *)MEMORY[0x1B5E4E6F0]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v8, "nextObject");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      do
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(WeakRetained, "handleServiceMatched:", v6);
        objc_msgSend(v8, "nextObject");
        v7 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v7;
      }
      while (v7);
    }
  }

  objc_autoreleasePoolPop(v3);
}

void __70___TSF_TSDIOKServiceMatcher_startNotificationsWithMatchingDictionary___block_invoke_12(uint64_t a1, void *a2)
{
  void *v3;
  id WeakRetained;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v3 = (void *)MEMORY[0x1B5E4E6F0]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(v8, "nextObject");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      do
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(WeakRetained, "handleServiceTerminated:", v6);
        objc_msgSend(v8, "nextObject");
        v7 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v7;
      }
      while (v7);
    }
  }

  objc_autoreleasePoolPop(v3);
}

void __70___TSF_TSDIOKServiceMatcher_startNotificationsWithMatchingDictionary___block_invoke_14(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1B5E4E6F0]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "primeNotification");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "primeNotification");
  objc_autoreleasePoolPop(v2);
}

void __53___TSF_TSDKextNotifier_notifyWhenServiceIsAvailable___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1B5E4E6F0]();
  v3 = objc_msgSend(*(id *)(a1 + 32), "getMatchedCount");
  v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
  if (v3 < 1)
  {
    if (v4)
    {
      v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "UTF8String");
      v11 = 136315394;
      v12 = v6;
      v13 = 1024;
      v14 = v3;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TSDKextNotifier notifyWhenServiceIsAvailable %s matchedCount %d, saving notification block", (uint8_t *)&v11, 0x12u);
    }
    v7 = *(void **)(a1 + 40);
    v8 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
    v9 = (void *)objc_msgSend(v7, "copy");
    v10 = (void *)MEMORY[0x1B5E4E864]();
    objc_msgSend(v8, "addObject:", v10);

  }
  else
  {
    if (v4)
    {
      v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "UTF8String");
      v11 = 136315394;
      v12 = v5;
      v13 = 1024;
      v14 = v3;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TSDKextNotifier notifyWhenServiceIsAvailable %s matchedCount %d, dispatching notification", (uint8_t *)&v11, 0x12u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  objc_autoreleasePoolPop(v2);
}

void __55___TSF_TSDKextNotifier_notifyWhenServiceIsUnavailable___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  _BOOL4 v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1B5E4E6F0]();
  v3 = objc_msgSend(*(id *)(a1 + 32), "getMatchedCount");
  v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v4)
    {
      v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "UTF8String");
      v11 = 136315394;
      v12 = v5;
      v13 = 1024;
      v14 = v3;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TSDKextNotifier notifyWhenServiceIsUnavailable %s matchedCount %d, saving notification block", (uint8_t *)&v11, 0x12u);
    }
    v6 = *(void **)(a1 + 40);
    v7 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
    v8 = (void *)objc_msgSend(v6, "copy");
    v9 = (void *)MEMORY[0x1B5E4E864]();
    objc_msgSend(v7, "addObject:", v9);

  }
  else
  {
    if (v4)
    {
      v10 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "UTF8String");
      v11 = 136315394;
      v12 = v10;
      v13 = 1024;
      v14 = 0;
      _os_log_impl(&dword_1B56CB000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "TSDKextNotifier notifyWhenServiceIsUnavailable %s matchedCount %d, dispatching notification", (uint8_t *)&v11, 0x12u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  objc_autoreleasePoolPop(v2);
}

void __31___TSF_TSDKextNotifier_dealloc__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1B5E4E6F0]();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(v3);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v7++) + 16))();
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v5);
  }

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = *(id *)(a1 + 40);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12) + 16))(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12));
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v21, 16);
    }
    while (v10);
  }

  objc_autoreleasePoolPop(v2);
}

void __46___TSF_IODConnection_initWithService_andType___block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  getpid();
  gClientsLock = 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)gClients;
  gClients = v0;

  +[TSXDaemonServiceClient sharedDaemonServiceClient](TSXDaemonServiceClient, "sharedDaemonServiceClient");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)gDaemonServiceClient;
  gDaemonServiceClient = v2;

}

uint64_t __41___TSF_IODConnection_daemonClientRefresh__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, uint64_t))(a1 + 40))(*(_QWORD *)(a1 + 48), 0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32, 1);
}

uint64_t __76___TSF_IODConnection_dispatchNotificationForClientID_ioResult_args_numArgs___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, _QWORD))(a1 + 48))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), *(unsigned int *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32, *(unsigned int *)(a1 + 60));
}

uint64_t __58___TSF_TSDClockManager_notifyWhenClockManagerIsAvailable___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __60___TSF_TSDClockManager_notifyWhenClockManagerIsUnavailable___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __42___TSF_TSDClockManager_sharedClockManager__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.TimeSync.TSDClockManager.shared", 0);
  v1 = (void *)_sharedClockManagerQueue;
  _sharedClockManagerQueue = (uint64_t)v0;

}

void __42___TSF_TSDClockManager_sharedClockManager__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x1B5E4E6F0]();
  if (!_sharedClockManager)
  {
    objc_msgSend(*(id *)(a1 + 32), "clockManager");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)_sharedClockManager;
    _sharedClockManager = v3;

  }
  objc_autoreleasePoolPop(v2);
}

void __54___TSF_TSDKernelClock_availableKernelClockIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = (void *)MEMORY[0x1B5E4E6F0]();
  objc_msgSend(v5, "iodPropertyForKey:", CFSTR("ClockIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

  objc_autoreleasePoolPop(v3);
}

void __51___TSF_TSDKernelClock_initWithClockIdentifier_pid___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  id WeakRetained;
  id v9;

  v9 = a2;
  v7 = (void *)MEMORY[0x1B5E4E6F0]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleInterestNotification:withArgument:", a3, a4);

  objc_autoreleasePoolPop(v7);
}

void __59___TSF_TSDKernelClock__refreshLockStateOnNotificationQueue__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;

  v2 = (void *)MEMORY[0x1B5E4E6F0]();
  v3 = *(_DWORD *)(a1 + 40);
  if (v3 != objc_msgSend(*(id *)(a1 + 32), "lockState"))
    objc_msgSend(*(id *)(a1 + 32), "setLockState:", *(unsigned int *)(a1 + 40));
  objc_autoreleasePoolPop(v2);
}

void __64___TSF_TSDKernelClock__handleInterestNotification_withArgument___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;

  v2 = (void *)MEMORY[0x1B5E4E6F0]();
  v3 = *(_DWORD *)(a1 + 40);
  if (v3 != objc_msgSend(*(id *)(a1 + 32), "lockState"))
    objc_msgSend(*(id *)(a1 + 32), "setLockState:", *(unsigned int *)(a1 + 40));
  objc_autoreleasePoolPop(v2);
}

void __55___TSF_TSDCallbackRefconMap_sharedTSDCallbackRefconMap__block_invoke()
{
  void *v0;
  _TSF_TSDCallbackRefconMap *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1B5E4E6F0]();
  v1 = objc_alloc_init(_TSF_TSDCallbackRefconMap);
  v2 = (void *)_sharedTSDCallbackRefconMap;
  _sharedTSDCallbackRefconMap = (uint64_t)v1;

  objc_autoreleasePoolPop(v0);
}

void __50___TSF_TSDgPTPClock_availablegPTPClockIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = (void *)MEMORY[0x1B5E4E6F0]();
  objc_msgSend(v5, "iodPropertyForKey:", CFSTR("ClockIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

  objc_autoreleasePoolPop(v3);
}

void __62___TSF_TSDgPTPClock__handleInterestNotification_withArgument___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x1B5E4E6F0]();
  v3 = *(_QWORD *)(a1 + 40);
  if (v3 != objc_msgSend(*(id *)(a1 + 32), "grandmasterIdentity"))
    objc_msgSend(*(id *)(a1 + 32), "setGrandmasterIdentity:", *(_QWORD *)(a1 + 40));
  objc_autoreleasePoolPop(v2);
}

void __62___TSF_TSDgPTPClock__handleInterestNotification_withArgument___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1B5E4E6F0]();
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "gptpPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v3, "isEqual:", v4);

  if ((v3 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "setGptpPath:", *(_QWORD *)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

void __67___TSF_TSDgPTPClock__refreshGrandmasterIdentityOnNotificationQueue__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1B5E4E6F0]();
  v3 = *(_QWORD *)(a1 + 48);
  if (v3 != objc_msgSend(*(id *)(a1 + 32), "grandmasterIdentity"))
    objc_msgSend(*(id *)(a1 + 32), "setGrandmasterIdentity:", *(_QWORD *)(a1 + 48));
  v4 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "gptpPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v4, "isEqual:", v5);

  if ((v4 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "setGptpPath:", *(_QWORD *)(a1 + 40));
  objc_autoreleasePoolPop(v2);
}

void __26___TSF_TSDgPTPClock_ports__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = (void *)MEMORY[0x1B5E4E6F0]();
  if (objc_msgSend(v5, "conformsToIOClassName:", CFSTR("IOTimeSyncPort")))
  {
    +[_TSF_TSDgPTPPort gPTPPortWithService:](_TSF_TSDgPTPPort, "gPTPPortWithService:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);

  }
  objc_autoreleasePoolPop(v3);

}

void __40___TSF_TSDgPTPClock_portWithPortNumber___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v3 = (void *)MEMORY[0x1B5E4E6F0]();
  if (objc_msgSend(v9, "conformsToIOClassName:", CFSTR("IOTimeSyncPort")))
  {
    objc_msgSend(v9, "iodPropertyForKey:", CFSTR("PortNumber"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4 && objc_msgSend(v4, "unsignedShortValue") == *(unsigned __int16 *)(a1 + 40))
    {
      +[_TSF_TSDgPTPPort gPTPPortWithService:](_TSF_TSDgPTPPort, "gPTPPortWithService:", v9);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v8 = *(void **)(v7 + 40);
      *(_QWORD *)(v7 + 40) = v6;

    }
  }
  objc_autoreleasePoolPop(v3);

}

void __46___TSF_TSDgPTPClock_diagnosticInfoForService___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  __objc2_class *v5;
  void *v6;
  id v7;

  v7 = a2;
  v3 = (void *)MEMORY[0x1B5E4E6F0]();
  if (objc_msgSend(v7, "conformsToIOClassName:", CFSTR("IOTimeSyncEthernetPort")))
  {
    v4 = *(void **)(a1 + 32);
    v5 = _TSF_TSDgPTPEthernetPort;
LABEL_19:
    -[__objc2_class diagnosticInfoForService:](v5, "diagnosticInfoForService:", v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v6);

    goto LABEL_20;
  }
  if (objc_msgSend(v7, "conformsToIOClassName:", CFSTR("IOTimeSyncUnicastLinkLayerPtPPort")))
  {
    v4 = *(void **)(a1 + 32);
    v5 = _TSF_TSDgPTPUnicastLinkLayerPtPPort;
    goto LABEL_19;
  }
  if (objc_msgSend(v7, "conformsToIOClassName:", CFSTR("IOTimeSyncUnicastLinkLayerEtEPort")))
  {
    v4 = *(void **)(a1 + 32);
    v5 = _TSF_TSDgPTPUnicastLinkLayerEtEPort;
    goto LABEL_19;
  }
  if (objc_msgSend(v7, "conformsToIOClassName:", CFSTR("IOTimeSyncUnicastUDPv4PtPPort")))
  {
    v4 = *(void **)(a1 + 32);
    v5 = _TSF_TSDgPTPUnicastUDPv4PtPPort;
    goto LABEL_19;
  }
  if (objc_msgSend(v7, "conformsToIOClassName:", CFSTR("IOTimeSyncUnicastUDPv6PtPPort")))
  {
    v4 = *(void **)(a1 + 32);
    v5 = _TSF_TSDgPTPUnicastUDPv6PtPPort;
    goto LABEL_19;
  }
  if (objc_msgSend(v7, "conformsToIOClassName:", CFSTR("IOTimeSyncUnicastUDPv4EtEPort")))
  {
    v4 = *(void **)(a1 + 32);
    v5 = _TSF_TSDgPTPUnicastUDPv4EtEPort;
    goto LABEL_19;
  }
  if (objc_msgSend(v7, "conformsToIOClassName:", CFSTR("IOTimeSyncUnicastUDPv6EtEPort")))
  {
    v4 = *(void **)(a1 + 32);
    v5 = _TSF_TSDgPTPUnicastUDPv6EtEPort;
    goto LABEL_19;
  }
  if (objc_msgSend(v7, "conformsToIOClassName:", CFSTR("IOTimeSyncLocalClockPort")))
  {
    v4 = *(void **)(a1 + 32);
    v5 = _TSF_TSDgPTPLocalClockPort;
    goto LABEL_19;
  }
  if (objc_msgSend(v7, "conformsToIOClassName:", CFSTR("IOTimeSyncPort")))
  {
    v4 = *(void **)(a1 + 32);
    v5 = _TSF_TSDgPTPPort;
    goto LABEL_19;
  }
LABEL_20:
  objc_autoreleasePoolPop(v3);

}

@end
