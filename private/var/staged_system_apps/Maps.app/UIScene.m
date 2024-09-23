@implementation UIScene

- (BOOL)isCarScene
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIScene session](self, "session"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "role"));
  v4 = objc_msgSend(v3, "isEqualToString:", _UIWindowSceneSessionRoleCarPlay);

  return v4;
}

@end
