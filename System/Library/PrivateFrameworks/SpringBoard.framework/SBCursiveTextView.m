@implementation SBCursiveTextView

- (SBCursiveTextView)init
{
  SBCursiveTextView *v2;
  SBCursiveTextView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBCursiveTextView;
  v2 = -[SBCursiveTextView init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[SBCursiveTextView configure](v2, "configure");
  return v3;
}

- (SBCursiveTextView)initWithFrame:(CGRect)a3
{
  SBCursiveTextView *v3;
  SBCursiveTextView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBCursiveTextView;
  v3 = -[SBCursiveTextView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[SBCursiveTextView configure](v3, "configure");
  return v4;
}

- (void)configure
{
  CAShapeLayer *v3;
  CAShapeLayer *textLayer;
  CAShapeLayer *v5;
  double v6;
  id v7;

  v3 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E0CD2840]);
  textLayer = self->_textLayer;
  self->_textLayer = v3;

  v5 = self->_textLayer;
  -[SBCursiveTextView bounds](self, "bounds");
  -[CAShapeLayer setFrame:](v5, "setFrame:");
  -[CAShapeLayer setShadowRadius:](self->_textLayer, "setShadowRadius:", 1.0);
  LODWORD(v6) = 1036831949;
  -[CAShapeLayer setShadowOpacity:](self->_textLayer, "setShadowOpacity:", v6);
  -[CAShapeLayer setShadowOffset:](self->_textLayer, "setShadowOffset:", 0.0, 1.0);
  -[SBCursiveTextView layer](self, "layer");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addSublayer:", self->_textLayer);

}

- (void)layoutSubviews
{
  CAShapeLayer *textLayer;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBCursiveTextView;
  -[SBCursiveTextView layoutSubviews](&v4, sel_layoutSubviews);
  textLayer = self->_textLayer;
  -[SBCursiveTextView bounds](self, "bounds");
  -[CAShapeLayer setFrame:](textLayer, "setFrame:");
}

- (void)loadText:(id)a3 pointSize:(double)a4
{
  id v5;
  SBCursiveTextPath *v6;
  SBCursiveTextPath *textPath;
  SBCursiveTextPath *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v5 = a3;
  v6 = -[SBCursiveTextPath initWithURL:]([SBCursiveTextPath alloc], "initWithURL:", v5);

  textPath = self->_textPath;
  self->_textPath = v6;

  v8 = self->_textPath;
  if (v8)
  {
    -[CAShapeLayer bounds](self->_textLayer, "bounds");
    -[SBCursiveTextPath transformForRect:pointSize:flipped:](v8, "transformForRect:pointSize:flipped:", 1);
    *(_OWORD *)&self->_textTransform.a = v9;
    *(_OWORD *)&self->_textTransform.c = v10;
    *(_OWORD *)&self->_textTransform.tx = v11;
  }
}

- (double)duration
{
  double result;

  -[SBCursiveTextPath duration](self->_textPath, "duration");
  return result;
}

- (void)setTime:(float)a3
{
  CGPath *v4;
  const CGPath *v5;

  v4 = -[SBCursiveTextPath pathForTime:](self->_textPath, "pathForTime:", a3);
  v5 = (const CGPath *)MEMORY[0x1D17E2B98](v4, &self->_textTransform);
  -[CAShapeLayer setPath:](self->_textLayer, "setPath:", v5);
  -[CAShapeLayer setShadowPath:](self->_textLayer, "setShadowPath:", v5);
  CGPathRelease(v5);
  CGPathRelease(v4);
}

- (void)setFillColor:(id)a3
{
  -[CAShapeLayer setFillColor:](self->_textLayer, "setFillColor:", objc_msgSend(objc_retainAutorelease(a3), "CGColor"));
}

- (void)setAccessibilityLabel:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBCursiveTextView;
  v4 = a3;
  -[SBCursiveTextView setAccessibilityLabel:](&v5, sel_setAccessibilityLabel_, v4);
  -[SBCursiveTextPath setAccessibilityLabel:](self->_textPath, "setAccessibilityLabel:", v4, v5.receiver, v5.super_class);

}

- (void)setAccessibilityLanguage:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBCursiveTextView;
  v4 = a3;
  -[SBCursiveTextView setAccessibilityLanguage:](&v5, sel_setAccessibilityLanguage_, v4);
  -[SBCursiveTextPath setAccessibilityLanguage:](self->_textPath, "setAccessibilityLanguage:", v4, v5.receiver, v5.super_class);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textPath, 0);
  objc_storeStrong((id *)&self->_textLayer, 0);
}

@end
