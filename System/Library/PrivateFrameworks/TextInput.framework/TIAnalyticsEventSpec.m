@implementation TIAnalyticsEventSpec

+ (id)eventSpecWithName:(id)a3 inputModeRequired:(BOOL)a4 fieldSpecs:(id)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  TIAnalyticsEventSpec *v9;

  v5 = a4;
  v7 = a5;
  v8 = a3;
  v9 = -[TIAnalyticsEventSpec initWithName:inputModeRequired:fieldSpecs:]([TIAnalyticsEventSpec alloc], "initWithName:inputModeRequired:fieldSpecs:", v8, v5, v7);

  return v9;
}

- (TIAnalyticsEventSpec)initWithName:(id)a3 inputModeRequired:(BOOL)a4 fieldSpecs:(id)a5
{
  id v8;
  id v9;
  TIAnalyticsEventSpec *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  uint64_t v19;
  NSString *name;
  uint64_t v21;
  NSArray *fieldSpecs;
  uint64_t v23;
  NSDictionary *fieldSpecsByName;
  BOOL v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  objc_super v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v31.receiver = self;
  v31.super_class = (Class)TIAnalyticsEventSpec;
  v10 = -[TIAnalyticsEventSpec init](&v31, sel_init);
  if (v10)
  {
    v26 = a4;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v12 = v9;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v28 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v17, "name");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKey:", v17, v18);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v14);
    }

    v19 = objc_msgSend(v8, "copy");
    name = v10->_name;
    v10->_name = (NSString *)v19;

    v10->_isInputModeRequired = v26;
    if (v12)
    {
      v21 = objc_msgSend(v12, "copy");
      fieldSpecs = v10->_fieldSpecs;
      v10->_fieldSpecs = (NSArray *)v21;
    }
    else
    {
      fieldSpecs = v10->_fieldSpecs;
      v10->_fieldSpecs = (NSArray *)MEMORY[0x1E0C9AA60];
    }

    v23 = objc_msgSend(v11, "copy");
    fieldSpecsByName = v10->_fieldSpecsByName;
    v10->_fieldSpecsByName = (NSDictionary *)v23;

  }
  return v10;
}

- (id)fieldSpecWithName:(id)a3
{
  return -[NSDictionary objectForKey:](self->_fieldSpecsByName, "objectForKey:", a3);
}

- (NSDictionary)fieldSpecsByName
{
  return self->_fieldSpecsByName;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)isInputModeRequired
{
  return self->_isInputModeRequired;
}

- (NSArray)fieldSpecs
{
  return self->_fieldSpecs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldSpecs, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_fieldSpecsByName, 0);
}

+ (id)eventSpecWithName:(id)a3 inputModeRequired:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  TIAnalyticsEventSpec *v6;

  v4 = a4;
  v5 = a3;
  v6 = -[TIAnalyticsEventSpec initWithName:inputModeRequired:fieldSpecs:]([TIAnalyticsEventSpec alloc], "initWithName:inputModeRequired:fieldSpecs:", v5, v4, 0);

  return v6;
}

@end
