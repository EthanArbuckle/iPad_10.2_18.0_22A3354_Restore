@implementation SBSwitcherSwipeUpGestureFloatingSwitcherModifier

- (SBSwitcherSwipeUpGestureFloatingSwitcherModifier)initWithGestureID:(id)a3
{
  id v4;
  SBSwitcherSwipeUpGestureFloatingSwitcherModifier *v5;
  SBGridSwipeUpGestureSwitcherModifier *v6;
  SBGridSwipeUpGestureSwitcherModifier *gridSwipeUpGestureModifier;
  SBDismissSiriSwitcherModifier *v8;
  SBDismissSiriSwitcherModifier *dismissSiriModifier;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBSwitcherSwipeUpGestureFloatingSwitcherModifier;
  v5 = -[SBGestureSwitcherModifier initWithGestureID:](&v11, sel_initWithGestureID_, v4);
  if (v5)
  {
    v6 = -[SBGridSwipeUpGestureSwitcherModifier initWithGestureID:]([SBGridSwipeUpGestureSwitcherModifier alloc], "initWithGestureID:", v4);
    gridSwipeUpGestureModifier = v5->_gridSwipeUpGestureModifier;
    v5->_gridSwipeUpGestureModifier = v6;

    -[SBChainableModifier addChildModifier:](v5, "addChildModifier:", v5->_gridSwipeUpGestureModifier);
    v8 = objc_alloc_init(SBDismissSiriSwitcherModifier);
    dismissSiriModifier = v5->_dismissSiriModifier;
    v5->_dismissSiriModifier = v8;

    -[SBChainableModifier addChildModifier:](v5, "addChildModifier:", v5->_dismissSiriModifier);
  }

  return v5;
}

- (id)responseForProposedChildResponse:(id)a3 childModifier:(id)a4 event:(id)a5
{
  SBGridSwipeUpGestureSwitcherModifier *v8;
  void *v9;
  SBGridSwipeUpGestureSwitcherModifier *gridSwipeUpGestureModifier;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBSwitcherSwipeUpGestureFloatingSwitcherModifier;
  v8 = (SBGridSwipeUpGestureSwitcherModifier *)a4;
  -[SBChainableModifier responseForProposedChildResponse:childModifier:event:](&v12, sel_responseForProposedChildResponse_childModifier_event_, a3, v8, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  gridSwipeUpGestureModifier = self->_gridSwipeUpGestureModifier;

  if (gridSwipeUpGestureModifier == v8)
  {

    v9 = 0;
  }
  return v9;
}

- (id)handleGestureEvent:(id)a3
{
  id v4;
  void *v5;
  SBGridSwipeUpGestureSwitcherModifier *gridSwipeUpGestureModifier;
  SBMutableSwitcherTransitionRequest *v7;
  SBPerformTransitionSwitcherEventResponse *v8;
  uint64_t v9;
  _QWORD v11[5];
  id v12;
  _QWORD *v13;
  _QWORD v14[4];
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SBSwitcherSwipeUpGestureFloatingSwitcherModifier;
  -[SBGestureSwitcherModifier handleGestureEvent:](&v15, sel_handleGestureEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "phase") == 3)
  {
    v14[0] = 0;
    v14[1] = v14;
    v14[2] = 0x2020000000;
    v14[3] = 0;
    gridSwipeUpGestureModifier = self->_gridSwipeUpGestureModifier;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __71__SBSwitcherSwipeUpGestureFloatingSwitcherModifier_handleGestureEvent___block_invoke;
    v11[3] = &unk_1E8E9FD30;
    v13 = v14;
    v11[4] = self;
    v12 = v4;
    -[SBChainableModifier performTransactionWithTemporaryChildModifier:usingBlock:](self, "performTransactionWithTemporaryChildModifier:usingBlock:", gridSwipeUpGestureModifier, v11);
    v7 = objc_alloc_init(SBMutableSwitcherTransitionRequest);
    -[SBSwitcherTransitionRequest setFloatingSwitcherVisible:](v7, "setFloatingSwitcherVisible:", BSSettingFlagIfYes());
    v8 = -[SBPerformTransitionSwitcherEventResponse initWithTransitionRequest:gestureInitiated:]([SBPerformTransitionSwitcherEventResponse alloc], "initWithTransitionRequest:gestureInitiated:", v7, 1);
    +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v8, v5);
    v9 = objc_claimAutoreleasedReturnValue();

    -[SBChainableModifier setState:](self, "setState:", 1);
    _Block_object_dispose(v14, 8);
    v5 = (void *)v9;
  }

  return v5;
}

uint64_t __71__SBSwitcherSwipeUpGestureFloatingSwitcherModifier_handleGestureEvent___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 120), "finalResponseForGestureEvent:", a1[5]);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  CGFloat v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGAffineTransform v10;
  objc_super v11;
  objc_super v12;
  CGRect result;

  -[SBSwitcherSwipeUpGestureFloatingSwitcherModifier switcherViewBounds](self, "switcherViewBounds");
  UIRectGetCenter();
  v12.receiver = self;
  v12.super_class = (Class)SBSwitcherSwipeUpGestureFloatingSwitcherModifier;
  -[SBSwitcherSwipeUpGestureFloatingSwitcherModifier frameForIndex:](&v12, sel_frameForIndex_, a3);
  UIRectGetCenter();
  v11.receiver = self;
  v11.super_class = (Class)SBSwitcherSwipeUpGestureFloatingSwitcherModifier;
  -[SBSwitcherSwipeUpGestureFloatingSwitcherModifier contentViewScale](&v11, sel_contentViewScale);
  CGAffineTransformMakeScale(&v10, v5, v5);
  SBRectWithSize();
  SBUnintegralizedRectCenteredAboutPoint();
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  double v4;
  double v5;
  double v6;
  objc_super v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBSwitcherSwipeUpGestureFloatingSwitcherModifier;
  -[SBSwitcherSwipeUpGestureFloatingSwitcherModifier scaleForIndex:](&v9, sel_scaleForIndex_, a3);
  v5 = v4;
  v8.receiver = self;
  v8.super_class = (Class)SBSwitcherSwipeUpGestureFloatingSwitcherModifier;
  -[SBSwitcherSwipeUpGestureFloatingSwitcherModifier contentViewScale](&v8, sel_contentViewScale);
  return v5 * v6;
}

- (double)contentViewScale
{
  return 1.0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissSiriModifier, 0);
  objc_storeStrong((id *)&self->_gridSwipeUpGestureModifier, 0);
}

@end
