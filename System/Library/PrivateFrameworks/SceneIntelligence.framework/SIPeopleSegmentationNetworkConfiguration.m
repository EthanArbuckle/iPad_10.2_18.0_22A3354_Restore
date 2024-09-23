@implementation SIPeopleSegmentationNetworkConfiguration

- (SIPeopleSegmentationNetworkConfiguration)init
{
  SIPeopleSegmentationNetworkConfiguration *v2;
  SIPeopleSegmentationNetworkConfiguration *v3;
  NSString *algorithmClassName;
  NSString *imageScalerIdentifier;
  SIPeopleSegmentationNetworkConfiguration *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SIPeopleSegmentationNetworkConfiguration;
  v2 = -[SINetworkConfiguration init](&v8, sel_init);
  v3 = v2;
  if (v2)
  {
    algorithmClassName = v2->super._algorithmClassName;
    v2->super._algorithmClassName = (NSString *)CFSTR("SIPeopleSegmentationAlgorithm");

    *(&v3->_inputImageFormat + 1) = 1111970369;
    imageScalerIdentifier = v3->_imageScalerIdentifier;
    v3->_imageScalerIdentifier = (NSString *)CFSTR("PersonSegmentation_input");

    -[SIPeopleSegmentationNetworkConfiguration setModelConfig:](v3, "setModelConfig:", 0);
    -[SIPeopleSegmentationNetworkConfiguration setNetworkModeEnum:](v3, "setNetworkModeEnum:", 2);
    v6 = v3;
  }

  return v3;
}

- (void)setNetworkModeEnum:(int64_t)a3
{
  NSString *networkMode;
  __CFString *v6;

  networkMode = self->super._networkMode;
  if (a3 == 1)
    v6 = CFSTR("portrait");
  else
    v6 = CFSTR("landscape");
  self->super._networkMode = &v6->isa;

  self->_networkModeEnum = a3;
}

- (void)setModelConfig:(int64_t)a3
{
  NSString *networkName;

  networkName = self->super._networkName;
  self->super._networkName = (NSString *)CFSTR("PersonSegmentation");

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

- (unsigned)inputImageFormat
{
  return *(&self->_inputImageFormat + 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageScalerIdentifier, 0);
}

@end
