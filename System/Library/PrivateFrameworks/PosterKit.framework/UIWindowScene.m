@implementation UIWindowScene

void __62__UIWindowScene_PRScene__pr_updatePreferences_withTransition___block_invoke(id *a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(a1[4], "applyToClientSettings:", a2);
  objc_msgSend(a1[5], "animationSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAnimationSettings:", v5);

  objc_msgSend(a1[5], "animationSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(a1[6], "_synchronizeDrawing");
    objc_msgSend(a1[6], "_synchronizedDrawingFence");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAnimationFence:", v7);

  }
  objc_msgSend(v8, "pr_setUpdateSnapshot:", objc_msgSend(a1[5], "contentSignificantlyChanged"));

}

@end
