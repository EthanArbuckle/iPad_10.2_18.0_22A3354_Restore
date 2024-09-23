@implementation SFQueryTopic

- (SFQueryTopic)initWithType:(int)a3 query:(id)a4
{
  return -[SFQueryTopic initWithType:query:identifier:](self, "initWithType:query:identifier:", *(_QWORD *)&a3, a4, a4);
}

- (SFQueryTopic)initWithType:(int)a3 query:(id)a4 identifier:(id)a5
{
  uint64_t v6;
  id v8;
  SFQueryTopic *v9;
  SFQueryTopic *v10;
  objc_super v12;

  v6 = *(_QWORD *)&a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SFQueryTopic;
  v9 = -[SFTopic initWithIdentifier:](&v12, sel_initWithIdentifier_, a5);
  v10 = v9;
  if (v9)
  {
    -[SFQueryTopic setQueryType:](v9, "setQueryType:", v6);
    -[SFQueryTopic setQuery:](v10, "setQuery:", v8);
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFQueryTopic;
  v4 = -[SFTopic copyWithZone:](&v7, sel_copyWithZone_, a3);
  -[SFQueryTopic query](self, "query");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setQuery:", v5);

  objc_msgSend(v4, "setQueryType:", -[SFQueryTopic queryType](self, "queryType"));
  return v4;
}

- (SFQueryTopic)initWithCoder:(id)a3
{
  id v4;
  SFQueryTopic *v5;
  uint64_t v6;
  NSString *query;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFQueryTopic;
  v5 = -[SFTopic initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_query"));
    v6 = objc_claimAutoreleasedReturnValue();
    query = v5->_query;
    v5->_query = (NSString *)v6;

    v5->_queryType = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("_queryType"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFQueryTopic;
  v4 = a3;
  -[SFTopic encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_query, CFSTR("_query"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInt32:forKey:", self->_queryType, CFSTR("_queryType"));

}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SFQueryTopic;
  v3 = -[SFTopic hash](&v8, sel_hash);
  -[SFQueryTopic query](self, "query");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  v6 = v5 ^ -[SFQueryTopic queryType](self, "queryType") ^ v3;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  int v8;
  BOOL v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SFQueryTopic;
  if (-[SFTopic isEqual:](&v11, sel_isEqual_, v4))
  {
    v5 = v4;
    -[SFQueryTopic query](self, "query");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "query");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqual:", v7))
    {
      v8 = -[SFQueryTopic queryType](self, "queryType");
      v9 = v8 == objc_msgSend(v5, "queryType");
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSString)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SFQueryTopic;
  -[SFTopic description](&v10, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = -[SFQueryTopic queryType](self, "queryType");
  -[SFQueryTopic query](self, "query");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR(" queryType: %d queryString: %@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NSString)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (int)queryType
{
  return self->_queryType;
}

- (void)setQueryType:(int)a3
{
  self->_queryType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
