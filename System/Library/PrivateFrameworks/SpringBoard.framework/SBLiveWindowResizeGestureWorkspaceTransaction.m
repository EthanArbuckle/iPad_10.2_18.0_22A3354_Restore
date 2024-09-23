@implementation SBLiveWindowResizeGestureWorkspaceTransaction

- (int64_t)_gestureType
{
  return 9;
}

- (BOOL)isLiveResize
{
  return 1;
}

- (void)_beginWithGesture:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;

  v5 = a3;
  -[SBFluidSwitcherGestureWorkspaceTransaction switcherViewController](self, "switcherViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "itemContainerToResizeUsingPointer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = v7;
    self->_selectedEdge = objc_msgSend(v7, "pointerIsHoveringOverEdge");
    goto LABEL_24;
  }
  objc_msgSend(v6, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _UISystemGestureLocationInView();
  v11 = v10;
  v13 = v12;

  objc_msgSend(v6, "_itemContainerNearestLocation:environment:prioritizeForegroundedItemContainers:", 1, 1, v11, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  UIRectGetCenter();
  if (v11 < v14 && v13 < v15)
  {
    v19 = 5;
    goto LABEL_21;
  }
  if (v11 > v14 && v13 < v15)
  {
    v19 = 6;
    goto LABEL_21;
  }
  if (v11 < v14 && v13 > v15)
  {
    v19 = 7;
LABEL_21:
    self->_selectedEdge = v19;
    goto LABEL_22;
  }
  if (v11 > v14 && v13 > v15)
  {
    v19 = 8;
    goto LABEL_21;
  }
LABEL_22:
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBLiveWindowResizeGestureWorkspaceTransaction.m"), 53, CFSTR("Need a selected item container"));

    v8 = 0;
  }
LABEL_24:
  objc_msgSend(v8, "appLayout");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "adjustedAppLayoutForLeafAppLayout:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFluidSwitcherGestureWorkspaceTransaction setSelectedAppLayout:](self, "setSelectedAppLayout:", v21);
  objc_msgSend(v20, "itemForLayoutRole:", 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  self->_selectedLayoutRole = objc_msgSend(v21, "layoutRoleForItem:", v22);

  v24.receiver = self;
  v24.super_class = (Class)SBLiveWindowResizeGestureWorkspaceTransaction;
  -[SBFluidSwitcherGestureWorkspaceTransaction _beginWithGesture:](&v24, sel__beginWithGesture_, v5);

}

- (int64_t)selectedLayoutRole
{
  return self->_selectedLayoutRole;
}

- (unint64_t)selectedEdge
{
  return self->_selectedEdge;
}

@end
