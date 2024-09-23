@implementation SiriTTSOspreyRequest

- (id)underlyingRequest
{
  OPTTSMutableStartTextToSpeechStreamingRequest *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  OPTTSMutableTextToSpeechRequestProsodyControlConfig *v15;
  void *v16;
  float v17;
  float v18;
  void *v19;
  float v20;
  uint64_t v21;
  float v22;
  float v23;
  void *v24;
  float v25;
  uint64_t v26;
  float v27;
  float v28;
  void *v29;
  float v30;
  uint64_t v31;
  OPTTSMutableTTSRequestFeatureFlags *v32;
  OPTTSMutableTextToSpeechRequestMeta *v33;
  void *v34;
  void *v35;
  OPTTSMutableTextToSpeechRequestExperiment *v36;
  void *v37;

  v3 = objc_alloc_init(OPTTSMutableStartTextToSpeechStreamingRequest);
  -[SiriTTSOspreyRequest speechId](self, "speechId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[OPTTSMutableStartTextToSpeechStreamingRequest setSpeech_id:](v3, "setSpeech_id:", v4);

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[OPTTSMutableStartTextToSpeechStreamingRequest setSession_id:](v3, "setSession_id:", v6);

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = objc_claimAutoreleasedReturnValue();
  -[OPTTSMutableStartTextToSpeechStreamingRequest setStream_id:](v3, "setStream_id:", v8);

  -[SiriTTSOspreyRequest language](self, "language");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[OPTTSMutableStartTextToSpeechStreamingRequest setLanguage:](v3, "setLanguage:", v9);

  -[SiriTTSOspreyRequest voiceName](self, "voiceName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[OPTTSMutableStartTextToSpeechStreamingRequest setVoice_name:](v3, "setVoice_name:", v10);

  -[SiriTTSOspreyRequest preferredType](self, "preferredType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v8) = objc_msgSend(v11, "isEqualToString:", CFSTR("neural"));

  if ((v8 & 1) != 0)
  {
    v12 = 1;
LABEL_5:
    -[OPTTSMutableStartTextToSpeechStreamingRequest setPreferred_voice_type:](v3, "setPreferred_voice_type:", v12);
    goto LABEL_6;
  }
  -[SiriTTSOspreyRequest preferredType](self, "preferredType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqualToString:", CFSTR("gryphon"));

  if (v14)
  {
    v12 = 2;
    goto LABEL_5;
  }
LABEL_6:
  v15 = objc_alloc_init(OPTTSMutableTextToSpeechRequestProsodyControlConfig);
  -[SiriTTSOspreyRequest neuralSentencePitch](self, "neuralSentencePitch");
  -[OPTTSMutableTextToSpeechRequestProsodyControlConfig setGlobal_sent_pitch:](v15, "setGlobal_sent_pitch:");
  -[SiriTTSOspreyRequest neuralSentencePitchRange](self, "neuralSentencePitchRange");
  -[OPTTSMutableTextToSpeechRequestProsodyControlConfig setGlobal_sent_pitchrange:](v15, "setGlobal_sent_pitchrange:");
  -[SiriTTSOspreyRequest neuralSentenceDuration](self, "neuralSentenceDuration");
  -[OPTTSMutableTextToSpeechRequestProsodyControlConfig setGlobal_sent_duration:](v15, "setGlobal_sent_duration:");
  -[SiriTTSOspreyRequest neuralSentenceEnergy](self, "neuralSentenceEnergy");
  -[OPTTSMutableTextToSpeechRequestProsodyControlConfig setGlobal_sent_energy:](v15, "setGlobal_sent_energy:");
  -[SiriTTSOspreyRequest neuralSentenceTilt](self, "neuralSentenceTilt");
  -[OPTTSMutableTextToSpeechRequestProsodyControlConfig setGlobal_sent_tilt:](v15, "setGlobal_sent_tilt:");
  -[OPTTSMutableStartTextToSpeechStreamingRequest setProsody_control_config:](v3, "setProsody_control_config:", v15);
  -[SiriTTSOspreyRequest text](self, "text");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriTTSOspreyRequest volume](self, "volume");
  if (v17 != 0.8)
  {
    -[SiriTTSOspreyRequest volume](self, "volume");
    if (v18 != 0.0)
    {
      v19 = (void *)MEMORY[0x1E0CB3940];
      -[SiriTTSOspreyRequest volume](self, "volume");
      objc_msgSend(v19, "stringWithFormat:", CFSTR("\x1B\\vol=%d\\%@"), (int)(v20 * 100.0), v16);
      v21 = objc_claimAutoreleasedReturnValue();

      v16 = (void *)v21;
    }
  }
  -[SiriTTSOspreyRequest rate](self, "rate");
  if (v22 != 1.0)
  {
    -[SiriTTSOspreyRequest rate](self, "rate");
    if (v23 != 0.0)
    {
      v24 = (void *)MEMORY[0x1E0CB3940];
      -[SiriTTSOspreyRequest rate](self, "rate");
      objc_msgSend(v24, "stringWithFormat:", CFSTR("\x1B\\rate=%d\\%@"), (int)(v25 * 100.0), v16);
      v26 = objc_claimAutoreleasedReturnValue();

      v16 = (void *)v26;
    }
  }
  -[SiriTTSOspreyRequest pitch](self, "pitch");
  if (v27 != 1.0)
  {
    -[SiriTTSOspreyRequest pitch](self, "pitch");
    if (v28 != 0.0)
    {
      v29 = (void *)MEMORY[0x1E0CB3940];
      -[SiriTTSOspreyRequest pitch](self, "pitch");
      objc_msgSend(v29, "stringWithFormat:", CFSTR("\x1B\\pitch=%d\\%@"), (int)(v30 * 100.0), v16);
      v31 = objc_claimAutoreleasedReturnValue();

      v16 = (void *)v31;
    }
  }
  -[OPTTSMutableStartTextToSpeechStreamingRequest setText:](v3, "setText:", v16);
  -[OPTTSMutableStartTextToSpeechStreamingRequest setAudio_type:](v3, "setAudio_type:", 1);
  -[OPTTSMutableStartTextToSpeechStreamingRequest setEnable_word_timing_info:](v3, "setEnable_word_timing_info:", 1);
  if (-[SiriTTSOspreyRequest serverLogs](self, "serverLogs"))
  {
    v32 = objc_alloc_init(OPTTSMutableTTSRequestFeatureFlags);
    -[OPTTSMutableTTSRequestFeatureFlags setFe_feature:](v32, "setFe_feature:", 1);
    -[OPTTSMutableStartTextToSpeechStreamingRequest setFeature_flags:](v3, "setFeature_flags:", v32);

  }
  v33 = objc_alloc_init(OPTTSMutableTextToSpeechRequestMeta);
  -[SiriTTSOspreyRequest appId](self, "appId");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[OPTTSMutableTextToSpeechRequestMeta setApp_id:](v33, "setApp_id:", v34);

  -[OPTTSMutableTextToSpeechRequestMeta setChannel_type:](v33, "setChannel_type:", 2);
  -[OPTTSMutableStartTextToSpeechStreamingRequest setMeta_info:](v3, "setMeta_info:", v33);
  -[SiriTTSOspreyRequest experimentId](self, "experimentId");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    v36 = objc_alloc_init(OPTTSMutableTextToSpeechRequestExperiment);
    -[SiriTTSOspreyRequest experimentId](self, "experimentId");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[OPTTSMutableTextToSpeechRequestExperiment setExperiment_identifier:](v36, "setExperiment_identifier:", v37);

    -[OPTTSMutableStartTextToSpeechStreamingRequest setExperiment:](v3, "setExperiment:", v36);
  }

  return v3;
}

- (NSString)language
{
  return self->_language;
}

- (void)setLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)voiceName
{
  return self->_voiceName;
}

- (void)setVoiceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)preferredType
{
  return self->_preferredType;
}

- (void)setPreferredType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSString)speechId
{
  return self->_speechId;
}

- (void)setSpeechId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)appId
{
  return self->_appId;
}

- (void)setAppId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)experimentId
{
  return self->_experimentId;
}

- (void)setExperimentId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (unint64_t)requestCreatedTime
{
  return self->_requestCreatedTime;
}

- (void)setRequestCreatedTime:(unint64_t)a3
{
  self->_requestCreatedTime = a3;
}

- (float)pitch
{
  return self->_pitch;
}

- (void)setPitch:(float)a3
{
  self->_pitch = a3;
}

- (float)rate
{
  return self->_rate;
}

- (void)setRate:(float)a3
{
  self->_rate = a3;
}

- (float)volume
{
  return self->_volume;
}

- (void)setVolume:(float)a3
{
  self->_volume = a3;
}

- (float)neuralSentencePitch
{
  return self->_neuralSentencePitch;
}

- (void)setNeuralSentencePitch:(float)a3
{
  self->_neuralSentencePitch = a3;
}

- (float)neuralSentencePitchRange
{
  return self->_neuralSentencePitchRange;
}

- (void)setNeuralSentencePitchRange:(float)a3
{
  self->_neuralSentencePitchRange = a3;
}

- (float)neuralSentenceDuration
{
  return self->_neuralSentenceDuration;
}

- (void)setNeuralSentenceDuration:(float)a3
{
  self->_neuralSentenceDuration = a3;
}

- (float)neuralSentenceEnergy
{
  return self->_neuralSentenceEnergy;
}

- (void)setNeuralSentenceEnergy:(float)a3
{
  self->_neuralSentenceEnergy = a3;
}

- (float)neuralSentenceTilt
{
  return self->_neuralSentenceTilt;
}

- (void)setNeuralSentenceTilt:(float)a3
{
  self->_neuralSentenceTilt = a3;
}

- (BOOL)serverLogs
{
  return self->_serverLogs;
}

- (void)setServerLogs:(BOOL)a3
{
  self->_serverLogs = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_experimentId, 0);
  objc_storeStrong((id *)&self->_appId, 0);
  objc_storeStrong((id *)&self->_speechId, 0);
  objc_storeStrong((id *)&self->_preferredType, 0);
  objc_storeStrong((id *)&self->_voiceName, 0);
  objc_storeStrong((id *)&self->_text, 0);
  objc_storeStrong((id *)&self->_language, 0);
}

@end
