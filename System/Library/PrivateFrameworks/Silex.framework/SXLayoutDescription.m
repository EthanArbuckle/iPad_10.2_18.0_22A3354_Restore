@implementation SXLayoutDescription

- (SXLayoutDescription)initWithTaskIdentifier:(id)a3
{
  id v5;
  SXLayoutDescription *v6;
  SXLayoutDescription *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXLayoutDescription;
  v6 = -[SXLayoutDescription init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_taskIdentifier, a3);

  return v7;
}

- (NSString)taskIdentifier
{
  return self->_taskIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskIdentifier, 0);
}

@end
