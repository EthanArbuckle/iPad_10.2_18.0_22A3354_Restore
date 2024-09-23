@implementation _TUIIdentifierIndexPathWithUUID

- (_TUIIdentifierIndexPathWithUUID)initWithUUID:(id)a3 indexPath:(id)a4
{
  id v6;
  id v7;
  _TUIIdentifierIndexPathWithUUID *v8;
  NSUUID *v9;
  NSUUID *UUID;
  NSIndexPath *v11;
  NSIndexPath *indexPath;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_TUIIdentifierIndexPathWithUUID;
  v8 = -[_TUIIdentifierIndexPathWithUUID init](&v14, "init");
  if (v8)
  {
    v9 = (NSUUID *)objc_msgSend(v6, "copy");
    UUID = v8->_UUID;
    v8->_UUID = v9;

    v11 = (NSIndexPath *)objc_msgSend(v7, "copy");
    indexPath = v8->_indexPath;
    v8->_indexPath = v11;

  }
  return v8;
}

- (id)tui_identifierWithoutUUID
{
  return self->_indexPath;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = (unint64_t)-[NSIndexPath hash](self->_indexPath, "hash");
  return (unint64_t)-[NSUUID hash](self->_UUID, "hash") ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  _TUIIdentifierIndexPathWithUUID *v4;
  uint64_t v5;
  unsigned __int8 v6;

  v4 = (_TUIIdentifierIndexPathWithUUID *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    v5 = objc_opt_class(_TUIIdentifierIndexPathWithUUID);
    if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0
      && -[NSIndexPath isEqual:](self->_indexPath, "isEqual:", v4->_indexPath))
    {
      v6 = -[NSUUID isEqual:](self->_UUID, "isEqual:", v4->_UUID);
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (id)tui_identifierToString
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_msgSend(objc_alloc((Class)NSMutableString), "initWithCapacity:", 64);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](self->_UUID, "UUIDString"));
  objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v4);

  -[NSIndexPath tui_appendToString:](self->_indexPath, "tui_appendToString:", v3);
  v5 = objc_msgSend(v3, "copy");

  return v5;
}

- (id)tui_identifierDescribeForDebuggingWithPackage:(id)a3
{
  id v4;
  NSMutableArray *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = objc_opt_new(NSMutableArray);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSUUID UUIDString](self->_UUID, "UUIDString"));
  -[NSMutableArray addObject:](v5, "addObject:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSIndexPath tui_identifierDescribeForDebuggingWithPackage:](self->_indexPath, "tui_identifierDescribeForDebuggingWithPackage:", v4));
  -[NSMutableArray addObjectsFromArray:](v5, "addObjectsFromArray:", v7);

  v8 = -[NSMutableArray copy](v5, "copy");
  return v8;
}

- (id)tui_identifierByAppendingIndex:(unint64_t)a3
{
  return 0;
}

- (id)tui_identifierByAppendingString:(id)a3
{
  return 0;
}

- (id)tui_identifierByPrependingUUID:(id)a3
{
  return 0;
}

- (id)tui_identifierUUID
{
  return self->_UUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

@end
