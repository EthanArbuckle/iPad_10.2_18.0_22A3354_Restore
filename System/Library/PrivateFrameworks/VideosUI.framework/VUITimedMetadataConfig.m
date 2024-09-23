@implementation VUITimedMetadataConfig

- (VUITimedMetadataConfig)init
{
  VUITimedMetadataConfig *v2;
  uint64_t v3;
  VUITimedMetadataVisualSmoothingConfig *visualSmoothingConfig;
  uint64_t v5;
  VUITimedMetadataAudioSmoothingConfig *audioSmoothingConfig;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VUITimedMetadataConfig;
  v2 = -[VUITimedMetadataConfig init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    visualSmoothingConfig = v2->_visualSmoothingConfig;
    v2->_visualSmoothingConfig = (VUITimedMetadataVisualSmoothingConfig *)v3;

    v5 = objc_opt_new();
    audioSmoothingConfig = v2->_audioSmoothingConfig;
    v2->_audioSmoothingConfig = (VUITimedMetadataAudioSmoothingConfig *)v5;

  }
  return v2;
}

- (VUITimedMetadataVisualSmoothingConfig)visualSmoothingConfig
{
  return self->_visualSmoothingConfig;
}

- (void)setVisualSmoothingConfig:(id)a3
{
  objc_storeStrong((id *)&self->_visualSmoothingConfig, a3);
}

- (VUITimedMetadataAudioSmoothingConfig)audioSmoothingConfig
{
  return self->_audioSmoothingConfig;
}

- (void)setAudioSmoothingConfig:(id)a3
{
  objc_storeStrong((id *)&self->_audioSmoothingConfig, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioSmoothingConfig, 0);
  objc_storeStrong((id *)&self->_visualSmoothingConfig, 0);
}

@end
