@implementation STVersionVectorNode

- (STVersionVectorNode)initWithIdentifier:(id)a3
{
  id v4;
  STVersionVectorNode *v5;
  uint64_t v6;
  NSString *identifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STVersionVectorNode;
  v5 = -[STVersionVectorNode init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_count = 0;
  }

  return v5;
}

- (STVersionVectorNode)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  STVersionVectorNode *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[STVersionVectorNode initWithIdentifier:](self, "initWithIdentifier:", v6);
  if (v7)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("c"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7->_count = objc_msgSend(v9, "unsignedIntegerValue");

    }
  }

  return v7;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  -[STVersionVectorNode identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v3;
  v8 = CFSTR("c");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[STVersionVectorNode count](self, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v6;
}

- (void)increment
{
  -[STVersionVectorNode setCount:](self, "setCount:", -[STVersionVectorNode count](self, "count") + 1);
}

- (void)join:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  NSObject *v11;

  v4 = a3;
  -[STVersionVectorNode identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if (v7)
  {
    v8 = objc_msgSend(v4, "count");
    v9 = -[STVersionVectorNode count](self, "count");
    if (v8 <= v9)
      v10 = v9;
    else
      v10 = v8;
    self->_count = v10;
  }
  else
  {
    +[STLog versionVector](STLog, "versionVector");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      -[STVersionVectorNode join:].cold.1(v11);

  }
}

- (int64_t)compare:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  void *v13;

  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_5;
  -[STVersionVectorNode identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if ((v8 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("STVersionVectorNode.m"), 72, CFSTR("Cannot compare vector nodes with different identifiers"));

  }
  v9 = -[STVersionVectorNode count](self, "count");
  if (v9 >= objc_msgSend(v5, "count"))
  {
    v11 = -[STVersionVectorNode count](self, "count");
    v10 = v11 > objc_msgSend(v5, "count");
  }
  else
  {
LABEL_5:
    v10 = -1;
  }

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[STVersionVectorNode identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@: %lu"), v4, -[STVersionVectorNode count](self, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[STVersionVectorNode identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p { identifier = %@, count = %lu }>"), v4, self, v5, -[STVersionVectorNode count](self, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqualToNode:(id)a3
{
  STVersionVectorNode *v4;
  STVersionVectorNode *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;

  v4 = (STVersionVectorNode *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v9 = 1;
  }
  else
  {
    -[STVersionVectorNode identifier](v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[STVersionVectorNode identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
    {
      v8 = -[STVersionVectorNode count](v5, "count");
      v9 = v8 == -[STVersionVectorNode count](self, "count");
    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (BOOL)isEqual:(id)a3
{
  STVersionVectorNode *v4;
  STVersionVectorNode *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = (STVersionVectorNode *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    -[STVersionVectorNode identifier](v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[STVersionVectorNode identifier](self, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqual:", v7);

  }
  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[STVersionVectorNode identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (STVersionVectorNode)initWithCoder:(id)a3
{
  id v4;
  STVersionVectorNode *v5;
  uint64_t v6;
  NSString *identifier;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)STVersionVectorNode;
  v5 = -[STVersionVectorNode init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_count = objc_msgSend(v8, "unsignedIntegerValue");

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;
  id v6;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_count);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("count"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;

  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithIdentifier:", self->_identifier);
  objc_msgSend(v4, "setCount:", self->_count);
  return v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)join:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1D22E7000, log, OS_LOG_TYPE_FAULT, "Cannot join vector nodes with different identifiers", v1, 2u);
}

@end
