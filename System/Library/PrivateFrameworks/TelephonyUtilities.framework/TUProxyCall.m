@implementation TUProxyCall

- (TUProxyCall)initWithUniqueProxyIdentifier:(id)a3 endpointOnCurrentDevice:(BOOL)a4
{
  TUProxyCall *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TUProxyCall;
  result = -[TUCall initWithUniqueProxyIdentifier:endpointOnCurrentDevice:](&v5, sel_initWithUniqueProxyIdentifier_endpointOnCurrentDevice_, a3, a4);
  if (result)
    result->_remoteScreenOrientation = 1;
  return result;
}

+ (id)proxyCallWithCall:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithCall:", v4);

  return v5;
}

- (void)updateWithCall:(id)a3
{
  id v4;
  void *v5;
  TUParticipant *v6;
  TUParticipant *activeRemoteParticipant;
  void *v8;
  NSString *v9;
  NSString *announceProviderIdentifier;
  TUHandle *v11;
  TUHandle *handle;
  void *v13;
  NSString *v14;
  NSString *isoCountryCode;
  void *v16;
  TUCallProvider *v17;
  TUCallProvider *provider;
  void *v19;
  NSString *v20;
  NSString *callerNameFromNetwork;
  void *v22;
  NSString *v23;
  NSString *callUUID;
  void *v25;
  NSSet *v26;
  NSSet *emergencyMediaItems;
  NSString *v28;
  NSString *audioCategory;
  NSString *v30;
  NSString *audioMode;
  void *v32;
  NSDictionary *v33;
  NSDictionary *endedReasonUserInfo;
  void *v35;
  NSString *v36;
  NSString *endedErrorString;
  void *v38;
  NSString *v39;
  NSString *endedReasonString;
  NSData *v41;
  NSData *localFrequency;
  NSData *v43;
  NSData *remoteFrequency;
  float v45;
  float v46;
  NSUUID *v47;
  NSUUID *callGroupUUID;
  void *v49;
  NSDictionary *v50;
  NSDictionary *providerContext;
  void *v52;
  TUCallDisplayContext *v53;
  TUCallDisplayContext *displayContext;
  void *v55;
  NSSet *v56;
  NSSet *remoteParticipantHandles;
  NSUUID *v58;
  NSUUID *localSenderIdentityUUID;
  NSUUID *v60;
  NSUUID *localSenderIdentityAccountUUID;
  TUCallScreenShareAttributes *v62;
  TUCallScreenShareAttributes *screenShareAttributes;
  TUMediaTokens *v64;
  TUMediaTokens *tokens;
  NSString *v66;
  NSString *localMemberHandleValue;
  NSURL *v68;
  NSURL *channelImageURL;
  void *v70;
  uint64_t v71;
  objc_super v72;

  v72.receiver = self;
  v72.super_class = (Class)TUProxyCall;
  v4 = a3;
  -[TUCall updateWithCall:](&v72, sel_updateWithCall_, v4);
  objc_msgSend(v4, "activeRemoteParticipant", v72.receiver, v72.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (TUParticipant *)objc_msgSend(v5, "copy");
  activeRemoteParticipant = self->_activeRemoteParticipant;
  self->_activeRemoteParticipant = v6;

  objc_msgSend(v4, "announceProviderIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (NSString *)objc_msgSend(v8, "copy");
  announceProviderIdentifier = self->_announceProviderIdentifier;
  self->_announceProviderIdentifier = v9;

  objc_msgSend(v4, "handle");
  v11 = (TUHandle *)objc_claimAutoreleasedReturnValue();
  handle = self->_handle;
  self->_handle = v11;

  objc_msgSend(v4, "isoCountryCode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (NSString *)objc_msgSend(v13, "copy");
  isoCountryCode = self->_isoCountryCode;
  self->_isoCountryCode = v14;

  objc_msgSend(v4, "provider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "base");
  v17 = (TUCallProvider *)objc_claimAutoreleasedReturnValue();
  provider = self->_provider;
  self->_provider = v17;

  self->_callStatus = objc_msgSend(v4, "callStatus");
  objc_msgSend(v4, "callerNameFromNetwork");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (NSString *)objc_msgSend(v19, "copy");
  callerNameFromNetwork = self->_callerNameFromNetwork;
  self->_callerNameFromNetwork = v20;

  self->_outgoing = objc_msgSend(v4, "isOutgoing");
  self->_voicemail = objc_msgSend(v4, "isVoicemail");
  self->_hostedOnCurrentDevice = objc_msgSend(v4, "isHostedOnCurrentDevice");
  objc_msgSend(v4, "callUUID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (NSString *)objc_msgSend(v22, "copy");
  callUUID = self->_callUUID;
  self->_callUUID = v23;

  self->_isVideo = objc_msgSend(v4, "isVideo");
  self->_thirdPartyVideo = objc_msgSend(v4, "isThirdPartyVideo");
  self->_isSendingAudio = objc_msgSend(v4, "isSendingAudio");
  self->_isSendingVideo = objc_msgSend(v4, "isSendingVideo");
  self->_blocked = objc_msgSend(v4, "isBlocked");
  self->_emergency = objc_msgSend(v4, "isEmergency");
  self->_hasEmergencyVideoStream = objc_msgSend(v4, "hasEmergencyVideoStream");
  objc_msgSend(v4, "emergencyMediaItems");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (NSSet *)objc_msgSend(v25, "copy");
  emergencyMediaItems = self->_emergencyMediaItems;
  self->_emergencyMediaItems = v26;

  self->_failureExpected = objc_msgSend(v4, "isFailureExpected");
  self->_international = objc_msgSend(v4, "isInternational");
  self->_domestic = objc_msgSend(v4, "isDomestic");
  self->_sos = objc_msgSend(v4, "isSOS");
  self->_supportsEmergencyFallback = objc_msgSend(v4, "supportsEmergencyFallback");
  self->_usingBaseband = objc_msgSend(v4, "isUsingBaseband");
  self->_ttyType = objc_msgSend(v4, "ttyType");
  self->_bluetoothAudioFormat = objc_msgSend(v4, "bluetoothAudioFormat");
  self->_mixesVoiceWithMedia = objc_msgSend(v4, "mixesVoiceWithMedia");
  self->_supportsTTYWithVoice = objc_msgSend(v4, "supportsTTYWithVoice");
  objc_msgSend(v4, "audioCategory");
  v28 = (NSString *)objc_claimAutoreleasedReturnValue();
  audioCategory = self->_audioCategory;
  self->_audioCategory = v28;

  objc_msgSend(v4, "audioMode");
  v30 = (NSString *)objc_claimAutoreleasedReturnValue();
  audioMode = self->_audioMode;
  self->_audioMode = v30;

  self->_needsManualInCallSounds = objc_msgSend(v4, "needsManualInCallSounds");
  objc_msgSend(v4, "endedReasonUserInfo");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (NSDictionary *)objc_msgSend(v32, "copy");
  endedReasonUserInfo = self->_endedReasonUserInfo;
  self->_endedReasonUserInfo = v33;

  objc_msgSend(v4, "endedErrorString");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (NSString *)objc_msgSend(v35, "copy");
  endedErrorString = self->_endedErrorString;
  self->_endedErrorString = v36;

  objc_msgSend(v4, "endedReasonString");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (NSString *)objc_msgSend(v38, "copy");
  endedReasonString = self->_endedReasonString;
  self->_endedReasonString = v39;

  self->_uplinkMuted = objc_msgSend(v4, "isUplinkMuted");
  self->_downlinkMuted = objc_msgSend(v4, "isDownlinkMuted");
  self->_callRelaySupport = objc_msgSend(v4, "callRelaySupport");
  objc_msgSend(v4, "localFrequency");
  v41 = (NSData *)objc_claimAutoreleasedReturnValue();
  localFrequency = self->_localFrequency;
  self->_localFrequency = v41;

  objc_msgSend(v4, "remoteFrequency");
  v43 = (NSData *)objc_claimAutoreleasedReturnValue();
  remoteFrequency = self->_remoteFrequency;
  self->_remoteFrequency = v43;

  objc_msgSend(v4, "localMeterLevel");
  self->_localMeterLevel = v45;
  objc_msgSend(v4, "remoteMeterLevel");
  self->_remoteMeterLevel = v46;
  objc_msgSend(v4, "callGroupUUID");
  v47 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  callGroupUUID = self->_callGroupUUID;
  self->_callGroupUUID = v47;

  objc_msgSend(v4, "providerContext");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = (NSDictionary *)objc_msgSend(v49, "copy");
  providerContext = self->_providerContext;
  self->_providerContext = v50;

  objc_msgSend(v4, "displayContext");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = (TUCallDisplayContext *)objc_msgSend(v52, "copy");
  displayContext = self->_displayContext;
  self->_displayContext = v53;

  objc_msgSend(v4, "remoteParticipantHandles");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = (NSSet *)objc_msgSend(v55, "copy");
  remoteParticipantHandles = self->_remoteParticipantHandles;
  self->_remoteParticipantHandles = v56;

  self->_remoteUplinkMuted = objc_msgSend(v4, "isRemoteUplinkMuted");
  objc_msgSend(v4, "localSenderIdentityUUID");
  v58 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  localSenderIdentityUUID = self->_localSenderIdentityUUID;
  self->_localSenderIdentityUUID = v58;

  objc_msgSend(v4, "localSenderIdentityAccountUUID");
  v60 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  localSenderIdentityAccountUUID = self->_localSenderIdentityAccountUUID;
  self->_localSenderIdentityAccountUUID = v60;

  self->_shouldSuppressInCallUI = objc_msgSend(v4, "shouldSuppressInCallUI");
  self->_mutuallyExclusiveCall = objc_msgSend(v4, "isMutuallyExclusiveCall");
  self->_wantsStagingArea = objc_msgSend(v4, "wantsStagingArea");
  self->_inputAudioPowerSpectrumToken = objc_msgSend(v4, "inputAudioPowerSpectrumToken");
  self->_outputAudioPowerSpectrumToken = objc_msgSend(v4, "outputAudioPowerSpectrumToken");
  self->_isReRing = objc_msgSend(v4, "isReRing");
  self->_originatingUIType = objc_msgSend(v4, "originatingUIType");
  self->_sharingScreen = objc_msgSend(v4, "isSharingScreen");
  self->_conversation = objc_msgSend(v4, "isConversation");
  objc_msgSend(v4, "screenShareAttributes");
  v62 = (TUCallScreenShareAttributes *)objc_claimAutoreleasedReturnValue();
  screenShareAttributes = self->_screenShareAttributes;
  self->_screenShareAttributes = v62;

  objc_msgSend(v4, "tokens");
  v64 = (TUMediaTokens *)objc_claimAutoreleasedReturnValue();
  tokens = self->_tokens;
  self->_tokens = v64;

  objc_msgSend(v4, "localMemberHandleValue");
  v66 = (NSString *)objc_claimAutoreleasedReturnValue();
  localMemberHandleValue = self->_localMemberHandleValue;
  self->_localMemberHandleValue = v66;

  self->_serviceStatus = objc_msgSend(v4, "serviceStatus");
  self->_transmissionMode = objc_msgSend(v4, "transmissionMode");
  self->_accessoryButtonEventsEnabled = objc_msgSend(v4, "accessoryButtonEventsEnabled");
  self->_receivingTransmission = objc_msgSend(v4, "isReceivingTransmission");
  self->_sendingTransmission = objc_msgSend(v4, "isSendingTransmission");
  self->_ptt = objc_msgSend(v4, "isPTT");
  objc_msgSend(v4, "channelImageURL");
  v68 = (NSURL *)objc_claimAutoreleasedReturnValue();
  channelImageURL = self->_channelImageURL;
  self->_channelImageURL = v68;

  self->_recordingAvailability = objc_msgSend(v4, "recordingAvailability");
  self->_supportsScreening = objc_msgSend(v4, "supportsScreening");
  self->_screenSharingIntention = objc_msgSend(v4, "screenSharingIntention");
  self->_screenSharingType = objc_msgSend(v4, "screenSharingType");
  objc_msgSend(v4, "videoCallAttributes");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUProxyCall _updateVideoCallAttributes:](self, "_updateVideoCallAttributes:", v70);

  v71 = objc_msgSend(v4, "videoStreamToken");
  -[TUProxyCall _updateVideoStreamToken:](self, "_updateVideoStreamToken:", v71);
}

- (void)disconnectWithReason:(int)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)TUProxyCall;
  -[TUCall disconnectWithReason:](&v8, sel_disconnectWithReason_);
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v10 = a3;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "disconnectWithReason: reason: %d", buf, 8u);
  }

  -[TUProxyCall proxyCallActionsDelegate](self, "proxyCallActionsDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCall uniqueProxyIdentifier](self, "uniqueProxyIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "disconnectCallWithUniqueProxyIdentifier:", v7);

}

- (void)playDTMFToneForKey:(unsigned __int8)a3
{
  uint64_t v3;
  void *v5;
  id v6;

  v3 = a3;
  -[TUProxyCall proxyCallActionsDelegate](self, "proxyCallActionsDelegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[TUCall uniqueProxyIdentifier](self, "uniqueProxyIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "playDTMFToneForCallWithUniqueProxyIdentifier:key:", v5, v3);

}

- (void)answerWithRequest:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TUProxyCall;
  v4 = a3;
  -[TUCall answerWithRequest:](&v6, sel_answerWithRequest_, v4);
  -[TUProxyCall proxyCallActionsDelegate](self, "proxyCallActionsDelegate", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "answerCallWithRequest:", v4);

}

- (void)setDisconnectedReason:(int)a3
{
  NSObject *v5;
  void *v6;
  _QWORD v7[5];
  int v8;
  uint8_t buf[4];
  const __CFString *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  __int16 v15;
  TUProxyCall *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (-[TUCall disconnectedReason](self, "disconnectedReason") != a3)
  {
    TUDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      v10 = CFSTR("disconnectedReason");
      v11 = 1024;
      v12 = -[TUCall disconnectedReason](self, "disconnectedReason");
      v13 = 1024;
      v14 = a3;
      v15 = 2112;
      v16 = self;
      _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "Asked to set %@ from %d to %d for %@. Posting necessary notifications and updating daemon", buf, 0x22u);
    }

    -[TUCall callNotificationManager](self, "callNotificationManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __37__TUProxyCall_setDisconnectedReason___block_invoke;
    v7[3] = &unk_1E38A2178;
    v8 = a3;
    v7[4] = self;
    objc_msgSend(v6, "postNotificationsForCall:afterUpdatesInBlock:", self, v7);

  }
}

void __37__TUProxyCall_setDisconnectedReason___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD aBlock[5];
  objc_super v6;

  v2 = *(unsigned int *)(a1 + 40);
  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)TUProxyCall;
  objc_msgSendSuper2(&v6, sel_setDisconnectedReason_, v2);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __37__TUProxyCall_setDisconnectedReason___block_invoke_2;
  aBlock[3] = &unk_1E38A1360;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v3 = _Block_copy(aBlock);
  v4 = v3;
  if (v3)
    (*((void (**)(void *))v3 + 2))(v3);

}

uint64_t __37__TUProxyCall_setDisconnectedReason___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateProxyCallWithDaemon");
}

- (void)setShouldSuppressRingtone:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];
  BOOL v8;
  uint8_t buf[4];
  const __CFString *v10;
  __int16 v11;
  _BOOL4 v12;
  __int16 v13;
  _BOOL4 v14;
  __int16 v15;
  TUProxyCall *v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  if (-[TUCall shouldSuppressRingtone](self, "shouldSuppressRingtone") != a3)
  {
    TUDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      v10 = CFSTR("shouldSuppressRingtone");
      v11 = 1024;
      v12 = -[TUCall shouldSuppressRingtone](self, "shouldSuppressRingtone");
      v13 = 1024;
      v14 = v3;
      v15 = 2112;
      v16 = self;
      _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "Asked to set %@ from %d to %d for %@. Posting necessary notifications and updating daemon", buf, 0x22u);
    }

    -[TUCall callNotificationManager](self, "callNotificationManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __41__TUProxyCall_setShouldSuppressRingtone___block_invoke;
    v7[3] = &unk_1E38A19E0;
    v8 = v3;
    v7[4] = self;
    objc_msgSend(v6, "postNotificationsForCall:afterUpdatesInBlock:", self, v7);

  }
}

void __41__TUProxyCall_setShouldSuppressRingtone___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD aBlock[5];
  objc_super v6;

  v2 = *(unsigned __int8 *)(a1 + 40);
  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)TUProxyCall;
  objc_msgSendSuper2(&v6, sel_setShouldSuppressRingtone_, v2);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __41__TUProxyCall_setShouldSuppressRingtone___block_invoke_2;
  aBlock[3] = &unk_1E38A1360;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v3 = _Block_copy(aBlock);
  v4 = v3;
  if (v3)
    (*((void (**)(void *))v3 + 2))(v3);

}

uint64_t __41__TUProxyCall_setShouldSuppressRingtone___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateProxyCallWithDaemon");
}

- (void)setWantsHoldMusic:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];
  BOOL v8;
  uint8_t buf[4];
  const __CFString *v10;
  __int16 v11;
  _BOOL4 v12;
  __int16 v13;
  _BOOL4 v14;
  __int16 v15;
  TUProxyCall *v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  if (-[TUCall wantsHoldMusic](self, "wantsHoldMusic") != a3)
  {
    TUDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      v10 = CFSTR("wantsHoldMusic");
      v11 = 1024;
      v12 = -[TUCall wantsHoldMusic](self, "wantsHoldMusic");
      v13 = 1024;
      v14 = v3;
      v15 = 2112;
      v16 = self;
      _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "Asked to set %@ from %d to %d for %@. Posting necessary notifications and updating daemon", buf, 0x22u);
    }

    -[TUCall callNotificationManager](self, "callNotificationManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __33__TUProxyCall_setWantsHoldMusic___block_invoke;
    v7[3] = &unk_1E38A19E0;
    v8 = v3;
    v7[4] = self;
    objc_msgSend(v6, "postNotificationsForCall:afterUpdatesInBlock:", self, v7);

  }
}

void __33__TUProxyCall_setWantsHoldMusic___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  _QWORD aBlock[5];
  objc_super v6;

  v2 = *(unsigned __int8 *)(a1 + 40);
  v6.receiver = *(id *)(a1 + 32);
  v6.super_class = (Class)TUProxyCall;
  objc_msgSendSuper2(&v6, sel_setWantsHoldMusic_, v2);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __33__TUProxyCall_setWantsHoldMusic___block_invoke_2;
  aBlock[3] = &unk_1E38A1360;
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v3 = _Block_copy(aBlock);
  v4 = v3;
  if (v3)
    (*((void (**)(void *))v3 + 2))(v3);

}

uint64_t __33__TUProxyCall_setWantsHoldMusic___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateProxyCallWithDaemon");
}

- (void)setEndpointOnCurrentDevice:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];
  BOOL v8;
  uint8_t buf[4];
  const __CFString *v10;
  __int16 v11;
  _BOOL4 v12;
  __int16 v13;
  _BOOL4 v14;
  __int16 v15;
  TUProxyCall *v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  if (-[TUCall isEndpointOnCurrentDevice](self, "isEndpointOnCurrentDevice") != a3)
  {
    TUDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      v10 = CFSTR("isEndpointOnCurrentDevice");
      v11 = 1024;
      v12 = -[TUCall isEndpointOnCurrentDevice](self, "isEndpointOnCurrentDevice");
      v13 = 1024;
      v14 = v3;
      v15 = 2112;
      v16 = self;
      _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "Asked to set %@ from %d to %d for %@. Posting necessary notifications", buf, 0x22u);
    }

    -[TUCall callNotificationManager](self, "callNotificationManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __42__TUProxyCall_setEndpointOnCurrentDevice___block_invoke;
    v7[3] = &unk_1E38A19E0;
    v8 = v3;
    v7[4] = self;
    objc_msgSend(v6, "postNotificationsForCall:afterUpdatesInBlock:", self, v7);

  }
}

id __42__TUProxyCall_setEndpointOnCurrentDevice___block_invoke(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(unsigned __int8 *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)TUProxyCall;
  return objc_msgSendSuper2(&v3, sel_setEndpointOnCurrentDevice_, v1);
}

- (void)setScreening:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];
  BOOL v8;
  uint8_t buf[4];
  const __CFString *v10;
  __int16 v11;
  _BOOL4 v12;
  __int16 v13;
  _BOOL4 v14;
  __int16 v15;
  TUProxyCall *v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  if (-[TUCall isScreening](self, "isScreening") != a3)
  {
    TUDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      v10 = CFSTR("isScreening");
      v11 = 1024;
      v12 = -[TUCall isScreening](self, "isScreening");
      v13 = 1024;
      v14 = v3;
      v15 = 2112;
      v16 = self;
      _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "Asked to set %@ from %d to %d for %@. Posting necessary notifications", buf, 0x22u);
    }

    -[TUCall callNotificationManager](self, "callNotificationManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __28__TUProxyCall_setScreening___block_invoke;
    v7[3] = &unk_1E38A19E0;
    v8 = v3;
    v7[4] = self;
    objc_msgSend(v6, "postNotificationsForCall:afterUpdatesInBlock:", self, v7);

  }
}

id __28__TUProxyCall_setScreening___block_invoke(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(unsigned __int8 *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)TUProxyCall;
  return objc_msgSendSuper2(&v3, sel_setScreening_, v1);
}

- (void)setTransitionStatus:(int)a3
{
  NSObject *v5;
  void *v6;
  _QWORD v7[5];
  int v8;
  uint8_t buf[4];
  const __CFString *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  __int16 v15;
  TUProxyCall *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (-[TUCall transitionStatus](self, "transitionStatus") != a3)
  {
    TUDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      v10 = CFSTR("transitionStatus");
      v11 = 1024;
      v12 = -[TUCall transitionStatus](self, "transitionStatus");
      v13 = 1024;
      v14 = a3;
      v15 = 2112;
      v16 = self;
      _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "Asked to set %@ from %d to %d for %@. Posting necessary notifications", buf, 0x22u);
    }

    -[TUCall callNotificationManager](self, "callNotificationManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __35__TUProxyCall_setTransitionStatus___block_invoke;
    v7[3] = &unk_1E38A2178;
    v8 = a3;
    v7[4] = self;
    objc_msgSend(v6, "postNotificationsForCall:afterUpdatesInBlock:", self, v7);

  }
}

id __35__TUProxyCall_setTransitionStatus___block_invoke(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(unsigned int *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)TUProxyCall;
  return objc_msgSendSuper2(&v3, sel_setTransitionStatus_, v1);
}

- (void)setVideoPaused:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _BOOL4 videoPaused;
  void *v7;
  _QWORD v8[5];
  BOOL v9;
  uint8_t buf[4];
  const __CFString *v11;
  __int16 v12;
  _BOOL4 v13;
  __int16 v14;
  _BOOL4 v15;
  __int16 v16;
  TUProxyCall *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (self->_videoPaused != a3)
  {
    v3 = a3;
    TUDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      videoPaused = self->_videoPaused;
      *(_DWORD *)buf = 138413058;
      v11 = CFSTR("videoPaused");
      v12 = 1024;
      v13 = videoPaused;
      v14 = 1024;
      v15 = v3;
      v16 = 2112;
      v17 = self;
      _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "Asked to set %@ from %d to %d for %@. Posting necessary notifications", buf, 0x22u);
    }

    -[TUCall callNotificationManager](self, "callNotificationManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __30__TUProxyCall_setVideoPaused___block_invoke;
    v8[3] = &unk_1E38A19E0;
    v8[4] = self;
    v9 = v3;
    objc_msgSend(v7, "postNotificationsForCall:afterUpdatesInBlock:", self, v8);

  }
}

uint64_t __30__TUProxyCall_setVideoPaused___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 507) = *(_BYTE *)(result + 40);
  return result;
}

- (void)setMediaStalled:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _BOOL4 mediaStalled;
  void *v7;
  _QWORD v8[5];
  BOOL v9;
  uint8_t buf[4];
  const __CFString *v11;
  __int16 v12;
  _BOOL4 v13;
  __int16 v14;
  _BOOL4 v15;
  __int16 v16;
  TUProxyCall *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (self->_mediaStalled != a3)
  {
    v3 = a3;
    TUDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      mediaStalled = self->_mediaStalled;
      *(_DWORD *)buf = 138413058;
      v11 = CFSTR("mediaStalled");
      v12 = 1024;
      v13 = mediaStalled;
      v14 = 1024;
      v15 = v3;
      v16 = 2112;
      v17 = self;
      _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "Asked to set %@ from %d to %d for %@. Posting necessary notifications", buf, 0x22u);
    }

    -[TUCall callNotificationManager](self, "callNotificationManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __31__TUProxyCall_setMediaStalled___block_invoke;
    v8[3] = &unk_1E38A19E0;
    v8[4] = self;
    v9 = v3;
    objc_msgSend(v7, "postNotificationsForCall:afterUpdatesInBlock:", self, v8);

  }
}

uint64_t __31__TUProxyCall_setMediaStalled___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 505) = *(_BYTE *)(result + 40);
  return result;
}

- (void)setVideoDegraded:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _BOOL4 videoDegraded;
  void *v7;
  _QWORD v8[5];
  BOOL v9;
  uint8_t buf[4];
  const __CFString *v11;
  __int16 v12;
  _BOOL4 v13;
  __int16 v14;
  _BOOL4 v15;
  __int16 v16;
  TUProxyCall *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (self->_videoDegraded != a3)
  {
    v3 = a3;
    TUDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      videoDegraded = self->_videoDegraded;
      *(_DWORD *)buf = 138413058;
      v11 = CFSTR("videoDegraded");
      v12 = 1024;
      v13 = videoDegraded;
      v14 = 1024;
      v15 = v3;
      v16 = 2112;
      v17 = self;
      _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "Asked to set %@ from %d to %d for %@. Posting necessary notifications", buf, 0x22u);
    }

    -[TUCall callNotificationManager](self, "callNotificationManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __32__TUProxyCall_setVideoDegraded___block_invoke;
    v8[3] = &unk_1E38A19E0;
    v8[4] = self;
    v9 = v3;
    objc_msgSend(v7, "postNotificationsForCall:afterUpdatesInBlock:", self, v8);

  }
}

uint64_t __32__TUProxyCall_setVideoDegraded___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 506) = *(_BYTE *)(result + 40);
  return result;
}

- (void)setUplinkMuted:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];
  BOOL v8;
  uint8_t buf[4];
  _BOOL4 v10;
  __int16 v11;
  _BOOL4 v12;
  __int16 v13;
  TUProxyCall *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_uplinkMuted != a3)
  {
    v3 = a3;
    TUDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109634;
      v10 = -[TUProxyCall isUplinkMuted](self, "isUplinkMuted");
      v11 = 1024;
      v12 = v3;
      v13 = 2112;
      v14 = self;
      _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "Asked to set uplinkMuted from %d to %d for %@. Posting necessary notifications and updating daemon", buf, 0x18u);
    }

    -[TUCall callNotificationManager](self, "callNotificationManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __30__TUProxyCall_setUplinkMuted___block_invoke;
    v7[3] = &unk_1E38A19E0;
    v7[4] = self;
    v8 = v3;
    objc_msgSend(v6, "postNotificationsForCall:afterUpdatesInBlock:", self, v7);

  }
}

void __30__TUProxyCall_setUplinkMuted___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[5];
  char v4;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 520) = *(_BYTE *)(a1 + 40);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __30__TUProxyCall_setUplinkMuted___block_invoke_2;
  v3[3] = &unk_1E38A19E0;
  v3[4] = *(_QWORD *)(a1 + 32);
  v4 = *(_BYTE *)(a1 + 40);
  v1 = _Block_copy(v3);
  v2 = v1;
  if (v1)
    (*((void (**)(void *))v1 + 2))(v1);

}

void __30__TUProxyCall_setUplinkMuted___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "proxyCallActionsDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(unsigned __int8 *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "uniqueProxyIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUplinkMuted:forCallWithUniqueProxyIdentifier:", v2, v3);

}

- (void)setDownlinkMuted:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];
  BOOL v8;
  uint8_t buf[4];
  _BOOL4 v10;
  __int16 v11;
  _BOOL4 v12;
  __int16 v13;
  TUProxyCall *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_downlinkMuted != a3)
  {
    v3 = a3;
    TUDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109634;
      v10 = -[TUProxyCall isDownlinkMuted](self, "isDownlinkMuted");
      v11 = 1024;
      v12 = v3;
      v13 = 2112;
      v14 = self;
      _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "Asked to set downlinkMuted from %d to %d for %@. Posting necessary notifications and updating daemon", buf, 0x18u);
    }

    -[TUCall callNotificationManager](self, "callNotificationManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __32__TUProxyCall_setDownlinkMuted___block_invoke;
    v7[3] = &unk_1E38A19E0;
    v7[4] = self;
    v8 = v3;
    objc_msgSend(v6, "postNotificationsForCall:afterUpdatesInBlock:", self, v7);

  }
}

void __32__TUProxyCall_setDownlinkMuted___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[5];
  char v4;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 521) = *(_BYTE *)(a1 + 40);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __32__TUProxyCall_setDownlinkMuted___block_invoke_2;
  v3[3] = &unk_1E38A19E0;
  v3[4] = *(_QWORD *)(a1 + 32);
  v4 = *(_BYTE *)(a1 + 40);
  v1 = _Block_copy(v3);
  v2 = v1;
  if (v1)
    (*((void (**)(void *))v1 + 2))(v1);

}

void __32__TUProxyCall_setDownlinkMuted___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "proxyCallActionsDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(unsigned __int8 *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "uniqueProxyIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDownlinkMuted:forCallWithUniqueProxyIdentifier:", v2, v3);

}

- (void)addScreenSharingType:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  _QWORD v7[6];
  uint8_t buf[4];
  unint64_t v9;
  __int16 v10;
  unint64_t v11;
  __int16 v12;
  TUProxyCall *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_screenSharingType != a3)
  {
    TUDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      v9 = a3;
      v10 = 2048;
      v11 = -[TUProxyCall screenSharingType](self, "screenSharingType");
      v12 = 2112;
      v13 = self;
      _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "Asked to add %lu to screenSharingType %lu for %@. Posting necessary notifications and updating daemon", buf, 0x20u);
    }

    -[TUCall callNotificationManager](self, "callNotificationManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __36__TUProxyCall_addScreenSharingType___block_invoke;
    v7[3] = &unk_1E38A1D10;
    v7[4] = self;
    v7[5] = a3;
    objc_msgSend(v6, "postNotificationsForCall:afterUpdatesInBlock:", self, v7);

  }
}

void __36__TUProxyCall_addScreenSharingType___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD v4[6];

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 848) = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __36__TUProxyCall_addScreenSharingType___block_invoke_2;
  v4[3] = &unk_1E38A1D10;
  v1 = *(_QWORD *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v4[5] = v1;
  v2 = _Block_copy(v4);
  v3 = v2;
  if (v2)
    (*((void (**)(void *))v2 + 2))(v2);

}

void __36__TUProxyCall_addScreenSharingType___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "proxyCallActionsDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "uniqueProxyIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addScreenSharingType:forCallWithUniqueProxyIdentifier:", v2, v3);

}

- (void)setIsSendingVideo:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];
  BOOL v8;
  uint8_t buf[4];
  _BOOL4 v10;
  __int16 v11;
  _BOOL4 v12;
  __int16 v13;
  TUProxyCall *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (self->_isSendingVideo != a3)
  {
    v3 = a3;
    TUDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109634;
      v10 = -[TUProxyCall isSendingVideo](self, "isSendingVideo");
      v11 = 1024;
      v12 = v3;
      v13 = 2112;
      v14 = self;
      _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "Asked to set isSendingVideo from %d to %d for %@. Posting necessary notifications and updating daemon", buf, 0x18u);
    }

    -[TUCall callNotificationManager](self, "callNotificationManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __33__TUProxyCall_setIsSendingVideo___block_invoke;
    v7[3] = &unk_1E38A19E0;
    v7[4] = self;
    v8 = v3;
    objc_msgSend(v6, "postNotificationsForCall:afterUpdatesInBlock:", self, v7);

  }
}

void __33__TUProxyCall_setIsSendingVideo___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[5];
  char v4;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 504) = *(_BYTE *)(a1 + 40);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __33__TUProxyCall_setIsSendingVideo___block_invoke_2;
  v3[3] = &unk_1E38A19E0;
  v3[4] = *(_QWORD *)(a1 + 32);
  v4 = *(_BYTE *)(a1 + 40);
  v1 = _Block_copy(v3);
  v2 = v1;
  if (v1)
    (*((void (**)(void *))v1 + 2))(v1);

}

void __33__TUProxyCall_setIsSendingVideo___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "proxyCallActionsDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(unsigned __int8 *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "uniqueProxyIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsSendingVideo:forCallWithUniqueProxyIdentifier:", v2, v3);

}

- (void)setSharingScreen:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _BOOL4 sharingScreen;
  void *v7;
  _QWORD v8[5];
  BOOL v9;
  uint8_t buf[4];
  _BOOL4 v11;
  __int16 v12;
  _BOOL4 v13;
  __int16 v14;
  TUProxyCall *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (self->_sharingScreen != a3)
  {
    v3 = a3;
    TUDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      sharingScreen = self->_sharingScreen;
      *(_DWORD *)buf = 67109634;
      v11 = sharingScreen;
      v12 = 1024;
      v13 = v3;
      v14 = 2112;
      v15 = self;
      _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "Asked to set sharingScreen from %d to %d for %@. Posting necessary notifications and updating daemon", buf, 0x18u);
    }

    -[TUCall callNotificationManager](self, "callNotificationManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __32__TUProxyCall_setSharingScreen___block_invoke;
    v8[3] = &unk_1E38A19E0;
    v8[4] = self;
    v9 = v3;
    objc_msgSend(v7, "postNotificationsForCall:afterUpdatesInBlock:", self, v8);

  }
}

void __32__TUProxyCall_setSharingScreen___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[5];
  char v4;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 528) = *(_BYTE *)(a1 + 40);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __32__TUProxyCall_setSharingScreen___block_invoke_2;
  v3[3] = &unk_1E38A19E0;
  v3[4] = *(_QWORD *)(a1 + 32);
  v4 = *(_BYTE *)(a1 + 40);
  v1 = _Block_copy(v3);
  v2 = v1;
  if (v1)
    (*((void (**)(void *))v1 + 2))(v1);

}

void __32__TUProxyCall_setSharingScreen___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "proxyCallActionsDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(unsigned __int8 *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "uniqueProxyIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSharingScreen:forCallWithUniqueProxyIdentifier:", v2, v3);

}

- (void)setMixesVoiceWithMedia:(BOOL)a3
{
  int v3;
  int mixesVoiceWithMedia;
  NSObject *v6;
  _BOOL4 v7;
  _BOOL4 v8;
  _QWORD v9[5];
  char v10;
  uint8_t buf[4];
  _BOOL4 v12;
  __int16 v13;
  int v14;
  __int16 v15;
  TUProxyCall *v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  mixesVoiceWithMedia = self->_mixesVoiceWithMedia;
  TUDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (mixesVoiceWithMedia == v3)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19A50D000, v6, OS_LOG_TYPE_DEFAULT, "[WARN] Wrong use of API", buf, 2u);
    }
  }
  else
  {
    if (v7)
    {
      v8 = self->_mixesVoiceWithMedia;
      *(_DWORD *)buf = 67109634;
      v12 = v8;
      v13 = 1024;
      v14 = v3;
      v15 = 2112;
      v16 = self;
      _os_log_impl(&dword_19A50D000, v6, OS_LOG_TYPE_DEFAULT, "Asked to set mixesVoiceWithMedia from %d to %d for self: %@. Posting necessary notifications and updating daemon", buf, 0x18u);
    }

    -[TUCall callNotificationManager](self, "callNotificationManager");
    v6 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __38__TUProxyCall_setMixesVoiceWithMedia___block_invoke;
    v9[3] = &unk_1E38A19E0;
    v9[4] = self;
    v10 = v3;
    -[NSObject postNotificationsForCall:afterUpdatesInBlock:](v6, "postNotificationsForCall:afterUpdatesInBlock:", self, v9);
  }

}

void __38__TUProxyCall_setMixesVoiceWithMedia___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[5];
  char v4;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 533) = *(_BYTE *)(a1 + 40);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __38__TUProxyCall_setMixesVoiceWithMedia___block_invoke_2;
  v3[3] = &unk_1E38A19E0;
  v3[4] = *(_QWORD *)(a1 + 32);
  v4 = *(_BYTE *)(a1 + 40);
  v1 = _Block_copy(v3);
  v2 = v1;
  if (v1)
    (*((void (**)(void *))v1 + 2))(v1);

}

void __38__TUProxyCall_setMixesVoiceWithMedia___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "proxyCallActionsDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(unsigned __int8 *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "uniqueProxyIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMixesVoiceWithMedia:forCallWithUniqueProxyIdentifier:", v2, v3);

}

- (void)setSharingScreen:(BOOL)a3 attributes:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  NSObject *v8;
  _BOOL4 sharingScreen;
  void *v10;
  _QWORD v11[5];
  id v12;
  BOOL v13;
  uint8_t buf[4];
  _BOOL4 v15;
  __int16 v16;
  int v17;
  __int16 v18;
  id v19;
  __int16 v20;
  TUProxyCall *v21;
  uint64_t v22;

  v4 = a3;
  v22 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (v4 && !self->_sharingScreen)
  {
    TUDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      sharingScreen = self->_sharingScreen;
      *(_DWORD *)buf = 67109890;
      v15 = sharingScreen;
      v16 = 1024;
      v17 = 1;
      v18 = 2112;
      v19 = v6;
      v20 = 2112;
      v21 = self;
      _os_log_impl(&dword_19A50D000, v8, OS_LOG_TYPE_DEFAULT, "Asked to set sharingScreen from %d to %d attributes: %@ for %@. Posting necessary notifications and updating daemon", buf, 0x22u);
    }

    -[TUCall callNotificationManager](self, "callNotificationManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __43__TUProxyCall_setSharingScreen_attributes___block_invoke;
    v11[3] = &unk_1E38A26F0;
    v11[4] = self;
    v13 = v4;
    v12 = v6;
    objc_msgSend(v10, "postNotificationsForCall:afterUpdatesInBlock:", self, v11);

  }
  else
  {
    TUDefaultLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19A50D000, v7, OS_LOG_TYPE_DEFAULT, "[WARN] Wrong use of API", buf, 2u);
    }

  }
}

void __43__TUProxyCall_setSharingScreen_attributes___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  _QWORD aBlock[5];
  id v5;
  char v6;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 528) = *(_BYTE *)(a1 + 48);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __43__TUProxyCall_setSharingScreen_attributes___block_invoke_2;
  aBlock[3] = &unk_1E38A26F0;
  v1 = *(void **)(a1 + 40);
  aBlock[4] = *(_QWORD *)(a1 + 32);
  v6 = *(_BYTE *)(a1 + 48);
  v5 = v1;
  v2 = _Block_copy(aBlock);
  v3 = v2;
  if (v2)
    (*((void (**)(void *))v2 + 2))(v2);

}

void __43__TUProxyCall_setSharingScreen_attributes___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "proxyCallActionsDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(unsigned __int8 *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "uniqueProxyIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSharingScreen:attributes:forCallWithUniqueProxyIdentifier:", v2, v3, v4);

}

- (void)updateProxyCallWithDaemon
{
  id v3;

  -[TUProxyCall proxyCallActionsDelegate](self, "proxyCallActionsDelegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateCallWithProxy:", self);

}

- (void)setCallDisconnectedDueToComponentCrash
{
  objc_super v3;

  -[TUProxyCall setCallStatus:](self, "setCallStatus:", 6);
  v3.receiver = self;
  v3.super_class = (Class)TUProxyCall;
  -[TUCall setDisconnectedReason:](&v3, sel_setDisconnectedReason_, 11);
}

- (void)sendHardPauseDigits
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  -[TUProxyCall proxyCallActionsDelegate](self, "proxyCallActionsDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCall uniqueProxyIdentifier](self, "uniqueProxyIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendHardPauseDigitsForCallWithUniqueProxyIdentifier:", v4);

  -[TUCall callNotificationManager](self, "callNotificationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __34__TUProxyCall_sendHardPauseDigits__block_invoke;
  v6[3] = &unk_1E38A1360;
  v6[4] = self;
  objc_msgSend(v5, "postNotificationsForCall:afterUpdatesInBlock:", self, v6);

}

uint64_t __34__TUProxyCall_sendHardPauseDigits__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setHardPauseDigitsState:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setHardPauseDigits:", 0);
}

- (void)setHasEmergencyVideoStream:(BOOL)a3
{
  int v3;
  int hasEmergencyVideoStream;
  NSObject *v6;
  _BOOL4 v7;
  _BOOL4 v8;
  _QWORD v9[5];
  char v10;
  uint8_t buf[4];
  _BOOL4 v12;
  __int16 v13;
  int v14;
  __int16 v15;
  TUProxyCall *v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  hasEmergencyVideoStream = self->_hasEmergencyVideoStream;
  TUDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (hasEmergencyVideoStream == v3)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19A50D000, v6, OS_LOG_TYPE_DEFAULT, "[WARN] Wrong use of API", buf, 2u);
    }
  }
  else
  {
    if (v7)
    {
      v8 = self->_hasEmergencyVideoStream;
      *(_DWORD *)buf = 67109634;
      v12 = v8;
      v13 = 1024;
      v14 = v3;
      v15 = 2112;
      v16 = self;
      _os_log_impl(&dword_19A50D000, v6, OS_LOG_TYPE_DEFAULT, "Asked to set hasEmergencyVideoStream from %d to %d for self: %@. Posting necessary notifications and updating daemon", buf, 0x18u);
    }

    -[TUCall callNotificationManager](self, "callNotificationManager");
    v6 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __42__TUProxyCall_setHasEmergencyVideoStream___block_invoke;
    v9[3] = &unk_1E38A19E0;
    v9[4] = self;
    v10 = v3;
    -[NSObject postNotificationsForCall:afterUpdatesInBlock:](v6, "postNotificationsForCall:afterUpdatesInBlock:", self, v9);
  }

}

void __42__TUProxyCall_setHasEmergencyVideoStream___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[5];
  char v4;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 511) = *(_BYTE *)(a1 + 40);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __42__TUProxyCall_setHasEmergencyVideoStream___block_invoke_2;
  v3[3] = &unk_1E38A19E0;
  v3[4] = *(_QWORD *)(a1 + 32);
  v4 = *(_BYTE *)(a1 + 40);
  v1 = _Block_copy(v3);
  v2 = v1;
  if (v1)
    (*((void (**)(void *))v1 + 2))(v1);

}

void __42__TUProxyCall_setHasEmergencyVideoStream___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "proxyCallActionsDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(unsigned __int8 *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "uniqueProxyIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHasEmergencyVideoStream:forCallWithUniqueProxyIdentifier:", v2, v3);

}

- (void)setEmergencyMediaItems:(id)a3
{
  id v4;
  NSObject *v5;
  NSSet *emergencyMediaItems;
  void *v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  NSSet *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  TUProxyCall *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    emergencyMediaItems = self->_emergencyMediaItems;
    *(_DWORD *)buf = 138412802;
    v12 = emergencyMediaItems;
    v13 = 2112;
    v14 = v4;
    v15 = 2112;
    v16 = self;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "Asked to set emergencyMediaItems from %@ to %@ for self: %@. Posting necessary notifications and updating daemon", buf, 0x20u);
  }

  -[TUCall callNotificationManager](self, "callNotificationManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __38__TUProxyCall_setEmergencyMediaItems___block_invoke;
  v9[3] = &unk_1E38A1388;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  objc_msgSend(v7, "postNotificationsForCall:afterUpdatesInBlock:", self, v9);

}

void __38__TUProxyCall_setEmergencyMediaItems___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 648), *(id *)(a1 + 40));
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__TUProxyCall_setEmergencyMediaItems___block_invoke_2;
  v5[3] = &unk_1E38A1388;
  v2 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v2;
  v3 = _Block_copy(v5);
  v4 = v3;
  if (v3)
    (*((void (**)(void *))v3 + 2))(v3);

}

void __38__TUProxyCall_setEmergencyMediaItems___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "proxyCallActionsDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "uniqueProxyIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEmergencyMediaItems:forCallWithUniqueProxyIdentifier:", v2, v3);

}

- (int)avcRemoteVideoModeForMode:(int64_t)a3
{
  int v3;

  if (a3 == 1)
    v3 = 0;
  else
    v3 = -1;
  if (a3 == 2)
    return 1;
  else
    return v3;
}

- (void)setRemoteVideoLayer:(id)a3 forMode:(int64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = -[TUProxyCall avcRemoteVideoModeForMode:](self, "avcRemoteVideoModeForMode:", a4);
  -[TUProxyCall remoteVideoModeToLayer](self, "remoteVideoModeToLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUProxyCall setRemoteVideoModeToLayer:](self, "setRemoteVideoModeToLayer:", v9);

  }
  TUDefaultLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412546;
    v15 = v6;
    v16 = 2048;
    v17 = (int)v7;
    _os_log_impl(&dword_19A50D000, v10, OS_LOG_TYPE_DEFAULT, "Asked to set remote video layer %@ for mode %ld", (uint8_t *)&v14, 0x16u);
  }

  -[TUProxyCall remoteVideoModeToLayer](self, "remoteVideoModeToLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v6, v12);

  if (!v6)
  {
    -[TUProxyCall remoteVideo](self, "remoteVideo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setVideoLayer:forMode:", 0, v7);

  }
  -[TUProxyCall _synchronizeRemoteVideo](self, "_synchronizeRemoteVideo");

}

- (void)setLocalVideoLayer:(id)a3 forMode:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  __int16 v15;
  int64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[TUProxyCall localVideoModeToLayer](self, "localVideoModeToLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUProxyCall setLocalVideoModeToLayer:](self, "setLocalVideoModeToLayer:", v8);

  }
  TUDefaultLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138412546;
    v14 = v6;
    v15 = 2048;
    v16 = a4;
    _os_log_impl(&dword_19A50D000, v9, OS_LOG_TYPE_DEFAULT, "Asked to set local video layer %@ for mode %ld", (uint8_t *)&v13, 0x16u);
  }

  -[TUProxyCall localVideoModeToLayer](self, "localVideoModeToLayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v6, v11);

  if (!v6)
  {
    -[TUProxyCall localVideo](self, "localVideo");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setVideoLayer:forMode:", 0, -[TUProxyCall avcRemoteVideoModeForMode:](self, "avcRemoteVideoModeForMode:", a4));

  }
  -[TUProxyCall _synchronizeLocalVideo](self, "_synchronizeLocalVideo");

}

- (void)setRequiresRemoteVideo:(BOOL)a3
{
  if (self->_requiresRemoteVideo != a3)
  {
    self->_requiresRemoteVideo = a3;
    -[TUProxyCall _synchronizeRemoteVideo](self, "_synchronizeRemoteVideo");
  }
}

- (void)_updateVideoCallAttributes:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  int v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[TUCall videoCallAttributes](self, "videoCallAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToVideoCallAttributes:", v4);

  if ((v6 & 1) == 0)
  {
    -[TUCall videoCallAttributes](self, "videoCallAttributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "localVideoContextSlotIdentifier");
    v9 = objc_msgSend(v4, "localVideoContextSlotIdentifier");

    if (v8 != v9)
      -[TUProxyCall setLocalVideo:](self, "setLocalVideo:", 0);
    -[TUCall videoCallAttributes](self, "videoCallAttributes");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "remoteVideoContextSlotIdentifier");
    v12 = objc_msgSend(v4, "remoteVideoContextSlotIdentifier");

    if (v11 != v12)
      -[TUProxyCall setRemoteVideo:](self, "setRemoteVideo:", 0);
    -[TUCall videoCallAttributes](self, "videoCallAttributes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "remoteCameraOrientation");
    v15 = objc_msgSend(v4, "remoteCameraOrientation");

    if (v14 != v15)
      -[TUProxyCall setRemoteCameraOrientation:](self, "setRemoteCameraOrientation:", objc_msgSend(v4, "remoteCameraOrientation"));
    -[TUCall setVideoCallAttributes:](self, "setVideoCallAttributes:", v4);
    TUDefaultLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412290;
      v18 = v4;
      _os_log_impl(&dword_19A50D000, v16, OS_LOG_TYPE_DEFAULT, "Updating video call attributes %@", (uint8_t *)&v17, 0xCu);
    }

    -[TUProxyCall _synchronizeLocalVideo](self, "_synchronizeLocalVideo");
    -[TUProxyCall _synchronizeRemoteVideo](self, "_synchronizeRemoteVideo");
  }

}

- (void)_updateVideoStreamToken:(int64_t)a3
{
  if (self->_videoStreamToken != a3)
  {
    self->_videoStreamToken = a3;
    -[TUProxyCall setRemoteVideo:](self, "setRemoteVideo:", 0);
    -[TUProxyCall _synchronizeRemoteVideo](self, "_synchronizeRemoteVideo");
  }
}

- (void)_synchronizeLocalVideo
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  int v15;
  void *v16;
  void *v17;
  NSObject *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  int v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[TUProxyCall localVideoModeToLayer](self, "localVideoModeToLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[TUProxyCall _createLocalVideoIfNecessary](self, "_createLocalVideoIfNecessary");
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    -[TUProxyCall localVideoModeToLayer](self, "localVideoModeToLayer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v6)
    {
      v8 = v6;
      v9 = *(_QWORD *)v21;
      *(_QWORD *)&v7 = 138412546;
      v19 = v7;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v21 != v9)
            objc_enumerationMutation(v5);
          v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
          -[TUProxyCall localVideoModeToLayer](self, "localVideoModeToLayer", v19);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          TUDefaultLog();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            v15 = objc_msgSend(v11, "intValue");
            *(_DWORD *)buf = v19;
            v25 = v13;
            v26 = 1024;
            v27 = v15;
            _os_log_impl(&dword_19A50D000, v14, OS_LOG_TYPE_DEFAULT, "Setting video layer %@ for mode %d", buf, 0x12u);
          }

          -[TUProxyCall localVideo](self, "localVideo");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setVideoLayer:forMode:", v13, objc_msgSend(v11, "intValue"));

        }
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v8);
    }

  }
  else
  {
    -[TUProxyCall localVideo](self, "localVideo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      TUDefaultLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19A50D000, v18, OS_LOG_TYPE_DEFAULT, "No layers to synchronize, set local TURemoteVideoClient to nil", buf, 2u);
      }

      -[TUProxyCall setLocalVideo:](self, "setLocalVideo:", 0);
    }
  }
}

- (void)_synchronizeRemoteVideo
{
  void *v3;
  BOOL v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  int v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  int v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  -[TUProxyCall remoteVideoModeToLayer](self, "remoteVideoModeToLayer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {

    goto LABEL_4;
  }
  v4 = -[TUProxyCall requiresRemoteVideo](self, "requiresRemoteVideo");

  if (v4)
  {
LABEL_4:
    -[TUProxyCall _createRemoteVideoIfNecessary](self, "_createRemoteVideoIfNecessary");
    -[TUProxyCall remoteVideo](self, "remoteVideo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      -[TUProxyCall remoteVideoModeToLayer](self, "remoteVideoModeToLayer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      if (v7)
      {
        v9 = v7;
        v10 = *(_QWORD *)v23;
        *(_QWORD *)&v8 = 138412546;
        v21 = v8;
        do
        {
          v11 = 0;
          do
          {
            if (*(_QWORD *)v23 != v10)
              objc_enumerationMutation(v6);
            v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v11);
            -[TUProxyCall remoteVideoModeToLayer](self, "remoteVideoModeToLayer", v21);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "objectForKeyedSubscript:", v12);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            TUDefaultLog();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              v16 = objc_msgSend(v12, "intValue");
              *(_DWORD *)buf = v21;
              v27 = v14;
              v28 = 1024;
              v29 = v16;
              _os_log_impl(&dword_19A50D000, v15, OS_LOG_TYPE_DEFAULT, "Setting video layer %@ for mode %d", buf, 0x12u);
            }

            -[TUProxyCall remoteVideo](self, "remoteVideo");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setVideoLayer:forMode:", v14, objc_msgSend(v12, "intValue"));

            ++v11;
          }
          while (v9 != v11);
          v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        }
        while (v9);
      }

    }
    else
    {
      TUDefaultLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19A50D000, v18, OS_LOG_TYPE_DEFAULT, "Client asked to synchronize remote video layers but we don't have a AVCRemoteVideoClient which is only created once we have a nonzero videoStreamToken", buf, 2u);
      }

    }
    return;
  }
  -[TUProxyCall remoteVideo](self, "remoteVideo");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    TUDefaultLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19A50D000, v20, OS_LOG_TYPE_DEFAULT, "No layers to synchronize so setting self.remoteVideo to nil", buf, 2u);
    }

    -[TUProxyCall setRemoteVideo:](self, "setRemoteVideo:", 0);
  }
}

- (void)_createLocalVideoIfNecessary
{
  void *v3;
  void *v4;
  uint64_t v5;
  TURemoteVideoClient *v6;
  TURemoteVideoClient *v7;
  id v8;

  -[TUProxyCall localVideo](self, "localVideo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[TUCall videoCallAttributes](self, "videoCallAttributes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "localVideoContextSlotIdentifier");

    if (v5)
    {
      v6 = [TURemoteVideoClient alloc];
      -[TUCall videoCallAttributes](self, "videoCallAttributes");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      v7 = -[TURemoteVideoClient initWithVideoContextSlotIdentifier:](v6, "initWithVideoContextSlotIdentifier:", objc_msgSend(v8, "localVideoContextSlotIdentifier"));
      -[TUProxyCall setLocalVideo:](self, "setLocalVideo:", v7);

    }
  }
}

- (void)_createRemoteVideoIfNecessary
{
  void *v3;
  void *v4;
  uint64_t v5;
  TURemoteVideoClient *v6;
  void *v7;
  TURemoteVideoClient *v8;
  objc_class *v9;
  NSObject *v10;
  void *v11;
  int v12;
  int64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  -[TUProxyCall remoteVideo](self, "remoteVideo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[TUCall videoCallAttributes](self, "videoCallAttributes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "remoteVideoContextSlotIdentifier");

    if (v5)
    {
      v6 = [TURemoteVideoClient alloc];
      -[TUCall videoCallAttributes](self, "videoCallAttributes");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[TURemoteVideoClient initWithVideoContextSlotIdentifier:](v6, "initWithVideoContextSlotIdentifier:", objc_msgSend(v7, "remoteVideoContextSlotIdentifier"));
      -[TUProxyCall setRemoteVideo:](self, "setRemoteVideo:", v8);

    }
    else if (-[TUProxyCall videoStreamToken](self, "videoStreamToken") >= 1)
    {
      v9 = (objc_class *)CUTWeakLinkClass();
      TUDefaultLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 134217984;
        v13 = -[TUProxyCall videoStreamToken](self, "videoStreamToken");
        _os_log_impl(&dword_19A50D000, v10, OS_LOG_TYPE_DEFAULT, "Creating AVCRemoteVideoClient with stream token %ld", (uint8_t *)&v12, 0xCu);
      }

      v11 = (void *)objc_msgSend([v9 alloc], "initWithStreamToken:delegate:", -[TUProxyCall videoStreamToken](self, "videoStreamToken"), self);
      -[TUProxyCall setRemoteVideo:](self, "setRemoteVideo:", v11);

    }
    -[TUProxyCall setMediaStalled:](self, "setMediaStalled:", 0);
    -[TUProxyCall setVideoDegraded:](self, "setVideoDegraded:", 0);
  }
}

- (CGSize)remoteScreenAspectRatio
{
  double v2;
  double v3;
  CGSize result;

  -[TUProxyCall localAspectRatioForOrientation:](self, "localAspectRatioForOrientation:", -[TUProxyCall remoteScreenOrientation](self, "remoteScreenOrientation"));
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)localAspectRatioForOrientation:(int64_t)a3
{
  double v5;
  double v6;
  CGSize result;

  if (__CUTWeakCGSizeZero__pred_CGSizeZeroCoreGraphics != -1)
    dispatch_once(&__CUTWeakCGSizeZero__pred_CGSizeZeroCoreGraphics, &__block_literal_global_50);
  if ((unint64_t)(a3 - 3) < 2)
  {
    -[TUProxyCall remoteScreenLandscapeAspectRatio](self, "remoteScreenLandscapeAspectRatio");
  }
  else if ((unint64_t)(a3 - 1) > 1)
  {
    v6 = *((double *)&__CUTStaticWeak_CGSizeZero + 1);
    v5 = *(double *)&__CUTStaticWeak_CGSizeZero;
  }
  else
  {
    -[TUProxyCall remoteScreenPortraitAspectRatio](self, "remoteScreenPortraitAspectRatio");
  }
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)setRemoteVideoPresentationSize:(CGSize)a3
{
  double height;
  double width;
  NSObject *v6;
  int64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v11;
  TUProxyCall *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;
  NSSize v16;

  height = a3.height;
  width = a3.width;
  v15 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = -[TUProxyCall videoStreamToken](self, "videoStreamToken");
    v16.width = width;
    v16.height = height;
    NSStringFromSize(v16);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 134218242;
    v12 = (TUProxyCall *)v7;
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_19A50D000, v6, OS_LOG_TYPE_DEFAULT, "self.videoStreamToken: %ld remoteVideoPresentationSize: %@", (uint8_t *)&v11, 0x16u);

  }
  if (-[TUProxyCall isVideo](self, "isVideo"))
  {
    -[TUProxyCall proxyCallActionsDelegate](self, "proxyCallActionsDelegate");
    v9 = objc_claimAutoreleasedReturnValue();
    -[TUCall uniqueProxyIdentifier](self, "uniqueProxyIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setRemoteVideoPresentationSizeForCallWithUniqueProxyIdentifier:size:](v9, "setRemoteVideoPresentationSizeForCallWithUniqueProxyIdentifier:size:", v10, width, height);

  }
  else
  {
    TUDefaultLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = self;
      _os_log_impl(&dword_19A50D000, v9, OS_LOG_TYPE_DEFAULT, "[WARN] Ignoring request to set remote video presentation size because call is not a video call: %@", (uint8_t *)&v11, 0xCu);
    }
  }

}

- (void)setRemoteVideoPresentationState:(int)a3
{
  uint64_t v3;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  int v8;
  TUProxyCall *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v3 = *(_QWORD *)&a3;
  v12 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134218240;
    v9 = -[TUProxyCall videoStreamToken](self, "videoStreamToken");
    v10 = 1024;
    v11 = v3;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "self.videoStreamToken: %ld remoteVideoPresentationState: %d", (uint8_t *)&v8, 0x12u);
  }

  if (-[TUProxyCall isVideo](self, "isVideo"))
  {
    -[TUProxyCall proxyCallActionsDelegate](self, "proxyCallActionsDelegate");
    v6 = objc_claimAutoreleasedReturnValue();
    -[TUCall uniqueProxyIdentifier](self, "uniqueProxyIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setRemoteVideoPresentationStateForCallWithUniqueProxyIdentifier:presentationState:](v6, "setRemoteVideoPresentationStateForCallWithUniqueProxyIdentifier:presentationState:", v7, v3);

  }
  else
  {
    TUDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = self;
      _os_log_impl(&dword_19A50D000, v6, OS_LOG_TYPE_DEFAULT, "[WARN] Ignoring request to set remote video presentation state because call is not a video call: %@", (uint8_t *)&v8, 0xCu);
    }
  }

}

- (void)setScreenShareAttributes:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "screenShareAttributes: %@", (uint8_t *)&v8, 0xCu);
  }

  -[TUProxyCall proxyCallActionsDelegate](self, "proxyCallActionsDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCall uniqueProxyIdentifier](self, "uniqueProxyIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setScreenShareAttributesForCallWithUniqueProxyIdentifier:attributes:", v7, v4);

}

- (void)setBluetoothAudioFormat:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  int64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134217984;
    v9 = a3;
    _os_log_impl(&dword_19A50D000, v5, OS_LOG_TYPE_DEFAULT, "bluetoothAudioFormat: %ld", (uint8_t *)&v8, 0xCu);
  }

  -[TUProxyCall proxyCallActionsDelegate](self, "proxyCallActionsDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCall uniqueProxyIdentifier](self, "uniqueProxyIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBluetoothAudioFormatForCallWithUniqueProxyIdentifier:bluetoothAudioFormat:", v7, a3);

}

- (void)remoteVideoClient:(id)a3 remoteVideoDidPause:(BOOL)a4
{
  NSObject *v6;
  _QWORD v7[5];
  BOOL v8;

  -[TUCall queue](self, "queue", a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__TUProxyCall_remoteVideoClient_remoteVideoDidPause___block_invoke;
  v7[3] = &unk_1E38A19E0;
  v7[4] = self;
  v8 = a4;
  dispatch_async(v6, v7);

}

uint64_t __53__TUProxyCall_remoteVideoClient_remoteVideoDidPause___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "videoStreamToken");
    v4 = *(unsigned __int8 *)(a1 + 40);
    v6 = 134218240;
    v7 = v3;
    v8 = 1024;
    v9 = v4;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "self.videoStreamToken: %ld didPause: %d", (uint8_t *)&v6, 0x12u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "setVideoPaused:", *(unsigned __int8 *)(a1 + 40));
}

- (void)remoteVideoClient:(id)a3 remoteMediaDidStall:(BOOL)a4
{
  NSObject *v6;
  _QWORD v7[5];
  BOOL v8;

  -[TUCall queue](self, "queue", a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__TUProxyCall_remoteVideoClient_remoteMediaDidStall___block_invoke;
  v7[3] = &unk_1E38A19E0;
  v7[4] = self;
  v8 = a4;
  dispatch_async(v6, v7);

}

uint64_t __53__TUProxyCall_remoteVideoClient_remoteMediaDidStall___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "videoStreamToken");
    v4 = *(unsigned __int8 *)(a1 + 40);
    v6 = 134218240;
    v7 = v3;
    v8 = 1024;
    v9 = v4;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "self.videoStreamToken: %ld didStall: %d", (uint8_t *)&v6, 0x12u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "setMediaStalled:", *(unsigned __int8 *)(a1 + 40));
}

- (void)remoteVideoClient:(id)a3 videoDidDegrade:(BOOL)a4
{
  NSObject *v6;
  _QWORD v7[5];
  BOOL v8;

  -[TUCall queue](self, "queue", a3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __49__TUProxyCall_remoteVideoClient_videoDidDegrade___block_invoke;
  v7[3] = &unk_1E38A19E0;
  v7[4] = self;
  v8 = a4;
  dispatch_async(v6, v7);

}

uint64_t __49__TUProxyCall_remoteVideoClient_videoDidDegrade___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  int v6;
  uint64_t v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "videoStreamToken");
    v4 = *(unsigned __int8 *)(a1 + 40);
    v6 = 134218240;
    v7 = v3;
    v8 = 1024;
    v9 = v4;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "self.videoStreamToken: %ld didStall: %d", (uint8_t *)&v6, 0x12u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "setVideoDegraded:", *(unsigned __int8 *)(a1 + 40));
}

- (void)remoteVideoClient:(id)a3 remoteScreenAttributesDidChange:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[TUCall queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __65__TUProxyCall_remoteVideoClient_remoteScreenAttributesDidChange___block_invoke;
  v8[3] = &unk_1E38A1388;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

void __65__TUProxyCall_remoteVideoClient_remoteScreenAttributesDidChange___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  uint64_t v8;
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "videoStreamToken");
    v4 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 134218242;
    v11 = v3;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "self.videoStreamToken: %ld screenAttributes: %@", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "callNotificationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65__TUProxyCall_remoteVideoClient_remoteScreenAttributesDidChange___block_invoke_44;
  v7[3] = &unk_1E38A1388;
  v6 = *(void **)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = v6;
  objc_msgSend(v5, "postNotificationsForCall:afterUpdatesInBlock:", v8, v7);

}

uint64_t __65__TUProxyCall_remoteVideoClient_remoteScreenAttributesDidChange___block_invoke_44(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setRemoteScreenOrientation:", objc_msgSend(*(id *)(a1 + 32), "_orientationForVideoAttributesOrientation:", objc_msgSend(*(id *)(a1 + 40), "orientation")));
  result = objc_msgSend(*(id *)(a1 + 32), "remoteScreenOrientation");
  if ((unint64_t)(result - 3) < 2)
  {
    objc_msgSend(*(id *)(a1 + 40), "ratio");
    return objc_msgSend(*(id *)(a1 + 32), "setRemoteScreenLandscapeAspectRatio:");
  }
  else if ((unint64_t)(result - 1) <= 1)
  {
    objc_msgSend(*(id *)(a1 + 40), "ratio");
    return objc_msgSend(*(id *)(a1 + 32), "setRemoteScreenPortraitAspectRatio:");
  }
  return result;
}

- (void)remoteVideoClient:(id)a3 remoteVideoAttributesDidChange:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a4;
  -[TUCall queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__TUProxyCall_remoteVideoClient_remoteVideoAttributesDidChange___block_invoke;
  v8[3] = &unk_1E38A1388;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

void __64__TUProxyCall_remoteVideoClient_remoteVideoAttributesDidChange___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  uint64_t v8;
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  TUDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "videoStreamToken");
    v4 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 134218242;
    v11 = v3;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_19A50D000, v2, OS_LOG_TYPE_DEFAULT, "self.videoStreamToken: %ld videoAttributes: %@", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 32), "callNotificationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__TUProxyCall_remoteVideoClient_remoteVideoAttributesDidChange___block_invoke_45;
  v7[3] = &unk_1E38A1388;
  v6 = *(void **)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 32);
  v9 = v6;
  objc_msgSend(v5, "postNotificationsForCall:afterUpdatesInBlock:", v8, v7);

}

uint64_t __64__TUProxyCall_remoteVideoClient_remoteVideoAttributesDidChange___block_invoke_45(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 40), "ratio");
  objc_msgSend(*(id *)(a1 + 32), "setRemoteAspectRatio:");
  objc_msgSend(*(id *)(a1 + 40), "contentsRect");
  objc_msgSend(*(id *)(a1 + 32), "setRemoteVideoContentRect:");
  objc_msgSend(*(id *)(a1 + 32), "setCameraType:", objc_msgSend(*(id *)(a1 + 32), "_cameraTypeForVideoAttributeCamera:", objc_msgSend(*(id *)(a1 + 40), "camera")));
  objc_msgSend(*(id *)(a1 + 32), "setRemoteCameraOrientation:", objc_msgSend(*(id *)(a1 + 32), "_orientationForVideoAttributesOrientation:", objc_msgSend(*(id *)(a1 + 40), "orientation")));
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(a1 + 32), "setVideoMirrored:", objc_msgSend(*(id *)(a1 + 40), "videoMirrored"));
  return result;
}

- (int64_t)_cameraTypeForVideoAttributeCamera:(int)a3
{
  if (a3 > 2)
    return 0;
  else
    return qword_19A65DDA0[a3];
}

- (int64_t)_orientationForVideoAttributesOrientation:(int)a3
{
  if (a3 < 4)
    return a3 + 1;
  else
    return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUProxyCall)initWithCoder:(id)a3
{
  id v4;
  TUProxyCall *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  TUParticipant *activeRemoteParticipant;
  uint64_t v10;
  NSString *announceProviderIdentifier;
  uint64_t v12;
  TUHandle *handle;
  uint64_t v14;
  NSString *isoCountryCode;
  uint64_t v16;
  NSString *callerNameFromNetwork;
  uint64_t v18;
  NSString *callUUID;
  uint64_t v20;
  TUCallProvider *provider;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSSet *emergencyMediaItems;
  uint64_t v27;
  NSString *audioCategory;
  uint64_t v29;
  NSString *audioMode;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  NSDictionary *endedReasonUserInfo;
  uint64_t v38;
  NSString *endedReasonString;
  uint64_t v40;
  NSString *endedErrorString;
  uint64_t v42;
  NSUUID *callGroupUUID;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  uint64_t v51;
  NSDictionary *providerContext;
  void *v53;
  uint64_t v54;
  TUCallDisplayContext *displayContext;
  void *v56;
  uint64_t v57;
  void *v58;
  void *v59;
  uint64_t v60;
  NSSet *remoteParticipantHandles;
  uint64_t v62;
  NSUUID *localSenderIdentityUUID;
  uint64_t v64;
  NSUUID *localSenderIdentityAccountUUID;
  uint64_t v66;
  TUCallScreenShareAttributes *screenShareAttributes;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  TUMediaTokens *tokens;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  NSString *localMemberHandleValue;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  NSURL *channelImageURL;
  void *v87;
  objc_super v89;

  v4 = a3;
  v89.receiver = self;
  v89.super_class = (Class)TUProxyCall;
  v5 = -[TUCall initWithCoder:](&v89, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_activeRemoteParticipant);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    activeRemoteParticipant = v5->_activeRemoteParticipant;
    v5->_activeRemoteParticipant = (TUParticipant *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("announceProviderIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    announceProviderIdentifier = v5->_announceProviderIdentifier;
    v5->_announceProviderIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("handle"));
    v12 = objc_claimAutoreleasedReturnValue();
    handle = v5->_handle;
    v5->_handle = (TUHandle *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("isoCountryCode"));
    v14 = objc_claimAutoreleasedReturnValue();
    isoCountryCode = v5->_isoCountryCode;
    v5->_isoCountryCode = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("callerNameFromNetwork"));
    v16 = objc_claimAutoreleasedReturnValue();
    callerNameFromNetwork = v5->_callerNameFromNetwork;
    v5->_callerNameFromNetwork = (NSString *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("callUUID"));
    v18 = objc_claimAutoreleasedReturnValue();
    callUUID = v5->_callUUID;
    v5->_callUUID = (NSString *)v18;

    v5->_callStatus = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("callStatus"));
    v5->_hostedOnCurrentDevice = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hostedOnCurrentDevice"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("provider"));
    v20 = objc_claimAutoreleasedReturnValue();
    provider = v5->_provider;
    v5->_provider = (TUCallProvider *)v20;

    v5->_outgoing = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("outgoing"));
    v5->_voicemail = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("voicemail"));
    v5->_isVideo = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isVideo"));
    v5->_thirdPartyVideo = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("thirdPartyVideo"));
    v5->_isSendingAudio = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSendingAudio"));
    v5->_isSendingVideo = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isSendingVideo"));
    v5->_blocked = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("blocked"));
    v5->_emergency = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("emergency"));
    v5->_hasEmergencyVideoStream = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hasEmergencyVideoStream"));
    v22 = (void *)MEMORY[0x1E0C99E60];
    v23 = objc_opt_class();
    objc_msgSend(v22, "setWithObjects:", v23, objc_opt_class(), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("emergencyMediaItems"));
    v25 = objc_claimAutoreleasedReturnValue();
    emergencyMediaItems = v5->_emergencyMediaItems;
    v5->_emergencyMediaItems = (NSSet *)v25;

    v5->_failureExpected = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("failureExpected"));
    v5->_international = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("international"));
    v5->_domestic = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("domestic"));
    v5->_sos = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("sos"));
    v5->_supportsEmergencyFallback = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsEmergencyFallback"));
    v5->_usingBaseband = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("usingBaseband"));
    v5->_ttyType = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("ttyType"));
    v5->_supportsTTYWithVoice = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsTTYWithVoice"));
    v5->_bluetoothAudioFormat = (int)objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("bluetoothAudioFormat"));
    v5->_mixesVoiceWithMedia = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("mixesVoiceWithMedia"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("audioCategory"));
    v27 = objc_claimAutoreleasedReturnValue();
    audioCategory = v5->_audioCategory;
    v5->_audioCategory = (NSString *)v27;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("audioMode"));
    v29 = objc_claimAutoreleasedReturnValue();
    audioMode = v5->_audioMode;
    v5->_audioMode = (NSString *)v29;

    v5->_needsManualInCallSounds = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("needsManualInCallSounds"));
    v31 = (void *)MEMORY[0x1E0C99E60];
    v32 = objc_opt_class();
    v33 = objc_opt_class();
    objc_msgSend(v31, "setWithObjects:", v32, v33, objc_opt_class(), 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v34, CFSTR("endedReasonUserInfo"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "copy");
    endedReasonUserInfo = v5->_endedReasonUserInfo;
    v5->_endedReasonUserInfo = (NSDictionary *)v36;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endedReasonString"));
    v38 = objc_claimAutoreleasedReturnValue();
    endedReasonString = v5->_endedReasonString;
    v5->_endedReasonString = (NSString *)v38;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endedErrorString"));
    v40 = objc_claimAutoreleasedReturnValue();
    endedErrorString = v5->_endedErrorString;
    v5->_endedErrorString = (NSString *)v40;

    v5->_uplinkMuted = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("uplinkMuted"));
    v5->_downlinkMuted = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("downlinkMuted"));
    v5->_callRelaySupport = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("callRelaySupport"));
    v5->_videoStreamToken = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("videoStreamToken"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("callGroupUUID"));
    v42 = objc_claimAutoreleasedReturnValue();
    callGroupUUID = v5->_callGroupUUID;
    v5->_callGroupUUID = (NSUUID *)v42;

    v44 = (void *)MEMORY[0x1E0C99E60];
    v45 = objc_opt_class();
    v46 = objc_opt_class();
    v47 = objc_opt_class();
    v48 = objc_opt_class();
    objc_msgSend(v44, "setWithObjects:", v45, v46, v47, v48, objc_opt_class(), 0);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v49, CFSTR("providerContext"));
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = objc_msgSend(v50, "copy");
    providerContext = v5->_providerContext;
    v5->_providerContext = (NSDictionary *)v51;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("displayContext"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v53, "copy");
    displayContext = v5->_displayContext;
    v5->_displayContext = (TUCallDisplayContext *)v54;

    v56 = (void *)MEMORY[0x1E0C99E60];
    v57 = objc_opt_class();
    objc_msgSend(v56, "setWithObjects:", v57, objc_opt_class(), 0);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v58, CFSTR("remoteParticipantHandles"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v60 = objc_msgSend(v59, "copy");
    remoteParticipantHandles = v5->_remoteParticipantHandles;
    v5->_remoteParticipantHandles = (NSSet *)v60;

    v5->_remoteUplinkMuted = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("remoteUplinkMuted"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localSenderIdentityUUID"));
    v62 = objc_claimAutoreleasedReturnValue();
    localSenderIdentityUUID = v5->_localSenderIdentityUUID;
    v5->_localSenderIdentityUUID = (NSUUID *)v62;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localSenderIdentityAccountUUID"));
    v64 = objc_claimAutoreleasedReturnValue();
    localSenderIdentityAccountUUID = v5->_localSenderIdentityAccountUUID;
    v5->_localSenderIdentityAccountUUID = (NSUUID *)v64;

    v5->_shouldSuppressInCallUI = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("shouldSuppressInCallUI"));
    v5->_mutuallyExclusiveCall = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("mutuallyExclusiveCall"));
    v5->_screenSharingIntention = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("screenSharingIntention"));
    v5->_wantsStagingArea = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("wantsStagingArea"));
    v5->_inputAudioPowerSpectrumToken = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("inputAudioPowerSpectrumToken"));
    v5->_outputAudioPowerSpectrumToken = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("outputAudioPowerSpectrumToken"));
    v5->_isReRing = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isReRing"));
    v5->_originatingUIType = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("originatingUIType"));
    v5->_sharingScreen = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("sharingScreen"));
    v5->_conversation = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("conversation"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("screenShareAttributes"));
    v66 = objc_claimAutoreleasedReturnValue();
    screenShareAttributes = v5->_screenShareAttributes;
    v5->_screenShareAttributes = (TUCallScreenShareAttributes *)v66;

    v68 = objc_opt_class();
    NSStringFromSelector(sel_tokens);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v68, v69);
    v70 = objc_claimAutoreleasedReturnValue();
    tokens = v5->_tokens;
    v5->_tokens = (TUMediaTokens *)v70;

    v72 = objc_opt_class();
    NSStringFromSelector(sel_localMemberHandleValue);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v72, v73);
    v74 = objc_claimAutoreleasedReturnValue();
    localMemberHandleValue = v5->_localMemberHandleValue;
    v5->_localMemberHandleValue = (NSString *)v74;

    NSStringFromSelector(sel_serviceStatus);
    v76 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_serviceStatus = objc_msgSend(v4, "decodeIntegerForKey:", v76);

    NSStringFromSelector(sel_transmissionMode);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_transmissionMode = objc_msgSend(v4, "decodeIntegerForKey:", v77);

    NSStringFromSelector(sel_accessoryButtonEventsEnabled);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_accessoryButtonEventsEnabled = objc_msgSend(v4, "decodeBoolForKey:", v78);

    NSStringFromSelector(sel_isReceivingTransmission);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_receivingTransmission = objc_msgSend(v4, "decodeBoolForKey:", v79);

    NSStringFromSelector(sel_isSendingTransmission);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_sendingTransmission = objc_msgSend(v4, "decodeBoolForKey:", v80);

    NSStringFromSelector(sel_recordingAvailability);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_recordingAvailability = objc_msgSend(v4, "decodeIntForKey:", v81);

    NSStringFromSelector(sel_supportsScreening);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_supportsScreening = objc_msgSend(v4, "decodeBoolForKey:", v82);

    v5->_ptt = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ptt"));
    v83 = objc_opt_class();
    NSStringFromSelector(sel_channelImageURL);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v83, v84);
    v85 = objc_claimAutoreleasedReturnValue();
    channelImageURL = v5->_channelImageURL;
    v5->_channelImageURL = (NSURL *)v85;

    NSStringFromSelector(sel_screenSharingType);
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_screenSharingType = objc_msgSend(v4, "decodeIntegerForKey:", v87);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  TUParticipant *activeRemoteParticipant;
  void *v6;
  NSString *localMemberHandleValue;
  void *v8;
  int64_t serviceStatus;
  void *v10;
  int64_t transmissionMode;
  void *v12;
  _BOOL8 accessoryButtonEventsEnabled;
  void *v14;
  _BOOL8 receivingTransmission;
  void *v16;
  _BOOL8 sendingTransmission;
  void *v18;
  uint64_t recordingAvailability;
  void *v20;
  _BOOL8 supportsScreening;
  void *v22;
  NSURL *channelImageURL;
  void *v24;
  unint64_t screenSharingType;
  void *v26;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)TUProxyCall;
  v4 = a3;
  -[TUCall encodeWithCoder:](&v27, sel_encodeWithCoder_, v4);
  activeRemoteParticipant = self->_activeRemoteParticipant;
  NSStringFromSelector(sel_activeRemoteParticipant);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", activeRemoteParticipant, v6, v27.receiver, v27.super_class);

  objc_msgSend(v4, "encodeObject:forKey:", self->_announceProviderIdentifier, CFSTR("announceProviderIdentifier"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_callUUID, CFSTR("callUUID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_handle, CFSTR("handle"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_isoCountryCode, CFSTR("isoCountryCode"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_callerNameFromNetwork, CFSTR("callerNameFromNetwork"));
  objc_msgSend(v4, "encodeInt32:forKey:", self->_callStatus, CFSTR("callStatus"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_hostedOnCurrentDevice, CFSTR("hostedOnCurrentDevice"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_provider, CFSTR("provider"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_outgoing, CFSTR("outgoing"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_voicemail, CFSTR("voicemail"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isVideo, CFSTR("isVideo"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_thirdPartyVideo, CFSTR("thirdPartyVideo"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isSendingAudio, CFSTR("isSendingAudio"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isSendingVideo, CFSTR("isSendingVideo"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_blocked, CFSTR("blocked"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_emergency, CFSTR("emergency"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_hasEmergencyVideoStream, CFSTR("hasEmergencyVideoStream"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_emergencyMediaItems, CFSTR("emergencyMediaItems"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_failureExpected, CFSTR("failureExpected"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_international, CFSTR("international"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_domestic, CFSTR("domestic"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_sos, CFSTR("sos"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_supportsEmergencyFallback, CFSTR("supportsEmergencyFallback"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_usingBaseband, CFSTR("usingBaseband"));
  objc_msgSend(v4, "encodeInt32:forKey:", self->_ttyType, CFSTR("ttyType"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_supportsTTYWithVoice, CFSTR("supportsTTYWithVoice"));
  objc_msgSend(v4, "encodeInt32:forKey:", LODWORD(self->_bluetoothAudioFormat), CFSTR("bluetoothAudioFormat"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_mixesVoiceWithMedia, CFSTR("mixesVoiceWithMedia"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_audioCategory, CFSTR("audioCategory"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_audioMode, CFSTR("audioMode"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_needsManualInCallSounds, CFSTR("needsManualInCallSounds"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_endedReasonUserInfo, CFSTR("endedReasonUserInfo"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_endedReasonString, CFSTR("endedReasonString"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_endedErrorString, CFSTR("endedErrorString"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_uplinkMuted, CFSTR("uplinkMuted"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_downlinkMuted, CFSTR("downlinkMuted"));
  objc_msgSend(v4, "encodeInt32:forKey:", self->_callRelaySupport, CFSTR("callRelaySupport"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_videoStreamToken, CFSTR("videoStreamToken"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_callGroupUUID, CFSTR("callGroupUUID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_providerContext, CFSTR("providerContext"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_displayContext, CFSTR("displayContext"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_remoteParticipantHandles, CFSTR("remoteParticipantHandles"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_remoteUplinkMuted, CFSTR("remoteUplinkMuted"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_localSenderIdentityUUID, CFSTR("localSenderIdentityUUID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_localSenderIdentityAccountUUID, CFSTR("localSenderIdentityAccountUUID"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_shouldSuppressInCallUI, CFSTR("shouldSuppressInCallUI"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_mutuallyExclusiveCall, CFSTR("mutuallyExclusiveCall"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_wantsStagingArea, CFSTR("wantsStagingArea"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_inputAudioPowerSpectrumToken, CFSTR("inputAudioPowerSpectrumToken"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_outputAudioPowerSpectrumToken, CFSTR("outputAudioPowerSpectrumToken"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isReRing, CFSTR("isReRing"));
  objc_msgSend(v4, "encodeInt32:forKey:", self->_originatingUIType, CFSTR("originatingUIType"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_sharingScreen, CFSTR("sharingScreen"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_conversation, CFSTR("conversation"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_screenShareAttributes, CFSTR("screenShareAttributes"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_screenSharingIntention, CFSTR("screenSharingIntention"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_tokens, CFSTR("tokens"));
  localMemberHandleValue = self->_localMemberHandleValue;
  NSStringFromSelector(sel_localMemberHandleValue);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", localMemberHandleValue, v8);

  serviceStatus = self->_serviceStatus;
  NSStringFromSelector(sel_serviceStatus);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", serviceStatus, v10);

  transmissionMode = self->_transmissionMode;
  NSStringFromSelector(sel_transmissionMode);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", transmissionMode, v12);

  accessoryButtonEventsEnabled = self->_accessoryButtonEventsEnabled;
  NSStringFromSelector(sel_accessoryButtonEventsEnabled);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", accessoryButtonEventsEnabled, v14);

  receivingTransmission = self->_receivingTransmission;
  NSStringFromSelector(sel_isReceivingTransmission);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", receivingTransmission, v16);

  sendingTransmission = self->_sendingTransmission;
  NSStringFromSelector(sel_isSendingTransmission);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", sendingTransmission, v18);

  recordingAvailability = self->_recordingAvailability;
  NSStringFromSelector(sel_recordingAvailability);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInt:forKey:", recordingAvailability, v20);

  supportsScreening = self->_supportsScreening;
  NSStringFromSelector(sel_supportsScreening);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeBool:forKey:", supportsScreening, v22);

  objc_msgSend(v4, "encodeBool:forKey:", self->_ptt, CFSTR("ptt"));
  channelImageURL = self->_channelImageURL;
  NSStringFromSelector(sel_channelImageURL);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", channelImageURL, v24);

  screenSharingType = self->_screenSharingType;
  NSStringFromSelector(sel_screenSharingType);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeInteger:forKey:", screenSharingType, v26);

}

- (TUParticipant)activeRemoteParticipant
{
  return self->_activeRemoteParticipant;
}

- (void)setActiveRemoteParticipant:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 568);
}

- (NSString)announceProviderIdentifier
{
  return self->_announceProviderIdentifier;
}

- (void)setAnnounceProviderIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 576);
}

- (BOOL)isPTT
{
  return self->_ptt;
}

- (id)channelImageURL
{
  return self->_channelImageURL;
}

- (void)setChannelImageURL:(id)a3
{
  objc_storeStrong((id *)&self->_channelImageURL, a3);
}

- (BOOL)isReRing
{
  return self->_isReRing;
}

- (NSString)callUUID
{
  return self->_callUUID;
}

- (void)setCallUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 592);
}

- (int)callStatus
{
  return self->_callStatus;
}

- (void)setCallStatus:(int)a3
{
  self->_callStatus = a3;
}

- (BOOL)isHostedOnCurrentDevice
{
  return self->_hostedOnCurrentDevice;
}

- (void)setHostedOnCurrentDevice:(BOOL)a3
{
  self->_hostedOnCurrentDevice = a3;
}

- (TUHandle)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
  objc_storeStrong((id *)&self->_handle, a3);
}

- (NSString)isoCountryCode
{
  return self->_isoCountryCode;
}

- (void)setIsoCountryCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 608);
}

- (TUCallProvider)provider
{
  return self->_provider;
}

- (void)setProvider:(id)a3
{
  objc_storeStrong((id *)&self->_provider, a3);
}

- (BOOL)isOutgoing
{
  return self->_outgoing;
}

- (void)setOutgoing:(BOOL)a3
{
  self->_outgoing = a3;
}

- (BOOL)isVoicemail
{
  return self->_voicemail;
}

- (void)setVoicemail:(BOOL)a3
{
  self->_voicemail = a3;
}

- (NSString)callerNameFromNetwork
{
  return self->_callerNameFromNetwork;
}

- (void)setCallerNameFromNetwork:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 624);
}

- (BOOL)isVideo
{
  return self->_isVideo;
}

- (void)setIsVideo:(BOOL)a3
{
  self->_isVideo = a3;
}

- (BOOL)isThirdPartyVideo
{
  return self->_thirdPartyVideo;
}

- (void)setThirdPartyVideo:(BOOL)a3
{
  self->_thirdPartyVideo = a3;
}

- (BOOL)isSendingAudio
{
  return self->_isSendingAudio;
}

- (void)setIsSendingAudio:(BOOL)a3
{
  self->_isSendingAudio = a3;
}

- (BOOL)isSendingVideo
{
  return self->_isSendingVideo;
}

- (BOOL)isMediaStalled
{
  return self->_mediaStalled;
}

- (BOOL)isVideoDegraded
{
  return self->_videoDegraded;
}

- (BOOL)isVideoPaused
{
  return self->_videoPaused;
}

- (BOOL)isVideoMirrored
{
  return self->_videoMirrored;
}

- (void)setVideoMirrored:(BOOL)a3
{
  self->_videoMirrored = a3;
}

- (CGSize)remoteAspectRatio
{
  double width;
  double height;
  CGSize result;

  width = self->_remoteAspectRatio.width;
  height = self->_remoteAspectRatio.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setRemoteAspectRatio:(CGSize)a3
{
  self->_remoteAspectRatio = a3;
}

- (CGRect)remoteVideoContentRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_remoteVideoContentRect.origin.x;
  y = self->_remoteVideoContentRect.origin.y;
  width = self->_remoteVideoContentRect.size.width;
  height = self->_remoteVideoContentRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setRemoteVideoContentRect:(CGRect)a3
{
  self->_remoteVideoContentRect = a3;
}

- (int64_t)cameraType
{
  return self->_cameraType;
}

- (void)setCameraType:(int64_t)a3
{
  self->_cameraType = a3;
}

- (int64_t)remoteCameraOrientation
{
  return self->_remoteCameraOrientation;
}

- (void)setRemoteCameraOrientation:(int64_t)a3
{
  self->_remoteCameraOrientation = a3;
}

- (BOOL)isBlocked
{
  return self->_blocked;
}

- (void)setBlocked:(BOOL)a3
{
  self->_blocked = a3;
}

- (BOOL)isEmergency
{
  return self->_emergency;
}

- (void)setEmergency:(BOOL)a3
{
  self->_emergency = a3;
}

- (BOOL)hasEmergencyVideoStream
{
  return self->_hasEmergencyVideoStream;
}

- (NSSet)emergencyMediaItems
{
  return self->_emergencyMediaItems;
}

- (BOOL)isFailureExpected
{
  return self->_failureExpected;
}

- (void)setFailureExpected:(BOOL)a3
{
  self->_failureExpected = a3;
}

- (BOOL)isInternational
{
  return self->_international;
}

- (void)setInternational:(BOOL)a3
{
  self->_international = a3;
}

- (BOOL)isDomestic
{
  return self->_domestic;
}

- (void)setDomestic:(BOOL)a3
{
  self->_domestic = a3;
}

- (BOOL)isSOS
{
  return self->_sos;
}

- (void)setSOS:(BOOL)a3
{
  self->_sos = a3;
}

- (BOOL)supportsEmergencyFallback
{
  return self->_supportsEmergencyFallback;
}

- (void)setSupportsEmergencyFallback:(BOOL)a3
{
  self->_supportsEmergencyFallback = a3;
}

- (BOOL)isUsingBaseband
{
  return self->_usingBaseband;
}

- (void)setUsingBaseband:(BOOL)a3
{
  self->_usingBaseband = a3;
}

- (int)ttyType
{
  return self->_ttyType;
}

- (void)setTtyType:(int)a3
{
  self->_ttyType = a3;
}

- (int64_t)bluetoothAudioFormat
{
  return self->_bluetoothAudioFormat;
}

- (BOOL)supportsTTYWithVoice
{
  return self->_supportsTTYWithVoice;
}

- (void)setSupportsTTYWithVoice:(BOOL)a3
{
  self->_supportsTTYWithVoice = a3;
}

- (NSString)audioCategory
{
  return self->_audioCategory;
}

- (void)setAudioCategory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 664);
}

- (NSString)audioMode
{
  return self->_audioMode;
}

- (void)setAudioMode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 672);
}

- (BOOL)needsManualInCallSounds
{
  return self->_needsManualInCallSounds;
}

- (void)setNeedsManualInCallSounds:(BOOL)a3
{
  self->_needsManualInCallSounds = a3;
}

- (NSDictionary)endedReasonUserInfo
{
  return self->_endedReasonUserInfo;
}

- (void)setEndedReasonUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 680);
}

- (NSString)endedReasonString
{
  return self->_endedReasonString;
}

- (void)setEndedReasonString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 688);
}

- (NSString)endedErrorString
{
  return self->_endedErrorString;
}

- (void)setEndedErrorString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 696);
}

- (BOOL)isUplinkMuted
{
  return self->_uplinkMuted;
}

- (BOOL)isDownlinkMuted
{
  return self->_downlinkMuted;
}

- (int)callRelaySupport
{
  return self->_callRelaySupport;
}

- (void)setCallRelaySupport:(int)a3
{
  self->_callRelaySupport = a3;
}

- (NSData)localFrequency
{
  return self->_localFrequency;
}

- (void)setLocalFrequency:(id)a3
{
  objc_storeStrong((id *)&self->_localFrequency, a3);
}

- (NSData)remoteFrequency
{
  return self->_remoteFrequency;
}

- (void)setRemoteFrequency:(id)a3
{
  objc_storeStrong((id *)&self->_remoteFrequency, a3);
}

- (float)localMeterLevel
{
  return self->_localMeterLevel;
}

- (void)setLocalMeterLevel:(float)a3
{
  self->_localMeterLevel = a3;
}

- (float)remoteMeterLevel
{
  return self->_remoteMeterLevel;
}

- (void)setRemoteMeterLevel:(float)a3
{
  self->_remoteMeterLevel = a3;
}

- (int64_t)videoStreamToken
{
  return self->_videoStreamToken;
}

- (void)setVideoStreamToken:(int64_t)a3
{
  self->_videoStreamToken = a3;
}

- (int64_t)inputAudioPowerSpectrumToken
{
  return self->_inputAudioPowerSpectrumToken;
}

- (void)setInputAudioPowerSpectrumToken:(int64_t)a3
{
  self->_inputAudioPowerSpectrumToken = a3;
}

- (int64_t)outputAudioPowerSpectrumToken
{
  return self->_outputAudioPowerSpectrumToken;
}

- (void)setOutputAudioPowerSpectrumToken:(int64_t)a3
{
  self->_outputAudioPowerSpectrumToken = a3;
}

- (BOOL)requiresRemoteVideo
{
  return self->_requiresRemoteVideo;
}

- (int64_t)remoteScreenOrientation
{
  return self->_remoteScreenOrientation;
}

- (void)setRemoteScreenOrientation:(int64_t)a3
{
  self->_remoteScreenOrientation = a3;
}

- (NSUUID)callGroupUUID
{
  return self->_callGroupUUID;
}

- (void)setCallGroupUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 752);
}

- (NSDictionary)providerContext
{
  return self->_providerContext;
}

- (void)setProviderContext:(id)a3
{
  objc_storeStrong((id *)&self->_providerContext, a3);
}

- (TUCallDisplayContext)displayContext
{
  return self->_displayContext;
}

- (void)setDisplayContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 768);
}

- (NSSet)remoteParticipantHandles
{
  return self->_remoteParticipantHandles;
}

- (void)setRemoteParticipantHandles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 776);
}

- (BOOL)prefersExclusiveAccessToCellularNetwork
{
  return self->_prefersExclusiveAccessToCellularNetwork;
}

- (void)setPrefersExclusiveAccessToCellularNetwork:(BOOL)a3
{
  self->_prefersExclusiveAccessToCellularNetwork = a3;
}

- (BOOL)isRemoteUplinkMuted
{
  return self->_remoteUplinkMuted;
}

- (void)setRemoteUplinkMuted:(BOOL)a3
{
  self->_remoteUplinkMuted = a3;
}

- (NSUUID)localSenderIdentityUUID
{
  return self->_localSenderIdentityUUID;
}

- (void)setLocalSenderIdentityUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 784);
}

- (NSUUID)localSenderIdentityAccountUUID
{
  return self->_localSenderIdentityAccountUUID;
}

- (void)setLocalSenderIdentityAccountUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 792);
}

- (BOOL)shouldSuppressInCallUI
{
  return self->_shouldSuppressInCallUI;
}

- (void)setShouldSuppressInCallUI:(BOOL)a3
{
  self->_shouldSuppressInCallUI = a3;
}

- (BOOL)isMutuallyExclusiveCall
{
  return self->_mutuallyExclusiveCall;
}

- (void)setMutuallyExclusiveCall:(BOOL)a3
{
  self->_mutuallyExclusiveCall = a3;
}

- (BOOL)wantsStagingArea
{
  return self->_wantsStagingArea;
}

- (void)setWantsStagingArea:(BOOL)a3
{
  self->_wantsStagingArea = a3;
}

- (int)originatingUIType
{
  return self->_originatingUIType;
}

- (void)setOriginatingUIType:(int)a3
{
  self->_originatingUIType = a3;
}

- (BOOL)isSharingScreen
{
  return self->_sharingScreen;
}

- (BOOL)isConversation
{
  return self->_conversation;
}

- (void)setConversation:(BOOL)a3
{
  self->_conversation = a3;
}

- (id)screenShareAttributes
{
  return self->_screenShareAttributes;
}

- (int64_t)serviceStatus
{
  return self->_serviceStatus;
}

- (void)setServiceStatus:(int64_t)a3
{
  self->_serviceStatus = a3;
}

- (int64_t)transmissionMode
{
  return self->_transmissionMode;
}

- (void)setTransmissionMode:(int64_t)a3
{
  self->_transmissionMode = a3;
}

- (BOOL)accessoryButtonEventsEnabled
{
  return self->_accessoryButtonEventsEnabled;
}

- (void)setAccessoryButtonEventsEnabled:(BOOL)a3
{
  self->_accessoryButtonEventsEnabled = a3;
}

- (BOOL)isReceivingTransmission
{
  return self->_receivingTransmission;
}

- (void)setReceivingTransmission:(BOOL)a3
{
  self->_receivingTransmission = a3;
}

- (BOOL)isSendingTransmission
{
  return self->_sendingTransmission;
}

- (void)setSendingTransmission:(BOOL)a3
{
  self->_sendingTransmission = a3;
}

- (BOOL)mixesVoiceWithMedia
{
  return self->_mixesVoiceWithMedia;
}

- (int)recordingAvailability
{
  return self->_recordingAvailability;
}

- (BOOL)supportsScreening
{
  return self->_supportsScreening;
}

- (id)tokens
{
  return self->_tokens;
}

- (id)localMemberHandleValue
{
  return self->_localMemberHandleValue;
}

- (int64_t)screenSharingIntention
{
  return self->_screenSharingIntention;
}

- (void)setScreenSharingIntention:(int64_t)a3
{
  self->_screenSharingIntention = a3;
}

- (unint64_t)screenSharingType
{
  return self->_screenSharingType;
}

- (void)setScreenSharingType:(unint64_t)a3
{
  self->_screenSharingType = a3;
}

- (TUCallServicesProxyCallActions)proxyCallActionsDelegate
{
  return (TUCallServicesProxyCallActions *)objc_loadWeakRetained((id *)&self->_proxyCallActionsDelegate);
}

- (void)setProxyCallActionsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_proxyCallActionsDelegate, a3);
}

- (TURemoteVideoClient)localVideo
{
  return self->_localVideo;
}

- (void)setLocalVideo:(id)a3
{
  objc_storeStrong((id *)&self->_localVideo, a3);
}

- (TURemoteVideoClient)remoteVideo
{
  return self->_remoteVideo;
}

- (void)setRemoteVideo:(id)a3
{
  objc_storeStrong((id *)&self->_remoteVideo, a3);
}

- (NSMutableDictionary)remoteVideoModeToLayer
{
  return self->_remoteVideoModeToLayer;
}

- (void)setRemoteVideoModeToLayer:(id)a3
{
  objc_storeStrong((id *)&self->_remoteVideoModeToLayer, a3);
}

- (NSMutableDictionary)localVideoModeToLayer
{
  return self->_localVideoModeToLayer;
}

- (void)setLocalVideoModeToLayer:(id)a3
{
  objc_storeStrong((id *)&self->_localVideoModeToLayer, a3);
}

- (CGSize)remoteScreenPortraitAspectRatio
{
  double width;
  double height;
  CGSize result;

  width = self->_remoteScreenPortraitAspectRatio.width;
  height = self->_remoteScreenPortraitAspectRatio.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setRemoteScreenPortraitAspectRatio:(CGSize)a3
{
  self->_remoteScreenPortraitAspectRatio = a3;
}

- (CGSize)remoteScreenLandscapeAspectRatio
{
  double width;
  double height;
  CGSize result;

  width = self->_remoteScreenLandscapeAspectRatio.width;
  height = self->_remoteScreenLandscapeAspectRatio.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setRemoteScreenLandscapeAspectRatio:(CGSize)a3
{
  self->_remoteScreenLandscapeAspectRatio = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localVideoModeToLayer, 0);
  objc_storeStrong((id *)&self->_remoteVideoModeToLayer, 0);
  objc_storeStrong((id *)&self->_remoteVideo, 0);
  objc_storeStrong((id *)&self->_localVideo, 0);
  objc_destroyWeak((id *)&self->_proxyCallActionsDelegate);
  objc_storeStrong((id *)&self->_localMemberHandleValue, 0);
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_screenShareAttributes, 0);
  objc_storeStrong((id *)&self->_localSenderIdentityAccountUUID, 0);
  objc_storeStrong((id *)&self->_localSenderIdentityUUID, 0);
  objc_storeStrong((id *)&self->_remoteParticipantHandles, 0);
  objc_storeStrong((id *)&self->_displayContext, 0);
  objc_storeStrong((id *)&self->_providerContext, 0);
  objc_storeStrong((id *)&self->_callGroupUUID, 0);
  objc_storeStrong((id *)&self->_remoteFrequency, 0);
  objc_storeStrong((id *)&self->_localFrequency, 0);
  objc_storeStrong((id *)&self->_endedErrorString, 0);
  objc_storeStrong((id *)&self->_endedReasonString, 0);
  objc_storeStrong((id *)&self->_endedReasonUserInfo, 0);
  objc_storeStrong((id *)&self->_audioMode, 0);
  objc_storeStrong((id *)&self->_audioCategory, 0);
  objc_storeStrong((id *)&self->_emergencyMediaItems, 0);
  objc_storeStrong((id *)&self->_callerNameFromNetwork, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_isoCountryCode, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_callUUID, 0);
  objc_storeStrong((id *)&self->_channelImageURL, 0);
  objc_storeStrong((id *)&self->_announceProviderIdentifier, 0);
  objc_storeStrong((id *)&self->_activeRemoteParticipant, 0);
}

@end
