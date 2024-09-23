@implementation AEInlineAnnotationMarker

- (AEInlineAnnotationMarker)initWithAnnotationStyle:(int)a3 pageTheme:(int64_t)a4 contentScale:(double)a5
{
  AEInlineAnnotationMarker *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AEInlineAnnotationMarker;
  result = -[AEInlineAnnotationMarker init](&v9, "init");
  if (result)
  {
    result->_style = a3;
    result->_markerSize = (CGSize)vdupq_n_s64(0x4040000000000000uLL);
    result->_pageTheme = a4;
    result->_contentScale = a5;
  }
  return result;
}

- (void)renderIn:(CGContext *)a3
{
  unint64_t pageTheme;
  void *v6;
  uint64_t v7;
  CGPath *Mutable;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  double v19;
  CAShapeLayer *v20;
  CGPath *v21;
  CAShapeLayer *v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  v22 = objc_opt_new(CAShapeLayer);
  pageTheme = self->_pageTheme;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotationTheme themeForAnnotationStyle:pageTheme:isUnderline:](AEAnnotationTheme, "themeForAnnotationStyle:pageTheme:isUnderline:"));
  if (v6)
  {
    v7 = (pageTheme < 0xB) & (0x7E3u >> pageTheme);
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    -[CAShapeLayer setBounds:](v22, "setBounds:", 0.0, 0.0, self->_markerSize.width, self->_markerSize.height);
    Mutable = CGPathCreateMutable();
    v23.origin.x = CGRectMakeWithSize(self->_markerSize.width, self->_markerSize.height);
    v24 = CGRectInset(v23, 5.0, 5.0);
    x = v24.origin.x;
    y = v24.origin.y;
    width = v24.size.width;
    height = v24.size.height;
    CGPathAddEllipseInRect(Mutable, 0, v24);
    -[CAShapeLayer setPath:](v22, "setPath:", Mutable);
    -[CAShapeLayer setShadowPath:](v22, "setShadowPath:", Mutable);
    -[CAShapeLayer setShadowOffset:](v22, "setShadowOffset:", 0.0, self->_contentScale * 0.5);
    LODWORD(v13) = 1041865114;
    -[CAShapeLayer setShadowOpacity:](v22, "setShadowOpacity:", v13);
    -[CAShapeLayer setShadowRadius:](v22, "setShadowRadius:", self->_contentScale * 1.5);
    CGPathRelease(Mutable);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "noteMarkerFillColor"));
    v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bkaxAdjustedForIncreaseContrastAdjustingDarker:", v7)));
    -[CAShapeLayer setFillColor:](v22, "setFillColor:", objc_msgSend(v15, "CGColor"));

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "bkaxAdjustedForIncreaseContrastAdjustingDarker:", v7)));
    v18 = objc_msgSend(v17, "CGColor");

    -[CAShapeLayer setStrokeColor:](v22, "setStrokeColor:", v18);
    -[CAShapeLayer setLineWidth:](v22, "setLineWidth:", 2.0);
    LODWORD(v19) = 1063675494;
    -[CAShapeLayer setOpacity:](v22, "setOpacity:", v19);
    v20 = objc_opt_new(CAShapeLayer);
    v21 = CGPathCreateMutable();
    v25.origin.x = x;
    v25.origin.y = y;
    v25.size.width = width;
    v25.size.height = height;
    v26 = CGRectInset(v25, 7.0, 7.0);
    CGPathAddRoundedRect(v21, 0, v26, 1.0, 1.0);
    -[CAShapeLayer setPath:](v20, "setPath:", v21);
    CGPathRelease(v21);
    -[CAShapeLayer addSublayer:](v22, "addSublayer:", v20);
    -[CAShapeLayer setFillColor:](v20, "setFillColor:", v18);
    +[CATransaction commit](CATransaction, "commit");

  }
  -[CAShapeLayer renderInContext:](v22, "renderInContext:", a3);

}

- (CGSize)markerSize
{
  double width;
  double height;
  CGSize result;

  width = self->_markerSize.width;
  height = self->_markerSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setMarkerSize:(CGSize)a3
{
  self->_markerSize = a3;
}

- (int)style
{
  return self->_style;
}

- (void)setStyle:(int)a3
{
  self->_style = a3;
}

- (int64_t)pageTheme
{
  return self->_pageTheme;
}

- (void)setPageTheme:(int64_t)a3
{
  self->_pageTheme = a3;
}

- (double)contentScale
{
  return self->_contentScale;
}

- (void)setContentScale:(double)a3
{
  self->_contentScale = a3;
}

@end
