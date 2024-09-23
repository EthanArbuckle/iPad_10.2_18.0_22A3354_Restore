@implementation SBTransitionSwitcherModifierRemovalContext

- (SBTransitionSwitcherModifierRemovalContext)initWithAnimationStyle:(int64_t)a3 displayItem:(id)a4
{
  id v8;
  SBTransitionSwitcherModifierRemovalContext *v9;
  void *v11;
  objc_super v12;

  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBTransitionSwitcherModifierRemovalContext;
  v9 = -[SBTransitionSwitcherModifierRemovalContext init](&v12, sel_init);
  if (v9)
  {
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("SBTransitionSwitcherModifierRemovalContext.m"), 15, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayItem"));

    }
    v9->_animationStyle = a3;
    objc_storeStrong((id *)&v9->_displayItem, a4);
  }

  return v9;
}

- (int64_t)animationStyle
{
  return self->_animationStyle;
}

- (SBDisplayItem)displayItem
{
  return self->_displayItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayItem, 0);
}

@end
