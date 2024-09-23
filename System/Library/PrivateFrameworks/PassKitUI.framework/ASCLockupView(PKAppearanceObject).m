@implementation ASCLockupView(PKAppearanceObject)

- (void)pk_applyAppearance:()PKAppearanceObject
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "foregroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setBackgroundColor:", v5);

  objc_msgSend(v4, "tintColor");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "setTintColor:", v6);
}

- (uint64_t)pk_childrenForAppearance
{
  return MEMORY[0x1E0C9AA60];
}

@end
