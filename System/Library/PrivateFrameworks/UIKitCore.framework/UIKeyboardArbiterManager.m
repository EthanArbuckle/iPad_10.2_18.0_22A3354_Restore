@implementation UIKeyboardArbiterManager

- (BOOL)remoteKeyboardUndocked
{
  void *v2;
  char v3;

  +[UIKeyboardArbiterManager arbiterClient](UIKeyboardArbiterManager, "arbiterClient");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "remoteKeyboardUndocked");

  return v3;
}

+ (id)arbiterClient
{
  void *v4;
  void *v5;

  if (+[UIKeyboard inputUIOOP](UIKeyboard, "inputUIOOP"))
  {
    +[_UIKeyboardArbiterClient automaticSharedArbiterClient](_UIKeyboardArbiterClient, "automaticSharedArbiterClient");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIKeyboardArbiterManager.m"), 42, CFSTR("arbiterClient should be _UIKeyboardArbiterClientSpringBoard"));

    }
  }
  else
  {
    +[_UIRemoteKeyboards sharedRemoteKeyboards](_UIRemoteKeyboards, "sharedRemoteKeyboards");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

+ (id)sharedArbiterManager
{
  if (qword_1ECD7E000 != -1)
    dispatch_once(&qword_1ECD7E000, &__block_literal_global_251);
  return (id)_MergedGlobals_1069;
}

void __48__UIKeyboardArbiterManager_sharedArbiterManager__block_invoke()
{
  UIKeyboardArbiterManager *v0;
  void *v1;

  v0 = objc_alloc_init(UIKeyboardArbiterManager);
  v1 = (void *)_MergedGlobals_1069;
  _MergedGlobals_1069 = (uint64_t)v0;

}

- (id)keyboardWindow
{
  void *v2;
  void *v3;

  if (+[UIKeyboard inputUIOOP](UIKeyboard, "inputUIOOP"))
  {
    v2 = 0;
  }
  else
  {
    +[_UIRemoteKeyboards sharedRemoteKeyboards](_UIRemoteKeyboards, "sharedRemoteKeyboards");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "keyboardWindow");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (void)forceKeyboardAway
{
  id v2;

  +[UIKeyboardArbiterManager arbiterClient](UIKeyboardArbiterManager, "arbiterClient");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "forceKeyboardAway");

}

- (void)preserveKeyboardWithId:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[UIKeyboardArbiterManager arbiterClient](UIKeyboardArbiterManager, "arbiterClient");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preserveKeyboardWithId:", v3);

}

- (void)restoreKeyboardWithId:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[UIKeyboardArbiterManager arbiterClient](UIKeyboardArbiterManager, "arbiterClient");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "restoreKeyboardWithId:", v3);

}

- (void)userSelectedApp:(id)a3 onCompletion:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  +[UIKeyboardArbiterManager arbiterClient](UIKeyboardArbiterManager, "arbiterClient");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "userSelectedApp:onCompletion:", v6, v5);

}

- (void)userSelectedProcessIdentifier:(int)a3 withSceneIdentity:(id)a4 onCompletion:(id)a5
{
  uint64_t v6;
  id v7;
  id v8;
  id v9;

  v6 = *(_QWORD *)&a3;
  v7 = a5;
  v8 = a4;
  +[UIKeyboardArbiterManager arbiterClient](UIKeyboardArbiterManager, "arbiterClient");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "userSelectedProcessIdentifier:withSceneIdentity:onCompletion:", v6, v8, v7);

}

@end
