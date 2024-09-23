@implementation PRXFlowConfiguration

+ (PRXFlowConfiguration)defaultConfiguration
{
  if (defaultConfiguration_onceToken != -1)
    dispatch_once(&defaultConfiguration_onceToken, &__block_literal_global);
  return (PRXFlowConfiguration *)(id)defaultConfiguration_flowConfiguration;
}

uint64_t __44__PRXFlowConfiguration_defaultConfiguration__block_invoke()
{
  PRXFlowConfiguration *v0;
  void *v1;

  v0 = objc_alloc_init(PRXFlowConfiguration);
  v1 = (void *)defaultConfiguration_flowConfiguration;
  defaultConfiguration_flowConfiguration = (uint64_t)v0;

  return objc_msgSend((id)defaultConfiguration_flowConfiguration, "setSupportsDarkMode:", _os_feature_enabled_impl());
}

- (PRXFlowConfiguration)init
{
  PRXFlowConfiguration *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRXFlowConfiguration;
  result = -[PRXFlowConfiguration init](&v3, sel_init);
  result->_overrideInterfaceStyle = 0;
  return result;
}

- (BOOL)supportsDarkMode
{
  return self->_supportsDarkMode;
}

- (void)setSupportsDarkMode:(BOOL)a3
{
  self->_supportsDarkMode = a3;
}

- (UIColor)customBackgroundColor
{
  return self->_customBackgroundColor;
}

- (void)setCustomBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_customBackgroundColor, a3);
}

- (int64_t)overrideInterfaceStyle
{
  return self->_overrideInterfaceStyle;
}

- (void)setOverrideInterfaceStyle:(int64_t)a3
{
  self->_overrideInterfaceStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customBackgroundColor, 0);
}

@end
