@implementation PLIsTallScreen

void __PLIsTallScreen_block_invoke()
{
  void *v0;
  void *v1;
  double v2;
  double v3;
  id v4;

  -[objc_class mainScreen](NSClassFromString((NSString *)CFSTR("UIScreen")), "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "currentMode");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v1 = v4;
  if (v4)
  {
    objc_msgSend(v4, "size");
    v1 = v4;
  }
  else
  {
    v2 = *MEMORY[0x1E0C9D820];
    v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  PLIsTallScreen_isTallScreen = v3 / v2 >= 1.70000005;

}

@end
