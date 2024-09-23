@implementation THWInteractiveImageCalloutRep

- (void)dealloc
{
  objc_super v3;

  -[CAShapeLayer removeFromSuperlayer](self->_line, "removeFromSuperlayer");

  -[CALayer removeFromSuperlayer](self->_targetShadow, "removeFromSuperlayer");
  -[CALayer removeFromSuperlayer](self->_lineShadow, "removeFromSuperlayer");

  -[CAGradientLayer removeFromSuperlayer](self->_gradientLayer, "removeFromSuperlayer");
  -[CALayer removeFromSuperlayer](self->_shadowLayer, "removeFromSuperlayer");

  v3.receiver = self;
  v3.super_class = (Class)THWInteractiveImageCalloutRep;
  -[THWInteractiveImageCalloutRep dealloc](&v3, "dealloc");
}

- (CGPoint)targetPoint
{
  double v2;
  double v3;
  CGPoint result;

  objc_msgSend(objc_msgSend(-[THWInteractiveImageCalloutRep layout](self, "layout"), "calloutInfo"), "targetPoint");
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)sourcePoint
{
  double v2;
  double v3;
  CGPoint result;

  objc_msgSend(objc_msgSend(-[THWInteractiveImageCalloutRep layout](self, "layout"), "calloutInfo"), "sourcePoint");
  result.y = v3;
  result.x = v2;
  return result;
}

- (BOOL)directlyManagesLayerContent
{
  return 1;
}

- (void)setVisible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  id v7;
  void *v8;
  id v9;
  double v10;
  id v11;
  double v12;

  v4 = a4;
  v5 = a3;
  v7 = -[THWInteractiveImageCalloutRep interactiveCanvasController](self, "interactiveCanvasController");
  v8 = v7;
  if (v4)
  {
    objc_msgSend(v7, "beginAnimations:context:", CFSTR("callout opacity"), 0);
    objc_msgSend(v8, "setAnimationDuration:", 0.25);
    v9 = objc_msgSend(v8, "layerForRep:", self);
    LODWORD(v10) = 0;
    if (v5)
      *(float *)&v10 = 1.0;
    objc_msgSend(v9, "setOpacity:", v10);
    objc_msgSend(v8, "commitAnimations");
  }
  else
  {
    v11 = objc_msgSend(v7, "layerForRep:", self);
    LODWORD(v12) = 0;
    if (v5)
      *(float *)&v12 = 1.0;
    objc_msgSend(v11, "setOpacity:", v12);
  }
}

- (void)updateFromLayout
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWInteractiveImageCalloutRep;
  -[THWInteractiveImageCalloutRep updateFromLayout](&v3, "updateFromLayout");
  -[THWInteractiveImageCalloutRep p_updateGradient](self, "p_updateGradient");
  -[THWInteractiveImageCalloutRep p_updateShadow](self, "p_updateShadow");
  -[THWInteractiveImageCalloutRep p_updateLineAndShadows](self, "p_updateLineAndShadows");
  -[THWInteractiveImageCalloutRep p_layoutLine](self, "p_layoutLine");
}

- (void)didUpdateLayer:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THWInteractiveImageCalloutRep;
  -[THWInteractiveImageCalloutRep didUpdateLayer:](&v4, "didUpdateLayer:", a3);
  -[THWInteractiveImageCalloutRep p_updateGradientColors](self, "p_updateGradientColors");
}

- (void)addAdditionalChildBackgroundLayersToArray:(id)a3
{
  if (self->_targetShadow)
    objc_msgSend(a3, "addObject:");
  if (self->_lineShadow)
    objc_msgSend(a3, "addObject:");
  if (self->_line)
    objc_msgSend(a3, "addObject:");
  if (self->_shadowLayer)
    objc_msgSend(a3, "addObject:");
  if (self->_gradientLayer)
    objc_msgSend(a3, "addObject:");
}

- (id)p_host
{
  return objc_msgSend(-[THWInteractiveImageCalloutRep interactiveCanvasController](self, "interactiveCanvasController"), "ancestorRepOfRep:orDelegateConformingToProtocol:", self, &OBJC_PROTOCOL___THWInteractiveImageCalloutHosting);
}

- (void)p_updatedHovering
{
  objc_msgSend(-[THWInteractiveImageCalloutRep p_host](self, "p_host"), "interactiveImageCalloutUpdatedHovering:", self);
}

- (void)screenScaleDidChange
{
  double v3;
  double v4;

  objc_msgSend(-[THWInteractiveImageCalloutRep canvas](self, "canvas"), "contentsScale");
  v4 = v3;
  -[CAGradientLayer setContentsScale:](self->_gradientLayer, "setContentsScale:");
  -[CALayer setContentsScale:](self->_shadowLayer, "setContentsScale:", v4);
  -[THWInteractiveImageCalloutRep p_updateLineAndShadows](self, "p_updateLineAndShadows");
}

- (void)p_updateShadow
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
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
  double v36;
  double v37;
  double v38;
  CALayer *shadowLayer;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  CALayer *v44;
  double v45;
  double v46;
  double v47;
  CGFloat v49;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  double v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  CATransform3D v62;
  CATransform3D v63;
  _OWORD v64[8];
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;

  if (self->_shadowLayer)
    goto LABEL_3;
  self->_shadowLayer = (CALayer *)objc_alloc_init((Class)TSDNoDefaultImplicitActionGradientLayer);
  -[CALayer setDelegate:](self->_shadowLayer, "setDelegate:", -[THWInteractiveImageCalloutRep interactiveCanvasController](self, "interactiveCanvasController"));
  objc_msgSend(-[THWInteractiveImageCalloutRep canvas](self, "canvas"), "contentsScale");
  -[CALayer setContentsScale:](self->_shadowLayer, "setContentsScale:");
  -[CALayer setShadowOffset:](self->_shadowLayer, "setShadowOffset:", 0.0, 1.0);
  LODWORD(v3) = 1058642330;
  -[CALayer setShadowOpacity:](self->_shadowLayer, "setShadowOpacity:", v3);
  -[CALayer setShadowRadius:](self->_shadowLayer, "setShadowRadius:", 2.0);
  -[CALayer setShadowColor:](self->_shadowLayer, "setShadowColor:", objc_msgSend(objc_msgSend(+[TSUColor blackColor](TSUColor, "blackColor"), "colorWithAlphaComponent:", 0.5), "CGColor"));
  if (self->_shadowLayer)
  {
LABEL_3:
    objc_msgSend(-[THWInteractiveImageCalloutRep layout](self, "layout"), "backgroundRectTitleOnly");
    -[THWInteractiveImageCalloutRep convertNaturalRectToLayerRelative:](self, "convertNaturalRectToLayerRelative:");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    objc_msgSend(-[THWInteractiveImageCalloutRep canvas](self, "canvas"), "contentsScale");
    v13 = TSDRoundedRectForScale(v5, v7, v9, v11, v12);
    v60 = v14;
    v61 = v13;
    v16 = v15;
    v18 = v17;
    objc_msgSend(-[THWInteractiveImageCalloutRep layout](self, "layout"), "backgroundRect");
    -[THWInteractiveImageCalloutRep convertNaturalRectToLayerRelative:](self, "convertNaturalRectToLayerRelative:");
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;
    objc_msgSend(-[THWInteractiveImageCalloutRep canvas](self, "canvas"), "contentsScale");
    v28 = TSDRoundedRectForScale(v20, v22, v24, v26, v27);
    v30 = v29;
    v32 = v31;
    v34 = v33;
    -[CALayer bounds](self->_shadowLayer, "bounds");
    v36 = v35;
    v38 = v37;
    shadowLayer = self->_shadowLayer;
    v40 = *(_OWORD *)&CATransform3DIdentity.m33;
    v64[4] = *(_OWORD *)&CATransform3DIdentity.m31;
    v64[5] = v40;
    v41 = *(_OWORD *)&CATransform3DIdentity.m43;
    v64[6] = *(_OWORD *)&CATransform3DIdentity.m41;
    v64[7] = v41;
    v42 = *(_OWORD *)&CATransform3DIdentity.m13;
    v64[0] = *(_OWORD *)&CATransform3DIdentity.m11;
    v64[1] = v42;
    v43 = *(_OWORD *)&CATransform3DIdentity.m23;
    v64[2] = *(_OWORD *)&CATransform3DIdentity.m21;
    v64[3] = v43;
    -[CALayer setTransform:](shadowLayer, "setTransform:", v64);
    v44 = self->_shadowLayer;
    v45 = TSDCenterOfRect(v28, v30, v32, v34);
    -[CALayer setFrame:](v44, "setFrame:", TSDRectWithCenterAndSize(v45));
    -[CALayer bounds](self->_shadowLayer, "bounds");
    if (v36 != v47 || v38 != v46)
    {
      v65.origin.x = TSDRectWithSize(-[CALayer bounds](self->_shadowLayer, "bounds"));
      v66 = CGRectInset(v65, 2.0 * -0.5, 2.0 * -0.5);
      -[CALayer setShadowPath:](self->_shadowLayer, "setShadowPath:", -[TSDBezierPath CGPath](+[TSDBezierPath bezierPathWithRoundedRect:cornerRadius:](TSDBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v66.origin.x, v66.origin.y, v66.size.width, v66.size.height, 4.0), "CGPath"));
    }
    v49 = -(2.0 * 0.5 + 2.0);
    v67.origin.x = v28;
    v67.origin.y = v30;
    v67.size.width = v32;
    v67.size.height = v34;
    v68 = CGRectInset(v67, v49, v49);
    x = v68.origin.x;
    y = v68.origin.y;
    width = v68.size.width;
    height = v68.size.height;
    v68.origin.y = v60;
    v68.origin.x = v61;
    v68.size.width = v16;
    v68.size.height = v18;
    v69 = CGRectInset(v68, v49, v49);
    v54 = v69.origin.x;
    v55 = v69.origin.y;
    v56 = v69.size.width;
    v57 = v69.size.height;
    memset(&v63, 0, sizeof(v63));
    v69.origin.x = x;
    v69.origin.y = y;
    v69.size.width = width;
    v69.size.height = height;
    v58 = CGRectGetHeight(v69);
    v70.origin.x = v54;
    v70.origin.y = v55;
    v70.size.width = v56;
    v70.size.height = v57;
    v59 = CGRectGetHeight(v70);
    CATransform3DMakeScale(&v63, 1.0, v58 / v59, 1.0);
    v62 = v63;
    -[CALayer setTransform:](self->_shadowLayer, "setTransform:", &v62);
  }
}

- (void)p_updateGradientColors
{
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  CAGradientLayer *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  TSUColor *v11;
  double v12;
  double v13;

  v3 = objc_msgSend(-[THWInteractiveImageCalloutRep layout](self, "layout"), "highlighted");
  v4 = objc_msgSend(-[THWInteractiveImageCalloutRep layout](self, "layout"), "titleOnly");
  v5 = v4;
  if (!v3)
  {
    if (v4 && objc_msgSend(-[THWInteractiveImageCalloutRep layout](self, "layout"), "selected"))
    {
      v6 = -[THWInteractiveImageCalloutRep gradientLayer](self, "gradientLayer");
      v7 = -[TSUColor CGColor](+[TSUColor colorWithRed:green:blue:alpha:](TSUColor, "colorWithRed:green:blue:alpha:", 0.0, 0.478431373, 1.0, 1.0), "CGColor");
      v10 = 1.0;
      v8 = 1.0;
      v9 = 0.478431373;
      goto LABEL_7;
    }
    v6 = -[THWInteractiveImageCalloutRep gradientLayer](self, "gradientLayer");
    v7 = -[TSUColor CGColor](+[TSUColor colorWithWhite:alpha:](TSUColor, "colorWithWhite:alpha:", 1.0, 1.0), "CGColor");
    v12 = 1.0;
    v13 = 1.0;
LABEL_10:
    v11 = +[TSUColor colorWithWhite:alpha:](TSUColor, "colorWithWhite:alpha:", v12, v13);
    goto LABEL_11;
  }
  v6 = -[THWInteractiveImageCalloutRep gradientLayer](self, "gradientLayer");
  if (!v5)
  {
    v7 = -[TSUColor CGColor](+[TSUColor colorWithWhite:alpha:](TSUColor, "colorWithWhite:alpha:", 0.850980392, 1.0), "CGColor");
    v13 = 1.0;
    v12 = 0.850980392;
    goto LABEL_10;
  }
  v7 = -[TSUColor CGColor](+[TSUColor colorWithRed:green:blue:alpha:](TSUColor, "colorWithRed:green:blue:alpha:", 0.0, 0.392156863, 0.819607843, 1.0), "CGColor");
  v8 = 1.0;
  v9 = 0.392156863;
  v10 = 0.819607843;
LABEL_7:
  v11 = +[TSUColor colorWithRed:green:blue:alpha:](TSUColor, "colorWithRed:green:blue:alpha:", 0.0, v9, v10, v8);
LABEL_11:
  -[CAGradientLayer setColors:](v6, "setColors:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v7, -[TSUColor CGColor](v11, "CGColor"), 0));
}

- (BOOL)p_animatingCallouts
{
  return objc_msgSend(-[THWInteractiveImageCalloutRep p_host](self, "p_host"), "interactiveImageCalloutIsAnimating:", self);
}

- (double)p_zoomDuration
{
  double result;

  objc_msgSend(-[THWInteractiveImageCalloutRep p_host](self, "p_host"), "interactiveImageCalloutZoomAnimationDuration:", self);
  return result;
}

- (void)p_updateGradient
{
  CAGradientLayer *gradientLayer;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  if (!self->_gradientLayer)
  {
    self->_gradientLayer = (CAGradientLayer *)objc_alloc_init((Class)TSDNoDefaultImplicitActionGradientLayer);
    -[CAGradientLayer setDelegate:](self->_gradientLayer, "setDelegate:", -[THWInteractiveImageCalloutRep interactiveCanvasController](self, "interactiveCanvasController"));
    -[CAGradientLayer setLocations:](self->_gradientLayer, "setLocations:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.0), +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 1.0), 0));
    -[CAGradientLayer setMasksToBounds:](self->_gradientLayer, "setMasksToBounds:", 0);
    gradientLayer = self->_gradientLayer;
    objc_msgSend(-[THWInteractiveImageCalloutRep canvas](self, "canvas"), "contentsScale");
    -[CAGradientLayer setContentsScale:](gradientLayer, "setContentsScale:");
    -[CAGradientLayer setCornerRadius:](self->_gradientLayer, "setCornerRadius:", 4.0);
    -[CAGradientLayer setBorderWidth:](self->_gradientLayer, "setBorderWidth:", 2.0);
    -[CAGradientLayer setBorderColor:](self->_gradientLayer, "setBorderColor:", -[TSUColor CGColor](+[TSUColor colorWithWhite:alpha:](TSUColor, "colorWithWhite:alpha:", 0.929411765, 1.0), "CGColor"));
    -[CAGradientLayer setAnchorPoint:](self->_gradientLayer, "setAnchorPoint:", 0.5, 0.0);
  }
  -[THWInteractiveImageCalloutRep p_updateGradientColors](self, "p_updateGradientColors");
  if (self->_gradientLayer)
  {
    objc_msgSend(-[THWInteractiveImageCalloutRep layout](self, "layout"), "backgroundRect");
    -[THWInteractiveImageCalloutRep convertNaturalRectToLayerRelative:](self, "convertNaturalRectToLayerRelative:");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    objc_msgSend(-[THWInteractiveImageCalloutRep canvas](self, "canvas"), "contentsScale");
    -[CAGradientLayer setFrame:](self->_gradientLayer, "setFrame:", TSDRoundedRectForScale(v5, v7, v9, v11, v12));
    -[CAGradientLayer setContentsGravity:](self->_gradientLayer, "setContentsGravity:", kCAGravityBottom);
  }
}

- (id)p_delayedAnimationForLayer:(id)a3 withEvent:(id)a4
{
  double v6;
  double v7;
  double v8;
  CABasicAnimation *v9;

  if ((objc_msgSend(-[THWInteractiveImageCalloutRep layout](self, "layout", a3), "titleOnly") & 1) != 0
    || !objc_msgSend(-[THWInteractiveImageCalloutRep layout](self, "layout"), "selected")
    || !-[THWInteractiveImageCalloutRep p_animatingCallouts](self, "p_animatingCallouts"))
  {
    return 0;
  }
  -[THWInteractiveImageCalloutRep p_zoomDuration](self, "p_zoomDuration");
  v7 = v6;
  v8 = -0.224999994 / v6 + 1.0;
  v9 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", a4);
  -[CABasicAnimation setBeginTime:](v9, "setBeginTime:", v7 * v8);
  -[CABasicAnimation setBeginTimeMode:](v9, "setBeginTimeMode:", kCAAnimationRelative);
  -[CABasicAnimation setFillMode:](v9, "setFillMode:", kCAFillModeBoth);
  -[CABasicAnimation setDuration:](v9, "setDuration:", v7 * (1.0 - v8));
  return v9;
}

- (void)p_updateLineAndShadows
{
  double v3;
  double v4;
  CALayer *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CALayer *v12;
  double v13;
  CAShapeLayer *v14;
  CGRect v15;
  CGRect v16;

  objc_msgSend(-[THWInteractiveImageCalloutRep canvas](self, "canvas"), "viewScale");
  v4 = v3;
  v5 = -[THWInteractiveImageCalloutRep targetShadow](self, "targetShadow");
  if (!v5)
    v5 = (CALayer *)+[TSDNoDefaultImplicitActionLayer layer](TSDNoDefaultImplicitActionLayer, "layer");
  v6 = +[TSUImage imageNamed:inBundle:](TSUImage, "imageNamed:inBundle:", CFSTR("circle-shadow"), THBundle());
  objc_msgSend(-[THWInteractiveImageCalloutRep canvas](self, "canvas"), "contentsScale");
  v8 = v7;
  -[CALayer setContents:](v5, "setContents:", objc_msgSend(v6, "CGImageForContentsScale:"));
  -[CALayer setContentsScale:](v5, "setContentsScale:", v8);
  objc_msgSend(v6, "size");
  v10 = v9;
  objc_msgSend(v6, "size");
  -[CALayer setBounds:](v5, "setBounds:", 0.0, 0.0, v10, v11);
  v12 = -[THWInteractiveImageCalloutRep lineShadow](self, "lineShadow");
  if (!v12)
    v12 = (CALayer *)+[TSDNoDefaultImplicitActionLayer layer](TSDNoDefaultImplicitActionLayer, "layer");
  -[CALayer setBounds:](v12, "setBounds:", 0.0, 0.0, 10.0, 6.0);
  -[CALayer setShadowColor:](v12, "setShadowColor:", objc_msgSend(+[TSUColor blackColor](TSUColor, "blackColor"), "CGColor"));
  -[CALayer setShadowOffset:](v12, "setShadowOffset:", 0.0, 0.0);
  LODWORD(v13) = 0.5;
  -[CALayer setShadowOpacity:](v12, "setShadowOpacity:", v13);
  -[CALayer setShadowRadius:](v12, "setShadowRadius:", v4);
  -[CALayer bounds](v12, "bounds");
  v16 = CGRectInset(v15, -2.0, 2.0);
  TSDScaleRectAroundPoint((__n128)v16.origin, *(__n128 *)&v16.origin.y, (__n128)v16.size, *(__n128 *)&v16.size.height, CGPointZero.x, CGPointZero.y, v4);
  -[CALayer setShadowPath:](v12, "setShadowPath:", -[TSDBezierPath CGPath](+[TSDBezierPath bezierPathWithRect:](TSDBezierPath, "bezierPathWithRect:"), "CGPath"));
  -[CALayer setMasksToBounds:](v12, "setMasksToBounds:", 1);
  v14 = -[THWInteractiveImageCalloutRep line](self, "line");
  if (!v14)
    v14 = (CAShapeLayer *)+[TSDNoDefaultImplicitActionShapeLayer layer](TSDNoDefaultImplicitActionShapeLayer, "layer");
  -[CAShapeLayer setStrokeColor:](v14, "setStrokeColor:", objc_msgSend(+[TSUColor whiteColor](TSUColor, "whiteColor"), "CGColor"));
  -[CAShapeLayer setFillColor:](v14, "setFillColor:", 0);
  -[CAShapeLayer setLineWidth:](v14, "setLineWidth:", v4 + v4);
  -[CAShapeLayer setBackgroundColor:](v14, "setBackgroundColor:", objc_msgSend(objc_msgSend(+[TSUColor redColor](TSUColor, "redColor"), "colorWithAlphaComponent:", 0.5), "CGColor"));
  -[THWInteractiveImageCalloutRep setLine:](self, "setLine:", v14);
  -[THWInteractiveImageCalloutRep setTargetShadow:](self, "setTargetShadow:", v5);
  -[THWInteractiveImageCalloutRep setLineShadow:](self, "setLineShadow:", v12);
}

- (void)p_layoutLine
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  CGFloat v35;
  CGPath *Mutable;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  float v41;
  float v42;
  float v43;
  __n128 v44;
  __n128 v45;
  double v46;
  double v47;
  const CGPath *v48;
  CALayer *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  id v58;
  id v59;
  id v60;
  CGFloat rect;
  CGFloat v62;
  double v63;
  double v64;
  double v65;
  CATransform3D v66[2];
  CATransform3D v67[2];
  CATransform3D b;
  CATransform3D a;
  CATransform3D v70;
  CATransform3D v71;
  CGRect v72;

  v3 = -[THWInteractiveImageCalloutRep p_host](self, "p_host");
  -[THWInteractiveImageCalloutRep targetPoint](self, "targetPoint");
  objc_msgSend(v3, "interactiveImageCallout:convertContentPointToUnscaledOverlayPoint:", self);
  v5 = v4;
  v7 = v6;
  -[THWInteractiveImageCalloutRep sourcePoint](self, "sourcePoint");
  objc_msgSend(v3, "interactiveImageCallout:convertContentPointToUnscaledOverlayPoint:", self);
  v9 = v8;
  v11 = v10;
  -[THWInteractiveImageCalloutRep convertUnscaledPointToLayerRelative:](self, "convertUnscaledPointToLayerRelative:", v5, v7);
  v13 = v12;
  v15 = v14;
  -[THWInteractiveImageCalloutRep convertUnscaledPointToLayerRelative:](self, "convertUnscaledPointToLayerRelative:", v9, v11);
  v17 = v16;
  v62 = v18;
  objc_msgSend(-[THWInteractiveImageCalloutRep canvas](self, "canvas"), "viewScale");
  v20 = v19 * 4.0;
  v21 = v20 + v20;
  v22 = (v20 + v20) * 0.5;
  v23 = v13 - v22;
  rect = v15 - v22;
  -[THWInteractiveImageCalloutRep targetPoint](self, "targetPoint");
  v25 = v24;
  -[THWInteractiveImageCalloutRep sourcePoint](self, "sourcePoint");
  v27 = v25 - v26;
  -[THWInteractiveImageCalloutRep targetPoint](self, "targetPoint");
  v29 = v28;
  -[THWInteractiveImageCalloutRep sourcePoint](self, "sourcePoint");
  v31 = v29 - v30;
  v32 = sqrt(v27 * v27 + v31 * v31);
  v63 = v31 / v32;
  v64 = v27 / v32;
  v33 = v20;
  v65 = v20;
  v34 = v13 - v27 / v32 * v20;
  v35 = v15 - v63 * v33;
  Mutable = CGPathCreateMutable();
  CGPathMoveToPoint(Mutable, 0, v17, v62);
  CGPathAddLineToPoint(Mutable, 0, v34, v35);
  v72.origin.x = v23;
  v72.origin.y = rect;
  v72.size.width = v21;
  v72.size.height = v21;
  CGPathAddEllipseInRect(Mutable, 0, v72);
  v37 = *(_OWORD *)&CATransform3DIdentity.m33;
  *(_OWORD *)&v71.m31 = *(_OWORD *)&CATransform3DIdentity.m31;
  *(_OWORD *)&v71.m33 = v37;
  v38 = *(_OWORD *)&CATransform3DIdentity.m43;
  *(_OWORD *)&v71.m41 = *(_OWORD *)&CATransform3DIdentity.m41;
  *(_OWORD *)&v71.m43 = v38;
  v39 = *(_OWORD *)&CATransform3DIdentity.m13;
  *(_OWORD *)&v71.m11 = *(_OWORD *)&CATransform3DIdentity.m11;
  *(_OWORD *)&v71.m13 = v39;
  v40 = *(_OWORD *)&CATransform3DIdentity.m23;
  *(_OWORD *)&v71.m21 = *(_OWORD *)&CATransform3DIdentity.m21;
  *(_OWORD *)&v71.m23 = v40;
  *(_OWORD *)&v70.m31 = *(_OWORD *)&v71.m31;
  *(_OWORD *)&v70.m33 = v37;
  *(_OWORD *)&v70.m41 = *(_OWORD *)&v71.m41;
  *(_OWORD *)&v70.m43 = v38;
  *(_OWORD *)&v70.m11 = *(_OWORD *)&v71.m11;
  *(_OWORD *)&v70.m13 = v39;
  *(_OWORD *)&v70.m21 = *(_OWORD *)&v71.m21;
  *(_OWORD *)&v70.m23 = v40;
  CATransform3DTranslate(&v71, &v70, 0.0, 1.0, 0.0);
  a = v71;
  CATransform3DTranslate(&v70, &a, (v17 + v34) * 0.5, (v62 + v35) * 0.5, 0.0);
  v71 = v70;
  v41 = v63;
  v42 = v64;
  v43 = atan2f(v41, v42);
  a = v71;
  CATransform3DRotate(&v70, &a, v43, 0.0, 0.0, 1.0);
  v71 = v70;
  v44.n128_u64[1] = *(_QWORD *)&v70.m22;
  v45.n128_u64[1] = *(_QWORD *)&v70.m24;
  v44.n128_f64[0] = v13;
  v45.n128_f64[0] = v15;
  v46 = TSDSubtractPoints(v44, v45, v17, v62);
  a = v71;
  CATransform3DScale(&v70, &a, (sqrt(v47 * v47 + v46 * v46) - v65) / 10.0, 1.0, 1.0);
  v71 = v70;
  if (-[THWInteractiveImageCalloutRep p_animatingCallouts](self, "p_animatingCallouts")
    && -[CAShapeLayer path](-[THWInteractiveImageCalloutRep line](self, "line"), "path"))
  {
    v48 = CGPathRetain(-[CAShapeLayer path](-[THWInteractiveImageCalloutRep line](self, "line"), "path"));
    memset(&v70, 0, sizeof(v70));
    v49 = -[THWInteractiveImageCalloutRep lineShadow](self, "lineShadow");
    if (v49)
      -[CALayer transform](v49, "transform");
    else
      memset(&v70, 0, sizeof(v70));
    -[CALayer position](-[THWInteractiveImageCalloutRep targetShadow](self, "targetShadow"), "position");
    v52 = v51;
    v53 = v50;
    if (v51 != v13
      || v50 != v15
      || (a = v70, b = v71, !CATransform3DEqualToTransform(&a, &b))
      || !CGPathEqualToPath(v48, Mutable))
    {
      -[CAShapeLayer setPath:](-[THWInteractiveImageCalloutRep line](self, "line"), "setPath:", Mutable);
      v67[1] = v71;
      v67[0] = v71;
      -[CALayer setTransform:](-[THWInteractiveImageCalloutRep lineShadow](self, "lineShadow"), "setTransform:", v67);
      -[CALayer setPosition:](-[THWInteractiveImageCalloutRep targetShadow](self, "targetShadow"), "setPosition:", v13, v15);
      -[THWInteractiveImageCalloutRep p_zoomDuration](self, "p_zoomDuration");
      v55 = v54;
      objc_msgSend(-[THWInteractiveImageCalloutRep interactiveCanvasController](self, "interactiveCanvasController"), "animationBeginTime");
      v57 = v56;
      v58 = +[CABasicAnimation animation](CABasicAnimation, "animation");
      objc_msgSend(v58, "setDelegate:", 0);
      objc_msgSend(v58, "setKeyPath:", CFSTR("path"));
      objc_msgSend(v58, "setFromValue:", v48);
      objc_msgSend(v58, "setToValue:", Mutable);
      objc_msgSend(v58, "setBeginTime:", v57);
      objc_msgSend(v58, "setDuration:", v55);
      objc_msgSend(v58, "setTimingFunction:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut));
      objc_msgSend(v58, "setFillMode:", kCAFillModeBoth);
      -[CAShapeLayer addAnimation:forKey:](-[THWInteractiveImageCalloutRep line](self, "line"), "addAnimation:forKey:", v58, CFSTR("path"));
      v59 = +[CABasicAnimation animation](CABasicAnimation, "animation");
      objc_msgSend(v59, "setDelegate:", 0);
      objc_msgSend(v59, "setKeyPath:", CFSTR("transform"));
      a = v70;
      objc_msgSend(v59, "setFromValue:", +[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", &a));
      a = v71;
      objc_msgSend(v59, "setToValue:", +[NSValue valueWithCATransform3D:](NSValue, "valueWithCATransform3D:", &a));
      objc_msgSend(v59, "setBeginTime:", v57);
      objc_msgSend(v59, "setDuration:", v55);
      objc_msgSend(v59, "setTimingFunction:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut));
      objc_msgSend(v59, "setFillMode:", kCAFillModeBoth);
      -[CALayer addAnimation:forKey:](-[THWInteractiveImageCalloutRep lineShadow](self, "lineShadow"), "addAnimation:forKey:", v59, CFSTR("transform"));
      v60 = +[CABasicAnimation animation](CABasicAnimation, "animation");
      objc_msgSend(v60, "setDelegate:", 0);
      objc_msgSend(v60, "setKeyPath:", CFSTR("position"));
      objc_msgSend(v60, "setFromValue:", +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v52, v53));
      objc_msgSend(v60, "setToValue:", +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v13, v15));
      objc_msgSend(v60, "setBeginTime:", v57);
      objc_msgSend(v60, "setDuration:", v55);
      objc_msgSend(v60, "setTimingFunction:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut));
      objc_msgSend(v60, "setFillMode:", kCAFillModeBoth);
      -[CALayer addAnimation:forKey:](-[THWInteractiveImageCalloutRep targetShadow](self, "targetShadow"), "addAnimation:forKey:", v60, CFSTR("position"));
    }
    CGPathRelease(v48);
  }
  else
  {
    -[CAShapeLayer setPath:](-[THWInteractiveImageCalloutRep line](self, "line"), "setPath:", Mutable);
    v66[1] = v71;
    v66[0] = v71;
    -[CALayer setTransform:](-[THWInteractiveImageCalloutRep lineShadow](self, "lineShadow"), "setTransform:", v66);
    -[CALayer setPosition:](-[THWInteractiveImageCalloutRep targetShadow](self, "targetShadow"), "setPosition:", v13, v15);
  }
  CGPathRelease(Mutable);
}

- (void)control:(id)a3 repWasAdded:(id)a4
{
  uint64_t v6;
  double v7;
  id v8;

  v6 = objc_opt_class(THWControlContainerRep);
  *(_QWORD *)&v7 = TSUDynamicCast(v6, a4).n128_u64[0];
  objc_msgSend(v8, "setDelegate:", self, v7);
}

- (void)control:(id)a3 repWillBeRemoved:(id)a4
{
  uint64_t v5;
  double v6;
  id v7;

  v5 = objc_opt_class(THWControlContainerRep);
  *(_QWORD *)&v6 = TSUDynamicCast(v5, a4).n128_u64[0];
  objc_msgSend(v7, "setDelegate:", 0, v6);
}

- (BOOL)controlContainerMasksToBounds:(id)a3
{
  return 1;
}

- (BOOL)canHandleGesture:(id)a3
{
  id v3;

  v3 = objc_msgSend(a3, "gestureKind");
  return v3 == (id)TSWPImmediatePress;
}

- (BOOL)handleGesture:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  id v9;
  id v11;

  switch(objc_msgSend(a3, "gestureState"))
  {
    case 1u:
      v5 = -[THWInteractiveImageCalloutRep layout](self, "layout");
      v6 = 1;
      goto LABEL_8;
    case 2u:
      if (objc_msgSend(-[THWInteractiveImageCalloutRep p_host](self, "p_host"), "interactiveImageCalloutIsScrollViewDragging:", self))
      {
        v7 = objc_opt_class(UIGestureRecognizer);
        *(_QWORD *)&v8 = TSUDynamicCast(v7, a3).n128_u64[0];
        objc_msgSend(v9, "cancel", v8);
LABEL_7:
        v5 = -[THWInteractiveImageCalloutRep layout](self, "layout");
        v6 = 0;
      }
      else
      {
        objc_msgSend(a3, "naturalLocationForRep:", self);
        v11 = -[THWInteractiveImageCalloutRep containsPoint:](self, "containsPoint:");
        v5 = -[THWInteractiveImageCalloutRep layout](self, "layout");
        v6 = (uint64_t)v11;
      }
LABEL_8:
      objc_msgSend(v5, "setHighlighted:", v6);
      return 1;
    case 3u:
      if (objc_msgSend(-[THWInteractiveImageCalloutRep layout](self, "layout"), "highlighted"))
      {
        objc_msgSend(-[THWInteractiveImageCalloutRep layout](self, "layout"), "setHighlighted:", 0);
        objc_msgSend(-[THWInteractiveImageCalloutRep p_host](self, "p_host"), "interactiveImageCalloutPressed:", self);
      }
      return 1;
    case 4u:
    case 5u:
      goto LABEL_7;
    default:
      return 1;
  }
}

- (id)animationForRepLayer:(id)a3 withEvent:(id)a4
{
  if (self->_gradientLayer == a3 && (objc_msgSend(a4, "isEqualToString:", CFSTR("bounds")) & 1) != 0
    || self->_shadowLayer == a3
    && ((objc_msgSend(a4, "isEqualToString:", CFSTR("transform")) & 1) != 0
     || objc_msgSend(a4, "isEqualToString:", CFSTR("position"))))
  {
    return -[THWInteractiveImageCalloutRep p_delayedAnimationForLayer:withEvent:](self, "p_delayedAnimationForLayer:withEvent:", a3, a4);
  }
  else
  {
    return 0;
  }
}

- (id)animationForChildRep:(id)a3 layer:(id)a4 withEvent:(id)a5
{
  if (((objc_msgSend(a5, "isEqualToString:", CFSTR("bounds")) & 1) != 0
     || objc_msgSend(a5, "isEqualToString:", CFSTR("position")))
    && objc_msgSend(a3, "parentRep") == self
    && objc_msgSend(-[THWInteractiveImageCalloutRep interactiveCanvasController](self, "interactiveCanvasController"), "layerForRep:", a3) == a4)
  {
    return -[THWInteractiveImageCalloutRep p_delayedAnimationForLayer:withEvent:](self, "p_delayedAnimationForLayer:withEvent:", a4, a5);
  }
  else
  {
    return 0;
  }
}

- (CAShapeLayer)line
{
  return self->_line;
}

- (void)setLine:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 288);
}

- (CALayer)targetShadow
{
  return self->_targetShadow;
}

- (void)setTargetShadow:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 296);
}

- (CALayer)lineShadow
{
  return self->_lineShadow;
}

- (void)setLineShadow:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 304);
}

- (CAGradientLayer)gradientLayer
{
  return self->_gradientLayer;
}

- (CALayer)shadowLayer
{
  return self->_shadowLayer;
}

- (BOOL)hovering
{
  return self->_hovering;
}

@end
