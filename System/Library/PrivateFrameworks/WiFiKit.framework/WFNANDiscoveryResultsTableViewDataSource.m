@implementation WFNANDiscoveryResultsTableViewDataSource

- (WFNANDiscoveryResultsTableViewDataSource)initWithTableView:(id)a3 context:(id)a4 subscriber:(id)a5 sections:(id)a6 cellProvider:(id)a7
{
  id v13;
  id v14;
  id v15;
  WFNANDiscoveryResultsTableViewDataSource *v16;
  WFNANDiscoveryResultsTableViewDataSource *v17;
  objc_super v19;

  v13 = a4;
  v14 = a5;
  v15 = a6;
  v19.receiver = self;
  v19.super_class = (Class)WFNANDiscoveryResultsTableViewDataSource;
  v16 = -[UITableViewDiffableDataSource initWithTableView:cellProvider:](&v19, sel_initWithTableView_cellProvider_, a3, a7);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_sections, a6);
    objc_storeStrong((id *)&v17->_context, a4);
    objc_storeStrong((id *)&v17->_subscriber, a5);
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
  const __CFString *v10;
  void *v11;

  -[WFNANDiscoveryResultsTableViewDataSource sections](self, "sections", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  if (v7 == 1)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = CFSTR("kWFLocNANActiveDataSessions");
  }
  else
  {
    if (v7)
    {
      v11 = 0;
      return v11;
    }
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = CFSTR("kWFLocNANDiscoveryResults");
  }
  objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_24DC36C30, CFSTR("WiFiKitUILocalizableStrings"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  v5 = a4;
  -[WFNANDiscoveryResultsTableViewDataSource sections](self, "sections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "section");

  objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  return v9 == 1
      && -[WFNANTableViewContext getDataSessionsCountForSubscriber:](self->_context, "getDataSessionsCountForSubscriber:", self->_subscriber) > 0;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v6;

  if (a4 == 1)
  {
    -[WFNANTableViewContext getDataSessionAtIndex:forSubscriber:](self->_context, "getDataSessionAtIndex:forSubscriber:", objc_msgSend(a5, "row", a3), self->_subscriber);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stop");
    -[WFNANTableViewContext removeDataSession:forSubscriber:](self->_context, "removeDataSession:forSubscriber:", v6, self->_subscriber);

  }
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

- (WiFiAwareSubscriber)subscriber
{
  return self->_subscriber;
}

- (void)setSubscriber:(id)a3
{
  objc_storeStrong((id *)&self->_subscriber, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriber, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_sections, 0);
}

@end
