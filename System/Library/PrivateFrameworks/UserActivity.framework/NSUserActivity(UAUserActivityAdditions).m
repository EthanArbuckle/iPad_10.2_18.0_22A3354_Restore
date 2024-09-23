@implementation NSUserActivity(UAUserActivityAdditions)

- (id)_sentToIndexerDate
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_internalUserActivity");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "sentToIndexerDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)_madeInitiallyCurrentDate
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_internalUserActivity");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "madeInitiallyCurrentDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (double)_madeCurrentInterval
{
  void *v1;
  double v2;
  double v3;

  objc_msgSend(a1, "_internalUserActivity");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "madeCurrentInterval");
  v3 = v2;

  return v3;
}

- (id)_madeCurrentDate
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_internalUserActivity");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "madeCurrentDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)_madeCurrentEndDate
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_internalUserActivity");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "madeCurrentEndDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)_originalUniqueIdentifier
{
  void *v2;
  char v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "_internalUserActivity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(a1, "_internalUserActivity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "originalUniqueIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (uint64_t)_finishUserInfoUpdate
{
  void *v2;
  char v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a1, "_internalUserActivity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) == 0)
    return 0;
  objc_msgSend(a1, "_internalUserActivity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "finishUserInfoUpdate");

  return v5;
}

- (uint64_t)_beginUserInfoUpdate:()UAUserActivityAdditions
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  objc_msgSend(a1, "_internalUserActivity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    objc_msgSend(a1, "_internalUserActivity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "beginUserInfoUpdate:", v4);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (uint64_t)_copyWithNewUUID
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a1, "_internalUserActivity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) == 0)
    return 0;
  objc_msgSend(a1, "_internalUserActivity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copyWithNewUUID:", 1);

  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B10]), "initWithInternalUserActivity:", v5);
  return v6;
}

- (uint64_t)_userInfoChangeCount
{
  void *v2;
  char v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a1, "_internalUserActivity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) == 0)
    return 0;
  objc_msgSend(a1, "_internalUserActivity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInfoChangeCount");

  return v5;
}

- (uint64_t)_isUniversalLink
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "_internalUserActivity");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isUniversalLink");

  return v2;
}

- (void)set_universalLink:()UAUserActivityAdditions
{
  id v4;

  objc_msgSend(a1, "_internalUserActivity");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUniversalLink:", a3);

}

+ (uint64_t)_registerAsProxyForApplication:()UAUserActivityAdditions options:completionBlock:
{
  id v7;
  id v8;
  uint64_t v9;

  v7 = a5;
  v8 = a4;
  v9 = objc_msgSend((id)objc_opt_class(), "registerAsProxyForApplication:options:completionBlock:", a3, v8, v7);

  return v9;
}

- (void)_forceSave
{
  void *v2;
  char v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  _QWORD v9[4];
  NSObject *v10;

  objc_msgSend(a1, "_internalUserActivity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInvalidated");

  if ((v3 & 1) == 0 && objc_msgSend(a1, "needsSave"))
  {
    v4 = dispatch_group_create();
    dispatch_group_enter(v4);
    objc_msgSend(a1, "_internalUserActivity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isCurrent");
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __53__NSUserActivity_UAUserActivityAdditions___forceSave__block_invoke;
    v9[3] = &unk_1E6007FA0;
    v7 = v4;
    v10 = v7;
    v8 = objc_msgSend(a1, "doSaveUserActivityWithTimeout:isCurrent:withCompletionHandler:", v6, v9, 1.0e99);

    if (v8)
      dispatch_group_wait(v7, 0xFFFFFFFFFFFFFFFFLL);

  }
}

@end
