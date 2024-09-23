@implementation LTSpeechCompressor

uint64_t __42___LTSpeechCompressor_addAudioSampleData___block_invoke(uint64_t a1, unsigned int *a2, uint64_t a3)
{
  id *WeakRetained;
  id *v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = objc_msgSend(WeakRetained[3], "length") - *((_DWORD *)WeakRetained + 10);
    *(_DWORD *)(a3 + 8) = 1;
    if (*a2 <= v7 >> 1)
    {
      v9 = objc_msgSend(v6[3], "mutableBytes");
      v8 = 0;
      v10 = (char *)v6[5];
      *(_QWORD *)(a3 + 16) = &v10[v9];
      v11 = 2 * *a2;
      *(_DWORD *)(a3 + 12) = v11;
      v6[5] = &v10[v11];
    }
    else
    {
      *a2 = 0;
      *(_QWORD *)(a3 + 16) = 0;
      v8 = 1836086393;
      *(_DWORD *)(a3 + 12) = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end
