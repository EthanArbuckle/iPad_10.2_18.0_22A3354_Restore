@implementation NSObject(AXAutoscrolling)

- (void)_accessibilitySetAutoscrollTarget:()AXAutoscrolling
{
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  +[UIAccessibilityAutoscrollManager sharedInstance](UIAccessibilityAutoscrollManager, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "scrollDirection");

  objc_msgSend(v10, "_accessibilityScrollAncestorForSelector:", objc_msgSend(a1, "_scrollPageSelectorForAutoscrollDirection:", v5));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (!v6)
    v6 = v10;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_10;
  if (v6 || (objc_opt_respondsToSelector() & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v6, "performSelector:", sel__scroller);
      v7 = objc_claimAutoreleasedReturnValue();

      v6 = (id)v7;
    }
  }
  else
  {
    objc_msgSend(v10, "performSelector:", sel__scroller);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
LABEL_10:
    +[UIAccessibilityAutoscrollManager sharedInstance](UIAccessibilityAutoscrollManager, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setScrollView:", v6);

    +[UIAccessibilityAutoscrollManager sharedInstance](UIAccessibilityAutoscrollManager, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTargetToScroll:", v10);

  }
  else
  {
    _AXLogWithFacility();
  }

}

- (char)_scrollPageSelectorForAutoscrollDirection:()AXAutoscrolling
{
  uint64_t v3;
  __int128 v4;
  char **v5;
  char **v6;

  *((_QWORD *)&v4 + 1) = a3;
  *(_QWORD *)&v4 = a3 - 2;
  v3 = v4 >> 1;
  v5 = &selRef_accessibilityScrollDownPage;
  if (!v3)
    v5 = &selRef_accessibilityScrollUpPage;
  if (v3 == 3)
    v5 = &selRef_accessibilityScrollRightPage;
  if (v3 == 7)
    v6 = &selRef_accessibilityScrollLeftPage;
  else
    v6 = v5;
  return *v6;
}

- (id)_accessibilityAutoscrollTarget
{
  void *v0;
  void *v1;

  +[UIAccessibilityAutoscrollManager sharedInstance](UIAccessibilityAutoscrollManager, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "scrollView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

- (uint64_t)_accessibilityAvailableAutoscrollDirections
{
  void *v0;
  uint64_t v1;

  +[UIAccessibilityAutoscrollManager sharedInstance](UIAccessibilityAutoscrollManager, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "availableAutoscrollDirections");

  return v1;
}

- (uint64_t)_accessibilityIsAutoscrolling
{
  void *v0;
  uint64_t v1;

  +[UIAccessibilityAutoscrollManager sharedInstance](UIAccessibilityAutoscrollManager, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isAutoscrolling");

  return v1;
}

- (uint64_t)_accessibilityAutoscrollInDirection:()AXAutoscrolling
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD v19[6];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  +[UIAccessibilityAutoscrollManager sharedInstance](UIAccessibilityAutoscrollManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "scrollDirection");

  if (v6 != a3)
  {
    +[UIAccessibilityAutoscrollManager sharedInstance](UIAccessibilityAutoscrollManager, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setScrollDirection:", a3);

    +[UIAccessibilityAutoscrollManager sharedInstance](UIAccessibilityAutoscrollManager, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "targetToScroll");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_accessibilitySetAutoscrollTarget:", v9);

  }
  +[UIAccessibilityAutoscrollManager sharedInstance](UIAccessibilityAutoscrollManager, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "autoscrollInDirection:", a3);

  if ((v11 & 1) != 0)
    return 1;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__2;
  v24 = __Block_byref_object_dispose__2;
  v25 = 0;
  +[UIAccessibilityAutoscrollManager sharedInstance](UIAccessibilityAutoscrollManager, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "targetToScroll");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __65__NSObject_AXAutoscrolling___accessibilityAutoscrollInDirection___block_invoke;
  v19[3] = &unk_1E3DFE648;
  v19[4] = a1;
  v19[5] = &v20;
  objc_msgSend(v14, "_accessibilityIterateScrollParentsUsingBlock:", v19);

  v15 = v21[5];
  if (v15)
  {
    +[UIAccessibilityAutoscrollManager sharedInstance](UIAccessibilityAutoscrollManager, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setScrollView:", v15);

    +[UIAccessibilityAutoscrollManager sharedInstance](UIAccessibilityAutoscrollManager, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v17, "autoscrollInDirection:", a3);

  }
  else
  {
    v12 = 0;
  }
  _Block_object_dispose(&v20, 8);

  return v12;
}

- (void)_accessibilityPauseAutoscrolling
{
  id v0;

  +[UIAccessibilityAutoscrollManager sharedInstance](UIAccessibilityAutoscrollManager, "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "pause");

}

- (void)_accessibilityIncreaseAutoscrollSpeed
{
  id v0;

  +[UIAccessibilityAutoscrollManager sharedInstance](UIAccessibilityAutoscrollManager, "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "incrementAutoscrollSpeed");

}

- (void)_accessibilityDecreaseAutoscrollSpeed
{
  id v0;

  +[UIAccessibilityAutoscrollManager sharedInstance](UIAccessibilityAutoscrollManager, "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "decrementAutoscrollSpeed");

}

- (void)_accessibilitySetAutoscrollSpeed:()AXAutoscrolling
{
  id v2;

  +[UIAccessibilityAutoscrollManager sharedInstance](UIAccessibilityAutoscrollManager, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAutoscrollSpeed:", a1);

}

- (id)_accessibilityGetAllScrollViews
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIAccessibilityElementTraversalOptions options](UIAccessibilityElementTraversalOptions, "options");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__NSObject_AXAutoscrolling___accessibilityGetAllScrollViews__block_invoke;
  v9[3] = &unk_1E3DFDE98;
  v10 = v2;
  v4 = v2;
  objc_msgSend(v3, "setLeafNodePredicate:", v9);
  v5 = (id)objc_msgSend(a1, "_accessibilityLeafDescendantsWithCount:options:", 0, v3);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)_accessibilityScrollToTop
{
  void *v1;
  double v2;
  double v3;
  double v4;
  _BOOL8 v5;
  id v7;

  objc_msgSend(a1, "_accessibilityScrollAncestor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v1, "adjustedContentInset");
    objc_msgSend(v1, "accessibilityApplyScrollContent:sendScrollStatus:animated:", 0, 0, 0.0, -v2);
    v7 = v1;
    AXPerformBlockOnMainThreadAfterDelay();
    objc_msgSend(v7, "contentOffset");
    v5 = v4 == *(double *)(MEMORY[0x1E0C9D538] + 8) && v3 == *MEMORY[0x1E0C9D538];

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_accessibilityScrollToBottom
{
  void *v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _BOOL8 v12;
  id v14;

  objc_msgSend(a1, "_accessibilityScrollAncestor");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v1, "contentSize");
    v3 = v2;
    v5 = v4;
    objc_msgSend(v1, "visibleBounds");
    if (v5 <= v7)
      v8 = *(double *)(MEMORY[0x1E0C9D538] + 8);
    else
      v8 = v5 - v7;
    if (v3 <= v6)
      v9 = *MEMORY[0x1E0C9D538];
    else
      v9 = v3 - v6;
    objc_msgSend(v1, "accessibilityApplyScrollContent:sendScrollStatus:animated:", 0, 0, v9, v8);
    v14 = v1;
    AXPerformBlockOnMainThreadAfterDelay();
    objc_msgSend(v14, "contentOffset");
    v12 = v11 == v8 && v10 == v9;

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)_accessibilityAutoscrollScrollToTop
{
  void *v0;
  void *v1;
  id v2;

  +[UIAccessibilityAutoscrollManager sharedInstance](UIAccessibilityAutoscrollManager, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "scrollView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    +[UIAccessibilityAutoscrollManager sharedInstance](UIAccessibilityAutoscrollManager, "sharedInstance");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "scrollToTop");

  }
  else
  {
    AXPerformSafeBlock();
  }
}

- (void)_accessibilityAutoscrollScrollToBottom
{
  id v0;

  +[UIAccessibilityAutoscrollManager sharedInstance](UIAccessibilityAutoscrollManager, "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "scrollToBottom");

}

@end
