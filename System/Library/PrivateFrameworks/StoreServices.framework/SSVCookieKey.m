@implementation SSVCookieKey

- (void)setScope:(int64_t)a3
{
  self->_scope = a3;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (int64_t)scope
{
  return self->_scope;
}

- (NSNumber)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)keyWithIdentifier:(id)a3 scope:(int64_t)a4
{
  id v5;
  id v6;

  v5 = a3;
  v6 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v6, "setIdentifier:", v5);

  if (v5)
    objc_msgSend(v6, "setScope:", a4);
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    -[SSVCookieKey identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copyWithZone:", a3);
    objc_msgSend(v5, "setIdentifier:", v7);

    objc_msgSend(v5, "setScope:", -[SSVCookieKey scope](self, "scope"));
  }
  return v5;
}

@end
