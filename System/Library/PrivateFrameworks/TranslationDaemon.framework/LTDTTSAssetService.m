@implementation LTDTTSAssetService

void __29___LTDTTSAssetService__queue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.translationd.TTSAssetService", 0);
  v1 = (void *)_queue__queue_1;
  _queue__queue_1 = (uint64_t)v0;

}

uint64_t __51___LTDTTSAssetService_ttsAssetForLocaleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasPrefix:", *(_QWORD *)(a1 + 32));
}

void __43___LTDTTSAssetService_setSubscribedVoices___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (v3)
  {
    v4 = _LTOSLogAssets();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __43___LTDTTSAssetService_setSubscribedVoices___block_invoke_cold_1();
    objc_msgSend(*(id *)(a1 + 32), "setSiriTTSSession:", 0);
  }

}

void __65___LTDTTSAssetService_downloadAsset_options_progress_completion___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;

  v2 = (_QWORD *)(a1 + 32);
  if ((objc_msgSend(*(id *)(a1 + 32), "isTTSModel") & 1) != 0)
  {
    +[_LTDTTSAssetModel modelFromAsset:](_LTDTTSAssetModel, "modelFromAsset:", *v2);
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "ttsAsset");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      if ((objc_msgSend(v4, "locallyAvailable") & 1) == 0 && !objc_msgSend(v5, "downloading"))
      {
        v17 = MEMORY[0x24BDAC760];
        v23[0] = MEMORY[0x24BDAC760];
        v23[1] = 3221225472;
        v23[2] = __65___LTDTTSAssetService_downloadAsset_options_progress_completion___block_invoke_35;
        v23[3] = &unk_251A125C0;
        v28 = *(_QWORD *)(a1 + 56);
        v3 = v3;
        v24 = v3;
        v27 = *(id *)(a1 + 48);
        v25 = *(id *)(a1 + 32);
        v26 = v5;
        v18[0] = v17;
        v18[1] = 3221225472;
        v18[2] = __65___LTDTTSAssetService_downloadAsset_options_progress_completion___block_invoke_39;
        v18[3] = &unk_251A12610;
        v22 = *(_QWORD *)(a1 + 56);
        v5 = v26;
        v19 = v5;
        v20 = *(id *)(a1 + 32);
        v21 = *(id *)(a1 + 40);
        objc_msgSend(v5, "downloadWithReservation:useBattery:progress:then:", CFSTR("TextToSpeech.VoiceResources"), 1, v23, v18);

        goto LABEL_23;
      }
      if (objc_msgSend(v5, "locallyAvailable"))
        v6 = 2;
      else
        v6 = 1;
      objc_msgSend(*(id *)(a1 + 32), "progress");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setOfflineState:", v6);

      v8 = *(_QWORD *)(a1 + 48);
      if (v8)
        (*(void (**)(uint64_t, _QWORD))(v8 + 16))(v8, *v2);
      v9 = *(_QWORD *)(a1 + 40);
      if (v9)
      {
        v10 = *(void (**)(void))(v9 + 16);
LABEL_16:
        v10();
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("TTS asset not found for %@"), 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1540], "ltd_errorWithCode:description:userInfo:", 16, v13, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = _LTOSLogAssets();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        __65___LTDTTSAssetService_downloadAsset_options_progress_completion___block_invoke_cold_1();
      v16 = *(_QWORD *)(a1 + 40);
      if (v16)
        (*(void (**)(uint64_t, void *))(v16 + 16))(v16, v14);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("SiriTTS unsupported asset type"));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "ltd_errorWithCode:description:userInfo:", 16, v3, 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v11 = _LTOSLogAssets();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __65___LTDTTSAssetService_downloadAsset_options_progress_completion___block_invoke_cold_2();
    v12 = *(_QWORD *)(a1 + 40);
    if (v12)
    {
      v10 = *(void (**)(void))(v12 + 16);
      goto LABEL_16;
    }
  }
LABEL_23:

}

void __65___LTDTTSAssetService_downloadAsset_options_progress_completion___block_invoke_35(id *a1, uint64_t a2, uint64_t a3)
{
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;

  objc_msgSend(a1[8], "_queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65___LTDTTSAssetService_downloadAsset_options_progress_completion___block_invoke_2;
  block[3] = &unk_251A12598;
  v10 = a1[4];
  v14 = a3;
  v15 = a2;
  v13 = a1[7];
  v11 = a1[5];
  v7 = a1[6];
  v8 = a1[8];
  v12 = v7;
  v16 = v8;
  dispatch_async(v6, block);

}

void __65___LTDTTSAssetService_downloadAsset_options_progress_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  id v25;
  uint64_t v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "progress");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "totalUnitCount");

  v4 = *(_QWORD *)(a1 + 64);
  if (v3 > v4)
    v4 = v3;
  if (v4)
    v5 = v4;
  else
    v5 = 100;
  objc_msgSend(*(id *)(a1 + 32), "progress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "completedUnitCount");

  v8 = *(_QWORD *)(a1 + 72);
  if (v7 > (uint64_t)v8)
    v8 = v7;
  if (v8 <= 1)
    v9 = 1;
  else
    v9 = v8;
  objc_msgSend(*(id *)(a1 + 32), "progress");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "updateTotalUnitCount:completedUnitCount:", v5, v9);

  if (v11)
  {
    v12 = _LTOSLogAssets();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = *(void **)(a1 + 32);
      v14 = v12;
      objc_msgSend(v13, "progress");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v15;
      _os_log_impl(&dword_2491B9000, v14, OS_LOG_TYPE_INFO, "SiriTTS progress for %{public}@", buf, 0xCu);

    }
  }
  if (*(_QWORD *)(a1 + 56))
  {
    objc_msgSend(*(id *)(a1 + 40), "progress");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isCancelled");

    if (v17)
    {
      v18 = _LTOSLogAssets();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = *(void **)(a1 + 48);
        *(_DWORD *)buf = 138543362;
        v28 = v19;
        _os_log_impl(&dword_2491B9000, v18, OS_LOG_TYPE_INFO, "Cancelling download for %{public}@", buf, 0xCu);
      }
      v20 = *(void **)(a1 + 48);
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __65___LTDTTSAssetService_downloadAsset_options_progress_completion___block_invoke_36;
      v23[3] = &unk_251A12570;
      v21 = v20;
      v22 = *(_QWORD *)(a1 + 80);
      v24 = v21;
      v26 = v22;
      v25 = *(id *)(a1 + 40);
      objc_msgSend(v21, "cancelDownloadingThen:", v23);

    }
  }
}

uint64_t __65___LTDTTSAssetService_downloadAsset_options_progress_completion___block_invoke_36(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = _LTOSLogAssets();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_2491B9000, v2, OS_LOG_TYPE_INFO, "Cancelled download for %{public}@", (uint8_t *)&v5, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 48), "purgeAsset:completion:", *(_QWORD *)(a1 + 40), 0);
}

void __65___LTDTTSAssetService_downloadAsset_options_progress_completion___block_invoke_39(id *a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id v9;
  id v10;

  v3 = a2;
  objc_msgSend(a1[7], "_queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __65___LTDTTSAssetService_downloadAsset_options_progress_completion___block_invoke_2_40;
  v6[3] = &unk_251A125E8;
  v7 = v3;
  v8 = a1[4];
  v9 = a1[5];
  v10 = a1[6];
  v5 = v3;
  dispatch_async(v4, v6);

}

void __65___LTDTTSAssetService_downloadAsset_options_progress_completion___block_invoke_2_40(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 32))
  {
    v2 = _LTOSLogAssets();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v3 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v11 = v3;
      _os_log_impl(&dword_2491B9000, v2, OS_LOG_TYPE_INFO, "SiriTTS downloaded %@", buf, 0xCu);
    }
    objc_msgSend(*(id *)(a1 + 48), "progress");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isFinished");

    if ((v5 & 1) != 0)
    {
      v6 = 0;
      goto LABEL_10;
    }
    objc_msgSend(*(id *)(a1 + 48), "progress");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setOfflineState:", 2);
    v6 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("TTS asset download failed for %@"), *(_QWORD *)(a1 + 40));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "ltd_errorWithCode:description:userInfo:", 16, v7, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = _LTOSLogAssets();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __65___LTDTTSAssetService_downloadAsset_options_progress_completion___block_invoke_2_40_cold_1();
  }

LABEL_10:
  v9 = *(_QWORD *)(a1 + 56);
  if (v9)
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v6);

}

void __43___LTDTTSAssetService_setSubscribedVoices___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "SiriTTS subscribe assets failure: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

void __65___LTDTTSAssetService_downloadAsset_options_progress_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2491B9000, v0, v1, "SiriTTS asset download failure: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

void __65___LTDTTSAssetService_downloadAsset_options_progress_completion___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_0_0(&dword_2491B9000, v0, v1, "SiriTTS failed to download asset %{public}@: %@");
  OUTLINED_FUNCTION_1_2();
}

void __65___LTDTTSAssetService_downloadAsset_options_progress_completion___block_invoke_2_40_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_0_0(&dword_2491B9000, v0, v1, "SiriTTS download %{public}@ failure: %@");
  OUTLINED_FUNCTION_1_2();
}

@end
