@implementation SFSSInstrumentMetrics

- (double)clockFactor
{
  if (clockFactor_onceToken != -1)
    dispatch_once(&clockFactor_onceToken, &__block_literal_global_115);
  return *(double *)&clockFactor_clockToSeconds;
}

- (id)description
{
  void *v2;
  void *v3;

  -[SFSSInstrumentMetrics dictionaryMetrics](self, "dictionaryMetrics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (double)synthesisLatency
{
  int64_t synthesisEndTimestamp;
  double v3;
  double v4;

  synthesisEndTimestamp = self->_synthesisEndTimestamp;
  if (!synthesisEndTimestamp)
    return 0.0;
  v3 = (double)(synthesisEndTimestamp - self->_synthesisBeginTimestamp);
  -[SFSSInstrumentMetrics clockFactor](self, "clockFactor");
  return v4 * v3;
}

- (double)speakLatency
{
  int64_t speakBeginTimestamp;
  double v3;
  double v4;

  speakBeginTimestamp = self->_speakBeginTimestamp;
  if (!speakBeginTimestamp)
    return 0.0;
  v3 = (double)(speakBeginTimestamp - self->_requestCreatedTimestamp);
  -[SFSSInstrumentMetrics clockFactor](self, "clockFactor");
  return v4 * v3;
}

- (double)playbackDuration
{
  int64_t speakEndTimestamp;
  double v3;
  double v4;

  speakEndTimestamp = self->_speakEndTimestamp;
  if (!speakEndTimestamp)
    return 0.0;
  v3 = (double)(speakEndTimestamp - self->_speakBeginTimestamp);
  -[SFSSInstrumentMetrics clockFactor](self, "clockFactor");
  return v4 * v3;
}

- (id)dictionaryMetrics
{
  const __CFString *text;
  NSString *voiceAssetKey;
  const __CFString *v5;
  const __CFString *resourceAssetKey;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const __CFString *audioOutputRoute;
  NSString *clientBundleIdentifier;
  const __CFString *v20;
  void *v21;
  _QWORD v23[12];
  _QWORD v24[13];

  v24[12] = *MEMORY[0x24BDAC8D0];
  text = (const __CFString *)self->_text;
  voiceAssetKey = self->_voiceAssetKey;
  if (!text)
    text = &stru_24E246F88;
  v23[0] = CFSTR("text");
  v23[1] = CFSTR("voice_asset_key");
  if (voiceAssetKey)
    v5 = (const __CFString *)voiceAssetKey;
  else
    v5 = &stru_24E246F88;
  v24[0] = text;
  v24[1] = v5;
  resourceAssetKey = (const __CFString *)self->_resourceAssetKey;
  if (!resourceAssetKey)
    resourceAssetKey = &stru_24E246F88;
  v24[2] = resourceAssetKey;
  v23[2] = CFSTR("resource_asset_key");
  v23[3] = CFSTR("is_speech_request");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isSpeechRequest);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v7;
  v23[4] = CFSTR("error_code");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_errorCode);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v8;
  v23[5] = CFSTR("source_of_tts");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_sourceOfTTS);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[5] = v9;
  v23[6] = CFSTR("speak_latency");
  v10 = (void *)MEMORY[0x24BDD16E0];
  -[SFSSInstrumentMetrics speakLatency](self, "speakLatency");
  objc_msgSend(v10, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[6] = v11;
  v23[7] = CFSTR("synthesis_latency");
  v12 = (void *)MEMORY[0x24BDD16E0];
  -[SFSSInstrumentMetrics synthesisLatency](self, "synthesisLatency");
  objc_msgSend(v12, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[7] = v13;
  v23[8] = CFSTR("playback_duration");
  v14 = (void *)MEMORY[0x24BDD16E0];
  -[SFSSInstrumentMetrics playbackDuration](self, "playbackDuration");
  objc_msgSend(v14, "numberWithDouble:");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[8] = v15;
  v23[9] = CFSTR("audio_duration");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_audioDuration);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  audioOutputRoute = (const __CFString *)self->_audioOutputRoute;
  clientBundleIdentifier = self->_clientBundleIdentifier;
  if (!audioOutputRoute)
    audioOutputRoute = &stru_24E246F88;
  v24[9] = v16;
  v24[10] = audioOutputRoute;
  v23[10] = CFSTR("audio_output_route");
  v23[11] = CFSTR("client_bundle_identifier");
  if (clientBundleIdentifier)
    v20 = (const __CFString *)clientBundleIdentifier;
  else
    v20 = &stru_24E246F88;
  v24[11] = v20;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 12);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (NSString)text
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setText:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (NSString)voiceAssetKey
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setVoiceAssetKey:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSString)resourceAssetKey
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setResourceAssetKey:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSString)audioOutputRoute
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAudioOutputRoute:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSString)clientBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setClientBundleIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (int64_t)requestCreatedTimestamp
{
  return self->_requestCreatedTimestamp;
}

- (void)setRequestCreatedTimestamp:(int64_t)a3
{
  self->_requestCreatedTimestamp = a3;
}

- (int64_t)synthesisBeginTimestamp
{
  return self->_synthesisBeginTimestamp;
}

- (void)setSynthesisBeginTimestamp:(int64_t)a3
{
  self->_synthesisBeginTimestamp = a3;
}

- (int64_t)synthesisEndTimestamp
{
  return self->_synthesisEndTimestamp;
}

- (void)setSynthesisEndTimestamp:(int64_t)a3
{
  self->_synthesisEndTimestamp = a3;
}

- (int64_t)speakBeginTimestamp
{
  return self->_speakBeginTimestamp;
}

- (void)setSpeakBeginTimestamp:(int64_t)a3
{
  self->_speakBeginTimestamp = a3;
}

- (int64_t)speakEndTimestamp
{
  return self->_speakEndTimestamp;
}

- (void)setSpeakEndTimestamp:(int64_t)a3
{
  self->_speakEndTimestamp = a3;
}

- (double)audioDuration
{
  return self->_audioDuration;
}

- (void)setAudioDuration:(double)a3
{
  self->_audioDuration = a3;
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(int64_t)a3
{
  self->_errorCode = a3;
}

- (int64_t)sourceOfTTS
{
  return self->_sourceOfTTS;
}

- (void)setSourceOfTTS:(int64_t)a3
{
  self->_sourceOfTTS = a3;
}

- (BOOL)isSpeechRequest
{
  return self->_isSpeechRequest;
}

- (void)setIsSpeechRequest:(BOOL)a3
{
  self->_isSpeechRequest = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_audioOutputRoute, 0);
  objc_storeStrong((id *)&self->_resourceAssetKey, 0);
  objc_storeStrong((id *)&self->_voiceAssetKey, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

double __36__SFSSInstrumentMetrics_clockFactor__block_invoke()
{
  unint64_t v0;
  unint64_t v1;
  double result;
  mach_timebase_info info;

  info = 0;
  mach_timebase_info(&info);
  LODWORD(v1) = info.denom;
  LODWORD(v0) = info.numer;
  result = (double)v0 / (double)v1 / 1000000000.0;
  clockFactor_clockToSeconds = *(_QWORD *)&result;
  return result;
}

@end
