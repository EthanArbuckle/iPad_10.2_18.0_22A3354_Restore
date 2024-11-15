@implementation VUIAutoPlayConfig

- (void)setAutoPlayVideoSound:(BOOL)a3
{
  self->_autoPlayVideoSound = a3;
}

- (void)setAutoPlayDelayInterval:(double)a3
{
  self->_autoPlayDelayInterval = a3;
}

- (VUIAutoPlayConfig)init
{
  VUIAutoPlayConfig *v2;
  VUIAutoPlayConfig *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VUIAutoPlayConfig;
  v2 = -[VUIAutoPlayConfig init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_autoPlayDelayInterval = 0.0;
    v2->_autoPlayVideoSound = 0;
    v2->_disableBackgroundMediaPlayback = +[VUIFeaturesConfiguration BOOLValueForKey:fromDictionary:defaultValue:](VUIFeaturesConfiguration, "BOOLValueForKey:fromDictionary:defaultValue:", CFSTR("disableBackgroundMediaPlayback"), 0, 0);
  }
  return v3;
}

- (BOOL)disableBackgroundMediaPlayback
{
  return self->_disableBackgroundMediaPlayback;
}

- (BOOL)autoPlayVideoSound
{
  return self->_autoPlayVideoSound;
}

- (double)autoPlayDelayInterval
{
  return self->_autoPlayDelayInterval;
}

@end
