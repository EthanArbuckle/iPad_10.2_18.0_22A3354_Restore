@implementation NavUserDecisionButtonFactory

+ (id)cancelButton
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  UIImage *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BackgroundColorButton buttonWithType:](BackgroundColorButton, "buttonWithType:", 1));
  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "titleLabel"));
  objc_msgSend(v3, "setTextAlignment:", 1);

  objc_msgSend(v2, "setClipsToBounds:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "layer"));
  objc_msgSend(v4, "setCornerRadius:", 10.0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "titleLabel"));
  objc_msgSend(v5, "setAdjustsFontSizeToFitWidth:", 1);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "titleLabel"));
  objc_msgSend(v6, "setMinimumScaleFactor:", 0.5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_boldSystemFontWithFixedSize:](UIFont, "_maps_boldSystemFontWithFixedSize:", 22.0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "titleLabel"));
  objc_msgSend(v8, "setFont:", v7);

  objc_msgSend(v2, "setAccessibilityIdentifier:", CFSTR("CancelButton"));
  v9 = objc_opt_new(UIImage);
  objc_msgSend(v2, "setBackgroundImage:forState:", v9, 0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "theme"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fadedGrayButtonTitleColor:", 0));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fadedGrayButtonTitleColor:", 1));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fadedGrayButtonBackgroundColor:", 0));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fadedGrayButtonBackgroundColor:", 1));
  objc_msgSend(v2, "setTitleColor:forState:", v11, 0);
  objc_msgSend(v2, "setTitleColor:forState:", v12, 1);
  objc_msgSend(v2, "setBackgroundColor:forState:", v13, 0);
  objc_msgSend(v2, "setBackgroundColor:forState:", v14, 1);

  return v2;
}

+ (id)confirmButton
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MapsProgressButton buttonWithType:](MapsProgressButton, "buttonWithType:", 1));
  objc_msgSend(v2, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "titleLabel"));
  objc_msgSend(v3, "setTextAlignment:", 1);

  objc_msgSend(v2, "setClipsToBounds:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "layer"));
  objc_msgSend(v4, "setCornerRadius:", 10.0);

  objc_msgSend(v2, "setFillStyle:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "titleLabel"));
  objc_msgSend(v5, "setAdjustsFontSizeToFitWidth:", 1);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "titleLabel"));
  objc_msgSend(v6, "setMinimumScaleFactor:", 0.5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _maps_boldSystemFontWithFixedSize:](UIFont, "_maps_boldSystemFontWithFixedSize:", 22.0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "titleLabel"));
  objc_msgSend(v8, "setFont:", v7);

  objc_msgSend(v2, "setAccessibilityIdentifier:", CFSTR("ConfirmButton"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  objc_msgSend(v2, "setTitleColor:forState:", v9, 0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "theme"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "blueButtonTitleColor:", 0));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "blueButtonTitleColor:", 1));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "blueButtonBackgroundColor:", 0));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "blueButtonBackgroundColor:", 1));
  objc_msgSend(v2, "setTitleColor:forState:", v11, 0);
  objc_msgSend(v2, "setTitleColor:forState:", v12, 1);
  objc_msgSend(v2, "setBackgroundColor:forState:", v13, 0);
  objc_msgSend(v2, "setBackgroundColor:forState:", v14, 1);

  return v2;
}

@end
