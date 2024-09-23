@implementation SXJSONObject

- (id)objectForLookupKey:(id *)a1
{
  id v3;
  os_unfair_lock_s *v4;

  v3 = a2;
  if (a1)
  {
    v4 = (os_unfair_lock_s *)(a1 + 1);
    os_unfair_lock_lock_with_options();
    objc_msgSend(a1[4], "objectForKey:", v3);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_unlock(v4);
  }

  return a1;
}

+ (id)jsonPropertyNameForObjCPropertyName:(id)a3
{
  return a3;
}

- (SXJSONObject)initWithJSONObject:(id)a3 andVersion:(id)a4
{
  id v7;
  id v8;
  SXJSONObject *v9;
  SXJSONObject *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *objectStorage;
  SXJSONObject *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v15.receiver = self;
    v15.super_class = (Class)SXJSONObject;
    v9 = -[SXJSONObject init](&v15, sel_init);
    v10 = v9;
    if (v9)
    {
      v9->_unfairLock._os_unfair_lock_opaque = 0;
      objc_storeStrong((id *)&v9->_specificationVersion, a4);
      objc_storeStrong((id *)&v10->_jsonDictionary, a3);
      v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      objectStorage = v10->_objectStorage;
      v10->_objectStorage = v11;

    }
    self = v10;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)storeObject:(id)a3 forLookupKey:(id)a4
{
  id v6;
  NSMutableDictionary *objectStorage;
  id v8;

  v8 = a3;
  v6 = a4;
  os_unfair_lock_lock_with_options();
  objectStorage = self->_objectStorage;
  if (v8)
    -[NSMutableDictionary setObject:forKey:](objectStorage, "setObject:forKey:", v8, v6);
  else
    -[NSMutableDictionary removeObjectForKey:](objectStorage, "removeObjectForKey:", v6);
  os_unfair_lock_unlock(&self->_unfairLock);

}

+ (void)unlock
{
  os_unfair_lock_unlock((os_unfair_lock_t)&unfairLock);
}

+ (void)lock
{
  os_unfair_lock_lock_with_options();
}

+ (id)propertyDefinitions
{
  if (+[SXJSONObject propertyDefinitions]::onceToken != -1)
    dispatch_once(&+[SXJSONObject propertyDefinitions]::onceToken, &__block_literal_global_13_0);
  return (id)+[SXJSONObject propertyDefinitions]::propertyDefinitions;
}

+ (id)protocolPropertyDefinitions
{
  if (+[SXJSONObject protocolPropertyDefinitions]::onceToken != -1)
    dispatch_once(&+[SXJSONObject protocolPropertyDefinitions]::onceToken, &__block_literal_global_14);
  return (id)+[SXJSONObject protocolPropertyDefinitions]::protocolPropertyDefinitions;
}

+ (id)propertyHashTable
{
  if (+[SXJSONObject propertyHashTable]::onceToken != -1)
    dispatch_once(&+[SXJSONObject propertyHashTable]::onceToken, &__block_literal_global_15);
  return (id)+[SXJSONObject propertyHashTable]::propertyHashTable;
}

- (SXJSONObject)init
{
  SXJSONObject *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SXJSONObject;
  result = -[SXJSONObject init](&v3, sel_init);
  if (result)
    result->_unfairLock._os_unfair_lock_opaque = 0;
  return result;
}

+ (id)objectValueClassBlockForPropertyWithName:(id)a3
{
  return 0;
}

+ (id)valueClassBlockForPropertyWithName:(id)a3
{
  return &__block_literal_global_16;
}

+ (id)purgeClassBlockForPropertyWithName:(id)a3
{
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  SXJSONObject *v4;
  NSDictionary *jsonDictionary;
  char v6;

  v4 = (SXJSONObject *)a3;
  if (v4 == self)
    goto LABEL_5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = 0;
    goto LABEL_7;
  }
  jsonDictionary = v4->_jsonDictionary;
  if (jsonDictionary == self->_jsonDictionary)
LABEL_5:
    v6 = 1;
  else
    v6 = -[NSDictionary isEqualToDictionary:](jsonDictionary, "isEqualToDictionary:");
LABEL_7:

  return v6;
}

+ (void)initialize
{
  objc_class *v2;

  if ((id)objc_opt_class() == a1)
  {
    unfairLock = 0;
    +[SXJSONPrimitives initializePrimitives](SXJSONPrimitives, "initializePrimitives");
  }
  v2 = (objc_class *)objc_opt_class();
  SXJSONObjectRuntimeGenerateAccessorsForClass(v2);
}

void __43__SXJSONObject_protocolPropertyDefinitions__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v1 = (void *)+[SXJSONObject protocolPropertyDefinitions]::protocolPropertyDefinitions;
  +[SXJSONObject protocolPropertyDefinitions]::protocolPropertyDefinitions = (uint64_t)v0;

}

void __35__SXJSONObject_propertyDefinitions__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v1 = (void *)+[SXJSONObject propertyDefinitions]::propertyDefinitions;
  +[SXJSONObject propertyDefinitions]::propertyDefinitions = (uint64_t)v0;

}

void __33__SXJSONObject_propertyHashTable__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v1 = (void *)+[SXJSONObject propertyHashTable]::propertyHashTable;
  +[SXJSONObject propertyHashTable]::propertyHashTable = (uint64_t)v0;

}

- (SXJSONObject)initWithJSONData:(id)a3 andVersion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  SXJSONObject *v10;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("InvalidJSON"), CFSTR("No JSON to parse"), 0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v12);
  }
  v16 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v6, 0, &v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v16;
  if (v9)
  {
    v13 = (void *)MEMORY[0x24BDBCE88];
    v17 = CFSTR("error");
    v18[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "exceptionWithName:reason:userInfo:", CFSTR("InvalidJSON"), CFSTR("Error while parsing JSON"), v14);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    objc_exception_throw(v15);
  }
  v10 = -[SXJSONObject initWithJSONObject:andVersion:](self, "initWithJSONObject:andVersion:", v8, v7);

  return v10;
}

+ (Class)classOverrideAtInitialization:(Class)a3 type:(id)a4
{
  return a3;
}

- (id)jsonData
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithJSONObject:andVersion:", self->_jsonDictionary, self->_specificationVersion);
}

+ (Class)classForProtocolProperty:(id)a3 withValue:(id)a4
{
  return 0;
}

- (void)storeValue:(id)a3 forLookupKey:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", CFSTR("NotImplemented"), CFSTR("Currently not implemented yet"), 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v7);
}

- (id)valueForLookupKey:(id)a3
{
  -[NSDictionary objectForKey:](self->_jsonDictionary, "objectForKey:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)JSONRepresentation
{
  return self->_jsonDictionary;
}

- (id)debugDescription
{
  return (id)-[NSDictionary debugDescription](self->_jsonDictionary, "debugDescription");
}

- (NSDictionary)jsonDictionary
{
  return self->_jsonDictionary;
}

- (NSString)specificationVersion
{
  return self->_specificationVersion;
}

- (NSMutableDictionary)objectStorage
{
  return self->_objectStorage;
}

- (os_unfair_lock_s)unfairLock
{
  return self->_unfairLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectStorage, 0);
  objc_storeStrong((id *)&self->_specificationVersion, 0);
  objc_storeStrong((id *)&self->_jsonDictionary, 0);
}

@end
