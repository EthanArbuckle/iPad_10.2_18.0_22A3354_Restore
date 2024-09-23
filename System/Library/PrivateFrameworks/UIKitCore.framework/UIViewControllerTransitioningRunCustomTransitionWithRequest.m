@implementation UIViewControllerTransitioningRunCustomTransitionWithRequest

uint64_t ___UIViewControllerTransitioningRunCustomTransitionWithRequest_block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setDisableAlongsideView:", 1);
  return objc_msgSend(*(id *)(a1 + 40), "__runAlongsideAnimations");
}

void ___UIViewControllerTransitioningRunCustomTransitionWithRequest_block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  char v11;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = ___UIViewControllerTransitioningRunCustomTransitionWithRequest_block_invoke_3;
  v4[3] = &unk_1E16C27B8;
  v5 = *(id *)(a1 + 48);
  v6 = *(id *)(a1 + 56);
  v7 = *(id *)(a1 + 64);
  v11 = *(_BYTE *)(a1 + 96);
  v8 = *(id *)(a1 + 72);
  v9 = *(id *)(a1 + 80);
  v10 = *(id *)(a1 + 88);
  +[UIKeyboardSceneDelegate _pinInputViewsForKeyboardSceneDelegate:onBehalfOfResponder:duringBlock:](UIKeyboardSceneDelegate, "_pinInputViewsForKeyboardSceneDelegate:onBehalfOfResponder:duringBlock:", v3, v2, v4);

}

uint64_t ___UIViewControllerTransitioningRunCustomTransitionWithRequest_block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "handoffData");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    v4 = objc_msgSend(*(id *)(a1 + 40), "conformsToProtocol:", &unk_1EDDCE3D0);

    if (v4)
    {
      v5 = *(_QWORD *)(a1 + 48);
      v6 = *(void **)(a1 + 32);
      v7 = *(id *)(a1 + 40);
      objc_msgSend(v6, "handoffData");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "willBeginAfterPreemptionWithContext:data:", v5, v8);

    }
  }
  v9 = *(_QWORD *)(a1 + 48);
  if (*(_BYTE *)(a1 + 80))
    objc_msgSend(*(id *)(a1 + 56), "startInteractiveTransition:", v9);
  else
    objc_msgSend(*(id *)(a1 + 40), "animateTransition:", v9);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "interruptibleAnimatorForTransition:", *(_QWORD *)(a1 + 48));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      if (!*(_BYTE *)(a1 + 80))
        objc_msgSend(*(id *)(a1 + 48), "_setInteractiveUpdateHandler:", *(_QWORD *)(a1 + 64));
      objc_msgSend(*(id *)(a1 + 48), "_setInterruptible:", 1);
    }
  }
  result = *(_QWORD *)(a1 + 72);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

@end
