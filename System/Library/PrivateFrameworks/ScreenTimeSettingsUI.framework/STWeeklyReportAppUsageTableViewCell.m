@implementation STWeeklyReportAppUsageTableViewCell

- (STWeeklyReportAppUsageTableViewCell)initWithUsageReport:(id)a3
{
  id v4;
  STWeeklyReportAppUsageTableViewCell *v5;
  STWeeklyReportAppUsageView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)STWeeklyReportAppUsageTableViewCell;
  v5 = -[STWeeklyReportAppUsageTableViewCell initWithStyle:reuseIdentifier:](&v13, sel_initWithStyle_reuseIdentifier_, 0, 0);
  if (v5)
  {
    v6 = -[STWeeklyReportAppUsageView initWithUsageReport:useVibrancy:]([STWeeklyReportAppUsageView alloc], "initWithUsageReport:useVibrancy:", v4, 0);
    -[STWeeklyReportAppUsageView setTranslatesAutoresizingMaskIntoConstraints:](v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[STWeeklyReportAppUsageTableViewCell contentView](v5, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubview:", v6);

    -[STWeeklyReportAppUsageTableViewCell contentView](v5, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sizeToFit");

    v9 = (void *)MEMORY[0x24BDD1628];
    -[STWeeklyReportAppUsageTableViewCell contentView](v5, "contentView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "st_constraintsForView:equalToView:", v6, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "activateConstraints:", v11);

  }
  return v5;
}

@end
