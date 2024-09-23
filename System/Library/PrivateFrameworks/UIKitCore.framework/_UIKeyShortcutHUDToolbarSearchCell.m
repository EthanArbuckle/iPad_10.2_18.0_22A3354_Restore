@implementation _UIKeyShortcutHUDToolbarSearchCell

- (_UIKeyShortcutHUDToolbarSearchCell)initWithFrame:(CGRect)a3
{
  _UIKeyShortcutHUDToolbarSearchCell *v3;
  uint64_t v4;
  UIImageView *searchIconImageView;
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
  objc_super v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)_UIKeyShortcutHUDToolbarSearchCell;
  v3 = -[_UIKeyShortcutHUDCell initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_opt_new();
    searchIconImageView = v3->_searchIconImageView;
    v3->_searchIconImageView = (UIImageView *)v4;

    +[_UIKeyShortcutHUDUtilities searchIcon]();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setImage:](v3->_searchIconImageView, "setImage:", v6);

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v3->_searchIconImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView addSubview:](v3, "addSubview:", v3->_searchIconImageView);
    v7 = (void *)MEMORY[0x1E0D156E0];
    -[UIView centerXAnchor](v3->_searchIconImageView, "centerXAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerXAnchor](v3, "centerXAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v10;
    -[UIView centerYAnchor](v3->_searchIconImageView, "centerYAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView centerYAnchor](v3, "centerYAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "activateConstraints:", v14);

    -[_UIKeyShortcutHUDToolbarSearchCell defaultContentConfiguration](v3, "defaultContentConfiguration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UICollectionViewCell setContentConfiguration:](v3, "setContentConfiguration:", v15);

  }
  return v3;
}

- (UIColor)searchIconColor
{
  return -[UIView tintColor](self->_searchIconImageView, "tintColor");
}

- (void)setSearchIconColor:(id)a3
{
  -[UIView setTintColor:](self->_searchIconImageView, "setTintColor:", a3);
}

- (id)defaultContentConfiguration
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIKeyShortcutHUDToolbarSearchCell;
  -[_UIKeyShortcutHUDCell defaultContentConfiguration](&v7, sel_defaultContentConfiguration);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[_UIKeyShortcutHUDUtilities searchIconAttributedString]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAttributedText:", v3);

  +[UIColor clearColor](UIColor, "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setColor:", v4);

  objc_msgSend(v2, "setDirectionalLayoutMargins:", 0.0, 7.0, 0.0, 7.0);
  return v2;
}

- (UIImageView)searchIconImageView
{
  return self->_searchIconImageView;
}

- (void)setSearchIconImageView:(id)a3
{
  objc_storeStrong((id *)&self->_searchIconImageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchIconImageView, 0);
}

@end
