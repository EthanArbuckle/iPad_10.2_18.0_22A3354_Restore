@implementation UIRemoteKeyboardWindowHosted

+ (BOOL)_isSecure
{
  return 1;
}

+ (BOOL)_isHostedInAnotherProcess
{
  void *v2;
  void *v3;
  char v4;

  if (qword_1ECD7A2C8 != -1)
    dispatch_once(&qword_1ECD7A2C8, &__block_literal_global_210_0);
  if (!byte_1ECD7A2B2)
    return 1;
  +[UIWindow _applicationKeyWindow](UIWindow, "_applicationKeyWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "_isHostedInAnotherProcess");
  else
    v4 = 1;

  return v4;
}

void __57__UIRemoteKeyboardWindowHosted__isHostedInAnotherProcess__block_invoke()
{
  id v0;

  _UIMainBundleIdentifier();
  v0 = (id)objc_claimAutoreleasedReturnValue();
  byte_1ECD7A2B2 = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.InCallService"));

}

- (double)_adjustedWindowLevelFromLevel:(double)a3
{
  double result;
  objc_super v6;

  if (dyld_program_sdk_at_least()
    && (_UIApplicationIsSystemApplication() & 1) == 0
    && (objc_msgSend((id)UIApp, "_isSpringBoard") & 1) == 0
    && !_AXSProcessDrawsAssistiveUI())
  {
    return -9999999.0;
  }
  v6.receiver = self;
  v6.super_class = (Class)UIRemoteKeyboardWindowHosted;
  -[UIRemoteKeyboardWindow _adjustedWindowLevelFromLevel:](&v6, sel__adjustedWindowLevelFromLevel_, a3);
  return result;
}

- (int64_t)_orientationForViewTransform
{
  return 1;
}

- (int64_t)_orientationForRootTransform
{
  return 1;
}

- (int64_t)_orientationForSceneTransform
{
  return 1;
}

- (BOOL)_isTextEffectsWindowHosting
{
  return 0;
}

- (double)keyboardWidthForCurrentDevice
{
  unint64_t v3;
  double result;
  double v5;

  v3 = -[UITextEffectsWindow interfaceOrientation](self, "interfaceOrientation") - 1;
  -[UIRemoteKeyboardWindowHosted keyboardScreenReferenceSize](self, "keyboardScreenReferenceSize");
  if (v3 >= 2)
    return v5;
  return result;
}

@end
