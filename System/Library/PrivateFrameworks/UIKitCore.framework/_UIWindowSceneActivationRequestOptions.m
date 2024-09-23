@implementation _UIWindowSceneActivationRequestOptions

- (unint64_t)preferredPresentationStyle
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIWindowSceneActivationRequestOptions;
  return -[UIWindowSceneActivationRequestOptions preferredPresentationStyle](&v3, sel_preferredPresentationStyle);
}

- (void)setPreferredPresentationStyle:(unint64_t)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIWindowSceneActivationRequestOptions;
  -[UIWindowSceneActivationRequestOptions setPreferredPresentationStyle:](&v3, sel_setPreferredPresentationStyle_, a3);
}

@end
