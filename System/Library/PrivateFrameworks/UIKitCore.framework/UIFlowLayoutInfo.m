@implementation UIFlowLayoutInfo

void __32___UIFlowLayoutInfo_invalidate___block_invoke(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void __51___UIFlowLayoutInfo_setSizes_forItemsAtIndexPaths___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id WeakRetained;
  uint64_t v13;
  id v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _QWORD *v20;
  _QWORD *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t i;
  void *v27;
  CGFloat v28;
  CGFloat v29;
  double v30;
  double v31;
  unsigned __int8 *v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  double MinX;
  double v39;
  CGFloat MaxX;
  CGFloat MaxY;
  double v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  double MinY;
  CGFloat v48;
  id v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;

  v5 = (void *)MEMORY[0x1E0CB36B0];
  v6 = a2;
  v7 = objc_msgSend(a3, "integerValue");
  v8 = objc_msgSend(v6, "integerValue");

  objc_msgSend(v5, "indexPathForItem:inSection:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 104);
  WeakRetained = objc_loadWeakRetained((id *)(v10 + 120));
  objc_msgSend(v11, "objectAtIndex:", objc_msgSend(WeakRetained, "_sectionArrayIndexForIndexPath:", v9));
  v13 = objc_claimAutoreleasedReturnValue();

  v14 = v9;
  v49 = v14;
  if (v13)
  {
    v15 = objc_msgSend(v14, "item");
    if (v15 < *(_QWORD *)(v13 + 272) + *(_QWORD *)(v13 + 264))
    {
      v16 = v15;
      do
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v16, objc_msgSend(v49, "section"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[_UIFlowLayoutSection addInvalidatedIndexPath:](v13, (uint64_t)v17);

        ++v16;
      }
      while (v16 < *(_QWORD *)(v13 + 272) + *(_QWORD *)(v13 + 264));
    }
    objc_msgSend(*(id *)(v13 + 96), "objectAtIndexedSubscript:", objc_msgSend(v49, "item"));
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    if (v18)
    {
      v20 = objc_loadWeakRetained((id *)(v18 + 24));
      if (v20)
      {
        v21 = v20;
        v22 = objc_msgSend(*(id *)(v13 + 104), "indexOfObject:", v20);
        if (v22 >= 1)
        {
          objc_msgSend(*(id *)(v13 + 104), "objectAtIndexedSubscript:", v22 - 1);
          v23 = objc_claimAutoreleasedReturnValue();

          v24 = objc_msgSend(v49, "item");
          if (v23)
            v25 = *(void **)(v23 + 40);
          else
            v25 = 0;
          for (i = v24 - objc_msgSend(v25, "count"); i < objc_msgSend(v49, "item"); ++i)
          {
            objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", i, objc_msgSend(v49, "section"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            -[_UIFlowLayoutSection addInvalidatedIndexPath:](v13, (uint64_t)v27);

          }
          v21 = (_QWORD *)v23;
        }
        v29 = *(double *)(v13 + 16);
        v28 = *(double *)(v13 + 24);
        v30 = *(double *)(v13 + 32);
        v31 = *(double *)(v13 + 40);
        v32 = (unsigned __int8 *)objc_loadWeakRetained((id *)(v13 + 144));
        if (v32 && (v33 = v32[97], v32, v33))
        {
          if (v21)
          {
            v34 = v21[9];
            v35 = v21[10];
            v36 = v21[11];
            v37 = v21[12];
          }
          else
          {
            v35 = 0;
            v36 = 0;
            v37 = 0;
            v34 = 0;
          }
          MinX = CGRectGetMinX(*(CGRect *)&v34);
          v50.origin.x = v29;
          v50.origin.y = v28;
          v50.size.width = v30;
          v50.size.height = v31;
          v39 = MinX - CGRectGetMinX(v50);
          v51.origin.x = v29;
          v51.origin.y = v28;
          v51.size.width = v39;
          v51.size.height = v31;
          v30 = v30 - CGRectGetWidth(v51);
          v52.origin.x = v29;
          v52.origin.y = v28;
          v52.size.width = v39;
          v52.size.height = v31;
          MaxX = CGRectGetMaxX(v52);
          MaxY = v28;
          v42 = v31;
        }
        else
        {
          if (v21)
          {
            v43 = v21[9];
            v44 = v21[10];
            v45 = v21[11];
            v46 = v21[12];
          }
          else
          {
            v44 = 0;
            v45 = 0;
            v46 = 0;
            v43 = 0;
          }
          MinY = CGRectGetMinY(*(CGRect *)&v43);
          v53.origin.x = v29;
          v53.origin.y = v28;
          v53.size.width = v30;
          v53.size.height = v31;
          v48 = MinY - CGRectGetMinY(v53);
          v54.origin.x = v29;
          v54.origin.y = v28;
          v54.size.width = v30;
          v54.size.height = v48;
          v42 = v31 - CGRectGetHeight(v54);
          v55.origin.x = v29;
          v55.origin.y = v28;
          v55.size.width = v30;
          v55.size.height = v48;
          MaxY = CGRectGetMaxY(v55);
          MaxX = v29;
          v31 = v48;
          v39 = v30;
        }
        *(CGFloat *)(v13 + 16) = v29;
        *(CGFloat *)(v13 + 24) = v28;
        *(double *)(v13 + 32) = v39;
        *(double *)(v13 + 40) = v31;
        -[_UIFlowLayoutSection computeLayoutInRect:forSection:invalidating:invalidationContext:](v13, objc_msgSend(v49, "section"), 0, 0, MaxX, MaxY, v30, v42);

      }
    }

  }
}

void __48___UIFlowLayoutInfo_setSize_forItemAtIndexPath___block_invoke(uint64_t a1)
{
  unint64_t v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  id WeakRetained;
  id v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = _block_invoke_2___s_category;
  if (!_block_invoke_2___s_category)
  {
    v2 = __UILogCategoryGetNode("Warning", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
    atomic_store(v2, (unint64_t *)&_block_invoke_2___s_category);
  }
  v3 = *(NSObject **)(v2 + 8);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = (void *)MEMORY[0x1E0CB37E8];
    v5 = *(_QWORD *)(a1 + 40);
    v6 = v3;
    objc_msgSend(v4, "numberWithInteger:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
    v9 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 120));
    objc_msgSend(v9, "collectionView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412802;
    v12 = v7;
    v13 = 2112;
    v14 = WeakRetained;
    v15 = 2112;
    v16 = v10;
    _os_log_impl(&dword_185066000, v6, OS_LOG_TYPE_ERROR, "Warning: sizing information will be ignored since the section referenced %@ does not currently exist. layout=%@; c"
      "ollectionView=%@",
      (uint8_t *)&v11,
      0x20u);

  }
}

@end
