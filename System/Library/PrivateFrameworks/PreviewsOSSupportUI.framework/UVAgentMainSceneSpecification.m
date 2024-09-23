@implementation UVAgentMainSceneSpecification

- (BOOL)previewAgentDisplaysUI
{
  return 0;
}

- (BOOL)allowsConfigurationByAppDelegate
{
  return 1;
}

- (id)uiSceneSessionRole
{
  return (id)*MEMORY[0x24BEBEA00];
}

@end
