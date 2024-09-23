@implementation RBJetsamProperties

- (int)memoryLimitForCategory:(id)a3 strength:(unsigned __int8 *)a4
{
  id v6;
  unsigned int v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int taskLimit;
  void *v15;
  void *v16;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  int v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = *a4;
  v8 = -[RBJetsamProperties _altStrength:](self, "_altStrength:", *a4);
  if ((objc_msgSend(v6, "isEqual:", CFSTR("Active")) & 1) != 0)
    v9 = 1;
  else
    v9 = objc_msgSend(v6, "isEqual:", CFSTR("Inactive"));
  if (v7)
    v10 = v7;
  else
    v10 = 2;
  -[RBJetsamProperties _keyForCategory:strength:](self, "_keyForCategory:strength:", v6, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBJetsamProperties getValueFrom:forKey:](self, "getValueFrom:forKey:", self->_memoryLimitCategories, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12 && objc_msgSend(v12, "longValue") != -1)
  {
    *a4 = v10;
    taskLimit = -[RBJetsamProperties _integerLimitValue:](self, "_integerLimitValue:", v13);

    goto LABEL_15;
  }
  -[RBJetsamProperties _keyForCategory:strength:](self, "_keyForCategory:strength:", v6, v8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  -[RBJetsamProperties getValueFrom:forKey:](self, "getValueFrom:forKey:", self->_memoryLimitCategories, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    *a4 = v8;
    taskLimit = -[RBJetsamProperties _integerLimitValue:](self, "_integerLimitValue:", v16);

LABEL_14:
    v11 = v15;
    goto LABEL_15;
  }
  if (v13)
  {
LABEL_13:
    taskLimit = self->_taskLimit;
    goto LABEL_14;
  }
  -[RBJetsamProperties _keyForCategory:strength:](self, "_keyForCategory:strength:", v6, v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[RBJetsamProperties getValueFrom:forKey:](self, "getValueFrom:forKey:", self->_globalProperties, v18);
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    *a4 = v10;
    taskLimit = -[RBJetsamProperties _integerLimitValue:](self, "_integerLimitValue:", v19);

    v11 = v18;
    goto LABEL_15;
  }
  -[RBJetsamProperties _keyForCategory:strength:](self, "_keyForCategory:strength:", v6, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[RBJetsamProperties getValueFrom:forKey:](self, "getValueFrom:forKey:", self->_globalProperties, v11);
  v21 = objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v22 = (void *)v21;
    *a4 = v8;
    taskLimit = -[RBJetsamProperties _integerLimitValue:](self, "_integerLimitValue:", v21);

    goto LABEL_15;
  }
  if ((v9 & 1) != 0 || (objc_msgSend(v6, "isEqual:", CFSTR("Inactive")) & 1) != 0)
  {
    v15 = v11;
    goto LABEL_13;
  }
  rbs_jetsam_log();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v24 = 138412290;
    v25 = v6;
    _os_log_impl(&dword_21A8B4000, v23, OS_LOG_TYPE_DEFAULT, "No JetsamProperties for this process for category '%@'", (uint8_t *)&v24, 0xCu);
  }

  taskLimit = -[RBJetsamProperties memoryLimitForCategory:strength:](self, "memoryLimitForCategory:strength:", CFSTR("Inactive"), a4);
LABEL_15:

  return taskLimit;
}

- (id)getValueFrom:(id)a3 forKey:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "valueForKey:", v6);
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_3:
    v8 = (void *)v7;
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_15;
  v9 = objc_msgSend(v5, "unsignedLongLongValue");
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("InactiveHardMemoryLimit")))
  {
    if ((~(_DWORD)v9 & 0xC0000000) != 0)
      goto LABEL_15;
    goto LABEL_10;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("InactiveSoftMemoryLimit")))
  {
    if ((v9 & 0xC0000000) == 0x80000000)
    {
LABEL_10:
      if ((v9 & 0x3FFFFFFF) == 0x3FFFFFFF)
        v10 = -1;
      else
        v10 = v9 & 0x3FFFFFFF;
LABEL_23:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v10);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_3;
    }
LABEL_15:
    v8 = 0;
    goto LABEL_16;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("ActiveHardMemoryLimit")))
  {
    if (v9 >> 62 != 3)
      goto LABEL_15;
LABEL_20:
    if ((v9 & 0x3FFFFFFF00000000) == 0x3FFFFFFF00000000)
      v10 = -1;
    else
      v10 = HIDWORD(v9) & 0x3FFFFFFF;
    goto LABEL_23;
  }
  v8 = 0;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("ActiveSoftMemoryLimit"))
    && (v9 & 0x8000000000000000) != 0
    && (v9 & 0x4000000000000000) == 0)
  {
    goto LABEL_20;
  }
LABEL_16:

  return v8;
}

- (id)_keyForCategory:(id)a3 strength:(unsigned __int8)a4
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  NSStringFromRBSMemoryLimitStrength();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@%@MemoryLimit"), v4, v5);

  return v6;
}

- (int)_integerLimitValue:(id)a3
{
  int result;
  uint64_t v5;

  result = objc_msgSend(a3, "intValue");
  if (result == -1)
  {
    v5 = 24;
  }
  else
  {
    if (result)
      return result;
    v5 = 28;
  }
  return *(_DWORD *)((char *)&self->super.isa + v5);
}

- (unsigned)_altStrength:(unsigned __int8)a3
{
  if (a3 == 1)
    return 2;
  else
    return 1;
}

- (BOOL)isValid
{
  return 1;
}

- (BOOL)isFreezerEligible
{
  void *v3;
  uint64_t v4;

  if (!self->_freezerEligibleSet)
  {
    -[RBJetsamProperties getValueFrom:forKey:](self, "getValueFrom:forKey:", self->_memoryLimitCategories, CFSTR("FreezerEligible"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      -[RBJetsamProperties getValueFrom:forKey:](self, "getValueFrom:forKey:", self->_globalProperties, CFSTR("FreezerEligible"));
      v4 = objc_claimAutoreleasedReturnValue();
      if (v4)
        v3 = (void *)v4;
      else
        v3 = (void *)MEMORY[0x24BDBD1C0];
    }
    self->_freezerEligible = objc_msgSend(v3, "BOOLValue");
    self->_freezerEligibleSet = 1;

  }
  return self->_freezerEligible;
}

+ (id)jetsamPropertiesForProperties:(id)a3 globalProperties:(id)a4 taskLimit:(int)a5 unLimit:(int)a6
{
  uint64_t v6;
  uint64_t v7;
  id v9;
  id v10;
  id v11;

  v6 = *(_QWORD *)&a6;
  v7 = *(_QWORD *)&a5;
  v9 = a4;
  v10 = a3;
  v11 = -[RBJetsamProperties _initWithProperties:globalProperties:taskLimit:unLimit:]([RBJetsamProperties alloc], "_initWithProperties:globalProperties:taskLimit:unLimit:", v10, v9, v7, v6);

  return v11;
}

- (id)_initWithProperties:(id)a3 globalProperties:(id)a4 taskLimit:(int)a5 unLimit:(int)a6
{
  id v10;
  id v11;
  RBJetsamProperties *v12;
  uint64_t v13;
  id memoryLimitCategories;
  objc_super v16;

  v10 = a3;
  v11 = a4;
  v16.receiver = self;
  v16.super_class = (Class)RBJetsamProperties;
  v12 = -[RBJetsamProperties init](&v16, sel_init);
  if (v12)
  {
    v13 = objc_msgSend(v10, "copy");
    memoryLimitCategories = v12->_memoryLimitCategories;
    v12->_memoryLimitCategories = (id)v13;

    objc_storeStrong(&v12->_globalProperties, a4);
    v12->_taskLimit = a5;
    v12->_unLimit = a6;
  }

  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_globalProperties, 0);
  objc_storeStrong(&self->_memoryLimitCategories, 0);
}

- (id)_altKeyForCategory:(id)a3 strength:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  -[RBJetsamProperties _altStrength:](self, "_altStrength:", v4);
  NSStringFromRBSMemoryLimitStrength();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%@%@MemoryLimit"), v6, v7);

  return v8;
}

- (id)_defaultKeyForCategory:(id)a3 strength:(unsigned __int8)a4
{
  return CFSTR("InactiveSoftMemoryLimit");
}

- (void)_setLimitFor:(id)a3 strength:(unsigned __int8)a4 toValue:(id)a5
{
  uint64_t v5;
  id v8;
  id v9;

  v5 = a4;
  v8 = a5;
  -[RBJetsamProperties _keyForCategory:strength:](self, "_keyForCategory:strength:", a3, v5);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(self->_memoryLimitCategories, "setValue:forKey:", v8, v9);

}

- (id)_directPropertyDescription:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  __CFString *v11;

  v4 = a3;
  -[RBJetsamProperties _keyForCategory:strength:](self, "_keyForCategory:strength:", v4, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RBJetsamProperties getValueFrom:forKey:](self, "getValueFrom:forKey:", self->_memoryLimitCategories, v5);
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    v8 = CFSTR("\t%@SoftMemoryLimit=%lld\n");
    v9 = v5;
  }
  else
  {
    -[RBJetsamProperties _keyForCategory:strength:](self, "_keyForCategory:strength:", v4, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[RBJetsamProperties getValueFrom:forKey:](self, "getValueFrom:forKey:", self->_memoryLimitCategories, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      v11 = &stru_24DD48378;
      goto LABEL_6;
    }
    v7 = (void *)v10;
    v8 = CFSTR("\t%@HardMemoryLimit=%lld\n");
  }
  v11 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", v8, v4, objc_msgSend(v7, "longLongValue"));

LABEL_6:
  return v11;
}

- (id)_propertiesDescription
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(self->_memoryLimitCategories, "entriesToStringWithIndent:debug:", 1, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = objc_alloc(MEMORY[0x24BDD17C8]);
      -[RBJetsamProperties _directPropertyDescription:](self, "_directPropertyDescription:", CFSTR("Active"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[RBJetsamProperties _directPropertyDescription:](self, "_directPropertyDescription:", CFSTR("Inactive"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = (void *)objc_msgSend(v4, "initWithFormat:", CFSTR("%@%@"), v5, v6);

    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

- (id)description
{
  id v3;
  void *v4;
  uint64_t taskLimit;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  taskLimit = self->_taskLimit;
  -[RBJetsamProperties _propertiesDescription](self, "_propertiesDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@| tasklimit=%d\n%@>"), v4, taskLimit, v6);

  return v7;
}

@end
