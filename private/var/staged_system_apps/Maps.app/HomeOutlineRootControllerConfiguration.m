@implementation HomeOutlineRootControllerConfiguration

- (HomeOutlineRootControllerConfiguration)initWithCollectionView:(id)a3 actionCoordinator:(id)a4 homeActionDelegate:(id)a5 homeUpdateDelegate:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HomeOutlineRootControllerConfiguration *v15;
  HomeOutlineRootControllerConfiguration *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HomeOutlineRootControllerConfiguration;
  v15 = -[HomeOutlineRootControllerConfiguration init](&v18, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_collectionView, a3);
    objc_storeWeak((id *)&v16->_actionCoordinator, v12);
    objc_storeWeak((id *)&v16->_homeActionDelegate, v13);
    objc_storeWeak((id *)&v16->_homeUpdateDelegate, v14);
  }

  return v16;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (ActionCoordination)actionCoordinator
{
  return (ActionCoordination *)objc_loadWeakRetained((id *)&self->_actionCoordinator);
}

- (HomeActionDelegate)homeActionDelegate
{
  return (HomeActionDelegate *)objc_loadWeakRetained((id *)&self->_homeActionDelegate);
}

- (HomeUpdateDelegate)homeUpdateDelegate
{
  return (HomeUpdateDelegate *)objc_loadWeakRetained((id *)&self->_homeUpdateDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_homeUpdateDelegate);
  objc_destroyWeak((id *)&self->_homeActionDelegate);
  objc_destroyWeak((id *)&self->_actionCoordinator);
  objc_storeStrong((id *)&self->_collectionView, 0);
}

@end
