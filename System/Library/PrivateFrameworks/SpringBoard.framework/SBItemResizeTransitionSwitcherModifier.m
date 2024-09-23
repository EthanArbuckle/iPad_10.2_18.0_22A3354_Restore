@implementation SBItemResizeTransitionSwitcherModifier

- (SBItemResizeTransitionSwitcherModifier)initWithTransitionID:(id)a3 selectedAppLayout:(id)a4
{
  id v7;
  SBItemResizeTransitionSwitcherModifier *v8;
  SBItemResizeTransitionSwitcherModifier *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SBItemResizeTransitionSwitcherModifier;
  v8 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v11, sel_initWithTransitionID_, a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_selectedAppLayout, a4);

  return v9;
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
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v24;
  double v25;
  double v26;
  double v27;
  objc_super v28;
  objc_super v29;
  CGRect result;

  v29.receiver = self;
  v29.super_class = (Class)SBItemResizeTransitionSwitcherModifier;
  -[SBItemResizeTransitionSwitcherModifier frameForIndex:](&v29, sel_frameForIndex_);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[SBItemResizeTransitionSwitcherModifier appLayouts](self, "appLayouts");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndex:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "isOrContainsAppLayout:", self->_selectedAppLayout))
  {
    v28.receiver = self;
    v28.super_class = (Class)SBItemResizeTransitionSwitcherModifier;
    -[SBItemResizeTransitionSwitcherModifier frameForIndex:](&v28, sel_frameForIndex_, a3);
    v16 = v15;
    v18 = v17;
    -[SBItemResizeTransitionSwitcherModifier containerViewBounds](self, "containerViewBounds");
    v20 = v19;
    v22 = v21;

    if (v16 == v20 && v18 == v22)
    {
      v10 = v10 + 0.000000001;
      v12 = v12 + 0.000000001;
    }
  }
  else
  {

  }
  v24 = v6;
  v25 = v8;
  v26 = v10;
  v27 = v12;
  result.size.height = v27;
  result.size.width = v26;
  result.origin.y = v25;
  result.origin.x = v24;
  return result;
}

- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4
{
  return 1;
}

- (unint64_t)maskedCornersForIndex:(unint64_t)a3
{
  return 15;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBItemResizeTransitionSwitcherModifier;
  -[SBTransitionSwitcherModifier animationAttributesForLayoutElement:](&v11, sel_animationAttributesForLayoutElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  if (!objc_msgSend(v4, "switcherLayoutElementType")
    && objc_msgSend(v4, "isOrContainsAppLayout:", self->_selectedAppLayout))
  {
    objc_msgSend(v6, "setLayoutUpdateMode:", 3);
    -[SBItemResizeTransitionSwitcherModifier switcherSettings](self, "switcherSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "chamoisSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "liveResizeAfterReleaseLayoutAnimationSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLayoutSettings:", v9);

  }
  return v6;
}

- (BOOL)wantsSceneResizesHostedContextForAppLayout:(id)a3
{
  id v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  if ((objc_msgSend(v4, "isOrContainsAppLayout:", self->_selectedAppLayout) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBItemResizeTransitionSwitcherModifier;
    v5 = -[SBItemResizeTransitionSwitcherModifier wantsSceneResizesHostedContextForAppLayout:](&v7, sel_wantsSceneResizesHostedContextForAppLayout_, v4);
  }

  return v5;
}

- (id)keyboardSuppressionMode
{
  return +[SBSwitcherKeyboardSuppressionMode suppressionModeNone](SBSwitcherKeyboardSuppressionMode, "suppressionModeNone");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedAppLayout, 0);
}

@end
