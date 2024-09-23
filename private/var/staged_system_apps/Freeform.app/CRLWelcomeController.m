@implementation CRLWelcomeController

+ (NSUserDefaults)userDefaults
{
  return +[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults");
}

+ (unsigned)currentVersion
{
  return 65537;
}

+ (unsigned)makeVersionForMajorVersion:(unsigned int)a3 minorVersion:(unsigned int)a4
{
  return (unsigned __int16)a4 | ((unsigned __int16)a3 << 16);
}

+ (id)keyForWelcomeType:(int64_t)a3
{
  if (a3)
    return 0;
  else
    return CFSTR("CRLWelcomeVersion");
}

+ (BOOL)shouldShow:(int64_t)a3 forVersion:(unsigned int)a4
{
  return objc_msgSend(a1, "shouldShow:forVersion:userDefaultsVersion:", a3, *(_QWORD *)&a4, 0);
}

+ (BOOL)didShowForAnyVersion:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "keyForWelcomeType:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "userDefaults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  return v6 != 0;
}

+ (int64_t)firstLaunchActionForVersion:(unsigned int)a3 userDefaultsVersion:(unsigned int *)a4
{
  unsigned int v6;
  int64_t result;
  unsigned int v8;

  v8 = 0;
  v6 = objc_msgSend(a1, "shouldShow:forVersion:userDefaultsVersion:", 0, *(_QWORD *)&a3, &v8);
  result = 0;
  if (v6)
  {
    if (HIWORD(v8) < HIWORD(a3))
      result = 1;
    else
      result = 2;
  }
  if (a4)
    *a4 = v8;
  return result;
}

+ (BOOL)shouldShow:(int64_t)a3 forVersion:(unsigned int)a4 userDefaultsVersion:(unsigned int *)a5
{
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "keyForWelcomeType:", a3));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "userDefaults"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v8));
  v11 = objc_msgSend(v10, "unsignedIntValue");

  if (a5)
    *a5 = v11;

  return v11 < a4;
}

+ (void)updateUserDefaultsVersion:(int64_t)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "keyForWelcomeType:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "userDefaults"));
  objc_msgSend(v4, "setObject:forKey:", &off_1012CC838, v5);

}

+ (void)deleteUserDefaultsVersion:(int64_t)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "keyForWelcomeType:", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "userDefaults"));
  objc_msgSend(v4, "removeObjectForKey:", v5);

}

@end
