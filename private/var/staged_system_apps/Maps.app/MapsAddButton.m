@implementation MapsAddButton

- (MapsAddButton)init
{
  void *v3;
  void *v4;
  MapsAddButton *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Create"), CFSTR("localized string not found"), 0));
  v5 = -[MapsAddButton initWithTitle:](self, "initWithTitle:", v4);

  return v5;
}

- (MapsAddButton)initWithTitle:(id)a3
{
  id v4;
  MapsAddButton *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;
  _QWORD v16[2];

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MapsAddButton;
  v5 = -[MapsAddButton initWithFrame:](&v15, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration _maps_pillButtonConfigurationWithImage:scalingImageForDynamicText:scalingTitleForDynamicText:](UIButtonConfiguration, "_maps_pillButtonConfigurationWithImage:scalingImageForDynamicText:scalingTitleForDynamicText:", 1, 0, 0));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("plus")));
    objc_msgSend(v6, "setImage:", v7);
    -[MapsAddButton setConfiguration:](v5, "setConfiguration:", v6);
    -[MapsAddButton setImage:forState:](v5, "setImage:forState:", v7, 0);
    -[MapsAddButton setTitle:forState:](v5, "setTitle:forState:", v4, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAddButton heightAnchor](v5, "heightAnchor"));
    LODWORD(v9) = 1144766464;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToConstant:priority:", 32.0, v9));
    v16[0] = v10;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MapsAddButton heightAnchor](v5, "heightAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintGreaterThanOrEqualToConstant:", 32.0));
    v16[1] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 2));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v13);

  }
  return v5;
}

@end
