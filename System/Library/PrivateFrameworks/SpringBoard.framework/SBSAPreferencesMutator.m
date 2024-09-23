@implementation SBSAPreferencesMutator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferences, 0);
}

- (void)setAnimatedTransitionDescription:(id)a3 overridingExistingUnanimatedSettings:(BOOL)a4 forProperty:(id)a5 withMilestones:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  id v12;
  id v13;

  v8 = a4;
  v13 = a3;
  v10 = a5;
  v11 = a6;
  if (v13 && v10)
  {
    -[SBSAPreferences _interfaceElementPropertiesToBehaviorSettings](self->_preferences, "_interfaceElementPropertiesToBehaviorSettings");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      -[SBSAPreferences _setInterfaceElementPropertiesToBehaviorSettings:](self->_preferences, "_setInterfaceElementPropertiesToBehaviorSettings:", v12);
    }
    if (!-[SBSAPreferences _doesUnanimatedTransitionDescriptionExistForProperty:](self->_preferences, "_doesUnanimatedTransitionDescriptionExistForProperty:", v10)|| v8)
    {
      objc_msgSend(v12, "setObject:forKey:", v13, v10);
    }
    if (objc_msgSend(v11, "count"))
      -[SBSAPreferencesMutator addMilestones:forPropertyIdentity:](self, "addMilestones:forPropertyIdentity:", v11, v10);

  }
}

- (void)setAnimatedTransitionDescription:(id)a3 forProperty:(id)a4 withMilestones:(id)a5
{
  -[SBSAPreferencesMutator setAnimatedTransitionDescription:overridingExistingUnanimatedSettings:forProperty:withMilestones:](self, "setAnimatedTransitionDescription:overridingExistingUnanimatedSettings:forProperty:withMilestones:", a3, 0, a4, a5);
}

- (SBSAPreferencesMutator)initWithPreferences:(id)a3
{
  id v5;
  SBSAPreferencesMutator *v6;
  SBSAPreferencesMutator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSAPreferencesMutator;
  v6 = -[SBSAPreferencesMutator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_preferences, a3);

  return v7;
}

- (void)setContainerViewDescriptions:(id)a3
{
  -[SBSAPreferences _setContainerViewDescriptions:](self->_preferences, "_setContainerViewDescriptions:", a3);
}

- (void)associateAnimatedTransitionDescriptionOfProperty:(id)a3 withProperty:(id)a4 withMilestones:(id)a5
{
  -[SBSAPreferencesMutator associateAnimatedTransitionDescriptionOfProperty:overridingExistingUnanimatedSettings:withProperty:withMilestones:](self, "associateAnimatedTransitionDescriptionOfProperty:overridingExistingUnanimatedSettings:withProperty:withMilestones:", a3, 0, a4, a5);
}

- (void)associateAnimatedTransitionDescriptionOfProperty:(id)a3 overridingExistingUnanimatedSettings:(BOOL)a4 withProperty:(id)a5 withMilestones:(id)a6
{
  _BOOL4 v8;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  BOOL v16;
  uint64_t v17;
  void *v18;
  id v19;

  v8 = a4;
  v19 = a3;
  v11 = a5;
  v12 = a6;
  if (v19 && v11)
  {
    -[SBSAPreferences _interfaceElementPropertiesToBehaviorSettings](self->_preferences, "_interfaceElementPropertiesToBehaviorSettings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", v19);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      while ((objc_opt_respondsToSelector() & 1) != 0)
      {
        if ((BSEqualObjects() & 1) != 0)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSAPreferences.m"), 531, CFSTR("Attempting to associate animated transition description with another causing cycle."));

          goto LABEL_22;
        }
        objc_msgSend(v13, "objectForKey:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = v15;
        if ((objc_opt_respondsToSelector() & 1) == 0)
          goto LABEL_9;
      }
    }
    v15 = v14;
LABEL_9:
    if (-[SBSAPreferences _doesUnanimatedTransitionDescriptionExistForProperty:](self->_preferences, "_doesUnanimatedTransitionDescriptionExistForProperty:", v11))
    {
      v16 = !v8;
    }
    else
    {
      v16 = 0;
    }
    if (!v16)
      objc_msgSend(v13, "setObject:forKey:", v19, v11);
    v17 = objc_opt_class();
    v14 = v15;
    if (v17)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v17 = (uint64_t)v14;
      else
        v17 = 0;
    }

    if (objc_msgSend(v12, "count") && v17)
      -[SBSAPreferencesMutator addMilestones:forPropertyIdentity:](self, "addMilestones:forPropertyIdentity:", v12, v11);
LABEL_22:

  }
}

- (void)setBackgroundBlurDescription:(id)a3
{
  -[SBSAPreferences _setBackgroundBlurDescription:](self->_preferences, "_setBackgroundBlurDescription:", a3);
}

- (void)setElementDescriptions:(id)a3
{
  -[SBSAPreferences _setElementDescriptions:](self->_preferences, "_setElementDescriptions:", a3);
}

- (void)setLastChangingElementLayoutTransition:(id)a3
{
  -[SBSAPreferences _setLastChangingElementLayoutTransition:](self->_preferences, "_setLastChangingElementLayoutTransition:", a3);
}

- (void)setHighLevelCurtainRenderingConfiguration:(SBSystemApertureContainerRenderingConfiguration *)a3
{
  SBSAPreferences *preferences;
  SBSystemApertureContainerRenderingConfiguration v4;

  preferences = self->_preferences;
  v4 = *a3;
  -[SBSAPreferences _setHighLevelCurtainRenderingConfiguration:](preferences, "_setHighLevelCurtainRenderingConfiguration:", &v4);
}

- (void)setElementLayoutTransition:(id)a3
{
  -[SBSAPreferences _setElementLayoutTransition:](self->_preferences, "_setElementLayoutTransition:", a3);
}

- (void)setCurtainRenderingConfiguration:(SBSystemApertureContainerRenderingConfiguration *)a3
{
  SBSAPreferences *preferences;
  SBSystemApertureContainerRenderingConfiguration v4;

  preferences = self->_preferences;
  v4 = *a3;
  -[SBSAPreferences _setCurtainRenderingConfiguration:](preferences, "_setCurtainRenderingConfiguration:", &v4);
}

- (NSArray)gestureDescriptions
{
  return -[SBSAPreferences gestureDescriptions](self->_preferences, "gestureDescriptions");
}

- (void)setGestureDescriptions:(id)a3
{
  -[SBSAPreferences _setGestureDescriptions:](self->_preferences, "_setGestureDescriptions:", a3);
}

- (NSArray)timerDescriptions
{
  return -[SBSAPreferences timerDescriptions](self->_preferences, "timerDescriptions");
}

- (void)setTimerDescriptions:(id)a3
{
  -[SBSAPreferences _setTimerDescriptions:](self->_preferences, "_setTimerDescriptions:", a3);
}

- (NSArray)actions
{
  return -[SBSAPreferences actions](self->_preferences, "actions");
}

- (void)setActions:(id)a3
{
  -[SBSAPreferences _setActions:](self->_preferences, "_setActions:", a3);
}

- (SBSAViewDescription)containerParentViewDescription
{
  return -[SBSAPreferences containerParentViewDescription](self->_preferences, "containerParentViewDescription");
}

- (void)setContainerParentViewDescription:(id)a3
{
  -[SBSAPreferences _setContainerParentViewDescription:](self->_preferences, "_setContainerParentViewDescription:", a3);
}

- (NSArray)containerViewDescriptions
{
  return -[SBSAPreferences containerViewDescriptions](self->_preferences, "containerViewDescriptions");
}

- (NSArray)elementDescriptions
{
  return -[SBSAPreferences elementDescriptions](self->_preferences, "elementDescriptions");
}

- (SBSAElementLayoutTransition)elementLayoutTransition
{
  return -[SBSAPreferences elementLayoutTransition](self->_preferences, "elementLayoutTransition");
}

- (SBSAElementLayoutTransition)lastChangingElementLayoutTransition
{
  return -[SBSAPreferences lastChangingElementLayoutTransition](self->_preferences, "lastChangingElementLayoutTransition");
}

- (SBSABackgroundBlurDescription)backgroundBlurDescription
{
  return -[SBSAPreferences backgroundBlurDescription](self->_preferences, "backgroundBlurDescription");
}

- (SBSystemApertureContainerRenderingConfiguration)curtainRenderingConfiguration
{
  SBSystemApertureContainerRenderingConfiguration *result;

  result = (SBSystemApertureContainerRenderingConfiguration *)self->_preferences;
  if (result)
    return (SBSystemApertureContainerRenderingConfiguration *)-[SBSystemApertureContainerRenderingConfiguration curtainRenderingConfiguration](result, "curtainRenderingConfiguration");
  retstr->renderingStyle = 0;
  retstr->cloningStyle = 0;
  *(_QWORD *)&retstr->alwaysRenderInSnapshots = 0;
  return result;
}

- (SBSystemApertureContainerRenderingConfiguration)highLevelCurtainRenderingConfiguration
{
  SBSystemApertureContainerRenderingConfiguration *result;

  result = (SBSystemApertureContainerRenderingConfiguration *)self->_preferences;
  if (result)
    return (SBSystemApertureContainerRenderingConfiguration *)-[SBSystemApertureContainerRenderingConfiguration highLevelCurtainRenderingConfiguration](result, "highLevelCurtainRenderingConfiguration");
  retstr->renderingStyle = 0;
  retstr->cloningStyle = 0;
  *(_QWORD *)&retstr->alwaysRenderInSnapshots = 0;
  return result;
}

- (BOOL)isBlobEnabled
{
  return -[SBSAPreferences isBlobEnabled](self->_preferences, "isBlobEnabled");
}

- (void)setBlobEnabled:(BOOL)a3
{
  -[SBSAPreferences _setBlobEnabled:](self->_preferences, "_setBlobEnabled:", a3);
}

- (BOOL)isCollisionImminent
{
  return -[SBSAPreferences isCollisionImminent](self->_preferences, "isCollisionImminent");
}

- (void)setCollisionImminent:(BOOL)a3
{
  -[SBSAPreferences _setCollisionImminent:](self->_preferences, "_setCollisionImminent:", a3);
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p; preferences: %@>"),
                       objc_opt_class(),
                       self,
                       self->_preferences);
}

- (id)propertiesWithAnimatedTransitionDescriptions
{
  return -[SBSAPreferences propertiesWithAnimatedTransitionDescriptions](self->_preferences, "propertiesWithAnimatedTransitionDescriptions");
}

- (id)effectiveMilestoneProvidingAnimatedTransitionDescriptionForProperty:(id)a3
{
  return -[SBSAPreferences effectiveMilestoneProvidingAnimatedTransitionDescriptionForProperty:](self->_preferences, "effectiveMilestoneProvidingAnimatedTransitionDescriptionForProperty:", a3);
}

- (id)animatedTransitionDescriptionForProperty:(id)a3
{
  return -[SBSAPreferences animatedTransitionDescriptionForProperty:](self->_preferences, "animatedTransitionDescriptionForProperty:", a3);
}

- (id)effectiveAnimatedTransitionDescriptionForProperty:(id)a3
{
  return -[SBSAPreferences effectiveAnimatedTransitionDescriptionForProperty:](self->_preferences, "effectiveAnimatedTransitionDescriptionForProperty:", a3);
}

- (void)addMilestones:(id)a3 forPropertyIdentity:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = objc_msgSend(v10, "count");
  if (v6 && v7)
  {
    -[SBSAPreferences _interfaceElementPropertiesToMilestones](self->_preferences, "_interfaceElementPropertiesToMilestones");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      -[SBSAPreferences _setInterfaceElementPropertiesToMilestones:](self->_preferences, "_setInterfaceElementPropertiesToMilestones:", v8);
    }
    objc_msgSend(v8, "objectForKey:", v6);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      objc_msgSend(v8, "setObject:forKey:", v9, v6);
    }
    objc_msgSend(v9, "unionSet:", v10);

  }
}

- (SBSAPreferences)preferences
{
  return self->_preferences;
}

@end
