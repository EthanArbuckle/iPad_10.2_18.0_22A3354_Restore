@implementation NSObject(UIAccessibilityElementTraversal)

- (id)_accessibilityElementsInDirectionWithCount:()UIAccessibilityElementTraversal options:
{
  void *v4;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  char v13;
  id v14;
  char v15;
  void *v16;
  char v17;
  char v18;
  id v19;
  id v20;
  _QWORD v22[4];
  id v23;
  id v24;
  uint64_t *v25;
  uint64_t *v26;
  unint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;

  v7 = a4;
  if (!v7)
  {
    _AXAssert();
    if (a3)
      goto LABEL_3;
LABEL_32:
    _AXAssert();
    goto LABEL_3;
  }
  if (!a3)
    goto LABEL_32;
LABEL_3:
  AXLogElementTraversal();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[NSObject(UIAccessibilityElementTraversal) _accessibilityElementsInDirectionWithCount:options:].cold.1((uint64_t)v7, a3, v8);

  if (objc_msgSend(v7, "shouldReturnScannerGroups"))
    _AXAssert();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = a1;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  while (v10)
  {
    v28 = 0;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __96__NSObject_UIAccessibilityElementTraversal___accessibilityElementsInDirectionWithCount_options___block_invoke;
    v22[3] = &unk_1E3DFDFB8;
    v27 = a3;
    v25 = &v33;
    v11 = v7;
    v23 = v11;
    v12 = v9;
    v24 = v12;
    v26 = &v29;
    v13 = objc_msgSend(v10, "_accessibilityEnumerateSiblingsWithParent:options:usingBlock:", &v28, v11, v22);
    v14 = v28;
    if ((v13 & 1) != 0 && !*((_BYTE *)v30 + 24))
    {
      if (objc_msgSend(v10, "_accessibilityIsRemoteElement")
        && (objc_msgSend(v10, "onClientSide") & 1) == 0)
      {
        if (v14)
          _AXAssert();
        if (v34[3] >= a3)
          _AXAssert();
        objc_msgSend(v12, "addObject:", v10);
      }
      objc_msgSend(v11, "allowedElementsForTraversal");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        objc_msgSend(v11, "allowedElementsForTraversal");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v4, "containsObject:", v14))
        {

          goto LABEL_26;
        }
      }
      v17 = objc_msgSend(v14, "_accessibilityIsRootElementForElementTraversal");
      v18 = v17;
      if (v16)
      {

        if ((v18 & 1) != 0)
          goto LABEL_26;
LABEL_28:
        v19 = v14;
      }
      else
      {
        if ((v17 & 1) == 0)
          goto LABEL_28;
LABEL_26:
        v19 = 0;
      }

      v15 = 1;
      v10 = v19;
      goto LABEL_12;
    }
    v15 = 0;
LABEL_12:

    if ((v15 & 1) == 0)
      break;
  }
  v20 = v9;
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);

  return v20;
}

- (id)_accessibilityTreeAsString
{
  void *v2;
  void *v3;

  +[UIAccessibilityElementTraversalOptions voiceOverOptionsIncludingElementsFromOpaqueProviders:honorsGroups:](UIAccessibilityElementTraversalOptions, "voiceOverOptionsIncludingElementsFromOpaqueProviders:honorsGroups:", 1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilityTreeAsStringWithOptions:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_accessibilityTreeAsStringWithOptions:()UIAccessibilityElementTraversal
{
  id v4;
  UIAccessibilityInMemoryStringBasedTreeLogger *v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc_init(UIAccessibilityInMemoryStringBasedTreeLogger);
  objc_msgSend(a1, "_accessibilityTraverseTreeWithLogger:options:", v5, v4);

  -[UIAccessibilityInMemoryStringBasedTreeLogger stringRepresentation](v5, "stringRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (uint64_t)_accessibilityTraverseTreeWithLogger:()UIAccessibilityElementTraversal options:
{
  return objc_msgSend(a1, "_accessibilityTraverseTreeWithLogger:shouldStopAtRemoteElement:options:", a3, 0, a4);
}

- (id)_accessibilityTraverseTreeWithLogger:()UIAccessibilityElementTraversal shouldStopAtRemoteElement:options:
{
  return (id)objc_msgSend(a1, "_accessibilityLeafDescendantsWithCount:shouldStopAtRemoteElement:options:treeLogger:", 0, a4, a5, a3);
}

- (uint64_t)_accessibilityLeafDescendantsWithOptions:()UIAccessibilityElementTraversal
{
  return objc_msgSend(a1, "_accessibilityLeafDescendantsWithCount:options:", 0, a3);
}

- (uint64_t)_accessibilityLeafDescendantsWithCount:()UIAccessibilityElementTraversal options:
{
  return objc_msgSend(a1, "_accessibilityLeafDescendantsWithCount:shouldStopAtRemoteElement:options:", a3, 0, a4);
}

- (uint64_t)_accessibilityLeafDescendantsWithCount:()UIAccessibilityElementTraversal shouldStopAtRemoteElement:options:
{
  return objc_msgSend(a1, "_accessibilityLeafDescendantsWithCount:shouldStopAtRemoteElement:options:treeLogger:", a3, a4, a5, 0);
}

- (uint64_t)_accessibilityShouldBeAddedToViewChildrenWithOptions:()UIAccessibilityElementTraversal
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t (**v7)(_QWORD, _QWORD);
  char v8;
  uint64_t v9;
  void *v11;

  v4 = a3;
  if ((objc_msgSend(a1, "_accessibilityShouldBeProcessed:", v4) & 1) == 0)
  {
    v11 = a1;
    _AXAssert();
  }
  objc_msgSend(v4, "leafNodePredicate", v11);
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        objc_msgSend(v4, "leafNodePredicate"),
        v7 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(),
        v8 = ((uint64_t (**)(_QWORD, void *))v7)[2](v7, a1),
        v7,
        v6,
        (v8 & 1) != 0)
    || (objc_msgSend(a1, "_accessibilityHasOrderedChildren") & 1) != 0)
  {
    v9 = 1;
  }
  else
  {
    v9 = objc_msgSend(a1, "isAccessibilityElement");
  }

  return v9;
}

- (id)_accessibilityLeafDescendantsWithCount:()UIAccessibilityElementTraversal shouldStopAtRemoteElement:options:treeLogger:
{
  id v10;
  id v11;
  _BOOL4 v12;
  int v13;
  void *v14;
  id v15;
  int v16;
  int v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  int v34;
  id v35;
  void *v36;
  int v37;
  int v38;
  void *v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  unint64_t v44;
  BOOL v45;
  char v46;
  _QWORD v47[4];
  id v48;
  id v49;
  id v50;
  unint64_t v51;
  char v52;
  const __CFString *v53;
  _QWORD v54[3];

  v54[1] = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  if (!v10)
    _AXAssert();
  v12 = objc_msgSend(v10, "direction") == 2;
  if (objc_msgSend(v10, "forSpeakScreen")
    && objc_msgSend(a1, "_accessibilitySpeakThisShouldOnlyIncludeVisibleElements")
    && (objc_msgSend(v10, "shouldOnlyIncludeElementsWithVisibleFrame") & 1) == 0)
  {
    v13 = 1;
    objc_msgSend(v10, "setShouldOnlyIncludeElementsWithVisibleFrame:", 1);
  }
  else
  {
    v13 = 0;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "shouldOnlyIncludeElementsWithVisibleFrame")
    || objc_msgSend(a1, "_accessibilityHasVisibleFrame"))
  {
    v38 = a4;
    v39 = v14;
    v15 = v14;
    v16 = objc_msgSend(a1, "_accessibilityIsLeafNodeWithOptions:", v10);
    if ((v16 & 1) != 0)
    {
      v17 = 0;
      v18 = v15;
    }
    else
    {
      if (objc_msgSend(v10, "shouldReturnScannerGroups")
        && objc_msgSend(a1, "_accessibilityIsScannerGroup"))
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v18 = (id)objc_claimAutoreleasedReturnValue();

        v17 = 1;
      }
      else
      {
        v17 = 0;
        v18 = v15;
      }
      if (objc_msgSend(v10, "shouldReturnScannerGroups"))
      {
        if (a3)
          _AXAssert();
        v37 = v13;
        if (objc_msgSend(v10, "direction") != 1)
          _AXAssert();
        v19 = v11;
        if (v38)
          _AXAssert();
        objc_msgSend(a1, "_accessibilityScannerGroupElements");
        v20 = objc_claimAutoreleasedReturnValue();
        if (v20)
        {
          v21 = (void *)v20;
          objc_msgSend(v18, "addObjectsFromArray:", v20);

          v11 = v19;
          v13 = v37;
          if ((v17 & 1) != 0)
            goto LABEL_37;
          goto LABEL_44;
        }
        v13 = v37;
      }
    }
    if (!a3 || objc_msgSend(v15, "count") < a3)
    {
      objc_msgSend(v11, "logElement:", a1);
      if (v16)
      {
        objc_msgSend(v15, "addObject:", a1);
        if ((v17 & 1) == 0)
          goto LABEL_44;
LABEL_37:
        v23 = v13;
        v24 = (void *)MEMORY[0x1E0C99E08];
        v53 = CFSTR("GroupElements");
        v54[0] = v18;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v54, &v53, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "dictionaryWithDictionary:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        v27 = objc_msgSend(a1, "_accessibilityScannerGroupTraits");
        if (v27)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setObject:forKeyedSubscript:", v28, CFSTR("GroupTraits"));

        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", objc_msgSend(a1, "_accessibilityScanningBehaviorTraits") | 0x10);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "setObject:forKeyedSubscript:", v29, CFSTR("GroupScanBehaviorTraits"));

        objc_msgSend(a1, "_accessibilityAXAttributedLabel");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v30, "length"))
          objc_msgSend(v26, "setObject:forKeyedSubscript:", v30, CFSTR("GroupLabel"));
        objc_msgSend(a1, "_accessibilityGroupIdentifier");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (v31)
          objc_msgSend(v26, "setObject:forKeyedSubscript:", v31, CFSTR("GroupIdentifier"));
        objc_msgSend(v15, "addObject:", v26);

        v13 = v23;
        goto LABEL_44;
      }
      v22 = 2 * v12;
      if (objc_msgSend(a1, "_accessibilityHasOrderedChildren"))
      {
        v47[0] = MEMORY[0x1E0C809B0];
        v47[1] = 3221225472;
        v47[2] = __129__NSObject_UIAccessibilityElementTraversal___accessibilityLeafDescendantsWithCount_shouldStopAtRemoteElement_options_treeLogger___block_invoke;
        v47[3] = &unk_1E3DFDFE0;
        v18 = v18;
        v48 = v18;
        v51 = a3;
        v52 = v38;
        v49 = v10;
        v50 = v11;
        objc_msgSend(a1, "accessibilityEnumerateContainerElementsWithOptions:usingBlock:", 2 * v12, v47);

        if ((v17 & 1) == 0)
          goto LABEL_44;
        goto LABEL_37;
      }
      if ((objc_msgSend(a1, "isAccessibilityElement") & 1) == 0)
      {
        objc_msgSend(a1, "_accessibilityViewChildrenWithOptions:", v10);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "push");
        v40[0] = MEMORY[0x1E0C809B0];
        v40[1] = 3221225472;
        v40[2] = __129__NSObject_UIAccessibilityElementTraversal___accessibilityLeafDescendantsWithCount_shouldStopAtRemoteElement_options_treeLogger___block_invoke_2;
        v40[3] = &unk_1E3DFE008;
        v45 = a3 != 0;
        v41 = v15;
        v44 = a3;
        v46 = v38;
        v42 = v10;
        v34 = v13;
        v35 = v11;
        v43 = v35;
        objc_msgSend(v33, "enumerateObjectsWithOptions:usingBlock:", v22, v40);
        v36 = v35;
        v13 = v34;
        objc_msgSend(v36, "pop");

        if ((v17 & 1) == 0)
          goto LABEL_44;
        goto LABEL_37;
      }
    }
    if (v17)
      goto LABEL_37;
LABEL_44:

    v14 = v39;
  }
  if (v13)
    objc_msgSend(v10, "setShouldOnlyIncludeElementsWithVisibleFrame:", 0);

  return v14;
}

- (uint64_t)_accessibilityIsLeafNodeWithOptions:()UIAccessibilityElementTraversal
{
  unsigned int (**v3)(_QWORD, _QWORD);
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  v5 = a3;
  objc_msgSend(v5, "leafNodePredicate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "leafNodePredicate");
    v3 = (unsigned int (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (((unsigned int (**)(_QWORD, void *))v3)[2](v3, a1))
    {

LABEL_10:
      v10 = 1;
      goto LABEL_11;
    }
  }
  objc_msgSend(v5, "leafNodePredicate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || !objc_msgSend(a1, "isAccessibilityElement"))
  {
    v9 = 0;
  }
  else
  {
    v8 = objc_msgSend(a1, "accessibilityTraits");
    v9 = (UIAccessibilityTraitSpacer & ~v8) != 0;
  }

  if (v6)
  {

    if (v9)
      goto LABEL_10;
  }
  else if (v9)
  {
    goto LABEL_10;
  }
  if (objc_msgSend(a1, "_accessibilityIsRemoteElement"))
    v10 = objc_msgSend(a1, "onClientSide");
  else
    v10 = 0;
LABEL_11:

  return v10;
}

- (BOOL)_accessibilityAppendOrderedChildLeafDescendantsToArray:()UIAccessibilityElementTraversal count:shouldStopAtRemoteElement:options:treeLogger:
{
  id v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  int v16;
  _BOOL8 v17;
  id v18;
  id v19;
  id v20;
  void (**v21)(void *, void *);
  int v22;
  void *v23;
  uint64_t v24;
  void *v25;
  _BOOL4 v26;
  void *v27;
  id v30;
  _QWORD aBlock[4];
  id v32;
  id v33;
  id v34;
  uint64_t *v35;
  uint64_t v36;
  unint64_t v37;
  char v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;

  v11 = a3;
  v12 = a6;
  v30 = a7;
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = 0;
  v13 = objc_msgSend(v12, "direction");
  if (!a4)
  {
    if (!(_DWORD)a5)
      goto LABEL_11;
LABEL_7:
    objc_msgSend(v11, "lastObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "_accessibilityIsRemoteElement");

    if (!v16)
      goto LABEL_11;
    goto LABEL_8;
  }
  v14 = objc_msgSend(v11, "count");
  if (v14 < a4 && (a5 & 1) != 0)
    goto LABEL_7;
  if (v14 < a4)
  {
LABEL_11:
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __151__NSObject_UIAccessibilityElementTraversal___accessibilityAppendOrderedChildLeafDescendantsToArray_count_shouldStopAtRemoteElement_options_treeLogger___block_invoke;
    aBlock[3] = &unk_1E3DFE058;
    v36 = 2 * (v13 != 1);
    v18 = v30;
    v32 = v18;
    v35 = &v39;
    v19 = v11;
    v33 = v19;
    v37 = a4;
    v38 = a5;
    v20 = v12;
    v34 = v20;
    v21 = (void (**)(void *, void *))_Block_copy(aBlock);
    if (objc_msgSend(a1, "_accessibilityShouldUseSupplementaryViews")
      && (objc_msgSend(v20, "shouldExcludeSupplementaryViews") & 1) == 0)
    {
      if (v13 == 1)
        objc_msgSend(a1, "_accessibilitySupplementaryHeaderViews");
      else
        objc_msgSend(a1, "_accessibilitySupplementaryFooterViews");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v21[2](v21, v23);

      v22 = 0;
    }
    else
    {
      v22 = 1;
    }
    if (!*((_BYTE *)v40 + 24))
    {
      objc_msgSend(v18, "push");
      v24 = a4 ? a4 - objc_msgSend(v19, "count") : 0;
      objc_msgSend(a1, "_accessibilityLeafDescendantsWithCount:shouldStopAtRemoteElement:options:treeLogger:", v24, a5, v20, v18);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addObjectsFromArray:", v25);

      objc_msgSend(v18, "pop");
      v26 = a4 && objc_msgSend(v19, "count") >= a4;
      *((_BYTE *)v40 + 24) = v26;
      if (((v22 | v26) & 1) == 0)
      {
        if (v13 == 1)
          objc_msgSend(a1, "_accessibilitySupplementaryFooterViews");
        else
          objc_msgSend(a1, "_accessibilitySupplementaryHeaderViews");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v21[2](v21, v27);

      }
    }

    v17 = *((_BYTE *)v40 + 24) != 0;
    goto LABEL_31;
  }
LABEL_8:
  if (objc_msgSend(v11, "count") > a4)
    _AXAssert();
  v17 = 1;
  *((_BYTE *)v40 + 24) = 1;
LABEL_31:
  _Block_object_dispose(&v39, 8);

  return v17;
}

- (void)_accessibilityEnumerateSiblingsFromOrderedChildrenContainer:()UIAccessibilityElementTraversal fromChildAtIndex:headerIndex:footerIndex:options:usingBlock:
{
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void (**v21)(void *, void *, uint64_t);
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  int v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  void (**v38)(void *, void *);
  _QWORD v39[4];
  id v40;
  uint64_t *v41;
  BOOL v42;
  _QWORD aBlock[4];
  id v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  char v49;
  uint8_t buf[4];
  id v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a7;
  v16 = a8;
  v17 = objc_msgSend(v15, "direction");
  v18 = objc_msgSend(v14, "accessibilityElementCount");
  if ((a4 & 0x8000000000000000) == 0 && v18 > a4)
  {
    v37 = v18;
    v46 = 0;
    v47 = &v46;
    v48 = 0x2020000000;
    v19 = MEMORY[0x1E0C809B0];
    v49 = 0;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __165__NSObject_UIAccessibilityElementTraversal___accessibilityEnumerateSiblingsFromOrderedChildrenContainer_fromChildAtIndex_headerIndex_footerIndex_options_usingBlock___block_invoke;
    aBlock[3] = &unk_1E3DFE080;
    v45 = &v46;
    v36 = v16;
    v20 = v16;
    v44 = v20;
    v38 = (void (**)(void *, void *))_Block_copy(aBlock);
    v39[0] = v19;
    v39[1] = 3221225472;
    v39[2] = __165__NSObject_UIAccessibilityElementTraversal___accessibilityEnumerateSiblingsFromOrderedChildrenContainer_fromChildAtIndex_headerIndex_footerIndex_options_usingBlock___block_invoke_2;
    v39[3] = &unk_1E3DFE0A8;
    v41 = &v46;
    v42 = v17 == 1;
    v40 = v20;
    v21 = (void (**)(void *, void *, uint64_t))_Block_copy(v39);
    if (v17 == 1)
    {
      v22 = a1;
      if (a5 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(a1, "_accessibilitySupplementaryHeaderViews");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v21[2](v21, v23, a5 + 1);

        v22 = a1;
        v38[2](v38, a1);
      }
      objc_msgSend(v22, "_accessibilitySupplementaryFooterViews");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (a6 == 0x7FFFFFFFFFFFFFFFLL)
        v25 = 0;
      else
        v25 = a6 + 1;
    }
    else
    {
      v26 = a1;
      if (a6 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(a1, "_accessibilitySupplementaryFooterViews");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v21[2](v21, v27, a6 - 1);

        v26 = a1;
        v38[2](v38, a1);
      }
      objc_msgSend(v26, "_accessibilitySupplementaryHeaderViews");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (a5 == 0x7FFFFFFFFFFFFFFFLL)
        v25 = 0;
      else
        v25 = a5 - 1;
    }
    v21[2](v21, v24, v25);

    if (*((_BYTE *)v47 + 24))
    {
LABEL_16:

      _Block_object_dispose(&v46, 8);
      v16 = v36;
      goto LABEL_17;
    }
    if (v17 == 1)
      v28 = 1;
    else
      v28 = -1;
    for (i = v28 + a4; ; i += v28)
    {
      if (v17 == 1)
      {
        if (i >= v37)
          goto LABEL_16;
      }
      else if (i < 0)
      {
        goto LABEL_16;
      }
      if (*((_BYTE *)v47 + 24))
        goto LABEL_16;
      objc_msgSend(v14, "accessibilityElementAtIndex:", i);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v30, "_accessibilityShouldBeProcessed:", v15))
        break;
      if (v30)
      {
        AXLogElementTraversal();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v51 = v14;
          v52 = 2112;
          v53 = (uint64_t)v30;
          _os_log_impl(&dword_19D0DD000, v32, OS_LOG_TYPE_INFO, "Ordered container %@ gave us an element %@ that was invalid for the current element traversal options, so we are skipping over it. It was probably invisible.", buf, 0x16u);
        }
      }
      else
      {
        AXLogElementTraversal();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412802;
          v51 = v14;
          v52 = 2048;
          v53 = i;
          v54 = 2048;
          v55 = v37;
          _os_log_error_impl(&dword_19D0DD000, v32, OS_LOG_TYPE_ERROR, "Ordered container %@ failed to provide an element at index %ld, but had count %ld.  This is probably an app accessibility bug.", buf, 0x20u);
        }
      }
LABEL_45:

    }
    v31 = objc_msgSend(v30, "_accessibilityIsLeafNodeWithOptions:", v15);
    if (v17 == 1)
    {
      objc_msgSend(v30, "_accessibilitySupplementaryHeaderViews");
      v32 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "_accessibilitySupplementaryFooterViews");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v31 & 1) != 0)
      {
        v34 = 0;
LABEL_36:
        v21[2](v21, v32, v34);
      }
    }
    else
    {
      objc_msgSend(v30, "_accessibilitySupplementaryFooterViews");
      v32 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "_accessibilitySupplementaryHeaderViews");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (v31)
      {
        v34 = -[NSObject count](v32, "count") - 1;
        goto LABEL_36;
      }
    }
    v38[2](v38, v30);
    if (v31)
    {
      if (v17 == 1)
        v35 = 0;
      else
        v35 = objc_msgSend(v33, "count") - 1;
      v21[2](v21, v33, v35);
    }

    goto LABEL_45;
  }
  _AXAssert();
LABEL_17:

}

- (id)_accessibilityParentFromOrderedChildrenContainer:()UIAccessibilityElementTraversal
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;

  v4 = a3;
  v5 = a1;
  objc_msgSend(v4, "_accessibilitySupplementaryHeaderViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_accessibilitySupplementaryFooterViews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v5;
  while (v8 != v4)
  {
    objc_msgSend(v8, "accessibilityContainer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v9)
      goto LABEL_9;
    if (objc_msgSend(v4, "indexOfAccessibilityElement:", v9) == 0x7FFFFFFFFFFFFFFFLL
      && (objc_msgSend(v6, "containsObject:", v9) & 1) == 0)
    {
      v8 = v9;
      if (!objc_msgSend(v7, "containsObject:", v9))
        continue;
    }
    v10 = v9;
    v9 = v10;
    goto LABEL_10;
  }
  v9 = v4;
LABEL_9:
  _AXLogWithFacility();
  v10 = 0;
LABEL_10:
  v11 = v10;

  return v11;
}

- (void)_handleSupplementaryViewIfNeededWithElementOrOrderedChildrenContainer:()UIAccessibilityElementTraversal childOfElementOrOrderedChildrenContainer:headerIndex:footerIndex:allowedElementsForTraversal:
{
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v12 = a7;
  objc_msgSend(*a3, "_accessibilitySupplementaryHeaderViews");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a3, "_accessibilitySupplementaryFooterViews");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v15 = objc_msgSend(v13, "indexOfObject:", a1);
    *a5 = v15;
    if (!v14)
      goto LABEL_7;
  }
  else
  {
    v15 = *a5;
    if (!v14)
    {
LABEL_7:
      if (v15 == 0x7FFFFFFFFFFFFFFFLL && *a6 == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_12;
      goto LABEL_9;
    }
  }
  if (v15 == 0x7FFFFFFFFFFFFFFFLL)
  {
    *a6 = objc_msgSend(v14, "indexOfObject:", a1);
    v15 = *a5;
    goto LABEL_7;
  }
LABEL_9:
  *a4 = objc_retainAutorelease(*a3);
  objc_msgSend(*a3, "_accessibilityOrderedChildrenContainerWithinElements:", v12);
  *a3 = (id)objc_claimAutoreleasedReturnValue();
  AXLogElementTraversal();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    -[NSObject(UIAccessibilityElementTraversal) _handleSupplementaryViewIfNeededWithElementOrOrderedChildrenContainer:childOfElementOrOrderedChildrenContainer:headerIndex:footerIndex:allowedElementsForTraversal:].cold.1((uint64_t)a3, v16, v17, v18, v19, v20, v21, v22);

LABEL_12:
}

- (uint64_t)_accessibilityEnumerateSiblingsWithParent:()UIAccessibilityElementTraversal options:usingBlock:
{
  id v8;
  void (**v9)(id, void *, uint8_t *);
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  unint64_t v15;
  id v16;
  NSObject *v17;
  void **v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  NSObject *v41;
  NSObject *v42;
  id v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *v55;
  void *v56;
  NSObject *v57;
  unint64_t v58;
  void *v59;
  uint64_t v60;
  void *v61;
  BOOL v62;
  _QWORD *v64;
  void (**v65)(id, void *, uint8_t *);
  void (**v66)(id, void *, uint8_t *);
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  unint64_t v70;
  id v71;
  id v72;
  void *v73;
  _QWORD v74[5];
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  id v79;
  id v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  id v85;
  id v86;
  uint64_t v87;
  uint64_t v88;
  uint8_t buf[4];
  void *v90;
  __int16 v91;
  id v92;
  __int16 v93;
  void *v94;
  _BYTE v95[128];
  void *v96;
  _BYTE v97[128];
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = objc_msgSend(v8, "direction");
  objc_msgSend(v8, "allowedElementsForTraversal");
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_accessibilityOrderedChildrenContainerWithinElements:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = a1;
  v87 = 0x7FFFFFFFFFFFFFFFLL;
  v88 = 0x7FFFFFFFFFFFFFFFLL;
  AXLogElementTraversal();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    -[NSObject(UIAccessibilityElementTraversal) _accessibilityEnumerateSiblingsWithParent:options:usingBlock:].cold.6();

  if (v12)
  {
    v85 = v13;
    v86 = v12;
    objc_msgSend(v13, "_handleSupplementaryViewIfNeededWithElementOrOrderedChildrenContainer:childOfElementOrOrderedChildrenContainer:headerIndex:footerIndex:allowedElementsForTraversal:", &v86, &v85, &v88, &v87, v11);
    v15 = (unint64_t)v86;

    v16 = v85;
  }
  else
  {
    v15 = 0;
    v16 = v13;
  }
  if (!(v11 | v15))
  {
    v68 = v10;
    v71 = v16;
    AXLogElementTraversal();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[NSObject(UIAccessibilityElementTraversal) _accessibilityEnumerateSiblingsWithParent:options:usingBlock:].cold.2(v17);

    v18 = (void **)MEMORY[0x1E0CEB258];
    v72 = (id)*MEMORY[0x1E0CEB258];
    v73 = v13;
    v19 = *v18;
    objc_msgSend(v13, "_accessibilityWindow");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "_accessibilityViewChildrenWithOptions:referenceWindow:", v8, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_44;
  }
  if (!v11 || v15)
  {
    v31 = objc_msgSend((id)v15, "indexOfAccessibilityElement:", v16);
    if (v31 == 0x7FFFFFFFFFFFFFFFLL)
    {
      AXLogElementTraversal();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        -[NSObject(UIAccessibilityElementTraversal) _accessibilityEnumerateSiblingsWithParent:options:usingBlock:].cold.4((void *)v15, v32);

      objc_msgSend(v13, "_accessibilityParentFromOrderedChildrenContainer:", v15);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (v33)
      {
        v68 = v10;
        v71 = v16;
        v34 = (id)v15;
        v79 = v13;
        v80 = v33;
        v35 = v33;
        v73 = v13;
        v36 = v13;
        objc_msgSend(v36, "_handleSupplementaryViewIfNeededWithElementOrOrderedChildrenContainer:childOfElementOrOrderedChildrenContainer:headerIndex:footerIndex:allowedElementsForTraversal:", &v80, &v79, &v88, &v87, v11);
        v37 = v80;
        v72 = v35;

        v20 = v79;
        v38 = objc_msgSend(v37, "indexOfAccessibilityElement:", v20);
        if (v38 == 0x7FFFFFFFFFFFFFFFLL || v88 == 0x7FFFFFFFFFFFFFFFLL && v87 == 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v72, "_accessibilityViewChildrenForEnumeratingSiblingsWithOptions:", v8);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v72, "_accessibilityEnumerateSiblingsFromOrderedChildrenContainer:fromChildAtIndex:headerIndex:footerIndex:options:usingBlock:", v34, v38);
          v43 = v37;

          v21 = 0;
          v72 = v43;
        }

        v15 = (unint64_t)v34;
        goto LABEL_44;
      }
      AXLogElementTraversal();
      v42 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
        -[NSObject(UIAccessibilityElementTraversal) _accessibilityEnumerateSiblingsWithParent:options:usingBlock:].cold.3();

      v40 = (id)v15;
    }
    else
    {
      v39 = v31;
      v40 = (id)v15;
      AXLogElementTraversal();
      v41 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
        -[NSObject(UIAccessibilityElementTraversal) _accessibilityEnumerateSiblingsWithParent:options:usingBlock:].cold.5();

      objc_msgSend(v16, "_accessibilityEnumerateSiblingsFromOrderedChildrenContainer:fromChildAtIndex:headerIndex:footerIndex:options:usingBlock:", v40, v39, v88, v87, v8, v9);
    }
    v21 = 0;
LABEL_61:
    v54 = 1;
    goto LABEL_78;
  }
  v68 = v10;
  v73 = v13;
  v71 = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = 0u;
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v67 = v11;
  v20 = (id)v11;
  v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v81, v97, 16);
  if (v22)
  {
    v23 = v22;
    v64 = a3;
    v65 = v9;
    v24 = *(_QWORD *)v82;
    v25 = (void *)MEMORY[0x1E0C9AA60];
    while (1)
    {
      for (i = 0; i != v23; ++i)
      {
        v27 = v21;
        if (*(_QWORD *)v82 != v24)
          objc_enumerationMutation(v20);
        v28 = *(void **)(*((_QWORD *)&v81 + 1) + 8 * i);
        if (objc_msgSend(v28, "isAccessibilityElement"))
        {
          v29 = v25;
          if (!objc_msgSend(v28, "_accessibilityIsLeafNodeWithOptions:", v8))
            goto LABEL_22;
          v96 = v28;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v96, 1);
          v30 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v28, "_accessibilityViewChildrenForEnumeratingSiblingsWithOptions:", v8);
          v30 = objc_claimAutoreleasedReturnValue();
        }
        v29 = (void *)v30;
LABEL_22:
        objc_msgSend(v27, "arrayByAddingObjectsFromArray:", v29);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v23 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v81, v97, 16);
      if (!v23)
      {
        v72 = 0;
        a3 = v64;
        v9 = v65;
        goto LABEL_37;
      }
    }
  }
  v72 = 0;
LABEL_37:
  v11 = v67;
  v15 = 0;
LABEL_44:

  if (!v21)
  {
    v54 = 1;
LABEL_77:
    v16 = v71;
    v40 = v72;
    goto LABEL_78;
  }
  v44 = objc_msgSend(v21, "count");
  if (!v44)
  {
    AXLogElementTraversal();
    v55 = objc_claimAutoreleasedReturnValue();
    v16 = v71;
    v40 = v72;
    if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
      -[NSObject(UIAccessibilityElementTraversal) _accessibilityEnumerateSiblingsWithParent:options:usingBlock:].cold.1();

    goto LABEL_61;
  }
  v45 = v44;
  v46 = objc_msgSend(v21, "indexOfObject:", v73);
  if (v46 != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_66:
    v70 = v15;
    buf[0] = 0;
    if (v68 == 1)
    {
      if (v46 + 1 < v45)
      {
        v58 = v46 + 2;
        do
        {
          objc_msgSend(v21, "objectAtIndexedSubscript:", v58 - 1);
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          v9[2](v9, v59, buf);

          if (v58 >= v45)
            break;
          ++v58;
        }
        while (!buf[0]);
      }
    }
    else
    {
      v60 = v46 - 1;
      if (v46 - 1 >= 0)
      {
        do
        {
          objc_msgSend(v21, "objectAtIndexedSubscript:", v60);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v9[2](v9, v61, buf);

          v62 = v60-- != 0;
        }
        while (v62 && !buf[0]);
      }
    }
    v54 = 1;
    v15 = v70;
    goto LABEL_77;
  }
  if (objc_msgSend(v8, "includeAncestorsOfSelfInSiblingMatch"))
  {
    v69 = v15;
    v66 = v9;
    v77 = 0u;
    v78 = 0u;
    v75 = 0u;
    v76 = 0u;
    v47 = v21;
    v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v75, v95, 16);
    if (v48)
    {
      v49 = v48;
      v50 = *(_QWORD *)v76;
LABEL_50:
      v51 = 0;
      while (1)
      {
        if (*(_QWORD *)v76 != v50)
          objc_enumerationMutation(v47);
        v52 = *(_QWORD *)(*((_QWORD *)&v75 + 1) + 8 * v51);
        v74[0] = MEMORY[0x1E0C809B0];
        v74[1] = 3221225472;
        v74[2] = __106__NSObject_UIAccessibilityElementTraversal___accessibilityEnumerateSiblingsWithParent_options_usingBlock___block_invoke;
        v74[3] = &unk_1E3DFDE98;
        v74[4] = v52;
        objc_msgSend(v73, "_accessibilityFindAncestor:startWithSelf:", v74, 0);
        v53 = objc_claimAutoreleasedReturnValue();
        if (v53)
          break;
        if (v49 == ++v51)
        {
          v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v75, v95, 16);
          if (v49)
            goto LABEL_50;
          goto LABEL_56;
        }
      }
      v56 = (void *)v53;
      v46 = objc_msgSend(v47, "indexOfObject:", v53);

      v9 = v66;
      v15 = v69;
      if (v46 != 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_66;
    }
    else
    {
LABEL_56:

      v9 = v66;
    }
  }
  AXLogElementTraversal();
  v57 = objc_claimAutoreleasedReturnValue();
  v40 = v72;
  if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543874;
    v90 = v73;
    v91 = 2114;
    v92 = v72;
    v93 = 2114;
    v94 = v21;
    _os_log_debug_impl(&dword_19D0DD000, v57, OS_LOG_TYPE_DEBUG, "Could not find %{public}@ in a list of sorted view [parent: %{public}@] siblings %{public}@.  If this happened right around a screen change, it might be okay, but otherwise this is probably a bug.", buf, 0x20u);
  }

  v54 = 0;
  v16 = v71;
LABEL_78:
  if (a3)
    *a3 = objc_retainAutorelease(v40);

  return v54;
}

- (uint64_t)_accessibilityViewChildrenWithOptions:()UIAccessibilityElementTraversal
{
  return 0;
}

- (id)_accessibilityViewChildrenForEnumeratingSiblingsWithOptions:()UIAccessibilityElementTraversal
{
  id v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "alternateViewChildrenHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "alternateViewChildrenHandler");
    v6 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, id))v6)[2](v6, a1, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "_accessibilityViewChildrenWithOptions:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (uint64_t)_accessibilityCompareGeometryForViewOrDictionary:()UIAccessibilityElementTraversal
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v4 = a3;
  v5 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    do
    {
      objc_msgSend(v5, "objectForKey:", CFSTR("GroupElements"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "firstObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      v5 = v7;
    }
    while ((objc_opt_isKindOfClass() & 1) != 0);
  }
  else
  {
    v7 = v5;
  }
  v8 = v4;
  objc_opt_class();
  v9 = v8;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = v8;
    do
    {
      objc_msgSend(v10, "objectForKey:", CFSTR("GroupElements"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      v10 = v9;
    }
    while ((objc_opt_isKindOfClass() & 1) != 0);
  }
  if (!v7 || v9)
  {
    if (v7 || !v9)
    {
      v12 = 0;
      if (v7 && v9)
        v12 = objc_msgSend(v7, "accessibilityCompareGeometry:", v9);
    }
    else
    {
      v12 = 1;
    }
  }
  else
  {
    v12 = -1;
  }

  return v12;
}

- (BOOL)_accessibilityHasVisibleFrame
{
  void *v2;
  void *v3;
  char isKindOfClass;
  double v6;
  double v7;

  if (AXDeviceIsPad())
  {
    if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "safeBoolForKey:", CFSTR("_isClassic")))
    {
      objc_msgSend(a1, "_accessibilityParentView");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "window");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      NSClassFromString(CFSTR("UIClassicWindow"));
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
        return 1;
    }
  }
  objc_msgSend(a1, "_accessibilityVisibleFrame");
  return v7 > 2.0 && v6 > 2.0;
}

- (uint64_t)_accessibilityShouldBeProcessed:()UIAccessibilityElementTraversal
{
  return 1;
}

- (uint64_t)_accessibilityShouldUseSupplementaryViews
{
  return 0;
}

- (void)_addAccessibilityElementsAndOrderedContainersWithOptions:()UIAccessibilityElementTraversal toCollection:
{
  id v6;
  id v7;
  int v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(a1, "_accessibilityShouldBeProcessed:", v6))
  {
    v8 = objc_msgSend(a1, "_accessibilityShouldBeAddedToViewChildrenWithOptions:", v6);
    objc_msgSend(a1, "_accessibilityAdditionalElements");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "ax_filteredArrayUsingBlock:", &__block_literal_global_355);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "axSafelyAddObjectsFromArray:", v10);

    if (v8)
    {
      if (objc_msgSend(a1, "_accessibilityShouldUseSupplementaryViews")
        && (objc_msgSend(v6, "shouldExcludeSupplementaryViews") & 1) == 0)
      {
        v53 = 0u;
        v54 = 0u;
        v51 = 0u;
        v52 = 0u;
        objc_msgSend(a1, "_accessibilitySupplementaryHeaderViews");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
        if (v30)
        {
          v31 = v30;
          v32 = *(_QWORD *)v52;
          do
          {
            v33 = 0;
            do
            {
              if (*(_QWORD *)v52 != v32)
                objc_enumerationMutation(v29);
              v34 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * v33);
              if (v34 == a1)
                _AXAssert();
              else
                objc_msgSend(v34, "_addAccessibilityElementsAndOrderedContainersWithOptions:toCollection:", v6, v7);
              ++v33;
            }
            while (v31 != v33);
            v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v51, v57, 16);
          }
          while (v31);
        }

        objc_msgSend(v7, "addObject:", a1);
        v49 = 0u;
        v50 = 0u;
        v47 = 0u;
        v48 = 0u;
        objc_msgSend(a1, "_accessibilitySupplementaryFooterViews");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
        if (v36)
        {
          v37 = v36;
          v38 = *(_QWORD *)v48;
          do
          {
            v39 = 0;
            do
            {
              if (*(_QWORD *)v48 != v38)
                objc_enumerationMutation(v35);
              v40 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * v39);
              if (v40 == a1)
                _AXAssert();
              objc_msgSend(v40, "_addAccessibilityElementsAndOrderedContainersWithOptions:toCollection:", v6, v7);
              ++v39;
            }
            while (v37 != v39);
            v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
          }
          while (v37);
        }

      }
      else
      {
        objc_msgSend(v7, "addObject:", a1);
      }
LABEL_53:
      objc_msgSend(a1, "_accessibilityAdditionalElements");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "ax_filteredArrayUsingBlock:", &__block_literal_global_363);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "axSafelyAddObjectsFromArray:", v42);

      goto LABEL_54;
    }
    v11 = v7;
    if (objc_msgSend(v6, "shouldReturnScannerGroups")
      && objc_msgSend(a1, "_accessibilityIsScannerGroup"))
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = 1;
    }
    else
    {
      v13 = 0;
      v12 = v11;
    }
    if (objc_msgSend(v6, "shouldReturnScannerGroups")
      && (objc_msgSend(a1, "_accessibilityScannerGroupElements"), (v14 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v15 = (void *)v14;
      objc_msgSend(v12, "addObjectsFromArray:", v14);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_22:
        if (v13)
        {
          if ((objc_msgSend(a1, "_accessibilityScannerGroupTraits") & 0x20) == 0)
            objc_msgSend(v12, "sortUsingSelector:", sel__accessibilityCompareGeometryForViewOrDictionary_);
          v20 = a1;
          v21 = (void *)MEMORY[0x1E0C99E08];
          v22 = v12;
          objc_msgSend(v21, "dictionary");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setObject:forKeyedSubscript:", v22, CFSTR("GroupElements"));

          v24 = objc_msgSend(v20, "_accessibilityScannerGroupTraits");
          if (v24)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setObject:forKeyedSubscript:", v25, CFSTR("GroupTraits"));

          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", objc_msgSend(v20, "_accessibilityScanningBehaviorTraits") | 0x10);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setObject:forKeyedSubscript:", v26, CFSTR("GroupScanBehaviorTraits"));

          objc_msgSend(v20, "_accessibilityAXAttributedLabel");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (v27)
            objc_msgSend(v23, "setObject:forKeyedSubscript:", v27, CFSTR("GroupLabel"));
          objc_msgSend(v20, "_accessibilityGroupIdentifier");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (v28)
            objc_msgSend(v23, "setObject:forKeyedSubscript:", v28, CFSTR("GroupIdentifier"));

          objc_msgSend(v11, "addObject:", v23);
        }

        goto LABEL_53;
      }
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      objc_msgSend(a1, "_accessibilitySubviewsForGettingElementsWithOptions:", v6, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v44;
        do
        {
          v19 = 0;
          do
          {
            if (*(_QWORD *)v44 != v18)
              objc_enumerationMutation(v15);
            objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * v19++), "_addAccessibilityElementsAndOrderedContainersWithOptions:toCollection:", v6, v12);
          }
          while (v17 != v19);
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
        }
        while (v17);
      }
    }

    goto LABEL_22;
  }
LABEL_54:

}

- (void)_accessibilityElementsInDirectionWithCount:()UIAccessibilityElementTraversal options:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 134218242;
  *(_QWORD *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = a1;
  OUTLINED_FUNCTION_1_0(&dword_19D0DD000, a2, a3, "Getting %lu accessibility elements, with options %{public}@.", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_2();
}

- (void)_handleSupplementaryViewIfNeededWithElementOrOrderedChildrenContainer:()UIAccessibilityElementTraversal childOfElementOrOrderedChildrenContainer:headerIndex:footerIndex:allowedElementsForTraversal:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_19D0DD000, a2, a3, "The original elementOrOrderedChildrenContainer was actually a sibling since self was one of its supplementary views.  Correcting for this yields %{public}@.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_accessibilityEnumerateSiblingsWithParent:()UIAccessibilityElementTraversal options:usingBlock:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_19D0DD000, v0, v1, "We should have had some elements or containers within the parent (%{public}@) of %{public}@.  If this happened right around a screen change, it might be okay, but otherwise this is probably a bug.");
  OUTLINED_FUNCTION_2();
}

- (void)_accessibilityEnumerateSiblingsWithParent:()UIAccessibilityElementTraversal options:usingBlock:.cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_19D0DD000, log, OS_LOG_TYPE_DEBUG, "We got to the top without finding a UIAccessibilityContainer node.  Our parent is the root node, the application.", v1, 2u);
}

- (void)_accessibilityEnumerateSiblingsWithParent:()UIAccessibilityElementTraversal options:usingBlock:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_19D0DD000, v0, v1, "This element has no parent that descends from the ordered child container. We can't continue to traverse this ordered child container because we don't know where to start traversing from. Setting the parent to be the ordered child container so that we at least continue traversing outside this ordered child container: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_accessibilityEnumerateSiblingsWithParent:()UIAccessibilityElementTraversal options:usingBlock:.cold.4(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_accessibilityElements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_19D0DD000, a2, OS_LOG_TYPE_DEBUG, "The node was not a direct child of the ancestor UIAccessibilityContainer (container elements %{public}@).  Time to go up the chain and find that child...", v4, 0xCu);

}

- (void)_accessibilityEnumerateSiblingsWithParent:()UIAccessibilityElementTraversal options:usingBlock:.cold.5()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_19D0DD000, v0, v1, "We were able to find the child %{public}@ at index %ld.");
  OUTLINED_FUNCTION_2();
}

- (void)_accessibilityEnumerateSiblingsWithParent:()UIAccessibilityElementTraversal options:usingBlock:.cold.6()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_19D0DD000, v0, v1, "Self is %{public}@.  Ordered children container is %{public}@.");
  OUTLINED_FUNCTION_2();
}

@end
