@implementation PUWallpaperPlaygroundSettings

- (id)parentSettings
{
  return 0;
}

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUWallpaperPlaygroundSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[PUWallpaperPlaygroundSettings setApplyLowAPLFilter:](self, "setApplyLowAPLFilter:", 1);
  -[PUWallpaperPlaygroundSettings setLowAPLFilterAmount:](self, "setLowAPLFilterAmount:", 0.03);
  -[PUWallpaperPlaygroundSettings setLowLuminanceTransformAnimationDuration:](self, "setLowLuminanceTransformAnimationDuration:", 0.5);
  -[PUWallpaperPlaygroundSettings setLowLuminanceAlphaAnimationDuration:](self, "setLowLuminanceAlphaAnimationDuration:", 0.5);
  -[PUWallpaperPlaygroundSettings setShuffleSleepTransformOutAnimationDuration:](self, "setShuffleSleepTransformOutAnimationDuration:", 0.5);
  -[PUWallpaperPlaygroundSettings setShuffleSleepFadeOutAnimationDuration:](self, "setShuffleSleepFadeOutAnimationDuration:", 0.5);
  -[PUWallpaperPlaygroundSettings setShuffleSleepFadeInAnimationDuration:](self, "setShuffleSleepFadeInAnimationDuration:", 1.995);
}

- (BOOL)applyLowAPLFilter
{
  return self->_applyLowAPLFilter;
}

- (void)setApplyLowAPLFilter:(BOOL)a3
{
  self->_applyLowAPLFilter = a3;
}

- (double)lowAPLFilterAmount
{
  return self->_lowAPLFilterAmount;
}

- (void)setLowAPLFilterAmount:(double)a3
{
  self->_lowAPLFilterAmount = a3;
}

- (double)lowLuminanceTransformAnimationDuration
{
  return self->_lowLuminanceTransformAnimationDuration;
}

- (void)setLowLuminanceTransformAnimationDuration:(double)a3
{
  self->_lowLuminanceTransformAnimationDuration = a3;
}

- (double)lowLuminanceAlphaAnimationDuration
{
  return self->_lowLuminanceAlphaAnimationDuration;
}

- (void)setLowLuminanceAlphaAnimationDuration:(double)a3
{
  self->_lowLuminanceAlphaAnimationDuration = a3;
}

- (double)shuffleSleepTransformOutAnimationDuration
{
  return self->_shuffleSleepTransformOutAnimationDuration;
}

- (void)setShuffleSleepTransformOutAnimationDuration:(double)a3
{
  self->_shuffleSleepTransformOutAnimationDuration = a3;
}

- (double)shuffleSleepFadeOutAnimationDuration
{
  return self->_shuffleSleepFadeOutAnimationDuration;
}

- (void)setShuffleSleepFadeOutAnimationDuration:(double)a3
{
  self->_shuffleSleepFadeOutAnimationDuration = a3;
}

- (double)shuffleSleepFadeInAnimationDuration
{
  return self->_shuffleSleepFadeInAnimationDuration;
}

- (void)setShuffleSleepFadeInAnimationDuration:(double)a3
{
  self->_shuffleSleepFadeInAnimationDuration = a3;
}

+ (id)sharedInstance
{
  uint64_t v3;
  void *v4;

  os_unfair_lock_lock(MEMORY[0x1E0D7C768]);
  if (!sharedInstance_sharedInstance_16622)
  {
    objc_msgSend(a1, "createSharedInstance");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)sharedInstance_sharedInstance_16622;
    sharedInstance_sharedInstance_16622 = v3;

  }
  os_unfair_lock_unlock(MEMORY[0x1E0D7C768]);
  return (id)sharedInstance_sharedInstance_16622;
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
  void *v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  _QWORD v43[7];
  _QWORD v44[5];

  v44[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83078];
  v3 = (void *)MEMORY[0x1E0D83108];
  NSStringFromSelector(sel_applyLowAPLFilter);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rowWithTitle:valueKeyPath:", CFSTR("Apply Low APL Filter"), v41);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = v40;
  v4 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_lowAPLFilterAmount);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rowWithTitle:valueKeyPath:", CFSTR("Filter Amount"), v39);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "minValue:maxValue:", 0.001, 0.05);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v37;
  v5 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_lowLuminanceTransformAnimationDuration);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rowWithTitle:valueKeyPath:", CFSTR("Scale Animation Duration"), v36);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "minValue:maxValue:", 0.0, 2.0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v43[2] = v34;
  v6 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_lowLuminanceAlphaAnimationDuration);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rowWithTitle:valueKeyPath:", CFSTR("Alpha Animation Duration"), v33);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "minValue:maxValue:", 0.0, 2.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v43[3] = v31;
  v7 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_shuffleSleepTransformOutAnimationDuration);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rowWithTitle:valueKeyPath:", CFSTR("Shuffle Sleep Transform Out"), v30);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "minValue:maxValue:", 0.0, 2.0);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v43[4] = v28;
  v8 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_shuffleSleepFadeOutAnimationDuration);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "rowWithTitle:valueKeyPath:", CFSTR("Shuffle Sleep Fade Out"), v27);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "minValue:maxValue:", 0.0, 2.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v43[5] = v25;
  v9 = (void *)MEMORY[0x1E0D830F8];
  NSStringFromSelector(sel_shuffleSleepFadeInAnimationDuration);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rowWithTitle:valueKeyPath:", CFSTR("Shuffle Sleep Fade In"), v24);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "minValue:maxValue:", 0.0, 2.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v43[6] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:title:", v11, CFSTR("Low Luminance"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v12;
  v13 = (void *)MEMORY[0x1E0D83078];
  v14 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D830A0], "actionWithHandler:", &__block_literal_global_352);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "rowWithTitle:action:", CFSTR("Trigger Shuffle"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sectionWithRows:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v44[1] = v18;
  objc_msgSend(MEMORY[0x1E0D83078], "px_restoreDefaultsSection");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v44[2] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "moduleWithTitle:contents:", CFSTR("Settings"), v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

uint64_t __57__PUWallpaperPlaygroundSettings_settingsControllerModule__block_invoke()
{
  void *v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "postNotificationName:object:", CFSTR("PUWallpaperShuffleNotificationName"), 0);

  return 1;
}

@end
