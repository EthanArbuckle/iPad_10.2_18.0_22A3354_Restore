@implementation NCSpringAnimationSettings

+ (id)moduleWithSectionTitle:(id)a3
{
  void *v3;
  id v4;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  objc_msgSend(v3, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Damping Ratio"), CFSTR("dampingRatio"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "between:and:", 0.001, 10.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "precision:", 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v8);

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Response"), CFSTR("response"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "between:and:", 0.0, 1000.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "precision:", 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v11);

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Retarget Impulse"), CFSTR("retargetImpulse"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "between:and:", 0.0, 1.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "precision:", 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v14);

  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Frame Rate Range"), CFSTR("preferredFrameRateRange"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v15);

  v16 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83078], "sectionWithRows:title:", v5, v4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v21[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "moduleWithTitle:contents:", 0, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)settingsControllerModule
{
  return (id)objc_msgSend(a1, "moduleWithSectionTitle:", CFSTR("Spring Animation Settings"));
}

- (void)setFrameRateRange:(CAFrameRateRange)a3 highFrameRateReason:(unsigned int)a4
{
  uint64_t v4;
  float preferred;
  float maximum;
  float minimum;
  double v8;
  double v9;
  double v10;
  id v11;

  v4 = *(_QWORD *)&a4;
  preferred = a3.preferred;
  maximum = a3.maximum;
  minimum = a3.minimum;
  -[NCSpringAnimationSettings preferredFrameRateRange](self, "preferredFrameRateRange");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v8 = minimum;
  *(float *)&v9 = maximum;
  *(float *)&v10 = preferred;
  objc_msgSend(v11, "setFrameRateRange:highFrameRateReason:", v4, v8, v9, v10);

}

- (CAFrameRateRange)frameRateRange
{
  void *v2;
  float v3;
  float v4;
  float v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  CAFrameRateRange result;

  -[NCSpringAnimationSettings preferredFrameRateRange](self, "preferredFrameRateRange");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frameRateRange");
  v4 = v3;
  v6 = v5;
  v8 = v7;

  v9 = v4;
  v10 = v6;
  v11 = v8;
  result.preferred = v11;
  result.maximum = v10;
  result.minimum = v9;
  return result;
}

- (void)animateTracking:(BOOL)a3 animations:(id)a4 completion:(id)a5
{
  _BOOL8 v6;
  void *v8;
  id v9;
  id v10;

  v6 = a3;
  v8 = (void *)MEMORY[0x1E0DC3F10];
  v9 = a5;
  NCModifyFrameRateForAnimationBlockFromSettings(a4, self);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_animateUsingSpringBehavior:tracking:animations:completion:", self, v6, v10, v9);

}

- (void)setDefaultValues
{
  -[NCSpringAnimationSettings setDampingRatio:](self, "setDampingRatio:", 0.845);
  -[NCSpringAnimationSettings setResponse:](self, "setResponse:", 0.531);
  -[NCSpringAnimationSettings setRetargetImpulse:](self, "setRetargetImpulse:", 0.0);
}

- (void)setDefaultCriticallyDampedValues
{
  -[NCSpringAnimationSettings setDefaultValues](self, "setDefaultValues");
  -[NCSpringAnimationSettings setDampingRatio:](self, "setDampingRatio:", 1.0);
  -[NCSpringAnimationSettings setResponse:](self, "setResponse:", 0.336);
}

- ($6E732EA7D3E0C9EC9CEEF7385E7E4683)parametersForTransitionFromState:(SEL)a3 toState:(int)a4
{
  double var7;
  double var8;

  retstr->var9 = 0.0;
  *(_OWORD *)&retstr->var5 = 0u;
  *(_OWORD *)&retstr->var7 = 0u;
  var7 = self->var7;
  *(_OWORD *)&retstr->var2 = 0u;
  var8 = self->var8;
  retstr->var0 = var7;
  retstr->var1 = var8;
  retstr->var10 = self->var9;
  return self;
}

- (double)dampingRatio
{
  return self->_dampingRatio;
}

- (void)setDampingRatio:(double)a3
{
  self->_dampingRatio = a3;
}

- (double)response
{
  return self->_response;
}

- (void)setResponse:(double)a3
{
  self->_response = a3;
}

- (double)retargetImpulse
{
  return self->_retargetImpulse;
}

- (void)setRetargetImpulse:(double)a3
{
  self->_retargetImpulse = a3;
}

- (PTFrameRateRangeSettings)preferredFrameRateRange
{
  return self->_preferredFrameRateRange;
}

- (void)setPreferredFrameRateRange:(id)a3
{
  objc_storeStrong((id *)&self->_preferredFrameRateRange, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredFrameRateRange, 0);
}

@end
