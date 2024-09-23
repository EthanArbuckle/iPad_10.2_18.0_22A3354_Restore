@implementation USEntitlements

+ (id)readCurrentServices
{
  return (id)objc_msgSend(a1, "_setValueForEntitlement:expectedElementClass:", CFSTR("com.apple.usersafety.service"), objc_opt_class());
}

+ (id)_setValueForEntitlement:(__CFString *)a3 expectedElementClass:(Class)a4
{
  SecTaskRef v6;
  SecTaskRef v7;
  void *v8;
  void *v9;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = SecTaskCreateFromSelf(0);
  if (!v6)
    return 0;
  v7 = v6;
  objc_msgSend(a1, "_valueForEntitlement:secTask:", a3, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v12 = v8;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v20;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v20 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v16);
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v11, "addObject:", v17, (_QWORD)v19);
          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v14);
    }

    v18 = objc_msgSend(v11, "copy");
    v9 = (void *)v18;
  }
  CFRelease(v7);

  return v9;
}

+ (id)_valueForEntitlement:(__CFString *)a3 secTask:(__SecTask *)a4
{
  return (id)(id)SecTaskCopyValueForEntitlement(a4, a3, 0);
}

+ (id)readCurrentBundleIdentifier
{
  return (id)objc_msgSend(a1, "_valueForEntitlement:expectedClass:", CFSTR("application-identifier"), objc_opt_class());
}

+ (id)_valueForEntitlement:(__CFString *)a3 expectedClass:(Class)a4
{
  SecTaskRef v6;
  SecTaskRef v7;
  void *v8;
  id v9;

  v6 = SecTaskCreateFromSelf(0);
  if (v6)
  {
    v7 = v6;
    objc_msgSend(a1, "_valueForEntitlement:secTask:", a3, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;
    CFRelease(v7);

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

@end
