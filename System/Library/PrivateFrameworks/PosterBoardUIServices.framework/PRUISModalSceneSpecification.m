@implementation PRUISModalSceneSpecification

- (Class)settingsClass
{
  return (Class)objc_opt_class();
}

- (id)uiSceneSessionRole
{
  return CFSTR("com.apple.PosterBoard.modal");
}

@end
