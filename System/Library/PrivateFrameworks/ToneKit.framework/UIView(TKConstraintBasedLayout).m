@implementation UIView(TKConstraintBasedLayout)

- (id)tk_constrainLayoutAttribute:()TKConstraintBasedLayout asEqualToConstant:
{
  return (id)objc_msgSend(a1, "tk_addedConstraintForLayoutAttribute:asEqualToConstant:");
}

- (id)tk_constrainLayoutAttribute:()TKConstraintBasedLayout asEqualToValueOfItem:
{
  return (id)objc_msgSend(a1, "tk_addedConstraintForLayoutAttribute:asEqualToValueOfItem:");
}

- (id)tk_constrainLayoutAttribute:()TKConstraintBasedLayout asEqualToValueOfItem:withOffset:
{
  return (id)objc_msgSend(a1, "tk_addedConstraintForLayoutAttribute:asEqualToValueOfItem:withOffset:");
}

- (id)tk_constrainLayoutAttribute:()TKConstraintBasedLayout asEqualToLayoutAttribute:ofItem:
{
  return (id)objc_msgSend(a1, "tk_addedConstraintForLayoutAttribute:asEqualToLayoutAttribute:ofItem:");
}

- (id)tk_constrainLayoutAttribute:()TKConstraintBasedLayout asEqualToLayoutAttribute:ofItem:withOffset:
{
  return (id)objc_msgSend(a1, "tk_addedConstraintForLayoutAttribute:asEqualToLayoutAttribute:ofItem:withOffset:");
}

- (id)tk_constrainLayoutAttribute:()TKConstraintBasedLayout asEqualToValueOfItem:withMultiplier:
{
  return (id)objc_msgSend(a1, "tk_addedConstraintForLayoutAttribute:asEqualToValueOfItem:withMultiplier:");
}

- (id)tk_constrainLayoutAttribute:()TKConstraintBasedLayout asEqualToLayoutAttribute:ofItem:withMultiplier:
{
  return (id)objc_msgSend(a1, "tk_addedConstraintForLayoutAttribute:asEqualToLayoutAttribute:ofItem:withMultiplier:");
}

- (id)tk_constrainLayoutAttribute:()TKConstraintBasedLayout ofItem:asEqualToValueOfItem:
{
  return (id)objc_msgSend(a1, "tk_addedConstraintForItem:layoutAttribute:relatedBy:toItem:attribute:multiplier:constant:", a4, a3, 0, a5, 1.0, 0.0);
}

- (uint64_t)tk_addedConstraintForLayoutAttribute:()TKConstraintBasedLayout asEqualToConstant:
{
  return objc_msgSend(a1, "tk_addedConstraintForLayoutAttribute:relatedBy:toItem:attribute:multiplier:constant:", a3, 0, 0, 0, 1.0, a4);
}

- (uint64_t)tk_addedConstraintForLayoutAttribute:()TKConstraintBasedLayout asEqualToValueOfItem:
{
  return objc_msgSend(a1, "tk_addedConstraintForLayoutAttribute:asEqualToValueOfItem:withOffset:", 0.0);
}

- (uint64_t)tk_addedConstraintForLayoutAttribute:()TKConstraintBasedLayout asEqualToValueOfItem:withOffset:
{
  return objc_msgSend(a1, "tk_addedConstraintForLayoutAttribute:asEqualToLayoutAttribute:ofItem:withOffset:", a3, a3, a4);
}

- (uint64_t)tk_addedConstraintForLayoutAttribute:()TKConstraintBasedLayout asEqualToLayoutAttribute:ofItem:
{
  return objc_msgSend(a1, "tk_addedConstraintForLayoutAttribute:asEqualToLayoutAttribute:ofItem:withOffset:", 0.0);
}

- (uint64_t)tk_addedConstraintForLayoutAttribute:()TKConstraintBasedLayout asEqualToLayoutAttribute:ofItem:withOffset:
{
  return objc_msgSend(a1, "tk_addedConstraintForLayoutAttribute:relatedBy:toItem:attribute:multiplier:constant:", a3, 0, a5, a4, 1.0, a6);
}

- (uint64_t)tk_addedConstraintForLayoutAttribute:()TKConstraintBasedLayout asEqualToValueOfItem:withMultiplier:
{
  return objc_msgSend(a1, "tk_addedConstraintForLayoutAttribute:asEqualToLayoutAttribute:ofItem:withMultiplier:", a3, a3, a4);
}

- (uint64_t)tk_addedConstraintForLayoutAttribute:()TKConstraintBasedLayout asEqualToLayoutAttribute:ofItem:withMultiplier:
{
  return objc_msgSend(a1, "tk_addedConstraintForLayoutAttribute:relatedBy:toItem:attribute:multiplier:constant:", a3, 0, a5, a4, a6, 0.0);
}

- (id)tk_constrainLayoutAttribute:()TKConstraintBasedLayout asLessThanOrEqualToValueOfItem:withOffset:
{
  return (id)objc_msgSend(a1, "tk_addedConstraintForLayoutAttribute:asLessThanOrEqualToValueOfItem:withOffset:");
}

- (uint64_t)tk_addedConstraintForLayoutAttribute:()TKConstraintBasedLayout asLessThanOrEqualToValueOfItem:withOffset:
{
  return objc_msgSend(a1, "tk_addedConstraintForLayoutAttribute:relatedBy:toItem:attribute:multiplier:constant:", a3, -1, a4, a3, 1.0, a5);
}

- (id)tk_constrainLayoutAttribute:()TKConstraintBasedLayout asGreaterThanOrEqualToValueOfItem:withOffset:
{
  return (id)objc_msgSend(a1, "tk_addedConstraintForLayoutAttribute:asGreaterThanOrEqualToValueOfItem:withOffset:");
}

- (uint64_t)tk_addedConstraintForLayoutAttribute:()TKConstraintBasedLayout asGreaterThanOrEqualToValueOfItem:withOffset:
{
  return objc_msgSend(a1, "tk_addedConstraintForLayoutAttribute:relatedBy:toItem:attribute:multiplier:constant:", a3, 1, a4, a3, 1.0, a5);
}

- (id)tk_constrainLayoutAttribute:()TKConstraintBasedLayout relatedBy:toItem:attribute:multiplier:constant:
{
  return (id)objc_msgSend(a1, "tk_addedConstraintForLayoutAttribute:relatedBy:toItem:attribute:multiplier:constant:");
}

- (uint64_t)tk_addedConstraintForLayoutAttribute:()TKConstraintBasedLayout relatedBy:toItem:attribute:multiplier:constant:
{
  return objc_msgSend(a1, "tk_addedConstraintForItem:layoutAttribute:relatedBy:toItem:attribute:multiplier:constant:", a1, a3, a4, a5, a6);
}

- (id)tk_addedConstraintForItem:()TKConstraintBasedLayout layoutAttribute:relatedBy:toItem:attribute:multiplier:constant:
{
  id v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;

  v16 = a5;
  v17 = a8;
  objc_msgSend(MEMORY[0x24BDD1628], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v16, a6, a7, v17, a9, a2, a3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    objc_msgSend((id)objc_opt_class(), "_tk_viewForItem:", v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_tk_viewForItem:", v17);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)v20;
    if (v19 && v20)
    {
      objc_msgSend(v19, "tk_firstCommonAncestorWithView:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "addConstraint:", v18);

    }
    else
    {
      objc_msgSend(a1, "addConstraint:", v18);
    }

  }
  return v18;
}

- (uint64_t)_tk_depth
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v1 = a1;
  if (!v1)
    return -1;
  v2 = v1;
  v3 = -1;
  do
  {
    objc_msgSend(v2, "superview");
    v4 = objc_claimAutoreleasedReturnValue();

    ++v3;
    v2 = (void *)v4;
  }
  while (v4);
  return v3;
}

- (id)tk_firstCommonAncestorWithView:()TKConstraintBasedLayout
{
  id v4;
  id v5;
  id v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v4 = a3;
  v5 = a1;
  v6 = v4;
  v7 = objc_msgSend(v5, "_tk_depth");
  v8 = objc_msgSend(v6, "_tk_depth");
  if (v8 < v7)
    v9 = v8;
  else
    v9 = v7;
  if (v8 < v7)
    v10 = v7;
  else
    v10 = v8;
  if (v8 < v7)
    v11 = v5;
  else
    v11 = v6;
  if (v8 < v7)
    v12 = v6;
  else
    v12 = v5;
  if (v9 >= v10)
  {
    v13 = v11;
  }
  else
  {
    do
    {
      objc_msgSend(v11, "superview");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      --v10;
      v11 = v13;
    }
    while (v9 < v10);
  }
  v14 = 0;
  if (v12 && v13)
  {
    while (v12 != v13)
    {
      objc_msgSend(v12, "superview");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "superview");
      v16 = (id)objc_claimAutoreleasedReturnValue();

      v14 = 0;
      if (v15)
      {
        v12 = v15;
        v13 = v16;
        if (v16)
          continue;
      }
      goto LABEL_25;
    }
    v16 = v12;
    v15 = v16;
    v14 = v16;
  }
  else
  {
    v16 = v13;
    v15 = v12;
  }
LABEL_25:

  return v14;
}

+ (id)_tk_viewForItem:()TKConstraintBasedLayout
{
  id v3;
  id v4;
  void *v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v5 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v3, "owningView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
LABEL_7:

  return v5;
}

- (id)_tk_recursiveAutolayoutTraceAtLevel:()TKConstraintBasedLayout anyDescendantHasAmbiguousLayout:
{
  void *v7;
  uint64_t v8;
  int v9;
  objc_class *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("\n"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 >= 1)
  {
    v8 = a3;
    do
    {
      objc_msgSend(v7, "appendString:", CFSTR("|   "));
      --v8;
    }
    while (v8);
  }
  v9 = objc_msgSend(a1, "hasAmbiguousLayout");
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  v13 = &stru_24D3804C8;
  if (v9)
    v13 = CFSTR(" - AMBIGUOUS LAYOUT");
  objc_msgSend(v7, "appendFormat:", CFSTR("<%@: %p>%@"), v11, a1, v13);

  if (a4 && (v9 & 1) != 0)
    *a4 = 1;
  objc_msgSend(a1, "subviews");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v23;
    v18 = a3 + 1;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v23 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "_tk_recursiveAutolayoutTraceAtLevel:anyDescendantHasAmbiguousLayout:", v18, a4);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "appendString:", v20);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v16);
  }

  return v7;
}

- (id)_tk_autolayoutTrace
{
  void *v1;
  void *v2;
  const __CFString *v3;
  void *v4;
  char v6;

  v6 = 0;
  objc_msgSend(a1, "_tk_recursiveAutolayoutTraceAtLevel:anyDescendantHasAmbiguousLayout:", 0, &v6);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v6)
    v3 = CFSTR("\nAMBIGUOUS LAYOUT IN SUBTREE");
  else
    v3 = CFSTR("\nNo views in subtree have an ambiguous layout. Good job!");
  objc_msgSend(v1, "stringByAppendingString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
