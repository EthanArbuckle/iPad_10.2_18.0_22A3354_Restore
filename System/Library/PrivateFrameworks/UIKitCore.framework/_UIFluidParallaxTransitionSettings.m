@implementation _UIFluidParallaxTransitionSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIFluidParallaxTransitionSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[_UIFluidParallaxTransitionSettings setRoundedCorners:](self, "setRoundedCorners:", 0);
  -[_UIFluidParallaxTransitionSettings setRubberBandExtent:](self, "setRubberBandExtent:", 0.5);
  -[UIViewSpringAnimationBehaviorSettings setDefaultCriticallyDampedValues](self->_noninteractiveSpring, "setDefaultCriticallyDampedValues");
  -[UIViewSpringAnimationBehaviorSettings setDampingRatio:](self->_noninteractiveSpring, "setDampingRatio:", 1.1);
  -[UIViewSpringAnimationBehaviorSettings setResponse:](self->_noninteractiveSpring, "setResponse:", 0.3);
  -[UIViewSpringAnimationBehaviorSettings setDefaultCriticallyDampedValues](self->_interactiveSpring, "setDefaultCriticallyDampedValues");
  -[UIViewSpringAnimationBehaviorSettings setDampingRatio:](self->_interactiveSpring, "setDampingRatio:", 0.85);
  -[UIViewSpringAnimationBehaviorSettings setResponse:](self->_interactiveSpring, "setResponse:", 0.45);
  -[UIViewSpringAnimationBehaviorSettings setTrackingDampingRatio:](self->_interactiveSpring, "setTrackingDampingRatio:", 0.85);
  -[UIViewSpringAnimationBehaviorSettings setTrackingResponse:](self->_interactiveSpring, "setTrackingResponse:", 0.08);
}

+ (id)settingsControllerModule
{
  void *v2;
  void *v3;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83108], "rowWithTitle:valueKeyPath:", CFSTR("Rounded Corners"), CFSTR("roundedCorners"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v18;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Rubber Band Extent"), CFSTR("rubberBandExtent"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "between:and:", 0.0, 1.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v16;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Noninteractive Spring"), CFSTR("noninteractiveSpring"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v3;
  objc_msgSend(MEMORY[0x1E0D83048], "rowWithTitle:childSettingsKeyPath:", CFSTR("Interactive Spring"), CFSTR("interactiveSpring"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v6;
  v7 = (void *)MEMORY[0x1E0D83078];
  v8 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "action");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rowWithTitle:action:", CFSTR("Restore Defaults"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sectionWithRows:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "moduleWithTitle:contents:", CFSTR("Parallax"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (UIViewSpringAnimationBehaviorSettings)noninteractiveSpring
{
  return self->_noninteractiveSpring;
}

- (UIViewSpringAnimationBehaviorSettings)interactiveSpring
{
  return self->_interactiveSpring;
}

- (double)rubberBandExtent
{
  return self->_rubberBandExtent;
}

- (void)setRubberBandExtent:(double)a3
{
  self->_rubberBandExtent = a3;
}

- (BOOL)roundedCorners
{
  return self->_roundedCorners;
}

- (void)setRoundedCorners:(BOOL)a3
{
  self->_roundedCorners = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactiveSpring, 0);
  objc_storeStrong((id *)&self->_noninteractiveSpring, 0);
}

@end
