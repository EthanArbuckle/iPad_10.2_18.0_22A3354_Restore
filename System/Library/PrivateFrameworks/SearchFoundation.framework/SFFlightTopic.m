@implementation SFFlightTopic

- (SFFlightTopic)initWithQuery:(id)a3 date:(id)a4 identifier:(id)a5
{
  id v8;
  SFFlightTopic *v9;
  SFFlightTopic *v10;
  objc_super v12;

  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SFFlightTopic;
  v9 = -[SFQueryTopic initWithType:query:identifier:](&v12, sel_initWithType_query_identifier_, 5, a3, a5);
  v10 = v9;
  if (v9)
    -[SFFlightTopic setDate:](v9, "setDate:", v8);

  return v10;
}

- (SFFlightTopic)initWithQuery:(id)a3 date:(id)a4
{
  return -[SFFlightTopic initWithQuery:date:identifier:](self, "initWithQuery:date:identifier:", a3, a4, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFFlightTopic;
  v4 = -[SFQueryTopic copyWithZone:](&v7, sel_copyWithZone_, a3);
  -[SFFlightTopic date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDate:", v5);

  return v4;
}

- (SFFlightTopic)initWithCoder:(id)a3
{
  id v4;
  SFFlightTopic *v5;
  uint64_t v6;
  NSDate *date;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFFlightTopic;
  v5 = -[SFQueryTopic initWithCoder:](&v9, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_date"));
    v6 = objc_claimAutoreleasedReturnValue();
    date = v5->_date;
    v5->_date = (NSDate *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFFlightTopic;
  v4 = a3;
  -[SFQueryTopic encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_date, CFSTR("_date"), v5.receiver, v5.super_class);

}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFFlightTopic;
  v3 = -[SFQueryTopic hash](&v5, sel_hash);
  return -[NSDate hash](self->_date, "hash") ^ v3;
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
  v10.super_class = (Class)SFFlightTopic;
  if (-[SFQueryTopic isEqual:](&v10, sel_isEqual_, v4))
  {
    v5 = v4;
    -[SFFlightTopic date](self, "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "date");
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
  v9.super_class = (Class)SFFlightTopic;
  -[SFQueryTopic description](&v9, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[SFFlightTopic date](self, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR(" date: %@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
