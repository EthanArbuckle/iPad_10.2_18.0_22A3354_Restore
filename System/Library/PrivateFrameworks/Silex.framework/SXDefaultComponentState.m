@implementation SXDefaultComponentState

- (SXDefaultComponentState)init
{
  SXDefaultComponentState *v2;
  SXDefaultComponentState *v3;
  NSString *identifier;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SXDefaultComponentState;
  v2 = -[SXDefaultComponentState init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)CFSTR("component.default");

  }
  return v3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
