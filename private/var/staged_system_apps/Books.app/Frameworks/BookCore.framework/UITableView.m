@implementation UITableView

- (void)setSeparatorsHidden:(BOOL)a3 forCellAtIndexPath:(id)a4
{
  id v6;
  id v7;
  UITableViewCellSeparatorStyle v8;
  UITableViewCellSeparatorStyle v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a4;
  v13 = v6;
  if (a3)
  {
    v7 = v6;
    v8 = UITableViewCellSeparatorStyleNone;
  }
  else
  {
    v9 = -[UITableView separatorStyle](self, "separatorStyle");
    v7 = v13;
    v8 = v9;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView cellForRowAtIndexPath:](self, "cellForRowAtIndexPath:", v7));
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView indexPathForRowPreceedingIndexPath:](self, "indexPathForRowPreceedingIndexPath:", v13));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView cellForRowAtIndexPath:](self, "cellForRowAtIndexPath:", v11));

    objc_msgSend(v10, "setSeparatorStyle:", v8);
    objc_msgSend(v12, "setSeparatorStyle:", v8);

  }
}

- (id)indexPathForRowPreceedingIndexPath:(id)a3
{
  id v4;
  char *v5;
  char *v6;
  NSInteger v7;
  void *v8;

  v4 = a3;
  if ((uint64_t)objc_msgSend(v4, "row") < 1)
  {
    if ((uint64_t)objc_msgSend(v4, "section") < 1
      || (v7 = -[UITableView numberOfRowsInSection:](self, "numberOfRowsInSection:", (char *)objc_msgSend(v4, "section") - 1)) == 0)
    {
      v8 = 0;
      goto LABEL_8;
    }
    v5 = (char *)(v7 - 1);
    v6 = (char *)objc_msgSend(v4, "section") - 1;
  }
  else
  {
    v5 = (char *)objc_msgSend(v4, "row") - 1;
    v6 = (char *)objc_msgSend(v4, "section");
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v5, v6));
LABEL_8:

  return v8;
}

- (double)preferredContentHeightWithMax:(double)a3
{
  void *v5;
  void *v6;
  id v7;
  _BOOL4 v8;
  double v9;
  unint64_t v10;
  unint64_t v11;
  double v12;
  id v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  double v17;
  double v18;
  char v19;
  double v20;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView dataSource](self, "dataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UITableView delegate](self, "delegate"));
  v7 = objc_msgSend(v5, "numberOfSectionsInTableView:", self);
  v8 = a3 > 0.0;
  v9 = 0.0;
  if (v7 && a3 > 0.0)
  {
    v10 = (unint64_t)v7;
    v11 = 0;
    do
    {
      objc_msgSend(v6, "tableView:heightForHeaderInSection:", self, v11);
      v9 = v9 + v12;
      v13 = objc_msgSend(v5, "tableView:numberOfRowsInSection:", self, v11);
      if (v13 && v9 < a3)
      {
        v14 = (unint64_t)v13;
        v15 = 1;
        do
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v15 - 1, v11));
          objc_msgSend(v6, "tableView:heightForRowAtIndexPath:", self, v16);
          v18 = v17;
          v19 = objc_opt_respondsToSelector(v6, "tableView:estimatedHeightForRowAtIndexPath:");
          v20 = -1.0;
          if ((v19 & 1) != 0)
            objc_msgSend(v6, "tableView:estimatedHeightForRowAtIndexPath:", self, v16, -1.0);
          if (v18 >= v20)
            v20 = v18;
          v9 = v9 + v20;

          if (v15 >= v14)
            break;
          ++v15;
        }
        while (v9 < a3);
      }
      ++v11;
      v8 = v9 < a3;
    }
    while (v11 < v10 && v9 < a3);
  }
  if (v8)
    a3 = v9;

  return a3;
}

- (void)setShowsHorizontalScrollIndicator:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UITableView;
  -[UITableView setShowsHorizontalScrollIndicator:](&v3, "setShowsHorizontalScrollIndicator:", a3);
}

- (void)setShowsVerticalScrollIndicator:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UITableView;
  -[UITableView setShowsVerticalScrollIndicator:](&v3, "setShowsVerticalScrollIndicator:", a3);
}

@end
