@implementation ActionValidationController

+ (void)presentAttributedString:(id)a3 inWindow:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  double v8;
  double v9;
  MessageView *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  MessageView *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  MessageView *v28;
  _QWORD v29[4];

  v5 = a4;
  if (v5)
  {
    v6 = a3;
    v7 = objc_opt_class(EventSourceWindow);
    if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
    {
      objc_msgSend(v5, "keyboardHeight");
      v9 = v8 * -0.5;
    }
    else
    {
      v9 = -0.0;
    }
    v10 = -[MessageView initWithTitle:]([MessageView alloc], "initWithTitle:", v6);

    -[MessageView setTranslatesAutoresizingMaskIntoConstraints:](v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v5, "addSubview:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MessageView offsetConstraint](v10, "offsetConstraint"));
    objc_msgSend(v11, "setConstant:", v9);

    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MessageView topAnchor](v10, "topAnchor"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v25));
    v29[0] = v24;
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MessageView bottomAnchor](v10, "bottomAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bottomAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v22));
    v29[1] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MessageView leadingAnchor](v10, "leadingAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leadingAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v14));
    v29[2] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MessageView trailingAnchor](v10, "trailingAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v17));
    v29[3] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v19);

    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10068F098;
    v27[3] = &unk_1011BFC08;
    v28 = v10;
    v20 = v10;
    v21 = +[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, v27, 1.15000001);

  }
}

+ (void)presentString:(id)a3 withFont:(id)a4 inWindow:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  NSAttributedStringKey v14;
  id v15;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc((Class)NSAttributedString);
  v14 = NSFontAttributeName;
  v15 = v9;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v15, &v14, 1));

  v13 = objc_msgSend(v11, "initWithString:attributes:", v10, v12);
  objc_msgSend(a1, "presentAttributedString:inWindow:", v13, v8);

}

+ (void)presentDefaultValidationActionWithTitle:(id)a3 inWindow:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[UIFont system17SemiBold](UIFont, "system17SemiBold"));
  objc_msgSend(a1, "presentString:withFont:inWindow:", v7, v8, v6);

}

+ (void)presentCollectionSavedValidationActionWithName:(id)a3 inWindow:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSAttributedStringKey v20;
  void *v21;
  NSAttributedStringKey v22;
  void *v23;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc((Class)NSMutableAttributedString);
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("[Collection] Saved to %@"), CFSTR("localized string not found"), 0));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v6));
  v22 = NSFontAttributeName;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system17](UIFont, "system17"));
  v23 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1));
  v13 = objc_msgSend(v7, "initWithString:attributes:", v10, v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "string"));
  v15 = objc_msgSend(v14, "rangeOfString:", v6);
  v17 = v16;

  v20 = NSFontAttributeName;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system20Bold](UIFont, "system20Bold"));
  v21 = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
  objc_msgSend(v13, "addAttributes:range:", v19, v15, v17);

  +[ActionValidationController presentAttributedString:inWindow:](ActionValidationController, "presentAttributedString:inWindow:", v13, v5);
}

@end
