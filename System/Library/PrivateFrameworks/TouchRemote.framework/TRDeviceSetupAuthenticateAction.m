@implementation TRDeviceSetupAuthenticateAction

- (TRDeviceSetupAuthenticateAction)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TRDeviceSetupAuthenticateAction;
  return (TRDeviceSetupAuthenticateAction *)-[TRDeviceSetupAction _initWithActionType:parameters:](&v3, sel__initWithActionType_parameters_, CFSTR("auth"), 0);
}

- (id)_initWithAccountType:(unint64_t)a3 accountID:(id)a4 accountPassword:(id)a5 accountTypesWithSharedCredentials:(id)a6 attemptCount:(unint64_t)a7 requestMessage:(id)a8 failureMessage:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  unint64_t v39;
  id v40;
  TRDeviceSetupAuthenticateAction *v41;
  objc_super v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  v19 = a9;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (a3 - 1 > 3)
    v22 = &stru_24C2E6A98;
  else
    v22 = off_24C2E57C8[a3 - 1];
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v22, CFSTR("at"));
  if (v15)
  {
    v23 = (void *)objc_msgSend(v15, "copy");
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v23, CFSTR("ai"));

  }
  if (v16)
  {
    v24 = (void *)objc_msgSend(v16, "copy");
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v24, CFSTR("ap"));

  }
  if (objc_msgSend(v17, "count"))
  {
    v39 = a7;
    v40 = v19;
    v41 = self;
    v25 = v17;
    v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v25, "count"));
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v27 = v25;
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v44;
LABEL_11:
      v31 = 0;
      while (2)
      {
        if (*(_QWORD *)v44 != v30)
          objc_enumerationMutation(v27);
        switch(objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * v31), "unsignedIntegerValue", v39))
        {
          case 0:
            goto LABEL_21;
          case 1:
            v32 = CFSTR("it");
            goto LABEL_20;
          case 2:
            v32 = CFSTR("ic");
            goto LABEL_20;
          case 3:
            v32 = CFSTR("hs");
            goto LABEL_20;
          case 4:
            v32 = CFSTR("gc");
            goto LABEL_20;
          default:
            v32 = 0;
LABEL_20:
            objc_msgSend(v26, "addObject:", v32);
LABEL_21:
            if (v29 != ++v31)
              continue;
            v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
            if (!v29)
              goto LABEL_23;
            goto LABEL_11;
        }
      }
    }
LABEL_23:

    v33 = (void *)objc_msgSend(v26, "copy");
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v33, CFSTR("sa"));

    v19 = v40;
    self = v41;
    a7 = v39;
  }
  if (a7)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a7);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v34, CFSTR("a"));

  }
  if (v18)
  {
    v35 = (void *)objc_msgSend(v18, "copy");
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v35, CFSTR("rm"));

  }
  if (v19)
  {
    v36 = (void *)objc_msgSend(v19, "copy");
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v36, CFSTR("fm"));

  }
  v42.receiver = self;
  v42.super_class = (Class)TRDeviceSetupAuthenticateAction;
  v37 = -[TRDeviceSetupAction _initWithActionType:parameters:](&v42, sel__initWithActionType_parameters_, CFSTR("auth"), v21, v39);

  return v37;
}

+ (id)actionForInitialAttemptWithAccountType:(unint64_t)a3 requestMessage:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithAccountType:accountID:accountPassword:accountTypesWithSharedCredentials:attemptCount:requestMessage:failureMessage:", a3, 0, 0, 0, 0, v6, 0);

  return v7;
}

+ (id)actionForFailedAttemptWithOriginalAction:(id)a3 requestMessage:(id)a4 failureMessage:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = objc_alloc((Class)a1);
  v12 = objc_msgSend(v10, "accountType");
  objc_msgSend(v10, "accountID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "accountPassword");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v10, "attemptCount");

  v16 = (void *)objc_msgSend(v11, "_initWithAccountType:accountID:accountPassword:accountTypesWithSharedCredentials:attemptCount:requestMessage:failureMessage:", v12, v13, v14, 0, v15 + 1, v9, v8);
  return v16;
}

+ (id)actionForFinishedRequestWithOriginalAction:(id)a3 accountID:(id)a4 accountPassword:(id)a5 accountTypesWithSharedCredentials:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = objc_alloc((Class)a1);
  v15 = objc_msgSend(v13, "accountType");
  v16 = objc_msgSend(v13, "attemptCount");

  v17 = (void *)objc_msgSend(v14, "_initWithAccountType:accountID:accountPassword:accountTypesWithSharedCredentials:attemptCount:requestMessage:failureMessage:", v15, v12, v11, v10, v16, 0, 0);
  return v17;
}

+ (id)actionForCancelledRequestWithOriginalAction:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  v6 = objc_msgSend(v4, "accountType");
  v7 = objc_msgSend(v4, "attemptCount");

  return (id)objc_msgSend(v5, "_initWithAccountType:accountID:accountPassword:accountTypesWithSharedCredentials:attemptCount:requestMessage:failureMessage:", v6, 0, 0, 0, v7, 0, 0);
}

- (unint64_t)accountType
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  unint64_t v6;

  -[TRDeviceSetupAction parameters](self, "parameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("at"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  v6 = _TRSetupAccountTypeFromProtocolString(v5);
  return v6;
}

- (NSString)accountID
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[TRDeviceSetupAction parameters](self, "parameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ai"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return (NSString *)v5;
}

- (NSString)accountPassword
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[TRDeviceSetupAction parameters](self, "parameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("ap"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return (NSString *)v5;
}

- (NSArray)accountTypesWithSharedCredentials
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[TRDeviceSetupAction parameters](self, "parameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("sa"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  v6 = v5;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = _TRSetupAccountTypeFromProtocolString(*(void **)(*((_QWORD *)&v16 + 1) + 8 * v12));
        if (v13)
        {
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v13, (_QWORD)v16);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v14);

        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  return (NSArray *)v7;
}

- (unint64_t)attemptCount
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  unint64_t v6;

  -[TRDeviceSetupAction parameters](self, "parameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("a"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  v6 = objc_msgSend(v5, "unsignedIntegerValue");
  return v6;
}

- (NSString)requestMessage
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[TRDeviceSetupAction parameters](self, "parameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("rm"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return (NSString *)v5;
}

- (NSString)failureMessage
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  -[TRDeviceSetupAction parameters](self, "parameters");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("fm"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return (NSString *)v5;
}

@end
