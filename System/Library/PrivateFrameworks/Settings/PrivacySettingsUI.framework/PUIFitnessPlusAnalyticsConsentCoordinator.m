@implementation PUIFitnessPlusAnalyticsConsentCoordinator

- (PUIFitnessPlusAnalyticsConsentCoordinator)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUIFitnessPlusAnalyticsConsentCoordinator;
  return -[PUIFitnessPlusAnalyticsConsentCoordinator init](&v3, sel_init);
}

- (BOOL)fetchAnalyticsConsent
{
  id AMSAcknowledgePrivacyTaskClass;
  void *v3;
  id v4;
  void *v5;
  unsigned int v6;
  NSObject *v7;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  AMSAcknowledgePrivacyTaskClass = getAMSAcknowledgePrivacyTaskClass();
  getOBPrivacyImproveFitnessPlusIdentifier();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(AMSAcknowledgePrivacyTaskClass) = objc_msgSend(AMSAcknowledgePrivacyTaskClass, "hasPreviouslyAcknowledgedPrivacyIdentifier:", v3);

  v4 = getAMSAcknowledgePrivacyTaskClass();
  getOBPrivacyImproveFitnessPlusIdentifier();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "hasRejectedPrivacyIdentifier:", v5);

  v6 = AMSAcknowledgePrivacyTaskClass & (v4 ^ 1);
  _PUILoggingFacility();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = v6;
    _os_log_impl(&dword_1DB1FB000, v7, OS_LOG_TYPE_DEFAULT, "PUIFitnessPlusAnalyticsConsentCoordinator isOptedIn %d", (uint8_t *)v9, 8u);
  }

  return v6;
}

- (void)setAnalyticsConsent:(BOOL)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  BOOL v13;

  v5 = a4;
  v6 = objc_alloc((Class)getAMSAcknowledgePrivacyTaskClass());
  getOBPrivacyImproveFitnessPlusIdentifier();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithPrivacyIdentifier:", v7);

  if (a3)
    objc_msgSend(v8, "acknowledgePrivacy");
  else
    objc_msgSend(v8, "rejectPrivacy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __76__PUIFitnessPlusAnalyticsConsentCoordinator_setAnalyticsConsent_completion___block_invoke;
  v11[3] = &unk_1EA26C6E8;
  v13 = a3;
  v12 = v5;
  v10 = v5;
  objc_msgSend(v9, "addFinishBlock:", v11);

}

void __76__PUIFitnessPlusAnalyticsConsentCoordinator_setAnalyticsConsent_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  int v8;
  int v9;
  void *v10;
  int v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _PUILoggingFacility();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      v8 = *(unsigned __int8 *)(a1 + 40);
      v11 = 67109120;
      v12 = v8;
      _os_log_impl(&dword_1DB1FB000, v6, OS_LOG_TYPE_DEFAULT, "PUIFitnessPlusAnalyticsConsentCoordinator successfully updated opt in privacy preference: %d", (uint8_t *)&v11, 8u);
    }
  }
  else if (v7)
  {
    v9 = *(unsigned __int8 *)(a1 + 40);
    objc_msgSend(v5, "localizedDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 67109378;
    v12 = v9;
    v13 = 2112;
    v14 = v10;
    _os_log_impl(&dword_1DB1FB000, v6, OS_LOG_TYPE_DEFAULT, "PUIFitnessPlusAnalyticsConsentCoordinator failed to update opt in privacy preference to %d with error: %@", (uint8_t *)&v11, 0x12u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)fetchSubscriptionStatusWithCompletion:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2050000000;
  v4 = (void *)getASDSubscriptionEntitlementsClass_softClass;
  v15 = getASDSubscriptionEntitlementsClass_softClass;
  v5 = MEMORY[0x1E0C809B0];
  if (!getASDSubscriptionEntitlementsClass_softClass)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __getASDSubscriptionEntitlementsClass_block_invoke;
    v11[3] = &unk_1EA26B260;
    v11[4] = &v12;
    __getASDSubscriptionEntitlementsClass_block_invoke((uint64_t)v11);
    v4 = (void *)v13[3];
  }
  v6 = objc_retainAutorelease(v4);
  _Block_object_dispose(&v12, 8);
  objc_msgSend(v6, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __83__PUIFitnessPlusAnalyticsConsentCoordinator_fetchSubscriptionStatusWithCompletion___block_invoke;
  v9[3] = &unk_1EA26C710;
  v10 = v3;
  v8 = v3;
  objc_msgSend(v7, "getSubscriptionEntitlementsForSegment:ignoreCaches:requestingBundleId:withCacheInfoResultHandler:", 2, 0, CFSTR("com.apple.Preferences"), v9);

}

void __83__PUIFitnessPlusAnalyticsConsentCoordinator_fetchSubscriptionStatusWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, int a4, void *a5)
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  _BOOL4 v12;
  NSObject *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  _DWORD v19[2];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a5;
  if (!v8 || !objc_msgSend(v8, "count"))
  {
    _PUILoggingFacility();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __83__PUIFitnessPlusAnalyticsConsentCoordinator_fetchSubscriptionStatusWithCompletion___block_invoke_cold_1(v9, v10);
    goto LABEL_8;
  }
  if (a4)
  {
    _PUILoggingFacility();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __83__PUIFitnessPlusAnalyticsConsentCoordinator_fetchSubscriptionStatusWithCompletion___block_invoke_cold_2(v10);
LABEL_8:

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    goto LABEL_9;
  }
  objc_msgSend(v8, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isTrialPeriod") & 1) != 0
    || (objc_msgSend(v11, "isOfferPeriod") & 1) != 0
    || (objc_msgSend(v11, "isInGracePeriod") & 1) != 0)
  {
    v12 = 1;
  }
  else
  {
    objc_msgSend(v11, "expiryDate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceReferenceDate");
    v16 = v15;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "timeIntervalSinceReferenceDate");
    v12 = v16 > v18;

  }
  _PUILoggingFacility();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v19[0] = 67109120;
    v19[1] = v12;
    _os_log_impl(&dword_1DB1FB000, v13, OS_LOG_TYPE_DEFAULT, "PUIFitnessPlusAnalyticsConsentCoordinator isSubscribed %d", (uint8_t *)v19, 8u);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_9:

}

void __83__PUIFitnessPlusAnalyticsConsentCoordinator_fetchSubscriptionStatusWithCompletion___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1DB1FB000, a2, OS_LOG_TYPE_ERROR, "PUIFitnessPlusAnalyticsConsentCoordinator failed to fetch subscription status with error: %@", (uint8_t *)&v4, 0xCu);

}

void __83__PUIFitnessPlusAnalyticsConsentCoordinator_fetchSubscriptionStatusWithCompletion___block_invoke_cold_2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DB1FB000, log, OS_LOG_TYPE_ERROR, "PUIFitnessPlusAnalyticsConsentCoordinator failed to fetch subscription status; cache expired",
    v1,
    2u);
}

@end
