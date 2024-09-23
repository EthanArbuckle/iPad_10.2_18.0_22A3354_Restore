@implementation SBUIPasscodeLockViewLongNumericKeypad

- (SBUIPasscodeLockViewLongNumericKeypad)initWithLightStyle:(BOOL)a3
{
  SBUIPasscodeLockViewLongNumericKeypad *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBUIPasscodeLockViewLongNumericKeypad;
  v4 = -[SBUIPasscodeLockViewWithKeypad initWithLightStyle:](&v7, sel_initWithLightStyle_);
  if (v4)
  {
    if (a3)
      objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    else
      objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIPasscodeLockViewBase setCustomBackgroundColor:](v4, "setCustomBackgroundColor:", v5);

  }
  return v4;
}

- (id)_newEntryField
{
  return -[SBUILongNumericPasscodeEntryField initWithDefaultSizeAndLightStyle:]([SBUILongNumericPasscodeEntryField alloc], "initWithDefaultSizeAndLightStyle:", -[SBUIPasscodeLockViewWithKeypad _usesLightStyle](self, "_usesLightStyle"));
}

- (void)_setHasInput:(BOOL)a3
{
  _QWORD v5[5];
  BOOL v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBUIPasscodeLockViewLongNumericKeypad;
  -[SBUIPasscodeLockViewWithKeypad _setHasInput:](&v7, sel__setHasInput_);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__SBUIPasscodeLockViewLongNumericKeypad__setHasInput___block_invoke;
  v5[3] = &unk_1E4C3E430;
  v5[4] = self;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v5, 0.25);
}

void __54__SBUIPasscodeLockViewLongNumericKeypad__setHasInput___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_longNumericEntryField");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setShowsOkButton:", *(unsigned __int8 *)(a1 + 40));

}

- (double)_entryFieldBottomYDistanceFromNumberPadTopButton
{
  double result;

  objc_msgSend(MEMORY[0x1E0DA9E68], "pinLongNumericEntryFieldBottomYDistanceFromNumberPadTopButton:", -[SBUIPasscodeLockViewBase _isBoundsPortraitOriented](self, "_isBoundsPortraitOriented"));
  return result;
}

@end
