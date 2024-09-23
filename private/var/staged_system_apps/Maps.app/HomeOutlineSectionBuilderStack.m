@implementation HomeOutlineSectionBuilderStack

- (HomeOutlineSectionBuilderStack)initWithSectionIdentifier:(id)a3 sectionIndex:(int64_t)a4
{
  id v6;
  HomeOutlineSectionBuilderStack *v7;
  HomeOutlineSectionBuilderStack *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSMutableArray *items;
  void *v13;
  uint64_t v14;
  NSMutableArray *identifiers;
  void *v16;
  void *v17;
  uint64_t v18;
  NSMutableArray *indices;
  objc_super v21;
  void *v22;
  id v23;
  void *v24;

  v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)HomeOutlineSectionBuilderStack;
  v7 = -[HomeOutlineSectionBuilderStack init](&v21, "init");
  v8 = v7;
  if (v7)
  {
    v7->_depth = 1;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
    v24 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v24, 1));
    v11 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v10));
    items = v8->_items;
    v8->_items = (NSMutableArray *)v11;

    v23 = v6;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
    v14 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v13));
    identifiers = v8->_identifiers;
    v8->_identifiers = (NSMutableArray *)v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
    v22 = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
    v18 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v17));
    indices = v8->_indices;
    v8->_indices = (NSMutableArray *)v18;

  }
  return v8;
}

- (void)_pushItem:(id)a3 index:(int64_t)a4
{
  NSMutableArray *indices;
  void *v7;
  IdentifierPath *topIdentifierPath;

  ++self->_depth;
  -[NSMutableArray addObject:](self->_items, "addObject:", a3);
  -[NSMutableArray addObject:](self->_identifiers, "addObject:", &stru_1011EB268);
  indices = self->_indices;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
  -[NSMutableArray addObject:](indices, "addObject:", v7);

  topIdentifierPath = self->_topIdentifierPath;
  self->_topIdentifierPath = 0;

}

- (void)_setTopIdentifier:(id)a3
{
  unint64_t depth;
  IdentifierPath *topIdentifierPath;

  depth = self->_depth;
  if (depth >= 2)
  {
    -[NSMutableArray setObject:atIndexedSubscript:](self->_identifiers, "setObject:atIndexedSubscript:", a3, depth - 1);
    topIdentifierPath = self->_topIdentifierPath;
    self->_topIdentifierPath = 0;

  }
}

- (void)_pop
{
  unint64_t depth;
  IdentifierPath *topIdentifierPath;

  depth = self->_depth;
  if (depth >= 2)
  {
    self->_depth = depth - 1;
    -[NSMutableArray removeLastObject](self->_items, "removeLastObject");
    -[NSMutableArray removeLastObject](self->_identifiers, "removeLastObject");
    -[NSMutableArray removeLastObject](self->_indices, "removeLastObject");
    topIdentifierPath = self->_topIdentifierPath;
    self->_topIdentifierPath = 0;

  }
}

- (id)parentItem
{
  unint64_t depth;

  depth = self->_depth;
  if (depth >= 2)
    return (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray objectAtIndexedSubscript:](self->_items, "objectAtIndexedSubscript:", depth - 2));
  else
    return 0;
}

- (IdentifierPath)topIdentifierPath
{
  void *v3;
  id v4;
  IdentifierPath *topIdentifierPath;
  IdentifierPath *v6;
  IdentifierPath *v7;
  IdentifierPath *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_identifiers, "lastObject"));
  v4 = objc_msgSend(v3, "length");

  if (v4)
  {
    topIdentifierPath = self->_topIdentifierPath;
    if (!topIdentifierPath)
    {
      v6 = (IdentifierPath *)objc_claimAutoreleasedReturnValue(+[IdentifierPath identifierPathWithIdentifiers:](IdentifierPath, "identifierPathWithIdentifiers:", self->_identifiers));
      v7 = self->_topIdentifierPath;
      self->_topIdentifierPath = v6;

      topIdentifierPath = self->_topIdentifierPath;
    }
    v8 = topIdentifierPath;
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (int64_t)topIndex
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_indices, "lastObject"));
  v3 = objc_msgSend(v2, "integerValue");

  return (int64_t)v3;
}

- (unint64_t)depth
{
  return self->_depth;
}

- (NSArray)items
{
  return &self->_items->super;
}

- (NSArray)identifiers
{
  return &self->_identifiers->super;
}

- (NSArray)indices
{
  return &self->_indices->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topIdentifierPath, 0);
  objc_storeStrong((id *)&self->_indices, 0);
  objc_storeStrong((id *)&self->_identifiers, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end
