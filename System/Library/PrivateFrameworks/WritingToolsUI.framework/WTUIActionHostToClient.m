@implementation WTUIActionHostToClient

+ (id)actionForProofreadingSessionWithUUID:(id)a3 updateState:(int64_t)a4 forSuggestionWithUUID:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v8 = a5;
  objc_msgSend(a1, "_settingForActionType:sessionUUID:", 1, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forSetting:", v10, 4);

  objc_msgSend(v9, "setObject:forSetting:", v8, 3);
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInfo:responder:", v9, 0);

  return v11;
}

+ (id)_settingForActionType:(int64_t)a3 sessionUUID:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;

  v5 = (objc_class *)MEMORY[0x24BE0BE40];
  v6 = a4;
  v7 = objc_alloc_init(v5);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forSetting:", v8, 1);

  objc_msgSend(v7, "setObject:forSetting:", v6, 2);
  return v7;
}

+ (id)actionForChangingPresentationStyle:(int64_t)a3
{
  id v5;
  void *v6;
  void *v7;

  v5 = objc_alloc_init(MEMORY[0x24BE0BE40]);
  objc_msgSend(v5, "setObject:forSetting:", &unk_251C0F7B0, 1);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v6, 5);

  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInfo:responder:", v5, 0);
  return v7;
}

- (void)performActionForHostedWindowScene:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;

  v19 = a3;
  -[WTUIActionHostToClient info](self, "info");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WTUIActionHostToClient info](self, "info");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForSetting:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  if (v7 == 2)
  {
    objc_msgSend(v19, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[WTUIActionHostToClient info](self, "info");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForSetting:", 5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "integerValue");

    objc_msgSend(v8, "savePresentationStyle:", v18);
LABEL_7:

    goto LABEL_8;
  }
  if (v7 == 1)
  {
    objc_msgSend(v19, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForSetting:", 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "session");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v9, "isEqual:", v11);

    if (v12)
    {
      objc_msgSend(v4, "objectForSetting:", 4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "integerValue");

      objc_msgSend(v4, "objectForSetting:", 3);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "proofreadingSessionWithUUID:updateState:forSuggestionWithUUID:", v9, v14, v15);

    }
    goto LABEL_7;
  }
LABEL_8:

}

@end
