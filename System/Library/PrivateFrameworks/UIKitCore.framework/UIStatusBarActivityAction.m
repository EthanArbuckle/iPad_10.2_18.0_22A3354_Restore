@implementation UIStatusBarActivityAction

uint64_t __62___UIStatusBarActivityAction_actionForBackgroundActivityType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  UIHandleStatusBarTapAction *v6;
  id *v7;
  void *v8;
  void *v9;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  if (v4 > 0x25)
    v5 = 0;
  else
    v5 = qword_186683E20[v4];
  if ((objc_msgSend((id)UIApp, "handleDoubleHeightStatusBarTapWithStyleOverride:", v5) & 1) == 0)
  {
    v6 = -[UIHandleStatusBarTapAction initWithStatusBarStyle:andStatusBarStyleOverride:]([UIHandleStatusBarTapAction alloc], "initWithStatusBarStyle:andStatusBarStyleOverride:", 0, v5);
    objc_msgSend(v3, "window");
    v7 = (id *)objc_claimAutoreleasedReturnValue();
    -[UIWindow _fbsScene](v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sendActions:", v9);

  }
  return 1;
}

@end
