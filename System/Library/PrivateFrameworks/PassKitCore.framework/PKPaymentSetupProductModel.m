@implementation PKPaymentSetupProductModel

- (PKPaymentSetupProductModel)init
{
  PKPaymentSetupProductModel *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *paymentSetupProducts;
  NSMutableArray *v5;
  NSMutableArray *allSections;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKPaymentSetupProductModel;
  v2 = -[PKPaymentSetupProductModel init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    paymentSetupProducts = v2->_paymentSetupProducts;
    v2->_paymentSetupProducts = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    allSections = v2->_allSections;
    v2->_allSections = v5;

  }
  return v2;
}

- (id)allSections
{
  return (id)-[NSMutableArray copy](self->_allSections, "copy");
}

- (void)setAllSections:(id)a3
{
  NSMutableArray *v4;
  NSMutableArray *allSections;

  v4 = (NSMutableArray *)objc_msgSend(a3, "mutableCopy");
  allSections = self->_allSections;
  self->_allSections = v4;

}

- (void)updatePaymentSetupProducts:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSMutableDictionary *paymentSetupProducts;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        paymentSetupProducts = self->_paymentSetupProducts;
        objc_msgSend(v9, "productIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary safelySetObject:forKey:](paymentSetupProducts, "safelySetObject:forKey:", v9, v11);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (void)removePaymentSetupProducts:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSMutableDictionary *paymentSetupProducts;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        paymentSetupProducts = self->_paymentSetupProducts;
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "productIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary removeObjectForKey:](paymentSetupProducts, "removeObjectForKey:", v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

}

- (void)setPaymentSetupProducts:(id)a3
{
  NSMutableDictionary *paymentSetupProducts;
  id v5;

  paymentSetupProducts = self->_paymentSetupProducts;
  v5 = a3;
  -[NSMutableDictionary removeAllObjects](paymentSetupProducts, "removeAllObjects");
  -[PKPaymentSetupProductModel updatePaymentSetupProducts:](self, "updatePaymentSetupProducts:", v5);

}

- (id)allSetupProducts
{
  return (id)-[NSMutableDictionary allValues](self->_paymentSetupProducts, "allValues");
}

- (id)productForProductIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_paymentSetupProducts, "objectForKey:", a3);
}

- (id)setupProductsOfType:(unint64_t)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[NSMutableDictionary allValues](self->_paymentSetupProducts, "allValues", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "configuration");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "type");

        if (v13 == a3)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  v14 = (void *)objc_msgSend(v5, "copy");
  return v14;
}

- (id)productsForProductIdentifiers:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        -[NSMutableDictionary objectForKey:](self->_paymentSetupProducts, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "safelyAddObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_msgSend(v5, "copy");
  return v12;
}

- (id)availableProductsForProductIdentifiers:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        -[NSMutableDictionary objectForKey:](self->_paymentSetupProducts, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10), (_QWORD)v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "configuration");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "state");

        if (v13 != 2)
          objc_msgSend(v5, "safelyAddObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  v14 = (void *)objc_msgSend(v5, "copy");
  return v14;
}

- (id)productsForFeatureIdentifier:(unint64_t)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[NSMutableDictionary allValues](self->_paymentSetupProducts, "allValues", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "configuration");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "featureIdentifier");

        if (v13 == a3)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  v14 = (void *)objc_msgSend(v5, "copy");
  return v14;
}

- (id)availableProductsForFeatureIdentifier:(unint64_t)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[NSMutableDictionary allValues](self->_paymentSetupProducts, "allValues", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v11, "configuration");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "state");

        objc_msgSend(v11, "configuration");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "featureIdentifier") != a3 || v13 == 2)
        {

        }
        else
        {

          if (v13)
            objc_msgSend(v5, "addObject:", v11);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v8);
  }

  v16 = (void *)objc_msgSend(v5, "copy");
  return v16;
}

- (id)identityProductForState:(id)a3 country:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  int v21;
  id v22;
  id v23;
  char v24;
  id v25;
  id v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v27 = a4;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[NSMutableDictionary allValues](self->_paymentSetupProducts, "allValues");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v30;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v30 != v9)
        objc_enumerationMutation(obj);
      v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v10);
      objc_msgSend(v11, "configuration");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "type");

      if (v13 != 10)
        goto LABEL_21;
      objc_msgSend(v11, "clientInfo");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "PKStringForKey:", CFSTR("administrativeArea"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "clientInfo");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "PKStringForKey:", CFSTR("country"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = v15;
      v19 = v6;
      v20 = v19;
      if (v18 == v19)
        break;
      if (v6 && v18)
      {
        v21 = objc_msgSend(v18, "isEqualToString:", v19);

        if (!v21)
          goto LABEL_20;
        goto LABEL_13;
      }
      v22 = v18;
LABEL_19:

LABEL_20:
LABEL_21:
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_23;
      }
    }

LABEL_13:
    v22 = v17;
    v23 = v27;
    v20 = v23;
    if (v22 == v23)
    {

      v22 = v20;
LABEL_25:
      v25 = v11;

      goto LABEL_26;
    }
    if (v27 && v22)
    {
      v24 = objc_msgSend(v22, "isEqualToString:", v23);

      if ((v24 & 1) != 0)
        goto LABEL_25;
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_23:
  v25 = 0;
LABEL_26:

  return v25;
}

- (void)updateWithPaymentSetupProductsResponse:(id)a3 productsFilter:(id)a4 sectionsFilter:(id)a5
{
  id v8;
  uint64_t v9;
  NSMutableDictionary *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  const char *v20;
  NSMutableDictionary *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  void *v29;
  NSMutableDictionary *paymentSetupProducts;
  void *v31;
  NSString *v32;
  NSString *localizedTitle;
  NSString *v34;
  NSString *localizedSubtitle;
  uint64_t k;
  PKPaymentSetupProductSection *v37;
  id v38;
  uint64_t m;
  void *v40;
  void *v41;
  PKPaymentSetupProductModel *v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t n;
  void *v51;
  PKPaymentSetupProductModel *v52;
  uint64_t v53;
  char v54;
  NSObject *v55;
  char *v56;
  void *v57;
  uint64_t v58;
  NSObject *v59;
  NSMutableArray *v60;
  NSMutableArray *allSections;
  NSMutableArray *v62;
  void *v63;
  void *v64;
  void (**v65)(void);
  void (**v66)(void);
  void *v67;
  void *v68;
  NSMutableArray *v69;
  id obj;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  id v75;
  PKPaymentSetupProductSection *v76;
  uint64_t v77;
  uint64_t v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  _BYTE v99[128];
  _BYTE v100[128];
  _BYTE v101[128];
  uint8_t v102[128];
  uint8_t buf[4];
  const char *v104;
  __int16 v105;
  void *v106;
  _BYTE v107[128];
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v65 = (void (**)(void))a4;
  v66 = (void (**)(void))a5;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("partners"));
  v9 = objc_claimAutoreleasedReturnValue();
  v68 = v8;
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("products"));
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v64 = (void *)v9;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v95 = 0u;
      v96 = 0u;
      v97 = 0u;
      v98 = 0u;
      -[NSMutableDictionary allValues](self->_paymentSetupProducts, "allValues");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v95, v107, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v96;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v96 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * i);
            if ((objc_msgSend(v16, "isServerDriven") & 1) == 0)
            {
              objc_msgSend(v16, "productIdentifier");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary safelySetObject:forKey:](v10, "safelySetObject:forKey:", v16, v17);

            }
          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v95, v107, 16);
        }
        while (v13);
      }

      if (PKPaymentSetupMergeProductsPartnersAPIEnabled())
      {
        -[PKPaymentSetupProductModel _paymentSetupProductsWithProducts:existingPaymentSetupProducts:](self, "_paymentSetupProductsWithProducts:existingPaymentSetupProducts:", v67, self->_paymentSetupProducts);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        PKLogFacilityTypeGetObject(6uLL);
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v104 = "-[PKPaymentSetupProductModel updateWithPaymentSetupProductsResponse:productsFilter:sectionsFilter:]";
          v105 = 2112;
          v106 = v18;
          v20 = "%s - PKPaymentSetupMergeProductsPartnersAPIEnabled On: supportsDigitalIssuance: %@";
LABEL_18:
          _os_log_impl(&dword_18FC92000, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 0x16u);
        }
      }
      else
      {
        -[PKPaymentSetupProductModel _paymentSetupProductsWithPartners:products:existingPaymentSetupProducts:](self, "_paymentSetupProductsWithPartners:products:existingPaymentSetupProducts:", v64, v67, self->_paymentSetupProducts);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        PKLogFacilityTypeGetObject(6uLL);
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315394;
          v104 = "-[PKPaymentSetupProductModel updateWithPaymentSetupProductsResponse:productsFilter:sectionsFilter:]";
          v105 = 2112;
          v106 = v18;
          v20 = "%s - PKPaymentSetupMergeProductsPartnersAPIEnabled Off: supportsDigitalIssuance: %@";
          goto LABEL_18;
        }
      }

      if (v65)
      {
        v65[2]();
        v22 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v22 = v18;
      }
      v93 = 0u;
      v94 = 0u;
      v91 = 0u;
      v92 = 0u;
      v23 = v22;
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v91, v102, 16);
      if (v24)
      {
        v25 = v24;
        v26 = *(_QWORD *)v92;
        do
        {
          for (j = 0; j != v25; ++j)
          {
            if (*(_QWORD *)v92 != v26)
              objc_enumerationMutation(v23);
            v28 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * j);
            objc_msgSend(v28, "productIdentifier");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary safelySetObject:forKey:](v10, "safelySetObject:forKey:", v28, v29);

          }
          v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v91, v102, 16);
        }
        while (v25);
      }

      paymentSetupProducts = self->_paymentSetupProducts;
      self->_paymentSetupProducts = v10;

      goto LABEL_30;
    }
  }
  v21 = self->_paymentSetupProducts;
  self->_paymentSetupProducts = 0;

LABEL_30:
  objc_msgSend(v68, "objectForKeyedSubscript:", CFSTR("categories"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    allSections = self->_allSections;
    self->_allSections = 0;
    goto LABEL_92;
  }
  objc_msgSend(v31, "PKStringForKey:", CFSTR("localizedTitle"));
  v32 = (NSString *)objc_claimAutoreleasedReturnValue();
  localizedTitle = self->_localizedTitle;
  self->_localizedTitle = v32;

  objc_msgSend(v31, "PKStringForKey:", CFSTR("localizedSubtitle"));
  v34 = (NSString *)objc_claimAutoreleasedReturnValue();
  localizedSubtitle = self->_localizedSubtitle;
  self->_localizedSubtitle = v34;

  v69 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v63 = v31;
  objc_msgSend(v31, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("sections"));
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v72 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v101, 16);
  if (!v72)
    goto LABEL_87;
  v71 = *(_QWORD *)v88;
  do
  {
    for (k = 0; k != v72; ++k)
    {
      if (*(_QWORD *)v88 != v71)
        objc_enumerationMutation(obj);
      v37 = -[PKPaymentSetupProductSection initWithDictionary:]([PKPaymentSetupProductSection alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v87 + 1) + 8 * k));
      if (v37)
      {
        v73 = k;
        v38 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v83 = 0u;
        v84 = 0u;
        v85 = 0u;
        v86 = 0u;
        -[PKPaymentSetupProductSection categories](v37, "categories");
        v74 = (id)objc_claimAutoreleasedReturnValue();
        v78 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v83, v100, 16);
        if (!v78)
          goto LABEL_79;
        v76 = v37;
        v77 = *(_QWORD *)v84;
        v75 = v38;
        while (1)
        {
          for (m = 0; m != v78; ++m)
          {
            if (*(_QWORD *)v84 != v77)
              objc_enumerationMutation(v74);
            v40 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * m);
            objc_msgSend(v40, "identifier");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v41, "isEqualToString:", CFSTR("transit")))
            {
              v42 = self;
              v43 = 3;
LABEL_50:
              -[PKPaymentSetupProductModel setupProductsOfType:](v42, "setupProductsOfType:", v43);
              v44 = objc_claimAutoreleasedReturnValue();
              goto LABEL_51;
            }
            if (objc_msgSend(v41, "isEqualToString:", CFSTR("carKey")))
            {
              v42 = self;
              v43 = 11;
              goto LABEL_50;
            }
            if (objc_msgSend(v41, "isEqualToString:", CFSTR("identity")))
            {
              v42 = self;
              v43 = 10;
              goto LABEL_50;
            }
            if (objc_msgSend(v41, "isEqualToString:", CFSTR("eMoney")))
            {
              v42 = self;
              v43 = 4;
              goto LABEL_50;
            }
            if (objc_msgSend(v41, "isEqualToString:", CFSTR("appleCard")))
            {
              v52 = self;
              v53 = 2;
            }
            else
            {
              if (!objc_msgSend(v41, "isEqualToString:", CFSTR("asp")))
              {
                if (objc_msgSend(v41, "isEqualToString:", CFSTR("creditDebit")))
                {
                  v42 = self;
                  v43 = 5;
                }
                else
                {
                  if (!objc_msgSend(v41, "isEqualToString:", CFSTR("Barcode")))
                  {
                    v45 = 0;
LABEL_70:
                    v46 = 0;
                    goto LABEL_71;
                  }
                  v42 = self;
                  v43 = 9;
                }
                goto LABEL_50;
              }
              v52 = self;
              v53 = 4;
            }
            -[PKPaymentSetupProductModel productsForFeatureIdentifier:](v52, "productsForFeatureIdentifier:", v53);
            v44 = objc_claimAutoreleasedReturnValue();
LABEL_51:
            v45 = (id)v44;
            if (!v44)
              goto LABEL_70;
            v46 = objc_alloc_init(MEMORY[0x1E0C99E20]);
            v79 = 0u;
            v80 = 0u;
            v81 = 0u;
            v82 = 0u;
            v45 = v45;
            v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v79, v99, 16);
            if (v47)
            {
              v48 = v47;
              v49 = *(_QWORD *)v80;
              do
              {
                for (n = 0; n != v48; ++n)
                {
                  if (*(_QWORD *)v80 != v49)
                    objc_enumerationMutation(v45);
                  objc_msgSend(*(id *)(*((_QWORD *)&v79 + 1) + 8 * n), "productIdentifier");
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v46, "addObject:", v51);

                }
                v48 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v79, v99, 16);
              }
              while (v48);
            }

            v38 = v75;
            v37 = v76;
LABEL_71:
            v54 = objc_msgSend(v40, "needsProducts");
            if (objc_msgSend(v46, "count") || (v54 & 1) == 0)
            {
              objc_msgSend(v40, "setProductIdentifiers:", v46);
              objc_msgSend(v38, "addObject:", v40);
            }
            else
            {
              PKLogFacilityTypeGetObject(6uLL);
              v55 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v40, "identifier");
                v56 = (char *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v104 = v56;
                _os_log_impl(&dword_18FC92000, v55, OS_LOG_TYPE_DEFAULT, "Dropping category: %@ as no matching products found", buf, 0xCu);

              }
            }
            -[PKPaymentSetupProductSection setCategories:](v37, "setCategories:", v38);

          }
          v78 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v83, v100, 16);
          if (!v78)
          {
LABEL_79:

            -[PKPaymentSetupProductSection categories](v37, "categories");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v58 = objc_msgSend(v57, "count");

            if (v58)
            {
              -[NSMutableArray addObject:](v69, "addObject:", v37);
            }
            else
            {
              PKLogFacilityTypeGetObject(6uLL);
              v59 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_18FC92000, v59, OS_LOG_TYPE_DEFAULT, "Dropping section as no matching products found for any category", buf, 2u);
              }

            }
            k = v73;

            break;
          }
        }
      }

    }
    v72 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v87, v101, 16);
  }
  while (v72);
LABEL_87:
  if (v66)
  {
    v66[2]();
    v60 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v60 = v69;
  }
  v62 = self->_allSections;
  self->_allSections = v60;

  v31 = v63;
  allSections = v69;
LABEL_92:

}

- (void)addManualEntrySection:(id)a3
{
  void (**v4)(id, void *);
  PKPaymentSetupProductCategory *v5;
  PKPaymentSetupProductSection *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, void *))a3;
  v5 = objc_alloc_init(PKPaymentSetupProductCategory);
  -[PKPaymentSetupProductCategory setIdentifier:](v5, "setIdentifier:", CFSTR("creditDebit"));
  v6 = objc_alloc_init(PKPaymentSetupProductSection);
  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaymentSetupProductSection setCategories:](v6, "setCategories:", v7);

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v4[2](v4, v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }
  -[NSMutableArray addObjectsFromArray:](self->_allSections, "addObjectsFromArray:", v8);

}

- (void)addCarKeyCategory
{
  PKPaymentSetupProductCategory *v3;
  void *v4;
  PKPaymentSetupProductSection *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PKPaymentSetupProductModel *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(PKPaymentSetupProductCategory);
  -[PKPaymentSetupProductCategory setIdentifier:](v3, "setIdentifier:", CFSTR("carKey"));
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("carKey"), 0);
  -[PKPaymentSetupProductCategory setProductIdentifiers:](v3, "setProductIdentifiers:", v4);

  -[PKPaymentSetupProductCategory setExcludedContexts:](v3, "setExcludedContexts:", 7);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[PKPaymentSetupProductModel allSections](self, "allSections");
  v5 = (PKPaymentSetupProductSection *)objc_claimAutoreleasedReturnValue();
  v6 = -[PKPaymentSetupProductSection countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    v14 = self;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "categories");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "indexOfObjectPassingTest:", &__block_literal_global_885) != 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_12;
        if (objc_msgSend(v11, "indexOfObjectPassingTest:", &__block_literal_global_886) != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v11, "arrayByAddingObject:", v3);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setCategories:", v13);

LABEL_12:
          goto LABEL_13;
        }

      }
      v7 = -[PKPaymentSetupProductSection countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      self = v14;
      if (v7)
        continue;
      break;
    }
  }

  v5 = objc_alloc_init(PKPaymentSetupProductSection);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v3, 0);
  -[PKPaymentSetupProductSection setCategories:](v5, "setCategories:", v12);

  -[NSMutableArray addObject:](self->_allSections, "addObject:", v5);
LABEL_13:

}

uint64_t __47__PKPaymentSetupProductModel_addCarKeyCategory__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("carKey"));

  return v3;
}

uint64_t __47__PKPaymentSetupProductModel_addCarKeyCategory__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("creditDebit"));

  return v3;
}

- (void)removeCarKeyCategory
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[PKPaymentSetupProductModel allSections](self, "allSections", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(v7, "categories");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)objc_msgSend(v8, "mutableCopy");

        v10 = objc_msgSend(v9, "indexOfObjectPassingTest:", &__block_literal_global_887);
        if (v10 != 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v9, "removeObjectAtIndex:", v10);
          objc_msgSend(v7, "setCategories:", v9);

          goto LABEL_11;
        }

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

}

uint64_t __50__PKPaymentSetupProductModel_removeCarKeyCategory__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("carKey"));

  return v3;
}

- (id)filteredPaymentSetupProductModel:(id)a3 mobileCarrierRegion:(id)a4 deviceRegion:(id)a5 cardOnFiles:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  int v23;
  void *v24;
  uint64_t v25;
  int v26;
  NSObject *v27;
  char *v28;
  NSObject *v29;
  const char *v30;
  void *v31;
  void *v32;
  char v33;
  char v34;
  BOOL v35;
  char v36;
  char v37;
  int v38;
  NSObject *v39;
  _BOOL4 v40;
  char *v41;
  NSObject *v42;
  const char *v43;
  void *v44;
  void *v45;
  _BOOL4 v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  NSObject *v51;
  NSObject *v52;
  char *v53;
  NSObject *v54;
  const char *v55;
  _BOOL4 v56;
  char *v57;
  void *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t i;
  NSObject *v64;
  char *v65;
  NSObject *v66;
  const char *v67;
  NSObject *v68;
  NSObject *v69;
  NSObject *v70;
  NSObject *v71;
  NSObject *v72;
  const char *v73;
  char *v74;
  char *v75;
  uint64_t v76;
  void *v77;
  void *v79;
  id v80;
  id v81;
  int v82;
  id v83;
  id obj;
  void *v85;
  uint64_t v86;
  void *v87;
  uint64_t v88;
  void *v89;
  char v90;
  void *v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  uint8_t v100[128];
  uint8_t buf[4];
  const char *v102;
  __int16 v103;
  _BOOL4 v104;
  __int16 v105;
  _BOOL4 v106;
  _BYTE v107[128];
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v81 = a4;
  v11 = a5;
  v83 = a6;
  v80 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v10, "targetDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "deviceClass");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v14, OS_LOG_TYPE_DEFAULT, "Filtering products for target device received no deviceClass. Falling back to PKDeviceClass().", buf, 2u);
    }

    PKDeviceClass();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v12, "deviceVersion");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "versionForDeviceClass:", v13);
  v16 = objc_claimAutoreleasedReturnValue();

  v87 = (void *)v16;
  if (!v16)
  {
    PKLogFacilityTypeGetObject(6uLL);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, v17, OS_LOG_TYPE_DEFAULT, "Filtering products for target device received no osVersion. Falling back to PKOSVersion().", buf, 2u);
    }

    PKOSVersion();
    v87 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v79 = v10;
  objc_msgSend(v10, "targetDevice");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "appleAccountInformation");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v82 = objc_msgSend(v19, "isManagedAppleAccount");

  v98 = 0u;
  v99 = 0u;
  v96 = 0u;
  v97 = 0u;
  -[PKPaymentSetupProductModel allSetupProducts](self, "allSetupProducts");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v20 = v83;
  v88 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v96, v107, 16);
  if (v88)
  {
    v86 = *(_QWORD *)v97;
    v89 = v12;
    v85 = v13;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v97 != v86)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * v21);
        v23 = objc_msgSend(v20, "containsObject:", v22);
        objc_msgSend(v22, "configuration");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "type");

        if ((objc_msgSend(v22, "supportsOSVersion:deviceClass:", v87, v13) & 1) != 0)
        {
          if ((objc_msgSend(v22, "meetsAgeRequirements") & 1) != 0)
          {
            v26 = 1;
            goto LABEL_23;
          }
          PKLogFacilityTypeGetObject(6uLL);
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v22, "displayName");
            v28 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v102 = v28;
            v29 = v27;
            v30 = "Product: %@ is not supported due to current user being a child account and the product requiring an age >= 13.";
            goto LABEL_21;
          }
        }
        else
        {
          PKLogFacilityTypeGetObject(6uLL);
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v22, "displayName");
            v28 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v102 = v28;
            v29 = v27;
            v30 = "Product: %@ is not supported due to device OS version";
LABEL_21:
            _os_log_impl(&dword_18FC92000, v29, OS_LOG_TYPE_DEFAULT, v30, buf, 0xCu);

          }
        }

        v26 = 0;
LABEL_23:
        objc_msgSend(v22, "regions");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v31;
        if ((v25 & 0xFFFFFFFFFFFFFFF7) == 3)
        {
          v33 = 1;
        }
        else
        {
          if (v11)
            v34 = objc_msgSend(v31, "containsObject:", v11);
          else
            v34 = 0;
          v35 = v25 == 7 || v25 == 10;
          if (v35 || !v81)
            v36 = 0;
          else
            v36 = objc_msgSend(v32, "containsObject:");
          v33 = v34 | v36;
        }
        v91 = v32;
        if (!v26)
        {
          v38 = 0;
          v90 = 1;
          goto LABEL_51;
        }
        if (objc_msgSend(v32, "count"))
          v37 = v33;
        else
          v37 = 1;
        if ((v37 & 1) != 0)
        {
          v90 = 1;
          v38 = 1;
          goto LABEL_51;
        }
        PKLogFacilityTypeGetObject(6uLL);
        v39 = objc_claimAutoreleasedReturnValue();
        v40 = os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);
        if (v23)
        {
          if (v40)
          {
            objc_msgSend(v22, "displayName");
            v41 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v102 = v41;
            v42 = v39;
            v43 = "Product: %@ is supported due to matching card on file (device/cellular region check)";
LABEL_49:
            _os_log_impl(&dword_18FC92000, v42, OS_LOG_TYPE_DEFAULT, v43, buf, 0xCu);

          }
        }
        else if (v40)
        {
          objc_msgSend(v22, "displayName");
          v41 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v102 = v41;
          v42 = v39;
          v43 = "Product: %@ is not supported in this device region";
          goto LABEL_49;
        }
        v90 = v23 ^ 1;

        v38 = v23;
LABEL_51:
        if (PKPaymentSetupMergeProductsPartnersAPIEnabled())
        {
          objc_msgSend(v22, "configuration");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v44, "type") == 7)
          {
            objc_msgSend(v22, "configuration");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = objc_msgSend(v45, "featureIdentifier") == 2;

          }
          else
          {
            v46 = 0;
          }

          v50 = objc_msgSend(v22, "supportsProvisioningMethodForType:", 0);
          PKLogFacilityTypeGetObject(6uLL);
          v51 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            v102 = "-[PKPaymentSetupProductModel filteredPaymentSetupProductModel:mobileCarrierRegion:deviceRegion:cardOnFiles:]";
            v103 = 1024;
            v104 = v46;
            v105 = 1024;
            v106 = v50;
            _os_log_impl(&dword_18FC92000, v51, OS_LOG_TYPE_DEFAULT, "%s - PKPaymentSetupMergeProductsPartnersAPIEnabled On: supportsFeatureApplication %d, supportsUnknownMethod %d", buf, 0x18u);
          }
        }
        else
        {
          v47 = v11;
          v48 = objc_msgSend(v22, "supportedProvisioningMethods");
          v46 = v48 == 4;
          v49 = objc_msgSend(v22, "supportedProvisioningMethods");
          v50 = v49 == 0;
          PKLogFacilityTypeGetObject(6uLL);
          v51 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            v102 = "-[PKPaymentSetupProductModel filteredPaymentSetupProductModel:mobileCarrierRegion:deviceRegion:cardOnFiles:]";
            v103 = 1024;
            v104 = v48 == 4;
            v105 = 1024;
            v106 = v49 == 0;
            _os_log_impl(&dword_18FC92000, v51, OS_LOG_TYPE_DEFAULT, "%s - PKPaymentSetupMergeProductsPartnersAPIEnabled Off: supportsFeatureApplication %d, supportsUnknownMethod %d", buf, 0x18u);
          }
          v11 = v47;
          v20 = v83;
          v13 = v85;
        }

        if ((v38 & v46) == 1 && objc_msgSend(v22, "preventsFeatureApplication"))
        {
          PKLogFacilityTypeGetObject(6uLL);
          v52 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v22, "displayName");
            v53 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v102 = v53;
            v54 = v52;
            v55 = "Product: %@ feature application prevented";
            goto LABEL_85;
          }
          goto LABEL_86;
        }
        if ((v38 & v50) == 1)
        {
          PKLogFacilityTypeGetObject(6uLL);
          v52 = objc_claimAutoreleasedReturnValue();
          v56 = os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT);
          if (v23)
          {
            if (v56)
            {
              objc_msgSend(v22, "displayName");
              v57 = (char *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v102 = v57;
              _os_log_impl(&dword_18FC92000, v52, OS_LOG_TYPE_DEFAULT, "Product: %@ is supported due to matching card on file (provisioning method check)", buf, 0xCu);

            }
            objc_msgSend(v22, "paymentOptions");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v90 = 0;
LABEL_70:
            v12 = v89;
            if (objc_msgSend(v58, "count"))
            {
              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                v94 = 0u;
                v95 = 0u;
                v92 = 0u;
                v93 = 0u;
                v59 = v58;
                v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v92, v100, 16);
                if (v60)
                {
                  v61 = v60;
                  v62 = *(_QWORD *)v93;
                  while (2)
                  {
                    for (i = 0; i != v61; ++i)
                    {
                      if (*(_QWORD *)v93 != v62)
                        objc_enumerationMutation(v59);
                      if ((objc_msgSend(v89, "supportsCredentialType:", objc_msgSend(*(id *)(*((_QWORD *)&v92 + 1) + 8 * i), "cardType")) & 1) != 0)
                      {

                        v13 = v85;
                        goto LABEL_88;
                      }
                    }
                    v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v92, v100, 16);
                    if (v61)
                      continue;
                    break;
                  }
                }

                v13 = v85;
              }
              PKLogFacilityTypeGetObject(6uLL);
              v64 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v22, "displayName");
                v65 = (char *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v102 = v65;
                v66 = v64;
                v67 = "Product: %@ is not supported on device";
                goto LABEL_97;
              }
            }
            else
            {
LABEL_88:
              if (!v82 || (objc_msgSend(v22, "allowOnManagedAccount") & 1) != 0)
              {
                v68 = v22;
                v69 = v68;
                if ((v90 & 1) != 0)
                {
                  v70 = v68;
LABEL_110:
                  objc_msgSend(v80, "addObject:", v70);
                  goto LABEL_102;
                }
                v70 = -[NSObject copy](v68, "copy");

                if (PKPaymentSetupMergeProductsPartnersAPIEnabled())
                {
                  -[NSObject addProvisioningMethodType:](v70, "addProvisioningMethodType:", 0);
                  PKLogFacilityTypeGetObject(6uLL);
                  v71 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315138;
                    v102 = "-[PKPaymentSetupProductModel filteredPaymentSetupProductModel:mobileCarrierRegion:deviceRegion:cardOnFiles:]";
                    v72 = v71;
                    v73 = "%s - PKPaymentSetupMergeProductsPartnersAPIEnabled On: add PKPaymentSupportedProvisioningMethodUnknown";
                    goto LABEL_106;
                  }
                }
                else
                {
                  -[NSObject setSupportedProvisioningMethods:](v70, "setSupportedProvisioningMethods:", 0);
                  PKLogFacilityTypeGetObject(6uLL);
                  v71 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 136315138;
                    v102 = "-[PKPaymentSetupProductModel filteredPaymentSetupProductModel:mobileCarrierRegion:deviceRegion:cardOnFiles:]";
                    v72 = v71;
                    v73 = "%s - PKPaymentSetupMergeProductsPartnersAPIEnabled Off: add PKPaymentSupportedProvisioningMethodUnknown";
LABEL_106:
                    _os_log_impl(&dword_18FC92000, v72, OS_LOG_TYPE_DEFAULT, v73, buf, 0xCu);
                  }
                }

                if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
                {
                  -[NSObject displayName](v69, "displayName");
                  v75 = (char *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  v102 = v75;
                  _os_log_impl(&dword_18FC92000, v71, OS_LOG_TYPE_DEFAULT, "Product: %@ is supported due to matching card but cannot be manually provisioned", buf, 0xCu);

                  v13 = v85;
                }

                goto LABEL_110;
              }
              PKLogFacilityTypeGetObject(6uLL);
              v64 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v22, "displayName");
                v65 = (char *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v102 = v65;
                v66 = v64;
                v67 = "Product: %@ is not supported on managed account";
LABEL_97:
                _os_log_impl(&dword_18FC92000, v66, OS_LOG_TYPE_DEFAULT, v67, buf, 0xCu);

              }
            }

            goto LABEL_99;
          }
          if (v56)
          {
            objc_msgSend(v22, "displayName");
            v53 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v102 = v53;
            v54 = v52;
            v55 = "Product: %@ is not supported due to lack of card on file and unknown provisioning method";
LABEL_85:
            _os_log_impl(&dword_18FC92000, v54, OS_LOG_TYPE_DEFAULT, v55, buf, 0xCu);

          }
LABEL_86:

          objc_msgSend(v22, "paymentOptions");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_99;
        }
        objc_msgSend(v22, "paymentOptions");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        if (v38)
          goto LABEL_70;
LABEL_99:
        PKLogFacilityTypeGetObject(6uLL);
        v70 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v22, "displayName");
          v74 = (char *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v102 = v74;
          _os_log_impl(&dword_18FC92000, v70, OS_LOG_TYPE_DEFAULT, "Product: %@ is unsupported and will not be shown in the flow picker", buf, 0xCu);

        }
        v12 = v89;
LABEL_102:

        ++v21;
      }
      while (v21 != v88);
      v76 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v96, v107, 16);
      v88 = v76;
    }
    while (v76);
  }

  v77 = (void *)objc_msgSend(v80, "copy");
  return v77;
}

- (id)_paymentSetupProductsWithPartners:(id)a3 products:(id)a4 existingPaymentSetupProducts:(id)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  PKPaymentSetupProductPaymentOption *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  char v62;
  int v63;
  char v64;
  uint64_t v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  PKPaymentSetupProduct *v70;
  PKPaymentSetupProduct *v71;
  NSObject *v72;
  uint64_t v74;
  id v75;
  id obj;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  id v80;
  void *v81;
  id v82;
  uint64_t v83;
  id v84;
  id v85;
  void *v86;
  id v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  id v117;
  id v118;
  id v120;
  unsigned int v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  uint64_t v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  uint64_t v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  uint8_t buf[4];
  void *v200;
  _BYTE v201[128];
  _BYTE v202[128];
  _QWORD v203[2];
  _QWORD v204[2];
  _BYTE v205[128];
  _BYTE v206[128];
  _BYTE v207[128];
  uint64_t v208;

  v208 = *MEMORY[0x1E0C80C00];
  v82 = a3;
  v7 = a4;
  v120 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v105 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v93 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v84 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v195 = 0u;
  v196 = 0u;
  v197 = 0u;
  v198 = 0u;
  obj = v7;
  v117 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v195, v207, 16);
  if (v117)
  {
    v116 = *(_QWORD *)v196;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v196 != v116)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v195 + 1) + 8 * v8);
        objc_msgSend(v9, "PKStringForKey:", CFSTR("identifier"));
        v10 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "PKStringForKey:", CFSTR("type"));
        v11 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "PKStringForKey:", CFSTR("localizedNotificationTitle"));
        v12 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "PKStringForKey:", CFSTR("localizedNotificationMessage"));
        v177 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "PKStringForKey:", CFSTR("discoveryCardIdentifier"));
        v175 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "PKStringForKey:", CFSTR("localizedProductName"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        v129 = v8;
        v127 = (void *)v10;
        v125 = (void *)v11;
        v123 = (void *)v12;
        if (v13)
        {
          v15 = v13;
        }
        else
        {
          objc_msgSend(v9, "PKStringForKey:", CFSTR("localizedDisplayName"));
          v15 = (id)objc_claimAutoreleasedReturnValue();
        }
        v173 = v15;

        objc_msgSend(v9, "PKDictionaryForKey:", CFSTR("readerModeMetadata"));
        v171 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "PKStringForKey:", CFSTR("termsURL"));
        v169 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "PKArrayForKey:", CFSTR("provisioningMethods"));
        v167 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "PKDictionaryForKey:", CFSTR("imageAssets"));
        v165 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "PKDictionaryForKey:", CFSTR("minimumOSVersion"));
        v163 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "PKStringForKey:", CFSTR("region"));
        v161 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "PKDictionaryForKey:", CFSTR("regionData"));
        v159 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "PKStringForKey:", CFSTR("hsa2Requirement"));
        v157 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "PKNumberForKey:", CFSTR("suppressPendingPurchases"));
        v155 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("supportedTransitNetworkIdentifiers"));
        v153 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "PKArrayForKey:", CFSTR("onboardingItems"));
        v151 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "PKURLForKey:", CFSTR("actionBaseURL"));
        v149 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "PKStringForKey:", CFSTR("state"));
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("searchTerms"));
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "PKStringForKey:", CFSTR("featureIdentifier"));
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        v121 = objc_msgSend(v9, "PKBoolForKey:", CFSTR("allowOnManagedAccount"));
        objc_msgSend(v9, "PKNumberForKey:", CFSTR("minimumSupportedAge"));
        v16 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "PKNumberForKey:", CFSTR("maximumSupportedAge"));
        v17 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "PKNumberForKey:", CFSTR("minimumTargetUserSupportedAge"));
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = &unk_1E2C3F850;
        if (v16)
          v20 = (void *)v16;
        else
          v20 = &unk_1E2C3F850;
        v141 = v20;
        v21 = &unk_1E2C3F868;
        if (v17)
          v21 = (void *)v17;
        v139 = v21;
        if (v18)
          v19 = (void *)v18;
        v137 = v19;
        objc_msgSend(v9, "PKArrayForKey:", CFSTR("associatedStoreIdentifiers"));
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "PKStringForKey:", CFSTR("appLaunchURL"));
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "PKStringForKey:", CFSTR("registrationRegionIdentifier"));
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v191 = 0u;
        v192 = 0u;
        v193 = 0u;
        v194 = 0u;
        objc_msgSend(v9, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("requiredFields"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v191, v206, 16);
        if (v24)
        {
          v25 = v24;
          v26 = *(_QWORD *)v192;
          do
          {
            for (i = 0; i != v25; ++i)
            {
              if (*(_QWORD *)v192 != v26)
                objc_enumerationMutation(v23);
              v28 = *(_QWORD *)(*((_QWORD *)&v191 + 1) + 8 * i);
              objc_msgSend(v9, "PKDictionaryForKey:", CFSTR("requiredFieldOptions"));
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "PKDictionaryForKey:", v28);
              v30 = (void *)objc_claimAutoreleasedReturnValue();

              +[PKPaymentSetupField paymentSetupFieldWithIdentifier:configuration:](PKPaymentSetupField, "paymentSetupFieldWithIdentifier:configuration:", v28, v30);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "safelyAddObject:", v31);

            }
            v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v191, v206, 16);
          }
          while (v25);
        }

        objc_msgSend(v9, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("paymentOptions"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v187 = 0u;
        v188 = 0u;
        v189 = 0u;
        v190 = 0u;
        v33 = v32;
        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v187, v205, 16);
        v35 = v33;
        if (v34)
        {
          v36 = v34;
          v37 = *(_QWORD *)v188;
LABEL_25:
          v38 = 0;
          while (1)
          {
            if (*(_QWORD *)v188 != v37)
              objc_enumerationMutation(v33);
            v39 = -[PKPaymentSetupProductPaymentOption initWithPaymentOptionDictionary:]([PKPaymentSetupProductPaymentOption alloc], "initWithPaymentOptionDictionary:", *(_QWORD *)(*((_QWORD *)&v187 + 1) + 8 * v38));
            v40 = -[PKPaymentSetupProductPaymentOption cardType](v39, "cardType");

            if (v40 == 103)
              break;
            if (v36 == ++v38)
            {
              v36 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v187, v205, 16);
              if (v36)
                goto LABEL_25;
              v35 = v33;
              goto LABEL_34;
            }
          }

          if ((objc_msgSend(v22, "pk_containsObjectPassingTest:", &__block_literal_global_891) & 1) != 0)
            goto LABEL_35;
          v203[0] = CFSTR("fieldType");
          PKPaymentSetupFieldTypeToString(4);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v204[0] = v41;
          v203[1] = CFSTR("defaultValue");
          PKLocalizedPaymentString(CFSTR("ADD_PAYMENT_SUICA_PRIVACY_FOOTER_FIELD_TEXT"), 0);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v204[1] = v42;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v204, v203, 2);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          +[PKPaymentSetupField paymentSetupFieldWithIdentifier:configuration:](PKPaymentSetupField, "paymentSetupFieldWithIdentifier:configuration:", CFSTR("suicaPrivacyFooter"), v35);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "safelyAddObject:", v43);

        }
LABEL_34:

LABEL_35:
        if (v127)
        {
          objc_msgSend(v112, "setObject:forKeyedSubscript:", v173, v127);
          objc_msgSend(v91, "setObject:forKeyedSubscript:", v123, v127);
          objc_msgSend(v90, "setObject:forKeyedSubscript:", v177, v127);
          objc_msgSend(v89, "setObject:forKeyedSubscript:", v175, v127);
          objc_msgSend(v92, "setObject:forKeyedSubscript:", v125, v127);
          objc_msgSend(v111, "setObject:forKeyedSubscript:", v171, v127);
          objc_msgSend(v110, "setObject:forKeyedSubscript:", v169, v127);
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v22);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v113, "setObject:forKeyedSubscript:", v44, v127);

          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", v22);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v113, "setObject:forKey:", v45, v127);

          objc_msgSend(v9, "PKArrayForKey:", CFSTR("paymentOptions"));
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          if (v46)
            objc_msgSend(v81, "setObject:forKey:", v46, v127);
          objc_msgSend(v109, "setObject:forKeyedSubscript:", v167, v127);
          objc_msgSend(v108, "setObject:forKeyedSubscript:", v165, v127);
          objc_msgSend(v107, "setObject:forKeyedSubscript:", v163, v127);
          objc_msgSend(v106, "setObject:forKeyedSubscript:", v161, v127);
          objc_msgSend(v105, "setObject:forKeyedSubscript:", v159, v127);
          if (v157)
          {
            objc_msgSend(v104, "setObject:forKeyedSubscript:", v157, v127);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v104, "setObject:forKeyedSubscript:", v47, v127);

          }
          if (v155)
          {
            objc_msgSend(v103, "setObject:forKeyedSubscript:", v155, v127);
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v103, "setObject:forKeyedSubscript:", v48, v127);

          }
          if (v153)
            v49 = v153;
          else
            v49 = (void *)MEMORY[0x1E0C9AA60];
          objc_msgSend(v102, "setObject:forKeyedSubscript:", v49, v127);
          objc_msgSend(v101, "setObject:forKeyedSubscript:", v151, v127);
          objc_msgSend(v100, "setObject:forKeyedSubscript:", v149, v127);
          objc_msgSend(v99, "setObject:forKeyedSubscript:", v147, v127);
          objc_msgSend(v98, "setObject:forKeyedSubscript:", v141, v127);
          objc_msgSend(v97, "setObject:forKeyedSubscript:", v139, v127);
          objc_msgSend(v96, "setObject:forKeyedSubscript:", v137, v127);
          objc_msgSend(v95, "setObject:forKeyedSubscript:", v135, v127);
          objc_msgSend(v94, "setObject:forKeyedSubscript:", v133, v127);
          objc_msgSend(v93, "setObject:forKeyedSubscript:", v131, v127);
          objc_msgSend(v9, "PKDictionaryForKey:", CFSTR("clientInfo"));
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v88, "setObject:forKeyedSubscript:", v50, v127);

          objc_msgSend(v9, "PKStringForKey:", CFSTR("localizedDescription"));
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v87, "setObject:forKeyedSubscript:", v51, v127);

          objc_msgSend(v85, "setObject:forKeyedSubscript:", v145, v127);
          objc_msgSend(v84, "setObject:forKeyedSubscript:", v143, v127);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v121);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v86, "setObject:forKeyedSubscript:", v52, v127);

        }
        v8 = v129 + 1;
      }
      while ((id)(v129 + 1) != v117);
      v117 = (id)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v195, v207, 16);
    }
    while (v117);
  }

  if (os_variant_has_internal_ui())
  {
    PKGetPaymentSetupProductState();
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v178 = PKPaymentSetupProductStateFromString(v53);

  }
  else
  {
    v178 = 0;
  }
  v118 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v183 = 0u;
  v184 = 0u;
  v185 = 0u;
  v186 = 0u;
  v75 = v82;
  v78 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v183, v202, 16);
  if (v78)
  {
    v77 = *(_QWORD *)v184;
    do
    {
      v54 = 0;
      do
      {
        if (*(_QWORD *)v184 != v77)
          objc_enumerationMutation(v75);
        v79 = v54;
        v122 = *(void **)(*((_QWORD *)&v183 + 1) + 8 * v54);
        objc_msgSend(v122, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("productIdentifiers"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v179 = 0u;
        v180 = 0u;
        v181 = 0u;
        v182 = 0u;
        v80 = v55;
        v114 = objc_msgSend(v55, "countByEnumeratingWithState:objects:count:", &v179, v201, 16);
        if (v114)
        {
          v83 = *(_QWORD *)v180;
          do
          {
            v56 = 0;
            do
            {
              if (*(_QWORD *)v180 != v83)
                objc_enumerationMutation(v80);
              v57 = *(void **)(*((_QWORD *)&v179 + 1) + 8 * v56);
              objc_msgSend(v112, "objectForKey:", v57);
              v176 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v87, "objectForKey:", v57);
              v174 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v111, "objectForKey:", v57);
              v172 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v110, "objectForKey:", v57);
              v170 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v81, "objectForKey:", v57);
              v168 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v109, "objectForKey:", v57);
              v166 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v113, "objectForKey:", v57);
              v164 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v108, "objectForKey:", v57);
              v162 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v107, "objectForKey:", v57);
              v160 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v106, "objectForKey:", v57);
              v158 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v105, "objectForKey:", v57);
              v156 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v104, "PKStringForKey:", v57);
              v154 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v103, "PKNumberForKey:", v57);
              v152 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v102, "PKArrayForKey:", v57);
              v150 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v101, "objectForKey:", v57);
              v148 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v100, "objectForKey:", v57);
              v146 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v99, "objectForKey:", v57);
              v144 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v98, "objectForKey:", v57);
              v142 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v97, "objectForKey:", v57);
              v140 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v96, "objectForKey:", v57);
              v138 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v95, "objectForKey:", v57);
              v136 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v94, "objectForKey:", v57);
              v134 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v93, "objectForKey:", v57);
              v132 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v92, "objectForKey:", v57);
              v130 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v91, "objectForKey:", v57);
              v128 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v90, "objectForKey:", v57);
              v126 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v89, "objectForKey:", v57);
              v124 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v88, "objectForKey:", v57);
              v58 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v85, "objectForKey:", v57);
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v84, "objectForKey:", v57);
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v86, "objectForKeyedSubscript:", v57);
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              v62 = objc_msgSend(v61, "BOOLValue");

              v115 = v56;
              if (os_variant_has_internal_ui())
              {
                v63 = PKForceLargeAmountOfProducts();
                v64 = v63;
                if (v63)
                  v65 = 50;
                else
                  v65 = 1;
              }
              else
              {
                v64 = 0;
                v65 = 1;
              }
              do
              {
                if ((v64 & 1) != 0)
                {
                  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
                  v66 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v66, "UUIDString");
                  v67 = (id)objc_claimAutoreleasedReturnValue();

                }
                else
                {
                  v67 = v57;
                }
                objc_msgSend(v120, "objectForKey:", v67);
                v68 = (void *)objc_claimAutoreleasedReturnValue();
                v69 = v68;
                if (v68)
                  v70 = v68;
                else
                  v70 = objc_alloc_init(PKPaymentSetupProduct);
                v71 = v70;

                LOBYTE(v74) = v62;
                -[PKPaymentSetupProductModel _updatePaymentSetupProduct:displayName:localizedDescription:partnerDictionary:productIdentifier:paymentOptions:termsURL:provisioningMethods:readerModeMetadata:requiredFields:imageAssets:minimumOSVersion:region:regionData:hsa2Requirement:suppressPendingPurchases:supportedTransitNetworkIdentifiers:onboardingItems:actionBaseURL:productState:minimumProductAge:maximumProductAge:minimumTargetUserSupportedAge:associatedStoreIdentifiers:appLaunchURL:regionIdentifier:type:localizedNotificationTitle:localizedNotificationMessage:discoveryCardIdentifier:clientInfo:searchTerms:featureIdentifier:allowOnManagedAccount:](self, "_updatePaymentSetupProduct:displayName:localizedDescription:partnerDictionary:productIdentifier:paymentOptions:termsURL:provisioningMethods:readerModeMetadata:requiredFields:imageAssets:minimumOSVersion:region:regionData:hsa2Requirement:suppressPendingPurchases:supportedTransitNetworkIdentifiers:onboardingItems:actionBaseURL:productState:minimumProductAge:maximumProductAge:minimumTargetUserSupportedAge:associatedStoreIdentifiers:appLaunchURL:regionIdentifier:type:localizedNotificationTitle:localizedNotificationMessage:discoveryCardIdentifier:clientInfo:searchTerms:featureIdentifier:allowOnManagedAccount:", v71, v176, v174, v122, v67, v168, v170, v166, v172, v164, v162, v160,
                  v158,
                  v156,
                  v154,
                  v152,
                  v150,
                  v148,
                  v146,
                  v144,
                  v142,
                  v140,
                  v138,
                  v136,
                  v134,
                  v132,
                  v130,
                  v128,
                  v126,
                  v124,
                  v58,
                  v59,
                  v60,
                  v74);
                if (v178)
                {
                  PKLogFacilityTypeGetObject(6uLL);
                  v72 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 138412290;
                    v200 = v57;
                    _os_log_impl(&dword_18FC92000, v72, OS_LOG_TYPE_DEFAULT, "WARNING: Using debug product state to override server state for: %@", buf, 0xCu);
                  }

                  -[PKPaymentSetupProduct _updateDebugConfigurationForState:](v71, "_updateDebugConfigurationForState:", v178);
                }
                if (v71)
                {
                  -[PKPaymentSetupProduct setIsServerDriven:](v71, "setIsServerDriven:", 1);
                  objc_msgSend(v118, "addObject:", v71);
                }

                --v65;
              }
              while (v65);

              v56 = v115 + 1;
            }
            while (v115 + 1 != v114);
            v114 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v179, v201, 16);
          }
          while (v114);
        }

        v54 = v79 + 1;
      }
      while (v79 + 1 != v78);
      v78 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v183, v202, 16);
    }
    while (v78);
  }

  return v118;
}

uint64_t __102__PKPaymentSetupProductModel__paymentSetupProductsWithPartners_products_existingPaymentSetupProducts___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isFieldTypeFooter");
}

- (void)_updatePaymentSetupProduct:(id)a3 displayName:(id)a4 localizedDescription:(id)a5 partnerDictionary:(id)a6 productIdentifier:(id)a7 paymentOptions:(id)a8 termsURL:(id)a9 provisioningMethods:(id)a10 readerModeMetadata:(id)a11 requiredFields:(id)a12 imageAssets:(id)a13 minimumOSVersion:(id)a14 region:(id)a15 regionData:(id)a16 hsa2Requirement:(id)a17 suppressPendingPurchases:(id)a18 supportedTransitNetworkIdentifiers:(id)a19 onboardingItems:(id)a20 actionBaseURL:(id)a21 productState:(id)a22 minimumProductAge:(id)a23 maximumProductAge:(id)a24 minimumTargetUserSupportedAge:(id)a25 associatedStoreIdentifiers:(id)a26 appLaunchURL:(id)a27 regionIdentifier:(id)a28 type:(id)a29 localizedNotificationTitle:(id)a30 localizedNotificationMessage:(id)a31 discoveryCardIdentifier:(id)a32 clientInfo:(id)a33 searchTerms:(id)a34 featureIdentifier:(id)a35 allowOnManagedAccount:(BOOL)a36
{
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  id v57;
  void *v58;
  id v59;
  id v60;
  id v61;
  void *v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;

  v80 = a3;
  v41 = a4;
  v42 = a5;
  v43 = a6;
  v44 = a7;
  v45 = a8;
  v60 = a9;
  v57 = a10;
  v59 = a11;
  v79 = a12;
  v78 = a13;
  v77 = a14;
  v76 = a15;
  v75 = a16;
  v74 = a17;
  v73 = a18;
  v72 = a19;
  v71 = a20;
  v70 = a21;
  v69 = a22;
  v68 = a23;
  v67 = a24;
  v66 = a25;
  v65 = a26;
  v64 = a27;
  v63 = a28;
  v46 = a29;
  v61 = a30;
  v47 = a31;
  v48 = a32;
  v49 = a33;
  v56 = a34;
  v55 = a35;
  v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", v43);
  v58 = v43;
  objc_msgSend(v43, "PKStringForKey:", CFSTR("localizedDisplayName"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v51, "length"))
    objc_msgSend(v50, "setObject:forKey:", v51, CFSTR("partnerLocalizedDisplayName"));
  v62 = v46;
  if (objc_msgSend(v41, "length"))
    objc_msgSend(v50, "setObject:forKey:", v41, CFSTR("localizedProductName"));
  v52 = v59;
  if (objc_msgSend(v42, "length"))
    objc_msgSend(v50, "setObject:forKey:", v42, CFSTR("localizedDescription"));
  if (objc_msgSend(v62, "length"))
    objc_msgSend(v50, "setObject:forKey:", v62, CFSTR("type"));
  if (objc_msgSend(v61, "length"))
    objc_msgSend(v50, "setObject:forKey:", v61, CFSTR("localizedNotificationTitle"));
  if (objc_msgSend(v47, "length"))
    objc_msgSend(v50, "setObject:forKey:", v47, CFSTR("localizedNotificationMessage"));
  if (objc_msgSend(v48, "length"))
    objc_msgSend(v50, "setObject:forKey:", v48, CFSTR("discoveryCardIdentifier"));
  if (objc_msgSend(v44, "length", v47))
    objc_msgSend(v50, "setObject:forKey:", v44, CFSTR("productIdentifier"));
  if (objc_msgSend(v60, "length"))
    objc_msgSend(v50, "setObject:forKey:", v60, CFSTR("termsURL"));
  if (objc_msgSend(v45, "count"))
    objc_msgSend(v50, "setObject:forKey:", v45, CFSTR("paymentOptions"));
  if (objc_msgSend(v57, "count"))
    objc_msgSend(v50, "setObject:forKey:", v57, CFSTR("provisioningMethods"));
  if (v59)
    objc_msgSend(v50, "setObject:forKey:", v59, CFSTR("readerModeMetadata"));
  if (objc_msgSend(v79, "count"))
  {
    objc_msgSend(v50, "removeObjectForKey:", CFSTR("requiredFields"));
    objc_msgSend(v50, "removeObjectForKey:", CFSTR("requiredFieldOptions"));
  }
  if (objc_msgSend(v78, "count"))
    objc_msgSend(v50, "setObject:forKey:", v78, CFSTR("imageAssets"));
  if (objc_msgSend(v77, "count"))
    objc_msgSend(v50, "setObject:forKey:", v77, CFSTR("minimumOSVersion"));
  if (objc_msgSend(v76, "length"))
    objc_msgSend(v50, "setObject:forKey:", v76, CFSTR("region"));
  if (objc_msgSend(v75, "count"))
    objc_msgSend(v50, "setObject:forKey:", v75, CFSTR("regionData"));
  if (v74)
    objc_msgSend(v50, "setObject:forKey:", v74, CFSTR("hsa2Requirement"));
  if (v73)
    objc_msgSend(v50, "setObject:forKey:", v73, CFSTR("suppressPendingPurchases"));
  if (objc_msgSend(v72, "count"))
    objc_msgSend(v50, "setObject:forKey:", v72, CFSTR("supportedTransitNetworkIdentifiers"));
  if (v71)
    objc_msgSend(v50, "setObject:forKey:", v71, CFSTR("onboardingItems"));
  if (v70)
    objc_msgSend(v50, "setObject:forKey:", v70, CFSTR("actionBaseURL"));
  if (v69)
    objc_msgSend(v50, "setObject:forKey:", v69, CFSTR("state"));
  if (v68)
    objc_msgSend(v50, "setObject:forKey:", v68, CFSTR("minimumSupportedAge"));
  if (v67)
    objc_msgSend(v50, "setObject:forKey:", v67, CFSTR("maximumSupportedAge"));
  if (v66)
    objc_msgSend(v50, "setObject:forKey:", v66, CFSTR("minimumTargetUserSupportedAge"));
  if (objc_msgSend(v65, "count"))
    objc_msgSend(v50, "setObject:forKey:", v65, CFSTR("associatedStoreIdentifiers"));
  if (v64)
    objc_msgSend(v50, "setObject:forKey:", v64, CFSTR("appLaunchURL"));
  if (objc_msgSend(v63, "length"))
    objc_msgSend(v50, "setObject:forKey:", v63, CFSTR("registrationRegionIdentifier"));
  if (v49)
    objc_msgSend(v50, "setObject:forKey:", v49, CFSTR("clientInfo"));
  if (v56)
    objc_msgSend(v50, "setObject:forKey:", v56, CFSTR("searchTerms"));
  if (v55)
    objc_msgSend(v50, "setObject:forKey:", v55, CFSTR("featureIdentifier"));
  if (a36)
    objc_msgSend(v50, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("allowOnManagedAccount"));
  objc_msgSend(v80, "updateWithProductDictionary:", v50);
  if (objc_msgSend(v79, "count"))
  {
    v53 = (void *)objc_msgSend(v79, "copy");
    objc_msgSend(v80, "setRequiredFields:", v53);

    v52 = v59;
  }

}

- (id)_paymentSetupProductsWithProducts:(id)a3 existingPaymentSetupProducts:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  PKPaymentSetupProductPaymentOption *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  char v54;
  uint64_t v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  PKPaymentSetupProduct *v60;
  PKPaymentSetupProduct *v61;
  NSObject *v62;
  id obj;
  uint64_t v65;
  void *v66;
  PKPaymentSetupProductModel *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  id v71;
  id v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  uint64_t v100;
  void *v101;
  id v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  uint8_t buf[4];
  void *v120;
  _QWORD v121[2];
  _QWORD v122[2];
  _BYTE v123[128];
  _BYTE v124[128];
  _BYTE v125[128];
  _BYTE v126[128];
  uint64_t v127;

  v127 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (os_variant_has_internal_ui())
  {
    PKGetPaymentSetupProductState();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = PKPaymentSetupProductStateFromString(v8);

  }
  else
  {
    v100 = 0;
  }
  v72 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v115 = 0u;
  v116 = 0u;
  v117 = 0u;
  v118 = 0u;
  obj = v6;
  v68 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v126, 16);
  if (v68)
  {
    v65 = *(_QWORD *)v116;
    v66 = v7;
    v67 = self;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v116 != v65)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v115 + 1) + 8 * v9);
        objc_msgSend(v10, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("partners"));
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "PKStringForKey:", CFSTR("identifier"));
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "PKStringForKey:", CFSTR("type"));
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "PKStringForKey:", CFSTR("localizedNotificationTitle"));
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "PKStringForKey:", CFSTR("localizedNotificationMessage"));
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "PKStringForKey:", CFSTR("discoveryCardIdentifier"));
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "PKStringForKey:", CFSTR("localizedProductName"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        v70 = v9;
        if (v11)
        {
          v13 = v11;
        }
        else
        {
          objc_msgSend(v10, "PKStringForKey:", CFSTR("localizedDisplayName"));
          v13 = (id)objc_claimAutoreleasedReturnValue();
        }
        v99 = v13;

        objc_msgSend(v10, "PKDictionaryForKey:", CFSTR("readerModeMetadata"));
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "PKStringForKey:", CFSTR("termsURL"));
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "PKArrayForKey:", CFSTR("provisioningMethodDetailsList"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "PKDictionaryForKey:", CFSTR("imageAssets"));
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "PKDictionaryForKey:", CFSTR("minimumOSVersion"));
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "PKStringForKey:", CFSTR("region"));
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "PKDictionaryForKey:", CFSTR("regionData"));
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "PKStringForKey:", CFSTR("hsa2Requirement"));
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "PKNumberForKey:", CFSTR("suppressPendingPurchases"));
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("supportedTransitNetworkIdentifiers"));
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "PKArrayForKey:", CFSTR("onboardingItems"));
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "PKURLForKey:", CFSTR("actionBaseURL"));
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "PKStringForKey:", CFSTR("state"));
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("searchTerms"));
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "PKStringForKey:", CFSTR("featureIdentifier"));
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "PKArrayForKey:", CFSTR("paymentOptions"));
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "PKStringForKey:", CFSTR("localizedDescription"));
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "PKDictionaryForKey:", CFSTR("clientInfo"));
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "PKNumberForKey:", CFSTR("minimumSupportedAge"));
        v15 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "PKNumberForKey:", CFSTR("maximumSupportedAge"));
        v16 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "PKNumberForKey:", CFSTR("minimumTargetUserSupportedAge"));
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = &unk_1E2C3F850;
        if (v15)
          v19 = (void *)v15;
        else
          v19 = &unk_1E2C3F850;
        v20 = &unk_1E2C3F868;
        if (v16)
          v20 = (void *)v16;
        v75 = v20;
        v76 = v19;
        if (v17)
          v18 = (void *)v17;
        v74 = v18;
        objc_msgSend(v10, "PKArrayForKey:", CFSTR("associatedStoreIdentifiers"));
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v111 = 0u;
        v112 = 0u;
        v113 = 0u;
        v114 = 0u;
        v102 = v14;
        v21 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v111, v125, 16);
        if (v21)
        {
          v22 = v21;
          v23 = 0;
          v24 = *(_QWORD *)v112;
          do
          {
            for (i = 0; i != v22; ++i)
            {
              if (*(_QWORD *)v112 != v24)
                objc_enumerationMutation(v102);
              v26 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * i);
              objc_msgSend(v26, "PKStringForKey:", CFSTR("provisioningMethodType"));
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v27, "isEqualToString:", CFSTR("inApp"))
                || objc_msgSend(v27, "isEqualToString:", CFSTR("cameraCapture")))
              {
                objc_msgSend(v26, "PKStringForKey:", CFSTR("appLaunchURLScheme"));
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v26, "PKStringForKey:", CFSTR("appLaunchURLPath"));
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                +[PKPaymentSetupProduct _inAppProvisioningURLWthScheme:path:](PKPaymentSetupProduct, "_inAppProvisioningURLWthScheme:path:", v28, v29);
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "absoluteString");
                v31 = objc_claimAutoreleasedReturnValue();

                v23 = (void *)v31;
              }

            }
            v22 = objc_msgSend(v102, "countByEnumeratingWithState:objects:count:", &v111, v125, 16);
          }
          while (v22);
        }
        else
        {
          v23 = 0;
        }

        objc_msgSend(v10, "PKStringForKey:", CFSTR("registrationRegionIdentifier"));
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v107 = 0u;
        v108 = 0u;
        v109 = 0u;
        v110 = 0u;
        objc_msgSend(v10, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("requiredFields"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v107, v124, 16);
        if (v34)
        {
          v35 = v34;
          v36 = *(_QWORD *)v108;
          do
          {
            for (j = 0; j != v35; ++j)
            {
              if (*(_QWORD *)v108 != v36)
                objc_enumerationMutation(v33);
              v38 = *(_QWORD *)(*((_QWORD *)&v107 + 1) + 8 * j);
              objc_msgSend(v10, "PKDictionaryForKey:", CFSTR("requiredFieldOptions"));
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v39, "PKDictionaryForKey:", v38);
              v40 = (void *)objc_claimAutoreleasedReturnValue();

              +[PKPaymentSetupField paymentSetupFieldWithIdentifier:configuration:](PKPaymentSetupField, "paymentSetupFieldWithIdentifier:configuration:", v38, v40);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "safelyAddObject:", v41);

            }
            v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v107, v124, 16);
          }
          while (v35);
        }

        objc_msgSend(v10, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("paymentOptions"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v103 = 0u;
        v104 = 0u;
        v105 = 0u;
        v106 = 0u;
        v43 = v42;
        v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v103, v123, 16);
        v71 = v43;
        v7 = v66;
        if (!v44)
        {
LABEL_49:

          goto LABEL_50;
        }
        v45 = v44;
        v46 = *(_QWORD *)v104;
LABEL_40:
        v47 = 0;
        while (1)
        {
          if (*(_QWORD *)v104 != v46)
            objc_enumerationMutation(v71);
          v48 = -[PKPaymentSetupProductPaymentOption initWithPaymentOptionDictionary:]([PKPaymentSetupProductPaymentOption alloc], "initWithPaymentOptionDictionary:", *(_QWORD *)(*((_QWORD *)&v103 + 1) + 8 * v47));
          v49 = -[PKPaymentSetupProductPaymentOption cardType](v48, "cardType");

          if (v49 == 103)
            break;
          if (v45 == ++v47)
          {
            v45 = objc_msgSend(v71, "countByEnumeratingWithState:objects:count:", &v103, v123, 16);
            if (!v45)
            {
              v43 = v71;
              goto LABEL_49;
            }
            goto LABEL_40;
          }
        }

        if ((objc_msgSend(v32, "pk_containsObjectPassingTest:", &__block_literal_global_897) & 1) == 0)
        {
          v121[0] = CFSTR("fieldType");
          PKPaymentSetupFieldTypeToString(4);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v122[0] = v50;
          v121[1] = CFSTR("defaultValue");
          PKLocalizedPaymentString(CFSTR("ADD_PAYMENT_SUICA_PRIVACY_FOOTER_FIELD_TEXT"), 0);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v122[1] = v51;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v122, v121, 2);
          v43 = (id)objc_claimAutoreleasedReturnValue();

          +[PKPaymentSetupField paymentSetupFieldWithIdentifier:configuration:](PKPaymentSetupField, "paymentSetupFieldWithIdentifier:configuration:", CFSTR("suicaPrivacyFooter"), v43);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "safelyAddObject:", v52);

          goto LABEL_49;
        }
LABEL_50:
        if (os_variant_has_internal_ui())
        {
          v53 = PKForceLargeAmountOfProducts();
          v54 = v53;
          if (v53)
            v55 = 50;
          else
            v55 = 1;
        }
        else
        {
          v54 = 0;
          v55 = 1;
        }
        do
        {
          if (v101)
          {
            if ((v54 & 1) != 0)
              goto LABEL_57;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), v99, v23);
            v101 = (void *)objc_claimAutoreleasedReturnValue();
            if ((v54 & 1) != 0)
            {
LABEL_57:
              objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
              v56 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v56, "UUIDString");
              v57 = (id)objc_claimAutoreleasedReturnValue();

              goto LABEL_60;
            }
          }
          v57 = v101;
LABEL_60:
          objc_msgSend(v66, "objectForKey:", v57);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = v58;
          if (v58)
            v60 = v58;
          else
            v60 = objc_alloc_init(PKPaymentSetupProduct);
          v61 = v60;

          -[PKPaymentSetupProductModel _updatePaymentSetupProduct:displayName:localizedDescription:partnerArray:productIdentifier:paymentOptions:termsURL:provisioningMethodDetailsList:readerModeMetadata:requiredFields:imageAssets:minimumOSVersion:region:regionData:hsa2Requirement:suppressPendingPurchases:supportedTransitNetworkIdentifiers:onboardingItems:actionBaseURL:productState:minimumProductAge:maximumProductAge:minimumTargetUserSupportedAge:associatedStoreIdentifiers:appLaunchURL:regionIdentifier:type:localizedNotificationTitle:localizedNotificationMessage:discoveryCardIdentifier:clientInfo:searchTerms:featureIdentifier:](v67, "_updatePaymentSetupProduct:displayName:localizedDescription:partnerArray:productIdentifier:paymentOptions:termsURL:provisioningMethodDetailsList:readerModeMetadata:requiredFields:imageAssets:minimumOSVersion:region:regionData:hsa2Requirement:suppressPendingPurchases:supportedTransitNetworkIdentifiers:onboardingItems:actionBaseURL:productState:minimumProductAge:maximumProductAge:minimumTargetUserSupportedAge:associatedStoreIdentifiers:appLaunchURL:regionIdentifier:type:localizedNotificationTitle:localizedNotificationMessage:discoveryCardIdentifier:clientInfo:searchTerms:featureIdentifier:", v61, v99, v78, v98, v57, v79, v92, v102, v93, v32, v91, v90,
            v89,
            v88,
            v87,
            v86,
            v85,
            v84,
            v83,
            v82,
            v76,
            v75,
            v74,
            v73,
            v23,
            v69,
            v97,
            v96,
            v95,
            v94,
            v77,
            v81,
            v80);
          if (v100)
          {
            PKLogFacilityTypeGetObject(6uLL);
            v62 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v120 = v101;
              _os_log_impl(&dword_18FC92000, v62, OS_LOG_TYPE_DEFAULT, "WARNING: Using debug product state to override server state for: %@", buf, 0xCu);
            }

            -[PKPaymentSetupProduct _updateDebugConfigurationForState:](v61, "_updateDebugConfigurationForState:", v100);
          }
          if (v61)
          {
            -[PKPaymentSetupProduct setIsServerDriven:](v61, "setIsServerDriven:", 1);
            objc_msgSend(v72, "addObject:", v61);
          }

          --v55;
        }
        while (v55);

        v9 = v70 + 1;
      }
      while (v70 + 1 != v68);
      v68 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v115, v126, 16);
    }
    while (v68);
  }

  return v72;
}

uint64_t __93__PKPaymentSetupProductModel__paymentSetupProductsWithProducts_existingPaymentSetupProducts___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isFieldTypeFooter");
}

- (void)_updatePaymentSetupProduct:(id)a3 displayName:(id)a4 localizedDescription:(id)a5 partnerArray:(id)a6 productIdentifier:(id)a7 paymentOptions:(id)a8 termsURL:(id)a9 provisioningMethodDetailsList:(id)a10 readerModeMetadata:(id)a11 requiredFields:(id)a12 imageAssets:(id)a13 minimumOSVersion:(id)a14 region:(id)a15 regionData:(id)a16 hsa2Requirement:(id)a17 suppressPendingPurchases:(id)a18 supportedTransitNetworkIdentifiers:(id)a19 onboardingItems:(id)a20 actionBaseURL:(id)a21 productState:(id)a22 minimumProductAge:(id)a23 maximumProductAge:(id)a24 minimumTargetUserSupportedAge:(id)a25 associatedStoreIdentifiers:(id)a26 appLaunchURL:(id)a27 regionIdentifier:(id)a28 type:(id)a29 localizedNotificationTitle:(id)a30 localizedNotificationMessage:(id)a31 discoveryCardIdentifier:(id)a32 clientInfo:(id)a33 searchTerms:(id)a34 featureIdentifier:(id)a35
{
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t i;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  id v79;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  id v90;
  void *v91;
  void *v92;
  void *v93;
  id v94;
  id v95;
  id obj;
  id v97;
  void *v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  _BYTE v103[128];
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  v97 = a3;
  v71 = a4;
  v70 = a5;
  v40 = a6;
  v69 = a7;
  v95 = a8;
  v94 = a9;
  v41 = a10;
  v68 = a11;
  v42 = a12;
  v43 = a13;
  v67 = a14;
  v44 = a15;
  v45 = a16;
  v90 = a17;
  v89 = a18;
  v88 = a19;
  v87 = a20;
  v86 = a21;
  v85 = a22;
  v84 = a23;
  v83 = a24;
  v82 = a25;
  v81 = a26;
  v80 = a27;
  v79 = a28;
  v78 = a29;
  v77 = a30;
  v76 = a31;
  v75 = a32;
  v74 = a33;
  v73 = a34;
  v72 = a35;
  v46 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (objc_msgSend(v40, "count"))
    objc_msgSend(v46, "setObject:forKey:", v40, CFSTR("partners"));
  v92 = v44;
  v93 = v43;
  v98 = v42;
  v47 = v71;
  if (objc_msgSend(v71, "length"))
    objc_msgSend(v46, "setObject:forKey:", v71, CFSTR("localizedProductName"));
  v48 = v70;
  v50 = v68;
  v49 = v69;
  if (objc_msgSend(v70, "length"))
    objc_msgSend(v46, "setObject:forKey:", v70, CFSTR("localizedDescription"));
  if (objc_msgSend(v78, "length"))
    objc_msgSend(v46, "setObject:forKey:", v78, CFSTR("type"));
  if (objc_msgSend(v77, "length"))
    objc_msgSend(v46, "setObject:forKey:", v77, CFSTR("localizedNotificationTitle"));
  if (objc_msgSend(v76, "length"))
    objc_msgSend(v46, "setObject:forKey:", v76, CFSTR("localizedNotificationMessage"));
  if (objc_msgSend(v75, "length"))
    objc_msgSend(v46, "setObject:forKey:", v75, CFSTR("discoveryCardIdentifier"));
  if (objc_msgSend(v69, "length"))
    objc_msgSend(v46, "setObject:forKey:", v69, CFSTR("productIdentifier"));
  if (objc_msgSend(v94, "length"))
    objc_msgSend(v46, "setObject:forKey:", v94, CFSTR("termsURL"));
  if (objc_msgSend(v95, "count"))
    objc_msgSend(v46, "setObject:forKey:", v95, CFSTR("paymentOptions"));
  if (objc_msgSend(v41, "count"))
    objc_msgSend(v46, "setObject:forKey:", v41, CFSTR("provisioningMethodDetailsList"));
  if (v68)
    objc_msgSend(v46, "setObject:forKey:", v68, CFSTR("readerModeMetadata"));
  if (objc_msgSend(v42, "count"))
  {
    objc_msgSend(v46, "removeObjectForKey:", CFSTR("requiredFields"));
    objc_msgSend(v46, "removeObjectForKey:", CFSTR("requiredFieldOptions"));
  }
  if (objc_msgSend(v93, "count"))
    objc_msgSend(v46, "setObject:forKey:", v93, CFSTR("imageAssets"));
  v91 = v45;
  v51 = v67;
  if (objc_msgSend(v67, "count"))
    objc_msgSend(v46, "setObject:forKey:", v67, CFSTR("minimumOSVersion"));
  if (objc_msgSend(v92, "length"))
    objc_msgSend(v46, "setObject:forKey:", v92, CFSTR("region"));
  if (objc_msgSend(v45, "count"))
    objc_msgSend(v46, "setObject:forKey:", v45, CFSTR("regionData"));
  if (v90)
    objc_msgSend(v46, "setObject:forKey:", v90, CFSTR("hsa2Requirement"));
  if (v89)
    objc_msgSend(v46, "setObject:forKey:", v89, CFSTR("suppressPendingPurchases"));
  if (objc_msgSend(v88, "count"))
    objc_msgSend(v46, "setObject:forKey:", v88, CFSTR("supportedTransitNetworkIdentifiers"));
  if (v87)
    objc_msgSend(v46, "setObject:forKey:", v87, CFSTR("onboardingItems"));
  if (v86)
    objc_msgSend(v46, "setObject:forKey:", v86, CFSTR("actionBaseURL"));
  if (v85)
    objc_msgSend(v46, "setObject:forKey:", v85, CFSTR("state"));
  if (v84)
    objc_msgSend(v46, "setObject:forKey:", v84, CFSTR("minimumSupportedAge"));
  if (v83)
    objc_msgSend(v46, "setObject:forKey:", v83, CFSTR("maximumSupportedAge"));
  if (v82)
    objc_msgSend(v46, "setObject:forKey:", v82, CFSTR("minimumTargetUserSupportedAge"));
  if (objc_msgSend(v81, "count"))
    objc_msgSend(v46, "setObject:forKey:", v81, CFSTR("associatedStoreIdentifiers"));
  if (v80)
    objc_msgSend(v46, "setObject:forKey:", v80, CFSTR("appLaunchURL"));
  if (objc_msgSend(v79, "length"))
    objc_msgSend(v46, "setObject:forKey:", v79, CFSTR("registrationRegionIdentifier"));
  if (v74)
    objc_msgSend(v46, "setObject:forKey:", v74, CFSTR("clientInfo"));
  if (v73)
    objc_msgSend(v46, "setObject:forKey:", v73, CFSTR("searchTerms"));
  if (v72)
    objc_msgSend(v46, "setObject:forKey:", v72, CFSTR("featureIdentifier"));
  if (objc_msgSend(v40, "count"))
  {
    v65 = v41;
    v66 = v40;
    v101 = 0u;
    v102 = 0u;
    v99 = 0u;
    v100 = 0u;
    obj = v40;
    v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v103, 16);
    if (v52)
    {
      v53 = v52;
      v54 = *(_QWORD *)v100;
      do
      {
        for (i = 0; i != v53; ++i)
        {
          if (*(_QWORD *)v100 != v54)
            objc_enumerationMutation(obj);
          v56 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * i);
          objc_msgSend(v56, "PKStringForKey:", CFSTR("localizedDisplayName"), v65, v66);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v57, "length"))
            objc_msgSend(v46, "setObject:forKey:", v57, CFSTR("partnerLocalizedDisplayName"));
          objc_msgSend(v56, "PKStringForKey:", CFSTR("identifier"));
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v58, "length"))
            objc_msgSend(v46, "setObject:forKey:", v58, CFSTR("identifier"));
          if (objc_msgSend(v98, "count"))
          {
            v59 = (void *)objc_msgSend(v98, "copy");
            objc_msgSend(v97, "setRequiredFields:", v59);

          }
          v60 = (void *)objc_msgSend(v46, "copy");
          objc_msgSend(v97, "updateWithProductDictionary:", v60);

        }
        v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v99, v103, 16);
      }
      while (v53);
    }

    v61 = v97;
    v48 = v70;
    v47 = v71;
    v41 = v65;
    v40 = v66;
    v50 = v68;
    v49 = v69;
    v62 = v94;
    v51 = v67;
  }
  else
  {
    v61 = v97;
    if (objc_msgSend(v98, "count"))
    {
      v63 = (void *)objc_msgSend(v98, "copy");
      objc_msgSend(v97, "setRequiredFields:", v63);

    }
    v64 = (void *)objc_msgSend(v46, "copy");
    objc_msgSend(v97, "updateWithProductDictionary:", v64);

    v62 = v94;
  }

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary description](self->_paymentSetupProducts, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("products: '%@'; "), v4);

  -[NSMutableArray description](self->_allSections, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("sections: '%@'; "), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v6 = (void *)objc_msgSend(v3, "copy");

  return v6;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (NSString)localizedSubtitle
{
  return self->_localizedSubtitle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedSubtitle, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
  objc_storeStrong((id *)&self->_allSections, 0);
  objc_storeStrong((id *)&self->_paymentSetupProducts, 0);
}

@end
