@implementation STUIStatusBarActivityAction

+ (id)actionForBackgroundActivityWithIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __73__STUIStatusBarActivityAction_actionForBackgroundActivityWithIdentifier___block_invoke;
  v8[3] = &unk_1E8D62D78;
  v9 = v4;
  v5 = v4;
  objc_msgSend(a1, "actionWithBlock:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __73__STUIStatusBarActivityAction_actionForBackgroundActivityWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void **v5;
  char v6;
  void *v7;
  unsigned int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = a2;
  v4 = STUIStyleOverrideForBackgroundActivityIdentifier(*(void **)(a1 + 32));
  v5 = (void **)MEMORY[0x1E0DC4730];
  v6 = objc_opt_respondsToSelector();
  v7 = *v5;
  if ((v6 & 1) != 0)
    v8 = objc_msgSend(v7, "handleStatusBarTapForBackgroundActivityWithIdentifier:", *(_QWORD *)(a1 + 32));
  else
    v8 = objc_msgSend(v7, "handleDoubleHeightStatusBarTapWithStyleOverride:", v4);
  if (v4)
    v9 = 1;
  else
    v9 = v8;
  if ((v8 & 1) == 0 && (_DWORD)v9)
  {
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3850]), "initWithStatusBarStyle:andStatusBarStyleOverride:", 0, v4);
    objc_msgSend(v3, "window");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_StatusBar_fbsScene");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sendActions:", v13);

  }
  return v9;
}

@end
