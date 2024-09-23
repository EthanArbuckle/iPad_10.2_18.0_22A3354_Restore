@implementation SUDefaultDownloadPolicy

- (SUDefaultDownloadPolicy)initWithDescriptor:(id)a3
{
  id v4;
  SUDefaultDownloadPolicy *v5;
  SUDefaultDownloadPolicy *v6;
  void *v7;
  _BOOL4 v8;
  SUCarrierDownloadPolicyProperties *v9;
  SUCarrierDownloadPolicyProperties *carrierPolicy;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SUDefaultDownloadPolicy;
  v5 = -[SUDefaultDownloadPolicy init](&v19, sel_init);
  v6 = v5;
  if (v5)
  {
    -[SUDefaultDownloadPolicy setDescriptor:](v5, "setDescriptor:", v4);
    +[SUNetworkMonitor sharedInstance](SUNetworkMonitor, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SUDefaultDownloadPolicy setNetworkMonitor:](v6, "setNetworkMonitor:", v7);

    v8 = -[SUDefaultDownloadPolicy _isCellularCapable](v6, "_isCellularCapable");
    v6->_cellularCapable = v8;
    v6->_cellularFeeAgreementStatus = 0;
    if (v8)
    {
      v9 = objc_alloc_init(SUCarrierDownloadPolicyProperties);
      carrierPolicy = v6->_carrierPolicy;
      v6->_carrierPolicy = v9;

      SULogInfo(CFSTR("Carrier SU download policy: %@"), v11, v12, v13, v14, v15, v16, v17, (uint64_t)v6->_carrierPolicy);
    }
  }

  return v6;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x24BDD17C8];
  SUStringFromDownloadPolicyType(+[SUDownloadPolicyFactory downloadPolicyTypeForClass:](SUDownloadPolicyFactory, "downloadPolicyTypeForClass:", self));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUDefaultDownloadPolicy _stringForBool:](self, "_stringForBool:", -[SUDefaultDownloadPolicy isDownloadable](self, "isDownloadable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUDefaultDownloadPolicy _stringForBool:](self, "_stringForBool:", -[SUDefaultDownloadPolicy isDownloadFreeForCellular](self, "isDownloadFreeForCellular"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUDefaultDownloadPolicy _stringForBool:](self, "_stringForBool:", -[SUDefaultDownloadPolicy isDownloadAllowableForCellular](self, "isDownloadAllowableForCellular"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUDefaultDownloadPolicy _stringForBool:](self, "_stringForBool:", -[SUDefaultDownloadPolicy isDownloadAllowableForCellular2G](self, "isDownloadAllowableForCellular2G"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUDefaultDownloadPolicy _stringForBool:](self, "_stringForBool:", -[SUDefaultDownloadPolicy isDownloadAllowableForCellularRoaming](self, "isDownloadAllowableForCellularRoaming"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUDefaultDownloadPolicy _stringForBool:](self, "_stringForBool:", -[SUDefaultDownloadPolicy isDownloadAllowableForWiFi](self, "isDownloadAllowableForWiFi"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@>\n            \tisDownloadable: %@\n            \tCellularDownloadFree: %@\n            \tCellularDownloadAllowable: %@\n            \tCellularDownloadAllowableOver2G: %@\n            \tCellularDownloadAllowableWhileRoaming: %@\n            \tWiFiDownloadAllowable: %@"), v4, v5, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (id)_stringForBool:(BOOL)a3
{
  if (a3)
    return CFSTR("Yes");
  else
    return CFSTR("No");
}

- (BOOL)_isCellularCapable
{
  _BOOL4 v2;

  v2 = +[SUUtility hasCellularRadio](SUUtility, "hasCellularRadio");
  if (v2)
    LOBYTE(v2) = +[SUUtility isCellularDataCapable](SUUtility, "isCellularDataCapable");
  return v2;
}

- (BOOL)isSamePolicy:(id)a3
{
  id v4;
  int v5;

  if (!a3)
    return 0;
  v4 = a3;
  LODWORD(self) = +[SUDownloadPolicyFactory downloadPolicyTypeForClass:](SUDownloadPolicyFactory, "downloadPolicyTypeForClass:", self);
  v5 = +[SUDownloadPolicyFactory downloadPolicyTypeForClass:](SUDownloadPolicyFactory, "downloadPolicyTypeForClass:", v4);

  return (_DWORD)self == v5;
}

- (id)createSpaceOptions
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  SUSpacePurgeOptions *v10;
  uint64_t v12;

  -[SUDefaultDownloadPolicy descriptor](self, "descriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = objc_alloc_init(SUSpacePurgeOptions);
    -[SUSpacePurgeOptions setNeededBytes:](v10, "setNeededBytes:", +[SUUtility totalDiskSpaceForUpdate:](SUUtility, "totalDiskSpaceForUpdate:", v9));
    -[SUSpacePurgeOptions setEnableCacheDelete:](v10, "setEnableCacheDelete:", 1);
    -[SUSpacePurgeOptions setEnableAppOffload:](v10, "setEnableAppOffload:", 1);
    -[SUSpacePurgeOptions setCacheDeleteUrgency:](v10, "setCacheDeleteUrgency:", 4);
    -[SUSpacePurgeOptions setAppOffloadUrgency:](v10, "setAppOffloadUrgency:", 4);
  }
  else
  {
    SULogInfo(CFSTR("Unable to create space options for null descriptor"), v2, v3, v4, v5, v6, v7, v8, v12);
    v10 = 0;
  }

  return v10;
}

- (BOOL)hasEnoughDiskSpace
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  uint64_t v13;

  -[SUDefaultDownloadPolicy createSpaceOptions](self, "createSpaceOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    +[SUSpace hasSufficientSpaceWithOptions:error:](SUSpace, "hasSufficientSpaceWithOptions:error:", v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "hasSufficientFreeSpace");

  }
  else
  {
    SULogInfo(CFSTR("Unable to determine sufficient space with null space options"), v2, v3, v4, v5, v6, v7, v8, v13);
    v11 = 0;
  }

  return v11;
}

- (BOOL)isPowerRequired
{
  return 0;
}

- (BOOL)batteryPolicySatisfied
{
  return 1;
}

- (BOOL)isDownloadable
{
  return -[SUDefaultDownloadPolicy isDownloadAllowableForWiFi](self, "isDownloadAllowableForWiFi")
      || -[SUDefaultDownloadPolicy isDownloadAllowableForCellular](self, "isDownloadAllowableForCellular");
}

- (BOOL)isDownloadAllowableForWiFi
{
  _BOOL4 v2;

  v2 = -[SUDescriptor isDownloadable](self->_descriptor, "isDownloadable");
  if (v2)
    LOBYTE(v2) = +[SUUtility isWiFiCapable](SUUtility, "isWiFiCapable")
              || +[SUUtility isVirtualDevice](SUUtility, "isVirtualDevice");
  return v2;
}

- (BOOL)allowExpensiveNetwork
{
  return -[SUDefaultDownloadPolicy isDownloadAllowableForCellularIncludingInexpensiveHDM:](self, "isDownloadAllowableForCellularIncludingInexpensiveHDM:", 0);
}

- (BOOL)isDownloadAllowableForCellularRoaming
{
  return -[SUDefaultDownloadPolicy isDownloadAllowableForCellular](self, "isDownloadAllowableForCellular")
      || -[SUDefaultDownloadPolicy isDownloadAllowableForCellular2G](self, "isDownloadAllowableForCellular2G");
}

- (BOOL)isDownloadFreeForCellular
{
  return !self->_cellularCapable
      || -[SUCarrierDownloadPolicyProperties isDownloadFree](self->_carrierPolicy, "isDownloadFree");
}

- (BOOL)isDownloadableForCurrentNetworkConditions:(int64_t *)a3 cellularFeesApply:(BOOL *)a4
{
  return -[SUDefaultDownloadPolicy isDownloadableForCurrentNetworkConditions:cellularFeesApply:powerRequired:](self, "isDownloadableForCurrentNetworkConditions:cellularFeesApply:powerRequired:", a3, a4, 0);
}

- (BOOL)isDownloadableForCurrentNetworkConditions:(int64_t *)a3 cellularFeesApply:(BOOL *)a4 powerRequired:(BOOL *)a5
{
  void *v9;
  uint64_t v10;

  -[SUDefaultDownloadPolicy networkMonitor](self, "networkMonitor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "currentNetworkType");

  return -[SUDefaultDownloadPolicy _isDownloadableForNetworkType:error:cellularFeesApply:powerRequired:](self, "_isDownloadableForNetworkType:error:cellularFeesApply:powerRequired:", v10, a3, a4, a5);
}

- (BOOL)isDownloadAllowableForCellular
{
  return -[SUDefaultDownloadPolicy isDownloadAllowableForCellularIncludingInexpensiveHDM:](self, "isDownloadAllowableForCellularIncludingInexpensiveHDM:", -[SUCarrierDownloadPolicyProperties allowInexpensiveHDMUnlimited](self->_carrierPolicy, "allowInexpensiveHDMUnlimited"));
}

- (id)updateDiscoveryDate
{
  SUState *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(SUState);
  -[SUState updateDiscoveryDates](v3, "updateDiscoveryDates");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUDescriptor productBuildVersion](self->_descriptor, "productBuildVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)cellularDataIsEnabled
{
  return +[SUUtility cellularDataIsEnabled](SUUtility, "cellularDataIsEnabled");
}

- (BOOL)isDownloadAllowableForCellularIncludingInexpensiveHDM:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  SUCarrierDownloadPolicyProperties *carrierPolicy;
  __CFString *v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  int v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  void *v55;

  v3 = a3;
  if (!-[SUDescriptor isDownloadable](self->_descriptor, "isDownloadable")
    || !-[SUDescriptor isDownloadableOverCellular](self->_descriptor, "isDownloadableOverCellular"))
  {
    v13 = CFSTR("Cellular download not allowable due to SU asset configuration");
    goto LABEL_10;
  }
  if (!self->_cellularCapable)
  {
    v13 = CFSTR("Cellular download not allowed because device is not cellular capable");
    goto LABEL_10;
  }
  if (!-[SUDefaultDownloadPolicy cellularDataIsEnabled](self, "cellularDataIsEnabled"))
  {
    v13 = CFSTR("Cellular download not allowed because cellular data not enabled for device");
    goto LABEL_10;
  }
  carrierPolicy = self->_carrierPolicy;
  if (!carrierPolicy)
  {
    v13 = CFSTR("Cellular download not allowed because we have no carrier policy");
    goto LABEL_10;
  }
  if (!-[SUCarrierDownloadPolicyProperties isDownloadAllowable](carrierPolicy, "isDownloadAllowable"))
  {
    v13 = CFSTR("Cellular download not allowed because carrier policy prevents cellular download");
    goto LABEL_10;
  }
  if (self->_cellularFeeAgreementStatus == 2)
  {
    v13 = CFSTR("Cellular download not allowed because cellular fee agreement declined");
LABEL_10:
    SULogInfo(v13, v5, v6, v7, v8, v9, v10, v11, v54);
    return 0;
  }
  if (v3 && -[SUDefaultDownloadPolicy _inexpensiveHDM](self, "_inexpensiveHDM"))
  {
    SULogInfo(CFSTR("Network type is inexpensive HDM. SU download allowed"), v15, v16, v17, v18, v19, v20, v21, v54);
    return 1;
  }
  +[SUPreferences sharedInstance](SUPreferences, "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "disableUserWiFiOnlyPeriod");

  if (!v23)
  {
    -[SUDefaultDownloadPolicy updateDiscoveryDate](self, "updateDiscoveryDate");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = -[SUCarrierDownloadPolicyProperties numberOfDaysToWaitForCellularDownload](self->_carrierPolicy, "numberOfDaysToWaitForCellularDownload");
    v40 = v32;
    if (v31)
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      +[SUUtility addToDate:numberOfDays:](SUUtility, "addToDate:numberOfDays:", v31, v40);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "laterDate:", v42);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = objc_msgSend(v43, "isEqualToDate:", v42);

      if (v44)
      {
        +[SUUtility prettyPrintDate:](SUUtility, "prettyPrintDate:", v31);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        +[SUUtility prettyPrintDate:](SUUtility, "prettyPrintDate:", v41);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        SULogInfo(CFSTR("Cellular download not allowed because wifi-only days unmet. Discovery date: %@ Current date: %@ DaysToWait: %lu"), v46, v47, v48, v49, v50, v51, v52, (uint64_t)v45);

LABEL_26:
        return 0;
      }

    }
    else if (v32)
    {
      SULogInfo(CFSTR("Cellular download not allowed because unknown update discovery date"), v33, v34, v35, v36, v37, v38, v39, v54);
      goto LABEL_26;
    }

    goto LABEL_29;
  }
  SULogInfo(CFSTR("SUDisableUserWiFiOnlyPeriod is set; will not apply the wifi-only-period check"),
    v24,
    v25,
    v26,
    v27,
    v28,
    v29,
    v30,
    v54);
LABEL_29:
  v53 = -[SUCarrierDownloadPolicyProperties maximumDownloadSizeInBytes](self->_carrierPolicy, "maximumDownloadSizeInBytes");
  if ((v53 & 0x8000000000000000) == 0 && v53 < -[SUDescriptor downloadSize](self->_descriptor, "downloadSize"))
  {
    v13 = CFSTR("Cellular download not allowed because update is larger than carrier maximum download size");
    goto LABEL_10;
  }
  return 1;
}

- (BOOL)cellularDownloadFeesApply
{
  return !-[SUDefaultDownloadPolicy isDownloadFreeForCellular](self, "isDownloadFreeForCellular");
}

- (BOOL)isDownloadAllowableForCellular2G
{
  _BOOL4 v3;

  v3 = -[SUDefaultDownloadPolicy isDownloadAllowableForCellular](self, "isDownloadAllowableForCellular");
  if (v3)
    LOBYTE(v3) = !self->_cellularCapable
              || -[SUCarrierDownloadPolicyProperties isDownloadAllowableOver2G](self->_carrierPolicy, "isDownloadAllowableOver2G");
  return v3;
}

- (unint64_t)wifiOnlyPeriodInDays
{
  SUCarrierDownloadPolicyProperties *carrierPolicy;

  if (-[SUDescriptor updateType](self->_descriptor, "updateType") != 3 && self->_cellularCapable)
  {
    carrierPolicy = self->_carrierPolicy;
    if (carrierPolicy)
      -[SUCarrierDownloadPolicyProperties numberOfDaysToWaitForCellularDownload](carrierPolicy, "numberOfDaysToWaitForCellularDownload");
  }
  return 0;
}

- (BOOL)_isDownloadableForNetworkType:(int)a3 error:(int64_t *)a4 cellularFeesApply:(BOOL *)a5 powerRequired:(BOOL *)a6
{
  BOOL v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  int v24;
  void *v25;
  int v26;
  _BOOL4 v27;
  _BOOL4 v28;
  _BOOL4 v29;
  _BOOL4 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  uint64_t v39;
  void *v40;
  _BOOL4 v41;
  char v42;
  int v44;
  int v45;
  int v46;
  _QWORD v47[4];
  id v48;
  int64_t *v49;
  BOOL v50;
  BOOL v51;
  BOOL v52;
  _QWORD v53[4];
  BOOL v54;

  if (!a4)
  {
    if (!-[SUDefaultDownloadPolicy isDownloadable](self, "isDownloadable"))
      return 0;
LABEL_5:
    if (a5)
      *a5 = -[SUDefaultDownloadPolicy cellularDownloadFeesApply](self, "cellularDownloadFeesApply");
    v11 = -[SUDefaultDownloadPolicy batteryPolicySatisfied](self, "batteryPolicySatisfied");
    if (a6)
      *a6 = !v11;
    if (!-[SUDefaultDownloadPolicy hasEnoughDiskSpace](self, "hasEnoughDiskSpace"))
    {
      if (a4)
      {
        v11 = 0;
        v12 = 6;
        goto LABEL_16;
      }
      return 0;
    }
    if (!-[SUDefaultDownloadPolicy allowExpensiveNetwork](self, "allowExpensiveNetwork")
      && -[SUNetworkMonitor isCurrentNetworkTypeExpensive](self->_networkMonitor, "isCurrentNetworkTypeExpensive"))
    {
      SULogInfo(CFSTR("%s preventing download on expensive network"), v13, v14, v15, v16, v17, v18, v19, (uint64_t)"-[SUDefaultDownloadPolicy _isDownloadableForNetworkType:error:cellularFeesApply:powerRequired:]");
      if (a4)
      {
        v11 = 0;
        v12 = 83;
        goto LABEL_16;
      }
      return 0;
    }
    -[SUDefaultDownloadPolicy networkMonitor](self, "networkMonitor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v20, "isBootstrap");

    -[SUDefaultDownloadPolicy networkMonitor](self, "networkMonitor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = a3;
    v22 = objc_msgSend(v21, "isPathSatisfied");

    -[SUDefaultDownloadPolicy networkMonitor](self, "networkMonitor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "isCellularRoaming");

    -[SUDefaultDownloadPolicy networkMonitor](self, "networkMonitor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "isCellularDataRoamingEnabled");

    v27 = -[SUDefaultDownloadPolicy isDownloadAllowableForCellularRoaming](self, "isDownloadAllowableForCellularRoaming");
    v28 = -[SUDefaultDownloadPolicy isDownloadAllowableForCellular](self, "isDownloadAllowableForCellular");
    v29 = -[SUDefaultDownloadPolicy isDownloadAllowableForCellular2G](self, "isDownloadAllowableForCellular2G");
    v30 = -[SUDefaultDownloadPolicy isDownloadAllowableForWiFi](self, "isDownloadAllowableForWiFi");
    v44 = v24;
    SULogInfo(CFSTR("%s networkType:%d, powerRequired:%d, isBootstrap:%d, isPathSatisfied:%d, isRoaming:%d, isRoamingDataEnabled:%d, isRoamingDataAllowed:%d, allowedOverCellular:%d, allowedOverCellular2G:%d, allowedOverWiFi:%d"), v31, v32, v33, v34, v35, v36, v37, (uint64_t)"-[SUDefaultDownloadPolicy _isDownloadableForNetworkType:error:cellularFeesApply:powerRequired:]");
    v53[0] = MEMORY[0x24BDAC760];
    v53[1] = 3221225472;
    v53[2] = __95__SUDefaultDownloadPolicy__isDownloadableForNetworkType_error_cellularFeesApply_powerRequired___block_invoke;
    v53[3] = &__block_descriptor_33_e11_q24__0q8q16l;
    v54 = v27;
    v47[0] = MEMORY[0x24BDAC760];
    v47[1] = 3221225472;
    v47[2] = __95__SUDefaultDownloadPolicy__isDownloadableForNetworkType_error_cellularFeesApply_powerRequired___block_invoke_2;
    v47[3] = &unk_24CE3E170;
    v50 = v28;
    v51 = v29;
    v52 = v30;
    v48 = (id)MEMORY[0x212BF6094](v53);
    v49 = a4;
    v38 = v48;
    v39 = MEMORY[0x212BF6094](v47);
    v40 = (void *)v39;
    if ((v45 - 2) >= 8)
    {
      if (v45 != 1)
      {
        if (v45)
          goto LABEL_38;
        goto LABEL_37;
      }
      if (!v30)
      {
LABEL_37:
        (*(void (**)(uint64_t))(v39 + 16))(v39);
LABEL_38:
        v11 = 0;
LABEL_39:

        return v11;
      }
    }
    else
    {
      if (!v28 || v44 && (v26 & v27) == 0)
        goto LABEL_37;
      v41 = v45 != 2 || v29;
      if (!v41 || !(v46 ^ 1 | v22))
        goto LABEL_37;
    }
    if (a4)
      v42 = v11;
    else
      v42 = 1;
    if ((v42 & 1) == 0)
    {
      v11 = 0;
      *a4 = 24;
    }
    goto LABEL_39;
  }
  *a4 = 0;
  if (-[SUDefaultDownloadPolicy isDownloadable](self, "isDownloadable"))
    goto LABEL_5;
  v11 = 0;
  v12 = 31;
LABEL_16:
  *a4 = v12;
  return v11;
}

uint64_t __95__SUDefaultDownloadPolicy__isDownloadableForNetworkType_error_cellularFeesApply_powerRequired___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(_BYTE *)(a1 + 32))
    return a2;
  else
    return a3;
}

uint64_t __95__SUDefaultDownloadPolicy__isDownloadableForNetworkType_error_cellularFeesApply_powerRequired___block_invoke_2(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);
  uint64_t *v4;
  uint64_t v5;

  v1 = result;
  if (*(_BYTE *)(result + 48))
  {
    v2 = *(_QWORD *)(result + 40);
    if (*(_BYTE *)(result + 49))
    {
      if (!v2)
        return result;
      v3 = *(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16);
    }
    else
    {
      if (!v2)
        return result;
      v3 = *(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16);
    }
    result = v3();
    **(_QWORD **)(v1 + 40) = result;
  }
  else
  {
    v4 = *(uint64_t **)(result + 40);
    if (v4)
    {
      v5 = 9;
      if (!*(_BYTE *)(result + 50))
        v5 = 31;
      *v4 = v5;
    }
  }
  return result;
}

- (BOOL)_inexpensiveHDM
{
  unsigned int v3;
  BOOL v4;
  BOOL v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v3 = -[SUNetworkMonitor currentCellularType](self->_networkMonitor, "currentCellularType");
  v4 = -[SUNetworkMonitor isCurrentNetworkTypeExpensive](self->_networkMonitor, "isCurrentNetworkTypeExpensive");
  v5 = v3 == 5 && !v4;
  if (!v5)
  {
    SUStringFromNetworkType(v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    SULogInfo(CFSTR("Device does not currently fall within 5G HDM policy: Network type: %@ NWPath isExpensive: %@"), v7, v8, v9, v10, v11, v12, v13, (uint64_t)v6);

  }
  return v5;
}

- (SUDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_descriptor, a3);
}

- (SUCarrierDownloadPolicyProperties)carrierPolicy
{
  return self->_carrierPolicy;
}

- (void)setCarrierPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_carrierPolicy, a3);
}

- (BOOL)isCellularCapable
{
  return self->_cellularCapable;
}

- (void)setCellularCapable:(BOOL)a3
{
  self->_cellularCapable = a3;
}

- (SUNetworkMonitor)networkMonitor
{
  return self->_networkMonitor;
}

- (void)setNetworkMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_networkMonitor, a3);
}

- (int)cellularFeeAgreementStatus
{
  return self->_cellularFeeAgreementStatus;
}

- (void)setCellularFeeAgreementStatus:(int)a3
{
  self->_cellularFeeAgreementStatus = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkMonitor, 0);
  objc_storeStrong((id *)&self->_carrierPolicy, 0);
  objc_storeStrong((id *)&self->_descriptor, 0);
}

@end
