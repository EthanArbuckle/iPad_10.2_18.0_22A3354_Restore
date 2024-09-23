@implementation PPNamedEntitySupport

+ (id)fullAddressForStreetAddress:(id)a3 city:(id)a4 state:(id)a5 postalCode:(id)a6 country:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  void *v31;
  id v32;
  uint8_t buf[16];
  uint8_t v34[16];

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (objc_msgSend(v11, "length") && (objc_msgSend(v12, "length") || objc_msgSend(v14, "length")))
  {
    v16 = (void *)objc_opt_new();
    v17 = v16;
    if (v11)
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0C970C8]);
    if (v12)
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0C97098]);
    if (v13)
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0C970C0]);
    if (v14)
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0C970B0]);
    v32 = v14;
    if (v15)
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0C970A0]);
    v18 = v13;
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale", v15);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_alloc(MEMORY[0x1E0D26EC8]);
    objc_msgSend(v19, "languageCode");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (!v21)
    {
      objc_msgSend(MEMORY[0x1E0D70D00], "currentLocaleLanguageCode");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v19, "countryCode");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localeIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v20, "initWithContactAddressDictionary:language:country:phoneticLocale:", v17, v22, v23, v24);

    if (!v21)
    v13 = v18;
    if (v25)
    {
      objc_msgSend(v25, "fullAddressNoCurrentCountryWithMultiline:", 0);
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = v26;
      v15 = v31;
      v14 = v32;
      if (v26 && -[NSObject length](v26, "length"))
      {
        v27 = v27;
        v28 = v27;
LABEL_29:

        goto LABEL_30;
      }
      pp_entities_log_handle();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C392E000, v29, OS_LOG_TYPE_DEFAULT, "GEOAddressObject returned a nil or empty address", buf, 2u);
      }

    }
    else
    {
      pp_entities_log_handle();
      v27 = objc_claimAutoreleasedReturnValue();
      v15 = v31;
      v14 = v32;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v34 = 0;
        _os_log_error_impl(&dword_1C392E000, v27, OS_LOG_TYPE_ERROR, "failed to construct GEOAddressObject", v34, 2u);
      }
    }
    v28 = 0;
    goto LABEL_29;
  }
  v28 = 0;
LABEL_30:

  return v28;
}

+ (id)streetAddressFromThoroughfare:(id)a3 subThoroughfare:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a3;
  v6 = a4;
  if (v5)
  {
    v7 = (void *)objc_opt_new();
    if (v6 && (objc_msgSend(v5, "hasPrefix:", v6) & 1) == 0)
    {
      objc_msgSend(v7, "appendString:", v6);
      objc_msgSend(v7, "appendString:", CFSTR(" "));
    }
    objc_msgSend(v7, "appendString:", v5);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
