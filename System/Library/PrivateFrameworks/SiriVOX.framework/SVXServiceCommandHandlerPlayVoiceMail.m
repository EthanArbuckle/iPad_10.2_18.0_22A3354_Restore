@implementation SVXServiceCommandHandlerPlayVoiceMail

void __91___SVXServiceCommandHandlerPlayVoiceMail_handleCommand_withContext_taskTracker_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  double v6;
  double v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  double v23;

  v5 = a3;
  if (a2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "audioPlaybackDuration:", v5);
    if (v6 >= 0.00100000005)
      v7 = v6;
    else
      v7 = 0.00100000005;
    v8 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __91___SVXServiceCommandHandlerPlayVoiceMail_handleCommand_withContext_taskTracker_completion___block_invoke_2;
    v16[3] = &unk_24D24CB60;
    v17 = v5;
    v9 = *(id *)(a1 + 40);
    v23 = v7;
    v10 = *(_QWORD *)(a1 + 32);
    v18 = v9;
    v19 = v10;
    v20 = *(id *)(a1 + 48);
    v21 = *(id *)(a1 + 56);
    v22 = *(id *)(a1 + 64);
    objc_msgSend(v8, "getCurrentSessionUsingBlock:", v16);

  }
  else
  {
    v11 = *(_QWORD *)(a1 + 64);
    if (v11)
    {
      v12 = objc_alloc(MEMORY[0x24BDD17C8]);
      objc_msgSend(*(id *)(a1 + 40), "aceId");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v12, "initWithFormat:", CFSTR("Failed to acquire audio for command %@."), v13);
      +[SVXServiceCommandResult resultFailureWithErrorCode:reason:](SVXServiceCommandResult, "resultFailureWithErrorCode:reason:", 0, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v15);

    }
  }

}

void __91___SVXServiceCommandHandlerPlayVoiceMail_handleCommand_withContext_taskTracker_completion___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;

  v3 = (objc_class *)MEMORY[0x24BE090F0];
  v4 = a2;
  v5 = [v3 alloc];
  v6 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __91___SVXServiceCommandHandlerPlayVoiceMail_handleCommand_withContext_taskTracker_completion___block_invoke_3;
  v18[3] = &unk_24D24CB10;
  v19 = *(id *)(a1 + 32);
  v7 = (void *)objc_msgSend(v5, "initWithBuilder:", v18);
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __91___SVXServiceCommandHandlerPlayVoiceMail_handleCommand_withContext_taskTracker_completion___block_invoke_4;
  v11[3] = &unk_24D24CB38;
  v8 = *(id *)(a1 + 40);
  v17 = *(_QWORD *)(a1 + 80);
  v9 = *(_QWORD *)(a1 + 48);
  v10 = *(void **)(a1 + 56);
  v12 = v8;
  v13 = v9;
  v14 = v10;
  v15 = *(id *)(a1 + 64);
  v16 = *(id *)(a1 + 72);
  objc_msgSend(v4, "startAudioPlaybackRequest:options:completion:", v7, 0, v11);

}

void __91___SVXServiceCommandHandlerPlayVoiceMail_handleCommand_withContext_taskTracker_completion___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2;
  double v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setItemData:", v2);
  objc_msgSend(v4, "setNumberOfLoops:", 0);
  LODWORD(v3) = 1.0;
  objc_msgSend(v4, "setVolume:", v3);
  objc_msgSend(v4, "setFadeInDuration:", 0.0);
  objc_msgSend(v4, "setFadeOutDuration:", 0.0);

}

void __91___SVXServiceCommandHandlerPlayVoiceMail_handleCommand_withContext_taskTracker_completion___block_invoke_4(uint64_t a1, void *a2, double a3)
{
  id v5;
  void *v6;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint8_t buf[4];
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = v5;
  if (a3 == 0.0 && v5 != 0)
  {
    v9 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(*(id *)(a1 + 32), "aceId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("Failed to playback audio for command %@."), v10);
    +[SVXServiceCommandResult resultFailureWithErrorCode:reason:](SVXServiceCommandResult, "resultFailureWithErrorCode:reason:", 0, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_8:
    goto LABEL_12;
  }
  if (a3 / *(double *)(a1 + 72) > 0.75)
  {
    +[SVXServiceCommandResult resultSuccess](SVXServiceCommandResult, "resultSuccess");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(void **)(*(_QWORD *)(a1 + 40) + 40);
    objc_msgSend(*(id *)(a1 + 48), "voiceMailId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "markVoiceMailAsRead:forRemoteDevice:", v10, *(_QWORD *)(a1 + 56));
    goto LABEL_8;
  }
  v13 = *MEMORY[0x24BE08FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[_SVXServiceCommandHandlerPlayVoiceMail handleCommand:withContext:taskTracker:completion:]_block_invoke_4";
    _os_log_impl(&dword_214934000, v13, OS_LOG_TYPE_DEFAULT, "%s Voicemail did not play long enough to be marked as read", buf, 0xCu);
  }
  v12 = 0;
LABEL_12:
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();

}

@end
