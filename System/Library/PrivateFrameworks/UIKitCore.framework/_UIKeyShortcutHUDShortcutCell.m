@implementation _UIKeyShortcutHUDShortcutCell

- (_UIKeyShortcutHUDShortcutCell)initWithFrame:(CGRect)a3
{
  _UIKeyShortcutHUDShortcutCell *v3;
  uint64_t v4;
  _UIKeyShortcutHUDShortcutInputAccessoryView *shortcutInputAccessoryView;
  UICellAccessoryCustomView *v6;
  void *v7;
  objc_super v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9.receiver = self;
  v9.super_class = (Class)_UIKeyShortcutHUDShortcutCell;
  v3 = -[_UIKeyShortcutHUDCell initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_opt_new();
    shortcutInputAccessoryView = v3->_shortcutInputAccessoryView;
    v3->_shortcutInputAccessoryView = (_UIKeyShortcutHUDShortcutInputAccessoryView *)v4;

    v6 = -[UICellAccessoryCustomView initWithCustomView:placement:]([UICellAccessoryCustomView alloc], "initWithCustomView:placement:", v3->_shortcutInputAccessoryView, 1);
    -[UICellAccessory setReservedLayoutWidth:](v6, "setReservedLayoutWidth:", 0.0);
    v10[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewListCell setAccessories:](v3, "setAccessories:", v7);

  }
  return v3;
}

- (void)configureWithShortcut:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[_UIKeyShortcutHUDShortcutCell setShortcut:](self, "setShortcut:", v4);
  -[_UIKeyShortcutHUDCell defaultContentConfiguration](self, "defaultContentConfiguration");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "hudTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v5);

  objc_msgSend(v4, "subtitle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSecondaryText:", v6);

  -[_UIKeyShortcutHUDShortcutInputAccessoryView shortcutInputView](self->_shortcutInputAccessoryView, "shortcutInputView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setShortcut:", v4);

  -[UICollectionViewCell setContentConfiguration:](self, "setContentConfiguration:", v8);
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  double v7;
  _UIKeyShortcutHUDShortcut **p_shortcut;
  id WeakRetained;
  double v10;
  double v11;
  void *v12;
  id v13;
  double v14;
  double v15;
  id v16;
  double v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)_UIKeyShortcutHUDShortcutCell;
  -[UICollectionReusableView preferredLayoutAttributesFittingAttributes:](&v19, sel_preferredLayoutAttributesFittingAttributes_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIKeyShortcutHUDMetrics currentMetrics](UIKeyShortcutHUDMetrics, "currentMetrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "size");
  v7 = v6;
  p_shortcut = &self->_shortcut;
  WeakRetained = objc_loadWeakRetained((id *)&self->_shortcut);
  objc_msgSend(v5, "cellWidthForShortcut:", WeakRetained);
  v11 = v10;

  objc_msgSend(v4, "setSize:", v11, v7);
  if (objc_msgSend(v5, "shouldAlignShortcutModifiersAndInputInColumn"))
  {
    -[_UIKeyShortcutHUDShortcutInputAccessoryView shortcutInputView](self->_shortcutInputAccessoryView, "shortcutInputView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_loadWeakRetained((id *)p_shortcut);
    objc_msgSend(v5, "modifiersWidthForShortcut:", v13);
    v15 = v14;
    v16 = objc_loadWeakRetained((id *)p_shortcut);
    objc_msgSend(v5, "inputWidthForShortcut:", v16);
    objc_msgSend(v12, "setModifiersWidth:inputWidth:", v15, v17);

  }
  return v4;
}

- (_UIKeyShortcutHUDShortcutInputAccessoryView)shortcutInputAccessoryView
{
  return self->_shortcutInputAccessoryView;
}

- (_UIKeyShortcutHUDShortcut)shortcut
{
  return (_UIKeyShortcutHUDShortcut *)objc_loadWeakRetained((id *)&self->_shortcut);
}

- (void)setShortcut:(id)a3
{
  objc_storeWeak((id *)&self->_shortcut, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_shortcut);
  objc_storeStrong((id *)&self->_shortcutInputAccessoryView, 0);
}

@end
