@implementation UIScreen(TelephonyUI)

- (uint64_t)screenSizeCategory
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__UIScreen_TelephonyUI__screenSizeCategory__block_invoke;
  block[3] = &unk_1E75FD2A8;
  block[4] = a1;
  if (screenSizeCategory_onceToken != -1)
    dispatch_once(&screenSizeCategory_onceToken, block);
  return screenSizeCategory_screenCategory;
}

- (BOOL)isUserInterfaceIdiomPad
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "traitCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "userInterfaceIdiom") == 1;

  return v2;
}

@end
