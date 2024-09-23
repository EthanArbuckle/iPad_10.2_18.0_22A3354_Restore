@implementation SKUIReportAConcernReasonDataSource

- (SKUIReportAConcernReasonDataSource)init
{
  id v3;
  SKUIReportAConcernReasonDataSource *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0DC3D48]);
  v4 = -[SKUIReportAConcernReasonDataSource initWithTableView:](self, "initWithTableView:", v3);

  return v4;
}

- (SKUIReportAConcernReasonDataSource)initWithTableView:(id)a3
{
  id v5;
  SKUIReportAConcernReasonDataSource *v6;
  SKUIReportAConcernReasonDataSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKUIReportAConcernReasonDataSource;
  v6 = -[SKUIReportAConcernReasonDataSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_tableView, a3);
    objc_msgSend(v5, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("SKUIConcernReasonCell"));
  }

  return v7;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[SKUIReportAConcernReasonDataSource reasons](self, "reasons", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a4;
  v7 = a3;
  -[SKUIReportAConcernReasonDataSource reasons](self, "reasons");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "row");

  objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", CFSTR("SKUIConcernReasonCell"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "name");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "textLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v12);

  objc_msgSend(v11, "setAccessoryType:", 1);
  return v11;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (NSArray)reasons
{
  return self->_reasons;
}

- (void)setReasons:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)selectReasonTitle
{
  return self->_selectReasonTitle;
}

- (void)setSelectReasonTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)selectReasonSubtitle
{
  return self->_selectReasonSubtitle;
}

- (void)setSelectReasonSubtitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectReasonSubtitle, 0);
  objc_storeStrong((id *)&self->_selectReasonTitle, 0);
  objc_storeStrong((id *)&self->_reasons, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end
