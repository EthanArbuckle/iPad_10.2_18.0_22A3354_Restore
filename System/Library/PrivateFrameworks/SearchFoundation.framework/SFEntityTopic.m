@implementation SFEntityTopic

- (SFEntityTopic)initWithType:(int)a3 identifier:(id)a4
{
  uint64_t v4;
  id v6;
  SFEntityTopic *v7;
  SFEntityTopic *v8;
  objc_super v10;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)SFEntityTopic;
  v7 = -[SFQueryTopic initWithType:query:](&v10, sel_initWithType_query_, v4, v6);
  v8 = v7;
  if (v7)
    -[SFEntityTopic setIdentifier:](v7, "setIdentifier:", v6);

  return v8;
}

- (SFEntityTopic)initWithType:(int)a3 query:(id)a4 identifier:(id)a5
{
  uint64_t v6;
  id v8;
  SFEntityTopic *v9;
  SFEntityTopic *v10;
  objc_super v12;

  v6 = *(_QWORD *)&a3;
  v8 = a5;
  v12.receiver = self;
  v12.super_class = (Class)SFEntityTopic;
  v9 = -[SFQueryTopic initWithType:query:](&v12, sel_initWithType_query_, v6, a4);
  v10 = v9;
  if (v9)
    -[SFEntityTopic setIdentifier:](v9, "setIdentifier:", v8);

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFEntityTopic;
  v4 = -[SFQueryTopic copyWithZone:](&v7, sel_copyWithZone_, a3);
  -[SFEntityTopic identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentifier:", v5);

  return v4;
}

- (SFEntityTopic)initWithCoder:(id)a3
{
  id v4;
  SFEntityTopic *v5;
  uint64_t v6;
  NSString *identifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFEntityTopic;
  v5 = -[SFQueryTopic initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFEntityTopic;
  v4 = a3;
  -[SFQueryTopic encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_identifier, CFSTR("_identifier"), v5.receiver, v5.super_class);

}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
