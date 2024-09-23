@implementation NSIndexPath

- (id)tui_identifierByAppendingString:(id)a3
{
  id v4;
  _TUIIdentifier *v5;

  v4 = a3;
  if (v4)
    v5 = -[_TUIIdentifier initWithUUID:indexPath:identifier:]([_TUIIdentifier alloc], "initWithUUID:indexPath:identifier:", 0, self, v4);
  else
    v5 = 0;

  return v5;
}

- (id)tui_identifierByPrependingUUID:(id)a3
{
  id v4;
  _TUIIdentifierIndexPathWithUUID *v5;

  v4 = a3;
  v5 = -[_TUIIdentifierIndexPathWithUUID initWithUUID:indexPath:]([_TUIIdentifierIndexPathWithUUID alloc], "initWithUUID:indexPath:", v4, self);

  return v5;
}

- (void)tui_appendToString:(id)a3
{
  NSUInteger v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  v4 = -[NSIndexPath length](self, "length");
  if (v4)
  {
    v5 = 0;
    do
      objc_msgSend(v6, "appendFormat:", CFSTR("/%lu"), -[NSIndexPath indexAtPosition:](self, "indexAtPosition:", v5++));
    while (v4 != v5);
  }

}

- (id)tui_identifierToString
{
  id v3;
  id v4;

  v3 = objc_msgSend(objc_alloc((Class)NSMutableString), "initWithCapacity:", 64);
  -[NSIndexPath tui_appendToString:](self, "tui_appendToString:", v3);
  v4 = objc_msgSend(v3, "copy");

  return v4;
}

- (id)tui_identifierUUID
{
  return 0;
}

- (id)tui_identifierDescribeForDebuggingWithPackage:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSUInteger v6;
  uint64_t v7;
  void *v8;
  id v9;

  v4 = a3;
  v5 = objc_opt_new(NSMutableArray);
  v6 = -[NSIndexPath length](self, "length");
  if (v6)
  {
    v7 = 0;
    do
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[TUIIdentifierMap describeForDebuggingIdentifierIndex:package:](TUIIdentifierMap, "describeForDebuggingIdentifierIndex:package:", -[NSIndexPath indexAtPosition:](self, "indexAtPosition:", v7), v4));
      -[NSMutableArray addObject:](v5, "addObject:", v8);

      ++v7;
    }
    while (v6 != v7);
  }
  v9 = -[NSMutableArray copy](v5, "copy");

  return v9;
}

+ (id)tui_indexPathForRow:(int64_t)a3 inSection:(int64_t)a4
{
  id v4;
  _QWORD v6[2];

  v6[0] = a4;
  v6[1] = a3;
  v4 = objc_msgSend((id)objc_opt_class(a1), "indexPathWithIndexes:length:", v6, 2);
  return (id)objc_claimAutoreleasedReturnValue(v4);
}

- (int64_t)tui_row
{
  return -[NSIndexPath indexAtPosition:](self, "indexAtPosition:", 1);
}

- (int64_t)tui_section
{
  return -[NSIndexPath indexAtPosition:](self, "indexAtPosition:", 0);
}

@end
