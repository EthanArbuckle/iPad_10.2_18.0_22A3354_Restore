@implementation UIONavigationBarTitleRenamerConnectionAction

void __88___UIONavigationBarTitleRenamerConnectionAction_initWithSession_action_responseHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __88___UIONavigationBarTitleRenamerConnectionAction_initWithSession_action_responseHandler___block_invoke_2;
  v6[3] = &unk_1E16B2F48;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __88___UIONavigationBarTitleRenamerConnectionAction_initWithSession_action_responseHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __90___UIONavigationBarTitleRenamerConnectionAction__setupKeyboardEventDeferralForConnection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "windowScene");
    v5 = objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v13 = &v12;
    v14 = 0x2050000000;
    v6 = (void *)_MergedGlobals_1303;
    v15 = _MergedGlobals_1303;
    if (!_MergedGlobals_1303)
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __getSBSKeyboardFocusServiceClass_block_invoke_1;
      v11[3] = &unk_1E16B14C0;
      v11[4] = &v12;
      __getSBSKeyboardFocusServiceClass_block_invoke_1((uint64_t)v11);
      v6 = (void *)v13[3];
    }
    v7 = objc_retainAutorelease(v6);
    _Block_object_dispose(&v12, 8);
    v8 = (void *)objc_opt_new();
    -[NSObject _FBSScene](v5, "_FBSScene");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "identityToken");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "requestKeyboardFocusForSceneIdentity:processID:completion:", v10, getpid(), &__block_literal_global_627);
    objc_msgSend(*(id *)(a1 + 32), "setKfService:", v8);

  }
  else
  {
    UIOLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v11[0]) = 0;
      _os_log_error_impl(&dword_185066000, v5, OS_LOG_TYPE_ERROR, "_UIONavigationBarTitleRenamerConnectionAction: No display delegate available to set up keyboard event deferral", (uint8_t *)v11, 2u);
    }
  }

}

void __90___UIONavigationBarTitleRenamerConnectionAction__addViewToHierarchyForConnection_session___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint8_t buf[16];

  if (a2)
  {
    objc_msgSend(a2, "rootViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "view");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "addSubview:", *(_QWORD *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 48), "becomeFirstResponder");

  }
  else
  {
    UIOLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_185066000, v4, OS_LOG_TYPE_ERROR, "_UIONavigationBarTitleRenamerConnectionAction No display delegate available for view hierarchy population.", buf, 2u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", 0x1E17342E0, -1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 32);
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D016A8]), "initWithInfo:error:", 0, v5);
    objc_msgSend(v6, "sendResponse:", v7);

    +[_UINavigationBarTitleRenamer renameServer](_UINavigationBarTitleRenamer, "renameServer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "endSession:", *(_QWORD *)(a1 + 40));

  }
}

@end
