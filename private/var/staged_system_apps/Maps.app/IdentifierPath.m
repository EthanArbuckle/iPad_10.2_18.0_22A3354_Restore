@implementation IdentifierPath

+ (id)identifierPath
{
  return objc_alloc_init((Class)a1);
}

+ (IdentifierPath)identifierPathWithIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  id v9;

  v4 = a3;
  v5 = objc_alloc((Class)a1);
  v9 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));

  v7 = objc_msgSend(v5, "initWithIdentifiers:", v6);
  return (IdentifierPath *)v7;
}

+ (IdentifierPath)identifierPathWithIdentifiers:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_msgSend(objc_alloc((Class)a1), "initWithIdentifiers:", v4);

  return (IdentifierPath *)v5;
}

- (IdentifierPath)init
{
  IdentifierPath *v2;
  IdentifierPath *v3;
  NSArray *identifiers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IdentifierPath;
  v2 = -[IdentifierPath init](&v6, "init");
  v3 = v2;
  if (v2)
  {
    identifiers = v2->_identifiers;
    v2->_identifiers = (NSArray *)&__NSArray0__struct;

  }
  return v3;
}

- (IdentifierPath)initWithIdentifiers:(id)a3
{
  id v4;
  IdentifierPath *v5;
  uint64_t v6;
  NSArray *identifiers;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IdentifierPath;
  v5 = -[IdentifierPath init](&v9, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v4));
    identifiers = v5->_identifiers;
    v5->_identifiers = (NSArray *)v6;

  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  NSUInteger i;
  NSUInteger v5;
  void *v6;

  v3 = 0;
  for (i = 0; ; ++i)
  {
    v5 = -[NSArray count](self->_identifiers, "count") > 7 ? 8 : -[NSArray count](self->_identifiers, "count");
    if (i >= v5)
      break;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_identifiers, "objectAtIndexedSubscript:", i));
    v3 = (unint64_t)objc_msgSend(v6, "hash") ^ (2 * v3);

  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  IdentifierPath *v4;
  uint64_t v5;
  void *v6;
  unsigned __int8 v7;

  v4 = (IdentifierPath *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    v5 = objc_opt_class(self);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[IdentifierPath identifiers](v4, "identifiers"));
      v7 = objc_msgSend(v6, "isEqualToArray:", self->_identifiers);

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (NSString)visualDescription
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[IdentifierPath identifiers](self, "identifiers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "componentsJoinedByString:", CFSTR(" - ")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{%@}"), v3));

  return (NSString *)v4;
}

- (unint64_t)length
{
  return -[NSArray count](self->_identifiers, "count");
}

- (NSString)firstIdentifier
{
  return (NSString *)-[NSArray firstObject](self->_identifiers, "firstObject");
}

- (NSString)lastIdentifier
{
  return (NSString *)-[NSArray lastObject](self->_identifiers, "lastObject");
}

- (id)identifierPathByAppendingIdentifier:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = objc_alloc((Class)objc_opt_class(self));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray arrayByAddingObject:](self->_identifiers, "arrayByAddingObject:", v4));

  v7 = objc_msgSend(v5, "initWithIdentifiers:", v6);
  return v7;
}

- (id)identifierPathByRemovingLastIdentifier
{
  id v3;
  void *v4;
  IdentifierPath *v5;

  if (-[NSArray count](self->_identifiers, "count"))
  {
    v3 = objc_alloc((Class)objc_opt_class(self));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray subarrayWithRange:](self->_identifiers, "subarrayWithRange:", 0, (char *)-[NSArray count](self->_identifiers, "count") - 1));
    v5 = (IdentifierPath *)objc_msgSend(v3, "initWithIdentifiers:", v4);

  }
  else
  {
    v5 = self;
  }
  return v5;
}

- (id)identifierPathByPrependingIdentifier:(id)a3
{
  NSArray *identifiers;
  id v5;
  void *v6;
  id v7;

  identifiers = self->_identifiers;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", (char *)-[NSArray count](identifiers, "count") + 1));
  objc_msgSend(v6, "addObject:", v5);

  objc_msgSend(v6, "addObjectsFromArray:", self->_identifiers);
  v7 = objc_msgSend(objc_alloc((Class)objc_opt_class(self)), "initWithIdentifiers:", v6);

  return v7;
}

- (id)identifierPathByRemovingFirstIdentifier
{
  id v3;
  void *v4;
  IdentifierPath *v5;

  if (-[NSArray count](self->_identifiers, "count"))
  {
    v3 = objc_alloc((Class)objc_opt_class(self));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray subarrayWithRange:](self->_identifiers, "subarrayWithRange:", 1, (char *)-[NSArray count](self->_identifiers, "count") - 1));
    v5 = (IdentifierPath *)objc_msgSend(v3, "initWithIdentifiers:", v4);

  }
  else
  {
    v5 = self;
  }
  return v5;
}

- (BOOL)hasPrefix:(id)a3
{
  id v4;
  void *v5;
  id v6;
  unsigned __int8 v7;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = v4;
  if (v4 && (v6 = objc_msgSend(v4, "length"), v6 <= (id)-[NSArray count](self->_identifiers, "count")))
  {
    if (objc_msgSend(v5, "length"))
    {
      v9 = 0;
      do
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifiers"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", v9));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_identifiers, "objectAtIndexedSubscript:", v9));
        v7 = objc_msgSend(v11, "isEqualToString:", v12);

        if ((v7 & 1) == 0)
          break;
        ++v9;
      }
      while (v9 < (unint64_t)objc_msgSend(v5, "length"));
    }
    else
    {
      v7 = 1;
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiers, 0);
}

@end
