@implementation UIKeyCommand(IC)

+ (id)ic_keyCommandWithInput:()IC modifierFlags:action:discoverabilityTitle:
{
  void *v9;
  id v10;
  void *v11;

  v9 = (void *)MEMORY[0x1E0DC3930];
  v10 = a6;
  objc_msgSend(v9, "keyCommandWithInput:modifierFlags:action:", a3, a4, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDiscoverabilityTitle:", v10);

  return v11;
}

@end
