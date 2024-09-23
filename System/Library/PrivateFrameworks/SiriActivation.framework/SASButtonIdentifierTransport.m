@implementation SASButtonIdentifierTransport

- (SASButtonIdentifierTransport)initWithSiriButtonIdentifier:(int64_t)a3
{
  SASButtonIdentifierTransport *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SASButtonIdentifierTransport;
  v4 = -[SASButtonIdentifierTransport init](&v7, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithSiriButtonIdentifier:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SASButtonIdentifierTransport setIdentifier:](v4, "setIdentifier:", v5);

  }
  return v4;
}

- (SASButtonIdentifierTransport)initWithString:(id)a3
{
  id v4;
  SASButtonIdentifierTransport *v5;
  SASButtonIdentifierTransport *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SASButtonIdentifierTransport;
  v5 = -[SASButtonIdentifierTransport init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[SASButtonIdentifierTransport setIdentifier:](v5, "setIdentifier:", v4);

  return v6;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[SASButtonIdentifierTransport identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("SASButtonIdentifierTransport:%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_identifierMatchesSiriButtonIdentifier:(int64_t)a3
{
  void *v4;
  void *v5;
  char v6;

  -[SASButtonIdentifierTransport identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithSiriButtonIdentifier:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  return v6;
}

- (int64_t)siriButtonIdentifier
{
  int64_t v3;
  void *v4;

  v3 = 1;
  if (!-[SASButtonIdentifierTransport _identifierMatchesSiriButtonIdentifier:](self, "_identifierMatchesSiriButtonIdentifier:", 1))
  {
    v3 = 2;
    if (!-[SASButtonIdentifierTransport _identifierMatchesSiriButtonIdentifier:](self, "_identifierMatchesSiriButtonIdentifier:", 2))
    {
      v3 = 3;
      if (!-[SASButtonIdentifierTransport _identifierMatchesSiriButtonIdentifier:](self, "_identifierMatchesSiriButtonIdentifier:", 3))
      {
        v3 = 4;
        if (!-[SASButtonIdentifierTransport _identifierMatchesSiriButtonIdentifier:](self, "_identifierMatchesSiriButtonIdentifier:", 4))
        {
          v3 = 5;
          if (!-[SASButtonIdentifierTransport _identifierMatchesSiriButtonIdentifier:](self, "_identifierMatchesSiriButtonIdentifier:", 5))
          {
            v3 = 6;
            if (!-[SASButtonIdentifierTransport _identifierMatchesSiriButtonIdentifier:](self, "_identifierMatchesSiriButtonIdentifier:", 6))
            {
              v3 = 7;
              if (!-[SASButtonIdentifierTransport _identifierMatchesSiriButtonIdentifier:](self, "_identifierMatchesSiriButtonIdentifier:", 7))
              {
                v3 = 100;
                if (!-[SASButtonIdentifierTransport _identifierMatchesSiriButtonIdentifier:](self, "_identifierMatchesSiriButtonIdentifier:", 100))
                {
                  v3 = 101;
                  if (!-[SASButtonIdentifierTransport _identifierMatchesSiriButtonIdentifier:](self, "_identifierMatchesSiriButtonIdentifier:", 101))
                  {
                    v3 = 200;
                    if (!-[SASButtonIdentifierTransport _identifierMatchesSiriButtonIdentifier:](self, "_identifierMatchesSiriButtonIdentifier:", 200))
                    {
                      v3 = 201;
                      if (!-[SASButtonIdentifierTransport _identifierMatchesSiriButtonIdentifier:](self, "_identifierMatchesSiriButtonIdentifier:", 201))
                      {
                        v3 = 8;
                        if (!-[SASButtonIdentifierTransport _identifierMatchesSiriButtonIdentifier:](self, "_identifierMatchesSiriButtonIdentifier:", 8))
                        {
                          v3 = 9;
                          if (!-[SASButtonIdentifierTransport _identifierMatchesSiriButtonIdentifier:](self, "_identifierMatchesSiriButtonIdentifier:", 9))
                          {
                            v4 = (void *)*MEMORY[0x1E0CFE6A0];
                            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A0], OS_LOG_TYPE_ERROR))
                              -[SASButtonIdentifierTransport siriButtonIdentifier].cold.1(v4, self);
                            return 200;
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSiriButtonIdentifier:", -[SASButtonIdentifierTransport siriButtonIdentifier](self, "siriButtonIdentifier"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SASButtonIdentifierTransport)initWithCoder:(id)a3
{
  id v4;
  SASButtonIdentifierTransport *v5;
  uint64_t v6;
  NSString *identifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SASButtonIdentifierTransport;
  v5 = -[SASButtonIdentifierTransport init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SASButtonIdentifierTransport identifier](self, "identifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("identifier"));

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)siriButtonIdentifier
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 136315394;
  v6 = "-[SASButtonIdentifierTransport siriButtonIdentifier]";
  v7 = 2112;
  v8 = v4;
  _os_log_error_impl(&dword_1D132F000, v3, OS_LOG_TYPE_ERROR, "%s ERROR: attempted to create SiriButtonIdentifier from '%@'.", (uint8_t *)&v5, 0x16u);

}

@end
