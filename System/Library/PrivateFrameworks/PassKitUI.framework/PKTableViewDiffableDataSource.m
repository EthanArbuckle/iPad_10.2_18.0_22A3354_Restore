@implementation PKTableViewDiffableDataSource

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (self->_sectionHeaderProvider)
  {
    v6 = a3;
    -[UITableViewDiffableDataSource snapshot](self, "snapshot");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sectionIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(void))self->_sectionHeaderProvider + 2))();
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  if (self->_sectionFooterProvider)
  {
    v6 = a3;
    -[UITableViewDiffableDataSource snapshot](self, "snapshot");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sectionIdentifiers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndex:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    (*((void (**)(void))self->_sectionFooterProvider + 2))();
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  void (**commitEditingHandler)(id, id, int64_t, id);

  commitEditingHandler = (void (**)(id, id, int64_t, id))self->_commitEditingHandler;
  if (commitEditingHandler)
    commitEditingHandler[2](commitEditingHandler, a3, a4, a5);
}

- (id)sectionFooterProvider
{
  return self->_sectionFooterProvider;
}

- (void)setSectionFooterProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)sectionHeaderProvider
{
  return self->_sectionHeaderProvider;
}

- (void)setSectionHeaderProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)commitEditingHandler
{
  return self->_commitEditingHandler;
}

- (void)setCommitEditingHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_commitEditingHandler, 0);
  objc_storeStrong(&self->_sectionHeaderProvider, 0);
  objc_storeStrong(&self->_sectionFooterProvider, 0);
}

@end
