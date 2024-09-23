@implementation SURollbackSuggestionProcessInfo

- (SURollbackSuggestionProcessInfo)init
{
  return -[SURollbackSuggestionProcessInfo initWithProcessID:](self, "initWithProcessID:", 0);
}

- (SURollbackSuggestionProcessInfo)initWithProcessID:(id)a3
{
  id v5;
  SURollbackSuggestionProcessInfo *v6;
  SURollbackSuggestionProcessInfo *v7;
  NSString *processName;
  NSError *rollbackSuggestionError;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SURollbackSuggestionProcessInfo;
  v6 = -[SURollbackSuggestionProcessInfo init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_processID, a3);
    processName = v7->_processName;
    v7->_processName = 0;

    rollbackSuggestionError = v7->_rollbackSuggestionError;
    v7->_rollbackSuggestionError = 0;

  }
  return v7;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\n                ProcessID: %@\n                ProcessName: %@\n                RollbackSuggestionError: %@\n"), self->_processID, self->_processName, self->_rollbackSuggestionError);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)processName
{
  NSString *processName;
  NSString *v3;
  void *v6;
  void *v7;

  processName = self->_processName;
  if (!processName)
  {
    if (self->_processID)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v7 = v6;
        objc_msgSend(v6, "objectForInfoDictionaryKey:", *MEMORY[0x24BDBD280]);
        v3 = (NSString *)objc_claimAutoreleasedReturnValue();

        return v3;
      }
      processName = self->_processName;
    }
    else
    {
      processName = 0;
    }
  }
  v3 = processName;
  return v3;
}

- (SURollbackSuggestionProcessInfo)initWithCoder:(id)a3
{
  id v4;
  SURollbackSuggestionProcessInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SURollbackSuggestionProcessInfo;
  v5 = -[SURollbackSuggestionProcessInfo init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ProcessID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SURollbackSuggestionProcessInfo setProcessID:](v5, "setProcessID:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ProcessName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SURollbackSuggestionProcessInfo setProcessName:](v5, "setProcessName:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RollbackSuggestionError"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SURollbackSuggestionProcessInfo setRollbackSuggestionError:](v5, "setRollbackSuggestionError:", v8);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[SURollbackSuggestionProcessInfo processID](self, "processID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("ProcessID"));

  -[SURollbackSuggestionProcessInfo processName](self, "processName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("ProcessName"));

  -[SURollbackSuggestionProcessInfo rollbackSuggestionError](self, "rollbackSuggestionError");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("RollbackSuggestionError"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  SURollbackSuggestionProcessInfo *v4;
  void *v5;
  SURollbackSuggestionProcessInfo *v6;
  void *v7;
  void *v8;

  v4 = [SURollbackSuggestionProcessInfo alloc];
  -[SURollbackSuggestionProcessInfo processID](self, "processID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SURollbackSuggestionProcessInfo initWithProcessID:](v4, "initWithProcessID:", v5);

  -[SURollbackSuggestionProcessInfo processName](self, "processName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SURollbackSuggestionProcessInfo setProcessName:](v6, "setProcessName:", v7);

  -[SURollbackSuggestionProcessInfo rollbackSuggestionError](self, "rollbackSuggestionError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SURollbackSuggestionProcessInfo setRollbackSuggestionError:](v6, "setRollbackSuggestionError:", v8);

  return v6;
}

- (NSString)processID
{
  return self->_processID;
}

- (void)setProcessID:(id)a3
{
  objc_storeStrong((id *)&self->_processID, a3);
}

- (void)setProcessName:(id)a3
{
  objc_storeStrong((id *)&self->_processName, a3);
}

- (NSError)rollbackSuggestionError
{
  return self->_rollbackSuggestionError;
}

- (void)setRollbackSuggestionError:(id)a3
{
  objc_storeStrong((id *)&self->_rollbackSuggestionError, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rollbackSuggestionError, 0);
  objc_storeStrong((id *)&self->_processName, 0);
  objc_storeStrong((id *)&self->_processID, 0);
}

@end
