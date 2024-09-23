@implementation VSInstrumentMetrics

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("{\n"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSInstrumentMetrics dictionaryMetrics](self, "dictionaryMetrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = objc_msgSend(&unk_1EA8BE470, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(&unk_1EA8BE470);
        v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          +[VSInstrumentMetrics descriptionFormatter](VSInstrumentMetrics, "descriptionFormatter");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "stringFromNumber:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", CFSTR("  \"%@\": %@,\n"), v9, v12);

        }
        else
        {
          objc_msgSend(v3, "appendFormat:", CFSTR("  \"%@\": \"%@\",\n"), v9, v10);
        }

      }
      v6 = objc_msgSend(&unk_1EA8BE470, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }
  objc_msgSend(v3, "appendString:", CFSTR("}"));

  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *utterance;
  id v5;

  utterance = self->_utterance;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", utterance, CFSTR("_utterance"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_voiceAssetKey, CFSTR("_voiceAssetKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_voiceResourceAssetKey, CFSTR("_voiceResourceAssetKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_audioOutputRoute, CFSTR("_audioOutputRoute"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clientBundleIdentifier, CFSTR("_clientBundleIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_experimentIdentifier, CFSTR("_experimentIdentifier"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_promptCount, CFSTR("_promptCount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_sourceOfTTS, CFSTR("_sourceOfTTS"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_errorCode, CFSTR("_errorCode"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_requestCreatedTimestamp, CFSTR("_requestCreatedTimestamp"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_synthesisBeginTimestamp, CFSTR("_synthesisBeginTimestamp"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_synthesisEndTimestamp, CFSTR("_synthesisEndTimestamp"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_speechBeginTimestamp, CFSTR("_speechBeginTimestamp"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_speechEndTimestamp, CFSTR("_speechEndTimestamp"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_audioStartTimestampDiffs, CFSTR("_audioStartTimestampDiffs"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_serverFirstPacketTimestamp, CFSTR("_serverFirstPacketTimestamp"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_audioDuration"), self->_audioDuration);
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("_serverStreamedAudioDuration"), self->_serverStreamedAudioDuration);
  objc_msgSend(v5, "encodeBool:forKey:", self->_isWarmStart, CFSTR("_isWarmStart"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isCacheHitFromDisk, CFSTR("_isCacheHitFromDisk"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isCacheHitFromMemory, CFSTR("_isCacheHitFromMemory"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isSpeechRequest, CFSTR("_isSpeechRequest"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_canUseServerTTS, CFSTR("_canUseServerTTS"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isServerTTS, CFSTR("_isServerTTS"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isServerStreamTTS, CFSTR("_isServerStreamTTS"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isServerTimeout, CFSTR("_isServerTimeout"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_isServerTTSRacing, CFSTR("_isServerTTSRacing"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_neuralAlignmentStall, CFSTR("_neuralAlignmentStall"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_neuralAudioClick, CFSTR("_neuralAudioClick"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_neuralFallback, CFSTR("_neuralFallback"));

}

- (VSInstrumentMetrics)initWithCoder:(id)a3
{
  id v4;
  VSInstrumentMetrics *v5;
  uint64_t v6;
  NSString *utterance;
  uint64_t v8;
  NSString *voiceAssetKey;
  uint64_t v10;
  NSString *voiceResourceAssetKey;
  uint64_t v12;
  NSString *audioOutputRoute;
  uint64_t v14;
  NSString *clientBundleIdentifier;
  uint64_t v16;
  NSString *experimentIdentifier;
  double v18;
  double v19;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)VSInstrumentMetrics;
  v5 = -[VSInstrumentMetrics init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_utterance"));
    v6 = objc_claimAutoreleasedReturnValue();
    utterance = v5->_utterance;
    v5->_utterance = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_voiceAssetKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    voiceAssetKey = v5->_voiceAssetKey;
    v5->_voiceAssetKey = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_voiceResourceAssetKey"));
    v10 = objc_claimAutoreleasedReturnValue();
    voiceResourceAssetKey = v5->_voiceResourceAssetKey;
    v5->_voiceResourceAssetKey = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_audioOutputRoute"));
    v12 = objc_claimAutoreleasedReturnValue();
    audioOutputRoute = v5->_audioOutputRoute;
    v5->_audioOutputRoute = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_clientBundleIdentifier"));
    v14 = objc_claimAutoreleasedReturnValue();
    clientBundleIdentifier = v5->_clientBundleIdentifier;
    v5->_clientBundleIdentifier = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_experimentIdentifier"));
    v16 = objc_claimAutoreleasedReturnValue();
    experimentIdentifier = v5->_experimentIdentifier;
    v5->_experimentIdentifier = (NSString *)v16;

    v5->_promptCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_promptCount"));
    v5->_sourceOfTTS = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_sourceOfTTS"));
    v5->_errorCode = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_errorCode"));
    v5->_requestCreatedTimestamp = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_requestCreatedTimestamp"));
    v5->_synthesisBeginTimestamp = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_synthesisBeginTimestamp"));
    v5->_synthesisEndTimestamp = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_synthesisEndTimestamp"));
    v5->_speechBeginTimestamp = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_speechBeginTimestamp"));
    v5->_speechEndTimestamp = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_speechEndTimestamp"));
    v5->_audioStartTimestampDiffs = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_audioStartTimestampDiffs"));
    v5->_serverFirstPacketTimestamp = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_serverFirstPacketTimestamp"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_audioDuration"));
    v5->_audioDuration = v18;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_serverStreamedAudioDuration"));
    v5->_serverStreamedAudioDuration = v19;
    v5->_isWarmStart = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isWarmStart"));
    v5->_isCacheHitFromDisk = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isCacheHitFromDisk"));
    v5->_isCacheHitFromMemory = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isCacheHitFromMemory"));
    v5->_isSpeechRequest = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isSpeechRequest"));
    v5->_canUseServerTTS = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_canUseServerTTS"));
    v5->_isServerTTS = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isServerTTS"));
    v5->_isServerStreamTTS = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isServerStreamTTS"));
    v5->_isServerTimeout = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isServerTimeout"));
    v5->_isServerTTSRacing = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_isServerTTSRacing"));
    v5->_neuralAlignmentStall = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_neuralAlignmentStall"));
    v5->_neuralAudioClick = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_neuralAudioClick"));
    v5->_neuralFallback = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_neuralFallback"));
  }

  return v5;
}

- (double)_clockFactor
{
  if (_clockFactor_onceToken != -1)
    dispatch_once(&_clockFactor_onceToken, &__block_literal_global_130);
  return *(double *)&_clockFactor_clockToSeconds;
}

- (int64_t)speechEstimatedOutputBeginTimestamp
{
  int64_t speechBeginTimestamp;
  double speechEndTimestamp;
  double audioDuration;
  double v5;
  double v6;

  speechBeginTimestamp = self->_speechBeginTimestamp;
  speechEndTimestamp = (double)self->_speechEndTimestamp;
  audioDuration = self->_audioDuration;
  -[VSInstrumentMetrics _clockFactor](self, "_clockFactor");
  v6 = speechEndTimestamp - audioDuration / v5;
  if (v6 <= (double)speechBeginTimestamp)
    return (uint64_t)(double)speechBeginTimestamp;
  return (uint64_t)v6;
}

- (double)timeToSpeakLatency
{
  int64_t speechBeginTimestamp;
  double v3;
  double v4;

  speechBeginTimestamp = self->_speechBeginTimestamp;
  if (!speechBeginTimestamp)
    return 0.0;
  v3 = (double)(speechBeginTimestamp - self->_requestCreatedTimestamp);
  -[VSInstrumentMetrics _clockFactor](self, "_clockFactor");
  return v4 * v3;
}

- (double)timeToPlaybackLatency
{
  int64_t speechEndTimestamp;
  double v4;
  double v5;
  double result;

  speechEndTimestamp = self->_speechEndTimestamp;
  if (speechEndTimestamp)
  {
    v4 = (double)(speechEndTimestamp - self->_requestCreatedTimestamp);
    -[VSInstrumentMetrics _clockFactor](self, "_clockFactor");
    return fmax(-(self->_audioDuration - v4 * v5), 0.0);
  }
  else
  {
    -[VSInstrumentMetrics timeToSpeakLatency](self, "timeToSpeakLatency");
  }
  return result;
}

- (double)audioQueueLatency
{
  double audioStartTimestampDiffs;
  double v3;

  audioStartTimestampDiffs = (double)self->_audioStartTimestampDiffs;
  -[VSInstrumentMetrics _clockFactor](self, "_clockFactor");
  return v3 * audioStartTimestampDiffs;
}

- (double)ttsSynthesisLatency
{
  int64_t synthesisEndTimestamp;
  double v3;
  double v4;

  synthesisEndTimestamp = self->_synthesisEndTimestamp;
  if (!synthesisEndTimestamp)
    return 0.0;
  v3 = (double)(synthesisEndTimestamp - self->_synthesisBeginTimestamp);
  -[VSInstrumentMetrics _clockFactor](self, "_clockFactor");
  return v4 * v3;
}

- (BOOL)isSynthesisCached
{
  return self->_isCacheHitFromDisk || self->_isCacheHitFromMemory;
}

- (double)eagerRequestTimeGap
{
  double eagerRequestCreatedTimestampDiffs;
  double v3;

  eagerRequestCreatedTimestampDiffs = (double)self->_eagerRequestCreatedTimestampDiffs;
  -[VSInstrumentMetrics _clockFactor](self, "_clockFactor");
  return v3 * eagerRequestCreatedTimestampDiffs;
}

- (double)realTimeFactor
{
  double audioDuration;
  double v3;

  audioDuration = self->_audioDuration;
  -[VSInstrumentMetrics ttsSynthesisLatency](self, "ttsSynthesisLatency");
  return audioDuration / v3;
}

- (double)cappedRealTimeFactor
{
  double v2;

  -[VSInstrumentMetrics realTimeFactor](self, "realTimeFactor");
  return fmin(v2, 999999999.0);
}

- (double)serverStreamFirstPacketLatency
{
  int64_t serverFirstPacketTimestamp;
  double v3;
  double v4;

  serverFirstPacketTimestamp = self->_serverFirstPacketTimestamp;
  if (!serverFirstPacketTimestamp)
    return 0.0;
  v3 = (double)(serverFirstPacketTimestamp - self->_synthesisBeginTimestamp);
  -[VSInstrumentMetrics _clockFactor](self, "_clockFactor");
  return v4 * v3;
}

- (double)serverStreamLastPacketLatency
{
  int64_t serverLastPacketTimestamp;
  double v3;
  double v4;

  serverLastPacketTimestamp = self->_serverLastPacketTimestamp;
  if (!serverLastPacketTimestamp)
    return 0.0;
  v3 = (double)(serverLastPacketTimestamp - self->_synthesisBeginTimestamp);
  -[VSInstrumentMetrics _clockFactor](self, "_clockFactor");
  return v4 * v3;
}

- (id)dictionaryMetrics
{
  uint64_t v3;
  const __CFString *voiceAssetKey;
  NSString *voiceResourceAssetKey;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  const __CFString *audioOutputRoute;
  uint64_t v14;
  const __CFString *clientBundleIdentifier;
  NSString *experimentIdentifier;
  const __CFString *v17;
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
  _QWORD v48[30];
  _QWORD v49[32];

  v49[30] = *MEMORY[0x1E0C80C00];
  v48[0] = CFSTR("character_count");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSString length](self->_utterance, "length"));
  v3 = objc_claimAutoreleasedReturnValue();
  v47 = (void *)v3;
  voiceAssetKey = (const __CFString *)self->_voiceAssetKey;
  voiceResourceAssetKey = self->_voiceResourceAssetKey;
  if (!voiceAssetKey)
    voiceAssetKey = &stru_1EA8B0C98;
  v49[0] = v3;
  v49[1] = voiceAssetKey;
  v48[1] = CFSTR("voice_asset_key");
  v48[2] = CFSTR("voice_resource_asset_key");
  if (voiceResourceAssetKey)
    v6 = (const __CFString *)voiceResourceAssetKey;
  else
    v6 = &stru_1EA8B0C98;
  v49[2] = v6;
  v48[3] = CFSTR("is_warm_start");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isWarmStart);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v49[3] = v46;
  v48[4] = CFSTR("tts_synthesis_latency");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  -[VSInstrumentMetrics ttsSynthesisLatency](self, "ttsSynthesisLatency");
  objc_msgSend(v7, "numberWithDouble:");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v49[4] = v45;
  v48[5] = CFSTR("tts_total_latency");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[VSInstrumentMetrics timeToSpeakLatency](self, "timeToSpeakLatency");
  objc_msgSend(v8, "numberWithDouble:");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v49[5] = v44;
  v48[6] = CFSTR("tts_and_playback_total_latency");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  -[VSInstrumentMetrics timeToPlaybackLatency](self, "timeToPlaybackLatency");
  objc_msgSend(v9, "numberWithDouble:");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v49[6] = v43;
  v48[7] = CFSTR("audio_queue_latency");
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[VSInstrumentMetrics audioQueueLatency](self, "audioQueueLatency");
  objc_msgSend(v10, "numberWithDouble:");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v49[7] = v42;
  v48[8] = CFSTR("audio_duration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_audioDuration);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v49[8] = v41;
  v48[9] = CFSTR("is_speech_request");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isSpeechRequest);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v49[9] = v40;
  v48[10] = CFSTR("synthesis_to_speech_time_gap");
  v11 = (void *)MEMORY[0x1E0CB37E8];
  -[VSInstrumentMetrics eagerRequestTimeGap](self, "eagerRequestTimeGap");
  objc_msgSend(v11, "numberWithDouble:");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v49[10] = v39;
  v48[11] = CFSTR("is_synthesis_cached");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[VSInstrumentMetrics isSynthesisCached](self, "isSynthesisCached"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v49[11] = v38;
  v48[12] = CFSTR("prompt_count");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_promptCount);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v49[12] = v37;
  v48[13] = CFSTR("source_of_tts");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_sourceOfTTS);
  v12 = objc_claimAutoreleasedReturnValue();
  v36 = (void *)v12;
  audioOutputRoute = (const __CFString *)self->_audioOutputRoute;
  if (!audioOutputRoute)
    audioOutputRoute = &stru_1EA8B0C98;
  v49[13] = v12;
  v49[14] = audioOutputRoute;
  v48[14] = CFSTR("audio_output_route");
  v48[15] = CFSTR("error_code");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_errorCode);
  v14 = objc_claimAutoreleasedReturnValue();
  v35 = (void *)v14;
  clientBundleIdentifier = (const __CFString *)self->_clientBundleIdentifier;
  experimentIdentifier = self->_experimentIdentifier;
  if (!clientBundleIdentifier)
    clientBundleIdentifier = &stru_1EA8B0C98;
  v49[15] = v14;
  v49[16] = clientBundleIdentifier;
  v48[16] = CFSTR("client_bundle_identifier");
  v48[17] = CFSTR("experiment_identifier");
  if (experimentIdentifier)
    v17 = (const __CFString *)experimentIdentifier;
  else
    v17 = &stru_1EA8B0C98;
  v49[17] = v17;
  v48[18] = CFSTR("is_server_tts");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isServerTTS);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v49[18] = v34;
  v48[19] = CFSTR("is_server_stream_tts");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isServerStreamTTS);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v49[19] = v33;
  v48[20] = CFSTR("is_server_timeout");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isServerTimeout);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v49[20] = v32;
  v48[21] = CFSTR("can_use_server_tts");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_canUseServerTTS);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v49[21] = v18;
  v48[22] = CFSTR("is_server_tts_racing");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isServerTTSRacing);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v49[22] = v19;
  v48[23] = CFSTR("server_first_packet_latency");
  v20 = (void *)MEMORY[0x1E0CB37E8];
  -[VSInstrumentMetrics serverStreamFirstPacketLatency](self, "serverStreamFirstPacketLatency");
  objc_msgSend(v20, "numberWithDouble:");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v49[23] = v21;
  v48[24] = CFSTR("server_last_packet_latency");
  v22 = (void *)MEMORY[0x1E0CB37E8];
  -[VSInstrumentMetrics serverStreamLastPacketLatency](self, "serverStreamLastPacketLatency");
  objc_msgSend(v22, "numberWithDouble:");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v49[24] = v23;
  v48[25] = CFSTR("server_streamed_audio_duration");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_serverStreamedAudioDuration);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v49[25] = v24;
  v48[26] = CFSTR("real_time_factor");
  v25 = (void *)MEMORY[0x1E0CB37E8];
  -[VSInstrumentMetrics cappedRealTimeFactor](self, "cappedRealTimeFactor");
  objc_msgSend(v25, "numberWithDouble:");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v49[26] = v26;
  v48[27] = CFSTR("neural_alignment_stall");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_neuralAlignmentStall);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v49[27] = v27;
  v48[28] = CFSTR("neural_audio_click");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_neuralAudioClick);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v49[28] = v28;
  v48[29] = CFSTR("neural_fallback");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_neuralFallback);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v49[29] = v29;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 30);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  return v30;
}

- (NSString)utterance
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUtterance:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSString)voiceAssetKey
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setVoiceAssetKey:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (NSString)voiceResourceAssetKey
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setVoiceResourceAssetKey:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSString)audioOutputRoute
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAudioOutputRoute:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (NSString)clientBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setClientBundleIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (NSString)experimentIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void)setExperimentIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (int64_t)requestCreatedTimestamp
{
  return self->_requestCreatedTimestamp;
}

- (void)setRequestCreatedTimestamp:(int64_t)a3
{
  self->_requestCreatedTimestamp = a3;
}

- (int64_t)eagerRequestCreatedTimestampDiffs
{
  return self->_eagerRequestCreatedTimestampDiffs;
}

- (void)setEagerRequestCreatedTimestampDiffs:(int64_t)a3
{
  self->_eagerRequestCreatedTimestampDiffs = a3;
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

- (int64_t)speechBeginTimestamp
{
  return self->_speechBeginTimestamp;
}

- (void)setSpeechBeginTimestamp:(int64_t)a3
{
  self->_speechBeginTimestamp = a3;
}

- (int64_t)speechEndTimestamp
{
  return self->_speechEndTimestamp;
}

- (void)setSpeechEndTimestamp:(int64_t)a3
{
  self->_speechEndTimestamp = a3;
}

- (int64_t)audioStartTimestampDiffs
{
  return self->_audioStartTimestampDiffs;
}

- (void)setAudioStartTimestampDiffs:(int64_t)a3
{
  self->_audioStartTimestampDiffs = a3;
}

- (int64_t)serverFirstPacketTimestamp
{
  return self->_serverFirstPacketTimestamp;
}

- (void)setServerFirstPacketTimestamp:(int64_t)a3
{
  self->_serverFirstPacketTimestamp = a3;
}

- (int64_t)serverLastPacketTimestamp
{
  return self->_serverLastPacketTimestamp;
}

- (void)setServerLastPacketTimestamp:(int64_t)a3
{
  self->_serverLastPacketTimestamp = a3;
}

- (double)serverStreamedAudioDuration
{
  return self->_serverStreamedAudioDuration;
}

- (void)setServerStreamedAudioDuration:(double)a3
{
  self->_serverStreamedAudioDuration = a3;
}

- (double)audioDuration
{
  return self->_audioDuration;
}

- (void)setAudioDuration:(double)a3
{
  self->_audioDuration = a3;
}

- (BOOL)isWarmStart
{
  return self->_isWarmStart;
}

- (void)setIsWarmStart:(BOOL)a3
{
  self->_isWarmStart = a3;
}

- (BOOL)isServerTTS
{
  return self->_isServerTTS;
}

- (void)setIsServerTTS:(BOOL)a3
{
  self->_isServerTTS = a3;
}

- (BOOL)isServerStreamTTS
{
  return self->_isServerStreamTTS;
}

- (void)setIsServerStreamTTS:(BOOL)a3
{
  self->_isServerStreamTTS = a3;
}

- (BOOL)isServerTimeout
{
  return self->_isServerTimeout;
}

- (void)setIsServerTimeout:(BOOL)a3
{
  self->_isServerTimeout = a3;
}

- (BOOL)isServerTTSRacing
{
  return self->_isServerTTSRacing;
}

- (void)setIsServerTTSRacing:(BOOL)a3
{
  self->_isServerTTSRacing = a3;
}

- (BOOL)canUseServerTTS
{
  return self->_canUseServerTTS;
}

- (void)setCanUseServerTTS:(BOOL)a3
{
  self->_canUseServerTTS = a3;
}

- (BOOL)neuralAlignmentStall
{
  return self->_neuralAlignmentStall;
}

- (void)setNeuralAlignmentStall:(BOOL)a3
{
  self->_neuralAlignmentStall = a3;
}

- (BOOL)neuralAudioClick
{
  return self->_neuralAudioClick;
}

- (void)setNeuralAudioClick:(BOOL)a3
{
  self->_neuralAudioClick = a3;
}

- (BOOL)neuralFallback
{
  return self->_neuralFallback;
}

- (void)setNeuralFallback:(BOOL)a3
{
  self->_neuralFallback = a3;
}

- (int64_t)promptCount
{
  return self->_promptCount;
}

- (void)setPromptCount:(int64_t)a3
{
  self->_promptCount = a3;
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

- (BOOL)isCacheHitFromDisk
{
  return self->_isCacheHitFromDisk;
}

- (void)setIsCacheHitFromDisk:(BOOL)a3
{
  self->_isCacheHitFromDisk = a3;
}

- (BOOL)isCacheHitFromMemory
{
  return self->_isCacheHitFromMemory;
}

- (void)setIsCacheHitFromMemory:(BOOL)a3
{
  self->_isCacheHitFromMemory = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_experimentIdentifier, 0);
  objc_storeStrong((id *)&self->_clientBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_audioOutputRoute, 0);
  objc_storeStrong((id *)&self->_voiceResourceAssetKey, 0);
  objc_storeStrong((id *)&self->_voiceAssetKey, 0);
  objc_storeStrong((id *)&self->_utterance, 0);
}

double __35__VSInstrumentMetrics__clockFactor__block_invoke()
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
  _clockFactor_clockToSeconds = *(_QWORD *)&result;
  return result;
}

+ (id)descriptionFormatter
{
  if (descriptionFormatter_onceToken != -1)
    dispatch_once(&descriptionFormatter_onceToken, &__block_literal_global);
  return (id)descriptionFormatter_formatter;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)stringOfSourceOfTTS:(int64_t)a3
{
  if ((unint64_t)a3 > 8)
    return CFSTR("unknown");
  else
    return off_1EA8AF0A0[a3];
}

uint64_t __43__VSInstrumentMetrics_descriptionFormatter__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)descriptionFormatter_formatter;
  descriptionFormatter_formatter = v0;

  objc_msgSend((id)descriptionFormatter_formatter, "setMinimumFractionDigits:", 0);
  return objc_msgSend((id)descriptionFormatter_formatter, "setMaximumFractionDigits:", 4);
}

+ (id)vs_metricsFromSTSMetrics:(id)a3
{
  id v3;
  VSInstrumentMetrics *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  _BOOL8 v17;

  v3 = a3;
  v4 = objc_alloc_init(VSInstrumentMetrics);
  objc_msgSend(v3, "utterance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSInstrumentMetrics setUtterance:](v4, "setUtterance:", v5);

  objc_msgSend(v3, "voiceAssetKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSInstrumentMetrics setVoiceAssetKey:](v4, "setVoiceAssetKey:", v6);

  objc_msgSend(v3, "voiceResourceAssetKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSInstrumentMetrics setVoiceResourceAssetKey:](v4, "setVoiceResourceAssetKey:", v7);

  objc_msgSend(v3, "audioOutputRoute");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSInstrumentMetrics setAudioOutputRoute:](v4, "setAudioOutputRoute:", v8);

  objc_msgSend(v3, "clientBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSInstrumentMetrics setClientBundleIdentifier:](v4, "setClientBundleIdentifier:", v9);

  objc_msgSend(v3, "experimentIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VSInstrumentMetrics setExperimentIdentifier:](v4, "setExperimentIdentifier:", v10);

  -[VSInstrumentMetrics setRequestCreatedTimestamp:](v4, "setRequestCreatedTimestamp:", objc_msgSend(v3, "requestCreatedTime"));
  objc_msgSend(v3, "eagerRequestGapInterval");
  v12 = v11;
  -[VSInstrumentMetrics _clockFactor](v4, "_clockFactor");
  -[VSInstrumentMetrics setEagerRequestCreatedTimestampDiffs:](v4, "setEagerRequestCreatedTimestampDiffs:", (uint64_t)(v12 / v13));
  -[VSInstrumentMetrics setSynthesisBeginTimestamp:](v4, "setSynthesisBeginTimestamp:", objc_msgSend(v3, "synthesisBeginTime"));
  -[VSInstrumentMetrics setSynthesisEndTimestamp:](v4, "setSynthesisEndTimestamp:", objc_msgSend(v3, "synthesisEndTime"));
  -[VSInstrumentMetrics setSpeechBeginTimestamp:](v4, "setSpeechBeginTimestamp:", objc_msgSend(v3, "speechBeginTime"));
  -[VSInstrumentMetrics setSpeechEndTimestamp:](v4, "setSpeechEndTimestamp:", objc_msgSend(v3, "speechEndTime"));
  objc_msgSend(v3, "audioStartLatency");
  v15 = v14;
  -[VSInstrumentMetrics _clockFactor](v4, "_clockFactor");
  -[VSInstrumentMetrics setAudioStartTimestampDiffs:](v4, "setAudioStartTimestampDiffs:", (uint64_t)(v15 / v16));
  -[VSInstrumentMetrics setServerFirstPacketTimestamp:](v4, "setServerFirstPacketTimestamp:", objc_msgSend(v3, "serverFirstPacketTime"));
  -[VSInstrumentMetrics setServerLastPacketTimestamp:](v4, "setServerLastPacketTimestamp:", objc_msgSend(v3, "serverLastPacketTime"));
  objc_msgSend(v3, "serverStreamedAudioDuration");
  -[VSInstrumentMetrics setServerStreamedAudioDuration:](v4, "setServerStreamedAudioDuration:");
  objc_msgSend(v3, "audioDuration");
  -[VSInstrumentMetrics setAudioDuration:](v4, "setAudioDuration:");
  -[VSInstrumentMetrics setIsWarmStart:](v4, "setIsWarmStart:", objc_msgSend(v3, "isWarmStart"));
  v17 = objc_msgSend(v3, "sourceOfTTS") == 5 || objc_msgSend(v3, "sourceOfTTS") == 3;
  -[VSInstrumentMetrics setIsServerTTS:](v4, "setIsServerTTS:", v17);
  -[VSInstrumentMetrics setIsServerStreamTTS:](v4, "setIsServerStreamTTS:", objc_msgSend(v3, "sourceOfTTS") == 5);
  -[VSInstrumentMetrics setIsServerTimeout:](v4, "setIsServerTimeout:", objc_msgSend(v3, "errorCode") == 602);
  -[VSInstrumentMetrics setIsServerTTSRacing:](v4, "setIsServerTTSRacing:", objc_msgSend(v3, "isServerTTSRacing"));
  -[VSInstrumentMetrics setCanUseServerTTS:](v4, "setCanUseServerTTS:", objc_msgSend(v3, "privacySensitive") ^ 1);
  -[VSInstrumentMetrics setNeuralAlignmentStall:](v4, "setNeuralAlignmentStall:", objc_msgSend(v3, "neuralAlignmentStall"));
  -[VSInstrumentMetrics setNeuralAudioClick:](v4, "setNeuralAudioClick:", objc_msgSend(v3, "neuralAudioClick"));
  -[VSInstrumentMetrics setNeuralFallback:](v4, "setNeuralFallback:", objc_msgSend(v3, "neuralFallback"));
  -[VSInstrumentMetrics setPromptCount:](v4, "setPromptCount:", objc_msgSend(v3, "promptCount"));
  -[VSInstrumentMetrics setErrorCode:](v4, "setErrorCode:", objc_msgSend(v3, "errorCode"));
  -[VSInstrumentMetrics setSourceOfTTS:](v4, "setSourceOfTTS:", objc_msgSend(v3, "sourceOfTTS"));
  -[VSInstrumentMetrics setIsCacheHitFromDisk:](v4, "setIsCacheHitFromDisk:", objc_msgSend(v3, "sourceOfTTS") == 8);

  return v4;
}

@end
