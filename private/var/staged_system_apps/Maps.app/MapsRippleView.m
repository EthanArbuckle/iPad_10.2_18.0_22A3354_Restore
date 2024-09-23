@implementation MapsRippleView

- (MapsRippleView)initWithCoder:(id)a3
{
  MapsRippleView *v3;
  MapsRippleView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MapsRippleView;
  v3 = -[MapsRippleView initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
  {
    -[MapsRippleView setFrame:](v3, "setFrame:", 0.0, 0.0, 70.0, 70.0);
    -[MapsRippleView _commonInit](v4, "_commonInit");
  }
  return v4;
}

- (MapsRippleView)initWithFrame:(CGRect)a3
{
  MapsRippleView *v3;
  MapsRippleView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MapsRippleView;
  v3 = -[MapsRippleView initWithFrame:](&v6, "initWithFrame:", 0.0, 0.0, 70.0, 70.0);
  v4 = v3;
  if (v3)
    -[MapsRippleView _commonInit](v3, "_commonInit");
  return v4;
}

- (void)_commonInit
{
  void *v3;
  id v4;
  uint64_t v5;

  -[MapsRippleView setOpaque:](self, "setOpaque:", 0);
  -[MapsRippleView setClearsContextBeforeDrawing:](self, "setClearsContextBeforeDrawing:", 1);
  -[MapsRippleView _userInterfaceStyleDidChange](self, "_userInterfaceStyleDidChange");
  v5 = objc_opt_class(UITraitUserInterfaceStyle);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v5, 1));
  v4 = -[MapsRippleView registerForTraitChanges:withTarget:action:](self, "registerForTraitChanges:withTarget:action:", v3, self, "_userInterfaceStyleDidChange");

}

- (void)startAnimating
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  self->_startTime = CACurrentMediaTime();
  if (!self->_animating)
  {
    v3 = sub_1004320DC();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "MapsRippleView startAnimating", v5, 2u);
    }

    self->_animating = 1;
    -[MapsRippleView _updateDisplayLink](self, "_updateDisplayLink");
  }
}

- (void)stopAnimating
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  if (self->_animating)
  {
    v3 = sub_1004320DC();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "MapsRippleView stopAnimating", v5, 2u);
    }

    self->_animating = 0;
    -[MapsRippleView _updateDisplayLink](self, "_updateDisplayLink");
  }
}

- (double)timeUntilAnimationStop
{
  CFTimeInterval v3;
  double v4;
  double v5;
  id v6;
  NSObject *v7;
  double v8;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  id v12;
  id v13;
  int v15;
  double v16;

  v3 = CACurrentMediaTime() - self->_startTime;
  if (!self->_looping)
  {
    if (v3 <= 1.0)
      v8 = 1.0 - v3;
    else
      v8 = 0.0;
    v13 = sub_1004320DC();
    v7 = objc_claimAutoreleasedReturnValue(v13);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      goto LABEL_18;
    v15 = 134217984;
    v16 = v8;
    v9 = "MapsRippleView timeUntilAnimationStop: %f (short-circuit)";
    goto LABEL_16;
  }
  v4 = fmod(v3, 1.0);
  v5 = 0.0;
  if (v3 <= 0.2 || (v5 = fmod(v3 + -0.2, 1.0), v4 <= 0.8) || v5 <= 0.8)
  {
    if (v4 < v5)
      v5 = v4;
    v8 = 0.8 - v5;
    v12 = sub_1004320DC();
    v7 = objc_claimAutoreleasedReturnValue(v12);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      goto LABEL_18;
    v15 = 134217984;
    v16 = v8;
    v9 = "MapsRippleView timeUntilAnimationStop: %f";
LABEL_16:
    v10 = v7;
    v11 = 12;
    goto LABEL_17;
  }
  v6 = sub_1004320DC();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = 0.0;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    LOWORD(v15) = 0;
    v9 = "MapsRippleView timeUntilAnimationStop: 0.0 (non-visible)";
    v10 = v7;
    v11 = 2;
LABEL_17:
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v15, v11);
  }
LABEL_18:

  return v8;
}

- (void)_updateDisplayLink
{
  void *v3;
  _BOOL4 animating;
  id v5;
  NSObject *v6;
  CADisplayLink *v7;
  CADisplayLink *displayLink;
  CADisplayLink *v9;
  CADisplayLink *v10;
  id v11;
  NSObject *v12;
  CADisplayLink *v13;
  void *v14;
  uint8_t v15[16];
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsRippleView superview](self, "superview"));
  if (v3 && (animating = self->_animating, v3, animating))
  {
    if (self->_displayLink)
      return;
    v5 = sub_1004320DC();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "MapsRippleView Creating ripple view display link", buf, 2u);
    }

    v7 = (CADisplayLink *)objc_claimAutoreleasedReturnValue(+[CADisplayLink displayLinkWithTarget:selector:](CADisplayLink, "displayLinkWithTarget:selector:", self, "_onFrameDraw:"));
    displayLink = self->_displayLink;
    self->_displayLink = v7;

    v9 = self->_displayLink;
    v10 = (CADisplayLink *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
    -[CADisplayLink addToRunLoop:forMode:](v9, "addToRunLoop:forMode:", v10, NSRunLoopCommonModes);
  }
  else
  {
    if (!self->_displayLink)
      return;
    v11 = sub_1004320DC();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "MapsRippleView Destroying ripple view display link", v15, 2u);
    }

    v13 = self->_displayLink;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
    -[CADisplayLink removeFromRunLoop:forMode:](v13, "removeFromRunLoop:forMode:", v14, NSRunLoopCommonModes);

    v10 = self->_displayLink;
    self->_displayLink = 0;
  }

}

- (void)_userInterfaceStyleDidChange
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[MapsRippleView traitCollection](self, "traitCollection"));
  -[MapsRippleView setDarkMode:](self, "setDarkMode:", objc_msgSend(v3, "userInterfaceStyle") == (id)2);

}

- (void)didMoveToSuperview
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MapsRippleView;
  -[MapsRippleView didMoveToSuperview](&v3, "didMoveToSuperview");
  -[MapsRippleView _updateDisplayLink](self, "_updateDisplayLink");
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 70.0;
  v3 = 70.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)drawRect:(CGRect)a3
{
  CGContextRef CurrentContext;
  CGContextRef v5;
  CFTimeInterval v6;
  double v8;
  double v9;
  MapsRippleView *v10;
  CGContextRef v11;
  double v12;
  uint64_t v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)MapsRippleView;
  -[MapsRippleView drawRect:](&v14, "drawRect:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  CurrentContext = UIGraphicsGetCurrentContext();
  if (CurrentContext && self->_animating)
  {
    v5 = CurrentContext;
    v6 = CACurrentMediaTime() - self->_startTime;
    if (self->_looping || v6 <= 1.0)
    {
      v8 = fmod(v6, 1.0);
      if (v6 <= 0.2)
      {
        v10 = self;
        v11 = v5;
        v12 = v8;
        v13 = 0;
      }
      else
      {
        v9 = fmod(v6 + -0.2, 1.0);
        -[MapsRippleView _drawRingInContext:withProgress:isSecondRing:](self, "_drawRingInContext:withProgress:isSecondRing:", v5, 0, v8);
        if (v9 <= 0.0)
          return;
        v10 = self;
        v11 = v5;
        v12 = v9;
        v13 = 1;
      }
      -[MapsRippleView _drawRingInContext:withProgress:isSecondRing:](v10, "_drawRingInContext:withProgress:isSecondRing:", v11, v13, v12);
    }
  }
}

- (void)_drawRingInContext:(CGContext *)a3 withProgress:(double)a4 isSecondRing:(BOOL)a5
{
  _BOOL4 v5;
  double v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  id v17;
  CGRect v18;

  v5 = a5;
  v8 = 0.0;
  if (a4 <= 0.0)
    goto LABEL_8;
  if (a4 <= 0.4)
  {
    v9 = a4 / 0.4;
  }
  else
  {
    v8 = 2.0;
    if (a4 <= 0.6)
      goto LABEL_8;
    v8 = 0.0;
    if (a4 > 0.8)
      goto LABEL_8;
    v9 = (a4 + -0.6) / -0.2 + 1.0;
  }
  v8 = v9 + v9;
LABEL_8:
  if (-[MapsRippleView isDarkMode](self, "isDarkMode"))
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  else
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  v11 = v10;
  if (a4 <= 0.0)
    goto LABEL_15;
  if (a4 <= 0.4)
  {
    v13 = a4 / 0.4;
LABEL_19:
    v14 = v13 * 0.400000006;
    goto LABEL_20;
  }
  if (a4 > 0.6)
  {
    if (a4 > 0.8)
    {
LABEL_15:
      v12 = objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
      goto LABEL_21;
    }
    v13 = (a4 + -0.6) / -0.2 + 1.0;
    goto LABEL_19;
  }
  v14 = 0.400000006;
LABEL_20:
  v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "colorWithAlphaComponent:", v14));
LABEL_21:
  v17 = (id)v12;
  v15 = 70.0;
  if (v5)
    v15 = 48.0;
  v16 = v15 * a4;

  objc_msgSend(v17, "setStroke");
  CGContextSetLineWidth(a3, v8);
  v18.origin.x = v16 * -0.5 + 35.0;
  v18.origin.y = v18.origin.x;
  v18.size.width = v16;
  v18.size.height = v16;
  CGContextStrokeEllipseInRect(a3, v18);

}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@:%p isLooping: %d, isAnimating: %d, hasDisplayLink: %d, startTime: %f>"), objc_opt_class(self), self, self->_looping, self->_animating, self->_displayLink != 0, *(_QWORD *)&self->_startTime);
}

- (BOOL)isLooping
{
  return self->_looping;
}

- (void)setLooping:(BOOL)a3
{
  self->_looping = a3;
}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (BOOL)isDarkMode
{
  return self->_darkMode;
}

- (void)setDarkMode:(BOOL)a3
{
  self->_darkMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLink, 0);
}

@end
