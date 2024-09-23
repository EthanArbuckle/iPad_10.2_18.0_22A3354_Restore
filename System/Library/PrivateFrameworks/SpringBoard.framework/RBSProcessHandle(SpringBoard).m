@implementation RBSProcessHandle(SpringBoard)

- (uint64_t)sb_canDrawWhileLocked
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v8;

  objc_msgSend(a1, "bundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E0D016E0];
    objc_msgSend(a1, "auditToken");
    objc_msgSend(v3, "tokenFromAuditToken:", &v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hasEntitlement:", CFSTR("com.apple.QuartzCore.secure-mode"));
    v6 = v5 & objc_msgSend(a1, "sb_showsViewsWhileLockedForBundle:", v2);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (uint64_t)sb_showsViewsWhileLockedForBundle:()SpringBoard
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;

  v4 = a3;
  objc_getAssociatedObject(a1, "com.apple.SpringBoardFramework.RBSProcess.showsViewsWhileLocked");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(v4, "bundleInfoValueForKey:", CFSTR("UIApplicationShowsViewsWhileLocked"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_opt_class();
    v8 = v6;
    if (v7)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = v8;
      else
        v9 = 0;
    }
    else
    {
      v9 = 0;
    }
    v5 = v9;

    if (!v5)
    {
      v10 = 0;
      goto LABEL_10;
    }
    objc_setAssociatedObject(a1, "com.apple.SpringBoardFramework.RBSProcess.showsViewsWhileLocked", v5, (void *)1);
  }
  v10 = objc_msgSend(v5, "BOOLValue");

LABEL_10:
  return v10;
}

@end
