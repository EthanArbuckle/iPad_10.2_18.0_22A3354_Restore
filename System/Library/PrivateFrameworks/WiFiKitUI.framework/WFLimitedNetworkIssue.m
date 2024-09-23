@implementation WFLimitedNetworkIssue

+ (id)limitedNetwork
{
  return -[WFLimitedNetworkIssue initWithChinaDevice:]([WFLimitedNetworkIssue alloc], "initWithChinaDevice:", 0);
}

+ (id)limitedNetwork_CH
{
  return -[WFLimitedNetworkIssue initWithChinaDevice:]([WFLimitedNetworkIssue alloc], "initWithChinaDevice:", 1);
}

- (WFLimitedNetworkIssue)initWithChinaDevice:(BOOL)a3
{
  _BOOL8 v3;
  WFLimitedNetworkIssue *v4;
  WFLimitedNetworkIssue *v5;
  void *v6;
  uint64_t v7;
  NSString *issueTitle;
  void *v9;
  uint64_t v10;
  NSString *issueShortTitle;
  void *v12;
  uint64_t v13;
  NSString *issueDescription;
  uint64_t v15;
  NSString *issueRecommendation;
  objc_super v18;

  v3 = a3;
  v18.receiver = self;
  v18.super_class = (Class)WFLimitedNetworkIssue;
  v4 = -[WFHealthIssue initWithType:](&v18, sel_initWithType_, 0x20000);
  v5 = v4;
  if (v4)
  {
    v4->_subtitleOnlyIssue = 0;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("kWFLocLimitNetworkTitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings-WIFI_6E"));
    v7 = objc_claimAutoreleasedReturnValue();
    issueTitle = v5->_issueTitle;
    v5->_issueTitle = (NSString *)v7;

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("kWFLocLimitNetworkTitle"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings-WIFI_6E"));
    v10 = objc_claimAutoreleasedReturnValue();
    issueShortTitle = v5->_issueShortTitle;
    v5->_issueShortTitle = (NSString *)v10;

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("kWFLocLimitNetworkDescription"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings-WIFI_6E"));
    v13 = objc_claimAutoreleasedReturnValue();
    issueDescription = v5->_issueDescription;
    v5->_issueDescription = (NSString *)v13;

    -[WFLimitedNetworkIssue _RecommendationForChinaDevice:](v5, "_RecommendationForChinaDevice:", v3);
    v15 = objc_claimAutoreleasedReturnValue();
    issueRecommendation = v5->_issueRecommendation;
    v5->_issueRecommendation = (NSString *)v15;

  }
  return v5;
}

- (id)_RecommendationForChinaDevice:(BOOL)a3
{
  __CFString *v3;
  void *v4;
  void *v5;

  v3 = CFSTR("kWFLocLimitNetworkRecommendation");
  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@_CH"), CFSTR("kWFLocLimitNetworkRecommendation"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", v3, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings-WIFI_6E"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)subtitleOnlyIssue
{
  return self->_subtitleOnlyIssue;
}

- (id)issueShortTitle
{
  return self->_issueShortTitle;
}

- (id)typeString
{
  return self->_typeString;
}

- (id)issueTitle
{
  return self->_issueTitle;
}

- (id)issueRecommendation
{
  return self->_issueRecommendation;
}

- (id)issueDescription
{
  return self->_issueDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_issueDescription, 0);
  objc_storeStrong((id *)&self->_issueRecommendation, 0);
  objc_storeStrong((id *)&self->_issueTitle, 0);
  objc_storeStrong((id *)&self->_typeString, 0);
  objc_storeStrong((id *)&self->_issueShortTitle, 0);
}

@end
