@implementation VUITextBadge

- (VUITextBadge)initWithFrame:(CGRect)a3
{
  VUITextBadge *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VUITextBadge;
  v3 = -[VUITextBadge initWithFrame:](&v6, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUITextBadge setBackgroundColor:](v3, "setBackgroundColor:", v4);

  }
  return v3;
}

- (VUITextBadge)initWithAttributedString:(id)a3 tintColor:(id)a4 cornerRadius:(double)a5
{
  id v9;
  id v10;
  VUITextBadge *v11;
  VUITextBadge *v12;

  v9 = a3;
  v10 = a4;
  v11 = -[VUITextBadge initWithFrame:](self, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_attributedTitle, a3);
    objc_storeStrong((id *)&v12->_tintColor, a4);
    v12->_cornerRadius = a5;
  }

  return v12;
}

- (VUITextBadge)initWithTitle:(id)a3 tintColor:(id)a4 fontSize:(double)a5 cornerRadius:(double)a6
{
  id v11;
  id v12;
  void *v13;
  VUITextBadge *v14;

  v11 = a3;
  v12 = a4;
  objc_msgSend((id)objc_opt_class(), "attributedTextFromString:fontColor:fontSize:", v11, v12, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[VUITextBadge initWithAttributedString:tintColor:cornerRadius:](self, "initWithAttributedString:tintColor:cornerRadius:", v13, v12, a6);

  if (v14)
  {
    objc_storeStrong((id *)&v14->_title, a3);
    v14->_fontSize = a5;
    v14->_cornerRadius = a6;
    v14->_strokeSize = 2.0;
    *(_OWORD *)&v14->_badgeInsets.top = kDefaultBadgeInsets;
    *(_OWORD *)&v14->_badgeInsets.bottom = unk_1DA1C2960;
  }

  return v14;
}

+ (id)attributedTextFromString:(id)a3 fontColor:(id)a4 fontSize:(double)a5
{
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v7 = *MEMORY[0x1E0DC1138];
  v16[0] = *MEMORY[0x1E0DC1140];
  v16[1] = v7;
  v17[0] = a4;
  v8 = (void *)MEMORY[0x1E0DC1350];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "boldSystemFontOfSize:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_alloc(MEMORY[0x1E0CB3498]);
  v14 = (void *)objc_msgSend(v13, "initWithString:attributes:", v10, v12);

  return v14;
}

- (void)setTitle:(id)a3
{
  id v4;
  NSString *v5;
  NSString *title;
  id v7;

  if (self->_title != a3)
  {
    v4 = a3;
    v5 = (NSString *)objc_msgSend(v4, "copy");
    title = self->_title;
    self->_title = v5;

    objc_msgSend((id)objc_opt_class(), "attributedTextFromString:fontColor:fontSize:", v4, self->_tintColor, self->_fontSize);
    v7 = (id)objc_claimAutoreleasedReturnValue();

    -[VUITextBadge setAttributedTitle:](self, "setAttributedTitle:", v7);
  }
}

- (void)setAttributedTitle:(id)a3
{
  NSAttributedString *v4;
  NSAttributedString *attributedTitle;

  if (self->_attributedTitle != a3)
  {
    v4 = (NSAttributedString *)objc_msgSend(a3, "copy");
    attributedTitle = self->_attributedTitle;
    self->_attributedTitle = v4;

    -[VUITextBadge setNeedsDisplay](self, "setNeedsDisplay");
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  -[VUITextBadge _textSize](self, "_textSize", a3.width, a3.height);
  v5 = v4 + self->_badgeInsets.left + self->_badgeInsets.right;
  v7 = v6 + self->_badgeInsets.top + self->_badgeInsets.bottom;
  result.height = v7;
  result.width = v5;
  return result;
}

- (void)drawRect:(CGRect)a3
{
  double height;
  double width;
  CGContext *CurrentContext;
  unint64_t badgeStyle;
  void *v8;
  id v9;

  height = a3.size.height;
  width = a3.size.width;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRect:", 0.0, 0.0, width, height);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (self->_backgroundImage)
  {
    CGContextAddPath(CurrentContext, (CGPathRef)objc_msgSend(objc_retainAutorelease(v9), "CGPath"));
    CGContextClip(CurrentContext);
    -[UIImage drawAtPoint:](self->_backgroundImage, "drawAtPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  }
  -[UIColor set](self->_tintColor, "set");
  badgeStyle = self->_badgeStyle;
  if (badgeStyle == 1)
  {
    objc_msgSend(v9, "setLineWidth:", self->_strokeSize);
    objc_msgSend(v9, "stroke");
  }
  else if (badgeStyle == 2)
  {
    objc_msgSend(v9, "fill");
  }
  CGContextSetBlendMode(CurrentContext, (CGBlendMode)self->_textBlendMode);
  -[VUITextBadge attributedTitle](self, "attributedTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "drawAtPoint:", self->_badgeInsets.left, self->_badgeInsets.top);

  CGContextRestoreGState(CurrentContext);
}

- (CGSize)_textSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[VUITextBadge attributedTitle](self, "attributedTitle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "boundingRectWithSize:options:context:", 33, 0, 1.79769313e308, 1.79769313e308);
  v4 = v3;
  v6 = v5;

  v7 = ceil(v4);
  v8 = ceil(v6);
  result.height = v8;
  result.width = v7;
  return result;
}

- (NSString)title
{
  return self->_title;
}

- (NSAttributedString)attributedTitle
{
  return self->_attributedTitle;
}

- (int)textBlendMode
{
  return self->_textBlendMode;
}

- (void)setTextBlendMode:(int)a3
{
  self->_textBlendMode = a3;
}

- (double)strokeSize
{
  return self->_strokeSize;
}

- (void)setStrokeSize:(double)a3
{
  self->_strokeSize = a3;
}

- (UIEdgeInsets)badgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_badgeInsets.top;
  left = self->_badgeInsets.left;
  bottom = self->_badgeInsets.bottom;
  right = self->_badgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setBadgeInsets:(UIEdgeInsets)a3
{
  self->_badgeInsets = a3;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (UIImage)backgroundImage
{
  return self->_backgroundImage;
}

- (void)setBackgroundImage:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundImage, a3);
}

- (unint64_t)badgeStyle
{
  return self->_badgeStyle;
}

- (void)setBadgeStyle:(unint64_t)a3
{
  self->_badgeStyle = a3;
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tintColor, a3);
}

- (double)fontSize
{
  return self->_fontSize;
}

- (void)setFontSize:(double)a3
{
  self->_fontSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_backgroundImage, 0);
  objc_storeStrong((id *)&self->_attributedTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
