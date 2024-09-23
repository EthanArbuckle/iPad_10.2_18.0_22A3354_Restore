@implementation SBSUIUserSwipedToKillAction

+ (id)userSwipedToKillActionWithTimeoutHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D016A0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__SBSUIUserSwipedToKillAction_userSwipedToKillActionWithTimeoutHandler___block_invoke;
  v10[3] = &unk_1E4C3ED20;
  v11 = v4;
  v6 = v4;
  objc_msgSend(v5, "responderWithHandler:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setQueue:", MEMORY[0x1E0C80D38]);
  objc_msgSend(v7, "setTimeout:", dispatch_time(0, 100000000));
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInfo:responder:", 0, v7);

  return v8;
}

void __72__SBSUIUserSwipedToKillAction_userSwipedToKillActionWithTimeoutHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;

  objc_msgSend(a2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)acknowledge
{
  id v3;

  objc_msgSend(MEMORY[0x1E0D016A8], "response");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SBSUIUserSwipedToKillAction sendResponse:](self, "sendResponse:", v3);

}

@end
