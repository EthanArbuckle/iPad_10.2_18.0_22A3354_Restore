@implementation LTHybridEndpointer

void __62___LTHybridEndpointer_setServerEndpointerFeatures_withLocale___block_invoke(void **a1)
{
  id *WeakRetained;
  id *v3;
  void **v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  _BOOL4 v14;
  id v15;
  NSObject *v16;
  float v17;
  id v18;
  id v19;
  int v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  _BOOL4 v24;
  id v25;
  NSObject *v26;
  float v27;
  NSObject *v28;
  id v29;
  int v30;
  double v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  v3 = WeakRetained;
  if (!WeakRetained)
    goto LABEL_25;
  v4 = a1 + 4;
  v5 = a1[4];
  objc_msgSend(WeakRetained[1], "localePair");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sourceLocale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v7)
  {
    v11 = _LTOSLogSpeech();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(v30) = 0;
      _os_log_impl(&dword_2491B9000, v11, OS_LOG_TYPE_INFO, "Received server endpointer features for source locale", (uint8_t *)&v30, 2u);
    }
    objc_storeStrong(v3 + 6, a1[5]);
    if (v3[3] && v3[5])
    {
      v12 = v3[4];
      v13 = _LTOSLogSpeech();
      v14 = os_log_type_enabled(v13, OS_LOG_TYPE_INFO);
      if (v12)
      {
        if (v14)
        {
          v15 = v3[4];
          v16 = v13;
          objc_msgSend(v15, "floatValue");
          v30 = 134217984;
          v31 = v17;
          _os_log_impl(&dword_2491B9000, v16, OS_LOG_TYPE_INFO, "Updating source endpointer threshold to %f", (uint8_t *)&v30, 0xCu);

        }
        v19 = v3[3];
        v18 = v3[4];
        goto LABEL_22;
      }
      if (v14)
      {
        LOWORD(v30) = 0;
        _os_log_impl(&dword_2491B9000, v13, OS_LOG_TYPE_INFO, "Re-request sampling rate for source endpointer", (uint8_t *)&v30, 2u);
      }
      v29 = v3[3];
LABEL_32:
      objc_msgSend(v29, "requestSupportedWithSamplingRate:", v3[18]);
    }
  }
  else
  {
    v8 = *v4;
    objc_msgSend(v3[1], "localePair");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "targetLocale");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 != v10)
    {

      goto LABEL_23;
    }
    v20 = objc_msgSend(v3[1], "autodetectLanguage");

    if (!v20)
    {
LABEL_23:
      v28 = _LTOSLogSpeech();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        __62___LTHybridEndpointer_setServerEndpointerFeatures_withLocale___block_invoke_cold_1(v4, v28);
      goto LABEL_25;
    }
    v21 = _LTOSLogSpeech();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      LOWORD(v30) = 0;
      _os_log_impl(&dword_2491B9000, v21, OS_LOG_TYPE_INFO, "Received server endpointer features for target locale", (uint8_t *)&v30, 2u);
    }
    objc_storeStrong(v3 + 10, a1[5]);
    if (v3[7] && v3[9])
    {
      v22 = v3[8];
      v23 = _LTOSLogSpeech();
      v24 = os_log_type_enabled(v23, OS_LOG_TYPE_INFO);
      if (v22)
      {
        if (v24)
        {
          v25 = v3[8];
          v26 = v23;
          objc_msgSend(v25, "floatValue");
          v30 = 134217984;
          v31 = v27;
          _os_log_impl(&dword_2491B9000, v26, OS_LOG_TYPE_INFO, "Updating target endpointer threshold to %f", (uint8_t *)&v30, 0xCu);

        }
        v19 = v3[7];
        v18 = v3[8];
LABEL_22:
        objc_msgSend(v18, "floatValue");
        objc_msgSend(v19, "updateEndpointerThresholdWithValue:");
        goto LABEL_25;
      }
      if (v24)
      {
        LOWORD(v30) = 0;
        _os_log_impl(&dword_2491B9000, v23, OS_LOG_TYPE_INFO, "Re-request sampling rate for target endpointer", (uint8_t *)&v30, 2u);
      }
      v29 = v3[7];
      goto LABEL_32;
    }
  }
LABEL_25:

}

void __42___LTHybridEndpointer_addSpeechAudioData___block_invoke(uint64_t a1)
{
  id WeakRetained;
  unint64_t v3;
  NSObject *v4;
  int v5;
  unint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = (unint64_t)objc_msgSend(*(id *)(a1 + 32), "length") / *((_QWORD *)WeakRetained + 19);
    v4 = _LTOSLogSpeech();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = 134217984;
      v6 = v3;
      _os_log_impl(&dword_2491B9000, v4, OS_LOG_TYPE_INFO, "Adding audio samples %zu", (uint8_t *)&v5, 0xCu);
    }
    objc_msgSend(*((id *)WeakRetained + 11), "addAudio:numSamples:", *(_QWORD *)(a1 + 32), v3);
  }

}

void __31___LTHybridEndpointer_endAudio__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  NSObject *v2;
  uint8_t v3[16];

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = _LTOSLogSpeech();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_2491B9000, v2, OS_LOG_TYPE_INFO, "Sending end of audio to SPG", v3, 2u);
    }
    objc_msgSend(WeakRetained[11], "endAudio");
  }

}

void __54___LTHybridEndpointer_clientSilenceFeaturesAvailable___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  NSObject *v4;
  int v5;
  NSObject *v6;
  int v7;
  id v8;
  char v9;
  id v10;
  int v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (WeakRetained[3])
    {
      *((_BYTE *)WeakRetained + 104) = objc_msgSend(WeakRetained, "didEndpointWithFeatures:silenceFeatures:endpointer:", WeakRetained[6], *(_QWORD *)(a1 + 32));
      v4 = _LTOSLogSpeech();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v5 = *((unsigned __int8 *)v3 + 104);
        v11 = 67109120;
        v12 = v5;
        _os_log_impl(&dword_2491B9000, v4, OS_LOG_TYPE_INFO, "Endpointing decision from source endpointer %{BOOL}i", (uint8_t *)&v11, 8u);
      }
    }
    if (v3[7])
    {
      if (!*((_BYTE *)v3 + 104))
      {
        if (objc_msgSend(v3[1], "autodetectLanguage"))
        {
          *((_BYTE *)v3 + 104) = objc_msgSend(v3, "didEndpointWithFeatures:silenceFeatures:endpointer:", v3[10], *(_QWORD *)(a1 + 32), v3[7]);
          v6 = _LTOSLogSpeech();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
          {
            v7 = *((unsigned __int8 *)v3 + 104);
            v11 = 67109120;
            v12 = v7;
            _os_log_impl(&dword_2491B9000, v6, OS_LOG_TYPE_INFO, "Endpointing decision from target endpointer %{BOOL}i", (uint8_t *)&v11, 8u);
          }
        }
      }
    }
    if (*((_BYTE *)v3 + 104))
    {
      v8 = objc_loadWeakRetained(v3 + 12);
      v9 = objc_opt_respondsToSelector();

      if ((v9 & 1) != 0)
      {
        v10 = objc_loadWeakRetained(v3 + 12);
        objc_msgSend(v10, "hybridEndpointerFoundEndpoint");

      }
    }
  }

}

void __62___LTHybridEndpointer_setServerEndpointerFeatures_withLocale___block_invoke_cold_1(void **a1, void *a2)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = a2;
  objc_msgSend(v2, "localeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543362;
  v7 = v4;
  OUTLINED_FUNCTION_0_1(&dword_2491B9000, v3, v5, "Unexpected locale %{public}@ for server endpointer features", (uint8_t *)&v6);

}

@end
