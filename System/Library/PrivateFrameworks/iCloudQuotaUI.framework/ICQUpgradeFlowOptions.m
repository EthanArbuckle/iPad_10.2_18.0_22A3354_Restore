@implementation ICQUpgradeFlowOptions

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[ICQUpgradeFlowOptions navigationBarTintColor](self, "navigationBarTintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNavigationBarTintColor:", v5);

  -[ICQUpgradeFlowOptions buttonTintColor](self, "buttonTintColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setButtonTintColor:", v6);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  UIColor *navigationBarTintColor;
  id v5;

  navigationBarTintColor = self->_navigationBarTintColor;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", navigationBarTintColor, CFSTR("navigationBarTintColor"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_buttonTintColor, CFSTR("buttonTintColor"));

}

- (ICQUpgradeFlowOptions)initWithCoder:(id)a3
{
  id v4;
  ICQUpgradeFlowOptions *v5;
  uint64_t v6;
  UIColor *navigationBarTintColor;
  uint64_t v8;
  UIColor *buttonTintColor;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICQUpgradeFlowOptions;
  v5 = -[ICQUpgradeFlowOptions init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("navigationBarTintColor"));
    v6 = objc_claimAutoreleasedReturnValue();
    navigationBarTintColor = v5->_navigationBarTintColor;
    v5->_navigationBarTintColor = (UIColor *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("buttonTintColor"));
    v8 = objc_claimAutoreleasedReturnValue();
    buttonTintColor = v5->_buttonTintColor;
    v5->_buttonTintColor = (UIColor *)v8;

  }
  return v5;
}

- (UIColor)navigationBarTintColor
{
  return self->_navigationBarTintColor;
}

- (void)setNavigationBarTintColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (UIColor)buttonTintColor
{
  return self->_buttonTintColor;
}

- (void)setButtonTintColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonTintColor, 0);
  objc_storeStrong((id *)&self->_navigationBarTintColor, 0);
}

- (id)serializedData
{
  void *v3;
  ICQUpgradeFlowOptions *v4;
  NSObject *v5;
  _BOOL4 v6;
  const char *v7;
  id v9;
  uint8_t buf[4];
  ICQUpgradeFlowOptions *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v9 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (ICQUpgradeFlowOptions *)v9;
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_DWORD *)buf = 138412290;
      v11 = v4;
      v7 = "Caught error (%@) serializing flowOptions";
LABEL_6:
      _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, v7, buf, 0xCu);
    }
  }
  else if (v6)
  {
    *(_DWORD *)buf = 138412290;
    v11 = self;
    v7 = "flowOptions %@ encoded successfully";
    goto LABEL_6;
  }

  return v3;
}

+ (id)flowOptionsFromData:(id)a3
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  _BOOL4 v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  id v12;
  uint8_t buf[4];
  NSObject *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (v3)
  {
    v12 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v3, &v12);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v12;
    _ICQGetLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        *(_DWORD *)buf = 138412546;
        v14 = v5;
        v15 = 2112;
        v16 = v3;
        v8 = "Caught error (%@) unserializing flowOptions data (%@)";
        v9 = v6;
        v10 = 22;
LABEL_10:
        _os_log_impl(&dword_21F2CC000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
      }
    }
    else if (v7)
    {
      *(_DWORD *)buf = 138412290;
      v14 = v4;
      v8 = "Successfully formed FlowOptions: %@";
      v9 = v6;
      v10 = 12;
      goto LABEL_10;
    }

    goto LABEL_12;
  }
  _ICQGetLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21F2CC000, v5, OS_LOG_TYPE_DEFAULT, "flow options is nil", buf, 2u);
  }
  v4 = 0;
LABEL_12:

  return v4;
}

@end
