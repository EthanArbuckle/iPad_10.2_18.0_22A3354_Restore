@implementation AXRemoteElement(UIAccessibility)

- (uint64_t)accessibilityViewIsModal
{
  return 1;
}

- (uint64_t)_accessibilityIsRemoteElement
{
  return 1;
}

- (id)_handleElementTraversalRequestMovingForward:()UIAccessibility count:shouldIncludeSelf:wantsContainers:
{
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  uint64_t v17;
  void *v18;
  int v19;
  void *v20;
  NSObject *v21;
  const __CFString *v23;
  int v24;
  const __CFString *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  unint64_t v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  +[UIAccessibilityElementTraversalOptions defaultVoiceOverOptions](UIAccessibilityElementTraversalOptions, "defaultVoiceOverOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (AXRequestingClient() == 11)
  {
    +[UIAccessibilityElementTraversalOptions defaultSpeakScreenOptions](UIAccessibilityElementTraversalOptions, "defaultSpeakScreenOptions");
    v12 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v12;
  }
  if (a3)
    v13 = 1;
  else
    v13 = 2;
  objc_msgSend(v11, "setDirection:", v13);
  if (a6)
  {
    objc_msgSend(v11, "setLeafNodePredicate:", &__block_literal_global_9);
    objc_msgSend(v11, "setIncludeAncestorsOfSelfInSiblingMatch:", 1);
  }
  objc_msgSend(a1, "_accessibilityLeafDescendantsWithCount:shouldStopAtRemoteElement:options:", a4, 1, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "count") < a4)
  {
    objc_msgSend(v14, "lastObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "_accessibilityIsRemoteElement");

    if ((v16 & 1) == 0)
    {
      if (!v14)
        _AXAssert();
      objc_msgSend(v14, "arrayByAddingObject:", a1);
      v17 = objc_claimAutoreleasedReturnValue();

      v14 = (void *)v17;
    }
  }
  if ((a5 & 1) == 0)
  {
    objc_msgSend(v14, "lastObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEqual:", a1);

    if (v19)
    {
      v20 = (void *)objc_msgSend(v14, "mutableCopy");
      objc_msgSend(v20, "removeLastObject");

      v14 = v20;
    }
  }
  AXLogElementTraversal();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    v23 = CFSTR("previous");
    v24 = 138544131;
    if (a3)
      v23 = CFSTR("next");
    v25 = v23;
    v26 = 2114;
    v27 = a1;
    v28 = 2048;
    v29 = a4;
    v30 = 2113;
    v31 = v14;
    _os_log_debug_impl(&dword_19D0DD000, v21, OS_LOG_TYPE_DEBUG, "*** Returning remote %{public}@ elements for %{public}@ with count %lu: %{private}@", (uint8_t *)&v24, 0x2Au);
  }

  return v14;
}

- (id)_iosAccessibilityAttributeValue:()UIAccessibility forParameter:
{
  id v6;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_super v13;
  objc_super v14;

  v6 = a4;
  if ((unint64_t)(a3 - 92501) < 2 || a3 == 95252)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = objc_msgSend(v6, "unsignedIntValue");
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CF4010]);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v9, "unsignedIntegerValue");

      }
      else
      {
        v8 = 0;
      }
    }
    if ((objc_msgSend(a1, "onClientSide") & 1) == 0)
    {
      objc_msgSend(a1, "_handleElementTraversalRequestMovingForward:count:shouldIncludeSelf:wantsContainers:", a3 != 92502, v8, a3 != 95252, 0);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    objc_msgSendSuper2(&v14, sel__iosAccessibilityAttributeValue_forParameter_, a3, v6, v13.receiver, v13.super_class, a1, &off_1EE49DBE8);
  }
  else
  {
    objc_msgSendSuper2(&v13, sel__iosAccessibilityAttributeValue_forParameter_, a3, v6, a1, &off_1EE49DBE8, v14.receiver, v14.super_class);
  }
  v10 = objc_claimAutoreleasedReturnValue();
LABEL_15:
  v11 = (void *)v10;

  return v11;
}

- (id)_iosAccessibilityAttributeValue:()UIAccessibility
{
  uint64_t v5;
  objc_super *v6;
  void *v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _UNKNOWN **v13;
  void *v14;
  _UNKNOWN **v15;
  objc_super v16;
  objc_super v17;
  objc_super v18;

  if (a3 > 2999)
  {
    switch(a3)
    {
      case 3022:
        objc_msgSend((id)*MEMORY[0x1E0CEB258], "_accessibilityExplorerElements");
        v5 = objc_claimAutoreleasedReturnValue();
        goto LABEL_26;
      case 3023:
      case 3024:
      case 3026:
      case 3027:
      case 3028:
      case 3030:
        goto LABEL_18;
      case 3025:
        objc_msgSend((id)*MEMORY[0x1E0CEB258], "_accessibilityElementsWithSemanticContext:", 0);
        v5 = objc_claimAutoreleasedReturnValue();
        goto LABEL_26;
      case 3029:
        objc_msgSend((id)*MEMORY[0x1E0CEB258], "_accessibilityNativeFocusableElements:", 0);
        v5 = objc_claimAutoreleasedReturnValue();
        goto LABEL_26;
      case 3031:
        objc_msgSend((id)*MEMORY[0x1E0CEB258], "_accessibilitySiriContentNativeFocusableElements");
        v5 = objc_claimAutoreleasedReturnValue();
        goto LABEL_26;
      case 3032:
        objc_msgSend((id)*MEMORY[0x1E0CEB258], "_accessibilitySiriContentElementsWithSemanticContext");
        v5 = objc_claimAutoreleasedReturnValue();
        goto LABEL_26;
      default:
        if (a3 != 3000)
          goto LABEL_18;
        if ((objc_msgSend(a1, "onClientSide") & 1) != 0)
        {
          objc_msgSendSuper2(&v18, sel__iosAccessibilityAttributeValue_, 3000, v12, v13, v14, v15, v16.receiver, v16.super_class, v17.receiver, v17.super_class, a1, &off_1EE49DBE8);
          goto LABEL_25;
        }
        +[UIAccessibilityElementTraversalOptions defaultVoiceOverOptions](UIAccessibilityElementTraversalOptions, "defaultVoiceOverOptions");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "_accessibilityLeafDescendantsWithCount:options:", 1, v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "firstObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        break;
    }
    goto LABEL_31;
  }
  if ((unint64_t)(a3 - 2014) < 2)
  {
    if ((objc_msgSend(a1, "onClientSide") & 1) != 0)
    {
      v14 = a1;
      v15 = &off_1EE49DBE8;
      v6 = (objc_super *)&v14;
LABEL_19:
      -[objc_super _iosAccessibilityAttributeValue:](v6, sel__iosAccessibilityAttributeValue_, a3, v12, v13, v14, v15, v16.receiver, v16.super_class, v17.receiver, v17.super_class, v18.receiver, v18.super_class);
      goto LABEL_25;
    }
    objc_msgSend(a1, "_handleElementTraversalRequestMovingForward:count:shouldIncludeSelf:wantsContainers:", a3 != 2015, 1, 1, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_31:

    return v10;
  }
  if (a3 == 2019)
  {
    if (objc_msgSend(a1, "onClientSide"))
    {
      objc_msgSend(a1, "_ancestorElementThatSupportsActivationAction");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
        return MEMORY[0x1E0C9AAB0];
    }
    objc_msgSendSuper2(&v17, sel__iosAccessibilityAttributeValue_, 2019, v12, v13, v14, v15, v16.receiver, v16.super_class, a1, &off_1EE49DBE8, v18.receiver, v18.super_class);
    goto LABEL_25;
  }
  if (a3 != 2196)
  {
LABEL_18:
    v12 = a1;
    v13 = &off_1EE49DBE8;
    v6 = (objc_super *)&v12;
    goto LABEL_19;
  }
  if ((objc_msgSend(a1, "onClientSide") & 1) == 0)
  {
    objc_msgSend(a1, "_handleElementTraversalRequestMovingForward:count:shouldIncludeSelf:wantsContainers:", 1, 5, 1, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_26;
  }
  objc_msgSendSuper2(&v16, sel__iosAccessibilityAttributeValue_, 2196, v12, v13, v14, v15, a1, &off_1EE49DBE8, v17.receiver, v17.super_class, v18.receiver, v18.super_class);
LABEL_25:
  v5 = objc_claimAutoreleasedReturnValue();
LABEL_26:
  v10 = (void *)v5;
  return v10;
}

- (uint64_t)accessibilityActivate
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "_ancestorElementThatSupportsActivationAction");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "accessibilityActivate");
  else
    v3 = 0;

  return v3;
}

- (uint64_t)_ancestorElementThatSupportsActivationAction
{
  return objc_msgSend(a1, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_187_0, 0);
}

@end
