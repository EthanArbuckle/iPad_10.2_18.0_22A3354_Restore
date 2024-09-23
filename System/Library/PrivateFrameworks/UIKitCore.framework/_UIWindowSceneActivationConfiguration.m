@implementation _UIWindowSceneActivationConfiguration

- (_UIWindowSceneActivationRequestOptions)options
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIWindowSceneActivationConfiguration;
  -[UIWindowSceneActivationConfiguration options](&v3, sel_options);
  return (_UIWindowSceneActivationRequestOptions *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setOptions:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIWindowSceneActivationConfiguration;
  -[UIWindowSceneActivationConfiguration setOptions:](&v3, sel_setOptions_, a3);
}

@end
