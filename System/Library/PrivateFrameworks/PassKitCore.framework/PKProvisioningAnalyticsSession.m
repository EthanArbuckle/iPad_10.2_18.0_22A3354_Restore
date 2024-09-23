@implementation PKProvisioningAnalyticsSession

+ (id)startAnalyticsSessionForEnvironment:(id)a3 intent:(id)a4 referralSource:(id)a5
{
  id v7;
  id v8;
  id v9;
  PKProvisioningAnalyticsSession *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[PKProvisioningAnalyticsSession initWithEnvironment:intent:referralSource:]([PKProvisioningAnalyticsSession alloc], "initWithEnvironment:intent:referralSource:", v9, v8, v7);

  return v10;
}

+ (id)continueAnalyticsSessionForEnvironment:(id)a3 intent:(id)a4 referralSource:(id)a5 archivedParent:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  PKProvisioningAnalyticsSession *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[PKProvisioningAnalyticsSession initWithEnvironment:intent:referralSource:archivedParent:]([PKProvisioningAnalyticsSession alloc], "initWithEnvironment:intent:referralSource:archivedParent:", v12, v11, v10, v9);

  return v13;
}

- (PKProvisioningAnalyticsSession)initWithEnvironment:(id)a3 intent:(id)a4 referralSource:(id)a5
{
  return -[PKProvisioningAnalyticsSession initWithEnvironment:intent:referralSource:archivedParent:](self, "initWithEnvironment:intent:referralSource:archivedParent:", a3, a4, a5, 0);
}

- (PKProvisioningAnalyticsSession)initWithEnvironment:(id)a3 intent:(id)a4 referralSource:(id)a5 archivedParent:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  PKProvisioningAnalyticsSession *v15;
  PKProvisioningAnalyticsSession *v16;
  uint64_t v17;
  NSString *referralSource;
  id v19;
  uint64_t v20;
  NSString *sessionID;
  void *v22;
  objc_super v24;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v24.receiver = self;
  v24.super_class = (Class)PKProvisioningAnalyticsSession;
  v15 = -[PKProvisioningAnalyticsSession init](&v24, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_environment, a3);
    objc_storeStrong((id *)&v16->_intent, a4);
    v17 = objc_msgSend(v13, "copy");
    referralSource = v16->_referralSource;
    v16->_referralSource = (NSString *)v17;

    v19 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v19, "UUIDString");
    v20 = objc_claimAutoreleasedReturnValue();
    sessionID = v16->_sessionID;
    v16->_sessionID = (NSString *)v20;

    objc_storeStrong((id *)&v16->_subject, CFSTR("walletProvisioning"));
    if (v14)
    {
      v16->_didBeginWalletProvisioningSubject = 1;
      +[PKAnalyticsReporter beginSubjectReporting:withArchivedParent:](PKAnalyticsReporter, "beginSubjectReporting:withArchivedParent:", v16->_subject, v14);
    }
    +[PKAnalyticsReporter reporterForSubject:](PKAnalyticsReporter, "reporterForSubject:", v16->_subject);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
    {
      v16->_didBeginWalletProvisioningSubject = 1;
      +[PKAnalyticsReporter beginSubjectReporting:](PKAnalyticsReporter, "beginSubjectReporting:", v16->_subject);
    }
  }

  return v16;
}

- (id)createViewReporterForPage:(id)a3
{
  id v4;
  PKProvisioningAnalyticsSessionUIReporter *v5;

  v4 = a3;
  v5 = -[PKProvisioningAnalyticsSessionUIReporter initWithResponder:sessionID:pageTag:]([PKProvisioningAnalyticsSessionUIReporter alloc], "initWithResponder:sessionID:pageTag:", self, self->_sessionID, v4);

  return v5;
}

- (id)createStepReporter
{
  return -[PKProvisioningAnalyticsSessionReporter initWithResponder:sessionID:]([PKProvisioningAnalyticsSessionStepReporter alloc], "initWithResponder:sessionID:", self, self->_sessionID);
}

- (void)stop
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("sessionFinished"), CFSTR("eventType"));
  -[PKProvisioningAnalyticsSession _reportEvent:](self, "_reportEvent:", v3);
  if (self->_didBeginWalletProvisioningSubject)
  {
    self->_didBeginWalletProvisioningSubject = 0;
    +[PKAnalyticsReporter endSubjectReporting:](PKAnalyticsReporter, "endSubjectReporting:", self->_subject);
  }

}

- (void)_clearEnvironmentValues
{
  NSString *productTypeDescriptor;
  NSString *productSubtypeDescriptor;
  NSMutableDictionary *productMetadata;
  NSMutableDictionary *passMetadata;

  productTypeDescriptor = self->_productTypeDescriptor;
  self->_productTypeDescriptor = 0;

  productSubtypeDescriptor = self->_productSubtypeDescriptor;
  self->_productSubtypeDescriptor = 0;

  productMetadata = self->_productMetadata;
  self->_productMetadata = 0;

  passMetadata = self->_passMetadata;
  self->_passMetadata = 0;

}

- (void)resetForNewProductSetup
{
  NSString *v3;
  NSString *sessionID;
  id v5;

  -[PKProvisioningAnalyticsSession _clearEnvironmentValues](self, "_clearEnvironmentValues");
  v5 = objc_alloc_init(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v5, "UUIDString");
  v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  sessionID = self->_sessionID;
  self->_sessionID = v3;

}

- (id)archivedParentToken
{
  return +[PKAnalyticsReporter archivedSessionTokenForSubject:](PKAnalyticsReporter, "archivedSessionTokenForSubject:", self->_subject);
}

- (void)_reportEvent:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (PKAnalyticsSessionEnabled())
  {
    objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_environment, CFSTR("environment"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_intent, CFSTR("intent"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_referralSource, CFSTR("referralSource"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_productTypeDescriptor, CFSTR("productType"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_productSubtypeDescriptor, CFSTR("productSubType"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", self->_sessionID, CFSTR("sessionID"));
    if (self->_productMetadata)
      objc_msgSend(v4, "addEntriesFromDictionary:");
    if (self->_passMetadata)
      objc_msgSend(v4, "addEntriesFromDictionary:");
    v6[0] = self->_subject;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKAnalyticsReporter subjects:sendEvent:](PKAnalyticsReporter, "subjects:sendEvent:", v5, v4);

  }
}

- (void)didReceiveEvent:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "mutableCopy");
  -[PKProvisioningAnalyticsSession _reportEvent:](self, "_reportEvent:", v4);

}

- (void)setProductType:(id)a3 subtype:(id)a4
{
  NSString *v6;
  NSString *v7;
  NSString *productTypeDescriptor;
  NSString *productSubtypeDescriptor;
  NSString *v10;
  NSMutableDictionary *passMetadata;
  NSMutableDictionary *productMetadata;
  NSString *v13;

  v6 = (NSString *)a3;
  v7 = (NSString *)a4;
  productTypeDescriptor = self->_productTypeDescriptor;
  self->_productTypeDescriptor = v6;
  v13 = v6;

  productSubtypeDescriptor = self->_productSubtypeDescriptor;
  self->_productSubtypeDescriptor = v7;
  v10 = v7;

  passMetadata = self->_passMetadata;
  self->_passMetadata = 0;

  productMetadata = self->_productMetadata;
  self->_productMetadata = 0;

}

- (void)setSetupProduct:(id)a3
{
  NSMutableDictionary *v4;
  NSMutableDictionary *productMetadata;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (v10)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    productMetadata = self->_productMetadata;
    self->_productMetadata = v4;

    objc_msgSend(v10, "configuration");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "partnerIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_productMetadata, "setObject:forKeyedSubscript:", v7, CFSTR("partnerIdentifier"));

    objc_msgSend(v10, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "productIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_productMetadata, "setObject:forKeyedSubscript:", v9, CFSTR("productIdentifier"));

  }
  else
  {
    v8 = self->_productMetadata;
    self->_productMetadata = 0;
  }

}

- (void)setPass:(id)a3
{
  id v4;
  NSMutableDictionary *v5;
  NSMutableDictionary *passMetadata;
  NSMutableDictionary *v7;
  id v8;
  uint64_t v9;
  __CFString *v10;
  unint64_t v11;
  __CFString *v12;
  void *v13;
  __CFString *v14;
  id v15;
  void *v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  __CFString *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  __CFString *v27;
  void *v28;
  uint64_t v29;
  __CFString *v30;
  BOOL v31;
  void *v32;
  id v33;
  NSMutableDictionary *v34;
  NSMutableDictionary *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;

  v4 = a3;
  v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  passMetadata = self->_passMetadata;
  self->_passMetadata = v5;

  v7 = self->_passMetadata;
  v8 = v4;
  v41 = v8;
  if (!v8 || !v7)
    goto LABEL_27;
  v9 = objc_msgSend(v8, "passType");
  if ((unint64_t)(v9 + 1) >= 3)
    v10 = CFSTR("unknown");
  else
    v10 = off_1E2AC54C0[v9 + 1];
  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v10, CFSTR("passType"));

  v11 = objc_msgSend(v41, "style");
  if (v11 < 0xD && ((0x13FFu >> v11) & 1) != 0)
    v12 = off_1E2AC54D8[v11];
  else
    v12 = CFSTR("unknown");
  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v12, CFSTR("passStyle"));

  objc_msgSend(v41, "nfcPayload");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  PKAnalyticsReportSwitchToggleResultValue(v13 != 0);
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v14, CFSTR("hasNFC"));

  v15 = v41;
  if (objc_msgSend(v15, "passType") == 1)
  {
    objc_msgSend(v15, "secureElementPass");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "cardType");
    if (v17 <= 4)
      v14 = *off_1E2AC5540[v17];

  }
  else
  {
    v14 = CFSTR("other");
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v14, CFSTR("productType"));
  objc_msgSend(v15, "secureElementPass");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "isIdentityPass"))
  {
    v19 = objc_msgSend(v18, "identityType");
    if ((unint64_t)(v19 - 1) < 3)
    {
      v20 = off_1E2AC5568[v19 - 1];
      goto LABEL_22;
    }
  }
  else if (objc_msgSend(v18, "isAccessPass"))
  {
    v21 = objc_msgSend(v18, "accessType");
    if (v21 < 7)
    {
      v20 = off_1E2AC5580[v21];
      goto LABEL_22;
    }
  }
  v20 = CFSTR("unknown");
LABEL_22:

  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v20, CFSTR("productSubType"));
  objc_msgSend(v15, "secureElementPass");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "devicePaymentApplications");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (unint64_t)objc_msgSend(v23, "count") > 1;

  PKAnalyticsReportSwitchToggleResultValue(v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v25, CFSTR("coBadgeEnable"));
  objc_msgSend(v15, "secureElementPass");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = CFSTR("unknown");
  objc_msgSend(v26, "organizationName");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v28, "length"))
  {
    v29 = objc_msgSend(v26, "cardType");
    if (v29 == 4 || v29 == 2)
    {
      v30 = v28;

      v27 = v30;
    }
  }

  -[NSMutableDictionary setObject:forKeyedSubscript:](v7, "setObject:forKeyedSubscript:", v27, CFSTR("issuer"));
LABEL_27:

  v31 = objc_msgSend(v41, "passType") == 1;
  v32 = v41;
  if (v31)
  {
    v33 = v41;
    if (v41)
    {
      v34 = self->_passMetadata;
      if (v34)
      {
        v35 = v34;
        PKAnalyticsReportSwitchToggleResultValue(objc_msgSend(v33, "isCobranded"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](v35, "setObject:forKeyedSubscript:", v36, CFSTR("isCobrandedCard"));

        objc_msgSend(v33, "cobrandName");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](v35, "setObject:forKeyedSubscript:", v37, CFSTR("cobrandName"));

        objc_msgSend(v33, "issuerCountryCode");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](v35, "setObject:forKeyedSubscript:", v38, CFSTR("issuerCountryCode"));

        objc_msgSend(v33, "devicePrimaryPaymentApplication");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        PKPaymentNetworkNameForPaymentCredentialType(objc_msgSend(v39, "paymentNetworkIdentifier"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](v35, "setObject:forKeyedSubscript:", v40, CFSTR("networkName"));

      }
    }

    v32 = v41;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_passMetadata, 0);
  objc_storeStrong((id *)&self->_productMetadata, 0);
  objc_storeStrong((id *)&self->_productSubtypeDescriptor, 0);
  objc_storeStrong((id *)&self->_productTypeDescriptor, 0);
  objc_storeStrong((id *)&self->_referralSource, 0);
  objc_storeStrong((id *)&self->_intent, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_sessionID, 0);
}

@end
