@implementation SiriSharedUIDeviceMotionEffectView

- (SiriSharedUIDeviceMotionEffectView)initWithFrame:(CGRect)a3
{
  SiriSharedUIDeviceMotionEffectView *v3;
  UIImageView *v4;
  UIImageView *effectImageView;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SiriSharedUIDeviceMotionEffectView;
  v3 = -[SiriSharedUIDeviceMotionEffectView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    effectImageView = v3->_effectImageView;
    v3->_effectImageView = v4;

    -[UIImageView setContentMode:](v3->_effectImageView, "setContentMode:", 2);
    -[SiriSharedUIDeviceMotionEffectView addSubview:](v3, "addSubview:", v3->_effectImageView);
    -[SiriSharedUIDeviceMotionEffectView _updateEffectView](v3, "_updateEffectView");
  }
  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  int v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SiriSharedUIDeviceMotionEffectView;
  v4 = a3;
  -[SiriSharedUIDeviceMotionEffectView traitCollectionDidChange:](&v7, sel_traitCollectionDidChange_, v4);
  -[SiriSharedUIDeviceMotionEffectView traitCollection](self, "traitCollection", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasDifferentColorAppearanceComparedToTraitCollection:", v4);

  if (v6)
    -[SiriSharedUIDeviceMotionEffectView _updateEffectView](self, "_updateEffectView");
}

- (void)updateMaskingForView:(id)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  void *v14;
  BOOL v15;
  id v16;
  CGRect v17;
  CGRect v18;

  v16 = a3;
  if (v16)
  {
    -[UIImageView setAlpha:](self->_effectImageView, "setAlpha:", 1.0);
    -[SiriSharedUIDeviceMotionEffectView superview](self, "superview");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "frame");
    objc_msgSend(v4, "convertRect:toView:", self);
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;

    -[SiriSharedUIDeviceMotionEffectView maskView](self, "maskView");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (v13 == v16)
    {
      -[SiriSharedUIDeviceMotionEffectView maskView](self, "maskView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "frame");
      v18.origin.x = v6;
      v18.origin.y = v8;
      v18.size.width = v10;
      v18.size.height = v12;
      v15 = CGRectEqualToRect(v17, v18);

      if (v15)
      {
LABEL_7:
        -[SiriSharedUIDeviceMotionEffectView _configureDeviceMotionIfNeeded](self, "_configureDeviceMotionIfNeeded");
        goto LABEL_8;
      }
    }
    else
    {

    }
    objc_msgSend(v16, "setFrame:", v6, v8, v10, v12);
    -[SiriSharedUIDeviceMotionEffectView setMaskView:](self, "setMaskView:", v16);
    self->_forcefullyUpdateImageViewFrame = 1;
    goto LABEL_7;
  }
  -[SiriSharedUIDeviceMotionEffectView _cleanUpIfNeeded](self, "_cleanUpIfNeeded");
  -[UIImageView setAlpha:](self->_effectImageView, "setAlpha:", 0.0);
  -[SiriSharedUIDeviceMotionEffectView setMaskView:](self, "setMaskView:", 0);
LABEL_8:

}

- (void)layoutSubviews
{
  _BOOL4 forcefullyUpdateImageViewFrame;
  double Height;
  double Width;
  uint64_t v6;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  BOOL v18;
  UIImageView *effectImageView;
  __int128 v20;
  UIImageView *v21;
  int64_t v22;
  CGAffineTransform v23[2];
  objc_super v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  v24.receiver = self;
  v24.super_class = (Class)SiriSharedUIDeviceMotionEffectView;
  -[SiriSharedUIDeviceMotionEffectView layoutSubviews](&v24, sel_layoutSubviews);
  -[SiriSharedUIDeviceMotionEffectView bounds](self, "bounds");
  if (!CGRectEqualToRect(v25, *MEMORY[0x1E0C9D648]))
  {
    forcefullyUpdateImageViewFrame = self->_forcefullyUpdateImageViewFrame;
    if (self->_forcefullyUpdateImageViewFrame)
      self->_forcefullyUpdateImageViewFrame = 0;
    -[SiriSharedUIDeviceMotionEffectView bounds](self, "bounds");
    Height = CGRectGetHeight(v26);
    -[SiriSharedUIDeviceMotionEffectView bounds](self, "bounds");
    Width = CGRectGetWidth(v27);
    -[SiriSharedUIDeviceMotionEffectView bounds](self, "bounds");
    if (Height <= Width)
      v10 = CGRectGetWidth(*(CGRect *)&v6);
    else
      v10 = CGRectGetHeight(*(CGRect *)&v6);
    v11 = v10 + 200.0;
    -[SiriSharedUIDeviceMotionEffectView bounds](self, "bounds");
    v12 = (CGRectGetWidth(v28) - v11) * 0.5;
    -[SiriSharedUIDeviceMotionEffectView bounds](self, "bounds");
    v13 = (CGRectGetHeight(v29) - v11) * 0.5;
    -[UIImageView bounds](self->_effectImageView, "bounds");
    v14 = CGRectGetWidth(v30);
    v31.origin.x = v12;
    v31.origin.y = v13;
    v31.size.width = v11;
    v31.size.height = v11;
    v15 = CGRectGetWidth(v31);
    -[UIImageView bounds](self->_effectImageView, "bounds");
    v16 = CGRectGetHeight(v32);
    v33.origin.x = v12;
    v33.origin.y = v13;
    v33.size.width = v11;
    v33.size.height = v11;
    v17 = CGRectGetHeight(v33);
    if (forcefullyUpdateImageViewFrame
      || (*(uint64_t *)&v14 == *(uint64_t *)&v15 ? (v18 = *(uint64_t *)&v16 == *(uint64_t *)&v17) : (v18 = 0), !v18))
    {
      if (-[SiriSharedUIDeviceMotionEffectView _supportsContentViewTransforms](self, "_supportsContentViewTransforms", v17))
      {
        memset(&v23[1], 0, sizeof(CGAffineTransform));
        effectImageView = self->_effectImageView;
        if (effectImageView)
        {
          -[UIImageView transform](effectImageView, "transform");
          effectImageView = self->_effectImageView;
        }
        v20 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
        *(_OWORD *)&v23[0].a = *MEMORY[0x1E0C9BAA8];
        *(_OWORD *)&v23[0].c = v20;
        *(_OWORD *)&v23[0].tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
        -[UIImageView setTransform:](effectImageView, "setTransform:", v23);
        -[UIImageView setFrame:](self->_effectImageView, "setFrame:", v12, v13, v11, v11);
        v23[0] = v23[1];
        if (!CGAffineTransformIsIdentity(v23))
        {
          v21 = self->_effectImageView;
          v23[0] = v23[1];
          -[UIImageView setTransform:](v21, "setTransform:", v23);
        }
      }
      else
      {
        -[UIImageView setFrame:](self->_effectImageView, "setFrame:", v12, v13, v11, v11);
      }
    }
    if (-[SiriSharedUIDeviceMotionEffectView _supportsDeviceMotion](self, "_supportsDeviceMotion"))
    {
      v22 = -[SiriSharedUIDeviceMotionEffectView _currentInterfaceOrientation](self, "_currentInterfaceOrientation");
      if (v22)
      {
        if (v22 != self->_cachedInterfaceOrientation)
          self->_cachedInterfaceOrientation = v22;
      }
    }
  }
}

- (BOOL)_supportsDeviceMotion
{
  return !UIAccessibilityIsReduceMotionEnabled() && !UIAccessibilityDarkerSystemColorsEnabled();
}

- (BOOL)_supportsContentViewTransforms
{
  return 1;
}

- (void)_updateEffectView
{
  void *v3;
  void *v4;
  double v5;
  int64_t v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  id v10;

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SiriSharedUIDeviceMotionEffectView isViewHighContrast](self, "isViewHighContrast"))
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v10 = 0;
    v4 = v3;
    v5 = 0.0;
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = -[SiriSharedUIDeviceMotionEffectView viewAppearanceStyle](self, "viewAppearanceStyle");
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6 == 1)
      v9 = CFSTR("deviceMotionEffect_Dark");
    else
      v9 = CFSTR("deviceMotionEffect_Light");
    objc_msgSend(v7, "pathForResource:ofType:", v9, CFSTR("png"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithContentsOfFile:", v4);
    v5 = 1.0;
  }

  -[UIImageView setImage:](self->_effectImageView, "setImage:", v10);
  -[UIImageView setAlpha:](self->_effectImageView, "setAlpha:", v5);
  -[SiriSharedUIDeviceMotionEffectView setBackgroundColor:](self, "setBackgroundColor:", v3);

}

- (void)viewWillBeUpdated
{
  self->_shouldUpdateOffsetRadians = 1;
}

- (void)_configureDeviceMotionIfNeeded
{
  NSObject *v3;
  double initialOffsetRadians;
  void *v5;
  double v6;
  CMMotionManager *v7;
  CMMotionManager *motionManager;
  void *v9;
  CADisplayLink *v10;
  CADisplayLink *displayLink;
  CADisplayLink *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  double v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (self->_shouldUpdateOffsetRadians)
  {
    self->_initialOffsetRadians = (double)(arc4random() % 0x168) * 3.14159265 / 180.0;
    v3 = *MEMORY[0x1E0CFE6A0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_DEFAULT))
    {
      initialOffsetRadians = self->_initialOffsetRadians;
      *(_DWORD *)buf = 136315394;
      v17 = "-[SiriSharedUIDeviceMotionEffectView _configureDeviceMotionIfNeeded]";
      v18 = 2048;
      v19 = initialOffsetRadians;
      _os_log_impl(&dword_1DE0BF000, v3, OS_LOG_TYPE_DEFAULT, "%s #compact using initial offset radians: %f", buf, 0x16u);
    }
    self->_shouldUpdateOffsetRadians = 0;
  }
  if (-[SiriSharedUIDeviceMotionEffectView _supportsDeviceMotion](self, "_supportsDeviceMotion"))
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (float)(1.0 / (float)objc_msgSend(v5, "maximumFramesPerSecond"));
    self->_rotationIncrementalRateRadians = v6 * 0.20943951;
    if (!self->_motionManager)
    {
      v7 = (CMMotionManager *)objc_alloc_init(MEMORY[0x1E0CA5670]);
      motionManager = self->_motionManager;
      self->_motionManager = v7;

      -[CMMotionManager setDeviceMotionUpdateInterval:](self->_motionManager, "setDeviceMotionUpdateInterval:", v6);
      -[CMMotionManager startDeviceMotionUpdates](self->_motionManager, "startDeviceMotionUpdates");
    }
    if (!self->_displayLink)
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "displayLinkWithTarget:selector:", self, sel__displayLinkFired_);
      v10 = (CADisplayLink *)objc_claimAutoreleasedReturnValue();
      displayLink = self->_displayLink;
      self->_displayLink = v10;

      v12 = self->_displayLink;
      objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CADisplayLink addToRunLoop:forMode:](v12, "addToRunLoop:forMode:", v13, *MEMORY[0x1E0C99860]);

    }
  }
  else
  {
    -[SiriSharedUIDeviceMotionEffectView _cleanUpIfNeeded](self, "_cleanUpIfNeeded");
    objc_initWeak((id *)buf, self);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __68__SiriSharedUIDeviceMotionEffectView__configureDeviceMotionIfNeeded__block_invoke;
    v14[3] = &unk_1EA89CCA8;
    objc_copyWeak(&v15, (id *)buf);
    v14[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }
}

void __68__SiriSharedUIDeviceMotionEffectView__configureDeviceMotionIfNeeded__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;
  void *v4;
  CGAffineTransform v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained && objc_msgSend(WeakRetained, "_supportsContentViewTransforms"))
  {
    v4 = (void *)v3[52];
    CGAffineTransformMakeRotation(&v5, *(CGFloat *)(*(_QWORD *)(a1 + 32) + 432));
    objc_msgSend(v4, "setTransform:", &v5);
  }

}

- (void)_displayLinkFired:(id)a3
{
  void *v4;
  void *v5;

  -[CMMotionManager deviceMotion](self->_motionManager, "deviceMotion", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[SiriSharedUIDeviceMotionEffectView _motionManagerDidReceiveMotion:](self, "_motionManagerDidReceiveMotion:", v4);
    v4 = v5;
  }

}

- (void)_cleanUpIfNeeded
{
  CADisplayLink *displayLink;
  CMMotionManager *motionManager;

  -[CADisplayLink invalidate](self->_displayLink, "invalidate");
  displayLink = self->_displayLink;
  self->_displayLink = 0;

  -[CMMotionManager stopDeviceMotionUpdates](self->_motionManager, "stopDeviceMotionUpdates");
  motionManager = self->_motionManager;
  self->_motionManager = 0;

}

- (void)_motionManagerDidReceiveMotion:(id)a3
{
  double initialOffsetRadians;
  unint64_t v5;
  double v6;
  double v7;
  _QWORD v8[4];
  id v9;
  CGAffineTransform v10;
  id location;
  CGAffineTransform v12;

  initialOffsetRadians = self->_initialOffsetRadians;
  v5 = self->_cachedInterfaceOrientation - 3;
  objc_msgSend(a3, "gravity");
  if (v5 < 2)
    v6 = v7;
  memset(&v12, 0, sizeof(v12));
  CGAffineTransformMakeRotation(&v12, initialOffsetRadians + v6 * 5.5);
  self->_initialOffsetRadians = self->_rotationIncrementalRateRadians + self->_initialOffsetRadians;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__SiriSharedUIDeviceMotionEffectView__motionManagerDidReceiveMotion___block_invoke;
  v8[3] = &unk_1EA89CCD0;
  objc_copyWeak(&v9, &location);
  v10 = v12;
  dispatch_async(MEMORY[0x1E0C80D38], v8);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __69__SiriSharedUIDeviceMotionEffectView__motionManagerDidReceiveMotion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  __int128 v5;
  _OWORD v6[3];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = (void *)*((_QWORD *)WeakRetained + 52);
    v5 = *(_OWORD *)(a1 + 56);
    v6[0] = *(_OWORD *)(a1 + 40);
    v6[1] = v5;
    v6[2] = *(_OWORD *)(a1 + 72);
    objc_msgSend(v4, "setTransform:", v6);
  }

}

- (id)_currentWindowScene
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *i;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "windows");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v7, "isKeyWindow") & 1) != 0)
        {
          objc_msgSend(v7, "windowScene");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_11;
        }
      }
      v4 = (void *)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (int64_t)_currentInterfaceOrientation
{
  void *v2;
  void *v3;
  int64_t v4;

  -[SiriSharedUIDeviceMotionEffectView _currentWindowScene](self, "_currentWindowScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "interfaceOrientation");
  else
    v4 = 0;

  return v4;
}

- (BOOL)isViewHighContrast
{
  void *v2;
  BOOL v3;

  -[SiriSharedUIDeviceMotionEffectView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "accessibilityContrast") == 1;

  return v3;
}

- (int64_t)viewAppearanceStyle
{
  void *v2;
  int64_t v3;

  -[SiriSharedUIDeviceMotionEffectView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceStyle") == 2;

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_motionManager, 0);
  objc_storeStrong((id *)&self->_effectImageView, 0);
}

@end
