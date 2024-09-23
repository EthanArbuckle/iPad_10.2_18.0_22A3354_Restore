@implementation UISceneHostingContentSizePreferenceClientComponent

id __80___UISceneHostingContentSizePreferenceClientComponent__setPreferredContentSize___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "setPreferredContentSize:", *(double *)(a1 + 32), *(double *)(a1 + 40));
  +[FBSSceneTransitionContext transitionContext](UIApplicationSceneTransitionContext, "transitionContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIScene _synchronizedDrawingFence](UIScene, "_synchronizedDrawingFence");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAnimationFence:", v3);

  return v2;
}

@end
