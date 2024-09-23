@implementation UITableViewRowData

uint64_t __56__UITableViewRowData__sectionRowForGlobalRow_inSection___block_invoke(uint64_t *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  BOOL v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL4 v13;

  v4 = a1[4];
  v5 = ((uint64_t)a3 - *(_QWORD *)(v4 + 88)) >> 3;
  v6 = *a3;
  if (!*(_BYTE *)(*a3 + 8))
    -[UISectionRowData refreshWithSection:tableView:tableViewRowData:](v6, v5, *(void **)(v4 + 8), v4);
  if (!*(_BYTE *)(v6 + 9))
    -[UITableViewRowData _ensureSectionOffsetIsValidForSection:](a1[4], v5);
  v7 = a1[5];
  v8 = a1[6];
  v9 = v7 == v5;
  v10 = v7 < v5;
  v11 = *(_QWORD *)(v6 + 24);
  v12 = *(_QWORD *)(v6 + 32);
  if (v10)
    ++v11;
  if (v9)
    ++v12;
  v13 = v8 >= v12 + v11;
  if (v8 < v11)
    return 0xFFFFFFFFLL;
  else
    return v13;
}

- (double)heightForTableHeaderView
{
  uint64_t v2;

  if (!a1)
    return 0.0;
  if ((*(_BYTE *)(a1 + 128) & 1) == 0
    && ((dyld_program_sdk_at_least() & 1) != 0
     || objc_msgSend(*(id *)(a1 + 8), "_shouldUseNewHeaderFooterBehavior")))
  {
    objc_msgSend(*(id *)(a1 + 8), "_heightForTableHeader");
    *(_QWORD *)(a1 + 96) = v2;
    *(_BYTE *)(a1 + 128) |= 1u;
  }
  return *(double *)(a1 + 96);
}

- (id)indexPathForRowAtGlobalRow:(_QWORD *)a1
{
  void *v3;
  uint64_t v4;
  uint64_t v7;

  v3 = 0;
  if (a1 && a2 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 0x7FFFFFFFFFFFFFFFLL;
    v4 = -[UITableViewRowData _sectionRowForGlobalRow:inSection:](a1, a2, &v7);
    if (v7 == 0x7FFFFFFFFFFFFFFFLL || v4 == 0x7FFFFFFFFFFFFFFFLL)
      return 0;
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v4);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (uint64_t)globalRowForRowAtIndexPath:(uint64_t)result
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  unint64_t v14;
  NSObject *v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v3 = result;
    v4 = objc_msgSend(a2, "row");
    v5 = objc_msgSend(a2, "section");
    if (v5 >= *(_QWORD *)(v3 + 64))
      return 0x7FFFFFFFFFFFFFFFLL;
    v6 = v5;
    if (v4 >= -[UITableViewRowData numberOfRowsInSection:](v3, v5))
    {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      if (v6)
      {
        v7 = 0;
        v8 = 0;
        do
        {
          if (*(_QWORD *)(v3 + 64) <= v7)
          {
            if (dyld_program_sdk_at_least())
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSInteger _UITableViewRowDataNumberOfRowsInSection(UITableViewRowData *__unsafe_unretained, NSInteger)");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("UITableViewRowData.m"), 1765, CFSTR("Requested the number of rows for section (%ld) which is out of bounds."), v7);

            }
            else
            {
              v14 = _UITableViewRowDataNumberOfRowsInSection___s_category;
              if (!_UITableViewRowDataNumberOfRowsInSection___s_category)
              {
                v14 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
                atomic_store(v14, (unint64_t *)&_UITableViewRowDataNumberOfRowsInSection___s_category);
              }
              v15 = *(NSObject **)(v14 + 8);
              if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134217984;
                v17 = v7;
                _os_log_impl(&dword_185066000, v15, OS_LOG_TYPE_ERROR, "Requested the number of rows for section (%ld) which is out of bounds.", buf, 0xCu);
              }
            }
            v10 = 0x7FFFFFFFFFFFFFFFLL;
          }
          else
          {
            v9 = *(_QWORD *)(*(_QWORD *)(v3 + 88) + 8 * v7);
            if (!*(_BYTE *)(v9 + 8))
              -[UISectionRowData refreshWithSection:tableView:tableViewRowData:](*(_QWORD *)(*(_QWORD *)(v3 + 88) + 8 * v7), v7, *(void **)(v3 + 8), v3);
            if (!*(_BYTE *)(v9 + 9))
              -[UITableViewRowData _ensureSectionOffsetIsValidForSection:](v3, v7);
            v10 = *(_QWORD *)(v9 + 32);
            v11 = -[UITableViewRowData temporarilyDeletedIndexPathBeingReordered]((_QWORD *)v3);
            if (v11)
            {
              if (v7 == objc_msgSend(v11, "section"))
                ++v10;
            }
          }
          v8 += v10;
          ++v7;
        }
        while (v6 != v7);
      }
      else
      {
        v8 = 0;
      }
      return v8 + v4;
    }
  }
  return result;
}

- (uint64_t)sectionLocationForRow:(uint64_t)a3 inSection:
{
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  unsigned int v16;
  void *v18;

  if (!a1)
    return 0;
  if (a3 < 0 || *(_QWORD *)(a1 + 64) <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", sel_sectionLocationForRow_inSection_, a1, CFSTR("UITableViewRowData.m"), 2036, CFSTR("request for invalid section (%ld)"), a3);

  }
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8 * a3);
  if (!*(_BYTE *)(v6 + 8))
    -[UISectionRowData refreshWithSection:tableView:tableViewRowData:](*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8 * a3), a3, *(void **)(a1 + 8), a1);
  if (!*(_BYTE *)(v6 + 9))
    -[UITableViewRowData _ensureSectionOffsetIsValidForSection:](a1, a3);
  -[UITableViewRowData temporarilyDeletedIndexPathBeingReordered]((_QWORD *)a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && objc_msgSend(v7, "section") == a3)
    a2 -= objc_msgSend(v8, "row") < a2;
  v9 = *(_QWORD *)(v6 + 96);
  if (v9 && (v10 = *(void **)(v9 + 176)) != 0)
  {
    v11 = *(_QWORD *)(v9 + 64);
    if (v11 < 1)
    {
LABEL_17:
      v12 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      v12 = 0;
      while (*(_QWORD *)(*(_QWORD *)(v9 + 88) + 8 * v12) != v6)
      {
        if (v11 == ++v12)
          goto LABEL_17;
      }
    }
    v13 = +[UISectionRowData sectionLocationForRow:inSection:numRows:gapIndexPath:rowSpacing:](*(double *)(v9 + 144), (uint64_t)UISectionRowData, a2, v12, *(_QWORD *)(v6 + 32), v10);
  }
  else
  {
    v14 = *(_QWORD *)(v6 + 32);
    objc_opt_self();
    if (v14 - 1 == a2)
      v15 = 4;
    else
      v15 = 2;
    if (v14 - 1 == a2)
      v16 = 3;
    else
      v16 = 1;
    if (a2)
      v13 = v16;
    else
      v13 = v15;
  }

  return v13;
}

- (uint64_t)globalRowsInRect:(CGFloat)a3 canGuess:(CGFloat)a4
{
  _QWORD *v12;
  uint64_t v13;
  char *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double y;
  CGFloat x;
  CGFloat v27;
  CGFloat width;
  CGFloat height;
  double MinY;
  uint64_t v31;
  void *v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  double v37;
  double v38;
  double MaxY;
  uint64_t v40;
  void *v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  double v46;
  double v47;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;

  if (a1)
  {
    v12 = -[UITableViewRowData numberOfRows]((uint64_t)a1);
    if (v12)
    {
      v13 = (uint64_t)v12;
      v14 = (char *)v12 - 1;
      -[UITableViewRowData temporarilyDeletedIndexPathBeingReordered](a1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
        v16 = -[UITableViewRowData globalRowForRowAtIndexPath:]((uint64_t)a1, v15);
      else
        v16 = 0x7FFFFFFFFFFFFFFFLL;
      if (v13 < 1)
      {
        v18 = 0;
        v24 = 0;
        v19 = (uint64_t)v14;
      }
      else
      {
        v18 = 0;
        v19 = (uint64_t)v14;
        do
        {
          v20 = v19 - v18;
          if (v19 >= v18)
            v21 = v19 - v18;
          else
            v21 = v20 + 1;
          v22 = v18 + (v21 >> 1);
          v23 = v16 - (v20 > 1);
          if (v16 < v19)
            v23 = v16 + 1;
          if (v22 == v16)
            v24 = v23;
          else
            v24 = v22;
          v54.origin.x = -[UITableViewRowData rectForGlobalRow:heightCanBeGuessed:](a1, v24, 1);
          y = v54.origin.y;
          v66.origin.x = a3;
          v66.origin.y = a4;
          v66.size.width = a5;
          v66.size.height = a6;
          if (CGRectIntersectsRect(v54, v66))
            break;
          if (y < a4)
            v18 = v24 + 1;
          else
            v19 = v24 - 1;
        }
        while (v18 <= v19);
      }
      if (v18 > v19)
        goto LABEL_33;
      v55.origin.x = -[UITableViewRowData rectForGlobalRow:heightCanBeGuessed:](a1, v24, a2);
      x = v55.origin.x;
      v27 = v55.origin.y;
      width = v55.size.width;
      height = v55.size.height;
      v67.origin.x = a3;
      v67.origin.y = a4;
      v67.size.width = a5;
      v67.size.height = a6;
      if (!CGRectIntersectsRect(v55, v67))
      {
LABEL_33:
        v17 = 0;
LABEL_49:

        return v17;
      }
      v52 = v27;
      v53 = x;
      v50 = height;
      v51 = width;
      if (v24 >= 1)
      {
        v56.origin.x = x;
        v56.origin.y = v27;
        v56.size.width = width;
        v56.size.height = height;
        MinY = CGRectGetMinY(v56);
        v57.origin.x = a3;
        v57.origin.y = a4;
        v57.size.width = a5;
        v57.size.height = a6;
        v31 = v24;
        if (MinY <= CGRectGetMinY(v57))
        {
LABEL_35:
          v17 = v31;
          if (v31 != 0x7FFFFFFFFFFFFFFFLL)
          {
LABEL_37:
            if (v24 < (uint64_t)v14)
            {
              v61.origin.y = v52;
              v61.origin.x = v53;
              v61.size.height = v50;
              v61.size.width = v51;
              MaxY = CGRectGetMaxY(v61);
              v62.origin.x = a3;
              v62.origin.y = a4;
              v62.size.width = a5;
              v62.size.height = a6;
              if (MaxY < CGRectGetMaxY(v62))
              {
                v40 = v16 - 1;
                while (v24 + 1 < v13)
                {
                  v41 = (void *)MEMORY[0x186DC9484]();
                  v63.origin.x = -[UITableViewRowData rectForGlobalRow:heightCanBeGuessed:](a1, v24 + 1, a2);
                  v42 = v63.origin.x;
                  v43 = v63.origin.y;
                  v44 = v63.size.width;
                  v45 = v63.size.height;
                  v69.origin.x = a3;
                  v69.origin.y = a4;
                  v69.size.width = a5;
                  v69.size.height = a6;
                  if (!CGRectIntersectsRect(v63, v69))
                  {
                    objc_autoreleasePoolPop(v41);
                    goto LABEL_49;
                  }
                  v64.origin.x = v42;
                  v64.origin.y = v43;
                  v64.size.width = v44;
                  v64.size.height = v45;
                  v46 = CGRectGetMaxY(v64);
                  v65.origin.x = a3;
                  v65.origin.y = a4;
                  v65.size.width = a5;
                  v65.size.height = a6;
                  v47 = CGRectGetMaxY(v65);
                  objc_autoreleasePoolPop(v41);
                  if (v46 >= v47 && v40 != v24++)
                    goto LABEL_49;
                }
              }
            }
            goto LABEL_49;
          }
        }
        else
        {
          v31 = v24;
          while (1)
          {
            v17 = v31 - 1;
            if (v31 < 1)
              break;
            v32 = (void *)MEMORY[0x186DC9484]();
            v58.origin.x = -[UITableViewRowData rectForGlobalRow:heightCanBeGuessed:](a1, v31 - 1, a2);
            v33 = v58.origin.x;
            v34 = v58.origin.y;
            v35 = v58.size.width;
            v36 = v58.size.height;
            v68.origin.x = a3;
            v68.origin.y = a4;
            v68.size.width = a5;
            v68.size.height = a6;
            if (!CGRectIntersectsRect(v58, v68))
            {
              objc_autoreleasePoolPop(v32);
              goto LABEL_35;
            }
            v59.origin.x = v33;
            v59.origin.y = v34;
            v59.size.width = v35;
            v59.size.height = v36;
            v37 = CGRectGetMinY(v59);
            v60.origin.x = a3;
            v60.origin.y = a4;
            v60.size.width = a5;
            v60.size.height = a6;
            v38 = CGRectGetMinY(v60);
            objc_autoreleasePoolPop(v32);
            --v31;
            if (v37 < v38)
              goto LABEL_37;
          }
        }
      }
      v17 = 0;
      goto LABEL_37;
    }
  }
  return 0;
}

- (double)rectForGlobalRow:(char)a3 heightCanBeGuessed:
{
  double v5;
  uint64_t v6;
  uint64_t v8;

  if (!a1)
    return 0.0;
  v5 = *MEMORY[0x1E0C9D648];
  v8 = 0x7FFFFFFFFFFFFFFFLL;
  v6 = -[UITableViewRowData _sectionRowForGlobalRow:inSection:](a1, a2, &v8);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL && v8 != 0x7FFFFFFFFFFFFFFFLL)
    return -[UITableViewRowData rectForRow:inSection:heightCanBeGuessed:]((uint64_t)a1, v6, v8, a3);
  return v5;
}

- (uint64_t)_sectionRowForGlobalRow:(uint64_t *)a3 inSection:
{
  uint64_t v3;
  void *v6;
  void *v7;
  uint64_t v8;
  size_t v9;
  const void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v14[7];
  uint64_t __key;

  v3 = (uint64_t)a1;
  __key = a2;
  if (a1)
  {
    -[UITableViewRowData temporarilyDeletedIndexPathBeingReordered](a1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = objc_msgSend(v6, "section");
      v9 = *(_QWORD *)(v3 + 64);
    }
    else
    {
      v9 = *(_QWORD *)(v3 + 64);
      v8 = v9;
    }
    v10 = *(const void **)(v3 + 88);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __56__UITableViewRowData__sectionRowForGlobalRow_inSection___block_invoke;
    v14[3] = &unk_1E16E4198;
    v14[4] = v3;
    v14[5] = v8;
    v14[6] = a2;
    v11 = bsearch_b(&__key, v10, v9, 8uLL, v14);
    if (v11)
    {
      v12 = ((uint64_t)v11 - *(_QWORD *)(v3 + 88)) >> 3;
      v3 = __key - *(_QWORD *)(*(_QWORD *)v11 + 24) - (v8 < v12);
    }
    else
    {
      v12 = 0x7FFFFFFFFFFFFFFFLL;
      v3 = 0x7FFFFFFFFFFFFFFFLL;
    }
    *a3 = v12;

  }
  return v3;
}

- (double)rectForRow:(uint64_t)a3 inSection:(char)a4 heightCanBeGuessed:
{
  uint64_t v6;
  void *v8;
  void *v9;
  char v10;
  uint64_t v11;
  void *v13;
  void *v14;

  if (a1)
  {
    v6 = a2;
    if (*(_QWORD *)(a1 + 64) <= a3 || -[UITableViewRowData numberOfRowsInSection:](a1, a3) <= a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v6, a3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", sel_rectForRow_inSection_heightCanBeGuessed_, a1, CFSTR("UITableViewRowData.m"), 2375, CFSTR("request for rect at invalid index path (%@)"), v14);

    }
    -[UITableViewRowData temporarilyDeletedIndexPathBeingReordered]((_QWORD *)a1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8 && objc_msgSend(v8, "section") == a3)
    {
      if (objc_msgSend(v9, "row") == v6)
      {
        v10 = 1;
      }
      else
      {
        v10 = 0;
        v6 -= objc_msgSend(v9, "row") < v6;
      }
    }
    else
    {
      v10 = 0;
    }
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8 * a3);
    if (!*(_BYTE *)(v11 + 8))
      -[UISectionRowData refreshWithSection:tableView:tableViewRowData:](*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8 * a3), a3, *(void **)(a1 + 8), a1);
    if (!*(_BYTE *)(v11 + 9))
      -[UITableViewRowData _ensureSectionOffsetIsValidForSection:](a1, a3);
    -[UISectionRowData offsetForRow:adjustedForGap:](v11, v6, 1);
    if ((v10 & 1) == 0)
      -[UITableViewRowData heightForRow:inSection:canGuess:adjustForReorderedRow:](a1, v6, a3, a4, 0);
    -[UITableViewRowData _ensureSectionOffsetIsValidForSection:](a1, a3);
    -[UITableViewRowData offsetForSection:](a1, v11);

  }
  return 0.0;
}

- (void)_ensureSectionOffsetIsValidForSection:(uint64_t)a1
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;

  if (a1)
  {
    v4 = *(uint64_t **)(a1 + 88);
    if (!*(_BYTE *)(v4[a2] + 9))
    {
      v5 = a2;
      while (1)
      {
        v6 = v5 - 1;
        if (v5 < 1)
          break;
        if (*(unsigned __int8 *)(v4[--v5] + 9))
        {
          v8 = v6 + 1;
          goto LABEL_10;
        }
      }
      v9 = *v4;
      if (!*(_BYTE *)(*v4 + 8))
        -[UISectionRowData refreshWithSection:tableView:tableViewRowData:](v9, 0, *(void **)(a1 + 8), a1);
      v10 = *(double *)(a1 + 152);
      *(double *)(v9 + 16) = v10 + -[UITableViewRowData heightForTableHeaderView](a1);
      *(_QWORD *)(v9 + 24) = 0;
      v8 = 1;
      *(_BYTE *)(v9 + 9) = 1;
LABEL_10:
      if (v8 <= a2)
      {
        v11 = a2 + 1;
        do
        {
          v12 = (uint64_t *)(*(_QWORD *)(a1 + 88) + 8 * v8);
          v13 = *(v12 - 1);
          v14 = *v12;
          if (!*(_BYTE *)(v13 + 8))
            -[UISectionRowData refreshWithSection:tableView:tableViewRowData:](v13, v8 - 1, *(void **)(a1 + 8), a1);
          if (!*(_BYTE *)(v13 + 9))
            -[UITableViewRowData _ensureSectionOffsetIsValidForSection:](a1, v8 - 1);
          if (!*(_BYTE *)(a1 + 72))
            *(double *)(v14 + 16) = *(double *)(v13 + 16) + *(double *)(v13 + 40);
          *(_QWORD *)(v14 + 24) = *(_QWORD *)(v13 + 32) + *(_QWORD *)(v13 + 24);
          *(_BYTE *)(v14 + 9) = 1;
          ++v8;
        }
        while (v11 != v8);
      }
    }
  }
}

- (double)offsetForSection:(uint64_t)a1
{
  double v2;
  double v5;
  double Height;
  uint64_t v7;
  uint64_t v8;
  CGRect v10;

  v2 = 0.0;
  if (a1)
  {
    if (*(_BYTE *)(a1 + 72))
    {
      v5 = *(double *)(a1 + 152);
      v10.origin.x = -[UITableViewRowData rectForTableHeaderView](a1);
      Height = CGRectGetHeight(v10);
      v7 = *(_QWORD *)(a1 + 64);
      if (v7 < 1)
      {
LABEL_7:
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("request for offset of unknown section row data"), Height);
      }
      else
      {
        Height = v5 + Height;
        v8 = *(_QWORD *)(a1 + 88);
        while (*(_QWORD *)v8 != a2)
        {
          Height = Height + *(double *)(*(_QWORD *)v8 + 40);
          v8 += 8;
          if (!--v7)
            goto LABEL_7;
        }
        return Height;
      }
    }
    else
    {
      return *(double *)(a2 + 16);
    }
  }
  return v2;
}

- (double)rectForTableHeaderView
{
  CGFloat v2;
  CGFloat v3;
  double v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  CGRect v10;
  CGRect v11;

  if (a1)
  {
    if (objc_msgSend(*(id *)(a1 + 8), "_shouldUseNewHeaderFooterBehavior"))
    {
      v2 = *(double *)(a1 + 152);
      v3 = *(double *)(a1 + 24);
      v4 = -[UITableViewRowData heightForTableHeaderView](a1);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 8), "_tableHeaderView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        objc_msgSend(*(id *)(a1 + 8), "_tableHeaderView");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "frame");
        v4 = v7;

      }
      else
      {
        v4 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      }
      v2 = *(double *)(a1 + 152);
      v3 = *(double *)(a1 + 24);
    }
    if ((*(_BYTE *)(a1 + 128) & 8) != 0)
    {
      objc_msgSend(*(id *)(a1 + 8), "_scrollView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bounds");
      CGRectGetMinY(v10);
      objc_msgSend(*(id *)(a1 + 8), "_contentInset");

      v11.origin.x = 0.0;
      v11.origin.y = v2;
      v11.size.width = v3;
      v11.size.height = v4;
      CGRectGetMinY(v11);
    }
  }
  return 0.0;
}

- (uint64_t)numberOfRowsInSection:(uint64_t)a1
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  if (a2 < 0 || *(_QWORD *)(a1 + 64) <= a2)
  {
    if (dyld_program_sdk_at_least())
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSInteger _UITableViewRowDataNumberOfRowsInSection(UITableViewRowData *__unsafe_unretained, NSInteger)");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("UITableViewRowData.m"), 1765, CFSTR("Requested the number of rows for section (%ld) which is out of bounds."), a2);

    }
    else
    {
      v9 = _UITableViewRowDataNumberOfRowsInSection___s_category;
      if (!_UITableViewRowDataNumberOfRowsInSection___s_category)
      {
        v9 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v9, (unint64_t *)&_UITableViewRowDataNumberOfRowsInSection___s_category);
      }
      v10 = *(NSObject **)(v9 + 8);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v13 = a2;
        _os_log_impl(&dword_185066000, v10, OS_LOG_TYPE_ERROR, "Requested the number of rows for section (%ld) which is out of bounds.", buf, 0xCu);
      }
    }
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8 * a2);
    if (!*(_BYTE *)(v4 + 8))
      -[UISectionRowData refreshWithSection:tableView:tableViewRowData:](*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8 * a2), a2, *(void **)(a1 + 8), a1);
    if (!*(_BYTE *)(v4 + 9))
      -[UITableViewRowData _ensureSectionOffsetIsValidForSection:](a1, a2);
    v5 = *(_QWORD *)(v4 + 32);
    v6 = -[UITableViewRowData temporarilyDeletedIndexPathBeingReordered]((_QWORD *)a1);
    if (v6 && objc_msgSend(v6, "section") == a2)
      ++v5;
  }
  return v5;
}

- (_QWORD)temporarilyDeletedIndexPathBeingReordered
{
  void *v1;

  if (a1)
  {
    v1 = (void *)a1[23];
    if (!v1)
      v1 = (void *)a1[24];
    a1 = v1;
  }
  return a1;
}

- (double)heightForRow:(uint64_t)a3 inSection:(char)a4 canGuess:(int)a5 adjustForReorderedRow:
{
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  void *v15;

  if (!a1)
    return 0.0;
  if (a3 < 0 || *(_QWORD *)(a1 + 64) <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", sel_heightForRow_inSection_canGuess_adjustForReorderedRow_, a1, CFSTR("UITableViewRowData.m"), 1962, CFSTR("request for invalid section (%ld)"), a3);

  }
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8 * a3);
  if (!*(_BYTE *)(v10 + 8))
    -[UISectionRowData refreshWithSection:tableView:tableViewRowData:](*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8 * a3), a3, *(void **)(a1 + 8), a1);
  if (!*(_BYTE *)(v10 + 9))
    -[UITableViewRowData _ensureSectionOffsetIsValidForSection:](a1, a3);
  -[UITableViewRowData temporarilyDeletedIndexPathBeingReordered]((_QWORD *)a1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (a5 && v11 && objc_msgSend(v11, "section") == a3)
  {
    if (objc_msgSend(v12, "row") == a2)
    {
      v13 = 0.0;
      if (!*(_QWORD *)(a1 + 192))
        v13 = *(double *)(a1 + 216);
      goto LABEL_16;
    }
    a2 -= objc_msgSend(v12, "row") < a2;
  }
  v13 = -[UISectionRowData heightForRow:inSection:canGuess:](v10, a2, a3, a4);
LABEL_16:

  return v13;
}

- (_QWORD)numberOfRows
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  void *v6;

  v1 = (_QWORD *)a1;
  if (a1)
  {
    v2 = *(_QWORD *)(a1 + 64);
    v3 = v2 - 1;
    if (v2 < 1)
    {
      v5 = 0;
    }
    else
    {
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8 * v3);
      if (!*(_BYTE *)(v4 + 8))
        -[UISectionRowData refreshWithSection:tableView:tableViewRowData:](*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8 * v3), v3, *(void **)(a1 + 8), a1);
      if (!*(_BYTE *)(v4 + 9))
        -[UITableViewRowData _ensureSectionOffsetIsValidForSection:]((uint64_t)v1, v3);
      v5 = (_QWORD *)(*(_QWORD *)(v4 + 32) + *(_QWORD *)(v4 + 24));
    }
    -[UITableViewRowData temporarilyDeletedIndexPathBeingReordered](v1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      v1 = (_QWORD *)((char *)v5 + 1);
    else
      v1 = v5;

  }
  return v1;
}

- (double)maxHeaderTitleWidthForSection:(uint64_t)a1
{
  uint64_t v4;
  void *v6;

  if (!a1)
    return 0.0;
  if (a2 < 0 || *(_QWORD *)(a1 + 64) <= a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", sel_maxHeaderTitleWidthForSection_, a1, CFSTR("UITableViewRowData.m"), 2795, CFSTR("request for invalid section (%ld)"), a2);

  }
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8 * a2);
  if (!*(_BYTE *)(v4 + 8))
  {
    -[UISectionRowData refreshWithSection:tableView:tableViewRowData:](v4, a2, *(void **)(a1 + 8), a1);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8 * a2);
  }
  if (!*(_BYTE *)(v4 + 9))
  {
    -[UITableViewRowData _ensureSectionOffsetIsValidForSection:](a1, a2);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8 * a2);
  }
  return *(double *)(v4 + 80);
}

- (double)rectForFooterInSection:(char)a3 heightCanBeGuessed:
{
  uint64_t v6;
  double v7;
  double v8;
  void *v10;

  if (!a1)
    return 0.0;
  if (a2 < 0 || *(_QWORD *)(a1 + 64) <= a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", sel_rectForFooterInSection_heightCanBeGuessed_, a1, CFSTR("UITableViewRowData.m"), 2268, CFSTR("request for rect of footer in invalid section (%ld)"), a2);

  }
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8 * a2);
  if (!*(_BYTE *)(v6 + 8))
    -[UISectionRowData refreshWithSection:tableView:tableViewRowData:](*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8 * a2), a2, *(void **)(a1 + 8), a1);
  if (!*(_BYTE *)(v6 + 9))
    -[UITableViewRowData _ensureSectionOffsetIsValidForSection:](a1, a2);
  objc_msgSend(*(id *)(a1 + 8), "_sectionFooterContentInsets");
  v8 = v7;
  -[UISectionRowData heightForFooterInSection:canGuess:](v6, a2, a3);
  -[UITableViewRowData _ensureSectionOffsetIsValidForSection:](a1, a2);
  -[UITableViewRowData offsetForSection:](a1, v6);
  return v8;
}

- (double)rectForHeaderInSection:(char)a3 heightCanBeGuessed:
{
  uint64_t v6;
  double v7;
  double v8;
  void *v9;
  char v10;
  void *v11;
  double v12;
  double v13;
  void *v15;

  if (!a1)
    return 0.0;
  if (a2 < 0 || *(_QWORD *)(a1 + 64) <= a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", sel_rectForHeaderInSection_heightCanBeGuessed_, a1, CFSTR("UITableViewRowData.m"), 2176, CFSTR("request for rect of header in invalid section (%ld)"), a2);

  }
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8 * a2);
  if (!*(_BYTE *)(v6 + 8))
    -[UISectionRowData refreshWithSection:tableView:tableViewRowData:](*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8 * a2), a2, *(void **)(a1 + 8), a1);
  if (!*(_BYTE *)(v6 + 9))
    -[UITableViewRowData _ensureSectionOffsetIsValidForSection:](a1, a2);
  objc_msgSend(*(id *)(a1 + 8), "_sectionHeaderContentInsets");
  v8 = v7;
  objc_msgSend(*(id *)(a1 + 8), "_constants");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 8), "_constants");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "headerFooterOffsetFromContentInsetForTableView:", *(_QWORD *)(a1 + 8));
    v13 = v12;

    v8 = v8 + v13;
  }
  -[UISectionRowData sizeForHeaderInSection:canGuess:](v6, a2, a3);
  -[UITableViewRowData _ensureSectionOffsetIsValidForSection:](a1, a2);
  -[UITableViewRowData offsetForSection:](a1, v6);
  return v8;
}

- (double)heightForHeaderInSection:(char)a3 canGuess:
{
  uint64_t v6;
  double v7;
  void *v9;

  if (!a1)
    return 0.0;
  if (a2 < 0 || *(_QWORD *)(a1 + 64) <= a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", sel_heightForHeaderInSection_canGuess_, a1, CFSTR("UITableViewRowData.m"), 1941, CFSTR("request for invalid section (%ld)"), a2);

  }
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8 * a2);
  if (!*(_BYTE *)(v6 + 8))
    -[UISectionRowData refreshWithSection:tableView:tableViewRowData:](*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8 * a2), a2, *(void **)(a1 + 8), a1);
  if (!*(_BYTE *)(v6 + 9))
    -[UITableViewRowData _ensureSectionOffsetIsValidForSection:](a1, a2);
  -[UISectionRowData sizeForHeaderInSection:canGuess:](v6, a2, a3);
  return v7;
}

- (double)heightForFooterInSection:(char)a3 canGuess:
{
  uint64_t v6;
  void *v8;

  if (!a1)
    return 0.0;
  if (a2 < 0 || *(_QWORD *)(a1 + 64) <= a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", sel_heightForFooterInSection_canGuess_, a1, CFSTR("UITableViewRowData.m"), 1949, CFSTR("request for invalid section (%ld)"), a2);

  }
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8 * a2);
  if (!*(_BYTE *)(v6 + 8))
    -[UISectionRowData refreshWithSection:tableView:tableViewRowData:](*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8 * a2), a2, *(void **)(a1 + 8), a1);
  if (!*(_BYTE *)(v6 + 9))
    -[UITableViewRowData _ensureSectionOffsetIsValidForSection:](a1, a2);
  return -[UISectionRowData heightForFooterInSection:canGuess:](v6, a2, a3);
}

- (double)maxFooterTitleWidthForSection:(uint64_t)a1
{
  uint64_t v4;
  void *v6;

  if (!a1)
    return 0.0;
  if (a2 < 0 || *(_QWORD *)(a1 + 64) <= a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", sel_maxFooterTitleWidthForSection_, a1, CFSTR("UITableViewRowData.m"), 2802, CFSTR("request for invalid section (%ld)"), a2);

  }
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8 * a2);
  if (!*(_BYTE *)(v4 + 8))
  {
    -[UISectionRowData refreshWithSection:tableView:tableViewRowData:](v4, a2, *(void **)(a1 + 8), a1);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8 * a2);
  }
  if (!*(_BYTE *)(v4 + 9))
  {
    -[UITableViewRowData _ensureSectionOffsetIsValidForSection:](a1, a2);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8 * a2);
  }
  return *(double *)(v4 + 88);
}

- (uint64_t)hasRows
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (result)
  {
    v1 = result;
    v2 = *(_QWORD *)(result + 64);
    if (v2 >= 1)
    {
      v3 = *(_QWORD *)(*(_QWORD *)(result + 88) + 8 * v2 - 8);
      if (*(_BYTE *)(v3 + 8) && *(_BYTE *)(v3 + 9))
      {
        if ((uint64_t)(*(_QWORD *)(v3 + 32) + *(_QWORD *)(v3 + 24)) > 0)
          return 1;
        -[UITableViewRowData temporarilyDeletedIndexPathBeingReordered]((_QWORD *)result);
        v4 = (void *)objc_claimAutoreleasedReturnValue();

        if (v4)
          return 1;
      }
      else
      {
        v5 = objc_msgSend(*(id *)(result + 8), "_numberOfSections");
        if (v5 >= 1)
        {
          v6 = v5;
          v7 = 0;
          while (objc_msgSend(*(id *)(v1 + 8), "_numberOfRowsInSection:", v7) <= 0)
          {
            if (v6 == ++v7)
              return 0;
          }
          return 1;
        }
      }
    }
    return 0;
  }
  return result;
}

- (uint64_t)numberOfRowsBeforeSection:(uint64_t)a1
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (!a1)
    return 0;
  -[UITableViewRowData temporarilyDeletedIndexPathBeingReordered]((_QWORD *)a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "section") <= a2;
  else
    v6 = 0;
  if (a2 >= 1)
  {
    v7 = 0;
    do
    {
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8 * v7);
      if (!*(_BYTE *)(v8 + 8))
        -[UISectionRowData refreshWithSection:tableView:tableViewRowData:](*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8 * v7), a2, *(void **)(a1 + 8), a1);
      if (!*(_BYTE *)(v8 + 9))
        -[UITableViewRowData _ensureSectionOffsetIsValidForSection:](a1, a2);
      v6 += *(_QWORD *)(v8 + 32);
      ++v7;
    }
    while (a2 != v7);
  }

  return v6;
}

- (_QWORD)initWithTableView:(_QWORD *)a1
{
  id v3;
  _QWORD *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v11;

  v3 = a2;
  if (a1)
  {
    v11.receiver = a1;
    v11.super_class = (Class)UITableViewRowData;
    v4 = objc_msgSendSuper2(&v11, sel_init);
    a1 = v4;
    if (v4)
    {
      v4[1] = v3;
      objc_msgSend(v3, "_scrollView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bounds");
      a1[3] = v6;

      a1[17] = 0x7FEFFFFFFFFFFFFFLL;
      objc_msgSend(v3, "_heightForTableHeader");
      a1[12] = v7;
      objc_msgSend(v3, "_heightForTableFooter");
      a1[13] = v8;
      a1[14] = 0xBFF0000000000000;
      objc_msgSend(v3, "_rowSpacing");
      a1[18] = v9;
      a1[15] = objc_msgSend(v3, "_headerFooterPinningBehavior");
    }
  }

  return a1;
}

- (void)invalidateAllSections
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  if (a1)
  {
    *(_BYTE *)(a1 + 128) &= 0xF8u;
    v6 = *(id *)(a1 + 8);
    objc_msgSend(v6, "_rowSpacing");
    *(_QWORD *)(a1 + 144) = v2;
    *(_QWORD *)(a1 + 120) = objc_msgSend(v6, "_headerFooterPinningBehavior");
    -[UITableViewRowData _updateSectionRowDataArrayForNumSections:]((UITableViewRowData *)a1, objc_msgSend(*(id *)(a1 + 8), "_numberOfSections"));
    v3 = *(_QWORD *)(a1 + 64);
    if (v3 >= 1)
    {
      v4 = *(_QWORD *)(a1 + 88);
      do
      {
        if (*(_QWORD *)v4)
          *(_WORD *)(*(_QWORD *)v4 + 8) = 0;
        v4 += 8;
        --v3;
      }
      while (v3);
    }
    *(_QWORD *)(a1 + 136) = 0x7FEFFFFFFFFFFFFFLL;
    v5 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    if ((dyld_program_sdk_at_least() & 1) != 0)
      -[UITableViewRowData _updateTopAndBottomPadding](a1);

  }
}

- (void)_updateSectionRowDataArrayForNumSections:(UITableViewRowData *)a1
{
  id *v4;
  id *v5;
  int64_t v6;
  id *v7;
  id *sectionRowData;
  id v9;
  id *v10;
  int64_t numSections;
  UISectionRowData *v12;
  id *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  objc_super v18;

  if (a1)
  {
    if (a1->_sectionRowDataCapacity < count)
    {
      v4 = (id *)malloc_type_calloc(count, 8uLL, 0x80040B8603338uLL);
      v5 = v4;
      if (a1->_sectionRowDataCapacity >= 1)
      {
        v6 = 0;
        v7 = v4;
        do
        {
          objc_storeStrong(v7, a1->_sectionRowData[v6]);
          sectionRowData = a1->_sectionRowData;
          v9 = sectionRowData[v6];
          sectionRowData[v6] = 0;

          ++v6;
          ++v7;
        }
        while (v6 < a1->_sectionRowDataCapacity);
      }
      v10 = a1->_sectionRowData;
      if (v10)
        free(v10);
      a1->_sectionRowData = v5;
      if (!v5)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", sel__updateSectionRowDataArrayForNumSections_, a1, CFSTR("UITableViewRowData.m"), 1210, CFSTR("Failed to allocate data stores for %ld sections. Consider using fewer sections."), count);

      }
      a1->_sectionRowDataCapacity = count;
    }
    numSections = a1->_numSections;
    if (numSections >= count)
    {
      for (; numSections > count; --numSections)
      {
        v15 = (uint64_t)&a1->_sectionRowData[numSections];
        v16 = *(void **)(v15 - 8);
        *(_QWORD *)(v15 - 8) = 0;

      }
    }
    else
    {
      do
      {
        v12 = [UISectionRowData alloc];
        if (v12)
        {
          v18.receiver = v12;
          v18.super_class = (Class)UISectionRowData;
          v12 = (UISectionRowData *)-[UITableViewRowData init](&v18, sel_init);
          if (v12)
            v12->_rowData = a1;
        }
        v13 = a1->_sectionRowData;
        v14 = v13[numSections];
        v13[numSections] = v12;

        ++numSections;
      }
      while (count != numSections);
    }
    a1->_numSections = count;
  }
}

- (void)_updateTopAndBottomPadding
{
  unint64_t v2;
  id v4;
  double *v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;

  if (a1)
  {
    v2 = objc_msgSend(*(id *)(a1 + 8), "_tableStyle");
    if (v2 <= 0x10 && ((1 << v2) & 0x10006) != 0)
    {
      *(double *)(a1 + 152) = GroupedTableOffsetFromTop(*(void **)(a1 + 8), (void *)a1);
      v4 = *(id *)(a1 + 8);
      v5 = (double *)(id)a1;
      objc_msgSend(v4, "_bottomPadding");
      v7 = v6;
      if (v6 == -1.0)
      {
        v7 = 0.0;
        if (-[UITableViewRowData heightForTableFooterView]((uint64_t)v5) <= 0.0)
        {
          +[UIDevice currentDevice](UIDevice, "currentDevice");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v8, "userInterfaceIdiom");

          v7 = 20.0;
          if ((v9 & 0xFFFFFFFFFFFFFFFBLL) == 1)
          {
            if (objc_msgSend(v4, "usesVariableMargins"))
              v7 = 40.0;
            else
              v7 = 20.0;
          }
        }
      }

      v5[20] = v7;
    }
  }
}

uint64_t __77__UITableViewRowData__sectionForPoint_beginningWithSection_numberOfSections___block_invoke(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double y;
  CGRect v9;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = ((uint64_t)a3 - *(_QWORD *)(v4 + 88)) >> 3;
  v6 = *a3;
  if (!*(_BYTE *)(*a3 + 8))
  {
    -[UISectionRowData refreshWithSection:tableView:tableViewRowData:](v6, v5, *(void **)(v4 + 8), v4);
    v4 = *(_QWORD *)(a1 + 32);
  }
  if (!*(_BYTE *)(v6 + 9))
  {
    -[UITableViewRowData _ensureSectionOffsetIsValidForSection:](v4, v5);
    v4 = *(_QWORD *)(a1 + 32);
  }
  v9.origin.x = -[UITableViewRowData rectForSection:](v4, v5);
  y = v9.origin.y;
  if (CGRectContainsPoint(v9, *(CGPoint *)(a1 + 40)))
    return 0;
  if (*(double *)(a1 + 48) >= y)
    return 1;
  return 0xFFFFFFFFLL;
}

- (void)setHeight:(double)a3 forRowAtIndexPath:
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  float v8;
  float v9;
  float v10;
  uint64_t v11;
  double v12;
  void *v13;
  void *v14;
  uint64_t v15;
  float v16;
  double v17;
  float v18;
  unint64_t v19;
  BOOL v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  double *v24;
  void *v25;
  id v26;

  v5 = a2;
  if (a1)
  {
    v26 = v5;
    v6 = objc_msgSend(v5, "section");
    if (v6 >= *(_QWORD *)(a1 + 64))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", sel_setHeight_forRowAtIndexPath_, a1, CFSTR("UITableViewRowData.m"), 2017, CFSTR("attempt to set height for row in section %ld when there are only %ld sections in the table"), v6, *(_QWORD *)(a1 + 64));

    }
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8 * v6);
    if (!*(_BYTE *)(v7 + 8))
      -[UISectionRowData refreshWithSection:tableView:tableViewRowData:](*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8 * v6), v6, *(void **)(a1 + 8), a1);
    if (!*(_BYTE *)(v7 + 9))
      -[UITableViewRowData _ensureSectionOffsetIsValidForSection:](a1, v6);
    v8 = *(float *)(*(_QWORD *)(v7 + 136) + 4 * objc_msgSend(v26, "row"));
    v5 = v26;
    if (v8 < -1.0)
      v8 = -v8;
    v9 = a3;
    v10 = v9 - v8;
    if (v10 < 0.0)
      v10 = -v10;
    if (v10 > 0.00000011921)
    {
      v11 = objc_msgSend(v26, "row");
      v12 = fmax(a3, 0.00000011920929);
      -[UITableViewRowData temporarilyDeletedIndexPathBeingReordered](*(_QWORD **)(v7 + 96));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13 && objc_msgSend(v13, "section") == v6)
        v11 -= objc_msgSend(v14, "row") < v11;
      v15 = *(_QWORD *)(v7 + 136);
      v16 = *(float *)(v15 + 4 * v11);
      if (v16 < -1.0)
        v16 = -v16;
      v17 = v12 - v16;
      v18 = v12;
      *(float *)(v15 + 4 * v11) = v18;
      if (*(_BYTE *)(*(_QWORD *)(v7 + 96) + 72))
      {
        v19 = *(_QWORD *)(v7 + 32);
        v20 = v19 > v11 + 1;
        v21 = v19 - (v11 + 1);
        if (v20)
          memset_pattern16((void *)(*(_QWORD *)(v7 + 144) + 8 * (v11 + 1)), &xmmword_1866792D0, 8 * v21);
      }
      else
      {
        v22 = *(_QWORD *)(v7 + 32);
        if (v11 + 1 < v22)
        {
          v23 = ~v11 + v22;
          v24 = (double *)(*(_QWORD *)(v7 + 144) + 8 * v11 + 8);
          do
          {
            *v24 = v17 + *v24;
            ++v24;
            --v23;
          }
          while (v23);
        }
      }
      -[UISectionRowData updateSectionHeightWithDelta:section:updateFooterOffset:](v7, v6, 1, v17);

      v5 = v26;
    }
  }

}

- (double)floatingRectForHeaderInSection:(char)a3 visibleRect:(BOOL *)a4 heightCanBeGuessed:(CGFloat)a5 outIsFloating:(double)a6
{
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  int v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  double v27;
  unint64_t v28;
  double v29;
  CGFloat v30;
  double MinY;
  double v32;
  BOOL v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  double v42;
  double v43;
  uint64_t v44;
  _BOOL4 v45;
  double v46;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  double rect;
  CGFloat v52;
  CGFloat rect2;
  CGFloat rect2_8;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;

  if (!a1)
    return 0.0;
  v16 = -[UITableViewRowData heightForTableHeaderView](a1);
  v17 = -0.0;
  if ((*(_BYTE *)(a1 + 128) & 0x10) != 0)
    v17 = v16;
  v18 = a6 + v17;
  v19 = 0.0;
  if ((*(_BYTE *)(a1 + 128) & 0x10) != 0)
    v19 = v16;
  v20 = a8 - v19;
  v21 = -[UITableViewRowData hasHeaderForSection:](a1, a2);
  v22 = -[UITableViewRowData rectForHeaderInSection:heightCanBeGuessed:](a1, a2, a3);
  v24 = v23;
  v26 = v25;
  rect2 = a5;
  rect2_8 = v27;
  v28 = *(_QWORD *)(a1 + 120) - 1;
  v52 = v20;
  if (!v21)
    goto LABEL_8;
  v55.origin.x = a5;
  v55.origin.y = v18;
  v55.size.width = a7;
  v55.size.height = v20;
  v69.origin.x = v22;
  v69.origin.y = v24;
  v69.size.width = v26;
  v69.size.height = rect2_8;
  if (CGRectContainsRect(v55, v69))
  {
LABEL_8:
    v29 = v24;
    if (!a4)
      return v22;
    goto LABEL_23;
  }
  v56.origin.x = v22;
  v56.origin.y = v24;
  v56.size.width = v26;
  v56.size.height = rect2_8;
  v30 = v22;
  MinY = CGRectGetMinY(v56);
  v57.origin.x = a5;
  v57.origin.y = v18;
  rect = a7;
  v57.size.width = a7;
  v57.size.height = v20;
  v32 = 0.0;
  v33 = MinY < CGRectGetMinY(v57);
  v22 = v30;
  if (v33)
  {
    v58.origin.x = a5;
    v58.origin.y = v18;
    v58.size.width = rect;
    v58.size.height = v20;
    v34 = CGRectGetMinY(v58);
    v59.origin.x = v30;
    v59.origin.y = v24;
    v59.size.width = v26;
    v59.size.height = rect2_8;
    v32 = v34 - CGRectGetMinY(v59);
  }
  if (v28 > 1)
  {
    v36 = -[UITableViewRowData rectForFooterInSection:heightCanBeGuessed:](a1, a2, a3);
    v38 = v37;
    v40 = v39;
    v50 = v41;
    v62.origin.x = v22;
    v62.origin.y = v24;
    v62.size.width = v26;
    v62.size.height = rect2_8;
    v49 = v32 + CGRectGetMaxY(v62);
    v48 = v36;
    v63.origin.x = v36;
    v63.origin.y = v38;
    v63.size.width = v40;
    v63.size.height = v50;
    if (v49 > CGRectGetMinY(v63))
    {
      v64.origin.x = v22;
      v64.origin.y = v24;
      v64.size.width = v26;
      v64.size.height = rect2_8;
      v42 = v32 + CGRectGetMaxY(v64);
      v65.origin.x = v48;
      v65.size.width = v40;
      v65.origin.y = v38;
      v65.size.height = v50;
      v32 = v32 - (v42 - CGRectGetMinY(v65));
    }
  }
  else if (a2 + 1 < *(_QWORD *)(a1 + 64))
  {
    v60.origin.x = -[UITableViewRowData rectForHeaderInSection:heightCanBeGuessed:](a1, a2 + 1, 1);
    v35 = CGRectGetMinY(v60);
    v61.origin.x = rect2;
    v61.origin.y = v18;
    v61.size.width = rect;
    v61.size.height = v20;
    if (v35 <= CGRectGetMinY(v61))
      v32 = 0.0;
  }
  v43 = -0.0;
  if (v32 > 0.0)
    v43 = v32;
  v29 = v24 + v43;
  a7 = rect;
  if (a4)
  {
LABEL_23:
    if (v28 > 1)
    {
      *a4 = v24 != v29;
    }
    else
    {
      v44 = *(_QWORD *)(a1 + 120);
      if (a2 || v44 != 2)
      {
        v66.origin.x = v22;
        v66.origin.y = v29;
        v66.size.width = v26;
        v66.size.height = rect2_8;
        v46 = CGRectGetMinY(v66);
        v67.size.height = v52;
        v67.origin.x = rect2;
        v67.origin.y = v18;
        v67.size.width = a7;
        v45 = vabdd_f64(v46, CGRectGetMinY(v67)) <= 0.1;
      }
      else
      {
        v45 = 1;
      }
      *a4 = v45;
      if (v44 == 2 && v45)
      {
        v68.size.height = v52;
        v68.origin.x = rect2;
        v68.origin.y = v18;
        v68.size.width = a7;
        CGRectGetMinY(v68);
      }
    }
  }
  return v22;
}

- (uint64_t)hasHeaderForSection:(uint64_t)result
{
  uint64_t v3;
  uint64_t v4;
  double v5;
  void *v6;

  if (result)
  {
    v3 = result;
    if (a2 < 0 || *(_QWORD *)(result + 64) <= a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", sel_hasHeaderForSection_, v3, CFSTR("UITableViewRowData.m"), 1847, CFSTR("request for invalid section (%ld)"), a2);

    }
    v4 = *(_QWORD *)(*(_QWORD *)(v3 + 88) + 8 * a2);
    if (!*(_BYTE *)(v4 + 8))
      -[UISectionRowData refreshWithSection:tableView:tableViewRowData:](*(_QWORD *)(*(_QWORD *)(v3 + 88) + 8 * a2), a2, *(void **)(v3 + 8), v3);
    if (!*(_BYTE *)(v4 + 9))
      -[UITableViewRowData _ensureSectionOffsetIsValidForSection:](v3, a2);
    -[UISectionRowData headerSize](v4);
    return v5 > 0.0;
  }
  return result;
}

- (void)invalidateAllSectionOffsetsAndUpdatePadding
{
  uint64_t numSections;
  id *sectionRowData;

  if (a1)
  {
    -[UITableViewRowData _updateSectionRowDataArrayForNumSections:](a1, -[UITable_RowDataSource _numberOfSections](a1->_tableView, "_numberOfSections"));
    numSections = a1->_numSections;
    if (numSections >= 1)
    {
      sectionRowData = a1->_sectionRowData;
      do
      {
        if (*sectionRowData)
          *((_BYTE *)*sectionRowData + 9) = 0;
        ++sectionRowData;
        --numSections;
      }
      while (numSections);
    }
    -[UITableViewRowData _updateTopAndBottomPadding]((uint64_t)a1);
  }
}

- (double)heightForTable
{
  uint64_t v2;
  double v3;
  double v4;
  double v5;
  double v6;

  if (!a1)
    return 0.0;
  v2 = *(_QWORD *)(a1 + 64);
  if (v2 < 1)
  {
    v6 = *(double *)(a1 + 152);
    v5 = v6 + -[UITableViewRowData heightForTableHeaderView](a1);
  }
  else
  {
    -[UITableViewRowData rectForFooterInSection:heightCanBeGuessed:](a1, v2 - 1, 1);
    v5 = v3 + v4;
  }
  return v5 + -[UITableViewRowData heightForTableFooterView](a1) + *(double *)(a1 + 160);
}

- (double)heightForTableFooterView
{
  uint64_t v2;

  if (!a1)
    return 0.0;
  if ((*(_BYTE *)(a1 + 128) & 2) == 0
    && ((dyld_program_sdk_at_least() & 1) != 0
     || objc_msgSend(*(id *)(a1 + 8), "_shouldUseNewHeaderFooterBehavior")))
  {
    objc_msgSend(*(id *)(a1 + 8), "_heightForTableFooter");
    *(_QWORD *)(a1 + 104) = v2;
    *(_BYTE *)(a1 + 128) |= 2u;
  }
  return *(double *)(a1 + 104);
}

- (double)heightForTableHeaderViewHiding
{
  double v2;

  if (!a1)
    return 0.0;
  v2 = *(double *)(a1 + 112);
  if (v2 < 0.0)
  {
    if (objc_msgSend(*(id *)(a1 + 8), "_isTableHeaderAutohiding"))
      v2 = -[UITableViewRowData heightForTableHeaderView](a1);
  }
  return fmax(v2, 0.0);
}

- (double)rectForTableFooterView
{
  double v1;
  uint64_t v3;
  void *v4;
  void *v5;
  double v6;
  uint64_t v7;

  v1 = 0.0;
  if (a1)
  {
    if (objc_msgSend(*(id *)(a1 + 8), "_shouldUseNewHeaderFooterBehavior"))
    {
      v3 = *(_QWORD *)(a1 + 64);
      if (v3 < 1)
        -[UITableViewRowData rectForTableHeaderView](a1);
      else
        -[UITableViewRowData rectForFooterInSection:heightCanBeGuessed:](a1, v3 - 1, 1);
      -[UITableViewRowData heightForTableFooterView](a1);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 8), "_tableFooterView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      if (v4)
      {
        objc_msgSend(v4, "frame");
        v1 = v6;
      }
      else
      {
        v1 = *MEMORY[0x1E0C9D648];
      }
      v7 = *(_QWORD *)(a1 + 64);
      if (v7 < 1)
        -[UITableViewRowData rectForTableHeaderView](a1);
      else
        -[UITableViewRowData rectForFooterInSection:heightCanBeGuessed:](a1, v7 - 1, 1);

    }
  }
  return v1;
}

- (void)tableHeaderHeightDidChangeToHeight:(uint64_t)a1
{
  double v3;
  unint64_t v4;
  BOOL v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  int v10;
  uint64_t v11;

  if (a1)
  {
    v3 = *(double *)(a1 + 96);
    *(double *)(a1 + 96) = a2;
    v4 = objc_msgSend(*(id *)(a1 + 8), "_tableStyle");
    v5 = v4 > 0x10 || ((1 << v4) & 0x10006) == 0;
    v6 = v5 ? 0.0 : GroupedTableOffsetFromTop(*(void **)(a1 + 8), (void *)a1);
    *(double *)(a1 + 152) = v6;
    v7 = *(_QWORD *)(a1 + 64);
    if (v7 >= 1)
    {
      v8 = 0;
      v9 = *(double *)(a1 + 96) - v3;
      v10 = *(unsigned __int8 *)(a1 + 72);
      do
      {
        if (!v10)
        {
          v11 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8 * v8);
          *(double *)(v11 + 16) = v9 + *(double *)(v11 + 16);
        }
        ++v8;
      }
      while (v7 != v8);
    }
  }
}

- (void)setReorderedIndexPath:(uint64_t)a1
{
  id v4;
  int has_internal_diagnostics;
  uint64_t v6;
  id v7;
  void *v8;
  double v9;
  NSObject *v10;
  unint64_t v11;
  NSObject *v12;
  uint8_t v13[16];
  uint8_t buf[16];

  v4 = a2;
  if (a1)
  {
    has_internal_diagnostics = os_variant_has_internal_diagnostics();
    v6 = *(_QWORD *)(a1 + 192);
    if (has_internal_diagnostics)
    {
      if (v6)
      {
        __UIFaultDebugAssertLog();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_185066000, v10, OS_LOG_TYPE_FAULT, "Cannot set a reorderedIndexPath on the row data while a draggedIndexPath is already set.", buf, 2u);
        }

      }
    }
    else if (v6)
    {
      v11 = setReorderedIndexPath____s_category;
      if (!setReorderedIndexPath____s_category)
      {
        v11 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v11, (unint64_t *)&setReorderedIndexPath____s_category);
      }
      v12 = *(NSObject **)(v11 + 8);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_185066000, v12, OS_LOG_TYPE_ERROR, "Cannot set a reorderedIndexPath on the row data while a draggedIndexPath is already set.", v13, 2u);
      }
    }
    v7 = *(id *)(a1 + 184);
    if (v7 != v4)
    {
      if (v7)
        -[UITableViewRowData restoreReorderedRowWithHeight:atIndexPath:](a1, v7, *(double *)(a1 + 216));
      objc_storeStrong((id *)(a1 + 184), a2);
      v8 = *(void **)(a1 + 184);
      if (v8)
        v9 = -[UITableViewRowData removeReorderedRowWithHeight:atIndexPath:](a1, v8, *(double *)(a1 + 216));
      else
        v9 = 0.0;
      *(double *)(a1 + 216) = v9;
    }
  }

}

- (double)indexPathsForRowsInRect:(CGFloat)a3
{
  if (a1)
  {
    -[UITableViewRowData indexPathsForRowsInRect:extraHitSpaceBetweenRows:]((uint64_t)a1, a2, a3, a4, a5, a1[18]);
    a1 = (double *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)indexPathsForRowsInRect:(CGFloat)a3 extraHitSpaceBetweenRows:(CGFloat)a4
{
  void *v12;
  double MinY;
  double MaxY;
  int v15;
  CGFloat *p_left;
  CGFloat *p_right;
  CGFloat v18;
  uint64_t v19;
  uint64_t v20;
  CGFloat v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGFloat v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  void *v37;
  double v38;
  uint64_t v39;
  double v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  double v45;
  uint64_t v46;
  double v47;
  uint64_t v48;
  void *v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;

  if (!a1)
  {
    v12 = 0;
    return v12;
  }
  if (!*(_QWORD *)(a1 + 64))
  {
    v12 = (void *)MEMORY[0x1E0C9AA60];
    return v12;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v50.origin.x = -[UITableViewRowData rectForSection:](a1, 0);
  MinY = CGRectGetMinY(v50);
  v51.origin.x = -[UITableViewRowData rectForSection:](a1, *(_QWORD *)(a1 + 64) - 1);
  MaxY = CGRectGetMaxY(v51);
  v15 = dyld_program_sdk_at_least();
  p_left = (CGFloat *)(a1 + 40);
  p_right = (CGFloat *)(a1 + 56);
  if (!v15)
  {
    p_right = &UIEdgeInsetsZero.right;
    p_left = &UIEdgeInsetsZero.left;
  }
  v62.origin.x = *p_left;
  v62.size.width = *(double *)(a1 + 24) - (*p_left + *p_right);
  v62.size.height = MaxY - MinY;
  v52.origin.x = a2;
  v52.origin.y = a3;
  v52.size.width = a4;
  v52.size.height = a5;
  v62.origin.y = MinY;
  if (!CGRectIntersectsRect(v52, v62))
    return v12;
  v53.origin.x = a2;
  v53.origin.y = a3;
  v53.size.width = a4;
  v53.size.height = a5;
  if (!CGRectIsEmpty(v53))
    a5 = a5 + -1.0;
  v54.origin.x = a2;
  v54.origin.y = a3;
  v54.size.width = a4;
  v54.size.height = a5;
  v18 = CGRectGetMinY(v54);
  v19 = -[UITableViewRowData _sectionForPoint:beginningWithSection:numberOfSections:](a1, 0, *(_QWORD *)(a1 + 64), 0.0, v18);
  if (v19 == 0x7FFFFFFFFFFFFFFFLL)
    v20 = 0;
  else
    v20 = v19;
  v55.origin.x = a2;
  v55.origin.y = a3;
  v55.size.width = a4;
  v55.size.height = a5;
  v21 = CGRectGetMaxY(v55);
  v22 = -[UITableViewRowData _sectionForPoint:beginningWithSection:numberOfSections:](a1, v20, *(_QWORD *)(a1 + 64) - v20, 0.0, v21);
  if (v22 == 0x7FFFFFFFFFFFFFFFLL)
    v22 = *(_QWORD *)(a1 + 64) - 1;
  v23 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8 * v20);
  v56.origin.x = a2;
  v56.origin.y = a3;
  v56.size.width = a4;
  v56.size.height = a5;
  v24 = CGRectGetMinY(v56);
  if (!v23)
  {
    v25 = 0;
    v32 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8 * v22);
    if (v22 > v20)
      goto LABEL_22;
LABEL_41:
    v60.origin.x = a2;
    v60.origin.y = a3;
    v60.size.width = a4;
    v60.size.height = a5;
    v45 = CGRectGetMaxY(v60);
    v46 = -[UISectionRowData _rowForPoint:beginningWithRow:numberOfRows:extraHitSpaceBetweenRows:](v32, v25, *(_QWORD *)(v32 + 32) - v25, 0.0, v45, a6);
    if (v46 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v47 = _sectionFooterMinY(a1, v32);
      v61.origin.x = a2;
      v61.origin.y = a3;
      v61.size.width = a4;
      v61.size.height = a5;
      if (CGRectGetMaxY(v61) >= v47)
        v46 = *(_QWORD *)(v32 + 32) - 1;
      else
        v46 = -1;
    }
    if (v25 <= v46)
    {
      v48 = v46 + 1;
      do
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v25, v20);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObject:", v49);

        ++v25;
      }
      while (v48 != v25);
    }
    return v12;
  }
  v25 = -[UISectionRowData _rowForPoint:beginningWithRow:numberOfRows:extraHitSpaceBetweenRows:](v23, 0, *(_QWORD *)(v23 + 32), 0.0, v24, a6);
  if (v25 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (!*(_QWORD *)(v23 + 32))
    {
      if (v22 <= v20)
        return v12;
      v32 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8 * v22);
      v25 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_22;
    }
    v26 = -[UITableViewRowData offsetForSection:](a1, v23);
    v27 = *(double *)(v23 + 48);
    -[UISectionRowData headerSize](v23);
    v29 = v28;
    v30 = 0.0;
    if (v28 > 0.0)
      objc_msgSend(*(id *)(a1 + 8), "_sectionHeaderToFirstRowPadding", 0.0);
    v31 = v26 + v27 + v29 + v30;
    v57.origin.x = a2;
    v57.origin.y = a3;
    v57.size.width = a4;
    v57.size.height = a5;
    if (CGRectGetMinY(v57) <= v31)
      v25 = 0;
    else
      v25 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v32 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8 * v22);
  if (v22 <= v20)
  {
    if (v25 == 0x7FFFFFFFFFFFFFFFLL)
      return v12;
    goto LABEL_41;
  }
LABEL_22:
  while ((unint64_t)v25 < *(_QWORD *)(v23 + 32))
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v25, v20);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v33);

    ++v25;
  }
  v34 = v20 + 1;
  if (v34 < v22)
  {
    v35 = *(_QWORD *)(a1 + 88);
    do
    {
      if (*(_QWORD *)(*(_QWORD *)(v35 + 8 * v34) + 32))
      {
        v36 = 0;
        do
        {
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v36, v34);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v37);

          ++v36;
          v35 = *(_QWORD *)(a1 + 88);
        }
        while (v36 < *(_QWORD *)(*(_QWORD *)(v35 + 8 * v34) + 32));
      }
      ++v34;
    }
    while (v34 != v22);
  }
  v58.origin.x = a2;
  v58.origin.y = a3;
  v58.size.width = a4;
  v58.size.height = a5;
  v38 = CGRectGetMaxY(v58);
  if (v32)
  {
    v39 = -[UISectionRowData _rowForPoint:beginningWithRow:numberOfRows:extraHitSpaceBetweenRows:](v32, 0, *(_QWORD *)(v32 + 32), 0.0, v38, a6);
    if (v39 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v40 = _sectionFooterMinY(a1, v32);
      v59.origin.x = a2;
      v59.origin.y = a3;
      v59.size.width = a4;
      v59.size.height = a5;
      if (CGRectGetMaxY(v59) < v40)
        return v12;
      v39 = *(_QWORD *)(v32 + 32) - 1;
    }
    if (v39 < 0)
      return v12;
  }
  else
  {
    v39 = 0;
  }
  v41 = 0;
  v42 = v39 + 1;
  do
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v41, v22);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v43);

    ++v41;
  }
  while (v42 != v41);
  return v12;
}

- (uint64_t)sectionsInRect:(CGFloat)a3
{
  size_t *v5;
  uint64_t v6;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  double MinY;
  double MaxY;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  _BOOL4 v33;
  int v34;
  double v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  uint64_t v40;
  CGFloat v42;
  CGFloat v43;
  double v44;
  CGFloat v45;
  double MinX;
  double v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;

  if (!result)
    return result;
  v5 = (size_t *)result;
  v6 = *(_QWORD *)(result + 64);
  if (!v6)
    return 0;
  if (v6 == 1)
  {
    v54.origin.x = -[UITableViewRowData rectForSection:](result, 0);
    v54.origin.y = v11;
    v54.size.width = v12;
    v54.size.height = v13;
    v48.origin.x = a2;
    v48.origin.y = a3;
    v48.size.width = a4;
    v48.size.height = a5;
    CGRectIntersectsRect(v48, v54);
    return 0;
  }
  MinX = CGRectGetMinX(*(CGRect *)&a2);
  v49.origin.x = a2;
  v49.origin.y = a3;
  v49.size.width = a4;
  v49.size.height = a5;
  MinY = CGRectGetMinY(v49);
  v50.origin.x = a2;
  v50.origin.y = a3;
  v50.size.width = a4;
  v50.size.height = a5;
  v44 = CGRectGetMinX(v50);
  v51.origin.x = a2;
  v51.origin.y = a3;
  v51.size.width = a4;
  v51.size.height = a5;
  MaxY = CGRectGetMaxY(v51);
  if (a5 > 0.0)
    MaxY = MaxY + -0.01;
  v47 = MaxY;
  v16 = -[UITableViewRowData rectForSection:]((uint64_t)v5, 0);
  v42 = v17;
  v43 = v16;
  v19 = v18;
  v21 = v20;
  v22 = -[UITableViewRowData rectForSection:]((uint64_t)v5, v5[8] - 1);
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v45 = MinY;
  v29 = 0x7FFFFFFFFFFFFFFFLL;
  if (MinY >= v19)
  {
    v34 = 1;
  }
  else
  {
    v52.origin.x = a2;
    v52.origin.y = a3;
    v52.size.width = a4;
    v52.size.height = a5;
    v30 = v22;
    v55.origin.y = v19;
    v31 = v26;
    v55.size.width = v21;
    v32 = v28;
    v55.size.height = v42;
    v55.origin.x = v43;
    v33 = CGRectIntersectsRect(v52, v55);
    v28 = v32;
    v26 = v31;
    v22 = v30;
    v34 = !v33;
    if (v33)
      v29 = 0;
  }
  if (v47 > v24)
  {
    v53.origin.x = a2;
    v53.origin.y = a3;
    v53.size.width = a4;
    v53.size.height = a5;
    v35 = v24;
    if (CGRectIntersectsRect(v53, *(CGRect *)&v22))
    {
      v36 = v5[8] - 1;
      if (!v34)
        goto LABEL_25;
LABEL_18:
      v37 = -[UITableViewRowData _sectionForPoint:beginningWithSection:numberOfSections:]((uint64_t)v5, 0, v5[8], MinX, v45);
      v29 = 0x7FFFFFFFFFFFFFFFLL;
      if (v37 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v38 = v37;
        if (v5[15] - 1 > 1)
        {
          v29 = v37;
        }
        else
        {
          v39 = *(double *)(*(_QWORD *)(v5[11] + 8 * v37) + 48);
          v29 = v37;
          if (v39 > 0.0)
          {
            v40 = -[UITableViewRowData _sectionForPoint:beginningWithSection:numberOfSections:]((uint64_t)v5, 0, v5[8], MinX, v45 - v39);
            if (v40 == 0x7FFFFFFFFFFFFFFFLL)
              v29 = v38;
            else
              v29 = v40;
          }
        }
      }
      goto LABEL_25;
    }
  }
  v36 = 0x7FFFFFFFFFFFFFFFLL;
  if (v34)
    goto LABEL_18;
LABEL_25:
  if (v36 == 0x7FFFFFFFFFFFFFFFLL)
    v36 = -[UITableViewRowData _sectionForPoint:beginningWithSection:numberOfSections:]((uint64_t)v5, 0, v5[8], v44, v47);
  if (v29 == 0x7FFFFFFFFFFFFFFFLL || v36 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  else
    return v29;
}

- (uint64_t)_sectionForPoint:(size_t)a3 beginningWithSection:(double)a4 numberOfSections:(CGFloat)a5
{
  const void *v9;
  void *v10;
  _QWORD __compar[5];
  __int128 v13;
  __int128 __key;
  CGRect v15;
  CGRect v16;

  *(double *)&__key = a4;
  *((CGFloat *)&__key + 1) = a5;
  if (!*(_QWORD *)(a1 + 64))
    return 0x7FFFFFFFFFFFFFFFLL;
  v15.origin.x = -[UITableViewRowData rectForSection:](a1, a2);
  if (a5 < CGRectGetMinY(v15))
    return 0x7FFFFFFFFFFFFFFFLL;
  v16.origin.x = -[UITableViewRowData rectForSection:](a1, a2 + a3 - 1);
  if (a5 > CGRectGetMaxY(v16))
    return 0x7FFFFFFFFFFFFFFFLL;
  v9 = (const void *)(*(_QWORD *)(a1 + 88) + 8 * a2);
  __compar[0] = MEMORY[0x1E0C809B0];
  __compar[1] = 3221225472;
  __compar[2] = __77__UITableViewRowData__sectionForPoint_beginningWithSection_numberOfSections___block_invoke;
  __compar[3] = &unk_1E16E4198;
  __compar[4] = a1;
  v13 = __key;
  v10 = bsearch_b(&__key, v9, a3, 8uLL, __compar);
  if (v10)
    return ((uint64_t)v10 - *(_QWORD *)(a1 + 88)) >> 3;
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (double)rectForTable
{
  double x;
  double v3;
  CGFloat y;
  double v5;
  CGFloat width;
  double v7;
  CGFloat height;
  uint64_t v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  void *v13;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  if (!a1)
    return 0.0;
  if (objc_msgSend(*(id *)(a1 + 8), "_shouldUseNewHeaderFooterBehavior"))
  {
    -[UITableViewRowData rectForTableFooterView](a1);
    return 0.0;
  }
  else
  {
    x = -[UITableViewRowData rectForTableHeaderView](a1);
    y = v3;
    width = v5;
    height = v7;
    if (*(uint64_t *)(a1 + 64) >= 1)
    {
      v9 = 0;
      do
      {
        v17.origin.x = -[UITableViewRowData rectForSection:](a1, v9);
        v17.origin.y = v10;
        v17.size.width = v11;
        v17.size.height = v12;
        v15.origin.x = x;
        v15.origin.y = y;
        v15.size.width = width;
        v15.size.height = height;
        v16 = CGRectUnion(v15, v17);
        x = v16.origin.x;
        y = v16.origin.y;
        width = v16.size.width;
        height = v16.size.height;
        ++v9;
      }
      while (v9 < *(_QWORD *)(a1 + 64));
    }
    objc_msgSend(*(id *)(a1 + 8), "_tableFooterView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      -[UITableViewRowData heightForTableFooterView](a1);
  }
  return x;
}

- (double)rectForSection:(uint64_t)a1
{
  uint64_t v4;
  void *v6;

  if (a1)
  {
    if (a2 < 0 || *(_QWORD *)(a1 + 64) <= a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", sel_rectForSection_, a1, CFSTR("UITableViewRowData.m"), 2152, CFSTR("request for rect of invalid section (%ld)"), a2);

    }
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8 * a2);
    if (!*(_BYTE *)(v4 + 8))
      -[UISectionRowData refreshWithSection:tableView:tableViewRowData:](*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8 * a2), a2, *(void **)(a1 + 8), a1);
    if (!*(_BYTE *)(v4 + 9))
      -[UITableViewRowData _ensureSectionOffsetIsValidForSection:](a1, a2);
    -[UITableViewRowData _ensureSectionOffsetIsValidForSection:](a1, a2);
    -[UITableViewRowData offsetForSection:](a1, v4);
  }
  return 0.0;
}

- (void)ensureAllSectionsAreValid
{
  uint64_t v2;
  _BYTE *v3;

  if (a1)
  {
    -[UITableViewRowData _updateSectionRowDataArrayForNumSections:](a1, -[UITable_RowDataSource _numberOfSections](a1->_tableView, "_numberOfSections"));
    if (a1->_numSections >= 1)
    {
      v2 = 0;
      do
      {
        v3 = a1->_sectionRowData[v2];
        if (!v3[8])
          -[UISectionRowData refreshWithSection:tableView:tableViewRowData:]((uint64_t)a1->_sectionRowData[v2], v2, a1->_tableView, (uint64_t)a1);
        if (!v3[9])
          -[UITableViewRowData _ensureSectionOffsetIsValidForSection:]((uint64_t)a1, v2);
        ++v2;
      }
      while (v2 < a1->_numSections);
    }
  }
}

- (uint64_t)headerAlignmentForSection:(uint64_t)result
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (result)
  {
    v3 = result;
    if (a2 < 0 || *(_QWORD *)(result + 64) <= a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", sel_headerAlignmentForSection_, v3, CFSTR("UITableViewRowData.m"), 2781, CFSTR("request for invalid section (%ld)"), a2);

    }
    v4 = *(_QWORD *)(*(_QWORD *)(v3 + 88) + 8 * a2);
    if (!*(_BYTE *)(v4 + 8))
    {
      -[UISectionRowData refreshWithSection:tableView:tableViewRowData:](v4, a2, *(void **)(v3 + 8), v3);
      v4 = *(_QWORD *)(*(_QWORD *)(v3 + 88) + 8 * a2);
    }
    if (!*(_BYTE *)(v4 + 9))
    {
      -[UITableViewRowData _ensureSectionOffsetIsValidForSection:](v3, a2);
      v4 = *(_QWORD *)(*(_QWORD *)(v3 + 88) + 8 * a2);
    }
    return *(_QWORD *)(v4 + 64);
  }
  return result;
}

- (uint64_t)footerAlignmentForSection:(uint64_t)result
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  if (result)
  {
    v3 = result;
    if (a2 < 0 || *(_QWORD *)(result + 64) <= a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", sel_footerAlignmentForSection_, v3, CFSTR("UITableViewRowData.m"), 2788, CFSTR("request for invalid section (%ld)"), a2);

    }
    v4 = *(_QWORD *)(*(_QWORD *)(v3 + 88) + 8 * a2);
    if (!*(_BYTE *)(v4 + 8))
    {
      -[UISectionRowData refreshWithSection:tableView:tableViewRowData:](v4, a2, *(void **)(v3 + 8), v3);
      v4 = *(_QWORD *)(*(_QWORD *)(v3 + 88) + 8 * a2);
    }
    if (!*(_BYTE *)(v4 + 9))
    {
      -[UITableViewRowData _ensureSectionOffsetIsValidForSection:](v3, a2);
      v4 = *(_QWORD *)(*(_QWORD *)(v3 + 88) + 8 * a2);
    }
    return *(_QWORD *)(v4 + 72);
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  _QWORD *v5;
  int64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v4 = -[UITableViewRowData initWithTableView:]([UITableViewRowData alloc], self->_tableView);
  v4[8] = self->_numSections;
  v4[10] = self->_sectionRowDataCapacity;
  v5 = malloc_type_calloc(self->_sectionRowDataCapacity, 8uLL, 0x80040B8603338uLL);
  if (self->_numSections >= 1)
  {
    v6 = 0;
    do
    {
      v7 = objc_msgSend(self->_sectionRowData[v6], "copy");
      v8 = (void *)v5[v6];
      v5[v6] = v7;

      ++v6;
    }
    while (v6 < self->_numSections);
  }
  v4[11] = v5;
  v4[17] = *(_QWORD *)&self->_minimumRowHeight;
  v4[18] = *(_QWORD *)&self->_rowSpacing;
  v4[3] = *(_QWORD *)&self->_tableViewWidth;
  v9 = *(_OWORD *)&self->_sectionContentInset.bottom;
  *((_OWORD *)v4 + 2) = *(_OWORD *)&self->_sectionContentInset.top;
  *((_OWORD *)v4 + 3) = v9;
  v4[12] = *(_QWORD *)&self->_tableHeaderHeight;
  v4[13] = *(_QWORD *)&self->_tableFooterHeight;
  v4[14] = *(_QWORD *)&self->_heightForTableHeaderViewHiding;
  v4[19] = *(_QWORD *)&self->_tableTopPadding;
  v4[20] = *(_QWORD *)&self->_tableBottomPadding;
  v4[21] = *(_QWORD *)&self->_tableSidePadding;
  v10 = -[NSIndexPath copy](self->_reorderedIndexPath, "copy");
  v11 = (void *)v4[23];
  v4[23] = v10;

  v12 = -[NSIndexPath copy](self->_draggedIndexPath, "copy");
  v13 = (void *)v4[24];
  v4[24] = v12;

  v4[28] = *(_QWORD *)&self->_draggedRowHeight;
  v14 = -[NSIndexPath copy](self->_gapIndexPath, "copy");
  v15 = (void *)v4[22];
  v4[22] = v14;

  v4[27] = *(_QWORD *)&self->_gapRowHeight;
  *((_DWORD *)v4 + 32) = self->_rowDataFlags;
  *((_BYTE *)v4 + 72) = self->_estimatesHeights;
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_draggedIndexPath, 0);
  objc_storeStrong((id *)&self->_reorderedIndexPath, 0);
  objc_storeStrong((id *)&self->_gapIndexPath, 0);
  objc_storeStrong((id *)&self->_headerFooterViewUsedForMeasurements, 0);
}

- (double)heightForSection:(uint64_t)a1
{
  _BYTE *v4;
  id v5;
  double v6;
  void *v8;

  if (!a1)
    return 0.0;
  if (a2 < 0 || *(_QWORD *)(a1 + 64) <= a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", sel_heightForSection_, a1, CFSTR("UITableViewRowData.m"), 1913, CFSTR("request for invalid section (%ld)"), a2);

  }
  v4 = *(id *)(*(_QWORD *)(a1 + 88) + 8 * a2);
  v5 = v4;
  if (!v4[8])
    -[UISectionRowData refreshWithSection:tableView:tableViewRowData:]((uint64_t)v4, a2, *(void **)(a1 + 8), a1);
  if (!*((_BYTE *)v5 + 9))
    -[UITableViewRowData _ensureSectionOffsetIsValidForSection:](a1, a2);
  v6 = *((double *)v5 + 5);

  return v6;
}

- (double)offsetForHeaderInSection:(uint64_t)a1
{
  void *v5;

  if (!a1)
    return 0.0;
  if (a2 < 0 || *(_QWORD *)(a1 + 64) <= a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", sel_offsetForHeaderInSection_, a1, CFSTR("UITableViewRowData.m"), 2169, CFSTR("request for offset of header in invalid section (%ld)"), a2);

  }
  return *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8 * a2) + 48);
}

- (void)dealloc
{
  int64_t v3;
  id *sectionRowData;
  id v5;
  id *v6;
  objc_super v7;

  if (self->_numSections >= 1)
  {
    v3 = 0;
    do
    {
      sectionRowData = self->_sectionRowData;
      v5 = sectionRowData[v3];
      sectionRowData[v3] = 0;

      ++v3;
    }
    while (v3 < self->_numSections);
  }
  v6 = self->_sectionRowData;
  if (v6)
    free(v6);
  v7.receiver = self;
  v7.super_class = (Class)UITableViewRowData;
  -[UITableViewRowData dealloc](&v7, sel_dealloc);
}

- (double)fullContentWidth
{
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  char v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;

  if (!a1)
    return 0.0;
  objc_msgSend(*(id *)(a1 + 8), "_sectionHeaderContentInsets");
  v3 = v2;
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 8), "_constants");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 8), "_constants");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "headerFooterOffsetFromContentInsetForTableView:", *(_QWORD *)(a1 + 8));
    v10 = v9;
    v12 = v11;

    v3 = v3 + v10;
    v5 = v5 + v12;
  }
  return *(double *)(a1 + 24) - (v5 + v3);
}

- (uint64_t)invalidateSection:(uint64_t)result
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (result)
  {
    v2 = *(_QWORD *)(result + 88);
    v3 = *(_QWORD *)(v2 + 8 * a2);
    if (v3)
      *(_WORD *)(v3 + 8) = 0;
    v4 = *(_QWORD *)(result + 64);
    if (a2 + 1 < v4)
    {
      v5 = ~a2 + v4;
      v6 = v2 + 8 * a2 + 8;
      do
      {
        if (*(_QWORD *)v6)
          *(_BYTE *)(*(_QWORD *)v6 + 9) = 0;
        v6 += 8;
        --v5;
      }
      while (v5);
    }
  }
  return result;
}

- (id)targetIndexPathForPoint:(CGFloat)a3 adjustedForGap:(CGFloat)a4
{
  double v8;
  double v9;
  uint64_t v10;
  CGFloat v11;
  CGFloat v12;
  double v13;
  uint64_t v14;
  double v15;
  void *v16;
  CGFloat v18;
  CGFloat v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  float v23;
  double v24;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  uint64_t v31;
  CGPoint v32;
  CGPoint v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  if (a1)
  {
    v8 = *(double *)(a1 + 152);
    v9 = -[UITableViewRowData heightForTableHeaderView](a1);
    if (*(uint64_t *)(a1 + 64) >= 1)
    {
      v10 = 0;
      v11 = *MEMORY[0x1E0C9D648];
      v12 = *(double *)(a1 + 24);
      v13 = v8 + v9;
      while (1)
      {
        v14 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8 * v10);
        v15 = *(double *)(v14 + 40);
        v34.origin.x = v11;
        v34.origin.y = v13;
        v34.size.width = v12;
        v34.size.height = v15;
        v32.x = a3;
        v32.y = a4;
        if (CGRectContainsPoint(v34, v32))
          break;
        v35.origin.x = v11;
        v35.origin.y = v13;
        v35.size.width = v12;
        v35.size.height = v15;
        if (CGRectGetMaxY(v35) <= a4)
        {
          v13 = v13 + v15;
          if (++v10 < *(_QWORD *)(a1 + 64))
            continue;
        }
        goto LABEL_7;
      }
      v18 = v13 + *(double *)(v14 + 48);
      v36.size.width = -[UISectionRowData headerSize](v14);
      v36.size.height = v19;
      v36.origin.x = v11;
      v36.origin.y = v18;
      v33.x = a3;
      v33.y = a4;
      if (CGRectContainsPoint(v36, v33))
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, v10);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        return v16;
      }
      v20 = *(_QWORD *)(v14 + 32);
      if (v20 < 1)
      {
LABEL_20:
        v26 = -[UITableViewRowData numberOfRowsInSection:](a1, v10);
        -[UITableViewRowData temporarilyDeletedIndexPathBeingReordered]((_QWORD *)a1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v27;
        if (v27)
          v26 -= objc_msgSend(v27, "section") == v10;
      }
      else
      {
        v21 = 0;
        while (1)
        {
          v22 = v13 + -[UISectionRowData offsetForRow:adjustedForGap:](v14, v21, a2);
          v23 = *(float *)(*(_QWORD *)(v14 + 136) + 4 * v21);
          if (v23 < -1.0)
            v23 = -v23;
          v24 = v23;
          v37.origin.x = v11;
          v37.origin.y = v22;
          v37.size.width = v12;
          v37.size.height = v24;
          if (a4 <= CGRectGetMaxY(v37))
            break;
          v38.origin.x = v11;
          v38.origin.y = v22;
          v38.size.width = v12;
          v38.size.height = v24;
          ++v21;
          if (CGRectGetMaxY(v38) > a4 || v21 >= v20)
            goto LABEL_20;
        }
        v29 = *(id *)(a1 + 192);
        v28 = v29;
        v26 = v21;
        if (v29)
        {
          v26 = v21;
          if (objc_msgSend(v29, "section") == v10)
          {
            if (v21 < objc_msgSend(v28, "row"))
              v26 = v21;
            else
              v26 = v21 + 1;
          }
        }
        if (v20 - 1 == v21)
        {
          v39.origin.x = v11;
          v39.origin.y = v22;
          v39.size.width = v12;
          v39.size.height = v24;
          if (a4 >= CGRectGetMaxY(v39) + v24 * -0.2 && (!v28 || objc_msgSend(v28, "section") != v10))
          {
            v30 = (void *)MEMORY[0x1E0CB36B0];
            v31 = v26 + 1;
            goto LABEL_32;
          }
        }
      }
      v30 = (void *)MEMORY[0x1E0CB36B0];
      v31 = v26;
LABEL_32:
      objc_msgSend(v30, "indexPathForRow:inSection:", v31, v10);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      return v16;
    }
  }
LABEL_7:
  v16 = 0;
  return v16;
}

- (uint64_t)dropLocationForPoint:(double)a3 atIndexPath:(CGFloat)a4 withInsets:(double)a5
{
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  double v24;
  double v25;
  float v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGRect v33;
  CGRect v34;

  v14 = a2;
  v15 = v14;
  if (a1)
  {
    v16 = objc_msgSend(v14, "section");
    v17 = objc_msgSend(v15, "row");
    if (v16 < *(_QWORD *)(a1 + 64))
    {
      v18 = v17;
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8 * v16);
      v20 = *(id *)(a1 + 192);
      v21 = v20;
      v22 = *(_QWORD *)(v19 + 32);
      if (v20)
      {
        if (v16 == objc_msgSend(v20, "section"))
          v23 = v22 + 1;
        else
          v23 = v22;
        if (v18 >= v23)
          goto LABEL_19;
        if (v16 == objc_msgSend(v21, "section"))
          v18 -= (uint64_t)v18 > objc_msgSend(v21, "row");
      }
      else if (v18 >= v22)
      {
        goto LABEL_19;
      }
      if (!*(_BYTE *)(v19 + 8))
        -[UISectionRowData refreshWithSection:tableView:tableViewRowData:](v19, v16, *(void **)(a1 + 8), a1);
      if (!*(_BYTE *)(v19 + 9))
        -[UITableViewRowData _ensureSectionOffsetIsValidForSection:](a1, v16);
      v24 = -[UITableViewRowData offsetForSection:](a1, v19);
      v25 = -[UISectionRowData offsetForRow:adjustedForGap:](v19, v18, 1);
      v26 = *(float *)(*(_QWORD *)(v19 + 136) + 4 * v18);
      if (v26 < -1.0)
        v26 = -v26;
      v27 = v24 + v25;
      v28 = a6 + *MEMORY[0x1E0C9D648];
      v29 = a5 + v27;
      v30 = *(double *)(a1 + 24) - (a6 + a8);
      v31 = v26 - (a5 + a7);
      v33.origin.x = v28;
      v33.origin.y = v29;
      v33.size.width = v30;
      v33.size.height = v31;
      if (a4 >= CGRectGetMinY(v33))
      {
        v34.origin.x = v28;
        v34.origin.y = v29;
        v34.size.width = v30;
        v34.size.height = v31;
        a1 = a4 > CGRectGetMaxY(v34);
        goto LABEL_21;
      }
LABEL_19:
      a1 = -1;
LABEL_21:

      goto LABEL_22;
    }
    a1 = -1;
  }
LABEL_22:

  return a1;
}

- (void)addGapAtIndexPath:(uint64_t)a1
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  void *v13;
  id v14;

  v4 = a2;
  if (a1)
  {
    v14 = v4;
    v5 = objc_msgSend(v4, "section");
    v6 = v5;
    if (v5 < 0 || v5 >= *(_QWORD *)(a1 + 64))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", sel_addGapAtIndexPath_, a1, CFSTR("UITableViewRowData.m"), 1522, CFSTR("request to add gap at invalid section (%ld)"), v6);

    }
    v7 = objc_msgSend(v14, "row");
    v8 = *(double *)(a1 + 216) + *(double *)(a1 + 144);
    -[UISectionRowData addOffset:fromRow:](*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8 * v6), v7, v8);
    v9 = v6 + 1;
    v10 = *(_QWORD *)(a1 + 64);
    if (v10 > v6 + 1)
    {
      v11 = *(unsigned __int8 *)(a1 + 72);
      do
      {
        if (!v11)
        {
          v12 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8 * v9);
          *(double *)(v12 + 16) = v8 + *(double *)(v12 + 16);
        }
        ++v9;
      }
      while (v10 != v9);
    }
    objc_msgSend(*(id *)(a1 + 8), "_coalesceContentSizeUpdateWithDelta:", v8);
    objc_storeStrong((id *)(a1 + 176), a2);
    v4 = v14;
  }

}

- (void)removeGap
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  if (a1)
  {
    v2 = *(id *)(a1 + 176);
    if (v2)
    {
      v13 = v2;
      v3 = objc_msgSend(v2, "section");
      v4 = v3;
      if (v3 < 0 || v3 >= *(_QWORD *)(a1 + 64))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", sel_removeGap, a1, CFSTR("UITableViewRowData.m"), 1543, CFSTR("request to remove gap at invalid section (%ld)"), v4);

      }
      v5 = objc_msgSend(v13, "row");
      v6 = *(double *)(a1 + 216) + *(double *)(a1 + 144);
      -[UISectionRowData addOffset:fromRow:](*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8 * v4), v5, -v6);
      v7 = v4 + 1;
      v8 = *(_QWORD *)(a1 + 64);
      if (v8 > v4 + 1)
      {
        v9 = *(unsigned __int8 *)(a1 + 72);
        do
        {
          if (!v9)
          {
            v10 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8 * v7);
            *(double *)(v10 + 16) = *(double *)(v10 + 16) - v6;
          }
          ++v7;
        }
        while (v8 != v7);
      }
      objc_msgSend(*(id *)(a1 + 8), "_coalesceContentSizeUpdateWithDelta:", -v6);
      v11 = *(void **)(a1 + 176);
      *(_QWORD *)(a1 + 176) = 0;

      v2 = v13;
    }

  }
}

- (void)restoreReorderedRowWithHeight:(double)a3 atIndexPath:
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v5 = a2;
  if (a1)
  {
    v15 = v5;
    v6 = objc_msgSend(v5, "section");
    v7 = v6;
    if (v6 < 0 || v6 >= *(_QWORD *)(a1 + 64))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", sel_restoreReorderedRowWithHeight_atIndexPath_, a1, CFSTR("UITableViewRowData.m"), 1564, CFSTR("request to restore reordered row in invalid section (%ld)"), v7);

    }
    -[UISectionRowData insertRowAtIndex:inSection:rowHeight:tableViewRowData:](*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8 * v7), objc_msgSend(v15, "row"), v7, a1, a3);
    v8 = *(double *)(a1 + 144) + a3;
    v9 = *(_QWORD *)(a1 + 64);
    if (v9 > v7 + 1)
    {
      v10 = *(unsigned __int8 *)(a1 + 72);
      v11 = ~v7 + v9;
      v12 = *(_QWORD *)(a1 + 88) + 8 * v7 + 8;
      do
      {
        v13 = *(_QWORD *)v12;
        ++*(_QWORD *)(*(_QWORD *)v12 + 24);
        if (!v10)
          *(double *)(v13 + 16) = v8 + *(double *)(v13 + 16);
        v12 += 8;
        --v11;
      }
      while (v11);
    }
    objc_msgSend(*(id *)(a1 + 8), "_coalesceContentSizeUpdateWithDelta:", v8);
    v5 = v15;
  }

}

- (double)removeReorderedRowWithHeight:(double)a3 atIndexPath:
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v20;

  v5 = a2;
  v6 = v5;
  if (a1)
  {
    v7 = objc_msgSend(v5, "section");
    v8 = v7;
    if (v7 < 0 || v7 >= *(_QWORD *)(a1 + 64))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", sel_removeReorderedRowWithHeight_atIndexPath_, a1, CFSTR("UITableViewRowData.m"), 1576, CFSTR("request to remove reordered row in invalid section (%ld)"), v8);

    }
    v9 = objc_msgSend(v6, "row");
    v11 = *(_QWORD *)(a1 + 88);
    v12 = *(_QWORD *)(v11 + 8 * v8);
    if (a3 == 0.0)
    {
      v10 = -[UISectionRowData heightForRow:inSection:canGuess:](*(_QWORD *)(v11 + 8 * v8), v9, v8, 0);
      a3 = v10;
    }
    -[UISectionRowData deleteRowAtIndex:](v12, v9, v10);
    v13 = a3 + *(double *)(a1 + 144);
    v14 = *(_QWORD *)(a1 + 64);
    if (v14 > v8 + 1)
    {
      v15 = *(unsigned __int8 *)(a1 + 72);
      v16 = ~v8 + v14;
      v17 = *(_QWORD *)(a1 + 88) + 8 * v8 + 8;
      do
      {
        v18 = *(_QWORD *)v17;
        --*(_QWORD *)(*(_QWORD *)v17 + 24);
        if (!v15)
          *(double *)(v18 + 16) = *(double *)(v18 + 16) - v13;
        v17 += 8;
        --v16;
      }
      while (v16);
    }
    objc_msgSend(*(id *)(a1 + 8), "_coalesceContentSizeUpdateWithDelta:", -v13);
  }
  else
  {
    a3 = 0.0;
  }

  return a3;
}

- (void)moveRowAtIndexPathFrom:(void *)a3 toIndexPath:
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  id v20;

  v20 = a2;
  v5 = a3;
  if (a1 && (objc_msgSend(v20, "isEqual:", v5) & 1) == 0)
  {
    v6 = objc_msgSend(v20, "row");
    v7 = objc_msgSend(v20, "section");
    v8 = objc_msgSend(v5, "row");
    v9 = objc_msgSend(v5, "section");
    v10 = -[UITableViewRowData heightForRow:inSection:canGuess:adjustForReorderedRow:](a1, v6, v7, 1, 1);
    -[UISectionRowData deleteRowAtIndex:](*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8 * v7), v6, v10);
    -[UISectionRowData insertRowAtIndex:inSection:rowHeight:tableViewRowData:](*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8 * v9), v8, v9, a1, v10);
    v11 = v10 + *(double *)(a1 + 144);
    if (v7 <= v9)
    {
      if (v9 > v7)
      {
        v16 = v7 + 1;
        v17 = *(_QWORD *)(a1 + 88);
        v18 = *(unsigned __int8 *)(a1 + 72);
        do
        {
          v19 = *(_QWORD *)(v17 + 8 * v16);
          --*(_QWORD *)(v19 + 24);
          if (!v18)
            *(double *)(v19 + 16) = *(double *)(v19 + 16) - v11;
          ++v16;
        }
        while (v16 < v9 + 1);
      }
    }
    else
    {
      v12 = v9 + 1;
      v13 = *(_QWORD *)(a1 + 88);
      v14 = *(unsigned __int8 *)(a1 + 72);
      do
      {
        v15 = *(_QWORD *)(v13 + 8 * v12);
        ++*(_QWORD *)(v15 + 24);
        if (!v14)
          *(double *)(v15 + 16) = v11 + *(double *)(v15 + 16);
        ++v12;
      }
      while (v12 < v7 + 1);
    }
  }

}

- (void)setDraggedIndexPath:(uint64_t)a1
{
  id v4;
  id v5;
  void *v6;
  double v7;
  id v8;

  v4 = a2;
  if (a1)
  {
    v5 = *(id *)(a1 + 192);
    if (v5 != v4)
    {
      v8 = v4;
      if (v5)
        -[UITableViewRowData restoreReorderedRowWithHeight:atIndexPath:](a1, v5, *(double *)(a1 + 224));
      objc_storeStrong((id *)(a1 + 192), a2);
      v6 = *(void **)(a1 + 192);
      if (v6)
        v7 = -[UITableViewRowData removeReorderedRowWithHeight:atIndexPath:](a1, v6, *(double *)(a1 + 224));
      else
        v7 = 0.0;
      v4 = v8;
      *(double *)(a1 + 224) = v7;
    }
  }

}

- (void)addDropTargetGapAtIndexPath:(uint64_t)a1
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v3 = a2;
  if (a1)
  {
    v17 = v3;
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", sel_addDropTargetGapAtIndexPath_, a1, CFSTR("UITableViewRowData.m"), 1729, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath != nil"));

    }
    if (*(_QWORD *)(a1 + 176))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", sel_addDropTargetGapAtIndexPath_, a1, CFSTR("UITableViewRowData.m"), 1730, CFSTR("UITableView internal inconsistency: attempted to add a drop target gap when one already exists"));

    }
    v4 = v17;
    if (!v17)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", sel__dropTargetGapHeightForIndexPath_, a1, CFSTR("UITableViewRowData.m"), 1687, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath != nil"));

    }
    if (*(_QWORD *)(a1 + 192))
    {
      v5 = *(_QWORD *)(a1 + 224);
LABEL_22:

      *(_QWORD *)(a1 + 216) = v5;
      -[UITableViewRowData addGapAtIndexPath:](a1, v4);
      v3 = v17;
      goto LABEL_23;
    }
    v6 = objc_msgSend(v4, "section");
    v7 = objc_msgSend(v4, "row");
    if (v6 >= *(_QWORD *)(a1 + 64))
      goto LABEL_16;
    v8 = v7;
    v9 = -[UITableViewRowData numberOfRowsInSection:](a1, v6);
    if (v9 < 1)
      goto LABEL_16;
    if (v8 >= v9)
    {
      if (v8 != v9)
        goto LABEL_16;
      --v8;
    }
    v10 = -[UITableViewRowData heightForRow:inSection:canGuess:adjustForReorderedRow:](a1, v8, v6, 1, 1);
    if (v10 != 0.0)
    {
LABEL_20:
      v5 = *(_QWORD *)&v10;
      goto LABEL_22;
    }
LABEL_16:
    objc_msgSend(*(id *)(a1 + 8), "rowHeight");
    v11 = *(void **)(a1 + 8);
    if (v12 <= 0.0)
    {
      objc_msgSend(v11, "estimatedRowHeight");
      if (v13 <= 0.0)
      {
        v5 = 0x4046000000000000;
        goto LABEL_22;
      }
      objc_msgSend(*(id *)(a1 + 8), "estimatedRowHeight");
    }
    else
    {
      objc_msgSend(v11, "rowHeight");
    }
    goto LABEL_20;
  }
LABEL_23:

}

- (void)moveDropTargetGapToIndexPath:(uint64_t)a1
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v3 = a2;
  if (a1)
  {
    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", sel_moveDropTargetGapToIndexPath_, a1, CFSTR("UITableViewRowData.m"), 1739, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("indexPath != nil"));

      v3 = 0;
    }
    v4 = *(id *)(a1 + 176);
    if (!v4)
    {
      v8 = v3;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", sel_moveDropTargetGapToIndexPath_, a1, CFSTR("UITableViewRowData.m"), 1740, CFSTR("UITableView internal inconsistency: attempted to move a drop target gap without one being added first"));

      v3 = v8;
      v4 = *(id *)(a1 + 176);
    }
    if (v4 != v3)
    {
      v7 = v3;
      -[UITableViewRowData removeGap](a1);
      *(_QWORD *)(a1 + 216) = 0;
      -[UITableViewRowData addDropTargetGapAtIndexPath:](a1, v7);
      v3 = v7;
    }
  }

}

- (id)_indexPathsBelowIndexPath:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;

  v3 = a2;
  if (a1)
  {
    v4 = (void *)objc_opt_new();
    v5 = v3;
    if (objc_msgSend(v5, "section") == 0x7FFFFFFFFFFFFFFFLL)
    {
      v6 = v5;
    }
    else
    {
      do
      {
        objc_msgSend(v4, "addObject:", v5);
        -[UITableViewRowData _nextIndexPathOrSectionHeader:](a1, v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        v5 = v6;
      }
      while (objc_msgSend(v6, "section") != 0x7FFFFFFFFFFFFFFFLL);
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_nextIndexPathOrSectionHeader:(uint64_t)a1
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = 0x7FFFFFFFFFFFFFFFLL;
  v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (objc_msgSend(a2, "section") != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (objc_msgSend(a2, "row") != 0x7FFFFFFFFFFFFFFFLL
      || -[UITableViewRowData numberOfRowsInSection:](a1, objc_msgSend(a2, "section")) < 1
      || (v5 = objc_msgSend(a2, "section"), v4 = 0, v5 == 0x7FFFFFFFFFFFFFFFLL))
    {
      if (objc_msgSend(a2, "row") == 0x7FFFFFFFFFFFFFFFLL
        || (v6 = objc_msgSend(a2, "row"),
            v6 >= -[UITableViewRowData numberOfRowsInSection:](a1, objc_msgSend(a2, "section")) - 1))
      {
        if (objc_msgSend(a2, "section") >= *(_QWORD *)(a1 + 64) - 1)
        {
          v5 = 0x7FFFFFFFFFFFFFFFLL;
        }
        else
        {
          v5 = objc_msgSend(a2, "section") + 1;
          if (-[UITableViewRowData numberOfRowsInSection:](a1, v5) > 0)
            v4 = 0;
        }
      }
      else
      {
        v5 = objc_msgSend(a2, "section");
        v4 = objc_msgSend(a2, "row") + 1;
      }
    }
  }
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v4, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setHeight:(double)a3 forHeaderInSection:
{
  uint64_t v6;
  double v7;
  float v8;
  float v9;
  double v10;
  double v11;
  float v12;
  double v13;
  uint64_t v14;
  double *v15;
  void *v16;

  if (a1)
  {
    if (*(_QWORD *)(a1 + 64) <= a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", sel_setHeight_forHeaderInSection_, a1, CFSTR("UITableViewRowData.m"), 1990, CFSTR("attempt to set height for header in section %ld when there are only %ld sections in the table"), a2, *(_QWORD *)(a1 + 64));

    }
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8 * a2);
    if (!*(_BYTE *)(v6 + 8))
      -[UISectionRowData refreshWithSection:tableView:tableViewRowData:](*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8 * a2), a2, *(void **)(a1 + 8), a1);
    if (!*(_BYTE *)(v6 + 9))
      -[UITableViewRowData _ensureSectionOffsetIsValidForSection:](a1, a2);
    -[UISectionRowData headerSize](v6);
    v8 = v7;
    *(float *)&v7 = a3;
    v9 = *(float *)&v7 - v8;
    if (v9 < 0.0)
      v9 = -v9;
    if (v9 > 0.00000011921)
    {
      v10 = fmax(a3, 0.00000011920929);
      v11 = *(double *)(v6 + 112);
      if (v11 < -1.0)
        v11 = -v11;
      v12 = v11;
      v13 = v10 - v12;
      *(double *)(v6 + 112) = v10;
      v14 = *(_QWORD *)(v6 + 32);
      if (*(_BYTE *)(*(_QWORD *)(v6 + 96) + 72))
      {
        if (v14)
          memset_pattern16(*(void **)(v6 + 144), &xmmword_1866792D0, 8 * v14);
      }
      else if (v14)
      {
        v15 = *(double **)(v6 + 144);
        do
        {
          *v15 = v13 + *v15;
          ++v15;
          --v14;
        }
        while (v14);
      }
      -[UISectionRowData updateSectionHeightWithDelta:section:updateFooterOffset:](v6, a2, 1, v13);
    }
  }
}

- (void)setHeight:(double)a3 forFooterInSection:
{
  uint64_t v6;
  double v7;
  float v8;
  float v9;
  float v10;
  double v11;
  void *v12;

  if (a1)
  {
    if (*(_QWORD *)(a1 + 64) <= a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", sel_setHeight_forFooterInSection_, a1, CFSTR("UITableViewRowData.m"), 2003, CFSTR("attempt to set height for footer in section %ld when there are only %ld sections in the table"), a2, *(_QWORD *)(a1 + 64));

    }
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8 * a2);
    if (!*(_BYTE *)(v6 + 8))
      -[UISectionRowData refreshWithSection:tableView:tableViewRowData:](*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8 * a2), a2, *(void **)(a1 + 8), a1);
    if (!*(_BYTE *)(v6 + 9))
      -[UITableViewRowData _ensureSectionOffsetIsValidForSection:](a1, a2);
    v7 = *(double *)(v6 + 120);
    if (v7 < -1.0)
      v7 = -v7;
    v8 = v7;
    v9 = a3;
    v10 = v9 - v8;
    if (v10 < 0.0)
      v10 = -v10;
    if (v10 > 0.00000011921)
    {
      v11 = fmax(a3, 0.00000011920929);
      *(double *)(v6 + 120) = v11;
      -[UISectionRowData updateSectionHeightWithDelta:section:updateFooterOffset:](v6, a2, 0, v11 - v8);
    }
  }
}

+ (int)sectionLocationForRow:(int64_t)a3 inSection:(int64_t)a4 numRows:(unint64_t)a5 gapIndexPath:(id)a6 rowSpacing:(double)a7
{
  return +[UISectionRowData sectionLocationForRow:inSection:numRows:gapIndexPath:rowSpacing:](a7, (uint64_t)UISectionRowData, a3, a4, a5, a6);
}

- (uint64_t)sectionLocationForReorderedRow:(uint64_t)a3 inSection:
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  if (result)
  {
    v5 = result;
    if (a3 < 0 || *(_QWORD *)(result + 64) <= a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", sel_sectionLocationForReorderedRow_inSection_, v5, CFSTR("UITableViewRowData.m"), 2048, CFSTR("request for invalid section (%ld)"), a3);

    }
    v6 = *(_QWORD *)(*(_QWORD *)(v5 + 88) + 8 * a3);
    if (!*(_BYTE *)(v6 + 8))
      -[UISectionRowData refreshWithSection:tableView:tableViewRowData:](*(_QWORD *)(*(_QWORD *)(v5 + 88) + 8 * a3), a3, *(void **)(v5 + 8), v5);
    if (!*(_BYTE *)(v6 + 9))
      -[UITableViewRowData _ensureSectionOffsetIsValidForSection:](v5, a3);
    v7 = *(_QWORD *)(v6 + 32);
    if (a2)
    {
      if (v7 == a2)
        return 3;
      else
        return 1;
    }
    else if (v7)
    {
      return 2;
    }
    else
    {
      return 4;
    }
  }
  return result;
}

- (double)floatingRectForFooterInSection:(char)a3 visibleRect:(BOOL *)a4 heightCanBeGuessed:(CGFloat)a5 outIsFloating:(CGFloat)a6
{
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  unint64_t v26;
  double v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  double v34;
  double MaxY;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  CGFloat v43;
  double v44;
  double v45;
  BOOL v46;
  void *v48;
  CGFloat v49;
  CGFloat v50;
  CGFloat v51;
  double rect;
  CGFloat v53;
  CGFloat v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;

  if (!a1)
    return 0.0;
  if (a2 < 0 || *(_QWORD *)(a1 + 64) <= a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", sel_hasFooterForSection_, a1, CFSTR("UITableViewRowData.m"), 1855, CFSTR("request for invalid section (%ld)"), a2);

  }
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8 * a2);
  if (!*(_BYTE *)(v16 + 8))
    -[UISectionRowData refreshWithSection:tableView:tableViewRowData:](*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8 * a2), a2, *(void **)(a1 + 8), a1);
  v54 = a5;
  if (!*(_BYTE *)(v16 + 9))
    -[UITableViewRowData _ensureSectionOffsetIsValidForSection:](a1, a2);
  v17 = *(double *)(v16 + 120);
  if (v17 >= -1.0)
    v18 = *(double *)(v16 + 120);
  else
    v18 = -v17;
  v20 = -[UITableViewRowData rectForFooterInSection:heightCanBeGuessed:](a1, a2, a3);
  v21 = v19;
  v23 = v22;
  v25 = v24;
  v26 = *(_QWORD *)(a1 + 120) - 1;
  v53 = a6;
  if (v18 <= 0.0)
  {
    v32 = a7;
    v33 = a8;
    v34 = v19;
    if (!a4)
      return v20;
    goto LABEL_27;
  }
  v55.origin.x = a5;
  v55.origin.y = a6;
  v55.size.width = a7;
  v55.size.height = a8;
  v27 = v20;
  v28 = a8;
  v29 = v21;
  v30 = v23;
  v31 = v25;
  if (CGRectContainsRect(v55, *(CGRect *)(&v21 - 1)))
  {
    v32 = a7;
    v33 = v28;
    v34 = v29;
    v21 = v29;
    if (!a4)
      return v20;
    goto LABEL_27;
  }
  v56.origin.x = v20;
  rect = v29;
  v56.origin.y = v29;
  v56.size.width = v23;
  v56.size.height = v25;
  MaxY = CGRectGetMaxY(v56);
  v57.origin.x = a5;
  v57.origin.y = a6;
  v32 = a7;
  v57.size.width = a7;
  v33 = v28;
  v57.size.height = v28;
  v36 = 0.0;
  if (MaxY > CGRectGetMaxY(v57))
  {
    v58.origin.x = v20;
    v58.origin.y = rect;
    v58.size.width = v23;
    v58.size.height = v25;
    v37 = CGRectGetMaxY(v58);
    v59.origin.y = v53;
    v59.origin.x = a5;
    v59.size.width = v32;
    v59.size.height = v33;
    v36 = v37 - CGRectGetMaxY(v59);
  }
  if (v26 > 1)
  {
    v39 = -[UITableViewRowData rectForHeaderInSection:heightCanBeGuessed:](a1, a2, a3);
    v50 = v41;
    v51 = v40;
    v43 = v42;
    v62.origin.x = v20;
    v62.origin.y = rect;
    v62.size.width = v23;
    v62.size.height = v25;
    v49 = CGRectGetMinY(v62) - v36;
    v63.origin.x = v39;
    v63.origin.y = v51;
    v63.size.width = v43;
    v63.size.height = v50;
    if (v49 < CGRectGetMaxY(v63))
    {
      v64.size.width = v43;
      v64.origin.x = v39;
      v64.origin.y = v51;
      v64.size.height = v50;
      v44 = CGRectGetMaxY(v64);
      v65.origin.x = v20;
      v65.origin.y = rect;
      v65.size.width = v23;
      v65.size.height = v25;
      v36 = v36 - (v44 - (CGRectGetMinY(v65) - v36));
    }
  }
  else if (a2 >= 1)
  {
    v60.origin.x = -[UITableViewRowData rectForFooterInSection:heightCanBeGuessed:](a1, a2 - 1, a3);
    v38 = CGRectGetMaxY(v60);
    v61.origin.y = v53;
    v61.origin.x = a5;
    v61.size.width = v32;
    v61.size.height = v33;
    if (v38 >= CGRectGetMaxY(v61))
      v36 = 0.0;
  }
  v21 = rect;
  v34 = rect - fmax(v36, 0.0);
  if (a4)
  {
LABEL_27:
    if (v26 > 1)
    {
      v46 = v21 != v34;
    }
    else
    {
      v66.origin.x = v20;
      v66.origin.y = v34;
      v66.size.width = v23;
      v66.size.height = v25;
      v45 = CGRectGetMaxY(v66);
      v67.origin.y = v53;
      v67.origin.x = v54;
      v67.size.width = v32;
      v67.size.height = v33;
      v46 = vabdd_f64(v45, CGRectGetMaxY(v67)) <= 0.1;
    }
    *a4 = v46;
  }
  return v20;
}

- (uint64_t)ensureHeightsFaultedInForScrollToIndexPath:(double)a3 boundsHeight:
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double MinY;
  double MaxY;
  double v18;
  double v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  double *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  id v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  double *v40;
  double *v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  CGRect v47;

  if (result)
  {
    v5 = result;
    if (objc_msgSend(a2, "section") == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", sel__assertValidIndexPath_allowEmptySection_, v5, CFSTR("UITableViewRowData.m"), 2904, CFSTR("Invalid indexPath"));

    }
    if (objc_msgSend(a2, "section") < 0 || objc_msgSend(a2, "section") >= *(_QWORD *)(v5 + 64))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", sel__assertValidIndexPath_allowEmptySection_, v5, CFSTR("UITableViewRowData.m"), 2905, CFSTR("Invalid indexPath"));

    }
    if (objc_msgSend(a2, "row") != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (objc_msgSend(a2, "row") < 0
        || (v6 = objc_msgSend(a2, "row"),
            v6 >= -[UITableViewRowData numberOfRowsInSection:](v5, objc_msgSend(a2, "section"))))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", sel__assertValidIndexPath_allowEmptySection_, v5, CFSTR("UITableViewRowData.m"), 2908, CFSTR("Invalid indexPath"));

      }
    }
    result = objc_msgSend(*(id *)(v5 + 8), "_estimatesHeights");
    if ((_DWORD)result)
    {
      if (objc_msgSend(a2, "row") == 0x7FFFFFFFFFFFFFFFLL)
        v8 = -[UITableViewRowData rectForHeaderInSection:heightCanBeGuessed:](v5, objc_msgSend(a2, "section"), 0);
      else
        v8 = -[UITableViewRowData rectForRow:inSection:heightCanBeGuessed:](v5, objc_msgSend(a2, "row"), objc_msgSend(a2, "section"), 0);
      v12 = v8;
      v13 = v9;
      v14 = v10;
      v15 = v11;
      MinY = CGRectGetMinY(*(CGRect *)&v8);
      v47.origin.x = v12;
      v47.origin.y = v13;
      v47.size.width = v14;
      v47.size.height = v15;
      MaxY = CGRectGetMaxY(v47);
      v18 = MaxY - a3;
      v19 = MinY + a3;
      v20 = a2;
      v21 = v20;
      v22 = 0;
      if (MaxY >= MinY + a3)
      {
        v23 = v20;
      }
      else
      {
        v23 = v20;
        do
        {
          v24 = v22;
          v22 = v23;

          -[UITableViewRowData _nextIndexPathOrSectionHeader:](v5, v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v23, "section") == 0x7FFFFFFFFFFFFFFFLL)
            break;
          v25 = objc_msgSend(v23, "section");
          if (v25 != objc_msgSend(v22, "section"))
          {
            v26 = (double *)*(id *)(*(_QWORD *)(v5 + 88) + 8 * objc_msgSend(v23, "section"));
            v27 = -[UITableViewRowData heightForHeaderInSection:canGuess:](v5, objc_msgSend(v23, "section"), 0);
            if (v26)
            {
              v28 = v26[14];
              if (v28 < -1.0)
                v28 = -v28;
              v29 = v26[6] + v28;
              if (v28 > 0.0)
              {
                objc_msgSend(*(id *)(*((_QWORD *)v26 + 12) + 8), "_sectionHeaderToFirstRowPadding");
                v29 = v29 + v30;
              }
            }
            else
            {
              v29 = 0.0;
            }
            MaxY = MaxY + v27 + v29;

          }
          if (objc_msgSend(v23, "row") != 0x7FFFFFFFFFFFFFFFLL)
            MaxY = MaxY
                 + -[UITableViewRowData heightForRow:inSection:canGuess:adjustForReorderedRow:](v5, objc_msgSend(v23, "row"), objc_msgSend(v23, "section"), 0, 1)+ *(double *)(v5 + 144);
          v31 = objc_msgSend(v23, "row");
          if (v31 == -[UITableViewRowData numberOfRowsInSection:](v5, objc_msgSend(v23, "section")) - 1
            || objc_msgSend(v23, "row") == 0x7FFFFFFFFFFFFFFFLL)
          {
            MaxY = MaxY + -[UITableViewRowData heightForFooterInSection:canGuess:](v5, objc_msgSend(v23, "section"), 0);
          }
        }
        while (MaxY < v19);
      }
      v32 = v21;

      if (MinY > v18)
      {
        while (1)
        {
          v33 = v22;
          v22 = v32;

          v34 = objc_msgSend(v22, "section");
          v35 = 0x7FFFFFFFFFFFFFFFLL;
          v36 = 0x7FFFFFFFFFFFFFFFLL;
          if (v34 == 0x7FFFFFFFFFFFFFFFLL)
            goto LABEL_43;
          if (objc_msgSend(v22, "row", 0x7FFFFFFFFFFFFFFFLL) != 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(v22, "row"))
            break;
          if (objc_msgSend(v22, "section") >= 1)
          {
            v35 = objc_msgSend(v22, "section") - 1;
            if (-[UITableViewRowData numberOfRowsInSection:](v5, v35) >= 1)
            {
              v37 = -[UITableViewRowData numberOfRowsInSection:](v5, v35);
              goto LABEL_41;
            }
          }
          v36 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_43:
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v36, v35);
          v32 = (id)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v32, "section") != 0x7FFFFFFFFFFFFFFFLL)
          {
            v38 = objc_msgSend(v32, "section");
            if (v38 != objc_msgSend(v22, "section"))
              MinY = MinY
                   - -[UITableViewRowData heightForFooterInSection:canGuess:](v5, objc_msgSend(v32, "section"), 0);
            if (objc_msgSend(v32, "row") != 0x7FFFFFFFFFFFFFFFLL)
            {
              v39 = MinY - *(double *)(v5 + 144);
              MinY = v39
                   - -[UITableViewRowData heightForRow:inSection:canGuess:adjustForReorderedRow:](v5, objc_msgSend(v32, "row"), objc_msgSend(v32, "section"), 0, 1);
            }
            if (!objc_msgSend(v32, "row") || objc_msgSend(v32, "row") == 0x7FFFFFFFFFFFFFFFLL)
            {
              v40 = (double *)*(id *)(*(_QWORD *)(v5 + 88) + 8 * objc_msgSend(v32, "section"));
              v41 = v40;
              if (v40)
              {
                v42 = v40[14];
                if (v42 < -1.0)
                  v42 = -v42;
                v43 = v40[6] + v42;
                if (v42 > 0.0)
                {
                  objc_msgSend(*(id *)(*((_QWORD *)v40 + 12) + 8), "_sectionHeaderToFirstRowPadding");
                  v43 = v43 + v44;
                }
              }
              else
              {
                v43 = 0.0;
              }
              MinY = MinY
                   - v43
                   - -[UITableViewRowData heightForHeaderInSection:canGuess:](v5, objc_msgSend(v32, "section"), 0);

            }
            if (MinY > v18)
              continue;
          }
          goto LABEL_59;
        }
        v35 = objc_msgSend(v22, "section");
        v37 = objc_msgSend(v22, "row");
LABEL_41:
        v36 = v37 - 1;
        goto LABEL_43;
      }
LABEL_59:

      return 1;
    }
  }
  return result;
}

- (id)description
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t numSections;
  void *v9;
  void *v10;
  void *v11;
  objc_super v13;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("{\n"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_numSections)
  {
    v4 = 0;
    do
    {
      v5 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(self->_sectionRowData[v4], "description");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", CFSTR("%@"), v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendString:", v7);

      numSections = self->_numSections;
      if (v4 < numSections - 1)
      {
        objc_msgSend(v3, "appendString:", CFSTR(", \n"));
        numSections = self->_numSections;
      }
      ++v4;
    }
    while (v4 < numSections);
  }
  objc_msgSend(v3, "appendString:", CFSTR("\n}"));
  v9 = (void *)MEMORY[0x1E0CB3940];
  v13.receiver = self;
  v13.super_class = (Class)UITableViewRowData;
  -[UITableViewRowData description](&v13, sel_description);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ num sections: %ld; capacity: %ld; minimum row height: %g; table view width: %g; table header height: %g; table footer height: %g; table top padding: %g; table bottom padding: %g; reordered index path: %@; dragged index path: %@; gap row height: %g; dragged row height: %g; section data: %@"),
    v10,
    self->_numSections,
    self->_sectionRowDataCapacity,
    *(_QWORD *)&self->_minimumRowHeight,
    *(_QWORD *)&self->_tableViewWidth,
    *(_QWORD *)&self->_tableHeaderHeight,
    *(_QWORD *)&self->_tableFooterHeight,
    *(_QWORD *)&self->_tableTopPadding,
    *(_QWORD *)&self->_tableBottomPadding,
    self->_reorderedIndexPath,
    self->_draggedIndexPath,
    *(_QWORD *)&self->_gapRowHeight,
    *(_QWORD *)&self->_draggedRowHeight,
    v3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
