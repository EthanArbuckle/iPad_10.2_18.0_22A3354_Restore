@implementation UIActivityIndicatorView(PKAppearanceObject)

- (uint64_t)pk_childrenForAppearance
{
  return MEMORY[0x1E0C9AA60];
}

- (void)pk_applyAppearance:()PKAppearanceObject
{
  id v4;

  objc_msgSend(a3, "textColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setColor:", v4);

}

@end
