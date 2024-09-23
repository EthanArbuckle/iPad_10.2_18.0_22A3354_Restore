@implementation PGCurationArrayTrait

- (PGCurationArrayTrait)initWithItems:(id)a3
{
  return -[PGCurationArrayTrait initWithItems:negativeItems:](self, "initWithItems:negativeItems:", a3, MEMORY[0x1E0C9AA60]);
}

- (PGCurationArrayTrait)initWithItems:(id)a3 negativeItems:(id)a4
{
  id v7;
  id v8;
  PGCurationArrayTrait *v9;
  PGCurationArrayTrait *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PGCurationArrayTrait;
  v9 = -[PGCurationTrait init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_items, a3);
    objc_storeStrong((id *)&v10->_negativeItems, a4);
  }

  return v10;
}

- (BOOL)isActive
{
  return -[NSArray count](self->_items, "count") || -[NSArray count](self->_negativeItems, "count") != 0;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  NSArray *items;
  NSUInteger v6;
  const __CFString *v7;
  void *v8;
  objc_super v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)PGCurationArrayTrait;
  -[PGCurationTrait debugDescription](&v10, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  items = self->_items;
  v6 = -[NSArray count](self->_negativeItems, "count");
  v7 = CFSTR(" ");
  if (!v6)
    v7 = &stru_1E8436F28;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@%@%@"), v4, items, v7, self->_negativeItems);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSArray)items
{
  return self->_items;
}

- (NSArray)negativeItems
{
  return self->_negativeItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_negativeItems, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end
