@implementation VSSpeechRequest

- (VSSpeechRequest)init
{
  VSSpeechRequest *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VSSpeechRequest;
  result = -[VSSpeechRequest init](&v8, sel_init);
  if (result)
  {
    result->_shouldCache = 1;
    __asm { FMOV            V0.2D, #1.0 }
    *(_OWORD *)&result->_rate = _Q0;
    result->_volume = 0.8;
    result->_pointer = (int64_t)result;
    result->_retryDeviceOnNetworkStall = 1;
  }
  return result;
}

- (id)logText
{
  return VSLoggingStringForUtterance(self->_text, -[VSSpeechRequest canLogRequestText](self, "canLogRequestText"));
}

- (id)logUtterance
{
  return VSLoggingStringForUtterance(self->_utterance, -[VSSpeechRequest canLogRequestText](self, "canLogRequestText"));
}

- (id)description
{
  double volume;
  _BOOL8 canUseServerTTS;
  _BOOL8 disableCompactVoiceFallback;
  _BOOL8 disableDeviceRacing;
  _BOOL8 shouldWaitCurrentSpeaking;
  _BOOL8 shouldCache;
  void *v9;
  NSArray *customResourceURLs;
  NSUUID *accessoryID;
  uint64_t audioSessionID;
  void *v13;
  void *v14;
  _BOOL8 shouldWhisper;
  __int128 v17;
  void *v18;
  void *v19;
  void *v20;
  NSString *voiceName;
  NSString *languageCode;
  unint64_t requestCreatedTimestamp;
  void *v24;

  requestCreatedTimestamp = self->_requestCreatedTimestamp;
  v24 = (void *)MEMORY[0x1E0CB3940];
  voiceName = self->_voiceName;
  languageCode = self->_languageCode;
  +[VSVoiceAsset genderStringFromGender:](VSVoiceAsset, "genderStringFromGender:", self->_gender);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSVoiceAsset typeStringFromType:](VSVoiceAsset, "typeStringFromType:", self->_voiceType);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[VSVoiceAsset footprintStringFromFootprint:](VSVoiceAsset, "footprintStringFromFootprint:", self->_footprint);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *(_OWORD *)&self->_rate;
  volume = self->_volume;
  shouldWhisper = self->_shouldWhisper;
  canUseServerTTS = self->_canUseServerTTS;
  disableCompactVoiceFallback = self->_disableCompactVoiceFallback;
  disableDeviceRacing = self->_disableDeviceRacing;
  shouldWaitCurrentSpeaking = self->_shouldWaitCurrentSpeaking;
  shouldCache = self->_shouldCache;
  -[VSSpeechRequest contextInfoString](self, "contextInfoString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  customResourceURLs = self->_customResourceURLs;
  accessoryID = self->_accessoryID;
  audioSessionID = self->_audioSessionID;
  -[VSSpeechRequest logText](self, "logText");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "stringWithFormat:", CFSTR("startTime: %llu, language:%@, name:%@, gender:%@, type:%@, footprint:%@, rate:%.2f, pitch:%.2f, volume:%.2f, shouldWhisper:%d, canUseServerTTS:%d, disableCompactFallback:%d, disableDeviceRacing:%d, shouldWaitCurrentSpeaking:%d, shouldCache:%d, contextInfo:%@, customResourceURLs:%@, session:%d, accessoryID:%@, text:'%@'"), requestCreatedTimestamp, languageCode, voiceName, v20, v19, v18, v17, *(_QWORD *)&volume, shouldWhisper, canUseServerTTS, disableCompactVoiceFallback, disableDeviceRacing, shouldWaitCurrentSpeaking, shouldCache, v9, customResourceURLs,
    audioSessionID,
    accessoryID,
    v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (BOOL)isSimilarTo:(id)a3
{
  VSSpeechRequest *v4;
  uint64_t v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *voiceName;
  double v13;
  double v14;
  double v15;
  void *v16;

  v4 = (VSSpeechRequest *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class();
    if (v5 == objc_opt_class())
    {
      -[VSSpeechRequest languageCode](v4, "languageCode");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "isEqualToString:", self->_languageCode))
      {
        -[VSSpeechRequest text](v4, "text");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "isEqualToString:", self->_text))
        {
          -[VSSpeechRequest contextInfo](v4, "contextInfo");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v9, "isEqualToDictionary:", self->_contextInfo)
            && -[VSSpeechRequest footprint](v4, "footprint") == self->_footprint
            && -[VSSpeechRequest voiceType](v4, "voiceType") == self->_voiceType
            && -[VSSpeechRequest gender](v4, "gender") == self->_gender)
          {
            -[VSSpeechRequest voiceName](v4, "voiceName");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = v10;
            if (self->_voiceName)
              voiceName = (const __CFString *)self->_voiceName;
            else
              voiceName = &stru_1EA8B0C98;
            if (objc_msgSend(v10, "isEqualToString:", voiceName)
              && (-[VSSpeechRequest rate](v4, "rate"), v13 == self->_rate)
              && (-[VSSpeechRequest pitch](v4, "pitch"), v14 == self->_pitch)
              && (-[VSSpeechRequest volume](v4, "volume"), v15 == self->_volume)
              && self->_shouldWhisper == -[VSSpeechRequest shouldWhisper](v4, "shouldWhisper")
              && self->_canUseServerTTS == -[VSSpeechRequest canUseServerTTS](v4, "canUseServerTTS"))
            {
              -[VSSpeechRequest customResourceURLs](v4, "customResourceURLs");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              v6 = objc_msgSend(v16, "isEqualToArray:", self->_customResourceURLs);

            }
            else
            {
              v6 = 0;
            }

          }
          else
          {
            v6 = 0;
          }

        }
        else
        {
          v6 = 0;
        }

      }
      else
      {
        v6 = 0;
      }

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  VSSpeechRequest *v5;
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

  v5 = -[VSSpeechRequest init](+[VSSpeechRequest allocWithZone:](VSSpeechRequest, "allocWithZone:"), "init");
  -[VSSpeechRequest text](self, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
  -[VSSpeechRequest setText:](v5, "setText:", v7);

  -[VSSpeechRequest languageCode](self, "languageCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "copyWithZone:", a3);
  -[VSSpeechRequest setLanguageCode:](v5, "setLanguageCode:", v9);

  -[VSSpeechRequest setFootprint:](v5, "setFootprint:", -[VSSpeechRequest footprint](self, "footprint"));
  -[VSSpeechRequest setVoiceType:](v5, "setVoiceType:", -[VSSpeechRequest voiceType](self, "voiceType"));
  -[VSSpeechRequest setGender:](v5, "setGender:", -[VSSpeechRequest gender](self, "gender"));
  -[VSSpeechRequest voiceName](self, "voiceName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSpeechRequest setVoiceName:](v5, "setVoiceName:", v10);

  -[VSSpeechRequest outputPath](self, "outputPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copyWithZone:", a3);
  -[VSSpeechRequest setOutputPath:](v5, "setOutputPath:", v12);

  -[VSSpeechRequest setShouldCache:](v5, "setShouldCache:", -[VSSpeechRequest shouldCache](self, "shouldCache"));
  -[VSSpeechRequest setShouldWaitCurrentSpeaking:](v5, "setShouldWaitCurrentSpeaking:", -[VSSpeechRequest shouldWaitCurrentSpeaking](self, "shouldWaitCurrentSpeaking"));
  -[VSSpeechRequest rate](self, "rate");
  -[VSSpeechRequest setRate:](v5, "setRate:");
  -[VSSpeechRequest pitch](self, "pitch");
  -[VSSpeechRequest setPitch:](v5, "setPitch:");
  -[VSSpeechRequest volume](self, "volume");
  -[VSSpeechRequest setVolume:](v5, "setVolume:");
  -[VSSpeechRequest setShouldWhisper:](v5, "setShouldWhisper:", -[VSSpeechRequest shouldWhisper](self, "shouldWhisper"));
  -[VSSpeechRequest contextInfo](self, "contextInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copyWithZone:", a3);
  -[VSSpeechRequest setContextInfo:](v5, "setContextInfo:", v14);

  -[VSSpeechRequest setDisableCompactVoiceFallback:](v5, "setDisableCompactVoiceFallback:", -[VSSpeechRequest disableCompactVoiceFallback](self, "disableCompactVoiceFallback"));
  -[VSSpeechRequest setDisableDeviceRacing:](v5, "setDisableDeviceRacing:", -[VSSpeechRequest disableDeviceRacing](self, "disableDeviceRacing"));
  -[VSSpeechRequest setAudioSessionID:](v5, "setAudioSessionID:", -[VSSpeechRequest audioSessionID](self, "audioSessionID"));
  -[VSSpeechRequest accessoryID](self, "accessoryID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSSpeechRequest setAccessoryID:](v5, "setAccessoryID:", v15);

  -[VSSpeechRequest setForceServerTTS:](v5, "setForceServerTTS:", -[VSSpeechRequest forceServerTTS](self, "forceServerTTS"));
  -[VSSpeechRequest setCanUseServerTTS:](v5, "setCanUseServerTTS:", -[VSSpeechRequest canUseServerTTS](self, "canUseServerTTS"));
  -[VSSpeechRequest resourceListURL](self, "resourceListURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v16, "copyWithZone:", a3);
  -[VSSpeechRequest setResourceListURL:](v5, "setResourceListURL:", v17);

  -[VSSpeechRequest resourceSearchPathURL](self, "resourceSearchPathURL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "copyWithZone:", a3);
  -[VSSpeechRequest setResourceSearchPathURL:](v5, "setResourceSearchPathURL:", v19);

  -[VSSpeechRequest customResourceURLs](self, "customResourceURLs");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v20, "copyWithZone:", a3);
  -[VSSpeechRequest setCustomResourceURLs:](v5, "setCustomResourceURLs:", v21);

  -[VSSpeechRequest setPowerProfile:](v5, "setPowerProfile:", -[VSSpeechRequest powerProfile](self, "powerProfile"));
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *text;
  id v5;
  void *v6;
  __CFArray *SerializedAttributes;

  text = self->_text;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", text, CFSTR("_text"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_languageCode, CFSTR("_languageCode"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_voiceName, CFSTR("_voiceName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clientBundleIdentifier, CFSTR("_clientBundleIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_accessoryID, CFSTR("_accessoryID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_siriRequestId, CFSTR("_siriRequestId"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_footprint, CFSTR("_footprint"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_voiceType, CFSTR("_voiceType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_gender, CFSTR("_gender"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_outputPath, CFSTR("_outputPath"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_rate"), self->_rate);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_pitch"), self->_pitch);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_volume"), self->_volume);
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldWhisper, CFSTR("_shouldWhisper"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldCache, CFSTR("_shouldCache"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_disableCompactVoiceFallback, CFSTR("_disableCompactVoiceFallback"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_disableDeviceRacing, CFSTR("_disableDeviceRacing"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_forceServerTTS, CFSTR("_forceServerTTS"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_canUseServerTTS, CFSTR("_canUseServerTTS"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_retryDeviceOnNetworkStall, CFSTR("_retryDeviceOnNetworkStall"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldStreamAudioData, CFSTR("_shouldStreamAudioData"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_shouldWaitCurrentSpeaking, CFSTR("_shouldWaitCurrentSpeaking"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_audioSessionID, CFSTR("_audioSessionID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_resourceListURL, CFSTR("_resourceListURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_resourceSearchPathURL, CFSTR("_resourceSearchPathURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_customResourceURLs, CFSTR("_customResourceURLs"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contextInfo, CFSTR("_contextInfo"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_requestCreatedTimestamp, CFSTR("_requestCreatedTimestamp"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_pointer, CFSTR("_pointer"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_powerProfile, CFSTR("_powerProfile"));
  -[NSAttributedString string](self->_attributedText, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("textForAttributes"));

  SerializedAttributes = VSAttributedStringCreateSerializedAttributes(0, (CFAttributedStringRef)self->_attributedText);
  objc_msgSend(v5, "encodeObject:forKey:", SerializedAttributes, CFSTR("attributes"));

}

- (VSSpeechRequest)initWithCoder:(id)a3
{
  id v4;
  VSSpeechRequest *v5;
  uint64_t v6;
  NSString *text;
  uint64_t v8;
  NSString *languageCode;
  uint64_t v10;
  NSString *voiceName;
  uint64_t v12;
  NSString *clientBundleIdentifier;
  uint64_t v14;
  NSUUID *accessoryID;
  uint64_t v16;
  NSUUID *siriRequestId;
  uint64_t v18;
  NSURL *outputPath;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  NSURL *resourceListURL;
  uint64_t v25;
  NSURL *resourceSearchPathURL;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSArray *customResourceURLs;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSDictionary *contextInfo;
  __CFString *v37;
  const __CFArray *v38;
  __CFAttributedString *v39;
  NSAttributedString *attributedText;
  objc_super v42;
  _QWORD v43[3];
  _QWORD v44[3];

  v44[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)VSSpeechRequest;
  v5 = -[VSSpeechRequest init](&v42, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_text"));
    v6 = objc_claimAutoreleasedReturnValue();
    text = v5->_text;
    v5->_text = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_languageCode"));
    v8 = objc_claimAutoreleasedReturnValue();
    languageCode = v5->_languageCode;
    v5->_languageCode = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_voiceName"));
    v10 = objc_claimAutoreleasedReturnValue();
    voiceName = v5->_voiceName;
    v5->_voiceName = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_clientBundleIdentifier"));
    v12 = objc_claimAutoreleasedReturnValue();
    clientBundleIdentifier = v5->_clientBundleIdentifier;
    v5->_clientBundleIdentifier = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_accessoryID"));
    v14 = objc_claimAutoreleasedReturnValue();
    accessoryID = v5->_accessoryID;
    v5->_accessoryID = (NSUUID *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_siriRequestId"));
    v16 = objc_claimAutoreleasedReturnValue();
    siriRequestId = v5->_siriRequestId;
    v5->_siriRequestId = (NSUUID *)v16;

    v5->_footprint = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_footprint"));
    v5->_voiceType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_voiceType"));
    v5->_gender = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_gender"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_outputPath"));
    v18 = objc_claimAutoreleasedReturnValue();
    outputPath = v5->_outputPath;
    v5->_outputPath = (NSURL *)v18;

    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_rate"));
    v5->_rate = v20;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_pitch"));
    v5->_pitch = v21;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_volume"));
    v5->_volume = v22;
    v5->_shouldWhisper = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_shouldWhisper"));
    v5->_shouldCache = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_shouldCache"));
    v5->_disableCompactVoiceFallback = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_disableCompactVoiceFallback"));
    v5->_disableDeviceRacing = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_disableDeviceRacing"));
    v5->_forceServerTTS = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_forceServerTTS"));
    v5->_canUseServerTTS = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_canUseServerTTS"));
    v5->_retryDeviceOnNetworkStall = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_retryDeviceOnNetworkStall"));
    v5->_shouldStreamAudioData = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_shouldStreamAudioData"));
    v5->_shouldWaitCurrentSpeaking = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_shouldWaitCurrentSpeaking"));
    v5->_audioSessionID = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("_audioSessionID"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_resourceListURL"));
    v23 = objc_claimAutoreleasedReturnValue();
    resourceListURL = v5->_resourceListURL;
    v5->_resourceListURL = (NSURL *)v23;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_resourceSearchPathURL"));
    v25 = objc_claimAutoreleasedReturnValue();
    resourceSearchPathURL = v5->_resourceSearchPathURL;
    v5->_resourceSearchPathURL = (NSURL *)v25;

    v27 = (void *)MEMORY[0x1E0C99E60];
    v44[0] = objc_opt_class();
    v44[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setWithArray:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v29, CFSTR("_customResourceURLs"));
    v30 = objc_claimAutoreleasedReturnValue();
    customResourceURLs = v5->_customResourceURLs;
    v5->_customResourceURLs = (NSArray *)v30;

    v32 = (void *)MEMORY[0x1E0C99E60];
    v43[0] = objc_opt_class();
    v43[1] = objc_opt_class();
    v43[2] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 3);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setWithArray:", v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v34, CFSTR("_contextInfo"));
    v35 = objc_claimAutoreleasedReturnValue();
    contextInfo = v5->_contextInfo;
    v5->_contextInfo = (NSDictionary *)v35;

    v5->_requestCreatedTimestamp = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_requestCreatedTimestamp"));
    v5->_pointer = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_pointer"));
    v5->_powerProfile = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_powerProfile"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("textForAttributes"));
    v37 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v37)
    {
      objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("attributes"));
      v38 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v39 = VSAttributedStringCreateFromSerializedAttributes(0, v37, v38);
        attributedText = v5->_attributedText;
        v5->_attributedText = (NSAttributedString *)v39;

      }
    }

  }
  return v5;
}

- (id)contextInfoString
{
  id v3;
  NSDictionary *contextInfo;
  id v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  void *v10;
  id v11;
  _QWORD *v12;
  _QWORD v13[3];
  char v14;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  objc_msgSend(v3, "appendString:", CFSTR("{"));
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v14 = 1;
  contextInfo = self->_contextInfo;
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __36__VSSpeechRequest_contextInfoString__block_invoke;
  v10 = &unk_1EA8AF988;
  v5 = v3;
  v11 = v5;
  v12 = v13;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](contextInfo, "enumerateKeysAndObjectsUsingBlock:", &v7);
  objc_msgSend(v5, "appendString:", CFSTR("}"), v7, v8, v9, v10);

  _Block_object_dispose(v13, 8);
  return v5;
}

- (BOOL)canLogRequestText
{
  void *v3;
  char v4;

  if (self->_canUseServerTTS)
    return 1;
  +[VSSpeechInternalSettings standardInstance](VSSpeechInternalSettings, "standardInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "logSensitiveText");

  return v4;
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)languageCode
{
  return self->_languageCode;
}

- (void)setLanguageCode:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)voiceName
{
  return self->_voiceName;
}

- (void)setVoiceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int64_t)footprint
{
  return self->_footprint;
}

- (void)setFootprint:(int64_t)a3
{
  self->_footprint = a3;
}

- (int64_t)voiceType
{
  return self->_voiceType;
}

- (void)setVoiceType:(int64_t)a3
{
  self->_voiceType = a3;
}

- (int64_t)gender
{
  return self->_gender;
}

- (void)setGender:(int64_t)a3
{
  self->_gender = a3;
}

- (NSURL)outputPath
{
  return self->_outputPath;
}

- (void)setOutputPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (BOOL)shouldWaitCurrentSpeaking
{
  return self->_shouldWaitCurrentSpeaking;
}

- (void)setShouldWaitCurrentSpeaking:(BOOL)a3
{
  self->_shouldWaitCurrentSpeaking = a3;
}

- (BOOL)disableDeviceRacing
{
  return self->_disableDeviceRacing;
}

- (void)setDisableDeviceRacing:(BOOL)a3
{
  self->_disableDeviceRacing = a3;
}

- (BOOL)shouldCache
{
  return self->_shouldCache;
}

- (void)setShouldCache:(BOOL)a3
{
  self->_shouldCache = a3;
}

- (double)rate
{
  return self->_rate;
}

- (void)setRate:(double)a3
{
  self->_rate = a3;
}

- (double)pitch
{
  return self->_pitch;
}

- (void)setPitch:(double)a3
{
  self->_pitch = a3;
}

- (double)volume
{
  return self->_volume;
}

- (void)setVolume:(double)a3
{
  self->_volume = a3;
}

- (BOOL)shouldWhisper
{
  return self->_shouldWhisper;
}

- (void)setShouldWhisper:(BOOL)a3
{
  self->_shouldWhisper = a3;
}

- (NSDictionary)contextInfo
{
  return self->_contextInfo;
}

- (void)setContextInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (BOOL)disableCompactVoiceFallback
{
  return self->_disableCompactVoiceFallback;
}

- (void)setDisableCompactVoiceFallback:(BOOL)a3
{
  self->_disableCompactVoiceFallback = a3;
}

- (unsigned)audioSessionID
{
  return self->_audioSessionID;
}

- (void)setAudioSessionID:(unsigned int)a3
{
  self->_audioSessionID = a3;
}

- (BOOL)forceServerTTS
{
  return self->_forceServerTTS;
}

- (void)setForceServerTTS:(BOOL)a3
{
  self->_forceServerTTS = a3;
}

- (BOOL)canUseServerTTS
{
  return self->_canUseServerTTS;
}

- (void)setCanUseServerTTS:(BOOL)a3
{
  self->_canUseServerTTS = a3;
}

- (BOOL)retryDeviceOnNetworkStall
{
  return self->_retryDeviceOnNetworkStall;
}

- (void)setRetryDeviceOnNetworkStall:(BOOL)a3
{
  self->_retryDeviceOnNetworkStall = a3;
}

- (int64_t)powerProfile
{
  return self->_powerProfile;
}

- (void)setPowerProfile:(int64_t)a3
{
  self->_powerProfile = a3;
}

- (NSURL)resourceListURL
{
  return self->_resourceListURL;
}

- (void)setResourceListURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
}

- (NSURL)resourceSearchPathURL
{
  return self->_resourceSearchPathURL;
}

- (void)setResourceSearchPathURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSArray)customResourceURLs
{
  return self->_customResourceURLs;
}

- (void)setCustomResourceURLs:(id)a3
{
  objc_storeStrong((id *)&self->_customResourceURLs, a3);
}

- (NSUUID)siriRequestId
{
  return self->_siriRequestId;
}

- (void)setSiriRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_siriRequestId, a3);
}

- (NSAttributedString)attributedText
{
  return self->_attributedText;
}

- (void)setAttributedText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (BOOL)shouldStreamAudioData
{
  return self->_shouldStreamAudioData;
}

- (void)setShouldStreamAudioData:(BOOL)a3
{
  self->_shouldStreamAudioData = a3;
}

- (NSString)utterance
{
  return self->_utterance;
}

- (void)setUtterance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSString)clientBundleIdentifier
{
  return self->_clientBundleIdentifier;
}

- (void)setClientBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (NSUUID)accessoryID
{
  return self->_accessoryID;
}

- (void)setAccessoryID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

- (unint64_t)requestCreatedTimestamp
{
  return self->_requestCreatedTimestamp;
}

- (void)setRequestCreatedTimestamp:(unint64_t)a3
{
  self->_requestCreatedTimestamp = a3;
}

- (id)stopHandler
{
  return self->_stopHandler;
}

- (void)setStopHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (id)pauseHandler
{
  return self->_pauseHandler;
}

- (void)setPauseHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (int64_t)pointer
{
  return self->_pointer;
}

- (void)setPointer:(int64_t)a3
{
  self->_pointer = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pauseHandler, 0);
  objc_storeStrong(&self->_stopHandler, 0);
  objc_storeStrong((id *)&self->_accessoryID, 0);
  objc_storeStrong((id *)&self->_clientBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_utterance, 0);
  objc_storeStrong((id *)&self->_attributedText, 0);
  objc_storeStrong((id *)&self->_siriRequestId, 0);
  objc_storeStrong((id *)&self->_customResourceURLs, 0);
  objc_storeStrong((id *)&self->_resourceSearchPathURL, 0);
  objc_storeStrong((id *)&self->_resourceListURL, 0);
  objc_storeStrong((id *)&self->_contextInfo, 0);
  objc_storeStrong((id *)&self->_outputPath, 0);
  objc_storeStrong((id *)&self->_voiceName, 0);
  objc_storeStrong((id *)&self->_languageCode, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

uint64_t __36__VSSpeechRequest_contextInfoString__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  const __CFString *v5;
  uint64_t result;

  v4 = *(void **)(a1 + 32);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    v5 = &stru_1EA8B0C98;
  else
    v5 = CFSTR("; ");
  result = objc_msgSend(v4, "appendFormat:", CFSTR("%@%@: %@"), v5, a2, a3);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
