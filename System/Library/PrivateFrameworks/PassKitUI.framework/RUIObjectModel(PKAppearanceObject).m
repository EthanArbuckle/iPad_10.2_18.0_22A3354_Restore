@implementation RUIObjectModel(PKAppearanceObject)

- (uint64_t)pk_childrenForAppearance
{
  return MEMORY[0x1E0C9AA60];
}

- (void)pk_applyAppearance:()PKAppearanceObject
{
  PKAppearanceApplyToRemoteUIObjectModel(a3, a1);
}

@end
