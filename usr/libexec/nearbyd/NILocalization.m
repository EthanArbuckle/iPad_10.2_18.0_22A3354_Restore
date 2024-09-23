@implementation NILocalization

+ (id)_niFrameworkBundle
{
  if (qword_100859160 != -1)
    dispatch_once(&qword_100859160, &stru_10080F3D0);
  return (id)qword_100859158;
}

+ (id)_niLocalizedStringFromFrameworkBundleWithKey:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;

  v4 = a3;
  v6 = objc_msgSend((id)objc_opt_class(a1, v5), "localizedBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", v4, 0, 0));

  if (!v8)
  {
    v10 = objc_msgSend((id)objc_opt_class(a1, v9), "fallbackBundle");
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", v4, 0, 0));

    if (!v8)
    {
      v13 = objc_msgSend((id)objc_opt_class(a1, v12), "_niFrameworkBundle");
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", v4, 0, 0));

    }
  }

  return v8;
}

+ (id)fallbackBundle
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_opt_class(a1, a2);
  v5 = objc_msgSend((id)objc_opt_class(a1, v4), "_niFrameworkBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "fallbackBundleWithBundle:", v6));

  return v7;
}

+ (id)localizedBundle
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_opt_class(a1, a2);
  v5 = objc_msgSend((id)objc_opt_class(a1, v4), "_niFrameworkBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedBundleWithBundle:", v6));

  return v7;
}

+ (id)_niLocalizedStringFromBundle:(id)a3 withKey:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  v9 = objc_msgSend((id)objc_opt_class(a1, v8), "localizedBundleWithBundle:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", v7, 0, 0));

  if (!v11)
  {
    v13 = objc_msgSend((id)objc_opt_class(a1, v12), "fallbackBundleWithBundle:", v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", v7, 0, 0));

    if (!v11)
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v7, 0, 0));
  }

  return v11;
}

+ (id)fallbackBundleWithBundle:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale preferredLanguages](NSLocale, "preferredLanguages"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("-")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "pathForResource:ofType:inDirectory:forLocalization:", CFSTR("Localizable"), CFSTR("strings"), 0, v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByDeletingLastPathComponent"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", v9));

  return v10;
}

+ (id)localizedBundleWithBundle:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale preferredLanguages](NSLocale, "preferredLanguages"));
  v7 = objc_msgSend((id)objc_opt_class(a1, v6), "_niFrameworkBundle");
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizations"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle preferredLocalizationsFromArray:forPreferences:](NSBundle, "preferredLocalizationsFromArray:forPreferences:", v9, v5));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "resourcePath"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.lproj"), v12));

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByAppendingPathComponent:", v13));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", v14));

  return v15;
}

@end
