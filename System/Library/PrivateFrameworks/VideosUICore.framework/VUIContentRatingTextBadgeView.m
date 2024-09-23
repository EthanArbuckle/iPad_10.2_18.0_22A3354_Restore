@implementation VUIContentRatingTextBadgeView

- (VUIContentRatingTextBadgeView)initWithBaselineOffsetFromBottom:(double)a3
{
  VUIContentRatingTextBadgeView *v4;
  UILayoutGuide *v5;
  UILayoutGuide *contentGuide;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v4 = -[VUIContentRatingTextBadgeView initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v4)
  {
    v5 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E0CEA710]);
    contentGuide = v4->_contentGuide;
    v4->_contentGuide = v5;

    -[VUIContentRatingTextBadgeView addLayoutGuide:](v4, "addLayoutGuide:", v4->_contentGuide);
    -[UILayoutGuide bottomAnchor](v4->_contentGuide, "bottomAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIContentRatingTextBadgeView bottomAnchor](v4, "bottomAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "constraintEqualToAnchor:constant:", v8, -a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setActive:", 1);

    -[UILayoutGuide topAnchor](v4->_contentGuide, "topAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIContentRatingTextBadgeView topAnchor](v4, "topAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setActive:", 1);

    -[UILayoutGuide leadingAnchor](v4->_contentGuide, "leadingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIContentRatingTextBadgeView leadingAnchor](v4, "leadingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setActive:", 1);

    -[UILayoutGuide trailingAnchor](v4->_contentGuide, "trailingAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUIContentRatingTextBadgeView trailingAnchor](v4, "trailingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "constraintEqualToAnchor:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setActive:", 1);

  }
  return v4;
}

- (VUIContentRatingTextBadgeView)initWithFrame:(CGRect)a3
{
  VUIContentRatingTextBadgeView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VUIContentRatingTextBadgeView;
  v3 = -[VUIContentRatingTextBadgeView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setVuiBackgroundColor:](v3, "setVuiBackgroundColor:", v4);

  }
  return v3;
}

- (NSString)contentRatingText
{
  void *v2;
  void *v3;

  -[VUIContentRatingTextBadgeView contentRatingAttributedText](self, "contentRatingAttributedText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setContentRatingAttributedText:(id)a3
{
  NSAttributedString *v4;
  NSAttributedString *contentRatingAttributedText;

  if (self->_contentRatingAttributedText != a3)
  {
    v4 = (NSAttributedString *)objc_msgSend(a3, "copy");
    contentRatingAttributedText = self->_contentRatingAttributedText;
    self->_contentRatingAttributedText = v4;

    -[VUIContentRatingTextBadgeView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[UIView vui_setNeedsLayout](self, "vui_setNeedsLayout");
  }
}

+ (id)_badgeImageWithAttributedRatingText:(id)a3 andColor:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  CGFloat v13;
  void *v14;
  void *v15;
  CGSize v17;

  v5 = a3;
  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(a1, "_attributedRatingTextForText:color:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_badgeSizeForAttributedRatingText:", v6);
    v8 = v7;
    v10 = v9;
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "scale");
    v13 = v12;
    v17.width = v8;
    v17.height = v10;
    UIGraphicsBeginImageContextWithOptions(v17, 0, v13);

    objc_msgSend(a1, "_drawBadgeWithAttributedRatingText:inContext:rect:color:", v6, UIGraphicsGetCurrentContext(), 0, 0.0, 0.0, v8, v10);
    UIGraphicsGetImageFromCurrentImageContext();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "imageWithRenderingMode:", 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    UIGraphicsEndImageContext();
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)drawRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  CGContext *CurrentContext;
  void *v9;
  void *v10;
  void *v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  v9 = (void *)objc_opt_class();
  -[VUIContentRatingTextBadgeView contentRatingAttributedText](self, "contentRatingAttributedText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIContentRatingTextBadgeView tintColor](self, "tintColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_drawBadgeWithAttributedRatingText:inContext:rect:color:", v10, CurrentContext, v11, x, y, width, height);

  CGContextRestoreGState(CurrentContext);
}

- (id)firstBaselineAnchor
{
  void *v3;
  void *v4;
  void *v5;

  -[VUIContentRatingTextBadgeView contentGuide](self, "contentGuide");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = self;
  objc_msgSend(v3, "bottomAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)tintColorDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VUIContentRatingTextBadgeView;
  -[VUIContentRatingTextBadgeView tintColorDidChange](&v4, sel_tintColorDidChange);
  -[VUIContentRatingTextBadgeView contentRatingText](self, "contentRatingText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIContentRatingTextBadgeView _updateContentRatingAttributedText:](self, "_updateContentRatingAttributedText:", v3);

  -[VUIContentRatingTextBadgeView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)_updateContentRatingAttributedText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[VUIContentRatingTextBadgeView tintColor](self, "tintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_attributedRatingTextForText:color:", v4, v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[VUIContentRatingTextBadgeView setContentRatingAttributedText:](self, "setContentRatingAttributedText:", v7);
}

- (CGSize)_intrinsicContentSize
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  v3 = (void *)objc_opt_class();
  -[VUIContentRatingTextBadgeView contentRatingAttributedText](self, "contentRatingAttributedText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_badgeSizeForAttributedRatingText:", v4);
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

+ (id)_attributedRatingTextForText:(id)a3 color:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "length"))
  {
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:weight:", 18.0, 0.4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA238], "defaultParagraphStyle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    objc_msgSend(v9, "setLineBreakMode:", 4);
    objc_msgSend(v9, "setAlignment:", 1);
    v10 = *MEMORY[0x1E0CEA098];
    v14[0] = *MEMORY[0x1E0CEA0A0];
    v14[1] = v10;
    v15[0] = v6;
    v15[1] = v7;
    v14[2] = *MEMORY[0x1E0CEA0D0];
    v15[2] = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v5, v11);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (CGSize)_badgeSizeForAttributedRatingText:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGSize result;
  CGRect v23;
  CGRect v24;

  v4 = a3;
  objc_msgSend(v4, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    objc_msgSend(a1, "_paddingEdgeInsets");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "vui_bounds");
    v17 = v16;

    objc_msgSend(v4, "boundingRectWithSize:options:context:", 2, 0, v17, 0.0);
    v24 = CGRectIntegral(v23);
    v18 = v14 + v10 + v24.size.width;
    v19 = v12 + v8 + v24.size.height;
  }
  else
  {
    v18 = *MEMORY[0x1E0C9D820];
    v19 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }

  v20 = v18;
  v21 = v19;
  result.height = v21;
  result.width = v20;
  return result;
}

+ (void)_drawBadgeWithAttributedRatingText:(id)a3 inContext:(CGContext *)a4 rect:(CGRect)a5 color:(id)a6
{
  double height;
  double width;
  double y;
  double x;
  id v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  id v17;
  id v18;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v17 = a6;
  v12 = a3;
  objc_msgSend(a1, "_paddingEdgeInsets");
  objc_msgSend(v12, "drawAtPoint:", x + v13, y + v14);

  objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithRoundedRect:cornerRadius:", x + 1.0, y + 1.0, width + -2.0, height + -2.0, 6.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v17;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "blackColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v18 = v16;
  objc_msgSend(v16, "set");
  objc_msgSend(v15, "setLineWidth:", 2.0);
  objc_msgSend(v15, "stroke");

}

+ (UIEdgeInsets)_paddingEdgeInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 2.0;
  v3 = 4.0;
  v4 = 2.0;
  v5 = 4.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (NSAttributedString)contentRatingAttributedText
{
  return self->_contentRatingAttributedText;
}

- (UILayoutGuide)contentGuide
{
  return self->_contentGuide;
}

- (void)setContentGuide:(id)a3
{
  objc_storeStrong((id *)&self->_contentGuide, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentGuide, 0);
  objc_storeStrong((id *)&self->_contentRatingAttributedText, 0);
}

@end
