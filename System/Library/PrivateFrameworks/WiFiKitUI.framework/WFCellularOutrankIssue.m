@implementation WFCellularOutrankIssue

+ (id)cellularOutrankSecurity
{
  return -[WFCellularOutrankIssue initWithSubType:]([WFCellularOutrankIssue alloc], "initWithSubType:", 1);
}

+ (id)cellularOutrankDownload
{
  return -[WFCellularOutrankIssue initWithSubType:]([WFCellularOutrankIssue alloc], "initWithSubType:", 2);
}

+ (id)cellularOutrankPerformance
{
  return -[WFCellularOutrankIssue initWithSubType:]([WFCellularOutrankIssue alloc], "initWithSubType:", 4);
}

+ (id)cellularOutrankPrivateNetwork
{
  return -[WFCellularOutrankIssue initWithSubType:]([WFCellularOutrankIssue alloc], "initWithSubType:", 8);
}

- (WFCellularOutrankIssue)initWithSubType:(unint64_t)a3
{
  WFCellularOutrankIssue *v4;
  WFCellularOutrankIssue *v5;
  uint64_t v6;
  NSString *issueShortTitle;
  uint64_t v8;
  NSString *typeString;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WFCellularOutrankIssue;
  v4 = -[WFHealthIssue initWithType:](&v11, sel_initWithType_, 0x10000);
  v5 = v4;
  if (v4)
  {
    v4->_subtitleOnlyIssue = 1;
    -[WFCellularOutrankIssue _titleForSubType:](v4, "_titleForSubType:", a3);
    v6 = objc_claimAutoreleasedReturnValue();
    issueShortTitle = v5->_issueShortTitle;
    v5->_issueShortTitle = (NSString *)v6;

    objc_storeStrong((id *)&v5->_issueTitle, v5->_issueShortTitle);
    -[WFCellularOutrankIssue _cellularOutrankSubTypeToString:](v5, "_cellularOutrankSubTypeToString:", a3);
    v8 = objc_claimAutoreleasedReturnValue();
    typeString = v5->_typeString;
    v5->_typeString = (NSString *)v8;

  }
  return v5;
}

- (id)_titleForSubType:(unint64_t)a3
{
  __CFString *v3;
  void *v4;
  void *v5;

  if (a3 - 1 > 7)
    v3 = 0;
  else
    v3 = off_24DB37A28[a3 - 1];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", v3, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_cellularOutrankSubTypeToString:(unint64_t)a3
{
  if (a3 - 1 > 7)
    return 0;
  else
    return off_24DB37A68[a3 - 1];
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_issueTitle, 0);
  objc_storeStrong((id *)&self->_typeString, 0);
  objc_storeStrong((id *)&self->_issueShortTitle, 0);
}

@end
