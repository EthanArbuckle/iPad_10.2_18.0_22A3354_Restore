@implementation STNotificationsPickupSummaryTableViewCell

- (STNotificationsPickupSummaryTableViewCell)initWithUsageReport:(id)a3
{
  id v4;
  STNotificationsPickupSummaryTableViewCell *v5;
  STNotificationsPickupSummaryView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)STNotificationsPickupSummaryTableViewCell;
  v5 = -[STNotificationsPickupSummaryTableViewCell initWithStyle:reuseIdentifier:](&v13, sel_initWithStyle_reuseIdentifier_, 0, 0);
  if (v5)
  {
    v6 = -[STNotificationsPickupSummaryView initWithUsageReport:]([STNotificationsPickupSummaryView alloc], "initWithUsageReport:", v4);
    -[STNotificationsPickupSummaryView setTranslatesAutoresizingMaskIntoConstraints:](v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[STNotificationsPickupSummaryTableViewCell contentView](v5, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v6);

    -[STNotificationsPickupSummaryTableViewCell contentView](v5, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sizeToFit");

    v9 = (void *)MEMORY[0x24BDD1628];
    -[STNotificationsPickupSummaryTableViewCell contentView](v5, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "st_constraintsForView:equalToView:", v10, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "activateConstraints:", v11);

  }
  return v5;
}

@end
