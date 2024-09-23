@implementation SBDragAndDropGestureRootSwitcherModifier

- (SBDragAndDropGestureRootSwitcherModifier)initWithStartingEnvironmentMode:(int64_t)a3 floatingSwitcherVisible:(BOOL)a4 fullScreenAppLayout:(id)a5
{
  id v10;
  SBDragAndDropGestureRootSwitcherModifier *v11;
  void *v13;
  objc_super v14;

  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SBDragAndDropGestureRootSwitcherModifier;
  v11 = -[SBGestureRootSwitcherModifier initWithStartingEnvironmentMode:](&v14, sel_initWithStartingEnvironmentMode_, a3);
  if (v11)
  {
    if (a3 == 3 && !v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("SBDragAndDropGestureRootSwitcherModifier.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fullScreenAppLayout"));

    }
    v11->_floatingSwitcherVisible = a4;
    objc_storeStrong((id *)&v11->_fullScreenAppLayout, a5);
  }

  return v11;
}

- (int64_t)gestureType
{
  return 6;
}

- (id)gestureChildModifierForGestureEvent:(id)a3 activeTransitionModifier:(id)a4
{
  id v5;
  int64_t v6;
  SBAppDragAndDropGestureSwitcherModifier *v7;
  void *v8;
  uint64_t v9;
  SBCardDragAndDropGestureSwitcherModifier *v10;
  void *v11;

  v5 = a3;
  v6 = -[SBGestureRootSwitcherModifier currentEnvironmentMode](self, "currentEnvironmentMode");
  if (v6 == 2)
  {
    v10 = [SBCardDragAndDropGestureSwitcherModifier alloc];
    objc_msgSend(v5, "gestureID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[SBCardDragAndDropGestureSwitcherModifier initWithGestureID:](v10, "initWithGestureID:", v8);
  }
  else
  {
    if (v6 != 3)
    {
      v11 = 0;
      goto LABEL_7;
    }
    v7 = [SBAppDragAndDropGestureSwitcherModifier alloc];
    objc_msgSend(v5, "gestureID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[SBAppDragAndDropGestureSwitcherModifier initWithGestureID:floatingSwitcherVisible:fullScreenAppLayout:](v7, "initWithGestureID:floatingSwitcherVisible:fullScreenAppLayout:", v8, self->_floatingSwitcherVisible, self->_fullScreenAppLayout);
  }
  v11 = (void *)v9;

LABEL_7:
  return v11;
}

- (id)handleSwitcherDropEvent:(id)a3
{
  id v4;
  SBCardDropSwitcherModifier *v5;
  void *v6;
  SBCardDropSwitcherModifier *v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  if (objc_msgSend(v4, "phase") == 1)
  {
    v5 = [SBCardDropSwitcherModifier alloc];
    objc_msgSend(v4, "context");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[SBCardDropSwitcherModifier initWithDropContext:](v5, "initWithDropContext:", v6);

    -[SBChainableModifier addChildModifier:](self, "addChildModifier:", v7);
  }
  v10.receiver = self;
  v10.super_class = (Class)SBDragAndDropGestureRootSwitcherModifier;
  -[SBSwitcherModifier handleSwitcherDropEvent:](&v10, sel_handleSwitcherDropEvent_, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)handleTransitionEvent:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBDragAndDropGestureRootSwitcherModifier;
  v3 = a3;
  -[SBGestureRootSwitcherModifier handleTransitionEvent:](&v10, sel_handleTransitionEvent_, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ handling drag and drop initiated transition."), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "handleWithReason:", v8);

  return v4;
}

- (id)transitionChildModifierForMainTransitionEvent:(id)a3 activeGestureModifier:(id)a4
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullScreenAppLayout, 0);
}

@end
