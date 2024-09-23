@implementation REMFetchResultToken

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentHistoryTokens, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[REMFetchResultToken persistentHistoryTokens](self, "persistentHistoryTokens");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("persistentHistoryTokens"));

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[REMFetchResultToken persistentHistoryTokens](self, "persistentHistoryTokens");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "persistentHistoryTokens");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v5 == (void *)v6)
    {
      v10 = 1;
      v7 = v5;
    }
    else
    {
      v7 = (void *)v6;
      -[REMFetchResultToken persistentHistoryTokens](self, "persistentHistoryTokens");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "persistentHistoryTokens");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqual:", v9);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSDictionary)persistentHistoryTokens
{
  return self->_persistentHistoryTokens;
}

- (REMFetchResultToken)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  REMFetchResultToken *v10;

  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v8, CFSTR("persistentHistoryTokens"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[REMFetchResultToken initWithPersistentHistoryTokens:](self, "initWithPersistentHistoryTokens:", v9);
  return v10;
}

- (REMFetchResultToken)initWithPersistentHistoryTokens:(id)a3
{
  id v4;
  REMFetchResultToken *v5;
  uint64_t v6;
  NSDictionary *persistentHistoryTokens;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMFetchResultToken;
  v5 = -[REMFetchResultToken init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    persistentHistoryTokens = v5->_persistentHistoryTokens;
    v5->_persistentHistoryTokens = (NSDictionary *)v6;

  }
  return v5;
}

+ (id)fetchResultTokenFromDataRepresentation:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;

  v5 = (void *)MEMORY[0x1E0CB3710];
  v6 = a3;
  objc_msgSend(v5, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[REMFetchResultToken persistentHistoryTokens](self, "persistentHistoryTokens");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[REMFetchResultToken persistentHistoryTokens](self, "persistentHistoryTokens");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p persistentHistoryTokens: %@> "), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dataRepresentationWithError:(id *)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, a3);
}

@end
