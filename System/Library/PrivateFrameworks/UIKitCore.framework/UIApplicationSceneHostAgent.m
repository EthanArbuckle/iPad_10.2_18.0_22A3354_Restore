@implementation UIApplicationSceneHostAgent

- (UIApplicationSceneHostAgent)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIApplicationSceneHostAgent;
  return -[UIApplicationSceneHostAgent init](&v3, sel_init);
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)UIApplicationSceneHostAgent;
  -[UIApplicationSceneHostAgent dealloc](&v2, sel_dealloc);
}

@end
