@implementation NSUserActivity(UISceneActivationConditions)

- (id)targetContentIdentifier
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  unint64_t v9;
  NSObject *v10;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_internalUserActivity");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(a1, "_internalUserActivity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "targetContentIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "_payloadForIdentifier:", CFSTR("com.apple.UIKit.activationConditions.targetContentIdentifierPayload"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v6 = (void *)MEMORY[0x1E0CB3710];
      objc_opt_self();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 0;
      objc_msgSend(v6, "unarchivedObjectOfClass:fromData:error:", v7, v4, &v12);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v12;

      if (v8)
      {
        v9 = targetContentIdentifier___s_category;
        if (!targetContentIdentifier___s_category)
        {
          v9 = __UILogCategoryGetNode("UISceneActivationConditions", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
          atomic_store(v9, (unint64_t *)&targetContentIdentifier___s_category);
        }
        v10 = *(NSObject **)(v9 + 8);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v14 = v8;
          _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "could not decode targetContentIdentifier from NSUserActivity: %@", buf, 0xCu);
        }
      }

    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (void)setTargetContentIdentifier:()UISceneActivationConditions
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;
  unint64_t v10;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "_internalUserActivity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    objc_msgSend(a1, "_internalUserActivity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTargetContentIdentifier:", v4);

  }
  else
  {
    v12 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v12;
    if (v9)
    {
      v10 = setTargetContentIdentifier____s_category;
      if (!setTargetContentIdentifier____s_category)
      {
        v10 = __UILogCategoryGetNode("UISceneActivationConditions", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v10, (unint64_t *)&setTargetContentIdentifier____s_category);
      }
      v11 = *(NSObject **)(v10 + 8);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v9;
        _os_log_impl(&dword_185066000, v11, OS_LOG_TYPE_ERROR, "could not encode targetContentIdentifier to NSUserActivity: %@", buf, 0xCu);
      }
    }
    else
    {
      objc_msgSend(a1, "_setPayload:object:identifier:dirty:", v8, 0, CFSTR("com.apple.UIKit.activationConditions.targetContentIdentifierPayload"), 0);
    }

  }
}

@end
