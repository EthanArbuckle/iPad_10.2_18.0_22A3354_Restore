@implementation POMutableAssertionTokenJWT

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[POMutableJWT header](self, "header");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[POMutableAssertionTokenJWT body](self, "body");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[POJWT stringRepresentation](self, "stringRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@.%@\n%@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (POMutableAssertionJWTBody)body
{
  return (POMutableAssertionJWTBody *)objc_getProperty(self, a2, 96, 1);
}

- (void)setBody:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_body, 0);
}

@end
