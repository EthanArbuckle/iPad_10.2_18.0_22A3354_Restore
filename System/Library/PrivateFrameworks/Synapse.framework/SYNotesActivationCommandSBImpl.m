@implementation SYNotesActivationCommandSBImpl

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
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  uint64_t v17;
  Class (*v18)(uint64_t);
  void *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v5 = a3;
  v6 = a4;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2050000000;
  v7 = (void *)getSBSSystemNotesPresentationConfigurationClass_softClass_0;
  v24 = getSBSSystemNotesPresentationConfigurationClass_softClass_0;
  v8 = MEMORY[0x1E0C809B0];
  if (!getSBSSystemNotesPresentationConfigurationClass_softClass_0)
  {
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __getSBSSystemNotesPresentationConfigurationClass_block_invoke_0;
    v19 = &unk_1E757B260;
    v20 = &v21;
    __getSBSSystemNotesPresentationConfigurationClass_block_invoke_0((uint64_t)&v16);
    v7 = (void *)v22[3];
  }
  v9 = objc_retainAutorelease(v7);
  _Block_object_dispose(&v21, 8);
  v10 = (void *)objc_msgSend([v9 alloc], "initWithSceneBundleIdentifier:userActivity:preferredPresentationMode:", CFSTR("com.apple.mobilenotes"), v5, 0);
  v21 = 0;
  v22 = &v21;
  v23 = 0x2050000000;
  v11 = (void *)getSBSSystemNotesPresentationRequestClass_softClass;
  v24 = getSBSSystemNotesPresentationRequestClass_softClass;
  if (!getSBSSystemNotesPresentationRequestClass_softClass)
  {
    v16 = v8;
    v17 = 3221225472;
    v18 = __getSBSSystemNotesPresentationRequestClass_block_invoke;
    v19 = &unk_1E757B260;
    v20 = &v21;
    __getSBSSystemNotesPresentationRequestClass_block_invoke((uint64_t)&v16);
    v11 = (void *)v22[3];
  }
  v12 = objc_retainAutorelease(v11);
  _Block_object_dispose(&v21, 8);
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __67__SYNotesActivationCommandSBImpl__activateWithActivity_completion___block_invoke;
  v14[3] = &unk_1E757B338;
  v15 = v6;
  v13 = v6;
  objc_msgSend(v12, "performPresentationWithConfiguration:completion:", v10, v14);

}

void __67__SYNotesActivationCommandSBImpl__activateWithActivity_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    v4 = os_log_create("com.apple.synapse", ");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 138412290;
      v7 = v3;
      _os_log_impl(&dword_1BCC38000, v4, OS_LOG_TYPE_DEFAULT, "Error received requesting backlink indicator: %@", (uint8_t *)&v6, 0xCu);
    }

  }
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);

}

@end
