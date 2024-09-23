@implementation SBSystemNotesSwipeMetricSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBSystemNotesSwipeMetricSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[SBSystemNotesSwipeMetricSettings setPanDistanceBeforeScaling:](self, "setPanDistanceBeforeScaling:", 50.0);
  -[SBSystemNotesSwipeMetricSettings setPanInitialThumbnailScale:](self, "setPanInitialThumbnailScale:", 1.0);
  -[SBSystemNotesSwipeMetricSettings setPanDistancePer1xScaling:](self, "setPanDistancePer1xScaling:", 200.0);
  -[SBSystemNotesSwipeMetricSettings setScaleThresholdBeforeFullSize:](self, "setScaleThresholdBeforeFullSize:", 0.6);
  -[SBSystemNotesSwipeMetricSettings setFlickVelocityThreshold:](self, "setFlickVelocityThreshold:", 500.0);
  -[SBSystemNotesSwipeMetricSettings setCornerDistanceBeforeScalingForDismiss:](self, "setCornerDistanceBeforeScalingForDismiss:", 270.0);
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
  void *v18;
  void *v19;
  _QWORD v20[7];

  v20[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Distance Before Scaling"), CFSTR("panDistanceBeforeScaling"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "minValue:maxValue:", 0.0, 500.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Initial Thumbnail Scale"), CFSTR("panInitialThumbnailScale"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Pan Distance Per 1x Scaling"), CFSTR("panDistancePer1xScaling"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minValue:maxValue:", 0.0, 500.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Scale Threshold Before Full Size"), CFSTR("scaleThresholdBeforeFullSize"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Flick Velocity Threshold"), CFSTR("flickVelocityThreshold"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "minValue:maxValue:", 0.0, 5000.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D830F0], "rowWithTitle:valueKeyPath:", CFSTR("Corner Distance Before Scaling for Dismiss"), CFSTR("cornerDistanceBeforeScalingForDismiss"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "minValue:maxValue:", -100.0, 500.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0D83070];
  v20[0] = v18;
  v20[1] = v3;
  v20[2] = v5;
  v20[3] = v6;
  v20[4] = v8;
  v20[5] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sectionWithRows:title:", v12, CFSTR("Swipe In Animation Metrics"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0D83070];
  v19 = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "moduleWithTitle:contents:", CFSTR("Swipe In Gesture Settings"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (BOOL)ignoresKey:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("cornerSwipeGestureEnabled"));
}

- (double)panDistanceBeforeScaling
{
  return self->_panDistanceBeforeScaling;
}

- (void)setPanDistanceBeforeScaling:(double)a3
{
  self->_panDistanceBeforeScaling = a3;
}

- (double)panInitialThumbnailScale
{
  return self->_panInitialThumbnailScale;
}

- (void)setPanInitialThumbnailScale:(double)a3
{
  self->_panInitialThumbnailScale = a3;
}

- (double)panDistancePer1xScaling
{
  return self->_panDistancePer1xScaling;
}

- (void)setPanDistancePer1xScaling:(double)a3
{
  self->_panDistancePer1xScaling = a3;
}

- (double)scaleThresholdBeforeFullSize
{
  return self->_scaleThresholdBeforeFullSize;
}

- (void)setScaleThresholdBeforeFullSize:(double)a3
{
  self->_scaleThresholdBeforeFullSize = a3;
}

- (double)flickVelocityThreshold
{
  return self->_flickVelocityThreshold;
}

- (void)setFlickVelocityThreshold:(double)a3
{
  self->_flickVelocityThreshold = a3;
}

- (double)cornerDistanceBeforeScalingForDismiss
{
  return self->_cornerDistanceBeforeScalingForDismiss;
}

- (void)setCornerDistanceBeforeScalingForDismiss:(double)a3
{
  self->_cornerDistanceBeforeScalingForDismiss = a3;
}

@end
