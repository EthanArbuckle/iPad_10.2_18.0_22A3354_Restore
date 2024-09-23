@implementation EditShortcutMeCardCell

- (EditShortcutMeCardCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  EditShortcutMeCardCell *v4;
  EditShortcutMeCardCell *v5;
  void *v6;
  UILabel *v7;
  UILabel *label;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  MapsThemeButton *button;
  MapsThemeButton *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  objc_super v52;
  _QWORD v53[7];
  _QWORD v54[4];

  v52.receiver = self;
  v52.super_class = (Class)EditShortcutMeCardCell;
  v4 = -[EditShortcutMeCardCell initWithStyle:reuseIdentifier:](&v52, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    -[EditShortcutMeCardCell setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", CFSTR("EditShortcutMeCardCell"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[EditShortcutMeCardCell contentView](v5, "contentView"));
    v7 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    label = v5->_label;
    v5->_label = v7;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[UILabel setTextColor:](v5->_label, "setTextColor:", v9);

    -[UILabel setNumberOfLines:](v5->_label, "setNumberOfLines:", 0);
    -[UILabel setAccessibilityIdentifier:](v5->_label, "setAccessibilityIdentifier:", CFSTR("EditShortcutMeCardLabel"));
    objc_msgSend(v6, "addSubview:", v5->_label);
    if (sub_1002A8AA0(v5) == 5)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system17Tall](UIFont, "system17Tall"));
      -[UILabel setFont:](v5->_label, "setFont:", v10);

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v5->_label, "topAnchor"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, 0.0));
      v54[0] = v13;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v5->_label, "leadingAnchor"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, 17.0));
      v54[1] = v16;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v5->_label, "bottomAnchor"));
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bottomAnchor"));
      v51 = v17;
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:constant:", v50, 0.0));
      v54[2] = v49;
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v5->_label, "trailingAnchor"));
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintLessThanOrEqualToAnchor:constant:", -17.0));
      v54[3] = v47;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v54, 4));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v19);
    }
    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system17](UIFont, "system17"));
      -[UILabel setFont:](v5->_label, "setFont:", v20);

      v21 = objc_claimAutoreleasedReturnValue(+[MapsThemeButton buttonWithType:](MapsThemeButton, "buttonWithType:", 0));
      button = v5->_button;
      v5->_button = (MapsThemeButton *)v21;

      -[MapsThemeButton setTranslatesAutoresizingMaskIntoConstraints:](v5->_button, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      v23 = v5->_button;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("[Shortcut] Contact Card"), CFSTR("localized string not found"), 0));
      -[MapsThemeButton setTitle:forState:](v23, "setTitle:forState:", v25, 0);

      -[MapsThemeButton setTitleColorProvider:](v5->_button, "setTitleColorProvider:", &stru_1011B47B8);
      -[MapsThemeButton addTarget:action:forControlEvents:](v5->_button, "addTarget:action:forControlEvents:", v5, "_buttonTapped:", 64);
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system17](UIFont, "system17"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeButton titleLabel](v5->_button, "titleLabel"));
      objc_msgSend(v27, "setFont:", v26);

      -[MapsThemeButton setAccessibilityIdentifier:](v5->_button, "setAccessibilityIdentifier:", CFSTR("EditShortcutMeCardButton"));
      objc_msgSend(v6, "addSubview:", v5->_button);
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v5->_label, "leadingAnchor"));
      v45 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
      v44 = objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:constant:", v45, 16.0));
      v53[0] = v44;
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v5->_label, "trailingAnchor"));
      v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
      v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:constant:", v41, -16.0));
      v53[1] = v43;
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeButton leadingAnchor](v5->_button, "leadingAnchor"));
      v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
      v51 = v28;
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:constant:", v50, 16.0));
      v53[2] = v49;
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeButton trailingAnchor](v5->_button, "trailingAnchor"));
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintLessThanOrEqualToAnchor:constant:", -16.0));
      v53[3] = v47;
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v5->_label, "topAnchor"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v40));
      v53[4] = v38;
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeButton topAnchor](v5->_button, "topAnchor"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v5->_label, "bottomAnchor"));
      v31 = v6;
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v30));
      v53[5] = v32;
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeButton bottomAnchor](v5->_button, "bottomAnchor"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "bottomAnchor"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v34));
      v53[6] = v35;
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v53, 7));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v36);

      v15 = (void *)v41;
      v13 = (void *)v44;

      v18 = v39;
      v12 = (void *)v45;

      v6 = v31;
      v14 = v42;

      v11 = v46;
      v16 = (void *)v43;

    }
  }
  return v5;
}

- (void)setMeCardString:(id)a3
{
  id v4;
  unsigned __int8 v5;
  id v6;

  v6 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[UILabel text](self->_label, "text"));
  if (v4 == v6)
  {

  }
  else
  {
    v5 = objc_msgSend(v6, "isEqual:", v4);

    if ((v5 & 1) == 0)
      -[UILabel setText:](self->_label, "setText:", v6);
  }

}

- (NSString)meCardString
{
  return -[UILabel text](self->_label, "text");
}

- (void)_buttonTapped:(id)a3
{
  void (**openMeCardHandler)(void);

  openMeCardHandler = (void (**)(void))self->_openMeCardHandler;
  if (openMeCardHandler)
    openMeCardHandler[2]();
}

- (id)openMeCardHandler
{
  return self->_openMeCardHandler;
}

- (void)setOpenMeCardHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_openMeCardHandler, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
