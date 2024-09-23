@implementation _UISceneTransitioningHostComponent

- (void)setScene:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UISceneTransitioningHostComponent;
  -[FBSSceneComponent setScene:](&v5, sel_setScene_, a3);
  -[FBSSceneComponent hostScene](self, "hostScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateSettings:", &__block_literal_global_124);

}

@end
