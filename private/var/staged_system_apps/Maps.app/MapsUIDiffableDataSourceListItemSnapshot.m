@implementation MapsUIDiffableDataSourceListItemSnapshot

- (MapsUIDiffableDataSourceListItemSnapshot)initWithIdentifierPath:(id)a3 viewModel:(id)a4
{
  id v6;
  id v7;
  MapsUIDiffableDataSourceListItemSnapshot *v8;
  IdentifierPath *v9;
  IdentifierPath *identifierPath;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MapsUIDiffableDataSourceListItemSnapshot;
  v8 = -[MapsUIDiffableDataSourceListItemSnapshot init](&v12, "init");
  if (v8)
  {
    v9 = (IdentifierPath *)objc_msgSend(v6, "copy");
    identifierPath = v8->_identifierPath;
    v8->_identifierPath = v9;

    objc_storeStrong((id *)&v8->_viewModel, a4);
    if ((objc_opt_respondsToSelector(v8->_viewModel, "cellRegistration") & 1) != 0)

  }
  return v8;
}

- (unint64_t)hash
{
  return -[IdentifierPath hash](self->_identifierPath, "hash");
}

- (BOOL)isEqual:(id)a3
{
  MapsUIDiffableDataSourceListItemSnapshot *v4;
  MapsUIDiffableDataSourceListItemSnapshot *v5;
  uint64_t v6;
  MapsUIDiffableDataSourceListItemSnapshot *v7;
  IdentifierPath *v8;
  IdentifierPath *v9;
  MapsUIDiffableDataSourceViewModel *v10;
  MapsUIDiffableDataSourceViewModel *v11;
  unsigned __int8 v12;

  v4 = (MapsUIDiffableDataSourceListItemSnapshot *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v12 = 1;
  }
  else if (v4 && (v6 = objc_opt_class(self), (objc_opt_isKindOfClass(v5, v6) & 1) != 0))
  {
    v7 = v5;
    v8 = (IdentifierPath *)objc_claimAutoreleasedReturnValue(-[MapsUIDiffableDataSourceListItemSnapshot identifierPath](v7, "identifierPath"));
    v9 = v8;
    if (v8 == self->_identifierPath || -[IdentifierPath isEqual:](v8, "isEqual:"))
    {
      v10 = (MapsUIDiffableDataSourceViewModel *)objc_claimAutoreleasedReturnValue(-[MapsUIDiffableDataSourceListItemSnapshot viewModel](v7, "viewModel"));
      v11 = v10;
      if (v10 == self->_viewModel)
        v12 = 1;
      else
        v12 = -[MapsUIDiffableDataSourceViewModel isEqual:](v10, "isEqual:");

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)needsReloadFromPreviousItemSnapshot:(id)a3
{
  id v4;
  MapsUIDiffableDataSourceViewModel *viewModel;
  void *v6;
  unsigned __int8 v7;

  v4 = a3;
  if (-[MapsUIDiffableDataSourceListItemSnapshot isEqual:](self, "isEqual:", v4))
  {
    viewModel = self->_viewModel;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "viewModel"));
    v7 = -[MapsUIDiffableDataSourceViewModel needsReloadFromPreviousViewModel:](viewModel, "needsReloadFromPreviousViewModel:", v6);

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (IdentifierPath)identifierPath
{
  return self->_identifierPath;
}

- (MapsUIDiffableDataSourceViewModel)viewModel
{
  return self->_viewModel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_identifierPath, 0);
}

@end
