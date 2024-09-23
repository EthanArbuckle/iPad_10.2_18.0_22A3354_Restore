@implementation WKBokehBubble

- (WKBokehBubble)init
{
  int v4;

  v4 = rand();
  return (WKBokehBubble *)-[WKBokehBubble initWithSeed:](self, (unsigned int *)&v4);
}

- (void)initWithSeed:(void *)a1
{
  id v3;
  void *v4;
  objc_super v6;

  if (!a1)
    return 0;
  v6.receiver = a1;
  v6.super_class = (Class)WKBokehBubble;
  v3 = objc_msgSendSuper2(&v6, sel_init);
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "setCompositingFilter:", *MEMORY[0x1E0CD2DD8]);
    -[WKBokehBubble _configureAppearanceWithSeed:](v4, a2);
    -[WKBokehBubble _configureAnimationsWithSeed:](v4, a2);
  }
  return v4;
}

- (void)_configureAppearanceWithSeed:(void *)a1
{
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;

  if (a1)
  {
    v4 = (float)((float)((float)((float)rand_r(a2) * 4.6566e-10) * 2.0) + -1.0);
    v5 = (float)((float)((float)((float)rand_r(a2) * 4.6566e-10) * 2.0) + -1.0);
    v6 = (float)((float)((float)((float)rand_r(a2) * 4.6566e-10) * 1.2) + -1.5);
    objc_msgSend(a1, "setPosition:", v4 * v6, v5 * v6);
    objc_msgSend(a1, "setZPosition:", v6);
    +[WKBokehImageArbiter imageForZ:](v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "size");
    v10 = sqrt(v8 * v9) * 0.15 * 0.0078125;
    v12 = objc_retainAutorelease(v7);
    objc_msgSend(a1, "setContents:", objc_msgSend(v12, "CGImage"));
    objc_msgSend(a1, "setBounds:", 0.0, 0.0, v10, v10);
    LODWORD(v11) = 0;
    objc_msgSend(a1, "setOpacity:", v11);

  }
}

- (void)_configureAnimationsWithSeed:(void *)a1
{
  id v4;
  id v5;
  id v6;
  id v7;

  if (a1)
  {
    objc_msgSend(a1, "removeAllAnimations");
    v7 = +[WKBokehBubble _newFadeAnimationWithSeed:]((uint64_t)WKBokehBubble, a2);
    objc_msgSend(v7, "setKeyPath:", CFSTR("opacity"));
    objc_msgSend(v7, "setDelegate:", a1);
    objc_msgSend(a1, "addAnimation:forKey:", v7, CFSTR("fade"));
    v4 = +[WKBokehBubble _newFlickerAnimationWithSeed:]((uint64_t)WKBokehBubble, a2);
    objc_msgSend(v4, "setKeyPath:", CFSTR("opacity"));
    objc_msgSend(a1, "addAnimation:forKey:", v4, CFSTR("flicker"));
    if ((float)((float)rand_r(a2) * 4.6566e-10) < 0.5)
    {
      v5 = +[WKBokehBubble _newScaleAnimationWithSeed:]((uint64_t)WKBokehBubble, a2);
      objc_msgSend(v5, "setKeyPath:", CFSTR("transform.scale.x"));
      objc_msgSend(a1, "addAnimation:forKey:", v5, CFSTR("squish"));
      v6 = +[WKBokehBubble _newScaleAnimationWithSeed:]((uint64_t)WKBokehBubble, a2);
      objc_msgSend(v6, "setKeyPath:", CFSTR("transform.scale.y"));
      objc_msgSend(a1, "addAnimation:forKey:", v6, CFSTR("squash"));

    }
  }
}

+ (id)_newFadeAnimationWithSeed:(uint64_t)a1
{
  double v3;
  double v4;
  double v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[5];

  v13[4] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v3 = (float)((float)((float)((float)rand_r(a2) * 4.6566e-10) * 3.0) + 5.0) + 0.0;
  v4 = v3 + (float)((float)((float)((float)rand_r(a2) * 4.6566e-10) * 14.0) + 3.0);
  v5 = v4 + (float)((float)((float)((float)rand_r(a2) * 4.6566e-10) * 3.0) + 5.0);
  v6 = objc_alloc_init(MEMORY[0x1E0CD2798]);
  objc_msgSend(v6, "setAdditive:", 1);
  objc_msgSend(v6, "setValues:", &unk_1E6F0DC10);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0 / v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v3 / v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v4 / v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5 / v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setKeyTimes:", v11);

  objc_msgSend(v6, "setDuration:", v5);
  return v6;
}

+ (id)_newFlickerAnimationWithSeed:(uint64_t)a1
{
  int v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  _QWORD v29[4];
  _QWORD v30[5];
  CAFrameRateRange v31;

  v30[4] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v3 = rand_r(a2);
  v4 = (float)rand_r(a2) * 4.6566e-10;
  v5 = (float)rand_r(a2) * 4.6566e-10;
  v6 = (float)(v5 * 0.2) + 0.3;
  v7 = (float)(v5 * 0.5) + 0.5;
  if (v4 >= 0.15)
    v8 = v7;
  else
    v8 = v6;
  v9 = (float)rand_r(a2) * 4.6566e-10;
  v10 = (float)rand_r(a2) * 4.6566e-10;
  v11 = v10 + 0.5;
  v12 = (float)(v10 * 0.4) + 0.1;
  if (v9 < 0.15)
    v12 = v11;
  v13 = v12 * 0.5;
  v14 = v13 + 0.0;
  v15 = v13 + 0.0 + v8;
  v16 = v13 + v15;
  v17 = objc_alloc_init(MEMORY[0x1E0CD2798]);
  objc_msgSend(v17, "setAdditive:", 1);
  v30[0] = &unk_1E6F0DB78;
  v30[1] = &unk_1E6F0DB78;
  v18 = -(float)((float)((float)((float)v3 * 4.6566e-10) * 0.1) + 0.0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v30[2] = v19;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v30[3] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setValues:", v21);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0 / v16);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v22;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14 / v16);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v23;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15 / v16);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v24;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16 / v16);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v29[3] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 4);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setKeyTimes:", v26);

  objc_msgSend(v17, "setDuration:", v16);
  objc_msgSend(v17, "setAutoreverses:", 1);
  LODWORD(v27) = 2139095040;
  objc_msgSend(v17, "setRepeatCount:", v27);
  v31 = CAFrameRateRangeMake(30.0, 120.0, 30.0);
  objc_msgSend(v17, "setPreferredFrameRateRange:", *(double *)&v31.minimum, *(double *)&v31.maximum, *(double *)&v31.preferred);
  return v17;
}

+ (id)_newScaleAnimationWithSeed:(uint64_t)a1
{
  double v3;
  double v4;
  double v5;
  double v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  _QWORD v18[4];
  _QWORD v19[5];
  CAFrameRateRange v20;

  v19[4] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v3 = (float)((float)((float)((float)rand_r(a2) * 4.6566e-10) * 0.4) + 0.2) * 0.5;
  v4 = v3 + 0.0;
  v5 = v3 + 0.0 + 0.4;
  v6 = v3 + v5;
  v7 = objc_alloc_init(MEMORY[0x1E0CD2798]);
  objc_msgSend(v7, "setAdditive:", 1);
  v19[0] = &unk_1E6F0DB78;
  v19[1] = &unk_1E6F0DB78;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -0.025);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -0.025);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValues:", v10);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", 0.0 / v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v11;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v4 / v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v12;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v5 / v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v13;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6 / v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setKeyTimes:", v15);

  objc_msgSend(v7, "setDuration:", v6);
  *(float *)&v6 = v6;
  objc_msgSend(v7, "setTimeOffset:", (float)((float)((float)((float)rand_r(a2) * 4.6566e-10) * *(float *)&v6) + 0.0));
  objc_msgSend(v7, "setAutoreverses:", 1);
  LODWORD(v16) = 2139095040;
  objc_msgSend(v7, "setRepeatCount:", v16);
  v20 = CAFrameRateRangeMake(30.0, 120.0, 30.0);
  objc_msgSend(v7, "setPreferredFrameRateRange:", *(double *)&v20.minimum, *(double *)&v20.maximum, *(double *)&v20.preferred);
  return v7;
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  unsigned int v5;

  if (a4)
  {
    v5 = rand();
    objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
    objc_msgSend(MEMORY[0x1E0CD28B0], "setDisableActions:", 1);
    -[WKBokehBubble _configureAppearanceWithSeed:](self, &v5);
    -[WKBokehBubble _configureAnimationsWithSeed:](self, &v5);
    objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
  }
}

@end
