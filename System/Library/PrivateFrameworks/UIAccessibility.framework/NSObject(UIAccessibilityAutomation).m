@implementation NSObject(UIAccessibilityAutomation)

- (uint64_t)setAutomationCustomProperties:()UIAccessibilityAutomation
{
  return objc_msgSend(a1, "_accessibilitySetRetainedValue:forKey:", a3, CFSTR("automationCustomProperties"));
}

- (uint64_t)automationCustomProperties
{
  return objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("automationCustomProperties"));
}

- (uint64_t)setAutomationSystemProperties:()UIAccessibilityAutomation
{
  return objc_msgSend(a1, "_accessibilitySetRetainedValue:forKey:", a3, CFSTR("automationSystemProperties"));
}

- (uint64_t)automationSystemProperties
{
  return objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("automationSystemProperties"));
}

- (uint64_t)_accessibilityUserTestingIsDefaultButton
{
  return 0;
}

- (uint64_t)_accessibilityUserTestingIsCancelButton
{
  return 0;
}

- (uint64_t)_accessibilityUserTestingIsDestructiveButton
{
  return 0;
}

- (uint64_t)_accessibilityUserTestingIsPreferredButton
{
  return 0;
}

- (BOOL)_accessibilityUserTestingIsBackNavButton
{
  uint64_t v1;

  v1 = objc_msgSend(a1, "accessibilityTraits");
  return (UIAccessibilityTraitBackButton & ~v1) == 0;
}

- (uint64_t)_accessibilityUserTestingIsRightNavButton
{
  return 0;
}

- (uint64_t)_accessibilityKeyboardKeyEnteredString
{
  return 0;
}

- (uint64_t)_accessibilityUserTestingIsContinuityButton
{
  return 0;
}

- (id)_accessibilityUserTestingElementAttributes
{
  void *v2;
  const __CFString *v3;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1, "_accessibilityUserTestingIsContinuityButton"))
    objc_msgSend(v2, "addObject:", CFSTR("continuity-button"));
  if (objc_msgSend(a1, "_accessibilityUserTestingIsDefaultButton"))
    objc_msgSend(v2, "addObject:", CFSTR("default-button"));
  if (objc_msgSend(a1, "_accessibilityUserTestingIsCancelButton"))
    objc_msgSend(v2, "addObject:", CFSTR("cancel-button"));
  if (objc_msgSend(a1, "_accessibilityUserTestingIsDestructiveButton"))
    objc_msgSend(v2, "addObject:", CFSTR("destructive-button"));
  if (objc_msgSend(a1, "_accessibilityUserTestingIsPreferredButton"))
    objc_msgSend(v2, "addObject:", CFSTR("preferred-button"));
  if ((objc_msgSend(a1, "_accessibilityUserTestingIsBackNavButton") & 1) != 0)
  {
    v3 = CFSTR("back-nav-button");
  }
  else
  {
    if (!objc_msgSend(a1, "_accessibilityUserTestingIsRightNavButton"))
      goto LABEL_16;
    v3 = CFSTR("right-nav-button");
  }
  objc_msgSend(v2, "addObject:", v3);
LABEL_16:
  if (objc_msgSend(a1, "_accessibilityHasDragSources"))
    objc_msgSend(v2, "addObject:", CFSTR("drag-source"));
  if (objc_msgSend(a1, "_accessibilityHasDragDestinations"))
    objc_msgSend(v2, "addObject:", CFSTR("drag-destination"));
  return v2;
}

- (id)_accessibilityUserTestingElementBaseType
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  if ((void *)v2 == v0)
  {
LABEL_5:

  }
  else
  {
    v3 = (void *)v2;
    while (1)
    {
      v4 = objc_opt_class();

      if (v1 == (void *)v4)
        break;
      v1 = (void *)objc_msgSend(v1, "superclass");
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", v1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (v3 == v0)
        goto LABEL_5;
    }
  }
  NSStringFromClass((Class)v1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_setAccessibilityAutomationType:()UIAccessibilityAutomation
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilitySetRetainedValue:forKey:", v2, CFSTR("AXAutomationType"));

}

- (uint64_t)_accessibilityAutomationType
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("AXAutomationType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  if (!v3)
  {
    v4 = objc_msgSend(a1, "accessibilityTraits");
    if ((*MEMORY[0x1E0CEB110] & ~v4) != 0)
    {
      if ((*MEMORY[0x1E0CEB158] & ~v4) != 0)
      {
        if ((*MEMORY[0x1E0CEB170] & ~v4) != 0)
        {
          if ((*MEMORY[0x1E0CEB128] & ~v4) != 0)
          {
            if ((*MEMORY[0x1E0CEB138] & ~v4) != 0)
            {
              if ((*MEMORY[0x1E0CEB130] & ~v4) != 0)
                return 0;
              else
                return 20;
            }
            else
            {
              return 42;
            }
          }
          else
          {
            return 43;
          }
        }
        else
        {
          return 48;
        }
      }
      else
      {
        return 45;
      }
    }
    else if ((*MEMORY[0x1E0CEB188] & ~v4) != 0)
    {
      return 9;
    }
    else
    {
      return 40;
    }
  }
  return v3;
}

- (uint64_t)_accessibilityAbsoluteValue
{
  return 0;
}

- (double)_accessibilityMinValue
{
  return 0.0;
}

- (double)_accessibilityMaxValue
{
  return 0.0;
}

- (NSString)_accessibilityUserTestingElementType
{
  objc_class *v0;

  v0 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v0);
}

- (id)_accessibilityUserTestingParent
{
  const __AXUIElement *v3;
  void *v4;
  void *v5;
  CFTypeRef value;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(a1, "onClientSide") & 1) == 0)
  {
    v3 = (const __AXUIElement *)_AXCreateAXUIElementWithElement();
    value = 0;
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "machPort"))
    {
      objc_msgSend(v4, "machPort");
      _AXUIElementSetMachPortForNextMessage();
      AXUIElementCopyAttributeValue(v3, (CFStringRef)0x138A, &value);
      if (v3)
        CFRelease(v3);
    }
    else
    {
      if (v3)
        CFRelease(v3);
      value = (CFTypeRef)MEMORY[0x1A1ADCA48](objc_msgSend(a1, "remotePid"), objc_msgSend(a1, "uuidHash"), 9999);
    }
    v5 = (void *)value;

    return v5;
  }
  else
  {
    objc_msgSend(a1, "accessibilityContainer");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)_accessibilityAncestry
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  const __AXUIElement *v8;
  void *v9;
  void *v10;
  CFTypeRef value;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = a1;
  if (v3)
  {
    while (1)
    {
      objc_msgSend(v2, "addObject:", v3);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v3, "onClientSide") & 1) == 0)
        break;
      objc_msgSend(v3, "_accessibilityUserTestingParent");
      v4 = objc_claimAutoreleasedReturnValue();

      v3 = (id)v4;
      if (!v4)
        goto LABEL_5;
    }
    if (objc_msgSend(v3, "machPort"))
    {
      v8 = (const __AXUIElement *)_AXCreateAXUIElementWithElement();
      value = 0;
      if (AXUIElementCopyAttributeValue(v8, (CFStringRef)0x13A1, &value) == kAXErrorSuccess)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend((id)value, "reverseObjectEnumerator");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "allObjects");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObjectsFromArray:", v10);

        }
      }
      if (value)
      {
        CFRelease(value);
        value = 0;
      }
      if (v8)
        CFRelease(v8);
    }
  }
LABEL_5:
  objc_msgSend(v2, "reverseObjectEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_accessibilityUserTestingSupplementaryViews:()UIAccessibilityAutomation
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  _QWORD v14[4];
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((a3 & 1) != 0)
    objc_msgSend(a1, "_accessibilitySupplementaryHeaderViews");
  else
    objc_msgSend(a1, "_accessibilitySupplementaryFooterViews");
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    v10 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v12, "_accessibilityHasOrderedChildren"))
        {
          v14[0] = v10;
          v14[1] = 3221225472;
          v14[2] = __83__NSObject_UIAccessibilityAutomation___accessibilityUserTestingSupplementaryViews___block_invoke;
          v14[3] = &unk_1E3DFE428;
          v15 = v5;
          objc_msgSend(v12, "accessibilityEnumerateContainerElementsUsingBlock:", v14);

        }
        else
        {
          objc_msgSend(v5, "addObject:", v12);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  return v5;
}

- (uint64_t)_accessibilityUserTestingChildrenCount
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = objc_msgSend(a1, "_accessibilityBoolValueForKey:", CFSTR("AXPerformingChildrenCount"));
  objc_msgSend(a1, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("AXPerformingChildrenCount"));
  if (objc_msgSend(a1, "_accessibilityHasOrderedChildren"))
  {
    objc_msgSend(a1, "_accessibilityUserTestingSupplementaryViews:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_accessibilityUserTestingSupplementaryViews:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "count");
    v6 = objc_msgSend(v4, "count");
    v7 = v6 + objc_msgSend(a1, "accessibilityElementCount") + v5;

  }
  else
  {
    objc_msgSend(a1, "automationElements");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v3, "count");
  }

  objc_msgSend(a1, "_accessibilitySetBoolValue:forKey:", v2, CFSTR("AXPerformingChildrenCount"));
  return v7;
}

- (id)_accessibilityUserTestingChildrenWithRange:()UIAccessibilityAutomation
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  int64_t v15;
  void *v16;
  void *v17;
  void *v18;

  if ((objc_msgSend(a1, "_accessibilityHasOrderedChildren") & 1) != 0)
  {
    objc_msgSend(a1, "_accessibilityUserTestingSupplementaryViews:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(a1, "accessibilityShouldEnumerateContainerElementsArrayDirectly")
      && (objc_msgSend(a1, "_accessibilityElements"), (v8 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v9 = v8;
      v10 = objc_msgSend(v8, "count");
      v11 = 0;
    }
    else
    {
      v10 = objc_msgSend(a1, "accessibilityElementCount");
      v9 = 0;
      v11 = 1;
    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3 < objc_msgSend(v7, "count"))
    {
      v13 = a4;
      if (a3 + a4 > objc_msgSend(v7, "count"))
        v13 = objc_msgSend(v7, "count") - a3;
      if (v13 >= 1)
      {
        objc_msgSend(v7, "subarrayWithRange:", a3, v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObjectsFromArray:", v14);

        a3 = 0;
        a4 -= v13;
      }
    }
    if (a4)
    {
      if ((uint64_t)a3 >= v10 || a4 < 1)
        goto LABEL_25;
      v15 = a3;
      do
      {
        if (v11)
          objc_msgSend(a1, "accessibilityElementAtIndex:", v15);
        else
          objc_msgSend(v9, "objectAtIndex:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          objc_msgSend(v12, "addObject:", v16);
          a3 = 0;
          --a4;
        }

        ++v15;
      }
      while (v15 < v10 && a4);
      if (a4)
      {
LABEL_25:
        objc_msgSend(a1, "_accessibilityUserTestingSupplementaryViews:", 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (a3 < objc_msgSend(v17, "count"))
        {
          if (a3 + a4 > objc_msgSend(v17, "count"))
            a4 = objc_msgSend(v17, "count") - a3;
          if (a4 >= 1)
          {
            objc_msgSend(v17, "subarrayWithRange:", a3, a4);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "addObjectsFromArray:", v18);

          }
        }

      }
    }

  }
  else
  {
    objc_msgSend(a1, "automationElements");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3 + a4 <= objc_msgSend(v7, "count"))
    {
      objc_msgSend(v7, "subarrayWithRange:", a3, a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
  }

  return v12;
}

- (uint64_t)_setAccessibilityFauxCollectionViewCellsDisabled:()UIAccessibilityAutomation
{
  return objc_msgSend((id)*MEMORY[0x1E0CEB258], "_accessibilitySetBoolValue:forKey:", a3, CFSTR("DisableFauxCollectionViewCells"));
}

- (uint64_t)_accessibilityFauxCollectionViewCellsDisabled
{
  return objc_msgSend((id)*MEMORY[0x1E0CEB258], "_accessibilityBoolValueForKey:", CFSTR("DisableFauxCollectionViewCells"));
}

- (uint64_t)_setAccessibilityFauxTableViewCellsDisabled:()UIAccessibilityAutomation
{
  return objc_msgSend((id)*MEMORY[0x1E0CEB258], "_accessibilitySetBoolValue:forKey:", a3, CFSTR("DisableFauxTableViewCells"));
}

- (uint64_t)_accessibilityFauxTableViewCellsDisabled
{
  return objc_msgSend((id)*MEMORY[0x1E0CEB258], "_accessibilityBoolValueForKey:", CFSTR("DisableFauxTableViewCells"));
}

- (id)_accessibilityBaseImplementationUserTestingChildren
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[4];
  id v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilityUserTestingSupplementaryViews:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "axSafelyAddObjectsFromArray:", v3);

  if ((objc_msgSend(a1, "isAccessibilityElement") & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_16;
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    objc_msgSend(a1, "subviews", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(v9, "accessibilityIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10)
            objc_msgSend(v2, "addObject:", v9);
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
      }
      while (v6);
    }
  }
  else
  {
    if (!objc_msgSend(a1, "_accessibilityHasOrderedChildren"))
      goto LABEL_16;
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __90__NSObject_UIAccessibilityAutomation___accessibilityBaseImplementationUserTestingChildren__block_invoke;
    v18[3] = &unk_1E3DFE428;
    v19 = v2;
    objc_msgSend(a1, "accessibilityEnumerateContainerElementsUsingBlock:", v18);
    v4 = v19;
  }

LABEL_16:
  objc_msgSend(a1, "_accessibilityUserTestingSupplementaryViews:", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "axSafelyAddObjectsFromArray:", v11);

  if ((objc_msgSend(a1, "_accessibilityTextViewShouldBreakUpParagraphs") & 1) == 0)
  {
    objc_msgSend(a1, "_accessibilityInternalTextLinks");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "axSafelyAddObjectsFromArray:", v12);

  }
  return v2;
}

- (uint64_t)_accessibilityUserTestingIsElementClassAcceptable
{
  char isKindOfClass;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (NSClassFromString(CFSTR("WebAccessibilityObjectWrapper")), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (NSClassFromString(CFSTR("WKAccessibilityWebPageObject")), (objc_opt_isKindOfClass() & 1) != 0)
    || (NSClassFromString(CFSTR("SBIcon")), (objc_opt_isKindOfClass() & 1) != 0))
  {
    isKindOfClass = 1;
  }
  else
  {
    NSClassFromString(CFSTR("SBIconListModel"));
    isKindOfClass = objc_opt_isKindOfClass();
  }
  return isKindOfClass & 1;
}

- (id)_accessibilityUserTestingSnapshotDescendantsWithAttributes:()UIAccessibilityAutomation maxDepth:maxChildren:maxArrayCount:honorsModalViews:
{
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v25;
  unint64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  id v42;
  id v44;
  id v45;
  int v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id obj;
  unint64_t v53;
  uint64_t v55;
  uint64_t v56;
  void *v58;
  void *context;
  _QWORD v60[4];
  id v61;
  id v62;
  unint64_t v63;
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  void *v69;
  uint8_t buf[4];
  uint64_t v71;
  __int16 v72;
  void *v73;
  _BYTE v74[128];
  _QWORD v75[4];

  v75[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void *)objc_opt_new();
  v10 = (void *)_AXCreateAXUIElementWithElement();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("UIAccessibilitySnapshotKeyElement"));

  AXLogUIA();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[NSObject(UIAccessibilityAutomation) _accessibilityUserTestingSnapshotDescendantsWithAttributes:maxDepth:maxChildren:maxArrayCount:honorsModalViews:].cold.1();

  v44 = v9;
  v75[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v75, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  v14 = 0;
  if (objc_msgSend(v13, "count"))
  {
    v53 = 1;
    v45 = v8;
    v46 = a7;
    do
    {
      v15 = v13;

      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v50 = (void *)objc_claimAutoreleasedReturnValue();

      v67 = 0u;
      v68 = 0u;
      v65 = 0u;
      v66 = 0u;
      v14 = v15;
      v56 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
      if (v56)
      {
        v55 = *(_QWORD *)v66;
        obj = v14;
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v66 != v55)
              objc_enumerationMutation(obj);
            v17 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v16);
            context = (void *)MEMORY[0x1A1ADCDB4]();
            objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("UIAccessibilitySnapshotKeyElement"));
            v18 = objc_claimAutoreleasedReturnValue();
            AXLogUIA();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138477827;
              v71 = v18;
              _os_log_debug_impl(&dword_19D0DD000, v19, OS_LOG_TYPE_DEBUG, "Current snapshot element: %{private}@", buf, 0xCu);
            }

            _UIAXElementForAXUIElementRef();
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            AXLogUIA();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 134217984;
              v71 = (uint64_t)v20;
              _os_log_debug_impl(&dword_19D0DD000, v21, OS_LOG_TYPE_DEBUG, "Snapshot element going out:%p", buf, 0xCu);
            }

            AXLogUIA();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              v71 = (uint64_t)v20;
              _os_log_debug_impl(&dword_19D0DD000, v22, OS_LOG_TYPE_DEBUG, "Current snapshot element: %{public}@", buf, 0xCu);
            }
            v58 = (void *)v18;

            v64 = 0;
            _accessibilityAttributesForObject(v20, v8, a6, 1, &v64);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = v64;
            objc_msgSend(v17, "setObject:forKeyedSubscript:", v23, CFSTR("UIAccessibilitySnapshotKeyAttributes"));
            if (v24)
              objc_msgSend(v17, "setObject:forKeyedSubscript:", v24, CFSTR("UIAccessibilitySnapshotKeyAttributeArrayCounts"));
            objc_msgSend(v20, "_iosAccessibilityAttributeValue:", 5030);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "integerValue");

            AXLogUIA();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543618;
              v71 = (uint64_t)v20;
              v72 = 1026;
              LODWORD(v73) = v26;
              _os_log_debug_impl(&dword_19D0DD000, v27, OS_LOG_TYPE_DEBUG, "Current %{public}@ snapshot child count: %{public}d", buf, 0x12u);
            }

            if (v26 <= a5)
            {
              objc_msgSend(v20, "_iosAccessibilityAttributeValue:", 5001);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v29, "count"));
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", 0);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "_iosAccessibilityAttributeValue:forParameter:", 95003, v28);
              v29 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v26);
            }
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setObject:forKeyedSubscript:", v30, CFSTR("UIAccessibilitySnapshotKeyChildrenCount"));

            AXLogUIA();
            v31 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543618;
              v71 = (uint64_t)v20;
              v72 = 2114;
              v73 = v29;
              _os_log_debug_impl(&dword_19D0DD000, v31, OS_LOG_TYPE_DEBUG, "Current snapshot (%{public}@) children: %{public}@", buf, 0x16u);
            }

            if (objc_msgSend(v29, "count") && v53 < a4)
            {
              objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v29, "count"));
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              if (a7)
              {
                objc_msgSend(v29, "indexesOfObjectsPassingTest:", &__block_literal_global_250);
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v29, "objectsAtIndexes:");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                AXLogUIA();
                v34 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  v71 = (uint64_t)v33;
                  _os_log_impl(&dword_19D0DD000, v34, OS_LOG_TYPE_INFO, "Possible modal views: %@", buf, 0xCu);
                }

                v48 = v33;
                objc_msgSend(v33, "lastObject");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                v36 = v35;
                if (v35)
                {
                  v47 = v23;
                  objc_msgSend(v35, "_accessibilityObscuredScreenAllowedViews");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();
                  AXLogUIA();
                  v38 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412546;
                    v71 = (uint64_t)v36;
                    v72 = 2112;
                    v73 = v37;
                    _os_log_impl(&dword_19D0DD000, v38, OS_LOG_TYPE_INFO, "found a modal child and honor modal views: %@ [but allowing these through: %@]", buf, 0x16u);
                  }

                  v39 = (void *)MEMORY[0x1E0C99D20];
                  v69 = v36;
                  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v69, 1);
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v39, "axArrayWithPossiblyNilArrays:", 2, v40, v37);
                  v41 = objc_claimAutoreleasedReturnValue();

                  v29 = (void *)v41;
                  v8 = v45;
                  v23 = v47;
                }

                a7 = v46;
              }
              objc_msgSend(v17, "setObject:forKeyedSubscript:", v32, CFSTR("UIAccessibilitySnapshotKeyChildren"));
              v60[0] = MEMORY[0x1E0C809B0];
              v60[1] = 3221225472;
              v60[2] = __150__NSObject_UIAccessibilityAutomation___accessibilityUserTestingSnapshotDescendantsWithAttributes_maxDepth_maxChildren_maxArrayCount_honorsModalViews___block_invoke_253;
              v60[3] = &unk_1E3DFF828;
              v63 = a5;
              v61 = v32;
              v62 = v50;
              v42 = v32;
              objc_msgSend(v29, "enumerateObjectsUsingBlock:", v60);

            }
            else
            {
              objc_msgSend(v17, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AA60], CFSTR("UIAccessibilitySnapshotKeyChildren"));
            }

            objc_autoreleasePoolPop(context);
            ++v16;
          }
          while (v56 != v16);
          v14 = obj;
          v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v74, 16);
        }
        while (v56);
      }

      ++v53;
      v13 = v50;
    }
    while (objc_msgSend(v50, "count"));
  }

  return v44;
}

- (id)_accessibilityUserTestingSnapshotAncestorsWithAttributes:()UIAccessibilityAutomation maxDepth:maxChildren:maxArrayCount:honorsModalViews:
{
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  id v42;
  id v43;
  void *v44;
  id v45;
  int v46;
  void *v47;
  void *context;
  _QWORD v51[4];
  id v52;
  id v53;
  id v54;
  unint64_t v55;
  unint64_t v56;
  id v57;
  void *v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)_AXCreateAXUIElementWithElement();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("UIAccessibilitySnapshotKeyElement"));

  AXLogUIA();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    -[NSObject(UIAccessibilityAutomation) _accessibilityUserTestingSnapshotDescendantsWithAttributes:maxDepth:maxChildren:maxArrayCount:honorsModalViews:].cold.1();

  v13 = a1;
  v14 = v10;
  v42 = v14;
  if (v14)
  {
    v47 = v13;
    v15 = v14;
    v43 = v9;
    v46 = a7;
    do
    {
      context = (void *)MEMORY[0x1A1ADCDB4]();
      v57 = 0;
      _accessibilityAttributesForObject(v13, v9, a6, 1, &v57);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v57;
      v18 = objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, CFSTR("UIAccessibilitySnapshotKeyAttributes"));
      if (v17)
        v18 = objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, CFSTR("UIAccessibilitySnapshotKeyAttributeArrayCounts"));
      if (a5)
      {
        objc_msgSend(v13, "_iosAccessibilityAttributeValue:", 5030);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setObject:forKeyedSubscript:", v19, CFSTR("UIAccessibilitySnapshotKeyChildrenCount"));
        v20 = objc_msgSend(v19, "integerValue");
        if (v20 >= a5)
          v21 = a5;
        else
          v21 = v20;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", 0, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "_iosAccessibilityAttributeValue:forParameter:", 95003, v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v23, "count"))
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v23, "count"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          AXLogUIA();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v60) = a7;
            _os_log_impl(&dword_19D0DD000, v25, OS_LOG_TYPE_INFO, "Modally? %d", buf, 8u);
          }

          if (a7)
          {
            objc_msgSend(v23, "ax_filteredArrayUsingBlock:", &__block_literal_global_254);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "firstObject");
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            if (v27)
            {
              v44 = v24;
              objc_msgSend(v27, "_accessibilityObscuredScreenAllowedViews");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              AXLogUIA();
              v29 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                v60 = v27;
                v61 = 2112;
                v62 = v28;
                _os_log_impl(&dword_19D0DD000, v29, OS_LOG_TYPE_INFO, "found a modal child and honor modal views: %@ [but allowing these through: %@]", buf, 0x16u);
              }

              v30 = (void *)MEMORY[0x1E0C99D20];
              v58 = v27;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v58, 1);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "axArrayWithPossiblyNilArrays:", 2, v31, v28);
              v32 = objc_claimAutoreleasedReturnValue();

              v23 = (void *)v32;
              v9 = v43;
              v24 = v44;
            }

            a7 = v46;
          }
          v51[0] = MEMORY[0x1E0C809B0];
          v51[1] = 3221225472;
          v51[2] = __148__NSObject_UIAccessibilityAutomation___accessibilityUserTestingSnapshotAncestorsWithAttributes_maxDepth_maxChildren_maxArrayCount_honorsModalViews___block_invoke_255;
          v51[3] = &unk_1E3DFF870;
          v55 = a5;
          v52 = v9;
          v56 = a6;
          v53 = v17;
          v54 = v24;
          v33 = v24;
          objc_msgSend(v23, "enumerateObjectsUsingBlock:", v51);
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v33, CFSTR("UIAccessibilitySnapshotKeyChildren"));

        }
      }
      v34 = (void *)MEMORY[0x1A1ADCDB4](v18);
      objc_msgSend(v47, "_iosAccessibilityAttributeValue:", 5002);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      if (v35)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = (void *)_AXCreateAXUIElementWithElement();
        objc_msgSend(v36, "setObject:forKeyedSubscript:", v37, CFSTR("UIAccessibilitySnapshotKeyElement"));

        AXLogUIA();
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        {
          v39 = (void *)objc_opt_class();
          v45 = v39;
          objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("UIAccessibilitySnapshotKeyElement"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138478083;
          v60 = v39;
          a7 = v46;
          v61 = 2113;
          v62 = v40;
          _os_log_debug_impl(&dword_19D0DD000, v38, OS_LOG_TYPE_DEBUG, "Setting parent snapshot element: %{private}@, %{private}@", buf, 0x16u);

          v9 = v43;
        }

        objc_msgSend(v15, "setObject:forKeyedSubscript:", v36, CFSTR("UIAccessibilitySnapshotKeyParent"));
      }
      else
      {
        v36 = 0;
      }

      objc_autoreleasePoolPop(v34);
      objc_autoreleasePoolPop(context);
      v13 = v35;
      v15 = v36;
    }
    while (v36);
  }
  else
  {
    v35 = v13;
  }

  return v42;
}

- (id)_accessibilityUserTestingSnapshotWithOptions:()UIAccessibilityAutomation
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  NSObject *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t v26[16];
  uint8_t buf[16];

  v4 = a3;
  AXLogUIA();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_19D0DD000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "UIAccessibilityAutomation-UserTestingSnapshot", (const char *)&unk_19D149A3A, buf, 2u);
  }

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("attributes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("maxDepth"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("maxChildren"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("maxArrayCount"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("traverseFromParentsToChildren"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("snapshotKeyHonorModalViews"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_272);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "filterUsingPredicate:", v13);
    if (objc_msgSend(v7, "count"))
    {
      v25 = objc_msgSend(v8, "unsignedIntegerValue");
      v24 = objc_msgSend(v9, "unsignedIntegerValue");
      v23 = objc_msgSend(v10, "unsignedIntegerValue");
      v14 = objc_msgSend(v11, "BOOLValue");
      if (v12 || AXRequestingClient() != 2)
        v15 = objc_msgSend(v12, "BOOLValue");
      else
        v15 = 1;
      if (v14)
        objc_msgSend(a1, "_accessibilityUserTestingSnapshotDescendantsWithAttributes:maxDepth:maxChildren:maxArrayCount:honorsModalViews:", v7, v25, v24, v23, v15);
      else
        objc_msgSend(a1, "_accessibilityUserTestingSnapshotAncestorsWithAttributes:maxDepth:maxChildren:maxArrayCount:honorsModalViews:", v7, v25, v24, v23, v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }
  v17 = v16;
  v18 = v4;
  if (_accessibilityPluginPostProcessAutomationData_onceToken != -1)
    dispatch_once(&_accessibilityPluginPostProcessAutomationData_onceToken, &__block_literal_global_331);
  if ((_accessibilityPluginPostProcessAutomationData_Loaded & 1) != 0)
  {
    objc_msgSend((id)_accessibilityPluginPostProcessAutomationData_Processor, "performSelector:withObject:withObject:", sel_processSnapshot_options_, v17, v18);
    v19 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = v17;
  }
  v20 = v19;

  AXLogUIA();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v21))
  {
    *(_WORD *)v26 = 0;
    _os_signpost_emit_with_name_impl(&dword_19D0DD000, v21, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "UIAccessibilityAutomation-UserTestingSnapshot", (const char *)&unk_19D149A3A, v26, 2u);
  }

  return v20;
}

- (id)_accessibilityUserTestingSnapshot
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[5];
  _QWORD v8[6];

  v8[5] = *MEMORY[0x1E0C80C00];
  if (_defaultSnapshotAttributes_onceToken != -1)
    dispatch_once(&_defaultSnapshotAttributes_onceToken, &__block_literal_global_335);
  v2 = (id)_defaultSnapshotAttributes_defaultAttributes;
  if (_AXSVoiceOverTouchEnabled() || UIAccessibilityIsSwitchControlRunning())
  {
    objc_msgSend(v2, "arrayByAddingObject:", &unk_1E3E10970);
    v3 = objc_claimAutoreleasedReturnValue();

    v2 = (id)v3;
  }
  v7[0] = CFSTR("attributes");
  v7[1] = CFSTR("maxDepth");
  v8[0] = v2;
  v8[1] = &unk_1E3E10988;
  v7[2] = CFSTR("maxChildren");
  v7[3] = CFSTR("maxArrayCount");
  v8[2] = &unk_1E3E10988;
  v8[3] = &unk_1E3E10988;
  v7[4] = CFSTR("traverseFromParentsToChildren");
  v8[4] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilityUserTestingSnapshotWithOptions:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_accessibilityUserTestingSnapshotDescendantsWithAttributes:()UIAccessibilityAutomation maxDepth:maxChildren:maxArrayCount:honorsModalViews:.cold.1()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_10();
  v1 = (void *)OUTLINED_FUNCTION_3_1();
  v2 = OUTLINED_FUNCTION_6_0(v1);
  objc_msgSend(v0, "objectForKeyedSubscript:", CFSTR("UIAccessibilitySnapshotKeyElement"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_4(&dword_19D0DD000, v4, v5, "Setting root snapshot element: %{private}@, %{private}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

@end
