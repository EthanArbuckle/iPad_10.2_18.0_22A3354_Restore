@implementation SXIdentifiableItemProvider

- (SXIdentifiableItemProvider)initWithObject:(id)a3 identifier:(id)a4
{
  id v7;
  SXIdentifiableItemProvider *v8;
  SXIdentifiableItemProvider *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SXIdentifiableItemProvider;
  v8 = -[SXIdentifiableItemProvider initWithObject:](&v11, sel_initWithObject_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_identifier, a4);

  return v9;
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
