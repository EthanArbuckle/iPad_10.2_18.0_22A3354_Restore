@implementation UICollectionViewSupplementaryRegistration

+ (UICollectionViewSupplementaryRegistration)registrationWithSupplementaryClass:(Class)supplementaryClass elementKind:(NSString *)elementKind configurationHandler:(UICollectionViewSupplementaryRegistrationConfigurationHandler)configurationHandler
{
  UICollectionViewSupplementaryRegistrationConfigurationHandler v7;
  NSString *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v7 = configurationHandler;
  v8 = elementKind;
  v9 = objc_alloc((Class)objc_opt_class());
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithSupplementaryClass:supplementaryNib:elementKind:configurationHandler:reuseIdentifier:", supplementaryClass, 0, v8, v7, v11);

  return (UICollectionViewSupplementaryRegistration *)v12;
}

- (UICollectionViewSupplementaryRegistration)initWithSupplementaryClass:(Class)a3 supplementaryNib:(id)a4 elementKind:(id)a5 configurationHandler:(id)a6 reuseIdentifier:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  UICollectionViewSupplementaryRegistration *v17;
  void *v18;
  void *v19;
  id configurationHandler;
  objc_super v22;

  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)UICollectionViewSupplementaryRegistration;
  v17 = -[UICollectionViewSupplementaryRegistration init](&v22, sel_init);
  if (v17)
  {
    _UICollectionViewRequestingCellOrSupplementaryView();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v17->__collectionViewRequestingViewWhenCreated, v18);

    objc_storeStrong((id *)&v17->_supplementaryClass, a3);
    objc_storeStrong((id *)&v17->_supplementaryNib, a4);
    objc_storeStrong((id *)&v17->_elementKind, a5);
    v19 = _Block_copy(v15);
    configurationHandler = v17->_configurationHandler;
    v17->_configurationHandler = v19;

    objc_storeStrong((id *)&v17->_reuseIdentifier, a7);
  }

  return v17;
}

- (NSString)reuseIdentifier
{
  return self->_reuseIdentifier;
}

- (BOOL)hasSupplementaryNib
{
  return self->_supplementaryNib != 0;
}

- (BOOL)hasSupplementaryClass
{
  return self->_supplementaryClass != 0;
}

- (NSString)elementKind
{
  return self->_elementKind;
}

- (UICollectionViewSupplementaryRegistrationConfigurationHandler)configurationHandler
{
  return self->_configurationHandler;
}

- (UICollectionView)_collectionViewRequestingViewWhenCreated
{
  return (UICollectionView *)objc_loadWeakRetained((id *)&self->__collectionViewRequestingViewWhenCreated);
}

- (Class)supplementaryClass
{
  return self->_supplementaryClass;
}

+ (UICollectionViewSupplementaryRegistration)registrationWithSupplementaryNib:(UINib *)supplementaryNib elementKind:(NSString *)elementKind configurationHandler:(UICollectionViewSupplementaryRegistrationConfigurationHandler)configurationHandler
{
  UICollectionViewSupplementaryRegistrationConfigurationHandler v7;
  NSString *v8;
  UINib *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v7 = configurationHandler;
  v8 = elementKind;
  v9 = supplementaryNib;
  v10 = objc_alloc((Class)objc_opt_class());
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "UUIDString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v10, "initWithSupplementaryClass:supplementaryNib:elementKind:configurationHandler:reuseIdentifier:", 0, v9, v8, v7, v12);

  return (UICollectionViewSupplementaryRegistration *)v13;
}

- (UINib)supplementaryNib
{
  return self->_supplementaryNib;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reuseIdentifier, 0);
  objc_destroyWeak((id *)&self->__collectionViewRequestingViewWhenCreated);
  objc_storeStrong(&self->_configurationHandler, 0);
  objc_storeStrong((id *)&self->_elementKind, 0);
  objc_storeStrong((id *)&self->_supplementaryNib, 0);
  objc_storeStrong((id *)&self->_supplementaryClass, 0);
}

@end
