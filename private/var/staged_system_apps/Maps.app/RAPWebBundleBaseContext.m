@implementation RAPWebBundleBaseContext

- (RAPWebBundleBaseContext)initWithType:(id)a3 locales:(id)a4
{
  id v7;
  id v8;
  RAPWebBundleBaseContext *v9;
  RAPWebBundleBaseContext *v10;
  void *v11;
  uint64_t v12;
  NSString *email;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)RAPWebBundleBaseContext;
  v9 = -[RAPWebBundleBaseContext init](&v15, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_type, a3);
    -[RAPWebBundleBaseContext _setLocaleWithLocales:](v10, "_setLocaleWithLocales:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UserInformationManager sharedInstance](UserInformationManager, "sharedInstance"));
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "userEmail"));
    email = v10->_email;
    v10->_email = (NSString *)v12;

  }
  return v10;
}

- (NSDictionary)context
{
  id v3;
  void *v4;
  NSString *locale;
  NSString *type;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSNumber *v12;
  void *v13;
  void *v14;
  uint64_t String;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v24;

  v3 = objc_alloc_init((Class)NSMutableDictionary);
  v4 = v3;
  locale = self->_locale;
  if (locale)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", locale, CFSTR("locale"));
  type = self->_type;
  if (type)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", type, CFSTR("type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[GEOCountryConfiguration sharedConfiguration](GEOCountryConfiguration, "sharedConfiguration"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "countryCode"));

  if (v8)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("countryCode"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale autoupdatingCurrentLocale](NSLocale, "autoupdatingCurrentLocale"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter dateFormatFromTemplate:options:locale:](NSDateFormatter, "dateFormatFromTemplate:options:locale:", CFSTR("j"), 0, v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v10, "rangeOfString:", CFSTR("a")) != (id)0x7FFFFFFFFFFFFFFFLL));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("useHour12"));

  v12 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", UIAccessibilityIsOnOffSwitchLabelsEnabled());
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v13, CFSTR("useAccessibilityLabels"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseContext _currentUserInterfaceIdiomString](self, "_currentUserInterfaceIdiomString"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("uiIdiom"));

  objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_email, CFSTR("email"));
  String = GEOConfigGetString(MapsConfig_RapAbBranchId, off_1014B4C28);
  v16 = (void *)objc_claimAutoreleasedReturnValue(String);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v16, CFSTR("abBranchId"));

  v17 = GEOConfigGetString(MapsConfig_RapAbManifestVersion, off_1014B4C18);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v18, CFSTR("abManifestVersion"));

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[RAPWebBundleDownloadManager sharedInstance](RAPWebBundleDownloadManager, "sharedInstance"));
  v24 = 0;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "loadWebBundleManifestWithError:", &v24));

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "version"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v21, CFSTR("version"));

  v22 = objc_msgSend(v4, "copy");
  return (NSDictionary *)v22;
}

- (id)description
{
  objc_class *v3;
  NSString *v4;
  void *v5;
  NSString *type;
  void *v7;
  void *v8;

  v3 = (objc_class *)objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  type = self->_type;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPWebBundleBaseContext context](self, "context"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@:%p type:%@, context: %@>"), v5, self, type, v7));

  return v8;
}

- (void)_setLocaleWithLocales:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSString *v10;
  NSString *locale;
  id v12;
  NSObject *v13;
  NSString *v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  NSString *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  void *v23;

  v4 = a3;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1008B731C;
  v15[3] = &unk_1011DA738;
  v5 = objc_alloc_init((Class)NSMutableArray);
  v16 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v15);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale autoupdatingCurrentLocale](NSLocale, "autoupdatingCurrentLocale"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "collatorIdentifier"));

  v23 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle preferredLocalizationsFromArray:forPreferences:](NSBundle, "preferredLocalizationsFromArray:forPreferences:", v5, v8));
  v10 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));
  locale = self->_locale;
  self->_locale = v10;

  v12 = sub_10043292C();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = self->_locale;
    *(_DWORD *)buf = 138412802;
    v18 = v14;
    v19 = 2112;
    v20 = v7;
    v21 = 2112;
    v22 = v5;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "selectedLocale: %@, preferredLocale: %@, verifiedLocales: %@", buf, 0x20u);
  }

}

- (id)_currentUserInterfaceIdiomString
{
  void *v2;
  unint64_t v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v3 = (unint64_t)objc_msgSend(v2, "userInterfaceIdiom");

  if (v3 > 6)
    return CFSTR("unspecified");
  else
    return off_1011DA758[v3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_email, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_type, 0);
}

@end
