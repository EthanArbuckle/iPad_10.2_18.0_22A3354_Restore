@implementation Car3DButton

- (Car3DButton)initWithFrame:(CGRect)a3
{
  Car3DButton *v3;
  uint64_t v4;
  UIImage *image2D;
  uint64_t v6;
  UIImage *image3D;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)Car3DButton;
  v3 = -[CarFocusableImageButton initWithFrame:](&v9, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(+[UIImage _mapsCar_systemImageNamed:textStyle:](UIImage, "_mapsCar_systemImageNamed:textStyle:", CFSTR("view.2d"), UIFontTextStyleSubheadline));
    image2D = v3->_image2D;
    v3->_image2D = (UIImage *)v4;

    v6 = objc_claimAutoreleasedReturnValue(+[UIImage _mapsCar_systemImageNamed:textStyle:](UIImage, "_mapsCar_systemImageNamed:textStyle:", CFSTR("view.3d"), UIFontTextStyleSubheadline));
    image3D = v3->_image3D;
    v3->_image3D = (UIImage *)v6;

    -[CarFocusableBlurControl setCastsShadow:](v3, "setCastsShadow:", 0);
    -[Car3DButton setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("Car3DButton.Unspecified"));
  }
  return v3;
}

- (void)setButtonState:(unint64_t)a3
{
  UIImage *v4;
  void *v5;
  void *v6;
  void **v7;
  void *v8;
  void *v9;
  void *v10;

  if (self->_buttonState != a3)
  {
    self->_buttonState = a3;
    if (a3)
    {
      if (a3 == 1)
      {
        v4 = self->_image2D;
        -[Car3DButton setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", CFSTR("Car3DButton.2D"));
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("CarPlay_2D"), CFSTR("localized string not found"), 0));
        v9 = v6;
        v7 = &v9;
        goto LABEL_9;
      }
      if (a3 == 2)
      {
        v4 = self->_image3D;
        -[Car3DButton setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", CFSTR("Car3DButton.3D"));
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("CarPlay_3D"), CFSTR("localized string not found"), 0));
        v10 = v6;
        v7 = &v10;
LABEL_9:
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v7, 1));
        -[Car3DButton setAccessibilityUserInputLabels:](self, "setAccessibilityUserInputLabels:", v8);

        goto LABEL_10;
      }
    }
    else
    {
      -[Car3DButton setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", CFSTR("Car3DButton.Unspecified"));
      -[Car3DButton setAccessibilityUserInputLabels:](self, "setAccessibilityUserInputLabels:", &__NSArray0__struct);
    }
    v4 = 0;
LABEL_10:
    -[CarFocusableImageButton setImage:](self, "setImage:", v4);

  }
}

- (unint64_t)buttonState
{
  return self->_buttonState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image3D, 0);
  objc_storeStrong((id *)&self->_image2D, 0);
}

@end
