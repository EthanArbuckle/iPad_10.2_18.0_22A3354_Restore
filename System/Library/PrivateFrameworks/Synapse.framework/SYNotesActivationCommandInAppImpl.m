@implementation SYNotesActivationCommandInAppImpl

+ (id)fetchPresenterViewControllerInvocationBlock
{
  id v2;
  void *v3;

  v2 = a1;
  objc_sync_enter(v2);
  v3 = (void *)MEMORY[0x1BCCFF08C](__fetchPresenterViewControllerInvocationBlock);
  objc_sync_exit(v2);

  return v3;
}

+ (void)setFetchPresenterViewControllerInvocationBlock:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = a1;
  objc_sync_enter(v4);
  v5 = objc_msgSend(v7, "copy");
  v6 = (void *)__fetchPresenterViewControllerInvocationBlock;
  __fetchPresenterViewControllerInvocationBlock = v5;

  objc_sync_exit(v4);
}

+ (void)activateWithDomainIdentifier:(id)a3 noteIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = 0;
  if (a3 && a4)
  {
    v16[0] = a3;
    v10 = (void *)MEMORY[0x1E0C99D20];
    v11 = a4;
    v12 = a3;
    objc_msgSend(v10, "arrayWithObjects:count:", v16, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v15, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    SYMakeEditNoteUserActivity(v13, v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(a1, "_activateWithActivity:completion:", v9, v8);

}

+ (void)_activateWithActivity:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void (**v18)(_QWORD);
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;

  v6 = a3;
  v7 = a4;
  v8 = a1;
  objc_sync_enter(v8);
  v9 = (void *)objc_msgSend((id)__fetchPresenterViewControllerInvocationBlock, "copy");
  v10 = (void *)__fetchPresenterViewControllerInvocationBlock;
  __fetchPresenterViewControllerInvocationBlock = 0;

  objc_sync_exit(v8);
  if (SYIsPhone() && (SYIsQuickNoteOnPhoneEnabled() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isEqual:", CFSTR("com.apple.springboard")))
    {

LABEL_10:
      objc_msgSend(v8, "_launchNotesWithUserActivity:completion:", v6, v7);
      goto LABEL_15;
    }
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bundleIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "isEqual:", CFSTR("com.apple.BacklinkIndicator"));

    if (v17)
      goto LABEL_10;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __70__SYNotesActivationCommandInAppImpl__activateWithActivity_completion___block_invoke;
    v19[3] = &unk_1E757C3D8;
    v21 = v9;
    v20 = v6;
    v22 = v7;
    v18 = (void (**)(_QWORD))MEMORY[0x1BCCFF08C](v19);
    if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
      v18[2](v18);
    else
      dispatch_async(MEMORY[0x1E0C80D38], v18);

  }
  else
  {
    v13 = os_log_create("com.apple.synapse", ");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[SYNotesActivationCommandSynapseImpl _activateWithActivity:completion:].cold.1(v13);

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.synapse"), -127, 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v7 + 2))(v7, v14);

    }
  }
LABEL_15:

}

void __70__SYNotesActivationCommandInAppImpl__activateWithActivity_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "_createUserActivityDataWithSaving:options:error:", 0, MEMORY[0x1E0C9AA70], 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v12 = &v11;
  v13 = 0x2050000000;
  v5 = (void *)getICSystemPaperSceneViewControllerClass_softClass;
  v14 = getICSystemPaperSceneViewControllerClass_softClass;
  v6 = MEMORY[0x1E0C809B0];
  if (!getICSystemPaperSceneViewControllerClass_softClass)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __getICSystemPaperSceneViewControllerClass_block_invoke;
    v10[3] = &unk_1E757B260;
    v10[4] = &v11;
    __getICSystemPaperSceneViewControllerClass_block_invoke((uint64_t)v10);
    v5 = (void *)v12[3];
  }
  v7 = objc_retainAutorelease(v5);
  _Block_object_dispose(&v11, 8);
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __70__SYNotesActivationCommandInAppImpl__activateWithActivity_completion___block_invoke_2;
  v8[3] = &unk_1E757C0E8;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v7, "presentSystemPaperWithUserActivityData:presenter:completion:", v4, v3, v8);

}

uint64_t __70__SYNotesActivationCommandInAppImpl__activateWithActivity_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)_launchNotesWithUserActivity:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  void (**v17)(_QWORD, _QWORD, _QWORD);
  _QWORD v18[4];
  void (**v19)(_QWORD, _QWORD, _QWORD);
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __77__SYNotesActivationCommandInAppImpl__launchNotesWithUserActivity_completion___block_invoke;
  v21[3] = &unk_1E757BEC0;
  v8 = v5;
  v22 = v8;
  v9 = v6;
  v23 = v9;
  v10 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1BCCFF08C](v21);
  if (v8)
  {
    v20 = 0;
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", CFSTR("com.apple.mobilenotes"), 1, &v20);
    v12 = v20;
    if (v12)
    {
      v13 = os_log_create("com.apple.synapse", ");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v25 = v12;
        v26 = 2112;
        v27 = v8;
        _os_log_impl(&dword_1BCC38000, v13, OS_LOG_TYPE_DEFAULT, "Failed to create System Notes application record with error: %@, to launch for activity: %@", buf, 0x16u);
      }

    }
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = v7;
      v18[1] = 3221225472;
      v18[2] = __77__SYNotesActivationCommandInAppImpl__launchNotesWithUserActivity_completion___block_invoke_10;
      v18[3] = &unk_1E757B5D0;
      v19 = v10;
      objc_msgSend(v14, "openUserActivity:usingApplicationRecord:configuration:completionHandler:", v8, v11, 0, v18);

    }
    else if (v9)
    {
      ((void (**)(_QWORD, _QWORD, id))v10)[2](v10, 0, v12);
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v7;
    v16[1] = 3221225472;
    v16[2] = __77__SYNotesActivationCommandInAppImpl__launchNotesWithUserActivity_completion___block_invoke_2;
    v16[3] = &unk_1E757B5D0;
    v17 = v10;
    objc_msgSend(v15, "openApplicationWithBundleIdentifier:usingConfiguration:completionHandler:", CFSTR("com.apple.mobilenotes"), 0, v16);

    v12 = v17;
  }

}

void __77__SYNotesActivationCommandInAppImpl__launchNotesWithUserActivity_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  id v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (v5)
  {
    v6 = os_log_create("com.apple.synapse", ");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v10 = 138412546;
      v11 = v5;
      v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_1BCC38000, v6, OS_LOG_TYPE_DEFAULT, "Error received requesting System Notes presentation: %@, activity: %@", (uint8_t *)&v10, 0x16u);
    }

  }
  v8 = os_log_create("com.apple.synapse", ");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 67109120;
    LODWORD(v11) = a2;
    _os_log_impl(&dword_1BCC38000, v8, OS_LOG_TYPE_DEFAULT, "System Notes presentation request succeeded: %d", (uint8_t *)&v10, 8u);
  }

  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v5);

}

uint64_t __77__SYNotesActivationCommandInAppImpl__launchNotesWithUserActivity_completion___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __77__SYNotesActivationCommandInAppImpl__launchNotesWithUserActivity_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
