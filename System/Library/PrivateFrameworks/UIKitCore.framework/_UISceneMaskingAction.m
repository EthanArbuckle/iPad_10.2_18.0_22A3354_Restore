@implementation _UISceneMaskingAction

+ (id)actionForBeginMaskingWithReason:(int64_t)a3 continuation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v6 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  objc_msgSend(v7, "setObject:forSetting:", &unk_1E1A9A860, 0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forSetting:", v8, 1);

  v9 = (void *)MEMORY[0x1E0D016A0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __70___UISceneMaskingAction_actionForBeginMaskingWithReason_continuation___block_invoke;
  v14[3] = &unk_1E16C6A58;
  v15 = v6;
  v10 = v6;
  objc_msgSend(v9, "responderWithHandler:", v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setQueue:", MEMORY[0x1E0C80D38]);
  v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInfo:responder:", v7, v11);

  return v12;
}

+ (id)invalidationAction
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0D017D0]);
  objc_msgSend(v3, "setObject:forSetting:", &unk_1E1A9A878, 0);
  v4 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInfo:responder:", v3, 0);

  return v4;
}

@end
