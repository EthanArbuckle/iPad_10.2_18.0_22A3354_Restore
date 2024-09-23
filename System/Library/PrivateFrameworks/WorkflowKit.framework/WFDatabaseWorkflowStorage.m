@implementation WFDatabaseWorkflowStorage

- (WFDatabaseWorkflowStorage)initWithDatabase:(id)a3
{
  id v5;
  WFDatabaseWorkflowStorage *v6;
  WFDatabaseWorkflowStorage *v7;
  WFDatabaseWorkflowStorage *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WFDatabaseWorkflowStorage;
  v6 = -[WFDatabaseWorkflowStorage init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_database, a3);
    v8 = v7;
  }

  return v7;
}

- (BOOL)saveRecord:(id)a3 withReference:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a4;
  v9 = a3;
  -[WFDatabaseWorkflowStorage database](self, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v10, "saveRecord:withDescriptor:error:", v9, v8, a5);

  return (char)a5;
}

- (BOOL)reloadRecord:(id)a3 withReference:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a4;
  v9 = a3;
  -[WFDatabaseWorkflowStorage database](self, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v10, "reloadRecord:withDescriptor:error:", v9, v8, a5);

  return (char)a5;
}

- (WFDatabase)database
{
  return self->_database;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_database, 0);
}

@end
