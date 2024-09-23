@implementation TIUserModelCounter

- (TIUserModelCounter)initWithName:(id)a3
{
  id v5;
  TIUserModelCounter *v6;
  TIUserModelCounter *v7;
  NSDate *creationDate;
  NSDate *lastUpdateDate;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TIUserModelCounter;
  v6 = -[TIUserModelCounter init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_name, a3);
    v7->_persisted = 0;
    creationDate = v7->_creationDate;
    v7->_creationDate = 0;

    lastUpdateDate = v7->_lastUpdateDate;
    v7->_lastUpdateDate = 0;

    v7->_wasReset = 0;
  }

  return v7;
}

- (TIUserModelCounter)initWithName:(id)a3 initialCount:(id)a4 creationDate:(id)a5 lastUpdateDate:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  TIUserModelCounter *v15;
  TIUserModelCounter *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)TIUserModelCounter;
  v15 = -[TIUserModelCounter init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_name, a3);
    v16->_persisted = objc_msgSend(v12, "unsignedIntegerValue");
    objc_storeStrong((id *)&v16->_creationDate, a5);
    objc_storeStrong((id *)&v16->_lastUpdateDate, a6);
    v16->_wasReset = 0;
  }

  return v16;
}

- (void)doPersist:(id)a3 forDate:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (self->_wasReset)
  {
    objc_msgSend((id)kUserModelDatabasePrefix, "stringByAppendingString:", self->_name);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", LODWORD(self->_current));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDurableValue:forKey:forDate:", v8, v7, v6);

    self->_persisted = self->_current;
    self->_current = 0;
    self->_wasReset = 0;
LABEL_5:

    goto LABEL_6;
  }
  if (self->_current)
  {
    objc_msgSend((id)kUserModelDatabasePrefix, "stringByAppendingString:", self->_name);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", LODWORD(self->_current));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "updateDurableValue:forKey:forDate:", v9, v7, v6);

    self->_persisted += self->_current;
    self->_current = 0;
    goto LABEL_5;
  }
LABEL_6:

}

- (NSNumber)count
{
  return (NSNumber *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", (LODWORD(self->_current) + LODWORD(self->_persisted)));
}

- (void)add:(int)a3
{
  self->_current += a3;
}

- (void)reset
{
  self->_persisted = 0;
  self->_current = 0;
  self->_wasReset = 1;
}

- (NSString)name
{
  return self->_name;
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (NSDate)lastUpdateDate
{
  return self->_lastUpdateDate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUpdateDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
