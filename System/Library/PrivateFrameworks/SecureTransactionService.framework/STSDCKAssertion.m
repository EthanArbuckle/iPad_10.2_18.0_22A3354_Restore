@implementation STSDCKAssertion

- (STSDCKAssertion)initWithAssertion:(id)a3
{
  id v5;
  STSDCKAssertion *v6;
  STSDCKAssertion *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STSDCKAssertion;
  v6 = -[STSDCKAssertion init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_assertion, a3);

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[STSDCKAssertion invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)STSDCKAssertion;
  -[STSDCKAssertion dealloc](&v3, sel_dealloc);
}

- (NSString)keyIdentifier
{
  return (NSString *)-[NFDCKAssertion keyIdentifier](self->_assertion, "keyIdentifier");
}

- (void)invalidate
{
  -[NFDCKAssertion invalidate](self->_assertion, "invalidate");
}

- (NFDCKAssertion)assertion
{
  return self->_assertion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assertion, 0);
}

@end
