@implementation UINavigationController(PhotosUICore_PPT)

- (void)ppt_notifyTransitionAnimationDidComplete
{
  void (**v2)(void);
  void (**v3)(void);

  objc_msgSend(a1, "_ppt_transitionAnimationCompletionHandler");
  v2 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    v2[2]();
    objc_msgSend(a1, "_ppt_setTransitionAnimationCompletionHandler:", 0);
    v2 = v3;
  }

}

- (id)_ppt_transitionAnimationCompletionHandler
{
  void *v1;
  void *v2;

  objc_getAssociatedObject(a1, (const void *)PPTTransitionAnimationCompletionHandlerAssociationKey);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = _Block_copy(v1);

  return v2;
}

- (void)ppt_installTransitionAnimationCompletionHandler:()PhotosUICore_PPT
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  id v12;
  id v13;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(a1, "_ppt_transitionAnimationCompletionHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v9 = 3221225472;
    v10 = __92__UINavigationController_PhotosUICore_PPT__ppt_installTransitionAnimationCompletionHandler___block_invoke;
    v11 = &unk_1E513F8E8;
    v12 = v5;
    v13 = v4;
    v6 = v5;
    v7 = (void *)objc_msgSend(&v8, "copy");
    objc_msgSend(a1, "_ppt_setTransitionAnimationCompletionHandler:", v7, v8, v9, v10, v11);

  }
}

- (void)_ppt_setTransitionAnimationCompletionHandler:()PhotosUICore_PPT
{
  const void *v4;
  id v5;

  v4 = (const void *)PPTTransitionAnimationCompletionHandlerAssociationKey;
  v5 = _Block_copy(aBlock);
  objc_setAssociatedObject(a1, v4, v5, (void *)1);

}

@end
