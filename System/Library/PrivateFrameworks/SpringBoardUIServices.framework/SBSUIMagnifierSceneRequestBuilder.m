@implementation SBSUIMagnifierSceneRequestBuilder

- (id)_specification
{
  return (id)objc_opt_new();
}

- (void)_customizeWorkspaceRequestOptions:(id)a3 usingRequest:(id)a4
{
  id v5;
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBSUIMagnifierSceneRequestBuilder;
  v5 = a3;
  -[_UIApplicationSceneRequestBuilder _customizeWorkspaceRequestOptions:usingRequest:](&v7, sel__customizeWorkspaceRequestOptions_usingRequest_, v5, a4);
  v6 = objc_alloc_init(MEMORY[0x1E0CEA788]);
  objc_msgSend(v6, "setBackgroundStyle:", 3, v7.receiver, v7.super_class);
  objc_msgSend(v5, "setInitialClientSettings:", v6);

}

@end
