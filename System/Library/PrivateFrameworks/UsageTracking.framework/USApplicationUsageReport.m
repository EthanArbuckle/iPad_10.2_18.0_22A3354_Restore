@implementation USApplicationUsageReport

- (USApplicationUsageReport)initWithBundleIdentifier:(id)a3 totalUsageTime:(double)a4 applicationUsageTime:(double)a5 webUsageByDomain:(id)a6
{
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  USApplicationUsageReport *v15;
  id v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v17 = a3;
  v10 = (void *)MEMORY[0x24BDD16E0];
  v11 = a6;
  v12 = a3;
  objc_msgSend(v10, "numberWithDouble:", a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v13;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[USApplicationUsageReport initWithCanonicalBundleIdentifier:applicationUsageTrusted:totalUsageTime:applicationUsageByBundleIdentifier:webUsageByDomain:userNotificationsByBundleIdentifier:pickupsByBundleIdentifier:](self, "initWithCanonicalBundleIdentifier:applicationUsageTrusted:totalUsageTime:applicationUsageByBundleIdentifier:webUsageByDomain:userNotificationsByBundleIdentifier:pickupsByBundleIdentifier:", v12, 1, v14, v11, MEMORY[0x24BDBD1B8], MEMORY[0x24BDBD1B8], a4);

  return v15;
}

- (USApplicationUsageReport)initWithCanonicalBundleIdentifier:(id)a3 totalUsageTime:(double)a4 applicationUsageByBundleIdentifier:(id)a5 webUsageByDomain:(id)a6 userNotificationsByBundleIdentifier:(id)a7 pickupsByBundleIdentifier:(id)a8
{
  return -[USApplicationUsageReport initWithCanonicalBundleIdentifier:applicationUsageTrusted:totalUsageTime:applicationUsageByBundleIdentifier:webUsageByDomain:userNotificationsByBundleIdentifier:pickupsByBundleIdentifier:](self, "initWithCanonicalBundleIdentifier:applicationUsageTrusted:totalUsageTime:applicationUsageByBundleIdentifier:webUsageByDomain:userNotificationsByBundleIdentifier:pickupsByBundleIdentifier:", a3, 1, a5, a6, a7, a8, a4);
}

- (USApplicationUsageReport)initWithCanonicalBundleIdentifier:(id)a3 applicationUsageTrusted:(BOOL)a4 totalUsageTime:(double)a5 applicationUsageByBundleIdentifier:(id)a6 webUsageByDomain:(id)a7 userNotificationsByBundleIdentifier:(id)a8 pickupsByBundleIdentifier:(id)a9
{
  _BOOL8 v13;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  USApplicationUsageReport *v20;
  objc_super v22;

  v13 = a4;
  v22.receiver = self;
  v22.super_class = (Class)USApplicationUsageReport;
  v15 = a9;
  v16 = a8;
  v17 = a7;
  v18 = a6;
  v19 = a3;
  v20 = -[USApplicationUsageReport init](&v22, sel_init);
  -[USApplicationUsageReport _usApplicationUsageReportCommonInitWithCanonicalBundleIdentifier:applicationUsageTrusted:totalUsageTime:applicationUsageByBundleIdentifier:webUsageByDomain:userNotificationsByBundleIdentifier:pickupsByBundleIdentifier:](v20, "_usApplicationUsageReportCommonInitWithCanonicalBundleIdentifier:applicationUsageTrusted:totalUsageTime:applicationUsageByBundleIdentifier:webUsageByDomain:userNotificationsByBundleIdentifier:pickupsByBundleIdentifier:", v19, v13, v18, v17, v16, v15, a5, v22.receiver, v22.super_class);

  return v20;
}

- (void)_usApplicationUsageReportCommonInitWithCanonicalBundleIdentifier:(id)a3 applicationUsageTrusted:(BOOL)a4 totalUsageTime:(double)a5 applicationUsageByBundleIdentifier:(id)a6 webUsageByDomain:(id)a7 userNotificationsByBundleIdentifier:(id)a8 pickupsByBundleIdentifier:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  NSString *v20;
  NSString *canonicalBundleIdentifier;
  NSDictionary *v22;
  NSDictionary *applicationUsageByBundleIdentifier;
  NSDictionary *v24;
  NSDictionary *webUsageByDomain;
  NSDictionary *v26;
  NSDictionary *userNotificationsByBundleIdentifier;
  NSDictionary *v28;
  NSDictionary *pickupsByBundleIdentifier;

  v16 = a9;
  v17 = a8;
  v18 = a7;
  v19 = a6;
  v20 = (NSString *)objc_msgSend(a3, "copy");
  canonicalBundleIdentifier = self->_canonicalBundleIdentifier;
  self->_canonicalBundleIdentifier = v20;

  self->_applicationUsageTrusted = a4;
  self->_totalUsageTime = a5;
  v22 = (NSDictionary *)objc_msgSend(v19, "copy");

  applicationUsageByBundleIdentifier = self->_applicationUsageByBundleIdentifier;
  self->_applicationUsageByBundleIdentifier = v22;

  v24 = (NSDictionary *)objc_msgSend(v18, "copy");
  webUsageByDomain = self->_webUsageByDomain;
  self->_webUsageByDomain = v24;

  v26 = (NSDictionary *)objc_msgSend(v17, "copy");
  userNotificationsByBundleIdentifier = self->_userNotificationsByBundleIdentifier;
  self->_userNotificationsByBundleIdentifier = v26;

  v28 = (NSDictionary *)objc_msgSend(v16, "copy");
  pickupsByBundleIdentifier = self->_pickupsByBundleIdentifier;
  self->_pickupsByBundleIdentifier = v28;

}

- (USApplicationUsageReport)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  USApplicationUsageReport *v17;
  double v18;
  double v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  USApplicationUsageReport *v29;
  void *v30;
  objc_super v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  int v42;
  void *v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CanonicalBundleIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "containsValueForKey:", CFSTR("ApplicationUsageTrusted")))
    v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("ApplicationUsageTrusted"));
  else
    v6 = 1;
  v7 = objc_alloc(MEMORY[0x24BDBCF20]);
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = (void *)objc_msgSend(v7, "initWithObjects:", v8, v9, objc_opt_class(), 0);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("ApplicationUsageByBundleIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("BundleIdentifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("ApplicationUsage")))
    {
      v43 = v5;
      v12 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("ApplicationUsage"));
      objc_msgSend(v12, "numberWithDouble:");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v44[0] = v13;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v44, &v43, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = 0;
    }
  }
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("WebUsageByDomain"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v4, "containsValueForKey:", CFSTR("TotalUsageTime"));
  v16 = v15;
  if (v5 && v11 && v14 && v15)
  {
    v32.receiver = self;
    v32.super_class = (Class)USApplicationUsageReport;
    v17 = -[USApplicationUsageReport init](&v32, sel_init);
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("TotalUsageTime"));
    v19 = v18;
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("UserNotificationsByBundleIdentifier"));
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    v22 = (void *)MEMORY[0x24BDBD1B8];
    if (v20)
      v23 = (void *)v20;
    else
      v23 = (void *)MEMORY[0x24BDBD1B8];
    v24 = v23;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("PickupsByBundleIdentifier"));
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = (void *)v25;
    if (v25)
      v27 = (void *)v25;
    else
      v27 = v22;
    v28 = v27;

    -[USApplicationUsageReport _usApplicationUsageReportCommonInitWithCanonicalBundleIdentifier:applicationUsageTrusted:totalUsageTime:applicationUsageByBundleIdentifier:webUsageByDomain:userNotificationsByBundleIdentifier:pickupsByBundleIdentifier:](v17, "_usApplicationUsageReportCommonInitWithCanonicalBundleIdentifier:applicationUsageTrusted:totalUsageTime:applicationUsageByBundleIdentifier:webUsageByDomain:userNotificationsByBundleIdentifier:pickupsByBundleIdentifier:", v5, v6, v11, v14, v24, v28, v19);
    self = v17;
    v29 = self;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544386;
      v34 = v5;
      v35 = 1026;
      v36 = v6;
      v37 = 2114;
      v38 = v11;
      v39 = 2114;
      v40 = v14;
      v41 = 1026;
      v42 = v16;
      _os_log_error_impl(&dword_20D894000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to decode USApplicationUsageReport with canonicalBundleIdentifier: %{public}@, applicationUsageTrusted: %{public}d, applicationUsageByBundleIdentifier: %{public}@, webUsageByDomain: %{public}@, hasTotalUsageTime: %{public}d", buf, 0x2Cu);
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 4865, 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v30);

    v29 = 0;
  }

  return v29;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *canonicalBundleIdentifier;
  void *v5;
  id v6;

  canonicalBundleIdentifier = self->_canonicalBundleIdentifier;
  v6 = a3;
  objc_msgSend(v6, "encodeObject:forKey:", canonicalBundleIdentifier, CFSTR("CanonicalBundleIdentifier"));
  objc_msgSend(v6, "encodeBool:forKey:", self->_applicationUsageTrusted, CFSTR("ApplicationUsageTrusted"));
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("TotalUsageTime"), self->_totalUsageTime);
  objc_msgSend(v6, "encodeObject:forKey:", self->_applicationUsageByBundleIdentifier, CFSTR("ApplicationUsageByBundleIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_webUsageByDomain, CFSTR("WebUsageByDomain"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_userNotificationsByBundleIdentifier, CFSTR("UserNotificationsByBundleIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_pickupsByBundleIdentifier, CFSTR("PickupsByBundleIdentifier"));
  -[USApplicationUsageReport bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("BundleIdentifier"));

  -[USApplicationUsageReport applicationUsageTime](self, "applicationUsageTime");
  objc_msgSend(v6, "encodeDouble:forKey:", CFSTR("ApplicationUsage"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (unint64_t)totalUserNotifications
{
  void *v2;
  unint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[USApplicationUsageReport userNotificationsByBundleIdentifier](self, "userNotificationsByBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __50__USApplicationUsageReport_totalUserNotifications__block_invoke;
  v5[3] = &unk_24C7DB648;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v5);

  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __50__USApplicationUsageReport_totalUserNotifications__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend(a3, "unsignedIntegerValue");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

- (unint64_t)totalPickups
{
  void *v2;
  unint64_t v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[USApplicationUsageReport pickupsByBundleIdentifier](self, "pickupsByBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __40__USApplicationUsageReport_totalPickups__block_invoke;
  v5[3] = &unk_24C7DB648;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v5);

  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __40__USApplicationUsageReport_totalPickups__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;

  result = objc_msgSend(a3, "unsignedIntegerValue");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += result;
  return result;
}

- (double)applicationUsageTime
{
  void *v2;
  double v3;
  _QWORD v5[5];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[USApplicationUsageReport applicationUsageByBundleIdentifier](self, "applicationUsageByBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __48__USApplicationUsageReport_applicationUsageTime__block_invoke;
  v5[3] = &unk_24C7DB648;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v5);

  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

double __48__USApplicationUsageReport_applicationUsageTime__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  double v5;
  double result;

  objc_msgSend(a3, "doubleValue");
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = v5 + *(double *)(v4 + 24);
  *(double *)(v4 + 24) = result;
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v21[4];
  id v22;
  uint64_t *v23;
  _QWORD v24[4];
  id v25;
  uint64_t *v26;
  _QWORD v27[4];
  id v28;
  uint64_t *v29;
  _QWORD v30[4];
  id v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  objc_super v37;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v37.receiver = self;
  v37.super_class = (Class)USApplicationUsageReport;
  -[USApplicationUsageReport description](&v37, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[USApplicationUsageReport canonicalBundleIdentifier](self, "canonicalBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[USApplicationUsageReport applicationUsageTrusted](self, "applicationUsageTrusted");
  -[USApplicationUsageReport totalUsageTime](self, "totalUsageTime");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, CanonicalBundleIdentifier: %@, ApplicationUsageTrusted: %d, TotalUsageTime: %f, ApplicationUsageByBundleIdentifier: {"), v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 1;
  -[USApplicationUsageReport applicationUsageByBundleIdentifier](self, "applicationUsageByBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __39__USApplicationUsageReport_description__block_invoke;
  v30[3] = &unk_24C7DB670;
  v32 = &v33;
  v11 = v8;
  v31 = v11;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v30);

  objc_msgSend(v11, "appendString:", CFSTR("}, AssociatedWebUsage: {"));
  *((_BYTE *)v34 + 24) = 1;
  -[USApplicationUsageReport webUsageByDomain](self, "webUsageByDomain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v10;
  v27[1] = 3221225472;
  v27[2] = __39__USApplicationUsageReport_description__block_invoke_2;
  v27[3] = &unk_24C7DB670;
  v29 = &v33;
  v13 = v11;
  v28 = v13;
  objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v27);

  objc_msgSend(v13, "appendString:", CFSTR("}, UserNotificationsByBundleIdentifier: {"));
  *((_BYTE *)v34 + 24) = 1;
  -[USApplicationUsageReport userNotificationsByBundleIdentifier](self, "userNotificationsByBundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v10;
  v24[1] = 3221225472;
  v24[2] = __39__USApplicationUsageReport_description__block_invoke_3;
  v24[3] = &unk_24C7DB670;
  v26 = &v33;
  v15 = v13;
  v25 = v15;
  objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v24);

  objc_msgSend(v15, "appendString:", CFSTR("}, PickupsByBundleIdentifier: {"));
  *((_BYTE *)v34 + 24) = 1;
  -[USApplicationUsageReport pickupsByBundleIdentifier](self, "pickupsByBundleIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v10;
  v21[1] = 3221225472;
  v21[2] = __39__USApplicationUsageReport_description__block_invoke_4;
  v21[3] = &unk_24C7DB670;
  v23 = &v33;
  v17 = v15;
  v22 = v17;
  objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v21);

  objc_msgSend(v17, "appendString:", CFSTR("}"));
  v18 = v22;
  v19 = v17;

  _Block_object_dispose(&v33, 8);
  return v19;
}

uint64_t __39__USApplicationUsageReport_description__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  uint64_t result;

  v5 = a1 + 32;
  v4 = *(void **)(a1 + 32);
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v5 + 8) + 8) + 24))
    return objc_msgSend(v4, "appendFormat:", CFSTR(", %@: %@"), a2, a3);
  result = objc_msgSend(v4, "appendFormat:", CFSTR("%@: %@"), a2, a3);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  return result;
}

uint64_t __39__USApplicationUsageReport_description__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  uint64_t result;

  v5 = a1 + 32;
  v4 = *(void **)(a1 + 32);
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v5 + 8) + 8) + 24))
    return objc_msgSend(v4, "appendFormat:", CFSTR(", %@: %@"), a2, a3);
  result = objc_msgSend(v4, "appendFormat:", CFSTR("%@: %@"), a2, a3);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  return result;
}

uint64_t __39__USApplicationUsageReport_description__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  uint64_t result;

  v5 = a1 + 32;
  v4 = *(void **)(a1 + 32);
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v5 + 8) + 8) + 24))
    return objc_msgSend(v4, "appendFormat:", CFSTR(", %@: %@"), a2, a3);
  result = objc_msgSend(v4, "appendFormat:", CFSTR("%@: %@"), a2, a3);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  return result;
}

uint64_t __39__USApplicationUsageReport_description__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  uint64_t result;

  v5 = a1 + 32;
  v4 = *(void **)(a1 + 32);
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v5 + 8) + 8) + 24))
    return objc_msgSend(v4, "appendFormat:", CFSTR(", %@: %@"), a2, a3);
  result = objc_msgSend(v4, "appendFormat:", CFSTR("%@: %@"), a2, a3);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  return result;
}

- (NSString)canonicalBundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (BOOL)applicationUsageTrusted
{
  return self->_applicationUsageTrusted;
}

- (double)totalUsageTime
{
  return self->_totalUsageTime;
}

- (NSDictionary)applicationUsageByBundleIdentifier
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (NSDictionary)webUsageByDomain
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (NSDictionary)userNotificationsByBundleIdentifier
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setUserNotificationsByBundleIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 48);
}

- (NSDictionary)pickupsByBundleIdentifier
{
  return (NSDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPickupsByBundleIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pickupsByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_userNotificationsByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_webUsageByDomain, 0);
  objc_storeStrong((id *)&self->_applicationUsageByBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_canonicalBundleIdentifier, 0);
}

@end
