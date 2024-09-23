@implementation WFHotspotHelperNetwork

- (WFHotspotHelperNetwork)initWithSSID:(id)a3 bundleIdentifier:(id)a4 password:(id)a5 label:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  WFHotspotHelperNetwork *v15;
  WFHotspotHelperNetwork *v16;
  NSString **p_ssid;
  NSObject *v18;
  os_log_type_t v19;
  const char *v20;
  NSObject *p_super;
  os_log_type_t v22;
  NSString *v23;
  NSObject *v25;
  os_log_type_t v26;
  objc_super v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  NSString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v27.receiver = self;
  v27.super_class = (Class)WFHotspotHelperNetwork;
  v15 = -[WFHotspotHelperNetwork init](&v27, sel_init);
  v16 = v15;
  if (!v15)
  {
    p_super = 0;
LABEL_14:

    goto LABEL_15;
  }
  p_ssid = &v15->_ssid;
  objc_storeStrong((id *)&v15->_ssid, a3);
  if (!v16->_ssid)
  {
    WFLogForCategory(0);
    v25 = objc_claimAutoreleasedReturnValue();
    v26 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v25 && os_log_type_enabled(v25, v26))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219FC8000, v25, v26, "Missing SSID for hotspot helper network", buf, 2u);
    }

    p_super = &v16->super;
    v16 = 0;
    goto LABEL_14;
  }
  objc_storeStrong((id *)&v16->_password, a5);
  if (!v16->_password)
  {
    WFLogForCategory(0);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v18 && os_log_type_enabled(v18, v19))
    {
      v20 = (const char *)*p_ssid;
      *(_DWORD *)buf = 138412290;
      v29 = v20;
      _os_log_impl(&dword_219FC8000, v18, v19, "Nil password for hotspot helper network ssid: %@", buf, 0xCu);
    }

  }
  objc_storeStrong((id *)&v16->_label, a6);
  objc_storeStrong((id *)&v16->_bundleIdentifier, a4);
  if (!v16->_bundleIdentifier)
  {
    WFLogForCategory(0);
    p_super = objc_claimAutoreleasedReturnValue();
    v22 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && p_super && os_log_type_enabled(p_super, v22))
    {
      v23 = *p_ssid;
      *(_DWORD *)buf = 136315394;
      v29 = "-[WFHotspotHelperNetwork initWithSSID:bundleIdentifier:password:label:]";
      v30 = 2112;
      v31 = v23;
      _os_log_impl(&dword_219FC8000, p_super, v22, "%s: missing bundleIdentifier for %@", buf, 0x16u);
    }
    goto LABEL_14;
  }
LABEL_15:

  return v16;
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

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHotspotHelperNetwork ssid](self, "ssid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHotspotHelperNetwork password](self, "password");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHotspotHelperNetwork label](self, "label");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFHotspotHelperNetwork bundleIdentifier](self, "bundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: SSID: %@, Password: %@, Label: %@, Identifier: %@>"), v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)ssid
{
  return self->_ssid;
}

- (void)setSsid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_ssid, 0);
}

@end
