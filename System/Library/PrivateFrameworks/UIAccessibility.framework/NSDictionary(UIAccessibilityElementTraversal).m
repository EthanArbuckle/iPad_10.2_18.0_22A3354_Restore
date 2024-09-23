@implementation NSDictionary(UIAccessibilityElementTraversal)

- (id)_accessibilityLeafDescendantsWithCount:()UIAccessibilityElementTraversal shouldStopAtRemoteElement:options:treeLogger:
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  char v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v9 = a5;
  v10 = a6;
  if ((objc_msgSend(v9, "shouldReturnScannerGroups") & 1) == 0)
  {
    v22 = a1;
    _AXAssert();
  }
  if (objc_msgSend(v9, "shouldReturnScannerGroups", v22))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("GroupElements"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 2 * (objc_msgSend(v9, "direction") == 2);
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __133__NSDictionary_UIAccessibilityElementTraversal___accessibilityLeafDescendantsWithCount_shouldStopAtRemoteElement_options_treeLogger___block_invoke;
    v23[3] = &unk_1E3DFE208;
    v14 = v11;
    v24 = v14;
    v27 = a4;
    v25 = v9;
    v26 = v10;
    objc_msgSend(v12, "enumerateObjectsWithOptions:usingBlock:", v13, v23);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, CFSTR("GroupElements"));
    objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("GroupTraits"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16)
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, CFSTR("GroupTraits"));
    objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("GroupScanBehaviorTraits"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, CFSTR("GroupScanBehaviorTraits"));

    objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("GroupLabel"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v18, CFSTR("GroupLabel"));
    objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("GroupIdentifier"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v19, CFSTR("GroupIdentifier"));
    v28[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
    v20 = 0;
  }

  return v20;
}

@end
