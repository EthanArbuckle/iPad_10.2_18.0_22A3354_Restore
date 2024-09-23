@implementation SBShelfSwitcherModifier

+ (unint64_t)contentOptionsForTransitionEvent:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  _BOOL4 v42;
  int v43;
  int v44;
  id v46;
  id v47;
  int v48;
  _BOOL4 v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v49 = objc_msgSend(v5, "fromEnvironmentMode") == 3;
  v50 = objc_msgSend(v5, "toEnvironmentMode");
  objc_msgSend(v5, "fromAppLayout");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "toAppLayout");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v5, "isQuickActionTransition");
  v7 = objc_msgSend(v5, "fromWindowPickerRole");
  if (v7 != objc_msgSend(v5, "toWindowPickerRole") && objc_msgSend(v5, "toWindowPickerRole"))
  {
    if (objc_msgSend(v5, "toWindowPickerRole") == 3)
    {
      objc_msgSend(v5, "toFloatingAppLayout");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      v24 = 1;
    }
    else
    {
      objc_msgSend(v5, "toAppLayout");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v5, "toWindowPickerRole");
      v22 = v23;
    }
    objc_msgSend(v22, "itemForLayoutRole:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "bundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v5, "isExitingSplitViewPeekEvent"))
    {

      v52 = 0;
      v49 = 0;
    }
    if (!v13)
      goto LABEL_62;
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    objc_msgSend(v6, "appLayouts");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
    if (v26)
    {
      v27 = v26;
      v46 = v6;
      v47 = v5;
      v28 = 0;
      v29 = *(_QWORD *)v61;
      v53 = *(_QWORD *)v61;
      v54 = v14;
LABEL_28:
      v30 = 0;
      v55 = v27;
      while (1)
      {
        if (*(_QWORD *)v61 != v29)
          objc_enumerationMutation(v14);
        v31 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v30);
        if (objc_msgSend(v31, "environment") != 3
          && objc_msgSend(v31, "containsItemWithBundleIdentifier:", v13))
        {
          v58 = 0u;
          v59 = 0u;
          v56 = 0u;
          v57 = 0u;
          objc_msgSend(v31, "allItems");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
          if (v33)
          {
            v34 = v33;
            v35 = 0;
            v36 = *(_QWORD *)v57;
            do
            {
              for (i = 0; i != v34; ++i)
              {
                if (*(_QWORD *)v57 != v36)
                  objc_enumerationMutation(v32);
                objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * i), "bundleIdentifier");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                v39 = BSEqualStrings();

                v35 += v39;
              }
              v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v56, v68, 16);
            }
            while (v34);
          }
          else
          {
            v35 = 0;
          }

          v28 += v35;
          v29 = v53;
          v14 = v54;
          v27 = v55;
          if (v28 > 1)
            break;
        }
        if (++v30 == v27)
        {
          v27 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v60, v69, 16);
          if (v27)
            goto LABEL_28;
          break;
        }
      }
      v6 = v46;
      v5 = v47;
    }
LABEL_46:

    v40 = 5;
    if (v50 == 3)
      v41 = 7;
    else
      v41 = 5;
    v42 = v50 == 3 && v49;
    if (!v49)
      v40 = v41;
    v43 = !v42;
    v44 = v48;
    if (v52 == v51)
    {
      v44 = 1;
      v43 = 1;
    }
    if ((v42 & v44) != 0)
      v40 = 7;
    if (v43)
      v11 = v40;
    else
      v11 = 7;

    goto LABEL_63;
  }
  objc_msgSend(v5, "fromAppExposeBundleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "toAppExposeBundleID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (BSEqualStrings())
  {

LABEL_62:
    v11 = 0;
    goto LABEL_63;
  }
  objc_msgSend(v5, "toAppExposeBundleID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0;
  if (v10 && v50 == 3)
  {
    objc_msgSend(v5, "toAppExposeBundleID");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
      goto LABEL_62;
    v13 = (void *)v12;
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    objc_msgSend(v6, "appLayouts");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
    if (v15)
    {
      v16 = v15;
      v17 = v6;
      v18 = 0;
      v19 = *(_QWORD *)v65;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v65 != v19)
            objc_enumerationMutation(v14);
          v21 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * j);
          if (objc_msgSend(v21, "environment") != 3
            && objc_msgSend(v21, "containsItemWithBundleIdentifier:", v13))
          {
            if (v18 == 1)
              goto LABEL_19;
            v18 = 1;
          }
        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v64, v70, 16);
      }
      while (v16);
LABEL_19:
      v6 = v17;
    }
    goto LABEL_46;
  }
LABEL_63:

  return v11;
}

- (SBShelfSwitcherModifier)initWithShelf:(id)a3 contentOptions:(unint64_t)a4 activeFullScreenAppLayout:(id)a5 activeFloatingAppLayout:(id)a6 presentationTargetFrame:(CGRect)a7 presentedFromAppLayout:(id)a8
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v18;
  id v19;
  id v20;
  id v21;
  SBShelfSwitcherModifier *v22;
  SBShelfSwitcherModifier *v23;
  objc_super v25;

  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v18 = a3;
  v19 = a5;
  v20 = a6;
  v21 = a8;
  v25.receiver = self;
  v25.super_class = (Class)SBShelfSwitcherModifier;
  v22 = -[SBSwitcherModifier init](&v25, sel_init);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_shelf, a3);
    v23->_layoutRole = objc_msgSend(v18, "layoutRole");
    v23->_contentOptions = a4;
    objc_storeStrong((id *)&v23->_activeFullScreenAppLayout, a5);
    objc_storeStrong((id *)&v23->_activeFloatingAppLayout, a6);
    v23->_presentationTargetFrame.origin.x = x;
    v23->_presentationTargetFrame.origin.y = y;
    v23->_presentationTargetFrame.size.width = width;
    v23->_presentationTargetFrame.size.height = height;
    objc_storeStrong((id *)&v23->_presentedFromAppLayout, a8);
  }

  return v23;
}

- (id)visibleShelves
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", self->_shelf);
}

- (SBSwitcherShelfPresentationAttributes)presentationAttributesForShelf:(SEL)a3
{
  id v6;
  _BOOL4 isPendingDismissal;
  BOOL IsNull;
  uint64_t v9;
  SBAppLayout *presentedFromAppLayout;
  void *v11;
  _BOOL4 v12;
  SBSwitcherShelfPresentationAttributes *result;
  objc_super v14;

  v6 = a4;
  if (-[SBSwitcherShelf isEqual:](self->_shelf, "isEqual:", v6))
  {
    isPendingDismissal = self->_isPendingDismissal;
    IsNull = CGRectIsNull(self->_presentationTargetFrame);
    if (isPendingDismissal)
    {
      if (!IsNull
        && !self->_isPendingDismissalFromGesture
        && self->_activeFullScreenAppLayout
        && (-[SBShelfSwitcherModifier isFloatingDockFullyPresented](self, "isFloatingDockFullyPresented") & 1) == 0)
      {
        v9 = 1;
LABEL_13:
        SBSwitcherShelfPresentationAttributesMake(!isPendingDismissal, v9, self->_contentOptions, (uint64_t)retstr, self->_presentationTargetFrame.origin.x, self->_presentationTargetFrame.origin.y, self->_presentationTargetFrame.size.width, self->_presentationTargetFrame.size.height);
        goto LABEL_14;
      }
    }
    else if (!IsNull)
    {
      presentedFromAppLayout = self->_presentedFromAppLayout;
      if (presentedFromAppLayout)
      {
        -[SBSwitcherShelf bundleIdentifier](self->_shelf, "bundleIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[SBAppLayout containsItemWithBundleIdentifier:](presentedFromAppLayout, "containsItemWithBundleIdentifier:", v11);

        v9 = v12;
        goto LABEL_13;
      }
    }
    v9 = 0;
    goto LABEL_13;
  }
  v14.receiver = self;
  v14.super_class = (Class)SBShelfSwitcherModifier;
  -[SBSwitcherShelfPresentationAttributes presentationAttributesForShelf:](&v14, sel_presentationAttributesForShelf_, v6);
LABEL_14:

  return result;
}

- (id)containerLeafAppLayoutForShelf:(id)a3
{
  id v4;
  int64_t layoutRole;
  SBAppLayout *v6;
  SBAppLayout *v7;
  objc_super v9;

  v4 = a3;
  if (!-[SBSwitcherShelf isEqual:](self->_shelf, "isEqual:", v4))
  {
    v9.receiver = self;
    v9.super_class = (Class)SBShelfSwitcherModifier;
    -[SBShelfSwitcherModifier containerLeafAppLayoutForShelf:](&v9, sel_containerLeafAppLayoutForShelf_, v4);
    v7 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();
LABEL_8:
    v6 = v7;
    goto LABEL_9;
  }
  layoutRole = self->_layoutRole;
  if (layoutRole)
  {
    if (layoutRole == 3)
    {
      v7 = self->_activeFloatingAppLayout;
    }
    else
    {
      -[SBAppLayout leafAppLayoutForRole:](self->_activeFullScreenAppLayout, "leafAppLayoutForRole:");
      v7 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_8;
  }
  v6 = 0;
LABEL_9:

  return v6;
}

- (CGRect)frameForShelf:(id)a3
{
  id v4;
  int64_t layoutRole;
  double v6;
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
  SBAppLayout *activeFullScreenAppLayout;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  objc_super v31;
  CGRect result;

  v4 = a3;
  if (objc_msgSend(v4, "isEqual:", self->_shelf))
  {
    layoutRole = self->_layoutRole;
    if (layoutRole)
    {
      if (layoutRole == 3)
      {
        -[SBShelfSwitcherModifier floatingApplicationFrameInInterfaceOrientation:floatingConfiguration:](self, "floatingApplicationFrameInInterfaceOrientation:floatingConfiguration:", -[SBShelfSwitcherModifier switcherInterfaceOrientation](self, "switcherInterfaceOrientation"), 2);
        v7 = v17;
        v9 = v18;
        v10 = 0.0;
      }
      else
      {
        activeFullScreenAppLayout = self->_activeFullScreenAppLayout;
        -[SBShelfSwitcherModifier containerViewBounds](self, "containerViewBounds");
        -[SBShelfSwitcherModifier frameForLayoutRole:inAppLayout:withBounds:](self, "frameForLayoutRole:inAppLayout:withBounds:", layoutRole, activeFullScreenAppLayout);
        v10 = v20;
        v7 = v21;
        v9 = v22;
      }
    }
    else
    {
      -[SBShelfSwitcherModifier containerViewBounds](self, "containerViewBounds");
      v7 = v6;
      v9 = v8;
      v10 = *MEMORY[0x1E0C9D538];
    }
    -[SBShelfSwitcherModifier medusaSettings](self, "medusaSettings");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "switcherShelfCardScale");
    v25 = v24;
    objc_msgSend(v23, "switcherShelfBottomSpacing");
    v16 = v26 + v25 * v9;
    v13 = v9 - v16;

  }
  else
  {
    v31.receiver = self;
    v31.super_class = (Class)SBShelfSwitcherModifier;
    -[SBShelfSwitcherModifier frameForShelf:](&v31, sel_frameForShelf_, v4);
    v10 = v11;
    v13 = v12;
    v7 = v14;
    v16 = v15;
  }

  v27 = v10;
  v28 = v13;
  v29 = v7;
  v30 = v16;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

- (id)focusedAppLayoutForShelf:(id)a3
{
  id v4;
  int64_t layoutRole;
  uint64_t v6;
  id v7;
  void *v8;
  objc_super v10;

  v4 = a3;
  if (objc_msgSend(v4, "isEqual:", self->_shelf))
  {
    layoutRole = self->_layoutRole;
    if (layoutRole)
    {
      if (layoutRole != 3)
      {
        -[SBAppLayout leafAppLayoutForRole:](self->_activeFullScreenAppLayout, "leafAppLayoutForRole:");
        v7 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
      v6 = 112;
    }
    else
    {
      v6 = 104;
    }
    v7 = *(id *)((char *)&self->super.super.super.isa + v6);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SBShelfSwitcherModifier;
    -[SBShelfSwitcherModifier focusedAppLayoutForShelf:](&v10, sel_focusedAppLayoutForShelf_, v4);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_9:
  v8 = v7;

  return v8;
}

- (id)ignoredDisplayItemsForShelf:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  if (objc_msgSend(v4, "isEqual:", self->_shelf))
  {
    -[SBAppLayout allItems](self->_activeFullScreenAppLayout, "allItems");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBAppLayout allItems](self->_activeFloatingAppLayout, "allItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)objc_msgSend(v7, "mutableCopy");
    -[SBShelfSwitcherModifier focusedAppLayoutForShelf:](self, "focusedAppLayoutForShelf:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allItems");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObjectsInArray:", v10);

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)SBShelfSwitcherModifier;
    -[SBShelfSwitcherModifier ignoredDisplayItemsForShelf:](&v13, sel_ignoredDisplayItemsForShelf_, v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (id)topMostLayoutElements
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  objc_super v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)SBShelfSwitcherModifier;
  -[SBShelfSwitcherModifier topMostLayoutElements](&v8, sel_topMostLayoutElements);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_msgSend(v3, "mutableCopy");
    v6 = objc_msgSend(v5, "indexOfObject:", self->_shelf);
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v5, "removeObjectAtIndex:", v6);
    objc_msgSend(v5, "insertObject:atIndex:", self->_shelf, 0);
  }
  else
  {
    v9[0] = self->_shelf;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)homeAffordanceLayoutElementToPortalIntoShelf:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;
  objc_super v9;

  v4 = a3;
  if (-[SBSwitcherShelf isEqual:](self->_shelf, "isEqual:", v4)
    && (!-[SBSwitcherShelf displayMode](self->_shelf, "displayMode")
     || SBLayoutRoleIsValidForSplitView(self->_layoutRole)
     || self->_layoutRole == 3))
  {
    v9.receiver = self;
    v9.super_class = (Class)SBShelfSwitcherModifier;
    -[SBShelfSwitcherModifier visibleHomeAffordanceLayoutElements](&v9, sel_visibleHomeAffordanceLayoutElements);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "anyObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBShelfSwitcherModifier;
    -[SBShelfSwitcherModifier homeAffordanceLayoutElementToPortalIntoShelf:](&v8, sel_homeAffordanceLayoutElementToPortalIntoShelf_, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (id)handleTransitionEvent:(id)a3
{
  id v4;
  void *v5;
  SBAppLayout *v6;
  SBAppLayout *activeFullScreenAppLayout;
  SBAppLayout *v8;
  SBAppLayout *activeFloatingAppLayout;
  uint64_t v10;
  void *v11;
  void *v13;
  uint64_t v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SBShelfSwitcherModifier;
  -[SBSwitcherModifier handleTransitionEvent:](&v16, sel_handleTransitionEvent_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "toAppLayout");
  v6 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();
  activeFullScreenAppLayout = self->_activeFullScreenAppLayout;
  self->_activeFullScreenAppLayout = v6;

  objc_msgSend(v4, "toFloatingAppLayout");
  v8 = (SBAppLayout *)objc_claimAutoreleasedReturnValue();
  activeFloatingAppLayout = self->_activeFloatingAppLayout;
  self->_activeFloatingAppLayout = v8;

  v10 = objc_msgSend(v4, "phase");
  if (!-[SBSwitcherShelf displayMode](self->_shelf, "displayMode"))
  {
    objc_msgSend(v4, "toAppExposeBundleID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      if (!v10)
        goto LABEL_13;
      goto LABEL_10;
    }
  }
  if (-[SBSwitcherShelf displayMode](self->_shelf, "displayMode") == 1
    && objc_msgSend(v4, "toWindowPickerRole") != self->_layoutRole
    && v10 != 0)
  {
LABEL_10:
    if (v10 == 1)
    {
      -[SBShelfSwitcherModifier _responseForDismissingIfNeededGestureInitiated:](self, "_responseForDismissingIfNeededGestureInitiated:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      SBAppendSwitcherModifierResponse(v13, v5);
      v14 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v14;
    }
    else
    {
      -[SBChainableModifier setState:](self, "setState:", 1);
    }
  }
LABEL_13:

  return v5;
}

- (id)handleGestureEvent:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBShelfSwitcherModifier;
  -[SBSwitcherModifier handleGestureEvent:](&v8, sel_handleGestureEvent_, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBShelfSwitcherModifier _responseForDismissingIfNeededGestureInitiated:](self, "_responseForDismissingIfNeededGestureInitiated:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SBAppendSwitcherModifierResponse(v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_responseForDismissingIfNeededGestureInitiated:(BOOL)a3
{
  if (self->_isPendingDismissal)
    return 0;
  self->_isPendingDismissal = 1;
  self->_isPendingDismissalFromGesture = a3;
  return -[SBUpdateLayoutSwitcherEventResponse initWithOptions:updateMode:]([SBUpdateLayoutSwitcherEventResponse alloc], "initWithOptions:updateMode:", 8, 3);
}

- (SBSwitcherShelf)shelf
{
  return self->_shelf;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shelf, 0);
  objc_storeStrong((id *)&self->_presentedFromAppLayout, 0);
  objc_storeStrong((id *)&self->_activeFloatingAppLayout, 0);
  objc_storeStrong((id *)&self->_activeFullScreenAppLayout, 0);
}

@end
