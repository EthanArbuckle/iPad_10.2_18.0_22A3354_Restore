@implementation SBSAAnimatedTransitionDescriptionMutator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animatedTransitionDescription, 0);
}

- (SBSAAnimatedTransitionDescriptionMutator)initWithAnimatedTransitionDescription:(id)a3
{
  id v5;
  SBSAAnimatedTransitionDescriptionMutator *v6;
  SBSAAnimatedTransitionDescriptionMutator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSAAnimatedTransitionDescriptionMutator;
  v6 = -[SBSAAnimatedTransitionDescriptionMutator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_animatedTransitionDescription, a3);

  return v7;
}

- (void)setMilestones:(id)a3
{
  -[SBSAAnimatedTransitionDescription _setMilestones:](self->_animatedTransitionDescription, "_setMilestones:", a3);
}

- (void)setResponsibleProviderDebugString:(id)a3
{
  -[SBSAAnimatedTransitionDescription _setResponsibleProviderDebugString:](self->_animatedTransitionDescription, "_setResponsibleProviderDebugString:", a3);
}

- (void)setAnimatedTransitionIdentifier:(id)a3
{
  -[SBSAAnimatedTransitionDescription _setAnimatedTransitionIdentifier:](self->_animatedTransitionDescription, "_setAnimatedTransitionIdentifier:", a3);
}

- (void)setBehaviorSettings:(id)a3
{
  -[SBSAAnimatedTransitionDescription _setBehaviorSettings:](self->_animatedTransitionDescription, "_setBehaviorSettings:", a3);
}

- (NSUUID)animatedTransitionIdentifier
{
  return -[SBSAAnimatedTransitionDescription animatedTransitionIdentifier](self->_animatedTransitionDescription, "animatedTransitionIdentifier");
}

- (SBFFluidBehaviorSettings)behaviorSettings
{
  return -[SBSAAnimatedTransitionDescription behaviorSettings](self->_animatedTransitionDescription, "behaviorSettings");
}

- (NSString)responsibleProviderDebugString
{
  return -[SBSAAnimatedTransitionDescription responsibleProviderDebugString](self->_animatedTransitionDescription, "responsibleProviderDebugString");
}

- (NSSet)milestones
{
  return -[SBSAAnimatedTransitionDescription milestones](self->_animatedTransitionDescription, "milestones");
}

- (id)keyPathsWithAuxillaryBehaviorSettings
{
  return -[SBSAAnimatedTransitionDescription keyPathsWithAuxillaryBehaviorSettings](self->_animatedTransitionDescription, "keyPathsWithAuxillaryBehaviorSettings");
}

- (void)setAuxillaryBehaviorSettings:(id)a3 forKeyPath:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[SBSAAnimatedTransitionDescription keyPathsToAuxillaryBehaviorSettingsMap](self->_animatedTransitionDescription, "keyPathsToAuxillaryBehaviorSettingsMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v11;
  v9 = v7;
  if (v11)
  {
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v10 = objc_claimAutoreleasedReturnValue();
      v8 = v11;
      v9 = (void *)v10;
    }
    objc_msgSend(v9, "setObject:forKey:", v8, v6);
  }
  else
  {
    objc_msgSend(v7, "removeObjectForKey:", v6);
    if (!objc_msgSend(v9, "count"))
    {

      v9 = 0;
    }
  }
  -[SBSAAnimatedTransitionDescription _setKeyPathsToAuxillaryBehaviorSettingsMap:](self->_animatedTransitionDescription, "_setKeyPathsToAuxillaryBehaviorSettingsMap:", v9);

}

- (id)auxillaryBehaviorSettingsForKeyPath:(id)a3
{
  SBSAAnimatedTransitionDescription *animatedTransitionDescription;
  id v4;
  void *v5;
  void *v6;

  animatedTransitionDescription = self->_animatedTransitionDescription;
  v4 = a3;
  -[SBSAAnimatedTransitionDescription keyPathsToAuxillaryBehaviorSettingsMap](animatedTransitionDescription, "keyPathsToAuxillaryBehaviorSettingsMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; animatedTransitionDescription: %@>"),
               objc_opt_class(),
               self,
               self->_animatedTransitionDescription);
}

- (SBSAAnimatedTransitionDescription)animatedTransitionDescription
{
  return self->_animatedTransitionDescription;
}

@end
