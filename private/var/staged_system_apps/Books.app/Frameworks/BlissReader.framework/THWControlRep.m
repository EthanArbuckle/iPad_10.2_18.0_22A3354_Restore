@implementation THWControlRep

- (void)willBeRemoved
{
  self->_repIsBeingRemoved = 1;
  objc_msgSend(-[THWControlRep controlHostRep](self, "controlHostRep"), "control:repWillBeRemoved:", -[THWControlRep layout](self, "layout"), self);
}

- (id)controlHostRep
{
  return objc_msgSend(-[THWControlRep interactiveCanvasController](self, "interactiveCanvasController"), "ancestorRepOfRep:orDelegateConformingToProtocol:", self, &OBJC_PROTOCOL___THWControlHosting);
}

- (void)willBeRemovedFromParent
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWControlRep;
  -[THWControlRep willBeRemovedFromParent](&v3, "willBeRemovedFromParent");
  if (!self->_repIsBeingRemoved)
    objc_msgSend(-[THWControlRep controlHostRep](self, "controlHostRep"), "control:repWillBeRemoved:", -[THWControlRep layout](self, "layout"), self);
}

- (void)wasAddedToParent
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWControlRep;
  -[THWControlRep wasAddedToParent](&v3, "wasAddedToParent");
  objc_msgSend(-[THWControlRep controlHostRep](self, "controlHostRep"), "control:repWasAdded:", -[THWControlRep layout](self, "layout"), self);
}

- (BOOL)directlyManagesLayerContent
{
  return 1;
}

- (void)invalidateLayers
{
  objc_msgSend(-[THWControlRep canvas](self, "canvas"), "invalidateLayers");
}

- (BOOL)repIsBeingRemoved
{
  return self->_repIsBeingRemoved;
}

@end
