@implementation PLXPCCoder

+ (id)userInfoForCoder:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v7;
  void *v8;
  void *v9;

  v3 = a3;
  if (v3)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable _PLAssertRespondsToSelector(id  _Nullable __strong, SEL _Nonnull)");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(sel_userInfo);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("PLHelperExtension.h"), 89, CFSTR("Object does not respond to selector %@: %@"), v9, v3);

    }
    v4 = v3;
  }

  objc_msgSend(v3, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
