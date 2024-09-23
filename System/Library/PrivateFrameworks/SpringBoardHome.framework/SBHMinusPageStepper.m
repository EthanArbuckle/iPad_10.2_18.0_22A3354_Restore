@implementation SBHMinusPageStepper

- (SBHMinusPageStepper)init
{
  SBHMinusPageStepper *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBHMinusPageStepper;
  v2 = -[SBFSteppedAnimationTimingFunctionCalculator init](&v11, sel_init);
  if (v2)
  {
    LODWORD(v4) = 1036831949;
    LODWORD(v3) = 0.25;
    LODWORD(v5) = 0.25;
    LODWORD(v6) = 1.0;
    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v3, v4, v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D016B0], "settingsWithDuration:delay:timingFunction:", v7, 0.75, 0.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D016B0], "settingsWithDuration:delay:timingFunction:", v7, 0.65, 0.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFSteppedAnimationTimingFunctionCalculator addTimingFunctionWithName:fromNormalizedAnimationSettings:](v2, "addTimingFunctionWithName:fromNormalizedAnimationSettings:", CFSTR("backgroundBlurAlpha"), v8);
    -[SBFSteppedAnimationTimingFunctionCalculator addTimingFunctionWithName:fromNormalizedAnimationSettings:](v2, "addTimingFunctionWithName:fromNormalizedAnimationSettings:", CFSTR("pageControlAlpha"), v9);

  }
  return v2;
}

- (double)backgroundBlurAlpha
{
  double result;

  -[SBFSteppedAnimationTimingFunctionCalculator valueForFunctionWithName:](self, "valueForFunctionWithName:", CFSTR("backgroundBlurAlpha"));
  return result;
}

- (double)pageControlAlpha
{
  double v2;

  -[SBFSteppedAnimationTimingFunctionCalculator valueForFunctionWithName:](self, "valueForFunctionWithName:", CFSTR("pageControlAlpha"));
  return 1.0 - v2;
}

@end
