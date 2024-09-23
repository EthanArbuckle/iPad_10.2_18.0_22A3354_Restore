@implementation ATXCustomIntentDescription

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXCustomIntentDescription)initWithTypeName:(id)a3 parameters:(id)a4
{
  id v6;
  id v7;
  ATXCustomIntentDescription *v8;
  uint64_t v9;
  NSString *typeName;
  uint64_t v11;
  NSDictionary *parameters;
  ATXCustomIntentDescription *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)ATXCustomIntentDescription;
  v8 = -[ATXCustomIntentDescription init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    typeName = v8->_typeName;
    v8->_typeName = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    parameters = v8->_parameters;
    v8->_parameters = (NSDictionary *)v11;

    v13 = v8;
  }

  return v8;
}

- (ATXCustomIntentDescription)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  ATXCustomIntentDescription *v14;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("typeName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x1AF421DC4]();
    v7 = objc_alloc(MEMORY[0x1E0C99E60]);
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v11 = objc_opt_class();
    v12 = (void *)objc_msgSend(v7, "initWithObjects:", v8, v9, v10, v11, objc_opt_class(), 0);
    objc_autoreleasePoolPop(v6);
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("parameters"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    self = -[ATXCustomIntentDescription initWithTypeName:parameters:](self, "initWithTypeName:parameters:", v5, v13);
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *typeName;
  id v5;

  typeName = self->_typeName;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", typeName, CFSTR("typeName"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_parameters, CFSTR("parameters"));

}

- (id)description
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Intent Type: %@ Parameters: %@"), self->_typeName, self->_parameters);
}

- (BOOL)isEqual:(id)a3
{
  ATXCustomIntentDescription *v4;
  ATXCustomIntentDescription *v5;
  NSString *typeName;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  char v10;
  char v11;
  NSDictionary *v12;
  NSDictionary *v13;

  v4 = (ATXCustomIntentDescription *)a3;
  if (self == v4)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      typeName = self->_typeName;
      v7 = v5->_typeName;
      if (typeName == v7)
      {

      }
      else
      {
        v8 = v7;
        v9 = typeName;
        v10 = -[NSString isEqual:](v9, "isEqual:", v8);

        if ((v10 & 1) == 0)
        {
          v11 = 0;
LABEL_13:

          goto LABEL_14;
        }
      }
      v12 = self->_parameters;
      v13 = v12;
      if (v12 == v5->_parameters)
        v11 = 1;
      else
        v11 = -[NSDictionary isEqual:](v12, "isEqual:");

      goto LABEL_13;
    }
    v11 = 0;
  }
LABEL_14:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_typeName, "hash");
  return -[NSDictionary hash](self->_parameters, "hash") - v3 + 32 * v3;
}

- (id)createIntent
{
  void *v3;
  void *v4;
  void *v5;
  NSDictionary *parameters;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  id v15;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1AF421DC4](self, a2);
  objc_msgSend((id)*MEMORY[0x1E0CBDD68], "stringByAppendingString:", self->_typeName);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB36D8];
  parameters = self->_parameters;
  v16 = CFSTR("parameters");
  v17[0] = parameters;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v5, "dataWithJSONObject:options:error:", v7, 1, &v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v15;

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CBD970], "atx_createIntentWithIntentType:intentData:", v4, v8);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v11 = v10;
      v12 = v11;
    }
    else
    {
      __atxlog_handle_default();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[ATXCustomIntentDescription createIntent].cold.2((uint64_t)v4, v13);

      v12 = 0;
    }
  }
  else
  {
    __atxlog_handle_default();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[ATXCustomIntentDescription createIntent].cold.1((uint64_t)v4, (uint64_t)v9, v11);
    v12 = 0;
  }

  objc_autoreleasePoolPop(v3);
  return v12;
}

- (NSString)typeName
{
  return self->_typeName;
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_typeName, 0);
}

- (void)createIntent
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1AA841000, a2, OS_LOG_TYPE_ERROR, "Could not make intent of type: %@", (uint8_t *)&v2, 0xCu);
}

@end
