@implementation SUDownloadOptions

- (SUDownloadOptions)initWithDescriptor:(id)a3
{
  id v5;
  SUDownloadOptions *v6;
  SUDownloadOptions *v7;
  NSString *clientName;
  dispatch_queue_t v9;
  OS_dispatch_queue *stateQueue;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SUDownloadOptions;
  v6 = -[SUOptionsBase init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_descriptor, a3);
    v7->_downloadOnly = 0;
    v7->_autoDownload = 0;
    v7->_userUpdateTonight = 0;
    v7->_allowUnrestrictedCellularDownload = 0;
    v7->_downloadFeeAgreementStatus = 0;
    v7->_termsAndConditionsAgreementStatus = 0;
    v7->_activeDownloadPolicyType = 3;
    clientName = v7->_clientName;
    v7->_clientName = (NSString *)CFSTR("com.apple.softwareupdateservicesd");

    v9 = dispatch_queue_create("com.apple.softwareupdateservicesd.downloadoptionsqueue", 0);
    stateQueue = v7->_stateQueue;
    v7->_stateQueue = (OS_dispatch_queue *)v9;

  }
  return v7;
}

- (SUDownloadOptions)initWithMetadata:(id)a3 andDescriptor:(id)a4
{
  id v6;
  SUDownloadOptions *v7;
  SUDownloadOptions *v8;
  NSString *clientName;

  v6 = a3;
  v7 = -[SUDownloadOptions initWithDescriptor:](self, "initWithDescriptor:", a4);
  v8 = v7;
  if (v6 && v7)
  {
    v7->_downloadOnly = objc_msgSend(v6, "isDownloadOnly");
    v8->_autoDownload = objc_msgSend(v6, "isAutoDownload");
    v8->_userUpdateTonight = 0;
    v8->_allowUnrestrictedCellularDownload = 0;
    v8->_downloadFeeAgreementStatus = objc_msgSend(v6, "downloadFeeAgreementStatus");
    v8->_termsAndConditionsAgreementStatus = objc_msgSend(v6, "termsAndConditionsAgreementStatus");
    v8->_activeDownloadPolicyType = objc_msgSend(v6, "activeDownloadPolicyType");
    clientName = v8->_clientName;
    v8->_clientName = (NSString *)CFSTR("com.apple.softwareupdateservicesd");

  }
  return v8;
}

- (void)setActiveDownloadPolicyType:(int)a3
{
  NSObject *stateQueue;
  _QWORD v4[5];
  int v5;

  stateQueue = self->_stateQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __49__SUDownloadOptions_setActiveDownloadPolicyType___block_invoke;
  v4[3] = &unk_24CE3BB10;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(stateQueue, v4);
}

void __49__SUDownloadOptions_setActiveDownloadPolicyType___block_invoke(uint64_t a1)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_DWORD *)(a1 + 40);
  if (*(_DWORD *)(v1 + 32) != v2)
  {
    *(_DWORD *)(v1 + 32) = v2;
    SUStringFromDownloadPolicyType(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 32));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    SULogInfo(CFSTR("Settings downloadPolicy to: %@"), v3, v4, v5, v6, v7, v8, v9, (uint64_t)v10);

  }
}

- (int)activeDownloadPolicyType
{
  NSObject *stateQueue;
  int v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __45__SUDownloadOptions_activeDownloadPolicyType__block_invoke;
  v5[3] = &unk_24CE3B5E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __45__SUDownloadOptions_activeDownloadPolicyType__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 32);
  return result;
}

- (void)setDownloadFeeAgreementStatus:(int)a3
{
  NSObject *stateQueue;
  _QWORD v4[5];
  int v5;

  stateQueue = self->_stateQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __51__SUDownloadOptions_setDownloadFeeAgreementStatus___block_invoke;
  v4[3] = &unk_24CE3BB10;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(stateQueue, v4);
}

uint64_t __51__SUDownloadOptions_setDownloadFeeAgreementStatus___block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(_DWORD *)(result + 40);
  if (*(_DWORD *)(v1 + 12) != v2)
    *(_DWORD *)(v1 + 12) = v2;
  return result;
}

- (SUDownloadPolicy)activeDownloadPolicy
{
  NSObject *stateQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __41__SUDownloadOptions_activeDownloadPolicy__block_invoke;
  v5[3] = &unk_24CE3B5E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (SUDownloadPolicy *)v3;
}

uint64_t __41__SUDownloadOptions_activeDownloadPolicy__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  +[SUDownloadPolicyFactory downloadPolicyForType:forDescriptor:](SUDownloadPolicyFactory, "downloadPolicyForType:forDescriptor:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setCellularFeeAgreementStatus:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 12));
}

- (void)setActiveDownloadPolicy:(id)a3
{
  id v4;
  void *v5;
  NSObject *stateQueue;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  SUDownloadOptions *v12;

  v4 = a3;
  -[SUDownloadOptions activeDownloadPolicy](self, "activeDownloadPolicy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__SUDownloadOptions_setActiveDownloadPolicy___block_invoke;
  block[3] = &unk_24CE3BB38;
  v10 = v5;
  v11 = v4;
  v12 = self;
  v7 = v4;
  v8 = v5;
  dispatch_sync(stateQueue, block);

}

void __45__SUDownloadOptions_setActiveDownloadPolicy___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v2 = +[SUDownloadPolicyFactory downloadPolicyTypeForClass:](SUDownloadPolicyFactory, "downloadPolicyTypeForClass:", *(_QWORD *)(a1 + 32));
  v3 = +[SUDownloadPolicyFactory downloadPolicyTypeForClass:](SUDownloadPolicyFactory, "downloadPolicyTypeForClass:", *(_QWORD *)(a1 + 40));
  if (v2 != v3
    || (v4 = objc_msgSend(*(id *)(a1 + 32), "cellularFeeAgreementStatus"),
        v4 != objc_msgSend(*(id *)(a1 + 40), "cellularFeeAgreementStatus")))
  {
    *(_DWORD *)(*(_QWORD *)(a1 + 48) + 32) = v3;
    *(_DWORD *)(*(_QWORD *)(a1 + 48) + 12) = objc_msgSend(*(id *)(a1 + 40), "cellularFeeAgreementStatus");
    SUStringFromDownloadPolicyType(*(_DWORD *)(*(_QWORD *)(a1 + 48) + 32));
    v12 = (id)objc_claimAutoreleasedReturnValue();
    SULogInfo(CFSTR("Settings downloadPolicy to: %@"), v5, v6, v7, v8, v9, v10, v11, (uint64_t)v12);

  }
}

- (void)setAllowUnrestrictedCellularDownload:(BOOL)a3
{
  NSObject *stateQueue;
  _QWORD v4[5];
  BOOL v5;

  stateQueue = self->_stateQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __58__SUDownloadOptions_setAllowUnrestrictedCellularDownload___block_invoke;
  v4[3] = &unk_24CE3BB60;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(stateQueue, v4);
}

uint64_t __58__SUDownloadOptions_setAllowUnrestrictedCellularDownload___block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 11) != v2)
    *(_BYTE *)(v1 + 11) = v2;
  return result;
}

- (BOOL)allowsUnrestrictedCellularDownload
{
  NSObject *stateQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __55__SUDownloadOptions_allowsUnrestrictedCellularDownload__block_invoke;
  v5[3] = &unk_24CE3B5E8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __55__SUDownloadOptions_allowsUnrestrictedCellularDownload__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 11);
  return result;
}

- (BOOL)allowCellular
{
  void *v3;
  int v4;
  int v5;
  void *v6;
  char v7;
  void *v9;

  -[SUDownloadOptions activeDownloadPolicy](self, "activeDownloadPolicy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isDownloadAllowableForCellular");

  if (!v4)
    return 0;
  v5 = -[SUDownloadOptions downloadFeeAgreementStatus](self, "downloadFeeAgreementStatus");
  if (v5 == 1)
    return 1;
  if (v5)
    return 0;
  -[SUDownloadOptions activeDownloadPolicy](self, "activeDownloadPolicy");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isDownloadFreeForCellular") & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    -[SUDownloadOptions activeDownloadPolicy](self, "activeDownloadPolicy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v9, "is5GDownloadAllowed");

  }
  return v7;
}

- (BOOL)allowExpensiveNetwork
{
  void *v3;
  int v4;
  int v5;
  void *v6;
  char v7;

  -[SUDownloadOptions activeDownloadPolicy](self, "activeDownloadPolicy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "allowExpensiveNetwork");

  if (!v4)
    goto LABEL_5;
  v5 = -[SUDownloadOptions downloadFeeAgreementStatus](self, "downloadFeeAgreementStatus");
  if (v5 != 1)
  {
    if (!v5)
    {
      -[SUDownloadOptions activeDownloadPolicy](self, "activeDownloadPolicy");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isDownloadFreeForCellular");

      LOBYTE(v5) = v7;
      return v5;
    }
LABEL_5:
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)isEnabledForCellularRoaming
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[SUDownloadOptions allowCellular](self, "allowCellular");
  if (v3)
  {
    -[SUDownloadOptions activeDownloadPolicy](self, "activeDownloadPolicy");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isDownloadAllowableForCellularRoaming");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)isEnabledForWifi
{
  void *v2;
  char v3;

  -[SUDownloadOptions activeDownloadPolicy](self, "activeDownloadPolicy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isDownloadAllowableForWiFi");

  return v3;
}

- (BOOL)isEnabledOnBatteryPower
{
  void *v2;
  char v3;

  -[SUDownloadOptions activeDownloadPolicy](self, "activeDownloadPolicy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPowerRequired") ^ 1;

  return v3;
}

- (BOOL)isCacheDeleteSpecialCaseEnabled
{
  void *v2;
  char v3;

  -[SUDownloadOptions descriptor](self, "descriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "cdLevel4Disabled") ^ 1;

  return v3;
}

- (BOOL)isAppOffloadEnabled
{
  void *v2;
  char v3;

  -[SUDownloadOptions descriptor](self, "descriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "appDemotionDisabled") ^ 1;

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  SUDownloadOptions *v4;
  SUDownloadOptions *v5;
  void *v6;
  void *v7;
  _BOOL4 v8;
  _BOOL4 v9;
  _BOOL4 v10;
  int v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  _BOOL4 v17;

  v4 = (SUDownloadOptions *)a3;
  if (v4 == self)
  {
    LOBYTE(v15) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[SUDownloadOptions descriptor](v5, "descriptor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SUDownloadOptions descriptor](self, "descriptor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqual:", v7)
        && (v8 = -[SUDownloadOptions isAutoDownload](v5, "isAutoDownload"),
            v8 == -[SUDownloadOptions isAutoDownload](self, "isAutoDownload"))
        && (v9 = -[SUDownloadOptions isDownloadOnly](v5, "isDownloadOnly"),
            v9 == -[SUDownloadOptions isDownloadOnly](self, "isDownloadOnly"))
        && (v10 = -[SUDownloadOptions userUpdateTonight](v5, "userUpdateTonight"),
            v10 == -[SUDownloadOptions userUpdateTonight](self, "userUpdateTonight"))
        && (v11 = -[SUDownloadOptions downloadFeeAgreementStatus](v5, "downloadFeeAgreementStatus"),
            v11 == -[SUDownloadOptions downloadFeeAgreementStatus](self, "downloadFeeAgreementStatus"))
        && (v12 = -[SUDownloadOptions termsAndConditionsAgreementStatus](v5, "termsAndConditionsAgreementStatus"),
            v12 == -[SUDownloadOptions termsAndConditionsAgreementStatus](self, "termsAndConditionsAgreementStatus")))
      {
        -[SUDownloadOptions activeDownloadPolicy](v5, "activeDownloadPolicy");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUDownloadOptions activeDownloadPolicy](self, "activeDownloadPolicy");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13 == v14)
        {
          v17 = -[SUDownloadOptions allowUnrestrictedCellularDownload](v5, "allowUnrestrictedCellularDownload");
          v15 = v17 ^ -[SUDownloadOptions allowUnrestrictedCellularDownload](self, "allowUnrestrictedCellularDownload") ^ 1;
        }
        else
        {
          LOBYTE(v15) = 0;
        }

      }
      else
      {
        LOBYTE(v15) = 0;
      }

    }
    else
    {
      LOBYTE(v15) = 0;
    }
  }

  return v15;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUDownloadOptions)initWithCoder:(id)a3
{
  id v4;
  SUDownloadOptions *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SUDownloadOptions;
  v5 = -[SUOptionsBase init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("descriptor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[SUDownloadOptions initWithDescriptor:](v5, "initWithDescriptor:", v6);
    -[SUDownloadOptions setDownloadOnly:](v5, "setDownloadOnly:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("downloadOnly")));
    -[SUDownloadOptions setAutoDownload:](v5, "setAutoDownload:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("autoDownload")));
    -[SUDownloadOptions setUserUpdateTonight:](v5, "setUserUpdateTonight:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("userUpdateTonight")));
    -[SUDownloadOptions setAllowUnrestrictedCellularDownload:](v5, "setAllowUnrestrictedCellularDownload:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("allowUnrestrictedCellularDownload")));
    -[SUDownloadOptions setDownloadFeeAgreementStatus:](v5, "setDownloadFeeAgreementStatus:", objc_msgSend(v4, "decodeIntForKey:", CFSTR("feeAgreementStatus")));
    -[SUDownloadOptions setTermsAndConditionsAgreementStatus:](v5, "setTermsAndConditionsAgreementStatus:", objc_msgSend(v4, "decodeIntForKey:", CFSTR("termsAgreementStatus")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("descriptor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDownloadOptions setDownloadDescriptor:](v5, "setDownloadDescriptor:", v7);

    -[SUDownloadOptions setActiveDownloadPolicyType:](v5, "setActiveDownloadPolicyType:", objc_msgSend(v4, "decodeIntForKey:", CFSTR("policyType")));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("SUDownloadClientNameKey"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDownloadOptions setClientName:](v5, "setClientName:", v8);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 downloadOnly;
  id v5;

  downloadOnly = self->_downloadOnly;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", downloadOnly, CFSTR("downloadOnly"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_autoDownload, CFSTR("autoDownload"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_userUpdateTonight, CFSTR("userUpdateTonight"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_allowUnrestrictedCellularDownload, CFSTR("allowUnrestrictedCellularDownload"));
  objc_msgSend(v5, "encodeInt:forKey:", self->_downloadFeeAgreementStatus, CFSTR("feeAgreementStatus"));
  objc_msgSend(v5, "encodeInt:forKey:", self->_termsAndConditionsAgreementStatus, CFSTR("termsAgreementStatus"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_descriptor, CFSTR("descriptor"));
  objc_msgSend(v5, "encodeInt:forKey:", self->_activeDownloadPolicyType, CFSTR("policyType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clientName, CFSTR("SUDownloadClientNameKey"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDescriptor:", self->_descriptor);
  objc_msgSend(v4, "setAutoDownload:", self->_autoDownload);
  objc_msgSend(v4, "setDownloadOnly:", self->_downloadOnly);
  objc_msgSend(v4, "setUserUpdateTonight:", self->_userUpdateTonight);
  objc_msgSend(v4, "setAllowUnrestrictedCellularDownload:", self->_allowUnrestrictedCellularDownload);
  objc_msgSend(v4, "setActiveDownloadPolicyType:", self->_activeDownloadPolicyType);
  objc_msgSend(v4, "setDownloadFeeAgreementStatus:", self->_downloadFeeAgreementStatus);
  objc_msgSend(v4, "setTermsAndConditionsAgreementStatus:", self->_termsAndConditionsAgreementStatus);
  v5 = (void *)-[SUDescriptor copy](self->_descriptor, "copy");
  objc_msgSend(v4, "setDownloadDescriptor:", v5);

  objc_msgSend(v4, "setClientName:", self->_clientName);
  return v4;
}

- (id)description
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  void *v20;
  void *v21;

  v21 = (void *)MEMORY[0x24BDD17C8];
  -[SUDownloadOptions clientName](self, "clientName");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = CFSTR("YES");
  if (-[SUDownloadOptions isDownloadOnly](self, "isDownloadOnly"))
    v4 = CFSTR("YES");
  else
    v4 = CFSTR("NO");
  v19 = v4;
  if (-[SUDownloadOptions isAutoDownload](self, "isAutoDownload"))
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  v18 = v5;
  if (-[SUDownloadOptions userUpdateTonight](self, "userUpdateTonight"))
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  v17 = v6;
  if (-[SUDownloadOptions allowsUnrestrictedCellularDownload](self, "allowsUnrestrictedCellularDownload"))
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  SUStringFromAgreementStatus(-[SUDownloadOptions downloadFeeAgreementStatus](self, "downloadFeeAgreementStatus"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SUStringFromAgreementStatus(-[SUDownloadOptions termsAndConditionsAgreementStatus](self, "termsAndConditionsAgreementStatus"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  SUStringFromDownloadPolicyType(-[SUDownloadOptions activeDownloadPolicyType](self, "activeDownloadPolicyType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SUDownloadOptions isEnabledForCellular](self, "isEnabledForCellular"))
    v11 = CFSTR("YES");
  else
    v11 = CFSTR("NO");
  if (-[SUDownloadOptions isEnabledForWifi](self, "isEnabledForWifi"))
    v12 = CFSTR("YES");
  else
    v12 = CFSTR("NO");
  if (-[SUDownloadOptions isEnabledOnBatteryPower](self, "isEnabledOnBatteryPower"))
    v13 = CFSTR("YES");
  else
    v13 = CFSTR("NO");
  if (!-[SUDownloadOptions isEnabledForCellularRoaming](self, "isEnabledForCellularRoaming"))
    v3 = CFSTR("NO");
  -[SUDownloadOptions descriptor](self, "descriptor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringWithFormat:", CFSTR("\n            ClientName: %@\n            downloadOnly: %@\n            autoDownoad: %@\n            userUpdateTonight: %@\n            allowUnrestrictedCellularDownload: %@\n            downloadFeeAgreementStatus: %@\n            termsAndConditionsAgreementStatus: %@\n            activeDownloadPolicyType: %@\n            enabledForCellular: %@\n            enabledForWifi: %@\n            enabledOnBatteryPower: %@\n            enabledForCellularRoaming: %@\n            descriptor: %@\n"), v20, v19, v18, v17, v7, v8, v9, v10, v11, v12, v13, v3, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (BOOL)isDownloadOnly
{
  return self->_downloadOnly;
}

- (void)setDownloadOnly:(BOOL)a3
{
  self->_downloadOnly = a3;
}

- (BOOL)isAutoDownload
{
  return self->_autoDownload;
}

- (void)setAutoDownload:(BOOL)a3
{
  self->_autoDownload = a3;
}

- (BOOL)userUpdateTonight
{
  return self->_userUpdateTonight;
}

- (void)setUserUpdateTonight:(BOOL)a3
{
  self->_userUpdateTonight = a3;
}

- (BOOL)allowUnrestrictedCellularDownload
{
  return self->_allowUnrestrictedCellularDownload;
}

- (int)downloadFeeAgreementStatus
{
  return self->_downloadFeeAgreementStatus;
}

- (int)termsAndConditionsAgreementStatus
{
  return self->_termsAndConditionsAgreementStatus;
}

- (void)setTermsAndConditionsAgreementStatus:(int)a3
{
  self->_termsAndConditionsAgreementStatus = a3;
}

- (SUDescriptor)descriptor
{
  return self->_descriptor;
}

- (NSString)clientName
{
  return self->_clientName;
}

- (void)setClientName:(id)a3
{
  objc_storeStrong((id *)&self->_clientName, a3);
}

- (SUDescriptor)downloadDescriptor
{
  return self->_downloadDescriptor;
}

- (void)setDownloadDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_downloadDescriptor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadDescriptor, 0);
  objc_storeStrong((id *)&self->_clientName, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
}

@end
