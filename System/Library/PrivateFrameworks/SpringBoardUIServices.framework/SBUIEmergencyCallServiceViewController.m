@implementation SBUIEmergencyCallServiceViewController

- (SBUIEmergencyCallServiceViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  SBUIEmergencyCallServiceViewController *v4;
  SBUIEmergencyCallServiceViewController *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  UIColor *tintColor;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBUIEmergencyCallServiceViewController;
  v4 = -[SBUIEmergencyCallServiceViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
  {
    v4->_backgroundStyle = 2;
    objc_msgSend(MEMORY[0x1E0CEAC70], "settingsForPrivateStyle:", 2010);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "colorTint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "colorTintAlpha");
    objc_msgSend(v7, "colorWithAlphaComponent:");
    v8 = objc_claimAutoreleasedReturnValue();
    tintColor = v5->_tintColor;
    v5->_tintColor = (UIColor *)v8;

  }
  return v5;
}

- (void)backgroundStyle:(id)a3
{
  if (a3)
    (*((void (**)(id, int64_t))a3 + 2))(a3, self->_backgroundStyle);
}

- (void)noteTintColorForBackgroundStyleChanged:(id)a3
{
  UIColor **p_tintColor;
  id v5;

  p_tintColor = &self->_tintColor;
  v5 = a3;
  if ((-[UIColor isEqual:](*p_tintColor, "isEqual:") & 1) == 0)
    objc_storeStrong((id *)p_tintColor, a3);

}

+ (id)_remoteViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE7B54D0);
}

+ (id)_exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE7A69B0);
}

- (int64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (void)setBackgroundStyle:(int64_t)a3
{
  self->_backgroundStyle = a3;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
}

@end
