@implementation SBContinuousExposeIdentifiersChangedModifierEvent

- (SBContinuousExposeIdentifiersChangedModifierEvent)initWithPreviousContinuousExposeIdentifiersInSwitcher:(id)a3 previousContinuousExposeIdentifiersInStrip:(id)a4 transitioningFromAppLayout:(id)a5 transitioningToAppLayout:(id)a6 animated:(BOOL)a7 gestureInitiated:(BOOL)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  SBContinuousExposeIdentifiersChangedModifierEvent *v19;
  uint64_t v20;
  NSArray *previousContinuousExposeIdentifiersInSwitcher;
  uint64_t v22;
  NSArray *previousContinuousExposeIdentifiersInStrip;
  void *v25;
  void *v26;
  objc_super v27;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v27.receiver = self;
  v27.super_class = (Class)SBContinuousExposeIdentifiersChangedModifierEvent;
  v19 = -[SBContinuousExposeIdentifiersChangedModifierEvent init](&v27, sel_init);
  if (v19)
  {
    if (v15)
    {
      if (v16)
      {
LABEL_4:
        v20 = objc_msgSend(v15, "copy");
        previousContinuousExposeIdentifiersInSwitcher = v19->_previousContinuousExposeIdentifiersInSwitcher;
        v19->_previousContinuousExposeIdentifiersInSwitcher = (NSArray *)v20;

        v22 = objc_msgSend(v16, "copy");
        previousContinuousExposeIdentifiersInStrip = v19->_previousContinuousExposeIdentifiersInStrip;
        v19->_previousContinuousExposeIdentifiersInStrip = (NSArray *)v22;

        objc_storeStrong((id *)&v19->_transitioningFromAppLayout, a5);
        objc_storeStrong((id *)&v19->_transitioningToAppLayout, a6);
        v19->_animated = a7;
        v19->_gestureInitiated = a8;
        goto LABEL_5;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, v19, CFSTR("SBContinuousExposeIdentifiersChangedModifierEvent.m"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("previousContinuousExposeIdentifiersInSwitcher"));

      if (v16)
        goto LABEL_4;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, v19, CFSTR("SBContinuousExposeIdentifiersChangedModifierEvent.m"), 19, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("previousContinuousExposeIdentifiersInStrip"));

    goto LABEL_4;
  }
LABEL_5:

  return v19;
}

- (int64_t)type
{
  return 34;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPreviousContinuousExposeIdentifiersInSwitcher:previousContinuousExposeIdentifiersInStrip:transitioningFromAppLayout:transitioningToAppLayout:animated:gestureInitiated:", self->_previousContinuousExposeIdentifiersInSwitcher, self->_previousContinuousExposeIdentifiersInStrip, self->_transitioningFromAppLayout, self->_transitioningToAppLayout, self->_animated, self->_gestureInitiated);
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SBContinuousExposeIdentifiersChangedModifierEvent;
  -[SBSwitcherModifierEvent descriptionBuilderWithMultilinePrefix:](&v11, sel_descriptionBuilderWithMultilinePrefix_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v4, "appendObject:withName:", self->_previousContinuousExposeIdentifiersInStrip, CFSTR("previousContinuousExposeIdentifiersInStrip"));
  v6 = (id)objc_msgSend(v4, "appendObject:withName:", self->_previousContinuousExposeIdentifiersInSwitcher, CFSTR("previousContinuousExposeIdentifiersInSwitcher"));
  -[SBAppLayout succinctDescription](self->_transitioningFromAppLayout, "succinctDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v7, CFSTR("transitioningFromAppLayout"));

  -[SBAppLayout succinctDescription](self->_transitioningToAppLayout, "succinctDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v8, CFSTR("transitioningToAppLayout"));

  v9 = (id)objc_msgSend(v4, "appendBool:withName:", self->_gestureInitiated, CFSTR("gestureInitiated"));
  return v4;
}

- (NSArray)previousContinuousExposeIdentifiersInSwitcher
{
  return self->_previousContinuousExposeIdentifiersInSwitcher;
}

- (NSArray)previousContinuousExposeIdentifiersInStrip
{
  return self->_previousContinuousExposeIdentifiersInStrip;
}

- (SBAppLayout)transitioningFromAppLayout
{
  return self->_transitioningFromAppLayout;
}

- (SBAppLayout)transitioningToAppLayout
{
  return self->_transitioningToAppLayout;
}

- (BOOL)isAnimated
{
  return self->_animated;
}

- (BOOL)isGestureInitiated
{
  return self->_gestureInitiated;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitioningToAppLayout, 0);
  objc_storeStrong((id *)&self->_transitioningFromAppLayout, 0);
  objc_storeStrong((id *)&self->_previousContinuousExposeIdentifiersInStrip, 0);
  objc_storeStrong((id *)&self->_previousContinuousExposeIdentifiersInSwitcher, 0);
}

@end
