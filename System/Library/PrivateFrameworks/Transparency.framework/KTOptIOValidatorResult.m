@implementation KTOptIOValidatorResult

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (KTOptIOValidatorResult)initWithState:(unint64_t)a3 timestamp:(id)a4
{
  id v6;
  KTOptIOValidatorResult *v7;
  KTOptIOValidatorResult *v8;
  KTOptIOValidatorResult *v9;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)KTOptIOValidatorResult;
  v7 = -[KTOptIOValidatorResult init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    -[KTOptIOValidatorResult setState:](v7, "setState:", a3);
    -[KTOptIOValidatorResult setTimestamp:](v8, "setTimestamp:", v6);
    v9 = v8;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "encodeInt:forKey:", -[KTOptIOValidatorResult state](self, "state"), CFSTR("state"));
  -[KTOptIOValidatorResult uriNeedsOptInChange](self, "uriNeedsOptInChange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[KTOptIOValidatorResult uriNeedsOptInChange](self, "uriNeedsOptInChange");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "encodeObject:forKey:", v5, CFSTR("uriNeedsOptInChange"));

  }
  -[KTOptIOValidatorResult uris](self, "uris");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[KTOptIOValidatorResult uris](self, "uris");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "encodeObject:forKey:", v7, CFSTR("uris"));

  }
  -[KTOptIOValidatorResult timestamp](self, "timestamp");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[KTOptIOValidatorResult timestamp](self, "timestamp");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "encodeObject:forKey:", v9, CFSTR("timestamp"));

  }
  if (-[KTOptIOValidatorResult usedIntendedState](self, "usedIntendedState"))
    objc_msgSend(v10, "encodeInt:forKey:", -[KTOptIOValidatorResult usedIntendedState](self, "usedIntendedState"), CFSTR("usedIntendedState"));

}

- (KTOptIOValidatorResult)initWithCoder:(id)a3
{
  id v4;
  unsigned int v5;
  int v6;
  int v7;
  KTOptIOValidatorResult *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  KTOptIOValidatorResult *v13;
  objc_super v15;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("state"));
  v6 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("usedIntendedState"));
  if (v5 <= 2
    && (v7 = v6,
        v15.receiver = self,
        v15.super_class = (Class)KTOptIOValidatorResult,
        v8 = -[KTOptIOValidatorResult init](&v15, sel_init),
        (self = v8) != 0))
  {
    -[KTOptIOValidatorResult setState:](v8, "setState:", (int)v5);
    v9 = objc_opt_class();
    objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v9, objc_opt_class(), CFSTR("uriNeedsOptInChange"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[KTOptIOValidatorResult setUriNeedsOptInChange:](self, "setUriNeedsOptInChange:", v10);

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("uris"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[KTOptIOValidatorResult setUris:](self, "setUris:", v11);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timestamp"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[KTOptIOValidatorResult setTimestamp:](self, "setTimestamp:", v12);

    -[KTOptIOValidatorResult setUsedIntendedState:](self, "setUsedIntendedState:", v7 != 0);
    self = self;
    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)description
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = -[KTOptIOValidatorResult state](self, "state");
  -[KTOptIOValidatorResult timestamp](self, "timestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[KTOptIOValidatorResult uriNeedsOptInChange](self, "uriNeedsOptInChange");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<KTOptIOValidatorResult state: %d timestamp: %@ uriNeedsOptInChange: %@>"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (NSDictionary)uriNeedsOptInChange
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setUriNeedsOptInChange:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSArray)uris
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setUris:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSDate)timestamp
{
  return (NSDate *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTimestamp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (BOOL)usedIntendedState
{
  return self->_usedIntendedState;
}

- (void)setUsedIntendedState:(BOOL)a3
{
  self->_usedIntendedState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_uris, 0);
  objc_storeStrong((id *)&self->_uriNeedsOptInChange, 0);
}

@end
