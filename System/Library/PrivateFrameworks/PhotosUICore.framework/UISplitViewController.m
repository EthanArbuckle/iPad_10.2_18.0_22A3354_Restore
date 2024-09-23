@implementation UISplitViewController

void __99__UISplitViewController_PXProgrammaticNavigation__navigateToDestination_options_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a3;
  v6 = v5;
  if ((unint64_t)(a2 - 2) < 4)
  {
    v8 = v5;
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
LABEL_7:
    v6 = v8;
    goto LABEL_8;
  }
  if (a2 == 1)
  {
    v8 = v5;
    objc_msgSend(*(id *)(a1 + 40), "navigateToDestination:options:completionHandler:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 56));
    goto LABEL_7;
  }
  if (!a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("UIViewController+PXProgrammaticNavigation.m"), 503, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
LABEL_8:

}

@end
