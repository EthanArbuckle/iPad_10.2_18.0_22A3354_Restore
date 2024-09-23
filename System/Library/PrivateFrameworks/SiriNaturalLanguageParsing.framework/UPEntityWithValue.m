@implementation UPEntityWithValue

- (UPEntityWithValue)initWithType:(id)a3 entityName:(id)a4 entityValue:(id)a5
{
  id v8;
  id v9;
  id v10;
  UPEntityWithValue *v11;
  uint64_t v12;
  NSString *entityType;
  uint64_t v14;
  NSString *entityName;
  uint64_t v16;
  NSString *entityValue;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)UPEntityWithValue;
  v11 = -[UPEntityWithValue init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    entityType = v11->_entityType;
    v11->_entityType = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    entityName = v11->_entityName;
    v11->_entityName = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    entityValue = v11->_entityValue;
    v11->_entityValue = (NSString *)v16;

  }
  return v11;
}

- (BOOL)isEqualToEntityWithValue:(id)a3
{
  id v4;
  NSString *entityType;
  void *v6;
  NSString *entityName;
  void *v8;
  NSString *entityValue;
  void *v10;
  BOOL v11;

  v4 = a3;
  entityType = self->_entityType;
  objc_msgSend(v4, "entityType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSString isEqualToString:](entityType, "isEqualToString:", v6))
  {
    entityName = self->_entityName;
    objc_msgSend(v4, "entityName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSString isEqualToString:](entityName, "isEqualToString:", v8))
    {
      entityValue = self->_entityValue;
      objc_msgSend(v4, "entityValue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[NSString isEqualToString:](entityValue, "isEqualToString:", v10);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UPEntityWithValue[entityType: %@, entityName: %@, entityValue:%@]"), self->_entityType, self->_entityName, self->_entityValue);
}

- (NSString)entityType
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)entityName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)entityValue
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityValue, 0);
  objc_storeStrong((id *)&self->_entityName, 0);
  objc_storeStrong((id *)&self->_entityType, 0);
}

@end
