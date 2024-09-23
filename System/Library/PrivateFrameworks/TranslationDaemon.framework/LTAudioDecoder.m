@implementation LTAudioDecoder

void __33___LTAudioDecoder_sharedInstance__block_invoke()
{
  _LTAudioDecoder *v0;
  void *v1;

  v0 = objc_alloc_init(_LTAudioDecoder);
  v1 = (void *)sharedInstance_sSharedInstance;
  sharedInstance_sSharedInstance = (uint64_t)v0;

}

uint64_t __40___LTAudioDecoder_decodeChunk_outError___block_invoke(uint64_t a1, unsigned int *a2, uint64_t a3, _QWORD *a4)
{
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;

  v8 = *a2;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) >= v8)
  {
    if ((_DWORD)v8 == 1)
    {
      v11 = objc_msgSend(*(id *)(a1 + 32), "length");
      v12 = objc_retainAutorelease(*(id *)(a1 + 32));
      *(_QWORD *)(a3 + 16) = objc_msgSend(v12, "bytes");
      *(_DWORD *)(a3 + 12) = v11;
      if (a4)
      {
        v13 = *(_QWORD *)(a1 + 56);
        *(_QWORD *)v13 = 0;
        *(_DWORD *)(v13 + 8) = 0;
        *(_DWORD *)(v13 + 12) = v11;
        *a4 = v13;
      }
      --*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);

      return 0;
    }
    else
    {
      v9 = 1752524863;
      v14 = _LTOSLogTTS();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        __40___LTAudioDecoder_decodeChunk_outError___block_invoke_cold_1(a2, v14, v15);
    }
  }
  else
  {
    v9 = 1836086393;
    *a2 = 0;
    *(_QWORD *)(a3 + 16) = 0;
    *(_DWORD *)(a3 + 12) = 0;
    if (a4)
    {
      v10 = *(_QWORD **)(a1 + 56);
      *v10 = 0;
      v10[1] = 0;
      *a4 = v10;
    }
  }
  return v9;
}

void __40___LTAudioDecoder_decodeChunk_outError___block_invoke_cold_1(unsigned int *a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 134217984;
  v5 = v3;
  OUTLINED_FUNCTION_0_1(&dword_2491B9000, a2, a3, "Only expecting to get 1 packet at a time, not %lu", (uint8_t *)&v4);
}

@end
