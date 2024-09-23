@implementation SBSAAnimatedTransitionResultDescriptionMutator

- (SBSAAnimatedTransitionResultDescriptionMutator)initWithAnimatedTransitionResultDescription:(id)a3
{
  id v5;
  SBSAAnimatedTransitionResultDescriptionMutator *v6;
  SBSAAnimatedTransitionResultDescriptionMutator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSAAnimatedTransitionResultDescriptionMutator;
  v6 = -[SBSAAnimatedTransitionResultDescriptionMutator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_animatedTransitionResultDescription, a3);

  return v7;
}

- (NSUUID)animatedTransitionIdentifier
{
  return -[SBSAAnimatedTransitionResultDescription animatedTransitionIdentifier](self->_animatedTransitionResultDescription, "animatedTransitionIdentifier");
}

- (void)setAnimatedTransitionIdentifier:(id)a3
{
  -[SBSAAnimatedTransitionResultDescription _setAnimatedTransitionIdentifier:](self->_animatedTransitionResultDescription, "_setAnimatedTransitionIdentifier:", a3);
}

- (SBSAInterfaceElementPropertyIdentifying)associatedInterfaceElementPropertyIdentity
{
  return -[SBSAAnimatedTransitionResultDescription associatedInterfaceElementPropertyIdentity](self->_animatedTransitionResultDescription, "associatedInterfaceElementPropertyIdentity");
}

- (void)setAssociatedInterfaceElementPropertyIdentity:(id)a3
{
  -[SBSAAnimatedTransitionResultDescription _setAssociatedInterfaceElementPropertyIdentityIdentity:](self->_animatedTransitionResultDescription, "_setAssociatedInterfaceElementPropertyIdentityIdentity:", a3);
}

- (double)targetedMilestone
{
  double result;

  -[SBSAAnimatedTransitionResultDescription targetedMilestone](self->_animatedTransitionResultDescription, "targetedMilestone");
  return result;
}

- (void)setTargetedMilestone:(double)a3
{
  void *v7;

  if (a3 != 1.79769313e308 && (a3 < 0.0 || a3 > 1.0))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSAAnimatedTransitionDescription.m"), 396, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(targetedMilestone == CGFLOAT_MAX) || ((0 <= targetedMilestone) && (targetedMilestone <= 1.0))"));

  }
  -[SBSAAnimatedTransitionResultDescription _setTargetedMilestone:](self->_animatedTransitionResultDescription, "_setTargetedMilestone:", a3);
}

- (BOOL)isTransitionEndTargeted
{
  return -[SBSAAnimatedTransitionResultDescription isTransitionEndTargeted](self->_animatedTransitionResultDescription, "isTransitionEndTargeted");
}

- (void)setTransitionEndTargeted:(BOOL)a3
{
  -[SBSAAnimatedTransitionResultDescription _setTransitionEndTargeted:](self->_animatedTransitionResultDescription, "_setTransitionEndTargeted:", a3);
}

- (BOOL)finished
{
  return -[SBSAAnimatedTransitionResultDescription finished](self->_animatedTransitionResultDescription, "finished");
}

- (void)setFinished:(BOOL)a3
{
  -[SBSAAnimatedTransitionResultDescription _setFinished:](self->_animatedTransitionResultDescription, "_setFinished:", a3);
}

- (BOOL)retargeted
{
  return -[SBSAAnimatedTransitionResultDescription retargeted](self->_animatedTransitionResultDescription, "retargeted");
}

- (void)setRetargeted:(BOOL)a3
{
  -[SBSAAnimatedTransitionResultDescription _setRetargeted:](self->_animatedTransitionResultDescription, "_setRetargeted:", a3);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; animatedTransitionDescription: %@>"),
               objc_opt_class(),
               self,
               self->_animatedTransitionResultDescription);
}

- (SBSAAnimatedTransitionResultDescription)animatedTransitionResultDescription
{
  return self->_animatedTransitionResultDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animatedTransitionResultDescription, 0);
}

@end
