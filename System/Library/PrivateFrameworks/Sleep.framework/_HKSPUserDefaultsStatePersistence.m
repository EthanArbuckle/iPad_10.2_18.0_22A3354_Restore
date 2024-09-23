@implementation _HKSPUserDefaultsStatePersistence

- (_HKSPUserDefaultsStatePersistence)initWithUserDefaults:(id)a3
{
  id v5;
  _HKSPUserDefaultsStatePersistence *v6;
  _HKSPUserDefaultsStatePersistence *v7;
  _HKSPUserDefaultsStatePersistence *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_HKSPUserDefaultsStatePersistence;
  v6 = -[_HKSPUserDefaultsStatePersistence init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_userDefaults, a3);
    v8 = v7;
  }

  return v7;
}

- (id)loadPersistentStateForIdentifier:(id)a3 allowedStates:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  HKSPDictionaryDeserializer *v10;
  NSString *v11;
  Class v12;
  void *v13;

  v8 = a4;
  -[HKSPUserDefaults hksp_objectForKey:](self->_userDefaults, "hksp_objectForKey:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = -[HKSPDictionaryDeserializer initWithAllowedClasses:serializedDictionary:]([HKSPDictionaryDeserializer alloc], "initWithAllowedClasses:serializedDictionary:", v8, v9);
    objc_msgSend(v9, "hksp_serializedClassName");
    v11 = (NSString *)objc_claimAutoreleasedReturnValue();
    v12 = NSClassFromString(v11);

    if (-[objc_class isSubclassOfClass:](v12, "isSubclassOfClass:", objc_opt_class()))
    {
      -[HKSPDictionaryDeserializer deserializeObjectOfClass:error:](v10, "deserializeObjectOfClass:error:", v12, a5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)savePersistentState:(id)a3 identifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  HKSPDictionarySerializer *v10;
  uint64_t v11;
  BOOL v12;

  v8 = a3;
  v9 = a4;
  if (v8)
  {
    v10 = objc_alloc_init(HKSPDictionarySerializer);
    if (!-[HKSPDictionarySerializer serialize:error:](v10, "serialize:error:", v8, a5))
    {
      v12 = 0;
      goto LABEL_7;
    }
    -[HKSPDictionarySerializer serializedDictionary](v10, "serializedDictionary");
    v11 = objc_claimAutoreleasedReturnValue();

    v10 = (HKSPDictionarySerializer *)v11;
  }
  else
  {
    v10 = 0;
  }
  -[HKSPUserDefaults hksp_setObject:forKey:](self->_userDefaults, "hksp_setObject:forKey:", v10, v9);
  -[HKSPUserDefaults hksp_synchronize](self->_userDefaults, "hksp_synchronize");
  v12 = 1;
LABEL_7:

  return v12;
}

- (HKSPUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

@end
