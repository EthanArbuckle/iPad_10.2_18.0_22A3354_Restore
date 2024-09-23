@implementation WFNANDataSessionsTableViewDataSource

- (WFNANDataSessionsTableViewDataSource)initWithTableView:(id)a3 context:(id)a4 publisher:(id)a5 sections:(id)a6 cellProvider:(id)a7
{
  id v13;
  id v14;
  id v15;
  WFNANDataSessionsTableViewDataSource *v16;
  WFNANDataSessionsTableViewDataSource *v17;
  objc_super v19;

  v13 = a4;
  v14 = a5;
  v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)WFNANDataSessionsTableViewDataSource;
  v16 = -[UITableViewDiffableDataSource initWithTableView:cellProvider:](&v19, sel_initWithTableView_cellProvider_, a3, a7);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_sections, a6);
    objc_storeStrong((id *)&v17->_context, a4);
    objc_storeStrong((id *)&v17->_publisher, a5);
  }

  return v17;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  -[WFNANDataSessionsTableViewDataSource sections](self, "sections", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  if (v7)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("kWFLocNANActiveDataSessions"), &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (NSOrderedSet)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
  objc_storeStrong((id *)&self->_sections, a3);
}

- (WFNANTableViewContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (WiFiAwarePublisher)publisher
{
  return self->_publisher;
}

- (void)setPublisher:(id)a3
{
  objc_storeStrong((id *)&self->_publisher, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publisher, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_sections, 0);
}

@end
