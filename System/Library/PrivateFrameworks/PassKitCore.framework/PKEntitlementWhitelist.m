@implementation PKEntitlementWhitelist

- (BOOL)paymentAllAccess
{
  return self->_paymentAllAccess;
}

- (PKEntitlementWhitelist)initWithConnection:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  PKEntitlementWhitelist *v7;
  _OWORD v9[2];
  __int128 v10;
  __int128 v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x19400CFE8]();
  if (v4)
  {
    v6 = objc_msgSend(v4, "processIdentifier");
    v10 = 0u;
    v11 = 0u;
    objc_msgSend(v4, "auditToken");
  }
  else
  {
    v10 = 0u;
    v11 = 0u;
    v6 = 0xFFFFFFFFLL;
  }
  v9[0] = v10;
  v9[1] = v11;
  v7 = -[PKEntitlementWhitelist initWithProcessIdentifier:auditToken:](self, "initWithProcessIdentifier:auditToken:", v6, v9);
  objc_autoreleasePoolPop(v5);

  return v7;
}

- (PKEntitlementWhitelist)initWithProcessIdentifier:(int)a3 auditToken:(id *)a4
{
  PKEntitlementWhitelist *v6;
  PKEntitlementWhitelist *v7;
  __int128 v8;
  NSObject *v9;
  objc_super v11;
  uint8_t buf[16];
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)PKEntitlementWhitelist;
  v6 = -[PKEntitlementWhitelist init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_processIdentifier = a3;
    v8 = *(_OWORD *)&a4->var0[4];
    *(_OWORD *)buf = *(_OWORD *)a4->var0;
    v13 = v8;
    if (!-[PKEntitlementWhitelist _probeEntitlementsWithAuditToken:](v6, "_probeEntitlementsWithAuditToken:", buf))
    {
      PKLogFacilityTypeGetObject(0);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = a3;
        _os_log_error_impl(&dword_18FC92000, v9, OS_LOG_TYPE_ERROR, "Failed to probe entitlements for process: %lu.", buf, 0xCu);
      }

    }
  }
  return v7;
}

- (BOOL)_probeEntitlementsWithAuditToken:(id *)a3
{
  const __CFAllocator *v4;
  __int128 v5;
  SecTaskRef v6;
  void *v7;
  NSString *v8;
  NSString *applicationID;
  BOOL v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSString *v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  NSArray *v26;
  NSArray *merchantIdentifiers;
  NSObject *v28;
  NSArray *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  id v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t k;
  uint64_t v59;
  uint64_t v60;
  NSArray *teamIDs;
  uint64_t v62;
  NSArray *passTypeIDs;
  NSArray *passTypeIDPrefixes;
  void *v66;
  PKEntitlementWhitelist *v67;
  __SecTask *v68;
  void *v69;
  id v70;
  uint64_t v71;
  id obj;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  _QWORD v85[5];
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _BYTE v90[128];
  _BYTE v91[128];
  _BYTE v92[128];
  _BYTE v93[128];
  audit_token_t token;
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v5 = *(_OWORD *)&a3->var0[4];
  *(_OWORD *)token.val = *(_OWORD *)a3->var0;
  *(_OWORD *)&token.val[4] = v5;
  v6 = SecTaskCreateWithAuditToken(v4, &token);
  if (v6)
  {
    self->_passesAllAccess = -[PKEntitlementWhitelist _BOOLValueOfEntitlement:fromSecTask:](self, "_BOOLValueOfEntitlement:fromSecTask:", CFSTR("com.apple.cards.all-access"), v6);
    self->_passesOverviewAccess = -[PKEntitlementWhitelist _BOOLValueOfEntitlement:fromSecTask:](self, "_BOOLValueOfEntitlement:fromSecTask:", CFSTR("com.apple.cards.overview-access"), v6);
    self->_passesEntangledAccess = -[PKEntitlementWhitelist _BOOLValueOfEntitlement:fromSecTask:](self, "_BOOLValueOfEntitlement:fromSecTask:", CFSTR("com.apple.passes.entangled-access"), v6);
    self->_passesAddSilently = -[PKEntitlementWhitelist _BOOLValueOfEntitlement:fromSecTask:](self, "_BOOLValueOfEntitlement:fromSecTask:", CFSTR("com.apple.passes.add-silently"), v6);
    self->_passesAddUnsigned = -[PKEntitlementWhitelist _BOOLValueOfEntitlement:fromSecTask:](self, "_BOOLValueOfEntitlement:fromSecTask:", CFSTR("com.apple.passes.add-unsigned"), v6);
    self->_passPresentationSuppression = -[PKEntitlementWhitelist _BOOLValueOfEntitlement:fromSecTask:](self, "_BOOLValueOfEntitlement:fromSecTask:", CFSTR("com.apple.developer.passkit.pass-presentation-suppression"), v6);
    self->_passPresentationSuppressionFromBackground = -[PKEntitlementWhitelist _BOOLValueOfEntitlement:fromSecTask:](self, "_BOOLValueOfEntitlement:fromSecTask:", CFSTR("com.apple.private.passkit.pass-presentation-suppress-from-background"), v6);
    self->_paymentConfiguration = -[PKEntitlementWhitelist _BOOLValueOfEntitlement:fromSecTask:](self, "_BOOLValueOfEntitlement:fromSecTask:", CFSTR("com.apple.payment.configuration"), v6);
    self->_paymentPresentation = -[PKEntitlementWhitelist _BOOLValueOfEntitlement:fromSecTask:](self, "_BOOLValueOfEntitlement:fromSecTask:", CFSTR("com.apple.payment.presentation"), v6);
    self->_paymentAllAccess = -[PKEntitlementWhitelist _BOOLValueOfEntitlement:fromSecTask:](self, "_BOOLValueOfEntitlement:fromSecTask:", CFSTR("com.apple.payment.all-access"), v6);
    self->_applePayTrustAllAccess = -[PKEntitlementWhitelist _BOOLValueOfEntitlement:fromSecTask:](self, "_BOOLValueOfEntitlement:fromSecTask:", CFSTR("com.apple.apple-pay-trust.all-access"), v6);
    self->_inAppPaymentsPrivate = -[PKEntitlementWhitelist _BOOLValueOfEntitlement:fromSecTask:](self, "_BOOLValueOfEntitlement:fromSecTask:", CFSTR("com.apple.private.in-app-payments"), v6);
    self->_cardOnFilePayments = -[PKEntitlementWhitelist _BOOLValueOfEntitlement:fromSecTask:](self, "_BOOLValueOfEntitlement:fromSecTask:", CFSTR("com.apple.payment.card-on-file"), v6);
    self->_externalizedContextPayments = -[PKEntitlementWhitelist _BOOLValueOfEntitlement:fromSecTask:](self, "_BOOLValueOfEntitlement:fromSecTask:", CFSTR("com.apple.payment.externalized-context"), v6);
    self->_trustedDeviceEnrollmentInfo = -[PKEntitlementWhitelist _BOOLValueOfEntitlement:fromSecTask:](self, "_BOOLValueOfEntitlement:fromSecTask:", CFSTR("com.apple.private.passkit.trusted-device-enrollment-info"), v6);
    self->_peerPaymentAllAccess = -[PKEntitlementWhitelist _BOOLValueOfEntitlement:fromSecTask:](self, "_BOOLValueOfEntitlement:fromSecTask:", CFSTR("com.apple.peerpayment.all-access"), v6);
    -[PKEntitlementWhitelist _stringValueOfEntitlement:fromSecTask:](self, "_stringValueOfEntitlement:fromSecTask:", CFSTR("application-identifier"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (NSString *)objc_msgSend(v7, "copy");
    applicationID = self->_applicationID;
    self->_applicationID = v8;

    self->_AMPCardEnrollment = -[PKEntitlementWhitelist _BOOLValueOfEntitlement:fromSecTask:](self, "_BOOLValueOfEntitlement:fromSecTask:", CFSTR("com.apple.payment.amp-card-enrollment"), v6);
    self->_searchAllAccess = -[PKEntitlementWhitelist _BOOLValueOfEntitlement:fromSecTask:](self, "_BOOLValueOfEntitlement:fromSecTask:", CFSTR("com.apple.passkit.search.all-access"), v6);
    v10 = -[PKEntitlementWhitelist _BOOLValueOfEntitlement:fromSecTask:](self, "_BOOLValueOfEntitlement:fromSecTask:", CFSTR("com.apple.features.all-access"), v6)|| -[PKEntitlementWhitelist _BOOLValueOfEntitlement:fromSecTask:](self, "_BOOLValueOfEntitlement:fromSecTask:", CFSTR("com.apple.wallet.features.all-access"), v6);
    self->_featuresAllAccess = v10;
    self->_secureElementPassProvisioning = -[PKEntitlementWhitelist _BOOLValueOfEntitlement:fromSecTask:](self, "_BOOLValueOfEntitlement:fromSecTask:", CFSTR("com.apple.developer.contactless-payment-pass-provisioning"), v6);
    self->_secureElementPassProvisioningForMAIDs = -[PKEntitlementWhitelist _BOOLValueOfEntitlement:fromSecTask:](self, "_BOOLValueOfEntitlement:fromSecTask:", CFSTR("com.apple.developer.contactless-payment-pass-provisioning.maids"), v6);
    -[PKEntitlementWhitelist _arrayValueOfEntitlement:fromSecTask:](self, "_arrayValueOfEntitlement:fromSecTask:", CFSTR("com.apple.developer.contactless-payment-pass-provisioning"), v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    self->_shareableCredentialProvisioning = objc_msgSend(v11, "containsObject:", CFSTR("shareablecredential"));

    -[PKEntitlementWhitelist _arrayValueOfEntitlement:fromSecTask:](self, "_arrayValueOfEntitlement:fromSecTask:", CFSTR("com.apple.developer.contactless-payment-pass-provisioning"), v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    self->_carKeyCredentialProvisioning = objc_msgSend(v12, "containsObject:", CFSTR("carkey"));

    self->_paymentPassProvisioning = -[PKEntitlementWhitelist _BOOLValueOfEntitlement:fromSecTask:](self, "_BOOLValueOfEntitlement:fromSecTask:", CFSTR("com.apple.developer.payment-pass-provisioning"), v6);
    if (self->_secureElementPassProvisioning)
    {
      self->_secureElementPassProvisioning = 1;
    }
    else
    {
      -[PKEntitlementWhitelist _arrayValueOfEntitlement:fromSecTask:](self, "_arrayValueOfEntitlement:fromSecTask:", CFSTR("com.apple.developer.contactless-payment-pass-provisioning"), v6);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      self->_secureElementPassProvisioning = objc_msgSend(v13, "containsObject:", CFSTR("carkey"));

    }
    self->_credentialStateAccess = -[PKEntitlementWhitelist _BOOLValueOfEntitlement:fromSecTask:](self, "_BOOLValueOfEntitlement:fromSecTask:", CFSTR("com.apple.private.credential-state-access"), v6);
    self->_sharingAllAccess = -[PKEntitlementWhitelist _BOOLValueOfEntitlement:fromSecTask:](self, "_BOOLValueOfEntitlement:fromSecTask:", CFSTR("com.apple.private.sharing.all-access"), v6);
    self->_appleMediaServicesPrivate = -[PKEntitlementWhitelist _BOOLValueOfEntitlement:fromSecTask:](self, "_BOOLValueOfEntitlement:fromSecTask:", CFSTR("com.apple.private.applemediaservices"), v6);
    self->_carKeyPassThroughAccess = -[PKEntitlementWhitelist _BOOLValueOfEntitlement:fromSecTask:](self, "_BOOLValueOfEntitlement:fromSecTask:", CFSTR("com.apple.developer.car-key-passthrough-access"), v6);
    -[PKEntitlementWhitelist _arrayValueOfEntitlement:fromSecTask:](self, "_arrayValueOfEntitlement:fromSecTask:", CFSTR("com.apple.developer.pay-later-merchandising"), v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    self->_payLaterPayInFourMerchandising = objc_msgSend(v14, "containsObject:", CFSTR("payinfour-merchandising"));

    self->_remoteNetworkPaymentInitiate = -[PKEntitlementWhitelist _BOOLValueOfEntitlement:fromSecTask:](self, "_BOOLValueOfEntitlement:fromSecTask:", CFSTR("com.apple.private.payment.remote-network-payment-initiate"), v6);
    -[PKEntitlementWhitelist _stringValueOfEntitlement:fromSecTask:](self, "_stringValueOfEntitlement:fromSecTask:", CFSTR("com.apple.developer.team-identifier"), v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v15)
    {
      v16 = self->_applicationID;
      if (v16 && (v17 = -[NSString rangeOfString:](v16, "rangeOfString:", CFSTR(".")), v17 != 0x7FFFFFFFFFFFFFFFLL))
      {
        -[NSString substringToIndex:](self->_applicationID, "substringToIndex:", v17);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = 0;
      }
    }
    if ((unint64_t)objc_msgSend(v15, "length") <= 9)
    {

      v15 = 0;
    }
    objc_storeStrong((id *)&self->_developerTeamID, v15);
    -[PKEntitlementWhitelist _arrayValueOfEntitlement:fromSecTask:](self, "_arrayValueOfEntitlement:fromSecTask:", CFSTR("com.apple.developer.in-app-payments"), v6);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v69 = v18;
    if (v18)
    {
      self->_inAppPayments = 1;
      v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v86 = 0u;
      v87 = 0u;
      v88 = 0u;
      v89 = 0u;
      v20 = v18;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v86, v93, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v87;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v87 != v23)
              objc_enumerationMutation(v20);
            v25 = *(_QWORD *)(*((_QWORD *)&v86 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              objc_msgSend(v19, "addObject:", v25);
          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v86, v93, 16);
        }
        while (v22);
      }

      v26 = (NSArray *)objc_msgSend(v19, "copy");
      merchantIdentifiers = self->_merchantIdentifiers;
      self->_merchantIdentifiers = v26;

      PKLogFacilityTypeGetObject(4uLL);
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        v29 = self->_merchantIdentifiers;
        token.val[0] = 138412290;
        *(_QWORD *)&token.val[1] = v29;
        _os_log_impl(&dword_18FC92000, v28, OS_LOG_TYPE_INFO, "Client has in-app payments entitlement for identifiers: %@", (uint8_t *)&token, 0xCu);
      }

      v18 = v69;
    }
    self->_winterpegPayments = -[PKEntitlementWhitelist _BOOLValueOfEntitlement:fromSecTask:](self, "_BOOLValueOfEntitlement:fromSecTask:", CFSTR("com.apple.payment.winterpeg"), v6);
    self->_webPayments = -[PKEntitlementWhitelist _BOOLValueOfEntitlement:fromSecTask:](self, "_BOOLValueOfEntitlement:fromSecTask:", CFSTR("com.apple.developer.web-payments"), v6);
    -[PKEntitlementWhitelist _arrayValueOfEntitlement:fromSecTask:](self, "_arrayValueOfEntitlement:fromSecTask:", CFSTR("com.apple.developer.pass-type-identifiers"), v6);
    v30 = objc_claimAutoreleasedReturnValue();
    if (v30)
    {
      v31 = (void *)v30;
      v66 = v15;
      v67 = self;
      v68 = v6;
      v32 = objc_opt_class();
      v85[0] = MEMORY[0x1E0C809B0];
      v85[1] = 3221225472;
      v85[2] = __59__PKEntitlementWhitelist__probeEntitlementsWithAuditToken___block_invoke;
      v85[3] = &__block_descriptor_40_e25_B32__0__NSString_8Q16_B24lu32l8;
      v85[4] = v32;
      objc_msgSend(v31, "pk_objectsPassingTest:", v85);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      v34 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v70 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v81 = 0u;
      v82 = 0u;
      v83 = 0u;
      v84 = 0u;
      obj = v33;
      v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v92, 16);
      if (v35)
      {
        v36 = v35;
        v37 = *(_QWORD *)v82;
        do
        {
          for (j = 0; j != v36; ++j)
          {
            if (*(_QWORD *)v82 != v37)
              objc_enumerationMutation(obj);
            v39 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * j);
            v40 = objc_msgSend(v39, "rangeOfString:", CFSTR("."), v66);
            if (v40 != 0x7FFFFFFFFFFFFFFFLL)
            {
              v41 = v40;
              objc_msgSend(v39, "substringToIndex:", v40);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v42, "length"))
              {
                objc_msgSend(v39, "substringFromIndex:", v41 + 1);
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v43, "length"))
                {
                  if (objc_msgSend(v43, "isEqualToString:", CFSTR("*")))
                  {
                    objc_msgSend(v34, "addObject:", v42);
                  }
                  else
                  {
                    objc_msgSend(v70, "objectForKeyedSubscript:", v42);
                    v44 = (id)objc_claimAutoreleasedReturnValue();
                    if (!v44)
                    {
                      v44 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
                      objc_msgSend(v70, "setObject:forKeyedSubscript:", v44, v42);
                    }
                    objc_msgSend(v44, "addObject:", v43);

                  }
                }

              }
            }
          }
          v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v81, v92, 16);
        }
        while (v36);
      }

      v45 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v77 = 0u;
      v78 = 0u;
      v79 = 0u;
      v80 = 0u;
      v46 = v70;
      v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v77, v91, 16);
      if (v47)
      {
        v48 = v47;
        v49 = *(_QWORD *)v78;
        do
        {
          v50 = 0;
          v71 = v48;
          do
          {
            if (*(_QWORD *)v78 != v49)
              objc_enumerationMutation(v46);
            v51 = *(_QWORD *)(*((_QWORD *)&v77 + 1) + 8 * v50);
            if ((objc_msgSend(v34, "containsObject:", v51, v66) & 1) == 0)
            {
              v52 = v34;
              v75 = 0u;
              v76 = 0u;
              v73 = 0u;
              v74 = 0u;
              v53 = v46;
              objc_msgSend(v46, "objectForKeyedSubscript:", v51);
              v54 = (void *)objc_claimAutoreleasedReturnValue();
              v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v73, v90, 16);
              if (v55)
              {
                v56 = v55;
                v57 = *(_QWORD *)v74;
                do
                {
                  for (k = 0; k != v56; ++k)
                  {
                    if (*(_QWORD *)v74 != v57)
                      objc_enumerationMutation(v54);
                    v59 = *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * k);
                    if ((objc_msgSend(v45, "containsObject:", v59) & 1) == 0)
                      objc_msgSend(v45, "addObject:", v59);
                  }
                  v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v73, v90, 16);
                }
                while (v56);
              }

              v34 = v52;
              v46 = v53;
              v48 = v71;
            }
            ++v50;
          }
          while (v50 != v48);
          v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v77, v91, 16);
        }
        while (v48);
      }

      v60 = objc_msgSend(v34, "copy");
      teamIDs = v67->_teamIDs;
      v67->_teamIDs = (NSArray *)v60;

      v62 = objc_msgSend(v45, "copy");
      passTypeIDs = v67->_passTypeIDs;
      v67->_passTypeIDs = (NSArray *)v62;

      passTypeIDPrefixes = v67->_passTypeIDPrefixes;
      v67->_passTypeIDPrefixes = (NSArray *)MEMORY[0x1E0C9AA60];

      v6 = v68;
      v18 = v69;
      v15 = v66;
    }
    CFRelease(v6);

  }
  return v6 != 0;
}

- (BOOL)_BOOLValueOfEntitlement:(id)a3 fromSecTask:(__SecTask *)a4
{
  const __CFBoolean *v4;
  const __CFBoolean *v5;
  CFTypeID v6;
  BOOL v7;

  v4 = -[PKEntitlementWhitelist _copyValueOfEntitlement:fromSecTask:](self, "_copyValueOfEntitlement:fromSecTask:", a3, a4);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = CFGetTypeID(v4);
  v7 = v6 == CFBooleanGetTypeID() && CFBooleanGetValue(v5) != 0;
  CFRelease(v5);
  return v7;
}

- (void)_copyValueOfEntitlement:(id)a3 fromSecTask:(__SecTask *)a4
{
  __CFString *v6;
  CFTypeRef v7;
  CFErrorRef v8;
  NSObject *v9;
  uint64_t processIdentifier;
  CFErrorRef error;
  uint8_t buf[4];
  __CFString *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  CFErrorRef v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = (__CFString *)a3;
  error = 0;
  v7 = SecTaskCopyValueForEntitlement(a4, v6, &error);
  v8 = error;
  if (error)
  {
    PKLogFacilityTypeGetObject(4uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      processIdentifier = self->_processIdentifier;
      *(_DWORD *)buf = 138412802;
      v14 = v6;
      v15 = 2048;
      v16 = processIdentifier;
      v17 = 2112;
      v18 = v8;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Failed to copy value of entitlement: %@ process: %lu error: %@", buf, 0x20u);
    }

    CFRelease(error);
  }

  return (void *)v7;
}

- (id)_arrayValueOfEntitlement:(id)a3 fromSecTask:(__SecTask *)a4
{
  void *v4;
  void *v5;
  CFTypeID v6;

  v4 = -[PKEntitlementWhitelist _copyValueOfEntitlement:fromSecTask:](self, "_copyValueOfEntitlement:fromSecTask:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v6 = CFGetTypeID(v4);
    if (v6 != CFArrayGetTypeID())
    {
      CFRelease(v5);
      v5 = 0;
    }
  }
  return v5;
}

- (id)_stringValueOfEntitlement:(id)a3 fromSecTask:(__SecTask *)a4
{
  void *v4;
  void *v5;
  CFTypeID v6;

  v4 = -[PKEntitlementWhitelist _copyValueOfEntitlement:fromSecTask:](self, "_copyValueOfEntitlement:fromSecTask:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v6 = CFGetTypeID(v4);
    if (v6 != CFStringGetTypeID())
    {
      CFRelease(v5);
      v5 = 0;
    }
  }
  return v5;
}

- (BOOL)passesAllAccess
{
  return self->_passesAllAccess;
}

- (BOOL)secureElementPassProvisioningForMAIDs
{
  return self->_secureElementPassProvisioningForMAIDs;
}

- (BOOL)peerPaymentAllAccess
{
  return self->_peerPaymentAllAccess;
}

- (BOOL)passesAddUnsigned
{
  return self->_passesAddUnsigned;
}

uint64_t __59__PKEntitlementWhitelist__probeEntitlementsWithAuditToken___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passTypeIDPrefixes, 0);
  objc_storeStrong((id *)&self->_passTypeIDs, 0);
  objc_storeStrong((id *)&self->_teamIDs, 0);
  objc_storeStrong((id *)&self->_merchantIdentifiers, 0);
  objc_storeStrong((id *)&self->_developerTeamID, 0);
  objc_storeStrong((id *)&self->_applicationID, 0);
}

- (PKEntitlementWhitelist)init
{

  return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)allAccess
{
  return self->_passesAllAccess;
}

- (BOOL)supportsWebPayments
{
  return self->_webPayments || self->_winterpegPayments || self->_inAppPaymentsPrivate || self->_paymentAllAccess;
}

- (BOOL)shareableCredentialProvisioning
{
  return self->_shareableCredentialProvisioning || self->_secureElementPassProvisioning;
}

- (BOOL)carKeyCredentialProvisioning
{
  return self->_carKeyCredentialProvisioning || self->_secureElementPassProvisioning;
}

- (BOOL)passesOverviewAccess
{
  return self->_passesOverviewAccess;
}

- (BOOL)passesEntangledAccess
{
  return self->_passesEntangledAccess;
}

- (BOOL)passesAddSilently
{
  return self->_passesAddSilently;
}

- (BOOL)passPresentationSuppression
{
  return self->_passPresentationSuppression;
}

- (BOOL)passPresentationSuppressionFromBackground
{
  return self->_passPresentationSuppressionFromBackground;
}

- (BOOL)paymentConfiguration
{
  return self->_paymentConfiguration;
}

- (BOOL)paymentPresentation
{
  return self->_paymentPresentation;
}

- (BOOL)applePayTrustAllAccess
{
  return self->_applePayTrustAllAccess;
}

- (BOOL)inAppPayments
{
  return self->_inAppPayments;
}

- (BOOL)inAppPaymentsPrivate
{
  return self->_inAppPaymentsPrivate;
}

- (BOOL)webPayments
{
  return self->_webPayments;
}

- (BOOL)winterpegPayments
{
  return self->_winterpegPayments;
}

- (BOOL)cardOnFilePayments
{
  return self->_cardOnFilePayments;
}

- (BOOL)AMPCardEnrollment
{
  return self->_AMPCardEnrollment;
}

- (BOOL)externalizedContextPayments
{
  return self->_externalizedContextPayments;
}

- (BOOL)trustedDeviceEnrollmentInfo
{
  return self->_trustedDeviceEnrollmentInfo;
}

- (BOOL)featuresAllAccess
{
  return self->_featuresAllAccess;
}

- (BOOL)searchAllAccess
{
  return self->_searchAllAccess;
}

- (BOOL)secureElementPassProvisioning
{
  return self->_secureElementPassProvisioning;
}

- (BOOL)paymentPassProvisioning
{
  return self->_paymentPassProvisioning;
}

- (BOOL)sharingAllAccess
{
  return self->_sharingAllAccess;
}

- (BOOL)appleMediaServicesPrivate
{
  return self->_appleMediaServicesPrivate;
}

- (BOOL)carKeyPassThroughAccess
{
  return self->_carKeyPassThroughAccess;
}

- (BOOL)generateSecurePassData
{
  return self->_generateSecurePassData;
}

- (BOOL)payLaterPayInFourMerchandising
{
  return self->_payLaterPayInFourMerchandising;
}

- (BOOL)remoteNetworkPaymentInitiate
{
  return self->_remoteNetworkPaymentInitiate;
}

- (BOOL)credentialStateAccess
{
  return self->_credentialStateAccess;
}

- (NSString)applicationID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)developerTeamID
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSArray)merchantIdentifiers
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (NSArray)teamIDs
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (NSArray)passTypeIDs
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

- (NSArray)passTypeIDPrefixes
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (BOOL)isEntitledForPassTypeID:(id)a3
{
  id v4;
  uint64_t v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    if (-[NSArray containsObject:](self->_passTypeIDs, "containsObject:", v4))
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      v12 = 0u;
      v13 = 0u;
      v10 = 0u;
      v11 = 0u;
      v6 = self->_passTypeIDPrefixes;
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
      {
        v7 = *(_QWORD *)v11;
        while (2)
        {
          for (i = 0; i != v5; ++i)
          {
            if (*(_QWORD *)v11 != v7)
              objc_enumerationMutation(v6);
            if ((objc_msgSend(v4, "hasPrefix:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i), (_QWORD)v10) & 1) != 0)
            {
              LOBYTE(v5) = 1;
              goto LABEL_15;
            }
          }
          v5 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
          if (v5)
            continue;
          break;
        }
      }
LABEL_15:

    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)isEntitledForAnyFromUniquePassTypeIDs:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  BOOL v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  NSArray *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "count");
  if (v5)
  {
    if (v5 == 1)
    {
      objc_msgSend(v4, "anyObject");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      v7 = -[PKEntitlementWhitelist isEntitledForPassTypeID:](self, "isEntitledForPassTypeID:", v6);
    }
    else
    {
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v8 = self->_passTypeIDs;
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v34;
        while (2)
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v34 != v11)
              objc_enumerationMutation(v8);
            if ((objc_msgSend(v4, "containsObject:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i)) & 1) != 0)
            {

              v7 = 1;
              goto LABEL_31;
            }
          }
          v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
          if (v10)
            continue;
          break;
        }
      }

      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v6 = v4;
      v13 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v30;
        v24 = *(_QWORD *)v30;
        do
        {
          for (j = 0; j != v14; ++j)
          {
            if (*(_QWORD *)v30 != v15)
              objc_enumerationMutation(v6);
            v17 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
            v25 = 0u;
            v26 = 0u;
            v27 = 0u;
            v28 = 0u;
            v18 = self->_passTypeIDPrefixes;
            v19 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
            if (v19)
            {
              v20 = v19;
              v21 = *(_QWORD *)v26;
              while (2)
              {
                for (k = 0; k != v20; ++k)
                {
                  if (*(_QWORD *)v26 != v21)
                    objc_enumerationMutation(v18);
                  if ((objc_msgSend(v17, "hasPrefix:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * k)) & 1) != 0)
                  {

                    v7 = 1;
                    goto LABEL_4;
                  }
                }
                v20 = -[NSArray countByEnumeratingWithState:objects:count:](v18, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
                if (v20)
                  continue;
                break;
              }
            }

            v15 = v24;
          }
          v14 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
          v7 = 0;
        }
        while (v14);
      }
      else
      {
        v7 = 0;
      }
    }
LABEL_4:

  }
  else
  {
    v7 = 0;
  }
LABEL_31:

  return v7;
}

- (BOOL)entitledToPerformPassAction:(unint64_t)a3 pass:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  objc_msgSend(v6, "passTypeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "teamID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "associatedPassTypeIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "secureElementPass");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "associatedApplicationIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = -[PKEntitlementWhitelist entitledToPerformPassAction:passTypeID:teamID:associatedPassTypeIdentifiers:associatedApplicationIdentifiers:](self, "entitledToPerformPassAction:passTypeID:teamID:associatedPassTypeIdentifiers:associatedApplicationIdentifiers:", a3, v7, v8, v9, v11);

  return a3;
}

- (BOOL)entitledToPerformPassAction:(unint64_t)a3 passTypeID:(id)a4 teamID:(id)a5 associatedPassTypeIdentifiers:(id)a6 associatedApplicationIdentifiers:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  BOOL v16;
  BOOL v18;
  NSString *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  uint64_t v27;
  void *v28;
  BOOL v29;
  NSString *v30;
  NSString *v31;
  NSString *v32;
  BOOL v33;
  void *v34;
  id obj;
  NSString *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (self->_passesAllAccess || v13 && -[NSArray containsObject:](self->_teamIDs, "containsObject:", v13))
    goto LABEL_2;
  if (!v12)
  {
    if ((a3 & 7) == 0 || !v14)
      goto LABEL_15;
    goto LABEL_13;
  }
  v18 = -[PKEntitlementWhitelist isEntitledForPassTypeID:](self, "isEntitledForPassTypeID:", v12);
  if ((a3 & 7) != 0 && v14 && !v18)
LABEL_13:
    v18 = -[PKEntitlementWhitelist isEntitledForAnyFromUniquePassTypeIDs:](self, "isEntitledForAnyFromUniquePassTypeIDs:", v14);
  if (v18)
    goto LABEL_2;
LABEL_15:
  if (PKPassTypeForPassTypeIdentifier(v12) != 1)
  {
LABEL_37:
    v16 = 0;
    goto LABEL_3;
  }
  if (self->_paymentAllAccess)
  {
LABEL_2:
    v16 = 1;
    goto LABEL_3;
  }
  if (a3 != 2)
    goto LABEL_37;
  v19 = self->_applicationID;
  v20 = v15;
  v21 = v20;
  v36 = v19;
  if (v19 && objc_msgSend(v20, "count"))
  {
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    obj = v21;
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    if (v22)
    {
      v23 = v22;
      v34 = v21;
      v24 = *(_QWORD *)v38;
      while (2)
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v38 != v24)
            objc_enumerationMutation(obj);
          v26 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
          if (objc_msgSend(v26, "hasSuffix:", CFSTR(".*")))
          {
            objc_msgSend(v26, "substringToIndex:", objc_msgSend(v26, "length") - 1);
            v27 = objc_claimAutoreleasedReturnValue();
            if (v27)
            {
              v28 = (void *)v27;
              v29 = -[NSString hasPrefix:](v36, "hasPrefix:", v27);

              if (v29)
                goto LABEL_41;
            }
          }
          else
          {
            v30 = v36;
            v31 = v26;
            if (v31 == v30)
            {

LABEL_41:
              v16 = 1;
              goto LABEL_42;
            }
            v32 = v31;
            if (v31)
            {
              v33 = -[NSString isEqualToString:](v30, "isEqualToString:", v31);

              if (v33)
                goto LABEL_41;
            }
            else
            {

            }
          }
        }
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
        if (v23)
          continue;
        break;
      }
      v16 = 0;
LABEL_42:
      v21 = v34;
    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

LABEL_3:
  return v16;
}

- (BOOL)isEntitledForPaymentRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *merchantIdentifiers;
  void *v10;
  void *v11;
  BOOL v12;
  NSObject *v13;
  BOOL v14;
  int processIdentifier;
  _BOOL4 inAppPaymentsPrivate;
  _DWORD v18[2];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "originatingURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scheme");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  switch(objc_msgSend(v4, "requestType"))
  {
    case 0:
    case 10:
      if (v6 && !objc_msgSend(v6, "caseInsensitiveCompare:", CFSTR("https")))
        goto LABEL_23;
      objc_msgSend(v4, "merchantIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
        goto LABEL_20;
      if (self->_inAppPayments || self->_paymentAllAccess || self->_inAppPaymentsPrivate)
        goto LABEL_28;
      goto LABEL_24;
    case 1:
      if (!self->_cardOnFilePayments)
        goto LABEL_24;
      goto LABEL_28;
    case 2:
    case 4:
    case 8:
    case 9:
    case 11:
    case 12:
    case 14:
      if (!self->_paymentAllAccess)
        goto LABEL_24;
      goto LABEL_28;
    case 3:
      if (!self->_AMPCardEnrollment)
        goto LABEL_24;
      goto LABEL_28;
    case 5:
      if (v6 && !objc_msgSend(v6, "caseInsensitiveCompare:", CFSTR("https")))
      {
LABEL_23:
        objc_msgSend(v4, "merchantSession");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[PKEntitlementWhitelist isEntitledForMerchantSession:](self, "isEntitledForMerchantSession:", v11);

        if (v12)
          goto LABEL_28;
      }
      else
      {
        objc_msgSend(v4, "merchantIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
LABEL_20:
          merchantIdentifiers = self->_merchantIdentifiers;
          objc_msgSend(v4, "merchantIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (-[NSArray containsObject:](merchantIdentifiers, "containsObject:", v10) || self->_paymentAllAccess)
          {

LABEL_28:
            v14 = 1;
            goto LABEL_29;
          }
          inAppPaymentsPrivate = self->_inAppPaymentsPrivate;

          if (inAppPaymentsPrivate)
            goto LABEL_28;
        }
      }
LABEL_24:
      PKLogFacilityTypeGetObject(0);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        processIdentifier = self->_processIdentifier;
        v18[0] = 67109120;
        v18[1] = processIdentifier;
        _os_log_error_impl(&dword_18FC92000, v13, OS_LOG_TYPE_ERROR, "Process %d not entitled for payment request", (uint8_t *)v18, 8u);
      }

      v14 = 0;
LABEL_29:

      return v14;
    case 6:
    case 7:
    case 13:
      if (!self->_externalizedContextPayments)
        goto LABEL_24;
      goto LABEL_28;
    default:
      goto LABEL_24;
  }
}

- (BOOL)isEntitledForMerchantSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  BOOL v8;
  NSString *developerTeamID;
  void *v10;
  int processIdentifier;
  _BOOL4 paymentAllAccess;
  _DWORD v14[2];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "initiative");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "isEqualToString:", CFSTR("messaging")))
  {
    if (!self->_winterpegPayments)
      goto LABEL_9;
LABEL_21:
    v8 = 1;
    goto LABEL_22;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("amp_enrollment")))
  {
    if (!self->_AMPCardEnrollment)
      goto LABEL_9;
    goto LABEL_21;
  }
  if (!objc_msgSend(v6, "isEqualToString:", CFSTR("amp_psd2")))
  {
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("in_app")))
    {
      if (self->_inAppPayments)
      {
        developerTeamID = self->_developerTeamID;
        objc_msgSend(v4, "initiativeContext");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[NSString isEqualToString:](developerTeamID, "isEqualToString:", v10)
          || (PKBypassCertValidation() & 1) != 0
          || self->_inAppPaymentsPrivate)
        {

        }
        else
        {
          paymentAllAccess = self->_paymentAllAccess;

          if (!paymentAllAccess)
            goto LABEL_9;
        }
        goto LABEL_21;
      }
    }
    else if (self->_webPayments)
    {
      goto LABEL_21;
    }
    if (!self->_inAppPaymentsPrivate && !self->_paymentAllAccess)
      goto LABEL_9;
    goto LABEL_21;
  }
  if (self->_cardOnFilePayments)
    goto LABEL_21;
LABEL_9:
  PKLogFacilityTypeGetObject(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    processIdentifier = self->_processIdentifier;
    v14[0] = 67109120;
    v14[1] = processIdentifier;
    _os_log_error_impl(&dword_18FC92000, v7, OS_LOG_TYPE_ERROR, "Process %d not entitled for merchant session", (uint8_t *)v14, 8u);
  }

  v8 = 0;
LABEL_22:

  return v8;
}

@end
