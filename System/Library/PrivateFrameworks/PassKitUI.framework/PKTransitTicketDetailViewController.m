@implementation PKTransitTicketDetailViewController

- (PKTransitTicketDetailViewController)initWithTransitTicketDetailDataSource:(id)a3
{
  id v4;
  PKTransitTicketDetailViewController *v5;
  PKTransitTicketDetailViewController *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKTransitTicketDetailViewController;
  v5 = -[PKTransitTicketDetailViewController initWithStyle:](&v8, sel_initWithStyle_, 1);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_dataSource, v4);

  return v6;
}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PKTransitTicketDetailViewController;
  -[PKTransitTicketDetailViewController viewDidLoad](&v2, sel_viewDidLoad);
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v5;
  void *v6;

  -[PKTransitTicketDetailViewController dataSource](self, "dataSource", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "titleForLeg:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  int64_t v4;

  -[PKTransitTicketDetailViewController dataSource](self, "dataSource", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfLegs");

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  int64_t v6;

  -[PKTransitTicketDetailViewController dataSource](self, "dataSource", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "transitTicketDetailNumberOfRowsForLeg:", a4);

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("PKTransitTicketDetailCell"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 1, CFSTR("PKTransitTicketDetailCell"));
  -[PKTransitTicketDetailViewController _applyDefaultStaticStylingToCell:](self, "_applyDefaultStaticStylingToCell:", v7);
  objc_msgSend(v7, "textLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTransitTicketDetailViewController dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "transitTicketDetailTitleForRow:leg:", objc_msgSend(v6, "row"), objc_msgSend(v6, "section"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v10);

  objc_msgSend(v7, "textLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (self->_primaryTextColor)
  {
    objc_msgSend(v11, "setTextColor:");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTextColor:", v13);

  }
  objc_msgSend(v7, "detailTextLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKTransitTicketDetailViewController dataSource](self, "dataSource");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "transitTicketDetailValueForRow:leg:", objc_msgSend(v6, "row"), objc_msgSend(v6, "section"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", v16);

  objc_msgSend(v7, "detailTextLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (self->_secondaryTextColor)
  {
    objc_msgSend(v17, "setTextColor:");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTextColor:", v19);

  }
  objc_msgSend(v7, "setSelectionStyle:", 0);

  return v7;
}

- (void)_applyDefaultStaticStylingToCell:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", 0);

  objc_msgSend(v5, "detailTextLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", 0);

  objc_msgSend(v5, "setSelectionStyle:", 0);
}

- (UIColor)primaryTextColor
{
  return self->_primaryTextColor;
}

- (void)setPrimaryTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_primaryTextColor, a3);
}

- (UIColor)secondaryTextColor
{
  return self->_secondaryTextColor;
}

- (void)setSecondaryTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryTextColor, a3);
}

- (PKTransitTicketDetailDataSource)dataSource
{
  return (PKTransitTicketDetailDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_secondaryTextColor, 0);
  objc_storeStrong((id *)&self->_primaryTextColor, 0);
}

@end
