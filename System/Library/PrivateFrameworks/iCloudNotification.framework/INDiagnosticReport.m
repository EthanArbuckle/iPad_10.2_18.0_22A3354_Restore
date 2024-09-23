@implementation INDiagnosticReport

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (INDiagnosticReport)initWithCoder:(id)a3
{
  id v4;
  INDiagnosticReport *v5;
  uint64_t v6;
  NSString *pushEnvironment;
  uint64_t v8;
  NSString *pushToken;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSArray *pushTopics;
  uint64_t v15;
  NSDate *nextHeartbeatDate;
  void *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)INDiagnosticReport;
  v5 = -[INDiagnosticReport init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pushEnvironment"));
    v6 = objc_claimAutoreleasedReturnValue();
    pushEnvironment = v5->_pushEnvironment;
    v5->_pushEnvironment = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pushToken"));
    v8 = objc_claimAutoreleasedReturnValue();
    pushToken = v5->_pushToken;
    v5->_pushToken = (NSString *)v8;

    v10 = (void *)MEMORY[0x24BDBCF20];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("pushTopics"));
    v13 = objc_claimAutoreleasedReturnValue();
    pushTopics = v5->_pushTopics;
    v5->_pushTopics = (NSArray *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("nextHeartbeatDate"));
    v15 = objc_claimAutoreleasedReturnValue();
    nextHeartbeatDate = v5->_nextHeartbeatDate;
    v5->_nextHeartbeatDate = (NSDate *)v15;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("disabled"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_disabled = objc_msgSend(v17, "BOOLValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *pushEnvironment;
  id v5;
  id v6;

  pushEnvironment = self->_pushEnvironment;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", pushEnvironment, CFSTR("pushEnvironment"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_pushToken, CFSTR("pushToken"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_pushTopics, CFSTR("pushTopics"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_nextHeartbeatDate, CFSTR("nextHeartbeatDate"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_disabled);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("disabled"));

}

- (NSString)pushEnvironment
{
  return self->_pushEnvironment;
}

- (void)setPushEnvironment:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)pushToken
{
  return self->_pushToken;
}

- (void)setPushToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSArray)pushTopics
{
  return self->_pushTopics;
}

- (void)setPushTopics:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDate)nextHeartbeatDate
{
  return self->_nextHeartbeatDate;
}

- (void)setNextHeartbeatDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)disabled
{
  return self->_disabled;
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextHeartbeatDate, 0);
  objc_storeStrong((id *)&self->_pushTopics, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);
  objc_storeStrong((id *)&self->_pushEnvironment, 0);
}

@end
