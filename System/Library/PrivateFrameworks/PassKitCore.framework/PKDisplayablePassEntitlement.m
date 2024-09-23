@implementation PKDisplayablePassEntitlement

- (PKDisplayablePassEntitlement)init
{

  return 0;
}

+ (id)localizedEntitlementFromCarKeyEntitlement:(id)a3 pass:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "entitlementTemplate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "templateFields");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKDisplayablePassEntitlement _displayableEntitlementFromEntitlementTemplateType:carKeyEntitlementValue:templateFields:entitlementTemplates:sharedEntitlement:entitlement:pass:]((uint64_t)a1, v8, v9, v10, 0, 0, v7, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_displayableEntitlementFromEntitlementTemplateType:(void *)a3 carKeyEntitlementValue:(void *)a4 templateFields:(void *)a5 entitlementTemplates:(void *)a6 sharedEntitlement:(void *)a7 entitlement:(void *)a8 pass:
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  PKDisplayablePassEntitlement *v20;
  id *v21;
  __CFString *v22;
  __CFString *v23;
  __CFString *v24;
  int v25;
  unint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  __CFString *v31;
  __CFString *v32;
  __CFString *v33;
  int v34;
  unint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  __CFString *v52;
  id v53;
  id v55;
  void *v56;
  _QWORD v57[4];
  id v58;
  objc_super v59;

  v14 = a2;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v55 = a6;
  v18 = a7;
  v19 = a8;
  objc_opt_self();
  v20 = [PKDisplayablePassEntitlement alloc];
  if (v20)
  {
    v59.receiver = v20;
    v59.super_class = (Class)PKDisplayablePassEntitlement;
    v21 = (id *)objc_msgSendSuper2(&v59, sel_init, v55);
  }
  else
  {
    v21 = 0;
  }
  objc_storeStrong(v21 + 11, a6);
  objc_storeStrong(v21 + 12, a7);
  v21[10] = 0;
  v22 = (__CFString *)v14;
  v23 = CFSTR("legacyCarKeyEntitlementTemplate");
  if (v23 == v22)
  {

    goto LABEL_9;
  }
  v24 = v23;
  if (!v22 || !v23)
  {

    goto LABEL_14;
  }
  v25 = -[__CFString isEqualToString:](v22, "isEqualToString:", v23);

  if (v25)
  {
LABEL_9:
    v26 = objc_msgSend(v15, "unsignedIntegerValue", v55);
    if (v26 >= 6)
      v27 = 6;
    else
      v27 = v26;
    CarKeyLocalizedTitle(v16, v27, v19);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setLocalizedTitle:", v28);

    CarKeyLocalizedDescriptionTitle(v16, v27, v19);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setLocalizedSubtitle:", v29);

    PKLocalizedCredentialString(CFSTR("CAR_KEY_ENTITLEMENT_GROUP_SECTION_TITLE"), 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setLocalizedGroup:", v30);

    goto LABEL_24;
  }
LABEL_14:
  v31 = v22;
  v32 = CFSTR("carKeyEntitlementTemplateV2");
  if (v32 == v31)
  {

LABEL_20:
    v35 = objc_msgSend(v15, "unsignedIntegerValue", v55);
    if (v35 >= 6)
      v36 = 6;
    else
      v36 = v35;
    CarKeyLocalizedTitle(v16, v36, v19);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setLocalizedTitle:", v37);

    CarKeyLocalizedDescriptionTitle(v16, v36, v19);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setLocalizedSubtitle:", v38);

    PKLocalizedCredentialString(CFSTR("CAR_KEY_ENTITLEMENT_GROUP_SECTION_TITLE_SHARING_IN_CHAIN"), 0);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setLocalizedGroup:", v39);

LABEL_24:
    objc_msgSend(v21, "setDisplayStyle:", 2);
    goto LABEL_30;
  }
  v33 = v32;
  if (v22 && v32)
  {
    v34 = -[__CFString isEqualToString:](v31, "isEqualToString:", v32);

    if (!v34)
      goto LABEL_26;
    goto LABEL_20;
  }

LABEL_26:
  objc_msgSend(v17, "objectForKeyedSubscript:", v31, v55);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v40;
  if (v40)
  {
    objc_msgSend(v40, "setFieldInserts:", v16);
    objc_msgSend(v41, "localizedTitle");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setLocalizedTitle:", v42);

    objc_msgSend(v41, "localizedDescription");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setLocalizedSubtitle:", v43);

    objc_msgSend(v41, "localizedGroup");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setLocalizedGroup:", v44);

    objc_msgSend(v41, "icon");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setIconName:", v45);

    objc_msgSend(v21, "setDisplayStyle:", objc_msgSend(v41, "displayStyle"));
    objc_msgSend(v21, "setClearGroupWhenSelected:", objc_msgSend(v41, "clearGroupWhenSelected"));
    objc_msgSend(v21, "setGroupPriority:", objc_msgSend(v41, "groupRenderingPriority"));
  }
  else
  {
    v46 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    v57[0] = MEMORY[0x1E0C809B0];
    v57[1] = 3221225472;
    v57[2] = __177__PKDisplayablePassEntitlement__displayableEntitlementFromEntitlementTemplateType_carKeyEntitlementValue_templateFields_entitlementTemplates_sharedEntitlement_entitlement_pass___block_invoke;
    v57[3] = &unk_1E2AC28F0;
    v58 = v46;
    v47 = v46;
    objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v57);
    objc_msgSend(v21, "setLocalizedTitle:", v31);
    v48 = (void *)objc_msgSend(v47, "copy");
    objc_msgSend(v21, "setLocalizedSubtitle:", v48);

    objc_msgSend(v21, "setLocalizedGroup:", &stru_1E2ADF4C0);
    objc_msgSend(v21, "setDisplayStyle:", 1);

  }
LABEL_30:
  v49 = v21[7];
  v21[7] = v15;
  v50 = v15;

  v51 = v21[1];
  v21[1] = v22;
  v52 = v22;

  v53 = v21[2];
  v21[2] = v16;

  return v21;
}

+ (void)localizedEntitlementsFromEntitlements:(id)a3 pass:(id)a4 useCachedTemplates:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __105__PKDisplayablePassEntitlement_localizedEntitlementsFromEntitlements_pass_useCachedTemplates_completion___block_invoke;
  v16[3] = &unk_1E2AC2878;
  v17 = v10;
  v18 = v11;
  v19 = v12;
  v20 = a1;
  v13 = v12;
  v14 = v11;
  v15 = v10;
  +[PKDisplayablePassEntitlement _entitlementTemplatesUsingCachedTemplates:completion:]((uint64_t)a1, v7, v16);

}

void __105__PKDisplayablePassEntitlement_localizedEntitlementsFromEntitlements_pass_useCachedTemplates_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __105__PKDisplayablePassEntitlement_localizedEntitlementsFromEntitlements_pass_useCachedTemplates_completion___block_invoke_2;
  v7[3] = &unk_1E2AC2850;
  v10 = *(_QWORD *)(a1 + 56);
  v8 = v3;
  v4 = *(void **)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v6 = v3;
  v5 = (void *)objc_msgSend(v4, "pk_createArrayBySafelyApplyingBlock:", v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

id __105__PKDisplayablePassEntitlement_localizedEntitlementsFromEntitlements_pass_useCachedTemplates_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = *(_QWORD *)(a1 + 48);
  v4 = a2;
  objc_msgSend(v4, "entitlementTemplate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "templateFields");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PKDisplayablePassEntitlement _displayableEntitlementFromEntitlementTemplateType:carKeyEntitlementValue:templateFields:entitlementTemplates:sharedEntitlement:entitlement:pass:](v3, v5, v6, v7, *(void **)(a1 + 32), 0, v4, *(void **)(a1 + 40));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (void)_entitlementTemplatesUsingCachedTemplates:(void *)a3 completion:
{
  void (**v4)(id, void *);
  PKMAEntitlementTemplateManager *v5;
  PKMAEntitlementTemplateManager *v6;
  void *v7;
  _QWORD v8[4];
  void (**v9)(id, void *);

  v4 = a3;
  objc_opt_self();
  v5 = objc_alloc_init(PKMAEntitlementTemplateManager);
  v6 = v5;
  if (a2)
  {
    -[PKMAEntitlementTemplateManager cachedEntitlementTemplates](v5, "cachedEntitlementTemplates");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v7);

  }
  else
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __85__PKDisplayablePassEntitlement__entitlementTemplatesUsingCachedTemplates_completion___block_invoke;
    v8[3] = &unk_1E2ABE9A8;
    v9 = v4;
    -[PKMAEntitlementTemplateManager entitlementTemplates:](v6, "entitlementTemplates:", v8);

  }
}

+ (id)localizedEntitlementsFromDisplayableEntitlements:(id)a3 pass:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v6 = a3;
  v7 = a4;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__4;
  v15 = __Block_byref_object_dispose__4;
  v16 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __86__PKDisplayablePassEntitlement_localizedEntitlementsFromDisplayableEntitlements_pass___block_invoke;
  v10[3] = &unk_1E2ABDD38;
  v10[4] = &v11;
  objc_msgSend(a1, "localizedEntitlementsFromDisplayableEntitlements:pass:useCachedTemplates:completion:", v6, v7, 1, v10);
  v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __86__PKDisplayablePassEntitlement_localizedEntitlementsFromDisplayableEntitlements_pass___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

+ (void)localizedEntitlementsFromDisplayableEntitlements:(id)a3 pass:(id)a4 useCachedTemplates:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __116__PKDisplayablePassEntitlement_localizedEntitlementsFromDisplayableEntitlements_pass_useCachedTemplates_completion___block_invoke;
  v16[3] = &unk_1E2AC2878;
  v17 = v10;
  v18 = v11;
  v19 = v12;
  v20 = a1;
  v13 = v12;
  v14 = v11;
  v15 = v10;
  +[PKDisplayablePassEntitlement _entitlementTemplatesUsingCachedTemplates:completion:]((uint64_t)a1, v7, v16);

}

void __116__PKDisplayablePassEntitlement_localizedEntitlementsFromDisplayableEntitlements_pass_useCachedTemplates_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  uint64_t v10;

  v3 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __116__PKDisplayablePassEntitlement_localizedEntitlementsFromDisplayableEntitlements_pass_useCachedTemplates_completion___block_invoke_2;
  v7[3] = &unk_1E2AC28A0;
  v10 = *(_QWORD *)(a1 + 56);
  v8 = v3;
  v4 = *(void **)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v6 = v3;
  v5 = (void *)objc_msgSend(v4, "pk_createArrayBySafelyApplyingBlock:", v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

id __116__PKDisplayablePassEntitlement_localizedEntitlementsFromDisplayableEntitlements_pass_useCachedTemplates_completion___block_invoke_2(uint64_t a1, _QWORD *a2)
{
  uint64_t v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = *(_QWORD *)(a1 + 48);
  v4 = (void *)a2[1];
  v5 = a2;
  objc_msgSend(v5, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)v5[2];
  v8 = *(void **)(a1 + 32);
  objc_msgSend(v5, "sharedEntitlement");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "entitlement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[PKDisplayablePassEntitlement _displayableEntitlementFromEntitlementTemplateType:carKeyEntitlementValue:templateFields:entitlementTemplates:sharedEntitlement:entitlement:pass:](v3, v4, v6, v7, v8, v9, v10, *(void **)(a1 + 40));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __177__PKDisplayablePassEntitlement__displayableEntitlementFromEntitlementTemplateType_carKeyEntitlementValue_templateFields_entitlementTemplates_sharedEntitlement_entitlement_pass___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __177__PKDisplayablePassEntitlement__displayableEntitlementFromEntitlementTemplateType_carKeyEntitlementValue_templateFields_entitlementTemplates_sharedEntitlement_entitlement_pass___block_invoke_2;
  v4[3] = &unk_1E2AC28C8;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v4);

}

void __177__PKDisplayablePassEntitlement__displayableEntitlementFromEntitlementTemplateType_carKeyEntitlementValue_templateFields_entitlementTemplates_sharedEntitlement_entitlement_pass___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "length"))
    objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR(", "));
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@: %@"), v6, v5);

}

void __85__PKDisplayablePassEntitlement__entitlementTemplatesUsingCachedTemplates_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void (*v8)(void);
  NSObject *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    PKLogFacilityTypeGetObject(0x20uLL);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412290;
      v11 = v7;
      _os_log_impl(&dword_18FC92000, v9, OS_LOG_TYPE_DEFAULT, "Failed to fetch entitlement templates: %@", (uint8_t *)&v10, 0xCu);
    }

    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v8();

}

- (PKDisplayablePassEntitlement)initWithDictionary:(id)a3
{
  id v4;
  NSString *v5;
  NSString *localizedTitle;
  NSString *v7;
  NSString *localizedSubtitle;
  NSString *v9;
  NSString *localizedGroup;
  NSNumber *v11;
  NSNumber *value;
  PKPassEntitlement *v13;
  void *v14;
  PKPassEntitlement *v15;
  PKPassEntitlement *entitlement;
  PKPassSharedEntitlement *v17;
  void *v18;
  PKPassSharedEntitlement *v19;
  PKPassSharedEntitlement *sharedEntitlement;
  NSString *v21;
  NSString *entitlementTemplate;
  NSDictionary *v23;
  NSDictionary *templateFields;
  NSString *v25;
  NSString *iconName;
  void *v27;
  void *v28;
  PKDisplayablePassEntitlement *v29;
  objc_super v31;

  v4 = a3;
  if (v4)
  {
    if (self)
    {
      v31.receiver = self;
      v31.super_class = (Class)PKDisplayablePassEntitlement;
      self = -[PKDisplayablePassEntitlement init](&v31, sel_init);
      if (self)
      {
        objc_msgSend(v4, "PKStringForKey:", CFSTR("localizedTitle"));
        v5 = (NSString *)objc_claimAutoreleasedReturnValue();
        localizedTitle = self->_localizedTitle;
        self->_localizedTitle = v5;

        objc_msgSend(v4, "PKStringForKey:", CFSTR("localizedSubtitle"));
        v7 = (NSString *)objc_claimAutoreleasedReturnValue();
        localizedSubtitle = self->_localizedSubtitle;
        self->_localizedSubtitle = v7;

        objc_msgSend(v4, "PKStringForKey:", CFSTR("localizedGroup"));
        v9 = (NSString *)objc_claimAutoreleasedReturnValue();
        localizedGroup = self->_localizedGroup;
        self->_localizedGroup = v9;

        objc_msgSend(v4, "PKNumberForKey:", CFSTR("value"));
        v11 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        value = self->_value;
        self->_value = v11;

        v13 = [PKPassEntitlement alloc];
        objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("entitlement"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[PKPassEntitlement initWithDictionary:](v13, "initWithDictionary:", v14);
        entitlement = self->_entitlement;
        self->_entitlement = v15;

        v17 = [PKPassSharedEntitlement alloc];
        objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("sharedEntitlement"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[PKPassSharedEntitlement initWithDictionary:](v17, "initWithDictionary:", v18);
        sharedEntitlement = self->_sharedEntitlement;
        self->_sharedEntitlement = v19;

        objc_msgSend(v4, "PKStringForKey:", CFSTR("entitlementTemplate"));
        v21 = (NSString *)objc_claimAutoreleasedReturnValue();
        entitlementTemplate = self->_entitlementTemplate;
        self->_entitlementTemplate = v21;

        objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("templateFields"));
        v23 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
        templateFields = self->_templateFields;
        self->_templateFields = v23;

        objc_msgSend(v4, "PKStringForKey:", CFSTR("iconName"));
        v25 = (NSString *)objc_claimAutoreleasedReturnValue();
        iconName = self->_iconName;
        self->_iconName = v25;

        objc_msgSend(v4, "PKStringForKey:", CFSTR("displayStyle"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        self->_displayStyle = PKPassEntitlementDisplayStyleFromString(v27);

        self->_clearGroupWhenSelected = objc_msgSend(v4, "PKBoolForKey:", CFSTR("clearGroupWhenSelected"));
        objc_msgSend(v4, "PKNumberForKey:", CFSTR("groupPriority"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        self->_groupPriority = objc_msgSend(v28, "integerValue");

      }
    }
    self = self;
    v29 = self;
  }
  else
  {
    v29 = 0;
  }

  return v29;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_localizedTitle, CFSTR("localizedTitle"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_localizedSubtitle, CFSTR("localizedSubtitle"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_localizedGroup, CFSTR("localizedGroup"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_value, CFSTR("value"));
  -[PKPassEntitlement dictionaryRepresentation](self->_entitlement, "dictionaryRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("entitlement"));

  -[PKPassSharedEntitlement dictionaryRepresentation](self->_sharedEntitlement, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("sharedEntitlement"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_entitlementTemplate, CFSTR("entitlementTemplate"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_templateFields, CFSTR("templateFields"));
  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_iconName, CFSTR("iconName"));
  PKPassEntitlementDisplayStyleToString(self->_displayStyle);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("displayStyle"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_clearGroupWhenSelected);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("clearGroupWhenSelected"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_groupPriority);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("groupPriority"));

  v9 = (void *)objc_msgSend(v3, "copy");
  return v9;
}

- (void)replaceEntitlementWithSharedEntitlement:(id)a3
{
  PKPassSharedEntitlement *v4;
  PKPassEntitlement *entitlement;
  PKPassSharedEntitlement *sharedEntitlement;

  v4 = (PKPassSharedEntitlement *)a3;
  entitlement = self->_entitlement;
  self->_entitlement = 0;

  sharedEntitlement = self->_sharedEntitlement;
  self->_sharedEntitlement = v4;

}

- (NSString)entitlementIdentifier
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[PKPassEntitlement identifier](self->_entitlement, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[PKPassSharedEntitlement entitlementIdentifier](self->_sharedEntitlement, "entitlementIdentifier");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSString *)v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKDisplayablePassEntitlement)initWithCoder:(id)a3
{
  id v4;
  PKDisplayablePassEntitlement *v5;
  uint64_t v6;
  NSString *localizedTitle;
  uint64_t v8;
  NSString *localizedSubtitle;
  uint64_t v10;
  NSString *localizedGroup;
  uint64_t v12;
  PKPassSharedEntitlement *sharedEntitlement;
  uint64_t v14;
  PKPassEntitlement *entitlement;
  uint64_t v16;
  NSNumber *value;
  uint64_t v18;
  NSString *entitlementTemplate;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  NSDictionary *templateFields;
  uint64_t v27;
  NSString *iconName;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)PKDisplayablePassEntitlement;
  v5 = -[PKDisplayablePassEntitlement init](&v30, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedTitle"));
    v6 = objc_claimAutoreleasedReturnValue();
    localizedTitle = v5->_localizedTitle;
    v5->_localizedTitle = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedSubtitle"));
    v8 = objc_claimAutoreleasedReturnValue();
    localizedSubtitle = v5->_localizedSubtitle;
    v5->_localizedSubtitle = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("localizedGroup"));
    v10 = objc_claimAutoreleasedReturnValue();
    localizedGroup = v5->_localizedGroup;
    v5->_localizedGroup = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sharedEntitlement"));
    v12 = objc_claimAutoreleasedReturnValue();
    sharedEntitlement = v5->_sharedEntitlement;
    v5->_sharedEntitlement = (PKPassSharedEntitlement *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("entitlement"));
    v14 = objc_claimAutoreleasedReturnValue();
    entitlement = v5->_entitlement;
    v5->_entitlement = (PKPassEntitlement *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("value"));
    v16 = objc_claimAutoreleasedReturnValue();
    value = v5->_value;
    v5->_value = (NSNumber *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("entitlementTemplate"));
    v18 = objc_claimAutoreleasedReturnValue();
    entitlementTemplate = v5->_entitlementTemplate;
    v5->_entitlementTemplate = (NSString *)v18;

    v20 = (void *)MEMORY[0x1E0C99E60];
    v21 = objc_opt_class();
    v22 = objc_opt_class();
    v23 = objc_opt_class();
    objc_msgSend(v20, "setWithObjects:", v21, v22, v23, objc_opt_class(), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("templateFields"));
    v25 = objc_claimAutoreleasedReturnValue();
    templateFields = v5->_templateFields;
    v5->_templateFields = (NSDictionary *)v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("iconName"));
    v27 = objc_claimAutoreleasedReturnValue();
    iconName = v5->_iconName;
    v5->_iconName = (NSString *)v27;

    v5->_displayStyle = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("displayStyle"));
    v5->_clearGroupWhenSelected = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("clearGroupWhenSelected"));
    v5->_groupPriority = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("groupPriority"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *localizedTitle;
  id v5;

  localizedTitle = self->_localizedTitle;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", localizedTitle, CFSTR("localizedTitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedSubtitle, CFSTR("localizedSubtitle"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_localizedGroup, CFSTR("localizedGroup"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sharedEntitlement, CFSTR("sharedEntitlement"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_entitlement, CFSTR("entitlement"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_value, CFSTR("value"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_entitlementTemplate, CFSTR("entitlementTemplate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_templateFields, CFSTR("templateFields"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_iconName, CFSTR("iconName"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_displayStyle, CFSTR("displayStyle"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_clearGroupWhenSelected, CFSTR("clearGroupWhenSelected"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_groupPriority, CFSTR("groupPriority"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; "), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR("localizedTitle: '%@'; "), self->_localizedTitle);
  objc_msgSend(v6, "appendFormat:", CFSTR("localizedSubtitle: '%@'; "), self->_localizedSubtitle);
  objc_msgSend(v6, "appendFormat:", CFSTR("localizedGroup: '%@'; "), self->_localizedGroup);
  objc_msgSend(v6, "appendFormat:", CFSTR("value: '%@'; "), self->_value);
  objc_msgSend(v6, "appendFormat:", CFSTR("entitlementTemplate: '%@'; "), self->_entitlementTemplate);
  objc_msgSend(v6, "appendFormat:", CFSTR("templateFields: '%@'; "), self->_templateFields);
  objc_msgSend(v6, "appendFormat:", CFSTR("clearGroupWhenSelected: '%i'; "), self->_clearGroupWhenSelected);
  objc_msgSend(v6, "appendFormat:", CFSTR("iconName: '%@'; "), self->_iconName);
  objc_msgSend(v6, "appendFormat:", CFSTR("style: %lu; "), self->_displayStyle);
  if (self->_sharedEntitlement)
    objc_msgSend(v6, "appendFormat:", CFSTR("sharedEntitlement: '%@'; "), self->_sharedEntitlement);
  else
    objc_msgSend(v6, "appendFormat:", CFSTR("entitlement: '%@'; "), self->_entitlement);
  objc_msgSend(v6, "appendFormat:", CFSTR("groupPriority: %lu; "), self->_groupPriority);
  objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_localizedTitle)
    objc_msgSend(v3, "addObject:");
  if (self->_localizedSubtitle)
    objc_msgSend(v4, "addObject:");
  if (self->_localizedGroup)
    objc_msgSend(v4, "addObject:");
  if (self->_sharedEntitlement)
    objc_msgSend(v4, "addObject:");
  if (self->_entitlement)
    objc_msgSend(v4, "addObject:");
  if (self->_value)
    objc_msgSend(v4, "addObject:");
  if (self->_entitlementTemplate)
    objc_msgSend(v4, "addObject:");
  if (self->_templateFields)
    objc_msgSend(v4, "addObject:");
  if (self->_iconName)
    objc_msgSend(v4, "addObject:");
  if (self->_displayStyle)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_clearGroupWhenSelected);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v6);

  v7 = PKCombinedHash(17, v4);
  v8 = self->_groupPriority - v7 + 32 * v7;

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  PKDisplayablePassEntitlement *v4;
  PKDisplayablePassEntitlement *v5;
  PKDisplayablePassEntitlement *v6;
  NSString *localizedTitle;
  NSString *v8;
  NSString *localizedSubtitle;
  NSString *v10;
  NSString *localizedGroup;
  NSString *v12;
  PKPassSharedEntitlement *sharedEntitlement;
  PKPassSharedEntitlement *v14;
  PKPassEntitlement *entitlement;
  PKPassEntitlement *v16;
  NSNumber *value;
  NSNumber *v18;
  NSString *entitlementTemplate;
  NSString *v20;
  NSDictionary *templateFields;
  NSDictionary *v22;
  NSString *iconName;
  NSString *v24;

  v4 = (PKDisplayablePassEntitlement *)a3;
  v5 = v4;
  if (v4 == self)
  {
    LOBYTE(self) = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v6 = v5;
        if (!self)
        {
LABEL_56:

          goto LABEL_57;
        }
        localizedTitle = self->_localizedTitle;
        v8 = v6->_localizedTitle;
        if (localizedTitle && v8)
        {
          if ((-[NSString isEqual:](localizedTitle, "isEqual:") & 1) == 0)
            goto LABEL_55;
        }
        else if (localizedTitle != v8)
        {
          goto LABEL_55;
        }
        localizedSubtitle = self->_localizedSubtitle;
        v10 = v6->_localizedSubtitle;
        if (localizedSubtitle && v10)
        {
          if ((-[NSString isEqual:](localizedSubtitle, "isEqual:") & 1) == 0)
            goto LABEL_55;
        }
        else if (localizedSubtitle != v10)
        {
          goto LABEL_55;
        }
        localizedGroup = self->_localizedGroup;
        v12 = v6->_localizedGroup;
        if (localizedGroup && v12)
        {
          if ((-[NSString isEqual:](localizedGroup, "isEqual:") & 1) == 0)
            goto LABEL_55;
        }
        else if (localizedGroup != v12)
        {
          goto LABEL_55;
        }
        sharedEntitlement = self->_sharedEntitlement;
        v14 = v6->_sharedEntitlement;
        if (sharedEntitlement && v14)
        {
          if (!-[PKPassSharedEntitlement isEqual:](sharedEntitlement, "isEqual:"))
            goto LABEL_55;
        }
        else if (sharedEntitlement != v14)
        {
          goto LABEL_55;
        }
        entitlement = self->_entitlement;
        v16 = v6->_entitlement;
        if (entitlement && v16)
        {
          if (!-[PKPassEntitlement isEqual:](entitlement, "isEqual:"))
            goto LABEL_55;
        }
        else if (entitlement != v16)
        {
          goto LABEL_55;
        }
        value = self->_value;
        v18 = v6->_value;
        if (value && v18)
        {
          if ((-[NSNumber isEqual:](value, "isEqual:") & 1) == 0)
            goto LABEL_55;
        }
        else if (value != v18)
        {
          goto LABEL_55;
        }
        entitlementTemplate = self->_entitlementTemplate;
        v20 = v6->_entitlementTemplate;
        if (entitlementTemplate && v20)
        {
          if ((-[NSString isEqual:](entitlementTemplate, "isEqual:") & 1) == 0)
            goto LABEL_55;
        }
        else if (entitlementTemplate != v20)
        {
          goto LABEL_55;
        }
        templateFields = self->_templateFields;
        v22 = v6->_templateFields;
        if (templateFields && v22)
        {
          if ((-[NSDictionary isEqual:](templateFields, "isEqual:") & 1) == 0)
            goto LABEL_55;
        }
        else if (templateFields != v22)
        {
          goto LABEL_55;
        }
        if (self->_clearGroupWhenSelected == v6->_clearGroupWhenSelected)
        {
          iconName = self->_iconName;
          v24 = v6->_iconName;
          if (iconName && v24)
          {
            if ((-[NSString isEqual:](iconName, "isEqual:") & 1) == 0)
              goto LABEL_55;
          }
          else if (iconName != v24)
          {
            goto LABEL_55;
          }
          if (self->_displayStyle == v6->_displayStyle)
          {
            LOBYTE(self) = self->_groupPriority == v6->_groupPriority;
            goto LABEL_56;
          }
        }
LABEL_55:
        LOBYTE(self) = 0;
        goto LABEL_56;
      }
    }
    LOBYTE(self) = 0;
  }
LABEL_57:

  return (char)self;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKDisplayablePassEntitlement *v4;
  PKDisplayablePassEntitlement *v5;
  uint64_t v6;
  NSString *localizedTitle;
  uint64_t v8;
  NSString *localizedSubtitle;
  uint64_t v10;
  NSString *localizedGroup;
  uint64_t v12;
  PKPassSharedEntitlement *sharedEntitlement;
  uint64_t v14;
  PKPassEntitlement *entitlement;
  uint64_t v16;
  NSNumber *value;
  uint64_t v18;
  NSString *entitlementTemplate;
  uint64_t v20;
  NSDictionary *templateFields;
  uint64_t v22;
  NSString *iconName;
  objc_super v25;

  v4 = +[PKDisplayablePassEntitlement allocWithZone:](PKDisplayablePassEntitlement, "allocWithZone:", a3);
  if (v4)
  {
    v25.receiver = v4;
    v25.super_class = (Class)PKDisplayablePassEntitlement;
    v5 = -[PKDisplayablePassEntitlement init](&v25, sel_init);
  }
  else
  {
    v5 = 0;
  }
  v6 = -[NSString copy](self->_localizedTitle, "copy");
  localizedTitle = v5->_localizedTitle;
  v5->_localizedTitle = (NSString *)v6;

  v8 = -[NSString copy](self->_localizedSubtitle, "copy");
  localizedSubtitle = v5->_localizedSubtitle;
  v5->_localizedSubtitle = (NSString *)v8;

  v10 = -[NSString copy](self->_localizedGroup, "copy");
  localizedGroup = v5->_localizedGroup;
  v5->_localizedGroup = (NSString *)v10;

  v12 = -[PKPassSharedEntitlement copy](self->_sharedEntitlement, "copy");
  sharedEntitlement = v5->_sharedEntitlement;
  v5->_sharedEntitlement = (PKPassSharedEntitlement *)v12;

  v14 = -[PKPassEntitlement copy](self->_entitlement, "copy");
  entitlement = v5->_entitlement;
  v5->_entitlement = (PKPassEntitlement *)v14;

  v16 = -[NSNumber copy](self->_value, "copy");
  value = v5->_value;
  v5->_value = (NSNumber *)v16;

  v18 = -[NSString copy](self->_entitlementTemplate, "copy");
  entitlementTemplate = v5->_entitlementTemplate;
  v5->_entitlementTemplate = (NSString *)v18;

  v20 = -[NSDictionary copy](self->_templateFields, "copy");
  templateFields = v5->_templateFields;
  v5->_templateFields = (NSDictionary *)v20;

  v5->_clearGroupWhenSelected = self->_clearGroupWhenSelected;
  v22 = -[NSString copy](self->_iconName, "copy");
  iconName = v5->_iconName;
  v5->_iconName = (NSString *)v22;

  v5->_displayStyle = self->_displayStyle;
  v5->_groupPriority = self->_groupPriority;
  return v5;
}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  NSString *localizedTitle;
  void *v10;
  int64_t v11;

  v4 = a3;
  -[PKPassEntitlement value](self->_entitlement, "value");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entitlement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v8 = v7 == 0;
  else
    v8 = 1;
  if (v8)
  {
    localizedTitle = self->_localizedTitle;
    objc_msgSend(v4, "localizedTitle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[NSString compare:](localizedTitle, "compare:", v10);

  }
  else
  {
    v11 = objc_msgSend(v5, "compare:", v7);
  }

  return v11;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
  objc_storeStrong((id *)&self->_localizedTitle, a3);
}

- (NSString)localizedSubtitle
{
  return self->_localizedSubtitle;
}

- (void)setLocalizedSubtitle:(id)a3
{
  objc_storeStrong((id *)&self->_localizedSubtitle, a3);
}

- (NSString)localizedGroup
{
  return self->_localizedGroup;
}

- (void)setLocalizedGroup:(id)a3
{
  objc_storeStrong((id *)&self->_localizedGroup, a3);
}

- (NSNumber)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
  objc_storeStrong((id *)&self->_value, a3);
}

- (NSString)iconName
{
  return self->_iconName;
}

- (void)setIconName:(id)a3
{
  objc_storeStrong((id *)&self->_iconName, a3);
}

- (unint64_t)displayStyle
{
  return self->_displayStyle;
}

- (void)setDisplayStyle:(unint64_t)a3
{
  self->_displayStyle = a3;
}

- (int64_t)groupPriority
{
  return self->_groupPriority;
}

- (void)setGroupPriority:(int64_t)a3
{
  self->_groupPriority = a3;
}

- (BOOL)clearGroupWhenSelected
{
  return self->_clearGroupWhenSelected;
}

- (void)setClearGroupWhenSelected:(BOOL)a3
{
  self->_clearGroupWhenSelected = a3;
}

- (PKPassSharedEntitlement)sharedEntitlement
{
  return self->_sharedEntitlement;
}

- (PKPassEntitlement)entitlement
{
  return self->_entitlement;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entitlement, 0);
  objc_storeStrong((id *)&self->_sharedEntitlement, 0);
  objc_storeStrong((id *)&self->_iconName, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_localizedGroup, 0);
  objc_storeStrong((id *)&self->_localizedSubtitle, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_templateFields, 0);
  objc_storeStrong((id *)&self->_entitlementTemplate, 0);
}

@end
