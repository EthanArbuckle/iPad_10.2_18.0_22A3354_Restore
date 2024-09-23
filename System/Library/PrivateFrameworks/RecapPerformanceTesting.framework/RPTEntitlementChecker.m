@implementation RPTEntitlementChecker

+ (RPTEntitlementChecker)checkerForCurrentProcess
{
  void *v2;
  RPTEntitlementChecker *v3;

  objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordForCurrentProcess");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = -[RPTEntitlementChecker initWithBundleRecord:]([RPTEntitlementChecker alloc], "initWithBundleRecord:", v2);
  else
    v3 = 0;

  return v3;
}

- (RPTEntitlementChecker)initWithBundleRecord:(id)a3
{
  id v5;
  RPTEntitlementChecker *v6;
  RPTEntitlementChecker *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RPTEntitlementChecker;
  v6 = -[RPTEntitlementChecker init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_bundleRecord, a3);

  return v7;
}

- (BOOL)checkWithError:(id *)a3
{
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char IsYes;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v5 = os_variant_allows_internal_security_policies();
  -[RPTEntitlementChecker bundleRecord](self, "bundleRecord");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "entitlements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKey:ofClass:", CFSTR("com.apple.private.hid.client.event-dispatch"), objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "BOOLValue");
    BSSettingFlagForBool();
  }

  IsYes = BSSettingFlagIsYes();
  if (v5)
  {
    objc_msgSend(v7, "objectForKey:ofClass:", CFSTR("com.apple.private.hid.client.event-dispatch.internal"), objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      objc_msgSend(v11, "BOOLValue");
      BSSettingFlagForBool();
    }

    if ((IsYes & 1) != 0)
    {
      IsYes = 1;
      goto LABEL_12;
    }
    IsYes = BSSettingFlagIsYes();
  }
  if (a3 && (IsYes & 1) == 0)
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0CB2D68];
    v17[0] = *MEMORY[0x1E0CB2D60];
    v17[1] = v14;
    v18[0] = CFSTR("Process is (likely) not entitled to create HID events.");
    v18[1] = CFSTR("HID client dispatch entitlement is missing.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", CFSTR("com.apple.RecapPerformanceTesting"), 2, v15);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    IsYes = 0;
  }
LABEL_12:

  return IsYes;
}

- (LSBundleRecord)bundleRecord
{
  return self->_bundleRecord;
}

- (void)setBundleRecord:(id)a3
{
  objc_storeStrong((id *)&self->_bundleRecord, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleRecord, 0);
}

@end
