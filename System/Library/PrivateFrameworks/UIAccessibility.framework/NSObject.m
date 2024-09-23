@implementation NSObject

uint64_t __59__NSObject_AXPrivCategory___accessibilityAncestorIsKindOf___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

void __96__NSObject_UIAccessibilityElementTraversal___accessibilityElementsInDirectionWithCount_options___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  int v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "_accessibilityLeafDescendantsWithCount:shouldStopAtRemoteElement:options:", *(_QWORD *)(a1 + 64) - *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), 1, *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v5);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += objc_msgSend(v5, "count");
  }
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v7 = *(_QWORD *)(a1 + 64);
  if (v6 < v7)
  {
    objc_msgSend(v5, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "_accessibilityIsRemoteElement");

    if (!v9)
      goto LABEL_9;
    v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    v7 = *(_QWORD *)(a1 + 64);
  }
  if (v6 > v7)
    _AXAssert();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
  *a3 = 1;
LABEL_9:

}

uint64_t __129__NSObject_UIAccessibilityElementTraversal___accessibilityLeafDescendantsWithCount_shouldStopAtRemoteElement_options_treeLogger___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "_accessibilityAppendOrderedChildLeafDescendantsToArray:count:shouldStopAtRemoteElement:options:treeLogger:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  *a4 = result;
  return result;
}

void __129__NSObject_UIAccessibilityElementTraversal___accessibilityLeafDescendantsWithCount_shouldStopAtRemoteElement_options_treeLogger___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a2;
  if (*(_BYTE *)(a1 + 64) && (unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") >= *(_QWORD *)(a1 + 56)
    || *(_BYTE *)(a1 + 65)
    && (objc_msgSend(*(id *)(a1 + 32), "lastObject"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "_accessibilityIsRemoteElement"),
        v6,
        v7))
  {
    if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") > *(_QWORD *)(a1 + 56))
      _AXAssert();
    *a4 = 1;
  }
  else
  {
    if (*(_BYTE *)(a1 + 64))
    {
      v8 = *(_QWORD *)(a1 + 56);
      v9 = v8 - objc_msgSend(*(id *)(a1 + 32), "count");
    }
    else
    {
      v9 = 0;
    }
    objc_msgSend(v11, "_accessibilityLeafDescendantsWithCount:shouldStopAtRemoteElement:options:treeLogger:", v9, *(unsigned __int8 *)(a1 + 65), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", v10);

  }
}

void __151__NSObject_UIAccessibilityElementTraversal___accessibilityAppendOrderedChildLeafDescendantsToArray_count_shouldStopAtRemoteElement_options_treeLogger___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  char v15;

  v4 = *(_QWORD *)(a1 + 64);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __151__NSObject_UIAccessibilityElementTraversal___accessibilityAppendOrderedChildLeafDescendantsToArray_count_shouldStopAtRemoteElement_options_treeLogger___block_invoke_2;
  v9[3] = &unk_1E3DFE030;
  v5 = *(id *)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 56);
  v10 = v5;
  v13 = v6;
  v7 = *(id *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 72);
  v11 = v7;
  v14 = v8;
  v15 = *(_BYTE *)(a1 + 80);
  v12 = *(id *)(a1 + 48);
  objc_msgSend(a2, "enumerateObjectsWithOptions:usingBlock:", v4, v9);

}

uint64_t __151__NSObject_UIAccessibilityElementTraversal___accessibilityAppendOrderedChildLeafDescendantsToArray_count_shouldStopAtRemoteElement_options_treeLogger___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  id v7;
  uint64_t result;

  v6 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v6, "logElement:", v7);
  objc_msgSend(*(id *)(a1 + 32), "push");
  LOBYTE(v6) = objc_msgSend(v7, "_accessibilityAppendOrderedChildLeafDescendantsToArray:count:shouldStopAtRemoteElement:options:treeLogger:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 72), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = (_BYTE)v6;
  result = objc_msgSend(*(id *)(a1 + 32), "pop");
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  return result;
}

uint64_t __165__NSObject_UIAccessibilityElementTraversal___accessibilityEnumerateSiblingsFromOrderedChildrenContainer_fromChildAtIndex_headerIndex_footerIndex_options_usingBlock___block_invoke(uint64_t result)
{
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

void __165__NSObject_UIAccessibilityElementTraversal___accessibilityEnumerateSiblingsFromOrderedChildrenContainer_fromChildAtIndex_headerIndex_footerIndex_options_usingBlock___block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v5 = objc_msgSend(v9, "count");
    if (v5 > a3)
    {
      v6 = v5;
      do
      {
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
          break;
        v7 = *(_QWORD *)(a1 + 32);
        objc_msgSend(v9, "objectAtIndexedSubscript:", a3);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        (*(void (**)(uint64_t, void *, uint64_t))(v7 + 16))(v7, v8, *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

        if (*(_BYTE *)(a1 + 48))
          ++a3;
        else
          --a3;
      }
      while (a3 < v6);
    }
  }

}

BOOL __106__NSObject_UIAccessibilityElementTraversal___accessibilityEnumerateSiblingsWithParent_options_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + 32) == a2;
}

uint64_t __115__NSObject_UIAccessibilityElementTraversal___addAccessibilityElementsAndOrderedContainersWithOptions_toCollection___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_accessibilityAdditionalElementOrderedLast") ^ 1;
}

uint64_t __115__NSObject_UIAccessibilityElementTraversal___addAccessibilityElementsAndOrderedContainersWithOptions_toCollection___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_accessibilityAdditionalElementOrderedLast");
}

BOOL __60__NSObject_AXPrivCategory___accessibilityHitTest_withEvent___block_invoke()
{
  objc_class *v0;
  objc_method *InstanceMethod;
  IMP Implementation;
  NSObject *v3;

  if (UIAccessibilityStorageKeyShouldHittestFallBackToNearestChild_block_invoke_onceToken != -1)
    dispatch_once(&UIAccessibilityStorageKeyShouldHittestFallBackToNearestChild_block_invoke_onceToken, &__block_literal_global_5);
  v0 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v0, sel_accessibilityHitTest_withEvent_);
  if (InstanceMethod)
  {
    Implementation = method_getImplementation(InstanceMethod);
  }
  else
  {
    AXLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      __60__NSObject_AXPrivCategory___accessibilityHitTest_withEvent___block_invoke_cold_1();

    Implementation = 0;
  }
  return Implementation != (IMP)UIAccessibilityStorageKeyShouldHittestFallBackToNearestChild_block_invoke_BaseImplementation;
}

void __60__NSObject_AXPrivCategory___accessibilityHitTest_withEvent___block_invoke_2()
{
  objc_class *v0;
  objc_method *InstanceMethod;
  NSObject *v2;

  v0 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v0, sel_accessibilityHitTest_withEvent_);
  if (InstanceMethod)
  {
    UIAccessibilityStorageKeyShouldHittestFallBackToNearestChild_block_invoke_BaseImplementation = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    AXLogCommon();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
      __60__NSObject_AXPrivCategory___accessibilityHitTest_withEvent___block_invoke_2_cold_1(sel_accessibilityHitTest_withEvent_);

  }
}

double __64__NSObject_AXPrivCategory___accessibilityBaseHitTest_withEvent___block_invoke(uint64_t a1, void *a2, double a3, double a4)
{
  id v7;
  double v8;
  void *v9;
  double v10;

  v7 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "convertPoint:fromView:", *(_QWORD *)(a1 + 32), a3, a4);
LABEL_9:
      a3 = v8;
      goto LABEL_10;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(*(id *)(a1 + 32), "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "convertPoint:fromLayer:", v9, a3, a4);
    a3 = v10;

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v8 = UIAccessibilityPointToPoint(*(void **)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
      goto LABEL_9;
    }
  }
LABEL_10:

  return a3;
}

id __64__NSObject_AXPrivCategory___accessibilityBaseHitTest_withEvent___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  objc_msgSend(v3, "accessibilityHitTest:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    (*(void (**)(double, double))(*(_QWORD *)(a1 + 40) + 16))(*(double *)(a1 + 48), *(double *)(a1 + 56));
    objc_msgSend(v3, "_accessibilityHitTest:withEvent:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

void __64__NSObject_AXPrivCategory___accessibilityBaseHitTest_withEvent___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "isAccessibilityElement"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

uint64_t __61__NSObject_AXPrivCategory____accessibilityVisibleScrollArea___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;
  double v6;
  uint64_t v7;
  uint64_t v8;

  result = objc_msgSend(a2, "_accessibilityVisibleScrollArea:", *(unsigned __int8 *)(a1 + 40));
  if (v6 != 2147483650.0)
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    *(double *)(v8 + 32) = v6;
    *(_QWORD *)(v8 + 40) = v7;
    *a3 = 1;
  }
  return result;
}

void __72__NSObject_AXPrivCategory___accessibilityShouldSpeakScrollStatusOnEntry__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  objc_class *v5;
  id v6;

  v6 = a2;
  v5 = (objc_class *)objc_opt_class();
  if (class_getInstanceMethod(v5, *(SEL *)(a1 + 40)) != (Method)_accessibilityShouldSpeakScrollStatusOnEntry_BaseNSObjectMethod
    && objc_msgSend(v6, "_accessibilityShouldSpeakScrollStatusOnEntry"))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }

}

void __54__NSObject_AXPrivCategory___accessibilityScrollStatus__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  id v6;

  v6 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v6, "_accessibilityIsScrollAncestor"))
  {
    objc_msgSend(v6, "_accessibilityScrollStatus");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v5);
      *a3 = 1;
    }

  }
}

void __93__NSObject_AXPrivCategory___accessibilityScrollAncestorForSelector_alwaysAllowRefreshAction___block_invoke(_QWORD *a1, void *a2, _BYTE *a3)
{
  void *v6;
  int v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;

  v15 = a2;
  if (objc_msgSend(v15, "_accessibilityIsScrollAncestor"))
  {
    if (!a1[6]
      || (objc_opt_respondsToSelector() & 1) != 0
      && (objc_msgSend(v15, "safeValueForKey:", a1[4]),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v6, "BOOLValue"),
          v6,
          v7))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v8 = v15;
        objc_msgSend(v8, "safeCGSizeForKey:", CFSTR("_accessibilityContentSize"));
      }
      else
      {
        if (!objc_msgSend(v15, "_accessibilityIsWebDocumentView"))
        {
          v8 = 0;
LABEL_15:
          objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a2);
          *a3 = 1;
LABEL_16:

          goto LABEL_17;
        }
        objc_msgSend(v15, "safeValueForKey:", CFSTR("_scroller"));
        v8 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "contentSize");
      }
      v11 = v9;
      v12 = v10;
      if (v8)
      {
        objc_msgSend(v8, "visibleBounds");
        if (v14 == v11 && v13 == v12)
          goto LABEL_16;
      }
      goto LABEL_15;
    }
  }
LABEL_17:

}

uint64_t __69__NSObject_AXPrivCategory___accessibilityIterateParentsForTestBlock___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

uint64_t __53__NSObject_AXPrivCategory___accessibilityIsEscapable__block_invoke(uint64_t a1, void *a2)
{
  id v4;
  objc_class *v5;
  uint64_t v6;
  objc_class *v7;
  void *v8;
  objc_class *v9;
  objc_class *v10;

  v4 = a2;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  v5 = (objc_class *)objc_opt_class();
  if (class_getInstanceMethod(v5, *(SEL *)(a1 + 48)) == (Method)_accessibilityIsEscapable_BaseCanPerformMethod)
  {
    v7 = (objc_class *)objc_opt_class();
    if (class_getInstanceMethod(v7, *(SEL *)(a1 + 56)) != (Method)_accessibilityIsEscapable_BaseNSObjectMethod)
    {
      v6 = 1;
      goto LABEL_14;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CEABB8], "viewControllerForView:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v8);
      if (v8)
      {
        v9 = (objc_class *)objc_opt_class();
        if (class_getInstanceMethod(v9, *(SEL *)(a1 + 48)) != (Method)_accessibilityIsEscapable_BaseCanPerformMethod)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
          v6 = objc_msgSend(v8, "_accessibilityCanPerformEscapeAction");
LABEL_11:

          goto LABEL_14;
        }
        v10 = (objc_class *)objc_opt_class();
        if (class_getInstanceMethod(v10, *(SEL *)(a1 + 56)) != (Method)_accessibilityIsEscapable_BaseNSObjectMethod)
        {
          v6 = 1;
          goto LABEL_11;
        }
      }

    }
    v6 = 0;
    goto LABEL_14;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  v6 = objc_msgSend(v4, "_accessibilityCanPerformEscapeAction");
LABEL_14:

  return v6;
}

uint64_t __54__NSObject_AXPrivCategory___accessibilityIsScrollable__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  objc_class *v3;
  objc_class *v4;
  uint64_t v5;
  char v6;
  void *v8;
  objc_class *v9;

  v2 = a2;
  if ((objc_msgSend(v2, "_accessibilityIsWebDocumentView") & 1) != 0)
    goto LABEL_7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    goto LABEL_7;
  if (!UIAccessibilityStorageKeyShouldHittestFallBackToNearestChild_block_invoke_2_BaseNSObjectMethod)
  {
    v3 = (objc_class *)objc_opt_class();
    UIAccessibilityStorageKeyShouldHittestFallBackToNearestChild_block_invoke_2_BaseNSObjectMethod = (uint64_t)class_getInstanceMethod(v3, sel_accessibilityScroll_);
  }
  v4 = (objc_class *)objc_opt_class();
  if (class_getInstanceMethod(v4, sel_accessibilityScroll_) != (Method)UIAccessibilityStorageKeyShouldHittestFallBackToNearestChild_block_invoke_2_BaseNSObjectMethod
    || (v5 = objc_msgSend(v2, "accessibilityTraits"), (UIAccessibilityTraitScrollable & v5) != 0))
  {
LABEL_7:
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CEABB8], "viewControllerForView:", v2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = (objc_class *)objc_opt_class();
        if (class_getInstanceMethod(v9, sel_accessibilityScroll_) == (Method)UIAccessibilityStorageKeyShouldHittestFallBackToNearestChild_block_invoke_2_BaseNSObjectMethod)
          v6 = 0;
        else
          v6 = -1;
      }
      else
      {
        v6 = 0;
      }

    }
    else
    {
      v6 = 0;
    }
  }

  return v6 & 1;
}

BOOL __56__NSObject_AXPrivCategory___accessibilityTabBarAncestor__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;

  v2 = objc_msgSend(a2, "accessibilityTraits");
  return (*MEMORY[0x1E0CEB180] & ~v2) == 0;
}

void __61__NSObject_AXPrivCategory___accessibilityBaseScrollToVisible__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSString *v8;
  objc_class *v9;
  NSObject *v10;
  id v11;
  int v12;
  NSObject *v13;
  char v14;
  NSObject *v15;

  v3 = a2;
  AXLogScrollToVisible();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __61__NSObject_AXPrivCategory___accessibilityBaseScrollToVisible__block_invoke_cold_8(v3, v4);

  if ((objc_msgSend(v3, "_accessibilityScrollingEnabled") & 1) == 0)
  {
    AXLogScrollToVisible();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __61__NSObject_AXPrivCategory___accessibilityBaseScrollToVisible__block_invoke_cold_7();
    goto LABEL_9;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= objc_msgSend(v3, "accessibilityScrollToVisibleWithChild:", *(_QWORD *)(a1 + 32));
    AXLogScrollToVisible();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __61__NSObject_AXPrivCategory___accessibilityBaseScrollToVisible__block_invoke_cold_2();
LABEL_9:

    goto LABEL_10;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= objc_msgSend(v3, "accessibilityScrollToVisible");
    AXLogScrollToVisible();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __61__NSObject_AXPrivCategory___accessibilityBaseScrollToVisible__block_invoke_cold_3();
    goto LABEL_9;
  }
  if (*(id *)(a1 + 32) != v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || objc_msgSend(v3, "_accessibilityIsWebDocumentView"))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = *(id *)(a1 + 32);
      }
      else
      {
        NSClassFromString(CFSTR("UIAccessibilityElementMockView"));
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v5 = 0;
          goto LABEL_25;
        }
        objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("view"));
        v7 = objc_claimAutoreleasedReturnValue();
      }
      v5 = v7;
LABEL_25:
      objc_msgSend(v3, "_accessibilityUserTestingElementBaseType");
      v8 = (NSString *)objc_claimAutoreleasedReturnValue();
      v9 = NSClassFromString(v8);

      if (!v9)
        v9 = (objc_class *)objc_opt_class();
      AXLogScrollToVisible();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        __61__NSObject_AXPrivCategory___accessibilityBaseScrollToVisible__block_invoke_cold_6((uint64_t)v5, v9, v10);

      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)
        || (objc_msgSend(*(id *)(a1 + 32), "_accessibilityAncestorIsKindOf:", v9),
            v11 = (id)objc_claimAutoreleasedReturnValue(),
            v11,
            v11 != v3))
      {
        v12 = objc_msgSend(*(id *)(a1 + 32), "_accessibilityShouldAttemptScrollToFrameOnParentView");
        AXLogScrollToVisible();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          __61__NSObject_AXPrivCategory___accessibilityBaseScrollToVisible__block_invoke_cold_5();

        if (v12)
        {
          objc_msgSend(*(id *)(a1 + 32), "accessibilityFrameForScrolling");
          v14 = objc_msgSend(v3, "_accessibilityScrollToFrame:forView:", v5);
          AXLogScrollToVisible();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
            __61__NSObject_AXPrivCategory___accessibilityBaseScrollToVisible__block_invoke_cold_4();

          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) |= v14;
        }
      }
      goto LABEL_9;
    }
  }
LABEL_10:
  AXLogScrollToVisible();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __61__NSObject_AXPrivCategory___accessibilityBaseScrollToVisible__block_invoke_cold_1(v3, v6);

}

void __69__NSObject_AXPrivCategory___animateScrollViewWithScrollAmount_point___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;

  v19 = a2;
  if (objc_msgSend(v19, "_accessibilityIsScrollAncestor"))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (objc_msgSend(v19, "isScrollEnabled"))
      {
        if (*(double *)(a1 + 48) >= 0.0)
        {
          objc_msgSend(v19, "contentSize");
          v13 = v12;
          objc_msgSend(v19, "accessibilityFrame");
          v15 = v13 - v14;
          objc_msgSend(v19, "contentOffset");
          v17 = v15 - v16;
          objc_msgSend(v19, "adjustedContentInset");
          v10 = v18 + v17;
          if (v18 + v17 > 0.0)
          {
            v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
            if (v10 >= *(double *)(v11 + 24))
              v10 = *(double *)(v11 + 24);
            goto LABEL_12;
          }
        }
        else
        {
          objc_msgSend(v19, "contentOffset");
          v7 = v6;
          objc_msgSend(v19, "adjustedContentInset");
          v9 = v7 + v8;
          if (v9 > 0.0)
          {
            v10 = -v9;
            v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
            if (*(double *)(v11 + 24) > v10)
              v10 = *(double *)(v11 + 24);
LABEL_12:
            *(double *)(v11 + 24) = v10;
            *a3 = 1;
            objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
          }
        }
      }
    }
  }

}

void __62__NSObject_AXPrivCategory___accessibilityScrollRectToVisible___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  double v5;
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;

  v22 = a2;
  if (objc_msgSend(v22, "_accessibilityIsScrollAncestor"))
  {
    if (objc_msgSend(v22, "_accessibilityScrollingEnabled"))
    {
      objc_msgSend(v22, "_accessibilityContentOffset");
      v4 = v3;
      v6 = v5;
      objc_msgSend(v22, "_accessibilityScrollToFrame:forView:", 0, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56));
      objc_msgSend(v22, "_accessibilityContentOffset");
      v9 = v8;
      v10 = v7;
      if (v4 != v8 || v6 != v7)
      {
        v11 = UIAccessibilityFrameToBounds(v22, *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56));
        v12 = v9 - v4;
        v13 = v10 - v6;
        v17 = UIAccessibilityFrameForBounds(v22, v11 - v12, v14 - v13, v15, v16);
        v18 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
        *(double *)(v18 + 32) = v17;
        *(_QWORD *)(v18 + 40) = v19;
        *(_QWORD *)(v18 + 48) = v20;
        *(_QWORD *)(v18 + 56) = v21;
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = v12
                                                                    + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                                + 32);
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = v13
                                                                    + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                                + 40);
      }
    }
  }

}

void __61__NSObject_AXPrivCategory___accessibilityHandlePublicScroll___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(v8, "accessibilityScroll:", *(_QWORD *)(a1 + 48)))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if ((objc_msgSend(*(id *)(a1 + 32), "_accessibilityIgnoreDelegate") & 1) != 0)
      {
        v5 = 0;
      }
      else
      {
        objc_msgSend(v8, "safeValueForKey:", CFSTR("delegate"));
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if ((objc_opt_respondsToSelector() & 1) != 0
        && objc_msgSend(v5, "accessibilityScroll:", *(_QWORD *)(a1 + 48)))
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
        *a3 = 1;
      }
    }
    else
    {
      v5 = 0;
    }
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        objc_msgSend(v8, "safeValueForKey:", CFSTR("dataSource"));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6 != v5
          && (objc_opt_respondsToSelector() & 1) != 0
          && objc_msgSend(v6, "accessibilityScroll:", *(_QWORD *)(a1 + 48)))
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
          *a3 = 1;
        }

      }
    }
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CEABB8], "viewControllerForView:", v8);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "accessibilityScroll:", *(_QWORD *)(a1 + 48)))
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
          *a3 = 1;
        }

      }
    }

  }
}

void __54__NSObject_AXPrivCategory___accessibilityScrollParent__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "_accessibilityIsScrollAncestor"))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }

}

uint64_t __64__NSObject_AXPrivCategory___accessibility2DBrailleCanvasElement__block_invoke(uint64_t a1, void *a2)
{
  return (objc_msgSend(a2, "_accessibilityMediaAnalysisOptions") >> 20) & 1;
}

uint64_t __62__NSObject_AXPrivCategory___accessibilityMediaAnalysisElement__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_accessibilityCanBeConsideredMediaAnalysisElement");
}

Method __86__NSObject_AXPrivCategory__accessibilityShouldEnumerateContainerElementsArrayDirectly__block_invoke()
{
  objc_class *v0;
  Method result;

  v0 = (objc_class *)objc_opt_class();
  accessibilityShouldEnumerateContainerElementsArrayDirectly_elementsBaseMethod = (uint64_t)class_getInstanceMethod(v0, sel__accessibilityElements);
  accessibilityShouldEnumerateContainerElementsArrayDirectly_elementsCountBaseMethod = (uint64_t)class_getInstanceMethod(v0, sel_accessibilityElementCount);
  result = class_getInstanceMethod(v0, sel_accessibilityElementAtIndex_);
  accessibilityShouldEnumerateContainerElementsArrayDirectly_elementAtIndexBaseMethod = (uint64_t)result;
  return result;
}

void __90__NSObject_AXPrivCategory__accessibilityEnumerateContainerElementsWithOptions_usingBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

BOOL __63__NSObject_AXPrivCategory___accessibilityContainerInDirection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;

  v3 = a2;
  v4 = (objc_msgSend(v3, "_accessibilityIsTouchContainer") & 1) != 0 || *(_QWORD *)(a1 + 32) == (_QWORD)v3;

  return v4;
}

BOOL __66__NSObject_AXPrivCategory___accessibilityGuideElementInDirection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;

  v3 = a2;
  v4 = (objc_msgSend(v3, "_accessibilityIsGuideElement") & 1) != 0 || *(_QWORD *)(a1 + 32) == (_QWORD)v3;

  return v4;
}

void __44__NSObject_AXPrivCategory___axAncestorTypes__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "safeValueForKey:", CFSTR("_browserAccessibilityStoredValueContainerType"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v4 = objc_msgSend(*(id *)(a1 + 32), "beaxContainerTypeFromUIKitContainerType:", objc_msgSend(v8, "safeIntegerForKey:", CFSTR("browserAccessibilityContainerType")));
      if (!v4)
        goto LABEL_8;
      goto LABEL_7;
    }
  }
  v5 = objc_msgSend(v8, "accessibilityContainerType");
  if (v5)
  {
    v4 = objc_msgSend(*(id *)(a1 + 32), "axContainerTypeFromUIKitContainerType:", v5);
LABEL_7:
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v8, v7);

  }
LABEL_8:

}

void __90__NSObject_AXPrivCategory___accessibilitySiblingWithAncestor_isFirst_isLast_sawAXElement___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  id v7;

  v6 = a2;
  if (*(id *)(a1 + 32) == v6)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    v7 = v6;
    if (objc_msgSend(v6, "isAccessibilityElement"))
    {
      **(_BYTE **)(a1 + 48) = 1;
    }
    else
    {
      if (!objc_msgSend(*(id *)(a1 + 32), "_accessibilitySiblingWithAncestor:isFirst:isLast:sawAXElement:", v7, *(unsigned __int8 *)(a1 + 56), *(unsigned __int8 *)(a1 + 57), *(_QWORD *)(a1 + 48)))
      {
        v6 = v7;
        if (!**(_BYTE **)(a1 + 48))
          goto LABEL_9;
        goto LABEL_8;
      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }
    v6 = v7;
  }
LABEL_8:
  *a4 = 1;
LABEL_9:

}

void __56__NSObject_AXPrivCategory___accessibilityContainerTypes__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_accessibilityGetBlockForAttribute:", 43);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = (*(uint64_t (**)(uint64_t))(v3 + 16))(v3);
  else
    v5 = objc_msgSend(v12, "accessibilityContainerType");
  v6 = v5;
  if (v5)
  {
    v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v10 = *(void **)(v9 + 40);
      *(_QWORD *)(v9 + 40) = v8;

      v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", objc_msgSend(*(id *)(a1 + 32), "axContainerTypeFromUIKitContainerType:", v6));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v11);

  }
}

id __70__NSObject_AXPrivCategory___accessibilityInternalTextLinkCustomRotors__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  void *v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_accessibilityInternalTextLinks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v3, "currentItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "targetElement");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v5, "indexOfObject:", v7);

    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = 0;
    }
    else if (objc_msgSend(v3, "searchDirection"))
    {
      v9 = v8 + 1;
    }
    else
    {
      v9 = v8 - 1;
    }
    if (v9 >= objc_msgSend(*(id *)(a1 + 32), "count"))
    {
      v9 = 0;
    }
    else if ((v9 & 0x8000000000000000) != 0)
    {
      v9 = objc_msgSend(*(id *)(a1 + 32), "count") - 1;
    }
    v10 = objc_alloc_init(MEMORY[0x1E0CEA290]);
    objc_msgSend(v5, "objectAtIndex:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTargetElement:", v11);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __56__NSObject_AXPrivCategory___accessibilityActiveKeyboard__block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

uint64_t __56__NSObject_AXPrivCategory___accessibilityActiveKeyboard__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    isKindOfClass = 1;
  else
    isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __63__NSObject_AXPrivCategory___accessibilityAccessibleDescendants__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isAccessibilityElement");
}

uint64_t __64__NSObject_AXPrivCategory___accessibilityWatchAutoSpeakElements__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  NSObject *v9;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "_iosAccessibilityAttributeValue:", 15000);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_iosAccessibilityAttributeValue:", 15002);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_iosAccessibilityAttributeValue:", 15001);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = 0;
  if (v3 && v4 && v5)
  {
    objc_msgSend(MEMORY[0x1E0CF4E98], "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "gizmoGetAutoSpeakEnabledForComplication:slot:face:", v5, v4, v3);

    if (v8)
    {
      AXLogCommon();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v11 = 138412546;
        v12 = v4;
        v13 = 2112;
        v14 = v3;
        _os_log_impl(&dword_19D0DD000, v9, OS_LOG_TYPE_INFO, "auto speak element at slot: %@, face: %@", (uint8_t *)&v11, 0x16u);
      }

      v6 = 1;
    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

uint64_t __63__NSObject_AXPrivCategory___accessibilitySoftwareMimicKeyboard__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_accessibilityIsSoftwareKeyboardMimic");
}

void __55__NSObject_AXPrivCategory___accessibilityCustomActions__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "count"))
  {
    v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v6 = *(void **)(v5 + 40);
      *(_QWORD *)(v5 + 40) = v4;

      v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    }
    objc_msgSend(v3, "addObjectsFromArray:", v7);
  }

}

BOOL __55__NSObject_AXPrivCategory___accessibilityCustomActions__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  unint64_t v5;
  unint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(a2, "sortPriority");
  v6 = objc_msgSend(v4, "sortPriority");

  return v5 > v6;
}

BOOL __62__NSObject_AXPrivCategory___accessibilityFirstElementForFocus__block_invoke()
{
  objc_class *v0;
  objc_method *InstanceMethod;
  IMP Implementation;
  NSObject *v3;

  if (kAXContainerAncestorTypeKey_block_invoke_3_onceToken != -1)
    dispatch_once(&kAXContainerAncestorTypeKey_block_invoke_3_onceToken, &__block_literal_global_489);
  v0 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v0, sel__accessibilityFirstElementForFocus);
  if (InstanceMethod)
  {
    Implementation = method_getImplementation(InstanceMethod);
  }
  else
  {
    AXLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      __60__NSObject_AXPrivCategory___accessibilityHitTest_withEvent___block_invoke_cold_1();

    Implementation = 0;
  }
  return Implementation != (IMP)kAXContainerAncestorTypeKey_block_invoke_3_BaseImplementation;
}

void __62__NSObject_AXPrivCategory___accessibilityFirstElementForFocus__block_invoke_2()
{
  objc_class *v0;
  objc_method *InstanceMethod;
  NSObject *v2;

  v0 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v0, sel__accessibilityFirstElementForFocus);
  if (InstanceMethod)
  {
    kAXContainerAncestorTypeKey_block_invoke_3_BaseImplementation = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    AXLogCommon();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
      __60__NSObject_AXPrivCategory___accessibilityHitTest_withEvent___block_invoke_2_cold_1(sel__accessibilityFirstElementForFocus);

  }
}

BOOL __74__NSObject_AXPrivCategory___accessibilityFirstElementForFocusWithOptions___block_invoke()
{
  objc_class *v0;
  objc_method *InstanceMethod;
  IMP Implementation;
  NSObject *v3;

  if (kAXContainerAncestorTypeKey_block_invoke_4_onceToken != -1)
    dispatch_once(&kAXContainerAncestorTypeKey_block_invoke_4_onceToken, &__block_literal_global_492);
  v0 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v0, sel__accessibilityFirstElementForFocus);
  if (InstanceMethod)
  {
    Implementation = method_getImplementation(InstanceMethod);
  }
  else
  {
    AXLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      __60__NSObject_AXPrivCategory___accessibilityHitTest_withEvent___block_invoke_cold_1();

    Implementation = 0;
  }
  return Implementation != (IMP)kAXContainerAncestorTypeKey_block_invoke_4_BaseImplementation;
}

void __74__NSObject_AXPrivCategory___accessibilityFirstElementForFocusWithOptions___block_invoke_2()
{
  objc_class *v0;
  objc_method *InstanceMethod;
  NSObject *v2;

  v0 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v0, sel__accessibilityFirstElementForFocus);
  if (InstanceMethod)
  {
    kAXContainerAncestorTypeKey_block_invoke_4_BaseImplementation = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    AXLogCommon();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
      __60__NSObject_AXPrivCategory___accessibilityHitTest_withEvent___block_invoke_2_cold_1(sel__accessibilityFirstElementForFocus);

  }
}

uint64_t __57__NSObject_AXPrivCategory___accessibilityFirstWebElement__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a2;
  v4 = objc_msgSend(v3, "accessibilityTraits");
  if ((*MEMORY[0x1E0CF4678] & v4) != 0)
    v5 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  else
    v5 = 0;

  return v5;
}

uint64_t __111__NSObject_AXPrivCategory___accessibilityFirstContainedElementForTechnology_honoringGroups_shouldAlwaysScroll___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(_QWORD *)(a1 + 32) == a2)
    return 0;
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

Method __67__NSObject_AXPrivCategory___accessibilityFirstElementsForSpeakThis__block_invoke()
{
  objc_class *v0;
  Method result;

  v0 = (objc_class *)objc_opt_class();
  result = class_getInstanceMethod(v0, sel__accessibilitySpeakThisElementsAndStrings);
  _accessibilityFirstElementsForSpeakThis_speakThisElementsBaseMethod = (uint64_t)result;
  return result;
}

Method __66__NSObject_AXPrivCategory___accessibilityNextElementsForSpeakThis__block_invoke()
{
  objc_class *v0;
  objc_class *v1;
  Method result;

  v0 = (objc_class *)objc_opt_class();
  _accessibilityNextElementsForSpeakThis_speakThisElementsBaseMethod = (uint64_t)class_getInstanceMethod(v0, sel__accessibilitySpeakThisElementsAndStrings);
  v1 = (objc_class *)objc_opt_class();
  result = class_getInstanceMethod(v1, sel__accessibilitySpeakThisElementsAndStrings);
  _accessibilityNextElementsForSpeakThis_speakThisElementsVCBaseMethod = (uint64_t)result;
  return result;
}

void __66__NSObject_AXPrivCategory___accessibilityHeaderElementsForColumn___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(a2, "accessibilityHeaderElementsForColumn:", *(_QWORD *)(a1 + 40));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    *a3 = 1;
}

void __63__NSObject_AXPrivCategory___accessibilityHeaderElementsForRow___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(a2, "accessibilityHeaderElementsForRow:", *(_QWORD *)(a1 + 40));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    *a3 = 1;
}

void __60__NSObject_AXPrivCategory___accessibilityPublicCustomRotors__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v1 = (void *)RotorCache;
  RotorCache = (uint64_t)v0;

}

Method __84__NSObject_AXPrivCategory___accessibilityOverridesPotentiallyAttributedAPISelector___block_invoke()
{
  objc_class *v0;
  objc_class *v1;
  objc_class *v2;
  objc_class *v3;
  objc_class *v4;
  objc_class *v5;
  objc_class *v6;
  objc_class *v7;
  Method result;

  v0 = (objc_class *)objc_opt_class();
  _accessibilityOverridesPotentiallyAttributedAPISelector__accessibilityLabelBaseMethod = (uint64_t)class_getInstanceMethod(v0, sel_accessibilityLabel);
  v1 = (objc_class *)objc_opt_class();
  _accessibilityOverridesPotentiallyAttributedAPISelector__accessibilityValueBaseMethod = (uint64_t)class_getInstanceMethod(v1, sel_accessibilityValue);
  v2 = (objc_class *)objc_opt_class();
  _accessibilityOverridesPotentiallyAttributedAPISelector__accessibilityHintBaseMethod = (uint64_t)class_getInstanceMethod(v2, sel_accessibilityHint);
  v3 = (objc_class *)objc_opt_class();
  _accessibilityOverridesPotentiallyAttributedAPISelector__accessibilityUserInputLabelsBaseMethod = (uint64_t)class_getInstanceMethod(v3, sel_accessibilityUserInputLabels);
  v4 = (objc_class *)objc_opt_class();
  _accessibilityOverridesPotentiallyAttributedAPISelector__accessibilityAttributedLabelBaseMethod = (uint64_t)class_getInstanceMethod(v4, sel_accessibilityAttributedLabel);
  v5 = (objc_class *)objc_opt_class();
  _accessibilityOverridesPotentiallyAttributedAPISelector__accessibilityAttributedValueBaseMethod = (uint64_t)class_getInstanceMethod(v5, sel_accessibilityAttributedValue);
  v6 = (objc_class *)objc_opt_class();
  _accessibilityOverridesPotentiallyAttributedAPISelector__accessibilityAttributedHintBaseMethod = (uint64_t)class_getInstanceMethod(v6, sel_accessibilityAttributedHint);
  v7 = (objc_class *)objc_opt_class();
  result = class_getInstanceMethod(v7, sel_accessibilityAttributedUserInputLabels);
  _accessibilityOverridesPotentiallyAttributedAPISelector__accessibilityAttributedUserInputLabelsBaseMethod = (uint64_t)result;
  return result;
}

uint64_t __133__NSObject_AXPrivCategory___accessibilityPrefersNonAttributedAttributeWithOverrideSelector_nonAttributedSelector_attributedSelector___block_invoke()
{
  uint64_t result;

  result = objc_opt_class();
  _accessibilityPrefersNonAttributedAttributeWithOverrideSelector_nonAttributedSelector_attributedSelector__NSObjectClass = result;
  return result;
}

void __112__NSObject_AXPrivCategory___accessibilityPotentiallyAttributedValueForNonAttributedSelector_attributedSelector___block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  _accessibilityPotentiallyAttributedValueForNonAttributedSelector_attributedSelector__accessibilityLabelSEL = (uint64_t)sel_accessibilityLabel;
  _accessibilityPotentiallyAttributedValueForNonAttributedSelector_attributedSelector__accessibilityValueSEL = (uint64_t)sel_accessibilityValue;
  _accessibilityPotentiallyAttributedValueForNonAttributedSelector_attributedSelector__accessibilityHintSEL = (uint64_t)sel_accessibilityHint;
  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 512, 16);
  v1 = (void *)processedClasses;
  processedClasses = v0;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserver:selector:name:object:", objc_opt_class(), sel__accessibilityClearProcessedClasses_, *MEMORY[0x1E0DDD498], 0);

}

id __69__NSObject_AXPrivCategory___accessibilityAXAttributedUserInputLabels__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0CF40C0];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithCFAttributedString:", v3);

  return v4;
}

id __69__NSObject_AXPrivCategory___accessibilityAXAttributedUserInputLabels__block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0CF40C0];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithCFAttributedString:", v3);

  return v4;
}

uint64_t __55__NSObject_AXPrivCategory___accessibilityGroupedParent__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_accessibilityIsGroupedParent");
}

uint64_t __70__NSObject_AXPrivCategory___accessibilityProcessChildrenForParameter___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  if ((id)a1[4] != v3 && (*(unsigned int (**)(void))(a1[6] + 16))())
  {
    objc_msgSend(v3, "_accessibilityGroupedParent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)a1[5];
    if (v4)
    {
      if (v5 && (objc_msgSend(v5, "isEqual:", v4) & 1) != 0)
        goto LABEL_6;
    }
    else if (!v5)
    {
LABEL_6:
      v6 = 1;
LABEL_10:

      goto LABEL_11;
    }
    v6 = 0;
    goto LABEL_10;
  }
  v6 = 0;
LABEL_11:

  return v6;
}

uint64_t __73__NSObject_AXPrivCategory___iosAccessibilityAttributeValue_forParameter___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(_QWORD *)(a1 + 32) == a2)
    return 0;
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __60__NSObject_AXPrivCategory___iosAccessibilityAttributeValue___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

BOOL __60__NSObject_AXPrivCategory___iosAccessibilityAttributeValue___block_invoke_747()
{
  objc_class *v0;
  objc_method *InstanceMethod;
  IMP Implementation;
  NSObject *v3;

  if (processedClasses_block_invoke_5_onceToken != -1)
    dispatch_once(&processedClasses_block_invoke_5_onceToken, &__block_literal_global_748);
  v0 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v0, sel__accessibilitySelectedChildren);
  if (InstanceMethod)
  {
    Implementation = method_getImplementation(InstanceMethod);
  }
  else
  {
    AXLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      __60__NSObject_AXPrivCategory___accessibilityHitTest_withEvent___block_invoke_cold_1();

    Implementation = 0;
  }
  return Implementation != (IMP)processedClasses_block_invoke_5_BaseImplementation;
}

void __60__NSObject_AXPrivCategory___iosAccessibilityAttributeValue___block_invoke_2()
{
  objc_class *v0;
  objc_method *InstanceMethod;
  NSObject *v2;

  v0 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v0, sel__accessibilitySelectedChildren);
  if (InstanceMethod)
  {
    processedClasses_block_invoke_5_BaseImplementation = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    AXLogCommon();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
      __60__NSObject_AXPrivCategory___accessibilityHitTest_withEvent___block_invoke_2_cold_1(sel__accessibilitySelectedChildren);

  }
}

void __66__NSObject_AXPrivCategory___accessibilityBrailleMapsFromGraphData__block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  int v22;
  double v23;
  int v24;
  int v25;
  BOOL v26;
  int v27;
  int v28;
  int v29;
  int v30;
  double v31;
  int v32;
  id v34;

  v5 = a2;
  v34 = v5;
  if (*(_BYTE *)(a1 + 96))
  {
    v6 = (double)a3 / (double)*(unint64_t *)(a1 + 72);
  }
  else
  {
    objc_msgSend(v5, "xValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "number");
    v6 = v8;

    v5 = v34;
  }
  v9 = (v6 - *(double *)(a1 + 80)) / (*(double *)(a1 + 88) - *(double *)(a1 + 80));
  objc_msgSend(v5, "yValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "number");
  v12 = v11;
  objc_msgSend(*(id *)(a1 + 32), "lowerBound");
  v14 = v12 - v13;
  objc_msgSend(*(id *)(a1 + 32), "upperBound");
  v16 = v15;
  objc_msgSend(*(id *)(a1 + 32), "lowerBound");
  v18 = v14 / (v16 - v17);

  objc_msgSend(*(id *)(a1 + 40), "dimensions");
  v21 = v34;
  if (v19 >= (double)(int)(v9 * v19))
    v19 = (double)(int)(v9 * v19);
  v22 = (int)v19;
  v23 = v20 - (double)(int)(v18 * v20);
  if (v20 < v23)
    v23 = v20;
  v24 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  if (v24 != v22)
  {
    v25 = (int)v23;
    v26 = v24 != -1 && v24 < v22;
    v27 = v26;
    v28 = v22 - v27;
    v29 = (int)(v20 + -1.0);
    if (v22 <= v22 - v27)
      v30 = v22 - v27;
    else
      v30 = v22;
    do
    {
      if ((objc_msgSend(*(id *)(a1 + 48), "isContinuous") & 1) != 0)
      {
        LODWORD(v31) = 1.0;
        objc_msgSend(*(id *)(a1 + 40), "setHeight:atPoint:", v31, (double)v28, (double)v25);
      }
      else if (v29 >= v25)
      {
        v32 = v29;
        do
        {
          LODWORD(v31) = 1.0;
          objc_msgSend(*(id *)(a1 + 40), "setHeight:atPoint:", v31, (double)v28, (double)v32);
          v26 = v32-- <= v25;
        }
        while (!v26);
      }
    }
    while (v28++ != v30);
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = v25;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v22;
    v21 = v34;
  }

}

void __65__NSObject_AXPrivCategory__accessibilityElementForRow_andColumn___block_invoke(_QWORD *a1, void *a2, _BYTE *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(a2, "accessibilityDataTableCellElementForRow:column:", a1[5], a1[6]);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1[4] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  if (*(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 40))
    *a3 = 1;
}

uint64_t __53__NSObject_AXPrivCategory___accessibilityColumnCount__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "accessibilityColumnCount");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    *a3 = 1;
  return result;
}

uint64_t __53__NSObject_AXPrivCategory___accessibilityColumnRange__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  result = objc_msgSend(a2, "accessibilityColumnRange");
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  *(_QWORD *)(v6 + 32) = result;
  *(_QWORD *)(v6 + 40) = v7;
  v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32);
  if (v8 != 0x7FFFFFFF && v8 != 0x7FFFFFFFFFFFFFFFLL)
    *a3 = 1;
  return result;
}

void __76__NSObject_AXPrivCategory___accessibilityRowRangeFromTableOrCollectionView___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  objc_class *v5;
  Method InstanceMethod;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  v5 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v5, *(SEL *)(a1 + 40));
  v7 = objc_msgSend(v10, "accessibilityRowRange");
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  *(_QWORD *)(v8 + 32) = v7;
  *(_QWORD *)(v8 + 40) = v9;
  if (InstanceMethod != (Method)_accessibilityRowRangeFromTableOrCollectionView__BaseNSObjectMethod
    || objc_msgSend(v10, "_accessibilityIsInTabBar"))
  {
    *a3 = 1;
    if (*(_QWORD *)(a1 + 48))
      **(_BYTE **)(a1 + 48) = objc_msgSend(v10, "_accessibilityImplementsDefaultRowRange");
  }

}

uint64_t __50__NSObject_AXPrivCategory___accessibilityRowCount__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "accessibilityRowCount");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    *a3 = 1;
  return result;
}

void __38__NSObject_AXPrivCategory___fkaMoveUp__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_accessibilityFocusContainer");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_accessibilityMoveFocusWithHeading:", 1);

}

void __40__NSObject_AXPrivCategory___fkaMoveDown__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_accessibilityFocusContainer");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_accessibilityMoveFocusWithHeading:", 2);

}

void __40__NSObject_AXPrivCategory___fkaMoveLeft__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_accessibilityFocusContainer");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_accessibilityMoveFocusWithHeading:", 4);

}

void __41__NSObject_AXPrivCategory___fkaMoveRight__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_accessibilityFocusContainer");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_accessibilityMoveFocusWithHeading:", 8);

}

void __81__NSObject_AXPrivCategory___accessibilityElementToFocusForAppearanceScreenChange__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  *a4 = 1;
}

uint64_t __59__NSObject_AXPrivCategory___accessibilityFocusRingAncestor__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v2, "canBecomeFocused") & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v2, "_accessibilityDrawsFocusRingWhenChildrenFocused");

  return v3;
}

uint64_t __54__NSObject_AXPrivCategory___accessibilityChartElement__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_accessibilityIsChartElement");
}

BOOL __60__NSObject_AXPrivCategory___accessibilityFirstOpaqueElement__block_invoke()
{
  objc_class *v0;
  objc_method *InstanceMethod;
  IMP Implementation;
  NSObject *v3;

  if (processedClasses_block_invoke_6_onceToken != -1)
    dispatch_once(&processedClasses_block_invoke_6_onceToken, &__block_literal_global_911);
  v0 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v0, sel__accessibilityFirstOpaqueElement);
  if (InstanceMethod)
  {
    Implementation = method_getImplementation(InstanceMethod);
  }
  else
  {
    AXLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      __60__NSObject_AXPrivCategory___accessibilityHitTest_withEvent___block_invoke_cold_1();

    Implementation = 0;
  }
  return Implementation != (IMP)processedClasses_block_invoke_6_BaseImplementation;
}

void __60__NSObject_AXPrivCategory___accessibilityFirstOpaqueElement__block_invoke_2()
{
  objc_class *v0;
  objc_method *InstanceMethod;
  NSObject *v2;

  v0 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v0, sel__accessibilityFirstOpaqueElement);
  if (InstanceMethod)
  {
    processedClasses_block_invoke_6_BaseImplementation = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    AXLogCommon();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
      __60__NSObject_AXPrivCategory___accessibilityHitTest_withEvent___block_invoke_2_cold_1(sel__accessibilityFirstOpaqueElement);

  }
}

BOOL __72__NSObject_AXPrivCategory___accessibilityFirstOpaqueElementWithOptions___block_invoke()
{
  objc_class *v0;
  objc_method *InstanceMethod;
  IMP Implementation;
  NSObject *v3;

  if (processedClasses_block_invoke_7_onceToken != -1)
    dispatch_once(&processedClasses_block_invoke_7_onceToken, &__block_literal_global_914);
  v0 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v0, sel__accessibilityFirstOpaqueElement);
  if (InstanceMethod)
  {
    Implementation = method_getImplementation(InstanceMethod);
  }
  else
  {
    AXLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      __60__NSObject_AXPrivCategory___accessibilityHitTest_withEvent___block_invoke_cold_1();

    Implementation = 0;
  }
  return Implementation != (IMP)processedClasses_block_invoke_7_BaseImplementation;
}

void __72__NSObject_AXPrivCategory___accessibilityFirstOpaqueElementWithOptions___block_invoke_2()
{
  objc_class *v0;
  objc_method *InstanceMethod;
  NSObject *v2;

  v0 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v0, sel__accessibilityFirstOpaqueElement);
  if (InstanceMethod)
  {
    processedClasses_block_invoke_7_BaseImplementation = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    AXLogCommon();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
      __60__NSObject_AXPrivCategory___accessibilityHitTest_withEvent___block_invoke_2_cold_1(sel__accessibilityFirstOpaqueElement);

  }
}

BOOL __68__NSObject_AXPrivCategory___accessibilityFirstOpaqueElementForFocus__block_invoke()
{
  objc_class *v0;
  objc_method *InstanceMethod;
  IMP Implementation;
  NSObject *v3;

  if (processedClasses_block_invoke_8_onceToken != -1)
    dispatch_once(&processedClasses_block_invoke_8_onceToken, &__block_literal_global_915);
  v0 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v0, sel__accessibilityFirstOpaqueElementForFocus);
  if (InstanceMethod)
  {
    Implementation = method_getImplementation(InstanceMethod);
  }
  else
  {
    AXLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      __60__NSObject_AXPrivCategory___accessibilityHitTest_withEvent___block_invoke_cold_1();

    Implementation = 0;
  }
  return Implementation != (IMP)processedClasses_block_invoke_8_BaseImplementation;
}

void __68__NSObject_AXPrivCategory___accessibilityFirstOpaqueElementForFocus__block_invoke_2()
{
  objc_class *v0;
  objc_method *InstanceMethod;
  NSObject *v2;

  v0 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v0, sel__accessibilityFirstOpaqueElementForFocus);
  if (InstanceMethod)
  {
    processedClasses_block_invoke_8_BaseImplementation = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    AXLogCommon();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
      __60__NSObject_AXPrivCategory___accessibilityHitTest_withEvent___block_invoke_2_cold_1(sel__accessibilityFirstOpaqueElementForFocus);

  }
}

BOOL __80__NSObject_AXPrivCategory___accessibilityFirstOpaqueElementForFocusWithOptions___block_invoke()
{
  objc_class *v0;
  objc_method *InstanceMethod;
  IMP Implementation;
  NSObject *v3;

  if (processedClasses_block_invoke_9_onceToken != -1)
    dispatch_once(&processedClasses_block_invoke_9_onceToken, &__block_literal_global_918);
  v0 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v0, sel__accessibilityFirstOpaqueElementForFocus);
  if (InstanceMethod)
  {
    Implementation = method_getImplementation(InstanceMethod);
  }
  else
  {
    AXLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      __60__NSObject_AXPrivCategory___accessibilityHitTest_withEvent___block_invoke_cold_1();

    Implementation = 0;
  }
  return Implementation != (IMP)processedClasses_block_invoke_9_BaseImplementation;
}

void __80__NSObject_AXPrivCategory___accessibilityFirstOpaqueElementForFocusWithOptions___block_invoke_2()
{
  objc_class *v0;
  objc_method *InstanceMethod;
  NSObject *v2;

  v0 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v0, sel__accessibilityFirstOpaqueElementForFocus);
  if (InstanceMethod)
  {
    processedClasses_block_invoke_9_BaseImplementation = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    AXLogCommon();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
      __60__NSObject_AXPrivCategory___accessibilityHitTest_withEvent___block_invoke_2_cold_1(sel__accessibilityFirstOpaqueElementForFocus);

  }
}

BOOL __59__NSObject_AXPrivCategory___accessibilityLastOpaqueElement__block_invoke()
{
  objc_class *v0;
  objc_method *InstanceMethod;
  IMP Implementation;
  NSObject *v3;

  if (processedClasses_block_invoke_10_onceToken != -1)
    dispatch_once(&processedClasses_block_invoke_10_onceToken, &__block_literal_global_919);
  v0 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v0, sel__accessibilityLastOpaqueElement);
  if (InstanceMethod)
  {
    Implementation = method_getImplementation(InstanceMethod);
  }
  else
  {
    AXLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      __60__NSObject_AXPrivCategory___accessibilityHitTest_withEvent___block_invoke_cold_1();

    Implementation = 0;
  }
  return Implementation != (IMP)processedClasses_block_invoke_10_BaseImplementation;
}

void __59__NSObject_AXPrivCategory___accessibilityLastOpaqueElement__block_invoke_2()
{
  objc_class *v0;
  objc_method *InstanceMethod;
  NSObject *v2;

  v0 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v0, sel__accessibilityLastOpaqueElement);
  if (InstanceMethod)
  {
    processedClasses_block_invoke_10_BaseImplementation = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    AXLogCommon();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
      __60__NSObject_AXPrivCategory___accessibilityHitTest_withEvent___block_invoke_2_cold_1(sel__accessibilityLastOpaqueElement);

  }
}

BOOL __71__NSObject_AXPrivCategory___accessibilityLastOpaqueElementWithOptions___block_invoke()
{
  objc_class *v0;
  objc_method *InstanceMethod;
  IMP Implementation;
  NSObject *v3;

  if (processedClasses_block_invoke_11_onceToken != -1)
    dispatch_once(&processedClasses_block_invoke_11_onceToken, &__block_literal_global_922);
  v0 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v0, sel__accessibilityLastOpaqueElement);
  if (InstanceMethod)
  {
    Implementation = method_getImplementation(InstanceMethod);
  }
  else
  {
    AXLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      __60__NSObject_AXPrivCategory___accessibilityHitTest_withEvent___block_invoke_cold_1();

    Implementation = 0;
  }
  return Implementation != (IMP)processedClasses_block_invoke_11_BaseImplementation;
}

void __71__NSObject_AXPrivCategory___accessibilityLastOpaqueElementWithOptions___block_invoke_2()
{
  objc_class *v0;
  objc_method *InstanceMethod;
  NSObject *v2;

  v0 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v0, sel__accessibilityLastOpaqueElement);
  if (InstanceMethod)
  {
    processedClasses_block_invoke_11_BaseImplementation = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    AXLogCommon();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
      __60__NSObject_AXPrivCategory___accessibilityHitTest_withEvent___block_invoke_2_cold_1(sel__accessibilityLastOpaqueElement);

  }
}

uint64_t __149__NSObject_AXPrivCategory___accessibilityNextOpaqueElementsForTechnology_startElement_direction_searchType_range_shouldScrollToVisible_honorsGroups___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if ((objc_msgSend(v2, "_accessibilityHasOrderedChildren") & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v2, "isAccessibilityOpaqueElementProvider");

  return v3;
}

uint64_t __149__NSObject_AXPrivCategory___accessibilityNextOpaqueElementsForTechnology_startElement_direction_searchType_range_shouldScrollToVisible_honorsGroups___block_invoke_924(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if ((objc_msgSend(v2, "_accessibilityHasOrderedChildren") & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v2, "isAccessibilityOpaqueElementProvider");

  return v3;
}

BOOL __133__NSObject_AXPrivCategory___accessibilityFindElementInDirection_searchType_allowOutOfBoundsChild_startingTouchContainer_honorGroups___block_invoke(uint64_t a1)
{
  void *v1;
  double v2;
  double v3;
  _BOOL8 v4;

  objc_msgSend(*(id *)(a1 + 32), "_accessibilityOpaqueElementParent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_accessibilityVisibleFrame");
  v4 = v3 > 0.0 && v2 > 0.0;

  return v4;
}

BOOL __133__NSObject_AXPrivCategory___accessibilityFindElementInDirection_searchType_allowOutOfBoundsChild_startingTouchContainer_honorGroups___block_invoke_2(uint64_t a1)
{
  double v1;
  double v2;

  objc_msgSend(*(id *)(a1 + 32), "_accessibilityVisibleFrame");
  return v2 > 0.0 && v1 > 0.0;
}

uint64_t __133__NSObject_AXPrivCategory___accessibilityFindElementInDirection_searchType_allowOutOfBoundsChild_startingTouchContainer_honorGroups___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (*(_QWORD *)(a1 + 32) == a2)
    return 0;
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

id __133__NSObject_AXPrivCategory___accessibilityFindElementInDirection_searchType_allowOutOfBoundsChild_startingTouchContainer_honorGroups___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  __int128 v9;
  char v10;
  char v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v3 = a2;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__2;
  v16 = __Block_byref_object_dispose__2;
  v17 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __133__NSObject_AXPrivCategory___accessibilityFindElementInDirection_searchType_allowOutOfBoundsChild_startingTouchContainer_honorGroups___block_invoke_5;
  v6[3] = &unk_1E3DFEB88;
  v8 = &v12;
  v9 = *(_OWORD *)(a1 + 40);
  v10 = *(_BYTE *)(a1 + 56);
  v7 = *(id *)(a1 + 32);
  v11 = *(_BYTE *)(a1 + 57);
  objc_msgSend(v3, "enumerateObjectsWithOptions:usingBlock:", 2 * ((_QWORD)v9 == 2), v6);
  v4 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v4;
}

void __133__NSObject_AXPrivCategory___accessibilityFindElementInDirection_searchType_allowOutOfBoundsChild_startingTouchContainer_honorGroups___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a2, "_accessibilityFindElementInDirection:searchType:allowOutOfBoundsChild:startingTouchContainer:honorGroups:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 65));
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    *a4 = 1;
}

BOOL __62__NSObject_AXPrivCategory___accessibilitySortedElementsWithin__block_invoke()
{
  objc_class *v0;
  objc_method *InstanceMethod;
  IMP Implementation;
  NSObject *v3;

  if (processedClasses_block_invoke_12_onceToken != -1)
    dispatch_once(&processedClasses_block_invoke_12_onceToken, &__block_literal_global_929);
  v0 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v0, sel__accessibilitySortedElementsWithin);
  if (InstanceMethod)
  {
    Implementation = method_getImplementation(InstanceMethod);
  }
  else
  {
    AXLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      __60__NSObject_AXPrivCategory___accessibilityHitTest_withEvent___block_invoke_cold_1();

    Implementation = 0;
  }
  return Implementation != (IMP)processedClasses_block_invoke_12_BaseImplementation;
}

void __62__NSObject_AXPrivCategory___accessibilitySortedElementsWithin__block_invoke_2()
{
  objc_class *v0;
  objc_method *InstanceMethod;
  NSObject *v2;

  v0 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v0, sel__accessibilitySortedElementsWithin);
  if (InstanceMethod)
  {
    processedClasses_block_invoke_12_BaseImplementation = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    AXLogCommon();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
      __60__NSObject_AXPrivCategory___accessibilityHitTest_withEvent___block_invoke_2_cold_1(sel__accessibilitySortedElementsWithin);

  }
}

BOOL __74__NSObject_AXPrivCategory___accessibilitySortedElementsWithinWithOptions___block_invoke()
{
  objc_class *v0;
  objc_method *InstanceMethod;
  IMP Implementation;
  NSObject *v3;

  if (processedClasses_block_invoke_13_onceToken != -1)
    dispatch_once(&processedClasses_block_invoke_13_onceToken, &__block_literal_global_932);
  v0 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v0, sel__accessibilitySortedElementsWithin);
  if (InstanceMethod)
  {
    Implementation = method_getImplementation(InstanceMethod);
  }
  else
  {
    AXLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
      __60__NSObject_AXPrivCategory___accessibilityHitTest_withEvent___block_invoke_cold_1();

    Implementation = 0;
  }
  return Implementation != (IMP)processedClasses_block_invoke_13_BaseImplementation;
}

void __74__NSObject_AXPrivCategory___accessibilitySortedElementsWithinWithOptions___block_invoke_2()
{
  objc_class *v0;
  objc_method *InstanceMethod;
  NSObject *v2;

  v0 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v0, sel__accessibilitySortedElementsWithin);
  if (InstanceMethod)
  {
    processedClasses_block_invoke_13_BaseImplementation = (uint64_t)method_getImplementation(InstanceMethod);
  }
  else
  {
    AXLogCommon();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
      __60__NSObject_AXPrivCategory___accessibilityHitTest_withEvent___block_invoke_2_cold_1(sel__accessibilitySortedElementsWithin);

  }
}

uint64_t __174__NSObject_AXPrivCategory___accessibilitySearchSubtreesAfterChildElement_direction_searchType_allowOutOfBoundsChild_range_shouldScrollToVisible_honorGroups_updatedContainer___block_invoke(uint64_t a1, uint64_t a2)
{
  if (*(_QWORD *)(a1 + 32) == a2)
    return 0;
  else
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __174__NSObject_AXPrivCategory___accessibilitySearchSubtreesAfterChildElement_direction_searchType_allowOutOfBoundsChild_range_shouldScrollToVisible_honorGroups_updatedContainer___block_invoke_935(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_accessibilitySortedElementsWithinWithOptions:");
}

void __174__NSObject_AXPrivCategory___accessibilitySearchSubtreesAfterChildElement_direction_searchType_allowOutOfBoundsChild_range_shouldScrollToVisible_honorGroups_updatedContainer___block_invoke_939(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(a2, "_accessibilityFindElementInDirection:searchType:allowOutOfBoundsChild:startingTouchContainer:honorGroups:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(unsigned __int8 *)(a1 + 64), *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 65));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
    *a3 = 1;
}

uint64_t __85__NSObject_AXPrivCategory___accessibilityVisibleOpaqueElementsHonoringGroups_sorted___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  v4 = v3;
  if (*(id *)(a1 + 32) == v3)
  {
    v5 = 0;
  }
  else if ((objc_msgSend(v3, "isAccessibilityElement") & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v5 = objc_msgSend(v4, "_accessibilityIsGroupedParent");
  }

  return v5;
}

uint64_t __59__NSObject_AXPrivCategory___accessibilityDescendantOfType___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

uint64_t __62__NSObject_AXPrivCategory___accessibilityHasDescendantOfType___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

uint64_t __61__NSObject_AXPrivCategory___accessibilityUnignoredDescendant__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isAccessibilityElement");
}

uint64_t __60__NSObject_AXPrivCategory__accessibilityViewWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __79__NSObject_AXPrivCategory___accessibilityAncestorIsAccessibilityElementsHidden__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "accessibilityElementsHidden");
}

- (void)_accessibilityEnumerateAXDescendants:(void *)a3 passingTest:(void *)a4 byYieldingElements:
{
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  _QWORD *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[3];
  char v21;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (a1)
  {
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x2020000000;
    v21 = 0;
    v16 = 0;
    v17 = &v16;
    v18 = 0x2050000000;
    v19 = 0;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __96__NSObject_AXPrivCategory___accessibilityEnumerateAXDescendants_passingTest_byYieldingElements___block_invoke;
    v10[3] = &unk_1E3DFECC0;
    v11 = v8;
    v14 = v20;
    v12 = v7;
    v13 = v9;
    v15 = &v16;
    v17[3] = (uint64_t)v10;
    __96__NSObject_AXPrivCategory___accessibilityEnumerateAXDescendants_passingTest_byYieldingElements___block_invoke(v10, a1);
    _Block_object_dispose(&v16, 8);

    _Block_object_dispose(v20, 8);
  }

}

BOOL __96__NSObject_AXPrivCategory___accessibilityEnumerateAXDescendants_passingTest_byYieldingElements___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  _BOOL8 v4;

  v3 = a2;
  if ((*(unsigned int (**)(void))(a1[4] + 16))())
    (*(void (**)(void))(a1[5] + 16))();
  if (*(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24))
  {
    v4 = 0;
  }
  else
  {
    (*(void (**)(void))(a1[6] + 16))();
    v4 = *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) == 0;
  }

  return v4;
}

- (id)_accessibilityFindAXDescendantsPassingTest:(void *)a3 byYieldingElements:
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;

  if (!a1)
    return 0;
  v5 = (objc_class *)MEMORY[0x1E0C99DE8];
  v6 = a3;
  v7 = a2;
  v8 = objc_alloc_init(v5);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __90__NSObject_AXPrivCategory___accessibilityFindAXDescendantsPassingTest_byYieldingElements___block_invoke;
  v11[3] = &unk_1E3DFECE8;
  v9 = v8;
  v12 = v9;
  -[NSObject _accessibilityEnumerateAXDescendants:passingTest:byYieldingElements:](a1, v11, v7, v6);

  return v9;
}

uint64_t __90__NSObject_AXPrivCategory___accessibilityFindAXDescendantsPassingTest_byYieldingElements___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

- (id)_accessibilityFindFirstAXDescendantPassingTest:(void *)a3 byYieldingElements:
{
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__2;
    v15 = __Block_byref_object_dispose__2;
    v16 = 0;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __94__NSObject_AXPrivCategory___accessibilityFindFirstAXDescendantPassingTest_byYieldingElements___block_invoke;
    v10[3] = &unk_1E3DFED10;
    v10[4] = &v11;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __94__NSObject_AXPrivCategory___accessibilityFindFirstAXDescendantPassingTest_byYieldingElements___block_invoke_2;
    v8[3] = &unk_1E3DFED38;
    v9 = v5;
    -[NSObject _accessibilityEnumerateAXDescendants:passingTest:byYieldingElements:](a1, v10, v8, v6);
    a1 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }

  return a1;
}

void __94__NSObject_AXPrivCategory___accessibilityFindFirstAXDescendantPassingTest_byYieldingElements___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __94__NSObject_AXPrivCategory___accessibilityFindFirstAXDescendantPassingTest_byYieldingElements___block_invoke_2(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (a3)
  {
    if ((_DWORD)result)
      *a3 = 1;
  }
  return result;
}

void __57__NSObject_AXPrivCategory___accessibilityFindDescendant___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[4];
  id v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v6, "_accessibilityHasOrderedChildren"))
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __57__NSObject_AXPrivCategory___accessibilityFindDescendant___block_invoke_2;
    v19[3] = &unk_1E3DFED60;
    v20 = v5;
    objc_msgSend(v6, "accessibilityEnumerateContainerElementsWithOptions:usingBlock:", 0, v19);

  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)MEMORY[0x1A1ADCDB4]();
      v15 = 0u;
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v8 = *(void **)(a1 + 32);
      objc_msgSend(v6, "subviews", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_accessibilityGeometrySortedElements:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v16;
LABEL_6:
        v14 = 0;
        while (1)
        {
          if (*(_QWORD *)v16 != v13)
            objc_enumerationMutation(v10);
          if (!(*((unsigned int (**)(id, _QWORD))v5 + 2))(v5, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14)))
            break;
          if (v12 == ++v14)
          {
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
            if (v12)
              goto LABEL_6;
            break;
          }
        }
      }

      objc_autoreleasePoolPop(v7);
    }
  }

}

void __57__NSObject_AXPrivCategory___accessibilityFindDescendant___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  char v7;
  id v8;

  v6 = a2;
  if (v6)
  {
    v8 = v6;
    v7 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v6 = v8;
    if (a4)
    {
      if ((v7 & 1) == 0)
        *a4 = 1;
    }
  }

}

void __64__NSObject_AXPrivCategory___accessibilityFindSubviewDescendant___block_invoke(uint64_t a1, void *a2, void *a3)
{
  unsigned int (**v4)(id, _QWORD);
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    objc_msgSend(v5, "subviews", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
LABEL_4:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        if (!v4[2](v4, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10)))
          break;
        if (v8 == ++v10)
        {
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
          if (v8)
            goto LABEL_4;
          break;
        }
      }
    }

  }
}

void __76__NSObject_AXPrivCategory___accessibilityFindSubviewDescendantsPassingTest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  unsigned int (**v4)(id, _QWORD);
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    objc_msgSend(v5, "subviews", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reverseObjectEnumerator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
LABEL_4:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        if (!v4[2](v4, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11)))
          break;
        if (v9 == ++v11)
        {
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
          if (v9)
            goto LABEL_4;
          break;
        }
      }
    }

  }
}

void __71__NSObject_AXPrivCategory___accessibilityFindViewControllerDescendant___block_invoke(uint64_t a1, void *a2, void *a3)
{
  unsigned int (**v4)(id, _QWORD);
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  char v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  v17 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(v6, "childViewControllers", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
LABEL_4:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        if (!v4[2](v4, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12)))
          break;
        if (v10 == ++v12)
        {
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
          if (v10)
            goto LABEL_4;
          break;
        }
      }
    }

  }
}

uint64_t __77__NSObject_AXPrivCategory___accessibilityFindViewControllerDescendantOfType___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

void __84__NSObject_AXPrivCategory___accessibilityFindUnsortedSubviewDescendantsPassingTest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  unsigned int (**v4)(id, _QWORD);
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    objc_msgSend(v5, "subviews", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
LABEL_4:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        if (!v4[2](v4, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10)))
          break;
        if (v8 == ++v10)
        {
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
          if (v8)
            goto LABEL_4;
          break;
        }
      }
    }

  }
}

void __77__NSObject_AXPrivCategory___accessibilityFindUnsortedDescendantsPassingTest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _QWORD v15[4];
  id v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "_accessibilityHasOrderedChildren"))
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __77__NSObject_AXPrivCategory___accessibilityFindUnsortedDescendantsPassingTest___block_invoke_2;
    v15[3] = &unk_1E3DFED60;
    v16 = v4;
    objc_msgSend(v5, "accessibilityEnumerateContainerElementsWithOptions:usingBlock:", 0, v15);
    v6 = v16;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_14;
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    objc_msgSend(v5, "subviews", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
LABEL_7:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        if (!(*((unsigned int (**)(id, _QWORD))v4 + 2))(v4, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10)))
          break;
        if (v8 == ++v10)
        {
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
          if (v8)
            goto LABEL_7;
          break;
        }
      }
    }
  }

LABEL_14:
}

void __77__NSObject_AXPrivCategory___accessibilityFindUnsortedDescendantsPassingTest___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  char v7;
  id v8;

  v6 = a2;
  if (v6)
  {
    v8 = v6;
    v7 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v6 = v8;
    if (a4)
    {
      if ((v7 & 1) == 0)
        *a4 = 1;
    }
  }

}

uint64_t __70__NSObject_AXPrivCategory___accessibilityControlDescendantWithTarget___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
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
  v3 = a2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    objc_msgSend(v3, "allTargets", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v12;
      while (2)
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v12 != v7)
            objc_enumerationMutation(v4);
          if ((objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "isEqual:", *(_QWORD *)(a1 + 32)) & 1) != 0)
          {
            v9 = 1;
            goto LABEL_13;
          }
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        if (v6)
          continue;
        break;
      }
    }
    v9 = 0;
LABEL_13:

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t __70__NSObject_AXPrivCategory___accessibilityControlDescendantWithAction___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    objc_msgSend(v3, "allTargets");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v22 != v7)
            objc_enumerationMutation(v4);
          v9 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
          v17 = 0u;
          v18 = 0u;
          v19 = 0u;
          v20 = 0u;
          objc_msgSend(v3, "actionsForTarget:forControlEvent:", v9, 0, 0);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          if (v11)
          {
            v12 = v11;
            v13 = *(_QWORD *)v18;
            while (2)
            {
              for (j = 0; j != v12; ++j)
              {
                if (*(_QWORD *)v18 != v13)
                  objc_enumerationMutation(v10);
                if ((objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * j), "isEqualToString:", *(_QWORD *)(a1 + 32)) & 1) != 0)
                {

                  v15 = 1;
                  goto LABEL_21;
                }
              }
              v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
              if (v12)
                continue;
              break;
            }
          }

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
        v15 = 0;
      }
      while (v6);
    }
    else
    {
      v15 = 0;
    }
LABEL_21:

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

uint64_t __94__NSObject_AXPrivCategory___accessibilityVisibleElementsHonoringGroups_respectGroupedParents___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  v4 = v3;
  if (*(_BYTE *)(a1 + 40))
  {
    if (*(id *)(a1 + 32) == v3)
    {
      v5 = 0;
    }
    else if ((objc_msgSend(v3, "isAccessibilityElement") & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      v5 = objc_msgSend(v4, "_accessibilityIsGroupedParent");
    }
  }
  else
  {
    v5 = objc_msgSend(v3, "accessibilityContainerType") != 0;
  }

  return v5;
}

uint64_t __94__NSObject_AXPrivCategory___accessibilityVisibleElementsHonoringGroups_respectGroupedParents___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  v4 = v3;
  if (*(id *)(a1 + 32) == v3)
  {
    v5 = 0;
  }
  else if ((objc_msgSend(v3, "isAccessibilityElement") & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    v5 = objc_msgSend(v4, "_accessibilityIsGroupedParent");
  }

  return v5;
}

BOOL __97__NSObject_AXPrivCategory___accessibilityScannerElementsGrouped_shouldIncludeNonScannerElements___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  _BOOL8 v4;

  v2 = a2;
  if (objc_msgSend(v2, "isAccessibilityElement")
    && (v3 = objc_msgSend(v2, "accessibilityTraits"), ((*MEMORY[0x1E0CF4568] | *MEMORY[0x1E0CF4508]) & v3) == 0))
  {
    v4 = (*MEMORY[0x1E0CF4578] & v3) == 0 || (*MEMORY[0x1E0CF4440] & v3) != 0;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void __67__NSObject_AXPrivCategory___accessibilityChildrenUnionContentFrame__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  CGRect *v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  _QWORD *v12;
  id v13;
  CGRect v14;

  v13 = a2;
  if (objc_msgSend(v13, "isAccessibilityElement"))
  {
    if (CGRectIsEmpty(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32)))
    {
      objc_msgSend(v13, "_accessibilityContentFrame");
    }
    else
    {
      v7 = *(CGRect **)(*(_QWORD *)(a1 + 32) + 8);
      objc_msgSend(v13, "_accessibilityContentFrame");
      v14.origin.x = v8;
      v14.origin.y = v9;
      v14.size.width = v10;
      v14.size.height = v11;
      *(CGRect *)&v3 = CGRectUnion(v7[1], v14);
    }
    v12 = *(_QWORD **)(*(_QWORD *)(a1 + 32) + 8);
    v12[4] = v3;
    v12[5] = v4;
    v12[6] = v5;
    v12[7] = v6;
  }

}

- (uint64_t)_accessibilityCompareGeometry:(void *)a1
{
  id v3;
  double v4;
  double v5;
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
  void *v18;
  uint64_t v19;
  void *v20;
  BOOL v21;
  int v22;
  void *v23;
  void *v24;
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
  BOOL v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  _QWORD *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  uint64_t v77;
  uint64_t v78;
  int v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  void *v93;
  void *v94;
  uint64_t v95;
  double v96;
  double v97;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  void *v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  void *v117;
  void *v118;
  uint64_t v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  void *v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  uint64_t v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  int v151;
  id v152;
  void *v153;
  id v154;
  void *v155;
  int isKindOfClass;
  int v157;
  CGFloat v158;
  CGFloat v159;
  CGFloat v160;
  double v161;
  double v162;
  CGFloat v163;
  double v164;
  double v165;
  CGFloat v166;
  double v167;
  double v168;
  CGFloat v169;
  double v170;
  CGFloat v171;
  double v172;
  double v173;
  double v174;
  double v175;
  double v176;
  double v177;
  id v178;
  double v179;
  id v180;
  int v181;
  double v182;
  uint64_t v183;
  int v184;
  void *v185;
  void *v186;
  double v187;
  CGFloat v188;
  double v189;
  uint64_t v190;
  uint64_t v191;
  char v192;
  char v193;
  uint64_t v194;
  uint64_t i;
  uint64_t v196;
  int v197;
  int v198;
  uint64_t v199;
  uint64_t v200;
  char v201;
  char v202;
  uint64_t v203;
  uint64_t j;
  uint64_t v205;
  void *v206;
  uint64_t v207;
  uint64_t v208;
  char v209;
  char v210;
  uint64_t v211;
  uint64_t k;
  uint64_t v213;
  int v214;
  int v215;
  void *v216;
  uint64_t v217;
  uint64_t v218;
  char v219;
  char v220;
  uint64_t v221;
  uint64_t m;
  uint64_t v223;
  double v224;
  double v225;
  double v226;
  void *v227;
  uint64_t v228;
  void *v229;
  BOOL v230;
  uint64_t v231;
  double v232;
  double v233;
  double MaxY;
  double v235;
  double v237;
  double v238;
  double v239;
  double v240;
  double v241;
  double v242;
  uint64_t v243;
  void *v244;
  void *v245;
  uint64_t v246;
  int v247;
  uint64_t v248;
  CGFloat v249;
  double v250;
  double v251;
  CGFloat v252;
  double v253;
  CGFloat v254;
  int v255;
  double rect;
  double rect_8;
  CGFloat rect_8a;
  CGFloat rect_8b;
  int rect_8c;
  CGFloat rect_16;
  int rect_16a;
  CGFloat rect_24;
  char rect_24a;
  int rect_24b;
  double v266;
  CGFloat v267;
  char v268;
  int v269;
  double v270;
  double v271;
  double v272;
  CGFloat v273;
  double v274;
  double v275;
  double v276;
  double v277;
  void *v278;
  __int128 v279;
  __int128 v280;
  __int128 v281;
  __int128 v282;
  __int128 v283;
  __int128 v284;
  __int128 v285;
  __int128 v286;
  __int128 v287;
  __int128 v288;
  __int128 v289;
  __int128 v290;
  __int128 v291;
  __int128 v292;
  __int128 v293;
  __int128 v294;
  _BYTE v295[128];
  _BYTE v296[128];
  _BYTE v297[128];
  _BYTE v298[128];
  uint64_t v299;
  CGRect v300;
  CGRect v301;
  CGRect v302;
  CGRect v303;
  CGRect v304;
  CGRect v305;
  CGRect v306;
  CGRect v307;

  v299 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!a1)
  {
    v46 = 0;
    goto LABEL_223;
  }
  objc_msgSend(a1, "_accessibilityFrameForSorting");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "_accessibilityFrameForSorting");
  v270 = v12;
  v275 = v13;
  v15 = v14;
  v17 = v16;
  objc_msgSend(a1, "_accessibilityWindow");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilityWindow");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  if (v18)
    v21 = v19 == 0;
  else
    v21 = 1;
  v22 = !v21;
  v247 = v22;
  if (!v21)
  {
    objc_msgSend(v18, "windowScene");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "windowScene");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23 != v24)
    {
      v266 = v15;
      v277 = v17;
      objc_msgSend(v18, "frame");
      v26 = v25;
      v28 = v27;
      objc_msgSend(v18, "screen");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "coordinateSpace");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "convertPoint:toCoordinateSpace:", v30, v26, v28);
      v32 = v31;
      v34 = v33;

      objc_msgSend(v20, "frame");
      v36 = v35;
      v38 = v37;
      objc_msgSend(v20, "screen");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "coordinateSpace");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "convertPoint:toCoordinateSpace:", v40, v36, v38);
      v42 = v41;
      v44 = v43;

      v45 = v34 < v44 || v32 < v42;
      v46 = v45 ? -1 : 1;
      if (v32 != v42)
        goto LABEL_222;
      v21 = v34 == v44;
      v17 = v277;
      v15 = v266;
      if (!v21)
        goto LABEL_222;
    }
  }
  v278 = v3;
  if (objc_msgSend(MEMORY[0x1E0DE7910], "_accessibilityHasUnitTestingOrientation"))
  {
    v47 = objc_msgSend(MEMORY[0x1E0DE7910], "_accessibilityUnitTestingOrientation");
  }
  else
  {
    v48 = objc_msgSend(MEMORY[0x1E0CEAC18], "_transformLayerRotationsAreEnabled");
    v49 = (_QWORD *)MEMORY[0x1E0CEB258];
    if (v48)
    {
      if (v18)
        v50 = objc_msgSend(v18, "_accessibilityInterfaceOrientationForScreenCoordinates");
      else
        v50 = 0;
      if (v20)
        v52 = objc_msgSend(v20, "_accessibilityInterfaceOrientationForScreenCoordinates");
      else
        v52 = 0;
      v51 = objc_msgSend(a1, "_accessibilityOrientationForCompareGeometryForApplication:", *v49);
      objc_msgSend(v18, "bounds");
      objc_msgSend(v18, "_windowInterfaceOrientation");
      _UIConvertRectFromOrientationToOrientation();
      v5 = v53;
      v7 = v54;
      v9 = v55;
      v11 = v56;
      objc_msgSend(v20, "bounds");
      objc_msgSend(v20, "_windowInterfaceOrientation");
      _UIConvertRectFromOrientationToOrientation();
      v270 = v57;
      v275 = v58;
      v15 = v59;
      v17 = v60;
      goto LABEL_31;
    }
    v47 = objc_msgSend(a1, "_accessibilityOrientationForCompareGeometryForApplication:", *MEMORY[0x1E0CEB258]);
  }
  v51 = v47;
  v52 = 1;
  v50 = 1;
LABEL_31:
  objc_msgSend(a1, "_handleRotatingFrame:fromOrientation:toOrientation:", v50, v51, v5, v7, v9, v11);
  v62 = v61;
  v64 = v63;
  v66 = v65;
  v68 = v67;
  objc_msgSend(a1, "_handleRotatingFrame:fromOrientation:toOrientation:", v52, v51, v270, v275, v15, v17);
  v70 = v69;
  v72 = v71;
  v74 = v73;
  v76 = v75;
  v3 = v278;
  v46 = _checkSortPriority(a1, v278);
  if (v46)
    goto LABEL_222;
  v276 = v64;
  rect = v62;
  v250 = v68;
  v248 = v50;
  v244 = v18;
  _scrollParentForComparingGeometryOfView(a1);
  v77 = objc_claimAutoreleasedReturnValue();
  _scrollParentForComparingGeometryOfView(v278);
  v78 = objc_claimAutoreleasedReturnValue();
  HIDWORD(v243) = objc_msgSend((id)v78, "_accessibilityIsDescendantOfElement:", v77);
  v79 = objc_msgSend((id)v77, "_accessibilityIsDescendantOfElement:", v78);
  v245 = v20;
  LODWORD(v243) = v79;
  if (v77 == v78)
  {
    v246 = v52;
    v80 = v74;
    goto LABEL_52;
  }
  v80 = v74;
  if (v77 && v78)
  {
    if (v79)
    {
      rect_8 = v76;
      v251 = v74;
      v253 = v70;
      v271 = v72;
      v81 = *MEMORY[0x1E0CEB4B0];
      v82 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
      v83 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
      v84 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
      objc_msgSend((id)v77, "_accessibilityContentFrame");
      v86 = v85;
      v88 = v87;
      v90 = v89;
      v92 = v91;
      objc_msgSend((id)v77, "accessibilityContainer");
      v93 = (void *)objc_claimAutoreleasedReturnValue();
      _scrollParentForComparingGeometryOfView(v93);
      v94 = (void *)objc_claimAutoreleasedReturnValue();

      for (; (objc_msgSend(v94, "isEqual:", v78) & 1) == 0; v77 = v95)
      {
        v95 = (uint64_t)v94;
        if (!objc_msgSend(v94, "_accessibilityIsDescendantOfElement:", v78, v243))
          break;
        objc_msgSend((id)v78, "_accessibilityVisibleContentInset");
        UIEdgeInsetsAdd();
        v81 = v96;
        v82 = v97;
        v83 = v98;
        v84 = v99;

        objc_msgSend(v94, "_accessibilityContentFrame");
        v86 = v100;
        v88 = v101;
        v90 = v102;
        v92 = v103;
        objc_msgSend(v94, "accessibilityContainer");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        _scrollParentForComparingGeometryOfView(v104);
        v94 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v132 = v88 + v81;
      v129 = v90 - (v84 + v82);
      v131 = v86 + v82;
      v130 = v92 - (v83 + v81);
      v80 = v251;
      v70 = v253;
      v72 = v271;
      v76 = rect_8;
    }
    else if (HIDWORD(v243))
    {
      v272 = v66;
      v105 = *MEMORY[0x1E0CEB4B0];
      v106 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
      v107 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
      v108 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
      objc_msgSend((id)v78, "_accessibilityContentFrame");
      v110 = v109;
      v112 = v111;
      v114 = v113;
      v116 = v115;
      objc_msgSend((id)v78, "accessibilityContainer");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      _scrollParentForComparingGeometryOfView(v117);
      v118 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v118, "isEqual:", v77) & 1) == 0)
      {
        do
        {
          v119 = (uint64_t)v118;
          if (!objc_msgSend(v118, "_accessibilityIsDescendantOfElement:", v77, v243))
            break;
          objc_msgSend((id)v78, "_accessibilityVisibleContentInset");
          UIEdgeInsetsAdd();
          v105 = v120;
          v106 = v121;
          v107 = v122;
          v108 = v123;

          objc_msgSend(v118, "_accessibilityContentFrame");
          v110 = v124;
          v112 = v125;
          v114 = v126;
          v116 = v127;
          objc_msgSend(v118, "accessibilityContainer");
          v128 = (void *)objc_claimAutoreleasedReturnValue();
          _scrollParentForComparingGeometryOfView(v128);
          v118 = (void *)objc_claimAutoreleasedReturnValue();

          v78 = v119;
        }
        while (!objc_msgSend(v118, "isEqual:", v77));
      }

      v133 = v106 + v110;
      v72 = v105 + v112;
      v80 = v114 - (v106 + v108);
      v134 = v107 + v105;
      v70 = v133;
      v76 = v116 - v134;
      v131 = rect;
      v129 = v272;
      v132 = v276;
      v130 = v250;
    }
    else
    {
      v129 = v66;
      v130 = v68;
      v131 = v62;
      v132 = v276;
    }
    objc_msgSend(a1, "_handleRotatingFrame:fromOrientation:toOrientation:", v248, v51, v131, v132, v129, v130, v243);
    v136 = v135;
    v138 = v137;
    v66 = v139;
    v141 = v140;
    objc_msgSend(a1, "_handleRotatingFrame:fromOrientation:toOrientation:", v52, v51, v70, v72, v80, v76);
    v70 = v142;
    v72 = v143;
    v80 = v144;
    v76 = v145;
    v146 = _checkSortPriority((void *)v77, (void *)v78);
    if (v146)
      goto LABEL_115;
    v276 = v138;
    rect = v136;
    v250 = v141;
  }
  v246 = v52;
  while (1)
  {
LABEL_52:
    if (!(v77 | v78))
    {
      v274 = v72;
      v77 = 0;
      v78 = 0;
      v181 = 1;
LABEL_104:
      v20 = v245;
      goto LABEL_105;
    }
    if (v77 == v78)
    {
      v274 = v72;
      v181 = 1;
      goto LABEL_103;
    }
    if ((objc_msgSend((id)v77, "_accessibilityIsDescendantOfElement:", v78) & 1) != 0
      || (objc_msgSend((id)v78, "_accessibilityIsDescendantOfElement:", v77) & 1) != 0)
    {
      break;
    }
    objc_msgSend((id)v77, "accessibilityContainer");
    v147 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v147, "_accessibilityContainingParentForOrdering");
    v148 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)v78, "accessibilityContainer");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v149, "_accessibilityContainingParentForOrdering");
    v150 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v148, "_accessibilityIsDescendantOfElement:", v150) & 1) != 0
      || (objc_msgSend(v150, "_accessibilityIsDescendantOfElement:", v148) & 1) != 0)
    {
      v151 = 1;
    }
    else if (!v148
           || (objc_msgSend(v148, "isEqual:", v150) & 1) != 0
           || (objc_msgSend(v148, "_accessibilityIsDescendantOfElement:", v78) & 1) != 0
           || (objc_msgSend(v148, "_accessibilityIsDescendantOfElement:", v150) & 1) != 0)
    {
      v151 = 1;
      if (v150)
        goto LABEL_84;
    }
    else
    {
      v180 = v148;

      v151 = 0;
      v77 = (uint64_t)v180;
      if (v150)
      {
LABEL_84:
        if ((objc_msgSend(v150, "isEqual:", v148, v243) & 1) == 0
          && (objc_msgSend(v150, "_accessibilityIsDescendantOfElement:", v77) & 1) == 0
          && (objc_msgSend(v150, "_accessibilityIsDescendantOfElement:", v148) & 1) == 0)
        {
          v178 = v150;

          v151 = 0;
          v78 = (uint64_t)v178;
        }
      }
    }
    if (v148)
    {
      while ((objc_msgSend((id)v78, "_accessibilityIsDescendantOfElement:", v148, v243) & 1) == 0)
      {
        v152 = v148;

        objc_msgSend(v152, "accessibilityContainer");
        v153 = (void *)objc_claimAutoreleasedReturnValue();
        _scrollParentForComparingGeometryOfView(v153);
        v148 = (void *)objc_claimAutoreleasedReturnValue();

        v77 = (uint64_t)v152;
        if (!v148)
        {
          v77 = (uint64_t)v152;
          break;
        }
      }
    }
    if (v150)
    {
      while ((objc_msgSend((id)v77, "_accessibilityIsDescendantOfElement:", v150, v243) & 1) == 0)
      {
        v154 = v150;

        objc_msgSend(v154, "accessibilityContainer");
        v155 = (void *)objc_claimAutoreleasedReturnValue();
        _scrollParentForComparingGeometryOfView(v155);
        v150 = (void *)objc_claimAutoreleasedReturnValue();

        v78 = (uint64_t)v154;
        if (!v150)
        {
          v78 = (uint64_t)v154;
          break;
        }
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();
    }
    else
    {
      isKindOfClass = 0;
    }
    if ((objc_msgSend(a1, "_accessibilityIsOrnamentWindow", v243) & 1) != 0)
      v157 = 1;
    else
      v157 = objc_msgSend(v278, "_accessibilityIsOrnamentWindow");
    if ((isKindOfClass & v157 & 1) != 0)
    {
      v158 = v76;
      v159 = v80;
      v160 = v72;
    }
    else
    {
      objc_msgSend(a1, "_accessibilityCompareFrameForScrollParent:frame:fromOrientation:toOrientation:", v77, v248, v51, rect, v276, v66, v250);
      v161 = v80;
      v163 = v162;
      v164 = v72;
      v166 = v165;
      v167 = v70;
      v169 = v168;
      v171 = v170;
      v252 = v161;
      v254 = v167;
      v273 = v164;
      rect_8a = v76;
      objc_msgSend(a1, "_accessibilityCompareFrameForScrollParent:frame:fromOrientation:toOrientation:", v78, v246, v51);
      rect_16 = v172;
      rect_24 = v173;
      v249 = v174;
      v267 = v175;
      v300.origin.x = rect;
      v176 = v276;
      v300.origin.y = v276;
      v177 = v66;
      v300.size.width = v66;
      v300.size.height = v250;
      v306.origin.x = v163;
      v306.origin.y = v166;
      v306.size.width = v169;
      v306.size.height = v171;
      if (!CGRectEqualToRect(v300, v306))
      {
        v250 = v171;
        v177 = v169;
        v176 = v166;
        rect = v163;
      }
      v301.origin.x = v254;
      v307.size.height = v267;
      v301.origin.y = v273;
      v301.size.width = v252;
      v158 = rect_8a;
      v307.origin.x = rect_16;
      v301.size.height = rect_8a;
      v307.origin.y = rect_24;
      v159 = v249;
      v307.size.width = v249;
      v276 = v176;
      if (CGRectEqualToRect(v301, v307))
      {
        v159 = v252;
        v70 = v254;
        v160 = v273;
        v66 = v177;
      }
      else
      {
        v66 = v177;
        v160 = rect_24;
        v158 = v267;
        v70 = rect_16;
      }
    }

    v76 = v158;
    v80 = v159;
    v72 = v160;
    v179 = v70;
    if (v151)
      goto LABEL_94;
  }
  v158 = v76;
  v159 = v80;
  v160 = v72;
  v179 = v70;
LABEL_94:
  if (v77 == v78)
  {
    v181 = 1;
    v70 = v179;
    v274 = v160;
    v80 = v159;
    v76 = v158;
LABEL_103:
    v77 = v78;
    goto LABEL_104;
  }
  v20 = v245;
  v70 = v179;
  if (v78)
  {
    if (v77)
    {
      v146 = _checkSortPriority((void *)v77, (void *)v78);
      if (v146)
      {
LABEL_115:
        v46 = v146;
        goto LABEL_221;
      }
    }
  }
  if (((HIDWORD(v243) | v243) & 1) != 0)
    goto LABEL_99;
  if ((objc_msgSend((id)v77, "_accessibilityAlwaysOrderedFirst") & 1) != 0)
    goto LABEL_208;
  if ((objc_msgSend((id)v78, "_accessibilityAlwaysOrderedFirst") & 1) != 0)
    goto LABEL_185;
LABEL_99:
  v181 = 0;
  v274 = v160;
  v80 = v159;
  v76 = v158;
LABEL_105:
  v182 = 13.0;
  if ((AXDeviceIsPad() & 1) == 0)
  {
    if (AXDeviceIsWatch())
      v182 = 4.0;
    else
      v182 = 8.0;
  }
  if (v77
    && ((v181 & 1) != 0
     || (objc_msgSend((id)v77, "_accessibilityIsDescendantOfElement:", v78) & 1) != 0
     || objc_msgSend((id)v78, "_accessibilityIsDescendantOfElement:", v77)))
  {
    objc_opt_class();
    LODWORD(v183) = objc_opt_isKindOfClass();
    v3 = v278;
    objc_opt_class();
    v184 = objc_opt_isKindOfClass();
    if (v181)
    {
      v146 = objc_msgSend((id)v77, "_accessibilityCompareElement:toElement:", a1, v278);
      if (v146)
        goto LABEL_115;
    }
    if (((v183 | v184) & 1) == 0)
      goto LABEL_188;
    rect_16a = v181;
    v268 = v184;
    rect_24a = v183;
    if ((v183 & 1) != 0)
    {
      v293 = 0u;
      v294 = 0u;
      v291 = 0u;
      v292 = 0u;
      objc_msgSend((id)v77, "_accessibilitySupplementaryHeaderViews");
      v183 = objc_claimAutoreleasedReturnValue();
      v190 = objc_msgSend((id)v183, "countByEnumeratingWithState:objects:count:", &v291, v298, 16);
      if (v190)
      {
        v191 = v190;
        v192 = 0;
        v193 = 0;
        v194 = *(_QWORD *)v292;
        do
        {
          for (i = 0; i != v191; ++i)
          {
            if (*(_QWORD *)v292 != v194)
              objc_enumerationMutation((id)v183);
            v196 = *(_QWORD *)(*((_QWORD *)&v291 + 1) + 8 * i);
            if (objc_msgSend(a1, "_accessibilityIsDescendantOfElement:", v196, v243))
              v192 = 1;
            if (objc_msgSend(v278, "_accessibilityIsDescendantOfElement:", v196))
              v193 = 1;
          }
          v191 = objc_msgSend((id)v183, "countByEnumeratingWithState:objects:count:", &v291, v298, 16);
        }
        while (v191);
      }
      else
      {
        v192 = 0;
        v193 = 0;
      }

      v197 = v192 & 1;
      v198 = v193 & 1;
      v3 = v278;
      v20 = v245;
      LOBYTE(v184) = v268;
      LOBYTE(v183) = rect_24a;
    }
    else
    {
      v197 = 0;
      v198 = 0;
    }
    if ((v184 & 1) == 0)
      goto LABEL_154;
    v255 = v198;
    rect_8c = v197;
    v289 = 0u;
    v290 = 0u;
    v287 = 0u;
    v288 = 0u;
    objc_msgSend((id)v78, "_accessibilitySupplementaryHeaderViews");
    v183 = objc_claimAutoreleasedReturnValue();
    v199 = objc_msgSend((id)v183, "countByEnumeratingWithState:objects:count:", &v287, v297, 16);
    if (v199)
    {
      v200 = v199;
      v201 = 0;
      v202 = 0;
      v203 = *(_QWORD *)v288;
      do
      {
        for (j = 0; j != v200; ++j)
        {
          if (*(_QWORD *)v288 != v203)
            objc_enumerationMutation((id)v183);
          v205 = *(_QWORD *)(*((_QWORD *)&v287 + 1) + 8 * j);
          if (objc_msgSend(a1, "_accessibilityIsDescendantOfElement:", v205, v243))
            v201 = 1;
          if (objc_msgSend(v278, "_accessibilityIsDescendantOfElement:", v205))
            v202 = 1;
        }
        v200 = objc_msgSend((id)v183, "countByEnumeratingWithState:objects:count:", &v287, v297, 16);
      }
      while (v200);
    }
    else
    {
      v201 = 0;
      v202 = 0;
    }

    v3 = v278;
    v20 = v245;
    LOBYTE(v184) = v268;
    LOBYTE(v183) = rect_24a;
    v197 = rect_8c;
    v198 = v255;
    if ((v201 & 1) == 0 || (v202 & 1) != 0)
    {
LABEL_154:
      if ((v198 ^ 1 | v197) != 1)
      {
LABEL_185:
        v46 = 1;
        goto LABEL_221;
      }
      if ((v183 & 1) != 0)
      {
        v285 = 0u;
        v286 = 0u;
        v283 = 0u;
        v284 = 0u;
        objc_msgSend((id)v77, "_accessibilitySupplementaryFooterViews");
        v206 = (void *)objc_claimAutoreleasedReturnValue();
        v207 = objc_msgSend(v206, "countByEnumeratingWithState:objects:count:", &v283, v296, 16);
        if (v207)
        {
          v208 = v207;
          v209 = 0;
          v210 = 0;
          v211 = *(_QWORD *)v284;
          do
          {
            for (k = 0; k != v208; ++k)
            {
              if (*(_QWORD *)v284 != v211)
                objc_enumerationMutation(v206);
              v213 = *(_QWORD *)(*((_QWORD *)&v283 + 1) + 8 * k);
              if (objc_msgSend(a1, "_accessibilityIsDescendantOfElement:", v213, v243))
                v209 = 1;
              if (objc_msgSend(v278, "_accessibilityIsDescendantOfElement:", v213))
                v210 = 1;
            }
            v208 = objc_msgSend(v206, "countByEnumeratingWithState:objects:count:", &v283, v296, 16);
          }
          while (v208);
        }
        else
        {
          v209 = 0;
          v210 = 0;
        }

        v214 = v209 & 1;
        v215 = v210 & 1;
        v3 = v278;
        v20 = v245;
        v181 = rect_16a;
        LOBYTE(v184) = v268;
      }
      else
      {
        v214 = 0;
        v215 = 0;
        v181 = rect_16a;
      }
      if ((v184 & 1) != 0)
      {
        v269 = v214;
        v281 = 0u;
        v282 = 0u;
        v279 = 0u;
        v280 = 0u;
        objc_msgSend((id)v78, "_accessibilitySupplementaryFooterViews");
        v216 = (void *)objc_claimAutoreleasedReturnValue();
        v217 = objc_msgSend(v216, "countByEnumeratingWithState:objects:count:", &v279, v295, 16);
        if (v217)
        {
          v218 = v217;
          rect_24b = v215;
          v219 = 0;
          v220 = 0;
          v221 = *(_QWORD *)v280;
          do
          {
            for (m = 0; m != v218; ++m)
            {
              if (*(_QWORD *)v280 != v221)
                objc_enumerationMutation(v216);
              v223 = *(_QWORD *)(*((_QWORD *)&v279 + 1) + 8 * m);
              if (objc_msgSend(a1, "_accessibilityIsDescendantOfElement:", v223, v243))
                v219 = 1;
              if (objc_msgSend(v278, "_accessibilityIsDescendantOfElement:", v223))
                v220 = 1;
            }
            v218 = objc_msgSend(v216, "countByEnumeratingWithState:objects:count:", &v279, v295, 16);
          }
          while (v218);

          v3 = v278;
          v20 = v245;
          v181 = rect_16a;
          v214 = v269;
          v215 = rect_24b;
          if ((v219 & 1) != 0 && (v220 & 1) == 0)
            goto LABEL_185;
        }
        else
        {

          v20 = v245;
          v181 = rect_16a;
          v214 = v269;
        }
      }
      if ((v215 ^ 1 | v214) == 1)
      {
LABEL_188:
        v187 = v276;
        rect_8b = v76;
        v188 = v80;
        objc_msgSend((id)v77, "_accessibilityAllowedGeometryOverlap", v243);
        v225 = v224;
        if ((v181 & objc_msgSend((id)v77, "_accessibilityOnlyComparesByXAxis")) != 0)
          v182 = 10000.0;
        else
          v182 = v225;
        objc_msgSend((id)v77, "_accessibilityAllowedGeometryOverlapX");
        v189 = v226;
        goto LABEL_192;
      }
    }
LABEL_208:
    v46 = -1;
    goto LABEL_221;
  }
  _accessibilityCommonAncestor((void *)v77, (void *)v78);
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v185, "_accessibilityContainingParentForOrdering");
  v186 = (void *)objc_claimAutoreleasedReturnValue();

  v46 = objc_msgSend(v186, "_accessibilityCompareElement:toElement:", v77, v78);
  if (v46)
    goto LABEL_221;
  v187 = v276;
  rect_8b = v76;
  v188 = v80;
  v189 = 0.0;
LABEL_192:
  objc_msgSend((id)v77, "_accessibilityScrollParentForComparingByXAxis", v243);
  v227 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v78, "_accessibilityScrollParentForComparingByXAxis");
  v228 = objc_claimAutoreleasedReturnValue();
  v229 = (void *)v228;
  if (v227 && v227 == (void *)v228 && (objc_msgSend(v227, "_accessibilityOnlyComparesByXAxis") & 1) != 0
    || v229 && v229 == (void *)v77 && (objc_msgSend((id)v77, "_accessibilityOnlyComparesByXAxis") & 1) != 0
    || v227 && v227 == (void *)v78 && objc_msgSend((id)v78, "_accessibilityOnlyComparesByXAxis"))
  {
    v182 = 10000.0;
  }
  if (vabdd_f64(v187, v274) >= v182)
  {
    if (v187 > v274)
      goto LABEL_217;
    v232 = v187;
    v233 = v274;
    if (v187 < v274)
      goto LABEL_219;
LABEL_214:
    if (v232 <= v233)
    {
      if (v232 >= v233)
      {
        v302.origin.x = rect;
        v302.origin.y = v232;
        v302.size.width = v66;
        v302.size.height = v250;
        MaxY = CGRectGetMaxY(v302);
        v303.origin.x = v70;
        v303.origin.y = v233;
        v303.size.width = v188;
        v303.size.height = rect_8b;
        if (MaxY > CGRectGetMaxY(v303))
          goto LABEL_217;
        v304.origin.x = rect;
        v304.origin.y = v232;
        v304.size.width = v66;
        v304.size.height = v250;
        v235 = CGRectGetMaxY(v304);
        v305.origin.x = v70;
        v305.origin.y = v233;
        v305.size.width = v188;
        v305.size.height = rect_8b;
        if (v235 >= CGRectGetMaxY(v305))
        {
          if (!v247)
            goto LABEL_227;
          objc_msgSend(v244, "windowLevel");
          v238 = v237;
          objc_msgSend(v245, "windowLevel");
          if (v238 > v239)
            goto LABEL_217;
          objc_msgSend(v244, "windowLevel");
          v241 = v240;
          objc_msgSend(v245, "windowLevel");
          if (v241 >= v242)
          {
LABEL_227:
            v46 = 0;
            goto LABEL_220;
          }
        }
      }
LABEL_219:
      v46 = -1;
      goto LABEL_220;
    }
LABEL_217:
    v46 = 1;
    goto LABEL_220;
  }
  if (rect - v70 <= v189)
  {
    v232 = v187;
    v233 = v274;
    if (v70 - rect > v189)
    {
      v230 = objc_msgSend(a1, "_accessibilityIsRTL", v70 - rect) == 0;
      v231 = 1;
      goto LABEL_211;
    }
    goto LABEL_214;
  }
  v230 = objc_msgSend(a1, "_accessibilityIsRTL", rect - v70) == 0;
  v231 = -1;
LABEL_211:
  if (v230)
    v46 = -v231;
  else
    v46 = v231;
LABEL_220:

  v20 = v245;
LABEL_221:

  v18 = v244;
LABEL_222:

LABEL_223:
  return v46;
}

void __55__NSObject_AXPrivCategory___accessibilityVisibleFrame___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v5;
  __int128 v6;
  id v7;
  CGRect v8;

  v7 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "_accessibilityContentFrame");
    *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = CGRectIntersection(v8, *(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)+ 32));
    if (CGRectIsNull(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32)))
    {
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v6 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
      *(_OWORD *)(v5 + 32) = *MEMORY[0x1E0C9D648];
      *(_OWORD *)(v5 + 48) = v6;
      *a3 = 1;
    }
  }

}

void __81__NSObject_AXPrivCategory___accessibilityConvertSystemBoundedPathToContextSpace___block_invoke(uint64_t a1, int a2, CGFloat *a3, uint64_t a4)
{
  uint64_t v7;
  double *v8;
  uint64_t v9;
  uint64_t v10;

  if (a4)
  {
    v7 = a4;
    v8 = a3 + 1;
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "_accessibilityConvertSystemBoundedScreenPointToContextSpace:", *(v8 - 1), *v8);
      *((_QWORD *)v8 - 1) = v9;
      *(_QWORD *)v8 = v10;
      v8 += 2;
      --v7;
    }
    while (v7);
  }
  switch(a2)
  {
    case 0:
      CGPathMoveToPoint(*(CGMutablePathRef *)(a1 + 40), 0, *a3, a3[1]);
      break;
    case 1:
      CGPathAddLineToPoint(*(CGMutablePathRef *)(a1 + 40), 0, *a3, a3[1]);
      break;
    case 2:
      CGPathAddQuadCurveToPoint(*(CGMutablePathRef *)(a1 + 40), 0, *a3, a3[1], a3[2], a3[3]);
      break;
    case 3:
      CGPathAddCurveToPoint(*(CGMutablePathRef *)(a1 + 40), 0, *a3, a3[1], a3[2], a3[3], a3[4], a3[5]);
      break;
    case 4:
      CGPathCloseSubpath(*(CGMutablePathRef *)(a1 + 40));
      break;
    default:
      return;
  }
}

void __52__NSObject_AXPrivCategory___axOutermostScrollParent__block_invoke(uint64_t a1, void *a2)
{
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "_accessibilityIsScrollAncestor"))
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);

}

uint64_t __70__NSObject_AXPrivCategory___accessibilityAuthenticatedPasteWithValue___block_invoke(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CEA810], "_attemptAuthenticationWithMessage:", *(_QWORD *)(a1 + 32));
}

BOOL __55__NSObject_AXPrivCategory___accessibilityPerformEscape__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  id v4;
  objc_class *v5;
  _BOOL8 v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v2 = a2;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__2;
  v13 = __Block_byref_object_dispose__2;
  v14 = 0;
  v8 = MEMORY[0x1E0C809B0];
  v3 = v2;
  AXPerformSafeBlock();
  v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  v6 = 0;
  if (v4)
  {
    v5 = (objc_class *)objc_opt_class();
    if (class_getInstanceMethod(v5, sel_accessibilityPerformEscape) != (Method)_accessibilityPerformEscape_BaseNSObjectMethod
      && (objc_msgSend(v4, "accessibilityPerformEscape", v8, 3221225472, __55__NSObject_AXPrivCategory___accessibilityPerformEscape__block_invoke_2, &unk_1E3DFEF10) & 1) != 0)
    {
      v6 = 1;
    }
  }

  return v6;
}

void __55__NSObject_AXPrivCategory___accessibilityPerformEscape__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend((id)_accessibilityPerformEscape_AXUIViewControllerClass, "viewControllerForView:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __55__NSObject_AXPrivCategory___accessibilityPerformEscape__block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(a2, "subviews", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v6, "accessibilityPerformEscape"))
        {
          UIAccessibilityPostNotification(*MEMORY[0x1E0CEB0A8], 0);
          v3 = 1;
          goto LABEL_12;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_12:

  return v3;
}

void __52__NSObject_AXPrivCategory___accessibilityUnregister__block_invoke(uint64_t a1, void *a2)
{
  _UIAccessibilityCompleteUnregistration(a2);
  _UIAXCleanupRotorCache(a2);
}

uint64_t __52__NSObject_AXPrivCategory___accessibilityUnregister__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __80__NSObject_AXPrivCategory___accessibilityConvertStyleAttributesToAccessibility___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  uint64_t v46;
  void *v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  char v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = *MEMORY[0x1E0CEA0A0];
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CEA0A0]);
  v11 = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    AXColorStringForColor();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0CF41B8]);

    objc_msgSend(v9, "addObject:", v10);
  }
  v48 = (void *)v11;
  v53 = 0;
  objc_opt_class();
  v13 = *MEMORY[0x1E0CEA098];
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CEA098]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v46 = v13;
    v47 = v9;
    objc_msgSend(v15, "fontName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0CF41A8]);

    objc_msgSend(v15, "familyName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0CF41A0]);

    v18 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v15, "pointSize");
    objc_msgSend(v18, "numberWithDouble:");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0CF41B0]);

    objc_msgSend(v15, "fontDescriptor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "symbolicTraits");
    v22 = MEMORY[0x1E0C9AAB0];
    v23 = MEMORY[0x1E0C9AAA0];
    if ((v21 & 2) != 0)
      v24 = MEMORY[0x1E0C9AAB0];
    else
      v24 = MEMORY[0x1E0C9AAA0];
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v24, *MEMORY[0x1E0CF4148]);

    objc_msgSend(v15, "fontDescriptor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v25, "symbolicTraits") & 1) != 0)
      v26 = v22;
    else
      v26 = v23;
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v26, *MEMORY[0x1E0CF41F0]);

    v27 = (void *)MEMORY[0x1E0CB37E8];
    v28 = *MEMORY[0x1E0CEA180];
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CEA180]);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "numberWithInt:", (int)objc_msgSend(v29, "intValue") > 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v30, *MEMORY[0x1E0CF4320]);

    v31 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CEA0F8]);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "numberWithInt:", (int)objc_msgSend(v32, "intValue") > 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v33, *MEMORY[0x1E0CF4300]);

    v34 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v7, "objectForKeyedSubscript:", v28);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "numberWithInt:", (int)objc_msgSend(v35, "intValue") > 0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v36, *MEMORY[0x1E0CF4320]);

    v37 = (void *)MEMORY[0x1E0CB37E8];
    v53 = 0;
    objc_opt_class();
    objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CEA0D0]);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v37, "numberWithInteger:", objc_msgSend(v39, "alignment"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v40, *MEMORY[0x1E0CF4258]);

    v9 = v47;
    objc_msgSend(v47, "addObject:", v46);
  }
  if (objc_msgSend(v8, "count"))
    objc_msgSend(*(id *)(a1 + 32), "addAttributes:range:", v8, a3, a4);
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v41 = v9;
  v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
  if (v42)
  {
    v43 = v42;
    v44 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v43; ++i)
      {
        if (*(_QWORD *)v50 != v44)
          objc_enumerationMutation(v41);
        objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i), a3, a4);
      }
      v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    }
    while (v43);
  }

}

void __115__NSObject_AXPrivCategory___accessibilityPostValueChangedNotificationWithChangeType_insertedText_keyInputDelegate___block_invoke(uint64_t a1)
{
  id *v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  const __CFString *v17;
  uint64_t v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = (id *)MEMORY[0x1E0CEB258];
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*v2, "_accessibilityResponderElementForFocus");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  if (!objc_msgSend(v3, "_accessibilityTextInputProxiesForRealTextView")
    || !objc_msgSend(*(id *)(a1 + 32), "length"))
  {
LABEL_12:
    _UIAccessibilitySetAssociatedElementContextForNextNotification(v3);
    objc_msgSend(v3, "_accessibilityTextViewTextOperationResponder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "_accessibilityTextViewIgnoresValueChanges");

    if (v9)
    {
      AXLogCommon();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v3;
        _os_log_impl(&dword_19D0DD000, v4, OS_LOG_TYPE_INFO, "Ignoring ax value notifications for %@", buf, 0xCu);
      }
    }
    else
    {
      if (*(_QWORD *)(a1 + 48))
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), *MEMORY[0x1E0CF4660]);
        v11 = *(void **)(a1 + 40);
        if (v11)
        {
          UIAXRuntimeConvertOutgoingValue(3072, v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0CF4668]);

        }
        v13 = (void *)objc_msgSend(v10, "copy");

      }
      else
      {
        v13 = 0;
      }
      UIAccessibilityPostNotification(UIAccessibilityValueChangedNotification, v13);

      if (objc_msgSend(*(id *)(a1 + 32), "length"))
      {
        v14 = *(_QWORD *)(a1 + 32);
        v17 = CFSTR("InsertedText");
        v18 = v14;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
        v4 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v4 = 0;
      }
      objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "postNotificationName:object:userInfo:", CFSTR("UIAccessibilityValueChangedLocalNotification"), 0, v4);

    }
    goto LABEL_24;
  }
  objc_msgSend(v3, "accessibilityValue");
  v4 = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[NSObject string](v4, "string");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = v4;
  }
  v6 = v5;
  if ((-[NSObject containsString:](v5, "containsString:", *(_QWORD *)(a1 + 32)) & 1) != 0
    || (v7 = objc_msgSend(v3, "accessibilityTraits"), (UIAccessibilityTraitSecureTextField & v7) != 0))
  {

    goto LABEL_12;
  }
  AXLogCommon();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v20 = v3;
    _os_log_impl(&dword_19D0DD000, v16, OS_LOG_TYPE_INFO, "Ignoring proxied view changes %@", buf, 0xCu);
  }

LABEL_24:
}

uint64_t __76__NSObject_AXPrivCategory___accessibilityElementForTextInsertionAndDeletion__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_accessibilitySupportsTextInsertionAndDeletion");
}

uint64_t __60__NSObject_AXPrivCategory___accessibilityHandwritingElement__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_accessibilitySupportsHandwriting");
}

void __79__NSObject_AXPrivCategory___accessibilityReplaceCharactersAtCursor_withString___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  AXLogAppAccessibility();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_19D0DD000, v0, OS_LOG_TYPE_INFO, "Unblocking notifications after replacing characaters.", v1, 2u);
  }

  AXUIUnblockKeyboardEntryNotifications();
}

uint64_t __79__NSObject_AXPrivCategory___accessibilityReplaceCharactersAtCursor_withString___block_invoke_1300(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "waitUntilAllTasksAreFinished");
}

uint64_t __41__NSObject_AXPrivCategory___axSuperviews__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v2 = a2;
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("InvertColorsDoubleInvert")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    objc_msgSend(v2, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("UIInvertColorsDoubleInvertPrivateKey")) & 1) != 0)
    {
      v4 = 1;
    }
    else
    {
      objc_msgSend(v2, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v6, "isEqualToString:", CFSTR("InvertColorsDarkModeWindowFilter"));

    }
  }

  return v4;
}

void __60__NSObject_AXPrivCategory___accessibilitySupportedLanguages__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredLocalizations");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_accessibilitySupportedLanguages_Supported;
  _accessibilitySupportedLanguages_Supported = v0;

}

void __90__NSObject_AXPrivCategory___accessibilityPostPasteboardTextForOperation_associatedObject___block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("UIAX-PasteBoard-Queue", 0);
  v1 = (void *)_accessibilityPostPasteboardTextForOperation_associatedObject__pasteBoardQueue;
  _accessibilityPostPasteboardTextForOperation_associatedObject__pasteBoardQueue = (uint64_t)v0;

}

void __90__NSObject_AXPrivCategory___accessibilityPostPasteboardTextForOperation_associatedObject___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  objc_msgSend(MEMORY[0x1E0CEA810], "generalPasteboard");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__2;
  v9 = __Block_byref_object_dispose__2;
  objc_msgSend(v2, "string");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)v6[5], "length"))
  {
    v3 = *(id *)(a1 + 32);
    v4 = *(id *)(a1 + 40);
    AXPerformBlockOnMainThread();

  }
  _Block_object_dispose(&v5, 8);

}

void __90__NSObject_AXPrivCategory___accessibilityPostPasteboardTextForOperation_associatedObject___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id argument;

  if (objc_msgSend(*(id *)(a1 + 32), "length"))
  {
    v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    UIKitAccessibilityLocalizedString(*(void **)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringByAppendingFormat:", CFSTR(", %@"), v3);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;

  }
  objc_msgSend(MEMORY[0x1E0CF40C0], "axAttributedStringWithString:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  argument = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(argument, "setAttribute:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CF4260]);
  _UIAccessibilitySetAssociatedElementContextForNextNotification(*(void **)(a1 + 40));
  UIAccessibilityPostNotification(*MEMORY[0x1E0CEAFC0], argument);

}

uint64_t __69__NSObject_AXPrivCategory___accessibilityIsDraggableElementAttribute__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_accessibilityHasDragSources");
}

uint64_t __69__NSObject_AXPrivCategory___accessibilityIsDraggableElementAttribute__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_accessibilityHasDragSources");
}

BOOL __89__NSObject_AXPrivCategory___accessibilityFilterInteractionLocationDescriptorsForVisible___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 i;
  uint64_t v7;
  void *v8;
  void *v9;

  v2 = a2;
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && (objc_msgSend(v4, "isHidden") & 1) == 0)
  {
    objc_msgSend(v2, "point");
    objc_msgSend(v5, "convertPoint:fromView:", v3);
    objc_msgSend(v5, "hitTest:withEvent:", 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    for (i = v7 != 0; v8 != v3 && v8; i = v8 != 0)
    {
      v9 = v8;
      objc_msgSend(v8, "superview");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    i = 0;
  }

  return i;
}

uint64_t __87__NSObject_AXPrivCategory___accessibilityDragSourceDescriptorDictionaryRepresentations__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_accessibilityCanDrag");

  return v3;
}

id __87__NSObject_AXPrivCategory___accessibilityDragSourceDescriptorDictionaryRepresentations__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  objc_msgSend(*(id *)(a1 + 32), "_accessibilityDragSourceDescriptorAuxiliaryDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v4, "addEntriesFromDictionary:", v5);

  return v4;
}

id __86__NSObject_AXPrivCategory___accessibilityDropPointDescriptorDictionaryRepresentations__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  AXValueRef v25;
  AXValueRef v26;
  void *v27;
  uint64_t v29;
  uint64_t v30;
  _QWORD valuePtr[2];

  v3 = a2;
  objc_msgSend(v3, "dictionaryRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v3, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "point");
  objc_msgSend(v8, "convertPoint:toView:", v7);
  v10 = v9;
  v12 = v11;

  objc_msgSend(v7, "convertPoint:toWindow:", 0, v10, v12);
  AXUIConvertPointFromScreenToContextSpace();
  valuePtr[0] = v13;
  valuePtr[1] = v14;
  objc_msgSend(v3, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "point");
  v17 = v16;
  v19 = v18;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "fixedCoordinateSpace");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "convertPoint:toCoordinateSpace:", v21, v17, v19);
  v29 = v22;
  v30 = v23;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v7, "_contextId", v29, v30));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v24, *MEMORY[0x1E0CF3FA8]);

  v25 = AXValueCreate(kAXValueTypeCGPoint, valuePtr);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", CFAutorelease(v25), *MEMORY[0x1E0CF3FB0]);
  v26 = AXValueCreate(kAXValueTypeCGPoint, &v29);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", CFAutorelease(v26), *MEMORY[0x1E0CF3FC0]);
  objc_msgSend(*(id *)(a1 + 32), "_accessibilityDropPointDescriptorAuxiliaryDictionary");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
    objc_msgSend(v5, "addEntriesFromDictionary:", v27);

  return v5;
}

uint64_t __74__NSObject_AXPrivCategory___accessibilityUseContextlessPassthroughForDrag__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_accessibilityHasDragSources");
}

void __65__NSObject_AXAutoscrolling___accessibilityAutoscrollInDirection___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v5 = 0;
    goto LABEL_9;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "_accessibilityIgnoreDelegate") & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v13, "safeValueForKey:", CFSTR("delegate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if ((objc_opt_respondsToSelector() & 1) == 0 || (objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_9:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v13, "safeValueForKey:", CFSTR("dataSource"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9 != v5 && (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
        goto LABEL_17;

    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      goto LABEL_19;
    objc_msgSend(MEMORY[0x1E0CEABB8], "viewControllerForView:", v13);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) == 0)
    {
LABEL_18:

      goto LABEL_19;
    }
LABEL_17:
    objc_msgSend(v9, "_accessibilityScrollAncestor");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    *a3 = 1;
    goto LABEL_18;
  }
  objc_msgSend(v5, "_accessibilityScrollAncestor");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  *a3 = 1;
LABEL_19:

}

uint64_t __60__NSObject_AXAutoscrolling___accessibilityGetAllScrollViews__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  int v5;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = objc_msgSend(v3, "_accessibilityScrollingEnabled");
  else
    v4 = 0;
  v5 = objc_msgSend(v3, "_accessibilityIsRemoteElement");
  if (v5)
    v5 = objc_msgSend(v3, "onClientSide");
  if ((v4 | v5) == 1)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

  return 0;
}

void __54__NSObject_AXAutoscrolling___accessibilityScrollToTop__block_invoke(uint64_t a1)
{
  UIAccessibilityNotifications v1;
  id v2;

  v1 = *MEMORY[0x1E0CEB058];
  objc_msgSend(*(id *)(a1 + 32), "_accessibilityFirstOpaqueElement");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v1, v2);

}

void __57__NSObject_AXAutoscrolling___accessibilityScrollToBottom__block_invoke(uint64_t a1)
{
  UIAccessibilityNotifications v1;
  id v2;

  v1 = *MEMORY[0x1E0CEB058];
  objc_msgSend(*(id *)(a1 + 32), "_accessibilityLastOpaqueElement");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v1, v2);

}

void __64__NSObject_AXAutoscrolling___accessibilityAutoscrollScrollToTop__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_accessibilityWindow");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "accessibilityActivationPoint");
  objc_msgSend(v2, "_scrollToTopViewsUnderScreenPointIfNecessary:resultHandler:", &__block_literal_global_2442);

}

void __89__NSObject_UIStorage___accessibilityActivateDragWithDescriptorDictionary_forServiceName___block_invoke(uint64_t a1, void *a2)
{
  id v4;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

uint64_t __89__NSObject_UIStorage___accessibilityActivateDragWithDescriptorDictionary_forServiceName___block_invoke_2(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
  return result;
}

uint64_t __68__NSObject_UIStorage___accessibilitySpeakThisElementWithIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __57__NSObject_UIStorage___drawsFocusRingWhenChildrenFocused__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_accessibilityDrawsFocusRingWhenChildrenFocused");
}

uint64_t __51__NSObject_UIStorage___accessibilityFocusContainer__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_accessibilityIsFocusContainer");
}

void __58__NSObject_UIStorage___accessibilityClearLastFocusedChild__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if (objc_msgSend(v2, "_accessibilityRemembersLastFocusedChild"))
    objc_msgSend(v2, "_axSetLastFocusedChild:", 0);

}

BOOL __77__NSObject_UIStorage___accessibilityIsContainedByPreferredNativeFocusElement__block_invoke(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + 32) == a2;
}

Class __62__NSObject_UIStorage___accessibilityIsContainedByVideoElement__block_invoke()
{
  Class result;

  _accessibilityIsContainedByVideoElement_AVPlayerViewControllerClass = (uint64_t)NSClassFromString(CFSTR("AVPlayerViewController"));
  result = NSClassFromString(CFSTR("AVInfoPanelViewController"));
  _accessibilityIsContainedByVideoElement_AVInfoPanelViewController = (uint64_t)result;
  return result;
}

uint64_t __62__NSObject_UIStorage___accessibilityIsContainedByVideoElement__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    isKindOfClass = 1;
  else
    isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __58__NSObject_UIStorage___accessibilitySortExplorerElements___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a2;
  objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(a3, "_accessibilityExplorerElementReadPriority"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = objc_msgSend(v5, "_accessibilityExplorerElementReadPriority");

  objc_msgSend(v7, "numberWithUnsignedInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "compare:", v9);

  return v10;
}

BOOL __54__NSObject_UIStorage___isAccessibilityExplorerElement__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  _BOOL8 v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = objc_msgSend(v2, "accessibilityTraits");
    v4 = (*MEMORY[0x1E0CEB120] & v3) != 0;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t __83__NSObject_UIAccessibilityAutomation___accessibilityUserTestingSupplementaryViews___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

uint64_t __90__NSObject_UIAccessibilityAutomation___accessibilityBaseImplementationUserTestingChildren__block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "addObject:", a2);
  return result;
}

uint64_t __150__NSObject_UIAccessibilityAutomation___accessibilityUserTestingSnapshotDescendantsWithAttributes_maxDepth_maxChildren_maxArrayCount_honorsModalViews___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "accessibilityViewIsModal");
}

void __150__NSObject_UIAccessibilityAutomation___accessibilityUserTestingSnapshotDescendantsWithAttributes_maxDepth_maxChildren_maxArrayCount_honorsModalViews___block_invoke_253(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;

  v7 = a2;
  if (*(_QWORD *)(a1 + 48) <= a3)
  {
    *a4 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "_accessibilityUserTestingIsElementClassAcceptable") & 1) == 0)
    {
      AXLogUIA();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __150__NSObject_UIAccessibilityAutomation___accessibilityUserTestingSnapshotDescendantsWithAttributes_maxDepth_maxChildren_maxArrayCount_honorsModalViews___block_invoke_253_cold_3((uint64_t)v7, v9, v10, v11, v12, v13, v14, v15);

    }
    v16 = (void *)_AXCreateAXUIElementWithElement();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, CFSTR("UIAccessibilitySnapshotKeyElement"));

    AXLogUIA();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      __150__NSObject_UIAccessibilityAutomation___accessibilityUserTestingSnapshotDescendantsWithAttributes_maxDepth_maxChildren_maxArrayCount_honorsModalViews___block_invoke_253_cold_2();

    AXLogUIA();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      __150__NSObject_UIAccessibilityAutomation___accessibilityUserTestingSnapshotDescendantsWithAttributes_maxDepth_maxChildren_maxArrayCount_honorsModalViews___block_invoke_253_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);

  }
}

uint64_t __148__NSObject_UIAccessibilityAutomation___accessibilityUserTestingSnapshotAncestorsWithAttributes_maxDepth_maxChildren_maxArrayCount_honorsModalViews___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "accessibilityViewIsModal");
}

void __148__NSObject_UIAccessibilityAutomation___accessibilityUserTestingSnapshotAncestorsWithAttributes_maxDepth_maxChildren_maxArrayCount_honorsModalViews___block_invoke_255(uint64_t a1, void *a2, unint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  id v14;
  id v15;

  v7 = a2;
  if (*(_QWORD *)(a1 + 56) <= a3)
  {
    *a4 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)_AXCreateAXUIElementWithElement();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("UIAccessibilitySnapshotKeyElement"));

    AXLogUIA();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      __150__NSObject_UIAccessibilityAutomation___accessibilityUserTestingSnapshotDescendantsWithAttributes_maxDepth_maxChildren_maxArrayCount_honorsModalViews___block_invoke_253_cold_1();

    v11 = *(void **)(a1 + 32);
    v12 = *(_QWORD *)(a1 + 64);
    v15 = 0;
    _accessibilityAttributesForObject(v7, v11, v12, 1, &v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v15;
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, CFSTR("UIAccessibilitySnapshotKeyAttributes"));

    if (*(_QWORD *)(a1 + 40))
      objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, CFSTR("UIAccessibilitySnapshotKeyAttributeArrayCounts"));
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v8);

  }
}

uint64_t __84__NSObject_UIAccessibilityAutomation___accessibilityUserTestingSnapshotWithOptions___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

BOOL __79__NSObject_UIAccessibilityTextAttributeRotor___accessibilityUnderlineTextMatch__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "objectForKeyedSubscript:", *MEMORY[0x1E0CEA180]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (int)objc_msgSend(v2, "intValue") > 0;

  return v3;
}

uint64_t __76__NSObject_UIAccessibilityTextAttributeRotor___accessibilityItalicTextMatch__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a2;
  v5 = a3;
  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CEA098]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "fontDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "symbolicTraits") & 1;

  return v9;
}

uint64_t __74__NSObject_UIAccessibilityTextAttributeRotor___accessibilityBoldTextMatch__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a2;
  v5 = a3;
  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CEA098]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "fontDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (objc_msgSend(v8, "symbolicTraits") >> 1) & 1;

  return v9;
}

uint64_t __75__NSObject_UIAccessibilityTextAttributeRotor___accessibilityPlainTextMatch__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  BOOL v14;
  uint64_t v15;

  v4 = a2;
  v5 = a3;
  objc_opt_class();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CEA098]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "fontDescriptor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "symbolicTraits");

  objc_msgSend(v7, "fontDescriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "symbolicTraits") & 2 | v9 & 1;

  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CEA180]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "intValue");

  if (v11)
    v14 = 0;
  else
    v14 = v13 < 1;
  v15 = v14;

  return v15;
}

uint64_t __77__NSObject_UIAccessibilityTextAttributeRotor___accessibilityStyleChangeMatch__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  void *v17;
  char v18;
  void *v19;
  char v20;
  void *v21;
  int v22;
  BOOL v24;
  int v25;
  unsigned int v27;
  uint64_t v28;
  int v30;

  v4 = a2;
  v5 = a3;
  objc_opt_class();
  v6 = *MEMORY[0x1E0CEA098];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CEA098]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v8 = objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)v8, "fontDescriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v9, "symbolicTraits");

  objc_msgSend((id)v8, "fontDescriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "symbolicTraits");

  v12 = *MEMORY[0x1E0CEA180];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CEA180]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "intValue");

  objc_opt_class();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v16 = objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)v16, "fontDescriptor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "symbolicTraits");

  objc_msgSend((id)v16, "fontDescriptor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "symbolicTraits");

  objc_msgSend(v5, "objectForKeyedSubscript:", v12);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "intValue");

  v24 = v14 < 1 || v22 > 0;
  v25 = (v30 ^ ((v18 & 1) == 0)) & (((v11 & 2) == 0) | ((v20 & 2) >> 1)) & (((v20 & 2) == 0) | ((v11 & 2) >> 1)) & *(_DWORD *)&v24;
  if (v14 <= 0 && v22 >= 1)
    v25 = 0;
  v27 = v25 ^ 1;
  if (v8 | v16)
    v28 = v27;
  else
    v28 = 0;

  return v28;
}

uint64_t __76__NSObject_UIAccessibilityTextAttributeRotor___accessibilityFontChangeMatch__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  v4 = a2;
  v5 = a3;
  objc_opt_class();
  v6 = *MEMORY[0x1E0CEA098];
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CEA098]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v8 = objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v10 = objc_claimAutoreleasedReturnValue();

  if (v8 | v10)
    v11 = objc_msgSend((id)v8, "isEqual:", v10) ^ 1;
  else
    v11 = 0;

  return v11;
}

BOOL __77__NSObject_UIAccessibilityTextAttributeRotor___accessibilityColorChangeMatch__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL8 v8;

  v4 = *MEMORY[0x1E0CEA0A0];
  v5 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", v4);
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v7 = objc_claimAutoreleasedReturnValue();

  if (v6 | v7)
    v8 = !UIAccessibilityColorEqualToColor((void *)v6, (void *)v7);
  else
    v8 = 0;

  return v8;
}

void __78__NSObject_UIAccessibilityTextAttributeRotor___accessibilityAttributeMatcher___block_invoke(uint64_t a1)
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
  uint64_t v12;
  void *v13;
  void *v14;
  _QWORD v15[7];
  _QWORD v16[8];

  v16[7] = *MEMORY[0x1E0C80C00];
  v15[0] = &unk_1E3E10C88;
  objc_msgSend(*(id *)(a1 + 32), "_accessibilityBoldTextMatch");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v14;
  v15[1] = &unk_1E3E10CA0;
  objc_msgSend(*(id *)(a1 + 32), "_accessibilityItalicTextMatch");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v2;
  v15[2] = &unk_1E3E10CB8;
  objc_msgSend(*(id *)(a1 + 32), "_accessibilityUnderlineTextMatch");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", UIAccessibilityCustomSystemRotorTypePlainText);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v4;
  objc_msgSend(*(id *)(a1 + 32), "_accessibilityPlainTextMatch");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", UIAccessibilityCustomSystemRotorTypeColorChange);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[4] = v6;
  objc_msgSend(*(id *)(a1 + 32), "_accessibilityColorChangeMatch");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[4] = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", UIAccessibilityCustomSystemRotorTypeFontChange);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[5] = v8;
  objc_msgSend(*(id *)(a1 + 32), "_accessibilityFontChangeMatch");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[5] = v9;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", UIAccessibilityCustomSystemRotorTypeStyleChange);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[6] = v10;
  objc_msgSend(*(id *)(a1 + 32), "_accessibilityStyleChangeMatch");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[6] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 7);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)_accessibilityAttributeMatcher__Matchers;
  _accessibilityAttributeMatcher__Matchers = v12;

}

id __84__NSObject_UIAccessibilityTextAttributeRotor___accessibilityTextStylingCustomRotor___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  const char *v41;
  __int128 v42;

  v3 = a2;
  objc_msgSend(v3, "currentItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "targetElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);

  if (v5 == v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "_accessibilityAttributeMatcher:", *(_QWORD *)(a1 + 40));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsProtocol();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "currentItem");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "targetRange");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v3, "searchDirection");
    if (!v9)
    {
      if (v10 == 1)
      {
        objc_msgSend(v8, "beginningOfDocument");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "beginningOfDocument");
      }
      else
      {
        objc_msgSend(v8, "endOfDocument");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "endOfDocument");
      }
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "textRangeFromPosition:toPosition:", v11, v12);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v38 = 0;
    v39 = &v38;
    v40 = 0x3010000000;
    v41 = "";
    v42 = xmmword_19D142620;
    objc_msgSend(*(id *)(a1 + 32), "_accessibilityAttributedTextRetrieval");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "length"))
    {
      objc_msgSend(v8, "beginningOfDocument");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "start");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v8, "offsetFromPosition:toPosition:", v14, v15);

      if (v16 >= objc_msgSend(v13, "length"))
        v16 = objc_msgSend(v13, "length") - 1;
      objc_msgSend(v8, "beginningOfDocument");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "end");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v8, "offsetFromPosition:toPosition:", v17, v18);

      if (v10 == 1)
      {
        v20 = objc_msgSend(v13, "length") - v19;
      }
      else
      {
        v19 = 0;
        v20 = v16;
      }
      objc_msgSend(v13, "attributesAtIndex:effectiveRange:", v16, 0);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (*(_QWORD *)(a1 + 40) == 13)
      {
        v22 = objc_msgSend(*(id *)(a1 + 32), "_accessibilityMisspelledWordIn:searchRange:next:", v13, v19, v20, v10 == 1);
        v23 = v39;
        v39[4] = v22;
        v23[5] = v24;
      }
      else
      {
        v34[0] = MEMORY[0x1E0C809B0];
        v34[1] = 3221225472;
        v34[2] = __84__NSObject_UIAccessibilityTextAttributeRotor___accessibilityTextStylingCustomRotor___block_invoke_2;
        v34[3] = &unk_1E3DFFBA8;
        v36 = v33;
        v35 = v21;
        v37 = &v38;
        objc_msgSend(v13, "enumerateAttributesInRange:options:usingBlock:", v19, v20, 2 * (v10 != 1), v34);

      }
    }
    v25 = v39[4];
    if (v25 == 0x7FFFFFFF || v25 == 0x7FFFFFFFFFFFFFFFLL)
    {

      _Block_object_dispose(&v38, 8);
      v7 = 0;
    }
    else
    {
      objc_msgSend(v8, "beginningOfDocument");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "positionFromPosition:offset:", v26, v39[4]);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "beginningOfDocument");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "positionFromPosition:offset:", v28, v39[5] + v39[4]);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "textRangeFromPosition:toPosition:", v27, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      _Block_object_dispose(&v38, 8);
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA290]), "initWithTargetElement:targetRange:", *(_QWORD *)(a1 + 32), v30);

    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __84__NSObject_UIAccessibilityTextAttributeRotor___accessibilityTextStylingCustomRotor___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t result;
  uint64_t v10;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if ((_DWORD)result)
  {
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    *(_QWORD *)(v10 + 32) = a3;
    *(_QWORD *)(v10 + 40) = a4;
    *a5 = 1;
  }
  return result;
}

void __60__NSObject_AXPrivCategory___accessibilityHitTest_withEvent___block_invoke_cold_1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_10();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_6();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_19D0DD000, v4, v5, "Attempted to check for nonexistent method: %@ on class: %@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_1_1();
}

void __60__NSObject_AXPrivCategory___accessibilityHitTest_withEvent___block_invoke_2_cold_1(const char *a1)
{
  void *v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_19D0DD000, v4, v5, "Attempted to check for nonexistent method: %@ on class: %@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_1_1();
}

void __61__NSObject_AXPrivCategory___accessibilityBaseScrollToVisible__block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;
  CGPoint v9;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_accessibilityContentOffset");
  NSStringFromCGPoint(v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138478083;
  v7 = a1;
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_9(&dword_19D0DD000, a2, v5, "After scrolling parent %{private}@, it had accessibility content offset %{private}@", (uint8_t *)&v6);

  OUTLINED_FUNCTION_1_1();
}

void __61__NSObject_AXPrivCategory___accessibilityBaseScrollToVisible__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_11(&dword_19D0DD000, v0, v1, "Scrolled with child: %i.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __61__NSObject_AXPrivCategory___accessibilityBaseScrollToVisible__block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_19();
  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_11(&dword_19D0DD000, v0, v1, "Scrolled parent to visible: %i.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __61__NSObject_AXPrivCategory___accessibilityBaseScrollToVisible__block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_11(&dword_19D0DD000, v0, v1, "Did frame scroll: %i", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __61__NSObject_AXPrivCategory___accessibilityBaseScrollToVisible__block_invoke_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_20();
  OUTLINED_FUNCTION_11(&dword_19D0DD000, v0, v1, "Should frame scroll: %i", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __61__NSObject_AXPrivCategory___accessibilityBaseScrollToVisible__block_invoke_cold_6(uint64_t a1, Class aClass, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  NSStringFromClass(aClass);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138478083;
  v8 = a1;
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_9(&dword_19D0DD000, a3, v6, "scrollToView: %{private}@. Parent base class: %{private}@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_1_1();
}

void __61__NSObject_AXPrivCategory___accessibilityBaseScrollToVisible__block_invoke_cold_7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_0(&dword_19D0DD000, v0, v1, "Skipping", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __61__NSObject_AXPrivCategory___accessibilityBaseScrollToVisible__block_invoke_cold_8(void *a1, NSObject *a2)
{
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;
  CGPoint v9;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_accessibilityContentOffset");
  NSStringFromCGPoint(v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138478083;
  v7 = a1;
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_9(&dword_19D0DD000, a2, v5, "Checking parent %{private}@ with accessibility content offset %{private}@", (uint8_t *)&v6);

  OUTLINED_FUNCTION_1_1();
}

void __150__NSObject_UIAccessibilityAutomation___accessibilityUserTestingSnapshotDescendantsWithAttributes_maxDepth_maxChildren_maxArrayCount_honorsModalViews___block_invoke_253_cold_1()
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
  OUTLINED_FUNCTION_0_4(&dword_19D0DD000, v4, v5, "Setting child snapshot element: %{private}@, %{private}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_1_1();
}

void __150__NSObject_UIAccessibilityAutomation___accessibilityUserTestingSnapshotDescendantsWithAttributes_maxDepth_maxChildren_maxArrayCount_honorsModalViews___block_invoke_253_cold_2()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v0 = (id)OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0_4(&dword_19D0DD000, v1, v2, "Snapshot element going in:%p %{public}@", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_8();
}

void __150__NSObject_UIAccessibilityAutomation___accessibilityUserTestingSnapshotDescendantsWithAttributes_maxDepth_maxChildren_maxArrayCount_honorsModalViews___block_invoke_253_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_0(&dword_19D0DD000, a2, a3, "This child can't be serialized correctly: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

@end
