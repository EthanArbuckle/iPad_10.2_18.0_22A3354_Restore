@implementation SBContinuousExposeAppDragAndDropGestureSwitcherModifier

- (SBContinuousExposeAppDragAndDropGestureSwitcherModifier)initWithGestureID:(id)a3 appLayout:(id)a4 displayItemThatWouldBeEvicted:(id)a5
{
  id v10;
  id v11;
  SBContinuousExposeAppDragAndDropGestureSwitcherModifier *v12;
  void *v14;
  objc_super v15;

  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SBContinuousExposeAppDragAndDropGestureSwitcherModifier;
  v12 = -[SBGestureSwitcherModifier initWithGestureID:](&v15, sel_initWithGestureID_, a3);
  if (v12)
  {
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, v12, CFSTR("SBContinuousExposeAppDragAndDropGestureSwitcherModifier.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appLayout"));

    }
    objc_storeStrong((id *)&v12->_appLayout, a4);
    objc_storeStrong((id *)&v12->_initialAppLayout, v12->_appLayout);
    objc_storeStrong((id *)&v12->_displayItemThatWouldBeEvictedIfAny, a5);
  }

  return v12;
}

- (BOOL)completesWhenChildrenComplete
{
  return self->_transitionModifier != 0;
}

- (id)handleGestureEvent:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  NSString *v8;
  NSString *draggedSceneIdentifier;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGPoint *p_location;
  CGFloat v15;
  CGFloat v16;
  double v17;
  double v18;
  char v19;
  double x;
  void *v21;
  double v22;
  double v23;
  _BOOL4 v24;
  SBUpdateContinuousExposeStripsPresentationResponse *v25;
  uint64_t v26;
  uint64_t v27;
  SBUpdateContinuousExposeStripsPresentationResponse *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  SBMutableSwitcherTransitionRequest *v35;
  void *v36;
  SBPerformTransitionSwitcherEventResponse *v37;
  uint64_t v38;
  objc_super v40;
  objc_super v41;

  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)SBContinuousExposeAppDragAndDropGestureSwitcherModifier;
  -[SBGestureSwitcherModifier handleGestureEvent:](&v41, sel_handleGestureEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isCanceled"))
  {
    -[SBChainableModifier setState:](self, "setState:", 1);
    v6 = v5;
    goto LABEL_21;
  }
  v7 = v4;
  self->_dropAction = objc_msgSend(v7, "dropAction");
  objc_msgSend(v7, "draggedSceneIdentifier");
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  draggedSceneIdentifier = self->_draggedSceneIdentifier;
  self->_draggedSceneIdentifier = v8;

  self->_hasPlatterized = objc_msgSend(v7, "hasPlatterized");
  self->_hasPreviewLifted = objc_msgSend(v7, "hasPreviewLifted");
  self->_draggedSceneOriginalLayoutRole = objc_msgSend(v7, "draggedSceneLayoutRole");
  objc_msgSend(v7, "platterViewFrame");
  self->_platterFrame.origin.x = v10;
  self->_platterFrame.origin.y = v11;
  self->_platterFrame.size.width = v12;
  self->_platterFrame.size.height = v13;
  p_location = &self->_location;
  objc_msgSend(v7, "locationInContainerView");
  self->_location.x = v15;
  self->_location.y = v16;
  self->_gestureEnded = objc_msgSend(v7, "phase") == 3;
  -[SBContinuousExposeAppDragAndDropGestureSwitcherModifier containerViewBounds](self, "containerViewBounds");
  v18 = v17;
  v19 = -[SBContinuousExposeAppDragAndDropGestureSwitcherModifier isRTLEnabled](self, "isRTLEnabled");
  x = self->_location.x;
  if ((v19 & 1) != 0)
  {
    if (p_location->x < v18 * 0.5)
      goto LABEL_16;
  }
  else if (p_location->x >= v18 * 0.5)
  {
    goto LABEL_16;
  }
  v40.receiver = self;
  v40.super_class = (Class)SBContinuousExposeAppDragAndDropGestureSwitcherModifier;
  -[SBContinuousExposeAppDragAndDropGestureSwitcherModifier continuousExposeStripProgress](&v40, sel_continuousExposeStripProgress, x);
  -[SBContinuousExposeAppDragAndDropGestureSwitcherModifier chamoisLayoutAttributes](self, "chamoisLayoutAttributes");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "screenEdgePadding");
  v23 = v22;

  if (-[SBContinuousExposeAppDragAndDropGestureSwitcherModifier isRTLEnabled](self, "isRTLEnabled"))
    v24 = p_location->x > v18 - v23;
  else
    v24 = p_location->x < v23;
  if (BSFloatGreaterThanFloat())
  {
    if (!v24)
    {
      v25 = [SBUpdateContinuousExposeStripsPresentationResponse alloc];
      v26 = 0;
      v27 = 1;
LABEL_15:
      v28 = -[SBUpdateContinuousExposeStripsPresentationResponse initWithPresentationOptions:dismissalOptions:](v25, "initWithPresentationOptions:dismissalOptions:", v26, v27);
      SBAppendSwitcherModifierResponse(v28, v5);
      v29 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v29;
    }
  }
  else if (v24)
  {
    v25 = [SBUpdateContinuousExposeStripsPresentationResponse alloc];
    v26 = 1;
    v27 = 0;
    goto LABEL_15;
  }
LABEL_16:
  if (self->_gestureEnded)
  {
    -[SBContinuousExposeAppDragAndDropGestureSwitcherModifier topMostLayoutRolesForAppLayout:](self, "topMostLayoutRolesForAppLayout:", self->_appLayout, x);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "firstObject");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "integerValue");

    -[SBAppLayout itemForLayoutRole:](self->_appLayout, "itemForLayoutRole:", v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "uniqueIdentifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v32) = objc_msgSend(v34, "isEqualToString:", self->_draggedSceneIdentifier);

    if ((_DWORD)v32)
    {
      v35 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
      -[SBContinuousExposeAppDragAndDropGestureSwitcherModifier appLayoutByBringingItemToFront:inAppLayout:](self, "appLayoutByBringingItemToFront:inAppLayout:", v33, self->_appLayout);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBSwitcherTransitionRequest setAppLayout:](v35, "setAppLayout:", v36);

      v37 = -[SBPerformTransitionSwitcherEventResponse initWithTransitionRequest:gestureInitiated:]([SBPerformTransitionSwitcherEventResponse alloc], "initWithTransitionRequest:gestureInitiated:", v35, 0);
      SBAppendSwitcherModifierResponse(v37, v5);
      v38 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v38;
    }

  }
  v6 = v5;

LABEL_21:
  return v6;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4;
  void *v5;
  SBAppLayout *v6;
  SBAppLayout *dropTransitionFromAppLayout;
  SBContinuousExposeDragAndDropToAppTransitionSwitcherModifier *v8;
  void *v9;
  SBContinuousExposeDragAndDropToAppTransitionSwitcherModifier *v10;
  SBContinuousExposeDragAndDropToAppTransitionSwitcherModifier *transitionModifier;
  SBAppLayout *v12;
  SBAppLayout *appLayout;
  void *v14;
  objc_super v16;

  v4 = a3;
  v5 = v4;
  if (self->_gestureEnded && !self->_transitionModifier)
  {
    objc_msgSend(v4, "fromAppLayout");
    v6 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();
    dropTransitionFromAppLayout = self->_dropTransitionFromAppLayout;
    self->_dropTransitionFromAppLayout = v6;

    v8 = [SBContinuousExposeDragAndDropToAppTransitionSwitcherModifier alloc];
    objc_msgSend(v5, "transitionID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SBTransitionSwitcherModifier initWithTransitionID:](v8, "initWithTransitionID:", v9);
    transitionModifier = self->_transitionModifier;
    self->_transitionModifier = v10;

    -[SBChainableModifier addChildModifier:](self, "addChildModifier:", self->_transitionModifier);
  }
  else if (objc_msgSend(v4, "isGestureInitiated") && !self->_transitionModifier)
  {
    -[SBChainableModifier setState:](self, "setState:", 1);
  }
  objc_msgSend(v5, "toAppLayout");
  v12 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();
  appLayout = self->_appLayout;
  self->_appLayout = v12;

  v16.receiver = self;
  v16.super_class = (Class)SBContinuousExposeAppDragAndDropGestureSwitcherModifier;
  -[SBGestureSwitcherModifier handleTransitionEvent:](&v16, sel_handleTransitionEvent_, v5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)topMostLayoutRolesForAppLayout:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  objc_super v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)SBContinuousExposeAppDragAndDropGestureSwitcherModifier;
  -[SBContinuousExposeAppDragAndDropGestureSwitcherModifier topMostLayoutRolesForAppLayout:](&v25, sel_topMostLayoutRolesForAppLayout_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqual:", self->_initialAppLayout))
  {
    v6 = (void *)objc_msgSend(v5, "mutableCopy");
    v7 = 0;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(v4, "allItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v9)
    {
      v10 = v9;
      v19 = v6;
      v20 = v5;
      v11 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v22 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v13, "uniqueIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isEqualToString:", self->_draggedSceneIdentifier);

          if (v15)
          {
            v7 = objc_msgSend(v4, "layoutRoleForItem:", v13);
            v6 = v19;
            v5 = v20;
            goto LABEL_13;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        if (v10)
          continue;
        break;
      }
      v6 = v19;
      v5 = v20;
      v7 = 0;
    }
LABEL_13:

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObject:", v16);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "insertObject:atIndex:", v17, 0);

  }
  else
  {
    v6 = v5;
  }

  return v6;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  SBAppLayout *dropTransitionFromAppLayout;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  objc_super v25;
  objc_super v26;
  CGRect result;

  -[SBContinuousExposeAppDragAndDropGestureSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!self->_gestureEnded)
    goto LABEL_5;
  dropTransitionFromAppLayout = self->_dropTransitionFromAppLayout;
  if (dropTransitionFromAppLayout == self->_appLayout)
    goto LABEL_5;
  v9 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v6, "allItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[SBAppLayout containsAnyItemFromSet:](dropTransitionFromAppLayout, "containsAnyItemFromSet:", v11);

  if (v12)
    -[SBContinuousExposeAppDragAndDropGestureSwitcherModifier frameForIndex:](&v26, sel_frameForIndex_, objc_msgSend(v5, "indexOfObject:", self->_appLayout), v25.receiver, v25.super_class, self, SBContinuousExposeAppDragAndDropGestureSwitcherModifier);
  else
LABEL_5:
    -[SBContinuousExposeAppDragAndDropGestureSwitcherModifier frameForIndex:](&v25, sel_frameForIndex_, a3, self, SBContinuousExposeAppDragAndDropGestureSwitcherModifier, v26.receiver, v26.super_class);
  v17 = v13;
  v18 = v14;
  v19 = v15;
  v20 = v16;

  v21 = v17;
  v22 = v18;
  v23 = v19;
  v24 = v20;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (double)backgroundOpacityForIndex:(unint64_t)a3
{
  int v5;
  double result;
  objc_super v7;

  v5 = -[SBContinuousExposeAppDragAndDropGestureSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled");
  result = 0.0;
  if (v5)
  {
    v7.receiver = self;
    v7.super_class = (Class)SBContinuousExposeAppDragAndDropGestureSwitcherModifier;
    -[SBContinuousExposeAppDragAndDropGestureSwitcherModifier backgroundOpacityForIndex:](&v7, sel_backgroundOpacityForIndex_, a3, 0.0);
  }
  return result;
}

- (double)homeScreenDimmingAlpha
{
  SBContinuousExposeAppDragAndDropGestureSwitcherModifier **v3;
  SBContinuousExposeDragAndDropToAppTransitionSwitcherModifier *transitionModifier;
  unint64_t v5;
  double result;
  SBContinuousExposeAppDragAndDropGestureSwitcherModifier *v7;
  SBContinuousExposeAppDragAndDropGestureSwitcherModifier *v8;

  if (-[SBContinuousExposeAppDragAndDropGestureSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled"))
  {
    v8 = self;
    v3 = &v8;
LABEL_6:
    v3[1] = (SBContinuousExposeAppDragAndDropGestureSwitcherModifier *)SBContinuousExposeAppDragAndDropGestureSwitcherModifier;
    objc_msgSendSuper2((objc_super *)v3, sel_homeScreenDimmingAlpha, v7);
    return result;
  }
  transitionModifier = self->_transitionModifier;
  if (!transitionModifier
    || (v5 = -[SBTransitionSwitcherModifier transitionPhase](transitionModifier, "transitionPhase"),
        result = 1.0,
        v5 <= 1))
  {
    v7 = self;
    v3 = &v7;
    goto LABEL_6;
  }
  return result;
}

- (BOOL)isResizeGrabberVisibleForAppLayout:(id)a3
{
  objc_super v4;

  if (self->_appLayout == a3)
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)SBContinuousExposeAppDragAndDropGestureSwitcherModifier;
  return -[SBContinuousExposeAppDragAndDropGestureSwitcherModifier isResizeGrabberVisibleForAppLayout:](&v4, sel_isResizeGrabberVisibleForAppLayout_);
}

- (BOOL)isContentStatusBarVisibleForIndex:(unint64_t)a3
{
  return self->_transitionModifier != 0;
}

- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  SBAppLayout *v6;
  SBAppLayout *v7;
  SBDisplayItem *displayItemThatWouldBeEvictedIfAny;
  void *v9;
  int64_t dropAction;
  double v11;
  double v12;
  objc_super v14;

  v6 = (SBAppLayout *)a4;
  v7 = v6;
  displayItemThatWouldBeEvictedIfAny = self->_displayItemThatWouldBeEvictedIfAny;
  if (!displayItemThatWouldBeEvictedIfAny || self->_appLayout != v6)
    goto LABEL_7;
  -[SBAppLayout itemForLayoutRole:](v6, "itemForLayoutRole:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[SBDisplayItem isEqual:](displayItemThatWouldBeEvictedIfAny, "isEqual:", v9))
  {

LABEL_7:
    v14.receiver = self;
    v14.super_class = (Class)SBContinuousExposeAppDragAndDropGestureSwitcherModifier;
    -[SBContinuousExposeAppDragAndDropGestureSwitcherModifier dimmingAlphaForLayoutRole:inAppLayout:](&v14, sel_dimmingAlphaForLayoutRole_inAppLayout_, a3, v7);
    v11 = v12;
    goto LABEL_8;
  }
  dropAction = self->_dropAction;

  v11 = 0.5;
  if (!dropAction)
    goto LABEL_7;
LABEL_8:

  return v11;
}

- (BOOL)switcherHitTestsAsOpaque
{
  return 1;
}

- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4
{
  void *v4;
  BOOL v5;

  -[SBAppLayout itemForLayoutRole:](self->_appLayout, "itemForLayoutRole:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  SBAppLayout *dropTransitionFromAppLayout;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  objc_super v25;
  UIRectCornerRadii result;

  -[SBContinuousExposeAppDragAndDropGestureSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SBAppLayout isOrContainsAppLayout:](self->_initialAppLayout, "isOrContainsAppLayout:", v6)
    || (dropTransitionFromAppLayout = self->_dropTransitionFromAppLayout) != 0
    && -[SBAppLayout isOrContainsAppLayout:](dropTransitionFromAppLayout, "isOrContainsAppLayout:", v6))
  {
    -[SBContinuousExposeAppDragAndDropGestureSwitcherModifier chamoisLayoutAttributes](self, "chamoisLayoutAttributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBContinuousExposeAppDragAndDropGestureSwitcherModifier displayCornerRadius](self, "displayCornerRadius");
    if (BSFloatIsZero())
      objc_msgSend(v8, "stageCornerRadii");
    -[SBContinuousExposeAppDragAndDropGestureSwitcherModifier scaleForIndex:](self, "scaleForIndex:", a3);
    SBRectCornerRadiiForRadius();
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;

  }
  else
  {
    v25.receiver = self;
    v25.super_class = (Class)SBContinuousExposeAppDragAndDropGestureSwitcherModifier;
    -[SBContinuousExposeAppDragAndDropGestureSwitcherModifier cornerRadiiForIndex:](&v25, sel_cornerRadiiForIndex_, a3);
    v10 = v17;
    v12 = v18;
    v14 = v19;
    v16 = v20;
  }

  v21 = v10;
  v22 = v12;
  v23 = v14;
  v24 = v16;
  result.topRight = v24;
  result.bottomRight = v23;
  result.bottomLeft = v22;
  result.topLeft = v21;
  return result;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBContinuousExposeAppDragAndDropGestureSwitcherModifier;
  -[SBGestureSwitcherModifier animationAttributesForLayoutElement:](&v9, sel_animationAttributesForLayoutElement_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  -[SBContinuousExposeAppDragAndDropGestureSwitcherModifier medusaSettings](self, "medusaSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resizeAnimationSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLayoutSettings:", v7);

  objc_msgSend(v5, "setUpdateMode:", 3);
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_draggedSceneIdentifier, 0);
  objc_storeStrong((id *)&self->_transitionModifier, 0);
  objc_storeStrong((id *)&self->_dropTransitionFromAppLayout, 0);
  objc_storeStrong((id *)&self->_displayItemThatWouldBeEvictedIfAny, 0);
  objc_storeStrong((id *)&self->_appLayout, 0);
  objc_storeStrong((id *)&self->_initialAppLayout, 0);
}

@end
