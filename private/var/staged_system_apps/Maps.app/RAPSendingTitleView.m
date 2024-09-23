@implementation RAPSendingTitleView

+ (id)localizedSendingTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Sending... [Report a Problem]"), CFSTR("localized string not found"), 0));

  return v3;
}

- (RAPSendingTitleView)initWithFrame:(CGRect)a3
{
  RAPSendingTitleView *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSDictionary *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)RAPSendingTitleView;
  v3 = -[RAPSendingTitleView initWithFrame:](&v16, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init((Class)UILabel);
    v5 = objc_msgSend((id)objc_opt_class(v3), "localizedSendingTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    objc_msgSend(v4, "setText:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 17.0));
    objc_msgSend(v4, "setFont:", v7);

    objc_msgSend(v4, "setNumberOfLines:", 1);
    objc_msgSend(v4, "setLineBreakMode:", 4);
    -[RAPSendingTitleView addSubview:](v3, "addSubview:", v4);
    v8 = objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 100);
    objc_msgSend(v8, "startAnimating");
    -[RAPSendingTitleView addSubview:](v3, "addSubview:", v8);
    v9 = _NSDictionaryOfVariableBindings(CFSTR("label, spinner"), v4, v8, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    +[UIView _maps_setDoesNotTranslateAutoresizingConstraintsForViewsDictionary:](UIView, "_maps_setDoesNotTranslateAutoresizingConstraintsForViewsDictionary:", v10);
    v11 = objc_alloc_init((Class)NSMutableArray);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(>=0)-[spinner]-(>=0)-|"), 0, 0, v10));
    objc_msgSend(v11, "addObjectsFromArray:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(>=0)-[label]-(>=0)-|"), 0, 0, v10));
    objc_msgSend(v11, "addObjectsFromArray:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[spinner]-[label]|"), 0, 0, v10));
    objc_msgSend(v11, "addObjectsFromArray:", v14);

    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v11);
  }
  return v3;
}

@end
