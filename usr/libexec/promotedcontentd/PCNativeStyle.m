@implementation PCNativeStyle

- (id)initWithStyle:(id)a3
{
  id v4;
  PCNativeStyle *v5;
  PCNativeStyle *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id v21;

  v4 = a3;
  v5 = -[PCNativeStyle init](self, "init");
  v6 = v5;
  if (v4 && v5)
  {
    v7 = objc_alloc((Class)PCNativeColor);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "backgroundColor"));
    v9 = objc_msgSend(v7, "initWithColor:", v8);
    -[PCNativeStyle setBackgroundColor:](v6, "setBackgroundColor:", v9);

    v10 = objc_alloc((Class)PCNativeBorderStyle);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "borderStyle"));
    v12 = objc_msgSend(v10, "initWithBorderStyle:", v11);
    -[PCNativeStyle setBorderStyle:](v6, "setBorderStyle:", v12);

    v13 = objc_alloc((Class)PCNativeButtonStyle);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "buttonStyle"));
    v15 = objc_msgSend(v13, "initWithButtonStyle:", v14);
    -[PCNativeStyle setButtonStyle:](v6, "setButtonStyle:", v15);

    v16 = objc_alloc((Class)PCNativeShadowStyle);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "shadowStyle"));
    v18 = objc_msgSend(v16, "initWithShadowStyle:", v17);
    -[PCNativeStyle setShadowStyle:](v6, "setShadowStyle:", v18);

    v19 = objc_alloc((Class)PCNativeColor);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "textColor"));
    v21 = objc_msgSend(v19, "initWithColor:", v20);
    -[PCNativeStyle setTextColor:](v6, "setTextColor:", v21);

  }
  return v6;
}

@end
