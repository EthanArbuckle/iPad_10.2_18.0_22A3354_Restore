@implementation _UIKeyShortcutHUDShortcutInputAccessoryView

- (_UIKeyShortcutHUDShortcutInputAccessoryView)initWithFrame:(CGRect)a3
{
  _UIKeyShortcutHUDShortcutInputAccessoryView *v3;
  _UIKeyShortcutHUDShortcutInputAccessoryView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIKeyShortcutHUDShortcutInputAccessoryView;
  v3 = -[UIView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[_UIKeyShortcutHUDShortcutInputAccessoryView _commonInit](v3, "_commonInit");
  return v4;
}

- (void)_commonInit
{
  _UIKeyShortcutHUDShortcutInputView *v3;
  _UIKeyShortcutHUDShortcutInputView *shortcutInputView;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v3 = (_UIKeyShortcutHUDShortcutInputView *)objc_opt_new();
  shortcutInputView = self->_shortcutInputView;
  self->_shortcutInputView = v3;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_shortcutInputView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](self, "addSubview:", self->_shortcutInputView);
  v15 = (void *)MEMORY[0x1E0D156E0];
  -[UIView leadingAnchor](self->_shortcutInputView, "leadingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self, "leadingAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyShortcutHUDMetrics currentMetrics](UIKeyShortcutHUDMetrics, "currentMetrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "minShortcutNameKeyCombinationSpacing");
  objc_msgSend(v16, "constraintEqualToAnchor:constant:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v7;
  -[UIView trailingAnchor](self->_shortcutInputView, "trailingAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v10;
  -[UIView centerYAnchor](self->_shortcutInputView, "centerYAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView centerYAnchor](self, "centerYAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "activateConstraints:", v14);

}

- (_UIKeyShortcutHUDShortcutInputView)shortcutInputView
{
  return self->_shortcutInputView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortcutInputView, 0);
}

@end
