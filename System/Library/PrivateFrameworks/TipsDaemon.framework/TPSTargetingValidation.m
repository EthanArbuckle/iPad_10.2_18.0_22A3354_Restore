@implementation TPSTargetingValidation

- (void)setTargetContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setJoinType:(int64_t)a3
{
  self->_joinType = a3;
}

- (BOOL)BOOLValue
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[TPSTargetingValidation targetContext](self, "targetContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 != 1)
    return 0;
  -[TPSTargetingValidation targetContext](self, "targetContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = objc_msgSend(v7, "BOOLValue");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      -[TPSTargetingValidation name](self, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_opt_class();
      v12 = v11;
      v15 = 138413058;
      v16 = v10;
      v17 = 2112;
      v18 = v7;
      v19 = 2112;
      v20 = v11;
      v21 = 2112;
      v22 = (id)objc_opt_class();
      v13 = v22;
      _os_log_impl(&dword_1DAC2F000, v9, OS_LOG_TYPE_INFO, "[%@] Unexpected value: %@ with class: %@. Expected type: %@.", (uint8_t *)&v15, 0x2Au);

    }
    v8 = 0;
  }

  return v8;
}

- (id)value
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  -[TPSTargetingValidation targetContext](self, "targetContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 == 1)
  {
    -[TPSTargetingValidation targetContext](self, "targetContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allValues");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (NSDictionary)targetContext
{
  return self->_targetContext;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetContext, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSString)name
{
  NSString *name;
  objc_class *v4;

  name = self->_name;
  if (name)
    return name;
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

- (TPSTargetingValidation)initWithTargetContext:(id)a3
{
  id v5;
  TPSTargetingValidation *v6;
  TPSTargetingValidation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TPSTargetingValidation;
  v6 = -[TPSTargetingValidation init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_targetContext, a3);

  return v7;
}

- (unint64_t)unsignedIntegerValue
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[TPSTargetingValidation targetContext](self, "targetContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 != 1)
    return 0;
  -[TPSTargetingValidation targetContext](self, "targetContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = objc_msgSend(v7, "unsignedIntegerValue");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      -[TPSTargetingValidation name](self, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_opt_class();
      v12 = v11;
      v15 = 138413058;
      v16 = v10;
      v17 = 2112;
      v18 = v7;
      v19 = 2112;
      v20 = v11;
      v21 = 2112;
      v22 = (id)objc_opt_class();
      v13 = v22;
      _os_log_impl(&dword_1DAC2F000, v9, OS_LOG_TYPE_INFO, "[%@] Unexpected value: %@ with class: %@. Expected type: %@.", (uint8_t *)&v15, 0x2Au);

    }
    v8 = 0;
  }

  return v8;
}

- (id)key
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  -[TPSTargetingValidation targetContext](self, "targetContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 == 1)
  {
    -[TPSTargetingValidation targetContext](self, "targetContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allKeys");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (int64_t)integerValue
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[TPSTargetingValidation targetContext](self, "targetContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 != 1)
    return 0;
  -[TPSTargetingValidation targetContext](self, "targetContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = (int)objc_msgSend(v7, "intValue");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      -[TPSTargetingValidation name](self, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)objc_opt_class();
      v12 = v11;
      v15 = 138413058;
      v16 = v10;
      v17 = 2112;
      v18 = v7;
      v19 = 2112;
      v20 = v11;
      v21 = 2112;
      v22 = (id)objc_opt_class();
      v13 = v22;
      _os_log_impl(&dword_1DAC2F000, v9, OS_LOG_TYPE_INFO, "[%@] Unexpected value: %@ with class: %@. Expected type: %@.", (uint8_t *)&v15, 0x2Au);

    }
    v8 = 0;
  }

  return v8;
}

- (id)stringValue
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[TPSTargetingValidation targetContext](self, "targetContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 != 1)
    return 0;
  -[TPSTargetingValidation targetContext](self, "targetContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "stringValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DBF3D0], "targeting");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      -[TPSTargetingValidation name](self, "name");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_opt_class();
      v13 = v12;
      v15 = 138413058;
      v16 = v11;
      v17 = 2112;
      v18 = v7;
      v19 = 2112;
      v20 = v12;
      v21 = 2112;
      v22 = (id)objc_opt_class();
      v14 = v22;
      _os_log_impl(&dword_1DAC2F000, v10, OS_LOG_TYPE_INFO, "[%@] Unexpected value: %@ with class: %@. Expected type: %@.", (uint8_t *)&v15, 0x2Au);

    }
    v8 = 0;
  }

  return v8;
}

- (id)arrayValue
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  -[TPSTargetingValidation targetContext](self, "targetContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 != 1)
    return 0;
  -[TPSTargetingValidation targetContext](self, "targetContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
  }
  else
  {
    v11[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v8;

  return v10;
}

- (void)validateWithCompletion:(id)a3
{
  (*((void (**)(id, _QWORD, _QWORD))a3 + 2))(a3, 0, 0);
}

- (void)getCurrentStateWithCompletion:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x1E0C99E38];
  v5 = a3;
  objc_msgSend(v4, "null");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, _QWORD))a3 + 2))(v5, v6, 0);

}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[TPSTargetingValidation name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPSTargetingValidation targetContext](self, "targetContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; targetContext = %@; ignoreCache: %d>"),
    v4,
    self,
    v5,
    -[TPSTargetingValidation ignoreCache](self, "ignoreCache"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int64_t)joinType
{
  return self->_joinType;
}

- (BOOL)ignoreCache
{
  return self->_ignoreCache;
}

- (void)setIgnoreCache:(BOOL)a3
{
  self->_ignoreCache = a3;
}

@end
