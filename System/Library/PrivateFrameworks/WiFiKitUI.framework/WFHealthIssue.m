@implementation WFHealthIssue

+ (id)issueWithType:(unint64_t)a3
{
  return -[WFHealthIssue initWithType:]([WFHealthIssue alloc], "initWithType:", a3);
}

- (WFHealthIssue)initWithType:(unint64_t)a3
{
  WFHealthIssue *v4;
  uint64_t v5;
  NSString *issueShortTitle;
  uint64_t v7;
  NSString *issueTitle;
  uint64_t v9;
  NSString *issueDescription;
  uint64_t v11;
  NSString *issueRecommendation;
  uint64_t v13;
  NSString *typeString;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)WFHealthIssue;
  v4 = -[WFHealthIssue init](&v16, sel_init);
  if (v4)
  {
    if (WFHasWAPICapability___uiWapiEnabledCapabilityToken != -1)
      dispatch_once(&WFHasWAPICapability___uiWapiEnabledCapabilityToken, &__block_literal_global_240);
    v4->_chinaDevice = WFHasWAPICapability___wapiCapability_0;
    v4->_type = a3;
    v4->_category = -[WFHealthIssue _categoryForType:](v4, "_categoryForType:", a3);
    -[WFHealthIssue _shortTitleForType:](v4, "_shortTitleForType:", a3);
    v5 = objc_claimAutoreleasedReturnValue();
    issueShortTitle = v4->_issueShortTitle;
    v4->_issueShortTitle = (NSString *)v5;

    -[WFHealthIssue _titleForType:](v4, "_titleForType:", a3);
    v7 = objc_claimAutoreleasedReturnValue();
    issueTitle = v4->_issueTitle;
    v4->_issueTitle = (NSString *)v7;

    -[WFHealthIssue _descriptionForType:](v4, "_descriptionForType:", a3);
    v9 = objc_claimAutoreleasedReturnValue();
    issueDescription = v4->_issueDescription;
    v4->_issueDescription = (NSString *)v9;

    -[WFHealthIssue _recommendationForType:](v4, "_recommendationForType:", a3);
    v11 = objc_claimAutoreleasedReturnValue();
    issueRecommendation = v4->_issueRecommendation;
    v4->_issueRecommendation = (NSString *)v11;

    -[WFHealthIssue _typeStringForType:](v4, "_typeStringForType:", a3);
    v13 = objc_claimAutoreleasedReturnValue();
    typeString = v4->_typeString;
    v4->_typeString = (NSString *)v13;

  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  v5 = v4;
  v6 = (!self || v4)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && -[WFHealthIssue isEqualToHealthIssue:](self, "isEqualToHealthIssue:", v5);

  return v6;
}

- (BOOL)isEqualToHealthIssue:(id)a3
{
  uint64_t v4;

  v4 = objc_msgSend(a3, "type");
  return v4 == -[WFHealthIssue type](self, "type");
}

- (NSString)issueDetailText
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHealthIssue issueDescription](self, "issueDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFHealthIssue issueDescription](self, "issueDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v5);

  }
  -[WFHealthIssue issueRecommendation](self, "issueRecommendation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");

  if (v7)
  {
    -[WFHealthIssue issueDescription](self, "issueDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "length");

    if (v9)
      objc_msgSend(v3, "appendString:", CFSTR("\n\n"));
    -[WFHealthIssue issueRecommendation](self, "issueRecommendation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendString:", v10);

  }
  return (NSString *)v3;
}

- (id)_shortTitleForType:(unint64_t)a3
{
  unint64_t v3;
  uint64_t v4;

  if (a3 == 512)
    v3 = 2;
  else
    v3 = a3;
  if (a3 == 256)
    v4 = 2;
  else
    v4 = v3;
  -[WFHealthIssue _titleForType:](self, "_titleForType:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_recommendationForType:(unint64_t)a3
{
  __CFString *v3;
  _BOOL4 chinaDevice;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  __CFString *v8;
  void *v9;
  void *v10;

  v3 = 0;
  if ((uint64_t)a3 <= 511)
  {
    if ((uint64_t)a3 <= 31)
    {
      if ((uint64_t)a3 > 7)
      {
        if (a3 == 8)
        {
          chinaDevice = self->_chinaDevice;
          v5 = CFSTR("kWFLocNoSecurityRecommendation_CH");
          v6 = CFSTR("kWFLocNoSecurityRecommendation");
        }
        else
        {
          if (a3 != 16)
            goto LABEL_44;
          chinaDevice = self->_chinaDevice;
          v5 = CFSTR("kWFLocLegacyRatesRecommendation_CH");
          v6 = CFSTR("kWFLocLegacyRatesRecommendation");
        }
        goto LABEL_40;
      }
      if (a3 != 2 && a3 != 4)
        goto LABEL_44;
      goto LABEL_26;
    }
    if ((uint64_t)a3 <= 127)
    {
      if (a3 == 32)
      {
        chinaDevice = self->_chinaDevice;
        v5 = CFSTR("kWFLocAmbiguousNameRecommendation_CH");
        v6 = CFSTR("kWFLocAmbiguousNameRecommendation");
      }
      else
      {
        if (a3 != 64)
          goto LABEL_44;
        chinaDevice = self->_chinaDevice;
        v5 = CFSTR("kWFLocHiddenNetworkRecommendation_CH");
        v6 = CFSTR("kWFLocHiddenNetworkRecommendation");
      }
      goto LABEL_40;
    }
    if (a3 == 128)
    {
      chinaDevice = self->_chinaDevice;
      v5 = CFSTR("kWFLocOpenHiddenNetworkRecommendation_CH");
      v6 = CFSTR("kWFLocOpenHiddenNetworkRecommendation");
      goto LABEL_40;
    }
    if (a3 != 256)
      goto LABEL_44;
LABEL_29:
    chinaDevice = self->_chinaDevice;
    v5 = CFSTR("kWFLocWPAHiddenNetworkRecommendation_CH");
    v6 = CFSTR("kWFLocWPAHiddenNetworkRecommendation");
    goto LABEL_40;
  }
  if ((uint64_t)a3 >= 0x2000)
  {
    if ((uint64_t)a3 < 0x40000)
    {
      if (a3 != 0x2000)
      {
        if (a3 != 0x8000)
          goto LABEL_44;
        chinaDevice = self->_chinaDevice;
        v5 = CFSTR("kWFLocNoInternetWithPrivateMACRecommendation_CH");
        v6 = CFSTR("kWFLocNoInternetWithPrivateMACRecommendation");
        goto LABEL_40;
      }
      goto LABEL_29;
    }
    v7 = CFSTR("kWFLocIMSIExposureNetworkRecommendation");
    if (a3 != 0x80000)
      v7 = 0;
    if (a3 == 0x40000)
      v3 = CFSTR("kWFLocIMSIExposureNetworkRecommendation");
    else
      v3 = (__CFString *)v7;
  }
  else
  {
    if ((uint64_t)a3 <= 2047)
    {
      if (a3 != 512)
      {
        if (a3 == 1024)
          v3 = CFSTR("kWFLocIMSIExposureNetworkRecommendation");
        else
          v3 = 0;
        goto LABEL_44;
      }
      chinaDevice = self->_chinaDevice;
      v5 = CFSTR("kWFLocWEPHiddenNetworkRecommendation_CH");
      v6 = CFSTR("kWFLocWEPHiddenNetworkRecommendation");
      goto LABEL_40;
    }
    if (a3 == 2048)
    {
      v3 = CFSTR("kWFLocDNSFilteredNetworkRecommendation");
      goto LABEL_44;
    }
    if (a3 == 4096)
    {
LABEL_26:
      chinaDevice = self->_chinaDevice;
      v5 = CFSTR("kWFLocWeakSecurityRecommendation_CH");
      v6 = CFSTR("kWFLocWeakSecurityRecommendation");
LABEL_40:
      if (chinaDevice)
        v8 = (__CFString *)v5;
      else
        v8 = (__CFString *)v6;
      v3 = v8;
    }
  }
LABEL_44:
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", v3, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_descriptionForType:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  __CFString *v7;
  void *v8;
  __CFString *v9;

  v3 = 0;
  if ((uint64_t)a3 > 511)
  {
    if ((uint64_t)a3 >= 0x2000)
    {
      if ((uint64_t)a3 >= 0x40000)
      {
        if (a3 == 0x40000)
        {
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          v5 = v4;
          v6 = CFSTR("kWFLocWeakSecurityNoTLSTrustedServerNamesDescription");
          goto LABEL_40;
        }
        if (a3 == 0x80000)
        {
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          v5 = v4;
          v6 = CFSTR("kWFLocWeakSecurityNoPayloadCertificateAnchorUUIDDescription");
          goto LABEL_40;
        }
      }
      else
      {
        if (a3 == 0x2000)
        {
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          v5 = v4;
          v6 = CFSTR("kWFLocWPATKIPHiddenNetworkDescription");
          goto LABEL_40;
        }
        if (a3 == 0x8000)
        {
LABEL_17:
          if (self->_chinaDevice)
            v7 = CFSTR("kWFLocNoInternetDescription_CH");
          else
            v7 = CFSTR("kWFLocNoInternetDescription");
          v8 = (void *)MEMORY[0x24BDD1488];
          v9 = v7;
          objc_msgSend(v8, "bundleForClass:", objc_opt_class());
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "localizedStringForKey:value:table:", v9, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
          v3 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_41;
        }
      }
    }
    else if ((uint64_t)a3 > 2047)
    {
      if (a3 == 2048)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v4;
        v6 = CFSTR("kWFLocDNSFilteredNetworkDescription");
        goto LABEL_40;
      }
      if (a3 == 4096)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v4;
        v6 = CFSTR("kWFLocWeakSecurityWPATKIPDescription");
        goto LABEL_40;
      }
    }
    else
    {
      if (a3 == 512)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v4;
        v6 = CFSTR("kWFLocWEPHiddenNetworkDescription");
        goto LABEL_40;
      }
      if (a3 == 1024)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v4;
        v6 = CFSTR("kWFLocIMSIExposureNetworkDescription");
LABEL_40:
        objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
        v3 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_41:

      }
    }
  }
  else
  {
    if ((uint64_t)a3 <= 31)
    {
      switch(a3)
      {
        case 1uLL:
          goto LABEL_17;
        case 2uLL:
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          v5 = v4;
          v6 = CFSTR("kWFLocWeakSecurityWEPDescription");
          goto LABEL_40;
        case 3uLL:
        case 5uLL:
        case 6uLL:
        case 7uLL:
          return v3;
        case 4uLL:
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          v5 = v4;
          v6 = CFSTR("kWFLocWeakSecurityWPADescription");
          goto LABEL_40;
        case 8uLL:
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          v5 = v4;
          v6 = CFSTR("kWFLocNoSecurityDescription");
          goto LABEL_40;
        default:
          if (a3 != 16)
            return v3;
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          v5 = v4;
          v6 = CFSTR("kWFLocLegacyRatesDescription");
          break;
      }
      goto LABEL_40;
    }
    if ((uint64_t)a3 > 127)
    {
      if (a3 == 128)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v4;
        v6 = CFSTR("kWFLocOpenHiddenNetworkDescription");
        goto LABEL_40;
      }
      if (a3 == 256)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v4;
        v6 = CFSTR("kWFLocWPAHiddenNetworkDescription");
        goto LABEL_40;
      }
    }
    else
    {
      if (a3 == 32)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v4;
        v6 = CFSTR("kWFLocAmbiguousNameDescription");
        goto LABEL_40;
      }
      if (a3 == 64)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v4;
        v6 = CFSTR("kWFLocHiddenNetworkDescription");
        goto LABEL_40;
      }
    }
  }
  return v3;
}

- (id)_titleForType:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;

  v3 = 0;
  if ((uint64_t)a3 <= 511)
  {
    if ((uint64_t)a3 <= 31)
    {
      switch(a3)
      {
        case 1uLL:
          goto LABEL_17;
        case 2uLL:
        case 4uLL:
          goto LABEL_26;
        case 3uLL:
        case 5uLL:
        case 6uLL:
        case 7uLL:
          return v3;
        case 8uLL:
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          v5 = v4;
          v6 = CFSTR("kWFLocNoSecurityTitle");
          goto LABEL_27;
        default:
          if (a3 != 16)
            return v3;
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          v5 = v4;
          v6 = CFSTR("kWFLocLegacyRatesTitle");
          break;
      }
      goto LABEL_27;
    }
    if ((uint64_t)a3 <= 127)
    {
      if (a3 == 32)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v4;
        v6 = CFSTR("kWFLocAmbiguousNameTitle");
        goto LABEL_27;
      }
      if (a3 == 64)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v4;
        v6 = CFSTR("kWFLocHiddenNetworkTitle");
        goto LABEL_27;
      }
      return v3;
    }
    if (a3 == 128)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("kWFLocOpenHiddenNetworkTitle");
      goto LABEL_27;
    }
    if (a3 != 256)
      return v3;
LABEL_23:
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("kWFLocWPAHiddenNetworkTitle");
    goto LABEL_27;
  }
  if ((uint64_t)a3 >= 0x2000)
  {
    if ((uint64_t)a3 < 0x40000)
    {
      if (a3 != 0x2000)
      {
        if (a3 == 0x8000)
        {
LABEL_17:
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          v5 = v4;
          v6 = CFSTR("kWFLocNoInternetTitle");
          goto LABEL_27;
        }
        return v3;
      }
      goto LABEL_23;
    }
    if (a3 != 0x40000 && a3 != 0x80000)
      return v3;
LABEL_26:
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("kWFLocWeakSecurityTitle");
    goto LABEL_27;
  }
  if ((uint64_t)a3 > 2047)
  {
    if (a3 == 2048)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v6 = CFSTR("kWFLocDNSFilteredNetworkTitle");
      goto LABEL_27;
    }
    if (a3 != 4096)
      return v3;
    goto LABEL_26;
  }
  if (a3 == 512)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("kWFLocWEPHiddenNetworkTitle");
    goto LABEL_27;
  }
  if (a3 == 1024)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("kWFLocIMSIExposureNetworkTitle");
LABEL_27:
    objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (unint64_t)_categoryForType:(unint64_t)a3
{
  unint64_t result;
  char v4;

  result = 0;
  if ((uint64_t)a3 > 1023)
  {
    if ((uint64_t)a3 >= 0x4000)
    {
      if ((uint64_t)a3 >= 0x40000)
      {
        if (a3 == 0x80000 || a3 == 0x40000)
          return 1;
        return result;
      }
      if (a3 != 0x4000)
      {
        if (a3 != 0x20000)
          return result;
        return 3;
      }
    }
    else
    {
      if ((uint64_t)a3 > 4095)
      {
        if (a3 == 4096 || a3 == 0x2000)
          return 1;
        return result;
      }
      if (a3 != 1024 && a3 != 2048)
        return result;
    }
    return 2;
  }
  if ((uint64_t)a3 <= 127)
  {
    v4 = a3 - 2;
    if (a3 - 2 > 0x3E)
      return result;
    if (((1 << v4) & 0x4000000000000045) == 0)
    {
      if (((1 << v4) & 0x40004000) == 0)
        return result;
      return 3;
    }
    return 1;
  }
  if (a3 == 128 || a3 == 256 || a3 == 512)
    return 1;
  return result;
}

- (id)_typeStringForType:(unint64_t)a3
{
  id result;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFString *v13;
  const __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;

  if ((uint64_t)a3 > 1023)
  {
    v4 = CFSTR("limit-network");
    v5 = CFSTR("no-tls-trusted-server-names");
    v6 = CFSTR("no-payload-certificate-anchor-uuid");
    if (a3 != 0x80000)
      v6 = 0;
    if (a3 != 0x40000)
      v5 = v6;
    if (a3 != 0x20000)
      v4 = v5;
    v7 = CFSTR("no-internet-private-address");
    v8 = CFSTR("cellular-outrank");
    if (a3 != 0x10000)
      v8 = 0;
    if (a3 != 0x8000)
      v7 = v8;
    if ((uint64_t)a3 < 0x20000)
      v4 = v7;
    v9 = CFSTR("weak-wpa-tkip");
    v10 = CFSTR("hidden-wpa-tkip-network");
    v11 = CFSTR("private-address-disabled");
    if (a3 != 0x4000)
      v11 = 0;
    if (a3 != 0x2000)
      v10 = v11;
    if (a3 != 4096)
      v9 = v10;
    v12 = CFSTR("carrier-imsi");
    v13 = CFSTR("dns-filtered");
    if (a3 != 2048)
      v13 = 0;
    if (a3 != 1024)
      v12 = v13;
    if ((uint64_t)a3 <= 4095)
      v9 = v12;
    if ((uint64_t)a3 < 0x8000)
      return (id)v9;
    else
      return (id)v4;
  }
  else if ((uint64_t)a3 > 31)
  {
    v14 = CFSTR("hidden-open-network");
    v15 = CFSTR("hidden-wpa-network");
    v16 = CFSTR("hidden-wep-network");
    if (a3 != 512)
      v16 = 0;
    if (a3 != 256)
      v15 = v16;
    if (a3 != 128)
      v14 = v15;
    v17 = CFSTR("common-ssid");
    v18 = CFSTR("hidden-network");
    if (a3 != 64)
      v18 = 0;
    if (a3 != 32)
      v17 = v18;
    if ((uint64_t)a3 <= 127)
      return (id)v17;
    else
      return (id)v14;
  }
  else
  {
    result = 0;
    switch(a3)
    {
      case 1uLL:
        result = CFSTR("no-internet");
        break;
      case 2uLL:
        result = CFSTR("weak-wep");
        break;
      case 3uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
        return result;
      case 4uLL:
        result = CFSTR("weak-wpa");
        break;
      case 8uLL:
        result = CFSTR("weak-open");
        break;
      default:
        if (a3 == 16)
          result = CFSTR("legacy-rates");
        else
          result = 0;
        break;
    }
  }
  return result;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHealthIssue typeString](self, "typeString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ : %p type='%@' code=%lu"), v5, self, v6, -[WFHealthIssue type](self, "type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[WFHealthIssue overrideIssue](self, "overrideIssue"))
    objc_msgSend(v7, "appendString:", CFSTR(" override=1"));
  -[WFHealthIssue issueTitle](self, "issueTitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR(" title='%@'"), v8);

  -[WFHealthIssue issueDescription](self, "issueDescription");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[WFHealthIssue issueDescription](self, "issueDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR(" description='%@'"), v10);

  }
  -[WFHealthIssue issueRecommendation](self, "issueRecommendation");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    -[WFHealthIssue issueRecommendation](self, "issueRecommendation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "length");

    if (v14)
    {
      -[WFHealthIssue issueRecommendation](self, "issueRecommendation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "appendFormat:", CFSTR(" recommendation='%@'"), v15);

    }
  }
  objc_msgSend(v7, "appendString:", CFSTR(">"));
  return v7;
}

- (void)setOverrideIssue:(BOOL)a3
{
  _BOOL4 v3;
  NSString *v5;
  NSString *v6;
  NSString *typeString;
  NSString *v8;
  NSString *v9;

  v3 = a3;
  self->_overrideIssue = a3;
  -[WFHealthIssue _typeStringForType:](self, "_typeStringForType:", -[WFHealthIssue type](self, "type"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v9 = v5;
    -[NSString stringByAppendingFormat:](v5, "stringByAppendingFormat:", CFSTR("-OVERRIDE"));
    v6 = (NSString *)objc_claimAutoreleasedReturnValue();
    typeString = self->_typeString;
    self->_typeString = v6;

    v8 = v9;
  }
  else
  {
    v8 = self->_typeString;
    self->_typeString = v5;
  }

}

+ (id)healthIssueSortComparator
{
  return &__block_literal_global_1;
}

uint64_t __42__WFHealthIssue_healthIssueSortComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v10;

  v4 = a2;
  v5 = a3;
  v6 = objc_msgSend(v4, "category");
  if (v6 < objc_msgSend(v5, "category"))
    goto LABEL_4;
  v7 = objc_msgSend(v4, "category");
  if (v7 > objc_msgSend(v5, "category"))
    goto LABEL_6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
LABEL_4:
    v8 = -1;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
LABEL_6:
    v8 = 1;
    goto LABEL_7;
  }
  v10 = objc_msgSend(v4, "type");
  if (v10 > objc_msgSend(v5, "type"))
    v8 = 1;
  else
    v8 = -1;
LABEL_7:

  return v8;
}

+ (id)highestPriorityIssueFromIssues:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    if ((unint64_t)objc_msgSend(v4, "count") <= 1)
    {
      objc_msgSend(v4, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[WFHealthIssue healthIssueSortComparator](WFHealthIssue, "healthIssueSortComparator");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "sortedArrayUsingComparator:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (unint64_t)category
{
  return self->_category;
}

- (void)setCategory:(unint64_t)a3
{
  self->_category = a3;
}

- (NSString)issueShortTitle
{
  return self->_issueShortTitle;
}

- (void)setIssueShortTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)issueTitle
{
  return self->_issueTitle;
}

- (void)setIssueTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)issueDescription
{
  return self->_issueDescription;
}

- (void)setIssueDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)issueRecommendation
{
  return self->_issueRecommendation;
}

- (void)setIssueRecommendation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)typeString
{
  return self->_typeString;
}

- (BOOL)overrideIssue
{
  return self->_overrideIssue;
}

- (BOOL)subtitleOnlyIssue
{
  return self->_subtitleOnlyIssue;
}

- (BOOL)chinaDevice
{
  return self->_chinaDevice;
}

- (void)setChinaDevice:(BOOL)a3
{
  self->_chinaDevice = a3;
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
