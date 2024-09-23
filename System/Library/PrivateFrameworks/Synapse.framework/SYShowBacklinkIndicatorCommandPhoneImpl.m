@implementation SYShowBacklinkIndicatorCommandPhoneImpl

uint64_t __61__SYShowBacklinkIndicatorCommandPhoneImpl_runWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)runWithCompletion:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1BCC38000, log, OS_LOG_TYPE_ERROR, "Failed to create handle for process: %@, error: %@", (uint8_t *)&v3, 0x16u);
}

- (void)runWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  id v12;
  id *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  NSUserActivity *v18;
  void *v19;
  id v20;
  BOOL v21;
  int v22;
  NSObject *v23;
  void *v24;
  char v25;
  NSObject *v26;
  NSUserActivity *v27;
  NSUserActivity *userActivity;
  int v29;
  void *v30;
  _QWORD v31[4];
  void (**v32)(_QWORD);
  id v33;
  id v34;
  id v35;
  _QWORD v36[4];
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  _BYTE buf[24];
  void *v45;
  uint64_t *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __61__SYShowBacklinkIndicatorCommandPhoneImpl_runWithCompletion___block_invoke;
  v36[3] = &unk_1E757C0E8;
  v6 = v4;
  v37 = v6;
  v7 = (void (**)(_QWORD))MEMORY[0x1BCCFF08C](v36);
  if ((SYIsQuickNoteOnPhoneEnabled() & 1) != 0)
  {
    v35 = 0;
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", CFSTR("com.apple.BacklinkIndicator"), 1, &v35);
    v9 = v35;
    if (v9)
    {
      v10 = os_log_create("com.apple.synapse", ");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        userActivity = self->_userActivity;
        *(_DWORD *)buf = 138412802;
        *(_QWORD *)&buf[4] = CFSTR("com.apple.BacklinkIndicator");
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = userActivity;
        *(_WORD *)&buf[22] = 2112;
        v45 = v9;
        _os_log_error_impl(&dword_1BCC38000, v10, OS_LOG_TYPE_ERROR, "Failed to find record for %@ to show backlink indicator for activity: %@, error: %@", buf, 0x20u);
      }

      v7[2](v7);
      goto LABEL_32;
    }
    if (-[NSUserActivity _syIsShowBacklinkIndicatorUserActivity](self->_userActivity, "_syIsShowBacklinkIndicatorUserActivity"))
    {
LABEL_10:
      v12 = objc_alloc_init(MEMORY[0x1E0CA5938]);
      v38 = 0;
      v39 = &v38;
      v40 = 0x2020000000;
      v13 = (id *)getFBSOpenApplicationOptionKeyActivateSuspendedSymbolLoc_ptr;
      v41 = getFBSOpenApplicationOptionKeyActivateSuspendedSymbolLoc_ptr;
      if (!getFBSOpenApplicationOptionKeyActivateSuspendedSymbolLoc_ptr)
      {
        *(_QWORD *)buf = v5;
        *(_QWORD *)&buf[8] = 3221225472;
        *(_QWORD *)&buf[16] = __getFBSOpenApplicationOptionKeyActivateSuspendedSymbolLoc_block_invoke;
        v45 = &unk_1E757B260;
        v46 = &v38;
        __getFBSOpenApplicationOptionKeyActivateSuspendedSymbolLoc_block_invoke((uint64_t)buf);
        v13 = (id *)v39[3];
      }
      _Block_object_dispose(&v38, 8);
      if (!v13)
        -[SYShowBacklinkIndicatorCommandPhoneImpl runWithCompletion:].cold.1();
      v42 = *v13;
      v43 = MEMORY[0x1E0C9AAB0];
      v14 = (void *)MEMORY[0x1E0C99D80];
      v15 = v42;
      objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "setFrontBoardOptions:", v16);
      objc_initWeak((id *)buf, self);
      objc_msgSend(MEMORY[0x1E0CA5878], "defaultWorkspace");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = self->_userActivity;
      v31[0] = v5;
      v31[1] = 3221225472;
      v31[2] = __61__SYShowBacklinkIndicatorCommandPhoneImpl_runWithCompletion___block_invoke_8;
      v31[3] = &unk_1E757C110;
      objc_copyWeak(&v33, (id *)buf);
      v32 = v7;
      objc_msgSend(v17, "openUserActivity:usingApplicationRecord:configuration:completionHandler:", v18, v8, v12, v31);

      objc_destroyWeak(&v33);
      objc_destroyWeak((id *)buf);

      goto LABEL_32;
    }
    objc_msgSend(MEMORY[0x1E0D87DA0], "predicateMatchingBundleIdentifier:", CFSTR("com.apple.BacklinkIndicator"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 0;
    objc_msgSend(MEMORY[0x1E0D87D68], "handleForPredicate:error:", v30, &v34);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v34;
    if (v20)
      v21 = 1;
    else
      v21 = v19 == 0;
    v22 = v21;
    v29 = v22;
    if (!v21)
      goto LABEL_25;
    v23 = os_log_create("com.apple.synapse", ");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      -[SYShowBacklinkIndicatorCommandPhoneImpl runWithCompletion:].cold.2((uint64_t)CFSTR("com.apple.BacklinkIndicator"), (uint64_t)v20, v23);

    if (v19)
    {
LABEL_25:
      objc_msgSend(v19, "currentState");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "isRunning");

      if ((v25 & 1) != 0)
      {
        if (!v29)
        {

          goto LABEL_10;
        }
      }
      else
      {
        v26 = os_log_create("com.apple.synapse", ");
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          v27 = self->_userActivity;
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v27;
          _os_log_impl(&dword_1BCC38000, v26, OS_LOG_TYPE_INFO, "Backlink indicator isn't running. Skip request to hide the backlink indicator for activity: %@", buf, 0xCu);
        }

      }
    }
    v7[2](v7);

LABEL_32:
    goto LABEL_33;
  }
  v11 = os_log_create("com.apple.synapse", ");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BCC38000, v11, OS_LOG_TYPE_INFO, "Feature Flag is not enabled.", buf, 2u);
  }

  v7[2](v7);
LABEL_33:

}

- (BOOL)isActive
{
  return 1;
}

- (SYShowBacklinkIndicatorCommandPhoneImpl)initWithDomainIdentifiers:(id)a3 linkIdentifiers:(id)a4
{
  id v6;
  id v7;
  SYShowBacklinkIndicatorCommandPhoneImpl *v8;
  uint64_t v9;
  NSUserActivity *userActivity;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SYShowBacklinkIndicatorCommandPhoneImpl;
  v8 = -[SYShowBacklinkIndicatorCommandPhoneImpl init](&v12, sel_init);
  if (v8)
  {
    SYMakeUserActivity(CFSTR("com.apple.notes.activity.show-backlink"), v6, v7);
    v9 = objc_claimAutoreleasedReturnValue();
    userActivity = v8->_userActivity;
    v8->_userActivity = (NSUserActivity *)v9;

  }
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userActivity, 0);
}

void __61__SYShowBacklinkIndicatorCommandPhoneImpl_runWithCompletion___block_invoke_8(uint64_t a1, int a2, void *a3)
{
  id v5;
  _QWORD *WeakRetained;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  const __CFString *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v5)
    {
      v7 = os_log_create("com.apple.synapse", ");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __61__SYShowBacklinkIndicatorCommandPhoneImpl_runWithCompletion___block_invoke_8_cold_1((uint64_t)WeakRetained, (uint64_t)v5, v7);

    }
    if (a2)
    {
      v8 = os_log_create("com.apple.synapse", ");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = (void *)WeakRetained[1];
        objc_msgSend(v9, "userInfo");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = 138412802;
        v12 = CFSTR("com.apple.BacklinkIndicator");
        v13 = 2112;
        v14 = v9;
        v15 = 2112;
        v16 = v10;
        _os_log_impl(&dword_1BCC38000, v8, OS_LOG_TYPE_INFO, "Successfully invoked %@ to show or hide backlink indicator for activity: %@, userInfo: %@", (uint8_t *)&v11, 0x20u);

      }
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void)runWithCompletion:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getFBSOpenApplicationOptionKeyActivateSuspended(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("SYShowBacklinkIndicatorCommandPhoneImpl.m"), 26, CFSTR("%s"), dlerror());

  __break(1u);
}

void __61__SYShowBacklinkIndicatorCommandPhoneImpl_runWithCompletion___block_invoke_8_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  const __CFString *v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 8);
  v4 = 138412802;
  v5 = CFSTR("com.apple.BacklinkIndicator");
  v6 = 2112;
  v7 = v3;
  v8 = 2112;
  v9 = a2;
  _os_log_error_impl(&dword_1BCC38000, log, OS_LOG_TYPE_ERROR, "Failed to invoke %@ to show backlink indicator for activity: %@, error: %@", (uint8_t *)&v4, 0x20u);
}

@end
