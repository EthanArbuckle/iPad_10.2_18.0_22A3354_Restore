@implementation SBHClockApplicationIconImageView

- (id)contentsImage
{
  return -[SBHClockApplicationIconImageView contentsImageWithOptions:](self, "contentsImageWithOptions:", 1);
}

- (void)updateAnimatingState
{
  void *v3;
  void *v4;
  _BOOL8 v5;

  if (-[SBHClockApplicationIconImageView isAnimationAllowed](self, "isAnimationAllowed"))
  {
    -[SBIconImageView icon](self, "icon");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      objc_msgSend((id)objc_opt_class(), "overrideDate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4 == 0;

    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }
  -[SBHClockApplicationIconImageView _setAnimating:](self, "_setAnimating:", v5);
}

- (void)_setAnimating:(BOOL)a3
{
  SBHClockApplicationIconImageView *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  SBHClockApplicationIconImageView *v15;
  NSObject *v16;
  void *v17;
  int v18;
  SBHClockApplicationIconImageView *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    -[SBHClockApplicationIconImageView updateUnanimated](self, "updateUnanimated");
    v4 = self;
    if (_SBClockIconInitialize___once != -1)
      dispatch_once(&_SBClockIconInitialize___once, &__block_literal_global_288);
    if ((objc_msgSend((id)__tickClients, "containsObject:", v4) & 1) == 0)
    {
      SBLogClock();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 134218240;
        v19 = v4;
        v20 = 2048;
        v21 = objc_msgSend((id)__tickClients, "count") + 1;
        _os_log_impl(&dword_1CFEF3000, v5, OS_LOG_TYPE_DEFAULT, "Add clock icon tick client: %p/%lu", (uint8_t *)&v18, 0x16u);
      }

      objc_msgSend((id)__tickClients, "addObject:", v4);
      if (!__tickTimer)
      {
        __frameCount = 0;
        objc_msgSend(MEMORY[0x1E0CD2730], "displayLinkWithTarget:selector:", objc_opt_class(), sel__timerFired_);
        v6 = objc_claimAutoreleasedReturnValue();
        v7 = (void *)__tickTimer;
        __tickTimer = v6;

        LODWORD(v8) = __secondFrameRange_0;
        LODWORD(v9) = __secondFrameRange_1;
        LODWORD(v10) = __secondFrameRange_2;
        objc_msgSend((id)__tickTimer, "setPreferredFrameRateRange:", v8, v9, v10);
        v11 = (void *)__tickTimer;
        objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addToRunLoop:forMode:", v12, *MEMORY[0x1E0C99860]);

        SBLogClock();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v18) = 0;
          v14 = "Started clock icon tick timer";
LABEL_16:
          _os_log_impl(&dword_1CFEF3000, v13, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v18, 2u);
          goto LABEL_17;
        }
        goto LABEL_17;
      }
    }
  }
  else
  {
    v15 = self;
    if (objc_msgSend((id)__tickClients, "containsObject:", v15))
    {
      SBLogClock();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 134218240;
        v19 = v15;
        v20 = 2048;
        v21 = objc_msgSend((id)__tickClients, "count") - 1;
        _os_log_impl(&dword_1CFEF3000, v16, OS_LOG_TYPE_DEFAULT, "Remove clock icon tick client: %p/%lu", (uint8_t *)&v18, 0x16u);
      }

      objc_msgSend((id)__tickClients, "removeObject:", v15);
      if (!objc_msgSend((id)__tickClients, "count"))
      {
        objc_msgSend((id)__tickTimer, "invalidate");
        v17 = (void *)__tickTimer;
        __tickTimer = 0;

        SBLogClock();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v18) = 0;
          v14 = "Stopped clock icon tick timer";
          goto LABEL_16;
        }
LABEL_17:

      }
    }
  }

}

+ (void)_timerFired:(id)a3
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  NSObject *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = (unint64_t)*(float *)&__secondFrameRange_2;
  v4 = 128;
  if (!(__frameCount % (60 * (unint64_t)*(float *)&__secondFrameRange_2)))
    v4 = 192;
  v5 = 3600 * v3;
  v6 = __frameCount + v3;
  if (v5 == __frameCount)
    v7 = 0;
  else
    v7 = v6;
  if (v5 == __frameCount)
    v8 = v4 | 0x20;
  else
    v8 = v4;
  __frameCount = v7;
  objc_msgSend(a1, "effectiveDate", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)__calendar, "components:fromDate:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v11 = (id)__tickClients;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "_timerFiredWithComponents:flags:", v10, v8, (_QWORD)v17);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v13);
  }

  SBLogClock();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    +[SBHClockApplicationIconImageView _timerFired:].cold.1();

}

- (void)_timerFiredWithComponents:(id)a3 flags:(unint64_t)a4
{
  char v4;
  id v6;
  double v7;
  float v8;
  double v9;
  double v10;
  __double2 v11;
  CALayer *seconds;
  float v13;
  double v14;
  double v15;
  __double2 v16;
  CALayer *minutes;
  float v18;
  double v19;
  __double2 v20;
  CALayer *hours;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;

  v4 = a4;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v8 = v7 - trunc(v7) + (double)objc_msgSend(v6, "second");
  v9 = v8;
  v10 = fmod(v8 / 30.0 * 3.14159265, 6.28318531);
  v11 = __sincos_stret(v10);
  *(double *)&__cachedTransform = v11.__cosval;
  *((_QWORD *)&__cachedTransform + 1) = *(_QWORD *)&v11.__sinval;
  *(double *)&xmmword_1ED2CB7E8 = -v11.__sinval;
  *((_QWORD *)&xmmword_1ED2CB7E8 + 1) = *(_QWORD *)&v11.__cosval;
  seconds = self->_seconds;
  v26 = xmmword_1ED2CB808;
  v27 = *(_OWORD *)&qword_1ED2CB818;
  v28 = xmmword_1ED2CB828;
  v29 = unk_1ED2CB838;
  v22 = __cachedTransform;
  v23 = unk_1ED2CB7D8;
  v24 = xmmword_1ED2CB7E8;
  v25 = unk_1ED2CB7F8;
  -[CALayer setTransform:](seconds, "setTransform:", &v22);
  if ((v4 & 0x40) != 0)
  {
    v13 = v9 / 60.0 + (double)objc_msgSend(v6, "minute");
    v14 = v13;
    v15 = fmod(v13 / 30.0 * 3.14159265, 6.28318531);
    v16 = __sincos_stret(v15);
    *(double *)&__cachedTransform = v16.__cosval;
    *((_QWORD *)&__cachedTransform + 1) = *(_QWORD *)&v16.__sinval;
    *(double *)&xmmword_1ED2CB7E8 = -v16.__sinval;
    *((_QWORD *)&xmmword_1ED2CB7E8 + 1) = *(_QWORD *)&v16.__cosval;
    minutes = self->_minutes;
    v26 = xmmword_1ED2CB808;
    v27 = *(_OWORD *)&qword_1ED2CB818;
    v28 = xmmword_1ED2CB828;
    v29 = unk_1ED2CB838;
    v22 = __cachedTransform;
    v23 = unk_1ED2CB7D8;
    v24 = xmmword_1ED2CB7E8;
    v25 = unk_1ED2CB7F8;
    -[CALayer setTransform:](minutes, "setTransform:", &v22);
    if ((v4 & 0x20) != 0)
    {
      v18 = v14 / 60.0 + (double)objc_msgSend(v6, "hour");
      v19 = fmod(v18 / 6.0 * 3.14159265, 6.28318531);
      v20 = __sincos_stret(v19);
      *(double *)&__cachedTransform = v20.__cosval;
      *((_QWORD *)&__cachedTransform + 1) = *(_QWORD *)&v20.__sinval;
      *(double *)&xmmword_1ED2CB7E8 = -v20.__sinval;
      *((_QWORD *)&xmmword_1ED2CB7E8 + 1) = *(_QWORD *)&v20.__cosval;
      hours = self->_hours;
      v26 = xmmword_1ED2CB808;
      v27 = *(_OWORD *)&qword_1ED2CB818;
      v28 = xmmword_1ED2CB828;
      v29 = unk_1ED2CB838;
      v22 = __cachedTransform;
      v23 = unk_1ED2CB7D8;
      v24 = xmmword_1ED2CB7E8;
      v25 = unk_1ED2CB7F8;
      -[CALayer setTransform:](hours, "setTransform:", &v22);
    }
  }

}

- (BOOL)isAnimationAllowed
{
  void *v3;
  BOOL v4;
  objc_super v6;

  objc_msgSend((id)objc_opt_class(), "overrideDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SBHClockApplicationIconImageView;
    v4 = -[SBLiveIconImageView isAnimationAllowed](&v6, sel_isAnimationAllowed);
  }

  return v4;
}

+ (id)effectiveDate
{
  void *v2;
  double v3;
  double v4;
  id v5;
  void *v6;
  uint64_t v7;

  objc_msgSend((id)objc_opt_class(), "overrideDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "overrideDateOffset");
  v4 = v3;
  if (v2)
  {
    v5 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;
  if (v4 != 0.0)
  {
    objc_msgSend(v5, "dateByAddingTimeInterval:", v4);
    v7 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v7;
  }

  return v6;
}

+ (NSDate)overrideDate
{
  return (NSDate *)(id)__overrideDate;
}

+ (double)overrideDateOffset
{
  return *(double *)&__overrideDateOffset;
}

- (void)setPaused:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  void *v6;
  double v7;
  float v8;
  void *v9;
  double v10;
  double v11;
  objc_super v12;

  v3 = a3;
  if (-[SBIconImageView isPaused](self, "isPaused") != a3)
  {
    v12.receiver = self;
    v12.super_class = (Class)SBHClockApplicationIconImageView;
    -[SBLiveIconImageView setPaused:](&v12, sel_setPaused_, v3);
    v5 = -[SBHClockApplicationIconImageView shouldShowSecondsHand](self, "shouldShowSecondsHand");
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setDuration:", 0.2);
    objc_msgSend(v6, "setFromValue:", &unk_1E8E16F10);
    v7 = -1.0;
    if (v5)
    {
      v7 = 1.0;
      v8 = 1.0;
    }
    else
    {
      v8 = 0.0;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setToValue:", v9);

    objc_msgSend(v6, "setAdditive:", 1);
    -[CALayer addAnimation:forKey:](self->_seconds, "addAnimation:forKey:", v6, CFSTR("Paused"));
    -[CALayer addAnimation:forKey:](self->_secondDot, "addAnimation:forKey:", v6, CFSTR("Paused"));
    *(float *)&v10 = v8;
    -[CALayer setOpacity:](self->_seconds, "setOpacity:", v10);
    *(float *)&v11 = v8;
    -[CALayer setOpacity:](self->_secondDot, "setOpacity:", v11);

  }
}

- (void)updateUnanimated
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBHClockApplicationIconImageView;
  -[SBLiveIconImageView updateUnanimated](&v6, sel_updateUnanimated);
  _SBClockIconGetCalendar();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "effectiveDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "components:fromDate:", 224, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHClockApplicationIconImageView _updateUnanimatedWithComponents:](self, "_updateUnanimatedWithComponents:", v5);
}

- (void)_updateUnanimatedWithComponents:(id)a3
{
  void *v4;
  id v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  double v14;
  __double2 v15;
  CALayer *seconds;
  double v17;
  __double2 v18;
  CALayer *minutes;
  double v20;
  __double2 v21;
  CALayer *hours;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;

  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  v7 = v6;
  objc_msgSend((id)objc_opt_class(), "overrideDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 - trunc(v7);
  if (v8)
    v10 = 0.0;
  else
    v10 = v9;

  v11 = v10 + (double)objc_msgSend(v5, "second");
  v12 = v11 / 60.0 + (double)objc_msgSend(v5, "minute");
  v13 = objc_msgSend(v5, "hour");

  v14 = fmod(v11 / 30.0 * 3.14159265, 6.28318531);
  v15 = __sincos_stret(v14);
  *(double *)&__cachedTransform = v15.__cosval;
  *((_QWORD *)&__cachedTransform + 1) = *(_QWORD *)&v15.__sinval;
  *(double *)&xmmword_1ED2CB7E8 = -v15.__sinval;
  *((_QWORD *)&xmmword_1ED2CB7E8 + 1) = *(_QWORD *)&v15.__cosval;
  seconds = self->_seconds;
  v27 = xmmword_1ED2CB808;
  v28 = *(_OWORD *)&qword_1ED2CB818;
  v29 = xmmword_1ED2CB828;
  v30 = unk_1ED2CB838;
  v23 = __cachedTransform;
  v24 = unk_1ED2CB7D8;
  v25 = xmmword_1ED2CB7E8;
  v26 = unk_1ED2CB7F8;
  -[CALayer setTransform:](seconds, "setTransform:", &v23);
  v17 = fmod(v12 / 30.0 * 3.14159265, 6.28318531);
  v18 = __sincos_stret(v17);
  *(double *)&__cachedTransform = v18.__cosval;
  *((_QWORD *)&__cachedTransform + 1) = *(_QWORD *)&v18.__sinval;
  *(double *)&xmmword_1ED2CB7E8 = -v18.__sinval;
  *((_QWORD *)&xmmword_1ED2CB7E8 + 1) = *(_QWORD *)&v18.__cosval;
  minutes = self->_minutes;
  v27 = xmmword_1ED2CB808;
  v28 = *(_OWORD *)&qword_1ED2CB818;
  v29 = xmmword_1ED2CB828;
  v30 = unk_1ED2CB838;
  v23 = __cachedTransform;
  v24 = unk_1ED2CB7D8;
  v25 = xmmword_1ED2CB7E8;
  v26 = unk_1ED2CB7F8;
  -[CALayer setTransform:](minutes, "setTransform:", &v23);
  v20 = fmod((v12 / 60.0 + (double)v13) / 6.0 * 3.14159265, 6.28318531);
  v21 = __sincos_stret(v20);
  *(double *)&__cachedTransform = v21.__cosval;
  *((_QWORD *)&__cachedTransform + 1) = *(_QWORD *)&v21.__sinval;
  *(double *)&xmmword_1ED2CB7E8 = -v21.__sinval;
  *((_QWORD *)&xmmword_1ED2CB7E8 + 1) = *(_QWORD *)&v21.__cosval;
  hours = self->_hours;
  v27 = xmmword_1ED2CB808;
  v28 = *(_OWORD *)&qword_1ED2CB818;
  v29 = xmmword_1ED2CB828;
  v30 = unk_1ED2CB838;
  v23 = __cachedTransform;
  v24 = unk_1ED2CB7D8;
  v25 = xmmword_1ED2CB7E8;
  v26 = unk_1ED2CB7F8;
  -[CALayer setTransform:](hours, "setTransform:", &v23);
}

- (void)setIcon:(id)a3 location:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  void *v8;
  id v9;
  id v10;
  void *v11;
  objc_super v12;

  v5 = a5;
  v8 = (void *)MEMORY[0x1E0DA9DE8];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12.receiver = self;
  v12.super_class = (Class)SBHClockApplicationIconImageView;
  -[SBLiveIconImageView setIcon:location:animated:](&v12, sel_setIcon_location_animated_, v10, v9, v5);

  if (v10)
  {
    objc_msgSend(v11, "addObserver:", self);
    -[SBHClockApplicationIconImageView setNeedsLayout](self, "setNeedsLayout");
  }
  else
  {
    objc_msgSend(v11, "removeObserver:", self);
  }

}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  _OWORD v8[14];
  uint64_t v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBHClockApplicationIconImageView;
  -[SBIconImageView layoutSubviews](&v10, sel_layoutSubviews);
  v9 = 0;
  memset(v8, 0, sizeof(v8));
  -[SBHClockApplicationIconImageView getMetrics:](self, "getMetrics:", v8);
  if (!self->_minutes)
  {
    -[SBIconImageView icon](self, "icon");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[SBHClockApplicationIconImageView applyMetrics:](self, "applyMetrics:", v8);
      -[SBHClockApplicationIconImageView updateUnanimated](self, "updateUnanimated");
    }
  }
  UIRectGetCenter();
  v5 = v4;
  v7 = v6;
  -[CALayer setPosition:](self->_hourMinuteDot, "setPosition:");
  -[CALayer setPosition:](self->_hours, "setPosition:", v5, v7);
  -[CALayer setPosition:](self->_minutes, "setPosition:", v5, v7);
  -[CALayer setPosition:](self->_seconds, "setPosition:", v5, v7);
  -[CALayer setPosition:](self->_secondDot, "setPosition:", v5, v7);
}

- (void)getMetrics:(SBHClockApplicationIconImageMetrics *)a3
{
  double v4;
  double v5;
  double v6;
  double v7;

  -[SBIconImageView iconImageInfo](self, "iconImageInfo");
  objc_msgSend((id)objc_opt_class(), "getMetrics:forIconImageInfo:", a3, v4, v5, v6, v7);
}

+ (void)getMetrics:(SBHClockApplicationIconImageMetrics *)a3 forIconImageInfo:(SBIconImageInfo *)a4
{
  double v4;
  CGFloat v5;
  double v6;
  double v7;
  double v8;
  double v9;
  float64x2_t v10;
  double v11;
  double v12;
  double v13;
  float64x2_t v14;

  v8 = v4 * 0.00263671875;
  v9 = 1.0;
  if (v4 * 0.00263671875 < 1.0)
    v8 = 1.0;
  a3->secondsHandWidth = v8;
  a3->secondsHandLength = v4 * 0.392578125;
  a3->secondsHandleLength = v4 * 0.04296875;
  v10 = vmulq_n_f64((float64x2_t)xmmword_1D01915D0, v4);
  *(float64x2_t *)&a3->secondsHandRingDiameter = v10;
  v11 = v4 * 0.33984375;
  v12 = v4 * 0.05078125;
  a3->minutesHandRingDiameter = v4 * 0.05078125;
  a3->minutesHandRingKnockoutDiameter = v10.f64[0];
  v13 = v4 * 0.17578125;
  if (v4 * 0.0068359375 >= 1.0)
    v9 = v4 * 0.0068359375;
  a3->shadowRadius = v9;
  a3->shadowInset = 3.0;
  a3->separatorWidth = v4 * 0.015625;
  v14 = vmulq_n_f64((float64x2_t)xmmword_1D01915E0, v4);
  a3->minutesHandWidth = v14.f64[0];
  a3->minutesHandLength = v11;
  a3->hoursHandWidth = v14.f64[0];
  a3->hoursHandLength = v13;
  *(float64x2_t *)&a3->separatorLength = v14;
  a3->secondsHandBounds.width = v10.f64[0];
  a3->secondsHandBounds.height = v4 * 0.04296875 + v4 * 0.392578125 + v10.f64[0];
  a3->minutesHandBounds.width = v12;
  a3->minutesHandBounds.height = v14.f64[0] + v11 + v12;
  a3->hoursHandBounds.width = v12;
  a3->hoursHandBounds.height = v14.f64[0] + v13 + v12;
  a3->faceRadius = v4 * 0.434570312;
  a3->numberPointSize = v4 / 60.0 * 7.0;
  a3->contentsScale = v6;
  a3->iconImageInfo.size.width = v4;
  a3->iconImageInfo.size.height = v5;
  a3->iconImageInfo.scale = v6;
  a3->iconImageInfo.continuousCornerRadius = v7;
}

- (void)applyMetrics:(const SBHClockApplicationIconImageMetrics *)a3
{
  void *v5;
  void *v6;
  int v7;
  int v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  double v14;
  int v15;
  int v16;
  CALayer *v17;
  double v18;
  CALayer *seconds;
  CALayer *v20;
  CALayer *v21;
  double v22;
  CALayer *secondDot;
  id v24;

  -[SBHClockApplicationIconImageView effectiveIconImageAppearance](self, "effectiveIconImageAppearance");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  -[SBHClockApplicationIconImageView layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "imageSetForMetrics:imageAppearance:", a3, v24);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHClockApplicationIconImageView hourMinuteHandOpacity](self, "hourMinuteHandOpacity");
  v8 = v7;
  objc_msgSend((id)objc_opt_class(), "makeHoursHandLayerWithImageSet:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v10) = v8;
  objc_msgSend(v9, "setOpacity:", v10);
  objc_msgSend(v5, "addSublayer:", v9);
  -[CALayer removeFromSuperlayer](self->_hours, "removeFromSuperlayer");
  objc_storeStrong((id *)&self->_hours, v9);
  objc_msgSend((id)objc_opt_class(), "makeMinutesHandLayerWithImageSet:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = v8;
  objc_msgSend(v11, "setOpacity:", v12);
  objc_msgSend(v5, "addSublayer:", v11);
  -[CALayer removeFromSuperlayer](self->_minutes, "removeFromSuperlayer");
  objc_storeStrong((id *)&self->_minutes, v11);
  objc_msgSend((id)objc_opt_class(), "makeDotLayerWithOuterDiameter:innerDiameter:isSeconds:imageSet:", 0, v6, a3->minutesHandRingDiameter, a3->minutesHandRingKnockoutDiameter);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v14) = v8;
  objc_msgSend(v13, "setOpacity:", v14);
  objc_msgSend(v5, "addSublayer:", v13);
  -[CALayer removeFromSuperlayer](self->_hourMinuteDot, "removeFromSuperlayer");
  objc_storeStrong((id *)&self->_hourMinuteDot, v13);
  if ((objc_msgSend((id)objc_opt_class(), "hidesSecondsHand") & 1) == 0)
  {
    -[SBHClockApplicationIconImageView secondsHandOpacity](self, "secondsHandOpacity");
    v16 = v15;
    objc_msgSend((id)objc_opt_class(), "makeSecondsHandLayerWithImageSet:", v6);
    v17 = (CALayer *)objc_claimAutoreleasedReturnValue();
    LODWORD(v18) = v16;
    -[CALayer setOpacity:](v17, "setOpacity:", v18);
    objc_msgSend(v5, "addSublayer:", v17);
    -[CALayer removeFromSuperlayer](self->_seconds, "removeFromSuperlayer");
    seconds = self->_seconds;
    self->_seconds = v17;
    v20 = v17;

    objc_msgSend((id)objc_opt_class(), "makeDotLayerWithOuterDiameter:innerDiameter:isSeconds:imageSet:", 1, v6, a3->secondsHandRingDiameter, a3->secondsHandRingKnockoutDiameter);
    v21 = (CALayer *)objc_claimAutoreleasedReturnValue();
    LODWORD(v22) = v16;
    -[CALayer setOpacity:](v21, "setOpacity:", v22);
    objc_msgSend(v5, "addSublayer:", v21);
    -[CALayer removeFromSuperlayer](self->_secondDot, "removeFromSuperlayer");
    secondDot = self->_secondDot;
    self->_secondDot = v21;

  }
  -[SBHClockApplicationIconImageView setDisplayedHandsAppearance:](self, "setDisplayedHandsAppearance:", v24);
  -[SBIconImageView didAddSublayer](self, "didAddSublayer");

}

- (void)prepareForReuse
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBHClockApplicationIconImageView;
  -[SBLiveIconImageView prepareForReuse](&v3, sel_prepareForReuse);
  -[SBHClockApplicationIconImageView resetForegroundLayers](self, "resetForegroundLayers");
}

+ (id)makeDotLayerWithOuterDiameter:(double)a3 innerDiameter:(double)a4 isSeconds:(BOOL)a5 imageSet:(id)a6
{
  id v8;
  void *v9;
  id v10;
  double v11;
  double v12;
  _OWORD v14[14];
  uint64_t v15;

  v8 = a6;
  objc_msgSend(MEMORY[0x1E0CD27A8], "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5)
    objc_msgSend(v8, "secondDot");
  else
    objc_msgSend(v8, "hourMinuteDot");
  v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v9, "setContents:", objc_msgSend(v10, "CGImage"));
  objc_msgSend(v10, "size");
  objc_msgSend(v9, "setBounds:", 0.0, 0.0, v11, v12);
  objc_msgSend(v10, "scale");
  objc_msgSend(v9, "setContentsScale:");
  v15 = 0;
  memset(v14, 0, sizeof(v14));
  objc_msgSend(v8, "getMetrics:", v14);
  objc_msgSend(a1, "configureHandLayer:metrics:", v9, v14);

  return v9;
}

+ (void)configureHandLayer:(id)a3 metrics:(const SBHClockApplicationIconImageMetrics *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "setAllowsEdgeAntialiasing:", 1);
  objc_msgSend(v5, "setContentsScale:", a4->contentsScale);
  v9[0] = CFSTR("transform");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = CFSTR("transform.rotation");
  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setActions:", v8);

}

+ (id)makeSecondsHandLayerWithImageSet:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  v4 = (void *)MEMORY[0x1E0CD27A8];
  v5 = a3;
  objc_msgSend(v4, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "seconds");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v6, "setContents:", objc_msgSend(v7, "CGImage"));
  objc_msgSend(v7, "size");
  objc_msgSend(v6, "setBounds:", 0.0, 0.0, v8, v9);
  objc_msgSend(v7, "scale");
  objc_msgSend(v6, "setContentsScale:");
  v25 = 0;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(v5, "getMetrics:", &v11);

  objc_msgSend(v6, "setAnchorPoint:", 0.5, (*((double *)&v11 + 1) + *((double *)&v12 + 1) * 0.5) / *(double *)&v14);
  objc_msgSend(a1, "configureHandLayer:metrics:", v6, &v11);

  return v6;
}

+ (id)makeMinutesHandLayerWithImageSet:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  _OWORD v11[4];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  v4 = (void *)MEMORY[0x1E0CD27A8];
  v5 = a3;
  objc_msgSend(v4, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "minutes");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v6, "setContents:", objc_msgSend(v7, "CGImage"));
  objc_msgSend(v7, "size");
  objc_msgSend(v6, "setBounds:", 0.0, 0.0, v8, v9);
  objc_msgSend(v7, "scale");
  objc_msgSend(v6, "setContentsScale:");
  v22 = 0;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  memset(v11, 0, sizeof(v11));
  objc_msgSend(v5, "getMetrics:", v11);

  objc_msgSend(v6, "setAnchorPoint:", 0.5, (*(double *)&v15 + *(double *)&v12 + *(double *)&v18 + *((double *)&v12 + 1) * 0.5)/ (*(double *)&v15 + *(double *)&v15 + *(double *)&v14));
  objc_msgSend(a1, "configureHandLayer:metrics:", v6, v11);

  return v6;
}

+ (id)makeHoursHandLayerWithImageSet:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  double v8;
  double v9;
  _OWORD v11[4];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;

  v4 = (void *)MEMORY[0x1E0CD27A8];
  v5 = a3;
  objc_msgSend(v4, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hours");
  v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v6, "setContents:", objc_msgSend(v7, "CGImage"));
  objc_msgSend(v7, "size");
  objc_msgSend(v6, "setBounds:", 0.0, 0.0, v8, v9);
  objc_msgSend(v7, "scale");
  objc_msgSend(v6, "setContentsScale:");
  v22 = 0;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  memset(v11, 0, sizeof(v11));
  objc_msgSend(v5, "getMetrics:", v11);

  objc_msgSend(v6, "setAnchorPoint:", 0.5, (*(double *)&v15 + *(double *)&v16 + *(double *)&v18 + *((double *)&v12 + 1) * 0.5)/ (*(double *)&v15 + *(double *)&v15 + *(double *)&v17));
  objc_msgSend(a1, "configureHandLayer:metrics:", v6, v11);

  return v6;
}

+ (BOOL)hidesSecondsHand
{
  return __hidesSecondsHand;
}

- (id)squareContentsImage
{
  return -[SBHClockApplicationIconImageView contentsImageWithOptions:](self, "contentsImageWithOptions:", 0);
}

- (SBHClockApplicationIconImageView)initWithFrame:(CGRect)a3
{
  SBHClockApplicationIconImageView *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSString *currentNumberingSystem;
  SBHIconImageAppearanceStore *v8;
  SBHIconImageAppearanceStore *contentsImages;
  SBHIconImageAppearanceStore *v10;
  SBHIconImageAppearanceStore *squareContentsImages;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SBHClockApplicationIconImageView;
  v3 = -[SBIconImageView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, sel_localeDidChange_, *MEMORY[0x1E0C99720], 0);

    objc_msgSend((id)objc_opt_class(), "systemNumberingSystem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "copy");
    currentNumberingSystem = v3->_currentNumberingSystem;
    v3->_currentNumberingSystem = (NSString *)v6;

    v8 = objc_alloc_init(SBHIconImageAppearanceStore);
    contentsImages = v3->_contentsImages;
    v3->_contentsImages = v8;

    v10 = objc_alloc_init(SBHIconImageAppearanceStore);
    squareContentsImages = v3->_squareContentsImages;
    v3->_squareContentsImages = v10;

    -[SBHClockApplicationIconImageView layer](v3, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setNeedsLayoutOnGeometryChange:", 0);

  }
  return v3;
}

+ (id)systemNumberingSystem
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0D3EFB0];
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "numberingSystemForLocaleID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (void)initialize
{
  id v3;
  int v4;
  float v5;
  void *v6;
  id v7;
  CAFrameRateRange v8;

  objc_opt_self();
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1)
  {
    v4 = MGGetBoolAnswer();
    v5 = 10.0;
    if (v4)
      v5 = 8.0;
    v8 = CAFrameRateRangeMake(v5, 120.0, v5);
    __secondFrameRange_0 = LODWORD(v8.minimum);
    __secondFrameRange_1 = LODWORD(v8.maximum);
    __secondFrameRange_2 = LODWORD(v8.preferred);
    *(_QWORD *)&__cachedTransform = 0x3FF0000000000000;
    *((_QWORD *)&xmmword_1ED2CB7E8 + 1) = 0x3FF0000000000000;
    qword_1ED2CB818 = 0x3FF0000000000000;
    qword_1ED2CB840 = 0x3FF0000000000000;
    objc_msgSend(MEMORY[0x1E0DA9DE8], "sharedInstance");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "overrideDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setOverrideDate:", v6);

  }
}

+ (void)setOverrideDate:(id)a3
{
  uint64_t v3;
  void *v4;

  v3 = objc_msgSend(a3, "copy");
  v4 = (void *)__overrideDate;
  __overrideDate = v3;

}

+ (void)setOverrideDateOffset:(double)a3
{
  __overrideDateOffset = *(_QWORD *)&a3;
}

+ (void)setHidesSecondsHand:(BOOL)a3
{
  __hidesSecondsHand = a3;
}

+ (void)_handleTimeChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  _SBClockIconGetCalendar();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTimeZone:", v5);

  objc_msgSend(a1, "effectiveDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "components:fromDate:", 224, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = (id)__tickClients;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "_updateUnanimatedWithComponents:", v7, (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (void)resetForegroundLayers
{
  CALayer *hours;
  CALayer *minutes;
  CALayer *seconds;
  CALayer *secondDot;
  CALayer *hourMinuteDot;

  -[CALayer removeFromSuperlayer](self->_hours, "removeFromSuperlayer");
  hours = self->_hours;
  self->_hours = 0;

  -[CALayer removeFromSuperlayer](self->_minutes, "removeFromSuperlayer");
  minutes = self->_minutes;
  self->_minutes = 0;

  -[CALayer removeFromSuperlayer](self->_seconds, "removeFromSuperlayer");
  seconds = self->_seconds;
  self->_seconds = 0;

  -[CALayer removeFromSuperlayer](self->_secondDot, "removeFromSuperlayer");
  secondDot = self->_secondDot;
  self->_secondDot = 0;

  -[CALayer removeFromSuperlayer](self->_hourMinuteDot, "removeFromSuperlayer");
  hourMinuteDot = self->_hourMinuteDot;
  self->_hourMinuteDot = 0;

}

- (BOOL)shouldShowSecondsHand
{
  if (-[SBIconImageView isPaused](self, "isPaused"))
    return 0;
  else
    return !-[SBHClockApplicationIconImageView areHandsHidden](self, "areHandsHidden");
}

- (BOOL)shouldShowHourMinuteHands
{
  return !-[SBHClockApplicationIconImageView areHandsHidden](self, "areHandsHidden");
}

- (float)secondsHandOpacity
{
  _BOOL4 v2;
  float result;

  v2 = -[SBHClockApplicationIconImageView shouldShowSecondsHand](self, "shouldShowSecondsHand");
  result = 0.0;
  if (v2)
    return 1.0;
  return result;
}

- (float)hourMinuteHandOpacity
{
  _BOOL4 v2;
  float result;

  v2 = -[SBHClockApplicationIconImageView shouldShowHourMinuteHands](self, "shouldShowHourMinuteHands");
  result = 0.0;
  if (v2)
    return 1.0;
  return result;
}

- (void)setHandsHidden:(BOOL)a3
{
  -[SBHClockApplicationIconImageView setHandsHidden:animated:](self, "setHandsHidden:animated:", a3, 0);
}

- (void)setHandsHidden:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v6;
  double v7;
  float v8;
  double v9;
  _BOOL4 v10;
  double v11;
  float v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  id v20;

  if (self->_handsHidden != a3)
  {
    v4 = a4;
    self->_handsHidden = a3;
    v6 = -[SBHClockApplicationIconImageView shouldShowSecondsHand](self, "shouldShowSecondsHand");
    v8 = v6 ? 1.0 : 0.0;
    *(float *)&v7 = v8;
    -[CALayer setOpacity:](self->_seconds, "setOpacity:", v7);
    *(float *)&v9 = v8;
    -[CALayer setOpacity:](self->_secondDot, "setOpacity:", v9);
    v10 = -[SBHClockApplicationIconImageView shouldShowHourMinuteHands](self, "shouldShowHourMinuteHands");
    v12 = v10 ? 1.0 : 0.0;
    *(float *)&v11 = v12;
    -[CALayer setOpacity:](self->_minutes, "setOpacity:", v11);
    *(float *)&v13 = v12;
    -[CALayer setOpacity:](self->_hours, "setOpacity:", v13);
    *(float *)&v14 = v12;
    -[CALayer setOpacity:](self->_hourMinuteDot, "setOpacity:", v14);
    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
      v20 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setDuration:", 0.2);
      objc_msgSend(v20, "setFromValue:", &unk_1E8E16F10);
      if (v6)
        v15 = 1.0;
      else
        v15 = -1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setToValue:", v16);

      objc_msgSend(v20, "setAdditive:", 1);
      -[CALayer addAnimation:forKey:](self->_seconds, "addAnimation:forKey:", v20, CFSTR("HandsHidden"));
      -[CALayer addAnimation:forKey:](self->_secondDot, "addAnimation:forKey:", v20, CFSTR("HandsHidden"));
      objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setDuration:", 0.2);
      objc_msgSend(v17, "setFromValue:", &unk_1E8E16F10);
      if (v10)
        v18 = 1.0;
      else
        v18 = -1.0;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setToValue:", v19);

      objc_msgSend(v17, "setAdditive:", 1);
      -[CALayer addAnimation:forKey:](self->_minutes, "addAnimation:forKey:", v17, CFSTR("HandsHidden"));
      -[CALayer addAnimation:forKey:](self->_hours, "addAnimation:forKey:", v17, CFSTR("HandsHidden"));
      -[CALayer addAnimation:forKey:](self->_hourMinuteDot, "addAnimation:forKey:", v17, CFSTR("HandsHidden"));

    }
  }
}

+ (id)secondsHandColorWithImageAppearance:(id)a3
{
  id v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = objc_msgSend(v3, "appearanceType");
  if (v4 >= 2)
  {
    if (v4 == 2)
    {
      objc_msgSend(v3, "tintColor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.745098039, 1.0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_colorBlendedWithColor:compositingFilter:", v7, *MEMORY[0x1E0CD2E50]);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    if (v4 != 3)
    {
      v5 = 0;
      goto LABEL_7;
    }
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "orangeColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:

  return v5;
}

+ (id)hoursMinutesHandColorWithImageAppearance:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a3;
  switch(objc_msgSend(v3, "appearanceType"))
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 1:
    case 3:
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v4 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 2:
      objc_msgSend(v3, "tintColor");
      v4 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v5 = (void *)v4;
      break;
    default:
      v5 = 0;
      break;
  }

  return v5;
}

+ (id)makeComponentImageWithMetrics:(const SBHClockApplicationIconImageMetrics *)a3 size:(CGSize)a4 actions:(id)a5
{
  double height;
  double width;
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  height = a4.height;
  width = a4.width;
  v8 = (objc_class *)MEMORY[0x1E0DC3830];
  v9 = a5;
  v10 = objc_alloc_init(v8);
  objc_msgSend(v10, "setScale:", a3->contentsScale);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:format:", v10, width, height);
  objc_msgSend(v11, "imageWithActions:", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)makeComponentImageWithMetrics:(const SBHClockApplicationIconImageMetrics *)a3 size:(CGSize)a4 path:(CGPath *)a5 fillColor:(id)a6 options:(unint64_t)a7
{
  double height;
  double width;
  id v13;
  double v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  const SBHClockApplicationIconImageMetrics *v20;
  CGPath *v21;
  unint64_t v22;
  char v23;

  height = a4.height;
  width = a4.width;
  v13 = a6;
  if ((a7 & 1) != 0)
  {
    v14 = a3->shadowInset + a3->shadowInset;
    width = width + v14;
    height = height + v14;
  }
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __94__SBHClockApplicationIconImageView_makeComponentImageWithMetrics_size_path_fillColor_options___block_invoke;
  v18[3] = &unk_1E8D89E88;
  v23 = a7 & 1;
  v19 = v13;
  v20 = a3;
  v21 = a5;
  v22 = a7;
  v15 = v13;
  objc_msgSend(a1, "makeComponentImageWithMetrics:size:actions:", a3, v18, width, height);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

void __94__SBHClockApplicationIconImageView_makeComponentImageWithMetrics_size_path_fillColor_options___block_invoke(uint64_t a1, void *a2)
{
  CGContext *v3;
  CGContext *v4;
  CGColor *GenericGray;

  v3 = (CGContext *)objc_msgSend(a2, "CGContext");
  v4 = v3;
  if (*(_BYTE *)(a1 + 64))
    CGContextTranslateCTM(v3, *(CGFloat *)(*(_QWORD *)(a1 + 40) + 112), *(CGFloat *)(*(_QWORD *)(a1 + 40) + 112));
  objc_msgSend(*(id *)(a1 + 32), "set");
  if (*(_BYTE *)(a1 + 64))
  {
    GenericGray = CGColorCreateGenericGray(0.0, 0.3);
    CGContextSetShadowWithColor(v4, *MEMORY[0x1E0C9D820], *(CGFloat *)(*(_QWORD *)(a1 + 40) + 104), GenericGray);
    CGColorRelease(GenericGray);
  }
  CGContextAddPath(v4, *(CGPathRef *)(a1 + 48));
  CGContextDrawPath(v4, (CGPathDrawingMode)((*(_DWORD *)(a1 + 56) >> 1) & 1));
}

+ (id)makeDotImageWithOuterDiameter:(double)a3 innerDiameter:(double)a4 color:(id)a5 isSeconds:(BOOL)a6 metrics:(const SBHClockApplicationIconImageMetrics *)a7
{
  _BOOL4 v8;
  id v12;
  CGPath *Mutable;
  uint64_t v14;
  void *v15;
  CGRect v17;
  CGRect v18;

  v8 = a6;
  v12 = a5;
  Mutable = CGPathCreateMutable();
  v17.origin.x = (a3 - a4) * 0.5;
  v17.origin.y = v17.origin.x;
  v17.size.width = a4;
  v17.size.height = a4;
  CGPathAddEllipseInRect(Mutable, 0, v17);
  v18.origin.x = 0.0;
  v18.origin.y = 0.0;
  v18.size.width = a3;
  v18.size.height = a3;
  CGPathAddEllipseInRect(Mutable, 0, v18);
  if (v8)
    v14 = 2;
  else
    v14 = 3;
  objc_msgSend(a1, "makeComponentImageWithMetrics:size:path:fillColor:options:", a7, Mutable, v12, v14, a3, a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  CGPathRelease(Mutable);
  return v15;
}

+ (id)makeSecondsHandImageWithMetrics:(const SBHClockApplicationIconImageMetrics *)a3 imageAppearance:(id)a4
{
  void *v6;
  double v7;
  CGPath *Mutable;
  void *v9;
  CGRect v11;
  CGRect v12;

  objc_msgSend(a1, "secondsHandColorWithImageAppearance:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = a3->secondsHandRingDiameter * 0.5;
  Mutable = CGPathCreateMutable();
  v11.size.width = a3->secondsHandWidth;
  v11.size.height = a3->secondsHandLength;
  v11.origin.x = v7 - a3->secondsHandWidth * 0.5;
  v11.origin.y = 0.0;
  CGPathAddRect(Mutable, 0, v11);
  v12.size.width = a3->secondsHandWidth;
  v12.origin.x = v7 - a3->secondsHandWidth * 0.5;
  v12.size.height = a3->secondsHandleLength;
  v12.origin.y = a3->secondsHandLength + a3->secondsHandRingDiameter;
  CGPathAddRect(Mutable, 0, v12);
  objc_msgSend(a1, "makeComponentImageWithMetrics:size:path:fillColor:options:", a3, Mutable, v6, 0, a3->secondsHandBounds.width, a3->secondsHandBounds.height);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  CGPathRelease(Mutable);

  return v9;
}

+ (id)makeMinutesHandImageWithMetrics:(const SBHClockApplicationIconImageMetrics *)a3 imageAppearance:(id)a4
{
  void *v6;
  CGFloat v7;
  CGPath *Mutable;
  double separatorExtraLength;
  double minutesHandWidth;
  CGFloat v11;
  void *v12;
  CGRect v14;

  objc_msgSend(a1, "hoursMinutesHandColorWithImageAppearance:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = a3->minutesHandRingDiameter * 0.5;
  Mutable = CGPathCreateMutable();
  v14.size.width = a3->separatorWidth;
  v14.origin.x = v7 - v14.size.width * 0.5;
  separatorExtraLength = a3->separatorExtraLength;
  v14.origin.y = a3->minutesHandLength - separatorExtraLength;
  v14.size.height = separatorExtraLength + separatorExtraLength + a3->separatorLength;
  CGPathAddRect(Mutable, 0, v14);
  minutesHandWidth = a3->minutesHandWidth;
  v11 = minutesHandWidth * 0.5;
  CGPathMoveToPoint(Mutable, 0, v7 - minutesHandWidth * 0.5, minutesHandWidth);
  CGPathAddArc(Mutable, 0, v7, v11, v11, 3.14159265, 0.0, 0);
  CGPathAddLineToPoint(Mutable, 0, v7 + v11, a3->minutesHandLength - a3->minutesHandWidth);
  CGPathAddArc(Mutable, 0, v7, a3->minutesHandLength - v11, v11, 0.0, 3.14159265, 0);
  CGPathCloseSubpath(Mutable);
  objc_msgSend(a1, "makeComponentImageWithMetrics:size:path:fillColor:options:", a3, Mutable, v6, 1, a3->minutesHandBounds.width, a3->minutesHandBounds.height);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  CGPathRelease(Mutable);

  return v12;
}

+ (id)makeHoursHandImageWithMetrics:(const SBHClockApplicationIconImageMetrics *)a3 imageAppearance:(id)a4
{
  void *v6;
  CGFloat v7;
  CGPath *Mutable;
  double separatorExtraLength;
  double hoursHandWidth;
  CGFloat v11;
  void *v12;
  CGRect v14;

  objc_msgSend(a1, "hoursMinutesHandColorWithImageAppearance:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = a3->minutesHandRingDiameter * 0.5;
  Mutable = CGPathCreateMutable();
  v14.size.width = a3->separatorWidth;
  v14.origin.x = v7 - v14.size.width * 0.5;
  separatorExtraLength = a3->separatorExtraLength;
  v14.origin.y = a3->hoursHandLength - separatorExtraLength;
  v14.size.height = separatorExtraLength + separatorExtraLength + a3->separatorLength;
  CGPathAddRect(Mutable, 0, v14);
  hoursHandWidth = a3->hoursHandWidth;
  v11 = hoursHandWidth * 0.5;
  CGPathMoveToPoint(Mutable, 0, v7 - hoursHandWidth * 0.5, hoursHandWidth);
  CGPathAddArc(Mutable, 0, v7, v11, v11, 3.14159265, 0.0, 0);
  CGPathAddLineToPoint(Mutable, 0, v7 + v11, a3->hoursHandLength - a3->hoursHandWidth);
  CGPathAddArc(Mutable, 0, v7, a3->hoursHandLength - v11, v11, 0.0, 3.14159265, 0);
  CGPathCloseSubpath(Mutable);
  objc_msgSend(a1, "makeComponentImageWithMetrics:size:path:fillColor:options:", a3, Mutable, v6, 1, a3->hoursHandBounds.width, a3->hoursHandBounds.height);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  CGPathRelease(Mutable);

  return v12;
}

+ (id)makeImageSetForMetrics:(const SBHClockApplicationIconImageMetrics *)a3 imageAppearance:(id)a4
{
  id v6;
  SBHClockHandsImageSet *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a4;
  v7 = objc_alloc_init(SBHClockHandsImageSet);
  -[SBHClockHandsImageSet setMetrics:](v7, "setMetrics:", a3);
  objc_msgSend(a1, "makeHoursHandImageWithMetrics:imageAppearance:", a3, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHClockHandsImageSet setHours:](v7, "setHours:", v8);
  objc_msgSend(a1, "makeMinutesHandImageWithMetrics:imageAppearance:", a3, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHClockHandsImageSet setMinutes:](v7, "setMinutes:", v9);
  objc_msgSend(a1, "makeSecondsHandImageWithMetrics:imageAppearance:", a3, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHClockHandsImageSet setSeconds:](v7, "setSeconds:", v10);
  objc_msgSend(a1, "hoursMinutesHandColorWithImageAppearance:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "makeDotImageWithOuterDiameter:innerDiameter:color:isSeconds:metrics:", v11, 0, a3, a3->minutesHandRingDiameter, a3->minutesHandRingKnockoutDiameter);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHClockHandsImageSet setHourMinuteDot:](v7, "setHourMinuteDot:", v12);
  objc_msgSend(a1, "secondsHandColorWithImageAppearance:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "makeDotImageWithOuterDiameter:innerDiameter:color:isSeconds:metrics:", v13, 1, a3, a3->secondsHandRingDiameter, a3->secondsHandRingKnockoutDiameter);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHClockHandsImageSet setSecondDot:](v7, "setSecondDot:", v14);

  return v7;
}

+ (id)imageSetForMetrics:(const SBHClockApplicationIconImageMetrics *)a3 imageAppearance:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  SBHIconImageAppearanceStore *v9;
  uint64_t v10;
  void *v11;
  id v13;
  void *v14;

  v6 = a4;
  +[SBHIconImageAppearanceStore defaultIcon](SBHIconImageAppearanceStore, "defaultIcon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3->iconImageInfo.size.width);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)imageSetForMetrics_imageAppearance___cachedImageSets, "objectForKey:", v8);
  v9 = (SBHIconImageAppearanceStore *)objc_claimAutoreleasedReturnValue();
  -[SBHIconImageAppearanceStore imageForIcon:appearance:](v9, "imageForIcon:appearance:", v7, v6);
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(a1, "makeImageSetForMetrics:imageAppearance:", a3, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (imageSetForMetrics_imageAppearance___cachedImageSets)
    {
      if (v9)
      {
LABEL_5:
        -[SBHIconImageAppearanceStore setImage:forIcon:appearance:](v9, "setImage:forIcon:appearance:", v11, v7, v6);
        goto LABEL_6;
      }
    }
    else
    {
      v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v14 = (void *)imageSetForMetrics_imageAppearance___cachedImageSets;
      imageSetForMetrics_imageAppearance___cachedImageSets = (uint64_t)v13;

      if (v9)
        goto LABEL_5;
    }
    v9 = objc_alloc_init(SBHIconImageAppearanceStore);
    objc_msgSend((id)imageSetForMetrics_imageAppearance___cachedImageSets, "setObject:forKey:", v9, v8);
    goto LABEL_5;
  }
  v11 = (void *)v10;
LABEL_6:

  return v11;
}

+ (id)cacheKeyForIconImageWithImageInfo:(SBIconImageInfo *)a3 imageAppearance:(id)a4 options:(unint64_t)a5
{
  uint64_t v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;

  v7 = (char)a4;
  v8 = v6;
  v9 = v5;
  objc_msgSend(a1, "numbersImageNameWithImageInfo:", a3, a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc(MEMORY[0x1E0CB3940]);
  v12 = 77;
  if ((v7 & 1) == 0)
    v12 = 109;
  v13 = (void *)objc_msgSend(v11, "initWithFormat:", CFSTR("%@:%fx%f:%c"), v10, v9, v8, v12);

  return v13;
}

+ (id)appearanceStoreIcon
{
  BSDispatchQueueAssertMain();
  return +[SBHIconImageAppearanceStore defaultIcon](SBHIconImageAppearanceStore, "defaultIcon");
}

+ (id)cachedIconImageWithImageInfo:(SBIconImageInfo *)a3 imageAppearance:(id)a4 options:(unint64_t)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v10;
  double v11;
  double v12;
  double v13;
  SBIconImageInfo *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v10 = v8;
  v11 = v7;
  v12 = v6;
  v13 = v5;
  v15 = a3;
  BSDispatchQueueAssertMain();
  objc_msgSend(a1, "cacheKeyForIconImageWithImageInfo:imageAppearance:options:", v15, a4, v13, v12, v11, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "appearanceStoreIcon");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sharedIconImageCache, "objectForKey:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "imageForIcon:appearance:", v17, v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)iconImageWithImageInfo:(SBIconImageInfo *)a3 imageAppearance:(id)a4 options:(unint64_t)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v10;
  double v11;
  double v12;
  double v13;
  SBIconImageInfo *v15;
  void *v16;
  void *v17;
  id v18;

  v10 = v8;
  v11 = v7;
  v12 = v6;
  v13 = v5;
  v15 = a3;
  BSDispatchQueueAssertMain();
  objc_msgSend(a1, "cachedIconImageWithImageInfo:imageAppearance:options:", v15, a4, v13, v12, v11, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    v18 = v16;
  }
  else
  {
    objc_msgSend(a1, "makeIconImageWithImageInfo:imageAppearance:options:", v15, a4, v13, v12, v11, v10);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "cacheIconImage:forIconImageInfo:imageAppearance:options:", v18, v15, a4, v13, v12, v11, v10);
  }

  return v18;
}

+ (void)cacheIconImage:(id)a3 forIconImageInfo:(SBIconImageInfo *)a4 imageAppearance:(id)a5 options:(unint64_t)a6
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v12;
  double v13;
  double v14;
  double v15;
  SBIconImageInfo *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  SBHIconImageAppearanceStore *v22;
  void *v23;
  id v24;

  v12 = v9;
  v13 = v8;
  v14 = v7;
  v15 = v6;
  v24 = a3;
  v17 = a4;
  BSDispatchQueueAssertMain();
  objc_msgSend(a1, "cacheKeyForIconImageWithImageInfo:imageAppearance:options:", v17, a5, v15, v14, v13, v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)sharedIconImageCache;
  if (!sharedIconImageCache)
  {
    v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v21 = (void *)sharedIconImageCache;
    sharedIconImageCache = (uint64_t)v20;

    v19 = (void *)sharedIconImageCache;
  }
  objc_msgSend(v19, "objectForKey:", v18);
  v22 = (SBHIconImageAppearanceStore *)objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
    v22 = objc_alloc_init(SBHIconImageAppearanceStore);
    objc_msgSend((id)sharedIconImageCache, "setObject:forKey:", v22, v18);
  }
  if (v24)
  {
    objc_msgSend(a1, "appearanceStoreIcon");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHIconImageAppearanceStore setImage:forIcon:appearance:](v22, "setImage:forIcon:appearance:", v24, v23, v17);

  }
}

+ (id)makeIconImageWithImageInfo:(SBIconImageInfo *)a3 imageAppearance:(id)a4 options:(unint64_t)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  CGColorSpace *DeviceRGB;
  CGContext *v20;
  id v21;
  CGImage *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  CGFloat v27;
  CGFloat v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  double v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  double v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  uint64_t v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  void *v59;
  char v60;
  void *v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  id v66;
  id v67;
  void *v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v75;
  void *v76;
  void *v77;
  int v78;
  void *v79;
  void *v80;
  void *v81;
  SBIconImageInfo *v82;
  _QWORD v83[4];
  id v84;
  double v85;
  double v86;
  double v87;
  double v88;
  _QWORD v89[4];
  id v90;
  id v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  uint64_t v97;
  uint64_t v98;
  double v99;
  double v100;
  void *v101;
  _DWORD data[8];
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  uint64_t v115;
  uint64_t v116;
  CGSize v117;
  CGRect v118;

  v78 = (int)a4;
  v9 = v8;
  v10 = v7;
  v11 = v6;
  v12 = v5;
  v116 = *MEMORY[0x1E0C80C00];
  v82 = a3;
  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithArtworkSubtype:", SBFEffectiveArtworkSubtype());
  v14 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "numbersImageNameWithImageInfo:", v12, v11, v10, v9);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0DC3870];
  SBHBundle();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "imageNamed:inBundle:compatibleWithTraitCollection:", v15, v17, v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v18)
  {
    SBLogClock();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
      +[SBHClockApplicationIconImageView makeIconImageWithImageInfo:imageAppearance:options:].cold.1(v24);

    goto LABEL_23;
  }
  data[0] = 0;
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v20 = CGBitmapContextCreate(data, 1uLL, 1uLL, 8uLL, 0x20uLL, DeviceRGB, 1u);
  CGColorSpaceRelease(DeviceRGB);
  if (v20)
  {
    v21 = objc_retainAutorelease(v18);
    v22 = (CGImage *)objc_msgSend(v21, "CGImage");
    v118.origin.x = 0.0;
    v118.origin.y = 0.0;
    v118.size.width = 1.0;
    v118.size.height = 1.0;
    CGContextDrawImage(v20, v118, v22);
    if (!LOBYTE(data[0]) && __PAIR16__(BYTE1(data[0]), 0) == BYTE2(data[0]))
    {

      SBLogClock();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
        +[SBHClockApplicationIconImageView makeIconImageWithImageInfo:imageAppearance:options:].cold.2();
LABEL_22:

      CGContextRelease(v20);
LABEL_23:
      objc_msgSend(a1, "fallbackNumbersImageWithIconImageInfo:", v12, v11, v10, v9);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_24;
    }
    if (LOBYTE(data[0]) == 255 && BYTE1(data[0]) == 255 && BYTE2(data[0]) == 255)
    {

      SBLogClock();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
        +[SBHClockApplicationIconImageView makeIconImageWithImageInfo:imageAppearance:options:].cold.3();
      goto LABEL_22;
    }
    if (!HIBYTE(data[0]))
    {

      SBLogClock();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
        +[SBHClockApplicationIconImageView makeIconImageWithImageInfo:imageAppearance:options:].cold.4();
      goto LABEL_22;
    }
    CGContextRelease(v20);
  }
  SBLogClock();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "_referenceBounds");
    v117.width = v27;
    v117.height = v28;
    NSStringFromCGSize(v117);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "scale");
    data[0] = 138543618;
    *(_QWORD *)&data[1] = v29;
    LOWORD(data[3]) = 2048;
    *(_QWORD *)((char *)&data[3] + 2) = v31;
    _os_log_impl(&dword_1CFEF3000, v25, OS_LOG_TYPE_DEFAULT, "Found clock icon asset with size(%{public}@) in scale(%f)!", (uint8_t *)data, 0x16u);

  }
LABEL_24:
  v80 = (void *)v15;
  v81 = (void *)v14;
  switch(-[SBIconImageInfo appearanceType](v82, "appearanceType"))
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = (void *)MEMORY[0x1E0DC3658];
      v34 = 1.0;
      goto LABEL_28;
    case 1:
    case 3:
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
      v32 = objc_claimAutoreleasedReturnValue();
      v33 = (void *)MEMORY[0x1E0DC3658];
      v34 = 0.18;
LABEL_28:
      objc_msgSend(v33, "colorWithRed:green:blue:alpha:", 0.960784314, 0.960784314, 0.97254902, v34);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 0;
      if (v32)
        goto LABEL_29;
      goto LABEL_31;
    case 2:
      -[SBIconImageInfo tintColor](v82, "tintColor");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 1.0, 0.15);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = *MEMORY[0x1E0CD2E50];
      objc_msgSend(v38, "_colorBlendedWithColor:compositingFilter:", v39, *MEMORY[0x1E0CD2E50]);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "colorWithAlphaComponent:", 0.85);
      v42 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.960784314, 0.960784314, 0.97254902, 0.18);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "_colorBlendedWithColor:compositingFilter:", v43, v40);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "colorWithAlphaComponent:", 0.18);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      v32 = v42;
      v35 = v38;

      if (v32)
      {
LABEL_29:
        v76 = (void *)v32;
        objc_msgSend(v18, "imageWithTintColor:", v32);
        v37 = objc_claimAutoreleasedReturnValue();

        v18 = (void *)v37;
      }
      else
      {
LABEL_31:
        v76 = 0;
      }
      break;
    default:
      v76 = 0;
      v35 = 0;
      v36 = 0;
      break;
  }
  v115 = 0;
  v113 = 0u;
  v114 = 0u;
  v111 = 0u;
  v112 = 0u;
  v109 = 0u;
  v110 = 0u;
  v107 = 0u;
  v108 = 0u;
  v105 = 0u;
  v106 = 0u;
  v103 = 0u;
  v104 = 0u;
  memset(data, 0, sizeof(data));
  objc_msgSend(a1, "getMetrics:forIconImageInfo:", data, v12, v11, v10, v9);
  v97 = 0;
  v98 = 0;
  v45 = *(double *)&v112 + *(double *)&v112;
  objc_msgSend(MEMORY[0x1E0DC3830], "preferredFormat");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setOpaque:", 1);
  v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:format:", v46, v12, v11);
  v89[0] = MEMORY[0x1E0C809B0];
  v89[1] = 3221225472;
  v89[2] = __87__SBHClockApplicationIconImageView_makeIconImageWithImageInfo_imageAppearance_options___block_invoke;
  v89[3] = &unk_1E8D89EB0;
  v92 = v12;
  v93 = v11;
  v94 = v10;
  v95 = v9;
  v96 = v45;
  v99 = v12;
  v100 = v11;
  v48 = v36;
  v90 = v48;
  v49 = v18;
  v91 = v49;
  v77 = v47;
  objc_msgSend(v47, "imageWithActions:", v89);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBHIconImageAppearance lightAppearance](SBHIconImageAppearance, "lightAppearance");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_alloc(MEMORY[0x1E0D3A7C0]);
  v53 = objc_retainAutorelease(v50);
  v54 = objc_msgSend(v53, "CGImage");
  objc_msgSend(v53, "scale");
  v55 = (void *)objc_msgSend(v52, "initWithCGImage:scale:", v54);
  v56 = objc_alloc(MEMORY[0x1E0D3A820]);
  v101 = v55;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v101, 1);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = (void *)objc_msgSend(v56, "initWithImages:", v57);

  v59 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A830]), "initWithSize:scale:", v12, v11, v10);
  v60 = SBHIconServicesOptionsForImageOptions(v78);
  v79 = v51;
  SBHModifyImageDescriptorWithImageAppearance(v59, v51, v60);
  objc_msgSend(v58, "prepareImageForDescriptor:", v59);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v61;
  if (!v61)
    goto LABEL_34;
  v75 = (void *)MEMORY[0x1E0DC3870];
  v63 = v58;
  v64 = v53;
  v65 = v55;
  v66 = v48;
  v67 = v49;
  v68 = v46;
  v69 = v35;
  v70 = objc_msgSend(v61, "CGImage");
  objc_msgSend(v62, "scale");
  v71 = v70;
  v35 = v69;
  v46 = v68;
  v49 = v67;
  v48 = v66;
  v55 = v65;
  v53 = v64;
  v58 = v63;
  objc_msgSend(v75, "imageWithCGImage:scale:orientation:", v71, 0);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v72)
  {
LABEL_34:
    v73 = (void *)MEMORY[0x1E0DC3870];
    v83[0] = MEMORY[0x1E0C809B0];
    v83[1] = 3221225472;
    v83[2] = __87__SBHClockApplicationIconImageView_makeIconImageWithImageInfo_imageAppearance_options___block_invoke_2;
    v83[3] = &unk_1E8D84E58;
    v85 = v12;
    v86 = v11;
    v87 = v10;
    v88 = v9;
    v84 = v49;
    objc_msgSend(v73, "sbf_imageFromContextWithSize:scale:type:pool:drawing:", 0, 0, v83, v12, v11, v10);
    v72 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v72;
}

void __87__SBHClockApplicationIconImageView_makeIconImageWithImageInfo_imageAppearance_options___block_invoke(uint64_t a1, void *a2)
{
  CGContext *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  const __CFArray *v8;
  CGColorSpace *ColorSpace;
  CGGradient *v10;
  void *v11;
  void *v12;
  void *values[3];
  CGPoint v14;

  values[2] = *(void **)MEMORY[0x1E0C80C00];
  v3 = (CGContext *)objc_msgSend(a2, "CGContext");
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.192156863, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0784313725, 1.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_retainAutorelease(v4);
  values[0] = (void *)objc_msgSend(v6, "CGColor");
  v7 = objc_retainAutorelease(v5);
  values[1] = (void *)objc_msgSend(v7, "CGColor");
  v8 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)values, 2, MEMORY[0x1E0C9B378]);
  ColorSpace = CGBitmapContextGetColorSpace(v3);
  v10 = CGGradientCreateWithColors(ColorSpace, v8, 0);
  CFRelease(v8);
  v14.y = *(CGFloat *)(a1 + 56);
  v14.x = 0.0;
  CGContextDrawLinearGradient(v3, v10, *MEMORY[0x1E0C9D538], v14, 0);
  CGGradientRelease(v10);
  v11 = (void *)MEMORY[0x1E0DC3508];
  UIRectCenteredRect();
  objc_msgSend(v11, "bezierPathWithOvalInRect:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "set");
  objc_msgSend(v12, "fill");
  objc_msgSend(*(id *)(a1 + 40), "drawInRect:", *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112));

}

void __87__SBHClockApplicationIconImageView_makeIconImageWithImageInfo_imageAppearance_options___block_invoke_2(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  id v5;

  v2 = *(double *)(a1 + 40);
  v3 = *(double *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0DC3508], "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, v2, v3, *(double *)(a1 + 64));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addClip");
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "set");

  objc_msgSend(v5, "fill");
  objc_msgSend(*(id *)(a1 + 32), "drawInRect:", 0.0, 0.0, v2, v3);

}

+ (id)fallbackNumbersImageWithIconImageInfo:(SBIconImageInfo *)a3
{
  double v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  double v32;
  double v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;

  v7 = v6;
  v8 = v5;
  v9 = v4;
  v10 = v3;
  v50 = 0;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  objc_msgSend(a1, "getMetrics:forIconImageInfo:", &v36, v3);
  objc_msgSend(MEMORY[0x1E0DC3830], "preferredFormat");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPreferredRange:", 32766);
  objc_msgSend(v11, "setOpaque:", 1);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3828]), "initWithSize:format:", v11, v10, v9);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __74__SBHClockApplicationIconImageView_fallbackNumbersImageWithIconImageInfo___block_invoke;
  v16[3] = &__block_descriptor_296_e40_v16__0__UIGraphicsImageRendererContext_8l;
  v29 = v48;
  v30 = v49;
  v31 = v50;
  v25 = v44;
  v26 = v45;
  v28 = v47;
  v27 = v46;
  v21 = v40;
  v22 = v41;
  v24 = v43;
  v23 = v42;
  v17 = v36;
  v18 = v37;
  v20 = v39;
  v19 = v38;
  v32 = v10;
  v33 = v9;
  v34 = v8;
  v35 = v7;
  objc_msgSend(v12, "imageWithActions:", v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "imageWithRenderingMode:", 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

void __74__SBHClockApplicationIconImageView_fallbackNumbersImageWithIconImageInfo___block_invoke(double *a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __double2 v13;
  double v14;
  double v15;
  __double2 v16;
  __double2 v17;
  double v18;
  double v19;
  double v20;
  double v21;
  _QWORD v22[2];
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  objc_msgSend(v2, "setFormattingContext:", 2);
  objc_msgSend(v2, "setNumberStyle:", 1);
  v22[0] = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", a1[27]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v3;
  v22[1] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = 0;
  v20 = a1[26] * 0.8;
  v21 = a1[33] * 0.5;
  v7 = a1[34] * 0.5;
  v8 = -v20;
  do
  {
    v9 = (double)v6 * 0.523598776;
    v10 = 1;
    while (v9 > 1.57079633)
    {
      v9 = v9 + -1.57079633;
      ++v10;
    }
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "stringFromNumber:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(v2, "stringFromNumber:", &unk_1E8E16D38);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (v10 == 3)
    {
      v17 = __sincos_stret(v9);
      v14 = v21 + v8 * v17.__sinval;
      v15 = v7 + v20 * v17.__cosval;
    }
    else if (v10 == 2)
    {
      v16 = __sincos_stret(v9);
      v14 = v21 + v20 * v16.__cosval;
      v15 = v7 + v20 * v16.__sinval;
    }
    else
    {
      v13 = __sincos_stret(1.57079633 - v9);
      if (v10 == 1)
      {
        v14 = v21 + v20 * v13.__cosval;
        v15 = v7 + v8 * v13.__sinval;
      }
      else
      {
        v14 = v21 + v8 * v13.__sinval;
        v15 = v7 + v8 * v13.__cosval;
      }
    }
    objc_msgSend(v12, "sizeWithAttributes:", v5);
    objc_msgSend(v12, "drawAtPoint:withAttributes:", v5, v14 - v18 * 0.5, v15 - v19 * 0.5);

    ++v6;
  }
  while (v6 != 12);

}

+ (void)precacheDataWithIconImageInfo:(SBIconImageInfo *)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v12;

  v7 = v6;
  v8 = v5;
  v9 = v4;
  v10 = v3;
  +[SBHIconImageAppearance defaultAppearance](SBHIconImageAppearance, "defaultAppearance", a3);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "precacheDataWithIconImageInfo:appearance:", v12, v10, v9, v8, v7);

}

+ (void)precacheDataWithIconImageInfo:(SBIconImageInfo *)a3 appearance:(id)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  SBIconImageInfo *v13;

  v8 = v7;
  v9 = v6;
  v10 = v5;
  v11 = v4;
  v13 = a3;
  objc_msgSend(a1, "precacheDataWithIconImageInfo:appearance:options:", v13, 1, v11, v10, v9, v8);
  objc_msgSend(a1, "precacheDataWithIconImageInfo:appearance:options:", v13, 0, v11, v10, v9, v8);

}

+ (void)precacheDataWithIconImageInfo:(SBIconImageInfo *)a3 appearance:(id)a4 options:(unint64_t)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v10;
  double v11;
  double v12;
  double v13;
  SBIconImageInfo *v15;
  void *v16;
  NSObject *v17;
  uint64_t Serial;
  void *v19;
  _QWORD block[4];
  SBIconImageInfo *v21;
  id v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;

  v10 = v8;
  v11 = v7;
  v12 = v6;
  v13 = v5;
  v15 = a3;
  objc_msgSend(a1, "cachedIconImageWithImageInfo:imageAppearance:options:", v15, a4, v13, v12, v11, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    v17 = precacheDataWithIconImageInfo_appearance_options__precachingQueue;
    if (!precacheDataWithIconImageInfo_appearance_options__precachingQueue)
    {
      Serial = BSDispatchQueueCreateSerial();
      v19 = (void *)precacheDataWithIconImageInfo_appearance_options__precachingQueue;
      precacheDataWithIconImageInfo_appearance_options__precachingQueue = Serial;

      v17 = precacheDataWithIconImageInfo_appearance_options__precachingQueue;
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __85__SBHClockApplicationIconImageView_precacheDataWithIconImageInfo_appearance_options___block_invoke;
    block[3] = &unk_1E8D88798;
    v22 = a1;
    v23 = v13;
    v24 = v12;
    v25 = v11;
    v26 = v10;
    v21 = v15;
    v27 = a4;
    dispatch_async(v17, block);

  }
}

void __85__SBHClockApplicationIconImageView_precacheDataWithIconImageInfo_appearance_options___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  __int128 v5;

  objc_msgSend(*(id *)(a1 + 40), "makeIconImageWithImageInfo:imageAppearance:options:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 80), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_OWORD *)(a1 + 32);
  v3 = (id)v5;
  v4 = v2;
  BSDispatchMain();

}

uint64_t __85__SBHClockApplicationIconImageView_precacheDataWithIconImageInfo_appearance_options___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 48), "cacheIconImage:forIconImageInfo:imageAppearance:options:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 88), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
}

+ (id)numbersImageNameWithImageInfo:(SBIconImageInfo *)a3
{
  double v3;
  const __CFString *v5;
  const __CFString *v6;
  void *v7;
  char v8;
  const __CFString *v9;
  void *v10;
  int v11;

  if (v3 >= 76.0)
  {
    v6 = CFSTR("1024");
    if (v3 < 100.0)
      v6 = CFSTR("83");
    if (v3 >= 83.0)
      v5 = v6;
    else
      v5 = CFSTR("76");
  }
  else
  {
    v5 = CFSTR("60");
  }
  objc_msgSend(a1, "systemNumberingSystem", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("arab"));

  if ((v8 & 1) != 0)
  {
    v9 = CFSTR("Arabic");
  }
  else
  {
    objc_msgSend(a1, "systemNumberingSystem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("deva"));

    v9 = &stru_1E8D8E958;
    if (v11)
      v9 = CFSTR("Devanagari");
  }
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ClockIconNumbers%@%@"), v9, v5);
}

+ (BOOL)generatesContentsImage
{
  return 1;
}

+ (id)cacheKeyIcon
{
  if (cacheKeyIcon_onceToken != -1)
    dispatch_once(&cacheKeyIcon_onceToken, &__block_literal_global_47);
  return (id)cacheKeyIcon_cacheKeyIcon;
}

void __48__SBHClockApplicationIconImageView_cacheKeyIcon__block_invoke()
{
  SBIcon *v0;
  void *v1;

  v0 = objc_alloc_init(SBIcon);
  v1 = (void *)cacheKeyIcon_cacheKeyIcon;
  cacheKeyIcon_cacheKeyIcon = (uint64_t)v0;

}

- (id)appearanceStoreWithOptions:(unint64_t)a3
{
  int *v3;

  v3 = &OBJC_IVAR___SBHClockApplicationIconImageView__contentsImages;
  if ((a3 & 1) == 0)
    v3 = &OBJC_IVAR___SBHClockApplicationIconImageView__squareContentsImages;
  return *(id *)((char *)&self->super.super.super.super.super.isa + *v3);
}

- (id)contentsImageWithOptions:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;

  -[SBHClockApplicationIconImageView effectiveIconImageAppearance](self, "effectiveIconImageAppearance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "cacheKeyIcon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHClockApplicationIconImageView appearanceStoreWithOptions:](self, "appearanceStoreWithOptions:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageForIcon:appearance:", v6, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    -[SBIconImageView iconImageInfo](self, "iconImageInfo");
    if (v9 <= 0.0)
    {
      v8 = 0;
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "iconImageWithImageInfo:imageAppearance:options:", v5, a3, v9, v10, v11, v12);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setImage:forIcon:appearance:", v8, v6, v5);
    }
  }

  return v8;
}

- (void)updateImageAnimated:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBHClockApplicationIconImageView;
  -[SBLiveIconImageView updateImageAnimated:](&v6, sel_updateImageAnimated_, a3);
  -[SBHClockApplicationIconImageView effectiveIconImageAppearance](self, "effectiveIconImageAppearance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHClockApplicationIconImageView displayedHandsAppearance](self, "displayedHandsAppearance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((BSEqualObjects() & 1) == 0)
  {
    -[SBHClockApplicationIconImageView resetForegroundLayers](self, "resetForegroundLayers");
    -[SBHClockApplicationIconImageView setNeedsLayout](self, "setNeedsLayout");
  }

}

- (void)clearCachedImages
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBHClockApplicationIconImageView;
  -[SBIconImageView clearCachedImages](&v3, sel_clearCachedImages);
  -[SBHIconImageAppearanceStore removeAllImages](self->_contentsImages, "removeAllImages");
  -[SBHIconImageAppearanceStore removeAllImages](self->_squareContentsImages, "removeAllImages");
}

- (void)effectiveIconImageAppearanceDidChange
{
  -[SBHClockApplicationIconImageView updateImageAnimated:](self, "updateImageAnimated:", 0);
  -[SBHClockApplicationIconImageView resetForegroundLayers](self, "resetForegroundLayers");
}

- (BOOL)canOverrideImageTintColor
{
  return 0;
}

- (id)effectiveIconImageAppearance
{
  void *v3;
  void *v4;
  SBHIconImageAppearance *v5;
  SBHIconImageAppearance *v6;
  objc_super v8;

  -[SBIconImageView iconView](self, "iconView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "overrideImageTintColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = -[SBHIconImageAppearance initWithAppearanceType:tintColor:]([SBHIconImageAppearance alloc], "initWithAppearanceType:tintColor:", 2, v4);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBHClockApplicationIconImageView;
    -[SBIconImageView effectiveIconImageAppearance](&v8, sel_effectiveIconImageAppearance);
    v5 = (SBHIconImageAppearance *)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (void)localeDidChange:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend((id)objc_opt_class(), "systemNumberingSystem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SBHClockApplicationIconImageView currentNumberingSystem](self, "currentNumberingSystem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4 || (objc_msgSend(v5, "isEqualToString:", v4) & 1) == 0)
  {
    -[SBHClockApplicationIconImageView clearCachedImages](self, "clearCachedImages");
    -[SBHClockApplicationIconImageView updateImageAnimated:](self, "updateImageAnimated:", 0);
    -[SBHClockApplicationIconImageView setCurrentNumberingSystem:](self, "setCurrentNumberingSystem:", v5);
  }

}

- (void)willAnimateIconImageInfoChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBHClockApplicationIconImageView;
  -[SBIconImageView willAnimateIconImageInfoChange](&v3, sel_willAnimateIconImageInfoChange);
  -[SBHClockApplicationIconImageView setHandsHidden:](self, "setHandsHidden:", 1);
}

- (void)didAnimateIconImageInfoChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBHClockApplicationIconImageView;
  -[SBIconImageView didAnimateIconImageInfoChange](&v3, sel_didAnimateIconImageInfoChange);
  -[SBHClockApplicationIconImageView setHandsHidden:animated:](self, "setHandsHidden:animated:", 0, 1);
}

- (void)iconImageInfoDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBHClockApplicationIconImageView;
  -[SBIconImageView iconImageInfoDidChange](&v3, sel_iconImageInfoDidChange);
  -[SBHClockApplicationIconImageView resetForegroundLayers](self, "resetForegroundLayers");
  -[SBHClockApplicationIconImageView setNeedsLayout](self, "setNeedsLayout");
  -[SBHClockApplicationIconImageView layoutIfNeeded](self, "layoutIfNeeded");
}

- (void)controller:(id)a3 didChangeOverrideDateFromDate:(id)a4
{
  id v5;
  double v6;
  double v7;
  id v8;

  v5 = a3;
  objc_msgSend(v5, "overrideDate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "overrideDateOffset");
  v7 = v6;

  objc_msgSend((id)objc_opt_class(), "setOverrideDate:", v8);
  objc_msgSend((id)objc_opt_class(), "setOverrideDateOffset:", v7);
  -[SBHClockApplicationIconImageView updateAnimatingState](self, "updateAnimatingState");
  -[SBHClockApplicationIconImageView updateUnanimated](self, "updateUnanimated");

}

- (NSString)currentNumberingSystem
{
  return self->_currentNumberingSystem;
}

- (void)setCurrentNumberingSystem:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 648);
}

- (SBHIconImageAppearance)displayedHandsAppearance
{
  return self->_displayedHandsAppearance;
}

- (void)setDisplayedHandsAppearance:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 656);
}

- (BOOL)areHandsHidden
{
  return self->_handsHidden;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayedHandsAppearance, 0);
  objc_storeStrong((id *)&self->_currentNumberingSystem, 0);
  objc_storeStrong((id *)&self->_squareContentsImages, 0);
  objc_storeStrong((id *)&self->_contentsImages, 0);
  objc_storeStrong((id *)&self->_secondDot, 0);
  objc_storeStrong((id *)&self->_hourMinuteDot, 0);
  objc_storeStrong((id *)&self->_hours, 0);
  objc_storeStrong((id *)&self->_minutes, 0);
  objc_storeStrong((id *)&self->_seconds, 0);
}

+ (void)_timerFired:.cold.1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_7();
  _os_log_debug_impl(&dword_1CFEF3000, v0, OS_LOG_TYPE_DEBUG, "Tick...", v1, 2u);
  OUTLINED_FUNCTION_1_2();
}

+ (void)makeIconImageWithImageInfo:(NSObject *)a1 imageAppearance:options:.cold.1(NSObject *a1)
{
  void *v2;
  CGFloat v3;
  CGFloat v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;
  CGSize v13;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_referenceBounds");
  v13.width = v3;
  v13.height = v4;
  NSStringFromCGSize(v13);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scale");
  v8 = 138543618;
  v9 = v5;
  v10 = 2048;
  v11 = v7;
  _os_log_fault_impl(&dword_1CFEF3000, a1, OS_LOG_TYPE_FAULT, "Could not find clock icon asset with size(%{public}@) in scale(%f)!", (uint8_t *)&v8, 0x16u);

}

+ (void)makeIconImageWithImageInfo:imageAppearance:options:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_4(&dword_1CFEF3000, v0, v1, "Clock icon asset was all black!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

+ (void)makeIconImageWithImageInfo:imageAppearance:options:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_4(&dword_1CFEF3000, v0, v1, "Clock icon asset was all white!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

+ (void)makeIconImageWithImageInfo:imageAppearance:options:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0_4(&dword_1CFEF3000, v0, v1, "Clock icon asset was all clear!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_2();
}

@end
