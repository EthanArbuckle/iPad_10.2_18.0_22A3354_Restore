@implementation SCLSettingsSyncContext

- (SCLSettingsSyncContext)init
{
  SCLSettingsSyncContext *v2;
  NSMutableArray *v3;
  NSMutableArray *recoveryHistory;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SCLSettingsSyncContext;
  v2 = -[SCLSettingsSyncContext init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    recoveryHistory = v2->_recoveryHistory;
    v2->_recoveryHistory = v3;

  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[SCLSettingsSyncContext syncStatus](self, "syncStatus"), CFSTR("syncStatus"));
  -[SCLSettingsSyncContext messageIdentifier](self, "messageIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("messageIdentifier"));

  -[SCLSettingsSyncContext error](self, "error");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("error"));

  -[SCLSettingsSyncContext recoveryHistory](self, "recoveryHistory");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("recoveryHistory"));

}

- (SCLSettingsSyncContext)initWithCoder:(id)a3
{
  id v4;
  SCLSettingsSyncContext *v5;
  uint64_t v6;
  NSString *messageIdentifier;
  uint64_t v8;
  NSError *error;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSMutableArray *recoveryHistory;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SCLSettingsSyncContext;
  v5 = -[SCLSettingsSyncContext init](&v17, sel_init);
  if (v5)
  {
    v5->_syncStatus = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("syncStatus"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("messageIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    messageIdentifier = v5->_messageIdentifier;
    v5->_messageIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error"));
    v8 = objc_claimAutoreleasedReturnValue();
    error = v5->_error;
    v5->_error = (NSError *)v8;

    v10 = (void *)MEMORY[0x24BDBCF20];
    v11 = objc_opt_class();
    objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("recoveryHistory"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "mutableCopy");
    recoveryHistory = v5->_recoveryHistory;
    v5->_recoveryHistory = (NSMutableArray *)v14;

  }
  return v5;
}

- (NSArray)recoveryHistory
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_recoveryHistory, "copy");
}

- (void)addRecoveryHistory:(unint64_t)a3
{
  NSMutableArray *recoveryHistory;
  void *v5;

  recoveryHistory = self->_recoveryHistory;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray insertObject:atIndex:](recoveryHistory, "insertObject:atIndex:", v5, 0);

  if ((unint64_t)-[NSMutableArray count](self->_recoveryHistory, "count") >= 0xB)
    -[NSMutableArray removeLastObject](self->_recoveryHistory, "removeLastObject");
}

- (void)clearRecoveryHistory
{
  -[NSMutableArray removeAllObjects](self->_recoveryHistory, "removeAllObjects");
}

- (unint64_t)syncStatus
{
  return self->_syncStatus;
}

- (void)setSyncStatus:(unint64_t)a3
{
  self->_syncStatus = a3;
}

- (NSString)messageIdentifier
{
  return self->_messageIdentifier;
}

- (void)setMessageIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_storeStrong((id *)&self->_error, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_messageIdentifier, 0);
  objc_storeStrong((id *)&self->_recoveryHistory, 0);
}

@end
