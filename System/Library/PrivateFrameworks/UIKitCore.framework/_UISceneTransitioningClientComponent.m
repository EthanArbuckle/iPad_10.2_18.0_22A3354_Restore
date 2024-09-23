@implementation _UISceneTransitioningClientComponent

- (BOOL)allowedAsMorphTransitionSource
{
  void *v2;
  void *v3;
  char v4;

  -[FBSSceneComponent clientScene](self, "clientScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "conformsToProtocol:", &unk_1EE0CE0A8))
    v4 = objc_msgSend(v3, "allowedAsMorphTransitionSource");
  else
    v4 = 0;

  return v4;
}

@end
