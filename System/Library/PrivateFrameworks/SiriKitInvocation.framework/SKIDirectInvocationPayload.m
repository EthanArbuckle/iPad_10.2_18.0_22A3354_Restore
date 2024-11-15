@implementation SKIDirectInvocationPayload

- (SKIDirectInvocationPayload)initWithIdentifier:(id)a3
{
  id v5;
  SKIDirectInvocationPayload *v6;
  SKIDirectInvocationPayload *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKIDirectInvocationPayload;
  v6 = -[SKIDirectInvocationPayload init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_identifier, a3);

  return v7;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSDictionary)userData
{
  return self->_userData;
}

- (void)setUserData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userData, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
