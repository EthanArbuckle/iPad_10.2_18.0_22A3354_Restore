@implementation VUILibraryShelvesDataSource

- (VUIShelvesDataSourceDelegate)shelvesDelegate
{
  return (VUIShelvesDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_shelvesDelegate);
}

- (NSSet)shelfTypes
{
  return self->_shelfTypes;
}

- (void)setShelvesDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_shelvesDelegate, a3);
}

- (void)setDataSourcesByShelfType:(id)a3
{
  objc_storeStrong((id *)&self->_dataSourcesByShelfType, a3);
}

- (VUILibraryShelvesDataSource)initWithValidShelfTypes:(id)a3
{
  id v5;
  VUILibraryShelvesDataSource *v6;
  VUILibraryShelvesDataSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VUILibraryShelvesDataSource;
  v6 = -[VUILibraryShelvesDataSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_shelfTypes, a3);

  return v7;
}

- (NSDictionary)dataSourcesByShelfType
{
  return self->_dataSourcesByShelfType;
}

- (void)setShelfTypes:(id)a3
{
  objc_storeStrong((id *)&self->_shelfTypes, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_shelvesDelegate);
  objc_storeStrong((id *)&self->_dataSourcesByShelfType, 0);
  objc_storeStrong((id *)&self->_shelfTypes, 0);
}

@end
