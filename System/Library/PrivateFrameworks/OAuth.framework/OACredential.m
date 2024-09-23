@implementation OACredential

- (void)setConsumerKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setConsumerSecret:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OACredential;
  -[OACredential dealloc](&v3, sel_dealloc);
}

- (id)signingKey
{
  id result;
  uint64_t v4;

  if (-[OACredential consumerSecret](self, "consumerSecret")
    && -[OACredential oauthTokenSecret](self, "oauthTokenSecret"))
  {
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@&%@"), -[OACredential consumerSecret](self, "consumerSecret"), -[OACredential oauthTokenSecret](self, "oauthTokenSecret"));
  }
  result = -[OACredential consumerSecret](self, "consumerSecret");
  if (result)
    return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@&"), -[OACredential consumerSecret](self, "consumerSecret"), v4);
  return result;
}

- (NSString)consumerKey
{
  return self->_consumerKey;
}

- (NSString)consumerSecret
{
  return self->_consumerSecret;
}

- (NSString)oauthToken
{
  return self->_oauthToken;
}

- (void)setOauthToken:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)oauthTokenSecret
{
  return self->_oauthTokenSecret;
}

- (void)setOauthTokenSecret:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

@end
