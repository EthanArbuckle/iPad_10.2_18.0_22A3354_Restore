@implementation SearchUIScreenTimeTableCell

- (SearchUIScreenTimeTableCell)initWithRowModel:(id)a3 feedbackDelegate:(id)a4
{
  id v6;
  SearchUIScreenTimeTableCell *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SearchUIScreenTimeTableCell;
  v7 = -[SearchUITableViewCell initWithRowModel:feedbackDelegate:](&v12, sel_initWithRowModel_feedbackDelegate_, v6, a4);
  if (v7)
  {
    v8 = (void *)objc_opt_new();
    -[SearchUITableViewCell setSizingContainer:](v7, "setSizingContainer:", v8);

    -[SearchUIScreenTimeTableCell contentView](v7, "contentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SearchUITableViewCell sizingContainer](v7, "sizingContainer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v10);

    -[SearchUIScreenTimeTableCell updateWithRowModel:](v7, "updateWithRowModel:", v6);
  }

  return v7;
}

- (void)updateWithRowModel:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SearchUIScreenTimeTableCell;
  v4 = a3;
  -[SearchUITableViewCell updateWithRowModel:](&v6, sel_updateWithRowModel_, v4);
  -[SearchUITableViewCell sizingContainer](self, "sizingContainer", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateWithRowModel:", v4);

}

- (id)visibleResults
{
  return 0;
}

@end
