@implementation SXJSONObjectMergerClassProvider

- (SXJSONObjectMergerClassProvider)initWithObjectClass:(Class)a3
{
  SXJSONObjectMergerClassProvider *v4;
  SXJSONObjectMergerClassProvider *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SXJSONObjectMergerClassProvider;
  v4 = -[SXJSONObjectMergerClassProvider init](&v7, sel_init);
  v5 = v4;
  if (v4)
    objc_storeStrong((id *)&v4->_objectClass, a3);
  return v5;
}

- (Class)objectClass
{
  return self->_objectClass;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectClass, 0);
}

@end
