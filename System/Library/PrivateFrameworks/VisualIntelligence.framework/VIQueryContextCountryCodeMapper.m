@implementation VIQueryContextCountryCodeMapper

- (id)updateBuilder:(id)a3 withDictionary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("com.apple.argos.query_context_key.country_code"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("com.apple.argos.query_context_key.country_code"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("com.apple.argos.query_context_key.country_code"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        if (objc_msgSend(v9, "length") == 2)
        {
          v10 = (id)objc_msgSend(v5, "setCountryCode:", v9);

          v7 = 0;
        }
        else
        {
          _VIQueryContextMapperStringValueParseError((uint64_t)CFSTR("VIQueryContextCountryCodeKey"), v9);
          v7 = (void *)objc_claimAutoreleasedReturnValue();

        }
        goto LABEL_8;
      }
    }
    else
    {

    }
    _VIQueryContextMapperError((uint64_t)CFSTR("VIQueryContextCountryCodeKey"), CFSTR("NSString"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_8:

  return v7;
}

@end
