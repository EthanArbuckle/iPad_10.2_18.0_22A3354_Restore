@implementation SBCardDragAndDropGestureSwitcherModifier

- (SBCardDragAndDropGestureSwitcherModifier)initWithGestureID:(id)a3
{
  id v5;
  SBCardDragAndDropGestureSwitcherModifier *v6;
  SBCardDragAndDropGestureSwitcherModifier *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBCardDragAndDropGestureSwitcherModifier;
  v6 = -[SBGestureSwitcherModifier initWithGestureID:](&v9, sel_initWithGestureID_, v5);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_gestureID, a3);

  return v7;
}

- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  SBAppLayout *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  SBAppLayout *v21;
  SBAppLayout *v22;
  int64_t v23;
  int64_t v24;
  uint64_t v26;
  BOOL v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  SBAppLayout *v33;
  unint64_t currentDropRegion;
  double v35;
  double v36;
  double v37;
  double v38;
  SBAppLayout *intersectingAppLayout;
  double v40;
  double v41;
  void *v42;
  unint64_t v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  objc_super v57;
  objc_super v58;
  objc_super v59;
  objc_super v60;
  objc_super v61;
  objc_super v62;
  _QWORD v63[2];
  _QWORD v64[4];
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v64[2] = *MEMORY[0x1E0C80C00];
  v12 = (SBAppLayout *)a4;
  v62.receiver = self;
  v62.super_class = (Class)SBCardDragAndDropGestureSwitcherModifier;
  -[SBCardDragAndDropGestureSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v62, sel_frameForLayoutRole_inAppLayout_withBounds_, a3, v12, x, y, width, height);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  -[SBAppLayout leafAppLayoutForRole:](v12, "leafAppLayoutForRole:", a3);
  v21 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (self->_currentDropRegion == 7 && v21 == self->_draggingLeafAppLayout
    || self->_isScrolling
    && !-[SBAppLayout isOrContainsAppLayout:](v12, "isOrContainsAppLayout:", self->_draggingAppLayout))
  {
    goto LABEL_36;
  }
  if (v22 == self->_draggingLeafAppLayout)
  {
    intersectingAppLayout = self->_intersectingAppLayout;
    if (intersectingAppLayout
      && !-[SBAppLayout isOrContainsAppLayout:](intersectingAppLayout, "isOrContainsAppLayout:", v22))
    {
      -[SBSwitcherDropRegionContext unscaledIntersectingAppLayoutSize](self->_dropRegionContext, "unscaledIntersectingAppLayoutSize");
      v18 = v40;
      v20 = v41;
    }
    goto LABEL_36;
  }
  if (-[SBAppLayout environment](v12, "environment") == 2)
    goto LABEL_36;
  v23 = -[SBAppLayout configuration](self->_draggingAppLayout, "configuration");
  v24 = -[SBAppLayout configuration](self->_intersectingAppLayout, "configuration");
  if (self->_draggingAppLayout != v12 || v23 < 2)
  {
    v26 = v24;
    if (-[SBAppLayout isOrContainsAppLayout:](self->_intersectingAppLayout, "isOrContainsAppLayout:", v22))
      v27 = v26 <= 1;
    else
      v27 = 0;
    if (!v27)
      goto LABEL_36;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v63[0] = v28;
    -[SBAppLayout itemForLayoutRole:](self->_draggingLeafAppLayout, "itemForLayoutRole:", 1);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v64[0] = v29;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v63[1] = v30;
    -[SBAppLayout itemForLayoutRole:](self->_intersectingLeafAppLayout, "itemForLayoutRole:", 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v64[1] = v31;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v64, v63, 2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = -[SBAppLayout initWithItemsForLayoutRoles:configuration:environment:preferredDisplayOrdinal:]([SBAppLayout alloc], "initWithItemsForLayoutRoles:configuration:environment:preferredDisplayOrdinal:", v32, 3, 1, -[SBCardDragAndDropGestureSwitcherModifier displayOrdinal](self, "displayOrdinal"));
    currentDropRegion = self->_currentDropRegion;
    if (currentDropRegion == 5)
    {
      -[SBCardDragAndDropGestureSwitcherModifier containerViewBounds](self, "containerViewBounds");
      v57.receiver = self;
      v57.super_class = (Class)SBCardDragAndDropGestureSwitcherModifier;
      -[SBCardDragAndDropGestureSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v57, sel_frameForLayoutRole_inAppLayout_withBounds_, 1, v33);
    }
    else
    {
      if (currentDropRegion != 4)
      {
LABEL_35:

        goto LABEL_36;
      }
      -[SBCardDragAndDropGestureSwitcherModifier containerViewBounds](self, "containerViewBounds");
      v58.receiver = self;
      v58.super_class = (Class)SBCardDragAndDropGestureSwitcherModifier;
      -[SBCardDragAndDropGestureSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v58, sel_frameForLayoutRole_inAppLayout_withBounds_, 2, v33);
    }
    v14 = v35;
    v16 = v36;
    v18 = v37;
    v20 = v38;
    goto LABEL_35;
  }
  if (v22 == self->_draggingLeafAppLayout)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBCardDragAndDropGestureSwitcherModifier.m"), 98, CFSTR("Shouldn't attempt to layout the dragging item."));

  }
  if (-[SBAppLayout isOrContainsAppLayout:](self->_intersectingAppLayout, "isOrContainsAppLayout:", v12))
  {
    -[SBSwitcherDropRegionContext finalTargetAppLayout](self->_dropRegionContext, "finalTargetAppLayout");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = self->_currentDropRegion;
    if (v43 == 5)
    {
      -[SBCardDragAndDropGestureSwitcherModifier containerViewBounds](self, "containerViewBounds");
      v60.receiver = self;
      v60.super_class = (Class)SBCardDragAndDropGestureSwitcherModifier;
      -[SBCardDragAndDropGestureSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v60, sel_frameForLayoutRole_inAppLayout_withBounds_, 1, v42);
    }
    else
    {
      if (v43 != 4)
      {
LABEL_32:

        goto LABEL_36;
      }
      -[SBCardDragAndDropGestureSwitcherModifier containerViewBounds](self, "containerViewBounds");
      v61.receiver = self;
      v61.super_class = (Class)SBCardDragAndDropGestureSwitcherModifier;
      -[SBCardDragAndDropGestureSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v61, sel_frameForLayoutRole_inAppLayout_withBounds_, 2, v42);
    }
    v14 = v44;
    v16 = v45;
    v18 = v46;
    v20 = v47;
    goto LABEL_32;
  }
  -[SBCardDragAndDropGestureSwitcherModifier containerViewBounds](self, "containerViewBounds");
  v59.receiver = self;
  v59.super_class = (Class)SBCardDragAndDropGestureSwitcherModifier;
  -[SBCardDragAndDropGestureSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](&v59, sel_frameForLayoutRole_inAppLayout_withBounds_, 1, v22);
  v14 = v48;
  v16 = v49;
  v18 = v50;
  v20 = v51;
LABEL_36:

  v52 = v14;
  v53 = v16;
  v54 = v18;
  v55 = v20;
  result.size.height = v55;
  result.size.width = v54;
  result.origin.y = v53;
  result.origin.x = v52;
  return result;
}

- (id)handleBlurProgressEvent:(id)a3
{
  id v4;
  SBUpdateLayoutSwitcherEventResponse *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v5 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 32, 2);
  v9.receiver = self;
  v9.super_class = (Class)SBCardDragAndDropGestureSwitcherModifier;
  -[SBSwitcherModifier handleBlurProgressEvent:](&v9, sel_handleBlurProgressEvent_, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)handleScrollEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBCardDragAndDropGestureSwitcherModifier;
  v4 = a3;
  -[SBSwitcherModifier handleScrollEvent:](&v8, sel_handleScrollEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "phase", v8.receiver, v8.super_class);

  self->_isScrolling = v6 == 0;
  return v5;
}

- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4
{
  SBAppLayout *v6;
  unsigned __int8 v7;
  void *v8;
  int v9;
  BOOL v11;
  BOOL v12;
  char v13;
  void *v14;
  objc_super v15;

  v6 = (SBAppLayout *)a4;
  v15.receiver = self;
  v15.super_class = (Class)SBCardDragAndDropGestureSwitcherModifier;
  v7 = -[SBCardDragAndDropGestureSwitcherModifier isLayoutRoleBlurred:inAppLayout:](&v15, sel_isLayoutRoleBlurred_inAppLayout_, a3, v6);
  -[SBAppLayout leafAppLayoutForRole:](v6, "leafAppLayoutForRole:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_isScrolling
    && !-[SBAppLayout isOrContainsAppLayout:](v6, "isOrContainsAppLayout:", self->_draggingAppLayout)
    || -[SBAppLayout isOrContainsAppLayout:](self->_draggingLeafAppLayout, "isOrContainsAppLayout:", v8)
    || -[SBAppLayout environment](self->_intersectingAppLayout, "environment") == 2)
  {
    LOBYTE(v9) = 0;
  }
  else if (self->_gestureEnded)
  {
    LOBYTE(v9) = v7;
  }
  else
  {
    v11 = -[SBAppLayout isSplitConfiguration](self->_draggingAppLayout, "isSplitConfiguration");
    v12 = -[SBAppLayout isSplitConfiguration](self->_intersectingAppLayout, "isSplitConfiguration");
    v9 = !-[SBAppLayout isOrContainsAppLayout:](self->_intersectingAppLayout, "isOrContainsAppLayout:", v8);
    if (self->_draggingAppLayout != v6 || !v11)
    {
      v13 = v9 | v12;
      LOBYTE(v9) = v7;
      if ((v13 & 1) == 0)
      {
        -[SBAppLayout itemForLayoutRole:](v6, "itemForLayoutRole:", a3);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (self->_currentDropRegion == 7)
          LOBYTE(v9) = 0;
        else
          LOBYTE(v9) = -[SBCardDragAndDropGestureSwitcherModifier displayItemSupportsMedusa:](self, "displayItemSupportsMedusa:", v14);

      }
    }
  }

  return v9;
}

- (unint64_t)blurTargetPreferenceForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 1;
}

- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  SBAppLayout *v6;
  double v7;
  double v8;
  SBAppLayout *v9;
  void *v10;
  double v11;
  objc_super v13;

  v6 = (SBAppLayout *)a4;
  v13.receiver = self;
  v13.super_class = (Class)SBCardDragAndDropGestureSwitcherModifier;
  -[SBCardDragAndDropGestureSwitcherModifier dimmingAlphaForLayoutRole:inAppLayout:](&v13, sel_dimmingAlphaForLayoutRole_inAppLayout_, a3, v6);
  v8 = v7;
  -[SBAppLayout leafAppLayoutForRole:](v6, "leafAppLayoutForRole:", a3);
  v9 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();
  if (self->_currentDropRegion != 7
    && self->_intersectingAppLayout == v6
    && -[SBAppLayout isSplitConfiguration](v6, "isSplitConfiguration")
    && !-[SBAppLayout isOrContainsAppLayout:](self->_intersectingAppLayout, "isOrContainsAppLayout:", self->_draggingLeafAppLayout)&& v9 != self->_draggingLeafAppLayout&& v9 == self->_intersectingLeafAppLayout)
  {
    -[SBCardDragAndDropGestureSwitcherModifier medusaSettings](self, "medusaSettings");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "defaultDimmingOpacity");
    v8 = v11;

  }
  return v8;
}

- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  BOOL v7;
  void *v8;
  objc_super v10;

  v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)SBCardDragAndDropGestureSwitcherModifier;
  v7 = -[SBCardDragAndDropGestureSwitcherModifier isLayoutRoleMatchMovedToScene:inAppLayout:](&v10, sel_isLayoutRoleMatchMovedToScene_inAppLayout_, a3, v6);
  objc_msgSend(v6, "leafAppLayoutForRole:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBAppLayout isOrContainsAppLayout:](self->_draggingAppLayout, "isOrContainsAppLayout:", v8)
    || -[SBAppLayout isOrContainsAppLayout:](self->_intersectingAppLayout, "isOrContainsAppLayout:", v6)
    || -[SBAppLayout isOrContainsAppLayout:](self->_previouslyIntersectingAppLayout, "isOrContainsAppLayout:", v6))
  {
    v7 = 1;
  }

  return v7;
}

- (BOOL)shouldUseNonuniformSnapshotScalingForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 1;
}

- (BOOL)shouldShowBackdropViewAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  BOOL v9;
  _BOOL4 v11;

  -[SBCardDragAndDropGestureSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!self->_gestureEnded && self->_intersectingAppLayout && objc_msgSend(v6, "isOrContainsAppLayout:"))
  {
    v11 = -[SBAppLayout isOrContainsAppLayout:](self->_intersectingAppLayout, "isOrContainsAppLayout:", self->_draggingLeafAppLayout);
    v7 = !v11 | -[SBAppLayout isSplitConfiguration](self->_draggingAppLayout, "isSplitConfiguration");
  }
  else
  {
    v7 = 0;
  }
  if ((objc_msgSend(v6, "isSplitConfiguration") & 1) == 0)
  {
    objc_msgSend(v6, "itemForLayoutRole:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 &= -[SBCardDragAndDropGestureSwitcherModifier displayItemSupportsMedusa:](self, "displayItemSupportsMedusa:", v8);

  }
  if ((self->_currentDropRegion & 0xFFFFFFFFFFFFFFFELL) == 6)
    v9 = 0;
  else
    v9 = v7;

  return v9;
}

- (BOOL)shouldAccessoryDrawShadowForAppLayout:(id)a3
{
  return 0;
}

- (BOOL)isLayoutRoleKillable:(int64_t)a3 inAppLayout:(id)a4 atIndex:(unint64_t)a5
{
  return 0;
}

- (BOOL)isLayoutRoleSelectable:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (BOOL)isLayoutRoleDraggable:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (id)visibleAppLayouts
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = objc_alloc(MEMORY[0x1E0C99E20]);
  v7.receiver = self;
  v7.super_class = (Class)SBCardDragAndDropGestureSwitcherModifier;
  -[SBCardDragAndDropGestureSwitcherModifier visibleAppLayouts](&v7, sel_visibleAppLayouts);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithSet:", v4);

  objc_msgSend(v5, "addObject:", self->_draggingAppLayout);
  return v5;
}

- (id)handleSwitcherDropEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBCardDragAndDropGestureSwitcherModifier;
  v4 = a3;
  -[SBSwitcherModifier handleSwitcherDropEvent:](&v8, sel_handleSwitcherDropEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "phase", v8.receiver, v8.super_class);

  if (v6 == 1)
    -[SBChainableModifier setState:](self, "setState:", 1);
  return v5;
}

- (id)handleSceneReadyEvent:(id)a3
{
  id v4;
  SBUpdateLayoutSwitcherEventResponse *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v5 = -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 32, 2);
  v9.receiver = self;
  v9.super_class = (Class)SBCardDragAndDropGestureSwitcherModifier;
  -[SBSwitcherModifier handleSceneReadyEvent:](&v9, sel_handleSceneReadyEvent_, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[SBChainableModifierEventResponse responseByAppendingResponse:toResponse:](SBSwitcherModifierEventResponse, "responseByAppendingResponse:toResponse:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)handleGestureEvent:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  SBSwitcherDropRegionContext *v10;
  SBSwitcherDropRegionContext *dropRegionContext;
  SBAppLayout *v12;
  SBAppLayout *draggingAppLayout;
  int64_t v14;
  SBAppLayout *v15;
  SBAppLayout *draggingLeafAppLayout;
  void *v17;
  SBAppLayout *intersectingAppLayout;
  SBAppLayout *v19;
  SBAppLayout *v20;
  int64_t v21;
  SBAppLayout *v22;
  SBAppLayout *intersectingLeafAppLayout;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  void *v29;
  objc_super v30;

  v5 = a3;
  v30.receiver = self;
  v30.super_class = (Class)SBCardDragAndDropGestureSwitcherModifier;
  -[SBGestureSwitcherModifier handleGestureEvent:](&v30, sel_handleGestureEvent_, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "gestureID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqual:", self->_gestureID);

  if ((v8 & 1) != 0)
  {
    v9 = v5;
    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBCardDragAndDropGestureSwitcherModifier.m"), 318, CFSTR("Found invalid modifier event."));

    }
    self->_gestureEnded = objc_msgSend(v9, "phase") == 3;
    objc_msgSend(v9, "switcherDropRegionContext");
    v10 = (SBSwitcherDropRegionContext *)objc_claimAutoreleasedReturnValue();
    dropRegionContext = self->_dropRegionContext;
    self->_dropRegionContext = v10;

    self->_currentDropRegion = -[SBSwitcherDropRegionContext currentDropRegion](self->_dropRegionContext, "currentDropRegion");
    objc_msgSend(v9, "selectedAppLayout");
    v12 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();
    draggingAppLayout = self->_draggingAppLayout;
    self->_draggingAppLayout = v12;

    v14 = objc_msgSend(v9, "draggedSceneLayoutRole");
    self->_draggingLayoutRole = v14;
    -[SBAppLayout leafAppLayoutForRole:](self->_draggingAppLayout, "leafAppLayoutForRole:", v14);
    v15 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();
    draggingLeafAppLayout = self->_draggingLeafAppLayout;
    self->_draggingLeafAppLayout = v15;

    -[SBSwitcherDropRegionContext intersectingAppLayout](self->_dropRegionContext, "intersectingAppLayout");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {

    }
    else
    {
      intersectingAppLayout = self->_intersectingAppLayout;
      if (intersectingAppLayout)
        objc_storeStrong((id *)&self->_previouslyIntersectingAppLayout, intersectingAppLayout);
    }
    -[SBSwitcherDropRegionContext intersectingAppLayout](self->_dropRegionContext, "intersectingAppLayout");
    v19 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();
    v20 = self->_intersectingAppLayout;
    self->_intersectingAppLayout = v19;

    v21 = -[SBSwitcherDropRegionContext intersectingLayoutRole](self->_dropRegionContext, "intersectingLayoutRole");
    self->_intersectingLayoutRole = v21;
    -[SBAppLayout leafAppLayoutForRole:](self->_intersectingAppLayout, "leafAppLayoutForRole:", v21);
    v22 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();
    intersectingLeafAppLayout = self->_intersectingLeafAppLayout;
    self->_intersectingLeafAppLayout = v22;

    objc_msgSend(v9, "translationInContainerView");
    self->_translation.x = v24;
    self->_translation.y = v25;
    objc_msgSend(v9, "locationInContainerView");
    self->_location.x = v26;
    self->_location.y = v27;

  }
  if (self->_gestureEnded && !self->_dropModifier)
    -[SBChainableModifier setState:](self, "setState:", 1);

  return v6;
}

- (CGRect)fullyPresentedFrameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  double v7;
  double v8;
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
  CGRect result;

  v6 = a4;
  -[SBCardDragAndDropGestureSwitcherModifier containerViewBounds](self, "containerViewBounds");
  -[SBCardDragAndDropGestureSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](self, "frameForLayoutRole:inAppLayout:withBounds:", a3, v6);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v15 = v8;
  v16 = v10;
  v17 = v12;
  v18 = v14;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (UIRectCornerRadii)cornerRadiiForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withCornerRadii:(UIRectCornerRadii)a5
{
  double topRight;
  double bottomRight;
  double bottomLeft;
  double topLeft;
  id v11;
  void *v12;
  void *v13;
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
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  objc_super v30;
  objc_super v31;
  UIRectCornerRadii result;

  topRight = a5.topRight;
  bottomRight = a5.bottomRight;
  bottomLeft = a5.bottomLeft;
  topLeft = a5.topLeft;
  v11 = a4;
  v12 = v11;
  if (self->_currentDropRegion != 7
    && ((objc_msgSend(v11, "isOrContainsAppLayout:", self->_intersectingAppLayout) & 1) != 0
     || objc_msgSend(v12, "isOrContainsAppLayout:", self->_draggingAppLayout)))
  {
    -[SBCardDragAndDropGestureSwitcherModifier appLayouts](self, "appLayouts");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v31.receiver = self;
    v31.super_class = (Class)SBCardDragAndDropGestureSwitcherModifier;
    -[SBCardDragAndDropGestureSwitcherModifier cornerRadiiForIndex:](&v31, sel_cornerRadiiForIndex_, objc_msgSend(v13, "indexOfObject:", v12));
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;

  }
  else
  {
    v30.receiver = self;
    v30.super_class = (Class)SBCardDragAndDropGestureSwitcherModifier;
    -[SBCardDragAndDropGestureSwitcherModifier cornerRadiiForLayoutRole:inAppLayout:withCornerRadii:](&v30, sel_cornerRadiiForLayoutRole_inAppLayout_withCornerRadii_, a3, v12, topLeft, bottomLeft, bottomRight, topRight);
    v15 = v22;
    v17 = v23;
    v19 = v24;
    v21 = v25;
  }

  v26 = v15;
  v27 = v17;
  v28 = v19;
  v29 = v21;
  result.topRight = v29;
  result.bottomRight = v28;
  result.bottomLeft = v27;
  result.topLeft = v26;
  return result;
}

- (double)titleAndIconOpacityForIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  double v7;
  void *v8;
  char v9;
  double v10;
  objc_super v12;

  -[SBCardDragAndDropGestureSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0.0;
  if ((objc_msgSend(v6, "isOrContainsAppLayout:", self->_draggingAppLayout) & 1) == 0)
  {
    if ((self->_currentDropRegion & 0xFFFFFFFFFFFFFFFELL) == 6
      || !objc_msgSend(v6, "isOrContainsAppLayout:", self->_intersectingAppLayout)
      || (-[SBAppLayout itemForLayoutRole:](self->_intersectingAppLayout, "itemForLayoutRole:", 1),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = -[SBCardDragAndDropGestureSwitcherModifier displayItemSupportsMedusa:](self, "displayItemSupportsMedusa:", v8), v8, (v9 & 1) == 0))
    {
      v12.receiver = self;
      v12.super_class = (Class)SBCardDragAndDropGestureSwitcherModifier;
      -[SBCardDragAndDropGestureSwitcherModifier titleAndIconOpacityForIndex:](&v12, sel_titleAndIconOpacityForIndex_, a3);
      v7 = v10;
    }
  }

  return v7;
}

- (BOOL)shouldScaleContentToFillBoundsAtIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[SBCardDragAndDropGestureSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = v7;
  if (self->_draggingAppLayout)
    objc_msgSend(v7, "addObject:");
  if (self->_intersectingAppLayout)
    objc_msgSend(v8, "addObject:");
  if (self->_previouslyIntersectingAppLayout)
    objc_msgSend(v8, "addObject:");
  -[SBSwitcherDropRegionContext remainingAppLayout](self->_dropRegionContext, "remainingAppLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[SBSwitcherDropRegionContext remainingAppLayout](self->_dropRegionContext, "remainingAppLayout");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v10);

  }
  -[SBSwitcherDropRegionContext evictedAppLayout](self->_dropRegionContext, "evictedAppLayout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[SBSwitcherDropRegionContext evictedAppLayout](self->_dropRegionContext, "evictedAppLayout");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObject:", v12);

  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v13 = v8;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v19;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v13);
        if ((objc_msgSend(v6, "isOrContainsAppLayout:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i), (_QWORD)v18) & 1) != 0)
        {
          LOBYTE(v14) = 1;
          goto LABEL_21;
        }
      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v14)
        continue;
      break;
    }
  }
LABEL_21:

  return v14;
}

- (id)animationAttributesForLayoutElement:(id)a3
{
  SBAppLayout *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;
  CAFrameRateRange v12;

  v4 = (SBAppLayout *)a3;
  v11.receiver = self;
  v11.super_class = (Class)SBCardDragAndDropGestureSwitcherModifier;
  -[SBGestureSwitcherModifier animationAttributesForLayoutElement:](&v11, sel_animationAttributesForLayoutElement_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  -[SBCardDragAndDropGestureSwitcherModifier medusaSettings](self, "medusaSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "resizeAnimationSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setLayoutSettings:", v8);
  objc_msgSend(v6, "setPositionSettings:", v8);
  objc_msgSend(v6, "setScaleSettings:", v8);
  objc_msgSend(v6, "setCornerRadiusSettings:", v8);
  objc_msgSend(v6, "setUpdateMode:", 3);
  if (self->_isScrolling
    && self->_intersectingAppLayout == v4
    && -[SBAppLayout isOrContainsAppLayout:](self->_draggingAppLayout, "isOrContainsAppLayout:", v4))
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9E08]), "initWithDefaultValues");
    objc_msgSend(v8, "response");
    objc_msgSend(v9, "setResponse:");
    objc_msgSend(v9, "setDampingRatio:", 1.0);
    v12 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
    objc_msgSend(v9, "setFrameRateRange:highFrameRateReason:", 1114113, *(double *)&v12.minimum, *(double *)&v12.maximum, *(double *)&v12.preferred);
    objc_msgSend(v6, "setLayoutSettings:", v9);
    objc_msgSend(v6, "setPositionSettings:", v9);
    objc_msgSend(v6, "setScaleSettings:", v9);
    objc_msgSend(v6, "setPositionUpdateMode:", 3);
    objc_msgSend(v6, "setLayoutUpdateMode:", 3);
    objc_msgSend(v6, "setOpacityUpdateMode:", 3);
    objc_msgSend(v6, "setScaleUpdateMode:", 3);
    objc_msgSend(v6, "setCornerRadiusUpdateMode:", 3);
    objc_msgSend(v6, "setTitleAndIconOpacityUpdateMode:", 3);

  }
  return v6;
}

- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3
{
  void *v5;
  SBAppLayout *v6;
  BOOL v7;
  objc_super v9;

  -[SBCardDragAndDropGestureSwitcherModifier appLayouts](self, "appLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v6 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();

  if (v6 == self->_draggingAppLayout || v6 == self->_intersectingAppLayout)
  {
    v7 = 0;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBCardDragAndDropGestureSwitcherModifier;
    v7 = -[SBCardDragAndDropGestureSwitcherModifier shouldUseAnchorPointToPinLayoutRolesToSpace:](&v9, sel_shouldUseAnchorPointToPinLayoutRolesToSpace_, a3);
  }

  return v7;
}

- (BOOL)isHitTestBlockingViewVisible
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dropModifier, 0);
  objc_storeStrong((id *)&self->_dropRegionContext, 0);
  objc_storeStrong((id *)&self->_gestureID, 0);
  objc_storeStrong((id *)&self->_previouslyIntersectingAppLayout, 0);
  objc_storeStrong((id *)&self->_intersectingLeafAppLayout, 0);
  objc_storeStrong((id *)&self->_intersectingAppLayout, 0);
  objc_storeStrong((id *)&self->_draggingLeafAppLayout, 0);
  objc_storeStrong((id *)&self->_draggingAppLayout, 0);
}

@end
