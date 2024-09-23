@implementation LSApplicationRecord

- (BOOL)stu_isUserFacing
{
  _BOOL4 v3;

  v3 = -[LSApplicationRecord stu_isKnownApplicationType](self, "stu_isKnownApplicationType");
  if (v3)
    LOBYTE(v3) = !-[LSApplicationRecord stu_isHidden](self, "stu_isHidden");
  return v3;
}

- (id)stu_applicationType
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LSApplicationRecord bundleIdentifier](self, "bundleIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationProxy applicationProxyForIdentifier:placeholder:](LSApplicationProxy, "applicationProxyForIdentifier:placeholder:", v2, 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "applicationType"));

  return v4;
}

- (BOOL)stu_isKnownApplicationType
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LSApplicationRecord stu_applicationType](self, "stu_applicationType"));
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("System")) & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("User"));

  return v3;
}

- (BOOL)stu_isHidden
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LSApplicationRecord appTags](self, "appTags"));
  v3 = objc_msgSend(v2, "containsObject:", CFSTR("hidden"));

  return v3;
}

@end
