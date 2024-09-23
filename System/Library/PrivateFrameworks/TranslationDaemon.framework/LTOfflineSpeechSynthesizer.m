@implementation LTOfflineSpeechSynthesizer

void __49___LTOfflineSpeechSynthesizer_speak_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = _LTOSLogTTS();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_2491B9000, v3, OS_LOG_TYPE_INFO, "Received offline TTS metrics:%@ ", (uint8_t *)&v4, 0xCu);
  }

}

void __49___LTOfflineSpeechSynthesizer_speak_withContext___block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  char *WeakRetained;
  _OWORD *v5;
  _OWORD *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  int v16;
  int v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v3 = a2;
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained + 32;
    if (v3)
    {
      objc_msgSend(v3, "asbd");
      *v6 = v18;
      v5[3] = v19;
      *((_QWORD *)v5 + 8) = v20;
      objc_msgSend(v3, "asbd");
      if (v17 == 1819304813)
      {
        v7 = (void *)*((_QWORD *)v5 + 9);
        objc_msgSend(v3, "audioData");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v8);

        goto LABEL_10;
      }
      objc_msgSend(v3, "asbd");
      if (v16 == 1869641075)
      {
        v9 = (void *)*((_QWORD *)v5 + 9);
        v10 = (void *)*((_QWORD *)v5 + 11);
        objc_msgSend(v3, "audioData");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v3, "packetCount");
        objc_msgSend(v3, "packetDescriptions");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "extractAudioChunksFromOpusWithData:packetCount:packetDescriptions:", v11, v12, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObjectsFromArray:", v14);

        goto LABEL_10;
      }
    }
    else
    {
      *((_QWORD *)WeakRetained + 8) = 0;
      *v6 = 0u;
      *((_OWORD *)WeakRetained + 3) = 0u;
    }
    v15 = _LTOSLogTTS();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      __49___LTOfflineSpeechSynthesizer_speak_withContext___block_invoke_8_cold_1(v15);
  }
LABEL_10:

}

void __49___LTOfflineSpeechSynthesizer_speak_withContext___block_invoke_10(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v4;
  id v5;

  v5 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained[10], "addObjectsFromArray:", v5);

}

void __49___LTOfflineSpeechSynthesizer_speak_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  dispatch_time_t v8;
  _QWORD block[5];
  id v10;
  id v11;
  uint8_t buf[16];

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = _LTOSLogTTS();
    v6 = v5;
    if (v3)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        __49___LTOfflineSpeechSynthesizer_speak_withContext___block_invoke_2_cold_1((uint64_t)v3, v6, v7);
    }
    else if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2491B9000, v6, OS_LOG_TYPE_INFO, "Finished offline TTS, successfully", buf, 2u);
    }
    if (WeakRetained[1])
    {
      v8 = dispatch_time(0, 300000000);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __49___LTOfflineSpeechSynthesizer_speak_withContext___block_invoke_12;
      block[3] = &unk_251A12DD0;
      block[4] = WeakRetained;
      v10 = *(id *)(a1 + 32);
      v11 = v3;
      dispatch_after(v8, MEMORY[0x24BDAC9B8], block);

    }
  }

}

void __49___LTOfflineSpeechSynthesizer_speak_withContext___block_invoke_12(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  __int128 v5;
  void *v6;
  uint64_t v7;
  __int128 v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  _LTAudioData *v19;
  _LTAudioData *v20;
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint8_t buf[16];
  __int128 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v2 = a1[4];
  v3 = *(_QWORD *)(v2 + 80);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDF64E0], "wordTimingInfoFromSiriTTSService:text:", v3, a1[5]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = a1[4];
  }
  else
  {
    v4 = (void *)MEMORY[0x24BDBD1A8];
  }
  v5 = *(_OWORD *)(v2 + 48);
  v25 = *(_OWORD *)(v2 + 32);
  v26 = v5;
  v27 = *(_QWORD *)(v2 + 64);
  if (*(_DWORD *)(v2 + 40) == 1869641075)
  {
    v6 = *(void **)(v2 + 88);
    v7 = *(_QWORD *)(v2 + 72);
    v24 = 0;
    v8 = *(_OWORD *)(v2 + 48);
    *(_OWORD *)buf = *(_OWORD *)(v2 + 32);
    v29 = v8;
    v30 = *(_QWORD *)(v2 + 64);
    objc_msgSend(v6, "decodeTo48KHzPCMFromChunks:from:outError:", v7, buf, &v24);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = v24;
    v11 = *(void **)(a1[4] + 88);
    if (v11)
    {
      objc_msgSend(v11, "get48khzPCMDescription");
    }
    else
    {
      v30 = 0;
      *(_OWORD *)buf = 0u;
      v29 = 0u;
    }
    v25 = *(_OWORD *)buf;
    v26 = v29;
    v27 = v30;
    if (v10)
    {
      v14 = _LTOSLogTTS();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        __49___LTOfflineSpeechSynthesizer_speak_withContext___block_invoke_12_cold_1((uint64_t)v10, v14, v15);
    }

  }
  else
  {
    v12 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
    v13 = *(void **)(a1[4] + 72);
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __49___LTOfflineSpeechSynthesizer_speak_withContext___block_invoke_15;
    v22[3] = &unk_251A12DA8;
    v9 = v12;
    v23 = v9;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v22);

  }
  v16 = _LTOSLogTTS();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = v16;
    v18 = objc_msgSend(v9, "length");
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v18;
    _os_log_impl(&dword_2491B9000, v17, OS_LOG_TYPE_INFO, "Converted to %ld bytes", buf, 0xCu);

  }
  v19 = [_LTAudioData alloc];
  *(_OWORD *)buf = v25;
  v29 = v26;
  v30 = v27;
  v20 = -[_LTAudioData initWithASBD:rawData:wordTimingInfo:](v19, "initWithASBD:rawData:wordTimingInfo:", buf, v9, v4);
  (*(void (**)(_QWORD, _LTAudioData *, _QWORD, uint64_t))(*(_QWORD *)(a1[4] + 8) + 16))(*(_QWORD *)(a1[4] + 8), v20, a1[6], v21);

}

uint64_t __49___LTOfflineSpeechSynthesizer_speak_withContext___block_invoke_15(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendData:", a2);
}

void __49___LTOfflineSpeechSynthesizer_speak_withContext___block_invoke_8_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2491B9000, log, OS_LOG_TYPE_ERROR, "Unsupported audio format from TTS", v1, 2u);
}

void __49___LTOfflineSpeechSynthesizer_speak_withContext___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_1(&dword_2491B9000, a2, a3, "Encountered error when speaking TTS: %@", (uint8_t *)&v3);
}

void __49___LTOfflineSpeechSynthesizer_speak_withContext___block_invoke_12_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_1(&dword_2491B9000, a2, a3, "Decoding to PCM 48kHz failed: %@", (uint8_t *)&v3);
}

@end
