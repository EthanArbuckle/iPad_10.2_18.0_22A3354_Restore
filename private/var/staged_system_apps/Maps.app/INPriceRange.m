@implementation INPriceRange

+ (id)formattedStringForPriceValueWithAmount:(id)a3 currencyCode:(id)a4 showsCurrencySymbol:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  const __CFString *v9;
  void *v10;
  uint64_t v11;
  id v12;
  const __CFString *v13;
  uint64_t v15;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  if (!objc_msgSend(v7, "isEqualToString:", CFSTR("CNY")))
  {
    if (qword_1014D2230 != -1)
      dispatch_once(&qword_1014D2230, &stru_1011B3148);
    v12 = (id)qword_1014D2228;
    objc_msgSend(v12, "setCurrencyCode:", v7);
    if (v5)
      v13 = 0;
    else
      v13 = &stru_1011EB268;
    objc_msgSend(v12, "setCurrencySymbol:", v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stringFromNumber:", v8));

    goto LABEL_16;
  }
  if (qword_1014D2220 != -1)
    dispatch_once(&qword_1014D2220, &stru_1011B3128);
  if (v5)
    v9 = 0;
  else
    v9 = &stru_1011EB268;
  objc_msgSend((id)qword_1014D2218, "setCurrencySymbol:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1014D2218, "stringFromNumber:", v8));

  if (v5)
  {
    v15 = 0;
    v8 = (id)objc_claimAutoreleasedReturnValue(+[NSRegularExpression regularExpressionWithPattern:options:error:](NSRegularExpression, "regularExpressionWithPattern:options:error:", CFSTR("([￥¥])(\\s*)"), 0, &v15));
    if (!v15)
    {
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByReplacingMatchesInString:options:range:withTemplate:", v10, 0, 0, objc_msgSend(v10, "length"), CFSTR("⁠¥")));

      v10 = (void *)v11;
    }
LABEL_16:

  }
  return v10;
}

- (BOOL)_shouldCurrencySymbolGoAfterPrice
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t Log;
  NSObject *v12;
  char *v13;
  id v14;
  int v15;
  char *v16;
  __int16 v17;
  id v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[INPriceRange minimumPrice](self, "minimumPrice"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSLocale autoupdatingCurrentLocale](NSLocale, "autoupdatingCurrentLocale"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[INPriceRange currencyCode](self, "currencyCode"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "displayNameForKey:value:", NSLocaleCurrencySymbol, v5));

    if (qword_1014D2230 != -1)
      dispatch_once(&qword_1014D2230, &stru_1011B3148);
    v7 = (id)qword_1014D2228;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[INPriceRange minimumPrice](self, "minimumPrice"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringFromNumber:", v8));

    LOBYTE(v8) = objc_msgSend(v9, "hasSuffix:", v6);
    return (char)v8;
  }
  else
  {
    Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
    v12 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/Shared/Rides/INPriceRange+MapsAdditions.m");
      v14 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Self.minimumPrice should not be nil"));
      v15 = 136315394;
      v16 = v13;
      v17 = 2112;
      v18 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "{RBError}{%s}: %@", (uint8_t *)&v15, 0x16u);

    }
    return 0;
  }
}

- (NSString)_maps_formattedStringWithDefaultShortFormatStrings
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  void *v23;
  id v24;
  void *v25;
  __CFString *v26;
  void *v27;
  id v28;
  void *v29;
  _BOOL8 v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v40;
  void *v41;
  void *v42;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("%@ [Ridesharing price range]"), CFSTR("localized string not found"), 0));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("%@-%@ [Ridesharing price range]"), CFSTR("localized string not found"), 0));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Up to %@ [Ridesharing price range]"), CFSTR("localized string not found"), 0));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("From %@ [Ridesharing price range]"), CFSTR("localized string not found"), 0));

  v11 = objc_claimAutoreleasedReturnValue(-[INPriceRange minimumPrice](self, "minimumPrice"));
  if (v11
    && (v12 = (void *)v11,
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[INPriceRange maximumPrice](self, "maximumPrice")),
        v13,
        v12,
        v13))
  {
    v42 = v6;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[INPriceRange minimumPrice](self, "minimumPrice"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[INPriceRange maximumPrice](self, "maximumPrice"));
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (v16)
    {
      v17 = objc_alloc((Class)NSString);
      v18 = (void *)objc_opt_class(self);
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[INPriceRange minimumPrice](self, "minimumPrice"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[INPriceRange currencyCode](self, "currencyCode"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "formattedStringForPriceValueWithAmount:currencyCode:showsCurrencySymbol:", v19, v20, 1));
      v22 = (__CFString *)objc_msgSend(v17, "initWithFormat:", v4, v21);
      v6 = v42;
    }
    else
    {
      v30 = -[INPriceRange _shouldCurrencySymbolGoAfterPrice](self, "_shouldCurrencySymbolGoAfterPrice");
      v40 = objc_alloc((Class)NSString);
      v31 = (void *)objc_opt_class(self);
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[INPriceRange minimumPrice](self, "minimumPrice"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[INPriceRange currencyCode](self, "currencyCode"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "formattedStringForPriceValueWithAmount:currencyCode:showsCurrencySymbol:", v19, v20, v30 ^ 1));
      v41 = v10;
      v32 = v8;
      v33 = v4;
      v34 = objc_opt_class(self);
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[INPriceRange maximumPrice](self, "maximumPrice"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[INPriceRange currencyCode](self, "currencyCode"));
      v37 = (void *)v34;
      v4 = v33;
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "formattedStringForPriceValueWithAmount:currencyCode:showsCurrencySymbol:", v35, v36, v30));
      v22 = (__CFString *)objc_msgSend(v40, "initWithFormat:", v42, v21, v38);

      v6 = v42;
      v8 = v32;
      v10 = v41;

    }
  }
  else
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[INPriceRange minimumPrice](self, "minimumPrice"));

    if (v23)
    {
      v24 = objc_alloc((Class)NSString);
      v25 = (void *)objc_opt_class(self);
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[INPriceRange minimumPrice](self, "minimumPrice"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[INPriceRange currencyCode](self, "currencyCode"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "formattedStringForPriceValueWithAmount:currencyCode:showsCurrencySymbol:", v19, v20, 1));
      v26 = (__CFString *)objc_msgSend(v24, "initWithFormat:", v10, v21);
    }
    else
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[INPriceRange maximumPrice](self, "maximumPrice"));

      if (!v27)
      {
        v22 = &stru_1011EB268;
        goto LABEL_12;
      }
      v28 = objc_alloc((Class)NSString);
      v29 = (void *)objc_opt_class(self);
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[INPriceRange maximumPrice](self, "maximumPrice"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[INPriceRange currencyCode](self, "currencyCode"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "formattedStringForPriceValueWithAmount:currencyCode:showsCurrencySymbol:", v19, v20, 1));
      v26 = (__CFString *)objc_msgSend(v28, "initWithFormat:", v8, v21);
    }
    v22 = v26;
  }

LABEL_12:
  return (NSString *)v22;
}

@end
