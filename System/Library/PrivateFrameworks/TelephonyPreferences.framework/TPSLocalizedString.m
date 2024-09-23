@implementation TPSLocalizedString

+ (NSBundle)classBundle
{
  return (NSBundle *)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
}

+ (NSString)localizationTableName
{
  return (NSString *)CFSTR("TelephonyPreferences");
}

+ (id)localizedStringForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "localizationTableName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "localizedStringFromTable:forKey:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)localizedStringFromTable:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "classBundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", v6, &stru_1EA2CE0A0, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
