@implementation PBUIBokehWallpaperCircle

- (PBUIBokehWallpaperCircle)initWithSuperviewBounds:(CGRect)a3 color:(int64_t)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  PBUIBokehWallpaperCircle *v9;
  PBUIBokehWallpaperCircle *v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12.receiver = self;
  v12.super_class = (Class)PBUIBokehWallpaperCircle;
  v9 = -[PBUIBokehWallpaperCircle init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_superviewBounds.origin.x = x;
    v9->_superviewBounds.origin.y = y;
    v9->_superviewBounds.size.width = width;
    v9->_superviewBounds.size.height = height;
    v9->_color = a4;
    -[PBUIBokehWallpaperCircle randomize](v9, "randomize");
  }
  return v10;
}

- (void)randomize
{
  double v3;
  void *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  CGFloat y;
  CGFloat height;
  float x;
  float width;
  double v13;
  double v14;
  uint64_t v15;
  id v16;
  double v17;
  double v18;
  __double2 v19;
  CGRect v20;

  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
  LODWORD(v3) = 0;
  -[PBUIBokehWallpaperCircle setOpacity:](self, "setOpacity:", v3);
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  v6 = (float)((float)((float)((float)rand() * 4.6566e-10) * 130.0) + 40.0);
  v7 = 1.0;
  if (v5 == 1)
    v7 = 1.5;
  v8 = v7 * v6;
  v20 = CGRectInset(self->_superviewBounds, v7 * v6 * -0.5, v7 * v6 * -0.5);
  y = v20.origin.y;
  height = v20.size.height;
  x = v20.origin.x;
  width = v20.size.width;
  v13 = (float)(x + (float)((float)((float)rand() * 4.6566e-10) * (float)(width - x)));
  *(float *)&y = y;
  *(float *)&height = height;
  v14 = (float)(*(float *)&y + (float)((float)((float)rand() * 4.6566e-10) * (float)(*(float *)&height - *(float *)&y)));
  -[PBUIBokehWallpaperCircle setBounds:](self, "setBounds:", 0.0, 0.0, v8, v8);
  -[PBUIBokehWallpaperCircle setPosition:](self, "setPosition:", v13, v14);
  -[PBUIBokehWallpaperCircle setZPosition:](self, "setZPosition:", v8);
  v15 = +[PBUIBokehImageArbiter bokehImageForDiameter:](v8);
  +[PBUIBokehImageArbiter imageForBokehImage:]((uint64_t)PBUIBokehImageArbiter, v15);
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  -[PBUIBokehWallpaperCircle setContents:](self, "setContents:", objc_msgSend(v16, "CGImage"));

  -[PBUIBokehWallpaperCircle setColor:](self, "setColor:", self->_color);
  v17 = (float)((float)((float)((float)rand() * 4.6566e-10) * 6.2832) + 0.0);
  v18 = (float)((float)((float)((float)rand() * 4.6566e-10) * 0.07) + 0.0);
  v19 = __sincos_stret(v17);
  self->_dxdt = v19.__cosval * v18;
  self->_dydt = v19.__sinval * v18;
  self->_speed = v8 * 1.5 / 170.0;
  -[PBUIBokehWallpaperCircle configureAnimationsWithPhase:](self, "configureAnimationsWithPhase:", 0.0);
  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (void)updatePositionWithTime:(double)a3 dx:(double)a4 dy:(double)a5 lockScreen:(BOOL)a6
{
  _BOOL4 v6;
  void *v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;

  v6 = a6;
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "userInterfaceIdiom");

  v13 = 35.0;
  if (v6)
    v13 = 140.0;
  if (v12 == 1)
    v14 = v13 * 1.5;
  else
    v14 = v13;
  -[PBUIBokehWallpaperCircle position](self, "position");
  -[PBUIBokehWallpaperCircle setPosition:](self, "setPosition:", v15 + (self->_dxdt + self->_speed * a4 * v14) * 60.0 * a3, v16 + (self->_dydt + -(a5 * self->_speed) * v14) * 60.0 * a3);
}

- (void)setColor:(int64_t)a3
{
  void *v4;
  uint64_t v5;

  self->_color = a3;
  +[PBUIBokehColorArbiter randomCircleColorForBokehColor:]((uint64_t)PBUIBokehColorArbiter, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "cgColor");

  -[PBUIBokehWallpaperCircle setContentsMultiplyColor:](self, "setContentsMultiplyColor:", v5);
}

- (void)configureAnimationsWithPhase:(double)a3
{
  id v5;
  id v6;
  id v7;
  id v8;

  -[PBUIBokehWallpaperCircle removeAllAnimations](self, "removeAllAnimations");
  v8 = +[PBUIBokehWallpaperCircle _newFadeAnimation](PBUIBokehWallpaperCircle, "_newFadeAnimation");
  objc_msgSend(v8, "setDelegate:", self);
  objc_msgSend(v8, "setKeyPath:", CFSTR("opacity"));
  objc_msgSend(v8, "setTimeOffset:", a3);
  -[PBUIBokehWallpaperCircle addAnimation:forKey:](self, "addAnimation:forKey:", v8, CFSTR("fade"));
  v5 = +[PBUIBokehWallpaperCircle _newFlickerAnimation](PBUIBokehWallpaperCircle, "_newFlickerAnimation");
  objc_msgSend(v5, "setKeyPath:", CFSTR("opacity"));
  -[PBUIBokehWallpaperCircle addAnimation:forKey:](self, "addAnimation:forKey:", v5, CFSTR("flicker"));
  if ((float)((float)rand() * 4.6566e-10) < 0.5)
  {
    v6 = +[PBUIBokehWallpaperCircle _newScaleAnimation](PBUIBokehWallpaperCircle, "_newScaleAnimation");
    objc_msgSend(v6, "setKeyPath:", CFSTR("transform.scale.x"));
    -[PBUIBokehWallpaperCircle addAnimation:forKey:](self, "addAnimation:forKey:", v6, CFSTR("scale.x"));
    v7 = +[PBUIBokehWallpaperCircle _newScaleAnimation](PBUIBokehWallpaperCircle, "_newScaleAnimation");
    objc_msgSend(v7, "setKeyPath:", CFSTR("transform.scale.y"));
    -[PBUIBokehWallpaperCircle addAnimation:forKey:](self, "addAnimation:forKey:", v7, CFSTR("scale.y"));

  }
}

- (void)setAnimationsEnabled:(BOOL)a3
{
  _BOOL4 v3;
  float v5;

  v3 = a3;
  -[PBUIBokehWallpaperCircle speed](self, "speed");
  if ((v5 != 0.0) != v3)
  {
    if (v3)
      -[PBUIBokehWallpaperCircle _resumeAnimations](self, "_resumeAnimations");
    else
      -[PBUIBokehWallpaperCircle _pauseAnimations](self, "_pauseAnimations");
  }
}

- (void)_pauseAnimations
{
  double v3;
  double v4;

  -[PBUIBokehWallpaperCircle convertTime:fromLayer:](self, "convertTime:fromLayer:", 0, CACurrentMediaTime());
  v4 = v3;
  LODWORD(v3) = 0;
  -[PBUIBokehWallpaperCircle setSpeed:](self, "setSpeed:", v3);
  -[PBUIBokehWallpaperCircle setTimeOffset:](self, "setTimeOffset:", v4);
}

- (void)_resumeAnimations
{
  double v3;
  double v4;
  double v5;
  void *v6;

  -[PBUIBokehWallpaperCircle timeOffset](self, "timeOffset");
  v4 = v3;
  LODWORD(v3) = 1.0;
  -[PBUIBokehWallpaperCircle setSpeed:](self, "setSpeed:", v3);
  -[PBUIBokehWallpaperCircle setTimeOffset:](self, "setTimeOffset:", 0.0);
  -[PBUIBokehWallpaperCircle setBeginTime:](self, "setBeginTime:", 0.0);
  -[PBUIBokehWallpaperCircle convertTime:fromLayer:](self, "convertTime:fromLayer:", 0, CACurrentMediaTime());
  -[PBUIBokehWallpaperCircle setBeginTime:](self, "setBeginTime:", v5 - v4);
  -[PBUIBokehWallpaperCircle animationForKey:](self, "animationForKey:", CFSTR("fade"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    -[PBUIBokehWallpaperCircle configureAnimationsWithPhase:](self, "configureAnimationsWithPhase:", 0.0);
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  if (a4)
    -[PBUIBokehWallpaperCircle randomize](self, "randomize", a3);
}

+ (id)_newFadeAnimation
{
  double v2;
  double v3;
  double v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  CAFrameRateRange v13;

  v12[4] = *MEMORY[0x1E0C80C00];
  v2 = (float)((float)((float)((float)rand() * 4.6566e-10) * 3.0) + 5.0) + 0.0;
  v3 = v2 + (float)((float)((float)((float)rand() * 4.6566e-10) * 14.0) + 3.0);
  v4 = v3 + (float)((float)((float)((float)rand() * 4.6566e-10) * 3.0) + 5.0);
  v5 = objc_alloc_init(MEMORY[0x1E0CD2798]);
  objc_msgSend(v5, "setAdditive:", 1);
  objc_msgSend(v5, "setValues:", &unk_1E6BC33E8);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0 / v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v2 / v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v3 / v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v4 / v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setKeyTimes:", v10);

  objc_msgSend(v5, "setDuration:", v4);
  v13 = CAFrameRateRangeMake(30.0, 60.0, 30.0);
  objc_msgSend(v5, "setPreferredFrameRateRange:", *(double *)&v13.minimum, *(double *)&v13.maximum, *(double *)&v13.preferred);
  return v5;
}

+ (id)_newFlickerAnimation
{
  int v2;
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  id v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  _QWORD v30[4];
  _QWORD v31[5];
  CAFrameRateRange v32;

  v31[4] = *MEMORY[0x1E0C80C00];
  v2 = rand();
  v3 = (float)rand() * 4.6566e-10;
  v4 = (float)rand() * 4.6566e-10;
  v5 = (float)(v4 * 0.2) + 0.3;
  v6 = (float)(v4 * 0.5) + 0.5;
  if (v3 >= 0.15)
    v7 = v6;
  else
    v7 = v5;
  v8 = (float)rand() * 4.6566e-10;
  v9 = (float)rand() * 4.6566e-10;
  v10 = v9 + 0.5;
  v11 = (float)(v9 * 0.4) + 0.1;
  if (v8 < 0.15)
    v11 = v10;
  v12 = v7;
  v13 = (float)((float)((float)((float)v2 * 4.6566e-10) * 0.1) + 0.0);
  v14 = v11 * 0.5;
  v15 = v14 + 0.0;
  v16 = v14 + 0.0 + v12;
  v17 = v14 + v16;
  v18 = objc_alloc_init(MEMORY[0x1E0CD2798]);
  objc_msgSend(v18, "setAdditive:", 1);
  v31[0] = &unk_1E6BC34D8;
  v31[1] = &unk_1E6BC34D8;
  v19 = -v13;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v20;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setValues:", v22);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0 / v17);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v23;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15 / v17);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = v24;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16 / v17);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v25;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v17 / v17);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 4);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setKeyTimes:", v27);

  objc_msgSend(v18, "setDuration:", v17);
  objc_msgSend(v18, "setAutoreverses:", 1);
  LODWORD(v28) = 2139095040;
  objc_msgSend(v18, "setRepeatCount:", v28);
  v32 = CAFrameRateRangeMake(30.0, 60.0, 30.0);
  objc_msgSend(v18, "setPreferredFrameRateRange:", *(double *)&v32.minimum, *(double *)&v32.maximum, *(double *)&v32.preferred);
  return v18;
}

+ (id)_newScaleAnimation
{
  double v2;
  double v3;
  double v4;
  double v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  _QWORD v17[4];
  _QWORD v18[5];
  CAFrameRateRange v19;

  v18[4] = *MEMORY[0x1E0C80C00];
  v2 = (float)((float)((float)((float)rand() * 4.6566e-10) * 0.4) + 0.2) * 0.5;
  v3 = v2 + 0.0;
  v4 = v2 + 0.0 + 0.4;
  v5 = v2 + v4;
  v6 = objc_alloc_init(MEMORY[0x1E0CD2798]);
  objc_msgSend(v6, "setAdditive:", 1);
  v18[0] = &unk_1E6BC34D8;
  v18[1] = &unk_1E6BC34D8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -0.0125);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -0.0125);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setValues:", v9);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0 / v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v3 / v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v11;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v4 / v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[2] = v12;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5 / v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setKeyTimes:", v14);

  objc_msgSend(v6, "setDuration:", v5);
  *(float *)&v5 = v5;
  objc_msgSend(v6, "setTimeOffset:", (float)((float)((float)((float)rand() * 4.6566e-10) * *(float *)&v5) + 0.0));
  objc_msgSend(v6, "setAutoreverses:", 1);
  LODWORD(v15) = 2139095040;
  objc_msgSend(v6, "setRepeatCount:", v15);
  v19 = CAFrameRateRangeMake(30.0, 60.0, 30.0);
  objc_msgSend(v6, "setPreferredFrameRateRange:", *(double *)&v19.minimum, *(double *)&v19.maximum, *(double *)&v19.preferred);
  return v6;
}

- (CGRect)superviewBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_superviewBounds.origin.x;
  y = self->_superviewBounds.origin.y;
  width = self->_superviewBounds.size.width;
  height = self->_superviewBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSuperviewBounds:(CGRect)a3
{
  self->_superviewBounds = a3;
}

@end
