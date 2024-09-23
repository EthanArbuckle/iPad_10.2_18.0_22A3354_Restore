@implementation LTTextToSpeechCache

void __46___LTTextToSpeechCache_cacheAudioData_forKey___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[2], "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

void __40___LTTextToSpeechCache_audioDataForKey___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 16), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __29___LTTextToSpeechCache_clear__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = objc_msgSend(WeakRetained[2], "count");
    if (v3 >= 1)
    {
      v4 = v3;
      v5 = _LTOSLogTTS();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v6 = 134217984;
        v7 = v4;
        _os_log_impl(&dword_2491B9000, v5, OS_LOG_TYPE_INFO, "Purging %ld items from TTS cache", (uint8_t *)&v6, 0xCu);
      }
      objc_msgSend(v2[2], "removeAllObjects");
    }
  }

}

@end
