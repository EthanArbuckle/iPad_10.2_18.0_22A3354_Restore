@implementation HomeOutlineSectionControllerConfiguration

- (HomeOutlineSectionControllerConfiguration)initWithCollectionView:(id)a3 sectionIdentifier:(id)a4 delegate:(id)a5 actionCoordinator:(id)a6 homeActionDelegate:(id)a7 storage:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  HomeOutlineSectionControllerConfiguration *v21;
  HomeOutlineSectionControllerConfiguration *v22;
  objc_super v24;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v24.receiver = self;
  v24.super_class = (Class)HomeOutlineSectionControllerConfiguration;
  v21 = -[HomeOutlineSectionControllerConfiguration init](&v24, "init");
  v22 = v21;
  if (v21)
  {
    objc_storeStrong((id *)&v21->_collectionView, a3);
    objc_storeStrong((id *)&v22->_sectionIdentifier, a4);
    objc_storeWeak((id *)&v22->_delegate, v17);
    objc_storeWeak((id *)&v22->_actionCoordinator, v18);
    objc_storeWeak((id *)&v22->_homeActionDelegate, v19);
    objc_storeStrong((id *)&v22->_storage, a8);
  }

  return v22;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (NSString)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (HomeOutlineSectionControllerDelegate)delegate
{
  return (HomeOutlineSectionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (ActionCoordination)actionCoordinator
{
  return (ActionCoordination *)objc_loadWeakRetained((id *)&self->_actionCoordinator);
}

- (HomeActionDelegate)homeActionDelegate
{
  return (HomeActionDelegate *)objc_loadWeakRetained((id *)&self->_homeActionDelegate);
}

- (HomeStorage)storage
{
  return self->_storage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
  objc_destroyWeak((id *)&self->_homeActionDelegate);
  objc_destroyWeak((id *)&self->_actionCoordinator);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sectionIdentifier, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end
