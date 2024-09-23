@implementation WFPrivacyIssue

+ (id)privateAddressDisabledByUserIssue
{
  return -[WFPrivacyIssue initWithPrivacyType:organizationName:profileName:profileUUID:]([WFPrivacyIssue alloc], "initWithPrivacyType:organizationName:profileName:profileUUID:", 8, 0, 0, 0);
}

+ (id)privateAddressDisabledBySystemIssue
{
  return -[WFPrivacyIssue initWithPrivacyType:organizationName:profileName:profileUUID:]([WFPrivacyIssue alloc], "initWithPrivacyType:organizationName:profileName:profileUUID:", 1, 0, 0, 0);
}

+ (id)privateAddressDisabledByCarrierIssueWithCarrierName:(id)a3
{
  id v3;
  WFPrivacyIssue *v4;

  v3 = a3;
  v4 = -[WFPrivacyIssue initWithPrivacyType:organizationName:profileName:profileUUID:]([WFPrivacyIssue alloc], "initWithPrivacyType:organizationName:profileName:profileUUID:", 2, v3, 0, 0);

  return v4;
}

+ (id)privateAddressDisabledByProfileIssueWithOrganizationName:(id)a3 profileName:(id)a4 profileUUID:(id)a5
{
  id v7;
  id v8;
  id v9;
  WFPrivacyIssue *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = -[WFPrivacyIssue initWithPrivacyType:organizationName:profileName:profileUUID:]([WFPrivacyIssue alloc], "initWithPrivacyType:organizationName:profileName:profileUUID:", 4, v9, v8, v7);

  return v10;
}

+ (id)carrierNetworkIssue
{
  return -[WFHealthIssue initWithType:]([WFPrivacyIssue alloc], "initWithType:", 1024);
}

+ (id)dnsFilteredNetworkIssue
{
  return -[WFHealthIssue initWithType:]([WFPrivacyIssue alloc], "initWithType:", 2048);
}

- (WFPrivacyIssue)initWithPrivacyType:(unint64_t)a3 organizationName:(id)a4 profileName:(id)a5 profileUUID:(id)a6
{
  id v9;
  id v10;
  WFPrivacyIssue *v11;
  WFPrivacyIssue *v12;
  uint64_t v13;
  NSString *issueShortTitle;
  uint64_t v15;
  NSString *issueTitle;
  uint64_t v17;
  NSString *issueDescription;
  uint64_t v19;
  NSString *issueRecommendation;
  uint64_t v21;
  NSString *typeString;
  objc_super v24;

  v9 = a4;
  v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)WFPrivacyIssue;
  v11 = -[WFHealthIssue initWithType:](&v24, sel_initWithType_, 0x4000);
  v12 = v11;
  if (v11)
  {
    -[WFPrivacyIssue _titleForSubType:](v11, "_titleForSubType:", a3);
    v13 = objc_claimAutoreleasedReturnValue();
    issueShortTitle = v12->_issueShortTitle;
    v12->_issueShortTitle = (NSString *)v13;

    -[WFPrivacyIssue _titleForSubType:](v12, "_titleForSubType:", a3);
    v15 = objc_claimAutoreleasedReturnValue();
    issueTitle = v12->_issueTitle;
    v12->_issueTitle = (NSString *)v15;

    -[WFPrivacyIssue _descriptionForSubType:organizationName:profileName:](v12, "_descriptionForSubType:organizationName:profileName:", a3, v9, v10);
    v17 = objc_claimAutoreleasedReturnValue();
    issueDescription = v12->_issueDescription;
    v12->_issueDescription = (NSString *)v17;

    -[WFPrivacyIssue _recommendationForSubType:organizationName:](v12, "_recommendationForSubType:organizationName:", a3, v9);
    v19 = objc_claimAutoreleasedReturnValue();
    issueRecommendation = v12->_issueRecommendation;
    v12->_issueRecommendation = (NSString *)v19;

    -[WFPrivacyIssue _privateAddressTypeToString:](v12, "_privateAddressTypeToString:", a3);
    v21 = objc_claimAutoreleasedReturnValue();
    typeString = v12->_typeString;
    v12->_typeString = (NSString *)v21;

  }
  return v12;
}

- (id)issueShortTitle
{
  NSString *issueShortTitle;
  objc_super v4;

  issueShortTitle = self->_issueShortTitle;
  if (issueShortTitle)
    return issueShortTitle;
  v4.receiver = self;
  v4.super_class = (Class)WFPrivacyIssue;
  -[WFHealthIssue issueShortTitle](&v4, sel_issueShortTitle);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)issueTitle
{
  NSString *issueTitle;
  objc_super v4;

  issueTitle = self->_issueTitle;
  if (issueTitle)
    return issueTitle;
  v4.receiver = self;
  v4.super_class = (Class)WFPrivacyIssue;
  -[WFHealthIssue issueTitle](&v4, sel_issueTitle);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)issueDescription
{
  NSString *issueDescription;
  objc_super v4;

  issueDescription = self->_issueDescription;
  if (issueDescription)
    return issueDescription;
  v4.receiver = self;
  v4.super_class = (Class)WFPrivacyIssue;
  -[WFHealthIssue issueDescription](&v4, sel_issueDescription);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)issueRecommendation
{
  NSString *issueRecommendation;
  objc_super v4;

  issueRecommendation = self->_issueRecommendation;
  if (issueRecommendation)
    return issueRecommendation;
  v4.receiver = self;
  v4.super_class = (Class)WFPrivacyIssue;
  -[WFHealthIssue issueRecommendation](&v4, sel_issueRecommendation);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_titleForSubType:(unint64_t)a3
{
  const __CFString *v3;
  void *v4;
  void *v5;

  if (a3 == 1)
    v3 = CFSTR("kWFLocPrivateAddressDisabledBySystemTitle");
  else
    v3 = CFSTR("kWFLocPrivateAddressDisabledByOthersTitle");
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", v3, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_descriptionForSubType:(unint64_t)a3 organizationName:(id)a4 profileName:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL4 v13;
  const __CFString *v14;
  const __CFString *v15;
  void *v16;
  _BOOL4 v17;
  const __CFString *v18;
  const __CFString *v19;
  void *v20;
  const __CFString *v21;
  const __CFString *v22;
  uint64_t v23;
  const __CFString *v24;

  v8 = a4;
  v9 = a5;
  v10 = v9;
  v11 = 0;
  switch(a3)
  {
    case 1uLL:
    case 8uLL:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[WFHealthIssue chinaDevice](self, "chinaDevice");
      v14 = CFSTR("kWFLocPrivateAddressDisabledByGenericDescription");
      v15 = CFSTR("kWFLocPrivateAddressDisabledByGenericDescription_CH");
      goto LABEL_21;
    case 2uLL:
      if (!v8 || !objc_msgSend(v8, "length"))
        goto LABEL_20;
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[WFHealthIssue chinaDevice](self, "chinaDevice");
      v18 = CFSTR("kWFLocPrivateAddressDisabledByCarrierDescription");
      v19 = CFSTR("kWFLocPrivateAddressDisabledByCarrierDescription_CH");
      goto LABEL_15;
    case 4uLL:
      if (v9 && objc_msgSend(v9, "length"))
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[WFHealthIssue chinaDevice](self, "chinaDevice"))
          v21 = CFSTR("kWFLocPrivateAddressDisabledByProfileDescription_CH");
        else
          v21 = CFSTR("kWFLocPrivateAddressDisabledByProfileDescription");
        objc_msgSend(v20, "localizedStringForKey:value:table:", v21, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v12, v10);
LABEL_19:
        v23 = objc_claimAutoreleasedReturnValue();
        goto LABEL_25;
      }
      if (v8 && objc_msgSend(v8, "length"))
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = -[WFHealthIssue chinaDevice](self, "chinaDevice");
        v18 = CFSTR("kWFLocPrivateAddressDisabledByProfileDescription");
        v19 = CFSTR("kWFLocPrivateAddressDisabledByProfileDescription_CH");
LABEL_15:
        if (v17)
          v22 = v19;
        else
          v22 = v18;
        objc_msgSend(v16, "localizedStringForKey:value:table:", v22, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v12, v8);
        goto LABEL_19;
      }
LABEL_20:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[WFHealthIssue chinaDevice](self, "chinaDevice");
      v14 = CFSTR("kWFLocPrivateAddressDisabledByOtherGenericDescription");
      v15 = CFSTR("kWFLocPrivateAddressDisabledByOtherGenericDescription_CH");
LABEL_21:
      if (v13)
        v24 = v15;
      else
        v24 = v14;
      objc_msgSend(v12, "localizedStringForKey:value:table:", v24, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
      v23 = objc_claimAutoreleasedReturnValue();
LABEL_25:
      v11 = (void *)v23;

LABEL_26:
      return v11;
    default:
      goto LABEL_26;
  }
}

- (id)_recommendationForSubType:(unint64_t)a3 organizationName:(id)a4
{
  __CFString *v4;
  void *v5;
  void *v6;

  if (-[WFHealthIssue chinaDevice](self, "chinaDevice", a3, a4))
  {
    objc_msgSend(CFSTR("kWFLocPrivateAddressDisabledByAllRecommendation"), "stringByAppendingString:", CFSTR("_CH"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = CFSTR("kWFLocPrivateAddressDisabledByAllRecommendation");
  }
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", v4, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)_healthIssueTypeForSubType:(unint64_t)a3
{
  return 0x4000;
}

- (id)_privateAddressTypeToString:(unint64_t)a3
{
  if (a3 - 1 > 7)
    return 0;
  else
    return off_24DB37AA8[a3 - 1];
}

- (id)typeString
{
  return self->_typeString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_typeString, 0);
  objc_storeStrong((id *)&self->_issueRecommendation, 0);
  objc_storeStrong((id *)&self->_issueDescription, 0);
  objc_storeStrong((id *)&self->_issueTitle, 0);
  objc_storeStrong((id *)&self->_issueShortTitle, 0);
}

@end
