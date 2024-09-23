@implementation ChlorineDomain

- (unint64_t)domain
{
  return 18;
}

- (id)domainChangeNotificationName
{
  return CFSTR("com.apple.os-eligibility-domain.change.chlorine");
}

- (void)_internal_doInit
{
  id v3;

  -[ChlorineDomain updateParameters](self, "updateParameters");
  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("iPhone"), CFSTR("iPad"), 0));
  -[EligibilityDomain setDeviceClassesOfInterest:](self, "setDeviceClassesOfInterest:", v3);

}

- (ChlorineDomain)init
{
  ChlorineDomain *v2;
  ChlorineDomain *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ChlorineDomain;
  v2 = -[EligibilityDomain init](&v5, "init");
  v3 = v2;
  if (v2)
    -[ChlorineDomain _internal_doInit](v2, "_internal_doInit");
  return v3;
}

- (ChlorineDomain)initWithCoder:(id)a3
{
  ChlorineDomain *v3;
  ChlorineDomain *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ChlorineDomain;
  v3 = -[EligibilityDomain initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[ChlorineDomain _internal_doInit](v3, "_internal_doInit");
  return v4;
}

- (void)updateParameters
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[MobileAssetManager sharedInstance](MobileAssetManager, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "chlorineAsset"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "countryCodes"));
  -[EligibilityDomain setBillingCountriesOfInterest:](self, "setBillingCountriesOfInterest:", v4);
  -[EligibilityDomain setDeviceLocalesOfInterest:](self, "setDeviceLocalesOfInterest:", v4);

}

- (BOOL)computeWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  unsigned int v10;
  void *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  void *v15;
  unsigned int v16;
  int v18;
  const char *v19;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain status](self, "status"));
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("OS_ELIGIBILITY_INPUT_DEVICE_CLASS")));
    v8 = objc_msgSend(v7, "unsignedIntValue");

    if (v8 != 3)
      goto LABEL_5;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("OS_ELIGIBILITY_INPUT_COUNTRY_BILLING")));
    v10 = objc_msgSend(v9, "unsignedIntValue");

    if (v10 == 3)
    {
      v11 = 0;
      v12 = 4;
      goto LABEL_13;
    }
    if (v10 != 2)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("OS_ELIGIBILITY_INPUT_DEVICE_LOCALE")));
      v16 = objc_msgSend(v15, "unsignedIntValue");

      v11 = 0;
      if (v16 == 3)
        v12 = 4;
      else
        v12 = 2;
    }
    else
    {
LABEL_5:
      v11 = 0;
      v12 = 2;
    }
  }
  else
  {
    v13 = sub_10000C5FC();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      v18 = 136315138;
      v19 = "-[ChlorineDomain computeWithError:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, "%s: Failed to get status for Chlorine domain", (uint8_t *)&v18, 0xCu);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 93, 0));
    v12 = 0;
  }
LABEL_13:
  -[EligibilityDomain setAnswer:](self, "setAnswer:", v12);
  if (a3 && !v12)
    *a3 = objc_retainAutorelease(v11);

  return v12 != 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
