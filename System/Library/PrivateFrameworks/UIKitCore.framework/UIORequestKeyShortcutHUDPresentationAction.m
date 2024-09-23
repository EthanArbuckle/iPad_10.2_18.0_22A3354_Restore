@implementation UIORequestKeyShortcutHUDPresentationAction

void __85___UIORequestKeyShortcutHUDPresentationAction_initWithConfiguration_responseHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  char isKindOfClass;
  uint64_t v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v3 = (void *)objc_opt_new();
    objc_msgSend(v3, "setAccepted:", 0);
  }
  objc_opt_self();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v7, "response");
    v6 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v6;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __75___UIORequestKeyShortcutHUDPresentationAction_performActionFromConnection___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "canSendResponse"))
  {
    v3 = *(void **)(a1 + 32);
    +[_UIORequestKeyShortcutHUDPresentationActionResponse _responseWithHUDPresentationResponse:](_UIORequestKeyShortcutHUDPresentationActionResponse, "_responseWithHUDPresentationResponse:", v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sendResponse:", v4);

  }
}

void __75___UIORequestKeyShortcutHUDPresentationAction_performActionFromConnection___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    +[_UIKeyShortcutHUDServer sharedHUDServer](_UIKeyShortcutHUDServer, "sharedHUDServer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "configuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "windowScene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __75___UIORequestKeyShortcutHUDPresentationAction_performActionFromConnection___block_invoke_12;
    v13[3] = &unk_1E16E4700;
    v8 = *(_QWORD *)(a1 + 40);
    v14 = *(id *)(a1 + 48);
    objc_msgSend(v5, "presentHUDWithConfiguration:inWindowScene:forConnection:completionHandler:", v6, v7, v8, v13);

    v9 = v14;
  }
  else
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v3;
        _os_log_fault_impl(&dword_185066000, v12, OS_LOG_TYPE_FAULT, "The keyboard shortcut HUD failed to find a window scene in OverlayUI to present in. displayDelegate = %@", buf, 0xCu);
      }

    }
    else
    {
      v10 = _UIInternalPreference_KeyShortcutHUDEnhancedLogging_block_invoke___s_category;
      if (!_UIInternalPreference_KeyShortcutHUDEnhancedLogging_block_invoke___s_category)
      {
        v10 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v10, (unint64_t *)&_UIInternalPreference_KeyShortcutHUDEnhancedLogging_block_invoke___s_category);
      }
      v11 = *(NSObject **)(v10 + 8);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v16 = v3;
        _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "The keyboard shortcut HUD failed to find a window scene in OverlayUI to present in. displayDelegate = %@", buf, 0xCu);
      }
    }
    v9 = (void *)objc_opt_new();
    objc_msgSend(v9, "setAccepted:", 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }

}

uint64_t __75___UIORequestKeyShortcutHUDPresentationAction_performActionFromConnection___block_invoke_12(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
