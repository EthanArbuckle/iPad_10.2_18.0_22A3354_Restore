@implementation DOMElement(UIWebInteraction)

- (id)tapHighlightColor
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  float v7;
  double v8;
  void *v9;
  float v10;
  double v11;
  void *v12;
  float v13;
  double v14;
  void *v15;
  float v16;
  void *v17;
  objc_super v19;

  objc_msgSend(a1, "ownerDocument");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getComputedStyle:pseudoElement:", a1, &stru_1E16EDF20);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getPropertyCSSValue:", CFSTR("-webkit-tap-highlight-color"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getRGBColorValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "red");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "getFloatValue:", 1);
    v8 = v7 / 255.0;
    objc_msgSend(v5, "green");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "getFloatValue:", 1);
    v11 = v10 / 255.0;
    objc_msgSend(v5, "blue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "getFloatValue:", 1);
    v14 = v13 / 255.0;
    objc_msgSend(v5, "alpha");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "getFloatValue:", 1);
    +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", v8, v11, v14, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19.receiver = a1;
    v19.super_class = (Class)&off_1EE08A1A0;
    objc_msgSendSuper2(&v19, sel_tapHighlightColor);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (uint64_t)touchCalloutEnabled
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a1, "ownerDocument");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getComputedStyle:pseudoElement:", a1, &stru_1E16EDF20);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getPropertyCSSValue:", CFSTR("-webkit-touch-callout"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getStringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("none")) ^ 1;
  else
    v6 = 1;

  return v6;
}

@end
