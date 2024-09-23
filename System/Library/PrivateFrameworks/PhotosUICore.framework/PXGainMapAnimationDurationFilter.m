@implementation PXGainMapAnimationDurationFilter

- (PXGainMapAnimationDurationFilter)init
{
  void *v3;
  PXGainMapAnimationDurationFilter *v4;
  PXGainMapAnimationDurationFilter *v5;
  double v6;
  double v7;
  objc_super v9;

  +[PXImageModulationSettings sharedInstance](PXImageModulationSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "gainMapAnimationDuration");
  v9.receiver = self;
  v9.super_class = (Class)PXGainMapAnimationDurationFilter;
  v4 = -[PXNumberFilter initWithInput:](&v9, sel_initWithInput_);
  v5 = v4;
  if (v4)
  {
    -[PXNumberFilter currentTime](v4, "currentTime");
    v5->_filterStartTime = v6;
    v5->_enabled = objc_msgSend(v3, "animateGainMapAppearance");
    objc_msgSend(v3, "gainMapAnimationActivationThreshold");
    v5->_activationThreshold = v7;
  }

  return v5;
}

- (void)setGainMapImageAvailable:(BOOL)a3
{
  if (self->_gainMapImageAvailable != a3)
  {
    self->_gainMapImageAvailable = a3;
    if (!a3)
    {
      -[PXNumberFilter currentTime](self, "currentTime");
      -[PXGainMapAnimationDurationFilter setFilterStartTime:](self, "setFilterStartTime:");
    }
    -[PXNumberFilter invalidateOutput](self, "invalidateOutput");
  }
}

- (double)updatedOutput
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double result;

  if (!-[PXGainMapAnimationDurationFilter enabled](self, "enabled"))
    return 0.0;
  if (!-[PXGainMapAnimationDurationFilter gainMapImageAvailable](self, "gainMapImageAvailable"))
    return 0.0;
  -[PXNumberFilter currentTime](self, "currentTime");
  v4 = v3;
  -[PXGainMapAnimationDurationFilter filterStartTime](self, "filterStartTime");
  v6 = v4 - v5;
  -[PXGainMapAnimationDurationFilter activationThreshold](self, "activationThreshold");
  if (v6 <= v7)
    return 0.0;
  -[PXNumberFilter input](self, "input");
  return result;
}

- (BOOL)gainMapImageAvailable
{
  return self->_gainMapImageAvailable;
}

- (double)filterStartTime
{
  return self->_filterStartTime;
}

- (void)setFilterStartTime:(double)a3
{
  self->_filterStartTime = a3;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (double)activationThreshold
{
  return self->_activationThreshold;
}

- (void)setActivationThreshold:(double)a3
{
  self->_activationThreshold = a3;
}

@end
