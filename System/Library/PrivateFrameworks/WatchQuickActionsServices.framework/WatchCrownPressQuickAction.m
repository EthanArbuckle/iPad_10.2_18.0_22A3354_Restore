@implementation WatchCrownPressQuickAction

- (WatchCrownPressQuickAction)initWithLocalizedTitle:(id)a3 completionHandler:(id)a4
{
  id v6;
  WatchCrownPressQuickAction *v7;
  objc_super v9;
  _QWORD v10[4];
  id v11;

  v10[1] = 3221225472;
  v10[2] = __71__WatchCrownPressQuickAction_initWithLocalizedTitle_completionHandler___block_invoke;
  v10[3] = &unk_24F5474B8;
  v11 = a4;
  v9.receiver = self;
  v9.super_class = (Class)WatchCrownPressQuickAction;
  v10[0] = MEMORY[0x24BDAC760];
  v6 = v11;
  v7 = -[WatchQuickAction initWithLocalizedTitle:activationCallback:](&v9, sel_initWithLocalizedTitle_activationCallback_, a3, v10);

  return v7;
}

void __71__WatchCrownPressQuickAction_initWithLocalizedTitle_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  +[WatchQuickActionsServices sharedInstance](WatchQuickActionsServices, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __71__WatchCrownPressQuickAction_initWithLocalizedTitle_completionHandler___block_invoke_2;
  v7[3] = &unk_24F546E58;
  v5 = *(id *)(a1 + 32);
  v8 = v3;
  v9 = v5;
  v6 = v3;
  objc_msgSend(v4, "requestCrownPressWithCompletionHandler:", v7);

}

uint64_t __71__WatchCrownPressQuickAction_initWithLocalizedTitle_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 32));
  return result;
}

@end
