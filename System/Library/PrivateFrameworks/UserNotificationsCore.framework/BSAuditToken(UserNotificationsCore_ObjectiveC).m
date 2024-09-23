@implementation BSAuditToken(UserNotificationsCore_ObjectiveC)

- (uint64_t)unc_isInternalUserNotificationsTool
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(a1, "unc_applicationIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.usernotifications.untool")) & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    objc_msgSend(a1, "unc_applicationIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.internal.suiuntool"));

  }
  return v3;
}

- (uint64_t)unc_applicationIdentifier
{
  return objc_msgSend(a1, "valueForEntitlement:", CFSTR("application-identifier"));
}

@end
