@implementation SBFloatingDragAndDropGestureSwitcherModifier

- (SBFloatingDragAndDropGestureSwitcherModifier)initWithGestureID:(id)a3 floatingSwitcherVisible:(BOOL)a4 floatingConfiguration:(int64_t)a5 interfaceOrientation:(int64_t)a6
{
  SBFloatingDragAndDropGestureSwitcherModifier *result;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBFloatingDragAndDropGestureSwitcherModifier;
  result = -[SBGestureSwitcherModifier initWithGestureID:](&v10, sel_initWithGestureID_, a3);
  if (result)
  {
    result->_floatingSwitcherVisible = a4;
    result->_floatingConfiguration = a5;
    result->_interfaceOrientation = a6;
  }
  return result;
}

- (id)handleGestureEvent:(id)a3
{
  id v4;
  void *v5;
  id v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  double v13;
  SBUpdateLayoutSwitcherEventResponse *v14;
  uint64_t v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SBFloatingDragAndDropGestureSwitcherModifier;
  -[SBGestureSwitcherModifier handleGestureEvent:](&v17, sel_handleGestureEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "type") == 4)
  {
    v6 = v4;
    self->_currentDropAction = objc_msgSend(v6, "dropAction");
    objc_msgSend(v6, "locationInContainerView");
    self->_location.x = v7;
    self->_location.y = v8;
    objc_msgSend(v6, "platterViewFrame");
    self->_platterFrame.origin.x = v9;
    self->_platterFrame.origin.y = v10;
    self->_platterFrame.size.width = v11;
    self->_platterFrame.size.height = v12;
    objc_msgSend(v6, "platterScale");
    self->_platterScale = v13;
    if (objc_msgSend(v6, "phase") == 3 && objc_msgSend(v6, "isCanceled"))
    {
      v14 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 30, 3);
      +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v14, v5);
      v15 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v15;
    }

  }
  return v5;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "phase") >= 2)
    -[SBChainableModifier setState:](self, "setState:", 1);
  v7.receiver = self;
  v7.super_class = (Class)SBFloatingDragAndDropGestureSwitcherModifier;
  -[SBGestureSwitcherModifier handleTransitionEvent:](&v7, sel_handleTransitionEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (CGRect)frameForIndex:(unint64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v7;
  CGRect result;

  v7.receiver = self;
  v7.super_class = (Class)SBFloatingDragAndDropGestureSwitcherModifier;
  -[SBFloatingDragAndDropGestureSwitcherModifier frameForIndex:](&v7, sel_frameForIndex_, a3+ -[SBFloatingDragAndDropGestureSwitcherModifier _isPlatterPreviewIntersectingFloatingApplication](self, "_isPlatterPreviewIntersectingFloatingApplication"));
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (double)scaleForIndex:(unint64_t)a3
{
  double result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBFloatingDragAndDropGestureSwitcherModifier;
  -[SBFloatingDragAndDropGestureSwitcherModifier scaleForIndex:](&v4, sel_scaleForIndex_, a3+ -[SBFloatingDragAndDropGestureSwitcherModifier _isPlatterPreviewIntersectingFloatingApplication](self, "_isPlatterPreviewIntersectingFloatingApplication"));
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
  v9.super_class = (Class)SBFloatingDragAndDropGestureSwitcherModifier;
  -[SBGestureSwitcherModifier animationAttributesForLayoutElement:](&v9, sel_animationAttributesForLayoutElement_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "setUpdateMode:", 3);
  -[SBFloatingDragAndDropGestureSwitcherModifier medusaSettings](self, "medusaSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "resizeAnimationSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLayoutSettings:", v7);

  return v5;
}

- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  double v5;
  double v6;
  void *v7;
  double v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBFloatingDragAndDropGestureSwitcherModifier;
  -[SBFloatingDragAndDropGestureSwitcherModifier dimmingAlphaForLayoutRole:inAppLayout:](&v10, sel_dimmingAlphaForLayoutRole_inAppLayout_, a3, a4);
  v6 = v5;
  if (-[SBFloatingDragAndDropGestureSwitcherModifier _isPlatterPreviewIntersectingFloatingApplication](self, "_isPlatterPreviewIntersectingFloatingApplication"))
  {
    -[SBFloatingDragAndDropGestureSwitcherModifier medusaSettings](self, "medusaSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "replacementDimmingAlpha");
    v6 = v6 + v8;

  }
  return v6;
}

- (CGRect)containerViewBounds
{
  double v3;
  double v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  int64_t floatingConfiguration;
  double x;
  int64_t currentDropAction;
  double v19;
  int64_t v20;
  double v22;
  double v23;
  double v24;
  double v25;
  objc_super v26;
  CGRect v27;
  CGRect v28;
  CGRect result;

  v26.receiver = self;
  v26.super_class = (Class)SBFloatingDragAndDropGestureSwitcherModifier;
  -[SBFloatingDragAndDropGestureSwitcherModifier containerViewBounds](&v26, sel_containerViewBounds);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (-[SBFloatingDragAndDropGestureSwitcherModifier _isPlatterPreviewIntersectingFloatingApplication](self, "_isPlatterPreviewIntersectingFloatingApplication"))
  {
    v11 = 1.0;
    if (self->_floatingConfiguration == 2)
      v11 = -1.0;
    v4 = v4 + v11;
  }
  -[SBFloatingDragAndDropGestureSwitcherModifier medusaSettings](self, "medusaSettings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "draggingPlatterSideActivationGutterPadding");
  SBLayoutDefaultSideLayoutElementWidth();
  -[SBFloatingDragAndDropGestureSwitcherModifier screenScale](self, "screenScale");
  BSFloatRoundForScale();
  v14 = v13;
  floatingConfiguration = self->_floatingConfiguration;
  if (floatingConfiguration == 2)
  {
    x = self->_location.x;
    v27.origin.x = v4;
    v27.origin.y = v6;
    v27.size.width = v8;
    v27.size.height = v10;
    if (x > CGRectGetMidX(v27))
    {
      currentDropAction = self->_currentDropAction;
      if (currentDropAction == 5 || currentDropAction == 3)
        v4 = v4 - v14;
    }
    floatingConfiguration = self->_floatingConfiguration;
  }
  if (floatingConfiguration == 1)
  {
    v19 = self->_location.x;
    v28.origin.x = v4;
    v28.origin.y = v6;
    v28.size.width = v8;
    v28.size.height = v10;
    if (v19 < CGRectGetMidX(v28))
    {
      v20 = self->_currentDropAction;
      if (v20 == 4 || v20 == 2)
        v4 = v14 + v4;
    }
  }

  v22 = v4;
  v23 = v6;
  v24 = v8;
  v25 = v10;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (BOOL)_isPlatterPreviewIntersectingFloatingApplication
{
  objc_super v4;
  CGRect v5;

  if (self->_floatingSwitcherVisible || (self->_currentDropAction & 0xFFFFFFFFFFFFFFFELL) != 6)
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)SBFloatingDragAndDropGestureSwitcherModifier;
  -[SBFloatingDragAndDropGestureSwitcherModifier containerViewBounds](&v4, sel_containerViewBounds);
  return CGRectIntersectsRect(v5, self->_platterFrame);
}

@end
