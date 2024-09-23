@implementation UIViewControllerKeyboardAnimationStyle

void __59___UIViewControllerKeyboardAnimationStyle_initWithContext___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setIsAnimationCompleting:", 1);
  objc_msgSend(*(id *)(a1 + 32), "previousCompleteHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "previousCompleteHandler");
    v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, uint64_t))v6)[2](v6, v7, a3);

  }
  else
  {
    objc_msgSend(v7, "_setWillCompleteHandler:", 0);
  }

}

uint64_t __111___UIViewControllerKeyboardAnimationStyle_launchAnimation_afterStarted_completion_forHost_fromCurrentPosition___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_launchAnimation:afterStarted:completion:forHost:fromCurrentPosition:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 72));
}

uint64_t __112___UIViewControllerKeyboardAnimationStyle__launchAnimation_afterStarted_completion_forHost_fromCurrentPosition___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __112___UIViewControllerKeyboardAnimationStyle__launchAnimation_afterStarted_completion_forHost_fromCurrentPosition___block_invoke_2(uint64_t a1, void *a2)
{
  if (objc_msgSend(a2, "isCancelled"))
    objc_msgSend(*(id *)(a1 + 32), "setInteractivelyCancelled:", 1);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
