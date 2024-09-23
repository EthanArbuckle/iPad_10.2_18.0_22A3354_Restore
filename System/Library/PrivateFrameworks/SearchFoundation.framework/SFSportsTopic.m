@implementation SFSportsTopic

- (SFSportsTopic)initWithQuery:(id)a3 requestedEntityType:(id)a4 identifier:(id)a5
{
  id v8;
  SFSportsTopic *v9;
  SFSportsTopic *v10;
  objc_super v12;

  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SFSportsTopic;
  v9 = -[SFQueryTopic initWithType:query:identifier:](&v12, sel_initWithType_query_identifier_, 3, a3, a5);
  v10 = v9;
  if (v9)
    -[SFSportsTopic setRequestedEntityType:](v9, "setRequestedEntityType:", v8);

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFSportsTopic;
  v4 = -[SFQueryTopic copyWithZone:](&v7, sel_copyWithZone_, a3);
  -[SFSportsTopic requestedEntityType](self, "requestedEntityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRequestedEntityType:", v5);

  return v4;
}

- (SFSportsTopic)initWithCoder:(id)a3
{
  id v4;
  SFSportsTopic *v5;
  uint64_t v6;
  NSString *requestedEntityType;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFSportsTopic;
  v5 = -[SFQueryTopic initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_requestedEntityType"));
    v6 = objc_claimAutoreleasedReturnValue();
    requestedEntityType = v5->_requestedEntityType;
    v5->_requestedEntityType = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFSportsTopic;
  v4 = a3;
  -[SFQueryTopic encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_requestedEntityType, CFSTR("_requestedEntityType"), v5.receiver, v5.super_class);

}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFSportsTopic;
  v3 = -[SFQueryTopic hash](&v7, sel_hash);
  -[SFSportsTopic requestedEntityType](self, "requestedEntityType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash") ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFSportsTopic;
  if (-[SFQueryTopic isEqual:](&v10, sel_isEqual_, v4))
  {
    v5 = v4;
    -[SFSportsTopic requestedEntityType](self, "requestedEntityType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "requestedEntityType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqual:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
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
  v9.super_class = (Class)SFSportsTopic;
  -[SFQueryTopic description](&v9, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[SFSportsTopic requestedEntityType](self, "requestedEntityType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR(" requestedEntityType: %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSString)requestedEntityType
{
  return self->_requestedEntityType;
}

- (void)setRequestedEntityType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedEntityType, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
