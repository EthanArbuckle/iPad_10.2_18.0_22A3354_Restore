@implementation SMTRequestContextData

- (SMTRequestContextData)initWithBuilder:(id)a3
{
  void (**v4)(id, SMTRequestContextDataMutating *);
  SMTRequestContextData *v5;
  SMTRequestContextData *v6;
  SMTRequestContextDataMutating *v7;
  void *v8;
  uint64_t v9;
  NSString *audioSource;
  void *v11;
  uint64_t v12;
  NSString *audioDestination;
  void *v14;
  uint64_t v15;
  NSString *responseMode;
  void *v17;
  uint64_t v18;
  NSArray *bargeInModes;
  void *v20;
  uint64_t v21;
  NSDateInterval *approximatePreviousTTSInterval;
  void *v23;
  uint64_t v24;
  NSArray *deviceRestrictions;
  void *v26;
  uint64_t v27;
  NSDictionary *voiceTriggerEventInfo;
  objc_super v30;

  v4 = (void (**)(id, SMTRequestContextDataMutating *))a3;
  v30.receiver = self;
  v30.super_class = (Class)SMTRequestContextData;
  v5 = -[SMTRequestContextData init](&v30, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    v7 = objc_alloc_init(SMTRequestContextDataMutating);
    v4[2](v4, v7);
    -[SMTRequestContextDataMutating audioSource](v7, "audioSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    audioSource = v6->_audioSource;
    v6->_audioSource = (NSString *)v9;

    -[SMTRequestContextDataMutating audioDestination](v7, "audioDestination");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    audioDestination = v6->_audioDestination;
    v6->_audioDestination = (NSString *)v12;

    -[SMTRequestContextDataMutating responseMode](v7, "responseMode");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "copy");
    responseMode = v6->_responseMode;
    v6->_responseMode = (NSString *)v15;

    v6->_isEyesFree = -[SMTRequestContextDataMutating isEyesFree](v7, "isEyesFree");
    v6->_isVoiceTriggerEnabled = -[SMTRequestContextDataMutating isVoiceTriggerEnabled](v7, "isVoiceTriggerEnabled");
    v6->_isTextToSpeechEnabled = -[SMTRequestContextDataMutating isTextToSpeechEnabled](v7, "isTextToSpeechEnabled");
    v6->_isTriggerlessFollowup = -[SMTRequestContextDataMutating isTriggerlessFollowup](v7, "isTriggerlessFollowup");
    -[SMTRequestContextDataMutating bargeInModes](v7, "bargeInModes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "copy");
    bargeInModes = v6->_bargeInModes;
    v6->_bargeInModes = (NSArray *)v18;

    -[SMTRequestContextDataMutating approximatePreviousTTSInterval](v7, "approximatePreviousTTSInterval");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "copy");
    approximatePreviousTTSInterval = v6->_approximatePreviousTTSInterval;
    v6->_approximatePreviousTTSInterval = (NSDateInterval *)v21;

    -[SMTRequestContextDataMutating deviceRestrictions](v7, "deviceRestrictions");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "copy");
    deviceRestrictions = v6->_deviceRestrictions;
    v6->_deviceRestrictions = (NSArray *)v24;

    -[SMTRequestContextDataMutating voiceTriggerEventInfo](v7, "voiceTriggerEventInfo");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SMTRequestContextData _sanitizeVoiceTriggerEventInfo:](v6, "_sanitizeVoiceTriggerEventInfo:", v26);
    v27 = objc_claimAutoreleasedReturnValue();
    voiceTriggerEventInfo = v6->_voiceTriggerEventInfo;
    v6->_voiceTriggerEventInfo = (NSDictionary *)v27;

    v6->_voiceAudioSessionId = -[SMTRequestContextDataMutating voiceAudioSessionId](v7, "voiceAudioSessionId");
    v6->_isSystemApertureEnabled = -[SMTRequestContextDataMutating isSystemApertureEnabled](v7, "isSystemApertureEnabled");
    v6->_isInAmbient = -[SMTRequestContextDataMutating isInAmbient](v7, "isInAmbient");
    v6->_isLiveActivitiesSupported = -[SMTRequestContextDataMutating isLiveActivitiesSupported](v7, "isLiveActivitiesSupported");
    v6->_isDeviceShowingLockScreen = -[SMTRequestContextDataMutating isDeviceShowingLockScreen](v7, "isDeviceShowingLockScreen");
    v6->_isDeviceLocked = -[SMTRequestContextDataMutating isDeviceLocked](v7, "isDeviceLocked");

  }
  return v6;
}

- (SMTRequestContextData)init
{
  return -[SMTRequestContextData initWithBuilder:](self, "initWithBuilder:", &__block_literal_global);
}

- (id)_sanitizeVoiceTriggerEventInfo:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  if (!v3)
    return 0;
  v4 = v3;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __56__SMTRequestContextData__sanitizeVoiceTriggerEventInfo___block_invoke;
  v9[3] = &unk_2517F9500;
  v10 = v5;
  v6 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v9);
  v7 = (void *)objc_msgSend(v6, "copy");

  return v7;
}

- (NSString)audioSource
{
  return self->_audioSource;
}

- (NSString)audioDestination
{
  return self->_audioDestination;
}

- (NSString)responseMode
{
  return self->_responseMode;
}

- (BOOL)isEyesFree
{
  return self->_isEyesFree;
}

- (BOOL)isVoiceTriggerEnabled
{
  return self->_isVoiceTriggerEnabled;
}

- (BOOL)isTextToSpeechEnabled
{
  return self->_isTextToSpeechEnabled;
}

- (BOOL)isTriggerlessFollowup
{
  return self->_isTriggerlessFollowup;
}

- (NSArray)bargeInModes
{
  return self->_bargeInModes;
}

- (NSDateInterval)approximatePreviousTTSInterval
{
  return self->_approximatePreviousTTSInterval;
}

- (NSArray)deviceRestrictions
{
  return self->_deviceRestrictions;
}

- (NSDictionary)voiceTriggerEventInfo
{
  return self->_voiceTriggerEventInfo;
}

- (unsigned)voiceAudioSessionId
{
  return self->_voiceAudioSessionId;
}

- (BOOL)isSystemApertureEnabled
{
  return self->_isSystemApertureEnabled;
}

- (BOOL)isInAmbient
{
  return self->_isInAmbient;
}

- (BOOL)isLiveActivitiesSupported
{
  return self->_isLiveActivitiesSupported;
}

- (BOOL)isDeviceShowingLockScreen
{
  return self->_isDeviceShowingLockScreen;
}

- (BOOL)isDeviceLocked
{
  return self->_isDeviceLocked;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceTriggerEventInfo, 0);
  objc_storeStrong((id *)&self->_deviceRestrictions, 0);
  objc_storeStrong((id *)&self->_approximatePreviousTTSInterval, 0);
  objc_storeStrong((id *)&self->_bargeInModes, 0);
  objc_storeStrong((id *)&self->_responseMode, 0);
  objc_storeStrong((id *)&self->_audioDestination, 0);
  objc_storeStrong((id *)&self->_audioSource, 0);
}

void __56__SMTRequestContextData__sanitizeVoiceTriggerEventInfo___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "stringValue");
      v7 = objc_claimAutoreleasedReturnValue();

      v6 = (id)v7;
    }
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v6, v8);

  }
}

@end
