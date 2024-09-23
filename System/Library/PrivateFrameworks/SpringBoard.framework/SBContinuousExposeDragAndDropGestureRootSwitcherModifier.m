@implementation SBContinuousExposeDragAndDropGestureRootSwitcherModifier

- (SBContinuousExposeDragAndDropGestureRootSwitcherModifier)initWithStartingEnvironmentMode:(int64_t)a3 appLayout:(id)a4
{
  id v8;
  SBContinuousExposeDragAndDropGestureRootSwitcherModifier *v9;
  void *v11;
  objc_super v12;

  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBContinuousExposeDragAndDropGestureRootSwitcherModifier;
  v9 = -[SBGestureRootSwitcherModifier initWithStartingEnvironmentMode:](&v12, sel_initWithStartingEnvironmentMode_, a3);
  if (v9)
  {
    if (a3 == 3 && !v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, v9, CFSTR("SBContinuousExposeDragAndDropGestureRootSwitcherModifier.m"), 29, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appLayout"));

    }
    objc_storeStrong((id *)&v9->_appLayout, a4);
  }

  return v9;
}

- (int64_t)gestureType
{
  return 6;
}

- (id)gestureChildModifierForGestureEvent:(id)a3 activeTransitionModifier:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  SBContinuousExposeAppDragAndDropGestureSwitcherModifier *v12;
  void *v13;
  void *v14;
  SBContinuousExposeAppDragAndDropGestureSwitcherModifier *v15;
  void *v16;
  _QWORD v18[5];

  v5 = a3;
  if (-[SBGestureRootSwitcherModifier currentEnvironmentMode](self, "currentEnvironmentMode") == 3)
  {
    +[SBAppSwitcherDomain rootSettings](SBAppSwitcherDomain, "rootSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "chamoisSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "maximumNumberOfAppsOnStage");

    -[SBAppLayout allItems](self->_appLayout, "allItems");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v10 >= v8)
    {
      -[SBAppLayout allItems](self->_appLayout, "allItems");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __121__SBContinuousExposeDragAndDropGestureRootSwitcherModifier_gestureChildModifierForGestureEvent_activeTransitionModifier___block_invoke;
      v18[3] = &unk_1E8EAC3F0;
      v18[4] = self;
      objc_msgSend(v13, "sortedArrayUsingComparator:", v18);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "firstObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = 0;
    }
    v15 = [SBContinuousExposeAppDragAndDropGestureSwitcherModifier alloc];
    objc_msgSend(v5, "gestureID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[SBContinuousExposeAppDragAndDropGestureSwitcherModifier initWithGestureID:appLayout:displayItemThatWouldBeEvicted:](v15, "initWithGestureID:appLayout:displayItemThatWouldBeEvicted:", v16, self->_appLayout, v11);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

uint64_t __121__SBContinuousExposeDragAndDropGestureRootSwitcherModifier_gestureChildModifierForGestureEvent_activeTransitionModifier___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;

  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 128);
  v6 = a3;
  objc_msgSend(v5, "layoutAttributesForItem:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "lastInteractionTime");

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 128), "layoutAttributesForItem:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "lastInteractionTime");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "compare:", v12);

  return v13;
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
  v10.super_class = (Class)SBContinuousExposeDragAndDropGestureRootSwitcherModifier;
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
  objc_storeStrong((id *)&self->_appLayout, 0);
}

@end
