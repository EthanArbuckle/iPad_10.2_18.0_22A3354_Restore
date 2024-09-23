@implementation TSSinglePlanTransferViewController

- (TSSinglePlanTransferViewController)initWithTransferPlan:(id)a3 isPhysical:(BOOL)a4 isIneligible:(BOOL)a5 inBuddy:(BOOL)a6 confirmCellularPlanTransfer:(BOOL)a7 showOtherOptions:(BOOL)a8
{
  uint64_t v9;

  LOBYTE(v9) = 0;
  return -[TSSinglePlanTransferViewController initWithTransferPlan:isPhysical:isIneligible:inBuddy:confirmCellularPlanTransfer:showOtherOptions:isStandaloneProximityFlow:transferBackPhoneNumber:](self, "initWithTransferPlan:isPhysical:isIneligible:inBuddy:confirmCellularPlanTransfer:showOtherOptions:isStandaloneProximityFlow:transferBackPhoneNumber:", a3, a4, a5, a6, a7, a8, v9, 0);
}

- (TSSinglePlanTransferViewController)initWithTransferPlan:(id)a3 isPhysical:(BOOL)a4 isIneligible:(BOOL)a5 inBuddy:(BOOL)a6 confirmCellularPlanTransfer:(BOOL)a7 showOtherOptions:(BOOL)a8 isStandaloneProximityFlow:(BOOL)a9 transferBackPhoneNumber:(id)a10
{
  _BOOL4 v10;
  _BOOL4 v11;
  id v14;
  id v15;
  unint64_t v16;
  void *v17;
  CTRemotePlan *v18;
  CTRemotePlan *planItem;
  void *v20;
  NSString *v21;
  NSString *deviceName;
  void *v23;
  NSString *v24;
  NSString *phoneNumber;
  void *v26;
  NSString *v27;
  NSString *v28;
  unint64_t planType;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  TSSinglePlanTransferViewController *v34;
  TSSinglePlanTransferViewController *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  objc_super v44;

  v10 = a5;
  v11 = a4;
  v14 = a3;
  v15 = a10;
  v16 = !v11;
  if (v10)
    v16 = 4;
  self->_planType = v16;
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("planItem"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "plan");
  v18 = (CTRemotePlan *)objc_claimAutoreleasedReturnValue();
  planItem = self->_planItem;
  self->_planItem = v18;

  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("deviceInfo"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "deviceName");
  v21 = (NSString *)objc_claimAutoreleasedReturnValue();
  deviceName = self->_deviceName;
  self->_deviceName = v21;

  -[CTRemotePlan phoneNumber](self->_planItem, "phoneNumber");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[TSUtilities formattedPhoneNumber:withCountryCode:](TSUtilities, "formattedPhoneNumber:withCountryCode:", v23, 0);
  v24 = (NSString *)objc_claimAutoreleasedReturnValue();
  phoneNumber = self->_phoneNumber;
  self->_phoneNumber = v24;

  if (!self->_phoneNumber)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("PHONE_NUMBER"), &stru_24DEF4290, CFSTR("Localizable"));
    v27 = (NSString *)objc_claimAutoreleasedReturnValue();
    v28 = self->_phoneNumber;
    self->_phoneNumber = v27;

  }
  planType = self->_planType;
  -[CTRemotePlan transferAttributes](self->_planItem, "transferAttributes");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  +[TSSinglePlanTransferViewController getTitleAndDetailsForPlanType:transferCapability:](TSSinglePlanTransferViewController, "getTitleAndDetailsForPlanType:transferCapability:", planType, objc_msgSend(v30, "transferCapability"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("title"));
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "objectForKeyedSubscript:", CFSTR("details"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v44.receiver = self;
  v44.super_class = (Class)TSSinglePlanTransferViewController;
  v34 = -[OBTableWelcomeController initWithTitle:detailText:symbolName:adoptTableViewScrollView:](&v44, sel_initWithTitle_detailText_symbolName_adoptTableViewScrollView_, v32, v33, CFSTR("antenna.radiowaves.left.and.right"), 1);
  v35 = v34;
  if (v34)
  {
    objc_storeStrong((id *)&v34->_transferPlan, a3);
    v35->_inBuddy = a6;
    v35->_confirmCellularPlanTransfer = a7;
    v35->_showOtherOptions = a8;
    v35->_isStandaloneProximityFlow = a9;
    v35->_backToSelfOption = 0;
    -[CTRemotePlan transferAttributes](v35->_planItem, "transferAttributes");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v35->_followDirections = objc_msgSend(v36, "isSecuredFlow") | a7;

    v35->_speedBumper = v15 == 0;
    objc_storeStrong((id *)&v35->_transferBackPhoneNumber, a10);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addObserver:selector:name:object:", v35, sel__transferConsentOnSource, CFSTR("transfer.consent.on.source"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addObserver:selector:name:object:", v35, sel__cancelTransferringPlan, CFSTR("ss.user.canceled"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "addObserver:selector:name:object:", v35, sel__userDisagreedTermsAndConditions, CFSTR("user.disagreed.terms.and.conditions"), 0);

  }
  return v35;
}

- (TSSinglePlanTransferViewController)initWithPendingInstallPlan:(id)a3
{
  id v5;
  void *v6;
  NSString *v7;
  NSString *phoneNumber;
  void *v9;
  NSString *v10;
  NSString *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  TSSinglePlanTransferViewController *v26;
  TSSinglePlanTransferViewController *v27;
  objc_super v29;

  v5 = a3;
  self->_planType = 2;
  -[CTRemotePlan phoneNumber](self->_planItem, "phoneNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[TSUtilities formattedPhoneNumber:withCountryCode:](TSUtilities, "formattedPhoneNumber:withCountryCode:", v6, 0);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  phoneNumber = self->_phoneNumber;
  self->_phoneNumber = v7;

  self->_showOtherOptions = 1;
  if (!self->_phoneNumber)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("PHONE_NUMBER"), &stru_24DEF4290, CFSTR("Localizable"));
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    v11 = self->_phoneNumber;
    self->_phoneNumber = v10;

  }
  v12 = +[TSUtilities inBuddy](TSUtilities, "inBuddy");
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v12)
  {
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("SETTING_UP_CELLULAR"), &stru_24DEF4290, CFSTR("Localizable"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "carrierName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "length"))
    {
      v17 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      v20 = CFSTR("SINGLE_ALS_INBUDDY_DETAIL_%@");
LABEL_8:
      objc_msgSend(v18, "localizedStringForKey:value:table:", v20, &stru_24DEF4290, CFSTR("Localizable"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "carrierName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "stringWithFormat:", v21, v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_12;
    }
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v24;
    v25 = CFSTR("SINGLE_ALS_INBUDDY_DETAIL_NO_CARRIER");
  }
  else
  {
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("SET_UP_ESIM"), &stru_24DEF4290, CFSTR("Localizable"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "carrierName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "length"))
    {
      v17 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      v20 = CFSTR("SINGLE_ALS_DETAIL_%@");
      goto LABEL_8;
    }
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v24;
    v25 = CFSTR("SINGLE_ALS_DETAIL_NO_CARRIER");
  }
  objc_msgSend(v24, "localizedStringForKey:value:table:", v25, &stru_24DEF4290, CFSTR("Localizable"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  v29.receiver = self;
  v29.super_class = (Class)TSSinglePlanTransferViewController;
  v26 = -[OBTableWelcomeController initWithTitle:detailText:symbolName:](&v29, sel_initWithTitle_detailText_symbolName_, v15, v23, CFSTR("antenna.radiowaves.left.and.right"));
  v27 = v26;
  if (v26)
  {
    objc_storeStrong((id *)&v26->_pendingInstallPlan, a3);
    v27->_backToSelfOption = 0;
  }

  return v27;
}

- (TSSinglePlanTransferViewController)initWithCrossPlatformTransferPlan:(id)a3
{
  id v5;
  void *v6;
  NSString *v7;
  NSString *phoneNumber;
  void *v9;
  NSString *v10;
  NSString *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  TSSinglePlanTransferViewController *v22;
  TSSinglePlanTransferViewController *v23;
  objc_super v25;

  v5 = a3;
  self->_planType = 5;
  -[CTRemotePlan phoneNumber](self->_planItem, "phoneNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[TSUtilities formattedPhoneNumber:withCountryCode:](TSUtilities, "formattedPhoneNumber:withCountryCode:", v6, 0);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  phoneNumber = self->_phoneNumber;
  self->_phoneNumber = v7;

  if (!self->_phoneNumber)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("PHONE_NUMBER"), &stru_24DEF4290, CFSTR("Localizable"));
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();
    v11 = self->_phoneNumber;
    self->_phoneNumber = v10;

  }
  self->_showOtherOptions = 1;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("SINGLE_ESIM_TRANSFER_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = +[TSUtilities isPad](TSUtilities, "isPad");
  v15 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v14)
  {
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("SINGLE_ESIM_CROSSPLATFORM_TRANSFER_DETAIL_NO_NUMBER_%@"), &stru_24DEF4290, CFSTR("Localizable"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "carrierName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("SINGLE_ESIM_CROSSPLATFORM_TRANSFER_DETAIL_%@_%@"), &stru_24DEF4290, CFSTR("Localizable"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "phoneNumber");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "carrierName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", v18, v19, v21);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v25.receiver = self;
  v25.super_class = (Class)TSSinglePlanTransferViewController;
  v22 = -[OBTableWelcomeController initWithTitle:detailText:symbolName:](&v25, sel_initWithTitle_detailText_symbolName_, v13, v20, CFSTR("antenna.radiowaves.left.and.right"));
  v23 = v22;
  if (v22)
    objc_storeStrong((id *)&v22->_crossPlatformTransferPlan, a3);

  return v23;
}

- (TSSinglePlanTransferViewController)initWithLocalPhysical:(id)a3 carrierName:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  TSSinglePlanTransferViewController *v15;
  TSSinglePlanTransferViewController *v16;
  uint64_t v17;
  NSString *phoneNumber;
  void *v19;
  uint64_t v20;
  NSString *v21;
  void *v22;
  TSSinglePlanTransferViewController *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  objc_super v33;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDD1488];
  v8 = a4;
  objc_msgSend(v7, "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("CONVERT_TO_ESIM"), &stru_24DEF4290, CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("ON_DEVICE_PHYSICAL_TRANSFER_DETAIL_%@_%@"), &stru_24DEF4290, CFSTR("Localizable"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", v13, v8, v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v33.receiver = self;
  v33.super_class = (Class)TSSinglePlanTransferViewController;
  v15 = -[OBTableWelcomeController initWithTitle:detailText:symbolName:](&v33, sel_initWithTitle_detailText_symbolName_, v10, &stru_24DEF4290, CFSTR("antenna.radiowaves.left.and.right"));
  v16 = v15;
  if (v15)
  {
    v15->_planType = 3;
    +[TSUtilities formattedPhoneNumber:withCountryCode:](TSUtilities, "formattedPhoneNumber:withCountryCode:", v6, 0);
    v17 = objc_claimAutoreleasedReturnValue();
    phoneNumber = v16->_phoneNumber;
    v16->_phoneNumber = (NSString *)v17;

    if (!v16->_phoneNumber)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("PHONE_NUMBER"), &stru_24DEF4290, CFSTR("Localizable"));
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = v16->_phoneNumber;
      v16->_phoneNumber = (NSString *)v20;

    }
    -[TSSinglePlanTransferViewController headerView](v16, "headerView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addDetailLabel:withPhoneNumber:", v14, v16->_phoneNumber);

    v16->_followDirections = 0;
    v16->_speedBumper = 1;
    v16->_backToSelfOption = 0;
    v23 = v16;
  }
  else
  {
    _TSLogDomain();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[TSSinglePlanTransferViewController initWithLocalPhysical:carrierName:].cold.1(v24, v25, v26, v27, v28, v29, v30, v31);

  }
  return v16;
}

+ (id)getTitleAndDetailsForPlanType:(unint64_t)a3 transferCapability:(unint64_t)a4
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  void *v18;
  void *v20;
  void *v21;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  void *v30;
  _QWORD v31[2];
  _QWORD v32[3];

  v32[2] = *MEMORY[0x24BDAC8D0];
  switch(a3)
  {
    case 0uLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("SET_UP_ESIM"), &stru_24DEF4290, CFSTR("Localizable"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      v17 = CFSTR("PHYSICAL_TRANSFER_DETAIL");
      goto LABEL_11;
    case 1uLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("SINGLE_ESIM_TRANSFER_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      v17 = CFSTR("SINGLE_ESIM_TRANSFER_DETAIL");
LABEL_11:
      objc_msgSend(v15, "localizedStringForKey:value:table:", v17, &stru_24DEF4290, CFSTR("Localizable"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_12;
    case 2uLL:
    case 3uLL:
      _TSLogDomain();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        +[TSSinglePlanTransferViewController getTitleAndDetailsForPlanType:transferCapability:].cold.1(v4, v5, v6, v7, v8, v9, v10, v11);

      goto LABEL_5;
    case 4uLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("TRANSFER_INELIGIBLE_PLAN"), &stru_24DEF4290, CFSTR("Localizable"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      switch(a4)
      {
        case 0uLL:
        case 2uLL:
        case 3uLL:
        case 4uLL:
        case 5uLL:
        case 6uLL:
        case 7uLL:
        case 8uLL:
        case 0xAuLL:
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          v17 = CFSTR("SINGLE_INELIGIBLE_ESIM_TRANSFER_UNKNOWN");
          goto LABEL_11;
        case 1uLL:
        case 0xCuLL:
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          v17 = CFSTR("SINGLE_INELIGIBLE_ESIM_TRANSFER_NOT_SUPPORTED_DETAIL");
          goto LABEL_11;
        case 9uLL:
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          v17 = CFSTR("SINGLE_INELIGIBLE_ESIM_TRANSFER_CAPABILITY_INELIGIBLE_DETAIL");
          goto LABEL_11;
        case 0xBuLL:
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          v17 = CFSTR("SINGLE_INELIGIBLE_ESIM_TRANSFER_CAPABILITY_INELIGIBLE_DETAIL_ACTIVATION_POLICY_MISMATCH_CARRIER_UNLOCK");
          goto LABEL_11;
        case 0xDuLL:
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("TRANSFER_UPDATE_REQUIRED_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
          v24 = objc_claimAutoreleasedReturnValue();

          v25 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v26;
          v28 = CFSTR("TRANSFER_TARGET_UPDATE_REQUIRED_DETAIL");
          goto LABEL_19;
        case 0xEuLL:
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("TRANSFER_UPDATE_REQUIRED_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
          v24 = objc_claimAutoreleasedReturnValue();

          v25 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = v26;
          v28 = CFSTR("TRANSFER_SOURCE_UPDATE_REQUIRED_DETAIL");
LABEL_19:
          objc_msgSend(v26, "localizedStringForKey:value:table:", v28, &stru_24DEF4290, CFSTR("Localizable"));
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "stringWithFormat:", v30);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          v13 = (void *)v24;
          break;
        default:
          v12 = 0;
          break;
      }
      goto LABEL_12;
    default:
LABEL_5:
      v12 = 0;
      v13 = 0;
LABEL_12:
      v31[0] = CFSTR("title");
      v31[1] = CFSTR("details");
      v32[0] = v13;
      v32[1] = v12;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, v31, 2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      return v21;
  }
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSLayoutConstraint *v22;
  NSLayoutConstraint *tableHeightAnchor;
  SSOBBoldTrayButton *v24;
  SSOBBoldTrayButton *continueButton;
  unint64_t planType;
  SSOBBoldTrayButton *v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  objc_super v37;

  v37.receiver = self;
  v37.super_class = (Class)TSSinglePlanTransferViewController;
  -[TSOBTableWelcomeController viewDidLoad](&v37, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__updateTrayButtonText_, CFSTR("esim.install.state.changed"), 0);

  self->_inBuddy = +[TSUtilities inBuddy](TSUtilities, "inBuddy");
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSSinglePlanTransferViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v4);

  if (+[TSUtilities inBuddy](TSUtilities, "inBuddy") && self->_planType == 2 && self->_pendingInstallPlan)
  {
    -[TSSinglePlanTransferViewController _startPendingInstall:](self, "_startPendingInstall:");
    +[TSCoreTelephonyClientCache sharedInstance](TSCoreTelephonyClientCache, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC27B8]), "initWithInBuddy:transferablePlans:selectedTransferablePlans:alsPlans:selectedAlsPlans:odaPlans:", 1, 0, 0, 1, 1, 0);
    objc_msgSend(v7, "submitSimSetupUsage:", v8);

    goto LABEL_25;
  }
  if (self->_transferPlan)
  {
    v9 = objc_alloc(MEMORY[0x24BEBD9F0]);
    v10 = (void *)objc_msgSend(v9, "initWithFrame:style:", 2, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    -[OBTableWelcomeController setTableView:](self, "setTableView:", v10);

    -[OBTableWelcomeController tableView](self, "tableView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[OBTableWelcomeController tableView](self, "tableView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setRowHeight:", *MEMORY[0x24BEBE770]);

    -[OBTableWelcomeController tableView](self, "tableView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setEstimatedRowHeight:", 1.0);

    -[OBTableWelcomeController tableView](self, "tableView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAllowsMultipleSelection:", 0);

    -[OBTableWelcomeController tableView](self, "tableView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setScrollEnabled:", 1);

    -[OBTableWelcomeController tableView](self, "tableView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setBackgroundColor:", v17);

    -[OBTableWelcomeController tableView](self, "tableView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setDataSource:", self);

    -[OBTableWelcomeController tableView](self, "tableView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "reloadData");

    -[OBTableWelcomeController tableView](self, "tableView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "heightAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSSinglePlanTransferViewController _heightAnchorConstant](self, "_heightAnchorConstant");
    objc_msgSend(v21, "constraintEqualToConstant:");
    v22 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    tableHeightAnchor = self->_tableHeightAnchor;
    self->_tableHeightAnchor = v22;

    -[NSLayoutConstraint setActive:](self->_tableHeightAnchor, "setActive:", 1);
  }
  +[OBBoldTrayButton boldButton](SSOBBoldTrayButton, "boldButton");
  v24 = (SSOBBoldTrayButton *)objc_claimAutoreleasedReturnValue();
  continueButton = self->_continueButton;
  self->_continueButton = v24;

  -[SSOBBoldTrayButton addTarget:action:forControlEvents:](self->_continueButton, "addTarget:action:forControlEvents:", self, sel__continueButtonTapped, 64);
  planType = self->_planType;
  switch(planType)
  {
    case 5uLL:
      v27 = self->_continueButton;
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28;
      v30 = CFSTR("CONTINUE");
      goto LABEL_13;
    case 3uLL:
      v27 = self->_continueButton;
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28;
      v30 = CFSTR("PHYSICAL_TRANSFER_CONTINUE");
      goto LABEL_13;
    case 2uLL:
      v27 = self->_continueButton;
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v28;
      v30 = CFSTR("SET_UP_ESIM");
LABEL_13:
      objc_msgSend(v28, "localizedStringForKey:value:table:", v30, &stru_24DEF4290, CFSTR("Localizable"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSOBBoldTrayButton setTitle:forState:](v27, "setTitle:forState:", v31, 0);

      planType = self->_planType;
      break;
  }
  if (planType > 5
    || ((1 << planType) & 0x2C) == 0
    || (-[TSSinglePlanTransferViewController buttonTray](self, "buttonTray"),
        v32 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v32, "addButton:", self->_continueButton),
        v32,
        self->_planType != 3))
  {
    if (!self->_transferBackPhoneNumber
      && !+[TSUtilities inBuddy](TSUtilities, "inBuddy")
      && self->_showOtherOptions)
    {
      objc_msgSend(MEMORY[0x24BE6E418], "linkButton");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "addTarget:action:forControlEvents:", self, sel__otherButtonTapped, 64);
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("OTHER_OPTIONS"), &stru_24DEF4290, CFSTR("Localizable"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setTitle:forState:", v35, 0);

      -[TSSinglePlanTransferViewController buttonTray](self, "buttonTray");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "addButton:", v33);

    }
  }
  if (+[TSUtilities inBuddy](TSUtilities, "inBuddy"))
  {
    if (!self->_isStandaloneProximityFlow)
      return;
    -[OBBaseWelcomeController navigationItem](self, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidesBackButton:", 1);
  }
  else
  {
    -[TSSinglePlanTransferViewController delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDefaultNavigationItems:", self);
  }
LABEL_25:

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSSinglePlanTransferViewController;
  -[OBBaseWelcomeController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  self->_isOtherButtonTapped = 0;
  self->_requireDelayBluetoothConnection = 0;
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSSinglePlanTransferViewController;
  -[TSSinglePlanTransferViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  if (-[TSSinglePlanTransferViewController showSIMSetup](self, "showSIMSetup"))
  {
    -[TSSinglePlanTransferViewController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "receivedResponse");

  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (+[TSUtilities inBuddy](TSUtilities, "inBuddy", a3))
    return 2;
  else
    return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)getRemoteDeviceDisplayName:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a3;
  objc_msgSend(v3, "modelName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4 || !objc_msgSend(v4, "length"))
  {
    objc_msgSend(v3, "deviceName");
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  void *v6;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  NSString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  NSDictionary *transferPlan;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSString *v45;
  NSString *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  double v51;
  CGFloat v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  id v58;
  void *v59;
  NSString *v61;
  NSString *deviceName;
  void *v63;
  void *v64;
  CGSize v65;

  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("options%ld"), objc_msgSend(v7, "section"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dequeueReusableCellWithIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD9F8]), "initWithStyle:reuseIdentifier:", 3, v9);
  objc_msgSend(v10, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLayoutMargins:", 10.0, 0.0, 0.0, 0.0);

  objc_msgSend(v10, "setAccessoryType:", 1);
  objc_msgSend(MEMORY[0x24BEBD4B8], "secondarySystemBackgroundColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v12);

  objc_msgSend(v10, "textLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLineBreakMode:", 0);

  objc_msgSend(v10, "textLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setNumberOfLines:", 0);

  objc_msgSend(v10, "textLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE200]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "textLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFont:", v16);

  objc_msgSend(v10, "detailTextLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setLineBreakMode:", 0);

  objc_msgSend(v10, "detailTextLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setNumberOfLines:", 0);

  objc_msgSend(v10, "detailTextLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE220]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "detailTextLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFont:", v21);

  v23 = objc_msgSend(v7, "section");
  if (!v23)
  {
    transferPlan = self->_transferPlan;
    if (transferPlan)
    {
      -[NSDictionary objectForKeyedSubscript:](transferPlan, "objectForKeyedSubscript:", CFSTR("planItem"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary objectForKeyedSubscript:](self->_transferPlan, "objectForKeyedSubscript:", CFSTR("deviceInfo"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[TSSinglePlanTransferViewController getRemoteDeviceDisplayName:](self, "getRemoteDeviceDisplayName:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v30, "label");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = v35;
      if (+[TSUtilities isPad](TSUtilities, "isPad"))
      {
        objc_msgSend(v30, "carrierName");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v36, "length"))
        {
          objc_msgSend(v30, "carrierName");
          v25 = (NSString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "localizedStringForKey:value:table:", CFSTR("TRANSFER_PLAN_ITEM_TITLE_NO_CARRIER_NAME"), &stru_24DEF4290, CFSTR("Localizable"));
          v25 = (NSString *)objc_claimAutoreleasedReturnValue();

        }
        v31 = 0x24BEBD000uLL;

        if (objc_msgSend(v34, "length"))
        {
          v42 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("USED_ON_%@"), &stru_24DEF4290, CFSTR("Localizable"));
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "stringWithFormat:", v43, v34, deviceName);
LABEL_27:
          v27 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_33:
          objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("iphone.and.arrow.forward"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "textLabel");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "setText:", v25);

          objc_msgSend(v10, "detailTextLabel");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "setText:", v27);

          goto LABEL_34;
        }
LABEL_32:
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("TRANSFER_PLAN_ITEM_DETAIL_NO_DEVICE_NAME"), &stru_24DEF4290, CFSTR("Localizable"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_33;
      }
      if (self->_planType != 4)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("TRANSFER_PLAN_ITEM_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
        v25 = (NSString *)objc_claimAutoreleasedReturnValue();

        if (-[NSString length](self->_phoneNumber, "length"))
        {
          v38 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("TRANSFER_PLAN_ITEM_SUBTITLE_@"), &stru_24DEF4290, CFSTR("Localizable"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "stringWithFormat:", v40, self->_phoneNumber);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("TRANSFER_PLAN_ITEM_SUBTITLE_NO_PHONENUMBER"), &stru_24DEF4290, CFSTR("Localizable"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v31 = 9863680000;
        goto LABEL_33;
      }
      if (-[NSString length](self->_phoneNumber, "length"))
      {
        v25 = self->_phoneNumber;
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "localizedStringForKey:value:table:", CFSTR("TRANSFER_PLAN_ITEM_TITLE_NO_PHONENUMBER"), &stru_24DEF4290, CFSTR("Localizable"));
        v25 = (NSString *)objc_claimAutoreleasedReturnValue();

      }
      v31 = 9863680000;
      if (-[NSString length](self->_deviceName, "length") && objc_msgSend(v35, "length"))
      {
        v63 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("TRANSFER_PLAN_ITEM_DETAIL_WITH_LABEL_%@_%@"), &stru_24DEF4290, CFSTR("Localizable"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        deviceName = self->_deviceName;
        v45 = (NSString *)v64;
      }
      else
      {
        if (!-[NSString length](self->_deviceName, "length"))
        {
          if (!objc_msgSend(v35, "length"))
            goto LABEL_32;
          v46 = (NSString *)v35;
          v63 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("TRANSFER_PLAN_ITEM_DETAIL_WITH_LABEL_NO_DEVICE_NAME_%@"), &stru_24DEF4290, CFSTR("Localizable"));
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = v46;
LABEL_26:
          objc_msgSend(v63, "stringWithFormat:", v43, v61, deviceName);
          goto LABEL_27;
        }
        v63 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("TRANSFER_PLAN_ITEM_DETAIL_%@"), &stru_24DEF4290, CFSTR("Localizable"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = self->_deviceName;
      }
      v61 = v45;
      goto LABEL_26;
    }
  }
  if (!+[TSUtilities inBuddy](TSUtilities, "inBuddy"))
  {
    v27 = 0;
    v25 = 0;
    v28 = 0;
    v31 = 9863680000;
    goto LABEL_35;
  }
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("SET_UP_LATER_IN_SETTINGS"), &stru_24DEF4290, CFSTR("Localizable"));
  v25 = (NSString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("SET_UP_LATER_IN_SETTINGS_SUB"), &stru_24DEF4290, CFSTR("Localizable"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("gear"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "textLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setText:", v25);

  objc_msgSend(v10, "detailTextLabel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setText:", v27);
  v31 = 9863680000;
LABEL_34:

LABEL_35:
  objc_msgSend(*(id *)(v31 + 1208), "systemBlueColor");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "imageWithTintColor:", v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v50, "size");
  v52 = v51 * 1.5;
  objc_msgSend(v50, "size");
  v65.height = v53 * 1.5;
  v65.width = v52;
  UIGraphicsBeginImageContextWithOptions(v65, 0, 0.0);
  objc_msgSend(v50, "size");
  v55 = v54 * 1.5;
  objc_msgSend(v50, "size");
  objc_msgSend(v50, "drawInRect:", 0.0, 0.0, v55, v56 * 1.5);
  UIGraphicsGetImageFromCurrentImageContext();
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  v58 = (id)objc_msgSend(v57, "imageWithRenderingMode:", 1);
  objc_msgSend(v10, "imageView");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "setImage:", v57);

  if (self->_planType == 4)
  {
    objc_msgSend(v10, "setSelectionStyle:", 0);
    objc_msgSend(v10, "setAccessoryType:", 0);
  }

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  if (self->_planType != 4)
  {
    v7 = v5;
    if (objc_msgSend(v5, "section"))
    {
      if (objc_msgSend(v7, "section") == 1)
        -[TSSinglePlanTransferViewController _skipButtonTapped](self, "_skipButtonTapped");
    }
    else
    {
      -[TSSinglePlanTransferViewController _continueButtonTapped](self, "_continueButtonTapped");
    }
    -[OBTableWelcomeController tableView](self, "tableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);

    v5 = v7;
  }

}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return 0.100000001;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return 0.0;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v4;

  v4 = objc_alloc(MEMORY[0x24BEBDB00]);
  return (id)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
}

- (id)getLocalizedStringIf:(id)a3 then:(id)a4 otherwise:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v7 && objc_msgSend(v7, "length"))
  {
    v10 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", v8, &stru_24DEF4290, CFSTR("Localizable"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", v12, v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", v9, &stru_24DEF4290, CFSTR("Localizable"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (void)_continueButtonTapped
{
  OUTLINED_FUNCTION_0(&dword_21B647000, a2, a3, "[E]unexpected plan type %lu @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

uint64_t __59__TSSinglePlanTransferViewController__continueButtonTapped__block_invoke(uint64_t a1)
{
  _QWORD *v1;

  v1 = *(_QWORD **)(a1 + 32);
  if (v1[153] == 3)
    return objc_msgSend(v1, "_startLocalPlanConversion");
  else
    return objc_msgSend(v1, "_startPlanTransfer:", v1[154]);
}

uint64_t __59__TSSinglePlanTransferViewController__continueButtonTapped__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancelButtonTapped");
}

- (void)_cancelButtonTapped
{
  void *v3;
  void *v4;
  id v5;

  if (self->_planType != 4)
  {
    +[TSCoreTelephonyClientCache sharedInstance](TSCoreTelephonyClientCache, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC27B8]), "initWithInBuddy:transferablePlans:selectedTransferablePlans:alsPlans:selectedAlsPlans:odaPlans:", 0, self->_planType != 2, 0, self->_planType == 2, 0, 0);
    objc_msgSend(v3, "submitSimSetupUsage:", v4);

  }
  -[TSSinglePlanTransferViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userDidTapCancel");

}

- (void)_otherButtonTapped
{
  void *v3;
  void *v4;
  id v5;

  if (self->_planType != 4)
  {
    +[TSCoreTelephonyClientCache sharedInstance](TSCoreTelephonyClientCache, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC27B8]), "initWithInBuddy:transferablePlans:selectedTransferablePlans:alsPlans:selectedAlsPlans:odaPlans:", 0, self->_planType != 2, 0, self->_planType == 2, 0, 0);
    objc_msgSend(v3, "submitSimSetupUsage:", v4);

  }
  self->_isOtherButtonTapped = 1;
  -[TSSinglePlanTransferViewController delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewControllerDidComplete:", self);

}

- (void)_skipButtonTapped
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
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
  _QWORD v20[5];

  if (self->_planType == 2
    || (+[TSCoreTelephonyClientCache sharedInstance](TSCoreTelephonyClientCache, "sharedInstance"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "isEmbeddedSIMOnlyConfig"),
        v3,
        v4))
  {
    v5 = (void *)MEMORY[0x24BEBD3B0];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SKIP_SETUP_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SKIP_SETUP_MESSAGE"), &stru_24DEF4290, CFSTR("Localizable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", v7, v9, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x24BEBD3A8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("SKIP"), &stru_24DEF4290, CFSTR("Localizable"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __55__TSSinglePlanTransferViewController__skipButtonTapped__block_invoke;
    v20[3] = &unk_24DEF2F40;
    v20[4] = self;
    objc_msgSend(v11, "actionWithTitle:style:handler:", v13, 1, v20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addAction:", v14);

    v15 = (void *)MEMORY[0x24BEBD3A8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24DEF4290, CFSTR("Localizable"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "actionWithTitle:style:handler:", v17, 0, &__block_literal_global_19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addAction:", v18);

    -[TSSinglePlanTransferViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);
  }
  else
  {
    -[TSSinglePlanTransferViewController delegate](self, "delegate");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "userDidTapCancel");

  }
}

void __55__TSSinglePlanTransferViewController__skipButtonTapped__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "userDidTapCancel");

}

- (void)_startLocalPlanConversion
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("CONTINUE_BUTTON_STATE_INSTALLING"), &stru_24DEF4290, CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController _showButtonTraySpinnerWithBusyText:](self, "_showButtonTraySpinnerWithBusyText:", v4);

  +[TSCoreTelephonyClientCache sharedInstance](TSCoreTelephonyClientCache, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC27B8]), "initWithInBuddy:transferablePlans:selectedTransferablePlans:alsPlans:selectedAlsPlans:odaPlans:", 0, 1, 1, 0, 0, 0);
  objc_msgSend(v5, "submitSimSetupUsage:", v6);

  _TSLogDomain();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "-[TSSinglePlanTransferViewController _startLocalPlanConversion]";
    _os_log_impl(&dword_21B647000, v7, OS_LOG_TYPE_DEFAULT, "Start converting local 4FF @%s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  -[TSSinglePlanTransferViewController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewControllerDidComplete:", self);

  +[TSCoreTelephonyClientCache sharedInstance](TSCoreTelephonyClientCache, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __63__TSSinglePlanTransferViewController__startLocalPlanConversion__block_invoke;
  v10[3] = &unk_24DEF3188;
  objc_copyWeak(&v11, (id *)buf);
  objc_msgSend(v9, "convertPhysicalSIMToeSIMWithCompletion:", v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

void __63__TSSinglePlanTransferViewController__startLocalPlanConversion__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v3 = a2;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __63__TSSinglePlanTransferViewController__startLocalPlanConversion__block_invoke_2;
  v5[3] = &unk_24DEF2B00;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

  objc_destroyWeak(&v7);
}

void __63__TSSinglePlanTransferViewController__startLocalPlanConversion__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && *(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "postNotificationName:object:", CFSTR("transfer.failed"), *(_QWORD *)(a1 + 32));

    _TSLogDomain();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = 138412546;
      v7 = v5;
      v8 = 2080;
      v9 = "-[TSSinglePlanTransferViewController _startLocalPlanConversion]_block_invoke_2";
      _os_log_impl(&dword_21B647000, v4, OS_LOG_TYPE_DEFAULT, "%@ @%s", (uint8_t *)&v6, 0x16u);
    }

  }
}

- (void)_startPlanTransfer:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  _BOOL4 followDirections;
  void *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _TSLogDomain();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v19 = v4;
    v20 = 2080;
    v21 = "-[TSSinglePlanTransferViewController _startPlanTransfer:]";
    _os_log_impl(&dword_21B647000, v5, OS_LOG_TYPE_DEFAULT, "plan: %@ @%s", buf, 0x16u);
  }

  +[TSCoreTelephonyClientCache sharedInstance](TSCoreTelephonyClientCache, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC27B8]), "initWithInBuddy:transferablePlans:selectedTransferablePlans:alsPlans:selectedAlsPlans:odaPlans:", 0, 1, 1, 0, 0, 0);
  objc_msgSend(v6, "submitSimSetupUsage:", v7);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("planItem"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "plan");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "transferAttributes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "transferCapability") == 8;

  if (v11)
  {
    -[TSSinglePlanTransferViewController _maybeLaunchURLForCarrierDirectAuth:](self, "_maybeLaunchURLForCarrierDirectAuth:", v8);
  }
  else
  {
    objc_initWeak((id *)buf, self);
    followDirections = self->_followDirections;
    objc_msgSend(v8, "phoneNumber");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[TSUtilities formattedPhoneNumber:withCountryCode:](TSUtilities, "formattedPhoneNumber:withCountryCode:", v13, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __57__TSSinglePlanTransferViewController__startPlanTransfer___block_invoke;
    v15[3] = &unk_24DEF2E28;
    objc_copyWeak(&v17, (id *)buf);
    v15[4] = self;
    v16 = v4;
    -[TSSinglePlanTransferViewController _maybeDisplayConsent:phoneNumber:completion:](self, "_maybeDisplayConsent:phoneNumber:completion:", followDirections, v14, v15);

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }

}

void __57__TSSinglePlanTransferViewController__startPlanTransfer___block_invoke(id *a1)
{
  id *v2;
  id WeakRetained;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v2 = a1 + 6;
  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "setInstallingTransferPlan:", 1);

  objc_msgSend(a1[4], "_showButtonTraySpinnerWithBusyText:", &stru_24DEF4290);
  v4 = objc_loadWeakRetained(v2);
  objc_msgSend(v4, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "viewControllerDidComplete:", v6);

  v7 = objc_loadWeakRetained(v2);
  objc_msgSend(v7, "setBackToSelfOption:", 2);

  +[TSCoreTelephonyClientCache sharedInstance](TSCoreTelephonyClientCache, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "objectForKeyedSubscript:", CFSTR("planItem"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "plan");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "planID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "objectForKeyedSubscript:", CFSTR("deviceInfo"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "deviceID");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __57__TSSinglePlanTransferViewController__startPlanTransfer___block_invoke_2;
  v14[3] = &unk_24DEF3188;
  objc_copyWeak(&v15, v2);
  objc_msgSend(v8, "transferPlanWithIdentifier:fromDevice:completionHandler:", v11, v13, v14);

  objc_destroyWeak(&v15);
}

void __57__TSSinglePlanTransferViewController__startPlanTransfer___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  dispatch_time_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v4 = dispatch_time(0, 100000000);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __57__TSSinglePlanTransferViewController__startPlanTransfer___block_invoke_3;
  v6[3] = &unk_24DEF2A70;
  v7 = v3;
  v5 = v3;
  objc_copyWeak(&v8, (id *)(a1 + 32));
  dispatch_after(v4, MEMORY[0x24BDAC9B8], v6);
  objc_destroyWeak(&v8);

}

void __57__TSSinglePlanTransferViewController__startPlanTransfer___block_invoke_3(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "postNotificationName:object:", CFSTR("transfer.failed"), *(_QWORD *)(a1 + 32));

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setInstallingTransferPlan:", 0);

}

- (void)_cancelTransferringPlan
{
  void *v3;
  void *v4;
  CTRemotePlan *planItem;
  void *v6;
  void *v7;

  -[TSSinglePlanTransferViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelNextPane");

  self->_requireDelayBluetoothConnection = 1;
  +[TSCoreTelephonyClientCache sharedInstance](TSCoreTelephonyClientCache, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  planItem = self->_planItem;
  -[NSDictionary objectForKeyedSubscript:](self->_transferPlan, "objectForKeyedSubscript:", CFSTR("deviceInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deviceID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelTransferPlan:fromDevice:completionHandler:", planItem, v7, &__block_literal_global_190);

  -[OBWelcomeController _hideButtonTraySpinner](self, "_hideButtonTraySpinner");
}

void __61__TSSinglePlanTransferViewController__cancelTransferringPlan__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  if (v2)
  {
    _TSLogDomain();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __61__TSSinglePlanTransferViewController__cancelTransferringPlan__block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

  }
}

- (void)_startPendingInstall:(id)a3
{
  id v4;
  NSString *v5;
  NSString *carrierNameForSelectedItem;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "carrierName");
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  carrierNameForSelectedItem = self->_carrierNameForSelectedItem;
  self->_carrierNameForSelectedItem = v5;

  objc_msgSend(v4, "plan");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("CONTINUE_BUTTON_STATE_INSTALLING"), &stru_24DEF4290, CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController _showButtonTraySpinnerWithBusyText:](self, "_showButtonTraySpinnerWithBusyText:", v9);

  +[TSCoreTelephonyClientCache sharedInstance](TSCoreTelephonyClientCache, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC27B8]), "initWithInBuddy:transferablePlans:selectedTransferablePlans:alsPlans:selectedAlsPlans:odaPlans:", 0, 0, 0, 1, 1, 0);
  objc_msgSend(v10, "submitSimSetupUsage:", v11);

  _TSLogDomain();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v17 = v7;
    v18 = 2080;
    v19 = "-[TSSinglePlanTransferViewController _startPendingInstall:]";
    _os_log_impl(&dword_21B647000, v12, OS_LOG_TYPE_DEFAULT, "plan: %@ @%s", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  +[TSCoreTelephonyClientCache sharedInstance](TSCoreTelephonyClientCache, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __59__TSSinglePlanTransferViewController__startPendingInstall___block_invoke;
  v14[3] = &unk_24DEF2EA0;
  objc_copyWeak(&v15, (id *)buf);
  v14[4] = self;
  objc_msgSend(v13, "installPendingPlan:completion:", v7, v14);

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);

}

void __59__TSSinglePlanTransferViewController__startPendingInstall___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD block[4];
  id v7;
  uint64_t v8;
  id v9;

  v3 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__TSSinglePlanTransferViewController__startPendingInstall___block_invoke_2;
  block[3] = &unk_24DEF2E28;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  v4 = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v9);
}

void __59__TSSinglePlanTransferViewController__startPendingInstall___block_invoke_2(uint64_t a1)
{
  _BYTE *WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    if (*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(WeakRetained, "setShowSIMSetup:", 0);
      objc_msgSend(v4, "_showAlert:", *(_QWORD *)(a1 + 32));
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "setShowSIMSetup:", WeakRetained[1280] == 0);
      objc_msgSend(v4, "delegate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "viewControllerDidComplete:", v4);

    }
    WeakRetained = v4;
  }

}

- (void)_showAlert:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  id v21;
  id location;

  v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    v5 = (void *)MEMORY[0x24BEBD3B0];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("ERROR_GENERIC_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ERROR_TRY_AGAIN_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", v7, v9, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x24BEBD3A8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("ERROR_OK"), &stru_24DEF4290, CFSTR("Localizable"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x24BDAC760];
    v18 = 3221225472;
    v19 = __49__TSSinglePlanTransferViewController__showAlert___block_invoke;
    v20 = &unk_24DEF2A20;
    objc_copyWeak(&v21, &location);
    objc_msgSend(v11, "actionWithTitle:style:handler:", v13, 1, &v17);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addAction:", v14, v17, v18, v19, v20);

    -[TSSinglePlanTransferViewController navigationController](self, "navigationController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "visibleViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "presentViewController:animated:completion:", v10, 1, 0);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

}

void __49__TSSinglePlanTransferViewController__showAlert___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "attemptFailed");

    WeakRetained = v3;
  }

}

- (void)_maybeDisplayConsent:(BOOL)a3 phoneNumber:(id)a4 completion:(id)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void (*v17)(void);
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL4 confirmCellularPlanTransfer;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  _QWORD v35[5];
  _QWORD v36[5];

  v8 = a4;
  if (!a3)
  {
    v17 = (void (*)(void))*((_QWORD *)a5 + 2);
    v12 = a5;
    v17();
    goto LABEL_16;
  }
  v9 = (void *)MEMORY[0x24BDD1488];
  v10 = a5;
  objc_msgSend(v9, "bundleForClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("TRANSFER_TARGET_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
  v12 = (id)objc_claimAutoreleasedReturnValue();

  LODWORD(v11) = self->_confirmCellularPlanTransfer;
  v13 = +[TSUtilities isPad](TSUtilities, "isPad");
  if (!(_DWORD)v11)
  {
    if (v13)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      v16 = CFSTR("TRANSFER_REQUEST_CONFIRMATION");
      goto LABEL_8;
    }
    v21 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("TRANSFER_REQUEST_CONFIRMATION_%@"), &stru_24DEF4290, CFSTR("Localizable"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", v20, v8, v34);
LABEL_11:
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
  if (!v13)
  {
    v19 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("TRANSFER_REQUEST_CONFIRMATION_CLOUD_%@_%@"), &stru_24DEF4290, CFSTR("Localizable"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", v20, v8, v8);
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  v16 = CFSTR("TRANSFER_REQUEST_CONFIRMATION_CLOUD");
LABEL_8:
  objc_msgSend(v14, "localizedStringForKey:value:table:", v16, &stru_24DEF4290, CFSTR("Localizable"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_12:

  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", v12, v18, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  confirmCellularPlanTransfer = self->_confirmCellularPlanTransfer;
  v24 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (confirmCellularPlanTransfer)
  {
    objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24DEF4290, CFSTR("Localizable"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x24BDAC760];
    v36[1] = 3221225472;
    v36[2] = __82__TSSinglePlanTransferViewController__maybeDisplayConsent_phoneNumber_completion___block_invoke;
    v36[3] = &unk_24DEF2F40;
    v36[4] = self;
    objc_msgSend(v24, "actionWithTitle:style:handler:", v27, 1, v36);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addAction:", v28);

    v29 = (void *)MEMORY[0x24BEBD3A8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("OTHER_OPTIONS"), &stru_24DEF4290, CFSTR("Localizable"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __82__TSSinglePlanTransferViewController__maybeDisplayConsent_phoneNumber_completion___block_invoke_207;
    v35[3] = &unk_24DEF2F40;
    v35[4] = self;
    objc_msgSend(v29, "actionWithTitle:style:handler:", v30, 0, v35);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addAction:", v31);

  }
  else
  {
    objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24DEF4290, CFSTR("Localizable"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "actionWithTitle:style:handler:", v32, 0, &__block_literal_global_211);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addAction:", v33);

  }
  -[TSSinglePlanTransferViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v22, 1, v10);

LABEL_16:
}

void __82__TSSinglePlanTransferViewController__maybeDisplayConsent_phoneNumber_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  _TSLogDomain();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[TSSinglePlanTransferViewController _maybeDisplayConsent:phoneNumber:completion:]_block_invoke";
    _os_log_impl(&dword_21B647000, v2, OS_LOG_TYPE_DEFAULT, "cancel transfer. start over @%s", (uint8_t *)&v4, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_cancelTransferringPlan");
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userDidTapCancel");

}

uint64_t __82__TSSinglePlanTransferViewController__maybeDisplayConsent_phoneNumber_completion___block_invoke_207(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  _TSLogDomain();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[TSSinglePlanTransferViewController _maybeDisplayConsent:phoneNumber:completion:]_block_invoke";
    _os_log_impl(&dword_21B647000, v2, OS_LOG_TYPE_DEFAULT, "Don't have other device, maybe show intro @%s", (uint8_t *)&v4, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_cancelTransferringPlan");
  return objc_msgSend(*(id *)(a1 + 32), "_otherButtonTapped");
}

- (double)_heightAnchorConstant
{
  void *v2;
  double v3;
  double v4;

  -[TSSinglePlanTransferViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3 * 0.2;

  return v4;
}

- (void)_transferConsentOnSource
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("CONTINUE_BUTTON_STATE_INSTALLING"), &stru_24DEF4290, CFSTR("Localizable"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBWelcomeController _showButtonTraySpinnerWithBusyText:](self, "_showButtonTraySpinnerWithBusyText:", v4);

  -[TSSinglePlanTransferViewController presentedViewController](self, "presentedViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[TSSinglePlanTransferViewController presentedViewController](self, "presentedViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0);

  }
}

- (void)_userDisagreedTermsAndConditions
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (self->_inBuddy)
  {
    _TSLogDomain();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315138;
      v5 = "-[TSSinglePlanTransferViewController _userDisagreedTermsAndConditions]";
      _os_log_impl(&dword_21B647000, v3, OS_LOG_TYPE_DEFAULT, "Hide button tray! @%s", (uint8_t *)&v4, 0xCu);
    }

    -[OBWelcomeController _hideButtonTraySpinner](self, "_hideButtonTraySpinner");
  }
}

- (void)_maybeLaunchURLForCarrierDirectAuth:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  void *v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "plan");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transferAttributes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _TSLogDomain();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "iccid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 138412546;
    v20 = v7;
    v21 = 2080;
    v22 = "-[TSSinglePlanTransferViewController _maybeLaunchURLForCarrierDirectAuth:]";
    _os_log_impl(&dword_21B647000, v6, OS_LOG_TYPE_DEFAULT, "Carrier direct auth flow plan: [%@] @%s", (uint8_t *)&v19, 0x16u);

  }
  objc_msgSend(v5, "performSelector:", sel_transferEndpoint);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BEBD3C8], "sharedApplication");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "openURL:options:completionHandler:", v10, MEMORY[0x24BDBD1B8], &__block_literal_global_217);

    -[TSSinglePlanTransferViewController delegate](self, "delegate");
    v11 = objc_claimAutoreleasedReturnValue();
    -[NSObject viewControllerDidComplete:](v11, "viewControllerDidComplete:", self);
  }
  else
  {
    _TSLogDomain();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[TSSinglePlanTransferViewController _maybeLaunchURLForCarrierDirectAuth:].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);
  }

}

void __74__TSSinglePlanTransferViewController__maybeLaunchURLForCarrierDirectAuth___block_invoke(uint64_t a1, char a2)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if ((a2 & 1) == 0)
  {
    _TSLogDomain();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      __74__TSSinglePlanTransferViewController__maybeLaunchURLForCarrierDirectAuth___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  }
}

- (BOOL)customizeSpinner
{
  return self->_animating;
}

- (int64_t)backOption
{
  return self->_backToSelfOption;
}

- (BOOL)animating
{
  return self->_animating;
}

- (void)setAnimating:(BOOL)a3
{
  self->_animating = a3;
}

- (NSArray)cachedButtons
{
  return (NSArray *)objc_getProperty(self, a2, 1328, 1);
}

- (void)setCachedButtons:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1328);
}

- (SSSpinner)spinner
{
  return (SSSpinner *)objc_getProperty(self, a2, 1336, 1);
}

- (void)setSpinner:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1336);
}

- (UIView)spinnerContainer
{
  return (UIView *)objc_getProperty(self, a2, 1344, 1);
}

- (void)setSpinnerContainer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1344);
}

- (TSSIMSetupFlowDelegate)delegate
{
  return (TSSIMSetupFlowDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)carrierNameForSelectedItem
{
  return (NSString *)objc_getProperty(self, a2, 1360, 1);
}

- (void)setCarrierNameForSelectedItem:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1360);
}

- (BOOL)isOtherButtonTapped
{
  return self->_isOtherButtonTapped;
}

- (void)setIsOtherButtonTapped:(BOOL)a3
{
  self->_isOtherButtonTapped = a3;
}

- (BOOL)requireDelayBluetoothConnection
{
  return self->_requireDelayBluetoothConnection;
}

- (void)setRequireDelayBluetoothConnection:(BOOL)a3
{
  self->_requireDelayBluetoothConnection = a3;
}

- (BOOL)installingTransferPlan
{
  return self->_installingTransferPlan;
}

- (void)setInstallingTransferPlan:(BOOL)a3
{
  self->_installingTransferPlan = a3;
}

- (BOOL)showSIMSetup
{
  return self->_showSIMSetup;
}

- (void)setShowSIMSetup:(BOOL)a3
{
  self->_showSIMSetup = a3;
}

- (BOOL)crossPlatformTransferPlanSelected
{
  return self->_crossPlatformTransferPlanSelected;
}

- (void)setCrossPlatformTransferPlanSelected:(BOOL)a3
{
  self->_crossPlatformTransferPlanSelected = a3;
}

- (BOOL)isStandaloneProximityFlow
{
  return self->_isStandaloneProximityFlow;
}

- (void)setIsStandaloneProximityFlow:(BOOL)a3
{
  self->_isStandaloneProximityFlow = a3;
}

- (int64_t)backToSelfOption
{
  return self->_backToSelfOption;
}

- (void)setBackToSelfOption:(int64_t)a3
{
  self->_backToSelfOption = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carrierNameForSelectedItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_spinnerContainer, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_cachedButtons, 0);
  objc_storeStrong((id *)&self->_transferBackPhoneNumber, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_tableHeightAnchor, 0);
  objc_storeStrong((id *)&self->_planItem, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_crossPlatformTransferPlan, 0);
  objc_storeStrong((id *)&self->_pendingInstallPlan, 0);
  objc_storeStrong((id *)&self->_transferPlan, 0);
}

- (void)initWithLocalPhysical:(uint64_t)a3 carrierName:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]Self not initialized @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

+ (void)getTitleAndDetailsForPlanType:(uint64_t)a3 transferCapability:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]Wrong initializing function. @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __61__TSSinglePlanTransferViewController__cancelTransferringPlan__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21B647000, a2, a3, "[E]Failed %@ @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_maybeLaunchURLForCarrierDirectAuth:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]Carrier direct auth flow with no carrier endpoint @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __74__TSSinglePlanTransferViewController__maybeLaunchURLForCarrierDirectAuth___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]Fail to launch the direct carrier auth flow @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
