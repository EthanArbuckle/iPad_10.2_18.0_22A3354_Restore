@implementation SBUIPasscodeLockViewFactory

+ (id)passcodeLockViewForUsersCurrentStyle
{
  return +[SBUIPasscodeLockViewFactory passcodeLockViewForStyle:](SBUIPasscodeLockViewFactory, "passcodeLockViewForStyle:", SBUICurrentPasscodeStyleForUser());
}

+ (id)passcodeLockViewForStyle:(int)a3
{
  return +[SBUIPasscodeLockViewFactory _passcodeLockViewForStyle:withLightStyle:](SBUIPasscodeLockViewFactory, "_passcodeLockViewForStyle:withLightStyle:", *(_QWORD *)&a3, 0);
}

+ (id)lightPasscodeLockViewForUsersCurrentStyle
{
  return +[SBUIPasscodeLockViewFactory lightPasscodeLockViewForStyle:](SBUIPasscodeLockViewFactory, "lightPasscodeLockViewForStyle:", SBUICurrentPasscodeStyleForUser());
}

+ (id)lightPasscodeLockViewForStyle:(int)a3
{
  return +[SBUIPasscodeLockViewFactory _passcodeLockViewForStyle:withLightStyle:](SBUIPasscodeLockViewFactory, "_passcodeLockViewForStyle:withLightStyle:", *(_QWORD *)&a3, 1);
}

+ (id)installTonightPasscodeLockViewForUsersCurrentStyle
{
  uint64_t v3;
  uint64_t v4;
  SBUIPasscodeLockViewInstallTonightSimpleFixedDigitKeypad *v5;
  uint64_t v6;
  __objc2_class *v7;
  uint64_t v8;
  void *v9;

  v3 = SBUICurrentPasscodeStyleForUser();
  v4 = v3;
  if ((_DWORD)v3 == 2)
  {
    v7 = SBUIPasscodeLockViewInstallTonightLongNumericKeypad;
LABEL_9:
    v8 = objc_msgSend([v7 alloc], "initWithLightStyle:", 0);
    goto LABEL_10;
  }
  if ((_DWORD)v3 == 1)
  {
    v5 = [SBUIPasscodeLockViewInstallTonightSimpleFixedDigitKeypad alloc];
    v6 = 6;
    goto LABEL_7;
  }
  if ((_DWORD)v3)
  {
    v7 = SBUIPasscodeLockViewInstallTonightWithKeyboard;
    goto LABEL_9;
  }
  v5 = [SBUIPasscodeLockViewInstallTonightSimpleFixedDigitKeypad alloc];
  v6 = 4;
LABEL_7:
  v8 = -[SBUIPasscodeLockViewInstallTonightSimpleFixedDigitKeypad initWithLightStyle:numberOfDigits:](v5, "initWithLightStyle:numberOfDigits:", 0, v6);
LABEL_10:
  v9 = (void *)v8;
  objc_msgSend(a1, "_commonInitPasscodeView:forStyle:", v8, v4);
  return v9;
}

+ (id)_passcodeLockViewForStyle:(int)a3 withLightStyle:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v5;
  SBUIPasscodeLockViewSimpleFixedDigitKeypad *v7;
  _BOOL8 v8;
  uint64_t v9;
  __objc2_class *v10;
  uint64_t v11;
  void *v12;

  v4 = a4;
  v5 = *(_QWORD *)&a3;
  if (a3 == 2)
  {
    v10 = SBUIPasscodeLockViewLongNumericKeypad;
LABEL_9:
    v11 = objc_msgSend([v10 alloc], "initWithLightStyle:", a4);
    goto LABEL_10;
  }
  if (a3 == 1)
  {
    v7 = [SBUIPasscodeLockViewSimpleFixedDigitKeypad alloc];
    v8 = v4;
    v9 = 6;
    goto LABEL_7;
  }
  if (a3)
  {
    v10 = SBUIPasscodeLockViewWithKeyboard;
    goto LABEL_9;
  }
  v7 = [SBUIPasscodeLockViewSimpleFixedDigitKeypad alloc];
  v8 = v4;
  v9 = 4;
LABEL_7:
  v11 = -[SBUIPasscodeLockViewSimpleFixedDigitKeypad initWithLightStyle:numberOfDigits:](v7, "initWithLightStyle:numberOfDigits:", v8, v9);
LABEL_10:
  v12 = (void *)v11;
  objc_msgSend(a1, "_commonInitPasscodeView:forStyle:", v11, v5);
  return v12;
}

+ (void)_commonInitPasscodeView:(id)a3 forStyle:(int)a4
{
  uint64_t v4;
  id v6;
  id v7;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  objc_msgSend(v6, "setStyle:", v4);
  objc_msgSend(a1, "_defaultPasscodeBiometricResource");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBiometricResource:", v7);

}

+ (void)setPasscodeBiometricResource:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if ((id)_passcodeBiometricResource != v4)
  {
    v5 = v4;
    objc_storeStrong((id *)&_passcodeBiometricResource, a3);
    v4 = v5;
  }

}

+ (id)_defaultPasscodeBiometricResource
{
  if (_defaultPasscodeBiometricResource___once != -1)
    dispatch_once(&_defaultPasscodeBiometricResource___once, &__block_literal_global_13);
  if (_passcodeBiometricResource)
    return (id)_passcodeBiometricResource;
  else
    return (id)_defaultPasscodeBiometricResource__defaultPasscodeBiometricResource;
}

void __64__SBUIPasscodeLockViewFactory__defaultPasscodeBiometricResource__block_invoke()
{
  SBUIPasscodeBiometricResource *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [SBUIPasscodeBiometricResource alloc];
  +[SBUIBiometricResource sharedInstance](SBUIBiometricResource, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[SBUIPasscodeBiometricResource initWithBiometricResource:overrideMatchingAssertionFactory:](v0, "initWithBiometricResource:overrideMatchingAssertionFactory:", v3, 0);
  v2 = (void *)_defaultPasscodeBiometricResource__defaultPasscodeBiometricResource;
  _defaultPasscodeBiometricResource__defaultPasscodeBiometricResource = v1;

}

@end
