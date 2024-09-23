@implementation CarCameraToggleButton

- (CarCameraToggleButton)initWithFrame:(CGRect)a3
{
  CarCameraToggleButton *v3;
  uint64_t v4;
  UIImage *detailImage;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  UIImage *overviewImage;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CarCameraToggleButton;
  v3 = -[CarFocusableImageButton initWithImage:edgeInsets:](&v12, "initWithImage:edgeInsets:", 0, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(+[UIImage _mapsCar_systemImageNamed:textStyle:](UIImage, "_mapsCar_systemImageNamed:textStyle:", CFSTR("location.north.line.fill"), UIFontTextStyleCallout));
    detailImage = v3->_detailImage;
    v3->_detailImage = (UIImage *)v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "screenTraitCollection"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:inBundle:compatibleWithTraitCollection:](UIImage, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("CameraModeOverview"), 0, v7));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "imageWithRenderingMode:", 2));
    overviewImage = v3->_overviewImage;
    v3->_overviewImage = (UIImage *)v9;

    -[CarCameraToggleButton setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("CarCameraToggleButton.Unspecified"));
  }
  return v3;
}

- (void)setButtonState:(unint64_t)a3
{
  const __CFString *v5;
  void *v6;
  int *v7;
  id v8;
  id v9;

  if (self->_buttonState != a3)
  {
    self->_buttonState = a3;
    if (a3 > 2)
      v5 = CFSTR(".Unknown");
    else
      v5 = *(&off_1011C5800 + a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("CarCameraToggleButton"), "stringByAppendingString:", v5));
    -[CarCameraToggleButton setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", v6);

    if (a3 == 2)
    {
      v7 = &OBJC_IVAR___CarCameraToggleButton__detailImage;
    }
    else
    {
      if (a3 != 1)
      {
        v8 = 0;
        goto LABEL_11;
      }
      v7 = &OBJC_IVAR___CarCameraToggleButton__overviewImage;
    }
    v8 = *(id *)((char *)&self->super.super.super.super.super.super.super.isa + *v7);
LABEL_11:
    v9 = v8;
    -[CarFocusableImageButton setImage:](self, "setImage:", v8);

  }
}

- (id)accessibilityUserInputLabels
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  uint64_t v9;
  void *v10;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("CarPlay_Camera"), CFSTR("localized string not found"), 0));

  v5 = -[CarCameraToggleButton buttonState](self, "buttonState");
  if (v5 == 1)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = v6;
    v8 = CFSTR("CarPlay_Overview");
    goto LABEL_5;
  }
  if (v5 == 2)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = v6;
    v8 = CFSTR("CarPlay_Detail");
LABEL_5:
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v8, CFSTR("localized string not found"), 0));

    v4 = (void *)v9;
  }
  v12 = v4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));

  return v10;
}

- (unint64_t)buttonState
{
  return self->_buttonState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailImage, 0);
  objc_storeStrong((id *)&self->_overviewImage, 0);
}

@end
