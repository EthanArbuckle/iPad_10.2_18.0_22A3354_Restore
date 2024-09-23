@implementation NSObject(UIAccessibility)

- (void)_internalSetAccessibilityAttributedLabel:()UIAccessibility
{
  objc_setAssociatedObject(a1, &AXLabelIdentifier, a3, (void *)3);
}

- (id)storedAccessibilityIdentifier
{
  return objc_getAssociatedObject(a1, &AXIdentifierIdentifier);
}

- (uint64_t)accessibilityTraits
{
  return objc_msgSend(objc_getAssociatedObject(a1, &AXTraitsIdentifier), "unsignedLongLongValue");
}

- (uint64_t)accessibilityLabel
{
  return objc_msgSend((id)objc_msgSend(a1, "_internalAccessibilityAttributedLabel"), "string");
}

- (id)_internalAccessibilityAttributedLabel
{
  return objc_getAssociatedObject(a1, &AXLabelIdentifier);
}

- (void)_internalSetAccessibilityAttributedValue:()UIAccessibility
{
  objc_setAssociatedObject(a1, &AXValueIdentifier, a3, (void *)3);
}

- (void)_internalSetAccessibilityAttributedHint:()UIAccessibility
{
  objc_setAssociatedObject(a1, &AXHintIdentifier, a3, (void *)3);
}

- (uint64_t)accessibilityElementsHidden
{
  return objc_msgSend((id)objc_msgSend(a1, "storedAccessibilityElementsHidden"), "BOOLValue");
}

- (id)storedAccessibilityElementsHidden
{
  return objc_getAssociatedObject(a1, &AXElementsHiddenIdentifier);
}

- (void)setAccessibilityTraits:()UIAccessibility
{
  objc_setAssociatedObject(a1, &AXTraitsIdentifier, (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:"), (void *)1);
}

- (void)setIsAccessibilityElement:()UIAccessibility
{
  objc_setAssociatedObject(a1, &AXIsElementIdentifier, (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:"), (void *)1);
}

- (void)setAccessibilityContainer:()UIAccessibility
{
  UIAccessibilityContainerReferenceHolder *AssociatedObject;

  if (a3)
  {
    AssociatedObject = (UIAccessibilityContainerReferenceHolder *)objc_getAssociatedObject(object, &AXContainerIdentifier);
    if (!AssociatedObject)
    {
      AssociatedObject = objc_alloc_init(UIAccessibilityContainerReferenceHolder);
      objc_setAssociatedObject(object, &AXContainerIdentifier, AssociatedObject, (void *)1);

    }
    -[UIAccessibilityContainerReferenceHolder setReferencedContainer:](AssociatedObject, "setReferencedContainer:", a3);
  }
  else
  {
    objc_setAssociatedObject(object, &AXContainerIdentifier, 0, (void *)1);
  }
}

- (void)setAccessibilityElementsHidden:()UIAccessibility
{
  objc_setAssociatedObject(a1, &AXElementsHiddenIdentifier, (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:"), (void *)1);
}

- (uint64_t)accessibilityHint
{
  return objc_msgSend((id)objc_msgSend(a1, "_internalAccessibilityAttributedHint"), "string");
}

- (id)_internalAccessibilityAttributedHint
{
  return objc_getAssociatedObject(a1, &AXHintIdentifier);
}

- (uint64_t)setAccessibilityHint:()UIAccessibility
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && a3)
    a3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", a3);
  return objc_msgSend(a1, "_internalSetAccessibilityAttributedHint:", a3);
}

- (uint64_t)setAccessibilityLabel:()UIAccessibility
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && a3)
    a3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", a3);
  return objc_msgSend(a1, "_internalSetAccessibilityAttributedLabel:", a3);
}

- (uint64_t)setAutomationElementsBlock:()UIAccessibility
{
  return objc_msgSend(a1, "_accessibilitySetReturnBlock:forAttribute:", a3, 45);
}

- (void)setAccessibilityLanguage:()UIAccessibility
{
  objc_setAssociatedObject(a1, &AXLanguageIdentifier, a3, (void *)3);
}

- (uint64_t)setAccessibilityLabelBlock:()UIAccessibility
{
  return objc_msgSend(a1, "_accessibilitySetReturnBlock:forAttribute:", a3, 1);
}

- (uint64_t)setAccessibilityCustomActionsBlock:()UIAccessibility
{
  return objc_msgSend(a1, "_accessibilitySetReturnBlock:forAttribute:", a3, 26);
}

- (uint64_t)setAccessibilityValue:()UIAccessibility
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 && a3)
    a3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", a3);
  return objc_msgSend(a1, "_internalSetAccessibilityAttributedValue:", a3);
}

- (uint64_t)isAccessibilityElement
{
  return objc_msgSend(objc_getAssociatedObject(a1, &AXIsElementIdentifier), "BOOLValue");
}

- (uint64_t)_accessibilityGetBlockForAttribute:()UIAccessibility
{
  void *v5;

  if ((objc_opt_respondsToSelector() & 1) != 0
    && (v5 = (void *)objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("AccessibilityAttributeBlockStorageKey"))) != 0)
  {
    return objc_msgSend(v5, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3));
  }
  else
  {
    return 0;
  }
}

- (void)_accessibilitySetReturnBlock:()UIAccessibility forAttribute:
{
  void *v7;
  void *v8;

  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = (void *)objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("AccessibilityAttributeBlockStorageKey"));
    if (v7)
    {
      if (a3)
      {
LABEL_5:
        v8 = _Block_copy(a3);
        objc_msgSend(v7, "setObject:forKey:", v8, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4));
        _Block_release(v8);
        return;
      }
    }
    else
    {
      v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      objc_msgSend(a1, "_accessibilitySetValue:forKey:storageMode:", v7, CFSTR("AccessibilityAttributeBlockStorageKey"), 0);
      if (a3)
        goto LABEL_5;
    }
    objc_msgSend(v7, "removeObjectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4));
    if (!objc_msgSend(v7, "count"))
      objc_msgSend(a1, "_accessibilitySetValue:forKey:storageMode:", 0, CFSTR("AccessibilityAttributeBlockStorageKey"), 1);
  }
}

- (uint64_t)accessibilityContainer
{
  return objc_msgSend(objc_getAssociatedObject(a1, &AXContainerIdentifier), "referencedContainer");
}

- (void)setAccessibilityViewIsModal:()UIAccessibility
{
  objc_setAssociatedObject(a1, &AXViewIsModalIdentifier, (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:"), (void *)1);
}

- (void)accessibilityUserInputLabels
{
  void *v2;
  void *v3;
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
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = (void *)objc_msgSend(a1, "_internalAccessibilityAttributedUserInputLabels", 0);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(v2, "addObject:", objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "string"));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }
  return v2;
}

- (id)_internalAccessibilityAttributedUserInputLabels
{
  return objc_getAssociatedObject(a1, &AXUserInputLabelsIdentifier);
}

- (uint64_t)setAccessibilityUserInputLabels:()UIAccessibility
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(a3);
          objc_msgSend(v5, "addObject:", (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i)));
        }
        v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }
  }
  else
  {
    v5 = 0;
  }
  return objc_msgSend(a1, "_internalSetAccessibilityAttributedUserInputLabels:", v5);
}

- (void)_internalSetAccessibilityAttributedUserInputLabels:()UIAccessibility
{
  objc_setAssociatedObject(a1, &AXUserInputLabelsIdentifier, a3, (void *)3);
}

- (id)accessibilityLanguage
{
  return objc_getAssociatedObject(a1, &AXLanguageIdentifier);
}

- (void)setAccessibilityRespondsToUserInteraction:()UIAccessibility
{
  objc_setAssociatedObject(a1, &AXRespondsToUserInteractionIdentifier, (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:"), (void *)1);
}

- (void)setShouldGroupAccessibilityChildren:()UIAccessibility
{
  objc_setAssociatedObject(a1, &AXShouldGroupChildren, (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:"), (void *)1);
}

- (void)setAccessibilityFrame:()UIAccessibility
{
  objc_setAssociatedObject(a1, &AXFrameIdentifier, (id)objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRect:"), (void *)1);
}

- (id)_internalAccessibilityAttributedValue
{
  return objc_getAssociatedObject(a1, &AXValueIdentifier);
}

- (uint64_t)accessibilityValue
{
  return objc_msgSend((id)objc_msgSend(a1, "_internalAccessibilityAttributedValue"), "string");
}

- (double)accessibilityActivationPoint
{
  id AssociatedObject;
  double result;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  CGRect v9;
  CGRect v10;

  AssociatedObject = objc_getAssociatedObject(a1, &AXActivationPointIdentifier);
  if (AssociatedObject)
  {
    objc_msgSend(AssociatedObject, "pointValue");
  }
  else
  {
    objc_msgSend(a1, "accessibilityFrame");
    x = v9.origin.x;
    y = v9.origin.y;
    width = v9.size.width;
    height = v9.size.height;
    MidX = CGRectGetMidX(v9);
    v10.origin.x = x;
    v10.origin.y = y;
    v10.size.width = width;
    v10.size.height = height;
    CGRectGetMidY(v10);
    return MidX;
  }
  return result;
}

- (double)accessibilityFrame
{
  id AssociatedObject;
  double result;

  AssociatedObject = objc_getAssociatedObject(a1, &AXFrameIdentifier);
  if (!AssociatedObject)
    return *MEMORY[0x1E0C9D648];
  objc_msgSend(AssociatedObject, "rectValue");
  return result;
}

- (id)accessibilityPath
{
  return objc_getAssociatedObject(a1, &AXPathIdentifier);
}

- (uint64_t)accessibilityViewIsModal
{
  return objc_msgSend((id)objc_msgSend(a1, "storedAccessibilityViewIsModal"), "BOOLValue");
}

- (uint64_t)shouldGroupAccessibilityChildren
{
  return objc_msgSend((id)objc_msgSend(a1, "storedShouldGroupAccessibilityChildren"), "BOOLValue");
}

- (uint64_t)accessibilityNavigationStyle
{
  return objc_msgSend((id)objc_msgSend(a1, "storedAccessibilityNavigationStyle"), "integerValue");
}

- (uint64_t)accessibilityRespondsToUserInteraction
{
  return objc_msgSend((id)objc_msgSend(a1, "storedAccessibilityRespondsToUserInteraction"), "BOOLValue");
}

- (id)storedShouldGroupAccessibilityChildren
{
  return objc_getAssociatedObject(a1, &AXShouldGroupChildren);
}

- (id)storedAccessibilityNavigationStyle
{
  return objc_getAssociatedObject(a1, &AXNavigationStyle);
}

- (id)storedAccessibilityViewIsModal
{
  return objc_getAssociatedObject(a1, &AXViewIsModalIdentifier);
}

- (id)storedAccessibilityTraits
{
  return objc_getAssociatedObject(a1, &AXTraitsIdentifier);
}

- (id)storedIsAccessibilityElement
{
  return objc_getAssociatedObject(a1, &AXIsElementIdentifier);
}

- (id)storedAccessibilityFrame
{
  return objc_getAssociatedObject(a1, &AXFrameIdentifier);
}

- (id)storedAccessibilityActivationPoint
{
  return objc_getAssociatedObject(a1, &AXActivationPointIdentifier);
}

- (id)storedAccessibilityRespondsToUserInteraction
{
  return objc_getAssociatedObject(a1, &AXRespondsToUserInteractionIdentifier);
}

- (id)storedAccessibilityDirectTouchOptions
{
  return objc_getAssociatedObject(a1, &AXDirectTouchOptionsIdentifier);
}

- (uint64_t)accessibilityHeaderElements
{
  id AssociatedObject;

  AssociatedObject = objc_getAssociatedObject(a1, &AXHeaderElementsIdentifier);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend(AssociatedObject, "allObjects");
  else
    return (uint64_t)AssociatedObject;
}

- (void)setAccessibilityPath:()UIAccessibility
{
  objc_setAssociatedObject(a1, &AXPathIdentifier, a3, (void *)1);
}

- (void)setAccessibilityActivationPoint:()UIAccessibility
{
  objc_setAssociatedObject(a1, &AXActivationPointIdentifier, (id)objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPoint:"), (void *)1);
}

- (void)setAccessibilityNavigationStyle:()UIAccessibility
{
  objc_setAssociatedObject(a1, &AXNavigationStyle, (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:"), (void *)1);
}

- (id)accessibilityTextualContext
{
  return objc_getAssociatedObject(a1, &AXTextualContextIdentifier);
}

- (void)setAccessibilityTextualContext:()UIAccessibility
{
  objc_setAssociatedObject(a1, &AXTextualContextIdentifier, a3, (void *)1);
}

- (uint64_t)accessibilityDirectTouchOptions
{
  return objc_msgSend(objc_getAssociatedObject(a1, &AXDirectTouchOptionsIdentifier), "unsignedIntegerValue");
}

- (void)setAccessibilityDirectTouchOptions:()UIAccessibility
{
  objc_setAssociatedObject(a1, &AXDirectTouchOptionsIdentifier, (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:"), (void *)1);
}

- (void)setAccessibilityHeaderElements:()UIAccessibility
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  objc_class *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!a3)
    goto LABEL_12;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = (void *)MEMORY[0x1E0C99DA0];
    v11 = *MEMORY[0x1E0C99778];
    v12 = (objc_class *)objc_opt_class();
    objc_msgSend(v10, "raise:format:", v11, CFSTR("accessibilityHeaderElements must be an NSArray. Was actually: %@"), NSStringFromClass(v12));
LABEL_12:
    v5 = 0;
    goto LABEL_13;
  }
  v5 = (void *)objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(a3);
        objc_msgSend(v5, "addPointer:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i));
      }
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }
LABEL_13:
  objc_setAssociatedObject(a1, &AXHeaderElementsIdentifier, v5, (void *)1);
}

- (uint64_t)setIsAccessibilityElementBlock:()UIAccessibility
{
  return objc_msgSend(a1, "_accessibilitySetReturnBlock:forAttribute:", a3, 0);
}

- (uint64_t)setAccessibilityValueBlock:()UIAccessibility
{
  return objc_msgSend(a1, "_accessibilitySetReturnBlock:forAttribute:", a3, 3);
}

- (uint64_t)setAccessibilityHintBlock:()UIAccessibility
{
  return objc_msgSend(a1, "_accessibilitySetReturnBlock:forAttribute:", a3, 2);
}

- (uint64_t)setAccessibilityTraitsBlock:()UIAccessibility
{
  return objc_msgSend(a1, "_accessibilitySetReturnBlock:forAttribute:", a3, 4);
}

- (uint64_t)setAccessibilityIdentifierBlock:()UIAccessibility
{
  return objc_msgSend(a1, "_accessibilitySetReturnBlock:forAttribute:", a3, 21);
}

- (uint64_t)setAccessibilityHeaderElementsBlock:()UIAccessibility
{
  return objc_msgSend(a1, "_accessibilitySetReturnBlock:forAttribute:", a3, 14);
}

- (uint64_t)setAccessibilityAttributedLabelBlock:()UIAccessibility
{
  return objc_msgSend(a1, "_accessibilitySetReturnBlock:forAttribute:", a3, 34);
}

- (uint64_t)setAccessibilityAttributedHintBlock:()UIAccessibility
{
  return objc_msgSend(a1, "_accessibilitySetReturnBlock:forAttribute:", a3, 35);
}

- (uint64_t)setAccessibilityLanguageBlock:()UIAccessibility
{
  return objc_msgSend(a1, "_accessibilitySetReturnBlock:forAttribute:", a3, 9);
}

- (uint64_t)setAccessibilityTextualContextBlock:()UIAccessibility
{
  return objc_msgSend(a1, "_accessibilitySetReturnBlock:forAttribute:", a3, 36);
}

- (uint64_t)setAccessibilityUserInputLabelsBlock:()UIAccessibility
{
  return objc_msgSend(a1, "_accessibilitySetReturnBlock:forAttribute:", a3, 37);
}

- (uint64_t)setAccessibilityAttributedUserInputLabelsBlock:()UIAccessibility
{
  return objc_msgSend(a1, "_accessibilitySetReturnBlock:forAttribute:", a3, 38);
}

- (uint64_t)setAccessibilityAttributedValueBlock:()UIAccessibility
{
  return objc_msgSend(a1, "_accessibilitySetReturnBlock:forAttribute:", a3, 39);
}

- (uint64_t)setAccessibilityElementsHiddenBlock:()UIAccessibility
{
  return objc_msgSend(a1, "_accessibilitySetReturnBlock:forAttribute:", a3, 10);
}

- (uint64_t)setAccessibilityRespondsToUserInteractionBlock:()UIAccessibility
{
  return objc_msgSend(a1, "_accessibilitySetReturnBlock:forAttribute:", a3, 41);
}

- (void)setAccessibilityExpandedStatus:()UIAccessibility
{
  objc_setAssociatedObject(a1, &AXExpandedStatusIdentifier, (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:"), (void *)1);
}

- (uint64_t)accessibilityExpandedStatus
{
  return objc_msgSend(objc_getAssociatedObject(a1, &AXExpandedStatusIdentifier), "integerValue");
}

- (uint64_t)setAccessibilityExpandedStatusBlock:()UIAccessibility
{
  return objc_msgSend(a1, "_accessibilitySetReturnBlock:forAttribute:", a3, 48);
}

- (uint64_t)accessibilityExpandedStatusBlock
{
  return objc_msgSend(a1, "_accessibilityGetBlockForAttribute:", 48);
}

- (uint64_t)setAccessibilityViewIsModalBlock:()UIAccessibility
{
  return objc_msgSend(a1, "_accessibilitySetReturnBlock:forAttribute:", a3, 11);
}

- (uint64_t)setAccessibilityShouldGroupAccessibilityChildrenBlock:()UIAccessibility
{
  return objc_msgSend(a1, "_accessibilitySetReturnBlock:forAttribute:", a3, 12);
}

- (uint64_t)setAccessibilityElementsBlock:()UIAccessibility
{
  return objc_msgSend(a1, "_accessibilitySetReturnBlock:forAttribute:", a3, 22);
}

- (uint64_t)setAccessibilityContainerTypeBlock:()UIAccessibility
{
  return objc_msgSend(a1, "_accessibilitySetReturnBlock:forAttribute:", a3, 43);
}

- (uint64_t)setAccessibilityActivationPointBlock:()UIAccessibility
{
  return objc_msgSend(a1, "_accessibilitySetReturnBlock:forAttribute:", a3, 8);
}

- (uint64_t)setAccessibilityFrameBlock:()UIAccessibility
{
  return objc_msgSend(a1, "_accessibilitySetReturnBlock:forAttribute:", a3, 6);
}

- (uint64_t)setAccessibilityNavigationStyleBlock:()UIAccessibility
{
  return objc_msgSend(a1, "_accessibilitySetReturnBlock:forAttribute:", a3, 13);
}

- (uint64_t)setAccessibilityPathBlock:()UIAccessibility
{
  return objc_msgSend(a1, "_accessibilitySetReturnBlock:forAttribute:", a3, 7);
}

- (uint64_t)setAccessibilityActivateBlock:()UIAccessibility
{
  return objc_msgSend(a1, "_accessibilitySetReturnBlock:forAttribute:", a3, 17);
}

- (uint64_t)setAccessibilityIncrementBlock:()UIAccessibility
{
  return objc_msgSend(a1, "_accessibilitySetReturnBlock:forAttribute:", a3, 18);
}

- (uint64_t)setAccessibilityDecrementBlock:()UIAccessibility
{
  return objc_msgSend(a1, "_accessibilitySetReturnBlock:forAttribute:", a3, 19);
}

- (uint64_t)setAccessibilityPerformEscapeBlock:()UIAccessibility
{
  return objc_msgSend(a1, "_accessibilitySetReturnBlock:forAttribute:", a3, 25);
}

- (uint64_t)setAccessibilityMagicTapBlock:()UIAccessibility
{
  return objc_msgSend(a1, "_accessibilitySetReturnBlock:forAttribute:", a3, 44);
}

- (uint64_t)setAccessibilityPreviousTextNavigationElementBlock:()UIAccessibility
{
  return objc_msgSend(a1, "_accessibilitySetReturnBlock:forAttribute:", a3, 46);
}

- (uint64_t)setAccessibilityNextTextNavigationElementBlock:()UIAccessibility
{
  return objc_msgSend(a1, "_accessibilitySetReturnBlock:forAttribute:", a3, 47);
}

- (id)accessibilityPreviousTextNavigationElement
{
  return objc_getAssociatedObject(a1, &AXPreviousTextNavigationElementIdentifier);
}

- (void)setAccessibilityPreviousTextNavigationElement:()UIAccessibility
{
  objc_setAssociatedObject(a1, &AXPreviousTextNavigationElementIdentifier, a3, (void *)1);
}

- (id)accessibilityNextTextNavigationElement
{
  return objc_getAssociatedObject(a1, &AXNextTextNavigationElementIdentifier);
}

- (void)setAccessibilityNextTextNavigationElement:()UIAccessibility
{
  objc_setAssociatedObject(a1, &AXNextTextNavigationElementIdentifier, a3, (void *)1);
}

- (id)storedAccessibilityPreviousTextNavigationElement
{
  return objc_getAssociatedObject(a1, &AXPreviousTextNavigationElementIdentifier);
}

- (id)storedAccessibilityNextTextNavigationElement
{
  return objc_getAssociatedObject(a1, &AXNextTextNavigationElementIdentifier);
}

@end
