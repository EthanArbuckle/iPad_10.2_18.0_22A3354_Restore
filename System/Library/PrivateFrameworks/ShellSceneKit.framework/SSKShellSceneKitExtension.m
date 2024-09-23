@implementation SSKShellSceneKitExtension

+ (id)settingsExtensions
{
  return (id)MEMORY[0x24BDBD1A8];
}

+ (id)clientSettingsExtensions
{
  return (id)MEMORY[0x24BDBD1A8];
}

+ (id)transitionContextExtensions
{
  return 0;
}

+ (id)hostComponents
{
  return (id)MEMORY[0x24BDBD1A8];
}

+ (id)clientComponents
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
