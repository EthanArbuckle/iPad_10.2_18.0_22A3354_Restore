@implementation _UISystemShellSceneHostingEnvironmentClientComponent

- (NSString)systemShellHostingSpaceIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  -[FBSSceneComponent clientScene](self, "clientScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "systemShellHostingSpaceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

@end
