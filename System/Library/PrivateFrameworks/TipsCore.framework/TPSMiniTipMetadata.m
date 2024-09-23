@implementation TPSMiniTipMetadata

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSMiniTipMetadata)initWithContent:(id)a3
{
  id v5;
  TPSMiniTipMetadata *v6;
  TPSMiniTipMetadata *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSMiniTipMetadata;
  v6 = -[TPSMiniTipMetadata init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_content, a3);
    v7->_customizationID = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  objc_msgSend(v4, "setCustomizationID:", -[TPSMiniTipMetadata customizationID](self, "customizationID"));
  -[TPSMiniTipMetadata error](self, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setError:", v5);

  -[TPSMiniTipMetadata userInfo](self, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInfo:", v6);

  -[TPSMiniTipMetadata content](self, "content");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContent:", v7);

  -[TPSMiniTipMetadata monitoringEvents](self, "monitoringEvents");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMonitoringEvents:", v8);

  return v4;
}

- (TPSMiniTipMetadata)initWithCoder:(id)a3
{
  id v4;
  TPSMiniTipMetadata *v5;
  uint64_t v6;
  NSError *error;
  void *v8;
  uint64_t v9;
  NSDictionary *userInfo;
  uint64_t v11;
  TPSDocument *content;
  uint64_t v13;
  TPSMonitoringEvents *monitoringEvents;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)TPSMiniTipMetadata;
  v5 = -[TPSMiniTipMetadata init](&v16, sel_init);
  if (v5)
  {
    v5->_customizationID = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("customizationID"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error"));
    v6 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v6;

    +[TPSTipStatus _userInfoClasses](TPSTipStatus, "_userInfoClasses");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("userInfo"));
    v9 = objc_claimAutoreleasedReturnValue();
    userInfo = v5->_userInfo;
    v5->_userInfo = (NSDictionary *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("content"));
    v11 = objc_claimAutoreleasedReturnValue();
    content = v5->_content;
    v5->_content = (TPSDocument *)v11;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("monitoringEvents"));
    v13 = objc_claimAutoreleasedReturnValue();
    monitoringEvents = v5->_monitoringEvents;
    v5->_monitoringEvents = (TPSMonitoringEvents *)v13;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[TPSMiniTipMetadata customizationID](self, "customizationID"), CFSTR("customizationID"));
  -[TPSMiniTipMetadata error](self, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("error"));

  -[TPSMiniTipMetadata userInfo](self, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("userInfo"));

  -[TPSMiniTipMetadata content](self, "content");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("content"));

  -[TPSMiniTipMetadata monitoringEvents](self, "monitoringEvents");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("monitoringEvents"));

}

- (NSString)identifier
{
  void *v2;
  void *v3;

  -[TPSMiniTipMetadata content](self, "content");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v9.receiver = self;
  v9.super_class = (Class)TPSMiniTipMetadata;
  -[TPSMiniTipMetadata description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  -[TPSMiniTipMetadata content](self, "content");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR(" %@ = %@\n"), CFSTR("content"), v7);

  return v5;
}

- (id)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v15.receiver = self;
  v15.super_class = (Class)TPSMiniTipMetadata;
  -[TPSMiniTipMetadata debugDescription](&v15, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  -[TPSMiniTipMetadata error](self, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[TPSMiniTipMetadata error](self, "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("  %@ = %@\n"), CFSTR("error"), v7);

  }
  -[TPSMiniTipMetadata userInfo](self, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[TPSMiniTipMetadata userInfo](self, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("  %@ = %@\n"), CFSTR("userInfo"), v9);

  }
  -[TPSMiniTipMetadata content](self, "content");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[TPSMiniTipMetadata content](self, "content");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("\n  %@ = %@\n"), CFSTR("content"), v11);

  }
  -[TPSMiniTipMetadata monitoringEvents](self, "monitoringEvents");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[TPSMiniTipMetadata monitoringEvents](self, "monitoringEvents");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendFormat:", CFSTR("\n  %@ = %@\n"), CFSTR("monitoringEvents"), v13);

  }
  return v5;
}

- (int64_t)customizationID
{
  return self->_customizationID;
}

- (void)setCustomizationID:(int64_t)a3
{
  self->_customizationID = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (TPSDocument)content
{
  return self->_content;
}

- (void)setContent:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (TPSMonitoringEvents)monitoringEvents
{
  return self->_monitoringEvents;
}

- (void)setMonitoringEvents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monitoringEvents, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
