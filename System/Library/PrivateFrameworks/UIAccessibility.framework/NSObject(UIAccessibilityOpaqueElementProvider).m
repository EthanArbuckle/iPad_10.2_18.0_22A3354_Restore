@implementation NSObject(UIAccessibilityOpaqueElementProvider)

- (id)_accessibilityFocusStatePerTechnology
{
  void *v2;

  objc_getAssociatedObject(a1, &_opaqueFocusState);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(a1, &_opaqueFocusState, v2, (void *)1);
  }
  return v2;
}

- (void)_accessibilityDidFocusOnOpaqueElement:()UIAccessibilityOpaqueElementProvider technology:
{
  id v6;
  void *v7;
  UIAccessibilityOpaqueFocusState *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if ((objc_msgSend(a1, "isAccessibilityOpaqueElementProvider") & 1) == 0)
  {
    v9 = a1;
    _AXAssert();
  }
  objc_msgSend(a1, "_accessibilityFocusStatePerTechnology", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (UIAccessibilityOpaqueFocusState *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v8 = objc_alloc_init(UIAccessibilityOpaqueFocusState);
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, v6);
  }
  objc_msgSend(a1, "_accessibilityUpdateFocusState:forFocusedElement:", v8, v10);

}

+ (void)_accessibilityUpdateOpaqueFocusStateForTechnology:()UIAccessibilityOpaqueElementProvider oldElement:newElement:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v7 = a5;
  v8 = a4;
  objc_msgSend(v7, "_accessibilityOpaqueElementParent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_accessibilityOpaqueElementParent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 != v10)
    objc_msgSend(v10, "_accessibilityDidFocusOnOpaqueElement:technology:", 0, v11);
  objc_msgSend(v9, "_accessibilityDidFocusOnOpaqueElement:technology:", v7, v11);

}

- (void)_accessibilityUpdateFocusState:()UIAccessibilityOpaqueElementProvider forFocusedElement:
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "setElement:", v7);
  objc_msgSend(v7, "accessibilityFrame");
  objc_msgSend(v6, "setSceneRelativeFrame:");
  if (v7)
  {
    objc_msgSend(a1, "_accessibilityReusableViewForOpaqueElement:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setReusableView:", v8);

  }
  objc_msgSend(v6, "setHasBeenReused:", 0);
  AXLogOpaqueElements();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    -[NSObject(UIAccessibilityOpaqueElementProvider) _accessibilityUpdateFocusState:forFocusedElement:].cold.1((uint64_t)a1, (uint64_t)v6, v9);

}

- (id)_accessibilityCurrentlyFocusedElementForTechnology:()UIAccessibilityOpaqueElementProvider
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
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
  CGFloat v22;
  CGFloat v23;
  void *v24;
  NSObject *v25;
  double MidX;
  double MidY;
  NSObject *v28;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  v4 = a3;
  objc_msgSend(a1, "_accessibilityFocusStatePerTechnology");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "element");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "hasFocus"))
    goto LABEL_9;
  if (!v7)
  {
    AXLogOpaqueElements();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      -[NSObject(UIAccessibilityOpaqueElementProvider) _accessibilityCurrentlyFocusedElementForTechnology:].cold.2(v25);
    goto LABEL_16;
  }
  objc_msgSend(v7, "_accessibilityParentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "_accessibilityViewIsVisible")
    && (objc_msgSend(v7, "_accessibilityWindow"), (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {

  }
  else
  {
    v10 = objc_msgSend(v7, "accessibilityTraits");
    v11 = UIAccessibilityTraitSpacer & v10;

    if (!v11)
    {
      AXLogOpaqueElements();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        -[NSObject(UIAccessibilityOpaqueElementProvider) _accessibilityCurrentlyFocusedElementForTechnology:].cold.3(v7, v25);
      goto LABEL_16;
    }
  }
  if (!objc_msgSend(v6, "hasBeenReused"))
    goto LABEL_9;
  objc_msgSend(v7, "accessibilityFrame");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  objc_msgSend(v6, "sceneRelativeFrame");
  v33.origin.x = v20;
  v33.origin.y = v21;
  v33.size.width = v22;
  v33.size.height = v23;
  v30.origin.x = v13;
  v30.origin.y = v15;
  v30.size.width = v17;
  v30.size.height = v19;
  if (CGRectEqualToRect(v30, v33))
  {
LABEL_9:
    v24 = v7;
    goto LABEL_21;
  }
  AXLogOpaqueElements();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    -[NSObject(UIAccessibilityOpaqueElementProvider) _accessibilityCurrentlyFocusedElementForTechnology:].cold.4(v6, v7, v25);
LABEL_16:

  objc_msgSend(v6, "sceneRelativeFrame");
  MidX = CGRectGetMidX(v31);
  objc_msgSend(v6, "sceneRelativeFrame");
  MidY = CGRectGetMidY(v32);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    _AXAssert();
  objc_msgSend(a1, "_accessibilityHitTest:withEvent:", 0, UIAccessibilityPointToPoint(a1, MidX, MidY));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  AXLogOpaqueElements();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    -[NSObject(UIAccessibilityOpaqueElementProvider) _accessibilityCurrentlyFocusedElementForTechnology:].cold.1(v6, (uint64_t)v24, v28);

LABEL_21:
  return v24;
}

- (uint64_t)_accessibilityReusableViewForOpaqueElement:()UIAccessibilityOpaqueElementProvider
{
  return 0;
}

- (void)_accessibilityDidReuseOpaqueElementView:()UIAccessibilityOpaqueElementProvider
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a1, "_accessibilityFocusStatePerTechnology", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v11, "reusableView");
        v12 = (id)objc_claimAutoreleasedReturnValue();

        if (v12 == v4)
          objc_msgSend(v11, "setHasBeenReused:", 1);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

- (void)_accessibilityUpdateFocusState:()UIAccessibilityOpaqueElementProvider forFocusedElement:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  OUTLINED_FUNCTION_9(&dword_19D0DD000, a3, (uint64_t)a3, "Opaque element provider: %{public}@. Focus state: %{public}@", (uint8_t *)&v3);
}

- (void)_accessibilityCurrentlyFocusedElementForTechnology:()UIAccessibilityOpaqueElementProvider .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;
  CGRect v9;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "sceneRelativeFrame");
  NSStringFromCGRect(v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = v4;
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_9(&dword_19D0DD000, a3, v5, "Hit tested result from frame %{public}@ was %{public}@", (uint8_t *)&v6);

  OUTLINED_FUNCTION_1_1();
}

- (void)_accessibilityCurrentlyFocusedElementForTechnology:()UIAccessibilityOpaqueElementProvider .cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_19D0DD000, log, OS_LOG_TYPE_DEBUG, "Had focus, but element had disappeared.", v1, 2u);
}

- (void)_accessibilityCurrentlyFocusedElementForTechnology:()UIAccessibilityOpaqueElementProvider .cold.3(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  const __CFString *v5;
  uint64_t v6;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_accessibilityParentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_accessibilityViewIsVisible");
  v5 = CFSTR("not visible");
  if (v4)
    v5 = CFSTR("not in the view hierarchy");
  v7 = 138412546;
  v8 = v5;
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_9(&dword_19D0DD000, a2, v6, "Parent view was %@. Time to hit test for a replacement element. Old element: %{public}@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_1_1();
}

- (void)_accessibilityCurrentlyFocusedElementForTechnology:()UIAccessibilityOpaqueElementProvider .cold.4(void *a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  __int16 v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;
  CGRect v14;
  CGRect v15;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "sceneRelativeFrame");
  NSStringFromCGRect(v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "accessibilityFrame");
  NSStringFromCGRect(v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138543874;
  v10 = v5;
  OUTLINED_FUNCTION_2_1();
  v11 = v7;
  v12 = v8;
  _os_log_debug_impl(&dword_19D0DD000, a3, OS_LOG_TYPE_DEBUG, "Mismatched rects for saved frame %{public}@, element %{public}@ with frame %{public}@.", (uint8_t *)&v9, 0x20u);

}

@end
