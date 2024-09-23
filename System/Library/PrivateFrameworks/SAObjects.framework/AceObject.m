@implementation AceObject

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (AceObject)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  AceObject *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AceObjectCodingKeyPlistData"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AceObjectCodingKeyAceId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AceObjectCodingKeyRefId"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AceObjectCodingKeyUsefulnessScore"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("AceObjectCodingKeyIsMutatingCommand"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[AceObject _initWithPlistData:aceId:refId:usefulnessScore:mutatingCommand:](self, "_initWithPlistData:aceId:refId:usefulnessScore:mutatingCommand:", v5, v6, v7, v8, v9);

  }
  else
  {
    objc_msgSend(v4, "decodePropertyListForKey:", CFSTR("AceObjectCodingKeyDictionary"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[AceObject initWithDictionary:](self, "initWithDictionary:", v6);
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  NSData *plistData;
  void *v5;
  uint64_t v6;
  id v7;

  plistData = self->_plistData;
  v7 = a3;
  if (plistData)
  {
    objc_msgSend(v7, "encodeObject:forKey:", plistData, CFSTR("AceObjectCodingKeyPlistData"));
    objc_msgSend(v7, "encodeObject:forKey:", self->_aceId, CFSTR("AceObjectCodingKeyAceId"));
    objc_msgSend(v7, "encodeObject:forKey:", self->_refId, CFSTR("AceObjectCodingKeyRefId"));
    objc_msgSend(v7, "encodeObject:forKey:", self->_usefulnessScore, CFSTR("AceObjectCodingKeyUsefulnessScore"));
    objc_msgSend(v7, "encodeObject:forKey:", self->_mutatingCommand, CFSTR("AceObjectCodingKeyIsMutatingCommand"));
    v5 = v7;
  }
  else
  {
    -[AceObject dictionary](self, "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("AceObjectCodingKeyDictionary"));

    v5 = (void *)v6;
  }

}

+ (id)aceObjectWithGenericCommand:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "aceObjectWithDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)aceObjectWithGenericCommand:(id)a3 context:(id)a4
{
  return +[AceObject newAceObjectWithGenericCommand:context:](AceObject, "newAceObjectWithGenericCommand:context:", a3, a4);
}

+ (id)aceObjectWithDictionary:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  objc_msgSend(a1, "_aceObjectWithMutableDictionary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)aceObjectWithDictionary:(id)a3 context:(id)a4
{
  return +[AceObject newAceObjectWithDictionary:context:](AceObject, "newAceObjectWithDictionary:context:", a3, a4);
}

+ (id)newAceObjectWithGenericCommand:(id)a3 context:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  objc_msgSend(a3, "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[AceObject newAceObjectWithDictionary:context:](AceObject, "newAceObjectWithDictionary:context:", v6, v5);

  return v7;
}

+ (id)newAceObjectWithDictionary:(id)a3 context:(id)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  v5 = +[AceObject _newAceObjectWithMutableDictionary:](AceObject, "_newAceObjectWithMutableDictionary:", v4);

  return v5;
}

+ (id)_aceObjectWithMutableDictionary:(id)a3 context:(id)a4
{
  return +[AceObject _newAceObjectWithMutableDictionary:](AceObject, "_newAceObjectWithMutableDictionary:", a3, a4);
}

+ (id)_newAceObjectWithMutableDictionary:(id)a3
{
  objc_msgSend(a1, "_aceObjectWithMutableDictionary:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_aceObjectWithMutableDictionary:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  objc_class *v9;
  SAGenericCommand *v10;

  v3 = a3;
  objc_msgSend(v3, "objectForKey:", CFSTR("$group"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("$class"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = 0;
  if (v4 && v5)
  {
    +[BasicAceContext sharedBasicAceContext](BasicAceContext, "sharedBasicAceContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_class *)objc_msgSend(v8, "classWithClassName:group:", v6, v4);

    v10 = (SAGenericCommand *)[v9 alloc];
    if (!v10)
      v10 = [SAGenericCommand alloc];
    v7 = -[AceObject _initWithMutableDictionary:](v10, "_initWithMutableDictionary:", v3);
  }

  return v7;
}

+ (id)aceObjectArrayWithDictionaryArray:(id)a3 baseClass:(Class)a4
{
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__AceObject_aceObjectArrayWithDictionaryArray_baseClass___block_invoke;
  v5[3] = &__block_descriptor_48_e33___AceObject_16__0__NSDictionary_8lu40l8;
  v5[4] = a1;
  v5[5] = a4;
  objc_msgSend(a3, "_sa_mappedArrayWithBlock:", v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __57__AceObject_aceObjectArrayWithDictionaryArray_baseClass___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "aceObjectWithDictionary:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v5 = *(_QWORD *)(a1 + 40);
    v6 = objc_opt_class();
    NSLog(CFSTR("Unexpected Object (expected %@, got %@) ... %@"), v5, v6, v3);

    v4 = 0;
  }

  return v4;
}

+ (id)aceObjectDictionaryWithDictionary:(id)a3 baseClass:(Class)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;
  Class v13;

  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__AceObject_aceObjectDictionaryWithDictionary_baseClass___block_invoke;
  v10[3] = &unk_1E4C7BEE8;
  v12 = a1;
  v13 = a4;
  v11 = v6;
  v7 = v6;
  objc_msgSend(v7, "_sa_mappedDictionaryWithBlock:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __57__AceObject_aceObjectDictionaryWithDictionary_baseClass___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 40), "aceObjectWithDictionary:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v3 = *(_QWORD *)(a1 + 48);
    v4 = objc_opt_class();
    NSLog(CFSTR("Unexpected Object (expected %@, got %@) ... %@"), v3, v4, *(_QWORD *)(a1 + 32));

    v2 = 0;
  }
  return v2;
}

+ (id)aceObjectArrayWithDictionaryArray:(id)a3 baseProtocol:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v6 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__AceObject_aceObjectArrayWithDictionaryArray_baseProtocol___block_invoke;
  v10[3] = &unk_1E4C7BF10;
  v11 = v6;
  v12 = a1;
  v7 = v6;
  objc_msgSend(a3, "_sa_mappedArrayWithBlock:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __60__AceObject_aceObjectArrayWithDictionaryArray_baseProtocol___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 40), "aceObjectWithDictionary:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "conformsToProtocol:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    NSStringFromProtocol(*(Protocol **)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_class();
    NSLog(CFSTR("Unexpected Object (expected %@, got %@) ... %@"), v5, v6, v3);

    v4 = 0;
  }

  return v4;
}

+ (id)aceObjectDictionaryWithDictionary:(id)a3 baseProtocol:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __60__AceObject_aceObjectDictionaryWithDictionary_baseProtocol___block_invoke;
  v12[3] = &unk_1E4C7BF38;
  v14 = v6;
  v15 = a1;
  v13 = v7;
  v8 = v6;
  v9 = v7;
  objc_msgSend(v8, "_sa_mappedDictionaryWithBlock:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __60__AceObject_aceObjectDictionaryWithDictionary_baseProtocol___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 48), "aceObjectWithDictionary:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "conformsToProtocol:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    NSStringFromProtocol(*(Protocol **)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_opt_class();
    NSLog(CFSTR("Unexpected Object (expected %@, got %@) ... %@"), v3, v4, *(_QWORD *)(a1 + 40));

    v2 = 0;
  }
  return v2;
}

+ (id)dictionaryArrayWithAceObjectArray:(id)a3
{
  return (id)objc_msgSend(a3, "_sa_mappedArrayWithBlock:", &__block_literal_global);
}

uint64_t __47__AceObject_dictionaryArrayWithAceObjectArray___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "dictionary");
}

+ (id)dictionaryWithAceObjectDictionary:(id)a3
{
  return (id)objc_msgSend(a3, "_sa_mappedDictionaryWithBlock:", &__block_literal_global_35);
}

uint64_t __47__AceObject_dictionaryWithAceObjectDictionary___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "dictionary");
}

+ (id)aceObjectWithPlistData:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = a3;
  if (v3)
  {
    if (_MergedGlobals != -1)
      dispatch_once(&_MergedGlobals, &__block_literal_global_234);
    v4 = (id)qword_1ED010DE0;
    objc_msgSend((id)objc_opt_class(), "_filteredDictionaryForKeySet:plistData:", v4, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(v5, "objectForKey:", CFSTR("$group"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("$class"));
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = 0;
  if (v6 && v7)
  {
    +[BasicAceContext sharedBasicAceContext](BasicAceContext, "sharedBasicAceContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_msgSend(v10, "classWithClassName:group:", v8, v6);
    if (!v11)
      v11 = (objc_class *)objc_opt_class();

    v12 = [v11 alloc];
    objc_msgSend(v5, "objectForKey:", CFSTR("aceId"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("refId"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("usefulnessScore"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("mutatingCommand"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v12, "_initWithPlistData:aceId:refId:usefulnessScore:mutatingCommand:", v3, v13, v14, v15, v16);

  }
  return v9;
}

- (AceObject)init
{
  void *v3;
  void *v4;
  void *v5;
  AceObject *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("$class");
  -[AceObject encodedClassName](self, "encodedClassName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = CFSTR("$group");
  v9[0] = v3;
  -[AceObject groupIdentifier](self, "groupIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[AceObject initWithDictionary:](self, "initWithDictionary:", v5);

  return v6;
}

- (id)_initWithPlistData:(id)a3 aceId:(id)a4 refId:(id)a5 usefulnessScore:(id)a6 mutatingCommand:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  AceObject *v17;
  uint64_t v18;
  NSData *plistData;
  uint64_t v20;
  NSString *aceId;
  uint64_t v22;
  NSString *refId;
  uint64_t v24;
  NSNumber *usefulnessScore;
  uint64_t v26;
  NSNumber *mutatingCommand;
  objc_super v29;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v29.receiver = self;
  v29.super_class = (Class)AceObject;
  v17 = -[AceObject init](&v29, sel_init);
  if (v17)
  {
    v18 = objc_msgSend(v12, "copy");
    plistData = v17->_plistData;
    v17->_plistData = (NSData *)v18;

    v20 = objc_msgSend(v13, "copy");
    aceId = v17->_aceId;
    v17->_aceId = (NSString *)v20;

    v22 = objc_msgSend(v14, "copy");
    refId = v17->_refId;
    v17->_refId = (NSString *)v22;

    v24 = objc_msgSend(v15, "copy");
    usefulnessScore = v17->_usefulnessScore;
    v17->_usefulnessScore = (NSNumber *)v24;

    v26 = objc_msgSend(v16, "copy");
    mutatingCommand = v17->_mutatingCommand;
    v17->_mutatingCommand = (NSNumber *)v26;

  }
  return v17;
}

- (AceObject)initWithDictionary:(id)a3
{
  void *v4;
  AceObject *v5;

  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  v5 = -[AceObject _initWithMutableDictionary:](self, "_initWithMutableDictionary:", v4);

  return v5;
}

- (AceObject)initWithDictionary:(id)a3 context:(id)a4
{
  void *v5;
  AceObject *v6;

  v5 = (void *)objc_msgSend(a3, "mutableCopy");
  v6 = -[AceObject _initWithMutableDictionary:](self, "_initWithMutableDictionary:", v5);

  return v6;
}

- (id)_initWithMutableDictionary:(id)a3
{
  id v5;
  AceObject *v6;
  AceObject *v7;
  void *v8;
  uint64_t v9;
  NSString *aceId;
  void *v11;
  uint64_t v12;
  NSString *refId;
  void *v14;
  uint64_t v15;
  NSNumber *usefulnessScore;
  void *v17;
  uint64_t v18;
  NSNumber *mutatingCommand;
  AceObject *v20;
  objc_super v22;

  v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)AceObject;
  v6 = -[AceObject init](&v22, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dict, a3);
    objc_msgSend(v5, "objectForKey:", CFSTR("aceId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "copy");
    aceId = v7->_aceId;
    v7->_aceId = (NSString *)v9;

    objc_msgSend(v5, "objectForKey:", CFSTR("refId"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "copy");
    refId = v7->_refId;
    v7->_refId = (NSString *)v12;

    objc_msgSend(v5, "objectForKey:", CFSTR("usefulnessScore"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "copy");
    usefulnessScore = v7->_usefulnessScore;
    v7->_usefulnessScore = (NSNumber *)v15;

    objc_msgSend(v5, "objectForKey:", CFSTR("mutatingCommand"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "copy");
    mutatingCommand = v7->_mutatingCommand;
    v7->_mutatingCommand = (NSNumber *)v18;

    v20 = v7;
  }

  return v7;
}

- (void)_deserializeFromPlistData
{
  NSMutableDictionary *v3;
  NSMutableDictionary *dict;
  NSString *aceId;
  NSString *refId;
  NSNumber *usefulnessScore;
  NSNumber *mutatingCommand;
  CFPropertyListFormat format;

  format = 0;
  v3 = (NSMutableDictionary *)CFPropertyListCreateWithData(0, (CFDataRef)self->_plistData, 1uLL, &format, 0);
  if (v3)
  {
    dict = self->_dict;
    self->_dict = v3;

    aceId = self->_aceId;
    if (aceId)
      -[NSMutableDictionary setValue:forKey:](self->_dict, "setValue:forKey:", aceId, CFSTR("aceId"));
    refId = self->_refId;
    if (refId)
      -[NSMutableDictionary setValue:forKey:](self->_dict, "setValue:forKey:", refId, CFSTR("refId"));
    usefulnessScore = self->_usefulnessScore;
    if (usefulnessScore)
      -[NSMutableDictionary setValue:forKey:](self->_dict, "setValue:forKey:", usefulnessScore, CFSTR("usefulnessScore"));
    mutatingCommand = self->_mutatingCommand;
    if (mutatingCommand)
      -[NSMutableDictionary setValue:forKey:](self->_dict, "setValue:forKey:", mutatingCommand, CFSTR("mutatingCommand"));
  }
}

- (id)_dict
{
  NSMutableDictionary *dict;

  dict = self->_dict;
  if (!dict)
  {
    if (self->_plistData)
    {
      -[AceObject _deserializeFromPlistData](self, "_deserializeFromPlistData");
      dict = self->_dict;
    }
    else
    {
      dict = 0;
    }
  }
  return dict;
}

- (id)encodedClassName
{
  return -[AceObject topLevelPropertyForKey:](self, "topLevelPropertyForKey:", CFSTR("$class"));
}

- (id)groupIdentifier
{
  return -[AceObject topLevelPropertyForKey:](self, "topLevelPropertyForKey:", CFSTR("$group"));
}

- (void)setAceId:(id)a3
{
  NSString *v4;
  NSString *aceId;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_aceId, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    aceId = self->_aceId;
    self->_aceId = v4;

    if (self->_dict)
      -[AceObject setTopLevelProperty:forKey:](self, "setTopLevelProperty:forKey:", self->_aceId, CFSTR("aceId"));
  }

}

- (void)setRefId:(id)a3
{
  NSString *v4;
  NSString *refId;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_refId, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    refId = self->_refId;
    self->_refId = v4;

    if (self->_dict)
      -[AceObject setTopLevelProperty:forKey:](self, "setTopLevelProperty:forKey:", self->_refId, CFSTR("refId"));
  }

}

- (BOOL)mutatingCommand
{
  return -[NSNumber BOOLValue](self->_mutatingCommand, "BOOLValue");
}

- (void)setMutatingCommand:(BOOL)a3
{
  _BOOL8 v3;
  NSNumber *v5;
  NSNumber *mutatingCommand;

  v3 = a3;
  if (-[NSNumber BOOLValue](self->_mutatingCommand, "BOOLValue") != a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v5 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    mutatingCommand = self->_mutatingCommand;
    self->_mutatingCommand = v5;

    if (self->_dict)
      -[AceObject setTopLevelProperty:forKey:](self, "setTopLevelProperty:forKey:", self->_mutatingCommand, CFSTR("mutatingCommand"));
  }
}

- (void)setUsefulnessScore:(id)a3
{
  NSNumber *v4;
  NSNumber *usefulnessScore;
  id v6;

  v6 = a3;
  if (!-[NSNumber isEqualToNumber:](self->_usefulnessScore, "isEqualToNumber:"))
  {
    v4 = (NSNumber *)objc_msgSend(v6, "copy");
    usefulnessScore = self->_usefulnessScore;
    self->_usefulnessScore = v4;

    if (self->_dict)
      -[AceObject setTopLevelProperty:forKey:](self, "setTopLevelProperty:forKey:", self->_usefulnessScore, CFSTR("usefulnessScore"));
  }

}

- (void)setProperty:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[AceObject _dict](self, "_dict");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v7, v6);

}

- (id)propertyForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[AceObject _dict](self, "_dict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)propertyForKeyWithoutDeserializing:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = v4;
  if (self->_dict)
  {
    -[AceObject propertyForKey:](self, "propertyForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v4 && self->_plistData)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend((id)objc_opt_class(), "_filteredDictionaryForKeySet:plistData:", v7, self->_plistData);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "valueForKey:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)hasArrayForPropertyForKey:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  CFTypeID v8;

  v4 = a3;
  if (self->_dict || !self->_plistData)
  {
    -[AceObject propertyForKey:](self, "propertyForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v6 = (objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v5, "count") != 0;

  }
  else
  {
    v6 = _CFPropertyListCreateSingleValue()
      && (v8 = CFGetTypeID(0), v8 == CFArrayGetTypeID())
      && CFArrayGetCount(0) > 0;
  }

  return v6;
}

- (id)forceEagerDeserialization
{
  if (!self->_dict && self->_plistData)
    -[AceObject _deserializeFromPlistData](self, "_deserializeFromPlistData");
  return self;
}

- (id)_serializedData
{
  return self->_plistData;
}

- (BOOL)_isDeserialized
{
  return self->_dict != 0;
}

- (id)_descriptionHint
{
  return 0;
}

- (id)fullDescription
{
  id v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = -[AceObject forceEagerDeserialization](self, "forceEagerDeserialization");
  if (self->_dict)
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:", CFSTR("["));
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendString:", v6);

    objc_msgSend(v4, "appendString:", CFSTR(" "));
    -[AceObject dictionary](self, "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AceObject _descriptionHint](self, "_descriptionHint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AceObject _appendDescriptionOfObject:toString:atDepth:withPrefixes:hint:](self, "_appendDescriptionOfObject:toString:atDepth:withPrefixes:hint:", v7, v4, 0, v8, v9);

    objc_msgSend(v4, "appendString:", CFSTR("]"));
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0CB3940];
    -[AceObject groupIdentifier](self, "groupIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[AceObject encodedClassName](self, "encodedClassName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("Serialized object group: %@ class: %@ aceId: %@ refId: %@"), v11, v12, self->_aceId, self->_refId);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  NSMutableDictionary *dict;
  void *aceId;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AceObject groupIdentifier](self, "groupIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[AceObject encodedClassName](self, "encodedClassName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  dict = self->_dict;
  if (dict)
  {
    -[AceObject aceId](self, "aceId");
    aceId = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_dict)
    {
      -[AceObject refId](self, "refId");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ group: %@ class: %@ aceId: %@ refId: %@"), v5, v6, v7, aceId, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
      goto LABEL_7;
    }
  }
  else
  {
    aceId = self->_aceId;
  }
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ group: %@ class: %@ aceId: %@ refId: %@"), v5, v6, v7, aceId, self->_refId);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (dict)
    goto LABEL_6;
LABEL_7:

  return (NSString *)v11;
}

- (void)_appendDescriptionOfObject:(id)a3 toString:(id)a4 atDepth:(unint64_t)a5 withPrefixes:(id)a6 hint:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  uint64_t i;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  const __CFString *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t j;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  id v44;
  id v45;
  id v46;
  void *v48;
  void *v49;
  _QWORD v50[4];
  id v51;
  id v52;
  AceObject *v53;
  id v54;
  unint64_t v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = a7;
  v49 = v13;
  if (objc_msgSend(v13, "count") <= a5)
  {
    v15 = objc_msgSend(v13, "count");
    if (v15 <= a5)
    {
      v16 = v15;
      do
      {
        objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("\n  "));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          for (i = 0; i != v16; ++i)
            objc_msgSend(v17, "appendString:", CFSTR("  "));
        }
        objc_msgSend(v13, "addObject:", v17);

        ++v16;
      }
      while (v16 <= a5);
    }
  }
  objc_msgSend(v13, "objectAtIndexedSubscript:", a5);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v11, "count"))
      {
        v50[0] = MEMORY[0x1E0C809B0];
        v50[1] = 3221225472;
        v50[2] = __75__AceObject__appendDescriptionOfObject_toString_atDepth_withPrefixes_hint___block_invoke;
        v50[3] = &unk_1E4C7BFC0;
        v51 = v12;
        v52 = v48;
        v53 = self;
        v55 = a5;
        v54 = v13;
        objc_msgSend(v11, "enumerateObjectsUsingBlock:", v50);

        goto LABEL_42;
      }
      v32 = CFSTR("<empty array>");
      v31 = v12;
LABEL_36:
      objc_msgSend(v31, "appendString:", v32);
      goto LABEL_42;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (unint64_t)objc_msgSend(v11, "length") >= 0x33)
    {
      v26 = objc_alloc(MEMORY[0x1E0C99D50]);
      v27 = objc_retainAutorelease(v11);
      v28 = (void *)objc_msgSend(v26, "initWithBytesNoCopy:length:freeWhenDone:", objc_msgSend(v27, "bytes"), 50, 0);
      objc_msgSend(v28, "description");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "appendString:", v29);

      objc_msgSend(v12, "appendFormat:", CFSTR("%@ <truncated; %lu total bytes>"), v28, objc_msgSend(v27, "length"));
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v12, "appendString:", CFSTR("\"));
        objc_msgSend(v12, "appendString:", v11);
        v31 = v12;
        v32 = CFSTR("\");
        goto LABEL_36;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v11, "descriptionWithLocale:", 0);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "appendFormat:", CFSTR("%@"), v28, v43);
      }
      else
      {
        objc_msgSend(v11, "description");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "appendString:", v28);
      }
    }

    goto LABEL_42;
  }
  v19 = v11;
  if (objc_msgSend(v19, "count"))
  {
    v46 = v19;
    objc_msgSend(v19, "allKeys");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v14;

      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "minusSet:", v23);

      objc_msgSend(v21, "allObjects");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "arrayByAddingObjectsFromArray:", v24);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v45 = v11;
    objc_opt_class();
    v44 = v14;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v25 = v14;
    else
      v25 = 0;
    v30 = v46;
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v33 = v20;
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v57;
      v37 = a5 + 1;
      do
      {
        for (j = 0; j != v35; ++j)
        {
          if (*(_QWORD *)v57 != v36)
            objc_enumerationMutation(v33);
          v39 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * j);
          objc_msgSend(v30, "objectForKey:", v39);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          if (v40)
          {
            objc_msgSend(v12, "appendString:", v48);
            objc_msgSend(v39, "description");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "appendString:", v41);

            v30 = v46;
            objc_msgSend(v12, "appendString:", CFSTR(": "));
            objc_msgSend(v25, "objectForKeyedSubscript:", v39);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            -[AceObject _appendDescriptionOfObject:toString:atDepth:withPrefixes:hint:](self, "_appendDescriptionOfObject:toString:atDepth:withPrefixes:hint:", v40, v12, v37, v49, v42);

          }
        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
      }
      while (v35);
    }

    v14 = v44;
    v11 = v45;
  }
  else
  {
    objc_msgSend(v12, "appendString:", CFSTR("<empty dict>"));
    v30 = v19;
  }

LABEL_42:
}

void __75__AceObject__appendDescriptionOfObject_toString_atDepth_withPrefixes_hint___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  id v7;

  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v7 = a2;
  objc_msgSend(v5, "appendString:", v6);
  objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("["));
  objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%lu"), a3);
  objc_msgSend(*(id *)(a1 + 32), "appendString:", CFSTR("] "));
  objc_msgSend(*(id *)(a1 + 48), "_appendDescriptionOfObject:toString:atDepth:withPrefixes:hint:", v7, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64) + 1, *(_QWORD *)(a1 + 56), 0);

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[AceObject dictionary](self, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithDictionary:", v5);

  return v6;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = objc_alloc((Class)objc_opt_class());
  -[AceObject dictionary](self, "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithDictionary:", v5);

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _QWORD *v5;
  NSData *plistData;
  char v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    plistData = self->_plistData;
    if (plistData && v5[5])
    {
      v7 = -[NSData isEqualToData:](plistData, "isEqualToData:");
    }
    else
    {
      -[AceObject _dict](self, "_dict");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "dictionary");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v8, "isEqual:", v9);

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[AceObject _dict](self, "_dict");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

+ (id)_filteredDictionaryForKeySet:(id)a3 plistData:(id)a4
{
  void *v4;
  CFTypeID v5;
  id v6;
  void *v7;

  v4 = 0;
  if (a3 && a4)
  {
    if (_CFPropertyListCreateFiltered() && (v5 = CFGetTypeID(0), v5 == CFDictionaryGetTypeID()))
    {
      v6 = 0;
      v4 = v6;
      if (v6)
        CFRelease(v6);
    }
    else
    {
      v4 = 0;
    }
  }
  v7 = (void *)objc_msgSend(v4, "copy");

  return v7;
}

- (id)deserializationDuration
{
  return &unk_1E4D23808;
}

- (void)updateUsingSet:(id)a3 add:(id)a4 remove:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  Class Class;
  objc_class *Superclass;
  objc_property_t *v15;
  objc_property_t *v16;
  unint64_t i;
  const char *Name;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  objc_class *v28;
  AceObject *v29;
  id v30;
  unsigned int outCount;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v9;
  v12 = v10;
  Class = object_getClass(self);
  if (Class)
  {
    Superclass = Class;
    v29 = self;
    v30 = v12;
    do
    {
      outCount = 0;
      v15 = class_copyPropertyList(Superclass, &outCount);
      if (v15)
      {
        v16 = v15;
        v28 = Superclass;
        if (outCount)
        {
          for (i = 0; i < outCount; ++i)
          {
            Name = property_getName(v16[i]);
            if (Name)
            {
              v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", Name);
              if (v19)
              {
                objc_msgSend(v8, "propertyForKey:", v19);
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                if (v20)
                  -[AceObject setProperty:forKey:](self, "setProperty:forKey:", v20, v19);
                objc_msgSend(v11, "propertyForKey:", v19, v28);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v22 = v11;
                  v23 = v8;
                  -[AceObject propertyForKey:](self, "propertyForKey:", v19);
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    objc_msgSend(v24, "arrayByAddingObjectsFromArray:", v21);
                    v25 = (void *)objc_claimAutoreleasedReturnValue();
                    -[AceObject setProperty:forKey:](self, "setProperty:forKey:", v25, v19);

                  }
                  else
                  {
                    v26 = objc_msgSend(v21, "copy");

                    -[AceObject setProperty:forKey:](self, "setProperty:forKey:", v26, v19);
                    v21 = (void *)v26;
                  }

                  v8 = v23;
                  v11 = v22;
                  self = v29;
                  v12 = v30;
                }
                objc_msgSend(v12, "propertyForKey:", v19);
                v27 = (void *)objc_claimAutoreleasedReturnValue();

                if (v27)
                  -[AceObject setProperty:forKey:](self, "setProperty:forKey:", 0, v19);

              }
            }
          }
        }
        free(v16);
        Superclass = v28;
      }
      Superclass = class_getSuperclass(Superclass);
    }
    while (Superclass);
  }

}

- (NSString)aceId
{
  return self->_aceId;
}

- (NSString)refId
{
  return self->_refId;
}

- (NSNumber)usefulnessScore
{
  return self->_usefulnessScore;
}

- (NSData)plistData
{
  return self->_plistData;
}

- (NSMutableDictionary)dict
{
  return self->_dict;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dict, 0);
  objc_storeStrong((id *)&self->_plistData, 0);
  objc_storeStrong((id *)&self->_usefulnessScore, 0);
  objc_storeStrong((id *)&self->_refId, 0);
  objc_storeStrong((id *)&self->_aceId, 0);
  objc_storeStrong((id *)&self->_mutatingCommand, 0);
}

@end
