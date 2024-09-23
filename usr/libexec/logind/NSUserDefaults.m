@implementation NSUserDefaults

+ (void)globalDefaultsUpdateValue:(id)a3 forKey:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "persistentDomainForName:", NSGlobalDomain));
  v11 = objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v11, "setObject:forKeyedSubscript:", v6, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v9, "setPersistentDomain:forName:", v11, NSGlobalDomain);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v10, "synchronize");

}

@end
