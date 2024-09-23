@implementation PBBridgeCompanionController

- (PBBridgeCompanionController)init
{
  PBBridgeCompanionController *v2;
  void *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *timeoutTrackerQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PBBridgeCompanionController;
  v2 = -[PBBridgeCompanionController init](&v7, sel_init);
  if (v2)
  {
    xpc_set_event_stream_handler("com.apple.notifyd.matching", MEMORY[0x24BDAC9B8], &__block_literal_global_8);
    if (PBIsInternalInstall())
    {
      objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v2->_allowAnyHTTPSCertificate = objc_msgSend(v3, "BOOLForKey:", CFSTR("ActivationAllowAnyHTTPSCertificate"));

    }
    v4 = dispatch_queue_create("com.apple.Bridge.timeout.tracker.queue", 0);
    timeoutTrackerQueue = v2->_timeoutTrackerQueue;
    v2->_timeoutTrackerQueue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (void)setRemoteUIStyle:(id)a3
{
  objc_storeStrong((id *)&self->_remoteUIStyle, a3);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
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
  id v32;

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProtobufAction:forIncomingRequestsOfType:", sel_gizmoBecameAvailableWantsConfirmation_, 1);

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setProtobufAction:forIncomingRequestsOfType:", sel_sendProxyActivationRequest_, 2);

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setProtobufAction:forIncomingRequestsOfType:", sel_gizmoDidBeginActivating_, 3);

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProtobufAction:forIncomingRequestsOfType:", sel_gizmoDidFinishActivating_, 4);

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProtobufAction:forIncomingRequestsOfType:", sel_gizmoDidFinishActivating_, 21);

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setProtobufAction:forIncomingRequestsOfType:", sel_getCompanionLanguage_, 5);

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setProtobufAction:forIncomingRequestsOfType:", sel_getCompanionRegion_, 6);

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setProtobufAction:forIncomingRequestsOfType:", sel_gizmoDidEndPasscodeCreation_, 7);

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setProtobufAction:forIncomingRequestsOfType:", sel_gizmoDidEndPasscodeChange_, 28);

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setProtobufAction:forIncomingRequestsOfType:", sel_gizmoDidBeginUnlockPairing_, 19);

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setProtobufAction:forIncomingRequestsOfType:", sel_gizmoDidEndUnlockPairing_, 13);

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setProtobufAction:forIncomingRequestsOfType:", sel_getSiriState_, 8);

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setProtobufAction:forIncomingRequestsOfType:", sel_gizmoActivationFailed_, 12);

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setProtobufAction:forIncomingRequestsOfType:", sel_handlePerformanceResults_, 16);

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setProtobufAction:forIncomingResponsesOfType:", sel_handleWarrantySentinelResponse_, 14);

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setProtobufAction:forIncomingResponsesOfType:", sel_handleOfflineTermsResponse_, 15);

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setProtobufAction:forIncomingRequestsOfType:", sel_gizmoFailedToCreatePasscode_, 17);

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setProtobufAction:forIncomingResponsesOfType:", sel_watchDidPrepareForInitialSync_, 18);

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setProtobufAction:forIncomingRequestsOfType:", sel_watchDidRespondWithLanguageAndLocaleStatus_, 20);

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setProtobufAction:forIncomingRequestsOfType:", sel_watchDidIngestWirelessCredentials_, 22);

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setProtobufAction:forIncomingResponsesOfType:", sel_watchDidPrepareForForcedSU_, 23);

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setProtobufAction:forIncomingRequestsOfType:", sel_handleRemoteActivationDetails_, 27);

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setProtobufAction:forIncomingResponsesOfType:", sel_returnedRemoteAccountForDevice_, 25);

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setProtobufAction:forIncomingResponsesOfType:", sel_tinkerWatchIngestedCredentials_, 26);

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setProtobufAction:forIncomingRequestsOfType:", sel_tinkerFinishedHealthSharingOptIn_, 29);

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setProtobufAction:forIncomingResponsesOfType:", sel_acknowledgeBuysOnWatchCredentialIngestion_, 30);

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setProtobufAction:forIncomingResponsesOfType:", sel_handleAppViewListImageResponse_, 102);

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setProtobufAction:forIncomingResponsesOfType:", sel_handleDeviceManagementResponse_, 31);

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setProtobufAction:forIncomingResponsesOfType:", sel_handleApplicationInstallRestrictionResponse_, 32);

  -[PBBridgeIDSServiceDelegate service](self, "service");
  v32 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setProtobufAction:forIncomingResponsesOfType:", sel_watchDidApplyWirelessCredentials_, 33);

}

- (void)beginSetupTransaction
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PBBridgeCompanionController;
  -[PBBridgeIDSServiceDelegate beginSetupTransaction](&v3, sel_beginSetupTransaction);
  -[PBBridgeCompanionController invalidateTimeoutTimerWithNewActivationGranularState:](self, "invalidateTimeoutTimerWithNewActivationGranularState:", 0);
}

- (void)endSetupTransaction
{
  id languageLocaleCompletion;
  NSString *remoteActivationUserAgent;
  NSURLConnection *activationConnection;
  NSMutableURLRequest *activationRequest;
  NSMutableData *activationData;
  NSString *contentType;
  RUILoader *ruiLoader;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PBBridgeCompanionController;
  -[PBBridgeIDSServiceDelegate endSetupTransaction](&v10, sel_endSetupTransaction);
  languageLocaleCompletion = self->_languageLocaleCompletion;
  self->_languageLocaleCompletion = 0;

  remoteActivationUserAgent = self->_remoteActivationUserAgent;
  self->_remoteActivationUserAgent = 0;

  -[PBBridgeCompanionController invalidateTimeoutTimerWithNewActivationGranularState:](self, "invalidateTimeoutTimerWithNewActivationGranularState:", 0);
  -[NSURLConnection cancel](self->_activationConnection, "cancel");
  activationConnection = self->_activationConnection;
  self->_activationConnection = 0;

  activationRequest = self->_activationRequest;
  self->_activationRequest = 0;

  activationData = self->_activationData;
  self->_activationData = 0;

  contentType = self->_contentType;
  self->_contentType = 0;

  -[RUILoader cancel](self->_ruiLoader, "cancel");
  -[RUILoader setDelegate:](self->_ruiLoader, "setDelegate:", 0);
  ruiLoader = self->_ruiLoader;
  self->_ruiLoader = 0;

  self->_connectionFailed = 0;
  self->_nonSilentActivation = 0;
  self->_sentSessionRequest = 0;
  self->_sentActivationRequest = 0;
}

- (id)serviceIdentifier
{
  return CFSTR("com.apple.private.alloy.pbbridge");
}

- (double)offsetEventTime
{
  return CFAbsoluteTimeGetCurrent() + *(double *)&PBBridgeAnimationSyncOffsetTime;
}

- (BOOL)_sendRemoteCommandWithMessageID:(unsigned __int16)a3 withArguments:(id)a4
{
  uint64_t v4;
  id v6;
  PBBProtoBecameActive *v7;
  void *v8;
  void *v9;
  __objc2_class *v10;
  void *v11;
  __objc2_class *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  PBBProtoBecameActive *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSString *v25;
  NSString *internalLastSendMessageID;
  PBBProtoWarrantySentinel *v28;
  void *v29;
  void *v30;
  PBBProtoSendWirelessCredentialsToWatch *v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t k;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  id v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  float v52;
  PBBProtoSetPasscodeRestrictions *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t i;
  uint64_t v60;
  void *v61;
  PBBridgeCompanionController *v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  NSObject *v70;
  void *v71;
  __objc2_class *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  char isKindOfClass;
  void *v82;
  void *v83;
  char v84;
  void *v85;
  void *v86;
  char v87;
  void *v88;
  void *v89;
  char v90;
  void *v91;
  void *v92;
  char v93;
  void *v94;
  void *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t j;
  void *v100;
  NSObject *v101;
  void *v102;
  void *v103;
  id v104;
  NSObject *v105;
  void *v106;
  double v107;
  void *v108;
  double v109;
  double v110;
  void *v111;
  char v112;
  void *v113;
  uint64_t v114;
  void *v115;
  __CFString *v116;
  __CFString *v117;
  void *v118;
  void *v119;
  void *v120;
  PBBridgeCompanionController *v121;
  id v122;
  id v123;
  uint64_t v124;
  id v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  id v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  char v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  uint8_t buf[4];
  id v141;
  __int16 v142;
  void *v143;
  _BYTE v144[128];
  _BYTE v145[128];
  _BYTE v146[128];
  uint64_t v147;

  v4 = a3;
  v147 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  switch((int)v4)
  {
    case 1:
      v7 = objc_alloc_init(PBBProtoBecameActive);
      objc_msgSend(v6, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBBProtoBecameActive setWantsConfirmation:](v7, "setWantsConfirmation:", objc_msgSend(v8, "BOOLValue"));
      goto LABEL_17;
    case 2:
      v7 = objc_alloc_init(PBBProtoHandleActivationData);
      objc_msgSend(v6, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBBProtoBecameActive setActivationData:](v7, "setActivationData:", v9);

      objc_msgSend(v6, "lastObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBBProtoBecameActive setResponseHeaders:](v7, "setResponseHeaders:", v8);
      goto LABEL_17;
    case 3:
      v10 = PBBProtoPushControllerType;
      goto LABEL_6;
    case 4:
      v10 = PBBProtoPopToControllerType;
LABEL_6:
      v7 = (PBBProtoBecameActive *)objc_alloc_init(v10);
      objc_msgSend(v6, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBBProtoBecameActive setControllerType:](v7, "setControllerType:", objc_msgSend(v11, "intValue"));

      -[PBBridgeCompanionController offsetEventTime](self, "offsetEventTime");
      -[PBBProtoBecameActive setIntendedFireDate:](v7, "setIntendedFireDate:");
      goto LABEL_18;
    case 5:
      v7 = objc_alloc_init(PBBProtoSetLanguage);
      objc_msgSend(v6, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBBProtoBecameActive setLanguage:](v7, "setLanguage:", v8);
      goto LABEL_17;
    case 6:
      v7 = objc_alloc_init(PBBProtoSetRegion);
      objc_msgSend(v6, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PBBProtoBecameActive setRegion:](v7, "setRegion:", v8);
      goto LABEL_17;
    case 7:
      v12 = PBBProtoSiriEnabled;
      goto LABEL_14;
    case 8:
      v12 = PBBProtoLocationServicesEnabled;
      goto LABEL_14;
    case 10:
      v12 = PBBProtoDiagnosticsEnabled;
LABEL_14:
      v7 = (PBBProtoBecameActive *)objc_alloc_init(v12);
      objc_msgSend(v6, "firstObject");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:
      v8 = v14;
      -[PBBProtoBecameActive setEnabled:](v7, "setEnabled:", objc_msgSend(v14, "BOOLValue"));
      goto LABEL_17;
    case 17:
      v7 = objc_alloc_init(PBBProtoDevicesLockedOn);
      -[PBBridgeCompanionController offsetEventTime](self, "offsetEventTime");
      v16 = v15;
      objc_msgSend(v6, "firstObject");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "doubleValue");
      -[PBBProtoBecameActive setIntendedFireDate:](v7, "setIntendedFireDate:", v16 + v17);
LABEL_17:

LABEL_18:
      v18 = v7;
LABEL_19:
      -[PBBProtoBecameActive data](v18, "data");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      if ((v4 & 0xFFFFFFFB) != 0xB)
      {
        switch((int)v4)
        {
          case 14:
            v28 = objc_alloc_init(PBBProtoWarrantySentinel);
            if (v6)
            {
              objc_msgSend(v6, "firstObject");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              if ((unint64_t)objc_msgSend(v6, "count") < 2)
              {
                v30 = 0;
              }
              else
              {
                objc_msgSend(v6, "lastObject");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
              }
              if (v29)
              {
                objc_msgSend(MEMORY[0x24BDBCEF8], "null");
                v111 = (void *)objc_claimAutoreleasedReturnValue();
                v112 = objc_msgSend(v29, "isEqual:", v111);

                if ((v112 & 1) == 0)
                  -[PBBProtoWarrantySentinel setRemoveSentinel:](v28, "setRemoveSentinel:", objc_msgSend(v29, "BOOLValue"));
              }
              if (v30)
                -[PBBProtoWarrantySentinel setDeviceName:](v28, "setDeviceName:", v30);
              objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
              v113 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v113, "localeIdentifier");
              v114 = objc_claimAutoreleasedReturnValue();
              v115 = (void *)v114;
              v116 = CFSTR("en_US");
              if (v114)
                v116 = (__CFString *)v114;
              v117 = v116;

              -[PBBProtoWarrantySentinel setAppleLocale:](v28, "setAppleLocale:", v117);
              v118 = (void *)MEMORY[0x24BDBCEB8];
              objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
              v119 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v118, "arrayWithArray:", v119);
              v120 = (void *)objc_claimAutoreleasedReturnValue();

              -[PBBProtoWarrantySentinel setAppleLanguages:](v28, "setAppleLanguages:", v120);
            }
            goto LABEL_125;
          case 15:
          case 17:
            break;
          case 16:
            v28 = objc_alloc_init(PBBProtoOfflineTerms);
            objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "objectForKey:", *MEMORY[0x24BDBCB20]);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "lowercaseString");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            -[PBBProtoWarrantySentinel setLanguageCode:](v28, "setLanguageCode:", v45);

            objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "objectForKey:", *MEMORY[0x24BDBCAE8]);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "uppercaseString");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            -[PBBProtoWarrantySentinel setCountryCode:](v28, "setCountryCode:", v48);

            objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = (void *)objc_msgSend(v49, "mutableCopy");
            -[PBBProtoWarrantySentinel setAppleLanguages:](v28, "setAppleLanguages:", v50);

            -[PBBProtoWarrantySentinel data](v28, "data");
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_126;
          case 18:
            v7 = objc_alloc_init(PBBProtoTellGizmoToSetCrownOrientation);
            objc_msgSend(v6, "firstObject");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            -[PBBProtoBecameActive setCrownOrientationRight:](v7, "setCrownOrientationRight:", objc_msgSend(v8, "BOOLValue"));
            goto LABEL_17;
          case 19:
            v7 = objc_alloc_init(PBBProtoInitialSyncStateUpdate);
            objc_msgSend(v6, "firstObject");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "floatValue");
            -[PBBProtoBecameActive setProgress:](v7, "setProgress:", v52);

            objc_msgSend(v6, "lastObject");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            -[PBBProtoBecameActive setState:](v7, "setState:", objc_msgSend(v8, "intValue"));
            goto LABEL_17;
          case 20:
            v53 = objc_alloc_init(PBBProtoSetPasscodeRestrictions);
            objc_msgSend(MEMORY[0x24BDBCEC8], "data");
            v124 = objc_claimAutoreleasedReturnValue();
            v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1618]), "initForWritingWithMutableData:", v124);
            v123 = v6;
            objc_msgSend(v6, "firstObject");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v136 = 0u;
            v137 = 0u;
            v138 = 0u;
            v139 = 0u;
            v56 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v136, v146, 16);
            if (v56)
            {
              v57 = v56;
              v58 = *(_QWORD *)v137;
              do
              {
                for (i = 0; i != v57; ++i)
                {
                  if (*(_QWORD *)v137 != v58)
                    objc_enumerationMutation(v55);
                  v60 = *(_QWORD *)(*((_QWORD *)&v136 + 1) + 8 * i);
                  objc_msgSend(v55, "objectForKey:", v60);
                  v61 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v54, "encodeObject:forKey:", v61, v60);

                }
                v57 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v136, v146, 16);
              }
              while (v57);
            }
            v62 = self;
            objc_msgSend(v54, "finishEncoding");
            v63 = (void *)v124;
            -[PBBProtoSetPasscodeRestrictions setRestrictions:](v53, "setRestrictions:", v124);
            v64 = (id)*MEMORY[0x24BDF74F8];
            objc_msgSend(v64, "activeWatch");
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            v66 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6B2C0]), "initWithDomain:pairedDevice:", CFSTR("com.apple.Carousel"), v65);
            v67 = v66;
            if (v66)
            {
              v135 = 0;
              v68 = objc_msgSend(v66, "BOOLForKey:keyExistsAndHasValidFormat:", CFSTR("DisableWristDetection"), &v135);
              if (v135)
              {
                v69 = v68;
                -[PBBProtoSetPasscodeRestrictions setWristDetectionDisabled:](v53, "setWristDetectionDisabled:", v68);
                pbb_setupflow_log();
                v70 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
                {
                  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v69);
                  v71 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v141 = v71;
                  _os_log_impl(&dword_2113B6000, v70, OS_LOG_TYPE_DEFAULT, "sending restrictions + disableWristDection = %@", buf, 0xCu);

                }
                v63 = (void *)v124;
              }
            }
            -[PBBProtoSetPasscodeRestrictions data](v53, "data");
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            v6 = v123;
            self = v62;
            goto LABEL_20;
          case 21:
            v72 = PBBProtoPrepareWatchForInitialSync;
            goto LABEL_95;
          case 22:
            v72 = PBBProtoBeganWaitingForPresentationOfActivationEvent;
            goto LABEL_95;
          case 23:
            v72 = PBBProtoBeganWaitingForUserResponseToActivationEvent;
            goto LABEL_95;
          case 24:
            v72 = PBBProtoSendActivationEventKeepAlive;
            goto LABEL_95;
          case 25:
            v28 = objc_alloc_init(PBBProtoSendLanguageAndLocale);
            if ((unint64_t)objc_msgSend(v6, "count") >= 2)
            {
              objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              -[PBBProtoWarrantySentinel setAppleLanguages:](v28, "setAppleLanguages:", v73);

              objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
              v74 = (void *)objc_claimAutoreleasedReturnValue();
              -[PBBProtoWarrantySentinel setAppleLocale:](v28, "setAppleLocale:", v74);

            }
            if (objc_msgSend(v6, "count") == 3)
            {
              objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
              v75 = (void *)objc_claimAutoreleasedReturnValue();
              if (v75)
              {
                v76 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1618]), "initRequiringSecureCoding:", 1);
                objc_msgSend(v76, "encodeObject:forKey:", v75, CFSTR("PBBridgeLocalePreferencesKey"));
                objc_msgSend(v76, "finishEncoding");
                objc_msgSend(v76, "encodedData");
                v77 = (void *)objc_claimAutoreleasedReturnValue();
                -[PBBProtoWarrantySentinel setArchivedPreferences:](v28, "setArchivedPreferences:", v77);

              }
            }
            goto LABEL_125;
          case 26:
            v28 = objc_alloc_init(PBBProtoDemoWirelessCredentials);
            objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            -[PBBProtoWarrantySentinel setSsid:](v28, "setSsid:", v78);

            objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            -[PBBProtoWarrantySentinel setPassword:](v28, "setPassword:", v79);

            if (PBShouldOfferBetterTogetherFlow())
              -[PBBProtoWarrantySentinel setCompanionDemoConfig:](v28, "setCompanionDemoConfig:", 1);
            goto LABEL_125;
          case 27:
            v72 = PBBProtoPrepareWatchForForcedSU;
            goto LABEL_95;
          case 28:
            v7 = objc_alloc_init(PBBProtoSetSiriEnabled);
            objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_15;
          case 29:
            v72 = PBBProtoRemoteAccountForDevice;
            goto LABEL_95;
          case 30:
            v28 = objc_alloc_init(PBBProtoSendTinkerAccountCredentials);
            objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            isKindOfClass = objc_opt_isKindOfClass();

            if ((isKindOfClass & 1) == 0)
            {
              objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
              v82 = (void *)objc_claimAutoreleasedReturnValue();
              -[PBBProtoWarrantySentinel setUsername:](v28, "setUsername:", v82);

            }
            objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v84 = objc_opt_isKindOfClass();

            if ((v84 & 1) == 0)
            {
              objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
              v85 = (void *)objc_claimAutoreleasedReturnValue();
              -[PBBProtoWarrantySentinel setPassword:](v28, "setPassword:", v85);

            }
            objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v87 = objc_opt_isKindOfClass();

            if ((v87 & 1) == 0)
            {
              objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
              v88 = (void *)objc_claimAutoreleasedReturnValue();
              -[PBBProtoWarrantySentinel setAcceptedTermsData:](v28, "setAcceptedTermsData:", v88);

            }
            objc_msgSend(v6, "objectAtIndexedSubscript:", 3);
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v90 = objc_opt_isKindOfClass();

            if ((v90 & 1) == 0)
            {
              objc_msgSend(v6, "objectAtIndexedSubscript:", 3);
              v91 = (void *)objc_claimAutoreleasedReturnValue();
              -[PBBProtoWarrantySentinel setPairingParentAppleID:](v28, "setPairingParentAppleID:", v91);

            }
            objc_msgSend(v6, "objectAtIndexedSubscript:", 4);
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            v93 = objc_opt_isKindOfClass();

            if ((v93 & 1) == 0)
            {
              objc_msgSend(v6, "objectAtIndexedSubscript:", 4);
              v94 = (void *)objc_claimAutoreleasedReturnValue();
              -[PBBProtoWarrantySentinel setPairingParentAltDSID:](v28, "setPairingParentAltDSID:", v94);
LABEL_115:

            }
LABEL_125:
            -[PBBProtoWarrantySentinel data](v28, "data");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_126:

            goto LABEL_20;
          case 31:
            v12 = PBBProtoTinkerMessagesInCloudEnabled;
            goto LABEL_14;
          case 32:
            v7 = objc_alloc_init(PBBProtoSendBuysOnWatchCredentials);
            objc_msgSend(v6, "firstObject");
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            -[PBBProtoBecameActive setUsername:](v7, "setUsername:", v95);

            objc_msgSend(v6, "lastObject");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            -[PBBProtoBecameActive setPassword:](v7, "setPassword:", v8);
            goto LABEL_17;
          case 33:
            v12 = PBBProtoTinkerFitnessRouteTrackingEnabled;
            goto LABEL_14;
          case 34:
            v7 = objc_alloc_init(PBBProtoDeviceManagementSetupRequest);
            objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            -[PBBProtoBecameActive setConfigurationData:](v7, "setConfigurationData:", v8);
            goto LABEL_17;
          case 35:
            v72 = PBBProtoApplicationInstallRestrictionRequest;
            goto LABEL_95;
          case 36:
            v72 = PBBProtoUpdateNanoRegistryToNormalState;
LABEL_95:
            v18 = (PBBProtoBecameActive *)objc_alloc_init(v72);
            v7 = v18;
            goto LABEL_19;
          case 37:
            v121 = self;
            v31 = objc_alloc_init(PBBProtoSendWirelessCredentialsToWatch);
            v126 = 0u;
            v127 = 0u;
            v128 = 0u;
            v129 = 0u;
            v122 = v6;
            v32 = v6;
            v96 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v126, v144, 16);
            if (v96)
            {
              v97 = v96;
              v98 = *(_QWORD *)v127;
              do
              {
                for (j = 0; j != v97; ++j)
                {
                  if (*(_QWORD *)v127 != v98)
                    objc_enumerationMutation(v32);
                  v100 = *(void **)(*((_QWORD *)&v126 + 1) + 8 * j);
                  pbb_setupflow_log();
                  v101 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
                  {
                    objc_msgSend(v100, "objectForKeyedSubscript:", CFSTR("SSID_STR"));
                    v102 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412290;
                    v141 = v102;
                    _os_log_impl(&dword_2113B6000, v101, OS_LOG_TYPE_DEFAULT, "Sending: %@", buf, 0xCu);

                  }
                  v125 = 0;
                  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v100, 1, &v125);
                  v103 = (void *)objc_claimAutoreleasedReturnValue();
                  v104 = v125;
                  if (v104)
                  {
                    pbb_setupflow_log();
                    v105 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v105, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)buf = 138412290;
                      v141 = v104;
                      _os_log_error_impl(&dword_2113B6000, v105, OS_LOG_TYPE_ERROR, "Failed to Archive network record: %@", buf, 0xCu);
                    }

                  }
                  else
                  {
                    -[PBBProtoSendWirelessCredentialsToWatch addSerializedNetworkRecord:](v31, "addSerializedNetworkRecord:", v103);
                  }

                }
                v97 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v126, v144, 16);
              }
              while (v97);
            }
LABEL_110:

            -[PBBProtoSendWirelessCredentialsToWatch data](v31, "data");
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            self = v121;
            v6 = v122;
            goto LABEL_20;
          default:
            switch((int)v4)
            {
              case 'h':
                v121 = self;
                v31 = objc_alloc_init(PBBProtoTinkerWirelessCredentials);
                v131 = 0u;
                v132 = 0u;
                v133 = 0u;
                v134 = 0u;
                v122 = v6;
                v32 = v6;
                v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v131, v145, 16);
                if (v33)
                {
                  v34 = v33;
                  v35 = *(_QWORD *)v132;
                  do
                  {
                    for (k = 0; k != v34; ++k)
                    {
                      if (*(_QWORD *)v132 != v35)
                        objc_enumerationMutation(v32);
                      v37 = *(void **)(*((_QWORD *)&v131 + 1) + 8 * k);
                      pbb_setupflow_log();
                      v38 = objc_claimAutoreleasedReturnValue();
                      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
                      {
                        objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("SSID_STR"));
                        v39 = (void *)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138412290;
                        v141 = v39;
                        _os_log_impl(&dword_2113B6000, v38, OS_LOG_TYPE_DEFAULT, "Sending: %@", buf, 0xCu);

                      }
                      v130 = 0;
                      objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v37, 1, &v130);
                      v40 = (void *)objc_claimAutoreleasedReturnValue();
                      v41 = v130;
                      if (v41)
                      {
                        pbb_setupflow_log();
                        v42 = objc_claimAutoreleasedReturnValue();
                        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)buf = 138412290;
                          v141 = v41;
                          _os_log_error_impl(&dword_2113B6000, v42, OS_LOG_TYPE_ERROR, "Failed to Archive network record: %@", buf, 0xCu);
                        }

                      }
                      -[PBBProtoSendWirelessCredentialsToWatch addSerializedNetworkRecord:](v31, "addSerializedNetworkRecord:", v40, v121);

                    }
                    v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v131, v145, 16);
                  }
                  while (v34);
                }
                goto LABEL_110;
              case 'n':
                v7 = objc_alloc_init(PBBProtoDeviceName);
                objc_msgSend(v6, "firstObject");
                v8 = (void *)objc_claimAutoreleasedReturnValue();
                -[PBBProtoBecameActive setDeviceName:](v7, "setDeviceName:", v8);
                goto LABEL_17;
              case 'o':
                v7 = objc_alloc_init(PBBProtoSendComputedTimeZone);
                objc_msgSend(v6, "firstObject");
                v8 = (void *)objc_claimAutoreleasedReturnValue();
                -[PBBProtoBecameActive setComputedTimeZone:](v7, "setComputedTimeZone:", v8);
                goto LABEL_17;
              case 'p':
                v7 = objc_alloc_init(PBBProtoTinkerSetLauncherViewMode);
                objc_msgSend(v6, "firstObject");
                v8 = (void *)objc_claimAutoreleasedReturnValue();
                -[PBBProtoBecameActive setLauncherViewMode:](v7, "setLauncherViewMode:", objc_msgSend(v8, "integerValue"));
                goto LABEL_17;
              case 'q':
                v28 = objc_alloc_init(PBBProtoAppViewListImageRequest);
                objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
                v106 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v106, "doubleValue");
                *(float *)&v107 = v107;
                -[PBBProtoWarrantySentinel setWidth:](v28, "setWidth:", v107);

                objc_msgSend(v6, "objectAtIndexedSubscript:", 1);
                v108 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v108, "doubleValue");
                *(float *)&v109 = v109;
                -[PBBProtoWarrantySentinel setHeight:](v28, "setHeight:", v109);

                objc_msgSend(v6, "objectAtIndexedSubscript:", 2);
                v94 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v94, "doubleValue");
                *(float *)&v110 = v110;
                -[PBBProtoWarrantySentinel setScale:](v28, "setScale:", v110);
                goto LABEL_115;
              default:
                goto LABEL_12;
            }
        }
      }
LABEL_12:
      objc_msgSend(MEMORY[0x24BDBCE50], "data");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      break;
  }
LABEL_20:
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE4FE40]), "initWithProtobufData:type:isResponse:", v13, v4, 0);
  pbb_setupflow_log();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    PBBGMessageDescription(v4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v141 = v21;
    v142 = 2112;
    v143 = v19;
    _os_log_impl(&dword_2113B6000, v20, OS_LOG_TYPE_DEFAULT, "Sending Protobuf (%@ -- %@)", buf, 0x16u);

  }
  -[PBBridgeIDSServiceDelegate service](self, "service");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBBridgeIDSServiceDelegate sendProtoBuf:service:priority:responseIdentifier:expectsResponse:retryCount:retryInterval:](self, "sendProtoBuf:service:priority:responseIdentifier:expectsResponse:retryCount:retryInterval:", v19, v22, 300, 0, 0, -1, -1.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  pbb_setupflow_log();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v141 = v23;
    _os_log_impl(&dword_2113B6000, v24, OS_LOG_TYPE_DEFAULT, "Got IDS identitifer: %@", buf, 0xCu);
  }

  if (v4 <= 0xF && ((1 << v4) & 0x8804) != 0 && PBIsInternalInstall())
  {
    v25 = (NSString *)objc_msgSend(v23, "copy");
    internalLastSendMessageID = self->_internalLastSendMessageID;
    self->_internalLastSendMessageID = v25;

  }
  return 0;
}

- (BOOL)_sendResponseToMessage:(id)a3 withResponseMessageID:(unsigned __int16)a4 withArguments:(id)a5
{
  uint64_t v5;
  objc_class *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v5 = a4;
  v22 = *MEMORY[0x24BDAC8D0];
  v7 = (objc_class *)MEMORY[0x24BE4FE40];
  v8 = a3;
  v9 = (void *)objc_msgSend([v7 alloc], "initWithProtobufData:type:isResponse:", 0, v5, 1);
  pbb_setupflow_log();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    PBBGMessageDescription(v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412546;
    v19 = v11;
    v20 = 2112;
    v21 = v9;
    _os_log_impl(&dword_2113B6000, v10, OS_LOG_TYPE_DEFAULT, "Sending Response Protobuf (%@ -- %@)", (uint8_t *)&v18, 0x16u);

  }
  -[PBBridgeIDSServiceDelegate service](self, "service");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "outgoingResponseIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBBridgeIDSServiceDelegate sendProtoBuf:service:priority:responseIdentifier:expectsResponse:retryCount:retryInterval:](self, "sendProtoBuf:service:priority:responseIdentifier:expectsResponse:retryCount:retryInterval:", v9, v12, 300, v14, 0, -1, -1.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  pbb_setupflow_log();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138412290;
    v19 = v15;
    _os_log_impl(&dword_2113B6000, v16, OS_LOG_TYPE_DEFAULT, "Message sent with IDS id: %@", (uint8_t *)&v18, 0xCu);
  }

  return 0;
}

- (BOOL)shouldHandleMessageType:(unsigned __int16)a3 fromId:(id)a4
{
  int v4;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v4 = a3;
  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  -[PBBridgeIDSServiceDelegate service](self, "service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "linkedDeviceForFromID:withRelationship:", v6, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    pbb_setupflow_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      PBBCMessageDescription(v4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412546;
      v13 = v10;
      v14 = 2114;
      v15 = v6;
      _os_log_impl(&dword_2113B6000, v9, OS_LOG_TYPE_DEFAULT, "Dropping stale message %@ received from: %{public}@", (uint8_t *)&v12, 0x16u);

    }
  }

  return v8 != 0;
}

- (void)getCompanionLanguage:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t buf[4];
  int v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pbb_setupflow_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v14 = 609;
    v15 = 2080;
    v16 = "-[PBBridgeCompanionController getCompanionLanguage:]";
    _os_log_impl(&dword_2113B6000, v5, OS_LOG_TYPE_DEFAULT, "%d %s", buf, 0x12u);
  }

  v6 = objc_msgSend(v4, "type");
  objc_msgSend(v4, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "fromID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = -[PBBridgeCompanionController shouldHandleMessageType:fromId:](self, "shouldHandleMessageType:fromId:", v6, v8);

  if ((_DWORD)v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v12, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBBridgeCompanionController _sendRemoteCommandWithMessageID:withArguments:](self, "_sendRemoteCommandWithMessageID:withArguments:", 5, v11);

  }
}

- (void)getCompanionRegion:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t buf[4];
  int v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pbb_setupflow_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v13 = 621;
    v14 = 2080;
    v15 = "-[PBBridgeCompanionController getCompanionRegion:]";
    _os_log_impl(&dword_2113B6000, v5, OS_LOG_TYPE_DEFAULT, "%d %s", buf, 0x12u);
  }

  v6 = objc_msgSend(v4, "type");
  objc_msgSend(v4, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "fromID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = -[PBBridgeCompanionController shouldHandleMessageType:fromId:](self, "shouldHandleMessageType:fromId:", v6, v8);

  if ((_DWORD)v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBBridgeCompanionController _sendRemoteCommandWithMessageID:withArguments:](self, "_sendRemoteCommandWithMessageID:withArguments:", 6, v10);

  }
}

- (void)gizmoBecameAvailableWantsConfirmation:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  PBBProtoBecameActive *v8;
  void *v9;
  PBBProtoBecameActive *v10;
  NSObject *v11;
  id WeakRetained;
  void *v13;
  double Current;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  _DWORD v19[2];
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "type");
  objc_msgSend(v4, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fromID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = -[PBBridgeCompanionController shouldHandleMessageType:fromId:](self, "shouldHandleMessageType:fromId:", v5, v7);

  if ((_DWORD)v5)
  {
    v8 = [PBBProtoBecameActive alloc];
    objc_msgSend(v4, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PBBProtoBecameActive initWithData:](v8, "initWithData:", v9);

    pbb_setupflow_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v19[0] = 67109378;
      v19[1] = 639;
      v20 = 2080;
      v21 = "-[PBBridgeCompanionController gizmoBecameAvailableWantsConfirmation:]";
      _os_log_impl(&dword_2113B6000, v11, OS_LOG_TYPE_DEFAULT, "%d %s", (uint8_t *)v19, 0x12u);
    }

    if (-[PBBProtoBecameActive wantsConfirmation](v10, "wantsConfirmation"))
      -[PBBridgeCompanionController _sendRemoteCommandWithMessageID:withArguments:](self, "_sendRemoteCommandWithMessageID:withArguments:", 1, &unk_24CBCE8A8);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "remoteDidBecomeAvailable");

    if (PBLogPerformanceMetrics())
    {
      +[PBBridgeResponsePerformanceMonitor shareMonitor](PBBridgeResponsePerformanceMonitor, "shareMonitor");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      Current = CFAbsoluteTimeGetCurrent();
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "context");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "outgoingResponseIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addMilestone:activityType:activityIdentifier:", v16, v18, Current);

    }
  }

}

- (void)getSiriState:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "type");
  objc_msgSend(v4, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "fromID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = -[PBBridgeCompanionController shouldHandleMessageType:fromId:](self, "shouldHandleMessageType:fromId:", v5, v7);

  if ((_DWORD)v5)
  {
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "effectiveBoolValueForSetting:", *MEMORY[0x24BE637C8]) != 0;

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBBridgeCompanionController _sendRemoteCommandWithMessageID:withArguments:](self, "_sendRemoteCommandWithMessageID:withArguments:", 7, v11);

  }
}

- (void)enableSiriForGizmo:(id)a3
{
  NSObject *v3;
  void *v4;
  _DWORD v5[2];
  __int16 v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  pbb_setupflow_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109378;
    v5[1] = 664;
    v6 = 2080;
    v7 = "-[PBBridgeCompanionController enableSiriForGizmo:]";
    _os_log_impl(&dword_2113B6000, v3, OS_LOG_TYPE_DEFAULT, "%d %s", (uint8_t *)v5, 0x12u);
  }

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBoolValue:forSetting:", 1, *MEMORY[0x24BE637C8]);

}

- (void)tellWatchLanguagesAndLocaleSupportingTermOfAddress:(BOOL)a3 withCompletion:(id)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  char *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id languageLocaleCompletion;
  void *v28;
  _QWORD v29[3];
  uint8_t buf[4];
  const char *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  pbb_setupflow_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v31 = "-[PBBridgeCompanionController tellWatchLanguagesAndLocaleSupportingTermOfAddress:withCompletion:]";
    _os_log_impl(&dword_2113B6000, v7, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (self->_activationState == 6)
    -[PBBridgeCompanionController refreshTimeoutTimerWithNewActivationGranularState:](self, "refreshTimeoutTimerWithNewActivationGranularState:", 6);
  objc_msgSend(MEMORY[0x24BDBCEA0], "preferredLanguages");
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localeIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEA0], "componentsFromLocaleIdentifier:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDBCAE8]);
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEA0], "archivedPreferences");
  v13 = (char *)objc_claimAutoreleasedReturnValue();
  pbb_setupflow_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v31 = v13;
    _os_log_impl(&dword_2113B6000, v14, OS_LOG_TYPE_DEFAULT, "archivedPreferences dictionary contains:\n%@", buf, 0xCu);
  }

  if (!a3)
  {
    objc_msgSend(v13, "objectForKey:", CFSTR("ArchivedInflection"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "removeObjectForKey:", CFSTR("ArchivedInflection"));
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v16);
      v17 = objc_claimAutoreleasedReturnValue();

      pbb_setup_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2113B6000, v18, OS_LOG_TYPE_DEFAULT, "Pairing watch doesn't support term of address; removed ArchivedInflection key",
          buf,
          2u);
      }

      v13 = (char *)v17;
    }
  }
  v19 = (void *)v8;
  if (v8)
  {
    if (v12)
      goto LABEL_14;
LABEL_20:
    pbb_setupflow_log();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[PBBridgeCompanionController tellWatchLanguagesAndLocaleSupportingTermOfAddress:withCompletion:].cold.2();

    v12 = &stru_24CBBF548;
    if (v13)
      goto LABEL_26;
    goto LABEL_23;
  }
  pbb_setupflow_log();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    -[PBBridgeCompanionController tellWatchLanguagesAndLocaleSupportingTermOfAddress:withCompletion:].cold.3();

  v19 = (void *)MEMORY[0x24BDBD1A8];
  if (!v12)
    goto LABEL_20;
LABEL_14:
  if (!v13)
  {
LABEL_23:
    pbb_setupflow_log();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[PBBridgeCompanionController tellWatchLanguagesAndLocaleSupportingTermOfAddress:withCompletion:].cold.1();

    v13 = (char *)MEMORY[0x24BDBD1B8];
    goto LABEL_26;
  }
  if (!v8)
  {
LABEL_26:
    getpid();
    v23 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v19, "firstObject");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "stringWithFormat:", CFSTR("Error! Invalid Language/Locale/Region/archivedPreferences (%@/%@/%@/%@)"), v24, v10, v12, v13);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    SimulateCrash();

  }
  v26 = (void *)MEMORY[0x212BD94D4](v6);
  languageLocaleCompletion = self->_languageLocaleCompletion;
  self->_languageLocaleCompletion = v26;

  v29[0] = v19;
  v29[1] = v12;
  v29[2] = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBBridgeCompanionController _sendRemoteCommandWithMessageID:withArguments:](self, "_sendRemoteCommandWithMessageID:withArguments:", 25, v28);

}

- (void)watchDidRespondWithLanguageAndLocaleStatus:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  PBBProtoTellCompanionLanguageAndLocaleChangeStatus *v8;
  void *v9;
  PBBProtoTellCompanionLanguageAndLocaleChangeStatus *v10;
  double v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  __int16 v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "type");
  objc_msgSend(v4, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fromID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = -[PBBridgeCompanionController shouldHandleMessageType:fromId:](self, "shouldHandleMessageType:fromId:", v5, v7);

  if ((_DWORD)v5)
  {
    v8 = [PBBProtoTellCompanionLanguageAndLocaleChangeStatus alloc];
    objc_msgSend(v4, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PBBProtoTellCompanionLanguageAndLocaleChangeStatus initWithData:](v8, "initWithData:", v9);

    -[PBBProtoTellCompanionLanguageAndLocaleChangeStatus status](v10, "status");
    v12 = (int)v11;
    pbb_setupflow_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v19 = "-[PBBridgeCompanionController watchDidRespondWithLanguageAndLocaleStatus:]";
      v20 = 2112;
      v21 = v14;
      _os_log_impl(&dword_2113B6000, v13, OS_LOG_TYPE_DEFAULT, "%s (Status: %@)", buf, 0x16u);

    }
    objc_initWeak((id *)buf, self);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __74__PBBridgeCompanionController_watchDidRespondWithLanguageAndLocaleStatus___block_invoke;
    v15[3] = &unk_24CBBEB90;
    objc_copyWeak(&v16, (id *)buf);
    v17 = v12;
    dispatch_async(MEMORY[0x24BDAC9B8], v15);
    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);

  }
}

void __74__PBBridgeCompanionController_watchDidRespondWithLanguageAndLocaleStatus___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void (**v4)(_QWORD, _QWORD);
  void *v5;
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "languageLocaleCompletion");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      objc_msgSend(v6, "languageLocaleCompletion");
      v4 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v4[2](v4, *(unsigned __int16 *)(a1 + 40));

      objc_msgSend(v6, "setLanguageLocaleCompletion:", 0);
    }
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setIsLanguageAndLocaleFinished:", 1);

    WeakRetained = v6;
  }

}

- (id)customDescriptionOfMessageType:(unsigned __int16)a3
{
  return (id)PBBGMessageDescription(a3);
}

- (void)beganWaitingForPresentationOfActivationEvent
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  pbb_activation_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[PBBridgeCompanionController beganWaitingForPresentationOfActivationEvent]";
    _os_log_impl(&dword_2113B6000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  -[PBBridgeCompanionController invalidateTimeoutTimerWithNewActivationGranularState:](self, "invalidateTimeoutTimerWithNewActivationGranularState:", 6);
  -[PBBridgeCompanionController _sendRemoteCommandWithMessageID:withArguments:](self, "_sendRemoteCommandWithMessageID:withArguments:", 22, MEMORY[0x24BDBD1A8]);
  PBNotifyClientOfActivity();
}

- (void)beganWaitingForUserResponseToActivationEvent
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  pbb_activation_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[PBBridgeCompanionController beganWaitingForUserResponseToActivationEvent]";
    _os_log_impl(&dword_2113B6000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  -[PBBridgeCompanionController refreshTimeoutTimerWithNewActivationGranularState:](self, "refreshTimeoutTimerWithNewActivationGranularState:", 6);
  -[PBBridgeCompanionController _sendRemoteCommandWithMessageID:withArguments:](self, "_sendRemoteCommandWithMessageID:withArguments:", 23, MEMORY[0x24BDBD1A8]);
  PBNotifyClientOfActivity();
}

- (void)gizmoDidBeginActivating:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double Current;
  void *v12;
  void *v13;
  int v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pbb_activation_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136315138;
    v15 = "-[PBBridgeCompanionController gizmoDidBeginActivating:]";
    _os_log_impl(&dword_2113B6000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v14, 0xCu);
  }

  v6 = objc_msgSend(v4, "type");
  objc_msgSend(v4, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fromID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = -[PBBridgeCompanionController shouldHandleMessageType:fromId:](self, "shouldHandleMessageType:fromId:", v6, v8);

  if ((_DWORD)v6)
  {
    -[PBBridgeCompanionController refreshTimeoutTimerWithNewActivationGranularState:](self, "refreshTimeoutTimerWithNewActivationGranularState:", 4);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "postNotificationName:object:", CFSTR("PBBridgeGizmoDidBeginActivatingNotification"), 0);

    if (PBLogPerformanceMetrics())
    {
      +[PBBridgeResponsePerformanceMonitor shareMonitor](PBBridgeResponsePerformanceMonitor, "shareMonitor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      Current = CFAbsoluteTimeGetCurrent();
      objc_msgSend(v4, "context");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "outgoingResponseIdentifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addMilestone:activityType:activityIdentifier:", CFSTR("GizmoDidBeginActivating"), v13, Current);

    }
    PBNotifyClientOfActivity();
  }

}

- (void)gizmoDidFinishActivating:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  double Current;
  void *v13;
  void *v14;
  int v15;
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pbb_activation_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315138;
    v16 = "-[PBBridgeCompanionController gizmoDidFinishActivating:]";
    _os_log_impl(&dword_2113B6000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v15, 0xCu);
  }

  v6 = objc_msgSend(v4, "type");
  objc_msgSend(v4, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fromID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = -[PBBridgeCompanionController shouldHandleMessageType:fromId:](self, "shouldHandleMessageType:fromId:", v6, v8);

  if ((_DWORD)v6)
  {
    -[PBBridgeCompanionController invalidateTimeoutTimerWithNewActivationGranularState:](self, "invalidateTimeoutTimerWithNewActivationGranularState:", 0xFFFFLL);
    if (objc_msgSend(v4, "type") == 21)
      v9 = CFSTR("DeKOTA");
    else
      v9 = 0;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "postNotificationName:object:", CFSTR("PBBridgeGizmoDidFinishActivatingNotification"), v9);

    if (PBLogPerformanceMetrics())
    {
      +[PBBridgeResponsePerformanceMonitor shareMonitor](PBBridgeResponsePerformanceMonitor, "shareMonitor");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      Current = CFAbsoluteTimeGetCurrent();
      objc_msgSend(v4, "context");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "outgoingResponseIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addMilestone:activityType:activityIdentifier:", CFSTR("GizmoDidFinishActivating"), v14, Current);

    }
    PBNotifyClientOfActivity();

  }
}

- (void)gizmoActivationFailed:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  PBBProtoGizmoActivationFailed *v9;
  void *v10;
  PBBProtoGizmoActivationFailed *v11;
  void *v12;
  NSObject *v13;
  id WeakRetained;
  void *v15;
  double Current;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pbb_activation_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 136315138;
    v22 = "-[PBBridgeCompanionController gizmoActivationFailed:]";
    _os_log_impl(&dword_2113B6000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v21, 0xCu);
  }

  v6 = objc_msgSend(v4, "type");
  objc_msgSend(v4, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fromID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = -[PBBridgeCompanionController shouldHandleMessageType:fromId:](self, "shouldHandleMessageType:fromId:", v6, v8);

  if ((_DWORD)v6)
  {
    v9 = [PBBProtoGizmoActivationFailed alloc];
    objc_msgSend(v4, "data");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PBBProtoGizmoActivationFailed initWithData:](v9, "initWithData:", v10);

    -[PBBridgeCompanionController invalidateTimeoutTimerWithNewActivationGranularState:](self, "invalidateTimeoutTimerWithNewActivationGranularState:", 5);
    -[PBBProtoGizmoActivationFailed failureDescription](v11, "failureDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    pbb_activation_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[PBBridgeCompanionController gizmoActivationFailed:].cold.1();

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "remoteDidFailActivation:description:", 4, v12);

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
  }

}

- (void)handlePerformanceResults:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  PBBProtoTransferPerformanceResults *v9;
  void *v10;
  PBBProtoTransferPerformanceResults *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  id WeakRetained;
  char v31;
  id v32;
  PBBProtoTransferPerformanceResults *v33;
  PBBridgeCompanionController *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint8_t v44[128];
  uint8_t buf[4];
  const char *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pbb_activation_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v46 = "-[PBBridgeCompanionController handlePerformanceResults:]";
    _os_log_impl(&dword_2113B6000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v6 = objc_msgSend(v4, "type");
  objc_msgSend(v4, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fromID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = -[PBBridgeCompanionController shouldHandleMessageType:fromId:](self, "shouldHandleMessageType:fromId:", v6, v8);

  if ((_DWORD)v6)
  {
    v34 = self;
    v9 = [PBBProtoTransferPerformanceResults alloc];
    objc_msgSend(v4, "data");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[PBBProtoTransferPerformanceResults initWithData:](v9, "initWithData:", v10);

    +[PBBridgeResponsePerformanceMonitor shareMonitor](PBBridgeResponsePerformanceMonitor, "shareMonitor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBBProtoTransferPerformanceResults measures](v11, "measures");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setRemoteMeasurements:", v13);

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    -[PBBProtoTransferPerformanceResults macroActivites](v11, "macroActivites");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v40 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          objc_msgSend(v20, "activityType");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setObject:forKey:", v20, v21);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      }
      while (v17);
    }

    objc_msgSend(v12, "setRemoteMacroActivities:", v14);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v33 = v11;
    -[PBBProtoTransferPerformanceResults milestones](v11, "milestones");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v36;
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v36 != v26)
            objc_enumerationMutation(v23);
          v28 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
          objc_msgSend(v28, "identifier");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setObject:forKey:", v28, v29);

        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
      }
      while (v25);
    }

    objc_msgSend(v12, "setRemoteMilestones:", v22);
    objc_msgSend(v12, "endMonitorTransaction");
    WeakRetained = objc_loadWeakRetained((id *)&v34->_delegate);
    v31 = objc_opt_respondsToSelector();

    if ((v31 & 1) != 0)
    {
      v32 = objc_loadWeakRetained((id *)&v34->_delegate);
      objc_msgSend(v32, "didHandlePerformanceResults");

    }
  }

}

- (id)_connectionWithRequest:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  BOOL *p_sentSessionRequest;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pbb_activation_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315394;
    v11 = "-[PBBridgeCompanionController _connectionWithRequest:]";
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_2113B6000, v5, OS_LOG_TYPE_DEFAULT, "%s: Request (%@)", (uint8_t *)&v10, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forHTTPHeaderField:", CFSTR("WiFi"), CFSTR("X-iOS-Activation-Medium"));
  self->_connectionFailed = 0;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1810]), "_initWithRequest:delegate:usesCache:maxContentLength:startImmediately:connectionProperties:", v4, self, 1, 0, 1, v6);
  p_sentSessionRequest = &self->_sentSessionRequest;
  if (!self->_sentSessionRequest
    || (p_sentSessionRequest = &self->_sentActivationRequest, !self->_sentActivationRequest))
  {
    *p_sentSessionRequest = 1;
  }

  return v7;
}

- (void)sendProxyActivationRequest:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  PBBProtoProxyActivationFetch *v18;
  void *v19;
  void *v20;
  double Current;
  objc_class *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  BOOL v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  char *v38;
  NSObject *v39;
  NSObject *v40;
  void *v41;
  NSMutableURLRequest *v42;
  NSMutableURLRequest *activationRequest;
  NSObject *v44;
  NSMutableURLRequest *v45;
  void *v46;
  NSString *v47;
  NSString *remoteActivationUserAgent;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  NSObject *v56;
  id WeakRetained;
  void *v58;
  BOOL v59;
  NSObject *v60;
  NSObject *v61;
  id v62;
  NSObject *v63;
  id v64;
  void *v65;
  uint64_t v66;
  char *v67;
  void *v68;
  uint64_t v69;
  char *v70;
  _QWORD block[5];
  id v72;
  uint8_t buf[4];
  const char *v74;
  __int16 v75;
  uint64_t v76;
  uint64_t v77;

  v77 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "type");
  objc_msgSend(v4, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fromID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = -[PBBridgeCompanionController shouldHandleMessageType:fromId:](self, "shouldHandleMessageType:fromId:", v5, v7);

  if ((_DWORD)v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "BOOLForKey:", CFSTR("__SkipReachabilityChecks"));

    if ((v9 & 1) != 0)
    {
      pbb_activation_log();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[PBBridgeCompanionController sendProxyActivationRequest:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
LABEL_38:

      PBNotifyClientOfActivity();
      goto LABEL_39;
    }
    v18 = [PBBProtoProxyActivationFetch alloc];
    objc_msgSend(v4, "data");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PBBProtoProxyActivationFetch initWithData:](v18, "initWithData:", v19);

    if (PBLogPerformanceMetrics())
    {
      +[PBBridgeResponsePerformanceMonitor shareMonitor](PBBridgeResponsePerformanceMonitor, "shareMonitor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      Current = CFAbsoluteTimeGetCurrent();
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "context");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "outgoingResponseIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addMilestone:activityType:activityIdentifier:", v23, v25, Current);

      +[PBBridgeResponsePerformanceMonitor shareMonitor](PBBridgeResponsePerformanceMonitor, "shareMonitor");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "endMacroActivity:beginTime:", CFSTR("PBBridgeProxyActivationStageOneActivityName"), CFAbsoluteTimeGetCurrent());
      v28 = v27;

      +[PBBridgeCAReporter pushTimingType:withValue:](PBBridgeCAReporter, "pushTimingType:withValue:", 2, v28);
      +[PBBridgeResponsePerformanceMonitor shareMonitor](PBBridgeResponsePerformanceMonitor, "shareMonitor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "beginMacroActivity:beginTime:", CFSTR("PBBridgeProxyActivationStageTwoActivityName"), CFAbsoluteTimeGetCurrent());

    }
    -[NSObject request](v10, "request");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = v30 == 0;
    pbb_activation_log();
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = v32;
    if (v31)
    {
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        -[PBBridgeCompanionController sendProxyActivationRequest:].cold.2();

      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(WeakRetained, "remoteDidFailActivation:description:", 4, CFSTR("Gizmo Sent nil Activation Data"));

      goto LABEL_38;
    }
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      -[NSObject request](v10, "request");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v74 = "-[PBBridgeCompanionController sendProxyActivationRequest:]";
      v75 = 2048;
      v76 = objc_msgSend(v34, "length");
      _os_log_impl(&dword_2113B6000, v33, OS_LOG_TYPE_DEFAULT, "%s request length (%ld bytes)", buf, 0x16u);

    }
    v35 = objc_alloc(MEMORY[0x24BDD1620]);
    -[NSObject request](v10, "request");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = 0;
    v37 = (void *)objc_msgSend(v35, "initForReadingFromData:error:", v36, &v72);
    v38 = (char *)v72;

    if (v38)
    {
      pbb_activation_log();
      v39 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        v40 = v39;
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
        {
          -[NSObject request](v10, "request");
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          v66 = objc_msgSend(v65, "length");
          *(_DWORD *)buf = 138412546;
          v74 = v38;
          v75 = 2048;
          v76 = v66;
          _os_log_error_impl(&dword_2113B6000, v40, OS_LOG_TYPE_ERROR, "Error (%@) decoding request (%ld bytes)", buf, 0x16u);

        }
      }

    }
    objc_msgSend(v37, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("PBBridgeActivationRequestKey"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (NSMutableURLRequest *)objc_msgSend(v41, "copy");
    activationRequest = self->_activationRequest;
    self->_activationRequest = v42;

    if (self->_activationRequest
      || (objc_msgSend(v37, "error"),
          v58 = (void *)objc_claimAutoreleasedReturnValue(),
          v59 = v58 == 0,
          v58,
          v59))
    {
      pbb_activation_log();
      v44 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        v45 = self->_activationRequest;
        *(_DWORD *)buf = 138543362;
        v74 = (const char *)v45;
        _os_log_impl(&dword_2113B6000, v44, OS_LOG_TYPE_DEFAULT, "Activation Request %{public}@", buf, 0xCu);
      }

      objc_msgSend(v37, "finishDecoding");
      -[NSMutableURLRequest valueForHTTPHeaderField:](self->_activationRequest, "valueForHTTPHeaderField:", CFSTR("User-Agent"));
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = (NSString *)objc_msgSend(v46, "copy");
      remoteActivationUserAgent = self->_remoteActivationUserAgent;
      self->_remoteActivationUserAgent = v47;

      if (PBIsInternalInstall()
        && -[PBBridgeCompanionController _dumpActivationRequests](self, "_dumpActivationRequests"))
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/Bridge-Activation-Request-%f.txt"), CFAbsoluteTimeGetCurrent());
        v70 = (char *)objc_claimAutoreleasedReturnValue();
        v49 = (void *)MEMORY[0x24BDD17C8];
        -[NSMutableURLRequest URL](self->_activationRequest, "URL");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableURLRequest allHTTPHeaderFields](self->_activationRequest, "allHTTPHeaderFields");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = objc_alloc(MEMORY[0x24BDD17C8]);
        -[NSMutableURLRequest HTTPBody](self->_activationRequest, "HTTPBody");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = (void *)objc_msgSend(v52, "initWithData:encoding:", v53, 4);
        objc_msgSend(v49, "stringWithFormat:", CFSTR("%@\n%@\n%@"), v50, v51, v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v55, "writeToFile:atomically:encoding:error:", v70, 1, 4, 0);
        pbb_activation_log();
        v56 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v74 = v70;
          _os_log_impl(&dword_2113B6000, v56, OS_LOG_TYPE_DEFAULT, "Writing Activation Request to %@", buf, 0xCu);
        }

      }
      if (self->_activationRequest)
      {
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __58__PBBridgeCompanionController_sendProxyActivationRequest___block_invoke;
        block[3] = &unk_24CBBE1E0;
        block[4] = self;
        dispatch_async(MEMORY[0x24BDAC9B8], block);
      }
      else
      {
        pbb_activation_log();
        v63 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
          -[PBBridgeCompanionController sendProxyActivationRequest:].cold.3();

        v64 = objc_loadWeakRetained((id *)&self->_delegate);
        objc_msgSend(v64, "remoteDidFailActivation:description:", 4, CFSTR("Decoded request from Gizmo is nil"));

      }
      goto LABEL_38;
    }
    pbb_activation_log();
    v60 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
    {
      v61 = v60;
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v37, "error");
        v67 = (char *)objc_claimAutoreleasedReturnValue();
        -[NSObject request](v10, "request");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = objc_msgSend(v68, "length");
        *(_DWORD *)buf = 138543618;
        v74 = v67;
        v75 = 2048;
        v76 = v69;
        _os_log_error_impl(&dword_2113B6000, v61, OS_LOG_TYPE_ERROR, "Decoding error (%{public}@) while decoding request (%ld bytes)", buf, 0x16u);

      }
    }

    v62 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(v62, "remoteDidFailActivation:description:", 4, CFSTR("Exception decoding request from Gizmo"));

  }
LABEL_39:

}

void __58__PBBridgeCompanionController_sendProxyActivationRequest___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  pbb_activation_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120);
    v11 = 138412290;
    v12 = v3;
    _os_log_impl(&dword_2113B6000, v2, OS_LOG_TYPE_DEFAULT, "Sending Proxy Activation: (%@)", (uint8_t *)&v11, 0xCu);
  }

  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 76) = 1;
  objc_msgSend(*(id *)(a1 + 32), "refreshTimeoutTimerWithNewActivationGranularState:", 2);
  v4 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v4 + 68))
  {
    v5 = (void *)MEMORY[0x24BDD1840];
    objc_msgSend(*(id *)(v4 + 120), "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "host");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllowsAnyHTTPSCertificate:forHost:", 1, v7);

    v4 = *(_QWORD *)(a1 + 32);
  }
  objc_msgSend((id)v4, "_connectionWithRequest:", *(_QWORD *)(v4 + 120));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 112);
  *(_QWORD *)(v9 + 112) = v8;

}

- (BOOL)_dumpActivationRequests
{
  return CFPreferencesGetAppBooleanValue(CFSTR("PBDumpActivationRequests"), CFSTR("com.apple.Bridge"), 0) != 0;
}

- (void)sendProxyActivationWithCustomRequest:(id)a3
{
  id v4;
  void *v5;
  NSMutableURLRequest *v6;
  NSMutableURLRequest *activationRequest;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *WeakRetained;
  NSObject *v18;
  _QWORD block[4];
  NSObject *v20;
  PBBridgeCompanionController *v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if ((__int16)self->_granularActivationState == -1)
    {
      pbb_activation_log();
      WeakRetained = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2113B6000, WeakRetained, OS_LOG_TYPE_DEFAULT, "Custom Activation Request was issued after Watch was already activated. Dropping it on the floor.", buf, 2u);
      }
    }
    else
    {
      self->_awaitingCustomResponse = 1;
      v6 = (NSMutableURLRequest *)objc_msgSend(v4, "mutableCopy");
      activationRequest = self->_activationRequest;
      self->_activationRequest = v6;

      objc_msgSend(v5, "setValue:forHTTPHeaderField:", self->_remoteActivationUserAgent, CFSTR("User-Agent"));
      if (PBIsInternalInstall()
        && -[PBBridgeCompanionController _dumpActivationRequests](self, "_dumpActivationRequests"))
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/Bridge-BuddyML-CustomRequest-%f.txt"), CFAbsoluteTimeGetCurrent());
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v5, "URL");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "allHTTPHeaderFields");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_alloc(MEMORY[0x24BDD17C8]);
        objc_msgSend(v5, "HTTPBody");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(v12, "initWithData:encoding:", v13, 4);
        objc_msgSend(v9, "stringWithFormat:", CFSTR("%@\n%@\n%@"), v10, v11, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "writeToFile:atomically:encoding:error:", v8, 1, 4, 0);
        pbb_activation_log();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v23 = v8;
          _os_log_impl(&dword_2113B6000, v16, OS_LOG_TYPE_DEFAULT, "Writing BuddyML Custom Request to %@", buf, 0xCu);
        }

      }
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __68__PBBridgeCompanionController_sendProxyActivationWithCustomRequest___block_invoke;
      block[3] = &unk_24CBBE4A8;
      v20 = v5;
      v21 = self;
      dispatch_async(MEMORY[0x24BDAC9B8], block);
      WeakRetained = v20;
    }
  }
  else
  {
    pbb_activation_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[PBBridgeCompanionController sendProxyActivationWithCustomRequest:].cold.1();

    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    -[NSObject remoteDidFailActivation:description:](WeakRetained, "remoteDidFailActivation:description:", 4, CFSTR("Gizmo Sent nil Activation Data"));
  }

  PBNotifyClientOfActivity();
}

void __68__PBBridgeCompanionController_sendProxyActivationWithCustomRequest___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  _BYTE *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  pbb_activation_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v11 = 136315394;
    v12 = "-[PBBridgeCompanionController sendProxyActivationWithCustomRequest:]_block_invoke";
    v13 = 2112;
    v14 = v3;
    _os_log_impl(&dword_2113B6000, v2, OS_LOG_TYPE_DEFAULT, "%s: Sending Proxy Activation Custom Request (%@)", (uint8_t *)&v11, 0x16u);
  }

  *(_DWORD *)(*(_QWORD *)(a1 + 40) + 76) = 1;
  objc_msgSend(*(id *)(a1 + 40), "refreshTimeoutTimerWithNewActivationGranularState:", 2);
  v4 = *(_BYTE **)(a1 + 40);
  if (v4[68])
  {
    v5 = (void *)MEMORY[0x24BDD1840];
    objc_msgSend(*(id *)(a1 + 32), "URL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "host");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllowsAnyHTTPSCertificate:forHost:", 1, v7);

    v4 = *(_BYTE **)(a1 + 40);
  }
  objc_msgSend(v4, "_connectionWithRequest:", *(_QWORD *)(a1 + 32));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(void **)(v9 + 112);
  *(_QWORD *)(v9 + 112) = v8;

}

- (unsigned)_testActivationResponseType
{
  return CFPreferencesGetAppIntegerValue(CFSTR("PBTestActivationType"), CFSTR("com.apple.Bridge"), 0);
}

- (void)connectionDidFinishLoading:(id)a3
{
  void *v4;
  unsigned int v5;
  NSObject *v6;
  const __CFString *v7;
  NSMutableData *v8;
  NSMutableData *activationData;
  void *v10;
  NSString *contentType;
  BOOL v12;
  __CFString *v13;
  void *v14;
  NSObject *v15;
  BOOL v16;
  NSObject *v17;
  const char *v18;
  int activationState;
  NSObject *v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  RUILoader *ruiLoader;
  RUILoader *v25;
  RUILoader *v26;
  RUILoader *v27;
  NSMutableData *v28;
  void *v29;
  int v30;
  __CFString *v31;
  void *v32;
  NSObject *v33;
  uint8_t buf[4];
  const __CFString *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  if (self->_activationConnection != a3)
    return;
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("PBBridgeActivationServerRespondedNotification"), 0);

  v5 = -[PBBridgeCompanionController _testActivationResponseType](self, "_testActivationResponseType");
  if (v5)
  {
    pbb_activation_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if (v5 > 5)
        v7 = &stru_24CBBF548;
      else
        v7 = *(&off_24CBBEC00 + (__int16)(v5 - 1));
      *(_DWORD *)buf = 138412290;
      v35 = v7;
      _os_log_impl(&dword_2113B6000, v6, OS_LOG_TYPE_DEFAULT, "Testing Fake Activation Response Type: %@", buf, 0xCu);
    }

    _ResponseDataForTestType(v5);
    v8 = (NSMutableData *)objc_claimAutoreleasedReturnValue();
    activationData = self->_activationData;
    self->_activationData = v8;

  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", self->_activationData, 4);
  contentType = self->_contentType;
  if (contentType)
    v12 = -[NSString isEqualToString:](contentType, "isEqualToString:", CFSTR("application/x-buddyml"));
  else
    v12 = objc_msgSend(v10, "rangeOfString:", CFSTR("<xmlui")) != 0x7FFFFFFFFFFFFFFFLL;
  if (PBIsInternalInstall()
    && -[PBBridgeCompanionController _dumpActivationRequests](self, "_dumpActivationRequests"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/Bridge-Activation-Response-Data-%f.txt"), CFAbsoluteTimeGetCurrent());
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", self->_activationData, 4);
    objc_msgSend(v14, "writeToFile:atomically:encoding:error:", v13, 1, 4, 0);

    pbb_activation_log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v13;
      _os_log_impl(&dword_2113B6000, v15, OS_LOG_TYPE_DEFAULT, "Writing Activation Response Data to %@", buf, 0xCu);
    }

  }
  v16 = !v12;
  if (v5)
    v16 = 0;
  if (!v16)
  {
    self->_nonSilentActivation = 1;
    if ((self->_activationState | 4) == 7)
    {
      pbb_activation_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v18 = "ActivationStateNotSilentPOSTActivation";
LABEL_29:
        _os_log_impl(&dword_2113B6000, v17, OS_LOG_TYPE_DEFAULT, v18, buf, 2u);
      }
    }
    else
    {
      pbb_activation_log();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v18 = "ActivationStateNotSilentPREActivation";
        goto LABEL_29;
      }
    }

    -[PBBridgeCompanionController invalidateTimeoutTimerWithNewActivationGranularState:](self, "invalidateTimeoutTimerWithNewActivationGranularState:", 6);
    ruiLoader = self->_ruiLoader;
    if (ruiLoader)
    {
      -[RUILoader cancel](ruiLoader, "cancel");
      -[RUILoader setDelegate:](self->_ruiLoader, "setDelegate:", 0);
    }
    v25 = (RUILoader *)objc_alloc_init(MEMORY[0x24BE7EDC8]);
    v26 = self->_ruiLoader;
    self->_ruiLoader = v25;

    -[RUILoader setStyle:](self->_ruiLoader, "setStyle:", self->_remoteUIStyle);
    -[RUILoader setDelegate:](self->_ruiLoader, "setDelegate:", self);
    v27 = self->_ruiLoader;
    v28 = self->_activationData;
    -[NSMutableURLRequest URL](self->_activationRequest, "URL");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[RUILoader loadXMLUIWithData:baseURL:](v27, "loadXMLUIWithData:baseURL:", v28, v29);

    goto LABEL_37;
  }
  activationState = self->_activationState;
  if (activationState == 6 || activationState == 1)
  {
    pbb_activation_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v21 = "ActivationStateTryActivate";
      v22 = v20;
      v23 = 2;
LABEL_35:
      _os_log_impl(&dword_2113B6000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
    }
  }
  else
  {
    pbb_activation_log();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v30 = self->_activationState;
      *(_DWORD *)buf = 67109120;
      LODWORD(v35) = v30;
      v21 = "Unhandled Activation State %d";
      v22 = v20;
      v23 = 8;
      goto LABEL_35;
    }
  }

  -[PBBridgeCompanionController _processActivationData](self, "_processActivationData");
LABEL_37:
  if (self->_awaitingCustomResponse
    && PBIsInternalInstall()
    && -[PBBridgeCompanionController _dumpActivationRequests](self, "_dumpActivationRequests"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/Bridge-BuddyML-CustomReponse-%f.txt"), CFAbsoluteTimeGetCurrent());
    v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", self->_activationData, 4);
    objc_msgSend(v32, "writeToFile:atomically:encoding:error:", v31, 1, 4, 0);

    pbb_activation_log();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v31;
      _os_log_impl(&dword_2113B6000, v33, OS_LOG_TYPE_DEFAULT, "Writing BuddyML Custom Response to %@", buf, 0xCu);
    }

  }
  self->_awaitingCustomResponse = 0;

}

- (id)viewControllerForAlertPresentation
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)loader:(id)a3 didFailWithError:(id)a4
{
  RUILoaderDelegate **p_ruiDelegate;
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  NSObject *v11;

  p_ruiDelegate = &self->_ruiDelegate;
  v7 = a4;
  v8 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_ruiDelegate);
  objc_msgSend(WeakRetained, "loader:didFailWithError:", v8, v7);

  if (v7)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", self->_activationData, 4);
    pbb_setupflow_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[PBBridgeCompanionController loader:didFailWithError:].cold.1();

  }
}

- (void)loader:(id)a3 receivedObjectModel:(id)a4 actionSignal:(unint64_t)a5
{
  RUILoaderDelegate **p_ruiDelegate;
  id v8;
  id v9;
  id WeakRetained;

  p_ruiDelegate = &self->_ruiDelegate;
  v8 = a4;
  v9 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_ruiDelegate);
  objc_msgSend(WeakRetained, "loader:receivedObjectModel:actionSignal:", v9, v8, a5);

}

- (void)loader:(id)a3 didReceiveHTTPResponse:(id)a4
{
  RUILoaderDelegate **p_ruiDelegate;
  id v6;
  id v7;
  id WeakRetained;

  p_ruiDelegate = &self->_ruiDelegate;
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_ruiDelegate);
  objc_msgSend(WeakRetained, "loader:didReceiveHTTPResponse:", v7, v6);

}

- (void)connection:(id)a3 didFailWithError:(id)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  id WeakRetained;
  void *v16;
  NSObject *v17;
  NSMutableURLRequest *activationRequest;
  NSURLConnection *v19;
  NSURLConnection *activationConnection;
  uint8_t buf[4];
  NSMutableURLRequest *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  self->_awaitingCustomResponse = 0;
  pbb_activation_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    -[PBBridgeCompanionController connection:didFailWithError:].cold.3((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);

  if (self->_activationState != 4)
  {
    self->_connectionFailed = 1;
    if ((self->_activationState | 4) == 7)
    {
      pbb_activation_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[PBBridgeCompanionController connection:didFailWithError:].cold.2();
    }
    else
    {
      pbb_activation_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[PBBridgeCompanionController connection:didFailWithError:].cold.1();
    }

  }
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
    v14 = PBUserCorrectableNetworkError(objc_msgSend(v5, "code"));
  else
    v14 = 0;
  if (self->_activationRetries <= 0)
  {
    pbb_activation_log();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      activationRequest = self->_activationRequest;
      *(_DWORD *)buf = 138412290;
      v22 = activationRequest;
      _os_log_impl(&dword_2113B6000, v17, OS_LOG_TYPE_DEFAULT, "Retrying activation due to correctable failure: %@", buf, 0xCu);
    }

    -[PBBridgeCompanionController _connectionWithRequest:](self, "_connectionWithRequest:", self->_activationRequest);
    v19 = (NSURLConnection *)objc_claimAutoreleasedReturnValue();
    activationConnection = self->_activationConnection;
    self->_activationConnection = v19;

    ++self->_activationRetries;
  }
  else
  {
    -[PBBridgeCompanionController _processActivationData](self, "_processActivationData");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Proxy Activation Request Failed: (%@)"), v5);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "remoteDidFailActivation:description:userActionable:", 5, v16, v14);

  }
}

- (id)connection:(id)a3 willSendRequest:(id)a4 redirectResponse:(id)a5
{
  NSURLConnection *v8;
  NSMutableURLRequest *v9;
  id v10;
  NSObject *v11;
  NSMutableURLRequest *activationRequest;
  void *v13;
  NSMutableURLRequest *v14;
  void *v15;
  void *v16;
  void *v17;
  NSMutableURLRequest *v18;
  NSMutableURLRequest *v19;

  v8 = (NSURLConnection *)a3;
  v9 = (NSMutableURLRequest *)a4;
  v10 = a5;
  pbb_activation_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[PBBridgeCompanionController connection:willSendRequest:redirectResponse:].cold.1((uint64_t)v9, (uint64_t)self, v11);

  if (v10)
  {
    if (objc_msgSend(v10, "statusCode") == 302)
    {
      activationRequest = self->_activationRequest;
      if (activationRequest)
      {
        -[NSMutableURLRequest HTTPBody](activationRequest, "HTTPBody");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          v14 = (NSMutableURLRequest *)-[NSMutableURLRequest mutableCopy](v9, "mutableCopy");
          -[NSMutableURLRequest setHTTPMethod:](v14, "setHTTPMethod:", CFSTR("POST"));
          -[NSMutableURLRequest valueForHTTPHeaderField:](self->_activationRequest, "valueForHTTPHeaderField:", CFSTR("Content-Type"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableURLRequest setValue:forHTTPHeaderField:](v14, "setValue:forHTTPHeaderField:", v15, CFSTR("Content-Type"));

          -[NSMutableURLRequest valueForHTTPHeaderField:](self->_activationRequest, "valueForHTTPHeaderField:", CFSTR("Content-Length"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableURLRequest setValue:forHTTPHeaderField:](v14, "setValue:forHTTPHeaderField:", v16, CFSTR("Content-Length"));

          -[NSMutableURLRequest HTTPBody](self->_activationRequest, "HTTPBody");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableURLRequest setHTTPBody:](v14, "setHTTPBody:", v17);

          v9 = v14;
        }
      }
    }
  }
  if (self->_activationConnection == v8 && self->_activationRequest != v9)
  {
    v18 = (NSMutableURLRequest *)-[NSMutableURLRequest mutableCopy](v9, "mutableCopy");
    v19 = self->_activationRequest;
    self->_activationRequest = v18;

  }
  return v9;
}

- (void)connection:(id)a3 didReceiveResponse:(id)a4
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  NSURLConnection *activationConnection;
  NSMutableURLRequest *activationRequest;
  NSString *v27;
  NSMutableData *v28;
  void *WeakRetained;
  void *contentType;
  NSObject *v31;
  NSMutableData *v32;
  NSMutableData *activationData;
  NSDictionary *v34;
  NSDictionary *allHeaders;
  NSString *v36;
  void *v37;
  uint8_t buf[4];
  _BYTE v39[14];
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  pbb_activation_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v39 = 1237;
    *(_WORD *)&v39[4] = 2080;
    *(_QWORD *)&v39[6] = "-[PBBridgeCompanionController connection:didReceiveResponse:]";
    v40 = 2112;
    v41 = v5;
    _os_log_impl(&dword_2113B6000, v6, OS_LOG_TYPE_DEFAULT, "%d %s -- %@", buf, 0x1Cu);
  }

  v7 = objc_msgSend(v5, "statusCode");
  self->_activationRetries = 0;
  if (PBIsInternalInstall()
    && -[PBBridgeCompanionController _dumpActivationRequests](self, "_dumpActivationRequests"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/Bridge-Activation-Response-%f.txt"), CFAbsoluteTimeGetCurrent());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v5, "URL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allHeaderFields");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@\n%@\n%@"), v10, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = v13;
    objc_msgSend(v13, "writeToFile:atomically:encoding:error:", v8, 1, 4, 0);
    pbb_activation_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v39 = v8;
      _os_log_impl(&dword_2113B6000, v14, OS_LOG_TYPE_DEFAULT, "Writing Activation Response to %@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("/var/mobile/Library/Logs/CrashReporter/DiagnosticLogs/Bridge-Activation-Request-%f.txt"), CFAbsoluteTimeGetCurrent());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x24BDD17C8];
    -[NSMutableURLRequest URL](self->_activationRequest, "URL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableURLRequest allHTTPHeaderFields](self->_activationRequest, "allHTTPHeaderFields");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_alloc(MEMORY[0x24BDD17C8]);
    -[NSMutableURLRequest HTTPBody](self->_activationRequest, "HTTPBody");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v19, "initWithData:encoding:", v20, 4);
    objc_msgSend(v16, "stringWithFormat:", CFSTR("%@%@\n%@"), v17, v18, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "writeToFile:atomically:encoding:error:", v15, 1, 4, 0);
    pbb_activation_log();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v39 = v15;
      _os_log_impl(&dword_2113B6000, v23, OS_LOG_TYPE_DEFAULT, "Writing Activation Request to %@", buf, 0xCu);
    }

  }
  if (v7 < 400)
    goto LABEL_18;
  pbb_activation_log();
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    -[PBBridgeCompanionController connection:didReceiveResponse:].cold.1(v7, v24);

  if (!self->_sentActivationRequest)
  {
    pbb_activation_log();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2113B6000, v31, OS_LOG_TYPE_DEFAULT, "Passing Session failure to MA for fallback.", buf, 2u);
    }

LABEL_18:
    v32 = (NSMutableData *)objc_alloc_init(MEMORY[0x24BDBCEC8]);
    activationData = self->_activationData;
    self->_activationData = v32;

    objc_msgSend(v5, "allHeaderFields");
    v34 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    allHeaders = self->_allHeaders;
    self->_allHeaders = v34;

    -[NSDictionary objectForKey:](self->_allHeaders, "objectForKey:", CFSTR("Content-Type"));
    WeakRetained = (void *)objc_claimAutoreleasedReturnValue();
    v36 = (NSString *)objc_msgSend(WeakRetained, "copy");
    contentType = self->_contentType;
    self->_contentType = v36;
    goto LABEL_19;
  }
  -[NSURLConnection cancel](self->_activationConnection, "cancel");
  activationConnection = self->_activationConnection;
  self->_activationConnection = 0;

  activationRequest = self->_activationRequest;
  self->_activationRequest = 0;

  v27 = self->_contentType;
  self->_contentType = 0;

  v28 = self->_activationData;
  self->_activationData = 0;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Activation Failed with Status: %d"), v7);
  contentType = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "remoteDidFailActivation:description:", 7, contentType);
LABEL_19:

}

- (void)connection:(id)a3 didReceiveData:(id)a4
{
  id v6;
  NSURLConnection *v7;
  NSObject *v8;
  NSURLConnection *activationConnection;
  NSMutableData *activationData;
  NSMutableData *v11;
  NSMutableData *v12;
  int v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  v7 = (NSURLConnection *)a3;
  pbb_activation_log();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315394;
    v14 = "-[PBBridgeCompanionController connection:didReceiveData:]";
    v15 = 2048;
    v16 = objc_msgSend(v6, "length");
    _os_log_impl(&dword_2113B6000, v8, OS_LOG_TYPE_DEFAULT, "%s: Bytes received %lu", (uint8_t *)&v13, 0x16u);
  }

  activationConnection = self->_activationConnection;
  if (activationConnection == v7)
  {
    -[PBBridgeCompanionController refreshTimeoutTimerWithNewActivationGranularState:](self, "refreshTimeoutTimerWithNewActivationGranularState:", 3);
    activationData = self->_activationData;
    if (activationData)
    {
      -[NSMutableData appendData:](activationData, "appendData:", v6);
    }
    else
    {
      v11 = (NSMutableData *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithData:", v6);
      v12 = self->_activationData;
      self->_activationData = v11;

    }
  }

}

- (void)_processActivationData
{
  OUTLINED_FUNCTION_7(&dword_2113B6000, a2, a3, "%s request to send activation data before NR is in correct compatibility state: %hu", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_cleanup
{
  NSURLConnection *activationConnection;
  NSMutableURLRequest *activationRequest;
  NSString *contentType;
  NSMutableData *activationData;

  self->_nonSilentActivation = 0;
  -[NSURLConnection cancel](self->_activationConnection, "cancel");
  activationConnection = self->_activationConnection;
  self->_activationConnection = 0;

  activationRequest = self->_activationRequest;
  self->_activationRequest = 0;

  contentType = self->_contentType;
  self->_contentType = 0;

  activationData = self->_activationData;
  self->_activationData = 0;

  self->_activationRetries = 0;
}

- (void)objectModel:(id)a3 pressedButton:(id)a4 attributes:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  pbb_setupflow_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412802;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    v16 = 2112;
    v17 = v10;
    _os_log_impl(&dword_2113B6000, v11, OS_LOG_TYPE_DEFAULT, "Pressed RUI Button... (RUIObjectModel %@, buttonName %@, attributes %@)", (uint8_t *)&v12, 0x20u);
  }

  -[PBBridgeCompanionController tellGizmoToBeginActivation](self, "tellGizmoToBeginActivation");
}

- (void)gizmoDidEndPasscodeCreation:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  PBBProtoDidEndPasscodeCreation *v8;
  void *v9;
  PBBProtoDidEndPasscodeCreation *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  _BOOL4 passcodeSet;
  void *v20;
  void *v21;
  double Current;
  objc_class *v23;
  void *v24;
  void *v25;
  void *v26;
  _DWORD v27[2];
  __int16 v28;
  const char *v29;
  __int16 v30;
  _BOOL4 v31;
  __int16 v32;
  _BOOL4 v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "type");
  objc_msgSend(v4, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fromID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = -[PBBridgeCompanionController shouldHandleMessageType:fromId:](self, "shouldHandleMessageType:fromId:", v5, v7);

  if ((_DWORD)v5)
  {
    v8 = [PBBProtoDidEndPasscodeCreation alloc];
    objc_msgSend(v4, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PBBProtoDidEndPasscodeCreation initWithData:](v8, "initWithData:", v9);

    self->_passcodeSet = -[PBBProtoDidEndPasscodeCreation success](v10, "success");
    v11 = -[PBBProtoDidEndPasscodeCreation isLong](v10, "isLong");
    if (v11)
    {
      objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "activeWatch");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "valueForProperty:", *MEMORY[0x24BE6B3A8]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "valueForProperty:", *MEMORY[0x24BE6B378]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6B2C0]), "initWithDomain:pairingID:pairingDataStore:", CFSTR("com.apple.nanosystemsettings"), v14, v15);
      objc_msgSend(v16, "setBool:forKey:", 0, CFSTR("simple-passcode"));
      v17 = (id)objc_msgSend(v16, "synchronize");

    }
    pbb_setupflow_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      passcodeSet = self->_passcodeSet;
      v27[0] = 67109890;
      v27[1] = 1385;
      v28 = 2080;
      v29 = "-[PBBridgeCompanionController gizmoDidEndPasscodeCreation:]";
      v30 = 1024;
      v31 = passcodeSet;
      v32 = 1024;
      v33 = v11;
      _os_log_impl(&dword_2113B6000, v18, OS_LOG_TYPE_DEFAULT, "%d %s (Enabled Passcode: %d, is long: %d)", (uint8_t *)v27, 0x1Eu);
    }

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "postNotificationName:object:", CFSTR("PBBridgeDidCompletePasscodeCreationNotification"), 0);

    if (PBLogPerformanceMetrics())
    {
      +[PBBridgeResponsePerformanceMonitor shareMonitor](PBBridgeResponsePerformanceMonitor, "shareMonitor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      Current = CFAbsoluteTimeGetCurrent();
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "context");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "outgoingResponseIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addMilestone:activityType:activityIdentifier:", v24, v26, Current);

    }
    PBNotifyClientOfActivity();

  }
}

- (void)gizmoFailedToCreatePasscode:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  PBBProtoDidFailToCreatePasscode *v8;
  void *v9;
  PBBProtoDidFailToCreatePasscode *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;

  v4 = a3;
  v5 = objc_msgSend(v4, "type");
  objc_msgSend(v4, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fromID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(self) = -[PBBridgeCompanionController shouldHandleMessageType:fromId:](self, "shouldHandleMessageType:fromId:", v5, v7);

  if ((_DWORD)self)
  {
    v8 = [PBBProtoDidFailToCreatePasscode alloc];
    objc_msgSend(v4, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PBBProtoDidFailToCreatePasscode initWithData:](v8, "initWithData:", v9);

    v11 = -[PBBProtoDidFailToCreatePasscode error](v10, "error");
    pbb_setupflow_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[PBBridgeCompanionController gizmoFailedToCreatePasscode:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "postNotificationName:object:", CFSTR("PBBridgeDidFailToCreatePasscodeNotification"), 0);

    PBNotifyClientOfActivity();
  }

}

- (void)gizmoDidEndPasscodeChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  PBBProtoDidEndPasscodeCreation *v8;
  void *v9;
  PBBProtoDidEndPasscodeCreation *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  _BOOL4 passcodeSet;
  void *v20;
  void *v21;
  double Current;
  objc_class *v23;
  void *v24;
  void *v25;
  void *v26;
  _DWORD v27[2];
  __int16 v28;
  const char *v29;
  __int16 v30;
  _BOOL4 v31;
  __int16 v32;
  _BOOL4 v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "type");
  objc_msgSend(v4, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fromID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = -[PBBridgeCompanionController shouldHandleMessageType:fromId:](self, "shouldHandleMessageType:fromId:", v5, v7);

  if ((_DWORD)v5)
  {
    v8 = [PBBProtoDidEndPasscodeCreation alloc];
    objc_msgSend(v4, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PBBProtoDidEndPasscodeCreation initWithData:](v8, "initWithData:", v9);

    self->_passcodeSet = -[PBBProtoDidEndPasscodeCreation success](v10, "success");
    v11 = -[PBBProtoDidEndPasscodeCreation isLong](v10, "isLong");
    if (v11)
    {
      objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "activeWatch");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "valueForProperty:", *MEMORY[0x24BE6B3A8]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "valueForProperty:", *MEMORY[0x24BE6B378]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE6B2C0]), "initWithDomain:pairingID:pairingDataStore:", CFSTR("com.apple.nanosystemsettings"), v14, v15);
      objc_msgSend(v16, "setBool:forKey:", 0, CFSTR("simple-passcode"));
      v17 = (id)objc_msgSend(v16, "synchronize");

    }
    pbb_setupflow_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      passcodeSet = self->_passcodeSet;
      v27[0] = 67109890;
      v27[1] = 1434;
      v28 = 2080;
      v29 = "-[PBBridgeCompanionController gizmoDidEndPasscodeChange:]";
      v30 = 1024;
      v31 = passcodeSet;
      v32 = 1024;
      v33 = v11;
      _os_log_impl(&dword_2113B6000, v18, OS_LOG_TYPE_DEFAULT, "%d %s (Enabled Passcode: %d, is long: %d)", (uint8_t *)v27, 0x1Eu);
    }

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "postNotificationName:object:", CFSTR("PBBridgeDidCompletePasscodeChangeNotification"), 0);

    if (PBLogPerformanceMetrics())
    {
      +[PBBridgeResponsePerformanceMonitor shareMonitor](PBBridgeResponsePerformanceMonitor, "shareMonitor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      Current = CFAbsoluteTimeGetCurrent();
      v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "context");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "outgoingResponseIdentifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "addMilestone:activityType:activityIdentifier:", v24, v26, Current);

    }
    PBNotifyClientOfActivity();

  }
}

- (void)gizmoDidBeginUnlockPairing:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __MKBAssertion *unlockPairingAssertion;
  _QWORD v10[2];
  _QWORD v11[2];
  uint8_t buf[4];
  int v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pbb_setupflow_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    v13 = 1447;
    v14 = 2080;
    v15 = "-[PBBridgeCompanionController gizmoDidBeginUnlockPairing:]";
    _os_log_impl(&dword_2113B6000, v5, OS_LOG_TYPE_DEFAULT, "%d %s", buf, 0x12u);
  }

  v6 = objc_msgSend(v4, "type");
  objc_msgSend(v4, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "fromID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = -[PBBridgeCompanionController shouldHandleMessageType:fromId:](self, "shouldHandleMessageType:fromId:", v6, v8);

  if ((_DWORD)v6)
  {
    unlockPairingAssertion = self->_unlockPairingAssertion;
    if (unlockPairingAssertion)
      CFRelease(unlockPairingAssertion);
    v10[0] = CFSTR("MKBAssertionKey");
    v10[1] = CFSTR("MKBAssertionTimeout");
    v11[0] = CFSTR("RemoteProfile");
    v11[1] = &unk_24CBCE830;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
    self->_unlockPairingAssertion = (__MKBAssertion *)MKBDeviceLockAssertion();
  }
}

- (void)gizmoDidEndUnlockPairing:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  PBBProtoDidMakeAutoLockChoice *v8;
  void *v9;
  PBBProtoDidMakeAutoLockChoice *v10;
  NSObject *v11;
  _BOOL4 selectedPairedUnlock;
  void *v13;
  void *v14;
  double Current;
  objc_class *v16;
  void *v17;
  void *v18;
  void *v19;
  __MKBAssertion *unlockPairingAssertion;
  _DWORD v21[2];
  __int16 v22;
  const char *v23;
  __int16 v24;
  _BOOL4 v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "type");
  objc_msgSend(v4, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fromID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = -[PBBridgeCompanionController shouldHandleMessageType:fromId:](self, "shouldHandleMessageType:fromId:", v5, v7);

  if ((_DWORD)v5)
  {
    v8 = [PBBProtoDidMakeAutoLockChoice alloc];
    objc_msgSend(v4, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PBBProtoDidMakeAutoLockChoice initWithData:](v8, "initWithData:", v9);

    self->_selectedPairedUnlock = -[PBBProtoDidMakeAutoLockChoice accept](v10, "accept");
    pbb_setupflow_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      selectedPairedUnlock = self->_selectedPairedUnlock;
      v21[0] = 67109634;
      v21[1] = 1470;
      v22 = 2080;
      v23 = "-[PBBridgeCompanionController gizmoDidEndUnlockPairing:]";
      v24 = 1024;
      v25 = selectedPairedUnlock;
      _os_log_impl(&dword_2113B6000, v11, OS_LOG_TYPE_DEFAULT, "%d %s (Enabled Paired Unlock %d)", (uint8_t *)v21, 0x18u);
    }

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "postNotificationName:object:", CFSTR("PBBridgeDidCompleteUnlockPairingNotification"), 0);

    if (PBLogPerformanceMetrics())
    {
      +[PBBridgeResponsePerformanceMonitor shareMonitor](PBBridgeResponsePerformanceMonitor, "shareMonitor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      Current = CFAbsoluteTimeGetCurrent();
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "context");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "outgoingResponseIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addMilestone:activityType:activityIdentifier:", v17, v19, Current);

    }
    unlockPairingAssertion = self->_unlockPairingAssertion;
    if (unlockPairingAssertion)
    {
      CFRelease(unlockPairingAssertion);
      self->_unlockPairingAssertion = 0;
    }
    PBNotifyClientOfActivity();

  }
}

- (void)sendGizmoPasscodeRestrictions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  void *v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "effectiveRestrictions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BE63B80]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v31;
    v9 = *MEMORY[0x24BE63B88];
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v31 != v8)
          objc_enumerationMutation(v5);
        v11 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKey:", v9);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
          objc_msgSend(v4, "setObject:forKey:", v13, v11);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    }
    while (v7);
  }
  v25 = v3;
  objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BE63B90]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v27;
    v18 = *MEMORY[0x24BE63B98];
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v27 != v17)
          objc_enumerationMutation(v14);
        v20 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * j);
        objc_msgSend(v14, "objectForKey:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectForKey:", v18);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
          objc_msgSend(v4, "setObject:forKey:", v22, v20);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    }
    while (v16);
  }
  v34 = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v34, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBBridgeCompanionController _sendRemoteCommandWithMessageID:withArguments:](self, "_sendRemoteCommandWithMessageID:withArguments:", 20, v23);

}

- (void)tellGizmoToSetDiagnosticsEnabled:(BOOL)a3
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
  -[PBBridgeCompanionController _sendRemoteCommandWithMessageID:withArguments:](self, "_sendRemoteCommandWithMessageID:withArguments:", 10, v5);

}

- (void)tellGizmoToSetLocationEnabled:(BOOL)a3
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
  -[PBBridgeCompanionController _sendRemoteCommandWithMessageID:withArguments:](self, "_sendRemoteCommandWithMessageID:withArguments:", 8, v5);

}

- (void)tellGizmoToSetFitnessRouteTrackingEnabled:(BOOL)a3
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
  -[PBBridgeCompanionController _sendRemoteCommandWithMessageID:withArguments:](self, "_sendRemoteCommandWithMessageID:withArguments:", 33, v5);

}

- (void)tellWatchToSetSiriEnabled:(BOOL)a3
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
  -[PBBridgeCompanionController _sendRemoteCommandWithMessageID:withArguments:](self, "_sendRemoteCommandWithMessageID:withArguments:", 28, v5);

}

- (void)tellGizmoToSetMessagesinCloudEnabled:(BOOL)a3
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
  -[PBBridgeCompanionController _sendRemoteCommandWithMessageID:withArguments:](self, "_sendRemoteCommandWithMessageID:withArguments:", 31, v5);

}

- (void)tellWatchToSetLauncherViewMode:(int64_t)a3
{
  void *v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBBridgeCompanionController _sendRemoteCommandWithMessageID:withArguments:](self, "_sendRemoteCommandWithMessageID:withArguments:", 112, v5);

}

- (void)retrieveAppViewListImageFromGizmo:(CGSize)a3 completion:(id)a4
{
  double height;
  double width;
  id v7;
  void (**appViewListImageCompletion)(id, _QWORD);
  void *v9;
  id v10;
  void *v11;
  double v12;
  double v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[3];
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  double v24;
  uint64_t v25;
  NSSize v26;

  height = a3.height;
  width = a3.width;
  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  appViewListImageCompletion = (void (**)(id, _QWORD))self->_appViewListImageCompletion;
  if (appViewListImageCompletion)
    appViewListImageCompletion[2](appViewListImageCompletion, 0);
  v9 = (void *)objc_msgSend(v7, "copy");
  v10 = self->_appViewListImageCompletion;
  self->_appViewListImageCompletion = v9;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "scale");
  v13 = v12;

  pbb_setupflow_log();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v26.width = width;
    v26.height = height;
    NSStringFromSize(v26);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v22 = v15;
    v23 = 2048;
    v24 = v13;
    _os_log_impl(&dword_2113B6000, v14, OS_LOG_TYPE_DEFAULT, ">>>> retrieve app view list image from gizmo %@ %f", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", width);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v16;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", height);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v17;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBBridgeCompanionController _sendRemoteCommandWithMessageID:withArguments:](self, "_sendRemoteCommandWithMessageID:withArguments:", 113, v19);

}

- (void)handleAppViewListImageResponse:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  PBBProtoAppViewListImageResponse *v8;
  void *v9;
  PBBProtoAppViewListImageResponse *v10;
  PBBProtoAppViewListImageResponse *v11;
  _QWORD v12[5];
  PBBProtoAppViewListImageResponse *v13;

  v4 = a3;
  v5 = objc_msgSend(v4, "type");
  objc_msgSend(v4, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fromID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = -[PBBridgeCompanionController shouldHandleMessageType:fromId:](self, "shouldHandleMessageType:fromId:", v5, v7);

  if ((_DWORD)v5)
  {
    v8 = [PBBProtoAppViewListImageResponse alloc];
    objc_msgSend(v4, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PBBProtoAppViewListImageResponse initWithData:](v8, "initWithData:", v9);

    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __62__PBBridgeCompanionController_handleAppViewListImageResponse___block_invoke;
    v12[3] = &unk_24CBBE4A8;
    v12[4] = self;
    v13 = v10;
    v11 = v10;
    dispatch_async(MEMORY[0x24BDAC9B8], v12);

  }
}

void __62__PBBridgeCompanionController_handleAppViewListImageResponse___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 264))
  {
    if (objc_msgSend(*(id *)(a1 + 40), "hasImageData"))
    {
      v2 = (void *)MEMORY[0x24BDF6AC8];
      objc_msgSend(*(id *)(a1 + 40), "imageData");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "imageWithData:scale:", v3, 2.0);
      v6 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = 0;
    }
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 264) + 16))();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 264);
    *(_QWORD *)(v4 + 264) = 0;

  }
}

- (void)tellGizmoToPushControllerType:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t buf[4];
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  pbb_setupflow_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    PBBuddyControllerDescription(a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109378;
    v11 = a3;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_2113B6000, v5, OS_LOG_TYPE_DEFAULT, "Telling Gizmo to push (%d - %@)", buf, 0x12u);

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBBridgeCompanionController _sendRemoteCommandWithMessageID:withArguments:](self, "_sendRemoteCommandWithMessageID:withArguments:", 3, v8);

}

- (void)tellGizmoToPopToControllerType:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t buf[4];
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  pbb_setupflow_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    PBBuddyControllerDescription(a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109378;
    v11 = a3;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_2113B6000, v5, OS_LOG_TYPE_DEFAULT, "Telling Gizmo to pop to (%d - %@)", buf, 0x12u);

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBBridgeCompanionController _sendRemoteCommandWithMessageID:withArguments:](self, "_sendRemoteCommandWithMessageID:withArguments:", 4, v8);

}

- (void)tellGizmoToShowLockedOnAnimationTimeToFlash:(double)a3 animationCompletion:(id)a4
{
  void *v6;
  id lockedOnAnimationCompletion;
  double v8;
  double v9;
  NSObject *v10;
  dispatch_time_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  void *v16;
  uint8_t buf[4];
  double v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = (void *)objc_msgSend(a4, "copy");
  lockedOnAnimationCompletion = self->_lockedOnAnimationCompletion;
  self->_lockedOnAnimationCompletion = v6;

  v8 = *(double *)&PBBridgeAnimationSyncOffsetTime - a3;
  v9 = 0.0;
  if (*(double *)&PBBridgeAnimationSyncOffsetTime - a3 < 0.0)
  {
    pbb_setupflow_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v18 = a3;
      v19 = 2048;
      v20 = PBBridgeAnimationSyncOffsetTime;
      _os_log_impl(&dword_2113B6000, v10, OS_LOG_TYPE_DEFAULT, "Time to flash is too long (%f vs %f). Pushing back animation.", buf, 0x16u);
    }

    v9 = fabs(v8);
    v8 = 0.0;
  }
  v11 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __95__PBBridgeCompanionController_tellGizmoToShowLockedOnAnimationTimeToFlash_animationCompletion___block_invoke;
  v15[3] = &unk_24CBBE1E0;
  v15[4] = self;
  dispatch_after(v11, MEMORY[0x24BDAC9B8], v15);
  pbb_setupflow_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2113B6000, v12, OS_LOG_TYPE_DEFAULT, "Telling Gizmo show Lock-On Animation", buf, 2u);
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v16, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBBridgeCompanionController _sendRemoteCommandWithMessageID:withArguments:](self, "_sendRemoteCommandWithMessageID:withArguments:", 17, v14);

  PBNotifyClientOfActivity();
}

void __95__PBBridgeCompanionController_tellGizmoToShowLockedOnAnimationTimeToFlash_animationCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 184);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 184);
    *(_QWORD *)(v3 + 184) = 0;

  }
}

- (void)tellGizmoToSetCrownOrientationRight:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  uint8_t buf[4];
  const __CFString *v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x24BDAC8D0];
  pbb_setupflow_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("On Left");
    if (v3)
      v6 = CFSTR("On Right");
    *(_DWORD *)buf = 138412290;
    v11 = v6;
    _os_log_impl(&dword_2113B6000, v5, OS_LOG_TYPE_DEFAULT, "Telling Gizmo To Set Crown Orientation: %@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBBridgeCompanionController _sendRemoteCommandWithMessageID:withArguments:](self, "_sendRemoteCommandWithMessageID:withArguments:", 18, v8);

}

- (void)tellGizmoToUpdateSyncProgressTo:(double)a3 withState:(int64_t)a4
{
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  uint8_t buf[4];
  double v13;
  __int16 v14;
  int64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  pbb_setupflow_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v13 = a3;
    v14 = 2048;
    v15 = a4;
    _os_log_impl(&dword_2113B6000, v7, OS_LOG_TYPE_DEFAULT, "Telling Gizmo To Update Sync Progress to: %f and state: %ld", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBBridgeCompanionController _sendRemoteCommandWithMessageID:withArguments:](self, "_sendRemoteCommandWithMessageID:withArguments:", 19, v10);

}

- (void)startEstablishingPairing
{
  self->_isEstablishingPairing = 1;
}

- (void)tellGizmoToBeginActivation
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  pbb_activation_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[PBBridgeCompanionController tellGizmoToBeginActivation]";
    _os_log_impl(&dword_2113B6000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v6, 0xCu);
  }

  -[PBBridgeCompanionController refreshTimeoutTimerWithNewActivationGranularState:](self, "refreshTimeoutTimerWithNewActivationGranularState:", 1);
  objc_msgSend((id)*MEMORY[0x24BDF74F8], "setupController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pairingReportManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addPairingTimeEventToPairingReportPlist:withValue:withError:", 12, MEMORY[0x24BDBD1C8], 0);
  objc_msgSend(v5, "checkInWithOpenPairingTimeEvent:", 18);
  -[PBBridgeCompanionController _sendRemoteCommandWithMessageID:withArguments:](self, "_sendRemoteCommandWithMessageID:withArguments:", 11, 0);

}

- (void)tellGizmoToRetryActivation
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  pbb_activation_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[PBBridgeCompanionController tellGizmoToRetryActivation]";
    _os_log_impl(&dword_2113B6000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  -[PBBridgeCompanionController refreshTimeoutTimerWithNewActivationGranularState:](self, "refreshTimeoutTimerWithNewActivationGranularState:", 1);
  -[PBBridgeCompanionController _sendRemoteCommandWithMessageID:withArguments:](self, "_sendRemoteCommandWithMessageID:withArguments:", 15, 0);
}

- (void)invalidateTimeoutTimerWithNewActivationGranularState:(unsigned __int16)a3
{
  NSObject *timeoutTrackerQueue;
  _QWORD v6[5];
  unsigned __int16 v7;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_timeoutTrackerQueue);
  timeoutTrackerQueue = self->_timeoutTrackerQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __84__PBBridgeCompanionController_invalidateTimeoutTimerWithNewActivationGranularState___block_invoke;
  v6[3] = &unk_24CBBEBB8;
  v7 = a3;
  v6[4] = self;
  dispatch_sync(timeoutTrackerQueue, v6);
}

void __84__PBBridgeCompanionController_invalidateTimeoutTimerWithNewActivationGranularState___block_invoke(uint64_t a1)
{
  NSObject *v2;
  const __CFString *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  pbb_activation_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    if ((unsigned __int16)(*(_WORD *)(a1 + 40) + 1) > 7u)
      v3 = CFSTR("<Unknown State>");
    else
      v3 = *(&off_24CBBEC28 + (__int16)(*(_WORD *)(a1 + 40) + 1));
    v7 = 136315394;
    v8 = "-[PBBridgeCompanionController invalidateTimeoutTimerWithNewActivationGranularState:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_2113B6000, v2, OS_LOG_TYPE_DEFAULT, "%s: new state (%@)", (uint8_t *)&v7, 0x16u);
  }

  *(_WORD *)(*(_QWORD *)(a1 + 32) + 74) = *(_WORD *)(a1 + 40);
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 160);
  if (v4)
  {
    dispatch_source_cancel(v4);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 160);
    *(_QWORD *)(v5 + 160) = 0;

  }
}

- (void)refreshTimeoutTimerWithNewActivationGranularState:(unsigned __int16)a3
{
  NSObject *timeoutTrackerQueue;
  _QWORD v6[5];
  unsigned __int16 v7;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_timeoutTrackerQueue);
  timeoutTrackerQueue = self->_timeoutTrackerQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __81__PBBridgeCompanionController_refreshTimeoutTimerWithNewActivationGranularState___block_invoke;
  v6[3] = &unk_24CBBEBB8;
  v7 = a3;
  v6[4] = self;
  dispatch_sync(timeoutTrackerQueue, v6);
}

void __81__PBBridgeCompanionController_refreshTimeoutTimerWithNewActivationGranularState___block_invoke(uint64_t a1)
{
  NSObject *v2;
  const __CFString *v3;
  dispatch_source_t *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  unsigned int v8;
  double v9;
  NSObject *v10;
  const __CFString *v11;
  NSObject *v12;
  dispatch_source_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  dispatch_time_t v17;
  NSObject *v18;
  _QWORD handler[4];
  id v20;
  uint8_t buf[4];
  double v22;
  __int16 v23;
  const __CFString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  pbb_activation_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    if ((unsigned __int16)(*(_WORD *)(a1 + 40) + 1) > 7u)
      v3 = CFSTR("<Unknown State>");
    else
      v3 = *(&off_24CBBEC28 + (__int16)(*(_WORD *)(a1 + 40) + 1));
    *(_DWORD *)buf = 136315394;
    v22 = COERCE_DOUBLE("-[PBBridgeCompanionController refreshTimeoutTimerWithNewActivationGranularState:]_block_invoke");
    v23 = 2112;
    v24 = v3;
    _os_log_impl(&dword_2113B6000, v2, OS_LOG_TYPE_DEFAULT, "%s: new state (%@)", buf, 0x16u);
  }

  *(_WORD *)(*(_QWORD *)(a1 + 32) + 74) = *(_WORD *)(a1 + 40);
  v4 = *(dispatch_source_t **)(a1 + 32);
  if (v4[20])
  {
    dispatch_source_cancel(v4[20]);
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 160);
    *(_QWORD *)(v5 + 160) = 0;

    v4 = *(dispatch_source_t **)(a1 + 32);
  }
  -[dispatch_source_t service](v4, "service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = *(unsigned __int16 *)(*(_QWORD *)(a1 + 32) + 74) - 1;
    v9 = 0.0;
    if (v8 <= 5)
      v9 = dbl_211401CA0[(__int16)v8];
    pbb_activation_log();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      if ((unsigned __int16)(*(_WORD *)(*(_QWORD *)(a1 + 32) + 74) + 1) > 7u)
        v11 = CFSTR("<Unknown State>");
      else
        v11 = *(&off_24CBBEC28 + (__int16)(*(_WORD *)(*(_QWORD *)(a1 + 32) + 74) + 1));
      *(_DWORD *)buf = 134218242;
      v22 = v9 / 60.0;
      v23 = 2112;
      v24 = v11;
      _os_log_impl(&dword_2113B6000, v10, OS_LOG_TYPE_DEFAULT, "Setting %1.f minute timeout for activation phase %@", buf, 0x16u);
    }

    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    v13 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, MEMORY[0x24BDAC9B8]);
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(void **)(v14 + 160);
    *(_QWORD *)(v14 + 160) = v13;

    v16 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 160);
    v17 = dispatch_time(0, (uint64_t)(v9 * 1000000000.0));
    dispatch_source_set_timer(v16, v17, 0xFFFFFFFFFFFFFFFFLL, 0);
    v18 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 160);
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __81__PBBridgeCompanionController_refreshTimeoutTimerWithNewActivationGranularState___block_invoke_438;
    handler[3] = &unk_24CBBEBE0;
    objc_copyWeak(&v20, (id *)buf);
    dispatch_source_set_event_handler(v18, handler);
    dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 160));
    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    pbb_activation_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2113B6000, v12, OS_LOG_TYPE_DEFAULT, "Skipped Timeout Refresh Because Service Was Nil", buf, 2u);
    }

  }
}

void __81__PBBridgeCompanionController_refreshTimeoutTimerWithNewActivationGranularState___block_invoke_438(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setActivationTimeout:", 0);

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "activationTimedOut");

}

- (void)activationTimedOut
{
  const __CFString *v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  const __CFString *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if ((unsigned __int16)(a1 + 1) > 7u)
    v3 = CFSTR("<Unknown State>");
  else
    v3 = *(&off_24CBBEC28 + (__int16)(a1 + 1));
  v4 = *(_QWORD *)(a2 + 168);
  v5 = 136315650;
  v6 = "-[PBBridgeCompanionController activationTimedOut]";
  v7 = 2112;
  v8 = v3;
  v9 = 2112;
  v10 = v4;
  OUTLINED_FUNCTION_11(&dword_2113B6000, a3, (uint64_t)a3, "%s: Activation time out in phase %@ (Last message sent was %@)", (uint8_t *)&v5);
  OUTLINED_FUNCTION_5();
}

- (void)tellGizmoToKeepAliveForActivationEvent
{
  NSObject *v3;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  pbb_activation_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109378;
    v4[1] = 1752;
    v5 = 2080;
    v6 = "-[PBBridgeCompanionController tellGizmoToKeepAliveForActivationEvent]";
    _os_log_impl(&dword_2113B6000, v3, OS_LOG_TYPE_DEFAULT, "%d %s", (uint8_t *)v4, 0x12u);
  }

  -[PBBridgeCompanionController _sendRemoteCommandWithMessageID:withArguments:](self, "_sendRemoteCommandWithMessageID:withArguments:", 24, MEMORY[0x24BDBD1A8]);
}

- (void)handleRemoteActivationDetails:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  PBBProtoRemoteActivationFailureReport *v8;
  void *v9;
  PBBProtoRemoteActivationFailureReport *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  id v17;

  v4 = a3;
  v5 = objc_msgSend(v4, "type");
  objc_msgSend(v4, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fromID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(self) = -[PBBridgeCompanionController shouldHandleMessageType:fromId:](self, "shouldHandleMessageType:fromId:", v5, v7);

  if ((_DWORD)self)
  {
    v8 = [PBBProtoRemoteActivationFailureReport alloc];
    objc_msgSend(v4, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PBBProtoRemoteActivationFailureReport initWithData:](v8, "initWithData:", v9);

    -[PBBProtoRemoteActivationFailureReport activationError](v10, "activationError");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1620]), "initForReadingFromData:error:", v11, &v17);
    v13 = v17;
    if (v13)
    {
      pbb_activation_log();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        -[PBBridgeCompanionController handleRemoteActivationDetails:].cold.2((uint64_t)v13, v11, v14);

    }
    objc_msgSend(v12, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BDD0E88]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "finishDecoding");
    pbb_activation_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[PBBridgeCompanionController handleRemoteActivationDetails:].cold.1();

  }
}

- (void)queryGizmoForShowWarrantySentinelAndRestoreDeviceName:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pbb_setupflow_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    v22 = 1784;
    v23 = 2080;
    v24 = "-[PBBridgeCompanionController queryGizmoForShowWarrantySentinelAndRestoreDeviceName:]";
    v25 = 2112;
    v26 = v4;
    _os_log_impl(&dword_2113B6000, v5, OS_LOG_TYPE_DEFAULT, "%d %s -- Querying for Warranty Sentinel; Device name: %@",
      buf,
      0x1Cu);
  }

  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v20, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    goto LABEL_7;
  v18 = 0;
  v19 = 0;
  objc_msgSend((id)objc_opt_class(), "iCloudFirstName:lastName:", &v19, &v18);
  v8 = v19;
  v9 = v18;
  v10 = v9;
  if (!v8)
  {

    v16 = 0;
    v17 = 0;
    objc_msgSend((id)objc_opt_class(), "meCardFirstName:lastName:", &v17, &v16);
    v8 = v17;
    v10 = v16;
    if (!v8)
      goto LABEL_8;
  }
  objc_msgSend((id)objc_opt_class(), "displayNameWithFirstName:lastName:", v8, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("DEVICE_NAME"), &stru_24CBBF548, CFSTR("Localizable"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", v14, v11);
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
LABEL_7:
    objc_msgSend(v7, "arrayByAddingObject:", v4);
    v15 = objc_claimAutoreleasedReturnValue();

    v10 = v4;
    v7 = (void *)v15;
LABEL_8:

  }
  -[PBBridgeCompanionController _sendRemoteCommandWithMessageID:withArguments:](self, "_sendRemoteCommandWithMessageID:withArguments:", 14, v7);

}

- (void)tellGizmoToDeleteWarrantySentinel
{
  NSObject *v3;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  pbb_setupflow_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109378;
    v4[1] = 1814;
    v5 = 2080;
    v6 = "-[PBBridgeCompanionController tellGizmoToDeleteWarrantySentinel]";
    _os_log_impl(&dword_2113B6000, v3, OS_LOG_TYPE_DEFAULT, "%d %s -- Telling Gizmo to delete its Warranty Sentinel", (uint8_t *)v4, 0x12u);
  }

  -[PBBridgeCompanionController _sendRemoteCommandWithMessageID:withArguments:](self, "_sendRemoteCommandWithMessageID:withArguments:", 14, &unk_24CBCE8C0);
}

- (void)handleWarrantySentinelResponse:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  PBBProtoWarrantySentinel *v8;
  void *v9;
  PBBProtoWarrantySentinel *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double Current;
  objc_class *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint8_t buf[4];
  PBBProtoWarrantySentinel *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "type");
  objc_msgSend(v4, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fromID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(self) = -[PBBridgeCompanionController shouldHandleMessageType:fromId:](self, "shouldHandleMessageType:fromId:", v5, v7);

  if ((_DWORD)self)
  {
    v8 = [PBBProtoWarrantySentinel alloc];
    objc_msgSend(v4, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PBBProtoWarrantySentinel initWithData:](v8, "initWithData:", v9);

    pbb_setupflow_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v10;
      _os_log_impl(&dword_2113B6000, v11, OS_LOG_TYPE_DEFAULT, "Got Warranty Sentinel Response: (%@)", buf, 0xCu);
    }

    if (-[PBBProtoWarrantySentinel hasSentinelExists](v10, "hasSentinelExists"))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[PBBProtoWarrantySentinel sentinelExists](v10, "sentinelExists", CFSTR("PBBridgeWarrantySentinelExistsKey")));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v12;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v13, "mutableCopy");

      -[PBBProtoWarrantySentinel appleLanguages](v10, "appleLanguages");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (v15)
      {
        -[PBBProtoWarrantySentinel appleLanguages](v10, "appleLanguages");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, CFSTR("PBBridgeGizmoAppleLanguagesKey"));

      }
      if (-[PBBProtoWarrantySentinel hasAppleLocale](v10, "hasAppleLocale"))
      {
        -[PBBProtoWarrantySentinel appleLocale](v10, "appleLocale");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setObject:forKeyedSubscript:", v17, CFSTR("PBBridgeGizmoAppleLocaleKey"));

      }
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "postNotificationName:object:userInfo:", CFSTR("PBBridgeWarrantySentinelNotification"), 0, v14);

    }
    if (PBLogPerformanceMetrics())
    {
      +[PBBridgeResponsePerformanceMonitor shareMonitor](PBBridgeResponsePerformanceMonitor, "shareMonitor");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      Current = CFAbsoluteTimeGetCurrent();
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "context");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "outgoingResponseIdentifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addMilestone:activityType:activityIdentifier:", v22, v24, Current);

    }
  }

}

- (void)tellGizmoToPrepareForInitialSyncWithCompletion:(id)a3
{
  void *v4;
  id initialSyncPrepCompletion;
  NSObject *v6;
  _DWORD v7[2];
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend(a3, "copy");
  initialSyncPrepCompletion = self->_initialSyncPrepCompletion;
  self->_initialSyncPrepCompletion = v4;

  pbb_setupflow_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109378;
    v7[1] = 1855;
    v8 = 2080;
    v9 = "-[PBBridgeCompanionController tellGizmoToPrepareForInitialSyncWithCompletion:]";
    _os_log_impl(&dword_2113B6000, v6, OS_LOG_TYPE_DEFAULT, "%d %s", (uint8_t *)v7, 0x12u);
  }

  -[PBBridgeCompanionController _sendRemoteCommandWithMessageID:withArguments:](self, "_sendRemoteCommandWithMessageID:withArguments:", 21, MEMORY[0x24BDBD1A8]);
}

- (void)watchDidPrepareForInitialSync:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void (**initialSyncPrepCompletion)(void);
  id v10;
  _DWORD v11[2];
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "type");
  objc_msgSend(v4, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "fromID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = -[PBBridgeCompanionController shouldHandleMessageType:fromId:](self, "shouldHandleMessageType:fromId:", v5, v7);

  if ((_DWORD)v5)
  {
    pbb_setupflow_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v11[0] = 67109378;
      v11[1] = 1865;
      v12 = 2080;
      v13 = "-[PBBridgeCompanionController watchDidPrepareForInitialSync:]";
      _os_log_impl(&dword_2113B6000, v8, OS_LOG_TYPE_DEFAULT, "%d %s", (uint8_t *)v11, 0x12u);
    }

    initialSyncPrepCompletion = (void (**)(void))self->_initialSyncPrepCompletion;
    if (initialSyncPrepCompletion)
    {
      initialSyncPrepCompletion[2]();
      v10 = self->_initialSyncPrepCompletion;
      self->_initialSyncPrepCompletion = 0;

    }
  }
}

- (void)queryGizmoForOfflineTerms
{
  NSObject *v3;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  pbb_setupflow_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109378;
    v4[1] = 1878;
    v5 = 2080;
    v6 = "-[PBBridgeCompanionController queryGizmoForOfflineTerms]";
    _os_log_impl(&dword_2113B6000, v3, OS_LOG_TYPE_DEFAULT, "%d %s -- Querying for Offline Terms", (uint8_t *)v4, 0x12u);
  }

  -[PBBridgeCompanionController _sendRemoteCommandWithMessageID:withArguments:](self, "_sendRemoteCommandWithMessageID:withArguments:", 16, 0);
}

- (void)handleOfflineTermsResponse:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  PBBProtoOfflineTerms *v8;
  void *v9;
  PBBProtoOfflineTerms *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  double Current;
  objc_class *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
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
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  const __CFString *v53;
  void *v54;
  uint8_t buf[4];
  PBBProtoOfflineTerms *v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  uint64_t v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "type");
  objc_msgSend(v4, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fromID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(self) = -[PBBridgeCompanionController shouldHandleMessageType:fromId:](self, "shouldHandleMessageType:fromId:", v5, v7);

  if ((_DWORD)self)
  {
    v8 = [PBBProtoOfflineTerms alloc];
    objc_msgSend(v4, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PBBProtoOfflineTerms initWithData:](v8, "initWithData:", v9);

    pbb_setupflow_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[PBBProtoOfflineTerms license](v10, "license");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "length");
      -[PBBProtoOfflineTerms multiterms](v10, "multiterms");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "length");
      -[PBBProtoOfflineTerms warranty](v10, "warranty");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218752;
      v56 = v10;
      v57 = 2048;
      v58 = v13;
      v59 = 2048;
      v60 = v15;
      v61 = 2048;
      v62 = objc_msgSend(v16, "length");
      _os_log_impl(&dword_2113B6000, v11, OS_LOG_TYPE_DEFAULT, "Got Offline Terms Response: (%p); license: (%lu bytes); multiterms: (%lu bytes); warranty: (%lu bytes);",
        buf,
        0x2Au);

    }
    if (PBLogPerformanceMetrics())
    {
      +[PBBridgeResponsePerformanceMonitor shareMonitor](PBBridgeResponsePerformanceMonitor, "shareMonitor");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      Current = CFAbsoluteTimeGetCurrent();
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "context");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "outgoingResponseIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "addMilestone:activityType:activityIdentifier:", v20, v22, Current);

    }
    v53 = CFSTR("PBBridgeOfflineTermsLicenseKey");
    -[PBBProtoOfflineTerms license](v10, "license");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v23;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v54, &v53, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v24, "mutableCopy");

    if (-[PBBProtoOfflineTerms hasMultiterms](v10, "hasMultiterms"))
    {
      v26 = objc_alloc(MEMORY[0x24BDD17C8]);
      -[PBBProtoOfflineTerms multiterms](v10, "multiterms");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = (void *)objc_msgSend(v26, "initWithData:encoding:", v27, 4);

      v46 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v25;
      objc_msgSend(v49, "localizedStringForKey:value:table:", CFSTR("TERMS_AND_CONDITIONS"), &stru_24CBBF548, CFSTR("Localizable"));
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "localizedStringForKey:value:table:", CFSTR("IMPORTANT"), &stru_24CBBF548, CFSTR("Localizable"));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "localizedStringForKey:value:table:", CFSTR("Part1"), &stru_24CBBF548, CFSTR("Localizable"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "localizedStringForKey:value:table:", CFSTR("TC_HEADER"), &stru_24CBBF548, CFSTR("Localizable"));
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "localizedStringForKey:value:table:", CFSTR("WARRANTY_HEADER"), &stru_24CBBF548, CFSTR("Localizable"));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR("Part2"), &stru_24CBBF548, CFSTR("Localizable"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("Part3"), &stru_24CBBF548, CFSTR("Localizable"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("AGREE"), &stru_24CBBF548, CFSTR("Localizable"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("DISAGREE"), &stru_24CBBF548, CFSTR("Localizable"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "stringWithFormat:", v52, v51, v43, v41, v39, v38, v28, v29, v31, v33);
      v47 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = v50;
      objc_msgSend(v47, "dataUsingEncoding:", 4);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v50, "setObject:forKeyedSubscript:", v34, CFSTR("PBBridgeOfflineTermsMultitermsKey"));

    }
    if (-[PBBProtoOfflineTerms hasWarranty](v10, "hasWarranty"))
    {
      -[PBBProtoOfflineTerms warranty](v10, "warranty");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setObject:forKeyedSubscript:", v35, CFSTR("PBBridgeOfflineTermsWarrantyKey"));

    }
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "postNotificationName:object:userInfo:", CFSTR("PBBridgeOfflineTermsNotification"), 0, v25);

  }
}

- (void)transportBecameReachable
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
  v11.super_class = (Class)PBBridgeCompanionController;
  -[PBBridgeIDSServiceDelegate transportBecameReachable](&v11, sel_transportBecameReachable);
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
      v13 = "-[PBBridgeCompanionController transportBecameReachable]";
      _os_log_impl(&dword_2113B6000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }

    v6 = objc_loadWeakRetained((id *)p_delegate);
    -[NSObject transportBecameReachable](v6, "transportBecameReachable");
  }
  else if (v7)
  {
    v8 = objc_loadWeakRetained((id *)p_delegate);
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446466;
    v13 = "-[PBBridgeCompanionController transportBecameReachable]";
    v14 = 2112;
    v15 = v10;
    _os_log_impl(&dword_2113B6000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s: Delegate (%@) missing transportBecameReachable", buf, 0x16u);

  }
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
  v11.super_class = (Class)PBBridgeCompanionController;
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
      v13 = "-[PBBridgeCompanionController transportBecameUnreachable]";
      _os_log_impl(&dword_2113B6000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
    }

    v6 = objc_loadWeakRetained((id *)p_delegate);
    -[NSObject transportBecameUnreachable](v6, "transportBecameUnreachable");
  }
  else if (v7)
  {
    v8 = objc_loadWeakRetained((id *)p_delegate);
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136446466;
    v13 = "-[PBBridgeCompanionController transportBecameUnreachable]";
    v14 = 2112;
    v15 = v10;
    _os_log_impl(&dword_2113B6000, v6, OS_LOG_TYPE_DEFAULT, "%{public}s: Delegate (%@) missing transportBecameUnreachable", buf, 0x16u);

  }
}

+ (void)meCardFirstName:(id *)a3 lastName:(id *)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  uint8_t buf[4];
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  v6 = objc_alloc_init(MEMORY[0x24BDBACF8]);
  pbb_setupflow_log();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    v15 = 1947;
    v16 = 2080;
    v17 = "+[PBBridgeCompanionController meCardFirstName:lastName:]";
    v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_2113B6000, v7, OS_LOG_TYPE_DEFAULT, "%d %s: contactStore: %@", buf, 0x1Cu);
  }

  if (v6)
  {
    v8 = *MEMORY[0x24BDBA2C0];
    v22[0] = *MEMORY[0x24BDBA2C8];
    v22[1] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    objc_msgSend(v6, "_ios_meContactWithKeysToFetch:error:", v9, &v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v13;

    pbb_setupflow_log();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109890;
      v15 = 1953;
      v16 = 2080;
      v17 = "+[PBBridgeCompanionController meCardFirstName:lastName:]";
      v18 = 2112;
      v19 = v10;
      v20 = 2112;
      v21 = v11;
      _os_log_impl(&dword_2113B6000, v12, OS_LOG_TYPE_DEFAULT, "%d %s: meContact: %@, error: %@", buf, 0x26u);
    }

    if (v10)
    {
      objc_msgSend(v10, "givenName");
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "familyName");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
}

+ (void)iCloudFirstName:(id *)a3 lastName:(id *)a4
{
  void *v6;
  id v7;

  v7 = objc_alloc_init(MEMORY[0x24BDB4398]);
  objc_msgSend(v7, "aa_primaryAppleAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "aa_firstName");
  *a3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "aa_lastName");
  *a4 = (id)objc_claimAutoreleasedReturnValue();

}

+ (id)displayNameWithFirstName:(id)a3 lastName:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    v7 = v5;
    if (objc_msgSend(v7, "_containsCJKScriptsOnly")
      && objc_msgSend(v6, "length")
      && objc_msgSend(v6, "_containsCJKScriptsOnly"))
    {
      objc_msgSend(v6, "stringByAppendingString:", v7);
      v8 = objc_claimAutoreleasedReturnValue();

      v7 = (id)v8;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)tellWatchToChangeDeviceNameFor:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v4 = a3;
    v5 = (void *)objc_opt_class();
    objc_msgSend(v4, "firstName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "displayNameWithFirstName:lastName:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("DEVICE_NAME"), &stru_24CBBF548, CFSTR("Localizable"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", v11, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v14[0] = v12;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBBridgeCompanionController _sendRemoteCommandWithMessageID:withArguments:](self, "_sendRemoteCommandWithMessageID:withArguments:", 110, v13);

  }
}

- (void)sendDemoWatchWirelessCredentials
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  -[PBBridgeCompanionController currentNetworks:](self, "currentNetworks:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "objectForKey:", CFSTR("SSID_STR"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (__CFString *)v5;
  else
    v7 = &stru_24CBBF548;
  v8 = v7;

  objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BE67E20]);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (__CFString *)v9;
  else
    v11 = &stru_24CBBF548;
  v12 = v11;

  v14[0] = v8;
  v14[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[PBBridgeCompanionController _sendRemoteCommandWithMessageID:withArguments:](self, "_sendRemoteCommandWithMessageID:withArguments:", 26, v13);
}

- (void)sendAllTinkerWirelessCredentials:(BOOL)a3
{
  id v4;

  -[PBBridgeCompanionController currentNetworks:](self, "currentNetworks:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
    -[PBBridgeCompanionController _sendRemoteCommandWithMessageID:withArguments:](self, "_sendRemoteCommandWithMessageID:withArguments:", 104, v4);

}

- (void)sendAllWirelessCredentials:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;

  -[PBBridgeCompanionController currentNetworks:](self, "currentNetworks:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    -[PBBridgeCompanionController _sendRemoteCommandWithMessageID:withArguments:](self, "_sendRemoteCommandWithMessageID:withArguments:", 37, v6);
  }
  else
  {
    objc_msgSend((id)*MEMORY[0x24BDF74F8], "setupController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "linkUpgradeMonitor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "wirelessCredentialUpdateCompletedWithResult:", 0);

  }
}

- (id)currentNetworks:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  const __CFArray *v5;
  const __CFArray *v6;
  const __CFArray *v7;
  const __CFArray *v8;
  CFIndex v9;
  NSObject *v10;
  uint64_t SSID;
  void *v12;
  const __CFString *v13;
  int IsCaptive;
  int IsProfileBased;
  int IsEAP;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t v30;
  const __CFArray *cf;
  void *v32;
  const __CFArray *v33;
  uint8_t buf[16];
  _BYTE values[12];
  __int16 v36;
  int v37;
  __int16 v38;
  int v39;
  __int16 v40;
  int v41;
  uint64_t v42;

  v3 = a3;
  v42 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_opt_new();
  if (WiFiManagerClientCreate())
  {
    v5 = (const __CFArray *)WiFiManagerClientCopyDevices();
    if (v5)
    {
      v6 = v5;
      if (CFArrayGetCount(v5) >= 1)
      {
        CFArrayGetValueAtIndex(v6, 0);
        if (v3)
        {
          v7 = (const __CFArray *)WiFiManagerClientCopyNetworks();
        }
        else
        {
          *(_QWORD *)values = WiFiDeviceClientCopyCurrentNetwork();
          if (!*(_QWORD *)values)
          {
            pbb_setupflow_log();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_2113B6000, v27, OS_LOG_TYPE_DEFAULT, "Unable to share network, none available", buf, 2u);
            }

            goto LABEL_31;
          }
          v7 = CFArrayCreate(0, (const void **)values, 1, MEMORY[0x24BDBD690]);
        }
        v8 = v7;
        if (v7)
        {
          cf = v6;
          v32 = v4;
          if (CFArrayGetCount(v7) >= 1)
          {
            v9 = 0;
            v30 = *MEMORY[0x24BE67E20];
            v33 = v8;
            do
            {
              CFArrayGetValueAtIndex(v8, v9);
              if (WiFiNetworkIsCaptive()
                || WiFiNetworkIsProfileBased()
                || WiFiNetworkIsEAP())
              {
                pbb_setupflow_log();
                v10 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
                {
                  SSID = WiFiNetworkGetSSID();
                  v12 = (void *)SSID;
                  if (SSID)
                    v13 = (const __CFString *)SSID;
                  else
                    v13 = &stru_24CBBF548;
                  IsCaptive = WiFiNetworkIsCaptive();
                  IsProfileBased = WiFiNetworkIsProfileBased();
                  IsEAP = WiFiNetworkIsEAP();
                  *(_DWORD *)values = 138413058;
                  *(_QWORD *)&values[4] = v13;
                  v36 = 1024;
                  v37 = IsCaptive;
                  v38 = 1024;
                  v39 = IsProfileBased;
                  v40 = 1024;
                  v41 = IsEAP;
                  _os_log_impl(&dword_2113B6000, v10, OS_LOG_TYPE_DEFAULT, "Could not share: %@ - Captive: %{BOOL}d ProfileBased: %{BOOL}d EAP: %{BOOL}d", values, 0x1Eu);

                  v8 = v33;
                }
              }
              else
              {
                v10 = WiFiNetworkCopyRecord();
                v17 = -[NSObject mutableCopy](v10, "mutableCopy");
                objc_msgSend(v17, "removeObjectForKey:", CFSTR("CHANNEL"));
                v18 = (void *)objc_opt_new();
                objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("networkKnownBSSListKey"));
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = objc_msgSend(v19, "count");

                if (v20)
                {
                  v21 = 0;
                  do
                  {
                    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("networkKnownBSSListKey"));
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v22, "objectAtIndex:", v21);
                    v23 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v23, "removeObjectForKey:", CFSTR("CHANNEL"));
                    objc_msgSend(v18, "insertObject:atIndex:", v23, v21);

                    ++v21;
                    objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("networkKnownBSSListKey"));
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    v25 = objc_msgSend(v24, "count");

                  }
                  while (v25 > v21);
                }
                objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, CFSTR("networkKnownBSSListKey"));
                v26 = (void *)WiFiNetworkCopyPassword();
                if (v26)
                  objc_msgSend(v17, "setObject:forKey:", v26, v30);
                objc_msgSend(v32, "addObject:", v17);

                v8 = v33;
              }

              ++v9;
            }
            while (CFArrayGetCount(v8) > v9);
          }
          CFRelease(cf);
          v4 = v32;
          goto LABEL_32;
        }
      }
LABEL_31:
      v8 = v6;
LABEL_32:
      CFRelease(v8);
    }
  }
  pbb_setupflow_log();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)values = 0;
    _os_log_impl(&dword_2113B6000, v28, OS_LOG_TYPE_DEFAULT, "return from current networks", values, 2u);
  }

  return v4;
}

- (id)currentWiFiNetworkName
{
  const __CFArray *v2;
  const __CFArray *v3;
  void *v4;

  if (!WiFiManagerClientCreate() || (v2 = (const __CFArray *)WiFiManagerClientCopyDevices()) == 0)
  {
    v4 = 0;
    return v4;
  }
  v3 = v2;
  if (CFArrayGetCount(v2) < 1)
  {
LABEL_7:
    v4 = 0;
    goto LABEL_8;
  }
  CFArrayGetValueAtIndex(v3, 0);
  v4 = (void *)WiFiDeviceClientCopyCurrentNetwork();
  if (v4)
  {
    if (!WiFiNetworkIsCaptive() && !WiFiNetworkIsProfileBased())
    {
      WiFiNetworkGetSSID();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_8:
  CFRelease(v3);
  return v4;
}

- (void)watchDidIngestWirelessCredentials:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pbb_setupflow_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315138;
    v10 = "-[PBBridgeCompanionController watchDidIngestWirelessCredentials:]";
    _os_log_impl(&dword_2113B6000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v9, 0xCu);
  }

  v6 = objc_msgSend(v4, "type");
  objc_msgSend(v4, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "fromID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBBridgeCompanionController shouldHandleMessageType:fromId:](self, "shouldHandleMessageType:fromId:", v6, v8);

}

- (void)watchDidApplyWirelessCredentials:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pbb_setupflow_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315138;
    v13 = "-[PBBridgeCompanionController watchDidApplyWirelessCredentials:]";
    _os_log_impl(&dword_2113B6000, v5, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v12, 0xCu);
  }

  v6 = objc_msgSend(v4, "type");
  objc_msgSend(v4, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "fromID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PBBridgeCompanionController shouldHandleMessageType:fromId:](self, "shouldHandleMessageType:fromId:", v6, v8);

  if (v9)
  {
    objc_msgSend((id)*MEMORY[0x24BDF74F8], "setupController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "linkUpgradeMonitor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "wirelessCredentialUpdateCompletedWithResult:", 1);

  }
}

- (void)tellWatchToPrepareForForcedSUWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id prepareWatchForForcedSUCompletion;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pbb_setupflow_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[PBBridgeCompanionController tellWatchToPrepareForForcedSUWithCompletion:]";
    _os_log_impl(&dword_2113B6000, v5, OS_LOG_TYPE_DEFAULT, "%s:", (uint8_t *)&v8, 0xCu);
  }

  v6 = (void *)objc_msgSend(v4, "copy");
  prepareWatchForForcedSUCompletion = self->_prepareWatchForForcedSUCompletion;
  self->_prepareWatchForForcedSUCompletion = v6;

  -[PBBridgeCompanionController _sendRemoteCommandWithMessageID:withArguments:](self, "_sendRemoteCommandWithMessageID:withArguments:", 27, MEMORY[0x24BDBD1A8]);
}

- (void)watchDidPrepareForForcedSU:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void (**prepareWatchForForcedSUCompletion)(void);
  id v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  pbb_setupflow_log();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315138;
    v12 = "-[PBBridgeCompanionController watchDidPrepareForForcedSU:]";
    _os_log_impl(&dword_2113B6000, v5, OS_LOG_TYPE_DEFAULT, "%s:", (uint8_t *)&v11, 0xCu);
  }

  v6 = objc_msgSend(v4, "type");
  objc_msgSend(v4, "context");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "fromID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = -[PBBridgeCompanionController shouldHandleMessageType:fromId:](self, "shouldHandleMessageType:fromId:", v6, v8);

  if ((_DWORD)v6)
  {
    prepareWatchForForcedSUCompletion = (void (**)(void))self->_prepareWatchForForcedSUCompletion;
    if (prepareWatchForForcedSUCompletion)
    {
      prepareWatchForForcedSUCompletion[2]();
      v10 = self->_prepareWatchForForcedSUCompletion;
      self->_prepareWatchForForcedSUCompletion = 0;

    }
  }
}

- (void)sendBuysOnWatchUsername:(id)a3 andPassword:(id)a4 withCompletion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id buysOnWatchCredentialsIngestedCompletion;
  NSObject *v12;
  void *v13;
  _QWORD v14[2];
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_msgSend(a5, "copy");
  buysOnWatchCredentialsIngestedCompletion = self->_buysOnWatchCredentialsIngestedCompletion;
  self->_buysOnWatchCredentialsIngestedCompletion = v10;

  pbb_accountsignin_log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[PBBridgeCompanionController sendBuysOnWatchUsername:andPassword:withCompletion:]";
    v17 = 2112;
    v18 = v8;
    _os_log_impl(&dword_2113B6000, v12, OS_LOG_TYPE_DEFAULT, "%s -- username %@", buf, 0x16u);
  }

  v14[0] = v8;
  v14[1] = v9;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBBridgeCompanionController _sendRemoteCommandWithMessageID:withArguments:](self, "_sendRemoteCommandWithMessageID:withArguments:", 32, v13);

}

- (void)requestProxiedDeviceForWatchWithCompletion:(id)a3
{
  void *v4;
  id remoteAccountForDeviceCompletion;
  NSObject *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)objc_msgSend(a3, "copy");
  remoteAccountForDeviceCompletion = self->_remoteAccountForDeviceCompletion;
  self->_remoteAccountForDeviceCompletion = v4;

  pbb_accountsignin_log();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[PBBridgeCompanionController requestProxiedDeviceForWatchWithCompletion:]";
    _os_log_impl(&dword_2113B6000, v6, OS_LOG_TYPE_DEFAULT, "%s:", (uint8_t *)&v7, 0xCu);
  }

  -[PBBridgeCompanionController _sendRemoteCommandWithMessageID:withArguments:](self, "_sendRemoteCommandWithMessageID:withArguments:", 29, MEMORY[0x24BDBD1A8]);
}

- (void)returnedRemoteAccountForDevice:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  PBBProtoRemoteAccountForDevice *v8;
  void *v9;
  PBBProtoRemoteAccountForDevice *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void (**remoteAccountForDeviceCompletion)(id, void *);
  id v15;
  int v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "type");
  objc_msgSend(v4, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fromID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = -[PBBridgeCompanionController shouldHandleMessageType:fromId:](self, "shouldHandleMessageType:fromId:", v5, v7);

  if ((_DWORD)v5)
  {
    v8 = [PBBProtoRemoteAccountForDevice alloc];
    objc_msgSend(v4, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PBBProtoRemoteAccountForDevice initWithData:](v8, "initWithData:", v9);

    pbb_accountsignin_log();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 136315138;
      v17 = "-[PBBridgeCompanionController returnedRemoteAccountForDevice:]";
      _os_log_impl(&dword_2113B6000, v11, OS_LOG_TYPE_DEFAULT, "%s:", (uint8_t *)&v16, 0xCu);
    }

    -[PBBProtoRemoteAccountForDevice serializedDevice](v10, "serializedDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE0AD68], "deviceWithSerializedData:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setLinkType:", 2);
    remoteAccountForDeviceCompletion = (void (**)(id, void *))self->_remoteAccountForDeviceCompletion;
    if (remoteAccountForDeviceCompletion)
    {
      remoteAccountForDeviceCompletion[2](remoteAccountForDeviceCompletion, v13);
      v15 = self->_remoteAccountForDeviceCompletion;
      self->_remoteAccountForDeviceCompletion = 0;

    }
  }

}

- (void)sendComputedTimeZoneToGizmo
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = (id)TMCopyComputedTimeZone();
  pbb_setupflow_log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v8 = "-[PBBridgeCompanionController sendComputedTimeZoneToGizmo]";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_2113B6000, v4, OS_LOG_TYPE_DEFAULT, "%s Sending computed time zone %@ to gizmo", buf, 0x16u);
  }

  if (v3)
  {
    v6 = v3;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBBridgeCompanionController _sendRemoteCommandWithMessageID:withArguments:](self, "_sendRemoteCommandWithMessageID:withArguments:", 111, v5);

  }
}

- (void)sendTinkerAccountCredentialsWithContext:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id tinkerCredentialsIngestedCompletion;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  uint64_t v19;
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
  PBBridgeCompanionController *v32;
  id v33;
  _QWORD v34[5];
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)objc_msgSend(a4, "copy");
  tinkerCredentialsIngestedCompletion = self->_tinkerCredentialsIngestedCompletion;
  v32 = self;
  self->_tinkerCredentialsIngestedCompletion = v7;

  objc_msgSend((id)*MEMORY[0x24BDF74F8], "setupController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "username");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setTinkerSignInId:", v10);

  pbb_accountsignin_log();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "username");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v36 = "-[PBBridgeCompanionController sendTinkerAccountCredentialsWithContext:completion:]";
    v37 = 2112;
    v38 = v12;
    _os_log_impl(&dword_2113B6000, v11, OS_LOG_TYPE_DEFAULT, "%s: username %@", buf, 0x16u);

  }
  objc_msgSend(v6, "acceptedTermsInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    v14 = (void *)MEMORY[0x24BDD1618];
    objc_msgSend(v6, "acceptedTermsInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    objc_msgSend(v14, "archivedDataWithRootObject:requiringSecureCoding:error:", v15, 1, &v33);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v33;

    if (v17)
    {
      pbb_accountsignin_log();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[PBBridgeGizmoController _sendRemoteCommandWithMessageID:withArguments:].cold.1();
      v30 = v17;

    }
    else
    {
      v30 = 0;
    }
  }
  else
  {
    v30 = 0;
    v16 = 0;
  }
  objc_msgSend(v6, "username");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  if (!v19)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v19 = objc_claimAutoreleasedReturnValue();
  }
  v34[0] = v19;
  objc_msgSend(v6, "password", v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (!v21)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v34[1] = v22;
  v23 = (void *)v16;
  v31 = (void *)v16;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v34[2] = v23;
  objc_msgSend(v6, "pairingParentUsername");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (!v24)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v34[3] = v25;
  objc_msgSend(v6, "pairingParentAltDSID");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (!v26)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v34[4] = v27;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v34, 5);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v26)

  if (!v24)
  if (v31)
  {
    if (v21)
      goto LABEL_26;
  }
  else
  {

    if (v21)
      goto LABEL_26;
  }

LABEL_26:
  if (!v20)

  -[PBBridgeCompanionController _sendRemoteCommandWithMessageID:withArguments:](v32, "_sendRemoteCommandWithMessageID:withArguments:", 30, v28);
}

- (void)tinkerWatchIngestedCredentials:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  PBBProtoTinkerAccountCredentialsIngested *v8;
  void *v9;
  PBBProtoTinkerAccountCredentialsIngested *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void (**tinkerCredentialsIngestedCompletion)(id, uint64_t, _QWORD, void *, void *);
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  uint64_t v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "type");
  objc_msgSend(v4, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fromID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = -[PBBridgeCompanionController shouldHandleMessageType:fromId:](self, "shouldHandleMessageType:fromId:", v5, v7);

  if ((_DWORD)v5)
  {
    v8 = [PBBProtoTinkerAccountCredentialsIngested alloc];
    objc_msgSend(v4, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PBBProtoTinkerAccountCredentialsIngested initWithData:](v8, "initWithData:", v9);

    v11 = -[PBBProtoTinkerAccountCredentialsIngested success](v10, "success");
    v12 = -[PBBProtoTinkerAccountCredentialsIngested cdpStatus](v10, "cdpStatus");
    -[PBBProtoTinkerAccountCredentialsIngested errorDescription](v10, "errorDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PBBProtoTinkerAccountCredentialsIngested detailedError](v10, "detailedError");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v21 = 0;
      objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v14, &v21);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v21;
      if (v16)
      {
        pbb_accountsignin_log();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          -[PBBridgeCompanionController tinkerWatchIngestedCredentials:].cold.1();

      }
    }
    else
    {
      v15 = 0;
    }
    pbb_accountsignin_log();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v11);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136316162;
      v23 = "-[PBBridgeCompanionController tinkerWatchIngestedCredentials:]";
      v24 = 2112;
      v25 = v19;
      v26 = 2114;
      v27 = v13;
      v28 = 2114;
      v29 = v15;
      v30 = 2048;
      v31 = v12;
      _os_log_impl(&dword_2113B6000, v18, OS_LOG_TYPE_DEFAULT, " %s: Success %@ (Error message %{public}@) detailed: %{public}@ status: %ld", buf, 0x34u);

    }
    tinkerCredentialsIngestedCompletion = (void (**)(id, uint64_t, _QWORD, void *, void *))self->_tinkerCredentialsIngestedCompletion;
    if (tinkerCredentialsIngestedCompletion)
      tinkerCredentialsIngestedCompletion[2](tinkerCredentialsIngestedCompletion, v11, v12, v13, v15);

  }
}

- (void)tinkerFinishedHealthSharingOptIn:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  PBBProtoHealthSharingEnabled *v7;
  void *v8;
  PBBProtoHealthSharingEnabled *v9;
  uint64_t v10;
  PBBridgeConnectionDelegate **p_delegate;
  id WeakRetained;
  char v13;
  id v14;
  id v15;

  v15 = a3;
  v4 = objc_msgSend(v15, "type");
  objc_msgSend(v15, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fromID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = -[PBBridgeCompanionController shouldHandleMessageType:fromId:](self, "shouldHandleMessageType:fromId:", v4, v6);

  if ((_DWORD)v4)
  {
    v7 = [PBBProtoHealthSharingEnabled alloc];
    objc_msgSend(v15, "data");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PBBProtoHealthSharingEnabled initWithData:](v7, "initWithData:", v8);

    v10 = -[PBBProtoHealthSharingEnabled enabled](v9, "enabled");
    p_delegate = &self->_delegate;
    WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    v13 = objc_opt_respondsToSelector();

    if ((v13 & 1) != 0)
    {
      v14 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v14, "remoteFinishedHealthSharingOptInWithSelection:", v10);

    }
  }

}

- (void)acknowledgeBuysOnWatchCredentialIngestion:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  PBBProtoAcknowledgeBuysOnWatchCredentialIngestion *v8;
  void *v9;
  PBBProtoAcknowledgeBuysOnWatchCredentialIngestion *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void (**buysOnWatchCredentialsIngestedCompletion)(id, uint64_t, _QWORD, void *);
  id v18;
  int v19;
  const char *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = objc_msgSend(v4, "type");
  objc_msgSend(v4, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fromID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = -[PBBridgeCompanionController shouldHandleMessageType:fromId:](self, "shouldHandleMessageType:fromId:", v5, v7);

  if ((_DWORD)v5)
  {
    v8 = [PBBProtoAcknowledgeBuysOnWatchCredentialIngestion alloc];
    objc_msgSend(v4, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PBBProtoAcknowledgeBuysOnWatchCredentialIngestion initWithData:](v8, "initWithData:", v9);

    v11 = -[PBBProtoAcknowledgeBuysOnWatchCredentialIngestion success](v10, "success");
    v12 = -[PBBProtoAcknowledgeBuysOnWatchCredentialIngestion errorCode](v10, "errorCode");
    -[PBBProtoAcknowledgeBuysOnWatchCredentialIngestion errorDescription](v10, "errorDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    pbb_accountsignin_log();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 136315906;
      v20 = "-[PBBridgeCompanionController acknowledgeBuysOnWatchCredentialIngestion:]";
      v21 = 2112;
      v22 = v15;
      v23 = 2112;
      v24 = v16;
      v25 = 2112;
      v26 = v13;
      _os_log_impl(&dword_2113B6000, v14, OS_LOG_TYPE_DEFAULT, "%s -- success: %@ (Error: %@ %@)", (uint8_t *)&v19, 0x2Au);

    }
    buysOnWatchCredentialsIngestedCompletion = (void (**)(id, uint64_t, _QWORD, void *))self->_buysOnWatchCredentialsIngestedCompletion;
    if (buysOnWatchCredentialsIngestedCompletion)
    {
      buysOnWatchCredentialsIngestedCompletion[2](buysOnWatchCredentialsIngestedCompletion, v11, v12, v13);
      v18 = self->_buysOnWatchCredentialsIngestedCompletion;
      self->_buysOnWatchCredentialsIngestedCompletion = 0;

    }
  }

}

- (void)tellWatchToConfigureDeviceManagementWithData:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  id setupDeviceManagementCompletion;
  NSObject *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  _BOOL4 v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void *)MEMORY[0x212BD94D4](a4);
  setupDeviceManagementCompletion = self->_setupDeviceManagementCompletion;
  self->_setupDeviceManagementCompletion = v7;

  pbb_devicemanagement_log();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "-[PBBridgeCompanionController tellWatchToConfigureDeviceManagementWithData:completion:]";
    v14 = 1024;
    v15 = v6 != 0;
    _os_log_impl(&dword_2113B6000, v9, OS_LOG_TYPE_DEFAULT, "%s -- configuration data: %{BOOL}d", buf, 0x12u);
  }

  v11 = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v11, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBBridgeCompanionController _sendRemoteCommandWithMessageID:withArguments:](self, "_sendRemoteCommandWithMessageID:withArguments:", 34, v10);

}

- (void)handleDeviceManagementResponse:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  PBBProtoDeviceManagementSetupResponse *v8;
  void *v9;
  PBBProtoDeviceManagementSetupResponse *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void (**setupDeviceManagementCompletion)(id, uint64_t, void *);
  id v17;
  id v18;

  v4 = a3;
  v5 = objc_msgSend(v4, "type");
  objc_msgSend(v4, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fromID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = -[PBBridgeCompanionController shouldHandleMessageType:fromId:](self, "shouldHandleMessageType:fromId:", v5, v7);

  if ((_DWORD)v5)
  {
    v8 = [PBBProtoDeviceManagementSetupResponse alloc];
    objc_msgSend(v4, "data");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PBBProtoDeviceManagementSetupResponse initWithData:](v8, "initWithData:", v9);

    v11 = -[PBBProtoDeviceManagementSetupResponse success](v10, "success");
    -[PBBProtoDeviceManagementSetupResponse error](v10, "error");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v18 = 0;
      objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v12, &v18);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v18;
      if (v14)
      {
        pbb_devicemanagement_log();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          -[PBBridgeCompanionController handleDeviceManagementResponse:].cold.1();

      }
    }
    else
    {
      v13 = 0;
    }
    setupDeviceManagementCompletion = (void (**)(id, uint64_t, void *))self->_setupDeviceManagementCompletion;
    if (setupDeviceManagementCompletion)
    {
      setupDeviceManagementCompletion[2](setupDeviceManagementCompletion, v11, v13);
      v17 = self->_setupDeviceManagementCompletion;
      self->_setupDeviceManagementCompletion = 0;

    }
  }

}

- (void)checkApplicationInstallAllowedWithCompletion:(id)a3
{
  void *v4;
  id applicationInstallAllowedCompletion;

  v4 = (void *)MEMORY[0x212BD94D4](a3, a2);
  applicationInstallAllowedCompletion = self->_applicationInstallAllowedCompletion;
  self->_applicationInstallAllowedCompletion = v4;

  -[PBBridgeCompanionController _sendRemoteCommandWithMessageID:withArguments:](self, "_sendRemoteCommandWithMessageID:withArguments:", 35, MEMORY[0x24BDBD1A8]);
}

- (void)handleApplicationInstallRestrictionResponse:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  PBBProtoApplicationInstallRestrictionResponse *v7;
  void *v8;
  PBBProtoApplicationInstallRestrictionResponse *v9;
  uint64_t v10;
  void (**applicationInstallAllowedCompletion)(id, uint64_t);
  id v12;
  id v13;

  v13 = a3;
  v4 = objc_msgSend(v13, "type");
  objc_msgSend(v13, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fromID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = -[PBBridgeCompanionController shouldHandleMessageType:fromId:](self, "shouldHandleMessageType:fromId:", v4, v6);

  if ((_DWORD)v4)
  {
    v7 = [PBBProtoApplicationInstallRestrictionResponse alloc];
    objc_msgSend(v13, "data");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PBBProtoApplicationInstallRestrictionResponse initWithData:](v7, "initWithData:", v8);

    v10 = -[PBBProtoApplicationInstallRestrictionResponse allowed](v9, "allowed");
    applicationInstallAllowedCompletion = (void (**)(id, uint64_t))self->_applicationInstallAllowedCompletion;
    if (applicationInstallAllowedCompletion)
    {
      applicationInstallAllowedCompletion[2](applicationInstallAllowedCompletion, v10);
      v12 = self->_applicationInstallAllowedCompletion;
      self->_applicationInstallAllowedCompletion = 0;

    }
  }

}

- (void)tellGizmoToUpdateNanoRegistryToNormalState
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  pbb_setupflow_log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[PBBridgeCompanionController tellGizmoToUpdateNanoRegistryToNormalState]";
    _os_log_impl(&dword_2113B6000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  -[PBBridgeCompanionController _sendRemoteCommandWithMessageID:withArguments:](self, "_sendRemoteCommandWithMessageID:withArguments:", 36, 0);
}

- (RUIStyle)remoteUIStyle
{
  return self->_remoteUIStyle;
}

- (RUILoaderDelegate)ruiDelegate
{
  return (RUILoaderDelegate *)objc_loadWeakRetained((id *)&self->_ruiDelegate);
}

- (void)setRuiDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_ruiDelegate, a3);
}

- (PBBridgeConnectionDelegate)delegate
{
  return (PBBridgeConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSURLConnection)activationConnection
{
  return self->_activationConnection;
}

- (void)setActivationConnection:(id)a3
{
  objc_storeStrong((id *)&self->_activationConnection, a3);
}

- (NSMutableURLRequest)activationRequest
{
  return self->_activationRequest;
}

- (void)setActivationRequest:(id)a3
{
  objc_storeStrong((id *)&self->_activationRequest, a3);
}

- (NSMutableData)activationData
{
  return self->_activationData;
}

- (void)setActivationData:(id)a3
{
  objc_storeStrong((id *)&self->_activationData, a3);
}

- (RUILoader)ruiLoader
{
  return self->_ruiLoader;
}

- (void)setRuiLoader:(id)a3
{
  objc_storeStrong((id *)&self->_ruiLoader, a3);
}

- (NSString)contentType
{
  return self->_contentType;
}

- (void)setContentType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSDictionary)allHeaders
{
  return self->_allHeaders;
}

- (void)setAllHeaders:(id)a3
{
  objc_storeStrong((id *)&self->_allHeaders, a3);
}

- (BOOL)nonSilentActivation
{
  return self->_nonSilentActivation;
}

- (void)setNonSilentActivation:(BOOL)a3
{
  self->_nonSilentActivation = a3;
}

- (BOOL)connectionFailed
{
  return self->_connectionFailed;
}

- (void)setConnectionFailed:(BOOL)a3
{
  self->_connectionFailed = a3;
}

- (BOOL)awaitingCustomResponse
{
  return self->_awaitingCustomResponse;
}

- (void)setAwaitingCustomResponse:(BOOL)a3
{
  self->_awaitingCustomResponse = a3;
}

- (int)activationState
{
  return self->_activationState;
}

- (void)setActivationState:(int)a3
{
  self->_activationState = a3;
}

- (BOOL)isEstablishingPairing
{
  return self->_isEstablishingPairing;
}

- (void)setIsEstablishingPairing:(BOOL)a3
{
  self->_isEstablishingPairing = a3;
}

- (unsigned)granularActivationState
{
  return self->_granularActivationState;
}

- (void)setGranularActivationState:(unsigned __int16)a3
{
  self->_granularActivationState = a3;
}

- (OS_dispatch_source)activationTimeout
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

- (BOOL)allowAnyHTTPSCertificate
{
  return self->_allowAnyHTTPSCertificate;
}

- (void)setAllowAnyHTTPSCertificate:(BOOL)a3
{
  self->_allowAnyHTTPSCertificate = a3;
}

- (NSString)remoteActivationUserAgent
{
  return self->_remoteActivationUserAgent;
}

- (void)setRemoteActivationUserAgent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (id)lockedOnAnimationCompletion
{
  return self->_lockedOnAnimationCompletion;
}

- (void)setLockedOnAnimationCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (id)initialSyncPrepCompletion
{
  return self->_initialSyncPrepCompletion;
}

- (void)setInitialSyncPrepCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (id)languageLocaleCompletion
{
  return self->_languageLocaleCompletion;
}

- (void)setLanguageLocaleCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (id)prepareWatchForForcedSUCompletion
{
  return self->_prepareWatchForForcedSUCompletion;
}

- (void)setPrepareWatchForForcedSUCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (id)remoteAccountForDeviceCompletion
{
  return self->_remoteAccountForDeviceCompletion;
}

- (void)setRemoteAccountForDeviceCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 216);
}

- (id)tinkerCredentialsIngestedCompletion
{
  return self->_tinkerCredentialsIngestedCompletion;
}

- (void)setTinkerCredentialsIngestedCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (id)tinkerWiFiCredentialsIngestedCompletion
{
  return self->_tinkerWiFiCredentialsIngestedCompletion;
}

- (void)setTinkerWiFiCredentialsIngestedCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (id)buysOnWatchCredentialsIngestedCompletion
{
  return self->_buysOnWatchCredentialsIngestedCompletion;
}

- (void)setBuysOnWatchCredentialsIngestedCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (id)setupDeviceManagementCompletion
{
  return self->_setupDeviceManagementCompletion;
}

- (void)setSetupDeviceManagementCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (id)applicationInstallAllowedCompletion
{
  return self->_applicationInstallAllowedCompletion;
}

- (void)setApplicationInstallAllowedCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (BOOL)sentSessionRequest
{
  return self->_sentSessionRequest;
}

- (void)setSentSessionRequest:(BOOL)a3
{
  self->_sentSessionRequest = a3;
}

- (BOOL)sentActivationRequest
{
  return self->_sentActivationRequest;
}

- (void)setSentActivationRequest:(BOOL)a3
{
  self->_sentActivationRequest = a3;
}

- (id)appViewListImageCompletion
{
  return self->_appViewListImageCompletion;
}

- (void)setAppViewListImageCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (BOOL)passcodeSet
{
  return self->_passcodeSet;
}

- (void)setPasscodeSet:(BOOL)a3
{
  self->_passcodeSet = a3;
}

- (BOOL)selectedPairedUnlock
{
  return self->_selectedPairedUnlock;
}

- (void)setSelectedPairedUnlock:(BOOL)a3
{
  self->_selectedPairedUnlock = a3;
}

- (int)activationRetries
{
  return self->_activationRetries;
}

- (void)setActivationRetries:(int)a3
{
  self->_activationRetries = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_appViewListImageCompletion, 0);
  objc_storeStrong(&self->_applicationInstallAllowedCompletion, 0);
  objc_storeStrong(&self->_setupDeviceManagementCompletion, 0);
  objc_storeStrong(&self->_buysOnWatchCredentialsIngestedCompletion, 0);
  objc_storeStrong(&self->_tinkerWiFiCredentialsIngestedCompletion, 0);
  objc_storeStrong(&self->_tinkerCredentialsIngestedCompletion, 0);
  objc_storeStrong(&self->_remoteAccountForDeviceCompletion, 0);
  objc_storeStrong(&self->_prepareWatchForForcedSUCompletion, 0);
  objc_storeStrong(&self->_languageLocaleCompletion, 0);
  objc_storeStrong(&self->_initialSyncPrepCompletion, 0);
  objc_storeStrong(&self->_lockedOnAnimationCompletion, 0);
  objc_storeStrong((id *)&self->_remoteActivationUserAgent, 0);
  objc_storeStrong((id *)&self->_internalLastSendMessageID, 0);
  objc_storeStrong((id *)&self->_activationTimeout, 0);
  objc_storeStrong((id *)&self->_allHeaders, 0);
  objc_storeStrong((id *)&self->_contentType, 0);
  objc_storeStrong((id *)&self->_ruiLoader, 0);
  objc_storeStrong((id *)&self->_activationData, 0);
  objc_storeStrong((id *)&self->_activationRequest, 0);
  objc_storeStrong((id *)&self->_activationConnection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_ruiDelegate);
  objc_storeStrong((id *)&self->_remoteUIStyle, 0);
  objc_storeStrong((id *)&self->_timeoutTrackerQueue, 0);
}

- (void)tellWatchLanguagesAndLocaleSupportingTermOfAddress:withCompletion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_2113B6000, v0, v1, "ERROR! archivedPreferences was nil!!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)tellWatchLanguagesAndLocaleSupportingTermOfAddress:withCompletion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_2113B6000, v0, v1, "ERROR! regionIdentifier was nil!!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)tellWatchLanguagesAndLocaleSupportingTermOfAddress:withCompletion:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_2113B6000, v0, v1, "ERROR! languages was nil!!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)gizmoActivationFailed:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2113B6000, v0, v1, "Gizmo Failed to Activate: (%@)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)sendProxyActivationRequest:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_2113B6000, a1, a3, "%s: __SkipReachabilityChecks override.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)sendProxyActivationRequest:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_2113B6000, v0, v1, "Activation Request was nil.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)sendProxyActivationRequest:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_2113B6000, v0, v1, "Decoded request from Gizmo is nil.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)sendProxyActivationWithCustomRequest:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_2113B6000, v0, v1, "Activation Custom Request was nil.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)loader:didFailWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2113B6000, v0, v1, "%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)connection:didFailWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2113B6000, v0, v1, "ActivationStateFailure %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)connection:didFailWithError:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_2113B6000, v0, v1, "Cloud Config State FAIL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)connection:(uint64_t)a3 didFailWithError:(uint64_t)a4 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_2113B6000, a2, a3, "%d %s -- %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)connection:(uint64_t)a1 willSendRequest:(uint64_t)a2 redirectResponse:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a2 + 120);
  v4[0] = 67109890;
  v4[1] = 1218;
  v5 = 2080;
  v6 = "-[PBBridgeCompanionController connection:willSendRequest:redirectResponse:]";
  v7 = 2112;
  v8 = a1;
  v9 = 2112;
  v10 = v3;
  _os_log_error_impl(&dword_2113B6000, log, OS_LOG_TYPE_ERROR, "%d %s -- %@ %@", (uint8_t *)v4, 0x26u);
  OUTLINED_FUNCTION_5();
}

- (void)connection:(int)a1 didReceiveResponse:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_2113B6000, a2, OS_LOG_TYPE_ERROR, "Receive Failure Response: %d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_1();
}

- (void)gizmoFailedToCreatePasscode:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_2113B6000, a2, a3, "%d %s (Failed with Error: %ld)", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

- (void)handleRemoteActivationDetails:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_2113B6000, v0, v1, "ACTIVATION ERROR! %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)handleRemoteActivationDetails:(NSObject *)a3 .cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = 136315650;
  v6 = "-[PBBridgeCompanionController handleRemoteActivationDetails:]";
  v7 = 2114;
  v8 = a1;
  v9 = 2048;
  v10 = objc_msgSend(a2, "length");
  OUTLINED_FUNCTION_11(&dword_2113B6000, a3, v4, "%s Error (%{public}@) decoding request (%ld bytes)", (uint8_t *)&v5);
}

- (void)tinkerWatchIngestedCredentials:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_8(&dword_2113B6000, v0, v1, " %s: Error unarchiving incoming error: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)handleDeviceManagementResponse:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_8(&dword_2113B6000, v0, v1, " %s: Error unarchiving device management information: %{public}@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
