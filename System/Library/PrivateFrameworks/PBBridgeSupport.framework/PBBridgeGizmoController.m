@implementation PBBridgeGizmoController

- (PBBridgeGizmoController)init
{
  PBBridgeGizmoController *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PBBridgeGizmoController;
  v2 = -[PBBridgeGizmoController init](&v4, sel_init);
  if (v2)
    xpc_set_event_stream_handler("com.apple.notifyd.matching", MEMORY[0x24BDAC9B8], &__block_literal_global_7);
  return v2;
}

- (void)setupServiceMessageSelectorMappings
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
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
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProtobufAction:forIncomingRequestsOfType:", sel_companionBecameAvailableWantsConfirmation_, 1);

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProtobufAction:forIncomingRequestsOfType:", sel_pushControllerType_, 3);

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setProtobufAction:forIncomingRequestsOfType:", sel_popToControllerType_, 4);

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProtobufAction:forIncomingRequestsOfType:", sel_handleActivationData_, 2);

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProtobufAction:forIncomingRequestsOfType:", sel_setCompanionLanguage_, 5);

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setProtobufAction:forIncomingRequestsOfType:", sel_setCompanionRegion_, 6);

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setProtobufAction:forIncomingRequestsOfType:", sel_gotSiriState_, 7);

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setProtobufAction:forIncomingRequestsOfType:", sel_setLocationEnabled_, 8);

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setProtobufAction:forIncomingRequestsOfType:", sel_setDiagnosticsEnabled_, 10);

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setProtobufAction:forIncomingRequestsOfType:", sel_setCanBeginActivating_, 11);

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setProtobufAction:forIncomingRequestsOfType:", sel_waitForDynamicActivationEventPresentation_, 22);

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setProtobufAction:forIncomingRequestsOfType:", sel_waitForUserResponseToDynamicEventPresentation_, 23);

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setProtobufAction:forIncomingRequestsOfType:", sel_retryActivation_, 15);

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setProtobufAction:forIncomingRequestsOfType:", sel_handleWarrantySentinelRequest_, 14);

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setProtobufAction:forIncomingRequestsOfType:", sel_handleOfflineTermsRequest_, 16);

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setProtobufAction:forIncomingRequestsOfType:", sel_showLockedOnAnimation_, 17);

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setProtobufAction:forIncomingRequestsOfType:", sel_setCrownOrientationRight_, 18);

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setProtobufAction:forIncomingRequestsOfType:", sel_setPasscodeRestrictions_, 20);

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setProtobufAction:forIncomingRequestsOfType:", sel_updateSynchProgress_, 19);

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setProtobufAction:forIncomingRequestsOfType:", sel_doInitialSyncPrep_, 21);

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setProtobufAction:forIncomingRequestsOfType:", sel_remoteRequestToKeepAlive_, 24);

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setProtobufAction:forIncomingRequestsOfType:", sel_companionDidSendLanguageAndLocale_, 25);

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setProtobufAction:forIncomingRequestsOfType:", sel_companionDidSendDemoWirelessCredentials_, 26);

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setProtobufAction:forIncomingRequestsOfType:", sel_prepareForForcedWatchSU_, 27);

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setProtobufAction:forIncomingRequestsOfType:", sel_fetchTermsAndConditions_, 102);

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setProtobufAction:forIncomingRequestsOfType:", sel_companionTermsResponse_, 103);

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setProtobufAction:forIncomingRequestsOfType:", sel_setSiriEnabled_, 28);

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setProtobufAction:forIncomingRequestsOfType:", sel_returnProxiedDeviceForDeviceWithData_, 29);

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setProtobufAction:forIncomingRequestsOfType:", sel_setComputedTimeZone_, 111);

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setProtobufAction:forIncomingRequestsOfType:", sel_ingestTinkerCredentials_, 30);

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setProtobufAction:forIncomingRequestsOfType:", sel_companionDidSendTinkerWirelessCredentials_, 104);

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setProtobufAction:forIncomingRequestsOfType:", sel_setMessagesInCloudEnabledForTinker_, 31);

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setProtobufAction:forIncomingRequestsOfType:", sel_setFitnessRouteAuthorizationForTinker_, 33);

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setProtobufAction:forIncomingRequestsOfType:", sel_handleRenameDeviceRequest_, 110);

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "setProtobufAction:forIncomingRequestsOfType:", sel_handleBuysOnWatchIngestion_, 32);

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setProtobufAction:forIncomingRequestsOfType:", sel_handleSetLauncherViewModeForTinker_, 112);

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setProtobufAction:forIncomingRequestsOfType:", sel_provideAppViewListImage_, 113);

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setProtobufAction:forIncomingRequestsOfType:", sel_setupDeviceManagement_, 34);

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "setProtobufAction:forIncomingRequestsOfType:", sel_checkAppInstallationAllowed_, 35);

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setProtobufAction:forIncomingRequestsOfType:", sel_updateNanoRegistryToNormalState_, 36);

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v43 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setProtobufAction:forIncomingRequestsOfType:", sel_processReceivedPairingWirelessCredentials_, 37);

}

- (void)endSetupTransaction
{
  NSTimer *activationTimeout;
  id updateLanguageCompletion;
  id updateRegionCompletion;
  id sessionCompletion;
  id activationCompletion;
  id siriStateCompletion;
  id enableSiriCompletion;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PBBridgeGizmoController;
  -[PBBridgeIDSServiceDelegate endSetupTransaction](&v10, sel_endSetupTransaction);
  self->_activationState = 0;
  -[NSTimer invalidate](self->_activationTimeout, "invalidate");
  activationTimeout = self->_activationTimeout;
  self->_activationTimeout = 0;

  updateLanguageCompletion = self->_updateLanguageCompletion;
  self->_updateLanguageCompletion = 0;

  updateRegionCompletion = self->_updateRegionCompletion;
  self->_updateRegionCompletion = 0;

  sessionCompletion = self->_sessionCompletion;
  self->_sessionCompletion = 0;

  activationCompletion = self->_activationCompletion;
  self->_activationCompletion = 0;

  siriStateCompletion = self->_siriStateCompletion;
  self->_siriStateCompletion = 0;

  enableSiriCompletion = self->_enableSiriCompletion;
  self->_enableSiriCompletion = 0;

}

- (void)setActivationState:(unsigned __int16)a3
{
  NSObject *v5;
  const __CFString *v6;
  const __CFString *v7;
  int v8;
  const __CFString *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (self->_activationState >= a3)
  {
    pbb_activation_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      if ((unsigned __int16)(self->_activationState - 2) > 3u)
        v6 = CFSTR("Idle");
      else
        v6 = off_24CBBEAF0[(__int16)(self->_activationState - 2)];
      if ((unsigned __int16)(a3 - 2) > 3u)
        v7 = CFSTR("Idle");
      else
        v7 = off_24CBBEAF0[(__int16)(a3 - 2)];
      v8 = 138412546;
      v9 = v6;
      v10 = 2112;
      v11 = v7;
      _os_log_impl(&dword_2113B6000, v5, OS_LOG_TYPE_DEFAULT, "Prevented misordered state change (%@ --> %@)", (uint8_t *)&v8, 0x16u);
    }

  }
  else
  {
    self->_activationState = a3;
  }
}

- (id)serviceIdentifier
{
  return CFSTR("com.apple.private.alloy.pbbridge");
}

- (BOOL)_sendRemoteCommandWithMessageID:(unsigned __int16)a3 withArguments:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  PBBProtoBecameActive *v9;
  void *v10;
  void *v11;
  void *v12;
  PBBProtoProxyActivationFetch *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  PBBProtoDemoWatchDidIngestWirelessCredentials *v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  NSString *v41;
  NSString *internalLastSendMessageID;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  id v52;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  void *v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v4 = a3;
  v59 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = v6;
  switch((int)v4)
  {
    case 1:
      v9 = objc_alloc_init(PBBProtoBecameActive);
      objc_msgSend(v7, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBBProtoBecameActive setWantsConfirmation:](v9, "setWantsConfirmation:", objc_msgSend(v10, "BOOLValue"));
      goto LABEL_34;
    case 2:
      objc_msgSend(v6, "firstObject");
      v9 = (PBBProtoBecameActive *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1618]), "initRequiringSecureCoding:", 1);
      objc_msgSend(v11, "encodeObject:forKey:", v9, CFSTR("PBBridgeActivationRequestKey"));
      objc_msgSend(v11, "finishEncoding");
      objc_msgSend(v11, "encodedData");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_alloc_init(PBBProtoProxyActivationFetch);
      -[PBBProtoProxyActivationFetch setRequest:](v13, "setRequest:", v12);
      -[PBBProtoProxyActivationFetch data](v13, "data");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_23;
    case 7:
      v9 = objc_alloc_init(PBBProtoDidEndPasscodeCreation);
      objc_msgSend(v7, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBBProtoBecameActive setSuccess:](v9, "setSuccess:", objc_msgSend(v14, "BOOLValue"));

      objc_msgSend(v7, "objectAtIndex:", 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBBProtoBecameActive setIsLong:](v9, "setIsLong:", objc_msgSend(v10, "BOOLValue"));
      goto LABEL_34;
    case 12:
      v9 = objc_alloc_init(PBBProtoGizmoActivationFailed);
      objc_msgSend(v7, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBBProtoBecameActive setFailureDescription:](v9, "setFailureDescription:", v10);
      goto LABEL_34;
    case 13:
      v9 = objc_alloc_init(PBBProtoDidMakeAutoLockChoice);
      objc_msgSend(v7, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBBProtoBecameActive setAccept:](v9, "setAccept:", objc_msgSend(v10, "BOOLValue"));
      goto LABEL_34;
    case 16:
      v9 = objc_alloc_init(PBBProtoTransferPerformanceResults);
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      v51 = 0u;
      +[PBBridgeResponsePerformanceMonitor shareMonitor](PBBridgeResponsePerformanceMonitor, "shareMonitor");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "milestones");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "allValues");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v49;
        do
        {
          v21 = 0;
          do
          {
            if (*(_QWORD *)v49 != v20)
              objc_enumerationMutation(v17);
            objc_msgSend(v11, "addObject:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * v21++));
          }
          while (v19 != v21);
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v48, v58, 16);
        }
        while (v19);
      }

      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v47 = 0u;
      +[PBBridgeResponsePerformanceMonitor shareMonitor](PBBridgeResponsePerformanceMonitor, "shareMonitor", 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "macroActivities");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "allValues");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v44, v57, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v45;
        do
        {
          v28 = 0;
          do
          {
            if (*(_QWORD *)v45 != v27)
              objc_enumerationMutation(v24);
            objc_msgSend(v12, "addObject:", *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v28++));
          }
          while (v26 != v28);
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v44, v57, 16);
        }
        while (v26);
      }

      +[PBBridgeResponsePerformanceMonitor shareMonitor](PBBridgeResponsePerformanceMonitor, "shareMonitor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "measurements");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)objc_msgSend(v30, "mutableCopy");

      -[PBBProtoBecameActive setMilestones:](v9, "setMilestones:", v11);
      -[PBBProtoBecameActive setMacroActivites:](v9, "setMacroActivites:", v12);
      -[PBBProtoBecameActive setMeasures:](v9, "setMeasures:", v31);
      -[PBBProtoBecameActive data](v9, "data");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_23:
      goto LABEL_37;
    case 17:
      v9 = objc_alloc_init(PBBProtoDidFailToCreatePasscode);
      objc_msgSend(v7, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBBProtoBecameActive setError:](v9, "setError:", objc_msgSend(v10, "intValue"));
      goto LABEL_34;
    case 20:
      v9 = objc_alloc_init(PBBProtoTellCompanionLanguageAndLocaleChangeStatus);
      objc_msgSend(v7, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBBProtoBecameActive setStatus:](v9, "setStatus:", (double)objc_msgSend(v10, "integerValue"));
      goto LABEL_34;
    case 22:
      v32 = objc_alloc_init(PBBProtoDemoWatchDidIngestWirelessCredentials);
      v9 = (PBBProtoBecameActive *)v32;
      goto LABEL_36;
    case 27:
      if (objc_msgSend(v6, "count") == 1)
      {
        v9 = objc_alloc_init(PBBProtoRemoteActivationFailureReport);
        objc_msgSend(v7, "firstObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = 0;
        objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 1, &v52);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v52;
        if (v34)
        {
          pbb_activation_log();
          v35 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            -[PBBridgeGizmoController _sendRemoteCommandWithMessageID:withArguments:].cold.1();

        }
        -[PBBProtoBecameActive setActivationError:](v9, "setActivationError:", v33);

LABEL_34:
      }
      else
      {
        v9 = 0;
      }
      v32 = (PBBProtoDemoWatchDidIngestWirelessCredentials *)v9;
LABEL_36:
      -[PBBProtoDemoWatchDidIngestWirelessCredentials data](v32, "data");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_37:

LABEL_38:
      v36 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4FE40]), "initWithProtobufData:type:isResponse:", v8, v4, 0);
      pbb_setupflow_log();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        PBBCMessageDescription(v4);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v54 = v38;
        v55 = 2112;
        v56 = v36;
        _os_log_impl(&dword_2113B6000, v37, OS_LOG_TYPE_DEFAULT, "Sending Protobuf (%@ -- %@)", buf, 0x16u);

      }
      -[PBBridgeIDSServiceDelegate service](self, "service");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBBridgeIDSServiceDelegate sendProtoBuf:service:priority:responseIdentifier:expectsResponse:retryCount:retryInterval:](self, "sendProtoBuf:service:priority:responseIdentifier:expectsResponse:retryCount:retryInterval:", v36, v39, 300, 0, 0, -1, -1.0);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4 <= 0x15 && ((1 << v4) & 0x20101C) != 0 && PBIsInternalInstall())
      {
        v41 = (NSString *)objc_msgSend(v40, "copy");
        internalLastSendMessageID = self->_internalLastSendMessageID;
        self->_internalLastSendMessageID = v41;

      }
      return 0;
    case 29:
      v9 = objc_alloc_init(PBBProtoHealthSharingEnabled);
      objc_msgSend(v7, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBBProtoBecameActive setEnabled:](v9, "setEnabled:", objc_msgSend(v10, "BOOLValue"));
      goto LABEL_34;
    default:
      objc_msgSend(MEMORY[0x24BDBCE50], "data");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_38;
  }
}

- (BOOL)_sendResponseToMessage:(id)a3 withResponseMessageID:(unsigned __int16)a4 withArguments:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  PBBProtoWarrantySentinel *v11;
  void *v12;
  uint64_t v13;
  const __CFString *v14;
  CFPropertyListRef v15;
  void *v16;
  CFTypeID v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  __objc2_class *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  PBBProtoWarrantySentinel *v33;
  PBBProtoTermsAndConditions *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  CFPropertyListRef v43;
  const void *v44;
  CFTypeID v45;
  NSObject *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  NSObject *v55;
  void *v56;
  NSObject *v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  uint64_t v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  id v71;
  void *v72;
  NSObject *v73;
  void *v74;
  id v75;
  uint64_t v76;
  NSObject *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  id v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  PBBProtoWarrantySentinel *v120;
  _QWORD v121[3];
  uint8_t buf[4];
  uint64_t v123;
  __int16 v124;
  uint64_t v125;
  __int16 v126;
  uint64_t v127;
  __int16 v128;
  uint64_t v129;
  uint64_t v130;

  v6 = a4;
  v130 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = 0;
  switch((int)v6)
  {
    case 14:
      v11 = objc_alloc_init(PBBProtoWarrantySentinel);
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "fileExistsAtPath:", CFSTR("/var/mobile/Media/iTunes_Control/iTunes/ShowWarranty"));

      -[PBBProtoWarrantySentinel setSentinelExists:](v11, "setSentinelExists:", v13);
      v14 = (const __CFString *)*MEMORY[0x24BDBD568];
      CFPreferencesAppSynchronize((CFStringRef)*MEMORY[0x24BDBD568]);
      v15 = CFPreferencesCopyAppValue(CFSTR("AppleLanguages"), v14);
      if (!v15)
        goto LABEL_36;
      v16 = (void *)v15;
      v17 = CFGetTypeID(v15);
      if (v17 == CFArrayGetTypeID())
      {
        v18 = (void *)objc_msgSend(v16, "mutableCopy");

      }
      else
      {
        CFRelease(v16);
LABEL_36:
        v18 = 0;
      }
      -[PBBProtoWarrantySentinel setAppleLanguages:](v11, "setAppleLanguages:", v18);
      CFPreferencesAppSynchronize(v14);
      v43 = CFPreferencesCopyAppValue(CFSTR("AppleLocale"), v14);
      if (v43)
      {
        v44 = v43;
        v45 = CFGetTypeID(v43);
        if (v45 == CFStringGetTypeID())
          -[PBBProtoWarrantySentinel setAppleLocale:](v11, "setAppleLocale:", v44);
        CFRelease(v44);
      }
      pbb_setupflow_log();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v123) = v13;
        _os_log_impl(&dword_2113B6000, v46, OS_LOG_TYPE_DEFAULT, "Warranty Sentinel exists: (%d)", buf, 8u);
      }

      -[PBBProtoWarrantySentinel data](v11, "data");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_31;
    case 15:
      objc_msgSend((id)objc_opt_class(), "prepareOfflineTermsResponse:", v9);
      v11 = (PBBProtoWarrantySentinel *)objc_claimAutoreleasedReturnValue();
      pbb_setupflow_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        -[PBBProtoWarrantySentinel license](v11, "license");
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v119, "length");
        -[PBBProtoWarrantySentinel multiterms](v11, "multiterms");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "length");
        -[PBBProtoWarrantySentinel warranty](v11, "warranty");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218752;
        v123 = (uint64_t)v11;
        v124 = 2048;
        v125 = v21;
        v126 = 2048;
        v127 = v23;
        v128 = 2048;
        v129 = objc_msgSend(v24, "length");
        _os_log_impl(&dword_2113B6000, v20, OS_LOG_TYPE_DEFAULT, "Offline Terms response: (%p); license: (%lu bytes); multiterms: (%lu bytes); warranty: (%lu bytes);",
          buf,
          0x2Au);

      }
      goto LABEL_28;
    case 16:
    case 17:
    case 19:
    case 20:
    case 21:
    case 22:
    case 24:
    case 27:
    case 28:
    case 29:
      goto LABEL_32;
    case 18:
      v25 = PBBProtoPrepareWatchForInitialSyncResponse;
      goto LABEL_25;
    case 23:
      v25 = PBBProtoPrepareWatchForForcedSUResponse;
      goto LABEL_25;
    case 25:
      v11 = objc_alloc_init(PBBProtoRemoteAccountForDevice);
      objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
      v20 = objc_claimAutoreleasedReturnValue();
      -[PBBProtoWarrantySentinel setSerializedDevice:](v11, "setSerializedDevice:", v20);
      goto LABEL_28;
    case 26:
      v11 = objc_alloc_init(PBBProtoTinkerAccountCredentialsIngested);
      pbb_setupflow_log();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v123 = (uint64_t)v9;
        _os_log_impl(&dword_2113B6000, v26, OS_LOG_TYPE_DEFAULT, "Got message PBBCMessageIDDidIngestAcountCredentialsForTinkerDevice: %@", buf, 0xCu);
      }

      objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBBProtoWarrantySentinel setSuccess:](v11, "setSuccess:", objc_msgSend(v27, "BOOLValue"));

      objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBBProtoWarrantySentinel setCdpStatus:](v11, "setCdpStatus:", objc_msgSend(v28, "unsignedIntegerValue"));

      objc_msgSend(v9, "objectAtIndexedSubscript:", 2);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBBProtoWarrantySentinel setErrorDescription:](v11, "setErrorDescription:", v29);

      if (objc_msgSend(v9, "count") != 4)
        goto LABEL_29;
      objc_msgSend(v9, "objectAtIndexedSubscript:", 3);
      v20 = objc_claimAutoreleasedReturnValue();
      -[PBBProtoWarrantySentinel setDetailedError:](v11, "setDetailedError:", v20);
      goto LABEL_28;
    case 30:
      v11 = objc_alloc_init(PBBProtoAcknowledgeBuysOnWatchCredentialIngestion);
      objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBBProtoWarrantySentinel setSuccess:](v11, "setSuccess:", objc_msgSend(v30, "BOOLValue"));

      objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBBProtoWarrantySentinel setErrorCode:](v11, "setErrorCode:", objc_msgSend(v31, "integerValue"));

      objc_msgSend(v9, "objectAtIndexedSubscript:", 2);
      v20 = objc_claimAutoreleasedReturnValue();
      -[PBBProtoWarrantySentinel setErrorDescription:](v11, "setErrorDescription:", v20);
      goto LABEL_28;
    case 31:
      v11 = objc_alloc_init(PBBProtoDeviceManagementSetupResponse);
      objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBBProtoWarrantySentinel setSuccess:](v11, "setSuccess:", v32 != 0);

      if ((unint64_t)objc_msgSend(v9, "count") < 2)
        goto LABEL_29;
      objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
      v20 = objc_claimAutoreleasedReturnValue();
      -[PBBProtoWarrantySentinel setError:](v11, "setError:", v20);
      goto LABEL_28;
    case 32:
      v11 = objc_alloc_init(PBBProtoApplicationInstallRestrictionResponse);
      objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
      v20 = objc_claimAutoreleasedReturnValue();
      -[PBBProtoWarrantySentinel setAllowed:](v11, "setAllowed:", -[NSObject BOOLValue](v20, "BOOLValue"));
      goto LABEL_28;
    case 33:
      v25 = PBBProtoWatchDidApplyWirelessCredentials;
LABEL_25:
      v33 = (PBBProtoWarrantySentinel *)objc_alloc_init(v25);
      v11 = v33;
      goto LABEL_30;
    default:
      if ((_DWORD)v6 != 101)
      {
        if ((_DWORD)v6 != 102)
          goto LABEL_32;
        v11 = objc_alloc_init(PBBProtoAppViewListImageResponse);
        if (v9)
        {
          objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[PBBProtoWarrantySentinel setImageData:](v11, "setImageData:", v19);

        }
        pbb_setupflow_log();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v123 = (uint64_t)v11;
          _os_log_impl(&dword_2113B6000, v20, OS_LOG_TYPE_DEFAULT, ">>>> sending appViewListImageResponse %@", buf, 0xCu);
        }
        goto LABEL_28;
      }
      v34 = objc_alloc_init(PBBProtoTermsAndConditions);
      v11 = (PBBProtoWarrantySentinel *)v34;
      if (v9)
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
        v20 = objc_claimAutoreleasedReturnValue();
        -[PBBProtoWarrantySentinel setServerTerms:](v11, "setServerTerms:", v20);
LABEL_28:

        goto LABEL_29;
      }
      v120 = (PBBProtoWarrantySentinel *)v34;
      objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "objectForKey:", *MEMORY[0x24BDBCB20]);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "lowercaseString");
      v49 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "objectForKey:", *MEMORY[0x24BDBCAE8]);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "uppercaseString");
      v52 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
      v116 = (void *)v52;
      v117 = (void *)v49;
      v121[0] = v49;
      v121[1] = v52;
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = (void *)objc_msgSend(v115, "mutableCopy");
      v121[2] = v53;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v121, 3);
      v54 = objc_claimAutoreleasedReturnValue();

      pbb_setupflow_log();
      v55 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v123 = v54;
        _os_log_impl(&dword_2113B6000, v55, OS_LOG_TYPE_DEFAULT, "args %@", buf, 0xCu);
      }

      v114 = (void *)v54;
      objc_msgSend((id)objc_opt_class(), "prepareOfflineTermsResponse:", v54);
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      pbb_setupflow_log();
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v56, "license");
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = objc_msgSend(v111, "length");
        objc_msgSend(v56, "multiterms");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = objc_msgSend(v59, "length");
        objc_msgSend(v56, "warranty");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = objc_msgSend(v61, "length");
        *(_DWORD *)buf = 134218752;
        v123 = (uint64_t)v56;
        v124 = 2048;
        v125 = v58;
        v126 = 2048;
        v127 = v60;
        v128 = 2048;
        v129 = v62;
        _os_log_impl(&dword_2113B6000, v57, OS_LOG_TYPE_DEFAULT, "Offline Terms response: (%p); license: (%lu bytes); multiterms: (%lu bytes); warranty: (%lu bytes);",
          buf,
          0x2Au);

      }
      v118 = v56;
      if (objc_msgSend(v56, "hasMultiterms"))
      {
        v63 = objc_alloc(MEMORY[0x24BDD17C8]);
        objc_msgSend(v56, "multiterms");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        v112 = (void *)objc_msgSend(v63, "initWithData:encoding:", v64, 4);

        v103 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v105, "localizedStringForKey:value:table:", CFSTR("TERMS_AND_CONDITIONS"), &stru_24CBBF548, CFSTR("Localizable"));
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v104, "localizedStringForKey:value:table:", CFSTR("IMPORTANT"), &stru_24CBBF548, CFSTR("Localizable"));
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "localizedStringForKey:value:table:", CFSTR("Part1"), &stru_24CBBF548, CFSTR("Localizable"));
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v101, "localizedStringForKey:value:table:", CFSTR("TC_HEADER"), &stru_24CBBF548, CFSTR("Localizable"));
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "localizedStringForKey:value:table:", CFSTR("WARRANTY_HEADER"), &stru_24CBBF548, CFSTR("Localizable"));
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v99, "localizedStringForKey:value:table:", CFSTR("Part2"), &stru_24CBBF548, CFSTR("Localizable"));
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "localizedStringForKey:value:table:", CFSTR("Part3"), &stru_24CBBF548, CFSTR("Localizable"));
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v95, "localizedStringForKey:value:table:", CFSTR("AGREE"), &stru_24CBBF548, CFSTR("Localizable"));
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "localizedStringForKey:value:table:", CFSTR("DISAGREE"), &stru_24CBBF548, CFSTR("Localizable"));
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v103, "stringWithFormat:", v112, v109, v108, v107, v106, v98, v96, v94, v65, v67);
        v68 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v68, "dataUsingEncoding:", 4);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = objc_alloc(MEMORY[0x24BDD17C8]);
        v71 = objc_retainAutorelease(v69);
        v72 = (void *)objc_msgSend(v70, "initWithBytes:length:encoding:", objc_msgSend(v71, "bytes"), objc_msgSend(v71, "length"), 4);
        pbb_setupflow_log();
        v73 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v123 = (uint64_t)v72;
          _os_log_impl(&dword_2113B6000, v73, OS_LOG_TYPE_DEFAULT, "bodyString: %@", buf, 0xCu);
        }

        -[PBBProtoWarrantySentinel setMultiterms:](v120, "setMultiterms:", v71);
        v56 = v118;
      }
      objc_msgSend(v56, "license");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = objc_alloc(MEMORY[0x24BDD17C8]);
      v113 = objc_retainAutorelease(v74);
      v76 = objc_msgSend(v75, "initWithBytes:length:encoding:", objc_msgSend(v113, "bytes"), objc_msgSend(v113, "length"), 4);
      pbb_setupflow_log();
      v77 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v123 = v76;
        _os_log_impl(&dword_2113B6000, v77, OS_LOG_TYPE_DEFAULT, "license: %@", buf, 0xCu);
      }

      objc_msgSend(v56, "warranty");
      v78 = (void *)objc_claimAutoreleasedReturnValue();
      v110 = (void *)v76;
      v11 = v120;
      -[PBBProtoWarrantySentinel setWarranty:](v120, "setWarranty:", v78);

      objc_msgSend(v56, "license");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBBProtoWarrantySentinel setLicense:](v120, "setLicense:", v79);

      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "localizedStringForKey:value:table:", CFSTR("TERMS_AND_CONDITIONS"));
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBBProtoWarrantySentinel setLicenseLabel:](v120, "setLicenseLabel:", v81);

      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v82, "localizedStringForKey:value:table:", CFSTR("WARRANTY"), &stru_24CBBF548, CFSTR("Localizable"));
      v83 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBBProtoWarrantySentinel setWarrantyLabel:](v120, "setWarrantyLabel:", v83);

      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "localizedStringForKey:value:table:", CFSTR("AGREE_DIALOG_TITLE"), &stru_24CBBF548, CFSTR("Localizable"));
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBBProtoWarrantySentinel setAgreeDialogTitle:](v120, "setAgreeDialogTitle:", v85);

      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "localizedStringForKey:value:table:", CFSTR("AGREE_DIALOG_TEXT"), &stru_24CBBF548);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBBProtoWarrantySentinel setAgreeDialogText:](v120, "setAgreeDialogText:", v87);

      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v88 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "localizedStringForKey:value:table:", CFSTR("AGREE"), &stru_24CBBF548, CFSTR("Localizable"));
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBBProtoWarrantySentinel setAgreeLabel:](v120, "setAgreeLabel:", v89);

      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v90 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v90, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24CBBF548, CFSTR("Localizable"));
      v91 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBBProtoWarrantySentinel setCancelLabel:](v120, "setCancelLabel:", v91);

      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "localizedStringForKey:value:table:", CFSTR("DISAGREE"), &stru_24CBBF548, CFSTR("Localizable"));
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBBProtoWarrantySentinel setDisagreeLabel:](v120, "setDisagreeLabel:", v93);

LABEL_29:
      v33 = v11;
LABEL_30:
      -[PBBProtoWarrantySentinel data](v33, "data");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_31:

LABEL_32:
      v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4FE40]), "initWithProtobufData:type:isResponse:", v10, v6, 1);
      pbb_setupflow_log();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        PBBCMessageDescription(v6);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v123 = (uint64_t)v37;
        v124 = 2112;
        v125 = (uint64_t)v35;
        _os_log_impl(&dword_2113B6000, v36, OS_LOG_TYPE_DEFAULT, "Sending Response Protobuf (%@ -- %@)", buf, 0x16u);

      }
      -[PBBridgeIDSServiceDelegate service](self, "service");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "context");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "outgoingResponseIdentifier");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = -[PBBridgeIDSServiceDelegate sendProtoBuf:service:priority:responseIdentifier:expectsResponse:retryCount:retryInterval:](self, "sendProtoBuf:service:priority:responseIdentifier:expectsResponse:retryCount:retryInterval:", v35, v38, 300, v40, 0, -1, -1.0);

      return 0;
  }
}

- (BOOL)updateLanguageIdentifierWithCompletion:(id)a3
{
  void *v4;
  id updateLanguageCompletion;

  v4 = (void *)objc_msgSend(a3, "copy");
  updateLanguageCompletion = self->_updateLanguageCompletion;
  self->_updateLanguageCompletion = v4;

  return -[PBBridgeGizmoController _sendRemoteCommandWithMessageID:withArguments:](self, "_sendRemoteCommandWithMessageID:withArguments:", 5, MEMORY[0x24BDBD1A8]);
}

- (BOOL)updateRegionIdentifierWithCompletion:(id)a3
{
  void *v4;
  id updateRegionCompletion;

  v4 = (void *)objc_msgSend(a3, "copy");
  updateRegionCompletion = self->_updateRegionCompletion;
  self->_updateRegionCompletion = v4;

  return -[PBBridgeGizmoController _sendRemoteCommandWithMessageID:withArguments:](self, "_sendRemoteCommandWithMessageID:withArguments:", 6, MEMORY[0x24BDBD1A8]);
}

- (BOOL)tellCompanionGizmoBeganActivating
{
  return -[PBBridgeGizmoController _sendRemoteCommandWithMessageID:withArguments:](self, "_sendRemoteCommandWithMessageID:withArguments:", 3, MEMORY[0x24BDBD1A8]);
}

- (void)_recordThatWatchFinishedActivating
{
  -[PBBridgeGizmoController invalidateTimeoutTimer](self, "invalidateTimeoutTimer");
  self->_activationState = 1;
}

- (BOOL)tellCompanionGizmoFinishedActivating
{
  -[PBBridgeGizmoController _recordThatWatchFinishedActivating](self, "_recordThatWatchFinishedActivating");
  return -[PBBridgeGizmoController _sendRemoteCommandWithMessageID:withArguments:](self, "_sendRemoteCommandWithMessageID:withArguments:", 4, MEMORY[0x24BDBD1A8]);
}

- (BOOL)tellCompanionGizmoFinishedActivatingAsDeKOTA
{
  -[PBBridgeGizmoController _recordThatWatchFinishedActivating](self, "_recordThatWatchFinishedActivating");
  return -[PBBridgeGizmoController _sendRemoteCommandWithMessageID:withArguments:](self, "_sendRemoteCommandWithMessageID:withArguments:", 21, MEMORY[0x24BDBD1A8]);
}

- (BOOL)tellCompanionGizmoFailedActivating:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PBBridgeGizmoController invalidateTimeoutTimer](self, "invalidateTimeoutTimer");
  self->_activationState = 1;
  v7[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(self) = -[PBBridgeGizmoController _sendRemoteCommandWithMessageID:withArguments:](self, "_sendRemoteCommandWithMessageID:withArguments:", 12, v5);
  return (char)self;
}

- (void)tellCompanionGizmoFinishedHealthSharingOptInWithSelection:(BOOL)a3
{
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBBridgeGizmoController _sendRemoteCommandWithMessageID:withArguments:](self, "_sendRemoteCommandWithMessageID:withArguments:", 29, v5);

}

- (void)setCompanionLanguage:(id)a3
{
  id v4;
  NSObject *v5;
  PBBProtoSetLanguage *v6;
  void *v7;
  PBBProtoSetLanguage *v8;
  void *v9;
  NSString *v10;
  NSString *languageIdentifer;
  void (**updateLanguageCompletion)(id, NSString *);
  id v13;
  _DWORD v14[2];
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pbb_setupflow_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v14[0] = 67109378;
    v14[1] = 534;
    v15 = 2080;
    v16 = "-[PBBridgeGizmoController setCompanionLanguage:]";
    _os_log_impl(&dword_2113B6000, v5, OS_LOG_TYPE_DEFAULT, "%d %s", (uint8_t *)v14, 0x12u);
  }

  v6 = [PBBProtoSetLanguage alloc];
  objc_msgSend(v4, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[PBBProtoSetLanguage initWithData:](v6, "initWithData:", v7);
  -[PBBProtoSetLanguage language](v8, "language");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (NSString *)objc_msgSend(v9, "copy");
  languageIdentifer = self->_languageIdentifer;
  self->_languageIdentifer = v10;

  updateLanguageCompletion = (void (**)(id, NSString *))self->_updateLanguageCompletion;
  if (updateLanguageCompletion)
  {
    updateLanguageCompletion[2](updateLanguageCompletion, self->_languageIdentifer);
    v13 = self->_updateLanguageCompletion;
    self->_updateLanguageCompletion = 0;

  }
}

- (void)setCompanionRegion:(id)a3
{
  id v4;
  NSObject *v5;
  PBBProtoSetRegion *v6;
  void *v7;
  PBBProtoSetRegion *v8;
  void *v9;
  NSString *v10;
  NSString *regionIdentifer;
  void (**updateRegionCompletion)(id, NSString *);
  id v13;
  _DWORD v14[2];
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pbb_setupflow_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v14[0] = 67109378;
    v14[1] = 548;
    v15 = 2080;
    v16 = "-[PBBridgeGizmoController setCompanionRegion:]";
    _os_log_impl(&dword_2113B6000, v5, OS_LOG_TYPE_DEFAULT, "%d %s", (uint8_t *)v14, 0x12u);
  }

  v6 = [PBBProtoSetRegion alloc];
  objc_msgSend(v4, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[PBBProtoSetRegion initWithData:](v6, "initWithData:", v7);
  -[PBBProtoSetRegion region](v8, "region");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (NSString *)objc_msgSend(v9, "copy");
  regionIdentifer = self->_regionIdentifer;
  self->_regionIdentifer = v10;

  updateRegionCompletion = (void (**)(id, NSString *))self->_updateRegionCompletion;
  if (updateRegionCompletion)
  {
    updateRegionCompletion[2](updateRegionCompletion, self->_regionIdentifer);
    v13 = self->_updateRegionCompletion;
    self->_updateRegionCompletion = 0;

  }
}

- (void)getSiriStateWithCompletion:(id)a3
{
  void *v4;
  id siriStateCompletion;

  v4 = (void *)objc_msgSend(a3, "copy");
  siriStateCompletion = self->_siriStateCompletion;
  self->_siriStateCompletion = v4;

  -[PBBridgeGizmoController _sendRemoteCommandWithMessageID:withArguments:](self, "_sendRemoteCommandWithMessageID:withArguments:", 8, MEMORY[0x24BDBD1A8]);
}

- (void)enableSiriForGizmoWithCompletion:(id)a3
{
  void *v4;
  id enableSiriCompletion;

  v4 = (void *)objc_msgSend(a3, "copy");
  enableSiriCompletion = self->_enableSiriCompletion;
  self->_enableSiriCompletion = v4;

  -[PBBridgeGizmoController _sendRemoteCommandWithMessageID:withArguments:](self, "_sendRemoteCommandWithMessageID:withArguments:", 9, MEMORY[0x24BDBD1A8]);
}

- (void)gotSiriState:(id)a3
{
  id v4;
  NSObject *v5;
  PBBProtoSiriEnabled *v6;
  void *v7;
  PBBProtoSiriEnabled *v8;
  void (**siriStateCompletion)(id, uint64_t);
  id v10;
  void *v11;
  double Current;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  _DWORD v17[2];
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pbb_setupflow_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v17[0] = 67109378;
    v17[1] = 574;
    v18 = 2080;
    v19 = "-[PBBridgeGizmoController gotSiriState:]";
    _os_log_impl(&dword_2113B6000, v5, OS_LOG_TYPE_DEFAULT, "%d %s", (uint8_t *)v17, 0x12u);
  }

  v6 = [PBBProtoSiriEnabled alloc];
  objc_msgSend(v4, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PBBProtoSiriEnabled initWithData:](v6, "initWithData:", v7);

  siriStateCompletion = (void (**)(id, uint64_t))self->_siriStateCompletion;
  if (siriStateCompletion)
  {
    siriStateCompletion[2](siriStateCompletion, -[PBBProtoSiriEnabled enabled](v8, "enabled"));
    v10 = self->_siriStateCompletion;
    self->_siriStateCompletion = 0;

  }
  if (PBLogPerformanceMetrics())
  {
    +[PBBridgeResponsePerformanceMonitor shareMonitor](PBBridgeResponsePerformanceMonitor, "shareMonitor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    Current = CFAbsoluteTimeGetCurrent();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "context");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "outgoingResponseIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addMilestone:activityType:activityIdentifier:", v14, v16, Current);

  }
}

- (void)enabledSiri:(id)a3
{
  void (**enableSiriCompletion)(id, SEL, id);
  id v5;

  enableSiriCompletion = (void (**)(id, SEL, id))self->_enableSiriCompletion;
  if (enableSiriCompletion)
  {
    enableSiriCompletion[2](enableSiriCompletion, a2, a3);
    v5 = self->_enableSiriCompletion;
    self->_enableSiriCompletion = 0;

  }
}

- (void)companionBecameAvailableWantsConfirmation:(id)a3
{
  id v4;
  PBBProtoBecameActive *v5;
  void *v6;
  PBBProtoBecameActive *v7;
  NSObject *v8;
  id WeakRetained;
  _DWORD v10[2];
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [PBBProtoBecameActive alloc];
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[PBBProtoBecameActive initWithData:](v5, "initWithData:", v6);
  pbb_setupflow_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109378;
    v10[1] = 600;
    v11 = 2080;
    v12 = "-[PBBridgeGizmoController companionBecameAvailableWantsConfirmation:]";
    _os_log_impl(&dword_2113B6000, v8, OS_LOG_TYPE_DEFAULT, "%d %s", (uint8_t *)v10, 0x12u);
  }

  if (!-[PBBProtoBecameActive wantsConfirmation](v7, "wantsConfirmation"))
    -[PBBridgeGizmoController _sendRemoteCommandWithMessageID:withArguments:](self, "_sendRemoteCommandWithMessageID:withArguments:", 1, &unk_24CBCE890);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "remoteDidBecomeAvailable");

}

- (BOOL)_getActivationData:(BOOL)a3 forRequest:(id)a4 withCompletion:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  int *v12;
  objc_class *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  BOOL v17;
  id v19;
  uint8_t buf[4];
  const char *v21;
  uint64_t v22;

  v6 = a3;
  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  pbb_activation_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v21 = "-[PBBridgeGizmoController _getActivationData:forRequest:withCompletion:]";
    _os_log_impl(&dword_2113B6000, v10, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  -[PBBridgeGizmoController invalidateTimeoutTimer](self, "invalidateTimeoutTimer");
  if (v6)
    v11 = 3;
  else
    v11 = 4;
  if (v6)
    v12 = &OBJC_IVAR___PBBridgeGizmoController__sessionCompletion;
  else
    v12 = &OBJC_IVAR___PBBridgeGizmoController__activationCompletion;
  -[PBBridgeGizmoController setActivationState:](self, "setActivationState:", v11);
  -[PBBridgeGizmoController refreshTimeoutTimer](self, "refreshTimeoutTimer");
  v13 = (objc_class *)objc_msgSend(v9, "copy");
  v14 = *v12;
  v15 = *(Class *)((char *)&self->super.super.isa + v14);
  *(Class *)((char *)&self->super.super.isa + v14) = v13;

  if (v8)
  {
    v19 = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v19, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[PBBridgeGizmoController _sendRemoteCommandWithMessageID:withArguments:](self, "_sendRemoteCommandWithMessageID:withArguments:", 2, v16);

  }
  else
  {
    v17 = -[PBBridgeGizmoController _sendRemoteCommandWithMessageID:withArguments:](self, "_sendRemoteCommandWithMessageID:withArguments:", 2, 0);
  }

  return v17;
}

- (BOOL)getActivationDataAndHeadersForRequest:(id)a3 withCompletion:(id)a4
{
  return -[PBBridgeGizmoController _getActivationData:forRequest:withCompletion:](self, "_getActivationData:forRequest:withCompletion:", 0, a3, a4);
}

- (BOOL)getSessionDataForRequest:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __67__PBBridgeGizmoController_getSessionDataForRequest_withCompletion___block_invoke;
  v11[3] = &unk_24CBBE9A0;
  v12 = v6;
  v7 = v6;
  v8 = a3;
  v9 = (void *)MEMORY[0x212BD94D4](v11);
  LOBYTE(self) = -[PBBridgeGizmoController _getActivationData:forRequest:withCompletion:](self, "_getActivationData:forRequest:withCompletion:", 1, v8, v9);

  return (char)self;
}

uint64_t __67__PBBridgeGizmoController_getSessionDataForRequest_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)getActivationDataForRequest:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __70__PBBridgeGizmoController_getActivationDataForRequest_withCompletion___block_invoke;
  v11[3] = &unk_24CBBE9A0;
  v12 = v6;
  v7 = v6;
  v8 = a3;
  v9 = (void *)MEMORY[0x212BD94D4](v11);
  LOBYTE(self) = -[PBBridgeGizmoController _getActivationData:forRequest:withCompletion:](self, "_getActivationData:forRequest:withCompletion:", 0, v8, v9);

  return (char)self;
}

uint64_t __70__PBBridgeGizmoController_getActivationDataForRequest_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)reportRemoteActivationFailureError:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v4 = (void *)MEMORY[0x24BDBCE30];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(self) = -[PBBridgeGizmoController _sendRemoteCommandWithMessageID:withArguments:](self, "_sendRemoteCommandWithMessageID:withArguments:", 27, v6, v8, v9);
  return (char)self;
}

- (void)handleActivationData:(id)a3
{
  id v4;
  id WeakRetained;
  int v6;
  NSObject *v7;
  PBBProtoHandleActivationData *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  double Current;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void (**sessionCompletion)(id, void *, _QWORD);
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void (**activationCompletion)(id, void *, void *);
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  id v47;
  _QWORD v48[2];
  uint8_t buf[4];
  _DWORD v50[7];

  *(_QWORD *)&v50[5] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[PBBridgeGizmoController invalidateTimeoutTimer](self, "invalidateTimeoutTimer");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = objc_msgSend(WeakRetained, "checkBrickedState");
  else
    v6 = 1;
  pbb_activation_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(_QWORD *)v50 = "-[PBBridgeGizmoController handleActivationData:]";
    _os_log_impl(&dword_2113B6000, v7, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (v6)
  {
    -[PBBridgeGizmoController setActivationState:](self, "setActivationState:", 5);
    -[PBBridgeGizmoController refreshTimeoutTimer](self, "refreshTimeoutTimer");
    v8 = [PBBProtoHandleActivationData alloc];
    objc_msgSend(v4, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PBBProtoHandleActivationData initWithData:](v8, "initWithData:", v9);

    if (PBLogPerformanceMetrics())
    {
      +[PBBridgeResponsePerformanceMonitor shareMonitor](PBBridgeResponsePerformanceMonitor, "shareMonitor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      Current = CFAbsoluteTimeGetCurrent();
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "context");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "outgoingResponseIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addMilestone:activityType:activityIdentifier:", v14, v16, Current);

    }
    pbb_activation_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      v50[0] = 685;
      LOWORD(v50[1]) = 2080;
      *(_QWORD *)((char *)&v50[1] + 2) = "-[PBBridgeGizmoController handleActivationData:]";
      _os_log_impl(&dword_2113B6000, v17, OS_LOG_TYPE_DEFAULT, "%d %s", buf, 0x12u);
    }

    sessionCompletion = (void (**)(id, void *, _QWORD))self->_sessionCompletion;
    if (sessionCompletion)
    {
      -[NSObject activationData](v10, "activationData");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      sessionCompletion[2](sessionCompletion, v19, 0);

      v20 = self->_sessionCompletion;
      self->_sessionCompletion = 0;
    }
    else if (self->_activationCompletion)
    {
      v28 = objc_alloc(MEMORY[0x24BDD1620]);
      -[NSObject responseHeaders](v10, "responseHeaders");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = 0;
      v30 = (void *)objc_msgSend(v28, "initForReadingFromData:error:", v29, &v47);
      v20 = v47;

      if (v20)
      {
        pbb_activation_log();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          -[PBBridgeGizmoController handleActivationData:].cold.2();

      }
      v32 = (void *)MEMORY[0x24BDBCF20];
      v48[0] = objc_opt_class();
      v48[1] = objc_opt_class();
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v48, 2);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setWithArray:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "decodeObjectOfClasses:forKey:", v34, CFSTR("PBBridgeActivationRequestKey"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = (void *)objc_msgSend(v35, "copy");

      objc_msgSend(v30, "finishDecoding");
      activationCompletion = (void (**)(id, void *, void *))self->_activationCompletion;
      -[NSObject activationData](v10, "activationData");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      activationCompletion[2](activationCompletion, v38, v36);

      v39 = self->_activationCompletion;
      self->_activationCompletion = 0;

    }
    else
    {
      pbb_activation_log();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        -[PBBridgeGizmoController handleActivationData:].cold.1(v20, v40, v41, v42, v43, v44, v45, v46);
    }

  }
  else
  {
    pbb_activation_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[PBBridgeGizmoController handleActivationData:].cold.3(v10, v21, v22, v23, v24, v25, v26, v27);
  }

  PBNotifyClientOfActivity();
}

- (void)setDiagnosticsEnabled:(id)a3
{
  id v3;
  PBBProtoDiagnosticsEnabled *v4;
  void *v5;
  PBBProtoDiagnosticsEnabled *v6;
  uint64_t v7;
  NSObject *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  double Current;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  _DWORD v17[2];
  __int16 v18;
  const char *v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = [PBBProtoDiagnosticsEnabled alloc];
  objc_msgSend(v3, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PBBProtoDiagnosticsEnabled initWithData:](v4, "initWithData:", v5);

  v7 = -[PBBProtoDiagnosticsEnabled enabled](v6, "enabled");
  pbb_setupflow_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = CFSTR("disabled");
    if ((_DWORD)v7)
      v9 = CFSTR("enabled");
    v17[0] = 67109634;
    v17[1] = 717;
    v18 = 2080;
    v19 = "-[PBBridgeGizmoController setDiagnosticsEnabled:]";
    v20 = 2112;
    v21 = v9;
    _os_log_impl(&dword_2113B6000, v8, OS_LOG_TYPE_DEFAULT, "%d %s %@", (uint8_t *)v17, 0x1Cu);
  }

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBoolValue:forSetting:", v7, *MEMORY[0x24BE638E0]);

  if (PBLogPerformanceMetrics())
  {
    +[PBBridgeResponsePerformanceMonitor shareMonitor](PBBridgeResponsePerformanceMonitor, "shareMonitor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    Current = CFAbsoluteTimeGetCurrent();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "context");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "outgoingResponseIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addMilestone:activityType:activityIdentifier:", v14, v16, Current);

  }
}

- (void)setLocationEnabled:(id)a3
{
  id v3;
  PBBProtoLocationServicesEnabled *v4;
  void *v5;
  PBBProtoLocationServicesEnabled *v6;
  uint64_t v7;
  NSObject *v8;
  const __CFString *v9;
  void *v10;
  double Current;
  objc_class *v12;
  void *v13;
  void *v14;
  void *v15;
  _DWORD v16[2];
  __int16 v17;
  const char *v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = [PBBProtoLocationServicesEnabled alloc];
  objc_msgSend(v3, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PBBProtoLocationServicesEnabled initWithData:](v4, "initWithData:", v5);

  v7 = -[PBBProtoLocationServicesEnabled enabled](v6, "enabled");
  pbb_setupflow_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = CFSTR("disabled");
    if ((_DWORD)v7)
      v9 = CFSTR("enabled");
    v16[0] = 67109634;
    v16[1] = 730;
    v17 = 2080;
    v18 = "-[PBBridgeGizmoController setLocationEnabled:]";
    v19 = 2112;
    v20 = v9;
    _os_log_impl(&dword_2113B6000, v8, OS_LOG_TYPE_DEFAULT, "%d %s %@", (uint8_t *)v16, 0x1Cu);
  }

  objc_msgSend(MEMORY[0x24BDBFA88], "setLocationServicesEnabled:", v7);
  if (PBLogPerformanceMetrics())
  {
    +[PBBridgeResponsePerformanceMonitor shareMonitor](PBBridgeResponsePerformanceMonitor, "shareMonitor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    Current = CFAbsoluteTimeGetCurrent();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "context");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "outgoingResponseIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addMilestone:activityType:activityIdentifier:", v13, v15, Current);

  }
}

- (void)setSiriEnabled:(id)a3
{
  id v3;
  PBBProtoSetSiriEnabled *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  PBBProtoSetSiriEnabled *v10;

  v3 = a3;
  v4 = [PBBProtoSetSiriEnabled alloc];
  objc_msgSend(v3, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[PBBProtoSetSiriEnabled initWithData:](v4, "initWithData:", v5);
  v6 = -[PBBProtoSetSiriEnabled enabled](v10, "enabled");
  objc_msgSend(getAFPreferencesClass(), "sharedPreferences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAssistantIsEnabled:", v6);

  objc_msgSend(getAFPreferencesClass(), "sharedPreferences");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDictationIsEnabled:", v6);

  objc_msgSend(getAFPreferencesClass(), "sharedPreferences");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "synchronize");

}

- (void)setFitnessRouteAuthorizationForTinker:(id)a3
{
  id v3;
  PBBProtoTinkerFitnessRouteTrackingEnabled *v4;
  void *v5;
  PBBProtoTinkerFitnessRouteTrackingEnabled *v6;
  _BOOL4 v7;
  NSObject *v8;
  const __CFString *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _DWORD v13[2];
  __int16 v14;
  const char *v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = [PBBProtoTinkerFitnessRouteTrackingEnabled alloc];
  objc_msgSend(v3, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[PBBProtoTinkerFitnessRouteTrackingEnabled initWithData:](v4, "initWithData:", v5);
  v7 = -[PBBProtoTinkerFitnessRouteTrackingEnabled enabled](v6, "enabled");
  pbb_setupflow_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = CFSTR("disabled");
    if (v7)
      v9 = CFSTR("enabled");
    v13[0] = 67109634;
    v13[1] = 777;
    v14 = 2080;
    v15 = "-[PBBridgeGizmoController setFitnessRouteAuthorizationForTinker:]";
    v16 = 2112;
    v17 = v9;
    _os_log_impl(&dword_2113B6000, v8, OS_LOG_TYPE_DEFAULT, "%d %s %@", (uint8_t *)v13, 0x1Cu);
  }

  v10 = (void *)MEMORY[0x24BDBFA88];
  if (v7)
    v11 = 4;
  else
    v11 = 2;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithPath:", CFSTR("/System/Library/LocationBundles/AppleWatchWorkout.bundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAuthorizationStatusByType:forBundle:", v11, v12);

}

- (void)companionDidSendLanguageAndLocale:(id)a3
{
  id v4;
  PBBProtoSendLanguageAndLocale *v5;
  void *v6;
  PBBProtoSendLanguageAndLocale *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  id WeakRetained;
  NSObject *v24;
  id v25;
  uint8_t buf[4];
  void *v27;
  _QWORD v28[7];

  v28[6] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [PBBProtoSendLanguageAndLocale alloc];
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[PBBProtoSendLanguageAndLocale initWithData:](v5, "initWithData:", v6);
  -[PBBProtoSendLanguageAndLocale appleLanguages](v7, "appleLanguages");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBBProtoSendLanguageAndLocale appleLocale](v7, "appleLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc(MEMORY[0x24BDD1620]);
  -[PBBProtoSendLanguageAndLocale archivedPreferences](v7, "archivedPreferences");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v12 = (void *)objc_msgSend(v10, "initForReadingFromData:error:", v11, &v25);
  v13 = v25;

  if (v13)
  {
    pbb_setupflow_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[PBBridgeGizmoController handleActivationData:].cold.2();

  }
  v15 = objc_alloc(MEMORY[0x24BDBCF20]);
  v28[0] = objc_opt_class();
  v28[1] = objc_opt_class();
  v28[2] = objc_opt_class();
  v28[3] = objc_opt_class();
  v28[4] = objc_opt_class();
  v28[5] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithArray:", v16);
  objc_msgSend(v12, "decodeObjectOfClasses:forKey:", v17, CFSTR("PBBridgeLocalePreferencesKey"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "copy");

  objc_msgSend(v12, "finishDecoding");
  pbb_setupflow_log();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v8;
    _os_log_impl(&dword_2113B6000, v20, OS_LOG_TYPE_DEFAULT, "languages %@", buf, 0xCu);
  }

  pbb_setupflow_log();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v9;
    _os_log_impl(&dword_2113B6000, v21, OS_LOG_TYPE_DEFAULT, "locale %@", buf, 0xCu);
  }

  pbb_setupflow_log();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v19;
    _os_log_impl(&dword_2113B6000, v22, OS_LOG_TYPE_DEFAULT, "localePreferences %@", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (v19 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "ingestLocalePreferences:", v19);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "selectLanguageFromAppleLanguages:andLocale:", v8, v9);
  }
  else
  {
    pbb_setupflow_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v9;
      _os_log_impl(&dword_2113B6000, v24, OS_LOG_TYPE_DEFAULT, "locale %@", buf, 0xCu);
    }

  }
}

- (void)companionDidSendDemoWirelessCredentials:(id)a3
{
  id v4;
  PBBProtoDemoWirelessCredentials *v5;
  void *v6;
  PBBProtoDemoWirelessCredentials *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  id WeakRetained;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [PBBProtoDemoWirelessCredentials alloc];
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[PBBProtoDemoWirelessCredentials initWithData:](v5, "initWithData:", v6);
  -[PBBProtoDemoWirelessCredentials ssid](v7, "ssid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBBProtoDemoWirelessCredentials password](v7, "password");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PBBProtoDemoWirelessCredentials companionDemoConfig](v7, "companionDemoConfig");
  pbb_setupflow_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412290;
    v14 = v8;
    _os_log_impl(&dword_2113B6000, v11, OS_LOG_TYPE_DEFAULT, "Received Credentials for %@", (uint8_t *)&v13, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "prepareWithNetwork:andPassword:withCompanionConfiguration:", v8, v9, v10);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "prepareWithNetwork:andPassword:", v8, v9);
  }
  -[PBBridgeGizmoController _sendRemoteCommandWithMessageID:withArguments:](self, "_sendRemoteCommandWithMessageID:withArguments:", 22, MEMORY[0x24BDBD1A8]);

}

- (void)companionDidSendTinkerWirelessCredentials:(id)a3
{
  id v4;
  PBBProtoTinkerWirelessCredentials *v5;
  void *v6;
  void *v7;
  PBBProtoTinkerWirelessCredentials *v8;

  v4 = a3;
  v5 = [PBBProtoTinkerWirelessCredentials alloc];
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[PBBProtoTinkerWirelessCredentials initWithData:](v5, "initWithData:", v6);
  -[PBBProtoTinkerWirelessCredentials serializedNetworkRecords](v8, "serializedNetworkRecords");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBBridgeGizmoController parseNetworkRecordsAndApplyWirelessCredentialsFromData:](self, "parseNetworkRecordsAndApplyWirelessCredentialsFromData:", v7);

}

- (void)processReceivedPairingWirelessCredentials:(id)a3
{
  id v4;
  PBBProtoSendWirelessCredentialsToWatch *v5;
  void *v6;
  void *v7;
  PBBProtoSendWirelessCredentialsToWatch *v8;

  v4 = a3;
  v5 = [PBBProtoSendWirelessCredentialsToWatch alloc];
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PBBProtoSendWirelessCredentialsToWatch initWithData:](v5, "initWithData:", v6);

  -[PBBProtoSendWirelessCredentialsToWatch serializedNetworkRecords](v8, "serializedNetworkRecords");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBBridgeGizmoController parseNetworkRecordsAndApplyWirelessCredentialsFromData:](self, "parseNetworkRecordsAndApplyWirelessCredentialsFromData:", v7);

  -[PBBridgeGizmoController _sendResponseToMessage:withResponseMessageID:withArguments:](self, "_sendResponseToMessage:withResponseMessageID:withArguments:", v4, 33, MEMORY[0x24BDBD1A8]);
}

- (void)parseNetworkRecordsAndApplyWirelessCredentialsFromData:(id)a3
{
  id v3;
  NSObject *v4;
  unint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  NSObject *v20;
  const char *v21;
  uint32_t v22;
  _BOOL4 v23;
  void *v24;
  id WeakRetained;
  void *v26;
  NSObject *v27;
  void *v29;
  id v30;
  uint8_t buf[4];
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v29 = (void *)objc_opt_new();
  pbb_setupflow_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v32 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_2113B6000, v4, OS_LOG_TYPE_DEFAULT, "Received %lu network records from the phone", buf, 0xCu);
  }

  if (objc_msgSend(v3, "count"))
  {
    v5 = 0;
    v6 = *MEMORY[0x24BDD0E88];
    do
    {
      v7 = objc_alloc(MEMORY[0x24BDD1620]);
      objc_msgSend(v3, "objectAtIndex:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)objc_msgSend(v7, "initForReadingFromData:error:", v8, 0);

      v10 = (void *)MEMORY[0x24BDBCF20];
      v11 = objc_opt_class();
      v12 = objc_opt_class();
      v13 = objc_opt_class();
      v14 = objc_opt_class();
      v15 = objc_opt_class();
      objc_msgSend(v10, "setWithObjects:", v11, v12, v13, v14, v15, objc_opt_class(), 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 0;
      objc_msgSend(v9, "decodeTopLevelObjectOfClasses:forKey:error:", v16, v6, &v30);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v30;
      if (v18)
      {
        pbb_setupflow_log();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v32 = (uint64_t)v18;
          v20 = v19;
          v21 = "Error unarchiving: %@";
          v22 = 12;
LABEL_8:
          _os_log_impl(&dword_2113B6000, v20, OS_LOG_TYPE_DEFAULT, v21, buf, v22);
        }
      }
      else
      {
        pbb_setupflow_log();
        v19 = objc_claimAutoreleasedReturnValue();
        v23 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
        if (v17)
        {
          if (v23)
          {
            objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("SSID_STR"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v32 = (uint64_t)v24;
            _os_log_impl(&dword_2113B6000, v19, OS_LOG_TYPE_DEFAULT, "Adding: %@", buf, 0xCu);

          }
          objc_msgSend(v29, "addObject:", v17);
          goto LABEL_14;
        }
        if (v23)
        {
          *(_WORD *)buf = 0;
          v20 = v19;
          v21 = "empty data";
          v22 = 2;
          goto LABEL_8;
        }
      }

LABEL_14:
      ++v5;
    }
    while (objc_msgSend(v3, "count") > v5);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v26 = v29;
    objc_msgSend(WeakRetained, "applyWirelessNetworkCredentials:", v29);
  }
  else
  {
    pbb_setupflow_log();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2113B6000, v27, OS_LOG_TYPE_DEFAULT, "delegate doesn't respond to applyWirelessNetworkCredentials", buf, 2u);
    }

    v26 = v29;
  }

}

- (BOOL)tellCompanionThatLanguageAndLanguageCompletedWithStatus:(unsigned __int16)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x24BDAC8D0];
  pbb_setupflow_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v13 = "-[PBBridgeGizmoController tellCompanionThatLanguageAndLanguageCompletedWithStatus:]";
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_2113B6000, v5, OS_LOG_TYPE_DEFAULT, "%s (Status: %@)", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PBBridgeGizmoController _sendRemoteCommandWithMessageID:withArguments:](self, "_sendRemoteCommandWithMessageID:withArguments:", 20, v8);

  return v9;
}

- (void)handleSetLauncherViewModeForTinker:(id)a3
{
  id v4;
  PBBProtoTinkerSetLauncherViewMode *v5;
  void *v6;
  PBBProtoTinkerSetLauncherViewMode *v7;
  uint64_t v8;
  NSObject *v9;
  id WeakRetained;
  NSObject *v11;
  _DWORD v12[2];
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [PBBProtoTinkerSetLauncherViewMode alloc];
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[PBBProtoTinkerSetLauncherViewMode initWithData:](v5, "initWithData:", v6);
  v8 = -[PBBProtoTinkerSetLauncherViewMode launcherViewMode](v7, "launcherViewMode");
  pbb_setupflow_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 67109634;
    v12[1] = 900;
    v13 = 2080;
    v14 = "-[PBBridgeGizmoController handleSetLauncherViewModeForTinker:]";
    v15 = 1024;
    v16 = v8;
    _os_log_impl(&dword_2113B6000, v9, OS_LOG_TYPE_DEFAULT, ">>>> %d %s launcherViewMode %d", (uint8_t *)v12, 0x18u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v8);
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "setLauncherViewMode:", v11);
  }
  else
  {
    pbb_setupflow_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12[0]) = 0;
      _os_log_impl(&dword_2113B6000, v11, OS_LOG_TYPE_DEFAULT, ">>>> delegate doesn't respond to setLauncherViewMode:", (uint8_t *)v12, 2u);
    }
  }

}

- (id)customDescriptionOfMessageType:(unsigned __int16)a3
{
  return (id)PBBCMessageDescription(a3);
}

- (void)tellCompanionThatGizmoFinishedSettingPasscode:(BOOL)a3 isLong:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  uint8_t buf[4];
  int v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v4 = a4;
  v5 = a3;
  v16 = *MEMORY[0x24BDAC8D0];
  pbb_setupflow_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v13 = 921;
    v14 = 2080;
    v15 = "-[PBBridgeGizmoController tellCompanionThatGizmoFinishedSettingPasscode:isLong:]";
    _os_log_impl(&dword_2113B6000, v7, OS_LOG_TYPE_DEFAULT, "%d %s", buf, 0x12u);
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBBridgeGizmoController _sendRemoteCommandWithMessageID:withArguments:](self, "_sendRemoteCommandWithMessageID:withArguments:", 7, v10);

}

- (void)tellCompanionThatGizmoFailedToCreatePasscode:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t buf[4];
  int v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v3 = *(_QWORD *)&a3;
  v13 = *MEMORY[0x24BDAC8D0];
  pbb_setupflow_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v10 = 927;
    v11 = 2080;
    v12 = "-[PBBridgeGizmoController tellCompanionThatGizmoFailedToCreatePasscode:]";
    _os_log_impl(&dword_2113B6000, v5, OS_LOG_TYPE_DEFAULT, "%d %s", buf, 0x12u);
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBBridgeGizmoController _sendRemoteCommandWithMessageID:withArguments:](self, "_sendRemoteCommandWithMessageID:withArguments:", 17, v7);

}

- (void)tellCompanionThatGizmoFinishedChangingPasscode:(BOOL)a3 isLong:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  uint8_t buf[4];
  int v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v4 = a4;
  v5 = a3;
  v16 = *MEMORY[0x24BDAC8D0];
  pbb_setupflow_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v13 = 933;
    v14 = 2080;
    v15 = "-[PBBridgeGizmoController tellCompanionThatGizmoFinishedChangingPasscode:isLong:]";
    _os_log_impl(&dword_2113B6000, v7, OS_LOG_TYPE_DEFAULT, "%d %s", buf, 0x12u);
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBBridgeGizmoController _sendRemoteCommandWithMessageID:withArguments:](self, "_sendRemoteCommandWithMessageID:withArguments:", 28, v10);

}

- (void)tellCompanionThatGizmoStartedUnlockPairing
{
  -[PBBridgeGizmoController _sendRemoteCommandWithMessageID:withArguments:](self, "_sendRemoteCommandWithMessageID:withArguments:", 19, 0);
}

- (void)tellCompanionThatGizmoFinishedUnlockPairing:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t buf[4];
  int v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x24BDAC8D0];
  pbb_setupflow_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v10 = 944;
    v11 = 2080;
    v12 = "-[PBBridgeGizmoController tellCompanionThatGizmoFinishedUnlockPairing:]";
    _os_log_impl(&dword_2113B6000, v5, OS_LOG_TYPE_DEFAULT, "%d %s", buf, 0x12u);
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBBridgeGizmoController _sendRemoteCommandWithMessageID:withArguments:](self, "_sendRemoteCommandWithMessageID:withArguments:", 13, v7);

}

- (void)setCanBeginActivating:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  int v7;
  NSObject *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  double Current;
  void *v13;
  void *v14;
  int v15;
  _DWORD v16[7];

  *(_QWORD *)&v16[5] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pbb_activation_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 67109378;
    v16[0] = 952;
    LOWORD(v16[1]) = 2080;
    *(_QWORD *)((char *)&v16[1] + 2) = "-[PBBridgeGizmoController setCanBeginActivating:]";
    _os_log_impl(&dword_2113B6000, v5, OS_LOG_TYPE_DEFAULT, "%d %s -- Companion says we can activate!", (uint8_t *)&v15, 0x12u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_9;
  v7 = objc_msgSend(WeakRetained, "checkBrickedState");
  pbb_activation_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = CFSTR("Activated");
    if (v7)
      v9 = CFSTR("Bricked");
    v15 = 138412290;
    *(_QWORD *)v16 = v9;
    _os_log_impl(&dword_2113B6000, v8, OS_LOG_TYPE_DEFAULT, "Watch Is %@!", (uint8_t *)&v15, 0xCu);
  }

  if (!v7)
  {
    -[PBBridgeGizmoController tellCompanionGizmoFinishedActivating](self, "tellCompanionGizmoFinishedActivating");
  }
  else
  {
LABEL_9:
    self->_canBeginActivation = 1;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postNotificationName:object:userInfo:", CFSTR("PBBridgeGizmoControllerActivationAbilityChanged"), 0, 0);

    if (PBLogPerformanceMetrics())
    {
      +[PBBridgeResponsePerformanceMonitor shareMonitor](PBBridgeResponsePerformanceMonitor, "shareMonitor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      Current = CFAbsoluteTimeGetCurrent();
      objc_msgSend(v4, "context");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "outgoingResponseIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addMilestone:activityType:activityIdentifier:", CFSTR("CanBeginActivating"), v14, Current);

    }
  }

}

- (void)waitForDynamicActivationEventPresentation:(id)a3
{
  NSObject *v4;
  _DWORD v5[2];
  __int16 v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  self->_activationState = 6;
  pbb_activation_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109378;
    v5[1] = 976;
    v6 = 2080;
    v7 = "-[PBBridgeGizmoController waitForDynamicActivationEventPresentation:]";
    _os_log_impl(&dword_2113B6000, v4, OS_LOG_TYPE_DEFAULT, "%d %s", (uint8_t *)v5, 0x12u);
  }

  -[PBBridgeGizmoController invalidateTimeoutTimer](self, "invalidateTimeoutTimer");
  PBNotifyClientOfActivity();
}

- (void)waitForUserResponseToDynamicEventPresentation:(id)a3
{
  NSObject *v4;
  _DWORD v5[2];
  __int16 v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  self->_activationState = 6;
  pbb_activation_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109378;
    v5[1] = 984;
    v6 = 2080;
    v7 = "-[PBBridgeGizmoController waitForUserResponseToDynamicEventPresentation:]";
    _os_log_impl(&dword_2113B6000, v4, OS_LOG_TYPE_DEFAULT, "%d %s", (uint8_t *)v5, 0x12u);
  }

  -[PBBridgeGizmoController refreshTimeoutTimer](self, "refreshTimeoutTimer");
  PBNotifyClientOfActivity();
}

- (void)retryActivation:(id)a3
{
  NSObject *v4;
  void *v5;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  pbb_activation_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109378;
    v6[1] = 991;
    v7 = 2080;
    v8 = "-[PBBridgeGizmoController retryActivation:]";
    _os_log_impl(&dword_2113B6000, v4, OS_LOG_TYPE_DEFAULT, "%d %s -- Companion says we can activate!", (uint8_t *)v6, 0x12u);
  }

  self->_canBeginActivation = 1;
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("PBBridgeGizmoControllerRetryActivation"), 0, 0);

  PBNotifyClientOfActivity();
}

- (void)beganAwaitingAbilityToActivate
{
  -[PBBridgeGizmoController setActivationState:](self, "setActivationState:", 2);
  -[PBBridgeGizmoController refreshTimeoutTimer](self, "refreshTimeoutTimer");
}

- (void)invalidateTimeoutTimer
{
  NSTimer *activationTimeout;

  -[NSTimer invalidate](self->_activationTimeout, "invalidate");
  activationTimeout = self->_activationTimeout;
  self->_activationTimeout = 0;

}

- (void)refreshTimeoutTimer
{
  unsigned int v3;
  double v4;
  NSObject *v5;
  const __CFString *v6;
  NSTimer *v7;
  NSTimer *activationTimeout;
  void *v9;
  int v10;
  double v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = self->_activationState - 2;
  v4 = 0.0;
  if (v3 <= 4)
    v4 = dbl_211401BF0[(__int16)v3];
  pbb_activation_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if ((unsigned __int16)(self->_activationState - 2) > 3u)
      v6 = CFSTR("Idle");
    else
      v6 = off_24CBBEAF0[(__int16)(self->_activationState - 2)];
    v10 = 134218242;
    v11 = v4 / 60.0;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_2113B6000, v5, OS_LOG_TYPE_DEFAULT, "Setting %1.f minute timeout for activation phase (%@)", (uint8_t *)&v10, 0x16u);
  }

  -[NSTimer invalidate](self->_activationTimeout, "invalidate");
  objc_msgSend(MEMORY[0x24BDBCF40], "timerWithTimeInterval:target:selector:userInfo:repeats:", self, sel_activationTimeout_, 0, 0, v4);
  v7 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  activationTimeout = self->_activationTimeout;
  self->_activationTimeout = v7;

  objc_msgSend(MEMORY[0x24BDBCF18], "currentRunLoop");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addTimer:forMode:", self->_activationTimeout, *MEMORY[0x24BDBCB80]);

}

- (void)activationTimeout:(id)a3
{
  NSObject *v4;
  id WeakRetained;
  void *v6;

  -[PBBridgeGizmoController invalidateTimeoutTimer](self, "invalidateTimeoutTimer", a3);
  pbb_activation_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    -[PBBridgeGizmoController activationTimeout:].cold.1((uint64_t)self, v4);

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Activation Timed Out in Phase Proxy Activation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "remoteDidFailActivation:description:", 6, v6);

}

- (void)remoteRequestToKeepAlive:(id)a3
{
  NSObject *v4;
  unsigned int activationState;
  uint8_t v7[16];

  pbb_activation_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_2113B6000, v4, OS_LOG_TYPE_DEFAULT, "Companion requested we refresh our activation timeout", v7, 2u);
  }

  activationState = self->_activationState;
  if (activationState >= 3 && activationState != 0xFFFF)
    -[PBBridgeGizmoController refreshTimeoutTimer](self, "refreshTimeoutTimer");
}

- (void)pushControllerType:(id)a3
{
  id v4;
  PBBProtoPushControllerType *v5;
  void *v6;
  PBBProtoPushControllerType *v7;
  unsigned int v8;
  double v9;
  double v10;
  void *v11;
  double Current;
  objc_class *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  double v19;
  id WeakRetained;
  _DWORD v21[2];
  __int16 v22;
  const char *v23;
  __int16 v24;
  unsigned int v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [PBBProtoPushControllerType alloc];
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PBBProtoPushControllerType initWithData:](v5, "initWithData:", v6);

  v8 = -[PBBProtoPushControllerType controllerType](v7, "controllerType");
  -[PBBProtoPushControllerType intendedFireDate](v7, "intendedFireDate");
  v10 = v9;
  if (PBLogPerformanceMetrics())
  {
    +[PBBridgeResponsePerformanceMonitor shareMonitor](PBBridgeResponsePerformanceMonitor, "shareMonitor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    Current = CFAbsoluteTimeGetCurrent();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "context");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "outgoingResponseIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addMilestone:activityType:activityIdentifier:", v14, v16, Current);

  }
  pbb_setupflow_log();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    PBBuddyControllerDescription(v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = 67109890;
    v21[1] = 1123;
    v22 = 2080;
    v23 = "-[PBBridgeGizmoController pushControllerType:]";
    v24 = 1024;
    v25 = v8;
    v26 = 2112;
    v27 = v18;
    _os_log_impl(&dword_2113B6000, v17, OS_LOG_TYPE_DEFAULT, "%d %s (%d %@)", (uint8_t *)v21, 0x22u);

  }
  v19 = CleanIntendedFireTimeOffset(v10);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "pushControllerType:withIntendedFireTime:", v8, v19);
  PBNotifyClientOfActivity();

}

- (void)popToControllerType:(id)a3
{
  id v4;
  PBBProtoPopToControllerType *v5;
  void *v6;
  PBBProtoPopToControllerType *v7;
  unsigned int v8;
  double v9;
  double v10;
  NSObject *v11;
  void *v12;
  double v13;
  id WeakRetained;
  void *v15;
  double Current;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  _DWORD v21[2];
  __int16 v22;
  const char *v23;
  __int16 v24;
  unsigned int v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [PBBProtoPopToControllerType alloc];
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PBBProtoPopToControllerType initWithData:](v5, "initWithData:", v6);

  v8 = -[PBBProtoPopToControllerType controllerType](v7, "controllerType");
  -[PBBProtoPopToControllerType intendedFireDate](v7, "intendedFireDate");
  v10 = v9;
  pbb_setupflow_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    PBBuddyControllerDescription(v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = 67109890;
    v21[1] = 1138;
    v22 = 2080;
    v23 = "-[PBBridgeGizmoController popToControllerType:]";
    v24 = 1024;
    v25 = v8;
    v26 = 2112;
    v27 = v12;
    _os_log_impl(&dword_2113B6000, v11, OS_LOG_TYPE_DEFAULT, "%d %s (%d %@)", (uint8_t *)v21, 0x22u);

  }
  v13 = CleanIntendedFireTimeOffset(v10);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "popToControllerType:withIntendedFireTime:", v8, v13);
  if (PBLogPerformanceMetrics())
  {
    +[PBBridgeResponsePerformanceMonitor shareMonitor](PBBridgeResponsePerformanceMonitor, "shareMonitor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    Current = CFAbsoluteTimeGetCurrent();
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "context");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "outgoingResponseIdentifier");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addMilestone:activityType:activityIdentifier:", v18, v20, Current);

  }
  PBNotifyClientOfActivity();

}

- (void)showLockedOnAnimation:(id)a3
{
  NSObject *v4;
  id WeakRetained;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  pbb_setupflow_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109378;
    v6[1] = 1153;
    v7 = 2080;
    v8 = "-[PBBridgeGizmoController showLockedOnAnimation:]";
    _os_log_impl(&dword_2113B6000, v4, OS_LOG_TYPE_DEFAULT, "%d %s", (uint8_t *)v6, 0x12u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "showLockedOnAnimation");
  PBNotifyClientOfActivity();

}

- (void)setPasscodeRestrictions:(id)a3
{
  id v3;
  PBBProtoSetPasscodeRestrictions *v4;
  void *v5;
  PBBProtoSetPasscodeRestrictions *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  void *v32;
  id v33;
  NSObject *v34;
  PBBProtoSetPasscodeRestrictions *v36;
  void *v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  id v47;
  uint8_t buf[4];
  void *v49;
  _BYTE v50[128];
  _BYTE v51[128];
  _QWORD v52[2];
  _QWORD v53[5];

  v53[3] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = [PBBProtoSetPasscodeRestrictions alloc];
  v37 = v3;
  objc_msgSend(v3, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PBBProtoSetPasscodeRestrictions initWithData:](v4, "initWithData:", v5);

  v7 = objc_alloc(MEMORY[0x24BDD1620]);
  v36 = v6;
  -[PBBProtoSetPasscodeRestrictions restrictions](v6, "restrictions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0;
  v9 = (void *)objc_msgSend(v7, "initForReadingFromData:error:", v8, &v47);
  v10 = v47;

  if (v10)
  {
    pbb_setupflow_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[PBBridgeGizmoController handleActivationData:].cold.2();

  }
  v12 = *MEMORY[0x24BE63AB0];
  v53[0] = *MEMORY[0x24BE63A58];
  v53[1] = v12;
  v53[2] = *MEMORY[0x24BE63798];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v53, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *MEMORY[0x24BE639E8];
  v52[0] = *MEMORY[0x24BE639F8];
  v52[1] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v52, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_opt_new();
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v17 = v13;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v44 != v20)
          objc_enumerationMutation(v17);
        v22 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
        if (objc_msgSend(v9, "containsValueForKey:", v22))
        {
          objc_msgSend(v9, "decodeObjectOfClass:forKey:", objc_opt_class(), v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v16, "MCSetBoolRestriction:value:", v22, v23 != 0);

        }
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
    }
    while (v19);
  }

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v24 = v15;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v40;
    do
    {
      for (j = 0; j != v26; ++j)
      {
        if (*(_QWORD *)v40 != v27)
          objc_enumerationMutation(v24);
        v29 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * j);
        if (objc_msgSend(v9, "containsValueForKey:", v29))
        {
          objc_msgSend(v9, "decodeObjectOfClass:forKey:", objc_opt_class(), v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v16, "MCSetValueRestriction:value:", v29, v30);

        }
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v39, v50, 16);
    }
    while (v26);
  }

  objc_msgSend(v9, "finishDecoding");
  pbb_setupflow_log();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v49 = v16;
    _os_log_impl(&dword_2113B6000, v31, OS_LOG_TYPE_DEFAULT, "Trying to apply passcode restrictions: %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  objc_msgSend(v32, "applyRestrictionDictionary:clientType:clientUUID:localizedClientDescription:localizedWarningMessage:outRestrictionChanged:outEffectiveSettingsChanged:outError:", v16, CFSTR("NanoPreferencesSync"), CFSTR("com.apple.nanobuddy"), 0, 0, 0, 0, &v38);
  v33 = v38;

  if (v33)
  {
    pbb_setupflow_log();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      -[PBBridgeGizmoController setPasscodeRestrictions:].cold.1();

  }
  self->_readyToCreatePasscode = 1;
  PBNotifyClientOfActivity();

}

- (void)setCrownOrientationRight:(id)a3
{
  id v4;
  PBBProtoTellGizmoToSetCrownOrientation *v5;
  void *v6;
  PBBProtoTellGizmoToSetCrownOrientation *v7;
  uint64_t v8;
  NSObject *v9;
  const __CFString *v10;
  id WeakRetained;
  int v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [PBBProtoTellGizmoToSetCrownOrientation alloc];
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[PBBProtoTellGizmoToSetCrownOrientation initWithData:](v5, "initWithData:", v6);
  v8 = -[PBBProtoTellGizmoToSetCrownOrientation crownOrientationRight](v7, "crownOrientationRight");
  pbb_setupflow_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = CFSTR("Left");
    if ((_DWORD)v8)
      v10 = CFSTR("Right");
    v12 = 138412290;
    v13 = v10;
    _os_log_impl(&dword_2113B6000, v9, OS_LOG_TYPE_DEFAULT, "setCrownOrientationRight: %@", (uint8_t *)&v12, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "setCrownOrientationRight:", v8);

}

- (void)updateSynchProgress:(id)a3
{
  id v4;
  PBBProtoInitialSyncStateUpdate *v5;
  void *v6;
  PBBProtoInitialSyncStateUpdate *v7;
  double v8;
  double v9;
  uint64_t v10;
  NSObject *v11;
  id WeakRetained;
  int v13;
  double v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [PBBProtoInitialSyncStateUpdate alloc];
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[PBBProtoInitialSyncStateUpdate initWithData:](v5, "initWithData:", v6);
  -[PBBProtoInitialSyncStateUpdate progress](v7, "progress");
  v9 = v8;
  v10 = -[PBBProtoInitialSyncStateUpdate state](v7, "state");
  pbb_setupflow_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 134218240;
    v14 = v9;
    v15 = 2048;
    v16 = v10;
    _os_log_impl(&dword_2113B6000, v11, OS_LOG_TYPE_DEFAULT, "updateSynchProgress: %f state: %ld", (uint8_t *)&v13, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "setSyncProgress:andState:", v10, v9);

}

- (void)doInitialSyncPrep:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  NSObject *v7;
  _DWORD v8[2];
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pbb_setupflow_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109378;
    v8[1] = 1292;
    v9 = 2080;
    v10 = "-[PBBridgeGizmoController doInitialSyncPrep:]";
    _os_log_impl(&dword_2113B6000, v5, OS_LOG_TYPE_DEFAULT, "%d %s", (uint8_t *)v8, 0x12u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "prepareForInitialSync");
  }
  else
  {
    pbb_setupflow_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8[0]) = 0;
      _os_log_impl(&dword_2113B6000, v7, OS_LOG_TYPE_DEFAULT, "Warning!! Delegate did not handle prepareForInitialSync!", (uint8_t *)v8, 2u);
    }

  }
  -[PBBridgeGizmoController _sendResponseToMessage:withResponseMessageID:withArguments:](self, "_sendResponseToMessage:withResponseMessageID:withArguments:", v4, 18, 0);

}

- (void)handleWarrantySentinelRequest:(id)a3
{
  id v4;
  PBBProtoWarrantySentinel *v5;
  void *v6;
  PBBProtoWarrantySentinel *v7;
  NSObject *v8;
  void *v9;
  double Current;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  NSObject *v17;
  const __CFString *v18;
  int v19;
  void *v20;
  PBBProtoWarrantySentinel *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  PBBProtoWarrantySentinel *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  PBBProtoWarrantySentinel *v41;
  NSObject *v42;
  PBBProtoWarrantySentinel *v43;
  NSObject *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  PBBProtoWarrantySentinel *v53;
  NSObject *v54;
  void *v55;
  PBBridgeGizmoController *v56;
  uint8_t buf[4];
  PBBProtoWarrantySentinel *v58;
  __int16 v59;
  void *v60;
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [PBBProtoWarrantySentinel alloc];
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PBBProtoWarrantySentinel initWithData:](v5, "initWithData:", v6);

  pbb_setupflow_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v58 = v7;
    _os_log_impl(&dword_2113B6000, v8, OS_LOG_TYPE_DEFAULT, "Got Warranty Sentinel request: (%@)", buf, 0xCu);
  }

  if (PBLogPerformanceMetrics())
  {
    +[PBBridgeResponsePerformanceMonitor shareMonitor](PBBridgeResponsePerformanceMonitor, "shareMonitor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    Current = CFAbsoluteTimeGetCurrent();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "outgoingResponseIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addMilestone:activityType:activityIdentifier:", v12, v14, Current);

  }
  if (-[PBBProtoWarrantySentinel hasDeviceName](v7, "hasDeviceName"))
  {
    -[PBBProtoWarrantySentinel deviceName](v7, "deviceName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBBridgeGizmoController setDeviceName:](self, "setDeviceName:", v15);

  }
  v16 = 0x24BDBC000;
  if (-[PBBProtoWarrantySentinel hasAppleLocale](v7, "hasAppleLocale"))
  {
    v56 = self;
    pbb_setupflow_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2113B6000, v17, OS_LOG_TYPE_DEFAULT, "Applying Locale workaround for 28393103", buf, 2u);
    }

    v18 = (const __CFString *)*MEMORY[0x24BDBD580];
    v19 = 1;
    while (1)
    {
      objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale", v56);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localeIdentifier");
      v21 = (PBBProtoWarrantySentinel *)objc_claimAutoreleasedReturnValue();

      v22 = (void *)CFPreferencesCopyAppValue(CFSTR("AppleLocale"), v18);
      pbb_setupflow_log();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v58 = v21;
        v59 = 2112;
        v60 = v22;
        _os_log_impl(&dword_2113B6000, v23, OS_LOG_TYPE_DEFAULT, "Locale from NSLocale: (%@); Locale from CFPref: (%@)",
          buf,
          0x16u);
      }

      if (objc_msgSend(v22, "isEqualToString:", v21))
        break;
      CFPreferencesFlushCaches();
      _CFLocaleResetCurrent();

      if (++v19 == 11)
        goto LABEL_19;
    }
    pbb_setupflow_log();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v58) = v19;
      _os_log_impl(&dword_2113B6000, v24, OS_LOG_TYPE_DEFAULT, "Workaround did the trick after (%d) iterations", buf, 8u);
    }

LABEL_19:
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "localeIdentifier");
    v26 = (PBBProtoWarrantySentinel *)objc_claimAutoreleasedReturnValue();

    pbb_setupflow_log();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v58 = v26;
      _os_log_impl(&dword_2113B6000, v27, OS_LOG_TYPE_DEFAULT, "Current locale identifier: %@", buf, 0xCu);
    }

    v28 = (void *)MEMORY[0x24BDBCEA0];
    -[PBBProtoWarrantySentinel appleLocale](v7, "appleLocale");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "componentsFromLocaleIdentifier:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("calendar"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE5C368], "supportedCalendars");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v32, "containsObject:", v31);

    if ((v33 & 1) == 0)
    {

      v31 = 0;
    }
    objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("numbers"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE5C368], "numberingSystemsForLocaleID:", v26);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v35, "containsObject:", v34) & 1) != 0)
    {
      objc_msgSend(MEMORY[0x24BE5C368], "numberingSystemForLocaleID:", v26);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v34, "isEqualToString:", v36);

      if (!v37)
        goto LABEL_28;
    }
    else
    {

    }
    v34 = 0;
LABEL_28:
    v38 = (void *)MEMORY[0x24BDBCED8];
    objc_msgSend(MEMORY[0x24BDBCEA0], "componentsFromLocaleIdentifier:", v26);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "dictionaryWithDictionary:", v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    if (v31)
      objc_msgSend(v40, "setObject:forKeyedSubscript:", v31, CFSTR("calendar"));
    if (v34)
      objc_msgSend(v40, "setObject:forKeyedSubscript:", v34, CFSTR("numbers"));
    objc_msgSend(MEMORY[0x24BDBCEA0], "canonicalLocaleIdentifierFromComponents:", v40);
    v41 = (PBBProtoWarrantySentinel *)objc_claimAutoreleasedReturnValue();
    pbb_setupflow_log();
    v42 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v58 = v41;
      v59 = 2112;
      v60 = v40;
      _os_log_impl(&dword_2113B6000, v42, OS_LOG_TYPE_DEFAULT, "Will set new locale: %@, given components: %@", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x24BDBCEA0], "setLocaleAndResetTimeFormat:", v41);
    _CFLocaleResetCurrent();
    v43 = (PBBProtoWarrantySentinel *)CFPreferencesCopyValue(CFSTR("AppleLocale"), (CFStringRef)*MEMORY[0x24BDBD568], (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
    pbb_setupflow_log();
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v58 = v43;
      _os_log_impl(&dword_2113B6000, v44, OS_LOG_TYPE_DEFAULT, "Set locale to %@ (read back from CFPref)", buf, 0xCu);
    }

    self = v56;
    v16 = 0x24BDBC000uLL;
  }
  if (-[PBBProtoWarrantySentinel appleLanguagesCount](v7, "appleLanguagesCount"))
  {
    -[PBBProtoWarrantySentinel appleLanguages](v7, "appleLanguages");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = *(void **)(v16 + 3744);
    objc_msgSend(v46, "supportedCJLanguageIdentifiers");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "mostPreferredLanguageOf:withPreferredLanguages:forUsage:options:", v47, v45, 1, 4);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v48, "length"))
    {
      v49 = *(void **)(v16 + 3744);
      objc_msgSend(v49, "preferredLanguages");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "firstObject");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "setLanguageToPreferredLanguages:fallback:", v51, v48);

      pbb_setupflow_log();
      v52 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(v16 + 3744), "preferredLanguages");
        v53 = (PBBProtoWarrantySentinel *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v58 = v53;
        _os_log_impl(&dword_2113B6000, v52, OS_LOG_TYPE_DEFAULT, "Set languages to %@", buf, 0xCu);

      }
    }

  }
  if (-[PBBProtoWarrantySentinel hasRemoveSentinel](v7, "hasRemoveSentinel")
    && -[PBBProtoWarrantySentinel removeSentinel](v7, "removeSentinel"))
  {
    pbb_setupflow_log();
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2113B6000, v54, OS_LOG_TYPE_DEFAULT, "Removing Warranty Sentinel", buf, 2u);
    }

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "removeItemAtPath:error:", CFSTR("/var/mobile/Media/iTunes_Control/iTunes/ShowWarranty"), 0);

  }
  else
  {
    -[PBBridgeGizmoController _sendResponseToMessage:withResponseMessageID:withArguments:](self, "_sendResponseToMessage:withResponseMessageID:withArguments:", v4, 14, 0);
  }
  PBNotifyClientOfActivity();

}

- (void)handleOfflineTermsRequest:(id)a3
{
  id v4;
  PBBProtoOfflineTerms *v5;
  void *v6;
  PBBProtoOfflineTerms *v7;
  NSObject *v8;
  void *v9;
  double Current;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[3];
  uint8_t buf[4];
  PBBProtoOfflineTerms *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [PBBProtoOfflineTerms alloc];
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PBBProtoOfflineTerms initWithData:](v5, "initWithData:", v6);

  pbb_setupflow_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v7;
    _os_log_impl(&dword_2113B6000, v8, OS_LOG_TYPE_DEFAULT, "Got Offline Terms request: (%@)", buf, 0xCu);
  }

  if (PBLogPerformanceMetrics())
  {
    +[PBBridgeResponsePerformanceMonitor shareMonitor](PBBridgeResponsePerformanceMonitor, "shareMonitor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    Current = CFAbsoluteTimeGetCurrent();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "context");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "outgoingResponseIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addMilestone:activityType:activityIdentifier:", v12, v14, Current);

  }
  -[PBBProtoOfflineTerms languageCode](v7, "languageCode");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v15;
  -[PBBProtoOfflineTerms countryCode](v7, "countryCode");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v16;
  -[PBBProtoOfflineTerms appleLanguages](v7, "appleLanguages");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[PBBridgeGizmoController _sendResponseToMessage:withResponseMessageID:withArguments:](self, "_sendResponseToMessage:withResponseMessageID:withArguments:", v4, 15, v18);
  PBNotifyClientOfActivity();

}

- (void)handleRenameDeviceRequest:(id)a3
{
  id v4;
  PBBProtoDeviceName *v5;
  void *v6;
  PBBProtoDeviceName *v7;
  void *v8;
  NSObject *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [PBBProtoDeviceName alloc];
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[PBBProtoDeviceName initWithData:](v5, "initWithData:", v6);
  -[PBBProtoDeviceName deviceName](v7, "deviceName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  pbb_setupflow_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    v11 = v8;
    _os_log_impl(&dword_2113B6000, v9, OS_LOG_TYPE_DEFAULT, "Received device name request (%@)", (uint8_t *)&v10, 0xCu);
  }

  -[PBBridgeGizmoController setDeviceName:](self, "setDeviceName:", v8);
}

- (void)setDeviceName:(id)a3
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    pbb_setupflow_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v3;
      _os_log_impl(&dword_2113B6000, v4, OS_LOG_TYPE_DEFAULT, "Setting device name to '%@'", buf, 0xCu);
    }

    dispatch_get_global_queue(25, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __41__PBBridgeGizmoController_setDeviceName___block_invoke;
    block[3] = &unk_24CBBE1E0;
    v7 = v3;
    dispatch_async(v5, block);

  }
}

void __41__PBBridgeGizmoController_setDeviceName___block_invoke(uint64_t a1)
{
  uint64_t *v2;
  int v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (lockdown_connect())
  {
    v2 = (uint64_t *)(a1 + 32);
    v3 = lockdown_set_value();
    lockdown_disconnect();
    pbb_setupflow_log();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v3)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        __41__PBBridgeGizmoController_setDeviceName___block_invoke_cold_2(v2, v3, v5);
    }
    else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *v2;
      v14 = 138412290;
      v15 = v13;
      _os_log_impl(&dword_2113B6000, v5, OS_LOG_TYPE_DEFAULT, "Successfully set name: (%@)", (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    pbb_setupflow_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __41__PBBridgeGizmoController_setDeviceName___block_invoke_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
  }

}

+ (id)warrantyFilePathForLanguageCode:(id)a3 countryCode:(id)a4
{
  return 0;
}

+ (id)prepareOfflineTermsResponse:(id)a3
{
  id v4;
  PBBProtoOfflineTerms *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void (**v10)(_QWORD);
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v4 = a3;
  v5 = objc_alloc_init(PBBProtoOfflineTerms);
  objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __55__PBBridgeGizmoController_prepareOfflineTermsResponse___block_invoke_3;
  v17[3] = &unk_24CBBE9C8;
  v20 = a1;
  v8 = v6;
  v18 = v8;
  v9 = v7;
  v19 = v9;
  v10 = (void (**)(_QWORD))MEMORY[0x212BD94D4](v17);
  __55__PBBridgeGizmoController_prepareOfflineTermsResponse___block_invoke();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBBProtoOfflineTerms setLicense:](v5, "setLicense:", v11);

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "fileExistsAtPath:", CFSTR("/var/mobile/Media/iTunes_Control/iTunes/ShowWarranty"));

  if (v13)
  {
    __55__PBBridgeGizmoController_prepareOfflineTermsResponse___block_invoke_2();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBBProtoOfflineTerms setMultiterms:](v5, "setMultiterms:", v14);

    v10[2](v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBBProtoOfflineTerms setWarranty:](v5, "setWarranty:", v15);

  }
  return v5;
}

id __55__PBBridgeGizmoController_prepareOfflineTermsResponse___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;

  v0 = (void *)MEMORY[0x24BDD17C8];
  SFLicenseFilePath();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithContentsOfFile:encoding:error:", v1, 4, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("TERMS_CONDITIONS_LINK"), &stru_24CBBF548, CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x24BDBCEA0];
  objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "characterDirectionForLanguage:", v7);

  v9 = CFSTR("ltr");
  if (v8 == 2)
    v9 = CFSTR("rtl");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<body><p dir=\"%@\" class=\"p1\"><b>%@</b></p><p class=\"p1\"><br></p>"), v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("<body>"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "dataUsingEncoding:", 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

id __55__PBBridgeGizmoController_prepareOfflineTermsResponse___block_invoke_2()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "pathForResource:ofType:", CFSTR("multiterms"), CFSTR("xml"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithContentsOfFile:encoding:error:", v1, 4, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataUsingEncoding:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __55__PBBridgeGizmoController_prepareOfflineTermsResponse___block_invoke_3(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x24BDBCE50];
  objc_msgSend((id)objc_opt_class(), "warrantyFilePathForLanguageCode:countryCode:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dataWithContentsOfFile:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)transportBecameReachable
{
  id WeakRetained;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PBBridgeGizmoController;
  -[PBBridgeIDSServiceDelegate transportBecameReachable](&v4, sel_transportBecameReachable);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "transportBecameReachable");

}

- (void)transportBecameUnreachable
{
  PBBridgeConnectionDelegate **p_delegate;
  id WeakRetained;
  char v5;
  NSObject *v6;
  _BOOL4 v7;
  id v8;
  objc_class *v9;
  void *v10;
  objc_super v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11.receiver = self;
  v11.super_class = (Class)PBBridgeGizmoController;
  -[PBBridgeIDSServiceDelegate transportBecameUnreachable](&v11, sel_transportBecameUnreachable);
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = objc_opt_respondsToSelector();
  pbb_setupflow_log();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if ((v5 & 1) != 0)
  {
    if (v7)
    {
      *(_DWORD *)buf = 136446210;
      v13 = "-[PBBridgeGizmoController transportBecameUnreachable]";
      _os_log_impl(&dword_2113B6000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }

    objc_msgSend(WeakRetained, "transportBecameUnreachable");
  }
  else
  {
    if (v7)
    {
      v8 = objc_loadWeakRetained((id *)p_delegate);
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136446466;
      v13 = "-[PBBridgeGizmoController transportBecameUnreachable]";
      v14 = 2112;
      v15 = v10;
      _os_log_impl(&dword_2113B6000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s: Delegate (%@) missing transportBecameUnreachable", buf, 0x16u);

    }
  }

}

- (BOOL)sendCompanionPerformanceResults
{
  return -[PBBridgeGizmoController _sendRemoteCommandWithMessageID:withArguments:](self, "_sendRemoteCommandWithMessageID:withArguments:", 16, MEMORY[0x24BDBD1A8]);
}

- (void)prepareForForcedWatchSU:(id)a3
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pbb_setupflow_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[PBBridgeGizmoController prepareForForcedWatchSU:]";
    _os_log_impl(&dword_2113B6000, v5, OS_LOG_TYPE_DEFAULT, "%s:", (uint8_t *)&v7, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "prepareForForcedSU");
  -[PBBridgeGizmoController _sendResponseToMessage:withResponseMessageID:withArguments:](self, "_sendResponseToMessage:withResponseMessageID:withArguments:", v4, 23, MEMORY[0x24BDBD1A8]);

}

- (void)fetchTermsAndConditions:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[2];
  _QWORD v19[2];
  _QWORD v20[2];
  _QWORD v21[3];
  uint8_t buf[4];
  int v23;
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pbb_setupflow_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v23 = 1558;
    v24 = 2080;
    v25 = "-[PBBridgeGizmoController fetchTermsAndConditions:]";
    _os_log_impl(&dword_2113B6000, v5, OS_LOG_TYPE_DEFAULT, "%d %s", buf, 0x12u);
  }

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "fileExistsAtPath:", CFSTR("/var/mobile/Media/iTunes_Control/iTunes/ShowWarranty"));

  if (v7)
  {
    v21[0] = &unk_24CBCE8D8;
    v21[1] = &unk_24CBCE928;
    v21[2] = &unk_24CBCE900;
    v8 = (void *)MEMORY[0x24BDBCE30];
    v9 = v21;
    v10 = 3;
  }
  else
  {
    v20[0] = &unk_24CBCE8D8;
    v20[1] = &unk_24CBCE928;
    v8 = (void *)MEMORY[0x24BDBCE30];
    v9 = v20;
    v10 = 2;
  }
  objc_msgSend(v8, "arrayWithObjects:count:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = CFSTR("terms");
  v18[1] = CFSTR("format");
  v12 = *MEMORY[0x24BE04BC8];
  v19[0] = v11;
  v19[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE049A8]), "initWithParameters:", v13);
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __51__PBBridgeGizmoController_fetchTermsAndConditions___block_invoke;
  v16[3] = &unk_24CBBEA18;
  v16[4] = self;
  v17 = v4;
  v15 = v4;
  objc_msgSend(v14, "performRequestWithHandler:", v16);

}

void __51__PBBridgeGizmoController_fetchTermsAndConditions___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __51__PBBridgeGizmoController_fetchTermsAndConditions___block_invoke_2;
  v11[3] = &unk_24CBBE9F0;
  v12 = v6;
  v13 = v7;
  v8 = *(void **)(a1 + 40);
  v14 = *(_QWORD *)(a1 + 32);
  v15 = v8;
  v9 = v7;
  v10 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], v11);

}

void __51__PBBridgeGizmoController_fetchTermsAndConditions___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = *(id *)(a1 + 32);
  objc_msgSend(v2, "responseData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  pbb_setupflow_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_msgSend(v3, "length");
    v6 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 134218242;
    v15 = v5;
    v16 = 2114;
    v17 = v6;
    _os_log_impl(&dword_2113B6000, v4, OS_LOG_TYPE_DEFAULT, "Terms request completed with data length %llu, error (non-nil does not imply failure) = %{public}@", buf, 0x16u);
  }

  v7 = objc_msgSend(v3, "length");
  pbb_setupflow_log();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2113B6000, v8, OS_LOG_TYPE_DEFAULT, "sending online terms", buf, 2u);
    }

    v11 = *(void **)(a1 + 48);
    v10 = *(_QWORD *)(a1 + 56);
    v13 = v3;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v13, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_sendResponseToMessage:withResponseMessageID:withArguments:", v10, 101, v12);

  }
  else
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2113B6000, v8, OS_LOG_TYPE_DEFAULT, "requesting offline terms", buf, 2u);
    }

    objc_msgSend(*(id *)(a1 + 48), "_sendResponseToMessage:withResponseMessageID:withArguments:", *(_QWORD *)(a1 + 56), 101, 0);
  }

}

- (void)companionTermsResponse:(id)a3
{
  id v3;
  NSObject *v4;
  PBBProtoCompanionTermsResponse *v5;
  void *v6;
  PBBProtoCompanionTermsResponse *v7;
  int v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  int v14;
  __int16 v15;
  _BYTE v16[14];
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  pbb_setupflow_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 67109378;
    v14 = 1592;
    v15 = 2080;
    *(_QWORD *)v16 = "-[PBBridgeGizmoController companionTermsResponse:]";
    _os_log_impl(&dword_2113B6000, v4, OS_LOG_TYPE_DEFAULT, "%d %s", (uint8_t *)&v13, 0x12u);
  }

  v5 = [PBBProtoCompanionTermsResponse alloc];
  objc_msgSend(v3, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[PBBProtoCompanionTermsResponse initWithData:](v5, "initWithData:", v6);
  if (-[PBBProtoCompanionTermsResponse hasTermsAccepted](v7, "hasTermsAccepted"))
    v8 = -[PBBProtoCompanionTermsResponse termsAccepted](v7, "termsAccepted");
  else
    v8 = 0;
  if (-[PBBProtoCompanionTermsResponse hasIsExistingAccountTerms](v7, "hasIsExistingAccountTerms"))
    v9 = -[PBBProtoCompanionTermsResponse isExistingAccountTerms](v7, "isExistingAccountTerms");
  else
    v9 = 0;
  -[PBBProtoCompanionTermsResponse responseData](v7, "responseData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBBProtoCompanionTermsResponse userAgent](v7, "userAgent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  pbb_setupflow_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 67109890;
    v14 = v8;
    v15 = 1024;
    *(_DWORD *)v16 = v9;
    *(_WORD *)&v16[4] = 2112;
    *(_QWORD *)&v16[6] = v10;
    v17 = 2112;
    v18 = v11;
    _os_log_impl(&dword_2113B6000, v12, OS_LOG_TYPE_DEFAULT, "companion terms response: hasTermsAccepted: %d isExistingAccountTerms: %d responseData %@ userAgent %@", (uint8_t *)&v13, 0x22u);
  }

}

- (void)returnProxiedDeviceForDeviceWithData:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t buf[4];
  int v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pbb_accountsignin_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v11 = 1608;
    v12 = 2080;
    v13 = "-[PBBridgeGizmoController returnProxiedDeviceForDeviceWithData:]";
    _os_log_impl(&dword_2113B6000, v5, OS_LOG_TYPE_DEFAULT, "%d %s", buf, 0x12u);
  }

  objc_msgSend(MEMORY[0x24BE0AD68], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serializedData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBBridgeGizmoController _sendResponseToMessage:withResponseMessageID:withArguments:](self, "_sendResponseToMessage:withResponseMessageID:withArguments:", v4, 25, v8);

}

- (void)setComputedTimeZone:(id)a3
{
  id v3;
  NSObject *v4;
  PBBProtoSendComputedTimeZone *v5;
  void *v6;
  PBBProtoSendComputedTimeZone *v7;
  void *v8;
  NSObject *v9;
  int v10;
  _DWORD v11[7];

  *(_QWORD *)&v11[5] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  pbb_setupflow_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 67109378;
    v11[0] = 1622;
    LOWORD(v11[1]) = 2080;
    *(_QWORD *)((char *)&v11[1] + 2) = "-[PBBridgeGizmoController setComputedTimeZone:]";
    _os_log_impl(&dword_2113B6000, v4, OS_LOG_TYPE_DEFAULT, "%d %s", (uint8_t *)&v10, 0x12u);
  }

  v5 = [PBBProtoSendComputedTimeZone alloc];
  objc_msgSend(v3, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[PBBProtoSendComputedTimeZone initWithData:](v5, "initWithData:", v6);
  -[PBBProtoSendComputedTimeZone computedTimeZone](v7, "computedTimeZone");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  pbb_setupflow_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138412290;
    *(_QWORD *)v11 = v8;
    _os_log_impl(&dword_2113B6000, v9, OS_LOG_TYPE_DEFAULT, "settings computed time zone to %@", (uint8_t *)&v10, 0xCu);
  }

  TMSetSourceTimeZone();
}

- (void)ingestTinkerCredentials:(id)a3
{
  id v4;
  NSObject *v5;
  PBBProtoSendTinkerAccountCredentials *v6;
  void *v7;
  PBBProtoSendTinkerAccountCredentials *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id WeakRetained;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[5];
  id v30;
  id v31;
  uint8_t buf[4];
  int v33;
  __int16 v34;
  const char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pbb_accountsignin_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v33 = 1635;
    v34 = 2080;
    v35 = "-[PBBridgeGizmoController ingestTinkerCredentials:]";
    _os_log_impl(&dword_2113B6000, v5, OS_LOG_TYPE_DEFAULT, "%d %s", buf, 0x12u);
  }

  v6 = [PBBProtoSendTinkerAccountCredentials alloc];
  objc_msgSend(v4, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PBBProtoSendTinkerAccountCredentials initWithData:](v6, "initWithData:", v7);

  -[PBBProtoSendTinkerAccountCredentials username](v8, "username");
  v9 = objc_claimAutoreleasedReturnValue();
  -[PBBProtoSendTinkerAccountCredentials password](v8, "password");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBBProtoSendTinkerAccountCredentials acceptedTermsData](v8, "acceptedTermsData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBBProtoSendTinkerAccountCredentials pairingParentAppleID](v8, "pairingParentAppleID");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBBProtoSendTinkerAccountCredentials pairingParentAltDSID](v8, "pairingParentAltDSID");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)MEMORY[0x24BDD1620];
    v12 = objc_opt_class();
    v31 = 0;
    objc_msgSend(v11, "unarchivedDictionaryWithKeysOfClass:objectsOfClass:fromData:error:", v12, objc_opt_class(), v10, &v31);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v31;
    if (v14)
    {
      pbb_accountsignin_log();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[PBBridgeGizmoController ingestTinkerCredentials:].cold.1();

    }
  }
  else
  {
    v13 = 0;
  }
  v16 = (void *)objc_opt_new();
  v17 = (void *)v9;
  objc_msgSend(v16, "setUsername:", v9);
  objc_msgSend(v16, "setPassword:", v26);
  objc_msgSend(v16, "setAcceptedTermsInfo:", v13);
  objc_msgSend(v16, "setPairingParentAltDSID:", v24);
  objc_msgSend(v16, "setPairingParentUsername:", v25);
  v18 = MEMORY[0x24BDAC760];
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __51__PBBridgeGizmoController_ingestTinkerCredentials___block_invoke;
  v29[3] = &unk_24CBBEA40;
  v29[4] = self;
  v19 = v4;
  v30 = v19;
  v20 = (void *)MEMORY[0x212BD94D4](v29);
  v27[0] = v18;
  v27[1] = 3221225472;
  v27[2] = __51__PBBridgeGizmoController_ingestTinkerCredentials___block_invoke_316;
  v27[3] = &unk_24CBBEA68;
  v27[4] = self;
  v21 = v19;
  v28 = v21;
  v22 = (void *)MEMORY[0x212BD94D4](v27);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "ingestTinkerCredentialsWithContext:completion:", v16, v22);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "ingestTinkerCredentials:forUser:responseCompletion:", v26, v17, v20);
  }

}

void __51__PBBridgeGizmoController_ingestTinkerCredentials___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[3];
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  pbb_accountsignin_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v16 = a3;
    _os_log_impl(&dword_2113B6000, v8, OS_LOG_TYPE_DEFAULT, "response completion called with status: %ld", buf, 0xCu);
  }

  v10 = *(void **)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v11;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v12;
  v14[2] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_sendResponseToMessage:withResponseMessageID:withArguments:", v9, 26, v13);

}

void __51__PBBridgeGizmoController_ingestTinkerCredentials___block_invoke_316(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
  id v20;
  _QWORD v21[3];
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  pbb_accountsignin_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v23 = a3;
    v24 = 2112;
    v25 = v7;
    _os_log_impl(&dword_2113B6000, v8, OS_LOG_TYPE_DEFAULT, "response completion called with status: %ld error: %@", buf, 0x16u);
  }

  objc_msgSend(v7, "localizedDescription");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = &stru_24CBBF548;
  if (v9)
    v11 = (__CFString *)v9;
  v12 = v11;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v13;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v14;
  v21[2] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v21, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v20 = 0;
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, &v20);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v20;
    if (v17)
    {
      pbb_accountsignin_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v17;
        _os_log_impl(&dword_2113B6000, v18, OS_LOG_TYPE_DEFAULT, "error serializing incoming error: %@", buf, 0xCu);
      }

    }
    if (v16)
    {
      objc_msgSend(v15, "arrayByAddingObject:", v16);
      v19 = objc_claimAutoreleasedReturnValue();

      v15 = (void *)v19;
    }
  }
  objc_msgSend(*(id *)(a1 + 32), "_sendResponseToMessage:withResponseMessageID:withArguments:", *(_QWORD *)(a1 + 40), 26, v15);

}

- (void)handleBuysOnWatchIngestion:(id)a3
{
  id v4;
  NSObject *v5;
  PBBProtoSendBuysOnWatchCredentials *v6;
  void *v7;
  PBBProtoSendBuysOnWatchCredentials *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id WeakRetained;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t, uint64_t, void *);
  void *v18;
  PBBridgeGizmoController *v19;
  id v20;
  uint8_t buf[4];
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pbb_accountsignin_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v22 = "-[PBBridgeGizmoController handleBuysOnWatchIngestion:]";
    _os_log_impl(&dword_2113B6000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v6 = [PBBProtoSendBuysOnWatchCredentials alloc];
  objc_msgSend(v4, "data");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PBBProtoSendBuysOnWatchCredentials initWithData:](v6, "initWithData:", v7);

  -[PBBProtoSendBuysOnWatchCredentials username](v8, "username");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBBProtoSendBuysOnWatchCredentials password](v8, "password");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = __54__PBBridgeGizmoController_handleBuysOnWatchIngestion___block_invoke;
  v18 = &unk_24CBBEA40;
  v19 = self;
  v11 = v4;
  v20 = v11;
  v12 = (void *)MEMORY[0x212BD94D4](&v15);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "ingestBuysOnWatchCredentialsUsername:andPassword:responseCompletion:", v9, v10, v12, v15, v16, v17, v18, v19);
  }
  else
  {
    pbb_accountsignin_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v22 = "-[PBBridgeGizmoController handleBuysOnWatchIngestion:]";
      _os_log_impl(&dword_2113B6000, v14, OS_LOG_TYPE_DEFAULT, "%s -- Client doesn't implement handler.", buf, 0xCu);
    }

  }
}

void __54__PBBridgeGizmoController_handleBuysOnWatchIngestion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  __CFString *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  _QWORD v17[3];
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  pbb_accountsignin_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v19 = "-[PBBridgeGizmoController handleBuysOnWatchIngestion:]_block_invoke";
    v20 = 2112;
    v21 = v9;
    _os_log_impl(&dword_2113B6000, v8, OS_LOG_TYPE_DEFAULT, "%s -- Success: %@", buf, 0x16u);

  }
  v11 = *(void **)(a1 + 32);
  v10 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v12;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)v13;
  v15 = CFSTR("no error");
  if (v7)
    v15 = v7;
  v17[1] = v13;
  v17[2] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_sendResponseToMessage:withResponseMessageID:withArguments:", v10, 30, v16);

}

- (void)provideAppViewListImage:(id)a3
{
  id v4;
  PBBProtoAppViewListImageRequest *v5;
  void *v6;
  PBBProtoAppViewListImageRequest *v7;
  NSObject *v8;
  id WeakRetained;
  float v10;
  float v11;
  float v12;
  float v13;
  float v14;
  float v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id buf;
  __int16 v21;
  const char *v22;
  __int16 v23;
  PBBProtoAppViewListImageRequest *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [PBBProtoAppViewListImageRequest alloc];
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PBBProtoAppViewListImageRequest initWithData:](v5, "initWithData:", v6);

  pbb_setupflow_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    buf = (id)0x6B704000302;
    v21 = 2080;
    v22 = "-[PBBridgeGizmoController provideAppViewListImage:]";
    v23 = 2112;
    v24 = v7;
    _os_log_impl(&dword_2113B6000, v8, OS_LOG_TYPE_DEFAULT, ">>>> %d %s request for app view list image received %@", (uint8_t *)&buf, 0x1Cu);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_initWeak(&buf, self);
    -[PBBProtoAppViewListImageRequest width](v7, "width");
    v11 = v10;
    -[PBBProtoAppViewListImageRequest height](v7, "height");
    v13 = v12;
    -[PBBProtoAppViewListImageRequest scale](v7, "scale");
    v15 = v14;
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __51__PBBridgeGizmoController_provideAppViewListImage___block_invoke;
    v17[3] = &unk_24CBBEA90;
    objc_copyWeak(&v19, &buf);
    v18 = v4;
    objc_msgSend(WeakRetained, "provideAppViewListImage:height:scale:completion:", v17, v11, v13, v15);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&buf);
  }
  else
  {
    pbb_setupflow_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_2113B6000, v16, OS_LOG_TYPE_DEFAULT, ">>>> delegate doesn't respond to provideAppViewListImage:width:height:completion", (uint8_t *)&buf, 2u);
    }

  }
}

void __51__PBBridgeGizmoController_provideAppViewListImage___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id WeakRetained;
  void *v9;
  id v10;
  uint8_t buf[4];
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  pbb_setupflow_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v12 = v5;
    v13 = 2112;
    v14 = v6;
    _os_log_impl(&dword_2113B6000, v7, OS_LOG_TYPE_DEFAULT, ">>>> got response to provideAppViewListImage:width:height:completion imageData %@ error %@", buf, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v5)
  {
    v10 = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(WeakRetained, "_sendResponseToMessage:withResponseMessageID:withArguments:", *(_QWORD *)(a1 + 32), 102, v9);

}

- (void)setupDeviceManagement:(id)a3
{
  id v4;
  PBBProtoDeviceManagementSetupRequest *v5;
  void *v6;
  PBBProtoDeviceManagementSetupRequest *v7;
  void *v8;
  id v9;
  id WeakRetained;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id location;

  v4 = a3;
  v5 = [PBBProtoDeviceManagementSetupRequest alloc];
  objc_msgSend(v4, "data");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PBBProtoDeviceManagementSetupRequest initWithData:](v5, "initWithData:", v6);

  -[PBBProtoDeviceManagementSetupRequest configurationData](v7, "configurationData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_initWeak(&location, self);
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __49__PBBridgeGizmoController_setupDeviceManagement___block_invoke;
    v11[3] = &unk_24CBBEAB8;
    v12 = v9;
    objc_copyWeak(&v14, &location);
    v13 = v4;
    objc_msgSend(WeakRetained, "setupDeviceManagementWithData:completion:", v8, v11);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(v9, "addObject:", MEMORY[0x24BDBD1C0]);
    -[PBBridgeGizmoController _sendResponseToMessage:withResponseMessageID:withArguments:](self, "_sendResponseToMessage:withResponseMessageID:withArguments:", v4, 31, v9);
  }

}

void __49__PBBridgeGizmoController_setupDeviceManagement___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id WeakRetained;
  id v12;

  v5 = a3;
  if (v5)
  {
    v12 = 0;
    objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, &v12);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v12;
    if (v7)
    {
      pbb_devicemanagement_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __49__PBBridgeGizmoController_setupDeviceManagement___block_invoke_cold_1();

    }
  }
  else
  {
    v6 = 0;
  }
  v9 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v10);

  if (v6)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_sendResponseToMessage:withResponseMessageID:withArguments:", *(_QWORD *)(a1 + 40), 31, *(_QWORD *)(a1 + 32));

}

- (void)checkAppInstallationAllowed:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BE63CB0];
  v5 = a3;
  objc_msgSend(v4, "sharedConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "effectiveBoolValueForSetting:", *MEMORY[0x24BE637B0]) == 2;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBBridgeGizmoController _sendResponseToMessage:withResponseMessageID:withArguments:](self, "_sendResponseToMessage:withResponseMessageID:withArguments:", v5, 32, v9);

}

- (void)updateNanoRegistryToNormalState:(id)a3
{
  NSObject *v4;
  PBBridgeConnectionDelegate **p_delegate;
  id WeakRetained;
  char v7;
  id v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  pbb_setupflow_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315138;
    v10 = "-[PBBridgeGizmoController updateNanoRegistryToNormalState:]";
    _os_log_impl(&dword_2113B6000, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v9, 0xCu);
  }

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    v8 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v8, "updateNanoRegisryToNormalState");

  }
}

- (PBBridgeConnectionDelegate)delegate
{
  return (PBBridgeConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)languageIdentifer
{
  return self->_languageIdentifer;
}

- (NSString)regionIdentifer
{
  return self->_regionIdentifer;
}

- (BOOL)canBeginActivation
{
  return self->_canBeginActivation;
}

- (BOOL)readyToCreatePasscode
{
  return self->_readyToCreatePasscode;
}

- (unsigned)activationState
{
  return self->_activationState;
}

- (NSTimer)activationTimeout
{
  return self->_activationTimeout;
}

- (void)setActivationTimeout:(id)a3
{
  objc_storeStrong((id *)&self->_activationTimeout, a3);
}

- (NSString)internalLastSendMessageID
{
  return self->_internalLastSendMessageID;
}

- (void)setInternalLastSendMessageID:(id)a3
{
  objc_storeStrong((id *)&self->_internalLastSendMessageID, a3);
}

- (id)updateLanguageCompletion
{
  return self->_updateLanguageCompletion;
}

- (void)setUpdateLanguageCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (id)updateRegionCompletion
{
  return self->_updateRegionCompletion;
}

- (void)setUpdateRegionCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (id)sessionCompletion
{
  return self->_sessionCompletion;
}

- (void)setSessionCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (id)activationCompletion
{
  return self->_activationCompletion;
}

- (void)setActivationCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (id)siriStateCompletion
{
  return self->_siriStateCompletion;
}

- (void)setSiriStateCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (id)enableSiriCompletion
{
  return self->_enableSiriCompletion;
}

- (void)setEnableSiriCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_enableSiriCompletion, 0);
  objc_storeStrong(&self->_siriStateCompletion, 0);
  objc_storeStrong(&self->_activationCompletion, 0);
  objc_storeStrong(&self->_sessionCompletion, 0);
  objc_storeStrong(&self->_updateRegionCompletion, 0);
  objc_storeStrong(&self->_updateLanguageCompletion, 0);
  objc_storeStrong((id *)&self->_internalLastSendMessageID, 0);
  objc_storeStrong((id *)&self->_activationTimeout, 0);
  objc_storeStrong((id *)&self->_regionIdentifer, 0);
  objc_storeStrong((id *)&self->_languageIdentifer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_sendRemoteCommandWithMessageID:withArguments:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2113B6000, v0, v1, "Error archiving NSError: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)handleActivationData:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2113B6000, a1, a3, "Error! Missing sessionCompletion && activationCompletion", a5, a6, a7, a8, 0);
}

- (void)handleActivationData:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2113B6000, v0, v1, "Error Unarchiving Object! %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)handleActivationData:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_2113B6000, a1, a3, "Tried to do %s while already unbricked.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)activationTimeout:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  const __CFString *v2;
  uint64_t v3;
  int v4;
  const __CFString *v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if ((unsigned __int16)(*(_WORD *)(a1 + 50) - 2) > 3u)
    v2 = CFSTR("Idle");
  else
    v2 = off_24CBBEAF0[(__int16)(*(_WORD *)(a1 + 50) - 2)];
  v3 = *(_QWORD *)(a1 + 88);
  v4 = 138412546;
  v5 = v2;
  v6 = 2112;
  v7 = v3;
  _os_log_error_impl(&dword_2113B6000, a2, OS_LOG_TYPE_ERROR, "Activation timeout in phase (%@) (Last message sent was %@)", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

- (void)setPasscodeRestrictions:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2113B6000, v0, v1, "Couldn’t apply passcode restrictions! %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __41__PBBridgeGizmoController_setDeviceName___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2113B6000, a1, a3, "Failed to connect to lockdown.", a5, a6, a7, a8, 0);
}

void __41__PBBridgeGizmoController_setDeviceName___block_invoke_cold_2(uint64_t *a1, int a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 138412546;
  v5 = v3;
  v6 = 1024;
  v7 = a2;
  _os_log_error_impl(&dword_2113B6000, log, OS_LOG_TYPE_ERROR, "Failed to set define name (%@) with error: %d", (uint8_t *)&v4, 0x12u);
  OUTLINED_FUNCTION_1_0();
}

- (void)ingestTinkerCredentials:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2113B6000, v0, v1, "error unarchiving terms info: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __49__PBBridgeGizmoController_setupDeviceManagement___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2113B6000, v0, v1, "error serializing device management information: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
