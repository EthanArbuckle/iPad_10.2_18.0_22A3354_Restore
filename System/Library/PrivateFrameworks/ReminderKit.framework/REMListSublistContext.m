@implementation REMListSublistContext

- (REMListSublistContext)initWithList:(id)a3
{
  id v5;
  REMListSublistContext *v6;
  REMListSublistContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)REMListSublistContext;
  v6 = -[REMListSublistContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_list, a3);

  return v7;
}

- (id)fetchListsWithError:(id *)a3
{
  REMListsDataView *v5;
  void *v6;
  void *v7;
  REMListsDataView *v8;
  void *v9;
  void *v10;

  v5 = [REMListsDataView alloc];
  -[REMListSublistContext list](self, "list");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "store");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[REMListsDataView initWithStore:](v5, "initWithStore:", v7);

  -[REMListSublistContext list](self, "list");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMListsDataView fetchListsInGroup:error:](v8, "fetchListsInGroup:error:", v9, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)fetchCustomSmartListsWithError:(id *)a3
{
  REMSmartListsDataView *v5;
  void *v6;
  void *v7;
  REMSmartListsDataView *v8;
  void *v9;
  void *v10;

  v5 = [REMSmartListsDataView alloc];
  -[REMListSublistContext list](self, "list");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "store");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[REMSmartListsDataView initWithStore:](v5, "initWithStore:", v7);

  -[REMListSublistContext list](self, "list");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[REMSmartListsDataView fetchCustomSmartListsInGroup:error:](v8, "fetchCustomSmartListsInGroup:error:", v9, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (REMList)list
{
  return self->_list;
}

- (void)setList:(id)a3
{
  objc_storeStrong((id *)&self->_list, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_list, 0);
}

@end
