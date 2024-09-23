@implementation UIKeyShortcutHUDServer

void __42___UIKeyShortcutHUDServer_sharedHUDServer__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_MergedGlobals_1090;
  _MergedGlobals_1090 = v0;

}

uint64_t __101___UIKeyShortcutHUDServer_presentHUDWithConfiguration_inWindowScene_forConnection_completionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  _UIKeyShortcutHUDLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_185066000, v2, OS_LOG_TYPE_DEFAULT, "Server did request keyboard focus to OverlayUI", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __101___UIKeyShortcutHUDServer_presentHUDWithConfiguration_inWindowScene_forConnection_completionHandler___block_invoke_21(uint64_t a1)
{
  _BYTE *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
    WeakRetained[8] &= ~1u;

}

void __59___UIKeyShortcutHUDServer__dismissHUDWithSelectedShortcut___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59___UIKeyShortcutHUDServer__dismissHUDWithSelectedShortcut___block_invoke_2;
  block[3] = &unk_1E16B47A8;
  v6 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = *(id *)(a1 + 40);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __59___UIKeyShortcutHUDServer__dismissHUDWithSelectedShortcut___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setPasteAuthenticationMessage:", *(_QWORD *)(a1 + 40));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __59___UIKeyShortcutHUDServer__dismissHUDWithSelectedShortcut___block_invoke_3(uint64_t a1)
{
  _BYTE *WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BYTE *v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    v9 = WeakRetained;
    objc_msgSend(WeakRetained, "setHudWindow:", 0);
    objc_msgSend(v9, "setSession:", 0);
    if (+[UIKeyShortcutHUDService _isOOPFeatureEnabled](UIKeyShortcutHUDService, "_isOOPFeatureEnabled")
      && _UIApplicationProcessIsOverlayUI())
    {
      objc_msgSend(v9, "modifierKeyListener");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setCurrentModifierFlags:", 0);

    }
    objc_msgSend(*(id *)(a1 + 32), "keyWindow");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(a1 + 40);

    if (v5 == v6)
    {
      if (v4)
      {
        objc_msgSend(v4, "makeKeyWindow");
        if (!+[UIKeyShortcutHUDService _isOOPFeatureEnabled](UIKeyShortcutHUDService, "_isOOPFeatureEnabled"))
        {
          objc_msgSend(*(id *)(a1 + 48), "keyCommand");
          v7 = (void *)objc_claimAutoreleasedReturnValue();

          if (v7)
            objc_msgSend(v4, "updateFocusIfNeeded");
        }
      }
    }
    objc_msgSend(*(id *)(a1 + 40), "setHidden:", 1);
    v9[8] &= ~2u;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postNotificationName:object:", CFSTR("UIKeyShortcutHUDDidDismissNotification"), *(_QWORD *)(a1 + 40));

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
    WeakRetained = v9;
  }

}

void __59___UIKeyShortcutHUDServer__dismissHUDWithSelectedShortcut___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  objc_msgSend(*(id *)(a1 + 32), "_sendResponse:withSession:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  if (+[UIKeyShortcutHUDService _isOOPFeatureEnabled](UIKeyShortcutHUDService, "_isOOPFeatureEnabled"))
  {
    getSBSKeyboardFocusServiceClass();
    v2 = (void *)objc_opt_new();
    objc_msgSend(*(id *)(a1 + 56), "windowScene");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "systemKeyCommandOverlayRulesToken");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(*(id *)(a1 + 32), "systemKeyCommandOverlayRulesToken");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "invalidate");

      objc_msgSend(*(id *)(a1 + 32), "setSystemKeyCommandOverlayRulesToken:", 0);
      _UIKeyShortcutHUDLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_DEFAULT, "Server stopped pointing systemKeyCommandOverlay environment to OverlayUI", buf, 2u);
      }

    }
    objc_msgSend(v3, "_FBSScene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identityToken");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeKeyboardFocusFromSceneIdentity:processID:", v8, getpid());

    _UIKeyShortcutHUDLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_185066000, v9, OS_LOG_TYPE_DEFAULT, "Server stopped pointing keyboard focus to OverlayUI", v10, 2u);
    }

  }
}

void __79___UIKeyShortcutHUDServer_keyShortcutHUDViewControllerDidBeginTypeAheadSearch___block_invoke(uint64_t a1)
{
  id v2;

  +[UIKeyboardImpl activeInstance](UIKeyboardImpl, "activeInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performDelete");
  objc_msgSend(v2, "handleKeyEvent:", *(_QWORD *)(a1 + 32));

}

@end
