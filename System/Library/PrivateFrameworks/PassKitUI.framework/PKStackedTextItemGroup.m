@implementation PKStackedTextItemGroup

- (PKStackedTextItemGroup)init
{
  return -[PKStackedTextItemGroup initWithItems:](self, "initWithItems:", 0);
}

- (PKStackedTextItemGroup)initWithItems:(id)a3
{
  id v4;
  PKStackedTextItemGroup *v5;
  uint64_t v6;
  NSArray *items;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKStackedTextItemGroup;
  v5 = -[PKStackedTextItemGroup init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    items = v5->_items;
    v5->_items = (NSArray *)v6;

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v3;
  char isKindOfClass;
  char v5;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v5 = 0;
  if (v3 && (isKindOfClass & 1) != 0)
    v5 = PKEqualObjects();

  return v5;
}

- (unint64_t)hash
{
  return -[NSArray hash](self->_items, "hash");
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
