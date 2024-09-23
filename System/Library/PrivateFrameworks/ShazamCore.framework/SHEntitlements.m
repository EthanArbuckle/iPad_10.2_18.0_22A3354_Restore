@implementation SHEntitlements

- (SHEntitlements)init
{
  SHEntitlements *v2;
  SecTaskRef v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SHEntitlements;
  v2 = -[SHEntitlements init](&v5, sel_init);
  if (v2)
  {
    v3 = SecTaskCreateFromSelf(0);
    -[SHEntitlements configureEntitlementsForTask:](v2, "configureEntitlementsForTask:", v3);
    CFRelease(v3);
  }
  return v2;
}

- (SHEntitlements)initWithConnection:(id)a3
{
  id v4;
  SHEntitlements *v5;
  SHEntitlements *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SHEntitlements;
  v5 = -[SHEntitlements init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[SHEntitlements configureEntitlementsForConnection:](v5, "configureEntitlementsForConnection:", v4);

  return v6;
}

- (void)configureEntitlementsForTask:(__SecTask *)a3
{
  self->_isEntitledForStorefront = -[SHEntitlements entitlementArray:containsEntitlementValue:fromSecTask:](self, "entitlementArray:containsEntitlementValue:fromSecTask:", CFSTR("com.apple.private.tcc.allow"), CFSTR("kTCCServiceMediaLibrary"), a3);
  self->_isEntitledForMicrophone = -[SHEntitlements entitlementArray:containsEntitlementValue:fromSecTask:](self, "entitlementArray:containsEntitlementValue:fromSecTask:", CFSTR("com.apple.private.tcc.allow"), CFSTR("kTCCServiceMicrophone"), a3);
  self->_isEntitledForInternalClient = -[SHEntitlements BOOLValueOfEntitlement:fromSecTask:](self, "BOOLValueOfEntitlement:fromSecTask:", CFSTR("com.apple.private.ShazamKit"), a3);
}

- (void)configureEntitlementsForConnection:(id)a3
{
  BOOL v4;
  id v5;

  v5 = a3;
  self->_isEntitledForStorefront = -[SHEntitlements entitlementArray:containsEntitlementValue:fromConnection:](self, "entitlementArray:containsEntitlementValue:fromConnection:", CFSTR("com.apple.private.tcc.allow"), CFSTR("kTCCServiceMediaLibrary"), v5);
  v4 = -[SHEntitlements entitlementArray:containsEntitlementValue:fromConnection:](self, "entitlementArray:containsEntitlementValue:fromConnection:", CFSTR("com.apple.private.tcc.allow"), CFSTR("kTCCServiceMicrophone"), v5)|| -[SHEntitlements tccBoolValueOfEntitlement:fromConnection:](self, "tccBoolValueOfEntitlement:fromConnection:", CFSTR("kTCCServiceMicrophone"), v5);
  self->_isEntitledForMicrophone = v4;
  self->_isEntitledForInternalClient = -[SHEntitlements BOOLValueOfEntitlement:fromConnection:](self, "BOOLValueOfEntitlement:fromConnection:", CFSTR("com.apple.private.ShazamKit"), v5);

}

- (BOOL)hasRequiredEntitlements:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SHEntitlements isEntitledForStorefront](self, "isEntitledForStorefront"))
    objc_msgSend(v5, "addObject:", CFSTR("kTCCServiceMediaLibrary"));
  if (-[SHEntitlements isEntitledForMicrophone](self, "isEntitledForMicrophone"))
    objc_msgSend(v5, "addObject:", CFSTR("kTCCServiceMicrophone"));
  if (-[SHEntitlements isEntitledForInternalClient](self, "isEntitledForInternalClient"))
    objc_msgSend(v5, "addObject:", CFSTR("com.apple.private.ShazamKit"));
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isSubsetOfSet:", v5);

  return v7;
}

- (BOOL)BOOLValueOfEntitlement:(id)a3 fromConnection:(id)a4
{
  void *v4;
  char v5;

  objc_msgSend(a4, "valueForEntitlement:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = objc_msgSend(v4, "BOOLValue");
  else
    v5 = 0;

  return v5;
}

- (BOOL)entitlementArray:(id)a3 containsEntitlementValue:(id)a4 fromConnection:(id)a5
{
  id v7;
  void *v8;
  char v9;

  v7 = a4;
  objc_msgSend(a5, "valueForEntitlement:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    v9 = objc_msgSend(v8, "containsObject:", v7);
  else
    v9 = 0;

  return v9;
}

- (BOOL)tccBoolValueOfEntitlement:(id)a3 fromConnection:(id)a4
{
  id v5;
  BOOL v6;

  v5 = a3;
  if (a4)
    objc_msgSend(a4, "auditToken");
  v6 = tcc_authorization_check_audit_token() == 2;

  return v6;
}

- (void)copyValueOfEntitlement:(id)a3 fromSecTask:(__SecTask *)a4
{
  CFTypeRef v4;
  NSObject *v5;
  CFErrorRef error;
  uint8_t buf[4];
  CFErrorRef v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  error = 0;
  v4 = SecTaskCopyValueForEntitlement(a4, (CFStringRef)a3, &error);
  if (error)
  {
    shcore_log_object();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v9 = error;
      _os_log_impl(&dword_21AB5E000, v5, OS_LOG_TYPE_ERROR, "Client does not have entitlement: %@", buf, 0xCu);
    }

    CFRelease(error);
  }
  return (void *)v4;
}

- (BOOL)BOOLValueOfEntitlement:(id)a3 fromSecTask:(__SecTask *)a4
{
  const __CFBoolean *v4;
  const __CFBoolean *v5;
  CFTypeID v6;
  BOOL v7;

  v4 = -[SHEntitlements copyValueOfEntitlement:fromSecTask:](self, "copyValueOfEntitlement:fromSecTask:", a3, a4);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = CFGetTypeID(v4);
  v7 = v6 == CFBooleanGetTypeID() && CFBooleanGetValue(v5) != 0;
  CFRelease(v5);
  return v7;
}

- (BOOL)entitlementArray:(id)a3 containsEntitlementValue:(id)a4 fromSecTask:(__SecTask *)a5
{
  id v8;
  void *v9;
  void *v10;
  CFTypeID v11;
  char v12;

  v8 = a4;
  v9 = -[SHEntitlements copyValueOfEntitlement:fromSecTask:](self, "copyValueOfEntitlement:fromSecTask:", a3, a5);
  if (v9)
  {
    v10 = v9;
    v11 = CFGetTypeID(v9);
    if (v11 == CFArrayGetTypeID())
      v12 = objc_msgSend(v10, "containsObject:", v8);
    else
      v12 = 0;
    CFRelease(v10);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)isEntitledForStorefront
{
  return self->_isEntitledForStorefront;
}

- (void)setIsEntitledForStorefront:(BOOL)a3
{
  self->_isEntitledForStorefront = a3;
}

- (BOOL)isEntitledForMicrophone
{
  return self->_isEntitledForMicrophone;
}

- (BOOL)isEntitledForInternalClient
{
  return self->_isEntitledForInternalClient;
}

@end
