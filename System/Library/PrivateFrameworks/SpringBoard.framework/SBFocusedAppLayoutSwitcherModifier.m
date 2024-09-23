@implementation SBFocusedAppLayoutSwitcherModifier

- (SBFocusedAppLayoutSwitcherModifier)initWithFocusedAppLayout:(id)a3
{
  id v6;
  SBFocusedAppLayoutSwitcherModifier *v7;
  SBFocusedAppLayoutSwitcherModifier *v8;
  void *v10;
  objc_super v11;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBFocusedAppLayoutSwitcherModifier.m"), 22, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("focusedAppLayout"));

  }
  v11.receiver = self;
  v11.super_class = (Class)SBFocusedAppLayoutSwitcherModifier;
  v7 = -[SBSwitcherModifier init](&v11, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_focusedAppLayout, a3);

  return v8;
}

- (id)visibleAppLayouts
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBFocusedAppLayoutSwitcherModifier;
  -[SBFocusedAppLayoutSwitcherModifier visibleAppLayouts](&v8, sel_visibleAppLayouts);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setByAddingObject:", self->_focusedAppLayout);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBFocusedAppLayoutSwitcherModifier neighboringAppLayoutsForFocusedAppLayout:](self, "neighboringAppLayoutsForFocusedAppLayout:", self->_focusedAppLayout);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "setByAddingObjectsFromSet:", v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }

  return v4;
}

- (id)handleUpdateFocusedAppLayoutEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  int v20;
  int v21;
  int v22;
  int v23;
  char v24;
  void *v25;
  id v26;
  uint64_t (**v27)(_QWORD, _QWORD);
  uint64_t v28;
  int v29;
  SBUpdateLayoutSwitcherEventResponse *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  SBScrollToAppLayoutSwitcherEventResponse *v35;
  uint64_t v36;
  SBUpdateLayoutSwitcherEventResponse *v37;
  uint64_t v38;
  CGFloat v40;
  CGRect rect;
  BOOL (*v42)(uint64_t, uint64_t);
  void *v43;
  id v44;
  SBFocusedAppLayoutSwitcherModifier *v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  objc_super v50;
  objc_super v51;
  objc_super v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;

  v4 = a3;
  v52.receiver = self;
  v52.super_class = (Class)SBFocusedAppLayoutSwitcherModifier;
  -[SBSwitcherModifier handleUpdateFocusedAppLayoutEvent:](&v52, sel_handleUpdateFocusedAppLayoutEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isOrContainsAppLayout:", self->_focusedAppLayout))
  {
    if ((objc_msgSend(v4, "isFocused") & 1) == 0)
    {
      -[SBChainableModifier setState:](self, "setState:", 1);
      v30 = [SBUpdateLayoutSwitcherEventResponse alloc];
      v31 = 32;
      v32 = 2;
LABEL_35:
      v37 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:](v30, "initWithOptions:updateMode:", v31, v32, *(_QWORD *)&v40);
      SBAppendSwitcherModifierResponse(v37, v5);
      v38 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v38;
      goto LABEL_36;
    }
    -[SBFocusedAppLayoutSwitcherModifier appLayouts](self, "appLayouts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "indexOfObject:", self->_focusedAppLayout);

    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[SBFocusedAppLayoutSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
      v10 = v9;
      rect.origin.x = v9;
      rect.origin.y = v11;
      v13 = v12;
      v15 = v14;
      v51.receiver = self;
      v51.super_class = (Class)SBFocusedAppLayoutSwitcherModifier;
      -[SBFocusedAppLayoutSwitcherModifier frameForIndex:](&v51, sel_frameForIndex_, v8);
      v50.receiver = self;
      v50.super_class = (Class)SBFocusedAppLayoutSwitcherModifier;
      -[SBFocusedAppLayoutSwitcherModifier scaleForIndex:](&v50, sel_scaleForIndex_, v8);
      SBTransformedRectWithScale();
      x = v53.origin.x;
      y = v53.origin.y;
      width = v53.size.width;
      height = v53.size.height;
      CGRectGetMinX(v53);
      v54.origin.x = v10;
      v54.origin.y = v13;
      v54.size.width = v15;
      v54.size.height = rect.origin.y;
      CGRectGetMinX(v54);
      v20 = BSFloatLessThanFloat();
      v40 = x;
      v55.origin.x = x;
      v55.origin.y = y;
      v55.size.width = width;
      v55.size.height = height;
      CGRectGetMaxX(v55);
      v56.origin.x = rect.origin.x;
      v56.origin.y = v13;
      v56.size.width = v15;
      v56.size.height = rect.origin.y;
      CGRectGetMaxX(v56);
      v21 = BSFloatGreaterThanFloat();
      v22 = -[SBFocusedAppLayoutSwitcherModifier isRTLEnabled](self, "isRTLEnabled");
      LOBYTE(v23) = 0;
      if (v22)
        v24 = v21;
      else
        v24 = v20;
      if (!v22)
        v20 = v21;
      if ((v24 & 1) != 0 || (v20 & 1) != 0)
        goto LABEL_27;
      if (-[SBAppLayout environment](self->_focusedAppLayout, "environment") == 2
        && -[SBFocusedAppLayoutSwitcherModifier canFocusableAppLayoutBeEffectivelyObscured:](self, "canFocusableAppLayoutBeEffectivelyObscured:", self->_focusedAppLayout))
      {
        -[SBFocusedAppLayoutSwitcherModifier appLayouts](self, "appLayouts");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)&rect.size.width = MEMORY[0x1E0C809B0];
        *(_QWORD *)&rect.size.height = 3221225472;
        v42 = __72__SBFocusedAppLayoutSwitcherModifier_handleUpdateFocusedAppLayoutEvent___block_invoke;
        v43 = &unk_1E8EB7FD0;
        v26 = v25;
        v44 = v26;
        v45 = self;
        v46 = x;
        v47 = y;
        v48 = width;
        v49 = height;
        v27 = (uint64_t (**)(_QWORD, _QWORD))MEMORY[0x1D17E5550](&rect.size);
        *(_QWORD *)&rect.origin.y = v26;
        if (v8 < objc_msgSend(v26, "count") - 1)
          v28 = v8 + 1;
        else
          v28 = 0x7FFFFFFFFFFFFFFFLL;
        v29 = v27[2](v27, v28);
        if (v29 && v8)
        {
          v23 = 1;
        }
        else
        {
          if (v8)
            v33 = v8 - 1;
          else
            v33 = 0x7FFFFFFFFFFFFFFFLL;
          v23 = v27[2](v27, v33);
        }

        if (v29)
        {
LABEL_27:
          if (-[SBAppLayout environment](self->_focusedAppLayout, "environment", *(_QWORD *)&x) == 2)
            v34 = 0;
          else
            v34 = v20 ^ 1u;
          v35 = -[SBScrollToAppLayoutSwitcherEventResponse initWithAppLayout:alignment:animated:]([SBScrollToAppLayoutSwitcherEventResponse alloc], "initWithAppLayout:alignment:animated:", self->_focusedAppLayout, v34, 1);
          SBAppendSwitcherModifierResponse(v35, v5);
          v36 = objc_claimAutoreleasedReturnValue();

          v30 = [SBUpdateLayoutSwitcherEventResponse alloc];
          if ((v23 & 1) == 0)
          {
            v32 = 2;
            v5 = (void *)v36;
            goto LABEL_34;
          }
          v5 = (void *)v36;
          goto LABEL_32;
        }
        v30 = [SBUpdateLayoutSwitcherEventResponse alloc];
        if (v23)
        {
LABEL_32:
          v32 = 3;
          goto LABEL_34;
        }
      }
      else
      {
        v30 = [SBUpdateLayoutSwitcherEventResponse alloc];
      }
      v32 = 2;
LABEL_34:
      v31 = 30;
      goto LABEL_35;
    }
  }
LABEL_36:

  return v5;
}

BOOL __72__SBFocusedAppLayoutSwitcherModifier_handleUpdateFocusedAppLayoutEvent___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v11;
  uint64_t v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  objc_super v17;
  objc_super v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  CGRect v25;

  if (a2 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v19 = v7;
  v20 = v6;
  v21 = v5;
  v22 = v4;
  v23 = v2;
  v24 = v3;
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "environment");

  if (v12 != 2)
    return 0;
  v18.receiver = *(id *)(a1 + 40);
  v18.super_class = (Class)SBFocusedAppLayoutSwitcherModifier;
  objc_msgSendSuper2(&v18, sel_frameForIndex_, a2);
  v17.receiver = *(id *)(a1 + 40);
  v17.super_class = (Class)SBFocusedAppLayoutSwitcherModifier;
  objc_msgSendSuper2(&v17, sel_scaleForIndex_, a2);
  SBTransformedRectWithScale();
  v25.origin.x = v13;
  v25.origin.y = v14;
  v25.size.width = v15;
  v25.size.height = v16;
  return CGRectIntersectsRect(*(CGRect *)(a1 + 48), v25);
}

- (id)handleRemovalEvent:(id)a3
{
  id v4;
  void *v5;
  SBAppLayout *v6;
  SBUpdateLayoutSwitcherEventResponse *v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBFocusedAppLayoutSwitcherModifier;
  v4 = a3;
  -[SBSwitcherModifier handleRemovalEvent:](&v10, sel_handleRemovalEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appLayout", v10.receiver, v10.super_class);
  v6 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();

  if (v6 == self->_focusedAppLayout)
  {
    -[SBChainableModifier setState:](self, "setState:", 1);
    v7 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 30, 3);
    SBAppendSwitcherModifierResponse(v7, v5);
    v8 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v8;
  }

  return v5;
}

- (BOOL)shouldShowBackdropViewAtIndex:(unint64_t)a3
{
  SBFocusedAppLayoutSwitcherModifier *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = self;
  v9.receiver = self;
  v9.super_class = (Class)SBFocusedAppLayoutSwitcherModifier;
  v5 = -[SBFocusedAppLayoutSwitcherModifier shouldShowBackdropViewAtIndex:](&v9, sel_shouldShowBackdropViewAtIndex_);
  -[SBFocusedAppLayoutSwitcherModifier appLayouts](v4, "appLayouts");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v4) = objc_msgSend(v7, "isOrContainsAppLayout:", v4->_focusedAppLayout) | v5;
  return (char)v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusedAppLayout, 0);
}

@end
