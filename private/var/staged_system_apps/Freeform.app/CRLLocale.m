@implementation CRLLocale

+ (CRLLocale)preferredLocale
{
  return +[CRLLocale currentLocale](CRLLocale, "currentLocale");
}

+ (CRLLocale)currentLocale
{
  return objc_alloc_init(CRLLocale);
}

- (CRLLocale)init
{
  CRLLocale *v2;
  uint64_t v3;
  NSLocale *locale;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLLocale;
  v2 = -[CRLLocale init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSLocale currentLocale](NSLocale, "currentLocale"));
    locale = v2->_locale;
    v2->_locale = (NSLocale *)v3;

  }
  return v2;
}

- (id)regionCode
{
  return -[NSLocale regionCode](self->_locale, "regionCode");
}

- (id)languageCode
{
  return -[NSLocale languageCode](self->_locale, "languageCode");
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;

  if (self == a3)
    return 1;
  v4 = a3;
  objc_opt_class(CRLLocale, v5);
  v7 = sub_100221D0C(v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLLocale locale](self, "locale"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "locale"));
    v11 = objc_msgSend(v9, "isEqual:", v10);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)p_setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
}

- (NSLocale)locale
{
  return (NSLocale *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
}

@end
