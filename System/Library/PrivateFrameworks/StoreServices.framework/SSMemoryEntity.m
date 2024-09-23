@implementation SSMemoryEntity

+ (id)anyInDatabase:(id)a3 predicate:(id)a4
{
  void *v4;
  id v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__60;
  v12 = __Block_byref_object_dispose__60;
  v13 = 0;
  v4 = (void *)objc_msgSend(a1, "queryWithDatabase:predicate:", a3, a4);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__SSMemoryEntity_SSSQLiteQuery__anyInDatabase_predicate___block_invoke;
  v7[3] = &unk_1E47BED68;
  v7[4] = &v8;
  objc_msgSend(v4, "enumerateMemoryEntitiesUsingBlock:", v7);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);
  return v5;
}

id __57__SSMemoryEntity_SSSQLiteQuery__anyInDatabase_predicate___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id result;

  result = a2;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  *a4 = 1;
  return result;
}

+ (id)queryWithDatabase:(id)a3 predicate:(id)a4
{
  return (id)objc_msgSend(a1, "queryWithDatabase:predicate:orderingProperties:", a3, a4, 0);
}

+ (id)queryWithDatabase:(id)a3 predicate:(id)a4 orderingProperties:(id)a5
{
  SSSQLiteQueryDescriptor *v9;
  SSSQLiteQuery *v10;

  v9 = objc_alloc_init(SSSQLiteQueryDescriptor);
  -[SSSQLiteQueryDescriptor setEntityClass:](v9, "setEntityClass:", objc_msgSend(a1, "databaseEntityClass"));
  -[SSSQLiteQueryDescriptor setMemoryEntityClass:](v9, "setMemoryEntityClass:", a1);
  -[SSSQLiteQueryDescriptor setOrderingProperties:](v9, "setOrderingProperties:", a5);
  -[SSSQLiteQueryDescriptor setPredicate:](v9, "setPredicate:", a4);
  v10 = -[SSSQLiteQuery initWithDatabase:descriptor:]([SSSQLiteQuery alloc], "initWithDatabase:descriptor:", a3, v9);

  return v10;
}

- (SSMemoryEntity)init
{
  SSMemoryEntity *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SSMemoryEntity;
  v2 = -[SSMemoryEntity init](&v4, sel_init);
  if (v2)
  {
    v2->_propertyValues = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v2->_externalPropertyValues = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  }
  return v2;
}

- (SSMemoryEntity)initWithDatabaseEntity:(id)a3 properties:(id)a4
{
  SSMemoryEntity *v6;
  SSMemoryEntity *v7;

  v6 = -[SSMemoryEntity init](self, "init");
  v7 = v6;
  if (v6)
  {
    -[SSMemoryEntity reloadFromDatabaseEntity:properties:](v6, "reloadFromDatabaseEntity:properties:", a3, a4);
    v7->_databaseID = objc_msgSend(a3, "persistentID");
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSMemoryEntity;
  -[SSMemoryEntity dealloc](&v3, sel_dealloc);
}

+ (Class)databaseEntityClass
{
  return (Class)objc_opt_class();
}

+ (id)defaultProperties
{
  return 0;
}

- (void)reloadFromDatabaseEntity:(id)a3 properties:(id)a4
{
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v7 = objc_msgSend(a4, "count");
  v8 = malloc_type_malloc(8 * v7, 0x80040B8603338uLL);
  if (v8)
  {
    v9 = v8;
    objc_msgSend(a4, "getObjects:range:", v8, 0, v7);
    v10 = malloc_type_malloc(8 * v7, 0x80040B8603338uLL);
    if (v10)
    {
      v11 = v10;
      objc_msgSend(a3, "getValues:forProperties:count:", v10, v9, v7);
      -[SSMemoryEntity setValues:forProperties:count:](self, "setValues:forProperties:count:", v11, v9, v7);
      free(v11);
    }
    free(v9);
  }
}

- (void)setExternalValuesWithDictionary:(id)a3
{
  -[NSMutableDictionary addEntriesFromDictionary:](self->_externalPropertyValues, "addEntriesFromDictionary:", a3);
}

- (void)setValue:(id)a3 forProperty:(id)a4
{
  id v4;
  id v5;

  v4 = a4;
  v5 = a3;
  -[SSMemoryEntity setValues:forProperties:count:](self, "setValues:forProperties:count:", &v5, &v4, 1);
}

- (void)setValues:(id *)a3 forProperties:(const void *)a4 count:(int64_t)a5
{
  int64_t v5;
  NSMutableDictionary *propertyValues;

  if (a5 >= 1)
  {
    v5 = a5;
    do
    {
      propertyValues = self->_propertyValues;
      if (*a3)
        -[NSMutableDictionary setObject:forKey:](propertyValues, "setObject:forKey:", *a3, *a4);
      else
        -[NSMutableDictionary removeObjectForKey:](propertyValues, "removeObjectForKey:", *a4);
      ++a4;
      ++a3;
      --v5;
    }
    while (v5);
  }
}

- (void)setValuesWithDictionary:(id)a3
{
  -[NSMutableDictionary addEntriesFromDictionary:](self->_propertyValues, "addEntriesFromDictionary:", a3);
}

- (void)setValue:(id)a3 forExternalProperty:(id)a4
{
  id v4;
  id v5;

  v4 = a4;
  v5 = a3;
  -[SSMemoryEntity setValues:forExternalProperties:count:](self, "setValues:forExternalProperties:count:", &v5, &v4, 1);
}

- (void)setValues:(id *)a3 forExternalProperties:(const void *)a4 count:(int64_t)a5
{
  int64_t v5;
  NSMutableDictionary *externalPropertyValues;

  if (a5 >= 1)
  {
    v5 = a5;
    do
    {
      externalPropertyValues = self->_externalPropertyValues;
      if (*a3)
        -[NSMutableDictionary setObject:forKey:](externalPropertyValues, "setObject:forKey:", *a3, *a4);
      else
        -[NSMutableDictionary removeObjectForKey:](externalPropertyValues, "removeObjectForKey:", *a4);
      ++a4;
      ++a3;
      --v5;
    }
    while (v5);
  }
}

- (id)valueForProperty:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_propertyValues, "objectForKey:", a3);
}

- (id)valueForExternalProperty:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_externalPropertyValues, "objectForKey:", a3);
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SSMemoryEntity;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %lld"), -[SSMemoryEntity description](&v3, sel_description), self->_databaseID);
}

- (unint64_t)hash
{
  return -[NSMutableDictionary hash](self->_propertyValues, "hash");
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v5;
  int64_t v6;

  v5 = objc_opt_class();
  if (v5 == objc_opt_class()
    && (v6 = -[SSMemoryEntity databaseID](self, "databaseID"), v6 == objc_msgSend(a3, "databaseID"))
    && -[NSDictionary isEqualToDictionary:](-[SSMemoryEntity propertyValues](self, "propertyValues"), "isEqualToDictionary:", objc_msgSend(a3, "propertyValues")))
  {
    return -[NSDictionary isEqualToDictionary:](-[SSMemoryEntity externalPropertyValues](self, "externalPropertyValues"), "isEqualToDictionary:", objc_msgSend(a3, "externalPropertyValues"));
  }
  else
  {
    return 0;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_QWORD *)(v4 + 8) = self->_databaseID;
  objc_msgSend(*(id *)(v4 + 16), "addEntriesFromDictionary:", self->_propertyValues);
  objc_msgSend(*(id *)(v4 + 24), "addEntriesFromDictionary:", self->_externalPropertyValues);
  return (id)v4;
}

- (int64_t)databaseID
{
  return self->_databaseID;
}

- (void)setDatabaseID:(int64_t)a3
{
  self->_databaseID = a3;
}

- (NSDictionary)propertyValues
{
  return &self->_propertyValues->super;
}

- (NSDictionary)externalPropertyValues
{
  return &self->_externalPropertyValues->super;
}

@end
