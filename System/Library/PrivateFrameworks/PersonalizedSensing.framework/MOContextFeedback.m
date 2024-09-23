@implementation MOContextFeedback

- (MOContextFeedback)initWithContextIdentifier:(id)a3
{
  id v5;
  MOContextFeedback *v6;
  MOContextFeedback *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MOContextFeedback;
  v6 = -[MOContextFeedback init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_contextIdentifier, a3);

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *contextIdentifier;
  id v5;

  contextIdentifier = self->_contextIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", contextIdentifier, CFSTR("contextIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contextFetchedTimestamp, CFSTR("contextFetchedTimestamp"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contextStringFeedback, CFSTR("contextStringFeedback"));

}

- (MOContextFeedback)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  MOContextFeedback *v6;
  uint64_t v7;
  NSDate *contextFetchedTimestamp;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSArray *contextStringFeedback;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contextIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MOContextFeedback initWithContextIdentifier:](self, "initWithContextIdentifier:", v5);
  if (v6)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contextFetchedTimestamp"));
    v7 = objc_claimAutoreleasedReturnValue();
    contextFetchedTimestamp = v6->_contextFetchedTimestamp;
    v6->_contextFetchedTimestamp = (NSDate *)v7;

    v9 = (void *)MEMORY[0x24BDBCF20];
    v10 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("contextStringFeedback"));
    v12 = objc_claimAutoreleasedReturnValue();
    contextStringFeedback = v6->_contextStringFeedback;
    v6->_contextStringFeedback = (NSArray *)v12;

  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char v5;
  NSUUID *contextIdentifier;
  void *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class());
  contextIdentifier = self->_contextIdentifier;
  objc_msgSend(v4, "contextIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(contextIdentifier) = -[NSUUID isEqual:](contextIdentifier, "isEqual:", v7);
  return v5 & contextIdentifier;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[MOContextFeedback contextIdentifier](self, "contextIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOContextFeedback contextFetchedTimestamp](self, "contextFetchedTimestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOContextFeedback contextStringFeedback](self, "contextStringFeedback");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("contextIdentifier, %@, contextFetchedTimestamp, %@, contextStringFeedback, %@"), v4, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  MOContextFeedback *v4;
  void *v5;
  MOContextFeedback *v6;
  void *v7;
  void *v8;

  v4 = [MOContextFeedback alloc];
  -[MOContextFeedback contextIdentifier](self, "contextIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[MOContextFeedback initWithContextIdentifier:](v4, "initWithContextIdentifier:", v5);

  -[MOContextFeedback contextFetchedTimestamp](self, "contextFetchedTimestamp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOContextFeedback setContextFetchedTimestamp:](v6, "setContextFetchedTimestamp:", v7);

  -[MOContextFeedback contextStringFeedback](self, "contextStringFeedback");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOContextFeedback setContextStringFeedback:](v6, "setContextStringFeedback:", v8);

  return v6;
}

- (NSUUID)contextIdentifier
{
  return self->_contextIdentifier;
}

- (NSDate)contextFetchedTimestamp
{
  return self->_contextFetchedTimestamp;
}

- (void)setContextFetchedTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_contextFetchedTimestamp, a3);
}

- (NSArray)contextStringFeedback
{
  return self->_contextStringFeedback;
}

- (void)setContextStringFeedback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextStringFeedback, 0);
  objc_storeStrong((id *)&self->_contextFetchedTimestamp, 0);
  objc_storeStrong((id *)&self->_contextIdentifier, 0);
}

@end
