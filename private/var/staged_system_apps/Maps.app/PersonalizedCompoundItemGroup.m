@implementation PersonalizedCompoundItemGroup

- (PersonalizedCompoundItemGroup)initWithItems:(id)a3
{
  id v4;
  PersonalizedCompoundItemGroup *v5;
  NSArray *v6;
  NSArray *items;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PersonalizedCompoundItemGroup;
  v5 = -[PersonalizedCompoundItemGroup init](&v9, "init");
  if (v5)
  {
    v6 = (NSArray *)objc_msgSend(v4, "copy");
    items = v5->_items;
    v5->_items = v6;

  }
  return v5;
}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
}

@end
