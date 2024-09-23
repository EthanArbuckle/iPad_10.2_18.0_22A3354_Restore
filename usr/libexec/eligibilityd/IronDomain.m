@implementation IronDomain

- (unint64_t)domain
{
  return 27;
}

- (id)domainChangeNotificationName
{
  return CFSTR("com.apple.os-eligibility-domain.change.iron");
}

- (void)_internal_doInit
{
  id v3;

  -[IronDomain updateParameters](self, "updateParameters");
  v3 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("iPhone"), CFSTR("Mac"), 0));
  -[EligibilityDomain setDeviceClassesOfInterest:](self, "setDeviceClassesOfInterest:", v3);

}

- (IronDomain)init
{
  IronDomain *v2;
  IronDomain *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IronDomain;
  v2 = -[EligibilityDomain init](&v5, "init");
  v3 = v2;
  if (v2)
    -[IronDomain _internal_doInit](v2, "_internal_doInit");
  return v3;
}

- (IronDomain)initWithCoder:(id)a3
{
  IronDomain *v3;
  IronDomain *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IronDomain;
  v3 = -[EligibilityDomain initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[IronDomain _internal_doInit](v3, "_internal_doInit");
  return v4;
}

- (void)updateParameters
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[MobileAssetManager sharedInstance](MobileAssetManager, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "ironAsset"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "countryCodes"));
  -[EligibilityDomain setLocatedCountriesOfInterest:withGracePeriod:isInverted:](self, "setLocatedCountriesOfInterest:withGracePeriod:isInverted:", v4, 0, 1);
  -[EligibilityDomain setBillingCountriesOfInterest:isInverted:](self, "setBillingCountriesOfInterest:isInverted:", v4, 1);

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
  unsigned int v12;
  uint64_t v13;
  id v14;
  NSObject *v15;
  id v16;
  int v19;
  const char *v20;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain status](self, "status"));
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("OS_ELIGIBILITY_INPUT_DEVICE_CLASS")));
    v8 = objc_msgSend(v7, "unsignedIntValue");

    if (v8 != 3
      || (v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("OS_ELIGIBILITY_INPUT_COUNTRY_LOCATION"))),
          v10 = objc_msgSend(v9, "unsignedIntValue"),
          v9,
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("OS_ELIGIBILITY_INPUT_COUNTRY_BILLING"))),
          v12 = objc_msgSend(v11, "unsignedIntValue"),
          v11,
          v10 == 2)
      && v12 == 2)
    {
      v13 = 2;
    }
    else if (v12 != 3 && v10 == 2)
    {
      v13 = 2;
    }
    else
    {
      v13 = 4;
    }
    -[EligibilityDomain setAnswer:](self, "setAnswer:", v13);
    v16 = 0;
  }
  else
  {
    v14 = sub_10000C5FC();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      v19 = 136315138;
      v20 = "-[IronDomain computeWithError:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "%s: Failed to get status for Iron domain", (uint8_t *)&v19, 0xCu);
    }

    v16 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 93, 0));
    -[EligibilityDomain setAnswer:](self, "setAnswer:", 0);
    if (a3)
    {
      v16 = objc_retainAutorelease(v16);
      *a3 = v16;
    }
  }

  return v6 != 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
