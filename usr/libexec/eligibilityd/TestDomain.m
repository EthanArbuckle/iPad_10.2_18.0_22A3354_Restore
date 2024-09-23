@implementation TestDomain

- (unint64_t)domain
{
  return 120;
}

- (id)domainChangeNotificationName
{
  return CFSTR("com.apple.os-eligibility-domain.change.test");
}

- (TestDomain)init
{
  TestDomain *v2;
  TestDomain *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TestDomain;
  v2 = -[EligibilityDomain init](&v5, "init");
  v3 = v2;
  if (v2)
    -[TestDomain _internal_doInit](v2, "_internal_doInit");
  return v3;
}

- (TestDomain)initWithCoder:(id)a3
{
  TestDomain *v3;
  TestDomain *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TestDomain;
  v3 = -[EligibilityDomain initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[TestDomain _internal_doInit](v3, "_internal_doInit");
  return v4;
}

- (id)expectedCountryCode
{
  id v2;
  void *v3;

  v2 = objc_msgSend(objc_alloc((Class)NSUserDefaults), "initWithSuiteName:", CFSTR("com.apple.eligibilityd"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringForKey:", CFSTR("ExpectedCountryCode")));

  return v3;
}

- (void)updateParameters
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TestDomain expectedCountryCode](self, "expectedCountryCode"));
  if (v3)
  {
    v5 = v3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v3));
    -[EligibilityDomain setLocatedCountriesOfInterest:](self, "setLocatedCountriesOfInterest:", v4);
    -[EligibilityDomain setBillingCountriesOfInterest:](self, "setBillingCountriesOfInterest:", v4);

    v3 = v5;
  }

}

- (BOOL)computeWithError:(id *)a3
{
  _BOOL4 v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  _QWORD v24[4];
  __CFString *v25;
  id v26;
  id v27;
  id v28;

  v4 = -[EligibilityDomain computeAnswerFromStatusWithError:](self, "computeAnswerFromStatusWithError:", a3);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TestDomain expectedCountryCode](self, "expectedCountryCode"));
    v6 = -[EligibilityDomain answer](self, "answer");
    if (v5)
    {
      v7 = v6;
      if (v6 != 4)
      {
        v8 = sub_10000C4A8(v6);
        v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("os_eligibility has returned an eligibility result of %@ for you being in region - %@. If this is not expected, please file a bug."), v9, v5));

        v11 = sub_10000C4A8(v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Expected eligibility didn't match: %@"), v12));

        v14 = (void *)objc_claimAutoreleasedReturnValue(+[InputManager sharedInstance](InputManager, "sharedInstance"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForInputValue:", 1));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForInputValue:", 2));
        v17 = sub_10000C4A8(v7);
        v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("The TEST domain reported = %@ even though it was expecting a country code of: %@.\nThe current state of the device is:\nLocated Country = %@\nBilling Country = %@\n"), v18, v5, v15, v16));

        v24[0] = _NSConcreteStackBlock;
        v24[1] = 3221225472;
        v24[2] = sub_10001F168;
        v24[3] = &unk_100031010;
        v25 = CFSTR("OS Eligibility has changed");
        v26 = v10;
        v27 = v13;
        v28 = v19;
        v20 = v19;
        v21 = v13;
        v22 = v10;
        sub_1000159C8(&_dispatch_main_q, v24);

      }
    }

  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
