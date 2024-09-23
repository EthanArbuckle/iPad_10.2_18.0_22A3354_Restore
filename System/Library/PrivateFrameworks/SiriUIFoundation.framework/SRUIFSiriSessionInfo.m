@implementation SRUIFSiriSessionInfo

- (id)setAssistantVersionAndGenerateLightweightInfo:(id)a3
{
  return -[SRUIFSiriSessionInfo _setPropertyValue:withSelector:](self, "_setPropertyValue:withSelector:", a3, sel_setAssistantVersion_);
}

- (id)setActiveAccountAndGenerateLightweightInfo:(id)a3
{
  return -[SRUIFSiriSessionInfo _setPropertyValue:withSelector:](self, "_setPropertyValue:withSelector:", a3, sel_setActiveAccount_);
}

- (id)setUserAccountCountGenerateLightweightInfo:(int64_t)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRUIFSiriSessionInfo _setPropertyValue:withSelector:](self, "_setPropertyValue:withSelector:", v4, sel_setUserAccountCount_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_setPropertyValue:(id)a3 withSelector:(SEL)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[SRUIFSiriSessionInfo _strippedInfo](self, "_strippedInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "performSelector:withObject:", a4, v6);

  if (!-[SRUIFSiriSessionInfo applyInfo:](self, "applyInfo:", v7))
  {

    v7 = 0;
  }
  return v7;
}

- (BOOL)applyInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  NSNumber *v10;
  NSNumber *userAccountCount;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRUIFSiriSessionInfo identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    objc_msgSend(v4, "assistantVersion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_storeStrong((id *)&self->_assistantVersion, v8);
    objc_msgSend(v4, "activeAccount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
      objc_storeStrong((id *)&self->_activeAccount, v9);
    objc_msgSend(v4, "userAccountCount");
    v10 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    userAccountCount = self->_userAccountCount;
    self->_userAccountCount = v10;

  }
  return v7;
}

- (id)_strippedInfo
{
  return -[SRUIFSiriSessionInfo _initWithIdentifier:]([SRUIFSiriSessionInfo alloc], "_initWithIdentifier:", self->_identifier);
}

- (SRUIFSiriSessionInfo)init
{
  void *v3;
  void *v4;
  SRUIFSiriSessionInfo *v5;

  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[SRUIFSiriSessionInfo _initWithIdentifier:](self, "_initWithIdentifier:", v4);

  return v5;
}

- (id)_initWithIdentifier:(id)a3
{
  id v5;
  SRUIFSiriSessionInfo *v6;
  SRUIFSiriSessionInfo *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SRUIFSiriSessionInfo;
  v6 = -[SRUIFSiriSessionInfo init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_identifier, a3);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v19;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      -[SRUIFSiriSessionInfo identifier](self, "identifier");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "identifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v3, "isEqual:", v4))
      {
        v9 = 0;
        goto LABEL_16;
      }
    }
    objc_msgSend(v7, "assistantVersion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[SRUIFSiriSessionInfo assistantVersion](self, "assistantVersion");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "assistantVersion");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v11, "isEqual:", v5))
      {
        v9 = 0;
        goto LABEL_14;
      }
      v19 = v11;
    }
    objc_msgSend(v7, "activeAccount");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)v12;
      -[SRUIFSiriSessionInfo activeAccount](self, "activeAccount");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "activeAccount");
      v15 = v4;
      v16 = v3;
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v14, "isEqual:", v17);

      v3 = v16;
      v4 = v15;

    }
    else
    {
      v9 = 1;
    }
    v11 = v19;
    if (!v10)
    {
LABEL_15:
      if (!v8)
      {
LABEL_17:

        goto LABEL_18;
      }
LABEL_16:

      goto LABEL_17;
    }
LABEL_14:

    goto LABEL_15;
  }
  v9 = 0;
LABEL_18:

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  _QWORD v11[5];

  v11[4] = *MEMORY[0x24BDAC8D0];
  NSStringFromSelector(sel_identifier);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v11[0] = self->_identifier;
  NSStringFromSelector(sel_assistantVersion);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  v11[1] = self->_assistantVersion;
  NSStringFromSelector(sel_activeAccount);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  v11[2] = self->_activeAccount;
  NSStringFromSelector(sel_userAccountCount);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v6;
  v11[3] = self->_userAccountCount;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "description");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SRUIFSiriSessionInfo *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v5 = [SRUIFSiriSessionInfo alloc];
  v6 = (void *)-[NSString copyWithZone:](self->_identifier, "copyWithZone:", a3);
  v7 = -[SRUIFSiriSessionInfo _initWithIdentifier:](v5, "_initWithIdentifier:", v6);

  v8 = (void *)-[NSString copyWithZone:](self->_assistantVersion, "copyWithZone:", a3);
  objc_msgSend(v7, "setAssistantVersion:", v8);

  v9 = (void *)-[AFAccount copy](self->_activeAccount, "copy");
  objc_msgSend(v7, "setActiveAccount:", v9);

  objc_msgSend(v7, "setUserAccountCount:", self->_userAccountCount);
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SRUIFSiriSessionInfo)initWithCoder:(id)a3
{
  id v4;
  SRUIFSiriSessionInfo *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSString *identifier;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSString *assistantVersion;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  AFAccount *activeAccount;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  NSNumber *userAccountCount;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SRUIFSiriSessionInfo;
  v5 = -[SRUIFSiriSessionInfo init](&v23, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    NSStringFromSelector(sel_identifier);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, v7);
    v8 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v8;

    v10 = objc_opt_class();
    NSStringFromSelector(sel_assistantVersion);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v10, v11);
    v12 = objc_claimAutoreleasedReturnValue();
    assistantVersion = v5->_assistantVersion;
    v5->_assistantVersion = (NSString *)v12;

    v14 = objc_opt_class();
    NSStringFromSelector(sel_activeAccount);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v14, v15);
    v16 = objc_claimAutoreleasedReturnValue();
    activeAccount = v5->_activeAccount;
    v5->_activeAccount = (AFAccount *)v16;

    v18 = objc_opt_class();
    NSStringFromSelector(sel_userAccountCount);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v18, v19);
    v20 = objc_claimAutoreleasedReturnValue();
    userAccountCount = v5->_userAccountCount;
    v5->_userAccountCount = (NSNumber *)v20;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;
  void *v6;
  NSString *assistantVersion;
  void *v8;
  AFAccount *activeAccount;
  void *v10;
  NSNumber *userAccountCount;
  id v12;

  identifier = self->_identifier;
  v5 = a3;
  NSStringFromSelector(sel_identifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", identifier, v6);

  assistantVersion = self->_assistantVersion;
  NSStringFromSelector(sel_assistantVersion);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", assistantVersion, v8);

  activeAccount = self->_activeAccount;
  NSStringFromSelector(sel_activeAccount);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", activeAccount, v10);

  userAccountCount = self->_userAccountCount;
  NSStringFromSelector(sel_userAccountCount);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", userAccountCount, v12);

}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)assistantVersion
{
  return self->_assistantVersion;
}

- (void)setAssistantVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (AFAccount)activeAccount
{
  return self->_activeAccount;
}

- (void)setActiveAccount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)userAccountCount
{
  return self->_userAccountCount;
}

- (void)setUserAccountCount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userAccountCount, 0);
  objc_storeStrong((id *)&self->_activeAccount, 0);
  objc_storeStrong((id *)&self->_assistantVersion, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
