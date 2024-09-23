@implementation NSError(ISAdditions)

- (uint64_t)errorBySettingFatalError:()ISAdditions
{
  __ISRecordSPIClassUsage(a1);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  return SSErrorBySettingUserInfoValue();
}

- (uint64_t)isEqual:()ISAdditions compareUserInfo:
{
  uint64_t v7;
  _BOOL4 v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  __ISRecordSPIClassUsage(a1);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = objc_msgSend(a1, "code");
    v8 = v7 == objc_msgSend(a3, "code");
  }
  else
  {
    v8 = 0;
  }
  v9 = (void *)objc_msgSend(a1, "domain");
  v10 = objc_msgSend(a1, "domain");
  if (!v8)
    return 0;
  if (v9 == (void *)v10)
  {
    v11 = 1;
  }
  else
  {
    v11 = objc_msgSend(v9, "isEqualToString:", v10);
    if (!(_DWORD)v11)
      return v11;
  }
  if (a4)
  {
    v12 = (void *)objc_msgSend(a1, "userInfo");
    v13 = (void *)objc_msgSend(a3, "userInfo");
    v14 = objc_msgSend(v12, "count");
    if (v14 == objc_msgSend(v13, "count"))
    {
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v15 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (!v15)
        return 1;
      v16 = v15;
      v17 = *(_QWORD *)v24;
      LOBYTE(v11) = 1;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v24 != v17)
            objc_enumerationMutation(v12);
          v19 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
          v20 = (void *)objc_msgSend(v12, "objectForKey:", v19);
          v21 = objc_msgSend(v13, "objectForKey:", v19);
          if ((v11 & 1) != 0)
          {
            if (v20 == (void *)v21)
              v11 = 1;
            else
              v11 = objc_msgSend(v20, "isEqual:", v21);
          }
          else
          {
            v11 = 0;
          }
        }
        v16 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      }
      while (v16);
      return v11;
    }
    return 0;
  }
  return v11;
}

- (uint64_t)isFatalError
{
  __ISRecordSPIClassUsage(a1);
  return objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "userInfo"), "objectForKey:", CFSTR("ISFatalError")), "BOOLValue");
}

@end
