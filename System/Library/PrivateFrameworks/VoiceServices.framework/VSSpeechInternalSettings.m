@implementation VSSpeechInternalSettings

- (BOOL)disableAssetCleaning
{
  return -[NSUserDefaults BOOLForKey:](self->_internalDefaults, "BOOLForKey:", CFSTR("DisableAssetCleaning"));
}

+ (id)standardInstance
{
  if (standardInstance_onceToken != -1)
    dispatch_once(&standardInstance_onceToken, &__block_literal_global_182);
  return (id)standardInstance___standardInstance;
}

- (VSSpeechInternalSettings)init
{
  VSSpeechInternalSettings *v2;
  NSObject *v3;
  uint64_t v4;
  NSUserDefaults *internalDefaults;
  VSSpeechInternalSettings *v6;
  uint8_t v8[16];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)VSSpeechInternalSettings;
  v2 = -[VSSpeechInternalSettings init](&v9, sel_init);
  if (v2)
  {
    if (!+[VSUtilities isInternalBuild](VSUtilities, "isInternalBuild"))
    {
      v6 = 0;
      goto LABEL_10;
    }
    if (geteuid() != 501)
    {
      VSGetLogDefault();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v8 = 0;
        _os_log_error_impl(&dword_1DE15E000, v3, OS_LOG_TYPE_ERROR, "process is not running as user Mobile: it won't share the same UserDefaults as voiced", v8, 2u);
      }

    }
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.voiceservices"));
    internalDefaults = v2->_internalDefaults;
    v2->_internalDefaults = (NSUserDefaults *)v4;

    -[NSUserDefaults removeObjectForKey:](v2->_internalDefaults, "removeObjectForKey:", CFSTR("enableTrial"));
  }
  v6 = v2;
LABEL_10:

  return v6;
}

- (BOOL)enableAudioDump
{
  void *v3;

  -[NSUserDefaults objectForKey:](self->_internalDefaults, "objectForKey:", CFSTR("enableAudioDump"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return !v3 || -[NSUserDefaults BOOLForKey:](self->_internalDefaults, "BOOLForKey:", CFSTR("enableAudioDump"));
}

- (void)setEnableAudioDump:(BOOL)a3
{
  -[NSUserDefaults setBool:forKey:](self->_internalDefaults, "setBool:forKey:", a3, CFSTR("enableAudioDump"));
}

- (BOOL)logSensitiveText
{
  return -[NSUserDefaults BOOLForKey:](self->_internalDefaults, "BOOLForKey:", CFSTR("logSensitiveText"));
}

- (void)setLogSensitiveText:(BOOL)a3
{
  -[NSUserDefaults setBool:forKey:](self->_internalDefaults, "setBool:forKey:", a3, CFSTR("logSensitiveText"));
}

- (BOOL)disableCache
{
  return -[NSUserDefaults BOOLForKey:](self->_internalDefaults, "BOOLForKey:", CFSTR("DisableCaching"));
}

- (void)setDisableCache:(BOOL)a3
{
  -[NSUserDefaults setBool:forKey:](self->_internalDefaults, "setBool:forKey:", a3, CFSTR("DisableCaching"));
}

- (void)setDisableAssetCleaning:(BOOL)a3
{
  -[NSUserDefaults setBool:forKey:](self->_internalDefaults, "setBool:forKey:", a3, CFSTR("DisableAssetCleaning"));
}

- (BOOL)allowAnyAssetSubscriber
{
  return -[NSUserDefaults BOOLForKey:](self->_internalDefaults, "BOOLForKey:", CFSTR("AllowAnyAssetSubscription"));
}

- (void)setAllowAnyAssetSubscriber:(BOOL)a3
{
  -[NSUserDefaults setBool:forKey:](self->_internalDefaults, "setBool:forKey:", a3, CFSTR("AllowAnyAssetSubscription"));
}

- (BOOL)enableLocalVoices
{
  return -[NSUserDefaults BOOLForKey:](self->_internalDefaults, "BOOLForKey:", CFSTR("EnableLocalVoices"));
}

- (void)setEnableLocalVoices:(BOOL)a3
{
  -[NSUserDefaults setBool:forKey:](self->_internalDefaults, "setBool:forKey:", a3, CFSTR("EnableLocalVoices"));
}

- (BOOL)whisper
{
  return -[NSUserDefaults BOOLForKey:](self->_internalDefaults, "BOOLForKey:", CFSTR("whisper"));
}

- (void)setWhisper:(BOOL)a3
{
  -[NSUserDefaults setBool:forKey:](self->_internalDefaults, "setBool:forKey:", a3, CFSTR("whisper"));
}

- (float)serverTTSTimeout
{
  float result;

  -[NSUserDefaults floatForKey:](self->_internalDefaults, "floatForKey:", CFSTR("ServerTTSTimeout"));
  return result;
}

- (void)setServerTTSTimeout:(float)a3
{
  -[NSUserDefaults setFloat:forKey:](self->_internalDefaults, "setFloat:forKey:", CFSTR("ServerTTSTimeout"));
}

- (float)deviceTTSWaitTime
{
  float result;

  -[NSUserDefaults floatForKey:](self->_internalDefaults, "floatForKey:", CFSTR("DeviceTTSWaitTime"));
  return result;
}

- (void)setDeviceTTSWaitTime:(float)a3
{
  -[NSUserDefaults setFloat:forKey:](self->_internalDefaults, "setFloat:forKey:", CFSTR("DeviceTTSWaitTime"));
}

- (float)defaultVolume
{
  float result;

  -[NSUserDefaults floatForKey:](self->_internalDefaults, "floatForKey:", CFSTR("defaultVolume"));
  return result;
}

- (void)setDefaultVolume:(float)a3
{
  -[NSUserDefaults setFloat:forKey:](self->_internalDefaults, "setFloat:forKey:", CFSTR("defaultVolume"));
}

- (float)defaultPitch
{
  float result;

  -[NSUserDefaults floatForKey:](self->_internalDefaults, "floatForKey:", CFSTR("defaultPitch"));
  return result;
}

- (void)setDefaultPitch:(float)a3
{
  -[NSUserDefaults setFloat:forKey:](self->_internalDefaults, "setFloat:forKey:", CFSTR("defaultPitch"));
}

- (float)defaultRate
{
  float result;

  -[NSUserDefaults floatForKey:](self->_internalDefaults, "floatForKey:", CFSTR("defaultRate"));
  return result;
}

- (void)setDefaultRate:(float)a3
{
  -[NSUserDefaults setFloat:forKey:](self->_internalDefaults, "setFloat:forKey:", CFSTR("defaultRate"));
}

- (BOOL)forceServerTTS
{
  return -[NSUserDefaults BOOLForKey:](self->_internalDefaults, "BOOLForKey:", CFSTR("forceServerTTS"));
}

- (void)setForceServerTTS:(BOOL)a3
{
  -[NSUserDefaults setBool:forKey:](self->_internalDefaults, "setBool:forKey:", a3, CFSTR("forceServerTTS"));
}

- (BOOL)disableServerTTS
{
  return -[NSUserDefaults BOOLForKey:](self->_internalDefaults, "BOOLForKey:", CFSTR("disableServerTTS"));
}

- (void)setDisableServerTTS:(BOOL)a3
{
  -[NSUserDefaults setBool:forKey:](self->_internalDefaults, "setBool:forKey:", a3, CFSTR("disableServerTTS"));
}

- (BOOL)disableInlineStreamTTS
{
  return -[NSUserDefaults BOOLForKey:](self->_internalDefaults, "BOOLForKey:", CFSTR("disableInlineStreamTTS"));
}

- (void)setDisableInlineStreamTTS:(BOOL)a3
{
  -[NSUserDefaults setBool:forKey:](self->_internalDefaults, "setBool:forKey:", a3, CFSTR("disableInlineStreamTTS"));
}

- (BOOL)disableDeviceRacing
{
  return -[NSUserDefaults BOOLForKey:](self->_internalDefaults, "BOOLForKey:", CFSTR("disableDeviceRacing"));
}

- (void)setDisableDeviceRacing:(BOOL)a3
{
  -[NSUserDefaults setBool:forKey:](self->_internalDefaults, "setBool:forKey:", a3, CFSTR("disableDeviceRacing"));
}

- (BOOL)disableOspreyStreaming
{
  return -[NSUserDefaults BOOLForKey:](self->_internalDefaults, "BOOLForKey:", CFSTR("disableOspreyStreaming"));
}

- (void)setDisableOspreyStreaming:(BOOL)a3
{
  -[NSUserDefaults setBool:forKey:](self->_internalDefaults, "setBool:forKey:", a3, CFSTR("disableOspreyStreaming"));
}

- (float)streamBufferDuration
{
  float result;

  -[NSUserDefaults floatForKey:](self->_internalDefaults, "floatForKey:", CFSTR("StreamBufferDuration"));
  return result;
}

- (void)setStreamBufferDuration:(float)a3
{
  -[NSUserDefaults setFloat:forKey:](self->_internalDefaults, "setFloat:forKey:", CFSTR("StreamBufferDuration"));
}

- (BOOL)useBetaVoice
{
  return -[NSUserDefaults BOOLForKey:](self->_internalDefaults, "BOOLForKey:", CFSTR("useBetaVoice"));
}

- (void)setUseBetaVoice:(BOOL)a3
{
  -[NSUserDefaults setBool:forKey:](self->_internalDefaults, "setBool:forKey:", a3, CFSTR("useBetaVoice"));
}

- (NSString)ospreyEndpointURL
{
  return -[NSUserDefaults stringForKey:](self->_internalDefaults, "stringForKey:", CFSTR("ospreyEndpointURL"));
}

- (void)setOspreyEndpointURL:(id)a3
{
  -[NSUserDefaults setObject:forKey:](self->_internalDefaults, "setObject:forKey:", a3, CFSTR("ospreyEndpointURL"));
}

- (BOOL)simulateNetworkStall
{
  return -[NSUserDefaults BOOLForKey:](self->_internalDefaults, "BOOLForKey:", CFSTR("simulateNetworkStall"));
}

- (void)setSimulateNetworkStall:(BOOL)a3
{
  -[NSUserDefaults setBool:forKey:](self->_internalDefaults, "setBool:forKey:", a3, CFSTR("simulateNetworkStall"));
}

- (BOOL)disableDeviceNeuralTTS
{
  return -[NSUserDefaults BOOLForKey:](self->_internalDefaults, "BOOLForKey:", CFSTR("disableDeviceNeuralTTS"));
}

- (void)setDisableDeviceNeuralTTS:(BOOL)a3
{
  -[NSUserDefaults setBool:forKey:](self->_internalDefaults, "setBool:forKey:", a3, CFSTR("disableDeviceNeuralTTS"));
}

- (BOOL)useSSMLInput
{
  return -[NSUserDefaults BOOLForKey:](self->_internalDefaults, "BOOLForKey:", CFSTR("useSSMLInput"));
}

- (BOOL)disableMobileAssetURLReset
{
  return -[NSUserDefaults BOOLForKey:](self->_internalDefaults, "BOOLForKey:", CFSTR("disableMobileAssetURLReset"));
}

- (BOOL)ignorePowerAndThermalState
{
  return -[NSUserDefaults BOOLForKey:](self->_internalDefaults, "BOOLForKey:", CFSTR("ignoreThermalState"));
}

- (void)setIgnorePowerAndThermalState:(BOOL)a3
{
  -[NSUserDefaults setBool:forKey:](self->_internalDefaults, "setBool:forKey:", a3, CFSTR("ignoreThermalState"));
}

- (BOOL)disableAssetUpdate
{
  return -[NSUserDefaults BOOLForKey:](self->_internalDefaults, "BOOLForKey:", CFSTR("disableAssetUpdate"));
}

- (void)setDisableAssetUpdate:(BOOL)a3
{
  -[NSUserDefaults setBool:forKey:](self->_internalDefaults, "setBool:forKey:", a3, CFSTR("disableAssetUpdate"));
}

- (BOOL)defaultToNonDiscretionaryDownloads
{
  return -[NSUserDefaults BOOLForKey:](self->_internalDefaults, "BOOLForKey:", CFSTR("defaultToNonDiscretionaryDownloads"));
}

- (void)setDefaultToNonDiscretionaryDownloads:(BOOL)a3
{
  -[NSUserDefaults setBool:forKey:](self->_internalDefaults, "setBool:forKey:", a3, CFSTR("defaultToNonDiscretionaryDownloads"));
}

- (NSUserDefaults)internalDefaults
{
  return self->_internalDefaults;
}

- (void)setInternalDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_internalDefaults, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalDefaults, 0);
}

void __44__VSSpeechInternalSettings_standardInstance__block_invoke()
{
  VSSpeechInternalSettings *v0;
  void *v1;

  v0 = objc_alloc_init(VSSpeechInternalSettings);
  v1 = (void *)standardInstance___standardInstance;
  standardInstance___standardInstance = (uint64_t)v0;

}

@end
