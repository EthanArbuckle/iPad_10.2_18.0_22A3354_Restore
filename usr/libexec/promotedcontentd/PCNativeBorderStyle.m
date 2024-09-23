@implementation PCNativeBorderStyle

- (id)initWithBorderStyle:(id)a3
{
  id v4;
  PCNativeBorderStyle *v5;
  PCNativeBorderStyle *v6;
  id v7;
  void *v8;
  id v9;
  float v10;
  float v11;

  v4 = a3;
  v5 = -[PCNativeBorderStyle init](self, "init");
  v6 = v5;
  if (v4 && v5)
  {
    v7 = objc_alloc((Class)PCNativeColor);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "color"));
    v9 = objc_msgSend(v7, "initWithColor:", v8);
    -[PCNativeBorderStyle setColor:](v6, "setColor:", v9);

    objc_msgSend(v4, "width");
    -[PCNativeBorderStyle setWidth:](v6, "setWidth:", v10);
    objc_msgSend(v4, "cornerRadius");
    -[PCNativeBorderStyle setCornerRadius:](v6, "setCornerRadius:", v11);
  }

  return v6;
}

@end
