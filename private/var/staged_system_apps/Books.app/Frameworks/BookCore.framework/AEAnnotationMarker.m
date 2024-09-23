@implementation AEAnnotationMarker

- (AEAnnotationMarker)initWithAnnotationStyle:(int)a3 contentScale:(double)a4
{
  return -[AEAnnotationMarker initWithAnnotationStyle:contentScale:cornerRadius:](self, "initWithAnnotationStyle:contentScale:cornerRadius:", *(_QWORD *)&a3, a4, 0.0);
}

- (AEAnnotationMarker)initWithAnnotationStyle:(int)a3 contentScale:(double)a4 cornerRadius:(double)a5 hasBorder:(BOOL)a6
{
  _BOOL8 v6;
  AEAnnotationMarker *v7;
  uint64_t v8;
  NSNumber *overrideHasBorder;

  v6 = a6;
  v7 = -[AEAnnotationMarker initWithAnnotationStyle:contentScale:cornerRadius:](self, "initWithAnnotationStyle:contentScale:cornerRadius:", *(_QWORD *)&a3, a4, a5);
  if (v7)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v6));
    overrideHasBorder = v7->_overrideHasBorder;
    v7->_overrideHasBorder = (NSNumber *)v8;

  }
  return v7;
}

- (AEAnnotationMarker)initWithAnnotationStyle:(int)a3 contentScale:(double)a4 cornerRadius:(double)a5
{
  AEAnnotationMarker *v8;
  AEAnnotationMarker *v9;
  AEAnnotationMarkerLayer *v10;
  CALayer *layer;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)AEAnnotationMarker;
  v8 = -[AEAnnotationMarker init](&v13, "init");
  v9 = v8;
  if (v8)
  {
    v8->_contentScale = a4;
    v8->_viewScale = 1.0;
    v8->_pageTheme = 4;
    v8->_effect = 0;
    v8->_style = a3;
    v8->_strikethrough = 0;
    v10 = objc_alloc_init(AEAnnotationMarkerLayer);
    layer = v9->_layer;
    v9->_layer = &v10->super;

    -[CALayer setDelegate:](v9->_layer, "setDelegate:", v9);
    if (a5 > 0.0)
    {
      -[CALayer setCornerRadius:](v9->_layer, "setCornerRadius:", a5);
      -[CALayer setCornerCurve:](v9->_layer, "setCornerCurve:", kCACornerCurveContinuous);
    }
    -[AEAnnotationMarker p_updateLayerDimensions](v9, "p_updateLayerDimensions");
    -[AEAnnotationMarker p_updateLayerColors](v9, "p_updateLayerColors");
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[CALayer setDelegate:](self->_layer, "setDelegate:", 0);
  -[CAShapeLayer setDelegate:](self->_strikethroughLayer, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AEAnnotationMarker;
  -[AEAnnotationMarker dealloc](&v3, "dealloc");
}

+ (CGSize)fillSizeForScale:(double)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = 21.0;
  v4 = 21.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)p_fillSize
{
  double v2;
  double v3;
  CGSize result;

  +[AEAnnotationMarker fillSizeForScale:](AEAnnotationMarker, "fillSizeForScale:", self->_contentScale);
  result.height = v3;
  result.width = v2;
  return result;
}

+ (CGSize)imageSizeForScale:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  objc_msgSend(a1, "borderWidthForScale:");
  v6 = v5 + v5;
  objc_msgSend(a1, "fillSizeForScale:", a3);
  v8 = v6 + v7;
  v10 = v6 + v9;
  result.height = v10;
  result.width = v8;
  return result;
}

- (CGSize)imageSize
{
  double v2;
  double v3;
  CGSize result;

  +[AEAnnotationMarker imageSizeForScale:](AEAnnotationMarker, "imageSizeForScale:", self->_contentScale);
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setStyle:(int)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    -[AEAnnotationMarker p_updateLayerColors](self, "p_updateLayerColors");
  }
}

- (void)setPageTheme:(int64_t)a3
{
  if (self->_pageTheme != a3)
  {
    self->_pageTheme = a3;
    -[AEAnnotationMarker p_updateLayerColors](self, "p_updateLayerColors");
  }
}

- (void)setStrikethrough:(BOOL)a3
{
  _BOOL4 v3;
  CAShapeLayer *v5;
  CAShapeLayer *strikethroughLayer;

  if (self->_strikethrough != a3)
  {
    v3 = a3;
    self->_strikethrough = a3;
    if (a3)
    {
      if (!self->_strikethroughLayer)
      {
        v5 = (CAShapeLayer *)objc_alloc_init((Class)CAShapeLayer);
        strikethroughLayer = self->_strikethroughLayer;
        self->_strikethroughLayer = v5;

        -[CAShapeLayer setDelegate:](self->_strikethroughLayer, "setDelegate:", self);
        -[CALayer addSublayer:](self->_layer, "addSublayer:", self->_strikethroughLayer);
      }
      -[AEAnnotationMarker p_updateLayerDimensions](self, "p_updateLayerDimensions");
      -[AEAnnotationMarker p_updateLayerColors](self, "p_updateLayerColors");
    }
    -[CAShapeLayer setHidden:](self->_strikethroughLayer, "setHidden:", !v3);
  }
}

- (void)setEffect:(int)a3
{
  if (self->_effect != a3)
  {
    self->_effect = a3;
    -[AEAnnotationMarker p_updateLayerColors](self, "p_updateLayerColors");
  }
}

- (void)setContentScale:(double)a3
{
  if (self->_contentScale != a3)
  {
    self->_contentScale = a3;
    -[AEAnnotationMarker p_updateLayerDimensions](self, "p_updateLayerDimensions");
  }
}

- (void)setViewScale:(double)a3
{
  if (self->_viewScale != a3)
  {
    self->_viewScale = a3;
    -[AEAnnotationMarker p_updateLayerDimensions](self, "p_updateLayerDimensions");
  }
}

- (id)actionForLayer:(id)a3 forKey:(id)a4
{
  return +[NSNull null](NSNull, "null", a3, a4);
}

+ (double)borderWidthForScale:(double)a3
{
  if (a3 == 0.0)
    return 1.0;
  else
    return 1.0 / a3;
}

- (double)p_borderWidth
{
  double result;

  +[AEAnnotationMarker borderWidthForScale:](AEAnnotationMarker, "borderWidthForScale:", self->_contentScale);
  return result;
}

- (BOOL)p_hasBorder
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  BOOL v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationMarker overrideHasBorder](self, "overrideHasBorder"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[AEAnnotationMarker overrideHasBorder](self, "overrideHasBorder"));
    v5 = objc_msgSend(v4, "BOOLValue");
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotationTheme themeForAnnotationStyle:pageTheme:isUnderline:](AEAnnotationTheme, "themeForAnnotationStyle:pageTheme:isUnderline:"));
    v5 = objc_msgSend(v4, "noteMarkerHasBorder");
  }
  v6 = v5;

  return v6;
}

- (id)p_markerColor:(id)a3 withEffect:(int)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  v6 = v5;
  v7 = v5;
  if (a4 == 1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bc_darkenedColorByFactor:", 0.2));

  }
  return v7;
}

- (void)p_updateLayerDimensions
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double viewScale;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGPath *Mutable;
  CGFloat MaxX;
  CGFloat MinY;
  CGFloat MinX;
  CGFloat MaxY;
  CGAffineTransform v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  +[CATransaction begin](CATransaction, "begin");
  +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
  -[AEAnnotationMarker imageSize](self, "imageSize");
  v4 = v3;
  v6 = v5;
  -[AEAnnotationMarker p_borderWidth](self, "p_borderWidth");
  v8 = v7;
  viewScale = self->_viewScale;
  if (viewScale > 0.0 && viewScale != 1.0)
  {
    memset(&v19, 0, sizeof(v19));
    CGAffineTransformMakeScale(&v19, viewScale, viewScale);
    v11 = v6 * v19.d + v19.b * v4;
    v4 = round(v6 * v19.c + v19.a * v4);
    v6 = round(v11);
  }
  -[CALayer setBounds:](self->_layer, "setBounds:", 0.0, 0.0, v4, v6);
  -[CALayer setBorderWidth:](self->_layer, "setBorderWidth:", v8);
  if (self->_strikethrough)
  {
    v12 = v4 - (v8 + v8);
    v13 = v6 - (v8 + v8);
    Mutable = CGPathCreateMutable();
    v20.origin.x = v8;
    v20.origin.y = v8;
    v20.size.width = v12;
    v20.size.height = v13;
    MaxX = CGRectGetMaxX(v20);
    v21.origin.x = v8;
    v21.origin.y = v8;
    v21.size.width = v12;
    v21.size.height = v13;
    MinY = CGRectGetMinY(v21);
    CGPathMoveToPoint(Mutable, 0, MaxX, MinY);
    v22.origin.x = v8;
    v22.origin.y = v8;
    v22.size.width = v12;
    v22.size.height = v13;
    MinX = CGRectGetMinX(v22);
    v23.origin.x = v8;
    v23.origin.y = v8;
    v23.size.width = v12;
    v23.size.height = v13;
    MaxY = CGRectGetMaxY(v23);
    CGPathAddLineToPoint(Mutable, 0, MinX, MaxY);
    -[CAShapeLayer setPath:](self->_strikethroughLayer, "setPath:", Mutable);
    -[CAShapeLayer setLineWidth:](self->_strikethroughLayer, "setLineWidth:", 1.0);
    CGPathRelease(Mutable);
  }
  +[CATransaction commit](CATransaction, "commit");
}

- (void)p_updateLayerColors
{
  uint64_t v3;
  void *v4;
  unint64_t pageTheme;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;

  v3 = -[AEAnnotationMarker effect](self, "effect");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[AEAnnotationTheme themeForAnnotationStyle:pageTheme:isUnderline:](AEAnnotationTheme, "themeForAnnotationStyle:pageTheme:isUnderline:"));
  if (v4)
  {
    v14 = v4;
    +[CATransaction begin](CATransaction, "begin");
    +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
    pageTheme = self->_pageTheme;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "noteMarkerFillColor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bkaxAdjustedForIncreaseContrastAdjustingDarker:", pageTheme < 2));
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[AEAnnotationMarker p_markerColor:withEffect:](self, "p_markerColor:withEffect:", v7, v3)));
    -[CALayer setBackgroundColor:](self->_layer, "setBackgroundColor:", objc_msgSend(v8, "CGColor"));

    if (-[AEAnnotationMarker p_hasBorder](self, "p_hasBorder"))
    {
      v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "noteMarkerBorderColor"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bkaxAdjustedForIncreaseContrastAdjustingDarker:", pageTheme < 2));
      v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[AEAnnotationMarker p_markerColor:withEffect:](self, "p_markerColor:withEffect:", v10, v3)));
      -[CALayer setBorderColor:](self->_layer, "setBorderColor:", objc_msgSend(v11, "CGColor"));

    }
    else
    {
      v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor")));
      -[CALayer setBorderColor:](self->_layer, "setBorderColor:", objc_msgSend(v9, "CGColor"));
    }

    -[CALayer setCornerRadius:](self->_layer, "setCornerRadius:", 4.0);
    -[CALayer setCornerCurve:](self->_layer, "setCornerCurve:", kCACornerCurveContinuous);
    if (self->_strikethrough)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "noteMarkerStrikethroughColor"));
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[AEAnnotationMarker p_markerColor:withEffect:](self, "p_markerColor:withEffect:", v12, v3)));
      -[CAShapeLayer setStrokeColor:](self->_strikethroughLayer, "setStrokeColor:", objc_msgSend(v13, "CGColor"));

    }
    +[CATransaction commit](CATransaction, "commit");
    v4 = v14;
  }

}

- (CALayer)layer
{
  return self->_layer;
}

- (int)effect
{
  return self->_effect;
}

- (double)contentScale
{
  return self->_contentScale;
}

- (double)viewScale
{
  return self->_viewScale;
}

- (int)style
{
  return self->_style;
}

- (int64_t)pageTheme
{
  return self->_pageTheme;
}

- (BOOL)strikethrough
{
  return self->_strikethrough;
}

- (UIEdgeInsets)edgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_edgeInsets.top;
  left = self->_edgeInsets.left;
  bottom = self->_edgeInsets.bottom;
  right = self->_edgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  self->_edgeInsets = a3;
}

- (CAShapeLayer)strikethroughLayer
{
  return self->_strikethroughLayer;
}

- (NSNumber)overrideHasBorder
{
  return self->_overrideHasBorder;
}

- (void)setOverrideHasBorder:(id)a3
{
  objc_storeStrong((id *)&self->_overrideHasBorder, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideHasBorder, 0);
  objc_storeStrong((id *)&self->_strikethroughLayer, 0);
  objc_storeStrong((id *)&self->_layer, 0);
}

@end
