@implementation SRParameter

- (void)setFlag:(int64_t)a3
{
  self->_flag = a3;
}

+ (id)parameterWithBoolean:(BOOL)a3 name:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;

  v4 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithBoolean:flags:name:", v4, 0, v6);

  return v7;
}

- (SRParameter)initWithBoolean:(BOOL)a3 flags:(int64_t)a4 name:(id)a5
{
  _BOOL8 v6;
  id v8;
  SRParameter *v9;
  SRParameter *v10;
  uint64_t v11;
  NSObject *value;
  uint64_t v13;
  NSObject *name;
  objc_super v16;

  v6 = a3;
  v8 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SRParameter;
  v9 = -[SRParameter init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_type = 0;
    v9->_flag = a4;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v6);
    v11 = objc_claimAutoreleasedReturnValue();
    value = v10->_value;
    v10->_value = v11;

    v13 = objc_msgSend(v8, "copy");
    name = v10->_name;
    v10->_name = (NSString *)v13;
  }
  else
  {
    SRLogCategoryGeneral();
    name = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(name, OS_LOG_TYPE_ERROR))
      -[SRParameter initWithBoolean:flags:name:].cold.1();
  }

  return v10;
}

+ (id)parameterWithLong:(int64_t)a3 name:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithLong:flags:name:", a3, 0, v6);

  return v7;
}

- (SRParameter)initWithLong:(int64_t)a3 flags:(int64_t)a4 name:(id)a5
{
  id v8;
  SRParameter *v9;
  SRParameter *v10;
  uint64_t v11;
  NSObject *value;
  uint64_t v13;
  NSObject *name;
  objc_super v16;

  v8 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SRParameter;
  v9 = -[SRParameter init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_type = 1;
    v9->_flag = a4;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", a3);
    v11 = objc_claimAutoreleasedReturnValue();
    value = v10->_value;
    v10->_value = v11;

    v13 = objc_msgSend(v8, "copy");
    name = v10->_name;
    v10->_name = (NSString *)v13;
  }
  else
  {
    SRLogCategoryGeneral();
    name = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(name, OS_LOG_TYPE_ERROR))
      -[SRParameter initWithLong:flags:name:].cold.1();
  }

  return v10;
}

+ (id)parameterWithFilePath:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithFilePath:flags:name:", v7, 0, v6);

  return v8;
}

- (SRParameter)initWithFilePath:(id)a3 flags:(int64_t)a4 name:(id)a5
{
  id v8;
  id v9;
  SRParameter *v10;
  SRParameter *v11;
  uint64_t v12;
  NSObject *value;
  uint64_t v14;
  NSObject *name;
  objc_super v17;

  v8 = a3;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SRParameter;
  v10 = -[SRParameter init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_type = 4;
    v10->_flag = a4;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v8);
    v12 = objc_claimAutoreleasedReturnValue();
    value = v11->_value;
    v11->_value = v12;

    v14 = objc_msgSend(v9, "copy");
    name = v11->_name;
    v11->_name = (NSString *)v14;
  }
  else
  {
    SRLogCategoryGeneral();
    name = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(name, OS_LOG_TYPE_ERROR))
      -[SRParameter initWithFilePath:flags:name:].cold.1();
  }

  return v11;
}

+ (id)parameterWithDouble:(double)a3 name:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithDouble:flags:name:", 0, v6, a3);

  return v7;
}

- (SRParameter)initWithDouble:(double)a3 flags:(int64_t)a4 name:(id)a5
{
  id v8;
  SRParameter *v9;
  SRParameter *v10;
  uint64_t v11;
  NSObject *value;
  uint64_t v13;
  NSObject *name;
  objc_super v16;

  v8 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SRParameter;
  v9 = -[SRParameter init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_type = 2;
    v9->_flag = a4;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
    v11 = objc_claimAutoreleasedReturnValue();
    value = v10->_value;
    v10->_value = v11;

    v13 = objc_msgSend(v8, "copy");
    name = v10->_name;
    v10->_name = (NSString *)v13;
  }
  else
  {
    SRLogCategoryGeneral();
    name = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(name, OS_LOG_TYPE_ERROR))
      -[SRParameter initWithDouble:flags:name:].cold.1();
  }

  return v10;
}

+ (id)parameterWithString:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithString:flags:name:", v7, 0, v6);

  return v8;
}

- (SRParameter)initWithString:(id)a3 flags:(int64_t)a4 name:(id)a5
{
  id v8;
  id v9;
  SRParameter *v10;
  SRParameter *v11;
  uint64_t v12;
  NSObject *value;
  uint64_t v14;
  NSObject *name;
  objc_super v17;

  v8 = a3;
  v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SRParameter;
  v10 = -[SRParameter init](&v17, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_type = 3;
    v10->_flag = a4;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v8);
    v12 = objc_claimAutoreleasedReturnValue();
    value = v11->_value;
    v11->_value = v12;

    v14 = objc_msgSend(v9, "copy");
    name = v11->_name;
    v11->_name = (NSString *)v14;
  }
  else
  {
    SRLogCategoryGeneral();
    name = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(name, OS_LOG_TYPE_ERROR))
      -[SRParameter initWithString:flags:name:].cold.1();
  }

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  NSObject *v5;
  int64_t *p_type;
  NSString *irisName;
  void *v8;
  id v9;
  NSObject *v11;

  v4 = objc_alloc_init((Class)objc_opt_class());
  if (!v4)
  {
    SRLogCategoryGeneral();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SRParameter copyWithZone:].cold.2();

  }
  p_type = &self->_type;
  objc_msgSend(v4, "setType:", self->_type);
  objc_msgSend(v4, "setName:", self->_name);
  irisName = self->_irisName;
  if (irisName)
  {
    v8 = (void *)-[NSString copy](irisName, "copy");
    objc_msgSend(v4, "setIrisName:", v8);

  }
  else
  {
    objc_msgSend(v4, "setIrisName:", 0);
  }
  if ((unint64_t)*p_type < 3)
  {
    objc_msgSend(v4, "setNumber:", self->_value);
LABEL_12:
    v9 = v4;
    goto LABEL_13;
  }
  if ((unint64_t)(*p_type - 3) < 2)
  {
    objc_msgSend(v4, "setString:", self->_value);
    goto LABEL_12;
  }
  SRLogCategoryGeneral();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    -[SRParameter copyWithZone:].cold.1();

  v9 = 0;
LABEL_13:

  return v9;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void)setName:(id)a3
{
  NSString *v4;
  NSString *name;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  name = self->_name;
  self->_name = v4;

}

- (NSString)name
{
  return self->_name;
}

- (void)setNumber:(id)a3
{
  NSObject *v4;
  NSObject *value;
  NSObject *v6;

  v4 = a3;
  v6 = v4;
  if (v4)
    v4 = v4;
  value = self->_value;
  self->_value = v4;

}

- (void)setString:(id)a3
{
  NSObject *v4;
  NSObject *value;

  if (a3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:");
    v4 = objc_claimAutoreleasedReturnValue();
    value = self->_value;
    self->_value = v4;
  }
  else
  {
    value = self->_value;
    self->_value = 0;
  }

}

- (id)getFilePathNameValue
{
  void *v3;
  void *v4;
  NSObject *v5;

  if (-[SRParameter isFilePath](self, "isFilePath"))
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", self->_value);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lastPathComponent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    SRLogCategoryGeneral();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[SRParameter getFilePathValue].cold.1();

    v4 = 0;
  }
  return v4;
}

- (id)getFilePathValue
{
  NSObject *v3;
  NSObject *v4;

  if (-[SRParameter isFilePath](self, "isFilePath"))
  {
    v3 = self->_value;
  }
  else
  {
    SRLogCategoryGeneral();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[SRParameter getFilePathValue].cold.1();

    v3 = 0;
  }
  return v3;
}

- (BOOL)isFilePath
{
  return self->_type == 4;
}

- (BOOL)isLong
{
  return self->_type == 1;
}

- (BOOL)isPositiveLong
{
  NSObject *value;

  if (self->_type == 1)
  {
    value = self->_value;
    if (value)
      LOBYTE(value) = -[NSObject longValue](value, "longValue") > 0;
  }
  else
  {
    LOBYTE(value) = 0;
  }
  return (char)value;
}

- (BOOL)isNil
{
  NSObject *v3;

  if (self->_type <= 4uLL)
    return self->_value == 0;
  SRLogCategoryGeneral();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    -[SRParameter isNil].cold.1();

  return 1;
}

- (id)getLongValue
{
  NSObject *v3;
  NSObject *v4;

  if (-[SRParameter isLong](self, "isLong"))
  {
    v3 = self->_value;
  }
  else
  {
    SRLogCategoryGeneral();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[SRParameter getLongValue].cold.1();

    v3 = 0;
  }
  return v3;
}

- (int64_t)flag
{
  return self->_flag;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_irisName, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (SRParameter)initWithType:(int64_t)a3 flags:(int64_t)a4 name:(id)a5
{
  id v8;
  SRParameter *v9;
  SRParameter *v10;
  uint64_t v11;
  NSString *name;
  NSString *irisName;
  NSObject *value;
  SRParameter *v15;
  NSObject *v17;
  objc_super v18;

  v8 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SRParameter;
  v9 = -[SRParameter init](&v18, sel_init);
  v10 = v9;
  if (!v9)
  {
    SRLogCategoryGeneral();
    value = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(value, OS_LOG_TYPE_ERROR))
      -[SRParameter initWithType:flags:name:].cold.1();
    goto LABEL_7;
  }
  v9->_type = a3;
  v9->_flag = a4;
  v11 = objc_msgSend(v8, "copy");
  name = v10->_name;
  v10->_name = (NSString *)v11;

  irisName = v10->_irisName;
  v10->_irisName = 0;

  if ((unint64_t)a3 < 3 || (unint64_t)(a3 - 3) < 2)
  {
    value = v10->_value;
    v10->_value = 0;
LABEL_7:

    v15 = v10;
    goto LABEL_8;
  }
  SRLogCategoryGeneral();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    -[SRParameter initWithType:flags:name:].cold.2();

  v15 = 0;
LABEL_8:

  return v15;
}

+ (id)nilParameterWithType:(int64_t)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithType:flags:name:", a3, 0, CFSTR("Unknown"));
}

+ (id)typeStringFromParameterType:(int64_t)a3
{
  if ((unint64_t)a3 > 4)
    return 0;
  else
    return off_2519087E0[a3];
}

- (id)typeString
{
  return +[SRParameter typeStringFromParameterType:](SRParameter, "typeStringFromParameterType:", self->_type);
}

- (void)makeNil
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_24798C000, v0, v1, "makeNil for SRParameter with invalid type %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (BOOL)isBool
{
  return self->_type == 0;
}

- (BOOL)isDouble
{
  return self->_type == 2;
}

- (BOOL)isString
{
  return self->_type == 3;
}

- (id)description
{
  void *v2;
  NSObject *value;
  int v4;
  const __CFString *v5;
  __CFString *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  const __CFString *v13;
  NSObject *v14;
  void *v15;
  const __CFString *v17;

  switch(self->_type)
  {
    case 0:
      v2 = (void *)MEMORY[0x24BDD17C8];
      value = self->_value;
      if (value)
      {
        v4 = -[NSObject BOOLValue](value, "BOOLValue");
        v5 = CFSTR("NO");
        if (v4)
          v5 = CFSTR("YES");
      }
      else
      {
        v5 = CFSTR("nil");
      }
      v17 = v5;
      v13 = CFSTR("type = Boolean, value = %@");
      goto LABEL_23;
    case 1:
      v2 = (void *)MEMORY[0x24BDD17C8];
      v7 = self->_value;
      if (v7)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), -[NSObject longValue](v7, "longValue"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "stringWithFormat:", CFSTR("type = Long, value = %@"), v8);
        goto LABEL_11;
      }
      v17 = CFSTR("nil");
      v13 = CFSTR("type = Long, value = %@");
      goto LABEL_23;
    case 2:
      v2 = (void *)MEMORY[0x24BDD17C8];
      v9 = self->_value;
      if (v9)
      {
        -[NSObject doubleValue](v9, "doubleValue");
        objc_msgSend(v2, "stringWithFormat:", CFSTR("%.10e"), v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "stringWithFormat:", CFSTR("type = Double, value = %@"), v8);
LABEL_11:
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v17 = CFSTR("nil");
        v13 = CFSTR("type = Double, value = %@");
LABEL_23:
        v15 = v2;
LABEL_24:
        objc_msgSend(v15, "stringWithFormat:", v13, v17);
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      return v6;
    case 3:
      v11 = (void *)MEMORY[0x24BDD17C8];
      v12 = self->_value;
      if (!v12)
        v12 = CFSTR("nil");
      v17 = (const __CFString *)v12;
      v13 = CFSTR("type = String, value = %@");
      goto LABEL_18;
    case 4:
      v11 = (void *)MEMORY[0x24BDD17C8];
      v14 = self->_value;
      if (!v14)
        v14 = CFSTR("nil");
      v17 = (const __CFString *)v14;
      v13 = CFSTR("type = FilePath, value = %@");
LABEL_18:
      v15 = v11;
      goto LABEL_24;
    default:
      v6 = &stru_251909998;
      return v6;
  }
}

+ (id)BOOLNo
{
  if (BOOLNo_onceToken != -1)
    dispatch_once(&BOOLNo_onceToken, &__block_literal_global_3);
  return (id)BOOLNo_paramBoolNo;
}

void __21__SRParameter_BOOLNo__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[SRParameter parameterWithBoolean:name:](SRParameter, "parameterWithBoolean:name:", 0, CFSTR("Unknown"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)BOOLNo_paramBoolNo;
  BOOLNo_paramBoolNo = v0;

}

+ (id)BOOLYes
{
  if (BOOLYes_onceToken != -1)
    dispatch_once(&BOOLYes_onceToken, &__block_literal_global_36_0);
  return (id)BOOLYes_paramBoolYes;
}

void __22__SRParameter_BOOLYes__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[SRParameter parameterWithBoolean:name:](SRParameter, "parameterWithBoolean:name:", 1, CFSTR("Unknown"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)BOOLYes_paramBoolYes;
  BOOLYes_paramBoolYes = v0;

}

+ (id)longZero
{
  if (longZero_onceToken != -1)
    dispatch_once(&longZero_onceToken, &__block_literal_global_37_0);
  return (id)longZero_paramLongZero;
}

void __23__SRParameter_longZero__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[SRParameter parameterWithLong:name:](SRParameter, "parameterWithLong:name:", 0, CFSTR("Unknown"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)longZero_paramLongZero;
  longZero_paramLongZero = v0;

}

+ (id)doubleMin
{
  if (doubleMin_onceToken != -1)
    dispatch_once(&doubleMin_onceToken, &__block_literal_global_38_0);
  return (id)doubleMin_paramDoubleMin;
}

void __24__SRParameter_doubleMin__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[SRParameter parameterWithDouble:name:](SRParameter, "parameterWithDouble:name:", CFSTR("Unknown"), 2.22507386e-308);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)doubleMin_paramDoubleMin;
  doubleMin_paramDoubleMin = v0;

}

+ (id)BOOLNil
{
  if (BOOLNil_onceToken != -1)
    dispatch_once(&BOOLNil_onceToken, &__block_literal_global_39);
  return (id)BOOLNil_paramBoolNil;
}

void __22__SRParameter_BOOLNil__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[SRParameter nilParameterWithType:](SRParameter, "nilParameterWithType:", 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)BOOLNil_paramBoolNil;
  BOOLNil_paramBoolNil = v0;

}

+ (id)longNil
{
  if (longNil_onceToken != -1)
    dispatch_once(&longNil_onceToken, &__block_literal_global_40);
  return (id)longNil_paramLongNil;
}

void __22__SRParameter_longNil__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[SRParameter nilParameterWithType:](SRParameter, "nilParameterWithType:", 1);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)longNil_paramLongNil;
  longNil_paramLongNil = v0;

}

+ (id)doubleNil
{
  if (doubleNil_onceToken != -1)
    dispatch_once(&doubleNil_onceToken, &__block_literal_global_41);
  return (id)doubleNil_paramDoubleNil;
}

void __24__SRParameter_doubleNil__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[SRParameter nilParameterWithType:](SRParameter, "nilParameterWithType:", 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)doubleNil_paramDoubleNil;
  doubleNil_paramDoubleNil = v0;

}

+ (id)stringNil
{
  if (stringNil_onceToken != -1)
    dispatch_once(&stringNil_onceToken, &__block_literal_global_42);
  return (id)stringNil_paramStringNil;
}

void __24__SRParameter_stringNil__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[SRParameter nilParameterWithType:](SRParameter, "nilParameterWithType:", 3);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)stringNil_paramStringNil;
  stringNil_paramStringNil = v0;

}

+ (id)filePathNil
{
  if (filePathNil_onceToken != -1)
    dispatch_once(&filePathNil_onceToken, &__block_literal_global_43);
  return (id)filePathNil_paramFilePathNil;
}

void __26__SRParameter_filePathNil__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[SRParameter nilParameterWithType:](SRParameter, "nilParameterWithType:", 4);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)filePathNil_paramFilePathNil;
  filePathNil_paramFilePathNil = v0;

}

- (id)getBooleanValue
{
  NSObject *v3;
  NSObject *v4;

  if (-[SRParameter isBool](self, "isBool"))
  {
    v3 = self->_value;
  }
  else
  {
    SRLogCategoryGeneral();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[SRParameter getBooleanValue].cold.1();

    v3 = 0;
  }
  return v3;
}

- (id)getDoubleValue
{
  NSObject *v3;
  NSObject *v4;

  if (-[SRParameter isDouble](self, "isDouble"))
  {
    v3 = self->_value;
  }
  else
  {
    SRLogCategoryGeneral();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[SRParameter getDoubleValue].cold.1();

    v3 = 0;
  }
  return v3;
}

- (id)getStringValue
{
  NSObject *v3;
  NSObject *v4;

  if (-[SRParameter isString](self, "isString"))
  {
    v3 = self->_value;
  }
  else
  {
    SRLogCategoryGeneral();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[SRParameter getStringValue].cold.1();

    v3 = 0;
  }
  return v3;
}

- (BOOL)updateWithBoolean:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL4 v5;
  NSObject *v6;
  NSObject *value;
  NSObject *v8;

  v3 = a3;
  v5 = -[SRParameter isBool](self, "isBool");
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
    v6 = objc_claimAutoreleasedReturnValue();
    value = self->_value;
    self->_value = v6;

  }
  else
  {
    SRLogCategoryGeneral();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SRParameter updateWithBoolean:].cold.1();

  }
  return v5;
}

- (BOOL)updateWithLong:(int64_t)a3
{
  _BOOL4 v5;
  NSObject *v6;
  NSObject *value;
  NSObject *v8;

  v5 = -[SRParameter isLong](self, "isLong");
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", a3);
    v6 = objc_claimAutoreleasedReturnValue();
    value = self->_value;
    self->_value = v6;

  }
  else
  {
    SRLogCategoryGeneral();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SRParameter updateWithLong:].cold.1();

  }
  return v5;
}

- (BOOL)updateWithDouble:(double)a3
{
  _BOOL4 v5;
  NSObject *v6;
  NSObject *value;
  NSObject *v8;

  v5 = -[SRParameter isDouble](self, "isDouble");
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
    v6 = objc_claimAutoreleasedReturnValue();
    value = self->_value;
    self->_value = v6;

  }
  else
  {
    SRLogCategoryGeneral();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SRParameter updateWithDouble:].cold.1();

  }
  return v5;
}

- (BOOL)updateWithString:(id)a3
{
  id v4;
  _BOOL4 v5;
  NSObject *v6;
  NSObject *value;
  NSObject *v8;

  v4 = a3;
  v5 = -[SRParameter isString](self, "isString");
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    value = self->_value;
    self->_value = v6;

  }
  else
  {
    SRLogCategoryGeneral();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SRParameter updateWithString:].cold.1();

  }
  return v5;
}

- (BOOL)updateWithFilePath:(id)a3
{
  id v4;
  _BOOL4 v5;
  NSObject *v6;
  NSObject *value;
  NSObject *v8;

  v4 = a3;
  v5 = -[SRParameter isFilePath](self, "isFilePath");
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    value = self->_value;
    self->_value = v6;

  }
  else
  {
    SRLogCategoryGeneral();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[SRParameter updateWithFilePath:].cold.1();

  }
  return v5;
}

- (int64_t)type
{
  return self->_type;
}

- (NSObject)value
{
  return self->_value;
}

- (NSString)irisName
{
  return self->_irisName;
}

- (void)setIrisName:(id)a3
{
  objc_storeStrong((id *)&self->_irisName, a3);
}

- (void)initWithType:flags:name:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_5(&dword_24798C000, v0, v1, "initWithType for SRParameter returns nil self", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_0();
}

- (void)initWithType:flags:name:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_24798C000, v0, v1, "initWithType for SRParameter with invalid type: %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)initWithBoolean:flags:name:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_5(&dword_24798C000, v0, v1, "initWithBoolean for SRParameter returns nil self", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_0();
}

- (void)initWithLong:flags:name:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_5(&dword_24798C000, v0, v1, "initWithLong for SRParameter returns nil self", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_0();
}

- (void)initWithDouble:flags:name:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_5(&dword_24798C000, v0, v1, "initWithDouble for SRParameter returns nil self", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_0();
}

- (void)initWithString:flags:name:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_5(&dword_24798C000, v0, v1, "initWithString for SRParameter returns nil self", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_0();
}

- (void)initWithFilePath:flags:name:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_5(&dword_24798C000, v0, v1, "initWithFilePath for SRParameter returns nil self", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_0();
}

- (void)copyWithZone:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_24798C000, v0, v1, "copyWithZone for SRParameter with invalid type %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)copyWithZone:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_5(&dword_24798C000, v0, v1, "copyWithZone for SRParameter returning nil self", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_5_0();
}

- (void)isNil
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_24798C000, v0, v1, "isNil for SRParameter with invalid type %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)getBooleanValue
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_24798C000, v0, v1, "SRParameter getBooleanValue called for type %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)getLongValue
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_24798C000, v0, v1, "SRParameter getLongValue called for type %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)getDoubleValue
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_24798C000, v0, v1, "SRParameter getDoubleValue called for type %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)getStringValue
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_24798C000, v0, v1, "SRParameter getStringValue called for type %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)getFilePathValue
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_24798C000, v0, v1, "SRParameter getFilePathValue called for type %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)updateWithBoolean:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_24798C000, v0, v1, "SRParameter updateWithBoolean called for type %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)updateWithLong:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_24798C000, v0, v1, "SRParameter updateWithLong called for type %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)updateWithDouble:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_24798C000, v0, v1, "SRParameter updateWithDouble called for type %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)updateWithString:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_24798C000, v0, v1, "SRParameter updateWithString called for type %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)updateWithFilePath:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_24798C000, v0, v1, "SRParameter updateWithFilePath called for type %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
