@implementation WFANQPQueryResponse

- (WFANQPQueryResponse)initWithScanResult:(id)a3 ANQPResponse:(id)a4
{
  id v7;
  id v8;
  void *v9;
  NSString *v10;
  NSString *ssid;
  NSArray *v12;
  NSArray *cellNetworkInfo;
  NSArray *v14;
  NSArray *roamingConsortium;
  NSArray *v16;
  NSArray *domains;
  void *v18;
  void *v19;
  void *v20;
  NSString *v21;
  NSString *operatorName;
  NSString *v23;
  NSString *bssid;
  void *v25;
  void *v26;
  WFANQPQueryResponse *v27;
  NSObject *v29;
  os_log_type_t v30;
  const char *v31;
  os_log_type_t v32;
  int v33;
  const char *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!self)
  {
    v18 = 0;
LABEL_24:

    v26 = 0;
    self = 0;
    goto LABEL_11;
  }
  if (!v7)
  {
    WFLogForCategory(0);
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = OSLogForWFLogLevel(1uLL);
    v18 = 0;
    if (!WFCurrentLogLevel() || !v29)
      goto LABEL_23;
    if (!os_log_type_enabled(v29, v30))
      goto LABEL_22;
    v33 = 136315138;
    v34 = "-[WFANQPQueryResponse initWithScanResult:ANQPResponse:]";
    v31 = "%s: missing scan result";
    goto LABEL_21;
  }
  if (!v8)
  {
    WFLogForCategory(0);
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = OSLogForWFLogLevel(1uLL);
    v18 = 0;
    if (!WFCurrentLogLevel() || !v29)
      goto LABEL_23;
    if (!os_log_type_enabled(v29, v30))
    {
LABEL_22:
      v18 = 0;
LABEL_23:

      goto LABEL_24;
    }
    v33 = 136315138;
    v34 = "-[WFANQPQueryResponse initWithScanResult:ANQPResponse:]";
    v31 = "%s: missing response";
LABEL_21:
    _os_log_impl(&dword_219FC8000, v29, v30, v31, (uint8_t *)&v33, 0xCu);
    goto LABEL_22;
  }
  objc_storeStrong((id *)&self->_scanResult, a3);
  objc_msgSend(v7, "networkName");
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  ssid = self->_ssid;
  self->_ssid = v10;

  objc_msgSend(v9, "objectForKey:", CFSTR("ANQP_CELL_NETWORK_INFO"));
  v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
  cellNetworkInfo = self->_cellNetworkInfo;
  self->_cellNetworkInfo = v12;

  objc_msgSend(v9, "objectForKey:", CFSTR("ANQP_ROAMING_CONSORTIUM_OI_LIST"));
  v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
  roamingConsortium = self->_roamingConsortium;
  self->_roamingConsortium = v14;

  objc_msgSend(v9, "objectForKey:", CFSTR("ANQP_DOMAIN_NAME_LIST"));
  v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
  domains = self->_domains;
  self->_domains = v16;

  objc_msgSend(v9, "objectForKey:", CFSTR("ANQP_OPERATOR_NAMES_LIST"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "count"))
  {
    objc_msgSend(v18, "objectAtIndex:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
    {
      objc_msgSend(v19, "objectForKey:", CFSTR("ANQP_OPERATOR_NAME"));
      v21 = (NSString *)objc_claimAutoreleasedReturnValue();
      operatorName = self->_operatorName;
      self->_operatorName = v21;

    }
  }
  objc_msgSend(v9, "objectForKey:", CFSTR("BSSID"));
  v23 = (NSString *)objc_claimAutoreleasedReturnValue();
  bssid = self->_bssid;
  self->_bssid = v23;

  if (!self->_bssid)
  {
    WFLogForCategory(0);
    v29 = objc_claimAutoreleasedReturnValue();
    v32 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v29 && os_log_type_enabled(v29, v32))
    {
      v33 = 138412290;
      v34 = (const char *)v9;
      _os_log_impl(&dword_219FC8000, v29, v32, "BSSID was nil for ANQP response %@", (uint8_t *)&v33, 0xCu);
    }
    goto LABEL_23;
  }
  objc_msgSend(v9, "objectForKey:", CFSTR("CHANNEL"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v25)
    self->_channel = objc_msgSend(v25, "integerValue");
LABEL_11:
  v27 = self;

  return v27;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFANQPQueryResponse bssid](self, "bssid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFANQPQueryResponse operatorName](self, "operatorName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@- BSSID %@ | Operator Name %@"), v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[WFANQPQueryResponse bssid](self, "bssid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[WFANQPQueryResponse isEqualToWFANQPResponse:](self, "isEqualToWFANQPResponse:", v4);

  return v5;
}

- (BOOL)isEqualToWFANQPResponse:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[WFANQPQueryResponse bssid](self, "bssid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bssid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqualToString:", v6);
  return (char)v4;
}

- (CWFScanResult)scanResult
{
  return self->_scanResult;
}

- (void)setScanResult:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSArray)cellNetworkInfo
{
  return self->_cellNetworkInfo;
}

- (void)setCellNetworkInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)roamingConsortium
{
  return self->_roamingConsortium;
}

- (void)setRoamingConsortium:(id)a3
{
  objc_storeStrong((id *)&self->_roamingConsortium, a3);
}

- (NSArray)domains
{
  return self->_domains;
}

- (void)setDomains:(id)a3
{
  objc_storeStrong((id *)&self->_domains, a3);
}

- (NSString)ssid
{
  return self->_ssid;
}

- (void)setSsid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)bssid
{
  return self->_bssid;
}

- (void)setBssid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)operatorName
{
  return self->_operatorName;
}

- (void)setOperatorName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (int64_t)channel
{
  return self->_channel;
}

- (void)setChannel:(int64_t)a3
{
  self->_channel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operatorName, 0);
  objc_storeStrong((id *)&self->_bssid, 0);
  objc_storeStrong((id *)&self->_ssid, 0);
  objc_storeStrong((id *)&self->_domains, 0);
  objc_storeStrong((id *)&self->_roamingConsortium, 0);
  objc_storeStrong((id *)&self->_cellNetworkInfo, 0);
  objc_storeStrong((id *)&self->_scanResult, 0);
}

@end
