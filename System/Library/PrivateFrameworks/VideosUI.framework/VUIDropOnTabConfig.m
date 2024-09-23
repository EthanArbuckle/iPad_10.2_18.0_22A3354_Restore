@implementation VUIDropOnTabConfig

- (void)setDropOnTabIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_dropOnTabIdentifier, a3);
}

- (void)setDaysWithoutPlaybackThreshold:(id)a3
{
  objc_storeStrong((id *)&self->_daysWithoutPlaybackThreshold, a3);
}

- (void)setDaysWithoutOpeningThreshold:(id)a3
{
  objc_storeStrong((id *)&self->_daysWithoutOpeningThreshold, a3);
}

- (VUIDropOnTabConfig)init
{
  VUIDropOnTabConfig *v2;
  VUIDropOnTabConfig *v3;
  NSString *dropOnTabIdentifier;
  NSNumber *daysWithoutOpeningThreshold;
  NSNumber *daysWithoutPlaybackThreshold;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VUIDropOnTabConfig;
  v2 = -[VUIDropOnTabConfig init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    dropOnTabIdentifier = v2->_dropOnTabIdentifier;
    v2->_dropOnTabIdentifier = (NSString *)CFSTR("watchnow");

    daysWithoutOpeningThreshold = v3->_daysWithoutOpeningThreshold;
    v3->_daysWithoutOpeningThreshold = (NSNumber *)&unk_1EA0B9CA0;

    daysWithoutPlaybackThreshold = v3->_daysWithoutPlaybackThreshold;
    v3->_daysWithoutPlaybackThreshold = (NSNumber *)&unk_1EA0B9C88;

  }
  return v3;
}

- (NSString)dropOnTabIdentifier
{
  return self->_dropOnTabIdentifier;
}

- (NSNumber)daysWithoutPlaybackThreshold
{
  NSNumber *v3;
  NSNumber *daysWithoutPlaybackThreshold;
  NSNumber *v5;

  +[VUIFeaturesConfiguration defaultsNumberValueForKey:](VUIFeaturesConfiguration, "defaultsNumberValueForKey:", CFSTR("daysWithoutPlaybackThreshold"));
  v3 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  daysWithoutPlaybackThreshold = v3;
  if (!v3)
    daysWithoutPlaybackThreshold = self->_daysWithoutPlaybackThreshold;
  v5 = daysWithoutPlaybackThreshold;

  return v5;
}

- (NSNumber)daysWithoutOpeningThreshold
{
  NSNumber *v3;
  NSNumber *daysWithoutOpeningThreshold;
  NSNumber *v5;

  +[VUIFeaturesConfiguration defaultsNumberValueForKey:](VUIFeaturesConfiguration, "defaultsNumberValueForKey:", CFSTR("daysWithoutOpeningThreshold"));
  v3 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  daysWithoutOpeningThreshold = v3;
  if (!v3)
    daysWithoutOpeningThreshold = self->_daysWithoutOpeningThreshold;
  v5 = daysWithoutOpeningThreshold;

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dropOnTabIdentifier, 0);
  objc_storeStrong((id *)&self->_daysWithoutPlaybackThreshold, 0);
  objc_storeStrong((id *)&self->_daysWithoutOpeningThreshold, 0);
}

@end
