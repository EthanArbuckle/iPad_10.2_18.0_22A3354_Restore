@implementation SYDStoreID

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  SYDTestConfiguration *testConfiguration;
  void *v6;
  id v7;

  identifier = self->_identifier;
  v7 = a3;
  objc_msgSend(v7, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(v7, "encodeInteger:forKey:", self->_type, CFSTR("type"));
  testConfiguration = self->_testConfiguration;
  NSStringFromSelector(sel_testConfiguration);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", testConfiguration, v6);

  objc_msgSend(v7, "encodeObject:forKey:", self->_personaUniqueString, CFSTR("persona"));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaUniqueString, 0);
  objc_storeStrong((id *)&self->_testConfiguration, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (SYDStoreID)initWithCoder:(id)a3
{
  id v4;
  SYDStoreID *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  SYDTestConfiguration *testConfiguration;
  uint64_t v12;
  NSString *personaUniqueString;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SYDStoreID;
  v5 = -[SYDStoreID init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    v8 = objc_opt_class();
    NSStringFromSelector(sel_testConfiguration);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, v9);
    v10 = objc_claimAutoreleasedReturnValue();
    testConfiguration = v5->_testConfiguration;
    v5->_testConfiguration = (SYDTestConfiguration *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("persona"));
    v12 = objc_claimAutoreleasedReturnValue();
    personaUniqueString = v5->_personaUniqueString;
    v5->_personaUniqueString = (NSString *)v12;

  }
  return v5;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;

  -[SYDStoreID identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  v5 = -[SYDStoreID type](self, "type") ^ v4;
  -[SYDStoreID testConfiguration](self, "testConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");

  -[SYDStoreID personaUniqueString](self, "personaUniqueString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[SYDStoreID personaUniqueString](self, "personaUniqueString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7 ^= objc_msgSend(v9, "hash");

  }
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  char v16;
  void *v17;
  void *v19;
  void *v20;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    v5 = v4;
    v6 = objc_msgSend(v5, "type");
    if (v6 == -[SYDStoreID type](self, "type"))
    {
      objc_msgSend(v5, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SYDStoreID identifier](self, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToString:", v8);

      if (v9)
      {
        -[SYDStoreID personaUniqueString](self, "personaUniqueString");
        v10 = objc_claimAutoreleasedReturnValue();
        if (!v10)
          goto LABEL_6;
        v11 = (void *)v10;
        -[SYDStoreID personaUniqueString](self, "personaUniqueString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "personaUniqueString");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqualToString:", v13);

        if (v14)
        {
LABEL_6:
          -[SYDStoreID personaUniqueString](self, "personaUniqueString");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {

LABEL_13:
            -[SYDStoreID testConfiguration](self, "testConfiguration");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "testConfiguration");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = SYDObjectsAreBothNilOrEqual(v19, v20);

            goto LABEL_11;
          }
          objc_msgSend(v5, "personaUniqueString");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v17)
            goto LABEL_13;
        }
      }
    }
    v16 = 0;
LABEL_11:

    goto LABEL_12;
  }
  v16 = 0;
LABEL_12:

  return v16;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SYDStoreID identifier](self, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  SYDStringForStoreType(-[SYDStoreID type](self, "type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; identifier=%@ type=%@"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SYDStoreID personaUniqueString](self, "personaUniqueString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[SYDStoreID personaUniqueString](self, "personaUniqueString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR(" persona=%@"), v10);

  }
  -[SYDStoreID testConfiguration](self, "testConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[SYDStoreID testConfiguration](self, "testConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "appendFormat:", CFSTR(" testConfiguration=%@"), v12);

  }
  objc_msgSend(v8, "appendString:", CFSTR(">"));
  return v8;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)type
{
  return self->_type;
}

- (NSString)personaUniqueString
{
  return self->_personaUniqueString;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SYDStoreID)initWithIdentifier:(id)a3 type:(int64_t)a4
{
  id v8;
  SYDStoreID *v9;
  SYDStoreID *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSString *personaUniqueString;
  void *v16;
  objc_class *v17;
  void *v18;
  objc_super v19;

  v8 = a3;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SYDStoreID.m"), 37, CFSTR("Trying to instantiate a %@ without an identifier"), v18);

  }
  v19.receiver = self;
  v19.super_class = (Class)SYDStoreID;
  v9 = -[SYDStoreID init](&v19, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    v10->_type = a4;
    if (SYDIsDataSeparatedPersona())
    {
      objc_msgSend(MEMORY[0x24BEBF270], "currentPersona");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "userPersonaUniqueString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "copy");
      personaUniqueString = v10->_personaUniqueString;
      v10->_personaUniqueString = (NSString *)v13;

    }
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  SYDStoreID *v4;
  void *v5;
  SYDStoreID *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = +[SYDStoreID allocWithZone:](SYDStoreID, "allocWithZone:", a3);
  -[SYDStoreID identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SYDStoreID initWithIdentifier:type:](v4, "initWithIdentifier:type:", v5, -[SYDStoreID type](self, "type"));

  -[SYDStoreID testConfiguration](self, "testConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  -[SYDStoreID setTestConfiguration:](v6, "setTestConfiguration:", v8);

  -[SYDStoreID personaUniqueString](self, "personaUniqueString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  -[SYDStoreID setPersonaUniqueString:](v6, "setPersonaUniqueString:", v10);

  return v6;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (SYDTestConfiguration)testConfiguration
{
  return self->_testConfiguration;
}

- (void)setTestConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setPersonaUniqueString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

@end
