@implementation APSMessage(UserNotificationsCore)

- (id)unc_bundleIdentifier
{
  void *v1;
  id v2;
  void *v3;

  objc_msgSend(a1, "topic");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "hasPrefix:", CFSTR("com.apple.icloud-container.")) & 1) != 0)
  {
    objc_msgSend(v1, "substringFromIndex:", objc_msgSend(CFSTR("com.apple.icloud-container."), "length"));
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = v1;
  }
  v3 = v2;

  return v3;
}

@end
