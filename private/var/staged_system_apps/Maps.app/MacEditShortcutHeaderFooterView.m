@implementation MacEditShortcutHeaderFooterView

- (MacEditShortcutHeaderFooterView)initWithTitle:(id)a3 reuseIdentifier:(id)a4
{
  id v5;
  MacEditShortcutHeaderFooterView *v6;
  MacEditShortcutHeaderFooterView *v7;
  void *v8;
  id v9;
  double y;
  double width;
  double height;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  MacEditShortcutHeaderFooterView *v24;
  id v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_super v35;
  _QWORD v36[4];

  v5 = a3;
  v35.receiver = self;
  v35.super_class = (Class)MacEditShortcutHeaderFooterView;
  v6 = -[MacEditShortcutHeaderFooterView initWithReuseIdentifier:](&v35, "initWithReuseIdentifier:", CFSTR("MacEditShortcutHeaderFooterView"));
  v7 = v6;
  if (v6)
  {
    -[MacEditShortcutHeaderFooterView setAccessibilityIdentifier:](v6, "setAccessibilityIdentifier:", CFSTR("MacEditShortcutHeaderFooterView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MacEditShortcutHeaderFooterView contentView](v7, "contentView"));
    v9 = objc_alloc((Class)UIView);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v13 = objc_msgSend(v9, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    -[MacEditShortcutHeaderFooterView setBackgroundView:](v7, "setBackgroundView:", v13);

    v14 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v14, "setAccessibilityIdentifier:", CFSTR("MacEditShortcutHeaderFooterLabel"));
    objc_msgSend(v8, "addSubview:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system17Tall](UIFont, "system17Tall"));
    objc_msgSend(v14, "setFont:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    objc_msgSend(v14, "setTextColor:", v16);

    objc_msgSend(v14, "setNumberOfLines:", 0);
    objc_msgSend(v14, "setText:", v5);
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "leadingAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "leadingAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:constant:", v33, 17.0));
    v36[0] = v32;
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "trailingAnchor"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "trailingAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:constant:", v30, -17.0));
    v36[1] = v28;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "topAnchor"));
    v18 = v8;
    v29 = v8;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "topAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:constant:", v19, 14.0));
    v36[2] = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bottomAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "bottomAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:constant:", v22, -2.0));
    v36[3] = v23;
    v24 = v7;
    v25 = v5;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v36, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v26);

    v5 = v25;
    v7 = v24;

  }
  return v7;
}

@end
