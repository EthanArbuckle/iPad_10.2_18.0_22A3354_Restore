@implementation PKTransitCommutePlanPackage

- (NSArray)transitCommutePlans
{
  return self->_transitCommutePlans;
}

- (unint64_t)transitCommutePlanType
{
  return self->_transitCommutePlanType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commutePlanLookupDictionary, 0);
  objc_storeStrong((id *)&self->_transitCommutePlans, 0);
}

- (PKTransitCommutePlanPackage)initWithDictionary:(id)a3 backFieldBuckets:(id)a4 bundle:(id)a5 privateBundle:(id)a6 passType:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  PKTransitCommutePlanPackage *v16;
  id v17;
  void *v18;
  NSMutableDictionary *v19;
  NSMutableDictionary *commutePlanLookupDictionary;
  PKTransitCommutePlanPackage *v21;
  PKTransitCommutePlan *v22;
  id v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v37;
  id v38;
  id v39;
  void *v40;
  id obj;
  void *v42;
  id *p_isa;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[4];
  PKTransitCommutePlan *v56;
  id v57;
  PKTransitCommutePlanPackage *v58;
  id v59;
  unint64_t v60;
  objc_super v61;
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v61.receiver = self;
  v61.super_class = (Class)PKTransitCommutePlanPackage;
  v16 = -[PKTransitCommutePlanPackage init](&v61, sel_init);
  if (!v16)
    goto LABEL_31;
  v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v12, "objectForKey:", CFSTR("paymentCard"));
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "objectForKey:", CFSTR("commutePlans"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  commutePlanLookupDictionary = v16->_commutePlanLookupDictionary;
  v16->_commutePlanLookupDictionary = v19;

  -[PKTransitCommutePlanPackage setTransitCommutePlanType:](v16, "setTransitCommutePlanType:", 0);
  if (v18)
  {
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __97__PKTransitCommutePlanPackage_initWithDictionary_backFieldBuckets_bundle_privateBundle_passType___block_invoke;
    v55[3] = &unk_1E2ADA1A8;
    v56 = (PKTransitCommutePlan *)v14;
    v57 = v15;
    v60 = a7;
    v21 = v16;
    v58 = v21;
    v59 = v17;
    objc_msgSend(v18, "enumerateObjectsUsingBlock:", v55);
    -[PKTransitCommutePlanPackage setTransitCommutePlanType:](v21, "setTransitCommutePlanType:", 2);

    v22 = v56;
    goto LABEL_30;
  }
  v37 = v15;
  v42 = v17;
  p_isa = (id *)&v16->super.isa;
  v39 = v12;
  v23 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v38 = v13;
  obj = v13;
  v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
  v22 = 0;
  if (!v45)
    goto LABEL_29;
  v44 = *(_QWORD *)v52;
  do
  {
    v24 = 0;
    do
    {
      if (*(_QWORD *)v52 != v44)
        objc_enumerationMutation(obj);
      v46 = v24;
      v25 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v24);
      v47 = 0u;
      v48 = 0u;
      v49 = 0u;
      v50 = 0u;
      v26 = v25;
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v47, v62, 16);
      if (v27)
      {
        v28 = v27;
        v29 = *(_QWORD *)v48;
        do
        {
          for (i = 0; i != v28; ++i)
          {
            if (*(_QWORD *)v48 != v29)
              objc_enumerationMutation(v26);
            v31 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
            objc_msgSend(v31, "key");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v32, "hasPrefix:", CFSTR("commuter")))
            {
              if (!v22)
              {
                v22 = objc_alloc_init(PKTransitCommutePlan);
                -[PKTransitCommutePlan setIdentifier:](v22, "setIdentifier:", CFSTR("commute_plan"));
              }
              if (objc_msgSend(v32, "isEqual:", CFSTR("commuter_route")))
              {
                v33 = (void *)objc_msgSend(v31, "copy");
                objc_msgSend(v33, "setKey:", CFSTR("genericTimedPlan"));
                -[PKTransitCommutePlan setTitle:](v22, "setTitle:", v33);
LABEL_21:

                goto LABEL_23;
              }
              if (objc_msgSend(v32, "isEqual:", CFSTR("commuter_route_expiration")))
              {
                v33 = (void *)objc_msgSend(v31, "copy");
                objc_msgSend(v33, "setKey:", CFSTR("expiryDate"));
                objc_msgSend(v23, "addObject:", v33);
                goto LABEL_21;
              }
              objc_msgSend(v23, "addObject:", v31);
            }
LABEL_23:

          }
          v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v47, v62, 16);
        }
        while (v28);
      }

      if (v22)
      {
        v34 = (void *)objc_msgSend(v23, "copy");
        -[PKTransitCommutePlan setDetails:](v22, "setDetails:", v34);

        objc_msgSend(p_isa[3], "setObject:forKey:", v22, CFSTR("commute_plan"));
        objc_msgSend(v42, "addObject:", v22);
        objc_msgSend(p_isa, "setTransitCommutePlanType:", 1);
      }
      v24 = v46 + 1;
    }
    while (v46 + 1 != v45);
    v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
  }
  while (v45);
LABEL_29:

  v13 = v38;
  v12 = v39;
  v15 = v37;
  v17 = v42;
  v16 = (PKTransitCommutePlanPackage *)p_isa;
  v18 = 0;
LABEL_30:

  v35 = (void *)objc_msgSend(v17, "copy");
  -[PKTransitCommutePlanPackage setTransitCommutePlans:](v16, "setTransitCommutePlans:", v35);

LABEL_31:
  return v16;
}

- (void)setTransitCommutePlans:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setTransitCommutePlanType:(unint64_t)a3
{
  self->_transitCommutePlanType = a3;
}

void __97__PKTransitCommutePlanPackage_initWithDictionary_backFieldBuckets_bundle_privateBundle_passType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  PKTransitCommutePlan *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  PKTransitCommutePlan *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "PKStringForKey:", CFSTR("identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_alloc_init(PKTransitCommutePlan);
    v6 = (void *)objc_msgSend(v4, "copy");
    -[PKTransitCommutePlan setIdentifier:](v5, "setIdentifier:", v6);

    objc_msgSend(v3, "PKArrayForKey:", CFSTR("deviceAccountIdentifiers"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = (void *)objc_msgSend(v7, "copy");
      -[PKTransitCommutePlan setDeviceAccountIdentifiers:](v5, "setDeviceAccountIdentifiers:", v9);

    }
    -[PKTransitCommutePlan setRequiresAppletSourceOfTruth:](v5, "setRequiresAppletSourceOfTruth:", objc_msgSend(v3, "PKBoolForKey:", CFSTR("requiresAppletSourceOfTruth")));
    -[PKTransitCommutePlan setIsDeviceBound:](v5, "setIsDeviceBound:", objc_msgSend(v3, "PKBoolForKey:", CFSTR("isDeviceBound")));
    v10 = -[PKTransitCommutePlan properties](v5, "properties");
    v11 = objc_msgSend(v3, "PKBoolForKey:", CFSTR("autoloaded"));
    v12 = 2;
    if (!v11)
      v12 = 0;
    -[PKTransitCommutePlan setProperties:](v5, "setProperties:", v12 | v10 & 0xFFFFFFFFFFFFFFFDLL);
    objc_msgSend(v3, "PKDictionaryForKey:", CFSTR("title"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v28 = v13;
      v29 = v8;
      v15 = v4;
      _FieldForTypeWithDictionaryAndBundle(1, v13, *(void **)(a1 + 32), *(void **)(a1 + 40), 0, 1, *(_QWORD *)(a1 + 64));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = v5;
      -[PKTransitCommutePlan setTitle:](v5, "setTitle:", v16);

      v31 = v3;
      objc_msgSend(v3, "PKArrayForKey:", CFSTR("details"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v17, "count"));
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v19 = v17;
      v20 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v33;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v33 != v22)
              objc_enumerationMutation(v19);
            v24 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
            _FieldForTypeWithDictionaryAndBundle(4, v24, *(void **)(a1 + 32), *(void **)(a1 + 40), 0, 1, *(_QWORD *)(a1 + 64));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            if (v25)
            {
              objc_msgSend(v18, "addObject:", v25);
            }
            else
            {
              PKLogFacilityTypeGetObject(0xCuLL);
              v26 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                v37 = v15;
                v38 = 2112;
                v39 = v24;
                _os_log_impl(&dword_18FC92000, v26, OS_LOG_TYPE_DEFAULT, "Can't parse a details field on commutePlan %@ %@", buf, 0x16u);
              }

            }
          }
          v21 = -[NSObject countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
        }
        while (v21);
      }

      v27 = (void *)objc_msgSend(v18, "copy");
      v5 = v30;
      -[PKTransitCommutePlan setDetails:](v30, "setDetails:", v27);

      v4 = v15;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 24), "setObject:forKey:", v30, v15);
      objc_msgSend(*(id *)(a1 + 56), "addObject:", v30);

      v3 = v31;
      v14 = v28;
      v8 = v29;
    }
    else
    {
      PKLogFacilityTypeGetObject(0xCuLL);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v37 = v4;
        _os_log_impl(&dword_18FC92000, v19, OS_LOG_TYPE_DEFAULT, "No title field for commutePlan with identifier %@", buf, 0xCu);
      }
    }

  }
  else
  {
    PKLogFacilityTypeGetObject(0xCuLL);
    v5 = (PKTransitCommutePlan *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FC92000, &v5->super, OS_LOG_TYPE_DEFAULT, "No identifier for a commutePlan in pass, skipping", buf, 2u);
    }
  }

}

- (id)planForIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_commutePlanLookupDictionary, "objectForKeyedSubscript:", a3);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *transitCommutePlans;
  id v5;

  transitCommutePlans = self->_transitCommutePlans;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", transitCommutePlans, CFSTR("PKTransitCommutePlanPackagePlansKey"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_commutePlanLookupDictionary, CFSTR("PKTransitCommutePlanPackageLookupKey"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_transitCommutePlanType, CFSTR("PKTransitCommutePlanPackageTypeKey"));

}

- (PKTransitCommutePlanPackage)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("PKTransitCommutePlanPackagePlansKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTransitCommutePlanPackage setTransitCommutePlans:](self, "setTransitCommutePlans:", v8);

  v9 = (void *)MEMORY[0x1E0C99E60];
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  objc_msgSend(v9, "setWithObjects:", v10, v11, objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v12, CFSTR("PKTransitCommutePlanPackageLookupKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTransitCommutePlanPackage setCommutePlanLookupDictionary:](self, "setCommutePlanLookupDictionary:", v13);

  v14 = objc_msgSend(v5, "decodeIntegerForKey:", CFSTR("PKTransitCommutePlanPackageTypeKey"));
  -[PKTransitCommutePlanPackage setTransitCommutePlanType:](self, "setTransitCommutePlanType:", v14);

  return self;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  objc_msgSend(v4, "setTransitCommutePlans:", self->_transitCommutePlans);
  objc_msgSend(v4, "setCommutePlanLookupDictionary:", self->_commutePlanLookupDictionary);
  objc_msgSend(v4, "setTransitCommutePlanType:", self->_transitCommutePlanType);
  return v4;
}

- (NSMutableDictionary)commutePlanLookupDictionary
{
  return self->_commutePlanLookupDictionary;
}

- (void)setCommutePlanLookupDictionary:(id)a3
{
  objc_storeStrong((id *)&self->_commutePlanLookupDictionary, a3);
}

@end
