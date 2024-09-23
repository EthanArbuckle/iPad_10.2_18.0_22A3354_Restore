@implementation SFLocalTopic

- (SFLocalTopic)initWithIdentifier:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFLocalTopic;
  return -[SFTopic initWithIdentifier:](&v4, sel_initWithIdentifier_, a3);
}

- (SFLocalTopic)initWithResult:(id)a3
{
  id v4;
  SFLocalTopic *v5;
  SFLocalTopic *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SFLocalTopic;
  v5 = -[SFLocalTopic init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[SFLocalTopic setResult:](v5, "setResult:", v4);

  return v6;
}

- (SFLocalTopic)initWithResult:(id)a3 identifier:(id)a4
{
  id v6;
  SFLocalTopic *v7;
  SFLocalTopic *v8;
  objc_super v10;

  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFLocalTopic;
  v7 = -[SFTopic initWithIdentifier:](&v10, sel_initWithIdentifier_, a4);
  v8 = v7;
  if (v7)
    -[SFLocalTopic setResult:](v7, "setResult:", v6);

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFLocalTopic;
  v4 = -[SFTopic copyWithZone:](&v7, sel_copyWithZone_, a3);
  -[SFLocalTopic result](self, "result");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setResult:", v5);

  return v4;
}

- (SFLocalTopic)initWithCoder:(id)a3
{
  id v4;
  SFLocalTopic *v5;
  uint64_t v6;
  SFSearchResult *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFLocalTopic;
  v5 = -[SFTopic initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_result"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = v5->_result;
    v5->_result = (SFSearchResult *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFLocalTopic;
  v4 = a3;
  -[SFTopic encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_result, CFSTR("_result"), v5.receiver, v5.super_class);

}

- (id)normalizedTopic
{
  SFLocalTopic *v3;
  void *v4;
  SFLocalTopic *v5;

  if (self->_result)
  {
    v3 = [SFLocalTopic alloc];
    -[SFTopic identifier](self, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[SFLocalTopic initWithIdentifier:](v3, "initWithIdentifier:", v4);

  }
  else
  {
    v5 = self;
  }
  return v5;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SFLocalTopic;
  -[SFTopic description](&v9, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[SFLocalTopic result](self, "result");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR(" result: %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (SFSearchResult)result
{
  return self->_result;
}

- (void)setResult:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
