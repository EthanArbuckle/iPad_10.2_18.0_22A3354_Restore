@implementation _UIActivityUserDefaultsDataSource

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;

  v6 = a4;
  v7 = a3;
  -[_UIActivityUserDefaultsDataSource dataSourceProxy](self, "dataSourceProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "tableView:canMoveRowAtIndexPath:", v7, v6);

  return v9;
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[_UIActivityUserDefaultsDataSource dataSourceProxy](self, "dataSourceProxy");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "tableView:moveRowAtIndexPath:toIndexPath:", v10, v9, v8);

}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;

  v6 = a4;
  v7 = a3;
  -[_UIActivityUserDefaultsDataSource dataSourceProxy](self, "dataSourceProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "tableView:canEditRowAtIndexPath:", v7, v6);

  return v9;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a3;
  -[_UIActivityUserDefaultsDataSource dataSourceProxy](self, "dataSourceProxy");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "tableView:commitEditingStyle:forRowAtIndexPath:", v9, a4, v8);

}

- (_UIActivityUserDefaultsDataSourceProxy)dataSourceProxy
{
  return (_UIActivityUserDefaultsDataSourceProxy *)objc_loadWeakRetained((id *)&self->_dataSourceProxy);
}

- (void)setDataSourceProxy:(id)a3
{
  objc_storeWeak((id *)&self->_dataSourceProxy, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSourceProxy);
}

@end
