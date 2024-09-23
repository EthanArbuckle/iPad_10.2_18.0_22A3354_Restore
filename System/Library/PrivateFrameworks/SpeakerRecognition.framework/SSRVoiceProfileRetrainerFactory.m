@implementation SSRVoiceProfileRetrainerFactory

- (SSRVoiceProfileRetrainerFactory)init
{
  void *v3;
  int v4;
  SSRVoiceProfileRetrainerFactory *v5;
  NSObject *v6;
  objc_super v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE28438], "sharedPreferences");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isSpeakerRecognitionAvailable");

  if (v4)
  {
    v8.receiver = self;
    v8.super_class = (Class)SSRVoiceProfileRetrainerFactory;
    self = -[SSRVoiceProfileRetrainerFactory init](&v8, sel_init);
    v5 = self;
  }
  else
  {
    v6 = *MEMORY[0x24BE284B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE284B8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[SSRVoiceProfileRetrainerFactory init]";
      _os_log_error_impl(&dword_2117D4000, v6, OS_LOG_TYPE_ERROR, "%s ERR: SpeakerRecognition is not available on this platform", buf, 0xCu);
    }
    v5 = 0;
  }

  return v5;
}

- (id)voiceRetrainersWithContext:(id)a3
{
  id v3;
  id v4;
  SSRVoiceProfileRetrainerPSR *v5;
  SSRVoiceProfileRetrainerSAT *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  SSRVoiceProfileRetrainerPSRExclave *v20;
  SSRVoiceProfileRetrainerSATExclave *v21;
  void *v22;
  id v23;
  void *v25;
  SSRVoiceProfileRetrainerPSR *v26;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v5 = -[SSRVoiceProfileRetrainerPSR initWithVoiceRetrainingContext:]([SSRVoiceProfileRetrainerPSR alloc], "initWithVoiceRetrainingContext:", v3);
  if (v5)
    objc_msgSend(v4, "addObject:", v5);
  v6 = -[SSRVoiceProfileRetrainerSAT initWithVoiceRetrainingContext:]([SSRVoiceProfileRetrainerSAT alloc], "initWithVoiceRetrainingContext:", v3);
  if (v6)
    objc_msgSend(v4, "addObject:", v6);
  objc_msgSend(v3, "asset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "assetVariant");
  v9 = objc_msgSend(v7, "assetProvider");
  if (objc_msgSend(MEMORY[0x24BE28488], "isExclaveHardware"))
  {
    v26 = v5;
    +[CoreSpeechExclaveAssetController sharedInstance](CoreSpeechExclaveAssetController, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "voiceProfile");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "locale");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fetchSecureAssetForLocale:assetType:", v12, 5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 == 2 && v9 == 2)
    {
      +[CoreSpeechExclaveAssetController sharedInstance](CoreSpeechExclaveAssetController, "sharedInstance");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "voiceProfile");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "locale");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "resourcePath");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "configVersion");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "secureOTAAssetForLocale:assetType:resourcePath:configVersion:", v15, 5, v16, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        v19 = v18;

        v13 = v19;
      }
      v5 = v26;

    }
    else
    {
      v5 = v26;
    }
    v20 = -[SSRVoiceProfileRetrainerPSRExclave initWithVoiceRetrainingContext:secureAsset:]([SSRVoiceProfileRetrainerPSRExclave alloc], "initWithVoiceRetrainingContext:secureAsset:", v3, v13);
    if (v20)
      objc_msgSend(v4, "addObject:", v20);
    v21 = -[SSRVoiceProfileRetrainerSATExclave initWithVoiceRetrainingContext:secureAsset:]([SSRVoiceProfileRetrainerSATExclave alloc], "initWithVoiceRetrainingContext:secureAsset:", v3, v13);
    if (v21)
      objc_msgSend(v4, "addObject:", v21);

  }
  if (objc_msgSend(v4, "count"))
    v22 = v4;
  else
    v22 = 0;
  v23 = v22;

  return v23;
}

@end
