@implementation PIHeadroomSettings

- (PIHeadroomSettings)init
{
  PIHeadroomSettings *v2;
  PIHeadroomSettings *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PIHeadroomSettings;
  v2 = -[PIHeadroomSettings init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[PIHeadroomSettings _setDefaultValues](v2, "_setDefaultValues");
  return v3;
}

- (void)_setDefaultValues
{
  -[PIHeadroomSettings setBlurRadius:](self, "setBlurRadius:", 7.0);
  -[PIHeadroomSettings setBlurMaskTopLocation:](self, "setBlurMaskTopLocation:", 0.49000001);
  -[PIHeadroomSettings setFalloffHeight:](self, "setFalloffHeight:", 0.180000007);
  -[PIHeadroomSettings setGradientHeight:](self, "setGradientHeight:", 1.0);
  -[PIHeadroomSettings setGradientWhite:](self, "setGradientWhite:", 0.0);
  -[PIHeadroomSettings setHighKeyGradientWhite:](self, "setHighKeyGradientWhite:", 1.0);
  -[PIHeadroomSettings setBottomGradientAlpha:](self, "setBottomGradientAlpha:", 0.75999999);
  -[PIHeadroomSettings setBottomGradientTopLocation:](self, "setBottomGradientTopLocation:", 0.330000013);
  -[PIHeadroomSettings setBottomGradientBottomLocation:](self, "setBottomGradientBottomLocation:", 1.0);
  -[PIHeadroomSettings setTopGradientAlpha:](self, "setTopGradientAlpha:", 0.709999979);
  -[PIHeadroomSettings setTopGradientTopLocation:](self, "setTopGradientTopLocation:", 0.300000012);
  -[PIHeadroomSettings setTopGradientBottomLocation:](self, "setTopGradientBottomLocation:", 1.0);
  -[PIHeadroomSettings setUseSoftLightBlendingModeForTopGradient:](self, "setUseSoftLightBlendingModeForTopGradient:", 1);
}

- (double)blurRadius
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  float v7;
  double v8;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(sel_blurRadius);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uppercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("PI_HEADROOM_%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatForKey:", v6);
  v8 = v7;

  return v8;
}

- (void)setBlurRadius:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(sel_blurRadius);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uppercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("PI_HEADROOM_%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&a3 = a3;
  LODWORD(v8) = LODWORD(a3);
  objc_msgSend(v9, "setFloat:forKey:", v7, v8);

}

- (double)falloffHeight
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  float v7;
  double v8;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(sel_falloffHeight);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uppercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("PI_HEADROOM_%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatForKey:", v6);
  v8 = v7;

  return v8;
}

- (void)setFalloffHeight:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(sel_falloffHeight);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uppercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("PI_HEADROOM_%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&a3 = a3;
  LODWORD(v8) = LODWORD(a3);
  objc_msgSend(v9, "setFloat:forKey:", v7, v8);

}

- (double)gradientHeight
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  float v7;
  double v8;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(sel_gradientHeight);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uppercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("PI_HEADROOM_%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatForKey:", v6);
  v8 = v7;

  return v8;
}

- (void)setGradientHeight:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(sel_gradientHeight);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uppercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("PI_HEADROOM_%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&a3 = a3;
  LODWORD(v8) = LODWORD(a3);
  objc_msgSend(v9, "setFloat:forKey:", v7, v8);

}

- (double)gradientWhite
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  float v7;
  double v8;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(sel_gradientWhite);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uppercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("PI_HEADROOM_%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatForKey:", v6);
  v8 = v7;

  return v8;
}

- (void)setGradientWhite:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(sel_gradientWhite);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uppercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("PI_HEADROOM_%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&a3 = a3;
  LODWORD(v8) = LODWORD(a3);
  objc_msgSend(v9, "setFloat:forKey:", v7, v8);

}

- (double)highKeyGradientWhite
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  float v7;
  double v8;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(sel_highKeyGradientWhite);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uppercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("PI_HEADROOM_%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatForKey:", v6);
  v8 = v7;

  return v8;
}

- (void)setHighKeyGradientWhite:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(sel_highKeyGradientWhite);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uppercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("PI_HEADROOM_%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&a3 = a3;
  LODWORD(v8) = LODWORD(a3);
  objc_msgSend(v9, "setFloat:forKey:", v7, v8);

}

- (double)bottomGradientAlpha
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  float v7;
  double v8;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(sel_bottomGradientAlpha);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uppercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("PI_HEADROOM_%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatForKey:", v6);
  v8 = v7;

  return v8;
}

- (void)setBottomGradientAlpha:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(sel_bottomGradientAlpha);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uppercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("PI_HEADROOM_%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&a3 = a3;
  LODWORD(v8) = LODWORD(a3);
  objc_msgSend(v9, "setFloat:forKey:", v7, v8);

}

- (double)bottomGradientTopLocation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  float v7;
  double v8;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(sel_bottomGradientTopLocation);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uppercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("PI_HEADROOM_%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatForKey:", v6);
  v8 = v7;

  return v8;
}

- (void)setBottomGradientTopLocation:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(sel_bottomGradientTopLocation);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uppercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("PI_HEADROOM_%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&a3 = a3;
  LODWORD(v8) = LODWORD(a3);
  objc_msgSend(v9, "setFloat:forKey:", v7, v8);

}

- (double)bottomGradientBottomLocation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  float v7;
  double v8;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(sel_bottomGradientBottomLocation);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uppercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("PI_HEADROOM_%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatForKey:", v6);
  v8 = v7;

  return v8;
}

- (void)setBottomGradientBottomLocation:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(sel_bottomGradientBottomLocation);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uppercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("PI_HEADROOM_%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&a3 = a3;
  LODWORD(v8) = LODWORD(a3);
  objc_msgSend(v9, "setFloat:forKey:", v7, v8);

}

- (double)topGradientAlpha
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  float v7;
  double v8;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(sel_topGradientAlpha);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uppercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("PI_HEADROOM_%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatForKey:", v6);
  v8 = v7;

  return v8;
}

- (void)setTopGradientAlpha:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(sel_topGradientAlpha);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uppercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("PI_HEADROOM_%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&a3 = a3;
  LODWORD(v8) = LODWORD(a3);
  objc_msgSend(v9, "setFloat:forKey:", v7, v8);

}

- (double)topGradientTopLocation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  float v7;
  double v8;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(sel_topGradientTopLocation);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uppercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("PI_HEADROOM_%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatForKey:", v6);
  v8 = v7;

  return v8;
}

- (void)setTopGradientTopLocation:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(sel_topGradientTopLocation);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uppercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("PI_HEADROOM_%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&a3 = a3;
  LODWORD(v8) = LODWORD(a3);
  objc_msgSend(v9, "setFloat:forKey:", v7, v8);

}

- (double)topGradientBottomLocation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  float v7;
  double v8;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(sel_topGradientBottomLocation);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uppercaseString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("PI_HEADROOM_%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatForKey:", v6);
  v8 = v7;

  return v8;
}

- (void)setTopGradientBottomLocation:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(sel_topGradientBottomLocation);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uppercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("PI_HEADROOM_%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&a3 = a3;
  LODWORD(v8) = LODWORD(a3);
  objc_msgSend(v9, "setFloat:forKey:", v7, v8);

}

- (double)blurMaskTopLocation
{
  return self->_blurMaskTopLocation;
}

- (void)setBlurMaskTopLocation:(double)a3
{
  self->_blurMaskTopLocation = a3;
}

- (BOOL)useSoftLightBlendingModeForTopGradient
{
  return self->_useSoftLightBlendingModeForTopGradient;
}

- (void)setUseSoftLightBlendingModeForTopGradient:(BOOL)a3
{
  self->_useSoftLightBlendingModeForTopGradient = a3;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  return (id)sharedInstance_headroomSettings;
}

void __36__PIHeadroomSettings_sharedInstance__block_invoke()
{
  PIHeadroomSettings *v0;
  void *v1;

  v0 = objc_alloc_init(PIHeadroomSettings);
  v1 = (void *)sharedInstance_headroomSettings;
  sharedInstance_headroomSettings = (uint64_t)v0;

}

@end
