@implementation UIUserNotificationAlertView

void __36___UIUserNotificationAlertView_show__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  _QWORD *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "text");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (const __CFString *)v5;
  else
    v7 = &stru_1E16EDF20;
  objc_msgSend(v4, "addObject:", v7);

  v8 = *(void **)(a1 + 40);
  objc_msgSend(v3, "placeholder");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (const __CFString *)v9;
  else
    v11 = &stru_1E16EDF20;
  objc_msgSend(v8, "addObject:", v11);

  v12 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v3, "keyboardType"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObject:", v13);

  v14 = *(void **)(a1 + 56);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v3, "autocapitalizationType"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObject:", v15);

  v16 = *(void **)(a1 + 64);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v3, "autocorrectionType"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObject:", v17);

  objc_msgSend(*(id *)(a1 + 72), "setObject:forKey:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0C9B880]);
  objc_msgSend(*(id *)(a1 + 72), "setObject:forKey:", *(_QWORD *)(a1 + 40), *MEMORY[0x1E0C9B878]);
  objc_msgSend(*(id *)(a1 + 72), "setObject:forKey:", *(_QWORD *)(a1 + 48), *MEMORY[0x1E0C9B850]);
  v19 = *(_QWORD *)(a1 + 64);
  v18 = *(void **)(a1 + 72);
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v20 = (_QWORD *)qword_1ECD79F88;
  v31 = qword_1ECD79F88;
  if (!qword_1ECD79F88)
  {
    v21 = SpringBoardServicesLibrary_2();
    v20 = dlsym(v21, "SBUserNotificationTextAutocorrectionType");
    v29[3] = (uint64_t)v20;
    qword_1ECD79F88 = (uint64_t)v20;
  }
  _Block_object_dispose(&v28, 8);
  if (v20)
  {
    objc_msgSend(v18, "setObject:forKey:", v19, *v20);
    v22 = *(void **)(a1 + 72);
    v23 = *(_QWORD *)(a1 + 56);
    v28 = 0;
    v29 = &v28;
    v30 = 0x2020000000;
    v24 = (_QWORD *)qword_1ECD79F90;
    v31 = qword_1ECD79F90;
    if (!qword_1ECD79F90)
    {
      v25 = SpringBoardServicesLibrary_2();
      v24 = dlsym(v25, "SBUserNotificationTextAutocapitalizationType");
      v29[3] = (uint64_t)v24;
      qword_1ECD79F90 = (uint64_t)v24;
    }
    _Block_object_dispose(&v28, 8);
    if (v24)
    {
      objc_msgSend(v22, "setObject:forKey:", v23, *v24);

      return;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getSBUserNotificationTextAutocapitalizationType(void)");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, CFSTR("UIAlertView_ViewServiceSupport.m"), 31, CFSTR("%s"), dlerror());
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getSBUserNotificationTextAutocorrectionType(void)");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, CFSTR("UIAlertView_ViewServiceSupport.m"), 30, CFSTR("%s"), dlerror());
  }

  __break(1u);
}

@end
