@implementation THWInteractiveImageSidebarRep

- (void)dealloc
{
  objc_super v3;

  -[CAGradientLayer setDelegate:](self->_gradientLayer, "setDelegate:", 0);

  v3.receiver = self;
  v3.super_class = (Class)THWInteractiveImageSidebarRep;
  -[THWInteractiveImageSidebarRep dealloc](&v3, "dealloc");
}

- (id)p_host
{
  return objc_msgSend(-[THWInteractiveImageSidebarRep interactiveCanvasController](self, "interactiveCanvasController"), "ancestorRepOfRep:orDelegateConformingToProtocol:", self, &OBJC_PROTOCOL___THWInteractiveImageSidebarRepHosting);
}

- (void)p_createGradientBackgroundLayerIfNeeded
{
  double v3;

  if (!self->_gradientLayer)
  {
    self->_gradientLayer = (CAGradientLayer *)objc_alloc_init((Class)CAGradientLayer);
    -[CAGradientLayer setDelegate:](self->_gradientLayer, "setDelegate:", -[THWInteractiveImageSidebarRep interactiveCanvasController](self, "interactiveCanvasController"));
    -[CAGradientLayer setLocations:](self->_gradientLayer, "setLocations:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 0.0), +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", 1.0), 0));
    -[CAGradientLayer setColors:](self->_gradientLayer, "setColors:", +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", -[TSUColor CGColor](+[TSUColor colorWithWhite:alpha:](TSUColor, "colorWithWhite:alpha:", 0.960784314, 1.0), "CGColor"), -[TSUColor CGColor](+[TSUColor colorWithWhite:alpha:](TSUColor, "colorWithWhite:alpha:", 0.905882353, 1.0), "CGColor"), 0));
    -[CAGradientLayer setBorderWidth:](self->_gradientLayer, "setBorderWidth:", 2.0);
    -[CAGradientLayer setBorderColor:](self->_gradientLayer, "setBorderColor:", objc_msgSend(+[TSUColor whiteColor](TSUColor, "whiteColor"), "CGColor"));
    -[CAGradientLayer setShadowOffset:](self->_gradientLayer, "setShadowOffset:", 0.0, 1.0);
    LODWORD(v3) = 1058642330;
    -[CAGradientLayer setShadowOpacity:](self->_gradientLayer, "setShadowOpacity:", v3);
    -[CAGradientLayer setShadowColor:](self->_gradientLayer, "setShadowColor:", objc_msgSend(+[TSUColor blackColor](TSUColor, "blackColor"), "CGColor"));
  }
}

- (BOOL)directlyManagesLayerContent
{
  return 1;
}

- (id)additionalLayersUnderLayer
{
  CAGradientLayer *gradientLayer;

  -[THWInteractiveImageSidebarRep p_createGradientBackgroundLayerIfNeeded](self, "p_createGradientBackgroundLayerIfNeeded");
  if (!self->_gradientLayer)
    return 0;
  -[THWInteractiveImageSidebarRep updateLayerGeometryFromLayout:](self, "updateLayerGeometryFromLayout:");
  gradientLayer = self->_gradientLayer;
  return +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &gradientLayer, 1);
}

- (BOOL)masksToBounds
{
  return 1;
}

- (void)setVisible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  id v7;
  void *v8;

  v4 = a4;
  v5 = a3;
  v7 = -[THWInteractiveImageSidebarRep interactiveCanvasController](self, "interactiveCanvasController");
  if (v4)
  {
    v8 = v7;
    objc_msgSend(v7, "beginAnimations:context:", CFSTR("sidebar visibility"), 0);
    objc_msgSend(-[THWInteractiveImageSidebarRep p_host](self, "p_host"), "interactiveImageSidebarAnimationDuration:", self);
    objc_msgSend(v8, "setAnimationDuration:");
    objc_msgSend(v8, "setAnimationUseRepFiltering:", 1);
    objc_msgSend(-[THWInteractiveImageSidebarRep layout](self, "layout"), "setHidden:", !v5);
    objc_msgSend(v8, "layoutIfNeeded");
    objc_msgSend(v8, "commitAnimations");
  }
  else
  {
    objc_msgSend(-[THWInteractiveImageSidebarRep layout](self, "layout"), "setHidden:", !v5);
  }
}

- (void)p_addFrameAnimationForLayer:(id)a3 duration:(double)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CABasicAnimation *v15;
  double v16;
  uint64_t v17;
  double v18;
  CABasicAnimation *v19;

  objc_msgSend(a3, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(a3, "position");
  v13 = v12;
  v14 = -0.35 / a4 + 1.0;
  v15 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("bounds"));
  v16 = v14 * a4;
  -[CABasicAnimation setBeginTime:](v15, "setBeginTime:", v14 * a4);
  v17 = kCAAnimationRelative;
  -[CABasicAnimation setBeginTimeMode:](v15, "setBeginTimeMode:", kCAAnimationRelative);
  -[CABasicAnimation setFillMode:](v15, "setFillMode:", kCAFillModeBoth);
  -[CABasicAnimation setRemovedOnCompletion:](v15, "setRemovedOnCompletion:", 1);
  v18 = (1.0 - v14) * a4;
  -[CABasicAnimation setDuration:](v15, "setDuration:", v18);
  -[CABasicAnimation setFromValue:](v15, "setFromValue:", +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v7, v9, v11, 0.0));
  -[CABasicAnimation setTimingFunction:](v15, "setTimingFunction:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut));
  objc_msgSend(a3, "addAnimation:forKey:", v15, CFSTR("bounds"));
  v19 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("position"));
  -[CABasicAnimation setBeginTime:](v19, "setBeginTime:", v16);
  -[CABasicAnimation setBeginTimeMode:](v19, "setBeginTimeMode:", v17);
  -[CABasicAnimation setFillMode:](v19, "setFillMode:", kCAFillModeBoth);
  -[CABasicAnimation setRemovedOnCompletion:](v19, "setRemovedOnCompletion:", 1);
  -[CABasicAnimation setDuration:](v19, "setDuration:", v18);
  -[CABasicAnimation setFromValue:](v19, "setFromValue:", +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", v13, 0.0));
  -[CABasicAnimation setTimingFunction:](v19, "setTimingFunction:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut));
  objc_msgSend(a3, "addAnimation:forKey:", v19, CFSTR("position"));
}

- (id)p_layerForCallout:(id)a3
{
  id v4;
  id v5;

  v4 = objc_msgSend(-[THWInteractiveImageSidebarRep layout](self, "layout"), "layoutForCallout:", a3);
  if (v4
    && (v5 = objc_msgSend(-[THWInteractiveImageSidebarRep interactiveCanvasController](self, "interactiveCanvasController"), "repForLayout:", v4)) != 0)
  {
    return objc_msgSend(-[THWInteractiveImageSidebarRep interactiveCanvasController](self, "interactiveCanvasController"), "layerForRep:", v5);
  }
  else
  {
    return 0;
  }
}

- (void)didUpdateLayer:(id)a3
{
  unsigned int v4;
  id v5;
  double v6;
  void *v7;
  double v8;
  unsigned int v9;
  id v10;
  double v11;
  double v12;
  double v13;
  id v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)THWInteractiveImageSidebarRep;
  -[THWInteractiveImageSidebarRep didUpdateLayer:](&v15, "didUpdateLayer:", a3);
  v4 = objc_msgSend(-[THWInteractiveImageSidebarRep p_host](self, "p_host"), "interactiveImageSidebarIsExpanded:", self);
  v5 = objc_msgSend(-[THWInteractiveImageSidebarRep interactiveCanvasController](self, "interactiveCanvasController"), "containerLayerForRep:", self);
  v7 = v5;
  if (!v4)
  {
    LODWORD(v6) = 1064514355;
    objc_msgSend(v5, "setOpacity:", v6);
    -[CAGradientLayer setShadowRadius:](self->_gradientLayer, "setShadowRadius:", 0.0);
    -[CAGradientLayer setCornerRadius:](self->_gradientLayer, "setCornerRadius:", 0.0);
LABEL_9:
    v10 = -[THWInteractiveImageSidebarRep p_layerForCallout:](self, "p_layerForCallout:", objc_msgSend(-[THWInteractiveImageSidebarRep layout](self, "layout"), "previousCallout"));
    LODWORD(v11) = 0;
    objc_msgSend(v10, "setOpacity:", v11);
    goto LABEL_10;
  }
  if (objc_msgSend(-[THWInteractiveImageSidebarRep layout](self, "layout"), "currentCallout"))
  {
    v9 = objc_msgSend(-[THWInteractiveImageSidebarRep layout](self, "layout"), "hidden");
    LODWORD(v8) = 1064514355;
    if (v9)
      *(float *)&v8 = 0.0;
  }
  else
  {
    LODWORD(v8) = 0;
  }
  objc_msgSend(v7, "setOpacity:", v8);
  -[CAGradientLayer setShadowRadius:](self->_gradientLayer, "setShadowRadius:", 2.0);
  -[CAGradientLayer setCornerRadius:](self->_gradientLayer, "setCornerRadius:", 4.0);
  if (objc_msgSend(-[THWInteractiveImageSidebarRep layout](self, "layout"), "currentCallout"))
    goto LABEL_9;
LABEL_10:
  objc_msgSend(-[THWInteractiveImageSidebarRep interactiveCanvasController](self, "interactiveCanvasController"), "animationDuration");
  if (v12 > 0.0)
  {
    v13 = v12;
    v14 = -[THWInteractiveImageSidebarRep p_layerForCallout:](self, "p_layerForCallout:", objc_msgSend(-[THWInteractiveImageSidebarRep layout](self, "layout"), "currentCallout"));
    if (v14)
      -[THWInteractiveImageSidebarRep p_addFrameAnimationForLayer:duration:](self, "p_addFrameAnimationForLayer:duration:", v14, v13);
  }
}

- (id)p_animationForEvent:(id)a3 duration:(double)a4 delayFactor:(double)a5 durationFactor:(double)a6
{
  CABasicAnimation *v9;

  v9 = +[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", a3);
  -[CABasicAnimation setDuration:](v9, "setDuration:", a4 * a6);
  -[CABasicAnimation setBeginTime:](v9, "setBeginTime:", a4 * a5);
  -[CABasicAnimation setBeginTimeMode:](v9, "setBeginTimeMode:", kCAAnimationRelative);
  -[CABasicAnimation setFillMode:](v9, "setFillMode:", kCAFillModeBoth);
  -[CABasicAnimation setRemovedOnCompletion:](v9, "setRemovedOnCompletion:", 1);
  -[CABasicAnimation setTimingFunction:](v9, "setTimingFunction:", +[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", kCAMediaTimingFunctionEaseInEaseOut));
  return v9;
}

- (id)animationForRepLayer:(id)a3 withEvent:(id)a4
{
  unsigned int v7;
  double v8;
  double v9;
  double v11;
  THWInteractiveImageSidebarRep *v12;
  id v13;
  double v14;
  double v15;

  v7 = objc_msgSend(-[THWInteractiveImageSidebarRep p_host](self, "p_host"), "interactiveImageSidebarIsExpanded:", self);
  objc_msgSend(-[THWInteractiveImageSidebarRep interactiveCanvasController](self, "interactiveCanvasController"), "animationDuration");
  if (v8 <= 0.0)
    return 0;
  v9 = v8;
  if (v7
    && (!objc_msgSend(-[THWInteractiveImageSidebarRep layout](self, "layout"), "previousCallout")
     || !objc_msgSend(-[THWInteractiveImageSidebarRep layout](self, "layout"), "currentCallout"))
    && ((objc_msgSend(a4, "isEqualToString:", CFSTR("bounds")) & 1) != 0
     || objc_msgSend(a4, "isEqualToString:", CFSTR("position")))
    && (objc_msgSend(-[THWInteractiveImageSidebarRep interactiveCanvasController](self, "interactiveCanvasController"), "layerForRep:", self) == a3|| self->_gradientLayer == a3))
  {
    return +[NSNull null](NSNull, "null");
  }
  if (((objc_msgSend(a4, "isEqualToString:", CFSTR("position")) & 1) != 0
     || objc_msgSend(a4, "isEqualToString:", CFSTR("bounds")))
    && (self->_gradientLayer == a3
     || objc_msgSend(-[THWInteractiveImageSidebarRep interactiveCanvasController](self, "interactiveCanvasController"), "layerForRep:", self) == a3))
  {
    if (v7)
    {
      v11 = 1.0 - (-0.25 / v9 + 1.0);
      v12 = self;
      v13 = a4;
      v14 = v9;
      v15 = -0.25 / v9 + 1.0;
    }
    else
    {
      v15 = 0.0;
      v12 = self;
      v13 = a4;
      v14 = v9;
      v11 = -0.25 / v9 + 1.0;
    }
  }
  else
  {
    if (!objc_msgSend(a4, "isEqualToString:", CFSTR("opacity"))
      || objc_msgSend(-[THWInteractiveImageSidebarRep interactiveCanvasController](self, "interactiveCanvasController"), "containerLayerForRep:", self) != a3)
    {
      return 0;
    }
    v15 = -0.25 / v9 + 1.0;
    v11 = 1.0 - v15;
    v12 = self;
    v13 = a4;
    v14 = v9;
  }
  return -[THWInteractiveImageSidebarRep p_animationForEvent:duration:delayFactor:durationFactor:](v12, "p_animationForEvent:duration:delayFactor:durationFactor:", v13, v14, v15, v11);
}

- (id)animationForChildRep:(id)a3 layer:(id)a4 withEvent:(id)a5
{
  if (!objc_msgSend(a5, "isEqualToString:", CFSTR("opacity"))
    || -[THWInteractiveImageSidebarRep p_layerForCallout:](self, "p_layerForCallout:", objc_msgSend(-[THWInteractiveImageSidebarRep layout](self, "layout"), "previousCallout")) != a4)
  {
    return 0;
  }
  objc_msgSend(-[THWInteractiveImageSidebarRep interactiveCanvasController](self, "interactiveCanvasController"), "animationDuration");
  return -[THWInteractiveImageSidebarRep p_animationForEvent:duration:delayFactor:durationFactor:](self, "p_animationForEvent:duration:delayFactor:durationFactor:", a5);
}

- (id)p_calloutForRep:(id)a3
{
  uint64_t v4;

  v4 = objc_opt_class(THWStackedControlContainer, a2);
  return objc_msgSend((id)TSUDynamicCast(v4, objc_msgSend(a3, "info")), "instanceData");
}

- (BOOL)controlContainerMasksToBounds:(id)a3
{
  return 1;
}

- (void)control:(id)a3 repWasAdded:(id)a4
{
  uint64_t v6;

  v6 = objc_opt_class(THWControlContainerRep, a2);
  objc_msgSend((id)TSUDynamicCast(v6, a4), "setDelegate:", self);
}

- (void)control:(id)a3 repWillBeRemoved:(id)a4
{
  uint64_t v5;

  v5 = objc_opt_class(THWControlContainerRep, a2);
  objc_msgSend((id)TSUDynamicCast(v5, a4), "setDelegate:", 0);
}

@end
