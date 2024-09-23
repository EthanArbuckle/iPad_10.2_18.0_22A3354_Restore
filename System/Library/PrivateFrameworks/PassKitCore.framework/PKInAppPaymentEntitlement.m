@implementation PKInAppPaymentEntitlement

- (PKInAppPaymentEntitlement)initWithToken:(id *)a3
{
  PKInAppPaymentEntitlement *v4;
  PKInAppPaymentEntitlement *v5;
  __int128 v6;
  _OWORD v8[2];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKInAppPaymentEntitlement;
  v4 = -[PKInAppPaymentEntitlement init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v6 = *(_OWORD *)&a3->var0[4];
    v8[0] = *(_OWORD *)a3->var0;
    v8[1] = v6;
    -[PKInAppPaymentEntitlement _probeEntitlementsWithToken:](v4, "_probeEntitlementsWithToken:", v8);
  }
  return v5;
}

- (BOOL)hasMerchantIdentifier:(id)a3
{
  return -[NSArray containsObject:](self->_merchantIdentifiers, "containsObject:", a3);
}

- (BOOL)hasMerchantIdentifiers
{
  return -[NSArray count](self->_merchantIdentifiers, "count") != 0;
}

- (void)_probeEntitlementsWithToken:(id *)a3
{
  const __CFAllocator *v4;
  __int128 v5;
  __SecTask *v6;
  __SecTask *v7;
  CFTypeRef v8;
  CFErrorRef v9;
  NSObject *v10;
  NSObject *v11;
  CFTypeID v12;
  BOOL v13;
  CFTypeRef v14;
  CFErrorRef v15;
  NSObject *v16;
  CFTypeID v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSArray *v28;
  NSArray *merchantIdentifiers;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  CFErrorRef error;
  _BYTE v35[128];
  audit_token_t token;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v5 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)token.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&token.val[4] = v5;
  v6 = SecTaskCreateWithAuditToken(v4, &token);
  if (v6)
  {
    v7 = v6;
    error = 0;
    v8 = SecTaskCopyValueForEntitlement(v6, CFSTR("com.apple.private.in-app-payments"), &error);
    v9 = error;
    if (error)
    {
      PKLogFacilityTypeGetObject(7uLL);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        token.val[0] = 138412290;
        *(_QWORD *)&token.val[1] = v9;
        _os_log_impl(&dword_18FC92000, v10, OS_LOG_TYPE_DEFAULT, "Failed to get entitlements: %@", (uint8_t *)&token, 0xCu);
      }

      CFRelease(error);
    }
    if (v8)
    {
      PKLogFacilityTypeGetObject(7uLL);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(token.val[0]) = 0;
        _os_log_impl(&dword_18FC92000, v11, OS_LOG_TYPE_DEFAULT, "Client has ignore merchant identifiers entitlement", (uint8_t *)&token, 2u);
      }

      v12 = CFGetTypeID(v8);
      v13 = v12 == CFBooleanGetTypeID() && CFBooleanGetValue((CFBooleanRef)v8) != 0;
      self->_ignoreMerchantIdentifiers = v13;
      CFRelease(v8);
    }
    v14 = SecTaskCopyValueForEntitlement(v7, CFSTR("com.apple.developer.in-app-payments"), &error);
    v15 = error;
    if (error)
    {
      PKLogFacilityTypeGetObject(7uLL);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        token.val[0] = 138412290;
        *(_QWORD *)&token.val[1] = v15;
        _os_log_impl(&dword_18FC92000, v16, OS_LOG_TYPE_DEFAULT, "Failed to get entitlements: %@", (uint8_t *)&token, 0xCu);
      }

      CFRelease(error);
    }
    if (v14)
    {
      v17 = CFGetTypeID(v14);
      if (v17 == CFArrayGetTypeID())
        v18 = (void *)v14;
      else
        v18 = 0;
      v19 = v18;
      PKLogFacilityTypeGetObject(7uLL);
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        token.val[0] = 138412290;
        *(_QWORD *)&token.val[1] = v19;
        _os_log_impl(&dword_18FC92000, v20, OS_LOG_TYPE_DEFAULT, "Client has merchant identifiers: %@", (uint8_t *)&token, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      v33 = 0u;
      v22 = v19;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v31;
        do
        {
          v26 = 0;
          do
          {
            if (*(_QWORD *)v31 != v25)
              objc_enumerationMutation(v22);
            v27 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v26);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              objc_msgSend(v21, "addObject:", v27, (_QWORD)v30);
            ++v26;
          }
          while (v24 != v26);
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
        }
        while (v24);
      }

      CFRelease(v14);
      v28 = (NSArray *)objc_msgSend(v21, "copy");
      merchantIdentifiers = self->_merchantIdentifiers;
      self->_merchantIdentifiers = v28;

    }
    CFRelease(v7);
  }
}

- (BOOL)ignoreMerchantIdentifiers
{
  return self->_ignoreMerchantIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_merchantIdentifiers, 0);
}

@end
