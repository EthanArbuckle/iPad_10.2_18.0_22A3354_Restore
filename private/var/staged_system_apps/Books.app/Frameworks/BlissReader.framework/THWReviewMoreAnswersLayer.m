@implementation THWReviewMoreAnswersLayer

- (THWReviewMoreAnswersLayer)init
{
  THWReviewMoreAnswersLayer *v2;
  THWReviewMoreAnswersLayer *v3;
  double *p_width;
  double v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THWReviewMoreAnswersLayer;
  v2 = -[THWReviewMoreAnswersLayer init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    v2->_scale = 1.0;
    p_width = &v2->_layerSize.width;
    v2->_layerSize = (CGSize)xmmword_314890;
    -[THWReviewMoreAnswersLayer setBackgroundColor:](v2, "setBackgroundColor:", objc_msgSend(+[TSUColor clearColor](TSUColor, "clearColor"), "CGColor"));
    -[THWReviewMoreAnswersLayer setFillColor:](v3, "setFillColor:", objc_msgSend(+[TSUColor whiteColor](TSUColor, "whiteColor"), "CGColor"));
    -[THWReviewMoreAnswersLayer setLineWidth:](v3, "setLineWidth:", 1.0);
    -[THWReviewMoreAnswersLayer setStrokeColor:](v3, "setStrokeColor:", -[TSUColor CGColor](+[TSUColor colorWithWhite:alpha:](TSUColor, "colorWithWhite:alpha:", 0.0, 0.1), "CGColor"));
    -[THWReviewMoreAnswersLayer setShadowColor:](v3, "setShadowColor:", objc_msgSend(+[TSUColor blackColor](TSUColor, "blackColor"), "CGColor"));
    LODWORD(v5) = 0.25;
    -[THWReviewMoreAnswersLayer setShadowOpacity:](v3, "setShadowOpacity:", v5);
    -[THWReviewMoreAnswersLayer setShadowOffset:](v3, "setShadowOffset:", 0.0, 3.0);
    -[THWReviewMoreAnswersLayer setShadowRadius:](v3, "setShadowRadius:", 3.0);
    -[THWReviewMoreAnswersLayer setPath:](v3, "setPath:", objc_msgSend(-[THWReviewMoreAnswersLayer p_pathWithDirection:origin:size:scale:includeWedge:](v3, "p_pathWithDirection:origin:size:scale:includeWedge:", 3, 1, CGPointZero.x, CGPointZero.y, *p_width, v3->_layerSize.height, v3->_scale), "CGPath"));
    v3->_textLayer = (CATextLayer *)objc_alloc_init((Class)CATextLayer);
    -[CATextLayer setDelegate:](v3->_textLayer, "setDelegate:", +[THNoAnimationLayerDelegate sharedInstance](THNoAnimationLayerDelegate, "sharedInstance"));
    -[CATextLayer setContentsGravity:](v3->_textLayer, "setContentsGravity:", kCAGravityCenter);
    -[CATextLayer setAlignmentMode:](v3->_textLayer, "setAlignmentMode:", kCAAlignmentCenter);
    -[CATextLayer setTruncationMode:](v3->_textLayer, "setTruncationMode:", kCATruncationEnd);
    -[CATextLayer setString:](v3->_textLayer, "setString:", objc_msgSend((id)THBundle(), "localizedStringForKey:value:table:", CFSTR("Select more answers."), &stru_43D7D8, 0));
    -[CATextLayer setFont:](v3->_textLayer, "setFont:", objc_msgSend(+[TSUFont systemFontOfSize:](TSUFont, "systemFontOfSize:", v3->_scale * 14.0), "fontName"));
    -[CATextLayer setFontSize:](v3->_textLayer, "setFontSize:", v3->_scale * 14.0);
    -[CATextLayer setForegroundColor:](v3->_textLayer, "setForegroundColor:", -[TSUColor CGColor](+[TSUColor colorWithWhite:alpha:](TSUColor, "colorWithWhite:alpha:", 0.300000012, 1.0), "CGColor"));
    -[CATextLayer setBackgroundColor:](v3->_textLayer, "setBackgroundColor:", objc_msgSend(+[TSUColor clearColor](TSUColor, "clearColor"), "CGColor"));
    -[THWReviewMoreAnswersLayer p_updateTextLayerFrame](v3, "p_updateTextLayerFrame");
    -[THWReviewMoreAnswersLayer addSublayer:](v3, "addSublayer:", v3->_textLayer);
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWReviewMoreAnswersLayer;
  -[THWReviewMoreAnswersLayer dealloc](&v3, "dealloc");
}

- (void)p_updateTextLayerFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect v11;
  CGRect v12;

  v11.origin.x = TSDRectWithSize(self);
  v12 = CGRectInset(v11, 10.0, 10.0);
  v3 = TSDMultiplyRectScalar((__n128)v12.origin, *(__n128 *)&v12.origin.y, (__n128)v12.size, *(__n128 *)&v12.size.height, self->_scale);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  -[CATextLayer contentsScale](self->_textLayer, "contentsScale");
  -[CATextLayer setFrame:](self->_textLayer, "setFrame:", TSDRoundedRectForScale(v3, v5, v7, v9, v10));
}

- (void)setContentsScale:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THWReviewMoreAnswersLayer;
  -[THWReviewMoreAnswersLayer setContentsScale:](&v5, "setContentsScale:");
  -[CATextLayer setContentsScale:](self->_textLayer, "setContentsScale:", a3);
  -[THWReviewMoreAnswersLayer p_updateTextLayerFrame](self, "p_updateTextLayerFrame");
}

- (void)setScale:(double)a3
{
  if (self->_scale != a3)
  {
    self->_scale = a3;
    -[CATextLayer setFontSize:](self->_textLayer, "setFontSize:", a3 * 14.0);
    -[THWReviewMoreAnswersLayer setPath:](self, "setPath:", objc_msgSend(-[THWReviewMoreAnswersLayer p_pathWithDirection:origin:size:scale:includeWedge:](self, "p_pathWithDirection:origin:size:scale:includeWedge:", 3, 1, CGPointZero.x, CGPointZero.y, self->_layerSize.width, self->_layerSize.height, self->_scale), "CGPath"));
    -[THWReviewMoreAnswersLayer p_updateTextLayerFrame](self, "p_updateTextLayerFrame");
  }
}

- (id)p_pathWithDirection:(int)a3 origin:(CGPoint)a4 size:(CGSize)a5 scale:(double)a6 includeWedge:(BOOL)a7
{
  double height;
  double width;
  double y;
  double x;
  double v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGPath *Mutable;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  TSDBezierPath *v34;
  double v36;
  double v37;
  CGAffineTransform m;

  height = a5.height;
  width = a5.width;
  y = a4.y;
  x = a4.x;
  v14 = TSURound(self, a6 * 24.0);
  v16 = TSURound(v15, a6 * 14.0);
  if (a3 != 0 && a7)
    v17 = v16;
  else
    v17 = 0.0;
  v18 = TSDMultiplyPointScalar(x, y, a6);
  v19 = TSDRoundedPoint(v18);
  v21 = v20;
  v22 = TSDMultiplySizeScalar(width, height, a6);
  v23 = TSDRoundedSize(v22);
  v25 = v24;
  v26 = a6 * 3.5;
  memset(&m, 0, sizeof(m));
  CGAffineTransformMakeTranslation(&m, v19, v21);
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, &m, v26, 0.0);
  v37 = (v23 - v14) * 0.5;
  CGPathAddLineToPoint(Mutable, &m, v37, 0.0);
  v28 = 0.0;
  if (a3 == 1)
    v28 = -v17;
  CGPathAddLineToPoint(Mutable, &m, v23 * 0.5, v28);
  v29 = (v14 + v23) * 0.5;
  CGPathAddLineToPoint(Mutable, &m, v29, 0.0);
  CGPathAddLineToPoint(Mutable, &m, v23 - v26, 0.0);
  CGPathAddArcToPoint(Mutable, &m, v23, 0.0, v23, v26, v26);
  v36 = (v25 - v14) * 0.5;
  CGPathAddLineToPoint(Mutable, &m, v23, v36);
  v30 = 0.0;
  if (a3 == 2)
    v30 = v17;
  CGPathAddLineToPoint(Mutable, &m, v30 + v23, v25 * 0.5);
  v31 = (v14 + v25) * 0.5;
  CGPathAddLineToPoint(Mutable, &m, v23, v31);
  CGPathAddLineToPoint(Mutable, &m, v23, v25 - v26);
  CGPathAddArcToPoint(Mutable, &m, v23, v25, v23 - v26, v25, v26);
  CGPathAddLineToPoint(Mutable, &m, v29, v25);
  if (a3 == 3)
    v32 = v17;
  else
    v32 = 0.0;
  CGPathAddLineToPoint(Mutable, &m, v23 * 0.5, v32 + v25);
  CGPathAddLineToPoint(Mutable, &m, v37, v25);
  CGPathAddLineToPoint(Mutable, &m, v26, v25);
  CGPathAddArcToPoint(Mutable, &m, 0.0, v25, 0.0, v25 - v26, v26);
  CGPathAddLineToPoint(Mutable, &m, 0.0, v31);
  v33 = -v17;
  if (a3 != 4)
    v33 = 0.0;
  CGPathAddLineToPoint(Mutable, &m, v33, v25 * 0.5);
  CGPathAddLineToPoint(Mutable, &m, 0.0, v36);
  CGPathAddLineToPoint(Mutable, &m, 0.0, v26);
  CGPathAddArcToPoint(Mutable, &m, 0.0, 0.0, v26, 0.0, v26);
  CGPathCloseSubpath(Mutable);
  v34 = +[TSDBezierPath bezierPathWithCGPath:](TSDBezierPath, "bezierPathWithCGPath:", Mutable);
  CGPathRelease(Mutable);
  return v34;
}

- (CGSize)layerSize
{
  double width;
  double height;
  CGSize result;

  width = self->_layerSize.width;
  height = self->_layerSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)scale
{
  return self->_scale;
}

- (CATextLayer)textLayer
{
  return self->_textLayer;
}

@end
