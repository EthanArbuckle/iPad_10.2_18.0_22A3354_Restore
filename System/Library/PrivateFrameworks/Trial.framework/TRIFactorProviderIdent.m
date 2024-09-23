@implementation TRIFactorProviderIdent

- (TRIFactorProviderIdent)initWithType:(unsigned __int8)a3 value:(id)a4
{
  id v8;
  TRIFactorProviderIdent *v9;
  TRIFactorProviderIdent *v10;
  void *v12;
  objc_super v13;

  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIClientTupleTypes.m"), 1364, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("value != nil"));

  }
  v13.receiver = self;
  v13.super_class = (Class)TRIFactorProviderIdent;
  v9 = -[TRIFactorProviderIdent init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_type = a3;
    objc_storeStrong((id *)&v9->_value, a4);
  }

  return v10;
}

+ (id)identWithType:(unsigned __int8)a3 value:(id)a4
{
  uint64_t v4;
  id v6;
  void *v7;

  v4 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithType:value:", v4, v6);

  return v7;
}

- (id)copyWithReplacementType:(unsigned __int8)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithType:value:", a3, self->_value);
}

- (id)copyWithReplacementValue:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithType:value:", self->_type, v4);

  return v5;
}

- (BOOL)isEqualToIdent:(id)a3
{
  id v4;
  void *v5;
  int type;
  int v7;
  void *v8;
  int v9;
  NSString *value;
  void *v11;
  char v12;

  v4 = a3;
  v5 = v4;
  if (v4
    && (type = self->_type, type == objc_msgSend(v4, "type"))
    && (v7 = self->_value != 0,
        objc_msgSend(v5, "value"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = v8 == 0,
        v8,
        v7 != v9))
  {
    value = self->_value;
    if (value)
    {
      objc_msgSend(v5, "value");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[NSString isEqual:](value, "isEqual:", v11);

    }
    else
    {
      v12 = 1;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  TRIFactorProviderIdent *v4;
  TRIFactorProviderIdent *v5;
  BOOL v6;

  v4 = (TRIFactorProviderIdent *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[TRIFactorProviderIdent isEqualToIdent:](self, "isEqualToIdent:", v5);

  return v6;
}

- (unint64_t)hash
{
  uint64_t type;

  type = self->_type;
  return -[NSString hash](self->_value, "hash") - type + 32 * type;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TRIFactorProviderIdent)initWithCoder:(id)a3
{
  id v4;
  unsigned __int8 v5;
  uint64_t v6;
  void *v7;
  TRIFactorProviderIdent *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  const __CFString *v24;
  uint64_t v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("type"));
  if (v5)
    goto LABEL_2;
  objc_msgSend(v4, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    if ((objc_msgSend(v4, "containsValueForKey:", CFSTR("type")) & 1) == 0)
    {
      v25 = *MEMORY[0x1E0CB2D50];
      v26[0] = CFSTR("Missing serialized value for TRIFactorProviderIdent.type");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v26, &v25, 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIFactorProviderIdentOCNTErrorDomain"), 1, v7);
      objc_msgSend(v4, "failWithError:", v14);
      goto LABEL_13;
    }
LABEL_2:
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("value"));
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(v4, "error");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        v23 = *MEMORY[0x1E0CB2D50];
        v24 = CFSTR("Retrieved nil serialized value for nonnull TRIFactorProviderIdent.value");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIFactorProviderIdentOCNTErrorDomain"), 2, v11);
        objc_msgSend(v4, "failWithError:", v12);

      }
      v7 = 0;
      goto LABEL_14;
    }
    v7 = (void *)v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      self = -[TRIFactorProviderIdent initWithType:value:](self, "initWithType:value:", v5, v7);
      v8 = self;
LABEL_15:

      goto LABEL_16;
    }
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unarchived unexpected class for TRIFactorProviderIdent key \"value\" (expected %@, decoded %@)"), v14, v16, 0);
    v21 = *MEMORY[0x1E0CB2D50];
    v22 = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("TRIFactorProviderIdentOCNTErrorDomain"), 3, v18);
    objc_msgSend(v4, "failWithError:", v19);

LABEL_13:
LABEL_14:
    v8 = 0;
    goto LABEL_15;
  }
  v8 = 0;
LABEL_16:

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *value;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", self->_type, CFSTR("type"));
  value = self->_value;
  if (value)
    objc_msgSend(v5, "encodeObject:forKey:", value, CFSTR("value"));

}

- (id)description
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", self->_type);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<TRIFactorProviderIdent | type:%@ value:%@>"), v4, self->_value);

  return v5;
}

- (unsigned)type
{
  return self->_type;
}

- (NSString)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
}

@end
