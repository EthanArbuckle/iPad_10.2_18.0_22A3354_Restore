@implementation CarDictationButton

- (CarDictationButton)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CarDictationButton *v7;
  UIButton *v8;
  UIButton *siriButton;
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
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  objc_super v26;
  _QWORD v27[4];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v26.receiver = self;
  v26.super_class = (Class)CarDictationButton;
  v7 = -[CarFocusableControl initWithFrame:](&v26, "initWithFrame:");
  if (v7)
  {
    v8 = (UIButton *)objc_msgSend(objc_alloc((Class)UIButton), "initWithFrame:", x, y, width, height);
    siriButton = v7->_siriButton;
    v7->_siriButton = v8;

    -[UIButton setAccessibilityIdentifier:](v7->_siriButton, "setAccessibilityIdentifier:", CFSTR("SiriButton"));
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v7->_siriButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIButton setContentMode:](v7->_siriButton, "setContentMode:", 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration plainButtonConfiguration](UIButtonConfiguration, "plainButtonConfiguration"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _mapsCar_privateSystemImageNamed:textStyle:scale:](UIImage, "_mapsCar_privateSystemImageNamed:textStyle:scale:", CFSTR("siri"), UIFontTextStyleTitle3, 2));
    objc_msgSend(v10, "setImage:", v11);

    objc_msgSend(v10, "setImagePadding:", 10.0);
    objc_msgSend(v10, "setImagePlacement:", 2);
    -[UIButton setConfiguration:](v7->_siriButton, "setConfiguration:", v10);
    -[CarFocusableControl addSubview:](v7, "addSubview:", v7->_siriButton);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton topAnchor](v7->_siriButton, "topAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CarDictationButton topAnchor](v7, "topAnchor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v24));
    v27[0] = v23;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton bottomAnchor](v7->_siriButton, "bottomAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CarDictationButton bottomAnchor](v7, "bottomAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v21));
    v27[1] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](v7->_siriButton, "leadingAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarDictationButton leadingAnchor](v7, "leadingAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v14));
    v27[2] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](v7->_siriButton, "trailingAnchor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarDictationButton trailingAnchor](v7, "trailingAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v17));
    v27[3] = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v27, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v19);

  }
  return v7;
}

- (void)setKeyboardDisabled:(BOOL)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[UIButton configuration](self->_siriButton, "configuration"));
  if (a3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("CarPlay_UserInputCell"), CFSTR("localized string not found"), 0));
    objc_msgSend(v7, "setTitle:", v6);

  }
  else
  {
    objc_msgSend(v7, "setTitle:", 0);
  }
  -[UIButton setConfiguration:](self->_siriButton, "setConfiguration:", v7);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriButton, 0);
}

@end
