@implementation MRLocalization

- (id)localizedStringWithKey:(id)a3 defaultString:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithPath:](NSBundle, "bundleWithPath:", CFSTR("/System/Library/PrivateFrameworks/CoreRepairKit.framework")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizations"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale preferredLanguages](NSLocale, "preferredLanguages"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle preferredLocalizationsFromArray:forPreferences:](NSBundle, "preferredLocalizationsFromArray:forPreferences:", v8, v9));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", 0));
  v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:localization:", v5, CFSTR("NOTFOUND"), CFSTR("Localizable"), v11));

  if (objc_msgSend(v12, "isEqualToString:", CFSTR("NOTFOUND")))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", 0));
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:localization:", v5, CFSTR("NOTFOUND"), CFSTR("Localizable-IPAD"), v13));

    v12 = (id)v14;
  }
  if (objc_msgSend(v12, "isEqualToString:", CFSTR("NOTFOUND")))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", 0));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:localization:", v5, CFSTR("NOTFOUND"), CFSTR("Localizable-CRYSTAL_FEATURES"), v15));

    if (objc_msgSend(v16, "isEqualToString:", CFSTR("NOTFOUND")))
    {
      v12 = v6;

    }
    else
    {
      v12 = v16;
    }
  }

  return v12;
}

@end
