@implementation SBHCenterAcceleratedAppSuspendSettings

- (void)setDefaultValues
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBHCenterAcceleratedAppSuspendSettings;
  -[SBHCenterAppSuspendSettings setDefaultValues](&v5, sel_setDefaultValues);
  -[SBHCenterAppZoomSettings appFadeSettings](self, "appFadeSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelay:", 0.15);

  -[SBHCenterAppZoomSettings appFadeSettings](self, "appFadeSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDuration:", 0.3);

}

@end
