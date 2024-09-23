@implementation TUCall

- (TUCall)init
{
  void *v3;
  void *v4;
  TUCall *v5;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[TUCall initWithUniqueProxyIdentifier:](self, "initWithUniqueProxyIdentifier:", v4);

  return v5;
}

- (TUCall)initWithNotificationCenter:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  TUCall *v7;

  v4 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[TUCall initWithUniqueProxyIdentifier:endpointOnCurrentDevice:notificationCenter:](self, "initWithUniqueProxyIdentifier:endpointOnCurrentDevice:notificationCenter:", v6, 1, v4);

  return v7;
}

- (TUCall)initWithUniqueProxyIdentifier:(id)a3
{
  return -[TUCall initWithUniqueProxyIdentifier:endpointOnCurrentDevice:](self, "initWithUniqueProxyIdentifier:endpointOnCurrentDevice:", a3, 1);
}

- (TUCall)initWithCall:(id)a3
{
  id v4;
  void *v5;
  TUCall *v6;

  v4 = a3;
  objc_msgSend(v4, "uniqueProxyIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TUCall initWithUniqueProxyIdentifier:](self, "initWithUniqueProxyIdentifier:", v5);

  if (v6)
    -[TUCall updateWithCall:](v6, "updateWithCall:", v4);

  return v6;
}

- (TUCall)initWithUniqueProxyIdentifier:(id)a3 endpointOnCurrentDevice:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  void *v8;
  TUCall *v9;

  v4 = a4;
  v6 = (void *)MEMORY[0x1E0CB37D0];
  v7 = a3;
  objc_msgSend(v6, "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[TUCall initWithUniqueProxyIdentifier:endpointOnCurrentDevice:notificationCenter:](self, "initWithUniqueProxyIdentifier:endpointOnCurrentDevice:notificationCenter:", v7, v4, v8);

  return v9;
}

- (TUCall)initWithUniqueProxyIdentifier:(id)a3 endpointOnCurrentDevice:(BOOL)a4 notificationCenter:(id)a5
{
  id v9;
  id v10;
  TUCall *v11;
  TUFeatureFlags *v12;
  TUFeatureFlags *featureFlags;
  TUCallNotificationManager *v14;
  TUCallNotificationManager *callNotificationManager;
  TUCallModel *v16;
  TUCallModel *model;
  uint64_t v18;
  NSDate *dateCreated;
  TUVideoCallAttributes *v20;
  TUVideoCallAttributes *videoCallAttributes;
  void *v22;
  id contactsDataSourceCreationBlock;
  id clarityEnabledBlock;
  id lowPowerModeEnabledBlock;
  _QWORD v27[4];
  id v28;
  id location;
  objc_super v30;

  v9 = a3;
  v10 = a5;
  v30.receiver = self;
  v30.super_class = (Class)TUCall;
  v11 = -[TUCall init](&v30, sel_init);
  if (v11)
  {
    objc_msgSend(v10, "addObserver:selector:name:object:", v11, sel__handleStatusChange, CFSTR("TUCallCenterCallStatusChangedInternalNotification"), v11);
    v12 = objc_alloc_init(TUFeatureFlags);
    featureFlags = v11->_featureFlags;
    v11->_featureFlags = v12;

    v11->_lockdownModeEnabled = TULockdownModeEnabled();
    v14 = -[TUCallNotificationManager initWithNotificationCenter:]([TUCallNotificationManager alloc], "initWithNotificationCenter:", v10);
    callNotificationManager = v11->_callNotificationManager;
    v11->_callNotificationManager = v14;

    v16 = objc_alloc_init(TUCallModel);
    model = v11->_model;
    v11->_model = v16;

    v11->_shouldSuppressRingtone = 1;
    v11->_supportsRecents = 1;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v18 = objc_claimAutoreleasedReturnValue();
    dateCreated = v11->_dateCreated;
    v11->_dateCreated = (NSDate *)v18;

    objc_storeStrong((id *)&v11->_uniqueProxyIdentifier, a3);
    v11->_endpointOnCurrentDevice = a4;
    v20 = objc_alloc_init(TUVideoCallAttributes);
    videoCallAttributes = v11->_videoCallAttributes;
    v11->_videoCallAttributes = v20;

    objc_initWeak(&location, v11);
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __83__TUCall_initWithUniqueProxyIdentifier_endpointOnCurrentDevice_notificationCenter___block_invoke;
    v27[3] = &unk_1E38A4218;
    objc_copyWeak(&v28, &location);
    v22 = _Block_copy(v27);
    contactsDataSourceCreationBlock = v11->_contactsDataSourceCreationBlock;
    v11->_contactsDataSourceCreationBlock = v22;

    clarityEnabledBlock = v11->_clarityEnabledBlock;
    v11->_clarityEnabledBlock = &__block_literal_global_52;

    lowPowerModeEnabledBlock = v11->_lowPowerModeEnabledBlock;
    v11->_lowPowerModeEnabledBlock = &__block_literal_global_163;

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }

  return v11;
}

id __83__TUCall_initWithUniqueProxyIdentifier_endpointOnCurrentDevice_notificationCenter___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0C972A0], "tu_contactStoreConfigurationForCall:", WeakRetained);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setIncludeLocalContacts:", 1);
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97298]), "initWithConfiguration:", v2);

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

uint64_t __83__TUCall_initWithUniqueProxyIdentifier_endpointOnCurrentDevice_notificationCenter___block_invoke_3()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isLowPowerModeEnabled");

  return v1;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[TUCall notificationCenter](self, "notificationCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)TUCall;
  -[TUCall dealloc](&v4, sel_dealloc);
}

- (NSNotificationCenter)notificationCenter
{
  void *v2;
  void *v3;

  -[TUCall callNotificationManager](self, "callNotificationManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "notificationCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNotificationCenter *)v3;
}

- (id)description
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

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCall provider](self, "provider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" p=%@"), v5);

  -[TUCall announceProviderIdentifier](self, "announceProviderIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" aPI=%@"), v6);

  -[TUCall recordingSession](self, "recordingSession");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" crs=%@"), v7);

  TUStringForCallService(-[TUCall service](self, "service"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" svc=%@"), v8);

  -[TUCall handle](self, "handle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" hdl=%@"), v9);

  -[TUCall remoteParticipantHandles](self, "remoteParticipantHandles");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" hdls=%@"), v10);

  -[TUCall isoCountryCode](self, "isoCountryCode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" isoCC=%@"), v11);

  TUStringForCallStatus(-[TUCall status](self, "status"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" stat=%@"), v12);

  objc_msgSend(v3, "appendFormat:", CFSTR(" tStat=%d"), -[TUCall transitionStatus](self, "transitionStatus"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" dR=%d"), -[TUCall disconnectedReason](self, "disconnectedReason"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" fR=%d"), -[TUCall filteredOutReason](self, "filteredOutReason"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" supportsR=%d"), -[TUCall supportsRecents](self, "supportsRecents"));
  -[TUCall uniqueProxyIdentifier](self, "uniqueProxyIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" uPI=%@"), v13);

  -[TUCall callGroupUUID](self, "callGroupUUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" grp=%@"), v14);

  -[TUCall localSenderIdentityUUID](self, "localSenderIdentityUUID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" lSIUUID=%@"), v15);

  -[TUCall localSenderIdentityAccountUUID](self, "localSenderIdentityAccountUUID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" lSIAccountUUID=%@"), v16);

  objc_msgSend(v3, "appendFormat:", CFSTR(" hosted=%d"), -[TUCall isHostedOnCurrentDevice](self, "isHostedOnCurrentDevice"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" endpt=%d"), -[TUCall isEndpointOnCurrentDevice](self, "isEndpointOnCurrentDevice"));
  -[TUCall callerNameFromNetwork](self, "callerNameFromNetwork");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" callerNFN=%@"), v17);

  -[TUCall sourceIdentifier](self, "sourceIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" srcID=%@"), v18);

  -[TUCall audioCategory](self, "audioCategory");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" aC=%@"), v19);

  -[TUCall audioMode](self, "audioMode");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" aM=%@"), v20);

  objc_msgSend(v3, "appendFormat:", CFSTR(" iUB=%d"), -[TUCall isUsingBaseband](self, "isUsingBaseband"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" vm=%d"), -[TUCall isVoicemail](self, "isVoicemail"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" connStat=%d%d"), -[TUCall isConnecting](self, "isConnecting"), -[TUCall isConnected](self, "isConnected"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" nMICS=%d"), -[TUCall needsManualInCallSounds](self, "needsManualInCallSounds"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" sR=%ld"), -[TUCall soundRegion](self, "soundRegion"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" iSA=%d"), -[TUCall isSendingAudio](self, "isSendingAudio"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" iSV=%d"), -[TUCall isSendingVideo](self, "isSendingVideo"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" iSS=%d"), -[TUCall isSharingScreen](self, "isSharingScreen"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" wHM=%d"), -[TUCall wantsHoldMusic](self, "wantsHoldMusic"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" hSI=%d"), -[TUCall hasSentInvitation](self, "hasSentInvitation"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" vST=%ld"), -[TUCall videoStreamToken](self, "videoStreamToken"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" iapST=%ld"), -[TUCall inputAudioPowerSpectrumToken](self, "inputAudioPowerSpectrumToken"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" oapST=%ld"), -[TUCall outputAudioPowerSpectrumToken](self, "outputAudioPowerSpectrumToken"));
  -[TUCall tokens](self, "tokens");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[TUCall tokens](self, "tokens");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" tokens=%@"), v22);

  }
  -[TUCall localMemberHandleValue](self, "localMemberHandleValue");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[TUCall localMemberHandleValue](self, "localMemberHandleValue");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR(" localMemberHandleValue=%@"), v24);

  }
  -[TUCall videoCallAttributes](self, "videoCallAttributes");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" vCA=%@"), v25);

  -[TUCall screenShareAttributes](self, "screenShareAttributes");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" ssA=%@"), v26);

  objc_msgSend(v3, "appendFormat:", CFSTR(" ssI=%ld"), -[TUCall screenSharingIntention](self, "screenSharingIntention"));
  -[TUCall model](self, "model");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" model=%@"), v27);

  objc_msgSend(v3, "appendFormat:", CFSTR(" dtmfU=%d"), -[TUCall supportsDTMFUpdates](self, "supportsDTMFUpdates"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" em=%d"), -[TUCall isEmergency](self, "isEmergency"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" emvs=%d"), -[TUCall hasEmergencyVideoStream](self, "hasEmergencyVideoStream"));
  -[TUCall emergencyMediaItems](self, "emergencyMediaItems");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" emmi=%@"), v28);

  objc_msgSend(v3, "appendFormat:", CFSTR(" iFE=%d"), -[TUCall isFailureExpected](self, "isFailureExpected"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" sos=%d"), -[TUCall isSOS](self, "isSOS"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" sSR=%d"), -[TUCall shouldSuppressRingtone](self, "shouldSuppressRingtone"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" sSUI=%d"), -[TUCall shouldSuppressInCallUI](self, "shouldSuppressInCallUI"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" mX=%d"), -[TUCall isMutuallyExclusiveCall](self, "isMutuallyExclusiveCall"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" iUM=%d"), -[TUCall isUplinkMuted](self, "isUplinkMuted"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" iDM=%d"), -[TUCall isDownlinkMuted](self, "isDownlinkMuted"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" tty=%ld"), -[TUCall ttyType](self, "ttyType"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" ttyWV=%d"), -[TUCall supportsTTYWithVoice](self, "supportsTTYWithVoice"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" convo=%d"), -[TUCall isConversation](self, "isConversation"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" rUM=%d"), -[TUCall isRemoteUplinkMuted](self, "isRemoteUplinkMuted"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" ver=%ld"), -[TUCall verificationStatus](self, "verificationStatus"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" pri=%ld"), -[TUCall priority](self, "priority"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" oUI=%ld"), -[TUCall originatingUIType](self, "originatingUIType"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" lvmR=%ld"), -[TUCall liveVoicemailUnavailableReason](self, "liveVoicemailUnavailableReason"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" jConf=%ld"), -[TUCall junkConfidence](self, "junkConfidence"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" iCat=%ld"), -[TUCall identificationCategory](self, "identificationCategory"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" iKC=%d"), -[TUCall isKnownCaller](self, "isKnownCaller"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" JFL=%d"), -[TUCall joinedFromLink](self, "joinedFromLink"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" btAF=%ld"), -[TUCall bluetoothAudioFormat](self, "bluetoothAudioFormat"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" mVM=%d"), -[TUCall mixesVoiceWithMedia](self, "mixesVoiceWithMedia"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" sEF=%d"), -[TUCall supportsEmergencyFallback](self, "supportsEmergencyFallback"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" cs=%d"), -[TUCall isScreening](self, "isScreening"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" csUI=%d"), -[TUCall isScreeningDueToUserInteraction](self, "isScreeningDueToUserInteraction"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" ae=%d"), -[TUCall screeningAnnouncementHasFinished](self, "screeningAnnouncementHasFinished"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" hBR=%d"), -[TUCall hasBeenRedirected](self, "hasBeenRedirected"));
  -[TUCall providerContext](self, "providerContext");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" pCtx=%@"), v29);

  objc_msgSend(v3, "appendFormat:", CFSTR(" amst=%ld"), -[TUCall answeringMachineStreamToken](self, "answeringMachineStreamToken"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" lUHC=%d"), -[TUCall isLocalUserInHomeCountry](self, "isLocalUserInHomeCountry"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" iSCN=%d"), -[TUCall hasIdentifiedSpamInCallerName](self, "hasIdentifiedSpamInCallerName"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" reRing=%d"), -[TUCall isReRing](self, "isReRing"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" cST=%ld"), -[TUCall callSubType](self, "callSubType"));
  objc_msgSend(v3, "appendFormat:", CFSTR(" screenSharingType=%ld"), -[TUCall screenSharingType](self, "screenSharingType"));
  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

+ (int64_t)acceptableJunkConfidence
{
  return 1;
}

+ (int64_t)maxJunkConfidence
{
  return 3;
}

+ (BOOL)isJunkConfidenceLevelJunk:(int64_t)a3
{
  return +[TUCall acceptableJunkConfidence](TUCall, "acceptableJunkConfidence") < a3;
}

- (void)updateComparativeCall
{
  id v3;

  -[TUCall comparativeCall](self, "comparativeCall");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateWithCall:", self);

}

- (TUCallCenter)callCenter
{
  void *v2;
  void *v3;

  -[TUCall callServicesInterface](self, "callServicesInterface");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "callCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (TUCallCenter *)v3;
}

- (BOOL)isEmergency
{
  return 0;
}

- (BOOL)isFailureExpected
{
  return 0;
}

- (BOOL)supportsEmergencyFallback
{
  return 0;
}

- (BOOL)isSOS
{
  return 0;
}

- (BOOL)isVoicemail
{
  return 0;
}

- (BOOL)isUsingBaseband
{
  return 0;
}

- (BOOL)prefersExclusiveAccessToCellularNetwork
{
  return 0;
}

- (BOOL)isUplinkMuted
{
  return 0;
}

- (BOOL)isDownlinkMuted
{
  return 0;
}

- (BOOL)isVideo
{
  return 0;
}

- (BOOL)isThirdPartyVideo
{
  return 0;
}

- (BOOL)isOutgoing
{
  return 0;
}

- (BOOL)isBlocked
{
  return 0;
}

- (BOOL)isSendingAudio
{
  return 0;
}

- (BOOL)isSendingVideo
{
  return 0;
}

- (BOOL)isMediaStalled
{
  return 0;
}

- (BOOL)isVideoDegraded
{
  return 0;
}

- (BOOL)isVideoPaused
{
  return 0;
}

- (BOOL)isVideoMirrored
{
  return 0;
}

- (BOOL)requiresRemoteVideo
{
  return 0;
}

- (BOOL)supportsTTYWithVoice
{
  return 0;
}

- (BOOL)isRemoteUplinkMuted
{
  return 0;
}

- (BOOL)shouldSuppressInCallUI
{
  return 0;
}

- (BOOL)isMutuallyExclusiveCall
{
  return 0;
}

- (BOOL)wantsStagingArea
{
  return 0;
}

- (BOOL)isConversation
{
  return 0;
}

- (float)remoteMeterLevel
{
  return 0.0;
}

- (float)localMeterLevel
{
  return 0.0;
}

- (int64_t)videoStreamToken
{
  return 0;
}

- (int64_t)inputAudioPowerSpectrumToken
{
  return 0;
}

- (int64_t)outputAudioPowerSpectrumToken
{
  return 0;
}

- (BOOL)isReRing
{
  return 0;
}

- (void)_handleStatusChange
{
  -[TUCall resetProvisionalState](self, "resetProvisionalState");
  if (-[TUCall isOnHold](self, "isOnHold"))
    -[TUCall resetWantsHoldMusic](self, "resetWantsHoldMusic");
}

- (void)answerWithRequest:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[TUCall callNotificationManager](self, "callNotificationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __28__TUCall_answerWithRequest___block_invoke;
  v7[3] = &unk_1E38A1388;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "deferNotificationsUntilAfterPerformingBlock:", v7);

}

uint64_t __28__TUCall_answerWithRequest___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setTransitionStatus:", 1);
  objc_msgSend(*(id *)(a1 + 40), "sourceIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSourceIdentifier:", v2);

  objc_msgSend(*(id *)(a1 + 32), "setWantsHoldMusic:", objc_msgSend(*(id *)(a1 + 40), "wantsHoldMusic"));
  objc_msgSend(*(id *)(a1 + 32), "setScreening:", objc_msgSend(*(id *)(a1 + 40), "sendToScreening"));
  objc_msgSend(*(id *)(a1 + 32), "setScreeningDueToUserInteraction:", objc_msgSend(*(id *)(a1 + 40), "screeningDueToUserInteraction"));
  if (objc_msgSend(*(id *)(a1 + 40), "pauseVideoToStart"))
    objc_msgSend(*(id *)(a1 + 32), "setIsSendingVideo:", 0);
  if (objc_msgSend(*(id *)(a1 + 40), "behavior") == 4
    || (result = objc_msgSend(*(id *)(a1 + 40), "downgradeToAudio"), (_DWORD)result))
  {
    objc_msgSend(*(id *)(a1 + 32), "setIsSendingVideo:", 0);
    result = objc_msgSend(*(id *)(a1 + 32), "isConversation");
    if ((result & 1) == 0)
      return objc_msgSend(*(id *)(a1 + 32), "setVideo:", 0);
  }
  return result;
}

- (BOOL)supportsRecents
{
  void *v2;
  char v3;

  if (!self->_supportsRecents)
    return 0;
  -[TUCall provider](self, "provider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsRecents");

  return v3;
}

- (BOOL)isOnHold
{
  int64_t v3;

  v3 = -[TUCall provisionalHoldStatus](self, "provisionalHoldStatus");
  if (v3 != 1)
    LOBYTE(v3) = -[TUCall provisionalHoldStatus](self, "provisionalHoldStatus") != 2
              && -[TUCall status](self, "status") == 2;
  return v3;
}

- (void)setIsOnHold:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[TUCall callCenter](self, "callCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
    objc_msgSend(v5, "holdCall:", self);
  else
    objc_msgSend(v5, "unholdCall:", self);

}

- (void)hold
{
  -[TUCall setProvisionalHoldStatus:](self, "setProvisionalHoldStatus:", 1);
}

- (void)unhold
{
  -[TUCall setProvisionalHoldStatus:](self, "setProvisionalHoldStatus:", 2);
}

- (void)disconnectWithReason:(int)a3
{
  void *v5;
  _QWORD v6[5];
  int v7;

  -[TUCall callNotificationManager](self, "callNotificationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __31__TUCall_disconnectWithReason___block_invoke;
  v6[3] = &unk_1E38A2178;
  v6[4] = self;
  v7 = a3;
  objc_msgSend(v5, "deferNotificationsUntilAfterPerformingBlock:", v6);

}

uint64_t __31__TUCall_disconnectWithReason___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setTransitionStatus:", 5);
  result = objc_msgSend(*(id *)(a1 + 32), "disconnectedReason");
  if (!(_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "setDisconnectedReason:", *(unsigned int *)(a1 + 40));
  return result;
}

- (void)resetProvisionalState
{
  -[TUCall setProvisionalHoldStatus:](self, "setProvisionalHoldStatus:", 0);
}

- (NSString)hardPauseDigitsDisplayString
{
  void *v2;
  void *v3;

  -[TUCall hardPauseDigits](self, "hardPauseDigits");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  TUHardPauseDigitsDisplayString(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSUUID)uniqueProxyIdentifierUUID
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3A28]);
  -[TUCall uniqueProxyIdentifier](self, "uniqueProxyIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithUUIDString:", v4);

  return (NSUUID *)v5;
}

- (TUCallProvider)provider
{
  void *v2;
  void *v3;
  void *v4;

  -[TUCall callCenter](self, "callCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "providerManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "defaultProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (TUCallProvider *)v4;
}

- (int)service
{
  TUCall *v2;
  void *v3;

  v2 = self;
  -[TUCall provider](self, "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = +[TUCallProviderManager serviceForProvider:video:](TUCallProviderManager, "serviceForProvider:video:", v3, -[TUCall isVideo](v2, "isVideo"));

  return (int)v2;
}

- (BOOL)wasDeclined
{
  return -[TUCall disconnectedReason](self, "disconnectedReason") == 2
      || -[TUCall disconnectedReason](self, "disconnectedReason") == 3
      || -[TUCall disconnectedReason](self, "disconnectedReason") == 4;
}

- (double)startTime
{
  void *v2;
  double v3;
  double v4;

  -[TUCall dateConnected](self, "dateConnected");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceReferenceDate");
  v4 = v3;

  return v4;
}

- (BOOL)hasSentInvitation
{
  void *v2;
  BOOL v3;

  -[TUCall dateSentInvitation](self, "dateSentInvitation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isConnecting
{
  void *v2;
  BOOL v3;

  -[TUCall dateStartedConnecting](self, "dateStartedConnecting");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isConnected
{
  void *v2;
  BOOL v3;

  -[TUCall dateConnected](self, "dateConnected");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (BOOL)isActive
{
  return -[TUCall status](self, "status") == 3
      || -[TUCall status](self, "status") == 4
      || -[TUCall status](self, "status") == 1;
}

- (BOOL)isIncoming
{
  return !-[TUCall isOutgoing](self, "isOutgoing");
}

- (BOOL)isConferenced
{
  void *v3;
  void *v4;
  char v5;

  -[TUCall callGroupUUID](self, "callGroupUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[TUCall provider](self, "provider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isTelephonyProvider");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)resetWantsHoldMusic
{
  -[TUCall setWantsHoldMusic:](self, "setWantsHoldMusic:", 0);
}

- (void)suppressRingtone
{
  -[TUCall setShouldSuppressRingtone:](self, "setShouldSuppressRingtone:", 1);
}

- (void)suppressRingtoneDueToRemoteSuppression
{
  -[TUCall setRingtoneSuppressedRemotely:](self, "setRingtoneSuppressedRemotely:", 1);
  -[TUCall suppressRingtone](self, "suppressRingtone");
}

- (BOOL)needsManualInCallSounds
{
  return 1;
}

- (BOOL)isWiFiCall
{
  if (-[TUCall service](self, "service") == 1)
    return !-[TUCall isUsingBaseband](self, "isUsingBaseband");
  else
    return 0;
}

- (BOOL)isVoIPCall
{
  return !-[TUCall isUsingBaseband](self, "isUsingBaseband");
}

- (BOOL)isRTT
{
  return -[TUCall ttyType](self, "ttyType") - 1 <= 1
      && -[TUCall supportsTTYWithVoice](self, "supportsTTYWithVoice");
}

- (BOOL)isTTY
{
  if (-[TUCall ttyType](self, "ttyType") - 1 > 1)
    return 0;
  else
    return !-[TUCall supportsTTYWithVoice](self, "supportsTTYWithVoice");
}

- (BOOL)isRecording
{
  void *v3;
  void *v4;
  BOOL v5;

  -[TUCall recordingSession](self, "recordingSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[TUCall recordingSession](self, "recordingSession");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "recordingState") == 3;

  return v5;
}

- (int64_t)faceTimeTransportType
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;

  -[TUCall providerContext](self, "providerContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("TUCallFaceTimeTransportTypeKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return 0;
  -[TUCall providerContext](self, "providerContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("TUCallFaceTimeTransportTypeKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  return v7;
}

- (NSString)localizedHandoffRecipientDeviceCategory
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[TUCall providerContext](self, "providerContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("TUCallFaceTimeLocalizedHandoffRecipientDeviceCategoryKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[TUCall providerContext](self, "providerContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("TUCallFaceTimeLocalizedHandoffRecipientDeviceCategoryKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");

  }
  else
  {
    v7 = 0;
  }
  return (NSString *)v7;
}

- (NSNumber)handoffRecipientParticipant
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[TUCall providerContext](self, "providerContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("TUCallFaceTimeHandoffRecipientParticipantKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[TUCall providerContext](self, "providerContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("TUCallFaceTimeHandoffRecipientParticipantKey"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");

  }
  else
  {
    v7 = 0;
  }
  return (NSNumber *)v7;
}

- (int)ttyType
{
  return 0;
}

- (int64_t)bluetoothAudioFormat
{
  return 0;
}

- (TUDialRequest)dialRequestForRedial
{
  TUDialRequest *v3;
  void *v4;
  TUDialRequest *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;

  v3 = [TUDialRequest alloc];
  -[TUCall provider](self, "provider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[TUDialRequest initWithProvider:](v3, "initWithProvider:", v4);

  if (-[TUDialRequest service](v5, "service") != 1)
    goto LABEL_7;
  if (-[TUCall isVoicemail](self, "isVoicemail"))
  {
    v6 = 2;
  }
  else
  {
    if (!-[TUCall isEmergency](self, "isEmergency"))
      goto LABEL_7;
    v6 = 1;
  }
  -[TUDialRequest setDialType:](v5, "setDialType:", v6);
LABEL_7:
  -[TUCall handle](self, "handle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUDialRequest setHandle:](v5, "setHandle:", v7);

  -[TUCall contactIdentifiers](self, "contactIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUDialRequest setContactIdentifier:](v5, "setContactIdentifier:", v9);

  v10 = -[TUCall isVideo](self, "isVideo") || -[TUCall isThirdPartyVideo](self, "isThirdPartyVideo");
  -[TUDialRequest setVideo:](v5, "setVideo:", v10);
  -[TUDialRequest setSOS:](v5, "setSOS:", -[TUCall isSOS](self, "isSOS"));
  -[TUDialRequest setRedial:](v5, "setRedial:", 1);
  -[TUCall sourceIdentifier](self, "sourceIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUDialRequest setAudioSourceIdentifier:](v5, "setAudioSourceIdentifier:", v11);

  -[TUDialRequest setOriginatingUIType:](v5, "setOriginatingUIType:", 25);
  -[TUDialRequest setPerformDialAssist:](v5, "setPerformDialAssist:", 0);
  -[TUDialRequest setPerformLocalDialAssist:](v5, "setPerformLocalDialAssist:", 0);
  -[TUDialRequest setDialAssisted:](v5, "setDialAssisted:", -[TUCall wasDialAssisted](self, "wasDialAssisted"));
  -[TUDialRequest setTtyType:](v5, "setTtyType:", TUDialRequestTTYTypeForTUCallTTYType(-[TUCall ttyType](self, "ttyType")));
  -[TUCall localSenderIdentityUUID](self, "localSenderIdentityUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUDialRequest setLocalSenderIdentityUUID:](v5, "setLocalSenderIdentityUUID:", v12);

  -[TUCall localSenderIdentityAccountUUID](self, "localSenderIdentityAccountUUID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUDialRequest setLocalSenderIdentityAccountUUID:](v5, "setLocalSenderIdentityAccountUUID:", v13);

  if (-[TUDialRequest dialType](v5, "dialType") == 1)
  {
    -[TUDialRequest validityErrorForEmergencyCall](v5, "validityErrorForEmergencyCall");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      TUDefaultLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        -[TUCall dialRequestForRedial].cold.1(v5, v15);

      -[TUDialRequest setDialType:](v5, "setDialType:", 0);
    }
  }
  return v5;
}

- (NSSet)remoteParticipantHandles
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[TUCall handle](self, "handle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C99E60];
  if (v3)
  {
    -[TUCall handle](self, "handle");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWithObject:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSSet *)v6;
}

- (NSString)announceProviderIdentifier
{
  return 0;
}

- (NSString)destinationID
{
  void *v2;
  void *v3;

  -[TUCall handle](self, "handle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)callerNameFromNetwork
{
  return 0;
}

- (BOOL)hasBeenRedirected
{
  return 0;
}

- (TUHandle)handle
{
  return 0;
}

- (NSString)isoCountryCode
{
  return 0;
}

- (BOOL)shouldDisplayLocationIfAvailable
{
  return -[TUCall service](self, "service") == 1;
}

- (BOOL)isHostedOnCurrentDevice
{
  return 1;
}

- (NSUUID)callGroupUUID
{
  return 0;
}

- (TUSenderIdentity)localSenderIdentity
{
  void *v3;
  void *v4;
  void *v5;

  -[TUCall localSenderIdentityAccountUUID](self, "localSenderIdentityAccountUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[TUCall provider](self, "provider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "senderIdentityForAccountUUID:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return (TUSenderIdentity *)v5;
}

- (NSUUID)localSenderIdentityUUID
{
  return 0;
}

- (NSUUID)localSenderIdentityAccountUUID
{
  return 0;
}

- (BOOL)isEqualToCall:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[TUCall uniqueProxyIdentifier](self, "uniqueProxyIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uniqueProxyIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToString:", v6);
  return (char)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && -[TUCall isEqualToCall:](self, "isEqualToCall:", v4);

  return v5;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[TUCall uniqueProxyIdentifier](self, "uniqueProxyIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (double)callDuration
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;

  -[TUCall dateScreeningEnded](self, "dateScreeningEnded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[TUCall dateConnected](self, "dateConnected");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
      return 0.0;
  }
  -[TUCall dateEnded](self, "dateEnded");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[TUCall dateEnded](self, "dateEnded");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timeIntervalSinceDate:", v3);
    v7 = v6;

  }
  else
  {
    objc_msgSend(v3, "timeIntervalSinceNow");
    v7 = -v8;
  }

  return v7;
}

- (NSString)callDurationString
{
  double v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  -[TUCall callDuration](self, "callDuration");
  if (v2 == 0.0)
    return (NSString *)0;
  v3 = vcvtmd_s64_f64(v2);
  if ((int)v3 < 1)
  {
    v5 = 0;
    v4 = 0;
  }
  else
  {
    v4 = v3 % 0xE10 / 0x3C;
    if (v3 > 0xE0F)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", CFSTR("%02d:%02d:%02d"), v3 / 0xE10uLL, v4, v3 % 0xE10 % 0x3C);
      return (NSString *)(id)objc_claimAutoreleasedReturnValue();
    }
    v5 = v3 % 0xE10 % 0x3C;
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", CFSTR("%02d:%02d"), v4, v5, v7);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSString)reminderString
{
  void *v3;
  void *v4;
  const __CFString *v5;
  int v6;
  void *v7;

  if (-[TUCall isVideo](self, "isVideo"))
  {
    TUBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    v5 = CFSTR("FACETIME_REMINDER");
  }
  else
  {
    v6 = -[TUCall service](self, "service");
    TUBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v6 == 1)
      v5 = CFSTR("TELEPHONY_REMINDER");
    else
      v5 = CFSTR("FACETIME_AUDIO_REMINDER");
  }
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_1E38A53C8, CFSTR("TelephonyUtilities"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (int)status
{
  int v3;
  int v4;

  v3 = -[TUCall callStatus](self, "callStatus");
  v4 = -[TUCall transitionStatus](self, "transitionStatus");
  if (!-[TUCall isPTT](self, "isPTT") && (v3 <= 4 && v4 == 5 || v3 == 4 && v4 == 1))
    return v4;
  return v3;
}

- (int)callStatus
{
  return 0;
}

- (BOOL)isReceivingTransmission
{
  return 1;
}

- (BOOL)isSendingTransmission
{
  return 1;
}

- (BOOL)statusIsProvisional
{
  return -[TUCall provisionalHoldStatus](self, "provisionalHoldStatus") != 0;
}

- (BOOL)isJunk
{
  int v3;

  v3 = objc_msgSend((id)objc_opt_class(), "isJunkConfidenceLevelJunk:", -[TUCall junkConfidence](self, "junkConfidence"));
  if (v3)
    LOBYTE(v3) = !-[TUCall isKnownCaller](self, "isKnownCaller");
  return v3;
}

- (BOOL)isFromSiri
{
  void *v2;
  char v3;

  -[TUCall sourceIdentifier](self, "sourceIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqual:", CFSTR("TUCallSourceIdentifierHeySiri"));

  return v3;
}

- (BOOL)supportsSimultaneousVoiceAndData
{
  void *v3;
  void *v4;
  BOOL v5;

  -[TUCall provider](self, "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isTelephonyProvider"))
  {
    -[TUCall localSenderIdentityUUID](self, "localSenderIdentityUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = +[TUCallCapabilities isSimultaneousVoiceAndDataSupportedForSIMWithUUID:](TUCallCapabilities, "isSimultaneousVoiceAndDataSupportedForSIMWithUUID:", v4);

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (BOOL)shouldPlayDTMFTone
{
  return -[TUCall status](self, "status") == 3 || -[TUCall status](self, "status") == 1;
}

- (BOOL)supportsDTMFTones
{
  void *v2;
  char v3;

  -[TUCall model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsDTMF");

  return v3;
}

- (NSString)audioCategory
{
  return 0;
}

- (NSString)audioMode
{
  return 0;
}

- (BOOL)setMuted:(BOOL)a3
{
  -[TUCall setUplinkMuted:](self, "setUplinkMuted:", a3);
  return 1;
}

- (NSData)localFrequency
{
  return 0;
}

- (NSData)remoteFrequency
{
  return 0;
}

- (TUCallDisplayContext)displayContext
{
  return 0;
}

- (NSString)contactIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[TUCall displayContext](self, "displayContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contactIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (NSArray)contactIdentifiers
{
  void *v2;
  void *v3;

  -[TUCall displayContext](self, "displayContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contactIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSString)displayName
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _WORD v9[2];

  -[TUCall displayContext](self, "displayContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "length"))
  {
    qmemcpy(v9, ", * ", sizeof(v9));
    v4 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", &v9[1], 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCharacters:length:", v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@%@%@"), v5, v3, v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v7;
  }
  return (NSString *)v3;
}

- (NSString)displayFirstName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  -[TUCall displayContext](self, "displayContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "personNameComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "givenName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[TUCall displayContext](self, "displayContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "name");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v7;
}

- (NSString)suggestedDisplayName
{
  void *v2;
  void *v3;

  -[TUCall displayContext](self, "displayContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "suggestedName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)localizedLabel
{
  void *v2;
  void *v3;

  -[TUCall displayContext](self, "displayContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)callDirectoryName
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[TUCall displayContext](self, "displayContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "callDirectoryLocalizedExtensionContainingAppName");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[TUCall displayContext](self, "displayContext");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "callDirectoryLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v12 = 0;
      return (NSString *)v12;
    }
    v8 = (void *)MEMORY[0x1E0CB3940];
    -[TUCall displayContext](self, "displayContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "callDirectoryLocalizedExtensionContainingAppName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUCall displayContext](self, "displayContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "callDirectoryLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("%@: %@"), v9, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = 0;
  }

  return (NSString *)v12;
}

- (int64_t)callDirectoryIdentityType
{
  void *v2;
  int64_t v3;

  -[TUCall displayContext](self, "displayContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "callDirectoryIdentityType");

  return v3;
}

- (NSString)companyName
{
  void *v2;
  void *v3;

  -[TUCall displayContext](self, "displayContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "companyName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)companyDepartment
{
  void *v2;
  void *v3;

  -[TUCall displayContext](self, "displayContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "companyDepartment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSURL)imageURL
{
  void *v3;
  void *v4;

  if (-[TUCall isPTT](self, "isPTT"))
  {
    -[TUCall channelImageURL](self, "channelImageURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[TUCall displayContext](self, "displayContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "companyLogoURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSURL *)v3;
}

- (int)abUID
{
  void *v2;
  int v3;

  -[TUCall displayContext](self, "displayContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "legacyAddressBookIdentifier");

  return v3;
}

- (int)callRelaySupport
{
  return 0;
}

- (BOOL)hasRelaySupport:(int)a3
{
  return -[TUCall callRelaySupport](self, "callRelaySupport") >= a3;
}

- (NSDictionary)endedReasonUserInfo
{
  return 0;
}

+ (id)_supplementalDialTelephonyCallStringForLocString:(id)a3 destination:(id)a4 isPhoneNumber:(BOOL)a5 includeFaceTimeAudio:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v6 = a6;
  v7 = a5;
  v9 = a3;
  v10 = a4;
  if (+[TUCallCapabilities supportsTelephonyCalls](TUCallCapabilities, "supportsTelephonyCalls")
    && !+[TUCallCapabilities supportsPrimaryCalling](TUCallCapabilities, "supportsPrimaryCalling"))
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      if (v7)
        v14 = CFSTR("_TO_NUMBER_%@");
      else
        v14 = CFSTR("_TO_CONTACT_%@");
      objc_msgSend(v12, "appendString:", v14);
      objc_msgSend(v13, "addObject:", v10);
    }
    if (+[TUCallCapabilities isDirectTelephonyCallingCurrentlyAvailable](TUCallCapabilities, "isDirectTelephonyCallingCurrentlyAvailable"))
    {
      v15 = CFSTR("_CARRIER");
    }
    else
    {
      if (!+[TUCallCapabilities areRelayCallingFeaturesEnabled](TUCallCapabilities, "areRelayCallingFeaturesEnabled"))goto LABEL_14;
      v15 = CFSTR("_RELAY");
    }
    objc_msgSend(v12, "appendString:", v15);
LABEL_14:
    if (v6)
      objc_msgSend(v12, "appendString:", CFSTR("_FTA"));
    if (objc_msgSend(v13, "count") == 1)
    {
      v16 = (void *)MEMORY[0x1E0CB3940];
      TUBundle();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      TUStringKeyForPlatform((uint64_t)v12);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringForKey:value:table:", v18, &stru_1E38A53C8, CFSTR("TelephonyUtilities"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndex:", 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", v19, v20);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      if (objc_msgSend(v13, "count"))
      {
        v11 = 0;
LABEL_22:

        goto LABEL_23;
      }
      TUBundle();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      TUStringKeyForPlatform((uint64_t)v12);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringForKey:value:table:", v18, &stru_1E38A53C8, CFSTR("TelephonyUtilities"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_22;
  }
  v11 = 0;
LABEL_23:

  return v11;
}

+ (id)supplementalDialTelephonyCallStringForDestination:(id)a3 isPhoneNumber:(BOOL)a4
{
  return (id)objc_msgSend(a1, "_supplementalDialTelephonyCallStringForLocString:destination:isPhoneNumber:includeFaceTimeAudio:", CFSTR("DIAL_CALL"), a3, a4, 0);
}

+ (id)supplementalDialTelephonyCallString
{
  return (id)objc_msgSend(a1, "_supplementalDialTelephonyCallStringForLocString:destination:isPhoneNumber:includeFaceTimeAudio:", CFSTR("DIAL_CALL"), 0, 0, 0);
}

+ (id)faceTimeSupplementalDialTelephonyCallStringIncludingFTA:(BOOL)a3
{
  return (id)objc_msgSend(a1, "_supplementalDialTelephonyCallStringForLocString:destination:isPhoneNumber:includeFaceTimeAudio:", CFSTR("DIAL_CALL_FACETIME"), 0, 0, a3);
}

- (id)serviceDisplayString
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v12;
  const __CFString *v13;
  void *v14;

  -[TUCall provider](self, "provider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFaceTimeProvider");

  if (!v4)
    return 0;
  if (-[TUCall isVideo](self, "isVideo"))
  {
    if (-[TUCall isConversation](self, "isConversation"))
    {
      -[TUCall callCenter](self, "callCenter");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "activeConversationForCall:", self);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        v7 = objc_msgSend(v6, "resolvedAudioVideoMode");
        TUBundle();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v7 == 2)
          v10 = CFSTR("FACETIME_SERVICE");
        else
          v10 = CFSTR("FACETIME_AUDIO_SERVICE");
      }
      else
      {
        TUBundle();
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        v10 = CFSTR("FACETIME_SERVICE");
      }
      objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_1E38A53C8, CFSTR("TelephonyUtilities"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_14;
    }
    TUBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v12;
    v13 = CFSTR("FACETIME_SERVICE");
  }
  else
  {
    TUBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v12;
    v13 = CFSTR("FACETIME_AUDIO_SERVICE");
  }
  objc_msgSend(v12, "localizedStringForKey:value:table:", v13, &stru_1E38A53C8, CFSTR("TelephonyUtilities"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_14:

  return v14;
}

- (id)supplementalInCallString
{
  void *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  const __CFString *v7;

  if (-[TUCall isHostedOnCurrentDevice](self, "isHostedOnCurrentDevice"))
  {
    v3 = 0;
  }
  else
  {
    v4 = -[TUCall isOutgoing](self, "isOutgoing");
    TUBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4)
      v7 = CFSTR("IN_CALL_OUTGOING_RELAY");
    else
      v7 = CFSTR("IN_CALL_INCOMING_RELAY");
    objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_1E38A53C8, CFSTR("TelephonyUtilities"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (id)errorAlertTitle
{
  void *v3;
  __CFString *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  __CFString *v10;
  __CFString *v11;
  const __CFString *v12;
  __CFString *v13;
  const __CFString *v14;
  int v15;

  v3 = 0;
  switch(-[TUCall disconnectedReason](self, "disconnectedReason"))
  {
    case 8:
      TUBundle();
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v5 = CFSTR("ALERT_RELAY_FAILED_CONFERENCE_FAILED_TITLE");
      goto LABEL_11;
    case 9:
    case 0xC:
      TUBundle();
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v5 = CFSTR("ALERT_RELAY_FAILED_RELAY_DEVICE_UNAVAILABLE_TITLE");
      goto LABEL_11;
    case 0xA:
      TUBundle();
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v5 = CFSTR("ALERT_HOST_DEVICE_BUSY_TITLE");
      goto LABEL_11;
    case 0xB:
    case 0x2E:
      TUBundle();
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      goto LABEL_4;
    case 0xD:
      v9 = +[TUCallCapabilities isThumperCallingEnabled](TUCallCapabilities, "isThumperCallingEnabled");
      TUBundle();
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v9)
LABEL_4:
        v5 = CFSTR("ALERT_GENERIC_FAILURE_TITLE");
      else
        v5 = CFSTR("ALERT_RELAY_FAILED_NO_REMOTE_NETWORK_TITLE");
      goto LABEL_11;
    case 0x10:
      TUBundle();
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v5 = CFSTR("ALERT_CLIENT_DEVICE_BUSY_TITLE");
LABEL_11:
      TUStringKeyForPlatform((uint64_t)v5);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v11 = v4;
      v12 = v10;
      goto LABEL_12;
    case 0x1A:
      TUBundle();
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v4 = v13;
      v14 = CFSTR("ALERT_KICKED_OUT_TITLE");
      goto LABEL_26;
    case 0x1B:
      TUBundle();
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v4 = v13;
      v14 = CFSTR("ALERT_REJECTED_TITLE");
      goto LABEL_26;
    case 0x1D:
      TUBundle();
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v4 = v13;
      v14 = CFSTR("ALERT_LINKS_DISABLED_TITLE");
      goto LABEL_26;
    case 0x1E:
    case 0x31:
      v6 = (void *)MEMORY[0x1E0CB3940];
      TUBundle();
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[__CFString localizedStringForKey:value:table:](v4, "localizedStringForKey:value:table:", CFSTR("NO_DESTINATIONS_AVAILABLE_TITLE_%@"), &stru_1E38A53C8, CFSTR("TelephonyUtilities"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUCall displayName](self, "displayName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", v7, v8);
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_27;
    case 0x23:
      TUBundle();
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v4 = v13;
      v14 = CFSTR("ALERT_OFFRAMPED_TITLE");
      goto LABEL_26;
    case 0x26:
      -[TUCall dateConnected](self, "dateConnected");
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      TUBundle();
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v10 = v11;
      if (v4)
        v12 = CFSTR("ALERT_BLOCKED_REMOTE_PARTICIPANT_REMOTE_JOINING_TITLE");
      else
        v12 = CFSTR("ALERT_BLOCKED_REMOTE_PARTICIPANT_SELF_JOINING_TITLE");
      goto LABEL_12;
    case 0x2A:
      TUBundle();
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v4 = v13;
      v14 = CFSTR("TRAVEL_MODE_TITLE");
      goto LABEL_26;
    case 0x2B:
      TUBundle();
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v4 = v13;
      v14 = CFSTR("GUEST_MODE_TITLE");
      goto LABEL_26;
    case 0x2C:
      -[TUCall featureFlags](self, "featureFlags");
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v15 = -[__CFString appleAccountRebrandEnabled](v4, "appleAccountRebrandEnabled");
      TUBundle();
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v10 = v11;
      if (v15)
        v12 = CFSTR("NOT_SIGNED_IN_TITLE_APPLEACCOUNT");
      else
        v12 = CFSTR("NOT_SIGNED_IN_TITLE");
LABEL_12:
      -[__CFString localizedStringForKey:value:table:](v11, "localizedStringForKey:value:table:", v12, &stru_1E38A53C8, CFSTR("TelephonyUtilities"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_27;
    case 0x2D:
      TUBundle();
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v4 = v13;
      v14 = CFSTR("APP_NOT_INSTALLED_TITLE");
LABEL_26:
      -[__CFString localizedStringForKey:value:table:](v13, "localizedStringForKey:value:table:", v14, &stru_1E38A53C8, CFSTR("TelephonyUtilities"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_27:

      break;
    default:
      return v3;
  }
  return v3;
}

- (id)errorAlertMessage
{
  int v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __CFString *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  const __CFString *v16;
  int v17;
  __CFString *v18;
  void *v19;
  uint64_t v20;

  v3 = -[TUCall disconnectedReason](self, "disconnectedReason");
  v4 = 0;
  switch(v3)
  {
    case 9:
      -[TUCall featureFlags](self, "featureFlags");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "appleAccountRebrandEnabled");
      TUBundle();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
        v8 = CFSTR("ALERT_RELAY_FAILED_RELAY_DEVICE_UNAVAILABLE_ACCOUNTS_MESSAGE_APPLEACCOUNT");
      else
        v8 = CFSTR("ALERT_RELAY_FAILED_RELAY_DEVICE_UNAVAILABLE_ACCOUNTS_MESSAGE");
      TUStringKeyForProduct(v8);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    case 10:
      TUBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("ALERT_HOST_DEVICE_BUSY_MESSAGE");
      goto LABEL_21;
    case 11:
    case 14:
    case 15:
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
    case 24:
    case 25:
    case 31:
    case 32:
    case 33:
    case 34:
    case 36:
    case 37:
    case 38:
    case 39:
    case 40:
    case 41:
      return v4;
    case 12:
      TUBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("ALERT_RELAY_FAILED_RELAY_DEVICE_UNAVAILABLE_ENABLE_MESSAGE");
      goto LABEL_21;
    case 13:
      if (+[TUCallCapabilities isThumperCallingEnabled](TUCallCapabilities, "isThumperCallingEnabled"))
      {
        objc_msgSend((id)CUTWeakLinkClass(), "sharedInstance");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v5, "wiFiActiveAndReachable");
        TUBundle();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
          v18 = CFSTR("ALERT_THUMPER_FAILED_CALLING_NOT_AVAILABLE_MESSAGE");
        else
          v18 = CFSTR("ALERT_THUMPER_FAILED_NO_NETWORK_MESSAGE");
        TUStringKeyForNetwork(v18);
        v9 = objc_claimAutoreleasedReturnValue();
LABEL_19:
        v19 = (void *)v9;
        objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_1E38A53C8, CFSTR("TelephonyUtilities"));
        v4 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        TUBundle();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        TUStringKeyForNetworkAndProduct(CFSTR("ALERT_RELAY_FAILED_NO_REMOTE_NETWORK_MESSAGE"));
        v20 = objc_claimAutoreleasedReturnValue();
LABEL_22:
        v7 = (void *)v20;
        objc_msgSend(v5, "localizedStringForKey:value:table:", v20, &stru_1E38A53C8, CFSTR("TelephonyUtilities"));
        v4 = (void *)objc_claimAutoreleasedReturnValue();
      }

      goto LABEL_30;
    case 16:
      TUBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = CFSTR("ALERT_CLIENT_DEVICE_BUSY_MESSAGE");
LABEL_21:
      TUStringKeyForProduct(v14);
      v20 = objc_claimAutoreleasedReturnValue();
      goto LABEL_22;
    case 26:
      TUBundle();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v15;
      v16 = CFSTR("ALERT_KICKED_OUT_MESSAGE");
      goto LABEL_29;
    case 27:
      TUBundle();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v15;
      v16 = CFSTR("ALERT_REJECTED_MESSAGE");
      goto LABEL_29;
    case 28:
      TUBundle();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v15;
      v16 = CFSTR("ALERT_INVALID_LINK_MESSAGE");
      goto LABEL_29;
    case 29:
      TUBundle();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v15;
      v16 = CFSTR("ALERT_LINKS_DISABLED_MESSAGE");
      goto LABEL_29;
    case 30:
      goto LABEL_7;
    case 35:
      TUBundle();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v15;
      v16 = CFSTR("ALERT_OFFRAMPED_MESSAGE");
      goto LABEL_29;
    case 42:
      TUBundle();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v15;
      v16 = CFSTR("TRAVEL_MODE_MESSAGE");
      goto LABEL_29;
    case 43:
      TUBundle();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v15;
      v16 = CFSTR("GUEST_MODE_MESSAGE");
      goto LABEL_29;
    case 44:
      TUBundle();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v15;
      v16 = CFSTR("NOT_SIGNED_IN_MESSAGE");
      goto LABEL_29;
    case 45:
      TUBundle();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v15;
      v16 = CFSTR("APP_NOT_INSTALLED_MESSAGE");
LABEL_29:
      objc_msgSend(v15, "localizedStringForKey:value:table:", v16, &stru_1E38A53C8, CFSTR("TelephonyUtilities"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_30;
    default:
      if (v3 != 49)
        return v4;
LABEL_7:
      v10 = (void *)MEMORY[0x1E0CB3940];
      TUBundle();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("NO_DESTINATIONS_AVAILABLE_MESSAGE_%@"), &stru_1E38A53C8, CFSTR("TelephonyUtilities"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[TUCall handle](self, "handle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "value");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringWithFormat:", v11, v13);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_30:
      return v4;
  }
}

- (void)updateWithCall:(id)a3
{
  id v4;
  NSDate *v5;
  NSDate *dateAnsweredOrDialed;
  NSDate *v7;
  NSDate *dateCreated;
  NSDate *v9;
  NSDate *dateSentInvitation;
  NSDate *v11;
  NSDate *dateStartedConnecting;
  NSDate *v13;
  NSDate *dateConnected;
  NSDate *v15;
  NSDate *dateScreeningEnded;
  NSDate *v17;
  NSDate *dateEnded;
  void *v19;
  NSString *v20;
  NSString *sourceIdentifier;
  void *v22;
  NSString *v23;
  NSString *hardPauseDigits;
  void *v25;
  TUCallModel *v26;
  TUCallModel *model;
  void *v28;
  NSSet *v29;
  NSSet *emergencyMediaItems;
  void *v31;
  TUCallRecordingSession *v32;
  TUCallRecordingSession *recordingSession;
  void *v34;
  NSString *v35;
  NSString *blockedByExtension;
  double v37;
  double v38;
  double v39;
  unint64_t v40;

  v4 = a3;
  -[TUCall resetProvisionalState](self, "resetProvisionalState");
  self->_disconnectedReason = objc_msgSend(v4, "disconnectedReason");
  self->_filteredOutReason = objc_msgSend(v4, "filteredOutReason");
  self->_supportsRecents = objc_msgSend(v4, "supportsRecents");
  objc_msgSend(v4, "dateAnsweredOrDialed");
  v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
  dateAnsweredOrDialed = self->_dateAnsweredOrDialed;
  self->_dateAnsweredOrDialed = v5;

  objc_msgSend(v4, "dateCreated");
  v7 = (NSDate *)objc_claimAutoreleasedReturnValue();
  dateCreated = self->_dateCreated;
  self->_dateCreated = v7;

  objc_msgSend(v4, "dateSentInvitation");
  v9 = (NSDate *)objc_claimAutoreleasedReturnValue();
  dateSentInvitation = self->_dateSentInvitation;
  self->_dateSentInvitation = v9;

  objc_msgSend(v4, "dateStartedConnecting");
  v11 = (NSDate *)objc_claimAutoreleasedReturnValue();
  dateStartedConnecting = self->_dateStartedConnecting;
  self->_dateStartedConnecting = v11;

  objc_msgSend(v4, "dateConnected");
  v13 = (NSDate *)objc_claimAutoreleasedReturnValue();
  dateConnected = self->_dateConnected;
  self->_dateConnected = v13;

  objc_msgSend(v4, "dateScreeningEnded");
  v15 = (NSDate *)objc_claimAutoreleasedReturnValue();
  dateScreeningEnded = self->_dateScreeningEnded;
  self->_dateScreeningEnded = v15;

  objc_msgSend(v4, "dateEnded");
  v17 = (NSDate *)objc_claimAutoreleasedReturnValue();
  dateEnded = self->_dateEnded;
  self->_dateEnded = v17;

  self->_wantsHoldMusic = objc_msgSend(v4, "wantsHoldMusic");
  self->_endpointOnCurrentDevice = objc_msgSend(v4, "isEndpointOnCurrentDevice");
  self->_localUserInHomeCountry = objc_msgSend(v4, "isLocalUserInHomeCountry");
  self->_answeringMachineAvailable = objc_msgSend(v4, "isAnsweringMachineAvailable");
  self->_nondisclosedGreeting = objc_msgSend(v4, "hasNondisclosedGreeting");
  self->_identifiedSpamInCallerName = objc_msgSend(v4, "hasIdentifiedSpamInCallerName");
  self->_screening = objc_msgSend(v4, "isScreening");
  self->_screeningDueToUserInteraction = objc_msgSend(v4, "isScreeningDueToUserInteraction");
  self->_wasScreened = objc_msgSend(v4, "wasScreened");
  self->_screeningAnnouncementHasFinished = objc_msgSend(v4, "screeningAnnouncementHasFinished");
  self->_shouldSuppressRingtone = objc_msgSend(v4, "shouldSuppressRingtone");
  objc_msgSend(v4, "sourceIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (NSString *)objc_msgSend(v19, "copy");
  sourceIdentifier = self->_sourceIdentifier;
  self->_sourceIdentifier = v20;

  self->_wasDialAssisted = objc_msgSend(v4, "wasDialAssisted");
  self->_faceTimeIDStatus = objc_msgSend(v4, "faceTimeIDStatus");
  self->_hardPauseDigitsState = objc_msgSend(v4, "hardPauseDigitsState");
  objc_msgSend(v4, "hardPauseDigits");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (NSString *)objc_msgSend(v22, "copy");
  hardPauseDigits = self->_hardPauseDigits;
  self->_hardPauseDigits = v23;

  self->_wasPulledToCurrentDevice = objc_msgSend(v4, "wasPulledToCurrentDevice");
  self->_soundRegion = objc_msgSend(v4, "soundRegion");
  objc_msgSend(v4, "model");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (TUCallModel *)objc_msgSend(v25, "copy");
  model = self->_model;
  self->_model = v26;

  self->_supportsDTMFUpdates = objc_msgSend(v4, "supportsDTMFUpdates");
  self->_video = objc_msgSend(v4, "isVideo");
  self->_verificationStatus = objc_msgSend(v4, "verificationStatus");
  self->_priority = objc_msgSend(v4, "priority");
  self->_originatingUIType = objc_msgSend(v4, "originatingUIType");
  self->_liveVoicemailUnavailableReason = objc_msgSend(v4, "liveVoicemailUnavailableReason");
  self->_junkConfidence = objc_msgSend(v4, "junkConfidence");
  self->_identificationCategory = objc_msgSend(v4, "identificationCategory");
  self->_isKnownCaller = objc_msgSend(v4, "isKnownCaller");
  self->_joinedFromLink = objc_msgSend(v4, "joinedFromLink");
  self->_callSubType = objc_msgSend(v4, "callSubType");
  self->_hasEmergencyVideoStream = objc_msgSend(v4, "hasEmergencyVideoStream");
  objc_msgSend(v4, "emergencyMediaItems");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = (NSSet *)objc_msgSend(v28, "copy");
  emergencyMediaItems = self->_emergencyMediaItems;
  self->_emergencyMediaItems = v29;

  objc_msgSend(v4, "recordingSession");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (TUCallRecordingSession *)objc_msgSend(v31, "copy");
  recordingSession = self->_recordingSession;
  self->_recordingSession = v32;

  objc_msgSend(v4, "blockedByExtension");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (NSString *)objc_msgSend(v34, "copy");
  blockedByExtension = self->_blockedByExtension;
  self->_blockedByExtension = v35;

  self->_screenSharingIntention = objc_msgSend(v4, "screenSharingIntention");
  objc_msgSend(v4, "hostCreationTime");
  self->_hostCreationTime = v37;
  objc_msgSend(v4, "hostMessageSendTime");
  self->_hostMessageSendTime = v38;
  objc_msgSend(v4, "clientMessageReceiveTime");
  self->_clientMessageReceiveTime = v39;
  self->_answeringMachineStreamToken = objc_msgSend(v4, "answeringMachineStreamToken");
  self->_providerErrorCode = objc_msgSend(v4, "providerErrorCode");
  self->_providerEndedReason = objc_msgSend(v4, "providerEndedReason");
  v40 = objc_msgSend(v4, "screenSharingType");

  self->_screenSharingType = v40;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUCall)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  TUCall *v6;
  void *v7;
  uint64_t v8;
  NSString *sourceIdentifier;
  uint64_t v10;
  NSDate *dateCreated;
  uint64_t v12;
  NSDate *dateAnsweredOrDialed;
  uint64_t v14;
  NSDate *dateSentInvitation;
  uint64_t v16;
  NSDate *dateStartedConnecting;
  uint64_t v18;
  NSDate *dateConnected;
  uint64_t v20;
  NSDate *dateScreeningEnded;
  uint64_t v22;
  NSDate *dateEnded;
  uint64_t v24;
  NSString *hardPauseDigits;
  uint64_t v26;
  TUCallModel *model;
  uint64_t v28;
  TUVideoCallAttributes *videoCallAttributes;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  NSSet *emergencyMediaItems;
  void *v35;
  uint64_t v36;
  NSString *blockedByExtension;
  double v38;
  double v39;
  double v40;
  uint64_t v41;
  TUCallRecordingSession *recordingSession;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uniqueProxyIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TUCall initWithUniqueProxyIdentifier:](self, "initWithUniqueProxyIdentifier:", v5);

  if (v6)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sourceIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "copy");
    sourceIdentifier = v6->_sourceIdentifier;
    v6->_sourceIdentifier = (NSString *)v8;

    v6->_disconnectedReason = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("disconnectedReason"));
    v6->_filteredOutReason = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("filteredOutReason"));
    v6->_supportsRecents = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsRecents"));
    v6->_faceTimeIDStatus = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("faceTimeIDStatus"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateCreated"));
    v10 = objc_claimAutoreleasedReturnValue();
    dateCreated = v6->_dateCreated;
    v6->_dateCreated = (NSDate *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateAnsweredOrDialed"));
    v12 = objc_claimAutoreleasedReturnValue();
    dateAnsweredOrDialed = v6->_dateAnsweredOrDialed;
    v6->_dateAnsweredOrDialed = (NSDate *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateSentInvitation"));
    v14 = objc_claimAutoreleasedReturnValue();
    dateSentInvitation = v6->_dateSentInvitation;
    v6->_dateSentInvitation = (NSDate *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateStartedConnecting"));
    v16 = objc_claimAutoreleasedReturnValue();
    dateStartedConnecting = v6->_dateStartedConnecting;
    v6->_dateStartedConnecting = (NSDate *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateConnected"));
    v18 = objc_claimAutoreleasedReturnValue();
    dateConnected = v6->_dateConnected;
    v6->_dateConnected = (NSDate *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateScreeningEnded"));
    v20 = objc_claimAutoreleasedReturnValue();
    dateScreeningEnded = v6->_dateScreeningEnded;
    v6->_dateScreeningEnded = (NSDate *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateEnded"));
    v22 = objc_claimAutoreleasedReturnValue();
    dateEnded = v6->_dateEnded;
    v6->_dateEnded = (NSDate *)v22;

    v6->_wasDialAssisted = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("wasDialAssisted"));
    v6->_wantsHoldMusic = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("wantsHoldMusic"));
    v6->_endpointOnCurrentDevice = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("endpointOnCurrentDevice"));
    v6->_localUserInHomeCountry = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("localUserInHomeCountry"));
    v6->_answeringMachineAvailable = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("answeringMachineAvailable"));
    v6->_nondisclosedGreeting = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("nondisclosedGreeting"));
    v6->_identifiedSpamInCallerName = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("identifiedSpamInCallerName"));
    v6->_screening = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("screening"));
    v6->_screeningDueToUserInteraction = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("screeningDueToUserInteraction"));
    v6->_wasScreened = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("wasScreened"));
    v6->_screeningAnnouncementHasFinished = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("screeningAnnouncementHasFinished"));
    v6->_shouldSuppressRingtone = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldSuppressRingtone"));
    v6->_hardPauseDigitsState = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("hardPauseDigitsState"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("hardPauseDigits"));
    v24 = objc_claimAutoreleasedReturnValue();
    hardPauseDigits = v6->_hardPauseDigits;
    v6->_hardPauseDigits = (NSString *)v24;

    v6->_wasPulledToCurrentDevice = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("wasPulledToCurrentDevice"));
    v6->_soundRegion = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("soundRegion"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("model"));
    v26 = objc_claimAutoreleasedReturnValue();
    model = v6->_model;
    v6->_model = (TUCallModel *)v26;

    v6->_supportsDTMFUpdates = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsDTMFUpdates"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("videoCallAttributes"));
    v28 = objc_claimAutoreleasedReturnValue();
    videoCallAttributes = v6->_videoCallAttributes;
    v6->_videoCallAttributes = (TUVideoCallAttributes *)v28;

    v6->_verificationStatus = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("verificationStatus"));
    v6->_priority = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("priority"));
    v6->_originatingUIType = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("originatingUIType"));
    v6->_liveVoicemailUnavailableReason = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("liveVoicemailUnavailableReason"));
    v6->_junkConfidence = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("junkConfidence"));
    v6->_identificationCategory = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("identificationCategory"));
    v6->_isKnownCaller = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isKnownCaller"));
    v6->_joinedFromLink = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("joinedFromLink"));
    v6->_answeringMachineStreamToken = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("answeringMachineStreamToken"));
    v6->_callSubType = objc_msgSend(v4, "decodeIntForKey:", CFSTR("callSubType"));
    v6->_screenSharingIntention = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("screenSharingIntention"));
    v6->_hasEmergencyVideoStream = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasEmergencyVideoStream"));
    v30 = (void *)MEMORY[0x1E0C99E60];
    v31 = objc_opt_class();
    objc_msgSend(v30, "setWithObjects:", v31, objc_opt_class(), 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v32, CFSTR("emergencyMediaItems"));
    v33 = objc_claimAutoreleasedReturnValue();
    emergencyMediaItems = v6->_emergencyMediaItems;
    v6->_emergencyMediaItems = (NSSet *)v33;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("blockedByExtension"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "copy");
    blockedByExtension = v6->_blockedByExtension;
    v6->_blockedByExtension = (NSString *)v36;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("hostCreationTime"));
    v6->_hostCreationTime = v38;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("hostMessageSendTime"));
    v6->_hostMessageSendTime = v39;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("clientMessageReceiveTime"));
    v6->_clientMessageReceiveTime = v40;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("recordingSession"));
    v41 = objc_claimAutoreleasedReturnValue();
    recordingSession = v6->_recordingSession;
    v6->_recordingSession = (TUCallRecordingSession *)v41;

    v6->_providerErrorCode = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("providerErrorCode"));
    v6->_providerEndedReason = (int)objc_msgSend(v4, "decodeIntForKey:", CFSTR("providerEndedReason"));
    v6->_screenSharingType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("screenSharingType"));
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *uniqueProxyIdentifier;
  id v5;

  uniqueProxyIdentifier = self->_uniqueProxyIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", uniqueProxyIdentifier, CFSTR("uniqueProxyIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sourceIdentifier, CFSTR("sourceIdentifier"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_disconnectedReason, CFSTR("disconnectedReason"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_filteredOutReason, CFSTR("filteredOutReason"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_supportsRecents, CFSTR("supportsRecents"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_faceTimeIDStatus, CFSTR("faceTimeIDStatus"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dateCreated, CFSTR("dateCreated"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dateAnsweredOrDialed, CFSTR("dateAnsweredOrDialed"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dateSentInvitation, CFSTR("dateSentInvitation"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dateStartedConnecting, CFSTR("dateStartedConnecting"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dateConnected, CFSTR("dateConnected"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dateScreeningEnded, CFSTR("dateScreeningEnded"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_dateEnded, CFSTR("dateEnded"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_wasDialAssisted, CFSTR("wasDialAssisted"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_transitionStatus, CFSTR("transitionStatus"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_wantsHoldMusic, CFSTR("wantsHoldMusic"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_endpointOnCurrentDevice, CFSTR("endpointOnCurrentDevice"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_localUserInHomeCountry, CFSTR("localUserInHomeCountry"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_answeringMachineAvailable, CFSTR("answeringMachineAvailable"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_nondisclosedGreeting, CFSTR("nondisclosedGreeting"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_identifiedSpamInCallerName, CFSTR("identifiedSpamInCallerName"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_screening, CFSTR("screening"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_screeningDueToUserInteraction, CFSTR("screeningDueToUserInteraction"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_wasScreened, CFSTR("wasScreened"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_screeningAnnouncementHasFinished, CFSTR("screeningAnnouncementHasFinished"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldSuppressRingtone, CFSTR("shouldSuppressRingtone"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_hardPauseDigitsState, CFSTR("hardPauseDigitsState"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_hardPauseDigits, CFSTR("hardPauseDigits"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_wasPulledToCurrentDevice, CFSTR("wasPulledToCurrentDevice"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_soundRegion, CFSTR("soundRegion"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_screenSharingIntention, CFSTR("screenSharingIntention"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_model, CFSTR("model"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_supportsDTMFUpdates, CFSTR("supportsDTMFUpdates"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_videoCallAttributes, CFSTR("videoCallAttributes"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_verificationStatus, CFSTR("verificationStatus"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_priority, CFSTR("priority"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_originatingUIType, CFSTR("originatingUIType"));
  objc_msgSend(v5, "encodeInt32:forKey:", LODWORD(self->_liveVoicemailUnavailableReason), CFSTR("liveVoicemailUnavailableReason"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_junkConfidence, CFSTR("junkConfidence"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_identificationCategory, CFSTR("identificationCategory"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isKnownCaller, CFSTR("isKnownCaller"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_joinedFromLink, CFSTR("joinedFromLink"));
  objc_msgSend(v5, "encodeInt:forKey:", self->_callSubType, CFSTR("callSubType"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hasEmergencyVideoStream, CFSTR("hasEmergencyVideoStream"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_emergencyMediaItems, CFSTR("emergencyMediaItems"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_recordingSession, CFSTR("recordingSession"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_blockedByExtension, CFSTR("blockedByExtension"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("hostCreationTime"), self->_hostCreationTime);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("hostMessageSendTime"), self->_hostMessageSendTime);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("clientMessageReceiveTime"), self->_clientMessageReceiveTime);
  objc_msgSend(v5, "encodeInteger:forKey:", self->_answeringMachineStreamToken, CFSTR("answeringMachineStreamToken"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_providerErrorCode, CFSTR("providerErrorCode"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_providerEndedReason, CFSTR("providerEndedReason"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_screenSharingType, CFSTR("screenSharingType"));

}

- (NSDictionary)callStats
{
  return 0;
}

- (NSString)endedErrorString
{
  return 0;
}

- (NSString)endedReasonString
{
  return 0;
}

- (int64_t)cameraType
{
  return 0;
}

- (int64_t)remoteCameraOrientation
{
  return 0;
}

- (int64_t)remoteScreenOrientation
{
  return 0;
}

- (CGRect)remoteVideoContentRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  if (__CUTWeakCGRectZero__pred_CGRectZeroCoreGraphics != -1)
    dispatch_once(&__CUTWeakCGRectZero__pred_CGRectZeroCoreGraphics, &__block_literal_global_1414);
  v3 = *((double *)&__CUTStaticWeak_CGRectZero + 1);
  v2 = *(double *)&__CUTStaticWeak_CGRectZero;
  v4 = *(double *)&qword_1EE3AA7F0;
  v5 = unk_1EE3AA7F8;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)isVideoUpgradeFromCall:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;

  v4 = a3;
  if (-[TUCall isVideo](self, "isVideo")
    && (objc_msgSend(v4, "isVideo") & 1) == 0
    && (-[TUCall handle](self, "handle"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "handle"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = TUHandlesAreCanonicallyEqual(v5, v6),
        v6,
        v5,
        v7))
  {
    objc_msgSend(v4, "provider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isTinCanProvider") ^ 1;

  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (BOOL)isDialRequestVideoUpgrade:(id)a3
{
  id v4;
  char v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (objc_msgSend(v4, "isVideo") && !-[TUCall isVideo](self, "isVideo"))
  {
    -[TUCall handle](self, "handle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = TUHandlesAreCanonicallyEqual(v6, v7);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isEligibleForManualScreening
{
  return -[TUCall isEligibleForManualScreening:](self, "isEligibleForManualScreening:", 0);
}

- (BOOL)isEligibleForManualScreening:(id)a3
{
  return -[TUCall _isEligibleForManualScreening:languageIdentifier:](self, "_isEligibleForManualScreening:languageIdentifier:", 1, a3);
}

- (BOOL)isEligibleForScreening
{
  return -[TUCall isEligibleForScreening:](self, "isEligibleForScreening:", 0);
}

- (BOOL)isEligibleForScreening:(id)a3
{
  return -[TUCall _isEligibleForManualScreening:languageIdentifier:](self, "_isEligibleForManualScreening:languageIdentifier:", 0, a3);
}

- (BOOL)_isEligibleForManualScreening:(BOOL)a3 languageIdentifier:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  int v8;
  uint64_t (**v9)(void);
  int v10;
  NSObject *v11;
  const char *v12;
  uint64_t (**v13)(void);
  int v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  NSObject *v21;
  const char *v22;
  const __CFString *v23;
  const __CFString *v24;
  _BOOL4 v26;
  void *v27;
  uint64_t v28;
  int v29;
  const __CFString *v30;
  __int16 v31;
  const __CFString *v32;
  __int16 v33;
  TUCall *v34;
  uint64_t v35;

  v4 = a3;
  v35 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[TUCall featureFlags](self, "featureFlags");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = TUCallScreeningEnabled(v7, v6);

  if (!v8)
    goto LABEL_32;
  -[TUCall clarityEnabledBlock](self, "clarityEnabledBlock");
  v9 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
  v10 = v9[2]();

  if (v10)
  {
    TUDefaultLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29) = 0;
      v12 = "isEligibleForScreening: NO because ClarityUI is enabled";
LABEL_15:
      _os_log_impl(&dword_19A50D000, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v29, 2u);
      goto LABEL_16;
    }
    goto LABEL_16;
  }
  if (!v4)
  {
    -[TUCall lowPowerModeEnabledBlock](self, "lowPowerModeEnabledBlock");
    v13 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
    v14 = v13[2]();

    if (v14)
    {
      TUDefaultLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v29) = 0;
        v12 = "isEligibleForScreening: NO because the device is in low power mode";
        goto LABEL_15;
      }
LABEL_16:
      LOBYTE(v16) = 0;
      goto LABEL_40;
    }
  }
  if (!-[TUCall supportsScreening](self, "supportsScreening"))
  {
    TUDefaultLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29) = 0;
      v12 = "isEligibleForScreening: NO because the call provider reports this call does not support screening";
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  if (-[TUCall priority](self, "priority") == 2)
  {
    -[TUCall setLiveVoicemailUnavailableReason:](self, "setLiveVoicemailUnavailableReason:", 7);
    TUDefaultLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29) = 0;
      _os_log_impl(&dword_19A50D000, v15, OS_LOG_TYPE_DEFAULT, "isEligibleForScreening: High Priority call, not screenable", (uint8_t *)&v29, 2u);
    }
LABEL_27:

    goto LABEL_28;
  }
  -[TUCall provider](self, "provider");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isTelephonyProvider");

  if (v18
    && (v4
     || -[TUCall isLocalUserInHomeCountry](self, "isLocalUserInHomeCountry")
     && !-[TUCall hasIdentifiedSpamInCallerName](self, "hasIdentifiedSpamInCallerName")
     && -[TUCall junkConfidence](self, "junkConfidence") < 2))
  {
    goto LABEL_19;
  }
  -[TUCall provider](self, "provider");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isFaceTimeProvider");

  if (!v20)
    goto LABEL_28;
  -[TUCall remoteParticipantHandles](self, "remoteParticipantHandles");
  v15 = objc_claimAutoreleasedReturnValue();
  if ((unint64_t)-[NSObject count](v15, "count") > 1 || -[TUCall isVideo](self, "isVideo"))
    goto LABEL_27;
  v26 = -[TUCall isConversation](self, "isConversation");
  if (v26 && !v4)
  {
    -[TUCall contactIdentifiers](self, "contactIdentifiers");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "count");

    if (v28 != 1)
      goto LABEL_28;
LABEL_19:
    if (-[TUCall isAnsweringMachineAvailable](self, "isAnsweringMachineAvailable"))
    {
      v16 = 1;
      goto LABEL_33;
    }
    TUDefaultLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      goto LABEL_31;
    LOWORD(v29) = 0;
    v22 = "isEligibleForScreening: NO, Answering Machine is not currently available";
    goto LABEL_30;
  }

  if (v26)
    goto LABEL_19;
LABEL_28:
  TUDefaultLog();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v29) = 0;
    v22 = "isEligibleForScreening: NO, either telephony roaming, Junk Call, or Emergency or not a U+1 audio call from a contact";
LABEL_30:
    _os_log_impl(&dword_19A50D000, v21, OS_LOG_TYPE_DEFAULT, v22, (uint8_t *)&v29, 2u);
  }
LABEL_31:

LABEL_32:
  v16 = 0;
LABEL_33:
  TUDefaultLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v23 = CFSTR("NO");
    if (v16)
      v24 = CFSTR("YES");
    else
      v24 = CFSTR("NO");
    v29 = 138412802;
    v30 = v24;
    v31 = 2112;
    if (v4)
      v23 = CFSTR("YES");
    v32 = v23;
    v33 = 2112;
    v34 = self;
    _os_log_impl(&dword_19A50D000, v11, OS_LOG_TYPE_DEFAULT, "isEligibleForScreening: %@ manualScreening: %@ for call: %@", (uint8_t *)&v29, 0x20u);
  }
LABEL_40:

  return v16;
}

- (BOOL)isRecordingAllowed
{
  return -[TUCall recordingAvailability](self, "recordingAvailability") == 3;
}

- (int)recordingAvailability
{
  return 1;
}

- (BOOL)supportsScreening
{
  return 0;
}

- (int)callSubType
{
  return self->_callSubType;
}

- (void)setCallSubType:(int)a3
{
  self->_callSubType = a3;
}

- (TUCallRecordingSession)recordingSession
{
  return self->_recordingSession;
}

- (void)setAnnounceProviderIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (int)disconnectedReason
{
  return self->_disconnectedReason;
}

- (void)setDisconnectedReason:(int)a3
{
  self->_disconnectedReason = a3;
}

- (void)setVideo:(BOOL)a3
{
  self->_video = a3;
}

- (int)faceTimeIDStatus
{
  return self->_faceTimeIDStatus;
}

- (void)setFaceTimeIDStatus:(int)a3
{
  self->_faceTimeIDStatus = a3;
}

- (BOOL)isEndpointOnCurrentDevice
{
  return self->_endpointOnCurrentDevice;
}

- (void)setEndpointOnCurrentDevice:(BOOL)a3
{
  self->_endpointOnCurrentDevice = a3;
}

- (void)setTtyType:(int)a3
{
  self->_ttyType = a3;
}

- (BOOL)shouldSuppressRingtone
{
  return self->_shouldSuppressRingtone;
}

- (void)setShouldSuppressRingtone:(BOOL)a3
{
  self->_shouldSuppressRingtone = a3;
}

- (BOOL)wantsHoldMusic
{
  return self->_wantsHoldMusic;
}

- (void)setWantsHoldMusic:(BOOL)a3
{
  self->_wantsHoldMusic = a3;
}

- (NSDate)dateCreated
{
  return self->_dateCreated;
}

- (NSDate)dateAnsweredOrDialed
{
  return self->_dateAnsweredOrDialed;
}

- (void)setDateAnsweredOrDialed:(id)a3
{
  objc_storeStrong((id *)&self->_dateAnsweredOrDialed, a3);
}

- (NSDate)dateSentInvitation
{
  return self->_dateSentInvitation;
}

- (void)setDateSentInvitation:(id)a3
{
  objc_storeStrong((id *)&self->_dateSentInvitation, a3);
}

- (NSDate)dateStartedConnecting
{
  return self->_dateStartedConnecting;
}

- (void)setDateStartedConnecting:(id)a3
{
  objc_storeStrong((id *)&self->_dateStartedConnecting, a3);
}

- (NSDate)dateConnected
{
  return self->_dateConnected;
}

- (void)setDateConnected:(id)a3
{
  objc_storeStrong((id *)&self->_dateConnected, a3);
}

- (NSDate)dateEnded
{
  return self->_dateEnded;
}

- (void)setDateEnded:(id)a3
{
  objc_storeStrong((id *)&self->_dateEnded, a3);
}

- (unint64_t)screenSharingType
{
  return self->_screenSharingType;
}

- (void)setScreenSharingType:(unint64_t)a3
{
  self->_screenSharingType = a3;
}

- (NSString)uniqueProxyIdentifier
{
  return self->_uniqueProxyIdentifier;
}

- (void)setUniqueProxyIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSString)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (void)setSourceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (void)setIsoCountryCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (BOOL)wasDialAssisted
{
  return self->_wasDialAssisted;
}

- (void)setWasDialAssisted:(BOOL)a3
{
  self->_wasDialAssisted = a3;
}

- (BOOL)hasEmergencyVideoStream
{
  return self->_hasEmergencyVideoStream;
}

- (void)setHasEmergencyVideoStream:(BOOL)a3
{
  self->_hasEmergencyVideoStream = a3;
}

- (NSSet)emergencyMediaItems
{
  return self->_emergencyMediaItems;
}

- (void)setEmergencyMediaItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (TUCallModel)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 184);
}

- (TUCallNotificationManager)callNotificationManager
{
  return self->_callNotificationManager;
}

- (BOOL)lockdownModeEnabled
{
  return self->_lockdownModeEnabled;
}

- (TUProxyCall)comparativeCall
{
  return self->_comparativeCall;
}

- (void)setComparativeCall:(id)a3
{
  objc_storeStrong((id *)&self->_comparativeCall, a3);
}

- (int)filteredOutReason
{
  return self->_filteredOutReason;
}

- (void)setFilteredOutReason:(int)a3
{
  self->_filteredOutReason = a3;
}

- (NSString)blockedByExtension
{
  return self->_blockedByExtension;
}

- (void)setBlockedByExtension:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (void)setSupportsRecents:(BOOL)a3
{
  self->_supportsRecents = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (TUCallServicesInterface)callServicesInterface
{
  return (TUCallServicesInterface *)objc_loadWeakRetained((id *)&self->_callServicesInterface);
}

- (void)setCallServicesInterface:(id)a3
{
  objc_storeWeak((id *)&self->_callServicesInterface, a3);
}

- (TUVideoCallAttributes)videoCallAttributes
{
  return self->_videoCallAttributes;
}

- (void)setVideoCallAttributes:(id)a3
{
  objc_storeStrong((id *)&self->_videoCallAttributes, a3);
}

- (NSDate)dateScreeningEnded
{
  return self->_dateScreeningEnded;
}

- (void)setDateScreeningEnded:(id)a3
{
  objc_storeStrong((id *)&self->_dateScreeningEnded, a3);
}

- (int64_t)verificationStatus
{
  return self->_verificationStatus;
}

- (void)setVerificationStatus:(int64_t)a3
{
  self->_verificationStatus = a3;
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void)setFeatureFlags:(id)a3
{
  objc_storeStrong((id *)&self->_featureFlags, a3);
}

- (id)contactsDataSourceCreationBlock
{
  return self->_contactsDataSourceCreationBlock;
}

- (void)setContactsDataSourceCreationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (id)clarityEnabledBlock
{
  return self->_clarityEnabledBlock;
}

- (void)setClarityEnabledBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 280);
}

- (id)lowPowerModeEnabledBlock
{
  return self->_lowPowerModeEnabledBlock;
}

- (void)setLowPowerModeEnabledBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 288);
}

- (NSURL)channelImageURL
{
  return self->_channelImageURL;
}

- (void)setChannelImageURL:(id)a3
{
  objc_storeStrong((id *)&self->_channelImageURL, a3);
}

- (TUParticipant)activeRemoteParticipant
{
  return self->_activeRemoteParticipant;
}

- (int64_t)provisionalHoldStatus
{
  return self->_provisionalHoldStatus;
}

- (void)setProvisionalHoldStatus:(int64_t)a3
{
  self->_provisionalHoldStatus = a3;
}

- (int64_t)serviceStatus
{
  return self->_serviceStatus;
}

- (int64_t)transmissionMode
{
  return self->_transmissionMode;
}

- (BOOL)accessoryButtonEventsEnabled
{
  return self->_accessoryButtonEventsEnabled;
}

- (int)transitionStatus
{
  return self->_transitionStatus;
}

- (void)setTransitionStatus:(int)a3
{
  self->_transitionStatus = a3;
}

- (BOOL)hasUpdatedAudio
{
  return self->_hasUpdatedAudio;
}

- (void)setHasUpdatedAudio:(BOOL)a3
{
  self->_hasUpdatedAudio = a3;
}

- (int64_t)soundRegion
{
  return self->_soundRegion;
}

- (void)setSoundRegion:(int64_t)a3
{
  self->_soundRegion = a3;
}

- (BOOL)isScreening
{
  return self->_screening;
}

- (void)setScreening:(BOOL)a3
{
  self->_screening = a3;
}

- (BOOL)isScreeningDueToUserInteraction
{
  return self->_screeningDueToUserInteraction;
}

- (void)setScreeningDueToUserInteraction:(BOOL)a3
{
  self->_screeningDueToUserInteraction = a3;
}

- (BOOL)wasScreened
{
  return self->_wasScreened;
}

- (void)setWasScreened:(BOOL)a3
{
  self->_wasScreened = a3;
}

- (BOOL)screeningAnnouncementHasFinished
{
  return self->_screeningAnnouncementHasFinished;
}

- (void)setScreeningAnnouncementHasFinished:(BOOL)a3
{
  self->_screeningAnnouncementHasFinished = a3;
}

- (BOOL)isPTT
{
  return self->_ptt;
}

- (BOOL)ringtoneSuppressedRemotely
{
  return self->_ringtoneSuppressedRemotely;
}

- (void)setRingtoneSuppressedRemotely:(BOOL)a3
{
  self->_ringtoneSuppressedRemotely = a3;
}

- (NSDictionary)providerContext
{
  return self->_providerContext;
}

- (int64_t)providerErrorCode
{
  return self->_providerErrorCode;
}

- (int64_t)providerEndedReason
{
  return self->_providerEndedReason;
}

- (int64_t)answeringMachineStreamToken
{
  return self->_answeringMachineStreamToken;
}

- (void)setAnsweringMachineStreamToken:(int64_t)a3
{
  self->_answeringMachineStreamToken = a3;
}

- (TUMediaTokens)tokens
{
  return self->_tokens;
}

- (NSString)localMemberHandleValue
{
  return self->_localMemberHandleValue;
}

- (CGSize)remoteScreenAspectRatio
{
  double width;
  double height;
  CGSize result;

  width = self->_remoteScreenAspectRatio.width;
  height = self->_remoteScreenAspectRatio.height;
  result.height = height;
  result.width = width;
  return result;
}

- (BOOL)needsConversationOrVideoRelaySupport
{
  return self->_needsConversationOrVideoRelaySupport;
}

- (BOOL)needsConversationRelaySupport
{
  return self->_needsConversationRelaySupport;
}

- (BOOL)isSharingScreen
{
  return self->_sharingScreen;
}

- (void)setSharingScreen:(BOOL)a3
{
  self->_sharingScreen = a3;
}

- (BOOL)mixesVoiceWithMedia
{
  return self->_mixesVoiceWithMedia;
}

- (void)setMixesVoiceWithMedia:(BOOL)a3
{
  self->_mixesVoiceWithMedia = a3;
}

- (BOOL)mediaPlaybackOnExternalDevice
{
  return self->_mediaPlaybackOnExternalDevice;
}

- (void)setMediaPlaybackOnExternalDevice:(BOOL)a3
{
  self->_mediaPlaybackOnExternalDevice = a3;
}

- (BOOL)prefersToPlayDuringWombat
{
  return self->_prefersToPlayDuringWombat;
}

- (void)setPrefersToPlayDuringWombat:(BOOL)a3
{
  self->_prefersToPlayDuringWombat = a3;
}

- (double)hostCreationTime
{
  return self->_hostCreationTime;
}

- (void)setHostCreationTime:(double)a3
{
  self->_hostCreationTime = a3;
}

- (double)hostMessageSendTime
{
  return self->_hostMessageSendTime;
}

- (void)setHostMessageSendTime:(double)a3
{
  self->_hostMessageSendTime = a3;
}

- (double)clientMessageReceiveTime
{
  return self->_clientMessageReceiveTime;
}

- (void)setClientMessageReceiveTime:(double)a3
{
  self->_clientMessageReceiveTime = a3;
}

- (BOOL)wasPulledToCurrentDevice
{
  return self->_wasPulledToCurrentDevice;
}

- (void)setWasPulledToCurrentDevice:(BOOL)a3
{
  self->_wasPulledToCurrentDevice = a3;
}

- (int)hardPauseDigitsState
{
  return self->_hardPauseDigitsState;
}

- (void)setHardPauseDigitsState:(int)a3
{
  self->_hardPauseDigitsState = a3;
}

- (NSString)hardPauseDigits
{
  return self->_hardPauseDigits;
}

- (void)setHardPauseDigits:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (NSUUID)conversationID
{
  return self->_conversationID;
}

- (int)originatingUIType
{
  return self->_originatingUIType;
}

- (int64_t)liveVoicemailUnavailableReason
{
  return self->_liveVoicemailUnavailableReason;
}

- (void)setLiveVoicemailUnavailableReason:(int64_t)a3
{
  self->_liveVoicemailUnavailableReason = a3;
}

- (int64_t)junkConfidence
{
  return self->_junkConfidence;
}

- (int64_t)identificationCategory
{
  return self->_identificationCategory;
}

- (BOOL)isKnownCaller
{
  return self->_isKnownCaller;
}

- (BOOL)isLocalUserInHomeCountry
{
  return self->_localUserInHomeCountry;
}

- (BOOL)isAnsweringMachineAvailable
{
  return self->_answeringMachineAvailable;
}

- (BOOL)hasNondisclosedGreeting
{
  return self->_nondisclosedGreeting;
}

- (BOOL)hasIdentifiedSpamInCallerName
{
  return self->_identifiedSpamInCallerName;
}

- (BOOL)joinedFromLink
{
  return self->_joinedFromLink;
}

- (void)setJoinedFromLink:(BOOL)a3
{
  self->_joinedFromLink = a3;
}

- (void)setBluetoothAudioFormat:(int64_t)a3
{
  self->_bluetoothAudioFormat = a3;
}

- (TUCallScreenShareAttributes)screenShareAttributes
{
  return self->_screenShareAttributes;
}

- (int64_t)screenSharingIntention
{
  return self->_screenSharingIntention;
}

- (void)setFailureExpected:(BOOL)a3
{
  self->_failureExpected = a3;
}

- (BOOL)isInternational
{
  return self->_international;
}

- (BOOL)isDomestic
{
  return self->_domestic;
}

- (void)setSupportsEmergencyFallback:(BOOL)a3
{
  self->_supportsEmergencyFallback = a3;
}

- (BOOL)supportsDTMFUpdates
{
  return self->_supportsDTMFUpdates;
}

- (void)setSupportsDTMFUpdates:(BOOL)a3
{
  self->_supportsDTMFUpdates = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenShareAttributes, 0);
  objc_storeStrong((id *)&self->_conversationID, 0);
  objc_storeStrong((id *)&self->_hardPauseDigits, 0);
  objc_storeStrong((id *)&self->_localMemberHandleValue, 0);
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_providerContext, 0);
  objc_storeStrong((id *)&self->_activeRemoteParticipant, 0);
  objc_storeStrong((id *)&self->_channelImageURL, 0);
  objc_storeStrong(&self->_lowPowerModeEnabledBlock, 0);
  objc_storeStrong(&self->_clarityEnabledBlock, 0);
  objc_storeStrong(&self->_contactsDataSourceCreationBlock, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_dateScreeningEnded, 0);
  objc_storeStrong((id *)&self->_videoCallAttributes, 0);
  objc_destroyWeak((id *)&self->_callServicesInterface);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_blockedByExtension, 0);
  objc_storeStrong((id *)&self->_comparativeCall, 0);
  objc_storeStrong((id *)&self->_callNotificationManager, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_emergencyMediaItems, 0);
  objc_storeStrong((id *)&self->_isoCountryCode, 0);
  objc_storeStrong((id *)&self->_sourceIdentifier, 0);
  objc_storeStrong((id *)&self->_uniqueProxyIdentifier, 0);
  objc_storeStrong((id *)&self->_dateEnded, 0);
  objc_storeStrong((id *)&self->_dateConnected, 0);
  objc_storeStrong((id *)&self->_dateStartedConnecting, 0);
  objc_storeStrong((id *)&self->_dateSentInvitation, 0);
  objc_storeStrong((id *)&self->_dateAnsweredOrDialed, 0);
  objc_storeStrong((id *)&self->_dateCreated, 0);
  objc_storeStrong((id *)&self->_announceProviderIdentifier, 0);
  objc_storeStrong((id *)&self->_recordingSession, 0);
}

- (void)dialRequestForRedial
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "handle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_19A50D000, a2, OS_LOG_TYPE_ERROR, "Call was emergency, but handle %@ is not considered to be an emergency handle. Setting redial dialType to normal.", (uint8_t *)&v4, 0xCu);

}

@end
