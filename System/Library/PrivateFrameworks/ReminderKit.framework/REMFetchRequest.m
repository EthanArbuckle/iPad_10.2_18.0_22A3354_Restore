@implementation REMFetchRequest

- (REMFetchRequest)initWithFetchExecutor:(id)a3
{
  id v5;
  REMFetchRequest *v6;
  REMFetchRequest *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMFetchRequest;
  v6 = -[REMFetchRequest init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_type = 0;
    objc_storeStrong((id *)&v6->_fetchExecutor, a3);
    v7->_fetchLimit = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)storagesAndParentFetchRequest
{
  return -[REMFetchRequest copyWithType:](self, "copyWithType:", 0);
}

- (id)storagesOnlyFetchRequest
{
  return -[REMFetchRequest copyWithType:](self, "copyWithType:", 1);
}

- (id)countOnlyFetchRequest
{
  return -[REMFetchRequest copyWithType:](self, "copyWithType:", 2);
}

- (id)objectIDsOnlyFetchRequest
{
  return -[REMFetchRequest copyWithType:](self, "copyWithType:", 3);
}

- (id)metadataFetchRequest
{
  return -[REMFetchRequest copyWithType:](self, "copyWithType:", 4);
}

- (REMFetchRequest)fetchRequestWithFetchResultToken:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)-[REMFetchRequest copy](self, "copy");
  objc_msgSend(v5, "setFetchResultToken:", v4);

  return (REMFetchRequest *)v5;
}

- (id)copyWithType:(int64_t)a3
{
  void *v4;

  v4 = (void *)-[REMFetchRequest copy](self, "copy");
  objc_msgSend(v4, "setType:", a3);
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  REMFetchRequest *v4;
  void *v5;
  REMFetchRequest *v6;
  void *v7;

  v4 = [REMFetchRequest alloc];
  -[REMFetchRequest fetchExecutor](self, "fetchExecutor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[REMFetchRequest initWithFetchExecutor:](v4, "initWithFetchExecutor:", v5);

  -[REMFetchRequest setType:](v6, "setType:", -[REMFetchRequest type](self, "type"));
  -[REMFetchRequest setFetchLimit:](v6, "setFetchLimit:", -[REMFetchRequest fetchLimit](self, "fetchLimit"));
  -[REMFetchRequest fetchResultToken](self, "fetchResultToken");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMFetchRequest setFetchResultToken:](v6, "setFetchResultToken:", v7);

  return v6;
}

- (REMFetchRequest)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  REMFetchRequest *v6;
  unint64_t v7;
  NSObject *v8;
  uint64_t v9;
  REMFetchResultToken *fetchResultToken;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fetchExecutor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[REMFetchRequest initWithFetchExecutor:](self, "initWithFetchExecutor:", v5);

  if (v6)
  {
    v7 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    if (v7 >= 5)
    {
      v8 = os_log_create("com.apple.reminderkit", "default");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        -[REMFetchResult initWithCoder:].cold.1(v7, v8);

      v7 = 2;
    }
    v6->_type = v7;
    v6->_fetchLimit = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("fetchLimit"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fetchResultToken"));
    v9 = objc_claimAutoreleasedReturnValue();
    fetchResultToken = v6->_fetchResultToken;
    v6->_fetchResultToken = (REMFetchResultToken *)v9;

  }
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[REMFetchRequest type](self, "type"), CFSTR("type"));
  -[REMFetchRequest fetchExecutor](self, "fetchExecutor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("fetchExecutor"));

  objc_msgSend(v4, "encodeInteger:forKey:", -[REMFetchRequest fetchLimit](self, "fetchLimit"), CFSTR("fetchLimit"));
  -[REMFetchRequest fetchResultToken](self, "fetchResultToken");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("fetchResultToken"));

}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[REMFetchRequest fetchResultToken](self, "fetchResultToken");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    -[REMFetchRequest fetchResultToken](self, "fetchResultToken");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", CFSTR("fetchResultToken: %@"), v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v7);
  }
  else
  {
    v7 = &stru_1E67FB1F0;
  }
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend(CFSTR(", "), "stringByAppendingString:", v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }
  v10 = (void *)MEMORY[0x1E0CB3940];
  v11 = objc_opt_class();
  NSStringFromREMFetchRequestType(-[REMFetchRequest type](self, "type"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMFetchRequest fetchExecutor](self, "fetchExecutor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("<%@: %p type: %@, executor:%@%@>"), v11, self, v12, v13, v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (unint64_t)fetchLimit
{
  return self->_fetchLimit;
}

- (void)setFetchLimit:(unint64_t)a3
{
  self->_fetchLimit = a3;
}

- (_REMFetchExecutor)fetchExecutor
{
  return self->_fetchExecutor;
}

- (void)setFetchExecutor:(id)a3
{
  objc_storeStrong((id *)&self->_fetchExecutor, a3);
}

- (REMFetchResultToken)fetchResultToken
{
  return self->_fetchResultToken;
}

- (void)setFetchResultToken:(id)a3
{
  objc_storeStrong((id *)&self->_fetchResultToken, a3);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fetchResultToken, 0);
  objc_storeStrong((id *)&self->_fetchExecutor, 0);
}

@end
