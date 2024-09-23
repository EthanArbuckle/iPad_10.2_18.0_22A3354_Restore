@implementation InputManager

- (InputManager)init
{
  InputManager *v2;
  InputManager *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  NSDictionary *v10;
  NSDictionary *eligibilityInputs;
  id v13;
  objc_super v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;

  v14.receiver = self;
  v14.super_class = (Class)InputManager;
  v2 = -[InputManager init](&v14, "init");
  v3 = v2;
  if (v2)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[InputManager _createDefaultInputs](v2, "_createDefaultInputs"));
    v5 = objc_msgSend(v4, "mutableCopy");

    v13 = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[InputManager _loadInputsWithError:](v3, "_loadInputsWithError:", &v13));
    v7 = v13;
    if (v6)
    {
      objc_msgSend(v5, "addEntriesFromDictionary:", v6);
    }
    else
    {
      v8 = sub_10000C5FC();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v16 = "-[InputManager init]";
        v17 = 2112;
        v18 = v7;
        _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s: Unable to load inputs from disk, initing with empty values: %@", buf, 0x16u);
      }

    }
    v10 = (NSDictionary *)objc_msgSend(v5, "copy");
    eligibilityInputs = v3->_eligibilityInputs;
    v3->_eligibilityInputs = v10;

  }
  return v3;
}

- (id)_createDefaultInputs
{
  NSMutableDictionary *v2;
  LocatedCountryInput *v3;
  CountryBillingInput *v4;
  DeviceClassInput *v5;
  DeviceLocaleInput *v6;
  ChinaCellularInput *v7;
  DeviceRegionCodeInput *v8;
  DeviceLanguageInput *v9;
  GenerativeModelSystemInput *v10;
  id v11;
  SiriLanguageInput *v12;
  ExternalBootDriveInput *v13;
  SharediPadInput *v14;
  id v15;

  v2 = objc_opt_new(NSMutableDictionary);
  v3 = -[LocatedCountryInput initWithCountryCodes:status:process:]([LocatedCountryInput alloc], "initWithCountryCodes:status:process:", 0, 1, 0);
  if (v3)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v3, CFSTR("OS_ELIGIBILITY_INPUT_COUNTRY_LOCATION"));

  v4 = -[CountryBillingInput initWithBillingCountry:status:process:]([CountryBillingInput alloc], "initWithBillingCountry:status:process:", 0, 1, 0);
  if (v4)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v4, CFSTR("OS_ELIGIBILITY_INPUT_COUNTRY_BILLING"));

  v5 = objc_alloc_init(DeviceClassInput);
  if (v5)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v5, CFSTR("OS_ELIGIBILITY_INPUT_DEVICE_CLASS"));

  v6 = -[DeviceLocaleInput initWithDeviceLocale:status:process:]([DeviceLocaleInput alloc], "initWithDeviceLocale:status:process:", 0, 1, 0);
  if (v6)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v6, CFSTR("OS_ELIGIBILITY_INPUT_DEVICE_LOCALE"));

  v7 = objc_alloc_init(ChinaCellularInput);
  if (v7)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v7, CFSTR("OS_ELIGIBILITY_INPUT_CHINA_CELLULAR"));

  v8 = objc_alloc_init(DeviceRegionCodeInput);
  if (v8)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v8, CFSTR("OS_ELIGIBILITY_INPUT_DEVICE_REGION_CODE"));

  v9 = objc_alloc_init(DeviceLanguageInput);
  if (v9)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v9, CFSTR("OS_ELIGIBILITY_INPUT_DEVICE_LANGUAGE"));

  v10 = objc_alloc_init(GenerativeModelSystemInput);
  if (v10)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v10, CFSTR("OS_ELIGIBILITY_INPUT_GENERATIVE_MODEL_SYSTEM"));

  v11 = -[GreymatterQueueInput initOnQueue:status:process:]([GreymatterQueueInput alloc], "initOnQueue:status:process:", 0, 1, 0);
  if (v11)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v11, CFSTR("OS_ELIGIBILITY_INPUT_GREYMATTER_ON_QUEUE"));

  v12 = objc_alloc_init(SiriLanguageInput);
  if (v12)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v12, CFSTR("OS_ELIGIBILITY_INPUT_SIRI_LANGUAGE"));

  v13 = objc_alloc_init(ExternalBootDriveInput);
  if (v13)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v13, CFSTR("OS_ELIGIBILITY_INPUT_EXTERNAL_BOOT_DRIVE"));

  v14 = objc_alloc_init(SharediPadInput);
  if (v14)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2, "setObject:forKeyedSubscript:", v14, CFSTR("OS_ELIGIBILITY_INPUT_SHARED_IPAD"));

  v15 = -[NSMutableDictionary copy](v2, "copy");
  return v15;
}

- (id)objectForInputValue:(unint64_t)a3
{
  char *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  int v12;
  const char *v13;
  __int16 v14;
  unint64_t v15;

  v5 = sub_10000C3D4(a3);
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[InputManager eligibilityInputs](self, "eligibilityInputs"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v6));

  }
  else
  {
    v9 = sub_10000C5FC();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v12 = 136315394;
      v13 = "-[InputManager objectForInputValue:]";
      v14 = 2048;
      v15 = a3;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s: Unknown input %llu", (uint8_t *)&v12, 0x16u);
    }

    v8 = 0;
  }
  return v8;
}

- (BOOL)setInput:(id)a3 withError:(id *)a4
{
  id v6;
  char *v7;
  void *v8;
  void *v9;
  id v10;
  NSDictionary *v11;
  NSDictionary *eligibilityInputs;
  BOOL v13;
  id v14;
  NSObject *v15;
  int v17;
  const char *v18;
  __int16 v19;
  id v20;

  v6 = a3;
  v7 = sub_10000C3D4((unint64_t)objc_msgSend(v6, "type"));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[InputManager eligibilityInputs](self, "eligibilityInputs"));
    v10 = objc_msgSend(v9, "mutableCopy");

    objc_msgSend(v10, "setObject:forKeyedSubscript:", v6, v8);
    v11 = (NSDictionary *)objc_msgSend(v10, "copy");
    eligibilityInputs = self->_eligibilityInputs;
    self->_eligibilityInputs = v11;

    v13 = -[InputManager _saveInputsWithError:](self, "_saveInputsWithError:", a4);
  }
  else
  {
    v14 = sub_10000C5FC();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v17 = 136315394;
      v18 = "-[InputManager setInput:withError:]";
      v19 = 2112;
      v20 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s: Unknown input %@", (uint8_t *)&v17, 0x16u);
    }

    v13 = 0;
    if (a4)
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, 0));
  }

  return v13;
}

- (id)_loadInputsWithError:(id *)a3
{
  uint64_t v4;
  uint64_t v5;
  NSSet *v6;
  void *v7;
  NSObject *v8;
  char *v9;
  void *v10;
  void *v11;
  void *v12;
  char *v13;
  id v14;
  char *v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  id v27;
  char *v29;
  uint64_t v30;
  void *v31;
  char *v32;
  char *v33;
  id v34;
  char *v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  uint64_t v41;

  v4 = objc_opt_class(NSDictionary);
  v5 = objc_opt_class(EligibilityInput);
  v6 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v4, v5, objc_opt_class(NSString), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v35 = 0;
  if (asprintf(&v35, "%s%s", "/", "/private/var/db/eligibilityd/eligibility_inputs.plist") == -1)
  {
    v8 = sub_10000C5FC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v37 = "copy_eligibility_domain_input_manager_plist_path";
      v38 = 2080;
      v39 = "/private/var/db/eligibilityd/eligibility_inputs.plist";
      _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s: Failed to construct absolute path for relative path: %s", buf, 0x16u);
    }
  }
  v9 = v35;
  if (!v35)
  {
    v19 = sub_10000C5FC();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v37 = "-[InputManager _loadInputsWithError:]";
      _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s: Failed to copy input manager plist path", buf, 0xCu);
    }

    v11 = 0;
    v12 = 0;
    v10 = 0;
    v14 = 0;
    v13 = 0;
    goto LABEL_22;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v35));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v10, 0));
  v34 = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSData dataWithContentsOfURL:options:error:](NSData, "dataWithContentsOfURL:options:error:", v11, 3, &v34));
  v13 = (char *)v34;
  if (!v12)
  {
    v21 = sub_10000C5FC();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v29 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "path"));
      *(_DWORD *)buf = 136315650;
      v37 = "-[InputManager _loadInputsWithError:]";
      v38 = 2112;
      v39 = v29;
      v40 = 2112;
      v41 = (uint64_t)v13;
      _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s: Failed to deserialize data in %@: %@", buf, 0x20u);

    }
    v12 = 0;
    v14 = 0;
    goto LABEL_22;
  }
  v33 = v13;
  v14 = objc_msgSend(objc_alloc((Class)NSKeyedUnarchiver), "initForReadingFromData:error:", v12, &v33);
  v15 = v33;

  if (!v14)
  {
    v23 = sub_10000C5FC();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v37 = "-[InputManager _loadInputsWithError:]";
      v38 = 2112;
      v39 = v15;
      _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s: Failed to create unarchiver: %@", buf, 0x16u);
    }

    v14 = 0;
    v18 = 0;
    goto LABEL_18;
  }
  v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "decodeObjectOfClasses:forKey:", v7, NSKeyedArchiveRootObjectKey));
  if (!v16)
  {
    v25 = sub_10000C5FC();
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v32 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "path"));
      v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "error"));
      *(_DWORD *)buf = 136315650;
      v37 = "-[InputManager _loadInputsWithError:]";
      v38 = 2112;
      v39 = v32;
      v40 = 2112;
      v41 = v30;
      v31 = (void *)v30;
      _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%s: Failed to decode input from data at %@ : %@", buf, 0x20u);

    }
    v13 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "error"));

LABEL_22:
    v18 = 0;
    goto LABEL_23;
  }
  v17 = (void *)v16;
  objc_msgSend(v14, "finishDecoding");
  v18 = v17;
LABEL_18:
  v13 = v15;
LABEL_23:
  free(v9);
  if (a3 && !v18)
    *a3 = objc_retainAutorelease(v13);
  v27 = v18;

  return v27;
}

- (BOOL)_saveInputsWithError:(id *)a3
{
  NSObject *v5;
  char *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  id v13;
  BOOL v14;
  id v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  char *v20;
  void *v21;
  id v22;
  char *v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;

  v23 = 0;
  if (asprintf(&v23, "%s%s", "/", "/private/var/db/eligibilityd/eligibility_inputs.plist") == -1)
  {
    v5 = sub_10000C5FC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v25 = "copy_eligibility_domain_input_manager_plist_path";
      v26 = 2080;
      v27 = "/private/var/db/eligibilityd/eligibility_inputs.plist";
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "%s: Failed to construct absolute path for relative path: %s", buf, 0x16u);
    }
  }
  v6 = v23;
  if (v23)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v23));
    v8 = objc_msgSend(objc_alloc((Class)NSKeyedArchiver), "initRequiringSecureCoding:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[InputManager eligibilityInputs](self, "eligibilityInputs"));
    objc_msgSend(v8, "encodeObject:forKey:", v9, NSKeyedArchiveRootObjectKey);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "encodedData"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v7, 0));
    v22 = 0;
    v12 = objc_msgSend(v10, "writeToURL:options:error:", v11, 268435457, &v22);
    v13 = v22;
    if (v12)
    {
      free(v6);
      v14 = 1;
      goto LABEL_16;
    }
    v17 = sub_10000C5FC();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v20 = (char *)objc_claimAutoreleasedReturnValue(-[InputManager eligibilityInputs](self, "eligibilityInputs"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "path"));
      *(_DWORD *)buf = 136315906;
      v25 = "-[InputManager _saveInputsWithError:]";
      v26 = 2112;
      v27 = v20;
      v28 = 2112;
      v29 = v21;
      v30 = 2112;
      v31 = v13;
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s: Failed to write eligibility data %@ to disk at %@: %@", buf, 0x2Au);

    }
  }
  else
  {
    v15 = sub_10000C5FC();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v25 = "-[InputManager _saveInputsWithError:]";
      _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s: Failed to copy input manager plist path", buf, 0xCu);
    }

    v7 = 0;
    v11 = 0;
    v10 = 0;
    v13 = 0;
  }
  free(v6);
  if (a3)
  {
    v13 = objc_retainAutorelease(v13);
    v14 = 0;
    *a3 = v13;
  }
  else
  {
    v14 = 0;
  }
LABEL_16:

  return v14;
}

- (NSDictionary)debugDictionary
{
  NSMutableDictionary *v3;
  void *v4;
  NSMutableDictionary *v5;
  id v6;
  _QWORD v8[4];
  NSMutableDictionary *v9;

  v3 = objc_opt_new(NSMutableDictionary);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[InputManager eligibilityInputs](self, "eligibilityInputs"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000A514;
  v8[3] = &unk_1000309D0;
  v9 = v3;
  v5 = v3;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v8);

  v6 = -[NSMutableDictionary copy](v5, "copy");
  return (NSDictionary *)v6;
}

- (NSDictionary)eligibilityInputs
{
  return self->_eligibilityInputs;
}

- (void)setEligibilityInputs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eligibilityInputs, 0);
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A5E8;
  block[3] = &unk_100030E08;
  block[4] = a1;
  if (qword_10003F3C8 != -1)
    dispatch_once(&qword_10003F3C8, block);
  return (id)qword_10003F3C0;
}

@end
