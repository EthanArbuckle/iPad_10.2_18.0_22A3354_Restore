@implementation VIQueryContextLocaleMapper

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
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("com.apple.argos.query_context_key.locale"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_10;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("com.apple.argos.query_context_key.locale"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_8;
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("com.apple.argos.query_context_key.locale"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
LABEL_8:
    _VIQueryContextMapperError((uint64_t)CFSTR("VIQueryContextLocaleKey"), CFSTR("NSString"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (objc_msgSend(v9, "length") == 5 && objc_msgSend(v9, "characterAtIndex:", 2) == 95)
  {
    v10 = (id)objc_msgSend(v5, "setLocale:", v9);

    v7 = 0;
  }
  else
  {
    _VIQueryContextMapperStringValueParseError((uint64_t)CFSTR("VIQueryContextLocaleKey"), v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_10:

  return v7;
}

@end
