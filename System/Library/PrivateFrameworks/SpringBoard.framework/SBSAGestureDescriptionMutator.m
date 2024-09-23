@implementation SBSAGestureDescriptionMutator

- (SBSAGestureDescriptionMutator)initWithGestureDescription:(id)a3
{
  id v5;
  SBSAGestureDescriptionMutator *v6;
  SBSAGestureDescriptionMutator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSAGestureDescriptionMutator;
  v6 = -[SBSAGestureDescriptionMutator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_gestureDescription, a3);

  return v7;
}

- (NSUUID)gestureIdentifier
{
  return -[SBSAGestureDescription gestureIdentifier](self->_gestureDescription, "gestureIdentifier");
}

- (void)setGestureIdentifier:(id)a3
{
  -[SBSAGestureDescription _setGestureIdentifier:](self->_gestureDescription, "_setGestureIdentifier:", a3);
}

- (NSUUID)associatedInterfaceElementIdentifier
{
  return -[SBSAGestureDescription associatedInterfaceElementIdentifier](self->_gestureDescription, "associatedInterfaceElementIdentifier");
}

- (void)setAssociatedInterfaceElementIdentifier:(id)a3
{
  -[SBSAGestureDescription _setAssociatedInterfaceElementIdentifier:](self->_gestureDescription, "_setAssociatedInterfaceElementIdentifier:", a3);
}

- (int64_t)gestureRecognizerState
{
  return -[SBSAGestureDescription gestureRecognizerState](self->_gestureDescription, "gestureRecognizerState");
}

- (void)setGestureRecognizerState:(int64_t)a3
{
  -[SBSAGestureDescription _setGestureRecognizerState:](self->_gestureDescription, "_setGestureRecognizerState:", a3);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; gestureDescription: %@>"),
               objc_opt_class(),
               self,
               self->_gestureDescription);
}

- (SBSAGestureDescription)gestureDescription
{
  return self->_gestureDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureDescription, 0);
}

@end
