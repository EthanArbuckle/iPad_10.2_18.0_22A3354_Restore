@implementation NSUserDefaults(TSKRoleAdditions)

- (uint64_t)keyForRole:()TSKRoleAdditions
{
  return objc_msgSend(CFSTR("RoleDefaults"), "stringByAppendingFormat:", CFSTR("-%@"), a3);
}

- (uint64_t)p_currentRole
{
  return objc_msgSend(+[TSKApplicationDelegate sharedDelegate](TSKApplicationDelegate, "sharedDelegate"), "applicationName");
}

- (uint64_t)objectForKey:()TSKRoleAdditions inRole:
{
  return objc_msgSend((id)objc_msgSend(a1, "objectForKey:", objc_msgSend(a1, "keyForRole:", a4)), "objectForKey:", a3);
}

- (uint64_t)setObject:()TSKRoleAdditions forKey:inRole:
{
  id v9;

  objc_sync_enter(a1);
  v9 = (id)objc_msgSend((id)objc_msgSend(a1, "objectForKey:", objc_msgSend(a1, "keyForRole:", a5)), "mutableCopy");
  if (!v9)
    v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v9, "setObject:forKey:", a3, a4);
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"), "setObject:forKey:", v9, objc_msgSend(a1, "keyForRole:", a5));

  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"), "synchronize");
  return objc_sync_exit(a1);
}

- (uint64_t)removeObjectForKey:()TSKRoleAdditions inRole:
{
  void *v7;

  objc_sync_enter(a1);
  v7 = (void *)objc_msgSend((id)objc_msgSend(a1, "objectForKey:", objc_msgSend(a1, "keyForRole:", a4)), "mutableCopy");
  objc_msgSend(v7, "removeObjectForKey:", a3);
  if (v7)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults"), "setObject:forKey:", v7, objc_msgSend(a1, "keyForRole:", a4));

  }
  return objc_sync_exit(a1);
}

- (uint64_t)stringForKey:()TSKRoleAdditions inRole:
{
  uint64_t result;
  uint64_t v2;

  result = objc_msgSend(a1, "objectForKey:inRole:");
  if (result)
  {
    v2 = result;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return v2;
    else
      return 0;
  }
  return result;
}

- (uint64_t)arrayForKey:()TSKRoleAdditions inRole:
{
  uint64_t result;
  uint64_t v2;

  result = objc_msgSend(a1, "objectForKey:inRole:");
  if (result)
  {
    v2 = result;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return v2;
    else
      return 0;
  }
  return result;
}

- (uint64_t)dictionaryForKey:()TSKRoleAdditions inRole:
{
  uint64_t result;
  uint64_t v2;

  result = objc_msgSend(a1, "objectForKey:inRole:");
  if (result)
  {
    v2 = result;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return v2;
    else
      return 0;
  }
  return result;
}

- (uint64_t)dataForKey:()TSKRoleAdditions inRole:
{
  uint64_t result;
  uint64_t v2;

  result = objc_msgSend(a1, "objectForKey:inRole:");
  if (result)
  {
    v2 = result;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return v2;
    else
      return 0;
  }
  return result;
}

- (uint64_t)integerForKey:()TSKRoleAdditions inRole:
{
  uint64_t v1;
  void *v2;

  v1 = objc_msgSend(a1, "objectForKey:inRole:");
  if (v1
    && ((v2 = (void *)v1, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    return objc_msgSend(v2, "integerValue");
  }
  else
  {
    return 0;
  }
}

- (float)floatForKey:()TSKRoleAdditions inRole:
{
  uint64_t v1;
  void *v2;
  float result;

  v1 = objc_msgSend(a1, "objectForKey:inRole:");
  if (!v1)
    return 0.0;
  v2 = (void *)v1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      return 0.0;
  }
  objc_msgSend(v2, "floatValue");
  return result;
}

- (double)doubleForKey:()TSKRoleAdditions inRole:
{
  uint64_t v1;
  void *v2;
  double result;

  v1 = objc_msgSend(a1, "objectForKey:inRole:");
  if (!v1)
    return 0.0;
  v2 = (void *)v1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      return 0.0;
  }
  objc_msgSend(v2, "doubleValue");
  return result;
}

- (uint64_t)BOOLForKey:()TSKRoleAdditions inRole:
{
  uint64_t v1;
  void *v2;
  _BOOL8 v3;
  uint64_t v5;
  uint64_t v6;

  v1 = objc_msgSend(a1, "objectForKey:inRole:");
  if (v1)
  {
    v2 = (void *)v1;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if ((objc_msgSend(v2, "isEqual:", CFSTR("YES")) & 1) != 0)
        return 1;
      v5 = objc_msgSend(v2, "length");
      v3 = 1;
      if (objc_msgSend(v2, "compare:options:range:", CFSTR("YES"), 1, 0, v5))
      {
        v6 = objc_msgSend(v2, "compare:options:range:", CFSTR("Y"), 1, 0, v5);
        v3 = v6 == 0;
        if (v6)
          return objc_msgSend(v2, "integerValue") != 0;
      }
      return v3;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      return objc_msgSend(v2, "BOOLValue");
  }
  return 0;
}

- (uint64_t)setInteger:()TSKRoleAdditions forKey:inRole:
{
  return objc_msgSend(a1, "setObject:forKey:inRole:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:"), a4, a5);
}

- (uint64_t)setFloat:()TSKRoleAdditions forKey:inRole:
{
  return objc_msgSend(a1, "setObject:forKey:inRole:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:"), a3, a4);
}

- (uint64_t)setDouble:()TSKRoleAdditions forKey:inRole:
{
  *(float *)&a2 = a2;
  return objc_msgSend(a1, "setObject:forKey:inRole:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", a2), a4, a5);
}

- (uint64_t)setBool:()TSKRoleAdditions forKey:inRole:
{
  return objc_msgSend(a1, "setObject:forKey:inRole:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:"), a4, a5);
}

- (uint64_t)objectForKeyInCurrentRole:()TSKRoleAdditions
{
  return objc_msgSend(a1, "objectForKey:inRole:", a3, objc_msgSend(a1, "p_currentRole"));
}

- (uint64_t)setObject:()TSKRoleAdditions forKeyInCurrentRole:
{
  return objc_msgSend(a1, "setObject:forKey:inRole:", a3, a4, objc_msgSend(a1, "p_currentRole"));
}

- (uint64_t)removeObjectForKeyInCurrentRole:()TSKRoleAdditions
{
  return objc_msgSend(a1, "removeObjectForKey:inRole:", a3, objc_msgSend(a1, "p_currentRole"));
}

- (uint64_t)stringForKeyInCurrentRole:()TSKRoleAdditions
{
  return objc_msgSend(a1, "stringForKey:inRole:", a3, objc_msgSend(a1, "p_currentRole"));
}

- (uint64_t)arrayForKeyInCurrentRole:()TSKRoleAdditions
{
  return objc_msgSend(a1, "arrayForKey:inRole:", a3, objc_msgSend(a1, "p_currentRole"));
}

- (uint64_t)dictionaryForKeyInCurrentRole:()TSKRoleAdditions
{
  return objc_msgSend(a1, "dictionaryForKey:inRole:", a3, objc_msgSend(a1, "p_currentRole"));
}

- (uint64_t)dataForKeyInCurrentRole:()TSKRoleAdditions
{
  return objc_msgSend(a1, "dataForKey:inRole:", a3, objc_msgSend(a1, "p_currentRole"));
}

- (uint64_t)integerForKeyInCurrentRole:()TSKRoleAdditions
{
  return objc_msgSend(a1, "integerForKey:inRole:", a3, objc_msgSend(a1, "p_currentRole"));
}

- (uint64_t)floatForKeyInCurrentRole:()TSKRoleAdditions
{
  return objc_msgSend(a1, "floatForKey:inRole:", a3, objc_msgSend(a1, "p_currentRole"));
}

- (uint64_t)doubleForKeyInCurrentRole:()TSKRoleAdditions
{
  return objc_msgSend(a1, "doubleForKey:inRole:", a3, objc_msgSend(a1, "p_currentRole"));
}

- (uint64_t)BOOLForKeyInCurrentRole:()TSKRoleAdditions
{
  return objc_msgSend(a1, "BOOLForKey:inRole:", a3, objc_msgSend(a1, "p_currentRole"));
}

- (uint64_t)setInteger:()TSKRoleAdditions forKeyInCurrentRole:
{
  return objc_msgSend(a1, "setInteger:forKey:inRole:", a3, a4, objc_msgSend(a1, "p_currentRole"));
}

- (uint64_t)setFloat:()TSKRoleAdditions forKeyInCurrentRole:
{
  uint64_t v7;
  double v8;

  v7 = objc_msgSend(a1, "p_currentRole");
  *(float *)&v8 = a2;
  return objc_msgSend(a1, "setFloat:forKey:inRole:", a4, v7, v8);
}

- (uint64_t)setDouble:()TSKRoleAdditions forKeyInCurrentRole:
{
  return objc_msgSend(a1, "setDouble:forKey:inRole:", a4, objc_msgSend(a1, "p_currentRole"), a2);
}

- (uint64_t)setBool:()TSKRoleAdditions forKeyInCurrentRole:
{
  return objc_msgSend(a1, "setBool:forKey:inRole:", a3, a4, objc_msgSend(a1, "p_currentRole"));
}

@end
