@implementation VUITimedMetadataVisualSmoothingConfig

- (VUITimedMetadataVisualSmoothingConfig)init
{
  VUITimedMetadataVisualSmoothingConfig *v2;
  VUITimedMetadataVisualSmoothingConfig *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)VUITimedMetadataVisualSmoothingConfig;
  v2 = -[VUITimedMetadataVisualSmoothingConfig init](&v15, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_timeRangeProximityThreshold = 0.5;
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("CapInitialLookBack"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", CFSTR("CapInitialLookAhead"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", CFSTR("CapLookAhead"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      objc_msgSend(v5, "doubleValue");
    else
      v10 = 5.0;
    v3->_initialLookBack = v10;
    v11 = 8.0;
    v12 = 8.0;
    if (v7)
      objc_msgSend(v7, "doubleValue", 8.0);
    v3->_initialLookAhead = v12;
    if (v9)
    {
      objc_msgSend(v9, "doubleValue");
      v11 = v13;
    }
    v3->_lookAhead = v11;

  }
  return v3;
}

- (double)initialLookBack
{
  return self->_initialLookBack;
}

- (void)setInitialLookBack:(double)a3
{
  self->_initialLookBack = a3;
}

- (double)initialLookAhead
{
  return self->_initialLookAhead;
}

- (void)setInitialLookAhead:(double)a3
{
  self->_initialLookAhead = a3;
}

- (double)lookAhead
{
  return self->_lookAhead;
}

- (void)setLookAhead:(double)a3
{
  self->_lookAhead = a3;
}

- (double)timeRangeProximityThreshold
{
  return self->_timeRangeProximityThreshold;
}

- (void)setTimeRangeProximityThreshold:(double)a3
{
  self->_timeRangeProximityThreshold = a3;
}

@end
