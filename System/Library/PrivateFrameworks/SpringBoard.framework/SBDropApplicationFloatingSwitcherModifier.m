@implementation SBDropApplicationFloatingSwitcherModifier

- (SBDropApplicationFloatingSwitcherModifier)initWithTransitionID:(id)a3 fromAppLayout:(id)a4 toAppLayout:(id)a5
{
  id v9;
  id v10;
  SBDropApplicationFloatingSwitcherModifier *v11;
  SBDropApplicationFloatingSwitcherModifier *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SBDropApplicationFloatingSwitcherModifier;
  v11 = -[SBTransitionSwitcherModifier initWithTransitionID:](&v14, sel_initWithTransitionID_, a3);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_fromAppLayout, a4);
    objc_storeStrong((id *)&v12->_toAppLayout, a5);
  }

  return v12;
}

- (id)transitionWillBegin
{
  void *v2;
  SBUpdateLayoutSwitcherEventResponse *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBDropApplicationFloatingSwitcherModifier;
  -[SBTransitionSwitcherModifier transitionWillBegin](&v6, sel_transitionWillBegin);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 2, 2);
  +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v3, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)visibleAppLayouts
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v4 = v3;
  if (self->_toAppLayout)
    objc_msgSend(v3, "addObject:");
  if (self->_fromAppLayout)
    objc_msgSend(v4, "addObject:");
  return v4;
}

- (double)opacityForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  double v7;
  double v8;
  void *v9;
  void *v10;
  SBAppLayout *fromAppLayout;
  void *v12;
  BOOL v13;
  double v14;
  SBAppLayout *toAppLayout;
  void *v16;
  _BOOL4 v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)SBDropApplicationFloatingSwitcherModifier;
  -[SBDropApplicationFloatingSwitcherModifier opacityForLayoutRole:inAppLayout:atIndex:](&v19, sel_opacityForLayoutRole_inAppLayout_atIndex_, a3, a4);
  v8 = v7;
  -[SBDropApplicationFloatingSwitcherModifier appLayouts](self, "appLayouts");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  fromAppLayout = self->_fromAppLayout;
  if (!fromAppLayout
    || (objc_msgSend(v9, "objectAtIndex:", a5),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = -[SBAppLayout isEqual:](fromAppLayout, "isEqual:", v12),
        v12,
        v14 = 1.0,
        !v13))
  {
    toAppLayout = self->_toAppLayout;
    if (toAppLayout)
    {
      objc_msgSend(v10, "objectAtIndex:", a5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = -[SBAppLayout isEqual:](toAppLayout, "isEqual:", v16);

      if (v17)
        v14 = 1.0;
      else
        v14 = v8;
    }
    else
    {
      v14 = v8;
    }
  }

  return v14;
}

- (BOOL)shouldPerformCrossfadeForReduceMotion
{
  return 0;
}

- (id)appLayoutsToResignActive
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (id)keyboardSuppressionMode
{
  return +[SBSwitcherKeyboardSuppressionMode suppressionModeNone](SBSwitcherKeyboardSuppressionMode, "suppressionModeNone");
}

- (SBSwitcherAsyncRenderingAttributes)asyncRenderingAttributesForAppLayout:(id)a3
{
  return (SBSwitcherAsyncRenderingAttributes)SBSwitcherAsyncRenderingAttributesMake(0, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fromAppLayout, 0);
  objc_storeStrong((id *)&self->_toAppLayout, 0);
}

@end
