@implementation SBDefaultImplementationsSwitcherModifier

void __95__SBDefaultImplementationsSwitcherModifier_multipleWindowsIndicatorLayoutRoleMaskForAppLayout___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "itemForLayoutRole:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6
    && objc_msgSend(*(id *)(a1 + 40), "displayItemSupportsMultipleWindowsIndicator:", v6)
    && objc_msgSend(*(id *)(a1 + 40), "numberOfVisibleAppLayoutsForBundleIdentifier:", v4) >= 2)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = SBLayoutRoleMaskForRole(a2) | v5;
  }

}

- (id)resizeGrabberLayoutAttributesForAppLayout:(id)a3
{
  id v4;
  int v5;
  uint64_t *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  v5 = -[SBDefaultImplementationsSwitcherModifier isRTLEnabled](self, "isRTLEnabled");
  v6 = &SBLayoutRoleSide;
  if (!v5)
    v6 = &SBLayoutRolePrimary;
  v7 = *v6;
  -[SBDefaultImplementationsSwitcherModifier appLayoutContainingAppLayout:](self, "appLayoutContainingAppLayout:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "leafAppLayoutForRole:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[SBSwitcherResizeGrabberLayoutAttributes attributesWithLeafAppLayout:edge:](SBSwitcherResizeGrabberLayoutAttributes, "attributesWithLeafAppLayout:edge:", v9, 8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (CGRect)rootContentViewMaskRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D628];
  v3 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)wantsSpaceAccessoryViewPointerInteractionsForAppLayout:(id)a3
{
  return 0;
}

- (double)spaceAccessoryViewIconHitTestOutsetForAppLayout:(id)a3
{
  void *v3;
  double v4;
  double v5;

  -[SBDefaultImplementationsSwitcherModifier medusaSettings](self, "medusaSettings", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "switcherShelfIconHitTestInset");
  v5 = v4;

  return v5;
}

- (double)dimmingAlphaForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  void *v5;
  double v6;
  double v7;

  if (!-[SBDefaultImplementationsSwitcherModifier _isLayoutRoleBehindCenterWindow:inAppLayout:](self, "_isLayoutRoleBehindCenterWindow:inAppLayout:", a3, a4))return 0.0;
  -[SBDefaultImplementationsSwitcherModifier medusaSettings](self, "medusaSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "defaultDimmingOpacity");
  v7 = v6;

  return v7;
}

- (BOOL)_isLayoutRoleBehindCenterWindow:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  int64_t v10;
  void *v11;
  void *v12;
  _BOOL4 IsValidForSplitView;
  BOOL v14;
  BOOL v15;

  v6 = a4;
  -[SBDefaultImplementationsSwitcherModifier appLayoutContainingAppLayout:](self, "appLayoutContainingAppLayout:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7 != v6)
  {
    objc_msgSend(v6, "allItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

    if (v9 == 1)
      v10 = 1;
    else
      v10 = a3;
    objc_msgSend(v6, "itemForLayoutRole:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    a3 = objc_msgSend(v7, "layoutRoleForItem:", v11);

  }
  objc_msgSend(v7, "itemForLayoutRole:", 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  IsValidForSplitView = SBLayoutRoleIsValidForSplitView(a3);
  if (v12)
    v14 = !IsValidForSplitView;
  else
    v14 = 1;
  v15 = !v14 && objc_msgSend(v6, "environment") == 1;

  return v15;
}

- (BOOL)shouldSuppressHighlightEffectForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (CGRect)frameForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withBounds:(CGRect)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  unint64_t v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  uint64_t v54;
  double v55;
  CGRect result;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v11 = a4;
  -[SBDefaultImplementationsSwitcherModifier screenScale](self, "screenScale");
  if (objc_msgSend(v11, "environment") != 3 && objc_msgSend(v11, "environment") != 2)
  {
    if (-[SBDefaultImplementationsSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled"))
    {
      if (a3 == 4)
      {
        -[SBDefaultImplementationsSwitcherModifier displayItemLayoutAttributesCalculator](self, "displayItemLayoutAttributesCalculator");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[SBDefaultImplementationsSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation");
        -[SBDefaultImplementationsSwitcherModifier containerViewBounds](self, "containerViewBounds");
        objc_msgSend(v12, "frameForCenterItemWithConfiguration:interfaceOrientation:bounds:", 1, v13);

        UIRectGetCenter();
        UIRectCenteredAboutPoint();
        x = v14;
        y = v15;
        width = v16;
        height = v17;
        goto LABEL_17;
      }
      -[SBSwitcherModifier autoLayoutSpaceForAppLayout:](self, "autoLayoutSpaceForAppLayout:", v11);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "itemForLayoutRole:", a3);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "autoLayoutItemForDisplayItem:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "position");
      if (objc_msgSend(v31, "isFullyOccluded"))
        objc_msgSend(v31, "unoccludedPeekingPosition");
      objc_msgSend(v31, "size");
      v33 = v32;
      v55 = v34;
      SBRectWithSize();
      UIRectCenteredAboutPoint();
      v36 = v35;
      v38 = v37;
      width = v39;
      height = v40;
      objc_msgSend(v18, "boundingBox");
      v42 = v36 - v41;
      objc_msgSend(v18, "boundingBox");
      x = x + v42;
      y = y + v38 - v43;
      -[SBDefaultImplementationsSwitcherModifier appLayoutContainingAppLayout:](self, "appLayoutContainingAppLayout:", v11);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "allItems");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      v46 = objc_msgSend(v45, "count");

      if (v46 >= 2)
      {
        -[SBDefaultImplementationsSwitcherModifier chamoisLayoutAttributes](self, "chamoisLayoutAttributes");
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v31, "isFullyOccluded") & 1) == 0)
        {
          objc_msgSend(v31, "anchorPosition");
          if (objc_msgSend(v31, "isOverlapped"))
            objc_msgSend(v47, "partiallyOccludedStageScaleForItemWithSize:", v55, v33, 1.0);
          UIRoundToScale();
          x = x - v48;
          UIRoundToScale();
          y = y - v49;
        }

      }
    }
    else
    {
      -[SBDefaultImplementationsSwitcherModifier displayItemLayoutAttributesCalculator](self, "displayItemLayoutAttributesCalculator");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[SBDefaultImplementationsSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation");
      -[SBDefaultImplementationsSwitcherModifier chamoisLayoutAttributes](self, "chamoisLayoutAttributes");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBDefaultImplementationsSwitcherModifier floatingDockHeight](self, "floatingDockHeight");
      v22 = v21;
      -[SBDefaultImplementationsSwitcherModifier screenScale](self, "screenScale");
      v24 = v23;
      v25 = -[SBDefaultImplementationsSwitcherModifier prefersStripHidden](self, "prefersStripHidden");
      LOBYTE(v54) = -[SBDefaultImplementationsSwitcherModifier prefersDockHidden](self, "prefersDockHidden");
      objc_msgSend(v18, "frameForLayoutRole:inAppLayout:containerBounds:containerOrientation:chamoisLayoutAttributes:floatingDockHeight:screenScale:isChamoisWindowingUIEnabled:prefersStripHidden:prefersDockHidden:", a3, v11, v19, v20, 0, v25, x, y, width, height, v22, v24, v54);
      x = v26;
      y = v27;
      width = v28;
      height = v29;

    }
  }
LABEL_17:

  v50 = x;
  v51 = y;
  v52 = width;
  v53 = height;
  result.size.height = v53;
  result.size.width = v52;
  result.origin.y = v51;
  result.origin.x = v50;
  return result;
}

- (BOOL)switcherHitTestsAsOpaque
{
  return 0;
}

- (BOOL)systemApertureRequiresHeavyShadowForTransition
{
  return 0;
}

- (double)rootContentViewBlurRadius
{
  return 0.0;
}

- (BOOL)shouldUseWallpaperGradientTreatment
{
  return 0;
}

- (unint64_t)hiddenContainerStatusBarParts
{
  return 0;
}

- (BOOL)wantsSceneResizesHostedContextForAppLayout:(id)a3
{
  return 0;
}

- (BOOL)isLayoutRoleMatchMovedToScene:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (BOOL)shouldScaleContentToFillBoundsAtIndex:(unint64_t)a3
{
  return 0;
}

- (id)meshTransformForIndex:(unint64_t)a3
{
  return 0;
}

- (unint64_t)footerViewIconAlignmentForAppLayout:(id)a3
{
  return 0;
}

- (CGPoint)contentViewOffsetForAccessoriesOfAppLayout:(id)a3
{
  double v3;
  double v4;
  CGPoint result;

  v3 = *MEMORY[0x1E0C9D538];
  v4 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  result.y = v4;
  result.x = v3;
  return result;
}

- (BOOL)clipsToBoundsAtIndex:(unint64_t)a3
{
  return 0;
}

- (unint64_t)multipleWindowsIndicatorLayoutRoleMaskForAppLayout:(id)a3
{
  id v4;
  unint64_t v5;
  _QWORD v7[4];
  id v8;
  SBDefaultImplementationsSwitcherModifier *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  if (objc_msgSend(v4, "environment") == 1)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __95__SBDefaultImplementationsSwitcherModifier_multipleWindowsIndicatorLayoutRoleMaskForAppLayout___block_invoke;
    v7[3] = &unk_1E8EB1B58;
    v8 = v4;
    v9 = self;
    v10 = &v11;
    SBLayoutRoleEnumerateValidRoles(v7);

  }
  v5 = v12[3];
  _Block_object_dispose(&v11, 8);

  return v5;
}

- (BOOL)shouldTetherItemsAndAccessoriesInAppLayout:(id)a3
{
  return 0;
}

- (double)scaleForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  id v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;

  v6 = a4;
  v7 = 1.0;
  if (-[SBDefaultImplementationsSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled"))
  {
    -[SBDefaultImplementationsSwitcherModifier appLayoutContainingAppLayout:](self, "appLayoutContainingAppLayout:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "itemForLayoutRole:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "layoutRoleForItem:", v9);

    -[SBSwitcherModifier autoLayoutSpaceForAppLayout:](self, "autoLayoutSpaceForAppLayout:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBDefaultImplementationsSwitcherModifier chamoisLayoutAttributes](self, "chamoisLayoutAttributes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "itemForLayoutRole:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "autoLayoutItemForDisplayItem:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "isFullyOccluded"))
    {
      objc_msgSend(v12, "stageOcclusionDodgingPeekScale");
    }
    else
    {
      if (!objc_msgSend(v14, "isOverlapped"))
      {
LABEL_7:

        goto LABEL_8;
      }
      objc_msgSend(v14, "size");
      objc_msgSend(v12, "partiallyOccludedStageScaleForItemWithSize:");
    }
    v7 = v15;
    goto LABEL_7;
  }
LABEL_8:

  return v7;
}

- (unint64_t)maskedCornersForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withMaskedCorners:(unint64_t)a5
{
  id v8;
  void *v9;
  char v10;
  uint64_t v11;

  v8 = a4;
  if (a3 != 4)
  {
    if ((-[SBDefaultImplementationsSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled") & 1) != 0)
      goto LABEL_14;
    if (a3 == 1)
    {
      objc_msgSend(v8, "itemForLayoutRole:", 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
        goto LABEL_14;
      if (!-[SBDefaultImplementationsSwitcherModifier isRTLEnabled](self, "isRTLEnabled"))
        goto LABEL_11;
      v10 = 0;
    }
    else
    {
      v10 = -[SBDefaultImplementationsSwitcherModifier isRTLEnabled](self, "isRTLEnabled") ^ 1;
    }
    if (a3 != 2 || (v10 & 1) != 0)
    {
      v11 = 5;
      goto LABEL_13;
    }
LABEL_11:
    v11 = 10;
LABEL_13:
    a5 |= v11;
    goto LABEL_14;
  }
  a5 = 15;
LABEL_14:

  return a5;
}

- (BOOL)isLayoutRoleBlurred:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (UIRectCornerRadii)cornerRadiiForLayoutRole:(int64_t)a3 inAppLayout:(id)a4 withCornerRadii:(UIRectCornerRadii)a5
{
  double topRight;
  double bottomRight;
  double bottomLeft;
  double topLeft;
  id v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  int v19;
  double v20;
  char v22;
  double v23;
  double v24;
  double v25;
  double v26;
  UIRectCornerRadii result;

  topRight = a5.topRight;
  bottomRight = a5.bottomRight;
  bottomLeft = a5.bottomLeft;
  topLeft = a5.topLeft;
  v11 = a4;
  if (a3 == 4)
  {
    -[SBDefaultImplementationsSwitcherModifier displayCornerRadius](self, "displayCornerRadius");
    if (BSFloatIsZero())
    {
      -[SBDefaultImplementationsSwitcherModifier switcherSettings](self, "switcherSettings");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "gridSwitcherHomeButtonDeviceCardCornerRadius");

    }
    SBRectCornerRadiiForRadius();
    topLeft = v13;
    v15 = v14;
    bottomRight = v16;
    topRight = v17;
  }
  else
  {
    if ((-[SBDefaultImplementationsSwitcherModifier isChamoisWindowingUIEnabled](self, "isChamoisWindowingUIEnabled") & 1) == 0)
    {
      if (a3 != 1
        || (objc_msgSend(v11, "itemForLayoutRole:", 2),
            v18 = (void *)objc_claimAutoreleasedReturnValue(),
            v18,
            v18))
      {
        v19 = -[SBDefaultImplementationsSwitcherModifier isRTLEnabled](self, "isRTLEnabled");
        -[SBDefaultImplementationsSwitcherModifier splitViewInnerCornerRadius](self, "splitViewInnerCornerRadius");
        v15 = v20;
        if (a3 != 1 || v19 != 0)
        {
          v22 = a3 == 2 ? v19 : 0;
          if ((v22 & 1) == 0)
          {
            topLeft = v20;
            goto LABEL_18;
          }
        }
        topRight = v20;
        bottomRight = v20;
      }
    }
    v15 = bottomLeft;
  }
LABEL_18:

  v23 = topLeft;
  v24 = v15;
  v25 = bottomRight;
  v26 = topRight;
  result.topRight = v26;
  result.bottomRight = v25;
  result.bottomLeft = v24;
  result.topLeft = v23;
  return result;
}

- (CGPoint)contentViewOffsetForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  double v4;
  double v5;
  CGPoint result;

  v4 = *MEMORY[0x1E0C9D538];
  v5 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  result.y = v5;
  result.x = v4;
  return result;
}

- (BOOL)canLayoutRoleParticipateInSwitcherDragAndDrop:(int64_t)a3 appLayout:(id)a4
{
  return 0;
}

- (unint64_t)blurTargetPreferenceForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (double)blurDelayForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 0.0;
}

- (id)resizeProgressNotificationsForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set", a3, a4);
}

- (id)repositionProgressNotificationsForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set", a3, a4);
}

- (id)topMostLayoutRolesForAppLayout:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v3, "zOrderedItems", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = objc_msgSend(v3, "layoutRoleForItem:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v9));
        if (v10 != 4)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v11);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  objc_msgSend(v3, "itemForLayoutRole:", 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", 4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "insertObject:atIndex:", v13, 0);

  }
  return v4;
}

- (id)animatablePropertyIdentifiers
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (id)preferredAppLayoutToReuseAccessoryForAppLayout:(id)a3 fromAppLayouts:(id)a4
{
  return (id)objc_msgSend(a4, "firstObject", a3);
}

- (unint64_t)hiddenContentStatusBarPartsForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  return 0;
}

- (unint64_t)bounceIconGenerationCountForCurrentCount:(unint64_t)a3
{
  return a3;
}

- (CGPoint)anchorPointForIndex:(unint64_t)a3
{
  double v3;
  double v4;
  CGPoint result;

  v3 = 0.5;
  v4 = 0.5;
  result.y = v4;
  result.x = v3;
  return result;
}

- (BOOL)shouldUseAnchorPointToPinLayoutRolesToSpace:(unint64_t)a3
{
  return 1;
}

- (BOOL)shouldPinLayoutRolesToSpace:(unint64_t)a3
{
  return 1;
}

- (double)perspectiveAngleForAppLayout:(id)a3
{
  return 0.0;
}

- (BOOL)shouldShowBackdropViewAtIndex:(unint64_t)a3
{
  return 0;
}

- (BOOL)shouldUseNonuniformSnapshotScalingForLayoutRole:(int64_t)a3 inAppLayout:(id)a4
{
  void *v5;

  objc_msgSend(a4, "itemForLayoutRole:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[SBDefaultImplementationsSwitcherModifier displayItemIsClassic:](self, "displayItemIsClassic:", v5);

  return (char)self;
}

- (unint64_t)maskedCornersForIndex:(unint64_t)a3
{
  return 15;
}

- (BOOL)canFocusableAppLayoutBeEffectivelyObscured:(id)a3
{
  return 0;
}

- (SBSwitcherShelfPresentationAttributes)presentationAttributesForShelf:(SEL)a3
{
  return (SBSwitcherShelfPresentationAttributes *)SBSwitcherShelfPresentationAttributesMake(0, 0, 0, (uint64_t)retstr, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
}

- (id)hiddenAppLayoutsInShelf:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set", a3);
}

- (id)focusedAppLayoutForShelf:(id)a3
{
  return 0;
}

- (id)ignoredDisplayItemsForShelf:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set", a3);
}

- (id)switcherDropRegionContextForDraggingLayoutRole:(int64_t)a3 inAppLayout:(id)a4 atLocation:(CGPoint)a5
{
  return 0;
}

- (int64_t)updateModeForAnimatableProperty:(id)a3
{
  return 1;
}

- (id)settingsForAnimatableProperty:(id)a3
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9E08]), "initWithDefaultValues");
}

- (BOOL)shouldUpdateAnimatableProperty:(id)a3
{
  return 1;
}

- (id)bounceIconBundleIdentifier
{
  return 0;
}

- (CGRect)bounceIconInitialFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x1E0C9D628];
  v3 = *(double *)(MEMORY[0x1E0C9D628] + 8);
  v4 = *(double *)(MEMORY[0x1E0C9D628] + 16);
  v5 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (id)homeAffordanceLayoutElementToPortalIntoShelf:(id)a3
{
  return 0;
}

- (id)systemApertureTransitioningAppLayouts
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (CGPoint)expandedSourcePositionForSystemApertureTransition
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (id)identityMeshTransformForIndex:(unint64_t)a3
{
  _OWORD v10[2];
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  __int128 v41;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v11 = 0;
  memset(v10, 0, sizeof(v10));
  v12 = xmmword_1D0E89170;
  v14 = 0;
  v15 = 0;
  v13 = 0x3FE0000000000000;
  v16 = xmmword_1D0E891A0;
  v17 = 0x3FF0000000000000;
  v18 = 0;
  v19 = 0;
  v20 = 0;
  v21 = xmmword_1D0E89170;
  v22 = xmmword_1D0E89170;
  __asm { FMOV            V0.2D, #0.5 }
  v23 = _Q0;
  v24 = _Q0;
  v25 = xmmword_1D0E89150;
  v26 = xmmword_1D0E89180;
  v28 = 0;
  v29 = 0;
  v27 = 0x3FE0000000000000;
  v30 = xmmword_1D0E891A0;
  v31 = 0x3FF0000000000000;
  v32 = xmmword_1D0E89140;
  v33 = xmmword_1D0E891B0;
  __asm { FMOV            V0.2D, #1.0 }
  v34 = xmmword_1D0E891A0;
  v35 = _Q0;
  v36 = _Q0;
  v37 = 0;
  v38 = xmmword_1D0E891D0;
  v39 = 0;
  v40 = 0;
  v41 = xmmword_1D0E891E0;
  v42 = 0;
  v43 = 0;
  v44 = xmmword_1D0E891F0;
  v45 = 0;
  v46 = 0;
  v47 = xmmword_1D0E89200;
  v48 = 0;
  v49 = 0;
  objc_msgSend(MEMORY[0x1E0CD27D8], "meshTransformWithVertexCount:vertices:faceCount:faces:depthNormalization:", 9, v10, 4, &v38, *MEMORY[0x1E0CD2A90]);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)isDropletEffectRequiredBehindAppLayout:(id)a3
{
  return 0;
}

- (BOOL)shouldContentViewBlockTouches
{
  return 0;
}

- (BOOL)wantsContinuousExposeHoverGesture
{
  return 0;
}

- (BOOL)isContinuousExposeStripVisible
{
  -[SBDefaultImplementationsSwitcherModifier continuousExposeStripProgress](self, "continuousExposeStripProgress");
  return BSFloatGreaterThanFloat();
}

- (id)proposedAppLayoutForWindowDrag
{
  return 0;
}

- (BOOL)wantsBezelEffectsLayoutElement
{
  return 0;
}

- (BOOL)isHitTestBlockingViewVisible
{
  return 0;
}

@end
