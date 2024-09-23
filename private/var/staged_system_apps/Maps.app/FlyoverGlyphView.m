@implementation FlyoverGlyphView

- (void)gv_commonInit
{
  FlyoverGlyphFrameList *v3;
  FlyoverGlyphFrameList *frameList;
  double v5;
  double v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  CALayer *v10;
  CALayer *wrapperLayer;
  void *v12;
  CALayer *v13;
  CALayer *imageLayer;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v19;
  _BYTE v20[20];
  uint64_t v21;
  uint64_t v22;
  void *v23;

  v3 = objc_alloc_init(FlyoverGlyphFrameList);
  frameList = self->_frameList;
  self->_frameList = v3;

  if (self->_frameList)
  {
    -[FlyoverGlyphView setAccessibilityIdentifier:](self, "setAccessibilityIdentifier:", CFSTR("FlyoverGlyphView"));
    -[FlyoverGlyphFrameList frameDuration](self->_frameList, "frameDuration");
    v6 = v5;
    -[FlyoverGlyphFrameList introFrameRange](self->_frameList, "introFrameRange");
    self->_introDuration = v6 * (double)v7;
    -[FlyoverGlyphFrameList loopFrameRange](self->_frameList, "loopFrameRange");
    self->_loopDuration = v6 * (double)v8;
    -[FlyoverGlyphFrameList outroFrameRange](self->_frameList, "outroFrameRange");
    self->_outroDuration = v6 * (double)v9;
    v10 = (CALayer *)objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
    wrapperLayer = self->_wrapperLayer;
    self->_wrapperLayer = v10;

    -[CALayer setAllowsGroupBlending:](self->_wrapperLayer, "setAllowsGroupBlending:", 0);
    -[CALayer setBounds:](self->_wrapperLayer, "setBounds:", 0.0, 0.0, 50.0, 50.0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[FlyoverGlyphView layer](self, "layer"));
    objc_msgSend(v12, "addSublayer:", self->_wrapperLayer);

    v13 = (CALayer *)objc_claimAutoreleasedReturnValue(+[CALayer layer](CALayer, "layer"));
    imageLayer = self->_imageLayer;
    self->_imageLayer = v13;

    -[CALayer setCompositingFilter:](self->_imageLayer, "setCompositingFilter:", kCAFilterPlusD);
    -[CALayer setContents:](self->_imageLayer, "setContents:", -[FlyoverGlyphFrameList atlasImage](self->_frameList, "atlasImage"));
    -[CALayer addSublayer:](self->_wrapperLayer, "addSublayer:", self->_imageLayer);
    *(_OWORD *)v20 = 0u;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[CAFilter filterWithType:](CAFilter, "filterWithType:", kCAFilterColorMatrix, 0, 0, 0, 0, 0, 0, 0, *(_QWORD *)&v20[12]));
    *(_DWORD *)&v20[16] = -1082130432;
    v21 = 0;
    v22 = 1065353216;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCAColorMatrix:](NSValue, "valueWithCAColorMatrix:", &v19));
    objc_msgSend(v15, "setValue:forKey:", v16, CFSTR("inputColorMatrix"));

    v23 = v15;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
    -[CALayer setFilters:](self->_imageLayer, "setFilters:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v18, "addObserver:selector:name:object:", self, "applicationWillEnterForeground:", UIApplicationWillEnterForegroundNotification, 0);

  }
}

- (FlyoverGlyphView)initWithCoder:(id)a3
{
  FlyoverGlyphView *v3;
  FlyoverGlyphView *v4;
  FlyoverGlyphView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FlyoverGlyphView;
  v3 = -[FlyoverGlyphView initWithCoder:](&v7, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
  {
    -[FlyoverGlyphView gv_commonInit](v3, "gv_commonInit");
    v5 = v4;
  }

  return v4;
}

- (FlyoverGlyphView)initWithFrame:(CGRect)a3
{
  FlyoverGlyphView *v3;
  FlyoverGlyphView *v4;
  FlyoverGlyphView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FlyoverGlyphView;
  v3 = -[FlyoverGlyphView initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[FlyoverGlyphView gv_commonInit](v3, "gv_commonInit");
    v5 = v4;
  }

  return v4;
}

- (void)layoutSubviews
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  CGRect v8;
  CGRect v9;

  -[FlyoverGlyphView bounds](self, "bounds");
  x = v8.origin.x;
  y = v8.origin.y;
  width = v8.size.width;
  height = v8.size.height;
  MidX = CGRectGetMidX(v8);
  v9.origin.x = x;
  v9.origin.y = y;
  v9.size.width = width;
  v9.size.height = height;
  -[CALayer setPosition:](self->_wrapperLayer, "setPosition:", MidX, CGRectGetMidY(v9));
}

- (void)startAnimating
{
  CFTimeInterval v3;
  double animationEndTime;
  BOOL v5;
  FlyoverGlyphFrameList *frameList;
  id v7;
  unint64_t v8;
  id v9;
  void *v10;
  FlyoverGlyphFrameList *v11;
  id v12;
  unint64_t v13;
  id v14;
  double v15;
  id v16;

  if (!-[FlyoverGlyphView isAnimating](self, "isAnimating"))
  {
    v3 = CACurrentMediaTime();
    animationEndTime = self->_animationEndTime;
    if (v3 < animationEndTime && (v5 = v3 < animationEndTime - self->_outroDuration, v3 = self->_animationEndTime, v5))
    {
      -[CALayer removeAnimationForKey:](self->_imageLayer, "removeAnimationForKey:", CFSTR("outro"), v3);
    }
    else
    {
      self->_animationStartTime = v3;
      frameList = self->_frameList;
      v7 = -[FlyoverGlyphFrameList introFrameRange](frameList, "introFrameRange");
      v9 = sub_1008D1A04(frameList, (unint64_t)v7, v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      objc_msgSend(v10, "setBeginTime:", self->_animationStartTime);
      -[CALayer addAnimation:forKey:](self->_imageLayer, "addAnimation:forKey:", v10, CFSTR("intro"));

    }
    v11 = self->_frameList;
    v12 = -[FlyoverGlyphFrameList loopFrameRange](v11, "loopFrameRange");
    v14 = sub_1008D1A04(v11, (unint64_t)v12, v13);
    v16 = (id)objc_claimAutoreleasedReturnValue(v14);
    objc_msgSend(v16, "setBeginTime:", self->_animationStartTime + self->_introDuration);
    LODWORD(v15) = 2139095040;
    objc_msgSend(v16, "setRepeatCount:", v15);
    -[CALayer addAnimation:forKey:](self->_imageLayer, "addAnimation:forKey:", v16, CFSTR("loop"));
    -[FlyoverGlyphView setAnimating:](self, "setAnimating:", 1);

  }
}

- (double)stopAnimating
{
  double animationEndTime;
  double v4;
  FlyoverGlyphFrameList *frameList;
  id v6;
  unint64_t v7;
  id v8;
  void *v9;
  double v10;
  FlyoverGlyphFrameList *v11;
  id v12;
  unint64_t v13;
  id v14;
  void *v15;
  double v16;

  animationEndTime = -1.0;
  if (-[FlyoverGlyphView isAnimating](self, "isAnimating"))
  {
    v4 = fmax(ceil((CACurrentMediaTime() - self->_animationStartTime - self->_introDuration) / self->_loopDuration), 0.0);
    if (v4 >= 1.0)
    {
      frameList = self->_frameList;
      v6 = -[FlyoverGlyphFrameList loopFrameRange](frameList, "loopFrameRange");
      v8 = sub_1008D1A04(frameList, (unint64_t)v6, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      objc_msgSend(v9, "setBeginTime:", self->_animationStartTime + self->_introDuration);
      *(float *)&v10 = v4;
      objc_msgSend(v9, "setRepeatCount:", v10);
      -[CALayer addAnimation:forKey:](self->_imageLayer, "addAnimation:forKey:", v9, CFSTR("loop"));

    }
    else
    {
      -[CALayer removeAnimationForKey:](self->_imageLayer, "removeAnimationForKey:", CFSTR("loop"));
    }
    v11 = self->_frameList;
    v12 = -[FlyoverGlyphFrameList outroFrameRange](v11, "outroFrameRange");
    v14 = sub_1008D1A04(v11, (unint64_t)v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    objc_msgSend(v15, "setBeginTime:", self->_animationStartTime + self->_introDuration + v4 * self->_loopDuration);
    -[CALayer addAnimation:forKey:](self->_imageLayer, "addAnimation:forKey:", v15, CFSTR("outro"));
    objc_msgSend(v15, "beginTime");
    self->_animationEndTime = v16 + self->_outroDuration;
    -[FlyoverGlyphView setAnimating:](self, "setAnimating:", 0);
    animationEndTime = self->_animationEndTime;

  }
  return animationEndTime;
}

- (void)applicationWillEnterForeground:(id)a3
{
  FlyoverGlyphFrameList *frameList;
  id v5;
  unint64_t v6;
  id v7;
  double v8;
  id v9;

  if (-[FlyoverGlyphView isAnimating](self, "isAnimating", a3))
  {
    frameList = self->_frameList;
    v5 = -[FlyoverGlyphFrameList loopFrameRange](frameList, "loopFrameRange");
    v7 = sub_1008D1A04(frameList, (unint64_t)v5, v6);
    v9 = (id)objc_claimAutoreleasedReturnValue(v7);
    objc_msgSend(v9, "setBeginTime:", self->_animationStartTime + self->_introDuration);
    LODWORD(v8) = 2139095040;
    objc_msgSend(v9, "setRepeatCount:", v8);
    -[CALayer addAnimation:forKey:](self->_imageLayer, "addAnimation:forKey:", v9, CFSTR("loop"));

  }
}

- (BOOL)isAnimating
{
  return self->_animating;
}

- (void)setAnimating:(BOOL)a3
{
  self->_animating = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageLayer, 0);
  objc_storeStrong((id *)&self->_wrapperLayer, 0);
  objc_storeStrong((id *)&self->_frameList, 0);
}

@end
