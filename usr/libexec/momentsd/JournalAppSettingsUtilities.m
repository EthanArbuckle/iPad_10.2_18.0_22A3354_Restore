@implementation JournalAppSettingsUtilities

+ (id)settingsBundle
{
  return +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(a1, a2));
}

+ (id)settingsDefaults
{
  return objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("group.com.apple.Journal"));
}

+ (BOOL)BOOLForKey:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "objectForKey:", a3));
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

+ (void)setBool:(BOOL)a3 forKey:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v4));
  objc_msgSend(a1, "setObject:forKey:", v7, v6);

}

+ (id)objectForKey:(id)a3
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  v4 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("group.com.apple.Journal"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", v3));

  return v5;
}

+ (void)setObject:(id)a3 forKey:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("group.com.apple.Journal"));
  objc_msgSend(v7, "setObject:forKey:", v6, v5);

}

@end
