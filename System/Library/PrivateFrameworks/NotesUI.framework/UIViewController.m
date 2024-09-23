@implementation UIViewController

void __48__UIViewController_IC__ic_viewControllerManager__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "viewIfLoaded");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __62__UIViewController_IC__ic_showViewController_animated_sender___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showViewController:sender:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __76__UIViewController_IC__ic_dismissViewControllerOfClass_animated_completion___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

uint64_t __96__UIViewController_IC__ic_replacePresentedViewControllerWithViewController_animated_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

uint64_t __61__UIViewController_IC__ic_performBlockAfterActiveTransition___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
