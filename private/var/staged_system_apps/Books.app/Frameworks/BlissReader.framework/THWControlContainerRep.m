@implementation THWControlContainerRep

- (void)willBeRemoved
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWControlContainerRep;
  -[THWControlContainerRep willBeRemoved](&v3, "willBeRemoved");
  self->_repIsBeingRemoved = 1;
  if (objc_msgSend(-[THWControlContainerRep canvas](self, "canvas"), "isCanvasInteractive"))
    objc_msgSend(objc_msgSend(-[THWControlContainerRep interactiveCanvasController](self, "interactiveCanvasController"), "ancestorRepOfRep:orDelegateConformingToProtocol:", self, &OBJC_PROTOCOL___THWControlHosting), "control:repWillBeRemoved:", -[THWControlContainerRep layout](self, "layout"), self);
}

- (void)willBeRemovedFromParent
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWControlContainerRep;
  -[THWControlContainerRep willBeRemovedFromParent](&v3, "willBeRemovedFromParent");
  if (!self->_repIsBeingRemoved)
  {
    if (objc_msgSend(-[THWControlContainerRep canvas](self, "canvas"), "isCanvasInteractive"))
      objc_msgSend(objc_msgSend(-[THWControlContainerRep interactiveCanvasController](self, "interactiveCanvasController"), "ancestorRepOfRep:orDelegateConformingToProtocol:", self, &OBJC_PROTOCOL___THWControlHosting), "control:repWillBeRemoved:", -[THWControlContainerRep layout](self, "layout"), self);
  }
}

- (void)wasAddedToParent
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWControlContainerRep;
  -[THWControlContainerRep wasAddedToParent](&v3, "wasAddedToParent");
  if (objc_msgSend(-[THWControlContainerRep canvas](self, "canvas"), "isCanvasInteractive"))
    objc_msgSend(objc_msgSend(-[THWControlContainerRep interactiveCanvasController](self, "interactiveCanvasController"), "ancestorRepOfRep:orDelegateConformingToProtocol:", self, &OBJC_PROTOCOL___THWControlHosting), "control:repWasAdded:", -[THWControlContainerRep layout](self, "layout"), self);
}

- (BOOL)directlyManagesLayerContent
{
  return 1;
}

- (BOOL)masksToBounds
{
  THWControlContainerRepDelegate *v3;
  BOOL v4;
  objc_super v6;

  v3 = -[THWControlContainerRep delegate](self, "delegate");
  v6.receiver = self;
  v6.super_class = (Class)THWControlContainerRep;
  v4 = -[THWControlContainerRep masksToBounds](&v6, "masksToBounds");
  if ((objc_opt_respondsToSelector(v3, "controlContainerMasksToBounds:") & 1) != 0)
    return -[THWControlContainerRepDelegate controlContainerMasksToBounds:](v3, "controlContainerMasksToBounds:", self);
  return v4;
}

- (void)addAdditionalChildLayersToArray:(id)a3
{
  THWControlContainerRepDelegate *v5;

  v5 = -[THWControlContainerRep delegate](self, "delegate");
  if ((objc_opt_respondsToSelector(v5, "controlContainer:addChildLayersToArray:") & 1) != 0)
    -[THWControlContainerRepDelegate controlContainer:addChildLayersToArray:](v5, "controlContainer:addChildLayersToArray:", self, a3);
}

- (void)addChildViewsToArray:(id)a3
{
  THWControlContainerRepDelegate *v5;

  v5 = -[THWControlContainerRep delegate](self, "delegate");
  if ((objc_opt_respondsToSelector(v5, "controlContainer:addChildViewsToArray:") & 1) != 0)
    -[THWControlContainerRepDelegate controlContainer:addChildViewsToArray:](v5, "controlContainer:addChildViewsToArray:", self, a3);
}

- (id)viewControllerForView:(id)a3
{
  THWControlContainerRepDelegate *v5;

  v5 = -[THWControlContainerRep delegate](self, "delegate");
  if ((objc_opt_respondsToSelector(v5, "controlContainer:viewControllerForView:") & 1) != 0)
    return -[THWControlContainerRepDelegate controlContainer:viewControllerForView:](v5, "controlContainer:viewControllerForView:", self, a3);
  else
    return 0;
}

- (BOOL)allowTrackingContainedRep:(id)a3
{
  THWControlContainerRepDelegate *v5;

  v5 = -[THWControlContainerRep delegate](self, "delegate");
  if ((objc_opt_respondsToSelector(v5, "controlContainer:allowTrackingContainedRep:") & 1) != 0)
    return -[THWControlContainerRepDelegate controlContainer:allowTrackingContainedRep:](v5, "controlContainer:allowTrackingContainedRep:", self, a3);
  else
    return 1;
}

- (id)controlHostRep
{
  return objc_msgSend(-[THWControlContainerRep interactiveCanvasController](self, "interactiveCanvasController"), "ancestorRepOfRep:orDelegateConformingToProtocol:", self, &OBJC_PROTOCOL___THWControlHosting);
}

- (THWControlContainerRepDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THWControlContainerRepDelegate *)a3;
}

- (BOOL)repIsBeingRemoved
{
  return self->_repIsBeingRemoved;
}

@end
