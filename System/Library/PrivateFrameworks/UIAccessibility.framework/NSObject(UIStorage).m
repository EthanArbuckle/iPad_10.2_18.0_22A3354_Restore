@implementation NSObject(UIStorage)

- (uint64_t)_setAccessibilityElementsHiddenBlock:()UIStorage
{
  return objc_msgSend(a1, "_accessibilitySetBlock:forAttribute:", a3, 10);
}

- (uint64_t)_setAccessibilityValueBlock:()UIStorage
{
  return objc_msgSend(a1, "_accessibilitySetBlock:forAttribute:", a3, 3);
}

- (uint64_t)_setAccessibilityLabelBlock:()UIStorage
{
  return objc_msgSend(a1, "_accessibilitySetBlock:forAttribute:", a3, 1);
}

- (void)_accessibilitySetBlock:()UIStorage forAttribute:
{
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("AccessibilityAttributeBlockStorageKey"));
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_accessibilitySetRetainedValue:forKey:", v12, CFSTR("AccessibilityAttributeBlockStorageKey"));
    v7 = (uint64_t)v12;
  }
  v13 = (id)v7;
  if (a3)
  {
    v8 = _Block_copy(a3);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v8, v9);

    _Block_release(v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeObjectForKey:", v10);

    if (!objc_msgSend(v13, "count"))
    {
      objc_msgSend(a1, "_accessibilityRemoveValueForKey:", CFSTR("AccessibilityAttributeBlockStorageKey"));

      v11 = 0;
      goto LABEL_7;
    }
  }
  v11 = v13;
LABEL_7:

}

- (uint64_t)_setAccessibilityElementsBlock:()UIStorage
{
  return objc_msgSend(a1, "_accessibilitySetBlock:forAttribute:", a3, 22);
}

- (uint64_t)_setAccessibilityViewIsModalBlock:()UIStorage
{
  return objc_msgSend(a1, "_accessibilitySetBlock:forAttribute:", a3, 11);
}

- (void)_accessibilitySetActionBlock:()UIStorage withValue:forKey:
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("AccessibilityActionBlockStorageKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("AccessibilityActionBlockParameterStorageKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_accessibilitySetRetainedValue:forKey:", v10, CFSTR("AccessibilityActionBlockStorageKey"));
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "_accessibilitySetRetainedValue:forKey:", v12, CFSTR("AccessibilityActionBlockParameterStorageKey"));
    v11 = (void *)v12;
  }
  if (v16)
  {
    v13 = (void *)objc_msgSend(v16, "copy");
    v14 = _Block_copy(v13);
    objc_msgSend(v10, "setObject:forKey:", v14, v9);

    if (v8)
    {
      objc_msgSend(v11, "setObject:forKey:", v8, v9);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v15, v9);

    }
  }
  else
  {
    objc_msgSend(v10, "removeObjectForKey:", v9);
    objc_msgSend(v11, "removeObjectForKey:", v9);
  }

}

- (uint64_t)_accessibilityInternalHandleStartStopToggle
{
  void *v2;
  char v3;
  void *v4;
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  void *v14;
  NSObject *v15;
  os_log_type_t v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  char v21;
  void *v22;
  NSObject *v23;
  os_log_type_t v24;
  void *v25;
  void *v26;
  char v27;
  void *v28;
  char v29;
  void *v30;
  NSObject *v31;
  os_log_type_t v32;
  void *v33;
  objc_class *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v39;
  char v40;
  void *v41;
  NSObject *v42;
  os_log_type_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint8_t buf[4];
  void *v52;
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CF39D0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "ignoreLogging");

  if ((v3 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CF39D0], "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v5 = objc_claimAutoreleasedReturnValue();

    v6 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v5, v6))
    {
      AXColorizeFormatLog();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_accessibilityApplication");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      _AXStringForArgs();
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v5, v6))
      {
        *(_DWORD *)buf = 138543362;
        v52 = v10;
        _os_log_impl(&dword_19D0DD000, v5, v6, "%{public}@", buf, 0xCu);
      }

    }
  }
  v11 = objc_msgSend(a1, "_accessibilityHandleMagicTapForPronunciation", v46);
  objc_msgSend(MEMORY[0x1E0CF39D0], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "ignoreLogging");

  if ((v13 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CF39D0], "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v15 = objc_claimAutoreleasedReturnValue();

    v16 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v15, v16))
    {
      AXColorizeFormatLog();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBOOL();
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      _AXStringForArgs();
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v15, v16))
      {
        *(_DWORD *)buf = 138543362;
        v52 = v18;
        _os_log_impl(&dword_19D0DD000, v15, v16, "%{public}@", buf, 0xCu);
      }

    }
  }
  if ((v11 & 1) != 0)
    return 1;
  v19 = objc_msgSend(a1, "accessibilityStartStopToggle");
  objc_msgSend(MEMORY[0x1E0CF39D0], "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "ignoreLogging");

  if ((v21 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CF39D0], "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v23 = objc_claimAutoreleasedReturnValue();

    v24 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v23, v24))
    {
      AXColorizeFormatLog();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBOOL();
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      _AXStringForArgs();
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v23, v24))
      {
        *(_DWORD *)buf = 138543362;
        v52 = v26;
        _os_log_impl(&dword_19D0DD000, v23, v24, "%{public}@", buf, 0xCu);
      }

    }
  }
  if ((v19 & 1) != 0)
    return 1;
  v27 = objc_msgSend((id)*MEMORY[0x1E0CEB258], "accessibilityStartStopToggle");
  objc_msgSend(MEMORY[0x1E0CF39D0], "sharedInstance");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "ignoreLogging");

  if ((v29 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CF39D0], "identifier");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v31 = objc_claimAutoreleasedReturnValue();

    v32 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v31, v32))
    {
      AXColorizeFormatLog();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = (objc_class *)objc_opt_class();
      NSStringFromClass(v34);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBOOL();
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      _AXStringForArgs();
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v31, v32))
      {
        *(_DWORD *)buf = 138543362;
        v52 = v36;
        _os_log_impl(&dword_19D0DD000, v31, v32, "%{public}@", buf, 0xCu);
      }

    }
  }
  if ((v27 & 1) != 0)
    return 1;
  v37 = objc_msgSend(a1, "_accessibilityHandleMagicTap");
  objc_msgSend(MEMORY[0x1E0CF39D0], "sharedInstance");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "ignoreLogging");

  if ((v40 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CF39D0], "identifier");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    AXLoggerForFacility();
    v42 = objc_claimAutoreleasedReturnValue();

    v43 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v42, v43))
    {
      AXColorizeFormatLog();
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromBOOL();
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      _AXStringForArgs();
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v42, v43))
      {
        *(_DWORD *)buf = 138543362;
        v52 = v45;
        _os_log_impl(&dword_19D0DD000, v42, v43, "%{public}@", buf, 0xCu);
      }

    }
  }
  return v37;
}

- (BOOL)_accessibilityHasActionBlockForKey:()UIStorage
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("AccessibilityActionBlockStorageKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "objectForKey:", v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_accessibilityActionBlock:()UIStorage andValue:forKey:
{
  void *v8;
  void *v9;
  id v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a5);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("AccessibilityActionBlockStorageKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("AccessibilityActionBlockParameterStorageKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v8, "objectForKey:", v11);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKey:", v11);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
    *a3 = 0;
  }
  *a4 = v10;

}

- (uint64_t)_accessibilityRemoveAllActionBlocks
{
  objc_msgSend(a1, "_accessibilitySetRetainedValue:forKey:", 0, CFSTR("AccessibilityActionBlockStorageKey"));
  return objc_msgSend(a1, "_accessibilitySetRetainedValue:forKey:", 0, CFSTR("AccessibilityActionBlockParameterStorageKey"));
}

- (uint64_t)_accessibilityRemoveActionBlockForKey:()UIStorage
{
  return objc_msgSend(a1, "_accessibilitySetActionBlock:withValue:forKey:", 0, 0, a3);
}

- (uint64_t)_accessibilityGetBlockForAttribute:()UIStorage
{
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("AccessibilityAttributeBlockStorageKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "objectForKey:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (uint64_t)_setIsAccessibilityElementBlock:()UIStorage
{
  return objc_msgSend(a1, "_accessibilitySetBlock:forAttribute:", a3, 0);
}

- (uint64_t)_setAccessibilityIdentifierBlock:()UIStorage
{
  return objc_msgSend(a1, "_accessibilitySetBlock:forAttribute:", a3, 21);
}

- (uint64_t)_setAccessibilityHintBlock:()UIStorage
{
  return objc_msgSend(a1, "_accessibilitySetBlock:forAttribute:", a3, 2);
}

- (uint64_t)_setAccessibilityAdditionalTraitsBlock:()UIStorage
{
  return objc_msgSend(a1, "_accessibilitySetBlock:forAttribute:", a3, 5);
}

- (uint64_t)_setAccessibilityTraitsBlock:()UIStorage
{
  return objc_msgSend(a1, "_accessibilitySetBlock:forAttribute:", a3, 4);
}

- (uint64_t)_setAccessibilityFrameBlock:()UIStorage
{
  return objc_msgSend(a1, "_accessibilitySetBlock:forAttribute:", a3, 6);
}

- (uint64_t)_setAccessibilityPathBlock:()UIStorage
{
  return objc_msgSend(a1, "_accessibilitySetBlock:forAttribute:", a3, 7);
}

- (uint64_t)_setAccessibilityActivationPointBlock:()UIStorage
{
  return objc_msgSend(a1, "_accessibilitySetBlock:forAttribute:", a3, 8);
}

- (uint64_t)_setAccessibilityLanguageBlock:()UIStorage
{
  return objc_msgSend(a1, "_accessibilitySetBlock:forAttribute:", a3, 9);
}

- (uint64_t)_setShouldGroupAccessibilityChildrenBlock:()UIStorage
{
  return objc_msgSend(a1, "_accessibilitySetBlock:forAttribute:", a3, 12);
}

- (uint64_t)_setAccessibilityNavigationStyleBlock:()UIStorage
{
  return objc_msgSend(a1, "_accessibilitySetBlock:forAttribute:", a3, 13);
}

- (uint64_t)_setAccessibilityHeaderElementsBlock:()UIStorage
{
  return objc_msgSend(a1, "_accessibilitySetBlock:forAttribute:", a3, 14);
}

- (uint64_t)_setAutomationElementsBlock:()UIStorage
{
  return objc_msgSend(a1, "_accessibilitySetBlock:forAttribute:", a3, 45);
}

- (uint64_t)_setAccessibilityLinkedUIElementsBlock:()UIStorage
{
  return objc_msgSend(a1, "_accessibilitySetBlock:forAttribute:", a3, 15);
}

- (uint64_t)_setAccessibilityGuideElementHeaderTextBlock:()UIStorage
{
  return objc_msgSend(a1, "_accessibilitySetBlock:forAttribute:", a3, 16);
}

- (uint64_t)_setAccessibilityDecrementBlock:()UIStorage
{
  return objc_msgSend(a1, "_accessibilitySetBlock:forAttribute:", a3, 19);
}

- (uint64_t)_setAccessibilityIncrementBlock:()UIStorage
{
  return objc_msgSend(a1, "_accessibilitySetBlock:forAttribute:", a3, 18);
}

- (uint64_t)_setAccessibilityActivateBlock:()UIStorage
{
  return objc_msgSend(a1, "_accessibilitySetBlock:forAttribute:", a3, 17);
}

- (uint64_t)_setAccessibilityPerformEscapeBlock:()UIStorage
{
  return objc_msgSend(a1, "_accessibilitySetBlock:forAttribute:", a3, 25);
}

- (uint64_t)_setAccessibilityIsRealtimeElementBlock:()UIStorage
{
  return objc_msgSend(a1, "_accessibilitySetBlock:forAttribute:", a3, 20);
}

- (uint64_t)_setAccessibilityCustomActionsBlock:()UIStorage
{
  return objc_msgSend(a1, "_accessibilitySetBlock:forAttribute:", a3, 26);
}

- (uint64_t)_setAccessibilitySupplementaryViewSectionHeaderIdentifiersBlock:()UIStorage
{
  return objc_msgSend(a1, "_accessibilitySetBlock:forAttribute:", a3, 29);
}

- (uint64_t)_setAccessibilityFrameForSortingBlock:()UIStorage
{
  return objc_msgSend(a1, "_accessibilitySetBlock:forAttribute:", a3, 23);
}

- (uint64_t)_setAccessibilityActivateParagraphInTextViewRangeBlock:()UIStorage
{
  return objc_msgSend(a1, "_accessibilitySetBlock:forAttribute:", a3, 24);
}

- (uint64_t)_setAccessibilityHeadingLevelBlock:()UIStorage
{
  return objc_msgSend(a1, "_accessibilitySetBlock:forAttribute:", a3, 27);
}

- (uint64_t)_setAccessibilityCustomContentBlock:()UIStorage
{
  return objc_msgSend(a1, "_accessibilitySetBlock:forAttribute:", a3, 28);
}

- (uint64_t)_accessibilityFocusRingStyle
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "_accessibilityValueForKey:", CFSTR("AXFocusRingStyle"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = objc_msgSend(v1, "integerValue");
  else
    v2 = 1;

  return v2;
}

- (void)_accessibilitySetFocusRingStyle:()UIStorage
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilitySetRetainedValue:forKey:", v2, CFSTR("AXFocusRingStyle"));

}

- (uint64_t)_setAccessibilityChartDescriptorBlock:()UIStorage
{
  return objc_msgSend(a1, "_accessibilitySetBlock:forAttribute:", a3, 30);
}

- (uint64_t)_setAccessibilityAttributedHintBlock:()UIStorage
{
  return objc_msgSend(a1, "_accessibilitySetBlock:forAttribute:", a3, 35);
}

- (uint64_t)_setAccessibilityTextualContextBlock:()UIStorage
{
  return objc_msgSend(a1, "_accessibilitySetBlock:forAttribute:", a3, 36);
}

- (uint64_t)_setAccessibilityContainerTypeBlock:()UIStorage
{
  return objc_msgSend(a1, "_accessibilitySetBlock:forAttribute:", a3, 43);
}

- (uint64_t)_setAccessibilityUserInputLabelsBlock:()UIStorage
{
  return objc_msgSend(a1, "_accessibilitySetBlock:forAttribute:", a3, 37);
}

- (uint64_t)_setAccessibilityAttributedUserInputLabelsBlock:()UIStorage
{
  return objc_msgSend(a1, "_accessibilitySetBlock:forAttribute:", a3, 38);
}

- (uint64_t)_setAccessibilityAttributedValueBlock:()UIStorage
{
  return objc_msgSend(a1, "_accessibilitySetBlock:forAttribute:", a3, 39);
}

- (uint64_t)_setAccessibilityRespondsToUserInteractionBlock:()UIStorage
{
  return objc_msgSend(a1, "_accessibilitySetBlock:forAttribute:", a3, 41);
}

- (uint64_t)_setAccessibilityMagicTapBlock:()UIStorage
{
  return objc_msgSend(a1, "_accessibilitySetBlock:forAttribute:", a3, 44);
}

- (uint64_t)_setAccessibilityRemoteElementShouldHitTestHostProcessBlock:()UIStorage
{
  return objc_msgSend(a1, "_accessibilitySetBlock:forAttribute:", a3, 55);
}

- (uint64_t)_setAccessibilityShouldUseHostContextIDTap:()UIStorage
{
  return objc_msgSend(a1, "_accessibilitySetBlock:forAttribute:", a3, 53);
}

- (uint64_t)_setAccessibilityShouldUseHostContextIDLongPress:()UIStorage
{
  return objc_msgSend(a1, "_accessibilitySetBlock:forAttribute:", a3, 54);
}

- (uint64_t)_setAccessibilityColumnCountBlock:()UIStorage
{
  return objc_msgSend(a1, "_accessibilitySetBlock:forAttribute:", a3, 46);
}

- (uint64_t)_setAccessibilityRowCountBlock:()UIStorage
{
  return objc_msgSend(a1, "_accessibilitySetBlock:forAttribute:", a3, 47);
}

- (uint64_t)_setAccessibilityColumnRangeBlock:()UIStorage
{
  return objc_msgSend(a1, "_accessibilitySetBlock:forAttribute:", a3, 48);
}

- (uint64_t)_setAccessibilityRowRangeBlock:()UIStorage
{
  return objc_msgSend(a1, "_accessibilitySetBlock:forAttribute:", a3, 49);
}

- (uint64_t)_setAccessibilityHeaderElementsForColumnBlock:()UIStorage
{
  return objc_msgSend(a1, "_accessibilitySetBlock:forAttribute:", a3, 50);
}

- (uint64_t)_setAccessibilityHeaderElementsForRowBlock:()UIStorage
{
  return objc_msgSend(a1, "_accessibilitySetBlock:forAttribute:", a3, 51);
}

- (uint64_t)_setAccessibilityDataTableCellElementForRowColumnBlock:()UIStorage
{
  return objc_msgSend(a1, "_accessibilitySetBlock:forAttribute:", a3, 52);
}

- (uint64_t)_accessibilityHandleMagicTapForPronunciation
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;

  v1 = a1;
  if (!v1)
    return 0;
  v2 = v1;
  while (1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v2, "delegate");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v2, "delegate");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          v5 = objc_msgSend(v4, "accessibilityPerformMagicTap");

          if ((v5 & 1) != 0)
            break;
        }
        else
        {

        }
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v2, "delegate");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {

          goto LABEL_14;
        }
        objc_msgSend(v2, "delegate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "accessibilityPerformMagicTap");

        if ((v8 & 1) != 0)
          break;
      }
    }
LABEL_14:
    objc_msgSend(v2, "accessibilityContainer");
    v9 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v9;
    if (!v9)
    {
      v10 = 0;
      goto LABEL_18;
    }
  }
  v10 = 1;
LABEL_18:

  return v10;
}

- (uint64_t)_accessibilityHandleMagicTap
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  id *v11;
  uint64_t v12;

  v1 = a1;
  if (v1)
  {
    v2 = v1;
    while ((objc_msgSend(v2, "accessibilityPerformMagicTap") & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CEABB8], "viewControllerForView:", v2);
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v3, "accessibilityPerformMagicTap") & 1) != 0)
          goto LABEL_21;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v2, "delegate");
          v4 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v2, "delegate");
            v5 = (void *)objc_claimAutoreleasedReturnValue();
            v6 = objc_msgSend(v5, "accessibilityPerformMagicTap");

            if ((v6 & 1) != 0)
              goto LABEL_21;
          }
          else
          {

          }
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v2, "delegate");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v2, "delegate");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            v9 = objc_msgSend(v8, "accessibilityPerformMagicTap");

            if (v9)
            {
LABEL_21:

              break;
            }
          }
          else
          {

          }
        }

      }
      objc_msgSend(v2, "accessibilityContainer");
      v10 = objc_claimAutoreleasedReturnValue();

      v2 = (void *)v10;
      if (!v10)
        goto LABEL_18;
    }
    v12 = 1;
    goto LABEL_23;
  }
LABEL_18:
  v11 = (id *)MEMORY[0x1E0CEB258];
  if ((objc_msgSend((id)*MEMORY[0x1E0CEB258], "accessibilityPerformMagicTap") & 1) == 0)
  {
    objc_msgSend(*v11, "delegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v2, "accessibilityPerformMagicTap");
LABEL_23:

    return v12;
  }
  return 1;
}

- (double)_accessibilityScreenPointForSceneReferencePoint:()UIStorage
{
  void *v5;
  void *v6;
  double v7;

  objc_msgSend(a1, "_accessibilityWindow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "_convertPointFromSceneReferenceSpace:", a2, a3);
    objc_msgSend(v6, "convertPoint:toWindow:", 0);
    a2 = v7;
  }

  return a2;
}

- (double)_accessibilityScreenRectForSceneReferenceRect:()UIStorage
{
  void *v9;
  void *v10;
  double v11;

  objc_msgSend(a1, "_accessibilityWindow");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "_convertRectFromSceneReferenceSpace:", a2, a3, a4, a5);
    objc_msgSend(v10, "convertRect:toWindow:", 0);
    a2 = v11;
  }

  return a2;
}

- (id)dragDescriptorMatchingDictionary:()UIStorage
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(a1, "_accessibilityAllDragSourceDescriptors", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v9, "matchesDictionaryRepresentation:", v4) & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (BOOL)_accessibilityActivateDragWithDescriptorDictionary:()UIStorage forServiceName:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  dispatch_semaphore_t v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  _BOOL8 v24;
  _QWORD v26[6];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;
  _QWORD v35[4];
  NSObject *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;

  v6 = a3;
  v7 = a4;
  objc_msgSend(a1, "dragDescriptorMatchingDictionary:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "point");
  v11 = v10;
  v13 = v12;
  v14 = *MEMORY[0x1E0CF3FC8];
  objc_msgSend(v6, "objectForKey:", *MEMORY[0x1E0CF3FC8]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v6, "objectForKey:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "CGPointValue");
    v11 = v17;
    v13 = v18;

  }
  if (v9)
  {
    if ((objc_msgSend(MEMORY[0x1E0CF4980], "isValidServiceName:", v7) & 1) != 0)
    {
      v19 = dispatch_semaphore_create(0);
      v38 = 0;
      v39 = &v38;
      v40 = 0x3032000000;
      v41 = __Block_byref_object_copy__2;
      v42 = __Block_byref_object_dispose__2;
      v43 = 0;
      v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF4980]), "initWithServiceName:", v7);
      v21 = MEMORY[0x1E0C809B0];
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __89__NSObject_UIStorage___accessibilityActivateDragWithDescriptorDictionary_forServiceName___block_invoke;
      v35[3] = &unk_1E3DFF238;
      v37 = &v38;
      v22 = v19;
      v36 = v22;
      objc_msgSend(v20, "getDragEndpoint:", v35);
      dispatch_semaphore_wait(v22, 0xFFFFFFFFFFFFFFFFLL);
      v23 = v39[5];
      if (v23)
      {
        v31 = 0;
        v32 = &v31;
        v33 = 0x2020000000;
        v34 = 0;
        v27 = 0;
        v28 = &v27;
        v29 = 0x2020000000;
        v30 = 0;
        v26[0] = v21;
        v26[1] = 3221225472;
        v26[2] = __89__NSObject_UIStorage___accessibilityActivateDragWithDescriptorDictionary_forServiceName___block_invoke_2;
        v26[3] = &unk_1E3DFF260;
        v26[4] = &v31;
        v26[5] = &v27;
        objc_msgSend(v9, "_accessibilityBeginDragAtPoint:endpoint:completion:", v23, v26, v11, v13);
        if (*((_BYTE *)v32 + 24))
          v24 = *((_BYTE *)v28 + 24) != 0;
        else
          v24 = 1;
        _Block_object_dispose(&v27, 8);
        _Block_object_dispose(&v31, 8);
      }
      else
      {
        v24 = 0;
      }

      _Block_object_dispose(&v38, 8);
    }
    else
    {
      AXLogDragging();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        -[NSObject(UIStorage) _accessibilityActivateDragWithDescriptorDictionary:forServiceName:].cold.1();
      v24 = 0;
    }

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (void)_accessibilityInsertTextAtCursor:()UIStorage
{
  objc_class *v4;
  objc_class *v5;
  Method InstanceMethod;
  id v7;

  v7 = a3;
  if (!_accessibilityInsertTextAtCursor__BaseFrameForBrowserInsertTextMethod)
  {
    v4 = (objc_class *)objc_opt_class();
    _accessibilityInsertTextAtCursor__BaseFrameForBrowserInsertTextMethod = (uint64_t)class_getInstanceMethod(v4, sel_browserAccessibilityInsertTextAtCursor_);
  }
  v5 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v5, sel_browserAccessibilityInsertTextAtCursor_);
  if ((objc_opt_respondsToSelector() & 1) == 0
    || InstanceMethod == (Method)_accessibilityInsertTextAtCursor__BaseFrameForBrowserInsertTextMethod)
  {
    objc_msgSend(a1, "_accessibilityInsertText:atPosition:", v7, -1);
  }
  else
  {
    objc_msgSend(a1, "browserAccessibilityInsertTextAtCursor:", v7);
  }

}

- (uint64_t)_iosAccessibilityPerformAction:()UIStorage withValue:fencePort:
{
  id v8;
  uint64_t (**v9)(id, id);
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  NSString *v25;
  NSRange v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  float v41;
  void *v42;
  char isKindOfClass;
  void *v44;
  float v45;
  double v46;
  void *v47;
  char v48;
  void *v49;
  double v50;
  double MidX;
  double v52;
  double MidY;
  id v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  char v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  NSObject *v66;
  id v67;
  void *v68;
  void *v69;
  int v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  id v84;
  id v85;
  CGRect v86;
  CGRect v87;

  v8 = a4;
  if (!objc_msgSend(a1, "_accessibilityHasActionBlockForKey:", a3))
  {
LABEL_5:
    v12 = 0;
    if ((int)a3 <= 5299)
    {
      switch((int)a3)
      {
        case 2001:
          objc_msgSend(v8, "pointValue");
          objc_msgSend(a1, "_accessibilityScreenPointForSceneReferencePoint:");
          objc_msgSend(a1, "accessibilityZoomInAtPoint:");
          break;
        case 2002:
          objc_msgSend(v8, "pointValue");
          objc_msgSend(a1, "_accessibilityScreenPointForSceneReferencePoint:");
          objc_msgSend(a1, "accessibilityZoomOutAtPoint:");
          break;
        case 2003:
          v17 = objc_msgSend(a1, "_accessibilityScrollToVisible");
          goto LABEL_169;
        case 2004:
          if (!objc_msgSend(a1, "_accessibilityShouldPerformIncrementOrDecrement"))
            goto LABEL_210;
          if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v28 = objc_msgSend(v8, "unsignedIntegerValue");
            if (!v28)
              break;
          }
          else
          {
            v28 = 1;
          }
          do
          {
            objc_msgSend(a1, "_accessibilityGetBlockForAttribute:", 18);
            v71 = objc_claimAutoreleasedReturnValue();
            v72 = (void *)v71;
            if (v71)
              (*(void (**)(uint64_t))(v71 + 16))(v71);
            else
              objc_msgSend(a1, "accessibilityIncrement");

            v12 = 1;
            --v28;
          }
          while (v28);
          goto LABEL_211;
        case 2005:
          if (!objc_msgSend(a1, "_accessibilityShouldPerformIncrementOrDecrement"))
            goto LABEL_210;
          if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v29 = objc_msgSend(v8, "unsignedIntegerValue");
            if (!v29)
              break;
          }
          else
          {
            v29 = 1;
          }
          do
          {
            objc_msgSend(a1, "_accessibilityGetBlockForAttribute:", 19);
            v73 = objc_claimAutoreleasedReturnValue();
            v74 = (void *)v73;
            if (v73)
              (*(void (**)(uint64_t))(v73 + 16))(v73);
            else
              objc_msgSend(a1, "accessibilityDecrement");

            v12 = 1;
            --v29;
          }
          while (v29);
          goto LABEL_211;
        case 2006:
          if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v30 = objc_msgSend(v8, "BOOLValue");
            v31 = a1;
          }
          else
          {
            v31 = a1;
            v30 = 1;
          }
          v17 = objc_msgSend(v31, "_accessibilityScrollDownPage:", v30);
          goto LABEL_169;
        case 2007:
          if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v32 = objc_msgSend(v8, "BOOLValue");
            v33 = a1;
          }
          else
          {
            v33 = a1;
            v32 = 1;
          }
          v17 = objc_msgSend(v33, "_accessibilityScrollUpPage:", v32);
          goto LABEL_169;
        case 2008:
          if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v34 = objc_msgSend(v8, "BOOLValue");
            v35 = a1;
          }
          else
          {
            v35 = a1;
            v34 = 1;
          }
          v17 = objc_msgSend(v35, "_accessibilityScrollRightPage:", v34);
          goto LABEL_169;
        case 2009:
          if (v8 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            v36 = objc_msgSend(v8, "BOOLValue");
            v37 = a1;
          }
          else
          {
            v37 = a1;
            v36 = 1;
          }
          v17 = objc_msgSend(v37, "_accessibilityScrollLeftPage:", v36);
          goto LABEL_169;
        case 2010:
          v17 = objc_msgSend(a1, "accessibilityActivate");
          goto LABEL_169;
        case 2011:
          v17 = objc_msgSend(a1, "_accessibilityInternalHandleStartStopToggle");
          goto LABEL_169;
        case 2012:
          v17 = objc_msgSend(a1, "_accessibilityTextOperationAction:", v8);
          goto LABEL_169;
        case 2013:
          v17 = objc_msgSend(a1, "_accessibilityPerformEscape");
          goto LABEL_169;
        case 2014:
          objc_msgSend(v8, "pointValue");
          objc_msgSend(a1, "_accessibilityScreenPointForSceneReferencePoint:");
          objc_msgSend(a1, "_accessibilityScrollToPoint:");
          break;
        case 2015:
          objc_msgSend(a1, "_accessibilityIncreaseSelection:", v8);
          break;
        case 2016:
          objc_msgSend(a1, "_accessibilityDecreaseSelection:", v8);
          break;
        case 2017:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v8, "count") != 2)
            goto LABEL_210;
          objc_msgSend(v8, "objectAtIndex:", 0);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v38, "BOOLValue");
          objc_msgSend(v8, "objectAtIndex:", 1);
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_accessibilityFindSearchResult:withString:", v39, v40);

          v12 = 1;
          goto LABEL_211;
        case 2018:
          objc_msgSend(a1, "_accessibilityChangeToKeyplane:", v8);
          break;
        case 2019:
          v17 = objc_msgSend(a1, "_accessibilityScrollNextPage");
          goto LABEL_169;
        case 2020:
          v17 = objc_msgSend(a1, "_accessibilityScrollPreviousPage");
          goto LABEL_169;
        case 2021:
          v17 = objc_msgSend(a1, "_accessibilityPerformCustomActionWithIdentifier:", v8);
          goto LABEL_169;
        case 2022:
          objc_msgSend(a1, "_accessibilityJumpToTableIndex:", v8);
          break;
        case 2023:
          v17 = objc_msgSend(a1, "_accessibilityTriggerDictationFromPath:", v8);
          goto LABEL_169;
        case 2024:
          v17 = objc_msgSend(MEMORY[0x1E0CF40E0], "registerRemoteElement:remotePort:", v8, a5);
          goto LABEL_169;
        case 2025:
          objc_msgSend(a1, "_accessibilityAnnouncementComplete:", v8);
          break;
        case 2026:
          v17 = objc_msgSend(a1, "_accessibilityAutoscrollInDirection:", (int)objc_msgSend(v8, "intValue"));
          goto LABEL_169;
        case 2027:
          objc_msgSend(a1, "_accessibilityPauseAutoscrolling");
          break;
        case 2028:
          objc_msgSend(a1, "_accessibilityIncreaseAutoscrollSpeed");
          break;
        case 2029:
          objc_msgSend(a1, "_accessibilityDecreaseAutoscrollSpeed");
          break;
        case 2030:
          objc_msgSend(a1, "_accessibilityAutoscrollScrollToTop");
          break;
        case 2031:
          objc_msgSend(a1, "_accessibilityAutoscrollScrollToBottom");
          break;
        case 2032:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_210;
          objc_msgSend(v8, "floatValue");
          objc_msgSend(a1, "_accessibilitySetAutoscrollSpeed:", v41);
          break;
        case 2033:
          v17 = objc_msgSend(a1, "accessibilityExpandMathEquation:", v8);
          goto LABEL_169;
        case 2034:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_210;
          objc_msgSend(MEMORY[0x1E0CF4E78], "representationWithData:", v8);
          v18 = (id)objc_claimAutoreleasedReturnValue();
          v27 = objc_msgSend(a1, "_accessibilityDispatchKeyboardAction:", v18);
          goto LABEL_172;
        case 2035:
          v17 = objc_msgSend(a1, "_accessibilityDismissAlternativeKeyPicker");
          goto LABEL_169;
        case 2036:
          v17 = objc_msgSend(a1, "_accessibilitySecondaryActivate");
          goto LABEL_169;
        case 2037:
          objc_msgSend(a1, "accessibilityIncreaseTrackingDetail");
          break;
        case 2038:
          objc_msgSend(a1, "accessibilityDecreaseTrackingDetail");
          break;
        case 2039:
          objc_msgSend(v8, "rectValue");
          objc_msgSend(a1, "_accessibilityScreenRectForSceneReferenceRect:");
          objc_msgSend(a1, "_accessibilityScrollRectToVisible:");
          break;
        case 2040:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_210;
          v17 = objc_msgSend(a1, "_accessibilityLoadURL:", v8);
          goto LABEL_169;
        case 2041:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_210;
          v17 = objc_msgSend(a1, "_accessibilityPerformUserTestingAction:", v8);
          goto LABEL_169;
        case 2042:
          v17 = objc_msgSend(a1, "_accessibilityBeginMonitoringIdleRunLoop");
          goto LABEL_169;
        case 2043:
          objc_msgSend(a1, "_accessibilityDetectAnimationsNonActive");
          break;
        case 2044:
          v17 = objc_msgSend(a1, "_accessibilitySetNativeFocus");
          goto LABEL_169;
        case 2045:
          v17 = objc_msgSend(a1, "_accessibilityPerformOrbGesture:", (int)objc_msgSend(v8, "intValue"));
          goto LABEL_169;
        case 2046:
          v17 = objc_msgSend(a1, "_accessibilitySavePhotoLabel:", v8);
          goto LABEL_169;
        case 2047:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_210;
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("scrollAmount"));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) == 0)
            goto LABEL_210;
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("scrollAmount"));
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "floatValue");
          v46 = v45;

          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("scrollPoint"));
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v48 = objc_opt_isKindOfClass();

          if ((v48 & 1) != 0)
          {
            objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("scrollPoint"));
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "pointValue");
            MidX = v50;
            MidY = v52;

          }
          else
          {
            AXDeviceGetMainScreenBounds();
            x = v86.origin.x;
            y = v86.origin.y;
            width = v86.size.width;
            height = v86.size.height;
            MidX = CGRectGetMidX(v86);
            v87.origin.x = x;
            v87.origin.y = y;
            v87.size.width = width;
            v87.size.height = height;
            MidY = CGRectGetMidY(v87);
          }
          v17 = objc_msgSend(a1, "_animateScrollViewWithScrollAmount:point:", v46, MidX, MidY);
          goto LABEL_169;
        case 2048:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_210;
          v17 = objc_msgSend(a1, "_accessibilityAlternateActionForURL:", v8);
          goto LABEL_169;
        case 2049:
        case 2063:
          goto LABEL_211;
        case 2050:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v8, "count") != 2)
            goto LABEL_210;
          v54 = v8;
          objc_msgSend(v54, "objectAtIndexedSubscript:", 0);
          v18 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "objectAtIndexedSubscript:", 1);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          v21 = objc_msgSend(a1, "_accessibilityActivateDragWithDescriptorDictionary:forServiceName:", v20, v18);
          goto LABEL_119;
        case 2051:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v18 = v8;
          else
            v18 = 0;
          v27 = objc_msgSend(a1, "_accessibilityShowContextMenuWithTargetPointValue:", v18);
          goto LABEL_172;
        case 2052:
          if ((objc_msgSend(a1, "_accessibilityActivateKeyboardDeleteKey") & 1) != 0)
            goto LABEL_210;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v8, "valueForKey:", CFSTR("source"));
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            v56 = v55;
            if (v55)
              _UIAXSetLastKeyboardUsed(v55);

          }
          v12 = 1;
          objc_msgSend(a1, "_accessibilityReplaceCharactersAtCursor:withString:", 1, 0);
          goto LABEL_211;
        case 2053:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_209;
          v57 = v8;
          objc_msgSend(v57, "objectForKey:", CFSTR("numberofcharacters"));
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v59 = objc_opt_isKindOfClass();

          if ((v59 & 1) != 0)
          {
            objc_msgSend(v57, "objectForKey:", CFSTR("numberofcharacters"));
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            v61 = objc_msgSend(v60, "unsignedIntegerValue");

          }
          else
          {
            v61 = 0;
          }
          objc_opt_class();
          objc_msgSend(v57, "objectForKey:", CFSTR("replacement"));
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          __UIAccessibilityCastAsClass();
          v76 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          objc_msgSend(v57, "objectForKey:", CFSTR("source"));
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          __UIAccessibilityCastAsClass();
          v78 = (void *)objc_claimAutoreleasedReturnValue();

          if ((v59 & 1) != 0)
          {
            if (v78)
              _UIAXSetLastKeyboardUsed(v78);
            objc_msgSend(a1, "_accessibilityReplaceCharactersAtCursor:withString:", v61, v76);

            goto LABEL_206;
          }

LABEL_209:
          _AXAssert();
          goto LABEL_210;
        case 2054:
          v17 = objc_msgSend(a1, "_accessibilityActivateKeyboardReturnKey");
          goto LABEL_169;
        case 2055:
          objc_opt_class();
          __UIAccessibilityCastAsClass();
          v57 = (id)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(a1, "_accessibilityInsertTextWithAlternatives:", v57) & 1) == 0)
            objc_msgSend(a1, "_accessibilityInsertTextAtCursor:", v57);
          goto LABEL_206;
        case 2056:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_opt_class();
            __UIAccessibilityCastAsClass();
            v57 = (id)objc_claimAutoreleasedReturnValue();
LABEL_203:
            v68 = 0;
            goto LABEL_204;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v57 = 0;
            goto LABEL_203;
          }
          v67 = v8;
          objc_msgSend(v67, "objectForKeyedSubscript:", *MEMORY[0x1E0CF44B8]);
          v57 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "objectForKeyedSubscript:", *MEMORY[0x1E0CF44B0]);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "objectForKeyedSubscript:", *MEMORY[0x1E0CF44A8]);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          v70 = objc_msgSend(v69, "BOOLValue");

          if (v68)
            _UIAXSetLastKeyboardUsed(v68);

          if (v70)
          {
            objc_msgSend(a1, "_accessibilityBeginUndoableTextInsertion");
            objc_msgSend(a1, "_accessibilityHandwritingAttributeShouldEchoCharacter");
            objc_msgSend(a1, "_accessibilityInsertTextAtCursor:", v57);
            objc_msgSend(a1, "_accessibilityEndUndoableTextInsertion");
            goto LABEL_205;
          }
LABEL_204:
          objc_msgSend(a1, "_accessibilityHandwritingAttributeShouldEchoCharacter");
          objc_msgSend(a1, "_accessibilityInsertTextAtCursor:", v57);
LABEL_205:

LABEL_206:
          break;
        case 2057:
          objc_msgSend(MEMORY[0x1E0CEA748], "sharedMenuController");
          v57 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "_accessibilityParentView");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v57, "isMenuVisible"))
          {
            objc_msgSend(v57, "hideMenuFromView:", v62);
          }
          else
          {
            objc_msgSend(v62, "bounds");
            AX_CGRectGetCenter();
            objc_msgSend(v57, "showMenuFromView:rect:", v62);
          }

          goto LABEL_206;
        case 2058:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(a1, "_accessibilityCurrentlyFocusedElementForTechnology:", v8);
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "_accessibilityHandleATFocused:assistiveTech:", 0, v8);

            objc_msgSend(a1, "_accessibilityDidFocusOnOpaqueElement:technology:", 0, v8);
            v12 = 1;
          }
          else
          {
            v12 = 0;
          }
          goto LABEL_182;
        case 2059:
LABEL_182:
          objc_msgSend(a1, "_accessibilityShowEditingHUD");
          goto LABEL_211;
        case 2060:
          objc_msgSend(a1, "_accessibilityTextViewTextOperationResponder");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = objc_msgSend(v64, "_accessibilityBeginUndoableTextInsertion");
          goto LABEL_142;
        case 2061:
          objc_msgSend(a1, "_accessibilityTextViewTextOperationResponder");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          v65 = objc_msgSend(v64, "_accessibilityEndUndoableTextInsertion");
LABEL_142:
          v12 = v65;

          goto LABEL_211;
        case 2062:
          v17 = objc_msgSend(a1, "_accessibilityResetBannerTimer");
          goto LABEL_169;
        case 2064:
          objc_msgSend(v8, "pointValue");
          v17 = objc_msgSend(a1, "_accessibilityAdjustScrollOffset:");
          goto LABEL_169;
        case 2065:
          v17 = objc_msgSend(a1, "_accessibilityAuthenticatedPasteWithValue:", v8);
          goto LABEL_169;
        case 2066:
          objc_msgSend(a1, "_accessibilityShowKeyboard");
          break;
        case 2067:
          objc_msgSend(a1, "_accessibilityHideKeyboard");
          break;
        case 2068:
          v17 = objc_msgSend(a1, "_accessibilityScrollToTop");
          goto LABEL_169;
        case 2069:
          v17 = objc_msgSend(a1, "_accessibilityScrollToBottom");
          goto LABEL_169;
        default:
          switch((int)a3)
          {
            case 4020:
              objc_msgSend(a1, "_accessibilityMapsExplorationBeginFromCurrentElement");
              goto LABEL_210;
            case 4021:
              objc_msgSend(a1, "_accessibilityMapsExplorationContinueWithVertexIndex:", objc_msgSend(v8, "unsignedIntegerValue"));
              goto LABEL_210;
            case 4022:
              objc_msgSend(a1, "_accessibilityMapsExplorationEnd");
              goto LABEL_210;
            case 4023:
              objc_msgSend(v8, "pointValue");
              objc_msgSend(a1, "_accessibilityMapsExplorationRecordTouchpoint:");
              goto LABEL_210;
            default:
              if ((_DWORD)a3 != 2505)
                goto LABEL_211;
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
                goto LABEL_210;
              objc_msgSend(v8, "objectForKey:", CFSTR("replacement"));
              v18 = (id)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "objectForKey:", CFSTR("range"));
              v25 = (NSString *)objc_claimAutoreleasedReturnValue();
              v26 = NSRangeFromString(v25);

              v27 = objc_msgSend(a1, "_accessibilityReplaceTextInRange:withString:", v26.location, v26.length, v18);
              break;
          }
LABEL_172:
          v12 = v27;
          goto LABEL_173;
      }
LABEL_207:
      v12 = 1;
      goto LABEL_211;
    }
    if ((int)a3 <= 5499)
    {
      switch((int)a3)
      {
        case 5300:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v8, "count") == 2)
          {
            objc_msgSend(v8, "firstObject");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v13, "unsignedIntegerValue");

            objc_msgSend(v8, "lastObject");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "BOOLValue");

            v17 = objc_msgSend(a1, "_accessibilityFocusContainerMoveFocusWithHeading:byGroup:", v14, v16);
LABEL_169:
            v12 = v17;
            goto LABEL_211;
          }
          AXLogFocusEngine();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            -[NSObject(UIStorage) _iosAccessibilityPerformAction:withValue:fencePort:].cold.3();
          break;
        case 5304:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v8, "count") == 2)
          {
            objc_msgSend(v8, "firstObject");
            v18 = (id)objc_claimAutoreleasedReturnValue();
            v19 = objc_msgSend(v18, "unsignedIntegerValue");
            objc_msgSend(v8, "lastObject");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(a1, "_accessibilityFocusContainerMoveFocusWithHeading:toElementMatchingQuery:", v19, v20);
LABEL_119:
            v12 = v21;

LABEL_173:
            goto LABEL_211;
          }
          AXLogFocusEngine();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            -[NSObject(UIStorage) _iosAccessibilityPerformAction:withValue:fencePort:].cold.4();
          break;
        case 5305:
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(a1, "_accessibilitySetFocusEnabledInApplication:", objc_msgSend(v8, "BOOLValue"));
            goto LABEL_207;
          }
          AXLogFocusEngine();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            -[NSObject(UIStorage) _iosAccessibilityPerformAction:withValue:fencePort:].cold.5();
          break;
        case 5307:
          objc_msgSend(a1, "_accessibilityDidFocusOnApplication");
          goto LABEL_207;
        case 5308:
          objc_msgSend(a1, "_accessibilitySetFocusOnElement:", objc_msgSend(v8, "BOOLValue"));
          goto LABEL_207;
        case 5312:
          objc_msgSend(a1, "_accessibilityClearLastFocusedChild");
          goto LABEL_207;
        default:
          goto LABEL_211;
      }
LABEL_155:

LABEL_210:
      v12 = 0;
      goto LABEL_211;
    }
    if ((int)a3 > 6999)
    {
      if ((_DWORD)a3 != 7000)
      {
        if ((_DWORD)a3 != 9000)
          goto LABEL_211;
        objc_msgSend(a1, "_accessibilitySetCurrentGesture:", v8);
        goto LABEL_207;
      }
      objc_opt_class();
      __UIAccessibilityCastAsClass();
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF4EB0]), "initWithDictionaryRepresentation:", v22);
      +[UIAccessibilityGameController sharedGameController](UIAccessibilityGameController, "sharedGameController");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "pressButton:", v23);

      goto LABEL_155;
    }
    if ((_DWORD)a3 == 5500)
    {
      if (objc_msgSend(a1, "conformsToProtocol:", &unk_1EE47FC80))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(MEMORY[0x1E0CEA5D8], "moveRingToFocusItem:forClient:", a1, v8);
        else
          objc_msgSend(MEMORY[0x1E0CEA5D8], "moveRingToFocusItem:", a1);
        goto LABEL_207;
      }
      AXLogUI();
      v66 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
        goto LABEL_160;
    }
    else
    {
      if ((_DWORD)a3 != 5501)
        goto LABEL_211;
      if (objc_msgSend(a1, "conformsToProtocol:", &unk_1EE47FC80))
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(MEMORY[0x1E0CEA5D8], "removeRingFromFocusItem:forClient:", a1, v8);
        else
          objc_msgSend(MEMORY[0x1E0CEA5D8], "removeRingFromFocusItem:", a1);
        goto LABEL_207;
      }
      AXLogUI();
      v66 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
        goto LABEL_160;
    }
    -[NSObject(UIStorage) _iosAccessibilityPerformAction:withValue:fencePort:].cold.1();
LABEL_160:

    goto LABEL_210;
  }
  v84 = 0;
  v85 = 0;
  objc_msgSend(a1, "_accessibilityActionBlock:andValue:forKey:", &v85, &v84, a3);
  v9 = (uint64_t (**)(id, id))v85;
  v10 = v84;
  v11 = v10;
  if (!v9)
  {

    goto LABEL_5;
  }
  v12 = v9[2](v9, v10);

LABEL_211:
  return v12;
}

- (uint64_t)_accessibilityMimicsTextInputResponder
{
  return 0;
}

- (uint64_t)_accessibilityIgnoreDelegate
{
  return objc_msgSend(a1, "_accessibilityBoolValueForKey:", CFSTR("AXIgnoreDelegate"));
}

- (uint64_t)_accessibilitySetIgnoreDelegate:()UIStorage
{
  return objc_msgSend(a1, "_accessibilitySetBoolValue:forKey:", a3, CFSTR("AXIgnoreDelegate"));
}

- (uint64_t)_accessibilitySpeakThisMaximumNumberOfElements
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v0 = MGGetProductType();
  v1 = 500;
  if (v0 != 3856877970)
    v1 = 1000;
  if (v0 == 3953847432)
    v2 = 500;
  else
    v2 = v1;
  v3 = 500;
  if (v0 != 2797549163)
    v3 = 1000;
  if (v0 == 2730762296)
    v4 = 500;
  else
    v4 = v3;
  if (v0 <= 3856877969)
    v5 = v4;
  else
    v5 = v2;
  v6 = 500;
  if (v0 != 1549248876)
    v6 = 1000;
  if (v0 == 1517755655)
    v7 = 500;
  else
    v7 = v6;
  if (v0 == 340218669)
    v8 = 500;
  else
    v8 = v7;
  if (v0 <= 2730762295)
    return v8;
  else
    return v5;
}

- (id)_accessibilitySpeakThisElementsAndStrings
{
  uint64_t v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint8_t v10[16];

  v2 = objc_msgSend(a1, "_accessibilitySpeakThisMaximumNumberOfElements");
  +[UIAccessibilityElementTraversalOptions defaultSpeakScreenOptions](UIAccessibilityElementTraversalOptions, "defaultSpeakScreenOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilityLeafDescendantsWithCount:options:", v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  AXLogSpeakScreen();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[NSObject(UIStorage) _accessibilitySpeakThisElementsAndStrings].cold.1();

  if (objc_msgSend(v4, "count") == v2)
  {
    UIKitAccessibilityLocalizedString(CFSTR("speakthis.too.much.content"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "arrayByAddingObject:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    AXLogSpeakScreen();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_19D0DD000, v8, OS_LOG_TYPE_INFO, "Had to truncate content.", v10, 2u);
    }

    v4 = (void *)v7;
  }

  return v4;
}

- (uint64_t)_accessibilitySpeakThisViewsFromSceneRequestedForActiveSpeakScreenSession
{
  return 0;
}

- (uint64_t)_accessibilitySpeakThisViewsFromSceneWithSceneIdentifier:()UIStorage
{
  return 0;
}

- (id)_accessibilitySpeakThisElementWithIdentifier:()UIStorage
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[UIAccessibilityElementTraversalOptions options](UIAccessibilityElementTraversalOptions, "options");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68__NSObject_UIStorage___accessibilitySpeakThisElementWithIdentifier___block_invoke;
  v13[3] = &unk_1E3DFDE98;
  v6 = v4;
  v14 = v6;
  objc_msgSend(v5, "setLeafNodePredicate:", v13);
  objc_msgSend(a1, "_accessibilityLeafDescendantsWithCount:shouldStopAtRemoteElement:options:", 1, 0, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  AXLogSpeakScreen();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v8, "description");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accessibilityIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v16 = v10;
    v17 = 2112;
    v18 = v11;
    v19 = 2112;
    v20 = v6;
    _os_log_impl(&dword_19D0DD000, v9, OS_LOG_TYPE_INFO, "SpeakThisElement %@, accessibilityIdentifier: %@, looking for %@", buf, 0x20u);

  }
  return v8;
}

- (id)_accessibilityTextRectsForSpeakThisStringRange:()UIStorage
{
  void *v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void **v21;
  void *v22;
  void *v23;
  void *v25;
  void *v26;
  _QWORD v27[3];

  v27[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_accessibilityTextMarkerForPosition:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilityTextMarkerForPosition:", a3 + a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  AXLogSpeakScreen();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
  if (v7 && v8)
  {
    if (v10)
      -[NSObject(UIStorage) _accessibilityTextRectsForSpeakThisStringRange:].cold.1();

    v27[0] = v7;
    v27[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "accessibilityBoundsForTextMarkers:", v11);
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;

    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v13, v15, v17, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v20;
    v21 = &v26;
  }
  else
  {
    if (v10)
      -[NSObject(UIStorage) _accessibilityTextRectsForSpeakThisStringRange:].cold.2();

    v22 = (void *)MEMORY[0x1E0CB3B18];
    if (objc_msgSend(a1, "_accessibilityBoolValueForKey:", CFSTR("AXSpeakScreenRectsUseVisibleFrame")))
      objc_msgSend(a1, "_accessibilityVisibleFrame");
    else
      objc_msgSend(a1, "accessibilityFrame");
    objc_msgSend(v22, "valueWithCGRect:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v20;
    v21 = &v25;
  }
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (uint64_t)_accessibilityTextRectsForRange:()UIStorage singleTextRect:
{
  return 0;
}

- (uint64_t)_accessibilitySentenceRectsForRange:()UIStorage
{
  return objc_msgSend(a1, "_accessibilityTextRectsForRange:singleTextRect:", a3, 0);
}

- (uint64_t)_accessibilitySpeakThisShouldScrollTextRects
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "_iosAccessibilityAttributeValue:", 2301);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue") ^ 1;

  return v2;
}

- (uint64_t)_accessibilitySpeakThisShouldOnlyIncludeVisibleElements
{
  return 0;
}

- (BOOL)_accessibilitySpeakThisCanBeHighlighted
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "_accessibilityWindow");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (uint64_t)_accessibilitySpeakThisPreferredHighlightColor
{
  return 0;
}

- (uint64_t)_accessibilitySpeakThisPreferredUnderlineColor
{
  return 0;
}

- (uint64_t)_accessibilitySpeakThisViewController
{
  return 0;
}

- (uint64_t)_accessibilitySpeakThisViews
{
  return 0;
}

- (uint64_t)_accessibilityRemoteElementForSceneID:()UIStorage
{
  return 0;
}

- (uint64_t)_accessibilitySpeakThisRootElement
{
  return 0;
}

- (uint64_t)_accessibilityHasNativeFocus
{
  void *v2;

  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(a1, "safeValueForKey:", CFSTR("_browserAccessibilityStoredValueHasDOMFocus")),
        v2 = (void *)objc_claimAutoreleasedReturnValue(),
        v2,
        v2))
  {
    return objc_msgSend(a1, "safeBoolForKey:", CFSTR("browserAccessibilityHasDOMFocus"));
  }
  else
  {
    return objc_msgSend(a1, "_accessibilityUIKitHasNativeFocus");
  }
}

- (BOOL)_accessibilityUIKitHasNativeFocus
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "_accessibilityParentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "screen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_accessibilityNativeFocusElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5 == a1;
}

- (uint64_t)_accessibilityFullscreenVideoViewIsVisible
{
  return 0;
}

- (uint64_t)_accessibilityViewHierarchyHasNativeFocus
{
  void *v2;
  uint64_t v3;

  objc_msgSend((id)*MEMORY[0x1E0CEB258], "_accessibilityNativeFocusElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 == a1)
    v3 = 1;
  else
    v3 = objc_msgSend(a1, "_accessibilityIsDescendantOfElement:", v2);

  return v3;
}

- (uint64_t)_accessibilityShouldSetNativeFocusWhenATVFocused
{
  return 0;
}

- (uint64_t)_accessibilitySetNativeFocus
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  const __CFString *v11;

  objc_msgSend(a1, "_accessibilityNativeFocusAncestor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (!v2)
    v2 = a1;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v2, CFSTR("AXAssignNativeFocusToElementNotificationFocusedItemUserInfoKey"));
  objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("AXWillAssignNativeFocusToElementNotification"), 0, v4);
  if (v2 && !objc_msgSend(v2, "conformsToProtocol:", &unk_1EE47FC80))
  {
    v6 = 0;
    v5 = 0;
  }
  else
  {
    if ((objc_msgSend(a1, "_accessibilityIsFKARunningForFocusItem") & 1) != 0
      || objc_msgSend(a1, "_accessibilityShouldSetNativeFocusWhenATVFocused"))
    {
      v5 = _UIAXAssignFocusToItem();
    }
    else
    {
      v5 = 0;
    }
    v6 = 1;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, CFSTR("AXAssignNativeFocusToElementNotificationDidSucceedUserInfoKey"));

  if ((v6 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FocusTarget is not of type UIFocusItem: %@"), v2);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("AXAssignNativeFocusToElementNotificationFailureReasonUserInfoKey"));
LABEL_21:

    goto LABEL_22;
  }
  if ((v5 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CEA5D0], "checkFocusabilityForItem:", v2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "safeValueForKey:", CFSTR("_outputString"));
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
    if (v10)
      v11 = v10;
    else
      v11 = CFSTR("Unknown");
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, CFSTR("AXAssignNativeFocusToElementNotificationFailureReasonUserInfoKey"));

    goto LABEL_21;
  }
LABEL_22:
  objc_msgSend(v3, "postNotificationName:object:userInfo:", CFSTR("AXDidAssignNativeFocusToElementNotification"), 0, v4);

  return v5;
}

- (BOOL)_accessibilityCanBecomeNativeFocused
{
  id v2;
  void *v3;
  void *v4;
  _BOOL8 v5;

  if (objc_msgSend(a1, "conformsToProtocol:", &unk_1EE47FC80))
  {
    v2 = a1;
    if (!objc_msgSend(v2, "canBecomeFocused"))
    {
      v5 = 0;
LABEL_13:

      return v5;
    }
    objc_msgSend(v2, "preferredFocusEnvironments");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "count") && !objc_msgSend(v3, "containsObject:", v2))
      goto LABEL_10;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = 1;
      goto LABEL_12;
    }
    if (objc_msgSend(v2, "_accessibilityViewIsVisible"))
    {
      objc_msgSend(v2, "_accessibilityWindow");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4 != 0;

    }
    else
    {
LABEL_10:
      v5 = 0;
    }
LABEL_12:

    goto LABEL_13;
  }
  return 0;
}

- (uint64_t)_accessibilityNativeFocusPreferredElement
{
  return 0;
}

- (uint64_t)_accessibilityUnfocusableViewCanBeFocusedForHoverText
{
  return 0;
}

- (uint64_t)_accessibilityShouldBeExplorerElementWithoutSystemFocus
{
  return 1;
}

- (uint64_t)_accessibilityNativeFocusPreferredElementIsValid
{
  return 1;
}

- (uint64_t)_accessibilityShouldIgnoreSoundForFailedMoveAttempt
{
  return 0;
}

- (uint64_t)_accessibilityShouldSpeakExplorerElementsAfterFocus
{
  return 1;
}

- (id)_accessibilityNativeFocusAncestor
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if (v1)
  {
    do
    {
      if ((objc_msgSend(v1, "_acceessibilityUIKitIsUserInteractionDisabled") & 1) == 0
        && (objc_msgSend(v1, "_accessibilityCanBecomeNativeFocused") & 1) != 0)
      {
        break;
      }
      objc_msgSend(v1, "accessibilityContainer");
      v2 = objc_claimAutoreleasedReturnValue();

      v1 = (id)v2;
    }
    while (v2);
  }
  return v1;
}

- (uint64_t)_accessibilityDrawsFocusRingWhenChildrenFocused
{
  return 0;
}

- (uint64_t)_accessibilityRemembersLastFocusedChild
{
  return 0;
}

- (uint64_t)_axGetLastFocusedChild
{
  return __UIAccessibilityGetAssociatedNonRetainedObject();
}

- (uint64_t)_axSetLastFocusedChild:()UIStorage
{
  return __UIAccessibilitySetAssociatedNonRetainedObject();
}

- (double)_axScaleTransformForFocusLayerLineWidth
{
  return 1.0;
}

- (BOOL)_drawsFocusRingWhenChildrenFocused
{
  void *v2;
  _BOOL8 v3;

  if (!objc_msgSend(a1, "_accessibilityDrawsFocusRingWhenChildrenFocused"))
    return 0;
  objc_msgSend(a1, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_2613, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (uint64_t)_accessibilityIsFocusContainer
{
  return 0;
}

- (BOOL)_accessibilityHasNativeFocusableElements
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend((id)*MEMORY[0x1E0CEB258], "_accessibilityNativeFocusableElements:matchingBlock:forExistenceCheckOnly:", a1, 0, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "count") != 0;

  return v2;
}

- (id)_accessibilityFocusContainer
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(a1, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_2614, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(a1, "_accessibilityWindowScene");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (uint64_t)_accessibilityFocusContainerMoveFocusWithHeading:()UIStorage byGroup:
{
  return 0;
}

- (uint64_t)_accessibilityFocusContainerMoveFocusWithHeading:()UIStorage toElementMatchingQuery:
{
  return 0;
}

- (uint64_t)_accessibilityMoveFocusWithHeading:()UIStorage
{
  return objc_msgSend(a1, "_accessibilityMoveFocusWithHeading:byGroup:", a3, 0);
}

- (uint64_t)_accessibilityMoveFocusWithHeading:()UIStorage byGroup:
{
  return 0;
}

- (uint64_t)_accessibilityMoveFocusWithHeading:()UIStorage toElementMatchingQuery:
{
  return 0;
}

- (uint64_t)_accessibilityClearLastFocusedChild
{
  return objc_msgSend(a1, "accessibilityEnumerateAncestorsUsingBlock:", &__block_literal_global_2615);
}

- (uint64_t)_accessibilityHandlesRemoteFocusMovement
{
  return 0;
}

- (uint64_t)_accessibilityRemotePid
{
  return 0;
}

- (uint64_t)_accessibilityRemoteSceneID
{
  return 0;
}

- (uint64_t)_accessibilityHostPid
{
  void *v2;
  void *v3;
  uint64_t v4;

  if (!_UIApplicationIsExtension())
    return 0;
  objc_msgSend(a1, "_accessibilityWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "rootViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  NSClassFromString(CFSTR("_UIViewServiceViewControllerOperator"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "safeIntForKey:", CFSTR("_hostPID"));
  else
    v4 = 0;

  return v4;
}

- (uint64_t)_accessibilityAllowsActivationWithoutBeingNativeFocused
{
  return 0;
}

- (BOOL)_accessibilityIsContainedByPreferredNativeFocusElement
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend((id)*MEMORY[0x1E0CEB258], "_accessibilityNativeFocusPreferredElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __77__NSObject_UIStorage___accessibilityIsContainedByPreferredNativeFocusElement__block_invoke;
    v7[3] = &unk_1E3DFDE98;
    v8 = v2;
    objc_msgSend(a1, "_accessibilityFindAncestor:startWithSelf:", v7, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_accessibilityIsContainedByVideoElement
{
  _BOOL8 v2;
  void *v3;

  if (_accessibilityIsContainedByVideoElement_onceToken != -1)
    dispatch_once(&_accessibilityIsContainedByVideoElement_onceToken, &__block_literal_global_2620);
  if (__PAIR128__(_accessibilityIsContainedByVideoElement_AVInfoPanelViewController, _accessibilityIsContainedByVideoElement_AVPlayerViewControllerClass) == 0)return 0;
  objc_msgSend(a1, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_2625, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v3 != 0;

  return v2;
}

- (uint64_t)_accessibilityExplorerElements
{
  return 0;
}

- (uint64_t)_accessibilityNativeFocusableElements:()UIStorage
{
  return 0;
}

- (uint64_t)_accessibilityNativeFocusableElements:()UIStorage withQueryString:
{
  return 0;
}

- (uint64_t)_accessibilityNativeFocusableElements:()UIStorage matchingBlock:
{
  return 0;
}

- (uint64_t)_accessibilityNativeFocusableElements:()UIStorage matchingBlock:forExistenceCheckOnly:
{
  return 0;
}

- (uint64_t)_accessibilitySiriContentNativeFocusableElements
{
  return 0;
}

- (uint64_t)_accessibilityFrameDelegate
{
  return 0;
}

- (uint64_t)_accessibilityExplorerElementReadPriority
{
  return 0;
}

- (uint64_t)_accessibilitySortExplorerElements:()UIStorage
{
  return objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_2627);
}

- (BOOL)_isAccessibilityExplorerElement
{
  void *v2;
  _BOOL8 v3;
  void *v4;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend((id)*MEMORY[0x1E0CEB258], "_accessibilityNativeFocusPreferredElement");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(a1, "isAccessibilityElement"))
    goto LABEL_4;
  v3 = 0;
  if ((objc_msgSend(a1, "_accessibilityIsFrameOutOfBoundsConsideringScrollParents:", 0) & 1) != 0)
    goto LABEL_5;
  objc_msgSend(a1, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_2628, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    goto LABEL_4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && !objc_msgSend(a1, "_accessibilityViewIsVisible"))
    goto LABEL_4;
  NSClassFromString(CFSTR("_UINavigationItemView"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_4;
  NSClassFromString(CFSTR("UINavigationItemView"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_4;
  if (objc_msgSend(a1, "_accessibilityShouldBeExplorerElementWithoutSystemFocus") && !v2)
  {
    v3 = 1;
    goto LABEL_5;
  }
  v6 = objc_msgSend(a1, "accessibilityTraits");
  if ((*MEMORY[0x1E0CEB120] & v6) != 0
    || (objc_msgSend(a1, "_accessibilityNativeFocusAncestor"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v7,
        v7))
  {
LABEL_4:
    v3 = 0;
    goto LABEL_5;
  }
  objc_msgSend(a1, "_accessibilityAncestorFocusParcel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 1;
  if (v8)
  {
    objc_msgSend(v2, "_accessibilityAncestorFocusParcel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 == v8)
      v3 = 0;
  }

LABEL_5:
  return v3;
}

- (uint64_t)_accessibilitySubviews
{
  return 0;
}

- (uint64_t)_accessibilityTextForSubhierarchyIncludingHeaders:()UIStorage focusableItems:exclusions:
{
  return objc_msgSend(a1, "_accessibilityTextForSubhierarchyIncludingHeaders:focusableItems:exclusions:classExclusions:", a3, a4, a5, 0);
}

- (id)_accessibilityTextForSubhierarchyIncludingHeaders:()UIStorage focusableItems:exclusions:classExclusions:
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v10 = a5;
  v11 = a6;
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilitySubviews");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "axSafelyAddObjectsFromArray:", v14);

  if (objc_msgSend(v13, "count"))
  {
    v15 = *MEMORY[0x1E0CEB120];
    do
    {
      objc_msgSend(v13, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "removeObject:", v16);
      if ((objc_msgSend(v16, "accessibilityElementsHidden") & 1) == 0)
      {
        objc_msgSend(v16, "_accessibilityAXAttributedLabel");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "length")
          && (objc_msgSend(v10, "containsObject:", v17) & 1) == 0
          && (objc_msgSend(v11, "containsObject:", objc_opt_class()) & 1) == 0
          && ((a4 & 1) != 0 || (objc_msgSend(v16, "_accessibilityCanBecomeNativeFocused") & 1) == 0)
          && ((a3 & 1) != 0 || (v15 & objc_msgSend(v16, "accessibilityTraits")) == 0))
        {
          objc_msgSend(v12, "addObject:", v17);
        }
        if ((objc_msgSend(v16, "isAccessibilityElement") & 1) == 0)
        {
          objc_msgSend(v16, "_accessibilitySortedElementsWithin");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "axSafelyAddObjectsFromArray:", v18);

        }
      }

    }
    while (objc_msgSend(v13, "count"));
  }
  objc_msgSend(v12, "array");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  UIAXLabelForElements(v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (BOOL)_accessibilityIsFocusParcel
{
  return (objc_msgSend(a1, "_accessibilityCanBecomeNativeFocused") & 1) != 0
      || objc_msgSend(a1, "_accessibilityFocusParcelChildrenCount:", 0) == 1;
}

- (uint64_t)_accessibilityFocusParcelChildrenCount:()UIStorage
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a1, "_accessibilityCanBecomeNativeFocused"))
  {
    ++a3;
  }
  else
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    objc_msgSend(a1, "_accessibilitySubviews", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          a3 = objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9++), "_accessibilityFocusParcelChildrenCount:", a3);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

  }
  return a3;
}

- (id)_accessibilityExtendedLabelForFocusParcelWithLabel:()UIStorage
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;

  v4 = a3;
  if (!v4)
  {
    v14 = objc_msgSend(a1, "_accessibilityCanBecomeNativeFocused");
    objc_msgSend(a1, "_accessibilityAncestorFocusParcel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend(a1, "_accessibilityAXAttributedValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "axArrayByIgnoringNilElementsWithCount:", 1, v12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_accessibilityTextForSubhierarchyIncludingHeaders:focusableItems:exclusions:", v14, 0, v5);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v5 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(a1, "_accessibilityAncestorFocusParcel");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (!v6 || (void *)v6 == a1)
      goto LABEL_11;
    v8 = objc_msgSend(a1, "_accessibilityCanBecomeNativeFocused");
    v9 = (void *)MEMORY[0x1E0C99D20];
    objc_msgSend(a1, "_accessibilityAXAttributedValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "axArrayByIgnoringNilElementsWithCount:", 1, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_accessibilityTextForSubhierarchyIncludingHeaders:focusableItems:exclusions:", v8, 0, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v5, "axContainsString:options:", v12, 1) & 1) != 0)
    {
LABEL_10:

LABEL_11:
      return v5;
    }
    if (objc_msgSend(v12, "axContainsString:options:", v5, 1))
    {
      v13 = v12;
    }
    else
    {
      __UIAXStringForVariables();
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
LABEL_9:
    v16 = v13;

    v5 = v16;
    goto LABEL_10;
  }
  return v5;
}

- (id)_accessibilityAncestorFocusParcel
{
  id v1;
  void *v2;
  id v3;
  void *v4;

  v1 = a1;
  if (v1)
  {
    v2 = v1;
    do
    {
      if (objc_msgSend(v2, "_accessibilityIsFocusParcel"))
        v3 = v2;
      else
        v3 = 0;
      objc_msgSend(v2, "accessibilityContainer");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3)
        break;
      v2 = v4;
    }
    while (v4);
  }
  else
  {
    v3 = 0;
    v4 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {

    v3 = 0;
  }

  return v3;
}

- (uint64_t)_accessibilitySupplementaryHeaderViewAtIndexPath:()UIStorage
{
  return 0;
}

- (uint64_t)_accessibilityElementsWithSemanticContext:()UIStorage
{
  return 0;
}

- (uint64_t)_accessibilitySiriContentElementsWithSemanticContext
{
  return 0;
}

- (uint64_t)_accessibilityApplicationHandleButtonAction:()UIStorage
{
  return 0;
}

- (id)_accessibilityProxyViewAncestorWhenMissingWindow
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a1, "accessibilityContainer");
  v1 = objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v2 = (void *)v1;
    while (1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v2, "window");
        v3 = (void *)objc_claimAutoreleasedReturnValue();

        if (v3)
          break;
      }
      objc_msgSend(v2, "_accessibilityProxyView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "window");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {

        return v4;
      }
      objc_msgSend(v2, "accessibilityContainer");
      v6 = objc_claimAutoreleasedReturnValue();

      v2 = (void *)v6;
      if (!v6)
        goto LABEL_7;
    }
    v4 = v2;
  }
  else
  {
LABEL_7:
    v4 = 0;
  }
  return v4;
}

- (uint64_t)_accessibilityProxyView
{
  return 0;
}

- (void)_accessibilityActivateDragWithDescriptorDictionary:()UIStorage forServiceName:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_19D0DD000, v0, v1, "Can't start drag for unexpected service name %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_iosAccessibilityPerformAction:()UIStorage withValue:fencePort:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_19D0DD000, v0, v1, "Not a UIFocusItem: Cannot draw focus around '%@'", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_iosAccessibilityPerformAction:()UIStorage withValue:fencePort:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_19D0DD000, v0, v1, "Unexpected parameter for kAXMoveNativeFocusWithHeadingAction: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_iosAccessibilityPerformAction:()UIStorage withValue:fencePort:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_19D0DD000, v0, v1, "Unexpected parameter for kAXMoveNativeFocusWithHeadingToElementMatchingQuery: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_iosAccessibilityPerformAction:()UIStorage withValue:fencePort:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_0(&dword_19D0DD000, v0, v1, "Unexpected parameter for kAXSetFocusEnabledForApplicationAction: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_accessibilitySpeakThisElementsAndStrings
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_19D0DD000, v0, v1, "Speak This elements were %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_accessibilityTextRectsForSpeakThisStringRange:()UIStorage .cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_9(&dword_19D0DD000, v0, (uint64_t)v0, "Found text markers %{public}@ and %{public}@", v1);
  OUTLINED_FUNCTION_2();
}

- (void)_accessibilityTextRectsForSpeakThisStringRange:()UIStorage .cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_0(&dword_19D0DD000, v0, v1, "Could not find text markers, using entire frame", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
