@implementation WFPrivateAddressConfig

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ssid, 0);
}

- (WFPrivateAddressConfig)initWithPrivateAddressConfigDictionary:(id)a3 ssid:(id)a4
{
  id v6;
  id v7;
  WFPrivateAddressConfig *v8;
  NSString **p_ssid;
  NSObject *v10;
  os_log_type_t v11;
  NSString *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v19;
  unint64_t v20;
  NSObject *v21;
  uint64_t v22;
  NSString *v23;
  os_log_type_t v24;
  uint64_t v25;
  NSString *v26;
  NSObject *v27;
  os_log_type_t v28;
  objc_super v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  _BYTE v34[24];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!v6 || !objc_msgSend(v6, "count"))
    goto LABEL_34;
  if (!v7)
  {
    WFLogForCategory(0);
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v27 && os_log_type_enabled(v27, v28))
    {
      *(_DWORD *)buf = 136315138;
      v32 = "-[WFPrivateAddressConfig initWithPrivateAddressConfigDictionary:ssid:]";
      _os_log_impl(&dword_219FC8000, v27, v28, "%s: ssid is null", buf, 0xCu);
    }

    goto LABEL_34;
  }
  v30.receiver = self;
  v30.super_class = (Class)WFPrivateAddressConfig;
  v8 = -[WFPrivateAddressConfig init](&v30, sel_init);
  self = v8;
  if (!v8)
  {
LABEL_34:

    self = 0;
    goto LABEL_35;
  }
  p_ssid = &v8->_ssid;
  objc_storeStrong((id *)&v8->_ssid, a4);
  WFLogForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = OSLogForWFLogLevel(4uLL);
  if ((unint64_t)WFCurrentLogLevel() >= 4 && v10 && os_log_type_enabled(v10, v11))
  {
    v12 = *p_ssid;
    *(_DWORD *)buf = 136315650;
    v32 = "-[WFPrivateAddressConfig initWithPrivateAddressConfigDictionary:ssid:]";
    v33 = 2112;
    *(_QWORD *)v34 = v12;
    *(_WORD *)&v34[8] = 2112;
    *(_QWORD *)&v34[10] = v6;
    _os_log_impl(&dword_219FC8000, v10, v11, "%s: %@ private address config: %@", buf, 0x20u);
  }

  v13 = *MEMORY[0x24BE67E70];
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BE67E70]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    self->_carrierBundleBased = objc_msgSend(v15, "BOOLValue");

  }
  v16 = *MEMORY[0x24BE67E58];
  objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BE67E58]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "intValue");

    switch(v19)
    {
      case 1:
        if (self->_carrierBundleBased)
          v20 = 3;
        else
          v20 = 4;
        break;
      case 2:
      case 4:
        v20 = 2;
        break;
      case 3:
        v20 = 1;
        break;
      default:
        v20 = 0;
        break;
    }
    WFLogForCategory(0);
    v21 = objc_claimAutoreleasedReturnValue();
    v24 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v21 && os_log_type_enabled(v21, v24))
    {
      v25 = (uint64_t)*(&off_24DC35EA0 + v20);
      v26 = *p_ssid;
      *(_DWORD *)buf = 136315906;
      v32 = "-[WFPrivateAddressConfig initWithPrivateAddressConfigDictionary:ssid:]";
      v33 = 1024;
      *(_DWORD *)v34 = v19;
      *(_WORD *)&v34[4] = 2112;
      *(_QWORD *)&v34[6] = v25;
      *(_WORD *)&v34[14] = 2112;
      *(_QWORD *)&v34[16] = v26;
      _os_log_impl(&dword_219FC8000, v21, v24, "%s: disable reason: %d (%@) for %@", buf, 0x26u);
    }
  }
  else
  {
    WFLogForCategory(0);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = OSLogForWFLogLevel(4uLL);
    v20 = 0;
    if ((unint64_t)WFCurrentLogLevel() >= 4 && v21)
    {
      if (os_log_type_enabled(v21, (os_log_type_t)v22))
      {
        v23 = *p_ssid;
        *(_DWORD *)buf = 136315394;
        v32 = "-[WFPrivateAddressConfig initWithPrivateAddressConfigDictionary:ssid:]";
        v33 = 2112;
        *(_QWORD *)v34 = v23;
        _os_log_impl(&dword_219FC8000, v21, (os_log_type_t)v22, "%s: missing disabled reason key for %@, defaulting to none", buf, 0x16u);
      }
      v20 = 0;
    }
  }

  self->_disabledReason = v20;
LABEL_35:

  return self;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  void *v6;
  void *v7;

  v5 = objc_alloc_init((Class)objc_opt_class());
  if (v5)
  {
    objc_msgSend(v5, "setDisabledReason:", -[WFPrivateAddressConfig disabledReason](self, "disabledReason"));
    objc_msgSend(v5, "setCarrierBundleBased:", -[WFPrivateAddressConfig isCarrierBundleBased](self, "isCarrierBundleBased"));
    -[WFPrivateAddressConfig ssid](self, "ssid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
    objc_msgSend(v5, "setSsid:", v7);

  }
  return v5;
}

- (NSString)ssid
{
  return self->_ssid;
}

- (void)setSsid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setDisabledReason:(unint64_t)a3
{
  self->_disabledReason = a3;
}

- (void)setCarrierBundleBased:(BOOL)a3
{
  self->_carrierBundleBased = a3;
}

- (BOOL)isCarrierBundleBased
{
  return self->_carrierBundleBased;
}

- (unint64_t)disabledReason
{
  return self->_disabledReason;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  -[WFPrivateAddressConfig ssid](self, "ssid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[WFPrivateAddressConfig disabledReason](self, "disabledReason") ^ v4;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "ssid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFPrivateAddressConfig ssid](self, "ssid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7))
    {
      v8 = objc_msgSend(v5, "disabledReason");
      v9 = v8 == -[WFPrivateAddressConfig disabledReason](self, "disabledReason");
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  const __CFString *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFPrivateAddressConfig ssid](self, "ssid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WFPrivateAddressConfig disabledReason](self, "disabledReason");
  if (v7 > 4)
    v8 = CFSTR("unknown");
  else
    v8 = *(&off_24DC35EA0 + v7);
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ : %p %@ disabled reason: %@>"), v5, self, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
