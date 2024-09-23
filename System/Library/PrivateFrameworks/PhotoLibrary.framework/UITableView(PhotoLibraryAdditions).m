@implementation UITableView(PhotoLibraryAdditions)

- (uint64_t)pl_scrollToVisibleRowAtIndexPath:()PhotoLibraryAdditions animated:
{
  uint64_t v8;
  unint64_t v9;
  double v10;
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
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t result;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  v8 = objc_msgSend(a3, "section");
  v9 = objc_msgSend(a3, "row");
  if (v9 >= objc_msgSend(a1, "numberOfRowsInSection:", v8))
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UITableViewAdditions.m"), 28, CFSTR("indexPath is out of range %@"), a3);
  objc_msgSend(a1, "rectForRowAtIndexPath:", a3);
  v37 = v11;
  v38 = v10;
  v35 = v13;
  v36 = v12;
  objc_msgSend(a1, "contentInset");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  objc_msgSend(a1, "bounds");
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  if (objc_msgSend(a3, "isEqual:", objc_msgSend(a1, "pl_indexPathForLastRow")))
    return objc_msgSend(a1, "pl_scrollToBottom:", a4);
  v31 = v17 + v23;
  v32 = v15 + v25;
  v33 = v27 - (v17 + v21);
  v34 = v29 - (v15 + v19);
  v39.origin.x = v31;
  v39.origin.y = v32;
  v39.size.width = v33;
  v39.size.height = v34;
  v41.origin.x = v38;
  v41.origin.y = v37;
  v41.size.width = v36;
  v41.size.height = v35;
  result = CGRectContainsRect(v39, v41);
  if ((result & 1) == 0)
  {
    v40.origin.x = v31;
    v40.origin.y = v32;
    v40.size.width = v33;
    v40.size.height = v34;
    v42.origin.x = v38;
    v42.origin.y = v37;
    v42.size.width = v36;
    v42.size.height = v35;
    if (CGRectIntersectsRect(v40, v42))
    {
      return objc_msgSend(a1, "scrollRectToVisible:animated:", a4, v38, v37, v36, v35);
    }
    else
    {
      objc_msgSend(a1, "scrollToRowAtIndexPath:atScrollPosition:animated:", a3, 2, a4);
      return objc_msgSend(a1, "pl_resetContentOffsetFromContentInsets");
    }
  }
  return result;
}

- (uint64_t)pl_scrollToTop:()PhotoLibraryAdditions
{
  return objc_msgSend(a1, "scrollRectToVisible:animated:", 0.0, 0.0, 1.0, 1.0);
}

- (uint64_t)pl_scrollToBottom:()PhotoLibraryAdditions
{
  void *v5;
  uint64_t result;

  v5 = (void *)objc_msgSend(a1, "tableFooterView");
  if (v5)
  {
    objc_msgSend(v5, "frame");
    return objc_msgSend(a1, "scrollRectToVisible:animated:", a3);
  }
  else
  {
    result = objc_msgSend(a1, "pl_indexPathForLastRow");
    if (result)
      return objc_msgSend(a1, "scrollToRowAtIndexPath:atScrollPosition:animated:", result, 3, a3);
  }
  return result;
}

- (uint64_t)pl_lastRowIsVisible
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  v2 = objc_msgSend(a1, "pl_indexPathForLastRow");
  if (v2 && (v3 = (void *)v2, (v4 = objc_msgSend((id)objc_msgSend(a1, "indexPathsForVisibleRows"), "lastObject")) != 0))
    return objc_msgSend(v3, "isEqual:", v4);
  else
    return 0;
}

- (uint64_t)pl_indexPathForLastRow
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = objc_msgSend(a1, "numberOfSections");
  if (v2 && (v3 = v2 - 1, (v4 = objc_msgSend(a1, "numberOfRowsInSection:", v2 - 1)) != 0))
    return objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v4 - 1, v3);
  else
    return 0;
}

- (uint64_t)pl_resetContentOffsetFromContentInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  objc_msgSend(a1, "contentInset");
  v3 = v2;
  v5 = v4;
  objc_msgSend(a1, "contentOffset");
  v8 = v7 - v5;
  if (v8 < -v5)
    v8 = -v5;
  v9 = v6 - v3;
  if (v9 < -v3)
    v9 = -v3;
  return objc_msgSend(a1, "setContentOffset:", v8, v9);
}

@end
