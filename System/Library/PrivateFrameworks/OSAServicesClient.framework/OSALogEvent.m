@implementation OSALogEvent

- (OSALogEvent)initWithIdentity:(id)a3 details:(id)a4
{
  id v7;
  id v8;
  OSALogEvent *v9;
  OSALogEvent *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)OSALogEvent;
  v9 = -[OSALogEvent init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identity, a3);
    objc_storeStrong((id *)&v10->_details, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSDictionary *details;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "encodeObject:forKey:", self->_identity, CFSTR("identity"));
  details = self->_details;
  v8 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", details, 200, 0, &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v8;
  if (v6)
  {
    objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("details"));
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    -[OSALogEvent encodeWithCoder:].cold.1((uint64_t)v7);
  }

}

- (OSALogEvent)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  OSALogEvent *v8;
  uint64_t v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identity"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2C10], CFSTR("OSALogEvent missing identity"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("details"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2C10], CFSTR("OSALogEvent missing details serialization"));
  v10 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v6, 0, 0, &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2C10], CFSTR("OSALogEvent details could not be deserialized: %@"), v10);
  v8 = -[OSALogEvent initWithIdentity:details:](self, "initWithIdentity:details:", v5, v7);

  return v8;
}

- (OSALogIdentity)identity
{
  return self->_identity;
}

- (NSDictionary)details
{
  return self->_details;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_details, 0);
  objc_storeStrong((id *)&self->_identity, 0);
}

- (void)encodeWithCoder:(uint64_t)a1 .cold.1(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 138412290;
  v2 = a1;
  _os_log_error_impl(&dword_1B075E000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Log event details could not be serialized: %@", (uint8_t *)&v1, 0xCu);
}

@end
