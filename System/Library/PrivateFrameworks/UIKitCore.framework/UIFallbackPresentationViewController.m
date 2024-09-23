@implementation UIFallbackPresentationViewController

void __85___UIFallbackPresentationViewController__presentViewController_sendingView_animated___block_invoke(_QWORD *a1)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v2 = objc_retainAutorelease(*(id *)(a1[4] + 976));
  objc_msgSend(v2, "rootViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentedViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "setRotationDecider:", 0);
    v5 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40);
    if (v5)
    {
      *(_QWORD *)(v5 + 256) = 0;
      v6 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
    }
    else
    {
      v6 = 0;
    }
    objc_msgSend(v6, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeFromSuperview");

    objc_msgSend(v2, "setHidden:", 1);
    objc_msgSend(v2, "setRootViewController:", 0);
    v8 = a1[4];
    v9 = *(void **)(v8 + 976);
    *(_QWORD *)(v8 + 976) = 0;

    _RestoreKeyWindow();
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "_restoreInputViewsAnimated:", 1);
    v10 = a1[5];
    if (v10)
      (*(void (**)(void))(v10 + 16))();
  }
}

void __94___UIFallbackPresentationViewController__dismissViewControllerWithTransition_from_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  id v5;

  VisibleViewController(*(void **)(a1 + 32));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "dismissCompletionHandler");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)v2;
    if (v2)
      (*(void (**)(uint64_t))(v2 + 16))(v2);

  }
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(void))(v4 + 16))();

}

@end
