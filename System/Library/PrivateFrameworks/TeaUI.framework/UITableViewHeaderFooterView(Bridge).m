@implementation UITableViewHeaderFooterView(Bridge)

- (double)ts_cellSeparatorInsets
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  objc_msgSend(a1, "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    return *MEMORY[0x1E0DC49E8];
  objc_msgSend(a1, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "separatorInset");
  v5 = v4;

  return v5;
}

@end
