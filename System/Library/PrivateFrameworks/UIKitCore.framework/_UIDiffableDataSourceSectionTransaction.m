@implementation _UIDiffableDataSourceSectionTransaction

- (_UIDiffableDataSourceSectionTransaction)initWithSectionIdentifier:(id)a3 initialSnapshot:(id)a4 finalSnapshot:(id)a5 difference:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  _UIDiffableDataSourceSectionTransaction *v15;
  _UIDiffableDataSourceSectionTransaction *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)_UIDiffableDataSourceSectionTransaction;
  v15 = -[_UIDiffableDataSourceSectionTransaction init](&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong(&v15->_sectionIdentifier, a3);
    objc_storeStrong((id *)&v16->_initialSnapshot, a4);
    objc_storeStrong((id *)&v16->_finalSnapshot, a5);
    objc_storeStrong((id *)&v16->_difference, a6);
  }

  return v16;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p - sectionIdentifier=%@; initialSnapshot=%p; finalSnapshot=%p; difference=%@>"),
    v5,
    self,
    self->_sectionIdentifier,
    self->_initialSnapshot,
    self->_finalSnapshot,
    self->_difference);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  _UIDiffableDataSourceSectionTransaction *v4;
  _UIDiffableDataSourceSectionTransaction *v5;
  _UIDiffableDataSourceSectionTransaction *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  char v18;

  v4 = (_UIDiffableDataSourceSectionTransaction *)a3;
  v5 = v4;
  if (v4)
  {
    if (v4 == self)
    {
      v18 = 1;
    }
    else
    {
      v6 = v4;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_9;
      -[_UIDiffableDataSourceSectionTransaction sectionIdentifier](v6, "sectionIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDiffableDataSourceSectionTransaction sectionIdentifier](self, "sectionIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqual:", v8);

      if (!v9)
        goto LABEL_9;
      -[_UIDiffableDataSourceSectionTransaction difference](v6, "difference");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDiffableDataSourceSectionTransaction difference](self, "difference");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if (!v12)
        goto LABEL_9;
      -[_UIDiffableDataSourceSectionTransaction initialSnapshot](v6, "initialSnapshot");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIDiffableDataSourceSectionTransaction initialSnapshot](self, "initialSnapshot");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "isEqual:", v14);

      if (v15)
      {
        -[_UIDiffableDataSourceSectionTransaction finalSnapshot](v6, "finalSnapshot");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIDiffableDataSourceSectionTransaction finalSnapshot](self, "finalSnapshot");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v16, "isEqual:", v17);

      }
      else
      {
LABEL_9:
        v18 = 0;
      }

    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (NSDiffableDataSourceSectionSnapshot)initialSnapshot
{
  return self->_initialSnapshot;
}

- (NSDiffableDataSourceSectionSnapshot)finalSnapshot
{
  return self->_finalSnapshot;
}

- (NSOrderedCollectionDifference)difference
{
  return self->_difference;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_difference, 0);
  objc_storeStrong((id *)&self->_finalSnapshot, 0);
  objc_storeStrong((id *)&self->_initialSnapshot, 0);
  objc_storeStrong(&self->_sectionIdentifier, 0);
}

@end
