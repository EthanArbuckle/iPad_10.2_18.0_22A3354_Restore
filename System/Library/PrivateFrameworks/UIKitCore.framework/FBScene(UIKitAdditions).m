@implementation FBScene(UIKitAdditions)

- (void)_performUpdateWithoutActivation:()UIKitAdditions
{
  id v4;
  _QWORD v5[4];
  id v6;

  v4 = a3;
  if (objc_msgSend(a1, "isActive"))
  {
    objc_msgSend(a1, "performUpdate:", v4);
  }
  else
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __59__FBScene_UIKitAdditions___performUpdateWithoutActivation___block_invoke;
    v5[3] = &unk_1E16E3B68;
    v6 = v4;
    objc_msgSend(a1, "updateSettings:", v5);

  }
}

@end
