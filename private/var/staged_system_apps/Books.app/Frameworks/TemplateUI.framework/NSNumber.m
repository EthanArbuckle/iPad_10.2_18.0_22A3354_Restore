@implementation NSNumber

- (id)tui_identifierByAppendingIndex:(unint64_t)a3
{
  _QWORD v5[2];

  v5[0] = -[NSNumber unsignedIntegerValue](self, "unsignedIntegerValue");
  v5[1] = a3;
  return (id)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathWithIndexes:length:](NSIndexPath, "indexPathWithIndexes:length:", v5, 2));
}

- (id)tui_identifierByAppendingString:(id)a3
{
  id v4;
  _TUIIdentifier *v5;
  void *v6;
  _TUIIdentifier *v7;

  v4 = a3;
  if (v4)
  {
    v5 = [_TUIIdentifier alloc];
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathWithIndex:](NSIndexPath, "indexPathWithIndex:", -[NSNumber unsignedIntegerValue](self, "unsignedIntegerValue")));
    v7 = -[_TUIIdentifier initWithUUID:indexPath:identifier:](v5, "initWithUUID:indexPath:identifier:", 0, v6, v4);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)tui_identifierByPrependingUUID:(id)a3
{
  id v4;
  _TUIIdentifierNumberWithUUID *v5;

  v4 = a3;
  v5 = -[_TUIIdentifierNumberWithUUID initWithUUID:value:]([_TUIIdentifierNumberWithUUID alloc], "initWithUUID:value:", v4, -[NSNumber unsignedIntegerValue](self, "unsignedIntegerValue"));

  return v5;
}

- (id)tui_identifierToString
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("/%lu"), -[NSNumber unsignedIntegerValue](self, "unsignedIntegerValue"));
}

- (id)tui_identifierDescribeForDebuggingWithPackage:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TUIIdentifierMap describeForDebuggingIdentifierIndex:package:](TUIIdentifierMap, "describeForDebuggingIdentifierIndex:package:", -[NSNumber unsignedIntegerValue](self, "unsignedIntegerValue"), v4));
  v8 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));

  return v6;
}

- (id)tui_identifierUUID
{
  return 0;
}

@end
