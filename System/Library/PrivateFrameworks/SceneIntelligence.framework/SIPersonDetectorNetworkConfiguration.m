@implementation SIPersonDetectorNetworkConfiguration

- (SIPersonDetectorNetworkConfiguration)init
{
  SIPersonDetectorNetworkConfiguration *v2;
  SIPersonDetectorNetworkConfiguration *v3;
  NSString *algorithmClassName;
  NSString *imageScalerIdentifier;
  SIPersonDetectorNetworkConfiguration *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SIPersonDetectorNetworkConfiguration;
  v2 = -[SINetworkConfiguration init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    algorithmClassName = v2->super._algorithmClassName;
    v2->super._algorithmClassName = (NSString *)CFSTR("SIPersonDetectorAlgorithm");

    imageScalerIdentifier = v3->_imageScalerIdentifier;
    v3->_imageScalerIdentifier = (NSString *)CFSTR("PersonDetector_input");

    -[SIPersonDetectorNetworkConfiguration setModelConfig:](v3, "setModelConfig:", 0);
    -[SIPersonDetectorNetworkConfiguration setNetworkModeEnum:](v3, "setNetworkModeEnum:", 0);
    v6 = v3;
  }

  return v3;
}

- (void)setNetworkModeEnum:(int64_t)a3
{
  NSString *networkMode;

  networkMode = self->super._networkMode;
  self->super._networkMode = (NSString *)&stru_24CA5D420;

  self->_networkModeEnum = a3;
}

- (void)setModelConfig:(int64_t)a3
{
  NSString *networkName;

  networkName = self->super._networkName;
  self->super._networkName = (NSString *)CFSTR("PersonDetector");

  self->_modelConfig = a3;
}

- (int64_t)networkModeEnum
{
  return self->_networkModeEnum;
}

- (int64_t)modelConfig
{
  return self->_modelConfig;
}

- (NSString)imageScalerIdentifier
{
  return self->_imageScalerIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageScalerIdentifier, 0);
}

@end
