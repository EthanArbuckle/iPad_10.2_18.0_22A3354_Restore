@implementation NSBundle

+ (id)_rpFrameworkBundle
{
  if (qword_100095C30 != -1)
    dispatch_once(&qword_100095C30, &stru_100081BB0);
  return (id)qword_100095C28;
}

- (id)_rpLocalizedAppName
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSBundle objectForInfoDictionaryKey:](self, "objectForInfoDictionaryKey:", _kCFBundleDisplayNameKey));
  if (v3
    || (v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSBundle objectForInfoDictionaryKey:](self, "objectForInfoDictionaryKey:", kCFBundleNameKey))) != 0)
  {
    v4 = v3;
    v5 = v4;
  }
  else
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(-[NSBundle objectForInfoDictionaryKey:](self, "objectForInfoDictionaryKey:", kCFBundleExecutableKey));
    v5 = 0;
  }

  return v4;
}

+ (id)_rpLocalizedAppNameFromBundleID:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", v3));
  v5 = objc_msgSend(objc_alloc((Class)LSApplicationRecord), "initWithBundleIdentifier:allowPlaceholder:error:", v3, 0, 0);
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedName"));
    v8 = v7;
    if (v7
      && (objc_msgSend(v7, "isEqualToString:", &stru_100083968) & 1) == 0
      && !objc_msgSend(v8, "isEqualToString:", CFSTR("$(PRODUCT_BUNDLE_IDENTIFIER)")))
    {
      goto LABEL_8;
    }
  }
  else
  {
    v8 = 0;
  }
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_rpLocalizedAppName"));

  v8 = (void *)v9;
  if (!v9)
  {
LABEL_10:
    v10 = v3;

    v8 = v10;
    goto LABEL_11;
  }
LABEL_8:
  if ((objc_msgSend(v8, "isEqualToString:", &stru_100083968) & 1) != 0
    || objc_msgSend(v8, "isEqualToString:", CFSTR("$(PRODUCT_BUNDLE_IDENTIFIER)")))
  {
    goto LABEL_10;
  }
LABEL_11:

  return v8;
}

+ (id)_rpLocalizedStringFromFrameworkBundleWithKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _rpFrameworkBundle](NSBundle, "_rpFrameworkBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "preferredLanguage"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:localization:", v4, 0, CFSTR("Localizable"), v6));

  if (!v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "fallbackLanguage"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:localization:", v4, 0, CFSTR("Localizable"), v8));

    if (!v7)
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v4, 0, CFSTR("Localizable")));
  }

  return v7;
}

+ (id)fallbackLanguage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale preferredLanguages](NSLocale, "preferredLanguages"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "firstObject"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("-")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));

  return v5;
}

+ (id)preferredLanguage
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale preferredLanguages](NSLocale, "preferredLanguages"));
  v4 = objc_msgSend((id)objc_opt_class(a1), "_rpFrameworkBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizations"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle preferredLocalizationsFromArray:forPreferences:](NSBundle, "preferredLocalizationsFromArray:forPreferences:", v6, v3));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
  return v8;
}

+ (id)baseIdentifier:(id)a3
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(".")));
  v4 = objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "removeLastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "componentsJoinedByString:", CFSTR(".")));

  return v5;
}

+ (id)executablePathWithPID:(int)a3
{
  _BYTE buffer[4096];

  return objc_msgSend(objc_alloc((Class)NSString), "initWithBytes:length:encoding:", buffer, proc_pidpath(a3, buffer, 0x1000u), 4);
}

+ (NSBundle)bundleWithPID:(int)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle executablePathWithPID:](NSBundle, "executablePathWithPID:", *(_QWORD *)&a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v3));

  if (!dword_100095B40 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136446722;
    v9 = "+[NSBundle(RPExtensions) bundleWithPID:]";
    v10 = 1024;
    v11 = 115;
    v12 = 2112;
    v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d  executableURL:%@", (uint8_t *)&v8, 0x1Cu);
  }
  if (v4)
  {
    v5 = (void *)_CFBundleCopyBundleURLForExecutableURL(v4);
    if (!dword_100095B40 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136446722;
      v9 = "+[NSBundle(RPExtensions) bundleWithPID:]";
      v10 = 1024;
      v11 = 119;
      v12 = 2112;
      v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d  bundleURL:%@", (uint8_t *)&v8, 0x1Cu);
    }
    if (v5)
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithURL:](NSBundle, "bundleWithURL:", v5));
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return (NSBundle *)v6;
}

@end
