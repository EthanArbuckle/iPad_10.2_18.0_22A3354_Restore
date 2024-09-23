@implementation SBBannerTransitionSettings

- (void)setDefaultValues
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;
  CAFrameRateRange v12;
  CAFrameRateRange v13;

  v11.receiver = self;
  v11.super_class = (Class)SBBannerTransitionSettings;
  -[PTSettings setDefaultValues](&v11, sel_setDefaultValues);
  -[SBBannerTransitionSettings customBannerTransitionStylePoof](self, "customBannerTransitionStylePoof");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDefaultValues");

  -[SBBannerTransitionSettings customBannerTransitionStylePoof](self, "customBannerTransitionStylePoof");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDampingRatio:", 0.7);

  -[SBBannerTransitionSettings customBannerTransitionStylePoof](self, "customBannerTransitionStylePoof");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setResponse:", 0.55);

  -[SBBannerTransitionSettings customBannerTransitionStylePoof](self, "customBannerTransitionStylePoof");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v6, "setFrameRateRange:highFrameRateReason:", 1114142, *(double *)&v12.minimum, *(double *)&v12.maximum, *(double *)&v12.preferred);

  -[SBBannerTransitionSettings setPoofInitialScale:](self, "setPoofInitialScale:", 0.6);
  -[SBBannerTransitionSettings setPoofInitialBlurRadius:](self, "setPoofInitialBlurRadius:", 90.0);
  -[SBBannerTransitionSettings setPoofDismissedScale:](self, "setPoofDismissedScale:", 0.6);
  -[SBBannerTransitionSettings setPoofDismissedBlurRadius:](self, "setPoofDismissedBlurRadius:", 90.0);
  -[SBBannerTransitionSettings customBannerTransitionStyleSystemAction](self, "customBannerTransitionStyleSystemAction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDefaultValues");

  -[SBBannerTransitionSettings customBannerTransitionStyleSystemAction](self, "customBannerTransitionStyleSystemAction");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDampingRatio:", 0.7);

  -[SBBannerTransitionSettings customBannerTransitionStyleSystemAction](self, "customBannerTransitionStyleSystemAction");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setResponse:", 0.55);

  -[SBBannerTransitionSettings customBannerTransitionStyleSystemAction](self, "customBannerTransitionStyleSystemAction");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v10, "setFrameRateRange:highFrameRateReason:", 1114142, *(double *)&v13.minimum, *(double *)&v13.maximum, *(double *)&v13.preferred);

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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[2];
  _QWORD v26[6];
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83008];
  objc_msgSend(MEMORY[0x1E0D83088], "actionWithSettingsKeyPath:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rowWithTitle:action:", CFSTR("Restore Defaults"), v3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0D83070];
  v27[0] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sectionWithRows:", v5);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Poof Animation Settings"), CFSTR("customBannerTransitionStylePoof"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Poof Initial Scale"), CFSTR("poofInitialScale"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "minValue:maxValue:", 0.5, 1.5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Poof Initial Blur Radius"), CFSTR("poofInitialBlurRadius"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "minValue:maxValue:", 0.0, 150.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Poof Dismissed Scale"), CFSTR("poofDismissedScale"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "minValue:maxValue:", 0.5, 1.5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Poof Dismissed Blur Radius"), CFSTR("poofDismissedBlurRadius"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "minValue:maxValue:", 0.0, 150.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83040], "rowWithTitle:childSettingsKeyPath:", CFSTR("Staccato Animation Settings"), CFSTR("customBannerTransitionStyleSystemAction"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0D83070];
  v26[0] = v22;
  v26[1] = v7;
  v26[2] = v11;
  v26[3] = v9;
  v26[4] = v13;
  v26[5] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "sectionWithRows:title:", v16, CFSTR("Transition Settings"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0D83070];
  v25[0] = v23;
  v25[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "moduleWithTitle:contents:", CFSTR("Custom Banner Transitions"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (SBFFluidBehaviorSettings)customBannerTransitionStylePoof
{
  return self->_customBannerTransitionStylePoof;
}

- (void)setCustomBannerTransitionStylePoof:(id)a3
{
  objc_storeStrong((id *)&self->_customBannerTransitionStylePoof, a3);
}

- (double)poofInitialBlurRadius
{
  return self->_poofInitialBlurRadius;
}

- (void)setPoofInitialBlurRadius:(double)a3
{
  self->_poofInitialBlurRadius = a3;
}

- (double)poofDismissedBlurRadius
{
  return self->_poofDismissedBlurRadius;
}

- (void)setPoofDismissedBlurRadius:(double)a3
{
  self->_poofDismissedBlurRadius = a3;
}

- (double)poofInitialScale
{
  return self->_poofInitialScale;
}

- (void)setPoofInitialScale:(double)a3
{
  self->_poofInitialScale = a3;
}

- (double)poofDismissedScale
{
  return self->_poofDismissedScale;
}

- (void)setPoofDismissedScale:(double)a3
{
  self->_poofDismissedScale = a3;
}

- (SBFFluidBehaviorSettings)customBannerTransitionStyleSystemAction
{
  return self->_customBannerTransitionStyleSystemAction;
}

- (void)setCustomBannerTransitionStyleSystemAction:(id)a3
{
  objc_storeStrong((id *)&self->_customBannerTransitionStyleSystemAction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customBannerTransitionStyleSystemAction, 0);
  objc_storeStrong((id *)&self->_customBannerTransitionStylePoof, 0);
}

@end
