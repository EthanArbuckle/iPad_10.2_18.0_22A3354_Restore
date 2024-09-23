@implementation THPageNumberView

- (THPageNumberView)initWithPosition:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  THPageNumberView *v5;
  THPageNumberView *v6;
  id v7;
  objc_super v9;

  y = a3.y;
  x = a3.x;
  v9.receiver = self;
  v9.super_class = (Class)THPageNumberView;
  v5 = -[THPageNumberView initWithFrame:](&v9, "initWithFrame:", a3.x + -40.0, a3.y + -23.0, 40.0, 23.0);
  v6 = v5;
  if (v5)
  {
    v5->_mode = 0;
    v5->_position.x = x;
    v5->_position.y = y;
    v5->_pageNumber = 0x7FFFFFFFFFFFFFFFLL;
    v5->_pageCount = 0x7FFFFFFFFFFFFFFFLL;
    v7 = objc_alloc((Class)UILabel);
    -[THPageNumberView bounds](v6, "bounds");
    v6->_label = (UILabel *)objc_msgSend(v7, "initWithFrame:");
    -[UILabel setFont:](v6->_label, "setFont:", +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 12.0));
    -[UILabel setTextAlignment:](v6->_label, "setTextAlignment:", 1);
    -[UILabel setTextColor:](v6->_label, "setTextColor:", +[UIColor blackColor](UIColor, "blackColor"));
    -[UILabel setAdjustsFontSizeToFitWidth:](v6->_label, "setAdjustsFontSizeToFitWidth:", 0);
    -[UILabel setOpaque:](v6->_label, "setOpaque:", 0);
    -[UILabel setBackgroundColor:](v6->_label, "setBackgroundColor:", +[UIColor clearColor](UIColor, "clearColor"));
    -[THPageNumberView addSubview:](v6, "addSubview:", v6->_label);
    -[THPageNumberView p_updateBackgroundLayer](v6, "p_updateBackgroundLayer");
  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  self->_backgroundLayer = 0;
  self->_label = 0;
  v3.receiver = self;
  v3.super_class = (Class)THPageNumberView;
  -[THPageNumberView dealloc](&v3, "dealloc");
}

- (void)p_updateBackgroundLayer
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIColor *v7;
  UIColor *v8;

  if (!-[THPageNumberView backgroundLayer](self, "backgroundLayer"))
    self->_backgroundLayer = (CALayer *)objc_alloc_init((Class)CALayer);
  -[THPageNumberView bounds](self, "bounds");
  -[CALayer setBounds:](-[THPageNumberView backgroundLayer](self, "backgroundLayer"), "setBounds:", v3, v4, v5, v6);
  -[CALayer setCornerRadius:](-[THPageNumberView backgroundLayer](self, "backgroundLayer"), "setCornerRadius:", 11.5);
  if (-[THPageNumberView mode](self, "mode"))
    v7 = +[UIColor clearColor](UIColor, "clearColor");
  else
    v7 = +[UIColor whiteColor](UIColor, "whiteColor");
  -[CALayer setBackgroundColor:](-[THPageNumberView backgroundLayer](self, "backgroundLayer"), "setBackgroundColor:", -[UIColor CGColor](v7, "CGColor"));
  if (-[THPageNumberView mode](self, "mode"))
    v8 = +[UIColor clearColor](UIColor, "clearColor");
  else
    v8 = +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.15);
  -[CALayer setBorderColor:](-[THPageNumberView backgroundLayer](self, "backgroundLayer"), "setBorderColor:", -[UIColor CGColor](v8, "CGColor"));
  -[CALayer setBorderWidth:](-[THPageNumberView backgroundLayer](self, "backgroundLayer"), "setBorderWidth:", 1.0);
  if (-[THPageNumberView mode](self, "mode"))
  {
    if (-[CALayer superlayer](-[THPageNumberView backgroundLayer](self, "backgroundLayer"), "superlayer"))
      -[CALayer removeFromSuperlayer](-[THPageNumberView backgroundLayer](self, "backgroundLayer"), "removeFromSuperlayer");
  }
  else
  {
    objc_msgSend(-[THPageNumberView layer](self, "layer"), "insertSublayer:below:", -[THPageNumberView backgroundLayer](self, "backgroundLayer"), -[UILabel layer](-[THPageNumberView label](self, "label"), "layer"));
  }
}

- (void)setMode:(int)a3
{
  if (-[THPageNumberView mode](self, "mode") != a3)
  {
    self->_mode = a3;
    -[THPageNumberView p_updateBackgroundLayer](self, "p_updateBackgroundLayer");
    -[THPageNumberView p_updatePageString](self, "p_updatePageString");
  }
}

- (BOOL)isBold
{
  UIFont *v2;

  v2 = -[UILabel font](self->_label, "font");
  return v2 == +[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 12.0);
}

- (void)setBold:(BOOL)a3
{
  UIFont *v4;

  if (a3)
    v4 = +[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 12.0);
  else
    v4 = +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 12.0);
  -[UILabel setFont:](self->_label, "setFont:", v4);
}

- (void)setPageNumberColor:(id)a3 backgroundColor:(id)a4
{
  double v7;
  double v8;
  double v9;

  -[UILabel setTextColor:](-[THPageNumberView label](self, "label"), "setTextColor:", a3);
  if (-[THPageNumberView mode](self, "mode"))
  {
    -[CALayer setBackgroundColor:](-[THPageNumberView backgroundLayer](self, "backgroundLayer"), "setBackgroundColor:", -[UIColor CGColor](+[UIColor clearColor](UIColor, "clearColor"), "CGColor"));
    -[CALayer setBorderColor:](-[THPageNumberView backgroundLayer](self, "backgroundLayer"), "setBorderColor:", -[UIColor CGColor](+[UIColor clearColor](UIColor, "clearColor"), "CGColor"));
  }
  else
  {
    -[CALayer setBackgroundColor:](-[THPageNumberView backgroundLayer](self, "backgroundLayer"), "setBackgroundColor:", objc_msgSend(a4, "CGColor"));
    v8 = 0.0;
    v9 = 0.0;
    v7 = 0.0;
    if (objc_msgSend(a3, "getRed:green:blue:alpha:", &v9, &v8, &v7, 0))
      -[CALayer setBorderColor:](-[THPageNumberView backgroundLayer](self, "backgroundLayer"), "setBorderColor:", -[UIColor CGColor](+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", v9, v8, v7, 0.15), "CGColor"));
  }
}

- (void)p_updatePageString
{
  const __CFString *v3;

  if (-[THPageNumberView mode](self, "mode") == 1)
  {
    if (-[THPageNumberView pageNumber](self, "pageNumber") == 0x7FFFFFFFFFFFFFFFLL
      || -[THPageNumberView pageCount](self, "pageCount") == 0x7FFFFFFFFFFFFFFFLL)
    {
      v3 = CFSTR("...");
    }
    else
    {
      v3 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("%@ of %@"), &stru_43D7D8, 0), +[NSNumberFormatter imaxLocalizedUnsignedInteger:usesGroupingSeparator:](NSNumberFormatter, "imaxLocalizedUnsignedInteger:usesGroupingSeparator:", -[THPageNumberView pageNumber](self, "pageNumber"), 0), +[NSNumberFormatter imaxLocalizedUnsignedInteger:usesGroupingSeparator:](NSNumberFormatter, "imaxLocalizedUnsignedInteger:usesGroupingSeparator:", -[THPageNumberView pageCount](self, "pageCount"), 0));
    }
    -[UILabel setText:](-[THPageNumberView label](self, "label"), "setText:", v3);
  }
  -[UILabel sizeToFit](-[THPageNumberView label](self, "label"), "sizeToFit");
  -[THPageNumberView p_updateFrame](self, "p_updateFrame");
}

- (void)setPageNumber:(unint64_t)a3
{
  if (self->_pageNumber != a3)
  {
    self->_pageNumber = a3;
    -[THPageNumberView p_updatePageString](self, "p_updatePageString");
  }
}

- (void)setPageCount:(unint64_t)a3
{
  if (self->_pageCount != a3)
  {
    self->_pageCount = a3;
    -[THPageNumberView p_updatePageString](self, "p_updatePageString");
  }
}

- (void)p_updateFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  UILabel *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGRect v36;
  CGRect v37;

  if (-[THPageNumberView mode](self, "mode"))
  {
    -[UILabel bounds](-[THPageNumberView label](self, "label"), "bounds");
    v4 = v3;
    v6 = v5;
    -[THPageNumberView maxWidth](self, "maxWidth");
    if (v7 > 0.0)
    {
      -[THPageNumberView maxWidth](self, "maxWidth");
      if (v4 > v8)
      {
        -[THPageNumberView maxWidth](self, "maxWidth");
        v4 = v9;
      }
    }
    -[THPageNumberView position](self, "position");
    v11 = v10 - v4 * 0.5;
    -[THPageNumberView position](self, "position");
    v36.origin.y = v12 - v6 * 0.5;
    v36.origin.x = v11;
    v36.size.width = v4;
    v36.size.height = v6;
    v37 = CGRectIntegral(v36);
    -[THPageNumberView setFrame:](self, "setFrame:", v37.origin.x, v37.origin.y, v37.size.width, v37.size.height);
    -[THPageNumberView bounds](self, "bounds");
    -[CALayer setBounds:](-[THPageNumberView backgroundLayer](self, "backgroundLayer"), "setBounds:", v13, v14, v15, v16);
    -[THPageNumberView bounds](self, "bounds");
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v25 = -[THPageNumberView label](self, "label");
    v26 = v18;
    v27 = v20;
    v28 = v22;
    v29 = v24;
  }
  else
  {
    -[THPageNumberView position](self, "position");
    v31 = v30 + -40.0;
    -[THPageNumberView position](self, "position");
    -[THPageNumberView setFrame:](self, "setFrame:", v31, v32 + -23.0, 40.0, 23.0);
    -[THPageNumberView p_pillWidthForText:](self, "p_pillWidthForText:", -[UILabel text](self->_label, "text"));
    v34 = v33;
    v35 = 40.0 - v33;
    -[CALayer setFrame:](-[THPageNumberView backgroundLayer](self, "backgroundLayer"), "setFrame:", 40.0 - v33, 0.0, v33, 23.0);
    v25 = -[THPageNumberView label](self, "label");
    v27 = 0.0;
    v29 = 23.0;
    v26 = v35;
    v28 = v34;
  }
  -[UILabel setFrame:](v25, "setFrame:", v26, v27, v28, v29);
}

- (void)updatePosition:(CGPoint)a3
{
  -[THPageNumberView setPosition:](self, "setPosition:", a3.x, a3.y);
  -[THPageNumberView p_updateFrame](self, "p_updateFrame");
}

- (void)updateMaxWidth:(double)a3
{
  -[THPageNumberView setMaxWidth:](self, "setMaxWidth:", a3);
  -[THPageNumberView p_updateFrame](self, "p_updateFrame");
}

- (void)setIsCurrentPage:(BOOL)a3
{
  _BOOL4 v3;
  UIColor *v5;

  v3 = a3;
  if (-[THPageNumberView isCurrentPage](self, "isCurrentPage") != a3)
  {
    self->_isCurrentPage = v3;
    if (v3)
    {
      -[CALayer setBackgroundColor:](self->_backgroundLayer, "setBackgroundColor:", -[UIColor CGColor](+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.0, 0.478431373, 1.0, 1.0), "CGColor"));
      v5 = +[UIColor whiteColor](UIColor, "whiteColor");
    }
    else
    {
      -[CALayer setBackgroundColor:](self->_backgroundLayer, "setBackgroundColor:", -[UIColor CGColor](+[UIColor whiteColor](UIColor, "whiteColor"), "CGColor"));
      v5 = +[UIColor blackColor](UIColor, "blackColor");
    }
    -[UILabel setTextColor:](self->_label, "setTextColor:", v5);
    -[CALayer setBorderWidth:](self->_backgroundLayer, "setBorderWidth:", (double)!v3);
  }
}

- (double)p_pillWidthForText:(id)a3
{
  char *v3;

  v3 = (char *)objc_msgSend(a3, "length");
  if ((unint64_t)(v3 - 1) > 2)
    return 40.0;
  else
    return dbl_3149C8[(_QWORD)(v3 - 1)];
}

- (void)setPageNumberText:(id)a3
{
  -[UILabel setText:](self->_label, "setText:", a3);
  -[UILabel sizeToFit](self->_label, "sizeToFit");
  -[THPageNumberView p_updateFrame](self, "p_updateFrame");
}

- (UILabel)label
{
  return self->_label;
}

- (CALayer)backgroundLayer
{
  return self->_backgroundLayer;
}

- (void)setBackgroundLayer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (int)mode
{
  return self->_mode;
}

- (BOOL)isCurrentPage
{
  return self->_isCurrentPage;
}

- (unint64_t)pageNumber
{
  return self->_pageNumber;
}

- (unint64_t)pageCount
{
  return self->_pageCount;
}

- (CGPoint)position
{
  double x;
  double y;
  CGPoint result;

  x = self->_position.x;
  y = self->_position.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPosition:(CGPoint)a3
{
  self->_position = a3;
}

- (double)maxWidth
{
  return self->_maxWidth;
}

- (void)setMaxWidth:(double)a3
{
  self->_maxWidth = a3;
}

@end
