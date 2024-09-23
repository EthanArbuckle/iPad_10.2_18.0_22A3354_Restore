@implementation WFDatabaseObjectDescriptor

- (WFDatabaseObjectDescriptor)initWithIdentifier:(id)a3 objectType:(unint64_t)a4
{
  id v7;
  WFDatabaseObjectDescriptor *v8;
  uint64_t v9;
  NSString *identifier;
  WFDatabaseObjectDescriptor *v11;
  void *v13;
  void *v14;
  objc_super v15;

  v7 = a3;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDatabaseObjectDescriptor.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

  }
  if (a4 == 11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WFDatabaseObjectDescriptor.m"), 49, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("objectType != WFDatabaseObjectTypeOther"));

  }
  v15.receiver = self;
  v15.super_class = (Class)WFDatabaseObjectDescriptor;
  v8 = -[WFDatabaseObjectDescriptor init](&v15, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v7, "copy");
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v9;

    v8->_objectType = a4;
    v11 = v8;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  -[WFDatabaseObjectDescriptor identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = v4 ^ -[WFDatabaseObjectDescriptor objectType](self, "objectType") ^ 0xABCD1234;

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)objectType
{
  return self->_objectType;
}

- (WFDatabaseObjectDescriptor)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  WFDatabaseObjectDescriptor *v8;

  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("objectType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    self = -[WFDatabaseObjectDescriptor initWithIdentifier:objectType:](self, "initWithIdentifier:objectType:", v7, v6);
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("objectType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[WFDatabaseObjectDescriptor objectType](self, "objectType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("identifier");
  v8[0] = v3;
  -[WFDatabaseObjectDescriptor identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WFDatabaseObjectDescriptor identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[WFDatabaseObjectDescriptor objectType](self, "objectType");
  if (v7 > 0xB)
    v8 = CFSTR("Unknown");
  else
    v8 = off_1E5FC8100[v7];
  v9 = v8;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, identifier: %@, objectType: %@>"), v5, self, v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  WFDatabaseObjectDescriptor *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (WFDatabaseObjectDescriptor *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[WFDatabaseObjectDescriptor identifier](v4, "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFDatabaseObjectDescriptor identifier](self, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqualToString:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (WFDatabaseObjectDescriptor)initWithCoder:(id)a3
{
  id v4;
  WFDatabaseObjectDescriptor *v5;
  uint64_t v6;
  NSString *identifier;
  WFDatabaseObjectDescriptor *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFDatabaseObjectDescriptor;
  v5 = -[WFDatabaseObjectDescriptor init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_objectType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("objectType"));
    v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[WFDatabaseObjectDescriptor identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("identifier"));

  objc_msgSend(v5, "encodeInteger:forKey:", -[WFDatabaseObjectDescriptor objectType](self, "objectType"), CFSTR("objectType"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)mockWithIdentifier:(id)a3 objectType:(unint64_t)a4
{
  id v5;
  WFDatabaseObjectDescriptor *v6;

  v5 = a3;
  v6 = -[WFDatabaseObjectDescriptor initWithIdentifier:objectType:]([WFDatabaseObjectDescriptor alloc], "initWithIdentifier:objectType:", v5, a4);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
