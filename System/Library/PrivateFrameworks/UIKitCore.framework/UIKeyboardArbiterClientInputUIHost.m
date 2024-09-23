@implementation UIKeyboardArbiterClientInputUIHost

void __51___UIKeyboardArbiterClientInputUIHost_arbiterProxy__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  KeyboardArbiterClientLog_2();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_185066000, v3, OS_LOG_TYPE_DEFAULT, "-[_UIKeyboardArbiterClientInputUIHost arbiterProxy]_block_invoke  Failed to access remote service: %@", (uint8_t *)&v4, 0xCu);
  }

}

void __56___UIKeyboardArbiterClientInputUIHost_snapsShotKeyboard__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "resetSnapshotWithWindowCheck:", 0);
  objc_msgSend(*(id *)(a1 + 32), "kbUIStateDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "keyboardWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "snapshotView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setKeyboardSnapshot:", v4);

  objc_msgSend(*(id *)(a1 + 32), "keyboardSnapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setUserInteractionEnabled:", 0);

  objc_msgSend(*(id *)(a1 + 32), "keyboardSnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAllowsHitTesting:", 0);

  objc_msgSend(*(id *)(a1 + 32), "kbUIStateDelegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "keyboardWindow");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "keyboardSnapshot");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSubview:", v9);

}

void __69___UIKeyboardArbiterClientInputUIHost_inputSessionDidEndUnexpectedly__block_invoke(uint64_t a1)
{
  _UIKeyboardUIInformation *v2;
  _UIKeyboardUIInformation *v3;

  v2 = [_UIKeyboardUIInformation alloc];
  v3 = -[_UIKeyboardUIInformation initWithKeyboardFrame:onScreen:animated:tracking:wantsFence:](v2, "initWithKeyboardFrame:onScreen:animated:tracking:wantsFence:", 0, 0, 0, 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(*(id *)(a1 + 32), "setCurrentUIState:", v3);

}

void __81___UIKeyboardArbiterClientInputUIHost_keyboardSendNotification_withInfo_isStart___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81___UIKeyboardArbiterClientInputUIHost_keyboardSendNotification_withInfo_isStart___block_invoke_2;
  block[3] = &unk_1E16B3F40;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __81___UIKeyboardArbiterClientInputUIHost_keyboardSendNotification_withInfo_isStart___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "completeKeyboardChange");

}

void __93___UIKeyboardArbiterClientInputUIHost_keyboardVisibilityDidChangeWithFrame_visible_tracking___block_invoke(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __93___UIKeyboardArbiterClientInputUIHost_keyboardVisibilityDidChangeWithFrame_visible_tracking___block_invoke_2;
  block[3] = &unk_1E16B3F40;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v2);
}

void __93___UIKeyboardArbiterClientInputUIHost_keyboardVisibilityDidChangeWithFrame_visible_tracking___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "completeKeyboardChange");

}

uint64_t __93___UIKeyboardArbiterClientInputUIHost_keyboardVisibilityDidChangeWithFrame_visible_tracking___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_clearPreservedInputViewsWithId:clearKeyboard:", 0x1E171C5E0, 0);
}

void __61___UIKeyboardArbiterClientInputUIHost_completeKeyboardChange__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "arbiterProxy");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "signalKeyboardChangeComplete");

}

@end
