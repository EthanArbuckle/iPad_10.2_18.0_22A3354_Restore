@implementation PLGlobalKeyValueAttributes

+ (id)attributesWithKey:(id)a3 type:(signed __int16)a4
{
  return (id)objc_msgSend(a1, "attributesWithKey:type:includeInMigrationHistory:anyValueClass:", a3, a4, 1, 0);
}

+ (id)attributesWithKey:(id)a3 type:(signed __int16)a4 includeInMigrationHistory:(BOOL)a5 anyValueClass:(Class)a6
{
  _BOOL8 v7;
  uint64_t v8;
  id v10;
  void *v11;

  v7 = a5;
  v8 = a4;
  v10 = a3;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithKey:type:includeInMigrationHistory:anyValueClass:", v10, v8, v7, a6);

  return v11;
}

- (PLGlobalKeyValueAttributes)initWithKey:(id)a3 type:(signed __int16)a4 includeInMigrationHistory:(BOOL)a5 anyValueClass:(Class)a6
{
  id v11;
  PLGlobalKeyValueAttributes *v12;
  PLGlobalKeyValueAttributes *v13;

  v11 = a3;
  v12 = -[PLGlobalKeyValueAttributes init](self, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_key, a3);
    v13->_type = a4;
    v13->_includeInMigrationHistory = a5;
    objc_storeStrong((id *)&v13->_anyValueClass, a6);
  }

  return v13;
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
  objc_storeStrong((id *)&self->_key, a3);
}

- (signed)type
{
  return self->_type;
}

- (void)setType:(signed __int16)a3
{
  self->_type = a3;
}

- (BOOL)includeInMigrationHistory
{
  return self->_includeInMigrationHistory;
}

- (void)setIncludeInMigrationHistory:(BOOL)a3
{
  self->_includeInMigrationHistory = a3;
}

- (Class)anyValueClass
{
  return self->_anyValueClass;
}

- (void)setAnyValueClass:(Class)a3
{
  objc_storeStrong((id *)&self->_anyValueClass, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anyValueClass, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end
