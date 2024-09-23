@implementation SBStartupTransitionToHome

- (void)performTransitionWithCompletionBlock:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[5];
  id v10;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBStartupTransitionToHome.m"), 20, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionBlock"));

  }
  -[SBBaseStartupTransition mainWorkspace](self, "mainWorkspace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__SBStartupTransitionToHome_performTransitionWithCompletionBlock___block_invoke;
  v9[3] = &unk_1E8EA0C58;
  v9[4] = self;
  v10 = v5;
  v7 = v5;
  objc_msgSend(v6, "requestTransitionWithOptions:builder:validator:", 0, v9, &__block_literal_global_13);

}

void __66__SBStartupTransitionToHome_performTransitionWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  objc_msgSend(v3, "setSource:", 31);
  objc_msgSend(v3, "modifyApplicationContext:", &__block_literal_global_183);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__SBStartupTransitionToHome_performTransitionWithCompletionBlock___block_invoke_3;
  v5[3] = &unk_1E8EB0C08;
  v4 = *(void **)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  objc_msgSend(v3, "setTransactionConfigurator:", v5);

}

void __66__SBStartupTransitionToHome_performTransitionWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  +[SBWorkspaceEntity entity](SBHomeScreenEntity, "entity");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEntity:forLayoutRole:", v3, 1);

  +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEntity:forLayoutRole:", v4, 2);

}

void __66__SBStartupTransitionToHome_performTransitionWithCompletionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  SBUIStartupToHomescreenAnimationController *v4;
  void *v5;
  void *v6;
  void *v7;
  SBUIStartupToHomescreenAnimationController *v8;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  v4 = [SBUIStartupToHomescreenAnimationController alloc];
  objc_msgSend(v3, "transitionRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "overlay");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SBUIStartupToHomescreenAnimationController initWithTransitionContextProvider:overlay:](v4, "initWithTransitionContextProvider:overlay:", v5, v7);

  objc_msgSend(v3, "setSuggestedAnimationController:", v8);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__SBStartupTransitionToHome_performTransitionWithCompletionBlock___block_invoke_4;
  v9[3] = &unk_1E8E9F1C0;
  v10 = *(id *)(a1 + 40);
  objc_msgSend(v3, "setCompletionBlock:", v9);

}

uint64_t __66__SBStartupTransitionToHome_performTransitionWithCompletionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __66__SBStartupTransitionToHome_performTransitionWithCompletionBlock___block_invoke_5()
{
  return 1;
}

@end
