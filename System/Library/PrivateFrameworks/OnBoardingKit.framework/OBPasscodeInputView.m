@implementation OBPasscodeInputView

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)becomeFirstResponder
{
  void *v2;
  char v3;

  -[OBPasscodeInputView passcodeField](self, "passcodeField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "becomeFirstResponder");

  return v3;
}

- (BOOL)isFirstResponder
{
  void *v2;
  char v3;

  -[OBPasscodeInputView passcodeField](self, "passcodeField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isFirstResponder");

  return v3;
}

- (BOOL)resignFirstResponder
{
  void *v3;
  char v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OBPasscodeInputView;
  -[OBPasscodeInputView resignFirstResponder](&v6, sel_resignFirstResponder);
  -[OBPasscodeInputView passcodeField](self, "passcodeField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "resignFirstResponder");

  return v4;
}

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[OBPasscodeInputView passcodeField](self, "passcodeField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (id)passcode
{
  return 0;
}

- (id)passcodeField
{
  return 0;
}

- (void)shake
{
  void *v2;
  OBPasscodeInputView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  id v28;

  v2 = (void *)MEMORY[0x1E0CD2848];
  v3 = self;
  objc_msgSend(v2, "animationWithKeyPath:", CFSTR("position.x"));
  v28 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setMass:", 1.20000005);
  objc_msgSend(v28, "setStiffness:", 1200.0);
  objc_msgSend(v28, "setDamping:", 12.0);
  LODWORD(v4) = 1028389654;
  LODWORD(v5) = 990057071;
  LODWORD(v6) = 1059712716;
  LODWORD(v7) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setTimingFunction:", v8);

  objc_msgSend(v28, "setDuration:", 0.666999996);
  objc_msgSend(v28, "setInitialVelocity:", 0.0);
  v9 = *MEMORY[0x1E0CD2B50];
  objc_msgSend(v28, "setFillMode:", *MEMORY[0x1E0CD2B50]);
  v10 = (void *)MEMORY[0x1E0CB37E8];
  -[OBPasscodeInputView layer](v3, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "position");
  v13 = v12 + 75.0;
  *(float *)&v13 = v13;
  objc_msgSend(v10, "numberWithFloat:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setFromValue:", v14);

  -[OBPasscodeInputView layer](v3, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addAnimation:forKey:", v28, CFSTR("spring"));

  objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("position.x"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v17) = 1054276898;
  LODWORD(v18) = 1058305108;
  LODWORD(v19) = 0;
  LODWORD(v20) = 1.0;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v17, v19, v18, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTimingFunction:", v21);

  objc_msgSend(v16, "setDuration:", 0.100000001);
  objc_msgSend(v16, "setFillMode:", v9);
  v22 = (void *)MEMORY[0x1E0CB37E8];
  -[OBPasscodeInputView layer](v3, "layer");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "position");
  v25 = v24 + -75.0;
  *(float *)&v25 = v25;
  objc_msgSend(v22, "numberWithFloat:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFromValue:", v26);

  -[OBPasscodeInputView layer](v3, "layer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "addAnimation:forKey:", v16, CFSTR("force"));
}

- (OBPasscodeInputViewDelegate)delegate
{
  return (OBPasscodeInputViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
