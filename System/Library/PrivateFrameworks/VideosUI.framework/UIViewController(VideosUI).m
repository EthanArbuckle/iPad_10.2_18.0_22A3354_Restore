@implementation UIViewController(VideosUI)

- (BOOL)vui_ppt_isLoading
{
  void *v1;
  void *v2;
  void *v3;
  double v4;
  _BOOL8 v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  objc_msgSend(a1, "view");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "subviews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__11;
  v12 = __Block_byref_object_dispose__11;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __47__UIViewController_VideosUI__vui_ppt_isLoading__block_invoke;
  v7[3] = &unk_1E9F9E748;
  v7[4] = &v8;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v7);
  v3 = (void *)v9[5];
  v5 = 0;
  if (v3)
  {
    objc_msgSend(v3, "alpha");
    if (v4 > 0.0)
      v5 = 1;
  }
  _Block_object_dispose(&v8, 8);

  return v5;
}

+ (id)_vui_TVLoadingViewControllerClass
{
  if (_vui_TVLoadingViewControllerClass___onceToken != -1)
    dispatch_once(&_vui_TVLoadingViewControllerClass___onceToken, &__block_literal_global_74);
  return (id)_vui_TVLoadingViewControllerClass___loadingViewClass;
}

- (void)vui_presentViewController:()VideosUI animated:completion:
{
  id v8;
  id v9;
  id v10;
  id v11;
  void (**v12)(_QWORD);
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  void *v19;
  id v20;
  id v21;
  char v22;

  v8 = a3;
  v9 = a5;
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __76__UIViewController_VideosUI__vui_presentViewController_animated_completion___block_invoke;
  v18 = &unk_1E9F9E790;
  v19 = a1;
  v20 = v8;
  v22 = a4;
  v21 = v9;
  v10 = v9;
  v11 = v8;
  v12 = (void (**)(_QWORD))_Block_copy(&v15);
  objc_msgSend(a1, "presentedViewController", v15, v16, v17, v18, v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
    objc_msgSend(v13, "dismissViewControllerAnimated:completion:", a4, v12);
  else
    v12[2](v12);

}

@end
