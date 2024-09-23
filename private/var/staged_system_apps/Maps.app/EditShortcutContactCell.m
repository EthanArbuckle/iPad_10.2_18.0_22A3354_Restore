@implementation EditShortcutContactCell

- (EditShortcutContactCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  EditShortcutContactCell *v4;
  EditShortcutContactCell *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  double y;
  double width;
  double height;
  UIImageView *v15;
  UIImageView *imageView;
  UIImageView *v17;
  UILabel *v18;
  UILabel *label;
  UILabel *v20;
  void *v21;
  void *v22;
  void *v23;
  UILabel *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  UILabel *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  UIImageView *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  objc_super v56;
  _QWORD v57[9];

  v56.receiver = self;
  v56.super_class = (Class)EditShortcutContactCell;
  v4 = -[EditShortcutContactCell initWithStyle:reuseIdentifier:](&v56, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    -[EditShortcutContactCell setAccessibilityIdentifier:](v4, "setAccessibilityIdentifier:", CFSTR("EditShortcutContactCell"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[EditShortcutContactCell contentView](v5, "contentView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor"));
    v55 = v7;
    objc_msgSend(v7, "setTintColor:", v8);

    objc_msgSend(v7, "setFrame:", 0.0, 0.0, 30.0, 30.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("xmark.circle.fill")));
    objc_msgSend(v7, "setImage:forState:", v9, 0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:", 5, 17.0));
    objc_msgSend(v7, "setPreferredSymbolConfiguration:forImageInState:", v10, 0);

    objc_msgSend(v7, "addTarget:action:forControlEvents:", v5, "_buttonAction:", 64);
    objc_msgSend(v7, "setAccessibilityIdentifier:", CFSTR("EditShortcutContactButton"));
    -[EditShortcutContactCell setAccessoryView:](v5, "setAccessoryView:", v7);
    v11 = objc_alloc((Class)UIImageView);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v15 = (UIImageView *)objc_msgSend(v11, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView _setCornerRadius:](v15, "_setCornerRadius:", 15.0);
    -[UIImageView setClipsToBounds:](v15, "setClipsToBounds:", 1);
    -[UIImageView setAccessibilityIdentifier:](v15, "setAccessibilityIdentifier:", CFSTR("EditShortcutContactImage"));
    objc_msgSend(v6, "addSubview:", v15);
    imageView = v5->_imageView;
    v5->_imageView = v15;
    v17 = v15;

    v18 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v18, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setAccessibilityIdentifier:](v18, "setAccessibilityIdentifier:", CFSTR("EditShortcutContactLabel"));
    objc_msgSend(v6, "addSubview:", v18);
    label = v5->_label;
    v5->_label = v18;
    v20 = v18;

    v54 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](v17, "heightAnchor"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintEqualToConstant:", 30.0));
    v57[0] = v53;
    v52 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](v17, "widthAnchor"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToConstant:", 30.0));
    v57[1] = v51;
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](v17, "centerYAnchor"));
    v21 = v6;
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "centerYAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "constraintEqualToAnchor:", v48));
    v57[2] = v47;
    v50 = v17;
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](v17, "leadingAnchor"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "leadingAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:constant:", v45, 16.0));
    v57[3] = v44;
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v20, "leadingAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](v17, "trailingAnchor"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:constant:", v40, 10.0));
    v57[4] = v39;
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v20, "trailingAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:constant:", v37, -16.0));
    v57[5] = v36;
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerYAnchor](v20, "centerYAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "centerYAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:", v22));
    v57[6] = v23;
    v24 = v20;
    v42 = v20;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v20, "topAnchor"));
    v26 = v21;
    v43 = v21;
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "topAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:constant:", v27, 15.0));
    v57[7] = v28;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v24, "bottomAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "bottomAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:constant:", v30, -15.0));
    v57[8] = v31;
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v57, 9));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v32);

    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v33, "addObserver:selector:name:object:", v5, "contentSizeCategoryDidChange:", UIContentSizeCategoryDidChangeNotification, 0);

  }
  return v5;
}

- (void)_buttonAction:(id)a3
{
  void *v4;
  void (**v5)(void);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[EditShortcutContactCell action](self, "action", a3));

  if (v4)
  {
    v5 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[EditShortcutContactCell action](self, "action"));
    v5[2]();

  }
}

- (void)setContactValue:(id)a3
{
  id v5;
  UIImageView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id *v12;
  UIImageView *v13;
  void *v14;
  double v15;
  double v16;
  UIImageView *v17;
  _QWORD v18[4];
  UIImageView *v19;
  _QWORD v20[4];
  UIImageView *v21;

  v5 = a3;
  objc_storeStrong((id *)&self->_contactValue, a3);
  v6 = self->_imageView;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contact"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contact"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactFormatter stringFromContact:style:](CNContactFormatter, "stringFromContact:style:", v8, 0));
    -[UILabel setText:](self->_label, "setText:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MapsUIImageCache sharedCache](MapsUIImageCache, "sharedCache"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "contact"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1007B927C;
    v20[3] = &unk_1011BAA70;
    v12 = (id *)&v21;
    v21 = v6;
    v13 = v6;
    objc_msgSend(v10, "getImageForContact:size:completion:", v11, v20, 30.0);
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringValue"));
    -[UILabel setText:](self->_label, "setText:", v14);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[EditShortcutContactCell window](self, "window"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "screen"));
    objc_msgSend(v11, "scale");
    v16 = v15;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1007B9288;
    v18[3] = &unk_1011BAA70;
    v12 = (id *)&v19;
    v19 = v6;
    v17 = v6;
    +[CNContact _maps_imageForNoContactWithDiameter:scale:completion:](CNContact, "_maps_imageForNoContactWithDiameter:scale:completion:", v18, 30.0, v16);
  }

  -[EditShortcutContactCell _updateFonts](self, "_updateFonts");
}

- (void)_updateFonts
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system17](UIFont, "system17"));
  -[UILabel setFont:](self->_label, "setFont:", v3);

  -[UILabel setNumberOfLines:](self->_label, "setNumberOfLines:", +[UIFont accessibilityTextEnabled](UIFont, "accessibilityTextEnabled") ^ 1);
}

- (id)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (MSPSharedTripContact)contactValue
{
  return self->_contactValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactValue, 0);
  objc_storeStrong(&self->_action, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end
