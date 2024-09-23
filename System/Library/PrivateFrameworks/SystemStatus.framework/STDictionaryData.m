@implementation STDictionaryData

- (STDictionaryData)init
{
  void *v3;
  STDictionaryData *v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[STDictionaryData initWithObjectsAndKeys:](self, "initWithObjectsAndKeys:", v3);

  return v4;
}

- (STDictionaryData)initWithObjectsAndKeys:(id)a3
{
  id v4;
  STDictionaryData *v5;
  uint64_t v6;
  NSMutableDictionary *objectsAndKeys;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STDictionaryData;
  v5 = -[STDictionaryData init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "mutableCopy");
    objectsAndKeys = v5->_objectsAndKeys;
    v5->_objectsAndKeys = (NSMutableDictionary *)v6;

  }
  return v5;
}

- (NSArray)allKeys
{
  return (NSArray *)-[NSMutableDictionary allKeys](self->_objectsAndKeys, "allKeys");
}

- (NSArray)allObjects
{
  return (NSArray *)-[NSMutableDictionary allValues](self->_objectsAndKeys, "allValues");
}

- (NSDictionary)objectsAndKeys
{
  return (NSDictionary *)(id)-[NSMutableDictionary copy](self->_objectsAndKeys, "copy");
}

- (unint64_t)count
{
  void *v2;
  unint64_t v3;

  -[STDictionaryData allKeys](self, "allKeys");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (BOOL)isEmpty
{
  return -[STDictionaryData count](self, "count") == 0;
}

- (void)enumerateKeysAndObjectsUsingBlock:(id)a3
{
  NSMutableDictionary *objectsAndKeys;
  id v4;
  id v5;

  if (a3)
  {
    objectsAndKeys = self->_objectsAndKeys;
    v4 = a3;
    v5 = (id)-[NSMutableDictionary copy](objectsAndKeys, "copy");
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v4);

  }
}

- (id)objectForKey:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_objectsAndKeys, "objectForKeyedSubscript:", a3);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01768], "builderWithObject:ofExpectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STDictionaryData objectsAndKeys](self, "objectsAndKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __28__STDictionaryData_isEqual___block_invoke;
  v10[3] = &unk_1E91E5618;
  v11 = v4;
  v7 = v4;
  v8 = (id)objc_msgSend(v5, "appendObject:counterpart:", v6, v10);

  LOBYTE(v6) = objc_msgSend(v5, "isEqual");
  return (char)v6;
}

uint64_t __28__STDictionaryData_isEqual___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "objectsAndKeys");
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  unint64_t v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __24__STDictionaryData_hash__block_invoke;
  v7[3] = &unk_1E91E5640;
  v8 = v3;
  v4 = v3;
  -[STDictionaryData enumerateKeysAndObjectsUsingBlock:](self, "enumerateKeysAndObjectsUsingBlock:", v7);
  v5 = objc_msgSend(v4, "hash");

  return v5;
}

void __24__STDictionaryData_hash__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  id v7;

  v7 = a3;
  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:", a2);
  v6 = (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:", v7);

}

- (NSString)description
{
  return (NSString *)-[STDictionaryData descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  STMutableDictionaryData *v4;
  void *v5;
  STMutableDictionaryData *v6;

  v4 = +[STMutableDictionaryData allocWithZone:](STMutableDictionaryData, "allocWithZone:", a3);
  -[STDictionaryData objectsAndKeys](self, "objectsAndKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[STDictionaryData initWithObjectsAndKeys:](v4, "initWithObjectsAndKeys:", v5);

  return v6;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[STDictionaryData succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STDictionaryData descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)debugDescriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[STDictionaryData _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_descriptionBuilderWithMultilinePrefix:(uint64_t)a3 forDebug:
{
  id v5;
  void *v6;

  if (a1)
  {
    v5 = a2;
    objc_msgSend(a1, "succinctDescriptionBuilder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUseDebugDescription:", a3);
    objc_msgSend(v6, "setActiveMultilinePrefix:", v5);

    objc_msgSend(v6, "appendDictionarySection:withName:skipIfEmpty:", a1[1], CFSTR("dictionaryData"), 0);
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  return -[STDictionaryData _descriptionBuilderWithMultilinePrefix:forDebug:](self, a3, 0);
}

- (id)diffFromData:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    +[STDictionaryDataDiff diffFromDictionaryData:toDictionaryData:](STDictionaryDataDiff, "diffFromDictionaryData:toDictionaryData:", v4, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)dataByApplyingDiff:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(v4, "isEmpty"))
    {
      v5 = (void *)-[STDictionaryData copy](self, "copy");
    }
    else
    {
      v5 = (void *)-[STDictionaryData mutableCopy](self, "mutableCopy");
      objc_msgSend(v4, "applyToMutableDictionaryData:", v5);
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[STDictionaryData objectsAndKeys](self, "objectsAndKeys");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("objectsAndKeys"));

}

- (STDictionaryData)initWithCoder:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  STDictionaryData *v9;

  v4 = a3;
  objc_opt_self();
  if (qword_1ED0CB450 != -1)
    dispatch_once(&qword_1ED0CB450, &__block_literal_global_15);
  v5 = (id)_MergedGlobals_10;
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v5, CFSTR("objectsAndKeys"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v7;
  else
    v8 = 0;

  if (v8)
  {
    self = -[STDictionaryData initWithObjectsAndKeys:](self, "initWithObjectsAndKeys:", v8);
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)validateObjectsAndKeysWithValidObjectClasses:(id)a3 keyClasses:(id)a4
{
  id v6;
  id v7;
  NSMutableDictionary *objectsAndKeys;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v6 = a3;
  v7 = a4;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 1;
  objectsAndKeys = self->_objectsAndKeys;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __76__STDictionaryData_validateObjectsAndKeysWithValidObjectClasses_keyClasses___block_invoke;
  v12[3] = &unk_1E91E5690;
  v9 = v7;
  v13 = v9;
  v10 = v6;
  v14 = v10;
  v15 = &v16;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](objectsAndKeys, "enumerateKeysAndObjectsUsingBlock:", v12);
  LOBYTE(v6) = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)v6;
}

void __76__STDictionaryData_validateObjectsAndKeysWithValidObjectClasses_keyClasses___block_invoke(_QWORD *a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  char v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;

  v7 = a2;
  v8 = a3;
  v9 = (void *)a1[4];
  v10 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __76__STDictionaryData_validateObjectsAndKeysWithValidObjectClasses_keyClasses___block_invoke_2;
  v17[3] = &unk_1E91E5668;
  v14 = v7;
  v18 = v14;
  LODWORD(v7) = objc_msgSend(v9, "bs_containsObjectPassingTest:", v17);
  v11 = (void *)a1[5];
  v15[0] = v10;
  v15[1] = 3221225472;
  v15[2] = __76__STDictionaryData_validateObjectsAndKeysWithValidObjectClasses_keyClasses___block_invoke_3;
  v15[3] = &unk_1E91E5668;
  v12 = v8;
  v16 = v12;
  v13 = objc_msgSend(v11, "bs_containsObjectPassingTest:", v15);
  if (!(_DWORD)v7 || (v13 & 1) == 0)
  {
    *a4 = 1;
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 0;
  }

}

uint64_t __76__STDictionaryData_validateObjectsAndKeysWithValidObjectClasses_keyClasses___block_invoke_2()
{
  return objc_opt_isKindOfClass() & 1;
}

uint64_t __76__STDictionaryData_validateObjectsAndKeysWithValidObjectClasses_keyClasses___block_invoke_3()
{
  return objc_opt_isKindOfClass() & 1;
}

void __41__STDictionaryData__encodableObjectTypes__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;

  v17 = (void *)MEMORY[0x1E0C99E60];
  v16 = objc_opt_class();
  v15 = objc_opt_class();
  v14 = objc_opt_class();
  v13 = objc_opt_class();
  v12 = objc_opt_class();
  v0 = objc_opt_class();
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  objc_msgSend(v17, "setWithObjects:", v16, v15, v14, v13, v12, v0, v1, v2, v3, v4, v5, v6, v7, v8, v9, objc_opt_class(), 0);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)_MergedGlobals_10;
  _MergedGlobals_10 = v10;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectsAndKeys, 0);
}

@end
