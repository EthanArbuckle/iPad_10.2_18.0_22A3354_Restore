@implementation PLJournalEntryPayloadProperty

- (PLJournalEntryPayloadProperty)initWithKey:(id)a3 andType:(unint64_t)a4 subRelationshipProperties:(id)a5 subRelationshipEntityName:(id)a6 requiresConversion:(BOOL)a7 relatedEntityPropertyNames:(id)a8 isUUIDKey:(BOOL)a9 isToManySubRelationship:(BOOL)a10 shouldPrefetchRelationship:(BOOL)a11 isAdditionalEntityName:(BOOL)a12 info:(id)a13
{
  id v19;
  id v20;
  id v21;
  PLJournalEntryPayloadProperty *v22;
  PLJournalEntryPayloadProperty *v23;
  id v26;
  id v27;
  objc_super v28;

  v19 = a3;
  v20 = a5;
  v21 = a6;
  v27 = a8;
  v26 = a13;
  v28.receiver = self;
  v28.super_class = (Class)PLJournalEntryPayloadProperty;
  v22 = -[PLJournalEntryPayloadProperty init](&v28, sel_init);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_key, a3);
    v23->_type = a4;
    objc_storeStrong((id *)&v23->_subRelationshipProperties, a5);
    objc_storeStrong((id *)&v23->_subRelationshipEntityName, a6);
    v23->_requiresConversion = a7;
    objc_storeStrong((id *)&v23->_relatedEntityPropertyNames, a8);
    v23->_isUUIDKey = a9;
    v23->_isToManySubRelationship = a10;
    v23->_shouldPrefetchRelationship = a11;
    v23->_isAdditionalEntityName = a12;
    objc_storeStrong((id *)&v23->_info, a13);
  }

  return v23;
}

- (BOOL)isEqualToKey:(id)a3
{
  return -[NSString isEqualToString:](self->_key, "isEqualToString:", a3);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[key: %@, type: %lu, isUUIDKey: %d, requiresConversion: %d, relationPropetyNames: %@  subRelationshipProperties: %@]"), self->_key, self->_type, self->_isUUIDKey, self->_requiresConversion, self->_relatedEntityPropertyNames, self->_subRelationshipProperties);
}

- (BOOL)requiresConversion
{
  BOOL result;
  int64_t type;

  if (self->_requiresConversion)
    return 1;
  result = 0;
  type = self->_type;
  if (type <= 1799)
  {
    if (type && type != 1100 && type != 1200)
      return result;
    return 1;
  }
  if (type == 1800 || type == 2100 || type == 2000)
    return 1;
  return result;
}

- (BOOL)hasSourceObjectValue
{
  void *v3;
  BOOL v4;
  void *v5;

  -[PLJournalEntryPayloadProperty key](self, "key");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 || -[PLJournalEntryPayloadProperty isUUIDKey](self, "isUUIDKey"))
  {
    v4 = 1;
  }
  else
  {
    -[PLJournalEntryPayloadProperty subRelationshipProperties](self, "subRelationshipProperties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

- (NSString)key
{
  return self->_key;
}

- (unint64_t)type
{
  return self->_type;
}

- (BOOL)isUUIDKey
{
  return self->_isUUIDKey;
}

- (NSSet)relatedEntityPropertyNames
{
  return self->_relatedEntityPropertyNames;
}

- (NSDictionary)subRelationshipProperties
{
  return self->_subRelationshipProperties;
}

- (BOOL)shouldPrefetchRelationship
{
  return self->_shouldPrefetchRelationship;
}

- (BOOL)isToManySubRelationship
{
  return self->_isToManySubRelationship;
}

- (NSString)subRelationshipEntityName
{
  return self->_subRelationshipEntityName;
}

- (BOOL)isAdditionalEntityName
{
  return self->_isAdditionalEntityName;
}

- (PLJournalEntryPayloadProperty)parentProperty
{
  return self->_parentProperty;
}

- (void)setParentProperty:(id)a3
{
  objc_storeStrong((id *)&self->_parentProperty, a3);
}

- (PLJournalEntryPayloadPropertyInfo)info
{
  return self->_info;
}

- (BOOL)isOptional
{
  return self->_optional;
}

- (void)setOptional:(BOOL)a3
{
  self->_optional = a3;
}

- (id)defaultValue
{
  return self->_defaultValue;
}

- (void)setDefaultValue:(id)a3
{
  objc_storeStrong(&self->_defaultValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_defaultValue, 0);
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_parentProperty, 0);
  objc_storeStrong((id *)&self->_subRelationshipEntityName, 0);
  objc_storeStrong((id *)&self->_subRelationshipProperties, 0);
  objc_storeStrong((id *)&self->_relatedEntityPropertyNames, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

+ (id)payloadPropertyForUUID
{
  uint64_t v3;

  LODWORD(v3) = 65537;
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithKey:andType:subRelationshipProperties:subRelationshipEntityName:requiresConversion:relatedEntityPropertyNames:isUUIDKey:isToManySubRelationship:shouldPrefetchRelationship:isAdditionalEntityName:info:", 0, 0, 0, 0, 0, 0, v3, 0);
}

+ (id)payloadPropertyWithKey:(id)a3 relatedEntityPropertyNames:(id)a4 shouldPrefetchRelationship:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v12;

  v8 = a4;
  v9 = a3;
  BYTE3(v12) = 0;
  BYTE2(v12) = a5;
  LOWORD(v12) = 0;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithKey:andType:subRelationshipProperties:subRelationshipEntityName:requiresConversion:relatedEntityPropertyNames:isUUIDKey:isToManySubRelationship:shouldPrefetchRelationship:isAdditionalEntityName:info:", v9, 0, 0, 0, 1, v8, v12, 0);

  return v10;
}

+ (id)payloadPropertyWithKey:(id)a3 andType:(unint64_t)a4 info:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v12;

  v8 = a5;
  v9 = a3;
  LODWORD(v12) = 0x10000;
  v10 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithKey:andType:subRelationshipProperties:subRelationshipEntityName:requiresConversion:relatedEntityPropertyNames:isUUIDKey:isToManySubRelationship:shouldPrefetchRelationship:isAdditionalEntityName:info:", v9, a4, 0, 0, 0, 0, v12, v8);

  return v10;
}

+ (id)payloadPropertyWithKey:(id)a3 andType:(unint64_t)a4 requiresConversion:(BOOL)a5 info:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;
  uint64_t v14;

  v6 = a5;
  v10 = a6;
  v11 = a3;
  LODWORD(v14) = 0x10000;
  v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithKey:andType:subRelationshipProperties:subRelationshipEntityName:requiresConversion:relatedEntityPropertyNames:isUUIDKey:isToManySubRelationship:shouldPrefetchRelationship:isAdditionalEntityName:info:", v11, a4, 0, 0, v6, 0, v14, v10);

  return v12;
}

+ (id)payloadPropertyWithKey:(id)a3 subRelationshipProperties:(id)a4 subRelationshipEntityName:(id)a5 isToMany:(BOOL)a6 isAdditionalEntityName:(BOOL)a7 info:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v20;

  v14 = a8;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  BYTE3(v20) = a7;
  BYTE2(v20) = 1;
  BYTE1(v20) = a6;
  LOBYTE(v20) = 0;
  v18 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithKey:andType:subRelationshipProperties:subRelationshipEntityName:requiresConversion:relatedEntityPropertyNames:isUUIDKey:isToManySubRelationship:shouldPrefetchRelationship:isAdditionalEntityName:info:", v17, 0, v16, v15, 1, 0, v20, v14);

  return v18;
}

@end
