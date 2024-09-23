@implementation WFNANPublishTableViewDataSource

- (WFNANPublishTableViewDataSource)initWithTableView:(id)a3 context:(id)a4 sections:(id)a5 cellProvider:(id)a6
{
  id v10;
  id v11;
  WFNANPublishTableViewDataSource *v12;
  WFNANPublishTableViewDataSource *v13;
  objc_super v15;

  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)WFNANPublishTableViewDataSource;
  v12 = -[UITableViewDiffableDataSource initWithTableView:cellProvider:](&v15, sel_initWithTableView_cellProvider_, a3, a6);
  v13 = v12;
  if (v12)
  {
    -[WFNANPublishTableViewDataSource setSections:](v12, "setSections:", v11);
    -[WFNANPublishTableViewDataSource setContext:](v13, "setContext:", v10);
  }

  return v13;
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

  -[WFNANPublishTableViewDataSource sections](self, "sections", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  if (v7 == 1)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = CFSTR("kWFLocNANPublishers");
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
    v10 = CFSTR("kWFLocNANAddPublisher");
  }
  objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  -[WFNANPublishTableViewDataSource sections](self, "sections", a3);
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
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("kWFLocNANPassphraseWarning"), &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  v5 = a4;
  -[WFNANPublishTableViewDataSource sections](self, "sections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "section");

  objc_msgSend(v6, "objectAtIndexedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  return v9 == 1 && -[WFNANTableViewContext getPublishersCount](self->_context, "getPublishersCount") > 0;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  if (a4 == 1)
    -[WFNANTableViewContext removePublisherAtIndex:](self->_context, "removePublisherAtIndex:", objc_msgSend(a5, "row", a3));
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_sections, 0);
}

@end
