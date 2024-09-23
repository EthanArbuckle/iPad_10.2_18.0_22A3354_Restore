@implementation POUserRegistrationStatus

- (id)description
{
  const __CFString *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  _QWORD v18[8];
  _QWORD v19[9];

  v19[8] = *MEMORY[0x24BDAC8D0];
  if (self->_platformSSOEnabled)
    v3 = CFSTR("YES");
  else
    v3 = CFSTR("NO");
  v19[0] = v3;
  v18[0] = CFSTR("platformSSOEnabled");
  v18[1] = CFSTR("loginUserName");
  objc_msgSend(MEMORY[0x24BE72EA0], "maskName:", self->_loginUserName);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = CFSTR("nil");
  if (v4)
    v6 = (const __CFString *)v4;
  v19[1] = v6;
  v18[2] = CFSTR("authenticationMethod");
  objc_msgSend(MEMORY[0x24BE72E90], "stringForLoginType:", self->_authenticationMethod);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v7;
  v18[3] = CFSTR("userRegistrationStatus");
  +[POConstantUtil stringForRegistrationStatus:](POConstantUtil, "stringForRegistrationStatus:", self->_userRegistrationStatus);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (self->_actionButtonEnabled)
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  v19[3] = v8;
  v19[4] = v10;
  v18[4] = CFSTR("actionButtonEnabled");
  v18[5] = CFSTR("actionButtonAction");
  +[POConstantUtil stringForUserAction:](POConstantUtil, "stringForUserAction:", self->_actionButtonAction);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[5] = v11;
  v18[6] = CFSTR("userTokenStatus");
  +[POConstantUtil stringForTokenStatus:](POConstantUtil, "stringForTokenStatus:", self->_userTokenStatus);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  v18[7] = CFSTR("authenticateButtonEnabled");
  if (self->_authenticateButtonEnabled)
    v14 = CFSTR("YES");
  else
    v14 = CFSTR("NO");
  v19[6] = v12;
  v19[7] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v19, v18, 8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "description");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (POUserRegistrationStatus)initWithCoder:(id)a3
{
  id v4;
  POUserRegistrationStatus *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSString *loginUserName;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)POUserRegistrationStatus;
  v5 = -[POUserRegistrationStatus init](&v32, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_isPlatformSSOEnabled);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_platformSSOEnabled = objc_msgSend(v8, "BOOLValue");

    v9 = objc_opt_class();
    NSStringFromSelector(sel_loginUserName);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, v10);
    v11 = objc_claimAutoreleasedReturnValue();
    loginUserName = v5->_loginUserName;
    v5->_loginUserName = (NSString *)v11;

    v13 = objc_opt_class();
    NSStringFromSelector(sel_authenticationMethod);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_authenticationMethod = (int)objc_msgSend(v15, "intValue");

    v16 = objc_opt_class();
    NSStringFromSelector(sel_userRegistrationStatus);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_userRegistrationStatus = (int)objc_msgSend(v18, "intValue");

    v19 = objc_opt_class();
    NSStringFromSelector(sel_isActionButtonEnabled);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_actionButtonEnabled = objc_msgSend(v21, "BOOLValue");

    v22 = objc_opt_class();
    NSStringFromSelector(sel_actionButtonAction);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_actionButtonAction = (int)objc_msgSend(v24, "intValue");

    v25 = objc_opt_class();
    NSStringFromSelector(sel_userTokenStatus);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_userTokenStatus = (int)objc_msgSend(v27, "intValue");

    v28 = objc_opt_class();
    NSStringFromSelector(sel_isAuthenticateButtonEnabled);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_authenticateButtonEnabled = objc_msgSend(v30, "BOOLValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  _BOOL8 platformSSOEnabled;
  id v6;
  void *v7;
  void *v8;
  NSString *loginUserName;
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
  id v22;

  v4 = (void *)MEMORY[0x24BDD16E0];
  platformSSOEnabled = self->_platformSSOEnabled;
  v6 = a3;
  objc_msgSend(v4, "numberWithBool:", platformSSOEnabled);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_isPlatformSSOEnabled);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, v8);

  loginUserName = self->_loginUserName;
  NSStringFromSelector(sel_loginUserName);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", loginUserName, v10);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_authenticationMethod);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_authenticationMethod);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v11, v12);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_userRegistrationStatus);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_userRegistrationStatus);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v13, v14);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_actionButtonEnabled);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_isActionButtonEnabled);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v15, v16);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_actionButtonAction);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_actionButtonAction);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v17, v18);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_userTokenStatus);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_userTokenStatus);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v19, v20);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_authenticateButtonEnabled);
  v22 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_isAuthenticateButtonEnabled);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v22, v21);

}

- (BOOL)isPlatformSSOEnabled
{
  return self->_platformSSOEnabled;
}

- (void)setPlatformSSOEnabled:(BOOL)a3
{
  self->_platformSSOEnabled = a3;
}

- (NSString)loginUserName
{
  return self->_loginUserName;
}

- (void)setLoginUserName:(id)a3
{
  objc_storeStrong((id *)&self->_loginUserName, a3);
}

- (int64_t)authenticationMethod
{
  return self->_authenticationMethod;
}

- (void)setAuthenticationMethod:(int64_t)a3
{
  self->_authenticationMethod = a3;
}

- (int64_t)userRegistrationStatus
{
  return self->_userRegistrationStatus;
}

- (void)setUserRegistrationStatus:(int64_t)a3
{
  self->_userRegistrationStatus = a3;
}

- (BOOL)isActionButtonEnabled
{
  return self->_actionButtonEnabled;
}

- (void)setActionButtonEnabled:(BOOL)a3
{
  self->_actionButtonEnabled = a3;
}

- (int64_t)actionButtonAction
{
  return self->_actionButtonAction;
}

- (void)setActionButtonAction:(int64_t)a3
{
  self->_actionButtonAction = a3;
}

- (int64_t)userTokenStatus
{
  return self->_userTokenStatus;
}

- (void)setUserTokenStatus:(int64_t)a3
{
  self->_userTokenStatus = a3;
}

- (BOOL)isAuthenticateButtonEnabled
{
  return self->_authenticateButtonEnabled;
}

- (void)setAuthenticateButtonEnabled:(BOOL)a3
{
  self->_authenticateButtonEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loginUserName, 0);
}

@end
