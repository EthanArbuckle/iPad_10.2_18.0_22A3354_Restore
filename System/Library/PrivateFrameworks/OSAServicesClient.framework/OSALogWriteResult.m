@implementation OSALogWriteResult

- (OSALogWriteResult)initWithIdentity:(id)a3 filePath:(id)a4
{
  id v7;
  id v8;
  OSALogWriteResult *v9;
  OSALogWriteResult *v10;
  NSError *error;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)OSALogWriteResult;
  v9 = -[OSALogWriteResult init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identity, a3);
    objc_storeStrong((id *)&v10->_filePath, a4);
    error = v10->_error;
    v10->_error = 0;

  }
  return v10;
}

- (OSALogWriteResult)initWithIdentity:(id)a3 error:(id)a4
{
  id v7;
  id v8;
  OSALogWriteResult *v9;
  OSALogWriteResult *v10;
  NSString *filePath;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)OSALogWriteResult;
  v9 = -[OSALogWriteResult init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identity, a3);
    objc_storeStrong((id *)&v10->_error, a4);
    filePath = v10->_filePath;
    v10->_filePath = 0;

  }
  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  OSALogIdentity *identity;
  id v5;

  identity = self->_identity;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identity, CFSTR("identity"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_filePath, CFSTR("path"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_error, CFSTR("error"));

}

- (OSALogWriteResult)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  OSALogWriteResult *v9;
  OSALogWriteResult *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("path"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error"));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (v6)
    {
      v9 = -[OSALogWriteResult initWithIdentity:filePath:](self, "initWithIdentity:filePath:", v5, v6);
    }
    else
    {
      if (!v7)
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2C10], CFSTR("OSALogWriteResult: path and error both null"));
        v10 = 0;
        goto LABEL_8;
      }
      v9 = -[OSALogWriteResult initWithIdentity:error:](self, "initWithIdentity:error:", v5, v7);
    }
    self = v9;
    v10 = self;
LABEL_8:

    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2C10], CFSTR("OSALogWriteResult missing log identity"));
  v10 = 0;
LABEL_9:

  return v10;
}

- (OSALogIdentity)identity
{
  return self->_identity;
}

- (NSString)filePath
{
  return self->_filePath;
}

- (NSError)error
{
  return self->_error;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_filePath, 0);
  objc_storeStrong((id *)&self->_identity, 0);
}

@end
