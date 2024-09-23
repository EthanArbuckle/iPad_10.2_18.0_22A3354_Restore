@implementation NSObject(AXPrivCategory)

- (void)_accessibilitySetAnimationsInProgress:()AXPrivCategory
{
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  NSObject *v7;

  if ((a3 & 1) != 0 || _AXAnimationsInProgressCount >= 1)
  {
    if ((a3 & 1) != 0)
    {
      do
        v4 = __ldxr((unsigned int *)&_AXAnimationsInProgressCount);
      while (__stxr(v4 + 1, (unsigned int *)&_AXAnimationsInProgressCount));
    }
    else
    {
      do
      {
        v5 = __ldxr((unsigned int *)&_AXAnimationsInProgressCount);
        v6 = v5 - 1;
      }
      while (__stxr(v6, (unsigned int *)&_AXAnimationsInProgressCount));
      if (!v6 && _AXAnimationsCompletedShouldNotify == 1)
      {
        _AXAnimationsCompletedShouldNotify = 0;
        UIAccessibilityPostNotification(0xFA2u, &unk_1E3E10DF8);
      }
    }
  }
  AXLogUIA();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[NSObject(AXPrivCategory) _accessibilitySetAnimationsInProgress:].cold.1(a3, v7);

}

- (id)_accessibilityViewAncestorIsKindOf:()AXPrivCategory
{
  id v4;
  uint64_t v5;

  if (a3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = a1;
    if (v4)
    {
      do
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          break;
        objc_msgSend(v4, "superview");
        v5 = objc_claimAutoreleasedReturnValue();

        v4 = (id)v5;
      }
      while (v5);
    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)_accessibilityUnregister
{
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) != 0)
  {
    _UIAccessibilityCompleteUnregistration(a1);
    _UIAXCleanupRotorCache(a1);
  }
  else
  {
    AXPerformBlockAsynchronouslyOnMainThread();

  }
}

- (id)_accessibilityWindow
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = a1;
  }
  else
  {
    objc_msgSend(a1, "_accessibilityParentView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = v3;
    }
    else
    {
      objc_msgSend(v3, "window");
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    v2 = v4;
    if (v3 == a1 && !v4)
    {
      objc_msgSend(a1, "accessibilityContainer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
      {
        do
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            break;
          objc_msgSend(v5, "accessibilityContainer");
          v6 = objc_claimAutoreleasedReturnValue();

          v5 = (void *)v6;
        }
        while (v6);
      }
      objc_msgSend(v5, "_accessibilityParentView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v8 = v7;
      }
      else
      {
        objc_msgSend(v7, "window");
        v8 = (id)objc_claimAutoreleasedReturnValue();
      }
      v2 = v8;

    }
  }
  return v2;
}

- (id)_accessibilityAncestorIsKindOf:()AXPrivCategory
{
  _QWORD v4[5];

  if (!a3)
    return 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__NSObject_AXPrivCategory___accessibilityAncestorIsKindOf___block_invoke;
  v4[3] = &__block_descriptor_40_e8_B16__0_8lu32l8;
  v4[4] = a3;
  objc_msgSend(a1, "_accessibilityFindAncestor:startWithSelf:", v4, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_accessibilityFindAncestor:()AXPrivCategory startWithSelf:findTopmostAncestor:
{
  unsigned int (**v8)(id, void *);
  id v9;
  void *v10;
  void *v11;
  id v12;

  v8 = a3;
  if (a4)
  {
    v9 = a1;
  }
  else
  {
    objc_msgSend(a1, "accessibilityContainer");
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;
  if (v9)
  {
    v11 = 0;
    do
    {
      if (v8[2](v8, v10))
      {
        v12 = v10;

        v11 = v12;
        if (!a5)
          break;
      }
      objc_msgSend(v10, "accessibilityContainer");
      v12 = (id)objc_claimAutoreleasedReturnValue();

      v10 = v12;
    }
    while (v12);
  }
  else
  {
    v12 = 0;
    v11 = 0;
  }

  return v11;
}

- (uint64_t)_accessibilityFindAncestor:()AXPrivCategory startWithSelf:
{
  return objc_msgSend(a1, "_accessibilityFindAncestor:startWithSelf:findTopmostAncestor:", a3, a4, 0);
}

- (id)_accessibilityParentView
{
  id v2;
  uint64_t v3;

  objc_opt_class();
  v2 = a1;
  do
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      break;
    objc_msgSend(v2, "accessibilityContainer");
    v3 = objc_claimAutoreleasedReturnValue();

    v2 = (id)v3;
  }
  while (v3);
  return v2;
}

- (uint64_t)_accessibilityContextDrawingAnnotations
{
  return objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("AXContextDrawingAnnotations"));
}

- (uint64_t)_accessibilitySetContextDrawingAnnotations:()AXPrivCategory
{
  return objc_msgSend(a1, "_accessibilitySetValue:forKey:storageMode:", a3, CFSTR("AXContextDrawingAnnotations"), 0);
}

- (void)_accessibilitySetIsSpeakThisElement:()AXPrivCategory
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilityRawSetIsSpeakThisElement:", v2);

}

- (uint64_t)_accessibilityRawSetIsSpeakThisElement:()AXPrivCategory
{
  return __UIAccessibilitySetAssociatedObject();
}

- (uint64_t)accessibilityHitTest:()AXPrivCategory
{
  return 0;
}

- (uint64_t)_accessibilitySecondaryActivate
{
  return 0;
}

- (uint64_t)accessibilityStartStopToggle
{
  return 0;
}

- (uint64_t)_accessibilityHitTestReverseOrder
{
  return 0;
}

- (uint64_t)_accessibilityFuzzyHitTestElements
{
  return 0;
}

- (uint64_t)_accessibilityHitTestShouldFallbackToNearestChild
{
  return objc_msgSend(a1, "_accessibilityBoolValueForKey:", CFSTR("UIAccessibilityStorageKeyShouldHittestFallBackToNearestChild"));
}

- (uint64_t)_accessibilitySetShouldHitTestFallBackToNearestChild:()AXPrivCategory
{
  return objc_msgSend(a1, "_accessibilitySetBoolValue:forKey:", a3, CFSTR("UIAccessibilityStorageKeyShouldHittestFallBackToNearestChild"));
}

- (id)_accessibilityHitTest:()AXPrivCategory withEvent:
{
  id v8;
  void *v9;

  v8 = a5;
  if ((objc_msgSend(a1, "_accessibilityBoolValueForKey:", CFSTR("AXInHitTestOverride")) & 1) != 0
    || !__60__NSObject_AXPrivCategory___accessibilityHitTest_withEvent___block_invoke())
  {
    objc_msgSend(a1, "_accessibilityBaseHitTest:withEvent:", v8, a2, a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("AXInHitTestOverride"));
    objc_msgSend(a1, "accessibilityHitTest:withEvent:", v8, a2, a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_accessibilitySetBoolValue:forKey:", 0, CFSTR("AXInHitTestOverride"));
  }

  return v9;
}

- (uint64_t)_axAdditionalElementHitTestingInProgress
{
  return __UIAccessibilityGetAssociatedBool();
}

- (uint64_t)_axSetAdditionalElementHitTestingInProgress:()AXPrivCategory
{
  return __UIAccessibilitySetAssociatedBool();
}

- (id)_accessibilityHitTestAdditionalElements:()AXPrivCategory event:
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  id v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  double v41;
  double v42;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if ((objc_msgSend(a1, "_axAdditionalElementHitTestingInProgress") & 1) == 0)
  {
    objc_msgSend(a1, "_axSetAdditionalElementHitTestingInProgress:", 1);
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    objc_msgSend(a1, "_accessibilityAdditionalElements");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    if (v11)
    {
      v12 = v11;
      v44 = a1;
      v9 = 0;
      v13 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v46 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "_accessibilityHitTest:withEvent:", v8, a2, a3);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          if (v15)
          {
            if (v9)
            {
              objc_msgSend(v15, "accessibilityFrame");
              objc_msgSend(v9, "accessibilityFrame");
              objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              UIRoundToScreenScale();
              v19 = v18;
              objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              UIRoundToScreenScale();
              v22 = v19 * v21;

              objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              UIRoundToScreenScale();
              v25 = v24;
              objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              UIRoundToScreenScale();
              v28 = v25 * v27;

              if (v22 < v28)
              {
                v29 = v16;

                v9 = v29;
              }
            }
            else
            {
              v9 = v15;
            }
          }

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      }
      while (v12);

      if (!v9)
      {
        a1 = v44;
        goto LABEL_22;
      }
      a1 = v44;
      objc_msgSend(v44, "_accessibilityHitTest:withEvent:", v8, a2, a3);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v30;
      if (!v30)
        goto LABEL_20;
      objc_msgSend(v30, "accessibilityFrame");
      objc_msgSend(v9, "accessibilityFrame");
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      UIRoundToScreenScale();
      v33 = v32;
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      UIRoundToScreenScale();
      v36 = v33 * v35;

      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      UIRoundToScreenScale();
      v39 = v38;
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      UIRoundToScreenScale();
      v42 = v39 * v41;

      if (v36 >= v42)
      {
LABEL_20:

LABEL_22:
        objc_msgSend(a1, "_axSetAdditionalElementHitTestingInProgress:", 0);
        goto LABEL_23;
      }

    }
    v9 = 0;
    goto LABEL_20;
  }
  v9 = 0;
LABEL_23:

  return v9;
}

- (id)_accessibilityHitTestSupplementaryViews:()AXPrivCategory event:
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  char isKindOfClass;
  double v20;
  double v21;
  uint64_t v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  objc_msgSend(a1, "_accessibilitySupplementaryHeaderViews");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilitySupplementaryFooterViews");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
    objc_msgSend(v11, "addObjectsFromArray:", v9);
  if (objc_msgSend(v10, "count"))
    objc_msgSend(v11, "addObjectsFromArray:", v10);
  objc_msgSend(a1, "_accessibilityParentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v26;
    while (2)
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v26 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v17);
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        v20 = a3;
        v21 = a2;
        if ((isKindOfClass & 1) != 0)
          objc_msgSend(v18, "convertPoint:fromView:", v12, a2, a3, (_QWORD)v25);
        objc_msgSend(v18, "_accessibilityHitTest:withEvent:", v8, v21, v20, (_QWORD)v25);
        v22 = objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          v23 = (void *)v22;
          goto LABEL_17;
        }
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v15)
        continue;
      break;
    }
  }
  v23 = 0;
LABEL_17:

  return v23;
}

- (id)_accessibilityHitTestSupplementaryViews:()AXPrivCategory point:withEvent:
{
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  int isKindOfClass;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  double v29;
  uint64_t j;
  void *v31;
  double v32;
  double v33;
  id v34;
  id v35;
  uint64_t v36;
  id v37;
  id v39;
  void *v40;
  id v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  if (!objc_msgSend(v10, "count"))
  {
    v37 = 0;
    goto LABEL_38;
  }
  objc_msgSend(a1, "_accessibilityParentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v13 = v10;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
  if (!v14)
  {
    v37 = 0;
    goto LABEL_37;
  }
  v15 = v14;
  v39 = v10;
  v40 = a1;
  v16 = *(_QWORD *)v48;
  v41 = v13;
  v42 = v12;
  while (2)
  {
    for (i = 0; i != v15; ++i)
    {
      if (*(_QWORD *)v48 != v16)
        objc_enumerationMutation(v13);
      v18 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      v20 = a3;
      v21 = a2;
      if ((isKindOfClass & 1) != 0)
        objc_msgSend(v18, "convertPoint:fromView:", v12, a2, a3);
      objc_msgSend(v18, "_accessibilityHitTest:withEvent:", v11, v21, v20, v39);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (v22 && (objc_msgSend(v22, "isAccessibilityElement") & 1) != 0)
        goto LABEL_35;

      if ((isKindOfClass & objc_msgSend(a1, "_accessibilityHitTestShouldFallbackToNearestChild")) == 1
        && (objc_msgSend(v11, "_accessibilityAutomationHitTest") & 1) == 0)
      {
        objc_msgSend(v18, "convertPoint:fromView:", v12, a2, a3);
        if (objc_msgSend(v18, "pointInside:withEvent:", v11))
        {
          UIAccessibilityPointForPoint(v12, a2, a3);
          v43 = 0u;
          v44 = 0u;
          v45 = 0u;
          v46 = 0u;
          objc_msgSend(v18, "_accessibleSubviews:", 1);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
          if (v25)
          {
            v26 = v25;
            v27 = 0;
            v28 = *(_QWORD *)v44;
            v29 = 1.79769313e308;
            do
            {
              for (j = 0; j != v26; ++j)
              {
                if (*(_QWORD *)v44 != v28)
                  objc_enumerationMutation(v24);
                v31 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * j);
                objc_msgSend(v31, "accessibilityActivationPoint");
                AX_CGPointGetDistanceToPoint();
                if (v32 < v29)
                {
                  v33 = v32;
                  v34 = v31;

                  v27 = v34;
                  v29 = v33;
                }
              }
              v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
            }
            while (v26);
          }
          else
          {
            v27 = 0;
          }

          v35 = v27;
          v13 = v41;
          v12 = v42;
          a1 = v40;
          if (v35)
          {
            v23 = v35;
            if (objc_msgSend(v35, "isAccessibilityElement"))
            {

            }
            else
            {
              objc_msgSend(v23, "accessibilityElementAtIndex:", 0);
              v36 = objc_claimAutoreleasedReturnValue();

              if (!v36)
                continue;
              v23 = (void *)v36;
            }
LABEL_35:
            v37 = v23;

            goto LABEL_36;
          }
        }
      }
    }
    v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
    if (v15)
      continue;
    break;
  }
  v37 = 0;
LABEL_36:
  v10 = v39;
LABEL_37:

LABEL_38:
  return v37;
}

- (uint64_t)_accessibilityAllowOutOfBoundsHitTestAtPoint:()AXPrivCategory withEvent:
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;

  objc_msgSend(a3, "_accessibilityHitTestOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    +[UIAccessibilityHitTestOptions defaultOptions](UIAccessibilityHitTestOptions, "defaultOptions");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  objc_msgSend(v7, "outOfBoundsHitTestElements");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", a1);

  return v9;
}

- (id)_accessibilityBaseHitTest:()AXPrivCategory withEvent:
{
  id v8;
  NSObject *v9;
  id v10;
  int isKindOfClass;
  id v12;
  int v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  id v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  void *v32;
  id v33;
  const CGPath *v34;
  BOOL v35;
  int v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t (**v40)(_QWORD, _QWORD);
  int v41;
  void *v42;
  void *v43;
  id v44;
  id v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  id v50;
  void *v51;
  double v52;
  id v53;
  double v54;
  void *v55;
  const CGPath *v56;
  _BOOL4 v57;
  uint64_t v58;
  id v59;
  void *v60;
  id v61;
  id v62;
  void (**v63)(void *, id);
  uint64_t (**v64)(_QWORD, _QWORD);
  char v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  id v70;
  int v71;
  void *v72;
  id v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t i;
  void *v78;
  double v79;
  double v80;
  id v81;
  BOOL v82;
  BOOL v83;
  void *v84;
  void *v85;
  int v86;
  uint64_t (**v87)(_QWORD, _QWORD);
  char v88;
  int v89;
  NSObject *v90;
  _BOOL4 v91;
  uint64_t (**v92)(_QWORD, _QWORD);
  char v93;
  id v94;
  double v96;
  double v97;
  double v98;
  id v99;
  void *v100;
  int v101;
  id v102;
  id v103;
  void *v104;
  int v105;
  void *v106;
  uint64_t v107;
  int v108;
  id v109;
  uint64_t v110;
  void *v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  _QWORD v116[4];
  id v117;
  _QWORD v118[4];
  id v119;
  id v120;
  CGFloat v121;
  CGFloat v122;
  _QWORD aBlock[5];
  id v124;
  CGFloat v125;
  CGFloat v126;
  uint8_t v127[128];
  uint8_t buf[4];
  id v129;
  __int16 v130;
  id v131;
  uint64_t v132;
  CGPoint v133;
  CGPoint v134;
  CGPoint v135;
  CGPoint v136;
  CGPoint v137;
  CGPoint v138;
  CGRect v139;
  CGRect v140;
  CGRect v141;
  CGRect v142;

  v132 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  AXLogUIA();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v133.x = a2;
    v133.y = a3;
    NSStringFromCGPoint(v133);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v129 = a1;
    v130 = 2112;
    v131 = v10;
    _os_log_impl(&dword_19D0DD000, v9, OS_LOG_TYPE_INFO, "In base hit test for %@ with point %@", buf, 0x16u);

  }
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
  {
    if ((objc_msgSend(a1, "_accessibilityIsFrameOutOfBounds") & 1) != 0)
    {
      v12 = 0;
      goto LABEL_142;
    }
    v13 = objc_msgSend(a1, "pointInside:withEvent:", v8, a2, a3);
  }
  else
  {
    v13 = 0;
  }
  objc_msgSend(a1, "accessibilityFrame");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  objc_msgSend(a1, "_accessibilityParentView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "convertPoint:toView:", 0, a2, a3);
  v24 = v23;
  v26 = v25;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v27 = v22;
  }
  else
  {
    objc_msgSend(v22, "window");
    v27 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v27, "convertPoint:toWindow:", 0, v24, v26);
  v29 = v28;
  v31 = v30;
  if (((isKindOfClass | v13) & 1) != 0)
  {
    if ((v13 & 1) != 0)
      goto LABEL_19;
  }
  else
  {
    objc_msgSend(a1, "accessibilityPath");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      v33 = objc_retainAutorelease(v32);
      v34 = (const CGPath *)objc_msgSend(v33, "CGPath");
      v134.x = v29;
      v134.y = v31;
      v35 = CGPathContainsPoint(v34, 0, v134, 0);

      if (v35)
        goto LABEL_19;
    }
    else
    {
      v139.origin.x = v15;
      v139.origin.y = v17;
      v139.size.width = v19;
      v139.size.height = v21;
      v136.x = v29;
      v136.y = v31;
      if (CGRectContainsPoint(v139, v136))
        goto LABEL_19;
    }
  }
  if (!objc_msgSend(a1, "_accessibilityAllowOutOfBoundsHitTestAtPoint:withEvent:", v8, a2, a3))
  {
    v12 = 0;
    goto LABEL_141;
  }
LABEL_19:
  if (_AXSAutomationEnabled())
    v36 = objc_msgSend(v8, "_accessibilityAutomationHitTest");
  else
    v36 = 0;
  objc_msgSend(v8, "_accessibilityHitTestOptions");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v37;
  if (v37)
  {
    v39 = v37;
  }
  else
  {
    +[UIAccessibilityHitTestOptions defaultOptions](UIAccessibilityHitTestOptions, "defaultOptions");
    v39 = (id)objc_claimAutoreleasedReturnValue();

  }
  if ((v36 & 1) == 0)
  {
    objc_msgSend(v39, "leafNodePredicate");
    v40 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v41 = ((uint64_t (**)(_QWORD, void *))v40)[2](v40, a1);

    if (v41)
    {
      v12 = a1;
      goto LABEL_140;
    }
  }
  objc_msgSend(a1, "_accessibilitySupplementaryHeaderViews");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilityHitTestSupplementaryViews:point:withEvent:", v42, v8, a2, a3);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
  {
    v44 = v43;
    v12 = v44;
    goto LABEL_139;
  }
  v101 = v36;
  if (v36
    && (objc_msgSend(a1, "automationElements"),
        v45 = (id)objc_claimAutoreleasedReturnValue(),
        v45,
        v45)
    || (objc_msgSend(a1, "_accessibilityFuzzyHitTestElements"), (v45 = (id)objc_claimAutoreleasedReturnValue()) != 0)
    || (objc_msgSend(a1, "_accessibilityElements"), (v45 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v46 = objc_msgSend(v45, "count");
  }
  else
  {
    v46 = objc_msgSend(a1, "accessibilityElementCount");
  }
  v47 = v46;
  if (!v46)
  {
    if (objc_msgSend(v39, "shouldHitTestUserTestingChildren"))
    {
      objc_msgSend(a1, "automationElements");
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      v47 = objc_msgSend(v48, "count");
      v45 = v48;
    }
    else
    {
      v47 = 0;
    }
  }
  if (objc_msgSend(a1, "_accessibilityHitTestShouldFallbackToNearestChild"))
    v105 = objc_msgSend(v8, "_accessibilityAutomationHitTest") ^ 1;
  else
    v105 = 0;
  v109 = v45;
  v110 = v47;
  v104 = v39;
  if ((!objc_msgSend(v8, "_accessibilityAutomationHitTest")
     || (objc_msgSend(a1, "_accessibilityAutomationHitTestReverseOrder") & 1) == 0)
    && !objc_msgSend(a1, "_accessibilityHitTestReverseOrder"))
  {
    if (v47 >= 1)
    {
      v96 = v19;
      v97 = v17;
      v98 = v15;
      v99 = v27;
      v100 = v22;
      v49 = 0;
      v108 = 0;
      v107 = 1;
      goto LABEL_50;
    }
LABEL_106:
    v50 = 0;
    goto LABEL_109;
  }
  if (v47 <= 0)
    goto LABEL_106;
  v96 = v19;
  v97 = v17;
  v98 = v15;
  v99 = v27;
  v100 = v22;
  v49 = v47 - 1;
  v107 = -1;
  v108 = 1;
LABEL_50:
  v50 = 0;
  v51 = 0;
  v52 = 1.79769313e308;
  v102 = v8;
  v106 = a1;
  while (1)
  {
    if (v45)
      objc_msgSend(v45, "objectAtIndex:", v49);
    else
      objc_msgSend(a1, "accessibilityElementAtIndex:", v49);
    v53 = (id)objc_claimAutoreleasedReturnValue();

    if (!v53)
      break;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (objc_msgSend(v53, "alpha"), v54 != 0.0)
      || (objc_msgSend(v53, "_accessibilityOverridesInvisibility") & 1) != 0)
    {
      objc_msgSend(v53, "accessibilityPath", *(_QWORD *)&v96, *(_QWORD *)&v97, *(_QWORD *)&v98, v99, v100);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      v111 = v55;
      if (!v55)
        goto LABEL_62;
      v56 = (const CGPath *)objc_msgSend(objc_retainAutorelease(v55), "CGPath");
      v135.x = v29;
      v135.y = v31;
      if (CGPathContainsPoint(v56, 0, v135, 0))
      {
        v57 = 1;
        goto LABEL_67;
      }
      if (!objc_msgSend(v8, "_accessibilityAutomationHitTest"))
      {
LABEL_65:
        v57 = 0;
      }
      else
      {
LABEL_62:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          objc_msgSend(v53, "frame");
          if (CGRectIsEmpty(v140))
            goto LABEL_65;
          objc_msgSend(a1, "convertPoint:toView:", v53, a2, a3);
          objc_msgSend(v53, "_accessibilityHitTest:withEvent:", v8);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          v57 = v84 != 0;

        }
        else
        {
          objc_msgSend(v53, "accessibilityFrame");
          v137.x = v29;
          v137.y = v31;
          v57 = CGRectContainsPoint(v141, v137);
        }
      }
LABEL_67:
      v58 = MEMORY[0x1E0C809B0];
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __64__NSObject_AXPrivCategory___accessibilityBaseHitTest_withEvent___block_invoke;
      aBlock[3] = &unk_1E3DFE3D8;
      aBlock[4] = a1;
      v59 = v53;
      v124 = v59;
      v125 = v29;
      v126 = v31;
      v60 = _Block_copy(aBlock);
      v118[0] = v58;
      v118[1] = 3221225472;
      v118[2] = __64__NSObject_AXPrivCategory___accessibilityBaseHitTest_withEvent___block_invoke_2;
      v118[3] = &unk_1E3DFE400;
      v121 = a2;
      v122 = a3;
      v61 = v60;
      v120 = v61;
      v62 = v8;
      v119 = v62;
      v63 = (void (**)(void *, id))_Block_copy(v118);
      if (v57)
      {
        objc_msgSend(v104, "leafNodePredicate");
        v64 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v65 = ((uint64_t (**)(_QWORD, id))v64)[2](v64, v59);

        if ((v65 & 1) != 0)
        {
          (*((void (**)(id, id, CGFloat, CGFloat))v61 + 2))(v61, v59, a2, a3);
          objc_msgSend(v59, "_accessibilityHitTestSupplementaryViews:event:", v62);
          v66 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v66, "isAccessibilityElement"))
            v67 = v66;
          else
            v67 = v59;
          v68 = v67;

          if (v101)
          {
            v63[2](v63, v59);
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v69, "isAccessibilityElement"))
            {
              v70 = v69;

              v68 = v70;
            }

          }
        }
        else
        {
          v63[2](v63, v59);
          v68 = (id)objc_claimAutoreleasedReturnValue();
          v66 = v51;
        }

        if (v68)
        {
          v71 = 0;
          goto LABEL_97;
        }
      }
      else
      {
        v68 = v51;
      }
      if (v105)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v59, "isAccessibilityElement"))
        {
          objc_msgSend(v72, "addObject:", v59);
        }
        else if (objc_msgSend(v59, "_accessibilityHasOrderedChildren"))
        {
          v116[0] = MEMORY[0x1E0C809B0];
          v116[1] = 3221225472;
          v116[2] = __64__NSObject_AXPrivCategory___accessibilityBaseHitTest_withEvent___block_invoke_3;
          v116[3] = &unk_1E3DFE428;
          v117 = v72;
          objc_msgSend(v59, "accessibilityEnumerateContainerElementsUsingBlock:", v116);

        }
        v103 = v68;
        v114 = 0u;
        v115 = 0u;
        v112 = 0u;
        v113 = 0u;
        v73 = v72;
        v74 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v112, v127, 16);
        if (v74)
        {
          v75 = v74;
          v76 = *(_QWORD *)v113;
          do
          {
            for (i = 0; i != v75; ++i)
            {
              if (*(_QWORD *)v113 != v76)
                objc_enumerationMutation(v73);
              v78 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * i);
              objc_msgSend(v78, "accessibilityActivationPoint");
              AX_CGPointGetDistanceToPoint();
              if (v79 < v52)
              {
                v80 = v79;
                v81 = v78;

                v50 = v81;
                v52 = v80;
              }
            }
            v75 = objc_msgSend(v73, "countByEnumeratingWithState:objects:count:", &v112, v127, 16);
          }
          while (v75);
        }

        v71 = 1;
        v8 = v102;
        v68 = v103;
      }
      else
      {
        v71 = 1;
      }
LABEL_97:

      v51 = v68;
      a1 = v106;
      v45 = v109;
      if (!v71)
        goto LABEL_108;
      goto LABEL_98;
    }

    v68 = v51;
LABEL_98:
    v82 = __OFADD__(v49, v107);
    v49 += v107;
    v83 = v49 < 0 == v82;
    if (!v108)
      v83 = v49 < v110;
    if (!v83)
      goto LABEL_108;
  }
  v68 = v51;
LABEL_108:
  v27 = v99;
  v22 = v100;
  v17 = v97;
  v15 = v98;
  v19 = v96;
  if (v68)
    goto LABEL_134;
LABEL_109:
  objc_msgSend(a1, "_accessibilitySupplementaryFooterViews", *(_QWORD *)&v96, *(_QWORD *)&v97, *(_QWORD *)&v98, v99, v100);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilityHitTestSupplementaryViews:point:withEvent:", v85, v8, a2, a3);
  v68 = (id)objc_claimAutoreleasedReturnValue();

  if (v68)
    v86 = 0;
  else
    v86 = v105;
  if (v86 == 1 && v50)
  {
    v50 = v50;
    v68 = v50;
    goto LABEL_134;
  }
  if (v68 || v110 < 1)
  {
    if (!v68)
      goto LABEL_124;
    goto LABEL_134;
  }
  v142.origin.x = v15;
  v142.origin.y = v17;
  v142.size.width = v19;
  v142.size.height = v21;
  v138.x = v29;
  v138.y = v31;
  if (CGRectContainsPoint(v142, v138))
  {
    objc_msgSend(v104, "fallbackPredicate");
    v87 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v88 = ((uint64_t (**)(_QWORD, void *))v87)[2](v87, a1);

    v68 = 0;
    if ((v88 & 1) != 0)
      goto LABEL_138;
  }
  else
  {
    v68 = 0;
  }
LABEL_124:
  if (objc_msgSend(a1, "_accessibilityIsRemoteElement"))
  {
    v89 = objc_msgSend(a1, "_accessibilityShouldHitTestRemoteElementProcess");
    AXLogUIA();
    v90 = objc_claimAutoreleasedReturnValue();
    v91 = os_log_type_enabled(v90, OS_LOG_TYPE_INFO);
    if (v89)
    {
      if (v91)
      {
        *(_DWORD *)buf = 138412290;
        v129 = 0;
        _os_log_impl(&dword_19D0DD000, v90, OS_LOG_TYPE_INFO, "Will attempt to hit test remote process %@", buf, 0xCu);
      }
      goto LABEL_137;
    }
    if (v91)
    {
      *(_DWORD *)buf = 138412290;
      v129 = 0;
      _os_log_impl(&dword_19D0DD000, v90, OS_LOG_TYPE_INFO, "Not returning remote element for hit-testing %@", buf, 0xCu);
    }

    v45 = v109;
  }
  if (!v101
    || (objc_msgSend(a1, "isAccessibilityElement") & 1) == 0
    && (objc_msgSend(v104, "leafNodePredicate"),
        v92 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(),
        v93 = ((uint64_t (**)(_QWORD, void *))v92)[2](v92, a1),
        v92,
        (v93 & 1) == 0))
  {
LABEL_134:
    AXLogUIA();
    v90 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v90, OS_LOG_TYPE_INFO))
    {
      UIAXMassageElementDescription(v68);
      v94 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v129 = v94;
      _os_log_impl(&dword_19D0DD000, v90, OS_LOG_TYPE_INFO, "Base hit test returning %@", buf, 0xCu);

    }
    a1 = v68;
LABEL_137:

    v45 = v109;
  }
LABEL_138:
  v12 = a1;

  v44 = v68;
  v39 = v104;
LABEL_139:

LABEL_140:
LABEL_141:

LABEL_142:
  return v12;
}

- (uint64_t)_accessibilitySelfFoundByHitTesting
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  double MidY;
  void *v8;
  void *EventForSceneReferencePoint;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  CGRect v14;
  CGRect v15;

  objc_msgSend(a1, "accessibilityFrame");
  x = v14.origin.x;
  y = v14.origin.y;
  width = v14.size.width;
  height = v14.size.height;
  MidX = CGRectGetMidX(v14);
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  MidY = CGRectGetMidY(v15);
  objc_msgSend(a1, "safeValueForKey:", CFSTR("window"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  EventForSceneReferencePoint = (void *)UIAccessibilityCreateEventForSceneReferencePoint(0, MidX, MidY);
  objc_msgSend(v8, "_accessibilityHitTest:withEvent:", EventForSceneReferencePoint, MidX, MidY);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && v10)
  {
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v10, "performSelector:", sel_realTableViewCell);
      else
        objc_msgSend(v10, "accessibilityContainer");
      v11 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v11;
    }
    while (v11);
  }
  if (v10 == a1)
    v12 = 1;
  else
    v12 = objc_msgSend(v10, "_accessibilityIsDescendantOfElement:", a1);

  return v12;
}

- (uint64_t)_accessibilityEncodedHierarchyData
{
  return objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("_accessibilityEncodedHierarchyData"));
}

- (uint64_t)_setAccessibilityEncodedHierarchyData:()AXPrivCategory
{
  return objc_msgSend(a1, "_accessibilitySetRetainedValue:forKey:", a3, CFSTR("_accessibilityEncodedHierarchyData"));
}

- (uint64_t)_accessibilityWindowVisible
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "accessibilityUserDefinedWindowVisible");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (void)_setAccessibilityWindowVisible:()AXPrivCategory
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilitySetRetainedValue:forKey:", v2, CFSTR("_AX_WindowVisible"));

}

- (uint64_t)_accessibilityIsMainWindow
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "accessibilityUserDefinedIsMainWindow");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (uint64_t)_accessibilityCanBeConsideredAsMainWindow
{
  return objc_msgSend(a1, "_accessibilityIsIsolatedWindow") ^ 1;
}

- (void)_setAccessibilityIsMainWindow:()AXPrivCategory
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilitySetRetainedValue:forKey:", v2, CFSTR("_AX_WindowIsMain"));

}

- (uint64_t)_accessibilityTextInputElement
{
  return 0;
}

- (uint64_t)_accessibilityTextInputElementRange
{
  return 0;
}

- (uint64_t)_accessibilityTextInputElementRangeAsNSRange
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "_accessibilityTextInputElementRange");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(a1, "_accessibilityTextInputElement");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "_accessibilityRawRangeForUITextRange:", v2);

  }
  else
  {
    v4 = 0x7FFFFFFFLL;
  }

  return v4;
}

- (uint64_t)_accessibilityTextRangeFromNSRange:()AXPrivCategory
{
  return 0;
}

- (uint64_t)_accessibilityRawRangeForUITextRange:()AXPrivCategory
{
  return 0x7FFFFFFFLL;
}

- (uint64_t)_accessibilityIgnoresStatusBarFrame
{
  return 0;
}

- (uint64_t)_accessibilityShouldIncludeKeyboardInRemoteSubstituteChildren
{
  return 0;
}

- (uint64_t)_accessibilityRemoteElementShouldHitTestHostProcess
{
  uint64_t v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "_accessibilityGetBlockForAttribute:", 55);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)v1;
  if (v1)
    v3 = (*(uint64_t (**)(uint64_t))(v1 + 16))(v1);
  else
    v3 = 0;

  return v3;
}

- (uint64_t)_accessibilityShouldHitTestRemoteElementProcess
{
  return 0;
}

- (uint64_t)accessibilityScrollUpPage
{
  return 0;
}

- (uint64_t)accessibilityScrollDownPage
{
  return 0;
}

- (uint64_t)accessibilityScrollRightPage
{
  return 0;
}

- (uint64_t)accessibilityScrollLeftPage
{
  return 0;
}

- (uint64_t)_accessibilityPageCount
{
  return 0x7FFFFFFFLL;
}

- (uint64_t)_accessibilityPageIndex
{
  return 0x7FFFFFFFLL;
}

- (id)_accessibilityUserDefinedScrollingEnabled
{
  return objc_getAssociatedObject(a1, &__NSObject___accessibilityUserDefinedScrollingEnabled);
}

- (uint64_t)_accessibilitySetUserDefinedScrollingEnabled:()AXPrivCategory
{
  return __UIAccessibilitySetAssociatedObject();
}

- (void)_accessibilitySetScrollingEnabled:()AXPrivCategory
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilitySetUserDefinedScrollingEnabled:", v2);

}

- (uint64_t)_accessibilityScrollingEnabled
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "_accessibilityUserDefinedScrollingEnabled");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "BOOLValue");
  else
    v3 = 1;

  return v3;
}

- (uint64_t)_accessibilityIsScrollAncestor
{
  return 0;
}

- (uint64_t)_accessibilityScrollToFrame:()AXPrivCategory forView:
{
  return 0;
}

- (uint64_t)accessibilityScrollLeftPageSupported
{
  return 1;
}

- (uint64_t)accessibilityScrollRightPageSupported
{
  return 1;
}

- (uint64_t)accessibilityScrollDownPageSupported
{
  return 1;
}

- (uint64_t)accessibilityScrollUpPageSupported
{
  return 1;
}

- (uint64_t)accessibilityScrollToTopSupported
{
  return 1;
}

- (void)_setAccessibilityShouldUseViewHierarchyForFindingScrollParent:()AXPrivCategory
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilitySetRetainedValue:forKey:", v2, CFSTR("_accessibilityShouldUseViewHierarchyForFindingScrollParent"));

}

- (uint64_t)_accessibilityShouldUseViewHierarchyForFindingScrollParent
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("_accessibilityShouldUseViewHierarchyForFindingScrollParent"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (uint64_t)_accessibilityIsWebDocumentView
{
  return 0;
}

- (uint64_t)_accessibilitySupportsPressedState
{
  return 0;
}

- (BOOL)_accessibilityIsPressed
{
  void *v2;

  if ((objc_opt_respondsToSelector() & 1) == 0)
    return 0;
  objc_msgSend(a1, "safeValueForKey:", CFSTR("_browserAccessibilityStoredValuePressedState"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    return 0;
  if (objc_msgSend(a1, "safeIntegerForKey:", CFSTR("browserAccessibilityPressedState")) == 2)
    return 1;
  return objc_msgSend(a1, "safeIntegerForKey:", CFSTR("browserAccessibilityPressedState")) == 3;
}

- (uint64_t)accessibilityLinkRelationshipType
{
  return 0;
}

- (uint64_t)_accessibilityExpandedStatus
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(a1, "safeIntegerForKey:", CFSTR("accessibilityExpandedStatus"));
  else
    return 0;
}

- (uint64_t)_accessibilityExpandedStatusTogglesOnActivate
{
  return 1;
}

- (uint64_t)_accessibilityRepresentsInfiniteCollection
{
  return 0;
}

- (id)_accessibilityFirstResponderForKeyWindow
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CEAC18], "_applicationKeyWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilityFirstResponderForWindow:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)_accessibilityFirstResponderForWindow:()AXPrivCategory
{
  return objc_msgSend(a3, "safeValueForKey:", CFSTR("firstResponder"));
}

- (id)_accessibilityResponderChainForWindow:()AXPrivCategory
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstResponder");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    do
    {
      objc_msgSend(v4, "addObject:", v6);
      objc_msgSend(v6, "nextResponder");
      v7 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v7;
    }
    while (v7);
  }

  return v4;
}

- (id)_accessibilityResponderChainForKeyWindow
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CEAC18], "_applicationKeyWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilityResponderChainForWindow:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (uint64_t)_accessibilityTextFieldText
{
  return 0;
}

- (uint64_t)_accessibilityIterateScrollParentsUsingBlock:()AXPrivCategory
{
  return objc_msgSend(a1, "_accessibilityIterateScrollParentsUsingBlock:includeSelf:", a3, 1);
}

- (void)_accessibilityIterateScrollParentsUsingBlock:()AXPrivCategory includeSelf:
{
  void (**v6)(id, void *, _BYTE *);
  int v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  char v13;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = objc_msgSend(a1, "_accessibilityShouldUseViewHierarchyForFindingScrollParent");
    v8 = a1;
    v9 = v8;
    if ((a4 & 1) != 0)
      goto LABEL_9;
    if (v7)
    {
      objc_msgSend(v8, "superview");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 1;
      goto LABEL_8;
    }
  }
  else
  {
    v10 = a1;
    if ((a4 & 1) != 0)
    {
      v9 = v10;
      v7 = 0;
      goto LABEL_9;
    }
  }
  objc_msgSend(a1, "_accessibilityParentForFindingScrollParent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
LABEL_8:

  if (v9 == a1)
  {
    _AXAssert();
    goto LABEL_19;
  }
LABEL_9:
  v13 = 0;
  if (v9)
  {
    while (1)
    {
      v6[2](v6, v9, &v13);
      v11 = v9;
      v12 = v11;
      if (v7)
        objc_msgSend(v11, "superview");
      else
        objc_msgSend(v11, "_accessibilityParentForFindingScrollParent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12 == v9)
        break;

      if (!v9 || v13)
        goto LABEL_18;
    }
    _AXAssert();

    v9 = v12;
  }
LABEL_18:
  a1 = v9;
LABEL_19:

}

- (double)__accessibilityVisibleScrollArea:()AXPrivCategory
{
  double v3;
  _QWORD v5[5];
  char v6;
  uint64_t v7;
  double *v8;
  uint64_t v9;
  const char *v10;
  __int128 v11;

  v7 = 0;
  v8 = (double *)&v7;
  v9 = 0x3010000000;
  v10 = "";
  v11 = xmmword_19D142610;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61__NSObject_AXPrivCategory____accessibilityVisibleScrollArea___block_invoke;
  v5[3] = &unk_1E3DFE450;
  v6 = a3;
  v5[4] = &v7;
  objc_msgSend(a1, "_accessibilityIterateScrollParentsUsingBlock:", v5);
  v3 = v8[4];
  _Block_object_dispose(&v7, 8);
  return v3;
}

- (uint64_t)_accessibilityScrollAncestor
{
  return objc_msgSend(a1, "_accessibilityScrollAncestorForSelector:", 0);
}

- (void)setIsAccessibilityScrollAncestor:()AXPrivCategory
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilitySetRetainedValue:forKey:", v2, CFSTR("_AX_IsScrollAncestor"));

}

- (uint64_t)_accessibilityShouldSpeakScrollStatusOnEntry
{
  objc_class *v2;
  uint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  if (!_accessibilityShouldSpeakScrollStatusOnEntry_BaseNSObjectMethod)
  {
    v2 = (objc_class *)objc_opt_class();
    _accessibilityShouldSpeakScrollStatusOnEntry_BaseNSObjectMethod = (uint64_t)class_getInstanceMethod(v2, sel__accessibilityShouldSpeakScrollStatusOnEntry);
  }
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __72__NSObject_AXPrivCategory___accessibilityShouldSpeakScrollStatusOnEntry__block_invoke;
  v5[3] = &unk_1E3DFE478;
  v5[4] = &v6;
  v5[5] = sel__accessibilityShouldSpeakScrollStatusOnEntry;
  objc_msgSend(a1, "_accessibilityIterateScrollParentsUsingBlock:includeSelf:", v5, 0);
  v3 = *((unsigned __int8 *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (uint64_t)_accessibilityElementVisibilityAffectsLayout
{
  return 0;
}

- (id)_accessibilityScrollStatus
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__2;
  v14 = __Block_byref_object_dispose__2;
  v15 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__NSObject_AXPrivCategory___accessibilityScrollStatus__block_invoke;
  v9[3] = &unk_1E3DFE4A0;
  v9[4] = &v10;
  objc_msgSend(a1, "_accessibilityIterateScrollParentsUsingBlock:includeSelf:", v9, 0);
  v2 = (void *)v11[5];
  if (!v2)
  {
    objc_msgSend(a1, "_accessibilityScrollAncestor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3 != a1)
    {
      objc_msgSend(v3, "_accessibilityScrollStatus");
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)v11[5];
      v11[5] = v5;

    }
    v2 = (void *)v11[5];
  }
  v7 = v2;
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (uint64_t)_accessibilityScrollAncestorForSelector:()AXPrivCategory
{
  return objc_msgSend(a1, "_accessibilityScrollAncestorForSelector:alwaysAllowRefreshAction:", a3, 0);
}

- (double)_accessibilityVisibleItemDenominator
{
  return 3.0;
}

- (uint64_t)_accessibilityUpdatesSwitchMenu
{
  return 0;
}

- (id)_accessibilityScrollAncestorForSelector:()AXPrivCategory alwaysAllowRefreshAction:
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  _QWORD v18[4];
  void *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  id *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v22 = 0;
  v23 = (id *)&v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__2;
  v26 = __Block_byref_object_dispose__2;
  v27 = 0;
  if (aSelector)
  {
    NSStringFromSelector(aSelector);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingString:", CFSTR("Supported"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "_accessibilityScrollAncestor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_storeStrong(v23 + 5, v9);
    if (v9)
    {
      while (1)
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v9, "safeValueForKey:", v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "BOOLValue");

          if ((v11 & 1) != 0 || a4 && sel_accessibilityScrollUpPage == aSelector)
            break;
        }
        objc_msgSend(v9, "accessibilityContainer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "_accessibilityScrollAncestor");
        v13 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v13;
        if (!v13)
          goto LABEL_13;
      }
      v14 = v23[5];
      v23[5] = v9;
      v15 = v9;

    }
  }
  else
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __93__NSObject_AXPrivCategory___accessibilityScrollAncestorForSelector_alwaysAllowRefreshAction___block_invoke;
    v18[3] = &unk_1E3DFE4C8;
    v20 = &v22;
    v21 = 0;
    v19 = 0;
    objc_msgSend(a1, "_accessibilityIterateScrollParentsUsingBlock:", v18);
    v8 = v19;
  }
LABEL_13:

  v16 = v23[5];
  _Block_object_dispose(&v22, 8);

  return v16;
}

- (uint64_t)_accessibilityIterateParentsForTestBlock:()AXPrivCategory
{
  id v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__NSObject_AXPrivCategory___accessibilityIterateParentsForTestBlock___block_invoke;
  v8[3] = &unk_1E3DFE4F0;
  v5 = v4;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(a1, "_accessibilityIterateScrollParentsUsingBlock:", v8);
  v6 = *((unsigned __int8 *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (uint64_t)_accessibilityIsEscapable
{
  objc_class *v2;
  objc_class *v3;
  int v4;
  uint64_t v5;
  id *v7;
  objc_class *v8;
  objc_class *v9;
  _QWORD v10[8];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  if (!_accessibilityIsEscapable_BaseNSObjectMethod)
  {
    v2 = (objc_class *)objc_opt_class();
    _accessibilityIsEscapable_BaseNSObjectMethod = (uint64_t)class_getInstanceMethod(v2, sel_accessibilityPerformEscape);
    v3 = (objc_class *)objc_opt_class();
    _accessibilityIsEscapable_BaseCanPerformMethod = (uint64_t)class_getInstanceMethod(v3, sel__accessibilityCanPerformEscapeAction);
  }
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__2;
  v15 = __Block_byref_object_dispose__2;
  v16 = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __53__NSObject_AXPrivCategory___accessibilityIsEscapable__block_invoke;
  v10[3] = &unk_1E3DFE518;
  v10[4] = &v11;
  v10[5] = &v17;
  v10[6] = sel__accessibilityCanPerformEscapeAction;
  v10[7] = sel_accessibilityPerformEscape;
  v4 = objc_msgSend(a1, "_accessibilityIterateParentsForTestBlock:", v10);
  if ((v4 & 1) != 0 || *((_BYTE *)v18 + 24))
  {
    v5 = v4 & ~_switchControlNegatesPerformEscapeAnswer((void *)v12[5]);
  }
  else
  {
    v7 = (id *)MEMORY[0x1E0CEB258];
    v8 = (objc_class *)objc_opt_class();
    if (class_getInstanceMethod(v8, sel__accessibilityCanPerformEscapeAction) == (Method)_accessibilityIsEscapable_BaseCanPerformMethod)
    {
      v9 = (objc_class *)objc_opt_class();
      v5 = class_getInstanceMethod(v9, sel_accessibilityPerformEscape) != (Method)_accessibilityIsEscapable_BaseNSObjectMethod;
    }
    else
    {
      v5 = objc_msgSend(*v7, "_accessibilityCanPerformEscapeAction");
    }
  }
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v5;
}

- (uint64_t)_accessibilitySetAdditionalImportantScannerMenuItems:()AXPrivCategory
{
  return objc_msgSend(a1, "_accessibilitySetValue:forKey:storageMode:", a3, CFSTR("_promoteSwitchControlMenuItemsKey"), 0);
}

- (uint64_t)_accessibilityTapReplacementGestures
{
  return 0;
}

- (uint64_t)_accessibilityIsScrollable
{
  void *v2;
  int v4;
  _BOOL4 v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("AXIsScrollable"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    return objc_msgSend(a1, "_accessibilityBoolValueForKey:", CFSTR("AXIsScrollable"));
  v4 = objc_msgSend(a1, "_accessibilityIterateParentsForTestBlock:", &__block_literal_global_267);
  if ((v4 & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(a1, "_accessibilityScrollAncestor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v6 != 0;

  }
  v7 = v4 | v5;
  objc_msgSend(a1, "_accessibilitySetBoolValue:forKey:", v7, CFSTR("AXIsScrollable"));
  return v7;
}

- (id)_axCachedHasTabBarAncestor
{
  return objc_getAssociatedObject(a1, &__NSObject___axCachedHasTabBarAncestor);
}

- (uint64_t)_axSetCachedHasTabBarAncestor:()AXPrivCategory
{
  return __UIAccessibilitySetAssociatedObject();
}

- (uint64_t)_accessibilityAdditionalElementOrderedLast
{
  return __UIAccessibilityGetAssociatedBool();
}

- (uint64_t)_accessibilitySetAdditionalElementOrderedLast:()AXPrivCategory
{
  return __UIAccessibilitySetAssociatedBool();
}

- (uint64_t)_accessibilityIsInTabBar
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "_axCachedHasTabBarAncestor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "BOOLValue");
  }
  else
  {
    objc_msgSend(a1, "_accessibilityTabBarAncestor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_axSetCachedHasTabBarAncestor:", v6);

  }
  return v4;
}

- (uint64_t)_accessibilityDidMoveToTabBar
{
  return objc_msgSend(a1, "_axSetCachedHasTabBarAncestor:", 0);
}

- (uint64_t)_accessibililtyLabelForTabBarButton:()AXPrivCategory
{
  return 0;
}

- (uint64_t)_accessibilityTabBarAncestor
{
  return objc_msgSend(a1, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_270, 0);
}

- (uint64_t)_accessibilityCanScrollInAtLeastOneDirection
{
  if ((objc_msgSend(a1, "_accessibilityCanPerformAction:", 2006) & 1) != 0
    || (objc_msgSend(a1, "_accessibilityCanPerformAction:", 2007) & 1) != 0
    || (objc_msgSend(a1, "_accessibilityCanPerformAction:", 2009) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return objc_msgSend(a1, "_accessibilityCanPerformAction:", 2008);
  }
}

- (double)_accessibilityContentOffset
{
  return *MEMORY[0x1E0C9D538];
}

- (uint64_t)_accessibilityShowContextMenuWithTargetPointValue:()AXPrivCategory
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "_accessibilityParentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_accessibilityShowContextMenuForElement:targetPointValue:", a1, v4);

  return v6;
}

- (uint64_t)_accessibilityScrollToVisibleForNextElementRetrieval:()AXPrivCategory
{
  return 0;
}

- (uint64_t)_accessibilityViewControllerShouldPreventScrollToVisibleForElement:()AXPrivCategory
{
  return 0;
}

- (uint64_t)_accessibilityBaseScrollToVisible
{
  NSObject *v2;
  uint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  AXLogScrollToVisible();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    -[NSObject(AXPrivCategory) _accessibilityBaseScrollToVisible].cold.1();

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61__NSObject_AXPrivCategory___accessibilityBaseScrollToVisible__block_invoke;
  v5[3] = &unk_1E3DFE540;
  v5[4] = a1;
  v5[5] = &v6;
  objc_msgSend(a1, "_accessibilityIterateScrollParentsUsingBlock:", v5);
  v3 = *((unsigned __int8 *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (uint64_t)_accessibilityShouldAttemptScrollToFrameOnParentView
{
  return 1;
}

- (uint64_t)_accessibilitySavePhotoLabel:()AXPrivCategory
{
  return 0;
}

- (uint64_t)_animateScrollViewWithScrollAmount:()AXPrivCategory point:
{
  void (*v4)(void);
  void *v5;
  const void *v6;
  uint64_t v8;

  if (a2 == 0.0)
    return 1;
  if (__AXRuntimeApplicationElement())
  {
    v4 = (void (*)(void))__AXRuntimeApplicationElement();
    v4();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (const void *)_AXCreateAXUIElementWithElement();

  }
  else
  {
    v6 = (const void *)_AXCreateAXUIElementWithElement();
  }
  v8 = 0;
  objc_msgSend(a1, "_accessibilityDisplayId");
  _AXUIElementCopyElementAtPositionWithParams();
  if (v6)
    CFRelease(v6);
  return 0;
}

- (BOOL)_accessibilityAdjustScrollOffset:()AXPrivCategory
{
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  NSObject *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  NSObject *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  _BOOL8 v32;
  _BYTE v34[12];
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;
  CGPoint v40;
  CGPoint v41;
  CGPoint v42;
  CGSize v43;

  v39 = *MEMORY[0x1E0C80C00];
  v34[0] = 0;
  objc_opt_class();
  objc_msgSend(a1, "_accessibilityScrollAncestor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "contentOffset");
  v9 = v8;
  v11 = v10;
  objc_msgSend(v7, "frame");
  v13 = v12;
  v15 = v14;
  AXMediaLogMLElement();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v40.x = v9;
    v40.y = v11;
    NSStringFromCGPoint(v40);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v41.x = a2;
    v41.y = a3;
    NSStringFromCGPoint(v41);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v34 = 138412802;
    *(_QWORD *)&v34[4] = v7;
    v35 = 2112;
    v36 = v17;
    v37 = 2112;
    v38 = v18;
    _os_log_impl(&dword_19D0DD000, v16, OS_LOG_TYPE_DEFAULT, "Scrolling with %@ from %@ + %@", v34, 0x20u);

  }
  v19 = a3 + v11;
  v20 = a2 + v9;
  objc_msgSend(v7, "contentSize");
  v22 = v21 - v15;
  if (v21 - v15 >= v19)
    v22 = v19;
  v23 = fmax(v22, 0.0);
  objc_msgSend(v7, "contentSize", *(_QWORD *)v34);
  v25 = v24 - v13;
  if (v25 >= v20)
    v25 = v20;
  v26 = fmax(v25, 0.0);
  AXMediaLogMLElement();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v42.x = v26;
    v42.y = v23;
    NSStringFromCGPoint(v42);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "contentSize");
    NSStringFromCGSize(v43);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v34 = 138412546;
    *(_QWORD *)&v34[4] = v28;
    v35 = 2112;
    v36 = v29;
    _os_log_impl(&dword_19D0DD000, v27, OS_LOG_TYPE_DEFAULT, "Will apply %@ with size :%@", v34, 0x16u);

  }
  objc_msgSend(v7, "accessibilityApplyScrollContent:sendScrollStatus:animateWithDuration:", 0, v26, v23, 0.1);
  objc_msgSend(v7, "contentOffset");
  v32 = v23 != v31 || v26 != v30;

  return v32;
}

- (void)_accessibilityScrollToPoint:()AXPrivCategory
{
  char v5;
  void *v6;
  BOOL v7;
  double v8;
  double v9;
  void *v10;
  void *v11;

  objc_msgSend(a1, "_accessibilityScrollAncestor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();
  v6 = v11;
  if ((v5 & 1) != 0)
  {
    v7 = a2 >= 0.0 && a2 <= 1.0;
    if (v7 && a3 >= 0.0 && a3 <= 1.0)
    {
      objc_msgSend(v11, "contentSize");
      objc_msgSend(v11, "_accessibilityScrollToFrame:forView:", v11, a2 * v8, a3 * v9, 1.0, 1.0);
      objc_msgSend(v11, "_accessibilityScrollStatus");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      UIAccessibilityPostNotification(*MEMORY[0x1E0CEB070], v10);

    }
    else
    {
      NSLog(CFSTR("Scroll to point only accepts values from 0 to 1"), v11);
    }
    v6 = v11;
  }

}

- (double)_accessibilityScrollRectToVisible:()AXPrivCategory
{
  double v5;
  _QWORD v7[6];
  _QWORD v8[8];
  uint64_t v9;
  double *v10;
  uint64_t v11;
  const char *v12;
  __int128 v13;

  v9 = 0;
  v10 = (double *)&v9;
  v11 = 0x3010000000;
  v12 = "";
  v13 = *MEMORY[0x1E0C9D538];
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x4010000000;
  v8[3] = "";
  *(double *)&v8[4] = a2;
  *(double *)&v8[5] = a3;
  *(double *)&v8[6] = a4;
  *(double *)&v8[7] = a5;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__NSObject_AXPrivCategory___accessibilityScrollRectToVisible___block_invoke;
  v7[3] = &unk_1E3DFE590;
  v7[4] = v8;
  v7[5] = &v9;
  objc_msgSend(a1, "_accessibilityIterateScrollParentsUsingBlock:includeSelf:", v7, 1);
  v5 = v10[4];
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(&v9, 8);
  return v5;
}

- (uint64_t)_accessibilityHandlePublicScroll:()AXPrivCategory
{
  uint64_t v3;
  _QWORD v5[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61__NSObject_AXPrivCategory___accessibilityHandlePublicScroll___block_invoke;
  v5[3] = &unk_1E3DFE5B8;
  v5[5] = &v6;
  v5[6] = a3;
  v5[4] = a1;
  objc_msgSend(a1, "_accessibilityIterateScrollParentsUsingBlock:", v5);
  v3 = *((unsigned __int8 *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_accessibilitySendPageScrollFailedIfNecessary
{
  uint64_t v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "_accessibilityRemoteParent");
  v2 = objc_claimAutoreleasedReturnValue();
  if (!v2
    || (v3 = (void *)v2, v4 = objc_msgSend(a1, "_accessibilityShouldScrollRemoteParent"),
                         v3,
                         (v4 & 1) == 0))
  {
    UIAccessibilityPostNotification(*MEMORY[0x1E0CEB070], (id)*MEMORY[0x1E0CF4518]);
  }
}

- (uint64_t)_accessibilityTryScrollWithSelector:()AXPrivCategory shouldSendScrollFailed:
{
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v14;

  v14 = 0;
  objc_msgSend(a1, "_accessibilityScrollAncestorForSelector:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 != 0;
  if (v7)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
      goto LABEL_4;
    v9 = (void *)MEMORY[0x1E0C99DB8];
    objc_msgSend((id)objc_opt_class(), "instanceMethodSignatureForSelector:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "invocationWithMethodSignature:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setSelector:", a3);
    objc_msgSend(v11, "setTarget:", v7);
    objc_msgSend(v11, "invoke");
    objc_msgSend(v11, "getReturnValue:", &v14);

    if (!v14)
    {
LABEL_4:
      objc_msgSend(v7, "accessibilityContainer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v12, "_accessibilityTryScrollWithSelector:shouldSendScrollFailed:", a3, a4);

    }
  }
  else if ((_DWORD)a4)
  {
    objc_msgSend(a1, "_accessibilitySendPageScrollFailedIfNecessary");
  }

  return v8;
}

- (uint64_t)_accessibilityScrollPageInDirection:()AXPrivCategory shouldSendScrollFailed:
{
  if ((objc_msgSend(a1, "_accessibilityHandlePublicScroll:") & 1) != 0)
    return 1;
  else
    return objc_msgSend(a1, "_accessibilityTryScrollWithSelector:shouldSendScrollFailed:", objc_msgSend(a1, "_accessibilityScrollSelectorForDirection:", a3), a4);
}

- (char)_accessibilityScrollSelectorForDirection:()AXPrivCategory
{
  char *result;

  switch(a3)
  {
    case 1:
      result = sel_accessibilityScrollRightPage;
      break;
    case 2:
      result = sel_accessibilityScrollLeftPage;
      break;
    case 3:
      result = sel_accessibilityScrollUpPage;
      break;
    case 4:
      result = sel_accessibilityScrollDownPage;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (uint64_t)_accessibilityScrollLeftPage:()AXPrivCategory
{
  return objc_msgSend(a1, "_accessibilityScrollPageInDirection:shouldSendScrollFailed:", 2, a3);
}

- (uint64_t)_accessibilityScrollRightPage:()AXPrivCategory
{
  return objc_msgSend(a1, "_accessibilityScrollPageInDirection:shouldSendScrollFailed:", 1, a3);
}

- (uint64_t)_accessibilityScrollNextPage
{
  return objc_msgSend(a1, "_accessibilityHandlePublicScroll:", 5);
}

- (uint64_t)_accessibilityScrollPreviousPage
{
  return objc_msgSend(a1, "_accessibilityHandlePublicScroll:", 6);
}

- (uint64_t)_accessibilityScrollUpPage:()AXPrivCategory
{
  return objc_msgSend(a1, "_accessibilityScrollPageInDirection:shouldSendScrollFailed:", 3, a3);
}

- (uint64_t)_accessibilityScrollDownPage:()AXPrivCategory
{
  return objc_msgSend(a1, "_accessibilityScrollPageInDirection:shouldSendScrollFailed:", 4, a3);
}

- (id)_accessibilityScrollParent
{
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__2;
  v8 = __Block_byref_object_dispose__2;
  v9 = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54__NSObject_AXPrivCategory___accessibilityScrollParent__block_invoke;
  v3[3] = &unk_1E3DFE4A0;
  v3[4] = &v4;
  objc_msgSend(a1, "_accessibilityIterateScrollParentsUsingBlock:", v3);
  v1 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v1;
}

- (double)_accessibilityZoomScale
{
  return 0.0;
}

- (double)_accessibilityFontSize
{
  return 0.0;
}

- (double)_accessibilityViewAlpha
{
  return 0.0;
}

- (BOOL)_accessibilityFrameSupportsMediaAnalysis
{
  double v2;
  CGFloat v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  CGFloat width;
  double height;
  double v12;
  double MaxX;
  CGFloat v14;
  _BOOL8 result;
  double MinX;
  double MaxY;
  double MinY;
  CGFloat x;
  CGFloat y;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  objc_msgSend(a1, "_axScreenBoundsForBoundsCheck");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(a1, "_axFrameForBoundsCheck:", 0);
  width = v21.size.width;
  height = v21.size.height;
  v12 = v21.size.width / 3.0;
  x = v21.origin.x;
  y = v21.origin.y;
  MaxX = CGRectGetMaxX(v21);
  v22.origin.x = v3;
  v22.origin.y = v5;
  v22.size.width = v7;
  v22.size.height = v9;
  v14 = CGRectGetMaxX(v22);
  result = 0;
  if (MaxX - v14 <= v12)
  {
    v23.origin.y = y;
    v23.origin.x = x;
    v23.size.width = width;
    v23.size.height = height;
    MinX = CGRectGetMinX(v23);
    v24.origin.x = v3;
    v24.origin.y = v5;
    v24.size.width = v7;
    v24.size.height = v9;
    if (MinX - CGRectGetMinX(v24) < -v12)
      return 0;
    v25.origin.x = x;
    v25.origin.y = y;
    v25.size.width = width;
    v25.size.height = height;
    MaxY = CGRectGetMaxY(v25);
    v26.origin.x = v3;
    v26.origin.y = v5;
    v26.size.width = v7;
    v26.size.height = v9;
    if (MaxY - CGRectGetMaxY(v26) <= height / 3.0)
    {
      v27.origin.x = x;
      v27.origin.y = y;
      v27.size.width = width;
      v27.size.height = height;
      MinY = CGRectGetMinY(v27);
      v28.origin.x = v3;
      v28.origin.y = v5;
      v28.size.width = v7;
      v28.size.height = v9;
      return MinY - CGRectGetMinY(v28) >= -(height / 3.0);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (uint64_t)_accessibilityUserDefinedMediaAnalysisOptions
{
  return objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("AXUserDefinedMediaAnalysisOptionsKey"));
}

- (uint64_t)_accessibilitySetUserDefinedMediaAnalysisOptions:()AXPrivCategory
{
  return objc_msgSend(a1, "_accessibilitySetRetainedValue:forKey:", a3, CFSTR("AXUserDefinedMediaAnalysisOptionsKey"));
}

- (uint64_t)_accessibilityMediaAnalysisOptions
{
  void *v2;
  void *v3;
  unsigned int v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a1, "_accessibilityUserDefinedMediaAnalysisOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "unsignedLongValue");
  }
  else if (objc_msgSend(a1, "_accessibilityIsGroupedParent"))
  {
    v4 = 0;
  }
  else
  {
    v4 = 40959;
  }
  objc_msgSend(a1, "_accessibilityBrailleMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = v4 | 0x100000;
  else
    v6 = v4;

  return v6;
}

- (uint64_t)_accessibilityEffectiveMediaAnalysisOptions
{
  uint64_t v2;

  v2 = objc_msgSend(a1, "_accessibilityMediaAnalysisOptions");
  if ((v2 & 0x8000) != 0)
  {
    if (objc_msgSend(a1, "_accessibilityFrameSupportsMediaAnalysis"))
      return v2;
    else
      return v2 & 0xFFFF7FFF;
  }
  return v2;
}

- (uint64_t)_accessibilityMediaAnalysisFrame
{
  return objc_msgSend(a1, "_accessibilityVisibleFrame:", 0);
}

- (uint64_t)_accessibilityElementHasImage
{
  return 0;
}

- (uint64_t)_accessibility2DBrailleCanvasElement
{
  return objc_msgSend(a1, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_299_0, 1);
}

- (uint64_t)_accessibilityCanBeConsideredMediaAnalysisElement
{
  uint64_t v2;
  double v3;
  double v4;
  uint64_t result;
  char v7;

  v2 = objc_msgSend(a1, "accessibilityTraits");
  if ((*MEMORY[0x1E0CEB128] & v2) == 0)
    return 0;
  objc_msgSend(a1, "accessibilityFrame");
  if (v4 < *MEMORY[0x1E0CF3330] || v3 < *MEMORY[0x1E0CF3328])
    return 0;
  v7 = objc_opt_respondsToSelector();
  if ((v7 & 1) == 0)
    return 1;
  result = objc_msgSend(a1, "_accessibilityViewIsVisible");
  if ((_DWORD)result)
    return 1;
  return result;
}

- (id)_accessibilityMediaAnalysisElement
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a1, "_accessibilityFindSubviewDescendant:", &__block_literal_global_303);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = a1;
  v4 = v2;

  return v4;
}

- (uint64_t)_accessibilityPHAssetLocalIdentifier
{
  return 0;
}

- (uint64_t)_accessibilityIsPHAssetLocallyAvailable
{
  return 0;
}

- (uint64_t)_accessibilityPhotoLibraryURL
{
  return 0;
}

- (uint64_t)accessibilityContainerElements
{
  return 0;
}

- (uint64_t)_accessibilitySetUsesScrollParentForOrdering:()AXPrivCategory
{
  return objc_msgSend(a1, "_accessibilitySetBoolValue:forKey:", a3, CFSTR("AXUsesScrollParentForOrderingKey"));
}

- (uint64_t)_accessibilityUsesScrollParentForOrdering
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("AXUsesScrollParentForOrderingKey"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "BOOLValue");
  else
    v3 = 1;

  return v3;
}

- (BOOL)accessibilityShouldEnumerateContainerElementsArrayDirectly
{
  objc_class *v0;
  objc_method *v1;
  objc_method *v2;
  Method v4;

  if (accessibilityShouldEnumerateContainerElementsArrayDirectly_onceToken != -1)
    dispatch_once(&accessibilityShouldEnumerateContainerElementsArrayDirectly_onceToken, &__block_literal_global_306);
  v0 = (objc_class *)objc_opt_class();
  v1 = (objc_method *)accessibilityShouldEnumerateContainerElementsArrayDirectly_elementsBaseMethod;
  if (v1 == class_getInstanceMethod(v0, sel__accessibilityElements))
    return 0;
  v2 = (objc_method *)accessibilityShouldEnumerateContainerElementsArrayDirectly_elementsCountBaseMethod;
  if (v2 != class_getInstanceMethod(v0, sel_accessibilityElementCount))
    return 0;
  v4 = (Method)accessibilityShouldEnumerateContainerElementsArrayDirectly_elementAtIndexBaseMethod;
  return v4 == class_getInstanceMethod(v0, sel_accessibilityElementAtIndex_);
}

- (BOOL)_accessibilityHasOrderedChildren
{
  return (objc_msgSend(a1, "isAccessibilityElement") & 1) == 0
      && objc_msgSend(a1, "accessibilityElementCount") != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)accessibilityEnumerateContainerElementsWithOptions:()AXPrivCategory usingBlock:
{
  void (**v6)(id, id, unint64_t, _BYTE *);
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  char v28;

  v6 = a4;
  v28 = 0;
  if (objc_msgSend(a1, "accessibilityShouldEnumerateContainerElementsArrayDirectly"))
  {
    objc_msgSend(a1, "_accessibilityElements");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");

    v9 = objc_msgSend(v8, "count");
    if (v9)
    {
      v10 = v9;
      v11 = v9 - 1;
      v12 = 1;
      do
      {
        if ((a3 & 2) != 0)
          v13 = v11;
        else
          v13 = v12 - 1;
        v22 = 0;
        v23 = &v22;
        v24 = 0x3032000000;
        v25 = __Block_byref_object_copy__2;
        v26 = __Block_byref_object_dispose__2;
        v27 = 0;
        v21 = v8;
        AXPerformSafeBlock();
        v14 = (id)v23[5];

        _Block_object_dispose(&v22, 8);
        if (v14)
          v6[2](v6, v14, v13, &v28);

        if (v12 >= v10)
          break;
        ++v12;
        --v11;
      }
      while (!v28);
    }

  }
  else
  {
    v15 = objc_msgSend(a1, "accessibilityElementCount");
    if (v15)
    {
      v16 = v15;
      if (v15 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v17 = v15 - 1;
        v18 = 1;
        do
        {
          if ((a3 & 2) != 0)
            v19 = v17;
          else
            v19 = v18 - 1;
          objc_msgSend(a1, "accessibilityElementAtIndex:", v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
            v6[2](v6, v20, v19, &v28);

          if (v18 >= v16)
            break;
          ++v18;
          --v17;
        }
        while (!v28);
      }
    }
  }

}

- (void)accessibilityEnumerateContainerElementsUsingBlock:()AXPrivCategory
{
  uint64_t v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(a1, "_accessibilityHitTestReverseOrder"))
    v4 = 2;
  else
    v4 = 0;
  objc_msgSend(a1, "accessibilityEnumerateContainerElementsWithOptions:usingBlock:", v4, v5);

}

- (id)_accessibilityContainingParentForOrdering
{
  void *v2;
  BOOL PossiblyNilObjectForKey;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v11;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p-_axContainingParentForOrdering"), a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  PossiblyNilObjectForKey = _AXServerCacheGetPossiblyNilObjectForKey(v2, &v11);
  v4 = v11;
  if (!PossiblyNilObjectForKey)
  {
    v5 = a1;

    if (v5)
    {
      v4 = v5;
      while (1)
      {
        if (objc_msgSend(v4, "shouldGroupAccessibilityChildren"))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            break;
        }
        objc_msgSend(v4, "accessibilityContainer");
        v6 = (id)objc_claimAutoreleasedReturnValue();
        if (!v6)
        {
          if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EE47FC80))
          {
            objc_msgSend(v4, "parentFocusEnvironment");
            v7 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "focusItemContainer");
            v8 = (id)objc_claimAutoreleasedReturnValue();

            if (v8 == v4)
              v9 = 0;
            else
              v9 = v8;
            v6 = v9;

          }
          else
          {
            v6 = 0;
          }
        }

        v4 = v6;
        if (!v6)
          goto LABEL_14;
      }
      _AXServerCacheInsertPossiblyNilObjectForKey(v2, v4);
    }
    else
    {
LABEL_14:
      _AXServerCacheInsertPossiblyNilObjectForKey(v2, 0);
      v4 = 0;
    }
  }

  return v4;
}

- (id)_accessibilityContainerInDirection:()AXPrivCategory
{
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v15;
  _QWORD aBlock[5];

  +[UIAccessibilityElementTraversalOptions options](UIAccessibilityElementTraversalOptions, "options");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __63__NSObject_AXPrivCategory___accessibilityContainerInDirection___block_invoke;
  aBlock[3] = &unk_1E3DFDE98;
  aBlock[4] = a1;
  v6 = _Block_copy(aBlock);
  objc_msgSend(a1, "_accessibilityFindAncestor:startWithSelf:", v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!v7)
    v7 = a1;
  objc_msgSend(v5, "setLeafNodePredicate:", v6);
  if (a3)
    v8 = 1;
  else
    v8 = 2;
  objc_msgSend(v5, "setDirection:", v8);
  objc_msgSend(v5, "setIncludeAncestorsOfSelfInSiblingMatch:", 1);
  objc_msgSend(a1, "_accessibilityOpaqueElementParent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9
    && (LOBYTE(v15) = 0,
        objc_msgSend(v9, "_accessibilityMoveFocusToNextOpaqueElementForTechnology:direction:searchType:range:shouldScrollToVisible:honorsGroups:", *MEMORY[0x1E0CEB068], objc_msgSend(v5, "direction"), 35, 0x7FFFFFFFLL, 0, 1, v15), (v10 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v11 = v10;
    objc_msgSend(v10, "_accessibilityTouchContainer");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v7, "_accessibilityElementsInDirectionWithCount:options:", 1, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "firstObject");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v12;

  return v13;
}

- (id)_accessibilityGuideElementInDirection:()AXPrivCategory
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD aBlock[5];

  +[UIAccessibilityElementTraversalOptions options](UIAccessibilityElementTraversalOptions, "options");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__NSObject_AXPrivCategory___accessibilityGuideElementInDirection___block_invoke;
  aBlock[3] = &unk_1E3DFDE98;
  aBlock[4] = a1;
  v6 = _Block_copy(aBlock);
  objc_msgSend(v5, "setLeafNodePredicate:", v6);
  if (a3)
    v7 = 1;
  else
    v7 = 2;
  objc_msgSend(v5, "setDirection:", v7);
  objc_msgSend(v5, "setIncludeAncestorsOfSelfInSiblingMatch:", 1);
  objc_msgSend(a1, "_accessibilityElementsInDirectionWithCount:options:", 1, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_accessibilityElements
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(a1, "accessibilityContainerElements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(a1, "accessibilityElements");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  objc_msgSend(a1, "_accessibilityUpdateContainerElementReferencesIfNeededForNewElements:", v4);

  return v5;
}

- (id)_accessibilityLastElementsUpdatedWithContainerElementReferences
{
  return objc_getAssociatedObject(a1, &__NSObject___accessibilityLastElementsUpdatedWithContainerElementReferences);
}

- (uint64_t)_accessibilitySetLastElementsUpdatedWithContainerElementReferences:()AXPrivCategory
{
  return __UIAccessibilitySetAssociatedObject();
}

- (void)_accessibilityUpdateContainerElementReferencesIfNeededForNewElements:()AXPrivCategory
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(a1, "_accessibilityLastElementsUpdatedWithContainerElementReferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "setAccessibilityContainer:", 0);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
    }
    while (v7);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = v4;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v14);
        if (v15 == a1)
        {
          AXLogAppAccessibility();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v26 = a1;
            _os_log_error_impl(&dword_19D0DD000, v16, OS_LOG_TYPE_ERROR, "An object shouldn't return itself in accessibilityElements. Element: %@", buf, 0xCu);
          }

        }
        else
        {
          objc_msgSend(v15, "setAccessibilityContainer:", a1);
        }
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
    }
    while (v12);
  }

  objc_msgSend(a1, "_accessibilitySetLastElementsUpdatedWithContainerElementReferences:", v10);
}

- (id)_accessibilitySwipeIsland
{
  id v1;
  uint64_t v2;
  void *v3;

  v1 = a1;
  if (v1)
  {
    while (1)
    {
      objc_msgSend(v1, "_accessibilitySwipeIslandIdentifier");
      v2 = objc_claimAutoreleasedReturnValue();
      if (v2)
        break;
      objc_msgSend(v1, "accessibilityContainer");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      v1 = v3;
      if (!v3)
        goto LABEL_7;
    }
    v3 = (void *)v2;
  }
  else
  {
    v3 = 0;
  }
LABEL_7:

  return v3;
}

- (uint64_t)_accessibilitySwipeIslandIdentifier
{
  return 0;
}

- (uint64_t)accessibilityChildrenContainerGroupingBehaviorHasOverridingParentDelegate
{
  return 0;
}

- (uint64_t)accessibilityParentDiscardsChildrenContainerGroupingBehavior
{
  return 0;
}

- (uint64_t)_accessibilitySelectedChildren
{
  return 0;
}

- (uint64_t)_accessibilityShouldPreventOpaqueScrolling
{
  return __UIAccessibilityGetAssociatedBool();
}

- (uint64_t)_accessibilitySetShouldPreventOpaqueScrolling:()AXPrivCategory
{
  return __UIAccessibilitySetAssociatedBool();
}

- (uint64_t)__accessibilitySupportsActivateAction
{
  objc_class *v2;
  uint64_t v3;
  objc_class *v4;
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  Method InstanceMethod;

  if (!__accessibilitySupportsActivateAction_BaseSupportsActivateAction)
  {
    v2 = (objc_class *)objc_opt_class();
    __accessibilitySupportsActivateAction_BaseSupportsActivateAction = (uint64_t)class_getInstanceMethod(v2, sel__accessibilitySupportsActivateAction);
  }
  v3 = objc_msgSend(a1, "_accessibilitySupportsActivateAction");
  v4 = (objc_class *)objc_opt_class();
  if ((Method)__accessibilitySupportsActivateAction_BaseSupportsActivateAction == class_getInstanceMethod(v4, sel__accessibilitySupportsActivateAction))
  {
    if (!__accessibilitySupportsActivateAction_BaseActivateAction)
    {
      v5 = (objc_class *)objc_opt_class();
      __accessibilitySupportsActivateAction_BaseActivateAction = (uint64_t)class_getInstanceMethod(v5, sel_accessibilityActivate);
      v6 = (objc_class *)objc_opt_class();
      __accessibilitySupportsActivateAction_UIControlActivateAction = (uint64_t)class_getInstanceMethod(v6, sel_accessibilityActivate);
    }
    v7 = (objc_class *)objc_opt_class();
    InstanceMethod = class_getInstanceMethod(v7, sel_accessibilityActivate);
    if (InstanceMethod == (Method)__accessibilitySupportsActivateAction_BaseActivateAction
      || __accessibilitySupportsActivateAction_UIControlActivateAction == (_QWORD)InstanceMethod)
    {
      return v3;
    }
    else
    {
      return 1;
    }
  }
  return v3;
}

- (uint64_t)_setAccessibilityHeadingLevel:()AXPrivCategory
{
  return objc_msgSend(a1, "_accessibilitySetRetainedValue:forKey:", a3, CFSTR("AXHeadingLevel"));
}

- (id)_accessibilityHeadingLevel
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a1, "_accessibilityGetBlockForAttribute:", 27);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    (*(void (**)(uint64_t))(v2 + 16))(v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
      goto LABEL_8;
  }
  else
  {
    objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("AXHeadingLevel"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5;
    if (v5)
      v6 = v5;

    if (!v4)
      goto LABEL_8;
  }
  if (objc_msgSend(v4, "integerValue") < 0)
  {
LABEL_8:

    v4 = &unk_1E3E10868;
  }

  return v4;
}

- (uint64_t)_accessibilitySupportsSecondaryActivateAction
{
  return 0;
}

- (uint64_t)_accessibilityCanPerformAction:()AXPrivCategory
{
  char *v3;
  void *v4;
  uint64_t v5;

  switch(a3)
  {
    case 2006:
      v3 = sel_accessibilityScrollDownPage;
      goto LABEL_8;
    case 2007:
      v3 = sel_accessibilityScrollUpPage;
      goto LABEL_8;
    case 2008:
      v3 = sel_accessibilityScrollRightPage;
      goto LABEL_8;
    case 2009:
      v3 = sel_accessibilityScrollLeftPage;
LABEL_8:
      objc_msgSend(a1, "_accessibilityScrollAncestorForSelector:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4 != 0;
      goto LABEL_9;
    default:
      if (a3 != 2030)
        return 1;
      objc_msgSend(a1, "_accessibilityScrollAncestor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "accessibilityScrollToTopSupported");
LABEL_9:

      return v5;
  }
}

- (uint64_t)accessibilityHeaderElements
{
  return 0;
}

- (id)_accessibilityRetrieveLinkedUIElementsFromContainerChain
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;

  v1 = a1;
  if (v1)
  {
    v2 = v1;
    while (1)
    {
      objc_msgSend(v2, "_accessibilityLinkedUIElements");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v3, "count"))
        break;
      objc_msgSend(v2, "accessibilityContainer");
      v4 = objc_claimAutoreleasedReturnValue();

      v2 = (void *)v4;
      if (!v4)
        goto LABEL_5;
    }

  }
  else
  {
LABEL_5:
    v3 = 0;
  }
  return v3;
}

- (id)_accessibilityLinkedUIElements
{
  uint64_t v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "_accessibilityGetBlockForAttribute:", 15);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
    (*(void (**)(uint64_t))(v2 + 16))(v2);
  else
    objc_msgSend(a1, "_accessibilityUserDefinedLinkedUIElements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_setAccessibilityLinkedUIElements:()AXPrivCategory
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  objc_class *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
    goto LABEL_12;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = *MEMORY[0x1E0C99778];
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "raise:format:", v12, CFSTR("accessibilityLinkedUIElements must be an NSArray. Was actually: %@"), v14);

LABEL_12:
    v5 = 0;
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "addPointer:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

LABEL_13:
  objc_setAssociatedObject(a1, &AXLinkedUIElementsIdentifier, v5, (void *)0x301);

}

- (id)_accessibilityUserDefinedLinkedUIElements
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, &AXLinkedUIElementsIdentifier);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v1, "allObjects");
    v2 = objc_claimAutoreleasedReturnValue();

    v1 = (void *)v2;
  }
  return v1;
}

- (id)_accessibilityGuideElementHeaderText
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a1, "_accessibilityGetBlockForAttribute:", 16);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    (*(void (**)(uint64_t))(v2 + 16))(v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "_accessibilityUserDefinedGuideElementHeaderText");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v4, "length"))
    {
      objc_msgSend(a1, "_accessibilityRetieveHeaderElementText");
      v5 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v5;
    }
  }

  return v4;
}

- (id)_accessibilityRetieveHeaderElementText
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;
  const __CFString *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(a1, "_accessibilityRetrieveHeaderElements");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v2)
  {
    v3 = v2;
    v4 = 0;
    v5 = *(_QWORD *)v15;
    do
    {
      v6 = 0;
      v7 = v4;
      do
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(v1);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v6);
        objc_msgSend(v8, "_iosAccessibilityAttributeValue:", 2001, v11, v12, v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "_iosAccessibilityAttributeValue:", 2006);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = CFSTR("__AXStringForVariablesSentinel");
        v11 = v9;
        __UIAXStringForVariables();
        v4 = (void *)objc_claimAutoreleasedReturnValue();

        ++v6;
        v7 = v4;
      }
      while (v3 != v6);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v14, v18, 16, v9, v12, CFSTR("__AXStringForVariablesSentinel"));
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_setAccessibilityGuideElementHeaderText:()AXPrivCategory
{
  objc_setAssociatedObject(a1, &AXGuildeElementHeaderTextIdentifier, a3, (void *)0x301);
}

- (id)_accessibilityUserDefinedGuideElementHeaderText
{
  return objc_getAssociatedObject(a1, &AXGuildeElementHeaderTextIdentifier);
}

- (uint64_t)_accessibilityVerticalScrollBarElement
{
  return 0;
}

- (uint64_t)_accessibilityOrientation
{
  return 0;
}

- (uint64_t)_accessibilityIsScrollBarIndicator
{
  return 0;
}

- (uint64_t)_accessibilityHorizontalScrollBarElement
{
  return 0;
}

- (uint64_t)_accessibilitySupportsDirectioOrbManipulation
{
  return 1;
}

- (uint64_t)accessibilityPlaceholderValue
{
  return objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("accessibilityPlaceholderValue"));
}

- (uint64_t)accessibilityLinkedElement
{
  return 0;
}

- (uint64_t)_accessibilitySupportGesturesAttributes
{
  return 0;
}

- (uint64_t)_accessibilityAlwaysOrderedFirst
{
  return 0;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "_accessibilityGetBlockForAttribute:", 17);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (BOOL)_accessibilityCanPerformEscapeAction
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "_accessibilityGetBlockForAttribute:", 25);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (uint64_t)_accessibilityElementShouldBeInvalid
{
  return 0;
}

- (uint64_t)axContainerTypeFromUIKitContainerType:()AXPrivCategory
{
  if ((a3 & 0xFFFFFFF0) != 0)
    return 0;
  else
    return qword_19D142DC0[a3];
}

- (uint64_t)beaxContainerTypeFromUIKitContainerType:()AXPrivCategory
{
  return a3 & 0x7FF | (((a3 >> 11) & 1) << 15);
}

- (id)_axAncestorTypes
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__2;
  v12 = __Block_byref_object_dispose__2;
  objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("AXContainerAncestorTypeKey"));
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v2 = (void *)v9[5];
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v9[5];
    v9[5] = v3;

    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __44__NSObject_AXPrivCategory___axAncestorTypes__block_invoke;
    v7[3] = &unk_1E3DFE648;
    v7[4] = a1;
    v7[5] = &v8;
    objc_msgSend(a1, "accessibilityEnumerateAncestorsUsingBlock:", v7);
    objc_msgSend(a1, "_accessibilitySetRetainedValue:forKey:", v9[5], CFSTR("AXContainerAncestorTypeKey"));
    v2 = (void *)v9[5];
  }
  v5 = v2;
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)_accessibilityAncestorForSiblingsWithType:()AXPrivCategory
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "_axAncestorTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "objectEnumerator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (BOOL)_accessibilitySiblingWithAncestor:()AXPrivCategory isFirst:isLast:sawAXElement:
{
  id v10;
  void *v11;
  uint64_t v12;
  _BOOL8 v13;
  _QWORD v15[7];
  char v16;
  char v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v10 = a3;
  v11 = v10;
  if (v10)
  {
    v18 = 0;
    v19 = &v18;
    v20 = 0x2020000000;
    v21 = 0;
    if (a4)
      v12 = 0;
    else
      v12 = 2;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __90__NSObject_AXPrivCategory___accessibilitySiblingWithAncestor_isFirst_isLast_sawAXElement___block_invoke;
    v15[3] = &unk_1E3DFE670;
    v15[4] = a1;
    v15[5] = &v18;
    v15[6] = a6;
    v16 = a4;
    v17 = a5;
    objc_msgSend(v10, "accessibilityEnumerateContainerElementsWithOptions:usingBlock:", v12, v15);
    v13 = *((_BYTE *)v19 + 24) != 0;
    _Block_object_dispose(&v18, 8);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (uint64_t)_accessibilitySiblingWithAncestor:()AXPrivCategory isFirst:isLast:
{
  char v6;

  v6 = 0;
  return objc_msgSend(a1, "_accessibilitySiblingWithAncestor:isFirst:isLast:sawAXElement:", a3, a4, a5, &v6);
}

- (uint64_t)_accessibilityIsFirstSibling
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "_accessibilityAncestorForSiblingsWithType:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "_accessibilitySiblingWithAncestor:isFirst:isLast:", v2, 1, 0);

  return v3;
}

- (uint64_t)_accessibilityIsLastSibling
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "_accessibilityAncestorForSiblingsWithType:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "_accessibilitySiblingWithAncestor:isFirst:isLast:", v2, 0, 1);

  return v3;
}

- (uint64_t)_accessibilityIsFirstSiblingForType:()AXPrivCategory
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "_accessibilityAncestorForSiblingsWithType:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "_accessibilitySiblingWithAncestor:isFirst:isLast:", v2, 1, 0);

  return v3;
}

- (uint64_t)_accessibilityIsLastSiblingForType:()AXPrivCategory
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "_accessibilityAncestorForSiblingsWithType:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "_accessibilitySiblingWithAncestor:isFirst:isLast:", v2, 0, 1);

  return v3;
}

- (uint64_t)_accessibilityIsTitleElement
{
  return 0;
}

- (uint64_t)_accessibilityAlwaysSpeakTableHeaders
{
  return 0;
}

- (uint64_t)_accessibilityIsInAppSwitcher
{
  return 0;
}

- (uint64_t)_accessibilityIsInFolder
{
  return 0;
}

- (uint64_t)_accessibilityHasBadge
{
  return 0;
}

- (id)_accessibilityContainerTypes
{
  id v1;
  _QWORD v3[6];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  id v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3032000000;
  v7 = __Block_byref_object_copy__2;
  v8 = __Block_byref_object_dispose__2;
  v9 = 0;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __56__NSObject_AXPrivCategory___accessibilityContainerTypes__block_invoke;
  v3[3] = &unk_1E3DFE648;
  v3[4] = a1;
  v3[5] = &v4;
  objc_msgSend(a1, "accessibilityEnumerateAncestorsUsingBlock:", v3);
  v1 = (id)v5[5];
  _Block_object_dispose(&v4, 8);

  return v1;
}

- (uint64_t)_accessibilityLaunchableApps
{
  return 0;
}

- (uint64_t)_accessibilityAppSwitcherApps
{
  return 0;
}

- (uint64_t)_accessibilitySupportsMultipleCustomRotorTitles
{
  return 1;
}

- (uint64_t)_allowCustomActionHintSpeakOverride
{
  return 1;
}

- (BOOL)_accessibilityIsUserInteractionEnabled
{
  uint64_t v1;

  v1 = objc_msgSend(a1, "accessibilityTraits");
  return (*MEMORY[0x1E0CEB148] & v1) == 0;
}

- (uint64_t)_acceessibilityUIKitIsUserInteractionDisabled
{
  return 0;
}

- (float)_accessibilityActivationDelay
{
  return 0.025;
}

- (uint64_t)accessibilitySecondaryLabel
{
  return 0;
}

- (uint64_t)accessibilityMathMLSource
{
  return 0;
}

- (uint64_t)_accessibilityShouldSpeakMathEquationTrait
{
  return 1;
}

- (uint64_t)_accessibilityShouldExpandMathEquation
{
  return 1;
}

- (uint64_t)_accessibilityIsMathTouchExplorationView
{
  return 0;
}

- (uint64_t)accessibilityMathEquation
{
  return 0;
}

- (uint64_t)_accessibilityBundleIdentifier
{
  return objc_msgSend((id)*MEMORY[0x1E0CEB258], "_accessibilityBundleIdentifier");
}

- (uint64_t)_accessibilityRuntimeElementTransactionSummary
{
  return objc_msgSend(MEMORY[0x1E0CF40D8], "transactionSummary");
}

- (uint64_t)_accessibilityLastHitTestNearBorder
{
  return 0;
}

- (uint64_t)accessibilityFlowToElements
{
  return 0;
}

- (uint64_t)accessibilityErrorMessageElements
{
  return 0;
}

- (uint64_t)accessibilityBlockquoteLevel
{
  return 0;
}

- (uint64_t)_accessibilityOpaqueElementProvider
{
  return 0;
}

- (uint64_t)_accessibilityOverridesInstructionsHint
{
  return 0;
}

- (uint64_t)_accessibilityViewController
{
  return 0;
}

- (id)_accessibilityCurrentStatus
{
  void *v2;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a1, "safeStringForKey:", CFSTR("browserAccessibilityCurrentStatus"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (uint64_t)_accessibilityBannerIsSticky
{
  return 0;
}

- (uint64_t)_accessibilityCanDisplayMultipleControllers
{
  return 0;
}

- (uint64_t)accessibilityARIARowIndex
{
  return 0x7FFFFFFFLL;
}

- (uint64_t)accessibilityARIAColumnIndex
{
  return 0x7FFFFFFFLL;
}

- (uint64_t)accessibilityRowCount
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "_accessibilityGetBlockForAttribute:", 47);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)v1;
  if (v1)
  {
    (*(void (**)(uint64_t))(v1 + 16))(v1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "unsignedIntegerValue");

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (uint64_t)accessibilityColumnCount
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a1, "_accessibilityGetBlockForAttribute:", 46);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)v1;
  if (v1)
  {
    (*(void (**)(uint64_t))(v1 + 16))(v1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "unsignedIntegerValue");

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (uint64_t)accessibilityARIARowCount
{
  return 0;
}

- (uint64_t)accessibilityARIAColumnCount
{
  return 0;
}

- (id)_accessibilityInternalTextLinks
{
  int v2;
  void *v3;
  void *v4;
  id v5;
  unint64_t v7;
  UIAccessibilityLinkSubelement *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  UIAccessibilityLinkSubelement *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = 1;
  }
  else
  {
    objc_opt_class();
    v2 = objc_opt_isKindOfClass() & 1;
  }
  objc_opt_class();
  if (!(v2 | objc_opt_isKindOfClass() & 1))
    return 0;
  objc_msgSend(a1, "safeValueForKey:", CFSTR("attributedText"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("AXLinks"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = v4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_accessibilitySetRetainedValue:forKey:");
      v30 = 0;
      v31 = 0;
      v29 = objc_msgSend(v3, "length");
      v7 = 0;
      v8 = 0;
      v9 = *MEMORY[0x1E0CEA0C0];
      while (1)
      {
        objc_msgSend(v3, "attributesAtIndex:effectiveRange:", v7, &v30);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v30 == 0x7FFFFFFFFFFFFFFFLL)
          break;
        objc_msgSend(v10, "objectForKey:", v9);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          if (v8
            && (v13 = -[UIAccessibilityLinkSubelement range](v8, "range"), v13 + v14 == v30)
            && (-[UIAccessibilityLinkSubelement url](v8, "url"),
                v15 = (void *)objc_claimAutoreleasedReturnValue(),
                v16 = objc_msgSend(v15, "isEqual:", v12),
                v15,
                v16))
          {
            v17 = -[UIAccessibilityLinkSubelement range](v8, "range");
            v18 = v31 + v30;
            v19 = v18 - -[UIAccessibilityLinkSubelement range](v8, "range");
            v20 = v8;
            -[UIAccessibilityLinkSubelement setRange:](v20, "setRange:", v17, v19);
            objc_msgSend(v3, "string");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = -[UIAccessibilityLinkSubelement range](v20, "range");
            objc_msgSend(v21, "substringWithRange:", v22, v23);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIAccessibilityLinkSubelement setAccessibilityLabel:](v20, "setAccessibilityLabel:", v24);

          }
          else
          {
            v20 = -[UIAccessibilityLinkSubelement initWithAccessibilityContainer:]([UIAccessibilityLinkSubelement alloc], "initWithAccessibilityContainer:", a1);
            -[UIAccessibilityLinkSubelement setRange:](v20, "setRange:", v30, v31);
            objc_msgSend(v3, "string");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "substringWithRange:", v30, v31);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[UIAccessibilityLinkSubelement setAccessibilityLabel:](v20, "setAccessibilityLabel:", v26);

            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              -[UIAccessibilityLinkSubelement setUrl:](v20, "setUrl:", v12);
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v12);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                -[UIAccessibilityLinkSubelement setUrl:](v20, "setUrl:", v27);

              }
            }
            objc_msgSend(v28, "addObject:", v20);
          }

          v8 = v20;
        }
        v30 += v31;
        v31 = 0;

        v7 = v30;
        if (v30 == 0x7FFFFFFFFFFFFFFFLL || v30 >= v29)
          goto LABEL_27;
      }

LABEL_27:
      v5 = v28;

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_accessibilityInternalTextLinkCustomRotors
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_accessibilityInternalTextLinks");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("LinkRotor"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      objc_initWeak(&location, a1);
      v4 = objc_alloc(MEMORY[0x1E0CEA288]);
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __70__NSObject_AXPrivCategory___accessibilityInternalTextLinkCustomRotors__block_invoke;
      v8[3] = &unk_1E3DFE698;
      objc_copyWeak(&v10, &location);
      v9 = v2;
      v3 = (void *)objc_msgSend(v4, "initWithSystemType:itemSearchBlock:", 1, v8);
      objc_msgSend(a1, "_accessibilityInternalTextLinks");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setLinkCount:", objc_msgSend(v5, "count"));

      objc_msgSend(a1, "_accessibilitySetRetainedValue:forKey:", v3, CFSTR("LinkRotor"));
      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
    v12[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_accessibilityActiveKeyboard
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;

  AXUIKeyboardWindow();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA6C8], "activeKeyboard");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    objc_msgSend(v3, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 == v2)
    {
      v8 = v4;
      goto LABEL_12;
    }
    _UIApplicationIsExtension();
  }
  else
  {
    if (_UIApplicationIsExtension())
    {
      NSClassFromString(CFSTR("UIInputView"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)*MEMORY[0x1E0CEB258], "_accessibilityWindows");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __56__NSObject_AXPrivCategory___accessibilityActiveKeyboard__block_invoke;
      v19[3] = &unk_1E3DFDE98;
      v20 = v6;
      v7 = v6;
      objc_msgSend(v2, "_accessibilityFindSubviewDescendant:", v19);
      v8 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_12;
    }
    objc_msgSend((id)*MEMORY[0x1E0CEB258], "_accessibilityMainWindow");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  NSClassFromString(CFSTR("_UIRemoteView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("_UIRemoteKeyboardPlaceholderView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __56__NSObject_AXPrivCategory___accessibilityActiveKeyboard__block_invoke_2;
  v16[3] = &unk_1E3DFE6C0;
  v17 = v9;
  v18 = v10;
  v11 = v10;
  v12 = v9;
  objc_msgSend(v2, "_accessibilityFindDescendant:", v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13 == a1)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v13, "_accessibilityActiveKeyboard");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_12:
  return v8;
}

- (id)_accessibilityAccessibleDescendants
{
  void *v2;
  void *v3;

  +[UIAccessibilityElementTraversalOptions options](UIAccessibilityElementTraversalOptions, "options");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLeafNodePredicate:", &__block_literal_global_465);
  objc_msgSend(a1, "_accessibilityLeafDescendantsWithOptions:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_accessibilityWatchAutoSpeakElements
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  +[UIAccessibilityElementTraversalOptions options](UIAccessibilityElementTraversalOptions, "options");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLeafNodePredicate:", &__block_literal_global_466);
  objc_msgSend(a1, "_accessibilityParentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_accessibilityLeafDescendantsWithOptions:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  AXLogCommon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v7;
    _os_log_impl(&dword_19D0DD000, v6, OS_LOG_TYPE_INFO, "total auto speak elements: %@", (uint8_t *)&v9, 0xCu);

  }
  return v5;
}

- (id)_accessibilityStringForLabelKeyValues:()AXPrivCategory
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR(","));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v11), "stringByTrimmingCharactersInSet:", v5, (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "safeValueForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "axSafelyAddObject:", v13);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  UIAXLabelForElements(v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_accessibilityAccessibleAncestor
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "accessibilityContainer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    do
    {
      if ((objc_msgSend(v1, "isAccessibilityElement") & 1) != 0)
        break;
      objc_msgSend(v1, "accessibilityContainer");
      v2 = objc_claimAutoreleasedReturnValue();

      v1 = (void *)v2;
    }
    while (v2);
  }
  return v1;
}

- (uint64_t)_accessibilityIsSoftwareKeyboardMimic
{
  return 0;
}

- (uint64_t)_accessibilitySoftwareMimicKeyboard
{
  return objc_msgSend(a1, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_471, 1);
}

- (uint64_t)_accessibilityIsDictating
{
  return 0;
}

- (id)_accessibilityPrivateCustomActionsElement
{
  return objc_getAssociatedObject(a1, &__NSObjectAccessibility___accessibilityPrivateCustomActionsElement);
}

- (uint64_t)_accessibilitySetPrivateCustomActionsElement:()AXPrivCategory
{
  return __UIAccessibilitySetAssociatedObject();
}

- (uint64_t)_privateAccessibilityCustomActions
{
  return 0;
}

- (uint64_t)_accessibilityPerformLegacyCustomAction:()AXPrivCategory
{
  return objc_msgSend(a1, "accessibilityPerformCustomAction:", objc_msgSend(a3, "actionIndex"));
}

- (id)_retrieveCustomActionsForElement:()AXPrivCategory
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  uint64_t i;
  void *v9;
  UIAccessibilityLegacyCustomAction *v10;
  void *v11;

  objc_msgSend(a1, "_accessibilitySetPrivateCustomActionsElement:");
  objc_msgSend(a1, "_privateAccessibilityCustomActions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilitySetPrivateCustomActionsElement:", 0);
  objc_msgSend(a1, "accessibilityCustomActions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  objc_msgSend(v3, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      for (i = 0; i != v4; ++i)
      {
        objc_msgSend(v3, "objectAtIndexedSubscript:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "length"))
        {
          v10 = -[UIAccessibilityLegacyCustomAction initWithName:target:selector:]([UIAccessibilityLegacyCustomAction alloc], "initWithName:target:selector:", v9, a1, sel__accessibilityPerformLegacyCustomAction_);
          -[UIAccessibilityLegacyCustomAction setActionIndex:](v10, "setActionIndex:", i);
          objc_msgSend(v7, "addObject:", v10);

        }
      }
    }

  }
  else
  {
    v7 = v3;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "axArrayWithPossiblyNilArrays:", 2, v2, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_accessibilityCustomActions
{
  void (**v2)(void *, void *);
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD aBlock[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__2;
  v21 = __Block_byref_object_dispose__2;
  v22 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__NSObject_AXPrivCategory___accessibilityCustomActions__block_invoke;
  aBlock[3] = &unk_1E3DFE728;
  aBlock[4] = &v17;
  v2 = (void (**)(void *, void *))_Block_copy(aBlock);
  v3 = a1;
  v4 = v3;
  if (v3)
  {
    v5 = v3;
    do
    {
      objc_msgSend(v5, "_retrieveCustomActionsForElement:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v2[2](v2, v6);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CEABB8], "viewControllerForView:", v5);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "_retrieveCustomActionsForElement:", v4);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        v2[2](v2, v8);
      }
      else
      {
        v8 = v6;
      }
      v9 = objc_msgSend(v4, "_accessibilityShouldIncludeParentCustomActions");

      if (!v9)
        break;
      objc_msgSend(v5, "accessibilityContainer");
      v10 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v10;
    }
    while (v10);

  }
  objc_msgSend(v4, "_accessibilityAddToDragSessionCustomAction");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
  {
    v23[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v2[2](v2, v13);

  }
  objc_msgSend((id)v18[5], "sortUsingComparator:", &__block_literal_global_477);
  v14 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v14;
}

- (uint64_t)_accessibilityRespondsToUserInteraction
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  char v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v3 = v1;
    while ((objc_msgSend(v3, "_accessibilityRespondsToUserInteractionForElement:", v2) & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CEABB8], "viewControllerForView:", v3);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v4, "_accessibilityRespondsToUserInteractionForElement:", v2);

        if ((v5 & 1) != 0)
          break;
      }
      objc_msgSend(v3, "accessibilityContainer");
      v6 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v6;
      if (!v6)
        goto LABEL_10;
    }
    LODWORD(v6) = 1;
LABEL_10:

  }
  else
  {
    LODWORD(v6) = 0;
  }
  objc_msgSend(v2, "_accessibilityAddToDragSessionCustomAction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = 1;
  else
    v8 = v6;

  return v8;
}

- (BOOL)_accessibilityRespondsToUserInteractionForElement:()AXPrivCategory
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "_retrieveCustomActionsForElement:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "count") != 0;

  return v2;
}

- (uint64_t)_accessibilityRemoveTrait:()AXPrivCategory
{
  return objc_msgSend(a1, "setAccessibilityTraits:", objc_msgSend(a1, "accessibilityTraits") & ~a3);
}

- (uint64_t)_accessibilityAddTrait:()AXPrivCategory
{
  return objc_msgSend(a1, "setAccessibilityTraits:", objc_msgSend(a1, "accessibilityTraits") | a3);
}

- (BOOL)_accessibilityIsTouchContainer
{
  uint64_t v2;

  v2 = objc_msgSend(a1, "accessibilityTraits");
  return (UIAccessibilityTraitTouchContainer & ~v2) == 0
      || objc_msgSend(a1, "accessibilityContainerType") == 4
      || objc_msgSend(a1, "accessibilityContainerType") == 14;
}

- (uint64_t)_accessibilityUserDefinedIsGuideElement
{
  return __UIAccessibilityGetAssociatedBool();
}

- (uint64_t)_accessibilitySetUserDefinedIsGuideElement:()AXPrivCategory
{
  return __UIAccessibilitySetAssociatedBool();
}

- (uint64_t)_accessibilityIsGuideElement
{
  _BOOL8 v2;
  void *v3;
  uint64_t v4;
  void *v5;

  if ((objc_msgSend(a1, "_accessibilityUserDefinedIsGuideElement") & 1) != 0)
    return 1;
  objc_msgSend(a1, "accessibilityContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    do
    {
      if (objc_msgSend(v3, "accessibilityContainerType") == 3)
        break;
      objc_msgSend(v3, "accessibilityContainer");
      v4 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v4;
    }
    while (v4);
  }
  if (objc_msgSend(v3, "accessibilityContainerType") == 3)
  {
    objc_msgSend(v3, "_accessibilityFindElementInDirection:searchType:allowOutOfBoundsChild:", 1, 0, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = v5 == a1;

  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (BOOL)_accessibilityIsMap
{
  uint64_t v1;

  v1 = objc_msgSend(a1, "accessibilityTraits");
  return (UIAccessibilityTraitMap & ~v1) == 0;
}

- (uint64_t)_accessibilityTouchContainer
{
  return objc_msgSend(a1, "_accessibilityTouchContainerStartingWithSelf:", 1);
}

- (uint64_t)_accessibilityWindowSections
{
  return 0;
}

- (id)_accessibilityTouchContainerStartingWithSelf:()AXPrivCategory
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a1;
  v5 = v4;
  if ((a3 & 1) == 0)
  {
    objc_msgSend(v4, "accessibilityContainer");
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }
  if (v5)
  {
    do
    {
      if ((objc_msgSend(v5, "_accessibilityIsTouchContainer") & 1) != 0)
        break;
      objc_msgSend(v5, "accessibilityContainer");
      v7 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v7;
    }
    while (v7);
  }
  return v5;
}

- (uint64_t)accessibilitySupportsTextSelection
{
  return 0;
}

- (uint64_t)_accessibilityTouchContainerShouldOutputBraille
{
  return 0;
}

- (id)_accessibilityImageData
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("AXAssetName"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0CEA638], "imageNamed:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (uint64_t)_accessibilityVisiblePointHonorsScreenBounds
{
  return 0;
}

- (uint64_t)_accessibilityHitTestShouldUseWindowBounds
{
  return 0;
}

- (double)accessibilityVisibleContentRect
{
  void *v1;
  void *v2;
  double v3;
  double v4;
  void *v5;
  double v6;

  objc_msgSend(a1, "_accessibilityVisibleFrameClippingAncestor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "accessibilityFrame");
    v4 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    v4 = v6;

  }
  return v4;
}

- (uint64_t)_accessibilityVisiblePoint
{
  return objc_msgSend(a1, "_accessibilityVisiblePointHitTestingAnyElement:", AXDoesRequestingClientDeserveAutomation() != 0);
}

- (uint64_t)_accessibilityElementIsBeingHitTested
{
  return objc_msgSend(a1, "_accessibilityBoolValueForKey:", CFSTR("AXPerformingVisiblePointHitTest"));
}

- (uint64_t)_accessibilityMarkElementForVisiblePointHitTest:()AXPrivCategory
{
  _AXUIElementSetElementBeingHitTested();
  return objc_msgSend(a1, "_accessibilitySetBoolValue:forKey:", a3, CFSTR("AXPerformingVisiblePointHitTest"));
}

- (double)_accessibilityVisiblePointHitTestingAnyElement:()AXPrivCategory
{
  void (*v5)(void);
  void *v6;
  void *v7;
  int v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  double v16;
  NSObject *v17;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  NSObject *v23;
  void (*v25)(void);
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  CGFloat v32;
  void *v33;
  CGFloat v34;
  void *v35;
  CGFloat v36;
  void *v37;
  CGFloat v38;
  void *v39;
  void *v40;
  CGFloat v41;
  void *v42;
  void *v43;
  CGFloat v44;
  void *v45;
  void *v46;
  CGFloat v47;
  void *v48;
  void *v49;
  CGFloat v50;
  void *v51;
  void *v52;
  void *v53;
  NSObject *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  uint64_t v61;
  double v62;
  double v63;
  double v64;
  const void *v65;
  uint64_t i;
  void *v67;
  double v68;
  double v69;
  CGFloat v71;
  double v72;
  CGFloat v73;
  double v74;
  CGFloat v75;
  double v76;
  double v77;
  NSObject *v78;
  void *v79;
  void *v80;
  void *v81;
  NSObject *v82;
  void *v83;
  void *v84;
  void *v85;
  NSObject *v86;
  void *v87;
  NSObject *v88;
  NSObject *v89;
  NSObject *v90;
  void *v91;
  NSObject *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  int v100;
  CGFloat v101;
  CGFloat v102;
  double v103;
  double v104;
  uint64_t v105;
  CFTypeRef cf;
  void *v107;
  void *v108;
  double v109;
  id obja;
  id obj;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  CFTypeRef cf2;
  uint8_t v117[128];
  uint8_t buf[4];
  void *v119;
  __int16 v120;
  void *v121;
  __int16 v122;
  void *v123;
  _QWORD v124[15];
  NSPoint v125;
  NSPoint v126;
  NSPoint v127;
  NSPoint v128;
  CGPoint v129;
  CGPoint v130;
  CGRect v131;
  CGRect v132;
  CGRect v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;
  CGRect v138;
  CGRect v139;
  CGRect v140;
  CGRect v141;
  CGRect v142;
  CGRect v143;
  CGRect v144;
  CGRect v145;
  CGRect v146;
  CGRect v147;
  CGRect v148;
  CGRect v149;
  CGRect v150;
  CGRect v151;
  NSRect v152;
  CGRect v153;
  NSRect v154;
  CGRect v155;

  v124[12] = *MEMORY[0x1E0C80C00];
  if (!__AXRuntimeApplicationElement())
  {
    if (a1)
      goto LABEL_3;
LABEL_10:
    objc_msgSend(a1, "accessibilityFrame");
    x = v132.origin.x;
    y = v132.origin.y;
    width = v132.size.width;
    height = v132.size.height;
    MidX = CGRectGetMidX(v132);
    v133.origin.x = x;
    v133.origin.y = y;
    v133.size.width = width;
    v133.size.height = height;
    CGRectGetMidY(v133);
    return MidX;
  }
  v5 = (void (*)(void))__AXRuntimeApplicationElement();
  v5();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == a1)
    goto LABEL_10;
LABEL_3:
  if ((_UIAXObjectIsCompletelyBehindKeyboard(a1) & 1) != 0)
    return -1.0;
  objc_msgSend(a1, "_accessibilityMarkElementForVisiblePointHitTest:", 1);
  objc_msgSend(a1, "_accessibilityUserTestingProxyView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_accessibilityMarkElementForVisiblePointHitTest:", 1);

  v8 = objc_msgSend(a1, "_accessibilityContextId");
  objc_msgSend(a1, "_accessibilityDisplayId");
  objc_msgSend(a1, "accessibilityFrame");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  cf = (CFTypeRef)_AXRetrieveExistingAXUIElementWithElement();
  if (!cf)
  {
    AXLogUIA();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v119 = a1;
      _os_log_impl(&dword_19D0DD000, v23, OS_LOG_TYPE_INFO, "Element has been removed as an ax element skipping: %@", buf, 0xCu);
    }

    return -1.0;
  }
  v131.origin.x = v10;
  v131.origin.y = v12;
  v131.size.width = v14;
  v131.size.height = v16;
  if (CGRectIsEmpty(v131))
  {
    AXLogUIA();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v119 = a1;
      _os_log_impl(&dword_19D0DD000, v17, OS_LOG_TYPE_INFO, "Element has empty frame, skipping: %@", buf, 0xCu);
    }

    CFRelease(cf);
    return -1.0;
  }
  if (__AXRuntimeApplicationElement())
  {
    v25 = (void (*)(void))__AXRuntimeApplicationElement();
    v25();
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = _AXCreateAXUIElementWithElement();

  }
  else
  {
    v105 = _AXCreateAXUIElementWithElement();
  }
  cf2 = 0;
  objc_msgSend(a1, "accessibilityVisibleContentRect");
  v103 = v134.size.width;
  v104 = v134.origin.x;
  v101 = v134.size.height;
  v102 = v134.origin.y;
  v155.origin.x = v10;
  v155.origin.y = v12;
  v155.size.width = v14;
  v155.size.height = v16;
  CGRectIntersection(v134, v155);
  v107 = (void *)MEMORY[0x1E0C99E40];
  v27 = (void *)MEMORY[0x1E0CB3B18];
  objc_msgSend(a1, "_accessibilityStartingPointForIsVisible");
  objc_msgSend(v27, "valueWithPoint:");
  obja = (id)objc_claimAutoreleasedReturnValue();
  v124[0] = obja;
  v28 = (void *)MEMORY[0x1E0CB3B18];
  objc_msgSend(a1, "accessibilityActivationPoint");
  objc_msgSend(v28, "valueWithPoint:");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  v124[1] = v108;
  v29 = (void *)MEMORY[0x1E0CB3B18];
  AX_CGRectGetCenter();
  objc_msgSend(v29, "valueWithPoint:");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  v124[2] = v99;
  v30 = (void *)MEMORY[0x1E0CB3B18];
  AX_CGRectGetCenter();
  objc_msgSend(v30, "valueWithPoint:");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v124[3] = v98;
  v31 = (void *)MEMORY[0x1E0CB3B18];
  v135.origin.x = v10;
  v135.origin.y = v12;
  v135.size.width = v14;
  v135.size.height = v16;
  v32 = CGRectGetMinX(v135) + v14 * 0.100000001;
  v136.origin.x = v10;
  v136.origin.y = v12;
  v136.size.width = v14;
  v136.size.height = v16;
  objc_msgSend(v31, "valueWithPoint:", v32, CGRectGetMinY(v136) + v16 * 0.100000001);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v124[4] = v97;
  v33 = (void *)MEMORY[0x1E0CB3B18];
  v137.origin.x = v10;
  v137.origin.y = v12;
  v137.size.width = v14;
  v137.size.height = v16;
  v34 = CGRectGetMinX(v137) + v14 * 0.100000001;
  v138.origin.x = v10;
  v138.origin.y = v12;
  v138.size.width = v14;
  v138.size.height = v16;
  objc_msgSend(v33, "valueWithPoint:", v34, CGRectGetMaxY(v138) - v16 * 0.100000001);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v124[5] = v96;
  v35 = (void *)MEMORY[0x1E0CB3B18];
  v139.origin.x = v10;
  v139.origin.y = v12;
  v139.size.width = v14;
  v139.size.height = v16;
  v36 = CGRectGetMaxX(v139) - v14 * 0.100000001;
  v140.origin.x = v10;
  v140.origin.y = v12;
  v140.size.width = v14;
  v140.size.height = v16;
  objc_msgSend(v35, "valueWithPoint:", v36, CGRectGetMinY(v140) + v16 * 0.100000001);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v124[6] = v95;
  v37 = (void *)MEMORY[0x1E0CB3B18];
  v141.origin.x = v10;
  v141.origin.y = v12;
  v141.size.width = v14;
  v141.size.height = v16;
  v38 = CGRectGetMaxX(v141) - (v14 + 0.100000001);
  v142.origin.x = v10;
  v142.origin.y = v12;
  v142.size.width = v14;
  v142.size.height = v16;
  objc_msgSend(v37, "valueWithPoint:", v38, CGRectGetMaxY(v142) - v16 * 0.100000001);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v124[7] = v39;
  v40 = (void *)MEMORY[0x1E0CB3B18];
  v143.origin.x = v10;
  v143.origin.y = v12;
  v143.size.width = v14;
  v143.size.height = v16;
  v41 = CGRectGetMinX(v143) + 1.0;
  v144.origin.x = v10;
  v144.origin.y = v12;
  v144.size.width = v14;
  v144.size.height = v16;
  objc_msgSend(v40, "valueWithPoint:", v41, CGRectGetMinY(v144) + 1.0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v124[8] = v42;
  v43 = (void *)MEMORY[0x1E0CB3B18];
  v145.origin.x = v10;
  v145.origin.y = v12;
  v145.size.width = v14;
  v145.size.height = v16;
  v44 = CGRectGetMinX(v145) + 1.0;
  v146.origin.x = v10;
  v146.origin.y = v12;
  v146.size.width = v14;
  v146.size.height = v16;
  objc_msgSend(v43, "valueWithPoint:", v44, CGRectGetMaxY(v146) + -1.0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v124[9] = v45;
  v46 = (void *)MEMORY[0x1E0CB3B18];
  v147.origin.x = v10;
  v147.origin.y = v12;
  v147.size.width = v14;
  v147.size.height = v16;
  v47 = CGRectGetMaxX(v147) + -1.0;
  v148.origin.x = v10;
  v148.origin.y = v12;
  v148.size.width = v14;
  v148.size.height = v16;
  objc_msgSend(v46, "valueWithPoint:", v47, CGRectGetMinY(v148) + 1.0);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v124[10] = v48;
  v49 = (void *)MEMORY[0x1E0CB3B18];
  v149.origin.x = v10;
  v149.origin.y = v12;
  v149.size.width = v14;
  v149.size.height = v16;
  v50 = CGRectGetMaxX(v149) + -1.0;
  v150.origin.x = v10;
  v150.origin.y = v12;
  v150.size.width = v14;
  v150.size.height = v16;
  objc_msgSend(v49, "valueWithPoint:", v50, CGRectGetMaxY(v150) + -1.0);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v124[11] = v51;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v124, 12);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "orderedSetWithArray:", v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  if (_AXSAutomationEnabled())
  {
    AXLogUIA();
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
    {
      UIAXMassageElementDescription(a1);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "accessibilityContainer");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_accessibilityWindow");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138478339;
      v119 = v55;
      v120 = 2112;
      v121 = v56;
      v122 = 2112;
      v123 = v57;
      _os_log_impl(&dword_19D0DD000, v54, OS_LOG_TYPE_INFO, "Performing visible point test: %{private}@, parent: %@, window: %@", buf, 0x20u);

    }
  }
  v114 = 0u;
  v115 = 0u;
  v112 = 0u;
  v113 = 0u;
  obj = v53;
  v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v112, v117, 16);
  if (v58)
  {
    v59 = v58;
    v60 = a3;
    v61 = *(_QWORD *)v113;
    v62 = *MEMORY[0x1E0C9D538];
    v63 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    v64 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v109 = *MEMORY[0x1E0C9D820];
    v100 = v60;
    v65 = (const void *)v105;
    while (2)
    {
      for (i = 0; i != v59; ++i)
      {
        if (*(_QWORD *)v113 != v61)
          objc_enumerationMutation(obj);
        v67 = *(void **)(*((_QWORD *)&v112 + 1) + 8 * i);
        objc_msgSend(v67, "pointValue");
        if (v62 != v68 || v63 != v69)
        {
          v71 = v69;
          if (v68 < 5.0)
            v68 = 5.0;
          if (v68 >= v103 + v104 + -5.0)
            MidX = v103 + v104 + -5.0;
          else
            MidX = v68;
          objc_msgSend(a1, "_accessibilityConvertSystemBoundedScreenRectToContextSpace:", MidX, v69, v109, v64);
          v73 = v72;
          v75 = v74;
          if (v8)
          {
            AXConvertPointFromHostedCoordinates();
            v73 = v76;
            v75 = v77;
          }
          if (_AXSAutomationEnabled())
            _AXSMossdeepEnabled();
          AXLogUIA();
          v78 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
          {
            UIAXMassageElementDescription(a1);
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            v125.x = v73;
            v125.y = v75;
            NSStringFromPoint(v125);
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "pointValue");
            NSStringFromPoint(v126);
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v119 = v79;
            v120 = 2112;
            v121 = v80;
            v122 = 2112;
            v123 = v81;
            _os_log_impl(&dword_19D0DD000, v78, OS_LOG_TYPE_INFO, "Trying pt[%@]: %@ (original: %@)", buf, 0x20u);

            v65 = (const void *)v105;
          }

          if (objc_msgSend(a1, "_accessibilityVisiblePointHonorsScreenBounds"))
          {
            v151.size.width = v103;
            v151.origin.x = v104;
            v151.size.height = v101;
            v151.origin.y = v102;
            v129.x = MidX;
            v129.y = v71;
            if (!CGRectContainsPoint(v151, v129))
            {
              AXLogUIA();
              v82 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
              {
                v152.size.width = v103;
                v152.origin.x = v104;
                v152.size.height = v101;
                v152.origin.y = v102;
                NSStringFromRect(v152);
                v83 = (void *)objc_claimAutoreleasedReturnValue();
                v127.x = MidX;
                v127.y = v71;
                NSStringFromPoint(v127);
                v84 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v119 = v83;
                v120 = 2112;
                v121 = v84;
                _os_log_impl(&dword_19D0DD000, v82, OS_LOG_TYPE_INFO, "skipping point check not within screen bounds: %@ %@", buf, 0x16u);

                v65 = (const void *)v105;
              }

            }
          }
          _AXUIElementCopyElementAtPositionWithParams();
          if (cf2)
          {
            if (CFEqual(cf, cf2))
            {
              AXLogUIA();
              v89 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_19D0DD000, v89, OS_LOG_TYPE_INFO, "Element matched start element", buf, 2u);
              }

              if (cf2)
              {
                CFRelease(cf2);
                cf2 = 0;
              }
              goto LABEL_77;
            }
            _UIAXElementForAXUIElementRef();
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            AXLogUIA();
            v86 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v119 = v85;
              _os_log_impl(&dword_19D0DD000, v86, OS_LOG_TYPE_INFO, "Hit testing found: %@", buf, 0xCu);
            }

            if (objc_msgSend(v85, "_accessibilityIsDescendantOfElement:", a1))
            {
              AXLogUIA();
              v90 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v90, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v119 = a1;
                _os_log_impl(&dword_19D0DD000, v90, OS_LOG_TYPE_INFO, "Is descendant of desired element: %@", buf, 0xCu);
              }

              if (cf2)
              {
                CFRelease(cf2);
                cf2 = 0;
              }
              goto LABEL_76;
            }
            if (v100)
            {
              objc_msgSend(a1, "_accessibilityUserTestingVisibleAncestor");
              v87 = (void *)objc_claimAutoreleasedReturnValue();
              AXLogUIA();
              v88 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v88, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v119 = v87;
                _os_log_impl(&dword_19D0DD000, v88, OS_LOG_TYPE_INFO, "Checking visible ancestor %@", buf, 0xCu);
              }

              if (v87 && objc_msgSend(v85, "_accessibilityIsDescendantOfElement:", v87))
              {
                if (cf2)
                {
                  CFRelease(cf2);
                  cf2 = 0;
                }

LABEL_76:
                goto LABEL_77;
              }

            }
            if (cf2)
            {
              CFRelease(cf2);
              cf2 = 0;
            }
          }
        }
      }
      v59 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v112, v117, 16);
      if (v59)
        continue;
      break;
    }
    v71 = -1.0;
    MidX = -1.0;
  }
  else
  {
    v71 = -1.0;
    MidX = -1.0;
    v65 = (const void *)v105;
  }
LABEL_77:

  objc_msgSend(a1, "_accessibilityMarkElementForVisiblePointHitTest:", 0);
  objc_msgSend(a1, "_accessibilityUserTestingProxyView");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v91, "_accessibilityMarkElementForVisiblePointHitTest:", 0);

  if (MidX >= 0.0)
  {
    if (objc_msgSend(a1, "_accessibilityVisiblePointHonorsScreenBounds"))
    {
      v153.size.width = v103;
      v153.origin.x = v104;
      v153.size.height = v101;
      v153.origin.y = v102;
      v130.x = MidX;
      v130.y = v71;
      if (!CGRectContainsPoint(v153, v130))
      {
        AXLogUIA();
        v92 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v92, OS_LOG_TYPE_INFO))
        {
          v154.size.width = v103;
          v154.origin.x = v104;
          v154.size.height = v101;
          v154.origin.y = v102;
          NSStringFromRect(v154);
          v93 = (void *)objc_claimAutoreleasedReturnValue();
          v128.x = MidX;
          v128.y = v71;
          NSStringFromPoint(v128);
          v94 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v119 = v93;
          v120 = 2112;
          v121 = v94;
          _os_log_impl(&dword_19D0DD000, v92, OS_LOG_TYPE_INFO, "visible point not within screen bounds: %@ %@", buf, 0x16u);

        }
        MidX = -1.0;
      }
    }
  }
  CFRelease(cf);
  if (v65)
    CFRelease(v65);

  return MidX;
}

- (uint64_t)_accessibilityIsVisibleByCompleteHitTest
{
  return objc_msgSend(a1, "_accessibilityIsVisibleByCompleteHitTest:", 1);
}

- (BOOL)_accessibilityIsVisibleByCompleteHitTest:()AXPrivCategory
{
  NSObject *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;
  NSPoint v20;

  v19 = *MEMORY[0x1E0C80C00];
  if ((void *)*MEMORY[0x1E0CEB258] == a1)
    return objc_msgSend(a1, "applicationState") == 0;
  if (a3 && (_UIAXObjectIsCompletelyBehindKeyboard(a1) & 1) != 0)
    return 0;
  AXLogUIA();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    UIAXMassageElementDescription(a1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138477827;
    v16 = v6;
    _os_log_impl(&dword_19D0DD000, v5, OS_LOG_TYPE_INFO, "Checking visibility for %{private}@", (uint8_t *)&v15, 0xCu);

  }
  objc_msgSend(a1, "_accessibilityVisiblePoint");
  v8 = v7;
  v10 = v9;
  AXLogUIA();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v20.x = v8;
    v20.y = v10;
    NSStringFromPoint(v20);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    UIAXMassageElementDescription(a1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412546;
    v16 = v12;
    v17 = 2112;
    v18 = v13;
    _os_log_impl(&dword_19D0DD000, v11, OS_LOG_TYPE_INFO, "Received visible point %@ for %@{private}", (uint8_t *)&v15, 0x16u);

  }
  v14 = v8 != -1.0;
  if (v10 != -1.0)
    v14 = 1;
  return v8 > 0.0 && v14;
}

- (uint64_t)_accessibilityIsStarkElement
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(a1, "window");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v4)
        return 0;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        return 0;
      objc_msgSend(a1, "_accessibilityParentView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v2 = v4;
    v3 = objc_msgSend(v4, "_accessibilityIsStarkElement");
    goto LABEL_9;
  }
  objc_msgSend(a1, "screen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_isCarScreen");
LABEL_9:
  v5 = v3;

  return v5;
}

- (uint64_t)_accessibilityServesAsFirstElement
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "accessibilityUserDefinedServesAsFirstElement");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (void)_setAccessibilityServesAsFirstElement:()AXPrivCategory
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilitySetRetainedValue:forKey:", v2, CFSTR("_AX_ServesAsFirstElement"));

}

- (uint64_t)_accessibilityIsNotFirstElement
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "accessibilityUserDefinedNotFirstElement");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (void)_setAccessibilityIsNotFirstElement:()AXPrivCategory
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilitySetRetainedValue:forKey:", v2, CFSTR("_AX_NotFirstElement"));

}

- (id)_accessibilityFirstElementForFocusHonoringGroups:()AXPrivCategory
{
  void *v4;
  void *v5;

  if ((a3 & 1) != 0)
  {
    +[UIAccessibilityElementTraversalOptions defaultVoiceOverOptionsHonoringGroups](UIAccessibilityElementTraversalOptions, "defaultVoiceOverOptionsHonoringGroups");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_accessibilityFirstElementForFocusWithOptions:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "_accessibilityFirstElementForFocus");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)_accessibilityFirstElementForFocus
{
  void *v3;
  void *v4;

  if (__62__NSObject_AXPrivCategory___accessibilityFirstElementForFocus__block_invoke())
    return 0;
  +[UIAccessibilityElementTraversalOptions defaultVoiceOverOptions](UIAccessibilityElementTraversalOptions, "defaultVoiceOverOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilityFirstElementForFocusWithOptions:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_accessibilityFirstElementForFocusWithOptions:()AXPrivCategory
{
  void *v2;

  if (__74__NSObject_AXPrivCategory___accessibilityFirstElementForFocusWithOptions___block_invoke())
  {
    objc_msgSend(a1, "_accessibilityFirstOpaqueElement");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (uint64_t)_accessibilityFirstElement
{
  return 0;
}

- (id)_accessibilityFirstDescendant
{
  void *v2;
  void *v3;
  void *v4;

  +[UIAccessibilityElementTraversalOptions defaultVoiceOverOptions](UIAccessibilityElementTraversalOptions, "defaultVoiceOverOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilityLeafDescendantsWithCount:options:", 1, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_accessibilityFirstWebElement
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  +[UIAccessibilityElementTraversalOptions defaultVoiceOverOptions](UIAccessibilityElementTraversalOptions, "defaultVoiceOverOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "leafNodePredicate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__NSObject_AXPrivCategory___accessibilityFirstWebElement__block_invoke;
  v8[3] = &unk_1E3DFE7D0;
  v9 = v3;
  v4 = v3;
  objc_msgSend(v2, "setLeafNodePredicate:", v8);
  objc_msgSend(a1, "_accessibilityLeafDescendantsWithCount:options:", 1, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_accessibilityFirstContainedElementForTechnology:()AXPrivCategory honoringGroups:shouldAlwaysScroll:
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void *v19;
  void *v20;
  id v21;

  v8 = a3;
  if (objc_msgSend(a1, "isAccessibilityOpaqueElementProvider"))
  {
    objc_msgSend(a1, "_accessibilityFocusAbsoluteFirstLastOpaqueElement:technology:honorsGroups:shouldAlwaysScroll:", 1, v8, a4, a5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[UIAccessibilityElementTraversalOptions defaultVoiceOverOptions](UIAccessibilityElementTraversalOptions, "defaultVoiceOverOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)a4)
    {
      +[UIAccessibilityElementTraversalOptions defaultVoiceOverOptionsHonoringGroups](UIAccessibilityElementTraversalOptions, "defaultVoiceOverOptionsHonoringGroups");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "leafNodePredicate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = MEMORY[0x1E0C809B0];
      v17 = 3221225472;
      v18 = __111__NSObject_AXPrivCategory___accessibilityFirstContainedElementForTechnology_honoringGroups_shouldAlwaysScroll___block_invoke;
      v19 = &unk_1E3DFE7F8;
      v20 = a1;
      v21 = v12;
      v13 = v12;
      objc_msgSend(v11, "setLeafNodePredicate:", &v16);

      v10 = v11;
    }
    objc_msgSend(a1, "_accessibilityLeafDescendantsWithCount:options:", 1, v10, v16, v17, v18, v19, v20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (id)_accessibilityFirstElementsForSpeakThis
{
  objc_class *v2;
  void *v3;
  void *v4;
  void *v5;

  if (_accessibilityFirstElementsForSpeakThis_onceToken != -1)
    dispatch_once(&_accessibilityFirstElementsForSpeakThis_onceToken, &__block_literal_global_493);
  v2 = (objc_class *)objc_opt_class();
  if (class_getInstanceMethod(v2, sel__accessibilitySpeakThisElementsAndStrings) == (Method)_accessibilityFirstElementsForSpeakThis_speakThisElementsBaseMethod)
  {
    +[UIAccessibilityElementTraversalOptions defaultSpeakScreenOptions](UIAccessibilityElementTraversalOptions, "defaultSpeakScreenOptions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_accessibilityLeafDescendantsWithCount:options:", 5, v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "_accessibilitySpeakThisElementsAndStrings");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "mutableCopy");

    objc_msgSend(v4, "addObject:", CFSTR("SpeakThis-LegacyMethodWasUsed"));
  }
  return v4;
}

- (id)_accessibilitySpeakThisLeafDescendants
{
  void *v2;
  void *v3;

  +[UIAccessibilityElementTraversalOptions defaultSpeakScreenOptions](UIAccessibilityElementTraversalOptions, "defaultSpeakScreenOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilityLeafDescendantsWithOptions:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_accessibilityNextElementsForSpeakThis
{
  objc_class *v2;
  Method InstanceMethod;
  void *v4;
  void *v5;
  objc_class *v6;
  Method v7;
  void *v8;
  void *v10;

  if (_accessibilityNextElementsForSpeakThis_onceToken != -1)
    dispatch_once(&_accessibilityNextElementsForSpeakThis_onceToken, &__block_literal_global_498);
  v2 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v2, sel__accessibilitySpeakThisElementsAndStrings);
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_accessibilitySpeakThisViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (objc_class *)objc_opt_class();
  v7 = class_getInstanceMethod(v6, sel__accessibilitySpeakThisElementsAndStrings);
  if (InstanceMethod == (Method)_accessibilityNextElementsForSpeakThis_speakThisElementsBaseMethod
    && (!v5 || v7 == (Method)_accessibilityNextElementsForSpeakThis_speakThisElementsVCBaseMethod))
  {
    +[UIAccessibilityElementTraversalOptions defaultSpeakScreenOptions](UIAccessibilityElementTraversalOptions, "defaultSpeakScreenOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_accessibilityElementsInDirectionWithCount:options:", 5, v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_accessibilityPerformPublicCustomRotorSearch:()AXPrivCategory searchDirection:currentItem:
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void (**v12)(_QWORD, _QWORD);
  void *v13;

  v7 = a5;
  objc_msgSend((id)RotorCache, "objectForKey:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8
    && (objc_msgSend(v8, "itemSearchBlock"), v10 = (void *)objc_claimAutoreleasedReturnValue(), v10, v10))
  {
    v11 = objc_alloc_init(MEMORY[0x1E0CEA298]);
    objc_msgSend(v11, "setCurrentItem:", v7);
    objc_msgSend(v11, "setSearchDirection:", a4);
    objc_msgSend(v9, "itemSearchBlock");
    v12 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v12)[2](v12, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (const)_accessibilityRotorTypeStringForCustomRotor:()AXPrivCategory
{
  if (a3 < 0x13)
    return (const __CFString *)qword_1E3DFF3B0[a3];
  if (UIAccessibilityCustomSystemRotorTypePlainText == a3)
    return CFSTR("AXCustomSystemRotorTypePlainText");
  if (UIAccessibilityCustomSystemRotorTypeColorChange == a3)
    return CFSTR("AXCustomSystemRotorTypeColorChange");
  if (UIAccessibilityCustomSystemRotorTypeFontChange == a3)
    return CFSTR("AXCustomSystemRotorTypeFontChange");
  if (UIAccessibilityCustomSystemRotorTypeStyleChange == a3)
    return CFSTR("AXCustomSystemRotorTypeStyleChange");
  if (UIAccessibilityCustomSystemRotorTypeNonVisitedLink == a3)
    return CFSTR("AXCustomSystemRotorTypeNonVisitedLink");
  if (UIAccessibilityCustomSystemRotorTypeSearchField == a3)
    return CFSTR("AXCustomSystemRotorTypeSearchField");
  if (UIAccessibilityCustomSystemRotorTypeButton == a3)
    return CFSTR("AXCustomSystemRotorTypeButton");
  if (UIAccessibilityCustomSystemRotorTypeStaticText == a3)
    return CFSTR("AXCustomSystemRotorTypeStaticText");
  if (UIAccessibilityCustomSystemRotorTypeBlockquote == a3)
    return CFSTR("AXCustomSystemRotorTypeBlockquote");
  if (UIAccessibilityCustomSystemRotorTypeSameHeading == a3)
    return CFSTR("AXCustomSystemRotorTypeSameHeading");
  if (UIAccessibilityCustomSystemRotorTypeFrame == a3)
    return CFSTR("AXCustomSystemRotorTypeFrame");
  if (UIAccessibilityCustomSystemRotorTypeSameBlockquote == a3)
    return CFSTR("AXCustomSystemRotorTypeSameBlockquote");
  if (UIAccessibilityCustomSystemRotorTypeControlElement == a3)
    return CFSTR("AXCustomSystemRotorTypeControlElement");
  if (UIAccessibilityCustomSystemRotorTypeArticle == a3)
    return CFSTR("AXCustomSystemRotorTypeArticle");
  return 0;
}

- (uint64_t)_accessibilityCustomRotorTypeForString:()AXPrivCategory
{
  id v3;
  uint64_t v4;
  uint64_t *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AXCustomSystemRotorTypeLink")) & 1) != 0)
  {
    v4 = 1;
    goto LABEL_62;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AXCustomSystemRotorTypeHeading")) & 1) != 0)
  {
    v4 = 3;
    goto LABEL_62;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AXCustomSystemRotorTypeHeadingLevel1")) & 1) != 0)
  {
    v4 = 4;
    goto LABEL_62;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AXCustomSystemRotorTypeHeadingLevel2")) & 1) != 0)
  {
    v4 = 5;
    goto LABEL_62;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AXCustomSystemRotorTypeHeadingLevel3")) & 1) != 0)
  {
    v4 = 6;
    goto LABEL_62;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AXCustomSystemRotorTypeHeadingLevel4")) & 1) != 0)
  {
    v4 = 7;
    goto LABEL_62;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AXCustomSystemRotorTypeHeadingLevel5")) & 1) != 0)
  {
    v4 = 8;
    goto LABEL_62;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AXCustomSystemRotorTypeHeadingLevel6")) & 1) != 0)
  {
    v4 = 9;
    goto LABEL_62;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AXCustomSystemRotorTypeBoldText")) & 1) != 0)
  {
    v4 = 10;
    goto LABEL_62;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AXCustomSystemRotorTypeItalicText")) & 1) != 0)
  {
    v4 = 11;
    goto LABEL_62;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AXCustomSystemRotorTypeUnderlineText")) & 1) != 0)
  {
    v4 = 12;
    goto LABEL_62;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AXCustomSystemRotorTypeMisspelledWord")) & 1) != 0)
  {
    v4 = 13;
    goto LABEL_62;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AXCustomSystemRotorTypeImage")) & 1) != 0)
  {
    v4 = 14;
    goto LABEL_62;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AXCustomSystemRotorTypeTextField")) & 1) != 0)
  {
    v4 = 15;
    goto LABEL_62;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AXCustomSystemRotorTypeTable")) & 1) != 0)
  {
    v4 = 16;
    goto LABEL_62;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AXCustomSystemRotorTypeList")) & 1) != 0)
  {
    v4 = 17;
    goto LABEL_62;
  }
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("AXCustomSystemRotorTypeLandmark")) & 1) != 0)
  {
    v4 = 18;
    goto LABEL_62;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("AXCustomSystemRotorTypePlainText")))
  {
    v5 = &UIAccessibilityCustomSystemRotorTypePlainText;
LABEL_61:
    v4 = *v5;
    goto LABEL_62;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("AXCustomSystemRotorTypeColorChange")))
  {
    v5 = &UIAccessibilityCustomSystemRotorTypeColorChange;
    goto LABEL_61;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("AXCustomSystemRotorTypeFontChange")))
  {
    v5 = &UIAccessibilityCustomSystemRotorTypeFontChange;
    goto LABEL_61;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("AXCustomSystemRotorTypeStyleChange")))
  {
    v5 = &UIAccessibilityCustomSystemRotorTypeStyleChange;
    goto LABEL_61;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("AXCustomSystemRotorTypeControlElement")))
  {
    v5 = &UIAccessibilityCustomSystemRotorTypeControlElement;
    goto LABEL_61;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("AXCustomSystemRotorTypeNonVisitedLink")))
  {
    v5 = &UIAccessibilityCustomSystemRotorTypeNonVisitedLink;
    goto LABEL_61;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("AXCustomSystemRotorTypeSearchField")))
  {
    v5 = &UIAccessibilityCustomSystemRotorTypeSearchField;
    goto LABEL_61;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("AXCustomSystemRotorTypeButton")))
  {
    v5 = &UIAccessibilityCustomSystemRotorTypeButton;
    goto LABEL_61;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("AXCustomSystemRotorTypeStaticText")))
  {
    v5 = &UIAccessibilityCustomSystemRotorTypeStaticText;
    goto LABEL_61;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("AXCustomSystemRotorTypeBlockquote")))
  {
    v5 = &UIAccessibilityCustomSystemRotorTypeBlockquote;
    goto LABEL_61;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("AXCustomSystemRotorTypeSameHeading")))
  {
    v5 = &UIAccessibilityCustomSystemRotorTypeSameHeading;
    goto LABEL_61;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("AXCustomSystemRotorTypeFrame")))
  {
    v5 = &UIAccessibilityCustomSystemRotorTypeFrame;
    goto LABEL_61;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("AXCustomSystemRotorTypeSameBlockquote")))
  {
    v5 = &UIAccessibilityCustomSystemRotorTypeSameBlockquote;
    goto LABEL_61;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("AXCustomSystemRotorTypeArticle")))
    v4 = UIAccessibilityCustomSystemRotorTypeArticle;
  else
    v4 = 0;
LABEL_62:

  return v4;
}

- (id)_accessibilityPublicCustomRotorIdForSystemType:()AXPrivCategory
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(a1, "_accessibilityCustomRotorTypeForString:");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend((id)RotorCache, "allValues", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v8, "targetElement");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(a1, "_accessibilityIsDescendantOfElement:", v9))
        {
          v10 = objc_msgSend(v8, "systemRotorType");

          if (v10 == v2)
          {
            objc_msgSend(v8, "uuid");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_13;
          }
        }
        else
        {

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }
  v11 = 0;
LABEL_13:

  return v11;
}

- (id)accessibilityHeaderElementsForColumn:()AXPrivCategory
{
  uint64_t v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "_accessibilityGetBlockForAttribute:", 50);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_accessibilityHeaderElementsForColumn:()AXPrivCategory
{
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__NSObject_AXPrivCategory___accessibilityHeaderElementsForColumn___block_invoke;
  v5[3] = &unk_1E3DFE478;
  v5[4] = &v6;
  v5[5] = a3;
  objc_msgSend(a1, "accessibilityEnumerateAncestorsUsingBlock:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (id)accessibilityHeaderElementsForRow:()AXPrivCategory
{
  uint64_t v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "_accessibilityGetBlockForAttribute:", 51);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
  {
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_accessibilityHeaderElementsForRow:()AXPrivCategory
{
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  v11 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__NSObject_AXPrivCategory___accessibilityHeaderElementsForRow___block_invoke;
  v5[3] = &unk_1E3DFE478;
  v5[4] = &v6;
  v5[5] = a3;
  objc_msgSend(a1, "accessibilityEnumerateAncestorsUsingBlock:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (uint64_t)_accessibilityPublicCustomRotorVisibleInTouchRotor:()AXPrivCategory
{
  void *v0;
  uint64_t v1;

  objc_msgSend((id)RotorCache, "objectForKey:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "visibleInTouchRotor");

  return v1;
}

- (id)_accessibilityPublicCustomRotorName:()AXPrivCategory
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend((id)RotorCache, "objectForKey:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityAXAttributedName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(a1, "_accessibilityRotorTypeStringForCustomRotor:", objc_msgSend(v2, "systemRotorType"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (uint64_t)_accessibilityPublicCustomRotorLinkCount:()AXPrivCategory
{
  void *v0;
  uint64_t v1;

  objc_msgSend((id)RotorCache, "objectForKey:");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "linkCount");

  return v1;
}

- (void)_addPublicRotorsToArray:()AXPrivCategory forElement:
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  void *v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "view");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v6;
  }
  v8 = v7;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v21 = v6;
  objc_msgSend(v6, "accessibilityCustomRotors");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(v14, "uuid");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v14, "uuid");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v5, "containsObject:", v16);

          if ((v17 & 1) != 0)
            continue;
          v18 = (void *)RotorCache;
          objc_msgSend(v14, "uuid");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKey:", v14, v19);

          objc_msgSend(v14, "setTargetElement:", v8);
          objc_msgSend(v14, "uuid");
          v20 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v20);
        }
        else
        {
          AXLogAppAccessibility();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v27 = v14;
            _os_log_error_impl(&dword_19D0DD000, v20, OS_LOG_TYPE_ERROR, "UIAccessibilityCustomRotor: no UUID? %@", buf, 0xCu);
          }
        }

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v28, 16);
    }
    while (v11);
  }

}

- (id)_accessibilityPublicCustomRotors
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  void *v9;

  if (_accessibilityPublicCustomRotors_onceToken != -1)
    dispatch_once(&_accessibilityPublicCustomRotors_onceToken, &__block_literal_global_565);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = a1;
  v4 = v3;
  if (v3)
  {
    v5 = v3;
    do
    {
      objc_msgSend(v4, "_addPublicRotorsToArray:forElement:", v2, v5);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CEABB8], "viewControllerForView:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "_addPublicRotorsToArray:forElement:", v2, v6);

      }
      objc_msgSend(v5, "_accessibilityContainerForAccumulatingCustomRotorItems");
      v7 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v7;
    }
    while (v7);
  }
  v8 = (_QWORD *)MEMORY[0x1E0CEB258];
  objc_msgSend((id)*MEMORY[0x1E0CEB258], "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_addPublicRotorsToArray:forElement:", v2, v9);

  objc_msgSend(v4, "_addPublicRotorsToArray:forElement:", v2, *v8);
  return v2;
}

- (id)_accessibilityCustomActionNamesAndIdentifiers
{
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  UIImage *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  const char *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v41;
  id v43;
  _QWORD v44[2];
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _QWORD v49[2];
  _QWORD v50[2];
  uint8_t buf[4];
  void *v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_accessibilityCustomActions");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v1, "count"))
  {
    v43 = 0;
    goto LABEL_32;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v1, "count"));
  v43 = (id)objc_claimAutoreleasedReturnValue();
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v41 = v1;
  v2 = v1;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
  if (!v3)
    goto LABEL_30;
  v4 = v3;
  v5 = *(_QWORD *)v46;
  do
  {
    v6 = 0;
    do
    {
      if (*(_QWORD *)v46 != v5)
        objc_enumerationMutation(v2);
      v7 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v6);
      objc_msgSend(v7, "_accessibilityAXAttributedName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "length");

      if (!v9)
      {
        AXLogCommon();
        v15 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
          goto LABEL_25;
        *(_DWORD *)buf = 138543362;
        v52 = a1;
        v33 = v15;
        v34 = "UIAccessibilityCustomAction must have a name. Object: %{public}@";
        goto LABEL_18;
      }
      if (objc_msgSend(v7, "selector")
        || (objc_msgSend(v7, "actionHandler"), v10 = (void *)objc_claimAutoreleasedReturnValue(), v10, v10))
      {
        v11 = (void *)MEMORY[0x1E0C99E08];
        v49[0] = CFSTR("CustomActionName");
        objc_msgSend(v7, "_accessibilityAXAttributedName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v49[1] = CFSTR("CustomActionIdentifier");
        v50[0] = v12;
        objc_msgSend(v7, "_accessibilityCustomActionIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v50[1] = v13;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 2);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "dictionaryWithDictionary:", v14);
        v15 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "image");
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend(v7, "image");
          v17 = (UIImage *)objc_claimAutoreleasedReturnValue();
          UIImagePNGRepresentation(v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v18, CFSTR("CustomActionImage"));

          v19 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v7, "image");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "numberWithInteger:", objc_msgSend(v20, "imageOrientation"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v21, CFSTR("CustomActionImageOrientation"));

        }
        v22 = (void *)MEMORY[0x1E0CB3B18];
        objc_msgSend(v7, "activationPoint");
        v44[0] = v23;
        v44[1] = v24;
        objc_msgSend(v22, "valueWithBytes:objCType:", v44, "{CGPoint=dd}");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v25, CFSTR("CustomActionActivationPoint"));

        objc_msgSend(v7, "_shortName");
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (v26)
        {
          objc_msgSend(v7, "_shortName");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v27, CFSTR("CustomActionShortName"));

        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "ignoreWhenVoiceOverTouches"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v28, CFSTR("CustomActionIgnoreWhenVoiceOverTouches"));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v7, "shouldPersistActionMenu"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v29, CFSTR("CustomActionShouldPersistActionMenu"));

        objc_msgSend(v7, "category");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "length");

        if (v31)
        {
          objc_msgSend(v7, "category");
          v32 = objc_claimAutoreleasedReturnValue();
          goto LABEL_21;
        }
        objc_msgSend(v7, "localizedActionRotorCategory");
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        if (v35)
        {
          objc_msgSend(v7, "localizedActionRotorCategory");
          v32 = objc_claimAutoreleasedReturnValue();
LABEL_21:
          v36 = (void *)v32;
          -[NSObject setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v32, CFSTR("CustomActionCategoryName"));

        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v7, "sortPriority"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v37, CFSTR("CustomActionSortPriority"));

        objc_msgSend(v7, "accessibilityLanguage");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        if (v38)
          -[NSObject setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v38, CFSTR("CustomActionLanguage"));
        objc_msgSend(v43, "addObject:", v15);

        goto LABEL_25;
      }
      AXLogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543362;
        v52 = a1;
        v33 = v15;
        v34 = "UIAccessibilityCustomAction must have a selector or handler. Object: %{public}@";
LABEL_18:
        _os_log_fault_impl(&dword_19D0DD000, v33, OS_LOG_TYPE_FAULT, v34, buf, 0xCu);
      }
LABEL_25:

      ++v6;
    }
    while (v4 != v6);
    v39 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v45, v53, 16);
    v4 = v39;
  }
  while (v39);
LABEL_30:

  v1 = v41;
LABEL_32:

  return v43;
}

- (uint64_t)_accessibilityFirstVisibleItem
{
  return 0;
}

- (id)_accessibilityVisibleItemInList
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_accessibilityScrollAncestor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_accessibilityFirstVisibleItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)_setAccessibilityUpdatesOnActivationAfterDelay:()AXPrivCategory
{
  return objc_msgSend(a1, "_accessibilitySetBoolValue:forKey:", a3, CFSTR("UIAccessibilityStorageKeyUpdatesOnActivationAfterDelay"));
}

- (double)_accessibilityDelayBeforeUpdatingOnActivation
{
  int v1;
  double result;
  _BOOL4 IsVoiceOverRunning;

  v1 = objc_msgSend(a1, "_accessibilityUpdatesOnActivationAfterDelay");
  result = 0.0;
  if (v1)
  {
    IsVoiceOverRunning = UIAccessibilityIsVoiceOverRunning();
    result = 0.1;
    if (IsVoiceOverRunning)
      return 0.5;
  }
  return result;
}

- (uint64_t)_accessibilityUpdatesOnActivationAfterDelay
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("UIAccessibilityStorageKeyUpdatesOnActivationAfterDelay"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "BOOLValue");
  }
  else
  {
    v5 = objc_msgSend(a1, "accessibilityTraits");
    v4 = (*MEMORY[0x1E0CEB188] & v5) != 0
      && (v6 = objc_msgSend(a1, "accessibilityTraits"), (*MEMORY[0x1E0CF4678] & v6) != 0)
      || ((*MEMORY[0x1E0CEB100] | *MEMORY[0x1E0CEB190]) & v5) != 0;
  }

  return v4;
}

- (uint64_t)_accessibilityUseElementAtPositionAfterActivation
{
  return 0;
}

- (uint64_t)_accessibilityIsStrongPasswordField
{
  return 0;
}

- (id)_accessibilityEquivalenceTag
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(a1, "accessibilityLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "string");
    v3 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v3;
  }
  objc_msgSend(a1, "accessibilityValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "string");
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  v6 = objc_msgSend(a1, "accessibilityTraits");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%lu"), v2, v4, v6 & ~(*MEMORY[0x1E0CF4640] | *MEMORY[0x1E0CF4558] | *MEMORY[0x1E0CF4508] | *MEMORY[0x1E0CF4638]));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_accessibilityRoleDescription
{
  return objc_getAssociatedObject(a1, &__NSObject___accessibilityRoleDescription);
}

- (uint64_t)_accessibilitySetRoleDescription:()AXPrivCategory
{
  return __UIAccessibilitySetAssociatedObject();
}

- (id)__accessibilityRoleDescription
{
  void *v2;
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(a1, "safeStringForKey:", CFSTR("browserAccessibilityRoleDescription")),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        v2,
        v2))
  {
    objc_msgSend(a1, "safeStringForKey:", CFSTR("browserAccessibilityRoleDescription"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "_accessibilityRoleDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_accessibilityRawIsSpeakThisElement
{
  return objc_getAssociatedObject(a1, &__NSObject___accessibilityRawIsSpeakThisElement);
}

- (uint64_t)_accessibilityIsSpeakThisElement
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  NSObject *v7;
  int v9;
  void *v10;
  __int16 v11;
  NSObject *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_accessibilityRawIsSpeakThisElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "BOOLValue");
    AXLogSpeakScreen();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[NSObject(AXPrivCategory) _accessibilityIsSpeakThisElement].cold.1();
LABEL_12:

    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = objc_msgSend(a1, "accessibilityTraits");
    v4 = ((UIAccessibilityTraitBookContent | *MEMORY[0x1E0CEB170] | *MEMORY[0x1E0CEB118]) & v6) != 0
      || ((*MEMORY[0x1E0CEB100] | *MEMORY[0x1E0CEB110] | *MEMORY[0x1E0CEB128] | *MEMORY[0x1E0CEB158] | UIAccessibilityTraitStatusBarElement | UIAccessibilityTraitTableIndex | *MEMORY[0x1E0CEB188]) & v6) == 0;
    v5 = _AXTraitsAsString();
    AXLogSpeakScreen();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v9 = 138543874;
      v10 = a1;
      v11 = 2114;
      v12 = v5;
      v13 = 1024;
      v14 = v4;
      _os_log_debug_impl(&dword_19D0DD000, v7, OS_LOG_TYPE_DEBUG, "%{public}@ had traits %{public}@, so was speak this element: %i", (uint8_t *)&v9, 0x1Cu);
    }

    goto LABEL_12;
  }
  v4 = objc_msgSend(a1, "onClientSide");
LABEL_13:

  return v4;
}

- (id)_accessibilitySpeakThisStringValue
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  __CFString *v6;
  uint64_t v7;

  v2 = objc_msgSend(a1, "accessibilityTraits");
  v3 = v2;
  if ((*MEMORY[0x1E0CF4678] & v2) != 0)
  {
    if (((*MEMORY[0x1E0CEB120] | *MEMORY[0x1E0CEB188]) & v2) != 0)
    {
      v4 = 0;
    }
    else
    {
      objc_msgSend(a1, "_accessibilityAXAttributedValue");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    objc_msgSend(a1, "_accessibilityAXAttributedValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5;
    if ((*MEMORY[0x1E0CEB188] & v3) != 0)
    {
      if (objc_msgSend(v5, "isEqualToString:", CFSTR("0")))
      {
        v6 = CFSTR("toggle.off");
      }
      else if (objc_msgSend(v4, "isEqualToString:", CFSTR("1")))
      {
        v6 = CFSTR("toggle.on");
      }
      else
      {
        if (!objc_msgSend(v4, "isEqualToString:", CFSTR("2")))
          return v4;
        v6 = CFSTR("toggle.mixed");
      }
      UIKitAccessibilityLocalizedString(v6);
      v7 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v7;
    }
  }
  return v4;
}

- (id)_accessibilitySpeakThisString
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v7;

  objc_msgSend(a1, "_iosAccessibilityAttributeValue:", 2301);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  if (v3)
  {
    objc_msgSend(a1, "_iosAccessibilityAttributeValue:", 2302);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "_accessibilityAXAttributedLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_accessibilitySpeakThisStringValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (uint64_t)_accessibilityShouldAvoidAnnouncing
{
  return 0;
}

- (uint64_t)_accessibilityDirectTouchOptionsAttribute
{
  uint64_t v2;
  uint64_t v3;

  v2 = objc_msgSend(a1, "accessibilityDirectTouchOptions");
  v3 = v2 | objc_msgSend(a1, "_accessibilityShouldAvoidAnnouncing");
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v3);
}

- (id)_accessibilityProcessedLabelAttribute
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(a1, "_accessibilityAXAttributedLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "accessibilitySpeechHint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(a1, "_accessibilityAXAttributedValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length");

    if (!v5)
    {
      objc_msgSend(a1, "_accessibilityString:withSpeechHint:", v2, v3);
      v6 = objc_claimAutoreleasedReturnValue();

      v2 = (void *)v6;
    }
  }
  objc_msgSend(a1, "_accessibilityPostProcessValueForAutomation:", v2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_accessibilityPostProcessValueForAutomation:()AXPrivCategory
{
  id v3;
  int v4;
  uint64_t v5;

  v3 = a3;
  v4 = AXDoesRequestingClientDeserveAutomation();
  if (v3 && v4)
  {
    objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("\\x{fffc}|\\x{2060}"), &stru_1E3E01CE0, 1024, 0, objc_msgSend(v3, "length"));
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v5;
  }
  return v3;
}

- (uint64_t)_accessibilitySpeakThisIgnoresAccessibilityElementStatus
{
  return 0;
}

- (BOOL)_accessibilityOverridesPotentiallyAttributedAPISelector:()AXPrivCategory
{
  objc_class *v4;
  Method InstanceMethod;
  uint64_t v7;

  if (_accessibilityOverridesPotentiallyAttributedAPISelector__onceToken != -1)
    dispatch_once(&_accessibilityOverridesPotentiallyAttributedAPISelector__onceToken, &__block_literal_global_616);
  v4 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v4, a3);
  if (sel_accessibilityLabel == a3)
  {
    v7 = _accessibilityOverridesPotentiallyAttributedAPISelector__accessibilityLabelBaseMethod;
  }
  else if (sel_accessibilityValue == a3)
  {
    v7 = _accessibilityOverridesPotentiallyAttributedAPISelector__accessibilityValueBaseMethod;
  }
  else if (sel_accessibilityHint == a3)
  {
    v7 = _accessibilityOverridesPotentiallyAttributedAPISelector__accessibilityHintBaseMethod;
  }
  else if (sel_accessibilityUserInputLabels == a3)
  {
    v7 = _accessibilityOverridesPotentiallyAttributedAPISelector__accessibilityUserInputLabelsBaseMethod;
  }
  else if (sel_accessibilityAttributedLabel == a3)
  {
    v7 = _accessibilityOverridesPotentiallyAttributedAPISelector__accessibilityAttributedLabelBaseMethod;
  }
  else if (sel_accessibilityAttributedValue == a3)
  {
    v7 = _accessibilityOverridesPotentiallyAttributedAPISelector__accessibilityAttributedValueBaseMethod;
  }
  else if (sel_accessibilityAttributedHint == a3)
  {
    v7 = _accessibilityOverridesPotentiallyAttributedAPISelector__accessibilityAttributedHintBaseMethod;
  }
  else
  {
    if (sel_accessibilityAttributedUserInputLabels != a3)
    {
      sel_getName(a3);
      _AXAssert();
      return 0;
    }
    v7 = _accessibilityOverridesPotentiallyAttributedAPISelector__accessibilityAttributedUserInputLabelsBaseMethod;
  }
  return InstanceMethod != (Method)v7;
}

- (uint64_t)_accessibilityPotentiallyAttributedSelectorForNonAttributedSelector:()AXPrivCategory attributedSelector:
{
  int v7;

  v7 = objc_msgSend(a1, "_accessibilityOverridesPotentiallyAttributedAPISelector:");
  if (v7 ^ 1 | objc_msgSend(a1, "_accessibilityOverridesPotentiallyAttributedAPISelector:", a4))
    return a4;
  else
    return a3;
}

- (uint64_t)impOrNullForSelector:()AXPrivCategory
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(a1, "methodForSelector:", a3);
  else
    return 0;
}

- (uint64_t)_accessibilityAlwaysYes
{
  return 1;
}

- (uint64_t)_accessibilityAlwaysNo
{
  return 0;
}

+ (void)_accessibilityUndoAttributedDecisionCaching:()AXPrivCategory
{
  uint64_t v4;
  objc_class *v5;
  const char *v6;
  objc_method *InstanceMethod;
  void (*Implementation)(void);
  const char *TypeEncoding;
  void *v10;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  if ((objc_class *)objc_opt_class() == a1)
  {
    sel_getName(a2);
    _AXAssert();
  }
  if ((objc_class *)objc_opt_class() != a1)
  {
    v4 = 0;
    v11[0] = sel__accessibilityPrefersNonAttributedLabel;
    v11[1] = sel__accessibilityPrefersNonAttributedValue;
    v11[2] = sel__accessibilityPrefersNonAttributedHint;
    do
    {
      v5 = (objc_class *)objc_opt_class();
      v6 = (const char *)v11[v4];
      InstanceMethod = class_getInstanceMethod(v5, v6);
      Implementation = method_getImplementation(InstanceMethod);
      TypeEncoding = method_getTypeEncoding(InstanceMethod);
      class_replaceMethod(a1, v6, Implementation, TypeEncoding);
      ++v4;
    }
    while (v4 != 3);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObserver:name:object:", objc_opt_class(), *MEMORY[0x1E0DDD498], 0);

  }
}

- (BOOL)_accessibilityPrefersNonAttributedAttributeWithOverrideSelector:()AXPrivCategory nonAttributedSelector:attributedSelector:
{
  uint64_t v9;
  char **v10;
  objc_method *InstanceMethod;
  objc_class *v12;
  void (*Implementation)(void);
  const char *TypeEncoding;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  if (_accessibilityPrefersNonAttributedAttributeWithOverrideSelector_nonAttributedSelector_attributedSelector__onceToken != -1)
    dispatch_once(&_accessibilityPrefersNonAttributedAttributeWithOverrideSelector_nonAttributedSelector_attributedSelector__onceToken, &__block_literal_global_644);
  v9 = objc_msgSend(a1, "_accessibilityPotentiallyAttributedSelectorForNonAttributedSelector:attributedSelector:", a4, a5);
  if (objc_opt_class() != _accessibilityPrefersNonAttributedAttributeWithOverrideSelector_nonAttributedSelector_attributedSelector__NSObjectClass)
  {
    v10 = &selRef__accessibilityAlwaysYes;
    if (v9 != a4)
      v10 = &selRef__accessibilityAlwaysNo;
    InstanceMethod = class_getInstanceMethod((Class)_accessibilityPrefersNonAttributedAttributeWithOverrideSelector_nonAttributedSelector_attributedSelector__NSObjectClass, *v10);
    v12 = (objc_class *)objc_opt_class();
    Implementation = method_getImplementation(InstanceMethod);
    TypeEncoding = method_getTypeEncoding(InstanceMethod);
    class_replaceMethod(v12, a3, Implementation, TypeEncoding);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_opt_class();
    v17 = *MEMORY[0x1E0DDD498];
    objc_msgSend(v15, "removeObserver:name:object:", v16, *MEMORY[0x1E0DDD498], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", objc_opt_class(), sel__accessibilityUndoAttributedDecisionCaching_, v17, 0);

  }
  return v9 == a4;
}

- (uint64_t)_accessibilityPrefersNonAttributedLabel
{
  return objc_msgSend(a1, "_accessibilityPrefersNonAttributedAttributeWithOverrideSelector:nonAttributedSelector:attributedSelector:", a2, sel_accessibilityLabel, sel_accessibilityAttributedLabel);
}

- (uint64_t)_accessibilityPrefersNonAttributedValue
{
  return objc_msgSend(a1, "_accessibilityPrefersNonAttributedAttributeWithOverrideSelector:nonAttributedSelector:attributedSelector:", a2, sel_accessibilityValue, sel_accessibilityAttributedValue);
}

- (uint64_t)_accessibilityPrefersNonAttributedHint
{
  return objc_msgSend(a1, "_accessibilityPrefersNonAttributedAttributeWithOverrideSelector:nonAttributedSelector:attributedSelector:", a2, sel_accessibilityHint, sel_accessibilityAttributedHint);
}

- (uint64_t)_accessibilityWarmPrefersNonAttributedLabelValueHintCache
{
  objc_msgSend(a1, "_accessibilityPrefersNonAttributedAttributeWithOverrideSelector:nonAttributedSelector:attributedSelector:", sel__accessibilityPrefersNonAttributedLabel, sel_accessibilityLabel, sel_accessibilityAttributedLabel);
  objc_msgSend(a1, "_accessibilityPrefersNonAttributedAttributeWithOverrideSelector:nonAttributedSelector:attributedSelector:", sel__accessibilityPrefersNonAttributedValue, sel_accessibilityValue, sel_accessibilityAttributedValue);
  return objc_msgSend(a1, "_accessibilityPrefersNonAttributedAttributeWithOverrideSelector:nonAttributedSelector:attributedSelector:", sel__accessibilityPrefersNonAttributedHint, sel_accessibilityHint, sel_accessibilityAttributedHint);
}

+ (uint64_t)_accessibilityClearProcessedClasses:()AXPrivCategory
{
  return objc_msgSend((id)processedClasses, "removeAllObjects");
}

- (id)_accessibilityPotentiallyAttributedValueForNonAttributedSelector:()AXPrivCategory attributedSelector:
{
  _BOOL4 v7;
  int v8;
  void *v9;

  if (_accessibilityPotentiallyAttributedValueForNonAttributedSelector_attributedSelector__onceToken != -1)
    dispatch_once(&_accessibilityPotentiallyAttributedValueForNonAttributedSelector_attributedSelector__onceToken, &__block_literal_global_651);
  if ((objc_msgSend((id)processedClasses, "containsObject:", objc_opt_class()) & 1) == 0)
  {
    objc_msgSend(a1, "_accessibilityWarmPrefersNonAttributedLabelValueHintCache");
    objc_msgSend((id)processedClasses, "addObject:", objc_opt_class());
  }
  if ((const char *)_accessibilityPotentiallyAttributedValueForNonAttributedSelector_attributedSelector__accessibilityLabelSEL == a3)
  {
    v8 = objc_msgSend(a1, "_accessibilityPrefersNonAttributedLabel");
  }
  else if ((const char *)_accessibilityPotentiallyAttributedValueForNonAttributedSelector_attributedSelector__accessibilityValueSEL == a3)
  {
    v8 = objc_msgSend(a1, "_accessibilityPrefersNonAttributedValue");
  }
  else
  {
    if ((const char *)_accessibilityPotentiallyAttributedValueForNonAttributedSelector_attributedSelector__accessibilityHintSEL != a3)
    {
      v7 = objc_msgSend(a1, "_accessibilityPotentiallyAttributedSelectorForNonAttributedSelector:attributedSelector:", a3, a4) == (_QWORD)a3;
      goto LABEL_13;
    }
    v8 = objc_msgSend(a1, "_accessibilityPrefersNonAttributedHint");
  }
  v7 = v8;
LABEL_13:
  if (v7)
    objc_msgSend(a1, a3);
  else
    objc_msgSend(a1, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    if (v7)
      objc_msgSend(a1, a4);
    else
      objc_msgSend(a1, a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

- (id)_accessibilityAXAttributedLabel
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v9;
  id v10;

  objc_msgSend(a1, "_accessibilityGetBlockForAttribute:", 34);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    (*(void (**)(uint64_t))(v2 + 16))(v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CF40C0]), "initWithCFAttributedString:", v4);
LABEL_5:
    v7 = (void *)v5;
    goto LABEL_6;
  }
  objc_msgSend(a1, "_accessibilityGetBlockForAttribute:", 1);
  v6 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v6;
  if (v6)
  {
    (*(void (**)(uint64_t))(v6 + 16))(v6);
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  objc_msgSend(a1, "_accessibilityPotentiallyAttributedValueForNonAttributedSelector:attributedSelector:", sel_accessibilityLabel, sel_accessibilityAttributedLabel);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CF40C0]), "initWithCFAttributedString:", v9);
  }
  else
  {
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        _AXAssert();
      }
    }
    v10 = v9;
  }
  v7 = v10;

LABEL_6:
  return v7;
}

- (id)_accessibilityAXAttributedValue
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(a1, "_accessibilityGetBlockForAttribute:", 39);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    (*(void (**)(uint64_t))(v2 + 16))(v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CF40C0]), "initWithCFAttributedString:", v4);
LABEL_7:
      v7 = (void *)v5;
      goto LABEL_15;
    }

  }
  objc_msgSend(a1, "_accessibilityGetBlockForAttribute:", 3);
  v6 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v6;
  if (v6)
  {
    (*(void (**)(uint64_t))(v6 + 16))(v6);
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  objc_msgSend(a1, "_accessibilityPotentiallyAttributedValueForNonAttributedSelector:attributedSelector:", sel_accessibilityValue, sel_accessibilityAttributedValue);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CF40C0]), "initWithCFAttributedString:", v8);
  }
  else
  {
    if (v8)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        _AXAssert();
      }
    }
    v9 = v8;
  }
  v7 = v9;

LABEL_15:
  return v7;
}

- (id)_accessibilityAXAttributedHint
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v9;
  id v10;

  objc_msgSend(a1, "_accessibilityGetBlockForAttribute:", 35);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    (*(void (**)(uint64_t))(v2 + 16))(v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CF40C0]), "initWithCFAttributedString:", v4);
LABEL_5:
    v7 = (void *)v5;
    goto LABEL_6;
  }
  objc_msgSend(a1, "_accessibilityGetBlockForAttribute:", 2);
  v6 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v6;
  if (v6)
  {
    (*(void (**)(uint64_t))(v6 + 16))(v6);
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  objc_msgSend(a1, "_accessibilityPotentiallyAttributedValueForNonAttributedSelector:attributedSelector:", sel_accessibilityHint, sel_accessibilityAttributedHint);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CF40C0]), "initWithCFAttributedString:", v9);
  }
  else
  {
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_opt_class();
        _AXAssert();
      }
    }
    v10 = v9;
  }
  v7 = v10;

LABEL_6:
  return v7;
}

- (id)_accessibilityAXAttributedUserInputLabels
{
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  void *v7;
  char isKindOfClass;
  void *v9;
  void *v10;
  char v11;

  objc_msgSend(a1, "_accessibilityGetBlockForAttribute:", 38);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    (*(void (**)(uint64_t))(v2 + 16))(v2);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "ax_mappedArrayUsingBlock:", &__block_literal_global_658);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
  objc_msgSend(a1, "_accessibilityPotentiallyAttributedValueForNonAttributedSelector:attributedSelector:", sel_accessibilityUserInputLabels, sel_accessibilityAttributedUserInputLabels);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v5;
    objc_msgSend(v4, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v4, "ax_mappedArrayUsingBlock:", &__block_literal_global_659);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v4;
    }
    else
    {
      v5 = v4;
      if (!objc_msgSend(v4, "count"))
        goto LABEL_3;
      objc_msgSend(v4, "firstObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      v11 = objc_opt_isKindOfClass();

      v5 = v4;
      if ((v11 & 1) != 0)
        goto LABEL_3;
      objc_msgSend(v4, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      _AXAssert();
      v5 = v4;
    }

LABEL_3:
    goto LABEL_4;
  }
  if (v5)
  {
    objc_opt_class();
    _AXAssert();
  }
LABEL_4:

  return v5;
}

- (id)_accessibilityAXAttributedUserInputLabelsIncludingFallbacks
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  uint64_t v10;
  uint64_t v12;

  objc_msgSend(a1, "_accessibilityAXAttributedUserInputLabels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "count"))
  {
    objc_msgSend(a1, "_accessibilityAXAttributedLabel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (*)(void))UIAXArrayForString)();
    v4 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v4;
  }
  if (!objc_msgSend(v2, "count"))
  {
    v5 = objc_msgSend(a1, "accessibilityTraits");
    if ((UIAccessibilityTraitBackButton & v5) != 0)
    {
      UIAccessibilityBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("USER_INPUT_BACK_BUTTON");
    }
    else if ((*MEMORY[0x1E0CEB110] & v5) != 0)
    {
      UIAccessibilityBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("USER_INPUT_BUTTON");
    }
    else if ((*MEMORY[0x1E0CEB128] & v5) != 0)
    {
      UIAccessibilityBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("USER_INPUT_IMAGE");
    }
    else if ((*MEMORY[0x1E0CEB100] & v5) != 0)
    {
      UIAccessibilityBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("USER_INPUT_ADJUSTABLE");
    }
    else
    {
      if ((*MEMORY[0x1E0CEB158] & v5) == 0)
      {
        if ((UIAccessibilityTraitTextEntry & v5) == 0)
        {
          v9 = 0;
          goto LABEL_16;
        }
        objc_msgSend(a1, "accessibilityValue");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "length"))
        {
LABEL_16:
          UIAXArrayForString(v9);
          v10 = objc_claimAutoreleasedReturnValue();

          v2 = (void *)v10;
          return v2;
        }
        UIAccessibilityBundle();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("USER_INPUT_TEXT"), &stru_1E3E01CE0, CFSTR("Localized"));
        v12 = objc_claimAutoreleasedReturnValue();

        v9 = (void *)v12;
LABEL_15:

        goto LABEL_16;
      }
      UIAccessibilityBundle();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("USER_INPUT_SEARCH");
    }
    objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_1E3E01CE0, CFSTR("Localized"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  return v2;
}

- (uint64_t)accessibilitySemanticGroupChildrentCount
{
  uint64_t result;
  void *v3;
  uint64_t v4;

  result = objc_msgSend(a1, "accessibilityElementCount");
  if (result == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(a1, "accessibilityElements");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    return v4;
  }
  return result;
}

- (uint64_t)_accessibilityIncludeRoleInGroupNavigationOnly
{
  return 0;
}

- (uint64_t)_accessibilityIncludeRoleDescription
{
  return 0;
}

- (uint64_t)_accessibilityForegroundTextColorAttribute
{
  return 0;
}

- (uint64_t)_accessibilityBackgroundTextColorAttribute
{
  return 0;
}

- (uint64_t)_accessibilityIsGroupedParent
{
  uint64_t v2;
  void *v3;
  _BOOL8 v4;
  void *v5;

  v2 = objc_msgSend(a1, "accessibilityContainerType");
  if (!v2)
    return 0;
  if ((v2 & 0xFFFFFFFFFFFFFFF7) != 4)
    return 1;
  objc_msgSend(a1, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(a1, "_accessibilityRoleDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "length") != 0;

  }
  return v4;
}

- (uint64_t)_accessibilitySetElementHelp:()AXPrivCategory
{
  return objc_msgSend(a1, "_accessibilitySetRetainedValue:forKey:", a3, CFSTR("AXElementHelp"));
}

- (uint64_t)_accessibilityElementHelp
{
  return objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("AXElementHelp"));
}

- (uint64_t)_axNavigationalGroupParentOfChild:()AXPrivCategory
{
  return objc_msgSend(a3, "_accessibilityGroupedParent");
}

- (id)_accessibilityGroupedParent
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;

  if (AXDoesRequestingClientDeserveAutomation())
    objc_msgSend(a1, "_accessibilityUserTestingParent");
  else
    objc_msgSend(a1, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_678, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "_accessibilityGroupedParent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      do
      {
        if ((objc_msgSend(v4, "accessibilityIsWindow") & 1) == 0)
        {
          v5 = v4;

          v3 = v5;
        }
        objc_msgSend(v4, "_accessibilityGroupedParent");
        v6 = objc_claimAutoreleasedReturnValue();

        v4 = (void *)v6;
      }
      while (v6);
    }
  }
  return v3;
}

- (id)_accessibilityProcessChildrenForParameter:()AXPrivCategory
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  _QWORD v16[5];
  id v17;
  id v18;

  v4 = a3;
  if (AXDoesRequestingClientDeserveAutomation())
  {
    objc_msgSend(a1, "automationElements");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CF4018]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "BOOLValue");

    }
    else
    {
      v7 = 0;
    }
    +[UIAccessibilityElementTraversalOptions defaultVoiceOverOptions](UIAccessibilityElementTraversalOptions, "defaultVoiceOverOptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend(a1, "_accessibilityGroupedParent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      +[UIAccessibilityElementTraversalOptions defaultVoiceOverOptionsHonoringGroups](UIAccessibilityElementTraversalOptions, "defaultVoiceOverOptionsHonoringGroups");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "leafNodePredicate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __70__NSObject_AXPrivCategory___accessibilityProcessChildrenForParameter___block_invoke;
      v16[3] = &unk_1E3DFE940;
      v17 = v9;
      v18 = v11;
      v16[4] = a1;
      v12 = v9;
      v13 = v11;
      objc_msgSend(v10, "setLeafNodePredicate:", v16);

      v8 = v10;
    }
    objc_msgSend(a1, "_accessibilityLeafDescendantsWithCount:options:", 0, v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    AXLogElementTraversal();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[NSObject(AXPrivCategory) _accessibilityProcessChildrenForParameter:].cold.1();

  }
  return v5;
}

- (id)_accessibilityProcessElementsInDirection:()AXPrivCategory forParameter:
{
  id v6;
  unint64_t v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  const __CFString *v24;
  int v25;
  const __CFString *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  void *v32;
  _QWORD v33[2];

  v33[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = objc_msgSend(v6, "unsignedIntegerValue");
    v8 = 0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CF4010]);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v9, "unsignedIntegerValue");

      objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CF4018]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v10, "BOOLValue");

      objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CF4028]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
        objc_msgSend(a1, "_accessibilitySetVoiceOverRTLOverride:", objc_msgSend(v11, "integerValue"));

    }
    else
    {
      v8 = 0;
      v7 = 0;
    }
  }
  if (v7 >= 0x3E8)
    v13 = 1000;
  else
    v13 = v7;
  +[UIAccessibilityElementTraversalOptions defaultVoiceOverOptions](UIAccessibilityElementTraversalOptions, "defaultVoiceOverOptions");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v8)
  {
    +[UIAccessibilityElementTraversalOptions defaultVoiceOverOptionsHonoringGroups](UIAccessibilityElementTraversalOptions, "defaultVoiceOverOptionsHonoringGroups");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "_accessibilityGroupedParent");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if (v17)
    {
      v33[0] = v17;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setAllowedElementsForTraversal:", v19);

    }
  }
  else
  {
    v16 = (void *)v14;
  }
  if (AXRequestingClient() == 11)
  {
    +[UIAccessibilityElementTraversalOptions defaultSpeakScreenOptions](UIAccessibilityElementTraversalOptions, "defaultSpeakScreenOptions");
    v20 = objc_claimAutoreleasedReturnValue();

    v16 = (void *)v20;
  }
  if (a3 == 92502)
    objc_msgSend(v16, "setDirection:", 2);
  objc_msgSend(a1, "_accessibilityElementsInDirectionWithCount:options:", v13, v16);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  AXLogElementTraversal();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    v24 = CFSTR("next");
    v25 = 138413059;
    if (a3 == 92502)
      v24 = CFSTR("previous");
    v26 = v24;
    v27 = 2113;
    v28 = a1;
    v29 = 1024;
    v30 = v13;
    v31 = 2113;
    v32 = v21;
    _os_log_debug_impl(&dword_19D0DD000, v22, OS_LOG_TYPE_DEBUG, "*** Returning %@ elements for %{private}@ with count %u: %{private}@", (uint8_t *)&v25, 0x26u);
  }

  return v21;
}

- (id)_iosAccessibilityAttributeValue:()AXPrivCategory forParameter:
{
  id v6;
  void *v7;
  id EventForSceneReferencePoint;
  double v9;
  double v10;
  double v11;
  double v12;
  NSObject *v13;
  int v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  double v54;
  double v55;
  double v56;
  double v57;
  void *v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  uint64_t v71;
  double v72;
  double v73;
  double v74;
  double v75;
  uint64_t v76;
  void *v77;
  char v78;
  void *v79;
  void *v80;
  double v81;
  double v82;
  double v83;
  double v84;
  void *v85;
  int v86;
  double v87;
  int v88;
  double v89;
  uint64_t v90;
  void *v91;
  void *v92;
  double v93;
  double v94;
  double v95;
  double v96;
  void *v97;
  int v98;
  double v99;
  void *v100;
  NSUInteger v101;
  NSUInteger v102;
  NSUInteger v103;
  uint64_t v104;
  NSObject *v105;
  void *v106;
  uint64_t v107;
  void *v108;
  void *v109;
  char v110;
  double x;
  double y;
  double width;
  double height;
  id v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t i;
  void *v120;
  id v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t j;
  void *v126;
  void *v127;
  char isKindOfClass;
  void *v129;
  uint64_t v130;
  void *v131;
  void *v132;
  uint64_t v133;
  void *v134;
  void *v135;
  id v136;
  id v137;
  uint64_t v138;
  void *v139;
  id v140;
  void *v141;
  uint64_t v142;
  void *v143;
  void *v144;
  uint64_t v145;
  uint64_t v146;
  id v147;
  uint64_t v148;
  uint64_t v149;
  int v150;
  void *v151;
  void *v152;
  void *v153;
  uint64_t v154;
  void *v155;
  uint64_t v156;
  uint64_t v157;
  double v158;
  double v159;
  void *v160;
  uint64_t v161;
  double v162;
  void *v163;
  void *v164;
  uint64_t v165;
  void *v166;
  void *v167;
  uint64_t v168;
  void *v169;
  void *v170;
  uint64_t v171;
  void *v172;
  void *v173;
  uint64_t v174;
  double v175;
  double v176;
  void *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t m;
  void *v181;
  const void *v182;
  double v183;
  double v184;
  id v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t n;
  void *v190;
  double v191;
  double v192;
  void *v193;
  uint64_t v194;
  uint64_t v195;
  id v196;
  void *v197;
  uint64_t v198;
  void *v199;
  uint64_t v200;
  void *v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  void *v205;
  int v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  void *v211;
  void *v212;
  id v213;
  void *v214;
  void *v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  void *v234;
  void *v235;
  void *v236;
  id v237;
  void *v238;
  id v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t k;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  void *v261;
  char v262;
  void *v263;
  NSObject *v264;
  os_log_type_t v265;
  void *v266;
  void *v267;
  uint64_t v268;
  void *v269;
  uint64_t v270;
  void *v271;
  void *v272;
  char v273;
  void *v274;
  uint64_t v275;
  uint64_t v276;
  void *v277;
  char v278;
  void *v279;
  char v280;
  void *v281;
  NSObject *v282;
  void *v283;
  char v284;
  void *v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  void *v289;
  uint64_t v290;
  NSObject *v291;
  uint64_t v292;
  uint64_t v293;
  void *v294;
  char v295;
  NSObject *v296;
  id v297;
  uint64_t v298;
  id v299;
  NSUInteger v300;
  id v301;
  NSUInteger v302;
  NSObject *v303;
  void *v304;
  uint64_t v305;
  id v306;
  uint64_t v307;
  void *v308;
  void *v309;
  id v310;
  unsigned int v311;
  __int128 v312;
  __int128 v313;
  __int128 v314;
  __int128 v315;
  _QWORD v316[5];
  id v317;
  __int128 v318;
  __int128 v319;
  __int128 v320;
  __int128 v321;
  __int128 v322;
  __int128 v323;
  __int128 v324;
  __int128 v325;
  __int128 v326;
  __int128 v327;
  __int128 v328;
  __int128 v329;
  _BYTE v330[128];
  _BYTE v331[128];
  _BYTE v332[128];
  _BYTE v333[128];
  _QWORD v334[3];
  _QWORD v335[3];
  _BYTE buf[24];
  uint64_t v337;
  NSRange v338;
  CGRect v339;
  CGRect v340;
  CGRect v341;

  v337 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = v6;
  if (a3 > 95000)
  {
    if (a3 <= 95216)
    {
      v18 = 0;
      switch(a3)
      {
        case 95001:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_235;
          objc_msgSend(a1, "_accessibilityKeyboardKeyForString:", v7);
          v17 = objc_claimAutoreleasedReturnValue();
          goto LABEL_233;
        case 95002:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_235;
          v155 = (void *)MEMORY[0x1E0CB37E8];
          v156 = objc_msgSend(a1, "_accessibilityIndexForPickerString:", v7);
LABEL_213:
          objc_msgSend(v155, "numberWithInteger:", v156);
          v17 = objc_claimAutoreleasedReturnValue();
          goto LABEL_233;
        case 95003:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_235;
          v203 = objc_msgSend(v7, "rangeValue");
          objc_msgSend(a1, "_accessibilityUserTestingChildrenWithRange:", v203, v204);
          v17 = objc_claimAutoreleasedReturnValue();
          goto LABEL_233;
        case 95004:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_235;
          v205 = (void *)MEMORY[0x1E0CB3B18];
          objc_msgSend(v7, "CGPointValue");
          objc_msgSend(v205, "valueWithPoint:");
          v17 = objc_claimAutoreleasedReturnValue();
          goto LABEL_233;
        case 95005:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_235;
          objc_msgSend(a1, "_accessibilityAuditIssuesWithOptions:", v7);
          v17 = objc_claimAutoreleasedReturnValue();
          goto LABEL_233;
        case 95006:
          goto LABEL_270;
        case 95007:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v7, "pointValue");
            objc_msgSend(a1, "_accessibilitySetStartingPointForIsVisible:");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "_accessibilityIsVisibleByCompleteHitTest"));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "_accessibilitySetStartingPointForIsVisible:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
          }
          else
          {
            v18 = 0;
          }
LABEL_270:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(a1, "_accessibilityUserTestingSnapshotWithOptions:", v7);
            v231 = objc_claimAutoreleasedReturnValue();

            v18 = (void *)v231;
          }
          break;
        default:
          goto LABEL_235;
      }
      goto LABEL_234;
    }
    switch(a3)
    {
      case 95217:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v7, "count") != 2)
          goto LABEL_235;
        objc_msgSend(v7, "objectAtIndex:", 0);
        EventForSceneReferencePoint = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(EventForSceneReferencePoint, "pointValue");
        v10 = v9;
        v12 = v11;
        objc_msgSend(v7, "objectAtIndex:", 1);
        v13 = objc_claimAutoreleasedReturnValue();
        -[NSObject floatValue](v13, "floatValue");
        LODWORD(v15) = v14;
        objc_msgSend(a1, "_accessibilityUpcomingRoadsForPoint:forAngle:", v10, v12, v15);
        v16 = objc_claimAutoreleasedReturnValue();
        goto LABEL_250;
      case 95218:
        v69 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v6, "pointValue");
        v70 = objc_msgSend(a1, "_accessibilityRoadContainsTrackingPoint:");
        goto LABEL_68;
      case 95219:
        objc_msgSend(v6, "pointValue");
        objc_msgSend(a1, "_accessibilityMapDetailedInfoAtPoint:");
        v17 = objc_claimAutoreleasedReturnValue();
        goto LABEL_233;
      case 95220:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v7, "count") != 2)
          goto LABEL_235;
        objc_msgSend(v7, "objectAtIndex:", 0);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "pointValue");
        v82 = v81;
        v84 = v83;
        objc_msgSend(v7, "objectAtIndex:", 1);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "floatValue");
        LODWORD(v87) = v86;
        objc_msgSend(a1, "_accessibilityDistanceFromEndOfRoad:forAngle:", v82, v84, v87);
        LODWORD(v82) = v88;

        LODWORD(v89) = LODWORD(v82);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v89);
        v90 = objc_claimAutoreleasedReturnValue();
        goto LABEL_268;
      case 95221:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v69 = (void *)MEMORY[0x1E0CB37E8];
          v70 = objc_msgSend(a1, "_accessibilityCanPerformAction:", objc_msgSend(v7, "intValue"));
          goto LABEL_68;
        }
        v18 = (void *)MEMORY[0x1E0C9AAA0];
        goto LABEL_239;
      case 95222:
      case 95253:
      case 95254:
      case 95256:
      case 95257:
        goto LABEL_235;
      case 95223:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v7, "count") != 3)
          goto LABEL_235;
        objc_msgSend(v7, "objectAtIndex:", 2);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        EventForSceneReferencePoint = (id)_AXCreateAXUIElementWithElement();

        objc_msgSend(v7, "objectAtIndex:", 0);
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v92, "pointValue");
        objc_msgSend(a1, "_accessibilityScreenPointForSceneReferencePoint:");
        v94 = v93;
        v96 = v95;

        v97 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v7, "objectAtIndex:", 1);
        v13 = objc_claimAutoreleasedReturnValue();
        -[NSObject floatValue](v13, "floatValue");
        LODWORD(v99) = v98;
        objc_msgSend(a1, "_accessibilityDistance:forAngle:toRoad:", EventForSceneReferencePoint, v94, v96, v99);
        objc_msgSend(v97, "numberWithFloat:");
        v16 = objc_claimAutoreleasedReturnValue();
        goto LABEL_250;
      case 95224:
        if (!objc_msgSend(a1, "_accessibilitySpeakThisCanBeHighlighted"))
          goto LABEL_235;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_235;
        objc_msgSend(v7, "objectForKey:", CFSTR("speakThisRangeInElement"));
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        EventForSceneReferencePoint = v100;
        if (v100)
        {
          v308 = v100;
          v101 = objc_msgSend(v100, "rangeValue");
          v103 = v102;
          objc_msgSend(v7, "objectForKey:", CFSTR("speakThisCurrentString"));
          v104 = objc_claimAutoreleasedReturnValue();
          AXLogSpeakScreen();
          v105 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v105, OS_LOG_TYPE_DEBUG))
          {
            v338.location = v101;
            v338.length = v103;
            -[NSObject(AXPrivCategory) _iosAccessibilityAttributeValue:forParameter:].cold.2((uint64_t)a1, v338, v105);
          }

          objc_msgSend(v7, "objectForKey:", CFSTR("speakThisWantsSentenceRects"));
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          v107 = objc_msgSend(v106, "BOOLValue");

          objc_msgSend(a1, "_accessibilitySetBoolValue:forKey:", 0, CFSTR("AXSpeakScreenRectsUseVisibleFrame"));
          objc_msgSend(a1, "_accessibilityTextRectsForSpeakThisStringRange:string:wantsSentences:", v101, v103, v104, v107);
          v108 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "objectForKey:", CFSTR("speakThisIgnoreScrollToVisible"));
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          v110 = objc_msgSend(v109, "BOOLValue");

          if (objc_msgSend(a1, "_accessibilitySpeakThisShouldScrollTextRects")
            && (v110 & 1) == 0
            && objc_msgSend(v108, "count"))
          {
            v300 = v103;
            v302 = v101;
            x = *MEMORY[0x1E0C9D628];
            y = *(double *)(MEMORY[0x1E0C9D628] + 8);
            width = *(double *)(MEMORY[0x1E0C9D628] + 16);
            height = *(double *)(MEMORY[0x1E0C9D628] + 24);
            v324 = 0u;
            v325 = 0u;
            v322 = 0u;
            v323 = 0u;
            v115 = v108;
            v116 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v322, v332, 16);
            if (v116)
            {
              v117 = v116;
              v118 = *(_QWORD *)v323;
              do
              {
                for (i = 0; i != v117; ++i)
                {
                  if (*(_QWORD *)v323 != v118)
                    objc_enumerationMutation(v115);
                  objc_msgSend(*(id *)(*((_QWORD *)&v322 + 1) + 8 * i), "CGRectValue");
                  v341.origin.x = x;
                  v341.origin.y = y;
                  v341.size.width = width;
                  v341.size.height = height;
                  v340 = CGRectUnion(v339, v341);
                  x = v340.origin.x;
                  y = v340.origin.y;
                  width = v340.size.width;
                  height = v340.size.height;
                }
                v117 = objc_msgSend(v115, "countByEnumeratingWithState:objects:count:", &v322, v332, 16);
              }
              while (v117);
            }

            objc_msgSend(a1, "_accessibilityScrollRectToVisible:", x, y, width, height);
            v103 = v300;
            v101 = v302;
          }
          objc_msgSend(a1, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("AXSpeakScreenRectsUseVisibleFrame"));
          v303 = v104;
          objc_msgSend(a1, "_accessibilityTextRectsForSpeakThisStringRange:string:wantsSentences:", v101, v103, v104, v107);
          v120 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v120, "count"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v318 = 0u;
          v319 = 0u;
          v320 = 0u;
          v321 = 0u;
          v121 = v120;
          v122 = objc_msgSend(v121, "countByEnumeratingWithState:objects:count:", &v318, v331, 16);
          if (v122)
          {
            v123 = v122;
            v124 = *(_QWORD *)v319;
            do
            {
              for (j = 0; j != v123; ++j)
              {
                if (*(_QWORD *)v319 != v124)
                  objc_enumerationMutation(v121);
                objc_msgSend(*(id *)(*((_QWORD *)&v318 + 1) + 8 * j), "CGRectValue");
                objc_msgSend(a1, "_accessibilityConvertSystemBoundedScreenRectToContextSpace:");
                objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:");
                v126 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "addObject:", v126);

              }
              v123 = objc_msgSend(v121, "countByEnumeratingWithState:objects:count:", &v318, v331, 16);
            }
            while (v123);
          }

          v13 = v303;
          EventForSceneReferencePoint = v308;
          goto LABEL_251;
        }
        AXLogSpeakScreen();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          -[NSObject(AXPrivCategory) _iosAccessibilityAttributeValue:forParameter:].cold.1();
        goto LABEL_314;
      case 95225:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || (unint64_t)objc_msgSend(v7, "count") < 4
          || (unint64_t)objc_msgSend(v7, "count") >= 7)
        {
          goto LABEL_252;
        }
        objc_msgSend(v7, "objectAtIndex:", 0);
        EventForSceneReferencePoint = (id)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v18 = 0;
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_259;
        objc_msgSend(v7, "objectAtIndex:", 1);
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v7, "objectAtIndex:", 1);
          v129 = (void *)objc_claimAutoreleasedReturnValue();
          v130 = objc_msgSend(v129, "integerValue");

        }
        else
        {
          v130 = 0;
        }
        objc_msgSend(v7, "objectAtIndex:", 2);
        v283 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v284 = objc_opt_isKindOfClass();

        if ((v284 & 1) != 0)
        {
          objc_msgSend(v7, "objectAtIndex:", 2);
          v285 = (void *)objc_claimAutoreleasedReturnValue();
          v286 = objc_msgSend(v285, "rangeValue");
          v288 = v287;

        }
        else
        {
          v288 = 0;
          v286 = 0x7FFFFFFFLL;
        }
        objc_msgSend(v7, "objectAtIndexedSubscript:", 3);
        v13 = objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v7, "count") < 5)
        {
          v311 = 1;
        }
        else
        {
          objc_msgSend(v7, "objectAtIndex:", 4);
          v289 = (void *)objc_claimAutoreleasedReturnValue();
          v311 = objc_msgSend(v289, "BOOLValue");

        }
        if (objc_msgSend(v7, "count") == 6)
        {
          objc_msgSend(v7, "objectAtIndex:", 5);
          v306 = EventForSceneReferencePoint;
          v290 = v286;
          v291 = v13;
          v292 = v288;
          v293 = v130;
          v294 = (void *)objc_claimAutoreleasedReturnValue();
          v295 = objc_msgSend(v294, "BOOLValue");

          v130 = v293;
          v288 = v292;
          v13 = v291;
          v286 = v290;
          EventForSceneReferencePoint = v306;
        }
        else
        {
          v295 = 0;
        }
        LOBYTE(v298) = v295;
        objc_msgSend(a1, "_accessibilityMoveFocusToNextOpaqueElementForTechnology:direction:searchType:range:shouldScrollToVisible:honorsGroups:", v13, (int)objc_msgSend(EventForSceneReferencePoint, "intValue"), v130, v286, v288, v311, v298);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        AXLogElementTraversal();
        v296 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v296, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = a1;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v18;
          _os_log_impl(&dword_19D0DD000, v296, OS_LOG_TYPE_INFO, "Opaque movement from %@ to %@", buf, 0x16u);
        }

        goto LABEL_251;
      case 95226:
        objc_msgSend(a1, "_accessibilityCurrentlyFocusedElementForTechnology:", v6);
        v17 = objc_claimAutoreleasedReturnValue();
        goto LABEL_233;
      case 95227:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_235;
        buf[0] = 0;
        objc_opt_class();
        objc_msgSend(v7, "objectForKey:", CFSTR("uuid"));
        v131 = (void *)objc_claimAutoreleasedReturnValue();
        __UIAccessibilityCastAsClass();
        v304 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "objectForKey:", CFSTR("direction"));
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        v133 = objc_msgSend(v132, "integerValue");

        objc_msgSend(v7, "objectForKey:", CFSTR("currentItem"));
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v134, "objectForKey:", CFSTR("targetElement"));
        v309 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v134, "objectForKey:", CFSTR("targetRange"));
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v136 = v135;
          v137 = 0;
          v138 = 0;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v232 = objc_msgSend(v135, "rangeValue");
            v138 = v233;
            objc_msgSend(v309, "_accessibilityTextRangeFromNSRange:", v232, v233);
            v136 = (id)objc_claimAutoreleasedReturnValue();
            v137 = 0;
            goto LABEL_296;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v137 = v135;
          else
            v137 = 0;
          v138 = 0;
          v136 = 0;
        }
        v232 = 0x7FFFFFFFLL;
LABEL_296:
        v301 = v137;
        v245 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA290]), "initWithTargetElement:targetRange:targetTextMarkerRange:", v309, v136, v137);
        v246 = v245;
        if (!v136 && (v232 != 0x7FFFFFFF || v138))
          objc_msgSend(v245, "setTargetNSRange:", v232, v138);
        objc_msgSend(a1, "_accessibilityPerformPublicCustomRotorSearch:searchDirection:currentItem:", v304, v133, v246);
        v247 = (void *)objc_claimAutoreleasedReturnValue();
        v248 = v247;
        if (!v247
          || (objc_msgSend(v247, "targetElement"),
              v249 = (void *)objc_claimAutoreleasedReturnValue(),
              v249,
              !v249))
        {
          v18 = 0;
          goto LABEL_322;
        }
        v299 = v136;
        v250 = (void *)MEMORY[0x1E0C99E08];
        objc_msgSend(v248, "targetElement");
        v251 = (void *)objc_claimAutoreleasedReturnValue();
        v252 = (void *)_AXCreateAXUIElementWithElement();
        objc_msgSend(v250, "dictionaryWithObject:forKey:", v252, CFSTR("targetElement"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        *(_OWORD *)buf = xmmword_19D142620;
        objc_msgSend(v248, "targetRange");
        v253 = (void *)objc_claimAutoreleasedReturnValue();

        if (v253)
        {
          objc_msgSend(v248, "targetRange");
          v254 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "setObject:forKeyedSubscript:", v254, CFSTR("targetRange"));

          objc_msgSend(v248, "targetElement");
          v255 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v248, "targetRange");
          v256 = (void *)objc_claimAutoreleasedReturnValue();
          v257 = objc_msgSend(v255, "_accessibilityRawRangeForUITextRange:", v256);
          v259 = v258;
          *(_QWORD *)buf = v257;
          *(_QWORD *)&buf[8] = v258;

        }
        else
        {
          v257 = 0x7FFFFFFFLL;
          if (objc_msgSend(v248, "targetNSRange") != 0x7FFFFFFF || v260)
          {
            v257 = objc_msgSend(v248, "targetNSRange");
            v259 = v268;
            *(_QWORD *)buf = v257;
            *(_QWORD *)&buf[8] = v268;
          }
          else
          {
            v259 = 0;
          }
        }
        v136 = v299;
        if (v257 != 0x7FFFFFFF || v259)
        {
          v270 = (uint64_t)AXValueCreate(kAXValueTypeCFRange, buf);
          v137 = v301;
          if (!v270)
            goto LABEL_322;
        }
        else
        {
          objc_msgSend(v248, "targetTextMarkerRange");
          v269 = (void *)objc_claimAutoreleasedReturnValue();

          v137 = v301;
          if (!v269)
            goto LABEL_322;
          objc_msgSend(v248, "targetTextMarkerRange");
          v270 = objc_claimAutoreleasedReturnValue();
        }
        v271 = (void *)v270;
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v270, CFSTR("targetRange"));

LABEL_322:
        goto LABEL_239;
      case 95228:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v139 = v7;
        else
          v139 = 0;
        v140 = v139;
        objc_msgSend(a1, "_accessibilityPublicCustomRotorName:", v140);
        v141 = (void *)objc_claimAutoreleasedReturnValue();
        if (v141)
        {
          v142 = objc_msgSend(a1, "_accessibilityPublicCustomRotorVisibleInTouchRotor:", v140);
          v335[0] = v141;
          v334[0] = CFSTR("name");
          v334[1] = CFSTR("visibleInTouchRotor");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v142);
          v143 = (void *)objc_claimAutoreleasedReturnValue();
          v335[1] = v143;
          v334[2] = *MEMORY[0x1E0CF4008];
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "_accessibilityPublicCustomRotorLinkCount:", v140));
          v144 = (void *)objc_claimAutoreleasedReturnValue();
          v335[2] = v144;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v335, v334, 3);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v18 = 0;
        }

        goto LABEL_239;
      case 95229:
        objc_msgSend(a1, "_accessibilityFilenameForAttachmentCID:", v6);
        v17 = objc_claimAutoreleasedReturnValue();
        goto LABEL_233;
      case 95230:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          EventForSceneReferencePoint = v7;
          v145 = 0;
          v146 = 0;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_265;
          objc_msgSend(v7, "valueForKey:", *MEMORY[0x1E0CF4000]);
          EventForSceneReferencePoint = (id)objc_claimAutoreleasedReturnValue();
          buf[0] = 0;
          objc_opt_class();
          objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0CF4018]);
          v221 = (void *)objc_claimAutoreleasedReturnValue();
          __UIAccessibilityCastAsClass();
          v222 = (void *)objc_claimAutoreleasedReturnValue();

          v145 = objc_msgSend(v222, "BOOLValue");
          buf[0] = 0;
          objc_opt_class();
          objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0CF4030]);
          v223 = (void *)objc_claimAutoreleasedReturnValue();
          __UIAccessibilityCastAsClass();
          v224 = (void *)objc_claimAutoreleasedReturnValue();

          v146 = objc_msgSend(v224, "BOOLValue");
        }
        if (!EventForSceneReferencePoint)
          goto LABEL_265;
        objc_msgSend(a1, "_accessibilityFirstContainedElementForTechnology:honoringGroups:shouldAlwaysScroll:", EventForSceneReferencePoint, v145, v146);
        v30 = objc_claimAutoreleasedReturnValue();
        goto LABEL_258;
      case 95231:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v147 = v7;
          v148 = 0;
          v149 = 0;
          v150 = 1;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_265;
          objc_msgSend(v7, "valueForKey:", *MEMORY[0x1E0CF4000]);
          v147 = (id)objc_claimAutoreleasedReturnValue();
          buf[0] = 0;
          objc_opt_class();
          objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0CF4018]);
          v225 = (void *)objc_claimAutoreleasedReturnValue();
          __UIAccessibilityCastAsClass();
          v226 = (void *)objc_claimAutoreleasedReturnValue();

          v148 = objc_msgSend(v226, "BOOLValue");
          buf[0] = 0;
          objc_opt_class();
          objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0CF4030]);
          v227 = (void *)objc_claimAutoreleasedReturnValue();
          __UIAccessibilityCastAsClass();
          v228 = (void *)objc_claimAutoreleasedReturnValue();

          v149 = objc_msgSend(v228, "BOOLValue");
          buf[0] = 0;
          objc_opt_class();
          objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0CF4020]);
          v229 = (void *)objc_claimAutoreleasedReturnValue();
          __UIAccessibilityCastAsClass();
          v230 = (void *)objc_claimAutoreleasedReturnValue();

          v150 = objc_msgSend(v230, "BOOLValue");
        }
        if (v147)
        {
          if (objc_msgSend(a1, "isAccessibilityOpaqueElementProvider"))
          {
            objc_msgSend(a1, "_accessibilityFocusAbsoluteFirstLastOpaqueElement:technology:honorsGroups:shouldAlwaysScroll:", 0, v147, v148, v149);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            +[UIAccessibilityElementTraversalOptions defaultVoiceOverOptions](UIAccessibilityElementTraversalOptions, "defaultVoiceOverOptions");
            v234 = (void *)objc_claimAutoreleasedReturnValue();
            if ((_DWORD)v148)
            {
              +[UIAccessibilityElementTraversalOptions defaultVoiceOverOptionsHonoringGroups](UIAccessibilityElementTraversalOptions, "defaultVoiceOverOptionsHonoringGroups");
              v235 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v235, "leafNodePredicate");
              v236 = (void *)objc_claimAutoreleasedReturnValue();
              v316[0] = MEMORY[0x1E0C809B0];
              v316[1] = 3221225472;
              v316[2] = __73__NSObject_AXPrivCategory___iosAccessibilityAttributeValue_forParameter___block_invoke;
              v316[3] = &unk_1E3DFE7F8;
              v316[4] = a1;
              v317 = v236;
              v237 = v236;
              objc_msgSend(v235, "setLeafNodePredicate:", v316);

              v234 = v235;
            }
            objc_msgSend(v234, "setDirection:", 2);
            objc_msgSend(a1, "_accessibilityLeafDescendantsWithCount:options:", 1, v234);
            v238 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v238, "firstObject");
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v150 && objc_msgSend(v18, "_accessibilityIsRemoteElement"))
            {
              objc_msgSend(a1, "_accessibilityLeafDescendantsWithCount:options:", 10, v234);
              v312 = 0u;
              v313 = 0u;
              v314 = 0u;
              v315 = 0u;
              v239 = (id)objc_claimAutoreleasedReturnValue();
              v240 = objc_msgSend(v239, "countByEnumeratingWithState:objects:count:", &v312, v330, 16);
              if (v240)
              {
                v241 = v240;
                v310 = v147;
                v242 = *(_QWORD *)v313;
                while (2)
                {
                  for (k = 0; k != v241; ++k)
                  {
                    if (*(_QWORD *)v313 != v242)
                      objc_enumerationMutation(v239);
                    v244 = *(void **)(*((_QWORD *)&v312 + 1) + 8 * k);
                    if ((objc_msgSend(v244, "_accessibilityIsRemoteElement") & 1) == 0)
                    {
                      v297 = v244;

                      v18 = v297;
                      goto LABEL_353;
                    }
                  }
                  v241 = objc_msgSend(v239, "countByEnumeratingWithState:objects:count:", &v312, v330, 16);
                  if (v241)
                    continue;
                  break;
                }
LABEL_353:
                v147 = v310;
              }

            }
          }

LABEL_234:
          if (v18)
            goto LABEL_239;
          goto LABEL_235;
        }
LABEL_265:
        v18 = 0;
        goto LABEL_234;
      case 95232:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v151 = v7;
        else
          v151 = 0;
        objc_msgSend(a1, "_accessibilityPublicCustomRotorIdForSystemType:", v151);
        v90 = objc_claimAutoreleasedReturnValue();
        goto LABEL_268;
      case 95233:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v152 = v7;
        else
          v152 = 0;
        objc_msgSend(a1, "_accessibilityHeaderElementsForColumn:", objc_msgSend(v152, "unsignedIntegerValue"));
        v90 = objc_claimAutoreleasedReturnValue();
        goto LABEL_268;
      case 95234:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v153 = v7;
        else
          v153 = 0;
        objc_msgSend(a1, "_accessibilityHeaderElementsForRow:", objc_msgSend(v153, "unsignedIntegerValue"));
        v90 = objc_claimAutoreleasedReturnValue();
        goto LABEL_268;
      case 95235:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_235;
        v154 = objc_msgSend(v7, "integerValue");
        v155 = (void *)MEMORY[0x1E0CB37E8];
        v156 = objc_msgSend(a1, "_accessibilityReinterpretVoiceOverCommand:", v154);
        goto LABEL_213;
      case 95236:
        objc_msgSend(a1, "_accessibilityProcessChildrenForParameter:", v6);
        v17 = objc_claimAutoreleasedReturnValue();
        goto LABEL_233;
      case 95237:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_235;
        objc_msgSend(a1, "_accessibilityAlternativesForTextAtPosition:", objc_msgSend(v7, "unsignedIntegerValue"));
        v17 = objc_claimAutoreleasedReturnValue();
        goto LABEL_233;
      case 95238:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v157 = objc_msgSend(v7, "unsignedIntegerValue");
        else
          v157 = 0;
        objc_msgSend(a1, "_accessibilityNotificationSummary:", v157);
        v90 = objc_claimAutoreleasedReturnValue();
LABEL_268:
        v18 = (void *)v90;
        goto LABEL_239;
      case 95239:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_235;
        objc_msgSend(a1, "_accessibilityDataSeriesValuesForAxis:", objc_msgSend(v7, "unsignedIntegerValue"));
        v17 = objc_claimAutoreleasedReturnValue();
        goto LABEL_233;
      case 95240:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_235;
        objc_msgSend(a1, "_accessibilityDataSeriesTitleForAxis:", objc_msgSend(v7, "unsignedIntegerValue"));
        v17 = objc_claimAutoreleasedReturnValue();
        goto LABEL_233;
      case 95241:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_235;
        objc_msgSend(a1, "_accessibilityDataSeriesMinimumValueForAxis:", objc_msgSend(v7, "unsignedIntegerValue"));
        v17 = objc_claimAutoreleasedReturnValue();
        goto LABEL_233;
      case 95242:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_235;
        objc_msgSend(a1, "_accessibilityDataSeriesMaximumValueForAxis:", objc_msgSend(v7, "unsignedIntegerValue"));
        v17 = objc_claimAutoreleasedReturnValue();
        goto LABEL_233;
      case 95243:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_235;
        objc_msgSend(a1, "_accessibilityDataSeriesGridlinePositionsForAxis:", objc_msgSend(v7, "unsignedIntegerValue"));
        v17 = objc_claimAutoreleasedReturnValue();
        goto LABEL_233;
      case 95244:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_235;
        objc_msgSend(a1, "_accessibilityDataSeriesUnitLabelForAxis:", objc_msgSend(v7, "unsignedIntegerValue"));
        v17 = objc_claimAutoreleasedReturnValue();
        goto LABEL_233;
      case 95245:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_235;
        objc_msgSend(a1, "_accessibilityDataSeriesCategoryLabelsForAxis:", objc_msgSend(v7, "unsignedIntegerValue"));
        v17 = objc_claimAutoreleasedReturnValue();
        goto LABEL_233;
      case 95246:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_235;
        objc_msgSend(a1, "_accessibilityNativeFocusableElements:withQueryString:", 0, v7);
        v17 = objc_claimAutoreleasedReturnValue();
        goto LABEL_233;
      case 95247:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_235;
        objc_msgSend(v7, "doubleValue");
        v159 = fmax(v158, 0.0);
        if (v159 > 1.0)
          v159 = 1.0;
        v160 = a1;
        v161 = 0;
        goto LABEL_159;
      case 95248:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_235;
        objc_msgSend(v7, "doubleValue");
        v159 = fmax(v162, 0.0);
        if (v159 > 1.0)
          v159 = 1.0;
        v160 = a1;
        v161 = 1;
LABEL_159:
        objc_msgSend(v160, "_accessibilityDataSeriesValueDescriptionForPosition:axis:", v161, v159);
        v17 = objc_claimAutoreleasedReturnValue();
        goto LABEL_233;
      case 95249:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || !objc_msgSend(a1, "isAccessibilityOpaqueElementProvider"))
        {
          goto LABEL_235;
        }
        buf[0] = 0;
        objc_opt_class();
        objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0CF4018]);
        v163 = (void *)objc_claimAutoreleasedReturnValue();
        __UIAccessibilityCastAsClass();
        v164 = (void *)objc_claimAutoreleasedReturnValue();

        v165 = objc_msgSend(v164, "BOOLValue");
        buf[0] = 0;
        objc_opt_class();
        objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0CF4038]);
        v166 = (void *)objc_claimAutoreleasedReturnValue();
        __UIAccessibilityCastAsClass();
        v167 = (void *)objc_claimAutoreleasedReturnValue();

        v168 = objc_msgSend(v167, "BOOLValue");
        objc_msgSend(a1, "_accessibilityVisibleOpaqueElementsHonoringGroups:sorted:", v165, v168);
        v17 = objc_claimAutoreleasedReturnValue();
        goto LABEL_233;
      case 95250:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_235;
        buf[0] = 0;
        objc_opt_class();
        objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0CF4018]);
        v169 = (void *)objc_claimAutoreleasedReturnValue();
        __UIAccessibilityCastAsClass();
        v170 = (void *)objc_claimAutoreleasedReturnValue();

        v171 = objc_msgSend(v170, "BOOLValue");
        objc_msgSend(a1, "_accessibilityFirstElementForFocusHonoringGroups:", v171);
        v17 = objc_claimAutoreleasedReturnValue();
        goto LABEL_233;
      case 95251:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_235;
        buf[0] = 0;
        objc_opt_class();
        objc_msgSend(v7, "objectForKey:", *MEMORY[0x1E0CF4018]);
        v172 = (void *)objc_claimAutoreleasedReturnValue();
        __UIAccessibilityCastAsClass();
        v173 = (void *)objc_claimAutoreleasedReturnValue();

        v174 = objc_msgSend(v173, "BOOLValue");
        objc_msgSend(a1, "_accessibilityVisibleElementsHonoringGroups:", v174);
        v17 = objc_claimAutoreleasedReturnValue();
        goto LABEL_233;
      case 95252:
        goto LABEL_12;
      case 95255:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_235;
        objc_msgSend(a1, "_accessibilitySpeakThisElementWithIdentifier:", v7);
        v17 = objc_claimAutoreleasedReturnValue();
        goto LABEL_233;
      case 95258:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_235;
        objc_msgSend(v7, "pointValue");
        v73 = v175;
        v75 = v176;
        EventForSceneReferencePoint = (id)UIAccessibilityCreateEventForSceneReferencePoint(0, v175, v176);
        v18 = 0;
        if ((objc_opt_respondsToSelector() & 1) == 0)
          goto LABEL_259;
        +[UIAccessibilityHitTestOptions dwellControlElementHighlightOptions](UIAccessibilityHitTestOptions, "dwellControlElementHighlightOptions");
        v177 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(EventForSceneReferencePoint, "_setAccessibilityHitTestOptions:", v177);

        goto LABEL_172;
      case 95259:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_235;
        objc_msgSend(a1, "accessibilityCustomAttribute:", v7);
        v17 = objc_claimAutoreleasedReturnValue();
        goto LABEL_233;
      default:
        if (a3 == 96001)
        {
          if (!LookingGlassRuntimeSupportLibraryCore_frameworkLibrary)
          {
            *(_OWORD *)buf = xmmword_1E3DFF380;
            *(_QWORD *)&buf[16] = 0;
            LookingGlassRuntimeSupportLibraryCore_frameworkLibrary = _sl_dlopen();
          }
          if (LookingGlassRuntimeSupportLibraryCore_frameworkLibrary)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              EventForSceneReferencePoint = (id)objc_msgSend(objc_alloc((Class)getLGRRequestClass()), "initWithDictionaryRepresentation:", v7);
              objc_msgSend(EventForSceneReferencePoint, "setServerInstance:", a1);
              objc_msgSend(getLGRRuntimeManagerClass(), "sharedInstance");
              v220 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v220, "handleRequest:", EventForSceneReferencePoint);
              v13 = objc_claimAutoreleasedReturnValue();

              -[NSObject dictionaryRepresentation](v13, "dictionaryRepresentation");
              v16 = objc_claimAutoreleasedReturnValue();
              goto LABEL_250;
            }
          }
        }
        else if (a3 == 96002)
        {
          if (!AXTinkerKitLibraryCore_frameworkLibrary)
          {
            *(_OWORD *)buf = xmmword_1E3DFF398;
            *(_QWORD *)&buf[16] = 0;
            AXTinkerKitLibraryCore_frameworkLibrary = _sl_dlopen();
          }
          if (AXTinkerKitLibraryCore_frameworkLibrary)
          {
            objc_msgSend(getTinkerRuntimeClass(), "shared");
            EventForSceneReferencePoint = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(EventForSceneReferencePoint, "handleRequest:withElement:", v7, a1);
            v30 = objc_claimAutoreleasedReturnValue();
            goto LABEL_258;
          }
        }
        goto LABEL_235;
    }
  }
  if (a3 > 92699)
  {
    switch(a3)
    {
      case 94000:
        objc_msgSend(a1, "accessibilityBoundsForTextMarkers:", v6);
        goto LABEL_230;
      case 94001:
        objc_msgSend(a1, "accessibilityArrayOfTextForTextMarkers:", v6);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v178 = objc_msgSend(v18, "count");
        if (v178 >= 1)
        {
          v179 = v178;
          for (m = 0; m != v179; ++m)
          {
            objc_msgSend(v18, "objectAtIndex:", m);
            v181 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v181, "isAccessibilityElement") & 1) != 0
              || (NSClassFromString(CFSTR("WebAccessibilityObjectWrapper")), (objc_opt_isKindOfClass() & 1) != 0))
            {
              v182 = (const void *)_AXCreateAXUIElementWithElement();
              objc_msgSend(v18, "replaceObjectAtIndex:withObject:", m, v182);
              CFRelease(v182);
            }

          }
        }
        goto LABEL_234;
      case 94002:
        objc_msgSend(a1, "_accessibilityLineStartMarker:", v6);
        v17 = objc_claimAutoreleasedReturnValue();
        break;
      case 94003:
        objc_msgSend(a1, "_accessibilityLineEndMarker:", v6);
        v17 = objc_claimAutoreleasedReturnValue();
        break;
      case 94004:
        objc_msgSend(a1, "_accessibilityNextMarker:", v6);
        v17 = objc_claimAutoreleasedReturnValue();
        break;
      case 94005:
        objc_msgSend(a1, "_accessibilityPreviousMarker:", v6);
        v17 = objc_claimAutoreleasedReturnValue();
        break;
      case 94006:
        objc_msgSend(a1, "_accessibilityObjectForTextMarker:", v6);
        v76 = objc_claimAutoreleasedReturnValue();
        goto LABEL_187;
      case 94007:
        objc_msgSend(v6, "CGPointValue");
        objc_msgSend(a1, "_accessibilityMarkerForPoint:", UIAccessibilitySceneReferencePointToScreenPoint(v183, v184));
        v17 = objc_claimAutoreleasedReturnValue();
        break;
      case 94008:
        objc_msgSend(a1, "accessibilityStringForTextMarkers:", v6);
        v17 = objc_claimAutoreleasedReturnValue();
        break;
      case 94009:
        v63 = objc_msgSend(a1, "_accessibilityLineRangeForPosition:", objc_msgSend(v6, "unsignedIntegerValue"));
        goto LABEL_232;
      case 94010:
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
        EventForSceneReferencePoint = (id)objc_claimAutoreleasedReturnValue();
        v326 = 0u;
        v327 = 0u;
        v328 = 0u;
        v329 = 0u;
        v185 = v7;
        v186 = objc_msgSend(v185, "countByEnumeratingWithState:objects:count:", &v326, v333, 16);
        if (v186)
        {
          v187 = v186;
          v188 = *(_QWORD *)v327;
          do
          {
            for (n = 0; n != v187; ++n)
            {
              if (*(_QWORD *)v327 != v188)
                objc_enumerationMutation(v185);
              v190 = (void *)MEMORY[0x1E0CB3B18];
              objc_msgSend(*(id *)(*((_QWORD *)&v326 + 1) + 8 * n), "CGPointValue");
              objc_msgSend(v190, "valueWithCGPoint:", UIAccessibilitySceneReferencePointToScreenPoint(v191, v192));
              v193 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(EventForSceneReferencePoint, "addObject:", v193);

            }
            v187 = objc_msgSend(v185, "countByEnumeratingWithState:objects:count:", &v326, v333, 16);
          }
          while (v187);
        }

        objc_msgSend(a1, "_accessibilityMarkersForPoints:", EventForSceneReferencePoint);
        v30 = objc_claimAutoreleasedReturnValue();
        goto LABEL_258;
      case 94011:
        objc_msgSend(a1, "_accessibilityMarkerLineEndsForMarkers:", v6);
        v17 = objc_claimAutoreleasedReturnValue();
        break;
      case 94012:
        v63 = objc_msgSend(a1, "_accessibilityRangeForTextMarker:", v6);
        goto LABEL_232;
      case 94013:
        objc_msgSend(a1, "_accessibilityMoveSelectionToMarker:", v6);
        goto LABEL_235;
      case 94014:
        v194 = objc_msgSend(v6, "rangeValue");
        objc_msgSend(a1, "_accessibilityMarkersForRange:", v194, v195);
        v17 = objc_claimAutoreleasedReturnValue();
        break;
      case 94015:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v7, "count") != 3)
          _AXAssert();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v7, "count") != 3)
          goto LABEL_235;
        v196 = v7;
        objc_msgSend(v196, "objectAtIndexedSubscript:", 1);
        v197 = (void *)objc_claimAutoreleasedReturnValue();
        v198 = objc_msgSend(v197, "integerValue");
        objc_msgSend(v196, "objectAtIndexedSubscript:", 2);
        v199 = (void *)objc_claimAutoreleasedReturnValue();
        v200 = objc_msgSend(v199, "unsignedIntegerValue");
        objc_msgSend(v196, "objectAtIndexedSubscript:", 0);
        v201 = (void *)objc_claimAutoreleasedReturnValue();

        v202 = objc_msgSend(a1, "_accessibilityPositionInDirection:offset:forPosition:", v198, v200, objc_msgSend(v201, "unsignedIntegerValue"));
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v202);
        v17 = objc_claimAutoreleasedReturnValue();
        break;
      case 94016:
        v63 = objc_msgSend(a1, "_accessibilityCharacterRangeForPosition:", objc_msgSend(v6, "unsignedIntegerValue"));
        goto LABEL_232;
      case 94017:
        v63 = objc_msgSend(a1, "_accessibilityRangeForTextMarkers:", v6);
        goto LABEL_232;
      default:
        switch(a3)
        {
          case 92700:
            objc_msgSend(v6, "pointValue");
            v20 = v19;
            v22 = v21;
            objc_msgSend(a1, "_accessibilityParentView");
            EventForSceneReferencePoint = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(EventForSceneReferencePoint, "window");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "convertPoint:toView:", EventForSceneReferencePoint, v20, v22);
            v25 = v24;
            v27 = v26;

            v28 = objc_msgSend(a1, "accessibilityLineNumberForPoint:", v25, v27);
            if (v28 == 0x7FFFFFFFFFFFFFFFLL)
              v29 = 0x7FFFFFFFLL;
            else
              v29 = v28;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v29);
            v30 = objc_claimAutoreleasedReturnValue();
            goto LABEL_258;
          case 92701:
            v206 = objc_msgSend(v6, "intValue");
            if (v206 == 0x7FFFFFFF)
              v207 = 0x7FFFFFFFFFFFFFFFLL;
            else
              v207 = v206;
            objc_msgSend(a1, "accessibilityFrameForLineNumber:", v207);
            goto LABEL_230;
          case 92702:
            v208 = (int)objc_msgSend(v6, "intValue");
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              objc_msgSend(a1, "accessibilityAttributedContentForLineNumber:", v208);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              if (v18)
                goto LABEL_239;
            }
            objc_msgSend(a1, "accessibilityContentForLineNumber:", v208);
            v17 = objc_claimAutoreleasedReturnValue();
            break;
          case 92703:
            v209 = objc_msgSend(v6, "rangeValue");
            objc_msgSend(a1, "_accessibilityFrameForRange:", v209, v210);
            goto LABEL_230;
          case 92704:
            v63 = objc_msgSend(a1, "_accessibilityRangeForLineNumber:", (int)objc_msgSend(v6, "intValue"));
            goto LABEL_232;
          default:
            if (a3 != 94500)
              goto LABEL_235;
            objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v50 = objc_msgSend(v49, "BOOLValue");

            objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = objc_msgSend(v51, "BOOLValue");

            objc_msgSend(a1, "_accessibilityScannerElementsGrouped:shouldIncludeNonScannerElements:", v50, v52);
            v17 = objc_claimAutoreleasedReturnValue();
            goto LABEL_233;
        }
        break;
    }
LABEL_233:
    v18 = (void *)v17;
    goto LABEL_234;
  }
  if (a3 <= 92599)
  {
    switch(a3)
    {
      case 92500:
        *(_QWORD *)buf = objc_msgSend(v6, "rangeValue");
        *(_QWORD *)&buf[8] = v53;
        objc_msgSend(a1, "accessibilityLabelForRange:", buf);
        v17 = objc_claimAutoreleasedReturnValue();
        goto LABEL_233;
      case 92501:
      case 92502:
LABEL_12:
        objc_msgSend(a1, "_accessibilityProcessElementsInDirection:forParameter:", a3, v6);
        v17 = objc_claimAutoreleasedReturnValue();
        goto LABEL_233;
      case 92503:
        objc_msgSend(v6, "pointValue");
        v55 = v54;
        v57 = v56;
        objc_msgSend(a1, "_accessibilityParentView");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "window");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = AXConvertFromDisplayPointToWindowPoint(v59, v55, v57);
        v62 = v61;

        objc_msgSend(a1, "_accessibilityLineNumberAndColumnForPoint:", v60, v62);
        v17 = objc_claimAutoreleasedReturnValue();
        goto LABEL_233;
      case 92504:
        v63 = objc_msgSend(a1, "_accessibilityRangeForLineNumberAndColumn:", v6);
LABEL_232:
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v63, v64);
        v17 = objc_claimAutoreleasedReturnValue();
        goto LABEL_233;
      case 92505:
        *(_QWORD *)buf = objc_msgSend(v6, "rangeValue");
        *(_QWORD *)&buf[8] = v65;
        objc_msgSend(a1, "_accessibilityValueForRange:", buf);
        v17 = objc_claimAutoreleasedReturnValue();
        goto LABEL_233;
      case 92506:
        v66 = objc_msgSend(v6, "rangeValue");
        objc_msgSend(a1, "_accessibilityBoundsForRange:", v66, v67);
LABEL_230:
        objc_msgSend(a1, "_accessibilityConvertSystemBoundedScreenRectToContextSpace:");
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:");
        v17 = objc_claimAutoreleasedReturnValue();
        goto LABEL_233;
      case 92507:
      case 92514:
        goto LABEL_235;
      case 92508:
        *(_QWORD *)buf = objc_msgSend(v6, "rangeValue");
        *(_QWORD *)&buf[8] = v68;
        objc_msgSend(a1, "_accessibilityAttributedValueForRange:", buf);
        v17 = objc_claimAutoreleasedReturnValue();
        goto LABEL_233;
      case 92509:
        v69 = (void *)MEMORY[0x1E0CB37E8];
        v70 = objc_msgSend(a1, "_accessibilityIsFirstSiblingForType:", (int)objc_msgSend(v6, "intValue"));
        goto LABEL_68;
      case 92510:
        v69 = (void *)MEMORY[0x1E0CB37E8];
        v70 = objc_msgSend(a1, "_accessibilityIsLastSiblingForType:", (int)objc_msgSend(v6, "intValue"));
LABEL_68:
        objc_msgSend(v69, "numberWithBool:", v70);
        v17 = objc_claimAutoreleasedReturnValue();
        goto LABEL_233;
      case 92511:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v7, "count") != 2)
          goto LABEL_235;
        objc_msgSend(v7, "objectAtIndex:", 0);
        EventForSceneReferencePoint = (id)objc_claimAutoreleasedReturnValue();
        v71 = objc_msgSend(EventForSceneReferencePoint, "unsignedIntegerValue");
        objc_msgSend(v7, "objectAtIndex:", 1);
        v13 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "accessibilityElementForRow:andColumn:", v71, -[NSObject unsignedIntegerValue](v13, "unsignedIntegerValue"));
        v16 = objc_claimAutoreleasedReturnValue();
        goto LABEL_250;
      case 92512:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_235;
        objc_msgSend(v7, "pointValue");
        v73 = v72;
        v75 = v74;
        EventForSceneReferencePoint = (id)UIAccessibilityCreateEventForSceneReferencePoint(0, v72, v74);
        v18 = 0;
        if ((objc_opt_respondsToSelector() & 1) == 0)
          goto LABEL_259;
        objc_msgSend(EventForSceneReferencePoint, "_setAccessibilityHitTestStartsAtElement:", a1);
LABEL_172:
        objc_msgSend(a1, "_accessibilityHitTest:withEvent:", EventForSceneReferencePoint, v73, v75);
        v30 = objc_claimAutoreleasedReturnValue();
        goto LABEL_258;
      case 92513:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_235;
        objc_msgSend(v7, "pointValue");
        objc_msgSend(a1, "_accessibilityDataDetectorScheme:");
        v17 = objc_claimAutoreleasedReturnValue();
        goto LABEL_233;
      case 92515:
        objc_msgSend(a1, "_accessibilityAncestorForSiblingsWithType:", (int)objc_msgSend(v6, "intValue"));
        v76 = objc_claimAutoreleasedReturnValue();
LABEL_187:
        EventForSceneReferencePoint = (id)v76;
        v30 = _AXCreateAXUIElementWithElement();
        goto LABEL_258;
      case 92516:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_235;
        objc_msgSend(a1, "_accessibilityElementsForSearchParameter:", v7);
        v17 = objc_claimAutoreleasedReturnValue();
        goto LABEL_233;
      case 92517:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0
          || (unint64_t)objc_msgSend(v7, "count") < 5
          || (unint64_t)objc_msgSend(v7, "count") >= 8)
        {
LABEL_252:
          _AXAssert();
          goto LABEL_235;
        }
        objc_msgSend(v7, "objectAtIndex:", 0);
        EventForSceneReferencePoint = (id)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v18 = 0;
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_259;
        objc_msgSend(v7, "objectAtIndex:", 1);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v78 = objc_opt_isKindOfClass();

        if ((v78 & 1) != 0)
        {
          objc_msgSend(v7, "objectAtIndex:", 1);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          v307 = objc_msgSend(v79, "integerValue");

        }
        else
        {
          v307 = 0;
        }
        objc_msgSend(v7, "objectAtIndex:", 2);
        v272 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        v273 = objc_opt_isKindOfClass();

        if ((v273 & 1) != 0)
        {
          objc_msgSend(v7, "objectAtIndex:", 2);
          v274 = (void *)objc_claimAutoreleasedReturnValue();
          v275 = objc_msgSend(v274, "rangeValue");
          v305 = v276;

        }
        else
        {
          v305 = 0;
          v275 = 0x7FFFFFFFLL;
        }
        objc_msgSend(v7, "objectAtIndex:", 3);
        v13 = objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v7, "count") < 5)
        {
          v278 = 1;
        }
        else
        {
          objc_msgSend(v7, "objectAtIndex:", 4);
          v277 = (void *)objc_claimAutoreleasedReturnValue();
          v278 = objc_msgSend(v277, "BOOLValue");

        }
        if ((unint64_t)objc_msgSend(v7, "count") < 6)
        {
          v280 = 0;
        }
        else
        {
          objc_msgSend(v7, "objectAtIndex:", 5);
          v279 = (void *)objc_claimAutoreleasedReturnValue();
          v280 = objc_msgSend(v279, "BOOLValue");

        }
        if ((unint64_t)objc_msgSend(v7, "count") < 7)
        {
          v281 = 0;
        }
        else
        {
          objc_msgSend(v7, "objectAtIndex:", 6);
          v281 = (void *)objc_claimAutoreleasedReturnValue();
        }
        BYTE1(v298) = v280;
        LOBYTE(v298) = v278;
        objc_msgSend(a1, "_accessibilityNextOpaqueElementsForTechnology:startElement:direction:searchType:range:shouldScrollToVisible:honorsGroups:", v13, v281, (int)objc_msgSend(EventForSceneReferencePoint, "intValue"), v307, v275, v305, v298);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        AXLogElementTraversal();
        v282 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v282, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          *(_QWORD *)&buf[4] = a1;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v18;
          _os_log_impl(&dword_19D0DD000, v282, OS_LOG_TYPE_INFO, "Next opaque element of %@: %@", buf, 0x16u);
        }

        break;
      default:
        if (a3 != 91512)
          goto LABEL_235;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_235;
        objc_msgSend(a1, "_accessibilityRemoteElementForSceneID:", v7);
        v17 = objc_claimAutoreleasedReturnValue();
        goto LABEL_233;
    }
LABEL_251:

LABEL_259:
    goto LABEL_234;
  }
  if (a3 == 92600)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v7, "count") == 2)
    {
      EventForSceneReferencePoint = v7;
      objc_msgSend(EventForSceneReferencePoint, "objectAtIndexedSubscript:", 0);
      v216 = (void *)objc_claimAutoreleasedReturnValue();
      v217 = objc_msgSend(v216, "rangeValue");
      v219 = v218;

      objc_msgSend(EventForSceneReferencePoint, "objectAtIndexedSubscript:", 1);
      v13 = objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        objc_msgSend(a1, "_accessibilityCellWithRowIndex:column:containingView:", v217, v219, v13);
        v16 = objc_claimAutoreleasedReturnValue();
LABEL_250:
        v18 = (void *)v16;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CF3A00], "sharedInstance");
        v261 = (void *)objc_claimAutoreleasedReturnValue();
        v262 = objc_msgSend(v261, "ignoreLogging");

        if ((v262 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CF3A00], "identifier");
          v263 = (void *)objc_claimAutoreleasedReturnValue();
          AXLoggerForFacility();
          v264 = objc_claimAutoreleasedReturnValue();

          v265 = AXOSLogLevelFromAXLogLevel();
          if (os_log_type_enabled(v264, v265))
          {
            AXColorizeFormatLog();
            v266 = (void *)objc_claimAutoreleasedReturnValue();
            _AXStringForArgs();
            v267 = (void *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v264, v265))
            {
              *(_DWORD *)buf = 138543362;
              *(_QWORD *)&buf[4] = v267;
              _os_log_impl(&dword_19D0DD000, v264, v265, "%{public}@", buf, 0xCu);
            }

          }
        }
LABEL_314:
        v18 = 0;
      }
      goto LABEL_251;
    }
  }
  else if (a3 == 92601)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "CGRectValue");
      v32 = v31;
      v34 = v33;
      v36 = v35;
      v38 = v37;
      objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
      EventForSceneReferencePoint = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(EventForSceneReferencePoint, "coordinateSpace");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(EventForSceneReferencePoint, "fixedCoordinateSpace");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "convertRect:toCoordinateSpace:", v40, v32, v34, v36, v38);
      v42 = v41;
      v44 = v43;
      v46 = v45;
      v48 = v47;

      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", v42, v44, v46, v48);
      v30 = objc_claimAutoreleasedReturnValue();
LABEL_258:
      v18 = (void *)v30;
      goto LABEL_259;
    }
  }
LABEL_235:
  if (AXAttributeAllowsRequeryWhenRemoteElementFails()
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v7, "objectForKey:", CFSTR("IgnoreRemoteElement"));
    v211 = (void *)objc_claimAutoreleasedReturnValue();
    v212 = (void *)_UIAccessibilityIgnoredRemoteElementForQuery;
    _UIAccessibilityIgnoredRemoteElementForQuery = (uint64_t)v211;
    v213 = v211;

    objc_msgSend(a1, "_iosAccessibilityAttributeValue:", a3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v214 = (void *)_UIAccessibilityIgnoredRemoteElementForQuery;
    _UIAccessibilityIgnoredRemoteElementForQuery = 0;

  }
  else
  {
    v18 = 0;
  }
LABEL_239:

  return v18;
}

- (uint64_t)_accessibilityResolvedEditingStyles
{
  return 0;
}

- (id)_accessibilityTextualContext
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a1, "_accessibilityGetBlockForAttribute:", 36);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    (*(void (**)(uint64_t))(v2 + 16))(v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "accessibilityTextualContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(a1, "accessibilityContainer");
      v6 = objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        v7 = (void *)v6;
        while (1)
        {
          objc_msgSend(v7, "accessibilityTextualContext");
          v8 = objc_claimAutoreleasedReturnValue();
          if (v8)
            break;
          objc_msgSend(v7, "accessibilityContainer");
          v5 = (void *)objc_claimAutoreleasedReturnValue();

          v7 = v5;
          if (!v5)
            goto LABEL_11;
        }
        v5 = (void *)v8;
LABEL_11:

      }
      else
      {
        v5 = 0;
      }
    }
    AXSSTextualContextFromUITextualContext(v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (double)_accessibilityMagnifierZoomLevel
{
  return 0.0;
}

- (id)__accessibilityRetrieveFrameOrPathDelegate
{
  id v1;
  void *v2;
  uint64_t v3;
  id v4;

  v1 = a1;
  if (v1)
  {
    while (1)
    {
      objc_msgSend(v1, "_accessibilityFrameDelegate");
      v2 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v2)
      {
        if (!objc_msgSend(v1, "_accessibilityBoolValueForKey:", CFSTR("UIAccessibilityStorageKeyPlatformElementShouldUseAccessibilityNodeAsFrameDelegate")))return v1;
        objc_msgSend(v1, "safeValueForKey:", CFSTR("accessibilityNodeForPlatformElement"));
        v3 = objc_claimAutoreleasedReturnValue();
        if ((id)v3 == v1)
        {

          return v1;
        }
        v2 = (void *)v3;
        if (!v3)
          return v1;
      }
      v4 = v2;

      v1 = v4;
    }
  }
  return v1;
}

- (double)_accessibilityFocusableFrameForZoom
{
  return *MEMORY[0x1E0C9D628];
}

- (uint64_t)_accessibilityReinterpretVoiceOverCommand:()AXPrivCategory
{
  return 0;
}

- (__CFString)_iosAccessibilityAttributeValue:()AXPrivCategory
{
  void *v3;
  __CFString *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  double v27;
  CGFloat x;
  double v29;
  CGFloat y;
  double v31;
  CGFloat width;
  double v33;
  CGFloat height;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  id v40;
  void *v41;
  uint64_t v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  uint64_t v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  BOOL v53;
  double v54;
  void *v55;
  void *v56;
  double v57;
  double v58;
  NSObject *v60;
  void *v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  void *v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  double v83;
  double v84;
  double v85;
  double v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  void *v90;
  uint64_t v91;
  void *v92;
  NSObject *v93;
  void *v94;
  uint64_t v95;
  void *v96;
  uint64_t v97;
  void *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t i;
  void *v103;
  uint64_t v104;
  void *v105;
  uint64_t v106;
  double v107;
  double v108;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  CGFloat v115;
  double v116;
  CGFloat v117;
  double v118;
  CGFloat v119;
  double v120;
  CGFloat v121;
  double v122;
  CGFloat v123;
  double v124;
  CGFloat v125;
  void *v126;
  double v127;
  NSObject *v128;
  id *v129;
  void *v130;
  uint64_t v131;
  void *v132;
  double v133;
  double v134;
  void *v135;
  uint64_t v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  uint64_t v144;
  void *v145;
  void *v146;
  void *v147;
  objc_class *v148;
  objc_class *v149;
  void *v150;
  void *v151;
  double v152;
  double v153;
  double v154;
  double v155;
  void *v156;
  void *v157;
  uint64_t v158;
  uint64_t v159;
  int v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  int v164;
  uint64_t v165;
  uint64_t v166;
  int v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  NSObject *v172;
  void *v173;
  double v174;
  double v175;
  double v176;
  double v177;
  double v178;
  double v179;
  double v180;
  double v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  uint64_t v186;
  uint64_t v187;
  BOOL (*v188)();
  void *v189;
  void *v190;
  id v191;
  id v192;
  uint8_t buf[4];
  __CFString *v194;
  _BYTE v195[128];
  uint64_t v196;
  CGRect v197;
  CGRect v198;
  CGRect v199;
  CGRect v200;
  CGRect v201;
  CGRect v202;
  CGRect v203;
  CGRect v204;

  v3 = a1;
  v4 = 0;
  v196 = *MEMORY[0x1E0C80C00];
  if (a3 <= 2999)
  {
    switch(a3)
    {
      case 2001:
        objc_msgSend(a1, "_accessibilityProcessedLabelAttribute");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2002:
        objc_msgSend(a1, "_accessibilityAXAttributedHint");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2003:
        objc_msgSend(a1, "__accessibilityRetrieveFrameOrPathDelegate");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "accessibilityFrame");
        x = v27;
        y = v29;
        width = v31;
        height = v33;

        goto LABEL_167;
      case 2004:
        if (objc_msgSend(a1, "_accessibilityShouldInheritTraits"))
          v25 = objc_msgSend(v3, "_accessibilityInheritedTraits");
        else
          v25 = objc_msgSend(v3, "accessibilityTraits");
        v159 = v25;
        v160 = objc_msgSend(v3, "_accessibilityIsScrollable");
        v161 = UIAccessibilityTraitScrollable;
        if (!v160)
          v161 = 0;
        v162 = v161 | v159;
        if (objc_msgSend(v3, "_accessibilityHasTextOperations"))
          v163 = UIAccessibilityTraitTextOperationsAvailable;
        else
          v163 = 0;
        v164 = objc_msgSend(v3, "_accessibilityReadAllContinuesWithScroll");
        v165 = *MEMORY[0x1E0CEB118];
        if (!v164)
          v165 = 0;
        v166 = v162 | v163 | v165;
        v167 = objc_msgSend(v3, "_accessibilityIsInTabBar");
        v168 = UIAccessibilityTraitTabButton;
        if (!v167)
          v168 = 0;
        v169 = v166 | v168;
        objc_msgSend(v3, "_accessibilityGetBlockForAttribute:", 5);
        v170 = objc_claimAutoreleasedReturnValue();
        v60 = v170;
        if (v170)
          v170 = (*(uint64_t (**)(uint64_t))(v170 + 16))(v170);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v169 | v170);
        v128 = objc_claimAutoreleasedReturnValue();
        goto LABEL_538;
      case 2005:
        v35 = objc_msgSend(a1, "_accessibilitySelectedTextRange");
        goto LABEL_547;
      case 2006:
        objc_msgSend(a1, "_accessibilityAXAttributedValue");
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "accessibilitySpeechHint");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v39, "count"))
        {
          objc_msgSend(v3, "_accessibilityString:withSpeechHint:", v4, v39);
          v106 = objc_claimAutoreleasedReturnValue();

          v4 = (__CFString *)v106;
        }
        goto LABEL_554;
      case 2007:
        objc_msgSend(a1, "accessibilityActivationPoint");
        if (v108 == -1.0 && v107 == -1.0)
        {
          v55 = (void *)MEMORY[0x1E0CB3B18];
          v52 = -1.0;
          v54 = -1.0;
        }
        else
        {
          objc_msgSend(v3, "_accessibilityConvertSystemBoundedScreenRectToContextSpace:");
          v111 = v110;
          v113 = v112;
          v115 = v114;
          v117 = v116;
          AXDeviceGetMainScreenBounds();
          v119 = v118;
          v121 = v120;
          v123 = v122;
          v125 = v124;
          v198.origin.x = v111;
          v198.origin.y = v113;
          v198.size.width = v115;
          v198.size.height = v117;
          v204.origin.x = v119;
          v204.origin.y = v121;
          v204.size.width = v123;
          v204.size.height = v125;
          if (CGRectIntersectsRect(v198, v204))
          {
            v199.origin.x = v119;
            v199.origin.y = v121;
            v199.size.width = v123;
            v199.size.height = v125;
            if (v111 > CGRectGetWidth(v199))
            {
              v200.origin.x = v119;
              v200.origin.y = v121;
              v200.size.width = v123;
              v200.size.height = v125;
              v111 = CGRectGetWidth(v200) * 0.5;
            }
            v201.origin.x = v119;
            v201.origin.y = v121;
            v201.size.width = v123;
            v201.size.height = v125;
            if (v113 > CGRectGetHeight(v201))
            {
              v202.origin.x = v119;
              v202.origin.y = v121;
              v202.size.width = v123;
              v202.size.height = v125;
              v113 = CGRectGetHeight(v202) * 0.5;
            }
          }
          v55 = (void *)MEMORY[0x1E0CB3B18];
          v52 = v111;
          v54 = v113;
        }
        goto LABEL_541;
      case 2008:
        objc_msgSend(a1, "accessibilityLanguage");
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (v4)
          return v4;
        objc_msgSend((id)*MEMORY[0x1E0CEB258], "accessibilityLanguage");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2009:
        objc_msgSend(a1, "_accessibilityScrollStatus");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2010:
        objc_msgSend(a1, "_accessibilityTextOperations");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2011:
        objc_msgSend(a1, "_accessibilityTextViewTextOperationResponder");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2012:
        objc_msgSend(a1, "_accessibilityTouchContainer");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2013:
        objc_msgSend(a1, "_accessibilityVisibleItemInList");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2014:
        v37 = 1;
        goto LABEL_69;
      case 2015:
        v37 = 0;
LABEL_69:
        objc_msgSend(a1, "_accessibilityContainerInDirection:", v37);
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2016:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "isAccessibilityElement");
        goto LABEL_27;
      case 2017:
        objc_msgSend(a1, "_accessibilityApplication");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2018:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "accessibilityElementIsFocused");
        goto LABEL_27;
      case 2019:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "__accessibilitySupportsActivateAction");
        goto LABEL_27;
      case 2020:
        objc_msgSend(a1, "accessibilityURL");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2021:
        v8 = (void *)MEMORY[0x1E0CB37E8];
        v9 = objc_msgSend(a1, "_accessibilityContextId");
        goto LABEL_228;
      case 2022:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityIsFirstSibling");
        goto LABEL_27;
      case 2023:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityIsLastSibling");
        goto LABEL_27;
      case 2024:
        objc_msgSend(a1, "accessibilityLinkedElement");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2025:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityIsVisibleByCompleteHitTest");
        goto LABEL_27;
      case 2026:
        objc_msgSend(a1, "_accessibilityRetrieveHeaderElements");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2027:
        v35 = objc_msgSend(a1, "_accessibilityRowRange");
        goto LABEL_547;
      case 2028:
        v35 = objc_msgSend(a1, "_accessibilityColumnRange");
        goto LABEL_547;
      case 2029:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "accessibilityRequired");
        goto LABEL_27;
      case 2030:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "accessibilityIsComboBox");
        goto LABEL_27;
      case 2031:
        objc_msgSend(a1, "_accessibilityAutomaticIdentifier");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2032:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityWebSearchResultsActive");
        goto LABEL_27;
      case 2033:
        objc_msgSend(a1, "accessibilityFlowToElements");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2034:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "_accessibilityIsInTableCell"));
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if ((-[__CFString BOOLValue](v4, "BOOLValue") & 1) != 0)
          return v4;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "_accessibilityIsInCollectionCell"));
        v38 = objc_claimAutoreleasedReturnValue();
        goto LABEL_478;
      case 2035:
      case 2037:
      case 2043:
      case 2090:
      case 2091:
      case 2097:
      case 2098:
      case 2112:
      case 2133:
      case 2134:
      case 2135:
      case 2136:
      case 2137:
      case 2138:
      case 2139:
      case 2146:
      case 2173:
      case 2240:
      case 2241:
      case 2242:
      case 2243:
      case 2244:
      case 2245:
      case 2246:
      case 2247:
      case 2248:
      case 2249:
      case 2250:
      case 2251:
      case 2252:
      case 2253:
      case 2254:
      case 2255:
      case 2256:
      case 2257:
      case 2258:
      case 2259:
      case 2260:
      case 2261:
      case 2262:
      case 2263:
      case 2264:
      case 2265:
      case 2266:
      case 2267:
      case 2268:
      case 2269:
      case 2270:
      case 2271:
      case 2272:
      case 2273:
      case 2274:
      case 2275:
      case 2276:
      case 2277:
      case 2278:
      case 2279:
      case 2280:
      case 2281:
      case 2282:
      case 2283:
      case 2284:
      case 2285:
      case 2286:
      case 2287:
      case 2288:
      case 2289:
      case 2290:
      case 2291:
      case 2292:
      case 2293:
      case 2294:
      case 2295:
      case 2296:
      case 2297:
      case 2298:
      case 2299:
      case 2300:
      case 2303:
      case 2309:
      case 2321:
      case 2322:
      case 2323:
      case 2324:
      case 2325:
      case 2326:
      case 2327:
      case 2328:
      case 2329:
      case 2330:
      case 2331:
      case 2332:
      case 2333:
      case 2334:
      case 2335:
      case 2336:
      case 2337:
      case 2338:
      case 2339:
      case 2340:
      case 2341:
      case 2342:
      case 2343:
      case 2344:
      case 2345:
      case 2346:
      case 2347:
      case 2348:
      case 2349:
      case 2350:
      case 2351:
      case 2352:
      case 2353:
      case 2354:
      case 2355:
      case 2356:
      case 2357:
      case 2358:
      case 2359:
      case 2360:
      case 2361:
      case 2362:
      case 2363:
      case 2364:
      case 2365:
      case 2366:
      case 2367:
      case 2368:
      case 2369:
      case 2370:
      case 2371:
      case 2372:
      case 2373:
      case 2374:
      case 2375:
      case 2376:
      case 2377:
      case 2378:
      case 2379:
      case 2380:
      case 2381:
      case 2382:
      case 2383:
      case 2384:
      case 2385:
      case 2386:
      case 2387:
      case 2388:
      case 2389:
      case 2390:
      case 2391:
      case 2392:
      case 2393:
      case 2394:
      case 2395:
      case 2396:
      case 2397:
      case 2398:
      case 2399:
      case 2404:
      case 2405:
      case 2406:
      case 2407:
      case 2408:
      case 2409:
      case 2410:
      case 2411:
      case 2412:
      case 2413:
      case 2414:
      case 2415:
      case 2416:
      case 2417:
      case 2418:
      case 2419:
      case 2420:
      case 2421:
      case 2422:
      case 2423:
      case 2424:
      case 2425:
      case 2426:
      case 2427:
      case 2428:
      case 2429:
      case 2430:
      case 2431:
      case 2432:
      case 2433:
      case 2434:
      case 2435:
      case 2436:
      case 2437:
      case 2438:
      case 2439:
      case 2440:
      case 2441:
      case 2442:
      case 2443:
      case 2444:
      case 2445:
      case 2446:
      case 2447:
      case 2448:
      case 2449:
      case 2450:
      case 2451:
      case 2452:
      case 2453:
      case 2454:
      case 2455:
      case 2456:
      case 2457:
      case 2458:
      case 2459:
      case 2460:
      case 2461:
      case 2462:
      case 2463:
      case 2464:
      case 2465:
      case 2466:
      case 2467:
      case 2468:
      case 2469:
      case 2470:
      case 2471:
      case 2472:
      case 2473:
      case 2474:
      case 2475:
      case 2476:
      case 2477:
      case 2478:
      case 2479:
      case 2480:
      case 2481:
      case 2482:
      case 2483:
      case 2484:
      case 2485:
      case 2486:
      case 2487:
      case 2488:
      case 2489:
      case 2490:
      case 2491:
      case 2492:
      case 2493:
      case 2494:
      case 2495:
      case 2496:
      case 2497:
      case 2498:
      case 2499:
      case 2508:
      case 2509:
      case 2510:
      case 2511:
      case 2512:
      case 2513:
      case 2514:
      case 2515:
      case 2516:
      case 2517:
      case 2518:
      case 2519:
      case 2520:
      case 2521:
      case 2522:
      case 2523:
      case 2524:
      case 2525:
      case 2526:
      case 2527:
      case 2528:
      case 2529:
      case 2530:
      case 2531:
      case 2532:
      case 2533:
      case 2534:
      case 2535:
      case 2536:
      case 2537:
      case 2538:
      case 2539:
      case 2540:
      case 2541:
      case 2542:
      case 2543:
      case 2544:
      case 2545:
      case 2546:
      case 2547:
      case 2548:
      case 2549:
      case 2550:
      case 2551:
      case 2552:
      case 2553:
      case 2554:
      case 2555:
      case 2556:
      case 2557:
      case 2558:
      case 2559:
      case 2560:
      case 2561:
      case 2562:
      case 2563:
      case 2564:
      case 2565:
      case 2566:
      case 2567:
      case 2568:
      case 2569:
      case 2570:
      case 2571:
      case 2572:
      case 2573:
      case 2574:
      case 2575:
      case 2576:
      case 2577:
      case 2578:
      case 2579:
      case 2580:
      case 2581:
      case 2582:
      case 2583:
      case 2584:
      case 2585:
      case 2586:
      case 2587:
      case 2588:
      case 2589:
      case 2590:
      case 2591:
      case 2592:
      case 2593:
      case 2594:
      case 2595:
      case 2596:
      case 2597:
      case 2598:
      case 2599:
        return v4;
      case 2036:
        objc_msgSend(a1, "_accessibilityCustomActionNamesAndIdentifiers");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2038:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "__accessibilityReadAllOnFocus");
        goto LABEL_27;
      case 2039:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityIsAwayAlertElement");
        goto LABEL_27;
      case 2040:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityIsAwayAlertElementNew");
        goto LABEL_27;
      case 2041:
        objc_msgSend(MEMORY[0x1E0CB37A0], "string");
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "accessibilityContainer");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v3;
        v41 = v40;
        if (v40 && v39)
        {
          do
          {
            v42 = objc_msgSend(v39, "indexOfAccessibilityElement:", v41);
            if (v42 == 0x7FFFFFFFFFFFFFFFLL)
            {
              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                objc_msgSend(v39, "_accessibilitySubviews");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                v42 = objc_msgSend(v43, "indexOfObject:", v41);

              }
              else
              {
                v42 = 0x7FFFFFFFFFFFFFFFLL;
              }
            }
            -[__CFString appendFormat:](v4, "appendFormat:", CFSTR("%ld-"), v42);
            v44 = v39;

            objc_msgSend(v44, "accessibilityContainer");
            v39 = (void *)objc_claimAutoreleasedReturnValue();

            v41 = v44;
          }
          while (v39);
        }
        else
        {
          v44 = v40;
        }

        goto LABEL_554;
      case 2042:
        objc_msgSend(a1, "__accessibilityRetrieveFrameOrPathDelegate");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "accessibilityPath");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "_accessibilityConvertSystemBoundedPathToContextSpace:", v45);
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

        goto LABEL_554;
      case 2044:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityIsInAppSwitcher");
        goto LABEL_27;
      case 2045:
        objc_msgSend(a1, "accessibilityInvalidStatus");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2046:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityIsRemoteElement");
        goto LABEL_27;
      case 2047:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_allowCustomActionHintSpeakOverride");
        goto LABEL_27;
      case 2048:
        v11 = (void *)MEMORY[0x1E0CB37E8];
        v12 = objc_msgSend(a1, "_accessibilityMapFeatureType");
        goto LABEL_23;
      case 2049:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityLastHitTestNearBorder");
        goto LABEL_27;
      case 2050:
        v94 = (void *)MEMORY[0x1E0CB3B18];
        objc_msgSend(a1, "_accessibilityTextCursorFrame");
        goto LABEL_319;
      case 2051:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityShouldAnnounceFontInfo");
        goto LABEL_27;
      case 2052:
        v126 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(a1, "_accessibilityActivationDelay");
        goto LABEL_448;
      case 2053:
        v46 = (void *)MEMORY[0x1E0CB37E8];
        v47 = objc_msgSend(a1, "_accessibilityAvailableAutoscrollDirections");
        goto LABEL_532;
      case 2054:
        objc_msgSend(a1, "_accessibilityAutoscrollTarget");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2055:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityIsAutoscrolling");
        goto LABEL_27;
      case 2056:
      case 2088:
        v4 = (__CFString *)MEMORY[0x1E0C9AAB0];
        return v4;
      case 2057:
        objc_msgSend(a1, "_accessibilityVisibleFrame");
        goto LABEL_363;
      case 2058:
        objc_msgSend(a1, "_accessibilityPhotoDescription");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2059:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityKeyboardKeyAllowsTouchTyping");
        goto LABEL_27;
      case 2060:
        objc_msgSend(a1, "_accessibilityElementStoredUserLabel");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2061:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityIsEscapable");
        goto LABEL_27;
      case 2062:
        objc_msgSend(a1, "_accessibilityVisiblePoint");
        v50 = v49;
        v51 = v48;
        v52 = -1.0;
        v53 = v50 == -1.0 && v48 == -1.0;
        v54 = -1.0;
        if (!v53)
          objc_msgSend(v3, "_accessibilityConvertSystemBoundedScreenPointToContextSpace:", v50, v51);
        v55 = (void *)MEMORY[0x1E0CB3B18];
        goto LABEL_541;
      case 2063:
        objc_msgSend(a1, "_accessibilitySupportGesturesAttributes");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2064:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityCanScrollInAtLeastOneDirection");
        goto LABEL_27;
      case 2065:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "isAccessibilityOpaqueElementProvider");
        goto LABEL_27;
      case 2066:
        objc_msgSend(a1, "_accessibilityOpaqueElementParent");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2067:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityRetainsCustomRotorActionSetting");
        goto LABEL_27;
      case 2068:
        v56 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(a1, "_accessibilityDelayBeforeUpdatingOnActivation");
        goto LABEL_436;
      case 2069:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityOverridesInstructionsHint");
        goto LABEL_27;
      case 2070:
        objc_msgSend(a1, "_accessibilityVisiblePointHitTestingAnyElement:", 0);
        if (v57 != -1.0 || v58 != -1.0)
          objc_msgSend(v3, "_accessibilityConvertSystemBoundedScreenPointToContextSpace:", v57, v58);
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPoint:");
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
        AXLogUIA();
        v60 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v194 = v4;
          _os_log_impl(&dword_19D0DD000, v60, OS_LOG_TYPE_INFO, "Return visible point: %@", buf, 0xCu);
        }
        goto LABEL_539;
      case 2071:
        objc_msgSend(a1, "_accessibilityEquivalenceTag");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2072:
        v4 = CFSTR("<unavailable>");
        return v4;
      case 2073:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityAllowsAlternativeCharacterActivation");
        goto LABEL_27;
      case 2074:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityShouldSpeakScrollStatusOnEntry");
        goto LABEL_27;
      case 2075:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityElementVisibilityAffectsLayout");
        goto LABEL_27;
      case 2076:
        objc_msgSend(a1, "_accessibilityActiveKeyboard");
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (v4)
          return v4;
        objc_msgSend(v3, "_accessibilitySoftwareMimicKeyboard");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2077:
        objc_msgSend(a1, "__accessibilityRoleDescription");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2078:
        v61 = (void *)MEMORY[0x1E0CB3B18];
        v62 = objc_msgSend(a1, "_accessibilityIndexPathAsRange");
        goto LABEL_151;
      case 2079:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "__accessibilitySupportsSecondaryActivateAction");
        goto LABEL_27;
      case 2080:
        objc_msgSend(a1, "accessibilityImageOverlayElements");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2081:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityIsInFolder");
        goto LABEL_27;
      case 2082:
        objc_msgSend(a1, "_accessibilityActiveURL");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2083:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityWebViewIsLoading");
        goto LABEL_27;
      case 2084:
        objc_msgSend(a1, "_accessibilitySpeakThisElementsAndStrings");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2085:
        objc_msgSend(a1, "_accessibilitySpeakThisString");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2086:
        v21 = (void *)MEMORY[0x1E0CB37E8];
        v22 = objc_msgSend(a1, "_accessibilityHorizontalSizeClass");
        goto LABEL_543;
      case 2087:
        v21 = (void *)MEMORY[0x1E0CB37E8];
        v22 = objc_msgSend(a1, "_accessibilityVerticalSizeClass");
        goto LABEL_543;
      case 2089:
        objc_msgSend(a1, "_accessibilityPreferredScrollActions");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2092:
      case 2310:
        objc_msgSend(a1, "_accessibilityRemoteParent");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2093:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityShouldScrollRemoteParent");
        goto LABEL_27;
      case 2094:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityHasNativeFocus");
        goto LABEL_27;
      case 2095:
        objc_msgSend(a1, "_accessibilityAccessibleDescendants");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2096:
        objc_msgSend(a1, "_accessibilityAccessibleAncestor");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2099:
        objc_msgSend(a1, "_accessibilityWindow");
        v60 = objc_claimAutoreleasedReturnValue();
        if (!-[NSObject _accessibilityIsIsolatedWindow](v60, "_accessibilityIsIsolatedWindow"))
          goto LABEL_464;
        v128 = v60;
        goto LABEL_538;
      case 2100:
        objc_msgSend(a1, "_accessibilityElementCommunityIdentifier");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2101:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityIsUsingRemoteParentActivateAction");
        goto LABEL_27;
      case 2102:
        objc_msgSend(a1, "_accessibilityTraitsInspectorHumanReadable");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2103:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityShouldSuppressCustomActionsHint");
        goto LABEL_27;
      case 2104:
        objc_msgSend(a1, "_accessibilityTextInputElement");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2105:
        objc_msgSend(a1, "_accessibilityWebAreaURL");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2106:
        v63 = sel_accessibilityScrollRightPage;
        goto LABEL_343;
      case 2107:
        v63 = sel_accessibilityScrollLeftPage;
        goto LABEL_343;
      case 2108:
        v63 = sel_accessibilityScrollUpPage;
        goto LABEL_343;
      case 2109:
        v63 = sel_accessibilityScrollDownPage;
LABEL_343:
        objc_msgSend(a1, "_accessibilityScrollAncestorForSelector:", v63);
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2110:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilitySupportsPressedState");
        goto LABEL_27;
      case 2111:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityIsPressed");
        goto LABEL_27;
      case 2113:
        objc_msgSend(a1, "_accessibilityVisibleOpaqueElements");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2114:
        v11 = (void *)MEMORY[0x1E0CB37E8];
        v12 = objc_msgSend(a1, "_accessibilityExpandedStatus");
        goto LABEL_23;
      case 2115:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityRepresentsInfiniteCollection");
        goto LABEL_27;
      case 2116:
        objc_msgSend(a1, "_accessibilityCurrentStatus");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2117:
        v64 = objc_msgSend(a1, "accessibilityARIARowIndex");
        goto LABEL_346;
      case 2118:
        v64 = objc_msgSend(a1, "accessibilityARIAColumnIndex");
LABEL_346:
        if (v64 == 0x7FFFFFFFFFFFFFFFLL)
          v89 = 0x7FFFFFFFLL;
        else
          v89 = v64;
        v90 = (void *)MEMORY[0x1E0CB37E8];
        goto LABEL_424;
      case 2119:
        v65 = (void *)MEMORY[0x1E0CB37E8];
        v66 = objc_msgSend(a1, "accessibilityARIARowCount");
        goto LABEL_423;
      case 2120:
        v65 = (void *)MEMORY[0x1E0CB37E8];
        v66 = objc_msgSend(a1, "accessibilityARIAColumnCount");
        goto LABEL_423;
      case 2121:
        v65 = (void *)MEMORY[0x1E0CB37E8];
        v66 = objc_msgSend(a1, "_accessibilityRowCount");
        goto LABEL_423;
      case 2122:
        v65 = (void *)MEMORY[0x1E0CB37E8];
        v66 = objc_msgSend(a1, "_accessibilityColumnCount");
        goto LABEL_423;
      case 2123:
        v8 = (void *)MEMORY[0x1E0CB37E8];
        v9 = objc_msgSend(a1, "_accessibilityDisplayId");
        goto LABEL_228;
      case 2124:
        v61 = (void *)MEMORY[0x1E0CB3B18];
        v62 = objc_msgSend(a1, "_accessibilityTextInputElementRangeAsNSRange");
LABEL_151:
        v67 = v62;
        v68 = v61;
        goto LABEL_548;
      case 2125:
        objc_msgSend(a1, "_accessibilityAllContextDescriptors");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2126:
        v129 = (id *)MEMORY[0x1E0CEB258];
        objc_msgSend((id)*MEMORY[0x1E0CEB258], "setContextKitSearchEnabled:", 1);
        objc_msgSend(v3, "_accessibilitySpeakThisElementsAndStrings");
        v130 = (void *)objc_claimAutoreleasedReturnValue();
        _accessibilityPostProcessContextKitData(v130);
        v131 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(*v129, "setContextKitSearchEnabled:", 0);
        goto LABEL_479;
      case 2127:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityViewHierarchyHasNativeFocus");
        goto LABEL_27;
      case 2128:
        objc_msgSend(a1, "_accessibilityPublicCustomRotors");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2129:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityBannerIsSticky");
        goto LABEL_27;
      case 2130:
        objc_msgSend(a1, "__accessibilityRetrieveFrameOrPathDelegate");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "_accessibilityDirectInteractionFrame");
        v71 = v70;
        v73 = v72;
        v75 = v74;
        v77 = v76;

        objc_msgSend(v3, "_accessibilityConvertSystemBoundedScreenRectToContextSpace:", v71, v73, v75, v77);
        v78 = (void *)MEMORY[0x1E0CB3B18];
        goto LABEL_389;
      case 2131:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityShouldSpeakExplorerElementsAfterFocus");
        goto LABEL_27;
      case 2132:
        objc_msgSend(a1, "_accessibilityWatchAutoSpeakElements");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2140:
        objc_msgSend(a1, "_accessibilitySpeakThisPreferredHighlightColor");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_477;
      case 2141:
        objc_msgSend(a1, "_accessibilitySpeakThisPreferredUnderlineColor");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_477;
      case 2142:
        objc_msgSend(a1, "_accessibilityRemoteApplication");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2143:
        objc_msgSend(a1, "_accessibilityParentTableView");
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (v4)
          return v4;
        objc_msgSend(v3, "_accessibilityParentCollectionView");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2144:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityHasBadge");
        goto LABEL_27;
      case 2145:
        objc_msgSend(a1, "_accessibilityContainerTypes");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2147:
        v46 = (void *)MEMORY[0x1E0CB37E8];
        v47 = objc_msgSend(a1, "_accessibilityScanningBehaviorTraits");
        goto LABEL_532;
      case 2148:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityCanDisplayMultipleControllers");
        goto LABEL_27;
      case 2149:
        objc_msgSend(a1, "_accessibilityFocusableFrameForZoom");
        x = v197.origin.x;
        y = v197.origin.y;
        width = v197.size.width;
        height = v197.size.height;
        if (CGRectIsNull(v197))
        {
          v80 = v3;
          v81 = 2003;
          goto LABEL_551;
        }
LABEL_167:
        v82 = v3;
        v83 = x;
        v84 = y;
        v85 = width;
        v86 = height;
LABEL_364:
        objc_msgSend(v82, "_accessibilityConvertSystemBoundedScreenRectToContextSpace:", v83, v84, v85, v86);
LABEL_388:
        v78 = (void *)MEMORY[0x1E0CB3B18];
LABEL_389:
        objc_msgSend(v78, "valueWithRect:");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2150:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityScannerShouldUseActivateInPointMode");
        goto LABEL_27;
      case 2151:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityFullscreenVideoViewIsVisible");
        goto LABEL_27;
      case 2152:
        objc_msgSend(a1, "accessibilitySortDirection");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2153:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityShouldSetNativeFocusWhenATVFocused");
        goto LABEL_27;
      case 2154:
        v87 = 0;
        goto LABEL_174;
      case 2155:
        v87 = 1;
LABEL_174:
        objc_msgSend(a1, "_accessibilityGuideElementInDirection:", v87);
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2156:
        objc_msgSend(a1, "accessibilityErrorMessageElements");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2157:
        v65 = (void *)MEMORY[0x1E0CB37E8];
        v66 = objc_msgSend(a1, "accessibilityBlockquoteLevel");
        goto LABEL_423;
      case 2158:
        objc_msgSend(a1, "_iosAccessibilityAttributeValue:", 2006);
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || (unint64_t)-[__CFString length](v4, "length") < 0x201)
          return v4;
        -[__CFString substringToIndex:](v4, "substringToIndex:", 512);
        v38 = objc_claimAutoreleasedReturnValue();
        goto LABEL_478;
      case 2159:
        v56 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(a1, "_accessibilityFontSize");
        goto LABEL_436;
      case 2160:
        v56 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(a1, "_accessibilityZoomScale");
        goto LABEL_436;
      case 2161:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityShouldIncludeRowRangeInElementDescription");
        goto LABEL_27;
      case 2162:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityIsContainedByPreferredNativeFocusElement");
        goto LABEL_27;
      case 2163:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityHasDragSources");
        goto LABEL_27;
      case 2164:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityHasDragDestinations");
        goto LABEL_27;
      case 2165:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityIsDraggableElementAttribute");
        goto LABEL_27;
      case 2166:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityIsContainedByVideoElement");
        goto LABEL_27;
      case 2167:
        objc_msgSend(a1, "_accessibilityRetrieveLinkedUIElementsFromContainerChain");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2168:
        v56 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(a1, "_accessibilityViewAlpha");
        goto LABEL_436;
      case 2169:
        objc_msgSend(a1, "_accessibilityGuideElementHeaderText");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2170:
        objc_msgSend(a1, "accessibilityDatetimeValue");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2171:
        objc_msgSend(a1, "accessibilityElementRect");
LABEL_363:
        v82 = v3;
        goto LABEL_364;
      case 2172:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityIsScrollAncestor");
        goto LABEL_27;
      case 2174:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityUseContextlessPassthroughForDrag");
        goto LABEL_27;
      case 2175:
        objc_msgSend(a1, "_accessibilityDragSourceDescriptorDictionaryRepresentations");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2176:
        objc_msgSend(a1, "_accessibilityDropPointDescriptorDictionaryRepresentations");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2177:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "accessibilityIsAttachmentElement");
        goto LABEL_27;
      case 2178:
        objc_msgSend(a1, "_accessibilityCustomActionGroupIdentifier");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2179:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "accessibilityIsMediaPlaying");
        goto LABEL_27;
      case 2180:
        objc_msgSend(a1, "_accessibilityHeadingLevel");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2181:
        objc_msgSend(a1, "_iosAccessibilityAttributeValue:", 2003);
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v132 = (void *)MEMORY[0x1E0CB3B18];
        -[__CFString rectValue](v4, "rectValue");
        objc_msgSend(v132, "valueWithSize:", v133, v134);
        v38 = objc_claimAutoreleasedReturnValue();
        goto LABEL_478;
      case 2182:
        objc_msgSend(a1, "_iosAccessibilityAttributeValue:", 2003);
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v135 = (void *)MEMORY[0x1E0CB3B18];
        -[__CFString rectValue](v4, "rectValue");
        objc_msgSend(v135, "valueWithPoint:");
        v38 = objc_claimAutoreleasedReturnValue();
        goto LABEL_478;
      case 2183:
        objc_msgSend(a1, "_accessibilityElementForTextInsertionAndDeletion");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2184:
        objc_msgSend(a1, "_accessibilityGroupedParent");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2185:
        objc_msgSend(a1, "description");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2186:
        objc_msgSend(a1, "_accessibilityAXAttributedUserInputLabelsIncludingFallbacks");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2187:
        if ((objc_msgSend(a1, "_accessibilityShouldApplySemanticGroupContainerType") & 1) != 0)
        {
          v4 = (__CFString *)&unk_1E3E10880;
          return v4;
        }
        v46 = (void *)MEMORY[0x1E0CB37E8];
        v47 = objc_msgSend(v3, "axContainerTypeFromUIKitContainerType:", objc_msgSend(v3, "accessibilityContainerType"));
LABEL_532:
        objc_msgSend(v46, "numberWithUnsignedLong:", v47);
        v7 = objc_claimAutoreleasedReturnValue();
        break;
      case 2188:
        objc_msgSend(a1, "_accessibilityElementHelp");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2189:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityUpdatesSwitchMenu");
        goto LABEL_27;
      case 2190:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityUseElementAtPositionAfterActivation");
        goto LABEL_27;
      case 2191:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityIsStrongPasswordField");
        goto LABEL_27;
      case 2192:
        v88 = (void *)MEMORY[0x1E0CB37E8];
        v89 = objc_msgSend(a1, "_accessibilityNotificationCount");
        v90 = v88;
        goto LABEL_424;
      case 2193:
        objc_msgSend(a1, "_accessibilityTextualContext");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2194:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityKeyboardIsContinuousPathTracking");
        goto LABEL_27;
      case 2195:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityKeyboardIsContinuousPathAvailable");
        goto LABEL_27;
      case 2196:
        objc_msgSend(a1, "_accessibilityNextElementsForSpeakThis");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2197:
        objc_msgSend(a1, "_accessibilitySpeakThisLeafDescendants");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2198:
        v96 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(a1, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_732, 1);
        v60 = objc_claimAutoreleasedReturnValue();
        v97 = -[NSObject isFirstResponder](v60, "isFirstResponder");
        goto LABEL_373;
      case 2199:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityAllowsActivationWithoutBeingNativeFocused");
        goto LABEL_27;
      case 2200:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "accessibilityHasPopup");
        goto LABEL_27;
      case 2201:
        objc_msgSend(a1, "accessibilityPopupValue");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2202:
        objc_msgSend(a1, "_accessibilityTouchContainerStartingWithSelf:", 0);
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2203:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityShouldIncludeMediaDescriptionsRotor");
        goto LABEL_27;
      case 2204:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityCanBecomeNativeFocused");
        goto LABEL_27;
      case 2205:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "accessibilityChildrenContainerGroupingBehaviorHasOverridingParentDelegate");
        goto LABEL_27;
      case 2206:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "accessibilityParentDiscardsChildrenContainerGroupingBehavior");
        goto LABEL_27;
      case 2207:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityIsBannerNotificationElement");
        goto LABEL_27;
      case 2208:
        objc_msgSend(a1, "_accessibilitySelectedChildren");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2209:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilitySkipImageTraitDescription");
        goto LABEL_27;
      case 2210:
        objc_msgSend(a1, "_accessibilityCustomContent");
        v91 = objc_claimAutoreleasedReturnValue();
        if (!v91)
          goto LABEL_509;
        v92 = (void *)v91;
        v191 = 0;
        objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v91, 1, &v191);
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v60 = v191;

        if (!v60)
          goto LABEL_539;
        AXRuntimeLogCommon();
        v93 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
          -[NSObject(AXPrivCategory) _iosAccessibilityAttributeValue:].cold.1();
        goto LABEL_276;
      case 2211:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityRetainsFocusOnScreenChange");
        goto LABEL_27;
      case 2212:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "accessibilityIsInDescriptionListTerm");
        goto LABEL_27;
      case 2213:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "accessibilityIsInDescriptionListDefinition");
        goto LABEL_27;
      case 2214:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityExpandedStatusTogglesOnActivate");
        goto LABEL_27;
      case 2215:
        objc_msgSend(a1, "_accessibilityResolvedEditingStyles");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2216:
        v35 = objc_msgSend(a1, "_accessibilityVisibleTextRange");
        goto LABEL_547;
      case 2217:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityShouldIncludeRemoteParentCustomActions");
        goto LABEL_27;
      case 2218:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityShouldIncludeRegionDescription");
        goto LABEL_27;
      case 2219:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityIsGroupedParent");
        goto LABEL_27;
      case 2220:
        v65 = (void *)MEMORY[0x1E0CB37E8];
        v66 = objc_msgSend(a1, "accessibilitySemanticGroupChildrentCount");
        goto LABEL_423;
      case 2221:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityIncludeRoleInGroupNavigationOnly");
        goto LABEL_27;
      case 2222:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityIncludeRoleDescription");
        goto LABEL_27;
      case 2223:
        v8 = (void *)MEMORY[0x1E0CB37E8];
        v9 = objc_msgSend(a1, "_accessibilitySecureName");
LABEL_228:
        objc_msgSend(v8, "numberWithUnsignedInt:", v9);
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2224:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityShouldUseHostContextIDForPress");
        goto LABEL_27;
      case 2225:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "accessibilityIsFirstItemInSuggestion");
        goto LABEL_27;
      case 2226:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "accessibilityIsLastItemInSuggestion");
        goto LABEL_27;
      case 2227:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "accessibilityIsInsertion");
        goto LABEL_27;
      case 2228:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "accessibilityIsDeletion");
        goto LABEL_27;
      case 2229:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityIsInJindo");
        goto LABEL_27;
      case 2230:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "accessibilityIsMarkAnnotation");
        goto LABEL_27;
      case 2231:
        objc_msgSend(a1, "_accessibilityFirstWebElement");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2232:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityIsMacVisualAppearance");
        goto LABEL_27;
      case 2233:
        objc_msgSend(a1, "_accessibilityDirectTouchOptionsAttribute");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2234:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityShouldUseHostContextIDForTap");
        goto LABEL_27;
      case 2235:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityShouldUseHostContextIDForLongPress");
        goto LABEL_27;
      case 2236:
        v94 = (void *)MEMORY[0x1E0CB3B18];
        objc_msgSend(a1, "_accessibilityKeyboardFrame");
LABEL_319:
        objc_msgSend(v3, "_accessibilityConvertSystemBoundedScreenRectToContextSpace:");
        v78 = v94;
        goto LABEL_389;
      case 2237:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "accessibilityIsInNonNativeTextControl");
        goto LABEL_27;
      case 2238:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityIsJindo");
        goto LABEL_27;
      case 2239:
        objc_msgSend(a1, "_accessibilityTableIndexTitles");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2301:
        if ((objc_msgSend(a1, "conformsToProtocol:", &unk_1EE4C0728) & 1) != 0)
        {
          v95 = 1;
        }
        else
        {
          v171 = objc_msgSend(v3, "accessibilityTraits");
          v95 = (*MEMORY[0x1E0CF4430] & ~v171) == 0;
        }
        objc_msgSend(v3, "_accessibilitySupportsReadingContent");
        v172 = objc_claimAutoreleasedReturnValue();
        v60 = v172;
        if (v172)
          v95 = -[NSObject BOOLValue](v172, "BOOLValue");
        v137 = (void *)MEMORY[0x1E0CB37E8];
        v136 = v95;
        goto LABEL_537;
      case 2302:
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v3, "accessibilityAttributedPageContent");
          v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (v4)
            return v4;
        }
        objc_msgSend(v3, "accessibilityPageContent");
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (v4)
          return v4;
        objc_msgSend(v3, "_accessibilityPageContent");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2304:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityBookShowsDualPages");
        goto LABEL_27;
      case 2305:
        objc_msgSend(a1, "_accessibilityPageTextMarkerRange");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2306:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityIncludeDuringContentReading");
        goto LABEL_27;
      case 2307:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilitySupportsFrameForRange");
        goto LABEL_27;
      case 2308:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilitySupportsRangeForLineNumber");
        goto LABEL_27;
      case 2311:
        v96 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(a1, "_accessibilityContainerTypes");
        v60 = objc_claimAutoreleasedReturnValue();
        v97 = -[NSObject containsObject:](v60, "containsObject:", &unk_1E3E10898);
LABEL_373:
        v136 = v97;
        v137 = v96;
LABEL_537:
        objc_msgSend(v137, "numberWithBool:", v136);
        v128 = objc_claimAutoreleasedReturnValue();
        goto LABEL_538;
      case 2312:
        objc_msgSend(a1, "accessibilityPreviousTextNavigationElement");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2313:
        objc_msgSend(a1, "accessibilityNextTextNavigationElement");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2314:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityTouchContainerShouldOutputBraille");
        goto LABEL_27;
      case 2315:
        objc_msgSend(a1, "_accessibilityCapturedImages");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v182 = 0u;
        v183 = 0u;
        v184 = 0u;
        v185 = 0u;
        v60 = v98;
        v99 = -[NSObject countByEnumeratingWithState:objects:count:](v60, "countByEnumeratingWithState:objects:count:", &v182, v195, 16);
        if (v99)
        {
          v100 = v99;
          v101 = *(_QWORD *)v183;
          do
          {
            for (i = 0; i != v100; ++i)
            {
              if (*(_QWORD *)v183 != v101)
                objc_enumerationMutation(v60);
              UIImagePNGRepresentation(*(UIImage **)(*((_QWORD *)&v182 + 1) + 8 * i));
              v103 = (void *)objc_claimAutoreleasedReturnValue();
              if (v103)
                -[__CFString addObject:](v4, "addObject:", v103);

            }
            v100 = -[NSObject countByEnumeratingWithState:objects:count:](v60, "countByEnumeratingWithState:objects:count:", &v182, v195, 16);
          }
          while (v100);
        }

        goto LABEL_539;
      case 2316:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "accessibilitySupportsTextSelection");
        goto LABEL_27;
      case 2317:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v186 = MEMORY[0x1E0C809B0];
        v187 = 3221225472;
        v188 = __60__NSObject_AXPrivCategory___iosAccessibilityAttributeValue___block_invoke_747;
        v189 = &unk_1E3DFE3B0;
        v190 = a1;
        v6 = __60__NSObject_AXPrivCategory___iosAccessibilityAttributeValue___block_invoke_747();
        goto LABEL_27;
      case 2318:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityElementServesAsHeadingLandmark");
        goto LABEL_27;
      case 2319:
        objc_msgSend(a1, "_accessibilityBrailleMap");
        v104 = objc_claimAutoreleasedReturnValue();
        if (!v104)
          goto LABEL_509;
        v105 = (void *)v104;
        v192 = 0;
        objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v104, 1, &v192);
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
        v60 = v192;

        if (!v60)
          goto LABEL_539;
        AXRuntimeLogCommon();
        v93 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
          -[NSObject(AXPrivCategory) _iosAccessibilityAttributeValue:].cold.1();
LABEL_276:

        goto LABEL_539;
      case 2320:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityIsSwitch");
        goto LABEL_27;
      case 2400:
        objc_msgSend(a1, "accessibilityMathEquation");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2401:
        objc_msgSend(a1, "accessibilityMathMLSource");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2402:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityShouldSpeakMathEquationTrait");
        goto LABEL_27;
      case 2403:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityShouldExpandMathEquation");
        goto LABEL_27;
      case 2500:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityIsTourGuideRunning");
        goto LABEL_27;
      case 2501:
        objc_msgSend(a1, "_accessibilityMapsExplorationCurrentRoadsWithAngles");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2502:
        objc_msgSend(a1, "_accessibilityMapsExplorationCurrentLocation");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2503:
        objc_msgSend(a1, "_accessibilityMapsExplorationCurrentIntersectionDescription");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2504:
        objc_msgSend(a1, "_accessibilityMapsExplorationIncreaseVerbosity");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2505:
        objc_msgSend(a1, "_accessibilityMapsExplorationDecreaseVerbosity");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2506:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityMapsExplorationIsActive");
        goto LABEL_27;
      case 2507:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityMapsExplorationIsPending");
        goto LABEL_27;
      case 2600:
        objc_msgSend(a1, "_accessibilityHandwritingElement");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2601:
        objc_msgSend(a1, "_accessibilityHandwritingAttributes");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 2602:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityRequiresLaTeXInput");
        goto LABEL_27;
      default:
        switch(a3)
        {
          case 2701:
            v8 = (void *)MEMORY[0x1E0CB37E8];
            v9 = objc_msgSend(a1, "_accessibilityEffectiveMediaAnalysisOptions");
            goto LABEL_228;
          case 2702:
            objc_msgSend(a1, "_accessibilityDataSeriesName");
            v7 = objc_claimAutoreleasedReturnValue();
            goto LABEL_29;
          case 2703:
            v11 = (void *)MEMORY[0x1E0CB37E8];
            v12 = objc_msgSend(a1, "_accessibilityDataSeriesType");
            goto LABEL_23;
          case 2704:
            v56 = (void *)MEMORY[0x1E0CB37E8];
            objc_msgSend(a1, "_accessibilityDataSeriesSonificationDuration");
            goto LABEL_436;
          case 2705:
            v5 = (void *)MEMORY[0x1E0CB37E8];
            v6 = objc_msgSend(a1, "_accessibilityDataSeriesSupportsSummarization");
            goto LABEL_27;
          case 2706:
            v5 = (void *)MEMORY[0x1E0CB37E8];
            v6 = objc_msgSend(a1, "_accessibilityDataSeriesSupportsSonification");
            goto LABEL_27;
          case 2707:
            v5 = (void *)MEMORY[0x1E0CB37E8];
            v6 = objc_msgSend(a1, "_accessibilityDataSeriesIncludesTrendlineInSonification");
            goto LABEL_27;
          case 2708:
          case 2715:
          case 2716:
            return v4;
          case 2709:
            objc_msgSend(a1, "_accessibilityMediaAnalysisFrame");
            goto LABEL_388;
          case 2710:
            objc_msgSend(a1, "_accessibilityMediaAnalysisElement");
            v7 = objc_claimAutoreleasedReturnValue();
            goto LABEL_29;
          case 2711:
            objc_msgSend(a1, "_accessibilityChartDescriptor");
            v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
            -[__CFString dictionaryRepresentation](v4, "dictionaryRepresentation");
            v38 = objc_claimAutoreleasedReturnValue();
            goto LABEL_478;
          case 2712:
            objc_msgSend(a1, "_accessibilityChartElement");
            v138 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v138, "accessibilityChartDescriptor");
            v139 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v139, "identifier");
            v140 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v140, "UUIDString");
            v141 = objc_claimAutoreleasedReturnValue();

            v4 = (__CFString *)v141;
            return v4;
          case 2713:
            v5 = (void *)MEMORY[0x1E0CB37E8];
            v6 = objc_msgSend(a1, "_accessibilitySupportsAudiographs");
            goto LABEL_27;
          case 2714:
            objc_msgSend(a1, "_accessibilityChartElement");
            v7 = objc_claimAutoreleasedReturnValue();
            goto LABEL_29;
          case 2717:
            objc_msgSend(a1, "_accessibilityPHAssetLocalIdentifier");
            v7 = objc_claimAutoreleasedReturnValue();
            goto LABEL_29;
          case 2718:
            objc_msgSend(a1, "_accessibilityChartStructureDescription");
            v7 = objc_claimAutoreleasedReturnValue();
            goto LABEL_29;
          case 2719:
            v5 = (void *)MEMORY[0x1E0CB37E8];
            v6 = objc_msgSend(a1, "_accessibilityIsPHAssetLocallyAvailable");
            goto LABEL_27;
          case 2720:
            objc_msgSend(a1, "_accessibilityPhotoLibraryURL");
            v7 = objc_claimAutoreleasedReturnValue();
            goto LABEL_29;
          case 2721:
            objc_msgSend(a1, "_accessibilityFBSceneIdentifier");
            v7 = objc_claimAutoreleasedReturnValue();
            goto LABEL_29;
          default:
            if (a3 != 1503)
              return v4;
            v11 = (void *)MEMORY[0x1E0CB37E8];
            v12 = objc_msgSend(a1, "_accessibilityApplicationOrientation");
            break;
        }
        goto LABEL_23;
    }
    goto LABEL_29;
  }
  if (a3 <= 8999)
  {
    switch(a3)
    {
      case 5001:
        objc_msgSend(a1, "automationElements");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 5002:
        objc_msgSend(a1, "_accessibilityUserTestingParent");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 5003:
        objc_msgSend(a1, "_accessibilityUserTestingElementType");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 5004:
        objc_msgSend(a1, "_accessibilityUserTestingElementBaseType");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 5005:
        v126 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(a1, "_accessibilityMinValue");
        goto LABEL_447;
      case 5006:
        v126 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(a1, "_accessibilityMaxValue");
        goto LABEL_447;
      case 5007:
        objc_msgSend(a1, "_accessibilityMinScrubberPosition");
        goto LABEL_407;
      case 5008:
        objc_msgSend(a1, "_accessibilityMaxScrubberPosition");
LABEL_407:
        objc_msgSend(v3, "_accessibilityConvertSystemBoundedScreenPointToContextSpace:");
        v55 = (void *)MEMORY[0x1E0CB3B18];
        goto LABEL_541;
      case 5009:
        objc_msgSend(a1, "_accessibilityUserTestingElementAttributes");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 5010:
        objc_msgSend((id)*MEMORY[0x1E0CEB258], "_accessibilityMainWindow");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 5011:
        objc_msgSend(a1, "_accessibilityAbsoluteValue");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 5012:
      case 5013:
      case 5040:
      case 5044:
      case 5060:
      case 5065:
      case 5066:
      case 5067:
        return v4;
      case 5014:
        v21 = (void *)MEMORY[0x1E0CB37E8];
        v22 = objc_msgSend(a1, "_accessibilityPageIndex");
        goto LABEL_543;
      case 5015:
        v21 = (void *)MEMORY[0x1E0CB37E8];
        v22 = objc_msgSend(a1, "_accessibilityPageCount");
        goto LABEL_543;
      case 5016:
        objc_msgSend(a1, "_accessibilityUserTestingVisibleCells");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 5017:
        objc_msgSend(a1, "_accessibilityUserTestingVisibleSections");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 5018:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityBackingElementIsValid");
        goto LABEL_27;
      case 5019:
        objc_msgSend(a1, "accessibilityIdentifier");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "_accessibilityPostProcessValueForAutomation:", v39);
        v142 = objc_claimAutoreleasedReturnValue();
        goto LABEL_553;
      case 5020:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityIsTableCell");
        goto LABEL_27;
      case 5021:
        objc_msgSend(a1, "_accessibilityInputIdentifierForKeyboard");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 5022:
        objc_msgSend(a1, "_accessibiltyAvailableKeyplanes");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 5023:
        objc_msgSend(a1, "_accessibilityKeyboardKeyEnteredString");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 5024:
        objc_msgSend(a1, "_accessibilityStatusBar");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 5025:
        objc_msgSend(a1, "_accessibilityAncestry");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 5026:
        v143 = (void *)MEMORY[0x1E0CB3B18];
        v144 = 1;
        goto LABEL_419;
      case 5027:
        v143 = (void *)MEMORY[0x1E0CB3B18];
        v144 = 0;
LABEL_419:
        objc_msgSend(a1, "__accessibilityVisibleScrollArea:", v144);
        v55 = v143;
LABEL_541:
        objc_msgSend(v55, "valueWithPoint:", v52, v54);
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 5028:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityAnimationsInProgress");
        goto LABEL_27;
      case 5029:
        objc_msgSend(a1, "_accessibilityDOMAttributes");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 5030:
        v21 = (void *)MEMORY[0x1E0CB37E8];
        v22 = objc_msgSend(a1, "_accessibilityUserTestingChildrenCount");
LABEL_543:
        objc_msgSend(v21, "numberWithInteger:", v22);
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 5031:
        v11 = (void *)MEMORY[0x1E0CB37E8];
        v12 = objc_msgSend(a1, "_accessibilityPickerType");
        goto LABEL_23;
      case 5032:
        v65 = (void *)MEMORY[0x1E0CB37E8];
        v66 = objc_msgSend(a1, "_accessibilityDatePickerComponentType");
LABEL_423:
        v89 = v66;
        v90 = v65;
LABEL_424:
        objc_msgSend(v90, "numberWithUnsignedInteger:", v89);
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 5033:
        objc_msgSend(a1, "_accessibilityDateTimePickerValues");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 5034:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityIsUserInteractionEnabled");
        goto LABEL_27;
      case 5035:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityKeyboardSupportsGestureMode");
        goto LABEL_27;
      case 5036:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityFauxCollectionViewCellsDisabled");
        goto LABEL_27;
      case 5037:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityIsStarkElement");
        goto LABEL_27;
      case 5038:
        objc_msgSend(a1, "_accessibilityUserTestingActionIdentifiers");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 5039:
        objc_msgSend(a1, "_accessibilityUserTestingSnapshot");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 5041:
        buf[0] = 0;
        objc_opt_class();
        objc_msgSend(v3, "_accessibilityViewController");
        v147 = (void *)objc_claimAutoreleasedReturnValue();
        __UIAccessibilityCastAsClass();
        v60 = objc_claimAutoreleasedReturnValue();

        if (!v60)
          goto LABEL_464;
        -[NSObject title](v60, "title");
        v128 = objc_claimAutoreleasedReturnValue();
        goto LABEL_538;
      case 5042:
        objc_msgSend(a1, "_accessibilityViewController");
        v60 = objc_claimAutoreleasedReturnValue();
        if (v60)
        {
          v148 = (objc_class *)objc_opt_class();
          NSStringFromClass(v148);
          v128 = objc_claimAutoreleasedReturnValue();
LABEL_538:
          v4 = (__CFString *)v128;
        }
        else
        {
LABEL_464:
          v4 = 0;
        }
LABEL_539:

        break;
      case 5043:
        objc_msgSend(a1, "accessibilityPlaceholderValue");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 5045:
        v149 = (objc_class *)objc_opt_class();
        NSStringFromClass(v149);
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 5046:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), a1);
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 5047:
        objc_msgSend(a1, "accessibilityLocalizedStringKey");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 5048:
        objc_msgSend(a1, "accessibilityLocalizationBundleID");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 5049:
        objc_msgSend(a1, "accessibilityLocalizationBundlePath");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 5050:
        objc_msgSend(a1, "accessibilityLocalizedStringTableName");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 5051:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityFauxTableViewCellsDisabled");
        goto LABEL_27;
      case 5052:
        a1 = (void *)*MEMORY[0x1E0CEB258];
        v20 = CFSTR("AXSpeakSelectionLastSpokenString");
LABEL_42:
        objc_msgSend(a1, "_accessibilityValueForKey:", v20);
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 5053:
        v56 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend((id)*MEMORY[0x1E0CEB258], "_accessibilityMagnifierZoomLevel");
LABEL_436:
        objc_msgSend(v56, "numberWithDouble:");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 5054:
        objc_msgSend(a1, "_accessibilityVerticalScrollBarElement");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 5055:
        objc_msgSend(a1, "_accessibilityHorizontalScrollBarElement");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 5056:
        v5 = (void *)MEMORY[0x1E0CB37E8];
        v6 = objc_msgSend(a1, "_accessibilityIsScrollBarIndicator");
LABEL_27:
        v13 = v6;
        v14 = v5;
        goto LABEL_28;
      case 5057:
        v11 = (void *)MEMORY[0x1E0CB37E8];
        v12 = objc_msgSend(a1, "_accessibilityOrientation");
LABEL_23:
        objc_msgSend(v11, "numberWithLong:", v12);
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 5058:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(a1, "_accessibilityAutomationType"));
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 5059:
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v126 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v3, "_accessibilityNumberValue");
LABEL_447:
          *(float *)&v127 = v127;
LABEL_448:
          objc_msgSend(v126, "numberWithFloat:", v127);
          v7 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v80 = v3;
          v81 = 2006;
LABEL_551:
          objc_msgSend(v80, "_iosAccessibilityAttributeValue:", v81);
          v7 = objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_29;
      case 5061:
        objc_msgSend(a1, "_accessibilityWindowSections");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 5062:
        objc_msgSend(a1, "automationCustomProperties");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 5063:
        objc_msgSend(a1, "automationSystemProperties");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 5064:
        v150 = (void *)MEMORY[0x1E0CB3B18];
        objc_msgSend(a1, "_accessibilityContentOffset");
        objc_msgSend(v150, "valueWithCGPoint:");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      case 5068:
        v151 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(a1, "_accessibilityFirstResponderForKeyWindow");
        v60 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v151, "numberWithUnsignedInteger:", -[NSObject _accessibilityBoundaryEdges](v60, "_accessibilityBoundaryEdges"));
        v128 = objc_claimAutoreleasedReturnValue();
        goto LABEL_538;
      case 5069:
        objc_msgSend(a1, "_accessibilityForegroundTextColorAttribute");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_477;
      case 5070:
        objc_msgSend(a1, "_accessibilityBackgroundTextColorAttribute");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_477:
        v4 = objc_retainAutorelease(v79);
        -[__CFString CGColor](v4, "CGColor");
        v38 = objc_claimAutoreleasedReturnValue();
LABEL_478:
        v131 = v38;

LABEL_479:
        v4 = (__CFString *)v131;
        return v4;
      case 5071:
        v145 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(a1, "_accessibilityFirstResponderForKeyWindow");
        v60 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v145, "numberWithInteger:", -[NSObject _accessibilityDigitalCrownScrollAmount](v60, "_accessibilityDigitalCrownScrollAmount"));
        v128 = objc_claimAutoreleasedReturnValue();
        goto LABEL_538;
      case 5072:
        v146 = (void *)MEMORY[0x1E0CB3B18];
        objc_msgSend(a1, "_accessibilityContentSize");
        objc_msgSend(v146, "valueWithSize:");
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_29;
      default:
        switch(a3)
        {
          case 3000:
            objc_msgSend(a1, "_accessibilityFirstElement");
            v7 = objc_claimAutoreleasedReturnValue();
            goto LABEL_29;
          case 3001:
          case 3004:
          case 3005:
          case 3010:
          case 3011:
          case 3012:
          case 3013:
          case 3016:
          case 3017:
          case 3018:
          case 3019:
          case 3023:
          case 3027:
          case 3034:
          case 3035:
          case 3036:
          case 3037:
          case 3040:
          case 3043:
          case 3044:
          case 3045:
          case 3047:
          case 3050:
          case 3051:
          case 3052:
          case 3054:
          case 3060:
          case 3061:
          case 3062:
          case 3063:
          case 3068:
          case 3069:
            return v4;
          case 3002:
            v80 = (void *)*MEMORY[0x1E0CEB258];
            v81 = 3002;
            goto LABEL_551;
          case 3003:
            objc_msgSend(a1, "_accessibilityBundleIdentifier");
            v7 = objc_claimAutoreleasedReturnValue();
            goto LABEL_29;
          case 3006:
            objc_msgSend(a1, "accessibilityTitleElement");
            v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0C99D20], "axArrayByIgnoringNilElementsWithCount:", 1, v4);
            v38 = objc_claimAutoreleasedReturnValue();
            goto LABEL_478;
          case 3007:
            _UIAXLastKeyboardUsed();
            v7 = objc_claimAutoreleasedReturnValue();
            goto LABEL_29;
          case 3008:
            v5 = (void *)MEMORY[0x1E0CB37E8];
            v6 = objc_msgSend(a1, "_accessibilityCameraIrisOpen");
            goto LABEL_27;
          case 3009:
            objc_msgSend(a1, "_accessibilityFirstElementForFocus");
            v7 = objc_claimAutoreleasedReturnValue();
            goto LABEL_29;
          case 3014:
            objc_msgSend(a1, "_accessibilitySupportedLanguages");
            v7 = objc_claimAutoreleasedReturnValue();
            goto LABEL_29;
          case 3015:
            objc_msgSend(a1, "_accessibilityVisibleElementsHonoringGroups:", 0);
            v7 = objc_claimAutoreleasedReturnValue();
            goto LABEL_29;
          case 3020:
            v5 = (void *)MEMORY[0x1E0CB37E8];
            v6 = objc_msgSend(a1, "_accessibilityIsInternationalKeyboardKey");
            goto LABEL_27;
          case 3021:
            v5 = (void *)MEMORY[0x1E0CB37E8];
            v6 = objc_msgSend(a1, "_accessibilityIsAccessibilityUIServer");
            goto LABEL_27;
          case 3022:
            objc_msgSend(a1, "_accessibilityExplorerElements");
            v7 = objc_claimAutoreleasedReturnValue();
            goto LABEL_29;
          case 3024:
            objc_msgSend(a1, "_accessibilityNativeFocusElement");
            v7 = objc_claimAutoreleasedReturnValue();
            goto LABEL_29;
          case 3025:
          case 3032:
            objc_msgSend(a1, "_accessibilityElementsWithSemanticContext:", 0);
            v7 = objc_claimAutoreleasedReturnValue();
            goto LABEL_29;
          case 3026:
            v5 = (void *)MEMORY[0x1E0CB37E8];
            v6 = objc_msgSend(a1, "_accessibilityIsRTL");
            goto LABEL_27;
          case 3028:
            v5 = (void *)MEMORY[0x1E0CB37E8];
            v6 = objc_msgSend(a1, "_accessibilityIsSoftwareKeyboardMimic");
            goto LABEL_27;
          case 3029:
          case 3031:
            objc_msgSend(a1, "_accessibilityNativeFocusableElements:", 0);
            v7 = objc_claimAutoreleasedReturnValue();
            goto LABEL_29;
          case 3030:
            v5 = (void *)MEMORY[0x1E0CB37E8];
            v6 = objc_msgSend(a1, "_accessibilitySupportsDirectioOrbManipulation");
            goto LABEL_27;
          case 3033:
            objc_msgSend(a1, "accessibilityExpandedTextValue");
            v7 = objc_claimAutoreleasedReturnValue();
            goto LABEL_29;
          case 3038:
            v5 = (void *)MEMORY[0x1E0CB37E8];
            v6 = objc_msgSend(a1, "_accessibilityRealtimeCompleted");
            goto LABEL_27;
          case 3039:
            v5 = (void *)MEMORY[0x1E0CB37E8];
            v6 = objc_msgSend(a1, "_accessibilityRealtimeHasUnread");
            goto LABEL_27;
          case 3041:
            objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
            v60 = objc_claimAutoreleasedReturnValue();
            -[NSObject processName](v60, "processName");
            v128 = objc_claimAutoreleasedReturnValue();
            goto LABEL_538;
          case 3042:
            objc_msgSend(a1, "accessibilityLinkRelationshipType");
            v7 = objc_claimAutoreleasedReturnValue();
            goto LABEL_29;
          case 3046:
            objc_msgSend(a1, "_accessibilityFirstElementsForSpeakThis");
            v7 = objc_claimAutoreleasedReturnValue();
            goto LABEL_29;
          case 3048:
            v5 = (void *)MEMORY[0x1E0CB37E8];
            v6 = objc_msgSend(a1, "_accessibilityHasNativeFocusableElements");
            goto LABEL_27;
          case 3049:
            objc_msgSend(a1, "_accessibilityFocusRingAncestor");
            v7 = objc_claimAutoreleasedReturnValue();
            goto LABEL_29;
          case 3053:
            objc_msgSend(a1, "accessibilityVisibleText");
            v7 = objc_claimAutoreleasedReturnValue();
            goto LABEL_29;
          case 3055:
            objc_msgSend(a1, "_accessibilityWindow");
            v7 = objc_claimAutoreleasedReturnValue();
            goto LABEL_29;
          case 3056:
            objc_msgSend(a1, "_accessibilityWindowSceneIdentifier");
            v7 = objc_claimAutoreleasedReturnValue();
            goto LABEL_29;
          case 3057:
            objc_msgSend(a1, "_accessibility2DBrailleCanvasElement");
            v7 = objc_claimAutoreleasedReturnValue();
            goto LABEL_29;
          case 3058:
            objc_msgSend(a1, "accessibilityBrailleMapRenderRegion");
            v152 = v203.origin.x;
            v153 = v203.origin.y;
            v154 = v203.size.width;
            v155 = v203.size.height;
            if (CGRectIsEmpty(v203))
            {
LABEL_509:
              v4 = 0;
              return v4;
            }
            objc_msgSend(v3, "_accessibilityParentView");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "window");
            v173 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "convertRect:toView:", v173, v152, v153, v154, v155);
            objc_msgSend(v3, "_accessibilityConvertSystemBoundedScreenRectToContextSpace:");
            v175 = v174;
            v177 = v176;
            v179 = v178;
            v181 = v180;

            objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:", v175, v177, v179, v181);
            v142 = objc_claimAutoreleasedReturnValue();
            break;
          case 3059:
            v5 = (void *)MEMORY[0x1E0CB37E8];
            v6 = objc_msgSend(a1, "_accessibilityElementHasImage");
            goto LABEL_27;
          case 3064:
            objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
            v156 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v156, "preferredLocalizations");
            v157 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v157, "firstObject");
            v158 = objc_claimAutoreleasedReturnValue();

            v4 = (__CFString *)v158;
            return v4;
          case 3065:
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", BSGetVersionedPID());
            v7 = objc_claimAutoreleasedReturnValue();
            goto LABEL_29;
          case 3066:
            v5 = (void *)MEMORY[0x1E0CB37E8];
            v6 = objc_msgSend(a1, "_accessibilityApplicationIsRTL");
            goto LABEL_27;
          case 3067:
            objc_msgSend(a1, "_accessibilityRuntimeElementTransactionSummary");
            v7 = objc_claimAutoreleasedReturnValue();
            goto LABEL_29;
          case 3070:
            objc_msgSend(a1, "_accessibilityGetAllScrollViews");
            v7 = objc_claimAutoreleasedReturnValue();
            goto LABEL_29;
          default:
            switch(a3)
            {
              case 4001:
                v21 = (void *)MEMORY[0x1E0CB37E8];
                v22 = objc_msgSend(a1, "_accessibilityLineStartPosition");
                goto LABEL_543;
              case 4002:
                v21 = (void *)MEMORY[0x1E0CB37E8];
                v22 = objc_msgSend(a1, "_accessibilityLineEndPosition");
                goto LABEL_543;
              case 4003:
                objc_msgSend(a1, "_accessibilityTextMarkerRange");
                v7 = objc_claimAutoreleasedReturnValue();
                goto LABEL_29;
              case 4004:
                objc_msgSend(a1, "_accessibilityTextMarkerRangeForSelection");
                v7 = objc_claimAutoreleasedReturnValue();
                goto LABEL_29;
              case 4005:
                v35 = objc_msgSend(a1, "_accessibilitySelectedNSRangeForObject");
LABEL_547:
                v67 = v35;
                v68 = (void *)MEMORY[0x1E0CB3B18];
LABEL_548:
                objc_msgSend(v68, "valueWithRange:", v67, v36);
                v7 = objc_claimAutoreleasedReturnValue();
                goto LABEL_29;
              case 4006:
                v5 = (void *)MEMORY[0x1E0CB37E8];
                v6 = objc_msgSend(a1, "_accessibilityHoverTypingShouldAdjustDockedMode");
                goto LABEL_27;
              default:
                return v4;
            }
            return v4;
        }
LABEL_553:
        v4 = (__CFString *)v142;
LABEL_554:

        return v4;
    }
  }
  else
  {
    if (a3 <= 13000)
    {
      switch(a3)
      {
        case 12000:
          v5 = (void *)MEMORY[0x1E0CB37E8];
          v6 = objc_msgSend(a1, "_accessibilityIsScannerElement");
          goto LABEL_27;
        case 12001:
        case 12005:
          return v4;
        case 12002:
          objc_msgSend(a1, "_accessibilityVariantKeys");
          v7 = objc_claimAutoreleasedReturnValue();
          goto LABEL_29;
        case 12003:
          v5 = (void *)MEMORY[0x1E0CB37E8];
          v6 = objc_msgSend(a1, "_accessibilityHasVariantKeys");
          goto LABEL_27;
        case 12004:
          v11 = (void *)MEMORY[0x1E0CB37E8];
          v12 = objc_msgSend(a1, "_accessibilityScannerActivateBehavior");
          goto LABEL_23;
        case 12006:
          v5 = (void *)MEMORY[0x1E0CB37E8];
          v6 = objc_msgSend(a1, "_accessibilityKeyboardKeyHasSignificantAlternateActions");
          goto LABEL_27;
        case 12007:
          v5 = (void *)MEMORY[0x1E0CB37E8];
          v6 = objc_msgSend(a1, "_accessibilityHandlesTabKey");
          goto LABEL_27;
        case 12008:
          v5 = (void *)MEMORY[0x1E0CB37E8];
          v6 = objc_msgSend(a1, "_accessibilityHandlesRemoteFocusMovement");
          goto LABEL_27;
        case 12009:
          v16 = (void *)MEMORY[0x1E0CB37E8];
          v17 = objc_msgSend(a1, "_accessibilityRemotePid");
          goto LABEL_36;
        case 12010:
          v16 = (void *)MEMORY[0x1E0CB37E8];
          v17 = objc_msgSend(a1, "_accessibilityHostPid");
          goto LABEL_36;
        case 12011:
          objc_msgSend(a1, "_accessibilityFKAArrowKeysHandled");
          v7 = objc_claimAutoreleasedReturnValue();
          goto LABEL_29;
        case 12012:
          v16 = (void *)MEMORY[0x1E0CB37E8];
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v17 = objc_msgSend(v3, "onClientSide");
LABEL_36:
            v18 = v17;
          }
          else
          {
            v18 = 0;
          }
          v19 = v16;
LABEL_51:
          objc_msgSend(v19, "numberWithInt:", v18);
          v7 = objc_claimAutoreleasedReturnValue();
          break;
        case 12013:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v18 = objc_msgSend(v3, "remotePid");
          else
            v18 = 0;
          v19 = (void *)MEMORY[0x1E0CB37E8];
          goto LABEL_51;
        case 12014:
          objc_msgSend(a1, "_accessibilityRemoteSceneID");
          v7 = objc_claimAutoreleasedReturnValue();
          goto LABEL_29;
        case 12015:
          v20 = CFSTR("_promoteSwitchControlMenuItemsKey");
          goto LABEL_42;
        case 12016:
          objc_msgSend(a1, "_accessibilityTapReplacementGestures");
          v7 = objc_claimAutoreleasedReturnValue();
          goto LABEL_29;
        case 12017:
          objc_msgSend(a1, "_accessibilityScannerGroupElements");
          v7 = objc_claimAutoreleasedReturnValue();
          goto LABEL_29;
        default:
          if (a3 != 9000)
            return v4;
          objc_msgSend(a1, "_accessibilityGesturePracticeRegion");
          objc_msgSend(v3, "_accessibilityConvertSystemBoundedScreenRectToContextSpace:");
          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:");
          v7 = objc_claimAutoreleasedReturnValue();
          break;
      }
      goto LABEL_29;
    }
    if (a3 == 13001)
    {
      objc_msgSend(a1, "_accessibilitySemanticContext");
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_29:
      v4 = (__CFString *)v7;
      return v4;
    }
    if (a3 == 13002)
    {
      if ((objc_msgSend(a1, "_accessibilityUnfocusableViewCanBeFocusedForHoverText") & 1) != 0)
      {
        v10 = 1;
      }
      else
      {
        objc_msgSend(v3, "_accessibilityGetBlockForAttribute:", 31);
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = (void *)v23;
        if (v23)
          v10 = (*(uint64_t (**)(uint64_t))(v23 + 16))(v23);
        else
          v10 = 0;

      }
      v14 = (void *)MEMORY[0x1E0CB37E8];
      v13 = v10;
LABEL_28:
      objc_msgSend(v14, "numberWithBool:", v13);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_29;
    }
  }
  return v4;
}

- (void)_iosAccessibilitySetValue:()AXPrivCategory forAttribute:
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (a4 <= 3001)
  {
    if (a4 > 2207)
    {
      if (a4 > 2707)
      {
        if (a4 == 2708)
        {
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v7, "doubleValue");
              objc_msgSend(a1, "_accessibilityDidChangeSonificationPlaybackPosition:");
            }
          }
        }
        else if (a4 == 2716)
        {
          objc_msgSend(a1, "_accessibilitySonificationPlaybackStatusChanged:", objc_msgSend(v6, "unsignedIntegerValue"));
        }
      }
      else if (a4 == 2208)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(a1, "_accessibilitySetSelectedChildren:", v7);
      }
      else if (a4 == 2303)
      {
        objc_msgSend(a1, "_accessibilitySetCurrentWordInPageContext:", v6);
      }
    }
    else if (a4 > 2017)
    {
      if (a4 == 2018)
      {
        objc_opt_class();
        __UIAccessibilityCastAsClass();
        v8 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("focused"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "BOOLValue");
        objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CF4000]);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_accessibilityHandleATFocused:assistiveTech:", v17, v18);

        goto LABEL_57;
      }
      if (a4 == 2054)
        objc_msgSend(a1, "_accessibilitySetAutoscrollTarget:", v6);
    }
    else
    {
      if (a4 == 2005)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v19 = objc_msgSend(v7, "rangeValue");
          objc_msgSend(a1, "_accessibilitySetSelectedTextRange:", v19, v20);
          goto LABEL_58;
        }
        v8 = v7;
        objc_msgSend(v8, "firstObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "rangeValue");
        v13 = v12;

        objc_msgSend(v8, "lastObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "integerValue");

        if (v15 == 1)
        {
          AXSetSelectionModeVoiceOverSelectionMovement(1);
          objc_msgSend(a1, "_accessibilitySetSelectedTextRange:", v11, v13);
          AXSetSelectionModeVoiceOverSelectionMovement(0);
        }
        else
        {
          objc_msgSend(a1, "_accessibilitySetSelectedTextRange:", v11, v13);
        }
LABEL_57:

        goto LABEL_58;
      }
      if (a4 == 2006)
        objc_msgSend(a1, "_accessibilitySetValue:", v6);
    }
  }
  else if (a4 <= 5035)
  {
    if (a4 > 3016)
    {
      if (a4 == 3017)
      {
        objc_msgSend((id)*MEMORY[0x1E0CEB258], "_accessibilitySetWantsOpaqueElementProviders:", objc_msgSend(v6, "BOOLValue"));
      }
      else if (a4 == 3026)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(a1, "_accessibilitySetVoiceOverRTLOverride:", objc_msgSend(v7, "integerValue"));
      }
    }
    else if (a4 == 3002)
    {
      if (objc_msgSend(v6, "_accessibilityCanBeFirstResponder"))
        objc_msgSend(v7, "becomeFirstResponder");
    }
    else if (a4 == 3007)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        _UIAXSetLastKeyboardUsed(v7);
    }
  }
  else if (a4 <= 5063)
  {
    if (a4 == 5036)
    {
      objc_msgSend(a1, "_setAccessibilityFauxCollectionViewCellsDisabled:", objc_msgSend(v6, "BOOLValue"));
    }
    else if (a4 == 5051)
    {
      objc_msgSend(a1, "_setAccessibilityFauxTableViewCellsDisabled:", objc_msgSend(v6, "BOOLValue"));
    }
  }
  else if (a4 == 5064)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(a1, "_accessibilityScrollAncestor");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "pointValue");
      objc_msgSend(v9, "accessibilityApplyScrollContent:sendScrollStatus:animated:", 0, 0);

    }
  }
  else
  {
    if (a4 != 12015)
    {
      if (a4 == 5067)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v7, "integerValue");
          _AXSVoiceOverTouchSetEnabledAppTemporaryOverride();
        }
      }
      goto LABEL_58;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_accessibilitySetAdditionalImportantScannerMenuItems:", v8);
      goto LABEL_57;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(a1, "_accessibilitySetAdditionalImportantScannerMenuItems:", v7);
  }
LABEL_58:

}

- (id)_getAccessibilityAttributedString
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "accessibilityLabel");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_accessibilityAttributedLocalizedString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)_accessibilityRetrieveLocalizedStringKey
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_getAccessibilityAttributedString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "attributeValueForKey:", CFSTR("UIAccessibilityTokenLocalizedStringKey"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)_accessibilityRetrieveLocalizationBundleID
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_getAccessibilityAttributedString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "attributeValueForKey:", CFSTR("UIAccessibilityTokenLocalizedStringBundleID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)_accessibilityRetrieveLocalizationBundlePath
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_getAccessibilityAttributedString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "attributeValueForKey:", CFSTR("UIAccessibilityTokenLocalizationBundlePath"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)_accessibilityRetrieveLocalizedStringTableName
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_getAccessibilityAttributedString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "attributeValueForKey:", CFSTR("UIAccessibilityTokenLocalizedStringTableName"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)_accessibilityShouldInheritTraits
{
  return 0;
}

- (uint64_t)_accessibilityInheritedTraits
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v2 = objc_msgSend(a1, "accessibilityTraits");
  objc_msgSend(a1, "accessibilityContainer");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)v3;
    do
    {
      v5 = objc_msgSend(v4, "accessibilityTraits");
      objc_msgSend(v4, "accessibilityContainer");
      v6 = objc_claimAutoreleasedReturnValue();

      v2 |= v5;
      v4 = (void *)v6;
    }
    while (v6);
  }
  return v2;
}

- (id)_accessibilityTraitsAsHumanReadableStrings:()AXPrivCategory
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99DE8]), "init");
  v5 = (void *)objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C99DE8]), "init");
  v6 = v5;
  if ((*MEMORY[0x1E0CEB110] & ~a3) == 0)
    objc_msgSend(v5, "addObject:", CFSTR("trait.button"));
  if ((*MEMORY[0x1E0CEB138] & ~a3) == 0)
    objc_msgSend(v6, "addObject:", CFSTR("trait.link"));
  if ((*MEMORY[0x1E0CEB158] & ~a3) == 0)
    objc_msgSend(v6, "addObject:", CFSTR("trait.searchfield"));
  if ((*MEMORY[0x1E0CEB128] & ~a3) == 0)
    objc_msgSend(v6, "addObject:", CFSTR("trait.image"));
  if ((*MEMORY[0x1E0CEB160] & ~a3) == 0)
    objc_msgSend(v6, "addObject:", CFSTR("trait.selected"));
  if ((*MEMORY[0x1E0CEB150] & ~a3) == 0)
    objc_msgSend(v6, "addObject:", CFSTR("trait.playssound"));
  if ((*MEMORY[0x1E0CEB130] & ~a3) == 0)
    objc_msgSend(v6, "addObject:", CFSTR("trait.keyboardkey"));
  if ((*MEMORY[0x1E0CEB170] & ~a3) == 0)
    objc_msgSend(v6, "addObject:", CFSTR("trait.statictext"));
  if ((*MEMORY[0x1E0CEB178] & ~a3) == 0)
    objc_msgSend(v6, "addObject:", CFSTR("trait.summaryelement"));
  if ((*MEMORY[0x1E0CEB148] & ~a3) == 0)
    objc_msgSend(v6, "addObject:", CFSTR("trait.notenabled"));
  if ((*MEMORY[0x1E0CEB190] & ~a3) == 0)
    objc_msgSend(v6, "addObject:", CFSTR("trait.updatesfrequently"));
  if ((*MEMORY[0x1E0CEB168] & ~a3) == 0)
    objc_msgSend(v6, "addObject:", CFSTR("trait.startsmedia"));
  if ((*MEMORY[0x1E0CEB100] & ~a3) == 0)
    objc_msgSend(v6, "addObject:", CFSTR("trait.adjustable"));
  if ((*MEMORY[0x1E0CEB118] & ~a3) == 0)
    objc_msgSend(v6, "addObject:", CFSTR("trait.causes.page.turn"));
  if ((*MEMORY[0x1E0CEB108] & ~a3) == 0)
    objc_msgSend(v6, "addObject:", CFSTR("trait.direct.interaction"));
  if ((*MEMORY[0x1E0CEB120] & ~a3) == 0)
    objc_msgSend(v6, "addObject:", CFSTR("trait.header"));
  if ((UIAccessibilityTraitTabButton & ~a3) == 0)
    objc_msgSend(v6, "addObject:", CFSTR("trait.tab"));
  if ((*MEMORY[0x1E0CEB188] & ~a3) == 0)
    objc_msgSend(v6, "addObject:", CFSTR("trait.toggle"));
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        UIKitAccessibilityLocalizedString(v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          v15 = v12;
          _AXAssert();
        }
        if (objc_msgSend(v13, "length", v15))
          objc_msgSend(v4, "addObject:", v13);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  return v4;
}

- (uint64_t)_accessibilityTraitsInspectorHumanReadable
{
  return objc_msgSend(a1, "_accessibilityTraitsAsHumanReadableStrings:", objc_msgSend(a1, "accessibilityTraits"));
}

- (id)_accessibilityPreferredScrollActions
{
  id v2;
  int v3;
  int v4;
  int v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = objc_msgSend(a1, "_accessibilityCanPerformAction:", 2009);
  v4 = objc_msgSend(a1, "_accessibilityCanPerformAction:", 2008);
  v5 = objc_msgSend(a1, "_accessibilityCanPerformAction:", 2007);
  v6 = objc_msgSend(a1, "_accessibilityCanPerformAction:", 2006);
  v7 = &unk_1E3E108C8;
  if (!v5)
    v7 = 0;
  if (v6)
    v8 = &unk_1E3E108B0;
  else
    v8 = v7;
  objc_msgSend(v2, "axSafelyAddObject:", v8);
  v9 = &unk_1E3E108F8;
  if (!v4)
    v9 = 0;
  if (v3)
    v10 = &unk_1E3E108E0;
  else
    v10 = v9;
  objc_msgSend(v2, "axSafelyAddObject:", v10);
  return v2;
}

- (uint64_t)_accessibilityIsKindOfUIView
{
  return 0;
}

- (uint64_t)_accessibilityIsRemoteElement
{
  return 0;
}

- (uint64_t)_accessibilitySupportsChartsV2
{
  return objc_msgSend(a1, "_accessibilityBoolValueForKey:", CFSTR("_accessibilitySupportsChartsV2"));
}

- (uint64_t)_accessibilitySetSupportsChartsV2:()AXPrivCategory
{
  return objc_msgSend(a1, "_accessibilitySetBoolValue:forKey:", a3, CFSTR("_accessibilitySupportsChartsV2"));
}

- (uint64_t)_accessibilityViewIsMacIdiom
{
  return 0;
}

- (uint64_t)_accessibilityIsMacVisualAppearance
{
  return 0;
}

- (uint64_t)_accessibilityShouldSuppressCustomActionsHint
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_accessibilityCustomActions");
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v7;
    while (2)
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v7 != v3)
          objc_enumerationMutation(v1);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * i), "shouldSuppressActionHint", (_QWORD)v6) & 1) != 0)
        {
          v2 = 1;
          goto LABEL_11;
        }
      }
      v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
      if (v2)
        continue;
      break;
    }
  }
LABEL_11:

  return v2;
}

- (uint64_t)_accessibilityCanBeFirstResponderWhenNotAnElement
{
  return 0;
}

- (uint64_t)_accessibilityCanBeFirstResponder
{
  return objc_opt_respondsToSelector() & 1;
}

- (id)_accessibilityAllContextDescriptors
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = a1;
  if (v3)
  {
    v4 = v3;
    do
    {
      objc_msgSend(v4, "_accessibilityContextDescriptors");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "addObjectsFromArray:", v5);

      objc_msgSend(v4, "accessibilityContainer");
      v6 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v6;
    }
    while (v6);
  }
  return v2;
}

- (uint64_t)_accessibilityShouldIncludeMediaDescriptionsRotor
{
  return 0;
}

- (uint64_t)_accessibilitySkipImageTraitDescription
{
  return 0;
}

- (id)_accessibilityBrailleMapsFromGraphData
{
  char isKindOfClass;
  uint64_t v2;
  double v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  void *v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  char v31;
  _QWORD v32[3];
  int v33;
  _QWORD v34[3];
  int v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_accessibilityChartDescriptor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    objc_msgSend(MEMORY[0x1E0C8EDC0], "connectedBrailleMap");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      objc_msgSend(v18, "yAxis");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "xAxis");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) != 0)
      {
        v2 = 0;
        v3 = 1.0;
      }
      else
      {
        objc_opt_class();
        v3 = 0.0;
        v2 = 0;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v16, "lowerBound");
          v2 = v4;
          objc_msgSend(v16, "upperBound");
          v3 = v5;
        }
      }
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      objc_msgSend(v18, "series", v16);
      obj = (id)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
      if (v6)
      {
        v7 = *(_QWORD *)v37;
        v8 = isKindOfClass & 1;
        do
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v37 != v7)
              objc_enumerationMutation(obj);
            v10 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
            v34[0] = 0;
            v34[1] = v34;
            v34[2] = 0x2020000000;
            v35 = -1;
            v32[0] = 0;
            v32[1] = v32;
            v32[2] = 0x2020000000;
            v33 = -1;
            objc_msgSend(v10, "dataPoints");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v11, "count");

            objc_msgSend(v10, "dataPoints");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v22[0] = MEMORY[0x1E0C809B0];
            v22[1] = 3221225472;
            v22[2] = __66__NSObject_AXPrivCategory___accessibilityBrailleMapsFromGraphData__block_invoke;
            v22[3] = &unk_1E3DFE9A8;
            v31 = v8;
            v28 = v12;
            v29 = v2;
            v30 = v3;
            v23 = v20;
            v24 = v21;
            v25 = v10;
            v26 = v34;
            v27 = v32;
            objc_msgSend(v13, "enumerateObjectsUsingBlock:", v22);

            _Block_object_dispose(v32, 8);
            _Block_object_dispose(v34, 8);
          }
          v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
        }
        while (v6);
      }

      v14 = v21;
    }

  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)_accessibilityBrailleMap
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C8EDC0], "connectedBrailleMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = a1;
    v4 = v3;
    if (v3)
    {
      v5 = v3;
      while (1)
      {
        objc_msgSend(v5, "accessibilityBrailleMapRenderer");
        v6 = objc_claimAutoreleasedReturnValue();
        if (v6)
          break;
        objc_msgSend(v5, "accessibilityContainer");
        v7 = objc_claimAutoreleasedReturnValue();

        v5 = (void *)v7;
        if (!v7)
          goto LABEL_6;
      }
      v9 = (void *)v6;
      (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v2);
      v8 = v2;

    }
    else
    {
LABEL_6:
      objc_msgSend(v4, "_accessibilityBrailleMapsFromGraphData");
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)setAccessibilityCustomContent:()AXPrivCategory
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  objc_msgSend(a1, "_accessibilitySetRetainedValue:forKey:", v4, CFSTR("accessibilityCustomContent"));

}

- (id)accessibilityCustomContent
{
  uint64_t v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "_accessibilityGetBlockForAttribute:", 28);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
    (*(void (**)(uint64_t))(v2 + 16))(v2);
  else
    objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("accessibilityCustomContent"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_accessibilityCustomContent
{
  id v1;
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v9;

  v1 = a1;
  v2 = 0;
  if (v1)
  {
    do
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v1, "accessibilityCustomContentBlock");
        v3 = objc_claimAutoreleasedReturnValue();
        if (v3)
        {
          v9 = (void *)v3;
          (*(void (**)(void))(v3 + 16))();
          v7 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_15;
        }
      }
      objc_msgSend(v1, "accessibilityCustomContent");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        if (v2)
          goto LABEL_10;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_10;
        objc_msgSend(MEMORY[0x1E0CEABB8], "viewControllerForView:", v1);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "accessibilityCustomContent");
        v4 = (void *)objc_claimAutoreleasedReturnValue();

        if (v2)
          goto LABEL_10;
      }
      if (v4)
        v2 = (id)objc_opt_new();
LABEL_10:
      objc_msgSend(v2, "axSafelyAddObjectsFromArray:", v4);
      if ((objc_msgSend(v1, "_accessibilityShouldIncludeParentCustomContent") & 1) == 0)
      {

        break;
      }
      objc_msgSend(v1, "accessibilityContainer");
      v6 = objc_claimAutoreleasedReturnValue();

      v1 = (id)v6;
    }
    while (v6);
  }
  v2 = v2;
  v7 = v2;
LABEL_15:

  return v7;
}

- (uint64_t)_accessibilityIsSwitch
{
  return 0;
}

- (uint64_t)_accessibilityRetainsFocusOnScreenChange
{
  return 0;
}

- (uint64_t)_accessibilityIsNonDismissableStatusBarElement
{
  return 0;
}

- (id)_accessibilityContextDescriptors
{
  return objc_getAssociatedObject(a1, &__NSObject___accessibilityContextDescriptors);
}

- (uint64_t)_accessibilitySetContextDescriptors:()AXPrivCategory
{
  return __UIAccessibilitySetAssociatedObject();
}

- (id)accessibilityElementForRow:()AXPrivCategory andColumn:
{
  id v4;
  _QWORD v6[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__2;
  v11 = __Block_byref_object_dispose__2;
  v12 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__NSObject_AXPrivCategory__accessibilityElementForRow_andColumn___block_invoke;
  v6[3] = &unk_1E3DFE9D0;
  v6[4] = &v7;
  v6[5] = a3;
  v6[6] = a4;
  objc_msgSend(a1, "accessibilityEnumerateAncestorsUsingBlock:", v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (id)accessibilityDataTableCellElementForRow:()AXPrivCategory column:
{
  uint64_t v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "_accessibilityGetBlockForAttribute:", 52);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v6, a3, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (uint64_t)_accessibilityKeyboardIsContinuousPathTracking
{
  return 0;
}

- (uint64_t)_accessibilityKeyboardIsContinuousPathAvailable
{
  return 0;
}

- (uint64_t)_accessibilityIndexPath
{
  return 0;
}

- (uint64_t)_accessibilityIndexPathAsRange
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a1, "_accessibilityParentCollectionView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    objc_msgSend(a1, "_accessibilityParentTableView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
      return 0x7FFFFFFFLL;
  }
  objc_msgSend(a1, "_accessibilityAncestorIsKindOf:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_accessibilityIndexPathAsRange");

  return v5;
}

- (uint64_t)_accessibilityParentTableView
{
  return objc_msgSend(a1, "_accessibilityAncestorIsKindOf:", objc_opt_class());
}

- (uint64_t)_accessibilityParentCollectionView
{
  return objc_msgSend(a1, "_accessibilityAncestorIsKindOf:", objc_opt_class());
}

- (uint64_t)accessibilityRowRange
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_accessibilityGetBlockForAttribute:", 49);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    (*(void (**)(uint64_t))(v2 + 16))(v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      v5 = v4;
      v6 = objc_msgSend(v4, "rangeValue");

      goto LABEL_27;
    }
  }
  if (objc_msgSend(a1, "_accessibilityIsInTabBar"))
  {
    objc_msgSend(a1, "_accessibilityTabBarAncestor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      AXLogAppAccessibility();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v20 = 138412290;
        v21 = a1;
        _os_log_impl(&dword_19D0DD000, v16, OS_LOG_TYPE_INFO, "Found a tab bar item with no ancestor. Marking it as not a tab bar item, but this may indicate that views are being moved from tab bars to other superviews: %@", (uint8_t *)&v20, 0xCu);
      }

      objc_msgSend(a1, "_axSetCachedHasTabBarAncestor:", MEMORY[0x1E0C9AAA0]);
      v15 = 0;
      v6 = 0x7FFFFFFFLL;
      goto LABEL_20;
    }
    +[UIAccessibilityElementTraversalOptions options](UIAccessibilityElementTraversalOptions, "options");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_accessibilityLeafDescendantsWithOptions:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "count"))
    {
      v10 = objc_msgSend(v9, "indexOfObject:", a1);
      if (v10 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v6 = v10;
        v15 = objc_msgSend(v9, "count");
        goto LABEL_19;
      }
      AXLogAppAccessibility();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v20 = 138412546;
        v21 = a1;
        v22 = 2112;
        v23 = v9;
        v12 = "Tried to get row range from a tab bar item, but it was not one of the tab bar's accessibility element descendants: %@, %@";
        v13 = v11;
        v14 = 22;
LABEL_16:
        _os_log_impl(&dword_19D0DD000, v13, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v20, v14);
      }
    }
    else
    {
      AXLogAppAccessibility();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v20 = 138412290;
        v21 = v7;
        v12 = "Tried to get row range from a tab bar item, but there were no descendants for the tab bar: %@";
        v13 = v11;
        v14 = 12;
        goto LABEL_16;
      }
    }

    v15 = 0;
    v6 = 0x7FFFFFFFLL;
LABEL_19:

LABEL_20:
    goto LABEL_21;
  }
  v15 = 0;
  v6 = 0x7FFFFFFFLL;
LABEL_21:
  if (v6 == 0x7FFFFFFF && !v15)
  {
    objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("_accessibilityRowRangeKey"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v17;
    if (v17)
      v6 = objc_msgSend(v17, "rangeValue");
    else
      v6 = 0x7FFFFFFFLL;

  }
LABEL_27:

  return v6;
}

- (void)_accessibilitySetRowRange:()AXPrivCategory
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilitySetValue:forKey:storageMode:", v2, CFSTR("_accessibilityRowRangeKey"), 0);

}

- (uint64_t)_accessibilityColumnCount
{
  uint64_t v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0x7FFFFFFFLL;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53__NSObject_AXPrivCategory___accessibilityColumnCount__block_invoke;
  v3[3] = &unk_1E3DFE4A0;
  v3[4] = &v4;
  objc_msgSend(a1, "accessibilityEnumerateAncestorsUsingBlock:", v3);
  v1 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v1;
}

- (uint64_t)_accessibilityColumnRange
{
  uint64_t v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  const char *v7;
  __int128 v8;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3010000000;
  v7 = "";
  v8 = xmmword_19D142620;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53__NSObject_AXPrivCategory___accessibilityColumnRange__block_invoke;
  v3[3] = &unk_1E3DFE4A0;
  v3[4] = &v4;
  objc_msgSend(a1, "accessibilityEnumerateAncestorsUsingBlock:", v3);
  v1 = v5[4];
  _Block_object_dispose(&v4, 8);
  return v1;
}

- (uint64_t)_accessibilityRowRangeFromTableOrCollectionView:()AXPrivCategory
{
  objc_class *v5;
  uint64_t v6;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  const char *v12;
  __int128 v13;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3010000000;
  v12 = "";
  v13 = xmmword_19D142620;
  if (!_accessibilityRowRangeFromTableOrCollectionView__BaseNSObjectMethod)
  {
    v5 = (objc_class *)objc_opt_class();
    _accessibilityRowRangeFromTableOrCollectionView__BaseNSObjectMethod = (uint64_t)class_getInstanceMethod(v5, sel_accessibilityRowRange);
  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76__NSObject_AXPrivCategory___accessibilityRowRangeFromTableOrCollectionView___block_invoke;
  v8[3] = &unk_1E3DFE9D0;
  v8[4] = &v9;
  v8[5] = sel_accessibilityRowRange;
  v8[6] = a3;
  objc_msgSend(a1, "accessibilityEnumerateAncestorsUsingBlock:", v8);
  v6 = v10[4];
  _Block_object_dispose(&v9, 8);
  return v6;
}

- (uint64_t)_accessibilityRowRange
{
  return objc_msgSend(a1, "_accessibilityRowRangeFromTableOrCollectionView:", 0);
}

- (id)_accessibilityUserDefinedShouldIncludeRowRangeInElementDescription
{
  return objc_getAssociatedObject(a1, &__NSObject___accessibilityUserDefinedShouldIncludeRowRangeInElementDescription);
}

- (uint64_t)_accessibilitySetUserDefinedShouldIncludeRowRangeInElementDescription:()AXPrivCategory
{
  return __UIAccessibilitySetAssociatedObject();
}

- (void)_accessibilitySetShouldIncludeRowRangeInElementDescription:()AXPrivCategory
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilitySetUserDefinedShouldIncludeRowRangeInElementDescription:", v2);

}

- (uint64_t)_accessibilityShouldIncludeRowRangeInElementDescription
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  char v8;

  objc_msgSend(a1, "_accessibilityUserDefinedShouldIncludeRowRangeInElementDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "BOOLValue");
  }
  else
  {
    objc_msgSend(a1, "_iosAccessibilityAttributeValue:", 2004);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "unsignedIntegerValue");

    if (((UIAccessibilityTraitRadioButton | *MEMORY[0x1E0CEB180] | *MEMORY[0x1E0CEB130] | UIAccessibilityTraitTabButton) & v6) != 0)
    {
      v4 = 1;
    }
    else if (((*MEMORY[0x1E0CEB100] | *MEMORY[0x1E0CEB110]) & v6) != 0)
    {
      v8 = 0;
      objc_msgSend(a1, "_accessibilityRowRangeFromTableOrCollectionView:", &v8);
      v4 = v8 == 0;
    }
    else
    {
      v4 = 0;
    }
  }

  return v4;
}

- (uint64_t)_accessibilityImplementsDefaultRowRange
{
  return 0;
}

- (uint64_t)_accessibilityRowCount
{
  uint64_t v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 0x7FFFFFFFLL;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__NSObject_AXPrivCategory___accessibilityRowCount__block_invoke;
  v3[3] = &unk_1E3DFE4A0;
  v3[4] = &v4;
  objc_msgSend(a1, "accessibilityEnumerateAncestorsUsingBlock:", v3);
  v1 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v1;
}

- (uint64_t)accessibilityColumnRange
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a1, "_accessibilityGetBlockForAttribute:", 48);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)v1;
  if (v1
    && ((*(void (**)(uint64_t))(v1 + 16))(v1), (v3 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v4 = v3;
    v5 = objc_msgSend(v3, "rangeValue");

  }
  else
  {
    v5 = 0x7FFFFFFFLL;
  }

  return v5;
}

- (uint64_t)_accessibilityIsFirstElementForFocus
{
  return 0;
}

- (uint64_t)_accessibilitySupplementaryHeaderViews
{
  return objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("SupplementaryHeaderViews"));
}

- (uint64_t)_accessibilitySupplementaryFooterViews
{
  return objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("SupplementaryFooterViews"));
}

- (uint64_t)_accessibilitySetSupplementaryFooterViews:()AXPrivCategory
{
  return objc_msgSend(a1, "_accessibilitySetRetainedValue:forKey:", a3, CFSTR("SupplementaryFooterViews"));
}

- (uint64_t)_accessibilitySetSupplementaryHeaderViews:()AXPrivCategory
{
  return objc_msgSend(a1, "_accessibilitySetRetainedValue:forKey:", a3, CFSTR("SupplementaryHeaderViews"));
}

- (id)_accessibilityUserDefinedAdditionalElements
{
  return objc_getAssociatedObject(a1, &__NSObject___accessibilityUserDefinedAdditionalElements);
}

- (uint64_t)_accessibilitySetUserDefinedAdditionalElements:()AXPrivCategory
{
  return __UIAccessibilitySetAssociatedObject();
}

- (id)_accessibilityTableViewCellContentSubviews
{
  void *v0;
  void *v1;
  void *v2;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "contentView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "subviews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)_accessibilityCollectionViewCellContentSubviews
{
  void *v0;
  void *v1;
  void *v2;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "contentView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "subviews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)_accessibilityServesAsFirstResponder
{
  return 0;
}

- (uint64_t)_accessibilityResponderElement
{
  return 0;
}

- (uint64_t)_accessibilityIsTableCell
{
  return 0;
}

- (BOOL)_accessibilityIsInTableCell
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "_accessibilityAncestorIsKindOf:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (BOOL)_accessibilityIsInCollectionCell
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "_accessibilityAncestorIsKindOf:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (uint64_t)_accessibilityLoadURL:()AXPrivCategory
{
  return 0;
}

- (uint64_t)_accessibilityTableIndexTitles
{
  return 0;
}

- (uint64_t)_accessibilityIsAwayAlertElement
{
  return 0;
}

- (uint64_t)_accessibilityIsAwayAlertElementNew
{
  return 0;
}

- (uint64_t)_accessibilityIsBannerNotificationElement
{
  return 0;
}

- (uint64_t)_accessibilityNotificationCount
{
  return 0;
}

- (uint64_t)_accessibilityNotificationSummary:()AXPrivCategory
{
  return 0;
}

- (uint64_t)_accessibilityCanDismissPopoverController:()AXPrivCategory
{
  return 1;
}

- (uint64_t)_accessibilityContainedByTableLogicIsEnabledOutsideOfWebContext
{
  return 1;
}

- (uint64_t)_accessibilityCanDeleteTableViewCell
{
  return 0;
}

- (uint64_t)_accessibilityDidDeleteTableViewCell
{
  return 0;
}

- (uint64_t)_accessibilityVariantKeys
{
  return 0;
}

- (uint64_t)_accessibilityHasVariantKeys
{
  return 0;
}

- (uint64_t)_accessibilityKeyboardKeyHasSignificantAlternateActions
{
  return 0;
}

- (uint64_t)_accessibilityRespectsTableScrollEnabledFlag
{
  return 0;
}

- (uint64_t)_accessibilityCellWithRowIndex:()AXPrivCategory column:containingView:
{
  return 0;
}

- (uint64_t)_accessibilityKeyboardKeyForString:()AXPrivCategory
{
  return 0;
}

- (void)_accessibilitySetObscuredScreenAllowedViews:()AXPrivCategory
{
  id v4;

  v4 = _Block_copy(aBlock);
  objc_msgSend(a1, "_accessibilitySetRetainedValue:forKey:", v4, CFSTR("_accessibilitySetObscuredScreenAllowedViews"));

}

- (id)_accessibilityObscuredScreenAllowedViews
{
  uint64_t v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("_accessibilitySetObscuredScreenAllowedViews"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)v1;
  if (v1)
  {
    (*(void (**)(uint64_t))(v1 + 16))(v1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (uint64_t)_accessibilityHitTestingObscuredScreenAllowedViews
{
  return 0;
}

- (uint64_t)_accessibilityIsKeyboardPassthroughInputAccessoryView
{
  return 0;
}

- (uint64_t)_accessibilityAlternateActionForURL:()AXPrivCategory
{
  return 0;
}

- (uint64_t)_accessibilityTableCellUsesDetailTextAsValue
{
  return objc_msgSend(a1, "_accessibilityBoolValueForKey:", CFSTR("DetailTextAsValue"));
}

- (uint64_t)_setAccessibilityTableCellUsesDetailTextAsValue:()AXPrivCategory
{
  return objc_msgSend(a1, "_accessibilitySetBoolValue:forKey:", a3, CFSTR("DetailTextAsValue"));
}

- (id)_accessibilityApplication
{
  void *v1;
  id v2;
  void *v3;
  id AppElementWithPid;
  void *v5;

  objc_msgSend(a1, "_accessibilityParentView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = v1;
  }
  else
  {
    objc_msgSend(v1, "window");
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  v3 = v2;
  if (objc_msgSend(v2, "safeBoolForKey:", CFSTR("_isHostedInAnotherProcess"))
    && (int)objc_msgSend(v3, "_accessibilityRemotePid") >= 1)
  {
    AppElementWithPid = (id)_AXUIElementCreateAppElementWithPid();
  }
  else
  {
    AppElementWithPid = (id)*MEMORY[0x1E0CEB258];
  }
  v5 = AppElementWithPid;

  return v5;
}

- (id)_accessibilityRemoteApplication
{
  return (id)*MEMORY[0x1E0CEB258];
}

- (uint64_t)_accessibilityUsesSpecialKeyboardDismiss
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;

  objc_msgSend(a1, "accessibilityContainer");
  v1 = objc_claimAutoreleasedReturnValue();
  if (!v1)
    return 0;
  v2 = (void *)v1;
  do
  {
    v3 = objc_msgSend(v2, "_accessibilityUsesSpecialKeyboardDismiss");
    if ((v3 & 1) != 0)
      break;
    objc_msgSend(v2, "accessibilityContainer");
    v4 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v4;
  }
  while (v4);

  return v3;
}

- (id)_accessibilityWindowScene
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_accessibilityWindow");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "windowScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)accessibilityIsWindow
{
  return 0;
}

- (id)_accessibilityWindowSceneIdentifier
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "_accessibilityWindow");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "windowScene");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_accessibilityWindowSceneIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_accessibilityFBSceneIdentifier
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_accessibilityWindowScene");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_accessibilityFBSceneIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)_accessibilityContextId
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CEAC18], "_applicationKeyWindow");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "_accessibilityContextId");
  }
  else
  {
    objc_msgSend(a1, "_accessibilityParentView");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v4 = v2;
    }
    else
    {
      objc_msgSend(v2, "window");
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    v5 = v4;
    v3 = objc_msgSend(v4, "_accessibilityContextId");

  }
  return v3;
}

- (id)_accessibilityApplicationWindowContextIDs
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend((id)*MEMORY[0x1E0CEB258], "_accessibilityWindowsIgnoringWindowsWithHiddenElements:", 0, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v9;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v5), "safeValueForKey:", CFSTR("_accessibilityContextId"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v0, "axSafelyAddObject:", v6);

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v3);
  }

  return v0;
}

- (uint64_t)_accessibilityDisplayId
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "_accessibilityWindow");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "screen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_integerDisplayID");

  return v3;
}

- (uint64_t)_accessibilityStatusBar
{
  NSObject *v0;

  AXLogCommon();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
    -[NSObject(AXPrivCategory) _accessibilityStatusBar].cold.1();

  return 0;
}

- (id)_accessibilityRetrieveImagePathLabel:()AXPrivCategory
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(v3, "lastPathComponent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByDeletingPathExtension");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "rangeOfString:", CFSTR("@@"));
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v5, "substringToIndex:", v6);
      v7 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v7;
    }
    if (objc_msgSend(v5, "length"))
    {
      v8 = v5;
      if ((unint64_t)objc_msgSend(v8, "length") >= 0x1F)
      {
        objc_msgSend(v8, "substringToIndex:", 30);
        v9 = objc_claimAutoreleasedReturnValue();

        v8 = (id)v9;
      }
    }
    else
    {
      v8 = v3;
    }
    objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR(" "));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR(" "));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CF40C0], "axAttributedStringWithString:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAttribute:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CF41E8]);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_accessibilityInputIdentifierForKeyboard
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CEA6F8], "sharedInputModeController");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "currentInputMode");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "identifierWithLayouts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (uint64_t)_accessibilityAllowsAlternativeCharacterActivation
{
  return 0;
}

- (uint64_t)_accessibilityIsInternationalKeyboardKey
{
  return 0;
}

- (uint64_t)_accessibilityIsAccessibilityUIServer
{
  return 0;
}

- (uint64_t)_accessibilityIsIsolatedWindow
{
  return 0;
}

- (uint64_t)_accessibilityElementCommunityIdentifier
{
  return 0;
}

- (uint64_t)_accessibilityIsOrnamentWindow
{
  return 0;
}

- (uint64_t)_accessibilityIsUsingRemoteParentActivateAction
{
  return 0;
}

- (uint64_t)_accessibilityInterfaceOrientationForScreenCoordinates
{
  return 0;
}

- (uint64_t)_accessibilityIsFKARunningForFocusItem
{
  return 0;
}

- (uint64_t)_accessibilityFKAShouldProcessChildren
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("AXFKAShouldProcessChildren"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "BOOLValue");
  else
    v3 = 1;

  return v3;
}

- (void)_accessibilitySetFKAShouldProcessChildren:()AXPrivCategory
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilitySetRetainedValue:forKey:", v2, CFSTR("AXFKAShouldProcessChildren"));

}

- (id)_accessibilityDefaultFocusGroupIdentifier
{
  void *v2;
  objc_class *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@:%p"), v4, a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_axGetStoredFocusGroupIdentifier
{
  return objc_getAssociatedObject(a1, &__NSObjectAccessibility___axGetStoredFocusGroupIdentifier);
}

- (uint64_t)_setAxStoredFocusGroupIdentifier:()AXPrivCategory
{
  return __UIAccessibilitySetAssociatedCopiedObject();
}

- (uint64_t)_accessibilityIsVerticalAdjustableElement
{
  return 0;
}

- (id)_accessibilityKeyCommands
{
  id v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v26[4];
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = objc_msgSend(a1, "accessibilityTraits");
  v4 = (_QWORD *)MEMORY[0x1E0CEB7D0];
  v5 = (_QWORD *)MEMORY[0x1E0CEB728];
  v6 = (_QWORD *)MEMORY[0x1E0CEB7B0];
  v7 = (_QWORD *)MEMORY[0x1E0CEB7C8];
  if ((*MEMORY[0x1E0CEB100] & v3) != 0)
  {
    v8 = objc_msgSend(a1, "_accessibilityIsVerticalAdjustableElement");
    v9 = objc_msgSend(a1, "_accessibilityIsRTL");
    v10 = (void *)*v6;
    if (v9)
      v11 = (void *)*v6;
    else
      v11 = (void *)*v7;
    if (v9)
      v10 = (void *)*v7;
    if (v8)
      v12 = (void *)*v4;
    else
      v12 = v11;
    v13 = (void *)*v5;
    if (!v8)
      v13 = v10;
    v14 = (void *)MEMORY[0x1E0CEA6B8];
    v15 = v13;
    v16 = v12;
    objc_msgSend(v14, "keyCommandWithInput:modifierFlags:action:", v16, 0, sel_accessibilityIncrement);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v17;
    objc_msgSend(MEMORY[0x1E0CEA6B8], "keyCommandWithInput:modifierFlags:action:", v15, 0, sel_accessibilityDecrement);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObjectsFromArray:", v19);

    v5 = (_QWORD *)MEMORY[0x1E0CEB728];
    v7 = (_QWORD *)MEMORY[0x1E0CEB7C8];

    v6 = (_QWORD *)MEMORY[0x1E0CEB7B0];
  }
  if (objc_msgSend(a1, "_accessibilityShouldIncludeArrowKeyCommandsForDirectionalFocusMovement"))
  {
    objc_msgSend(MEMORY[0x1E0CEA6B8], "keyCommandWithInput:modifierFlags:action:", *v4, 0, sel__fkaMoveUp);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = v20;
    objc_msgSend(MEMORY[0x1E0CEA6B8], "keyCommandWithInput:modifierFlags:action:", *v5, 0, sel__fkaMoveDown);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v21;
    objc_msgSend(MEMORY[0x1E0CEA6B8], "keyCommandWithInput:modifierFlags:action:", *v6, 0, sel__fkaMoveLeft);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26[2] = v22;
    objc_msgSend(MEMORY[0x1E0CEA6B8], "keyCommandWithInput:modifierFlags:action:", *v7, 0, sel__fkaMoveRight);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v26[3] = v23;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObjectsFromArray:", v24);

  }
  return v2;
}

- (uint64_t)_accessibilityKeyCommandsShouldOverrideKeyCommands
{
  return 0;
}

- (uint64_t)_accessibilityShouldIncludeArrowKeyCommandsForDirectionalFocusMovement
{
  return 0;
}

- (BOOL)_accessibilityHandlesTabKey
{
  uint64_t v1;

  v1 = objc_msgSend(a1, "accessibilityTraits");
  return ((*MEMORY[0x1E0CF44C0] | *MEMORY[0x1E0CF4590]) & ~v1) == 0;
}

- (uint64_t)_accessibilityFKAArrowKeysHandled
{
  return 0;
}

- (void)_fkaMoveUp
{
  AXPerformSafeBlock();
  UIAccessibilityPostNotification(UIAccessibilityFKAArrowNavigationNotification, 0);
}

- (void)_fkaMoveDown
{
  AXPerformSafeBlock();
  UIAccessibilityPostNotification(UIAccessibilityFKAArrowNavigationNotification, 0);
}

- (void)_fkaMoveLeft
{
  AXPerformSafeBlock();
  UIAccessibilityPostNotification(UIAccessibilityFKAArrowNavigationNotification, 0);
}

- (void)_fkaMoveRight
{
  AXPerformSafeBlock();
  UIAccessibilityPostNotification(UIAccessibilityFKAArrowNavigationNotification, 0);
}

- (id)_accessibilityElementToFocusForAppearanceScreenChange
{
  void *v2;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  if (objc_msgSend(a1, "isAccessibilityElement")
    && (objc_msgSend(a1, "isAccessibilityOpaqueElementProvider") & 1) == 0)
  {
    return a1;
  }
  if (objc_msgSend(a1, "_accessibilityHasOrderedChildren"))
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x3032000000;
    v11 = __Block_byref_object_copy__2;
    v12 = __Block_byref_object_dispose__2;
    v13 = 0;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __81__NSObject_AXPrivCategory___accessibilityElementToFocusForAppearanceScreenChange__block_invoke;
    v7[3] = &unk_1E3DFEA20;
    v7[4] = &v8;
    objc_msgSend(a1, "accessibilityEnumerateContainerElementsUsingBlock:", v7);
    objc_msgSend((id)v9[5], "_accessibilityElementToFocusForAppearanceScreenChange");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    _Block_object_dispose(&v8, 8);

    return v2;
  }
  else
  {
    objc_msgSend(a1, "_accessibilitySortedElementsWithin");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "_accessibilityElementToFocusForAppearanceScreenChange");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
}

- (uint64_t)_accessibilityFocusRingAncestor
{
  return objc_msgSend(a1, "_accessibilityFindAncestor:startWithSelf:findTopmostAncestor:", &__block_literal_global_882, 0, 1);
}

- (uint64_t)_accessibilityIsSupportedGestureRecognizer
{
  return 1;
}

- (uint64_t)_accessibilityShouldAttemptToAddDismissalElement
{
  return 1;
}

- (uint64_t)_accessibilityIsFocusForHoverTextRunningForFocusItem
{
  return 0;
}

- (uint64_t)_accessibilityDisplayFocusIndicatorForHoverTextView
{
  return 0;
}

- (uint64_t)_accessibilityHoverTypingShouldAdjustDockedMode
{
  return 0;
}

- (id)_accessibilityStoredChartDescriptor
{
  return objc_getAssociatedObject(a1, &UIAccessibilityStorageKeyChartDescriptor);
}

- (void)_accessibilitySetStoredChartDescriptor:()AXPrivCategory
{
  objc_setAssociatedObject(a1, &UIAccessibilityStorageKeyChartDescriptor, a3, (void *)1);
}

- (uint64_t)_accessibilityChartElement
{
  return objc_msgSend(a1, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_883, 1);
}

- (uint64_t)_accessibilityIsChartElement
{
  void *v2;
  uint64_t v3;
  uint64_t v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "_accessibilityStoredChartDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 || (objc_msgSend(a1, "_accessibilitySupportsChartsV2") & 1) != 0)
    return 1;
  objc_msgSend(a1, "_accessibilityGetBlockForAttribute:", 30);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5
    && ((*(void (**)(uint64_t))(v5 + 16))(v5),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
    v3 = 1;
  }
  else
  {
    v3 = objc_msgSend(a1, "conformsToProtocol:", &unk_1EE4C0848);
  }

  return v3;
}

- (uint64_t)accessibilityChartDescriptor
{
  return 0;
}

- (id)_accessibilityChartDescriptor
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "_accessibilityGetBlockForAttribute:", 30);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    (*(void (**)(uint64_t))(v2 + 16))(v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "_accessibilityChartElement");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_accessibilityStoredChartDescriptor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      objc_msgSend(v5, "accessibilityChartDescriptor");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v4;
}

- (id)_accessibilityChartStructureDescription
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  void *v25;

  objc_msgSend(a1, "_accessibilityChartElement");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_accessibilityStoredChartDescriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(v1, "accessibilityChartDescriptor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  UIKitAccessibilityLocalizedString(CFSTR("audiograph.axis.description.x"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UIKitAccessibilityLocalizedString(CFSTR("audiograph.axis.description.y"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  UIKitAccessibilityLocalizedString(CFSTR("audiograph.series.count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "series");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  objc_msgSend(v2, "xAxis");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "title");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (v10)
  {
    objc_msgSend(v2, "xAxis");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "title");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    AXCFormattedString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v12, v23);
  }
  objc_msgSend(v2, "yAxis");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    objc_msgSend(v2, "yAxis");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "title");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "length");

    if (v17)
    {
      objc_msgSend(v2, "yAxis");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "title");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      AXCFormattedString();
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "addObject:", v19, v24);
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v5, v7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v20);
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

- (uint64_t)_accessibilityShouldUseHostContextIDForPress
{
  return 0;
}

- (uint64_t)_accessibilityShouldUseHostContextIDForTap
{
  uint64_t v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "_accessibilityGetBlockForAttribute:", 53);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)v1;
  if (v1)
    v3 = (*(uint64_t (**)(uint64_t))(v1 + 16))(v1);
  else
    v3 = 0;

  return v3;
}

- (uint64_t)_accessibilityShouldUseHostContextIDForLongPress
{
  uint64_t v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "_accessibilityGetBlockForAttribute:", 54);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)v1;
  if (v1)
    v3 = (*(uint64_t (**)(uint64_t))(v1 + 16))(v1);
  else
    v3 = 0;

  return v3;
}

- (uint64_t)_accessibilityNativeFocusElement
{
  return 0;
}

- (uint64_t)_accessibilitySecureName
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "_accessibilityParentView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "safeUnsignedIntForKey:", CFSTR("_secureName"));

  return v2;
}

- (uint64_t)accessibilityIsInsertion
{
  return 0;
}

- (uint64_t)accessibilityIsDeletion
{
  return 0;
}

- (uint64_t)accessibilityIsFirstItemInSuggestion
{
  return 0;
}

- (uint64_t)accessibilityIsLastItemInSuggestion
{
  return 0;
}

- (uint64_t)accessibilityIsMarkAnnotation
{
  return 0;
}

- (uint64_t)accessibilityIsInNonNativeTextControl
{
  return 0;
}

- (uint64_t)_accessibilityDataSeriesName
{
  return 0;
}

- (uint64_t)_accessibilityDataSeriesValuesForAxis:()AXPrivCategory
{
  return 0;
}

- (uint64_t)_accessibilityDataSeriesType
{
  return 0;
}

- (double)_accessibilityDataSeriesSonificationDuration
{
  return 6.0;
}

- (uint64_t)_accessibilityDataSeriesTitleForAxis:()AXPrivCategory
{
  return 0;
}

- (uint64_t)_accessibilityDataSeriesUnitLabelForAxis:()AXPrivCategory
{
  return 0;
}

- (uint64_t)_accessibilityDataSeriesMinimumValueForAxis:()AXPrivCategory
{
  return 0;
}

- (uint64_t)_accessibilityDataSeriesMaximumValueForAxis:()AXPrivCategory
{
  return 0;
}

- (uint64_t)_accessibilityDataSeriesGridlinePositionsForAxis:()AXPrivCategory
{
  return 0;
}

- (uint64_t)_accessibilityDataSeriesCategoryLabelsForAxis:()AXPrivCategory
{
  return 0;
}

- (uint64_t)_accessibilityDataSeriesValueDescriptionForPosition:()AXPrivCategory axis:
{
  return 0;
}

- (uint64_t)_accessibilityDataSeriesSupportsSummarization
{
  return 0;
}

- (uint64_t)_accessibilityDataSeriesSupportsSonification
{
  return 0;
}

- (uint64_t)_accessibilityDataSeriesIncludesTrendlineInSonification
{
  return 0;
}

- (BOOL)_accessibilitySupportsAudiographs
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "_accessibilityChartElement");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (uint64_t)_accessibilitySortCollectionViewLogically
{
  return 1;
}

- (uint64_t)_accessibilityShouldAvoidScrollingCollectionViewCells
{
  return 0;
}

- (uint64_t)_accessibilityCollectionViewCellScrollShouldInformScrollDelegate
{
  return 1;
}

- (uint64_t)_accessibilityDescendantElementAtIndexPathIsValid:()AXPrivCategory
{
  return 1;
}

- (uint64_t)_accessibilityHeaderElement
{
  return 0;
}

- (uint64_t)accessibilityTitleElement
{
  return 0;
}

- (uint64_t)_accessibilityElementsForSearchParameter:()AXPrivCategory
{
  return 0;
}

- (uint64_t)_accessibilityRetainsCustomRotorActionSetting
{
  return 0;
}

- (id)_accessibilityUserDefinedScrollAcrossPageBoundaries
{
  return objc_getAssociatedObject(a1, &__NSObjectAccessibility___accessibilityUserDefinedScrollAcrossPageBoundaries);
}

- (uint64_t)_accessibilitySetUserDefinedScrollAcrossPageBoundaries:()AXPrivCategory
{
  return __UIAccessibilitySetAssociatedObject();
}

- (uint64_t)_accessibilityScrollAcrossPageBoundaries
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "_accessibilityUserDefinedScrollAcrossPageBoundaries");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (void)_accessibilitySetScrollAcrossPageBoundaries:()AXPrivCategory
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilitySetUserDefinedScrollingEnabled:", v2);

}

- (uint64_t)_accessibilityAllowedPagingOverlap
{
  return objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("_accessibilityAllowedPagingOverlap"));
}

- (void)_accessibilitySetAllowedPagingOverlap:()AXPrivCategory
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilitySetRetainedValue:forKey:", v2, CFSTR("_accessibilityAllowedPagingOverlap"));

}

- (uint64_t)_accessibilityPagingEnabled
{
  return objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("_accessibilityPagingEnabled"));
}

- (uint64_t)_accessibilitySetPagingEnabled:()AXPrivCategory
{
  return objc_msgSend(a1, "_accessibilitySetBoolValue:forKey:", a3, CFSTR("_accessibilityPagingEnabled"));
}

- (BOOL)_accessibilityDidSetOpaqueElementProvider
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("IsOpaqueProvider"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (uint64_t)setIsAccessibilityOpaqueElementProvider:()AXPrivCategory
{
  return objc_msgSend(a1, "_accessibilitySetBoolValue:forKey:", a3, CFSTR("IsOpaqueProvider"));
}

- (id)_accessibilityContainerToStopVisibilityCheck
{
  return objc_getAssociatedObject(a1, &__NSObjectAccessibility___accessibilityContainerToStopVisibilityCheck);
}

- (uint64_t)_accessibilitySetContainerToStopVisibilityCheck:()AXPrivCategory
{
  return __UIAccessibilitySetAssociatedObject();
}

- (uint64_t)_accessibilityShouldIgnoreOpaqueElementProviders
{
  return __UIAccessibilityGetAssociatedBool();
}

- (uint64_t)_accessibilitySetShouldIgnoreOpaqueElementProviders:()AXPrivCategory
{
  return __UIAccessibilitySetAssociatedBool();
}

- (uint64_t)_accessibilityStartingPointForIsVisible
{
  return __UIAccessibilityGetAssociatedCGPoint();
}

- (uint64_t)_accessibilitySetStartingPointForIsVisible:()AXPrivCategory
{
  return __UIAccessibilitySetAssociatedCGPoint();
}

- (uint64_t)_accessibilityWantsOpaqueElementProviders
{
  if ((objc_msgSend(a1, "_accessibilityShouldIgnoreOpaqueElementProviders") & 1) != 0)
    return 0;
  if (UIAccessibilityIsSwitchControlRunning()
    || _AXSAutomationEnabled() && !UIAccessibilityIsVoiceOverRunning())
  {
    return objc_msgSend(a1, "_accessibilityBoolValueForKey:", CFSTR("WantsOpaqueProviders"));
  }
  return 1;
}

- (uint64_t)_accessibilitySetWantsOpaqueElementProviders:()AXPrivCategory
{
  return objc_msgSend(a1, "_accessibilitySetBoolValue:forKey:", a3, CFSTR("WantsOpaqueProviders"));
}

- (uint64_t)isAccessibilityOpaqueElementProvider
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("IsOpaqueProvider"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (id)_accessibilityOpaqueElementParent
{
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;

  objc_msgSend(a1, "accessibilityContainer");
  v1 = objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v2 = (void *)v1;
    v3 = 0;
    do
    {
      if (objc_msgSend(v2, "isAccessibilityOpaqueElementProvider"))
      {
        v4 = v2;

        v3 = v4;
      }
      objc_msgSend(v2, "accessibilityContainer");
      v5 = objc_claimAutoreleasedReturnValue();

      v2 = (void *)v5;
    }
    while (v5);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)_accessibilityFirstOpaqueElement
{
  void *v2;
  void *v3;
  void *v4;

  +[UIAccessibilityElementTraversalOptions defaultVoiceOverOptions](UIAccessibilityElementTraversalOptions, "defaultVoiceOverOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (__60__NSObject_AXPrivCategory___accessibilityFirstOpaqueElement__block_invoke())
  {
    objc_msgSend(a1, "_accessibilitySortedElementsWithinWithOptions:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "_accessibilityFirstOpaqueElementWithOptions:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (id)_accessibilityFirstOpaqueElementWithOptions:()AXPrivCategory
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (__72__NSObject_AXPrivCategory___accessibilityFirstOpaqueElementWithOptions___block_invoke())
  {
    objc_msgSend(a1, "_accessibilityFirstOpaqueElement");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "_accessibilitySortedElementsWithinWithOptions:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)_accessibilityFirstOpaqueElementForFocus
{
  void *v2;
  void *v3;

  +[UIAccessibilityElementTraversalOptions defaultVoiceOverOptions](UIAccessibilityElementTraversalOptions, "defaultVoiceOverOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (__68__NSObject_AXPrivCategory___accessibilityFirstOpaqueElementForFocus__block_invoke())
    objc_msgSend(a1, "_accessibilityFirstOpaqueElementWithOptions:", v2);
  else
    objc_msgSend(a1, "_accessibilityFirstOpaqueElementForFocusWithOptions:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_accessibilityFirstOpaqueElementForFocusWithOptions:()AXPrivCategory
{
  id v4;
  void *v5;

  v4 = a3;
  if (__80__NSObject_AXPrivCategory___accessibilityFirstOpaqueElementForFocusWithOptions___block_invoke())
    objc_msgSend(a1, "_accessibilityFirstOpaqueElementForFocus");
  else
    objc_msgSend(a1, "_accessibilityFirstOpaqueElementWithOptions:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_accessibilityLastOpaqueElement
{
  void *v2;
  void *v3;
  void *v4;

  +[UIAccessibilityElementTraversalOptions defaultVoiceOverOptions](UIAccessibilityElementTraversalOptions, "defaultVoiceOverOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (__59__NSObject_AXPrivCategory___accessibilityLastOpaqueElement__block_invoke())
  {
    objc_msgSend(a1, "_accessibilitySortedElementsWithinWithOptions:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "_accessibilityLastOpaqueElementWithOptions:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (id)_accessibilityLastOpaqueElementWithOptions:()AXPrivCategory
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (__71__NSObject_AXPrivCategory___accessibilityLastOpaqueElementWithOptions___block_invoke())
  {
    objc_msgSend(a1, "_accessibilityLastOpaqueElement");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(a1, "_accessibilitySortedElementsWithinWithOptions:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (uint64_t)_accessibilityOpaqueHeaderElementInDirection:()AXPrivCategory childElement:
{
  return 0;
}

- (uint64_t)_accessibilityMoveFocusToNextOpaqueElementForTechnology:()AXPrivCategory direction:searchType:range:
{
  return objc_msgSend(a1, "_accessibilityMoveFocusToNextOpaqueElementForTechnology:direction:searchType:range:shouldScrollToVisible:", a3, a4, a5, a6, a7, 1);
}

- (uint64_t)_accessibilityMoveFocusToNextOpaqueElementForTechnology:()AXPrivCategory direction:searchType:range:shouldScrollToVisible:
{
  uint64_t v2;

  LOBYTE(v2) = 0;
  return objc_msgSend(a1, "_accessibilityMoveFocusToNextOpaqueElementForTechnology:direction:searchType:range:shouldScrollToVisible:honorsGroups:", v2);
}

- (id)_accessibilityNextOpaqueElementsForTechnology:()AXPrivCategory startElement:direction:searchType:range:shouldScrollToVisible:honorsGroups:
{
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v23;
  NSObject *v24;
  NSObject *v25;
  id v26;
  uint64_t v28;
  void *v29;
  void *v30;
  id v35;
  uint8_t buf[4];
  id v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  if (!v12)
  {
    objc_msgSend(a1, "_accessibilityCurrentlyFocusedElementForTechnology:", v11);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_accessibilityHandleATFocused:assistiveTech:", 1, v11);
  }
  v30 = v11;
  AXLogOpaqueElements();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[NSObject(AXPrivCategory) _accessibilityNextOpaqueElementsForTechnology:startElement:direction:searchType:range:shouldScrollToVisible:honorsGroups:].cold.3((uint64_t)a1, v12);

  v14 = a1;
  v15 = v14;
  if (v12)
  {
    objc_msgSend(v12, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_923, 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    if (!v15)
    {
      v15 = v14;
      AXLogOpaqueElements();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        -[NSObject(AXPrivCategory) _accessibilityNextOpaqueElementsForTechnology:startElement:direction:searchType:range:shouldScrollToVisible:honorsGroups:].cold.2();

    }
  }
  v17 = v12;
  v18 = v17;
  if (v12)
    v19 = a9;
  else
    v19 = 0;
  v29 = v17;
  while (1)
  {
    v35 = v15;
    LOWORD(v28) = a9;
    objc_msgSend(v15, "_accessibilitySearchSubtreesAfterChildElement:direction:searchType:allowOutOfBoundsChild:range:shouldScrollToVisible:honorGroups:updatedContainer:", v18, a5, a6, v19, a7, a8, v28, &v35);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v35;

    if (v21 == v14 || v21 == 0)
      break;
    v23 = v21;

    objc_msgSend(v23, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_925, 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();

    AXLogOpaqueElements();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543362;
      v37 = v15;
      _os_log_debug_impl(&dword_19D0DD000, v24, OS_LOG_TYPE_DEBUG, "\tUP:  %{public}@", buf, 0xCu);
    }

    v18 = v23;
    if (v20)
      goto LABEL_23;
  }
  v23 = v18;
  v15 = v21;
LABEL_23:
  AXLogOpaqueElements();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    -[NSObject(AXPrivCategory) _accessibilityNextOpaqueElementsForTechnology:startElement:direction:searchType:range:shouldScrollToVisible:honorsGroups:].cold.1(v20);

  if (v20)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if ((_BYTE)a9)
        objc_msgSend(v20, "_accessibilityScrollToVisible");
    }
  }
  v26 = v20;

  return v26;
}

- (id)_accessibilityMoveFocusToNextOpaqueElementForTechnology:()AXPrivCategory direction:searchType:range:shouldScrollToVisible:honorsGroups:
{
  id v15;
  void *v16;
  uint64_t v18;

  v15 = a3;
  BYTE1(v18) = a9;
  LOBYTE(v18) = a8;
  objc_msgSend(a1, "_accessibilityNextOpaqueElementsForTechnology:startElement:direction:searchType:range:shouldScrollToVisible:honorsGroups:", v15, 0, a4, a5, a6, a7, v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_accessibilityHandleATFocused:assistiveTech:", 1, v15);

  return v16;
}

- (void)_accessibilitySetOpaqueElementScrollsContentIntoView:()AXPrivCategory
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "accessibilitySetUserDefinedOpaqueElementScrollsContentIntoView:", v2);

}

- (uint64_t)_accessibilityOpaqueElementScrollsContentIntoView
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "accessibilityUserDefinedOpaqueElementScrollsContentIntoView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (void)_accessibilityScrollOpaqueElementIntoView:()AXPrivCategory previousScroller:
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect v27;
  CGRect v28;

  v6 = a4;
  if ((objc_msgSend(v6, "safeBoolForKey:", CFSTR("_forwardsToParentScroller")) & 1) == 0)
  {
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v6, "bounds");
      objc_msgSend(v7, "convertRect:fromView:", v6);
      v9 = v8;
      v11 = v10;
      v13 = v12;
      v15 = v14;
      objc_msgSend(v7, "contentOffset");
      v17 = v16;
      v19 = v18;
      objc_msgSend(v7, "contentSize");
      v27.size.width = v20;
      v27.size.height = v21;
      v27.origin.x = v17;
      v27.origin.y = v19;
      v28.origin.x = v9;
      v28.origin.y = v11;
      v28.size.width = v13;
      v28.size.height = v15;
      if (CGRectContainsRect(v27, v28))
      {
LABEL_4:
        objc_msgSend(v7, "_accessibilityOpaqueElementScrollCleanup");
LABEL_10:

        goto LABEL_11;
      }
    }
    else
    {
      objc_msgSend(a1, "_accessibilityOffsetForOpaqueElementDirection:", a3);
      v9 = v22;
      v11 = v23;
      objc_msgSend(v7, "contentOffset");
      if (v25 == v9 && v24 == v11)
        goto LABEL_4;
    }
    objc_msgSend(v7, "accessibilityApplyScrollContent:sendScrollStatus:animated:", 0, 0, v9, v11);
    objc_msgSend(v7, "_accessibilityOpaqueElementScrollCleanup");
    objc_msgSend(v7, "layoutIfNeeded");
    goto LABEL_10;
  }
LABEL_11:

}

- (double)_accessibilityOffsetForOpaqueElementDirection:()AXPrivCategory
{
  void *v5;
  double v6;
  double v7;
  double v8;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "adjustedContentInset");
  if (a3 == 1)
  {
    if (objc_msgSend(a1, "_accessibilityApplicationIsRTL"))
      objc_msgSend(a1, "_accessibilityRightOpaqueScrollViewContentOffsetLimit");
    else
      objc_msgSend(a1, "_accessibilityLeftOpaqueScrollViewContentOffsetLimit");
    v8 = v6;
  }
  else
  {
    objc_msgSend(v5, "contentSize");
    objc_msgSend(v5, "bounds");
    if (objc_msgSend(a1, "_accessibilityApplicationIsRTL"))
      objc_msgSend(a1, "_accessibilityLeftOpaqueScrollViewContentOffsetLimit");
    else
      objc_msgSend(a1, "_accessibilityRightOpaqueScrollViewContentOffsetLimit");
    v8 = v7;
  }

  return v8;
}

- (double)_accessibilityRightOpaqueScrollViewContentOffsetLimit
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  int v11;
  double v12;
  double v13;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "adjustedContentInset");
  v4 = v3;
  v6 = v5;
  objc_msgSend(v2, "contentSize");
  v8 = v7;
  objc_msgSend(v2, "bounds");
  v10 = v6 + v8 - v9;
  v11 = objc_msgSend(a1, "_accessibilityApplicationIsRTL");
  v12 = -v4;
  if (v10 >= -v4)
    v12 = v10;
  if (v11)
    v13 = v10;
  else
    v13 = v12;

  return v13;
}

- (double)_accessibilityLeftOpaqueScrollViewContentOffsetLimit
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "adjustedContentInset");
  v4 = v3;
  v6 = -v5;
  if (objc_msgSend(a1, "_accessibilityApplicationIsRTL"))
  {
    objc_msgSend(v2, "contentSize");
    v8 = v7;
    objc_msgSend(v2, "bounds");
    if (v4 + v8 - v9 <= v6)
      v6 = v4 + v8 - v9;
  }

  return v6;
}

- (uint64_t)_accessibilityUsesFixFor72070946
{
  return 0;
}

- (id)_accessibilityFindElementInDirection:()AXPrivCategory searchType:allowOutOfBoundsChild:
{
  void *v9;
  void *v10;

  objc_msgSend(a1, "_accessibilityTouchContainer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilityFindElementInDirection:searchType:allowOutOfBoundsChild:startingTouchContainer:honorGroups:", a3, a4, a5, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_accessibilityFindElementInDirection:()AXPrivCategory searchType:allowOutOfBoundsChild:startingTouchContainer:honorGroups:
{
  id v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  void *v14;
  int v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t (**v30)(_QWORD);
  id v31;
  uint64_t v32;
  _BOOL4 v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  id v37;
  void (**v38)(void *, void *);
  void *v39;
  int v40;
  void *v41;
  BOOL v42;
  id v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t (**v47)(void);
  id v49;
  uint64_t v50;
  uint64_t (**v51)(_QWORD);
  int v52;
  _QWORD aBlock[4];
  id v56;
  uint64_t v57;
  uint64_t v58;
  char v59;
  char v60;
  _QWORD v61[5];
  id v62;
  _QWORD v63[5];
  _QWORD v64[5];
  _QWORD v65[3];

  v65[1] = *MEMORY[0x1E0C80C00];
  v10 = a6;
  AXLogOpaqueElements();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[NSObject(AXPrivCategory) _accessibilityFindElementInDirection:searchType:allowOutOfBoundsChild:startingTouchContainer:honorGroups:].cold.1();

  if (!objc_msgSend(a1, "isAccessibilityElement"))
  {
    if (a7 && objc_msgSend(a1, "_accessibilityIsGroupedParent"))
    {
      v16 = a1;
LABEL_77:
      v31 = v16;
      goto LABEL_84;
    }
    v52 = objc_msgSend(a1, "_accessibilityHasOrderedChildren");
    if (v52)
    {
      v17 = objc_msgSend(a1, "accessibilityElementCount");
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if ((objc_msgSend(a1, "_accessibilityUsesFixFor72070946") & 1) == 0)
          objc_msgSend(a1, "_accessibilityOpaqueElementScrollToDirection:", a3);
        +[UIAccessibilityElementTraversalOptions defaultVoiceOverOptions](UIAccessibilityElementTraversalOptions, "defaultVoiceOverOptions");
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = (void *)v18;
        if (a7)
        {
          +[UIAccessibilityElementTraversalOptions defaultVoiceOverOptionsHonoringGroups](UIAccessibilityElementTraversalOptions, "defaultVoiceOverOptionsHonoringGroups");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v20, "leafNodePredicate");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v61[0] = MEMORY[0x1E0C809B0];
          v61[1] = 3221225472;
          v61[2] = __133__NSObject_AXPrivCategory___accessibilityFindElementInDirection_searchType_allowOutOfBoundsChild_startingTouchContainer_honorGroups___block_invoke_3;
          v61[3] = &unk_1E3DFE7F8;
          v61[4] = a1;
          v22 = v21;
          v62 = v22;
          objc_msgSend(v20, "setLeafNodePredicate:", v61);
          objc_msgSend(a1, "_accessibilityGroupedParent");
          v23 = objc_claimAutoreleasedReturnValue();
          v24 = (void *)v23;
          if (v23)
          {
            v65[0] = v23;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 1);
            v25 = a4;
            v26 = v10;
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "setAllowedElementsForTraversal:", v27);

            v10 = v26;
            a4 = v25;
          }

        }
        else
        {
          v20 = (void *)v18;
        }
        objc_msgSend(a1, "_accessibilitySortedElementsWithinWithOptions:", v20);
        v30 = (uint64_t (**)(_QWORD))objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v30, "count");

LABEL_30:
        v31 = 0;
        if (a3 == 1)
          v32 = 0;
        else
          v32 = v17 - 1;
        v33 = v32 < v17;
        if (a3 != 1)
          v33 = v32 >= 0;
        if (v33)
        {
          if (a3 == 1)
            v34 = 1;
          else
            v34 = -1;
          v49 = v10;
          v50 = v34;
          v51 = v30;
          while (1)
          {
            if ((objc_msgSend(a1, "_accessibilityHasOrderedChildren", v49) & 1) != 0)
              objc_msgSend(a1, "accessibilityElementAtIndex:", v32);
            else
              objc_msgSend(v30, "objectAtIndex:", v32);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            if (v35 != a1
              && (!UIAccessibilityIsWidgetExtension()
               || (objc_msgSend(v35, "_accessibilityIsFrameOutOfBounds") & 1) == 0))
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v31 = v35;
                if (v31)
                  goto LABEL_67;
              }
              else
              {
                aBlock[0] = MEMORY[0x1E0C809B0];
                aBlock[1] = 3221225472;
                aBlock[2] = __133__NSObject_AXPrivCategory___accessibilityFindElementInDirection_searchType_allowOutOfBoundsChild_startingTouchContainer_honorGroups___block_invoke_4;
                aBlock[3] = &unk_1E3DFEBB0;
                v57 = a3;
                v58 = a4;
                v36 = a4;
                v59 = a5;
                v37 = v10;
                v56 = v37;
                v60 = a7;
                v38 = (void (**)(void *, void *))_Block_copy(aBlock);
                if (!v52)
                  goto LABEL_57;
                if (a3 == 2)
                  objc_msgSend(v35, "_accessibilitySupplementaryFooterViews");
                else
                  objc_msgSend(v35, "_accessibilitySupplementaryHeaderViews");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                v38[2](v38, v39);
                v31 = (id)objc_claimAutoreleasedReturnValue();

                v10 = v49;
                if (!v31)
                {
LABEL_57:
                  objc_msgSend(v35, "_accessibilityFindElementInDirection:searchType:allowOutOfBoundsChild:startingTouchContainer:honorGroups:", a3, v36, a5, v37, a7);
                  v31 = (id)objc_claimAutoreleasedReturnValue();
                  v40 = v31 ? 0 : v52;
                  if (v40 == 1)
                  {
                    if (a3 == 2)
                      objc_msgSend(v35, "_accessibilitySupplementaryHeaderViews");
                    else
                      objc_msgSend(v35, "_accessibilitySupplementaryFooterViews");
                    v41 = (void *)objc_claimAutoreleasedReturnValue();
                    v38[2](v38, v41);
                    v31 = (id)objc_claimAutoreleasedReturnValue();

                  }
                }

                a4 = v36;
                v34 = v50;
                v30 = v51;
                if (v31)
                {
LABEL_67:

                  goto LABEL_83;
                }
              }
            }

            v32 += v34;
            v42 = v32 < v17;
            if (a3 != 1)
              v42 = v32 >= 0;
            if (!v42)
            {
              v31 = 0;
              goto LABEL_83;
            }
          }
        }
        goto LABEL_83;
      }
      v17 = 0;
    }
    v30 = 0;
    goto LABEL_30;
  }
  v12 = objc_msgSend(a1, "accessibilityTraits");
  if ((UIAccessibilityTraitSpacer & ~v12) == 0)
    goto LABEL_73;
  v13 = a1;
  v14 = v13;
  if (a4 <= 10)
  {
    if (a4 == 1)
    {
      v28 = objc_msgSend(v13, "accessibilityTraits");
      v29 = (_QWORD *)MEMORY[0x1E0CF4490];
    }
    else
    {
      if (a4 != 10)
        goto LABEL_74;
      v28 = objc_msgSend(v13, "accessibilityTraits");
      v29 = (_QWORD *)MEMORY[0x1E0CF4498];
    }
    goto LABEL_72;
  }
  if (a4 == 11)
  {
    v28 = objc_msgSend(v13, "accessibilityTraits");
    v29 = (_QWORD *)MEMORY[0x1E0CF44D8];
LABEL_72:
    v45 = *v29 & ~v28;

    if (v45)
      goto LABEL_73;
LABEL_75:
    if (a5)
    {
      v16 = v14;
      goto LABEL_77;
    }
    v46 = MEMORY[0x1E0C809B0];
    v64[0] = MEMORY[0x1E0C809B0];
    v64[1] = 3221225472;
    v64[2] = __133__NSObject_AXPrivCategory___accessibilityFindElementInDirection_searchType_allowOutOfBoundsChild_startingTouchContainer_honorGroups___block_invoke;
    v64[3] = &unk_1E3DFE3B0;
    v64[4] = v14;
    v30 = (uint64_t (**)(_QWORD))_Block_copy(v64);
    v63[0] = v46;
    v63[1] = 3221225472;
    v63[2] = __133__NSObject_AXPrivCategory___accessibilityFindElementInDirection_searchType_allowOutOfBoundsChild_startingTouchContainer_honorGroups___block_invoke_2;
    v63[3] = &unk_1E3DFE3B0;
    v63[4] = v14;
    v47 = (uint64_t (**)(void))_Block_copy(v63);
    if ((v47[2]() & 1) != 0 || (v30[2](v30) & 1) == 0)
      v31 = v14;
    else
      v31 = 0;

LABEL_83:
    goto LABEL_84;
  }
  if (a4 == 35)
  {
    v43 = v10;
    objc_msgSend(v14, "_accessibilityTouchContainer");
    v44 = (id)objc_claimAutoreleasedReturnValue();

    if (v44 == v43)
      goto LABEL_73;
    goto LABEL_75;
  }
  if (a4 != 36)
  {
LABEL_74:

    goto LABEL_75;
  }
  v15 = objc_msgSend(v13, "_accessibilityIsSpeakThisElement");

  if (v15)
    goto LABEL_75;
LABEL_73:
  v31 = 0;
LABEL_84:

  return v31;
}

- (void)_accessibilityOpaqueElementScrollToDirection:()AXPrivCategory
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;

  objc_opt_class();
  v5 = a1;
  if (v5)
  {
    v6 = v5;
    v9 = 0;
    do
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (objc_msgSend(v6, "_accessibilityOpaqueElementScrollsContentIntoView")
          && objc_msgSend(v6, "isScrollEnabled"))
        {
          objc_msgSend(v6, "_accessibilityScrollOpaqueElementIntoView:previousScroller:", a3, v9);
        }
        v7 = v6;

        v9 = v7;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v6, "superview");
      else
        objc_msgSend(v6, "accessibilityContainer");
      v8 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v8;
    }
    while (v8);

  }
}

- (id)_accessibilitySortedElementsWithin
{
  void *v3;
  void *v4;

  if (__62__NSObject_AXPrivCategory___accessibilitySortedElementsWithin__block_invoke())
    return 0;
  +[UIAccessibilityElementTraversalOptions defaultVoiceOverOptions](UIAccessibilityElementTraversalOptions, "defaultVoiceOverOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilitySortedElementsWithinWithOptions:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_accessibilitySortedElementsWithinWithOptions:()AXPrivCategory
{
  void *v2;

  if (__74__NSObject_AXPrivCategory___accessibilitySortedElementsWithinWithOptions___block_invoke())
  {
    objc_msgSend(a1, "_accessibilitySortedElementsWithin");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (uint64_t)_accessibilityElementServesAsHeadingLandmark
{
  return 0;
}

- (id)_accessibilityFocusAbsoluteFirstLastOpaqueElement:()AXPrivCategory technology:honorsGroups:shouldAlwaysScroll:
{
  uint64_t v8;
  void *v9;
  uint64_t v11;

  if ((objc_msgSend(a1, "isAccessibilityOpaqueElementProvider") & 1) == 0)
    _AXAssert();
  if (a3)
    v8 = 1;
  else
    v8 = 2;
  BYTE1(v11) = a5;
  LOBYTE(v11) = 1;
  objc_msgSend(a1, "_accessibilitySearchSubtreesAfterChildElement:direction:searchType:allowOutOfBoundsChild:range:shouldScrollToVisible:honorGroups:updatedContainer:", 0, v8, 0, 0, 0x7FFFFFFFLL, 0, v11, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_accessibilityScrollToVisible");
  objc_msgSend(v9, "_accessibilityHandleATFocused:assistiveTech:", 1, *MEMORY[0x1E0CEB068]);
  return v9;
}

- (id)_accessibilitySearchSubtreesAfterChildElement:()AXPrivCategory direction:searchType:allowOutOfBoundsChild:range:shouldScrollToVisible:honorGroups:updatedContainer:
{
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  char v27;
  id v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  BOOL v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  NSObject *v40;
  uint64_t v42;
  uint64_t v43;
  NSObject **v44;
  _QWORD v45[4];
  id v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  char v50;
  unsigned __int8 v51;
  id v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  _QWORD v59[5];
  id v60;
  _QWORD v61[3];

  v43 = a11;
  v61[1] = *MEMORY[0x1E0C80C00];
  v15 = a3;
  +[UIAccessibilityElementTraversalOptions defaultVoiceOverOptions](UIAccessibilityElementTraversalOptions, "defaultVoiceOverOptions");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (a10)
  {
    +[UIAccessibilityElementTraversalOptions defaultVoiceOverOptionsHonoringGroups](UIAccessibilityElementTraversalOptions, "defaultVoiceOverOptionsHonoringGroups");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "leafNodePredicate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v59[0] = MEMORY[0x1E0C809B0];
    v59[1] = 3221225472;
    v59[2] = __174__NSObject_AXPrivCategory___accessibilitySearchSubtreesAfterChildElement_direction_searchType_allowOutOfBoundsChild_range_shouldScrollToVisible_honorGroups_updatedContainer___block_invoke;
    v59[3] = &unk_1E3DFE7F8;
    v59[4] = a1;
    v60 = v19;
    v20 = v19;
    objc_msgSend(v18, "setLeafNodePredicate:", v59);

  }
  else
  {
    v18 = (void *)v16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (a10)
    {
      -[NSObject _axNavigationalGroupParentOfChild:](a1, "_axNavigationalGroupParentOfChild:", v15);
      v21 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = 0;
    }
    if (v21)
      v22 = v21;
    else
      v22 = a1;
    v61[0] = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 1, a11);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAllowedElementsForTraversal:", v23);

  }
  else
  {
    if (-[NSObject _accessibilityHasOrderedChildren](a1, "_accessibilityHasOrderedChildren"))
      goto LABEL_16;
    AXLogOpaqueElements();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      -[NSObject(AXPrivCategory) _accessibilitySearchSubtreesAfterChildElement:direction:searchType:allowOutOfBoundsChild:range:shouldScrollToVisible:honorGroups:updatedContainer:].cold.5();
  }

LABEL_16:
  objc_msgSend(v18, "setDirection:", a4, v43);
  objc_msgSend(v18, "setAlternateViewChildrenHandler:", &__block_literal_global_937);
  if (v15 != a1)
  {
    if (a5 == 1)
    {
      -[NSObject _accessibilityOpaqueHeaderElementInDirection:childElement:](a1, "_accessibilityOpaqueHeaderElementInDirection:childElement:", a4, v15);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      AXLogOpaqueElements();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        -[NSObject(AXPrivCategory) _accessibilitySearchSubtreesAfterChildElement:direction:searchType:allowOutOfBoundsChild:range:shouldScrollToVisible:honorGroups:updatedContainer:].cold.4();

      if (v24)
      {
        objc_msgSend(MEMORY[0x1E0C99E38], "null");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v24, "isEqual:", v26);

        if ((v27 & 1) != 0)
          v28 = 0;
        else
          v28 = v24;

        goto LABEL_60;
      }
    }
    -[NSObject _accessibilityTouchContainer](v15, "_accessibilityTouchContainer");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (((-[NSObject _accessibilityHasOrderedChildren](a1, "_accessibilityHasOrderedChildren") | a9 ^ 1) & 1) == 0)
    {
      if (v15)
        -[NSObject _accessibilityScrollToVisibleForNextElementRetrieval:](v15, "_accessibilityScrollToVisibleForNextElementRetrieval:", a4);
      else
        -[NSObject _accessibilityOpaqueElementScrollToDirection:](a1, "_accessibilityOpaqueElementScrollToDirection:", a4);
    }
    v53 = 0;
    v54 = &v53;
    v55 = 0x3032000000;
    v56 = __Block_byref_object_copy__2;
    v57 = __Block_byref_object_dispose__2;
    v58 = 0;
    if (v15)
    {
      v31 = objc_msgSend(v18, "includeAncestorsOfSelfInSiblingMatch");
      if ((v31 & 1) == 0)
      {
        NSClassFromString(CFSTR("_UIRemoteView"));
        objc_msgSend(v18, "setIncludeAncestorsOfSelfInSiblingMatch:", objc_opt_isKindOfClass() & 1);
      }
      v52 = 0;
      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v45[2] = __174__NSObject_AXPrivCategory___accessibilitySearchSubtreesAfterChildElement_direction_searchType_allowOutOfBoundsChild_range_shouldScrollToVisible_honorGroups_updatedContainer___block_invoke_939;
      v45[3] = &unk_1E3DFEC58;
      v47 = &v53;
      v48 = a4;
      v49 = a5;
      v50 = a6;
      v46 = v29;
      v51 = a10;
      v32 = -[NSObject _accessibilityEnumerateSiblingsWithParent:options:usingBlock:](v15, "_accessibilityEnumerateSiblingsWithParent:options:usingBlock:", &v52, v18, v45);
      v33 = v52;
      objc_msgSend(v18, "setIncludeAncestorsOfSelfInSiblingMatch:", v31);
      if (!v32)
      {
        AXLogOpaqueElements();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
          -[NSObject(AXPrivCategory) _accessibilitySearchSubtreesAfterChildElement:direction:searchType:allowOutOfBoundsChild:range:shouldScrollToVisible:honorGroups:updatedContainer:].cold.3();

      }
      v35 = v46;
      goto LABEL_40;
    }
    if (!-[NSObject isAccessibilityOpaqueElementProvider](a1, "isAccessibilityOpaqueElementProvider"))
    {
LABEL_49:
      if (v54[5])
      {
        v33 = 0;
        goto LABEL_51;
      }
      -[NSObject _accessibilityFindElementInDirection:searchType:allowOutOfBoundsChild:startingTouchContainer:honorGroups:](a1, "_accessibilityFindElementInDirection:searchType:allowOutOfBoundsChild:startingTouchContainer:honorGroups:", a4, a5, a6, v29, a10);
      v42 = objc_claimAutoreleasedReturnValue();
      v33 = 0;
      v35 = (void *)v54[5];
      v54[5] = v42;
LABEL_40:

LABEL_51:
      if (v44)
      {
        if (v33)
        {
          if (v33 != a1)
          {
            AXLogOpaqueElements();
            v40 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
              -[NSObject(AXPrivCategory) _accessibilitySearchSubtreesAfterChildElement:direction:searchType:allowOutOfBoundsChild:range:shouldScrollToVisible:honorGroups:updatedContainer:].cold.2();

            a1 = v33;
          }
        }
        else
        {
          a1 = a1;
        }
        v33 = objc_retainAutorelease(a1);
        *v44 = v33;
      }
      v28 = (id)v54[5];

      _Block_object_dispose(&v53, 8);
      goto LABEL_60;
    }
    if (a4 == 2)
    {
      -[NSObject _accessibilityLastOpaqueElementWithOptions:](a1, "_accessibilityLastOpaqueElementWithOptions:", v18);
      v36 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (a4 != 1)
      {
        v37 = 0;
        goto LABEL_48;
      }
      -[NSObject _accessibilityFirstOpaqueElementWithOptions:](a1, "_accessibilityFirstOpaqueElementWithOptions:", v18);
      v36 = objc_claimAutoreleasedReturnValue();
    }
    v37 = (void *)v36;
LABEL_48:
    objc_msgSend(v37, "_accessibilityFindElementInDirection:searchType:allowOutOfBoundsChild:startingTouchContainer:honorGroups:", a4, a5, a6, v29, a10);
    v38 = objc_claimAutoreleasedReturnValue();
    v39 = (void *)v54[5];
    v54[5] = v38;

    goto LABEL_49;
  }
  AXLogOpaqueElements();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    -[NSObject(AXPrivCategory) _accessibilitySearchSubtreesAfterChildElement:direction:searchType:allowOutOfBoundsChild:range:shouldScrollToVisible:honorGroups:updatedContainer:].cold.1();

  -[NSObject _accessibilityFirstOpaqueElementWithOptions:](a1, "_accessibilityFirstOpaqueElementWithOptions:", v18);
  v28 = (id)objc_claimAutoreleasedReturnValue();
LABEL_60:

  return v28;
}

- (uint64_t)_accessibilityVisibleOpaqueElements
{
  return objc_msgSend(a1, "_accessibilityVisibleOpaqueElementsHonoringGroups:sorted:", 0, 0);
}

- (id)_accessibilityVisibleOpaqueElementsHonoringGroups:()AXPrivCategory sorted:
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[5];
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a1, "isAccessibilityOpaqueElementProvider") & 1) == 0)
    _AXAssert();
  +[UIAccessibilityElementTraversalOptions options](UIAccessibilityElementTraversalOptions, "options");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a3)
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __85__NSObject_AXPrivCategory___accessibilityVisibleOpaqueElementsHonoringGroups_sorted___block_invoke;
    v21[3] = &unk_1E3DFDE98;
    v21[4] = a1;
    objc_msgSend(v7, "setLeafNodePredicate:", v21);
  }
  objc_msgSend(v8, "setShouldOnlyIncludeElementsWithVisibleFrame:", 1);
  objc_msgSend(v8, "setSorted:", a4);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(a1, "_accessibilitySortedElementsWithinWithOptions:", v8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14), "_accessibilityLeafDescendantsWithOptions:", v8);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObjectsFromArray:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v12);
  }

  return v9;
}

- (id)_accessibilityDescendantOfType:()AXPrivCategory
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __59__NSObject_AXPrivCategory___accessibilityDescendantOfType___block_invoke;
  v4[3] = &__block_descriptor_40_e8_B16__0_8lu32l8;
  v4[4] = a3;
  objc_msgSend(a1, "_accessibilityFindDescendant:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_accessibilityHasDescendantOfType:()AXPrivCategory
{
  void *v3;
  _BOOL8 v4;
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __62__NSObject_AXPrivCategory___accessibilityHasDescendantOfType___block_invoke;
  v6[3] = &__block_descriptor_40_e8_B16__0_8lu32l8;
  v6[4] = a3;
  objc_msgSend(a1, "_accessibilityFindDescendant:", v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (uint64_t)_accessibilityUnignoredDescendant
{
  return objc_msgSend(a1, "_accessibilityFindDescendant:", &__block_literal_global_941);
}

- (uint64_t)_accessibilityIsSwiftUIHostingView
{
  return 0;
}

- (uint64_t)accessibilityCustomAttribute:()AXPrivCategory
{
  return 0;
}

- (id)accessibilityViewWithIdentifier:()AXPrivCategory
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__NSObject_AXPrivCategory__accessibilityViewWithIdentifier___block_invoke;
  v8[3] = &unk_1E3DFDE98;
  v9 = v4;
  v5 = v4;
  objc_msgSend(a1, "_accessibilityFindDescendant:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_accessibilityIsViewDescendantOfElement:()AXPrivCategory
{
  id v4;
  id v5;
  id v6;
  _BOOL8 i;
  void *v8;

  v4 = a3;
  v5 = a1;
  v6 = v5;
  for (i = v5 != 0; v6 != v4 && v6; i = v6 != 0)
  {
    v8 = v6;
    objc_msgSend(v6, "superview");
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return i;
}

- (BOOL)_accessibilityIsDescendantOfElement:()AXPrivCategory
{
  id v3;
  id v4;
  id v6;
  id v7;
  _BOOL8 v8;
  id v9;
  char isKindOfClass;
  id v11;
  char v12;
  id v13;
  void *v14;
  char v15;
  uint64_t v16;
  id v17;

  v6 = a3;
  v7 = a1;
  NSClassFromString(CFSTR("UIAccessibilityElementMockView"));
  NSClassFromString(CFSTR("UITableViewCellAccessibilityElement"));
  NSClassFromString(CFSTR("UICollectionViewCellAccessibilityElement"));
  v8 = v7 != 0;
  if (v7 == v6 || !v7)
    goto LABEL_35;
  while (1)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v6, "safeValueForKey:", CFSTR("view"));
      v9 = (id)objc_claimAutoreleasedReturnValue();

      if (v9 == v7)
        break;
    }
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v6, "safeValueForKey:", CFSTR("tableViewCell"));
      v3 = (id)objc_claimAutoreleasedReturnValue();
      if (v3 == v7)
        goto LABEL_33;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "safeValueForKey:", CFSTR("tableViewCell"));
      v11 = (id)objc_claimAutoreleasedReturnValue();

      if ((isKindOfClass & 1) != 0)
      if (v11 == v6)
        break;
    }
    else if ((isKindOfClass & 1) != 0)
    {

    }
    v12 = objc_opt_isKindOfClass();
    if ((v12 & 1) != 0)
    {
      objc_msgSend(v6, "safeValueForKey:", CFSTR("cell"));
      v4 = (id)objc_claimAutoreleasedReturnValue();
      if (v4 == v7)
      {
LABEL_33:

        break;
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "safeValueForKey:", CFSTR("cell"));
      v13 = (id)objc_claimAutoreleasedReturnValue();

      if ((v12 & 1) != 0)
      if (v13 == v6)
        break;
    }
    else if ((v12 & 1) != 0)
    {

    }
    objc_msgSend(v7, "accessibilityContainer");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = objc_opt_respondsToSelector();

      if ((v15 & 1) != 0)
      {
        objc_msgSend(v7, "superview");
        v16 = objc_claimAutoreleasedReturnValue();
        goto LABEL_30;
      }
    }
    else
    {

    }
    objc_msgSend(v7, "accessibilityContainer");
    v16 = objc_claimAutoreleasedReturnValue();
LABEL_30:
    v17 = (id)v16;

    v8 = v17 != 0;
    if (v17 != v6)
    {
      v7 = v17;
      if (v17)
        continue;
    }
    goto LABEL_36;
  }
  v8 = 1;
LABEL_35:
  v17 = v7;
LABEL_36:

  return v8;
}

- (id)_accessibilityFindViewAncestor:()AXPrivCategory startWithSelf:
{
  unsigned int (**v6)(id, void *, _BYTE *);
  id v7;
  void *v8;
  id v9;
  char v11;

  v6 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (!a4 ? (objc_msgSend(a1, "superview"), v7 = (id)objc_claimAutoreleasedReturnValue()) : (v7 = a1),
        (v8 = v7) != 0))
  {
    while (1)
    {
      v11 = 0;
      if (v6[2](v6, v8, &v11))
      {
        v9 = v8;
        goto LABEL_13;
      }
      if (v11)
        break;
      objc_msgSend(v8, "superview");
      v9 = (id)objc_claimAutoreleasedReturnValue();

      v8 = v9;
      if (!v9)
        goto LABEL_14;
    }
    v9 = 0;
LABEL_13:

  }
  else
  {
    v9 = 0;
  }
LABEL_14:

  return v9;
}

- (uint64_t)_accessibilityAncestorIsAccessibilityElementsHidden
{
  return objc_msgSend(a1, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_952, 1);
}

- (void)accessibilityEnumerateAncestorsUsingBlock:()AXPrivCategory
{
  void (**v4)(id, void *, _BYTE *);
  id v5;
  void *v6;
  uint64_t v7;
  char v8;

  v4 = a3;
  v5 = a1;
  if (v5)
  {
    v6 = v5;
    while (1)
    {
      v8 = 0;
      v4[2](v4, v6, &v8);
      if (v8)
        break;
      objc_msgSend(v6, "accessibilityContainer");
      v7 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v7;
      if (!v7)
        goto LABEL_7;
    }

  }
LABEL_7:

}

- (id)_accessibilityFindDescendant:()AXPrivCategory
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__NSObject_AXPrivCategory___accessibilityFindDescendant___block_invoke;
  v4[3] = &unk_1E3DFED88;
  v4[4] = a1;
  -[NSObject _accessibilityFindFirstAXDescendantPassingTest:byYieldingElements:](a1, a3, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_accessibilityFindSubviewDescendant:()AXPrivCategory
{
  return -[NSObject _accessibilityFindFirstAXDescendantPassingTest:byYieldingElements:](a1, a3, &__block_literal_global_956);
}

- (id)_accessibilityFindSubviewDescendantsPassingTest:()AXPrivCategory
{
  void *v4;

  -[NSObject _accessibilityFindAXDescendantsPassingTest:byYieldingElements:](a1, a3, &__block_literal_global_957);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilitySortElementsUsingGeometry:", v4);
  return v4;
}

- (id)_accessibilityFindViewControllerDescendant:()AXPrivCategory
{
  return -[NSObject _accessibilityFindFirstAXDescendantPassingTest:byYieldingElements:](a1, a3, &__block_literal_global_958);
}

- (id)_accessibilityFindViewControllerDescendantOfType:()AXPrivCategory
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __77__NSObject_AXPrivCategory___accessibilityFindViewControllerDescendantOfType___block_invoke;
  v4[3] = &__block_descriptor_40_e8_B16__0_8lu32l8;
  v4[4] = a3;
  objc_msgSend(a1, "_accessibilityFindViewControllerDescendant:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_accessibilityFindUnsortedSubviewDescendantsPassingTest:()AXPrivCategory
{
  return -[NSObject _accessibilityFindAXDescendantsPassingTest:byYieldingElements:](a1, a3, &__block_literal_global_959);
}

- (id)_accessibilityFindUnsortedDescendantsPassingTest:()AXPrivCategory
{
  return -[NSObject _accessibilityFindAXDescendantsPassingTest:byYieldingElements:](a1, a3, &__block_literal_global_960);
}

- (id)_accessibilityControlDescendantWithTarget:()AXPrivCategory
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v4 = a3;
  v5 = objc_opt_class();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __70__NSObject_AXPrivCategory___accessibilityControlDescendantWithTarget___block_invoke;
  v9[3] = &unk_1E3DFEE70;
  v10 = v4;
  v11 = v5;
  v6 = v4;
  objc_msgSend(a1, "_accessibilityFindSubviewDescendant:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_accessibilityControlDescendantWithAction:()AXPrivCategory
{
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  v5 = objc_opt_class();
  NSStringFromSelector(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__NSObject_AXPrivCategory___accessibilityControlDescendantWithAction___block_invoke;
  v10[3] = &unk_1E3DFEE70;
  v11 = v6;
  v12 = v5;
  v7 = v6;
  objc_msgSend(a1, "_accessibilityFindSubviewDescendant:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_accessibilitySetAuditIssueDict:()AXPrivCategory
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("auditIssueSetAssociatedObjectKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_accessibilitySetRetainedValue:forKey:", v4, CFSTR("auditIssueSetAssociatedObjectKey"));
  }
  objc_msgSend(v4, "addObject:", v5);

}

- (id)_accessibilityAuditIssuesWithOptions:()AXPrivCategory
{
  return (id)objc_opt_new();
}

- (uint64_t)_accessibilityVisibleElementsHonoringGroups:()AXPrivCategory
{
  return objc_msgSend(a1, "_accessibilityVisibleElementsHonoringGroups:respectGroupedParents:", a3, 1);
}

- (uint64_t)_accessibilityAuditVisibleElementsHonoringGroups:()AXPrivCategory
{
  return objc_msgSend(a1, "_accessibilityVisibleElementsHonoringGroups:respectGroupedParents:", a3, 0);
}

- (id)_accessibilityVisibleElementsHonoringGroups:()AXPrivCategory respectGroupedParents:
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  char v18;
  void *v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[5];
  char v24;

  +[UIAccessibilityElementTraversalOptions options](UIAccessibilityElementTraversalOptions, "options");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a3)
  {
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __94__NSObject_AXPrivCategory___accessibilityVisibleElementsHonoringGroups_respectGroupedParents___block_invoke;
    v23[3] = &unk_1E3DFEE98;
    v24 = a4;
    v23[4] = a1;
    objc_msgSend(v7, "setLeafNodePredicate:", v23);
  }
  objc_msgSend(v8, "setShouldOnlyIncludeElementsWithVisibleFrame:", 1);
  objc_msgSend(a1, "_accessibilityLeafDescendantsWithOptions:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (a3)
  {
    v11 = (id)objc_opt_new();
    v20 = v10;
    objc_msgSend(MEMORY[0x1E0C99DE8], "axArrayWithPossiblyNilArrays:", 1, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    while (objc_msgSend(v12, "count"))
    {
      objc_msgSend(v12, "ax_dequeueObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "axSafelyAddObject:", v13);
      +[UIAccessibilityElementTraversalOptions options](UIAccessibilityElementTraversalOptions, "options");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __94__NSObject_AXPrivCategory___accessibilityVisibleElementsHonoringGroups_respectGroupedParents___block_invoke_2;
      v21[3] = &unk_1E3DFDE98;
      v15 = v13;
      v22 = v15;
      objc_msgSend(v14, "setLeafNodePredicate:", v21);
      objc_msgSend(v8, "setShouldOnlyIncludeElementsWithVisibleFrame:", 1);
      objc_msgSend(v15, "_accessibilityLeafDescendantsWithOptions:", v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "firstObject");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqual:", v15);

      if ((v18 & 1) == 0)
        objc_msgSend(v12, "axSafelyAddObjectsFromArray:", v16);

    }
    v10 = v20;
  }
  else
  {
    v11 = v9;
  }

  return v11;
}

- (id)_accessibilityRemoteParent
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if (v1)
  {
    while (!objc_msgSend(v1, "_accessibilityIsRemoteElement")
         || (objc_msgSend(v1, "onClientSide") & 1) != 0)
    {
      objc_msgSend(v1, "accessibilityContainer");
      v2 = objc_claimAutoreleasedReturnValue();

      v1 = (id)v2;
      if (!v2)
        goto LABEL_7;
    }
    v1 = v1;
  }
LABEL_7:

  return v1;
}

- (uint64_t)_accessibilityOrderedChildrenContainer
{
  return objc_msgSend(a1, "_accessibilityOrderedChildrenContainerWithinElements:", 0);
}

- (id)_accessibilityOrderedChildrenContainerWithinElements:()AXPrivCategory
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "accessibilityContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    while ((objc_msgSend(v5, "_accessibilityHasOrderedChildren") & 1) == 0)
    {
      objc_msgSend(v5, "accessibilityContainer");
      v6 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v6;
      if (!v6)
        goto LABEL_19;
    }
    if (v4)
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v7 = v4;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v20;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v20 != v10)
              objc_enumerationMutation(v7);
            v12 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v5, "_accessibilityParentView");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = objc_msgSend(v13, "_accessibilityIsViewDescendantOfElement:", v12);

              if ((v14 & 1) != 0)
                goto LABEL_18;
            }
            else if ((objc_msgSend(v5, "_accessibilityIsDescendantOfElement:", v12, (_QWORD)v19) & 1) != 0)
            {
              goto LABEL_18;
            }
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v9);
      }

      v7 = v5;
      v5 = 0;
LABEL_18:

    }
  }
LABEL_19:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "safeValueForKey:", CFSTR("_accessibilityMockParent"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      v17 = v15;

      v5 = v17;
    }

  }
  return v5;
}

- (id)_accessibilityScannerElementsGrouped:()AXPrivCategory shouldIncludeNonScannerElements:
{
  void *v7;
  void *v8;
  NSObject *v9;
  _DWORD v11[2];
  __int16 v12;
  int v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  +[UIAccessibilityElementTraversalOptions defaultSwitchControlOptions](UIAccessibilityElementTraversalOptions, "defaultSwitchControlOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setShouldReturnScannerGroups:", a3);
  if (a4)
    objc_msgSend(v7, "setLeafNodePredicate:", &__block_literal_global_964);
  objc_msgSend(a1, "_accessibilityLeafDescendantsWithOptions:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  AXLogElementTraversal();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v11[0] = 67109634;
    v11[1] = a3;
    v12 = 1024;
    v13 = a4;
    v14 = 2114;
    v15 = v8;
    _os_log_debug_impl(&dword_19D0DD000, v9, OS_LOG_TYPE_DEBUG, "*** Scanner elements (grouped: %i, include non scanner: %i) were %{public}@", (uint8_t *)v11, 0x18u);
  }

  return v8;
}

- (uint64_t)_accessibilityIsRootElementForElementTraversal
{
  return 0;
}

- (void)setAccessibilitySize:()AXPrivCategory
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3B18], "axValueWithCGSize:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilitySetRetainedValue:forKey:", v2, CFSTR("_AX_Size"));

}

- (void)_accessibilitySetAllowedGeometryOverlap:()AXPrivCategory
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilitySetRetainedValue:forKey:", v2, CFSTR("UIAccessibilityStorageKeyAllowedGeometryOverlap"));

}

- (double)_accessibilityAllowedGeometryOverlap
{
  double v2;
  void *v3;
  void *v4;
  double v5;

  v2 = 13.0;
  if ((AXDeviceIsPad() & 1) == 0)
  {
    if (AXDeviceIsWatch())
      v2 = 4.0;
    else
      v2 = 8.0;
  }
  objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("UIAccessibilityStorageKeyAllowedGeometryOverlap"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "doubleValue");
    v2 = v5;
  }

  return v2;
}

- (double)_accessibilityAllowedGeometryOverlapX
{
  return 0.0;
}

- (uint64_t)_accessibilitySetOverridesInvisibility:()AXPrivCategory
{
  return objc_msgSend(a1, "_accessibilitySetBoolValue:forKey:", a3, CFSTR("UIAccessibilityStorageKeyOverridesInvisibility"));
}

- (uint64_t)_accessibilityOverridesInvisibility
{
  void *v2;

  objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("UIAccessibilityStorageKeyOverridesInvisibility"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
    return objc_msgSend(a1, "_accessibilityBoolValueForKey:", CFSTR("UIAccessibilityStorageKeyOverridesInvisibility"));
  else
    return 0;
}

- (uint64_t)_accessibilitySortPriorityWithReturningElement:()AXPrivCategory
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p-sortPriorityWithView"), a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)AXServerCache, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend((id)AXServerCache, "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("view"));
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)AXServerCache, "objectForKeyedSubscript:", v5);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("priority"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "integerValue");
  }
  else
  {
    v10 = UIAccessibilityDefaultSortPriority;
    v8 = a1;
    if (v8)
    {
      while (1)
      {
        v10 = objc_msgSend(v8, "_accessibilitySortPriority");
        if (v10 != UIAccessibilityDefaultSortPriority)
          break;
        objc_msgSend(v8, "accessibilityContainer");
        v11 = objc_claimAutoreleasedReturnValue();

        v8 = (id)v11;
        if (!v11)
          goto LABEL_8;
      }
      v8 = objc_retainAutorelease(v8);
      *a3 = v8;
    }
LABEL_8:
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v12;
    if (*a3)
      objc_msgSend(v12, "setObject:forKeyedSubscript:", *a3, CFSTR("view"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, CFSTR("priority"));

    objc_msgSend((id)AXServerCache, "setObject:forKeyedSubscript:", v9, v5);
  }

  return v10;
}

- (uint64_t)_accessibilityCompareElement:()AXPrivCategory toElement:
{
  return 0;
}

- (double)_handleRotatingFrame:()AXPrivCategory fromOrientation:toOrientation:
{
  double v5;

  if (a4)
  {
    AXDeviceGetMainScreenBounds();
    _UIConvertRectFromOrientationToOrientation();
    return v5;
  }
  return a1;
}

- (uint64_t)_accessibilityUsesChildrenFramesForSorting
{
  return 0;
}

- (double)_accessibilityChildrenUnionContentFrame
{
  __int128 v1;
  double v2;
  _QWORD v4[5];
  uint64_t v5;
  double *v6;
  uint64_t v7;
  const char *v8;
  __int128 v9;
  __int128 v10;

  v5 = 0;
  v6 = (double *)&v5;
  v7 = 0x4010000000;
  v8 = "";
  v1 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v9 = *MEMORY[0x1E0C9D648];
  v10 = v1;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __67__NSObject_AXPrivCategory___accessibilityChildrenUnionContentFrame__block_invoke;
  v4[3] = &unk_1E3DFEA20;
  v4[4] = &v5;
  objc_msgSend(a1, "accessibilityEnumerateContainerElementsUsingBlock:", v4);
  v2 = v6[4];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (double)_accessibilityFrameForSorting
{
  uint64_t v2;
  void *v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  objc_msgSend(a1, "_accessibilityGetBlockForAttribute:", 23);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
  {
    v4 = (*(double (**)(uint64_t))(v2 + 16))(v2);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p-_accessibilityFrameForSorting"), a1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)AXServerCache, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend((id)AXServerCache, "objectForKeyedSubscript:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "rectValue");
      v4 = v8;
    }
    else
    {
      if (objc_msgSend(a1, "_accessibilityHasOrderedChildren")
        && objc_msgSend(a1, "_accessibilityUsesChildrenFramesForSorting"))
      {
        objc_msgSend(a1, "_accessibilityChildrenUnionContentFrame");
      }
      else
      {
        objc_msgSend(a1, "_accessibilityContentFrame");
      }
      v4 = v9;
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)AXServerCache, "setObject:forKeyedSubscript:", v7, v5);
    }

  }
  return v4;
}

- (uint64_t)_accessibilityGeometrySortedElements:()AXPrivCategory
{
  return objc_msgSend(a3, "sortedArrayUsingSelector:", sel_accessibilityCompareGeometry_);
}

- (uint64_t)_accessibilitySortElementsUsingGeometry:()AXPrivCategory
{
  return objc_msgSend(a3, "sortUsingSelector:", sel_accessibilityCompareGeometry_);
}

- (uint64_t)_accessibilityOrientationForCompareGeometryForApplication:()AXPrivCategory
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  if (AXProcessIsSpringBoard())
  {
    v5 = objc_msgSend(v4, "activeInterfaceOrientation");
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
      objc_msgSend(a1, "_accessibilityWindow");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v7, "interfaceOrientation");

      goto LABEL_7;
    }
    v5 = objc_msgSend(v4, "_accessibilityOrientationForCompareGeometry");
  }
  v6 = v5;
LABEL_7:

  return v6;
}

- (uint64_t)accessibilityCompareGeometry:()AXPrivCategory
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  v5 = (void *)MEMORY[0x1A1ADCDB4]();
  v6 = -[NSObject _accessibilityCompareGeometry:](a1, v4);
  objc_autoreleasePoolPop(v5);

  return v6;
}

- (uint64_t)_accessibilityVisibleFrame
{
  return objc_msgSend(a1, "_accessibilityVisibleFrame:", 1);
}

- (double)_accessibilityVisibleFrame:()AXPrivCategory
{
  __int128 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  id *v14;
  _QWORD *p_x;
  CGFloat v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double x;
  _QWORD v22[5];
  uint64_t v23;
  CGRect *v24;
  uint64_t v25;
  const char *v26;
  __int128 v27;
  __int128 v28;
  CGRect BoundingBox;
  CGRect v30;
  CGRect v31;

  v23 = 0;
  v24 = (CGRect *)&v23;
  v25 = 0x4010000000;
  v26 = "";
  v5 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v27 = *MEMORY[0x1E0C9D648];
  v28 = v5;
  objc_msgSend(a1, "accessibilityPath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    BoundingBox = CGPathGetBoundingBox((CGPathRef)objc_msgSend(objc_retainAutorelease(v6), "CGPath"));
  else
    objc_msgSend(a1, "_accessibilityContentFrame");
  v24[1] = BoundingBox;
  objc_msgSend(a1, "_accessibilityVisibleFrameClippingAncestor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "accessibilityFrame");
    v31.origin.x = v10;
    v31.origin.y = v11;
    v31.size.width = v12;
    v31.size.height = v13;
    v30 = CGRectIntersection(v24[1], v31);
    v24[1] = v30;
  }
  if (a3)
  {
    v14 = (id *)MEMORY[0x1E0CEB258];
    if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "_accessibilitySoftwareKeyboardCoversElement:", a1))
    {
      objc_msgSend(*v14, "_accessibilitySoftwareKeyboardAccessibilityFrame");
      AX_CGRectBySubtractingRect();
      p_x = (_QWORD *)&v24->origin.x;
      v24[1].origin.x = v16;
      p_x[5] = v17;
      p_x[6] = v18;
      p_x[7] = v19;
    }
  }
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __55__NSObject_AXPrivCategory___accessibilityVisibleFrame___block_invoke;
  v22[3] = &unk_1E3DFE4A0;
  v22[4] = &v23;
  objc_msgSend(a1, "_accessibilityIterateScrollParentsUsingBlock:includeSelf:", v22, 0);
  x = v24[1].origin.x;

  _Block_object_dispose(&v23, 8);
  return x;
}

- (double)_accessibilityConvertSystemBoundedScreenRectToContextSpace:()AXPrivCategory
{
  void *v3;
  double v4;

  objc_msgSend(a1, "_accessibilityWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    AXUIConvertRectFromScreenToContextSpace();
    a2 = v4;
  }

  return a2;
}

- (uint64_t)_accessibilityConvertSystemBoundedScreenPointToContextSpace:()AXPrivCategory
{
  return objc_msgSend(a1, "_accessibilityConvertSystemBoundedScreenRectToContextSpace:", a3, a4, 0.0, 0.0);
}

- (id)_accessibilityConvertSystemBoundedPathToContextSpace:()AXPrivCategory
{
  CGMutablePathRef Mutable;
  void *v5;
  uint64_t v7;

  if (a3)
  {
    objc_msgSend(objc_retainAutorelease(a3), "CGPath");
    Mutable = CGPathCreateMutable();
    v7 = MEMORY[0x1E0C809B0];
    AX_CGPathEnumerateElementsUsingBlock();
    objc_msgSend(MEMORY[0x1E0CEA390], "bezierPathWithCGPath:", Mutable, v7, 3221225472, __81__NSObject_AXPrivCategory___accessibilityConvertSystemBoundedPathToContextSpace___block_invoke, &unk_1E3DFEEE8, a1, Mutable);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (Mutable)
      CFRelease(Mutable);
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (double)_accessibilityDisplayRectForSceneReferenceRect:()AXPrivCategory
{
  double x;
  double y;
  CGFloat width;
  CGFloat height;
  double v10;
  double v11;
  double v12;
  double v13;
  double MaxX;
  double MaxY;
  double v16;
  double v17;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  v22 = CGRectStandardize(*(CGRect *)&a2);
  x = v22.origin.x;
  y = v22.origin.y;
  width = v22.size.width;
  height = v22.size.height;
  objc_msgSend(a1, "_accessibilityDisplayPointForSceneReferencePoint:");
  v11 = v10;
  v13 = v12;
  v23.origin.x = x;
  v23.origin.y = y;
  v23.size.width = width;
  v23.size.height = height;
  MaxX = CGRectGetMaxX(v23);
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  MaxY = CGRectGetMaxY(v24);
  objc_msgSend(a1, "_accessibilityDisplayPointForSceneReferencePoint:", MaxX, MaxY);
  if (v11 != x || v13 != y || v16 != MaxX || v17 != MaxY)
  {
    if (v11 >= v16)
      return v16;
    else
      return v11;
  }
  return x;
}

- (id)_accessibilityDisplayPathForScreenPath:()AXPrivCategory
{
  return UIAccessibilitySceneReferencePathForScreenPath(a3);
}

- (uint64_t)_accessibilityCirclePathBasedOnBoundsWidth
{
  return 0;
}

- (__n128)_accessibilityJailTransform
{
  __n128 *v1;
  __int128 v2;
  __n128 result;

  v1 = (__n128 *)MEMORY[0x1E0C9BAA8];
  v2 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)a1 = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)(a1 + 16) = v2;
  result = v1[2];
  *(__n128 *)(a1 + 32) = result;
  return result;
}

- (double)_accessibilityVisibleContentInset
{
  return *MEMORY[0x1E0CEB4B0];
}

- (double)_accessibilityContentSize
{
  return *MEMORY[0x1E0C9D820];
}

- (uint64_t)_accessibilityShouldUseFallbackForVisibleContentInset
{
  return 0;
}

- (uint64_t)_accessibilityOnlyComparesByXAxis
{
  return objc_msgSend(a1, "_accessibilityBoolValueForKey:", CFSTR("_accessibilityOnlyComparesByXAxis"));
}

- (uint64_t)_accessibilitySetOnlyComparesByXAxis:()AXPrivCategory
{
  return objc_msgSend(a1, "_accessibilitySetBoolValue:forKey:", a3, CFSTR("_accessibilityOnlyComparesByXAxis"));
}

- (uint64_t)_accessibilityScrollParentForComparingByXAxis
{
  return 0;
}

- (double)_accessibilityCompareFrameForScrollParent:()AXPrivCategory frame:fromOrientation:toOrientation:
{
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double x;
  double v16;
  double y;
  double v18;
  double width;
  double v20;
  double height;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  v10 = a4;
  if (v10)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v10, "visibleBounds");
      x = UIAccessibilityFrameForBounds(v10, v11, v12, v13, v14);
      y = v16;
      width = v18;
      height = v20;
      objc_msgSend(v10, "_accessibilityContentFrame");
      v23 = v22;
      v25 = v24;
      v27 = v26;
      v29 = v28;
      v32.origin.x = x;
      v32.origin.y = y;
      v32.size.width = width;
      v32.size.height = height;
      v35.origin.x = v23;
      v35.origin.y = v25;
      v35.size.width = v27;
      v35.size.height = v29;
      if (!CGRectContainsRect(v32, v35))
      {
LABEL_7:
        objc_msgSend(a1, "_handleRotatingFrame:fromOrientation:toOrientation:", a5, a6, x, y, width, height);
        a2 = v30;
        goto LABEL_8;
      }
      v33.origin.x = x;
      v33.origin.y = y;
      v33.size.width = width;
      v33.size.height = height;
      v36.origin.x = v23;
      v36.origin.y = v25;
      v36.size.width = v27;
      v36.size.height = v29;
      v34 = CGRectIntersection(v33, v36);
    }
    else
    {
      objc_msgSend(v10, "accessibilityFrame");
    }
    x = v34.origin.x;
    y = v34.origin.y;
    width = v34.size.width;
    height = v34.size.height;
    goto LABEL_7;
  }
LABEL_8:

  return a2;
}

- (void)_accessibilitySetSortPriority:()AXPrivCategory
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilitySetRetainedValue:forKey:", v2, CFSTR("AXSortPriority"));

}

- (uint64_t)_accessibilitySortPriority
{
  uint64_t v1;
  void *v2;
  void *v3;

  v1 = UIAccessibilityDefaultSortPriority;
  objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("AXSortPriority"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v1 = objc_msgSend(v2, "integerValue");

  return v1;
}

- (void)_accessibilitySetIsSortPriorityContainer:()AXPrivCategory
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilitySetRetainedValue:forKey:", v2, CFSTR("AXIsSortPriorityContainer"));

}

- (uint64_t)_accessibilityIsSortPriorityContainer
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("AXIsSortPriorityContainer"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "BOOLValue");
  else
    v3 = 0;

  return v3;
}

- (id)_accessibilitySortPriorityContainer
{
  void *v2;
  BOOL PossiblyNilObjectForKey;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  id v9;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p-_accessibilitySortPriorityContainer"), a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  PossiblyNilObjectForKey = _AXServerCacheGetPossiblyNilObjectForKey(v2, &v9);
  v4 = v9;
  if (!PossiblyNilObjectForKey)
  {
    v5 = a1;

    v4 = 0;
    if (v5)
    {
      do
      {
        if (objc_msgSend(v5, "_accessibilityIsSortPriorityContainer"))
        {
          v6 = v5;

          v4 = v6;
        }
        objc_msgSend(v5, "accessibilityContainer");
        v7 = objc_claimAutoreleasedReturnValue();

        v5 = (id)v7;
      }
      while (v7);
    }
    _AXServerCacheInsertPossiblyNilObjectForKey(v2, v4);
  }

  return v4;
}

- (uint64_t)_accessibilityOverridesInvalidFrames
{
  return 0;
}

- (uint64_t)_accessibilityIsFrameOutOfBounds
{
  return objc_msgSend(a1, "_accessibilityIsFrameOutOfBoundsConsideringScrollParents:", 1);
}

- (uint64_t)_accessibilityUseWindowBoundsForOutOfBoundsChecking
{
  return 0;
}

- (double)_axScreenBoundsForBoundsCheck
{
  void *v1;
  double v2;
  double v3;
  BOOL v4;
  uint64_t v5;
  void *v6;
  int v7;
  double v8;
  double v9;
  void *v10;
  double v11;

  objc_msgSend(a1, "_accessibilityWindow");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "frame");
  v4 = v3 == *MEMORY[0x1E0C9D538] && v2 == *(double *)(MEMORY[0x1E0C9D538] + 8);
  if (!v4 && (objc_msgSend(v1, "isKeyWindow") & 1) == 0)
  {
    objc_msgSend((id)*MEMORY[0x1E0CEB258], "keyWindow");
    v5 = objc_claimAutoreleasedReturnValue();

    v1 = (void *)v5;
  }
  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "_accessibilityUseWindowBoundsForOutOfBoundsChecking"))
  {

  }
  else
  {
    v7 = objc_msgSend(v1, "_accessibilityUseWindowBoundsForOutOfBoundsChecking");

    if (!v7)
    {
      objc_msgSend(v1, "screen");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "bounds");
      v9 = v11;

      goto LABEL_12;
    }
  }
  objc_msgSend(v1, "bounds");
  v9 = v8;
LABEL_12:

  return v9;
}

- (id)_axOutermostScrollParent
{
  id v3;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  if ((UIAccessibilityIsWidgetExtension() & 1) != 0)
    return 0;
  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__2;
  v9 = __Block_byref_object_dispose__2;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__NSObject_AXPrivCategory___axOutermostScrollParent__block_invoke;
  v4[3] = &unk_1E3DFE4A0;
  v4[4] = &v5;
  objc_msgSend(a1, "_accessibilityIterateScrollParentsUsingBlock:", v4);
  v3 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v3;
}

- (double)_axFrameForBoundsCheck:()AXPrivCategory
{
  double x;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  CGRect v14;

  objc_msgSend(a1, "accessibilityFrame");
  x = v14.origin.x;
  if (CGRectIsEmpty(v14))
    return *MEMORY[0x1E0C9D628];
  objc_msgSend(a1, "_accessibilityUIViewAccessibilityFrame");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "CGRectValue");
    x = v8;
  }
  if (a3)
  {
    objc_msgSend(a1, "_axOutermostScrollParent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v9, "_accessibilityUIViewAccessibilityFrame");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "CGRectValue");
        x = v11;

      }
      else
      {
        objc_msgSend(v9, "accessibilityFrame");
        x = v12;
      }
    }

  }
  return x;
}

- (uint64_t)_accessibilityIsFrameOutOfBoundsConsideringScrollParents:()AXPrivCategory
{
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p-_accessibilityIsFrameOutOfBoundsConsideringScrollParents"), a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)AXServerCache, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    if (!objc_msgSend(a1, "_accessibilityOverridesInvalidFrames"))
    {
      objc_msgSend(a1, "_axScreenBoundsForBoundsCheck");
      v10 = v9;
      v12 = v11;
      v14 = v13;
      v16 = v15;
      objc_msgSend(a1, "_axFrameForBoundsCheck:", a3);
      x = v42.origin.x;
      y = v42.origin.y;
      width = v42.size.width;
      height = v42.size.height;
      if (CGRectIsNull(v42))
        goto LABEL_7;
      v38 = v12;
      v40 = v10;
      v43.origin.x = v10;
      v43.origin.y = v12;
      v43.size.width = v14;
      v43.size.height = v16;
      v51.origin.x = x;
      v51.origin.y = y;
      v51.size.width = width;
      v51.size.height = height;
      v44 = CGRectIntersection(v43, v51);
      v22 = v44.size.width;
      if (v44.size.width < 1.0 || (v23 = v44.size.height, v44.size.height < 1.0))
      {
        objc_msgSend(a1, "_axOutermostScrollParent", v44.origin.x, v44.origin.y);
        v7 = (id)objc_claimAutoreleasedReturnValue();
        if (!v7)
          v7 = a1;
        objc_msgSend(v7, "_accessibilityHeaderElement");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (v29)
        {
          objc_msgSend(v7, "_accessibilityParentView");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "bounds");
          v52.origin.x = UIAccessibilityFrameForBounds(v30, v31, v32, v33, v34);
          v52.origin.y = v35;
          v52.size.width = v36;
          v52.size.height = v37;
          v49.origin.x = v40;
          v49.origin.y = v38;
          v49.size.width = v14;
          v49.size.height = v16;
          v50 = CGRectIntersection(v49, v52);
          if (v50.size.width > 0.0 && v50.size.height > 0.0)
          {
            objc_msgSend((id)AXServerCache, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], v5, v50.origin.x, v50.origin.y);

            v8 = 0;
            goto LABEL_3;
          }

        }
        objc_msgSend((id)AXServerCache, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v5);
        v8 = 1;
        goto LABEL_3;
      }
      v39 = v44.origin.y;
      v41 = v44.origin.x;
      if (objc_msgSend(a1, "isAccessibilityElement"))
      {
        v45.origin.x = x;
        v45.origin.y = y;
        v45.size.width = width;
        v45.size.height = height;
        v24 = CGRectGetWidth(v45);
        v46.origin.x = x;
        v46.origin.y = y;
        v46.size.width = width;
        v46.size.height = height;
        v25 = v24 * CGRectGetHeight(v46);
        v47.origin.x = v41;
        v47.origin.y = v39;
        v47.size.width = v22;
        v47.size.height = v23;
        v26 = CGRectGetWidth(v47);
        v48.origin.x = v41;
        v48.origin.y = v39;
        v48.size.width = v22;
        v48.size.height = v23;
        v27 = (v25 - v26 * CGRectGetHeight(v48)) / v25;
        objc_msgSend((id)*MEMORY[0x1E0CEB258], "_accessibilityMaximumAllowedOutOfBoundsPercent");
        if (v27 > v28)
        {
LABEL_7:
          objc_msgSend((id)AXServerCache, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v5);
          v8 = 1;
          goto LABEL_8;
        }
      }
    }
    objc_msgSend((id)AXServerCache, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], v5);
    v8 = 0;
    goto LABEL_8;
  }
  objc_msgSend((id)AXServerCache, "objectForKeyedSubscript:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");
LABEL_3:

LABEL_8:
  return v8;
}

- (uint64_t)_accessibilityFKAShouldBeProcessed
{
  return 1;
}

- (uint64_t)_accessibilityFKAShouldIncludeViewsAsElements
{
  return 0;
}

- (uint64_t)_accessibilitySetFocusRingTintColor:()AXPrivCategory
{
  return objc_msgSend(a1, "_accessibilitySetRetainedValue:forKey:", a3, CFSTR("AXFocusRingTintColor"));
}

- (uint64_t)_accessibilityFocusRingTintColor
{
  return objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("AXFocusRingTintColor"));
}

- (uint64_t)_accessibilityApplicationOrientation
{
  return (int)__UIAccessibilityGetAssociatedInt();
}

- (uint64_t)_accessibilitySetApplicationOrientation:()AXPrivCategory
{
  return __UIAccessibilitySetAssociatedInt();
}

- (uint64_t)accessibilityMenuActions
{
  return 0;
}

- (uint64_t)accessibilityEditOperationAction:()AXPrivCategory
{
  return 0;
}

- (uint64_t)_accessibilityBeginUndoableTextInsertion
{
  return 0;
}

- (uint64_t)_accessibilityEndUndoableTextInsertion
{
  return 0;
}

- (uint64_t)_accessibilityResetBannerTimer
{
  return 0;
}

- (uint64_t)accessibilityPerformCustomAction:()AXPrivCategory
{
  return 0;
}

- (uint64_t)_accessibilityPerformCustomActionWithIdentifier:()AXPrivCategory
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t (**v14)(_QWORD, _QWORD);
  uint64_t v15;
  void *v16;
  void *v17;
  objc_class *v18;
  objc_method *InstanceMethod;
  char *v20;
  char *v21;
  int v22;
  void *v23;
  int v24;
  void *v26;
  char v27;
  void *v28;
  uint64_t (*v29)(void *, uint64_t, void *);
  void *v30;
  unsigned int v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
LABEL_5:
    v6 = v5;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("CustomActionIdentifier"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  v6 = 0;
LABEL_7:
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  objc_msgSend(a1, "_accessibilityCustomActions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v33;
LABEL_9:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v33 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v11);
      if (objc_msgSend(v12, "_accessibilityMatchesCustomActionIdentifier:", v6))
        break;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        if (v9)
          goto LABEL_9;
        goto LABEL_24;
      }
    }
    objc_msgSend(v12, "actionHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v12, "actionHandler");
      v14 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v15 = ((uint64_t (**)(_QWORD, void *))v14)[2](v14, v12);
LABEL_18:

      goto LABEL_25;
    }
    objc_msgSend(v12, "target");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(v12, "target");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (objc_class *)objc_opt_class();
      InstanceMethod = class_getInstanceMethod(v18, (SEL)objc_msgSend(v12, "selector"));

      if (InstanceMethod)
      {
        objc_msgSend(v12, "target");
        v14 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v20 = method_copyReturnType(InstanceMethod);
        if (v20 && (v21 = v20, v22 = strcmp(v20, "B"), free(v21), !v22))
        {
          v24 = 0;
        }
        else
        {
          NSStringFromSelector((SEL)objc_msgSend(v12, "selector"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          NSLog(CFSTR("-[%@ %@] should return a BOOL to correctly implement UIAccessibilityCustomAction"), v14, v23);

          v24 = 1;
        }
        objc_msgSend(v12, "target");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "selector");
        v27 = objc_opt_respondsToSelector();

        if ((v27 & 1) != 0)
        {
          objc_msgSend(v12, "target");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = (uint64_t (*)(void *, uint64_t, void *))objc_msgSend(v28, "methodForSelector:", objc_msgSend(v12, "selector"));

          objc_msgSend(v12, "target");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = v29(v30, objc_msgSend(v12, "selector"), v12);

          v15 = v24 | v31;
        }
        else
        {
          v15 = 0;
        }
        goto LABEL_18;
      }
    }
  }
LABEL_24:
  v15 = 0;
LABEL_25:

  return v15;
}

- (uint64_t)_accessibilityBoundaryEdges
{
  return 0;
}

- (uint64_t)_accessibilityDigitalCrownScrollAmount
{
  return 75;
}

- (uint64_t)accessibilityZoomInAtPoint:()AXPrivCategory
{
  void *v5;
  uint64_t v6;

  objc_msgSend(a1, "accessibilityContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "accessibilityZoomInAtPoint:", a2, a3);

  return v6;
}

- (uint64_t)accessibilityZoomOutAtPoint:()AXPrivCategory
{
  void *v5;
  uint64_t v6;

  objc_msgSend(a1, "accessibilityContainer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "accessibilityZoomOutAtPoint:", a2, a3);

  return v6;
}

- (void)accessibilityIncreaseTrackingDetail
{
  id v1;

  objc_msgSend(a1, "accessibilityContainer");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "accessibilityIncreaseTrackingDetail");

}

- (void)accessibilityDecreaseTrackingDetail
{
  id v1;

  objc_msgSend(a1, "accessibilityContainer");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "accessibilityDecreaseTrackingDetail");

}

- (uint64_t)_accessibilityTextOperationAction:()AXPrivCategory
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a1, "_accessibilityTextViewTextOperationResponder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "accessibilityEditOperationAction:", v4) & 1) == 0)
  {
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CF45A0]))
    {
      objc_msgSend(a1, "_accessibilityCopy");
    }
    else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CF45F0]))
    {
      objc_msgSend(a1, "_accessibilityScanText");
    }
    else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CF45A8]))
    {
      objc_msgSend(a1, "_accessibilityCut");
    }
    else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CF45D8]))
    {
      objc_msgSend(a1, "_accessibilityPaste");
    }
    else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CF4600]))
    {
      objc_msgSend(a1, "_accessibilitySelectAll");
    }
    else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CF45D0]))
    {
      objc_msgSend(a1, "_accessibilityMoveUp");
    }
    else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CF45C8]))
    {
      objc_msgSend(a1, "_accessibilityMoveDown");
    }
    else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CF45F8]))
    {
      objc_msgSend(a1, "_accessibilitySelect");
    }
    else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CF45B8]))
    {
      objc_msgSend(a1, "_accessibilityDelete");
    }
    else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CF45E8]))
    {
      objc_msgSend(a1, "_accessibilityReplace");
    }
    else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CF45B0]))
    {
      objc_msgSend(a1, "_accessibilityDefine");
    }
    else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CF4608]))
    {
      objc_msgSend(a1, "_accessibilityShare");
    }
    else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CF4628]))
    {
      objc_msgSend(a1, "_accessibilityUnderline");
    }
    else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CF4598]))
    {
      objc_msgSend(a1, "_accessibilityBold");
    }
    else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CF45C0]))
    {
      objc_msgSend(a1, "_accessibilityItalic");
    }
    else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CF4630]))
    {
      objc_msgSend(a1, "_accessibilityUndo");
    }
    else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CF45E0]))
    {
      objc_msgSend(a1, "_accessibilityRedo");
    }
    else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CF4610]))
    {
      objc_msgSend(a1, "_accessibilitySpeak");
    }
    else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CF4618]))
    {
      objc_msgSend(a1, "_accessibilitySpeakSentence");
    }
    else
    {
      if (!objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CF4620]))
      {
        v6 = 0;
        goto LABEL_43;
      }
      objc_msgSend(a1, "_accessibilitySpeakSpellOut");
    }
  }
  v6 = 1;
LABEL_43:

  return v6;
}

- (uint64_t)_accessibilityAuthenticatedPasteWithValue:()AXPrivCategory
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v9;

  v4 = (void *)MEMORY[0x1E0CB3710];
  v5 = a3;
  objc_msgSend(v4, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v6;
  v7 = v6;
  AXPerformSafeBlock();
  objc_msgSend(a1, "_accessibilityPaste");

  return 1;
}

- (void)_accessibilityShowKeyboard
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CEA6E8], "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "showKeyboardWithoutSuppressionPolicy");

}

- (void)_accessibilityHideKeyboard
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CEA6E8], "sharedInstance");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CEA6E8], "sharedInstance");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "hideKeyboard");

  }
}

- (id)_accessibilityCustomRotorResultHelper:()AXPrivCategory array:
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  id v19;
  void *v20;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "currentItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "targetElement");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    objc_msgSend(v6, "currentItem");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "targetElement");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v5, "indexOfObject:", v11);

    if (v12 == 0x7FFFFFFFFFFFFFFFLL)
      v13 = -1;
    else
      v13 = v12;
    v14 = objc_msgSend(v6, "searchDirection");

    if (v14 != 1)
    {
      if (v13 != -1)
      {
LABEL_12:
        v16 = v13 - 1;
        goto LABEL_13;
      }
LABEL_11:
      v13 = objc_msgSend(v5, "count");
      goto LABEL_12;
    }
  }
  else
  {

    v15 = objc_msgSend(v6, "searchDirection");
    if (v15 != 1)
      goto LABEL_11;
    v13 = -1;
  }
  v16 = v13 + 1;
LABEL_13:
  v17 = objc_msgSend(v5, "count");
  v18 = 0;
  if ((v16 & 0x8000000000000000) == 0 && v16 < v17)
  {
    v19 = objc_alloc(MEMORY[0x1E0CEA290]);
    objc_msgSend(v5, "objectAtIndexedSubscript:", v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v19, "initWithTargetElement:targetRange:", v20, 0);

  }
  return v18;
}

- (uint64_t)_accessibilityPerformEscape
{
  objc_class *v2;
  id v3;
  void *v4;
  objc_class *v5;
  uint64_t isKindOfClass;
  uint64_t v7;
  _BOOL8 v8;
  uint64_t v9;

  if (!_accessibilityPerformEscape_BaseNSObjectMethod)
  {
    v2 = (objc_class *)objc_opt_class();
    _accessibilityPerformEscape_BaseNSObjectMethod = (uint64_t)class_getInstanceMethod(v2, sel_accessibilityPerformEscape);
  }
  v3 = a1;
  if (!v3)
    return objc_msgSend((id)*MEMORY[0x1E0CEB258], "accessibilityPerformEscape");
  v4 = v3;
  while (1)
  {
    v5 = (objc_class *)objc_opt_class();
    if (class_getInstanceMethod(v5, sel_accessibilityPerformEscape) != (Method)_accessibilityPerformEscape_BaseNSObjectMethod
      && (objc_msgSend(v4, "accessibilityPerformEscape") & 1) != 0)
    {
      break;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (!_accessibilityPerformEscape_AXUIViewControllerClass)
        _accessibilityPerformEscape_AXUIViewControllerClass = (uint64_t)NSClassFromString(CFSTR("UIViewController"));
      NSClassFromString(CFSTR("UILayoutContainerView"));
      isKindOfClass = objc_opt_isKindOfClass();
      if ((isKindOfClass & 1) != 0)
      {
        v7 = __55__NSObject_AXPrivCategory___accessibilityPerformEscape__block_invoke_3(isKindOfClass, v4);
        if ((v7 & 1) != 0 || __55__NSObject_AXPrivCategory___accessibilityPerformEscape__block_invoke(v7, v4))
          break;
      }
      else
      {
        v8 = __55__NSObject_AXPrivCategory___accessibilityPerformEscape__block_invoke(isKindOfClass, v4);
        if (v8 || (__55__NSObject_AXPrivCategory___accessibilityPerformEscape__block_invoke_3(v8, v4) & 1) != 0)
          break;
      }
    }
    objc_msgSend(v4, "accessibilityContainer");
    v9 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v9;
    if (!v9)
      return objc_msgSend((id)*MEMORY[0x1E0CEB258], "accessibilityPerformEscape");
  }

  return 1;
}

- (id)_accessibilityTextOperations
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "_accessibilityTextViewTextOperationResponder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 == a1)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v2, "_accessibilityTextOperations");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

- (uint64_t)_accessibilityHasTextOperations
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a1, "_accessibilityTextViewTextOperationResponder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 == a1)
  {
    objc_msgSend(a1, "_accessibilityTextOperations");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "count") != 0;

  }
  else
  {
    v4 = objc_msgSend(v2, "_accessibilityHasTextOperations");
  }

  return v4;
}

- (uint64_t)_accessibilityPerformOrbGesture:()AXPrivCategory
{
  uint64_t v2;
  void (*v3)(void);
  void *v4;
  const void *v5;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGRect v11;
  CGRect v12;

  if ((objc_msgSend(a1, "_accessibilityBasePerformOrbGesture:") & 1) != 0)
    return 1;
  if (__AXRuntimeApplicationElement())
  {
    v3 = (void (*)(void))__AXRuntimeApplicationElement();
    v3();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (const void *)_AXCreateAXUIElementWithElement();

  }
  else
  {
    v5 = (const void *)_AXCreateAXUIElementWithElement();
  }
  AXDeviceGetMainScreenBounds();
  x = v11.origin.x;
  y = v11.origin.y;
  width = v11.size.width;
  height = v11.size.height;
  CGRectGetMidX(v11);
  v12.origin.x = x;
  v12.origin.y = y;
  v12.size.width = width;
  v12.size.height = height;
  CGRectGetMidY(v12);
  objc_msgSend(a1, "_accessibilityDisplayId");
  _AXUIElementCopyElementAtPositionWithParams();
  v2 = 0;
  if (v5)
    CFRelease(v5);
  return v2;
}

- (uint64_t)_accessibilityBasePerformOrbGesture:()AXPrivCategory
{
  uint64_t v4;
  void *v5;
  char v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_accessibilityParentView");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = 0;
    do
    {
      if (objc_msgSend(v5, "isUserInteractionEnabled"))
      {
        objc_msgSend(v5, "gestureRecognizers");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 0u;
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v8)
        {
          v9 = v8;
          v10 = *(_QWORD *)v16;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v16 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
              if (objc_msgSend(v12, "isEnabled") && (objc_opt_respondsToSelector() & 1) != 0)
              {
                objc_msgSend(v12, "_accessibilitySimulateOrbGestureWithState:", a3);
                v6 = 1;
              }
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
          }
          while (v9);
        }

      }
      objc_msgSend(v5, "superview");
      v13 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v13;
    }
    while (v13);
  }
  else
  {
    v6 = 0;
  }
  return v6 & 1;
}

- (uint64_t)_accessibilityCameraIrisOpen
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, CFSTR("__ax_camera_iris_open"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (void)_accessibilitySetCameraIrisOpen:()AXPrivCategory
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, CFSTR("__ax_camera_iris_open"), v2, (void *)1);

}

- (uint64_t)_accessibilityIsTourGuideRunning
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, CFSTR("__ax_is_tour_guide_running"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  return v2;
}

- (uint64_t)_accessibilityMapsExplorationIsActive
{
  return 0;
}

- (uint64_t)_accessibilityMapsExplorationIsPending
{
  return 0;
}

- (void)_accessibilitySetIsTourGuideRunning:()AXPrivCategory
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, CFSTR("__ax_is_tour_guide_running"), v2, (void *)1);

}

- (void)_accessibilityPlaySystemSound:()AXPrivCategory
{
  AudioServicesPlaySystemSoundWithCompletion(inSystemSoundID, 0);
}

- (uint64_t)_accessibilityPlayKeyboardClickSound
{
  uint64_t result;

  result = UIAccessibilityIsVoiceOverRunning();
  if ((_DWORD)result)
    return objc_msgSend(a1, "_accessibilityPlaySystemSound:", 1104);
  return result;
}

- (uint64_t)_accessibilityLoadAccessibilityInformationSupplementaryItems
{
  return 0;
}

- (uint64_t)_accessibilityShouldReleaseAfterUnregistration
{
  return 0;
}

- (uint64_t)accessibilityElementIsFocused
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend((id)__UIAccessibilityFocusedElements, "allValues", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        if (*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v6) == a1)
        {
          v7 = 1;
          goto LABEL_11;
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v4)
        continue;
      break;
    }
  }
  v7 = 0;
LABEL_11:

  return v7;
}

- (id)accessibilityAssistiveTechnologyFocusedIdentifiers
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend((id)__UIAccessibilityFocusedElements, "allKeys", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v2);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend((id)__UIAccessibilityFocusedElements, "objectForKeyedSubscript:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9 == a1)
        {
          if (!v5)
          {
            objc_msgSend(MEMORY[0x1E0C99E20], "set");
            v5 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v5, "addObject:", v8);
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  v10 = (void *)objc_msgSend(v5, "copy");
  return v10;
}

- (BOOL)_accessibilityAnimationsInProgress
{
  return _AXAnimationsInProgressCount > 0;
}

- (void)_accessibilityDetectAnimationsNonActive
{
  if ((objc_msgSend(a1, "_accessibilityAnimationsInProgress") & 1) != 0)
    _AXAnimationsCompletedShouldNotify = 1;
  else
    UIAccessibilityPostNotification(0xFA2u, &unk_1E3E10E20);
}

- (double)accessibilityBoundsForTextMarkers:()AXPrivCategory
{
  return *MEMORY[0x1E0C9D648];
}

- (uint64_t)accessibilityStringForTextMarkers:()AXPrivCategory
{
  return 0;
}

- (uint64_t)accessibilityArrayOfTextForTextMarkers:()AXPrivCategory
{
  return 0;
}

- (uint64_t)_accessibilityObjectForTextMarker:()AXPrivCategory
{
  return 0;
}

- (uint64_t)_accessibilityLineRangeForPosition:()AXPrivCategory
{
  return 0x7FFFFFFFLL;
}

- (uint64_t)_accessibilityCharacterRangeForPosition:()AXPrivCategory
{
  return 0x7FFFFFFFLL;
}

- (uint64_t)_accessibilityPositionInDirection:()AXPrivCategory offset:forPosition:
{
  return 0x7FFFFFFFLL;
}

- (uint64_t)accessibilityContentForLineNumber:()AXPrivCategory
{
  return 0;
}

- (double)accessibilityFrameForLineNumber:()AXPrivCategory
{
  return *MEMORY[0x1E0C9D648];
}

- (double)_accessibilityFrameForRange:()AXPrivCategory
{
  return *MEMORY[0x1E0C9D648];
}

- (uint64_t)_accessibilityRangeForLineNumber:()AXPrivCategory
{
  return 0x7FFFFFFFLL;
}

- (uint64_t)_accessibilityDataDetectorScheme:()AXPrivCategory
{
  return 0;
}

- (uint64_t)_accessibilityActivateTextViewLink:()AXPrivCategory
{
  return 0;
}

- (uint64_t)_accessibilityTriggerDictationFromPath:()AXPrivCategory
{
  return 0;
}

- (void)_accessibilitySetSelectedTextRange:()AXPrivCategory
{
  objc_class *v7;
  objc_class *v8;
  Method InstanceMethod;
  void *v10;
  id v11;

  if (!_accessibilitySetSelectedTextRange__BaseFrameForBrowserRangeMethod)
  {
    v7 = (objc_class *)objc_opt_class();
    _accessibilitySetSelectedTextRange__BaseFrameForBrowserRangeMethod = (uint64_t)class_getInstanceMethod(v7, sel_browserAccessibilitySetSelectedTextRange_);
  }
  v8 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v8, sel_browserAccessibilitySetSelectedTextRange_);
  if ((objc_opt_respondsToSelector() & 1) == 0
    || InstanceMethod == (Method)_accessibilitySetSelectedTextRange__BaseFrameForBrowserRangeMethod)
  {
    objc_msgSend(a1, "_accessibilityTextViewTextOperationResponder");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      if (v10 != a1)
      {
        v11 = v10;
        objc_msgSend(v10, "_accessibilitySetSelectedTextRange:", a3, a4);
        v10 = v11;
      }
    }

  }
  else
  {
    objc_msgSend(a1, "browserAccessibilitySetSelectedTextRange:", a3, a4);
  }
}

- (uint64_t)_accessibilitySelectedTextRange
{
  objc_class *v2;
  objc_class *v3;
  Method InstanceMethod;
  void *v6;
  void *v7;
  uint64_t v8;

  if (!_accessibilitySelectedTextRange_BaseFrameForBrowserRangeMethod)
  {
    v2 = (objc_class *)objc_opt_class();
    _accessibilitySelectedTextRange_BaseFrameForBrowserRangeMethod = (uint64_t)class_getInstanceMethod(v2, sel_browserAccessibilitySelectedTextRange);
  }
  v3 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v3, sel_browserAccessibilitySelectedTextRange);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && InstanceMethod != (Method)_accessibilitySelectedTextRange_BaseFrameForBrowserRangeMethod)
  {
    return objc_msgSend(a1, "safeRangeForKey:", CFSTR("browserAccessibilitySelectedTextRange"));
  }
  objc_msgSend(a1, "_accessibilityTextViewTextOperationResponder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  v8 = 0x7FFFFFFFLL;
  if (v6)
  {
    if (v6 != a1)
      v8 = objc_msgSend(v6, "_accessibilitySelectedTextRange");
  }

  return v8;
}

- (uint64_t)_accessibilityVisibleTextRange
{
  return 0x7FFFFFFFLL;
}

- (uint64_t)_accessibilityLineEndPosition
{
  return 0x7FFFFFFFLL;
}

- (uint64_t)_accessibilityLineStartPosition
{
  return 0x7FFFFFFFLL;
}

- (uint64_t)_accessibilityLineNumberAndColumnForPoint:()AXPrivCategory
{
  return 0;
}

- (uint64_t)_accessibilityRangeForLineNumberAndColumn:()AXPrivCategory
{
  return 0x7FFFFFFFLL;
}

- (double)_accessibilityBoundsForRange:()AXPrivCategory
{
  return *MEMORY[0x1E0C9D648];
}

- (uint64_t)_accessibilityLineStartMarker:()AXPrivCategory
{
  return 0;
}

- (uint64_t)_accessibilityMarkerForPoint:()AXPrivCategory
{
  return 0;
}

- (uint64_t)_accessibilityLineEndMarker:()AXPrivCategory
{
  return 0;
}

- (uint64_t)_accessibilityElementStoredUserLabel
{
  return 0;
}

- (uint64_t)_accessibiltyAvailableKeyplanes
{
  return 0;
}

- (uint64_t)_accessibilityNextMarker:()AXPrivCategory
{
  return 0;
}

- (uint64_t)_accessibilityPreviousMarker:()AXPrivCategory
{
  return 0;
}

- (uint64_t)_accessibilityTextMarkerRange
{
  return 0;
}

- (uint64_t)_accessibilityPageTextMarkerRange
{
  return 0;
}

- (uint64_t)_accessibilityFilenameForAttachmentCID:()AXPrivCategory
{
  return 0;
}

- (uint64_t)_accessibilityRangeForTextMarker:()AXPrivCategory
{
  return 0x7FFFFFFFLL;
}

- (uint64_t)_accessibilityRangeForTextMarkers:()AXPrivCategory
{
  return 0x7FFFFFFFLL;
}

- (uint64_t)_accessibilityTextMarkerRangeForSelection
{
  return 0;
}

- (uint64_t)_accessibilitySelectedNSRangeForObject
{
  return 0x7FFFFFFFLL;
}

- (uint64_t)_accessibilityTextMarkerForPosition:()AXPrivCategory
{
  return 0;
}

- (uint64_t)_accessibilityDOMAttributes
{
  return 0;
}

- (uint64_t)_accessibilityReadAllContinuesWithScroll
{
  return 0;
}

- (double)_accessibilityVisibleScrollArea:()AXPrivCategory
{
  return 2147483650.0;
}

- (uint64_t)accessibilityPageContent
{
  return 0;
}

- (uint64_t)accessibilityLineNumberForPoint:()AXPrivCategory
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (uint64_t)_accessibilityIncludeDuringContentReading
{
  return 0;
}

- (uint64_t)_accessibilityPageContent
{
  return 0;
}

- (uint64_t)_accessibilityShouldAnnounceFontInfo
{
  return 1;
}

- (uint64_t)_accessibilityKeyboardKeyAllowsTouchTyping
{
  return 0;
}

- (uint64_t)_accessibilityBookShowsDualPages
{
  return 0;
}

- (uint64_t)_accessibilityKeyboardSupportsGestureMode
{
  return 0;
}

- (uint64_t)accessibilityImageOverlayElements
{
  return 0;
}

- (id)_accessibilityPhotoDescription
{
  return objc_getAssociatedObject(a1, &AXPhotoDesc);
}

- (void)_setAccessibilityPhotoDescription:()AXPrivCategory
{
  objc_setAssociatedObject(a1, &AXPhotoDesc, a3, (void *)1);
}

- (double)_accessibilityTextCursorFrame
{
  uint64_t v2;
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v2 = objc_msgSend(a1, "accessibilityTraits");
  if ((*MEMORY[0x1E0CF44C0] & ~v2) != 0)
    return *MEMORY[0x1E0C9D648];
  if (!objc_msgSend(a1, "conformsToProtocol:", &unk_1EE4B3860))
    return *MEMORY[0x1E0C9D648];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return *MEMORY[0x1E0C9D648];
  v3 = a1;
  objc_msgSend(v3, "selectedTextRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstRectForRange:", v4);
  v9 = UIAccessibilityFrameForBounds(v3, v5, v6, v7, v8);

  return v9;
}

- (double)_accessibilityKeyboardFrame
{
  double result;

  if (!AXUIKeyboardIsOnScreen())
    return *MEMORY[0x1E0C9D648];
  AXUIKeyboardScreenFrame();
  return result;
}

- (__CFString)accessibilityLabelForRange:()AXPrivCategory
{
  void *v4;
  const __CFString *v5;
  __CFString *v6;
  NSRange v7;
  __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  NSRange v11;
  NSRange v13;
  NSRange v14;

  objc_msgSend(a1, "_accessibilityPotentiallyAttributedValueForNonAttributedSelector:attributedSelector:", sel_accessibilityLabel, sel_accessibilityAttributedLabel);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = (__CFString *)v5;
      if (a3)
      {
        v13.length = CFStringGetLength(v5);
        v13.location = 0;
        v7 = NSIntersectionRange(*a3, v13);
        if (v7.length)
        {
          -[__CFString substringWithRange:](v6, "substringWithRange:", v7.location, v7.length);
          v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_13:
          v9 = v8;
LABEL_15:

          goto LABEL_16;
        }
        goto LABEL_14;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        _AXAssert();
      v10 = v4;
      v6 = v10;
      if (a3)
      {
        v14.length = -[__CFString length](v10, "length");
        v14.location = 0;
        v11 = NSIntersectionRange(*a3, v14);
        if (v11.length)
        {
          -[__CFString attributedSubstringFromRange:](v6, "attributedSubstringFromRange:", v11.location, v11.length);
          v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_13;
        }
LABEL_14:
        v9 = 0;
        goto LABEL_15;
      }
    }
    v8 = v6;
    goto LABEL_13;
  }
  v9 = 0;
LABEL_16:

  return v9;
}

- (id)_accessibilityMarkersForPoints:()AXPrivCategory
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "pointValue", (_QWORD)v13);
        objc_msgSend(a1, "_accessibilityMarkerForPoint:");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_accessibilityMarkersForRange:()AXPrivCategory
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilityTextMarkerForPosition:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v7, "addObject:", v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v9);

  }
  objc_msgSend(a1, "_accessibilityTextMarkerForPosition:", a3 + a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v7, "addObject:", v10);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v11);

  }
  return v7;
}

- (id)_accessibilityMarkerLineEndsForMarkers:()AXPrivCategory
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(a1, "_accessibilityLineEndMarker:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (uint64_t)_accessibilitySupportsReadingContent
{
  return 0;
}

- (uint64_t)_accessibilityReadAllOnFocus
{
  return 0;
}

- (uint64_t)__accessibilityReadAllOnFocus
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v1 = a1;
  if (!v1)
    return 0;
  v2 = v1;
  do
  {
    v3 = objc_msgSend(v2, "_accessibilityReadAllOnFocus");
    if ((v3 & 1) != 0)
      break;
    objc_msgSend(v2, "accessibilityContainer");
    v4 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v4;
  }
  while (v4);

  return v3;
}

- (id)_accessibilityValueForRange:()AXPrivCategory
{
  objc_class *v5;
  objc_class *v6;
  Method InstanceMethod;
  Method v8;
  void *length;
  void *v10;
  void *v11;
  NSRange v12;
  id v13;
  NSRange v15;

  if (!_accessibilityValueForRange__BaseFrameForBrowserRangeMethod)
  {
    v5 = (objc_class *)objc_opt_class();
    _accessibilityValueForRange__BaseFrameForBrowserRangeMethod = (uint64_t)class_getInstanceMethod(v5, sel_browserAccessibilityValueInRange_);
  }
  v6 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v6, sel_browserAccessibilityValueInRange_);
  if (!a3
    || (v8 = InstanceMethod, (objc_opt_respondsToSelector() & 1) == 0)
    || v8 == (Method)_accessibilityValueForRange__BaseFrameForBrowserRangeMethod)
  {
    objc_msgSend(a1, "_accessibilityAXAttributedValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (a3 && v10)
    {
      v15.length = objc_msgSend(v10, "length");
      v15.location = 0;
      v12 = NSIntersectionRange(*a3, v15);
      length = (void *)v12.length;
      if (!v12.length)
      {
LABEL_16:

        return length;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v11, "attributedSubstringFromRange:", v12.location, v12.length);
      else
        objc_msgSend(v11, "substringWithRange:", v12.location, v12.length);
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = v10;
    }
    length = v13;
    goto LABEL_16;
  }
  objc_msgSend(a1, "browserAccessibilityValueInRange:", a3->location, a3->length);
  length = (void *)objc_claimAutoreleasedReturnValue();
  return length;
}

- (uint64_t)_accessibilitySupportsFrameForRange
{
  uint64_t result;
  objc_class *v2;
  objc_class *v3;

  result = objc_msgSend(a1, "conformsToProtocol:", &unk_1EE4C0728);
  if ((_DWORD)result)
  {
    if (!_accessibilitySupportsFrameForRange_BaseFrameForRangeMethod)
    {
      v2 = (objc_class *)objc_opt_class();
      _accessibilitySupportsFrameForRange_BaseFrameForRangeMethod = (uint64_t)class_getInstanceMethod(v2, sel__accessibilityFrameForRange_);
    }
    v3 = (objc_class *)objc_opt_class();
    return _accessibilitySupportsFrameForRange_BaseFrameForRangeMethod != (_QWORD)class_getInstanceMethod(v3, sel__accessibilityFrameForRange_);
  }
  return result;
}

- (BOOL)_accessibilitySupportsRangeForLineNumber
{
  objc_class *v0;
  objc_class *v1;

  if (!_accessibilitySupportsRangeForLineNumber_BaseRangeForLineNumberMethod)
  {
    v0 = (objc_class *)objc_opt_class();
    _accessibilitySupportsRangeForLineNumber_BaseRangeForLineNumberMethod = (uint64_t)class_getInstanceMethod(v0, sel__accessibilityRangeForLineNumber_);
  }
  v1 = (objc_class *)objc_opt_class();
  return _accessibilitySupportsRangeForLineNumber_BaseRangeForLineNumberMethod != (_QWORD)class_getInstanceMethod(v1, sel__accessibilityRangeForLineNumber_);
}

+ (id)_accessibilityTextChecker
{
  void *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = (void *)_AXTextChecker;
  if (!_AXTextChecker)
  {
    v1 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEAAA8]), "_initWithAsynchronousLoading:", 1);
    v2 = (void *)_AXTextChecker;
    _AXTextChecker = v1;

    v0 = (void *)_AXTextChecker;
  }
  if (objc_msgSend(v0, "_doneLoading"))
    v3 = (id)_AXTextChecker;
  else
    v3 = 0;
  return v3;
}

- (uint64_t)_accessibilityTextChecker
{
  return objc_msgSend(MEMORY[0x1E0DE7910], "_accessibilityTextChecker");
}

- (uint64_t)_accessibilityTextViewIgnoresValueChanges
{
  return objc_msgSend(a1, "_accessibilityBoolValueForKey:", CFSTR("_accessibilitySetTextViewIgnoresValueChanges"));
}

- (uint64_t)_accessibilitySetTextViewIgnoresValueChanges:()AXPrivCategory
{
  return objc_msgSend(a1, "_accessibilitySetBoolValue:forKey:", a3, CFSTR("_accessibilitySetTextViewIgnoresValueChanges"));
}

- (void)_accessibilitySetTextViewShouldBreakUpParagraphs:()AXPrivCategory
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilitySetValue:forKey:storageMode:", v2, CFSTR("AXTextViewBreakUpParagraphs"), 0);

}

- (uint64_t)_accessibilityTextViewShouldBreakUpParagraphs
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("AXTextViewBreakUpParagraphs"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "BOOLValue");
  else
    v3 = 1;

  return v3;
}

- (uint64_t)_accessibilityActivateParagraphInTextViewRange:()AXPrivCategory
{
  uint64_t v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a1, "_accessibilityGetBlockForAttribute:", 24);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6)
    v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 16))(v6, a3, a4);
  else
    v8 = 0;

  return v8;
}

- (void)_accessibilitySetIncreaseLayoutBounds:()AXPrivCategory
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilitySetValue:forKey:storageMode:", v2, CFSTR("AXIncreaseLayoutBounds"), 0);

}

- (uint64_t)_accessibilityIncreaseLayoutBounds
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("AXIncreaseLayoutBounds"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "BOOLValue");
  else
    v3 = 1;

  return v3;
}

- (void)_accessibilitySetValue:()AXPrivCategory
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(a1, "_accessibilityTextViewTextOperationResponder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v4, "setText:", v5);
  }

}

- (void)_accessibilityConvertStyleAttributesToAccessibility:()AXPrivCategory
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  v5 = objc_msgSend(v3, "length");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __80__NSObject_AXPrivCategory___accessibilityConvertStyleAttributesToAccessibility___block_invoke;
  v7[3] = &unk_1E3DFDE50;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v3, "enumerateAttributesInRange:options:usingBlock:", 0, v5, 0, v7);
  objc_msgSend(v3, "setAttributedString:", v6);

}

- (double)_accessibilityNavigationControllerInset
{
  return *MEMORY[0x1E0CEB4B0];
}

- (void)_accessibilityAddAutoCorrectionAttributes:()AXPrivCategory
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t i;
  NSRange v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CEA6E8], "activeInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("_textChoicesAssistant"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "safeValueForKey:", CFSTR("underlinedWordData"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    v10 = *MEMORY[0x1E0C9AE50];
    v11 = (_QWORD *)MEMORY[0x1E0CF42A0];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v13 = NSRangeFromString((NSString *)*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i));
        if (v13.location + v13.length < objc_msgSend(v3, "length"))
          objc_msgSend(v3, "addAttribute:value:range:", *v11, v10, v13.location, v13.length);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

}

- (void)_accessibilityAddMispellingsToAttributedString:()AXPrivCategory
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSUInteger v10;
  void *v11;
  NSUInteger v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSUInteger v16;
  NSUInteger v17;
  NSUInteger v18;
  NSRange v19;
  id v20;
  NSRange v21;
  NSRange v22;

  v20 = a3;
  if (v20)
  {
    v4 = a1;
    NSClassFromString(CFSTR("UIAccessibilityTextFieldElement"));
    v5 = v4;
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "accessibilityContainer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    if ((objc_opt_respondsToSelector() & 1) == 0 || objc_msgSend(v5, "spellCheckingType") != 1)
    {
      if (AXRequestingClient() == 3)
      {
        v6 = *MEMORY[0x1E0CF42A8];
        v7 = objc_msgSend(v20, "length");
        objc_msgSend(v20, "addAttribute:value:range:", v6, MEMORY[0x1E0C9AAB0], 0, v7);
      }
      else
      {
        objc_msgSend(v4, "_accessibilityTextChecker");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
        {
          objc_msgSend(v20, "string");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "length");
          objc_msgSend(MEMORY[0x1E0CEA6F8], "sharedInputModeController");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = 0;
          v13 = *MEMORY[0x1E0C9AE50];
          while (1)
          {
            objc_msgSend(v11, "currentInputMode");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v14)
            {
              objc_msgSend(v11, "currentSystemInputMode");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(v14, "primaryLanguage");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v8, "rangeOfMisspelledWordInString:range:startingAt:wrap:language:", v9, 0, v10, v12, 0, v15);
            v18 = v17;

            if (v16 == 0x7FFFFFFFFFFFFFFFLL)
              break;
            v21.location = 0;
            v21.length = v10;
            v22.location = v16;
            v22.length = v18;
            v19 = NSIntersectionRange(v21, v22);
            objc_msgSend(v20, "addAttribute:value:range:", *MEMORY[0x1E0CF4238], v13, v19.location, v19.length);
            v12 = v16 + v18;

            if (v12 >= v10)
              goto LABEL_16;
          }

LABEL_16:
        }

      }
    }

  }
}

- (id)_accessibilityAttributedValueForRange:()AXPrivCategory
{
  objc_class *v5;
  objc_class *v6;
  Method InstanceMethod;
  Method v8;
  id v9;
  void *v10;
  uint64_t v11;

  if (!_accessibilityAttributedValueForRange__BaseFrameForBrowserRangeMethod)
  {
    v5 = (objc_class *)objc_opt_class();
    _accessibilityAttributedValueForRange__BaseFrameForBrowserRangeMethod = (uint64_t)class_getInstanceMethod(v5, sel_browserAccessibilityAttributedValueInRange_);
  }
  v6 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v6, sel_browserAccessibilityAttributedValueInRange_);
  if (!a3
    || (v8 = InstanceMethod, (objc_opt_respondsToSelector() & 1) == 0)
    || v8 == (Method)_accessibilityAttributedValueForRange__BaseFrameForBrowserRangeMethod)
  {
    objc_msgSend(a1, "_accessibilityValueForRange:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v10, "length"))
    {
      v9 = objc_alloc_init(MEMORY[0x1E0CB3498]);
LABEL_17:

      return v9;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = objc_msgSend((id)objc_msgSend(v10, "cfAttributedString"), "mutableCopy");
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v11 = objc_msgSend(v10, "mutableCopyWithZone:", 0);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v9 = 0;
          goto LABEL_16;
        }
        v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3778]), "initWithString:", v10);
      }
    }
    v9 = (id)v11;
LABEL_16:
    objc_msgSend(a1, "_accessibilityAddAutoCorrectionAttributes:", v9);
    objc_msgSend(a1, "_accessibilityConvertStyleAttributesToAccessibility:", v9);
    objc_msgSend(a1, "_accessibilityAddMispellingsToAttributedString:", v9);
    goto LABEL_17;
  }
  objc_msgSend(a1, "browserAccessibilityAttributedValueInRange:", *a3, a3[1]);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  return v9;
}

- (uint64_t)_accessibilityTextInputProxiesForRealTextView
{
  return 1;
}

- (void)_accessibilityPostValueChangedNotificationWithChangeType:()AXPrivCategory insertedText:keyInputDelegate:
{
  id v6;
  id v7;
  id v8;
  id v9;

  v6 = a4;
  v9 = a5;
  v7 = v9;
  v8 = v6;
  AXPerformBlockAsynchronouslyOnMainThread();

}

- (uint64_t)_accessibilityPostValueChangedNotificationWithInsertedText:()AXPrivCategory
{
  return objc_msgSend(a1, "_accessibilityPostValueChangedNotificationWithChangeType:insertedText:keyInputDelegate:", *MEMORY[0x1E0CF4658], a3, 0);
}

- (uint64_t)_accessibilityPostValueChangedNotificationWithChangeType:()AXPrivCategory
{
  return objc_msgSend(a1, "_accessibilityPostValueChangedNotificationWithChangeType:insertedText:keyInputDelegate:", a3, 0, 0);
}

- (uint64_t)_accessibilityPostValueChangedNotificationWithInsertedText:()AXPrivCategory keyInputDelegate:
{
  return objc_msgSend(a1, "_accessibilityPostValueChangedNotificationWithChangeType:insertedText:keyInputDelegate:", *MEMORY[0x1E0CF4658], a3, a4);
}

- (BOOL)_accessibilitySupportsTextInsertionAndDeletion
{
  uint64_t v1;

  v1 = UIAccessibilityTraitIsEditing | UIAccessibilityTraitTextEntry;
  return (v1 & ~objc_msgSend(a1, "accessibilityTraits")) == 0;
}

- (uint64_t)_accessibilityElementForTextInsertionAndDeletion
{
  return objc_msgSend(a1, "_accessibilityTextHandlingAncestorMatchingBlock:", &__block_literal_global_1291);
}

- (uint64_t)_accessibilityElementForFindSessionResult
{
  return 0;
}

- (uint64_t)_accessibilityUIViewAccessibilityFrame
{
  return 0;
}

- (uint64_t)_accessibilityShowContextMenuForElement:()AXPrivCategory targetPointValue:
{
  return 0;
}

- (uint64_t)_accessibilityCanAppearInContextMenuPreview
{
  return 1;
}

- (id)_accessibilityHandwritingElement
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = objc_msgSend(a1, "accessibilityTraits");
  if ((*MEMORY[0x1E0CF44C8] & v2) != 0
    || (objc_msgSend(a1, "_accessibilityTextHandlingAncestorMatchingBlock:", &__block_literal_global_1292),
        (v5 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(a1, "_accessibilityFirstResponderForKeyWindow");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3 == a1)
    {
      v5 = 0;
    }
    else
    {
      objc_msgSend(v3, "_accessibilityHandwritingElement");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v5;
}

- (id)_accessibilityTextHandlingAncestorMatchingBlock:()AXPrivCategory
{
  uint64_t (**v4)(id, void *);
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v4 = a3;
  v5 = a1;
  v6 = v5;
  if (!v5)
    goto LABEL_9;
  v7 = v5;
  while (1)
  {
    if ((v4[2](v4, v7) & 1) != 0)
    {
      v8 = v7;
      goto LABEL_16;
    }
    objc_msgSend(v7, "_accessibilityViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v4[2](v4, v8) & 1) != 0)
      break;
    objc_msgSend(v7, "accessibilityContainer");
    v9 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v9;
    if (!v9)
      goto LABEL_9;
  }

  if (!v8)
  {
LABEL_9:
    objc_msgSend(v6, "_accessibilityWindow");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstResponder");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      while (1)
      {
        if ((v4[2](v4, v11) & 1) != 0)
        {
          v8 = v11;
          goto LABEL_16;
        }
        objc_msgSend(v11, "_accessibilityViewController");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v4[2](v4, v8))
          break;
        objc_msgSend(v11, "accessibilityContainer");
        v12 = objc_claimAutoreleasedReturnValue();

        v11 = (void *)v12;
        if (!v12)
          goto LABEL_13;
      }

    }
    else
    {
LABEL_13:
      v8 = 0;
    }
  }
LABEL_16:

  return v8;
}

- (uint64_t)_accessibilitySupportsHandwriting
{
  uint64_t v2;

  v2 = UIAccessibilityTraitLaunchIcon | UIAccessibilityTraitWebContent | UIAccessibilityTraitFolderIcon | UIAccessibilityTraitSecureTextField | UIAccessibilityTraitTableIndex;
  if ((objc_msgSend(a1, "accessibilityTraits") & v2) != 0)
    return 1;
  else
    return objc_msgSend(a1, "_accessibilitySupportsTextInsertionAndDeletion");
}

- (id)_accessibilityHandwritingAttributes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[7];
  _QWORD v14[8];

  v14[7] = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1, "_accessibilitySupportsHandwriting"))
  {
    v13[0] = *MEMORY[0x1E0CF4E18];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "_accessibilityHandwritingAttributePreferredCharacterSet"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v2;
    v13[1] = *MEMORY[0x1E0CF4E08];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "_accessibilityHasDeletableText"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v14[1] = v3;
    v13[2] = *MEMORY[0x1E0CF4E20];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "_accessibilityHandwritingAttributeShouldEchoCharacter"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v14[2] = v4;
    v13[3] = *MEMORY[0x1E0CF4E28];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "_accessibilityHandwritingAttributeShouldPlayKeyboardSecureClickSound"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v14[3] = v5;
    v13[4] = *MEMORY[0x1E0CF4DF8];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "_accessibilitySupportsTextInsertionAndDeletion"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v14[4] = v6;
    v13[5] = *MEMORY[0x1E0CF4E00];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "_accessibilityHandwritingAttributeAllowedCharacterSets"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[5] = v7;
    v13[6] = *MEMORY[0x1E0CF4DF0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "_accessibilityHandwritingAttributeAcceptsContractedBraille"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[6] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "_accessibilityHandwritingAttributeLanguage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)objc_msgSend(v9, "mutableCopy");
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0CF4E10]);

      v9 = v11;
    }

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (uint64_t)_accessibilityRequiresLaTeXInput
{
  return 0;
}

- (uint64_t)_accessibilityHandwritingAttributePreferredCharacterSetForKeyboardType:()AXPrivCategory
{
  if ((unint64_t)(a3 - 2) > 6)
    return 1;
  else
    return qword_19D142E40[a3 - 2];
}

- (uint64_t)_accessibilityHandwritingAttributePreferredCharacterSet
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0CEA6C8], "activeKeyboard");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultTextInputTraits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(a1, "_accessibilityHandwritingAttributePreferredCharacterSetForKeyboardType:", objc_msgSend(v3, "keyboardType"));
  return v4;
}

- (uint64_t)_accessibilityHandwritingAttributeAllowedCharacterSetsForKeyboardType:()AXPrivCategory
{
  if ((unint64_t)(a3 - 2) > 6)
    return 15;
  else
    return qword_19D142E78[a3 - 2];
}

- (uint64_t)_accessibilityHandwritingAttributeAllowedCharacterSets
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(MEMORY[0x1E0CEA6C8], "activeKeyboard");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "defaultTextInputTraits");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(a1, "_accessibilityHandwritingAttributeAllowedCharacterSetsForKeyboardType:", objc_msgSend(v3, "keyboardType"));
  else
    v4 = 15;

  return v4;
}

- (uint64_t)_accessibilityHasDeletableText
{
  if (objc_msgSend(a1, "conformsToProtocol:", &unk_1EE4B26F0))
    return objc_msgSend(a1, "hasText");
  else
    return 1;
}

- (BOOL)_accessibilityHandwritingAttributeShouldEchoCharacter
{
  uint64_t v1;

  v1 = objc_msgSend(a1, "accessibilityTraits");
  return (UIAccessibilityTraitSecureTextField & v1) == 0;
}

- (BOOL)_accessibilityHandwritingAttributeShouldPlayKeyboardSecureClickSound
{
  uint64_t v1;

  v1 = objc_msgSend(a1, "accessibilityTraits");
  return (UIAccessibilityTraitSecureTextField & ~v1) == 0;
}

- (BOOL)_accessibilityHandwritingAttributeAcceptsContractedBraille
{
  uint64_t v1;

  v1 = objc_msgSend(a1, "accessibilityTraits");
  return (UIAccessibilityTraitTextEntry & v1) != 0;
}

- (id)_accessibilityHandwritingAttributeLanguage
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CEA6C8], "activeKeyboard");
  v0 = (void *)objc_claimAutoreleasedReturnValue();

  if (v0)
  {
    objc_msgSend(MEMORY[0x1E0CEA6F8], "sharedInputModeController");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "currentInputMode");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "primaryLanguage");
    v0 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v0;
}

- (uint64_t)_accessibilityReplaceTextInRange:()AXPrivCategory withString:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v8 = a5;
  if (objc_msgSend(a1, "conformsToProtocol:", &unk_1EE4B3860))
  {
    v9 = a1;
    objc_msgSend(v9, "beginningOfDocument");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "positionFromPosition:offset:", v10, a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "beginningOfDocument");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "positionFromPosition:offset:", v12, a3 + a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "textRangeFromPosition:toPosition:", v11, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "replaceRange:withText:", v14, v8);

    v15 = 1;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)_accessibilityReplaceCharactersAtCursor:()AXPrivCategory withString:
{
  id v6;
  BOOL v7;
  objc_class *v8;
  objc_class *v9;
  objc_class *v10;
  Method InstanceMethod;
  objc_class *v12;
  Method v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;

  v6 = a4;
  if (_accessibilityReplaceCharactersAtCursor_withString__BaseFrameForBrowserDeleteTextMethod)
    v7 = _accessibilityReplaceCharactersAtCursor_withString__BaseFrameForBrowserInsertTextMethod == 0;
  else
    v7 = 1;
  if (v7)
  {
    v8 = (objc_class *)objc_opt_class();
    _accessibilityReplaceCharactersAtCursor_withString__BaseFrameForBrowserDeleteTextMethod = (uint64_t)class_getInstanceMethod(v8, sel_browserAccessibilityDeleteTextAtCursor_);
    v9 = (objc_class *)objc_opt_class();
    _accessibilityReplaceCharactersAtCursor_withString__BaseFrameForBrowserInsertTextMethod = (uint64_t)class_getInstanceMethod(v9, sel_browserAccessibilityInsertTextAtCursor_);
  }
  v10 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v10, sel_browserAccessibilityDeleteTextAtCursor_);
  v12 = (objc_class *)objc_opt_class();
  v13 = class_getInstanceMethod(v12, sel_browserAccessibilityInsertTextAtCursor_);
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_opt_respondsToSelector() & 1) == 0
    || (Method)_accessibilityReplaceCharactersAtCursor_withString__BaseFrameForBrowserDeleteTextMethod == InstanceMethod
    || (Method)_accessibilityReplaceCharactersAtCursor_withString__BaseFrameForBrowserInsertTextMethod == v13)
  {
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isFirstResponder");

    if (v16)
    {
      objc_msgSend(MEMORY[0x1E0CEA6E8], "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      _UIAccessibilityBlockPostingOfAllNotifications();
      for (; a3; --a3)
        objc_msgSend(v17, "deleteFromInputWithFlags:", 128);
      if (objc_msgSend(v6, "length"))
        objc_msgSend(v17, "addInputString:withFlags:", v6, 128);
      AXPerformBlockAsynchronouslyOnMainThread();
    }
    else
    {
      AXLogAppAccessibility();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[NSObject(AXPrivCategory) _accessibilityReplaceCharactersAtCursor:withString:].cold.1();

      if (!objc_msgSend(a1, "conformsToProtocol:", &unk_1EE4B26F0))
        goto LABEL_30;
      for (; a3; --a3)
        objc_msgSend(a1, "deleteBackward");
      if (objc_msgSend(v6, "length"))
        objc_msgSend(a1, "insertText:", v6);
      objc_msgSend(MEMORY[0x1E0CEA6E8], "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "updateReturnKey:", 0);
    }

LABEL_30:
    objc_msgSend(MEMORY[0x1E0CEA6E8], "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "safeValueForKey:", CFSTR("taskQueue"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = v20;
    AXPerformSafeBlock();

    goto LABEL_31;
  }
  if (a3 >= 0x7FFFFFFFFFFFFFFFLL)
    v14 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v14 = a3;
  objc_msgSend(a1, "browserAccessibilityDeleteTextAtCursor:", v14);
  objc_msgSend(a1, "browserAccessibilityInsertTextAtCursor:", v6);
LABEL_31:

}

- (void)_accessibilityInsertText:()AXPrivCategory atPosition:
{
  if (a4 < 0)
    return (void *)objc_msgSend(a1, "_accessibilityInsertText:");
  return a1;
}

- (void)_accessibilityInsertText:()AXPrivCategory
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;

  v4 = a3;
  if (v4)
  {
    _UIAccessibilityBlockPostingOfAllNotifications();
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isFirstResponder"))
    {

    }
    else
    {
      objc_opt_class();
      objc_msgSend(a1, "_accessibilityTextViewTextOperationResponder");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAccessibilityCastAsClass();
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      LODWORD(v6) = objc_msgSend(v7, "isFirstResponder");
      if (!(_DWORD)v6)
      {
        AXLogAppAccessibility();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          -[NSObject(AXPrivCategory) _accessibilityInsertText:].cold.1();

        if (!objc_msgSend(a1, "conformsToProtocol:", &unk_1EE4B26F0))
          goto LABEL_7;
        objc_msgSend(a1, "insertText:", v4);
        objc_msgSend(MEMORY[0x1E0CEA6E8], "sharedInstance");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "updateReturnKey:", 0);
LABEL_6:

LABEL_7:
        AXUIKeyboardEntryNotificationBlockTimer();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "afterDelay:processBlock:", &__block_literal_global_1301, 0.15);

        goto LABEL_8;
      }
    }
    objc_msgSend(MEMORY[0x1E0CEA6E8], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addInputString:withFlags:", v4, 128);
    goto LABEL_6;
  }
LABEL_8:

}

- (uint64_t)_accessibilityInsertTextWithAlternatives:()AXPrivCategory
{
  return 0;
}

- (uint64_t)_accessibilityAlternativesForTextAtPosition:()AXPrivCategory
{
  return 0;
}

- (BOOL)_accessibilityActivateKeyboardReturnKey
{
  void *v0;
  void *v1;

  UIAccessibilityGetKeyboardLayoutStar();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_accessibilityKeyboardKeyForString:", CFSTR("\n"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
    objc_msgSend(v1, "accessibilityActivate");

  return v1 != 0;
}

- (uint64_t)_accessibilityActivateKeyboardDeleteKey
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CEA6E8], "activeInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  if (v0)
  {
    objc_msgSend(v0, "safeValueForKey:", CFSTR("_layout"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "safeValueForKey:", CFSTR("window"));
    v3 = objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      NSClassFromString(CFSTR("UIKeyboardLayoutStar"));
      if ((objc_opt_isKindOfClass() & 1) == 0)
        _AXAssert();
      objc_msgSend(v2, "_accessibilityKeyboardKeyForString:", CFSTR("\b"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      v3 = v4 != 0;
      if (v4)
        objc_msgSend(v4, "accessibilityActivate");

    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (uint64_t)_accessibilityDispatchKeyboardAction:()AXPrivCategory
{
  return objc_msgSend((id)*MEMORY[0x1E0CEB258], "_accessibilityDispatchKeyboardAction:");
}

- (uint64_t)_accessibilityDismissAlternativeKeyPicker
{
  return 0;
}

- (double)_accessibilityMinScrubberPosition
{
  return *MEMORY[0x1E0C9D538];
}

- (double)_accessibilityMaxScrubberPosition
{
  return *MEMORY[0x1E0C9D538];
}

- (uint64_t)_accessibilityUserTestingVisibleCells
{
  return 0;
}

- (uint64_t)_accessibilityUserTestingVisibleSections
{
  return 0;
}

- (uint64_t)_accessibilityIndexForPickerString:()AXPrivCategory
{
  return 0x7FFFFFFFLL;
}

- (uint64_t)_accessibilityBackingElementIsValid
{
  return 1;
}

- (uint64_t)accessibilityInvalidStatus
{
  return 0;
}

- (id)accessibilitySortDirection
{
  void *v2;
  void *v3;

  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(a1, "safeValueForKey:", CFSTR("_browserAccessibilityStoredValueSortDirection")),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        v2,
        v2))
  {
    objc_msgSend(a1, "safeStringForKey:", CFSTR("browserAccessibilitySortDirection"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (uint64_t)accessibilityExpandedTextValue
{
  return 0;
}

- (uint64_t)_accessibilityIsRealtimeElement
{
  uint64_t v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "_accessibilityGetBlockForAttribute:", 20);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)v1;
  if (v1)
    v3 = (*(uint64_t (**)(uint64_t))(v1 + 16))(v1);
  else
    v3 = 0;

  return v3;
}

- (id)_accessibilitySupplementaryViewSectionHeaderIdentifiers
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_accessibilityGetBlockForAttribute:", 29);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)v1;
  if (v1)
  {
    (*(void (**)(uint64_t))(v1 + 16))(v1);
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6[0] = *MEMORY[0x1E0CEB3B8];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 1);
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v4 = (void *)v3;

  return v4;
}

- (uint64_t)_accessibilityIsInJindo
{
  void *v1;
  void *v2;
  char v3;
  char v4;
  char v5;
  void *v6;

  objc_msgSend(a1, "_accessibilityWindow");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "windowScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  v4 = objc_msgSend(v1, "_accessibilityIsInJindo");
  v5 = v3 | v4;
  if ((v3 & 1) != 0 && (v4 & 1) == 0)
  {
    objc_msgSend(v1, "windowScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "SBUI_isHostedBySystemAperture");

  }
  return v5 & 1;
}

- (uint64_t)_accessibilityIsJindo
{
  return 0;
}

- (uint64_t)_accessibilityIsInWidgetStack
{
  return 0;
}

- (uint64_t)accessibilityIsInDescriptionListTerm
{
  return 0;
}

- (uint64_t)accessibilityIsInDescriptionListDefinition
{
  return 0;
}

- (uint64_t)accessibilityIsComboBox
{
  return 0;
}

- (uint64_t)accessibilityHasPopup
{
  return 0;
}

- (uint64_t)accessibilityPopupValue
{
  return 0;
}

- (uint64_t)_accessibilityWebSearchResultsActive
{
  return 0;
}

- (uint64_t)_accessibilityActiveURL
{
  return 0;
}

- (uint64_t)_accessibilityWebViewIsLoading
{
  return 0;
}

- (uint64_t)_accessibilityDateTimePickerValues
{
  return 0;
}

- (double)_accessibilityGesturePracticeRegion
{
  return *MEMORY[0x1E0C9D648];
}

- (uint64_t)_accessibilityPickerType
{
  return 0;
}

- (uint64_t)_accessibilityDatePickerComponentType
{
  return 0;
}

- (uint64_t)_accessibilityAutomaticIdentifier
{
  return 0;
}

- (uint64_t)_accessibilityHorizontalSizeClass
{
  return 0;
}

- (uint64_t)_accessibilityVerticalSizeClass
{
  return 0;
}

- (uint64_t)_accessibilityHitTestsStatusBar
{
  return 1;
}

- (uint64_t)_accessibilityShouldHitTestStatusBarWindow
{
  return 0;
}

- (uint64_t)_accessibilityUserTestingVisibleAncestor
{
  return 0;
}

- (uint64_t)_accessibilityUserTestingProxyView
{
  return 0;
}

- (uint64_t)_accessibilityUserTestingActions
{
  return 0;
}

- (uint64_t)_accessibilityPerformUserTestingAction:()AXPrivCategory
{
  id v4;
  void *v5;
  char isKindOfClass;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  objc_class *v18;
  objc_method *InstanceMethod;
  char *v20;
  char *v21;
  int v22;
  void *v23;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count")
    && (objc_msgSend(v4, "objectAtIndexedSubscript:", 0),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v5,
        (isKindOfClass & 1) != 0))
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    if ((unint64_t)objc_msgSend(v4, "count") >= 2)
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    objc_msgSend(a1, "_accessibilityUserTestingActions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v10)
    {
      v11 = v10;
      v25 = v8;
      v12 = *(_QWORD *)v27;
LABEL_7:
      v13 = 0;
      while (1)
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v13);
        objc_msgSend(v14, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToString:", v7);

        if (v16)
          break;
        if (v11 == ++v13)
        {
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
          if (v11)
            goto LABEL_7;
          goto LABEL_22;
        }
      }
      v18 = (objc_class *)objc_opt_class();
      InstanceMethod = class_getInstanceMethod(v18, (SEL)objc_msgSend(v14, "selector"));
      if (!InstanceMethod)
      {
LABEL_22:
        v17 = 0;
        v8 = v25;
        goto LABEL_23;
      }
      v20 = method_copyReturnType(InstanceMethod);
      v8 = v25;
      if (!v20 || (v21 = v20, v22 = strcmp(v20, "B"), free(v21), v22))
      {
        NSStringFromSelector((SEL)objc_msgSend(v14, "selector"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        NSLog(CFSTR("-[%@ %@] should return a BOOL to correctly implement UIAccessibilityAutomationAction"), a1, v23);

        v22 = 1;
      }
      objc_msgSend(v14, "selector");
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v17 = v22 | ((unsigned int (*)(void *, uint64_t, void *))objc_msgSend(a1, "methodForSelector:", objc_msgSend(v14, "selector")))(a1, objc_msgSend(v14, "selector"), v25);
        goto LABEL_23;
      }
    }
    v17 = 0;
LABEL_23:

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (id)_accessibilityUserTestingActionIdentifiers
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_accessibilityUserTestingActions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v19 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v10, "identifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "length");

          if (!v12)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSObjectAccessibility.m"), 15886, CFSTR("UIAccessibilityAutomationAction must have an identifier."));

          }
          if (!objc_msgSend(v10, "selector"))
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSObjectAccessibility.m"), 15887, CFSTR("UIAccessibilityAutomationAction must have a selector."));

          }
          objc_msgSend(v10, "identifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v13);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v7);
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (uint64_t)_accessibilityShouldApplySemanticGroupContainerType
{
  objc_method *InstanceMethod;
  objc_class *v3;
  objc_class *v4;

  InstanceMethod = (objc_method *)_accessibilityShouldApplySemanticGroupContainerType_BaseTouchContainer;
  if (!_accessibilityShouldApplySemanticGroupContainerType_BaseTouchContainer)
  {
    v3 = (objc_class *)objc_opt_class();
    InstanceMethod = class_getInstanceMethod(v3, sel__accessibilityIsTouchContainer);
    _accessibilityShouldApplySemanticGroupContainerType_BaseTouchContainer = (uint64_t)InstanceMethod;
  }
  v4 = (objc_class *)objc_opt_class();
  if (InstanceMethod == class_getInstanceMethod(v4, sel__accessibilityIsTouchContainer))
    return 0;
  else
    return objc_msgSend(a1, "_accessibilityIsTouchContainer");
}

- (uint64_t)accessibilityDatetimeValue
{
  return 0;
}

- (uint64_t)accessibilityVisibleText
{
  return 0;
}

- (uint64_t)accessibilityURL
{
  return 0;
}

- (uint64_t)_accessibilityWebAreaURL
{
  return 0;
}

- (uint64_t)accessibilitySpeechHint
{
  return 0;
}

- (uint64_t)_accessibilityLanguageOverriddesUser
{
  return 0;
}

- (id)_accessibilityString:()AXPrivCategory withSpeechHint:
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;
  uint64_t i;
  void *v17;
  char v18;
  _QWORD *v19;
  char v20;
  char v21;
  int v22;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_opt_class();
  v24 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CF40C0]), "initWithCFAttributedString:", v5);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = v5;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CF40C0], "axAttributedStringWithString:", v5);
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  v8 = v7;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v26;
    v13 = *MEMORY[0x1E0C9AE50];
    v14 = (_QWORD *)MEMORY[0x1E0CF4218];
    v15 = (_QWORD *)MEMORY[0x1E0CF42E0];
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v9);
        v17 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v18 = objc_msgSend(v17, "isEqualToString:", CFSTR("spell-out"));
        v19 = v14;
        if ((v18 & 1) == 0)
        {
          v20 = objc_msgSend(v17, "isEqualToString:", CFSTR("digits"));
          v19 = v15;
          if ((v20 & 1) == 0)
          {
            v21 = objc_msgSend(v17, "isEqualToString:", CFSTR("literal-punctuation"));
            v19 = (_QWORD *)MEMORY[0x1E0CF42E8];
            if ((v21 & 1) == 0)
            {
              v22 = objc_msgSend(v17, "isEqualToString:", CFSTR("no-punctuation"));
              v19 = (_QWORD *)MEMORY[0x1E0CF42F0];
              if (!v22)
                continue;
            }
          }
        }
        objc_msgSend(v8, "setAttribute:forKey:", v13, *v19);
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v11);
  }

  return v8;
}

- (uint64_t)_accessibilitySupportsSemanticContext
{
  return 1;
}

- (id)_accessibilitySemanticContext
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id *v8;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v3 = v1;
    while (1)
    {
      objc_msgSend(v3, "_accessibilitySemanticContextForElement:", v2);
      v4 = objc_claimAutoreleasedReturnValue();
      if (v4)
        break;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CEABB8], "viewControllerForView:", v3);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "_accessibilitySemanticContextForElement:", v2);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        if (v6)
          goto LABEL_10;
      }
      objc_msgSend(v3, "accessibilityContainer");
      v7 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v7;
      if (!v7)
        goto LABEL_7;
    }
  }
  else
  {
LABEL_7:
    v8 = (id *)MEMORY[0x1E0CEB258];
    objc_msgSend((id)*MEMORY[0x1E0CEB258], "_accessibilitySemanticContextForElement:", v2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      goto LABEL_11;
    objc_msgSend(*v8, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_accessibilitySemanticContextForElement:", v2);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v4;
LABEL_10:

LABEL_11:
  return v6;
}

- (uint64_t)_accessibilitySemanticContextForElement:()AXPrivCategory
{
  return 0;
}

- (uint64_t)_accessibilityApplicationSemanticContext
{
  return 0;
}

+ (void)_accessibilitySetUnitTestingOrientation:()AXPrivCategory
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, &_UnitTestingOrientationStorageKey, v2, (void *)0x301);

}

+ (void)_accessibilityUnsetUnitTestingOrientation
{
  objc_setAssociatedObject(a1, &_UnitTestingOrientationStorageKey, 0, (void *)0x301);
}

+ (BOOL)_accessibilityHasUnitTestingOrientation
{
  void *v1;
  _BOOL8 v2;

  objc_getAssociatedObject(a1, &_UnitTestingOrientationStorageKey);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

+ (uint64_t)_accessibilityUnitTestingOrientation
{
  void *v1;
  uint64_t v2;

  objc_getAssociatedObject(a1, &_UnitTestingOrientationStorageKey);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "integerValue");

  return v2;
}

- (id)_axSuperviews
{
  void *v2;
  id v3;
  void *v4;
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v19;
  void *v20;
  __CFString *v21;
  unsigned int v22;
  __CFString *v23;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = a1;
  if (v3)
  {
    v4 = v3;
    v20 = v2;
    do
    {
      objc_msgSend(v2, "appendFormat:", CFSTR("%@ [%p]"), objc_opt_class(), v4);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v5 = v4;
        v6 = &stru_1E3E01CE0;
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v7 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v5, "delegate");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_opt_class();
          objc_msgSend(v5, "delegate");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "stringWithFormat:", CFSTR("Delegate:[%@:%p] "), v9, v10);
          v6 = (const __CFString *)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(MEMORY[0x1E0CEABB8], "viewControllerForView:", v5);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (__CFString *)v6;
        if (v11)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("VC:[%@] "), v11);
          v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v21 = &stru_1E3E01CE0;
        }
        v22 = objc_msgSend(v5, "accessibilityIgnoresInvertColors");
        objc_msgSend(v5, "layer");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "filters");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "ax_containsObjectUsingBlock:", &__block_literal_global_1348);
        objc_msgSend(v5, "backgroundColor");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v14;
        v2 = v20;
        objc_msgSend(v20, "appendFormat:", CFSTR("[INV:%d(L:%d), BG:{%@}] %@%@ {%@}\n"), v22, v19, v15, v21, v23, v16);

      }
      else
      {
        objc_msgSend(v2, "appendString:", CFSTR("\n"));
      }
      objc_msgSend(v4, "accessibilityContainer");
      v17 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v17;
    }
    while (v17);
  }
  return v2;
}

- (id)_axDebugTraits
{
  objc_msgSend(a1, "accessibilityTraits");
  return (id)_AXTraitsAsString();
}

- (uint64_t)_accessibilityRoadContainsTrackingPoint:()AXPrivCategory
{
  return 0;
}

- (uint64_t)_accessibilityMapDetailedInfoAtPoint:()AXPrivCategory
{
  return 0;
}

- (uint64_t)_accessibilityUpcomingRoadsForPoint:()AXPrivCategory forAngle:
{
  return 0;
}

- (uint64_t)_accessibilityMapsExplorationCurrentRoadsWithAngles
{
  return 0;
}

- (uint64_t)_accessibilityMapsExplorationCurrentLocation
{
  return 0;
}

- (uint64_t)_accessibilityMapsExplorationCurrentIntersectionDescription
{
  return 0;
}

- (uint64_t)_accessibilityMapsExplorationIncreaseVerbosity
{
  return 0;
}

- (uint64_t)_accessibilityMapsExplorationDecreaseVerbosity
{
  return 0;
}

- (float)_accessibilityDistance:()AXPrivCategory forAngle:toRoad:
{
  return 0.0;
}

- (float)_accessibilityDistanceFromEndOfRoad:()AXPrivCategory forAngle:
{
  return -1.0;
}

- (uint64_t)_accessibilityMapFeatureType
{
  return 0;
}

- (uint64_t)accessibilityRequired
{
  void *v2;

  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(a1, "safeValueForKey:", CFSTR("_browserAccessibilityStoredValueIsRequired")),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        v2,
        v2))
  {
    return objc_msgSend(a1, "safeBoolForKey:", CFSTR("browserAccessibilityIsRequired"));
  }
  else
  {
    return 0;
  }
}

- (id)_accessibilitySupportedLanguages
{
  if (_accessibilitySupportedLanguages_onceToken != -1)
    dispatch_once(&_accessibilitySupportedLanguages_onceToken, &__block_literal_global_1361);
  return (id)_accessibilitySupportedLanguages_Supported;
}

- (void)_accessibilitySetVoiceOverRTLOverride:()AXPrivCategory
{
  LocalDirectionModeValue = a3;
}

- (uint64_t)_accessibilityIsRTL
{
  uint64_t v2;

  v2 = LocalDirectionModeValue;
  if (UIAccessibilityIsVoiceOverRunning() && v2)
    return v2 == 1;
  else
    return objc_msgSend(a1, "_accessibilityHierarchyIsRTL");
}

- (BOOL)_accessibilityHierarchyIsRTL
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "_accessibilityParentView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "effectiveUserInterfaceLayoutDirection") == 1;

  return v2;
}

- (BOOL)_accessibilityApplicationIsRTL
{
  return objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") == 1;
}

- (uint64_t)_accessibilityRecentlyActivatedApplicationBundleIdentifiers
{
  return objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

- (void)_accessibilityAnnouncementComplete:()AXPrivCategory
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v8[0] = *MEMORY[0x1E0CEAFB0];
  v3 = a3;
  objc_msgSend(v3, "objectForKey:", CFSTR("String"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  v8[1] = *MEMORY[0x1E0CEAFB8];
  objc_msgSend(v3, "objectForKey:", CFSTR("DidFinish"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:userInfo:", *MEMORY[0x1E0CEAFA8], 0, v6);

}

- (uint64_t)_accessibilityIgnoreNextNotification:()AXPrivCategory
{
  return _UIAccessibilityIgnoreNextNotification(a3);
}

- (void)_accessibilityHandleATFocused:()AXPrivCategory assistiveTech:
{
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a4;
  objc_msgSend((id)__UIAccessibilityFocusedElements, "objectForKeyedSubscript:");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (!a3)
  {
    _UIAccessibilitySetFocusedElement(0, v8);
    objc_msgSend(v7, "accessibilityElementDidLoseFocus");
    a1 = 0;
    goto LABEL_5;
  }
  if ((void *)v6 != a1)
  {
    _UIAccessibilitySetFocusedElement(a1, v8);
    objc_msgSend(v7, "accessibilityElementDidLoseFocus");
    _UIAccessibilityIsSettingFocus = 1;
    objc_msgSend(a1, "accessibilityElementDidBecomeFocused");
LABEL_5:
    objc_msgSend(MEMORY[0x1E0DE7910], "_accessibilityUpdateOpaqueFocusStateForTechnology:oldElement:newElement:", v8, v7, a1);
  }
  _UIAccessibilityIsSettingFocus = 0;

}

- (void)accessibilityPostNotification:()AXPrivCategory withObject:afterDelay:
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a5;
  v8 = (void *)MEMORY[0x1E0C99D20];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v8, "arrayWithObjects:", v9, v12, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "arrayWithObjects:", v9, v11, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(a1, "performSelector:withObject:afterDelay:", sel__accessibilityPostNotificationHelper_, v10, a2);

}

- (void)_accessibilityPostNotificationHelper:()AXPrivCategory
{
  id v3;
  void *v4;
  UIAccessibilityNotifications v5;
  id v6;
  void *v7;
  id v8;

  v3 = a3;
  objc_msgSend(v3, "objectAtIndex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntValue");

  objc_msgSend(v3, "objectAtIndex:", 1);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 == v6)
    v7 = 0;
  else
    v7 = v8;
  UIAccessibilityPostNotification(v5, v7);

}

- (void)_accessibilityPostAnnouncement:()AXPrivCategory
{
  UIAccessibilityPostNotification(*MEMORY[0x1E0CEAFC0], argument);
}

- (void)_accessibilityIgnoreNextPostPasteboardTextOperation:()AXPrivCategory
{
  objc_storeStrong((id *)&_Operation, obj);
}

- (void)_accessibilityPostPasteboardTextForOperation:()AXPrivCategory associatedObject:
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CF45D8]))
    UIAccessibilityPostNotification(UIAccessibilityPasteOperationOccurredNotification, 0);
  if (objc_msgSend(v5, "isEqualToString:", _Operation))
  {
    v7 = (void *)_Operation;
    _Operation = 0;
  }
  else
  {
    if (_accessibilityPostPasteboardTextForOperation_associatedObject__onceToken != -1)
      dispatch_once(&_accessibilityPostPasteboardTextForOperation_associatedObject__onceToken, &__block_literal_global_1369);
    v8 = _accessibilityPostPasteboardTextForOperation_associatedObject__pasteBoardQueue;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __90__NSObject_AXPrivCategory___accessibilityPostPasteboardTextForOperation_associatedObject___block_invoke_2;
    v9[3] = &unk_1E3DFE350;
    v10 = v5;
    v11 = v6;
    dispatch_async(v8, v9);

    v7 = v10;
  }

}

- (uint64_t)_accessibilityPostPasteboardTextForOperation:()AXPrivCategory
{
  return objc_msgSend(a1, "_accessibilityPostPasteboardTextForOperation:associatedObject:", a3, 0);
}

- (BOOL)_accessibilityShouldPerformIncrementOrDecrement
{
  uint64_t v1;

  v1 = objc_msgSend(a1, "accessibilityTraits");
  return (*MEMORY[0x1E0CEB148] & ~v1) != 0;
}

- (uint64_t)_accessibilityScannerShouldUseActivateInPointMode
{
  return 0;
}

- (uint64_t)_accessibilityShouldIncludeRemoteParentCustomActions
{
  return 1;
}

- (uint64_t)_accessibilityShouldIncludeRegionDescription
{
  return 1;
}

- (uint64_t)_accessibilityHasDragSources
{
  uint64_t v2;
  void *v3;

  if ((objc_msgSend(a1, "isAccessibilityElement") & 1) == 0
    && (objc_msgSend(a1, "_accessibilityIsGroupedParent") & 1) != 0)
  {
    return 0;
  }
  objc_msgSend(a1, "_accessibilityParentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
    v2 = objc_msgSend(v3, "_accessibilityCanDrag");
  else
    v2 = 0;

  return v2;
}

- (uint64_t)_accessibilityHasDragDestinations
{
  uint64_t v2;
  void *v3;

  if ((objc_msgSend(a1, "isAccessibilityElement") & 1) == 0
    && (objc_msgSend(a1, "_accessibilityIsGroupedParent") & 1) != 0)
  {
    return 0;
  }
  objc_msgSend(a1, "_accessibilityParentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0)
    v2 = objc_msgSend(v3, "_accessibilityCanDrop");
  else
    v2 = 0;

  return v2;
}

- (BOOL)_accessibilityIsDraggableElementAttribute
{
  _BOOL8 v2;
  void *v3;
  void *v4;

  if (!objc_msgSend(a1, "isAccessibilityElement"))
    return 0;
  v2 = 1;
  objc_msgSend(a1, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_1377, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(a1, "_accessibilityFindDescendant:", &__block_literal_global_1378);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = v4 != 0;

  }
  return v2;
}

- (uint64_t)_accessibilityCustomActionGroupIdentifier
{
  return 0;
}

- (uint64_t)accessibilityIsAttachmentElement
{
  return 0;
}

- (uint64_t)accessibilityIsMediaPlaying
{
  return 0;
}

- (uint64_t)_accessibilityRealtimeCompleted
{
  return 0;
}

- (uint64_t)_accessibilityRealtimeHasUnread
{
  return 0;
}

- (uint64_t)_accessibilityShouldIncludeParentCustomContent
{
  return 1;
}

- (uint64_t)_accessibilityShouldIncludeParentCustomActions
{
  return 1;
}

- (uint64_t)_accessibilityFilterInteractionLocationDescriptorsForVisible:()AXPrivCategory
{
  return objc_msgSend(a3, "axFilterObjectsUsingBlock:", &__block_literal_global_1380);
}

- (id)_accessibilityAllDragSourceDescriptors
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "accessibilityDragSourceDescriptors");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (!v1)
    v1 = (void *)MEMORY[0x1E0C9AA60];
  v3 = v1;

  return v3;
}

- (uint64_t)_accessibilityDragSourceDescriptorAuxiliaryDictionary
{
  return 0;
}

- (id)_accessibilityDragSourceDescriptorDictionaryRepresentations
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  objc_msgSend(a1, "_accessibilityAllDragSourceDescriptors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "accessibilityTraits");
  if ((*MEMORY[0x1E0CF4678] & ~v3) != 0
    || (objc_msgSend(a1, "_accessibilityRemoteParent"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        !v4))
  {
    objc_msgSend(a1, "_accessibilityFilterInteractionLocationDescriptorsForVisible:", v2);
    v5 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v5;
  }
  objc_msgSend(v2, "axFilterObjectsUsingBlock:", &__block_literal_global_1381);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __87__NSObject_AXPrivCategory___accessibilityDragSourceDescriptorDictionaryRepresentations__block_invoke_2;
  v9[3] = &unk_1E3DFF1B0;
  v9[4] = a1;
  objc_msgSend(v6, "axMapObjectsUsingBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_accessibilityAllDropPointDescriptors
{
  void *v1;
  void *v2;
  id v3;

  objc_msgSend(a1, "accessibilityDropPointDescriptors");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (!v1)
    v1 = (void *)MEMORY[0x1E0C9AA60];
  v3 = v1;

  return v3;
}

- (uint64_t)_accessibilityDropPointDescriptorAuxiliaryDictionary
{
  return 0;
}

- (id)_accessibilityDropPointDescriptorDictionaryRepresentations
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];

  objc_msgSend(a1, "_accessibilityAllDropPointDescriptors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilityFilterInteractionLocationDescriptorsForVisible:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __86__NSObject_AXPrivCategory___accessibilityDropPointDescriptorDictionaryRepresentations__block_invoke;
  v6[3] = &unk_1E3DFF1B0;
  v6[4] = a1;
  objc_msgSend(v3, "axMapObjectsUsingBlock:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (UIAccessibilityAddToDragSessionCustomAction)_accessibilityAddToDragSessionCustomAction
{
  void *v2;
  void *v3;
  id v4;
  UIAccessibilityAddToDragSessionCustomAction *v5;
  uint64_t v6;
  UIAccessibilityAddToDragSessionCustomAction *i;
  void *v8;
  void *v9;
  char v10;
  UIAccessibilityAddToDragSessionCustomAction *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1, "__accessibilitySupportsActivateAction"))
  {
    objc_msgSend(a1, "_accessibilityAllDragSourceDescriptors");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_accessibilityFilterInteractionLocationDescriptorsForVisible:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v4 = v3;
    v5 = (UIAccessibilityAddToDragSessionCustomAction *)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v5; i = (UIAccessibilityAddToDragSessionCustomAction *)((char *)i + 1))
        {
          if (*(_QWORD *)v19 != v6)
            objc_enumerationMutation(v4);
          v8 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v8, "view", (_QWORD)v18);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "_accessibilityCanAddItemsToDragSession");

          if ((v10 & 1) != 0)
          {
            v11 = [UIAccessibilityAddToDragSessionCustomAction alloc];
            objc_msgSend(v8, "point");
            v13 = v12;
            v15 = v14;
            objc_msgSend(v8, "view");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v5 = -[UIAccessibilityAddToDragSessionCustomAction initWithPoint:inSourceView:](v11, "initWithPoint:inSourceView:", v16, v13, v15);

            goto LABEL_13;
          }
        }
        v5 = (UIAccessibilityAddToDragSessionCustomAction *)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v5)
          continue;
        break;
      }
    }
LABEL_13:

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (uint64_t)_accessibilityUseContextlessPassthroughForDrag
{
  void *v2;
  uint64_t v3;
  _BOOL8 v4;
  void *v5;

  objc_msgSend(a1, "_accessibilityAllDragSourceDescriptors");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
    return 1;
  objc_msgSend(a1, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_1384, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v5 != 0;

  return v4;
}

- (uint64_t)isAccessibilityUserDefinedScrollAncestor
{
  return objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("_AX_IsScrollAncestor"));
}

- (uint64_t)accessibilityUserDefinedWindowVisible
{
  return objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("_AX_WindowVisible"));
}

- (uint64_t)accessibilityUserDefinedIsMainWindow
{
  return objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("_AX_WindowIsMain"));
}

- (uint64_t)accessibilityUserDefinedServesAsFirstElement
{
  return objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("_AX_ServesAsFirstElement"));
}

- (uint64_t)accessibilityUserDefinedNotFirstElement
{
  return objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("_AX_NotFirstElement"));
}

- (uint64_t)accessibilityUserDefinedSize
{
  return objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("_AX_Size"));
}

- (id)accessibilityUserDefinedOpaqueElementScrollsContentIntoView
{
  return objc_getAssociatedObject(a1, &__NSObject__accessibilityUserDefinedOpaqueElementScrollsContentIntoView);
}

- (uint64_t)accessibilitySetUserDefinedOpaqueElementScrollsContentIntoView:()AXPrivCategory
{
  return __UIAccessibilitySetAssociatedObject();
}

- (void)_accessibilityBaseScrollToVisible
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_19D0DD000, v0, v1, "Scrolling %{private}@ to visible...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_accessibilityIsSpeakThisElement
{
  int v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  v3 = 1024;
  v4 = v0;
  _os_log_debug_impl(&dword_19D0DD000, v1, OS_LOG_TYPE_DEBUG, "%{public}@ had speak this element property set: %i", v2, 0x12u);
  OUTLINED_FUNCTION_2();
}

- (void)_accessibilityProcessChildrenForParameter:()AXPrivCategory .cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  v3 = 2113;
  v4 = v0;
  OUTLINED_FUNCTION_9(&dword_19D0DD000, v1, (uint64_t)v1, "Returning {%@} children elements: %{private}@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)_iosAccessibilityAttributeValue:()AXPrivCategory forParameter:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_19D0DD000, v0, v1, "Failed retrieving the NSRange for %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_iosAccessibilityAttributeValue:()AXPrivCategory forParameter:.cold.2(uint64_t a1, NSRange range, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  NSStringFromRange(range);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138543618;
  v8 = a1;
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_9(&dword_19D0DD000, a3, v6, "NSRange for text rects in %{public}@ was %{public}@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_1_1();
}

- (void)_iosAccessibilityAttributeValue:()AXPrivCategory .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_19D0DD000, v0, v1, "Could not archive: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_accessibilityStatusBar
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_16(&dword_19D0DD000, v0, v1, "Stop calling _accessibilityStatusBar (kAXStatusBarAttribute)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_accessibilityNextOpaqueElementsForTechnology:()AXPrivCategory startElement:direction:searchType:range:shouldScrollToVisible:honorsGroups:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  objc_msgSend(a1, "accessibilityLabel");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_14(&dword_19D0DD000, v2, v3, "Going with %{public}@ (%{public}@) from %{public}@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_18();
}

- (void)_accessibilityNextOpaqueElementsForTechnology:()AXPrivCategory startElement:direction:searchType:range:shouldScrollToVisible:honorsGroups:.cold.2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_9(&dword_19D0DD000, v0, (uint64_t)v0, "We did not find any ancestors for startElement=(%{public}@) so using self=(%{public}@) instead. This could be the results of reloading the currently selected element but otherwise a bug.", v1);
  OUTLINED_FUNCTION_2();
}

- (void)_accessibilityNextOpaqueElementsForTechnology:()AXPrivCategory startElement:direction:searchType:range:shouldScrollToVisible:honorsGroups:.cold.3(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a2, "accessibilityLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_14(&dword_19D0DD000, v3, v4, "Asking for opaque element: %{public}@\nStart: %{public}@ (%{public}@)", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_18();
}

- (void)_accessibilityFindElementInDirection:()AXPrivCategory searchType:allowOutOfBoundsChild:startingTouchContainer:honorGroups:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_19D0DD000, v0, v1, "Looking for leaf descendant in tree rooted at %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_accessibilitySearchSubtreesAfterChildElement:()AXPrivCategory direction:searchType:allowOutOfBoundsChild:range:shouldScrollToVisible:honorGroups:updatedContainer:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_19D0DD000, v0, v1, "Child element was self, so using first opaque element: %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_accessibilitySearchSubtreesAfterChildElement:()AXPrivCategory direction:searchType:allowOutOfBoundsChild:range:shouldScrollToVisible:honorGroups:updatedContainer:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_19D0DD000, v0, v1, "Updated container to %@.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_accessibilitySearchSubtreesAfterChildElement:()AXPrivCategory direction:searchType:allowOutOfBoundsChild:range:shouldScrollToVisible:honorGroups:updatedContainer:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_19D0DD000, v0, v1, "Unable to find siblings of %@.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_accessibilitySearchSubtreesAfterChildElement:()AXPrivCategory direction:searchType:allowOutOfBoundsChild:range:shouldScrollToVisible:honorGroups:updatedContainer:.cold.4()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_9(&dword_19D0DD000, v0, (uint64_t)v0, "Searching by header in %{public}@. Custom implementation result: %{public}@", v1);
  OUTLINED_FUNCTION_2();
}

- (void)_accessibilitySearchSubtreesAfterChildElement:()AXPrivCategory direction:searchType:allowOutOfBoundsChild:range:shouldScrollToVisible:honorGroups:updatedContainer:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_16(&dword_19D0DD000, v0, v1, "Should only have attempted to search subtrees of an ordered container or opaque element provider (which must be a view).", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_accessibilitySetAnimationsInProgress:()AXPrivCategory .cold.1(char a1, NSObject *a2)
{
  _DWORD v2[2];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109376;
  v2[1] = a1 & 1;
  v3 = 1024;
  v4 = _AXAnimationsInProgressCount;
  _os_log_debug_impl(&dword_19D0DD000, a2, OS_LOG_TYPE_DEBUG, "Set animation in progress:%d - count: %d", (uint8_t *)v2, 0xEu);
  OUTLINED_FUNCTION_2();
}

- (void)_accessibilityReplaceCharactersAtCursor:()AXPrivCategory withString:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_19D0DD000, v0, v1, "Attempted to replace text on object that was not first responder: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_accessibilityInsertText:()AXPrivCategory .cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_19D0DD000, v0, v1, "Attempted to insert text on object that was not first responder: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
