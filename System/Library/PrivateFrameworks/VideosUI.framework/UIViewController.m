@implementation UIViewController

void __47__UIViewController_VideosUI__vui_ppt_isLoading__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  _QWORD v7[6];

  objc_msgSend(a2, "subviews");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__UIViewController_VideosUI__vui_ppt_isLoading__block_invoke_2;
  v7[3] = &unk_1E9F9E720;
  v7[4] = *(_QWORD *)(a1 + 32);
  v7[5] = a4;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v7);

}

void __47__UIViewController_VideosUI__vui_ppt_isLoading__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    **(_BYTE **)(a1 + 40) = 1;
    *a4 = 1;
  }

}

Class __63__UIViewController_VideosUI___vui_TVLoadingViewControllerClass__block_invoke()
{
  Class result;

  result = NSClassFromString(CFSTR("_TVLoadingViewController"));
  _vui_TVLoadingViewControllerClass___loadingViewClass = (uint64_t)result;
  return result;
}

uint64_t __76__UIViewController_VideosUI__vui_presentViewController_animated_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));
}

@end
