@implementation _UIInputHostController

+ (id)_keyboardControllerForIntent:(int64_t)a3
{
  void *v3;
  uint64_t v4;
  void *v5;

  switch(a3)
  {
    case 3:
      goto LABEL_4;
    case 2:
      +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "inputWindowRootViewController");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 1:
LABEL_4:
      +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:](UITextEffectsWindow, "sharedTextEffectsWindowForWindowScene:", 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "rootViewController");
      v4 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v5 = (void *)v4;

      return v5;
  }
  return 0;
}

@end
