@implementation STTelephonySubscriptionContext

- (STMutableTelephonySubscriptionInfo)subscriptionInfo
{
  return self->_subscriptionInfo;
}

- (STMutableTelephonyCarrierBundleInfo)carrierBundleInfo
{
  return self->_carrierBundleInfo;
}

- (BOOL)isFakingService
{
  BOOL *v2;

  v2 = -[STTelephonySubscriptionContext fakeServiceCanceled](self, "fakeServiceCanceled");
  if (v2)
    LOBYTE(v2) = !*v2;
  return (char)v2;
}

- (BOOL)isFakingRegistration
{
  BOOL *v2;

  v2 = -[STTelephonySubscriptionContext fakeRegistrationCanceled](self, "fakeRegistrationCanceled");
  if (v2)
    LOBYTE(v2) = !*v2;
  return (char)v2;
}

- (BOOL)isFakingCellularRegistration
{
  BOOL *v2;

  v2 = -[STTelephonySubscriptionContext fakeCellularRegistrationCanceled](self, "fakeCellularRegistrationCanceled");
  if (v2)
    LOBYTE(v2) = !*v2;
  return (char)v2;
}

- (NSString)description
{
  return (NSString *)-[STTelephonySubscriptionContext descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (NSString)debugDescription
{
  return (NSString *)-[STTelephonySubscriptionContext debugDescriptionWithMultilinePrefix:](self, "debugDescriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STTelephonySubscriptionContext succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STTelephonySubscriptionContext subscriptionInfo](self, "subscriptionInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "succinctDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v5, CFSTR("subscriptionInfo"));

  STTelephonyDataConnectionTypeDebugName(-[STTelephonySubscriptionContext modemDataConnectionType](self, "modemDataConnectionType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v6, CFSTR("modemDataConnectionType"));

  -[STTelephonySubscriptionContext cachedCTOperatorName](self, "cachedCTOperatorName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", v7, CFSTR("cachedCTOperatorName"));

  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STTelephonySubscriptionContext descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  STTelephonySubscriptionContext *v12;

  v4 = (void *)MEMORY[0x1E0D01748];
  v5 = a3;
  objc_msgSend(v4, "builderWithObject:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__STTelephonySubscriptionContext_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E8E17F10;
  v7 = v6;
  v11 = v7;
  v12 = self;
  objc_msgSend(v7, "appendBodySectionWithName:multilinePrefix:block:", 0, v5, v10);

  v8 = v7;
  return v8;
}

void __72__STTelephonySubscriptionContext_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "subscriptionInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("subscriptionInfo"));

  v5 = *(void **)(a1 + 32);
  STTelephonyDataConnectionTypeDebugName(objc_msgSend(*(id *)(a1 + 40), "modemDataConnectionType"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:withName:", v6, CFSTR("modemDataConnectionType"));

  v7 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "cachedCTOperatorName");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendString:withName:", v8, CFSTR("cachedCTOperatorName"));

}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  STTelephonySubscriptionContext *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t);
  void *v13;
  id v14;
  STTelephonySubscriptionContext *v15;

  v3 = self;
  if (self)
  {
    v4 = (void *)MEMORY[0x1E0D01748];
    v5 = a3;
    objc_msgSend(v4, "builderWithObject:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUseDebugDescription:", 1);
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __77__STTelephonySubscriptionContext_debugDescriptionBuilderWithMultilinePrefix___block_invoke;
    v13 = &unk_1E8E17F10;
    v7 = v6;
    v14 = v7;
    v15 = v3;
    objc_msgSend(v7, "appendBodySectionWithName:multilinePrefix:block:", 0, v5, &v10);

    v3 = (STTelephonySubscriptionContext *)v7;
  }
  -[STTelephonySubscriptionContext build](v3, "build", a3, v10, v11, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __77__STTelephonySubscriptionContext_debugDescriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  id v22;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "subscriptionInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("subscriptionInfo"));

  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isFakingService"), CFSTR("fakingService"));
  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isFakingRegistration"), CFSTR("fakingRegistration"));
  v7 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isFakingCellularRegistration"), CFSTR("fakingCellularRegistration"));
  v8 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isPretendingToSearch"), CFSTR("isPretendingToSearch"));
  v9 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "cachedCTRegistrationDisplayStatus");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendString:withName:", v10, CFSTR("cachedCTRegistrationDisplayStatus"));

  v11 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "cachedCTRegistrationCellularStatus");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appendString:withName:", v12, CFSTR("cachedCTRegistrationCellularStatus"));

  v13 = *(void **)(a1 + 32);
  STTelephonyDataConnectionTypeDebugName(objc_msgSend(*(id *)(a1 + 40), "modemDataConnectionType"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "appendString:withName:", v14, CFSTR("modemDataConnectionType"));

  v15 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "cachedCTOperatorName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "appendString:withName:", v16, CFSTR("cachedCTOperatorName"));

  v17 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "statusBarImages");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (id)objc_msgSend(v17, "appendObject:withName:", v18, CFSTR("statusBarImages"));

  v20 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "carrierBundleInfo");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  v21 = (id)objc_msgSend(v20, "appendObject:withName:", v22, CFSTR("carrierBundleInfo"));

}

- (void)setSubscriptionInfo:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionInfo, a3);
}

- (BOOL)fakeServiceCanceled
{
  return self->_fakeServiceCanceled;
}

- (void)setFakeServiceCanceled:(BOOL *)a3
{
  self->_fakeServiceCanceled = a3;
}

- (BOOL)fakeRegistrationCanceled
{
  return self->_fakeRegistrationCanceled;
}

- (void)setFakeRegistrationCanceled:(BOOL *)a3
{
  self->_fakeRegistrationCanceled = a3;
}

- (BOOL)fakeCellularRegistrationCanceled
{
  return self->_fakeCellularRegistrationCanceled;
}

- (void)setFakeCellularRegistrationCanceled:(BOOL *)a3
{
  self->_fakeCellularRegistrationCanceled = a3;
}

- (BOOL)isPretendingToSearch
{
  return self->_pretendingToSearch;
}

- (void)setPretendingToSearch:(BOOL)a3
{
  self->_pretendingToSearch = a3;
}

- (NSString)cachedCTRegistrationDisplayStatus
{
  return self->_cachedCTRegistrationDisplayStatus;
}

- (void)setCachedCTRegistrationDisplayStatus:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)cachedCTRegistrationCellularStatus
{
  return self->_cachedCTRegistrationCellularStatus;
}

- (void)setCachedCTRegistrationCellularStatus:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (unint64_t)modemDataConnectionType
{
  return self->_modemDataConnectionType;
}

- (void)setModemDataConnectionType:(unint64_t)a3
{
  self->_modemDataConnectionType = a3;
}

- (NSString)cachedCTOperatorName
{
  return self->_cachedCTOperatorName;
}

- (void)setCachedCTOperatorName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSArray)statusBarImages
{
  return self->_statusBarImages;
}

- (void)setStatusBarImages:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setCarrierBundleInfo:(id)a3
{
  objc_storeStrong((id *)&self->_carrierBundleInfo, a3);
}

- (STMutableTelephonyMobileEquipmentInfo)mobileEquipmentInfo
{
  return self->_mobileEquipmentInfo;
}

- (void)setMobileEquipmentInfo:(id)a3
{
  objc_storeStrong((id *)&self->_mobileEquipmentInfo, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mobileEquipmentInfo, 0);
  objc_storeStrong((id *)&self->_carrierBundleInfo, 0);
  objc_storeStrong((id *)&self->_statusBarImages, 0);
  objc_storeStrong((id *)&self->_cachedCTOperatorName, 0);
  objc_storeStrong((id *)&self->_cachedCTRegistrationCellularStatus, 0);
  objc_storeStrong((id *)&self->_cachedCTRegistrationDisplayStatus, 0);
  objc_storeStrong((id *)&self->_subscriptionInfo, 0);
}

@end
