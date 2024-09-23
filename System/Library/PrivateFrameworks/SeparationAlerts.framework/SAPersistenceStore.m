@implementation SAPersistenceStore

- (BOOL)isEqual:(id)a3
{
  SAPersistenceStore *v4;
  SAPersistenceStore *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (SAPersistenceStore *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[SAPersistenceStore monitoringSessionRecord](self, "monitoringSessionRecord");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SAPersistenceStore monitoringSessionRecord](v5, "monitoringSessionRecord");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6 == v7)
      {
        v10 = 1;
      }
      else
      {
        -[SAPersistenceStore monitoringSessionRecord](self, "monitoringSessionRecord");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[SAPersistenceStore monitoringSessionRecord](v5, "monitoringSessionRecord");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqual:", v9);

      }
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SAPersistenceStore)initWithCoder:(id)a3
{
  id v4;
  SAPersistenceStore *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  NSMutableDictionary *monitoringSessionRecord;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)SAPersistenceStore;
  v5 = -[SAPersistenceStore init](&v14, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, v9, objc_opt_class(), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("MonitoringSessionRecord"));
    v11 = objc_claimAutoreleasedReturnValue();
    monitoringSessionRecord = v5->_monitoringSessionRecord;
    v5->_monitoringSessionRecord = (NSMutableDictionary *)v11;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_monitoringSessionRecord, CFSTR("MonitoringSessionRecord"));
}

- (NSMutableDictionary)monitoringSessionRecord
{
  return self->_monitoringSessionRecord;
}

- (void)setMonitoringSessionRecord:(id)a3
{
  objc_storeStrong((id *)&self->_monitoringSessionRecord, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monitoringSessionRecord, 0);
}

@end
