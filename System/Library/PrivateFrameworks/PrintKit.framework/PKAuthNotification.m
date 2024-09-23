@implementation PKAuthNotification

- (unint64_t)_makeFlags
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKAuthNotification;
  v3 = -[PKNotification _makeFlags](&v7, sel__makeFlags);
  -[PKAuthNotification usernameField](self, "usernameField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = 0x20000;
  if (!v4)
    v5 = 0x10000;
  return v5 | v3;
}

- (id)_makeDict
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;
  void *v14;
  _QWORD v15[2];
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v13.receiver = self;
  v13.super_class = (Class)PKAuthNotification;
  -[PKNotification _makeDict](&v13, sel__makeDict);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[PKAuthNotification usernameField](self, "usernameField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = v5 == 0;

  if ((_DWORD)v3)
  {
    PKLocalizedString(CFSTR("password"), "Password placeholder text");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  PKLocalizedString(CFSTR("user name"), "Username placeholder text");
  v6 = objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  PKLocalizedString(CFSTR("password"), "Password placeholder text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKAuthNotification defaultUsername](self, "defaultUsername");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = v9 == 0;

  if ((v6 & 1) == 0)
  {
    -[PKAuthNotification defaultUsername](self, "defaultUsername");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BDBD728]);

LABEL_5:
  }
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, *MEMORY[0x24BDBD720]);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BEB0EB8]);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BEB0EC0]);

  return v4;
}

- (void)_interpretResult:(unint64_t)a3 responseDict:(id)a4
{
  NSLog(CFSTR("Auth result here"), a2, a3, a4);
}

- (NSURLCredential)credential
{
  return (NSURLCredential *)objc_getProperty(self, a2, 88, 1);
}

- (NSString)usernameField
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setUsernameField:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSString)passwordField
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setPasswordField:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSString)defaultUsername
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setDefaultUsername:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultUsername, 0);
  objc_storeStrong((id *)&self->_passwordField, 0);
  objc_storeStrong((id *)&self->_usernameField, 0);
  objc_storeStrong((id *)&self->_credential, 0);
}

@end
