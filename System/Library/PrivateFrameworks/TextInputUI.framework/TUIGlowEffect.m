@implementation TUIGlowEffect

- (TUIGlowEffect)initWithLayer:(id)a3
{
  id v5;
  TUIGlowEffect *v6;
  TUIGlowEffect *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *animationStates;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TUIGlowEffect;
  v6 = -[TUIGlowEffect init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_layer, a3);
    v7->_tintColor = CGColorCreateSRGB(0.2, 0.5, 1.0, 0.6);
    v7->_blurRadius = 5.0;
    v7->_pulsing = 1;
    v7->_pulseRadius = 1.5;
    *(_OWORD *)&v7->_pulseInterval = xmmword_18C80CDC0;
    v7->_preferredFrameRateRange = CAFrameRateRangeMake(30.0, 60.0, 30.0);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    animationStates = v7->_animationStates;
    v7->_animationStates = v8;

    -[TUIGlowEffect setupFilters](v7, "setupFilters");
  }

  return v7;
}

- (void)setBlurRadius:(double)a3
{
  void *v5;
  void *v6;

  if (self->_blurRadius != a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIGlowEffect updatePropertyForKeyPath:oldValue:newValue:animated:duration:autoreverses:repeatCount:](self, "updatePropertyForKeyPath:oldValue:newValue:animated:duration:autoreverses:repeatCount:", CFSTR("filters.blurFilter.inputRadius"), v5, v6, 0, 0, 0.0, 0.0);

    self->_blurRadius = a3;
  }
}

- (void)setTintColor:(CGColor *)a3 animated:(BOOL)a4 duration:(double)a5 autoreverses:(BOOL)a6 repeatCount:(double)a7
{
  _BOOL8 v8;
  _BOOL8 v10;
  BOOL v13;
  void *v14;
  CGColor *tintColor;
  BOOL v16;
  CGColor *Copy;
  id v18;

  v8 = a6;
  v10 = a4;
  v13 = !a4;
  -[TUIGlowEffect layer](self, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "animationForKey:", CFSTR("filters.thresholdFilter.inputColor"));
  v18 = (id)objc_claimAutoreleasedReturnValue();

  tintColor = self->_tintColor;
  if (v18)
    v16 = v13;
  else
    v16 = 0;
  if (v16 || tintColor != a3)
  {
    -[TUIGlowEffect updatePropertyForKeyPath:oldValue:newValue:animated:duration:autoreverses:repeatCount:](self, "updatePropertyForKeyPath:oldValue:newValue:animated:duration:autoreverses:repeatCount:", CFSTR("filters.thresholdFilter.inputColor"), tintColor, a3, v10, v8, a5, a7);
    Copy = CGColorCreateCopy(a3);
    CGColorRelease(self->_tintColor);
    self->_tintColor = Copy;
  }

}

- (void)updatePropertyForKeyPath:(id)a3 oldValue:(id)a4 newValue:(id)a5 animated:(BOOL)a6 duration:(double)a7 autoreverses:(BOOL)a8 repeatCount:(double)a9
{
  _BOOL8 v10;
  _BOOL4 v12;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  id v29;

  v10 = a8;
  v12 = a6;
  v29 = a3;
  v16 = a4;
  v17 = a5;
  -[TUIGlowEffect layer](self, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "removeAnimationForKey:", v29);

  if (v12)
  {
    -[TUIGlowEffect estimateAnimationValueForKeyPath:](self, "estimateAnimationValueForKeyPath:", v29);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", v29);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v19)
      v22 = v19;
    else
      v22 = v16;
    objc_msgSend(v20, "setFromValue:", v22);
    objc_msgSend(v21, "setToValue:", v17);
    objc_msgSend(v21, "setDuration:", a7);
    objc_msgSend(v21, "setRemovedOnCompletion:", 0);
    objc_msgSend(v21, "setFillMode:", *MEMORY[0x1E0CD2B60]);
    objc_msgSend(v21, "setDelegate:", self);
    *(float *)&v23 = self->_preferredFrameRateRange.minimum;
    *(float *)&v24 = self->_preferredFrameRateRange.maximum;
    *(float *)&v25 = self->_preferredFrameRateRange.preferred;
    objc_msgSend(v21, "setPreferredFrameRateRange:", v23, v24, v25);
    *(float *)&v26 = a9;
    objc_msgSend(v21, "setRepeatCount:", v26);
    objc_msgSend(v21, "setAutoreverses:", v10);
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3058]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setTimingFunction:", v27);

    -[TUIGlowEffect layer](self, "layer");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addAnimation:forKey:", v21, v29);

    -[TUIGlowEffect recordAnimation:duration:fromValue:toValue:keyPath:](self, "recordAnimation:duration:fromValue:toValue:keyPath:", v21, v16, v17, v29, a7);
    v17 = v21;
  }
  else
  {
    -[TUIGlowEffect layer](self, "layer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setValue:forKeyPath:", v17, v29);
  }

}

- (void)setPulsing:(BOOL)a3
{
  CABasicAnimation *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CABasicAnimation *pulseAnimation;
  CABasicAnimation *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("filters.pulseFilter.inputRadius"));
    v5 = (CABasicAnimation *)objc_claimAutoreleasedReturnValue();
    -[CABasicAnimation setDuration:](v5, "setDuration:", self->_pulseInterval * 0.5);
    LODWORD(v6) = 2139095040;
    -[CABasicAnimation setRepeatCount:](v5, "setRepeatCount:", v6);
    -[CABasicAnimation setAutoreverses:](v5, "setAutoreverses:", 1);
    -[CABasicAnimation setDelegate:](v5, "setDelegate:", self);
    *(float *)&v7 = self->_preferredFrameRateRange.minimum;
    *(float *)&v8 = self->_preferredFrameRateRange.maximum;
    *(float *)&v9 = self->_preferredFrameRateRange.preferred;
    -[CABasicAnimation setPreferredFrameRateRange:](v5, "setPreferredFrameRateRange:", v7, v8, v9);
    pulseAnimation = self->_pulseAnimation;
    self->_pulseAnimation = v5;
    v11 = v5;

    -[TUIGlowEffect updatePulseAnimationRadius](self, "updatePulseAnimationRadius");
    -[TUIGlowEffect layer](self, "layer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addAnimation:forKey:", v11, CFSTR("filters.pulseFilter.inputRadius"));

  }
  else
  {
    -[TUIGlowEffect layer](self, "layer");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeAnimationForKey:", CFSTR("filters.pulseFilter.inputRadius"));

    -[TUIGlowEffect layer](self, "layer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_minimumRadius);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setValue:forKeyPath:", v15, CFSTR("filters.pulseFilter.inputRadius"));

    v12 = self->_pulseAnimation;
    self->_pulseAnimation = 0;
  }

  self->_pulsing = a3;
}

- (CALayer)layer
{
  return self->_layer;
}

- (void)setupFilters
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CD2C88];
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2C88]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB37E8];
  -[TUIGlowEffect nonPulseRadius](self, "nonPulseRadius");
  objc_msgSend(v5, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v6, CFSTR("inputRadius"));

  objc_msgSend(v4, "setName:", CFSTR("nonPulseFilter"));
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB37E8];
  -[TUIGlowEffect minimumRadius](self, "minimumRadius");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setValue:forKey:", v9, CFSTR("inputRadius"));

  objc_msgSend(v7, "setName:", CFSTR("pulseFilter"));
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", *MEMORY[0x1E0CD2B80]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forKey:", &unk_1E25178E0, CFSTR("inputAmount"));
  objc_msgSend(v10, "setValue:forKey:", -[TUIGlowEffect tintColor](self, "tintColor"), CFSTR("inputColor"));
  objc_msgSend(v10, "setName:", CFSTR("thresholdFilter"));
  objc_msgSend(MEMORY[0x1E0CD2780], "filterWithType:", v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0CB37E8];
  -[TUIGlowEffect blurRadius](self, "blurRadius");
  objc_msgSend(v12, "numberWithDouble:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setValue:forKey:", v13, CFSTR("inputRadius"));

  objc_msgSend(v11, "setName:", CFSTR("blurFilter"));
  v16[0] = v4;
  v16[1] = v7;
  v16[2] = v10;
  v16[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUIGlowEffect layer](self, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFilters:", v14);

}

- (CGColor)tintColor
{
  return self->_tintColor;
}

- (double)nonPulseRadius
{
  return self->_nonPulseRadius;
}

- (double)minimumRadius
{
  return self->_minimumRadius;
}

- (double)blurRadius
{
  return self->_blurRadius;
}

- (void)setTintColor:(CGColor *)a3
{
  -[TUIGlowEffect setTintColor:animated:duration:autoreverses:repeatCount:](self, "setTintColor:animated:duration:autoreverses:repeatCount:", a3, 0, 0, 0.0, 0.0);
}

- (void)setMinimumRadius:(double)a3
{
  if (self->_minimumRadius != a3)
  {
    self->_minimumRadius = a3;
    -[TUIGlowEffect setPulsing:](self, "setPulsing:", self->_pulsing);
  }
}

- (void)dealloc
{
  objc_super v3;

  CGColorRelease(self->_tintColor);
  v3.receiver = self;
  v3.super_class = (Class)TUIGlowEffect;
  -[TUIGlowEffect dealloc](&v3, sel_dealloc);
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  NSMutableDictionary *animationStates;
  void *v6;
  void *v7;
  id v8;
  NSMutableDictionary *v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    animationStates = self->_animationStates;
    objc_msgSend(v11, "keyPath");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](animationStates, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "animation");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8 == v11)
    {
      v9 = self->_animationStates;
      objc_msgSend(v11, "keyPath");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary removeObjectForKey:](v9, "removeObjectForKey:", v10);

    }
  }

}

- (void)setTintColor:(CGColor *)a3 animated:(BOOL)a4 duration:(double)a5
{
  -[TUIGlowEffect setTintColor:animated:duration:autoreverses:repeatCount:](self, "setTintColor:animated:duration:autoreverses:repeatCount:", a3, a4, 0, a5, 0.0);
}

- (void)updatePulseAnimationRadius
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_minimumRadius);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CABasicAnimation setFromValue:](self->_pulseAnimation, "setFromValue:", v3);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_minimumRadius + self->_pulseRadius);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CABasicAnimation setToValue:](self->_pulseAnimation, "setToValue:", v4);

  -[TUIGlowEffect layer](self, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAnimationForKey:", CFSTR("filters.pulseFilter.inputRadius"));

  -[TUIGlowEffect layer](self, "layer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addAnimation:forKey:", self->_pulseAnimation, CFSTR("filters.pulseFilter.inputRadius"));

}

- (void)setPulseInterval:(double)a3
{
  if (self->_pulseInterval != a3)
  {
    if (self->_pulsing)
    {
      -[CABasicAnimation setDuration:](self->_pulseAnimation, "setDuration:", a3);
      -[TUIGlowEffect setPulsing:](self, "setPulsing:", self->_pulsing);
    }
    self->_pulseInterval = a3;
  }
}

- (void)setPulseRadius:(double)a3
{
  if (self->_pulseRadius != a3)
  {
    self->_pulseRadius = a3;
    -[TUIGlowEffect setPulsing:](self, "setPulsing:", self->_pulsing);
  }
}

- (void)setNonPulseRadius:(double)a3
{
  -[TUIGlowEffect setNonPulseRadius:animated:duration:](self, "setNonPulseRadius:animated:duration:", 0, a3, 0.0);
}

- (void)setNonPulseRadius:(double)a3 animated:(BOOL)a4 duration:(double)a5
{
  _BOOL8 v7;
  void *v9;
  void *v10;

  if (self->_nonPulseRadius != a3)
  {
    v7 = a4;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUIGlowEffect updatePropertyForKeyPath:oldValue:newValue:animated:duration:autoreverses:repeatCount:](self, "updatePropertyForKeyPath:oldValue:newValue:animated:duration:autoreverses:repeatCount:", CFSTR("filters.nonPulseFilter.inputRadius"), v9, v10, v7, 0, a5, 0.0);

    self->_nonPulseRadius = a3;
  }
}

- (void)setPreferredFrameRateRange:(CAFrameRateRange)a3
{
  float preferred;
  float maximum;
  float minimum;

  preferred = a3.preferred;
  maximum = a3.maximum;
  minimum = a3.minimum;
  if (!CAFrameRateRangeIsEqualToRange(self->_preferredFrameRateRange, a3))
  {
    self->_preferredFrameRateRange.minimum = minimum;
    self->_preferredFrameRateRange.maximum = maximum;
    self->_preferredFrameRateRange.preferred = preferred;
    -[TUIGlowEffect setPulsing:](self, "setPulsing:", self->_pulsing);
  }
}

- (void)recordAnimation:(id)a3 duration:(double)a4 fromValue:(id)a5 toValue:(id)a6 keyPath:(id)a7
{
  id v9;
  id v10;
  _TUICursorEffectAnimationState *v11;

  v9 = a7;
  v10 = a3;
  v11 = objc_alloc_init(_TUICursorEffectAnimationState);
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  -[_TUICursorEffectAnimationState setStartTime:](v11, "setStartTime:");
  -[_TUICursorEffectAnimationState setAnimation:](v11, "setAnimation:", v10);

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_animationStates, "setObject:forKeyedSubscript:", v11, v9);
}

- (id)estimateAnimationValueForKeyPath:(id)a3
{
  void *v4;
  id v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGColor *v16;
  CGColorRef v17;
  double v19;
  double v20;
  double v21;
  double v22;
  CFTypeID v23;
  float v24;
  double v25;
  float v26;
  CGColor *v27;
  CGColor *v28;
  size_t NumberOfComponents;
  size_t v30;
  float64x2_t *v31;
  float64x2_t *v32;
  CGColorSpace *ColorSpace;
  float64x2_t v34;
  double v35;
  float64x2_t v36;
  CGFloat components[2];
  float64x2_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  v7 = v6;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_animationStates, "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    v17 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v8, "animation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fromValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "toValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startTime");
  v13 = v12;
  objc_msgSend(v9, "duration");
  if (v7 < v13 + v14)
  {
    objc_msgSend(v9, "duration");
    if (v15 >= 2.22044605e-16)
    {
      objc_msgSend(v8, "startTime");
      v20 = v19;
      objc_msgSend(v9, "duration");
      v22 = v21;
      v23 = CFGetTypeID(v10);
      if (v23 == CFGetTypeID(v11))
      {
        v35 = (v7 - v20) / v22;
        if (v23 == CFNumberGetTypeID())
        {
          objc_msgSend(v10, "floatValue");
          v25 = v24;
          objc_msgSend(v11, "floatValue");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v25 + v35 * (v26 - v25));
          v16 = (CGColor *)objc_claimAutoreleasedReturnValue();
          goto LABEL_5;
        }
        if (v23 == CGColorGetTypeID())
        {
          v27 = v10;
          v28 = v11;
          NumberOfComponents = CGColorGetNumberOfComponents(v27);
          v30 = CGColorGetNumberOfComponents(v27);
          if (NumberOfComponents == 4 && v30 == 4)
          {
            v31 = (float64x2_t *)CGColorGetComponents(v27);
            v32 = (float64x2_t *)CGColorGetComponents(v28);
            v34 = vmlaq_n_f64(v31[1], vsubq_f64(v32[1], v31[1]), v35);
            v36 = vmlaq_n_f64(*v31, vsubq_f64(*v32, *v31), v35);
            ColorSpace = CGColorGetColorSpace(v27);
            *(float64x2_t *)components = v36;
            v38 = v34;
            v17 = CGColorCreate(ColorSpace, components);
            CFRelease(v27);
            CFRelease(v28);
            goto LABEL_6;
          }
          CFRelease(v27);
          CFRelease(v28);
        }
      }
      v17 = 0;
      goto LABEL_6;
    }
  }
  v16 = v11;
LABEL_5:
  v17 = v16;
LABEL_6:

LABEL_8:
  return v17;
}

- (BOOL)pulsing
{
  return self->_pulsing;
}

- (double)pulseInterval
{
  return self->_pulseInterval;
}

- (double)pulseRadius
{
  return self->_pulseRadius;
}

- (CAFrameRateRange)preferredFrameRateRange
{
  float minimum;
  float maximum;
  float preferred;
  CAFrameRateRange result;

  minimum = self->_preferredFrameRateRange.minimum;
  maximum = self->_preferredFrameRateRange.maximum;
  preferred = self->_preferredFrameRateRange.preferred;
  result.preferred = preferred;
  result.maximum = maximum;
  result.minimum = minimum;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationStates, 0);
  objc_storeStrong((id *)&self->_colorAnimation, 0);
  objc_storeStrong((id *)&self->_radiusAnimation, 0);
  objc_storeStrong((id *)&self->_pulseAnimation, 0);
  objc_storeStrong((id *)&self->_layer, 0);
}

+ (BOOL)adjustVisibilityForDarkMode:(BOOL)a3 tintColor:(CGColor *)a4 alpha:(double)a5 outTintColor:(CGColor *)a6 outAlpha:(double *)a7
{
  const CGFloat *v12;
  int8x16_t v13;
  float64x2_t v14;
  int64x2_t v15;
  BOOL result;
  CGColor *v17;
  double v18;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  long double v27;
  double v28;
  BOOL v29;
  double v30;
  double v31;
  long double v32;
  int v33;
  double v34;
  long double v35;
  double v36;
  double v37;
  double v38;
  CGFloat v39;
  CGFloat v40;
  CGColorRef v41;
  double v42;
  double v43;
  float64x2_t v44;
  CGFloat components[5];

  components[4] = *(CGFloat *)MEMORY[0x1E0C80C00];
  if (adjustVisibilityForDarkMode_tintColor_alpha_outTintColor_outAlpha__onceToken != -1)
  {
    dispatch_once(&adjustVisibilityForDarkMode_tintColor_alpha_outTintColor_outAlpha__onceToken, &__block_literal_global_3343);
    if (a3)
      goto LABEL_3;
LABEL_5:
    result = 0;
    *a6 = a4;
    *a7 = a5;
    return result;
  }
  if (!a3)
    goto LABEL_5;
LABEL_3:
  if (CGColorGetNumberOfComponents(a4) <= 2)
    goto LABEL_5;
  v12 = CGColorGetComponents(a4);
  *(CGFloat *)v13.i64 = v12[2];
  v14.f64[0] = 0.0784313725;
  v15 = vcgtq_f64(vabdq_f64(*(float64x2_t *)v12, (float64x2_t)vextq_s8(*(int8x16_t *)v12, v13, 8uLL)), (float64x2_t)vdupq_n_s64(0x3FB4141414141414uLL));
  if ((vorrq_s8((int8x16_t)vdupq_laneq_s64(v15, 1), vorrq_s8((int8x16_t)vcgtq_f64(vabdq_f64((float64x2_t)v13, *(float64x2_t *)v12), v14), (int8x16_t)v15)).u64[0] & 0x8000000000000000) == 0)goto LABEL_5;
  v43 = v12[2];
  v44 = *(float64x2_t *)v12;
  MEMORY[0x18D786F30](adjustVisibilityForDarkMode_tintColor_alpha_outTintColor_outAlpha__extendedGrayColorSpace, 0);
  v17 = (CGColor *)CGColorTransformConvertColor();
  CGColorTransformRelease();
  v18 = *CGColorGetComponents(v17);
  CGColorRelease(v17);
  if (v44.f64[0] < v44.f64[1] || v44.f64[0] < v43)
  {
    if (v44.f64[1] < v44.f64[0] || v44.f64[1] < v43)
    {
      if (v44.f64[1] >= v44.f64[0])
        v20 = v44.f64[0];
      else
        v20 = v44.f64[1];
      v21 = v43;
    }
    else
    {
      if (v44.f64[0] >= v43)
        v20 = v43;
      else
        v20 = v44.f64[0];
      v21 = v44.f64[1];
    }
  }
  else
  {
    if (v44.f64[1] >= v43)
      v20 = v43;
    else
      v20 = v44.f64[1];
    v21 = v44.f64[0];
  }
  v22 = 0.0;
  if (v21 <= 0.0)
  {
    v24 = 0.0;
  }
  else
  {
    v23 = v21 - v20;
    v24 = (v21 - v20) / v21;
    if (v24 != 0.0)
    {
      v25 = (v21 - v44.f64[1]) / v23;
      v26 = (v21 - v43) / v23;
      if (v21 == v44.f64[0])
      {
        if (v20 == v44.f64[1])
          v22 = v26 + 5.0;
        else
          v22 = 1.0 - v25;
      }
      else
      {
        v42 = (v21 - v44.f64[0]) / v23;
        if (v21 == v44.f64[1])
        {
          if (v20 == v43)
            v22 = v42 + 1.0;
          else
            v22 = 3.0 - v26;
        }
        else if (v20 == v44.f64[0])
        {
          v22 = v25 + 3.0;
        }
        else
        {
          v22 = 5.0 - v42;
        }
      }
    }
  }
  v27 = fmod(v22 / 6.0, 1.0);
  v28 = 0.1;
  v29 = v18 <= 0.48;
  if (v18 <= 0.48)
    v30 = v21 + 0.1;
  else
    v30 = v21;
  if (v29)
    v28 = 0.2;
  v31 = v28 + a5;
  v32 = fmod(v27, 1.0) * 6.0;
  v33 = (int)v32;
  v34 = fmin(v24 + 0.2, 1.0);
  v35 = v32 - (double)(int)v32;
  v36 = v30 * (1.0 - v34);
  v37 = v30 * (1.0 - v34 * v35);
  v38 = v30 * (1.0 - v34 * (1.0 - v35));
  v39 = v30;
  v40 = v38;
  switch(v33)
  {
    case 0:
      goto LABEL_44;
    case 1:
      v39 = v37;
      v40 = v30;
      goto LABEL_44;
    case 2:
      v39 = v36;
      v40 = v30;
      v36 = v38;
      goto LABEL_44;
    case 3:
      v39 = v36;
      v40 = v37;
      goto LABEL_42;
    case 4:
      v39 = v38;
      v40 = v36;
LABEL_42:
      v36 = v30;
      goto LABEL_44;
    case 5:
      v39 = v30;
      v40 = v36;
      v36 = v37;
LABEL_44:
      components[0] = v39;
      components[1] = v40;
      components[2] = v36;
      break;
    default:
      break;
  }
  components[3] = 1.0;
  v41 = CGColorCreate((CGColorSpaceRef)adjustVisibilityForDarkMode_tintColor_alpha_outTintColor_outAlpha__extendedSRGBColorSpace, components);
  CFAutorelease(v41);
  *a6 = v41;
  *a7 = v31;
  return 1;
}

CGColorSpaceRef __83__TUIGlowEffect_adjustVisibilityForDarkMode_tintColor_alpha_outTintColor_outAlpha___block_invoke()
{
  CGColorSpaceRef result;

  adjustVisibilityForDarkMode_tintColor_alpha_outTintColor_outAlpha__extendedGrayColorSpace = (uint64_t)CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D930]);
  result = CGColorSpaceCreateWithName((CFStringRef)*MEMORY[0x1E0C9D960]);
  adjustVisibilityForDarkMode_tintColor_alpha_outTintColor_outAlpha__extendedSRGBColorSpace = (uint64_t)result;
  return result;
}

@end
