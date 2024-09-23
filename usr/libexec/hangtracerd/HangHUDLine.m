@implementation HangHUDLine

- (HangHUDLine)initWithQueue:(id)a3 processName:(id)a4 theme:(id)a5 fontSize:(double)a6 lineDelegate:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  HangHUDLine *v16;
  uint64_t v17;
  CATextLayer *processNameLayer;
  uint64_t v19;
  HUDDurationLayer *durationLayer;
  objc_super v22;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v22.receiver = self;
  v22.super_class = (Class)HangHUDLine;
  v16 = -[HUDLine init](&v22, "init");
  if (v16)
  {
    -[HUDLine setSpacing:](v16, "setSpacing:", sub_100027D34());
    v17 = objc_claimAutoreleasedReturnValue(+[CATextLayer layer](CATextLayer, "layer"));
    processNameLayer = v16->_processNameLayer;
    v16->_processNameLayer = (CATextLayer *)v17;

    -[CATextLayer setTruncationMode:](v16->_processNameLayer, "setTruncationMode:", kCATruncationEnd);
    if (qword_10005FC88 != -1)
      dispatch_once(&qword_10005FC88, &stru_10004D4D8);
    -[CATextLayer setFont:](v16->_processNameLayer, "setFont:", qword_10005FC90);
    -[CATextLayer setFontSize:](v16->_processNameLayer, "setFontSize:", a6);
    -[HUDLine contentScaleForTexts](v16, "contentScaleForTexts");
    -[CATextLayer setContentsScale:](v16->_processNameLayer, "setContentsScale:");
    -[CATextLayer setString:](v16->_processNameLayer, "setString:", v13);
    -[HUDLine setVibrancyFilter:](v16, "setVibrancyFilter:", v16->_processNameLayer);
    v19 = objc_claimAutoreleasedReturnValue(+[HUDDurationLayer layer](HUDDurationLayer, "layer"));
    durationLayer = v16->_durationLayer;
    v16->_durationLayer = (HUDDurationLayer *)v19;

    if (qword_10005FC98 != -1)
      dispatch_once(&qword_10005FC98, &stru_10004D4F8);
    -[HUDDurationLayer setFont:](v16->_durationLayer, "setFont:", qword_10005FCA0);
    -[HUDDurationLayer setFontSize:](v16->_durationLayer, "setFontSize:", a6);
    -[HUDLine contentScaleForTexts](v16, "contentScaleForTexts");
    -[HUDDurationLayer setContentsScale:](v16->_durationLayer, "setContentsScale:");
    -[HUDDurationLayer setAlignmentMode:](v16->_durationLayer, "setAlignmentMode:", kCAAlignmentRight);
    -[HUDDurationLayer setQueue:](v16->_durationLayer, "setQueue:", v12);
    -[HUDLine setVibrancyFilter:](v16, "setVibrancyFilter:", v16->_durationLayer);
    -[HangHUDLine addSublayer:](v16, "addSublayer:", v16->_processNameLayer);
    -[HangHUDLine addSublayer:](v16, "addSublayer:", v16->_durationLayer);
    objc_storeStrong((id *)&v16->_currentTheme, a5);
    -[HUDLine setLineDelegate:](v16, "setLineDelegate:", v15);
    -[HUDLine setKeyLayer:](v16, "setKeyLayer:", v16->_processNameLayer);
    -[HUDLine setValueLayer:](v16, "setValueLayer:", v16->_durationLayer);
  }

  return v16;
}

- (void)nilifyCALayers
{
  CATextLayer *processNameLayer;
  HUDDurationLayer *durationLayer;

  processNameLayer = self->_processNameLayer;
  self->_processNameLayer = 0;

  durationLayer = self->_durationLayer;
  self->_durationLayer = 0;

}

- (void)setFontSize:(double)a3
{
  -[CATextLayer setFontSize:](self->_processNameLayer, "setFontSize:");
  -[HUDDurationLayer setFontSize:](self->_durationLayer, "setFontSize:", a3);
}

- (int64_t)statusForHangWithDuration:(double)a3 timedOut:(BOOL)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;

  if (a4)
    return 3;
  v15 = v8;
  v16 = v4;
  if ((sub_100028370() & 1) != 0)
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[HUDConfiguration sharedInstance](HUDConfiguration, "sharedInstance"));
  else
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs"));
  v13 = v12;
  v14 = objc_msgSend(v12, "runloopHangTimeoutDurationMSec", v9, v15, v5, v16, v6, v7);

  if ((double)(unint64_t)v14 * 0.555555556 <= a3)
    return 2;
  else
    return (double)(unint64_t)v14 * 0.222222222 <= a3;
}

- (void)update:(id)a3 options:(unint64_t)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  NSObject *v11;
  HUDDurationLayer *durationLayer;
  double v13;
  double v14;
  double v15;
  int64_t v16;
  CGColor *v17;
  id v18;
  NSObject *v19;
  HUDLineAnimationDelegate *v20;
  uint8_t v21[16];

  v6 = a3;
  if (!-[HUDLine updatesComplete](self, "updatesComplete"))
  {
    v8 = v6;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CATextLayer animationForKey:](self->_processNameLayer, "animationForKey:", CFSTR("foreground-color-fade-animation")));
    if (v9)
    {
      v10 = sub_100024FF4();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Attempting to update a HUD line with an animation in progress!", v21, 2u);
      }
    }
    else
    {
      durationLayer = self->_durationLayer;
      -[NSObject hangDurationMS](v8, "hangDurationMS");
      v14 = v13;
      -[HUDDurationLayer hangDuration](self->_durationLayer, "hangDuration");
      -[HUDDurationLayer setHangDuration:animated:](durationLayer, "setHangDuration:animated:", v15 > 0.0, v14);
      -[NSObject hangDurationMS](v8, "hangDurationMS");
      v16 = -[HangHUDLine statusForHangWithDuration:timedOut:](self, "statusForHangWithDuration:timedOut:", (a4 >> 1) & 1);
      v17 = -[HUDTheme currentHangTextColorForStatus:](self->_currentTheme, "currentHangTextColorForStatus:", v16);
      -[CATextLayer setForegroundColor:](self->_processNameLayer, "setForegroundColor:", v17);
      -[HUDDurationLayer setForegroundColor:](self->_durationLayer, "setForegroundColor:", v17);
      if ((a4 & 1) != 0)
      {
LABEL_12:

        goto LABEL_13;
      }
      v18 = sub_100024FF4();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        sub_10002E5D0(v8);

      -[HUDLine setUpdatesComplete:](self, "setUpdatesComplete:", 1);
      v11 = objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("foregroundColor")));
      -[NSObject setRemovedOnCompletion:](v11, "setRemovedOnCompletion:", 0);
      -[NSObject setFillMode:](v11, "setFillMode:", kCAFillModeForwards);
      -[NSObject setToValue:](v11, "setToValue:", -[HUDTheme previousHangTextColorForStatus:](self->_currentTheme, "previousHangTextColorForStatus:", v16));
      -[NSObject setDuration:](v11, "setDuration:", 0.5);
      v20 = objc_alloc_init(HUDLineAnimationDelegate);
      -[HUDLineAnimationDelegate setHudLine:](v20, "setHudLine:", self);
      -[NSObject setDelegate:](v11, "setDelegate:", v20);
      -[CATextLayer addAnimation:forKey:](self->_processNameLayer, "addAnimation:forKey:", v11, CFSTR("foreground-color-fade-animation"));
      -[HUDDurationLayer addAnimation:forKey:](self->_durationLayer, "addAnimation:forKey:", v11, CFSTR("foreground-color-fade-animation"));

    }
    goto LABEL_12;
  }
  v7 = sub_100024FF4();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    sub_10002E55C((uint64_t)self, v8);
LABEL_13:

}

- (HUDTheme)currentTheme
{
  return self->_currentTheme;
}

- (void)setCurrentTheme:(id)a3
{
  objc_storeStrong((id *)&self->_currentTheme, a3);
}

- (CATextLayer)processNameLayer
{
  return self->_processNameLayer;
}

- (HUDDurationLayer)durationLayer
{
  return self->_durationLayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_durationLayer, 0);
  objc_storeStrong((id *)&self->_processNameLayer, 0);
  objc_storeStrong((id *)&self->_currentTheme, 0);
}

@end
