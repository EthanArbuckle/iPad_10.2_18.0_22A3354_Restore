@implementation UIAlertControllerShimPresenter

uint64_t __91___UIAlertControllerShimPresenter__presentAlertControllerAnimated_hostingScene_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __104___UIAlertControllerShimPresenter__presentAlertControllerFromRect_inView_direction_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_popoverController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 88), *(unsigned __int8 *)(a1 + 96), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
    (*(void (**)(void))(v2 + 16))();

}

uint64_t __104___UIAlertControllerShimPresenter__presentAlertControllerFromRect_inView_direction_animated_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __78___UIAlertControllerShimPresenter__dismissAlertControllerAnimated_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "alertController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_flipFrameForShimDismissalIfNecessary");

  +[_UIAlertControllerShimPresenter _removePresenter:](_UIAlertControllerShimPresenter, "_removePresenter:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "_tearDownInPopoverViewController");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __78___UIAlertControllerShimPresenter__dismissAlertControllerAnimated_completion___block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "alertController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_flipFrameForShimDismissalIfNecessary");

  return objc_msgSend(*(id *)(a1 + 40), "dismissViewControllerAnimated:completion:", *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

uint64_t __78___UIAlertControllerShimPresenter__dismissAlertControllerAnimated_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
