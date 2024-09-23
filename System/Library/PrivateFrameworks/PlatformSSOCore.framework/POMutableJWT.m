@implementation POMutableJWT

- (BOOL)isJWE
{
  void *v2;
  void *v3;
  BOOL v4;

  -[POMutableJWT header](self, "header");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enc");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)setBodyData:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)POMutableJWT;
  -[POMutableJWT setBodyData:](&v3, sel_setBodyData_, a3);
}

- (POMutableJWTHeader)header
{
  return (POMutableJWTHeader *)objc_getProperty(self, a2, 80, 1);
}

- (void)setHeader:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (POMutableJWTBody)body
{
  return (POMutableJWTBody *)objc_getProperty(self, a2, 88, 1);
}

- (void)setBody:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_body, 0);
  objc_storeStrong((id *)&self->_header, 0);
}

@end
