@implementation UIStoryboardScene

- (void)setSceneViewController:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (id)sceneViewController
{
  return self->sceneViewController;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIStoryboardScene;
  -[UIStoryboardScene dealloc](&v3, sel_dealloc);
}

@end
