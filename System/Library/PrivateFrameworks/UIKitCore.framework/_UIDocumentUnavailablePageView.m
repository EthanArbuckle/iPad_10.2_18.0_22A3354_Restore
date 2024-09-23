@implementation _UIDocumentUnavailablePageView

- (_UIDocumentUnavailablePageView)initWithFrame:(CGRect)a3
{
  _UIDocumentUnavailablePageView *v3;
  _UIDocumentUnavailablePageView *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)_UIDocumentUnavailablePageView;
  v3 = -[UIView initWithFrame:](&v18, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = *MEMORY[0x1E0CD2A68];
    -[UIView layer](v3, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setCornerCurve:", v5);

    -[UIView layer](v4, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCornerRadius:", 13.0);

    -[UIView layer](v4, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v9) = 1028443341;
    objc_msgSend(v8, "setShadowOpacity:", v9);

    -[UIView layer](v4, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setShadowRadius:", 20.0);

    -[UIView layer](v4, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setShadowOffset:", 0.0, 4.0);

    +[UIColor blackColor](UIColor, "blackColor");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v13 = objc_msgSend(v12, "CGColor");
    -[UIView layer](v4, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setShadowColor:", v13);

    +[UIColor tertiarySystemBackgroundColor](UIColor, "tertiarySystemBackgroundColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "colorWithAlphaComponent:", 0.8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](v4, "setBackgroundColor:", v16);

    -[UIView setMaximumContentSizeCategory:](v4, "setMaximumContentSizeCategory:", CFSTR("UICTContentSizeCategoryAccessibilityL"));
  }
  return v4;
}

@end
