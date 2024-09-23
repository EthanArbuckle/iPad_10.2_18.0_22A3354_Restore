@implementation PKExpressPassInformation

- (void)encodeWithCoder:(id)a3
{
  id v4;
  PKExpressPassInformation *v5;
  id v6;
  id v7;
  NSDictionary *configuration;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *, void *);
  void *v14;
  id v15;
  id *v16;
  id v17;
  id *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_passUniqueIdentifier, CFSTR("passUniqueIdentifier"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_userChoice, CFSTR("userChoice"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_cardType, CFSTR("cardType"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_configuration, CFSTR("configuration.1"));
  if (!self->_forceModernEncoding)
  {
    v5 = self;
    v6 = v4;
    if (self->_configuration)
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v17 = 0;
      v18 = &v17;
      v19 = 0x3032000000;
      v20 = __Block_byref_object_copy__58;
      v21 = __Block_byref_object_dispose__58;
      v22 = 0;
      configuration = self->_configuration;
      v11 = (id)MEMORY[0x1E0C809B0];
      v12 = 3221225472;
      v13 = __EncodeV1Format_block_invoke;
      v14 = &unk_1E2AD6CD8;
      v9 = v7;
      v15 = v9;
      v16 = &v17;
      -[NSDictionary enumerateKeysAndObjectsUsingBlock:](configuration, "enumerateKeysAndObjectsUsingBlock:", &v11);
      objc_msgSend(v6, "encodeObject:forKey:", v9, CFSTR("configuration"), v11, v12, v13, v14);
      objc_msgSend(v6, "encodeObject:forKey:", v18[5], CFSTR("subcredentialCredentialIdentifiers"));

      _Block_object_dispose(&v17, 8);
    }

    v17 = 0;
    v11 = 0;
    v10 = v6;
    ExtractV0Format(v5, &v17, &v11);
    objc_msgSend(v10, "encodeObject:forKey:", v17, CFSTR("expressMode"));
    objc_msgSend(v10, "encodeObject:forKey:", v11, CFSTR("paymentApplicationIdentifier"));

  }
}

- (NSString)passUniqueIdentifier
{
  return self->_passUniqueIdentifier;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_v0_expressMode, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (id)initForPaymentPass:(id)a3 withTechologyTest:(id)a4
{
  id v5;
  unsigned int (**v6)(id, uint64_t);
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  PKExpressPassInformation *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  void *v56;
  _QWORD v57[2];
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v35 = self;
  v61 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (unsigned int (**)(id, uint64_t))a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v36 = v5;
  objc_msgSend(v5, "devicePaymentApplications");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v53;
    v37 = v8;
    v38 = *(_QWORD *)v53;
    do
    {
      v12 = 0;
      v39 = v10;
      do
      {
        if (*(_QWORD *)v53 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v12);
        if (objc_msgSend(v13, "supportsContactlessPayment", v35)
          && objc_msgSend(v13, "supportsExpress"))
        {
          objc_msgSend(v13, "applicationIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "automaticSelectionCriteria");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v14, "length") && objc_msgSend(v15, "count"))
          {
            v40 = v13;
            v43 = v12;
            v16 = objc_alloc_init(MEMORY[0x1E0C99E20]);
            v48 = 0u;
            v49 = 0u;
            v50 = 0u;
            v51 = 0u;
            v42 = v15;
            v17 = v15;
            v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
            if (v18)
            {
              v19 = v18;
              v20 = *(_QWORD *)v49;
              do
              {
                for (i = 0; i != v19; ++i)
                {
                  if (*(_QWORD *)v49 != v20)
                    objc_enumerationMutation(v17);
                  v22 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
                  if (objc_msgSend(v22, "supportsExpress"))
                  {
                    v23 = objc_msgSend(v22, "technologyType");
                    if (v23)
                    {
                      if (!v6 || v6[2](v6, v23))
                        objc_msgSend(v16, "addObject:", v22);
                    }
                  }
                }
                v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v48, v59, 16);
              }
              while (v19);
            }

            if (objc_msgSend(v16, "count"))
            {
              objc_msgSend(v40, "subcredentials");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v24, "count"))
              {
                v46 = 0u;
                v47 = 0u;
                v44 = 0u;
                v45 = 0u;
                objc_msgSend(v40, "subcredentials");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v44, v58, 16);
                if (v26)
                {
                  v27 = v26;
                  v41 = v24;
                  v28 = *(_QWORD *)v45;
                  do
                  {
                    for (j = 0; j != v27; ++j)
                    {
                      if (*(_QWORD *)v45 != v28)
                        objc_enumerationMutation(v25);
                      objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * j), "identifier");
                      v30 = objc_claimAutoreleasedReturnValue();
                      v31 = (void *)v30;
                      if (v30)
                      {
                        v57[0] = v14;
                        v57[1] = v30;
                        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 2);
                        v32 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v7, "setObject:forKeyedSubscript:", v16, v32);

                      }
                    }
                    v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v44, v58, 16);
                  }
                  while (v27);
                  v8 = v37;
                  v24 = v41;
                }
              }
              else
              {
                v56 = v14;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v56, 1);
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v7, "setObject:forKeyedSubscript:", v16, v25);
              }

            }
            v11 = v38;
            v10 = v39;
            v15 = v42;
            v12 = v43;
          }

        }
        ++v12;
      }
      while (v12 != v10);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
    }
    while (v10);
  }

  v33 = -[PKExpressPassInformation _initForPaymentPass:configuration:](v35, "_initForPaymentPass:configuration:", v36, v7);
  return v33;
}

- (id)_initForPaymentPass:(id)a3 configuration:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  PKExpressPassInformation *v15;
  int v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "uniqueID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && objc_msgSend(v7, "count"))
  {
    v9 = -[PKExpressPassInformation _init](self, "_init");
    if (v9)
    {
      v9[4] = objc_msgSend(v6, "cardType");
      v10 = objc_msgSend(v8, "copy");
      v11 = (void *)v9[5];
      v9[5] = v10;

      *((_BYTE *)v9 + 24) = objc_msgSend(v6, "contactlessActivationGroupingType") == 2;
      v12 = objc_msgSend(v7, "copy");
      v13 = (void *)v9[1];
      v9[1] = v12;

      if (!v9[4])
      {
        if ((objc_msgSend(v6, "isTransitPass") & 1) != 0)
        {
          v14 = 2;
        }
        else
        {
          v16 = objc_msgSend(v6, "isAccessPass");
          v14 = 3;
          if (!v16)
            v14 = 1;
        }
        v9[4] = v14;
      }
    }
    self = v9;
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (PKExpressPassInformation)initWithCoder:(id)a3
{
  id v4;
  PKExpressPassInformation *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSDictionary *configuration;
  uint64_t v14;
  NSString *passUniqueIdentifier;
  PKExpressPassInformation *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSString *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  NSString *v30;
  NSString *v31;
  uint64_t v32;
  NSDictionary *v33;
  NSString *v34;
  void *v35;
  unint64_t v36;
  unint64_t v37;
  NSString *v38;
  NSString *v39;
  uint64_t v40;
  NSDictionary *v41;
  char v43;
  _QWORD v44[4];
  id v45;
  id v46;

  v4 = a3;
  v5 = -[PKExpressPassInformation _init](self, "_init");
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0C99E60]);
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = (void *)objc_msgSend(v6, "initWithObjects:", v7, v8, v9, v10, objc_opt_class(), 0);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("configuration.1"));
    v12 = objc_claimAutoreleasedReturnValue();
    configuration = v5->_configuration;
    v5->_configuration = (NSDictionary *)v12;

    if (v5->_configuration)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passUniqueIdentifier"));
      v14 = objc_claimAutoreleasedReturnValue();
      passUniqueIdentifier = v5->_passUniqueIdentifier;
      v5->_passUniqueIdentifier = (NSString *)v14;

      v5->_userChoice = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("userChoice"));
      v5->_cardType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("cardType"));
    }
    else
    {
      v16 = v5;
      v17 = v4;
      v18 = objc_opt_class();
      v19 = objc_opt_class();
      v20 = objc_opt_class();
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v19, v20, v18, objc_opt_class(), 0);
      objc_msgSend(v17, "decodeObjectOfClasses:forKey:", v21, CFSTR("configuration"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        objc_msgSend(v17, "decodeObjectOfClass:forKey:", v20, CFSTR("passUniqueIdentifier"));
        v23 = (NSString *)objc_claimAutoreleasedReturnValue();
        v43 = objc_msgSend(v17, "decodeBoolForKey:", CFSTR("userChoice"));
        v24 = objc_msgSend(v17, "decodeIntegerForKey:", CFSTR("cardType"));
        v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v19, v20, 0);
        objc_msgSend(v17, "decodeObjectOfClasses:forKey:", v25, CFSTR("subcredentialCredentialIdentifiers"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v27 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v44[0] = MEMORY[0x1E0C809B0];
        v44[1] = 3221225472;
        v44[2] = __DecodeV1Format_block_invoke;
        v44[3] = &unk_1E2AD6D28;
        v45 = v26;
        v46 = v27;
        v28 = v26;
        v29 = v27;
        objc_msgSend(v22, "enumerateKeysAndObjectsUsingBlock:", v44);
        v30 = v16->_passUniqueIdentifier;
        v16->_passUniqueIdentifier = v23;
        v31 = v23;

        v16->_userChoice = v43;
        v16->_cardType = v24;
        v32 = objc_msgSend(v29, "copy");
        v33 = v5->_configuration;
        v5->_configuration = (NSDictionary *)v32;

      }
      else
      {

        v16 = v16;
        v17 = v17;
        objc_msgSend(v17, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expressMode"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          objc_msgSend(v17, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("passUniqueIdentifier"));
          v34 = (NSString *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("paymentApplicationIdentifier"));
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = PKExpressPassTypeForExpressMode(v22);
          if (v36 < 3)
            v37 = v36 + 1;
          else
            v37 = 0;
          v38 = v16->_passUniqueIdentifier;
          v16->_passUniqueIdentifier = v34;
          v39 = v34;

          v16->_cardType = v37;
          ConfigurationFromV0((uint64_t)v22, (uint64_t)v39, v35);
          v40 = objc_claimAutoreleasedReturnValue();
          v41 = v5->_configuration;
          v5->_configuration = (NSDictionary *)v40;

        }
      }

    }
  }

  return v5;
}

+ (BOOL)extractApplicationIdentifier:(id *)a3 subcredentialIdentifier:(id *)a4 fromIdentifiers:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  id v12;
  void *v13;
  BOOL v14;
  id v15;

  v7 = a5;
  v8 = v7;
  if (v7 && (v9 = objc_msgSend(v7, "count"), (unint64_t)(v9 - 1) <= 1))
  {
    v10 = v9;
    if (a3)
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = *a3;
      *a3 = v11;

    }
    if (a4)
    {
      if (v10 < 2)
      {
        v13 = 0;
      }
      else
      {
        objc_msgSend(v8, "objectAtIndexedSubscript:", 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v15 = *a4;
      *a4 = v13;

    }
    v14 = 1;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (PKExpressPassInformation)init
{

  return 0;
}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKExpressPassInformation;
  return -[PKExpressPassInformation init](&v3, sel_init);
}

- (PKExpressPassInformation)initWithExpressPassInformation:(id)a3
{
  id v4;
  PKExpressPassInformation *v5;
  PKExpressPassInformation *v6;
  uint64_t v7;
  NSString *passUniqueIdentifier;
  uint64_t v9;
  NSDictionary *configuration;
  uint64_t v11;
  NSString *v0_expressMode;
  PKExpressPassInformation *result;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKExpressPassInformation;
  v5 = -[PKExpressPassInformation init](&v14, sel_init);
  v6 = v5;
  if (!v5)
    goto LABEL_3;
  v5->_cardType = *((_QWORD *)v4 + 4);
  v7 = objc_msgSend(*((id *)v4 + 5), "copy");
  passUniqueIdentifier = v6->_passUniqueIdentifier;
  v6->_passUniqueIdentifier = (NSString *)v7;

  v6->_userChoice = *((_BYTE *)v4 + 24);
  v9 = objc_msgSend(*((id *)v4 + 1), "copy");
  configuration = v6->_configuration;
  v6->_configuration = (NSDictionary *)v9;

  v11 = objc_msgSend(*((id *)v4 + 2), "copy");
  v0_expressMode = v6->_v0_expressMode;
  v6->_v0_expressMode = (NSString *)v11;

  if (*((_BYTE *)v4 + 25))
  {
    __break(1u);
  }
  else
  {
LABEL_3:

    return v6;
  }
  return result;
}

- (id)initDummyExpressInfoForAutomaticSelectionCriteriaUpgradeRequest:(id)a3 paymentPass:(id)a4 withTechologyTest:(id)a5
{
  id v7;
  unsigned int (**v8)(id, uint64_t);
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  PKPassAutomaticSelectionCriterion *v19;
  PKPassAutomaticSelectionCriterion *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v36;
  void *v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  void *v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v36 = a4;
  v8 = (unsigned int (**)(id, uint64_t))a5;
  v38 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v37 = v7;
  objc_msgSend(v7, "technologyTypes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v44;
    v13 = MEMORY[0x1E0C9AAB0];
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v44 != v12)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
        v16 = PKPassAutomaticSelectionTechnologyTypeFromType(v15);
        if (!v8 || v8[2](v8, v16))
        {
          v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithObjectsAndKeys:", v15, CFSTR("type"), v13, CFSTR("supportsExpress"), 0);
          v18 = v17;
          if (v16 == 5)
          {
            objc_msgSend(v17, "setObject:forKeyedSubscript:", CFSTR("2000000000"), CFSTR("openLoopExpressMask"));
            v19 = -[PKPassAutomaticSelectionCriterion initWithDictionary:]([PKPassAutomaticSelectionCriterion alloc], "initWithDictionary:", v18);
            if (v19)
            {
              v20 = v19;
              objc_msgSend(v38, "addObject:", v19);

            }
          }

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v43, v49, 16);
    }
    while (v11);
  }

  v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (objc_msgSend(v38, "count"))
  {
    v22 = objc_alloc(MEMORY[0x1E0C99E60]);
    objc_msgSend(v37, "paymentApplicationIdentifiers");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v22, "initWithArray:", v23);

    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    objc_msgSend(v36, "devicePaymentApplications");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v40;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v40 != v28)
            objc_enumerationMutation(v25);
          v30 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * j);
          objc_msgSend(v30, "applicationIdentifier");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v30, "supportsContactlessPayment")
            && objc_msgSend(v24, "containsObject:", v31))
          {
            v47 = v31;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v47, 1);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setObject:forKeyedSubscript:", v38, v32);

          }
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v39, v48, 16);
      }
      while (v27);
    }

  }
  v33 = -[PKExpressPassInformation _initForPaymentPass:configuration:](self, "_initForPaymentPass:configuration:", v36, v21);

  return v33;
}

- (BOOL)isEqual:(id)a3
{
  unsigned __int8 *v4;
  char isKindOfClass;
  void *v6;
  id v7;
  NSString *passUniqueIdentifier;
  NSString *v9;
  NSDictionary *configuration;
  NSDictionary *v11;
  char v12;

  v4 = (unsigned __int8 *)a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
    v6 = v4;
  else
    v6 = 0;
  v7 = v6;
  if ((isKindOfClass & 1) == 0 || self->_cardType != *((_QWORD *)v4 + 4) || self->_userChoice != v4[24])
    goto LABEL_14;
  passUniqueIdentifier = self->_passUniqueIdentifier;
  v9 = (NSString *)*((_QWORD *)v4 + 5);
  if (!passUniqueIdentifier || !v9)
  {
    if (passUniqueIdentifier == v9)
      goto LABEL_10;
LABEL_14:
    v12 = 0;
    goto LABEL_15;
  }
  if ((-[NSString isEqual:](passUniqueIdentifier, "isEqual:") & 1) == 0)
    goto LABEL_14;
LABEL_10:
  configuration = self->_configuration;
  v11 = (NSDictionary *)*((_QWORD *)v4 + 1);
  if (configuration && v11)
    v12 = -[NSDictionary isEqual:](configuration, "isEqual:");
  else
    v12 = configuration == v11;
LABEL_15:

  return v12;
}

- (unint64_t)hash
{
  int64_t v3;
  NSUInteger v4;

  v3 = self->_userChoice - self->_cardType + 32 * self->_cardType;
  v4 = -[NSString hash](self->_passUniqueIdentifier, "hash") - v3 + 32 * v3;
  return -[NSDictionary hash](self->_configuration, "hash") - v4 + 32 * v4 + 15699857;
}

- (id)paymentApplicationIdentifiers
{
  id v3;
  NSDictionary *configuration;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  configuration = self->_configuration;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__PKExpressPassInformation_paymentApplicationIdentifiers__block_invoke;
  v7[3] = &unk_1E2ABE568;
  v5 = v3;
  v8 = v5;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](configuration, "enumerateKeysAndObjectsUsingBlock:", v7);

  return v5;
}

void __57__PKExpressPassInformation_paymentApplicationIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v3 = v4;
  }

}

- (NSDictionary)subcredentialCredentialIdentifiers
{
  NSDictionary *configuration;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__58;
  v10 = __Block_byref_object_dispose__58;
  v11 = 0;
  configuration = self->_configuration;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__PKExpressPassInformation_subcredentialCredentialIdentifiers__block_invoke;
  v5[3] = &unk_1E2AD6CB0;
  v5[4] = &v6;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](configuration, "enumerateKeysAndObjectsUsingBlock:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

void __62__PKExpressPassInformation_subcredentialCredentialIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v3 = (unint64_t)objc_msgSend(v11, "count") >= 2;
  v4 = v11;
  if (v3)
  {
    objc_msgSend(v11, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
      {
        v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        v9 = *(void **)(v8 + 40);
        *(_QWORD *)(v8 + 40) = v7;

      }
      objc_msgSend(v11, "objectAtIndexedSubscript:", 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", v10, v5);

    }
    v4 = v11;
  }

}

- (id)criteriaForApplication:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  void *v26;
  _QWORD v27[2];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "applicationIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      objc_msgSend(v5, "subcredentials");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "count"))
      {
        v24 = 0u;
        v25 = 0u;
        v22 = 0u;
        v23 = 0u;
        objc_msgSend(v5, "subcredentials");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
        if (v9)
        {
          v10 = v9;
          v20 = v7;
          v11 = *(_QWORD *)v23;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v23 != v11)
                objc_enumerationMutation(v8);
              objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "identifier");
              v13 = objc_claimAutoreleasedReturnValue();
              v14 = (void *)v13;
              if (v13)
              {
                v27[0] = v21;
                v27[1] = v13;
                objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSDictionary objectForKeyedSubscript:](self->_configuration, "objectForKeyedSubscript:", v15);
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v6, "unionSet:", v16);

              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
          }
          while (v10);
          v7 = v20;
        }
      }
      else
      {
        v26 = v21;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v26, 1);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKeyedSubscript:](self->_configuration, "objectForKeyedSubscript:", v8);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "unionSet:", v18);

      }
      if (objc_msgSend(v6, "count"))
        v17 = (void *)objc_msgSend(v6, "copy");
      else
        v17 = 0;

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)criteriaForPaymentApplicationIdentifier:(id)a3
{
  id v4;
  void *v5;
  NSDictionary *configuration;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__58;
    v16 = __Block_byref_object_dispose__58;
    v17 = 0;
    configuration = self->_configuration;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __68__PKExpressPassInformation_criteriaForPaymentApplicationIdentifier___block_invoke;
    v9[3] = &unk_1E2AD6CD8;
    v10 = v4;
    v11 = &v12;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](configuration, "enumerateKeysAndObjectsUsingBlock:", v9);
    v7 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __68__PKExpressPassInformation_criteriaForPaymentApplicationIdentifier___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  int v13;
  id v14;

  v14 = a3;
  objc_msgSend(a2, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(a1 + 32);
  v10 = v8;
  v11 = v9;
  if (v10 == v11)
  {

  }
  else
  {
    v12 = v11;
    if (!v10 || !v11)
    {

      goto LABEL_9;
    }
    v13 = objc_msgSend(v10, "isEqualToString:", v11);

    if (!v13)
      goto LABEL_9;
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  *a4 = 1;
LABEL_9:

}

- (void)enumerateCriteriaWithHandler:(id)a3
{
  id v4;
  NSDictionary *configuration;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  if (v4)
  {
    configuration = self->_configuration;
    v7[1] = 3221225472;
    v7[2] = __57__PKExpressPassInformation_enumerateCriteriaWithHandler___block_invoke;
    v7[3] = &unk_1E2AD6D00;
    v6 = v4;
    v7[0] = MEMORY[0x1E0C809B0];
    v8 = v4;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](configuration, "enumerateKeysAndObjectsUsingBlock:", v7);

    v4 = v6;
  }

}

void __57__PKExpressPassInformation_enumerateCriteriaWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(a2, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)enumerateCredentialsWithHandler:(id)a3
{
  id v4;
  NSDictionary *configuration;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  if (v4)
  {
    configuration = self->_configuration;
    v7[1] = 3221225472;
    v7[2] = __60__PKExpressPassInformation_enumerateCredentialsWithHandler___block_invoke;
    v7[3] = &unk_1E2AD6D00;
    v6 = v4;
    v7[0] = MEMORY[0x1E0C809B0];
    v8 = v4;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](configuration, "enumerateKeysAndObjectsUsingBlock:", v7);

    v4 = v6;
  }

}

uint64_t __60__PKExpressPassInformation_enumerateCredentialsWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)description
{
  id v3;
  const __CFString *v4;
  void *v5;
  NSDictionary *configuration;
  id v7;
  _QWORD v9[4];
  id v10;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  if (self->_userChoice)
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<PKExpressPassInformation: %p; Pass %@; Card Type %ld; User Choice: %@; Configuration: "),
                 self,
                 self->_passUniqueIdentifier,
                 self->_cardType,
                 v4);
  configuration = self->_configuration;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __39__PKExpressPassInformation_description__block_invoke;
  v9[3] = &unk_1E2ABE568;
  v7 = v5;
  v10 = v7;
  -[NSDictionary enumerateKeysAndObjectsUsingBlock:](configuration, "enumerateKeysAndObjectsUsingBlock:", v9);
  objc_msgSend(v7, "appendString:", CFSTR(" >"));

  return v7;
}

uint64_t __39__PKExpressPassInformation_description__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("(%@) -> %@"), a2, a3);
}

- (id)initForExpressMode:(id)a3 withPassUniqueIdentifier:(id)a4 paymentApplicationIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  PKExpressPassInformation *v18;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (PKExpressPassTypeForExpressMode(v8))
  {
    v20.receiver = self;
    v20.super_class = (Class)PKExpressPassInformation;
    v11 = -[PKExpressPassInformation init](&v20, sel_init);
    if (v11)
    {
      v12 = objc_msgSend(v8, "copy");
      v13 = (void *)*((_QWORD *)v11 + 2);
      *((_QWORD *)v11 + 2) = v12;

      v14 = objc_msgSend(v9, "copy");
      v15 = (void *)*((_QWORD *)v11 + 5);
      *((_QWORD *)v11 + 5) = v14;

      *((_QWORD *)v11 + 4) = 0;
      ConfigurationFromV0((uint64_t)v8, *((_QWORD *)v11 + 5), v10);
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)*((_QWORD *)v11 + 1);
      *((_QWORD *)v11 + 1) = v16;

    }
    self = (PKExpressPassInformation *)v11;
    v18 = self;
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)paymentApplicationIdentifier
{
  id v2;
  id v4;

  v4 = 0;
  ExtractV0Format(self, 0, &v4);
  v2 = v4;

  return v2;
}

- (id)expressMode
{
  id v2;
  id v4;

  v4 = 0;
  ExtractV0Format(self, &v4, 0);
  v2 = v4;

  return v2;
}

- (int64_t)cardType
{
  return self->_cardType;
}

- (BOOL)isUserChoice
{
  return self->_userChoice;
}

- (BOOL)forceModernEncoding
{
  return self->_forceModernEncoding;
}

- (void)setForceModernEncoding:(BOOL)a3
{
  self->_forceModernEncoding = a3;
}

@end
