@implementation VSTextToPhonemesTask

- (BOOL)isSpeaking
{
  return 0;
}

- (void)main
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint8_t buf[4];
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  VSGetLogDefault();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134217984;
    v20 = objc_msgSend(v14, "requestCreatedTimestamp");
    _os_log_debug_impl(&dword_21AA84000, v3, OS_LOG_TYPE_DEBUG, "Starting text to phonemes task %llu", buf, 0xCu);

  }
  -[VSSpeechSpeakTask fetchVoiceAsset](self, "fetchVoiceAsset");
  -[VSSpeechSpeakTask voiceSelection](self, "voiceSelection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x24BEC0DC0];
    -[VSSpeechSpeakTask request](self, "request");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechSpeakTask voiceSelection](self, "voiceSelection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "voicePath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    objc_msgSend(v5, "generateTTSPhonemes:voicePath:phonemeSystem:error:", v7, v9, -[VSTextToPhonemesTask phonemeSystem](self, "phonemeSystem"), &v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v17;

    v18 = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v18, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[VSSpeechSpeakTask setPhonemes:](self, "setPhonemes:", v12);

    -[VSSpeechSpeakTask setError:](self, "setError:", v11);
  }
  VSGetLogDefault();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    -[VSSpeechSpeakTask instrumentMetrics](self, "instrumentMetrics");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "requestCreatedTimestamp");
    *(_DWORD *)buf = 134217984;
    v20 = v16;
    _os_log_debug_impl(&dword_21AA84000, v13, OS_LOG_TYPE_DEBUG, "Finished text to phonemes task %llu", buf, 0xCu);

  }
}

- (int64_t)phonemeSystem
{
  return self->_phonemeSystem;
}

- (void)setPhonemeSystem:(int64_t)a3
{
  self->_phonemeSystem = a3;
}

- (id)reply
{
  return self->_reply;
}

- (void)setReply:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 416);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_reply, 0);
}

@end
