@implementation STTelephonyCarrierBundleInfo

- (BOOL)suppressSOSOnlyWithLimitedService
{
  return self->_suppressSOSOnlyWithLimitedService;
}

- (BOOL)isReinitiatingActivationDisabled
{
  return self->_reinitiatingActivationDisabled;
}

- (id)initWithCarrierBundleInfo:(id)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  objc_super v17;

  v3 = a2;
  if (a1)
  {
    v17.receiver = a1;
    v17.super_class = (Class)STTelephonyCarrierBundleInfo;
    a1 = objc_msgSendSuper2(&v17, sel_init);
    if (a1)
    {
      *((_BYTE *)a1 + 8) = objc_msgSend(v3, "LTEConnectionShows4G");
      *((_BYTE *)a1 + 9) = objc_msgSend(v3, "suppressSOSOnlyWithLimitedService");
      *((_BYTE *)a1 + 10) = objc_msgSend(v3, "isReinitiatingActivationDisabled");
      objc_msgSend(v3, "customerServicePhoneNumber");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "copy");
      v6 = (void *)*((_QWORD *)a1 + 2);
      *((_QWORD *)a1 + 2) = v5;

      objc_msgSend(v3, "disabledApplicationIDs");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "copy");
      v9 = (void *)*((_QWORD *)a1 + 3);
      *((_QWORD *)a1 + 3) = v8;

      objc_msgSend(v3, "carrierName");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "copy");
      v12 = (void *)*((_QWORD *)a1 + 4);
      *((_QWORD *)a1 + 4) = v11;

      objc_msgSend(v3, "homeCountryCode");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "copy");
      v15 = (void *)*((_QWORD *)a1 + 5);
      *((_QWORD *)a1 + 5) = v14;

    }
  }

  return a1;
}

- (NSString)homeCountryCode
{
  return self->_homeCountryCode;
}

- (NSArray)disabledApplicationIDs
{
  return self->_disabledApplicationIDs;
}

- (NSString)customerServicePhoneNumber
{
  return self->_customerServicePhoneNumber;
}

- (NSString)carrierName
{
  return self->_carrierName;
}

- (BOOL)LTEConnectionShows4G
{
  return self->_LTEConnectionShows4G;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeCountryCode, 0);
  objc_storeStrong((id *)&self->_carrierName, 0);
  objc_storeStrong((id *)&self->_disabledApplicationIDs, 0);
  objc_storeStrong((id *)&self->_customerServicePhoneNumber, 0);
}

- (STTelephonyCarrierBundleInfo)init
{
  return (STTelephonyCarrierBundleInfo *)-[STTelephonyCarrierBundleInfo initWithCarrierBundleInfo:](self, 0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[STTelephonyCarrierBundleInfo initWithCarrierBundleInfo:](+[STMutableTelephonyCarrierBundleInfo allocWithZone:](STMutableTelephonyCarrierBundleInfo, "allocWithZone:", a3), self);
}

- (NSString)description
{
  return (NSString *)-[STTelephonyCarrierBundleInfo descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STTelephonyCarrierBundleInfo succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STTelephonyCarrierBundleInfo descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  STTelephonyCarrierBundleInfo *v11;

  v4 = a3;
  -[STTelephonyCarrierBundleInfo succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__STTelephonyCarrierBundleInfo_descriptionBuilderWithMultilinePrefix___block_invoke;
  v9[3] = &unk_1E8E17F10;
  v6 = v5;
  v10 = v6;
  v11 = self;
  objc_msgSend(v6, "appendBodySectionWithName:multilinePrefix:block:", 0, v4, v9);

  v7 = v6;
  return v7;
}

void __70__STTelephonyCarrierBundleInfo_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "LTEConnectionShows4G"), CFSTR("LTEConnectionShows4G"));
  v3 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "suppressSOSOnlyWithLimitedService"), CFSTR("suppressSOSOnlyWithLimitedService"));
  v4 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 40), "isReinitiatingActivationDisabled"), CFSTR("reinitiatingActivationDisabled"));
  v5 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "customerServicePhoneNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:withName:", v6, CFSTR("customerServicePhoneNumber"));

  v7 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "disabledApplicationIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendArraySection:withName:skipIfEmpty:", v8, CFSTR("disabledApplicationIDs"), 0);

  v9 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "carrierName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "appendString:withName:", v10, CFSTR("carrierName"));

  v11 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "homeCountryCode");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "appendString:withName:", v12, CFSTR("homeCountryCode"));

}

@end
