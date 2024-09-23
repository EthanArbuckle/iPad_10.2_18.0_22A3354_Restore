@implementation _TVTextBadge

+ (id)textBadgeViewWithElement:(id)a3 existingView:(id)a4
{
  id v5;
  id v6;
  _TVTextBadge *v7;
  _TVTextBadge *v8;
  _TVTextBadge *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  __int128 v30;
  __int128 v31;

  v5 = a4;
  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (_TVTextBadge *)v5;
  }
  else
  {
    v8 = [_TVTextBadge alloc];
    v7 = -[_TVTextBadge initWithFrame:](v8, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  }
  v9 = v7;
  objc_msgSend(v6, "style");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "tv_backgroundColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "color");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVTextBadge setBackgroundColor:](v9, "setBackgroundColor:", v12);

  objc_msgSend(v6, "tv_attributedString");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVTextBadge setText:](v9, "setText:", v13);
  objc_msgSend(v6, "attributes");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("type"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVTextBadge setType:](v9, "setType:", v15);

  objc_msgSend(v6, "style");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "tv_tintColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "color");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVTextBadge setTintColor:](v9, "setTintColor:", v18);

  v30 = TVCornerRadiiZero;
  v31 = *(_OWORD *)&qword_222E77538;
  +[TVMLUtilities _cornerRadiiFromElement:cornerRadii:circle:](TVMLUtilities, "_cornerRadiiFromElement:cornerRadii:circle:", v6, &v30, 0);
  +[TVCornerUtilities radiusFromCornerRadii:](TVCornerUtilities, "radiusFromCornerRadii:", v30, v31);
  -[_TVTextBadge setCornerRadius:](v9, "setCornerRadius:");
  objc_msgSend(v6, "style");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "tv_borderWidths");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;

  v28 = fmax(fmax(v21, v25), fmax(v23, v27));
  if (v28 < 1.0)
    v28 = 2.0;
  -[_TVTextBadge setLineWidth:](v9, "setLineWidth:", v28);
  -[_TVTextBadge setNeedsDisplay](v9, "setNeedsDisplay");

  return v9;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double height;
  double v17;
  double v18;
  CGSize result;
  CGRect v20;
  CGRect v21;

  width = a3.width;
  -[UIView tv_padding](self, "tv_padding", a3.width, a3.height);
  v8 = v7;
  v9 = v5;
  v11 = v10;
  v12 = v6;
  if (width == 0.0)
    v13 = 0.0;
  else
    v13 = width - v5 - v6;
  -[_TVTextBadge text](self, "text");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "boundingRectWithSize:options:context:", 2, 0, v13, 0.0);
  v21 = CGRectIntegral(v20);
  v15 = v21.size.width;
  height = v21.size.height;

  v17 = v12 + v9 + v15;
  v18 = v11 + v8 + height;
  result.height = v18;
  result.width = v17;
  return result;
}

- (void)drawRect:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  CGContext *CurrentContext;
  void *v13;
  void *v14;
  void *v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[UIView tv_padding](self, "tv_padding");
  v9 = v8;
  v11 = v10;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  if (-[NSString isEqualToString:](self->_type, "isEqualToString:", CFSTR("fill")))
  {
    objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithRoundedRect:cornerRadius:", x, y, width, height, self->_cornerRadius);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIColor set](self->_tintColor, "set");
    objc_msgSend(v13, "fill");
    CGContextSetBlendMode(CurrentContext, kCGBlendModeDestinationOut);
    -[_TVTextBadge text](self, "text");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "drawAtPoint:", v11, v9);

  }
  else
  {
    -[_TVTextBadge text](self, "text");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "drawAtPoint:", v11, v9);

    objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithRoundedRect:cornerRadius:", 1.0, 1.0, width + -2.0, height + -2.0, self->_cornerRadius);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIColor set](self->_tintColor, "set");
    objc_msgSend(v13, "setLineWidth:", self->_lineWidth);
    objc_msgSend(v13, "stroke");
  }

  CGContextRestoreGState(CurrentContext);
}

- (NSAttributedString)text
{
  return self->_text;
}

- (void)setText:(id)a3
{
  objc_storeStrong((id *)&self->_text, a3);
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_storeStrong((id *)&self->_type, a3);
}

- (UIColor)tintColor
{
  return self->_tintColor;
}

- (void)setTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_tintColor, a3);
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

- (void)setCornerRadius:(double)a3
{
  self->_cornerRadius = a3;
}

- (double)lineWidth
{
  return self->_lineWidth;
}

- (void)setLineWidth:(double)a3
{
  self->_lineWidth = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tintColor, 0);
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_text, 0);
}

@end
