@implementation SBSlideOverToFullScreenSwitcherModifier

- (SBSlideOverToFullScreenSwitcherModifier)initWithTransitionID:(id)a3 slideOverAppLayout:(id)a4 fullScreenAppLayout:(id)a5 replacingMainAppLayout:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  SBSlideOverToFullScreenSwitcherModifier *v14;
  SBSlideOverToFullScreenSwitcherModifier *v15;
  SBHomeScreenZoomSwitcherModifier *v16;
  SBHomeScreenZoomSwitcherModifier *homeScreenZoomModifier;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)SBSlideOverToFullScreenSwitcherModifier;
  v14 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v19, sel_initWithTransitionID_, v10);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_fromSlideOverAppLayout, a4);
    objc_storeStrong((id *)&v15->_toFullScreenAppLayout, a5);
    objc_storeStrong((id *)&v15->_removedMainAppLayout, a6);
    if (!v13)
    {
      v16 = -[SBHomeScreenZoomSwitcherModifier initWithTransitionID:direction:]([SBHomeScreenZoomSwitcherModifier alloc], "initWithTransitionID:direction:", v10, 2);
      homeScreenZoomModifier = v15->_homeScreenZoomModifier;
      v15->_homeScreenZoomModifier = v16;

      -[SBChainableModifier addChildModifier:](v15, "addChildModifier:", v15->_homeScreenZoomModifier);
    }
  }

  return v15;
}

- (id)handleSceneReadyEvent:(id)a3
{
  void *v3;
  SBUpdateLayoutSwitcherEventResponse *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBSlideOverToFullScreenSwitcherModifier;
  -[SBSwitcherModifier handleSceneReadyEvent:](&v7, sel_handleSceneReadyEvent_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 32, 2);
  SBAppendSwitcherModifierResponse(v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)transitionWillBegin
{
  void *v2;
  SBUpdateLayoutSwitcherEventResponse *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBSlideOverToFullScreenSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionWillBegin](&v6, sel_transitionWillBegin);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 2, 2);
  SBAppendSwitcherModifierResponse(v3, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)preferredAppLayoutToReuseAccessoryForAppLayout:(id)a3 fromAppLayouts:(id)a4
{
  SBAppLayout *v6;
  id v7;
  void *v8;
  objc_super v10;

  v6 = (SBAppLayout *)a3;
  v7 = a4;
  if (self->_fromSlideOverAppLayout == v6 || self->_toFullScreenAppLayout == v6)
  {
    v8 = 0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SBSlideOverToFullScreenSwitcherModifier;
    -[SBSlideOverToFullScreenSwitcherModifier preferredAppLayoutToReuseAccessoryForAppLayout:fromAppLayouts:](&v10, sel_preferredAppLayoutToReuseAccessoryForAppLayout_fromAppLayouts_, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)visibleAppLayouts
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBSlideOverToFullScreenSwitcherModifier;
  -[SBSlideOverToFullScreenSwitcherModifier visibleAppLayouts](&v9, sel_visibleAppLayouts);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__SBSlideOverToFullScreenSwitcherModifier_visibleAppLayouts__block_invoke;
  v8[3] = &unk_1E8E9DF78;
  v8[4] = self;
  objc_msgSend(v3, "bs_filter:", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "addObject:", self->_toFullScreenAppLayout);
  v6 = v5;

  return v6;
}

uint64_t __60__SBSlideOverToFullScreenSwitcherModifier_visibleAppLayouts__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136)) ^ 1;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  SBAppLayout *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  objc_super v23;
  CGRect result;

  v23.receiver = self;
  v23.super_class = (Class)SBSlideOverToFullScreenSwitcherModifier;
  -[SBSlideOverToFullScreenSwitcherModifier frameForIndex:](&v23, sel_frameForIndex_);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[SBSlideOverToFullScreenSwitcherModifier appLayouts](self, "appLayouts");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndex:", a3);
  v14 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();

  if (self->_removedMainAppLayout == v14)
  {
    -[SBSlideOverToFullScreenSwitcherModifier containerViewBounds](self, "containerViewBounds");
    v6 = v15;
    v8 = v16;
    v10 = v17;
    v12 = v18;
  }

  v19 = v6;
  v20 = v8;
  v21 = v10;
  v22 = v12;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  SBAppLayout *v8;
  double v9;
  double v10;
  SBAppLayout *removedMainAppLayout;
  void *v12;
  void *v13;
  double v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SBSlideOverToFullScreenSwitcherModifier;
  v8 = (SBAppLayout *)a4;
  -[SBSlideOverToFullScreenSwitcherModifier opacityForLayoutRole:inAppLayout:atIndex:](&v16, sel_opacityForLayoutRole_inAppLayout_atIndex_, a3, v8, a5);
  v10 = v9;
  removedMainAppLayout = self->_removedMainAppLayout;

  if (removedMainAppLayout == v8)
  {
    -[SBSlideOverToFullScreenSwitcherModifier switcherSettings](self, "switcherSettings", v16.receiver, v16.super_class);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "animationSettings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "slideOverToFullScreenOutgoingFinalOpacity");
    v10 = v14;

  }
  return v10;
}

- (double)scaleForIndex:(unint64_t)a3
{
  double v5;
  double v6;
  void *v7;
  SBAppLayout *v8;
  void *v9;
  void *v10;
  double v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SBSlideOverToFullScreenSwitcherModifier;
  -[SBSlideOverToFullScreenSwitcherModifier scaleForIndex:](&v13, sel_scaleForIndex_);
  v6 = v5;
  -[SBSlideOverToFullScreenSwitcherModifier appLayouts](self, "appLayouts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", a3);
  v8 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();

  if (self->_removedMainAppLayout == v8)
  {
    -[SBSlideOverToFullScreenSwitcherModifier switcherSettings](self, "switcherSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "animationSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "slideOverToFullScreenOutgoingAppScaleBack");
    v6 = v11;

  }
  return v6;
}

- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  objc_super v8;

  v6 = a4;
  if (objc_msgSend(v6, "isEqual:", self->_toFullScreenAppLayout))
  {
    LODWORD(a3) = -[SBSlideOverToFullScreenSwitcherModifier isLayoutRoleContentReady:inAppLayout:](self, "isLayoutRoleContentReady:inAppLayout:", a3, self->_toFullScreenAppLayout) ^ 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBSlideOverToFullScreenSwitcherModifier;
    LOBYTE(a3) = -[SBSlideOverToFullScreenSwitcherModifier isLayoutRoleBlurred:inAppLayout:](&v8, sel_isLayoutRoleBlurred_inAppLayout_, a3, v6);
  }

  return a3;
}

- (double)blurDelayForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  double v7;
  double v8;
  double result;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBSlideOverToFullScreenSwitcherModifier;
  v6 = a4;
  -[SBSlideOverToFullScreenSwitcherModifier blurDelayForLayoutRole:inAppLayout:](&v10, sel_blurDelayForLayoutRole_inAppLayout_, a3, v6);
  v8 = v7;
  LODWORD(a3) = objc_msgSend(v6, "isEqual:", self->_toFullScreenAppLayout, v10.receiver, v10.super_class);

  result = 0.0;
  if (!(_DWORD)a3)
    return v8;
  return result;
}

- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4
{
  SBSlideOverToFullScreenSwitcherModifier *v5;
  id v6;
  objc_super v8;

  v5 = self;
  v8.receiver = self;
  v8.super_class = (Class)SBSlideOverToFullScreenSwitcherModifier;
  v6 = a4;
  LOBYTE(a3) = -[SBSlideOverToFullScreenSwitcherModifier isLayoutRoleMatchMovedToScene:inAppLayout:](&v8, sel_isLayoutRoleMatchMovedToScene_inAppLayout_, a3, v6);
  LOBYTE(v5) = objc_msgSend(v6, "isEqual:", v5->_toFullScreenAppLayout, v8.receiver, v8.super_class);

  return v5 | a3;
}

- (UIRectCornerRadii)cornerRadiiForIndex:(unint64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIRectCornerRadii result;

  -[SBSlideOverToFullScreenSwitcherModifier displayCornerRadius](self, "displayCornerRadius", a3);
  SBRectCornerRadiiForRadius();
  result.topRight = v6;
  result.bottomRight = v5;
  result.bottomLeft = v4;
  result.topLeft = v3;
  return result;
}

- (int64_t)wallpaperStyle
{
  return 3;
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  return (SBSwitcherAsyncRenderingAttributes)SBSwitcherAsyncRenderingAttributesMake(0, 0);
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBSlideOverToFullScreenSwitcherModifier;
  -[SBTransitionSwitcherModifier animationAttributesForLayoutElement:](&v10, sel_animationAttributesForLayoutElement_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  -[SBSlideOverToFullScreenSwitcherModifier switcherSettings](self, "switcherSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "animationSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "slideOverToFullScreenAnimationSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLayoutSettings:", v8);

  objc_msgSend(v5, "setUpdateMode:", 3);
  return v5;
}

- (id)visibleHomeAffordanceLayoutElements
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBSlideOverToFullScreenSwitcherModifier;
  -[SBSlideOverToFullScreenSwitcherModifier visibleHomeAffordanceLayoutElements](&v6, sel_visibleHomeAffordanceLayoutElements);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(v4, "removeObject:", self->_fromSlideOverAppLayout);
  objc_msgSend(v4, "removeObject:", self->_toFullScreenAppLayout);
  return v4;
}

- (BOOL)wantsSlideOverTongue
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeScreenZoomModifier, 0);
  objc_storeStrong((id *)&self->_removedMainAppLayout, 0);
  objc_storeStrong((id *)&self->_toFullScreenAppLayout, 0);
  objc_storeStrong((id *)&self->_fromSlideOverAppLayout, 0);
}

@end
