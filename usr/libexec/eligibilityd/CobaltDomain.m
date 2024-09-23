@implementation CobaltDomain

- (unint64_t)domain
{
  return 28;
}

- (id)domainChangeNotificationName
{
  return CFSTR("com.apple.os-eligibility-domain.change.cobalt");
}

- (unint64_t)defaultAnswer
{
  return 4;
}

- (CobaltDomain)init
{
  CobaltDomain *v2;
  CobaltDomain *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CobaltDomain;
  v2 = -[EligibilityDomain init](&v5, "init");
  v3 = v2;
  if (v2)
    -[CobaltDomain _internal_doInit](v2, "_internal_doInit");
  return v3;
}

- (CobaltDomain)initWithCoder:(id)a3
{
  CobaltDomain *v3;
  CobaltDomain *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CobaltDomain;
  v3 = -[EligibilityDomain initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[CobaltDomain _internal_doInit](v3, "_internal_doInit");
  return v4;
}

- (void)updateParameters
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[MobileAssetManager sharedInstance](MobileAssetManager, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cobaltAsset"));
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
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  int v17;
  const char *v18;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[EligibilityDomain status](self, "status"));
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("OS_ELIGIBILITY_INPUT_COUNTRY_LOCATION")));
    v8 = objc_msgSend(v7, "unsignedIntValue");

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("OS_ELIGIBILITY_INPUT_COUNTRY_BILLING")));
    v10 = objc_msgSend(v9, "unsignedIntValue");

    if (v10 != 3 && v8 == 2)
      v12 = 2;
    else
      v12 = 4;
    -[EligibilityDomain setAnswer:](self, "setAnswer:", v12);
    v13 = 0;
  }
  else
  {
    v14 = sub_10000C5FC();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      v17 = 136315138;
      v18 = "-[CobaltDomain computeWithError:]";
      _os_log_fault_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "%s: Failed to get status for Cobalt domain", (uint8_t *)&v17, 0xCu);
    }

    v13 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 93, 0));
    -[EligibilityDomain setAnswer:](self, "setAnswer:", 0);
    if (a3)
    {
      v13 = objc_retainAutorelease(v13);
      *a3 = v13;
    }
  }

  return v6 != 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
