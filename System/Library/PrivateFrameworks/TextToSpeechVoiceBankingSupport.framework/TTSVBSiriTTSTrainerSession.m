@implementation TTSVBSiriTTSTrainerSession

- (TTSVBSiriTTSTrainerSession)init
{
  TTSVBSiriTTSTrainerSession *v2;
  void *v3;
  objc_class *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  dispatch_queue_t v8;
  dispatch_queue_t v9;
  objc_super v11;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v11.receiver = self;
  v11.super_class = (Class)TTSVBSiriTTSTrainerSession;
  v2 = -[TTSVBSiriTTSTrainerSession init](&v11, sel_init);
  if (v2)
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2050000000;
    v3 = (void *)getSiriTTSTrainerSessionClass_softClass;
    v16 = getSiriTTSTrainerSessionClass_softClass;
    if (!getSiriTTSTrainerSessionClass_softClass)
    {
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __getSiriTTSTrainerSessionClass_block_invoke;
      v12[3] = &unk_25198E470;
      v12[4] = &v13;
      __getSiriTTSTrainerSessionClass_block_invoke((uint64_t)v12);
      v3 = (void *)v14[3];
    }
    v4 = objc_retainAutorelease(v3);
    _Block_object_dispose(&v13, 8);
    v5 = objc_alloc_init(v4);
    -[TTSVBSiriTTSTrainerSession setSession:](v2, "setSession:", v5);

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, -1);
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v6, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();

    v8 = dispatch_queue_create("com.apple.voicebanking.SiriTraining", v7);
    -[TTSVBSiriTTSTrainerSession setSiriTrainingQueue:](v2, "setSiriTrainingQueue:", v8);

    v9 = dispatch_queue_create("com.apple.voicebanking.trainersession.callout", v7);
    -[TTSVBSiriTTSTrainerSession setCalloutQueue:](v2, "setCalloutQueue:", v9);

  }
  return v2;
}

- (id)installableTrainingAssetsForLocaleID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  TTSVBSiriTTSTrainingAsset *v15;
  TTSVBSiriTTSTrainingAsset *v16;
  NSObject *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  LogTTSVBSiri();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v26 = v4;
    _os_log_impl(&dword_2486E6000, v5, OS_LOG_TYPE_DEFAULT, "Will query SiriTTSTraining for installable assets language=%@ name=default", buf, 0xCu);
  }

  -[TTSVBSiriTTSTrainerSession session](self, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "installableTrainingAssetsForLanguage:name:type:", v4, CFSTR("default"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v13);
        v15 = [TTSVBSiriTTSTrainingAsset alloc];
        v16 = -[TTSVBSiriTTSTrainingAsset initWithSiriTTSTrainingAsset:](v15, "initWithSiriTTSTrainingAsset:", v14, (_QWORD)v20);
        objc_msgSend(v8, "addObject:", v16);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }

  LogTTSVBSiri();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v26 = v18;
    _os_log_impl(&dword_2486E6000, v17, OS_LOG_TYPE_DEFAULT, "Did query SiriTTSTraining for installable assets. Got %@ results", buf, 0xCu);

  }
  return v8;
}

- (id)getAllAvailableLocales
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  LogTTSVBSiri();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_2486E6000, v3, OS_LOG_TYPE_DEFAULT, "Will query SiriTTSTraining for available locales", (uint8_t *)&v8, 2u);
  }

  -[TTSVBSiriTTSTrainerSession session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getAllAvailableLocales");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LogTTSVBSiri();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v5;
    _os_log_impl(&dword_2486E6000, v6, OS_LOG_TYPE_DEFAULT, "Did query SiriTTSTraining for available locales %@", (uint8_t *)&v8, 0xCu);
  }

  return v5;
}

- (id)installedTrainingAssetsForLocaleID:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  TTSVBSiriTTSTrainingAsset *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  id v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  LogTTSVBSiri();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v30 = v4;
    _os_log_impl(&dword_2486E6000, v5, OS_LOG_TYPE_DEFAULT, "Will query SiriTTSTraining for installed assets language=%@ name=default", buf, 0xCu);
  }

  -[TTSVBSiriTTSTrainerSession session](self, "session");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v4;
  objc_msgSend(v6, "installedTrainingAssetsForLanguage:name:type:", v4, CFSTR("default"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LogTTSVBSiri();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v30 = v9;
    _os_log_impl(&dword_2486E6000, v8, OS_LOG_TYPE_DEFAULT, "Did query SiriTTSTraining for installed assets. Got %@ results", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v26;
    v24 = v11;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v26 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v15);
        v17 = -[TTSVBSiriTTSTrainingAsset initWithSiriTTSTrainingAsset:]([TTSVBSiriTTSTrainingAsset alloc], "initWithSiriTTSTrainingAsset:", v16);
        objc_msgSend(v10, "addObject:", v17);
        LogTTSVBSiri();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v16, "name");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "factor");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "path");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v30 = v19;
          v31 = 2112;
          v32 = v20;
          v33 = 2112;
          v34 = v21;
          _os_log_debug_impl(&dword_2486E6000, v18, OS_LOG_TYPE_DEBUG, "Installed training asset: %@ - %@ - %@", buf, 0x20u);

          v11 = v24;
        }

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
    }
    while (v13);
  }

  return v10;
}

- (void)installAsset:(id)a3 progress:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  objc_msgSend(a3, "asset");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LogTTSVBSiri();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v21 = v12;
    _os_log_impl(&dword_2486E6000, v11, OS_LOG_TYPE_DEFAULT, "About to request install of siri training asset=%@", buf, 0xCu);

  }
  -[TTSVBSiriTTSTrainerSession session](self, "session");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v9;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __63__TTSVBSiriTTSTrainerSession_installAsset_progress_completion___block_invoke;
  v18[3] = &unk_25198E600;
  v19 = v8;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __63__TTSVBSiriTTSTrainerSession_installAsset_progress_completion___block_invoke_8;
  v16[3] = &unk_25198E628;
  v14 = v9;
  v15 = v8;
  objc_msgSend(v13, "installTrainingAsset:progress:completion:", v10, v18, v16);

}

uint64_t __63__TTSVBSiriTTSTrainerSession_installAsset_progress_completion___block_invoke(uint64_t a1, float a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  LogTTSVBSiri();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __63__TTSVBSiriTTSTrainerSession_installAsset_progress_completion___block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);

  return (*(uint64_t (**)(float))(*(_QWORD *)(a1 + 32) + 16))(a2);
}

void __63__TTSVBSiriTTSTrainerSession_installAsset_progress_completion___block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a2;
  LogTTSVBSiri();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __63__TTSVBSiriTTSTrainerSession_installAsset_progress_completion___block_invoke_8_cold_1((uint64_t)v3, v4, v5, v6, v7, v8, v9, v10);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)uninstallAsset:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  LogTTSVBSiri();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "name");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_2486E6000, v5, OS_LOG_TYPE_DEFAULT, "About to request uninstall of siri training asset=%@", (uint8_t *)&v9, 0xCu);

  }
  -[TTSVBSiriTTSTrainerSession session](self, "session");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uninstallTrainingAsset:", v8);

}

- (void)fetchTrainingScriptsWithLocaleID:(id)a3 scriptType:(id)a4 replyOnQueue:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  TTSVBSiriTTSTrainerSession *v21;
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  LogTTSVBSiri();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v25 = v10;
    v26 = 2112;
    v27 = v11;
    _os_log_impl(&dword_2486E6000, v14, OS_LOG_TYPE_DEFAULT, "About to fetch training script data with locale: '%@' and script type: '%@'", buf, 0x16u);
  }

  -[TTSVBSiriTTSTrainerSession session](self, "session");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __98__TTSVBSiriTTSTrainerSession_fetchTrainingScriptsWithLocaleID_scriptType_replyOnQueue_completion___block_invoke;
  v19[3] = &unk_25198E678;
  v20 = v10;
  v21 = self;
  v22 = v12;
  v23 = v13;
  v16 = v13;
  v17 = v12;
  v18 = v10;
  objc_msgSend(v15, "getRecordingMetadata:name:reply:", v18, v11, v19);

}

void __98__TTSVBSiriTTSTrainerSession_fetchTrainingScriptsWithLocaleID_scriptType_replyOnQueue_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  LogTTSVBSiri();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    v18 = v8;
    v19 = 2112;
    v20 = v6;
    v21 = 2112;
    v22 = v5;
    _os_log_impl(&dword_2486E6000, v7, OS_LOG_TYPE_DEFAULT, "Did fetch training script data with locale: %@. Path=%@ Error=%@", buf, 0x20u);
  }

  objc_msgSend(*(id *)(a1 + 40), "_replyQueue:", *(_QWORD *)(a1 + 48));
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __98__TTSVBSiriTTSTrainerSession_fetchTrainingScriptsWithLocaleID_scriptType_replyOnQueue_completion___block_invoke_10;
  block[3] = &unk_25198E650;
  v10 = *(id *)(a1 + 56);
  v15 = v5;
  v16 = v10;
  v14 = v6;
  v11 = v5;
  v12 = v6;
  dispatch_async(v9, block);

}

uint64_t __98__TTSVBSiriTTSTrainerSession_fetchTrainingScriptsWithLocaleID_scriptType_replyOnQueue_completion___block_invoke_10(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)startTraining:(id)a3 replyOnQueue:(id)a4 trainingStartedHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[TTSVBSiriTTSTrainerSession siriTrainingQueue](self, "siriTrainingQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __80__TTSVBSiriTTSTrainerSession_startTraining_replyOnQueue_trainingStartedHandler___block_invoke;
  v15[3] = &unk_25198E6F0;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

void __80__TTSVBSiriTTSTrainerSession_startTraining_replyOnQueue_trainingStartedHandler___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  id v6;

  objc_msgSend(a1[4], "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "task");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __80__TTSVBSiriTTSTrainerSession_startTraining_replyOnQueue_trainingStartedHandler___block_invoke_2;
  v4[3] = &unk_25198E6C8;
  v4[4] = a1[4];
  v5 = a1[6];
  v6 = a1[7];
  objc_msgSend(v2, "startRequest:completion:", v3, v4);

}

void __80__TTSVBSiriTTSTrainerSession_startTraining_replyOnQueue_trainingStartedHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_replyQueue:", *(_QWORD *)(a1 + 40));
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __80__TTSVBSiriTTSTrainerSession_startTraining_replyOnQueue_trainingStartedHandler___block_invoke_3;
  block[3] = &unk_25198E6A0;
  v12 = v6;
  v8 = *(id *)(a1 + 48);
  v13 = v5;
  v14 = v8;
  v9 = v5;
  v10 = v6;
  dispatch_async(v7, block);

}

void __80__TTSVBSiriTTSTrainerSession_startTraining_replyOnQueue_trainingStartedHandler___block_invoke_3(uint64_t a1)
{
  TTSVBSiriTTSTrainerTask *v2;

  v2 = -[TTSVBSiriTTSTrainerTask initWithSiriTTSTrainerTask:]([TTSVBSiriTTSTrainerTask alloc], "initWithSiriTTSTrainerTask:", *(_QWORD *)(a1 + 32));
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)getTaskByID:(id)a3 replyOnQueue:(id)a4 statusHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  TTSVBSiriTTSTrainerSession *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[TTSVBSiriTTSTrainerSession siriTrainingQueue](self, "siriTrainingQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __69__TTSVBSiriTTSTrainerSession_getTaskByID_replyOnQueue_statusHandler___block_invoke;
  v15[3] = &unk_25198E6F0;
  v16 = v8;
  v17 = self;
  v18 = v9;
  v19 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

void __69__TTSVBSiriTTSTrainerSession_getTaskByID_replyOnQueue_statusHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[5];
  id v7;
  id v8;
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  LogTTSVBSiri();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v10 = v3;
    _os_log_impl(&dword_2486E6000, v2, OS_LOG_TYPE_INFO, "About to call getTaskById task=%@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __69__TTSVBSiriTTSTrainerSession_getTaskByID_replyOnQueue_statusHandler___block_invoke_15;
  v6[3] = &unk_25198E6C8;
  v5 = *(_QWORD *)(a1 + 32);
  v6[4] = *(_QWORD *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  v8 = *(id *)(a1 + 56);
  objc_msgSend(v4, "getTaskById:completion:", v5, v6);

}

void __69__TTSVBSiriTTSTrainerSession_getTaskByID_replyOnQueue_statusHandler___block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_replyQueue:", *(_QWORD *)(a1 + 40));
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __69__TTSVBSiriTTSTrainerSession_getTaskByID_replyOnQueue_statusHandler___block_invoke_2;
  block[3] = &unk_25198E6A0;
  v12 = v6;
  v8 = *(id *)(a1 + 48);
  v13 = v5;
  v14 = v8;
  v9 = v5;
  v10 = v6;
  dispatch_async(v7, block);

}

void __69__TTSVBSiriTTSTrainerSession_getTaskByID_replyOnQueue_statusHandler___block_invoke_2(uint64_t a1)
{
  TTSVBSiriTTSTrainerTask *v2;
  NSObject *v3;
  int v4;
  TTSVBSiriTTSTrainerTask *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = -[TTSVBSiriTTSTrainerTask initWithSiriTTSTrainerTask:]([TTSVBSiriTTSTrainerTask alloc], "initWithSiriTTSTrainerTask:", *(_QWORD *)(a1 + 32));
  LogTTSVBSiri();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_2486E6000, v3, OS_LOG_TYPE_INFO, "getTaskById did finish. calling completion handler. task=%@", (uint8_t *)&v4, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)getTasksByIDs:(id)a3 replyOnQueue:(id)a4 statusHandler:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id obj;
  _QWORD block[4];
  id v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  NSObject *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[128];
  uint8_t buf[4];
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v24 = a4;
  v23 = a5;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LogTTSVBSiri();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v8, "componentsJoinedByString:", CFSTR(", "));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v40 = v12;
    _os_log_impl(&dword_2486E6000, v11, OS_LOG_TYPE_INFO, "Will request tasks for IDs %@", buf, 0xCu);

  }
  v13 = dispatch_group_create();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v8;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v35;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v35 != v16)
          objc_enumerationMutation(obj);
        v18 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * v17);
        dispatch_group_enter(v13);
        v30[0] = MEMORY[0x24BDAC760];
        v30[1] = 3221225472;
        v30[2] = __71__TTSVBSiriTTSTrainerSession_getTasksByIDs_replyOnQueue_statusHandler___block_invoke;
        v30[3] = &unk_25198E718;
        v31 = v9;
        v32 = v10;
        v33 = v13;
        -[TTSVBSiriTTSTrainerSession getTaskByID:replyOnQueue:statusHandler:](self, "getTaskByID:replyOnQueue:statusHandler:", v18, 0, v30);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v15);
  }

  -[TTSVBSiriTTSTrainerSession _replyQueue:](self, "_replyQueue:", v24);
  v19 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__TTSVBSiriTTSTrainerSession_getTasksByIDs_replyOnQueue_statusHandler___block_invoke_2;
  block[3] = &unk_25198E740;
  v27 = v9;
  v28 = v10;
  v29 = v23;
  v20 = v23;
  v21 = v10;
  v22 = v9;
  dispatch_group_notify(v13, v19, block);

}

void __71__TTSVBSiriTTSTrainerSession_getTasksByIDs_replyOnQueue_statusHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  if (v5)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));

}

uint64_t __71__TTSVBSiriTTSTrainerSession_getTasksByIDs_replyOnQueue_statusHandler___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  LogTTSVBSiri();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_2486E6000, v2, OS_LOG_TYPE_INFO, "Finished requesting getTasksByIDs. Calling completion handler. tasks=%@ errors=%@", (uint8_t *)&v6, 0x16u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)getAllTasksReplyOnQueue:(id)a3 statusHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[TTSVBSiriTTSTrainerSession siriTrainingQueue](self, "siriTrainingQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__TTSVBSiriTTSTrainerSession_getAllTasksReplyOnQueue_statusHandler___block_invoke;
  block[3] = &unk_25198E740;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __68__TTSVBSiriTTSTrainerSession_getAllTasksReplyOnQueue_statusHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  id v7;
  uint8_t buf[16];

  LogTTSVBSiri();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2486E6000, v2, OS_LOG_TYPE_INFO, "About to call getAllTasks", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "session");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __68__TTSVBSiriTTSTrainerSession_getAllTasksReplyOnQueue_statusHandler___block_invoke_19;
  v5[3] = &unk_25198E790;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v3, "getAllTasks:", v5);

}

void __68__TTSVBSiriTTSTrainerSession_getAllTasksReplyOnQueue_statusHandler___block_invoke_19(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_replyQueue:", *(_QWORD *)(a1 + 40));
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __68__TTSVBSiriTTSTrainerSession_getAllTasksReplyOnQueue_statusHandler___block_invoke_2;
  v6[3] = &unk_25198E768;
  v7 = v3;
  v8 = *(id *)(a1 + 48);
  v5 = v3;
  dispatch_async(v4, v6);

}

void __68__TTSVBSiriTTSTrainerSession_getAllTasksReplyOnQueue_statusHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  TTSVBSiriTTSTrainerTask *v9;
  TTSVBSiriTTSTrainerTask *v10;
  NSObject *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[4];
  void *v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v7);
        v9 = [TTSVBSiriTTSTrainerTask alloc];
        v10 = -[TTSVBSiriTTSTrainerTask initWithSiriTTSTrainerTask:](v9, "initWithSiriTTSTrainerTask:", v8, (_QWORD)v13);
        objc_msgSend(v2, "addObject:", v10);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
    }
    while (v5);
  }

  LogTTSVBSiri();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v2, "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v18 = v12;
    _os_log_impl(&dword_2486E6000, v11, OS_LOG_TYPE_INFO, "getAllTasks did finish. calling completion handler. tasks=%@", buf, 0xCu);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (void)discardTrainingTasksReplyOnQueue:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  LogTTSVBSiri();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2486E6000, v8, OS_LOG_TYPE_INFO, "About to call cleanUpTaskQueue", buf, 2u);
  }

  -[TTSVBSiriTTSTrainerSession session](self, "session");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __81__TTSVBSiriTTSTrainerSession_discardTrainingTasksReplyOnQueue_completionHandler___block_invoke;
  v12[3] = &unk_25198E7E0;
  v12[4] = self;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v9, "cleanUpTaskQueue:", v12);

}

void __81__TTSVBSiriTTSTrainerSession_discardTrainingTasksReplyOnQueue_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[16];

  v3 = a2;
  LogTTSVBSiri();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2486E6000, v4, OS_LOG_TYPE_INFO, "cleanUpTaskQueue finished. calling completion handler", buf, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "_replyQueue:", *(_QWORD *)(a1 + 40));
  v5 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __81__TTSVBSiriTTSTrainerSession_discardTrainingTasksReplyOnQueue_completionHandler___block_invoke_21;
  v8[3] = &unk_25198E7B8;
  v6 = *(id *)(a1 + 48);
  v9 = v3;
  v10 = v6;
  v7 = v3;
  dispatch_async(v5, v8);

}

uint64_t __81__TTSVBSiriTTSTrainerSession_discardTrainingTasksReplyOnQueue_completionHandler___block_invoke_21(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)cancelTask:(id)a3 replyOnQueue:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  TTSVBSiriTTSTrainerSession *v20;
  id v21;
  id v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  LogTTSVBSiri();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v8, "taskID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v24 = v12;
    _os_log_impl(&dword_2486E6000, v11, OS_LOG_TYPE_INFO, "Will request cancel of training task: %@", buf, 0xCu);

  }
  -[TTSVBSiriTTSTrainerSession session](self, "session");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "task");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __72__TTSVBSiriTTSTrainerSession_cancelTask_replyOnQueue_completionHandler___block_invoke;
  v18[3] = &unk_25198E808;
  v19 = v8;
  v20 = self;
  v21 = v9;
  v22 = v10;
  v15 = v10;
  v16 = v9;
  v17 = v8;
  objc_msgSend(v13, "cancelTask:reply:", v14, v18);

}

void __72__TTSVBSiriTTSTrainerSession_cancelTask_replyOnQueue_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  LogTTSVBSiri();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "taskID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v13 = v5;
    _os_log_impl(&dword_2486E6000, v4, OS_LOG_TYPE_INFO, "cancelTask finished id=%@. calling completion handler", buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 40), "_replyQueue:", *(_QWORD *)(a1 + 48));
  v6 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __72__TTSVBSiriTTSTrainerSession_cancelTask_replyOnQueue_completionHandler___block_invoke_22;
  v9[3] = &unk_25198E7B8;
  v7 = *(id *)(a1 + 56);
  v10 = v3;
  v11 = v7;
  v8 = v3;
  dispatch_async(v6, v9);

}

uint64_t __72__TTSVBSiriTTSTrainerSession_cancelTask_replyOnQueue_completionHandler___block_invoke_22(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)cancelTaskWithID:(id)a3 replyOnQueue:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v8 = a4;
  v9 = a5;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __78__TTSVBSiriTTSTrainerSession_cancelTaskWithID_replyOnQueue_completionHandler___block_invoke;
  v12[3] = &unk_25198E830;
  v12[4] = self;
  v13 = v8;
  v14 = v9;
  v10 = v9;
  v11 = v8;
  -[TTSVBSiriTTSTrainerSession getTaskByID:replyOnQueue:statusHandler:](self, "getTaskByID:replyOnQueue:statusHandler:", a3, 0, v12);

}

void __78__TTSVBSiriTTSTrainerSession_cancelTaskWithID_replyOnQueue_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a3;
  v6 = *(void **)(a1 + 32);
  if (v5)
  {
    objc_msgSend(v6, "_replyQueue:", *(_QWORD *)(a1 + 40));
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __78__TTSVBSiriTTSTrainerSession_cancelTaskWithID_replyOnQueue_completionHandler___block_invoke_2;
    v8[3] = &unk_25198E7B8;
    v10 = *(id *)(a1 + 48);
    v9 = v5;
    dispatch_async(v7, v8);

  }
  else
  {
    objc_msgSend(v6, "cancelTask:replyOnQueue:completionHandler:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }

}

uint64_t __78__TTSVBSiriTTSTrainerSession_cancelTaskWithID_replyOnQueue_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (id)_replyQueue:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[TTSVBSiriTTSTrainerSession calloutQueue](self, "calloutQueue");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (SiriTTSTrainerSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
  objc_storeStrong((id *)&self->_session, a3);
}

- (OS_dispatch_queue)siriTrainingQueue
{
  return self->_siriTrainingQueue;
}

- (void)setSiriTrainingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_siriTrainingQueue, a3);
}

- (OS_dispatch_queue)calloutQueue
{
  return self->_calloutQueue;
}

- (void)setCalloutQueue:(id)a3
{
  objc_storeStrong((id *)&self->_calloutQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calloutQueue, 0);
  objc_storeStrong((id *)&self->_siriTrainingQueue, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

double __63__TTSVBSiriTTSTrainerSession_installAsset_progress_completion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  double result;

  OUTLINED_FUNCTION_0(&dword_2486E6000, a1, a3, "Siri training asset install progress=%.2f", a5, a6, a7, a8, 0);
  return result;
}

void __63__TTSVBSiriTTSTrainerSession_installAsset_progress_completion___block_invoke_8_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2486E6000, a2, a3, "Siri training asset install finished. ErrorOrNil=%@", a5, a6, a7, a8, 2u);
}

@end
