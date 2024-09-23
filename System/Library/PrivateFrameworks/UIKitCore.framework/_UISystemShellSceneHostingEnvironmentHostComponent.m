@implementation _UISystemShellSceneHostingEnvironmentHostComponent

- (void)setScene:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UISystemShellSceneHostingEnvironmentHostComponent;
  -[FBSSceneComponent setScene:](&v4, sel_setScene_, a3);
  -[_UISystemShellSceneHostingEnvironmentHostComponent setSystemShellHostingSpaceIdentifier:](self, "setSystemShellHostingSpaceIdentifier:", 0);
}

- (void)setSystemShellHostingSpaceIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[FBSSceneComponent hostScene](self, "hostScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __91___UISystemShellSceneHostingEnvironmentHostComponent_setSystemShellHostingSpaceIdentifier___block_invoke;
  v7[3] = &unk_1E16E05B8;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "updateSettings:", v7);

}

- (NSString)systemShellHostingSpaceIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[FBSSceneComponent hostScene](self, "hostScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemShellHostingSpaceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

@end
