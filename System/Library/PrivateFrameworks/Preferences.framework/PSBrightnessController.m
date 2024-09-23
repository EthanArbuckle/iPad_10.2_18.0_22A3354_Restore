@implementation PSBrightnessController

+ (id)sharedController
{
  void *v2;
  PSBrightnessController *v3;
  void *v4;

  v2 = (void *)sharedController___sharedController;
  if (!sharedController___sharedController)
  {
    v3 = objc_alloc_init(PSBrightnessController);
    v4 = (void *)sharedController___sharedController;
    sharedController___sharedController = (uint64_t)v3;

    v2 = (void *)sharedController___sharedController;
  }
  return v2;
}

- (id)isTracking
{
  return self->_isTracking;
}

- (void)setIsTracking:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (id)brightnessChangedExternally
{
  return self->_brightnessChangedExternally;
}

- (void)setBrightnessChangedExternally:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_brightnessChangedExternally, 0);
  objc_storeStrong(&self->_isTracking, 0);
}

@end
