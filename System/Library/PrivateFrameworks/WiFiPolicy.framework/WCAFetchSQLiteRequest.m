@implementation WCAFetchSQLiteRequest

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ : %p "), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR("parameters: %@"), self->_parameters);
  objc_msgSend(v6, "appendFormat:", CFSTR("tableName: %@"), self->_tableName);
  objc_msgSend(v6, "appendFormat:", CFSTR("columnNames: %@"), self->_columnNames);
  objc_msgSend(v6, "appendFormat:", CFSTR("limit: %ld"), self->_limit);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (void)setParameters:(id)a3
{
  NSDictionary *v4;
  NSDictionary *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSDictionary *parameters;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = (NSDictionary *)a3;
  v5 = v4;
  if (v4)
  {
    v13 = 0u;
    v14 = 0u;
    v12 = 0u;
    -[NSDictionary allValues](v4, "allValues", 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      while (1)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        if (!--v8)
        {
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
          if (!v8)
            break;
        }
      }
    }

  }
  parameters = self->_parameters;
  self->_parameters = v5;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WCAFetchSQLiteRequest;
  v4 = a3;
  -[WCAFetchRequest encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_parameters, CFSTR("_parameters"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_tableName, CFSTR("_tableName"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_columnNames, CFSTR("_columnNames"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_limit, CFSTR("_limit"));

}

- (WCAFetchSQLiteRequest)initWithCoder:(id)a3
{
  id v4;
  WCAFetchSQLiteRequest *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSDictionary *parameters;
  uint64_t v12;
  NSString *tableName;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSArray *columnNames;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)WCAFetchSQLiteRequest;
  v5 = -[WCAFetchRequest initWithCoder:](&v20, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("_parameters"));
    v10 = objc_claimAutoreleasedReturnValue();
    parameters = v5->_parameters;
    v5->_parameters = (NSDictionary *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_tableName"));
    v12 = objc_claimAutoreleasedReturnValue();
    tableName = v5->_tableName;
    v5->_tableName = (NSString *)v12;

    v14 = (void *)MEMORY[0x1E0C99E60];
    v15 = objc_opt_class();
    objc_msgSend(v14, "setWithObjects:", v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("_columnNames"));
    v17 = objc_claimAutoreleasedReturnValue();
    columnNames = v5->_columnNames;
    v5->_columnNames = (NSArray *)v17;

    v5->_limit = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_limit"));
  }

  return v5;
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (NSString)tableName
{
  return self->_tableName;
}

- (void)setTableName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)columnNames
{
  return self->_columnNames;
}

- (void)setColumnNames:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int64_t)limit
{
  return self->_limit;
}

- (void)setLimit:(int64_t)a3
{
  self->_limit = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columnNames, 0);
  objc_storeStrong((id *)&self->_tableName, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
}

@end
