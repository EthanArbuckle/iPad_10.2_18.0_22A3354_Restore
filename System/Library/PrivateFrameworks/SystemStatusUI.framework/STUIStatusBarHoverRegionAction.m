@implementation STUIStatusBarHoverRegionAction

+ (id)_hoverActionForRegion:(int64_t)a3
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__STUIStatusBarHoverRegionAction__hoverActionForRegion___block_invoke;
  v4[3] = &__block_descriptor_40_e23_B16__0__STUIStatusBar_8l;
  v4[4] = a3;
  objc_msgSend(a1, "actionWithBlock:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __56__STUIStatusBarHoverRegionAction__hoverActionForRegion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a2;
  if ((objc_msgSend((id)*MEMORY[0x1E0DC4730], "handleStatusBarHoverActionForRegion:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3CC8]), "initWithRegion:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v3, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_StatusBar_fbsScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "sendActions:", v7);

  }
  return 1;
}

+ (id)leadingHoverAction
{
  return (id)objc_msgSend(a1, "_hoverActionForRegion:", 0);
}

+ (id)trailingHoverAction
{
  return (id)objc_msgSend(a1, "_hoverActionForRegion:", 1);
}

@end
