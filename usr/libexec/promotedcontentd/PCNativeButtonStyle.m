@implementation PCNativeButtonStyle

- (id)initWithButtonStyle:(id)a3
{
  id v4;
  PCNativeButtonStyle *v5;
  PCNativeButtonStyle *v6;
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
  float v19;
  id v20;
  void *v21;
  id v22;

  v4 = a3;
  v5 = -[PCNativeButtonStyle init](self, "init");
  v6 = v5;
  if (v4 && v5)
  {
    v7 = objc_alloc((Class)PCNativeColor);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "color"));
    v9 = objc_msgSend(v7, "initWithColor:", v8);
    -[PCNativeButtonStyle setColor:](v6, "setColor:", v9);

    v10 = objc_alloc((Class)PCNativeColor);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "highlightedColor"));
    v12 = objc_msgSend(v10, "initWithColor:", v11);
    -[PCNativeButtonStyle setHighlightColor:](v6, "setHighlightColor:", v12);

    v13 = objc_alloc((Class)PCNativeColor);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "disabledColor"));
    v15 = objc_msgSend(v13, "initWithColor:", v14);
    -[PCNativeButtonStyle setDisabledColor:](v6, "setDisabledColor:", v15);

    v16 = objc_alloc((Class)PCNativeColor);
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "textColor"));
    v18 = objc_msgSend(v16, "initWithColor:", v17);
    -[PCNativeButtonStyle setTextColor:](v6, "setTextColor:", v18);

    objc_msgSend(v4, "cornerRadius");
    -[PCNativeButtonStyle setCornerRadius:](v6, "setCornerRadius:", v19);
    v20 = objc_alloc((Class)PCNativeBorderStyle);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "borderStyle"));
    v22 = objc_msgSend(v20, "initWithBorderStyle:", v21);
    -[PCNativeButtonStyle setBorderStyle:](v6, "setBorderStyle:", v22);

  }
  return v6;
}

@end
