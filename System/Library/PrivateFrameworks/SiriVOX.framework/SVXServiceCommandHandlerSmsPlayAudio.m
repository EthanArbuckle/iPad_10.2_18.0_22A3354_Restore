@implementation SVXServiceCommandHandlerSmsPlayAudio

void __90___SVXServiceCommandHandlerSmsPlayAudio_handleCommand_withContext_taskTracker_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v5 = a3;
  v6 = v5;
  if (a2)
  {
    v7 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __90___SVXServiceCommandHandlerSmsPlayAudio_handleCommand_withContext_taskTracker_completion___block_invoke_2;
    v13[3] = &unk_24D24C640;
    v14 = v5;
    v15 = *(id *)(a1 + 40);
    v16 = *(id *)(a1 + 48);
    objc_msgSend(v7, "getCurrentSessionUsingBlock:", v13);

  }
  else
  {
    v8 = *(_QWORD *)(a1 + 48);
    if (v8)
    {
      v9 = objc_alloc(MEMORY[0x24BDD17C8]);
      objc_msgSend(*(id *)(a1 + 40), "aceId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("Failed to acquire audio for command %@."), v10);
      +[SVXServiceCommandResult resultFailureWithErrorCode:reason:](SVXServiceCommandResult, "resultFailureWithErrorCode:reason:", 0, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v12);

    }
  }

}

void __90___SVXServiceCommandHandlerSmsPlayAudio_handleCommand_withContext_taskTracker_completion___block_invoke_2(id *a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v3 = (objc_class *)MEMORY[0x24BE090F0];
  v4 = a2;
  v5 = [v3 alloc];
  v6 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __90___SVXServiceCommandHandlerSmsPlayAudio_handleCommand_withContext_taskTracker_completion___block_invoke_3;
  v11[3] = &unk_24D24CB10;
  v12 = a1[4];
  v7 = (void *)objc_msgSend(v5, "initWithBuilder:", v11);
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __90___SVXServiceCommandHandlerSmsPlayAudio_handleCommand_withContext_taskTracker_completion___block_invoke_4;
  v8[3] = &unk_24D24C618;
  v9 = a1[5];
  v10 = a1[6];
  objc_msgSend(v4, "startAudioPlaybackRequest:options:completion:", v7, 0, v8);

}

void __90___SVXServiceCommandHandlerSmsPlayAudio_handleCommand_withContext_taskTracker_completion___block_invoke_3(uint64_t a1, void *a2)
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

void __90___SVXServiceCommandHandlerSmsPlayAudio_handleCommand_withContext_taskTracker_completion___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  if (v8)
  {
    v3 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(*(id *)(a1 + 32), "aceId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("Failed to playback audio for command %@."), v4, v8);
    +[SVXServiceCommandResult resultFailureWithErrorCode:reason:](SVXServiceCommandResult, "resultFailureWithErrorCode:reason:", 0, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    +[SVXServiceCommandResult resultSuccess](SVXServiceCommandResult, "resultSuccess");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v6);

}

@end
