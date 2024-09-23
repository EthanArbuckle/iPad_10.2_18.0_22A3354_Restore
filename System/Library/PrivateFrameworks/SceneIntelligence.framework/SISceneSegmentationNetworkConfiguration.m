@implementation SISceneSegmentationNetworkConfiguration

- (SISceneSegmentationNetworkConfiguration)init
{
  SISceneSegmentationNetworkConfiguration *v2;
  SISceneSegmentationNetworkConfiguration *v3;
  NSString *algorithmClassName;
  NSString *networkName;
  NSString *defaultVisualLoggerName;
  SISceneSegmentationNetworkConfiguration *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SISceneSegmentationNetworkConfiguration;
  v2 = -[SINetworkConfiguration init](&v9, sel_init);
  v3 = v2;
  if (v2)
  {
    algorithmClassName = v2->super._algorithmClassName;
    v2->super._algorithmClassName = (NSString *)CFSTR("SISceneSegmentationAlgorithm");

    networkName = v3->super._networkName;
    v3->super._networkName = (NSString *)CFSTR("SceneSegmentationV9G");

    defaultVisualLoggerName = v3->super._defaultVisualLoggerName;
    v3->super._defaultVisualLoggerName = (NSString *)CFSTR("sceneSegmentation");

    -[SISceneSegmentationNetworkConfiguration setModelConfig:](v3, "setModelConfig:", 0);
    -[SISceneSegmentationNetworkConfiguration setNetworkModeEnum:](v3, "setNetworkModeEnum:", 0);
    v7 = v3;
  }

  return v3;
}

- (void)setNetworkModeEnum:(int64_t)a3
{
  NSString *networkMode;
  __CFString *v6;

  if (a3 == 1)
  {
    networkMode = self->super._networkMode;
    v6 = CFSTR("res256x192_rgb_landscape");
  }
  else
  {
    networkMode = self->super._networkMode;
    if (a3 == 2)
      v6 = CFSTR("res192x256_rgb_portrait");
    else
      v6 = &stru_24CA5D420;
  }
  self->super._networkMode = &v6->isa;

  self->_modelConfig = a3;
}

- (void)setModelConfig:(int64_t)a3
{
  self[1].super.super.isa = (Class)a3;
}

- (int64_t)networkModeEnum
{
  return self->_modelConfig;
}

- (int64_t)modelConfig
{
  return (int64_t)self[1].super.super.isa;
}

- (BOOL)isResampleOutput
{
  return LOBYTE(self->_uncertaintyThreshold);
}

- (void)setIsResampleOutput:(BOOL)a3
{
  LOBYTE(self->_uncertaintyThreshold) = a3;
}

- (float)uncertaintyThreshold
{
  return *(float *)&self->_networkModeEnum;
}

- (void)setUncertaintyThreshold:(float)a3
{
  *(float *)&self->_networkModeEnum = a3;
}

@end
