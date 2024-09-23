@implementation NWAppAdvice

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NWAppAdvice)initWithCoder:(id)a3
{
  id v4;
  NWAppAdvice *v5;
  void *v6;
  uint64_t v7;
  NSString *bundleIdentifier;
  uint64_t v9;
  NSString *reason;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)NWAppAdvice;
  v5 = -[NWAppAdvice init](&v12, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24958F0D4]();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bundleIdentifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v7;

    v5->_state = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("state"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("reason"));
    v9 = objc_claimAutoreleasedReturnValue();
    reason = v5->_reason;
    v5->_reason = (NSString *)v9;

    objc_autoreleasePoolPop(v6);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)MEMORY[0x24958F0D4]();
  -[NWAppAdvice bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("bundleIdentifier"));

  objc_msgSend(v7, "encodeInteger:forKey:", -[NWAppAdvice state](self, "state"), CFSTR("state"));
  -[NWAppAdvice reason](self, "reason");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("reason"));

  objc_autoreleasePoolPop(v4);
}

- (id)copyWithZone:(_NSZone *)a3
{
  NWAppAdvice *v4;

  v4 = objc_alloc_init(NWAppAdvice);
  objc_storeStrong((id *)&v4->_bundleIdentifier, self->_bundleIdentifier);
  v4->_state = self->_state;
  objc_storeStrong((id *)&v4->_reason, self->_reason);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  NWAppAdvice *v4;
  NWAppAdvice *v5;
  void *v6;
  void *v7;
  int64_t v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (NWAppAdvice *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[NWAppAdvice bundleIdentifier](self, "bundleIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NWAppAdvice bundleIdentifier](v5, "bundleIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqualToString:", v7)
        && (v8 = -[NWAppAdvice state](self, "state"), v8 == -[NWAppAdvice state](v5, "state")))
      {
        -[NWAppAdvice reason](self, "reason");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NWAppAdvice reason](v5, "reason");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqualToString:", v10);

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[NWAppAdvice bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[NWAppAdvice state](self, "state");
  -[NWAppAdvice reason](self, "reason");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, %ld, %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "hash");
  return v8;
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (NSString)reason
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setReason:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
