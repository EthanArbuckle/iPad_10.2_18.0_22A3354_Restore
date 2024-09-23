@implementation RAPDirectionsRequestsCheckmarkSection

- (Class)defaultCellClass
{
  return (Class)objc_opt_class(RAPRouteHistoryItemTableViewCell);
}

- (id)dequeueCellForValue:(id)a3
{
  id v3;
  RAPRouteHistoryItemTableViewCell *v4;
  void *v5;

  v3 = a3;
  v4 = -[RAPTwoLinesMenuTableViewCell initWithStyle:reuseIdentifier:]([RAPRouteHistoryItemTableViewCell alloc], "initWithStyle:reuseIdentifier:", 3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "historyItem"));
  -[RAPRouteHistoryItemTableViewCell setHistoryItem:](v4, "setHistoryItem:", v5);

  return v4;
}

@end
