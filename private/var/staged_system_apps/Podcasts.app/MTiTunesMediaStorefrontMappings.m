@implementation MTiTunesMediaStorefrontMappings

+ (id)storefrontIdentifierFromCountryCode:(id)a3
{
  id v3;
  _UNKNOWN **v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = sub_100081F9C();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uppercaseString"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v6));
  return v7;
}

+ (BOOL)isValidStorefrontCountryCode:(id)a3
{
  id v3;
  _UNKNOWN **v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = sub_100081F9C();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uppercaseString"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v6));
  LOBYTE(v3) = v7 != 0;

  return (char)v3;
}

+ (id)defaultStorefrontCountryCode
{
  return CFSTR("US");
}

@end
