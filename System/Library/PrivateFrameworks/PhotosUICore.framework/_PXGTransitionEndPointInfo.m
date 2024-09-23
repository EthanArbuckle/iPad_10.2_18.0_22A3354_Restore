@implementation _PXGTransitionEndPointInfo

- (PXGViewCoordinator)tungstenViewCoordinator
{
  return self->_tungstenViewCoordinator;
}

- (void)setTungstenViewCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_tungstenViewCoordinator, a3);
}

- (PXGItemPlacementController)itemPlacementController
{
  return self->_itemPlacementController;
}

- (void)setItemPlacementController:(id)a3
{
  objc_storeStrong((id *)&self->_itemPlacementController, a3);
}

- (PXGItemPlacementContext)placementContext
{
  return self->_placementContext;
}

- (void)setPlacementContext:(id)a3
{
  objc_storeStrong((id *)&self->_placementContext, a3);
}

- (PXGItemPlacement)originalItemPlacement
{
  return self->_originalItemPlacement;
}

- (void)setOriginalItemPlacement:(id)a3
{
  objc_storeStrong((id *)&self->_originalItemPlacement, a3);
}

- (id)itemReference
{
  return self->_itemReference;
}

- (void)setItemReference:(id)a3
{
  objc_storeStrong(&self->_itemReference, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_itemReference, 0);
  objc_storeStrong((id *)&self->_originalItemPlacement, 0);
  objc_storeStrong((id *)&self->_placementContext, 0);
  objc_storeStrong((id *)&self->_itemPlacementController, 0);
  objc_storeStrong((id *)&self->_tungstenViewCoordinator, 0);
}

@end
