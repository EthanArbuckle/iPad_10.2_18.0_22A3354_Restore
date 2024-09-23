@implementation SVXSpeechInstrumentationUtilities

- (void)emitTextToSpeechRequestReceived:(id)a3 instrumentMetrics:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  int v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v6 = (objc_class *)MEMORY[0x24BE95B48];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  objc_msgSend(v5, "voice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assetKey");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setVoiceAssetKey:", v10);

  objc_msgSend(v5, "resource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "assetKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setVoiceResourceAssetKey:", v12);

  objc_msgSend(v8, "setIsWarmStart:", objc_msgSend(v5, "isWarmStart"));
  objc_msgSend(v8, "setIsSynthesisCached:", objc_msgSend(v5, "sourceOfTTS") == 8);
  objc_msgSend(v8, "setSourceOfTTS:", objc_msgSend(v5, "sourceOfTTS"));
  objc_msgSend(v8, "setSpeechError:", objc_msgSend(v5, "errorCode"));
  v13 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_INFO))
  {
    v14 = 136315138;
    v15 = "-[SVXSpeechInstrumentationUtilities emitTextToSpeechRequestReceived:instrumentMetrics:]";
    _os_log_impl(&dword_214934000, v13, OS_LOG_TYPE_INFO, "%s #SVXInstrumentation - Emit TTS Request Received event", (uint8_t *)&v14, 0xCu);
  }
  objc_msgSend(v7, "emitInstrumentation:machAbsoluteTime:", v8, objc_msgSend(v5, "requestCreatedTime"));

}

@end
