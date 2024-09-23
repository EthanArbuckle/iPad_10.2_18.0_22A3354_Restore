@implementation NCNotificationRequest(NCUIAdditions)

+ (id)requesterIdentifier
{
  if (requesterIdentifier_onceToken_0 != -1)
    dispatch_once(&requesterIdentifier_onceToken_0, &__block_literal_global_35);
  return (id)requesterIdentifier___requesterIdentifier_0;
}

- (BOOL)hasAttachments
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  objc_msgSend(a1, "userNotification");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "request");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "content");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attachments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") != 0;

  return v5;
}

- (BOOL)hasOnlySingleTextInputAction
{
  void *v1;
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "defaultEnvironmentActions");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "count") == 1)
  {
    objc_msgSend(v1, "firstObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "behavior") == 1;

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)hasOnlySingleMinimalTextInputAction
{
  void *v1;
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a1, "minimalEnvironmentActions");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "count") == 1)
  {
    objc_msgSend(v1, "firstObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "behavior") == 1;

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (uint64_t)showsTextInputOnAppearance
{
  uint64_t result;

  result = objc_msgSend(a1, "hasOnlySingleTextInputAction");
  if ((_DWORD)result)
    return objc_msgSend(a1, "hasAttachments") ^ 1;
  return result;
}

- (id)defaultEnvironmentActions
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "supplementaryActions");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", *MEMORY[0x1E0DC5F58]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)minimalEnvironmentActions
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "supplementaryActions");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", *MEMORY[0x1E0DC5F60]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
