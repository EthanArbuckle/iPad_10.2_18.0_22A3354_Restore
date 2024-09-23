@implementation RVQuery

- (RVQuery)initWithTitle:(id)a3 clientIdentifier:(id)a4 userAgent:(id)a5 queryID:(int64_t)a6 queryProvider:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  RVQuery *v17;
  RVQuery *v18;
  uint64_t v19;
  id queryProvider;
  objc_super v22;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)RVQuery;
  v17 = -[RVQuery init](&v22, sel_init);
  v18 = v17;
  if (v17)
  {
    v17->_queryID = a6;
    objc_storeStrong((id *)&v17->_identifier, a4);
    objc_storeStrong((id *)&v18->_userAgent, a5);
    objc_storeStrong((id *)&v18->_title, a3);
    v19 = MEMORY[0x1DF0EC60C](v16);
    queryProvider = v18->_queryProvider;
    v18->_queryProvider = (id)v19;

  }
  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t queryID;
  id v5;

  queryID = self->_queryID;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", queryID, CFSTR("queryID"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_userAgent, CFSTR("userAgent"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_title, CFSTR("title"));

}

- (RVQuery)initWithCoder:(id)a3
{
  id v4;
  RVQuery *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  NSString *userAgent;
  uint64_t v10;
  NSString *title;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RVQuery;
  v5 = -[RVQuery init](&v13, sel_init);
  if (v5)
  {
    v5->_queryID = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("queryID"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userAgent"));
    v8 = objc_claimAutoreleasedReturnValue();
    userAgent = v5->_userAgent;
    v5->_userAgent = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("title"));
    v10 = objc_claimAutoreleasedReturnValue();
    title = v5->_title;
    v5->_title = (NSString *)v10;

  }
  return v5;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)userAgent
{
  return self->_userAgent;
}

- (int64_t)queryID
{
  return self->_queryID;
}

- (id)queryProvider
{
  return self->_queryProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_queryProvider, 0);
  objc_storeStrong((id *)&self->_userAgent, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
