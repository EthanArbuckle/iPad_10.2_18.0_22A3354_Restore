@implementation SVXSayItChildTaskProvider

- (id)createWithCommand:(id)a3 taskTracker:(id)a4 listenAfterSpeakingDisabled:(BOOL)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  BOOL v18;

  v7 = a3;
  v8 = a4;
  v9 = mach_absolute_time();
  objc_msgSend(v8, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __87__SVXSayItChildTaskProvider_createWithCommand_taskTracker_listenAfterSpeakingDisabled___block_invoke;
  v15[3] = &unk_24D24C5E0;
  v16 = v7;
  v17 = v9;
  v18 = a5;
  v11 = v7;
  objc_msgSend(v10, "mutatedCopyWithMutator:", v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "beginChildWithContext:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void __87__SVXSayItChildTaskProvider_createWithCommand_taskTracker_listenAfterSpeakingDisabled___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  void *v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "setTimestamp:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "dialogIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDialogIdentifier:", v4);

  objc_msgSend(*(id *)(a1 + 32), "listenAfterSpeaking");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "BOOLValue");

  if (!v6)
    goto LABEL_5;
  if (!*(_BYTE *)(a1 + 48))
  {
    v9 = 1;
    goto LABEL_7;
  }
  v7 = *MEMORY[0x24BE08FB0];
  v8 = os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_DEFAULT);
  v9 = 0;
  if (v8)
  {
    v11 = 136315138;
    v12 = "-[SVXSayItChildTaskProvider createWithCommand:taskTracker:listenAfterSpeakingDisabled:]_block_invoke";
    _os_log_impl(&dword_214934000, v7, OS_LOG_TYPE_DEFAULT, "%s Overriding listenAfterSpeaking due to defaults", (uint8_t *)&v11, 0xCu);
LABEL_5:
    v9 = 0;
  }
LABEL_7:
  objc_msgSend(v3, "setListensAfterSpeaking:", v9);
  objc_msgSend(*(id *)(a1 + 32), "listenAfterSpeakingBehavior");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setListenAfterSpeakingBehavior:", v10);

}

@end
