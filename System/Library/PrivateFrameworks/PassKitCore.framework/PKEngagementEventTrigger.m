@implementation PKEngagementEventTrigger

+ (BOOL)fireEngagementEventNamed:(id)a3
{
  id v4;
  NSObject *v5;
  __CFString *v6;
  __CFString *v7;
  int v8;
  BOOL v9;
  __CFString *v10;
  __CFString *v11;
  int v12;
  __CFString *v13;
  __CFString *v14;
  int v15;
  __CFString *v16;
  __CFString *v17;
  int v18;
  __CFString *v19;
  __CFString *v20;
  int v21;
  __CFString *v22;
  __CFString *v23;
  int v24;
  __CFString *v25;
  __CFString *v26;
  int v27;
  __CFString *v28;
  __CFString *v29;
  int v30;
  __CFString *v31;
  __CFString *v32;
  int v33;
  __CFString *v34;
  __CFString *v35;
  int v36;
  __CFString *v37;
  __CFString *v38;
  int v39;
  __CFString *v40;
  __CFString *v41;
  int v42;
  __CFString *v43;
  __CFString *v44;
  int v45;
  __CFString *v46;
  __CFString *v47;
  int v48;
  __CFString *v49;
  __CFString *v50;
  int v51;
  __CFString *v52;
  __CFString *v53;
  int v54;
  __CFString *v55;
  __CFString *v56;
  int v57;
  __CFString *v58;
  __CFString *v59;
  int v60;
  __CFString *v61;
  __CFString *v62;
  int v63;
  __CFString *v64;
  __CFString *v65;
  int v66;
  __CFString *v67;
  __CFString *v68;
  int v69;
  __CFString *v70;
  __CFString *v71;
  int v72;
  __CFString *v73;
  __CFString *v74;
  int v75;
  __CFString *v76;
  __CFString *v77;
  int v78;
  __CFString *v79;
  __CFString *v80;
  int v81;
  int v83;
  id v84;
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PKLogFacilityTypeGetObject(0x10uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v83 = 138543362;
    v84 = v4;
    _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "will fire %{public}@ engagement event via command line", (uint8_t *)&v83, 0xCu);
  }

  v6 = (__CFString *)v4;
  v7 = v6;
  if (v6 == CFSTR("wallet:passAdded"))
    goto LABEL_6;
  if (!v6)
  {
LABEL_80:
    v9 = 0;
    goto LABEL_81;
  }
  v8 = -[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("wallet:passAdded"));

  if (!v8)
  {
    v10 = v7;
    if (v10 == CFSTR("wallet:passRemoved")
      || (v11 = v10,
          v12 = -[__CFString isEqualToString:](v10, "isEqualToString:", CFSTR("wallet:passRemoved")),
          v11,
          v12))
    {
      objc_msgSend(a1, "firePassRemovedEvent");
      goto LABEL_7;
    }
    v13 = v11;
    if (v13 == CFSTR("wallet:expressPassInfoChanged")
      || (v14 = v13,
          v15 = -[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("wallet:expressPassInfoChanged")),
          v14,
          v15))
    {
      objc_msgSend(a1, "fireExpressPassInfoChangedEvent");
      goto LABEL_7;
    }
    v16 = v14;
    if (v16 == CFSTR("wallet:locationChanged")
      || (v17 = v16,
          v18 = -[__CFString isEqualToString:](v16, "isEqualToString:", CFSTR("wallet:locationChanged")),
          v17,
          v18))
    {
      objc_msgSend(a1, "fireLocationChangedEvent");
      goto LABEL_7;
    }
    v19 = v17;
    if (v19 == CFSTR("wallet:accountAdded")
      || (v20 = v19,
          v21 = -[__CFString isEqualToString:](v19, "isEqualToString:", CFSTR("wallet:accountAdded")),
          v20,
          v21))
    {
      objc_msgSend(a1, "fireAccountAddedEvent");
      goto LABEL_7;
    }
    v22 = v20;
    if (v22 == CFSTR("wallet:accountUpdated")
      || (v23 = v22,
          v24 = -[__CFString isEqualToString:](v22, "isEqualToString:", CFSTR("wallet:accountUpdated")),
          v23,
          v24))
    {
      objc_msgSend(a1, "fireAccountUpdatedEvent");
      goto LABEL_7;
    }
    v25 = v23;
    if (v25 == CFSTR("wallet:accountRemoved")
      || (v26 = v25,
          v27 = -[__CFString isEqualToString:](v25, "isEqualToString:", CFSTR("wallet:accountRemoved")),
          v26,
          v27))
    {
      objc_msgSend(a1, "fireAccountRemovedEvent");
      goto LABEL_7;
    }
    v28 = v26;
    if (v28 == CFSTR("wallet:peerPaymentAccountUpdated")
      || (v29 = v28,
          v30 = -[__CFString isEqualToString:](v28, "isEqualToString:", CFSTR("wallet:peerPaymentAccountUpdated")),
          v29,
          v30))
    {
      objc_msgSend(a1, "firePeerPaymentAccountUpdatedEvent");
      goto LABEL_7;
    }
    v31 = v29;
    if (v31 == CFSTR("wallet:featureApplicationAdded")
      || (v32 = v31,
          v33 = -[__CFString isEqualToString:](v31, "isEqualToString:", CFSTR("wallet:featureApplicationAdded")),
          v32,
          v33))
    {
      objc_msgSend(a1, "fireFeatureApplicationAddedEvent");
      goto LABEL_7;
    }
    v34 = v32;
    if (v34 == CFSTR("wallet:featureApplicationRemoved")
      || (v35 = v34,
          v36 = -[__CFString isEqualToString:](v34, "isEqualToString:", CFSTR("wallet:featureApplicationRemoved")),
          v35,
          v36))
    {
      objc_msgSend(a1, "fireFeatureApplicationRemovedEvent");
      goto LABEL_7;
    }
    v37 = v35;
    if (v37 == CFSTR("wallet:featureApplicationUpdated")
      || (v38 = v37,
          v39 = -[__CFString isEqualToString:](v37, "isEqualToString:", CFSTR("wallet:featureApplicationUpdated")),
          v38,
          v39))
    {
      objc_msgSend(a1, "fireFeatureApplicationUpdatedEvent");
      goto LABEL_7;
    }
    v40 = v38;
    if (v40 == CFSTR("wallet:DCINotificationForMarketAdded")
      || (v41 = v40,
          v42 = -[__CFString isEqualToString:](v40, "isEqualToString:", CFSTR("wallet:DCINotificationForMarketAdded")),
          v41,
          v42))
    {
      objc_msgSend(a1, "fireDCINotificationForMarketAddedEvent");
      goto LABEL_7;
    }
    v43 = v41;
    if (v43 == CFSTR("wallet:openLoopUpgradeNotificationForMarketAdded")
      || (v44 = v43,
          v45 = -[__CFString isEqualToString:](v43, "isEqualToString:", CFSTR("wallet:openLoopUpgradeNotificationForMarketAdded")), v44, v45))
    {
      objc_msgSend(a1, "fireOpenLoopUpgradeNotificationForMarketAddedEvent");
      goto LABEL_7;
    }
    v46 = v44;
    if (v46 == CFSTR("wallet:renotifyNotificationForMaketAdded")
      || (v47 = v46,
          v48 = -[__CFString isEqualToString:](v46, "isEqualToString:", CFSTR("wallet:renotifyNotificationForMaketAdded")), v47, v48))
    {
      objc_msgSend(a1, "fireRenotifyNotificationForMarketAddedEvent");
      goto LABEL_7;
    }
    v49 = v47;
    if (v49 == CFSTR("wallet:transactionsUpdated")
      || (v50 = v49,
          v51 = -[__CFString isEqualToString:](v49, "isEqualToString:", CFSTR("wallet:transactionsUpdated")),
          v50,
          v51))
    {
      objc_msgSend(a1, "fireTransactionsUpdatedEvent");
      goto LABEL_7;
    }
    v52 = v50;
    if (v52 == CFSTR("wallet:familyCircleChanged")
      || (v53 = v52,
          v54 = -[__CFString isEqualToString:](v52, "isEqualToString:", CFSTR("wallet:familyCircleChanged")),
          v53,
          v54))
    {
      objc_msgSend(a1, "fireFamilyCircleChangedEvent");
      goto LABEL_7;
    }
    v55 = v53;
    if (v55 == CFSTR("wallet:currentLocaleChanged")
      || (v56 = v55,
          v57 = -[__CFString isEqualToString:](v55, "isEqualToString:", CFSTR("wallet:currentLocaleChanged")),
          v56,
          v57))
    {
      objc_msgSend(a1, "fireCurrentLocaleChangedEvent");
      goto LABEL_7;
    }
    v58 = v56;
    if (v58 == CFSTR("wallet:applePayContextChanged")
      || (v59 = v58,
          v60 = -[__CFString isEqualToString:](v58, "isEqualToString:", CFSTR("wallet:applePayContextChanged")),
          v59,
          v60))
    {
      objc_msgSend(a1, "fireApplePayContextChangedEvent");
      goto LABEL_7;
    }
    v61 = v59;
    if (v61 == CFSTR("wallet:dayChanged")
      || (v62 = v61,
          v63 = -[__CFString isEqualToString:](v61, "isEqualToString:", CFSTR("wallet:dayChanged")),
          v62,
          v63))
    {
      objc_msgSend(a1, "fireDayChangedEvent");
      goto LABEL_7;
    }
    v64 = v62;
    if (v64 == CFSTR("wallet:scheduledPaymentsChanged")
      || (v65 = v64,
          v66 = -[__CFString isEqualToString:](v64, "isEqualToString:", CFSTR("wallet:scheduledPaymentsChanged")),
          v65,
          v66))
    {
      objc_msgSend(a1, "fireScheduledPaymentsChangedEvent");
      goto LABEL_7;
    }
    v67 = v65;
    if (v67 == CFSTR("wallet:defaultCreditAccountCreditLimitIncreased")
      || (v68 = v67,
          v69 = -[__CFString isEqualToString:](v67, "isEqualToString:", CFSTR("wallet:defaultCreditAccountCreditLimitIncreased")), v68, v69))
    {
      objc_msgSend(a1, "fireDefaultCreditAccountCreditLimitIncreasedEvent");
      goto LABEL_7;
    }
    v70 = v68;
    if (v70 == CFSTR("wallet:defaultCreditAccountBalancePaidInFull")
      || (v71 = v70,
          v72 = -[__CFString isEqualToString:](v70, "isEqualToString:", CFSTR("wallet:defaultCreditAccountBalancePaidInFull")), v71, v72))
    {
      objc_msgSend(a1, "fireDefaultCreditAccountBalancePaidInFullEvent");
      goto LABEL_7;
    }
    v73 = v71;
    if (v73 == CFSTR("wallet:defaultCreditAccountBonusDailyCashReceived")
      || (v74 = v73,
          v75 = -[__CFString isEqualToString:](v73, "isEqualToString:", CFSTR("wallet:defaultCreditAccountBonusDailyCashReceived")), v74, v75))
    {
      objc_msgSend(a1, "fireDefaultCreditAccountReceivedBonusDailyCashEvent");
      goto LABEL_7;
    }
    v76 = v74;
    if (v76 == CFSTR("wallet:defaultCreditAccountPurchaseMissedApplePayMerchantRewards")
      || (v77 = v76,
          v78 = -[__CFString isEqualToString:](v76, "isEqualToString:", CFSTR("wallet:defaultCreditAccountPurchaseMissedApplePayMerchantRewards")), v77, v78))
    {
      objc_msgSend(a1, "fireDefaultCreditAccountPurchaseMissedApplePayMerchantRewardsEvent");
      goto LABEL_7;
    }
    v79 = v77;
    if (v79 == CFSTR("wallet:appleAccountInStoreTopUp")
      || (v80 = v79,
          v81 = -[__CFString isEqualToString:](v79, "isEqualToString:", CFSTR("wallet:appleAccountInStoreTopUp")),
          v80,
          v81))
    {
      objc_msgSend(a1, "fireAppleAccountInStoreTopUpEvent");
      goto LABEL_7;
    }
    goto LABEL_80;
  }
LABEL_6:
  objc_msgSend(a1, "firePassAddedEvent");
LABEL_7:
  v9 = 1;
LABEL_81:

  return v9;
}

+ (void)firePassAddedEvent
{
  objc_msgSend(a1, "_fireEventType:", CFSTR("wallet:passAdded"));
}

+ (void)firePassRemovedEvent
{
  objc_msgSend(a1, "_fireEventType:", CFSTR("wallet:passRemoved"));
}

+ (void)fireExpressPassInfoChangedEvent
{
  objc_msgSend(a1, "_fireEventType:", CFSTR("wallet:expressPassInfoChanged"));
}

+ (void)fireLocationChangedEvent
{
  objc_msgSend(a1, "_fireEventType:", CFSTR("wallet:locationChanged"));
}

+ (void)fireAccountAddedEvent
{
  objc_msgSend(a1, "_fireEventType:", CFSTR("wallet:accountAdded"));
}

+ (void)fireAccountUpdatedEvent
{
  objc_msgSend(a1, "_fireEventType:", CFSTR("wallet:accountUpdated"));
}

+ (void)fireAccountRemovedEvent
{
  objc_msgSend(a1, "_fireEventType:", CFSTR("wallet:accountRemoved"));
}

+ (void)firePeerPaymentAccountUpdatedEvent
{
  objc_msgSend(a1, "_fireEventType:", CFSTR("wallet:peerPaymentAccountUpdated"));
}

+ (void)fireFeatureApplicationAddedEvent
{
  objc_msgSend(a1, "_fireEventType:", CFSTR("wallet:featureApplicationAdded"));
}

+ (void)fireFeatureApplicationRemovedEvent
{
  objc_msgSend(a1, "_fireEventType:", CFSTR("wallet:featureApplicationRemoved"));
}

+ (void)fireFeatureApplicationUpdatedEvent
{
  objc_msgSend(a1, "_fireEventType:", CFSTR("wallet:featureApplicationUpdated"));
}

+ (void)fireDCINotificationForMarketAddedEvent
{
  objc_msgSend(a1, "_fireEventType:", CFSTR("wallet:DCINotificationForMarketAdded"));
}

+ (void)fireOpenLoopUpgradeNotificationForMarketAddedEvent
{
  objc_msgSend(a1, "_fireEventType:", CFSTR("wallet:openLoopUpgradeNotificationForMarketAdded"));
}

+ (void)fireRenotifyNotificationForMarketAddedEvent
{
  objc_msgSend(a1, "_fireEventType:", CFSTR("wallet:renotifyNotificationForMaketAdded"));
}

+ (void)fireTransactionsUpdatedEvent
{
  objc_msgSend(a1, "_fireEventType:", CFSTR("wallet:transactionsUpdated"));
}

+ (void)fireFamilyCircleChangedEvent
{
  objc_msgSend(a1, "_fireEventType:", CFSTR("wallet:familyCircleChanged"));
}

+ (void)fireCurrentLocaleChangedEvent
{
  objc_msgSend(a1, "_fireEventType:", CFSTR("wallet:currentLocaleChanged"));
}

+ (void)fireApplePayContextChangedEvent
{
  objc_msgSend(a1, "_fireEventType:", CFSTR("wallet:applePayContextChanged"));
}

+ (void)fireDayChangedEvent
{
  objc_msgSend(a1, "_fireEventType:", CFSTR("wallet:dayChanged"));
}

+ (void)fireScheduledPaymentsChangedEvent
{
  objc_msgSend(a1, "_fireEventType:", CFSTR("wallet:scheduledPaymentsChanged"));
}

+ (void)fireDefaultCreditAccountCreditLimitIncreasedEvent
{
  objc_msgSend(a1, "_fireEventType:", CFSTR("wallet:defaultCreditAccountCreditLimitIncreased"));
}

+ (void)fireDefaultCreditAccountBalancePaidInFullEvent
{
  objc_msgSend(a1, "_fireEventType:", CFSTR("wallet:defaultCreditAccountBalancePaidInFull"));
}

+ (void)fireDefaultCreditAccountReceivedBonusDailyCashEvent
{
  objc_msgSend(a1, "_fireEventType:", CFSTR("wallet:defaultCreditAccountBonusDailyCashReceived"));
}

+ (void)fireDefaultCreditAccountPurchaseMissedApplePayMerchantRewardsEvent
{
  objc_msgSend(a1, "_fireEventType:", CFSTR("wallet:defaultCreditAccountPurchaseMissedApplePayMerchantRewards"));
}

+ (void)fireAppleAccountInStoreTopUpEvent
{
  objc_msgSend(a1, "_fireEventType:", CFSTR("wallet:appleAccountInStoreTopUp"));
}

+ (void)firePeerPaymentDeviceTapTransactionAddedEvent
{
  objc_msgSend(a1, "_fireEventType:", CFSTR("wallet:peerPaymentDeviceTapTransactionAdded"));
}

+ (void)_fireEventType:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PKLogFacilityTypeGetObject(0x10uLL);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_18FC92000, v5, OS_LOG_TYPE_DEFAULT, "firing %@ engagement event", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(a1, "metrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "eventWithType:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "enqueueEvent:", v7);

}

+ (id)eventWithType:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;

  v3 = (objc_class *)MEMORY[0x1E0CFDB68];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initForEngagement");
  objc_msgSend(v5, "setEventType:", v4);

  return v5;
}

+ (id)metrics
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0CFD9E8];
  objc_msgSend(MEMORY[0x1E0CFDB48], "bagSubProfile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CFDB48], "bagSubProfileVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bagForProfile:profileVersion:", v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CFDB60]), "initWithContainerID:bag:", CFSTR("com.apple.passbook"), v5);
  return v6;
}

@end
