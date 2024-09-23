@implementation APIDAccount

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_msgSend(v13, "encodeBool:forKey:", -[APIDAccount ageUnknown](self, "ageUnknown"), CFSTR("ageUnknown"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[APIDAccount deviceNewsPlusSubscriberID](self, "deviceNewsPlusSubscriberID"));
  objc_msgSend(v13, "encodeObject:forKey:", v4, CFSTR("deviceNewsPlusSubscriberID"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APIDAccount anonymousDemandID](self, "anonymousDemandID"));
  objc_msgSend(v13, "encodeObject:forKey:", v5, CFSTR("anonymousDemandID"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[APIDAccount contentID](self, "contentID"));
  objc_msgSend(v13, "encodeObject:forKey:", v6, CFSTR("contentID"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[APIDAccount DPID](self, "DPID"));
  objc_msgSend(v13, "encodeObject:forKey:", v7, CFSTR("DPID"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[APIDAccount iAdID](self, "iAdID"));
  objc_msgSend(v13, "encodeObject:forKey:", v8, CFSTR("iAdID"));

  objc_msgSend(v13, "encodeBool:forKey:", -[APIDAccount isAdolescent](self, "isAdolescent"), CFSTR("isAdolescent"));
  objc_msgSend(v13, "encodeBool:forKey:", -[APIDAccount isAdult](self, "isAdult"), CFSTR("isAdult"));
  objc_msgSend(v13, "encodeBool:forKey:", -[APIDAccount isChild](self, "isChild"), CFSTR("isChild"));
  objc_msgSend(v13, "encodeBool:forKey:", -[APIDAccount sensitiveContentEligible](self, "sensitiveContentEligible"), CFSTR("sensitiveContentEligible"));
  objc_msgSend(v13, "encodeBool:forKey:", -[APIDAccount isiCloudLoggedIn](self, "isiCloudLoggedIn"), CFSTR("isiCloudLoggedIn"));
  objc_msgSend(v13, "encodeBool:forKey:", -[APIDAccount isiCloudSameAsiTunes](self, "isiCloudSameAsiTunes"), CFSTR("isiCloudSameAsiTunes"));
  objc_msgSend(v13, "encodeBool:forKey:", -[APIDAccount isiTunesLoggedIn](self, "isiTunesLoggedIn"), CFSTR("isiTunesLoggedIn"));
  objc_msgSend(v13, "encodeBool:forKey:", -[APIDAccount isManagedAccount](self, "isManagedAccount"), CFSTR("isManagedAccount"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[APIDAccount iTunesDSID](self, "iTunesDSID"));
  objc_msgSend(v13, "encodeObject:forKey:", v9, CFSTR("iTunesDSID"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[APIDAccount monthlyIDResetCount](self, "monthlyIDResetCount"));
  objc_msgSend(v13, "encodeObject:forKey:", v10, CFSTR("monthlyIDResetCount"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[APIDAccount storefront](self, "storefront"));
  objc_msgSend(v13, "encodeObject:forKey:", v11, CFSTR("storefront"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[APIDAccount toroID](self, "toroID"));
  objc_msgSend(v13, "encodeObject:forKey:", v12, CFSTR("toroID"));

  objc_msgSend(v13, "encodeBool:forKey:", -[APIDAccount isNoServicesRegion](self, "isNoServicesRegion"), CFSTR("isNoServicesRegion"));
}

- (NSNumber)iTunesDSID
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (NSString)storefront
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (NSUUID)toroID
{
  return (NSUUID *)objc_getProperty(self, a2, 88, 1);
}

- (NSNumber)monthlyIDResetCount
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (BOOL)isNoServicesRegion
{
  return self->_isNoServicesRegion;
}

- (BOOL)isChild
{
  return self->_isChild;
}

- (NSUUID)deviceNewsPlusSubscriberID
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (NSUUID)contentID
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (NSUUID)anonymousDemandID
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)DPID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (BOOL)sensitiveContentEligible
{
  return self->_sensitiveContentEligible;
}

- (BOOL)isiTunesLoggedIn
{
  return self->_isiTunesLoggedIn;
}

- (BOOL)isiCloudSameAsiTunes
{
  return self->_isiCloudSameAsiTunes;
}

- (BOOL)isiCloudLoggedIn
{
  return self->_isiCloudLoggedIn;
}

- (BOOL)isManagedAccount
{
  return self->_isManagedAccount;
}

- (BOOL)isAdult
{
  return self->_isAdult;
}

- (BOOL)isAdolescent
{
  return self->_isAdolescent;
}

- (BOOL)ageUnknown
{
  return self->_ageUnknown;
}

- (NSUUID)iAdID
{
  return (NSUUID *)objc_getProperty(self, a2, 56, 1);
}

- (APIDAccount)initWithIDAccountsRecord:(id)a3 storefront:(id)a4 monthlyIDResetCount:(id)a5
{
  id v8;
  id v9;
  id v10;
  APIDAccount *v11;
  uint64_t v12;
  NSNumber *iTunesDSID;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  NSUUID *v31;
  NSUUID *anonymousDemandID;
  NSUUID *v33;
  NSUUID *contentID;
  NSUUID *v35;
  NSUUID *toroID;
  NSUUID *v37;
  NSUUID *iAdID;
  void *v39;
  void *v40;
  NSUUID *v41;
  NSUUID *v42;
  id v43;
  void *v44;
  NSUUID *v45;
  NSUUID *v46;
  id v47;
  void *v48;
  NSUUID *v49;
  NSUUID *v50;
  id v51;
  void *v52;
  NSUUID *v53;
  NSUUID *v54;
  id v55;
  void *v56;
  NSUUID *v57;
  NSUUID *deviceNewsPlusSubscriberID;
  NSUUID *v59;
  NSUUID *v60;
  uint64_t v61;
  NSString *DPID;
  void *v64;
  id obj;
  id v66;
  id v67;
  _QWORD v68[4];
  _QWORD v69[4];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[APIDAccount init](self, "init");
  if (v11)
  {
    obj = a5;
    v66 = v10;
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("iTunesDSID")));
    v12 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(v64, "integerValue")));
    iTunesDSID = v11->_iTunesDSID;
    v11->_iTunesDSID = (NSNumber *)v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("isChild")));
    v11->_isChild = objc_msgSend(v14, "BOOLValue");

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("isAdolescent")));
    v11->_isAdolescent = objc_msgSend(v15, "BOOLValue");

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("isAdult")));
    v11->_isAdult = objc_msgSend(v16, "BOOLValue");

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("ageUnknown")));
    v11->_ageUnknown = objc_msgSend(v17, "BOOLValue");

    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("sensitiveContentEligible")));
    v11->_sensitiveContentEligible = objc_msgSend(v18, "BOOLValue");

    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("isManagedAccount")));
    v11->_isManagedAccount = objc_msgSend(v19, "BOOLValue");

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("isiCloudLoggedIn")));
    v11->_isiCloudLoggedIn = objc_msgSend(v20, "BOOLValue");

    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("isiTunesLoggedIn")));
    v11->_isiTunesLoggedIn = objc_msgSend(v21, "BOOLValue");

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("isiCloudSameAsiTunes")));
    v11->_isiCloudSameAsiTunes = objc_msgSend(v22, "BOOLValue");

    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("isNoServicesRegion")));
    v11->_isNoServicesRegion = objc_msgSend(v23, "BOOLValue");

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("deviceNewsPlusSubscriberID")));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("anonymousDemandID")));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("contentID")));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("toroID")));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("iAdID")));
    v29 = objc_alloc((Class)NSUUID);
    v30 = v29;
    v67 = v9;
    if (v25 && v26 && v27 && v28)
    {
      v31 = (NSUUID *)objc_msgSend(v29, "initWithUUIDString:", v25);
      anonymousDemandID = v11->_anonymousDemandID;
      v11->_anonymousDemandID = v31;

      v33 = (NSUUID *)objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v26);
      contentID = v11->_contentID;
      v11->_contentID = v33;

      v35 = (NSUUID *)objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v27);
      toroID = v11->_toroID;
      v11->_toroID = v35;

      v37 = (NSUUID *)objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v28);
      iAdID = v11->_iAdID;
      v11->_iAdID = v37;

      if (!v11->_anonymousDemandID || !v11->_contentID || !v11->_toroID || !v11->_iAdID)
      {
        v68[0] = CFSTR("anonymousDemandIDRead");
        v68[1] = CFSTR("contentIDRead");
        v69[0] = v25;
        v69[1] = v26;
        v68[2] = CFSTR("toroIDRead");
        v68[3] = CFSTR("iAdIDRead");
        v69[2] = v27;
        v69[3] = v28;
        v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v69, v68, 4));
        CreateDiagnosticReport(CFSTR("Failed to read account data from Keychain"), v39, CFSTR("ASE"));

      }
    }
    else
    {
      v40 = (void *)objc_claimAutoreleasedReturnValue(-[APIDAccount _fakeID](v11, "_fakeID"));
      v41 = (NSUUID *)objc_msgSend(v30, "initWithUUIDString:", v40);
      v42 = v11->_anonymousDemandID;
      v11->_anonymousDemandID = v41;

      v43 = objc_alloc((Class)NSUUID);
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[APIDAccount _fakeID](v11, "_fakeID"));
      v45 = (NSUUID *)objc_msgSend(v43, "initWithUUIDString:", v44);
      v46 = v11->_contentID;
      v11->_contentID = v45;

      v47 = objc_alloc((Class)NSUUID);
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[APIDAccount _fakeID](v11, "_fakeID"));
      v49 = (NSUUID *)objc_msgSend(v47, "initWithUUIDString:", v48);
      v50 = v11->_toroID;
      v11->_toroID = v49;

      v51 = objc_alloc((Class)NSUUID);
      v52 = (void *)objc_claimAutoreleasedReturnValue(-[APIDAccount _fakeID](v11, "_fakeID"));
      v53 = (NSUUID *)objc_msgSend(v51, "initWithUUIDString:", v52);
      v54 = v11->_iAdID;
      v11->_iAdID = v53;

      -[APIDAccount _performForceReconcile](v11, "_performForceReconcile");
    }
    v55 = objc_alloc((Class)NSUUID);
    v56 = v55;
    if (v24)
    {
      v57 = (NSUUID *)objc_msgSend(v55, "initWithUUIDString:", v24);
      deviceNewsPlusSubscriberID = v11->_deviceNewsPlusSubscriberID;
      v11->_deviceNewsPlusSubscriberID = v57;
    }
    else
    {
      deviceNewsPlusSubscriberID = (NSUUID *)objc_claimAutoreleasedReturnValue(-[APIDAccount _fakeID](v11, "_fakeID"));
      v59 = (NSUUID *)objc_msgSend(v56, "initWithUUIDString:", deviceNewsPlusSubscriberID);
      v60 = v11->_deviceNewsPlusSubscriberID;
      v11->_deviceNewsPlusSubscriberID = v59;

    }
    v61 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("DPID")));
    DPID = v11->_DPID;
    v11->_DPID = (NSString *)v61;

    objc_storeStrong((id *)&v11->_storefront, a4);
    objc_storeStrong((id *)&v11->_monthlyIDResetCount, obj);

    v10 = v66;
    v9 = v67;
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toroID, 0);
  objc_storeStrong((id *)&self->_storefront, 0);
  objc_storeStrong((id *)&self->_monthlyIDResetCount, 0);
  objc_storeStrong((id *)&self->_iTunesDSID, 0);
  objc_storeStrong((id *)&self->_iAdID, 0);
  objc_storeStrong((id *)&self->_DPID, 0);
  objc_storeStrong((id *)&self->_contentID, 0);
  objc_storeStrong((id *)&self->_anonymousDemandID, 0);
  objc_storeStrong((id *)&self->_deviceNewsPlusSubscriberID, 0);
}

- (APIDAccount)initWithCoder:(id)a3
{
  id v4;
  APIDAccount *v5;
  id v6;
  uint64_t v7;
  NSUUID *deviceNewsPlusSubscriberID;
  id v9;
  uint64_t v10;
  NSUUID *anonymousDemandID;
  id v12;
  uint64_t v13;
  NSUUID *contentID;
  id v15;
  uint64_t v16;
  NSString *DPID;
  id v18;
  uint64_t v19;
  NSUUID *iAdID;
  id v21;
  uint64_t v22;
  NSNumber *iTunesDSID;
  id v24;
  uint64_t v25;
  NSNumber *monthlyIDResetCount;
  id v27;
  uint64_t v28;
  NSString *storefront;
  id v30;
  uint64_t v31;
  NSUUID *toroID;

  v4 = a3;
  v5 = -[APIDAccount init](self, "init");
  if (v5)
  {
    v5->_ageUnknown = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ageUnknown"));
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID), CFSTR("deviceNewsPlusSubscriberID"));
    v7 = objc_claimAutoreleasedReturnValue(v6);
    deviceNewsPlusSubscriberID = v5->_deviceNewsPlusSubscriberID;
    v5->_deviceNewsPlusSubscriberID = (NSUUID *)v7;

    v9 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID), CFSTR("anonymousDemandID"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    anonymousDemandID = v5->_anonymousDemandID;
    v5->_anonymousDemandID = (NSUUID *)v10;

    v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID), CFSTR("contentID"));
    v13 = objc_claimAutoreleasedReturnValue(v12);
    contentID = v5->_contentID;
    v5->_contentID = (NSUUID *)v13;

    v15 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("DPID"));
    v16 = objc_claimAutoreleasedReturnValue(v15);
    DPID = v5->_DPID;
    v5->_DPID = (NSString *)v16;

    v18 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID), CFSTR("iAdID"));
    v19 = objc_claimAutoreleasedReturnValue(v18);
    iAdID = v5->_iAdID;
    v5->_iAdID = (NSUUID *)v19;

    v5->_isAdolescent = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isAdolescent"));
    v5->_isAdult = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isAdult"));
    v5->_isChild = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isChild"));
    v5->_sensitiveContentEligible = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("sensitiveContentEligible"));
    v5->_isiCloudLoggedIn = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isiCloudLoggedIn"));
    v5->_isiCloudSameAsiTunes = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isiCloudSameAsiTunes"));
    v5->_isiTunesLoggedIn = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isiTunesLoggedIn"));
    v5->_isManagedAccount = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isManagedAccount"));
    v21 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("iTunesDSID"));
    v22 = objc_claimAutoreleasedReturnValue(v21);
    iTunesDSID = v5->_iTunesDSID;
    v5->_iTunesDSID = (NSNumber *)v22;

    v24 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("monthlyIDResetCount"));
    v25 = objc_claimAutoreleasedReturnValue(v24);
    monthlyIDResetCount = v5->_monthlyIDResetCount;
    v5->_monthlyIDResetCount = (NSNumber *)v25;

    v27 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("storefront"));
    v28 = objc_claimAutoreleasedReturnValue(v27);
    storefront = v5->_storefront;
    v5->_storefront = (NSString *)v28;

    v30 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSUUID), CFSTR("toroID"));
    v31 = objc_claimAutoreleasedReturnValue(v30);
    toroID = v5->_toroID;
    v5->_toroID = (NSUUID *)v31;

    v5->_isNoServicesRegion = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isNoServicesRegion"));
  }

  return v5;
}

- (id)_fakeID
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t v9[16];

  v2 = objc_msgSend(CFSTR("BAAAAAAD"), "length");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "UUIDString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByReplacingCharactersInRange:withString:", 0, v2, CFSTR("BAAAAAAD")));

  if (!v5)
  {
    v6 = APLogForCategory(17);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "fakeIDString is nil", v9, 2u);
    }

  }
  return v5;
}

- (void)_performForceReconcile
{
  +[APIDAccountsReconciler forceReconcile:](APIDAccountsReconciler, "forceReconcile:", &stru_1002140B8);
}

@end
