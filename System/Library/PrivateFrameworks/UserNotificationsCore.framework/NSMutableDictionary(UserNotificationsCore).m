@implementation NSMutableDictionary(UserNotificationsCore)

- (void)unc_safeSetNonEmptyArray:()UserNotificationsCore forKey:
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v7, "count"))
    objc_msgSend(a1, "setObject:forKey:", v7, v6);
  else
    objc_msgSend(a1, "removeObjectForKey:", v6);

}

- (void)unc_safeSetNonEmptyDictionary:()UserNotificationsCore forKey:
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v7, "count"))
    objc_msgSend(a1, "setObject:forKey:", v7, v6);
  else
    objc_msgSend(a1, "removeObjectForKey:", v6);

}

- (void)unc_safeSetNonEmptySet:()UserNotificationsCore forKey:
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v7, "count"))
    objc_msgSend(a1, "setObject:forKey:", v7, v6);
  else
    objc_msgSend(a1, "removeObjectForKey:", v6);

}

- (void)unc_safeSetNonEmptyString:()UserNotificationsCore forKey:
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v7, "length"))
    objc_msgSend(a1, "setObject:forKey:", v7, v6);
  else
    objc_msgSend(a1, "removeObjectForKey:", v6);

}

- (void)unc_safeSetNonEmptyString:()UserNotificationsCore withLimit:forKey:
{
  id v8;
  uint64_t v9;
  id v10;
  id v11;

  v11 = a3;
  v8 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v11, "length"))
  {
    if (objc_msgSend(v11, "length") <= a4)
    {
      v10 = v11;
    }
    else
    {
      objc_msgSend(v11, "substringWithRange:", 0, a4);
      v9 = objc_claimAutoreleasedReturnValue();

      v10 = (id)v9;
    }
    v11 = v10;
    objc_msgSend(a1, "setObject:forKey:");
  }
  else
  {
    objc_msgSend(a1, "removeObjectForKey:", v8);
  }

}

- (uint64_t)unc_safeSetObject:()UserNotificationsCore forKey:
{
  if (a3)
    return objc_msgSend(a1, "setObject:forKey:");
  else
    return objc_msgSend(a1, "removeObjectForKey:", a4);
}

@end
