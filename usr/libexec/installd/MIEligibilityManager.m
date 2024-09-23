@implementation MIEligibilityManager

+ (MIEligibilityManager)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004D41C;
  block[3] = &unk_100084C08;
  block[4] = a1;
  if (qword_10009E030 != -1)
    dispatch_once(&qword_10009E030, block);
  return (MIEligibilityManager *)(id)qword_10009E028;
}

- (BOOL)testOverridesEnabled
{
  void *v2;
  BOOL v3;
  void *v4;
  unsigned __int8 v5;
  char v7;

  v7 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance"));
  v3 = 0;
  if (objc_msgSend(v2, "allowsInternalSecurityPolicy"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MITestManager sharedInstance](MITestManager, "sharedInstance"));
    v5 = objc_msgSend(v4, "isRunningInTestMode:outError:", &v7, 0);
    if (v7)
      v3 = v5;
    else
      v3 = 0;

  }
  return v3;
}

- (void)setTestOverrides:(id)a3
{
  NSDictionary *v4;
  NSDictionary *testOverrides;
  id v6;
  id v7;

  v7 = a3;
  if (-[MIEligibilityManager testOverridesEnabled](self, "testOverridesEnabled"))
  {
    if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
    {
      v6 = v7;
      MOLogWrite(qword_10009E048, 5, "-[MIEligibilityManager setTestOverrides:]", CFSTR("Setting eligibility test overrides to %@"));
    }
    v4 = (NSDictionary *)objc_msgSend(v7, "copy", v6);
    testOverrides = self->_testOverrides;
    self->_testOverrides = v4;

  }
}

- (BOOL)getEligibilityForDomain:(unint64_t)a3 answer:(unint64_t *)a4 source:(unint64_t *)a5 status:(id *)a6 context:(id *)a7 error:(id *)a8
{
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  BOOL v19;
  id v20;
  id v21;
  int domain_answer;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v29;
  uint64_t v31;

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[MIEligibilityManager testOverrides](self, "testOverrides"));
  if (v15 && -[MIEligibilityManager testOverridesEnabled](self, "testOverridesEnabled"))
  {
    v16 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v16));
    v19 = v18 != 0;
    if (v18)
    {
      if (!qword_10009E048 || *(int *)(qword_10009E048 + 44) >= 5)
        MOLogWrite(qword_10009E048, 5, "-[MIEligibilityManager getEligibilityForDomain:answer:source:status:context:error:]", CFSTR("Test mode: overriding eligibility for domain %llu to %@"));
      if (a4)
        *a4 = (unint64_t)objc_msgSend(v18, "unsignedLongLongValue");
      if (a5)
        *a5 = 2;
      if (a6)
      {
        v20 = *a6;
        *a6 = 0;

      }
      if (!a7)
        goto LABEL_23;
      v21 = *a7;
      *a7 = 0;
    }
    else
    {
      v29 = sub_100010E50((uint64_t)"-[MIEligibilityManager getEligibilityForDomain:answer:source:status:context:error:]", 81, MIInstallerErrorDomain, 219, 0, 0, CFSTR("Test mode: no override set for domain %llu; failing"),
              v17,
              a3);
      v21 = (id)objc_claimAutoreleasedReturnValue(v29);
      if (a8)
      {
        v21 = objc_retainAutorelease(v21);
        *a8 = v21;
      }
    }

LABEL_23:
LABEL_24:

    goto LABEL_25;
  }
  domain_answer = os_eligibility_get_domain_answer(a3, a4, a5, a6, a7);
  if (domain_answer)
  {
    v24 = (void *)MIInstallerErrorDomain;
    v25 = sub_100010E24((uint64_t)"-[MIEligibilityManager getEligibilityForDomain:answer:source:status:context:error:]", 91, NSPOSIXErrorDomain, domain_answer, 0, 0, CFSTR("os_eligibility_get_domain_answer failed"), v23, v31);
    v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
    v28 = sub_100010E24((uint64_t)"-[MIEligibilityManager getEligibilityForDomain:answer:source:status:context:error:]", 91, v24, 4, v26, 0, CFSTR("Failed to check eligibility for domain %llu"), v27, a3);
    v16 = (id)objc_claimAutoreleasedReturnValue(v28);

    if (a8)
    {
      v16 = objc_retainAutorelease(v16);
      v19 = 0;
      *a8 = v16;
    }
    else
    {
      v19 = 0;
    }
    goto LABEL_24;
  }
  v19 = 1;
LABEL_25:

  return v19;
}

- (NSDictionary)testOverrides
{
  return self->_testOverrides;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testOverrides, 0);
}

@end
