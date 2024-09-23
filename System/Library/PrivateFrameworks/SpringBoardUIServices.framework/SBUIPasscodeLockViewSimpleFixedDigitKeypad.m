@implementation SBUIPasscodeLockViewSimpleFixedDigitKeypad

- (SBUIPasscodeLockViewSimpleFixedDigitKeypad)initWithLightStyle:(BOOL)a3
{
  return -[SBUIPasscodeLockViewSimpleFixedDigitKeypad initWithLightStyle:numberOfDigits:](self, "initWithLightStyle:numberOfDigits:", a3, 6);
}

- (SBUIPasscodeLockViewSimpleFixedDigitKeypad)initWithLightStyle:(BOOL)a3 numberOfDigits:(unint64_t)a4
{
  SBUIPasscodeLockViewSimpleFixedDigitKeypad *v5;
  void *v6;
  objc_super v8;

  self->_numberOfDigits = a4;
  v8.receiver = self;
  v8.super_class = (Class)SBUIPasscodeLockViewSimpleFixedDigitKeypad;
  v5 = -[SBUIPasscodeLockViewWithKeypad initWithLightStyle:](&v8, sel_initWithLightStyle_);
  if (v5)
  {
    if (a3)
      objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    else
      objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBUIPasscodeLockViewBase setCustomBackgroundColor:](v5, "setCustomBackgroundColor:", v6);

  }
  return v5;
}

- (id)_newEntryField
{
  return -[SBUISimpleFixedDigitPasscodeEntryField initWithDefaultSizeAndLightStyle:numberOfDigits:]([SBUISimpleFixedDigitPasscodeEntryField alloc], "initWithDefaultSizeAndLightStyle:numberOfDigits:", -[SBUIPasscodeLockViewWithKeypad _usesLightStyle](self, "_usesLightStyle"), self->_numberOfDigits);
}

- (double)_entryFieldBottomYDistanceFromNumberPadTopButton
{
  double result;

  objc_msgSend(MEMORY[0x1E0DA9E68], "pinFixedDigitEntryFieldBottomYDistanceFromNumberPadTopButton:", -[SBUIPasscodeLockViewBase _isBoundsPortraitOriented](self, "_isBoundsPortraitOriented"));
  return result;
}

- (unint64_t)numberOfDigits
{
  return self->_numberOfDigits;
}

@end
