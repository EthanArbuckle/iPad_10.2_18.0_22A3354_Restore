@implementation UVPreviewSceneSpecification

- (Class)settingsClass
{
  return (Class)objc_opt_class();
}

- (id)newTransitionContextOfAppropriateClass
{
  return objc_alloc_init(-[UIApplicationSceneSpecification transitionContextClass](self, "transitionContextClass"));
}

@end
