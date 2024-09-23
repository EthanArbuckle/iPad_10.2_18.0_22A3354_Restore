@implementation SBHomeGestureToZoomDownSwitcherModifier

- (SBHomeGestureToZoomDownSwitcherModifier)initWithTransitionID:(id)a3 appLayout:(id)a4 nonGestureInitiatedZoomModifier:(id)a5 effectiveStartingEnvironmentMode:(int64_t)a6 liftOffVelocity:(CGPoint)a7 adjustAnimationAttributes:(BOOL)a8
{
  _BOOL4 v8;
  double y;
  double x;
  id v17;
  id v18;
  SBHomeGestureToZoomDownSwitcherModifier *v19;
  SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier *v20;
  SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier *animationAttributesModifier;
  void *v23;
  objc_super v24;

  v8 = a8;
  y = a7.y;
  x = a7.x;
  v17 = a4;
  v18 = a5;
  v24.receiver = self;
  v24.super_class = (Class)SBHomeGestureToZoomDownSwitcherModifier;
  v19 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v24, sel_initWithTransitionID_, a3);
  if (v19)
  {
    if (!v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, v19, CFSTR("SBHomeGestureToZoomDownSwitcherModifier.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appLayout"));

    }
    objc_storeStrong((id *)&v19->_appLayout, a4);
    objc_storeStrong((id *)&v19->_nonGestureInitiatedZoomModifier, a5);
    v19->_startingEnvironmentMode = a6;
    -[SBChainableModifier addChildModifier:](v19, "addChildModifier:", v19->_nonGestureInitiatedZoomModifier);
    if (v8)
    {
      v20 = -[SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier initWithAppLayout:gestureEdge:liftOffVelocity:]([SBGestureInitiatedIconZoomAnimationAttributesSwitcherModifier alloc], "initWithAppLayout:gestureEdge:liftOffVelocity:", v17, 4, x, y);
      animationAttributesModifier = v19->_animationAttributesModifier;
      v19->_animationAttributesModifier = v20;

      -[SBChainableModifier addChildModifier:](v19, "addChildModifier:", v19->_animationAttributesModifier);
    }
  }

  return v19;
}

- (BOOL)completesWhenChildrenComplete
{
  return 1;
}

- (id)responseForProposedChildResponse:(id)a3 childModifier:(id)a4 event:(id)a5
{
  SBSwitcherModifier *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v17[5];
  objc_super v18;

  v8 = (SBSwitcherModifier *)a4;
  v9 = a5;
  v18.receiver = self;
  v18.super_class = (Class)SBHomeGestureToZoomDownSwitcherModifier;
  -[SBChainableModifier responseForProposedChildResponse:childModifier:event:](&v18, sel_responseForProposedChildResponse_childModifier_event_, a3, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 && self->_nonGestureInitiatedZoomModifier == v8 && objc_msgSend(v9, "type") == 1)
  {
    v11 = v9;
    objc_msgSend(v11, "transitionID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBTransitionSwitcherModifier transitionID](self, "transitionID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isEqual:", v13))
    {
      v14 = objc_msgSend(v11, "phase");

      if (v14 == 1)
      {
        v17[0] = MEMORY[0x1E0C809B0];
        v17[1] = 3221225472;
        v17[2] = __96__SBHomeGestureToZoomDownSwitcherModifier_responseForProposedChildResponse_childModifier_event___block_invoke;
        v17[3] = &unk_1E8EABCC0;
        v17[4] = self;
        objc_msgSend(v10, "responseByTransformingResponseWithTransformer:", v17);
        v15 = objc_claimAutoreleasedReturnValue();

        v10 = (void *)v15;
      }
    }
    else
    {

    }
  }

  return v10;
}

id __96__SBHomeGestureToZoomDownSwitcherModifier_responseForProposedChildResponse_childModifier_event___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  SBIconViewVisibilitySwitcherEventResponse *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  if (objc_msgSend(v3, "type") == 10)
  {
    v4 = 0;
LABEL_6:

    v3 = v4;
    return v3;
  }
  if (objc_msgSend(v3, "type") == 13)
  {
    v5 = *(_QWORD **)(a1 + 32);
    if (v5[19] == 2)
    {
      objc_msgSend(v5, "switcherSettings");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "animationSettings");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "switcherZoomDownIconFadeOutSettings");
      v8 = objc_claimAutoreleasedReturnValue();

      v4 = -[SBIconViewVisibilitySwitcherEventResponse initWithAppLayout:visible:animationSettings:excludedIconLocations:]([SBIconViewVisibilitySwitcherEventResponse alloc], "initWithAppLayout:visible:animationSettings:excludedIconLocations:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136), 0, v8, 0);
      v3 = (id)v8;
      goto LABEL_6;
    }
  }
  return v3;
}

- (int64_t)homeScreenBackdropBlurType
{
  return 3;
}

- (BOOL)isWallpaperRequiredForSwitcher
{
  return 1;
}

- (int64_t)wallpaperStyle
{
  return 1;
}

- (BOOL)isHomeScreenContentRequired
{
  return 1;
}

- (BOOL)isSwitcherWindowVisible
{
  return 1;
}

- (BOOL)isSwitcherWindowUserInteractionEnabled
{
  return 0;
}

- (id)appLayoutsToCacheSnapshots
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  -[SBHomeGestureToZoomDownSwitcherModifier appLayouts](self, "appLayouts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    -[SBHomeGestureToZoomDownSwitcherModifier appLayouts](self, "appLayouts");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "indexOfObject:", self->_appLayout);

    -[SBHomeGestureToZoomDownSwitcherModifier switcherSettings](self, "switcherSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "numberOfSnapshotsToAlwaysKeepAround");
    if (!v7)
      v7 = objc_msgSend(v6, "numberOfSnapshotsToCacheInSwitcher");
    -[SBSwitcherModifier appLayoutsToCacheSnapshotsWithVisibleRange:numberOfSnapshotsToCache:biasForward:](self, "appLayoutsToCacheSnapshotsWithVisibleRange:numberOfSnapshotsToCache:biasForward:", v5, 1, v7, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v8;
}

- (id)appLayoutsToCacheFullsizeSnapshots
{
  SBAppLayout *v3;
  void *v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  void *v8;
  NSRange v9;
  void *v10;
  NSRange v12;
  NSRange v13;

  v3 = self->_appLayout;
  if (v3)
  {
    -[SBHomeGestureToZoomDownSwitcherModifier appLayouts](self, "appLayouts");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "indexOfObject:", v3);

    if (v5)
      v6 = v5 - 1;
    else
      v6 = 0;
    if (v5)
      v7 = 3;
    else
      v7 = 2;
  }
  else
  {
    v6 = 0;
    v7 = 1;
  }
  -[SBHomeGestureToZoomDownSwitcherModifier appLayouts](self, "appLayouts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13.length = objc_msgSend(v8, "count");
  v12.location = v6;
  v12.length = v7;
  v13.location = 0;
  v9 = NSIntersectionRange(v12, v13);
  objc_msgSend(v8, "subarrayWithRange:", v9.location, v9.length);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_animationAttributesModifier, 0);
  objc_storeStrong((id *)&self->_nonGestureInitiatedZoomModifier, 0);
  objc_storeStrong((id *)&self->_appLayout, 0);
}

@end
