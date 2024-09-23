@implementation SBSUIAXUIServerSceneRequestBuilder

- (id)_specification
{
  return (id)objc_opt_new();
}

- (void)_customizeWorkspaceRequestOptions:(id)a3 usingRequest:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBSUIAXUIServerSceneRequestBuilder;
  -[_UIApplicationSceneRequestBuilder _customizeWorkspaceRequestOptions:usingRequest:](&v4, sel__customizeWorkspaceRequestOptions_usingRequest_, a3, a4);
}

@end
