@implementation WFNANTableViewDataSource

- (WFNANTableViewDataSource)initWithTableView:(id)a3 sections:(id)a4 cellProvider:(id)a5
{
  id v8;
  WFNANTableViewDataSource *v9;
  WFNANTableViewDataSource *v10;
  objc_super v12;

  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)WFNANTableViewDataSource;
  v9 = -[UITableViewDiffableDataSource initWithTableView:cellProvider:](&v12, sel_initWithTableView_cellProvider_, a3, a5);
  v10 = v9;
  if (v9)
    -[WFNANTableViewDataSource setSections:](v9, "setSections:", v8);

  return v10;
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

  -[WFNANTableViewDataSource sections](self, "sections", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  if (v7 == 2)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = CFSTR("kWFLocNANSubscribe");
  }
  else if (v7 == 1)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = CFSTR("kWFLocNANPublish");
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
    v10 = CFSTR("kWFLocNANSummary");
  }
  objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_24DB39F78, CFSTR("WiFiKitUILocalizableStrings"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (NSOrderedSet)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
  objc_storeStrong((id *)&self->_sections, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sections, 0);
}

@end
