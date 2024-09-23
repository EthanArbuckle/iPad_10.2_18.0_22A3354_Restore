@implementation _UIDebugIdentifierWindow

- (_UIDebugIdentifierWindow)initWithWindowScene:(id)a3
{
  _UIDebugIdentifierWindow *v3;
  _UIDebugIdentifierWindow *v4;
  UILabel *v5;
  uint64_t v6;
  UILabel *sceneIdentifierLabel;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_UIDebugIdentifierWindow;
  v3 = -[UIWindow initWithWindowScene:](&v12, sel_initWithWindowScene_, a3);
  v4 = v3;
  if (v3)
  {
    -[UIWindow setWindowLevel:](v3, "setWindowLevel:", 10000.0);
    -[UIView setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
    v5 = [UILabel alloc];
    v6 = -[UILabel initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    sceneIdentifierLabel = v4->_sceneIdentifierLabel;
    v4->_sceneIdentifierLabel = (UILabel *)v6;

    objc_msgSend(off_1E167A828, "monospacedSystemFontOfSize:weight:", 14.0, *(double *)off_1E167DC68);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_sceneIdentifierLabel, "setFont:", v8);

    +[UIColor blackColor](UIColor, "blackColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v4->_sceneIdentifierLabel, "setBackgroundColor:", v9);

    +[UIColor whiteColor](UIColor, "whiteColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v4->_sceneIdentifierLabel, "setTextColor:", v10);

    -[UIView addSubview:](v4, "addSubview:", v4->_sceneIdentifierLabel);
    -[_UIDebugIdentifierWindow _updateSceneIdentifierLabel](v4, "_updateSceneIdentifierLabel");
  }
  return v4;
}

- (void)_updateSceneIdentifierLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  double v9;
  double v10;
  id v11;

  -[UIWindow windowScene](self, "windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_FBSScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identityToken");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "stringRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("-"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      v8 = v7;
    else
      v8 = CFSTR("(nil)");

  }
  else
  {
    v8 = CFSTR("(nil)");
  }
  -[UILabel setText:](self->_sceneIdentifierLabel, "setText:", v8);
  -[UIView sizeToFit](self->_sceneIdentifierLabel, "sizeToFit");
  -[UIView frame](self->_sceneIdentifierLabel, "frame");
  v10 = v9;
  -[UIView frame](self->_sceneIdentifierLabel, "frame");
  -[UILabel setFrame:](self->_sceneIdentifierLabel, "setFrame:", 10.0, 10.0, v10);

}

- (BOOL)canBecomeKeyWindow
{
  return 0;
}

- (BOOL)_ignoresHitTest
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneIdentifierLabel, 0);
}

@end
