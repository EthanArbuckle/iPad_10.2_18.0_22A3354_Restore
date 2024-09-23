@implementation JSALocale

+ (id)getLanguage:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "displayNameForKey:value:", NSLocaleLanguageCode, v3));

  return v5;
}

@end
