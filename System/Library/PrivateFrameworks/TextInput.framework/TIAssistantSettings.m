@implementation TIAssistantSettings

+ (void)setTestBlock:(id)a3
{
  uint64_t v3;
  void *v4;

  v3 = objc_msgSend(a3, "copy");
  v4 = (void *)_assistantTestBlock;
  _assistantTestBlock = v3;

}

+ (void)connectForOperations:(id)a3 withErrorHandler:(id)a4
{
  id *v4;
  id *v5;
  void (**v7)(id, void *, void *);
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  void (**v16)(_QWORD);
  void *v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id location[2];

  v7 = (void (**)(id, void *, void *))a3;
  v8 = a4;
  _assistantInternalQueue();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.TextInput.rdt"), 4096);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE05A8A8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRemoteObjectInterface:", v11);

  objc_msgSend(v10, "_setQueue:", v9);
  objc_msgSend(v10, "resume");
  if (_assistantTestBlock)
    (*(void (**)(void))(_assistantTestBlock + 16))();
  objc_initWeak(location, v10);
  v12 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __61__TIAssistantSettings_connectForOperations_withErrorHandler___block_invoke;
  v23[3] = &unk_1E243B468;
  objc_copyWeak(&v24, location);
  v13 = (void *)MEMORY[0x18D783768](v23);
  v14 = v13;
  if (v8)
  {
    v20[0] = v12;
    v20[1] = 3221225472;
    v20[2] = __61__TIAssistantSettings_connectForOperations_withErrorHandler___block_invoke_2;
    v20[3] = &unk_1E2439B80;
    v15 = v20;
    v4 = &v21;
    v21 = v13;
    v5 = &v22;
    v22 = v8;
  }
  else
  {
    v15 = v13;
  }
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __61__TIAssistantSettings_connectForOperations_withErrorHandler___block_invoke_3;
  v18[3] = &unk_1E243A720;
  v16 = (void (**)(_QWORD))(id)MEMORY[0x18D783768](v15);
  v19 = v16;
  objc_msgSend(v10, "remoteObjectProxyWithErrorHandler:", v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
    v7[2](v7, v17, v14);
  else
    v16[2](v16);

  if (v8)
  {

  }
  objc_destroyWeak(&v24);
  objc_destroyWeak(location);

}

+ (void)presentDialogForType:(int64_t)a3 withCompletionHandler:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  int64_t v13;

  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__TIAssistantSettings_presentDialogForType_withCompletionHandler___block_invoke;
  v11[3] = &unk_1E2439BD0;
  v13 = a3;
  v12 = v6;
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __66__TIAssistantSettings_presentDialogForType_withCompletionHandler___block_invoke_3;
  v9[3] = &unk_1E2439BF8;
  v10 = v12;
  v8 = v12;
  objc_msgSend(a1, "connectForOperations:withErrorHandler:", v11, v9);

}

+ (void)promptToEnableDataSharingWithCompletionHandler:(id)a3
{
  objc_msgSend(a1, "presentDialogForType:withCompletionHandler:", 2, a3);
}

+ (void)promptToRemindDataSharingWithCompletionHandler:(id)a3
{
  objc_msgSend(a1, "presentDialogForType:withCompletionHandler:", 3, a3);
}

+ (void)promptReminderDataSharingWithCompletionHandler:(id)a3
{
  objc_msgSend(a1, "presentDialogForType:withCompletionHandler:", 3, a3);
}

+ (void)promptToEnableDictationWithCompletionHandler:(id)a3
{
  objc_msgSend(a1, "presentDialogForType:withCompletionHandler:", 0, a3);
}

+ (void)dismissedDataSharingWithResponse:(int64_t)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __56__TIAssistantSettings_dismissedDataSharingWithResponse___block_invoke;
  v3[3] = &__block_descriptor_40_e40_v24__0___TIAssistantSettings__8___v___16l;
  v3[4] = a3;
  objc_msgSend(a1, "connectForOperations:withErrorHandler:", v3, 0);
}

+ (void)dismissDialog
{
  void *v3;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  _assistantInternalQueue();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __36__TIAssistantSettings_dismissDialog__block_invoke;
  v4[3] = &unk_1E243AE68;
  v4[4] = &v5;
  TIDispatchSync(v3, v4);

  if (*((_BYTE *)v6 + 24))
    objc_msgSend(a1, "connectForOperations:withErrorHandler:", &__block_literal_global_20_4337, 0);
  _Block_object_dispose(&v5, 8);
}

+ (void)launchKeyboardSettings
{
  objc_msgSend(a1, "connectForOperations:withErrorHandler:", &__block_literal_global_21, 0);
}

+ (void)launchDictationSettings
{
  objc_msgSend(a1, "connectForOperations:withErrorHandler:", &__block_literal_global_22_4336, 0);
}

+ (void)launchPencilSettings
{
  objc_msgSend(a1, "connectForOperations:withErrorHandler:", &__block_literal_global_23, 0);
}

uint64_t __43__TIAssistantSettings_launchPencilSettings__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "launchPencilSettings");
}

uint64_t __46__TIAssistantSettings_launchDictationSettings__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "launchDictationSettings");
}

uint64_t __45__TIAssistantSettings_launchKeyboardSettings__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "launchKeyboardSettings");
}

uint64_t __36__TIAssistantSettings_dismissDialog__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = _dialogWasRequested;
  return result;
}

void __36__TIAssistantSettings_dismissDialog__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __36__TIAssistantSettings_dismissDialog__block_invoke_3;
  v6[3] = &unk_1E2439BF8;
  v7 = v4;
  v5 = v4;
  objc_msgSend(a2, "dismissDialogWithCompletionHandler:", v6);

}

uint64_t __36__TIAssistantSettings_dismissDialog__block_invoke_3(uint64_t a1)
{
  _dialogWasRequested = 0;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __56__TIAssistantSettings_dismissedDataSharingWithResponse___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dismissedDataSharingWithResponse:", *(_QWORD *)(a1 + 32));
}

void __66__TIAssistantSettings_presentDialogForType_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a3;
  _dialogWasRequested = 1;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __66__TIAssistantSettings_presentDialogForType_withCompletionHandler___block_invoke_2;
  v8[3] = &unk_1E2439BA8;
  v9 = v5;
  v6 = *(_QWORD *)(a1 + 40);
  v10 = *(id *)(a1 + 32);
  v7 = v5;
  objc_msgSend(a2, "presentDialogForType:withCompletionHandler:", v6, v8);

}

uint64_t __66__TIAssistantSettings_presentDialogForType_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  _dialogWasRequested = 0;
  return result;
}

uint64_t __66__TIAssistantSettings_presentDialogForType_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  _dialogWasRequested = 0;
  return result;
}

void __61__TIAssistantSettings_connectForOperations_withErrorHandler___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidate");
  if (_assistantTestBlock)
    (*(void (**)(void))(_assistantTestBlock + 16))();

}

uint64_t __61__TIAssistantSettings_connectForOperations_withErrorHandler___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __61__TIAssistantSettings_connectForOperations_withErrorHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  NSLog(CFSTR("%s sent an assistant settings request to the assistant settings server but received error %@"), "+[TIAssistantSettings connectForOperations:withErrorHandler:]_block_invoke_3", a2);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
