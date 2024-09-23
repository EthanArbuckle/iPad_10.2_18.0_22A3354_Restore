@implementation SFSSCacheTask

- (SFSSCacheTask)initWithRequest:(id)a3
{
  id v4;
  NSObject *v5;
  SFSSCacheTask *v6;
  void *v7;
  objc_super v9;
  uint8_t buf[16];

  v4 = a3;
  SFSSGetLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21E284000, v5, OS_LOG_TYPE_INFO, "Init cache task.", buf, 2u);
  }

  v9.receiver = self;
  v9.super_class = (Class)SFSSCacheTask;
  v6 = -[SFSpeechSynthesisTask initWithRequest:](&v9, sel_initWithRequest_, v4);

  if (v6)
  {
    -[SFSpeechSynthesisTask instrumentMetrics](v6, "instrumentMetrics");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSourceOfTTS:", 1);

  }
  return v6;
}

- (void)startTask:(id)a3
{
  void (**v4)(id, void *);
  void *v5;
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _OWORD v26[2];
  uint64_t v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, void *))a3;
  -[SFSpeechSynthesisTask request](self, "request");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "voiceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFSpeechSynthesisTask request](self, "request");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFSSCacheItem generateCacheKey:text:](SFSSCacheItem, "generateCacheKey:text:", v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[SFSSCachingService sharedInstance](SFSSCachingService, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "voiceKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFSSVoiceAsset generateVoiceAssetFromVoiceKeyString:](SFSSVoiceAsset, "generateVoiceAssetFromVoiceKeyString:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "resourceKey");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFSSResourceAsset generateResourceAssetFromResourceKeyString:](SFSSResourceAsset, "generateResourceAssetFromResourceKeyString:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "asbd");
  }
  else
  {
    v27 = 0;
    memset(v26, 0, sizeof(v26));
  }
  -[SFSpeechSynthesisTask handleSynthesisBegin:asbd:audioPlaybackBufferDuration:voiceAsset:resourceAsset:](self, "handleSynthesisBegin:asbd:audioPlaybackBufferDuration:voiceAsset:resourceAsset:", 0, v26, v13, v15, 0.0);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v11, "rawAudio", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v23 != v19)
          objc_enumerationMutation(v16);
        -[SFSpeechSynthesisTask handleSynthesisChunks:](self, "handleSynthesisChunks:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i));
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v18);
  }

  -[SFSpeechSynthesisTask handleSynthesisEnd:](self, "handleSynthesisEnd:", 0);
  -[SFSpeechSynthesisTask error](self, "error");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v21);

}

- (void)cancelTask
{
  NSObject *v2;
  uint8_t v3[16];

  SFSSGetLogObject();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v3 = 0;
    _os_log_debug_impl(&dword_21E284000, v2, OS_LOG_TYPE_DEBUG, "Cache Task cancelled.", v3, 2u);
  }

}

@end
