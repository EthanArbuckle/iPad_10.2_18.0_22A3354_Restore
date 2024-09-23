@implementation SFSpeechSynthesizer

- (SFSpeechSynthesizer)init
{
  void *v3;
  void *v4;
  SFSpeechSynthesizer *v5;

  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFSpeechSynthesisVoice getDefaultVoiceByLocale:](SFSpeechSynthesisVoice, "getDefaultVoiceByLocale:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    self = -[SFSpeechSynthesizer initWithVoice:](self, "initWithVoice:", v4);
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (SFSpeechSynthesizer)initWithVoice:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  SFSpeechSynthesizer *v8;
  SFSpeechSynthesizer *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *deviceTaskQueue;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *serverTaskQueue;
  dispatch_queue_t v15;
  OS_dispatch_queue *cacheTaskQueue;
  objc_super v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  SFSSGetLogObject();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v5, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v20 = v7;
    _os_log_impl(&dword_21E284000, v6, OS_LOG_TYPE_INFO, "Init Synthesizer with voice: %@", buf, 0xCu);

  }
  v18.receiver = self;
  v18.super_class = (Class)SFSpeechSynthesizer;
  v8 = -[SFSpeechSynthesizer init](&v18, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_voice, a3);
    v10 = dispatch_queue_create("com.apple.speech.speechsynthesis.task.device", 0);
    deviceTaskQueue = v9->_deviceTaskQueue;
    v9->_deviceTaskQueue = (OS_dispatch_queue *)v10;

    v12 = MEMORY[0x24BDAC9C0];
    v13 = dispatch_queue_create("com.apple.speech.speechsynthesis.task.server", MEMORY[0x24BDAC9C0]);
    serverTaskQueue = v9->_serverTaskQueue;
    v9->_serverTaskQueue = (OS_dispatch_queue *)v13;

    v15 = dispatch_queue_create("com.apple.speech.speechsynthesis.task.cache", v12);
    cacheTaskQueue = v9->_cacheTaskQueue;
    v9->_cacheTaskQueue = (OS_dispatch_queue *)v15;

  }
  return v9;
}

- (void)prewarm:(int64_t)a3
{
  id v3;

  if (!a3)
  {
    +[SFSSOspreyTTSClient sharedInstance](SFSSOspreyTTSClient, "sharedInstance");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "prewarm");

  }
}

- (id)startTaskWithRequest:(id)a3 completion:(id)a4
{
  return -[SFSpeechSynthesizer startTaskWithRequest:delegate:completion:](self, "startTaskWithRequest:delegate:completion:", a3, 0, a4);
}

- (id)startTaskWithRequest:(id)a3 delegate:(id)a4
{
  return -[SFSpeechSynthesizer startTaskWithRequest:delegate:completion:](self, "startTaskWithRequest:delegate:completion:", a3, a4, 0);
}

- (id)startTaskWithRequest:(id)a3 delegate:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  NSObject *cacheTaskQueue;
  id *v28;
  id *v29;
  SFSSCacheTask *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  SFSSDeviceTTSTask *v39;
  NSObject *deviceTaskQueue;
  id *v41;
  SFSSDeviceTTSTask *v42;
  id *v43;
  _QWORD *v44;
  SFSSServerTTSTask *v45;
  SFSSCacheTask *v46;
  SFSSCacheTask *v47;
  NSObject *v48;
  _QWORD v50[4];
  SFSSDeviceTTSTask *v51;
  id v52;
  _QWORD v53[4];
  SFSSDeviceTTSTask *v54;
  id v55;
  _QWORD block[4];
  uint64_t v57;
  id v58;
  _QWORD v59[4];
  SFSSCacheTask *v60;
  id v61;
  uint8_t buf[4];
  id v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[SFSpeechSynthesisVoice gender](self->_voice, "gender");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setGender:", v11);

  -[SFSpeechSynthesisVoice locale](self->_voice, "locale");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localeIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setLocale:", v13);

  -[SFSpeechSynthesisVoice name](self->_voice, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setVoiceName:", v14);

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "bundleIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClientBundleIdentifier:", v16);

  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "UUIDString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRequestIdentifer:", v18);

  objc_msgSend(v8, "setVoice:", self->_voice);
  SFSSGetLogObject();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v63 = v8;
    _os_log_impl(&dword_21E284000, v19, OS_LOG_TYPE_INFO, "SpeakRequest: %@", buf, 0xCu);
  }

  if (objc_msgSend(v8, "useCache"))
  {
    objc_msgSend(v8, "voiceName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "text");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    +[SFSSCacheItem generateCacheKey:text:](SFSSCacheItem, "generateCacheKey:text:", v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    +[SFSSCachingService sharedInstance](SFSSCachingService, "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "objectForKey:", v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      SFSSGetLogObject();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v8, "requestIdentifer");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v63 = v26;
        _os_log_impl(&dword_21E284000, v25, OS_LOG_TYPE_INFO, "Found request in cache: %@", buf, 0xCu);

      }
      if (objc_msgSend(v8, "type"))
      {
        cacheTaskQueue = self->_cacheTaskQueue;
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __64__SFSpeechSynthesizer_startTaskWithRequest_delegate_completion___block_invoke_2;
        block[3] = &unk_24E246BC8;
        v28 = &v58;
        v29 = (id *)&v57;
        v57 = 0;
        v58 = v10;
        dispatch_async(cacheTaskQueue, block);
        v30 = 0;
      }
      else
      {
        v47 = -[SFSSCacheTask initWithRequest:]([SFSSCacheTask alloc], "initWithRequest:", v8);
        -[SFSpeechSynthesisTask setDelegate:](v47, "setDelegate:", v9);
        v48 = self->_cacheTaskQueue;
        v59[0] = MEMORY[0x24BDAC760];
        v59[1] = 3221225472;
        v59[2] = __64__SFSpeechSynthesizer_startTaskWithRequest_delegate_completion___block_invoke;
        v59[3] = &unk_24E246BC8;
        v28 = (id *)&v60;
        v30 = v47;
        v60 = v30;
        v29 = &v61;
        v61 = v10;
        dispatch_async(v48, v59);
      }

      v46 = v30;
      goto LABEL_20;
    }

  }
  if (objc_msgSend(v8, "solutionType"))
  {
    -[SFSpeechSynthesisVoice voiceAsset](self->_voice, "voiceAsset");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v31)
    {
      +[SFSSAssetManager sharedInstance](SFSSAssetManager, "sharedInstance");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "getVoiceAssetByVoice:", self->_voice);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      -[SFSpeechSynthesizer voice](self, "voice");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setVoiceAsset:", v33);

    }
    -[SFSpeechSynthesisVoice resourceAsset](self->_voice, "resourceAsset");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v35)
    {
      +[SFSSAssetManager sharedInstance](SFSSAssetManager, "sharedInstance");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "getResoruceAssetByVoice:", self->_voice);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      -[SFSpeechSynthesizer voice](self, "voice");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setResourceAsset:", v37);

    }
    v39 = -[SFSSDeviceTTSTask initWithRequest:]([SFSSDeviceTTSTask alloc], "initWithRequest:", v8);
    -[SFSpeechSynthesisTask setDelegate:](v39, "setDelegate:", v9);
    deviceTaskQueue = self->_deviceTaskQueue;
    v50[0] = MEMORY[0x24BDAC760];
    v50[1] = 3221225472;
    v50[2] = __64__SFSpeechSynthesizer_startTaskWithRequest_delegate_completion___block_invoke_4;
    v50[3] = &unk_24E246BC8;
    v41 = (id *)&v51;
    v42 = v39;
    v51 = v42;
    v43 = &v52;
    v52 = v10;
    v44 = v50;
  }
  else
  {
    v45 = -[SFSSServerTTSTask initWithRequest:]([SFSSServerTTSTask alloc], "initWithRequest:", v8);
    -[SFSpeechSynthesisTask setDelegate:](v45, "setDelegate:", v9);
    deviceTaskQueue = self->_serverTaskQueue;
    v53[0] = MEMORY[0x24BDAC760];
    v53[1] = 3221225472;
    v53[2] = __64__SFSpeechSynthesizer_startTaskWithRequest_delegate_completion___block_invoke_3;
    v53[3] = &unk_24E246BC8;
    v41 = (id *)&v54;
    v42 = v45;
    v54 = v42;
    v43 = &v55;
    v55 = v10;
    v44 = v53;
  }
  dispatch_async(deviceTaskQueue, v44);

  v46 = v42;
LABEL_20:

  return v46;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SFSpeechSynthesizer;
  -[SFSpeechSynthesizer dealloc](&v2, sel_dealloc);
}

- (NSLocale)locale
{
  return self->_locale;
}

- (SFSpeechSynthesisVoice)voice
{
  return self->_voice;
}

- (BOOL)isVoiceAssetDownloaded
{
  return self->_isVoiceAssetDownloaded;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voice, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_cacheTaskQueue, 0);
  objc_storeStrong((id *)&self->_deviceTaskQueue, 0);
  objc_storeStrong((id *)&self->_serverTaskQueue, 0);
}

uint64_t __64__SFSpeechSynthesizer_startTaskWithRequest_delegate_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "start:", *(_QWORD *)(a1 + 40));
}

void __64__SFSpeechSynthesizer_startTaskWithRequest_delegate_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

uint64_t __64__SFSpeechSynthesizer_startTaskWithRequest_delegate_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "start:", *(_QWORD *)(a1 + 40));
}

uint64_t __64__SFSpeechSynthesizer_startTaskWithRequest_delegate_completion___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "start:", *(_QWORD *)(a1 + 40));
}

+ (void)initialize
{
  objc_opt_class();
}

+ (id)supportedLocales
{
  return +[SFSpeechSynthesisVoice supportedLocales](SFSpeechSynthesisVoice, "supportedLocales");
}

+ (id)supportedVoicesByLocale:(id)a3
{
  return +[SFSpeechSynthesisVoice supportedVoicesByLocale:](SFSpeechSynthesisVoice, "supportedVoicesByLocale:", a3);
}

+ (id)getVoiceByName:(id)a3
{
  return +[SFSpeechSynthesisVoice getVoiceByName:](SFSpeechSynthesisVoice, "getVoiceByName:", a3);
}

@end
