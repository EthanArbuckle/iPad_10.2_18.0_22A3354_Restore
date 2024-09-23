@implementation _LTTextToSpeechCache

- (_LTTextToSpeechCache)init
{
  _LTTextToSpeechCache *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *cacheQueue;
  uint64_t v5;
  NSMutableDictionary *cache;
  _LTTextToSpeechCache *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_LTTextToSpeechCache;
  v2 = -[_LTTextToSpeechCache init](&v9, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.translation.tts-cache", 0);
    cacheQueue = v2->_cacheQueue;
    v2->_cacheQueue = (OS_dispatch_queue *)v3;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    cache = v2->_cache;
    v2->_cache = (NSMutableDictionary *)v5;

    v7 = v2;
  }

  return v2;
}

- (void)cacheAudioData:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *cacheQueue;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  if (_LTPreferencesDebugDisableTTSCache())
  {
    v8 = _LTOSLogTTS();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[_LTTextToSpeechCache cacheAudioData:forKey:].cold.1(v8);
  }
  else
  {
    objc_initWeak(&location, self);
    cacheQueue = self->_cacheQueue;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __46___LTTextToSpeechCache_cacheAudioData_forKey___block_invoke;
    v10[3] = &unk_251A128B0;
    objc_copyWeak(&v13, &location);
    v11 = v7;
    v12 = v6;
    dispatch_async(cacheQueue, v10);

    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }

}

- (id)audioDataForKey:(id)a3
{
  id v4;
  NSObject *cacheQueue;
  id v6;
  NSObject *v7;
  const __CFString *v8;
  id v9;
  _QWORD block[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  uint8_t buf[4];
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__11;
  v18 = __Block_byref_object_dispose__11;
  v19 = 0;
  cacheQueue = self->_cacheQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __40___LTTextToSpeechCache_audioDataForKey___block_invoke;
  block[3] = &unk_251A13C40;
  v13 = &v14;
  block[4] = self;
  v6 = v4;
  v12 = v6;
  dispatch_sync(cacheQueue, block);
  v7 = _LTOSLogTTS();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    if (v15[5])
      v8 = CFSTR("HIT");
    else
      v8 = CFSTR("MISS");
    *(_DWORD *)buf = 138543362;
    v21 = v8;
    _os_log_impl(&dword_2491B9000, v7, OS_LOG_TYPE_INFO, "TTS cache request: %{public}@", buf, 0xCu);
  }
  v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

- (void)clear
{
  NSObject *cacheQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  cacheQueue = self->_cacheQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __29___LTTextToSpeechCache_clear__block_invoke;
  v4[3] = &unk_251A111A0;
  objc_copyWeak(&v5, &location);
  dispatch_async(cacheQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_cacheQueue, 0);
}

- (void)cacheAudioData:(os_log_t)log forKey:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_2491B9000, log, OS_LOG_TYPE_DEBUG, "Not saving data to TTS cache since debug setting to disable TTS cache is set", v1, 2u);
}

@end
