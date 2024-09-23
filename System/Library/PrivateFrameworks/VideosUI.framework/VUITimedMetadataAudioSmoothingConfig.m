@implementation VUITimedMetadataAudioSmoothingConfig

- (VUITimedMetadataAudioSmoothingConfig)init
{
  VUITimedMetadataAudioSmoothingConfig *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VUITimedMetadataAudioSmoothingConfig;
  result = -[VUITimedMetadataAudioSmoothingConfig init](&v3, sel_init);
  if (result)
    result->_durationToRetainAudioEntity = 60.0;
  return result;
}

- (double)durationToRetainAudioEntity
{
  return self->_durationToRetainAudioEntity;
}

- (void)setDurationToRetainAudioEntity:(double)a3
{
  self->_durationToRetainAudioEntity = a3;
}

@end
