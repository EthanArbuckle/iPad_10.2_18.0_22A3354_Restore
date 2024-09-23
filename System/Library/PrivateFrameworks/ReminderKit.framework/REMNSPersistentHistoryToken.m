@implementation REMNSPersistentHistoryToken

- (REMNSPersistentHistoryToken)initWithPersistentHistoryToken:(id)a3
{
  id v5;
  REMNSPersistentHistoryToken *v6;
  REMNSPersistentHistoryToken *v7;
  REMNSPersistentHistoryToken *v8;
  objc_super v10;

  v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)REMNSPersistentHistoryToken;
    v6 = -[REMNSPersistentHistoryToken init](&v10, sel_init);
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_token, a3);
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[REMNSPersistentHistoryToken token](self, "token");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("REM_WRAP(%@)"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)compareToken:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  int64_t v9;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[REMNSPersistentHistoryToken token](self, "token");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "token");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "compareToken:error:", v8, a4);

  }
  else if (a4)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithREMChangeErrorCode:", 0);
    v9 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  REMNSPersistentHistoryToken *v4;
  void *v5;
  void *v6;
  char v7;

  v4 = (REMNSPersistentHistoryToken *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[REMNSPersistentHistoryToken token](self, "token");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[REMNSPersistentHistoryToken token](v4, "token");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v5, "isEqual:", v6);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (REMNSPersistentHistoryToken)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  REMNSPersistentHistoryToken *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("token"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[REMNSPersistentHistoryToken initWithPersistentHistoryToken:](self, "initWithPersistentHistoryToken:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMNSPersistentHistoryToken token](self, "token");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("token"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSPersistentHistoryToken)token
{
  return self->_token;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
}

@end
