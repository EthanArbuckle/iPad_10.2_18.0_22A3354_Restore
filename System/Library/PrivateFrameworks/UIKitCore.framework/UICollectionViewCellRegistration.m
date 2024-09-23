@implementation UICollectionViewCellRegistration

+ (UICollectionViewCellRegistration)registrationWithCellNib:(UINib *)cellNib configurationHandler:(UICollectionViewCellRegistrationConfigurationHandler)configurationHandler
{
  UICollectionViewCellRegistrationConfigurationHandler v5;
  UINib *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = configurationHandler;
  v6 = cellNib;
  v7 = objc_alloc((Class)objc_opt_class());
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithCellClass:cellNib:configurationHandler:reuseIdentifier:", 0, v6, v5, v9);

  return (UICollectionViewCellRegistration *)v10;
}

+ (UICollectionViewCellRegistration)registrationWithCellClass:(Class)cellClass configurationHandler:(UICollectionViewCellRegistrationConfigurationHandler)configurationHandler
{
  UICollectionViewCellRegistrationConfigurationHandler v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = configurationHandler;
  v6 = objc_alloc((Class)objc_opt_class());
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithCellClass:cellNib:configurationHandler:reuseIdentifier:", cellClass, 0, v5, v8);

  return (UICollectionViewCellRegistration *)v9;
}

- (UICollectionViewCellRegistration)initWithCellClass:(Class)a3 cellNib:(id)a4 configurationHandler:(id)a5 reuseIdentifier:(id)a6
{
  id v11;
  id v12;
  id v13;
  UICollectionViewCellRegistration *v14;
  void *v15;
  void *v16;
  id configurationHandler;
  objc_super v19;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)UICollectionViewCellRegistration;
  v14 = -[UICollectionViewCellRegistration init](&v19, sel_init);
  if (v14)
  {
    _UICollectionViewRequestingCellOrSupplementaryView();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v14->__collectionViewRequestingViewWhenCreated, v15);

    objc_storeStrong((id *)&v14->_cellClass, a3);
    objc_storeStrong((id *)&v14->_cellNib, a4);
    v16 = _Block_copy(v12);
    configurationHandler = v14->_configurationHandler;
    v14->_configurationHandler = v16;

    objc_storeStrong((id *)&v14->_reuseIdentifier, a6);
  }

  return v14;
}

- (NSString)reuseIdentifier
{
  return self->_reuseIdentifier;
}

- (BOOL)hasCellClass
{
  return self->_cellClass != 0;
}

- (UICollectionViewCellRegistrationConfigurationHandler)configurationHandler
{
  return self->_configurationHandler;
}

- (UICollectionView)_collectionViewRequestingViewWhenCreated
{
  return (UICollectionView *)objc_loadWeakRetained((id *)&self->__collectionViewRequestingViewWhenCreated);
}

- (Class)cellClass
{
  return self->_cellClass;
}

- (BOOL)hasCellNib
{
  return self->_cellNib != 0;
}

- (UINib)cellNib
{
  return self->_cellNib;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reuseIdentifier, 0);
  objc_destroyWeak((id *)&self->__collectionViewRequestingViewWhenCreated);
  objc_storeStrong(&self->_configurationHandler, 0);
  objc_storeStrong((id *)&self->_cellNib, 0);
  objc_storeStrong((id *)&self->_cellClass, 0);
}

@end
