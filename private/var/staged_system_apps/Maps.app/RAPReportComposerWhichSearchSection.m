@implementation RAPReportComposerWhichSearchSection

- (Class)defaultCellClass
{
  return (Class)objc_opt_class(RAPSearchHistoryItemTableViewCell);
}

- (id)dequeueCellForValue:(id)a3
{
  id v3;
  RAPSearchHistoryItemTableViewCell *v4;

  v3 = a3;
  v4 = -[RAPTwoLinesMenuTableViewCell initWithStyle:reuseIdentifier:]([RAPSearchHistoryItemTableViewCell alloc], "initWithStyle:reuseIdentifier:", 3, 0);
  -[RAPSearchHistoryItemTableViewCell setHistoryItem:](v4, "setHistoryItem:", v3);

  return v4;
}

@end
