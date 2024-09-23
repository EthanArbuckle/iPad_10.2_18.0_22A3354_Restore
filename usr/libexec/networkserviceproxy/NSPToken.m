@implementation NSPToken

- (id)description
{
  id v3;

  if (self)
  {
    v3 = objc_msgSend(objc_alloc((Class)NSMutableString), "initWithCapacity:", 0);
    sub_100042144(v3, (uint64_t)-[NSMutableArray count](self->_tokens, "count"), (uint64_t)CFSTR("Token Count"), 0, 14);
    sub_100042144(v3, (uint64_t)-[NSMutableArray count](self->_salts, "count"), (uint64_t)CFSTR("Salt Count"), 0, 14);
    sub_1000418A4(v3, self->_expirationDate, CFSTR("Expiration date"), 0, 14);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSPToken)initWithCoder:(id)a3
{
  id v4;
  NSPToken *v5;
  id v6;
  void *v7;
  uint64_t v8;
  NSMutableArray *tokens;
  id v10;
  void *v11;
  uint64_t v12;
  NSMutableArray *salts;
  id v14;
  uint64_t v15;
  NSDate *expirationDate;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)NSPToken;
  v5 = -[NSPToken init](&v18, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(NSData), CFSTR("tokenArray"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    if (v7)
    {
      v8 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v7));
      tokens = v5->_tokens;
      v5->_tokens = (NSMutableArray *)v8;

    }
    v10 = objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(NSData), CFSTR("saltsArray"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if (v11)
    {
      v12 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v11));
      salts = v5->_salts;
      v5->_salts = (NSMutableArray *)v12;

    }
    v14 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSDate), CFSTR("tokenExpirationDate"));
    v15 = objc_claimAutoreleasedReturnValue(v14);
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v15;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDate *expirationDate;
  id v5;

  v5 = a3;
  if (self)
  {
    objc_msgSend(v5, "encodeObject:forKey:", self->_tokens, CFSTR("tokenArray"));
    objc_msgSend(v5, "encodeObject:forKey:", self->_salts, CFSTR("saltsArray"));
    expirationDate = self->_expirationDate;
  }
  else
  {
    objc_msgSend(v5, "encodeObject:forKey:", 0, CFSTR("tokenArray"));
    objc_msgSend(v5, "encodeObject:forKey:", 0, CFSTR("saltsArray"));
    expirationDate = 0;
  }
  objc_msgSend(v5, "encodeObject:forKey:", expirationDate, CFSTR("tokenExpirationDate"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  NSPToken *v4;
  id *p_isa;
  NSDate *expirationDate;

  v4 = -[NSPToken init](+[NSPToken allocWithZone:](NSPToken, "allocWithZone:", a3), "init");
  p_isa = (id *)&v4->super.isa;
  if (!self)
  {
    sub_100010990((uint64_t)v4, 0);
    sub_10003E048((uint64_t)p_isa, 0);
    expirationDate = 0;
    if (!p_isa)
      return p_isa;
    goto LABEL_3;
  }
  sub_100010990((uint64_t)v4, self->_tokens);
  sub_10003E048((uint64_t)p_isa, self->_salts);
  expirationDate = self->_expirationDate;
  if (p_isa)
LABEL_3:
    objc_storeStrong(p_isa + 3, expirationDate);
  return p_isa;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_salts, 0);
  objc_storeStrong((id *)&self->_tokens, 0);
}

@end
